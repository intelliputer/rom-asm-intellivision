
        ORG     $5000
.HEADER:
        BIDECLE $991A           ; 5000  Ptr: MOB graphic images
        BIDECLE $5021           ; 5002  Ptr: EXEC timer table
        BIDECLE $5097           ; 5004  Ptr: Start of game
        BIDECLE $A03F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $A371           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0082           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0004   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TITLE:
        DECLE   $004E                           ; 501C  Cartridge year
        STRING  "xx"                            ; 501D  Title string
        DECLE   $0000                           ; 501F  

.TITLECODE:
        PULR    R7                              ; 5020   02B7

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5021  Timer dispatch/interval
        DECLE   $00D2,  $0057,  $000F,  $0000; 5025  Timer dispatch/interval
        DECLE   $002F,  $0050,  $0001,  $0000; 5029  Timer dispatch/interval
        BIDECLE $0000           ; 502D  End of timer table

L_502F:
        PSHR    R5                              ; 502F   0275

        JSR     R5,     L_547E                  ; 5030   0004 0154 007E
        JSR     R5,     L_58FF                  ; 5033   0004 0158 00FF
        JSR     R5,     L_56B9                  ; 5036   0004 0154 02B9
        JSR     R5,     L_5718                  ; 5039   0004 0154 0318
        JSR     R5,     L_581F                  ; 503C   0004 0158 001F
        JSR     R5,     L_67AD                  ; 503F   0004 0164 03AD
        JSR     R5,     L_576A                  ; 5042   0004 0154 036A
        DECLE   $0004,  $01AC,  $01FC,  $0004   ; 5045   0004 01AC 01FC 0004
        DECLE   $019C,  $01C9,  $0004,  $019C   ; 5049   019C 01C9 0004 019C
        DECLE   $023E,  $0004,  $0194,  $0069   ; 504D   023E 0004 0194 0069
        DECLE   $0004                           ; 5051   0004

        ANDR    R5,     R0                      ; 5052   01A8
        SUB@    R6,     R1                      ; 5053   0331
        MVI     G_0178, R0                      ; 5054   0280 0178
        INCR    R0                              ; 5056   0008
        MVO     R0,     G_0178                  ; 5057   0240 0178
        PULR    R7                              ; 5059   02B7

L_505A:
        PSHR    R5                              ; 505A   0275
        MVII    #$0040, R0                      ; 505B   02B8 0040
        MVII    #$031D, R4                      ; 505D   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 505F   0004 0114 0338

        CLRR    R2                              ; 5062   01D2
        MVII    #$031D, R5                      ; 5063   02BD 031D
        MVII    #$0007, R0                      ; 5065   02B8 0007
        MOVR    R7,     R4                      ; 5067   00BC
        ADDI    #$0105, R4                      ; 5068   02FC 0105
        MVI     G_015E, R1                      ; 506A   0281 015E
        TSTR    R1                              ; 506C   0089
        BEQ     L_5071                          ; 506D   0204 0002

        ADDI    #$0004, R4                      ; 506F   02FC 0004
L_5071:
        MVII    #$0018, R1                      ; 5071   02B9 0018
        SWAP    R1,     1                       ; 5073   0041
        XOR@    R4,     R1                      ; 5074   03E1
        MVO@    R1,     R5                      ; 5075   0269
        MVO@    R2,     R5                      ; 5076   026A
        MVI     G_0181, R2                      ; 5077   0282 0181
        CMPI    #$0032, R2                      ; 5079   037A 0032
        MVII    #$0000, R2                      ; 507B   02BA 0000
        BLT     L_5081                          ; 507D   0205 0002

        MVII    #$00A8, R2                      ; 507F   02BA 00A8
L_5081:
        SWAP    R2,     1                       ; 5081   0042
        MVO@    R2,     R5                      ; 5082   026A
        CLRR    R2                              ; 5083   01D2
        MVII    #$000A, R1                      ; 5084   02B9 000A
        CMPI    #$0003, R0                      ; 5086   0378 0003
        BGT     L_508C                          ; 5088   020E 0002

        MVII    #$005A, R1                      ; 508A   02B9 005A
L_508C:
        SWAP    R1,     1                       ; 508C   0041
        MVO@    R1,     R5                      ; 508D   0269
        MVO@    R2,     R5                      ; 508E   026A
        NOP                                     ; 508F   0034
        MVO@    R0,     R5                      ; 5090   0268
        MVO@    R2,     R5                      ; 5091   026A
        INCR    R5                              ; 5092   000D
        DECR    R0                              ; 5093   0010
        BPL     L_5071                          ; 5094   0223 0024
        PULR    R7                              ; 5096   02B7

.START:
        PSHR    R5                              ; 5097   0275
        DECLE   $02B8,  $0003,  $0240,  $0103   ; 5098   02B8 0003 0240 0103
        DECLE   $0280,  $0100,  $0240,  $01C2   ; 509C   0280 0100 0240 01C2
        DECLE   $0280,  $0101,  $0240,  $01C3   ; 50A0   0280 0101 0240 01C3
        DECLE   $0004,  $01A8,  $0083,  $0070   ; 50A4   0004 01A8 0083 0070
        DECLE   $00A6,  $0002,  $0004           ; 50A8   00A6 0002 0004

        ANDR    R2,     R4                      ; 50AB   0194
        MVI@    R2,     R3                      ; 50AC   0293

        JSR     R5,     L_565E                  ; 50AD   0004 0154 025E

        DECR    R4                              ; 50B0   0014
        PULR    R7                              ; 50B1   02B7

L_50B2:
        PSHR    R5                              ; 50B2   0275
        DECLE   $0004,  $01A8,  $00D5,  $0001   ; 50B3   0004 01A8 00D5 0001
        DECLE   $0004                           ; 50B7   0004

        ANDR    R5,     R0                      ; 50B8   01A8
        MOVR    R1,     R3                      ; 50B9   008B

        JSR     R5,     L_568C                  ; 50BA   0004 0154 028C

        CLRR    R0                              ; 50BD   01C0
        MVO     R0,     G_0117                  ; 50BE   0240 0117
L_50C0:
        MVII    #$00B4, R0                      ; 50C0   02B8 00B4
        MVO     R0,     G_0116                  ; 50C2   0240 0116
        MVII    #$005A, R0                      ; 50C4   02B8 005A
        MVO     R0,     G_0118                  ; 50C6   0240 0118
        MVII    #$0050, R0                      ; 50C8   02B8 0050
        MVO     R0,     G_0181                  ; 50CA   0240 0181
        INCR    R7                              ; 50CC   000F

L_50CD:
        PSHR    R5                              ; 50CD   0275
L_50CE:
        MVII    #$015D, R4                      ; 50CE   02BC 015D
        MVII    #$0008, R0                      ; 50D0   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 50D2   0004 0114 0338
        JSR     R5,     L_561B                  ; 50D5   0004 0154 021B
        JSR     R5,     L_505A                  ; 50D8   0004 0150 005A

        MVI     G_017B, R0                      ; 50DB   0280 017B
        SARC    R0,     2                       ; 50DD   007C
        MVII    #$0050, R0                      ; 50DE   02B8 0050
        BNOV    L_50E7                          ; 50E0   020A 0005

        JSR     R5,     L_563C                  ; 50E2   0004 0154 023C

        MVII    #$0014, R0                      ; 50E5   02B8 0014
L_50E7:
        MVO     R0,     G_017C                  ; 50E7   0240 017C
        DECLE   $0004                           ; 50E9   0004

        ANDR    R3,     R4                      ; 50EA   019C
        ANDR    R5,     R0                      ; 50EB   01A8
        INCR    R7                              ; 50EC   000F

L_50ED:
        PSHR    R5                              ; 50ED   0275
L_50EE:
        MVII    #$000F, R0                      ; 50EE   02B8 000F
        MVO     R0,     G_0163                  ; 50F0   0240 0163
        CLRR    R0                              ; 50F2   01C0
        MVO     R0,     G_0162                  ; 50F3   0240 0162
        MVO     R0,     G_01A5                  ; 50F5   0240 01A5
        MVO     R0,     G_01A6                  ; 50F7   0240 01A6
        MVO     R0,     G_019A                  ; 50F9   0240 019A
        INCR    R0                              ; 50FB   0008
        MVO     R0,     G_017E                  ; 50FC   0240 017E

        JSR     R5,     L_598B                  ; 50FE   0004 0158 018B

        PULR    R7                              ; 5101   02B7

L_5102:
        PSHR    R5                              ; 5102   0275

        JSR     R5,     L_5618                  ; 5103   0004 0154 0218
        DECLE   $0001                           ; 5106   0001

        JSR     R5,     L_5179                  ; 5107   0004 0150 0179
        DECLE   $0004,  $01AC,  $02A3,  $02BC   ; 510A   0004 01AC 02A3 02BC
        DECLE   $0068,  $02BB,  $0070,  $0004   ; 510E   0068 02BB 0070 0004

        ANDR    R5,     R4                      ; 5112   01AC
        MVI@    R5,     R4                      ; 5113   02AC
        ADDR    R4,     R7                      ; 5114   00E7

        SLLC    R3,     2                       ; 5115   005F
        PULR    R7                              ; 5116   02B7

L_5117:
        PSHR    R5                              ; 5117   0275
        CLRR    R0                              ; 5118   01C0
        MVO     R0,     G_01CE                  ; 5119   0240 01CE
        MVO     R0,     G_01CB                  ; 511B   0240 01CB

        JSR     R5,     L_568C                  ; 511D   0004 0154 028C
        JSR     R5,     L_5A82                  ; 5120   0004 0158 0282
        JSR     R5,     L_5179                  ; 5123   0004 0150 0179
        JSR     R5,     .EXEC.A61               ; 5126   0004 0118 0261

        COMR    R6                              ; 5129   001E
        MVII    #$0008, R0                      ; 512A   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; 512C   0004 011C 02D5

        MVII    #$000F, R0                      ; 512F   02B8 000F
        MVO     R0,     G_0163                  ; 5131   0240 0163
        MVI     G_017B, R0                      ; 5133   0280 017B
        INCR    R0                              ; 5135   0008
        MVO     R0,     G_017B                  ; 5136   0240 017B
        SARC    R0,     1                       ; 5138   0078
        BC      L_514A                          ; 5139   0201 000F

        CLRR    R4                              ; 513B   01E4
        MVII    #$00AA, R0                      ; 513C   02B8 00AA

        JSR     R5,     L_5799                  ; 513E   0004 0154 0399
        DECLE   $0280,  $015E,  $0048,  $0240   ; 5141   0280 015E 0048 0240
        DECLE   $018E,  $0004                   ; 5145   018E 0004

        ANDR    R2,     R4                      ; 5147   0194
        ADCR    R5                              ; 5148   002D
        PULR    R7                              ; 5149   02B7

L_514A:
        JSR     R5,     L_5156                  ; 514A   0004 0150 0156
        DECLE   $017C                           ; 514D   017C

        JSR     R5,     L_5156                  ; 514E   0004 0150 0156
        DECLE   $0182,  $0004                   ; 5151   0182 0004

        ANDR    R2,     R4                      ; 5153   0194
        ADCR    R5                              ; 5154   002D
        PULR    R7                              ; 5155   02B7

L_5156:
        MVI@    R5,     R3                      ; 5156   02AB
        MVI@    R3,     R0                      ; 5157   0298
        NEGR    R0                              ; 5158   0020
        ADDI    #$0064, R0                      ; 5159   02F8 0064
        MVO@    R0,     R3                      ; 515B   0258
        MOVR    R5,     R7                      ; 515C   00AF

L_515D:
        PSHR    R5                              ; 515D   0275

        JSR     R5,     L_5163                  ; 515E   0004 0150 0163

        PULR    R5                              ; 5161   02B5
        ADD@    R5,     R0                      ; 5162   02E8
L_5163:
        PSHR    R5                              ; 5163   0275

        JSR     R5,     L_5634                  ; 5164   0004 0154 0234

        BC      L_516C                          ; 5167   0201 0003

        NEGR    R0                              ; 5169   0020
        ADDI    #$0064, R0                      ; 516A   02F8 0064
L_516C:
        PULR    R7                              ; 516C   02B7

        SWAP    R0,     1                       ; 516D   0040
        RLC     R1,     1                       ; 516E   0051
        RLC     R1,     1                       ; 516F   0051
        RLC     R1,     1                       ; 5170   0051
        SWAP    R2,     1                       ; 5171   0042
        RLC     R2,     1                       ; 5172   0052
        RLC     R2,     1                       ; 5173   0052
        RLC     R2,     1                       ; 5174   0052
        SWAP    R0,     1                       ; 5175   0040
        RLC     R1,     1                       ; 5176   0051
        RLC     R1,     1                       ; 5177   0051
        RLC     R1,     1                       ; 5178   0051
L_5179:
        PSHR    R5                              ; 5179   0275
        MVII    #$0020, R1                      ; 517A   02B9 0020
        SWAP    R1,     1                       ; 517C   0041
        CLRR    R4                              ; 517D   01E4
        MVO     R4,     .BTAB.28                ; 517E   0244 0228
        MVO     R1,     .BTAB.14                ; 5180   0241 0214
        MVI     G_0181, R2                      ; 5182   0282 0181
        MVO     R4,     G_0191                  ; 5184   0244 0191
        MVO     R1,     .BTAB.DC                ; 5186   0241 02DC
        SUBI    #$000C, R2                      ; 5188   033A 000C
L_518A:
        PSHR    R2                              ; 518A   0272
        PSHR    R4                              ; 518B   0274

        JSR     R5,     L_5198                  ; 518C   0004 0150 0198

        PULR    R4                              ; 518F   02B4
        PULR    R2                              ; 5190   02B2
        INCR    R2                              ; 5191   000A
        INCR    R4                              ; 5192   000C
        CMPI    #$0014, R4                      ; 5193   037C 0014
        BLT     L_518A                          ; 5195   0225 000C
        PULR    R7                              ; 5197   02B7

L_5198:
        PSHR    R5                              ; 5198   0275
        ADDI    #$0200, R4                      ; 5199   02FC 0200
        MVII    #$0039, R3                      ; 519B   02BB 0039
        SDBD                                    ; 519D   0001
        CMPI    #$FFF7, R2                      ; 519E   037A 00F7 00FF
        BEQ     L_51F4                          ; 51A1   0204 0051

        MVII    #$0019, R3                      ; 51A3   02BB 0019
        SDBD                                    ; 51A5   0001
        CMPI    #$FFF8, R2                      ; 51A6   037A 00F8 00FF
        BEQ     L_51F4                          ; 51A9   0204 0049

        MVII    #$002D, R3                      ; 51AB   02BB 002D
        BLT     L_51F4                          ; 51AD   0205 0045

        CMPI    #$006E, R2                      ; 51AF   037A 006E
        BGT     L_51F4                          ; 51B1   020E 0041

        MVII    #$0030, R3                      ; 51B3   02BB 0030
        BEQ     L_51F4                          ; 51B5   0204 003D

        MVII    #$000F, R3                      ; 51B7   02BB 000F
        CMPI    #$006D, R2                      ; 51B9   037A 006D
        BEQ     L_51F4                          ; 51BB   0204 0037

        MVII    #$000A, R3                      ; 51BD   02BB 000A
        TSTR    R2                              ; 51BF   0092
        BMI     L_51F4                          ; 51C0   020B 0032

        CMPI    #$0065, R2                      ; 51C2   037A 0065
        BGT     L_51F4                          ; 51C4   020E 002E

        MVII    #$0001, R1                      ; 51C6   02B9 0001
        BEQ     L_51F3                          ; 51C8   0204 0029

        MVII    #$0000, R3                      ; 51CA   02BB 0000
        CMPI    #$0001, R2                      ; 51CC   037A 0001
        BEQ     L_51F4                          ; 51CE   0204 0024

        MOVR    R2,     R1                      ; 51D0   0091
        MVII    #$0005, R2                      ; 51D1   02BA 0005

        JSR     R5,     X_DIV                   ; 51D3   0004 011C 01FB

        CMPI    #$0001, R1                      ; 51D6   0379 0001
        BGT     L_51F4                          ; 51D8   020E 001A

        MVII    #$0001, R5                      ; 51DA   02BD 0001
        TSTR    R1                              ; 51DC   0089
        BNEQ    L_51EF                          ; 51DD   020C 0010

        SARC    R0,     1                       ; 51DF   0078
        MOVR    R0,     R5                      ; 51E0   0085
        RLC     R0,     1                       ; 51E1   0050
        MVII    #$0023, R3                      ; 51E2   02BB 0023
        MVII    #$0006, R1                      ; 51E4   02B9 0006
        TSTR    R0                              ; 51E6   0080
        BEQ     L_51F3                          ; 51E7   0204 000A

        CMPR    R1,     R5                      ; 51E9   014D
        BLT     L_51EF                          ; 51EA   0205 0003

        SUBI    #$000A, R5                      ; 51EC   033D 000A
        NEGR    R5                              ; 51EE   0025
L_51EF:
        SARC    R0,     1                       ; 51EF   0078
        BC      L_51F4                          ; 51F0   0201 0002

        MOVR    R5,     R1                      ; 51F2   00A9
L_51F3:
        INCR    R7                              ; 51F3   000F

L_51F4:
        CLRR    R1                              ; 51F4   01C9
L_51F5:
        SDBD                                    ; 51F5   0001
        ADDI    #$A32F, R3                      ; 51F6   02FB 002F 00A3
        MVII    #$0009, R2                      ; 51F9   02BA 0009
        CLRR    R0                              ; 51FB   01C0

        JSR     R5,     L_5225                  ; 51FC   0004 0150 0225

L_51FF:
        MVI@    R3,     R0                      ; 51FF   0298
        INCR    R3                              ; 5200   000B
        SARC    R0,     1                       ; 5201   0078
        MOVR    R0,     R5                      ; 5202   0085
        SLL     R0,     1                       ; 5203   0048
        BNC     L_520A                          ; 5204   0209 0004

        MVI@    R3,     R0                      ; 5206   0298
        INCR    R3                              ; 5207   000B
        B       L_520C                          ; 5208   0200 0002

L_520A:
        MVII    #$0001, R5                      ; 520A   02BD 0001
L_520C:
        PSHR    R0                              ; 520C   0270
        PSHR    R5                              ; 520D   0275

        JSR     R5,     L_5225                  ; 520E   0004 0150 0225

        PULR    R5                              ; 5211   02B5
        PULR    R0                              ; 5212   02B0
        DECR    R2                              ; 5213   0012
        BEQ     L_521B                          ; 5214   0204 0005

        DECR    R5                              ; 5216   0015
        BNEQ    L_520C                          ; 5217   022C 000C
        B       L_51FF                          ; 5219   0220 001B

L_521B:
        ADDR    R1,     R3                      ; 521B   00CB
        MVI@    R3,     R0                      ; 521C   0298

        JSR     R5,     L_5225                  ; 521D   0004 0150 0225

        CLRR    R0                              ; 5220   01C0

        JSR     R5,     L_5225                  ; 5221   0004 0150 0225

        PULR    R7                              ; 5224   02B7

L_5225:
        PSHR    R1                              ; 5225   0271
        MVI@    R4,     R1                      ; 5226   02A1
        DECR    R4                              ; 5227   0014
        SDBD                                    ; 5228   0001
        ANDI    #$2000, R1                      ; 5229   03B9 0000 0020
        SLL     R0,     2                       ; 522C   004C
        XORI    #$0007, R0                      ; 522D   03F8 0007
        XORR    R1,     R0                      ; 522F   01C8
        MVO@    R0,     R4                      ; 5230   0260
        ADDI    #$0013, R4                      ; 5231   02FC 0013
        PULR    R1                              ; 5233   02B1
        MOVR    R5,     R7                      ; 5234   00AF

L_5235:
        PSHR    R5                              ; 5235   0275
        MOVR    R2,     R3                      ; 5236   0093
        SLL     R3,     1                       ; 5237   004B
        DECR    R3                              ; 5238   0013
        MOVR    R3,     R0                      ; 5239   0098
        SLL     R0,     2                       ; 523A   004C
        SLL     R0,     1                       ; 523B   0048
        ADD     G_0172, R0                      ; 523C   02C0 0172
        MVO     R0,     G_0172                  ; 523E   0240 0172
        ADD     G_0198, R3                      ; 5240   02C3 0198
        MVO     R3,     G_0198                  ; 5242   0243 0198
        MOVR    R2,     R0                      ; 5244   0090
        MVI     G_0181, R2                      ; 5245   0282 0181
        DECR    R2                              ; 5247   0012
        CLRR    R4                              ; 5248   01E4
        TSTR    R0                              ; 5249   0080
        BNEQ    L_5250                          ; 524A   020C 0004

        ADDI    #$0002, R2                      ; 524C   02FA 0002
        MVII    #$0013, R4                      ; 524E   02BC 0013
L_5250:
        MVO     R2,     G_0181                  ; 5250   0242 0181
        CLRR    R0                              ; 5252   01C0
        TSTR    R2                              ; 5253   0092
        BNEQ    L_5258                          ; 5254   020C 0002

        MVII    #$0001, R0                      ; 5256   02B8 0001
L_5258:
        CMPI    #$006A, R2                      ; 5258   037A 006A
        BNEQ    L_525E                          ; 525A   020C 0002

        MVII    #$0002, R0                      ; 525C   02B8 0002
L_525E:
        MVI     G_0180, R1                      ; 525E   0281 0180
        ANDI    #$00FC, R1                      ; 5260   03B9 00FC
        XORR    R0,     R1                      ; 5262   01C1
        MVO     R1,     G_0180                  ; 5263   0241 0180
        CLRR    R1                              ; 5265   01C9
        TSTR    R0                              ; 5266   0080
        BEQ     L_526B                          ; 5267   0204 0002

        MVO     R1,     G_01E2                  ; 5269   0241 01E2
L_526B:
        ADDR    R4,     R2                      ; 526B   00E2
        SUBI    #$000C, R2                      ; 526C   033A 000C

        JSR     R5,     L_5198                  ; 526E   0004 0150 0198
        JSR     R5,     L_5795                  ; 5271   0004 0154 0395
        JSR     R5,     L_5288                  ; 5274   0004 0150 0288

        PULR    R7                              ; 5277   02B7

L_5278:
        SDBD                                    ; 5278   0001
        MVI@    R5,     R3                      ; 5279   02AB
        PSHR    R5                              ; 527A   0275
        MVO     R3,     G_018F                  ; 527B   0243 018F
        SWAP    R3,     1                       ; 527D   0043
        NOP                                     ; 527E   0034
        MVO     R3,     G_0190                  ; 527F   0243 0190
        MVII    #$0002, R0                      ; 5281   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5283   0004 0114 02E6

        ANDR    R0,     R0                      ; 5286   0180
        INCR    R7                              ; 5287   000F

L_5288:
        PSHR    R5                              ; 5288   0275
L_5289:
        MVI     G_0180, R0                      ; 5289   0280 0180
        ANDI    #$0004, R0                      ; 528B   03B8 0004
        BEQ     L_52B0                          ; 528D   0204 0021

        MVI     G_017C, R0                      ; 528F   0280 017C

        JSR     R5,     L_5634                  ; 5291   0004 0154 0234

        BNC     L_5298                          ; 5294   0209 0002

        ADDI    #$0006, R0                      ; 5296   02F8 0006
L_5298:
        MVII    #$007F, R1                      ; 5298   02B9 007F
        SUB     G_0181, R0                      ; 529A   0300 0181
        BNEQ    L_52AB                          ; 529C   020C 000D

        MVO     R0,     G_01E2                  ; 529E   0240 01E2
        MVII    #$0002, R0                      ; 52A0   02B8 0002

        JSR     R5,     X_SET_BIT               ; 52A2   0004 0114 02DB

        ANDR    R0,     R0                      ; 52A5   0180
        MVII    #$018F, R4                      ; 52A6   02BC 018F
        PULR    R5                              ; 52A8   02B5
        SDBD                                    ; 52A9   0001
        MVI@    R4,     R7                      ; 52AA   02A7
L_52AB:
        BLT     L_52AE                          ; 52AB   0205 0001

        NEGR    R1                              ; 52AD   0021
L_52AE:
        MVO     R1,     G_01E2                  ; 52AE   0241 01E2
L_52B0:
        PULR    R7                              ; 52B0   02B7

L_52B1:
        PSHR    R5                              ; 52B1   0275

        JSR     R5,     L_52BD                  ; 52B2   0004 0150 02BD
        DECLE   $0000,  $0001                   ; 52B5   0000 0001

        JSR     R5,     L_52BD                  ; 52B7   0004 0150 02BD
        DECLE   $0001,  $0002                   ; 52BA   0001 0002

        PULR    R7                              ; 52BC   02B7

L_52BD:
        MVI@    R5,     R0                      ; 52BD   02A8
        MVI@    R5,     R1                      ; 52BE   02A9
        SDBD                                    ; 52BF   0001
        XORI    #$18C0, R1                      ; 52C0   03F9 00C0 0018
        PSHR    R5                              ; 52C3   0275

        JSR     R5,     L_5634                  ; 52C4   0004 0154 0234

        BC      L_52D5                          ; 52C7   0201 000C

        MVII    #$000C, R5                      ; 52C9   02BD 000C
        MVII    #$000F, R3                      ; 52CB   02BB 000F
        CMP     G_015E, R0                      ; 52CD   0340 015E
        BEQ     L_52E1                          ; 52CF   0204 0010

        MVII    #$000B, R3                      ; 52D1   02BB 000B
        B       L_52DF                          ; 52D3   0200 000A

L_52D5:
        MVII    #$0006, R5                      ; 52D5   02BD 0006
        MVII    #$0008, R3                      ; 52D7   02BB 0008
        CMP     G_015E, R0                      ; 52D9   0340 015E
        BNEQ    L_52E1                          ; 52DB   020C 0004

        MVII    #$0004, R3                      ; 52DD   02BB 0004
L_52DF:
        SUBI    #$0030, R1                      ; 52DF   0339 0030
L_52E1:
        MVII    #$0264, R0                      ; 52E1   02B8 0264
        ADDR    R0,     R5                      ; 52E3   00C5
        ADDR    R0,     R3                      ; 52E4   00C3
        SDBD                                    ; 52E5   0001
        MVII    #$08A7, R0                      ; 52E6   02B8 00A7 0008
        MVO@    R0,     R5                      ; 52E9   0268
        MVO@    R1,     R3                      ; 52EA   0259
        PULR    R7                              ; 52EB   02B7

L_52EC:
        CLRR    R0                              ; 52EC   01C0
L_52ED:
        PSHR    R5                              ; 52ED   0275
        PSHR    R0                              ; 52EE   0270
        NOP                                     ; 52EF   0034
        MVO     R0,     G_0198                  ; 52F0   0240 0198

        JSR     R5,     L_5179                  ; 52F2   0004 0150 0179

        PULR    R0                              ; 52F5   02B0

        JSR     R5,     L_5301                  ; 52F6   0004 0150 0301
        DECLE   $0000,  $0001                   ; 52F9   0000 0001

        JSR     R5,     L_5301                  ; 52FB   0004 0150 0301
        DECLE   $0001,  $0002                   ; 52FE   0001 0002

        PULR    R7                              ; 5300   02B7

L_5301:
        MVI@    R5,     R1                      ; 5301   02A9
        MVI@    R5,     R2                      ; 5302   02AA
        SDBD                                    ; 5303   0001
        XORI    #$1878, R2                      ; 5304   03FA 0078 0018
        PSHR    R5                              ; 5307   0275
        MVII    #$0001, R3                      ; 5308   02BB 0001
        SDBD                                    ; 530A   0001
        MVII    #$532E, R4                      ; 530B   02BC 002E 0053

        JSR     R5,     L_5634                  ; 530E   0004 0154 0234

        BC      L_5315                          ; 5311   0201 0002

        ADDI    #$0004, R4                      ; 5313   02FC 0004
L_5315:
        CMP     G_015E, R1                      ; 5315   0341 015E
        BEQ     L_531C                          ; 5317   0204 0003

        INCR    R3                              ; 5319   000B
        ADDI    #$0002, R4                      ; 531A   02FC 0002
L_531C:
        ADD@    R4,     R2                      ; 531C   02E2
        MVI@    R4,     R4                      ; 531D   02A4
        ADDR    R0,     R4                      ; 531E   00C4
        BLT     L_532D                          ; 531F   0205 000C

        CMPI    #$0014, R4                      ; 5321   037C 0014
        BGE     L_532D                          ; 5323   020D 0008

        ADDI    #$0264, R4                      ; 5325   02FC 0264
L_5327:
        MVO@    R2,     R4                      ; 5327   0262
        ADDI    #$0008, R2                      ; 5328   02FA 0008
        DECR    R3                              ; 532A   0013
        BNEQ    L_5327                          ; 532B   022C 0005
L_532D:
        PULR    R7                              ; 532D   02B7

        DECLE   $0030,  $0006,  $0038,  $0007   ; 532E   0030 0006 0038 0007
        DECLE   $0000                           ; 5332   0000

        INCR    R5                              ; 5333   000D
        INCR    R0                              ; 5334   0008
        INCR    R3                              ; 5335   000B
L_5336:
        PSHR    R5                              ; 5336   0275
        PSHR    R4                              ; 5337   0274

        JSR     R5,     .EXEC.772               ; 5338   0004 0114 0372

        SAR     R2,     2                       ; 533B   006E
        INCR    R2                              ; 533C   000A
        SAR     R2,     1                       ; 533D   006A
        MOVR    R2,     R0                      ; 533E   0090
        SUBI    #$000E, R0                      ; 533F   0338 000E
        ADD     G_0181, R0                      ; 5341   02C0 0181
        DECR    R2                              ; 5343   0012

        JSR     R5,     L_5634                  ; 5344   0004 0154 0234

        MOVR    R0,     R1                      ; 5347   0081
        ADCR    R0                              ; 5348   0028
        PULR    R4                              ; 5349   02B4
        PULR    R7                              ; 534A   02B7

L_534B:
        PSHR    R5                              ; 534B   0275
        MVII    #$0192, R4                      ; 534C   02BC 0192
        MVI     G_0196, R0                      ; 534E   0280 0196

        JSR     R5,     L_536E                  ; 5350   0004 0150 036E

        MVI     G_0171, R5                      ; 5353   0285 0171
        TSTR    R5                              ; 5355   00AD
        BEQ     L_5362                          ; 5356   0204 000A

        CLRR    R5                              ; 5358   01ED
        MVO     R5,     G_0171                  ; 5359   0245 0171
        MVII    #$0194, R4                      ; 535B   02BC 0194
        MVII    #$0003, R0                      ; 535D   02B8 0003

        JSR     R5,     L_536E                  ; 535F   0004 0150 036E
L_5362:
        JSR     R5,     .EXEC.41C               ; 5362   0004 0114 001C

        MVI     G_0198, R0                      ; 5365   0280 0198

        JSR     R5,     X_EXT_SIGN_LO           ; 5367   0004 0114 0268
        JSR     R5,     L_52ED                  ; 536A   0004 0150 02ED

        PULR    R7                              ; 536D   02B7

L_536E:
        PSHR    R5                              ; 536E   0275
        PSHR    R0                              ; 536F   0270

        JSR     R5,     .EXEC.76C               ; 5370   0004 0114 036C

        MVI@    R4,     R0                      ; 5373   02A0
        SUB     G_0181, R0                      ; 5374   0300 0181

        JSR     R5,     X_CLAMP                 ; 5376   0004 0114 0270
        DECLE   $0000                           ; 5379   0000

        DECR    R6                              ; 537A   0016
        SLL     R0,     2                       ; 537B   004C
        SLL     R0,     1                       ; 537C   0048
        NOP                                     ; 537D   0034
        SWAP    R0,     1                       ; 537E   0040
        MOVR    R1,     R5                      ; 537F   008D
        ADDI    #$0002, R5                      ; 5380   02FD 0002
        MVO@    R0,     R5                      ; 5382   0268
        MVI@    R4,     R0                      ; 5383   02A0
        SWAP    R0,     1                       ; 5384   0040
        MVO@    R0,     R5                      ; 5385   0268
        CLRR    R0                              ; 5386   01C0
        MVO@    R0,     R5                      ; 5387   0268
        MVII    #$000E, R0                      ; 5388   02B8 000E
        MVO@    R0,     R5                      ; 538A   0268
        PSHR    R5                              ; 538B   0275

        JSR     R5,     L_544D                  ; 538C   0004 0154 004D

        PULR    R5                              ; 538F   02B5
        SDBD                                    ; 5390   0001
        MVII    #$9D42, R4                      ; 5391   02BC 0042 009D
        MVI     G_01C6, R0                      ; 5394   0280 01C6
        ANDI    #$0002, R0                      ; 5396   03B8 0002
        BEQ     L_539F                          ; 5398   0204 0005

        SDBD                                    ; 539A   0001
        MVII    #$9D5B, R4                      ; 539B   02BC 005B 009D
        INCR    R0                              ; 539E   0008
L_539F:
        CMPI    #$031D, R1                      ; 539F   0379 031D
        BEQ     L_53AA                          ; 53A1   0204 0007

        SDBD                                    ; 53A3   0001
        MVII    #$9D33, R4                      ; 53A4   02BC 0033 009D
        MOVR    R3,     R2                      ; 53A7   009A
        MVII    #$0004, R0                      ; 53A8   02B8 0004
L_53AA:
        MVO@    R0,     R5                      ; 53AA   0268

        JSR     R5,     L_5634                  ; 53AB   0004 0154 0234

        BNC     L_53B2                          ; 53AE   0209 0002

        XORI    #$0200, R2                      ; 53B0   03FA 0200
L_53B2:
        SDBD                                    ; 53B2   0001
        XORI    #$5840, R2                      ; 53B3   03FA 0040 0058
        MVO@    R2,     R1                      ; 53B6   024A
        INCR    R1                              ; 53B7   0009
        MVO@    R4,     R1                      ; 53B8   024C
        PULR    R0                              ; 53B9   02B0
        PULR    R7                              ; 53BA   02B7

L_53BB:
        MVII    #$0192, R4                      ; 53BB   02BC 0192
        MVO     R0,     G_0196                  ; 53BD   0240 0196
        PSHR    R5                              ; 53BF   0275

        JSR     R5,     L_53E3                  ; 53C0   0004 0150 03E3

        MVI     G_0196, R0                      ; 53C3   0280 0196

        JSR     R5,     .EXEC.76C               ; 53C5   0004 0114 036C

        SDBD                                    ; 53C8   0001
        MVII    #$5888, R2                      ; 53C9   02BA 0088 0058
        MVO@    R2,     R1                      ; 53CC   024A
        INCR    R1                              ; 53CD   0009
        SDBD                                    ; 53CE   0001
        MVII    #$9D14, R2                      ; 53CF   02BA 0014 009D
        MVO@    R2,     R1                      ; 53D2   024A
        ADDI    #$0004, R1                      ; 53D3   02F9 0004
        CLRR    R2                              ; 53D5   01D2
        MVO@    R2,     R1                      ; 53D6   024A
        INCR    R1                              ; 53D7   0009
        MVO@    R2,     R1                      ; 53D8   024A
        MVI     G_015D, R5                      ; 53D9   0285 015D
        CMPI    #$0006, R5                      ; 53DB   037D 0006
        BNEQ    L_532D                          ; 53DD   022C 00B1

        JSR     R5,     .EXEC.41C               ; 53DF   0004 0114 001C

        PULR    R7                              ; 53E2   02B7

L_53E3:
        PSHR    R5                              ; 53E3   0275
        PSHR    R0                              ; 53E4   0270

        JSR     R5,     L_5336                  ; 53E5   0004 0150 0336

        ADDI    #$000E, R1                      ; 53E8   02F9 000E
        MVO@    R1,     R4                      ; 53EA   0261
        MVO@    R3,     R4                      ; 53EB   0263
        NOP                                     ; 53EC   0034
        SAR     R3,     2                       ; 53ED   006F
        SAR     R3,     1                       ; 53EE   006B
        DECR    R3                              ; 53EF   0013
        BGT     L_53F3                          ; 53F0   020E 0001

        INCR    R3                              ; 53F2   000B
L_53F3:
        MOVR    R2,     R4                      ; 53F3   0094
        MOVR    R3,     R0                      ; 53F4   0098
        MVII    #$0014, R1                      ; 53F5   02B9 0014

        JSR     R5,     X_MPY                   ; 53F7   0004 011C 01DC

        ADDR    R2,     R4                      ; 53FA   00D4
        SDBD                                    ; 53FB   0001
        MVII    #$0898, R1                      ; 53FC   02B9 0098 0008

        JSR     R5,     L_5457                  ; 53FF   0004 0154 0057

        PULR    R5                              ; 5402   02B5
        TSTR    R5                              ; 5403   00AD
        BEQ     L_5407                          ; 5404   0204 0001

        MOVR    R3,     R2                      ; 5406   009A

L_5407:
        JSR     R5,     L_5634                  ; 5407   0004 0154 0234

        BNC     L_540E                          ; 540A   0209 0002

        ADDI    #$0030, R1                      ; 540C   02F9 0030
L_540E:
        XORR    R2,     R1                      ; 540E   01D1
        ADDI    #$0200, R4                      ; 540F   02FC 0200
        MVO@    R1,     R4                      ; 5411   0261
        PULR    R7                              ; 5412   02B7

L_5413:
        PSHR    R5                              ; 5413   0275
        MVII    #$0003, R0                      ; 5414   02B8 0003
        MVII    #$0194, R4                      ; 5416   02BC 0194

        JSR     R5,     L_53E3                  ; 5418   0004 0150 03E3

        MVI     G_0196, R0                      ; 541B   0280 0196

        JSR     R5,     .EXEC.76C               ; 541D   0004 0114 036C

        MOVR    R1,     R4                      ; 5420   008C
        MVII    #$0335, R5                      ; 5421   02BD 0335
        MVI@    R4,     R0                      ; 5423   02A0
        XORI    #$0007, R0                      ; 5424   03F8 0007
        MVO@    R0,     R5                      ; 5426   0268
        INCR    R4                              ; 5427   000C
        SDBD                                    ; 5428   0001
        MVII    #$9D1D, R0                      ; 5429   02B8 001D 009D
        MVO@    R0,     R5                      ; 542C   0268
        MVI@    R4,     R0                      ; 542D   02A0
        MVO@    R0,     R5                      ; 542E   0268
        MVI@    R4,     R0                      ; 542F   02A0
        SUBI    #$0100, R0                      ; 5430   0338 0100
        MVO@    R0,     R5                      ; 5432   0268
        MVI@    R4,     R0                      ; 5433   02A0
        MVO@    R0,     R5                      ; 5434   0268
        CLRR    R0                              ; 5435   01C0
        MVO@    R0,     R5                      ; 5436   0268
        MVO@    R0,     R5                      ; 5437   0268
        INCR    R4                              ; 5438   000C
        MVI@    R4,     R1                      ; 5439   02A1
        MVO     R1,     G_016E                  ; 543A   0241 016E
        DECR    R4                              ; 543C   0014
        ADDI    #$0002, R1                      ; 543D   02F9 0002
        MVO@    R1,     R4                      ; 543F   0261
        MVO     R0,     G_016D                  ; 5440   0240 016D
        INCR    R0                              ; 5442   0008
        MVO     R0,     G_016F                  ; 5443   0240 016F
        INCR    R0                              ; 5445   0008
        MVO     R0,     G_0171                  ; 5446   0240 0171
        INCR    R0                              ; 5448   0008

        JSR     R5,     .EXEC.41C               ; 5449   0004 0114 001C

        PULR    R7                              ; 544C   02B7

L_544D:
        MVI     G_015E, R2                      ; 544D   0282 015E
        SLL     R2,     1                       ; 544F   004A
        MVII    #$0011, R3                      ; 5450   02BB 0011
        BEQ     L_5456                          ; 5452   0204 0002

        MVII    #$0012, R3                      ; 5454   02BB 0012
L_5456:
        MOVR    R5,     R7                      ; 5456   00AF

L_5457:
        MVI     G_015E, R2                      ; 5457   0282 015E
        SLL     R2,     1                       ; 5459   004A
        SDBD                                    ; 545A   0001
        MVII    #$1001, R3                      ; 545B   02BB 0001 0010
        BEQ     L_5456                          ; 545E   0224 0009

        SDBD                                    ; 5460   0001
        MVII    #$1002, R3                      ; 5461   02BB 0002 0010
        MOVR    R5,     R7                      ; 5464   00AF
L_5465:
        BNEQ    L_550A                          ; 5465   020C 00A3

        MVI     .BTAB.7C,R0                     ; 5467   0280 027C
        CMPI    #$00D7, R0                      ; 5469   0378 00D7
        BNEQ    L_5472                          ; 546B   020C 0005

        MVII    #$027A, R4                      ; 546D   02BC 027A

        JSR     R5,     L_5601                  ; 546F   0004 0154 0201

L_5472:
        MVI     .BTAB.86,R0                     ; 5472   0280 0286
        CMPI    #$00D7, R0                      ; 5474   0378 00D7
        BNEQ    L_550A                          ; 5476   020C 0092

        MVII    #$0284, R4                      ; 5478   02BC 0284

        JSR     R5,     L_5601                  ; 547A   0004 0154 0201

        PULR    R7                              ; 547D   02B7

L_547E:
        PSHR    R5                              ; 547E   0275
        MVI     G_015D, R5                      ; 547F   0285 015D
        CMPI    #$000C, R5                      ; 5481   037D 000C
        BGE     L_5465                          ; 5483   022D 001F

        JSR     R5,     L_5512                  ; 5485   0004 0154 0112

        MVI     G_015D, R0                      ; 5488   0280 015D
        CMPI    #$0009, R0                      ; 548A   0378 0009
        BEQ     L_550A                          ; 548C   0204 007C

        MVI     G_017F, R0                      ; 548E   0280 017F
        MVI     G_0191, R1                      ; 5490   0281 0191
        ANDI    #$0040, R0                      ; 5492   03B8 0040
        BNEQ    L_54AC                          ; 5494   020C 0016

        ANDI    #$0004, R1                      ; 5496   03B9 0004
        BEQ     L_550A                          ; 5498   0204 0070

        XOR     G_0191, R1                      ; 549A   03C1 0191
        MVO     R1,     G_0191                  ; 549C   0241 0191
        MVII    #$02DC, R4                      ; 549E   02BC 02DC
        MVII    #$0020, R3                      ; 54A0   02BB 0020
        SWAP    R3,     1                       ; 54A2   0043
        INCR    R7                              ; 54A3   000F

L_54A4:
        PSHR    R5                              ; 54A4   0275
L_54A5:
        MVII    #$0014, R0                      ; 54A5   02B8 0014

        JSR     R5,     X_PRPAD_R5              ; 54A7   0004 0118 0071
        DECLE   $0000                           ; 54AA   0000

        PULR    R7                              ; 54AB   02B7

L_54AC:
        MOVR    R1,     R0                      ; 54AC   0088
        ANDI    #$0004, R1                      ; 54AD   03B9 0004
        BNEQ    L_550A                          ; 54AF   020C 0059

        XORI    #$0004, R0                      ; 54B1   03F8 0004
        MVO     R0,     G_0191                  ; 54B3   0240 0191
        MVII    #$02DE, R4                      ; 54B5   02BC 02DE
        MVII    #$0007, R3                      ; 54B7   02BB 0007
        MVI     G_015F, R0                      ; 54B9   0280 015F

        JSR     R5,     L_55D1                  ; 54BB   0004 0154 01D1
        JSR     R5,     X_PRINT_R5              ; 54BE   0004 0118 007B
        STRING  " and  G"                       ; 54C1  
        DECLE   $0000                           ; 54C8   0000

        MVI     G_017D, R0                      ; 54C9   0280 017D
        SWAP    R0,     1                       ; 54CB   0040
        SWAP    R0,     1                       ; 54CC   0040
        BMI     L_54D9                          ; 54CD   020B 000A
        BNEQ    L_54D2                          ; 54CF   020C 0001

        INCR    R0                              ; 54D1   0008
L_54D2:
        MVII    #$0003, R1                      ; 54D2   02B9 0003
        SUBR    R1,     R4                      ; 54D4   010C

        JSR     R5,     X_PRNUM_RGT             ; 54D5   0004 0118 00C5

        ADDR    R1,     R4                      ; 54D8   00CC

L_54D9:
        JSR     R5,     X_PRINT_R5              ; 54D9   0004 0118 007B
        STRING  " on 50"                        ; 54DC  
        DECLE   $0000                           ; 54E2   0000

        MVII    #$0000, R5                      ; 54E3   02BD 0000
        B       L_54EA                          ; 54E5   0200 0003

L_54E7:
        PSHR    R5                              ; 54E7   0275
        MVII    #$0001, R5                      ; 54E8   02BD 0001
L_54EA:
        MVI     G_017C, R0                      ; 54EA   0280 017C
        MVII    #$0002, R2                      ; 54EC   02BA 0002
        MVI     G_017B, R1                      ; 54EE   0281 017B
        SARC    R1,     1                       ; 54F0   0079
        BNC     L_54F4                          ; 54F1   0209 0001

        MOVR    R5,     R2                      ; 54F3   00AA
L_54F4:
        MVII    #$0002, R1                      ; 54F4   02B9 0002
        CMPI    #$0032, R0                      ; 54F6   0378 0032
        BEQ     L_550A                          ; 54F8   0204 0010
        BLT     L_5502                          ; 54FA   0205 0006

        XORI    #$0002, R2                      ; 54FC   03FA 0002
        XORR    R5,     R2                      ; 54FE   01EA
        NEGR    R0                              ; 54FF   0020
        ADDI    #$0064, R0                      ; 5500   02F8 0064
L_5502:
        SUBR    R1,     R4                      ; 5502   010C
        MOVR    R2,     R3                      ; 5503   0093
        TSTR    R0                              ; 5504   0080
        BEQ     L_550B                          ; 5505   0204 0004

        JSR     R5,     X_PRNUM_RGT             ; 5507   0004 0118 00C5

L_550A:
        PULR    R7                              ; 550A   02B7

L_550B:
        JSR     R5,     X_PRINT_R5              ; 550B   0004 0118 007B
        STRING  " G"                            ; 550E   0020 0047
        DECLE   $0000                           ; 5510   0000

        PULR    R7                              ; 5511   02B7

L_5512:
        PSHR    R5                              ; 5512   0275
        MVII    #$0200, R4                      ; 5513   02BC 0200
        CLRR    R3                              ; 5515   01DB
        MVI     G_017F, R0                      ; 5516   0280 017F
        MVI     G_0191, R1                      ; 5518   0281 0191
        MOVR    R0,     R5                      ; 551A   0085
        ANDI    #$0010, R5                      ; 551B   03BD 0010
        BEQ     L_552D                          ; 551D   0204 000E

        ANDI    #$0080, R0                      ; 551F   03B8 0080
        BNEQ    L_5527                          ; 5521   020C 0004

        JSR     R5,     L_5580                  ; 5523   0004 0154 0180
        DECLE   $0001                           ; 5526   0001
L_5527:
        MVII    #$0206, R4                      ; 5527   02BC 0206

        JSR     R5,     L_5601                  ; 5529   0004 0154 0201

        PULR    R7                              ; 552C   02B7

L_552D:
        JSR     R5,     L_5580                  ; 552D   0004 0154 0180
        DECLE   $0002                           ; 5530   0002

        MVI     G_0182, R0                      ; 5531   0280 0182
        CMP     G_017C, R0                      ; 5533   0340 017C
        BEQ     L_553C                          ; 5535   0204 0005

        JSR     R5,     L_5560                  ; 5537   0004 0154 0160
        DECLE   $0000,  $0000                   ; 553A   0000 0000
L_553C:
        MVI     G_0182, R0                      ; 553C   0280 0182

        JSR     R5,     L_515D                  ; 553E   0004 0150 015D

        INCR    R1                              ; 5541   0009
        MOVR    R0,     R2                      ; 5542   0082

        JSR     R5,     L_515D                  ; 5543   0004 0150 015D
        DECLE   $0001                           ; 5546   0001

        MOVR    R0,     R3                      ; 5547   0083
        MVI     G_017C, R0                      ; 5548   0280 017C
        CMPR    R0,     R2                      ; 554A   0142
        BEQ     L_5552                          ; 554B   0204 0005

        JSR     R5,     L_5560                  ; 554D   0004 0154 0160
        DECLE   $0000,  $0007                   ; 5550   0000 0007
L_5552:
        MOVR    R3,     R0                      ; 5552   0098

        JSR     R5,     L_5560                  ; 5553   0004 0154 0160
        DECLE   $0001,  $0008                   ; 5556   0001 0008

        PULR    R7                              ; 5558   02B7

L_5559:
        MVI     G_0191, R0                      ; 5559   0280 0191
        ANDI    #$00FD, R0                      ; 555B   03B8 00FD
        MVO     R0,     G_0191                  ; 555D   0240 0191
        MOVR    R5,     R7                      ; 555F   00AF

L_5560:
        MVI@    R5,     R2                      ; 5560   02AA
        MVI@    R5,     R1                      ; 5561   02A9
        ADDI    #$000C, R0                      ; 5562   02F8 000C
        MOVR    R0,     R4                      ; 5564   0084
        SDBD                                    ; 5565   0001
        ADDI    #$0490, R1                      ; 5566   02F9 0090 0004
        MVI     G_017B, R0                      ; 5569   0280 017B
        XOR     G_015E, R0                      ; 556B   03C0 015E
        ANDI    #$0001, R0                      ; 556D   03B8 0001
        XORR    R0,     R2                      ; 556F   01C2
        SLL     R0,     2                       ; 5570   004C
        SLL     R0,     1                       ; 5571   0048
        XORR    R0,     R1                      ; 5572   01C1
        ADDR    R2,     R4                      ; 5573   00D4
        SUB     G_0181, R4                      ; 5574   0304 0181
        BLT     L_557F                          ; 5576   0205 0007

        CMPI    #$0014, R4                      ; 5578   037C 0014
        BGE     L_557F                          ; 557A   020D 0003

        ADDI    #$0200, R4                      ; 557C   02FC 0200
        MVO@    R1,     R4                      ; 557E   0261
L_557F:
        MOVR    R5,     R7                      ; 557F   00AF

L_5580:
        MVI@    R5,     R2                      ; 5580   02AA
        PSHR    R5                              ; 5581   0275
        MOVR    R1,     R0                      ; 5582   0088
        ANDR    R2,     R0                      ; 5583   0190
        BNEQ    L_5589                          ; 5584   020C 0003

        JSR     R5,     L_54A4                  ; 5586   0004 0154 00A4

L_5589:
        ANDI    #$00FC, R1                      ; 5589   03B9 00FC
        XORR    R2,     R1                      ; 558B   01D1
        MVO     R1,     G_0191                  ; 558C   0241 0191
        PULR    R7                              ; 558E   02B7

        PSHR    R5                              ; 558F   0275
        MVII    #$000D, R0                      ; 5590   02B8 000D

        JSR     R5,     X_CLR_BIT               ; 5592   0004 0114 02E6
        DECLE   $0228                           ; 5595   0228

        MVII    #$020B, R4                      ; 5596   02BC 020B
        CLRR    R3                              ; 5598   01DB
        MVII    #$001D, R0                      ; 5599   02B8 001D

        JSR     R5,     X_PRPAD_R5              ; 559B   0004 0118 0071
        STRING  " Visitor"                      ; 559E  
        DECLE   $0000                           ; 55A6   0000

        MVII    #$0222, R4                      ; 55A7   02BC 0222
        MVII    #$0003, R1                      ; 55A9   02B9 0003
        MVI     G_0179, R0                      ; 55AB   0280 0179

        JSR     R5,     X_PRNUM_RGT             ; 55AD   0004 0118 00C5

        MVII    #$0216, R4                      ; 55B0   02BC 0216
        MVII    #$0002, R3                      ; 55B2   02BB 0002
        MVI     G_017A, R0                      ; 55B4   0280 017A

        JSR     R5,     X_PRNUM_LFT             ; 55B6   0004 0118 009E

        MVII    #$0200, R4                      ; 55B9   02BC 0200

        JSR     R5,     X_PRINT_R5              ; 55BB   0004 0118 007B
        STRING  " Home "                        ; 55BE  
        DECLE   $0000                           ; 55C4   0000

        MVII    #$021B, R4                      ; 55C5   02BC 021B
        MVII    #$0007, R3                      ; 55C7   02BB 0007
        MVI     G_017B, R0                      ; 55C9   0280 017B
        PULR    R5                              ; 55CB   02B5
L_55CC:
        MOVR    R7,     R1                      ; 55CC   00B9
        ADDI    #$0020, R1                      ; 55CD   02F9 0020
        B       L_55D4                          ; 55CF   0200 0003

L_55D1:
        MOVR    R7,     R1                      ; 55D1   00B9
        ADDI    #$0007, R1                      ; 55D2   02F9 0007
L_55D4:
        SLL     R0,     2                       ; 55D4   004C
        ADDR    R0,     R1                      ; 55D5   00C1
        J       X_PRINT_R1                      ; 55D6   0004 0318 0067

        DECLE   $0031,  $0073,  $0074,  $0000   ; 55D9   0031 0073 0074 0000
        DECLE   $0032,  $006E,  $0064,  $0000   ; 55DD   0032 006E 0064 0000
        DECLE   $0033,  $0072,  $0064,  $0000   ; 55E1   0033 0072 0064 0000
        DECLE   $0034,  $0074,  $0068,  $0000   ; 55E5   0034 0074 0068 0000
        DECLE   $0045,  $006E,  $0064,  $0000   ; 55E9   0045 006E 0064 0000
        DECLE   $0031,  $0053,  $0054,  $0000   ; 55ED   0031 0053 0054 0000
        DECLE   $0032,  $004E,  $0044,  $0000   ; 55F1   0032 004E 0044 0000
        DECLE   $0033,  $0052,  $0044,  $0000   ; 55F5   0033 0052 0044 0000
        DECLE   $0034,  $0054,  $0048,  $0000   ; 55F9   0034 0054 0048 0000
        DECLE   $0045,  $004E,  $0044,  $0000   ; 55FD   0045 004E 0044 0000
L_5601:
        PSHR    R5                              ; 5601   0275
        PSHR    R4                              ; 5602   0274
        MVI     G_0163, R0                      ; 5603   0280 0163
        MVII    #$0002, R1                      ; 5605   02B9 0002
        MVII    #$0007, R3                      ; 5607   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5609   0004 0118 00C5

        PULR    R4                              ; 560C   02B4
        ADDI    #$0002, R4                      ; 560D   02FC 0002
        MVII    #$00D7, R0                      ; 560F   02B8 00D7
        MVO@    R0,     R4                      ; 5611   0260
        MVI     G_0162, R0                      ; 5612   0280 0162

        JSR     R5,     X_PRNUM_ZRO             ; 5614   0004 0118 00AD

        PULR    R7                              ; 5617   02B7

L_5618:
        MVI@    R5,     R0                      ; 5618   02A8
L_5619:
        MVO     R0,     G_015D                  ; 5619   0240 015D

L_561B:
        JSR     R4,     L_562E                  ; 561B   0004 0054 022E
        DECLE   $0000                           ; 561E   0000

        SWAP    R0,     1                       ; 561F   0040
        ADDR    R2,     R0                      ; 5620   00D0
        RLC     R0,     1                       ; 5621   0050
        SWAP    R0,     1                       ; 5622   0040
        ADCR    R7                              ; 5623   002F

        ADCR    R1                              ; 5624   0029
L_5625:
        ADCR    R3                              ; 5625   002B
        DECLE   $0029,  $0000,  $0090,  $002F   ; 5626   0029 0000 0090 002F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 562A   0000 0000 0000 0000
L_562E:
        ADD     G_015D, R4                      ; 562E   02C4 015D
        MVI@    R4,     R0                      ; 5630   02A0
        MVO     R0,     G_017F                  ; 5631   0240 017F
        MOVR    R5,     R7                      ; 5633   00AF

L_5634:
        PSHR    R0                              ; 5634   0270
        MVI     G_017B, R0                      ; 5635   0280 017B
        XOR     G_015E, R0                      ; 5637   03C0 015E
        SARC    R0,     1                       ; 5639   0078
        PULR    R0                              ; 563A   02B0
        MOVR    R5,     R7                      ; 563B   00AF

L_563C:
        PSHR    R5                              ; 563C   0275
        MVII    #$0020, R0                      ; 563D   02B8 0020
        MVII    #$031D, R1                      ; 563F   02B9 031D
        MVII    #$033D, R2                      ; 5641   02BA 033D
L_5643:
        MVI@    R1,     R3                      ; 5643   028B
        MVI@    R2,     R5                      ; 5644   0295
        MVO@    R5,     R1                      ; 5645   024D
        MVO@    R3,     R2                      ; 5646   0253
        INCR    R1                              ; 5647   0009
        INCR    R2                              ; 5648   000A
        DECR    R0                              ; 5649   0010
        BNEQ    L_5643                          ; 564A   022C 0008

        INCR    R0                              ; 564C   0008
        XOR     G_015E, R0                      ; 564D   03C0 015E
        MVO     R0,     G_015E                  ; 564F   0240 015E
        MVI     G_0168, R0                      ; 5651   0280 0168
        SLL     R0,     2                       ; 5653   004C
        SLL     R0,     2                       ; 5654   004C
        MOVR    R0,     R1                      ; 5655   0081
        SWAP    R1,     1                       ; 5656   0041
        XORR    R1,     R0                      ; 5657   01C8
        MVO     R0,     G_0168                  ; 5658   0240 0168

        JSR     R5,     L_697B                  ; 565A   0004 0168 017B

        PULR    R7                              ; 565D   02B7

L_565E:
        JSR     R4,     L_5689                  ; 565E   0004 0054 0289
        DECLE   $0000,  $0000                   ; 5661   0000 0000

        MOVR    R4,     R1                      ; 5663   00A1
        RLC     R2,     2                       ; 5664   0056
        MOVR    R4,     R7                      ; 5665   00A7

        RLC     R2,     2                       ; 5666   0056
        MOVR    R4,     R7                      ; 5667   00A7

        RLC     R2,     2                       ; 5668   0056
        MOVR    R4,     R7                      ; 5669   00A7

        DECLE   $0056,  $0000,  $0000,  $0000   ; 566A   0056 0000 0000 0000
        DECLE   $0000,  $00AD,  $0056,  $00B3   ; 566E   0000 00AD 0056 00B3
        DECLE   $0056,  $00B3,  $0056,  $00C9   ; 5672   0056 00B3 0056 00C9
        DECLE   $009E,  $00C9,  $009E,  $00C9   ; 5676   009E 00C9 009E 00C9
        DECLE   $009E,  $00C9,  $009E,  $00C9   ; 567A   009E 00C9 009E 00C9
        DECLE   $009E,  $0000,  $0000,  $00F5   ; 567E   009E 0000 0000 00F5
        DECLE   $009E,  $0000,  $0000,  $002D   ; 5682   009E 0000 0000 002D
        DECLE   $0094,  $0000,  $0000           ; 5686   0094 0000 0000
L_5689:
        ADD@    R5,     R4                      ; 5689   02EC
        B       L_5690                          ; 568A   0200 0004

L_568C:
        SDBD                                    ; 568C   0001
        MVII    #$1906, R4                      ; 568D   02BC 0006 0019
L_5690:
        MVO     R4,     G_035D                  ; 5690   0244 035D
L_5692:
        MOVR    R5,     R7                      ; 5692   00AF

L_5693:
        MVI     G_01C6, R2                      ; 5693   0282 01C6
        TSTR    R1                              ; 5695   0089
        BNEQ    L_569C                          ; 5696   020C 0004

        ANDI    #$0004, R2                      ; 5698   03BA 0004
        BNEQ    L_5692                          ; 569A   022C 0009

L_569C:
        ANDI    #$0008, R2                      ; 569C   03BA 0008
        BNEQ    L_5692                          ; 569E   022C 000D
        MOVR    R4,     R7                      ; 56A0   00A7

        JSR     R4,     L_5693                  ; 56A1   0004 0054 0293

        J       L_6060                          ; 56A4   0004 0360 0060

        JSR     R4,     L_5693                  ; 56A7   0004 0054 0293

        J       L_5830                          ; 56AA   0004 0358 0030

        JSR     R4,     L_5693                  ; 56AD   0004 0054 0293

        J       L_5C14                          ; 56B0   0004 035C 0014

        JSR     R4,     L_5693                  ; 56B3   0004 0054 0293

        J       L_5C10                          ; 56B6   0004 035C 0010

L_56B9:
        PSHR    R5                              ; 56B9   0275
        DECLE   $0004,  $01A4,  $0225,  $0005   ; 56BA   0004 01A4 0225 0005

        MOVR    R0,     R4                      ; 56BE   0084

        JSR     R5,     L_56E8                  ; 56BF   0004 0154 02E8
        DECLE   $0000,  $0001,  $0002,  $0283   ; 56C2   0000 0001 0002 0283
        DECLE   $015D,  $037B,  $000B,  $020C   ; 56C6   015D 037B 000B 020C
        DECLE   $0011,  $0080,  $0204,  $000E   ; 56CA   0011 0080 0204 000E

        MVII    #$0001, R0                      ; 56CE   02B8 0001
        MVO     R0,     G_035B                  ; 56D0   0240 035B

        JSR     R5,     L_5618                  ; 56D2   0004 0154 0218
        DECLE   $0005                           ; 56D5   0005

        MVII    #$000E, R0                      ; 56D6   02B8 000E

        JSR     R5,     X_CLR_BIT               ; 56D8   0004 0114 02E6

L_56DB:
        CMP@    R2,     R5                      ; 56DB   0355
        DECLE   $0004                           ; 56DC   0004

        ANDR    R4,     R4                      ; 56DD   01A4
        BLT     L_56DB                          ; 56DE   0225 0004

        MOVR    R0,     R4                      ; 56E0   0084

        JSR     R5,     L_56E8                  ; 56E1   0004 0154 02E8
        DECLE   $0004,  $0000,  $0001           ; 56E4   0004 0000 0001

        PULR    R7                              ; 56E7   02B7

L_56E8:
        MVI@    R5,     R0                      ; 56E8   02A8
        MVI     G_015E, R2                      ; 56E9   0282 015E
        XOR@    R5,     R2                      ; 56EB   03EA
        MVI     G_017F, R1                      ; 56EC   0281 017F
        AND@    R5,     R1                      ; 56EE   03A9
        BEQ     L_5692                          ; 56EF   0224 005E

        PSHR    R5                              ; 56F1   0275

        JSR     R5,     .EXEC.76C               ; 56F2   0004 0114 036C

        INCR    R1                              ; 56F5   0009
        MVI@    R1,     R5                      ; 56F6   028D
        DECR    R1                              ; 56F7   0011
        SDBD                                    ; 56F8   0001
        CMPI    #$9D42, R5                      ; 56F9   037D 0042 009D
        BNEQ    L_5815                          ; 56FC   020C 0117

        JSR     R5,     X_POW2                  ; 56FE   0004 0114 0345

        AND     G_0168, R0                      ; 5701   0380 0168
        BNEQ    L_5815                          ; 5703   020C 0110

        MOVR    R1,     R3                      ; 5705   008B
        ADDI    #$0004, R3                      ; 5706   02FB 0004
        ADDI    #$011F, R2                      ; 5708   02FA 011F
        MVI@    R2,     R1                      ; 570A   0291
        MOVR    R1,     R2                      ; 570B   008A
        ANDI    #$00C0, R2                      ; 570C   03BA 00C0
        BNEQ    L_5715                          ; 570E   020C 0005

        MOVR    R4,     R0                      ; 5710   00A0

        JSR     R5,     .EXEC.629               ; 5711   0004 0114 0229

        INCR    R7                              ; 5714   000F

L_5715:
        CLRR    R0                              ; 5715   01C0
L_5716:
        MVO@    R0,     R3                      ; 5716   0258
        PULR    R7                              ; 5717   02B7

L_5718:
        MVI     G_015D, R3                      ; 5718   0283 015D
        CMPI    #$000C, R3                      ; 571A   037B 000C
        BGE     L_5692                          ; 571C   022D 008B

        MVII    #$031D, R1                      ; 571E   02B9 031D
        TSTR    R3                              ; 5720   009B
        BEQ     L_5729                          ; 5721   0204 0006

        SUBI    #$0009, R3                      ; 5723   033B 0009
        BEQ     L_5729                          ; 5725   0204 0002

        MVI     G_0168, R3                      ; 5727   0283 0168
L_5729:
        MOVR    R1,     R4                      ; 5729   008C
        ADDI    #$0005, R4                      ; 572A   02FC 0005
        MVI@    R1,     R0                      ; 572C   0288
        ANDI    #$0008, R0                      ; 572D   03B8 0008
        BNEQ    L_575E                          ; 572F   020C 002D

        DECR    R4                              ; 5731   0014
        MVI@    R4,     R0                      ; 5732   02A0
        SWAP    R0,     1                       ; 5733   0040
        BEQ     L_5749                          ; 5734   0204 0013

        ANDI    #$00FF, R0                      ; 5736   03B8 00FF
        BEQ     L_5746                          ; 5738   0204 000C

        MVI@    R1,     R2                      ; 573A   028A
        SDBD                                    ; 573B   0001
        ANDI    #$FDFF, R2                      ; 573C   03BA 00FF 00FD
        ANDI    #$0080, R0                      ; 573F   03B8 0080
        BNEQ    L_5745                          ; 5741   020C 0002

        XORI    #$0200, R2                      ; 5743   03FA 0200
L_5745:
        MVO@    R2,     R1                      ; 5745   024A
L_5746:
        MVII    #$03E0, R2                      ; 5746   02BA 03E0
        INCR    R7                              ; 5748   000F

L_5749:
        CLRR    R2                              ; 5749   01D2
L_574A:
        MVI@    R4,     R0                      ; 574A   02A0
        DECR    R4                              ; 574B   0014
        SDBD                                    ; 574C   0001
        ANDI    #$FC0F, R0                      ; 574D   03B8 000F 00FC
        SARC    R3,     1                       ; 5750   007B
        SLL     R3,     1                       ; 5751   004B
        BNC     L_575C                          ; 5752   0209 0008

        MVI@    R4,     R2                      ; 5754   02A2
        CMPI    #$0002, R2                      ; 5755   037A 0002
        BEQ     L_5760                          ; 5757   0204 0007

        DECR    R4                              ; 5759   0014
        MVII    #$01F0, R2                      ; 575A   02BA 01F0
L_575C:
        XORR    R2,     R0                      ; 575C   01D0
        INCR    R7                              ; 575D   000F

L_575E:
        CLRR    R0                              ; 575E   01C0
L_575F:
        MVO@    R0,     R4                      ; 575F   0260
L_5760:
        SLR     R3,     1                       ; 5760   0063
        ADDI    #$0008, R1                      ; 5761   02F9 0008
        CMPI    #$0355, R1                      ; 5763   0379 0355
        BLE     L_5729                          ; 5765   0226 003D

        MVO     R3,     G_016A                  ; 5767   0243 016A
        MOVR    R5,     R7                      ; 5769   00AF

L_576A:
        PSHR    R5                              ; 576A   0275
        MVI     G_017F, R5                      ; 576B   0285 017F
        ANDI    #$0020, R5                      ; 576D   03BD 0020
        BEQ     L_5815                          ; 576F   0204 00A4

        CLRR    R0                              ; 5771   01C0

        JSR     R5,     .EXEC.772               ; 5772   0004 0114 0372

        MVII    #$0033, R4                      ; 5775   02BC 0033
        MVI     G_015D, R5                      ; 5777   0285 015D
        CMPI    #$0008, R5                      ; 5779   037D 0008
        BNEQ    L_577F                          ; 577B   020C 0002

        MVII    #$007F, R4                      ; 577D   02BC 007F
L_577F:
        MVII    #$0001, R3                      ; 577F   02BB 0001
        ADD     G_01E4, R2                      ; 5781   02C2 01E4
        CMPI    #$0020, R2                      ; 5783   037A 0020
        BLT     L_578D                          ; 5785   0205 0006

        CMPI    #$0090, R2                      ; 5787   037A 0090
        BLT     L_5792                          ; 5789   0205 0007

        NEGR    R4                              ; 578B   0024
        SLL     R3,     1                       ; 578C   004B
L_578D:
        AND     G_0180, R3                      ; 578D   0383 0180
        BNEQ    L_5792                          ; 578F   020C 0001

        MOVR    R4,     R0                      ; 5791   00A0
L_5792:
        MVO     R0,     G_01E2                  ; 5792   0240 01E2
        PULR    R7                              ; 5794   02B7

L_5795:
        MVII    #$00C8, R4                      ; 5795   02BC 00C8
        MVII    #$00B0, R0                      ; 5797   02B8 00B0
L_5799:
        PSHR    R5                              ; 5799   0275
        MVII    #$031D, R1                      ; 579A   02B9 031D

L_579C:
        JSR     R5,     .EXEC.777               ; 579C   0004 0114 0377

        MOVR    R0,     R3                      ; 579F   0083
        CMPR    R3,     R2                      ; 57A0   015A
        BLE     L_57AC                          ; 57A1   0206 0009

        CMPR    R4,     R2                      ; 57A3   0162
        BLT     L_57A7                          ; 57A4   0205 0001

        CLRR    R3                              ; 57A6   01DB
L_57A7:
        SWAP    R3,     1                       ; 57A7   0043
        MOVR    R1,     R2                      ; 57A8   008A
        ADDI    #$0002, R2                      ; 57A9   02FA 0002
        MVO@    R3,     R2                      ; 57AB   0253
L_57AC:
        ADDI    #$0008, R1                      ; 57AC   02F9 0008
        CMPI    #$0355, R1                      ; 57AE   0379 0355
        BLE     L_579C                          ; 57B0   0226 0015
        PULR    R7                              ; 57B2   02B7

L_57B3:
        CLRR    R0                              ; 57B3   01C0
L_57B4:
        PSHR    R5                              ; 57B4   0275

        JSR     R5,     L_5336                  ; 57B5   0004 0150 0336

        MOVR    R0,     R4                      ; 57B8   0084

        JSR     R5,     L_5163                  ; 57B9   0004 0150 0163

        CLRR    R2                              ; 57BC   01D2
        MVII    #$000A, R5                      ; 57BD   02BD 000A
        CMPR    R3,     R5                      ; 57BF   015D
        RLC     R2,     1                       ; 57C0   0052
        CMPI    #$0057, R3                      ; 57C1   037B 0057
        RLC     R2,     1                       ; 57C3   0052
        ADDI    #$0013, R0                      ; 57C4   02F8 0013
        CMPR    R5,     R0                      ; 57C6   0168
        RLC     R2,     1                       ; 57C7   0052
        CMPI    #$0014, R0                      ; 57C8   0378 0014
        RLC     R2,     1                       ; 57CA   0052
        CMPI    #$0078, R0                      ; 57CB   0378 0078
        RLC     R2,     1                       ; 57CD   0052
        CMPI    #$0082, R0                      ; 57CE   0378 0082
        RLC     R2,     1                       ; 57D0   0052
        PULR    R7                              ; 57D1   02B7

L_57D2:
        PSHR    R5                              ; 57D2   0275
        MVI     G_015D, R0                      ; 57D3   0280 015D
        CMPI    #$000C, R0                      ; 57D5   0378 000C
        BNEQ    L_57ED                          ; 57D7   020C 0014

        MVI     G_0163, R0                      ; 57D9   0280 0163
        TSTR    R0                              ; 57DB   0080
        BNEQ    L_57E4                          ; 57DC   020C 0006

        MVI     G_0162, R0                      ; 57DE   0280 0162
        CMPI    #$0005, R0                      ; 57E0   0378 0005
        BLE     L_5815                          ; 57E2   0206 0031

L_57E4:
        MVI     G_0173, R0                      ; 57E4   0280 0173
        CMPI    #$0014, R0                      ; 57E6   0378 0014
        BGE     L_5815                          ; 57E8   020D 002B

        INCR    R0                              ; 57EA   0008
        MVO     R0,     G_0173                  ; 57EB   0240 0173
L_57ED:
        MVI     G_017E, R2                      ; 57ED   0282 017E
        SARC    R2,     1                       ; 57EF   007A
        BC      L_5815                          ; 57F0   0201 0023

        MVII    #$0162, R4                      ; 57F2   02BC 0162
        MVI@    R4,     R1                      ; 57F4   02A1
        DECR    R4                              ; 57F5   0014
        SDBD                                    ; 57F6   0001
        MVI@    R4,     R0                      ; 57F7   02A0
        TSTR    R1                              ; 57F8   0089
        BNEQ    L_57FD                          ; 57F9   020C 0002

        SUBI    #$00C4, R0                      ; 57FB   0338 00C4
L_57FD:
        DECR    R0                              ; 57FD   0010
        MVO     R0,     G_0162                  ; 57FE   0240 0162
        SWAP    R0,     1                       ; 5800   0040
        MVO     R0,     G_0163                  ; 5801   0240 0163
        BNEQ    L_5815                          ; 5803   020C 0010

        MVII    #$0003, R0                      ; 5805   02B8 0003
        MVO     R0,     G_017E                  ; 5807   0240 017E

        JSR     R5,     L_6FDE                  ; 5809   0004 016C 03DE

        MVI     G_015D, R0                      ; 580C   0280 015D
        CMPI    #$0004, R0                      ; 580E   0378 0004
        BGT     L_5815                          ; 5810   020E 0003

        JSR     R5,     L_5117                  ; 5812   0004 0150 0117

L_5815:
        PULR    R7                              ; 5815   02B7

L_5816:
        MVI     G_017E, R0                      ; 5816   0280 017E
        ANDI    #$00FE, R0                      ; 5818   03B8 00FE
        XORI    #$0001, R0                      ; 581A   03F8 0001
        MVO     R0,     G_017E                  ; 581C   0240 017E
        MOVR    R5,     R7                      ; 581E   00AF

L_581F:
        MVI     G_017F, R0                      ; 581F   0280 017F
        ANDI    #$0003, R0                      ; 5821   03B8 0003
        BEQ     L_5692                          ; 5823   0224 0192

        MVI     .PSG0.rgt_hand,R0               ; 5825   0280 01FE
        COMR    R0                              ; 5827   0018
        MVO     R0,     G_0124                  ; 5828   0240 0124
        MVI     .PSG0.lft_hand,R0               ; 582A   0280 01FF
        COMR    R0                              ; 582C   0018
        MVO     R0,     G_0123                  ; 582D   0240 0123
        MOVR    R5,     R7                      ; 582F   00AF

L_5830:
        PSHR    R5                              ; 5830   0275
        DECLE   $0010,  $020C,  $026D,  $03C1   ; 5831   0010 020C 026D 03C1
        DECLE   $015E,  $0204,  $0269,  $0280   ; 5835   015E 0204 0269 0280
        DECLE   $0165,  $03F8,  $000C,  $03B8   ; 5839   0165 03F8 000C 03B8
        DECLE   $000C,  $020C,  $0261,  $0280   ; 583D   000C 020C 0261 0280
        DECLE   $015F,  $0008,  $0240,  $015F   ; 5841   015F 0008 0240 015F
        DECLE   $0004                           ; 5845   0004

        ANDR    R3,     R4                      ; 5846   019C
        ANDR    R2,     R4                      ; 5847   0194

        JSR     R5,     L_58A2                  ; 5848   0004 0158 00A2

        MVII    #$0001, R0                      ; 584B   02B8 0001

        JSR     R5,     L_5B51                  ; 584D   0004 0158 0351

        MVII    #$0002, R0                      ; 5850   02B8 0002

        JSR     R5,     L_5B51                  ; 5852   0004 0158 0351
        JSR     R5,     L_5618                  ; 5855   0004 0154 0218
        DECLE   $0006                           ; 5858   0006

        MVII    #$0003, R0                      ; 5859   02B8 0003
        MVO     R0,     G_0165                  ; 585B   0240 0165
        MVI     G_015E, R0                      ; 585D   0280 015E
        MVO     R0,     G_016B                  ; 585F   0240 016B
        MVI     G_017C, R0                      ; 5861   0280 017C

        JSR     R5,     L_672D                  ; 5863   0004 0164 032D

        BNC     L_586B                          ; 5866   0209 0003

        NEGR    R0                              ; 5868   0020
        ADDI    #$0064, R0                      ; 5869   02F8 0064
L_586B:
        MVO     R0,     G_016C                  ; 586B   0240 016C
        CLRR    R0                              ; 586D   01C0
        MVO     R0,     G_017E                  ; 586E   0240 017E
        MVO     R0,     G_0178                  ; 5870   0240 0178

        JSR     R5,     L_53BB                  ; 5872   0004 0150 03BB

        MVI     G_031D, R5                      ; 5875   0285 031D
        XORI    #$0007, R5                      ; 5877   03FD 0007
        MVO     R5,     G_031D                  ; 5879   0245 031D
        CLRR    R0                              ; 587B   01C0

        JSR     R5,     .EXEC.772               ; 587C   0004 0114 0372

        SWAP    R2,     1                       ; 587F   0042
        XORR    R3,     R2                      ; 5880   01DA
        MVII    #$0034, R0                      ; 5881   02B8 0034
        SWAP    R0,     1                       ; 5883   0040
        MVO     R0,     G_0320                  ; 5884   0240 0320
        MVII    #$001A, R0                      ; 5886   02B8 001A

        JSR     R5,     L_5163                  ; 5888   0004 0150 0163

        ADDI    #$0022, R0                      ; 588B   02F8 0022
        SWAP    R0,     1                       ; 588D   0040
        MVO     R0,     G_031F                  ; 588E   0240 031F
        MVII    #$003C, R3                      ; 5890   02BB 003C

        JSR     R5,     .EXEC.9A1               ; 5892   0004 0118 01A1

        PULR    R7                              ; 5895   02B7

L_5896:
        PSHR    R5                              ; 5896   0275

        JSR     R5,     L_563C                  ; 5897   0004 0154 023C

        MVII    #$0199, R4                      ; 589A   02BC 0199
        MVII    #$0029, R0                      ; 589C   02B8 0029

        JSR     R5,     X_FILL_ZERO             ; 589E   0004 0114 0338

        INCR    R7                              ; 58A1   000F

L_58A2:
        PSHR    R5                              ; 58A2   0275

L_58A3:
        JSR     R4,     L_58B6                  ; 58A3   0004 0058 00B6
        BIDECLE $9D42                           ; 58A6   0042 009D

        GSWD    R3                              ; 58A8   0033
        MOVR    R3,     R5                      ; 58A9   009D
        GSWD    R3                              ; 58AA   0033
        MOVR    R3,     R5                      ; 58AB   009D
        GSWD    R3                              ; 58AC   0033
        MOVR    R3,     R5                      ; 58AD   009D
        SWAP    R2,     1                       ; 58AE   0042
        MOVR    R3,     R5                      ; 58AF   009D
        INCR    R3                              ; 58B0   000B
        MOVR    R3,     R5                      ; 58B1   009D
        INCR    R3                              ; 58B2   000B
        MOVR    R3,     R5                      ; 58B3   009D
        EIS                                     ; 58B4   0002
        MOVR    R3,     R5                      ; 58B5   009D
L_58B6:
        MVII    #$031E, R1                      ; 58B6   02B9 031E
        CLRR    R0                              ; 58B8   01C0
        MVI     G_0168, R3                      ; 58B9   0283 0168
L_58BB:
        SDBD                                    ; 58BB   0001
        MVI@    R4,     R2                      ; 58BC   02A2
        SARC    R3,     1                       ; 58BD   007B
        BC      L_58C9                          ; 58BE   0201 0009

        MVO@    R2,     R1                      ; 58C0   024A
        ADDI    #$0005, R1                      ; 58C1   02F9 0005
        MOVR    R0,     R5                      ; 58C3   0085
        ANDI    #$0003, R5                      ; 58C4   03BD 0003
        MVO@    R5,     R1                      ; 58C6   024D
        SUBI    #$0005, R1                      ; 58C7   0339 0005
L_58C9:
        ADDI    #$0008, R1                      ; 58C9   02F9 0008
        INCR    R0                              ; 58CB   0008
        CMPI    #$0008, R0                      ; 58CC   0378 0008
        BNEQ    L_58BB                          ; 58CE   022C 0014

        MVI     G_01C6, R0                      ; 58D0   0280 01C6
        ANDI    #$0001, R0                      ; 58D2   03B8 0001
        BEQ     L_58E0                          ; 58D4   0204 000A

        SDBD                                    ; 58D6   0001
        MVII    #$9D52, R0                      ; 58D7   02B8 0052 009D
        MVO     R0,     G_033E                  ; 58DA   0240 033E
        MVII    #$0001, R0                      ; 58DC   02B8 0001
        MVO     R0,     G_0343                  ; 58DE   0240 0343
L_58E0:
        MVI     G_01C6, R0                      ; 58E0   0280 01C6
        ANDI    #$0002, R0                      ; 58E2   03B8 0002
        BEQ     L_58F0                          ; 58E4   0204 000A

        SDBD                                    ; 58E6   0001
        MVII    #$9D5B, R0                      ; 58E7   02B8 005B 009D
        MVO     R0,     G_031E                  ; 58EA   0240 031E
        MVII    #$0001, R0                      ; 58EC   02B8 0001
        MVO     R0,     G_0323                  ; 58EE   0240 0323
L_58F0:
        PULR    R7                              ; 58F0   02B7

        DECLE   $004F,  $0075,  $0074,  $0020   ; 58F1   004F 0075 0074 0020
        DECLE   $006F,  $0066,  $0020,  $0042   ; 58F5   006F 0066 0020 0042
        DECLE   $006F,  $0075,  $006E,  $0064   ; 58F9   006F 0075 006E 0064
        DECLE   $0073,  $0000                   ; 58FD   0073 0000
L_58FF:
        PSHR    R5                              ; 58FF   0275
        MVI     G_017F, R5                      ; 5900   0285 017F
        ANDI    #$0004, R5                      ; 5902   03BD 0004
        BEQ     L_5AA1                          ; 5904   0204 019B

        JSR     R5,     L_57B3                  ; 5906   0004 0154 03B3

        MVI     G_0199, R1                      ; 5909   0281 0199
        CMPI    #$0003, R1                      ; 590B   0379 0003
        BNEQ    L_5918                          ; 590D   020C 0009

        SUBI    #$0013, R0                      ; 590F   0338 0013
        CMP     G_0197, R0                      ; 5911   0340 0197
        BLE     L_5918                          ; 5913   0206 0003

        CLRR    R1                              ; 5915   01C9
        MVO     R1,     G_0199                  ; 5916   0241 0199
L_5918:
        SARC    R2,     2                       ; 5918   007E
        BOV     L_5A27                          ; 5919   0202 010C

        SARC    R2,     2                       ; 591B   007E
        BNOV    L_5A00                          ; 591C   020A 00E2
        BEQ     L_5931                          ; 591E   0204 0011

        SDBD                                    ; 5920   0001
        MVII    #$58F1, R1                      ; 5921   02B9 00F1 0058

        JSR     R5,     L_5AA2                  ; 5924   0004 0158 02A2
        JSR     R5,     L_5A82                  ; 5927   0004 0158 0282
        JSR     R5,     L_596F                  ; 592A   0004 0158 016F
        JSR     R5,     L_5816                  ; 592D   0004 0158 0016

        PULR    R7                              ; 5930   02B7
L_5931:
        BNC     L_5AA1                          ; 5931   0209 016E

        MVO     R2,     G_0167                  ; 5933   0242 0167
        PULR    R7                              ; 5935   02B7

L_5936:
        PSHR    R5                              ; 5936   0275
        PSHR    R0                              ; 5937   0270
        MVI     G_016B, R0                      ; 5938   0280 016B
        XOR     G_015E, R0                      ; 593A   03C0 015E
        SARC    R0,     2                       ; 593C   007C
        BOV     L_596D                          ; 593D   0202 002E
        BC      L_5967                          ; 593F   0201 0026

        PSHR    R4                              ; 5941   0274
        MVII    #$01D8, R4                      ; 5942   02BC 01D8
        SARC    R0,     1                       ; 5944   0078
        BC      L_5949                          ; 5945   0201 0002

        MVII    #$01DC, R4                      ; 5947   02BC 01DC
L_5949:
        ADD     G_015E, R4                      ; 5949   02C4 015E
        ADD     G_015E, R4                      ; 594B   02C4 015E
        SARC    R0,     2                       ; 594D   007C
        BC      L_595D                          ; 594E   0201 000D
        BOV     L_595A                          ; 5950   0202 0008

        MVI     G_017C, R0                      ; 5952   0280 017C

        JSR     R5,     L_672D                  ; 5954   0004 0164 032D

        BNC     L_595C                          ; 5957   0209 0003

        NEGR    R0                              ; 5959   0020
L_595A:
        ADDI    #$0064, R0                      ; 595A   02F8 0064
L_595C:
        NEGR    R0                              ; 595C   0020
L_595D:
        ADD     G_016C, R0                      ; 595D   02C0 016C
        SDBD                                    ; 595F   0001
        ADD@    R4,     R0                      ; 5960   02E0
        SUBI    #$0002, R4                      ; 5961   033C 0002
        MVO@    R0,     R4                      ; 5963   0260
        SWAP    R0,     1                       ; 5964   0040
        MVO@    R0,     R4                      ; 5965   0260
        PULR    R4                              ; 5966   02B4
L_5967:
        MVI     G_016B, R0                      ; 5967   0280 016B
        XORI    #$0002, R0                      ; 5969   03F8 0002
        MVO     R0,     G_016B                  ; 596B   0240 016B
L_596D:
        PULR    R0                              ; 596D   02B0
        PULR    R7                              ; 596E   02B7

L_596F:
        PSHR    R5                              ; 596F   0275

        JSR     R5,     L_57B3                  ; 5970   0004 0154 03B3

        MVO     R4,     G_017C                  ; 5973   0244 017C
        SARC    R2,     2                       ; 5975   007E
        BOV     L_5A2C                          ; 5976   0202 00B4

        SARC    R2,     1                       ; 5978   007A
        BNC     L_5A03                          ; 5979   0209 0088

        JSR     R5,     L_5936                  ; 597B   0004 0158 0136

        INCR    R7                              ; 597E   000F

L_597F:
        PSHR    R5                              ; 597F   0275

L_5980:
        JSR     R5,     L_5559                  ; 5980   0004 0154 0159
        JSR     R5,     X_PLAY_WHST1            ; 5983   0004 011C 031B
        JSR     R5,     .EXEC.A61               ; 5986   0004 0118 0261

        DECR    R4                              ; 5989   0014
        INCR    R7                              ; 598A   000F

L_598B:
        PSHR    R5                              ; 598B   0275
L_598C:
        MVI     G_015F, R3                      ; 598C   0283 015F
        TSTR    R3                              ; 598E   009B
        BEQ     L_59B9                          ; 598F   0204 0028

        JSR     R5,     L_59EF                  ; 5991   0004 0158 01EF

        CMPR    R0,     R1                      ; 5994   0141
        BGT     L_59B0                          ; 5995   020E 0019
        BNEQ    L_59A7                          ; 5997   020C 000E

        MVI     G_016B, R5                      ; 5999   0285 016B
        ANDI    #$0004, R5                      ; 599B   03BD 0004
        BEQ     L_59A7                          ; 599D   0204 0008

        MVII    #$0001, R0                      ; 599F   02B8 0001

        JSR     R5,     X_RAND1                 ; 59A1   0004 0114 027D

        SARC    R0,     1                       ; 59A4   0078
        BC      L_59B0                          ; 59A5   0201 0009

L_59A7:
        CMPI    #$0004, R3                      ; 59A7   037B 0004
        BLT     L_59C6                          ; 59A9   0205 001B

L_59AB:
        JSR     R5,     L_5896                  ; 59AB   0004 0158 0096

        B       L_59B9                          ; 59AE   0200 0009

L_59B0:
        MVII    #$01E0, R3                      ; 59B0   02BB 01E0
        ADD     G_015E, R3                      ; 59B2   02C3 015E
        MVI@    R3,     R5                      ; 59B4   029D
        INCR    R5                              ; 59B5   000D
        MVO@    R5,     R3                      ; 59B6   025D
        B       L_59BC                          ; 59B7   0200 0003

L_59B9:
        JSR     R5,     L_5816                  ; 59B9   0004 0158 0016

L_59BC:
        CLRR    R3                              ; 59BC   01DB
        MVO     R3,     G_015F                  ; 59BD   0243 015F

        JSR     R5,     L_5559                  ; 59BF   0004 0154 0159

        MVI     G_017C, R0                      ; 59C2   0280 017C
        MVO     R0,     G_0182                  ; 59C4   0240 0182

L_59C6:
        JSR     R5,     L_59EF                  ; 59C6   0004 0158 01EF

        CMPI    #$0064, R0                      ; 59C9   0378 0064
        BLT     L_59CF                          ; 59CB   0205 0002

        COMR    R0                              ; 59CD   0018
        INCR    R7                              ; 59CE   000F

L_59CF:
        SUBR    R1,     R0                      ; 59CF   0108
L_59D0:
        MVO     R0,     G_017D                  ; 59D0   0240 017D

        JSR     R5,     L_5618                  ; 59D2   0004 0154 0218
        DECLE   $0000,  $0280,  $017E,  $03B8   ; 59D5   0000 0280 017E 03B8
        DECLE   $0002,  $020C,  $000B,  $0280   ; 59D9   0002 020C 000B 0280
        DECLE   $0164,  $0080,  $020C,  $000A   ; 59DD   0164 0080 020C 000A

        JSR     R5,     L_5278                  ; 59E1   0004 0150 0278
        BIDECLE $5102                           ; 59E4   0002 0051

        PULR    R7                              ; 59E6   02B7

        JSR     R5,     L_5117                  ; 59E7   0004 0150 0117

        PULR    R7                              ; 59EA   02B7

        DECLE   $0004                           ; 59EB   0004

        ANDR    R2,     R4                      ; 59EC   0194
        ADCR    R5                              ; 59ED   002D
        PULR    R7                              ; 59EE   02B7

L_59EF:
        PSHR    R5                              ; 59EF   0275
        MVI     G_017C, R0                      ; 59F0   0280 017C

        JSR     R5,     L_5163                  ; 59F2   0004 0150 0163

        MOVR    R0,     R1                      ; 59F5   0081
        MVO     R0,     G_0197                  ; 59F6   0240 0197
        MVI     G_0182, R0                      ; 59F8   0280 0182

        JSR     R5,     L_5163                  ; 59FA   0004 0150 0163

        ADDI    #$000A, R0                      ; 59FD   02F8 000A
        PULR    R7                              ; 59FF   02B7

L_5A00:
        JSR     R5,     L_5A82                  ; 5A00   0004 0158 0282
L_5A03:
        JSR     R5,     X_PLAY_WHST1            ; 5A03   0004 011C 031B

        MVI     G_0167, R0                      ; 5A06   0280 0167
        TSTR    R0                              ; 5A08   0080
        BNEQ    L_5A75                          ; 5A09   020C 006A

        MVII    #$017A, R1                      ; 5A0B   02B9 017A
        SUB     G_015E, R1                      ; 5A0D   0301 015E
        MVI     G_016B, R0                      ; 5A0F   0280 016B
        XORI    #$0010, R0                      ; 5A11   03F8 0010
        MVO     R0,     G_016B                  ; 5A13   0240 016B

        JSR     R5,     L_5936                  ; 5A15   0004 0158 0136

        MVII    #$0002, R0                      ; 5A18   02B8 0002

        JSR     R4,     L_5A51                  ; 5A1A   0004 0058 0251
        DECLE   $0020,  $0020,  $0020,  $0053   ; 5A1D   0020 0020 0020 0053
        DECLE   $0041,  $0046,  $0045,  $0054   ; 5A21   0041 0046 0045 0054
        DECLE   $0059,  $0000                   ; 5A25   0059 0000
L_5A27:
        MVII    #$0329, R4                      ; 5A27   02BC 0329

        JSR     R5,     L_5A84                  ; 5A29   0004 0158 0284

L_5A2C:
        MVI     G_016B, R0                      ; 5A2C   0280 016B
        XORI    #$0008, R0                      ; 5A2E   03F8 0008
        MVO     R0,     G_016B                  ; 5A30   0240 016B

        JSR     R5,     L_5936                  ; 5A32   0004 0158 0136
        JSR     R4,     L_5A45                  ; 5A35   0004 0058 0245
        DECLE   $0007,  $0054,  $004F,  $0055   ; 5A38   0007 0054 004F 0055
        DECLE   $0043,  $0048,  $0044,  $004F   ; 5A3C   0043 0048 0044 004F
        DECLE   $0057,  $004E,  $0020,  $0021   ; 5A40   0057 004E 0020 0021
        DECLE   $0000                           ; 5A44   0000
L_5A45:
        PSHR    R4                              ; 5A45   0274
        MVII    #$0005, R0                      ; 5A46   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 5A48   0004 011C 02D5

        MVII    #$0179, R1                      ; 5A4B   02B9 0179
        ADD     G_015E, R1                      ; 5A4D   02C1 015E
        PULR    R4                              ; 5A4F   02B4
        MVI@    R4,     R0                      ; 5A50   02A0
L_5A51:
        MVI@    R1,     R2                      ; 5A51   028A
        ADDR    R0,     R2                      ; 5A52   00C2
        MVO@    R2,     R1                      ; 5A53   024A
        MOVR    R4,     R1                      ; 5A54   00A1

        JSR     R5,     L_5AA2                  ; 5A55   0004 0158 02A2
        JSR     R5,     L_5618                  ; 5A58   0004 0154 0218
        DECLE   $0009                           ; 5A5B   0009

        JSR     R5,     .EXEC.A61               ; 5A5C   0004 0118 0261

        COMR    R6                              ; 5A5F   001E

        JSR     R5,     L_5A82                  ; 5A60   0004 0158 0282

        MVII    #$000A, R0                      ; 5A63   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5A65   0004 011C 02D5

        MVII    #$0050, R0                      ; 5A68   02B8 0050

        JSR     R5,     L_5163                  ; 5A6A   0004 0150 0163

        MVO     R0,     G_017C                  ; 5A6D   0240 017C
        MVII    #$0001, R0                      ; 5A6F   02B8 0001
        MVO     R0,     G_0164                  ; 5A71   0240 0164
        B       L_59AB                          ; 5A73   0220 00C9

L_5A75:
        JSR     R5,     .EXEC.A61               ; 5A75   0004 0118 0261

        INCR    R2                              ; 5A78   000A
        MVII    #$0014, R0                      ; 5A79   02B8 0014

        JSR     R5,     L_5163                  ; 5A7B   0004 0150 0163

        MVO     R0,     G_017C                  ; 5A7E   0240 017C
        B       L_59B9                          ; 5A80   0220 00C8

L_5A82:
        MVII    #$0321, R4                      ; 5A82   02BC 0321
L_5A84:
        PSHR    R5                              ; 5A84   0275
        MVII    #$0008, R2                      ; 5A85   02BA 0008
        CLRR    R0                              ; 5A87   01C0
        MVI     G_0168, R3                      ; 5A88   0283 0168
L_5A8A:
        MVO@    R0,     R4                      ; 5A8A   0260
        SARC    R3,     1                       ; 5A8B   007B
        BNC     L_5A90                          ; 5A8C   0209 0002

        MVO@    R0,     R4                      ; 5A8E   0260
        INCR    R7                              ; 5A8F   000F

L_5A90:
        MVO@    R2,     R4                      ; 5A90   0262
L_5A91:
        MVO@    R0,     R4                      ; 5A91   0260
        ADDI    #$0005, R4                      ; 5A92   02FC 0005
        CMPI    #$035D, R4                      ; 5A94   037C 035D
        BLT     L_5A8A                          ; 5A96   0225 000D

        MVO     R3,     G_01E2                  ; 5A98   0243 01E2

        JSR     R5,     L_5618                  ; 5A9A   0004 0154 0218
        DECLE   $0000                           ; 5A9D   0000

        JSR     R5,     L_568C                  ; 5A9E   0004 0154 028C

L_5AA1:
        PULR    R7                              ; 5AA1   02B7

L_5AA2:
        PSHR    R5                              ; 5AA2   0275
        MVII    #$0013, R0                      ; 5AA3   02B8 0013
        MVII    #$02DD, R4                      ; 5AA5   02BC 02DD

        JSR     R5,     X_FILL_ZERO             ; 5AA7   0004 0114 0338

        MVII    #$0010, R0                      ; 5AAA   02B8 0010
        MVII    #$0007, R3                      ; 5AAC   02BB 0007
        MVII    #$02E0, R4                      ; 5AAE   02BC 02E0

        JSR     R5,     X_PRPAD_R1              ; 5AB0   0004 0118 006C

        PULR    R7                              ; 5AB3   02B7

        PSHR    R5                              ; 5AB4   0275
        MVI     G_015D, R5                      ; 5AB5   0285 015D
        CMPI    #$0007, R5                      ; 5AB7   037D 0007
        BEQ     L_5BD1                          ; 5AB9   0204 0116

        MVI     G_0169, R5                      ; 5ABB   0285 0169
        DECR    R5                              ; 5ABD   0015
        BMI     L_5AEE                          ; 5ABE   020B 002E
        BNEQ    L_5B18                          ; 5AC0   020C 0056

        JSR     R5,     L_534B                  ; 5AC2   0004 0150 034B

        MVII    #$0001, R0                      ; 5AC5   02B8 0001
        MVO     R0,     G_035B                  ; 5AC7   0240 035B
        MVII    #$0007, R0                      ; 5AC9   02B8 0007
        MVII    #$0004, R3                      ; 5ACB   02BB 0004

        JSR     R5,     L_5D86                  ; 5ACD   0004 015C 0186
        JSR     R5,     L_57B4                  ; 5AD0   0004 0154 03B4

        ANDI    #$000C, R2                      ; 5AD3   03BA 000C
        BEQ     L_5ADA                          ; 5AD5   0204 0003

        INCR    R2                              ; 5AD7   000A
        MVO     R2,     G_0167                  ; 5AD8   0242 0167
L_5ADA:
        CLRR    R0                              ; 5ADA   01C0
        MVO     R0,     G_0168                  ; 5ADB   0240 0168

        JSR     R5,     L_5896                  ; 5ADD   0004 0158 0096

        CLRR    R0                              ; 5AE0   01C0
        MVO     R0,     G_015F                  ; 5AE1   0240 015F

        JSR     R5,     L_5618                  ; 5AE3   0004 0154 0218
        DECLE   $0005,  $0004                   ; 5AE6   0005 0004

        ANDR    R3,     R4                      ; 5AE8   019C
        CMPR    R4,     R2                      ; 5AE9   0162
        MVII    #$000A, R0                      ; 5AEA   02B8 000A
        B       L_5E6A                          ; 5AEC   0200 037C

L_5AEE:
        JSR     R5,     L_534B                  ; 5AEE   0004 0150 034B
        JSR     R5,     L_565E                  ; 5AF1   0004 0154 025E

        INCR    R2                              ; 5AF4   000A
        MVII    #$0005, R0                      ; 5AF5   02B8 0005
        MVI     G_0199, R5                      ; 5AF7   0285 0199
        CMPI    #$0002, R5                      ; 5AF9   037D 0002
        BEQ     L_5B12                          ; 5AFB   0204 0015

        CMPI    #$0004, R5                      ; 5AFD   037D 0004
        BNEQ    L_5B14                          ; 5AFF   020C 0013

        MVII    #$000F, R2                      ; 5B01   02BA 000F
        MVO     R2,     G_033B                  ; 5B03   0242 033B
        MVII    #$0020, R2                      ; 5B05   02BA 0020

        JSR     R5,     L_672D                  ; 5B07   0004 0164 032D

        BC      L_5B0F                          ; 5B0A   0201 0003

        NEGR    R2                              ; 5B0C   0022
        ANDI    #$00FF, R2                      ; 5B0D   03BA 00FF
L_5B0F:
        SWAP    R2,     1                       ; 5B0F   0042
        MVO     R2,     G_0339                  ; 5B10   0242 0339
L_5B12:
        MVII    #$000B, R0                      ; 5B12   02B8 000B

L_5B14:
        JSR     R5,     L_5619                  ; 5B14   0004 0154 0219

        PULR    R7                              ; 5B17   02B7

L_5B18:
        MVI     G_0199, R5                      ; 5B18   0285 0199
        CMPI    #$0002, R5                      ; 5B1A   037D 0002
        BEQ     L_5B32                          ; 5B1C   0204 0014

        JSR     R5,     L_5336                  ; 5B1E   0004 0150 0336
        JSR     R5,     L_5163                  ; 5B21   0004 0150 0163

        CMPI    #$006D, R0                      ; 5B24   0378 006D
        MVII    #$0000, R0                      ; 5B26   02B8 0000
        BGE     L_5BD1                          ; 5B28   020D 00A7

        JSR     R5,     L_534B                  ; 5B2A   0004 0150 034B

        MOVR    R7,     R1                      ; 5B2D   00B9
        ADDI    #$0097, R1                      ; 5B2E   02F9 0097
        B       L_5C03                          ; 5B30   0200 00D1

L_5B32:
        MVII    #$0006, R0                      ; 5B32   02B8 0006
        MVO     R0,     G_0323                  ; 5B34   0240 0323
        MVII    #$000E, R0                      ; 5B36   02B8 000E

        JSR     R5,     X_CLR_BIT               ; 5B38   0004 0114 02E6

        CMP@    R2,     R5                      ; 5B3B   0355
        MVII    #$0001, R0                      ; 5B3C   02B8 0001
        MVO     R0,     G_0169                  ; 5B3E   0240 0169
        PULR    R7                              ; 5B40   02B7

L_5B41:
        PSHR    R5                              ; 5B41   0275
        DECLE   $0034,  $0270,  $0272,  $0004   ; 5B42   0034 0270 0272 0004
        DECLE   $01A4,  $0225,  $0003           ; 5B46   01A4 0225 0003

        MVI@    R4,     R2                      ; 5B49   02A2

        JSR     R5,     L_6706                  ; 5B4A   0004 0164 0306

        MOVR    R0,     R4                      ; 5B4D   0084
        PULR    R2                              ; 5B4E   02B2
        PULR    R0                              ; 5B4F   02B0
        PULR    R7                              ; 5B50   02B7

L_5B51:
        PSHR    R5                              ; 5B51   0275
        MVI     G_0199, R2                      ; 5B52   0282 0199
        INCR    R2                              ; 5B54   000A
        ADDR    R7,     R2                      ; 5B55   00FA
        ADD@    R2,     R7                      ; 5B56   02D7

        DECLE   $0110,  $0110,  $000E,  $0012   ; 5B57   0110 0110 000E 0012
        DECLE   $0005                           ; 5B5B   0005

        SDBD                                    ; 5B5C   0001
        MVII    #$9D4B, R0                      ; 5B5D   02B8 004B 009D
        MVO     R0,     G_0336                  ; 5B60   0240 0336
        CLRR    R0                              ; 5B62   01C0
        MVO     R0,     G_033B                  ; 5B63   0240 033B
        CLRR    R0                              ; 5B65   01C0
        MVO     R0,     G_035B                  ; 5B66   0240 035B
        PULR    R7                              ; 5B68   02B7

        DECLE   $0004,  $01AC,  $03E7           ; 5B69   0004 01AC 03E7

        BC      L_5C67                          ; 5B6C   0201 00F9

        MOVR    R0,     R5                      ; 5B6E   0085
        AND     G_01C1, R5                      ; 5B6F   0385 01C1
        BNEQ    L_5B7B                          ; 5B71   020C 0008

        MOVR    R0,     R5                      ; 5B73   0085
        SWAP    R0,     1                       ; 5B74   0040
        SLR     R0,     2                       ; 5B75   0064
        XOR     G_01C6, R0                      ; 5B76   03C0 01C6
        MVO     R0,     G_01C6                  ; 5B78   0240 01C6
        MOVR    R5,     R0                      ; 5B7A   00A8

L_5B7B:
        JSR     R5,     L_5B41                  ; 5B7B   0004 0158 0341

        MVII    #$0326, R5                      ; 5B7E   02BD 0326
        DECR    R0                              ; 5B80   0010
        BEQ     L_5B85                          ; 5B81   0204 0002

        ADDI    #$0008, R5                      ; 5B83   02FD 0008
L_5B85:
        SDBD                                    ; 5B85   0001
        MVII    #$9D42, R0                      ; 5B86   02B8 0042 009D
        MVO@    R0,     R5                      ; 5B89   0268
        ADDI    #$0002, R5                      ; 5B8A   02FD 0002
        MVO@    R4,     R5                      ; 5B8C   026C
        INCR    R5                              ; 5B8D   000D
        MVII    #$0008, R0                      ; 5B8E   02B8 0008
        MVO@    R0,     R5                      ; 5B90   0268
        MVI@    R3,     R0                      ; 5B91   0298
        INCR    R0                              ; 5B92   0008
        MVO@    R0,     R3                      ; 5B93   0258
        PULR    R7                              ; 5B94   02B7

        DECLE   $0275,  $0285,  $0199,  $037D   ; 5B95   0275 0285 0199 037D
        DECLE   $0003,  $0204,  $000C           ; 5B99   0003 0204 000C

        INCR    R1                              ; 5B9C   0009
        SDBD                                    ; 5B9D   0001
        MVII    #$9D33, R0                      ; 5B9E   02B8 0033 009D
        MVO@    R0,     R1                      ; 5BA1   0248
        ADDI    #$0005, R1                      ; 5BA2   02F9 0005
        MVII    #$0004, R0                      ; 5BA4   02B8 0004
        MVO@    R0,     R1                      ; 5BA6   0248
        PULR    R7                              ; 5BA7   02B7

        DECLE   $0004,  $01AC,  $03E7           ; 5BA8   0004 01AC 03E7

        BC      L_5BB0                          ; 5BAB   0201 0003

        CMP@    R3,     R2                      ; 5BAD   035A
        BGT     L_5B7B                          ; 5BAE   022E 0034

L_5BB0:
        CLRR    R2                              ; 5BB0   01D2
        ADDI    #$0004, R1                      ; 5BB1   02F9 0004
        MVO@    R2,     R1                      ; 5BB3   024A
        ADDI    #$0002, R1                      ; 5BB4   02F9 0002
        MVII    #$0004, R2                      ; 5BB6   02BA 0004
        MVO@    R2,     R1                      ; 5BB8   024A
        PULR    R7                              ; 5BB9   02B7

        DECLE   $0049,  $006E,  $0063,  $006F   ; 5BBA   0049 006E 0063 006F
        DECLE   $006D,  $0070,  $006C,  $0065   ; 5BBE   006D 0070 006C 0065
        DECLE   $0074,  $0065,  $0000,  $0020   ; 5BC2   0074 0065 0000 0020
        DECLE   $0020,  $004E,  $006F,  $0020   ; 5BC6   0020 004E 006F 0020
        DECLE   $0047,  $006F,  $006F,  $0064   ; 5BCA   0047 006F 006F 0064
        DECLE   $0021,  $0000                   ; 5BCE   0021 0000

        PSHR    R5                              ; 5BD0   0275

L_5BD1:
        JSR     R5,     .EXEC.772               ; 5BD1   0004 0114 0372

        PSHR    R3                              ; 5BD4   0273

        JSR     R5,     L_534B                  ; 5BD5   0004 0150 034B

        PULR    R3                              ; 5BD8   02B3
        MVI     G_015D, R5                      ; 5BD9   0285 015D
        CMPI    #$0008, R5                      ; 5BDB   037D 0008
        BNEQ    L_5BFF                          ; 5BDD   020C 0020

        SDBD                                    ; 5BDF   0001
        MVII    #$5BC5, R1                      ; 5BE0   02B9 00C5 005B
        CMPI    #$0024, R3                      ; 5BE3   037B 0024
        BLT     L_5C03                          ; 5BE5   0205 001C

        CMPI    #$0045, R3                      ; 5BE7   037B 0045
        BGT     L_5C03                          ; 5BE9   020E 0018

        JSR     R5,     L_5A82                  ; 5BEB   0004 0158 0282
        JSR     R4,     L_5A45                  ; 5BEE   0004 0058 0245
        DECLE   $0003,  $0046,  $0049,  $0045   ; 5BF1   0003 0046 0049 0045
        DECLE   $004C,  $0044,  $0020,  $0047   ; 5BF5   004C 0044 0020 0047
        DECLE   $004F,  $0041,  $004C,  $0000   ; 5BF9   004F 0041 004C 0000

        B       L_5C06                          ; 5BFD   0200 0007

L_5BFF:
        SDBD                                    ; 5BFF   0001
        MVII    #$5BBA, R1                      ; 5C00   02B9 00BA 005B

L_5C03:
        JSR     R5,     L_5AA2                  ; 5C03   0004 0158 02A2
L_5C06:
        JSR     R5,     L_5A82                  ; 5C06   0004 0158 0282
        JSR     R5,     L_597F                  ; 5C09   0004 0158 017F
        JSR     R5,     L_5816                  ; 5C0C   0004 0158 0016

        PULR    R7                              ; 5C0F   02B7

L_5C10:
        MVII    #$0002, R2                      ; 5C10   02BA 0002
        B       L_5C16                          ; 5C12   0200 0002

L_5C14:
        MVII    #$0001, R2                      ; 5C14   02BA 0001
L_5C16:
        PSHR    R5                              ; 5C16   0275
        DECR    R0                              ; 5C17   0010
        BNEQ    L_5C67                          ; 5C18   020C 004D

        XOR     G_015E, R1                      ; 5C1A   03C1 015E
        BEQ     L_5C67                          ; 5C1C   0204 0049

        MVI     G_0199, R5                      ; 5C1E   0285 0199
        INCR    R5                              ; 5C20   000D
        ADDR    R7,     R5                      ; 5C21   00FD
        ADD@    R5,     R7                      ; 5C22   02EF

        DECLE   $0044,  $0044,  $0058,  $0005   ; 5C23   0044 0044 0058 0005

        TSTR    R6                              ; 5C27   00B6
        MVO     R2,     G_019B                  ; 5C28   0242 019B
        CLRR    R0                              ; 5C2A   01C0

        JSR     R5,     L_5336                  ; 5C2B   0004 0150 0336
        JSR     R5,     L_5163                  ; 5C2E   0004 0150 0163
        DECLE   $0340,  $0197,  $020E,  $0032   ; 5C31   0340 0197 020E 0032
        DECLE   $0280,  $019B,  $0004,  $01AC   ; 5C35   0280 019B 0004 01AC
        DECLE   $03E7,  $0209,  $000E,  $03F8   ; 5C39   03E7 0209 000E 03F8
        DECLE   $0003,  $0004,  $01AC,  $03E7   ; 5C3D   0003 0004 01AC 03E7
        DECLE   $0209,  $0007,  $0281,  $015E   ; 5C41   0209 0007 0281 015E
        DECLE   $0004                           ; 5C45   0004

        ANDR    R3,     R4                      ; 5C46   019C
        CMPR    R6,     R4                      ; 5C47   0174
        B       L_5C67                          ; 5C48   0200 001D

        MVO     R0,     G_019B                  ; 5C4A   0240 019B
        MVI     G_016B, R0                      ; 5C4C   0280 016B
        XORI    #$0004, R0                      ; 5C4E   03F8 0004
        MVO     R0,     G_016B                  ; 5C50   0240 016B
        CLRR    R0                              ; 5C52   01C0
        MVO     R0,     G_0199                  ; 5C53   0240 0199
        MVI     G_019B, R3                      ; 5C55   0283 019B

        JSR     R5,     L_5D86                  ; 5C57   0004 015C 0186

        MVI     G_019B, R0                      ; 5C5A   0280 019B
        CLRR    R3                              ; 5C5C   01DB

        JSR     R5,     L_5D33                  ; 5C5D   0004 015C 0133
        JSR     R5,     L_5618                  ; 5C60   0004 0154 0218
        DECLE   $0007                           ; 5C63   0007

        JSR     R5,     L_6FE9                  ; 5C64   0004 016C 03E9

L_5C67:
        PULR    R7                              ; 5C67   02B7

L_5C68:
        MVI     G_015D, R3                      ; 5C68   0283 015D
        DECLE   $033B,  $000B,  $022C,  $0006   ; 5C6A   033B 000B 022C 0006
        DECLE   $0275,  $0004                   ; 5C6E   0275 0004

        ANDR    R3,     R4                      ; 5C70   019C
        CMPR    R4,     R5                      ; 5C71   0165

        JSR     R5,     L_5618                  ; 5C72   0004 0154 0218
        DECLE   $0008                           ; 5C75   0008

        CLRR    R0                              ; 5C76   01C0

        JSR     R5,     L_53BB                  ; 5C77   0004 0150 03BB

        PULR    R7                              ; 5C7A   02B7

        JSR     R5,     L_5C68                  ; 5C7B   0004 015C 0068

        MVI     G_0178, R0                      ; 5C7E   0280 0178
        SUBI    #$000C, R0                      ; 5C80   0338 000C

        JSR     R5,     X_CLAMP                 ; 5C82   0004 0114 0270
        DECLE   $0000                           ; 5C85   0000
L_5C86:
        COMR    R0                              ; 5C86   0018
        SUBI    #$000C, R0                      ; 5C87   0338 000C
        BLE     L_5C8C                          ; 5C89   0206 0001

        NEGR    R0                              ; 5C8B   0020
L_5C8C:
        ADDI    #$000C, R0                      ; 5C8C   02F8 000C
        DECLE   $0081,  $00C0,  $00C8,  $0081   ; 5C8E   0081 00C0 00C8 0081
        DECLE   $0004                           ; 5C92   0004

        ANDR    R4,     R4                      ; 5C93   01A4
        BLT     L_5C86                          ; 5C94   0225 000F

        ADDR    R0,     R1                      ; 5C96   00C1

        JSR     R5,     X_RAND2                 ; 5C97   0004 0114 029E

        ADDR    R0,     R1                      ; 5C9A   00C1
        CMPI    #$0012, R1                      ; 5C9B   0379 0012
        BGE     L_5CA1                          ; 5C9D   020D 0002

        MVII    #$0012, R1                      ; 5C9F   02B9 0012
L_5CA1:
        MOVR    R1,     R0                      ; 5CA1   0088
        ADD     G_0197, R0                      ; 5CA2   02C0 0197
        SLL     R1,     1                       ; 5CA4   0049
        CMPI    #$006E, R0                      ; 5CA5   0378 006E
        BLT     L_5CAE                          ; 5CA7   0205 0005

        MVII    #$006D, R1                      ; 5CA9   02B9 006D
        SUB     G_0197, R1                      ; 5CAB   0301 0197
        SLL     R1,     1                       ; 5CAD   0049
L_5CAE:
        MVO     R1,     G_0323                  ; 5CAE   0241 0323
        MVII    #$007F, R0                      ; 5CB0   02B8 007F
        SWAP    R0,     1                       ; 5CB2   0040

        JSR     R5,     L_5634                  ; 5CB3   0004 0154 0234

        ADCR    R7                              ; 5CB6   002F

        NEGR    R0                              ; 5CB7   0020
L_5CB8:
        MVO     R0,     G_0321                  ; 5CB8   0240 0321
        MVII    #$0002, R0                      ; 5CBA   02B8 0002
        MVO     R0,     G_0169                  ; 5CBC   0240 0169

        JSR     R5,     L_5413                  ; 5CBE   0004 0154 0013

        MVI     G_0323, R0                      ; 5CC1   0280 0323
        SUBI    #$0006, R0                      ; 5CC3   0338 0006
        MVO     R0,     G_0323                  ; 5CC5   0240 0323
        PULR    R7                              ; 5CC7   02B7

        COMR    R0                              ; 5CC8   0018
        INCR    R4                              ; 5CC9   000C
        CLRC                                    ; 5CCA   0006
        INCR    R0                              ; 5CCB   0008
        INCR    R3                              ; 5CCC   000B
        INCR    R6                              ; 5CCD   000E
        DECR    R1                              ; 5CCE   0011
        DECR    R4                              ; 5CCF   0014
        COMR    R0                              ; 5CD0   0018
        COMR    R4                              ; 5CD1   001C
        NEGR    R0                              ; 5CD2   0020
        NEGR    R4                              ; 5CD3   0024
        ADCR    R0                              ; 5CD4   0028
        ADCR    R4                              ; 5CD5   002C
        GSWD    R0                              ; 5CD6   0030
        NOP                                     ; 5CD7   0034
        RSWD    R0                              ; 5CD8   0038

        JSR     R5,     L_5C68                  ; 5CD9   0004 015C 0068

        SDBD                                    ; 5CDC   0001
        MVII    #$9D33, R0                      ; 5CDD   02B8 0033 009D
        MVO     R0,     G_0336                  ; 5CE0   0240 0336
        MVI     G_033B, R2                      ; 5CE2   0282 033B
L_5CE4:
        SDBD                                    ; 5CE4   0001
        MVII    #$5CC8, R5                      ; 5CE5   02BD 00C8 005C
        ADDR    R2,     R5                      ; 5CE8   00D5
        MVI@    R5,     R0                      ; 5CE9   02A8

        JSR     R5,     L_6719                  ; 5CEA   0004 0164 0319

        SUBR    R0,     R1                      ; 5CED   0101
        MVII    #$007F, R0                      ; 5CEE   02B8 007F

        JSR     R5,     L_5634                  ; 5CF0   0004 0154 0234

        ADCR    R7                              ; 5CF3   002F

        NEGR    R0                              ; 5CF4   0020

L_5CF5:
        JSR     R5,     X_PACK_BYTES            ; 5CF5   0004 0114 034F
        DECLE   $0240,  $0321,  $0004,  $01A4   ; 5CF8   0240 0321 0004 01A4
        DECLE   $0225,  $0011                   ; 5CFC   0225 0011

        PSHR    R0                              ; 5CFE   0270

        JSR     R5,     L_6719                  ; 5CFF   0004 0164 0319

        ADDR    R1,     R0                      ; 5D02   00C8
        ADD@    R6,     R0                      ; 5D03   02F0
        ADDI    #$0028, R0                      ; 5D04   02F8 0028
        MVO     R0,     G_0323                  ; 5D06   0240 0323
        MVII    #$0002, R0                      ; 5D08   02B8 0002
        MVO     R0,     G_0169                  ; 5D0A   0240 0169
        MVII    #$0004, R0                      ; 5D0C   02B8 0004
        MVO     R0,     G_015F                  ; 5D0E   0240 015F

        JSR     R5,     L_5413                  ; 5D10   0004 0154 0013

        PULR    R7                              ; 5D13   02B7

        PSHR    R5                              ; 5D14   0275
        SDBD                                    ; 5D15   0001
        MVII    #$9D33, R0                      ; 5D16   02B8 0033 009D
        MVO     R0,     G_0336                  ; 5D19   0240 0336
        MVI     G_0333, R0                      ; 5D1B   0280 0333
        ANDI    #$0007, R0                      ; 5D1D   03B8 0007
        INCR    R0                              ; 5D1F   0008
        MVO     R0,     G_033B                  ; 5D20   0240 033B
        MVI     G_015D, R2                      ; 5D22   0282 015D
        SUBI    #$000B, R2                      ; 5D24   033A 000B
        BNEQ    L_5D2E                          ; 5D26   020C 0006

        JSR     R5,     L_5C68                  ; 5D28   0004 015C 0068

        CLRR    R2                              ; 5D2B   01D2
        B       L_5CE4                          ; 5D2C   0220 0049

L_5D2E:
        JSR     R5,     L_5618                  ; 5D2E   0004 0154 0218
        DECLE   $0005                           ; 5D31   0005

        PULR    R7                              ; 5D32   02B7

L_5D33:
        PSHR    R5                              ; 5D33   0275
        PSHR    R0                              ; 5D34   0270

        JSR     R5,     L_53BB                  ; 5D35   0004 0150 03BB

        CLRR    R0                              ; 5D38   01C0

        JSR     R5,     .EXEC.772               ; 5D39   0004 0114 0372

        PULR    R0                              ; 5D3C   02B0

        JSR     R5,     .EXEC.76C               ; 5D3D   0004 0114 036C

        PSHR    R1                              ; 5D40   0271
        ADDI    #$0002, R1                      ; 5D41   02F9 0002
        MVI@    R1,     R1                      ; 5D43   0289
        SWAP    R1,     1                       ; 5D44   0041
        ANDI    #$00FF, R1                      ; 5D45   03B9 00FF
        SUBR    R2,     R1                      ; 5D47   0111
        BGE     L_5D4B                          ; 5D48   020D 0001

        NEGR    R1                              ; 5D4A   0021
L_5D4B:
        SLR     R1,     2                       ; 5D4B   0065
        MOVR    R1,     R0                      ; 5D4C   0088
        SLR     R0,     1                       ; 5D4D   0060

        JSR     R5,     L_672D                  ; 5D4E   0004 0164 032D

        ADCR    R7                              ; 5D51   002F

        NEGR    R1                              ; 5D52   0021
L_5D53:
        ADDR    R1,     R2                      ; 5D53   00CA
        MOVR    R0,     R1                      ; 5D54   0081
        SARC    R1,     1                       ; 5D55   0079
        BNC     L_5D59                          ; 5D56   0209 0001

        INCR    R0                              ; 5D58   0008

L_5D59:
        JSR     R5,     X_RAND2                 ; 5D59   0004 0114 029E

        SUBR    R1,     R0                      ; 5D5C   0108
        ADDR    R3,     R0                      ; 5D5D   00D8

        JSR     R5,     X_CLAMP                 ; 5D5E   0004 0114 0270

        INCR    R2                              ; 5D61   000A
        RLC     R3,     2                       ; 5D62   0057
        MOVR    R0,     R3                      ; 5D63   0083
        MOVR    R2,     R0                      ; 5D64   0090

        JSR     R5,     X_CLAMP                 ; 5D65   0004 0114 0270
        DECLE   $0000,  $00A8,  $0082,  $0242   ; 5D68   0000 00A8 0082 0242
        DECLE   $0172,  $0243,  $0173,  $0034   ; 5D6C   0172 0243 0173 0034
        DECLE   $0042,  $01DA,  $0004,  $01A4   ; 5D70   0042 01DA 0004 01A4
        DECLE   $0225                           ; 5D74   0225

        INCR    R5                              ; 5D75   000D
        MOVR    R0,     R3                      ; 5D76   0083
        PULR    R1                              ; 5D77   02B1

        JSR     R5,     .EXEC.9A1               ; 5D78   0004 0118 01A1
        JSR     R5,     L_5413                  ; 5D7B   0004 0154 0013

        MVII    #$01D2, R3                      ; 5D7E   02BB 01D2
        ADD     G_015E, R3                      ; 5D80   02C3 015E
        MVI@    R3,     R5                      ; 5D82   029D
        INCR    R5                              ; 5D83   000D
        MVO@    R5,     R3                      ; 5D84   025D
        PULR    R7                              ; 5D85   02B7

L_5D86:
        PSHR    R5                              ; 5D86   0275

        JSR     R5,     .EXEC.76C               ; 5D87   0004 0114 036C

        MOVR    R3,     R0                      ; 5D8A   0098
        MOVR    R1,     R3                      ; 5D8B   008B

        JSR     R5,     .EXEC.76C               ; 5D8C   0004 0114 036C

        ADDI    #$0002, R3                      ; 5D8F   02FB 0002
        ADDI    #$0002, R1                      ; 5D91   02F9 0002

        JSR     R5,     L_5D99                  ; 5D93   0004 015C 0199

        INCR    R1                              ; 5D96   0009
        INCR    R3                              ; 5D97   000B
        PULR    R5                              ; 5D98   02B5
L_5D99:
        MVI@    R1,     R2                      ; 5D99   028A
        MVI@    R3,     R4                      ; 5D9A   029C
        MVO@    R4,     R1                      ; 5D9B   024C
        MVO@    R2,     R3                      ; 5D9C   025A
        MOVR    R5,     R7                      ; 5D9D   00AF

L_5D9E:
        PSHR    R5                              ; 5D9E   0275
        DECLE   $0004,  $01A4,  $0226,  $0340   ; 5D9F   0004 01A4 0226 0340

        CMPR    R5,     R7                      ; 5DA3   016F
        BMI     L_5DB3                          ; 5DA4   020B 000D

        MVI     G_0171, R5                      ; 5DA6   0285 0171
        TSTR    R5                              ; 5DA8   00AD
        BEQ     L_5DB3                          ; 5DA9   0204 0008

        MVI     G_016D, R5                      ; 5DAB   0285 016D
        TSTR    R5                              ; 5DAD   00AD
        BEQ     L_5DB3                          ; 5DAE   0204 0003

        PULR    R5                              ; 5DB0   02B5
        PULR    R0                              ; 5DB1   02B0
        MOVR    R5,     R7                      ; 5DB2   00AF

L_5DB3:
        PULR    R5                              ; 5DB3   02B5
        PULR    R0                              ; 5DB4   02B0
        PULR    R7                              ; 5DB5   02B7

        DECLE   $0050,  $0061,  $0073,  $0073   ; 5DB6   0050 0061 0073 0073
        DECLE   $0020,  $0043,  $006F,  $006D   ; 5DBA   0020 0043 006F 006D
        DECLE   $0070,  $006C,  $0065,  $0074   ; 5DBE   0070 006C 0065 0074
        DECLE   $0065,  $0000                   ; 5DC2   0065 0000

        PSHR    R5                              ; 5DC4   0275
        PSHR    R0                              ; 5DC5   0270
        MVII    #$0009, R0                      ; 5DC6   02B8 0009

        JSR     R5,     L_5D9E                  ; 5DC8   0004 015C 019E
        JSR     R5,     L_5E4E                  ; 5DCB   0004 015C 024E
        JSR     R5,     L_5E5A                  ; 5DCE   0004 015C 025A

        MVII    #$01D4, R3                      ; 5DD1   02BB 01D4
        ADD     G_015E, R3                      ; 5DD3   02C3 015E
        MVI@    R3,     R5                      ; 5DD5   029D
        INCR    R5                              ; 5DD6   000D
        MVO@    R5,     R3                      ; 5DD7   025D
        CLRR    R5                              ; 5DD8   01ED
        MVO     R5,     G_0171                  ; 5DD9   0245 0171
        SDBD                                    ; 5DDB   0001
        MVII    #$5DB6, R1                      ; 5DDC   02B9 00B6 005D

        JSR     R5,     L_5AA2                  ; 5DDF   0004 0158 02A2
        JSR     R5,     L_5618                  ; 5DE2   0004 0154 0218
        DECLE   $0005,  $0004                   ; 5DE5   0005 0004

        ANDR    R3,     R4                      ; 5DE7   019C
        CMPR    R4,     R2                      ; 5DE8   0162
        MVII    #$0006, R0                      ; 5DE9   02B8 0006
        B       L_5E6A                          ; 5DEB   0200 007D

        DECLE   $0049,  $006E,  $0074,  $0065   ; 5DED   0049 006E 0074 0065
        DECLE   $0072,  $0063,  $0065,  $0070   ; 5DF1   0072 0063 0065 0070
        DECLE   $0074,  $0069,  $006F,  $006E   ; 5DF5   0074 0069 006F 006E
        DECLE   $0021,  $0000                   ; 5DF9   0021 0000

        PSHR    R5                              ; 5DFB   0275
        PSHR    R0                              ; 5DFC   0270
        MVII    #$0008, R0                      ; 5DFD   02B8 0008

        JSR     R5,     L_5D9E                  ; 5DFF   0004 015C 019E

        MOVR    R3,     R2                      ; 5E02   009A
        SUBI    #$0004, R2                      ; 5E03   033A 0004
        AND     G_01C1, R2                      ; 5E05   0382 01C1
        BEQ     L_5C67                          ; 5E07   0224 01A1

        PSHR    R0                              ; 5E09   0270
        MVII    #$0004, R0                      ; 5E0A   02B8 0004
        PSHR    R1                              ; 5E0C   0271
        PSHR    R3                              ; 5E0D   0273

        JSR     R5,     L_5D86                  ; 5E0E   0004 015C 0186

        PULR    R3                              ; 5E11   02B3
        PULR    R1                              ; 5E12   02B1
        PULR    R0                              ; 5E13   02B0
        INCR    R7                              ; 5E14   000F

        PSHR    R5                              ; 5E15   0275
L_5E16:
        PSHR    R0                              ; 5E16   0270
        MVII    #$0008, R0                      ; 5E17   02B8 0008

        JSR     R5,     L_5D9E                  ; 5E19   0004 015C 019E
        JSR     R5,     L_5E4E                  ; 5E1C   0004 015C 024E
        JSR     R5,     L_5E5A                  ; 5E1F   0004 015C 025A

        MVII    #$01D7, R3                      ; 5E22   02BB 01D7
        SUB     G_015E, R3                      ; 5E24   0303 015E
        MVI@    R3,     R5                      ; 5E26   029D
        INCR    R5                              ; 5E27   000D
        MVO@    R5,     R3                      ; 5E28   025D
        CLRR    R5                              ; 5E29   01ED
        MVO     R5,     G_0171                  ; 5E2A   0245 0171
        ANDI    #$000C, R2                      ; 5E2C   03BA 000C
        BEQ     L_5E33                          ; 5E2E   0204 0003

        INCR    R2                              ; 5E30   000A
        MVO     R2,     G_0167                  ; 5E31   0242 0167
L_5E33:
        SDBD                                    ; 5E33   0001
        MVII    #$5DED, R1                      ; 5E34   02B9 00ED 005D

        JSR     R5,     L_5AA2                  ; 5E37   0004 0158 02A2

        CLRR    R0                              ; 5E3A   01C0
        MVO     R0,     G_0168                  ; 5E3B   0240 0168

        JSR     R5,     L_5896                  ; 5E3D   0004 0158 0096

        CLRR    R0                              ; 5E40   01C0
        MVO     R0,     G_015F                  ; 5E41   0240 015F

        JSR     R5,     L_5618                  ; 5E43   0004 0154 0218
        DECLE   $0005                           ; 5E46   0005

        JSR     R5,     L_6FF5                  ; 5E47   0004 016C 03F5

        MVII    #$000B, R0                      ; 5E4A   02B8 000B
        B       L_5E6A                          ; 5E4C   0200 001C

L_5E4E:
        MVI     G_016A, R2                      ; 5E4E   0282 016A
        TSTR    R2                              ; 5E50   0092
        BNEQ    L_5C67                          ; 5E51   022C 01EB

        MVI     G_015D, R2                      ; 5E53   0282 015D
        CMPI    #$0007, R2                      ; 5E55   037A 0007
        BNEQ    L_5C67                          ; 5E57   022C 01F1
        MOVR    R5,     R7                      ; 5E59   00AF

L_5E5A:
        PSHR    R5                              ; 5E5A   0275
        PSHR    R3                              ; 5E5B   0273

        JSR     R5,     L_534B                  ; 5E5C   0004 0150 034B

        PULR    R0                              ; 5E5F   02B0

        JSR     R5,     L_57B4                  ; 5E60   0004 0154 03B4

        PULR    R5                              ; 5E63   02B5
        MOVR    R2,     R3                      ; 5E64   0093
        ANDI    #$0031, R3                      ; 5E65   03BB 0031
        BNEQ    L_5BFF                          ; 5E67   022C 0269
        MOVR    R5,     R7                      ; 5E69   00AF

L_5E6A:
        MVI     G_01C6, R5                      ; 5E6A   0285 01C6
        ANDI    #$0002, R5                      ; 5E6C   03BD 0002
        BEQ     L_5C67                          ; 5E6E   0224 0208

        MVO     R0,     G_0175                  ; 5E70   0240 0175
        MVII    #$0001, R5                      ; 5E72   02BD 0001
        MVO     R5,     G_0323                  ; 5E74   0245 0323
        CLRR    R5                              ; 5E76   01ED
        MVO     R5,     G_0321                  ; 5E77   0245 0321
        MVII    #$000E, R5                      ; 5E79   02BD 000E
        MVO     R5,     G_0322                  ; 5E7B   0245 0322
        PULR    R7                              ; 5E7D   02B7

        MVI     G_0199, R4                      ; 5E7E   0284 0199
        CMPI    #$0003, R4                      ; 5E80   037C 0003
        BEQ     L_5E90                          ; 5E82   0204 000C

        TSTR    R4                              ; 5E84   00A4
        BNEQ    L_5EA0                          ; 5E85   020C 0019

        MVI     G_0171, R4                      ; 5E87   0284 0171
        CMPI    #$0002, R4                      ; 5E89   037C 0002
        BNEQ    L_5EA0                          ; 5E8B   020C 0013

        CLRR    R0                              ; 5E8D   01C0
        B       L_5E96                          ; 5E8E   0200 0006

L_5E90:
        SUBI    #$0004, R0                      ; 5E90   0338 0004
        AND     G_01C1, R0                      ; 5E92   0380 01C1
        BEQ     L_5EA0                          ; 5E94   0204 000A

L_5E96:
        PSHR    R5                              ; 5E96   0275

        JSR     R5,     L_690B                  ; 5E97   0004 0168 010B
        DECLE   $0004,  $01A4,  $0225,  $0000   ; 5E9A   0004 01A4 0225 0000

        MVO@    R0,     R1                      ; 5E9E   0248
        PULR    R7                              ; 5E9F   02B7

L_5EA0:
        PSHR    R5                              ; 5EA0   0275
        MVI     G_017F, R2                      ; 5EA1   0282 017F
        ANDI    #$0008, R2                      ; 5EA3   03BA 0008
        MVII    #$0004, R0                      ; 5EA5   02B8 0004
        BEQ     L_5EC2                          ; 5EA7   0204 0019

        PSHR    R1                              ; 5EA9   0271
        CLRR    R0                              ; 5EAA   01C0
        MVI     G_015D, R2                      ; 5EAB   0282 015D
        CMPI    #$0007, R2                      ; 5EAD   037A 0007
        BNEQ    L_5EB3                          ; 5EAF   020C 0002

        MVI     G_019B, R0                      ; 5EB1   0280 019B

L_5EB3:
        JSR     R5,     .EXEC.772               ; 5EB3   0004 0114 0372
        DECLE   $0042,  $01DA,  $02B1,  $0004   ; 5EB6   0042 01DA 02B1 0004
        DECLE   $01A4,  $023F                   ; 5EBA   01A4 023F

        JSR     R5,     .EXEC.9A3               ; 5EBC   0004 0118 01A3
        DECLE   $0004                           ; 5EBF   0004

        ANDR    R4,     R4                      ; 5EC0   01A4
        MVO@    R1,     R3                      ; 5EC1   0259
L_5EC2:
        ADDI    #$0006, R1                      ; 5EC2   02F9 0006
        MVO@    R0,     R1                      ; 5EC4   0248
        PULR    R7                              ; 5EC5   02B7

        DECLE   $0275,  $0282,  $017F,  $03BA   ; 5EC6   0275 0282 017F 03BA
        DECLE   $0008,  $02B8,  $0004,  $0224   ; 5ECA   0008 02B8 0004 0224
        DECLE   $000F                           ; 5ECE   000F

        NEGR    R2                              ; 5ECF   0022
        MOVR    R1,     R4                      ; 5ED0   008C
        ADDI    #$0002, R4                      ; 5ED1   02FC 0002
        PSHR    R1                              ; 5ED3   0271
        PSHR    R2                              ; 5ED4   0272
        NOP                                     ; 5ED5   0034
L_5ED6:
        PSHR    R4                              ; 5ED6   0274
        PSHR    R2                              ; 5ED7   0272
        NOP                                     ; 5ED8   0034
        PSHR    R0                              ; 5ED9   0270

        JSR     R5,     .EXEC.772               ; 5EDA   0004 0114 0372
        JSR     R5,     X_POW2                  ; 5EDD   0004 0114 0345

        AND     G_0168, R0                      ; 5EE0   0380 0168
        NEGR    R0                              ; 5EE2   0020
        BNEQ    L_5EE9                          ; 5EE3   020C 0004

        JSR     R5,     .EXEC.784               ; 5EE5   0004 0114 0384

        MOVR    R2,     R5                      ; 5EE8   0095
L_5EE9:
        PULR    R0                              ; 5EE9   02B0
        PULR    R2                              ; 5EEA   02B2
        PULR    R4                              ; 5EEB   02B4
        BMI     L_5EF4                          ; 5EEC   020B 0006

        CMPR    R2,     R5                      ; 5EEE   0155
        BC      L_5EF4                          ; 5EEF   0201 0003

        MOVR    R5,     R2                      ; 5EF1   00AA
        PULR    R5                              ; 5EF2   02B5
        PSHR    R0                              ; 5EF3   0270
L_5EF4:
        INCR    R0                              ; 5EF4   0008
        CMPI    #$0007, R0                      ; 5EF5   0378 0007
        BLE     L_5ED6                          ; 5EF7   0226 0022

        PULR    R0                              ; 5EF9   02B0
        TSTR    R0                              ; 5EFA   0080
        BPL     L_5EB3                          ; 5EFB   0223 0049

        PULR    R1                              ; 5EFD   02B1
        ADDI    #$0004, R1                      ; 5EFE   02F9 0004
        CLRR    R0                              ; 5F00   01C0
        MVO@    R0,     R1                      ; 5F01   0248
        INCR    R1                              ; 5F02   0009
        MVII    #$0004, R0                      ; 5F03   02B8 0004
        MVO@    R0,     R1                      ; 5F05   0248
        PULR    R7                              ; 5F06   02B7

        PSHR    R5                              ; 5F07   0275
        MVI     G_017F, R5                      ; 5F08   0285 017F
        ANDI    #$0008, R5                      ; 5F0A   03BD 0008
        BEQ     L_5F52                          ; 5F0C   0204 0044

        SDBD                                    ; 5F0E   0001
        MVII    #$0403, R4                      ; 5F0F   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 5F12   0004 0114 030F

        BNC     L_5F52                          ; 5F15   0209 003B

        JSR     R5,     .EXEC.766               ; 5F17   0004 0114 0366

        MVII    #$01C6, R5                      ; 5F1A   02BD 01C6
        ADDR    R0,     R5                      ; 5F1C   00C5
        PSHR    R5                              ; 5F1D   0275
        MVO@    R3,     R5                      ; 5F1E   026B
        NOP                                     ; 5F1F   0034
        PSHR    R3                              ; 5F20   0273

        JSR     R5,     L_5F33                  ; 5F21   0004 015C 0333

        MOVR    R0,     R2                      ; 5F24   0082
        PULR    R0                              ; 5F25   02B0
        PSHR    R2                              ; 5F26   0272

        JSR     R5,     .EXEC.76C               ; 5F27   0004 0114 036C
        JSR     R5,     L_5F33                  ; 5F2A   0004 015C 0333

        SUB@    R6,     R0                      ; 5F2D   0330
        PULR    R5                              ; 5F2E   02B5
        BNEQ    L_5F52                          ; 5F2F   020C 0021

        MVO@    R0,     R5                      ; 5F31   0268
        PULR    R7                              ; 5F32   02B7

L_5F33:
        PSHR    R5                              ; 5F33   0275

        JSR     R5,     X_CLR_BIT               ; 5F34   0004 0114 02E6

        CMPR    R5,     R0                      ; 5F37   0168
        INCR    R1                              ; 5F38   0009
        SDBD                                    ; 5F39   0001
        MVII    #$9D2C, R5                      ; 5F3A   02BD 002C 009D
        MVO@    R5,     R1                      ; 5F3D   024D
        ADDI    #$0003, R1                      ; 5F3E   02F9 0003
        CLRR    R5                              ; 5F40   01ED
        MVO@    R5,     R1                      ; 5F41   024D
        INCR    R1                              ; 5F42   0009
        MVO@    R5,     R1                      ; 5F43   024D
        INCR    R1                              ; 5F44   0009
        MOVR    R0,     R2                      ; 5F45   0082
        MVII    #$0006, R0                      ; 5F46   02B8 0006
        CMPI    #$0004, R2                      ; 5F48   037A 0004
        BNEQ    L_5F4D                          ; 5F4A   020C 0001

        DECR    R0                              ; 5F4C   0010

L_5F4D:
        JSR     R5,     X_RAND1                 ; 5F4D   0004 0114 027D

        INCR    R0                              ; 5F50   0008
        MVO@    R0,     R1                      ; 5F51   0248
L_5F52:
        PULR    R7                              ; 5F52   02B7

        PSHR    R5                              ; 5F53   0275
        PSHR    R3                              ; 5F54   0273
        TSTR    R0                              ; 5F55   0080
        BEQ     L_5F82                          ; 5F56   0204 002A

        CMPI    #$0004, R0                      ; 5F58   0378 0004
        BGE     L_5F6A                          ; 5F5A   020D 000E

        MVII    #$01C6, R5                      ; 5F5C   02BD 01C6
        ADDR    R0,     R5                      ; 5F5E   00C5
        MVI@    R5,     R3                      ; 5F5F   02AB
        TSTR    R3                              ; 5F60   009B
        BEQ     L_5F82                          ; 5F61   0204 001F

        PSHR    R3                              ; 5F63   0273
        CLRR    R3                              ; 5F64   01DB
        DECR    R5                              ; 5F65   0015
        MVO@    R3,     R5                      ; 5F66   026B
        PULR    R3                              ; 5F67   02B3
        B       L_5F7B                          ; 5F68   0200 0011

L_5F6A:
        MVII    #$01C7, R5                      ; 5F6A   02BD 01C7
        CMP@    R5,     R0                      ; 5F6C   0368
        BEQ     L_5F75                          ; 5F6D   0204 0006

        CMP@    R5,     R0                      ; 5F6F   0368
        BEQ     L_5F75                          ; 5F70   0204 0003

        CMP@    R5,     R0                      ; 5F72   0368
        BNEQ    L_5F82                          ; 5F73   020C 000D

L_5F75:
        DECR    R5                              ; 5F75   0015
        CLRR    R3                              ; 5F76   01DB
        MVO@    R3,     R5                      ; 5F77   026B
        SUBI    #$01C7, R5                      ; 5F78   033D 01C7
        MOVR    R5,     R3                      ; 5F7A   00AB
L_5F7B:
        SLL     R3,     2                       ; 5F7B   004F
        SLL     R3,     1                       ; 5F7C   004B
        ADDI    #$0322, R3                      ; 5F7D   02FB 0322
        MVII    #$0002, R5                      ; 5F7F   02BD 0002
        MVO@    R5,     R3                      ; 5F81   025D
L_5F82:
        SDBD                                    ; 5F82   0001
        MVII    #$58A6, R5                      ; 5F83   02BD 00A6 0058
        ADDR    R0,     R5                      ; 5F86   00C5
        ADDR    R0,     R5                      ; 5F87   00C5
        SDBD                                    ; 5F88   0001
        MVI@    R5,     R3                      ; 5F89   02AB
        MOVR    R0,     R5                      ; 5F8A   0085
        ANDI    #$0003, R5                      ; 5F8B   03BD 0003
        BNEQ    L_5FA6                          ; 5F8D   020C 0017

        MVI     G_01C6, R5                      ; 5F8F   0285 01C6
        TSTR    R0                              ; 5F91   0080
        BNEQ    L_5F9E                          ; 5F92   020C 000A

        ANDI    #$0002, R5                      ; 5F94   03BD 0002
        BEQ     L_5FA6                          ; 5F96   0204 000E

        SDBD                                    ; 5F98   0001
        MVII    #$9D5B, R3                      ; 5F99   02BB 005B 009D
        B       L_5FA6                          ; 5F9C   0200 0008

L_5F9E:
        ANDI    #$0001, R5                      ; 5F9E   03BD 0001
        BEQ     L_5FA6                          ; 5FA0   0204 0004

        SDBD                                    ; 5FA2   0001
        MVII    #$9D52, R3                      ; 5FA3   02BB 0052 009D
L_5FA6:
        MOVR    R3,     R5                      ; 5FA6   009D
        INCR    R1                              ; 5FA7   0009
        MVO@    R5,     R1                      ; 5FA8   024D

        JSR     R5,     X_SET_BIT               ; 5FA9   0004 0114 02DB

        CMPR    R5,     R0                      ; 5FAC   0168
        ADDI    #$0005, R1                      ; 5FAD   02F9 0005
        ANDI    #$0003, R0                      ; 5FAF   03B8 0003
        TSTR    R0                              ; 5FB1   0080
        BNEQ    L_5FBB                          ; 5FB2   020C 0007

        SDBD                                    ; 5FB4   0001
        CMPI    #$9D42, R3                      ; 5FB5   037B 0042 009D
        BEQ     L_5FBB                          ; 5FB8   0204 0001

        INCR    R0                              ; 5FBA   0008
L_5FBB:
        MVO@    R0,     R1                      ; 5FBB   0248
        PULR    R3                              ; 5FBC   02B3
        PULR    R7                              ; 5FBD   02B7

        PSHR    R5                              ; 5FBE   0275
        MVI     G_017F, R5                      ; 5FBF   0285 017F
        ANDI    #$0004, R5                      ; 5FC1   03BD 0004
        BEQ     L_5F52                          ; 5FC3   0224 0072

        CMPI    #$0003, R0                      ; 5FC5   0378 0003
        BLE     L_5F52                          ; 5FC7   0226 0076

        MVI     G_016A, R5                      ; 5FC9   0285 016A
        TSTR    R5                              ; 5FCB   00AD
        BNEQ    L_5F52                          ; 5FCC   022C 007B

        SDBD                                    ; 5FCE   0001
        MVII    #$0403, R4                      ; 5FCF   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 5FD2   0004 0114 030F

        BNC     L_5F52                          ; 5FD5   0229 0084

        JSR     R5,     L_5A82                  ; 5FD7   0004 0158 0282

        MVII    #$000D, R0                      ; 5FDA   02B8 000D
        ADDI    #$0005, R1                      ; 5FDC   02F9 0005
        MVO@    R0,     R1                      ; 5FDE   0248
        MVII    #$000B, R0                      ; 5FDF   02B8 000B
        MVO     R0,     G_0322                  ; 5FE1   0240 0322

        JSR     R5,     L_596F                  ; 5FE3   0004 0158 016F

        PULR    R7                              ; 5FE6   02B7

        PSHR    R5                              ; 5FE7   0275

        JSR     R5,     L_52B1                  ; 5FE8   0004 0150 02B1
        JSR     R5,     .EXEC.A61               ; 5FEB   0004 0118 0261
        DECLE   $000F                           ; 5FEE   000F

        JSR     R5,     L_565E                  ; 5FEF   0004 0154 025E
        DECLE   $0000                           ; 5FF2   0000

        MVII    #$0165, R4                      ; 5FF3   02BC 0165
        MVII    #$0014, R0                      ; 5FF5   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 5FF7   0004 0114 0338

        CLRR    R0                              ; 5FFA   01C0
        MVO     R0,     G_01BF                  ; 5FFB   0240 01BF
        MVO     R0,     G_01C0                  ; 5FFD   0240 01C0
        MVO     R0,     G_0164                  ; 5FFF   0240 0164
        INCR    R0                              ; 6001   0008
        MVI     G_019C, R5                      ; 6002   0285 019C
        TSTR    R5                              ; 6004   00AD
        BNEQ    L_6009                          ; 6005   020C 0002

        MVO     R0,     G_019C                  ; 6007   0240 019C
L_6009:
        MVI     G_019A, R5                      ; 6009   0285 019A
        TSTR    R5                              ; 600B   00AD
        BNEQ    L_6016                          ; 600C   020C 0008

        MVII    #$0009, R0                      ; 600E   02B8 0009

        JSR     R5,     X_RAND2                 ; 6010   0004 0114 029E

        INCR    R0                              ; 6013   0008
        MVO     R0,     G_019A                  ; 6014   0240 019A

L_6016:
        JSR     R5,     .EXEC.7B3               ; 6016   0004 0114 03B3
        JSR     R5,     .EXEC.A61               ; 6019   0004 0118 0261
        DECLE   $0001,  $0004                   ; 601C   0001 0004

        ANDR    R5,     R0                      ; 601E   01A8
        MOVR    R1,     R7                      ; 601F   008F

        JSR     R5,     L_5618                  ; 6020   0004 0154 0218
        DECLE   $000C                           ; 6023   000C

        JSR     R5,     L_697B                  ; 6024   0004 0168 017B
        JSR     R5,     L_6D3F                  ; 6027   0004 016C 013F
        JSR     R5,     L_6D5D                  ; 602A   0004 016C 015D
        DECLE   $02B8,  $0002,  $0285,  $017B   ; 602D   02B8 0002 0285 017B
        DECLE   $03BD,  $0001,  $03C5,  $015E   ; 6031   03BD 0001 03C5 015E
        DECLE   $0204,  $0001,  $0008,  $0004   ; 6035   0204 0001 0008 0004

        ANDR    R5,     R0                      ; 6039   01A8
        ADDR    R2,     R6                      ; 603A   00D6
        MVII    #$0008, R0                      ; 603B   02B8 0008
        MVI     G_015E, R1                      ; 603D   0281 015E
        MVII    #$019D, R3                      ; 603F   02BB 019D

        JSR     R5,     L_619B                  ; 6041   0004 0160 019B

        CLRR    R0                              ; 6044   01C0
        MVI     G_015E, R1                      ; 6045   0281 015E
        XORI    #$0001, R1                      ; 6047   03F9 0001
        MVII    #$019E, R3                      ; 6049   02BB 019E

        JSR     R5,     L_619B                  ; 604B   0004 0160 019B

        MVII    #$0001, R0                      ; 604E   02B8 0001
        MVI     G_01C6, R5                      ; 6050   0285 01C6
        MOVR    R5,     R4                      ; 6052   00AC
        ANDI    #$0002, R4                      ; 6053   03BC 0002
        BEQ     L_6059                          ; 6055   0204 0002

        MVO     R0,     G_01CE                  ; 6057   0240 01CE
L_6059:
        ANDI    #$0001, R5                      ; 6059   03BD 0001
        BEQ     L_605F                          ; 605B   0204 0002

        MVO     R0,     G_01CB                  ; 605D   0240 01CB
L_605F:
        PULR    R7                              ; 605F   02B7

L_6060:
        PSHR    R5                              ; 6060   0275
        MVI     G_015D, R2                      ; 6061   0282 015D
        CMPI    #$000C, R2                      ; 6063   037A 000C
        BEQ     L_606B                          ; 6065   0204 0004

        CMPI    #$0004, R2                      ; 6067   037A 0004
        BNEQ    L_610B                          ; 6069   020C 00A0

L_606B:
        TSTR    R0                              ; 606B   0080
        BEQ     L_610B                          ; 606C   0204 009D

        MOVR    R1,     R2                      ; 606E   008A
        XOR     G_015E, R2                      ; 606F   03C2 015E
        MVII    #$019D, R3                      ; 6071   02BB 019D
        ADDR    R2,     R3                      ; 6073   00D3
        MVI@    R3,     R4                      ; 6074   029C
        INCR    R4                              ; 6075   000C
        ADDR    R7,     R4                      ; 6076   00FC
        ADD@    R4,     R7                      ; 6077   02E7

        DECLE   $000E,  $0051,  $004E,  $0068   ; 6078   000E 0051 004E 0068
        DECLE   $0068,  $0064,  $0064,  $0093   ; 607C   0068 0064 0064 0093
        DECLE   $0094,  $00BC,  $00D2,  $00CD   ; 6080   0094 00BC 00D2 00CD
        DECLE   $00CD,  $00E2,  $01ED,  $0245   ; 6084   00CD 00E2 01ED 0245
        DECLE   $0166,  $0084,  $0004,  $01A8   ; 6088   0166 0084 0004 01A8
        DECLE   $0135,  $0001,  $0004           ; 608C   0135 0001 0004

        BNC     L_60A8                          ; 608F   0209 0017

        CMPI    #$0006, R0                      ; 6091   0378 0006
        BEQ     L_632C                          ; 6093   0204 0297

        CMPI    #$000B, R0                      ; 6095   0378 000B
        BNEQ    L_609B                          ; 6097   020C 0002

        MVII    #$0009, R0                      ; 6099   02B8 0009
L_609B:
        SUBI    #$0002, R0                      ; 609B   0338 0002
        DECLE   $0004,  $01A8,  $0135,  $0005   ; 609D   0004 01A8 0135 0005

        SETC                                    ; 60A1   0007
        BC      L_6188                          ; 60A2   0201 00E4

        CMPI    #$0007, R0                      ; 60A4   0378 0007
        BEQ     L_60AD                          ; 60A6   0204 0005

L_60A8:
        MVO     R4,     G_01A0                  ; 60A8   0244 01A0
        J       L_619C                          ; 60AA   0004 0360 019C

L_60AD:
        MVI     G_019A, R5                      ; 60AD   0285 019A
        MVII    #$0004, R4                      ; 60AF   02BC 0004
        CMPI    #$000B, R5                      ; 60B1   037D 000B
        BEQ     L_60BD                          ; 60B3   0204 0008

        MVII    #$0002, R4                      ; 60B5   02BC 0002
        CMPI    #$000A, R5                      ; 60B7   037D 000A
        BEQ     L_60BD                          ; 60B9   0204 0002

        MVII    #$0003, R4                      ; 60BB   02BC 0003
L_60BD:
        MVO     R4,     G_0199                  ; 60BD   0244 0199
        MVII    #$0014, R5                      ; 60BF   02BD 0014
        MVO     R5,     G_0173                  ; 60C1   0245 0173
        J       L_619C                          ; 60C3   0004 0360 019C

        MVII    #$0009, R2                      ; 60C6   02BA 0009
        INCR    R7                              ; 60C8   000F

        CLRR    R2                              ; 60C9   01D2
L_60CA:
        CMPI    #$000B, R0                      ; 60CA   0378 000B
        DECLE   $0204,  $000E,  $0378,  $000A   ; 60CC   0204 000E 0378 000A
        DECLE   $0204,  $000A,  $00D0,  $0004   ; 60D0   0204 000A 00D0 0004
        DECLE   $01A8,  $0135,  $0001           ; 60D4   01A8 0135 0001

        INCR    R3                              ; 60D7   000B
        BC      L_6188                          ; 60D8   0201 00AE

        MVO     R0,     G_019A                  ; 60DA   0240 019A
L_60DC:
        CLRR    R0                              ; 60DC   01C0
        J       L_619C                          ; 60DD   0004 0360 019C

        CMPI    #$000B, R0                      ; 60E0   0378 000B
        BEQ     L_60DC                          ; 60E2   0224 0007

        MVI@    R3,     R5                      ; 60E4   029D
        SUBI    #$0003, R5                      ; 60E5   033D 0003
        MVO     R5,     G_01A1                  ; 60E7   0245 01A1

        JSR     R5,     L_618C                  ; 60E9   0004 0160 018C

        CMPI    #$000A, R0                      ; 60EC   0378 000A
        BEQ     L_6109                          ; 60EE   0204 0019

        MVI     G_0166, R5                      ; 60F0   0285 0166
        TSTR    R5                              ; 60F2   00AD
        BNEQ    L_60FB                          ; 60F3   020C 0006

        MVO@    R5,     R3                      ; 60F5   025D
        MVO     R6,     G_0166                  ; 60F6   0246 0166

        JSR     R5,     L_618C                  ; 60F8   0004 0160 018C

L_60FB:
        PSHR    R0                              ; 60FB   0270
        DECLE   $0298,  $0004,  $01A8,  $0135   ; 60FC   0298 0004 01A8 0135
        DECLE   $0000                           ; 6100   0000

        INCR    R3                              ; 6101   000B
        PULR    R5                              ; 6102   02B5
        BC      L_6188                          ; 6103   0201 0083

        INCR    R0                              ; 6105   0008
        MVO@    R0,     R3                      ; 6106   0258
        MVO@    R5,     R4                      ; 6107   0265
        PULR    R7                              ; 6108   02B7

L_6109:
        CLRR    R0                              ; 6109   01C0
        MVO@    R0,     R3                      ; 610A   0258
L_610B:
        PULR    R7                              ; 610B   02B7

        DECLE   $0084,  $0004,  $01A8,  $0135   ; 610C   0084 0004 01A8 0135
        DECLE   $0001                           ; 6110   0001

        EIS                                     ; 6111   0002
        BNC     L_612D                          ; 6112   0209 0019

        CMPI    #$0006, R0                      ; 6114   0378 0006
        BEQ     L_632C                          ; 6116   0204 0214

        CMPI    #$000B, R0                      ; 6118   0378 000B
        BNEQ    L_611E                          ; 611A   020C 0002

        MVII    #$0009, R0                      ; 611C   02B8 0009
L_611E:
        SUBI    #$0004, R0                      ; 611E   0338 0004
        DECLE   $0004,  $01A8,  $0135,  $0003   ; 6120   0004 01A8 0135 0003
        DECLE   $0005                           ; 6124   0005

        BC      L_6188                          ; 6125   0201 0061

        CMPI    #$0005, R0                      ; 6127   0378 0005
        BNEQ    L_612D                          ; 6129   020C 0002
        B       L_612F                          ; 612B   0200 0002

L_612D:
        MVO     R4,     G_019F                  ; 612D   0244 019F
L_612F:
        ADDI    #$0008, R0                      ; 612F   02F8 0008
        J       L_619C                          ; 6131   0004 0360 019C

        DECLE   $0378,  $000B,  $0204,  $000D   ; 6134   0378 000B 0204 000D
        DECLE   $0378,  $000A,  $0204,  $0009   ; 6138   0378 000A 0204 0009
        DECLE   $0004,  $01A8,  $0135,  $0001   ; 613C   0004 01A8 0135 0001

        INCR    R1                              ; 6140   0009
        BC      L_6188                          ; 6141   0201 0045

        MVO     R0,     G_019C                  ; 6143   0240 019C
L_6145:
        MVII    #$0008, R0                      ; 6145   02B8 0008
        J       L_619C                          ; 6147   0004 0360 019C

        DECLE   $0378,  $000B,  $0224,  $0008   ; 614A   0378 000B 0224 0008
        DECLE   $0010,  $0004,  $01A8,  $0135   ; 614E   0010 0004 01A8 0135
        DECLE   $0000                           ; 6152   0000

        DIS                                     ; 6153   0003
        BC      L_6188                          ; 6154   0201 0032

        MVO     R0,     G_01C1                  ; 6156   0240 01C1
        B       L_6145                          ; 6158   0220 0014

        DECLE   $0004,  $01A8,  $0135,  $0001   ; 615A   0004 01A8 0135 0001

        INCR    R1                              ; 615E   0009
        BC      L_610B                          ; 615F   0221 0055

        MVI     G_015D, R5                      ; 6161   0285 015D
        CMPI    #$0004, R5                      ; 6163   037D 0004
        BNEQ    L_610B                          ; 6165   022C 005B

        MVI     G_0165, R4                      ; 6167   0284 0165
        MOVR    R4,     R5                      ; 6169   00A5
        ANDI    #$0002, R5                      ; 616A   03BD 0002
        BNEQ    L_610B                          ; 616C   022C 0062

        MOVR    R4,     R5                      ; 616E   00A5
        ANDI    #$0008, R5                      ; 616F   03BD 0008
        BEQ     L_610B                          ; 6171   0224 0067

        CMP     G_019C, R0                      ; 6173   0340 019C
        BEQ     L_610B                          ; 6175   0224 006B

        XORI    #$0008, R4                      ; 6177   03FC 0008
        MVO     R4,     G_0165                  ; 6179   0244 0165
        MVO     R0,     G_019C                  ; 617B   0240 019C

        JSR     R5,     L_62B4                  ; 617D   0004 0160 02B4
        DECLE   $02B8,  $0004,  $0004           ; 6180   02B8 0004 0004

        ANDR    R5,     R4                      ; 6183   01AC
        MVII    #$00D1, R3                      ; 6184   02BB 00D1
        SLR     R2,     1                       ; 6186   0062
        PULR    R7                              ; 6187   02B7

L_6188:
        PULR    R5                              ; 6188   02B5
        DECLE   $0004                           ; 6189   0004

        AND@    R3,     R4                      ; 618A   039C
        CMPR    R6,     R4                      ; 618B   0174
L_618C:
        PSHR    R5                              ; 618C   0275
        MVII    #$01A5, R3                      ; 618D   02BB 01A5
        MVII    #$01A7, R4                      ; 618F   02BC 01A7
        MVI     G_01A1, R5                      ; 6191   0285 01A1
        TSTR    R5                              ; 6193   00AD
        BEQ     L_6199                          ; 6194   0204 0003

        INCR    R3                              ; 6196   000B
        ADDI    #$000C, R4                      ; 6197   02FC 000C
L_6199:
        ADD@    R3,     R4                      ; 6199   02DC
        PULR    R7                              ; 619A   02B7

L_619B:
        PSHR    R5                              ; 619B   0275
L_619C:
        MVO@    R0,     R3                      ; 619C   0258
        DECLE   $0285,  $019E,  $037D,  $0007   ; 619D   0285 019E 037D 0007
        DECLE   $020C,  $0006,  $0285,  $019D   ; 61A1   020C 0006 0285 019D
        DECLE   $037D,  $000D,  $0204,  $00AE   ; 61A5   037D 000D 0204 00AE
        DECLE   $0004                           ; 61A9   0004

        ANDR    R5,     R0                      ; 61AA   01A8
        SUBR    R0,     R6                      ; 61AB   0106
L_61AC:
        PSHR    R0                              ; 61AC   0270

        JSR     R5,     L_6347                  ; 61AD   0004 0160 0347

        PULR    R0                              ; 61B0   02B0
        CMPI    #$0001, R0                      ; 61B1   0378 0001
        BEQ     L_61C2                          ; 61B3   0204 000D

        CMPI    #$0009, R0                      ; 61B5   0378 0009
        BEQ     L_61C6                          ; 61B7   0204 000D

        CMPI    #$0005, R0                      ; 61B9   0378 0005
        BEQ     L_61D1                          ; 61BB   0204 0014

        CMPI    #$000B, R0                      ; 61BD   0378 000B
        BEQ     L_61D1                          ; 61BF   0204 0010
        PULR    R7                              ; 61C1   02B7

L_61C2:
        MVII    #$000E, R0                      ; 61C2   02B8 000E
        B       L_61C8                          ; 61C4   0200 0002

L_61C6:
        MVII    #$0010, R0                      ; 61C6   02B8 0010
L_61C8:
        MVI     G_017B, R5                      ; 61C8   0285 017B
        ANDI    #$0001, R5                      ; 61CA   03BD 0001
        XOR     G_015E, R5                      ; 61CC   03C5 015E
        ADDR    R5,     R0                      ; 61CE   00E8
        B       L_61AC                          ; 61CF   0220 0024

L_61D1:
        MVII    #$0200, R4                      ; 61D1   02BC 0200
        TSTR    R1                              ; 61D3   0089
        BEQ     L_61D8                          ; 61D4   0204 0002

        MVII    #$020A, R4                      ; 61D6   02BC 020A
L_61D8:
        PSHR    R4                              ; 61D8   0274
        ADDI    #$0001, R4                      ; 61D9   02FC 0001
        MVI     G_015E, R5                      ; 61DB   0285 015E
        TSTR    R5                              ; 61DD   00AD
        BNEQ    L_61E2                          ; 61DE   020C 0002

        ADDI    #$0014, R4                      ; 61E0   02FC 0014
L_61E2:
        SDBD                                    ; 61E2   0001
        MVII    #$1983, R0                      ; 61E3   02B8 0083 0019
        MVO@    R0,     R4                      ; 61E6   0260
        PULR    R4                              ; 61E7   02B4
        PSHR    R4                              ; 61E8   0274
        ADDI    #$0006, R4                      ; 61E9   02FC 0006
        MVI     G_017A, R0                      ; 61EB   0280 017A
        MVII    #$0003, R1                      ; 61ED   02B9 0003
        MVII    #$0002, R3                      ; 61EF   02BB 0002

        JSR     R5,     X_PRNUM_RGT             ; 61F1   0004 0118 00C5

        PULR    R4                              ; 61F4   02B4
        PSHR    R4                              ; 61F5   0274
        ADDI    #$001A, R4                      ; 61F6   02FC 001A
        MVI     G_0179, R0                      ; 61F8   0280 0179
        MVII    #$0003, R1                      ; 61FA   02B9 0003
        MVII    #$0001, R3                      ; 61FC   02BB 0001

        JSR     R5,     X_PRNUM_RGT             ; 61FE   0004 0118 00C5

        PULR    R4                              ; 6201   02B4
        PSHR    R4                              ; 6202   0274
        ADDI    #$003D, R4                      ; 6203   02FC 003D
        MVI     G_015F, R0                      ; 6205   0280 015F
        MVII    #$0007, R3                      ; 6207   02BB 0007

        JSR     R5,     L_55D1                  ; 6209   0004 0154 01D1

        MVI     G_017D, R0                      ; 620C   0280 017D
        SWAP    R0,     1                       ; 620E   0040
        SWAP    R0,     1                       ; 620F   0040
        BMI     L_621E                          ; 6210   020B 000C
        BNEQ    L_6215                          ; 6212   020C 0001

        INCR    R0                              ; 6214   0008
L_6215:
        MVII    #$0002, R1                      ; 6215   02B9 0002
        ADDI    #$0003, R4                      ; 6217   02FC 0003
        MVII    #$0007, R3                      ; 6219   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 621B   0004 0118 00C5

L_621E:
        PULR    R4                              ; 621E   02B4
        PSHR    R4                              ; 621F   0274
        ADDI    #$0059, R4                      ; 6220   02FC 0059

        JSR     R5,     L_54E7                  ; 6222   0004 0154 00E7

        PULR    R4                              ; 6225   02B4
        PSHR    R4                              ; 6226   0274
        ADDI    #$007A, R4                      ; 6227   02FC 007A

        JSR     R5,     L_5601                  ; 6229   0004 0154 0201

        PULR    R4                              ; 622C   02B4
        PSHR    R4                              ; 622D   0274
        ADDI    #$008D, R4                      ; 622E   02FC 008D
        MVI     G_017B, R0                      ; 6230   0280 017B
        MVII    #$0007, R3                      ; 6232   02BB 0007

        JSR     R5,     L_55D1                  ; 6234   0004 0154 01D1

        PULR    R4                              ; 6237   02B4
        PSHR    R4                              ; 6238   0274
        ADDI    #$00CB, R4                      ; 6239   02FC 00CB
        MVII    #$0003, R0                      ; 623B   02B8 0003
        SUB     G_0160, R0                      ; 623D   0300 0160
        MVII    #$0001, R1                      ; 623F   02B9 0001
        MVII    #$0002, R3                      ; 6241   02BB 0002

        JSR     R5,     X_PRNUM_RGT             ; 6243   0004 0118 00C5

        PULR    R4                              ; 6246   02B4
        PSHR    R4                              ; 6247   0274
        ADDI    #$00CD, R4                      ; 6248   02FC 00CD
        MVII    #$0003, R0                      ; 624A   02B8 0003
        SUB     G_0161, R0                      ; 624C   0300 0161
        MVII    #$0001, R1                      ; 624E   02B9 0001
        MVII    #$0001, R3                      ; 6250   02BB 0001

        JSR     R5,     X_PRNUM_RGT             ; 6252   0004 0118 00C5

        PULR    R4                              ; 6255   02B4
        PULR    R7                              ; 6256   02B7

        JSR     R5,     .EXEC.A61               ; 6257   0004 0118 0261
        DECLE   $0001                           ; 625A   0001

        JSR     R5,     L_5618                  ; 625B   0004 0154 0218
        DECLE   $0000,  $0004,  $01A8,  $00D5   ; 625E   0000 0004 01A8 00D5
        DECLE   $0001,  $0004                   ; 6262   0001 0004

        ANDR    R5,     R0                      ; 6264   01A8
        MOVR    R1,     R3                      ; 6265   008B

        JSR     R5,     L_5179                  ; 6266   0004 0150 0179

        MVI     G_0199, R5                      ; 6269   0285 0199
        CMPI    #$0002, R5                      ; 626B   037D 0002
        BEQ     L_6290                          ; 626D   0204 0021

        CMPI    #$0004, R5                      ; 626F   037D 0004
        BEQ     L_628C                          ; 6271   0204 0019

        JSR     R5,     L_62AE                  ; 6273   0004 0160 02AE

L_6276:
        CLRR    R0                              ; 6276   01C0
        DECLE   $0004                           ; 6277   0004

        ANDR    R5,     R4                      ; 6278   01AC
        MVII    #$00E5, R3                      ; 6279   02BB 00E5
        SLR     R2,     1                       ; 627B   0062

        JSR     R5,     L_62B4                  ; 627C   0004 0160 02B4
        DECLE   $02B8,  $0004,  $0004,  $01AC   ; 627F   02B8 0004 0004 01AC
        DECLE   $02C3,  $0004,  $0154,  $0218   ; 6283   02C3 0004 0154 0218
        DECLE   $0003                           ; 6287   0003

        JSR     R5,     L_52EC                  ; 6288   0004 0150 02EC

        PULR    R7                              ; 628B   02B7

L_628C:
        MVII    #$0030, R4                      ; 628C   02BC 0030
        B       L_6276                          ; 628E   0220 0019

L_6290:
        MVII    #$0028, R4                      ; 6290   02BC 0028
        DECLE   $02BB,  $0060,  $0004,  $01AC   ; 6292   02BB 0060 0004 01AC
        DECLE   $02AC,  $00DC,  $0062,  $0280   ; 6296   02AC 00DC 0062 0280
        DECLE   $0197,  $0378,  $005F,  $022D   ; 629A   0197 0378 005F 022D
        DECLE   $001A,  $02BA,  $0030,  $0004   ; 629E   001A 02BA 0030 0004

        ANDR    R5,     R4                      ; 62A2   01AC
        SUB@    R1,     R6                      ; 62A3   030E
        MVO     R2,     G_035C                  ; 62A4   0242 035C
        MVII    #$000E, R0                      ; 62A6   02B8 000E

        JSR     R5,     X_SET_BIT               ; 62A8   0004 0114 02DB
        DECLE   $0355,  $0220,  $0029           ; 62AB   0355 0220 0029
L_62AE:
        MVII    #$0000, R4                      ; 62AE   02BC 0000
        MVI     G_019A, R3                      ; 62B0   0283 019A
        B       L_62B8                          ; 62B2   0200 0004

L_62B4:
        MVII    #$0038, R4                      ; 62B4   02BC 0038
        MVI     G_019C, R3                      ; 62B6   0283 019C
L_62B8:
        PSHR    R5                              ; 62B8   0275

        JSR     R5,     L_62BF                  ; 62B9   0004 0160 02BF

        SLL     R3,     2                       ; 62BC   004F
        ADDR    R3,     R4                      ; 62BD   00DC
        PULR    R7                              ; 62BE   02B7

L_62BF:
        PSHR    R5                              ; 62BF   0275
        DECLE   $0004                           ; 62C0   0004

        ANDR    R5,     R4                      ; 62C1   01AC
        MVI@    R4,     R3                      ; 62C2   02A3
        CLRR    R2                              ; 62C3   01D2
        DECR    R3                              ; 62C4   0013
        BEQ     L_62CE                          ; 62C5   0204 0007

        INCR    R3                              ; 62C7   000B
        SARC    R3,     1                       ; 62C8   007B
        SLL     R3,     1                       ; 62C9   004B
        RLC     R2,     1                       ; 62CA   0052
        NOP                                     ; 62CB   0034
        SLL     R2,     1                       ; 62CC   004A
        XORR    R2,     R0                      ; 62CD   01D0
L_62CE:
        MVO     R0,     G_018E                  ; 62CE   0240 018E
        PULR    R7                              ; 62D0   02B7

        PSHR    R5                              ; 62D1   0275
        MVI     G_0165, R0                      ; 62D2   0280 0165
        XORI    #$0008, R0                      ; 62D4   03F8 0008
        MVO     R0,     G_0165                  ; 62D6   0240 0165

        JSR     R5,     L_630E                  ; 62D8   0004 0160 030E

        PULR    R7                              ; 62DB   02B7

        JSR     R5,     L_630E                  ; 62DC   0004 0160 030E

        MVII    #$000F, R0                      ; 62DF   02B8 000F
        MVO     R0,     G_0165                  ; 62E1   0240 0165
        B       L_62FA                          ; 62E3   0200 0015

        JSR     R5,     L_630E                  ; 62E5   0004 0160 030E

        MVII    #$0009, R0                      ; 62E8   02B8 0009
        MVO     R0,     G_0165                  ; 62EA   0240 0165

        JSR     R5,     L_5618                  ; 62EC   0004 0154 0218
        DECLE   $0004                           ; 62EF   0004

        JSR     R5,     .EXEC.A61               ; 62F0   0004 0118 0261

        DECR    R4                              ; 62F3   0014
        MVI     G_0165, R0                      ; 62F4   0280 0165
        XORI    #$0004, R0                      ; 62F6   03F8 0004
        MVO     R0,     G_0165                  ; 62F8   0240 0165
L_62FA:
        MVI     G_01C6, R4                      ; 62FA   0284 01C6
        MOVR    R4,     R5                      ; 62FC   00A5
        ANDI    #$0002, R4                      ; 62FD   03BC 0002
        BEQ     L_6305                          ; 62FF   0204 0004

        MVII    #$0003, R0                      ; 6301   02B8 0003
        MVO     R0,     G_01CE                  ; 6303   0240 01CE
L_6305:
        ANDI    #$0001, R5                      ; 6305   03BD 0001
        BEQ     L_610B                          ; 6307   0224 01FD

        MVII    #$0003, R0                      ; 6309   02B8 0003
        MVO     R0,     G_01CB                  ; 630B   0240 01CB
        PULR    R7                              ; 630D   02B7

L_630E:
        PSHR    R5                              ; 630E   0275
        MVI     G_0328, R0                      ; 630F   0280 0328
        CMP     G_0330, R0                      ; 6311   0340 0330
        BMI     L_631C                          ; 6313   020B 0007

        MVII    #$0001, R0                      ; 6315   02B8 0001
        MVII    #$0002, R3                      ; 6317   02BB 0002

        JSR     R5,     L_5D86                  ; 6319   0004 015C 0186

L_631C:
        MVI     G_0348, R0                      ; 631C   0280 0348
        CMP     G_0350, R0                      ; 631E   0340 0350
        BMI     L_610B                          ; 6320   022B 0216

        MVII    #$0005, R0                      ; 6322   02B8 0005
        MVII    #$0006, R3                      ; 6324   02BB 0006

        JSR     R5,     L_5D86                  ; 6326   0004 015C 0186

        PULR    R7                              ; 6329   02B7

L_632A:
        PSHR    R5                              ; 632A   0275
        INCR    R7                              ; 632B   000F

L_632C:
        CLRR    R5                              ; 632C   01ED
L_632D:
        MVI     G_017E, R0                      ; 632D   0280 017E
        SARC    R0,     1                       ; 632F   0078
        BC      L_6343                          ; 6330   0201 0011

        ADDI    #$0160, R1                      ; 6332   02F9 0160
        MVI@    R1,     R2                      ; 6334   028A
        INCR    R2                              ; 6335   000A
        CMPI    #$0003, R2                      ; 6336   037A 0003
        BGT     L_6343                          ; 6338   020E 0009

        MVO@    R2,     R1                      ; 633A   024A
        SETC                                    ; 633B   0007
        RLC     R0,     1                       ; 633C   0050
        MVO     R0,     G_017E                  ; 633D   0240 017E

        JSR     R5,     X_PLAY_WHST1            ; 633F   0004 011C 031B

        PULR    R7                              ; 6342   02B7

L_6343:
        TSTR    R5                              ; 6343   00AD
        BEQ     L_6188                          ; 6344   0224 01BD
        PULR    R7                              ; 6346   02B7

L_6347:
        PSHR    R5                              ; 6347   0275
        DECLE   $00BD,  $02FD,  $000A,  $00C5   ; 6348   00BD 02FD 000A 00C5
        DECLE   $00C5,  $0001,  $02AC,  $0004   ; 634C   00C5 0001 02AC 0004

        ANDR    R5,     R0                      ; 6350   01A8
        ADDR    R3,     R7                      ; 6351   00DF
        PULR    R7                              ; 6352   02B7

        DECLE   $0077,  $0063,  $00E3,  $0063   ; 6353   0077 0063 00E3 0063
        DECLE   $0012,  $0064,  $003B,  $0064   ; 6357   0012 0064 003B 0064
        DECLE   $003B,  $0064,  $00D6,  $0065   ; 635B   003B 0064 00D6 0065
        DECLE   $007C,  $0064,  $00D0,  $0064   ; 635F   007C 0064 00D0 0064
        DECLE   $00E8,  $0064,  $003E,  $0065   ; 6363   00E8 0064 003E 0065
        DECLE   $006D,  $0065,  $00D6,  $0065   ; 6367   006D 0065 00D6 0065
        DECLE   $00B0,  $0065,  $00BE,  $0065   ; 636B   00B0 0065 00BE 0065
        DECLE   $0008,  $0066,  $007A,  $0066   ; 636F   0008 0066 007A 0066
        DECLE   $003F,  $0066,  $00B3,  $0066   ; 6373   003F 0066 00B3 0066
        DECLE   $0000,  $0000,  $0053,  $0045   ; 6377   0000 0000 0053 0045
        DECLE   $004C,  $0045,  $0043,  $0054   ; 637B   004C 0045 0043 0054
        DECLE   $0001,  $0014,  $004F,  $0046   ; 637F   0001 0014 004F 0046
        DECLE   $0046,  $0045,  $004E,  $0053   ; 6383   0046 0045 004E 0053
        DECLE   $0045,  $0001,  $003C,  $0031   ; 6387   0045 0001 003C 0031
        DECLE   $0001,  $0050,  $0032,  $0001   ; 638B   0001 0050 0032 0001
        DECLE   $0064,  $0033,  $0001,  $0078   ; 638F   0064 0033 0001 0078
        DECLE   $0034,  $0001,  $00A0,  $0036   ; 6393   0034 0001 00A0 0036
        DECLE   $0001,  $00B4,  $0037,  $0001   ; 6397   0001 00B4 0037 0001
        DECLE   $00C8,  $0038,  $0001,  $00DC   ; 639B   00C8 0038 0001 00DC
        DECLE   $0039,  $0002,  $0003,  $003E   ; 639F   0039 0002 0003 003E
        DECLE   $0066,  $006F,  $0072,  $006D   ; 63A3   0066 006F 0072 006D
        DECLE   $0074,  $006E,  $0001,  $0052   ; 63A7   0074 006E 0001 0052
        DECLE   $006B,  $0069,  $0063,  $006B   ; 63AB   006B 0069 0063 006B
        DECLE   $0001,  $0066,  $0072,  $0065   ; 63AF   0001 0066 0072 0065
        DECLE   $0063,  $0076,  $0072,  $0020   ; 63B3   0063 0076 0072 0020
        DECLE   $0031,  $0001,  $007A,  $0072   ; 63B7   0031 0001 007A 0072
        DECLE   $0065,  $0063,  $0076,  $0072   ; 63BB   0065 0063 0076 0072
        DECLE   $0020,  $0032,  $0001,  $00A2   ; 63BF   0020 0032 0001 00A2
        DECLE   $0074,  $0069,  $006D,  $0065   ; 63C3   0074 0069 006D 0065
        DECLE   $006F,  $0075,  $0074,  $0001   ; 63C7   006F 0075 0074 0001
        DECLE   $00B6,  $0073,  $0074,  $0061   ; 63CB   00B6 0073 0074 0061
        DECLE   $0074,  $0073,  $0001,  $00CA   ; 63CF   0074 0073 0001 00CA
        DECLE   $0063,  $006F,  $006E,  $0074   ; 63D3   0063 006F 006E 0074
        DECLE   $0072,  $006C,  $0073,  $0001   ; 63D7   0072 006C 0073 0001
        DECLE   $00DE,  $0042,  $0072,  $0065   ; 63DB   00DE 0042 0072 0065
        DECLE   $0061,  $006B,  $0021,  $0000   ; 63DF   0061 006B 0021 0000
        DECLE   $0000,  $0000,  $0053,  $0045   ; 63E3   0000 0000 0053 0045
        DECLE   $004C,  $0045,  $0043,  $0054   ; 63E7   004C 0045 0043 0054
        DECLE   $0001,  $0014,  $0046,  $004F   ; 63EB   0001 0014 0046 004F
        DECLE   $0052,  $004D,  $0041,  $0054   ; 63EF   0052 004D 0041 0054
        DECLE   $0049,  $004F,  $004E,  $0001   ; 63F3   0049 004F 004E 0001
        DECLE   $0065,  $0031,  $0020,  $0020   ; 63F7   0065 0031 0020 0020
        DECLE   $0032,  $0020,  $0020,  $0033   ; 63FB   0032 0020 0020 0033
        DECLE   $0001,  $00A1,  $0034,  $0020   ; 63FF   0001 00A1 0034 0020
        DECLE   $0020,  $0035,  $0020,  $0020   ; 6403   0020 0035 0020 0020
        DECLE   $0036,  $0001,  $00DD,  $0037   ; 6407   0036 0001 00DD 0037
        DECLE   $0020,  $0020,  $0038,  $0020   ; 640B   0020 0020 0038 0020
        DECLE   $0020,  $0039,  $0000,  $0000   ; 640F   0020 0039 0000 0000
        DECLE   $0000,  $0053,  $0045,  $004C   ; 6413   0000 0053 0045 004C
        DECLE   $0045,  $0043,  $0054,  $0001   ; 6417   0045 0043 0054 0001
        DECLE   $0014,  $004B,  $0049,  $0043   ; 641B   0014 004B 0049 0043
        DECLE   $004B,  $0020,  $0050,  $004C   ; 641F   004B 0020 0050 004C
        DECLE   $0041,  $0059,  $0001,  $003C   ; 6423   0041 0059 0001 003C
        DECLE   $0031,  $0001,  $0050,  $0032   ; 6427   0031 0001 0050 0032
        DECLE   $0002,  $0003,  $003E,  $0070   ; 642B   0002 0003 003E 0070
        DECLE   $0075,  $006E,  $0074,  $0001   ; 642F   0075 006E 0074 0001
        DECLE   $0052,  $0066,  $002E,  $0067   ; 6433   0052 0066 002E 0067
        DECLE   $006F,  $0061,  $006C,  $0000   ; 6437   006F 0061 006C 0000
        DECLE   $0000,  $0000,  $0050,  $0052   ; 643B   0000 0000 0050 0052
        DECLE   $004F,  $0047,  $0052,  $0041   ; 643F   004F 0047 0052 0041
        DECLE   $004D,  $0001,  $0014,  $0052   ; 6443   004D 0001 0014 0052
        DECLE   $0045,  $0043,  $0045,  $0049   ; 6447   0045 0043 0045 0049
        DECLE   $0056,  $0045,  $0052,  $0001   ; 644B   0056 0045 0052 0001
        DECLE   $003D,  $0031,  $0020,  $0032   ; 644F   003D 0031 0020 0032
        DECLE   $0020,  $0033,  $0001,  $0065   ; 6453   0020 0033 0001 0065
        DECLE   $0034,  $0020,  $0035,  $0020   ; 6457   0034 0020 0035 0020
        DECLE   $0036,  $0001,  $008D,  $0037   ; 645B   0036 0001 008D 0037
        DECLE   $0020,  $0038,  $0020,  $0039   ; 645F   0020 0038 0020 0039
        DECLE   $0001,  $00B5,  $0063,  $0020   ; 6463   0001 00B5 0063 0020
        DECLE   $0020,  $0020,  $0065,  $0002   ; 6467   0020 0020 0065 0002
        DECLE   $0003,  $0052,  $0148,  $0149   ; 646B   0003 0052 0148 0149
        DECLE   $014A,  $0001,  $007A,  $014D   ; 646F   014A 0001 007A 014D
        DECLE   $014E,  $014F,  $0001,  $0066   ; 6473   014E 014F 0001 0066
        DECLE   $014B,  $0001,  $0068,  $014C   ; 6477   014B 0001 0068 014C
        DECLE   $0000,  $0000,  $0000,  $004B   ; 647B   0000 0000 0000 004B
        DECLE   $0045,  $0059,  $0053,  $0001   ; 647F   0045 0059 0053 0001
        DECLE   $00B4,  $0057,  $0048,  $0045   ; 6483   00B4 0057 0048 0045
        DECLE   $0045,  $004C,  $0002,  $0003   ; 6487   0045 004C 0002 0003
        DECLE   $0014,  $0061,  $006E,  $0079   ; 648B   0014 0061 006E 0079
        DECLE   $0020,  $0073,  $0069,  $0064   ; 648F   0020 0073 0069 0064
        DECLE   $0065,  $0001,  $0050,  $0074   ; 6493   0065 0001 0050 0074
        DECLE   $006F,  $0070,  $0020,  $0073   ; 6497   006F 0070 0020 0073
        DECLE   $0069,  $0064,  $0065,  $0001   ; 649B   0069 0064 0065 0001
        DECLE   $0078,  $0062,  $006F,  $0074   ; 649F   0078 0062 006F 0074
        DECLE   $006D,  $0020,  $0073,  $0069   ; 64A3   006D 0020 0073 0069
        DECLE   $0064,  $0065,  $0001,  $0029   ; 64A7   0064 0065 0001 0029
        DECLE   $0048,  $0049,  $004B,  $0045   ; 64AB   0048 0049 004B 0045
        DECLE   $0020,  $006F,  $0072,  $0001   ; 64AF   0020 006F 0072 0001
        DECLE   $003D,  $004B,  $0049,  $0043   ; 64B3   003D 004B 0049 0043
        DECLE   $004B,  $0001,  $0065,  $0050   ; 64B7   004B 0001 0065 0050
        DECLE   $0041,  $0053,  $0053,  $0020   ; 64BB   0041 0053 0053 0020
        DECLE   $0052,  $0031,  $0001,  $008D   ; 64BF   0052 0031 0001 008D
        DECLE   $0050,  $0041,  $0053,  $0053   ; 64C3   0050 0041 0053 0053
        DECLE   $0020,  $0052,  $0032,  $0001   ; 64C7   0020 0052 0032 0001
        DECLE   $00C9,  $0052,  $0055,  $004E   ; 64CB   00C9 0052 0055 004E
        DECLE   $0000,  $0000,  $0015,  $0057   ; 64CF   0000 0000 0015 0057
        DECLE   $0061,  $0069,  $0074,  $0069   ; 64D3   0061 0069 0074 0069
        DECLE   $006E,  $0067,  $0001,  $002B   ; 64D7   006E 0067 0001 002B
        DECLE   $0066,  $006F,  $0072,  $0001   ; 64DB   0066 006F 0072 0001
        DECLE   $003D,  $0064,  $0065,  $0066   ; 64DF   003D 0064 0065 0066
        DECLE   $0065,  $006E,  $0073,  $0065   ; 64E3   0065 006E 0073 0065
        DECLE   $0000,  $0000,  $0000,  $0053   ; 64E7   0000 0000 0000 0053
        DECLE   $0045,  $004C,  $0045,  $0043   ; 64EB   0045 004C 0045 0043
        DECLE   $0054,  $0001,  $0014,  $0044   ; 64EF   0054 0001 0014 0044
        DECLE   $0045,  $0046,  $0045,  $004E   ; 64F3   0045 0046 0045 004E
        DECLE   $0053,  $0045,  $0001,  $003C   ; 64F7   0053 0045 0001 003C
        DECLE   $0031,  $0001,  $0050,  $0032   ; 64FB   0031 0001 0050 0032
        DECLE   $0001,  $00A0,  $0036,  $0001   ; 64FF   0001 00A0 0036 0001
        DECLE   $00B4,  $0037,  $0001,  $00C8   ; 6503   00B4 0037 0001 00C8
        DECLE   $0038,  $0001,  $00DC,  $0039   ; 6507   0038 0001 00DC 0039
        DECLE   $0002,  $0003,  $003E,  $0066   ; 650B   0002 0003 003E 0066
        DECLE   $006F,  $0072,  $006D,  $0074   ; 650F   006F 0072 006D 0074
        DECLE   $006E,  $0001,  $0052,  $0074   ; 6513   006E 0001 0052 0074
        DECLE   $0061,  $0063,  $0074,  $0069   ; 6517   0061 0063 0074 0069
        DECLE   $0063,  $0001,  $00A2,  $0074   ; 651B   0063 0001 00A2 0074
        DECLE   $0069,  $006D,  $0065,  $006F   ; 651F   0069 006D 0065 006F
        DECLE   $0075,  $0074,  $0001,  $00B6   ; 6523   0075 0074 0001 00B6
        DECLE   $0073,  $0074,  $0061,  $0074   ; 6527   0073 0074 0061 0074
        DECLE   $0073,  $0001,  $00CA,  $0063   ; 652B   0073 0001 00CA 0063
        DECLE   $006F,  $006E,  $0074,  $0072   ; 652F   006F 006E 0074 0072
        DECLE   $006C,  $0073,  $0001,  $00DE   ; 6533   006C 0073 0001 00DE
        DECLE   $0042,  $0072,  $0065,  $0061   ; 6537   0042 0072 0065 0061
        DECLE   $006B,  $0021,  $0000,  $0000   ; 653B   006B 0021 0000 0000
        DECLE   $0000,  $0053,  $0045,  $004C   ; 653F   0000 0053 0045 004C
        DECLE   $0045,  $0043,  $0054,  $0001   ; 6543   0045 0043 0054 0001
        DECLE   $0014,  $0046,  $004F,  $0052   ; 6547   0014 0046 004F 0052
        DECLE   $004D,  $0041,  $0054,  $0049   ; 654B   004D 0041 0054 0049
        DECLE   $004F,  $004E,  $0001,  $0065   ; 654F   004F 004E 0001 0065
        DECLE   $0031,  $0020,  $0020,  $0032   ; 6553   0031 0020 0020 0032
        DECLE   $0020,  $0020,  $0033,  $0001   ; 6557   0020 0020 0033 0001
        DECLE   $00A1,  $0034,  $0020,  $0020   ; 655B   00A1 0034 0020 0020
        DECLE   $0035,  $0020,  $0020,  $0036   ; 655F   0035 0020 0020 0036
        DECLE   $0001,  $00DD,  $0037,  $0020   ; 6563   0001 00DD 0037 0020
        DECLE   $0020,  $0038,  $0020,  $0020   ; 6567   0020 0038 0020 0020
        DECLE   $0039,  $0000,  $0000,  $0000   ; 656B   0039 0000 0000 0000
        DECLE   $0053,  $0045,  $004C,  $0045   ; 656F   0053 0045 004C 0045
        DECLE   $0043,  $0054,  $0001,  $0014   ; 6573   0043 0054 0001 0014
        DECLE   $0054,  $0041,  $0043,  $0054   ; 6577   0054 0041 0043 0054
        DECLE   $0049,  $0043,  $0001,  $003C   ; 657B   0049 0043 0001 003C
        DECLE   $0031,  $0001,  $0050,  $0032   ; 657F   0031 0001 0050 0032
        DECLE   $0001,  $0064,  $0033,  $0001   ; 6583   0001 0064 0033 0001
        DECLE   $0078,  $0034,  $0002,  $0003   ; 6587   0078 0034 0002 0003
        DECLE   $003E,  $0062,  $006C,  $0069   ; 658B   003E 0062 006C 0069
        DECLE   $0074,  $007A,  $0001,  $0052   ; 658F   0074 007A 0001 0052
        DECLE   $0063,  $006F,  $0076,  $0072   ; 6593   0063 006F 0076 0072
        DECLE   $0020,  $0052,  $0031,  $0001   ; 6597   0020 0052 0031 0001
        DECLE   $0066,  $0063,  $006F,  $0076   ; 659B   0066 0063 006F 0076
        DECLE   $0072,  $0020,  $0052,  $0032   ; 659F   0072 0020 0052 0032
        DECLE   $0001,  $007A,  $0063,  $006F   ; 65A3   0001 007A 0063 006F
        DECLE   $0076,  $0072,  $0001,  $008F   ; 65A7   0076 0072 0001 008F
        DECLE   $0042,  $004F,  $0054,  $0048   ; 65AB   0042 004F 0054 0048
        DECLE   $0000,  $0000,  $0000,  $0057   ; 65AF   0000 0000 0000 0057
        DECLE   $0048,  $0045,  $0045,  $004C   ; 65B3   0048 0045 0045 004C
        DECLE   $0002,  $0003,  $0015,  $0052   ; 65B7   0002 0003 0015 0052
        DECLE   $0055,  $004E,  $0000,  $0000   ; 65BB   0055 004E 0000 0000
        DECLE   $0015,  $0057,  $0061,  $0069   ; 65BF   0015 0057 0061 0069
        DECLE   $0074,  $0069,  $006E,  $0067   ; 65C3   0074 0069 006E 0067
        DECLE   $0001,  $002B,  $0066,  $006F   ; 65C7   0001 002B 0066 006F
        DECLE   $0072,  $0001,  $003D,  $006F   ; 65CB   0072 0001 003D 006F
        DECLE   $0066,  $0066,  $0065,  $006E   ; 65CF   0066 0066 0065 006E
        DECLE   $0073,  $0065,  $0000,  $0001   ; 65D3   0073 0065 0000 0001
        DECLE   $0002,  $0048,  $006F,  $006D   ; 65D7   0002 0048 006F 006D
        DECLE   $0065,  $0002,  $0002,  $0016   ; 65DB   0065 0002 0002 0016
        DECLE   $0056,  $0073,  $0074,  $0072   ; 65DF   0056 0073 0074 0072
        DECLE   $0002,  $0003,  $0041,  $0026   ; 65E3   0002 0003 0041 0026
        DECLE   $0020,  $0047,  $0001,  $0050   ; 65E7   0020 0047 0001 0050
        DECLE   $006F,  $006E,  $0020,  $0074   ; 65EB   006F 006E 0020 0074
        DECLE   $0068,  $0065,  $0020,  $0035   ; 65EF   0068 0065 0020 0035
        DECLE   $0030,  $0001,  $007C,  $003A   ; 65F3   0030 0001 007C 003A
        DECLE   $0001,  $0091,  $0071,  $0074   ; 65F7   0001 0091 0071 0074
        DECLE   $0072,  $0001,  $00B4,  $0054   ; 65FB   0072 0001 00B4 0054
        DECLE   $0069,  $006D,  $0065,  $0020   ; 65FF   0069 006D 0065 0020
        DECLE   $006F,  $0075,  $0074,  $0073   ; 6603   006F 0075 0074 0073
        DECLE   $0000,  $0003,  $003D,  $012C   ; 6607   0000 0003 003D 012C
        DECLE   $012E,  $0020,  $0120,  $0020   ; 660B   012E 0020 0120 0020
        DECLE   $0020,  $0122,  $0001           ; 660F   0020 0122 0001

        RLC     R1,     1                       ; 6612   0051
        SUBR    R5,     R5                      ; 6613   012D
        SUBR    R5,     R7                      ; 6614   012F

        DECLE   $0020,  $0121,  $0020,  $0020   ; 6615   0020 0121 0020 0020
        DECLE   $0123,  $0001,  $0079,  $0120   ; 6619   0123 0001 0079 0120
        DECLE   $0020,  $0020,  $0125,  $0020   ; 661D   0020 0020 0125 0020
        DECLE   $0020,  $0120,  $0001,  $008D   ; 6621   0020 0120 0001 008D
        DECLE   $0124,  $0020,  $0020,  $0123   ; 6625   0124 0020 0020 0123
        DECLE   $0020,  $0020,  $0126,  $0001   ; 6629   0020 0020 0126 0001

        MOVR    R6,     R5                      ; 662D   00B5
        SUBR    R4,     R7                      ; 662E   0127

        DECLE   $0020,  $0020,  $0128,  $0020   ; 662F   0020 0020 0128 0020
        DECLE   $0020,  $012A,  $0001,  $00C9   ; 6633   0020 012A 0001 00C9
        DECLE   $0123,  $0020,  $0020,  $0129   ; 6637   0123 0020 0020 0129
        DECLE   $0020,  $0020,  $012B,  $0000   ; 663B   0020 0020 012B 0000
        DECLE   $0003,  $003C,  $0130,  $0132   ; 663F   0003 003C 0130 0132
        DECLE   $0020,  $0020,  $0134,  $0020   ; 6643   0020 0020 0134 0020
        DECLE   $0020,  $0136,  $0001,  $0050   ; 6647   0020 0136 0001 0050
        DECLE   $0131,  $0133,  $0020,  $0020   ; 664B   0131 0133 0020 0020
        DECLE   $0135,  $0020,  $0020,  $0137   ; 664F   0135 0020 0020 0137
        DECLE   $0001,  $0079,  $0138,  $0020   ; 6653   0001 0079 0138 0020
        DECLE   $0020,  $013A,  $0020,  $013E   ; 6657   0020 013A 0020 013E
        DECLE   $013C,  $0001,  $008D,  $0139   ; 665B   013C 0001 008D 0139
        DECLE   $0020,  $0020,  $013B,  $0020   ; 665F   0020 0020 013B 0020
        DECLE   $013F,  $013D,  $0001,  $00B4   ; 6663   013F 013D 0001 00B4
        DECLE   $0142,  $0140,  $0020,  $0020   ; 6667   0142 0140 0020 0020
        DECLE   $0144,  $0020,  $0020,  $0146   ; 666B   0144 0020 0020 0146
        DECLE   $0001,  $00C8,  $0143,  $0141   ; 666F   0001 00C8 0143 0141
        DECLE   $0020,  $0020,  $0145,  $0020   ; 6673   0020 0020 0145 0020
        DECLE   $0020,  $0147,  $0000,  $0003   ; 6677   0020 0147 0000 0003
        DECLE   $003C,  $012E,  $012C,  $0020   ; 667B   003C 012E 012C 0020
        DECLE   $0020,  $0120,  $0020,  $0020   ; 667F   0020 0120 0020 0020
        DECLE   $0122,  $0001                   ; 6683   0122 0001

        RLC     R0,     1                       ; 6685   0050
        SUBR    R5,     R7                      ; 6686   012F

        DECLE   $012D,  $0020,  $0020,  $0121   ; 6687   012D 0020 0020 0121
        DECLE   $0020,  $0020,  $0123,  $0001   ; 668B   0020 0020 0123 0001
        DECLE   $0079,  $0120,  $0020,  $0020   ; 668F   0079 0120 0020 0020
        DECLE   $0125,  $0020,  $0020,  $0120   ; 6693   0125 0020 0020 0120
        DECLE   $0001,  $008D,  $0124,  $0020   ; 6697   0001 008D 0124 0020
        DECLE   $0020,  $0123,  $0020,  $0020   ; 669B   0020 0123 0020 0020
        DECLE   $0126,  $0001                   ; 669F   0126 0001

        MOVR    R6,     R5                      ; 66A1   00B5
        SUBR    R4,     R7                      ; 66A2   0127

        DECLE   $0020,  $0020,  $0128,  $0020   ; 66A3   0020 0020 0128 0020
        DECLE   $0020,  $012A,  $0001,  $00C9   ; 66A7   0020 012A 0001 00C9
        DECLE   $0123,  $0020,  $0020,  $0129   ; 66AB   0123 0020 0020 0129
        DECLE   $0020,  $0020,  $012B,  $0000   ; 66AF   0020 0020 012B 0000
        DECLE   $0003,  $003D,  $0132,  $0130   ; 66B3   0003 003D 0132 0130
        DECLE   $0020,  $0134,  $0020,  $0020   ; 66B7   0020 0134 0020 0020
        DECLE   $0136,  $0001,  $0051,  $0133   ; 66BB   0136 0001 0051 0133
        DECLE   $0131,  $0020,  $0135,  $0020   ; 66BF   0131 0020 0135 0020
        DECLE   $0020,  $0137,  $0001,  $0079   ; 66C3   0020 0137 0001 0079
        DECLE   $0138,  $0020,  $0020,  $013A   ; 66C7   0138 0020 0020 013A
        DECLE   $0020,  $0020,  $013C,  $013E   ; 66CB   0020 0020 013C 013E
        DECLE   $0001,  $008D,  $0139,  $0020   ; 66CF   0001 008D 0139 0020
        DECLE   $0020,  $013B,  $0020,  $0020   ; 66D3   0020 013B 0020 0020
        DECLE   $013D,  $013F,  $0001,  $00B5   ; 66D7   013D 013F 0001 00B5
        DECLE   $0140,  $0142,  $0020,  $0144   ; 66DB   0140 0142 0020 0144
        DECLE   $0020,  $0020,  $0146,  $0001   ; 66DF   0020 0020 0146 0001
        DECLE   $00C9,  $0141,  $0143,  $0020   ; 66E3   00C9 0141 0143 0020
        DECLE   $0145,  $0020,  $0020,  $0147   ; 66E7   0145 0020 0020 0147
        DECLE   $0000                           ; 66EB   0000
L_66EC:
        MVI@    R5,     R0                      ; 66EC   02A8
        NEGR    R0                              ; 66ED   0020
        B       L_66F1                          ; 66EE   0200 0001

L_66F0:
        MVI@    R5,     R0                      ; 66F0   02A8
L_66F1:
        PSHR    R5                              ; 66F1   0275

        JSR     R5,     L_6724                  ; 66F2   0004 0164 0324

        ADCR    R7                              ; 66F5   002F

        NEGR    R0                              ; 66F6   0020
L_66F7:
        SUBR    R0,     R2                      ; 66F7   0102
        BGE     L_66FB                          ; 66F8   020D 0001

        ADDR    R0,     R2                      ; 66FA   00C2
L_66FB:
        PULR    R7                              ; 66FB   02B7

        DECLE   $0000,  $0006,  $0004,  $0002   ; 66FC   0000 0006 0004 0002
        DECLE   $0008,  $0005,  $0000           ; 6700   0008 0005 0000

        INCR    R2                              ; 6703   000A
        INCR    R4                              ; 6704   000C
        INCR    R6                              ; 6705   000E
L_6706:
        PSHR    R5                              ; 6706   0275
        CLRR    R5                              ; 6707   01ED
        CMPI    #$0005, R2                      ; 6708   037A 0005
        BEQ     L_6717                          ; 670A   0204 000B

        PSHR    R1                              ; 670C   0271
        SDBD                                    ; 670D   0001
        ADDI    #$66FC, R2                      ; 670E   02FA 00FC 0066
        MVI@    R2,     R1                      ; 6711   0291

        JSR     R5,     .EXEC.629               ; 6712   0004 0114 0229

        PULR    R1                              ; 6715   02B1
        MOVR    R0,     R5                      ; 6716   0085
L_6717:
        MOVR    R5,     R0                      ; 6717   00A8
        PULR    R7                              ; 6718   02B7

L_6719:
        PSHR    R5                              ; 6719   0275
        PSHR    R0                              ; 671A   0270

        JSR     R5,     X_RAND2                 ; 671B   0004 0114 029E

        MOVR    R0,     R1                      ; 671E   0081
        PULR    R0                              ; 671F   02B0

        JSR     R5,     X_RAND2                 ; 6720   0004 0114 029E

        PULR    R7                              ; 6723   02B7

L_6724:
        PSHR    R0                              ; 6724   0270
        MVI     G_017B, R0                      ; 6725   0280 017B
        XOR     G_015E, R0                      ; 6727   03C0 015E
        COMR    R0                              ; 6729   0018
        SARC    R0,     1                       ; 672A   0078
        PULR    R0                              ; 672B   02B0
        MOVR    R5,     R7                      ; 672C   00AF

L_672D:
        PSHR    R0                              ; 672D   0270
        MVI     G_017B, R0                      ; 672E   0280 017B
        XOR     G_015E, R0                      ; 6730   03C0 015E
        SARC    R0,     1                       ; 6732   0078
        PULR    R0                              ; 6733   02B0
        MOVR    R5,     R7                      ; 6734   00AF

        DECLE   $0008,  $0007,  $0006,  $0005   ; 6735   0008 0007 0006 0005
        DECLE   $0004,  $0003,  $0002,  $0001   ; 6739   0004 0003 0002 0001
        DECLE   $0000                           ; 673D   0000

        INCR    R7                              ; 673E   000F

        INCR    R6                              ; 673F   000E
L_6740:
        INCR    R5                              ; 6740   000D
        INCR    R4                              ; 6741   000C
        INCR    R3                              ; 6742   000B
        INCR    R2                              ; 6743   000A
        INCR    R1                              ; 6744   0009
L_6745:
        PSHR    R5                              ; 6745   0275

        JSR     R5,     L_672D                  ; 6746   0004 0164 032D
        DECLE   $0229,  $004F,  $03B9,  $000F   ; 6749   0229 004F 03B9 000F
        DECLE   $0001                           ; 674D   0001

        ADDI    #$0035, R1                      ; 674E   02F9 0035
        SLR     R3,     2                       ; 6750   0067
        MVI@    R1,     R1                      ; 6751   0289
        PULR    R7                              ; 6752   02B7

L_6753:
        PSHR    R5                              ; 6753   0275
        PSHR    R2                              ; 6754   0272
        ADDI    #$0002, R1                      ; 6755   02F9 0002
        MVI@    R1,     R2                      ; 6757   028A
        SUBI    #$0002, R1                      ; 6758   0339 0002
        SWAP    R2,     1                       ; 675A   0042
        ANDI    #$00FF, R2                      ; 675B   03BA 00FF
        MOVR    R2,     R5                      ; 675D   0095
        MVI     G_031F, R2                      ; 675E   0282 031F
        SWAP    R2,     1                       ; 6760   0042
        ANDI    #$00FF, R2                      ; 6761   03BA 00FF
        SUBR    R5,     R2                      ; 6763   012A

        JSR     R5,     L_6724                  ; 6764   0004 0164 0324

        ADCR    R7                              ; 6767   002F

        NEGR    R2                              ; 6768   0022
L_6769:
        RLC     R2,     1                       ; 6769   0052
        PULR    R2                              ; 676A   02B2
        PULR    R7                              ; 676B   02B7

        PSHR    R5                              ; 676C   0275

        JSR     R5,     .EXEC.76C               ; 676D   0004 0114 036C

        INCR    R7                              ; 6770   000F

L_6771:
        PSHR    R5                              ; 6771   0275
L_6772:
        PSHR    R1                              ; 6772   0271
        ADDI    #$0002, R1                      ; 6773   02F9 0002
        PSHR    R0                              ; 6775   0270
        MOVR    R1,     R5                      ; 6776   008D
        MVI@    R5,     R2                      ; 6777   02AA
        SLR     R2,     1                       ; 6778   0062
        MVI@    R5,     R3                      ; 6779   02AB
        MVI@    R5,     R0                      ; 677A   02A8
        MOVR    R0,     R1                      ; 677B   0081

        JSR     R5,     X_EXT_SIGN_LO           ; 677C   0004 0114 0268

        XORR    R0,     R1                      ; 677F   01C1
        XORR    R1,     R0                      ; 6780   01C8
        XORR    R0,     R1                      ; 6781   01C1

        JSR     R5,     X_EXT_SIGN_HI           ; 6782   0004 0114 0269

        SLL     R0,     1                       ; 6785   0048
        SLL     R1,     2                       ; 6786   004D
        ADDR    R0,     R2                      ; 6787   00C2
        SLL     R2,     1                       ; 6788   004A
        ADDR    R1,     R3                      ; 6789   00CB
        SWAP    R2,     1                       ; 678A   0042
        SWAP    R3,     1                       ; 678B   0043
        ANDI    #$00FF, R2                      ; 678C   03BA 00FF
        ANDI    #$00FF, R3                      ; 678E   03BB 00FF
        PULR    R0                              ; 6790   02B0
        PULR    R1                              ; 6791   02B1
        PULR    R7                              ; 6792   02B7

L_6793:
        PSHR    R5                              ; 6793   0275
        ADDI    #$0002, R1                      ; 6794   02F9 0002
        MVI@    R1,     R0                      ; 6796   0288
        SUBI    #$0002, R1                      ; 6797   0339 0002
        SWAP    R0,     1                       ; 6799   0040
        ANDI    #$00FF, R0                      ; 679A   03B8 00FF
        SAR     R0,     2                       ; 679C   006C
        INCR    R0                              ; 679D   0008
        SAR     R0,     1                       ; 679E   0068
        SUBI    #$000E, R0                      ; 679F   0338 000E
        ADD     G_0181, R0                      ; 67A1   02C0 0181

        JSR     R5,     L_5634                  ; 67A3   0004 0154 0234

        ADCR    R0                              ; 67A6   0028

        JSR     R5,     L_5163                  ; 67A7   0004 0150 0163

        SUB     G_0197, R0                      ; 67AA   0300 0197
        PULR    R7                              ; 67AC   02B7

L_67AD:
        PSHR    R5                              ; 67AD   0275
        MVI     G_0171, R0                      ; 67AE   0280 0171
        DECR    R0                              ; 67B0   0010
        BLE     L_66FB                          ; 67B1   0226 00B7

        MVII    #$016D, R4                      ; 67B3   02BC 016D
        MVI@    R4,     R0                      ; 67B5   02A0
        SWAP    R0,     1                       ; 67B6   0040
        XOR@    R4,     R0                      ; 67B7   03E0
        MVI@    R4,     R3                      ; 67B8   02A3
        SWAP    R3,     1                       ; 67B9   0043
        XOR@    R4,     R3                      ; 67BA   03E3
        SUBI    #$0004, R4                      ; 67BB   033C 0004
        MOVR    R0,     R2                      ; 67BD   0082
        SLL     R2,     2                       ; 67BE   004E
        MVI     G_015D, R5                      ; 67BF   0285 015D
        CMPI    #$0007, R5                      ; 67C1   037D 0007
        BNEQ    L_67C7                          ; 67C3   020C 0002

        SLL     R2,     2                       ; 67C5   004E
        ADDR    R2,     R2                      ; 67C6   00D2
L_67C7:
        ADDR    R2,     R3                      ; 67C7   00D3
        BMI     L_67E5                          ; 67C8   020B 001B

        DECR    R0                              ; 67CA   0010
        DECR    R0                              ; 67CB   0010
        SWAP    R0,     1                       ; 67CC   0040
        MVO@    R0,     R4                      ; 67CD   0260
        NOP                                     ; 67CE   0034
        SWAP    R0,     1                       ; 67CF   0040
        MVO@    R0,     R4                      ; 67D0   0260
        NOP                                     ; 67D1   0034
        SWAP    R3,     1                       ; 67D2   0043
        MVO@    R3,     R4                      ; 67D3   0263
        NOP                                     ; 67D4   0034
        SWAP    R3,     1                       ; 67D5   0043
        MVO@    R3,     R4                      ; 67D6   0263
        MVI     G_0196, R0                      ; 67D7   0280 0196

        JSR     R5,     .EXEC.772               ; 67D9   0004 0114 0372

        SUB     G_016F, R3                      ; 67DC   0303 016F
        BGE     L_67E1                          ; 67DE   020D 0001

        CLRR    R3                              ; 67E0   01DB
L_67E1:
        SWAP    R3,     1                       ; 67E1   0043
        MVO     R3,     G_0338                  ; 67E2   0243 0338
        PULR    R7                              ; 67E4   02B7

L_67E5:
        CLRR    R0                              ; 67E5   01C0
        MVO@    R0,     R4                      ; 67E6   0260
        MVO@    R0,     R4                      ; 67E7   0260
        NOP                                     ; 67E8   0034
        MVO@    R0,     R4                      ; 67E9   0260
        MVO@    R0,     R4                      ; 67EA   0260
        INCR    R0                              ; 67EB   0008
        MVO     R0,     G_0171                  ; 67EC   0240 0171
        PULR    R7                              ; 67EE   02B7

        PSHR    R5                              ; 67EF   0275
        MVI     G_0174, R4                      ; 67F0   0284 0174
        INCR    R4                              ; 67F2   000C
        ADDR    R7,     R4                      ; 67F3   00FC
        ADD@    R4,     R7                      ; 67F4   02E7

        CLRC                                    ; 67F5   0006
        COMR    R5                              ; 67F6   001D
        NEGR    R1                              ; 67F7   0021
        NEGR    R1                              ; 67F8   0021
        NOP                                     ; 67F9   0034
        SLR     R3,     1                       ; 67FA   0063
        MVII    #$0004, R4                      ; 67FB   02BC 0004
        MVI     G_01C6, R3                      ; 67FD   0283 01C6
        ANDI    #$00C0, R3                      ; 67FF   03BB 00C0
        CMPI    #$00C0, R3                      ; 6801   037B 00C0
        BEQ     L_6810                          ; 6803   0204 000B

        DECR    R4                              ; 6805   0014
        CMPI    #$0080, R3                      ; 6806   037B 0080
        BEQ     L_6810                          ; 6808   0204 0006

        DECR    R4                              ; 680A   0014
        CMPI    #$0040, R3                      ; 680B   037B 0040
        BEQ     L_6810                          ; 680D   0204 0001

        DECR    R4                              ; 680F   0014
L_6810:
        MVO     R4,     G_0174                  ; 6810   0244 0174

L_6812:
        JSR     R5,     L_6875                  ; 6812   0004 0168 0075

        PULR    R7                              ; 6815   02B7

        MVI     G_0199, R4                      ; 6816   0284 0199
        CMPI    #$0003, R4                      ; 6818   037C 0003
        BNEQ    L_6848                          ; 681A   020C 002C

        MVI     G_0174, R0                      ; 681C   0280 0174
        SUBI    #$0001, R0                      ; 681E   0338 0001

L_6820:
        JSR     R5,     L_68F4                  ; 6820   0004 0168 00F4
        DECLE   $0004                           ; 6823   0004

        ANDR    R4,     R4                      ; 6824   01A4
        BLT     L_6820                          ; 6825   0225 0006

        MVO@    R0,     R1                      ; 6827   0248
        PULR    R7                              ; 6828   02B7

        MVI     G_0199, R4                      ; 6829   0284 0199
        CMPI    #$0003, R4                      ; 682B   037C 0003
        BNEQ    L_6848                          ; 682D   020C 0019

        PSHR    R1                              ; 682F   0271
        MVII    #$0001, R0                      ; 6830   02B8 0001
        MVII    #$0002, R1                      ; 6832   02B9 0002

        JSR     R5,     L_6933                  ; 6834   0004 0168 0133

        SWAP    R2,     1                       ; 6837   0042
L_6838:
        XORR    R3,     R2                      ; 6838   01DA
        DECLE   $0004                           ; 6839   0004

        ANDR    R4,     R4                      ; 683A   01A4
        BLT     L_6838                          ; 683B   0225 0004

        MOVR    R0,     R3                      ; 683D   0083
        PULR    R1                              ; 683E   02B1

        JSR     R5,     .EXEC.9A1               ; 683F   0004 0118 01A1

        ADDI    #$0006, R1                      ; 6842   02F9 0006

        JSR     R5,     L_6991                  ; 6844   0004 0168 0191

        PULR    R7                              ; 6847   02B7

L_6848:
        MVI     G_0171, R4                      ; 6848   0284 0171
        CMPI    #$0002, R4                      ; 684A   037C 0002
        BEQ     L_6854                          ; 684C   0204 0006

        MVII    #$0001, R4                      ; 684E   02BC 0001
        MVO     R4,     G_0174                  ; 6850   0244 0174
        B       L_6812                          ; 6852   0220 0041

L_6854:
        MVII    #$0005, R4                      ; 6854   02BC 0005
        MVO     R4,     G_0174                  ; 6856   0244 0174
        PSHR    R1                              ; 6858   0271
        MVI     G_0196, R0                      ; 6859   0280 0196

        JSR     R5,     .EXEC.76C               ; 685B   0004 0114 036C

        ADDI    #$0006, R1                      ; 685E   02F9 0006
        MVI@    R1,     R0                      ; 6860   0288
        PULR    R1                              ; 6861   02B1
        CMPI    #$000C, R0                      ; 6862   0378 000C
        BGE     L_686E                          ; 6864   020D 0008

        MVII    #$0001, R0                      ; 6866   02B8 0001
        MVO     R0,     G_0174                  ; 6868   0240 0174

        JSR     R5,     L_5EA0                  ; 686A   0004 015C 02A0

        PULR    R7                              ; 686D   02B7

L_686E:
        JSR     R5,     L_6922                  ; 686E   0004 0168 0122
        JSR     R5,     L_6991                  ; 6871   0004 0168 0191

        PULR    R7                              ; 6874   02B7

L_6875:
        PSHR    R5                              ; 6875   0275
        PSHR    R1                              ; 6876   0271
        ADDI    #$0002, R1                      ; 6877   02F9 0002
        MVII    #$031F, R3                      ; 6879   02BB 031F

        JSR     R5,     L_6C9C                  ; 687B   0004 016C 009C

        PULR    R1                              ; 687E   02B1
        CMPI    #$0008, R3                      ; 687F   037B 0008
        BLE     L_68D8                          ; 6881   0206 0055

        CMPI    #$0010, R3                      ; 6883   037B 0010
        BLE     L_68DC                          ; 6885   0206 0055

        JSR     R5,     L_6753                  ; 6887   0004 0164 0353

        BC      L_68DC                          ; 688A   0201 0050

        JSR     R5,     L_6793                  ; 688C   0004 0164 0393

        TSTR    R0                              ; 688F   0080
        BMI     L_68DC                          ; 6890   020B 004A

        SLR     R0,     1                       ; 6892   0060
        CMPI    #$0002, R0                      ; 6893   0378 0002
        BGT     L_68DC                          ; 6895   020E 0045

        MOVR    R0,     R4                      ; 6897   0084
        PSHR    R1                              ; 6898   0271
        MVII    #$031D, R1                      ; 6899   02B9 031D

        JSR     R5,     L_6771                  ; 689B   0004 0164 0371

        PULR    R1                              ; 689E   02B1
        PSHR    R1                              ; 689F   0271
        ADDI    #$0002, R1                      ; 68A0   02F9 0002
        MVI@    R1,     R0                      ; 68A2   0288
        INCR    R1                              ; 68A3   0009
        MVI@    R1,     R1                      ; 68A4   0289
        SWAP    R0,     1                       ; 68A5   0040
        SWAP    R1,     1                       ; 68A6   0041
        ANDI    #$00FF, R0                      ; 68A7   03B8 00FF
        ANDI    #$00FF, R1                      ; 68A9   03B9 00FF
        SUBR    R2,     R0                      ; 68AB   0110
        BGE     L_68AF                          ; 68AC   020D 0001

        NEGR    R0                              ; 68AE   0020
L_68AF:
        MVII    #$0004, R5                      ; 68AF   02BD 0004
        SUBR    R3,     R1                      ; 68B1   0119
        BGE     L_68B8                          ; 68B2   020D 0004

        NEGR    R1                              ; 68B4   0021
        NEGR    R4                              ; 68B5   0024
        MVII    #$000C, R5                      ; 68B6   02BD 000C
L_68B8:
        TSTR    R4                              ; 68B8   00A4
        BEQ     L_68BF                          ; 68B9   0204 0004

        CMPR    R0,     R1                      ; 68BB   0141
        BGE     L_68BF                          ; 68BC   020D 0001

        SUBR    R4,     R5                      ; 68BE   0125
L_68BF:
        PULR    R4                              ; 68BF   02B4
        MOVR    R5,     R1                      ; 68C0   00A9

        JSR     R5,     L_6745                  ; 68C1   0004 0164 0345
        DECLE   $0271,  $00A1,  $0004,  $01A4   ; 68C4   0271 00A1 0004 01A4
        DECLE   $023F                           ; 68C8   023F

        MOVR    R3,     R0                      ; 68C9   0098
        PULR    R1                              ; 68CA   02B1

        JSR     R5,     .EXEC.629               ; 68CB   0004 0114 0229
        DECLE   $00A1,  $02FC,  $0004,  $0260   ; 68CE   00A1 02FC 0004 0260
        DECLE   $000C,  $0004                   ; 68D2   000C 0004

        ANDR    R4,     R4                      ; 68D4   01A4
        MVO@    R1,     R3                      ; 68D5   0259
        MVO@    R0,     R4                      ; 68D6   0260
        PULR    R7                              ; 68D7   02B7

L_68D8:
        JSR     R5,     L_5EA0                  ; 68D8   0004 015C 02A0

        PULR    R7                              ; 68DB   02B7
L_68DC:
        INCR    R7                              ; 68DC   000F

        PSHR    R5                              ; 68DD   0275
L_68DE:
        MOVR    R1,     R4                      ; 68DE   008C
        MVII    #$031D, R1                      ; 68DF   02B9 031D

        JSR     R5,     L_6771                  ; 68E1   0004 0164 0371
        DECLE   $0042,  $01DA,  $00A1,  $0004   ; 68E4   0042 01DA 00A1 0004
        DECLE   $01A4,  $023F                   ; 68E8   01A4 023F

        JSR     R5,     .EXEC.9A3               ; 68EA   0004 0118 01A3
        DECLE   $0004                           ; 68ED   0004

        ANDR    R4,     R4                      ; 68EE   01A4
        MVO@    R1,     R3                      ; 68EF   0259
        ADDI    #$0006, R1                      ; 68F0   02F9 0006
        MVO@    R0,     R1                      ; 68F2   0248
        PULR    R7                              ; 68F3   02B7

L_68F4:
        PSHR    R5                              ; 68F4   0275
        PSHR    R1                              ; 68F5   0271

        JSR     R5,     .EXEC.772               ; 68F6   0004 0114 0372
        JSR     R5,     L_66EC                  ; 68F9   0004 0164 02EC
        DECLE   $0007,  $0042,  $01DA,  $0004   ; 68FC   0007 0042 01DA 0004
L_6900:
        ANDR    R4,     R4                      ; 6900   01A4
        BLT     L_6900                          ; 6901   0225 0002

        MOVR    R0,     R3                      ; 6903   0083
        PULR    R1                              ; 6904   02B1

        JSR     R5,     .EXEC.9A3               ; 6905   0004 0118 01A3

        ADDI    #$0006, R1                      ; 6908   02F9 0006
        PULR    R7                              ; 690A   02B7

L_690B:
        PSHR    R5                              ; 690B   0275
        PSHR    R1                              ; 690C   0271

        JSR     R5,     .EXEC.772               ; 690D   0004 0114 0372
        JSR     R5,     L_66F0                  ; 6910   0004 0164 02F0
        DECLE   $0007,  $0042,  $01DA,  $0004   ; 6913   0007 0042 01DA 0004
L_6917:
        ANDR    R4,     R4                      ; 6917   01A4
        BLT     L_6917                          ; 6918   0225 0002

        MOVR    R0,     R3                      ; 691A   0083
        PULR    R1                              ; 691B   02B1

        JSR     R5,     .EXEC.9A3               ; 691C   0004 0118 01A3

        ADDI    #$0006, R1                      ; 691F   02F9 0006
        PULR    R7                              ; 6921   02B7

L_6922:
        PSHR    R5                              ; 6922   0275
        DECLE   $0282,  $0172,  $0042,  $03C2   ; 6923   0282 0172 0042 03C2
        DECLE   $0173,  $0004                   ; 6927   0173 0004
L_6929:
        ANDR    R4,     R4                      ; 6929   01A4
        BLT     L_6929                          ; 692A   0225 0002

        MOVR    R0,     R3                      ; 692C   0083

        JSR     R5,     .EXEC.9A1               ; 692D   0004 0118 01A1

        ADDI    #$0006, R1                      ; 6930   02F9 0006
        PULR    R7                              ; 6932   02B7

L_6933:
        PSHR    R5                              ; 6933   0275
        PSHR    R1                              ; 6934   0271

        JSR     R5,     .EXEC.772               ; 6935   0004 0114 0372

        PULR    R0                              ; 6938   02B0
        PSHR    R2                              ; 6939   0272
        PSHR    R3                              ; 693A   0273

        JSR     R5,     .EXEC.772               ; 693B   0004 0114 0372

        PULR    R1                              ; 693E   02B1
        PULR    R0                              ; 693F   02B0
        CMPR    R0,     R2                      ; 6940   0142
        BLE     L_6949                          ; 6941   0206 0006

        XORR    R0,     R2                      ; 6943   01C2
        XORR    R2,     R0                      ; 6944   01D0
        XORR    R0,     R2                      ; 6945   01C2
        XORR    R1,     R3                      ; 6946   01CB
        XORR    R3,     R1                      ; 6947   01D9
        XORR    R1,     R3                      ; 6948   01CB
L_6949:
        MOVR    R2,     R4                      ; 6949   0094
        SUBR    R0,     R4                      ; 694A   0104
        MOVR    R3,     R5                      ; 694B   009D
        SUBR    R1,     R5                      ; 694C   010D
        TSTR    R5                              ; 694D   00AD
        BGE     L_6951                          ; 694E   020D 0001

        NEGR    R5                              ; 6950   0025
L_6951:
        PSHR    R5                              ; 6951   0275

        JSR     R5,     L_672D                  ; 6952   0004 0164 032D

        PULR    R5                              ; 6955   02B5
        BNC     L_6969                          ; 6956   0209 0011

        ADDR    R4,     R5                      ; 6958   00E5
        BMI     L_6964                          ; 6959   020B 0009

        SUBR    R4,     R3                      ; 695B   0123
        SUBR    R1,     R3                      ; 695C   010B
        SAR     R3,     1                       ; 695D   006B
        ADDR    R3,     R1                      ; 695E   00D9
        TSTR    R3                              ; 695F   009B
        BGE     L_6963                          ; 6960   020D 0001

        NEGR    R3                              ; 6962   0023
L_6963:
        ADDR    R3,     R0                      ; 6963   00D8
L_6964:
        MOVR    R0,     R2                      ; 6964   0082
        MOVR    R1,     R3                      ; 6965   008B
        ADDI    #$0006, R2                      ; 6966   02FA 0006
        PULR    R7                              ; 6968   02B7

L_6969:
        ADDR    R4,     R5                      ; 6969   00E5
        BMI     L_6975                          ; 696A   020B 0009

        ADDR    R4,     R1                      ; 696C   00E1
        SUBR    R3,     R1                      ; 696D   0119
        SAR     R1,     1                       ; 696E   0069
        ADDR    R1,     R3                      ; 696F   00CB
        TSTR    R1                              ; 6970   0089
        BGE     L_6974                          ; 6971   020D 0001

        NEGR    R1                              ; 6973   0021
L_6974:
        SUBR    R1,     R2                      ; 6974   010A
L_6975:
        SUBI    #$0006, R2                      ; 6975   033A 0006
        BGE     L_697A                          ; 6977   020D 0001

        CLRR    R2                              ; 6979   01D2
L_697A:
        PULR    R7                              ; 697A   02B7

L_697B:
        MVI     G_01C6, R0                      ; 697B   0280 01C6
        ANDI    #$003F, R0                      ; 697D   03B8 003F
        SLR     R0,     2                       ; 697F   0064
        MOVR    R0,     R1                      ; 6980   0081
        SARC    R1,     2                       ; 6981   007D
        NOP                                     ; 6982   0034
        RLC     R0,     2                       ; 6983   0054
        MVO     R0,     G_01C6                  ; 6984   0240 01C6
        MVI     G_015E, R1                      ; 6986   0281 015E
        TSTR    R1                              ; 6988   0089
        BNEQ    L_69A2                          ; 6989   020C 0017

        SARC    R0,     2                       ; 698B   007C
        RLC     R0,     2                       ; 698C   0054
        NOP                                     ; 698D   0034
        MVO     R0,     G_01C6                  ; 698E   0240 01C6
        MOVR    R5,     R7                      ; 6990   00AF

L_6991:
        PSHR    R5                              ; 6991   0275
        DECLE   $0004,  $01A4,  $0225,  $0006   ; 6992   0004 01A4 0225 0006

        MOVR    R0,     R2                      ; 6996   0082
        PULR    R5                              ; 6997   02B5
L_6998:
        MVI@    R1,     R0                      ; 6998   0288
        MVO@    R2,     R1                      ; 6999   024A
        CMPI    #$0004, R0                      ; 699A   0378 0004
        BGE     L_69A2                          ; 699C   020D 0004

        CLRR    R2                              ; 699E   01D2
        SUBI    #$0002, R1                      ; 699F   0339 0002
        MVO@    R2,     R1                      ; 69A1   024A
L_69A2:
        MOVR    R5,     R7                      ; 69A2   00AF

        PSHR    R5                              ; 69A3   0275
L_69A4:
        MVI     G_0175, R4                      ; 69A4   0284 0175
        CMPI    #$000C, R4                      ; 69A6   037C 000C
        BLT     L_69AF                          ; 69A8   0205 0005

        MOVR    R4,     R3                      ; 69AA   00A3
        MVII    #$000C, R4                      ; 69AB   02BC 000C
        SUBI    #$000C, R3                      ; 69AD   033B 000C
L_69AF:
        INCR    R4                              ; 69AF   000C
        ADDR    R7,     R4                      ; 69B0   00FC
        ADD@    R4,     R7                      ; 69B1   02E7

        DECLE   $000D,  $0011,  $002F,  $0037   ; 69B2   000D 0011 002F 0037

        NEGR    R5                              ; 69B6   0025
        RLC     R0,     1                       ; 69B7   0050
        SLLC    R2,     2                       ; 69B8   005E
        SLR     R2,     1                       ; 69B9   0062
        RRC     R3,     1                       ; 69BA   0073
        MOVR    R1,     R5                      ; 69BB   008D
        MOVR    R3,     R7                      ; 69BC   009F

        ADDR    R2,     R4                      ; 69BD   00D4
        ADDR    R3,     R5                      ; 69BE   00DD
L_69BF:
        MVII    #$0001, R0                      ; 69BF   02B8 0001
        MVO     R0,     G_0175                  ; 69C1   0240 0175
L_69C3:
        MVII    #$0001, R1                      ; 69C3   02B9 0001
        MVO     R1,     G_0199                  ; 69C5   0241 0199
        MVII    #$0008, R1                      ; 69C7   02B9 0008

        JSR     R5,     L_6745                  ; 69C9   0004 0164 0345
        DECLE   $0004,  $01A4,  $0225,  $0005   ; 69CC   0004 01A4 0225 0005

        JSR     R5,     .EXEC.629               ; 69D0   0004 0114 0229
        DECLE   $0240,  $0321,  $0200,  $0023   ; 69D3   0240 0321 0200 0023
L_69D7:
        PSHR    R1                              ; 69D7   0271
        MVII    #$000A, R0                      ; 69D8   02B8 000A

        JSR     R5,     L_6B03                  ; 69DA   0004 0168 0303

        PULR    R1                              ; 69DD   02B1
        BC      L_6A10                          ; 69DE   0201 0030
        PULR    R7                              ; 69E0   02B7

        PSHR    R1                              ; 69E1   0271

        JSR     R5,     L_6B2F                  ; 69E2   0004 0168 032F
        BIDECLE $5C14                           ; 69E5   0014 005C

        B       L_69EF                          ; 69E7   0200 0006

        PSHR    R1                              ; 69E9   0271

        JSR     R5,     L_6B2F                  ; 69EA   0004 0168 032F
        BIDECLE $5C10                           ; 69ED   0010 005C
L_69EF:
        PULR    R1                              ; 69EF   02B1
        MVI     G_0199, R4                      ; 69F0   0284 0199
        CMPI    #$0003, R4                      ; 69F2   037C 0003
        BNEQ    L_6A10                          ; 69F4   020C 001A

L_69F6:
        MVII    #$0005, R4                      ; 69F6   02BC 0005
        DECLE   $0244,  $0175,  $0004           ; 69F8   0244 0175 0004

        ANDR    R4,     R4                      ; 69FB   01A4
        BLT     L_69F6                          ; 69FC   0225 0007

        MOVR    R0,     R3                      ; 69FE   0083
L_69FF:
        MVO     R3,     G_0323                  ; 69FF   0243 0323
L_6A01:
        PULR    R7                              ; 6A01   02B7

L_6A02:
        JSR     R5,     L_6922                  ; 6A02   0004 0168 0122
        DECLE   $0270,  $0004                   ; 6A05   0270 0004

        ANDR    R4,     R4                      ; 6A07   01A4
        BLT     L_6A02                          ; 6A08   0225 0007

        MOVR    R0,     R2                      ; 6A0A   0082
        PULR    R0                              ; 6A0B   02B0

        JSR     R5,     L_6998                  ; 6A0C   0004 0168 0198

        PULR    R7                              ; 6A0F   02B7

L_6A10:
        MVII    #$0007, R2                      ; 6A10   02BA 0007
        MVO     R2,     G_0175                  ; 6A12   0242 0175

        JSR     R5,     L_6BD2                  ; 6A14   0004 0168 03D2
        JSR     R5,     L_6C16                  ; 6A17   0004 016C 0016
        DECLE   $0004,  $01A4,  $0225,  $0005   ; 6A1A   0004 01A4 0225 0005

        JSR     R5,     .EXEC.629               ; 6A1E   0004 0114 0229
        DECLE   $0240,  $0321,  $0220,  $002A   ; 6A21   0240 0321 0220 002A
        DECLE   $0280,  $015D,  $0378,  $000B   ; 6A25   0280 015D 0378 000B
        DECLE   $022C,  $0030                   ; 6A29   022C 0030

        MVII    #$0018, R3                      ; 6A2B   02BB 0018
L_6A2D:
        SUB     G_0178, R3                      ; 6A2D   0303 0178
        DECLE   $0206,  $0008,  $0004           ; 6A2F   0206 0008 0004

        ANDR    R4,     R4                      ; 6A32   01A4
        BLT     L_6A2D                          ; 6A33   0225 0007

        SLR     R0,     2                       ; 6A35   0064
        ADDR    R0,     R3                      ; 6A36   00C3
        B       L_69FF                          ; 6A37   0220 0039

        JSR     R5,     L_6B2F                  ; 6A39   0004 0168 032F
        BIDECLE $5C14                           ; 6A3C   0014 005C

        PULR    R7                              ; 6A3E   02B7

        DECLE   $0280,  $015D,  $0378,  $000B   ; 6A3F   0280 015D 0378 000B
        DECLE   $022C,  $004A                   ; 6A43   022C 004A

        MVI     G_033B, R3                      ; 6A45   0283 033B
        SUBI    #$0004, R3                      ; 6A47   033B 0004
        BGT     L_69FF                          ; 6A49   022E 004B

        JSR     R5,     L_6B2F                  ; 6A4B   0004 0168 032F
        BIDECLE $5C14                           ; 6A4E   0014 005C

        PULR    R7                              ; 6A50   02B7

        MVI     G_0167, R5                      ; 6A51   0285 0167
        TSTR    R5                              ; 6A53   00AD
        BNEQ    L_6A8B                          ; 6A54   020C 0035

        JSR     R5,     L_6BD2                  ; 6A56   0004 0168 03D2
        JSR     R5,     L_6B6A                  ; 6A59   0004 0168 036A

        CMPI    #$0014, R2                      ; 6A5C   037A 0014
        BGT     L_69C3                          ; 6A5E   022E 009C

        MVII    #$0001, R0                      ; 6A60   02B8 0001

        JSR     R5,     X_RAND1                 ; 6A62   0004 0114 027D

        SLL     R0,     2                       ; 6A65   004C
        ADDI    #$0006, R0                      ; 6A66   02F8 0006
        MOVR    R0,     R1                      ; 6A68   0081

        JSR     R5,     L_6745                  ; 6A69   0004 0164 0345
        DECLE   $0004,  $01A4,  $0225,  $0005   ; 6A6C   0004 01A4 0225 0005

        JSR     R5,     .EXEC.629               ; 6A70   0004 0114 0229
        DECLE   $0240,  $0321,  $0004,  $01A4   ; 6A73   0240 0321 0004 01A4
        DECLE   $0225,  $0007                   ; 6A77   0225 0007

        CMPI    #$0008, R0                      ; 6A79   0378 0008
        BGE     L_6A7F                          ; 6A7B   020D 0002

        MVII    #$0008, R0                      ; 6A7D   02B8 0008
L_6A7F:
        MVO     R0,     G_0323                  ; 6A7F   0240 0323
        MVII    #$0007, R0                      ; 6A81   02B8 0007
        MVO     R0,     G_0175                  ; 6A83   0240 0175
        PULR    R7                              ; 6A85   02B7

        MVI     G_0167, R5                      ; 6A86   0285 0167
        TSTR    R5                              ; 6A88   00AD
        BEQ     L_6A10                          ; 6A89   0224 007A

L_6A8B:
        CLRR    R5                              ; 6A8B   01ED
        MVO     R5,     G_0321                  ; 6A8C   0245 0321
        PULR    R7                              ; 6A8E   02B7

        JSR     R5,     L_6B3B                  ; 6A8F   0004 0168 033B

        MVI@    R4,     R2                      ; 6A92   02A2
        ADDR    R3,     R4                      ; 6A93   00DC
        CMPR    R2,     R3                      ; 6A94   0153
        BGE     L_69BF                          ; 6A95   022D 00D7

        INCR    R3                              ; 6A97   000B
        ADDI    #$000C, R3                      ; 6A98   02FB 000C
        MVO     R3,     G_0175                  ; 6A9A   0243 0175
        MVI@    R4,     R3                      ; 6A9C   02A3
        MOVR    R3,     R2                      ; 6A9D   009A
        SWAP    R2,     1                       ; 6A9E   0042
        ANDI    #$0003, R2                      ; 6A9F   03BA 0003
        INCR    R2                              ; 6AA1   000A
        ADDR    R7,     R2                      ; 6AA2   00FA
        ADD@    R2,     R7                      ; 6AA3   02D7

        DECLE   $005B,  $004E,  $004B,  $0004   ; 6AA4   005B 004E 004B 0004

        ANDI    #$00FF, R3                      ; 6AA8   03BB 00FF
        CMPI    #$000C, R3                      ; 6AAA   037B 000C
        BGE     L_6AB2                          ; 6AAC   020D 0004

        MVO     R3,     G_0175                  ; 6AAE   0243 0175
        B       L_69A4                          ; 6AB0   0220 010D

L_6AB2:
        SUBI    #$000C, R3                      ; 6AB2   033B 000C
        CMPI    #$000B, R3                      ; 6AB4   037B 000B
        BGE     L_6ABC                          ; 6AB6   020D 0004

        MVO     R3,     G_01C5                  ; 6AB8   0243 01C5
        B       L_69A4                          ; 6ABA   0220 0117

L_6ABC:
        SUBI    #$000B, R3                      ; 6ABC   033B 000B
        BGT     L_6ADC                          ; 6ABE   020E 001C

        PSHR    R1                              ; 6AC0   0271

        JSR     R5,     L_6BD2                  ; 6AC1   0004 0168 03D2
        JSR     R5,     L_6B6A                  ; 6AC4   0004 0168 036A
        JSR     R5,     .EXEC.76C               ; 6AC7   0004 0114 036C

        ADDI    #$0002, R1                      ; 6ACA   02F9 0002
        MVII    #$031F, R3                      ; 6ACC   02BB 031F

        JSR     R5,     L_6C9C                  ; 6ACE   0004 016C 009C

        PULR    R1                              ; 6AD1   02B1
        CMPI    #$000C, R3                      ; 6AD2   037B 000C
        BGT     L_69A4                          ; 6AD4   022E 0131

        MVII    #$0004, R0                      ; 6AD6   02B8 0004
        MVO     R0,     G_0175                  ; 6AD8   0240 0175
        B       L_69D7                          ; 6ADA   0220 0104

L_6ADC:
        CMPI    #$000A, R3                      ; 6ADC   037B 000A
        BGE     L_6AE6                          ; 6ADE   020D 0006

        MVO     R3,     G_0323                  ; 6AE0   0243 0323
        CLRR    R0                              ; 6AE2   01C0
        MVO     R0,     G_0321                  ; 6AE3   0240 0321
        PULR    R7                              ; 6AE5   02B7

L_6AE6:
        SUBI    #$0008, R3                      ; 6AE6   033B 0008
        NEGR    R3                              ; 6AE8   0023
        ADD     G_0175, R3                      ; 6AE9   02C3 0175
        MVO     R3,     G_0175                  ; 6AEB   0243 0175
        B       L_69A4                          ; 6AED   0220 014A

        MVI     G_01C5, R0                      ; 6AEF   0280 01C5
        INCR    R7                              ; 6AF1   000F

        CLRR    R0                              ; 6AF2   01C0
L_6AF3:
        PSHR    R1                              ; 6AF3   0271
        PSHR    R3                              ; 6AF4   0273

        JSR     R5,     L_6B03                  ; 6AF5   0004 0168 0303

        BC      L_6AFD                          ; 6AF8   0201 0003

        PULR    R5                              ; 6AFA   02B5
        PULR    R5                              ; 6AFB   02B5
        PULR    R7                              ; 6AFC   02B7

L_6AFD:
        PULR    R3                              ; 6AFD   02B3
        PULR    R1                              ; 6AFE   02B1

        JSR     R5,     L_6B4A                  ; 6AFF   0004 0168 034A

        PULR    R7                              ; 6B02   02B7

L_6B03:
        PSHR    R5                              ; 6B03   0275
        MVI     G_0199, R4                      ; 6B04   0284 0199
        CMPI    #$0003, R4                      ; 6B06   037C 0003
        BNEQ    L_6B2D                          ; 6B08   020C 0023

        PSHR    R0                              ; 6B0A   0270

        JSR     R5,     L_6D1C                  ; 6B0B   0004 016C 011C

        CMP@    R6,     R1                      ; 6B0E   0371
        BGT     L_6B2D                          ; 6B0F   020E 001C

        CMPI    #$0002, R0                      ; 6B11   0378 0002
        BEQ     L_6B1C                          ; 6B13   0204 0007

        JSR     R5,     L_6B2F                  ; 6B15   0004 0168 032F
        BIDECLE $5C14                           ; 6B18   0014 005C

        B       L_6B21                          ; 6B1A   0200 0005

L_6B1C:
        JSR     R5,     L_6B2F                  ; 6B1C   0004 0168 032F
        BIDECLE $5C10                           ; 6B1F   0010 005C
L_6B21:
        MVII    #$0005, R4                      ; 6B21   02BC 0005
        DECLE   $0244,  $0175,  $0004           ; 6B23   0244 0175 0004

        ANDR    R4,     R4                      ; 6B26   01A4
        BLT     L_6B21                          ; 6B27   0225 0007

        MVO     R0,     G_0323                  ; 6B29   0240 0323
        CLRC                                    ; 6B2B   0006
        PULR    R7                              ; 6B2C   02B7

L_6B2D:
        SETC                                    ; 6B2D   0007
        PULR    R7                              ; 6B2E   02B7

L_6B2F:
        MVII    #$0019, R0                      ; 6B2F   02B8 0019
        MVO     R0,     G_011E                  ; 6B31   0240 011E
        MVII    #$0001, R0                      ; 6B33   02B8 0001
        MVI     G_015E, R1                      ; 6B35   0281 015E
        COMR    R1                              ; 6B37   0019
        SDBD                                    ; 6B38   0001
        MVI@    R5,     R4                      ; 6B39   02AC
        MOVR    R4,     R7                      ; 6B3A   00A7

L_6B3B:
        MVI     G_0176, R0                      ; 6B3B   0280 0176
        SDBD                                    ; 6B3D   0001
        MVII    #$911A, R4                      ; 6B3E   02BC 001A 0091
        ANDI    #$003F, R0                      ; 6B41   03B8 003F
        BEQ     L_6B49                          ; 6B43   0204 0004

L_6B45:
        ADD@    R4,     R4                      ; 6B45   02E4
        DECR    R0                              ; 6B46   0010
        BGT     L_6B45                          ; 6B47   022E 0003
L_6B49:
        MOVR    R5,     R7                      ; 6B49   00AF

L_6B4A:
        PSHR    R5                              ; 6B4A   0275
        MOVR    R1,     R4                      ; 6B4B   008C
        ADDI    #$0004, R4                      ; 6B4C   02FC 0004
        MOVR    R3,     R1                      ; 6B4E   0099
        ANDI    #$00F0, R3                      ; 6B4F   03BB 00F0
        BNEQ    L_6B59                          ; 6B51   020C 0006

        MVO@    R3,     R4                      ; 6B53   0263
        MVII    #$0004, R0                      ; 6B54   02B8 0004
        INCR    R4                              ; 6B56   000C
        MVO@    R0,     R4                      ; 6B57   0260
        PULR    R7                              ; 6B58   02B7

L_6B59:
        JSR     R5,     L_6745                  ; 6B59   0004 0164 0345
        DECLE   $0004,  $01A4,  $0225,  $0005   ; 6B5C   0004 01A4 0225 0005

        JSR     R5,     .EXEC.629               ; 6B60   0004 0114 0229

        MVO@    R0,     R4                      ; 6B63   0260
        INCR    R4                              ; 6B64   000C
        SLR     R3,     2                       ; 6B65   0067
        SLR     R3,     2                       ; 6B66   0067
        INCR    R3                              ; 6B67   000B
        MVO@    R3,     R4                      ; 6B68   0263
        PULR    R7                              ; 6B69   02B7

L_6B6A:
        PSHR    R5                              ; 6B6A   0275
        MVII    #$0004, R0                      ; 6B6B   02B8 0004
        MOVR    R0,     R4                      ; 6B6D   0084
        MVII    #$019D, R5                      ; 6B6E   02BD 019D
        MVI@    R5,     R2                      ; 6B70   02AA
L_6B71:
        INCR    R4                              ; 6B71   000C
        CMP@    R5,     R2                      ; 6B72   036A
        BMI     L_6B78                          ; 6B73   020B 0003

        DECR    R5                              ; 6B75   0015
        MVI@    R5,     R2                      ; 6B76   02AA
        MOVR    R4,     R0                      ; 6B77   00A0
L_6B78:
        CMPI    #$0007, R4                      ; 6B78   037C 0007
        BMI     L_6B71                          ; 6B7A   022B 000A
        PULR    R7                              ; 6B7C   02B7

L_6B7D:
        MVI@    R5,     R1                      ; 6B7D   02A9
        PSHR    R5                              ; 6B7E   0275
        MOVR    R1,     R5                      ; 6B7F   008D
        MVI@    R5,     R2                      ; 6B80   02AA
        MVI@    R5,     R3                      ; 6B81   02AB
        SWAP    R2,     1                       ; 6B82   0042
        SWAP    R3,     1                       ; 6B83   0043
        ANDI    #$00FF, R2                      ; 6B84   03BA 00FF
        ANDI    #$00FF, R3                      ; 6B86   03BB 00FF
        SUB     G_0170, R2                      ; 6B88   0302 0170

        JSR     R5,     L_6724                  ; 6B8A   0004 0164 0324

        ADCR    R7                              ; 6B8D   002F

        NEGR    R2                              ; 6B8E   0022
L_6B8F:
        MVII    #$0008, R1                      ; 6B8F   02B9 0008
        MVII    #$0001, R5                      ; 6B91   02BD 0001
        TSTR    R2                              ; 6B93   0092
        BGT     L_6BA7                          ; 6B94   020E 0011

        NEGR    R2                              ; 6B96   0022
        SLR     R2,     1                       ; 6B97   0062
        SUB     G_0173, R3                      ; 6B98   0303 0173
        BGE     L_6B9E                          ; 6B9A   020D 0002

        NEGR    R5                              ; 6B9C   0025
        NEGR    R3                              ; 6B9D   0023
L_6B9E:
        CMPR    R2,     R3                      ; 6B9E   0153
        BGE     L_6BB5                          ; 6B9F   020D 0014

        ADDR    R5,     R5                      ; 6BA1   00ED
        XORR    R2,     R3                      ; 6BA2   01D3
        XORR    R3,     R2                      ; 6BA3   01DA
        XORR    R2,     R3                      ; 6BA4   01D3
        B       L_6BB5                          ; 6BA5   0200 000E

L_6BA7:
        SLL     R2,     1                       ; 6BA7   004A
        SUB     G_0173, R3                      ; 6BA8   0303 0173
        BGE     L_6BAE                          ; 6BAA   020D 0002

        NEGR    R5                              ; 6BAC   0025
        NEGR    R3                              ; 6BAD   0023
L_6BAE:
        CMPR    R2,     R3                      ; 6BAE   0153
        BGE     L_6BB5                          ; 6BAF   020D 0004

        CLRR    R5                              ; 6BB1   01ED
        XORR    R2,     R3                      ; 6BB2   01D3
        XORR    R3,     R2                      ; 6BB3   01DA
        XORR    R2,     R3                      ; 6BB4   01D3
L_6BB5:
        SUBR    R5,     R1                      ; 6BB5   0129
        SLR     R2,     2                       ; 6BB6   0066
        ADDR    R2,     R3                      ; 6BB7   00D3
        CMPI    #$00FE, R3                      ; 6BB8   037B 00FE
        BLE     L_6A01                          ; 6BBA   0226 01BA

        MVII    #$00FE, R3                      ; 6BBC   02BB 00FE
        PULR    R7                              ; 6BBE   02B7

L_6BBF:
        MVII    #$031F, R4                      ; 6BBF   02BC 031F
        MVI@    R4,     R0                      ; 6BC1   02A0
        SWAP    R0,     1                       ; 6BC2   0040
        MVO     R0,     G_0170                  ; 6BC3   0240 0170
        MVI@    R4,     R0                      ; 6BC5   02A0
        SWAP    R0,     1                       ; 6BC6   0040
        MVO     R0,     G_0173                  ; 6BC7   0240 0173
        MOVR    R5,     R7                      ; 6BC9   00AF

L_6BCA:
        SARC    R0,     1                       ; 6BCA   0078
        BNC     L_6BD1                          ; 6BCB   0209 0004

        MVII    #$00FF, R3                      ; 6BCD   02BB 00FF
        MVII    #$0008, R1                      ; 6BCF   02B9 0008
L_6BD1:
        MOVR    R5,     R7                      ; 6BD1   00AF

L_6BD2:
        PSHR    R5                              ; 6BD2   0275

        JSR     R5,     L_6BBF                  ; 6BD3   0004 0168 03BF

        MVI     G_0168, R0                      ; 6BD6   0280 0168
        SLR     R0,     2                       ; 6BD8   0064
        SLR     R0,     2                       ; 6BD9   0064

        JSR     R5,     L_6B7D                  ; 6BDA   0004 0168 037D
        DECLE   $033F                           ; 6BDD   033F

        JSR     R5,     L_6BCA                  ; 6BDE   0004 0168 03CA

        MVO     R3,     G_019D                  ; 6BE1   0243 019D
        MVO     R1,     G_01A1                  ; 6BE3   0241 01A1

        JSR     R5,     L_6B7D                  ; 6BE5   0004 0168 037D
        DECLE   $0347                           ; 6BE8   0347

        JSR     R5,     L_6BCA                  ; 6BE9   0004 0168 03CA

        MVO     R3,     G_019E                  ; 6BEC   0243 019E
        MVO     R1,     G_01A2                  ; 6BEE   0241 01A2

        JSR     R5,     L_6B7D                  ; 6BF0   0004 0168 037D
        DECLE   $034F                           ; 6BF3   034F

        JSR     R5,     L_6BCA                  ; 6BF4   0004 0168 03CA

        MVO     R3,     G_019F                  ; 6BF7   0243 019F
        MVO     R1,     G_01A3                  ; 6BF9   0241 01A3

        JSR     R5,     L_6B7D                  ; 6BFB   0004 0168 037D
        DECLE   $0357                           ; 6BFE   0357

        JSR     R5,     L_6BCA                  ; 6BFF   0004 0168 03CA

        MVO     R3,     G_01A0                  ; 6C02   0243 01A0
        MVO     R1,     G_01A4                  ; 6C04   0241 01A4
        PULR    R7                              ; 6C06   02B7

        CLRC                                    ; 6C07   0006
        CLRC                                    ; 6C08   0006
        INCR    R2                              ; 6C09   000A
        SETC                                    ; 6C0A   0007
        SETC                                    ; 6C0B   0007
        INCR    R0                              ; 6C0C   0008
        SETC                                    ; 6C0D   0007
        INCR    R0                              ; 6C0E   0008
        INCR    R1                              ; 6C0F   0009
        INCR    R0                              ; 6C10   0008
        INCR    R1                              ; 6C11   0009
        INCR    R1                              ; 6C12   0009
        CLRC                                    ; 6C13   0006
        INCR    R2                              ; 6C14   000A
        INCR    R2                              ; 6C15   000A
L_6C16:
        PSHR    R5                              ; 6C16   0275
        MVII    #$019D, R3                      ; 6C17   02BB 019D
        MVI@    R3,     R0                      ; 6C19   0298
        MOVR    R3,     R1                      ; 6C1A   0099
L_6C1B:
        INCR    R3                              ; 6C1B   000B
        CMP@    R3,     R0                      ; 6C1C   0358
        BLE     L_6C21                          ; 6C1D   0206 0002

        MVI@    R3,     R0                      ; 6C1F   0298
        MOVR    R3,     R1                      ; 6C20   0099
L_6C21:
        CMPI    #$01A0, R3                      ; 6C21   037B 01A0
        BNEQ    L_6C1B                          ; 6C23   022C 0009

        MVII    #$019D, R2                      ; 6C25   02BA 019D
        MVII    #$03FF, R0                      ; 6C27   02B8 03FF
L_6C29:
        CMPR    R1,     R2                      ; 6C29   014A
        BEQ     L_6C31                          ; 6C2A   0204 0005

        CMP@    R2,     R0                      ; 6C2C   0350
        BMI     L_6C31                          ; 6C2D   020B 0002

        MVI@    R2,     R0                      ; 6C2F   0290
        MOVR    R2,     R3                      ; 6C30   0093
L_6C31:
        INCR    R2                              ; 6C31   000A
        CMPI    #$01A0, R2                      ; 6C32   037A 01A0
        BLE     L_6C29                          ; 6C34   0226 000C

        MVI@    R1,     R0                      ; 6C36   0288
        MVI@    R3,     R2                      ; 6C37   029A
        ADDI    #$0004, R1                      ; 6C38   02F9 0004
        ADDI    #$0004, R3                      ; 6C3A   02FB 0004
        MVI@    R1,     R1                      ; 6C3C   0289
        MVI@    R3,     R3                      ; 6C3D   029B
        CMPI    #$00FE, R2                      ; 6C3E   037A 00FE
        BGE     L_6C59                          ; 6C40   020D 0017

        SLR     R2,     1                       ; 6C42   0062
        CMPR    R0,     R2                      ; 6C43   0142
        BGE     L_6C59                          ; 6C44   020D 0013

        CMPI    #$0006, R1                      ; 6C46   0379 0006
        BEQ     L_6C59                          ; 6C48   0204 000F

        CMPI    #$000A, R1                      ; 6C4A   0379 000A
        BEQ     L_6C59                          ; 6C4C   0204 000B

        SUBI    #$0006, R3                      ; 6C4E   033B 0006
        PSHR    R3                              ; 6C50   0273
        ADDR    R3,     R3                      ; 6C51   00DB
        ADD@    R6,     R3                      ; 6C52   02F3
        ADDR    R1,     R3                      ; 6C53   00CB
        SDBD                                    ; 6C54   0001
        ADDI    #$6C00, R3                      ; 6C55   02FB 0000 006C
        MVI@    R3,     R1                      ; 6C58   0299
L_6C59:
        CMPI    #$00FE, R0                      ; 6C59   0378 00FE
        BMI     L_6C5F                          ; 6C5B   020B 0002

        MVII    #$0008, R1                      ; 6C5D   02B9 0008

L_6C5F:
        JSR     R5,     L_6C66                  ; 6C5F   0004 016C 0066
        JSR     R5,     L_6745                  ; 6C62   0004 0164 0345

        PULR    R7                              ; 6C65   02B7

L_6C66:
        PSHR    R5                              ; 6C66   0275
        DECLE   $0283,  $0173,  $0067,  $0004   ; 6C67   0283 0173 0067 0004
        DECLE   $01A4,  $0225,  $0005           ; 6C6B   01A4 0225 0005

        CMPI    #$0008, R1                      ; 6C6E   0379 0008
        BEQ     L_6A01                          ; 6C70   0224 0270
        BGE     L_6C87                          ; 6C72   020D 0013

        SUBR    R0,     R3                      ; 6C74   0103
        SUBR    R0,     R3                      ; 6C75   0103
        CMPI    #$0006, R1                      ; 6C76   0379 0006
        BNEQ    L_6C81                          ; 6C78   020C 0007

        SUBR    R0,     R3                      ; 6C7A   0103
        CMPI    #$0026, R3                      ; 6C7B   037B 0026
        BGE     L_6A01                          ; 6C7D   022D 027D

        ADDR    R0,     R3                      ; 6C7F   00C3
        INCR    R1                              ; 6C80   0009
L_6C81:
        CMPI    #$0026, R3                      ; 6C81   037B 0026
        BGE     L_6A01                          ; 6C83   022D 0283

        INCR    R1                              ; 6C85   0009
        PULR    R7                              ; 6C86   02B7

L_6C87:
        ADDR    R0,     R3                      ; 6C87   00C3
        ADDR    R0,     R3                      ; 6C88   00C3
        CMPI    #$000A, R1                      ; 6C89   0379 000A
        BNEQ    L_6C94                          ; 6C8B   020C 0007

        ADDR    R0,     R3                      ; 6C8D   00C3
        CMPI    #$0160, R3                      ; 6C8E   037B 0160
        BLE     L_6A01                          ; 6C90   0226 0290

        SUBR    R0,     R3                      ; 6C92   0103
        DECR    R1                              ; 6C93   0011
L_6C94:
        CMPI    #$0160, R3                      ; 6C94   037B 0160
        BLE     L_6A01                          ; 6C96   0226 0296

        DECR    R1                              ; 6C98   0011
        PULR    R7                              ; 6C99   02B7

L_6C9A:
        MVI@    R5,     R1                      ; 6C9A   02A9
        MVI@    R5,     R3                      ; 6C9B   02AB
L_6C9C:
        PSHR    R5                              ; 6C9C   0275
        MVII    #$00FF, R5                      ; 6C9D   02BD 00FF
        MVI@    R1,     R0                      ; 6C9F   0288
        INCR    R1                              ; 6CA0   0009
        MVI@    R1,     R1                      ; 6CA1   0289
        SWAP    R0,     1                       ; 6CA2   0040
        SWAP    R1,     1                       ; 6CA3   0041
        ANDR    R5,     R0                      ; 6CA4   01A8
        ANDR    R5,     R1                      ; 6CA5   01A9
        MVI@    R3,     R2                      ; 6CA6   029A
        INCR    R3                              ; 6CA7   000B
        MVI@    R3,     R3                      ; 6CA8   029B
        SWAP    R2,     1                       ; 6CA9   0042
        SWAP    R3,     1                       ; 6CAA   0043
        ANDR    R5,     R2                      ; 6CAB   01AA
        ANDR    R5,     R3                      ; 6CAC   01AB
        SUBR    R0,     R2                      ; 6CAD   0102
        BGE     L_6CB1                          ; 6CAE   020D 0001

        NEGR    R2                              ; 6CB0   0022
L_6CB1:
        SUBR    R1,     R3                      ; 6CB1   010B
        BGE     L_6CB5                          ; 6CB2   020D 0001

        NEGR    R3                              ; 6CB4   0023
L_6CB5:
        CMPR    R2,     R3                      ; 6CB5   0153
        BMI     L_6CBA                          ; 6CB6   020B 0002

        SLR     R2,     2                       ; 6CB8   0066
        INCR    R7                              ; 6CB9   000F

L_6CBA:
        SLR     R3,     2                       ; 6CBA   0067
L_6CBB:
        ADDR    R2,     R3                      ; 6CBB   00D3
        PULR    R7                              ; 6CBC   02B7

L_6CBD:
        MVI     G_01A5, R0                      ; 6CBD   0280 01A5
        TSTR    R0                              ; 6CBF   0080
        BNEQ    L_6CC5                          ; 6CC0   020C 0003

        MVII    #$00FF, R1                      ; 6CC2   02B9 00FF
        MOVR    R5,     R7                      ; 6CC4   00AF

L_6CC5:
        PSHR    R5                              ; 6CC5   0275

        JSR     R5,     L_6C9A                  ; 6CC6   0004 016C 009A
        DECLE   $0327,  $031F                   ; 6CC9   0327 031F

        PSHR    R3                              ; 6CCB   0273

        JSR     R5,     L_6C9A                  ; 6CCC   0004 016C 009A
        DECLE   $0327,  $033F                   ; 6CCF   0327 033F

        PULR    R2                              ; 6CD1   02B2
        MOVR    R2,     R1                      ; 6CD2   0091
        SLR     R1,     2                       ; 6CD3   0065
        NOP                                     ; 6CD4   0034
        SLR     R1,     1                       ; 6CD5   0061
        ADDR    R1,     R2                      ; 6CD6   00CA
        CLRR    R1                              ; 6CD7   01C9
        SLR     R2,     1                       ; 6CD8   0062
        CMPR    R2,     R3                      ; 6CD9   0153
        BGE     L_6CE4                          ; 6CDA   020D 0008

        ADDI    #$0002, R1                      ; 6CDC   02F9 0002
        SLR     R2,     1                       ; 6CDE   0062
        CMPR    R2,     R3                      ; 6CDF   0153
        BGE     L_6CE4                          ; 6CE0   020D 0002

        ADDI    #$0004, R1                      ; 6CE2   02F9 0004
L_6CE4:
        MVI     G_01C6, R5                      ; 6CE4   0285 01C6
        ANDI    #$0040, R5                      ; 6CE6   03BD 0040
        BEQ     L_6CEC                          ; 6CE8   0204 0002

        ADDI    #$0003, R1                      ; 6CEA   02F9 0003
L_6CEC:
        PULR    R7                              ; 6CEC   02B7

L_6CED:
        MVI     G_01A6, R0                      ; 6CED   0280 01A6
        TSTR    R0                              ; 6CEF   0080
        BNEQ    L_6CF5                          ; 6CF0   020C 0003

        MVII    #$00FF, R1                      ; 6CF2   02B9 00FF
        MOVR    R5,     R7                      ; 6CF4   00AF

L_6CF5:
        PSHR    R5                              ; 6CF5   0275

        JSR     R5,     L_6C9A                  ; 6CF6   0004 016C 009A
        DECLE   $032F,  $031F                   ; 6CF9   032F 031F

        PSHR    R3                              ; 6CFB   0273

        JSR     R5,     L_6C9A                  ; 6CFC   0004 016C 009A
        DECLE   $032F,  $033F                   ; 6CFF   032F 033F

        PULR    R2                              ; 6D01   02B2
        MOVR    R2,     R1                      ; 6D02   0091
        SLR     R1,     2                       ; 6D03   0065
        SLR     R1,     1                       ; 6D04   0061
        ADDR    R1,     R2                      ; 6D05   00CA
        CLRR    R1                              ; 6D06   01C9
        SLR     R2,     1                       ; 6D07   0062
        CMPR    R2,     R3                      ; 6D08   0153
        BGE     L_6D13                          ; 6D09   020D 0008

        ADDI    #$0002, R1                      ; 6D0B   02F9 0002
        SLR     R2,     1                       ; 6D0D   0062
        CMPR    R2,     R3                      ; 6D0E   0153
        BGE     L_6D13                          ; 6D0F   020D 0002

        ADDI    #$0004, R1                      ; 6D11   02F9 0004
L_6D13:
        MVI     G_01C6, R5                      ; 6D13   0285 01C6
        ANDI    #$0080, R5                      ; 6D15   03BD 0080
        BEQ     L_6D1B                          ; 6D17   0204 0002

        ADDI    #$0003, R1                      ; 6D19   02F9 0003
L_6D1B:
        PULR    R7                              ; 6D1B   02B7

L_6D1C:
        PSHR    R5                              ; 6D1C   0275

        JSR     R5,     L_6CED                  ; 6D1D   0004 016C 00ED

        PSHR    R1                              ; 6D20   0271
        MOVR    R3,     R4                      ; 6D21   009C

        JSR     R5,     L_6CBD                  ; 6D22   0004 016C 00BD

        MVII    #$0001, R0                      ; 6D25   02B8 0001
        PULR    R2                              ; 6D27   02B2
        CMPR    R1,     R2                      ; 6D28   014A
        BGT     L_6A01                          ; 6D29   022E 0329
        BMI     L_6D30                          ; 6D2B   020B 0003

        CMPR    R3,     R4                      ; 6D2D   015C
        BMI     L_6A01                          ; 6D2E   022B 032E

L_6D30:
        MOVR    R2,     R1                      ; 6D30   0091
        INCR    R0                              ; 6D31   0008
        PULR    R7                              ; 6D32   02B7

L_6D33:
        PSHR    R5                              ; 6D33   0275
        MVI     G_017C, R2                      ; 6D34   0282 017C

        JSR     R5,     L_672D                  ; 6D36   0004 0164 032D

        BNC     L_6D3E                          ; 6D39   0209 0003

        NEGR    R2                              ; 6D3B   0022
        ADDI    #$0064, R2                      ; 6D3C   02FA 0064
L_6D3E:
        PULR    R7                              ; 6D3E   02B7

L_6D3F:
        PSHR    R5                              ; 6D3F   0275
        MVI     G_01C6, R5                      ; 6D40   0285 01C6
        ANDI    #$0001, R5                      ; 6D42   03BD 0001
        BEQ     L_6FDD                          ; 6D44   0204 0297

        MVII    #$0004, R0                      ; 6D46   02B8 0004

        JSR     R5,     L_6719                  ; 6D48   0004 0164 0319

        CMPR    R1,     R0                      ; 6D4B   0148
        BGE     L_6D4F                          ; 6D4C   020D 0001

        MOVR    R1,     R0                      ; 6D4E   0088
L_6D4F:
        MVO     R0,     G_01C1                  ; 6D4F   0240 01C1
        MVII    #$0009, R0                      ; 6D51   02B8 0009

        JSR     R5,     X_RAND2                 ; 6D53   0004 0114 029E

        INCR    R0                              ; 6D56   0008
        MVO     R0,     G_019C                  ; 6D57   0240 019C

        JSR     R5,     L_6F1B                  ; 6D59   0004 016C 031B

        PULR    R7                              ; 6D5C   02B7

L_6D5D:
        PSHR    R5                              ; 6D5D   0275
        MVI     G_01C6, R5                      ; 6D5E   0285 01C6
        ANDI    #$0002, R5                      ; 6D60   03BD 0002
        BEQ     L_6FDD                          ; 6D62   0204 0279

        JSR     R5,     L_6D72                  ; 6D64   0004 016C 0172
        JSR     R5,     L_6F5B                  ; 6D67   0004 016C 035B

        MVII    #$0002, R5                      ; 6D6A   02BD 0002
        MVO     R5,     G_01C5                  ; 6D6C   0245 01C5

        JSR     R5,     L_6F30                  ; 6D6E   0004 016C 0330

        PULR    R7                              ; 6D71   02B7

L_6D72:
        PSHR    R5                              ; 6D72   0275

        JSR     R5,     L_6D33                  ; 6D73   0004 016C 0133

        MVI     G_015F, R4                      ; 6D76   0284 015F
        MVI     G_017D, R3                      ; 6D78   0283 017D
        SWAP    R3,     1                       ; 6D7A   0043
        SWAP    R3,     1                       ; 6D7B   0043
        BGE     L_6D7F                          ; 6D7C   020D 0001

        MOVR    R2,     R3                      ; 6D7E   0093

L_6D7F:
        JSR     R5,     L_6EE0                  ; 6D7F   0004 016C 02E0
        JSR     R5,     L_6E47                  ; 6D82   0004 016C 0247

        CMPR    R2,     R3                      ; 6D85   0153
        BEQ     L_6D96                          ; 6D86   0204 000E

        CMPI    #$004B, R2                      ; 6D88   037A 004B
        BMI     L_6D8E                          ; 6D8A   020B 0002

        ADDI    #$0004, R4                      ; 6D8C   02FC 0004
L_6D8E:
        CMPI    #$0019, R2                      ; 6D8E   037A 0019
        BMI     L_6D94                          ; 6D90   020B 0002

        ADDI    #$0004, R4                      ; 6D92   02FC 0004
L_6D94:
        ADDI    #$0004, R4                      ; 6D94   02FC 0004
L_6D96:
        INCR    R4                              ; 6D96   000C
        ADDR    R7,     R4                      ; 6D97   00FC
        ADD@    R4,     R7                      ; 6D98   02E7

        DECR    R0                              ; 6D99   0010
        COMR    R0                              ; 6D9A   0018
        ADCR    R6                              ; 6D9B   002E
        RLC     R2,     1                       ; 6D9C   0052
        DECR    R0                              ; 6D9D   0010
        NEGR    R0                              ; 6D9E   0020
        SWAP    R0,     1                       ; 6D9F   0040
        RLC     R2,     1                       ; 6DA0   0052
        DECR    R4                              ; 6DA1   0014
        NEGR    R0                              ; 6DA2   0020
        SWAP    R0,     1                       ; 6DA3   0040
        RLC     R2,     1                       ; 6DA4   0052
        DECR    R0                              ; 6DA5   0010
        COMR    R0                              ; 6DA6   0018
        ADCR    R6                              ; 6DA7   002E
        RLC     R1,     2                       ; 6DA8   0055
        MVII    #$002D, R0                      ; 6DA9   02B8 002D
        B       L_6E04                          ; 6DAB   0200 0057

        MVII    #$0042, R0                      ; 6DAD   02B8 0042
        B       L_6E04                          ; 6DAF   0200 0053

        CMPI    #$0002, R3                      ; 6DB1   037B 0002
        BLE     L_6E38                          ; 6DB3   0206 0083

        MVII    #$002D, R0                      ; 6DB5   02B8 002D
        B       L_6E04                          ; 6DB7   0200 004B

        CMPI    #$0002, R3                      ; 6DB9   037B 0002
        BLE     L_6E38                          ; 6DBB   0206 007B

        MVII    #$002D, R0                      ; 6DBD   02B8 002D
        CMPI    #$0005, R3                      ; 6DBF   037B 0005
        BLE     L_6E04                          ; 6DC1   0206 0041

        MVII    #$0042, R0                      ; 6DC3   02B8 0042
        B       L_6E25                          ; 6DC5   0200 005E

        CMPI    #$0001, R3                      ; 6DC7   037B 0001
        BLE     L_6E32                          ; 6DC9   0206 0067

        MVII    #$001F, R0                      ; 6DCB   02B8 001F
        CMPI    #$0003, R3                      ; 6DCD   037B 0003
        BLE     L_6E04                          ; 6DCF   0206 0033

        MVII    #$002D, R0                      ; 6DD1   02B8 002D
        CMPI    #$0006, R3                      ; 6DD3   037B 0006
        BLE     L_6E1D                          ; 6DD5   0206 0046
        B       L_6E25                          ; 6DD7   0200 004C

        CMPI    #$0001, R3                      ; 6DD9   037B 0001
        BLE     L_6E32                          ; 6DDB   0206 0055

        MVII    #$001F, R0                      ; 6DDD   02B8 001F
        CMPI    #$0003, R3                      ; 6DDF   037B 0003
        BLE     L_6E04                          ; 6DE1   0206 0021

        MVII    #$0042, R0                      ; 6DE3   02B8 0042
        CMPI    #$0006, R3                      ; 6DE5   037B 0006
        BLE     L_6E1D                          ; 6DE7   0206 0034
        B       L_6E25                          ; 6DE9   0200 003A

        DECLE   $009B,  $0204,  $0044,  $0004   ; 6DEB   009B 0204 0044 0004
        DECLE   $01A4,  $0225,  $0007           ; 6DEF   01A4 0225 0007

        JSR     R5,     L_6719                  ; 6DF2   0004 0164 0319

        CMPR    R0,     R1                      ; 6DF5   0141
        BLE     L_6DF9                          ; 6DF6   0206 0001

        MOVR    R1,     R0                      ; 6DF8   0088
L_6DF9:
        NEGR    R0                              ; 6DF9   0020
        ADDI    #$0028, R0                      ; 6DFA   02F8 0028
        CMPR    R0,     R2                      ; 6DFC   0142
        MVII    #$0043, R0                      ; 6DFD   02B8 0043
        BMI     L_6FDD                          ; 6DFF   020B 01DC

        MVII    #$0042, R0                      ; 6E01   02B8 0042
        PULR    R7                              ; 6E03   02B7

L_6E04:
        SUBI    #$0006, R0                      ; 6E04   0338 0006

        JSR     R5,     X_RAND2                 ; 6E06   0004 0114 029E

        ADDI    #$0006, R0                      ; 6E09   02F8 0006
        PULR    R7                              ; 6E0B   02B7

L_6E0C:
        MVII    #$0002, R0                      ; 6E0C   02B8 0002

        JSR     R5,     X_RAND1                 ; 6E0E   0004 0114 027D

        SARC    R0,     1                       ; 6E11   0078
        BC      L_6E3E                          ; 6E12   0201 002A

        CMPI    #$0003, R3                      ; 6E14   037B 0003
        BMI     L_6E38                          ; 6E16   020B 0020

        SARC    R0,     1                       ; 6E18   0078
        BC      L_6E3E                          ; 6E19   0201 0023

        MVII    #$0042, R0                      ; 6E1B   02B8 0042
L_6E1D:
        SUBI    #$0011, R0                      ; 6E1D   0338 0011

        JSR     R5,     X_RAND2                 ; 6E1F   0004 0114 029E

        ADDI    #$0011, R0                      ; 6E22   02F8 0011
        PULR    R7                              ; 6E24   02B7

L_6E25:
        JSR     R5,     L_6EEC                  ; 6E25   0004 016C 02EC

        BC      L_6E3E                          ; 6E28   0201 0014

        SUBI    #$001F, R0                      ; 6E2A   0338 001F

        JSR     R5,     X_RAND2                 ; 6E2C   0004 0114 029E

        ADDI    #$001F, R0                      ; 6E2F   02F8 001F
        PULR    R7                              ; 6E31   02B7

L_6E32:
        MVII    #$0011, R0                      ; 6E32   02B8 0011

        JSR     R5,     X_RAND2                 ; 6E34   0004 0114 029E

        PULR    R7                              ; 6E37   02B7

L_6E38:
        MVII    #$001F, R0                      ; 6E38   02B8 001F

        JSR     R5,     X_RAND2                 ; 6E3A   0004 0114 029E

        PULR    R7                              ; 6E3D   02B7

L_6E3E:
        MVII    #$0015, R0                      ; 6E3E   02B8 0015

        JSR     R5,     X_RAND2                 ; 6E40   0004 0114 029E

        ADDI    #$002D, R0                      ; 6E43   02F8 002D
        PULR    R7                              ; 6E45   02B7
L_6E46:
        MOVR    R5,     R7                      ; 6E46   00AF

L_6E47:
        MVI     G_017B, R1                      ; 6E47   0281 017B
        SARC    R1,     2                       ; 6E49   007D
        BNC     L_6E46                          ; 6E4A   0229 0005

        MVI     G_0163, R1                      ; 6E4C   0281 0163
        BOV     L_6E8D                          ; 6E4E   0202 003D

        TSTR    R1                              ; 6E50   0089
        BNEQ    L_6E46                          ; 6E51   022C 000C

        CMPI    #$0041, R2                      ; 6E53   037A 0041
        BGE     L_6E46                          ; 6E55   022D 0010

        MVI     G_0162, R1                      ; 6E57   0281 0162
        CMPI    #$000C, R1                      ; 6E59   0379 000C
        BGT     L_6E67                          ; 6E5B   020E 000A

        CMPI    #$002D, R2                      ; 6E5D   037A 002D
        BGT     L_6E3E                          ; 6E5F   022E 0022

        DECR    R2                              ; 6E61   0012
        BLE     L_6E32                          ; 6E62   0226 0031

L_6E64:
        MVII    #$0043, R0                      ; 6E64   02B8 0043
        PULR    R7                              ; 6E66   02B7

L_6E67:
        CMPI    #$0003, R4                      ; 6E67   037C 0003
        BNEQ    L_6E0C                          ; 6E69   022C 005E

        TSTR    R2                              ; 6E6B   0092
        BEQ     L_6E32                          ; 6E6C   0224 003B

        CMPI    #$001E, R1                      ; 6E6E   0379 001E
        BGT     L_6E7A                          ; 6E70   020E 0008

L_6E72:
        MVII    #$0042, R0                      ; 6E72   02B8 0042
        CMPI    #$002D, R2                      ; 6E74   037A 002D
        BGT     L_6FDD                          ; 6E76   020E 0165
        B       L_6E64                          ; 6E78   0220 0015

L_6E7A:
        TSTR    R3                              ; 6E7A   009B
        BEQ     L_6E32                          ; 6E7B   0224 004A

        CMPI    #$0023, R2                      ; 6E7D   037A 0023
        BMI     L_6E64                          ; 6E7F   022B 001C

        CMPI    #$0003, R3                      ; 6E81   037B 0003
        BGT     L_6E72                          ; 6E83   022E 0012

        CMPI    #$0037, R2                      ; 6E85   037A 0037
        BGE     L_6E72                          ; 6E87   022D 0016

        MVII    #$0042, R0                      ; 6E89   02B8 0042
        B       L_6E1D                          ; 6E8B   0220 006F

L_6E8D:
        CMPI    #$0001, R1                      ; 6E8D   0379 0001
        BGT     L_6E46                          ; 6E8F   022E 004A
        BMI     L_6EBD                          ; 6E91   020B 002A

        CMPI    #$0003, R4                      ; 6E93   037C 0003
        BEQ     L_6E9D                          ; 6E95   0204 0006

        CMPI    #$0008, R0                      ; 6E97   0378 0008
        BGE     L_6E0C                          ; 6E99   022D 008E
        B       L_6E46                          ; 6E9B   0220 0056

L_6E9D:
        CMPI    #$000B, R0                      ; 6E9D   0378 000B
        BGE     L_6E0C                          ; 6E9F   022D 0094

        CMPI    #$0007, R0                      ; 6EA1   0378 0007
        BMI     L_6E46                          ; 6EA3   022B 005E

        CMPI    #$0028, R2                      ; 6EA5   037A 0028
        BMI     L_6EB3                          ; 6EA7   020B 000A

        CMPI    #$003C, R2                      ; 6EA9   037A 003C
        BGE     L_6E46                          ; 6EAB   022D 0066

        CMPI    #$0004, R3                      ; 6EAD   037B 0004
        BLE     L_6E0C                          ; 6EAF   0226 00A4
        B       L_6E46                          ; 6EB1   0220 006C

L_6EB3:
        MVII    #$0043, R0                      ; 6EB3   02B8 0043
        CMPI    #$0002, R3                      ; 6EB5   037B 0002
        BGT     L_6FDD                          ; 6EB7   020E 0124

        MVII    #$0042, R0                      ; 6EB9   02B8 0042
        B       L_6E04                          ; 6EBB   0220 00B8

L_6EBD:
        CMPI    #$0004, R0                      ; 6EBD   0378 0004
        BGE     L_6E0C                          ; 6EBF   022D 00B4

        MVI     G_0162, R1                      ; 6EC1   0281 0162
        CMPI    #$000F, R1                      ; 6EC3   0379 000F
        BLE     L_6ECB                          ; 6EC5   0206 0004

        CMPI    #$0003, R4                      ; 6EC7   037C 0003
        BNEQ    L_6E46                          ; 6EC9   022C 0084

L_6ECB:
        CMPI    #$0003, R0                      ; 6ECB   0378 0003
        BNEQ    L_6ED3                          ; 6ECD   020C 0004

        CMPI    #$0002, R2                      ; 6ECF   037A 0002
        BLE     L_6E32                          ; 6ED1   0226 00A0

L_6ED3:
        CMPI    #$002D, R2                      ; 6ED3   037A 002D
        BMI     L_6E64                          ; 6ED5   022B 0072

        TSTR    R0                              ; 6ED7   0080
        BGT     L_6E3E                          ; 6ED8   022E 009B

        CMPI    #$0003, R4                      ; 6EDA   037C 0003
        BEQ     L_6E46                          ; 6EDC   0224 0097
        B       L_6E32                          ; 6EDE   0220 00AD

L_6EE0:
        PSHR    R0                              ; 6EE0   0270
        MVI     G_0179, R1                      ; 6EE1   0281 0179
        SUB     G_017A, R1                      ; 6EE3   0301 017A
        MVI     G_015E, R0                      ; 6EE5   0280 015E
        SARC    R0,     1                       ; 6EE7   0078
        ADCR    R7                              ; 6EE8   002F

        NEGR    R1                              ; 6EE9   0021
L_6EEA:
        PULR    R0                              ; 6EEA   02B0
        MOVR    R5,     R7                      ; 6EEB   00AF

L_6EEC:
        PSHR    R5                              ; 6EEC   0275

        JSR     R5,     L_6EE0                  ; 6EED   0004 016C 02E0

        MVI     G_017B, R5                      ; 6EF0   0285 017B
        TSTR    R5                              ; 6EF2   00AD
        BEQ     L_6F17                          ; 6EF3   0204 0022

        CMPI    #$000E, R1                      ; 6EF5   0379 000E
        BGE     L_6F19                          ; 6EF7   020D 0020

        DECR    R5                              ; 6EF9   0015
        BEQ     L_6F17                          ; 6EFA   0204 001B

        CMPI    #$000A, R1                      ; 6EFC   0379 000A
        BGE     L_6F19                          ; 6EFE   020D 0019

        DECR    R5                              ; 6F00   0015
        BEQ     L_6F17                          ; 6F01   0204 0014

        CMPI    #$0008, R1                      ; 6F03   0379 0008
        BGE     L_6F19                          ; 6F05   020D 0012

        MVI     G_0163, R5                      ; 6F07   0285 0163
        CMPI    #$0001, R5                      ; 6F09   037D 0001
        BGT     L_6F17                          ; 6F0B   020E 000A

        CMPI    #$0004, R1                      ; 6F0D   0379 0004
        BGE     L_6F19                          ; 6F0F   020D 0008

        DECR    R5                              ; 6F11   0015
        BEQ     L_6F17                          ; 6F12   0204 0003

        TSTR    R1                              ; 6F14   0089
        BGT     L_6F19                          ; 6F15   020E 0002

L_6F17:
        CLRC                                    ; 6F17   0006
        PULR    R7                              ; 6F18   02B7

L_6F19:
        SETC                                    ; 6F19   0007
        PULR    R7                              ; 6F1A   02B7

L_6F1B:
        PSHR    R5                              ; 6F1B   0275

        JSR     R5,     L_6EE0                  ; 6F1C   0004 016C 02E0

        TSTR    R1                              ; 6F1F   0089
        BGE     L_6FDD                          ; 6F20   020D 00BB

        JSR     R5,     L_6F48                  ; 6F22   0004 016C 0348

        BNC     L_6FDD                          ; 6F25   0209 00B6

        TSTR    R0                              ; 6F27   0080
        BEQ     L_6FDD                          ; 6F28   0204 00B3

        MVI     G_015E, R1                      ; 6F2A   0281 015E

        JSR     R5,     L_632A                  ; 6F2C   0004 0160 032A

        PULR    R7                              ; 6F2F   02B7

L_6F30:
        PSHR    R5                              ; 6F30   0275

        JSR     R5,     L_6F48                  ; 6F31   0004 016C 0348

        BNC     L_6FDD                          ; 6F34   0209 00A7

        TSTR    R0                              ; 6F36   0080
        BNEQ    L_6F40                          ; 6F37   020C 0007

        JSR     R5,     L_6D33                  ; 6F39   0004 016C 0133

        CMPI    #$003E, R2                      ; 6F3C   037A 003E
        BGT     L_6FDD                          ; 6F3E   020E 009D

L_6F40:
        MVI     G_015E, R1                      ; 6F40   0281 015E
        XORI    #$0001, R1                      ; 6F42   03F9 0001

        JSR     R5,     L_632A                  ; 6F44   0004 0160 032A

        PULR    R7                              ; 6F47   02B7

L_6F48:
        PSHR    R5                              ; 6F48   0275
        MVI     G_015F, R0                      ; 6F49   0280 015F
        CMPI    #$0003, R0                      ; 6F4B   0378 0003
        BGE     L_6F17                          ; 6F4D   022D 0037

        MVI     G_0163, R0                      ; 6F4F   0280 0163
        TSTR    R0                              ; 6F51   0080
        BNEQ    L_6F17                          ; 6F52   022C 003C

        MVI     G_017B, R0                      ; 6F54   0280 017B
        SARC    R0,     1                       ; 6F56   0078
        BNC     L_6F17                          ; 6F57   0229 0041

        SETC                                    ; 6F59   0007
        PULR    R7                              ; 6F5A   02B7

L_6F5B:
        PSHR    R5                              ; 6F5B   0275
        MVO     R0,     G_0177                  ; 6F5C   0240 0177
        SDBD                                    ; 6F5E   0001
        MVII    #$9397, R5                      ; 6F5F   02BD 0097 0093
        SLL     R0,     1                       ; 6F62   0048
        ADDR    R0,     R5                      ; 6F63   00C5
        SDBD                                    ; 6F64   0001
        MVI@    R5,     R4                      ; 6F65   02AC
        MVI@    R4,     R0                      ; 6F66   02A0
        MVO     R0,     G_019A                  ; 6F67   0240 019A
        MVII    #$0003, R1                      ; 6F69   02B9 0003
        CMPI    #$000A, R0                      ; 6F6B   0378 000A
        BMI     L_6F75                          ; 6F6D   020B 0006

        MVII    #$0002, R1                      ; 6F6F   02B9 0002
        BEQ     L_6F75                          ; 6F71   0204 0002

        MVII    #$0004, R1                      ; 6F73   02B9 0004
L_6F75:
        MVO     R1,     G_0199                  ; 6F75   0241 0199
        MVII    #$000C, R0                      ; 6F77   02B8 000C
        MVO     R0,     G_0175                  ; 6F79   0240 0175
        MVI@    R4,     R0                      ; 6F7B   02A0
        MVO     R0,     G_0176                  ; 6F7C   0240 0176
        MVI@    R4,     R0                      ; 6F7E   02A0

        JSR     R5,     X_RAND2                 ; 6F7F   0004 0114 029E

        ADDR    R0,     R4                      ; 6F82   00C4
        MVI@    R4,     R0                      ; 6F83   02A0

        JSR     R5,     L_6F95                  ; 6F84   0004 016C 0395

        PULR    R7                              ; 6F87   02B7

        DECLE   $0000,  $0003,  $0002,  $0001   ; 6F88   0000 0003 0002 0001
        DECLE   $0006,  $0005,  $0004           ; 6F8C   0006 0005 0004

        INCR    R1                              ; 6F8F   0009
        INCR    R0                              ; 6F90   0008
        SETC                                    ; 6F91   0007
        INCR    R4                              ; 6F92   000C
        INCR    R3                              ; 6F93   000B
        INCR    R2                              ; 6F94   000A
L_6F95:
        PSHR    R5                              ; 6F95   0275
        MOVR    R0,     R1                      ; 6F96   0081
        SLR     R1,     2                       ; 6F97   0065
        SLR     R1,     2                       ; 6F98   0065
        SDBD                                    ; 6F99   0001
        MVII    #$9000, R4                      ; 6F9A   02BC 0000 0090
        SLR     R1,     1                       ; 6F9D   0061
        PSHR    R4                              ; 6F9E   0274
        ANDI    #$001F, R0                      ; 6F9F   03B8 001F
        BEQ     L_6FA7                          ; 6FA1   0204 0004

L_6FA3:
        ADD@    R4,     R4                      ; 6FA3   02E4
        DECR    R0                              ; 6FA4   0010
        BGT     L_6FA3                          ; 6FA5   022E 0003

L_6FA7:
        MVI@    R4,     R0                      ; 6FA7   02A0
        MVO     R0,     G_01A5                  ; 6FA8   0240 01A5
        MVII    #$01A7, R5                      ; 6FAA   02BD 01A7
        TSTR    R0                              ; 6FAC   0080
        BEQ     L_6FB4                          ; 6FAD   0204 0005

L_6FAF:
        MVI@    R4,     R2                      ; 6FAF   02A2
        MVO@    R2,     R5                      ; 6FB0   026A
        DECR    R0                              ; 6FB1   0010
        BGT     L_6FAF                          ; 6FB2   022E 0004

L_6FB4:
        PULR    R4                              ; 6FB4   02B4
        TSTR    R1                              ; 6FB5   0089
        BEQ     L_6FBC                          ; 6FB6   0204 0004

L_6FB8:
        ADD@    R4,     R4                      ; 6FB8   02E4
        DECR    R1                              ; 6FB9   0011
        BGT     L_6FB8                          ; 6FBA   022E 0003

L_6FBC:
        MVI@    R4,     R1                      ; 6FBC   02A1
        MVO     R1,     G_01A6                  ; 6FBD   0241 01A6
        MVII    #$01B3, R5                      ; 6FBF   02BD 01B3
        TSTR    R1                              ; 6FC1   0089
        BEQ     L_6FC9                          ; 6FC2   0204 0005

L_6FC4:
        MVI@    R4,     R2                      ; 6FC4   02A2
        MVO@    R2,     R5                      ; 6FC5   026A
        DECR    R1                              ; 6FC6   0011
        BGT     L_6FC4                          ; 6FC7   022E 0004

L_6FC9:
        JSR     R5,     L_672D                  ; 6FC9   0004 0164 032D

        BNC     L_6FDD                          ; 6FCC   0209 000F

        MVII    #$01A7, R5                      ; 6FCE   02BD 01A7
        MOVR    R5,     R4                      ; 6FD0   00AC
        SDBD                                    ; 6FD1   0001
        MVII    #$6F88, R0                      ; 6FD2   02B8 0088 006F
L_6FD5:
        MVI@    R5,     R1                      ; 6FD5   02A9
        ADDR    R0,     R1                      ; 6FD6   00C1
        MVI@    R1,     R1                      ; 6FD7   0289
        MVO@    R1,     R4                      ; 6FD8   0261
        CMPI    #$01BF, R4                      ; 6FD9   037C 01BF
        BMI     L_6FD5                          ; 6FDB   022B 0007
L_6FDD:
        PULR    R7                              ; 6FDD   02B7

L_6FDE:
        PSHR    R5                              ; 6FDE   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FDF   0004 0118 03BB
        DECLE   $0079                           ; 6FE2  SFX data
        DECLE   $03ED                           ; 6FE3  SFX data
        DECLE   $03B7                           ; 6FE4  SFX data
        DECLE   $004C,  $0000                   ; 6FE5  SFX data
        DECLE   $000B                           ; 6FE7  SFX data
        DECLE   $03CF                           ; 6FE8  SFX end

L_6FE9:
        PSHR    R5                              ; 6FE9   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FEA   0004 0118 03BB
        DECLE   $03E9                           ; 6FED  SFX data
        DECLE   $02C0,  $0040                   ; 6FEE  SFX data
        DECLE   $0001,  $0004                   ; 6FF0  SFX data
        DECLE   $008F,  $012B                   ; 6FF2  SFX data
        DECLE   $02CF                           ; 6FF4  SFX end

L_6FF5:
        PSHR    R5                              ; 6FF5   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FF6   0004 0118 03BB
        DECLE   $03E9                           ; 6FF9  SFX data
        DECLE   $03C0,  $00C0                   ; 6FFA  SFX data
        DECLE   $0001,  $03CC                   ; 6FFC  SFX data
        DECLE   $01AB                           ; 6FFE  SFX data
        DECLE   $02CF                           ; 6FFF  SFX end


        ORG     $D000
        DECLE   $0000,  $000A,  $0004,  $0004   ; D000   0000 000A 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; D004   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; D008   0004 0004 0004 0004
        DECLE   $000A,  $0004,  $0004,  $0004   ; D00C   000A 0004 0004 0004
        DECLE   $0004,  $0004,  $0006,  $0004   ; D010   0004 0004 0006 0004
        DECLE   $0006,  $0004,  $0006,  $000B   ; D014   0006 0004 0006 000B
        DECLE   $0004,  $0005,  $0004,  $0005   ; D018   0004 0005 0004 0005
        DECLE   $0004,  $0005,  $0004,  $0005   ; D01C   0004 0005 0004 0005
        DECLE   $0004,  $0005,  $0004,  $0006   ; D020   0004 0005 0004 0006
        DECLE   $0002,  $0004,  $0004,  $0004   ; D024   0002 0004 0004 0004
        DECLE   $0004,  $0004,  $0008,  $0001   ; D028   0004 0004 0008 0001
        DECLE   $0004,  $0004,  $0007,  $0005   ; D02C   0004 0004 0007 0005
        DECLE   $0006,  $0004,  $0004,  $0007   ; D030   0006 0004 0004 0007
        DECLE   $0001,  $0004,  $0004,  $0004   ; D034   0001 0004 0004 0004
        DECLE   $0005,  $0009,  $0004,  $0009   ; D038   0005 0009 0004 0009
        DECLE   $0004,  $0004,  $0003,  $0004   ; D03C   0004 0004 0003 0004
        DECLE   $0004,  $0004,  $0009,  $0004   ; D040   0004 0004 0009 0004
        DECLE   $0004,  $0006,  $0008,  $0004   ; D044   0004 0006 0008 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; D048   0004 0004 0004 0004
        DECLE   $0008,  $0007,  $0004,  $0004   ; D04C   0008 0007 0004 0004
        DECLE   $0001,  $0005,  $0006,  $0004   ; D050   0001 0005 0006 0004
        DECLE   $0004,  $0007,  $0007,  $0004   ; D054   0004 0007 0007 0004
        DECLE   $0004,  $0004,  $0005,  $0003   ; D058   0004 0004 0005 0003
        DECLE   $0004,  $0009,  $0004,  $0004   ; D05C   0004 0009 0004 0004
        DECLE   $0009,  $0004,  $0004,  $0004   ; D060   0009 0004 0004 0004
        DECLE   $0003,  $0004,  $0004,  $0008   ; D064   0003 0004 0004 0008
        DECLE   $0001,  $0007,  $0001,  $0007   ; D068   0001 0007 0001 0007
        DECLE   $0001,  $0007,  $0001,  $0007   ; D06C   0001 0007 0001 0007
        DECLE   $0008,  $0007,  $0007,  $0001   ; D070   0008 0007 0007 0001
        DECLE   $0007,  $0001,  $0007,  $0001   ; D074   0007 0001 0007 0001
        DECLE   $0001,  $0006,  $0004,  $0004   ; D078   0001 0006 0004 0004
        DECLE   $0004,  $0004,  $0002,  $0002   ; D07C   0004 0004 0002 0002
        DECLE   $0006,  $0004,  $0004,  $0004   ; D080   0006 0004 0004 0004
        DECLE   $0004,  $0008,  $0008,  $000A   ; D084   0004 0008 0008 000A
        DECLE   $0004,  $0004,  $0009,  $0004   ; D088   0004 0004 0009 0004
        DECLE   $0004,  $0001,  $0003,  $0007   ; D08C   0004 0001 0003 0007
        DECLE   $0007,  $0001,  $0009,  $0004   ; D090   0007 0001 0009 0004
        DECLE   $0004,  $0007,  $0001,  $0003   ; D094   0004 0007 0001 0003
        DECLE   $0009,  $0004,  $0004,  $0004   ; D098   0009 0004 0004 0004
        DECLE   $000A,  $0001,  $0007,  $0007   ; D09C   000A 0001 0007 0007
        DECLE   $0006,  $0001,  $0001,  $0006   ; D0A0   0006 0001 0001 0006
        DECLE   $0007,  $0007,  $0001,  $0007   ; D0A4   0007 0007 0001 0007
        DECLE   $0001,  $0004,  $0007,  $0007   ; D0A8   0001 0004 0007 0007
        DECLE   $0001,  $0001,  $0008,  $0008   ; D0AC   0001 0001 0008 0008
        DECLE   $0001,  $0004,  $0008,  $0008   ; D0B0   0001 0004 0008 0008
        DECLE   $0008,  $0008,  $0001,  $0001   ; D0B4   0008 0008 0001 0001
        DECLE   $0008,  $0007,  $0004,  $0002   ; D0B8   0008 0007 0004 0002
        DECLE   $0002,  $0002,  $0002,  $0007   ; D0BC   0002 0002 0002 0007
        DECLE   $0007,  $0007,  $0001,  $0007   ; D0C0   0007 0007 0001 0007
        DECLE   $0001,  $0009,  $0002,  $0004   ; D0C4   0001 0009 0002 0004
        DECLE   $0003,  $0008,  $0007,  $0007   ; D0C8   0003 0008 0007 0007
        DECLE   $0001,  $0007,  $0006,  $0002   ; D0CC   0001 0007 0006 0002
        DECLE   $0002,  $0007,  $0008,  $0004   ; D0D0   0002 0007 0008 0004
        DECLE   $0001,  $0004,  $0004,  $0004   ; D0D4   0001 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0008   ; D0D8   0004 0004 0004 0008
        DECLE   $0004,  $0004,  $0001,  $0004   ; D0DC   0004 0004 0001 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; D0E0   0004 0004 0004 0004
        DECLE   $0008,  $0004,  $0007,  $0004   ; D0E4   0008 0004 0007 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; D0E8   0004 0004 0004 0004
        DECLE   $0004,  $0008,  $0004,  $0004   ; D0EC   0004 0008 0004 0004
        DECLE   $0007,  $0004,  $0004,  $0004   ; D0F0   0007 0004 0004 0004
        DECLE   $0004,  $0004,  $0007,  $0001   ; D0F4   0004 0004 0007 0001
        DECLE   $0004,  $0004,  $0008,  $0008   ; D0F8   0004 0004 0008 0008
        DECLE   $0008,  $0001,  $0007,  $0007   ; D0FC   0008 0001 0007 0007
        DECLE   $0004,  $0004,  $0002,  $0002   ; D100   0004 0004 0002 0002
        DECLE   $0002,  $0007,  $0009,  $0002   ; D104   0002 0007 0009 0002
        DECLE   $0005,  $0004,  $0004,  $0004   ; D108   0005 0004 0004 0004
        DECLE   $0004,  $0009,  $0007,  $0001   ; D10C   0004 0009 0007 0001
        DECLE   $0009,  $0008,  $0005,  $0004   ; D110   0009 0008 0005 0004
        DECLE   $0004,  $0004,  $0004,  $0003   ; D114   0004 0004 0004 0003
        DECLE   $0001                           ; D118   0001

        SETC                                    ; D119   0007
        EIS                                     ; D11A   0002
        DECR    R0                              ; D11B   0010
        SUB     .STIC.X.2,R7                    ; D11C   0307 0002

        MOVR    R6,     R4                      ; D11E   00B4
        SUB     .STIC.X.3,R7                    ; D11F   0307 0003

        SWAP    R3,     1                       ; D121   0043
        SWAP    R2,     2                       ; D122   0046
        SUB     .STIC.X.3,R7                    ; D123   0307 0003

        NOP                                     ; D125   0034
        RRC     R1,     2                       ; D126   0075
        SUB     .STIC.X.2,R7                    ; D127   0307 0002

        NOP                                     ; D129   0034
        SUB     .STIC.X.2,R7                    ; D12A   0307 0002

        MOVR    R7,     R4                      ; D12C   00BC
        SUB     .STIC.X.3,R7                    ; D12D   0307 0003

        SLL     R1,     2                       ; D12F   004D
        SLL     R2,     1                       ; D130   004A
        SUB     .STIC.X.3,R7                    ; D131   0307 0003

        RSWD    R4                              ; D133   003C
        SARC    R3,     1                       ; D134   007B
        SUB     .STIC.X.2,R7                    ; D135   0307 0002

        RSWD    R4                              ; D137   003C
        SUB     .STIC.X.3,R7                    ; D138   0307 0003

        DECR    R0                              ; D13A   0010
        SUBR    R1,     R0                      ; D13B   0108
        SUB     .STIC.X.4,R7                    ; D13C   0307 0004

        MOVR    R6,     R4                      ; D13E   00B4
        SUBR    R6,     R5                      ; D13F   0135
        SUBR    R4,     R7                      ; D140   0127
        SUB     .STIC.X.4,R7                    ; D141   0307 0004

        DECLE   $0053,  $0036                   ; D143   0053 0036

        SUBR    R0,     R6                      ; D145   0106
        SUB     .STIC.X.3,R7                    ; D146   0307 0003

        MOVR    R6,     R4                      ; D148   00B4
        SUBR    R3,     R0                      ; D149   0118
        SUB     .STIC.X.4,R7                    ; D14A   0307 0004

        MOVR    R7,     R4                      ; D14C   00BC
        SUBR    R7,     R3                      ; D14D   013B
        SUBR    R5,     R1                      ; D14E   0129
        SUB     .STIC.X.4,R7                    ; D14F   0307 0004

        SLLC    R1,     2                       ; D151   005D
        RSWD    R2                              ; D152   003A
        SUBR    R1,     R2                      ; D153   010A
        SUB     .STIC.X.3,R7                    ; D154   0307 0003

        MOVR    R7,     R4                      ; D156   00BC
        SUBR    R3,     R0                      ; D157   0118
        SUB     .STIC.X.3,R7                    ; D158   0307 0003

        MOVR    R6,     R4                      ; D15A   00B4
        SUB@    R2,     R7                      ; D15B   0317
        SUB     .STIC.X.4,R7                    ; D15C   0307 0004

        DECLE   $0094,  $0310,  $0247,  $0307   ; D15E   0094 0310 0247 0307
        DECLE   $0006,  $00A4,  $0113,  $0215   ; D162   0006 00A4 0113 0215
        DECLE   $0310,  $0216,  $0307,  $0005   ; D166   0310 0216 0307 0005
        DECLE   $0053,  $0036                   ; D16A   0053 0036

        SUB@    R2,     R0                      ; D16C   0310
        BLE     L_D476                          ; D16D   0206 0307

        DIS                                     ; D16F   0003
        MOVR    R7,     R4                      ; D170   00BC
        SUB@    R2,     R7                      ; D171   0317
        SUB     .STIC.X.4,R7                    ; D172   0307 0004

        MOVR    R3,     R4                      ; D174   009C
        SUB@    R2,     R0                      ; D175   0310
        MVO@    R1,     R1                      ; D176   0249
        SUB     .STIC.X.6,R7                    ; D177   0307 0006

        DECLE   $00AC,  $011D,  $021B,  $0310   ; D179   00AC 011D 021B 0310
        DECLE   $021A,  $0307,  $0005,  $005D   ; D17D   021A 0307 0005 005D
        DECLE   $003A,  $0310,  $020A,  $0307   ; D181   003A 0310 020A 0307

        CLRC                                    ; D185   0006
        MOVR    R6,     R0                      ; D186   00B0
        SUB@    R2,     R7                      ; D187   0317

        SUB@    R3,     R3                      ; D188   031B
        SUB@    R2,     R7                      ; D189   0317

        DECLE   $031B,  $0304,  $0009,  $0090   ; D18A   031B 0304 0009 0090
        DECLE   $0031,  $0133,  $0234,  $0310   ; D18E   0031 0133 0234 0310
        DECLE   $0235,  $0238                   ; D192   0235 0238

        SUB@    R2,     R7                      ; D194   0317
        SUB     .STIC.Y.1,R7                    ; D195   0307 0009

        DECLE   $0090,  $003F,  $013D,  $023C   ; D197   0090 003F 013D 023C
        DECLE   $0310,  $023B,  $0238           ; D19B   0310 023B 0238

        SUB@    R2,     R7                      ; D19E   0317
        SUB     .STIC.X.4,R7                    ; D19F   0307 0004

        GSWD    R0                              ; D1A1   0030
        SUB@    R2,     R7                      ; D1A2   0317

        SUB@    R3,     R3                      ; D1A3   031B
        SUB@    R4,     R2                      ; D1A4   0322
        INCR    R0                              ; D1A5   0008
        RRC     R0,     1                       ; D1A6   0070
        SUB@    R2,     R7                      ; D1A7   0317

        GSWD    R0                              ; D1A8   0030
        SUB@    R2,     R7                      ; D1A9   0317

        GSWD    R0                              ; D1AA   0030
        SUB@    R2,     R7                      ; D1AB   0317

        DECLE   $031B,  $0322,  $0007,  $00B0   ; D1AC   031B 0322 0007 00B0
        DECLE   $0200,  $0310,  $0234,  $0317   ; D1B0   0200 0310 0234 0317
        DECLE   $031B,  $0322,  $0008,  $0091   ; D1B4   031B 0322 0008 0091
        DECLE   $0200,  $0317,  $0310,  $0210   ; D1B8   0200 0317 0310 0210
        DECLE   $0317,  $0200,  $0322           ; D1BC   0317 0200 0322

        INCR    R0                              ; D1BF   0008
        MOVR    R3,     R7                      ; D1C0   009F

        DECLE   $0200,  $0317,  $0310,  $0210   ; D1C1   0200 0317 0310 0210
        DECLE   $0317,  $0200,  $0322,  $0001   ; D1C5   0317 0200 0322 0001
        DECLE   $0308,  $0001,  $0309,  $0008   ; D1C9   0308 0001 0309 0008
        DECLE   $0000,  $0001,  $0000,  $0009   ; D1CD   0000 0001 0000 0009
        DECLE   $0000,  $0001,  $0000,  $0006   ; D1D1   0000 0001 0000 0006
        DECLE   $0006,  $0001,  $0001,  $0007   ; D1D5   0006 0001 0001 0007
        DECLE   $0002,  $0001,  $0020,  $0006   ; D1D9   0002 0001 0020 0006
        DECLE   $0008,  $0001,  $0001,  $0007   ; D1DD   0008 0001 0001 0007
        DECLE   $0004,  $0001,  $0001,  $0008   ; D1E1   0004 0001 0001 0008
        DECLE   $0001,  $0005,  $01C0,  $0140   ; D1E5   0001 0005 01C0 0140
        DECLE   $03A0,  $0020,  $00E0,  $0008   ; D1E9   03A0 0020 00E0 0008
        DECLE   $0002,  $0005,  $01C0,  $0140   ; D1ED   0002 0005 01C0 0140
        DECLE   $03A0,  $0020,  $00E0,  $0008   ; D1F1   03A0 0020 00E0 0008
        DECLE   $0003,  $0005,  $01C0,  $0140   ; D1F5   0003 0005 01C0 0140
        DECLE   $03A0,  $0020,  $00E0,  $0009   ; D1F9   03A0 0020 00E0 0009
        DECLE   $0005,  $0005                   ; D1FD   0005 0005

        INCR    R7                              ; D1FF   000F

        CLRC                                    ; D200   0006
L_D201:
        COMR    R4                              ; D201   001C
        DECLE   $0001,  $000B,  $0009,  $0006   ; D202   0001 000B 0009 0006
        DECLE   $0005                           ; D206   0005

        INCR    R7                              ; D207   000F

        CLRC                                    ; D208   0006
L_D209:
        COMR    R4                              ; D209   001C
        DECLE   $0001,  $000B,  $0009,  $0007   ; D20A   0001 000B 0009 0007
        DECLE   $0005                           ; D20E   0005

        INCR    R7                              ; D20F   000F

        CLRC                                    ; D210   0006
L_D211:
        COMR    R4                              ; D211   001C
        DECLE   $0001,  $000B,  $0006,  $0005   ; D212   0001 000B 0006 0005
        DECLE   $0004,  $0001,  $001B,  $000C   ; D216   0004 0001 001B 000C
        DECLE   $0018,  $0006,  $0006,  $0004   ; D21A   0018 0006 0006 0004
        DECLE   $0001,  $001B,  $000C,  $0018   ; D21E   0001 001B 000C 0018
        DECLE   $0007,  $0001,  $0004,  $0020   ; D222   0007 0001 0004 0020
        DECLE   $0340,  $0180,  $0320,  $0007   ; D226   0340 0180 0320 0007
        DECLE   $0002,  $0004,  $0020,  $0340   ; D22A   0002 0004 0020 0340
        DECLE   $0180,  $0320,  $0008,  $000A   ; D22E   0180 0320 0008 000A
        DECLE   $0005,  $01C0,  $0140,  $03A0   ; D232   0005 01C0 0140 03A0
        DECLE   $0020,  $00E0,  $0008,  $000B   ; D236   0020 00E0 0008 000B
        DECLE   $0005,  $01C0,  $0140,  $03A0   ; D23A   0005 01C0 0140 03A0
        DECLE   $0020,  $00E0,  $0008,  $000C   ; D23E   0020 00E0 0008 000C
        DECLE   $0005,  $01C0,  $0140,  $03A0   ; D242   0005 01C0 0140 03A0
        DECLE   $0020,  $00E0,  $0009,  $000D   ; D246   0020 00E0 0009 000D
        DECLE   $0005                           ; D24A   0005

        INCR    R7                              ; D24B   000F

        CLRC                                    ; D24C   0006
L_D24D:
        COMR    R4                              ; D24D   001C
        DECLE   $0001,  $000B,  $0009,  $000E   ; D24E   0001 000B 0009 000E
        DECLE   $0005                           ; D252   0005

        INCR    R7                              ; D253   000F

        CLRC                                    ; D254   0006
L_D255:
        COMR    R4                              ; D255   001C
        DECLE   $0001                           ; D256   0001

        INCR    R3                              ; D257   000B
        INCR    R1                              ; D258   0009
        INCR    R7                              ; D259   000F

        DECLE   $0005                           ; D25A   0005
L_D25B:
        INCR    R7                              ; D25B   000F

        CLRC                                    ; D25C   0006
L_D25D:
        COMR    R4                              ; D25D   001C
        DECLE   $0001,  $000B,  $0002,  $0009   ; D25E   0001 000B 0002 0009
        DECLE   $0001,  $0020,  $0003,  $0009   ; D262   0001 0020 0003 0009
        DECLE   $0001,  $0001,  $0006,  $000E   ; D266   0001 0001 0006 000E
        DECLE   $0004,  $0001,  $0005,  $0006   ; D26A   0004 0001 0005 0006
        DECLE   $0007,  $0007,  $000B,  $0004   ; D26E   0007 0007 000B 0004
        DECLE   $0020,  $0120,  $0140,  $0160   ; D272   0020 0120 0140 0160
        DECLE   $0006,  $000F,  $0004,  $0005   ; D276   0006 000F 0004 0005
        DECLE   $0006,  $000C,  $0018,  $0006   ; D27A   0006 000C 0018 0006
        DECLE   $000D,  $0004,  $0005,  $0006   ; D27E   000D 0004 0005 0006
        DECLE   $000C,  $0018,  $0007,  $000C   ; D282   000C 0018 0007 000C
        DECLE   $0004,  $0020,  $0340,  $0180   ; D286   0004 0020 0340 0180
        DECLE   $03A0,  $0007,  $000A,  $0004   ; D28A   03A0 0007 000A 0004
        DECLE   $0020,  $0340,  $0180,  $03A0   ; D28E   0020 0340 0180 03A0
        DECLE   $0006,  $0015,  $0004,  $0001   ; D292   0006 0015 0004 0001
        DECLE   $0005,  $0006,  $0007,  $0007   ; D296   0005 0006 0007 0007
        DECLE   $0011,  $0004,  $0020,  $0120   ; D29A   0011 0004 0020 0120
        DECLE   $0140,  $0160,  $0006,  $0016   ; D29E   0140 0160 0006 0016
        DECLE   $0004,  $0001,  $0005,  $0006   ; D2A2   0004 0001 0005 0006
        DECLE   $0007,  $0007,  $0012,  $0004   ; D2A6   0007 0007 0012 0004
        DECLE   $0020,  $0120,  $0140,  $0160   ; D2AA   0020 0120 0140 0160
        DECLE   $0003,  $0015,  $0004,  $0001   ; D2AE   0003 0015 0004 0001
        DECLE   $0005,  $0006,  $0007,  $0002   ; D2B2   0005 0006 0007 0002
        DECLE   $0011,  $0004,  $0020,  $0120   ; D2B6   0011 0004 0020 0120
        DECLE   $0140,  $0160,  $0007,  $0010   ; D2BA   0140 0160 0007 0010
        DECLE   $0004,  $01AD,  $0340,  $037A   ; D2BE   0004 01AD 0340 037A
        DECLE   $0020,  $0006,  $0014,  $0004   ; D2C2   0020 0006 0014 0004
        DECLE   $00CC,  $0018,  $0006,  $0085   ; D2C6   00CC 0018 0006 0085
        DECLE   $0008,  $0013,  $0004           ; D2CA   0008 0013 0004

        ANDR    R4,     R1                      ; D2CD   01A1
        NEGR    R0                              ; D2CE   0020
        CMP     G_03AD, R0                      ; D2CF   0340 03AD
        INCR    R1                              ; D2D1   0009
L_D2D2:
        DECR    R7                              ; D2D2   0017

        DECLE   $0004,  $0001,  $00DC,  $0005   ; D2D3   0004 0001 00DC 0005
        DECLE   $000C,  $0007,  $0013,  $0004   ; D2D7   000C 0007 0013 0004

        ANDR    R4,     R1                      ; D2DB   01A1
        NEGR    R0                              ; D2DC   0020
        CMP     G_03AD, R0                      ; D2DD   0340 03AD
        CLRC                                    ; D2DF   0006
L_D2E0:
        DECR    R7                              ; D2E0   0017

        DECLE   $0004,  $0001,  $00DC,  $0005   ; D2E1   0004 0001 00DC 0005
        DECLE   $000C,  $0005,  $0013,  $0004   ; D2E5   000C 0005 0013 0004
        DECLE   $01A0,  $0020,  $0340,  $03A0   ; D2E9   01A0 0020 0340 03A0
        DECLE   $0004                           ; D2ED   0004
L_D2EE:
        DECR    R7                              ; D2EE   0017

        DECLE   $0004,  $0001,  $001C,  $0005   ; D2EF   0004 0001 001C 0005
        DECLE   $000C,  $0006,  $0014,  $0004   ; D2F3   000C 0006 0014 0004
        DECLE   $0001,  $0005,  $0006,  $0007   ; D2F7   0001 0005 0006 0007
        DECLE   $0007,  $0010,  $0004           ; D2FB   0007 0010 0004

        NEGR    R0                              ; D2FE   0020
        SUBR    R4,     R0                      ; D2FF   0120
        CMPR    R0,     R0                      ; D300   0140
        CMPR    R4,     R0                      ; D301   0160
        CLRC                                    ; D302   0006
        COMR    R0                              ; D303   0018
        CLRC                                    ; D304   0006
        NEGR    R1                              ; D305   0021
        ADCR    R7                              ; D306   002F

        XORR    R0,     R1                      ; D307   01C1
L_D308:
        CMPR    R1,     R4                      ; D308   014C
        SUBR    R4,     R5                      ; D309   0125
        AND@    R4,     R6                      ; D30A   03A6
        SETC                                    ; D30B   0007
        COMR    R0                              ; D30C   0018
        CLRC                                    ; D30D   0006
        NEGR    R1                              ; D30E   0021
        ADCR    R7                              ; D30F   002F

        XORR    R0,     R1                      ; D310   01C1
L_D311:
        CMPR    R1,     R4                      ; D311   014C
        SUBR    R4,     R5                      ; D312   0125
        AND@    R4,     R6                      ; D313   03A6
        INCR    R0                              ; D314   0008
        COMR    R0                              ; D315   0018
        CLRC                                    ; D316   0006
        NEGR    R1                              ; D317   0021
        ADCR    R7                              ; D318   002F

        XORR    R0,     R1                      ; D319   01C1
L_D31A:
        CMPR    R1,     R4                      ; D31A   014C
        SUBR    R4,     R5                      ; D31B   0125
        AND@    R4,     R6                      ; D31C   03A6
        INCR    R1                              ; D31D   0009
        COMR    R0                              ; D31E   0018
        CLRC                                    ; D31F   0006
        NEGR    R1                              ; D320   0021
        ADCR    R7                              ; D321   002F

        XORR    R0,     R1                      ; D322   01C1
L_D323:
        CMPR    R1,     R4                      ; D323   014C
        DECLE   $0125,  $03A6,  $0001,  $001B   ; D324   0125 03A6 0001 001B
        DECLE   $0001,  $0021,  $0001,  $001B   ; D328   0001 0021 0001 001B
        DECLE   $0006,  $01AC,  $018D,  $018C   ; D32C   0006 01AC 018D 018C
        DECLE   $02EC,  $01B6,  $02F6,  $0001   ; D330   02EC 01B6 02F6 0001
        DECLE   $001B,  $0005,  $0025,  $0125   ; D334   001B 0005 0025 0125
        DECLE   $0121,  $0230,  $0272,  $0001   ; D338   0121 0230 0272 0001
        DECLE   $001B,  $0005,  $0021,  $0038   ; D33C   001B 0005 0021 0038
        DECLE   $0039,  $0341,  $0361,  $0002   ; D340   0039 0341 0361 0002
        DECLE   $001D,  $0005                   ; D344   001D 0005

        NEGR    R1                              ; D346   0021
        ANDR    R0,     R1                      ; D347   0181
        ADCR    R4                              ; D348   002C
        XORR    R0,     R1                      ; D349   01C1
        ADCR    R7                              ; D34A   002F

        DIS                                     ; D34B   0003
L_D34C:
        COMR    R5                              ; D34C   001D
        DECLE   $0005                           ; D34D   0005

        NEGR    R1                              ; D34E   0021
        ANDR    R0,     R1                      ; D34F   0181
        ADCR    R4                              ; D350   002C
        XORR    R0,     R1                      ; D351   01C1
        ADCR    R7                              ; D352   002F

        EIS                                     ; D353   0002
L_D354:
        COMR    R5                              ; D354   001D
        DECLE   $0005,  $0021,  $0038,  $0039   ; D355   0005 0021 0038 0039
        DECLE   $0341,  $0361,  $0003,  $001D   ; D359   0341 0361 0003 001D
        DECLE   $0005,  $0021,  $0038,  $0039   ; D35D   0005 0021 0038 0039
        DECLE   $0341,  $0361,  $0008,  $001C   ; D361   0341 0361 0008 001C
        DECLE   $0005,  $0021,  $0041,  $01AC   ; D365   0005 0021 0041 01AC
        DECLE   $0023,  $00D4,  $0009,  $001C   ; D369   0023 00D4 0009 001C
        DECLE   $0005,  $0021,  $0041,  $01AC   ; D36D   0005 0021 0041 01AC
        DECLE   $0023,  $00D4,  $0007,  $001E   ; D371   0023 00D4 0007 001E
        DECLE   $0004,  $0021,  $0141,  $0161   ; D375   0004 0021 0141 0161
        DECLE   $016F,  $0005,  $001E,  $0004   ; D379   016F 0005 001E 0004
        DECLE   $0021,  $0141,  $0161,  $016F   ; D37D   0021 0141 0161 016F
        DECLE   $0006,  $001F,  $0004,  $0021   ; D381   0006 001F 0004 0021
        DECLE   $0026,  $0027,  $0024,  $0004   ; D385   0026 0027 0024 0004
        DECLE   $001F,  $0004,  $0021,  $0026   ; D389   001F 0004 0021 0026
        DECLE   $0027,  $0024,  $000A,  $0020   ; D38D   0027 0024 000A 0020
        DECLE   $0001,  $0000,  $000B,  $0021   ; D391   0001 0000 000B 0021
        DECLE   $0001,  $0000,  $00CC,  $0091   ; D395   0001 0000 00CC 0091
        DECLE   $00D0,  $0091,  $00D4,  $0091   ; D399   00D0 0091 00D4 0091
        DECLE   $00D8,  $0091,  $00DC,  $0091   ; D39D   00D8 0091 00DC 0091
        DECLE   $00E0,  $0091,  $0060,  $0092   ; D3A1   00E0 0091 0060 0092
        DECLE   $00E4,  $0091,  $00EC,  $0091   ; D3A5   00E4 0091 00EC 0091
        DECLE   $00F4,  $0091,  $00FC,  $0091   ; D3A9   00F4 0091 00FC 0091
        DECLE   $0004                           ; D3AD   0004

        TSTR    R2                              ; D3AE   0092
        INCR    R4                              ; D3AF   000C
        TSTR    R2                              ; D3B0   0092
        DECR    R4                              ; D3B1   0014
        TSTR    R2                              ; D3B2   0092
        COMR    R3                              ; D3B3   001B
        TSTR    R2                              ; D3B4   0092
        NEGR    R2                              ; D3B5   0022
        TSTR    R2                              ; D3B6   0092
        ADCR    R1                              ; D3B7   0029
        TSTR    R2                              ; D3B8   0092
        GSWD    R0                              ; D3B9   0030
        TSTR    R2                              ; D3BA   0092
        RSWD    R0                              ; D3BB   0038
        TSTR    R2                              ; D3BC   0092
        SWAP    R0,     1                       ; D3BD   0040
        TSTR    R2                              ; D3BE   0092
        SLL     R0,     1                       ; D3BF   0048
        TSTR    R2                              ; D3C0   0092
        RLC     R0,     1                       ; D3C1   0050
        TSTR    R2                              ; D3C2   0092
        SLLC    R0,     1                       ; D3C3   0058
        TSTR    R2                              ; D3C4   0092
        SLR     R0,     1                       ; D3C5   0060
        TSTR    R2                              ; D3C6   0092
        SLR     R0,     2                       ; D3C7   0064
        TSTR    R2                              ; D3C8   0092
        SAR     R0,     1                       ; D3C9   0068
        TSTR    R2                              ; D3CA   0092
        SAR     R3,     2                       ; D3CB   006F
        TSTR    R2                              ; D3CC   0092
        RRC     R2,     2                       ; D3CD   0076
        TSTR    R2                              ; D3CE   0092
        SARC    R1,     2                       ; D3CF   007D
        TSTR    R2                              ; D3D0   0092
        MOVR    R0,     R4                      ; D3D1   0084
        TSTR    R2                              ; D3D2   0092
        MOVR    R1,     R3                      ; D3D3   008B
        TSTR    R2                              ; D3D4   0092
        TSTR    R2                              ; D3D5   0092
        TSTR    R2                              ; D3D6   0092
        MOVR    R3,     R1                      ; D3D7   0099
        TSTR    R2                              ; D3D8   0092
        MOVR    R4,     R0                      ; D3D9   00A0
        TSTR    R2                              ; D3DA   0092
        MOVR    R4,     R7                      ; D3DB   00A7

        TSTR    R2                              ; D3DC   0092
        MOVR    R5,     R6                      ; D3DD   00AE
        TSTR    R2                              ; D3DE   0092
        MOVR    R6,     R5                      ; D3DF   00B5
        TSTR    R2                              ; D3E0   0092
        MOVR    R7,     R4                      ; D3E1   00BC
        TSTR    R2                              ; D3E2   0092
        ADDR    R0,     R3                      ; D3E3   00C3
        TSTR    R2                              ; D3E4   0092
        ADDR    R1,     R2                      ; D3E5   00CA
        TSTR    R2                              ; D3E6   0092
        ADDR    R2,     R1                      ; D3E7   00D1
        TSTR    R2                              ; D3E8   0092
        ADDR    R3,     R0                      ; D3E9   00D8
        TSTR    R2                              ; D3EA   0092
        ADDR    R3,     R7                      ; D3EB   00DF

        TSTR    R2                              ; D3EC   0092
        ADDR    R4,     R6                      ; D3ED   00E6
        TSTR    R2                              ; D3EE   0092
        ADDR    R5,     R5                      ; D3EF   00ED
        TSTR    R2                              ; D3F0   0092
        ADDR    R6,     R4                      ; D3F1   00F4
        TSTR    R2                              ; D3F2   0092
        ADDR    R7,     R3                      ; D3F3   00FB
        TSTR    R2                              ; D3F4   0092
        EIS                                     ; D3F5   0002
        MOVR    R2,     R3                      ; D3F6   0093
        INCR    R3                              ; D3F7   000B
        MOVR    R2,     R3                      ; D3F8   0093
        DECR    R4                              ; D3F9   0014
        MOVR    R2,     R3                      ; D3FA   0093
        COMR    R5                              ; D3FB   001D
        MOVR    R2,     R3                      ; D3FC   0093
        NEGR    R6                              ; D3FD   0026
        MOVR    R2,     R3                      ; D3FE   0093
        NEGR    R6                              ; D3FF   0026
        MOVR    R2,     R3                      ; D400   0093
        ADCR    R2                              ; D401   002A
        MOVR    R2,     R3                      ; D402   0093
        GSWD    R3                              ; D403   0033
        MOVR    R2,     R3                      ; D404   0093
        RSWD    R3                              ; D405   003B
        MOVR    R2,     R3                      ; D406   0093
        SWAP    R3,     1                       ; D407   0043
        MOVR    R2,     R3                      ; D408   0093
        SLL     R3,     1                       ; D409   004B
        MOVR    R2,     R3                      ; D40A   0093
        RLC     R3,     1                       ; D40B   0053
        MOVR    R2,     R3                      ; D40C   0093
        SLLC    R3,     1                       ; D40D   005B
        MOVR    R2,     R3                      ; D40E   0093
        SLR     R3,     1                       ; D40F   0063
        MOVR    R2,     R3                      ; D410   0093
        SAR     R3,     1                       ; D411   006B
        MOVR    R2,     R3                      ; D412   0093
        RRC     R3,     1                       ; D413   0073
        MOVR    R2,     R3                      ; D414   0093
        SARC    R2,     1                       ; D415   007A
        MOVR    R2,     R3                      ; D416   0093
        MOVR    R0,     R1                      ; D417   0081
        MOVR    R2,     R3                      ; D418   0093
        MOVR    R1,     R0                      ; D419   0088
        MOVR    R2,     R3                      ; D41A   0093
        MOVR    R1,     R7                      ; D41B   008F

        MOVR    R2,     R3                      ; D41C   0093
        MOVR    R2,     R3                      ; D41D   0093
        MOVR    R2,     R3                      ; D41E   0093
        SDBD                                    ; D41F   0001
        MVI@    R5,     R4                      ; D420   02AC
        PSHR    R5                              ; D421   0275
        MVII    #$0200, R5                      ; D422   02BD 0200
        MVII    #$00F0, R3                      ; D424   02BB 00F0
L_D426:
        SDBD                                    ; D426   0001
        MVI@    R4,     R0                      ; D427   02A0
        MVO@    R0,     R5                      ; D428   0268
        DECR    R3                              ; D429   0013
        BNEQ    L_D426                          ; D42A   022C 0005
        PULR    R7                              ; D42C   02B7

        PSHR    R5                              ; D42D   0275

        JSR     R5,     L_5618                  ; D42E   0004 0154 0218
        DECLE   $000D                           ; D431   000D

        JSR     R5,     L_565E                  ; D432   0004 0154 025E
        DECLE   $001E,  $02BA,  $0004,  $0004   ; D435   001E 02BA 0004 0004
        DECLE   $01A8,  $00A8,  $0004,  $01A8   ; D439   01A8 00A8 0004 01A8
        DECLE   $00D5,  $0004                   ; D43D   00D5 0004

        MVII    #$0283, R5                      ; D43F   02BD 0283
        MOVR    R7,     R4                      ; D441   00BC
        ADDI    #$01E5, R4                      ; D442   02FC 01E5
        MVII    #$0006, R3                      ; D444   02BB 0006
L_D446:
        MVII    #$0009, R2                      ; D446   02BA 0009
L_D448:
        SDBD                                    ; D448   0001
        MVI@    R4,     R0                      ; D449   02A0
        MVO@    R0,     R5                      ; D44A   0268
        DECR    R2                              ; D44B   0012
        BNEQ    L_D448                          ; D44C   022C 0005

        ADDI    #$000B, R5                      ; D44E   02FD 000B
        DECR    R3                              ; D450   0013
        BNEQ    L_D446                          ; D451   022C 000C

        MVII    #$0008, R0                      ; D453   02B8 0008
        MOVR    R7,     R1                      ; D455   00B9
        ADDI    #$0119, R1                      ; D456   02F9 0119
        MVII    #$031D, R2                      ; D458   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; D45A   0004 0114 02B4

        CLRR    R0                              ; D45D   01C0
        MVO     R0,     G_01EA                  ; D45E   0240 01EA
        MVO     R0,     G_0164                  ; D460   0240 0164
        MVO     R0,     G_0166                  ; D462   0240 0166
        MVII    #$0003, R0                      ; D464   02B8 0003
        MVO     R0,     G_0165                  ; D466   0240 0165
        PULR    R7                              ; D468   02B7

        DECLE   $0275,  $0280,  $015D,  $0378   ; D469   0275 0280 015D 0378
        DECLE   $000D,  $020C,  $0048,  $0004   ; D46D   000D 020C 0048 0004

        ANDR    R4,     R4                      ; D471   01A4
        PULR    R6                              ; D472   02B6
        MVI     G_01EA, R0                      ; D473   0280 01EA
        DECR    R0                              ; D475   0010
L_D476:
        BPL     L_D490                          ; D476   0203 0018

        MVI     G_035E, R0                      ; D478   0280 035E
        ANDI    #$0002, R0                      ; D47A   03B8 0002
        ADDR    R7,     R0                      ; D47C   00F8
        ADDI    #$00EE, R0                      ; D47D   02F8 00EE
        MOVR    R0,     R5                      ; D47F   0085
        MVII    #$01EB, R4                      ; D480   02BC 01EB
        CLRR    R1                              ; D482   01C9
        MVO@    R1,     R4                      ; D483   0261
        MVI@    R5,     R0                      ; D484   02A8
        MVO@    R0,     R4                      ; D485   0260
        MVO@    R1,     R4                      ; D486   0261
        MVI@    R5,     R0                      ; D487   02A8
        MVO@    R0,     R4                      ; D488   0260
        MVII    #$001E, R0                      ; D489   02B8 001E

        JSR     R5,     X_RAND2                 ; D48B   0004 0114 029E

        ADDI    #$001E, R0                      ; D48E   02F8 001E
L_D490:
        MVO     R0,     G_01EA                  ; D490   0240 01EA
        DECLE   $02B9,  $01EB,  $02BA,  $0322   ; D492   02B9 01EB 02BA 0322
        DECLE   $02BB,  $032A,  $0004,  $0194   ; D496   02BB 032A 0004 0194
        DECLE   $010E,  $02B9,  $01ED,  $02BA   ; D49A   010E 02B9 01ED 02BA
        DECLE   $033A,  $0093,  $0004           ; D49E   033A 0093 0004

        ANDR    R2,     R4                      ; D4A1   0194
        SUBR    R1,     R6                      ; D4A2   010E
        MVI     G_017B, R5                      ; D4A3   0285 017B
        CMPI    #$0004, R5                      ; D4A5   037D 0004
        BEQ     L_D4F3                          ; D4A7   0204 004A

        MVI     G_0164, R0                      ; D4A9   0280 0164
        TSTR    R0                              ; D4AB   0080
        BEQ     L_D4B8                          ; D4AC   0204 000A

        CMPI    #$0003, R0                      ; D4AE   0378 0003
        BEQ     L_D4B9                          ; D4B0   0204 0007

        MVI     G_01C6, R5                      ; D4B2   0285 01C6
        ANDI    #$000C, R5                      ; D4B4   03BD 000C
        BNEQ    L_D4B9                          ; D4B6   020C 0001
L_D4B8:
        PULR    R7                              ; D4B8   02B7

L_D4B9:
        CLRR    R0                              ; D4B9   01C0
        DECLE   $0240,  $0164,  $0004,  $01A8   ; D4BA   0240 0164 0004 01A8
        DECLE   $008B,  $0004,  $01A8,  $00D5   ; D4BE   008B 0004 01A8 00D5
        DECLE   $0001                           ; D4C2   0001

        JSR     R5,     L_505A                  ; D4C3   0004 0150 005A
        JSR     R5,     L_565E                  ; D4C6   0004 0154 025E
        DECLE   $0000                           ; D4C9   0000

        JSR     R5,     L_5618                  ; D4CA   0004 0154 0218
        DECLE   $0000                           ; D4CD   0000

        MVI     G_017C, R0                      ; D4CE   0280 017C

        JSR     R5,     L_5634                  ; D4D0   0004 0154 0234

        BNC     L_D4D7                          ; D4D3   0209 0002

        ADDI    #$0006, R0                      ; D4D5   02F8 0006
L_D4D7:
        MVO     R0,     G_0181                  ; D4D7   0240 0181

        JSR     R5,     L_5179                  ; D4D9   0004 0150 0179

        MVI     G_017E, R0                      ; D4DC   0280 017E
        ANDI    #$0002, R0                      ; D4DE   03B8 0002
        BNEQ    L_D4E6                          ; D4E0   020C 0004

        JSR     R5,     L_5102                  ; D4E2   0004 0150 0102

        PULR    R7                              ; D4E5   02B7

L_D4E6:
        MVI     G_017B, R0                      ; D4E6   0280 017B
        SARC    R0,     1                       ; D4E8   0078
        BC      L_D4EF                          ; D4E9   0201 0004

        JSR     R5,     L_50CD                  ; D4EB   0004 0150 00CD

        PULR    R7                              ; D4EE   02B7

L_D4EF:
        JSR     R5,     L_50ED                  ; D4EF   0004 0150 00ED

        PULR    R7                              ; D4F2   02B7

L_D4F3:
        MVI     .PSG0.rgt_hand,R0               ; D4F3   0280 01FE
        AND     .PSG0.lft_hand,R0               ; D4F5   0380 01FF
        CMPI    #$005F, R0                      ; D4F7   0378 005F
        BEQ     L_D503                          ; D4F9   0204 0008

        CMPI    #$003F, R0                      ; D4FB   0378 003F
        BEQ     L_D503                          ; D4FD   0204 0004

        CMPI    #$009F, R0                      ; D4FF   0378 009F
        BNEQ    L_D4B8                          ; D501   022C 004A

L_D503:
        MVI     .PSG0.rgt_hand,R0               ; D503   0280 01FE
        AND     .PSG0.lft_hand,R0               ; D505   0380 01FF
        CMPI    #$00FF, R0                      ; D507   0378 00FF
        BNEQ    L_D503                          ; D509   022C 0007
        J       X_RESET                         ; D50B   0004 0310 0000

        PSHR    R5                              ; D50E   0275
        MVI@    R1,     R0                      ; D50F   0288
        DECR    R0                              ; D510   0010
        BPL     L_D53C                          ; D511   0203 0029

        INCR    R1                              ; D513   0009
L_D514:
        MVI@    R1,     R4                      ; D514   028C
        ADDR    R7,     R4                      ; D515   00FC
        ADDI    #$0028, R4                      ; D516   02FC 0028
        MVI@    R4,     R0                      ; D518   02A0
        MOVR    R0,     R5                      ; D519   0085
        SLR     R0,     2                       ; D51A   0064
        ANDI    #$001F, R5                      ; D51B   03BD 001F
        SLR     R0,     2                       ; D51D   0064
        SLR     R0,     1                       ; D51E   0060
        PSHR    R5                              ; D51F   0275

        JSR     R5,     X_RAND2                 ; D520   0004 0114 029E

        ADD@    R6,     R0                      ; D523   02F0
        PSHR    R0                              ; D524   0270
        MVI@    R4,     R0                      ; D525   02A0

        JSR     R5,     X_RAND2                 ; D526   0004 0114 029E

        ADDR    R0,     R4                      ; D529   00C4
        MVI@    R4,     R0                      ; D52A   02A0
        MOVR    R0,     R5                      ; D52B   0085
        ANDI    #$0007, R5                      ; D52C   03BD 0007
        CMPI    #$0007, R5                      ; D52E   037D 0007
        BNEQ    L_D538                          ; D530   020C 0006

        SLR     R0,     2                       ; D532   0064
        NOP                                     ; D533   0034
        SLR     R0,     1                       ; D534   0060
        MVO@    R0,     R1                      ; D535   0248
        B       L_D514                          ; D536   0220 0023

L_D538:
        MVO@    R5,     R2                      ; D538   0255
        MVO@    R5,     R3                      ; D539   025D
        DECR    R1                              ; D53A   0011
        PULR    R0                              ; D53B   02B0
L_D53C:
        MVO@    R0,     R1                      ; D53C   0248
        PULR    R7                              ; D53D   02B7

        DECLE   $015E,  $0008,  $0004,  $0004   ; D53E   015E 0008 0004 0004
        DECLE   $0004,  $0000,  $0000,  $0000   ; D542   0004 0000 0000 0000
        DECLE   $0003,  $0050,  $0044,  $0004   ; D546   0003 0050 0044 0004
        DECLE   $0003,  $0002,  $0000,  $0000   ; D54A   0003 0002 0000 0000
        DECLE   $0084,  $0006,  $0000,  $0001   ; D54E   0084 0006 0000 0001
        DECLE   $0000,  $0001,  $0002,  $0004   ; D552   0000 0001 0002 0004
        DECLE   $01DE,  $0003,  $0001,  $0001   ; D556   01DE 0003 0001 0001
        DECLE   $00E8,  $0041,  $0004,  $0003   ; D55A   00E8 0041 0004 0003
        DECLE   $0000,  $00C0,  $00C0,  $0082   ; D55E   0000 00C0 00C0 0082
        DECLE   $0008,  $0000,  $0000,  $0001   ; D562   0008 0000 0000 0001
        DECLE   $0001,  $0001,  $0003,  $0003   ; D566   0001 0001 0003 0003
        DECLE   $0002,  $0010,  $0018,  $0000   ; D56A   0002 0010 0018 0000

        NEGR    R3                              ; D56E   0023
        SWAP    R0,     1                       ; D56F   0040
        DECR    R0                              ; D570   0010
        ADDR    R5,     R7                      ; D571   00EF

        DECLE   $0095,  $0000,  $007D,  $0000   ; D572   0095 0000 007D 0000
        DECLE   $003F,  $0000,  $0000,  $0000   ; D576   003F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D57A   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $00F6   ; D57E   0000 0040 0010 00F6
        DECLE   $0095,  $0000,  $0075,  $0000   ; D582   0095 0000 0075 0000
        DECLE   $003F,  $0000,  $0000,  $0000   ; D586   003F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D58A   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $00FD   ; D58E   0000 0040 0010 00FD
        DECLE   $0095,  $0000,  $008C,  $0000   ; D592   0095 0000 008C 0000
        DECLE   $004C,  $0000,  $0000,  $00C0   ; D596   004C 0000 0000 00C0
        DECLE   $0000,  $0000,  $0000,  $0001   ; D59A   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $0004   ; D59E   0000 0040 0010 0004
        DECLE   $0096,  $0000,  $0098,  $0000   ; D5A2   0096 0000 0098 0000
        DECLE   $0043,  $0000,  $0000,  $00C0   ; D5A6   0043 0000 0000 00C0
        DECLE   $0000,  $0000,  $0000,  $0001   ; D5AA   0000 0000 0000 0001
        DECLE   $0000,  $0052,  $0010,  $000B   ; D5AE   0000 0052 0010 000B
        DECLE   $0096,  $0000,  $007E,  $0000   ; D5B2   0096 0000 007E 0000
        DECLE   $0058,  $0000,  $0000,  $0060   ; D5B6   0058 0000 0000 0060
        DECLE   $0001,  $0000,  $0000,  $0001   ; D5BA   0001 0000 0000 0001
        DECLE   $0000,  $00C3,  $0030,  $0012   ; D5BE   0000 00C3 0030 0012
        DECLE   $0096,  $0000,  $0091,  $0000   ; D5C2   0096 0000 0091 0000
        DECLE   $003B,  $0000,  $0000,  $0000   ; D5C6   003B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D5CA   0000 0000 0000 0001
        DECLE   $0000,  $0053,  $0030,  $0019   ; D5CE   0000 0053 0030 0019
        DECLE   $0096,  $0000,  $0071,  $0000   ; D5D2   0096 0000 0071 0000
        DECLE   $0038,  $0000,  $0000,  $0000   ; D5D6   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D5DA   0000 0000 0000 0001
        DECLE   $0000,  $0043,  $0030,  $0020   ; D5DE   0000 0043 0030 0020
        DECLE   $0096,  $0000,  $0072,  $0000   ; D5E2   0096 0000 0072 0000
        DECLE   $0042,  $0000,  $0000,  $0000   ; D5E6   0042 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D5EA   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5EE   0000 0000 0000 0000
        DECLE   $0000,  $0005,  $0023,  $0000   ; D5F2   0000 0005 0023 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5F6   0000 0000 0000 0000
        DECLE   $0005,  $002D,  $0000,  $0000   ; D5FA   0005 002D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D5FE   0000 0000 0000 0001
        DECLE   $0037,  $0000,  $0000,  $0000   ; D602   0037 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0039   ; D606   0000 0000 0004 0039
        DECLE   $0000,  $0000,  $0000,  $0000   ; D60A   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0041,  $0000   ; D60E   0000 0001 0041 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D612   0000 0000 0000 0000
        DECLE   $0001,  $0043,  $0000,  $0000   ; D616   0001 0043 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D61A   0000 0000 0000 0001
        DECLE   $0045,  $0000,  $0000,  $0000   ; D61E   0045 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0047   ; D622   0000 0000 0001 0047
        DECLE   $0000,  $005E,  $0008,  $005E   ; D626   0000 005E 0008 005E
        DECLE   $0008,  $0018,  $000E,  $0043   ; D62A   0008 0018 000E 0043
        DECLE   $0008,  $0030,  $000E,  $005E   ; D62E   0008 0030 000E 005E
        DECLE   $0008,  $00F8,  $001E,  $0038   ; D632   0008 00F8 001E 0038
        DECLE   $001E,  $0000,  $001F           ; D636   001E 0000 001F

        SLLC    R2,     2                       ; D639   005E
        INCR    R0                              ; D63A   0008
        SLLC    R2,     2                       ; D63B   005E
        INCR    R0                              ; D63C   0008
        RRC     R3,     1                       ; D63D   0073
        INCR    R0                              ; D63E   0008
        SLLC    R0,     1                       ; D63F   0058
        INCR    R6                              ; D640   000E
        ADCR    R3                              ; D641   002B
        INCR    R0                              ; D642   0008
        SLLC    R2,     2                       ; D643   005E
        INCR    R0                              ; D644   0008
        NEGR    R0                              ; D645   0020
        COMR    R6                              ; D646   001E
        SAR     R3,     1                       ; D647   006B
        INCR    R0                              ; D648   0008
        ADDR    R5,     R3                      ; D649   00EB
        INCR    R0                              ; D64A   0008
        SLLC    R2,     2                       ; D64B   005E
        INCR    R0                              ; D64C   0008
        SLL     R0,     1                       ; D64D   0048
        INCR    R2                              ; D64E   000A
        SLR     R3,     2                       ; D64F   0067
        INCR    R2                              ; D650   000A
        RLC     R2,     1                       ; D651   0052
        ADCR    R6                              ; D652   002E
        MOVR    R2,     R0                      ; D653   0090
        INCR    R2                              ; D654   000A
        ADDR    R3,     R0                      ; D655   00D8
        COMR    R0                              ; D656   0018
        SLR     R3,     2                       ; D657   0067
        COMR    R0                              ; D658   0018
        RLC     R1,     1                       ; D659   0051
        ADCR    R6                              ; D65A   002E
        SLLC    R0,     1                       ; D65B   0058
        COMR    R0                              ; D65C   0018
        SLLC    R2,     2                       ; D65D   005E
        INCR    R0                              ; D65E   0008
        SLLC    R1,     1                       ; D65F   0059
        INCR    R2                              ; D660   000A
        ADDR    R0,     R0                      ; D661   00C0
        INCR    R2                              ; D662   000A
        MOVR    R1,     R2                      ; D663   008A
        ADCR    R6                              ; D664   002E
        MOVR    R6,     R0                      ; D665   00B0
        INCR    R2                              ; D666   000A
        MOVR    R0,     R1                      ; D667   0081
        COMR    R0                              ; D668   0018
        SARC    R0,     1                       ; D669   0078
        COMR    R0                              ; D66A   0018
        ADDR    R6,     R1                      ; D66B   00F1
        ADCR    R6                              ; D66C   002E
        SLLC    R0,     1                       ; D66D   0058
        COMR    R0                              ; D66E   0018
        INCR    R0                              ; D66F   0008
        COMR    R6                              ; D670   001E
        RRC     R1,     1                       ; D671   0071
        COMR    R6                              ; D672   001E
        MOVR    R3,     R1                      ; D673   0099
        COMR    R6                              ; D674   001E
        MOVR    R5,     R3                      ; D675   00AB
        COMR    R6                              ; D676   001E
        ADDR    R4,     R3                      ; D677   00E3
        INCR    R2                              ; D678   000A
        MOVR    R7,     R1                      ; D679   00B9
        COMR    R6                              ; D67A   001E
        MOVR    R4,     R0                      ; D67B   00A0
        COMR    R6                              ; D67C   001E
        ADDR    R2,     R7                      ; D67D   00D7

        COMR    R6                              ; D67E   001E
        ADDR    R1,     R7                      ; D67F   00CF

        DECLE   $001E,  $0010,  $001E,  $0000   ; D680   001E 0010 001E 0000
        DECLE   $001E,  $0000,  $001E,  $0000   ; D684   001E 0000 001E 0000
        DECLE   $001E,  $0000,  $001E,  $0000   ; D688   001E 0000 001E 0000
        DECLE   $001E,  $0000,  $001E,  $0000   ; D68C   001E 0000 001E 0000
        DECLE   $001E,  $0000                   ; D690   001E 0000

        COMR    R6                              ; D692   001E
        PSHR    R5                              ; D693   0275

        JSR     R5,     L_5618                  ; D694   0004 0154 0218
        DECLE   $000E,  $02BA,  $0001,  $0004   ; D697   000E 02BA 0001 0004
        DECLE   $01A8,  $00A8,  $0004,  $01A8   ; D69B   01A8 00A8 0004 01A8
        DECLE   $006C,  $0001,  $02BB,  $00A0   ; D69F   006C 0001 02BB 00A0
        DECLE   $0001,  $0001,  $02BC,  $00D1   ; D6A3   0001 0001 02BC 00D1
        DECLE   $00A3,  $0001,  $02BD,  $0000   ; D6A7   00A3 0001 02BD 0000
        DECLE   $0038,  $02A0,  $0268,  $0013   ; D6AB   0038 02A0 0268 0013
        DECLE   $022C,  $0004,  $0004,  $0194   ; D6AF   022C 0004 0004 0194
        DECLE   $001F                           ; D6B3   001F

        ADDR    R0,     R7                      ; D6B4   00C7

        MOVR    R2,     R6                      ; D6B5   0096
        MVII    #$0005, R0                      ; D6B6   02B8 0005
        MOVR    R7,     R1                      ; D6B8   00B9
        ADDI    #$01EE, R1                      ; D6B9   02F9 01EE
        MVII    #$031D, R2                      ; D6BB   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; D6BD   0004 0114 02B4

        SDBD                                    ; D6C0   0001
        MVII    #$AD0F, R0                      ; D6C1   02B8 000F 00AD
        MVO     R0,     G_034C                  ; D6C4   0240 034C
        PULR    R7                              ; D6C6   02B7

        DECLE   $0006,  $000A,  $0006,  $000A   ; D6C7   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6CB   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6CF   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6D3   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6D7   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6DB   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6DF   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6E3   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6E7   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6EB   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D6EF   0006 000A 0006 000A
        DECLE   $0006,  $000A,  $00C9,  $0018   ; D6F3   0006 000A 00C9 0018
        DECLE   $00C9,  $0018,  $00C9,  $0018   ; D6F7   00C9 0018 00C9 0018
        DECLE   $00C1,  $0018,  $00C1,  $0018   ; D6FB   00C1 0018 00C1 0018
        DECLE   $00C1,  $0018,  $00C1,  $0018   ; D6FF   00C1 0018 00C1 0018
        DECLE   $00C1,  $0018,  $00C1,  $0018   ; D703   00C1 0018 00C1 0018
        DECLE   $00C1,  $0018,  $00C1,  $0018   ; D707   00C1 0018 00C1 0018
        DECLE   $00C9,  $0018,  $00C9,  $0018   ; D70B   00C9 0018 00C9 0018
        DECLE   $00C9,  $0018,  $0006,  $000A   ; D70F   00C9 0018 0006 000A
        DECLE   $0006,  $000A,  $0006,  $000A   ; D713   0006 000A 0006 000A
        DECLE   $0031,  $0018,  $0029,  $0018   ; D717   0031 0018 0029 0018
        DECLE   $0029,  $0018,  $0021,  $0018   ; D71B   0029 0018 0021 0018
        DECLE   $0021,  $0018,  $0021,  $0018   ; D71F   0021 0018 0021 0018
        DECLE   $0009,  $0018,  $0009,  $0018   ; D723   0009 0018 0009 0018
        DECLE   $0009,  $0018,  $0009,  $0018   ; D727   0009 0018 0009 0018
        DECLE   $0009,  $0018,  $0009,  $0018   ; D72B   0009 0018 0009 0018
        DECLE   $0009,  $0018,  $0009,  $0018   ; D72F   0009 0018 0009 0018
        DECLE   $0021,  $0018,  $0021,  $0018   ; D733   0021 0018 0021 0018
        DECLE   $0021,  $0018,  $0029,  $0018   ; D737   0021 0018 0029 0018
        DECLE   $0029,  $0018,  $0031,  $0018   ; D73B   0029 0018 0031 0018
        DECLE   $0049,  $0018,  $0041,  $0018   ; D73F   0049 0018 0041 0018
        DECLE   $0041,  $0018,  $0039,  $0018   ; D743   0041 0018 0039 0018
        DECLE   $0009,  $0019,  $0039,  $0018   ; D747   0009 0019 0039 0018
        DECLE   $00E9,  $0018,  $0019,  $0018   ; D74B   00E9 0018 0019 0018
        DECLE   $00E9,  $0018,  $0019,  $0018   ; D74F   00E9 0018 0019 0018
        DECLE   $0019,  $0018,  $00F1,  $0018   ; D753   0019 0018 00F1 0018
        DECLE   $0019,  $0018,  $00F1,  $0018   ; D757   0019 0018 00F1 0018
        DECLE   $0039,  $0018,  $0001,  $0019   ; D75B   0039 0018 0001 0019
        DECLE   $0039,  $0018,  $00F9,  $0018   ; D75F   0039 0018 00F9 0018
        DECLE   $00F9,  $0018,  $0049,  $0018   ; D763   00F9 0018 0049 0018
        DECLE   $00D9,  $0018,  $0059,  $0018   ; D767   00D9 0018 0059 0018
        DECLE   $0059,  $0018,  $00B9,  $0018   ; D76B   0059 0018 00B9 0018
        DECLE   $0051,  $0018,  $00E9,  $0018   ; D76F   0051 0018 00E9 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D773   0000 0000 0000 0000
        DECLE   $0010,  $000D,  $0018,  $000D   ; D777   0010 000D 0018 000D
        DECLE   $0020,  $000D,  $0028,  $000D   ; D77B   0020 000D 0028 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; D77F   0000 0000 0000 0000
        DECLE   $00F1,  $0018,  $0051,  $0018   ; D783   00F1 0018 0051 0018
        DECLE   $00E1,  $0018,  $00D1,  $0018   ; D787   00E1 0018 00D1 0018
        DECLE   $00D1,  $0018,  $0061,  $0018   ; D78B   00D1 0018 0061 0018
        DECLE   $00D9,  $0018,  $0059,  $0018   ; D78F   00D9 0018 0059 0018
        DECLE   $0059,  $0018,  $0051,  $0018   ; D793   0059 0018 0051 0018
        DECLE   $00B9,  $0018,  $00B9,  $0018   ; D797   00B9 0018 00B9 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D79B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D79F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7A7   0000 0000 0000 0000
        DECLE   $00E1,  $0018,  $00E1,  $0018   ; D7AB   00E1 0018 00E1 0018
        DECLE   $0051,  $0018,  $00D1,  $0018   ; D7AF   0051 0018 00D1 0018
        DECLE   $00D1,  $0018,  $0061,  $0018   ; D7B3   00D1 0018 0061 0018
        DECLE   $00D9,  $0018,  $0059,  $0018   ; D7B7   00D9 0018 0059 0018
        DECLE   $0059,  $0018,  $00B9,  $0018   ; D7BB   0059 0018 00B9 0018
        DECLE   $0051,  $0018,  $0051,  $0018   ; D7BF   0051 0018 0051 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7CF   0000 0000 0000 0000

        RLC     R1,     1                       ; D7D3   0051
        COMR    R0                              ; D7D4   0018
        RLC     R1,     1                       ; D7D5   0051
        COMR    R0                              ; D7D6   0018
        ADDR    R4,     R1                      ; D7D7   00E1
        COMR    R0                              ; D7D8   0018
        ADDR    R2,     R1                      ; D7D9   00D1
        COMR    R0                              ; D7DA   0018
        ADDR    R2,     R1                      ; D7DB   00D1
        COMR    R0                              ; D7DC   0018
        SLR     R1,     1                       ; D7DD   0061
        COMR    R0                              ; D7DE   0018
        ADDR    R3,     R1                      ; D7DF   00D9
        COMR    R0                              ; D7E0   0018
        SLLC    R1,     1                       ; D7E1   0059
        COMR    R0                              ; D7E2   0018
        SLLC    R1,     1                       ; D7E3   0059
        COMR    R0                              ; D7E4   0018
        MOVR    R7,     R1                      ; D7E5   00B9
        COMR    R0                              ; D7E6   0018
L_D7E7:
        MOVR    R4,     R0                      ; D7E7   00A0
        COMR    R0                              ; D7E8   0018
        RRC     R0,     1                       ; D7E9   0070
        COMR    R0                              ; D7EA   0018
        MOVR    R5,     R1                      ; D7EB   00A9
        COMR    R0                              ; D7EC   0018
        COMR    R1                              ; D7ED   0019
        COMR    R0                              ; D7EE   0018
        ADDR    R5,     R1                      ; D7EF   00E9
        COMR    R0                              ; D7F0   0018
        COMR    R1                              ; D7F1   0019
        COMR    R0                              ; D7F2   0018
        COMR    R1                              ; D7F3   0019
        COMR    R0                              ; D7F4   0018
        ADDR    R6,     R1                      ; D7F5   00F1
        COMR    R0                              ; D7F6   0018
L_D7F7:
        COMR    R1                              ; D7F7   0019
        COMR    R0                              ; D7F8   0018
        MOVR    R0,     R1                      ; D7F9   0081
        COMR    R0                              ; D7FA   0018
        RRC     R0,     1                       ; D7FB   0070
        COMR    R0                              ; D7FC   0018
        SARC    R0,     1                       ; D7FD   0078
        COMR    R0                              ; D7FE   0018
        ADDR    R4,     R1                      ; D7FF   00E1
        COMR    R0                              ; D800   0018
        ADDR    R2,     R1                      ; D801   00D1
        COMR    R0                              ; D802   0018
        ADDR    R2,     R1                      ; D803   00D1
        COMR    R0                              ; D804   0018
        SLR     R1,     1                       ; D805   0061
        COMR    R0                              ; D806   0018
L_D807:
        MOVR    R3,     R4                      ; D807   009C
        COMR    R0                              ; D808   0018
        MOVR    R2,     R4                      ; D809   0094
        COMR    R0                              ; D80A   0018
        MOVR    R2,     R4                      ; D80B   0094
        COMR    R0                              ; D80C   0018
        DECR    R4                              ; D80D   0014
        COMR    R0                              ; D80E   0018
        DECR    R4                              ; D80F   0014
        COMR    R0                              ; D810   0018
        CLRC                                    ; D811   0006
        ADCR    R0                              ; D812   0028
        MOVR    R6,     R4                      ; D813   00B4
        COMR    R0                              ; D814   0018
        MOVR    R1,     R4                      ; D815   008C
        COMR    R0                              ; D816   0018
L_D817:
        MOVR    R1,     R4                      ; D817   008C
        COMR    R0                              ; D818   0018
        MOVR    R1,     R4                      ; D819   008C
        COMR    R0                              ; D81A   0018
        MOVR    R1,     R4                      ; D81B   008C
        COMR    R0                              ; D81C   0018
        MOVR    R1,     R4                      ; D81D   008C
        COMR    R0                              ; D81E   0018
        MOVR    R1,     R4                      ; D81F   008C
        COMR    R0                              ; D820   0018
        SAR     R0,     2                       ; D821   006C
        COMR    R0                              ; D822   0018
        CLRC                                    ; D823   0006
        ADCR    R0                              ; D824   0028
        DECR    R4                              ; D825   0014
        COMR    R0                              ; D826   0018
        DECR    R4                              ; D827   0014
        COMR    R0                              ; D828   0018
        MOVR    R2,     R4                      ; D829   0094
        COMR    R0                              ; D82A   0018
        MOVR    R2,     R4                      ; D82B   0094
L_D82C:
        COMR    R0                              ; D82C   0018
        MOVR    R3,     R4                      ; D82D   009C
        COMR    R0                              ; D82E   0018
        CLRC                                    ; D82F   0006
        ADCR    R0                              ; D830   0028
        ADDR    R1,     R4                      ; D831   00CC
        ADCR    R2                              ; D832   002A
        ADDR    R0,     R4                      ; D833   00C4
        ADCR    R2                              ; D834   002A
        ADDR    R0,     R4                      ; D835   00C4
        ADCR    R2                              ; D836   002A
L_D837:
        SWAP    R0,     2                       ; D837   0044
        ADCR    R3                              ; D838   002B
        SWAP    R0,     2                       ; D839   0044
        ADCR    R3                              ; D83A   002B
        SWAP    R0,     2                       ; D83B   0044
        ADCR    R3                              ; D83C   002B
        SLL     R0,     2                       ; D83D   004C
        ADCR    R3                              ; D83E   002B
        SLL     R0,     2                       ; D83F   004C
        ADCR    R3                              ; D840   002B
        SLL     R0,     2                       ; D841   004C
        ADCR    R3                              ; D842   002B
        SLL     R0,     2                       ; D843   004C
        ADCR    R3                              ; D844   002B
        SLL     R0,     2                       ; D845   004C
        ADCR    R3                              ; D846   002B
        SLL     R0,     2                       ; D847   004C
        ADCR    R3                              ; D848   002B
        SWAP    R0,     2                       ; D849   0044
        ADCR    R3                              ; D84A   002B
L_D84B:
        SWAP    R0,     2                       ; D84B   0044
        ADCR    R3                              ; D84C   002B
        SWAP    R0,     2                       ; D84D   0044
        ADCR    R3                              ; D84E   002B
        ADDR    R0,     R4                      ; D84F   00C4
        ADCR    R2                              ; D850   002A
        ADDR    R0,     R4                      ; D851   00C4
        ADCR    R2                              ; D852   002A
        ADDR    R1,     R4                      ; D853   00CC
        ADCR    R2                              ; D854   002A
        CLRC                                    ; D855   0006
        ADCR    R0                              ; D856   0028
        SAR     R0,     2                       ; D857   006C
        ADCR    R3                              ; D858   002B
        SWAP    R0,     2                       ; D859   0044
        ADCR    R3                              ; D85A   002B
L_D85B:
        SWAP    R0,     2                       ; D85B   0044
        ADCR    R3                              ; D85C   002B
        SWAP    R0,     2                       ; D85D   0044
        ADCR    R3                              ; D85E   002B
        SWAP    R0,     2                       ; D85F   0044
        ADCR    R3                              ; D860   002B
        SWAP    R0,     2                       ; D861   0044
        ADCR    R3                              ; D862   002B
        SWAP    R0,     2                       ; D863   0044
        ADCR    R3                              ; D864   002B
        SWAP    R0,     2                       ; D865   0044
        ADCR    R7                              ; D866   002F

        SWAP    R0,     2                       ; D867   0044
L_D868:
        ADCR    R7                              ; D868   002F

        SWAP    R0,     2                       ; D869   0044
L_D86A:
        ADCR    R7                              ; D86A   002F

        SWAP    R0,     2                       ; D86B   0044
L_D86C:
        ADCR    R7                              ; D86C   002F

        SWAP    R0,     2                       ; D86D   0044
L_D86E:
        ADCR    R7                              ; D86E   002F

        SWAP    R0,     2                       ; D86F   0044
L_D870:
        ADCR    R7                              ; D870   002F

        SWAP    R0,     2                       ; D871   0044
L_D872:
        ADCR    R3                              ; D872   002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D873   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D877   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0034,  $002B   ; D87B   0044 002B 0034 002B
        DECLE   $0074,  $002B,  $0044,  $002B   ; D87F   0074 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D883   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D887   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D88B   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D88F   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D893   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D897   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D89B   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $0044,  $002B   ; D89F   0044 002B 0044 002B
        DECLE   $0044,  $002B,  $003C,  $002B   ; D8A3   0044 002B 003C 002B
        DECLE   $0050,  $0010,  $00F7,  $0098   ; D8A7   0050 0010 00F7 0098
        DECLE   $0000,  $00B9,  $0000,  $0008   ; D8AB   0000 00B9 0000 0008
        DECLE   $0000,  $03FA,  $00F0,  $0000   ; D8AF   0000 03FA 00F0 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D8B3   0000 0000 0001 0000
        DECLE   $0050,  $0010,  $00FE,  $0098   ; D8B7   0050 0010 00FE 0098
        DECLE   $0000,  $00C1,  $0000,  $0008   ; D8BB   0000 00C1 0000 0008
        DECLE   $0000,  $03FA,  $00F0,  $0000   ; D8BF   0000 03FA 00F0 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D8C3   0000 0000 0001 0000
        DECLE   $0050,  $0010,  $0005,  $0099   ; D8C7   0050 0010 0005 0099
        DECLE   $0000,  $00C9,  $0000,  $0008   ; D8CB   0000 00C9 0000 0008
        DECLE   $0000,  $03FA,  $00F0,  $0000   ; D8CF   0000 03FA 00F0 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D8D3   0000 0000 0001 0000
        DECLE   $0047,  $0031,  $000C,  $0099   ; D8D7   0047 0031 000C 0099
        DECLE   $0000,  $003E,  $0000,  $004D   ; D8DB   0000 003E 0000 004D
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D8E3   0000 0000 0001 0000
        DECLE   $0047,  $0011,  $0013,  $0099   ; D8E7   0047 0011 0013 0099
        DECLE   $0000,  $0068,  $0000,  $004E   ; D8EB   0000 0068 0000 004E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D8F3   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8F7   0000 0000 0000 0000
        DECLE   $0008,  $0049,  $0000,  $0000   ; D8FB   0008 0049 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; D8FF   0000 0000 0000 0008
        DECLE   $0059,  $0000,  $0000,  $0000   ; D903   0059 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0069   ; D907   0000 0000 0008 0069
        DECLE   $0000,  $0000,  $0000,  $0000   ; D90B   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0079,  $0000   ; D90F   0000 0001 0079 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D913   0000 0000 0000 0000
        DECLE   $0001,  $007B,  $0000,  $0030   ; D917   0001 007B 0000 0030
        DECLE   $0010,  $003C,  $001E,  $001A   ; D91B   0010 003C 001E 001A
        DECLE   $00FA,  $0000,  $0018,  $0018   ; D91F   00FA 0000 0018 0018
        DECLE   $003C,  $0024,  $0066,  $0043   ; D923   003C 0024 0066 0043
        DECLE   $0041,  $00C0,  $0000,  $0060   ; D927   0041 00C0 0000 0060
        DECLE   $0020,  $0078,  $003C,  $003E   ; D92B   0020 0078 003C 003E
        DECLE   $007A,  $0002,  $0018,  $001C   ; D92F   007A 0002 0018 001C
        DECLE   $003C,  $0024,  $0027,  $0021   ; D933   003C 0024 0027 0021
        DECLE   $0021,  $0020,  $0060,  $0060   ; D937   0021 0020 0060 0060
        DECLE   $0020,  $0078,  $003C,  $003C   ; D93B   0020 0078 003C 003C
        DECLE   $003C,  $007C,  $0018,  $0018   ; D93F   003C 007C 0018 0018
        DECLE   $0018,  $0018,  $001E,  $0012   ; D943   0018 0018 001E 0012
        DECLE   $0012,  $0010,  $0030,  $0060   ; D947   0012 0010 0030 0060
        DECLE   $0020,  $0070,  $0030,  $0030   ; D94B   0020 0070 0030 0030
        DECLE   $0030,  $0030,  $0030,  $0030   ; D94F   0030 0030 0030 0030
        DECLE   $0030,  $0030,  $003C,  $0014   ; D953   0030 0030 003C 0014
        DECLE   $0014,  $0010,  $0030,  $0060   ; D957   0014 0010 0030 0060
        DECLE   $0020,  $0078,  $003C,  $003C   ; D95B   0020 0078 003C 003C
        DECLE   $003C,  $007C,  $0018,  $0038   ; D95F   003C 007C 0018 0038
        DECLE   $007C,  $0044,  $0074,  $0014   ; D963   007C 0044 0074 0014
        DECLE   $0004,  $0004,  $0008,  $0060   ; D967   0004 0004 0008 0060
        DECLE   $0020,  $0078,  $003C,  $003E   ; D96B   0020 0078 003C 003E
        DECLE   $007A,  $0002,  $0018,  $0038   ; D96F   007A 0002 0018 0038
        DECLE   $00FC,  $0084,  $00E4,  $0024   ; D973   00FC 0084 00E4 0024
        DECLE   $0022,  $0002,  $0002,  $0030   ; D977   0022 0002 0002 0030
        DECLE   $0010,  $003C,  $001E,  $001A   ; D97B   0010 003C 001E 001A
        DECLE   $00FA,  $0000,  $0018,  $0018   ; D97F   00FA 0000 0018 0018
        DECLE   $00FC,  $0084,  $0046,  $0042   ; D983   00FC 0084 0046 0042
        DECLE   $0003,  $0001,  $0001,  $0030   ; D987   0003 0001 0001 0030
        DECLE   $0010,  $003F,  $0019,  $00F9   ; D98B   0010 003F 0019 00F9
        DECLE   $0018,  $0000,  $0018,  $0018   ; D98F   0018 0000 0018 0018
        DECLE   $00FC,  $0084,  $0086,  $0082   ; D993   00FC 0084 0086 0082
        DECLE   $0003,  $0001,  $0000,  $0018   ; D997   0003 0001 0000 0018
        DECLE   $0008,  $001C,  $001E,  $001A   ; D99B   0008 001C 001E 001A
        DECLE   $002D,  $002D,  $0021,  $000D   ; D99F   002D 002D 0021 000D
        DECLE   $000C,  $0014,  $0014,  $0012   ; D9A3   000C 0014 0014 0012
        DECLE   $0012,  $0012,  $0036,  $0000   ; D9A7   0012 0012 0036 0000
        DECLE   $0000,  $00C0,  $0070,  $00F8   ; D9AB   0000 00C0 0070 00F8
        DECLE   $007C,  $003A,  $0026,  $0016   ; D9AF   007C 003A 0026 0016
        DECLE   $000E,  $0006,  $0006,  $0006   ; D9B3   000E 0006 0006 0006
        DECLE   $0002,  $0002,  $0006,  $0000   ; D9B7   0002 0002 0006 0000
        DECLE   $0000,  $0018,  $0018,  $0024   ; D9BB   0000 0018 0018 0024
        DECLE   $005A,  $005A,  $003C,  $0024   ; D9BF   005A 005A 003C 0024
        DECLE   $0018,  $0018,  $0018,  $0018   ; D9C3   0018 0018 0018 0018
        DECLE   $0018,  $0000,  $003C,  $0000   ; D9C7   0018 0000 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D9CF   0000 0000 0000

        ADDR    R0,     R1                      ; D9D2   00C1
        MOVR    R0,     R5                      ; D9D3   0085
        ADDR    R0,     R7                      ; D9D4   00C7

        DECLE   $00EE,  $00EA,  $00BB,  $0099   ; D9D5   00EE 00EA 00BB 0099
        DECLE   $00F9,  $0000,  $0000,  $0000   ; D9D9   00F9 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DD   0000 0000 0000 0000
        DECLE   $0000,  $00C3,  $0042,  $00F2   ; D9E1   0000 00C3 0042 00F2
        DECLE   $007B,  $003E,  $0026,  $0026   ; D9E5   007B 003E 0026 0026
        DECLE   $00E6,  $0000,  $0000,  $0000   ; D9E9   00E6 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; D9ED   0000 0000 0000 00C0
        DECLE   $0078,  $00FC,  $0076,  $006E   ; D9F1   0078 00FC 0076 006E
        DECLE   $004E,  $004A,  $004F,  $0045   ; D9F5   004E 004A 004F 0045
        DECLE   $0085,  $0000,  $0000,  $0000   ; D9F9   0085 0000 0000 0000
        DECLE   $0000,  $0060,  $0038,  $007C   ; D9FD   0000 0060 0038 007C
        DECLE   $001E,  $001A,  $0036           ; DA01   001E 001A 0036

        SAR     R0,     2                       ; DA04   006C
        INCR    R4                              ; DA05   000C
        INCR    R4                              ; DA06   000C
        INCR    R7                              ; DA07   000F

        INCR    R1                              ; DA08   0009
L_DA09:
        COMR    R1                              ; DA09   0019
        DECLE   $0000,  $0000,  $0060,  $0038   ; DA0A   0000 0000 0060 0038
        DECLE   $007C,  $001E,  $001E,  $00F2   ; DA0E   007C 001E 001E 00F2
        DECLE   $000C,  $000C,  $003C,  $0024   ; DA12   000C 000C 003C 0024
        DECLE   $0026,  $0063,  $0001,  $0001   ; DA16   0026 0063 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA1E   0000 0000 0000 0000

        ADDR    R0,     R1                      ; DA22   00C1
        MOVR    R0,     R5                      ; DA23   0085
        ADDR    R0,     R7                      ; DA24   00C7

        DECLE   $00EE,  $00EA,  $00BB,  $0099   ; DA25   00EE 00EA 00BB 0099
        DECLE   $00F9,  $0000,  $0000,  $0038   ; DA29   00F9 0000 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; DA31   0000 0000 0010 0038
        DECLE   $0040,  $0000,  $0030,  $0020   ; DA35   0040 0000 0030 0020
        DECLE   $0000,  $0000,  $0040,  $0080   ; DA39   0000 0000 0040 0080
        DECLE   $0000,  $00E0,  $0000,  $00C0   ; DA3D   0000 00E0 0000 00C0
        DECLE   $0000,  $0000,  $0010,  $0038   ; DA41   0000 0000 0010 0038
        DECLE   $0040,  $0000,  $0030,  $0020   ; DA45   0040 0000 0030 0020
        DECLE   $0000,  $0000,  $0040,  $0080   ; DA49   0000 0000 0040 0080
        DECLE   $0000,  $00E0,  $00C0,  $0000   ; DA4D   0000 00E0 00C0 0000
        DECLE   $00C0,  $0010,  $0038,  $0040   ; DA51   00C0 0010 0038 0040
        DECLE   $0000,  $0000,  $0030,  $0020   ; DA55   0000 0000 0030 0020
        DECLE   $0000,  $0000,  $0040,  $0080   ; DA59   0000 0000 0040 0080
        DECLE   $0000,  $00E0,  $00C0,  $0000   ; DA5D   0000 00E0 00C0 0000
        DECLE   $00C0,  $0010,  $0038,  $0040   ; DA61   00C0 0010 0038 0040
        DECLE   $0000,  $0000,  $0030,  $0020   ; DA65   0000 0000 0030 0020
        DECLE   $0000,  $0000,  $0040,  $0080   ; DA69   0000 0000 0040 0080
        DECLE   $0000,  $00E0,  $0000,  $00C0   ; DA6D   0000 00E0 0000 00C0
        DECLE   $0000,  $0000,  $0010,  $0038   ; DA71   0000 0000 0010 0038
        DECLE   $0040,  $0000,  $0030,  $0010   ; DA75   0040 0000 0030 0010
        DECLE   $0000,  $0000,  $0040,  $0080   ; DA79   0000 0000 0040 0080
        DECLE   $0000,  $00E0,  $0000,  $00C0   ; DA7D   0000 00E0 0000 00C0
        DECLE   $0000,  $0000,  $0018,  $003C   ; DA81   0000 0000 0018 003C
        DECLE   $0022,  $0000,  $000C,  $0006   ; DA85   0022 0000 000C 0006
        DECLE   $0000,  $0000,  $0001,  $0000   ; DA89   0000 0000 0001 0000
        DECLE   $000C,  $0003,  $0000,  $0000   ; DA8D   000C 0003 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; DA91   0000 0000 0018 003C
        DECLE   $0022,  $0000,  $000C,  $0006   ; DA95   0022 0000 000C 0006
        DECLE   $0000,  $0000,  $0001,  $0000   ; DA99   0000 0000 0001 0000
        DECLE   $000C,  $0003,  $0001,  $0000   ; DA9D   000C 0003 0001 0000
        DECLE   $0000,  $0018,  $003C,  $0022   ; DAA1   0000 0018 003C 0022
        DECLE   $0000,  $0000,  $000C,  $0006   ; DAA5   0000 0000 000C 0006
        DECLE   $0000,  $0000,  $0001,  $0000   ; DAA9   0000 0000 0001 0000
        DECLE   $0004,  $0003,  $0001,  $0000   ; DAAD   0004 0003 0001 0000
        DECLE   $0000,  $0018,  $003C,  $0022   ; DAB1   0000 0018 003C 0022
        DECLE   $0000,  $0000,  $000C,  $0006   ; DAB5   0000 0000 000C 0006
        DECLE   $0000,  $0000,  $0001,  $0000   ; DAB9   0000 0000 0001 0000
        DECLE   $000C,  $0003,  $0000,  $0000   ; DABD   000C 0003 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; DAC1   0000 0000 0018 003C
        DECLE   $0022,  $0000,  $000E,  $0002   ; DAC5   0022 0000 000E 0002
        DECLE   $0000,  $0000,  $0001,  $0000   ; DAC9   0000 0000 0001 0000
        DECLE   $000C,  $0003,  $0000,  $0000   ; DACD   000C 0003 0000 0000
        DECLE   $0000,  $0008,  $001C,  $004A   ; DAD1   0000 0008 001C 004A
        DECLE   $002A,  $00FB,  $004B,  $0022   ; DAD5   002A 00FB 004B 0022
        DECLE   $008C,  $00DE,  $005E,  $003F   ; DAD9   008C 00DE 005E 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; DADD   003F 003F 003F 003F

        COMR    R6                              ; DAE1   001E
        SAR     R3,     1                       ; DAE2   006B
        ADCR    R1                              ; DAE3   0029
        INCR    R4                              ; DAE4   000C
L_DAE5:
        DECR    R7                              ; DAE5   0017

        DECLE   $00E3,  $00D0,  $0008,  $0000   ; DAE6   00E3 00D0 0008 0000
        DECLE   $003C,  $0018,  $0000,  $0008   ; DAEA   003C 0018 0000 0008
        DECLE   $0000,  $0082,  $007C,  $0000   ; DAEE   0000 0082 007C 0000

        SAR     R3,     1                       ; DAF2   006B
        ADCR    R1                              ; DAF3   0029
        INCR    R4                              ; DAF4   000C
L_DAF5:
        DECR    R7                              ; DAF5   0017

        DECLE   $00E3,  $00D0,  $0008,  $0000   ; DAF6   00E3 00D0 0008 0000
        DECLE   $003C,  $0000,  $0008,  $0000   ; DAFA   003C 0000 0008 0000
        DECLE   $0000,  $0082,  $007C,  $0000   ; DAFE   0000 0082 007C 0000

        SAR     R3,     1                       ; DB02   006B
        SLL     R2,     1                       ; DB03   004A
        INCR    R4                              ; DB04   000C
L_DB05:
        DECR    R7                              ; DB05   0017

        DECLE   $00E3,  $00D0,  $0008,  $0000   ; DB06   00E3 00D0 0008 0000
        DECLE   $003C,  $003C,  $0018,  $0000   ; DB0A   003C 003C 0018 0000

        INCR    R0                              ; DB0E   0008
        TSTR    R0                              ; DB0F   0080
        SWAP    R2,     1                       ; DB10   0042
        RSWD    R4                              ; DB11   003C
        SAR     R3,     1                       ; DB12   006B
        SLL     R2,     1                       ; DB13   004A
        INCR    R4                              ; DB14   000C
L_DB15:
        DECR    R7                              ; DB15   0017

        DECLE   $00E3,  $00D0,  $0008,  $0000   ; DB16   00E3 00D0 0008 0000
        DECLE   $003C,  $0018,  $0000,  $0008   ; DB1A   003C 0018 0000 0008
        DECLE   $0000,  $0082,  $007C,  $0000   ; DB1E   0000 0082 007C 0000
        DECLE   $0002,  $0001                   ; DB22   0002 0001

        ADDR    R0,     R0                      ; DB24   00C0

        JSRD    R4,     L_50C0                  ; DB25   0004 0052 00C0
        DECLE   $0020,  $0058,  $00C0,  $0020   ; DB28   0020 0058 00C0 0020
        DECLE   $0058,  $00C0,  $0020,  $0058   ; DB2C   0058 00C0 0020 0058
        DECLE   $0000,  $0040,  $0000,  $0001   ; DB30   0000 0040 0000 0001
        DECLE   $000F,  $001F,  $001F,  $003F   ; DB34   000F 001F 001F 003F
        DECLE   $0000,  $00AA,  $00EE,  $00EE   ; DB38   0000 00AA 00EE 00EE
        DECLE   $007F,  $007F,  $007F,  $007F   ; DB3C   007F 007F 007F 007F
        DECLE   $003E,  $001E,  $003C,  $007E   ; DB40   003E 001E 003C 007E
        DECLE   $0067,  $0076,  $00F2,  $00F0   ; DB44   0067 0076 00F2 00F0
        DECLE   $00E0,  $00E0,  $00C0,  $00C0   ; DB48   00E0 00E0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0040   ; DB4C   00C0 00C0 00C0 0040
        DECLE   $0040,  $0040,  $00FF,  $00FF   ; DB50   0040 0040 00FF 00FF
        DECLE   $007F,  $007F,  $007F,  $007F   ; DB54   007F 007F 007F 007F
        DECLE   $007F,  $007E,  $007E,  $007E   ; DB58   007F 007E 007E 007E
        DECLE   $007E,  $007E,  $003E,  $001C   ; DB5C   007E 007E 003E 001C
        DECLE   $0000,  $0000                   ; DB60   0000 0000

        DIS                                     ; DB62   0003
        SUB@    R1,     R7                      ; DB63   030F
        SUBI    #$037F, R7                      ; DB64   033F 037F

        CMPI    #$00FB, R4                      ; DB66   037C 00FB
        XORI    #$03FB, R3                      ; DB68   03FB 03FB
        XORI    #$03FB, R3                      ; DB6A   03FB 03FB
        CMPI    #$003F, R4                      ; DB6C   037C 003F
        SUB@    R1,     R7                      ; DB6E   030F

        DECLE   $0303,  $0300,  $0000           ; DB6F   0303 0300 0000

        DIS                                     ; DB72   0003
        SUB@    R1,     R7                      ; DB73   030F
        SUBI    #$037F, R7                      ; DB74   033F 037F

        DECLE   $037F,  $03FF,  $03FF,  $03FF   ; DB76   037F 03FF 03FF 03FF
        DECLE   $03FF,  $03FF                   ; DB7A   03FF 03FF

        CMPI    #$033F, R7                      ; DB7C   037F 033F
        SUB@    R1,     R7                      ; DB7E   030F

        DECLE   $0303,  $0300,  $0000           ; DB7F   0303 0300 0000

        DIS                                     ; DB82   0003
        SUB@    R1,     R7                      ; DB83   030F
        SUBI    #$037F, R7                      ; DB84   033F 037F

        CMPI    #$00FB, R4                      ; DB86   037C 00FB
        XORI    #$03FB, R3                      ; DB88   03FB 03FB
        XORI    #$03FB, R3                      ; DB8A   03FB 03FB
        CMPI    #$003F, R4                      ; DB8C   037C 003F
        SUB@    R1,     R7                      ; DB8E   030F

        DECLE   $0303,  $0300,  $0000           ; DB8F   0303 0300 0000

        DIS                                     ; DB92   0003
        SUB@    R1,     R7                      ; DB93   030F
        SUBI    #$037F, R7                      ; DB94   033F 037F

        DECLE   $037F,  $03FF,  $03FF,  $03FF   ; DB96   037F 03FF 03FF 03FF
        DECLE   $03FF,  $03FF                   ; DB9A   03FF 03FF

        CMPI    #$033F, R7                      ; DB9C   037F 033F
        SUB@    R1,     R7                      ; DB9E   030F

        DECLE   $0303,  $0300,  $0000           ; DB9F   0303 0300 0000

        DIS                                     ; DBA2   0003
        SUB@    R1,     R7                      ; DBA3   030F
        SUBI    #$037A, R7                      ; DBA4   033F 037A

        DECLE   $0276,  $02E6,  $02F6,  $02F6   ; DBA6   0276 02E6 02F6 02F6
        DECLE   $02F6,  $02F6,  $0276,  $023E   ; DBAA   02F6 02F6 0276 023E

        BESC    L_DEB3                          ; DBAE   020F 0303

        SUB     .STIC.X.0,R0                    ; DBB0   0300 0000
        DIS                                     ; DBB2   0003
        SUB@    R1,     R7                      ; DBB3   030F
        SUBI    #$037F, R7                      ; DBB4   033F 037F

        DECLE   $037F,  $03FA,  $02F6,  $02E6   ; DBB6   037F 03FA 02F6 02E6
        DECLE   $02F6,  $02F6,  $0276,  $023E   ; DBBA   02F6 02F6 0276 023E
        DECLE   $020F,  $0303,  $0300,  $0000   ; DBBE   020F 0303 0300 0000

        DIS                                     ; DBC2   0003
        SUB@    R1,     R7                      ; DBC3   030F
        SUBI    #$037B, R7                      ; DBC4   033F 037B

        DECLE   $037C,  $00FF,  $03FB,  $03F6   ; DBC6   037C 00FF 03FB 03F6
        DECLE   $02E6,  $02F6,  $0276,  $023E   ; DBCA   02E6 02F6 0276 023E
        DECLE   $020F,  $0303,  $0300,  $0000   ; DBCE   020F 0303 0300 0000

        DIS                                     ; DBD2   0003
        SUB@    R1,     R7                      ; DBD3   030F
        SUBI    #$037B, R7                      ; DBD4   033F 037B

        DECLE   $037B,  $03FB,  $03FB,  $03FC   ; DBD6   037B 03FB 03FB 03FC
        DECLE   $00FF,  $03FF,  $037A,  $023E   ; DBDA   00FF 03FF 037A 023E
        DECLE   $020F,  $0303,  $0300,  $0000   ; DBDE   020F 0303 0300 0000

        ADDR    R7,     R6                      ; DBE2   00FE
        ADDI    #$03FF, R7                      ; DBE3   02FF 03FF

        DECLE   $03FF,  $0378,  $00B7,  $03F7   ; DBE5   03FF 0378 00B7 03F7
        DECLE   $0337,  $03B7,  $03B7,  $0378   ; DBE9   0337 03B7 03B7 0378
        DECLE   $00FF,  $03FF,  $03FF,  $03CE   ; DBED   00FF 03FF 03FF 03CE
        DECLE   $023C                           ; DBF1   023C

        ADDR    R7,     R6                      ; DBF2   00FE
        ADDI    #$03FF, R7                      ; DBF3   02FF 03FF

        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; DBF5   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; DBF9   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03CE   ; DBFD   03FF 03FF 03FF 03CE
        DECLE   $023C,  $00FE,  $02FF,  $03FF   ; DC01   023C 00FE 02FF 03FF
        DECLE   $03FF,  $0378,  $00B7,  $03F7   ; DC05   03FF 0378 00B7 03F7
        DECLE   $0337,  $03B7,  $03B7,  $0378   ; DC09   0337 03B7 03B7 0378
        DECLE   $00FF,  $03FF,  $03FF,  $03CE   ; DC0D   00FF 03FF 03FF 03CE
        DECLE   $023C,  $00FE,  $02FF,  $03FF   ; DC11   023C 00FE 02FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; DC15   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; DC19   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03CE   ; DC1D   03FF 03FF 03FF 03CE
        DECLE   $023C                           ; DC21   023C

        ADDR    R7,     R6                      ; DC22   00FE
        ADDI    #$0337, R7                      ; DC23   02FF 0337

        CMP@    R4,     R3                      ; DC25   0363
        XOR@    R5,     R5                      ; DC26   03ED
        CLRR    R5                              ; DC27   01ED
        XORR    R4,     R5                      ; DC28   01E5
        CMPR    R5,     R1                      ; DC29   0169
        CLRR    R5                              ; DC2A   01ED
        CLRR    R5                              ; DC2B   01ED
        CLRR    R5                              ; DC2C   01ED
        CMPR    R5,     R5                      ; DC2D   016D
        SUBR    R5,     R7                      ; DC2E   012F

        DECLE   $03FF,  $03CE,  $023C,  $00FE   ; DC2F   03FF 03CE 023C 00FE
        DECLE   $02FF,  $03FF,  $03FF,  $0337   ; DC33   02FF 03FF 03FF 0337
        DECLE   $0363,  $03ED,  $01ED,  $01E5   ; DC37   0363 03ED 01ED 01E5
        DECLE   $0169,  $01ED,  $01ED,  $01EF   ; DC3B   0169 01ED 01ED 01EF
        DECLE   $03FF,  $03CE,  $023C           ; DC3F   03FF 03CE 023C

        ADDR    R7,     R6                      ; DC42   00FE
        ADDI    #$03B7, R7                      ; DC43   02FF 03B7

        DECLE   $03B7                           ; DC45   03B7

        CMPI    #$00FF, R0                      ; DC46   0378 00FF
        SUB@    R6,     R7                      ; DC48   0337

        DECLE   $0363,  $03ED,  $01ED,  $01E5   ; DC49   0363 03ED 01ED 01E5
        DECLE   $0169,  $01EF,  $03FF,  $03CE   ; DC4D   0169 01EF 03FF 03CE
        DECLE   $023C,  $00FE,  $02FF,  $03FF   ; DC51   023C 00FE 02FF 03FF
        DECLE   $03FF,  $0337,  $03B7,  $03B7   ; DC55   03FF 0337 03B7 03B7
        DECLE   $0378,  $00FF,  $03FF,  $0337   ; DC59   0378 00FF 03FF 0337
        DECLE   $0363,  $03EF,  $03FF,  $03CE   ; DC5D   0363 03EF 03FF 03CE
        DECLE   $023C,  $0000,  $00C0,  $00F6   ; DC61   023C 0000 00C0 00F6
        DECLE   $02FE,  $02FE,  $027E,  $027F   ; DC65   02FE 02FE 027E 027F
        DECLE   $037F,  $037F,  $037E,  $02FE   ; DC69   037F 037F 037E 02FE
        DECLE   $02F6,  $02E0,  $0080,  $0000   ; DC6D   02F6 02E0 0080 0000
        DECLE   $0000,  $0000,  $00C0,  $00F6   ; DC71   0000 0000 00C0 00F6
        DECLE   $02FE,  $02FE,  $02FE,  $02FF   ; DC75   02FE 02FE 02FE 02FF
        DECLE   $03FF,  $03FF,  $03FE,  $02FE   ; DC79   03FF 03FF 03FE 02FE
        DECLE   $02F6,  $02E0,  $0080,  $0000   ; DC7D   02F6 02E0 0080 0000
        DECLE   $0000,  $0000,  $00C0,  $00F6   ; DC81   0000 0000 00C0 00F6
        DECLE   $02FE,  $02FE,  $027E,  $027F   ; DC85   02FE 02FE 027E 027F
        DECLE   $037F,  $037F,  $037E,  $02FE   ; DC89   037F 037F 037E 02FE
        DECLE   $02F6,  $02E0,  $0080,  $0000   ; DC8D   02F6 02E0 0080 0000
        DECLE   $0000,  $0000,  $00C0,  $00F6   ; DC91   0000 0000 00C0 00F6
        DECLE   $02FE,  $02FE,  $02FE,  $02FF   ; DC95   02FE 02FE 02FE 02FF
        DECLE   $03FF,  $03FF,  $03FE,  $02FE   ; DC99   03FF 03FF 03FE 02FE
        DECLE   $02F6,  $02E0,  $0080,  $0000   ; DC9D   02F6 02E0 0080 0000
        DECLE   $0000,  $0000,  $00C0,  $00F6   ; DCA1   0000 0000 00C0 00F6
        DECLE   $02FE,  $027E,  $0226,  $0207   ; DCA5   02FE 027E 0226 0207
        DECLE   $0357,  $0377,  $037E,  $027E   ; DCA9   0357 0377 037E 027E
        DECLE   $02F6,  $02E0,  $0080,  $0000   ; DCAD   02F6 02E0 0080 0000
        DECLE   $0000,  $0000                   ; DCB1   0000 0000

        ADDR    R0,     R0                      ; DCB3   00C0
        ADDR    R6,     R6                      ; DCB4   00F6
        ADDI    #$02FE, R6                      ; DCB5   02FE 02FE
        ADDI    #$027F, R6                      ; DCB7   02FE 027F
        SUB@    R4,     R7                      ; DCB9   0327
        SUB     G_035E, R7                      ; DCBA   0307 035E

        DECLE   $027E,  $02F6,  $02E0,  $0080   ; DCBC   027E 02F6 02E0 0080
        DECLE   $0000,  $0000,  $0000,  $00C0   ; DCC0   0000 0000 0000 00C0
        DECLE   $0076,  $027E,  $02FE,  $02FE   ; DCC4   0076 027E 02FE 02FE
        DECLE   $02FF,  $03FF,  $037F,  $033E   ; DCC8   02FF 03FF 037F 033E
        DECLE   $027E,  $02F6,  $02E0,  $0080   ; DCCC   027E 02F6 02E0 0080
        DECLE   $0000,  $0000,  $0000,  $00C0   ; DCD0   0000 0000 0000 00C0
        DECLE   $00F6,  $02FE,  $027E,  $027E   ; DCD4   00F6 02FE 027E 027E
        DECLE   $027F,  $03FF,  $03FF,  $03FE   ; DCD8   027F 03FF 03FF 03FE
        DECLE   $02FE,  $02F6,  $02E0,  $0080   ; DCDC   02FE 02F6 02E0 0080
        DECLE   $0000,  $0000,  $0080,  $0080   ; DCE0   0000 0000 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DCE4   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DCE8   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DCEC   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0003,  $0003   ; DCF0   0080 0080 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; DCF4   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; DCF8   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; DCFC   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0300,  $0000   ; DD00   0003 0003 0300 0000
        DECLE   $00A0,  $005E,  $0008,  $0000   ; DD04   00A0 005E 0008 0000
        DECLE   $0002,  $00BE,  $005F,  $0300   ; DD08   0002 00BE 005F 0300
        DECLE   $0000,  $007E,  $005E,  $0008   ; DD0C   0000 007E 005E 0008
        DECLE   $0000,  $0002,  $00BE,  $005F   ; DD10   0000 0002 00BE 005F
        DECLE   $02D0,  $005B,  $00B4,  $005A   ; DD14   02D0 005B 00B4 005A
        DECLE   $0001,  $0022,  $0002,  $00C4   ; DD18   0001 0022 0002 00C4
        DECLE   $005D,  $0000,  $0000,  $0000   ; DD1C   005D 0000 0000 0000
        DECLE   $0000,  $0001,  $0022,  $0008   ; DD20   0000 0001 0022 0008
        DECLE   $00C4,  $005D,  $0115,  $005E   ; DD24   00C4 005D 0115 005E
        DECLE   $01FB,  $015D,  $03FB,  $005D   ; DD28   01FB 015D 03FB 005D
        DECLE   $0000,  $0000,  $0053,  $005F   ; DD2C   0000 0000 0053 005F
        DECLE   $0002,  $001C,  $0000,  $0300   ; DD30   0002 001C 0000 0300
        DECLE   $0000,  $00C6,  $005E,  $0008   ; DD34   0000 00C6 005E 0008
        DECLE   $0000                           ; DD38   0000

        INCR    R0                              ; DD39   0008
        SUBR    R0,     R7                      ; DD3A   0107

        SLLC    R3,     2                       ; DD3B   005F
        SUBR    R0,     R7                      ; DD3C   0107

        CMPR    R3,     R7                      ; DD3D   015F
        SUB     G_005F, R7                      ; DD3E   0307 005F
        SUB     G_015F, R7                      ; DD40   0307 015F

        DECLE   $0300,  $0000,  $0095,  $005B   ; DD42   0300 0000 0095 005B
        DECLE   $0008,  $0000,  $0002,  $00BE   ; DD46   0008 0000 0002 00BE
        DECLE   $005F,  $0300,  $0000,  $0014   ; DD4A   005F 0300 0000 0014
        DECLE   $005D,  $0008,  $0000,  $0000   ; DD4E   005D 0008 0000 0000

        SUB     .STIC.X.0,R0                    ; DD52   0300 0000
        ADDR    R5,     R7                      ; DD54   00EF

        DECLE   $0067,  $0008,  $0000,  $0002   ; DD55   0067 0008 0000 0002
        DECLE   $00BE,  $005F,  $0300,  $0000   ; DD59   00BE 005F 0300 0000
        DECLE   $00A3,  $0069,  $0008,  $0000   ; DD5D   00A3 0069 0008 0000
        DECLE   $0000                           ; DD61   0000

        MVI     G_015E, R3                      ; DD62   0283 015E
        INCR    R3                              ; DD64   000B
        PSHR    R5                              ; DD65   0275
        MOVR    R3,     R0                      ; DD66   0098

        JSR     R5,     X_PLAY_SFX1             ; DD67   0004 0118 03BB
        DECLE   $03E9                           ; DD6A  SFX data
        DECLE   $03C0,  $0280                   ; DD6B  SFX data
        DECLE   $0003,  $000C                   ; DD6D  SFX data
        DECLE   $0380,  $0080                   ; DD6F  SFX data
        DECLE   $006B                           ; DD71  SFX data
        DECLE   $00EB                           ; DD72  SFX data
        DECLE   $02CF                           ; DD73  SFX end


        PSHR    R5                              ; DD74   0275
        TSTR    R1                              ; DD75   0089
        BNEQ    L_DD86                          ; DD76   020C 000E

        JSR     R5,     X_PLAY_SFX1             ; DD78   0004 0118 03BB
        DECLE   $03C9                           ; DD7B  SFX data
        DECLE   $01DD                           ; DD7C  SFX data
        DECLE   $0300,  $0080                   ; DD7D  SFX data
        DECLE   $0308,  $0082                   ; DD7F  SFX data
        DECLE   $006B                           ; DD81  SFX data
        DECLE   $0035                           ; DD82  SFX data
        DECLE   $0043,  $03E2                   ; DD83  SFX data
        DECLE   $02CF                           ; DD85  SFX end

L_DD86:
        JSR     R5,     X_PLAY_SFX1             ; DD86   0004 0118 03BB
        DECLE   $03C9                           ; DD89  SFX data
        DECLE   $01DD                           ; DD8A  SFX data
        DECLE   $0300,  $00E8                   ; DD8B  SFX data
        DECLE   $0308,  $00EB                   ; DD8D  SFX data
        DECLE   $006B                           ; DD8F  SFX data
        DECLE   $0035                           ; DD90  SFX data
        DECLE   $0043,  $03E2                   ; DD91  SFX data
        DECLE   $02CF                           ; DD93  SFX end


        PSHR    R5                              ; DD94   0275

        JSR     R5,     X_PLAY_SFX1             ; DD95   0004 0118 03BB
        DECLE   $0389                           ; DD98  SFX data
        DECLE   $0200,  $02C0                   ; DD99  SFX data
        DECLE   $0218,  $0100                   ; DD9B  SFX data
        DECLE   $0214,  $0300                   ; DD9D  SFX data
        DECLE   $0001,  $0303                   ; DD9F  SFX data
        DECLE   $00CE                           ; DDA1  SFX data
        DECLE   $00EB                           ; DDA2  SFX data
        DECLE   $038E                           ; DDA3  SFX data
        DECLE   $0001,  $01E3                   ; DDA4  SFX data
        DECLE   $02EB                           ; DDA6  SFX data
        DECLE   $02CF                           ; DDA7  SFX end


        PSHR    R5                              ; DDA8   0275

        JSR     R5,     X_PLAY_MUS2             ; DDA9   0004 0118 035D
        DECLE   $013C                           ; DDAC  Note (short)
        DECLE   $018C                           ; DDAD  Note (short)
        DECLE   $01CC                           ; DDAE  Note (short)
        DECLE   $01FE                           ; DDAF  Note (short)
        DECLE   $01CC                           ; DDB0  Note (short)
        DECLE   $01FD                           ; DDB1  Note (short)
        DECLE   $000D                           ; DDB2  Note (short)
        DECLE   $014C                           ; DDB3  Note (short)
        DECLE   $019C                           ; DDB4  Note (short)
        DECLE   $01DC                           ; DDB5  Note (short)
        DECLE   $020E                           ; DDB6  Note (short)
        DECLE   $01DC                           ; DDB7  Note (short)
        DECLE   $020D                           ; DDB8  Note (short)
        DECLE   $000D                           ; DDB9  Note (short)
        DECLE   $015C                           ; DDBA  Note (short)
        DECLE   $01AC                           ; DDBB  Note (short)
        DECLE   $01EC                           ; DDBC  Note (short)
        DECLE   $021E                           ; DDBD  Note (short)
        DECLE   $01EC                           ; DDBE  Note (short)
        DECLE   $021D                           ; DDBF  Note (short)
        DECLE   $021D                           ; DDC0  Note (short)
        DECLE   $026F                           ; DDC1  Note (short)
        DECLE   $0000                           ; DDC2  End of music

        MVII    #$000A, R0                      ; DDC3   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; DDC5   0004 011C 02D5

        PULR    R7                              ; DDC8   02B7

        PSHR    R5                              ; DDC9   0275
        MVI     G_01CA, R0                      ; DDCA   0280 01CA
        DECR    R0                              ; DDCC   0010
        BPL     L_DDE3                          ; DDCD   0203 0014

        MVI     G_01CB, R5                      ; DDCF   0285 01CB
        INCR    R5                              ; DDD1   000D
        ADDR    R7,     R5                      ; DDD2   00FD
        ADD@    R5,     R7                      ; DDD3   02EF

        DECLE   $0011,  $0005                   ; DDD4   0011 0005

        DECR    R2                              ; DDD6   0012
        RSWD    R5                              ; DDD7   003D
        SLL     R1,     2                       ; DDD8   004D
        MVII    #$0002, R0                      ; DDD9   02B8 0002
        MVO     R0,     G_01CB                  ; DDDB   0240 01CB
        MVII    #$0007, R1                      ; DDDD   02B9 0007
        MVO     R1,     G_01CC                  ; DDDF   0241 01CC
        MVII    #$0005, R0                      ; DDE1   02B8 0005
L_DDE3:
        MVO     R0,     G_01CA                  ; DDE3   0240 01CA
        PULR    R7                              ; DDE5   02B7

        JSR     R5,     .EXEC.607               ; DDE6   0004 0114 0207

        MVII    #$000A, R4                      ; DDE9   02BC 000A
        MVI     G_01CC, R5                      ; DDEB   0285 01CC
        DECR    R5                              ; DDED   0015
        BNEQ    L_DDF2                          ; DDEE   020C 0002

        MVO     R5,     G_01CB                  ; DDF0   0245 01CB
L_DDF2:
        CMPI    #$0006, R5                      ; DDF2   037D 0006
        BNEQ    L_DE01                          ; DDF4   020C 000B

        SUBI    #$0002, R5                      ; DDF6   033D 0002
        MVI     G_015F, R0                      ; DDF8   0280 015F
        TSTR    R0                              ; DDFA   0080
        BNEQ    L_DE01                          ; DDFB   020C 0004

        ADDI    #$0002, R5                      ; DDFD   02FD 0002
        MVII    #$002A, R4                      ; DDFF   02BC 002A
L_DE01:
        MVO     R4,     G_01CA                  ; DE01   0244 01CA
        MVO     R5,     G_01CC                  ; DE03   0245 01CC
        ADDR    R7,     R5                      ; DE05   00FD
L_DE06:
        ADDI    #$00B5, R5                      ; DE06   02FD 00B5
        MVI@    R5,     R0                      ; DE08   02A8
        MVI     G_015E, R1                      ; DE09   0281 015E
        MVII    #$019D, R3                      ; DE0B   02BB 019D

        JSR     R5,     L_619B                  ; DE0D   0004 0160 019B

        PULR    R7                              ; DE10   02B7

        DECLE   $02B8,  $0004,  $0240,  $01CB   ; DE11   02B8 0004 0240 01CB
        DECLE   $0004                           ; DE15   0004

        ANDR    R4,     R4                      ; DE16   01A4
        BLT     L_DE06                          ; DE17   0225 0012

        MOVR    R0,     R1                      ; DE19   0081

        JSR     R5,     X_RAND2                 ; DE1A   0004 0114 029E

        ADDR    R1,     R0                      ; DE1D   00C8
        MVO     R0,     G_01CA                  ; DE1E   0240 01CA
L_DE20:
        PULR    R7                              ; DE20   02B7

        CLRR    R0                              ; DE21   01C0
        MVO     R0,     G_01CB                  ; DE22   0240 01CB
        MVI     G_019A, R5                      ; DE24   0285 019A
        DECR    R5                              ; DE26   0015
        ADDR    R5,     R5                      ; DE27   00ED
        ADDR    R7,     R5                      ; DE28   00FD
        ADDI    #$0080, R5                      ; DE29   02FD 0080
        MVI     G_035E, R0                      ; DE2B   0280 035E
        SARC    R0,     1                       ; DE2D   0078
        BNC     L_DE20                          ; DE2E   0229 000F

        ANDI    #$0001, R0                      ; DE30   03B8 0001
        ADDR    R0,     R5                      ; DE32   00C5
        MVI@    R5,     R0                      ; DE33   02A8
        CMP     G_019C, R0                      ; DE34   0340 019C
        BEQ     L_DE20                          ; DE36   0224 0017

        MVI     G_015E, R1                      ; DE38   0281 015E
        PULR    R5                              ; DE3A   02B5
        J       L_6060                          ; DE3B   0004 0360 0060

        PSHR    R5                              ; DE3E   0275
        MVI     G_01CD, R0                      ; DE3F   0280 01CD
        DECR    R0                              ; DE41   0010
        BPL     L_DE58                          ; DE42   0203 0014

        MVI     G_01CE, R5                      ; DE44   0285 01CE
        INCR    R5                              ; DE46   000D
        ADDR    R7,     R5                      ; DE47   00FD
        ADD@    R5,     R7                      ; DE48   02EF

        DECLE   $0011,  $0005                   ; DE49   0011 0005

        DECR    R2                              ; DE4B   0012
        GSWD    R0                              ; DE4C   0030
        SWAP    R3,     2                       ; DE4D   0047
        MVII    #$0002, R0                      ; DE4E   02B8 0002
        MVO     R0,     G_01CE                  ; DE50   0240 01CE
        MVII    #$0007, R0                      ; DE52   02B8 0007
        MVO     R0,     G_01CF                  ; DE54   0240 01CF
        MVII    #$000A, R0                      ; DE56   02B8 000A
L_DE58:
        MVO     R0,     G_01CD                  ; DE58   0240 01CD
        PULR    R7                              ; DE5A   02B7

        JSR     R5,     .EXEC.607               ; DE5B   0004 0114 0207

        MVI     G_01CF, R5                      ; DE5E   0285 01CF
        DECR    R5                              ; DE60   0015
        MVO     R5,     G_01CF                  ; DE61   0245 01CF
        BNEQ    L_DE67                          ; DE63   020C 0002

        MVO     R5,     G_01CE                  ; DE65   0245 01CE
L_DE67:
        MVII    #$000A, R0                      ; DE67   02B8 000A
        MVO     R0,     G_01CD                  ; DE69   0240 01CD
        ADDR    R7,     R5                      ; DE6B   00FD
        ADDI    #$0056, R5                      ; DE6C   02FD 0056
        MVI@    R5,     R0                      ; DE6E   02A8
        MVI     G_015E, R1                      ; DE6F   0281 015E
        XORI    #$0001, R1                      ; DE71   03F9 0001
        MVII    #$019E, R3                      ; DE73   02BB 019E

        JSR     R5,     L_619B                  ; DE75   0004 0160 019B

        PULR    R7                              ; DE78   02B7

        DECLE   $02B8,  $0004,  $0240,  $01CE   ; DE79   02B8 0004 0240 01CE
        DECLE   $0004,  $01A4,  $0225,  $0013   ; DE7D   0004 01A4 0225 0013

        MOVR    R0,     R1                      ; DE81   0081
        ADDI    #$0012, R1                      ; DE82   02F9 0012

L_DE84:
        JSR     R5,     X_RAND2                 ; DE84   0004 0114 029E

        ADDR    R1,     R0                      ; DE87   00C8

        JSR     R5,     X_CLAMP                 ; DE88   0004 0114 0270
        DECLE   $0000,  $0037                   ; DE8B   0000 0037

        MVO     R0,     G_01CD                  ; DE8D   0240 01CD
        PULR    R7                              ; DE8F   02B7

        MVII    #$000A, R0                      ; DE90   02B8 000A
        MVII    #$0005, R1                      ; DE92   02B9 0005
        MVI     G_0165, R5                      ; DE94   0285 0165
        XORI    #$000C, R5                      ; DE96   03FD 000C
        ANDI    #$000C, R5                      ; DE98   03BD 000C
        BNEQ    L_DE84                          ; DE9A   022C 0017

        CLRR    R0                              ; DE9C   01C0
        MVO     R0,     G_01CE                  ; DE9D   0240 01CE
        MVII    #$0001, R0                      ; DE9F   02B8 0001
        MVI     G_015E, R1                      ; DEA1   0281 015E
        XORI    #$0001, R1                      ; DEA3   03F9 0001
        PULR    R5                              ; DEA5   02B5
        J       L_5830                          ; DEA6   0004 0358 0030

        DECLE   $0002,  $0003,  $0005,  $0009   ; DEA9   0002 0003 0005 0009
        DECLE   $0004,  $0008,  $0004,  $0009   ; DEAD   0004 0008 0004 0009
        DECLE   $0005                           ; DEB1   0005

        INCR    R0                              ; DEB2   0008
L_DEB3:
        DIS                                     ; DEB3   0003
        DECLE   $0005,  $0002,  $0004,  $0002   ; DEB4   0005 0002 0004 0002
        DECLE   $0003,  $0002,  $0003,  $000D   ; DEB8   0003 0002 0003 000D
        DECLE   $0008,  $000A,  $0008,  $0009   ; DEBC   0008 000A 0008 0009
        DECLE   $0008,  $000B,  $0007,  $0000   ; DEC0   0008 000B 0007 0000
        DECLE   $0004,  $0000,  $0003,  $0000   ; DEC4   0004 0000 0003 0000
        DECLE   $0001,  $0275,  $0378,  $0000   ; DEC8   0001 0275 0378 0000
        DECLE   $020C,  $0003,  $0004           ; DECC   020C 0003 0004

        AND@    R5,     R0                      ; DECF   03A8
        CMPR    R0,     R0                      ; DED0   0140

        JSR     R5,     L_5618                  ; DED1   0004 0154 0218
        DECLE   $000F,  $0004                   ; DED4   000F 0004

        ANDR    R5,     R0                      ; DED6   01A8
        MOVR    R1,     R7                      ; DED7   008F

        DECLE   $0004,  $01A8,  $00C1,  $01C9   ; DED8   0004 01A8 00C1 01C9
        DECLE   $00BC,  $02FC,  $0072,  $0004   ; DEDC   00BC 02FC 0072 0004

        ANDR    R5,     R0                      ; DEE0   01A8
        ADDR    R3,     R7                      ; DEE1   00DF

        DECLE   $02B9,  $0001,  $00BC,  $02FC   ; DEE2   02B9 0001 00BC 02FC
        DECLE   $00A7,  $0004                   ; DEE6   00A7 0004

        ANDR    R5,     R0                      ; DEE8   01A8
        ADDR    R3,     R7                      ; DEE9   00DF

        JSR     R5,     L_565E                  ; DEEA   0004 0154 025E

        COMR    R6                              ; DEED   001E
        PULR    R7                              ; DEEE   02B7

L_DEEF:
        MOVR    R1,     R0                      ; DEEF   0088

        JSR     R5,     X_CLR_BIT               ; DEF0   0004 0114 02E6

        CMPR    R4,     R4                      ; DEF3   0164
        PULR    R7                              ; DEF4   02B7

        PSHR    R5                              ; DEF5   0275
        MVI     G_015D, R5                      ; DEF6   0285 015D
        CMPI    #$000D, R5                      ; DEF8   037D 000D
        BEQ     L_DEEF                          ; DEFA   0224 000C

        MVII    #$019D, R3                      ; DEFC   02BB 019D
        MOVR    R3,     R4                      ; DEFE   009C
        ADDR    R1,     R3                      ; DEFF   00CB
        MVI@    R3,     R5                      ; DF00   029D
        INCR    R5                              ; DF01   000D
        ADDR    R7,     R5                      ; DF02   00FD
        ADD@    R5,     R7                      ; DF03   02EF

        DIS                                     ; DF04   0003
        GSWD    R0                              ; DF05   0030
        ADCR    R7                              ; DF06   002F

        DECR    R0                              ; DF07   0010
L_DF08:
        BEQ     L_DF16                          ; DF08   0204 000C

        DECR    R0                              ; DF0A   0010
        BNEQ    L_DF33                          ; DF0B   020C 0026

        MOVR    R7,     R5                      ; DF0D   00BD
        ADDI    #$0037, R5                      ; DF0E   02FD 0037
        ADDR    R1,     R5                      ; DF10   00CD
        MVI@    R5,     R5                      ; DF11   02AD
        XOR     G_01C6, R5                      ; DF12   03C5 01C6
        MVO     R5,     G_01C6                  ; DF14   0245 01C6
L_DF16:
        MVI@    R3,     R5                      ; DF16   029D
        INCR    R5                              ; DF17   000D
        MVO@    R5,     R3                      ; DF18   025D
        DECR    R5                              ; DF19   0015
        MVI@    R4,     R0                      ; DF1A   02A0
        ADD@    R4,     R0                      ; DF1B   02E0
        CMPI    #$0004, R0                      ; DF1C   0378 0004
        BEQ     L_DF41                          ; DF1E   0204 0021

        TSTR    R1                              ; DF20   0089
        BEQ     L_DF25                          ; DF21   0204 0002

        ADDI    #$0002, R5                      ; DF23   02FD 0002
L_DF25:
        ADDR    R5,     R5                      ; DF25   00ED
        DECLE   $00FD,  $02FD,  $0020,  $0001   ; DF26   00FD 02FD 0020 0001
        DECLE   $02AC,  $0274,  $0004,  $01A8   ; DF2A   02AC 0274 0004 01A8
        DECLE   $010E,  $02B4,  $0004           ; DF2E   010E 02B4 0004

        ANDR    R5,     R0                      ; DF31   01A8
        ADDR    R3,     R7                      ; DF32   00DF
L_DF33:
        PULR    R7                              ; DF33   02B7

        DECR    R0                              ; DF34   0010
        BMI     L_DF33                          ; DF35   022B 0003

        CMPI    #$0008, R0                      ; DF37   0378 0008
        BGT     L_DF33                          ; DF39   022E 0007

        MOVR    R1,     R5                      ; DF3B   008D
        ADDI    #$01D0, R5                      ; DF3C   02FD 01D0
        MVO@    R0,     R5                      ; DF3E   0268
        B       L_DF16                          ; DF3F   0220 002A

L_DF41:
        PULR    R5                              ; DF41   02B5
        J       L_50B2                          ; DF42   0004 0350 00B2

        DECLE   $0004                           ; DF45   0004

        INCR    R0                              ; DF46   0008
        ADDR    R1,     R6                      ; DF47   00CE
        MOVR    R3,     R7                      ; DF48   009F

        INCR    R4                              ; DF49   000C
        MOVR    R4,     R0                      ; DF4A   00A0
        ADDR    R1,     R6                      ; DF4B   00CE
        MOVR    R3,     R7                      ; DF4C   009F

        DECLE   $0025,  $00A0,  $0000,  $0000   ; DF4D   0025 00A0 0000 0000
        DECLE   $0048,  $004F,  $004D,  $0045   ; DF51   0048 004F 004D 0045
        DECLE   $0001,  $0014,  $0054,  $0045   ; DF55   0001 0014 0054 0045
        DECLE   $0041,  $004D,  $0001           ; DF59   0041 004D 0001
L_DF5C:
        SLR     R0,     2                       ; DF5C   0064
        DECLE   $0031,  $0001,  $00A0,  $0032   ; DF5D   0031 0001 00A0 0032
        DECLE   $0002,  $0003,  $003C,  $0073   ; DF61   0002 0003 003C 0073
        DECLE   $0065,  $006C,  $0065,  $0063   ; DF65   0065 006C 0065 0063
        DECLE   $0074,  $003A,  $0001,  $0066   ; DF69   0074 003A 0001 0066
        DECLE   $006C,  $0065,  $0066,  $0074   ; DF6D   006C 0065 0066 0074
        DECLE   $0001,  $007A,  $0063,  $006F   ; DF71   0001 007A 0063 006F
        DECLE   $006E,  $0074,  $0072,  $006C   ; DF75   006E 0074 0072 006C
        DECLE   $0073,  $0001,  $00A2,  $0063   ; DF79   0073 0001 00A2 0063
        DECLE   $006F,  $006D,  $0070,  $0075   ; DF7D   006F 006D 0070 0075
        DECLE   $0074,  $0072,  $0001,  $00B6   ; DF81   0074 0072 0001 00B6
        DECLE   $0070,  $006C,  $0061,  $0079   ; DF85   0070 006C 0061 0079
        DECLE   $0065,  $0072,  $0000,  $0000   ; DF89   0065 0072 0000 0000
        DECLE   $0000,  $0056,  $0049,  $0053   ; DF8D   0000 0056 0049 0053
        DECLE   $0049,  $0054,  $0049,  $004E   ; DF91   0049 0054 0049 004E
        DECLE   $0047,  $0001,  $0014,  $0054   ; DF95   0047 0001 0014 0054
        DECLE   $0045,  $0041,  $004D,  $0001   ; DF99   0045 0041 004D 0001
        DECLE   $0064,  $0031,  $0001,  $00A0   ; DF9D   0064 0031 0001 00A0
        DECLE   $0032,  $0002,  $0003,  $003C   ; DFA1   0032 0002 0003 003C
        DECLE   $0073,  $0065,  $006C,  $0065   ; DFA5   0073 0065 006C 0065
        DECLE   $0063,  $0074,  $003A,  $0001   ; DFA9   0063 0074 003A 0001
        DECLE   $0066,  $0072,  $0069,  $0067   ; DFAD   0066 0072 0069 0067
        DECLE   $0068,  $0074,  $0001,  $007A   ; DFB1   0068 0074 0001 007A
        DECLE   $0063,  $006F,  $006E,  $0074   ; DFB5   0063 006F 006E 0074
        DECLE   $0072,  $006C,  $0073,  $0001   ; DFB9   0072 006C 0073 0001
        DECLE   $00A2,  $0063,  $006F,  $006D   ; DFBD   00A2 0063 006F 006D
        DECLE   $0070,  $0075,  $0074,  $0072   ; DFC1   0070 0075 0074 0072
        DECLE   $0001,  $00B6,  $0070,  $006C   ; DFC5   0001 00B6 0070 006C
        DECLE   $0061,  $0079,  $0065,  $0072   ; DFC9   0061 0079 0065 0072
        DECLE   $0000,  $0000,  $0064,  $0031   ; DFCD   0000 0000 0064 0031
        DECLE   $0001,  $00B4,  $0039,  $0002   ; DFD1   0001 00B4 0039 0002
        DECLE   $0003,  $0000,  $0053,  $0065   ; DFD5   0003 0000 0053 0065
        DECLE   $006C,  $0065,  $0063,  $0074   ; DFD9   006C 0065 0063 0074
        DECLE   $0001,  $0014,  $0074,  $0065   ; DFDD   0001 0014 0074 0065
        DECLE   $0061,  $006D,  $0001           ; DFE1   0061 006D 0001
L_DFE4:
        ADCR    R0                              ; DFE4   0028
        DECLE   $0072,  $0061,  $0074,  $0069   ; DFE5   0072 0061 0074 0069
        DECLE   $006E,  $0067,  $002C,  $0001   ; DFE9   006E 0067 002C 0001
        DECLE   $003C,  $0066,  $0072,  $006F   ; DFED   003C 0066 0072 006F
        DECLE   $006D,  $0001                   ; DFF1   006D 0001

        SLR     R2,     2                       ; DFF3   0066
L_DFF4:
        RLC     R2,     1                       ; DFF4   0052
        DECLE   $006F,  $006F,  $006B,  $0069   ; DFF5   006F 006F 006B 0069
        DECLE   $0065,  $0001                   ; DFF9   0065 0001

        MOVR    R1,     R4                      ; DFFB   008C
L_DFFC:
        RRC     R0,     2                       ; DFFC   0074
        DECLE   $006F,  $0001                   ; DFFD   006F 0001

        TSTR    R6                              ; DFFF   00B6

        ORG     $F000
        DECLE   $0053,  $0075,  $0070,  $0065   ; F000   0053 0075 0070 0065
        DECLE   $0072,  $002D,  $0001,  $00CB   ; F004   0072 002D 0001 00CB
        DECLE   $0050,  $0072,  $006F,  $0000   ; F008   0050 0072 006F 0000
        DECLE   $0000,  $0029,  $0057,  $0061   ; F00C   0000 0029 0057 0061
        DECLE   $0069,  $0074,  $0069,  $006E   ; F010   0069 0074 0069 006E
        DECLE   $0067,  $0001,  $003F,  $0066   ; F014   0067 0001 003F 0066
        DECLE   $006F,  $0072,  $0001,  $0051   ; F018   006F 0072 0001 0051
        DECLE   $0056,  $0069,  $0073,  $0069   ; F01C   0056 0069 0073 0069
        DECLE   $0074,  $006F,  $0072,  $0073   ; F020   0074 006F 0072 0073
        DECLE   $0000,  $0000,  $0029,  $0057   ; F024   0000 0000 0029 0057
        DECLE   $0061,  $0069,  $0074,  $0069   ; F028   0061 0069 0074 0069
        DECLE   $006E,  $0067,  $0001,  $003F   ; F02C   006E 0067 0001 003F
        DECLE   $0066,  $006F,  $0072,  $0001   ; F030   0066 006F 0072 0001
        DECLE   $0050,  $0048,  $006F,  $006D   ; F034   0050 0048 006F 006D
        DECLE   $0065,  $0020,  $0054,  $0065   ; F038   0065 0020 0054 0065
        DECLE   $0061,  $006D,  $0000,  $007C   ; F03C   0061 006D 0000 007C
        DECLE   $006C,  $006C,  $006C,  $007C   ; F040   006C 006C 006C 007C
        DECLE   $0001,  $00FF,  $00FF,  $0039   ; F044   0001 00FF 00FF 0039
        DECLE   $0019,  $0019,  $0019,  $003D   ; F048   0019 0019 0019 003D
        DECLE   $0001,  $00FF,  $00FF,  $007D   ; F04C   0001 00FF 00FF 007D
        DECLE   $000D,  $007D,  $0061,  $007D   ; F050   000D 007D 0061 007D
        DECLE   $0001,  $00FF,  $00FF,  $007D   ; F054   0001 00FF 00FF 007D
        DECLE   $000D,  $003D,  $000D,  $007D   ; F058   000D 003D 000D 007D
        DECLE   $0001,  $00FF,  $00FF,  $006D   ; F05C   0001 00FF 00FF 006D
        DECLE   $006D,  $006D,  $007D,  $000D   ; F060   006D 006D 007D 000D
        DECLE   $0001,  $00FF,  $00FF,  $007D   ; F064   0001 00FF 00FF 007D
        DECLE   $0061,  $007D,  $000D,  $007D   ; F068   0061 007D 000D 007D
        DECLE   $0001,  $00FF,  $00FF,  $00FD   ; F06C   0001 00FF 00FF 00FD
        DECLE   $00C1,  $00DD,  $00CD,  $00FD   ; F070   00C1 00DD 00CD 00FD
        DECLE   $0001,  $00FF,  $00FF,  $007E   ; F074   0001 00FF 00FF 007E
        DECLE   $0060,  $006E,  $0066,  $007E   ; F078   0060 006E 0066 007E
        DECLE   $0000,  $00FF,  $00FF,  $0000   ; F07C   0000 00FF 00FF 0000
        DECLE   $0060,  $007C,  $003F,  $0037   ; F080   0060 007C 003F 0037
        DECLE   $0016,  $002C,  $0005,  $0000   ; F084   0016 002C 0005 0000
        DECLE   $0000                           ; F088   0000

        DIS                                     ; F089   0003
        INCR    R7                              ; F08A   000F

        INCR    R6                              ; F08B   000E
L_F08C:
        CLRC                                    ; F08C   0006
        DECLE   $0003,  $000A,  $0000,  $0060   ; F08D   0003 000A 0000 0060
        DECLE   $00E0,  $00C0,  $00C0,  $0080   ; F091   00E0 00C0 00C0 0080
        DECLE   $0040,  $0000,  $0000,  $0060   ; F095   0040 0000 0000 0060
        DECLE   $003E,  $003F                   ; F099   003E 003F
L_F09B:
        DECR    R7                              ; F09B   0017

        DECLE   $000E,  $0005,  $000D,  $0000   ; F09C   000E 0005 000D 0000

        GSWD    R0                              ; F0A0   0030
        RSWD    R4                              ; F0A1   003C
        SLLC    R2,     2                       ; F0A2   005E
        RSWD    R6                              ; F0A3   003E
        INCR    R6                              ; F0A4   000E
L_F0A5:
        DECR    R7                              ; F0A5   0017

        DECLE   $0031,  $0000,  $0000,  $0000   ; F0A6   0031 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; F0AA   0000 0000 0000 0003
        DECLE   $0000,  $0040,  $00A0,  $0040   ; F0AE   0000 0040 00A0 0040
        DECLE   $0000,  $004A,  $00E4,  $004A   ; F0B2   0000 004A 00E4 004A
        DECLE   $0000,  $0040,  $00E0,  $0040   ; F0B6   0000 0040 00E0 0040
        DECLE   $0000,  $0000,  $0040,  $00A0   ; F0BA   0000 0000 0040 00A0
        DECLE   $0040,  $0040,  $00A0,  $0040   ; F0BE   0040 0040 00A0 0040
        DECLE   $0000,  $0000,  $0040,  $00E0   ; F0C2   0000 0000 0040 00E0
        DECLE   $0040,  $0000,  $004A,  $00E4   ; F0C6   0040 0000 004A 00E4
        DECLE   $004A,  $0000,  $0040,  $00A0   ; F0CA   004A 0000 0040 00A0
        DECLE   $0040,  $0040,  $00E0,  $0040   ; F0CE   0040 0040 00E0 0040
        DECLE   $0000,  $0000,  $0002,  $0005   ; F0D2   0000 0000 0002 0005
        DECLE   $0002,  $0002,  $0005,  $0002   ; F0D6   0002 0002 0005 0002
        DECLE   $0000,  $0000,  $0040,  $00E0   ; F0DA   0000 0000 0040 00E0
        DECLE   $0040,  $0000,  $0000,  $0000   ; F0DE   0040 0000 0000 0000
        DECLE   $0002,  $0005,  $0042,  $00E0   ; F0E2   0002 0005 0042 00E0
        DECLE   $0040,  $0040,  $00E0,  $0042   ; F0E6   0040 0040 00E0 0042
        DECLE   $0005,  $0002,  $0000,  $0000   ; F0EA   0005 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0EE   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00A0,  $0040   ; F0F2   0000 0040 00A0 0040
        DECLE   $00E0,  $004A,  $00E4,  $004A   ; F0F6   00E0 004A 00E4 004A
        DECLE   $00A0,  $0040,  $0000,  $0000   ; F0FA   00A0 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0FE   0000 0000 0000 0000
        DECLE   $0040,  $00A0,  $004A,  $00E4   ; F102   0040 00A0 004A 00E4
        DECLE   $004A,  $00E0,  $0040,  $00A0   ; F106   004A 00E0 0040 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; F10A   0040 0000 0000 0000
        DECLE   $0000,  $0040,  $00A0,  $0040   ; F10E   0000 0040 00A0 0040
        DECLE   $0000,  $0000,  $0000           ; F112   0000 0000 0000

        SWAP    R2,     1                       ; F115   0042
        ADDR    R4,     R7                      ; F116   00E7

        DECLE   $0042,  $0000,  $0000,  $0000   ; F117   0042 0000 0000 0000
        DECLE   $0040,  $00A0,  $0040,  $0000   ; F11B   0040 00A0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F11F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0004   ; F123   0000 0000 000A 0004
        DECLE   $000A,  $0000,  $0000,  $0000   ; F127   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F12B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F12F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0050   ; F133   0000 0000 0000 0050
        DECLE   $0020,  $0050,  $0000,  $0000   ; F137   0020 0050 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F13B   0000 0000 0000 0000
        DECLE   $0002,  $0007,  $0002,  $0000   ; F13F   0002 0007 0002 0000
        DECLE   $0000,  $0000,  $0000           ; F143   0000 0000 0000

        SWAP    R2,     1                       ; F146   0042
        MOVR    R4,     R7                      ; F147   00A7

        DECLE   $0042,  $0000,  $0000,  $0000   ; F148   0042 0000 0000 0000
        DECLE   $0002,  $0005,  $0002,  $0002   ; F14C   0002 0005 0002 0002
        DECLE   $0007,  $0002,  $0040,  $00A0   ; F150   0007 0002 0040 00A0
        DECLE   $0040,  $0002,  $0007,  $0002   ; F154   0040 0002 0007 0002
        DECLE   $00A0,  $0040,  $00A0,  $0002   ; F158   00A0 0040 00A0 0002
        DECLE   $0005,  $0002,  $0000,  $0002   ; F15C   0005 0002 0000 0002
        DECLE   $0005,  $0002,  $00A0,  $0040   ; F160   0005 0002 00A0 0040
        DECLE   $00A0,  $0002,  $0007,  $0002   ; F164   00A0 0002 0007 0002
        DECLE   $0040,  $00A0,  $0040,  $0002   ; F168   0040 00A0 0040 0002
        DECLE   $0007,  $0002,  $0000,  $0010   ; F16C   0007 0002 0000 0010
        DECLE   $0028,  $0010,  $0000,  $0002   ; F170   0028 0010 0000 0002
        DECLE   $0007,  $0002,  $0000,  $00A2   ; F174   0007 0002 0000 00A2
        DECLE   $0047,  $00A2,  $0000,  $0002   ; F178   0047 00A2 0000 0002
        DECLE   $0005,  $0002,  $0000,  $0002   ; F17C   0005 0002 0000 0002
        DECLE   $0005,  $0002,  $0000,  $00A2   ; F180   0005 0002 0000 00A2
        DECLE   $0047,  $00A2,  $0000,  $0002   ; F184   0047 00A2 0000 0002
        DECLE   $0007,  $0002,  $0000,  $0000   ; F188   0007 0002 0000 0000
        DECLE   $0010,  $0028,  $0010,  $0002   ; F18C   0010 0028 0010 0002
        DECLE   $0007,  $0002,  $0000,  $0000   ; F190   0007 0002 0000 0000
        DECLE   $0000,  $0002,  $0007,  $0002   ; F194   0000 0002 0007 0002
        DECLE   $0000,  $0000,  $0000,  $0002   ; F198   0000 0000 0000 0002
        DECLE   $0005,  $0002,  $0000,  $0000   ; F19C   0005 0002 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0028   ; F1A0   0000 0000 0010 0028
        DECLE   $0010,  $0000,  $0000,  $0000   ; F1A4   0010 0000 0000 0000
        DECLE   $0028,  $0010,  $0028,  $0000   ; F1A8   0028 0010 0028 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; F1AC   0000 0000 0000 0002
        DECLE   $0005,  $0002,  $0000,  $0000   ; F1B0   0005 0002 0000 0000
        DECLE   $0000,  $0002,  $0007,  $0002   ; F1B4   0000 0002 0007 0002
        DECLE   $0000,  $0000,  $0000,  $0002   ; F1B8   0000 0000 0000 0002
        DECLE   $0007,  $0002,  $0000,  $0000   ; F1BC   0007 0002 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0010   ; F1C0   0000 0000 0028 0010
        DECLE   $0028,  $0000,  $0000,  $0000   ; F1C4   0028 0000 0000 0000
        DECLE   $0010,  $0028,  $0010,  $0000   ; F1C8   0010 0028 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; F1CC   0000 0000 0000 0002
        DECLE   $0005,  $0002,  $0000,  $0002   ; F1D0   0005 0002 0000 0002
        DECLE   $0007,  $0002,  $0000,  $0002   ; F1D4   0007 0002 0000 0002
        DECLE   $0007,  $0002,  $0000,  $0002   ; F1D8   0007 0002 0000 0002
        DECLE   $00A5,  $0042,  $00A0,  $00A0   ; F1DC   00A5 0042 00A0 00A0
        DECLE   $0042,  $00A5,  $0002,  $0000   ; F1E0   0042 00A5 0002 0000
        DECLE   $0002,  $0007,  $0002,  $0000   ; F1E4   0002 0007 0002 0000
        DECLE   $0002,  $0007,  $0002,  $0000   ; F1E8   0002 0007 0002 0000
        DECLE   $0002,  $0005,  $0002,  $00F0   ; F1EC   0002 0005 0002 00F0
        DECLE   $00E0,  $00F0,  $00B8,  $001C   ; F1F0   00E0 00F0 00B8 001C
        DECLE   $000E,  $0007,  $0002,  $0000   ; F1F4   000E 0007 0002 0000
        DECLE   $0020,  $0060,  $00FF,  $00FF   ; F1F8   0020 0060 00FF 00FF
        DECLE   $0060,  $0020,  $0000,  $00FF   ; F1FC   0060 0020 0000 00FF
        DECLE   $0000,  $0000,  $00FF,  $0000   ; F200   0000 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F204   0000 0000 0000 0080
        DECLE   $0040,  $0020,  $0010,  $0008   ; F208   0040 0020 0010 0008
        DECLE   $0004,  $0002,  $0001,  $0001   ; F20C   0004 0002 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F210   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $00FC   ; F214   0001 0001 0001 00FC
        DECLE   $00F0,  $00E0,  $00C0,  $0080   ; F218   00F0 00E0 00C0 0080
        DECLE   $0080,  $0000,  $0000,  $0077   ; F21C   0080 0000 0000 0077
        DECLE   $007F,  $0081,  $0081,  $00C1   ; F220   007F 0081 0081 00C1
        DECLE   $00C0,  $00E0,  $00D0,  $00E0   ; F224   00C0 00E0 00D0 00E0
        DECLE   $00C0,  $00C0,  $00C0,  $0080   ; F228   00C0 00C0 00C0 0080
        DECLE   $0080,  $0080,  $0000,  $00FF   ; F22C   0080 0080 0000 00FF
        DECLE   $00FF,  $007F,  $007F,  $003F   ; F230   00FF 007F 007F 003F
        DECLE   $003F,  $001F,  $001F,  $0003   ; F234   003F 001F 001F 0003
        DECLE   $00FC,  $00FF,  $00FF,  $00FD   ; F238   00FC 00FF 00FF 00FD
        DECLE   $003F,  $00FF,  $00FF,  $0080   ; F23C   003F 00FF 00FF 0080
        DECLE   $00FC,  $00FF,  $00FF,  $00FF   ; F240   00FC 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F244   00FF 00FF 00FF 00FF
        DECLE   $00C0,  $0080,  $0080,  $0080   ; F248   00C0 0080 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0030   ; F24C   0080 0000 0000 0030
        DECLE   $0030,  $0078,  $0078,  $0078   ; F250   0030 0078 0078 0078
        DECLE   $0030,  $0078,  $0078,  $0000   ; F254   0030 0078 0078 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F258   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; F25C   0000 0000 0000 001F

        INCR    R7                              ; F260   000F

        SETC                                    ; F261   0007
L_F262:
        DIS                                     ; F262   0003
        DECLE   $0003,  $0001,  $0001,  $0001   ; F263   0003 0001 0001 0001
        DECLE   $00FF,  $0000,  $00F7,  $00FF   ; F267   00FF 0000 00F7 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F26B   00FF 00FF 00FF 00FF
        DECLE   $007F,  $003F,  $003F,  $001F   ; F26F   007F 003F 003F 001F
        DECLE   $001F,  $0007,  $0001,  $0010   ; F273   001F 0007 0001 0010
        DECLE   $0000,  $0000,  $00C0,  $0000   ; F277   0000 0000 00C0 0000
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; F27B   00C0 00C0 00C0 00C0
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; F27F   0080 00C0 00E0 00F0
        DECLE   $00F0,  $00F8,  $00FC,  $00FC   ; F283   00F0 00F8 00FC 00FC
        DECLE   $0078,  $0078,  $0078,  $0078   ; F287   0078 0078 0078 0078
        DECLE   $0078,  $0078,  $0078,  $0078   ; F28B   0078 0078 0078 0078
        DECLE   $0003,  $0000,  $0000,  $0000   ; F28F   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F293   0000 0000 0000 0000
        DECLE   $00FC,  $00FF,  $00FF,  $00FF   ; F297   00FC 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; F29B   00FF 00FF 00FF 007F
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; F29F   00C0 00C0 00C0 00C0
        DECLE   $00F0,  $00F8,  $0000,  $0000   ; F2A3   00F0 00F8 0000 0000
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; F2A7   000F 003F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0001   ; F2AB   00FF 00FF 00FF 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2AF   0000 0000 0000 0000
        DECLE   $0000                           ; F2B3   0000

        EIS                                     ; F2B4   0002

        JSR     R4,     .EXEC.8FC               ; F2B5   0004 0018 00FC

        ADDR    R7,     R0                      ; F2B8   00F8
        ADDR    R6,     R0                      ; F2B9   00F0
        ADDR    R6,     R0                      ; F2BA   00F0
        ADDR    R4,     R3                      ; F2BB   00E3
        ADDR    R0,     R7                      ; F2BC   00C7

        DECLE   $0080,  $0000,  $0000,  $0000   ; F2BD   0080 0000 0000 0000
        DECLE   $0020,  $0000,  $0010,  $0000   ; F2C1   0020 0000 0010 0000
        DECLE   $0010,  $000B,  $0000,  $00F0   ; F2C5   0010 000B 0000 00F0
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; F2C9   00F8 00FC 00FE 00FF
        DECLE   $00FF,  $00FF,  $0000,  $00FF   ; F2CD   00FF 00FF 0000 00FF
        DECLE   $007F,  $003F,  $001F           ; F2D1   007F 003F 001F

        INCR    R7                              ; F2D4   000F

        SETC                                    ; F2D5   0007
L_F2D6:
        DIS                                     ; F2D6   0003
        DECLE   $00E0,  $0080,  $0000,  $0000   ; F2D7   00E0 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F2DB   0000 0000 0000 0080
        DECLE   $0078,  $003C,  $00FE,  $00FE   ; F2DF   0078 003C 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FC   ; F2E3   00FE 00FE 00FE 00FC
        DECLE   $00C0,  $0000,  $0080,  $0080   ; F2E7   00C0 0000 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2EB   0000 0000 0000 0000

        SARC    R0,     2                       ; F2EF   007C
        SARC    R0,     2                       ; F2F0   007C
        SARC    R0,     2                       ; F2F1   007C
        SARC    R0,     2                       ; F2F2   007C
        SARC    R0,     2                       ; F2F3   007C
        RSWD    R4                              ; F2F4   003C
        RSWD    R4                              ; F2F5   003C
        RSWD    R4                              ; F2F6   003C
        ADDR    R7,     R4                      ; F2F7   00FC
        ADDR    R6,     R3                      ; F2F8   00F3
        ADDR    R5,     R7                      ; F2F9   00EF
        ADDR    R3,     R7                      ; F2FA   00DF

        DECLE   $00BF,  $00BF,  $007F,  $007F   ; F2FB   00BF 00BF 007F 007F
        DECLE   $00FF,  $00FF,  $007F,  $00BF   ; F2FF   00FF 00FF 007F 00BF
        DECLE   $005F,  $005F,  $005F,  $005F   ; F303   005F 005F 005F 005F
        DECLE   $0000,  $0060,  $0030,  $0018   ; F307   0000 0060 0030 0018
        DECLE   $000C,  $0006,  $0003,  $0001   ; F30B   000C 0006 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F30F   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F313   0001 0001 0001 0001
        DECLE   $0001,  $00C1,  $0061,  $0031   ; F317   0001 00C1 0061 0031
        DECLE   $0019,  $000D,  $0007,  $0003   ; F31B   0019 000D 0007 0003
        DECLE   $0000,  $0080,  $00C0,  $0060   ; F31F   0000 0080 00C0 0060
        DECLE   $0030,  $0018,  $000C,  $0006   ; F323   0030 0018 000C 0006
        DECLE   $0000,  $001E,  $003E,  $0076   ; F327   0000 001E 003E 0076
        DECLE   $00EE,  $00DC,  $00F8,  $00F0   ; F32B   00EE 00DC 00F8 00F0
        DECLE   $0202,  $0005,  $0000,  $0200   ; F32F   0202 0005 0000 0200
        DECLE   $0000,  $0200,  $0007,  $0000   ; F333   0000 0200 0007 0000
        DECLE   $0206,  $020E,  $0190,  $0011   ; F337   0206 020E 0190 0011
        DECLE   $0000,  $0196,  $021C,  $0208   ; F33B   0000 0196 021C 0208
        DECLE   $0182,  $0005,  $0000,  $0005   ; F33F   0182 0005 0000 0005
        DECLE   $0242,  $0005,  $0000,  $0182   ; F343   0242 0005 0000 0182
        DECLE   $0204,  $020A,  $0180,  $0005   ; F347   0204 020A 0180 0005
        DECLE   $0000,  $0005,  $023A,  $0005   ; F34B   0000 0005 023A 0005
        DECLE   $0000,  $0180,  $020C,  $0208   ; F34F   0000 0180 020C 0208
        DECLE   $0011,  $0182,  $0204,  $0210   ; F353   0011 0182 0204 0210
        DECLE   $0212,  $0214,  $0216,  $0218   ; F357   0212 0214 0216 0218
        DECLE   $021A,  $0013,  $0000,  $0000   ; F35B   021A 0013 0000 0000
        DECLE   $0005,  $0000,  $023C,  $0007   ; F35F   0005 0000 023C 0007
        DECLE   $023E,  $0240,  $0005,  $0000   ; F363   023E 0240 0005 0000
        DECLE   $0000,  $0005,  $0000,  $0234   ; F367   0000 0005 0000 0234
        DECLE   $0007,  $0236,  $0238,  $0005   ; F36B   0007 0236 0238 0005
        DECLE   $0000,  $0000,  $0022,  $005D   ; F36F   0000 0000 0022 005D
        DECLE   $0207,  $028F,  $0361,  $0319   ; F373   0207 028F 0361 0319
        DECLE   $02E3,  $0103,  $00C0,  $0209   ; F377   02E3 0103 00C0 0209
        DECLE   $0040,  $010B,  $0040,  $0001   ; F37B   0040 010B 0040 0001
        DECLE   $0380,  $0011,  $0280,  $021F   ; F37F   0380 0011 0280 021F
        DECLE   $0040,  $0223,  $0040,  $0221   ; F383   0040 0223 0040 0221
        DECLE   $0040,  $0225,  $00C0,  $0033   ; F387   0040 0225 00C0 0033
        DECLE   $01A0,  $0233,  $01A0,  $0031   ; F38B   01A0 0233 01A0 0031
        DECLE   $021D                           ; F38F   021D

        AND     .BTAB.2D,R0                     ; F390   0380 022D
        AND     .BTAB.3D,R0                     ; F392   0380 023D
        AND     .BTAB.4D,R0                     ; F394   0380 024D
        AND     .BTAB.5D,R0                     ; F396   0380 025D
        AND     G_006C, R0                      ; F398   0380 006C
        SAR     R3,     2                       ; F39A   006F
        INCR    R0                              ; F39B   0008
        MVO@    R4,     R5                      ; F39C   026C
        SAR     R2,     2                       ; F39D   006E
        MVO@    R6,     R5                      ; F39E   026E
        CMPR    R5,     R4                      ; F39F   016C
        MVO@    R7,     R5                      ; F3A0   026F
        INCR    R0                              ; F3A1   0008
        MVO@    R5,     R5                      ; F3A2   026D
        INCR    R0                              ; F3A3   0008
        RSWD    R3                              ; F3A4   003B
        NEGR    R0                              ; F3A5   0020
        GSWD    R1                              ; F3A6   0031
        COMR    R5                              ; F3A7   001D
        AND     G_002D, R0                      ; F3A8   0380 002D
        AND     G_003D, R0                      ; F3AA   0380 003D
        AND     G_004D, R0                      ; F3AC   0380 004D
        AND     G_005D, R0                      ; F3AE   0380 005D
        AND     G_006C, R0                      ; F3B0   0380 006C
        SAR     R3,     2                       ; F3B2   006F
        INCR    R0                              ; F3B3   0008
        MVO@    R4,     R5                      ; F3B4   026C
        SAR     R2,     2                       ; F3B5   006E
        MVO@    R6,     R5                      ; F3B6   026E
        CMPR    R5,     R4                      ; F3B7   016C
L_F3B8:
        MVO@    R7,     R5                      ; F3B8   026F
        DECLE   $0008,  $026D,  $0008,  $003B   ; F3B9   0008 026D 0008 003B
        DECLE   $0020,  $0021,  $0071,  $0380   ; F3BD   0020 0021 0071 0380
        DECLE   $0001,  $03A0,  $0011,  $03A0   ; F3C1   0001 03A0 0011 03A0
        DECLE   $0021,  $03A0,  $0031,  $0020   ; F3C5   0021 03A0 0031 0020
        DECLE   $0071,  $00A3,  $00A6,  $00A3   ; F3C9   0071 00A3 00A6 00A3
        DECLE   $008E,  $00A3,  $00BE,  $00A3   ; F3CD   008E 00A3 00BE 00A3
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; F3D9   0000 0000 0018 003C
        DECLE   $007E,  $007E,  $007E,  $007E   ; F3DD   007E 007E 007E 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3E1   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F3E5   00FF 00FF 00FF 00FF
        DECLE   $0000,  $00FF,  $00BA,  $00D5   ; F3E9   0000 00FF 00BA 00D5
        DECLE   $00A8,  $0055,  $00BA,  $0000   ; F3ED   00A8 0055 00BA 0000
        DECLE   $00FF,  $0000,  $0000,  $0018   ; F3F1   00FF 0000 0000 0018
        DECLE   $003C,  $007E,  $007E,  $007E   ; F3F5   003C 007E 007E 007E
        DECLE   $0000,  $00FF,  $0000,  $0000   ; F3F9   0000 00FF 0000 0000
        DECLE   $0008,  $001C,  $003E,  $003E   ; F3FD   0008 001C 003E 003E
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; F401   00FF 0000 00FF 0000
        DECLE   $0000,  $0008,  $001C,  $001C   ; F405   0000 0008 001C 001C
        DECLE   $007E,  $0000,  $00FF,  $005D   ; F409   007E 0000 00FF 005D
        DECLE   $002A,  $005D,  $00AA,  $0074   ; F40D   002A 005D 00AA 0074
        DECLE   $003E,  $003E,  $0000,  $00FF   ; F411   003E 003E 0000 00FF
        DECLE   $00BA,  $0011,  $008B,  $0045   ; F415   00BA 0011 008B 0045
        DECLE   $003E,  $003E,  $003E,  $0000   ; F419   003E 003E 003E 0000
        DECLE   $00FF,  $005D,  $008B,  $0051   ; F41D   00FF 005D 008B 0051
        DECLE   $00AA,  $0000,  $00FF,  $0075   ; F421   00AA 0000 00FF 0075
        DECLE   $00A8,  $0015,  $00AA,  $005D   ; F425   00A8 0015 00AA 005D
        DECLE   $00E2,  $0051,  $0000,  $00FF   ; F429   00E2 0051 0000 00FF
        DECLE   $003A,  $0015,  $008E,  $0044   ; F42D   003A 0015 008E 0044
        DECLE   $0022,  $0047,  $008A,  $0000   ; F431   0022 0047 008A 0000
        DECLE   $00FF,  $0054,  $00B8,  $0051   ; F435   00FF 0054 00B8 0051
        DECLE   $0007,  $001F,  $007F,  $00FF   ; F439   0007 001F 007F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F43D   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; F441   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F445   00FF 00FF 00FF 00FF
        DECLE   $00AA,  $0000,  $00F8,  $00F1   ; F449   00AA 0000 00F8 00F1
        DECLE   $00E2,  $00C5,  $008A,  $0015   ; F44D   00E2 00C5 008A 0015
        DECLE   $0000,  $00FC,  $00A8,  $0050   ; F451   0000 00FC 00A8 0050
        DECLE   $00A0,  $0040,  $0080,  $0003   ; F455   00A0 0040 0080 0003
        DECLE   $0000,  $0000,  $0000,  $00FF   ; F459   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F45D   00FF 00FF 00FF 00FF
        DECLE   $0092,  $0000,  $0000,  $0000   ; F461   0092 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F465   0000 00FF 00FF 00FF
        DECLE   $00A2,  $0051,  $0000,  $0000   ; F469   00A2 0051 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; F46D   0000 0000 00FF 00FF
        DECLE   $00AA,  $0000,  $001F           ; F471   00AA 0000 001F

        INCR    R7                              ; F474   000F
        MOVR    R0,     R7                      ; F475   0087

L_F476:
        SWAP    R3,     1                       ; F476   0043
        DECLE   $00A1,  $0050,  $0000,  $001F   ; F477   00A1 0050 0000 001F
        DECLE   $000A,  $0005,  $0002,  $0001   ; F47B   000A 0005 0002 0001
        DECLE   $0000,  $0000,  $00C0,  $00F0   ; F47F   0000 0000 00C0 00F0
        DECLE   $00FC,  $00FF,  $00FF,  $00FF   ; F483   00FC 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00AA,  $0000   ; F487   00FF 00FF 00AA 0000
        DECLE   $00FF,  $0047,  $00A2,  $0011   ; F48B   00FF 0047 00A2 0011
        DECLE   $00B8,  $0054,  $00FF,  $00FF   ; F48F   00B8 0054 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F493   00FF 00FF 00FF 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F497   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F49B   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $008E,  $0015   ; F49F   00FF 0000 008E 0015
        DECLE   $0000,  $00FF,  $00A8,  $0011   ; F4A3   0000 00FF 00A8 0011
        DECLE   $00A2,  $0045,  $00E2,  $0051   ; F4A7   00A2 0045 00E2 0051
        DECLE   $00A8,  $0000,  $00FF,  $0015   ; F4AB   00A8 0000 00FF 0015
        DECLE   $0088,  $0045,  $002A,  $0000   ; F4AF   0088 0045 002A 0000
        DECLE   $00FF,  $0051,  $00E2,  $0045   ; F4B3   00FF 0051 00E2 0045
        DECLE   $008B,  $001D,  $0000,  $00FF   ; F4B7   008B 001D 0000 00FF
        DECLE   $002E,  $0015,  $0088,  $00C5   ; F4BB   002E 0015 0088 00C5
        DECLE   $00A2,  $0000,  $0000,  $00FF   ; F4BF   00A2 0000 0000 00FF
        DECLE   $00A8,  $00D1,  $00A2,  $0045   ; F4C3   00A8 00D1 00A2 0045
        DECLE   $0088,  $0000,  $003E,  $003E   ; F4C7   0088 0000 003E 003E
        DECLE   $0000,  $00FF,  $00A8,  $0051   ; F4CB   0000 00FF 00A8 0051
        DECLE   $00E2,  $0044,  $007E,  $0000   ; F4CF   00E2 0044 007E 0000
        DECLE   $00FF,  $0071,  $0022,  $0045   ; F4D3   00FF 0071 0022 0045
        DECLE   $008B,  $0011,  $007E,  $0000   ; F4D7   008B 0011 007E 0000
        DECLE   $00FF                           ; F4DB   00FF
L_F4DC:
        DECR    R7                              ; F4DC   0017

        MOVR    R1,     R2                      ; F4DD   008A
        SWAP    R1,     2                       ; F4DE   0045
        MOVR    R4,     R2                      ; F4DF   00A2
        RLC     R1,     1                       ; F4E0   0051
        ADDR    R0,     R7                      ; F4E1   00C7
        ADDR    R0,     R7                      ; F4E2   00C7
        ADDR    R0,     R7                      ; F4E3   00C7

        DECLE   $00C6,  $00C6,  $00C6,  $00C6   ; F4E4   00C6 00C6 00C6 00C6
        DECLE   $00FF,  $00FF,  $00F2,  $0033   ; F4E8   00FF 00FF 00F2 0033
        DECLE   $0013,  $0003,  $0043,  $0067   ; F4EC   0013 0003 0043 0067
        DECLE   $00FF,  $003F,  $001F,  $0033   ; F4F0   00FF 003F 001F 0033
        DECLE   $0033,  $0039,  $0039,  $008C   ; F4F4   0033 0039 0039 008C
        DECLE   $00FF                           ; F4F8   00FF

        ADDR    R3,     R7                      ; F4F9   00DF
        ADDR    R3,     R7                      ; F4FA   00DF

        DECLE   $00BF,  $00BF,  $007F,  $007F   ; F4FB   00BF 00BF 007F 007F
        DECLE   $00FF,  $00FF,  $007F,  $007F   ; F4FF   00FF 00FF 007F 007F
        DECLE   $007F,  $007F,  $00BF,  $00BF   ; F503   007F 007F 00BF 00BF
        DECLE   $00BF,  $00BF                   ; F507   00BF 00BF

        ADDR    R3,     R7                      ; F509   00DF
        ADDR    R3,     R7                      ; F50A   00DF
        ADDR    R3,     R7                      ; F50B   00DF
        ADDR    R3,     R7                      ; F50C   00DF
        ADDR    R5,     R7                      ; F50D   00EF
        ADDR    R5,     R7                      ; F50E   00EF
        ADDR    R5,     R7                      ; F50F   00EF
        ADDR    R5,     R7                      ; F510   00EF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F511   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $00FF,  $00FF   ; F515   00FF 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F519   00FF 00FF 00FF 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F51D   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F521   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F525   00FF 00FF 00FF 00FF
        DECLE   $003C,  $0042,  $0099,  $00A1   ; F529   003C 0042 0099 00A1
        DECLE   $0099,  $0042,  $003C,  $0000   ; F52D   0099 0042 003C 0000
        DECLE   $00FF,  $00FF,  $00FF,  $0081   ; F531   00FF 00FF 00FF 0081
        DECLE   $0000,  $0000,  $0081,  $00FF   ; F535   0000 0000 0081 00FF
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; F539   00FE 00FE 00FE 00FE
        DECLE   $00FD,  $00FD,  $00FD,  $00FD   ; F53D   00FD 00FD 00FD 00FD
        DECLE   $00FB,  $00FB,  $00FB,  $00FB   ; F541   00FB 00FB 00FB 00FB
        DECLE   $00F7,  $00F7,  $00F7,  $00F7   ; F545   00F7 00F7 00F7 00F7
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F549   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; F54D   0000 0000 0000 0000
        DECLE   $0038,  $0038,  $0038,  $0039   ; F551   0038 0038 0038 0039
        DECLE   $0039,  $0039,  $0039,  $0000   ; F555   0039 0039 0039 0000
        DECLE   $0000,  $000D,  $00CC,  $00EC   ; F559   0000 000D 00CC 00EC
        DECLE   $00FC,  $00BC,  $0098,  $0000   ; F55D   00FC 00BC 0098 0000
        DECLE   $00C0,  $00E0,  $00CC,  $00CC   ; F561   00C0 00E0 00CC 00CC
        DECLE   $00C6,  $00C6,  $0073,  $0000   ; F565   00C6 00C6 0073 0000
        DECLE   $0020,  $0020,  $0040,  $0040   ; F569   0020 0020 0040 0040
        DECLE   $0080,  $0080,  $0000,  $0000   ; F56D   0080 0080 0000 0000
        DECLE   $000C,  $000B,  $000A,  $0009   ; F571   000C 000B 000A 0009
        DECLE   $0008,  $0007,  $0006,  $0005   ; F575   0008 0007 0006 0005
        DECLE   $0004,  $000C,  $000B,  $000A   ; F579   0004 000C 000B 000A
        DECLE   $0009,  $0008,  $0007,  $0006   ; F57D   0009 0008 0007 0006
        DECLE   $0005,  $0004                   ; F581   0005 0004

        COMR    R3                              ; F583   001B
        COMR    R3                              ; F584   001B
        COMR    R4                              ; F585   001C
        COMR    R4                              ; F586   001C
        COMR    R4                              ; F587   001C
        COMR    R4                              ; F588   001C
        COMR    R5                              ; F589   001D
        COMR    R5                              ; F58A   001D
        COMR    R5                              ; F58B   001D
        COMR    R3                              ; F58C   001B
        COMR    R3                              ; F58D   001B
        COMR    R3                              ; F58E   001B
        COMR    R4                              ; F58F   001C
        COMR    R4                              ; F590   001C
        COMR    R5                              ; F591   001D
        COMR    R5                              ; F592   001D
        COMR    R5                              ; F593   001D
        COMR    R5                              ; F594   001D
        COMR    R1                              ; F595   0019
        COMR    R1                              ; F596   0019
        COMR    R2                              ; F597   001A
        COMR    R2                              ; F598   001A
        COMR    R2                              ; F599   001A
        COMR    R2                              ; F59A   001A
        COMR    R3                              ; F59B   001B
        COMR    R3                              ; F59C   001B
        COMR    R3                              ; F59D   001B
L_F59E:
        DECR    R7                              ; F59E   0017
L_F59F:
        DECR    R7                              ; F59F   0017
L_F5A0:
        DECR    R7                              ; F5A0   0017

        DECLE   $0018,  $0018,  $0019,  $0019   ; F5A1   0018 0018 0019 0019
        DECLE   $0019,  $0019,  $000C,  $000B   ; F5A5   0019 0019 000C 000B
        DECLE   $000A,  $0009,  $0008,  $0007   ; F5A9   000A 0009 0008 0007
        DECLE   $0006,  $0005,  $0004,  $000C   ; F5AD   0006 0005 0004 000C
        DECLE   $000B,  $000A,  $0009,  $0008   ; F5B1   000B 000A 0009 0008
        DECLE   $0007,  $0006,  $0005,  $0004   ; F5B5   0007 0006 0005 0004
        DECLE   $0003,  $0003,  $0003,  $0004   ; F5B9   0003 0003 0003 0004
        DECLE   $0004,  $0004,  $0005,  $0005   ; F5BD   0004 0004 0005 0005
        DECLE   $0006,  $0004,  $0005,  $0005   ; F5C1   0006 0004 0005 0005
        DECLE   $0005,  $0006,  $0006,  $0007   ; F5C5   0005 0006 0006 0007
        DECLE   $0007,  $0008,  $0000,  $0000   ; F5C9   0007 0008 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; F5CD   0000 0001 0001 0001

        DIS                                     ; F5D1   0003
        DIS                                     ; F5D2   0003
L_F5D3:
        DIS                                     ; F5D3   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5D8   0000 0000 0000 0000
        DECLE   $0000,  $0037,  $0037,  $0037   ; F5DC   0000 0037 0037 0037
        DECLE   $0037,  $0037,  $0037,  $0037   ; F5E0   0037 0037 0037 0037
        DECLE   $0037,  $0037,  $0037,  $0037   ; F5E4   0037 0037 0037 0037
        DECLE   $0037,  $0037,  $0037,  $0037   ; F5E8   0037 0037 0037 0037
        DECLE   $0037,  $0037,  $0037           ; F5EC   0037 0037 0037

        CLRC                                    ; F5EF   0006
        INCR    R0                              ; F5F0   0008
        INCR    R1                              ; F5F1   0009
        INCR    R2                              ; F5F2   000A
        INCR    R4                              ; F5F3   000C
        INCR    R6                              ; F5F4   000E
        INCR    R7                              ; F5F5   000F

        DECR    R0                              ; F5F6   0010
L_F5F7:
        DECR    R2                              ; F5F7   0012
        CLRC                                    ; F5F8   0006
        INCR    R0                              ; F5F9   0008
        INCR    R1                              ; F5FA   0009
        INCR    R2                              ; F5FB   000A
        INCR    R4                              ; F5FC   000C
        INCR    R6                              ; F5FD   000E
        INCR    R7                              ; F5FE   000F

        DECR    R0                              ; F5FF   0010
L_F600:
        DECR    R2                              ; F600   0012
        DECR    R4                              ; F601   0014
        DECR    R5                              ; F602   0015
        DECR    R6                              ; F603   0016
        COMR    R0                              ; F604   0018
        COMR    R1                              ; F605   0019
        COMR    R2                              ; F606   001A
        COMR    R4                              ; F607   001C
        COMR    R5                              ; F608   001D
        COMR    R6                              ; F609   001E
        DECR    R4                              ; F60A   0014
        DECR    R5                              ; F60B   0015
        DECR    R6                              ; F60C   0016
        COMR    R0                              ; F60D   0018
        COMR    R1                              ; F60E   0019
        COMR    R2                              ; F60F   001A
        COMR    R4                              ; F610   001C
        COMR    R5                              ; F611   001D
        COMR    R6                              ; F612   001E
        RSWD    R4                              ; F613   003C
        GSWD    R2                              ; F614   0032
        ADCR    R0                              ; F615   0028
        COMR    R6                              ; F616   001E
        COMR    R1                              ; F617   0019
        DECR    R4                              ; F618   0014
        DECR    R0                              ; F619   0010
        INCR    R6                              ; F61A   000E
        INCR    R2                              ; F61B   000A
        DECR    R6                              ; F61C   0016
        DECR    R4                              ; F61D   0014
        DECR    R2                              ; F61E   0012
        INCR    R7                              ; F61F   000F

        INCR    R5                              ; F620   000D
L_F621:
        INCR    R2                              ; F621   000A
        DECLE   $0008,  $0006,  $0004           ; F622   0008 0006 0004

        MVI@    R5,     R0                      ; F625   02A8
        PSHR    R5                              ; F626   0275
        SDBD                                    ; F627   0001
        MVII    #$A571, R5                      ; F628   02BD 0071 00A5
        PSHR    R0                              ; F62B   0270
        ADDR    R0,     R5                      ; F62C   00C5
        SLL     R0,     2                       ; F62D   004C
        SLL     R0,     1                       ; F62E   0048
        ADDR    R0,     R5                      ; F62F   00C5
        PULR    R0                              ; F630   02B0
        ANDI    #$0001, R0                      ; F631   03B8 0001
        XOR     G_015E, R0                      ; F633   03C0 015E
        BNEQ    L_F63B                          ; F635   020C 0004

        ADD     G_01D0, R5                      ; F637   02C5 01D0
        B       L_F63D                          ; F639   0200 0002

L_F63B:
        ADD     G_01D1, R5                      ; F63B   02C5 01D1
L_F63D:
        MVI@    R5,     R0                      ; F63D   02A8
        PULR    R7                              ; F63E   02B7

        DECLE   $0275,  $0270,  $02B8,  $0005   ; F63F   0275 0270 02B8 0005
        DECLE   $0379,  $031D,  $0204,  $000C   ; F643   0379 031D 0204 000C
        DECLE   $02B8,  $0004,  $0379,  $033D   ; F647   02B8 0004 0379 033D
        DECLE   $0204,  $0006,  $02B8,  $0003   ; F64B   0204 0006 02B8 0003
        DECLE   $020B,  $0002,  $02B8,  $0002   ; F64F   020B 0002 02B8 0002
        DECLE   $0004                           ; F653   0004

        ANDR    R4,     R4                      ; F654   01A4
        BLE     L_F5D3                          ; F655   0226 0083

        PULR    R0                              ; F657   02B0
        PULR    R7                              ; F658   02B7

        DECLE   $0275,  $02B8,  $0007,  $0379   ; F659   0275 02B8 0007 0379
        DECLE   $031D,  $0204,  $000C,  $02B8   ; F65D   031D 0204 000C 02B8
        DECLE   $0006,  $0379,  $033D,  $0204   ; F661   0006 0379 033D 0204
        DECLE   $0006,  $02B8,  $0001,  $020B   ; F665   0006 02B8 0001 020B
        DECLE   $0002,  $02B8,  $0000,  $0004   ; F669   0002 02B8 0000 0004

        ANDR    R4,     R4                      ; F66D   01A4
        BLE     L_F3B8                          ; F66E   0226 02B7

        PSHR    R5                              ; F670   0275
        MVI     .STIC.MODE,R0                   ; F671   0280 0021
        MVI     G_0105, R0                      ; F673   0280 0105
        ANDI    #$0001, R0                      ; F675   03B8 0001
        BEQ     L_F67B                          ; F677   0204 0002

        MVO     R0,     .STIC.MODE              ; F679   0240 0021
L_F67B:
        MVI     G_01E4, R1                      ; F67B   0281 01E4
        MVII    #$0001, R4                      ; F67D   02BC 0001
        MVI     G_015D, R0                      ; F67F   0280 015D
        CMPI    #$000C, R0                      ; F681   0378 000C
        BLT     L_F687                          ; F683   0205 0002

        DECR    R4                              ; F685   0014
        CLRR    R1                              ; F686   01C9
L_F687:
        MVO     R4,     .STIC.EDGE              ; F687   0244 0032
        MVO     R1,     .STIC.HDLY              ; F689   0241 0030
        MVI     G_01C4, R4                      ; F68B   0284 01C4
        ADDR    R4,     R4                      ; F68D   00E4
        BEQ     L_F6B1                          ; F68E   0204 0021

        SDBD                                    ; F690   0001
        ADDI    #$A3C7, R4                      ; F691   02FC 00C7 00A3
        SDBD                                    ; F694   0001
        MVI@    R4,     R5                      ; F695   02A5
        MVO     R6,     G_031C                  ; F696   0246 031C
        SDBD                                    ; F698   0001
        MVII    #$10EF, R1                      ; F699   02B9 00EF 0010
        MVI@    R1,     R1                      ; F69C   0289
        CMPI    #$0004, R1                      ; F69D   0379 0004
        BNEQ    L_F6A3                          ; F69F   020C 0002

        MVII    #$0200, R6                      ; F6A1   02BE 0200

L_F6A3:
        JSRD    R4,     X_NEW_GRAM_INIT         ; F6A3   0004 001E 0335

        MVII    #$00F0, R0                      ; F6A6   02B8 00F0
        MVII    #$0200, R4                      ; F6A8   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F6AA   0004 0114 0338

        CLRR    R0                              ; F6AD   01C0
        MVO     R0,     G_01C4                  ; F6AE   0240 01C4
        EIS                                     ; F6B0   0002
L_F6B1:
        PULR    R5                              ; F6B1   02B5
        MVII    #$01C2, R4                      ; F6B2   02BC 01C2
        SDBD                                    ; F6B4   0001
        MVI@    R4,     R7                      ; F6B5   02A7

        PSHR    R5                              ; F6B6   0275
        MVI     G_0166, R0                      ; F6B7   0280 0166
        DECR    R0                              ; F6B9   0010
        BPL     L_F6BE                          ; F6BA   0203 0002

        MVII    #$0050, R0                      ; F6BC   02B8 0050
L_F6BE:
        MVO     R0,     G_0166                  ; F6BE   0240 0166
        BPL     L_F714                          ; F6C0   0203 0052

        MVII    #$0200, R4                      ; F6C2   02BC 0200
        MVII    #$0078, R0                      ; F6C4   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; F6C6   0004 0114 0338

        MVI     G_0165, R5                      ; F6C9   0285 0165
        DECR    R5                              ; F6CB   0015
        BPL     L_F6E2                          ; F6CC   0203 0014

        MVI     G_017B, R5                      ; F6CE   0285 017B
        CMPI    #$0004, R5                      ; F6D0   037D 0004
        BEQ     L_F6E0                          ; F6D2   0204 000C

        MVI     G_01C6, R5                      ; F6D4   0285 01C6
        ANDI    #$000C, R5                      ; F6D6   03BD 000C
        CMPI    #$000C, R5                      ; F6D8   037D 000C
        BNEQ    L_F6E0                          ; F6DA   020C 0004

        MVO     R6,     G_0164                  ; F6DC   0246 0164
        B       L_F714                          ; F6DE   0200 0034

L_F6E0:
        MVII    #$0002, R5                      ; F6E0   02BD 0002
L_F6E2:
        MVO     R5,     G_0165                  ; F6E2   0245 0165
        ADDR    R5,     R5                      ; F6E4   00ED
        PSHR    R5                              ; F6E5   0275
        ADDR    R5,     R5                      ; F6E6   00ED
        ADD@    R6,     R5                      ; F6E7   02F5
        ADDR    R7,     R5                      ; F6E8   00FD
        ADDI    #$002C, R5                      ; F6E9   02FD 002C
        SDBD                                    ; F6EB   0001
        MVI@    R5,     R4                      ; F6EC   02AC
        PSHR    R5                              ; F6ED   0275
        MOVR    R7,     R5                      ; F6EE   00BD
        ADDI    #$0003, R5                      ; F6EF   02FD 0003
        MOVR    R4,     R7                      ; F6F1   00A7

        DECLE   $02B5,  $0001,  $02AC,  $0275   ; F6F2   02B5 0001 02AC 0275
        DECLE   $01C9,  $0004                   ; F6F6   01C9 0004

        ANDR    R5,     R0                      ; F6F8   01A8
        ADDR    R3,     R7                      ; F6F9   00DF

        PULR    R4                              ; F6FA   02B4
        SDBD                                    ; F6FB   0001
        MVI@    R4,     R5                      ; F6FC   02A5
L_F6FD:
        MVI@    R5,     R4                      ; F6FD   02AC
        TSTR    R4                              ; F6FE   00A4
        BEQ     L_F714                          ; F6FF   0204 0013

        MVI@    R4,     R0                      ; F701   02A0
        MVI@    R5,     R1                      ; F702   02A9
        SWAP    R1,     2                       ; F703   0045
        BPL     L_F709                          ; F704   0203 0003

        DECR    R4                              ; F706   0014
        SDBD                                    ; F707   0001
        MVI@    R4,     R0                      ; F708   02A0
L_F709:
        ANDI    #$0007, R1                      ; F709   03B9 0007
        MVI@    R5,     R3                      ; F70B   02AB
        MVI@    R5,     R4                      ; F70C   02AC
        PSHR    R5                              ; F70D   0275

        JSR     R5,     X_PRNUM_RGT             ; F70E   0004 0118 00C5

        PULR    R5                              ; F711   02B5
        B       L_F6FD                          ; F712   0220 0016
L_F714:
        PULR    R7                              ; F714   02B7

        SLLC    R0,     2                       ; F715   005C
        MOVR    R4,     R7                      ; F716   00A7

        ADDR    R0,     R0                      ; F717   00C0
        MOVR    R4,     R7                      ; F718   00A7

        RLC     R3,     1                       ; F719   0053
        MOVR    R5,     R0                      ; F71A   00A8
        RRC     R3,     1                       ; F71B   0073
        MOVR    R4,     R7                      ; F71C   00A7

        MOVR    R0,     R5                      ; F71D   0085
        MOVR    R4,     R7                      ; F71E   00A7

        DECLE   $0032,  $00A8,  $0027           ; F71F   0032 00A8 0027

        MOVR    R4,     R7                      ; F722   00A7

        RRC     R0,     2                       ; F723   0074
        MOVR    R4,     R7                      ; F724   00A7

        ADCR    R1                              ; F725   0029
        MOVR    R5,     R0                      ; F726   00A8
        PSHR    R5                              ; F727   0275
        CLRR    R1                              ; F728   01C9
        MVI     G_017B, R0                      ; F729   0280 017B
        CMPI    #$0004, R0                      ; F72B   0378 0004
        BEQ     L_F74E                          ; F72D   0204 001F

        CMPI    #$0002, R0                      ; F72F   0378 0002
        BNEQ    L_F739                          ; F731   020C 0006

        MVI     G_0163, R0                      ; F733   0280 0163
        CMPI    #$000F, R0                      ; F735   0378 000F
        BEQ     L_F755                          ; F737   0204 001C

L_F739:
        MOVR    R7,     R4                      ; F739   00BC
        DECLE   $02FC,  $00A6,  $0004           ; F73A   02FC 00A6 0004

        ANDR    R5,     R0                      ; F73D   01A8
        ADDR    R3,     R7                      ; F73E   00DF

        MVI     G_017B, R0                      ; F73F   0280 017B
        MVII    #$0250, R4                      ; F741   02BC 0250
        MVII    #$0007, R3                      ; F743   02BB 0007

        JSR     R5,     L_55CC                  ; F745   0004 0154 01CC

        MVII    #$025E, R4                      ; F748   02BC 025E

        JSR     R5,     L_5601                  ; F74A   0004 0154 0201

        PULR    R7                              ; F74D   02B7

L_F74E:
        MOVR    R7,     R4                      ; F74E   00BC
        DECLE   $02FC,  $00AF,  $0004           ; F74F   02FC 00AF 0004

        ANDR    R5,     R0                      ; F752   01A8
        ADDR    R3,     R7                      ; F753   00DF
        PULR    R7                              ; F754   02B7

L_F755:
        MOVR    R7,     R4                      ; F755   00BC
        DECLE   $02FC,  $00B4,  $0004           ; F756   02FC 00B4 0004

        ANDR    R5,     R0                      ; F759   01A8
        ADDR    R3,     R7                      ; F75A   00DF
        PULR    R7                              ; F75B   02B7

        MVII    #$01D8, R4                      ; F75C   02BC 01D8
        SDBD                                    ; F75E   0001
        MVI@    R4,     R0                      ; F75F   02A0
        SDBD                                    ; F760   0001
        MVI@    R4,     R1                      ; F761   02A1
        MVII    #$01DC, R4                      ; F762   02BC 01DC
        SDBD                                    ; F764   0001
        ADD@    R4,     R0                      ; F765   02E0
        SDBD                                    ; F766   0001
        ADD@    R4,     R1                      ; F767   02E1
        MVO     R0,     G_019D                  ; F768   0240 019D
        SWAP    R0,     1                       ; F76A   0040
        MVO     R0,     G_019E                  ; F76B   0240 019E
        NOP                                     ; F76D   0034
        MVO     R1,     G_019F                  ; F76E   0241 019F
        SWAP    R1,     1                       ; F770   0041
        MVO     R1,     G_01A0                  ; F771   0241 01A0
        MOVR    R5,     R7                      ; F773   00AF

        DECLE   $0001,  $0015,  $0048,  $004F   ; F774   0001 0015 0048 004F
        DECLE   $004D,  $0045,  $0002,  $0002   ; F778   004D 0045 0002 0002
        DECLE   $0029,  $0056,  $0049,  $0053   ; F77C   0029 0056 0049 0053
        DECLE   $0049,  $0054,  $004F,  $0052   ; F780   0049 0054 004F 0052
        DECLE   $0000,  $0003,  $0014,  $0046   ; F784   0000 0003 0014 0046
        DECLE   $0049,  $0052,  $0053,  $0054   ; F788   0049 0052 0053 0054
        DECLE   $0020,  $0044,  $004F,  $0057   ; F78C   0020 0044 004F 0057
        DECLE   $004E,  $0053,  $0001,  $0028   ; F790   004E 0053 0001 0028
        DECLE   $0049,  $004E,  $0054,  $0045   ; F794   0049 004E 0054 0045
        DECLE   $0052,  $0043,  $0045,  $0050   ; F798   0052 0043 0045 0050
        DECLE   $0054,  $0049,  $004F,  $004E   ; F79C   0054 0049 004F 004E
        DECLE   $0053,  $0001,  $0050,  $0050   ; F7A0   0053 0001 0050 0050
        DECLE   $0041,  $0053,  $0053,  $0020   ; F7A4   0041 0053 0053 0020
        DECLE   $0041,  $0054,  $0054,  $0045   ; F7A8   0041 0054 0054 0045
        DECLE   $004D,  $0050,  $0054,  $0053   ; F7AC   004D 0050 0054 0053
        DECLE   $0001,  $0064,  $0050,  $0041   ; F7B0   0001 0064 0050 0041
        DECLE   $0053,  $0053,  $0020,  $0043   ; F7B4   0053 0053 0020 0043
        DECLE   $004F,  $004D,  $0050,  $004C   ; F7B8   004F 004D 0050 004C
        DECLE   $0045,  $0054,  $0045,  $0000   ; F7BC   0045 0054 0045 0000
        DECLE   $0003,  $0014,  $0054,  $004F   ; F7C0   0003 0014 0054 004F
        DECLE   $0054,  $0041,  $004C,  $0020   ; F7C4   0054 0041 004C 0020
        DECLE   $0059,  $0041,  $0052,  $0044   ; F7C8   0059 0041 0052 0044
        DECLE   $0053,  $0001,  $002A,  $0052   ; F7CC   0053 0001 002A 0052
        DECLE   $0055,  $0053,  $0048,  $0049   ; F7D0   0055 0053 0048 0049
        DECLE   $004E,  $0047,  $0001,  $003E   ; F7D4   004E 0047 0001 003E
        DECLE   $0050,  $0041,  $0053,  $0053   ; F7D8   0050 0041 0053 0053
        DECLE   $0049,  $004E,  $0047,  $0000   ; F7DC   0049 004E 0047 0000
        DECLE   $0003,  $0054,  $0051,  $0055   ; F7E0   0003 0054 0051 0055
        DECLE   $0041,  $0052,  $0054,  $0045   ; F7E4   0041 0052 0054 0045
        DECLE   $0052,  $0001,  $00B5,  $002E   ; F7E8   0052 0001 00B5 002E
        DECLE   $002E,  $002E,  $0050,  $0052   ; F7EC   002E 002E 0050 0052
        DECLE   $0045,  $0053,  $0053,  $0001   ; F7F0   0045 0053 0053 0001
        DECLE   $00C9,  $0045,  $004E,  $0054   ; F7F4   00C9 0045 004E 0054
        DECLE   $0045,  $0052,  $002E,  $002E   ; F7F8   0045 0052 002E 002E
        DECLE   $002E,  $0000,  $0003,  $0051   ; F7FC   002E 0000 0003 0051
        DECLE   $0047,  $0041,  $004D,  $0045   ; F800   0047 0041 004D 0045
        DECLE   $0020,  $004F,  $0056,  $0045   ; F804   0020 004F 0056 0045
        DECLE   $0052,  $0000,  $0003,  $0051   ; F808   0052 0000 0003 0051
        DECLE   $0048,  $0041,  $004C,  $0046   ; F80C   0048 0041 004C 0046
        DECLE   $0054,  $0049,  $004D,  $0045   ; F810   0054 0049 004D 0045
        DECLE   $0001,  $00B5,  $002E,  $002E   ; F814   0001 00B5 002E 002E
        DECLE   $002E,  $0050,  $0052,  $0045   ; F818   002E 0050 0052 0045
        DECLE   $0053,  $0053,  $0001,  $00C9   ; F81C   0053 0053 0001 00C9
        DECLE   $0045,  $004E,  $0054,  $0045   ; F820   0045 004E 0054 0045
        DECLE   $0052,  $002E,  $002E,  $002E   ; F824   0052 002E 002E 002E
        DECLE   $0000,  $017A,  $0003,  $0002   ; F828   0000 017A 0003 0002
        DECLE   $021D,  $0179,  $0003,  $0001   ; F82C   021D 0179 0003 0001
        DECLE   $0231,  $0000,  $01E1,  $0003   ; F830   0231 0000 01E1 0003
        DECLE   $0002,  $0221,  $01E0,  $0003   ; F834   0002 0221 01E0 0003
        DECLE   $0001,  $0225,  $01D7,  $0003   ; F838   0001 0225 01D7 0003
        DECLE   $0002,  $0235,  $01D6,  $0003   ; F83C   0002 0235 01D6 0003
        DECLE   $0001,  $0239,  $01D3,  $0003   ; F840   0001 0239 01D3 0003
        DECLE   $0002,  $025D,  $01D2,  $0003   ; F844   0002 025D 01D2 0003
        DECLE   $0001,  $0261,  $01D5,  $0003   ; F848   0001 0261 01D5 0003
        DECLE   $0002,  $0271,  $01D4,  $0003   ; F84C   0002 0271 01D4 0003
        DECLE   $0001,  $0275,  $0000,  $019F   ; F850   0001 0275 0000 019F
        DECLE   $0084,  $0002,  $021F,  $019D   ; F854   0084 0002 021F 019D
        DECLE   $0084,  $0001,  $0224,  $01DE   ; F858   0084 0001 0224 01DE
        DECLE   $0084,  $0002,  $0233,  $01DC   ; F85C   0084 0002 0233 01DC
        DECLE   $0084,  $0001,  $0238,  $01DA   ; F860   0084 0001 0238 01DA
        DECLE   $0084,  $0002,  $0247,  $01D8   ; F864   0084 0002 0247 01D8
        DECLE   $0084,  $0001,  $024C,  $0000   ; F868   0084 0001 024C 0000

        PSHR    R5                              ; F86C   0275
        PSHR    R2                              ; F86D   0272
        MVI     .ISRVEC.0,R1                    ; F86E   0281 0100
        MVI     .ISRVEC.1,R2                    ; F870   0282 0101
        MOVR    R7,     R0                      ; F872   00B8
        ADDI    #$0008, R0                      ; F873   02F8 0008
        MVO     R0,     .ISRVEC.0               ; F875   0240 0100
        SWAP    R0,     1                       ; F877   0040
        MVO     R0,     .ISRVEC.1               ; F878   0240 0101
L_F87A:
        DECR    R7                              ; F87A   0017

        SUBI    #$0008, R6                      ; F87B   033E 0008
        MVO     R1,     .ISRVEC.0               ; F87D   0241 0100
        MVO     R2,     .ISRVEC.1               ; F87F   0242 0101
        PULR    R2                              ; F881   02B2
        PULR    R7                              ; F882   02B7

        SDBD                                    ; F883   0001
        MVI@    R5,     R0                      ; F884   02A8
        MVO     R0,     .ISRVEC.0               ; F885   0240 0100
        SWAP    R0,     1                       ; F887   0040
        MVO     R0,     .ISRVEC.1               ; F888   0240 0101
        MOVR    R5,     R7                      ; F88A   00AF

        MVII    #$0001, R2                      ; F88B   02BA 0001
        B       L_F890                          ; F88D   0200 0001

        CLRR    R2                              ; F88F   01D2
L_F890:
        PSHR    R5                              ; F890   0275
        DECLE   $0004,  $01A8,  $006C,  $0242   ; F891   0004 01A8 006C 0242
        DECLE   $0028,  $0242,  $002C,  $0242   ; F895   0028 0242 002C 0242
        DECLE   $0106,  $01D2,  $0242,  $0105   ; F899   0106 01D2 0242 0105
        DECLE   $0282,  $0021,  $0242,  $0020   ; F89D   0282 0021 0242 0020
        DECLE   $0004,  $01A8,  $00CA,  $0004   ; F8A1   0004 01A8 00CA 0004

        ANDR    R5,     R0                      ; F8A5   01A8
        ADDR    R0,     R1                      ; F8A6   00C1
        PULR    R7                              ; F8A7   02B7

        DECLE   $0275,  $0004,  $01A8,  $006C   ; F8A8   0275 0004 01A8 006C
        DECLE   $0242,  $002C,  $0242,  $0106   ; F8AC   0242 002C 0242 0106
        DECLE   $01D2,  $0242,  $0030,  $000A   ; F8B0   01D2 0242 0030 000A
        DECLE   $0242,  $0105,  $0242,  $0021   ; F8B4   0242 0105 0242 0021
        DECLE   $0242,  $0020,  $0004,  $01A8   ; F8B8   0242 0020 0004 01A8
        DECLE   $00CA,  $0004                   ; F8BC   00CA 0004

        ANDR    R5,     R0                      ; F8BE   01A8
        ADDR    R0,     R1                      ; F8BF   00C1
        PULR    R7                              ; F8C0   02B7

        PSHR    R5                              ; F8C1   0275
        MVII    #$00F0, R0                      ; F8C2   02B8 00F0
        MVII    #$0200, R4                      ; F8C4   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F8C6   0004 0114 0338

        PULR    R7                              ; F8C9   02B7

        PSHR    R5                              ; F8CA   0275
        MVII    #$0018, R0                      ; F8CB   02B8 0018
        CLRR    R4                              ; F8CD   01E4

        JSR     R5,     X_FILL_ZERO             ; F8CE   0004 0114 0338
        JSR     R5,     .EXEC.7B3               ; F8D1   0004 0114 03B3

        PULR    R7                              ; F8D4   02B7

        MVI@    R5,     R0                      ; F8D5   02A8
        PSHR    R5                              ; F8D6   0275
        MVO     R0,     G_01C4                  ; F8D7   0240 01C4
L_F8D9:
        MVI     G_01C4, R0                      ; F8D9   0280 01C4
        TSTR    R0                              ; F8DB   0080
        BNEQ    L_F8D9                          ; F8DC   022C 0004
        PULR    R7                              ; F8DE   02B7

        PSHR    R5                              ; F8DF   0275
L_F8E0:
        MOVR    R1,     R3                      ; F8E0   008B
        SLL     R3,     2                       ; F8E1   004F
        ADD@    R4,     R3                      ; F8E2   02E3
        ADDR    R7,     R3                      ; F8E3   00FB
        ADDI    #$0049, R3                      ; F8E4   02FB 0049
        MVI@    R3,     R3                      ; F8E6   029B
        MOVR    R3,     R5                      ; F8E7   009D
        ANDI    #$0007, R5                      ; F8E8   03BD 0007
        ANDI    #$0010, R3                      ; F8EA   03BB 0010
        SWAP    R3,     1                       ; F8EC   0043
        XORR    R5,     R3                      ; F8ED   01EB
L_F8EE:
        MOVR    R7,     R5                      ; F8EE   00BD
        ADDI    #$003C, R5                      ; F8EF   02FD 003C
        ADDR    R1,     R5                      ; F8F1   00CD
        MVI@    R5,     R5                      ; F8F2   02AD
        ADD@    R4,     R5                      ; F8F3   02E5
L_F8F4:
        MVI@    R4,     R0                      ; F8F4   02A0
        SUBI    #$0020, R0                      ; F8F5   0338 0020
        BMI     L_F8FF                          ; F8F7   020B 0006

        SLL     R0,     2                       ; F8F9   004C
        SLL     R0,     1                       ; F8FA   0048
        XORR    R3,     R0                      ; F8FB   01D8
        MVO@    R0,     R5                      ; F8FC   0268
        B       L_F8F4                          ; F8FD   0220 000A

L_F8FF:
        ADDI    #$001F, R0                      ; F8FF   02F8 001F
        BEQ     L_F8EE                          ; F901   0224 0014
        BPL     L_F8E0                          ; F903   0223 0024
        PULR    R7                              ; F905   02B7

        DECLE   $0275,  $0270,  $01C0,  $0004   ; F906   0275 0270 01C0 0004

        ANDR    R5,     R0                      ; F90A   01A8
        SUBR    R1,     R6                      ; F90B   010E
        PULR    R0                              ; F90C   02B0
        PULR    R7                              ; F90D   02B7

        PSHR    R5                              ; F90E   0275
        MOVR    R7,     R5                      ; F90F   00BD
        ADDI    #$001B, R5                      ; F910   02FD 001B
        ADDR    R1,     R5                      ; F912   00CD
        MVI@    R5,     R5                      ; F913   02AD
        MVII    #$000C, R4                      ; F914   02BC 000C
L_F916:
        MVO@    R0,     R5                      ; F916   0268
        MVO@    R0,     R5                      ; F917   0268
        NOP                                     ; F918   0034
        MVO@    R0,     R5                      ; F919   0268
        MVO@    R0,     R5                      ; F91A   0268
        NOP                                     ; F91B   0034
        MVO@    R0,     R5                      ; F91C   0268
        MVO@    R0,     R5                      ; F91D   0268
        NOP                                     ; F91E   0034
        MVO@    R0,     R5                      ; F91F   0268
        MVO@    R0,     R5                      ; F920   0268
        NOP                                     ; F921   0034
        MVO@    R0,     R5                      ; F922   0268
        MVO@    R0,     R5                      ; F923   0268
        NOP                                     ; F924   0034
        ADDI    #$000A, R5                      ; F925   02FD 000A
        DECR    R4                              ; F927   0014
        BNEQ    L_F916                          ; F928   022C 0013
        PULR    R7                              ; F92A   02B7

        DECLE   $0200,  $020A,  $0002,  $0002   ; F92B   0200 020A 0002 0002
        DECLE   $0001,  $0007,  $0001,  $0002   ; F92F   0001 0007 0001 0002
        DECLE   $0001                           ; F933   0001

        SETC                                    ; F934   0007
        CMP@    R5,     R0                      ; F935   0368
        BLT     L_F93D                          ; F936   0205 0005

        CMP@    R5,     R0                      ; F938   0368
        BGT     L_F93E                          ; F939   020E 0003

        CLRC                                    ; F93B   0006
        MOVR    R5,     R7                      ; F93C   00AF

L_F93D:
        INCR    R5                              ; F93D   000D
L_F93E:
        SETC                                    ; F93E   0007
        MOVR    R5,     R7                      ; F93F   00AF

        DECLE   $0004                           ; F940   0004

        ANDR    R5,     R0                      ; F941   01A8
        SAR     R0,     2                       ; F942   006C
        MVII    #$0028, R0                      ; F943   02B8 0028
        MVII    #$0000, R4                      ; F945   02BC 0000

        JSR     R5,     X_FILL_ZERO             ; F947   0004 0114 0338
        DECLE   $00B8,  $02F8,  $0080,  $0240   ; F94A   00B8 02F8 0080 0240
        DECLE   $031D,  $01C0,  $0240,  $01E0   ; F94E   031D 01C0 0240 01E0
        DECLE   $0240,  $01DC,  $0004           ; F952   0240 01DC 0004

        ANDR    R5,     R0                      ; F955   01A8
        MOVR    R1,     R7                      ; F956   008F

        DECLE   $0004                           ; F957   0004

        ANDR    R5,     R0                      ; F958   01A8
        MOVR    R0,     R3                      ; F959   0083
        RRC     R0,     1                       ; F95A   0070
        MOVR    R5,     R1                      ; F95B   00A9
        EIS                                     ; F95C   0002
L_F95D:
        MVI     .PSG0.rgt_hand,R0               ; F95D   0280 01FE
        AND     .PSG0.lft_hand,R0               ; F95F   0380 01FF
        CMPI    #$00FF, R0                      ; F961   0378 00FF
        BEQ     L_F95D                          ; F963   0224 0007

L_F965:
        MVI     .PSG0.rgt_hand,R0               ; F965   0280 01FE
        AND     .PSG0.lft_hand,R0               ; F967   0380 01FF
        CMPI    #$00FF, R0                      ; F969   0378 00FF
        BNEQ    L_F965                          ; F96B   022C 0007
        J       X_RESET                         ; F96D   0004 0310 0000

        PSHR    R5                              ; F970   0275
        MVII    #$0002, R0                      ; F971   02B8 0002
        MVO     R0,     .STIC.EDGE              ; F973   0240 0032
        MVO     R0,     .STIC.VIDEN             ; F975   0240 0020
        MVI     G_01E0, R0                      ; F977   0280 01E0
        DECR    R0                              ; F979   0010
        MVO     R0,     G_01E0                  ; F97A   0240 01E0
        BPL     L_F9CA                          ; F97C   0203 004C

        MVII    #$0002, R0                      ; F97E   02B8 0002
        MVII    #$0001, R0                      ; F980   02B8 0001
        MVO     R0,     G_01E0                  ; F982   0240 01E0
        MVI     G_01DC, R0                      ; F984   0280 01DC
        DECR    R0                              ; F986   0010
        MVO     R0,     G_01DC                  ; F987   0240 01DC
        MVO     R0,     .STIC.VDLY              ; F989   0240 0031
        BPL     L_F9CA                          ; F98B   0203 003D

        MVII    #$0007, R0                      ; F98D   02B8 0007
        MVO     R0,     G_01DC                  ; F98F   0240 01DC
        MVII    #$0214, R4                      ; F991   02BC 0214
        MVII    #$0200, R5                      ; F993   02BD 0200
        MVII    #$000B, R2                      ; F995   02BA 000B
L_F997:
        MVII    #$0014, R3                      ; F997   02BB 0014
L_F999:
        MVI@    R4,     R0                      ; F999   02A0
        MVO@    R0,     R5                      ; F99A   0268
        DECR    R3                              ; F99B   0013
        BNEQ    L_F999                          ; F99C   022C 0004

        DECR    R2                              ; F99E   0012
        BNEQ    L_F997                          ; F99F   022C 0009

        CLRR    R0                              ; F9A1   01C0
        MVII    #$0014, R3                      ; F9A2   02BB 0014
L_F9A4:
        MVO@    R0,     R5                      ; F9A4   0268
        DECR    R3                              ; F9A5   0013
        BNEQ    L_F9A4                          ; F9A6   022C 0003

        MVI     G_031D, R5                      ; F9A8   0285 031D
        MVI@    R5,     R4                      ; F9AA   02AC
        CMPI    #$0001, R4                      ; F9AB   037C 0001
        BLT     L_F9C8                          ; F9AD   0205 0019
        BEQ     L_F9C5                          ; F9AF   0204 0014

        MVI@    R5,     R3                      ; F9B1   02AB
        CMPI    #$002F, R3                      ; F9B2   037B 002F
        BNEQ    L_F9BA                          ; F9B4   020C 0004

        SDBD                                    ; F9B6   0001
        MVII    #$1000, R3                      ; F9B7   02BB 0000 0010
L_F9BA:
        MVI@    R5,     R0                      ; F9BA   02A8
        SUBI    #$0020, R0                      ; F9BB   0338 0020
        BMI     L_F9C8                          ; F9BD   020B 0009

        SLL     R0,     2                       ; F9BF   004C
        SLL     R0,     1                       ; F9C0   0048
        XORR    R3,     R0                      ; F9C1   01D8
        MVO@    R0,     R4                      ; F9C2   0260
        B       L_F9BA                          ; F9C3   0220 000A

L_F9C5:
        SDBD                                    ; F9C5   0001
        MVI@    R5,     R0                      ; F9C6   02A8
        MOVR    R0,     R5                      ; F9C7   0085
L_F9C8:
        MVO     R5,     G_031D                  ; F9C8   0245 031D
L_F9CA:
        PULR    R7                              ; F9CA   02B7

        DECLE   $0000                           ; F9CB   0000

        ADD@    R4,     R4                      ; F9CC   02E4
        ADCR    R7                              ; F9CD   002F

        CMPR    R2,     R0                      ; F9CE   0150
L_F9CF:
        CMPR    R2,     R1                      ; F9CF   0151
        DECLE   $0152,  $0153,  $0000,  $02E2   ; F9D0   0152 0153 0000 02E2
        DECLE   $0007,  $0053,  $0055,  $0050   ; F9D4   0007 0053 0055 0050
        DECLE   $0045,  $0052,  $0000,  $02E7   ; F9D8   0045 0052 0000 02E7
        DECLE   $0007,  $0050,  $0052,  $004F   ; F9DC   0007 0050 0052 004F
        DECLE   $0000,  $02E2,  $0007,  $0046   ; F9E0   0000 02E2 0007 0046
        DECLE   $004F,  $004F,  $0054,  $0042   ; F9E4   004F 004F 0054 0042
        DECLE   $0041,  $004C,  $004C,  $0000   ; F9E8   0041 004C 004C 0000
        DECLE   $0000,  $0000,  $02DD,  $0001   ; F9EC   0000 0000 02DD 0001
        DECLE   $0050,  $0072,  $006F,  $0067   ; F9F0   0050 0072 006F 0067
        DECLE   $0072,  $0061,  $006D,  $006D   ; F9F4   0072 0061 006D 006D
        DECLE   $0065,  $0064,  $0020,  $0042   ; F9F8   0065 0064 0020 0042
        DECLE   $0079,  $003A,  $0000,  $0000   ; F9FC   0079 003A 0000 0000
        DECLE   $02E1,  $0002,  $004A,  $006F   ; FA00   02E1 0002 004A 006F
        DECLE   $0068,  $006E,  $0020,  $0054   ; FA04   0068 006E 0020 0054
        DECLE   $006F,  $006D,  $006C,  $0069   ; FA08   006F 006D 006C 0069
        DECLE   $006E,  $0073,  $006F,  $006E   ; FA0C   006E 0073 006F 006E
        DECLE   $0000,  $02E4,  $0002,  $0044   ; FA10   0000 02E4 0002 0044
        DECLE   $0061,  $0076,  $0065,  $0020   ; FA14   0061 0076 0065 0020
        DECLE   $0057,  $0061,  $0072,  $0068   ; FA18   0057 0061 0072 0068
        DECLE   $006F,  $006C,  $0000,  $0000   ; FA1C   006F 006C 0000 0000
        DECLE   $0000,  $02DD,  $0001,  $0047   ; FA20   0000 02DD 0001 0047
        DECLE   $0072,  $0061,  $0070,  $0068   ; FA24   0072 0061 0070 0068
        DECLE   $0069,  $0063,  $0073,  $0020   ; FA28   0069 0063 0073 0020
        DECLE   $0042,  $0079,  $003A,  $0000   ; FA2C   0042 0079 003A 0000
        DECLE   $0000,  $02E1,  $0002,  $0043   ; FA30   0000 02E1 0002 0043
        DECLE   $006F,  $006E,  $006E,  $0069   ; FA34   006F 006E 006E 0069
        DECLE   $0065,  $0020,  $0047,  $006F   ; FA38   0065 0020 0047 006F
        DECLE   $006C,  $0064,  $006D,  $0061   ; FA3C   006C 0064 006D 0061
        DECLE   $006E,  $0000,  $0000,  $0000   ; FA40   006E 0000 0000 0000
        DECLE   $02DD,  $0001,  $0044,  $0065   ; FA44   02DD 0001 0044 0065
        DECLE   $0073,  $0069,  $0067,  $006E   ; FA48   0073 0069 0067 006E
        DECLE   $0065,  $0064,  $0020,  $0042   ; FA4C   0065 0064 0020 0042
        DECLE   $0079,  $003A,  $0000,  $0000   ; FA50   0079 003A 0000 0000
        DECLE   $02E3,  $0002,  $0052,  $0061   ; FA54   02E3 0002 0052 0061
        DECLE   $0079,  $0020,  $004B,  $0061   ; FA58   0079 0020 004B 0061
        DECLE   $0065,  $0073,  $0074,  $006E   ; FA5C   0065 0073 0074 006E
        DECLE   $0065,  $0072,  $0000,  $02E1   ; FA60   0065 0072 0000 02E1
        DECLE   $0002,  $004A,  $006F,  $0068   ; FA64   0002 004A 006F 0068
        DECLE   $006E,  $0020,  $0054,  $006F   ; FA68   006E 0020 0054 006F
        DECLE   $006D,  $006C,  $0069,  $006E   ; FA6C   006D 006C 0069 006E
        DECLE   $0073,  $006F,  $006E,  $0000   ; FA70   0073 006F 006E 0000
        DECLE   $02E4,  $0002,  $0044,  $0061   ; FA74   02E4 0002 0044 0061
        DECLE   $0076,  $0065,  $0020,  $0057   ; FA78   0076 0065 0020 0057
        DECLE   $0061,  $0072,  $0068,  $006F   ; FA7C   0061 0072 0068 006F
        DECLE   $006C,  $0000,  $0000,  $0000   ; FA80   006C 0000 0000 0000
        DECLE   $02DD,  $0001,  $0054,  $0065   ; FA84   02DD 0001 0054 0065
        DECLE   $0063,  $0068,  $006E,  $0069   ; FA88   0063 0068 006E 0069
        DECLE   $0063,  $0061,  $006C,  $0020   ; FA8C   0063 0061 006C 0020
        DECLE   $0053,  $0075,  $0070,  $0070   ; FA90   0053 0075 0070 0070
        DECLE   $006F,  $0072,  $0074,  $003A   ; FA94   006F 0072 0074 003A
        DECLE   $0000,  $0000,  $02E0,  $0002   ; FA98   0000 0000 02E0 0002
        DECLE   $0053,  $0063,  $006F,  $0074   ; FA9C   0053 0063 006F 0074
        DECLE   $0074,  $0020,  $0052,  $006F   ; FAA0   0074 0020 0052 006F
        DECLE   $0062,  $0069,  $0074,  $0069   ; FAA4   0062 0069 0074 0069
        DECLE   $006C,  $006C,  $0065,  $0000   ; FAA8   006C 006C 0065 0000
        DECLE   $0000,  $0000,  $02DD,  $0001   ; FAAC   0000 0000 02DD 0001
        DECLE   $0050,  $0072,  $006F,  $0064   ; FAB0   0050 0072 006F 0064
        DECLE   $0075,  $0063,  $0065,  $0064   ; FAB4   0075 0063 0065 0064
        DECLE   $0020,  $0042,  $0079,  $003A   ; FAB8   0020 0042 0079 003A
        DECLE   $0000,  $0000,  $02E4,  $0002   ; FABC   0000 0000 02E4 0002
        DECLE   $0044,  $0061,  $0076,  $0065   ; FAC0   0044 0061 0076 0065
        DECLE   $0020,  $0057,  $0061,  $0072   ; FAC4   0020 0057 0061 0072
        DECLE   $0068,  $006F,  $006C,  $0000   ; FAC8   0068 006F 006C 0000
        DECLE   $02DD,  $0001,  $0066,  $006F   ; FACC   02DD 0001 0066 006F
        DECLE   $0072,  $0000,  $02E5,  $0002   ; FAD0   0072 0000 02E5 0002
        DECLE   $0049,  $004E,  $0054,  $0056   ; FAD4   0049 004E 0054 0056
        DECLE   $0020,  $0043,  $006F,  $0072   ; FAD8   0020 0043 006F 0072
        DECLE   $0070,  $002E,  $0000,  $0000   ; FADC   0070 002E 0000 0000
        DECLE   $0000,  $0000                   ; FAE0   0000 0000

        ADD@    R4,     R4                      ; FAE2   02E4
        ADCR    R7                              ; FAE3   002F

        CMPR    R2,     R0                      ; FAE4   0150
L_FAE5:
        CMPR    R2,     R1                      ; FAE5   0151
        DECLE   $0152,  $0153,  $0000,  $02E2   ; FAE6   0152 0153 0000 02E2
        DECLE   $0007,  $0053,  $0055,  $0050   ; FAEA   0007 0053 0055 0050
        DECLE   $0045,  $0052,  $0000,  $02E7   ; FAEE   0045 0052 0000 02E7
        DECLE   $0007,  $0050,  $0052,  $004F   ; FAF2   0007 0050 0052 004F
        DECLE   $0000,  $02E2,  $0007,  $0046   ; FAF6   0000 02E2 0007 0046
        DECLE   $004F,  $004F,  $0054,  $0042   ; FAFA   004F 004F 0054 0042
        DECLE   $0041,  $004C,  $004C,  $0000   ; FAFE   0041 004C 004C 0000
        DECLE   $02DE,  $0001,  $0043,  $006F   ; FB02   02DE 0001 0043 006F
        DECLE   $0070,  $0079,  $0072,  $0069   ; FB06   0070 0079 0072 0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; FB0A   0067 0068 0074 0020
        DECLE   $014B,  $0020,  $0031,  $0039   ; FB0E   014B 0020 0031 0039
        DECLE   $0038,  $0036,  $0000,  $02E1   ; FB12   0038 0036 0000 02E1
        DECLE   $0001,  $0049,  $004E,  $0054   ; FB16   0001 0049 004E 0054
        DECLE   $0056,  $0020,  $0043,  $006F   ; FB1A   0056 0020 0043 006F
        DECLE   $0072,  $0070,  $002E,  $0000   ; FB1E   0072 0070 002E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB2A   0000 0000 0000 0000
        DECLE   $0001                           ; FB2E   0001

        ADDR    R1,     R3                      ; FB2F   00CB
        MOVR    R5,     R1                      ; FB30   00A9
        PSHR    R5                              ; FB31   0275
        MVI     G_015D, R5                      ; FB32   0285 015D
        CMPI    #$000E, R5                      ; FB34   037D 000E
        BNEQ    L_FBC7                          ; FB36   020C 008F

        MVI     G_01A1, R5                      ; FB38   0285 01A1
        DECR    R5                              ; FB3A   0015
        BPL     L_FBC5                          ; FB3B   0203 0088

        MVI     G_034C, R4                      ; FB3D   0284 034C
        MVI     G_0354, R3                      ; FB3F   0283 0354
L_FB41:
        MVI@    R4,     R0                      ; FB41   02A0
        PSHR    R0                              ; FB42   0270
        MOVR    R0,     R5                      ; FB43   0085
        SLR     R0,     2                       ; FB44   0064
        ANDI    #$0007, R5                      ; FB45   03BD 0007
        SLR     R0,     2                       ; FB47   0064
        INCR    R5                              ; FB48   000D
        ADDR    R7,     R5                      ; FB49   00FD
        ADD@    R5,     R7                      ; FB4A   02EF

        INCR    R0                              ; FB4B   0008
        INCR    R0                              ; FB4C   0008
        INCR    R0                              ; FB4D   0008
        SLLC    R0,     1                       ; FB4E   0058
        SLR     R1,     1                       ; FB4F   0061
        RSWD    R2                              ; FB50   003A
        SLR     R1,     2                       ; FB51   0065
        SAR     R2,     1                       ; FB52   006A
        DECR    R4                              ; FB53   0014
        MVI@    R4,     R2                      ; FB54   02A2
        ANDI    #$0003, R2                      ; FB55   03BA 0003
        ADDR    R7,     R2                      ; FB57   00FA
        ADDI    #$0070, R2                      ; FB58   02FA 0070
        MVI@    R2,     R2                      ; FB5A   0292
        MOVR    R0,     R5                      ; FB5B   0085
        ADDR    R7,     R5                      ; FB5C   00FD
        ADDI    #$007A, R5                      ; FB5D   02FD 007A
        MVI@    R5,     R5                      ; FB5F   02AD
        ADDR    R7,     R5                      ; FB60   00FD
        ADDI    #$00A4, R5                      ; FB61   02FD 00A4
        MVII    #$0008, R1                      ; FB63   02B9 0008
L_FB65:
        MVI@    R5,     R0                      ; FB65   02A8
        SUBI    #$0020, R0                      ; FB66   0338 0020
        BMI     L_FB74                          ; FB68   020B 000A

        SLL     R0,     2                       ; FB6A   004C
        SLL     R0,     1                       ; FB6B   0048
        XORR    R3,     R0                      ; FB6C   01D8
        MVO@    R0,     R2                      ; FB6D   0250
        INCR    R2                              ; FB6E   000A
        DECR    R1                              ; FB6F   0011
        BNEQ    L_FB65                          ; FB70   022C 000C
        B       L_FBBA                          ; FB72   0200 0046

L_FB74:
        ADDI    #$0020, R0                      ; FB74   02F8 0020
        BEQ     L_FB80                          ; FB76   0204 0008

L_FB78:
        MVO@    R3,     R2                      ; FB78   0253
        INCR    R2                              ; FB79   000A
        DECR    R1                              ; FB7A   0011
        DECR    R0                              ; FB7B   0010
        BNEQ    L_FB78                          ; FB7C   022C 0005
        B       L_FB65                          ; FB7E   0220 001A

L_FB80:
        MOVR    R7,     R5                      ; FB80   00BD
        ADDI    #$0159, R5                      ; FB81   02FD 0159
        B       L_FB65                          ; FB83   0220 001F

        MOVR    R0,     R5                      ; FB85   0085
        ADDR    R5,     R5                      ; FB86   00ED
        ADDR    R7,     R5                      ; FB87   00FD
        ADDI    #$0043, R5                      ; FB88   02FD 0043
        SDBD                                    ; FB8A   0001
        MVI@    R5,     R1                      ; FB8B   02A9
        MVII    #$0256, R2                      ; FB8C   02BA 0256
L_FB8E:
        MVII    #$0008, R5                      ; FB8E   02BD 0008
L_FB90:
        MVI@    R2,     R0                      ; FB90   0290
        SDBD                                    ; FB91   0001
        ANDI    #$C9F8, R0                      ; FB92   03B8 00F8 00C9
        XORR    R1,     R0                      ; FB95   01C8
        MVO@    R0,     R2                      ; FB96   0250
        INCR    R2                              ; FB97   000A
        DECR    R5                              ; FB98   0015
        BNEQ    L_FB90                          ; FB99   022C 000A

        ADDI    #$000C, R2                      ; FB9B   02FA 000C
        CMPI    #$0286, R2                      ; FB9D   037A 0286
        BLT     L_FB8E                          ; FB9F   0225 0012
        B       L_FBBA                          ; FBA1   0200 0017

        MOVR    R0,     R5                      ; FBA3   0085
        ADDR    R5,     R5                      ; FBA4   00ED
        ADDR    R7,     R5                      ; FBA5   00FD
        ADDI    #$0025, R5                      ; FBA6   02FD 0025
        SDBD                                    ; FBA8   0001
        MVI@    R5,     R3                      ; FBA9   02AB
        B       L_FBBA                          ; FBAA   0200 000E

        MVO     R0,     G_01A2                  ; FBAC   0240 01A2
        B       L_FBBA                          ; FBAE   0200 000A

        SDBD                                    ; FBB0   0001
        MVI@    R4,     R5                      ; FBB1   02A5
        MOVR    R5,     R4                      ; FBB2   00AC
        B       L_FBBA                          ; FBB3   0200 0005

        MOVR    R7,     R5                      ; FBB5   00BD
        ADDI    #$0004, R5                      ; FBB6   02FD 0004
        SDBD                                    ; FBB8   0001
        MVI@    R4,     R7                      ; FBB9   02A7

L_FBBA:
        PULR    R0                              ; FBBA   02B0
        ANDI    #$0008, R0                      ; FBBB   03B8 0008
        BEQ     L_FB41                          ; FBBD   0224 007D

        MVO     R4,     G_034C                  ; FBBF   0244 034C
        MVO     R3,     G_0354                  ; FBC1   0243 0354
        MVI     G_01A2, R5                      ; FBC3   0285 01A2
L_FBC5:
        MVO     R5,     G_01A1                  ; FBC5   0245 01A1
L_FBC7:
        PULR    R7                              ; FBC7   02B7

        DECLE   $0256,  $026A,  $027E,  $0000   ; FBC8   0256 026A 027E 0000
        DECLE   $0000,  $0000,  $0010,  $0007   ; FBCC   0000 0000 0010 0007
        DECLE   $0000,  $0000,  $0026,  $0006   ; FBD0   0000 0000 0026 0006
        DECLE   $0000,  $0000,  $0024,  $0000   ; FBD4   0000 0000 0024 0000
        DECLE   $0002,  $0005                   ; FBD8   0002 0005

        INCR    R1                              ; FBDA   0009
        INCR    R6                              ; FBDB   000E
        DECR    R4                              ; FBDC   0014
        COMR    R3                              ; FBDD   001B
        NEGR    R2                              ; FBDE   0022
        ADCR    R1                              ; FBDF   0029
        ADCR    R7                              ; FBE0   002F

        NOP                                     ; FBE1   0034
L_FBE2:
        RSWD    R0                              ; FBE2   0038
        RSWD    R3                              ; FBE3   003B
        RSWD    R5                              ; FBE4   003D
        SWAP    R0,     1                       ; FBE5   0040
        SWAP    R0,     2                       ; FBE6   0044
        SLL     R1,     1                       ; FBE7   0049
        SLL     R2,     2                       ; FBE8   004E
        RLC     R3,     1                       ; FBE9   0053
        SLLC    R0,     1                       ; FBEA   0058
        SLLC    R1,     2                       ; FBEB   005D
        SLR     R1,     1                       ; FBEC   0061
        SLR     R0,     2                       ; FBED   0064
        SLR     R2,     2                       ; FBEE   0066
        SAR     R1,     1                       ; FBEF   0069
        SAR     R1,     2                       ; FBF0   006D
        RRC     R2,     1                       ; FBF1   0072
        SARC    R0,     1                       ; FBF2   0078
        SARC    R3,     2                       ; FBF3   007F
        MOVR    R0,     R7                      ; FBF4   0087

        DECLE   $0090,  $0099,  $00A1,  $00A8   ; FBF5   0090 0099 00A1 00A8
        DECLE   $00AE,  $00B3,  $00B7           ; FBF9   00AE 00B3 00B7

        MOVR    R7,     R2                      ; FBFC   00BA
        ADDR    R0,     R3                      ; FBFD   00C3
        ADDR    R1,     R4                      ; FBFE   00CC
        ADDR    R2,     R5                      ; FBFF   00D5
        ADDR    R3,     R5                      ; FC00   00DD
        ADDR    R4,     R6                      ; FC01   00E6
        ADDR    R5,     R7                      ; FC02   00EF

        DECLE   $00F8,  $0101,  $0052,  $0000   ; FC03   00F8 0101 0052 0000
        DECLE   $0045,  $0052,  $0000,  $0050   ; FC07   0045 0052 0000 0050
        DECLE   $0045,  $0052,  $0000,  $0055   ; FC0B   0045 0052 0000 0055
        DECLE   $0050,  $0045,  $0052,  $0000   ; FC0F   0050 0045 0052 0000
        DECLE   $0053,  $0055,  $0050,  $0045   ; FC13   0053 0055 0050 0045
        DECLE   $0052,  $0000,  $0001,  $0053   ; FC17   0052 0000 0001 0053
        DECLE   $0055,  $0050,  $0045,  $0052   ; FC1B   0055 0050 0045 0052
        DECLE   $0000,  $0002,  $0053,  $0055   ; FC1F   0000 0002 0053 0055
        DECLE   $0050,  $0045,  $0052,  $0000   ; FC23   0050 0045 0052 0000
        DECLE   $0003,  $0053,  $0055,  $0050   ; FC27   0003 0053 0055 0050
        DECLE   $0045,  $0052,  $0000,  $0004   ; FC2B   0045 0052 0000 0004
        DECLE   $0053,  $0055,  $0050,  $0045   ; FC2F   0053 0055 0050 0045
        DECLE   $0000,  $0005,  $0053,  $0055   ; FC33   0000 0005 0053 0055
        DECLE   $0050,  $0000,  $0006,  $0053   ; FC37   0050 0000 0006 0053
        DECLE   $0055,  $0000,  $0007,  $0053   ; FC3B   0055 0000 0007 0053
        DECLE   $0000,  $004F,  $0000,  $0052   ; FC3F   0000 004F 0000 0052
        DECLE   $004F,  $0000,  $0050,  $0052   ; FC43   004F 0000 0050 0052
        DECLE   $004F,  $0000,  $0001,  $0050   ; FC47   004F 0000 0001 0050
        DECLE   $0052,  $004F,  $0000,  $0002   ; FC4B   0052 004F 0000 0002
        DECLE   $0050,  $0052,  $004F,  $0000   ; FC4F   0050 0052 004F 0000
        DECLE   $0003,  $0050,  $0052,  $004F   ; FC53   0003 0050 0052 004F
        DECLE   $0000,  $0004,  $0050,  $0052   ; FC57   0000 0004 0050 0052
        DECLE   $004F,  $0000,  $0005,  $0050   ; FC5B   004F 0000 0005 0050
        DECLE   $0052,  $004F,  $0000,  $0006   ; FC5F   0052 004F 0000 0006
        DECLE   $0050,  $0052,  $0000,  $0007   ; FC63   0050 0052 0000 0007
        DECLE   $0050,  $0000,  $004C,  $0000   ; FC67   0050 0000 004C 0000
        DECLE   $004C,  $004C,  $0000,  $0041   ; FC6B   004C 004C 0000 0041
        DECLE   $004C,  $004C,  $0000,  $0042   ; FC6F   004C 004C 0000 0042
        DECLE   $0041,  $004C,  $004C,  $0000   ; FC73   0041 004C 004C 0000
        DECLE   $0054,  $0042,  $0041,  $004C   ; FC77   0054 0042 0041 004C
        DECLE   $004C,  $0000,  $004F,  $0054   ; FC7B   004C 0000 004F 0054
        DECLE   $0042,  $0041,  $004C,  $004C   ; FC7F   0042 0041 004C 004C
        DECLE   $0000,  $004F,  $004F,  $0054   ; FC83   0000 004F 004F 0054
        DECLE   $0042,  $0041,  $004C,  $004C   ; FC87   0042 0041 004C 004C
        DECLE   $0000,  $0046,  $004F,  $004F   ; FC8B   0000 0046 004F 004F
        DECLE   $0054,  $0042,  $0041,  $004C   ; FC8F   0054 0042 0041 004C
        DECLE   $004C,  $0000,  $0001,  $0046   ; FC93   004C 0000 0001 0046
        DECLE   $004F,  $004F,  $0054,  $0042   ; FC97   004F 004F 0054 0042
        DECLE   $0041,  $004C,  $0000,  $0002   ; FC9B   0041 004C 0000 0002
        DECLE   $0046,  $004F,  $004F,  $0054   ; FC9F   0046 004F 004F 0054
        DECLE   $0042,  $0041,  $0000,  $0003   ; FCA3   0042 0041 0000 0003
        DECLE   $0046,  $004F,  $004F,  $0054   ; FCA7   0046 004F 004F 0054
        DECLE   $0042,  $0000,  $0004,  $0046   ; FCAB   0042 0000 0004 0046
        DECLE   $004F,  $004F,  $0054,  $0000   ; FCAF   004F 004F 0054 0000
        DECLE   $0005,  $0046,  $004F,  $004F   ; FCB3   0005 0046 004F 004F
        DECLE   $0000,  $0006,  $0046,  $004F   ; FCB7   0000 0006 0046 004F
        DECLE   $0000,  $0007,  $0046,  $0000   ; FCBB   0000 0007 0046 0000
        DECLE   $0054,  $0020,  $0020,  $0020   ; FCBF   0054 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0042   ; FCC3   0020 0020 0020 0042
        DECLE   $0000,  $004F,  $0054,  $0020   ; FCC7   0000 004F 0054 0020
        DECLE   $0020,  $0020,  $0020,  $0042   ; FCCB   0020 0020 0020 0042
        DECLE   $0041,  $0000,  $004F,  $004F   ; FCCF   0041 0000 004F 004F
        DECLE   $0054,  $0020,  $0020,  $0042   ; FCD3   0054 0020 0020 0042
        DECLE   $0041,  $004C,  $0000,  $0020   ; FCD7   0041 004C 0000 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; FCDB   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0050   ; FCDF   0020 0020 0020 0050
        DECLE   $0052,  $0045,  $0053,  $0045   ; FCE3   0052 0045 0053 0045
        DECLE   $004E,  $0054,  $0053,  $0000   ; FCE7   004E 0054 0053 0000
        DECLE   $014A,  $014A,  $0142,  $0143   ; FCEB   014A 014A 0142 0143
        DECLE   $0144,  $0145,  $014A,  $014A   ; FCEF   0144 0145 014A 014A
        DECLE   $0000,  $0142,  $0143,  $0144   ; FCF3   0000 0142 0143 0144
        DECLE   $0145,  $014A,  $014A,  $014A   ; FCF7   0145 014A 014A 014A
        DECLE   $014A,  $0000,  $014A,  $014A   ; FCFB   014A 0000 014A 014A
        DECLE   $014A,  $014A,  $0142,  $0143   ; FCFF   014A 014A 0142 0143
        DECLE   $0144,  $0145,  $0000,  $0142   ; FD03   0144 0145 0000 0142
        DECLE   $0143,  $0144,  $0145,  $0142   ; FD07   0143 0144 0145 0142
        DECLE   $0143,  $0144,  $0145,  $0000   ; FD0B   0143 0144 0145 0000
        DECLE   $00A4,  $0003,  $0280,  $0281   ; FD0F   00A4 0003 0280 0281
        DECLE   $0282,  $0033,  $02A9,  $0003   ; FD13   0282 0033 02A9 0003
        DECLE   $0289,  $0033,  $02A9,  $0003   ; FD17   0289 0033 02A9 0003
        DECLE   $0289,  $0033,  $02A9,  $0003   ; FD1B   0289 0033 02A9 0003
        DECLE   $0289,  $0023,  $0299,  $000D   ; FD1F   0289 0023 0299 000D
        DECLE   $002D,  $000D,  $002D,  $000D   ; FD23   002D 000D 002D 000D
        DECLE   $0024,  $00B0,  $00C1,  $024A   ; FD27   0024 00B0 00C1 024A
        DECLE   $00A0,  $00D1,  $023A,  $0090   ; FD2B   00A0 00D1 023A 0090
        DECLE   $00E1,  $022A,  $0080,  $00F1   ; FD2F   00E1 022A 0080 00F1
        DECLE   $021A,  $0070,  $0101,  $020A   ; FD33   021A 0070 0101 020A
        DECLE   $0060,  $0111,  $01FA,  $0050   ; FD37   0060 0111 01FA 0050
        DECLE   $0121,  $01EA,  $01E4,  $0040   ; FD3B   0121 01EA 01E4 0040
        DECLE   $0131,  $01DA,  $000D,  $0054   ; FD3F   0131 01DA 000D 0054
        DECLE   $0033,  $02A9,  $0013,  $02B8   ; FD43   0033 02A9 0013 02B8
        DECLE   $02A8,  $02C8,  $0003,  $0280   ; FD47   02A8 02C8 0003 0280
        DECLE   $0013,  $02CA,  $02AA,  $02BA   ; FD4B   0013 02CA 02AA 02BA
        DECLE   $0003,  $0281,  $0280,  $028A   ; FD4F   0003 0281 0280 028A
        DECLE   $0013,  $02D8,  $0033,  $02D9   ; FD53   0013 02D8 0033 02D9
        DECLE   $0053,  $02DA,  $0003,  $0280   ; FD57   0053 02DA 0003 0280
        DECLE   $0281,  $028A,  $0023,  $0290   ; FD5B   0281 028A 0023 0290
        DECLE   $0291,  $029A,  $003D,  $002D   ; FD5F   0291 029A 003D 002D
        DECLE   $003D,  $002D,  $003D,  $000D   ; FD63   003D 002D 003D 000D
        DECLE   $0004,  $0023,  $0008,  $0018   ; FD67   0004 0023 0008 0018
        DECLE   $0028,  $0038,  $0048,  $0058   ; FD6B   0028 0038 0048 0058
        DECLE   $0068,  $0078,  $0088,  $0098   ; FD6F   0068 0078 0088 0098
        DECLE   $00A8,  $00B8,  $0288,  $00B9   ; FD73   00A8 00B8 0288 00B9
        DECLE   $00A9,  $0099,  $0089,  $0079   ; FD77   00A9 0099 0089 0079
        DECLE   $0069,  $0059,  $0049,  $0039   ; FD7B   0069 0059 0049 0039
        DECLE   $0029,  $0019,  $0009,  $0289   ; FD7F   0029 0019 0009 0289
        DECLE   $000A,  $001A,  $002A,  $003A   ; FD83   000A 001A 002A 003A
        DECLE   $004A,  $005A,  $006A,  $007A   ; FD87   004A 005A 006A 007A
        DECLE   $008A,  $009A,  $00AA,  $00BA   ; FD8B   008A 009A 00AA 00BA
        DECLE   $028A,  $0158,  $0148,  $0138   ; FD8F   028A 0158 0148 0138
        DECLE   $0128,  $0118,  $0108,  $00F8   ; FD93   0128 0118 0108 00F8
        DECLE   $00E8,  $00D8,  $00C8,  $0288   ; FD97   00E8 00D8 00C8 0288
        DECLE   $00C9,  $00D9,  $00E9,  $00F9   ; FD9B   00C9 00D9 00E9 00F9
        DECLE   $0109,  $0119,  $0129,  $0139   ; FD9F   0109 0119 0129 0139
        DECLE   $0149,  $0159,  $0289,  $015A   ; FDA3   0149 0159 0289 015A
        DECLE   $014A,  $013A,  $012A,  $011A   ; FDA7   014A 013A 012A 011A
        DECLE   $010A,  $00FA,  $00EA,  $00DA   ; FDAB   010A 00FA 00EA 00DA
        DECLE   $00CA,  $028A,  $0168,  $0178   ; FDAF   00CA 028A 0168 0178
        DECLE   $0188,  $0198,  $01A8,  $01B8   ; FDB3   0188 0198 01A8 01B8
        DECLE   $01C8,  $01D8,  $01E8,  $01F8   ; FDB7   01C8 01D8 01E8 01F8
        DECLE   $0208,  $0218,  $0228,  $0238   ; FDBB   0208 0218 0228 0238
        DECLE   $0248,  $0288,  $024A,  $023A   ; FDBF   0248 0288 024A 023A
        DECLE   $022A,  $021A,  $020A,  $01FA   ; FDC3   022A 021A 020A 01FA
        DECLE   $01EA,  $01DA,  $01CA,  $01BA   ; FDC7   01EA 01DA 01CA 01BA
        DECLE   $01AA,  $019A,  $018A,  $017A   ; FDCB   01AA 019A 018A 017A
        DECLE   $016A,  $028A,  $0259,  $0269   ; FDCF   016A 028A 0259 0269
        DECLE   $0279                           ; FDD3   0279

        XORR    R3,     R1                      ; FDD4   01D9
        DIS                                     ; FDD5   0003
        COMR    R5                              ; FDD6   001D
        INCR    R5                              ; FDD7   000D
        ADCR    R5                              ; FDD8   002D
        INCR    R5                              ; FDD9   000D
        RSWD    R5                              ; FDDA   003D
        INCR    R5                              ; FDDB   000D
        SLL     R1,     2                       ; FDDC   004D
        INCR    R5                              ; FDDD   000D
        SLLC    R1,     2                       ; FDDE   005D
        INCR    R5                              ; FDDF   000D
        SLL     R1,     2                       ; FDE0   004D
        INCR    R5                              ; FDE1   000D
        RSWD    R5                              ; FDE2   003D
        INCR    R5                              ; FDE3   000D
        ADCR    R5                              ; FDE4   002D
        INCR    R5                              ; FDE5   000D
        COMR    R5                              ; FDE6   001D
        CLRR    R4                              ; FDE7   01E4
        INCR    R5                              ; FDE8   000D
        NEGR    R3                              ; FDE9   0023
        DECR    R4                              ; FDEA   0014
        SWAP    R0,     1                       ; FDEB   0040
        SUBR    R6,     R1                      ; FDEC   0131
        XORR    R3,     R2                      ; FDED   01DA
        INCR    R5                              ; FDEE   000D
        ADCR    R5                              ; FDEF   002D
        INCR    R5                              ; FDF0   000D
        ADCR    R5                              ; FDF1   002D
        INCR    R5                              ; FDF2   000D
        NOP                                     ; FDF3   0034
        ADCR    R5                              ; FDF4   002D
        INCR    R5                              ; FDF5   000D
        MVI     G_002D, R4                      ; FDF6   0284 002D
        INCR    R5                              ; FDF8   000D
        CLRC                                    ; FDF9   0006
        INCR    R7                              ; FDFA   000F

        TSTR    R5                              ; FDFB   00AD
L_FDFC:
        PSHR    R5                              ; FDFC   0275
        DECLE   $0280,  $015D,  $0378,  $000C   ; FDFD   0280 015D 0378 000C
        DECLE   $020D,  $002E,  $02BC,  $01E2   ; FE01   020D 002E 02BC 01E2
        DECLE   $02A0,  $0040,  $006C,  $006C   ; FE05   02A0 0040 006C 006C
        DECLE   $0068,  $00A3,  $0001,  $02E0   ; FE09   0068 00A3 0001 02E0
        DECLE   $0258,  $0040,  $0082,  $000B   ; FE0D   0258 0040 0082 000B
        DECLE   $0318,  $0091,  $03B9,  $0007   ; FE11   0318 0091 03B9 0007
        DECLE   $0259,  $01CA,  $02BD,  $01E6   ; FE15   0259 01CA 02BD 01E6
        DECLE   $026A,  $0102,  $000D,  $026A   ; FE19   026A 0102 000D 026A
        DECLE   $02BB,  $0003,  $026B,  $0004   ; FE1D   02BB 0003 026B 0004
        DECLE   $01A8,  $006C,  $0004,  $01AC   ; FE21   01A8 006C 0004 01AC
        DECLE   $0232                           ; FE25   0232

        MVI     G_01E9, R2                      ; FE26   0282 01E9
        SARC    R2,     2                       ; FE28   007E
        BNOV    L_FE2E                          ; FE29   020A 0003

        JSR     R5,     L_5235                  ; FE2B   0004 0150 0235
L_FE2E:
        JSR     R5,     X_PLAY_NOTE             ; FE2E   0004 0118 02BD

        PULR    R7                              ; FE31   02B7

        PSHR    R5                              ; FE32   0275
        MVII    #$031D, R2                      ; FE33   02BA 031D
        CLRR    R3                              ; FE35   01DB
L_FE36:
        MVII    #$01E7, R5                      ; FE36   02BD 01E7
        MVI@    R2,     R0                      ; FE38   0290
        SLL     R0,     1                       ; FE39   0048
        BPL     L_FE3E                          ; FE3A   0203 0002

        MVII    #$01E5, R5                      ; FE3C   02BD 01E5
L_FE3E:
        ADDI    #$0002, R2                      ; FE3E   02FA 0002
        MVI@    R2,     R0                      ; FE40   0290
        SDBD                                    ; FE41   0001
        ADD@    R5,     R0                      ; FE42   02E8
        MVO@    R0,     R2                      ; FE43   0250
        MVI@    R3,     R0                      ; FE44   0298
        MOVR    R0,     R1                      ; FE45   0081
        ANDI    #$00FF, R1                      ; FE46   03B9 00FF
        XORR    R1,     R0                      ; FE48   01C8
        DECR    R5                              ; FE49   0015
        ADD@    R5,     R1                      ; FE4A   02E9
        ANDI    #$00FF, R1                      ; FE4B   03B9 00FF
        XORR    R1,     R0                      ; FE4D   01C8
        MVO@    R0,     R3                      ; FE4E   0258
        ADDI    #$0006, R2                      ; FE4F   02FA 0006
        INCR    R3                              ; FE51   000B
        CMPI    #$0008, R3                      ; FE52   037B 0008
        BNEQ    L_FE36                          ; FE54   022C 001F

        MVI     G_01E4, R0                      ; FE56   0280 01E4
        MVO     R0,     .STIC.HDLY              ; FE58   0240 0030
        MVO     R0,     .STIC.VIDEN             ; FE5A   0240 0020
        CLRR    R2                              ; FE5C   01D2
        MVI     G_01E6, R0                      ; FE5D   0280 01E6
        SWAP    R0,     2                       ; FE5F   0044
        BEQ     L_FE97                          ; FE60   0204 0035
        BPL     L_FE7C                          ; FE62   0203 0018

        MVII    #$0200, R4                      ; FE64   02BC 0200
        MOVR    R4,     R5                      ; FE66   00A5
L_FE67:
        MVI@    R4,     R0                      ; FE67   02A0
        SDBD                                    ; FE68   0001
        ANDI    #$2000, R0                      ; FE69   03B8 0000 0020
        XOR@    R4,     R0                      ; FE6C   03E0
        MVO@    R0,     R5                      ; FE6D   0268
        MVII    #$0012, R3                      ; FE6E   02BB 0012
L_FE70:
        MVI@    R4,     R0                      ; FE70   02A0
        MVO@    R0,     R5                      ; FE71   0268
        DECR    R3                              ; FE72   0013
        BNEQ    L_FE70                          ; FE73   022C 0004

        INCR    R5                              ; FE75   000D
        CMPI    #$02E6, R4                      ; FE76   037C 02E6
        BLT     L_FE67                          ; FE78   0225 0012
        B       L_FE95                          ; FE7A   0200 0019

L_FE7C:
        MVII    #$0212, R5                      ; FE7C   02BD 0212
        MVII    #$0003, R1                      ; FE7E   02B9 0003
L_FE80:
        MVII    #$0012, R3                      ; FE80   02BB 0012
L_FE82:
        MVI@    R5,     R0                      ; FE82   02A8
        MVO@    R0,     R5                      ; FE83   0268
        SUBR    R1,     R5                      ; FE84   010D
        DECR    R3                              ; FE85   0013
        BNEQ    L_FE82                          ; FE86   022C 0005

        MVI@    R5,     R0                      ; FE88   02A8
        SDBD                                    ; FE89   0001
        ANDI    #$5FFF, R0                      ; FE8A   03B8 00FF 005F
        MVO@    R0,     R5                      ; FE8D   0268
        ADDI    #$0024, R5                      ; FE8E   02FD 0024
        CMPI    #$02F0, R5                      ; FE90   037D 02F0
        BLT     L_FE80                          ; FE92   0225 0013

        INCR    R2                              ; FE94   000A
L_FE95:
        MVII    #$0002, R0                      ; FE95   02B8 0002
L_FE97:
        SLL     R2,     2                       ; FE97   004E
        XORR    R0,     R2                      ; FE98   01C2
        MVO     R2,     G_01E9                  ; FE99   0242 01E9
        PULR    R7                              ; FE9B   02B7

        DECLE   $0000,  $0000                   ; FE9C   0000 0000

        NEGR    R4                              ; FE9E   0024
        MOVR    R5,     R7                      ; FE9F   00AF

        DECLE   $0008,  $0000,  $0000           ; FEA0   0008 0000 0000

        MVI     G_017B, R0                      ; FEA3   0280 017B
        ANDI    #$0001, R0                      ; FEA5   03B8 0001
        XOR     G_015E, R0                      ; FEA7   03C0 015E
        MVO     R0,     G_018E                  ; FEA9   0240 018E
        MOVR    R5,     R7                      ; FEAB   00AF

        DECLE   $0001,  $02A9,  $0275,  $0273   ; FEAC   0001 02A9 0275 0273
        DECLE   $01C0,  $0240,  $018D,  $0004   ; FEB0   01C0 0240 018D 0004

        ANDR    R5,     R4                      ; FEB4   01AC
        MVII    #$02B4, R5                      ; FEB5   02BD 02B4
        MVII    #$0004, R0                      ; FEB7   02B8 0004
        B       L_FEC4                          ; FEB9   0200 0009

        SDBD                                    ; FEBB   0001
        MVI@    R5,     R1                      ; FEBC   02A9
        MVO     R1,     G_0183                  ; FEBD   0241 0183
        SWAP    R1,     1                       ; FEBF   0041
        MVO     R1,     G_0184                  ; FEC0   0241 0184
        NOP                                     ; FEC2   0034
        PSHR    R5                              ; FEC3   0275
L_FEC4:
        CLRR    R5                              ; FEC4   01ED
        MVO     R5,     G_0168                  ; FEC5   0245 0168
        ADDR    R7,     R4                      ; FEC7   00FC
        ADDI    #$0097, R4                      ; FEC8   02FC 0097
L_FECA:
        MVI@    R4,     R2                      ; FECA   02A2
        DECLE   $0042,  $03BA,  $0003,  $02A3   ; FECB   0042 03BA 0003 02A3
        DECLE   $0043,  $0077,  $0056,  $0283   ; FECF   0043 0077 0056 0283
        DECLE   $018E,  $03BB,  $0001,  $004B   ; FED3   018E 03BB 0001 004B
        DECLE   $01DA,  $0085,  $02FD,  $0185   ; FED7   01DA 0085 02FD 0185
        DECLE   $026A,  $033C,  $0002,  $0004   ; FEDB   026A 033C 0002 0004

        ANDR    R5,     R4                      ; FEDF   01AC
        SUB@    R1,     R4                      ; FEE0   030C
        MVII    #$001E, R3                      ; FEE1   02BB 001E

        JSR     R5,     .EXEC.9AD               ; FEE3   0004 0118 01AD

        PSHR    R0                              ; FEE6   0270
        PSHR    R1                              ; FEE7   0271
        MVII    #$000E, R0                      ; FEE8   02B8 000E

        JSR     R5,     .EXEC.6E9               ; FEEA   0004 0114 02E9

        INCR    R1                              ; FEED   0009
        MOVR    R7,     R5                      ; FEEE   00BD
        SUBI    #$0053, R5                      ; FEEF   033D 0053
        MVO@    R5,     R1                      ; FEF1   024D
        ADDI    #$0004, R1                      ; FEF2   02F9 0004
        MVI@    R1,     R5                      ; FEF4   028D
        ANDI    #$000F, R5                      ; FEF5   03BD 000F
        CMPI    #$000B, R5                      ; FEF7   037D 000B
        BGE     L_FEFC                          ; FEF9   020D 0001

        CLRR    R5                              ; FEFB   01ED
L_FEFC:
        XORI    #$03E0, R5                      ; FEFC   03FD 03E0
        MVO@    R5,     R1                      ; FEFE   024D
        INCR    R0                              ; FEFF   0008
        MOVR    R0,     R5                      ; FF00   0085
        ANDI    #$0003, R5                      ; FF01   03BD 0003
        BNEQ    L_FECA                          ; FF03   022C 003A

        MVI     G_018D, R0                      ; FF05   0280 018D
        ADDI    #$0004, R0                      ; FF07   02F8 0004
        MVO     R0,     G_018D                  ; FF09   0240 018D
L_FF0B:
        PULR    R7                              ; FF0B   02B7

        SDBD                                    ; FF0C   0001
        MVI@    R4,     R2                      ; FF0D   02A2
        MVI     G_018E, R3                      ; FF0E   0283 018E
        ANDI    #$0001, R3                      ; FF10   03BB 0001
        BEQ     L_FF1B                          ; FF12   0204 0007

        COMR    R2                              ; FF14   001A
        XORI    #$00FF, R2                      ; FF15   03FA 00FF
        SDBD                                    ; FF17   0001
        ADDI    #$A900, R2                      ; FF18   02FA 0000 00A9
L_FF1B:
        XOR     G_018E, R3                      ; FF1B   03C3 018E
        BEQ     L_FF23                          ; FF1D   0204 0004

        XORI    #$00FF, R2                      ; FF1F   03FA 00FF
        SUBI    #$009F, R2                      ; FF21   033A 009F
L_FF23:
        MOVR    R5,     R7                      ; FF23   00AF

        PSHR    R5                              ; FF24   0275

        JSR     R5,     .EXEC.98D               ; FF25   0004 0118 018D

        MOVR    R0,     R3                      ; FF28   0083
        ADDI    #$0185, R3                      ; FF29   02FB 0185
        MVI@    R3,     R3                      ; FF2B   029B
        SARC    R3,     1                       ; FF2C   007B
        BNC     L_FF34                          ; FF2D   0209 0005

        JSR     R5,     .EXEC.7AE               ; FF2F   0004 0114 03AE

        B       L_FF4F                          ; FF32   0200 001B

L_FF34:
        MVI@    R1,     R5                      ; FF34   028D
        SDBD                                    ; FF35   0001
        ANDI    #$FDFF, R5                      ; FF36   03BD 00FF 00FD
        SARC    R3,     1                       ; FF39   007B
        BNC     L_FF3E                          ; FF3A   0209 0002

        XORI    #$0200, R5                      ; FF3C   03FD 0200
L_FF3E:
        MVO@    R5,     R1                      ; FF3E   024D
        ADDI    #$0007, R1                      ; FF3F   02F9 0007
        MVI@    R1,     R2                      ; FF41   028A
        SUBI    #$0005, R1                      ; FF42   0339 0005
        MOVR    R1,     R5                      ; FF44   008D
        MVO@    R2,     R5                      ; FF45   026A
        SWAP    R2,     1                       ; FF46   0042
        MVO@    R2,     R5                      ; FF47   026A
        CLRR    R2                              ; FF48   01D2
        MVO@    R2,     R5                      ; FF49   026A
        ADDR    R7,     R3                      ; FF4A   00FB
        ADDI    #$0010, R3                      ; FF4B   02FB 0010
        MVI@    R3,     R3                      ; FF4D   029B
        MVO@    R3,     R5                      ; FF4E   026B
L_FF4F:
        MVI     G_018D, R0                      ; FF4F   0280 018D
        DECR    R0                              ; FF51   0010
        MVO     R0,     G_018D                  ; FF52   0240 018D
        BNEQ    L_FF0B                          ; FF54   022C 004A

        MVII    #$0183, R4                      ; FF56   02BC 0183
        PULR    R5                              ; FF58   02B5
        SDBD                                    ; FF59   0001
        MVI@    R4,     R7                      ; FF5A   02A7

        DECLE   $0009,  $000D,  $000A,  $000E   ; FF5B   0009 000D 000A 000E
        DECLE   $0330,  $0088,  $0122,  $0072   ; FF5F   0330 0088 0122 0072
        DECLE   $013E,  $0072,  $012E,  $0078   ; FF63   013E 0072 012E 0078
        DECLE   $0330,  $0078,  $014E,  $0072   ; FF67   0330 0078 014E 0072
        DECLE   $0124,  $0072,  $013C,  $0072   ; FF6B   0124 0072 013C 0072
        DECLE   $0330,  $0078,  $014E,  $0082   ; FF6F   0330 0078 014E 0082
        DECLE   $0124,  $0072,  $013C,  $0072   ; FF73   0124 0072 013C 0072
        DECLE   $0330,  $0078,  $013C,  $007E   ; FF77   0330 0078 013C 007E
        DECLE   $0120,  $0072,  $0140,  $0072   ; FF7B   0120 0072 0140 0072
        DECLE   $0330,  $0078,  $0138,  $0072   ; FF7F   0330 0078 0138 0072
        DECLE   $0120,  $0072,  $0128,  $0072   ; FF83   0120 0072 0128 0072
        DECLE   $0330,  $0098,  $0120,  $0072   ; FF87   0330 0098 0120 0072
        DECLE   $013E,  $0072,  $0135,  $0088   ; FF8B   013E 0072 0135 0088
        DECLE   $0331,  $0088,  $013E,  $0072   ; FF8F   0331 0088 013E 0072
        DECLE   $0122,  $0072,  $0130,  $0098   ; FF93   0122 0072 0130 0098
        DECLE   $0330,  $013C,  $0130,  $0154   ; FF97   0330 013C 0130 0154
        DECLE   $0140,  $0164,  $0120,  $0164   ; FF9B   0140 0164 0120 0164
        DECLE   $0338,  $0152,  $0128,  $0152   ; FF9F   0338 0152 0128 0152
        DECLE   $0140,  $0164,  $0120,  $0164   ; FFA3   0140 0164 0120 0164
        DECLE   $0330,  $014C,  $0114,  $0158   ; FFA7   0330 014C 0114 0158
        DECLE   $0140,  $0164,  $0120,  $0164   ; FFAB   0140 0164 0120 0164
        DECLE   $033A,  $0144,  $0126,  $0144   ; FFAF   033A 0144 0126 0144
        DECLE   $0142,  $0164,  $011E,  $0164   ; FFB3   0142 0164 011E 0164
        DECLE   $033E,  $0154,  $011C,  $0164   ; FFB7   033E 0154 011C 0164
        DECLE   $013C,  $0164,  $0126,  $0164   ; FFBB   013C 0164 0126 0164
        DECLE   $0330,  $0154,  $0140,  $0164   ; FFBF   0330 0154 0140 0164
        DECLE   $0120,  $0164,  $0330,  $0120   ; FFC3   0120 0164 0330 0120
        DECLE   $032C,  $008D,  $0234,  $0188   ; FFC7   032C 008D 0234 0188
        DECLE   $0224,  $0188,  $0026,  $0180   ; FFCB   0224 0188 0026 0180
        DECLE   $032C,  $0158,  $0038,  $0060   ; FFCF   032C 0158 0038 0060
        DECLE   $0028,  $0060,  $0020,  $0060   ; FFD3   0028 0060 0020 0060
        DECLE   $000A,  $0200,  $000A,  $0200   ; FFD7   000A 0200 000A 0200

        INCR    R2                              ; FFDB   000A
        B       L_FFE8                          ; FFDC   0200 000A

        DECLE   $0200,  $005A,  $0200,  $005A   ; FFDE   0200 005A 0200 005A
        DECLE   $0200,  $005A,  $0200,  $005A   ; FFE2   0200 005A 0200 005A
        DECLE   $0200                           ; FFE6   0200

        PSHR    R5                              ; FFE7   0275
L_FFE8:
        MVII    #$01A4, R3                      ; FFE8   02BB 01A4
        ADDR    R0,     R3                      ; FFEA   00C3
        SETC                                    ; FFEB   0007
        MVI@    R3,     R2                      ; FFEC   029A
        TSTR    R2                              ; FFED   0092
        BEQ     L_FFFC                          ; FFEE   0204 000C

        ADDI    #$001A, R3                      ; FFF0   02FB 001A
        MVII    #$01A7, R4                      ; FFF2   02BC 01A7
        ADD@    R3,     R4                      ; FFF4   02DC
        CMPI    #$0001, R0                      ; FFF5   0378 0001
        BEQ     L_FFFB                          ; FFF7   0204 0002

        ADDI    #$000C, R4                      ; FFF9   02FC 000C
L_FFFB:
        CLRC                                    ; FFFB   0006
L_FFFC:
        PULR    R7                              ; FFFC   02B7

        DECLE   $0000,  $0000,  $0000           ; FFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5020       <entry>
;;  $502F       <entry>
;;  $505A       $50D8   $D4C3  
;;  $5071       $506D   $5094  
;;  $5081       $507D  
;;  $508C       $5088  
;;  $5097       <entry>
;;  $50B2       $DF42  
;;  $50C0       $DB25  
;;  $50CD       $D4EB  
;;  $50CE       $50CC  
;;  $50E7       $50E0  
;;  $50ED       $D4EF  
;;  $50EE       $50EC  
;;  $5102       $D4E2  
;;  $5117       $5812   $59E7  
;;  $514A       $5139  
;;  $5156       $514A   $514E  
;;  $515D       $553E   $5543  
;;  $5163       $515E   $57B9   $5888   $59F2   $59FA   $5A6A   $5A7B   $5B21  
;;  $5163       $5C2E   $67A7  
;;  $516C       $5167  
;;  $5179       $5107   $5123   $52F2   $6266   $D4D9  
;;  $518A       $5195  
;;  $5198       $518C   $526E  
;;  $51EF       $51DD   $51EA  
;;  $51F3       $51C8   $51E7  
;;  $51F4       $51A1   $51A9   $51AD   $51B1   $51B5   $51BB   $51C0   $51C4  
;;  $51F4       $51CE   $51D8   $51F0  
;;  $51F5       $51F3  
;;  $51FF       $5219  
;;  $520A       $5204  
;;  $520C       $5208   $5217  
;;  $521B       $5214  
;;  $5225       $51FC   $520E   $521D   $5221  
;;  $5235       $FE2B  
;;  $5250       $524A  
;;  $5258       $5254  
;;  $525E       $525A  
;;  $526B       $5267  
;;  $5278       $59E1  
;;  $5288       $5274  
;;  $5289       $5287  
;;  $5298       $5294  
;;  $52AB       $529C  
;;  $52AE       $52AB  
;;  $52B0       $528D  
;;  $52B1       $5FE8  
;;  $52BD       $52B2   $52B7  
;;  $52D5       $52C7  
;;  $52DF       $52D3  
;;  $52E1       $52CF   $52DB  
;;  $52EC       $6288  
;;  $52ED       $536A  
;;  $5301       $52F6   $52FB  
;;  $5315       $5311  
;;  $531C       $5317  
;;  $5327       $532B  
;;  $532D       $531F   $5323   $53DD  
;;  $5336       $53E5   $57B5   $5B1E   $5C2B  
;;  $534B       $5AC2   $5AEE   $5B2A   $5BD5   $5E5C  
;;  $5362       $5356  
;;  $536E       $5350   $535F  
;;  $539F       $5398  
;;  $53AA       $53A1  
;;  $53B2       $53AE  
;;  $53BB       $5872   $5C77   $5D35  
;;  $53E3       $53C0   $5418  
;;  $53F3       $53F0  
;;  $5407       $5404  
;;  $540E       $540A  
;;  $5413       $5CBE   $5D10   $5D7B  
;;  $544D       $538C  
;;  $5456       $5452   $545E  
;;  $5457       $53FF  
;;  $5465       $5483  
;;  $5472       $546B  
;;  $547E       $5030  
;;  $54A4       $5586  
;;  $54A5       $54A3  
;;  $54AC       $5494  
;;  $54D2       $54CF  
;;  $54D9       $54CD  
;;  $54E7       $6222  
;;  $54EA       $54E5  
;;  $54F4       $54F1  
;;  $5502       $54FA  
;;  $550A       $5465   $5476   $548C   $5498   $54AF   $54F8  
;;  $550B       $5505  
;;  $5512       $5485  
;;  $5527       $5521  
;;  $552D       $551D  
;;  $553C       $5535  
;;  $5552       $554B  
;;  $5559       $5980   $59BF  
;;  $5560       $5537   $554D   $5553  
;;  $557F       $5576   $557A  
;;  $5580       $5523   $552D  
;;  $5589       $5584  
;;  $55CC       $F745  
;;  $55D1       $54BB   $6209   $6234  
;;  $55D4       $55CF  
;;  $5601       $546F   $547A   $5529   $6229   $F74A  
;;  $5618       $5103   $56D2   $5855   $59D2   $5A58   $5A9A   $5AE3   $5C60  
;;  $5618       $5C72   $5D2E   $5DE2   $5E43   $6020   $625B   $62EC   $D42E  
;;  $5618       $D4CA   $D694   $DED1  
;;  $5619       $5B14  
;;  $561B       $50D5  
;;  $5625       $5623  
;;  $562E       $561B  
;;  $5634       $5164   $5291   $52C4   $530E   $5344   $53AB   $5407   $5CB3  
;;  $5634       $5CF0   $67A3   $D4D0  
;;  $563C       $50E2   $5897  
;;  $5643       $564A  
;;  $565E       $50AD   $5AF1   $5FEF   $D432   $D4C6   $DEEA  
;;  $5689       $565E  
;;  $568C       $50BA   $511D   $5A9E  
;;  $5690       $568A  
;;  $5692       $569A   $569E   $56EF   $571C   $5823  
;;  $5693       $56A1   $56A7   $56AD   $56B3  
;;  $569C       $5696  
;;  $56B9       $5036  
;;  $56DB       $56DE  
;;  $56E8       $56BF   $56E1  
;;  $5715       $570E  
;;  $5716       $5714  
;;  $5718       $5039  
;;  $5729       $5721   $5725   $5765  
;;  $5745       $5741  
;;  $5746       $5738  
;;  $5749       $5734  
;;  $574A       $5748  
;;  $575C       $5752  
;;  $575E       $572F  
;;  $575F       $575D  
;;  $5760       $5757  
;;  $576A       $5042  
;;  $577F       $577B  
;;  $578D       $5785  
;;  $5792       $5789   $578F  
;;  $5795       $5271  
;;  $5799       $513E  
;;  $579C       $57B0  
;;  $57A7       $57A4  
;;  $57AC       $57A1  
;;  $57B3       $5906   $5970  
;;  $57B4       $5AD0   $5E60  
;;  $57D2       <entry>
;;  $57E4       $57DC  
;;  $57ED       $57D7  
;;  $57FD       $57F9  
;;  $5815       $56FC   $5703   $576F   $57E2   $57E8   $57F0   $5803   $5810  
;;  $5816       $592D   $59B9   $5C0C  
;;  $581F       $503C  
;;  $5830       $56AA   $DEA6  
;;  $586B       $5866  
;;  $5896       $59AB   $5ADD   $5E3D  
;;  $58A2       $5848  
;;  $58A3       $58A1  
;;  $58B6       $58A3  
;;  $58BB       $58CE  
;;  $58C9       $58BE  
;;  $58E0       $58D4  
;;  $58F0       $58E4  
;;  $58FF       $5033  
;;  $5918       $590D   $5913  
;;  $5931       $591E  
;;  $5936       $597B   $5A15   $5A32  
;;  $5949       $5945  
;;  $595A       $5950  
;;  $595C       $5957  
;;  $595D       $594E  
;;  $5967       $593F  
;;  $596D       $593D  
;;  $596F       $592A   $5FE3  
;;  $597F       $5C09  
;;  $5980       $597E  
;;  $598B       $50FE  
;;  $598C       $598A  
;;  $59A7       $5997   $599D  
;;  $59AB       $5A73  
;;  $59B0       $5995   $59A5  
;;  $59B9       $598F   $59AE   $5A80  
;;  $59BC       $59B7  
;;  $59C6       $59A9  
;;  $59CF       $59CB  
;;  $59D0       $59CE  
;;  $59EF       $5991   $59C6  
;;  $5A00       $591C  
;;  $5A03       $5979  
;;  $5A27       $5919  
;;  $5A2C       $5976  
;;  $5A45       $5A35   $5BEE  
;;  $5A51       $5A1A  
;;  $5A75       $5A09  
;;  $5A82       $5120   $5927   $5A00   $5A60   $5BEB   $5C06   $5FD7  
;;  $5A84       $5A29  
;;  $5A8A       $5A96  
;;  $5A90       $5A8C  
;;  $5A91       $5A8F  
;;  $5AA1       $5904   $5931  
;;  $5AA2       $5924   $5A55   $5C03   $5DDF   $5E37  
;;  $5ADA       $5AD5  
;;  $5AEE       $5ABE  
;;  $5B0F       $5B0A  
;;  $5B12       $5AFB  
;;  $5B14       $5AFF  
;;  $5B18       $5AC0  
;;  $5B32       $5B1C  
;;  $5B41       $5B7B  
;;  $5B51       $584D   $5852  
;;  $5B7B       $5B71   $5BAE  
;;  $5B85       $5B81  
;;  $5BB0       $5BAB  
;;  $5BD1       $5AB9   $5B28  
;;  $5BFF       $5BDD   $5E67  
;;  $5C03       $5B30   $5BE5   $5BE9  
;;  $5C06       $5BFD  
;;  $5C10       $56B6  
;;  $5C14       $56B0  
;;  $5C16       $5C12  
;;  $5C67       $5B6C   $5C18   $5C1C   $5C48   $5E07   $5E51   $5E57   $5E6E  
;;  $5C68       $5C7B   $5CD9   $5D28  
;;  $5C86       $5C94  
;;  $5C8C       $5C89  
;;  $5CA1       $5C9D  
;;  $5CAE       $5CA7  
;;  $5CB8       $5CB6  
;;  $5CE4       $5D2C  
;;  $5CF5       $5CF3  
;;  $5D2E       $5D26  
;;  $5D33       $5C5D  
;;  $5D4B       $5D48  
;;  $5D53       $5D51  
;;  $5D59       $5D56  
;;  $5D86       $5ACD   $5C57   $5E0E   $6319   $6326  
;;  $5D99       $5D93  
;;  $5D9E       $5DC8   $5DFF   $5E19  
;;  $5DB3       $5DA4   $5DA9   $5DAE  
;;  $5E16       $5E14  
;;  $5E33       $5E2E  
;;  $5E4E       $5DCB   $5E1C  
;;  $5E5A       $5DCE   $5E1F  
;;  $5E6A       $5AEC   $5DEB   $5E4C  
;;  $5E90       $5E82  
;;  $5E96       $5E8E  
;;  $5EA0       $5E85   $5E8B   $5E94   $686A   $68D8  
;;  $5EB3       $5EAF   $5EFB  
;;  $5EC2       $5EA7  
;;  $5ED6       $5EF7  
;;  $5EE9       $5EE3  
;;  $5EF4       $5EEC   $5EEF  
;;  $5F33       $5F21   $5F2A  
;;  $5F4D       $5F4A  
;;  $5F52       $5F0C   $5F15   $5F2F   $5FC3   $5FC7   $5FCC   $5FD5  
;;  $5F6A       $5F5A  
;;  $5F75       $5F6D   $5F70  
;;  $5F7B       $5F68  
;;  $5F82       $5F56   $5F61   $5F73  
;;  $5F9E       $5F92  
;;  $5FA6       $5F8D   $5F96   $5F9C   $5FA0  
;;  $5FBB       $5FB2   $5FB8  
;;  $6009       $6005  
;;  $6016       $600C  
;;  $6059       $6055  
;;  $605F       $605B  
;;  $6060       $56A4   $DE3B  
;;  $606B       $6065  
;;  $609B       $6097  
;;  $60A8       $608F  
;;  $60AD       $60A6  
;;  $60BD       $60B3   $60B9  
;;  $60CA       $60C8  
;;  $60DC       $60E2  
;;  $60FB       $60F3  
;;  $6109       $60EE  
;;  $610B       $6069   $606C   $615F   $6165   $616C   $6171   $6175   $6307  
;;  $610B       $6320  
;;  $611E       $611A  
;;  $612D       $6112   $6129  
;;  $612F       $612B  
;;  $6145       $6158  
;;  $6188       $60A2   $60D8   $6103   $6125   $6141   $6154   $6344  
;;  $618C       $60E9   $60F8  
;;  $6199       $6194  
;;  $619B       $6041   $604B   $DE0D   $DE75  
;;  $619C       $60AA   $60C3   $60DD   $6131   $6147  
;;  $61AC       $61CF  
;;  $61C2       $61B3  
;;  $61C6       $61B7  
;;  $61C8       $61C4  
;;  $61D1       $61BB   $61BF  
;;  $61D8       $61D4  
;;  $61E2       $61DE  
;;  $6215       $6212  
;;  $621E       $6210  
;;  $6276       $628E  
;;  $628C       $6271  
;;  $6290       $626D  
;;  $62AE       $6273  
;;  $62B4       $617D   $627C  
;;  $62B8       $62B2  
;;  $62BF       $62B9  
;;  $62CE       $62C5  
;;  $62FA       $62E3  
;;  $6305       $62FF  
;;  $630E       $62D8   $62DC   $62E5  
;;  $631C       $6313  
;;  $632A       $6F2C   $6F44  
;;  $632C       $6093   $6116  
;;  $632D       $632B  
;;  $6343       $6330   $6338  
;;  $6347       $61AD  
;;  $66EC       $68F9  
;;  $66F0       $6910  
;;  $66F1       $66EE  
;;  $66F7       $66F5  
;;  $66FB       $66F8   $67B1  
;;  $6706       $5B4A  
;;  $6717       $670A  
;;  $6719       $5CEA   $5CFF   $6D48   $6DF2  
;;  $6724       $66F2   $6764   $6B8A  
;;  $672D       $5863   $5954   $5B07   $5D4E   $6746   $6952   $6D36   $6FC9  
;;  $6740       $673E  
;;  $6745       $68C1   $69C9   $6A69   $6B59   $6C62  
;;  $6753       $6887  
;;  $6769       $6767  
;;  $6771       $689B   $68E1  
;;  $6772       $6770  
;;  $6793       $688C  
;;  $67AD       $503F  
;;  $67C7       $67C3  
;;  $67E1       $67DE  
;;  $67E5       $67C8  
;;  $6810       $6803   $6808   $680D  
;;  $6812       $6852  
;;  $6820       $6825  
;;  $6838       $683B  
;;  $6848       $681A   $682D  
;;  $6854       $684C  
;;  $686E       $6864  
;;  $6875       $6812  
;;  $68AF       $68AC  
;;  $68B8       $68B2  
;;  $68BF       $68B9   $68BC  
;;  $68D8       $6881  
;;  $68DC       $6885   $688A   $6890   $6895  
;;  $68DE       $68DC  
;;  $68F4       $6820  
;;  $6900       $6901  
;;  $690B       $5E97  
;;  $6917       $6918  
;;  $6922       $686E   $6A02  
;;  $6929       $692A  
;;  $6933       $6834  
;;  $6949       $6941  
;;  $6951       $694E  
;;  $6963       $6960  
;;  $6964       $6959  
;;  $6969       $6956  
;;  $6974       $6971  
;;  $6975       $696A  
;;  $697A       $6977  
;;  $697B       $565A   $6024  
;;  $6991       $6844   $6871  
;;  $6998       $6A0C  
;;  $69A2       $6989   $699C  
;;  $69A4       $6AB0   $6ABA   $6AD4   $6AED  
;;  $69AF       $69A8  
;;  $69BF       $6A95  
;;  $69C3       $6A5E  
;;  $69D7       $6ADA  
;;  $69EF       $69E7  
;;  $69F6       $69FC  
;;  $69FF       $6A37   $6A49  
;;  $6A01       $6BBA   $6C70   $6C7D   $6C83   $6C90   $6C96   $6D29   $6D2E  
;;  $6A02       $6A08  
;;  $6A10       $69DE   $69F4   $6A89  
;;  $6A2D       $6A33  
;;  $6A7F       $6A7B  
;;  $6A8B       $6A54  
;;  $6AB2       $6AAC  
;;  $6ABC       $6AB6  
;;  $6ADC       $6ABE  
;;  $6AE6       $6ADE  
;;  $6AF3       $6AF1  
;;  $6AFD       $6AF8  
;;  $6B03       $69DA   $6AF5  
;;  $6B1C       $6B13  
;;  $6B21       $6B1A   $6B27  
;;  $6B2D       $6B08   $6B0F  
;;  $6B2F       $69E2   $69EA   $6A39   $6A4B   $6B15   $6B1C  
;;  $6B3B       $6A8F  
;;  $6B45       $6B47  
;;  $6B49       $6B43  
;;  $6B4A       $6AFF  
;;  $6B59       $6B51  
;;  $6B6A       $6A59   $6AC4  
;;  $6B71       $6B7A  
;;  $6B78       $6B73  
;;  $6B7D       $6BDA   $6BE5   $6BF0   $6BFB  
;;  $6B8F       $6B8D  
;;  $6B9E       $6B9A  
;;  $6BA7       $6B94  
;;  $6BAE       $6BAA  
;;  $6BB5       $6B9F   $6BA5   $6BAF  
;;  $6BBF       $6BD3  
;;  $6BCA       $6BDE   $6BE9   $6BF4   $6BFF  
;;  $6BD1       $6BCB  
;;  $6BD2       $6A14   $6A56   $6AC1  
;;  $6C16       $6A17  
;;  $6C1B       $6C23  
;;  $6C21       $6C1D  
;;  $6C29       $6C34  
;;  $6C31       $6C2A   $6C2D  
;;  $6C59       $6C40   $6C44   $6C48   $6C4C  
;;  $6C5F       $6C5B  
;;  $6C66       $6C5F  
;;  $6C81       $6C78  
;;  $6C87       $6C72  
;;  $6C94       $6C8B  
;;  $6C9A       $6CC6   $6CCC   $6CF6   $6CFC  
;;  $6C9C       $687B   $6ACE  
;;  $6CB1       $6CAE  
;;  $6CB5       $6CB2  
;;  $6CBA       $6CB6  
;;  $6CBB       $6CB9  
;;  $6CBD       $6D22  
;;  $6CC5       $6CC0  
;;  $6CE4       $6CDA   $6CE0  
;;  $6CEC       $6CE8  
;;  $6CED       $6D1D  
;;  $6CF5       $6CF0  
;;  $6D13       $6D09   $6D0F  
;;  $6D1B       $6D17  
;;  $6D1C       $6B0B  
;;  $6D30       $6D2B  
;;  $6D33       $6D73   $6F39  
;;  $6D3E       $6D39  
;;  $6D3F       $6027  
;;  $6D4F       $6D4C  
;;  $6D5D       $602A  
;;  $6D72       $6D64  
;;  $6D7F       $6D7C  
;;  $6D8E       $6D8A  
;;  $6D94       $6D90  
;;  $6D96       $6D86  
;;  $6DF9       $6DF6  
;;  $6E04       $6DAB   $6DAF   $6DB7   $6DC1   $6DCF   $6DE1   $6EBB  
;;  $6E0C       $6E69   $6E99   $6E9F   $6EAF   $6EBF  
;;  $6E1D       $6DD5   $6DE7   $6E8B  
;;  $6E25       $6DC5   $6DD7   $6DE9  
;;  $6E32       $6DC9   $6DDB   $6E62   $6E6C   $6E7B   $6ED1   $6EDE  
;;  $6E38       $6DB3   $6DBB   $6E16  
;;  $6E3E       $6E12   $6E19   $6E28   $6E5F   $6ED8  
;;  $6E46       $6E4A   $6E51   $6E55   $6E8F   $6E9B   $6EA3   $6EAB   $6EB1  
;;  $6E46       $6EC9   $6EDC  
;;  $6E47       $6D82  
;;  $6E64       $6E78   $6E7F   $6ED5  
;;  $6E67       $6E5B  
;;  $6E72       $6E83   $6E87  
;;  $6E7A       $6E70  
;;  $6E8D       $6E4E  
;;  $6E9D       $6E95  
;;  $6EB3       $6EA7  
;;  $6EBD       $6E91  
;;  $6ECB       $6EC5  
;;  $6ED3       $6ECD  
;;  $6EE0       $6D7F   $6EED   $6F1C  
;;  $6EEA       $6EE8  
;;  $6EEC       $6E25  
;;  $6F17       $6EF3   $6EFA   $6F01   $6F0B   $6F12   $6F4D   $6F52   $6F57  
;;  $6F19       $6EF7   $6EFE   $6F05   $6F0F   $6F15  
;;  $6F1B       $6D59  
;;  $6F30       $6D6E  
;;  $6F40       $6F37  
;;  $6F48       $6F22   $6F31  
;;  $6F5B       $6D67  
;;  $6F75       $6F6D   $6F71  
;;  $6F95       $6F84  
;;  $6FA3       $6FA5  
;;  $6FA7       $6FA1  
;;  $6FAF       $6FB2  
;;  $6FB4       $6FAD  
;;  $6FB8       $6FBA  
;;  $6FBC       $6FB6  
;;  $6FC4       $6FC7  
;;  $6FC9       $6FC2  
;;  $6FD5       $6FDB  
;;  $6FDD       $6D44   $6D62   $6DFF   $6E76   $6EB7   $6F20   $6F25   $6F28  
;;  $6FDD       $6F34   $6F3E   $6FCC  
;;  $6FDE       $5809  
;;  $6FE9       $5C64  
;;  $6FF5       $5E47  
;;  $D201       $D1FF  
;;  $D209       $D207  
;;  $D211       $D20F  
;;  $D24D       $D24B  
;;  $D255       $D253  
;;  $D25B       $D259  
;;  $D25D       $D25B  
;;  $D2D2       $D2D2  
;;  $D2E0       $D2E0  
;;  $D2EE       $D2EE  
;;  $D308       $D306  
;;  $D311       $D30F  
;;  $D31A       $D318  
;;  $D323       $D321  
;;  $D34C       $D34A  
;;  $D354       $D352  
;;  $D426       $D42A  
;;  $D446       $D451  
;;  $D448       $D44C  
;;  $D476       $D16D  
;;  $D490       $D476  
;;  $D4B8       $D4AC   $D501  
;;  $D4B9       $D4B0   $D4B6  
;;  $D4D7       $D4D3  
;;  $D4E6       $D4E0  
;;  $D4EF       $D4E9  
;;  $D4F3       $D4A7  
;;  $D503       $D4F9   $D4FD   $D509  
;;  $D514       $D536  
;;  $D538       $D530  
;;  $D53C       $D511  
;;  $D7E7       $DB64  
;;  $D7F7       $DB74  
;;  $D807       $DB84  
;;  $D817       $DB94  
;;  $D82C       $DBA4  
;;  $D837       $DBB4  
;;  $D84B       $DBC4  
;;  $D85B       $DBD4  
;;  $D868       $D866  
;;  $D86A       $D868  
;;  $D86C       $D86A  
;;  $D86E       $D86C  
;;  $D870       $D86E  
;;  $D872       $D870  
;;  $DA09       $DA07  
;;  $DAE5       $DAE5  
;;  $DAF5       $DAF5  
;;  $DB05       $DB05  
;;  $DB15       $DB15  
;;  $DD86       $DD76  
;;  $DDE3       $DDCD  
;;  $DDF2       $DDEE  
;;  $DE01       $DDF4   $DDFB  
;;  $DE06       $DE17  
;;  $DE20       $DE2E   $DE36  
;;  $DE58       $DE42  
;;  $DE67       $DE63  
;;  $DE84       $DE9A  
;;  $DEB3       $DBAE  
;;  $DEEF       $DEFA  
;;  $DF08       $DF06  
;;  $DF16       $DF08   $DF3F  
;;  $DF25       $DF21  
;;  $DF33       $DF0B   $DF35   $DF39  
;;  $DF41       $DF1E  
;;  $DF5C       $DC23  
;;  $DFE4       $DBE3  
;;  $DFF4       $DBF3  
;;  $DFFC       $DC43  
;;  $F08C       $F08A  
;;  $F09B       $F09B  
;;  $F0A5       $F0A5  
;;  $F262       $F260  
;;  $F2D6       $F2D4  
;;  $F3B8       $F66E  
;;  $F476       $F474  
;;  $F4DC       $F4DC  
;;  $F59E       $F59E  
;;  $F59F       $F59F  
;;  $F5A0       $F5A0  
;;  $F5D3       $F655  
;;  $F5F7       $F5F5  
;;  $F600       $F5FE  
;;  $F621       $F61F  
;;  $F63B       $F635  
;;  $F63D       $F639  
;;  $F67B       $F677  
;;  $F687       $F683  
;;  $F6A3       $F69F  
;;  $F6B1       $F68E  
;;  $F6BE       $F6BA  
;;  $F6E0       $F6D2   $F6DA  
;;  $F6E2       $F6CC  
;;  $F6FD       $F712  
;;  $F709       $F704  
;;  $F714       $F6C0   $F6DE   $F6FF  
;;  $F739       $F731  
;;  $F74E       $F72D  
;;  $F755       $F737  
;;  $F87A       $F87A  
;;  $F890       $F88D  
;;  $F8D9       $F8DC  
;;  $F8E0       $F903  
;;  $F8EE       $F901  
;;  $F8F4       $F8FD  
;;  $F8FF       $F8F7  
;;  $F916       $F928  
;;  $F93D       $F936  
;;  $F93E       $F939  
;;  $F95D       $F963  
;;  $F965       $F96B  
;;  $F997       $F99F  
;;  $F999       $F99C  
;;  $F9A4       $F9A6  
;;  $F9BA       $F9B4   $F9C3  
;;  $F9C5       $F9AF  
;;  $F9C8       $F9AD   $F9BD  
;;  $F9CA       $F97C   $F98B  
;;  $F9CF       $F9CD  
;;  $FAE5       $FAE3  
;;  $FB41       $FBBD  
;;  $FB65       $FB70   $FB7E   $FB83  
;;  $FB74       $FB68  
;;  $FB78       $FB7C  
;;  $FB80       $FB76  
;;  $FB8E       $FB9F  
;;  $FB90       $FB99  
;;  $FBBA       $FB72   $FBA1   $FBAA   $FBAE   $FBB3  
;;  $FBC5       $FB3B  
;;  $FBC7       $FB36  
;;  $FBE2       $FBE0  
;;  $FDFC       $FDFA  
;;  $FE2E       $FE29  
;;  $FE36       $FE54  
;;  $FE3E       $FE3A  
;;  $FE67       $FE78  
;;  $FE70       $FE73  
;;  $FE7C       $FE62  
;;  $FE80       $FE92  
;;  $FE82       $FE86  
;;  $FE95       $FE7A  
;;  $FE97       $FE60  
;;  $FEC4       $FEB9  
;;  $FECA       $FF03  
;;  $FEFC       $FEF9  
;;  $FF0B       $FF54  
;;  $FF1B       $FF12  
;;  $FF23       $FF1D  
;;  $FF34       $FF2D  
;;  $FF3E       $FF3A  
;;  $FF4F       $FF32  
;;  $FFE8       $FFDC  
;;  $FFFB       $FFF7  
;;  $FFFC       $FFEE  
;; ======================================================================== ;;
