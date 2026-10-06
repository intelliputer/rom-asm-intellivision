
        ORG     $5000
.HEADER:
        MVII    #$033C, R4                      ; 5000   02BC 033C
        ADDR    R1,     R4                      ; 5002   00CC
        MVO@    R3,     R4                      ; 5003   0263
        INCR    R4                              ; 5004   000C
        MVO@    R3,     R4                      ; 5005   0263
        MOVR    R5,     R7                      ; 5006   00AF
L_5007:
        PSHR    R5                              ; 5007   0275
        MVII    #$0002, R1                      ; 5008   02B9 0002
L_500A:
        MVII    #$01CF, R4                      ; 500A   02BC 01CF
        ADDR    R1,     R4                      ; 500C   00CC
        MVI@    R4,     R0                      ; 500D   02A0
        MOVR    R0,     R2                      ; 500E   0082
        ANDI    #$003F, R0                      ; 500F   03B8 003F
        BNEQ    L_5018                          ; 5011   020C 0005

        JSR     R5,     L_5045                  ; 5013   0004 0150 0045

        B       L_5033                          ; 5016   0200 001B

L_5018:
        DECR    R2                              ; 5018   0012
        DECR    R4                              ; 5019   0014
        MVO@    R2,     R4                      ; 501A   0262
        MVII    #$01F0, R4                      ; 501B   02BC 01F0
        ADDR    R1,     R4                      ; 501D   00CC
        MVI@    R4,     R0                      ; 501E   02A0
        ANDI    #$00C0, R2                      ; 501F   03BA 00C0
        BEQ     L_5033                          ; 5021   0204 0010

        ANDI    #$0080, R2                      ; 5023   03BA 0080
        BEQ     L_5037                          ; 5025   0204 0010

        DECR    R4                              ; 5027   0014
        SUBI    #$0002, R0                      ; 5028   0338 0002
        MVO@    R0,     R4                      ; 502A   0260
        BPL     L_5033                          ; 502B   0203 0006

        ADDI    #$0003, R4                      ; 502D   02FC 0003
        MVI@    R4,     R0                      ; 502F   02A0
        DECR    R4                              ; 5030   0014
        DECR    R0                              ; 5031   0010
        MVO@    R0,     R4                      ; 5032   0260
L_5033:
        DECR    R1                              ; 5033   0011
        BNEQ    L_500A                          ; 5034   022C 002B

        PULR    R7                              ; 5036   02B7
L_5037:
        DECR    R4                              ; 5037   0014
        ADDI    #$0002, R0                      ; 5038   02F8 0002
        MVO@    R0,     R4                      ; 503A   0260
        BNC     L_5033                          ; 503B   0229 0009

        ADDI    #$0003, R4                      ; 503D   02FC 0003
        MVI@    R4,     R0                      ; 503F   02A0
        INCR    R0                              ; 5040   0008
        DECR    R4                              ; 5041   0014
        MVO@    R0,     R4                      ; 5042   0260
        B       L_5033                          ; 5043   0220 0011

L_5045:
        MVII    #$033D, R4                      ; 5045   02BC 033D
        ADDR    R1,     R4                      ; 5047   00CC
        MVI@    R4,     R2                      ; 5048   02A2
        TSTR    R2                              ; 5049   0092
        BNEQ    L_504D                          ; 504A   020C 0001

        MOVR    R5,     R7                      ; 504C   00AF
L_504D:
        MVI@    R2,     R0                      ; 504D   0290
        INCR    R2                              ; 504E   000A
        MVI@    R2,     R3                      ; 504F   0293
        INCR    R2                              ; 5050   000A
        DECR    R4                              ; 5051   0014
        MVO@    R2,     R4                      ; 5052   0262
        TSTR    R3                              ; 5053   009B
        BEQ     L_5089                          ; 5054   0204 0033

        CMPI    #$0300, R3                      ; 5056   037B 0300
        BEQ     L_5070                          ; 5058   0204 0016

        SARC    R3,     2                       ; 505A   007F
        RLC     R0,     2                       ; 505B   0054
        ANDI    #$00FF, R3                      ; 505C   03BB 00FF
        MVII    #$01F0, R4                      ; 505E   02BC 01F0
        ADDR    R1,     R4                      ; 5060   00CC
        MVO@    R0,     R4                      ; 5061   0260
        ADDI    #$0003, R4                      ; 5062   02FC 0003
        SWAP    R0,     1                       ; 5064   0040
        MVO@    R0,     R4                      ; 5065   0260
        ADDI    #$0006, R4                      ; 5066   02FC 0006
        MVII    #$000F, R0                      ; 5068   02B8 000F
        MVO@    R0,     R4                      ; 506A   0260
        MVII    #$01CF, R4                      ; 506B   02BC 01CF
        ADDR    R1,     R4                      ; 506D   00CC
        MVO@    R3,     R4                      ; 506E   0263
        MOVR    R5,     R7                      ; 506F   00AF
L_5070:
        MVII    #$01D1, R4                      ; 5070   02BC 01D1
        ADDR    R1,     R4                      ; 5072   00CC
        MVI@    R4,     R2                      ; 5073   02A2
        TSTR    R2                              ; 5074   0092
        BNEQ    L_507A                          ; 5075   020C 0003

        DECR    R4                              ; 5077   0014
        INCR    R0                              ; 5078   0008
        MVO@    R0,     R4                      ; 5079   0260
L_507A:
        DECR    R4                              ; 507A   0014
        MVI@    R4,     R0                      ; 507B   02A0
        DECR    R4                              ; 507C   0014
        DECR    R0                              ; 507D   0010
        MVO@    R0,     R4                      ; 507E   0260
        BEQ     L_5089                          ; 507F   0204 0008

        MVII    #$033B, R4                      ; 5081   02BC 033B
        ADDR    R1,     R4                      ; 5083   00CC
        MVI@    R4,     R2                      ; 5084   02A2
        INCR    R4                              ; 5085   000C
        MVO@    R2,     R4                      ; 5086   0262
        B       L_504D                          ; 5087   0220 003B

L_5089:
        MVII    #$01FB, R4                      ; 5089   02BC 01FB
        ADDR    R1,     R4                      ; 508B   00CC
        CLRR    R0                              ; 508C   01C0
        MVO@    R0,     R4                      ; 508D   0260
        MVII    #$033D, R4                      ; 508E   02BC 033D
        ADDR    R1,     R4                      ; 5090   00CC
        MVO@    R0,     R4                      ; 5091   0260
        MOVR    R5,     R7                      ; 5092   00AF
        NEGR    R0                              ; 5093   0020
        DECLE   $0210,  $0001,  $0004           ; 5094   0210 0001 0004

        NEGR    R3                              ; 5097   0023
        SUBR    R2,     R0                      ; 5098   0110
        DECLE   $0000,  $0000                   ; 5099   0000 0000

        DECR    R4                              ; 509B   0014
        BPL     L_509D                          ; 509C   0223 0000

        DECLE   $0000                           ; 509E   0000

        COMR    R7                              ; 509F   001F
        DECLE   $0005,  $0000,  $0000           ; 50A0   0005 0000 0000

        DECR    R4                              ; 50A3   0014
        CLRR    R7                              ; 50A4   01FF
        NOP                                     ; 50A5   0034
        XORR    R7,     R6                      ; 50A6   01FE
        RLC     R0,     2                       ; 50A7   0054
        XORR    R7,     R5                      ; 50A8   01FD
        DECLE   $0000,  $0000                   ; 50A9   0000 0000

        NEGR    R7                              ; 50AB   0027
        BEQ     L_50CF                          ; 50AC   0204 0021

        SUBR    R0,     R4                      ; 50AE   0104
        ADCR    R0                              ; 50AF   0028
        BEQ     L_50DB                          ; 50B0   0204 0029

        SUBR    R0,     R4                      ; 50B2   0104
        DECLE   $0000,  $0000                   ; 50B3   0000 0000

        ADCR    R0                              ; 50B5   0028
        BEQ     L_50E1                          ; 50B6   0204 0029

        SUBR    R0,     R4                      ; 50B8   0104
        ADCR    R0                              ; 50B9   0028
        BEQ     L_50E5                          ; 50BA   0204 0029

        SUBR    R0,     R4                      ; 50BC   0104
        DIS                                     ; 50BD   0003
        SUB     .BTAB.00,R0                     ; 50BE   0300 0200
        SUBR    R4,     R6                      ; 50C0   0126
        DECLE   $0001                           ; 50C1   0001

        ADCR    R0                              ; 50C2   0028
        DIS                                     ; 50C3   0003
        SUB     .BTAB.06,R0                     ; 50C4   0300 0206
        SUBR    R4,     R6                      ; 50C6   0126
        DECLE   $0001                           ; 50C7   0001

        ADCR    R0                              ; 50C8   0028
        DIS                                     ; 50C9   0003
        SUB     .BTAB.00,R0                     ; 50CA   0300 0200
        SUBR    R4,     R6                      ; 50CC   0126
        DECLE   $0001                           ; 50CD   0001

        ADCR    R0                              ; 50CE   0028
L_50CF:
        DECR    R0                              ; 50CF   0010
        SUB     .BTAB.06,R0                     ; 50D0   0300 0206
        SUBR    R4,     R6                      ; 50D2   0126
        DECLE   $0001                           ; 50D3   0001

        ADCR    R0                              ; 50D4   0028
        DECR    R0                              ; 50D5   0010
        SUB     .STIC.A.7,R0                    ; 50D6   0300 0017
        DECLE   $021B,  $0000,  $0000           ; 50D8   021B 0000 0000
L_50DB:
        NEGR    R7                              ; 50DB   0027
        SUBR    R3,     R4                      ; 50DC   011C
        ADCR    R0                              ; 50DD   0028
        BPL     L_50DF                          ; 50DE   0223 0000

        DECLE   $0000                           ; 50E0   0000
L_50E1:
        ANDR    R0,     R0                      ; 50E1   0180
        SUBR    R7,     R4                      ; 50E2   013C
        ANDR    R1,     R3                      ; 50E3   018B
        SLLC    R3,     2                       ; 50E4   005F
L_50E5:
        DECLE   $0000,  $0000                   ; 50E5   0000 0000

        GSWD    R0                              ; 50E7   0030
        CMPR    R6,     R3                      ; 50E8   0173
        DECLE   $0000,  $0000                   ; 50E9   0000 0000

        DECR    R7                              ; 50EB   0017
        DECLE   $021B,  $0000,  $0000           ; 50EC   021B 0000 0000

        B       L_5101                          ; 50EF   0200 0010

        DECLE   $0001                           ; 50F1   0001

        JSR     R6,     .STIC.VIDEN             ; 50F2   0004 0200 0020
        DECLE   $0001                           ; 50F5   0001

        JSR     R6,     .STIC.A.0               ; 50F6   0004 0200 0010
        DECLE   $0000,  $0000                   ; 50F9   0000 0000

        DECR    R0                              ; 50FB   0010
        SUBR    R0,     R4                      ; 50FC   0104
        DECLE   $0001,  $0004                   ; 50FD   0001 0004

        DIS                                     ; 50FF   0003
        SUB     .STIC.X.1,R0                    ; 5100   0300 0001
        MVII    #$012F, R2                      ; 5102   02BA 002F 0001
        MVII    #$0003, R0                      ; 5105   02B8 0003
L_5107:
        MVI@    R2,     R1                      ; 5107   0291
        MOVR    R1,     R4                      ; 5108   008C
L_5109:
        ANDI    #$0080, R4                      ; 5109   03BC 0080
        BNEQ    L_5120                          ; 510B   020C 0013

        TSTR    R1                              ; 510D   0089
        BEQ     L_5120                          ; 510E   0204 0010

        DECR    R1                              ; 5110   0011
        MVO@    R1,     R2                      ; 5111   0251
        BNEQ    L_5120                          ; 5112   020C 000C

        MVII    #$0080, R1                      ; 5114   02B9 0080
        MVO@    R1,     R2                      ; 5116   0251
        SDBD                                    ; 5117   0001
        MVII    #$02FD, R3                      ; 5118   02BB 00FD 0002
        SUBR    R0,     R3                      ; 511B   0103
        MVI@    R3,     R1                      ; 511C   0299
        MOVR    R0,     R4                      ; 511D   0084
        ADDR    R4,     R1                      ; 511E   00E1
        MVO@    R1,     R3                      ; 511F   0259
L_5120:
        INCR    R2                              ; 5120   000A
        DECR    R0                              ; 5121   0010
        BNEQ    L_5107                          ; 5122   022C 001C

        MOVR    R5,     R7                      ; 5124   00AF
L_5125:
        PSHR    R5                              ; 5125   0275

L_5126:
        JSR     R5,     L_5101                  ; 5126   0004 0150 0101

        MVII    #$0003, R3                      ; 5129   02BB 0003
        SDBD                                    ; 512B   0001
        MVII    #$012F, R4                      ; 512C   02BC 002F 0001
L_512F:
        MVI@    R4,     R1                      ; 512F   02A1
        ANDI    #$0003, R1                      ; 5130   03B9 0003
        BNEQ    L_5126                          ; 5132   022C 000D

        DECR    R3                              ; 5134   0013
        BNEQ    L_512F                          ; 5135   022C 0007

        PULR    R7                              ; 5137   02B7
        RLC     R1,     2                       ; 5138   0055
        RSWD    R5                              ; 5139   003D
        NEGR    R5                              ; 513A   0025
        MVII    #$0098, R2                      ; 513B   02BA 0098
        MVO     R2,     G_02F8                  ; 513D   0242 02F8
        MVII    #$038C, R2                      ; 513F   02BA 038C
        MVO     R2,     G_02F0                  ; 5141   0242 02F0
        J       L_5551                          ; 5143   0004 0354 0151

        MVII    #$00B0, R2                      ; 5146   02BA 00B0
        MVO     R2,     G_02F8                  ; 5148   0242 02F8
        MVII    #$0340, R2                      ; 514A   02BA 0340
        MVO     R2,     G_02F0                  ; 514C   0242 02F0
        PULR    R7                              ; 514E   02B7
L_514F:
        MVI     G_0320, R1                      ; 514F   0281 0320
        ANDI    #$001F, R1                      ; 5151   03B9 001F
        MVO     R1,     G_0320                  ; 5153   0241 0320
        BNEQ    L_51C2                          ; 5155   020C 006B

        MVII    #$0003, R3                      ; 5157   02BB 0003
        SDBD                                    ; 5159   0001
        MVII    #$02FD, R4                      ; 515A   02BC 00FD 0002
L_515D:
        MVI@    R4,     R2                      ; 515D   02A2
        PSHR    R4                              ; 515E   0274
        SUBI    #$0004, R2                      ; 515F   033A 0004
        MVII    #$0003, R1                      ; 5161   02B9 0003

        JSR     R5,     L_51C3                  ; 5163   0004 0150 01C3

        PULR    R4                              ; 5166   02B4
        BNC     L_5179                          ; 5167   0209 0010

        SDBD                                    ; 5169   0001
        MVII    #$74F2, R1                      ; 516A   02B9 00F2 0074
        SUBR    R3,     R1                      ; 516D   0119
        MVI     G_0310, R2                      ; 516E   0282 0310
        AND@    R1,     R2                      ; 5170   038A
        BEQ     L_5179                          ; 5171   0204 0006

        MVI     G_0320, R2                      ; 5173   0282 0320
        XOR@    R1,     R2                      ; 5175   03CA
        MVO     R2,     G_0320                  ; 5176   0242 0320
        PULR    R7                              ; 5178   02B7
L_5179:
        DECR    R3                              ; 5179   0013
        BNEQ    L_515D                          ; 517A   022C 001E

        MVII    #$0003, R3                      ; 517C   02BB 0003
        SDBD                                    ; 517E   0001
        MVII    #$5138, R4                      ; 517F   02BC 0038 0051
L_5182:
        MVI@    R4,     R2                      ; 5182   02A2
        PSHR    R4                              ; 5183   0274
        MVII    #$0004, R1                      ; 5184   02B9 0004

        JSR     R5,     L_51C3                  ; 5186   0004 0150 01C3

        PULR    R4                              ; 5189   02B4
        BNC     L_51AC                          ; 518A   0209 0020

        MVII    #$0135, R2                      ; 518C   02BA 0135
        SUBR    R3,     R2                      ; 518E   011A
        MVI     G_02F0, R0                      ; 518F   0280 02F0
        MVI@    R2,     R1                      ; 5191   0291
        ANDI    #$00FF, R0                      ; 5192   03B8 00FF
        SUBI    #$0002, R1                      ; 5194   0339 0002
        CMPR    R1,     R0                      ; 5196   0148
        BMI     L_51AC                          ; 5197   020B 0013

        ADDI    #$0010, R1                      ; 5199   02F9 0010
        CMPR    R1,     R0                      ; 519B   0148
        BPL     L_51AC                          ; 519C   0203 000E

        SDBD                                    ; 519E   0001
        MVII    #$74F2, R1                      ; 519F   02B9 00F2 0074
        SUBR    R3,     R1                      ; 51A2   0119
        MVI@    R1,     R0                      ; 51A3   0288
        SLL     R0,     2                       ; 51A4   004C
        SLL     R0,     1                       ; 51A5   0048
        MVI     G_0320, R2                      ; 51A6   0282 0320
        XORR    R0,     R2                      ; 51A8   01C2
        MVO     R2,     G_0320                  ; 51A9   0242 0320
        PULR    R7                              ; 51AB   02B7
L_51AC:
        DECR    R3                              ; 51AC   0013
        BNEQ    L_5182                          ; 51AD   022C 002C

        MVI     G_0107, R1                      ; 51AF   0281 0107
        ANDI    #$0007, R1                      ; 51B1   03B9 0007
        CMPI    #$0001, R1                      ; 51B3   0379 0001
        BNEQ    L_51C2                          ; 51B5   020C 000B

L_51B7:
        CLRR    R1                              ; 51B7   01C9
        SDBD                                    ; 51B8   0001
        MVII    #$50AB, R3                      ; 51B9   02BB 00AB 0050

        JSR     R5,     .HEADER                 ; 51BC   0004 0150 0000
        JSR     R5,     L_6DF2                  ; 51BF   0004 016C 01F2

L_51C2:
        PULR    R7                              ; 51C2   02B7
L_51C3:
        ANDI    #$007F, R2                      ; 51C3   03BA 007F
        PSHR    R2                              ; 51C5   0272
        MVI     G_02F8, R4                      ; 51C6   0284 02F8
        ANDI    #$007F, R4                      ; 51C8   03BC 007F
        ADDR    R1,     R2                      ; 51CA   00CA
        CMPR    R2,     R4                      ; 51CB   0154
        BPL     L_51D5                          ; 51CC   0203 0007

        PULR    R2                              ; 51CE   02B2
        SUBR    R1,     R2                      ; 51CF   010A
        CMPR    R2,     R4                      ; 51D0   0154
        BMI     L_51D6                          ; 51D1   020B 0003

        SETC                                    ; 51D3   0007
        MOVR    R5,     R7                      ; 51D4   00AF
L_51D5:
        PULR    R1                              ; 51D5   02B1
L_51D6:
        CLRC                                    ; 51D6   0006
        MOVR    R5,     R7                      ; 51D7   00AF
        INCR    R0                              ; 51D8   0008
        DECR    R0                              ; 51D9   0010
        NEGR    R0                              ; 51DA   0020
        SWAP    R0,     1                       ; 51DB   0040
L_51DC:
        MVI     G_0320, R1                      ; 51DC   0281 0320
        SDBD                                    ; 51DE   0001
        ANDI    #$801F, R1                      ; 51DF   03B9 001F 0080
        MVO     R1,     G_0320                  ; 51E2   0241 0320
        BNEQ    L_523F                          ; 51E4   020C 0059

        MVII    #$0004, R3                      ; 51E6   02BB 0004
        SDBD                                    ; 51E8   0001
        MVII    #$02FA, R4                      ; 51E9   02BC 00FA 0002
L_51EC:
        MVI@    R4,     R2                      ; 51EC   02A2
L_51ED:
        PSHR    R4                              ; 51ED   0274
        SUBI    #$0006, R2                      ; 51EE   033A 0006
        MVII    #$0006, R1                      ; 51F0   02B9 0006
        MVI     G_0126, R5                      ; 51F2   0285 0126
        CMPI    #$0002, R5                      ; 51F4   037D 0002
        BPL     L_51F9                          ; 51F6   0203 0001

        INCR    R1                              ; 51F8   0009

L_51F9:
        JSR     R5,     L_51C3                  ; 51F9   0004 0150 01C3

        PULR    R4                              ; 51FC   02B4
        BC      L_5240                          ; 51FD   0201 0041

L_51FF:
        DECR    R3                              ; 51FF   0013
        BNEQ    L_51EC                          ; 5200   022C 0015

        MVI     G_0107, R1                      ; 5202   0281 0107
        MOVR    R1,     R0                      ; 5204   0088
        ANDI    #$0007, R0                      ; 5205   03B8 0007
        CMPI    #$0001, R0                      ; 5207   0378 0001
        BEQ     L_51B7                          ; 5209   0224 0053

        MVI     G_0107, R0                      ; 520B   0280 0107
        ANDI    #$0008, R0                      ; 520D   03B8 0008
        BNEQ    L_522C                          ; 520F   020C 001B

        MVII    #$02FE, R4                      ; 5211   02BC 02FE
        MVII    #$0002, R3                      ; 5213   02BB 0002
L_5215:
        MVI@    R4,     R2                      ; 5215   02A2
        PSHR    R4                              ; 5216   0274
        MVII    #$0004, R1                      ; 5217   02B9 0004

        JSR     R5,     L_51C3                  ; 5219   0004 0150 01C3

        PULR    R4                              ; 521C   02B4
        BC      L_5224                          ; 521D   0201 0005

L_521F:
        DECR    R3                              ; 521F   0013
        BNEQ    L_5215                          ; 5220   022C 000C
        B       L_522C                          ; 5222   0200 0008

L_5224:
        MVI     G_0310, R1                      ; 5224   0281 0310
        ANDI    #$00E0, R1                      ; 5226   03B9 00E0
        BEQ     L_521F                          ; 5228   0224 000A
        B       L_51B7                          ; 522A   0220 0074

L_522C:
        MVI     G_02F0, R2                      ; 522C   0282 02F0
        ANDI    #$00FF, R2                      ; 522E   03BA 00FF
        CMPI    #$008C, R2                      ; 5230   037A 008C
        BMI     L_523F                          ; 5232   020B 000B

        MVI     G_02F8, R2                      ; 5234   0282 02F8
        ANDI    #$007F, R2                      ; 5236   03BA 007F
        CMPI    #$0018, R2                      ; 5238   037A 0018
        BPL     L_523F                          ; 523A   0203 0003
        J       L_5551                          ; 523C   0004 0354 0151

L_523F:
        PULR    R7                              ; 523F   02B7
L_5240:
        MVI     G_0157, R1                      ; 5240   0281 0157
        TSTR    R1                              ; 5242   0089
        BEQ     L_51FF                          ; 5243   0224 0045

        SDBD                                    ; 5245   0001
        MVII    #$51DC, R1                      ; 5246   02B9 00DC 0051
        SUBR    R3,     R1                      ; 5249   0119
        MVI@    R1,     R0                      ; 524A   0288
        MVI     G_0310, R2                      ; 524B   0282 0310
        SLR     R0,     1                       ; 524D   0060
        ANDR    R0,     R2                      ; 524E   0182
        BEQ     L_51FF                          ; 524F   0224 0051

        SLL     R0,     1                       ; 5251   0048
        SWAP    R0,     1                       ; 5252   0040
        MVI     G_0320, R2                      ; 5253   0282 0320
        XORR    R0,     R2                      ; 5255   01C2
        MVO     R2,     G_0320                  ; 5256   0242 0320
        PULR    R7                              ; 5258   02B7

L_5259:
        JSR     R5,     L_6FBF                  ; 5259   0004 016C 03BF
        JSR     R5,     L_5D09                  ; 525C   0004 015C 0109
        JSR     R5,     L_5007                  ; 525F   0004 0150 0007

        MVI     G_014C, R0                      ; 5262   0280 014C
        TSTR    R0                              ; 5264   0080
        BEQ     L_5259                          ; 5265   0224 000D

        MVII    #$0002, R3                      ; 5267   02BB 0002
        MVO     R3,     G_01E5                  ; 5269   0243 01E5
        MVII    #$0139, R1                      ; 526B   02B9 0139
        ADD     G_013C, R1                      ; 526D   02C1 013C
        MVI@    R1,     R0                      ; 526F   0288
        DECR    R0                              ; 5270   0010
        MVO@    R0,     R1                      ; 5271   0248
        MVI     G_0139, R1                      ; 5272   0281 0139
        TSTR    R1                              ; 5274   0089
        BNEQ    L_53A8                          ; 5275   020C 0131

        MVI     G_013D, R1                      ; 5277   0281 013D
        TSTR    R1                              ; 5279   0089
        BEQ     L_5281                          ; 527A   0204 0005

        MVI     G_013F, R1                      ; 527C   0281 013F
        TSTR    R1                              ; 527E   0089
        BNEQ    L_53A8                          ; 527F   020C 0127

L_5281:
        MVII    #$0200, R4                      ; 5281   02BC 0200
        MVII    #$00F0, R0                      ; 5283   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5285   0004 0114 0338

        MVII    #$0216, R4                      ; 5288   02BC 0216
        MVII    #$0007, R3                      ; 528A   02BB 0007

        JSR     R5,     L_53E1                  ; 528C   0004 0150 03E1
        JSR     R5,     X_PRINT_R5              ; 528F   0004 0118 007B

        NEGR    R0                              ; 5292   0020
        GSWD    R1                              ; 5293   0031
        NEGR    R0                              ; 5294   0020
        RSWD    R5                              ; 5295   003D
        NEGR    R0                              ; 5296   0020
        DECLE   $0000                           ; 5297   0000

        MVII    #$011B, R2                      ; 5298   02BA 011B

        JSR     R5,     L_53ED                  ; 529A   0004 0150 03ED

        MVI     G_013D, R1                      ; 529D   0281 013D
        TSTR    R1                              ; 529F   0089
        BEQ     L_52B7                          ; 52A0   0204 0015

        MVII    #$023E, R4                      ; 52A2   02BC 023E
        MVII    #$0006, R3                      ; 52A4   02BB 0006

        JSR     R5,     L_53E1                  ; 52A6   0004 0150 03E1
        JSR     R5,     X_PRINT_R5              ; 52A9   0004 0118 007B

        NEGR    R0                              ; 52AC   0020
        GSWD    R2                              ; 52AD   0032
        NEGR    R0                              ; 52AE   0020
        RSWD    R5                              ; 52AF   003D
        NEGR    R0                              ; 52B0   0020
        DECLE   $0000                           ; 52B1   0000

        MVII    #$0121, R2                      ; 52B2   02BA 0121

        JSR     R5,     L_53ED                  ; 52B4   0004 0150 03ED

L_52B7:
        MVII    #$0116, R4                      ; 52B7   02BC 0116
        MVII    #$0042, R0                      ; 52B9   02B8 0042

        JSR     R5,     X_FILL_ZERO             ; 52BB   0004 0114 0338
L_52BE:
        JSR     R5,     L_6FBF                  ; 52BE   0004 016C 03BF

        CLRR    R4                              ; 52C1   01E4
        MVII    #$0018, R0                      ; 52C2   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 52C4   0004 0114 0338

        MVII    #$0269, R4                      ; 52C7   02BC 0269
        MVII    #$0005, R3                      ; 52C9   02BB 0005

        JSR     R5,     X_PRINT_R5              ; 52CB   0004 0118 007B

        SWAP    R3,     1                       ; 52CE   0043
        SLL     R3,     2                       ; 52CF   004F
        SLL     R2,     2                       ; 52D0   004E
        SWAP    R3,     2                       ; 52D1   0047
        SLL     R3,     2                       ; 52D2   004F
        NEGR    R0                              ; 52D3   0020
        SWAP    R2,     1                       ; 52D4   0042
        SLL     R3,     2                       ; 52D5   004F
        SLL     R2,     2                       ; 52D6   004E
        SWAP    R3,     2                       ; 52D7   0047
        SLL     R3,     2                       ; 52D8   004F
        DECLE   $0000                           ; 52D9   0000

        MVII    #$02E3, R4                      ; 52DA   02BC 02E3
        MVII    #$0003, R3                      ; 52DC   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 52DE   0004 0118 007B

        SLLC    R3,     1                       ; 52E1   005B
        SWAP    R3,     1                       ; 52E2   0043
        SLLC    R1,     2                       ; 52E3   005D
        NEGR    R0                              ; 52E4   0020
        RLC     R3,     1                       ; 52E5   0053
        SWAP    R1,     2                       ; 52E6   0045
        SWAP    R3,     2                       ; 52E7   0047
        SWAP    R1,     1                       ; 52E8   0041
        NEGR    R0                              ; 52E9   0020
        GSWD    R1                              ; 52EA   0031
        RSWD    R1                              ; 52EB   0039
        RSWD    R0                              ; 52EC   0038
        GSWD    R3                              ; 52ED   0033
        DECLE   $0000                           ; 52EE   0000

        MVII    #$0003, R1                      ; 52EF   02B9 0003
        MVO     R1,     G_0139                  ; 52F1   0241 0139
        MVO     R1,     G_013F                  ; 52F3   0241 013F
        MVII    #$028F, R4                      ; 52F5   02BC 028F
        MVII    #$0007, R3                      ; 52F7   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 52F9   0004 0118 007B

        SLL     R3,     2                       ; 52FC   004F
        SLL     R2,     2                       ; 52FD   004E
        SWAP    R1,     2                       ; 52FE   0045
        NEGR    R0                              ; 52FF   0020
        RLC     R0,     1                       ; 5300   0050
        SLL     R0,     2                       ; 5301   004C
        SWAP    R1,     1                       ; 5302   0041
        SLLC    R1,     1                       ; 5303   0059
        SWAP    R1,     2                       ; 5304   0045
        RLC     R2,     1                       ; 5305   0052
        NEGR    R0                              ; 5306   0020
        SWAP    R3,     2                       ; 5307   0047
        SWAP    R1,     1                       ; 5308   0041
        SLL     R1,     2                       ; 5309   004D
        SWAP    R1,     2                       ; 530A   0045
        DECLE   $0000                           ; 530B   0000

        MVII    #$02B7, R4                      ; 530C   02BC 02B7
        MVII    #$0006, R3                      ; 530E   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5310   0004 0118 007B

        RLC     R0,     2                       ; 5313   0054
        RLC     R3,     2                       ; 5314   0057
        SLL     R3,     2                       ; 5315   004F
        NEGR    R0                              ; 5316   0020
        RLC     R0,     1                       ; 5317   0050
        SLL     R0,     2                       ; 5318   004C
        SWAP    R1,     1                       ; 5319   0041
        SLLC    R1,     1                       ; 531A   0059
        SWAP    R1,     2                       ; 531B   0045
        RLC     R2,     1                       ; 531C   0052
        NEGR    R0                              ; 531D   0020
        SWAP    R3,     2                       ; 531E   0047
        SWAP    R1,     1                       ; 531F   0041
        SLL     R1,     2                       ; 5320   004D
        SWAP    R1,     2                       ; 5321   0045
        DECLE   $0000                           ; 5322   0000

        SDBD                                    ; 5323   0001
        MVII    #$328D, R0                      ; 5324   02B8 008D 0032
        MVO     R0,     .BTAB.8D                ; 5327   0240 028D
        SDBD                                    ; 5329   0001
        MVII    #$0496, R0                      ; 532A   02B8 0096 0004
        MVO     R0,     .BTAB.B5                ; 532D   0240 02B5

        JSR     R5,     L_5C41                  ; 532F   0004 015C 0041

        MVII    #$01FE, R2                      ; 5332   02BA 01FE
        CLRR    R1                              ; 5334   01C9
        MVO     R1,     G_014F                  ; 5335   0241 014F
        MVO     R1,     G_013D                  ; 5337   0241 013D
        MVO     R1,     G_012E                  ; 5339   0241 012E
        MVII    #$03FF, R3                      ; 533B   02BB 03FF
        MVO     R3,     G_0320                  ; 533D   0243 0320
L_533F:
        MVI@    R2,     R0                      ; 533F   0290
        CMPI    #$007E, R0                      ; 5340   0378 007E
        BEQ     L_539F                          ; 5342   0204 005B

        CMPI    #$00BE, R0                      ; 5344   0378 00BE
        BEQ     L_53A3                          ; 5346   0204 005B

        XORI    #$0001, R2                      ; 5348   03FA 0001

        JSR     R5,     L_6FBF                  ; 534A   0004 016C 03BF

        MVI     G_01EE, R0                      ; 534D   0280 01EE
        INCR    R0                              ; 534F   0008
        MVO     R0,     G_01EE                  ; 5350   0240 01EE
        ANDI    #$0003, R0                      ; 5352   03B8 0003
        BNEQ    L_533F                          ; 5354   022C 0016

        MVI     G_0320, R3                      ; 5356   0283 0320
        DECR    R3                              ; 5358   0013
        MVO     R3,     G_0320                  ; 5359   0243 0320
        BEQ     L_539F                          ; 535B   0204 0042

        MVI     G_013D, R3                      ; 535D   0283 013D
        ANDI    #$000F, R3                      ; 535F   03BB 000F
        ADDI    #$0269, R3                      ; 5361   02FB 0269
        MVI@    R3,     R0                      ; 5363   0298
        MOVR    R0,     R4                      ; 5364   0084
        SDBD                                    ; 5365   0001
        ANDI    #$FFF8, R0                      ; 5366   03B8 00F8 00FF
        INCR    R4                              ; 5369   000C
        ANDI    #$0007, R4                      ; 536A   03BC 0007
        ADDR    R4,     R0                      ; 536C   00E0
        MVO@    R0,     R3                      ; 536D   0258
        MVI     G_013D, R0                      ; 536E   0280 013D
        ANDI    #$000F, R0                      ; 5370   03B8 000F
        CMPI    #$000F, R1                      ; 5372   0379 000F
        BEQ     L_533F                          ; 5374   0224 0036

        CMPI    #$0005, R1                      ; 5376   0379 0005
        BEQ     L_533F                          ; 5378   0224 003A

        SLL     R0,     1                       ; 537A   0048
        NEGR    R0                              ; 537B   0020
        ADDI    #$000A, R0                      ; 537C   02F8 000A
        ADDR    R0,     R3                      ; 537E   00C3
        MVI@    R3,     R0                      ; 537F   0298
        SDBD                                    ; 5380   0001
        ANDI    #$FFF8, R0                      ; 5381   03B8 00F8 00FF
        ADDR    R0,     R4                      ; 5384   00C4
        MVO@    R4,     R3                      ; 5385   025C
        MVI     G_013D, R4                      ; 5386   0284 013D
        MOVR    R4,     R3                      ; 5388   00A3
        ANDI    #$0080, R4                      ; 5389   03BC 0080
        BNEQ    L_5398                          ; 538B   020C 000B

        INCR    R3                              ; 538D   000B
        CMPI    #$0005, R3                      ; 538E   037B 0005
        BNEQ    L_5394                          ; 5390   020C 0002

L_5392:
        XORI    #$0080, R3                      ; 5392   03FB 0080
L_5394:
        MVO     R3,     G_013D                  ; 5394   0243 013D
        B       L_533F                          ; 5396   0220 0058

L_5398:
        DECR    R3                              ; 5398   0013
        CMPI    #$007F, R3                      ; 5399   037B 007F
        BEQ     L_5392                          ; 539B   0224 000A
        B       L_5394                          ; 539D   0220 000A

L_539F:
        MVO     R1,     G_013D                  ; 539F   0241 013D
        B       L_54A2                          ; 53A1   0200 00FF

L_53A3:
        INCR    R1                              ; 53A3   0009
        MVO     R1,     G_013D                  ; 53A4   0241 013D
        B       L_54A2                          ; 53A6   0200 00FA

L_53A8:
        MVI     G_013D, R1                      ; 53A8   0281 013D
        TSTR    R1                              ; 53AA   0089
        BEQ     L_53B9                          ; 53AB   0204 000C

L_53AD:
        MVI     G_013C, R1                      ; 53AD   0281 013C
        XORI    #$0006, R1                      ; 53AF   03F9 0006
        MVO     R1,     G_013C                  ; 53B1   0241 013C
        ADDI    #$0139, R1                      ; 53B3   02F9 0139
        MVI@    R1,     R0                      ; 53B5   0288
        TSTR    R0                              ; 53B6   0080
        BEQ     L_53AD                          ; 53B7   0224 000B

L_53B9:
        MVII    #$013B, R1                      ; 53B9   02B9 013B
        ADD     G_013C, R1                      ; 53BB   02C1 013C
        MVI@    R1,     R0                      ; 53BD   0288
        MVO     R0,     G_0126                  ; 53BE   0240 0126
        DECR    R1                              ; 53C0   0011
        MVI@    R1,     R0                      ; 53C1   0288
        CLRR    R1                              ; 53C2   01C9
        TSTR    R0                              ; 53C3   0080
        BEQ     L_53D6                          ; 53C4   0204 0010

        INCR    R1                              ; 53C6   0009
        MVO     R1,     G_0106                  ; 53C7   0241 0106

        JSR     R5,     G_7972                  ; 53C9   0004 0178 0172

        SDBD                                    ; 53CC   0001
        MVII    #$5F5F, R4                      ; 53CD   02BC 005F 005F

        JSR     R5,     G_709F                  ; 53D0   0004 0170 009F

        J       G_7AE2                          ; 53D3   0004 0378 02E2

L_53D6:
        MVI     G_0106, R0                      ; 53D6   0280 0106
        TSTR    R0                              ; 53D8   0080
        BNEQ    L_53DE                          ; 53D9   020C 0003
        J       G_7051                          ; 53DB   0004 0370 0051
L_53DE:
        J       G_7046                          ; 53DE   0004 0370 0046

L_53E1:
        PSHR    R5                              ; 53E1   0275

        JSR     R5,     X_PRINT_R5              ; 53E2   0004 0118 007B

        RLC     R0,     1                       ; 53E5   0050
        SLL     R0,     2                       ; 53E6   004C
        SWAP    R1,     1                       ; 53E7   0041
        SLLC    R1,     1                       ; 53E8   0059
        SWAP    R1,     2                       ; 53E9   0045
        RLC     R2,     1                       ; 53EA   0052
        DECLE   $0000                           ; 53EB   0000

        PULR    R7                              ; 53EC   02B7
L_53ED:
        PSHR    R5                              ; 53ED   0275
        MVII    #$0006, R1                      ; 53EE   02B9 0006
L_53F0:
        PSHR    R1                              ; 53F0   0271
        MVII    #$0001, R1                      ; 53F1   02B9 0001
        MVI@    R2,     R0                      ; 53F3   0290
        DECR    R2                              ; 53F4   0012

        JSR     R5,     X_PRNUM_RGT             ; 53F5   0004 0118 00C5

        PULR    R1                              ; 53F8   02B1
        INCR    R4                              ; 53F9   000C
        DECR    R1                              ; 53FA   0011
        BNEQ    L_53F0                          ; 53FB   022C 000C

        PULR    R7                              ; 53FD   02B7
L_53FE:
        PSHR    R5                              ; 53FE   0275
        MVII    #$0118, R1                      ; 53FF   02B9 0118
        ADD     G_013C, R1                      ; 5401   02C1 013C
        MVII    #$0124, R2                      ; 5403   02BA 0124
        MVII    #$0004, R0                      ; 5405   02B8 0004

        JSR     R5,     L_5412                  ; 5407   0004 0154 0012

        INCR    R1                              ; 540A   0009
        INCR    R2                              ; 540B   000A
        MVII    #$0003, R0                      ; 540C   02B8 0003

        JSR     R5,     L_5412                  ; 540E   0004 0154 0012

        PULR    R7                              ; 5411   02B7
L_5412:
        MVI@    R2,     R3                      ; 5412   0293
L_5413:
        PSHR    R1                              ; 5413   0271
L_5414:
        ADD@    R1,     R3                      ; 5414   02CB
        CMPI    #$000A, R3                      ; 5415   037B 000A
        BPL     L_541C                          ; 5417   0203 0003

        MVO@    R3,     R1                      ; 5419   024B
L_541A:
        PULR    R1                              ; 541A   02B1
        MOVR    R5,     R7                      ; 541B   00AF
L_541C:
        SUBI    #$000A, R3                      ; 541C   033B 000A
        MVO@    R3,     R1                      ; 541E   024B
        DECR    R0                              ; 541F   0010
        BEQ     L_541A                          ; 5420   0224 0007

        INCR    R1                              ; 5422   0009
        MVII    #$0001, R3                      ; 5423   02BB 0001
        B       L_5414                          ; 5425   0220 0012

L_5427:
        PSHR    R5                              ; 5427   0275
        MVI     G_0108, R1                      ; 5428   0281 0108
        CMPI    #$00BD, R1                      ; 542A   0379 00BD
        BNEQ    L_5492                          ; 542C   020C 0064

        CLRR    R0                              ; 542E   01C0
        MVO     R0,     G_031E                  ; 542F   0240 031E

        JSR     R5,     .EXEC.A83               ; 5431   0004 0118 0283
L_5434:
        JSR     R5,     L_6FBF                  ; 5434   0004 016C 03BF
        JSR     R5,     L_5493                  ; 5437   0004 0154 0093

        TSTR    R1                              ; 543A   0089
        BNEQ    L_548E                          ; 543B   020C 0051

        MVI     G_031E, R0                      ; 543D   0280 031E
        INCR    R0                              ; 543F   0008
        MVO     R0,     G_031E                  ; 5440   0240 031E
        SWAP    R0,     1                       ; 5442   0040
        ANDI    #$0040, R0                      ; 5443   03B8 0040
        BEQ     L_5434                          ; 5445   0224 0012

        DIS                                     ; 5447   0003
        SDBD                                    ; 5448   0001
        MVII    #$7216, R0                      ; 5449   02B8 0016 0072
        MVO     R0,     .ISRVEC.0               ; 544C   0240 0100
        SWAP    R0,     1                       ; 544E   0040
        MVO     R0,     .ISRVEC.1               ; 544F   0240 0101
        EIS                                     ; 5451   0002

L_5452:
        JSR     R5,     L_6FBF                  ; 5452   0004 016C 03BF

        CLRR    R1                              ; 5455   01C9
        MVO     R1,     .STIC.BORD              ; 5456   0241 002C

        JSR     R5,     L_5007                  ; 5458   0004 0150 0007
        JSR     R5,     L_5493                  ; 545B   0004 0154 0093

        TSTR    R1                              ; 545E   0089
        BEQ     L_5478                          ; 545F   0204 0017

        DIS                                     ; 5461   0003
        SDBD                                    ; 5462   0001
        MVII    #$721B, R0                      ; 5463   02B8 001B 0072
        MVO     R0,     .ISRVEC.0               ; 5466   0240 0100
        SWAP    R0,     1                       ; 5468   0040
        MVO     R0,     .ISRVEC.1               ; 5469   0240 0101
        EIS                                     ; 546B   0002

        JSR     R5,     L_6FBF                  ; 546C   0004 016C 03BF
        JSR     R5,     L_6FBF                  ; 546F   0004 016C 03BF

        MVII    #$000D, R1                      ; 5472   02B9 000D
        MVO     R1,     .STIC.BORD              ; 5474   0241 002C
        B       L_548E                          ; 5476   0200 0016

L_5478:
        MVI     G_031E, R1                      ; 5478   0281 031E
        MOVR    R1,     R0                      ; 547A   0088
        INCR    R1                              ; 547B   0009
        MVO     R1,     G_031E                  ; 547C   0241 031E
        SDBD                                    ; 547E   0001
        ANDI    #$0FFF, R0                      ; 547F   03B8 00FF 000F
        BNEQ    L_5452                          ; 5482   022C 0031

        CLRR    R1                              ; 5484   01C9
        SDBD                                    ; 5485   0001
        MVII    #$50FB, R3                      ; 5486   02BB 00FB 0050

        JSR     R5,     .HEADER                 ; 5489   0004 0150 0000

        B       L_5452                          ; 548C   0220 003B

L_548E:
        CLRR    R0                              ; 548E   01C0
        DECR    R0                              ; 548F   0010
        MVO     R0,     G_031E                  ; 5490   0240 031E
L_5492:
        PULR    R7                              ; 5492   02B7
L_5493:
        MVI     .PSG0.rgt_hand,R1               ; 5493   0281 01FE
        AND     .PSG0.lft_hand,R1               ; 5495   0381 01FF
        XORI    #$00FF, R1                      ; 5497   03F9 00FF
        MOVR    R5,     R7                      ; 5499   00AF
L_549A:
        MVI     G_0320, R1                      ; 549A   0281 0320
        SWAP    R1,     1                       ; 549C   0041
        ANDI    #$0078, R1                      ; 549D   03B9 0078
        MVO     R1,     G_0157                  ; 549F   0241 0157
        MOVR    R5,     R7                      ; 54A1   00AF
L_54A2:
        CLRR    R1                              ; 54A2   01C9
        MVO     R1,     G_0320                  ; 54A3   0241 0320
        INCR    R1                              ; 54A5   0009
        MVO     R1,     G_0106                  ; 54A6   0241 0106
        MVI     G_0159, R1                      ; 54A8   0281 0159
        TSTR    R1                              ; 54AA   0089
        BEQ     L_54B0                          ; 54AB   0204 0003
        J       L_5AB7                          ; 54AD   0004 0358 02B7

L_54B0:
        INCR    R1                              ; 54B0   0009
        MVO     R1,     G_0159                  ; 54B1   0241 0159

        JSR     R5,     L_6FBF                  ; 54B3   0004 016C 03BF

        CLRR    R0                              ; 54B6   01C0
        MVO     R0,     .STIC.BORD              ; 54B7   0240 002C
        MVO     R0,     G_0144                  ; 54B9   0240 0144
        MVO     R0,     G_01D1                  ; 54BB   0240 01D1
        MVO     R0,     G_01D0                  ; 54BD   0240 01D0
        MVO     R0,     G_033E                  ; 54BF   0240 033E
        MVO     R0,     G_033F                  ; 54C1   0240 033F
        MVO     R0,     G_01EE                  ; 54C3   0240 01EE

        JSR     R5,     .EXEC.A83               ; 54C5   0004 0118 0283

        MVII    #$0001, R0                      ; 54C8   02B8 0001
        MVO     R0,     G_01E5                  ; 54CA   0240 01E5
        MVII    #$02F0, R4                      ; 54CC   02BC 02F0
        SDBD                                    ; 54CE   0001
        MVII    #$5521, R5                      ; 54CF   02BD 0021 0055
        MVII    #$0018, R0                      ; 54D2   02B8 0018
L_54D4:
        SDBD                                    ; 54D4   0001
        MVI@    R5,     R1                      ; 54D5   02A9
        MVO@    R1,     R4                      ; 54D6   0261
        DECR    R0                              ; 54D7   0010
        BNEQ    L_54D4                          ; 54D8   022C 0005

        MVII    #$0200, R4                      ; 54DA   02BC 0200
        MVII    #$00F0, R0                      ; 54DC   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 54DE   0004 0114 0338

        SDBD                                    ; 54E1   0001
        MVII    #$5508, R5                      ; 54E2   02BD 0008 0055
L_54E5:
        MVI@    R5,     R1                      ; 54E5   02A9
        TSTR    R1                              ; 54E6   0089
        BEQ     L_54EE                          ; 54E7   0204 0005

        SDBD                                    ; 54E9   0001
        MVI@    R5,     R0                      ; 54EA   02A8
        MVO@    R0,     R1                      ; 54EB   0248
        B       L_54E5                          ; 54EC   0220 0008

L_54EE:
        SDBD                                    ; 54EE   0001
        MVII    #$653F, R4                      ; 54EF   02BC 003F 0065
        SDBD                                    ; 54F2   0001
        MVII    #$3800, R5                      ; 54F3   02BD 0000 0038
        MVII    #$0008, R1                      ; 54F6   02B9 0008
L_54F8:
        MVII    #$0040, R0                      ; 54F8   02B8 0040
        PSHR    R5                              ; 54FA   0275

        JSR     R5,     L_6FCC                  ; 54FB   0004 016C 03CC

        DECR    R1                              ; 54FE   0011
        BNEQ    L_54F8                          ; 54FF   022C 0008

        CLRR    R0                              ; 5501   01C0
        MVO     R0,     G_0320                  ; 5502   0240 0320
        MVO     R0,     G_012E                  ; 5504   0240 012E
        B       L_5608                          ; 5506   0200 0100

        MVO     R6,     .STIC.X.0               ; 5508   0246 0000
        RSWD    R4                              ; 550A   003C
        MVO     R7,     .STIC.Y.0               ; 550B   0247 0008
        RSWD    R4                              ; 550D   003C
        MVO@    R2,     R3                      ; 550E   025A
        DECR    R5                              ; 550F   0015
        RSWD    R4                              ; 5510   003C
        MVO@    R3,     R3                      ; 5511   025B
        COMR    R5                              ; 5512   001D
        RSWD    R4                              ; 5513   003C
        MVO@    R6,     R5                      ; 5514   026E
        INCR    R5                              ; 5515   000D
        INCR    R0                              ; 5516   0008
        MVO@    R7,     R5                      ; 5517   026F
        NEGR    R5                              ; 5518   0025
        COMR    R6                              ; 5519   001E
        PSHR    R0                              ; 551A   0270
        ADCR    R5                              ; 551B   002D
        INCR    R0                              ; 551C   0008
        MVO@    R4,     R3                      ; 551D   025C
        DECLE   $0035                           ; 551E   0035

        INCR    R0                              ; 551F   0008
        DECLE   $0000                           ; 5520   0000

        SLR     R2,     2                       ; 5521   0066
        DIS                                     ; 5522   0003
        SLR     R2,     2                       ; 5523   0066
        DIS                                     ; 5524   0003
        DECLE   $0000                           ; 5525   0000

        DIS                                     ; 5526   0003
        DECLE   $0000                           ; 5527   0000

        DIS                                     ; 5528   0003
        DECLE   $0000                           ; 5529   0000

        DIS                                     ; 552A   0003
        DECR    R0                              ; 552B   0010
        DIS                                     ; 552C   0003
        DECR    R0                              ; 552D   0010
        DIS                                     ; 552E   0003
        DECLE   $0000                           ; 552F   0000

        DIS                                     ; 5530   0003
        MOVR    R6,     R3                      ; 5531   00B3
        DECLE   $0000                           ; 5532   0000

        MOVR    R5,     R3                      ; 5533   00AB
        DECLE   $0001                           ; 5534   0001

        ADCR    R7                              ; 5535   002F
        DECLE   $0000                           ; 5536   0000

        MOVR    R4,     R7                      ; 5537   00A7
        DECLE   $0000                           ; 5538   0000

        MOVR    R4,     R7                      ; 5539   00A7
        DECLE   $0000                           ; 553A   0000

        MOVR    R5,     R0                      ; 553B   00A8
L_553C:
        DECLE   $0000                           ; 553C   0000

        MOVR    R6,     R0                      ; 553D   00B0
        DECLE   $0000,  $0000,  $0000           ; 553E   0000 0000 0000

        ADDR    R2,     R7                      ; 5541   00D7
        INCR    R0                              ; 5542   0008
        ADDR    R4,     R2                      ; 5543   00E2
        INCR    R0                              ; 5544   0008
        MOVR    R0,     R3                      ; 5545   0083
        COMR    R0                              ; 5546   0018
        TSTR    R2                              ; 5547   0092
        INCR    R0                              ; 5548   0008
        MOVR    R6,     R2                      ; 5549   00B2
        COMR    R0                              ; 554A   0018
        SWAP    R3,     1                       ; 554B   0043
        INCR    R0                              ; 554C   0008
        RLC     R3,     1                       ; 554D   0053
        INCR    R0                              ; 554E   0008
        DECLE   $0000,  $0000                   ; 554F   0000 0000
L_5551:
        JSR     R5,     L_53FE                  ; 5551   0004 0150 03FE

        CLRR    R0                              ; 5554   01C0
        MVO     R0,     G_0320                  ; 5555   0240 0320
        MVII    #$013B, R1                      ; 5557   02B9 013B
        ADD     G_013C, R1                      ; 5559   02C1 013C
        MVI@    R1,     R0                      ; 555B   0288
        CMPI    #$0009, R0                      ; 555C   0378 0009
        BEQ     L_5562                          ; 555E   0204 0002

        INCR    R0                              ; 5560   0008
        MVO@    R0,     R1                      ; 5561   0248
L_5562:
        MVO     R0,     G_0126                  ; 5562   0240 0126
        DECR    R1                              ; 5564   0011
        CLRR    R0                              ; 5565   01C0
        MVO@    R0,     R1                      ; 5566   0248
        SDBD                                    ; 5567   0001
        MVII    #$625F, R4                      ; 5568   02BC 005F 0062
        MVII    #$0050, R0                      ; 556B   02B8 0050
        SDBD                                    ; 556D   0001
        MVII    #$3920, R5                      ; 556E   02BD 0020 0039
        PSHR    R5                              ; 5571   0275

        JSR     R5,     L_6FCC                  ; 5572   0004 016C 03CC

        SDBD                                    ; 5575   0001
        MVII    #$6C5B, R4                      ; 5576   02BC 005B 006C
        SDBD                                    ; 5579   0001
        MVII    #$38A0, R5                      ; 557A   02BD 00A0 0038
        MVII    #$0038, R0                      ; 557D   02B8 0038
        PSHR    R5                              ; 557F   0275

        JSR     R5,     L_6FCC                  ; 5580   0004 016C 03CC

        SDBD                                    ; 5583   0001
        MVII    #$02F2, R4                      ; 5584   02BC 00F2 0002
        SDBD                                    ; 5587   0001
        MVII    #$55A0, R5                      ; 5588   02BD 00A0 0055
        MVII    #$0003, R3                      ; 558B   02BB 0003
L_558D:
        MVII    #$0006, R2                      ; 558D   02BA 0006
L_558F:
        SDBD                                    ; 558F   0001
        MVI@    R5,     R1                      ; 5590   02A9
        MVO@    R1,     R4                      ; 5591   0261
        DECR    R2                              ; 5592   0012
        BNEQ    L_558F                          ; 5593   022C 0005

        ADDI    #$0002, R4                      ; 5595   02FC 0002
        DECR    R3                              ; 5597   0013
        BNEQ    L_558D                          ; 5598   022C 000C

        MVII    #$0001, R1                      ; 559A   02B9 0001
        MVO     R1,     G_0144                  ; 559C   0241 0144
        B       L_5608                          ; 559E   0200 0068

        DECLE   $0000                           ; 55A0   0000

        DIS                                     ; 55A1   0003
        DECLE   $0000                           ; 55A2   0000

        DIS                                     ; 55A3   0003
        DECLE   $0000                           ; 55A4   0000

        DIS                                     ; 55A5   0003
        DECLE   $0000                           ; 55A6   0000

        DIS                                     ; 55A7   0003
        DECLE   $0000                           ; 55A8   0000

        DIS                                     ; 55A9   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 55B6   0000 0000

        MOVR    R4,     R3                      ; 55B8   00A3
        COMR    R0                              ; 55B9   0018
        MOVR    R7,     R2                      ; 55BA   00BA
        INCR    R0                              ; 55BB   0008
        ADDR    R1,     R2                      ; 55BC   00CA
        COMR    R0                              ; 55BD   0018
        MOVR    R7,     R2                      ; 55BE   00BA
        INCR    R0                              ; 55BF   0008
        ADDR    R1,     R2                      ; 55C0   00CA
        COMR    R0                              ; 55C1   0018

L_55C2:
        JSR     R5,     L_5125                  ; 55C2   0004 0150 0125

        MVI     G_02F0, R2                      ; 55C5   0282 02F0
        SUBI    #$0004, R2                      ; 55C7   033A 0004
        MVO     R2,     G_02F2                  ; 55C9   0242 02F2
        ADDI    #$0004, R2                      ; 55CB   02FA 0004
        MVO     R2,     G_02F3                  ; 55CD   0242 02F3
        ADDI    #$0004, R2                      ; 55CF   02FA 0004
        MVO     R2,     G_02F4                  ; 55D1   0242 02F4
        MVI     G_02F8, R2                      ; 55D3   0282 02F8
        ANDI    #$007F, R2                      ; 55D5   03BA 007F
        XORI    #$0100, R2                      ; 55D7   03FA 0100
        MVO     R2,     G_02FA                  ; 55D9   0242 02FA
        MVO     R2,     G_02FB                  ; 55DB   0242 02FB
        MVO     R2,     G_02FC                  ; 55DD   0242 02FC
        XORI    #$0180, R2                      ; 55DF   03FA 0180
        SUBI    #$0004, R2                      ; 55E1   033A 0004
        SDBD                                    ; 55E3   0001
        XORI    #$0800, R2                      ; 55E4   03FA 0000 0008
        MVO     R2,     G_02F8                  ; 55E7   0242 02F8
        ADDI    #$0002, R2                      ; 55E9   02FA 0002
        MVO     R2,     G_02F9                  ; 55EB   0242 02F9
        MVII    #$0008, R1                      ; 55ED   02B9 0008
        MVO     R1,     G_0320                  ; 55EF   0241 0320
        MVII    #$0014, R2                      ; 55F1   02BA 0014
        MVO     R2,     G_012D                  ; 55F3   0242 012D
        MVII    #$0002, R1                      ; 55F5   02B9 0002
        MVO     R1,     G_0144                  ; 55F7   0241 0144
        CLRR    R0                              ; 55F9   01C0
        MVO     R0,     G_01EE                  ; 55FA   0240 01EE
        MVI     G_02F5, R0                      ; 55FC   0280 02F5
        XORI    #$0200, R0                      ; 55FE   03F8 0200
        MVO     R0,     G_02F5                  ; 5600   0240 02F5
        MVI     G_02F6, R0                      ; 5602   0280 02F6
        XORI    #$0200, R0                      ; 5604   03F8 0200
        MVO     R0,     G_02F6                  ; 5606   0240 02F6
L_5608:
        CLRR    R1                              ; 5608   01C9
        MVII    #$02F0, R4                      ; 5609   02BC 02F0
        MVII    #$0018, R0                      ; 560B   02B8 0018

        JSR     R5,     L_6FBF                  ; 560D   0004 016C 03BF
        JSR     R5,     .EXEC.730               ; 5610   0004 0114 0330

        MVI     G_01E4, R1                      ; 5613   0281 01E4
        TSTR    R1                              ; 5615   0089
        BNEQ    L_561B                          ; 5616   020C 0003

        JSR     R5,     L_5D09                  ; 5618   0004 015C 0109
L_561B:
        JSR     R5,     L_5007                  ; 561B   0004 0150 0007

        MVI     G_01EE, R0                      ; 561E   0280 01EE
        INCR    R0                              ; 5620   0008
        SDBD                                    ; 5621   0001
        MVII    #$5608, R5                      ; 5622   02BD 0008 0056
        MVO     R0,     G_01EE                  ; 5625   0240 01EE
        ANDI    #$0007, R0                      ; 5627   03B8 0007
        ADDR    R0,     R0                      ; 5629   00C0
        MVI     G_0144, R1                      ; 562A   0281 0144
        SLL     R1,     2                       ; 562C   004D
        SLL     R1,     2                       ; 562D   004D
        ADDR    R1,     R0                      ; 562E   00C8
        SDBD                                    ; 562F   0001
        ADDI    #$5634, R0                      ; 5630   02F8 0034 0056
        MOVR    R0,     R7                      ; 5633   0087
        B       L_5689                          ; 5634   0200 0053

        MOVR    R5,     R7                      ; 5636   00AF
        DECLE   $0000                           ; 5637   0000

        MOVR    R5,     R7                      ; 5638   00AF
        DECLE   $0000                           ; 5639   0000

        MOVR    R5,     R7                      ; 563A   00AF
        DECLE   $0000                           ; 563B   0000

        B       L_5689                          ; 563C   0200 004B

        MOVR    R5,     R7                      ; 563E   00AF
        DECLE   $0000                           ; 563F   0000

        MOVR    R5,     R7                      ; 5640   00AF
        DECLE   $0000                           ; 5641   0000

        MOVR    R5,     R7                      ; 5642   00AF
        DECLE   $0000                           ; 5643   0000

        B       L_5676                          ; 5644   0200 0030
        B       L_5681                          ; 5646   0200 0039

        MOVR    R5,     R7                      ; 5648   00AF
        DECLE   $0000                           ; 5649   0000

        MOVR    R5,     R7                      ; 564A   00AF
        DECLE   $0000                           ; 564B   0000

        MOVR    R5,     R7                      ; 564C   00AF
        DECLE   $0000                           ; 564D   0000

        B       L_5681                          ; 564E   0200 0031

        MOVR    R5,     R7                      ; 5650   00AF
        DECLE   $0000                           ; 5651   0000

        MOVR    R5,     R7                      ; 5652   00AF
        DECLE   $0000                           ; 5653   0000

        B       L_5664                          ; 5654   0200 000E
        B       L_566C                          ; 5656   0200 0014

        MOVR    R5,     R7                      ; 5658   00AF
        DECLE   $0000                           ; 5659   0000

        MOVR    R5,     R7                      ; 565A   00AF
        DECLE   $0000                           ; 565B   0000

        MOVR    R5,     R7                      ; 565C   00AF
        DECLE   $0000                           ; 565D   0000

        B       L_566C                          ; 565E   0200 000C

        MOVR    R5,     R7                      ; 5660   00AF
        DECLE   $0000                           ; 5661   0000

        B       L_5671                          ; 5662   0200 000D

L_5664:
        PSHR    R5                              ; 5664   0275

        JSR     R5,     G_7715                  ; 5665   0004 0174 0315
        JSR     R5,     G_7745                  ; 5668   0004 0174 0345

        PULR    R7                              ; 566B   02B7
L_566C:
        PSHR    R5                              ; 566C   0275

        JSR     R5,     L_5697                  ; 566D   0004 0154 0297

        PULR    R7                              ; 5670   02B7
L_5671:
        PSHR    R5                              ; 5671   0275

        JSR     R5,     L_6D07                  ; 5672   0004 016C 0107

        PULR    R7                              ; 5675   02B7
L_5676:
        PSHR    R5                              ; 5676   0275
        MVI     G_0320, R1                      ; 5677   0281 0320
        ANDI    #$0004, R1                      ; 5679   03B9 0004
        BNEQ    L_5680                          ; 567B   020C 0003

        JSR     R5,     G_7745                  ; 567D   0004 0174 0345

L_5680:
        PULR    R7                              ; 5680   02B7
L_5681:
        PSHR    R5                              ; 5681   0275

        JSR     R5,     L_56D8                  ; 5682   0004 0154 02D8
        JSR     R5,     L_5964                  ; 5685   0004 0158 0164

        PULR    R7                              ; 5688   02B7
L_5689:
        PSHR    R5                              ; 5689   0275

        JSR     R5,     L_59CE                  ; 568A   0004 0158 01CE
        JSR     R5,     L_5975                  ; 568D   0004 0158 0175
        JSR     R5,     L_5982                  ; 5690   0004 0158 0182
        JSR     R5,     L_5AE1                  ; 5693   0004 0158 02E1

        PULR    R7                              ; 5696   02B7
L_5697:
        MVI     G_02F2, R2                      ; 5697   0282 02F2
        ANDI    #$00FF, R2                      ; 5699   03BA 00FF
        CMPI    #$0072, R2                      ; 569B   037A 0072
        BMI     L_56AC                          ; 569D   020B 000D

        MVII    #$0005, R1                      ; 569F   02B9 0005
        MVII    #$02F0, R2                      ; 56A1   02BA 02F0
L_56A3:
        MVI@    R2,     R0                      ; 56A3   0290
        SUBI    #$0002, R0                      ; 56A4   0338 0002
        MVO@    R0,     R2                      ; 56A6   0250
        INCR    R2                              ; 56A7   000A
        DECR    R1                              ; 56A8   0011
        BNEQ    L_56A3                          ; 56A9   022C 0007

        MOVR    R5,     R7                      ; 56AB   00AF
L_56AC:
        MVI     G_02FA, R2                      ; 56AC   0282 02FA
        ANDI    #$007F, R2                      ; 56AE   03BA 007F
        CMPI    #$0036, R2                      ; 56B0   037A 0036
        BPL     L_56C0                          ; 56B2   0203 000C

        MVII    #$0005, R1                      ; 56B4   02B9 0005
        MVII    #$02F8, R3                      ; 56B6   02BB 02F8
L_56B8:
        MVI@    R3,     R0                      ; 56B8   0298
        INCR    R0                              ; 56B9   0008
        MVO@    R0,     R3                      ; 56BA   0258
        INCR    R3                              ; 56BB   000B
        DECR    R1                              ; 56BC   0011
        BNEQ    L_56B8                          ; 56BD   022C 0006

        MOVR    R5,     R7                      ; 56BF   00AF
L_56C0:
        PULR    R2                              ; 56C0   02B2
        SDBD                                    ; 56C1   0001
        MVII    #$50A3, R3                      ; 56C2   02BB 00A3 0050
        CLRR    R1                              ; 56C5   01C9

        JSR     R5,     .HEADER                 ; 56C6   0004 0150 0000

        MVI     G_02F5, R0                      ; 56C9   0280 02F5
        XORI    #$0200, R0                      ; 56CB   03F8 0200
        MVO     R0,     G_02F5                  ; 56CD   0240 02F5
        MVI     G_02F6, R0                      ; 56CF   0280 02F6
        XORI    #$0200, R0                      ; 56D1   03F8 0200
        MVO     R0,     G_02F6                  ; 56D3   0240 02F6
        J       G_70BF                          ; 56D5   0004 0370 00BF

L_56D8:
        PSHR    R5                              ; 56D8   0275
        MVI     G_02F0, R2                      ; 56D9   0282 02F0
        MVI     G_02F8, R3                      ; 56DB   0283 02F8
        MVI     G_0320, R0                      ; 56DD   0280 0320
        SARC    R0,     1                       ; 56DF   0078
        SARC    R0,     1                       ; 56E0   0078
        BC      L_5868                          ; 56E1   0201 0185

        SARC    R0,     1                       ; 56E3   0078
        BC      L_5831                          ; 56E4   0201 014B

        SARC    R0,     1                       ; 56E6   0078
        BC      L_57E0                          ; 56E7   0201 00F7

        SARC    R0,     1                       ; 56E9   0078
        BC      L_5738                          ; 56EA   0201 004C

        PSHR    R2                              ; 56EC   0272

        JSR     R5,     G_72D3                  ; 56ED   0004 0170 02D3

        PULR    R2                              ; 56F0   02B2
        SARC    R0,     1                       ; 56F1   0078
        BC      L_5714                          ; 56F2   0201 0020

        SDBD                                    ; 56F4   0001
        ANDI    #$0BFF, R3                      ; 56F5   03BB 00FF 000B
        INCR    R2                              ; 56F8   000A

        JSR     R5,     G_7F47                  ; 56F9   0004 017C 0347

        TSTR    R1                              ; 56FC   0089
        BNEQ    L_570D                          ; 56FD   020C 000E

        MVO     R3,     G_02F8                  ; 56FF   0243 02F8
        MVO     R2,     G_02F0                  ; 5701   0242 02F0
        SUBI    #$0002, R3                      ; 5703   033B 0002
        MVO     R3,     G_02F9                  ; 5705   0243 02F9
        MVO     R2,     G_02F1                  ; 5707   0242 02F1

        JSR     R5,     L_5952                  ; 5709   0004 0158 0152

        PULR    R7                              ; 570C   02B7
L_570D:
        MVI     G_0320, R1                      ; 570D   0281 0320
        XORI    #$0020, R1                      ; 570F   03F9 0020
        MVO     R1,     G_0320                  ; 5711   0241 0320
        PULR    R7                              ; 5713   02B7
L_5714:
        DECR    R3                              ; 5714   0013
        MVO     R3,     G_02F8                  ; 5715   0243 02F8
        SUBI    #$0002, R3                      ; 5717   033B 0002
        MVO     R3,     G_02F9                  ; 5719   0243 02F9
        PSHR    R3                              ; 571B   0273
        ANDI    #$0001, R3                      ; 571C   03BB 0001
        SUBR    R3,     R2                      ; 571E   011A
        MVO     R2,     G_02F0                  ; 571F   0242 02F0
        MVO     R2,     G_02F1                  ; 5721   0242 02F1

        JSR     R5,     L_5952                  ; 5723   0004 0158 0152

        PULR    R3                              ; 5726   02B3
        ANDI    #$007F, R3                      ; 5727   03BB 007F
        CMPI    #$000E, R3                      ; 5729   037B 000E
        BEQ     L_572E                          ; 572B   0204 0001

        PULR    R7                              ; 572D   02B7
L_572E:
        MVI     G_0320, R1                      ; 572E   0281 0320
        XORI    #$0010, R1                      ; 5730   03F9 0010
        MVO     R1,     G_0320                  ; 5732   0241 0320
        CLRR    R0                              ; 5734   01C0
        MVO     R0,     G_012E                  ; 5735   0240 012E
        PULR    R7                              ; 5737   02B7
L_5738:
        MVI     G_012E, R4                      ; 5738   0284 012E
        INCR    R4                              ; 573A   000C
        MVO     R4,     G_012E                  ; 573B   0244 012E
        CMPI    #$0008, R4                      ; 573D   037C 0008
        BEQ     L_5752                          ; 573F   0204 0011

        CMPI    #$0010, R4                      ; 5741   037C 0010
        BEQ     L_576F                          ; 5743   0204 002A

        CMPI    #$0018, R4                      ; 5745   037C 0018
        BEQ     L_577E                          ; 5747   0204 0035

        CMPI    #$0024, R4                      ; 5749   037C 0024
        BEQ     L_57A5                          ; 574B   0204 0058

        CMPI    #$0019, R4                      ; 574D   037C 0019
        BPL     L_57AF                          ; 574F   0203 005E

L_5751:
        PULR    R7                              ; 5751   02B7
L_5752:
        ANDI    #$007F, R3                      ; 5752   03BB 007F
        MVO     R3,     G_02FA                  ; 5754   0243 02FA
        ADDI    #$0003, R3                      ; 5756   02FB 0003
        MVO     R3,     G_02FB                  ; 5758   0243 02FB
        MVO     R3,     G_02FC                  ; 575A   0243 02FC
        ADDI    #$0004, R2                      ; 575C   02FA 0004
        MVO     R2,     G_02F2                  ; 575E   0242 02F2
        ADDI    #$0002, R2                      ; 5760   02FA 0002
        MVO     R2,     G_02F3                  ; 5762   0242 02F3
        MVO     R3,     G_02F4                  ; 5764   0243 02F4
        CLRR    R1                              ; 5766   01C9
        SDBD                                    ; 5767   0001
        MVII    #$50EB, R3                      ; 5768   02BB 00EB 0050

        JSR     R5,     .HEADER                 ; 576B   0004 0150 0000

        PULR    R7                              ; 576E   02B7
L_576F:
        SDBD                                    ; 576F   0001
        MVII    #$18B3, R1                      ; 5770   02B9 00B3 0018
        MVO     R1,     G_0302                  ; 5773   0241 0302
        MVI     G_02FB, R1                      ; 5775   0281 02FB
        SUBI    #$0006, R1                      ; 5777   0339 0006
        MVO     R1,     G_02FB                  ; 5779   0241 02FB
        MVO     R1,     G_02FC                  ; 577B   0241 02FC
        PULR    R7                              ; 577D   02B7
L_577E:
        MVI     G_02F8, R1                      ; 577E   0281 02F8
        SDBD                                    ; 5780   0001
        XORI    #$0400, R1                      ; 5781   03F9 0000 0004
        MVO     R1,     G_02F8                  ; 5784   0241 02F8
        MVI     G_02F9, R1                      ; 5786   0281 02F9
        SDBD                                    ; 5788   0001
        XORI    #$0400, R1                      ; 5789   03F9 0000 0004
        MVO     R1,     G_02F9                  ; 578C   0241 02F9
        MVI     G_02FA, R1                      ; 578E   0281 02FA
        SDBD                                    ; 5790   0001
        XORI    #$0400, R1                      ; 5791   03F9 0000 0004
        MVO     R1,     G_02FA                  ; 5794   0241 02FA
        MVI     G_02F2, R1                      ; 5796   0281 02F2
        SUBI    #$0006, R1                      ; 5798   0339 0006
        MVO     R1,     G_02F2                  ; 579A   0241 02F2
        MVI     G_02F3, R1                      ; 579C   0281 02F3
        SUBI    #$000C, R1                      ; 579E   0339 000C
        MVO     R1,     G_02F3                  ; 57A0   0241 02F3
        MVO     R1,     G_02F4                  ; 57A2   0241 02F4
        PULR    R7                              ; 57A4   02B7
L_57A5:
        CLRR    R0                              ; 57A5   01C0
        MVO     R0,     G_012E                  ; 57A6   0240 012E
        MVI     G_0320, R1                      ; 57A8   0281 0320
        XORI    #$0008, R1                      ; 57AA   03F9 0008
        MVO     R1,     G_0320                  ; 57AC   0241 0320
        PULR    R7                              ; 57AE   02B7
L_57AF:
        CMPI    #$001F, R4                      ; 57AF   037C 001F
        BPL     L_5751                          ; 57B1   0223 0061

        MVI     G_02F0, R2                      ; 57B3   0282 02F0
        MVI     G_02F8, R3                      ; 57B5   0283 02F8
        INCR    R3                              ; 57B7   000B
        MVO     R3,     G_02F8                  ; 57B8   0243 02F8
        SUBI    #$0002, R3                      ; 57BA   033B 0002
        MVO     R3,     G_02F9                  ; 57BC   0243 02F9
        ANDI    #$0001, R3                      ; 57BE   03BB 0001
        ADDR    R3,     R2                      ; 57C0   00DA
        MVO     R2,     G_02F0                  ; 57C1   0242 02F0
        MVO     R2,     G_02F1                  ; 57C3   0242 02F1
        SDBD                                    ; 57C5   0001
        MVII    #$02F2, R2                      ; 57C6   02BA 00F2 0002
        SDBD                                    ; 57C9   0001
        MVII    #$02FA, R3                      ; 57CA   02BB 00FA 0002
        MVII    #$0003, R4                      ; 57CD   02BC 0003
L_57CF:
        MVI@    R3,     R1                      ; 57CF   0299
        INCR    R1                              ; 57D0   0009
        MVO@    R1,     R3                      ; 57D1   0259
        ANDI    #$0001, R1                      ; 57D2   03B9 0001
        MVI@    R2,     R0                      ; 57D4   0290
        ADDR    R1,     R0                      ; 57D5   00C8
        MVO@    R0,     R2                      ; 57D6   0250
        INCR    R2                              ; 57D7   000A
        INCR    R3                              ; 57D8   000B
        DECR    R4                              ; 57D9   0014
        BNEQ    L_57CF                          ; 57DA   022C 000C

        JSR     R5,     L_5952                  ; 57DC   0004 0158 0152

        PULR    R7                              ; 57DF   02B7
L_57E0:
        MVI     G_012E, R3                      ; 57E0   0283 012E
        INCR    R3                              ; 57E2   000B
        MVO     R3,     G_012E                  ; 57E3   0243 012E
        CMPI    #$0008, R3                      ; 57E5   037B 0008
        BEQ     L_580A                          ; 57E7   0204 0021

        CMPI    #$0010, R3                      ; 57E9   037B 0010
        BEQ     L_5819                          ; 57EB   0204 002C

        CMPI    #$0018, R3                      ; 57ED   037B 0018
        BNEQ    L_5809                          ; 57EF   020C 0018

        MVI     G_0320, R1                      ; 57F1   0281 0320
        XORI    #$0004, R1                      ; 57F3   03F9 0004
        MVO     R1,     G_0320                  ; 57F5   0241 0320

        JSR     R5,     .EXEC.A83               ; 57F7   0004 0118 0283

        CLRR    R1                              ; 57FA   01C9
        MVO     R1,     G_01D0                  ; 57FB   0241 01D0
        MVO     R1,     G_01D1                  ; 57FD   0241 01D1
        MVO     R1,     G_033E                  ; 57FF   0241 033E
        MVO     R1,     G_033F                  ; 5801   0241 033F
        MVO     R1,     G_012E                  ; 5803   0241 012E
L_5805:
        MVII    #$0003, R1                      ; 5805   02B9 0003
        MVO     R1,     G_01E5                  ; 5807   0241 01E5
L_5809:
        PULR    R7                              ; 5809   02B7
L_580A:
        SDBD                                    ; 580A   0001
        MVII    #$18AB, R1                      ; 580B   02B9 00AB 0018
        MVO     R1,     G_0302                  ; 580E   0241 0302
        MVI     G_02FB, R1                      ; 5810   0281 02FB
        ADDI    #$0003, R1                      ; 5812   02F9 0003
        MVO     R1,     G_02FB                  ; 5814   0241 02FB
        MVO     R1,     G_02FC                  ; 5816   0241 02FC
        PULR    R7                              ; 5818   02B7
L_5819:
        SDBD                                    ; 5819   0001
        MVII    #$18A3, R1                      ; 581A   02B9 00A3 0018
        MVO     R1,     G_0302                  ; 581D   0241 0302
        MVI     G_02FB, R1                      ; 581F   0281 02FB
        ADDI    #$0003, R1                      ; 5821   02F9 0003
        MVO     R1,     G_02FB                  ; 5823   0241 02FB
        MVO     R1,     G_02FC                  ; 5825   0241 02FC
        MVII    #$0001, R1                      ; 5827   02B9 0001
        SDBD                                    ; 5829   0001
        MVII    #$50EB, R3                      ; 582A   02BB 00EB 0050

        JSR     R5,     .HEADER                 ; 582D   0004 0150 0000

        PULR    R7                              ; 5830   02B7
L_5831:
        MVI     G_012E, R3                      ; 5831   0283 012E
        INCR    R3                              ; 5833   000B
        MVO     R3,     G_012E                  ; 5834   0243 012E
        CMPI    #$0038, R3                      ; 5836   037B 0038
        BEQ     L_585E                          ; 5838   0204 0024

        MVI     G_02F3, R1                      ; 583A   0281 02F3
        SUBI    #$0003, R1                      ; 583C   0339 0003
        MVO     R1,     G_02F5                  ; 583E   0241 02F5
        MVO     R1,     G_02F6                  ; 5840   0241 02F6
        MVI     G_02FB, R1                      ; 5842   0281 02FB
        MVO     R1,     G_02FD                  ; 5844   0241 02FD
        MVO     R1,     G_02FE                  ; 5846   0241 02FE
        SDBD                                    ; 5848   0001
        MVII    #$773F, R4                      ; 5849   02BC 003F 0077
        MVII    #$0006, R3                      ; 584C   02BB 0006
L_584E:
        MVI@    R4,     R1                      ; 584E   02A1
        MVI@    R1,     R0                      ; 584F   0288
        MOVR    R0,     R2                      ; 5850   0082
        SDBD                                    ; 5851   0001
        ANDI    #$3FF8, R2                      ; 5852   03BA 00F8 003F
        INCR    R0                              ; 5855   0008
        ANDI    #$0007, R0                      ; 5856   03B8 0007
        ADDR    R0,     R2                      ; 5858   00C2
        MVO@    R2,     R1                      ; 5859   024A
        DECR    R3                              ; 585A   0013
        BNEQ    L_584E                          ; 585B   022C 000E

        PULR    R7                              ; 585D   02B7
L_585E:
        CLRR    R1                              ; 585E   01C9
        MVO     R1,     G_012E                  ; 585F   0241 012E
        MVII    #$0320, R1                      ; 5861   02B9 0320
        XORI    #$0002, R1                      ; 5863   03F9 0002
        MVO     R1,     G_0320                  ; 5865   0241 0320
        PULR    R7                              ; 5867   02B7
L_5868:
        MVI     G_012E, R1                      ; 5868   0281 012E
        TSTR    R1                              ; 586A   0089
        BEQ     L_5887                          ; 586B   0204 001A

        INCR    R1                              ; 586D   0009
        MVO     R1,     G_012E                  ; 586E   0241 012E
        CMPI    #$0030, R1                      ; 5870   0379 0030
        BEQ     L_5875                          ; 5872   0204 0001

        PULR    R7                              ; 5874   02B7
L_5875:
        MVII    #$0340, R6                      ; 5875   02BE 0340
        CLRR    R0                              ; 5877   01C0
        MVO     R0,     G_012E                  ; 5878   0240 012E
        MVO     R0,     G_0106                  ; 587A   0240 0106
        MVO     R0,     G_0320                  ; 587C   0240 0320
        MVO     R0,     G_0107                  ; 587E   0240 0107
        MVII    #$0002, R1                      ; 5880   02B9 0002
        MVO     R1,     G_01E5                  ; 5882   0241 01E5
        J       G_7046                          ; 5884   0004 0370 0046

L_5887:
        INCR    R1                              ; 5887   0009
        MVO     R1,     G_012E                  ; 5888   0241 012E
        MVII    #$02F0, R4                      ; 588A   02BC 02F0
        MVII    #$0018, R0                      ; 588C   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 588E   0004 0114 0338

        MVII    #$0200, R4                      ; 5891   02BC 0200
        MVII    #$00F0, R0                      ; 5893   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5895   0004 0114 0338

        MVII    #$0003, R3                      ; 5898   02BB 0003
        MVII    #$0251, R4                      ; 589A   02BC 0251

        JSR     R5,     X_PRINT_R5              ; 589C   0004 0118 007B

        SWAP    R3,     1                       ; 589F   0043
        SLL     R3,     2                       ; 58A0   004F
        SLL     R2,     2                       ; 58A1   004E
        SWAP    R3,     2                       ; 58A2   0047
        RLC     R2,     1                       ; 58A3   0052
        SWAP    R1,     1                       ; 58A4   0041
        RLC     R0,     2                       ; 58A5   0054
        RLC     R1,     2                       ; 58A6   0055
        SLL     R0,     2                       ; 58A7   004C
        SWAP    R1,     1                       ; 58A8   0041
        RLC     R0,     2                       ; 58A9   0054
        SLL     R1,     1                       ; 58AA   0049
        SLL     R3,     2                       ; 58AB   004F
        SLL     R2,     2                       ; 58AC   004E
        RLC     R3,     1                       ; 58AD   0053
        NEGR    R0                              ; 58AE   0020
        NEGR    R1                              ; 58AF   0021
        NEGR    R1                              ; 58B0   0021
        DECLE   $0000                           ; 58B1   0000

        MVI     G_0126, R0                      ; 58B2   0280 0126
        MOVR    R0,     R1                      ; 58B4   0081
        MVII    #$0003, R3                      ; 58B5   02BB 0003
        ANDI    #$0001, R1                      ; 58B7   03B9 0001
        BEQ     L_591F                          ; 58B9   0204 0064

        ANDI    #$000E, R0                      ; 58BB   03B8 000E
        SDBD                                    ; 58BD   0001
        ADDI    #$58C2, R0                      ; 58BE   02F8 00C2 0058
        MOVR    R0,     R7                      ; 58C1   0087
        B       L_58CC                          ; 58C2   0200 0008
        B       L_58DC                          ; 58C4   0200 0016
        B       L_58EE                          ; 58C6   0200 0026
        B       L_58FF                          ; 58C8   0200 0035
        B       L_590A                          ; 58CA   0200 003E

L_58CC:
        MVII    #$0291, R4                      ; 58CC   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 58CE   0004 0118 007B

        RLC     R2,     2                       ; 58D1   0056
        SWAP    R1,     2                       ; 58D2   0045
        RLC     R2,     1                       ; 58D3   0052
        SLLC    R1,     1                       ; 58D4   0059
        NEGR    R0                              ; 58D5   0020
        SWAP    R3,     2                       ; 58D6   0047
        SLL     R3,     2                       ; 58D7   004F
        SLL     R3,     2                       ; 58D8   004F
        SWAP    R0,     2                       ; 58D9   0044
        DECLE   $0000                           ; 58DA   0000

        PULR    R7                              ; 58DB   02B7
L_58DC:
        MVII    #$0290, R4                      ; 58DC   02BC 0290

        JSR     R5,     X_PRINT_R5              ; 58DE   0004 0118 007B

        SLL     R3,     2                       ; 58E1   004F
        RLC     R1,     2                       ; 58E2   0055
        RLC     R0,     2                       ; 58E3   0054
        RLC     R3,     1                       ; 58E4   0053
        RLC     R0,     2                       ; 58E5   0054
        SWAP    R1,     1                       ; 58E6   0041
        SLL     R2,     2                       ; 58E7   004E
        SWAP    R0,     2                       ; 58E8   0044
        SLL     R1,     1                       ; 58E9   0049
        SLL     R2,     2                       ; 58EA   004E
        SWAP    R3,     2                       ; 58EB   0047
        DECLE   $0000                           ; 58EC   0000

        PULR    R7                              ; 58ED   02B7
L_58EE:
        MVII    #$0291, R4                      ; 58EE   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 58F0   0004 0118 007B

        SLL     R1,     1                       ; 58F3   0049
        SLL     R2,     2                       ; 58F4   004E
        SWAP    R3,     1                       ; 58F5   0043
        RLC     R2,     1                       ; 58F6   0052
        SWAP    R1,     2                       ; 58F7   0045
        SWAP    R0,     2                       ; 58F8   0044
        SLL     R1,     1                       ; 58F9   0049
        SWAP    R2,     1                       ; 58FA   0042
        SLL     R0,     2                       ; 58FB   004C
        SWAP    R1,     2                       ; 58FC   0045
        DECLE   $0000                           ; 58FD   0000

        PULR    R7                              ; 58FE   02B7
L_58FF:
        MVII    #$0294, R4                      ; 58FF   02BC 0294

        JSR     R5,     X_PRINT_R5              ; 5901   0004 0118 007B

        SLL     R0,     1                       ; 5904   0048
        SLL     R1,     2                       ; 5905   004D
        SLL     R1,     2                       ; 5906   004D
        SLL     R1,     2                       ; 5907   004D
        DECLE   $0000                           ; 5908   0000

        PULR    R7                              ; 5909   02B7
L_590A:
        MVII    #$028F, R4                      ; 590A   02BC 028F

        JSR     R5,     X_PRINT_R5              ; 590C   0004 0118 007B

        SLL     R2,     2                       ; 590F   004E
        SWAP    R1,     2                       ; 5910   0045
        RLC     R2,     2                       ; 5911   0056
        SWAP    R1,     2                       ; 5912   0045
        RLC     R2,     1                       ; 5913   0052
L_5914:
        NEGR    R0                              ; 5914   0020
        SWAP    R3,     2                       ; 5915   0047
        SLL     R1,     1                       ; 5916   0049
        RLC     R2,     2                       ; 5917   0056
        SWAP    R1,     2                       ; 5918   0045
        NEGR    R0                              ; 5919   0020
        RLC     R1,     2                       ; 591A   0055
        RLC     R0,     1                       ; 591B   0050
        NEGR    R1                              ; 591C   0021
        DECLE   $0000                           ; 591D   0000
L_591E:
        PULR    R7                              ; 591E   02B7
L_591F:
        MVI     G_0153, R1                      ; 591F   0281 0153
        TSTR    R1                              ; 5921   0089
        BEQ     L_591E                          ; 5922   0224 0005

        MVII    #$02A2, R4                      ; 5924   02BC 02A2

        JSR     R5,     X_PRINT_R5              ; 5926   0004 0118 007B

        SLL     R0,     1                       ; 5929   0048
        SWAP    R1,     2                       ; 592A   0045
        SLL     R0,     2                       ; 592B   004C
        SLL     R0,     2                       ; 592C   004C
        SLL     R3,     2                       ; 592D   004F
        NEGR    R0                              ; 592E   0020
        SWAP    R2,     2                       ; 592F   0046
        RLC     R2,     1                       ; 5930   0052
        SLL     R3,     2                       ; 5931   004F
        SLL     R1,     2                       ; 5932   004D
        NEGR    R0                              ; 5933   0020
        RLC     R3,     1                       ; 5934   0053
        SWAP    R1,     2                       ; 5935   0045
        SWAP    R3,     2                       ; 5936   0047
        SWAP    R1,     1                       ; 5937   0041
        DECLE   $0000                           ; 5938   0000

        MVII    #$02BD, R4                      ; 5939   02BC 02BD

        JSR     R5,     X_PRINT_R5              ; 593B   0004 0118 007B

        SWAP    R1,     1                       ; 593E   0041
        SLL     R2,     2                       ; 593F   004E
        SWAP    R0,     2                       ; 5940   0044
        DECLE   $0000                           ; 5941   0000

        MVII    #$02CD, R4                      ; 5942   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 5944   0004 0118 007B

        SWAP    R2,     1                       ; 5947   0042
        SWAP    R1,     2                       ; 5948   0045
        SWAP    R3,     1                       ; 5949   0043
        SLL     R3,     1                       ; 594A   004B
        ADCR    R5                              ; 594B   002D
        RLC     R0,     2                       ; 594C   0054
        SWAP    R1,     2                       ; 594D   0045
        SWAP    R3,     1                       ; 594E   0043
        SLL     R0,     1                       ; 594F   0048
        DECLE   $0000                           ; 5950   0000

        PULR    R7                              ; 5951   02B7
L_5952:
        MVI     G_0300, R0                      ; 5952   0280 0300
        MOVR    R0,     R2                      ; 5954   0082
        ANDI    #$01F0, R0                      ; 5955   03B8 01F0
        CMPI    #$0131, R0                      ; 5957   0378 0131
        BPL     L_595F                          ; 5959   0203 0004

        SDBD                                    ; 595B   0001
        MVII    #$0967, R2                      ; 595C   02BA 0067 0009
L_595F:
        SUBI    #$0010, R2                      ; 595F   033A 0010
        MVO     R2,     G_0300                  ; 5961   0242 0300
        MOVR    R5,     R7                      ; 5963   00AF
L_5964:
        MVI     G_0303, R2                      ; 5964   0282 0303
        XORI    #$0078, R2                      ; 5966   03FA 0078
        MVO     R2,     G_0303                  ; 5968   0242 0303
        MVO     R2,     G_0305                  ; 596A   0242 0305
        MVI     G_0304, R2                      ; 596C   0282 0304
        XORI    #$0148, R2                      ; 596E   03FA 0148
        MVO     R2,     G_0304                  ; 5970   0242 0304
        MVO     R2,     G_0306                  ; 5972   0242 0306
        MOVR    R5,     R7                      ; 5974   00AF
L_5975:
        MVI     G_0303, R2                      ; 5975   0282 0303
        XORI    #$0030, R2                      ; 5977   03FA 0030
        MVO     R2,     G_0303                  ; 5979   0242 0303
        MVI     G_0304, R2                      ; 597B   0282 0304
        XORI    #$0070, R2                      ; 597D   03FA 0070
        MVO     R2,     G_0304                  ; 597F   0242 0304
        MOVR    R5,     R7                      ; 5981   00AF
L_5982:
        SDBD                                    ; 5982   0001
        MVII    #$59CA, R4                      ; 5983   02BC 00CA 0059
        MVII    #$0004, R3                      ; 5986   02BB 0004
        MVI     G_0320, R1                      ; 5988   0281 0320
        ANDI    #$0001, R1                      ; 598A   03B9 0001
        BNEQ    L_59A0                          ; 598C   020C 0012

        MVI     G_01EE, R0                      ; 598E   0280 01EE
        SLR     R0,     2                       ; 5990   0064
        SLR     R0,     2                       ; 5991   0064
        ANDI    #$0003, R0                      ; 5992   03B8 0003
        CMPI    #$0003, R0                      ; 5994   0378 0003
        BEQ     L_59BD                          ; 5996   0204 0025

        CMPI    #$0002, R0                      ; 5998   0378 0002
        BEQ     L_59B1                          ; 599A   0204 0015

        CMPI    #$0001, R0                      ; 599C   0378 0001
        BEQ     L_59AA                          ; 599E   0204 000A

L_59A0:
        SDBD                                    ; 59A0   0001
        MVII    #$095E, R1                      ; 59A1   02B9 005E 0009
L_59A4:
        MVI@    R4,     R2                      ; 59A4   02A2
        MVO@    R1,     R2                      ; 59A5   0251
        DECR    R3                              ; 59A6   0013
        BNEQ    L_59A4                          ; 59A7   022C 0004

        MOVR    R5,     R7                      ; 59A9   00AF
L_59AA:
        SDBD                                    ; 59AA   0001
        MVII    #$0936, R1                      ; 59AB   02B9 0036 0009
        MVI@    R4,     R2                      ; 59AE   02A2
        MVO@    R1,     R2                      ; 59AF   0251
        MOVR    R5,     R7                      ; 59B0   00AF
L_59B1:
        SDBD                                    ; 59B1   0001
        MVII    #$093E, R1                      ; 59B2   02B9 003E 0009
        INCR    R4                              ; 59B5   000C
        MVI@    R4,     R2                      ; 59B6   02A2
        MVO@    R1,     R2                      ; 59B7   0251
        ADDI    #$0008, R1                      ; 59B8   02F9 0008
        MVI@    R4,     R2                      ; 59BA   02A2
        MVO@    R1,     R2                      ; 59BB   0251
        MOVR    R5,     R7                      ; 59BC   00AF
L_59BD:
        INCR    R4                              ; 59BD   000C
        INCR    R4                              ; 59BE   000C
        MVI@    R4,     R2                      ; 59BF   02A2
        SDBD                                    ; 59C0   0001
        MVII    #$094E, R1                      ; 59C1   02B9 004E 0009
        MVO@    R1,     R2                      ; 59C4   0251
        ADDI    #$0008, R1                      ; 59C5   02F9 0008
        MVI@    R4,     R2                      ; 59C7   02A2
        MVO@    R1,     R2                      ; 59C8   0251
        MOVR    R5,     R7                      ; 59C9   00AF
        MVO@    R5,     R3                      ; 59CA   025D
        MVO@    R1,     R1                      ; 59CB   0249
        MVO@    R2,     R1                      ; 59CC   024A
        DECLE   $0236                           ; 59CD   0236
L_59CE:
        MVI     G_0320, R1                      ; 59CE   0281 0320
        SARC    R1,     1                       ; 59D0   0079
        BC      L_5A5E                          ; 59D1   0201 008B

        SARC    R1,     1                       ; 59D3   0079
        BC      L_59F8                          ; 59D4   0201 0022

        MVI     G_02F5, R2                      ; 59D6   0282 02F5
        INCR    R2                              ; 59D8   000A
        MVO     R2,     G_02F5                  ; 59D9   0242 02F5
        MVO     R2,     G_02F6                  ; 59DB   0242 02F6
        ADDI    #$0007, R2                      ; 59DD   02FA 0007
        MVO     R2,     G_02F2                  ; 59DF   0242 02F2
        MVO     R2,     G_02F3                  ; 59E1   0242 02F3
        MVO     R2,     G_02F4                  ; 59E3   0242 02F4
        PSHR    R5                              ; 59E5   0275

        JSR     R5,     L_5ACE                  ; 59E6   0004 0158 02CE

        PULR    R5                              ; 59E9   02B5
        ANDI    #$00FF, R2                      ; 59EA   03BA 00FF
        CMPI    #$0050, R2                      ; 59EC   037A 0050
        BEQ     L_59F1                          ; 59EE   0204 0001

        MOVR    R5,     R7                      ; 59F0   00AF
L_59F1:
        MVI     G_0320, R1                      ; 59F1   0281 0320
        XORI    #$0002, R1                      ; 59F3   03F9 0002
        MVO     R1,     G_0320                  ; 59F5   0241 0320
        MOVR    R5,     R7                      ; 59F7   00AF
L_59F8:
        MVI     G_012E, R1                      ; 59F8   0281 012E
        INCR    R1                              ; 59FA   0009
        MVO     R1,     G_012E                  ; 59FB   0241 012E
        CMPI    #$0012, R1                      ; 59FD   0379 0012
        BEQ     L_5A3E                          ; 59FF   0204 003D

        CMPI    #$0019, R1                      ; 5A01   0379 0019
        BNEQ    L_5A3D                          ; 5A03   020C 0038

        MVI     G_0320, R1                      ; 5A05   0281 0320
        XORI    #$0001, R1                      ; 5A07   03F9 0001
        MVO     R1,     G_0320                  ; 5A09   0241 0320
        PSHR    R5                              ; 5A0B   0275
        CLRR    R1                              ; 5A0C   01C9
        SDBD                                    ; 5A0D   0001
        MVII    #$50CB, R3                      ; 5A0E   02BB 00CB 0050

        JSR     R5,     .HEADER                 ; 5A11   0004 0150 0000

        MVII    #$0001, R1                      ; 5A14   02B9 0001
        SDBD                                    ; 5A16   0001
        MVII    #$50D1, R3                      ; 5A17   02BB 00D1 0050

        JSR     R5,     .HEADER                 ; 5A1A   0004 0150 0000

        SDBD                                    ; 5A1D   0001
        MVII    #$0907, R1                      ; 5A1E   02B9 0007 0009
        MVO     R1,     G_0300                  ; 5A21   0241 0300
        SDBD                                    ; 5A23   0001
        MVII    #$0912, R1                      ; 5A24   02B9 0012 0009
        MVI     G_02F8, R2                      ; 5A27   0282 02F8
        SDBD                                    ; 5A29   0001
        ANDI    #$FEFF, R2                      ; 5A2A   03BA 00FF 00FE
        XORI    #$0100, R2                      ; 5A2D   03FA 0100
        MVO     R2,     G_02F8                  ; 5A2F   0242 02F8
        MVO     R1,     G_0301                  ; 5A31   0241 0301
        SDBD                                    ; 5A33   0001
        MVII    #$1922, R1                      ; 5A34   02B9 0022 0019
        MVO     R1,     G_0307                  ; 5A37   0241 0307
        CLRR    R1                              ; 5A39   01C9
        MVO     R1,     G_012E                  ; 5A3A   0241 012E
        PULR    R7                              ; 5A3C   02B7
L_5A3D:
        MOVR    R5,     R7                      ; 5A3D   00AF
L_5A3E:
        MVI     G_0302, R1                      ; 5A3E   0281 0302
        XORI    #$0008, R1                      ; 5A40   03F9 0008
        MVO     R1,     G_0302                  ; 5A42   0241 0302
        MVI     G_02FB, R1                      ; 5A44   0281 02FB
        ADDI    #$0006, R1                      ; 5A46   02F9 0006
        MVO     R1,     G_02FB                  ; 5A48   0241 02FB
        MVO     R1,     G_02FC                  ; 5A4A   0241 02FC
        MVI     G_02F3, R1                      ; 5A4C   0281 02F3
        ADDI    #$0006, R1                      ; 5A4E   02F9 0006
        MVO     R1,     G_02F3                  ; 5A50   0241 02F3
        MVO     R1,     G_02F4                  ; 5A52   0241 02F4
        PSHR    R5                              ; 5A54   0275
        CLRR    R1                              ; 5A55   01C9
        SDBD                                    ; 5A56   0001
        MVII    #$50EB, R3                      ; 5A57   02BB 00EB 0050

        JSR     R5,     .HEADER                 ; 5A5A   0004 0150 0000

        PULR    R7                              ; 5A5D   02B7
L_5A5E:
        MVI     G_012E, R1                      ; 5A5E   0281 012E
        TSTR    R1                              ; 5A60   0089
        BNEQ    L_5A79                          ; 5A61   020C 0016

        INCR    R1                              ; 5A63   0009
        MVO     R1,     G_012E                  ; 5A64   0241 012E
        SDBD                                    ; 5A66   0001
        MVII    #$192B, R1                      ; 5A67   02B9 002B 0019
        MVO     R1,     G_0302                  ; 5A6A   0241 0302
        MVI     G_02FD, R1                      ; 5A6C   0281 02FD
        SDBD                                    ; 5A6E   0001
        XORI    #$0400, R1                      ; 5A6F   03F9 0000 0004
        MVO     R1,     G_02FD                  ; 5A72   0241 02FD
        ADDI    #$0008, R1                      ; 5A74   02F9 0008
        MVO     R1,     G_02FE                  ; 5A76   0241 02FE
        MOVR    R5,     R7                      ; 5A78   00AF
L_5A79:
        INCR    R1                              ; 5A79   0009
        MVO     R1,     G_012E                  ; 5A7A   0241 012E
        MVI     G_02F5, R2                      ; 5A7C   0282 02F5
        DECR    R2                              ; 5A7E   0012
        MVO     R2,     G_02F5                  ; 5A7F   0242 02F5
        MVO     R2,     G_02F6                  ; 5A81   0242 02F6
        PSHR    R5                              ; 5A83   0275

        JSR     R5,     L_5ACE                  ; 5A84   0004 0158 02CE

        PULR    R5                              ; 5A87   02B5
        SDBD                                    ; 5A88   0001
        ADDI    #$5B1D, R1                      ; 5A89   02F9 001D 005B
        MVI@    R1,     R0                      ; 5A8C   0288
        TSTR    R0                              ; 5A8D   0080
        BEQ     L_5AB6                          ; 5A8E   0204 0026

        MOVR    R0,     R1                      ; 5A90   0081
        MVI     G_02F0, R2                      ; 5A91   0282 02F0
        MVI     G_02F8, R3                      ; 5A93   0283 02F8
        ANDI    #$000F, R0                      ; 5A95   03B8 000F
        SUBI    #$0008, R0                      ; 5A97   0338 0008
        ADDR    R0,     R2                      ; 5A99   00C2
        SLR     R1,     2                       ; 5A9A   0065
        SLR     R1,     2                       ; 5A9B   0065
        ANDI    #$000F, R1                      ; 5A9C   03B9 000F
        SUBI    #$0008, R1                      ; 5A9E   0339 0008
        ADDR    R1,     R3                      ; 5AA0   00CB
        MVO     R2,     G_02F0                  ; 5AA1   0242 02F0
        MVO     R2,     G_02F1                  ; 5AA3   0242 02F1
        MVO     R3,     G_02F8                  ; 5AA5   0243 02F8
        SUBI    #$0002, R3                      ; 5AA7   033B 0002
        MVO     R3,     G_02F9                  ; 5AA9   0243 02F9
        ADDI    #$0002, R3                      ; 5AAB   02FB 0002
        XORI    #$0080, R3                      ; 5AAD   03FB 0080
        MVO     R3,     G_02FF                  ; 5AAF   0243 02FF
        SUBI    #$0003, R2                      ; 5AB1   033A 0003
        MVO     R2,     G_02F7                  ; 5AB3   0242 02F7
        MOVR    R5,     R7                      ; 5AB5   00AF
L_5AB6:
        PULR    R2                              ; 5AB6   02B2
L_5AB7:
        CLRR    R0                              ; 5AB7   01C0
        MVO     R0,     G_033E                  ; 5AB8   0240 033E
        MVO     R0,     G_033F                  ; 5ABA   0240 033F
        MVO     R0,     G_01D0                  ; 5ABC   0240 01D0
        MVO     R0,     G_01D1                  ; 5ABE   0240 01D1
        MVO     R0,     G_0320                  ; 5AC0   0240 0320
        MVO     R0,     G_012E                  ; 5AC2   0240 012E

        JSR     R5,     .EXEC.A83               ; 5AC4   0004 0118 0283

        MVII    #$0002, R0                      ; 5AC7   02B8 0002
        MVO     R0,     G_01E5                  ; 5AC9   0240 01E5
        J       G_7046                          ; 5ACB   0004 0370 0046

L_5ACE:
        PSHR    R3                              ; 5ACE   0273
        MVI     G_01EE, R3                      ; 5ACF   0283 01EE
        ANDI    #$0004, R3                      ; 5AD1   03BB 0004
        BEQ     L_5ADF                          ; 5AD3   0204 000A

        MVI     G_0305, R3                      ; 5AD5   0283 0305
        XORI    #$0020, R3                      ; 5AD7   03FB 0020
        MVO     R3,     G_0305                  ; 5AD9   0243 0305
        ADDI    #$0010, R3                      ; 5ADB   02FB 0010
        MVO     R3,     G_0306                  ; 5ADD   0243 0306
L_5ADF:
        PULR    R3                              ; 5ADF   02B3
        MOVR    R5,     R7                      ; 5AE0   00AF
L_5AE1:
        MVI     G_0320, R1                      ; 5AE1   0281 0320
        ANDI    #$0001, R1                      ; 5AE3   03B9 0001
        BNEQ    L_5B04                          ; 5AE5   020C 001D

        MVI     G_01EE, R1                      ; 5AE7   0281 01EE
        ANDI    #$0020, R1                      ; 5AE9   03B9 0020
        BNEQ    L_5B05                          ; 5AEB   020C 0018

        SDBD                                    ; 5AED   0001
        MVII    #$0967, R0                      ; 5AEE   02B8 0067 0009
        MVO     R0,     G_0300                  ; 5AF1   0240 0300
        MVI     G_02F9, R3                      ; 5AF3   0283 02F9
        DECR    R3                              ; 5AF5   0013
        MVO     R3,     G_02F9                  ; 5AF6   0243 02F9
        SDBD                                    ; 5AF8   0001
        MVII    #$3C00, R1                      ; 5AF9   02B9 0000 003C
        MVO     R1,     .BTAB.46                ; 5AFC   0241 0246
        SDBD                                    ; 5AFE   0001
        MVII    #$3C1D, R1                      ; 5AFF   02B9 001D 003C
        MVO     R1,     .BTAB.5B                ; 5B02   0241 025B
L_5B04:
        MOVR    R5,     R7                      ; 5B04   00AF
L_5B05:
        SDBD                                    ; 5B05   0001
        MVII    #$08D7, R0                      ; 5B06   02B8 00D7 0008
        MVO     R0,     G_0300                  ; 5B09   0240 0300
        MVI     G_02F9, R3                      ; 5B0B   0283 02F9
        INCR    R3                              ; 5B0D   000B
        MVO     R3,     G_02F9                  ; 5B0E   0243 02F9
        SDBD                                    ; 5B10   0001
        MVII    #$3CF0, R1                      ; 5B11   02B9 00F0 003C
        MVO     R1,     .BTAB.46                ; 5B14   0241 0246
        SDBD                                    ; 5B16   0001
        MVII    #$3CFD, R1                      ; 5B17   02B9 00FD 003C
        MVO     R1,     .BTAB.5B                ; 5B1A   0241 025B
        MOVR    R5,     R7                      ; 5B1C   00AF
        MOVR    R3,     R2                      ; 5B1D   009A
        MOVR    R3,     R2                      ; 5B1E   009A
        MOVR    R3,     R2                      ; 5B1F   009A
        MOVR    R3,     R2                      ; 5B20   009A
        MOVR    R3,     R2                      ; 5B21   009A
        MOVR    R3,     R2                      ; 5B22   009A
        MOVR    R3,     R2                      ; 5B23   009A
        MOVR    R3,     R2                      ; 5B24   009A
        MOVR    R3,     R2                      ; 5B25   009A
        MOVR    R3,     R2                      ; 5B26   009A
        MOVR    R3,     R2                      ; 5B27   009A
        MOVR    R3,     R2                      ; 5B28   009A
        MOVR    R3,     R2                      ; 5B29   009A
        MOVR    R3,     R2                      ; 5B2A   009A
        MOVR    R3,     R2                      ; 5B2B   009A
        MOVR    R4,     R6                      ; 5B2C   00A6
        MOVR    R4,     R6                      ; 5B2D   00A6
        MOVR    R4,     R6                      ; 5B2E   00A6
        MOVR    R4,     R6                      ; 5B2F   00A6
        MOVR    R4,     R6                      ; 5B30   00A6
        MOVR    R4,     R6                      ; 5B31   00A6
        MOVR    R4,     R6                      ; 5B32   00A6
        MOVR    R4,     R6                      ; 5B33   00A6
        MOVR    R4,     R6                      ; 5B34   00A6
        MOVR    R4,     R6                      ; 5B35   00A6
        MOVR    R4,     R6                      ; 5B36   00A6
        MOVR    R4,     R6                      ; 5B37   00A6
        MOVR    R4,     R6                      ; 5B38   00A6
        MOVR    R4,     R6                      ; 5B39   00A6
        MOVR    R4,     R6                      ; 5B3A   00A6
        SAR     R2,     1                       ; 5B3B   006A
        SAR     R2,     1                       ; 5B3C   006A
        SAR     R2,     1                       ; 5B3D   006A
        SAR     R2,     1                       ; 5B3E   006A
        SAR     R2,     1                       ; 5B3F   006A
        SAR     R2,     1                       ; 5B40   006A
        SAR     R2,     1                       ; 5B41   006A
        SAR     R2,     1                       ; 5B42   006A
        SAR     R2,     1                       ; 5B43   006A
        SAR     R2,     1                       ; 5B44   006A
        SAR     R2,     1                       ; 5B45   006A
        SAR     R2,     1                       ; 5B46   006A
        SAR     R2,     1                       ; 5B47   006A
        SAR     R2,     1                       ; 5B48   006A
        SAR     R2,     1                       ; 5B49   006A
        SAR     R2,     1                       ; 5B4A   006A
        SAR     R2,     1                       ; 5B4B   006A
L_5B4C:
        SAR     R2,     1                       ; 5B4C   006A
        SAR     R2,     1                       ; 5B4D   006A
        SAR     R2,     1                       ; 5B4E   006A
        SAR     R2,     1                       ; 5B4F   006A
        DECLE   $0000                           ; 5B50   0000

        SUBR    R2,     R1                      ; 5B51   0111
        CMPR    R0,     R1                      ; 5B52   0141
        ANDR    R0,     R1                      ; 5B53   0181
        CMPR    R0,     R1                      ; 5B54   0141
        SUBR    R0,     R1                      ; 5B55   0101
        SUBR    R6,     R1                      ; 5B56   0131
        ANDR    R0,     R1                      ; 5B57   0181
        SUBR    R6,     R1                      ; 5B58   0131
        MOVR    R2,     R1                      ; 5B59   0091
        SUBR    R2,     R1                      ; 5B5A   0111
        CMPR    R0,     R1                      ; 5B5B   0141
        SUBR    R2,     R1                      ; 5B5C   0111
        MOVR    R0,     R1                      ; 5B5D   0081
        SUBR    R0,     R1                      ; 5B5E   0101
        SUBR    R6,     R1                      ; 5B5F   0131
        ANDR    R0,     R1                      ; 5B60   0181
        ADDR    R0,     R0                      ; 5B61   00C0
        ADDR    R2,     R0                      ; 5B62   00D0
        MOVR    R6,     R3                      ; 5B63   00B3
        MOVR    R6,     R2                      ; 5B64   00B2
        MOVR    R6,     R0                      ; 5B65   00B0
        SUBR    R6,     R3                      ; 5B66   0133
        SUBR    R6,     R2                      ; 5B67   0132
        SUBR    R6,     R0                      ; 5B68   0130
        CMPR    R4,     R3                      ; 5B69   0163
        CMPR    R4,     R2                      ; 5B6A   0162
        CMPR    R4,     R0                      ; 5B6B   0160
        DECLE   $0231,  $0211                   ; 5B6C   0231 0211

        ANDR    R6,     R1                      ; 5B6E   01B1
        ANDR    R4,     R1                      ; 5B6F   01A1
        ANDR    R0,     R2                      ; 5B70   0182
        ANDR    R4,     R0                      ; 5B71   01A0
        ANDR    R6,     R1                      ; 5B72   01B1
        DECLE   $0211,  $0231,  $0211           ; 5B73   0211 0231 0211

        ANDR    R6,     R1                      ; 5B76   01B1
        CMPR    R4,     R1                      ; 5B77   0161
        ANDR    R0,     R1                      ; 5B78   0181
        ANDR    R6,     R1                      ; 5B79   01B1
        MVO     R1,     .BTAB.81                ; 5B7A   0241 0281
        MVO@    R1,     R4                      ; 5B7C   0261
        DECLE   $0211,  $0231                   ; 5B7D   0211 0231

        MVO@    R1,     R4                      ; 5B7F   0261
        ANDR    R6,     R7                      ; 5B80   01B7
        ADDR    R4,     R0                      ; 5B81   00E0
        ADDR    R2,     R0                      ; 5B82   00D0
        AND@    R6,     R1                      ; 5B83   03B1
        AND@    R4,     R1                      ; 5B84   03A1
        AND     G_0361, R1                      ; 5B85   0381 0361
        CMP     G_0341, R1                      ; 5B87   0341 0341
        CMP     G_00C1, R1                      ; 5B89   0341 00C1
        AND@    R4,     R1                      ; 5B8B   03A1
        AND     G_0361, R1                      ; 5B8C   0381 0361
        CMP     G_0331, R1                      ; 5B8E   0341 0331
        SUB@    R6,     R1                      ; 5B90   0331
        SUB@    R6,     R1                      ; 5B91   0331
        ADDR    R0,     R1                      ; 5B92   00C1
        AND     G_0361, R1                      ; 5B93   0381 0361
        CMP     G_0331, R1                      ; 5B95   0341 0331
        SUB@    R2,     R1                      ; 5B97   0311
        SUB@    R6,     R1                      ; 5B98   0331
        CMP     G_0381, R1                      ; 5B99   0341 0381
        SUB@    R6,     R1                      ; 5B9B   0331
        SUB@    R6,     R0                      ; 5B9C   0330
        CMP@    R4,     R0                      ; 5B9D   0360
        SUB@    R2,     R1                      ; 5B9E   0311
        SUB@    R2,     R0                      ; 5B9F   0310
        CMP@    R4,     R0                      ; 5BA0   0360
        PULR    R7                              ; 5BA1   02B7
        ADDR    R5,     R7                      ; 5BA2   00EF
        ADDR    R5,     R7                      ; 5BA3   00EF
        ADDR    R5,     R7                      ; 5BA4   00EF
        ADDR    R1,     R7                      ; 5BA5   00CF
        ADDR    R1,     R7                      ; 5BA6   00CF
        ADDR    R2,     R0                      ; 5BA7   00D0
        GSWD    R2                              ; 5BA8   0032
        GSWD    R0                              ; 5BA9   0030
        GSWD    R1                              ; 5BAA   0031
        DECLE   $0000,  $0000                   ; 5BAB   0000 0000

        GSWD    R2                              ; 5BAD   0032
        GSWD    R0                              ; 5BAE   0030
        GSWD    R1                              ; 5BAF   0031
        DECLE   $0000,  $0000                   ; 5BB0   0000 0000

        GSWD    R2                              ; 5BB2   0032
        GSWD    R0                              ; 5BB3   0030
        GSWD    R1                              ; 5BB4   0031
        DECLE   $0000,  $0000                   ; 5BB5   0000 0000

        GSWD    R2                              ; 5BB7   0032
        GSWD    R0                              ; 5BB8   0030
        GSWD    R1                              ; 5BB9   0031
        DECLE   $0000,  $0000                   ; 5BBA   0000 0000

        GSWD    R2                              ; 5BBC   0032
        GSWD    R0                              ; 5BBD   0030
        GSWD    R1                              ; 5BBE   0031
        DECLE   $0000,  $0000                   ; 5BBF   0000 0000

        GSWD    R2                              ; 5BC1   0032
        GSWD    R0                              ; 5BC2   0030
        GSWD    R1                              ; 5BC3   0031
        DECLE   $0000,  $0000                   ; 5BC4   0000 0000

        GSWD    R2                              ; 5BC6   0032
        GSWD    R0                              ; 5BC7   0030
        GSWD    R1                              ; 5BC8   0031
        DECLE   $0000,  $0000                   ; 5BC9   0000 0000

        GSWD    R2                              ; 5BCB   0032
        GSWD    R0                              ; 5BCC   0030
        GSWD    R1                              ; 5BCD   0031
        DECLE   $0000,  $0000                   ; 5BCE   0000 0000

        ADDR    R2,     R1                      ; 5BD0   00D1
        ADDR    R1,     R6                      ; 5BD1   00CE
        MOVR    R6,     R4                      ; 5BD2   00B4
        SUBR    R4,     R4                      ; 5BD3   0124
        CMPR    R0,     R4                      ; 5BD4   0144
        CMPR    R4,     R4                      ; 5BD5   0164
        CMPR    R0,     R2                      ; 5BD6   0142
        SUBR    R4,     R2                      ; 5BD7   0122
        CMPR    R0,     R2                      ; 5BD8   0142
        SUBR    R4,     R2                      ; 5BD9   0122
        MOVR    R6,     R4                      ; 5BDA   00B4
        SUBR    R4,     R4                      ; 5BDB   0124
        CMPR    R0,     R5                      ; 5BDC   0145
        SUBR    R4,     R4                      ; 5BDD   0124
        CMPR    R1,     R5                      ; 5BDE   014D
        ADDR    R5,     R7                      ; 5BDF   00EF
        ADDR    R5,     R7                      ; 5BE0   00EF
        ADDR    R5,     R7                      ; 5BE1   00EF
        ADDR    R5,     R7                      ; 5BE2   00EF
        ADDR    R5,     R7                      ; 5BE3   00EF
        ADDR    R5,     R7                      ; 5BE4   00EF
        ADDR    R5,     R7                      ; 5BE5   00EF
        ADDR    R5,     R7                      ; 5BE6   00EF
        ADDR    R5,     R7                      ; 5BE7   00EF
        ADDR    R2,     R0                      ; 5BE8   00D0
        DECLE   $0211                           ; 5BE9   0211

        MVO     R1,     .BTAB.81                ; 5BEA   0241 0281
        MVO     R1,     .BTAB.01                ; 5BEC   0241 0201
        DECLE   $0231                           ; 5BEE   0231

        MVI     .BTAB.31,R1                     ; 5BEF   0281 0231
        ANDR    R2,     R1                      ; 5BF1   0191
        DECLE   $0211                           ; 5BF2   0211

        MVO     R1,     .BTAB.11                ; 5BF3   0241 0211
        ANDR    R0,     R1                      ; 5BF5   0181
        BC      L_5E29                          ; 5BF6   0201 0231

        MVI     G_00C0, R1                      ; 5BF8   0281 00C0
        ADDR    R2,     R0                      ; 5BFA   00D0
        ADDR    R1,     R7                      ; 5BFB   00CF
        ADDR    R1,     R7                      ; 5BFC   00CF
        ADDR    R1,     R7                      ; 5BFD   00CF
        ADDR    R1,     R7                      ; 5BFE   00CF
        ADDR    R1,     R7                      ; 5BFF   00CF
        ADDR    R1,     R7                      ; 5C00   00CF
        ADDR    R1,     R7                      ; 5C01   00CF
        ADDR    R2,     R0                      ; 5C02   00D0
        ADDR    R0,     R0                      ; 5C03   00C0
L_5C04:
        PULR    R1                              ; 5C04   02B1
        MVI@    R4,     R1                      ; 5C05   02A1
        MVI     .BTAB.61,R1                     ; 5C06   0281 0261
        MVO     R1,     .BTAB.41                ; 5C08   0241 0241
        MVO     R1,     G_00C1                  ; 5C0A   0241 00C1
        MVI@    R4,     R1                      ; 5C0C   02A1
        MVI     .BTAB.61,R1                     ; 5C0D   0281 0261
        MVO     R1,     .BTAB.31                ; 5C0F   0241 0231
        DECLE   $0231,  $0231                   ; 5C11   0231 0231

        ADDR    R0,     R1                      ; 5C13   00C1
        MVI     .BTAB.61,R1                     ; 5C14   0281 0261
        MVO     R1,     .BTAB.31                ; 5C16   0241 0231
        DECLE   $0211,  $0231                   ; 5C18   0211 0231

        MVO     R1,     .BTAB.81                ; 5C1A   0241 0281
        DECLE   $0231,  $0230                   ; 5C1C   0231 0230

        MVO@    R0,     R4                      ; 5C1E   0260
        DECLE   $0211,  $0210                   ; 5C1F   0211 0210

        MVO@    R0,     R4                      ; 5C21   0260
        ANDR    R6,     R7                      ; 5C22   01B7
        ADDR    R1,     R7                      ; 5C23   00CF
        ADDR    R1,     R7                      ; 5C24   00CF
        ADDR    R1,     R7                      ; 5C25   00CF
        ADDR    R1,     R7                      ; 5C26   00CF
        ADDR    R1,     R7                      ; 5C27   00CF
        ADDR    R2,     R0                      ; 5C28   00D0
        ADDR    R0,     R0                      ; 5C29   00C0
        ADDR    R2,     R1                      ; 5C2A   00D1
        ADDR    R0,     R0                      ; 5C2B   00C0
        ADDR    R2,     R1                      ; 5C2C   00D1
        DECR    R7                              ; 5C2D   0017
        SETC                                    ; 5C2E   0007
        ANDR    R2,     R7                      ; 5C2F   0197
        ANDR    R0,     R7                      ; 5C30   0187
        ADDR    R0,     R0                      ; 5C31   00C0
        ADDR    R2,     R0                      ; 5C32   00D0
        ADDR    R1,     R7                      ; 5C33   00CF
        ADDR    R1,     R7                      ; 5C34   00CF
        ADDR    R1,     R7                      ; 5C35   00CF
        ADDR    R1,     R7                      ; 5C36   00CF
        ADDR    R1,     R7                      ; 5C37   00CF
        ADDR    R1,     R7                      ; 5C38   00CF
        ADDR    R1,     R7                      ; 5C39   00CF
        ADDR    R2,     R0                      ; 5C3A   00D0
        ADDR    R1,     R7                      ; 5C3B   00CF
        ADDR    R2,     R1                      ; 5C3C   00D1
        ADDR    R0,     R0                      ; 5C3D   00C0
        ADDR    R2,     R1                      ; 5C3E   00D1
        ADDR    R0,     R0                      ; 5C3F   00C0
        ADDR    R2,     R1                      ; 5C40   00D1
L_5C41:
        PSHR    R5                              ; 5C41   0275

        JSR     R5,     .EXEC.A83               ; 5C42   0004 0118 0283

        CLRR    R0                              ; 5C45   01C0
        MVO     R0,     G_01E4                  ; 5C46   0240 01E4
        MVII    #$0002, R0                      ; 5C48   02B8 0002
        MVO     R0,     G_01E5                  ; 5C4A   0240 01E5
        PULR    R7                              ; 5C4C   02B7
        CMP@    R2,     R7                      ; 5C4D   0357
        SUB@    R4,     R7                      ; 5C4E   0327
        ADDI    #$02CF, R2                      ; 5C4F   02FA 02CF
        MVI@    R4,     R7                      ; 5C51   02A7
        MVI     .BTAB.5D,R1                     ; 5C52   0281 025D
        DECLE   $023B,  $021B                   ; 5C54   023B 021B

        XORR    R7,     R4                      ; 5C56   01FC
        XORR    R4,     R0                      ; 5C57   01E0
        XORR    R0,     R5                      ; 5C58   01C5
        INCR    R0                              ; 5C59   0008
        INCR    R0                              ; 5C5A   0008
        INCR    R0                              ; 5C5B   0008
        ADDR    R2,     R1                      ; 5C5C   00D1
        SLLC    R3,     1                       ; 5C5D   005B
        INCR    R7                              ; 5C5E   000F
        ADCR    R3                              ; 5C5F   002B
        SLLC    R0,     2                       ; 5C60   005C
        INCR    R7                              ; 5C61   000F
        RSWD    R7                              ; 5C62   003F
        SLLC    R0,     2                       ; 5C63   005C
        INCR    R7                              ; 5C64   000F
        EIS                                     ; 5C65   0002
        INCR    R0                              ; 5C66   0008
        INCR    R0                              ; 5C67   0008
        DECLE   $0001                           ; 5C68   0001

        RLC     R1,     1                       ; 5C69   0051
        SLLC    R3,     1                       ; 5C6A   005B
        INCR    R7                              ; 5C6B   000F
        ADDR    R5,     R1                      ; 5C6C   00E9
        SLLC    R3,     1                       ; 5C6D   005B
        INCR    R6                              ; 5C6E   000E
        ADCR    R5                              ; 5C6F   002D
        SLLC    R0,     2                       ; 5C70   005C
        INCR    R4                              ; 5C71   000C
        INCR    R0                              ; 5C72   0008
        GSWD    R0                              ; 5C73   0030
        COMR    R0                              ; 5C74   0018
        SWAP    R0,     1                       ; 5C75   0040
        MOVR    R5,     R0                      ; 5C76   00A8
        SLLC    R3,     1                       ; 5C77   005B
        INCR    R7                              ; 5C78   000F
        ADCR    R1                              ; 5C79   0029
        SLLC    R0,     2                       ; 5C7A   005C
        INCR    R5                              ; 5C7B   000D
        RSWD    R5                              ; 5C7C   003D
        SLLC    R0,     2                       ; 5C7D   005C
        INCR    R7                              ; 5C7E   000F
        INCR    R2                              ; 5C7F   000A
        INCR    R2                              ; 5C80   000A
        INCR    R2                              ; 5C81   000A
        INCR    R7                              ; 5C82   000F
        MOVR    R0,     R3                      ; 5C83   0083
        SLLC    R3,     1                       ; 5C84   005B
        INCR    R7                              ; 5C85   000F
        DIS                                     ; 5C86   0003
        SLLC    R0,     2                       ; 5C87   005C
        INCR    R7                              ; 5C88   000F
        RSWD    R3                              ; 5C89   003B
        SLLC    R0,     2                       ; 5C8A   005C
        INCR    R7                              ; 5C8B   000F
        DECLE   $0005                           ; 5C8C   0005

        INCR    R3                              ; 5C8D   000B
        INCR    R4                              ; 5C8E   000C
        INCR    R4                              ; 5C8F   000C
        SLR     R3,     1                       ; 5C90   0063
        SLLC    R3,     1                       ; 5C91   005B
        INCR    R7                              ; 5C92   000F
        ADDR    R7,     R3                      ; 5C93   00FB
        SLLC    R3,     1                       ; 5C94   005B
        INCR    R7                              ; 5C95   000F
        GSWD    R3                              ; 5C96   0033
        SLLC    R0,     2                       ; 5C97   005C
        INCR    R7                              ; 5C98   000F

        JSRE    R4,     L_585C                  ; 5C99   0004 0059 005C

        SLR     R2,     2                       ; 5C9C   0066
        SLLC    R0,     2                       ; 5C9D   005C
        RRC     R3,     1                       ; 5C9E   0073
        SLLC    R0,     2                       ; 5C9F   005C
        TSTR    R0                              ; 5CA0   0080
        SLLC    R0,     2                       ; 5CA1   005C
        MOVR    R1,     R5                      ; 5CA2   008D
        SLLC    R0,     2                       ; 5CA3   005C
L_5CA4:
        PSHR    R5                              ; 5CA4   0275
        MOVR    R0,     R5                      ; 5CA5   0085
        MVI@    R2,     R0                      ; 5CA6   0290
        TSTR    R0                              ; 5CA7   0080
        BEQ     L_5CAD                          ; 5CA8   0204 0003

        DECR    R0                              ; 5CAA   0010
        B       L_5D03                          ; 5CAB   0200 0056

L_5CAD:
        MVI@    R3,     R0                      ; 5CAD   0298
        ADDR    R0,     R4                      ; 5CAE   00C4
        INCR    R0                              ; 5CAF   0008
        MVO@    R0,     R3                      ; 5CB0   0258
        MVI@    R4,     R0                      ; 5CB1   02A0
        DECR    R4                              ; 5CB2   0014
        ANDI    #$00F0, R0                      ; 5CB3   03B8 00F0
        SLR     R0,     2                       ; 5CB5   0064
        SLR     R0,     2                       ; 5CB6   0064
        CMPI    #$000E, R0                      ; 5CB7   0378 000E
        BEQ     L_5D05                          ; 5CB9   0204 004A

        CMPI    #$000D, R0                      ; 5CBB   0378 000D
        BNEQ    L_5CD3                          ; 5CBD   020C 0014

        MVI@    R4,     R0                      ; 5CBF   02A0
        DECR    R4                              ; 5CC0   0014
        RRC     R0,     1                       ; 5CC1   0070
        BNC     L_5CCB                          ; 5CC2   0209 0007

        MVI@    R3,     R0                      ; 5CC4   0298
        DECR    R0                              ; 5CC5   0010
        SUBR    R0,     R4                      ; 5CC6   0104
        CLRR    R0                              ; 5CC7   01C0
        MVO@    R0,     R3                      ; 5CC8   0258
        B       L_5CAD                          ; 5CC9   0220 001D

L_5CCB:
        MVII    #$0006, R0                      ; 5CCB   02B8 0006
        MVO     R0,     G_01E4                  ; 5CCD   0240 01E4
        DECR    R0                              ; 5CCF   0010
        MVO@    R0,     R3                      ; 5CD0   0258
        B       L_5CFF                          ; 5CD1   0200 002C

L_5CD3:
        CMPI    #$000C, R0                      ; 5CD3   0378 000C
        BEQ     L_5CFF                          ; 5CD5   0204 0028

        SDBD                                    ; 5CD7   0001
        MVII    #$5C4D, R3                      ; 5CD8   02BB 004D 005C
        ADDR    R0,     R3                      ; 5CDB   00C3
        MVI@    R3,     R0                      ; 5CDC   0298
        MVI@    R4,     R3                      ; 5CDD   02A3
        DECR    R4                              ; 5CDE   0014
        ANDI    #$0300, R3                      ; 5CDF   03BB 0300
        SWAP    R3,     1                       ; 5CE1   0043
        BEQ     L_5CE8                          ; 5CE2   0204 0004

L_5CE4:
        SLR     R0,     1                       ; 5CE4   0060
        DECR    R3                              ; 5CE5   0013
        BNEQ    L_5CE4                          ; 5CE6   022C 0003

L_5CE8:
        MVO@    R0,     R1                      ; 5CE8   0248
        SWAP    R0,     1                       ; 5CE9   0040
        ADDI    #$0004, R1                      ; 5CEA   02F9 0004
        MVO@    R0,     R1                      ; 5CEC   0248
        MVI@    R5,     R0                      ; 5CED   02A8
        ADDI    #$0007, R1                      ; 5CEE   02F9 0007
        MVO@    R0,     R1                      ; 5CF0   0248
        SUBI    #$000B, R1                      ; 5CF1   0339 000B
        SLL     R0,     1                       ; 5CF3   0048
        SLL     R0,     2                       ; 5CF4   004C
        SLL     R0,     2                       ; 5CF5   004C
        ADDI    #$001F, R0                      ; 5CF6   02F8 001F
        MOVR    R1,     R3                      ; 5CF8   008B
        SUBI    #$01F0, R3                      ; 5CF9   033B 01F0
        MVII    #$0330, R5                      ; 5CFB   02BD 0330
        ADDR    R3,     R5                      ; 5CFD   00DD
        MVO@    R0,     R5                      ; 5CFE   0268
L_5CFF:
        MVI@    R4,     R0                      ; 5CFF   02A0
        DECR    R4                              ; 5D00   0014
        ANDI    #$000F, R0                      ; 5D01   03B8 000F
L_5D03:
        MVO@    R0,     R2                      ; 5D03   0250
        PULR    R7                              ; 5D04   02B7
L_5D05:
        MVO     R0,     G_014C                  ; 5D05   0240 014C
        B       L_5CFF                          ; 5D07   0220 0009

L_5D09:
        PSHR    R5                              ; 5D09   0275
        PSHR    R0                              ; 5D0A   0270
        PSHR    R1                              ; 5D0B   0271
        PSHR    R2                              ; 5D0C   0272
        PSHR    R3                              ; 5D0D   0273
        PSHR    R4                              ; 5D0E   0274
        MVI     G_01E5, R0                      ; 5D0F   0280 01E5
        CMP     G_01E6, R0                      ; 5D11   0340 01E6
        BEQ     L_5D25                          ; 5D13   0204 0010

        MVO     R0,     G_01E6                  ; 5D15   0240 01E6
        MVII    #$0006, R0                      ; 5D17   02B8 0006
        MVII    #$01E7, R4                      ; 5D19   02BC 01E7

        JSR     R5,     X_FILL_ZERO             ; 5D1B   0004 0114 0338

        MVII    #$0001, R0                      ; 5D1E   02B8 0001
        MVO     R0,     G_01ED                  ; 5D20   0240 01ED
        DECR    R0                              ; 5D22   0010
        MVO     R0,     G_01E4                  ; 5D23   0240 01E4
L_5D25:
        CLRR    R0                              ; 5D25   01C0
        MVO     R0,     G_014C                  ; 5D26   0240 014C
        SDBD                                    ; 5D28   0001
        MVII    #$5C9A, R4                      ; 5D29   02BC 009A 005C
        MVI     G_01E5, R1                      ; 5D2C   0281 01E5
        SLL     R1,     1                       ; 5D2E   0049
        ADDR    R1,     R4                      ; 5D2F   00CC
        SDBD                                    ; 5D30   0001
        MVI@    R4,     R5                      ; 5D31   02A5
        MVI     G_01ED, R0                      ; 5D32   0280 01ED
        DECR    R0                              ; 5D34   0010
        BNEQ    L_5D54                          ; 5D35   020C 001D

        MVII    #$01F0, R1                      ; 5D37   02B9 01F0
        ADDI    #$0003, R5                      ; 5D39   02FD 0003
        MVII    #$01E9, R3                      ; 5D3B   02BB 01E9
        MVII    #$01EC, R2                      ; 5D3D   02BA 01EC
L_5D3F:
        PSHR    R2                              ; 5D3F   0272
        PSHR    R3                              ; 5D40   0273
        SDBD                                    ; 5D41   0001
        MVI@    R5,     R4                      ; 5D42   02AC
        MOVR    R5,     R0                      ; 5D43   00A8
        PSHR    R5                              ; 5D44   0275

        JSR     R5,     L_5CA4                  ; 5D45   0004 015C 00A4

        PULR    R5                              ; 5D48   02B5
        PULR    R3                              ; 5D49   02B3
        PULR    R2                              ; 5D4A   02B2
        DECR    R3                              ; 5D4B   0013
        DECR    R2                              ; 5D4C   0012
        INCR    R5                              ; 5D4D   000D
        INCR    R1                              ; 5D4E   0009
        CMPI    #$01F3, R1                      ; 5D4F   0379 01F3
        BNEQ    L_5D3F                          ; 5D51   022C 0013

        MVI@    R5,     R0                      ; 5D53   02A8
L_5D54:
        MVII    #$01FB, R4                      ; 5D54   02BC 01FB
        MVII    #$0003, R1                      ; 5D56   02B9 0003
        MVI     G_01E5, R2                      ; 5D58   0282 01E5
        CMPI    #$0002, R2                      ; 5D5A   037A 0002
        BNEQ    L_5D60                          ; 5D5C   020C 0002

        SUBI    #$0002, R1                      ; 5D5E   0339 0002
L_5D60:
        TSTR    R2                              ; 5D60   0092
        BNEQ    L_5D65                          ; 5D61   020C 0002

        SUBI    #$0002, R1                      ; 5D63   0339 0002
L_5D65:
        MVII    #$0330, R3                      ; 5D65   02BB 0330
L_5D67:
        MVI@    R3,     R2                      ; 5D67   029A
        SUB@    R5,     R2                      ; 5D68   032A
        BPL     L_5D6C                          ; 5D69   0203 0001

        CLRR    R2                              ; 5D6B   01D2
L_5D6C:
        MVO@    R2,     R3                      ; 5D6C   025A
        SLR     R2,     2                       ; 5D6D   0066
        SLR     R2,     2                       ; 5D6E   0066
        SLR     R2,     1                       ; 5D6F   0062
        ANDI    #$000F, R2                      ; 5D70   03BA 000F
        MVO@    R2,     R4                      ; 5D72   0262
        INCR    R3                              ; 5D73   000B
        DECR    R1                              ; 5D74   0011
        BNEQ    L_5D67                          ; 5D75   022C 000F

        MVO     R0,     G_01ED                  ; 5D77   0240 01ED
        PULR    R4                              ; 5D79   02B4
        PULR    R3                              ; 5D7A   02B3
        PULR    R2                              ; 5D7B   02B2
        PULR    R1                              ; 5D7C   02B1
        PULR    R0                              ; 5D7D   02B0
        PULR    R7                              ; 5D7E   02B7
        ADCR    R6                              ; 5D7F   002E
        DECLE   $0000                           ; 5D80   0000

        ADCR    R6                              ; 5D81   002E
        DECLE   $0000                           ; 5D82   0000

        ADCR    R6                              ; 5D83   002E
        DECLE   $0000                           ; 5D84   0000

        ADCR    R6                              ; 5D85   002E
        DECLE   $0000                           ; 5D86   0000

        ADCR    R6                              ; 5D87   002E
        DECLE   $0000                           ; 5D88   0000

        MOVR    R7,     R6                      ; 5D89   00BE

        JSRD    R4,     L_5C04                  ; 5D8A   0004 005E 0004

        MOVR    R7,     R6                      ; 5D8D   00BE

        JSRD    R4,     G_2C00                  ; 5D8E   0004 002E 0000

        SWAP    R2,     2                       ; 5D91   0046
        DIS                                     ; 5D92   0003
        NEGR    R3                              ; 5D93   0023
        DIS                                     ; 5D94   0003
        DECLE   $0036                           ; 5D95   0036

        DIS                                     ; 5D96   0003
        SWAP    R2,     2                       ; 5D97   0046
        DIS                                     ; 5D98   0003
        NEGR    R3                              ; 5D99   0023
        DIS                                     ; 5D9A   0003
        NEGR    R3                              ; 5D9B   0023
        DIS                                     ; 5D9C   0003
        NEGR    R3                              ; 5D9D   0023
        DIS                                     ; 5D9E   0003
        NEGR    R3                              ; 5D9F   0023
        DIS                                     ; 5DA0   0003
        ADDR    R0,     R3                      ; 5DA1   00C3
        EIS                                     ; 5DA2   0002
        ADDR    R4,     R3                      ; 5DA3   00E3
        EIS                                     ; 5DA4   0002
        NEGR    R3                              ; 5DA5   0023
        DIS                                     ; 5DA6   0003
        ADCR    R6                              ; 5DA7   002E
        DECLE   $0000                           ; 5DA8   0000

        ADCR    R6                              ; 5DA9   002E
        DECLE   $0000                           ; 5DAA   0000

        SAR     R2,     2                       ; 5DAB   006E

        JSRD    R4,     G_BC04                  ; 5DAC   0004 00BE 0004

        SAR     R2,     2                       ; 5DAF   006E

        JSR     R4,     L_5805                  ; 5DB0   0004 0058 0005

        MOVR    R7,     R0                      ; 5DB3   00B8
        DECLE   $0005                           ; 5DB4   0005

        RRC     R2,     2                       ; 5DB5   0076
        DIS                                     ; 5DB6   0003
        NEGR    R3                              ; 5DB7   0023
        DIS                                     ; 5DB8   0003
        DECLE   $0036                           ; 5DB9   0036

        DIS                                     ; 5DBA   0003
        SWAP    R2,     2                       ; 5DBB   0046
        DIS                                     ; 5DBC   0003
        NEGR    R3                              ; 5DBD   0023
        DIS                                     ; 5DBE   0003
        DECLE   $0036                           ; 5DBF   0036

        DIS                                     ; 5DC0   0003
        RRC     R2,     2                       ; 5DC1   0076
        DIS                                     ; 5DC2   0003
        NEGR    R3                              ; 5DC3   0023
        DIS                                     ; 5DC4   0003
        NEGR    R3                              ; 5DC5   0023
        DIS                                     ; 5DC6   0003
        NEGR    R3                              ; 5DC7   0023
        DIS                                     ; 5DC8   0003
        SUBR    R0,     R3                      ; 5DC9   0103
        EIS                                     ; 5DCA   0002
        ANDR    R4,     R3                      ; 5DCB   01A3
        EIS                                     ; 5DCC   0002
        NEGR    R3                              ; 5DCD   0023
        DIS                                     ; 5DCE   0003
        ADCR    R6                              ; 5DCF   002E
        DECLE   $0000                           ; 5DD0   0000

        SAR     R2,     2                       ; 5DD1   006E

        JSR     R4,     G_2804                  ; 5DD2   0004 0028 0004

        SLLC    R0,     1                       ; 5DD5   0058
        DECLE   $0005                           ; 5DD6   0005

        MOVR    R7,     R0                      ; 5DD7   00B8
        DECLE   $0005                           ; 5DD8   0005

        MOVR    R1,     R0                      ; 5DD9   0088
        DECLE   $0005                           ; 5DDA   0005

        MOVR    R3,     R0                      ; 5DDB   0098
        DIS                                     ; 5DDC   0003
        MOVR    R4,     R6                      ; 5DDD   00A6
        DIS                                     ; 5DDE   0003
        RRC     R2,     2                       ; 5DDF   0076
        DIS                                     ; 5DE0   0003
        NEGR    R3                              ; 5DE1   0023
        DIS                                     ; 5DE2   0003
        DECLE   $0036                           ; 5DE3   0036

        DIS                                     ; 5DE4   0003
        SWAP    R2,     2                       ; 5DE5   0046
        DIS                                     ; 5DE6   0003
        NEGR    R3                              ; 5DE7   0023
        DIS                                     ; 5DE8   0003
        DECLE   $0036                           ; 5DE9   0036

        DIS                                     ; 5DEA   0003
        NEGR    R7                              ; 5DEB   0027
        SETC                                    ; 5DEC   0007
        SWAP    R2,     2                       ; 5DED   0046
        DIS                                     ; 5DEE   0003
        NEGR    R3                              ; 5DEF   0023
        DIS                                     ; 5DF0   0003
        XORR    R0,     R3                      ; 5DF1   01C3
        EIS                                     ; 5DF2   0002
        XORR    R4,     R3                      ; 5DF3   01E3
        EIS                                     ; 5DF4   0002
        NEGR    R3                              ; 5DF5   0023
        DIS                                     ; 5DF6   0003
        SAR     R2,     2                       ; 5DF7   006E

        JSR     R4,     L_5805                  ; 5DF8   0004 0058 0005

        MOVR    R7,     R0                      ; 5DFB   00B8
        DECLE   $0005                           ; 5DFC   0005

        MOVR    R1,     R0                      ; 5DFD   0088
        DECLE   $0005                           ; 5DFE   0005

        MOVR    R3,     R0                      ; 5DFF   0098
        DIS                                     ; 5E00   0003
        MOVR    R7,     R0                      ; 5E01   00B8
        DECLE   $0005                           ; 5E02   0005

        SUBR    R5,     R0                      ; 5E03   0128
        DIS                                     ; 5E04   0003
        NEGR    R6                              ; 5E05   0026
        DIS                                     ; 5E06   0003
        MOVR    R4,     R6                      ; 5E07   00A6
        DIS                                     ; 5E08   0003
        SWAP    R2,     2                       ; 5E09   0046
        DIS                                     ; 5E0A   0003
        NEGR    R3                              ; 5E0B   0023
        DIS                                     ; 5E0C   0003
        DECLE   $0036                           ; 5E0D   0036

        DIS                                     ; 5E0E   0003
        SUBR    R6,     R7                      ; 5E0F   0137
        DECLE   $0005                           ; 5E10   0005

        CMPR    R0,     R7                      ; 5E11   0147
        DECLE   $0005                           ; 5E12   0005

        SUBR    R6,     R7                      ; 5E13   0137
        DECLE   $0005                           ; 5E14   0005

        NEGR    R6                              ; 5E15   0026
        DIS                                     ; 5E16   0003
        NEGR    R7                              ; 5E17   0027
        DIS                                     ; 5E18   0003
        NEGR    R7                              ; 5E19   0027
        DECLE   $0004                           ; 5E1A   0004

        NEGR    R7                              ; 5E1B   0027
        DIS                                     ; 5E1C   0003
        NEGR    R7                              ; 5E1D   0027
        DIS                                     ; 5E1E   0003
        MOVR    R7,     R0                      ; 5E1F   00B8
L_5E20:
        DECLE   $0005                           ; 5E20   0005

        MOVR    R1,     R0                      ; 5E21   0088
        DECLE   $0005                           ; 5E22   0005

        MOVR    R3,     R0                      ; 5E23   0098
        DIS                                     ; 5E24   0003
        MOVR    R7,     R0                      ; 5E25   00B8
        DECLE   $0005                           ; 5E26   0005

        SUBR    R5,     R0                      ; 5E27   0128
        DIS                                     ; 5E28   0003
L_5E29:
        SWAP    R2,     2                       ; 5E29   0046
        DIS                                     ; 5E2A   0003
        NEGR    R3                              ; 5E2B   0023
        DIS                                     ; 5E2C   0003
        DECLE   $0036                           ; 5E2D   0036

        DIS                                     ; 5E2E   0003
        NEGR    R6                              ; 5E2F   0026
        DIS                                     ; 5E30   0003
        NEGR    R6                              ; 5E31   0026
        DIS                                     ; 5E32   0003
        BGE     L_5E36                          ; 5E33   020D 0001

        ADCR    R5                              ; 5E35   002D
L_5E36:
        SDBD                                    ; 5E36   0001
        XOR@    R5,     R5                      ; 5E37   03ED
        SDBD                                    ; 5E38   0001
        CMP@    R3,     R5                      ; 5E39   035D
        SDBD                                    ; 5E3A   0001
        XORI    #$3601, R5                      ; 5E3B   03FD 0001 0036
        DECLE   $0001                           ; 5E3E   0001

        SUBR    R6,     R7                      ; 5E3F   0137
        DECLE   $0005                           ; 5E40   0005

        CMPR    R0,     R7                      ; 5E41   0147
        DECLE   $0005                           ; 5E42   0005

        SUBR    R6,     R7                      ; 5E43   0137
        DECLE   $0005                           ; 5E44   0005

        CMPR    R0,     R7                      ; 5E45   0147
        DECLE   $0005                           ; 5E46   0005

        MOVR    R3,     R0                      ; 5E47   0098
        DIS                                     ; 5E48   0003
        MOVR    R7,     R0                      ; 5E49   00B8
        DECLE   $0005                           ; 5E4A   0005

        SUBR    R5,     R0                      ; 5E4B   0128
        DIS                                     ; 5E4C   0003
        SWAP    R2,     2                       ; 5E4D   0046
        DIS                                     ; 5E4E   0003
        NEGR    R3                              ; 5E4F   0023
        DIS                                     ; 5E50   0003
        DECLE   $0036                           ; 5E51   0036

        DIS                                     ; 5E52   0003
        RRC     R2,     2                       ; 5E53   0076
        DIS                                     ; 5E54   0003
        NEGR    R3                              ; 5E55   0023
        DIS                                     ; 5E56   0003
        DECLE   $0036                           ; 5E57   0036

        DIS                                     ; 5E58   0003
        NEGR    R6                              ; 5E59   0026
        DIS                                     ; 5E5A   0003
        XOR@    R3,     R5                      ; 5E5B   03DD
        DECLE   $0001                           ; 5E5C   0001

        RRC     R2,     2                       ; 5E5D   0076
        DIS                                     ; 5E5E   0003
        NEGR    R3                              ; 5E5F   0023
        DIS                                     ; 5E60   0003
        NEGR    R3                              ; 5E61   0023
        DIS                                     ; 5E62   0003
        NEGR    R3                              ; 5E63   0023
        DIS                                     ; 5E64   0003
        NEGR    R3                              ; 5E65   0023
        DIS                                     ; 5E66   0003
        NEGR    R3                              ; 5E67   0023
        DIS                                     ; 5E68   0003
        NEGR    R3                              ; 5E69   0023
        DIS                                     ; 5E6A   0003
        NEGR    R3                              ; 5E6B   0023
        DIS                                     ; 5E6C   0003
        NEGR    R3                              ; 5E6D   0023
        DIS                                     ; 5E6E   0003
        SUBR    R5,     R0                      ; 5E6F   0128
        DIS                                     ; 5E70   0003
        SWAP    R2,     2                       ; 5E71   0046
        DIS                                     ; 5E72   0003
        NEGR    R3                              ; 5E73   0023
        DIS                                     ; 5E74   0003
        DECLE   $0036                           ; 5E75   0036

        DIS                                     ; 5E76   0003
        SWAP    R2,     2                       ; 5E77   0046
        DIS                                     ; 5E78   0003
        NEGR    R3                              ; 5E79   0023
        DIS                                     ; 5E7A   0003
        DECLE   $0036                           ; 5E7B   0036

        DIS                                     ; 5E7C   0003
        RSWD    R2                              ; 5E7D   003A
        DECLE   $0000                           ; 5E7E   0000

        ADCR    R2                              ; 5E7F   002A
        CLRC                                    ; 5E80   0006
        DECLE   $0036                           ; 5E81   0036

        CLRC                                    ; 5E82   0006
        XOR@    R3,     R5                      ; 5E83   03DD
        DECLE   $0001                           ; 5E84   0001

        MOVR    R4,     R6                      ; 5E85   00A6
        DIS                                     ; 5E86   0003
        RRC     R2,     2                       ; 5E87   0076
        DIS                                     ; 5E88   0003
        NEGR    R3                              ; 5E89   0023
        DIS                                     ; 5E8A   0003
        NEGR    R3                              ; 5E8B   0023
        DIS                                     ; 5E8C   0003
        NEGR    R3                              ; 5E8D   0023
        DIS                                     ; 5E8E   0003
        NEGR    R3                              ; 5E8F   0023
        DIS                                     ; 5E90   0003
        NEGR    R3                              ; 5E91   0023
        DIS                                     ; 5E92   0003
        NEGR    R3                              ; 5E93   0023
        DIS                                     ; 5E94   0003
        NEGR    R3                              ; 5E95   0023
        DIS                                     ; 5E96   0003
        NEGR    R3                              ; 5E97   0023
        DIS                                     ; 5E98   0003
        DECLE   $0036                           ; 5E99   0036

        DIS                                     ; 5E9A   0003
        RRC     R2,     2                       ; 5E9B   0076
        DIS                                     ; 5E9C   0003
        NEGR    R3                              ; 5E9D   0023
        DIS                                     ; 5E9E   0003
        DECLE   $0036                           ; 5E9F   0036

        DIS                                     ; 5EA0   0003
        NEGR    R7                              ; 5EA1   0027
        DIS                                     ; 5EA2   0003
        NEGR    R7                              ; 5EA3   0027
        DIS                                     ; 5EA4   0003
        AND@    R6,     R7                      ; 5EA5   03B7
        DECLE   $0000                           ; 5EA6   0000

        RSWD    R2                              ; 5EA7   003A
        DECLE   $0000                           ; 5EA8   0000

        ADCR    R2                              ; 5EA9   002A
        CLRC                                    ; 5EAA   0006
        GSWD    R1                              ; 5EAB   0031
        CLRC                                    ; 5EAC   0006
        NEGR    R6                              ; 5EAD   0026
        DIS                                     ; 5EAE   0003
        MOVR    R4,     R6                      ; 5EAF   00A6
        DIS                                     ; 5EB0   0003
        NEGR    R7                              ; 5EB1   0027
        DIS                                     ; 5EB2   0003
        NEGR    R7                              ; 5EB3   0027
        DIS                                     ; 5EB4   0003
        NEGR    R7                              ; 5EB5   0027
        DIS                                     ; 5EB6   0003
        NEGR    R7                              ; 5EB7   0027
        DIS                                     ; 5EB8   0003
        NEGR    R7                              ; 5EB9   0027
        DIS                                     ; 5EBA   0003
        NEGR    R7                              ; 5EBB   0027
        DIS                                     ; 5EBC   0003
        SWAP    R2,     2                       ; 5EBD   0046
        DIS                                     ; 5EBE   0003
        SWAP    R2,     2                       ; 5EBF   0046
        DIS                                     ; 5EC0   0003
        NEGR    R3                              ; 5EC1   0023
        DIS                                     ; 5EC2   0003
        DECLE   $0036                           ; 5EC3   0036

        DIS                                     ; 5EC4   0003
        SUBR    R6,     R7                      ; 5EC5   0137
        DECLE   $0005                           ; 5EC6   0005

        CMPR    R0,     R7                      ; 5EC7   0147
        DECLE   $0005                           ; 5EC8   0005

        CMPR    R0,     R7                      ; 5EC9   0147
        DECLE   $0005                           ; 5ECA   0005

        SUBR    R6,     R7                      ; 5ECB   0137
        DECLE   $0005                           ; 5ECC   0005

        XOR     .STIC.X.0,R7                    ; 5ECD   03C7 0000
        NEGR    R0                              ; 5ECF   0020
        DECLE   $0000                           ; 5ED0   0000

        AND@    R1,     R0                      ; 5ED1   0388
        DECLE   $0000                           ; 5ED2   0000

        ADCR    R0                              ; 5ED3   0028
        JD      G_8404                          ; 5ED4   0004 0386 0004

        MOVR    R4,     R6                      ; 5ED7   00A6
        DIS                                     ; 5ED8   0003
        RLC     R3,     2                       ; 5ED9   0057
        DECLE   $0005                           ; 5EDA   0005

        MOVR    R6,     R7                      ; 5EDB   00B7
        DECLE   $0005                           ; 5EDC   0005

        SUBR    R6,     R7                      ; 5EDD   0137
        DECLE   $0005                           ; 5EDE   0005

        CMPR    R0,     R7                      ; 5EDF   0147
        DECLE   $0005                           ; 5EE0   0005

        SWAP    R2,     2                       ; 5EE1   0046
        DIS                                     ; 5EE2   0003
        NEGR    R3                              ; 5EE3   0023
        DIS                                     ; 5EE4   0003
        DECLE   $0036                           ; 5EE5   0036

        DIS                                     ; 5EE6   0003
        NEGR    R6                              ; 5EE7   0026
        DIS                                     ; 5EE8   0003
        RRC     R2,     2                       ; 5EE9   0076
        DIS                                     ; 5EEA   0003
        NEGR    R3                              ; 5EEB   0023
        DIS                                     ; 5EEC   0003
        NEGR    R3                              ; 5EED   0023
        DIS                                     ; 5EEE   0003
        NEGR    R3                              ; 5EEF   0023
        DIS                                     ; 5EF0   0003
        RSWD    R5                              ; 5EF1   003D
        DIS                                     ; 5EF2   0003
        ADCR    R5                              ; 5EF3   002D
        DECLE   $0001                           ; 5EF4   0001

        ADCR    R5                              ; 5EF5   002D
        DECLE   $0001                           ; 5EF6   0001

        SLL     R1,     2                       ; 5EF7   004D
        SDBD                                    ; 5EF8   0001
        AND@    R3,     R0                      ; 5EF9   0398
        DECLE   $0001                           ; 5EFA   0001

        ADCR    R0                              ; 5EFB   0028
        JD      G_9404                          ; 5EFC   0004 0396 0004

        NEGR    R6                              ; 5EFF   0026
        DIS                                     ; 5F00   0003
        MOVR    R0,     R7                      ; 5F01   0087
        DECLE   $0005                           ; 5F02   0005

        MOVR    R2,     R7                      ; 5F03   0097
        DIS                                     ; 5F04   0003
        SWAP    R2,     2                       ; 5F05   0046
        DIS                                     ; 5F06   0003
        NEGR    R3                              ; 5F07   0023
        DIS                                     ; 5F08   0003
        DECLE   $0036                           ; 5F09   0036

        DIS                                     ; 5F0A   0003
        RRC     R2,     2                       ; 5F0B   0076
        DIS                                     ; 5F0C   0003
        NEGR    R3                              ; 5F0D   0023
        DIS                                     ; 5F0E   0003
        DECLE   $0036                           ; 5F0F   0036

        DIS                                     ; 5F10   0003
        MOVR    R4,     R6                      ; 5F11   00A6
        DIS                                     ; 5F12   0003
        NEGR    R7                              ; 5F13   0027
        DIS                                     ; 5F14   0003
        NEGR    R7                              ; 5F15   0027
        DIS                                     ; 5F16   0003
        SUBR    R6,     R7                      ; 5F17   0137
        DECLE   $0005                           ; 5F18   0005

        CMPR    R0,     R7                      ; 5F19   0147
        DECLE   $0005                           ; 5F1A   0005

        CMPR    R3,     R5                      ; 5F1B   015D
        DECLE   $0001                           ; 5F1C   0001

        CMPR    R3,     R5                      ; 5F1D   015D
        DECLE   $0001                           ; 5F1E   0001

        CMPR    R3,     R5                      ; 5F1F   015D
        SDBD                                    ; 5F20   0001
        AND@    R5,     R0                      ; 5F21   03A8
        DECLE   $0000                           ; 5F22   0000

        ADCR    R0                              ; 5F23   0028
        JE      G_A004                          ; 5F24   0004 03A1 0004

        DECLE   $0036,  $0001                   ; 5F27   0036 0001

        NEGR    R7                              ; 5F29   0027
        DECLE   $0000                           ; 5F2A   0000

        SUBR    R4,     R7                      ; 5F2B   0127
        DIS                                     ; 5F2C   0003
        NEGR    R6                              ; 5F2D   0026
        DIS                                     ; 5F2E   0003
        CMPR    R0,     R7                      ; 5F2F   0147
        DECLE   $0005                           ; 5F30   0005

        SUBR    R6,     R7                      ; 5F31   0137
        DECLE   $0005                           ; 5F32   0005

        MOVR    R4,     R6                      ; 5F33   00A6
        DIS                                     ; 5F34   0003
        NEGR    R7                              ; 5F35   0027
        DECLE   $0000                           ; 5F36   0000

        NEGR    R7                              ; 5F37   0027
        DIS                                     ; 5F38   0003
        MOVR    R4,     R6                      ; 5F39   00A6
        DIS                                     ; 5F3A   0003
        SWAP    R2,     2                       ; 5F3B   0046
        DIS                                     ; 5F3C   0003
        NEGR    R3                              ; 5F3D   0023
        DIS                                     ; 5F3E   0003
        NEGR    R3                              ; 5F3F   0023
        DIS                                     ; 5F40   0003
        NEGR    R3                              ; 5F41   0023
        DIS                                     ; 5F42   0003
        RSWD    R5                              ; 5F43   003D
        DIS                                     ; 5F44   0003
        ADCR    R5                              ; 5F45   002D
        DECLE   $0001                           ; 5F46   0001

        ADCR    R5                              ; 5F47   002D
        DECLE   $0001                           ; 5F48   0001

        SLL     R1,     2                       ; 5F49   004D
        DECLE   $0001                           ; 5F4A   0001

        SWAP    R2,     2                       ; 5F4B   0046
        DIS                                     ; 5F4C   0003
        NEGR    R3                              ; 5F4D   0023
        DIS                                     ; 5F4E   0003
        NEGR    R3                              ; 5F4F   0023
        DIS                                     ; 5F50   0003
        RSWD    R5                              ; 5F51   003D
        DIS                                     ; 5F52   0003
        ADCR    R5                              ; 5F53   002D
        DIS                                     ; 5F54   0003
        SLL     R1,     2                       ; 5F55   004D
        DIS                                     ; 5F56   0003
        NEGR    R3                              ; 5F57   0023
        DIS                                     ; 5F58   0003
        NEGR    R3                              ; 5F59   0023
        DIS                                     ; 5F5A   0003
        DECLE   $0036                           ; 5F5B   0036

        DIS                                     ; 5F5C   0003
        NEGR    R7                              ; 5F5D   0027
        DIS                                     ; 5F5E   0003
        DECLE   $0037,  $0001                   ; 5F5F   0037 0001

        SWAP    R3,     2                       ; 5F61   0047
        DIS                                     ; 5F62   0003
        NEGR    R3                              ; 5F63   0023
        DIS                                     ; 5F64   0003
        CMP@    R6,     R3                      ; 5F65   0373
        DECLE   $0001                           ; 5F66   0001

        NEGR    R1                              ; 5F67   0021
        DECLE   $0001                           ; 5F68   0001

        NEGR    R1                              ; 5F69   0021
        DECLE   $0001                           ; 5F6A   0001

        NEGR    R1                              ; 5F6B   0021
        DECLE   $0001                           ; 5F6C   0001

        NEGR    R1                              ; 5F6D   0021
        DECLE   $0001,  $0037,  $0001           ; 5F6E   0001 0037 0001

        SWAP    R3,     2                       ; 5F71   0047
        DIS                                     ; 5F72   0003
        NEGR    R3                              ; 5F73   0023
        DIS                                     ; 5F74   0003
        NEGR    R3                              ; 5F75   0023
        DIS                                     ; 5F76   0003
        DECLE   $0037                           ; 5F77   0037

        DIS                                     ; 5F78   0003
        NEGR    R7                              ; 5F79   0027
        DECLE   $0000                           ; 5F7A   0000

        SUB@    R6,     R7                      ; 5F7B   0337
        DIS                                     ; 5F7C   0003
        NEGR    R3                              ; 5F7D   0023
        DIS                                     ; 5F7E   0003
        NEGR    R3                              ; 5F7F   0023
        DIS                                     ; 5F80   0003
        NEGR    R3                              ; 5F81   0023
        DIS                                     ; 5F82   0003
        NEGR    R3                              ; 5F83   0023
        DIS                                     ; 5F84   0003
        NEGR    R3                              ; 5F85   0023
        DIS                                     ; 5F86   0003
        NEGR    R1                              ; 5F87   0021
        DECLE   $0001,  $0037,  $0001           ; 5F88   0001 0037 0001

        SUB@    R6,     R7                      ; 5F8B   0337
        DIS                                     ; 5F8C   0003
        NEGR    R3                              ; 5F8D   0023
        DIS                                     ; 5F8E   0003
        GSWD    R1                              ; 5F8F   0031
        DIS                                     ; 5F90   0003
        NEGR    R1                              ; 5F91   0021
        DECLE   $0001                           ; 5F92   0001

        NEGR    R1                              ; 5F93   0021
        DECLE   $0001                           ; 5F94   0001

        NEGR    R1                              ; 5F95   0021
        DECLE   $0001                           ; 5F96   0001

        NEGR    R1                              ; 5F97   0021
        DECLE   $0001,  $0037,  $0001           ; 5F98   0001 0037 0001

        SUB@    R6,     R7                      ; 5F9B   0337
        DIS                                     ; 5F9C   0003
        NEGR    R3                              ; 5F9D   0023
        DIS                                     ; 5F9E   0003
        NEGR    R3                              ; 5F9F   0023
        DIS                                     ; 5FA0   0003
        DECLE   $0037                           ; 5FA1   0037

        DIS                                     ; 5FA2   0003
        NEGR    R7                              ; 5FA3   0027
        DECLE   $0000                           ; 5FA4   0000

        SWAP    R3,     2                       ; 5FA5   0047
        DIS                                     ; 5FA6   0003
        NEGR    R3                              ; 5FA7   0023
        DIS                                     ; 5FA8   0003
        NEGR    R3                              ; 5FA9   0023
        DIS                                     ; 5FAA   0003
        NEGR    R3                              ; 5FAB   0023
L_5FAC:
        DIS                                     ; 5FAC   0003
        BPL     L_5FAC                          ; 5FAD   0223 0002

        NEGR    R1                              ; 5FAF   0021
        DECLE   $0001                           ; 5FB0   0001

        NEGR    R1                              ; 5FB1   0021
        DECLE   $0001,  $0037,  $0001           ; 5FB2   0001 0037 0001

        SUB@    R6,     R7                      ; 5FB5   0337
        DIS                                     ; 5FB6   0003
        NEGR    R3                              ; 5FB7   0023
        DIS                                     ; 5FB8   0003
        GSWD    R1                              ; 5FB9   0031
        DIS                                     ; 5FBA   0003
        NEGR    R1                              ; 5FBB   0021
        DECLE   $0001                           ; 5FBC   0001

        NEGR    R1                              ; 5FBD   0021
        DECLE   $0001                           ; 5FBE   0001

        NEGR    R1                              ; 5FBF   0021
        DECLE   $0001                           ; 5FC0   0001

        NEGR    R1                              ; 5FC1   0021
        DECLE   $0001,  $0037,  $0001           ; 5FC2   0001 0037 0001

        NEGR    R0                              ; 5FC5   0020
        DECLE   $0000                           ; 5FC6   0000

        SUB@    R6,     R7                      ; 5FC7   0337
        DIS                                     ; 5FC8   0003
        NEGR    R3                              ; 5FC9   0023
        DIS                                     ; 5FCA   0003
        DECLE   $0037                           ; 5FCB   0037

        DIS                                     ; 5FCC   0003
        NEGR    R7                              ; 5FCD   0027
        DECLE   $0000                           ; 5FCE   0000

        SUB@    R6,     R7                      ; 5FCF   0337
        DIS                                     ; 5FD0   0003
        NEGR    R3                              ; 5FD1   0023
        DIS                                     ; 5FD2   0003
        NEGR    R3                              ; 5FD3   0023
        DIS                                     ; 5FD4   0003
        NEGR    R3                              ; 5FD5   0023
        DIS                                     ; 5FD6   0003
        NEGR    R1                              ; 5FD7   0021
        DECLE   $0001                           ; 5FD8   0001

        NEGR    R1                              ; 5FD9   0021
        DECLE   $0001                           ; 5FDA   0001

        NEGR    R1                              ; 5FDB   0021
        SDBD                                    ; 5FDC   0001
        CMP@    R4,     R7                      ; 5FDD   0367
        SDBD                                    ; 5FDE   0001
        CMP@    R2,     R1                      ; 5FDF   0351
        DECLE   $0000                           ; 5FE0   0000

        CMP@    R2,     R1                      ; 5FE1   0351
        DECLE   $0000                           ; 5FE2   0000

        NEGR    R1                              ; 5FE3   0021
        DECLE   $0001                           ; 5FE4   0001

        NEGR    R1                              ; 5FE5   0021
        DECLE   $0001                           ; 5FE6   0001

        NEGR    R1                              ; 5FE7   0021
        DECLE   $0001                           ; 5FE8   0001

        NEGR    R1                              ; 5FE9   0021
        DECLE   $0001                           ; 5FEA   0001

        NEGR    R1                              ; 5FEB   0021
        DECLE   $0001                           ; 5FEC   0001

        NEGR    R1                              ; 5FED   0021
        DECLE   $0001,  $0037,  $0001           ; 5FEE   0001 0037 0001

        SWAP    R3,     2                       ; 5FF1   0047
        DIS                                     ; 5FF2   0003
        NEGR    R3                              ; 5FF3   0023
        DIS                                     ; 5FF4   0003
        DECLE   $0037                           ; 5FF5   0037

        DIS                                     ; 5FF6   0003
        NEGR    R7                              ; 5FF7   0027
        DECLE   $0000                           ; 5FF8   0000

        NEGR    R0                              ; 5FF9   0020
        DECLE   $0000                           ; 5FFA   0000

        NEGR    R0                              ; 5FFB   0020
        DECLE   $0000                           ; 5FFC   0000

        NEGR    R0                              ; 5FFD   0020
        DECLE   $0000                           ; 5FFE   0000

        NEGR    R1                              ; 5FFF   0021
        DECLE   $0001                           ; 6000   0001

        NEGR    R1                              ; 6001   0021
        DECLE   $0001                           ; 6002   0001

        NEGR    R1                              ; 6003   0021
        DECLE   $0001                           ; 6004   0001

        NEGR    R1                              ; 6005   0021
        DECLE   $0001                           ; 6006   0001

        NEGR    R1                              ; 6007   0021
        DECLE   $0001                           ; 6008   0001

        NEGR    R1                              ; 6009   0021
        DECLE   $0001                           ; 600A   0001

        NEGR    R1                              ; 600B   0021
        DECLE   $0001                           ; 600C   0001

        NEGR    R1                              ; 600D   0021
        DECLE   $0001                           ; 600E   0001

        NEGR    R1                              ; 600F   0021
        DECLE   $0001                           ; 6010   0001

        NEGR    R1                              ; 6011   0021
        DECLE   $0001                           ; 6012   0001
L_6013:
        NEGR    R1                              ; 6013   0021
        DECLE   $0001                           ; 6014   0001

        NEGR    R1                              ; 6015   0021
        DECLE   $0001                           ; 6016   0001

        NEGR    R1                              ; 6017   0021
        DECLE   $0001                           ; 6018   0001

        SUB@    R6,     R7                      ; 6019   0337
        DIS                                     ; 601A   0003
        NEGR    R3                              ; 601B   0023
        DIS                                     ; 601C   0003
        NEGR    R3                              ; 601D   0023
        DIS                                     ; 601E   0003
        DECLE   $0037                           ; 601F   0037

        DIS                                     ; 6020   0003
        SUB@    R6,     R7                      ; 6021   0337
        DIS                                     ; 6022   0003
        NEGR    R3                              ; 6023   0023
        DIS                                     ; 6024   0003
        NEGR    R3                              ; 6025   0023
        DIS                                     ; 6026   0003
        SLL     R2,     2                       ; 6027   004E
        DECLE   $0001                           ; 6028   0001

        NEGR    R1                              ; 6029   0021
        DECLE   $0001                           ; 602A   0001

        NEGR    R1                              ; 602B   0021
        DECLE   $0001                           ; 602C   0001

        NEGR    R1                              ; 602D   0021
        DECLE   $0001                           ; 602E   0001

        NEGR    R1                              ; 602F   0021
        DECLE   $0001                           ; 6030   0001

        NEGR    R1                              ; 6031   0021
        DECLE   $0001                           ; 6032   0001

        SUB@    R6,     R7                      ; 6033   0337
        DIS                                     ; 6034   0003
        CMP     .STIC.X.3,R0                    ; 6035   0340 0003
        CMP@    R6,     R3                      ; 6037   0373
        DECLE   $0001                           ; 6038   0001

        NEGR    R1                              ; 6039   0021
        DECLE   $0001                           ; 603A   0001

        NEGR    R1                              ; 603B   0021
        DECLE   $0001                           ; 603C   0001

        NEGR    R1                              ; 603D   0021
        DECLE   $0001                           ; 603E   0001

        NEGR    R1                              ; 603F   0021
        DECLE   $0001,  $0037,  $0001           ; 6040   0001 0037 0001

        NEGR    R0                              ; 6043   0020
        DECLE   $0000                           ; 6044   0000

        SUB@    R6,     R7                      ; 6045   0337
        DIS                                     ; 6046   0003
        NEGR    R3                              ; 6047   0023
        DIS                                     ; 6048   0003
        DECLE   $0037                           ; 6049   0037

        DIS                                     ; 604A   0003
        NEGR    R0                              ; 604B   0020
        DECLE   $0000                           ; 604C   0000

        NEGR    R0                              ; 604D   0020
        DECLE   $0000                           ; 604E   0000

        ADCR    R6                              ; 604F   002E
        DECLE   $0000                           ; 6050   0000

        CMPI    #$0001, R6                      ; 6051   037E 0001
        NEGR    R1                              ; 6053   0021
        DECLE   $0001                           ; 6054   0001

        NEGR    R1                              ; 6055   0021
        DECLE   $0001                           ; 6056   0001

        NEGR    R1                              ; 6057   0021
        DECLE   $0001                           ; 6058   0001

        NEGR    R1                              ; 6059   0021
        SDBD                                    ; 605A   0001
        CMP@    R4,     R7                      ; 605B   0367
        SDBD                                    ; 605C   0001
        CMP@    R2,     R1                      ; 605D   0351
        DECLE   $0000                           ; 605E   0000

        CMP@    R2,     R1                      ; 605F   0351
        DECLE   $0000                           ; 6060   0000

        NEGR    R1                              ; 6061   0021
        DECLE   $0001                           ; 6062   0001

        NEGR    R1                              ; 6063   0021
        DECLE   $0001                           ; 6064   0001

        NEGR    R1                              ; 6065   0021
        DECLE   $0001                           ; 6066   0001

        NEGR    R1                              ; 6067   0021
        DECLE   $0001                           ; 6068   0001

        NEGR    R1                              ; 6069   0021
        DECLE   $0001                           ; 606A   0001

        NEGR    R1                              ; 606B   0021
        DECLE   $0001                           ; 606C   0001

        SUB@    R6,     R7                      ; 606D   0337
        DIS                                     ; 606E   0003
        NEGR    R3                              ; 606F   0023
        DIS                                     ; 6070   0003
        NEGR    R3                              ; 6071   0023
        DIS                                     ; 6072   0003
        NEGR    R3                              ; 6073   0023
        DIS                                     ; 6074   0003
        NEGR    R3                              ; 6075   0023
        DIS                                     ; 6076   0003
        ADCR    R6                              ; 6077   002E
        DECLE   $0000                           ; 6078   0000

        ADCR    R6                              ; 6079   002E
        DECLE   $0000                           ; 607A   0000

        CMPI    #$0001, R6                      ; 607B   037E 0001
        NEGR    R1                              ; 607D   0021
        DECLE   $0001                           ; 607E   0001

        NEGR    R1                              ; 607F   0021
        DECLE   $0001                           ; 6080   0001

        NEGR    R1                              ; 6081   0021
        DECLE   $0001                           ; 6082   0001

        NEGR    R1                              ; 6083   0021
        DECLE   $0001                           ; 6084   0001

        NEGR    R1                              ; 6085   0021
        DECLE   $0001                           ; 6086   0001

        NEGR    R1                              ; 6087   0021
        DECLE   $0001                           ; 6088   0001

        NEGR    R1                              ; 6089   0021
        DECLE   $0001                           ; 608A   0001

        NEGR    R1                              ; 608B   0021
        DECLE   $0001                           ; 608C   0001

        NEGR    R1                              ; 608D   0021
        DECLE   $0001                           ; 608E   0001

        NEGR    R1                              ; 608F   0021
        DECLE   $0001                           ; 6090   0001

        NEGR    R1                              ; 6091   0021
        DECLE   $0001                           ; 6092   0001

        NEGR    R1                              ; 6093   0021
        DECLE   $0001,  $0037,  $0001           ; 6094   0001 0037 0001

        NEGR    R0                              ; 6097   0020
        DECLE   $0000                           ; 6098   0000

        SWAP    R3,     2                       ; 6099   0047
        DIS                                     ; 609A   0003
        NEGR    R3                              ; 609B   0023
        DIS                                     ; 609C   0003
        NEGR    R3                              ; 609D   0023
        DIS                                     ; 609E   0003
        ADCR    R6                              ; 609F   002E
        DECLE   $0000                           ; 60A0   0000

        SUB@    R3,     R6                      ; 60A1   031E
        DECLE   $0000                           ; 60A2   0000

        SUB@    R4,     R0                      ; 60A3   0320
        DECLE   $0001                           ; 60A4   0001

        NEGR    R1                              ; 60A5   0021
        DECLE   $0001                           ; 60A6   0001

        NEGR    R1                              ; 60A7   0021
        DECLE   $0001                           ; 60A8   0001

        NEGR    R1                              ; 60A9   0021
        DECLE   $0001                           ; 60AA   0001

        NEGR    R1                              ; 60AB   0021
        DECLE   $0001                           ; 60AC   0001

        NEGR    R1                              ; 60AD   0021
        DECLE   $0001                           ; 60AE   0001

        NEGR    R1                              ; 60AF   0021
        DECLE   $0001                           ; 60B0   0001

        SUB@    R6,     R7                      ; 60B1   0337
        DIS                                     ; 60B2   0003
        CMP     .STIC.X.3,R0                    ; 60B3   0340 0003
        CMP@    R6,     R3                      ; 60B5   0373
        DECLE   $0001                           ; 60B6   0001

        NEGR    R1                              ; 60B7   0021
        DECLE   $0001                           ; 60B8   0001

        NEGR    R1                              ; 60B9   0021
        DECLE   $0001                           ; 60BA   0001

        NEGR    R1                              ; 60BB   0021
        DECLE   $0001                           ; 60BC   0001

        NEGR    R1                              ; 60BD   0021
        DECLE   $0001                           ; 60BE   0001

        NEGR    R1                              ; 60BF   0021
        DECLE   $0001,  $0037,  $0001           ; 60C0   0001 0037 0001

        SUB@    R6,     R7                      ; 60C3   0337
        DIS                                     ; 60C4   0003
        NEGR    R3                              ; 60C5   0023
        DIS                                     ; 60C6   0003
        ADCR    R6                              ; 60C7   002E
        DECLE   $0000                           ; 60C8   0000

        ADCR    R6                              ; 60C9   002E
        DECLE   $0000                           ; 60CA   0000

        ADCR    R6                              ; 60CB   002E
        DECLE   $0000                           ; 60CC   0000

        ADCR    R6                              ; 60CD   002E
        DECLE   $0000                           ; 60CE   0000

        CMPI    #$0001, R6                      ; 60CF   037E 0001
        NEGR    R1                              ; 60D1   0021
        DECLE   $0001                           ; 60D2   0001

        NEGR    R1                              ; 60D3   0021
        DECLE   $0001                           ; 60D4   0001

        NEGR    R1                              ; 60D5   0021
        DECLE   $0001                           ; 60D6   0001

        NEGR    R1                              ; 60D7   0021
        SDBD                                    ; 60D8   0001
        CMP@    R4,     R7                      ; 60D9   0367
        SDBD                                    ; 60DA   0001
        CMP@    R2,     R1                      ; 60DB   0351
        DECLE   $0000                           ; 60DC   0000

        CMP@    R2,     R1                      ; 60DD   0351
        DECLE   $0000                           ; 60DE   0000

        NEGR    R1                              ; 60DF   0021
        DECLE   $0001                           ; 60E0   0001

        NEGR    R1                              ; 60E1   0021
        DECLE   $0001                           ; 60E2   0001

        NEGR    R1                              ; 60E3   0021
        DECLE   $0001                           ; 60E4   0001

        NEGR    R1                              ; 60E5   0021
        DECLE   $0001                           ; 60E6   0001

        NEGR    R1                              ; 60E7   0021
        DECLE   $0001                           ; 60E8   0001

        NEGR    R1                              ; 60E9   0021
        DECLE   $0001                           ; 60EA   0001

        SWAP    R3,     2                       ; 60EB   0047
        DIS                                     ; 60EC   0003
        NEGR    R3                              ; 60ED   0023
        DIS                                     ; 60EE   0003
        ADCR    R6                              ; 60EF   002E
        DECLE   $0000                           ; 60F0   0000

        ADCR    R6                              ; 60F1   002E
        DECLE   $0000                           ; 60F2   0000

        ADCR    R6                              ; 60F3   002E
        DECLE   $0000                           ; 60F4   0000

        SUB@    R3,     R6                      ; 60F5   031E
        DECLE   $0000                           ; 60F6   0000

        SUB@    R4,     R0                      ; 60F7   0320
        DECLE   $0001                           ; 60F8   0001

        NEGR    R1                              ; 60F9   0021
        DECLE   $0001                           ; 60FA   0001

        NEGR    R1                              ; 60FB   0021
        DECLE   $0001                           ; 60FC   0001

        NEGR    R1                              ; 60FD   0021
        DECLE   $0001                           ; 60FE   0001

        NEGR    R1                              ; 60FF   0021
        DECLE   $0001                           ; 6100   0001

        NEGR    R1                              ; 6101   0021
        DECLE   $0001                           ; 6102   0001

        NEGR    R1                              ; 6103   0021
        DECLE   $0001                           ; 6104   0001

        NEGR    R1                              ; 6105   0021
        DECLE   $0001                           ; 6106   0001

        NEGR    R1                              ; 6107   0021
        DECLE   $0001                           ; 6108   0001

        NEGR    R1                              ; 6109   0021
        DECLE   $0001                           ; 610A   0001

        NEGR    R1                              ; 610B   0021
        DECLE   $0001                           ; 610C   0001

        NEGR    R1                              ; 610D   0021
        DECLE   $0001                           ; 610E   0001

        NEGR    R1                              ; 610F   0021
        DECLE   $0001                           ; 6110   0001

        NEGR    R1                              ; 6111   0021
        DECLE   $0001,  $0037,  $0001           ; 6112   0001 0037 0001

        NEGR    R0                              ; 6115   0020
        DECLE   $0000                           ; 6116   0000

        ADCR    R6                              ; 6117   002E
        DECLE   $0000                           ; 6118   0000

        ADCR    R6                              ; 6119   002E
        DECLE   $0000                           ; 611A   0000

        ADCR    R6                              ; 611B   002E
        DECLE   $0000                           ; 611C   0000

        ADCR    R6                              ; 611D   002E
        DECLE   $0000                           ; 611E   0000

        ADCR    R6                              ; 611F   002E
        DECLE   $0000                           ; 6120   0000

        ADCR    R6                              ; 6121   002E
        DECLE   $0000                           ; 6122   0000

        CMPI    #$0001, R6                      ; 6123   037E 0001
        NEGR    R1                              ; 6125   0021
        DECLE   $0001                           ; 6126   0001

        NEGR    R1                              ; 6127   0021
        DECLE   $0001                           ; 6128   0001

        NEGR    R1                              ; 6129   0021
        DECLE   $0001                           ; 612A   0001

        NEGR    R1                              ; 612B   0021
        DECLE   $0001                           ; 612C   0001

        NEGR    R1                              ; 612D   0021
        DECLE   $0001                           ; 612E   0001

        NEGR    R1                              ; 612F   0021
        DECLE   $0001                           ; 6130   0001

        NEGR    R1                              ; 6131   0021
        DECLE   $0001                           ; 6132   0001

        NEGR    R1                              ; 6133   0021
        DECLE   $0001                           ; 6134   0001

        NEGR    R1                              ; 6135   0021
        DECLE   $0001                           ; 6136   0001

        NEGR    R1                              ; 6137   0021
        DECLE   $0001                           ; 6138   0001

        NEGR    R1                              ; 6139   0021
        DECLE   $0001                           ; 613A   0001

        NEGR    R1                              ; 613B   0021
        DECLE   $0001                           ; 613C   0001

        NEGR    R1                              ; 613D   0021
        DECLE   $0001                           ; 613E   0001

        DECR    R0                              ; 613F   0010
        ADCR    R0                              ; 6140   0028
        MOVR    R5,     R0                      ; 6141   00A8
        ADDR    R2,     R4                      ; 6142   00D4
        RLC     R0,     2                       ; 6143   0054
        ADDR    R6,     R4                      ; 6144   00F4
        NEGR    R5                              ; 6145   0025
        EIS                                     ; 6146   0002
        TSTR    R0                              ; 6147   0080
        ADDR    R0,     R0                      ; 6148   00C0
        SWAP    R1,     1                       ; 6149   0041
        ADDR    R1,     R1                      ; 614A   00C9
        RLC     R1,     2                       ; 614B   0055
        RRC     R1,     2                       ; 614C   0075
        NEGR    R5                              ; 614D   0025
        EIS                                     ; 614E   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 614F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6153   0000 0000 0000 0000
        DECLE   $0000                           ; 6157   0000

        TSTR    R0                              ; 6158   0080
        ADDR    R0,     R0                      ; 6159   00C0
        ADDR    R4,     R0                      ; 615A   00E0
        ADDR    R6,     R0                      ; 615B   00F0
        ADDR    R7,     R0                      ; 615C   00F8
        ADDR    R7,     R4                      ; 615D   00FC
        ADDR    R7,     R6                      ; 615E   00FE
        ADDR    R7,     R7                      ; 615F   00FF
        SARC    R3,     2                       ; 6160   007F
        RSWD    R7                              ; 6161   003F
        COMR    R7                              ; 6162   001F
        INCR    R7                              ; 6163   000F
        SETC                                    ; 6164   0007
        DIS                                     ; 6165   0003
        DECLE   $0001,  $0000,  $0004           ; 6166   0001 0000 0004

        INCR    R7                              ; 6169   000F
        COMR    R7                              ; 616A   001F
        RSWD    R7                              ; 616B   003F
        COMR    R5                              ; 616C   001D
        SARC    R1,     1                       ; 616D   0079
        ADDR    R7,     R3                      ; 616E   00FB
        DECLE   $0000,  $0004                   ; 616F   0000 0004

        INCR    R7                              ; 6171   000F
        COMR    R7                              ; 6172   001F
        RSWD    R7                              ; 6173   003F
        COMR    R7                              ; 6174   001F
        RRC     R3,     2                       ; 6175   0077
        ADDR    R6,     R3                      ; 6176   00F3
        ADDR    R7,     R7                      ; 6177   00FF
        SARC    R3,     2                       ; 6178   007F
        RSWD    R7                              ; 6179   003F
        DECLE   $0000                           ; 617A   0000

        DECR    R3                              ; 617B   0013
        COMR    R3                              ; 617C   001B
        COMR    R3                              ; 617D   001B
        COMR    R1                              ; 617E   0019
        ADDR    R6,     R1                      ; 617F   00F1
        ADDR    R7,     R3                      ; 6180   00FB
        SARC    R1,     1                       ; 6181   0079
        GSWD    R2                              ; 6182   0032
        ADDR    R4,     R4                      ; 6183   00E4
        DECLE   $0000,  $0000,  $0000           ; 6184   0000 0000 0000

        ADDR    R2,     R2                      ; 6187   00D2
        MOVR    R6,     R1                      ; 6188   00B1
        ADDR    R4,     R0                      ; 6189   00E0
        ADDR    R4,     R0                      ; 618A   00E0
        ADDR    R0,     R0                      ; 618B   00C0
        ADDR    R4,     R0                      ; 618C   00E0
        SLR     R0,     1                       ; 618D   0060
        SLR     R0,     1                       ; 618E   0060
        COMR    R0                              ; 618F   0018
        DECR    R0                              ; 6190   0010
        DECR    R0                              ; 6191   0010
        DECR    R0                              ; 6192   0010
        DECR    R0                              ; 6193   0010
        DECLE   $0000,  $0000,  $0000           ; 6194   0000 0000 0000

        INCR    R0                              ; 6197   0008
        MOVR    R3,     R4                      ; 6198   009C
        ADDR    R3,     R6                      ; 6199   00DE
        ADDR    R7,     R4                      ; 619A   00FC
        SARC    R2,     2                       ; 619B   007E
        ADDR    R7,     R7                      ; 619C   00FF
        ADDR    R5,     R6                      ; 619D   00EE
        ADDR    R4,     R6                      ; 619E   00E6
        DECLE   $0000                           ; 619F   0000

        SETC                                    ; 61A0   0007
        COMR    R7                              ; 61A1   001F
        ADCR    R2                              ; 61A2   002A
        ADCR    R5                              ; 61A3   002D
        COMR    R7                              ; 61A4   001F
        INCR    R1                              ; 61A5   0009
        SETC                                    ; 61A6   0007
        DECLE   $0000,  $0001                   ; 61A7   0000 0001

        SETC                                    ; 61A9   0007
        INCR    R1                              ; 61AA   0009
        INCR    R3                              ; 61AB   000B
        CLRC                                    ; 61AC   0006
        DECLE   $0001                           ; 61AD   0001

        COMR    R4                              ; 61AE   001C
        DECLE   $0000                           ; 61AF   0000

        TSTR    R0                              ; 61B0   0080
        ADDR    R4,     R0                      ; 61B1   00E0
        MOVR    R2,     R0                      ; 61B2   0090
        ADDR    R2,     R0                      ; 61B3   00D0
        RRC     R0,     1                       ; 61B4   0070
        TSTR    R0                              ; 61B5   0080
        RSWD    R0                              ; 61B6   0038
        DECLE   $0000                           ; 61B7   0000

        ADDR    R4,     R0                      ; 61B8   00E0
        ADDR    R7,     R0                      ; 61B9   00F8
        RLC     R0,     2                       ; 61BA   0054
        MOVR    R6,     R4                      ; 61BB   00B4
        ADDR    R7,     R0                      ; 61BC   00F8
        MOVR    R2,     R0                      ; 61BD   0090
        ADDR    R4,     R0                      ; 61BE   00E0
        COMR    R0                              ; 61BF   0018
        RSWD    R7                              ; 61C0   003F
        SARC    R3,     2                       ; 61C1   007F
        SARC    R1,     2                       ; 61C2   007D
        ADDR    R5,     R6                      ; 61C3   00EE
        ADDR    R4,     R7                      ; 61C4   00E7
        MOVR    R0,     R7                      ; 61C5   0087
        SAR     R3,     2                       ; 61C6   006F
        RSWD    R6                              ; 61C7   003E
        SARC    R3,     2                       ; 61C8   007F
        RRC     R3,     2                       ; 61C9   0077
        SWAP    R3,     2                       ; 61CA   0047
        DECLE   $0037                           ; 61CB   0037

        SAR     R3,     2                       ; 61CC   006F
        SAR     R3,     2                       ; 61CD   006F
        INCR    R6                              ; 61CE   000E
        RRC     R0,     1                       ; 61CF   0070
        GSWD    R0                              ; 61D0   0030
        GSWD    R0                              ; 61D1   0030
        RSWD    R0                              ; 61D2   0038
        SARC    R0,     1                       ; 61D3   0078
        SARC    R0,     1                       ; 61D4   0078
        SARC    R0,     1                       ; 61D5   0078
        SARC    R0,     1                       ; 61D6   0078
        DECLE   $0000,  $0000,  $0000           ; 61D7   0000 0000 0000

        DECR    R0                              ; 61DA   0010
        TSTR    R0                              ; 61DB   0080
        SLL     R0,     2                       ; 61DC   004C
        DECLE   $0036                           ; 61DD   0036

        ADDR    R7,     R7                      ; 61DE   00FF
        DECLE   $0000,  $0000,  $0000           ; 61DF   0000 0000 0000

        TSTR    R0                              ; 61E2   0080
        DECR    R0                              ; 61E3   0010
        ADDR    R2,     R4                      ; 61E4   00D4
        ADDR    R7,     R5                      ; 61E5   00FD
        ADDR    R7,     R6                      ; 61E6   00FE
        SARC    R2,     2                       ; 61E7   007E
        MOVR    R7,     R5                      ; 61E8   00BD
        ADDR    R0,     R3                      ; 61E9   00C3
        SARC    R2,     2                       ; 61EA   007E
        MOVR    R7,     R5                      ; 61EB   00BD
        ADDR    R0,     R3                      ; 61EC   00C3
        SARC    R2,     2                       ; 61ED   007E
        MOVR    R7,     R5                      ; 61EE   00BD
        ADDR    R0,     R3                      ; 61EF   00C3
        SARC    R2,     2                       ; 61F0   007E
        MOVR    R7,     R5                      ; 61F1   00BD
        ADDR    R0,     R3                      ; 61F2   00C3
        SARC    R2,     2                       ; 61F3   007E
        MOVR    R7,     R5                      ; 61F4   00BD
        ADDR    R0,     R3                      ; 61F5   00C3
        SARC    R2,     2                       ; 61F6   007E
        MOVR    R7,     R5                      ; 61F7   00BD
        ADDR    R0,     R3                      ; 61F8   00C3
        SARC    R2,     2                       ; 61F9   007E
        MOVR    R7,     R5                      ; 61FA   00BD
        ADDR    R0,     R3                      ; 61FB   00C3
        SARC    R2,     2                       ; 61FC   007E
        MOVR    R7,     R5                      ; 61FD   00BD
        ADDR    R0,     R3                      ; 61FE   00C3
        DECLE   $0000,  $0000                   ; 61FF   0000 0000

        RSWD    R4                              ; 6201   003C
        ADCR    R0                              ; 6202   0028
        DECR    R4                              ; 6203   0014
        INCR    R4                              ; 6204   000C
        DECLE   $0000,  $0000,  $0000           ; 6205   0000 0000 0000

        SARC    R0,     1                       ; 6208   0078
        SWAP    R0,     2                       ; 6209   0044
        RLC     R2,     1                       ; 620A   0052
        SLL     R2,     1                       ; 620B   004A
        NEGR    R2                              ; 620C   0022
        COMR    R6                              ; 620D   001E
        DECLE   $0000                           ; 620E   0000

        SARC    R0,     2                       ; 620F   007C
        ADDR    R7,     R6                      ; 6210   00FE
        ADDR    R5,     R6                      ; 6211   00EE
        ADDR    R4,     R2                      ; 6212   00E2
        ADDR    R5,     R4                      ; 6213   00EC
        ADDR    R6,     R6                      ; 6214   00F6
        ADDR    R6,     R6                      ; 6215   00F6
        RRC     R0,     1                       ; 6216   0070
        COMR    R0                              ; 6217   0018
        ADDR    R7,     R4                      ; 6218   00FC
        ADDR    R7,     R6                      ; 6219   00FE
        MOVR    R7,     R6                      ; 621A   00BE
        RRC     R3,     2                       ; 621B   0077
        ADDR    R4,     R7                      ; 621C   00E7
        ADDR    R4,     R1                      ; 621D   00E1
        ADDR    R6,     R6                      ; 621E   00F6
        ADDR    R1,     R6                      ; 621F   00CE
        ADDR    R1,     R6                      ; 6220   00CE
        CLRC                                    ; 6221   0006
        COMR    R0                              ; 6222   0018
        COMR    R6                              ; 6223   001E
        INCR    R6                              ; 6224   000E
        DECLE   $0000,  $0000                   ; 6225   0000 0000

        CLRC                                    ; 6227   0006
        COMR    R0                              ; 6228   0018
        COMR    R6                              ; 6229   001E
        INCR    R6                              ; 622A   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 622B   0000 0000 0000 0000

        SLR     R0,     1                       ; 622F   0060
        COMR    R0                              ; 6230   0018
        SARC    R0,     1                       ; 6231   0078
        RRC     R0,     1                       ; 6232   0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6233   0000 0000 0000 0000

        RRC     R3,     1                       ; 6237   0073
        RRC     R3,     1                       ; 6238   0073
        SLR     R0,     1                       ; 6239   0060
        COMR    R0                              ; 623A   0018
        SARC    R0,     1                       ; 623B   0078
        RRC     R0,     1                       ; 623C   0070
        DECLE   $0000,  $0000,  $0000           ; 623D   0000 0000 0000

        TSTR    R0                              ; 6240   0080
        ADDR    R0,     R0                      ; 6241   00C0
        ADDR    R4,     R0                      ; 6242   00E0
        ADDR    R6,     R0                      ; 6243   00F0
        ADDR    R7,     R0                      ; 6244   00F8
        ADDR    R7,     R4                      ; 6245   00FC
        ADDR    R7,     R6                      ; 6246   00FE
        DECLE   $0000                           ; 6247   0000

        ADDR    R0,     R0                      ; 6248   00C0
        ADDR    R4,     R0                      ; 6249   00E0
        ADDR    R6,     R0                      ; 624A   00F0
        ADDR    R7,     R0                      ; 624B   00F8
        ADDR    R7,     R4                      ; 624C   00FC
        ADDR    R7,     R6                      ; 624D   00FE
        ADDR    R7,     R7                      ; 624E   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 624F   0000 0000 0000 0000
        DECLE   $0000                           ; 6253   0000

        NEGR    R2                              ; 6254   0022
        DECR    R4                              ; 6255   0014
        DECR    R4                              ; 6256   0014
        MOVR    R0,     R1                      ; 6257   0081
        SWAP    R1,     1                       ; 6258   0041
        NEGR    R2                              ; 6259   0022
        NEGR    R2                              ; 625A   0022
        MOVR    R2,     R5                      ; 625B   0095
        RLC     R2,     2                       ; 625C   0056
        RLC     R2,     2                       ; 625D   0056
        DECR    R4                              ; 625E   0014
        COMR    R2                              ; 625F   001A
        RSWD    R6                              ; 6260   003E
        COMR    R0                              ; 6261   0018
        INCR    R4                              ; 6262   000C
        DECLE   $0000                           ; 6263   0000

        DECR    R2                              ; 6264   0012
        COMR    R4                              ; 6265   001C
        DECLE   $0000                           ; 6266   0000

        RSWD    R4                              ; 6267   003C
        RSWD    R4                              ; 6268   003C
        COMR    R4                              ; 6269   001C
        COMR    R0                              ; 626A   0018

        JSRD    R4,     .EXEC.81C               ; 626B   0004 001A 001C
        DECLE   $0000                           ; 626E   0000

        COMR    R2                              ; 626F   001A
        RSWD    R6                              ; 6270   003E
        COMR    R0                              ; 6271   0018
        INCR    R4                              ; 6272   000C
        DECLE   $0000                           ; 6273   0000

        DECR    R1                              ; 6274   0011
        INCR    R6                              ; 6275   000E
        DECLE   $0000                           ; 6276   0000

        RSWD    R4                              ; 6277   003C
        RSWD    R6                              ; 6278   003E
        RRC     R2,     2                       ; 6279   0076
        SLR     R1,     2                       ; 627A   0065
        DIS                                     ; 627B   0003
        SLR     R2,     2                       ; 627C   0066
        GSWD    R0                              ; 627D   0030
        DECLE   $0000                           ; 627E   0000

        COMR    R2                              ; 627F   001A
        RSWD    R6                              ; 6280   003E
        COMR    R0                              ; 6281   0018
        INCR    R4                              ; 6282   000C
        DECLE   $0001                           ; 6283   0001

        INCR    R6                              ; 6284   000E
        DECLE   $0000,  $0000                   ; 6285   0000 0000

        RSWD    R4                              ; 6287   003C
        COMR    R6                              ; 6288   001E
        INCR    R6                              ; 6289   000E
        COMR    R4                              ; 628A   001C
        ADCR    R0                              ; 628B   0028
        GSWD    R0                              ; 628C   0030
        COMR    R0                              ; 628D   0018
        DECLE   $0000                           ; 628E   0000

        COMR    R2                              ; 628F   001A
        RSWD    R6                              ; 6290   003E
        COMR    R0                              ; 6291   0018
        INCR    R4                              ; 6292   000C
        DECLE   $0000                           ; 6293   0000

        DECR    R2                              ; 6294   0012
        COMR    R4                              ; 6295   001C
        DECLE   $0000                           ; 6296   0000

        RSWD    R4                              ; 6297   003C
        COMR    R4                              ; 6298   001C
        ADDR    R3,     R4                      ; 6299   00DC
        ADDR    R1,     R4                      ; 629A   00CC
        TSTR    R0                              ; 629B   0080
        INCR    R4                              ; 629C   000C
        INCR    R6                              ; 629D   000E
        DECLE   $0000,  $0000                   ; 629E   0000 0000

        COMR    R4                              ; 62A0   001C
        RSWD    R6                              ; 62A1   003E
        SARC    R3,     2                       ; 62A2   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A3   0000 0000 0000 0000

        COMR    R0                              ; 62A7   0018
        RSWD    R4                              ; 62A8   003C
        RSWD    R4                              ; 62A9   003C
        RSWD    R4                              ; 62AA   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62AB   0000 0000 0000 0000

        SLL     R2,     2                       ; 62AF   004E
        MOVR    R1,     R0                      ; 62B0   0088
        MOVR    R3,     R4                      ; 62B1   009C
        MOVR    R7,     R4                      ; 62B2   00BC
        SARC    R0,     1                       ; 62B3   0078
        SARC    R2,     1                       ; 62B4   007A
        ADDR    R1,     R5                      ; 62B5   00CD
        MOVR    R0,     R6                      ; 62B6   0086
        ADCR    R4                              ; 62B7   002C
        SLLC    R0,     1                       ; 62B8   0058
        SLLC    R0,     2                       ; 62B9   005C
        MOVR    R7,     R4                      ; 62BA   00BC
        ADDR    R7,     R0                      ; 62BB   00F8
        SAR     R0,     1                       ; 62BC   0068
        SLL     R0,     2                       ; 62BD   004C
        SAR     R0,     2                       ; 62BE   006C
        RSWD    R0                              ; 62BF   0038
        SARC    R0,     2                       ; 62C0   007C
        ADDR    R7,     R4                      ; 62C1   00FC
        ADDR    R7,     R2                      ; 62C2   00FA
        ADDR    R6,     R2                      ; 62C3   00F2
        SLR     R2,     1                       ; 62C4   0062
        TSTR    R4                              ; 62C5   00A4
        SARC    R0,     1                       ; 62C6   0078
        ADDR    R7,     R7                      ; 62C7   00FF
        SARC    R3,     2                       ; 62C8   007F
        RSWD    R7                              ; 62C9   003F
        COMR    R7                              ; 62CA   001F
        INCR    R7                              ; 62CB   000F
        SETC                                    ; 62CC   0007
        DIS                                     ; 62CD   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D2   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 62D6   00FF
        ADDR    R7,     R7                      ; 62D7   00FF
        SARC    R3,     2                       ; 62D8   007F
        RSWD    R7                              ; 62D9   003F
        COMR    R5                              ; 62DA   001D
        DIS                                     ; 62DB   0003
        SETC                                    ; 62DC   0007
        DIS                                     ; 62DD   0003
        DECLE   $0001                           ; 62DE   0001

        ADDR    R7,     R3                      ; 62DF   00FB
        ADDR    R7,     R7                      ; 62E0   00FF
        ADDR    R7,     R7                      ; 62E1   00FF
        ADDR    R7,     R7                      ; 62E2   00FF
        ADDR    R7,     R7                      ; 62E3   00FF
        ADDR    R7,     R7                      ; 62E4   00FF
        ADDR    R6,     R7                      ; 62E5   00F7
        ADDR    R5,     R7                      ; 62E6   00EF
        ADDR    R7,     R7                      ; 62E7   00FF
        ADDR    R7,     R7                      ; 62E8   00FF
        ADDR    R7,     R7                      ; 62E9   00FF
        ADDR    R7,     R7                      ; 62EA   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62EB   0000 0000 0000 0000

        TSTR    R0                              ; 62EF   0080
        ADDR    R0,     R0                      ; 62F0   00C0
        ADDR    R6,     R0                      ; 62F1   00F0
        ADDR    R7,     R4                      ; 62F2   00FC
        ADDR    R7,     R7                      ; 62F3   00FF
        ADDR    R7,     R7                      ; 62F4   00FF
        ADDR    R7,     R7                      ; 62F5   00FF
        ADDR    R7,     R7                      ; 62F6   00FF
        ADDR    R7,     R7                      ; 62F7   00FF
        SARC    R3,     2                       ; 62F8   007F
        RSWD    R7                              ; 62F9   003F
        COMR    R7                              ; 62FA   001F
        RSWD    R7                              ; 62FB   003F
        NEGR    R7                              ; 62FC   0027
        DIS                                     ; 62FD   0003
        DECLE   $0001,  $0000,  $0000           ; 62FE   0001 0000 0000

        TSTR    R0                              ; 6301   0080
        TSTR    R0                              ; 6302   0080
        TSTR    R0                              ; 6303   0080
        TSTR    R0                              ; 6304   0080
        ADDR    R0,     R0                      ; 6305   00C0
        ADDR    R0,     R0                      ; 6306   00C0
        ADDR    R0,     R0                      ; 6307   00C0
        ADDR    R0,     R0                      ; 6308   00C0
        ADDR    R4,     R0                      ; 6309   00E0
        ADDR    R4,     R0                      ; 630A   00E0
        ADDR    R4,     R0                      ; 630B   00E0
        ADDR    R6,     R0                      ; 630C   00F0
        ADDR    R6,     R0                      ; 630D   00F0
        ADDR    R6,     R0                      ; 630E   00F0
        ADDR    R7,     R0                      ; 630F   00F8
        ADDR    R7,     R0                      ; 6310   00F8
        ADDR    R7,     R4                      ; 6311   00FC
        ADDR    R7,     R4                      ; 6312   00FC
        ADDR    R7,     R4                      ; 6313   00FC
        ADDR    R7,     R6                      ; 6314   00FE
        ADDR    R7,     R6                      ; 6315   00FE
        ADDR    R7,     R7                      ; 6316   00FF
        ADDR    R7,     R7                      ; 6317   00FF
        SARC    R3,     2                       ; 6318   007F
        SARC    R3,     2                       ; 6319   007F
        RSWD    R7                              ; 631A   003F
        RSWD    R7                              ; 631B   003F
        COMR    R7                              ; 631C   001F
        COMR    R7                              ; 631D   001F
        INCR    R7                              ; 631E   000F
        INCR    R7                              ; 631F   000F
        SETC                                    ; 6320   0007
        SETC                                    ; 6321   0007
        DIS                                     ; 6322   0003
        DIS                                     ; 6323   0003
        DECLE   $0001,  $0001,  $0000           ; 6324   0001 0001 0000

        ADDR    R6,     R7                      ; 6327   00F7
        ADDR    R6,     R5                      ; 6328   00F5
        ADDR    R3,     R5                      ; 6329   00DD
        ADDR    R2,     R7                      ; 632A   00D7
        ADDR    R6,     R5                      ; 632B   00F5
        ADDR    R3,     R5                      ; 632C   00DD
        ADDR    R3,     R5                      ; 632D   00DD
        ADDR    R3,     R7                      ; 632E   00DF
        ADDR    R7,     R7                      ; 632F   00FF
        SARC    R3,     2                       ; 6330   007F
        RSWD    R7                              ; 6331   003F
        COMR    R7                              ; 6332   001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6333   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 6337   00FF
        ADDR    R7,     R7                      ; 6338   00FF
        ADDR    R7,     R7                      ; 6339   00FF
        ADDR    R7,     R7                      ; 633A   00FF
        INCR    R7                              ; 633B   000F
        SETC                                    ; 633C   0007
        DIS                                     ; 633D   0003
        DECLE   $0001                           ; 633E   0001

        ADDR    R7,     R7                      ; 633F   00FF
        ADDR    R7,     R7                      ; 6340   00FF
        ADDR    R7,     R7                      ; 6341   00FF
        ADDR    R7,     R7                      ; 6342   00FF
        ADDR    R7,     R7                      ; 6343   00FF
        ADDR    R7,     R7                      ; 6344   00FF
        ADDR    R7,     R7                      ; 6345   00FF
        ADDR    R7,     R7                      ; 6346   00FF
        ADDR    R6,     R7                      ; 6347   00F7
        ADDR    R4,     R7                      ; 6348   00E7
        SLR     R2,     2                       ; 6349   0066
        DECLE   $0001                           ; 634A   0001

        DIS                                     ; 634B   0003
        DIS                                     ; 634C   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 634D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6351   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6355   0000 0000 0000

        TSTR    R0                              ; 6358   0080
        ADDR    R0,     R0                      ; 6359   00C0
        ADDR    R4,     R0                      ; 635A   00E0
        ADDR    R6,     R0                      ; 635B   00F0
        ADDR    R7,     R0                      ; 635C   00F8
        ADDR    R7,     R4                      ; 635D   00FC
        ADDR    R7,     R6                      ; 635E   00FE
        ADDR    R7,     R7                      ; 635F   00FF
        SARC    R3,     2                       ; 6360   007F
        RSWD    R7                              ; 6361   003F
        COMR    R7                              ; 6362   001F
        INCR    R7                              ; 6363   000F
        SETC                                    ; 6364   0007
        DIS                                     ; 6365   0003
        DECLE   $0001                           ; 6366   0001

        SLR     R0,     1                       ; 6367   0060
        SLR     R0,     1                       ; 6368   0060
        SWAP    R0,     1                       ; 6369   0040
        MOVR    R6,     R0                      ; 636A   00B0
        MOVR    R6,     R0                      ; 636B   00B0
        SLR     R0,     1                       ; 636C   0060
        DECLE   $0000,  $0000                   ; 636D   0000 0000

        COMR    R0                              ; 636F   0018
        RSWD    R4                              ; 6370   003C
        DECR    R4                              ; 6371   0014
        COMR    R4                              ; 6372   001C
        INCR    R4                              ; 6373   000C
        SLL     R2,     2                       ; 6374   004E
        SAR     R2,     2                       ; 6375   006E
        RSWD    R6                              ; 6376   003E
        RSWD    R6                              ; 6377   003E
        COMR    R4                              ; 6378   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6379   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 637D   0000 0000 0000 0000

        RSWD    R4                              ; 6381   003C
        COMR    R6                              ; 6382   001E
        SARC    R3,     2                       ; 6383   007F
        SARC    R3,     2                       ; 6384   007F
        SARC    R3,     2                       ; 6385   007F
        RSWD    R6                              ; 6386   003E
        COMR    R0                              ; 6387   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6388   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 638C   0000 0000 0000 0000
        DECLE   $0000                           ; 6390   0000

        COMR    R4                              ; 6391   001C
        ADCR    R4                              ; 6392   002C
        RSWD    R0                              ; 6393   0038
        SARC    R0,     1                       ; 6394   0078
        RRC     R2,     1                       ; 6395   0072
        RRC     R2,     2                       ; 6396   0076
        SARC    R0,     2                       ; 6397   007C
        RSWD    R0                              ; 6398   0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6399   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 639D   0000 0000 0000 0000
        DECLE   $0000                           ; 63A1   0000

        DECR    R0                              ; 63A2   0010
        RSWD    R0                              ; 63A3   0038
        SARC    R0,     2                       ; 63A4   007C
        RSWD    R4                              ; 63A5   003C
        COMR    R0                              ; 63A6   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 63AF   0000 0000 0000

        RSWD    R4                              ; 63B2   003C
        DECLE   $0000                           ; 63B3   0000

        SARC    R0,     2                       ; 63B4   007C
        DECLE   $0000                           ; 63B5   0000

        SARC    R0,     1                       ; 63B6   0078
        DECLE   $0000                           ; 63B7   0000

        SLR     R0,     1                       ; 63B8   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63B9   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 63BD   0000 0000

        NEGR    R0                              ; 63BF   0020
        ADDR    R6,     R0                      ; 63C0   00F0
        ADDR    R6,     R0                      ; 63C1   00F0
        ADDR    R6,     R0                      ; 63C2   00F0
        ADDR    R6,     R0                      ; 63C3   00F0
        ADDR    R7,     R0                      ; 63C4   00F8
        ADDR    R7,     R4                      ; 63C5   00FC
        ADDR    R7,     R6                      ; 63C6   00FE
        DECLE   $0000                           ; 63C7   0000

        TSTR    R0                              ; 63C8   0080
        ADDR    R1,     R4                      ; 63C9   00CC
        ADDR    R7,     R6                      ; 63CA   00FE
        ADDR    R7,     R6                      ; 63CB   00FE
        ADDR    R7,     R4                      ; 63CC   00FC
        ADDR    R7,     R4                      ; 63CD   00FC
        ADDR    R7,     R6                      ; 63CE   00FE
        DECLE   $0000                           ; 63CF   0000

        TSTR    R0                              ; 63D0   0080
        ADDR    R0,     R0                      ; 63D1   00C0
        ADDR    R4,     R0                      ; 63D2   00E0
        ADDR    R6,     R6                      ; 63D3   00F6
        ADDR    R7,     R7                      ; 63D4   00FF
        ADDR    R7,     R7                      ; 63D5   00FF
        ADDR    R7,     R6                      ; 63D6   00FE
        ADDR    R4,     R0                      ; 63D7   00E0
        ADDR    R4,     R0                      ; 63D8   00E0
        ADDR    R0,     R0                      ; 63D9   00C0
        ADDR    R4,     R0                      ; 63DA   00E0
        ADDR    R6,     R0                      ; 63DB   00F0
        ADDR    R7,     R4                      ; 63DC   00FC
        ADDR    R7,     R7                      ; 63DD   00FF
        ADDR    R7,     R7                      ; 63DE   00FF
        ADDR    R7,     R7                      ; 63DF   00FF
        ADDR    R7,     R7                      ; 63E0   00FF
        ADDR    R7,     R6                      ; 63E1   00FE
        ADDR    R7,     R4                      ; 63E2   00FC
        ADDR    R7,     R5                      ; 63E3   00FD
        ADDR    R7,     R4                      ; 63E4   00FC
        ADDR    R7,     R6                      ; 63E5   00FE
        ADDR    R7,     R7                      ; 63E6   00FF
        ADDR    R7,     R7                      ; 63E7   00FF
        ADDR    R7,     R7                      ; 63E8   00FF
        ADDR    R7,     R3                      ; 63E9   00FB
        ADDR    R6,     R0                      ; 63EA   00F0
        ADDR    R6,     R4                      ; 63EB   00F4
        ADDR    R6,     R2                      ; 63EC   00F2
        ADDR    R7,     R0                      ; 63ED   00F8
        ADDR    R7,     R4                      ; 63EE   00FC
        ADDR    R5,     R6                      ; 63EF   00EE
        ADDR    R0,     R7                      ; 63F0   00C7
        ADDR    R2,     R2                      ; 63F1   00D2
        ADDR    R1,     R1                      ; 63F2   00C9
        ADDR    R4,     R0                      ; 63F3   00E0
        ADDR    R6,     R0                      ; 63F4   00F0
        ADDR    R3,     R4                      ; 63F5   00DC
        ADDR    R4,     R3                      ; 63F6   00E3
        MOVR    R7,     R1                      ; 63F7   00B9
        COMR    R4                              ; 63F8   001C
        SLL     R1,     1                       ; 63F9   0049
        NEGR    R4                              ; 63FA   0024
        MOVR    R0,     R2                      ; 63FB   0082
        ADDR    R0,     R0                      ; 63FC   00C0
        RRC     R0,     1                       ; 63FD   0070
        MOVR    R1,     R6                      ; 63FE   008E
        ADDR    R1,     R7                      ; 63FF   00CF
        ADDR    R4,     R3                      ; 6400   00E3
        ADDR    R1,     R2                      ; 6401   00CA
        NEGR    R0                              ; 6402   0020
        DECR    R0                              ; 6403   0010
        TSTR    R0                              ; 6404   0080
        DECLE   $0000                           ; 6405   0000

        RSWD    R0                              ; 6406   0038
        RSWD    R6                              ; 6407   003E
        MOVR    R1,     R4                      ; 6408   008C
        NEGR    R4                              ; 6409   0024
        TSTR    R0                              ; 640A   0080
        NEGR    R0                              ; 640B   0020
        DECLE   $0000,  $0000                   ; 640C   0000 0000

        ADDR    R4,     R0                      ; 640E   00E0
        SARC    R3,     2                       ; 640F   007F
        COMR    R0                              ; 6410   0018
        RLC     R0,     1                       ; 6411   0050
        DECLE   $0000                           ; 6412   0000

        TSTR    R0                              ; 6413   0080
        DECLE   $0000,  $0000                   ; 6414   0000 0000

        TSTR    R0                              ; 6416   0080
        ADDR    R7,     R7                      ; 6417   00FF
        SLR     R1,     1                       ; 6418   0061
        SWAP    R0,     1                       ; 6419   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641A   0000 0000 0000 0000
        DECLE   $0001                           ; 641E   0001

        MOVR    R1,     R7                      ; 641F   008F
        SETC                                    ; 6420   0007
        DIS                                     ; 6421   0003
        DIS                                     ; 6422   0003
        DIS                                     ; 6423   0003
        DIS                                     ; 6424   0003
        DIS                                     ; 6425   0003
        SETC                                    ; 6426   0007
        RSWD    R7                              ; 6427   003F
        COMR    R7                              ; 6428   001F
        INCR    R7                              ; 6429   000F
        INCR    R7                              ; 642A   000F
        INCR    R7                              ; 642B   000F
        INCR    R7                              ; 642C   000F
        INCR    R7                              ; 642D   000F
        COMR    R7                              ; 642E   001F
        ADDR    R7,     R7                      ; 642F   00FF
        SARC    R3,     2                       ; 6430   007F
        RSWD    R7                              ; 6431   003F
        RSWD    R7                              ; 6432   003F
        RSWD    R7                              ; 6433   003F
        RSWD    R7                              ; 6434   003F
        RSWD    R7                              ; 6435   003F
        SARC    R3,     2                       ; 6436   007F
        SARC    R3,     2                       ; 6437   007F
        ADDR    R7,     R7                      ; 6438   00FF
        MOVR    R3,     R7                      ; 6439   009F
        COMR    R7                              ; 643A   001F
        INCR    R6                              ; 643B   000E
        INCR    R2                              ; 643C   000A
        INCR    R7                              ; 643D   000F
        DECLE   $0005                           ; 643E   0005

        RSWD    R0                              ; 643F   0038
        SARC    R0,     2                       ; 6440   007C
        RSWD    R6                              ; 6441   003E
        ADDR    R3,     R6                      ; 6442   00DE
        ADDR    R7,     R7                      ; 6443   00FF
        ADDR    R7,     R7                      ; 6444   00FF
        ADDR    R7,     R7                      ; 6445   00FF
        ADDR    R7,     R7                      ; 6446   00FF
        SARC    R3,     2                       ; 6447   007F
        RSWD    R6                              ; 6448   003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6449   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 644D   0000 0000

        JSRE    R4,     G_2000                  ; 644F   0004 0021 0000

        SLLC    R2,     1                       ; 6452   005A
        MOVR    R4,     R5                      ; 6453   00A5
        MOVR    R4,     R5                      ; 6454   00A5
        SLLC    R2,     1                       ; 6455   005A
        RSWD    R4                              ; 6456   003C
        SWAP    R2,     1                       ; 6457   0042
        INCR    R0                              ; 6458   0008
        DECLE   $0000                           ; 6459   0000

        MOVR    R4,     R5                      ; 645A   00A5
        SLLC    R2,     1                       ; 645B   005A
        SLLC    R2,     1                       ; 645C   005A
        RSWD    R6                              ; 645D   003E
        NOP                                     ; 645E   0034
        COMR    R2                              ; 645F   001A
        RSWD    R6                              ; 6460   003E
        COMR    R0                              ; 6461   0018
L_6462:
        INCR    R4                              ; 6462   000C
        DECLE   $0000                           ; 6463   0000

        DECR    R2                              ; 6464   0012
        COMR    R4                              ; 6465   001C
        DECLE   $0000                           ; 6466   0000

        ADCR    R4                              ; 6467   002C
        RSWD    R4                              ; 6468   003C
        COMR    R4                              ; 6469   001C
        COMR    R0                              ; 646A   0018

        JSRD    R4,     .EXEC.81C               ; 646B   0004 001A 001C
        DECLE   $0000                           ; 646E   0000

        COMR    R2                              ; 646F   001A
        RSWD    R6                              ; 6470   003E
        COMR    R0                              ; 6471   0018
        INCR    R4                              ; 6472   000C
        DECLE   $0000                           ; 6473   0000

        DECR    R1                              ; 6474   0011
        INCR    R6                              ; 6475   000E
        DECLE   $0000                           ; 6476   0000

        RSWD    R4                              ; 6477   003C
        RSWD    R6                              ; 6478   003E
        RRC     R2,     2                       ; 6479   0076
        SLR     R1,     2                       ; 647A   0065
        DIS                                     ; 647B   0003
        SLR     R2,     2                       ; 647C   0066
        GSWD    R0                              ; 647D   0030
        DECLE   $0000                           ; 647E   0000

        COMR    R2                              ; 647F   001A
        RSWD    R6                              ; 6480   003E
        COMR    R0                              ; 6481   0018
        INCR    R4                              ; 6482   000C
        DECLE   $0001                           ; 6483   0001

        INCR    R6                              ; 6484   000E
        DECLE   $0000,  $0000                   ; 6485   0000 0000

        RSWD    R4                              ; 6487   003C
        COMR    R6                              ; 6488   001E
        INCR    R6                              ; 6489   000E
        COMR    R4                              ; 648A   001C
        ADCR    R0                              ; 648B   0028
        GSWD    R0                              ; 648C   0030
        COMR    R0                              ; 648D   0018
        DECLE   $0000                           ; 648E   0000

        COMR    R2                              ; 648F   001A
        RSWD    R6                              ; 6490   003E
        COMR    R0                              ; 6491   0018
        INCR    R4                              ; 6492   000C
        DECLE   $0000                           ; 6493   0000

        DECR    R2                              ; 6494   0012
        COMR    R4                              ; 6495   001C
        DECLE   $0000                           ; 6496   0000

        RSWD    R4                              ; 6497   003C
        COMR    R4                              ; 6498   001C
        ADDR    R3,     R4                      ; 6499   00DC
        ADDR    R1,     R4                      ; 649A   00CC
        TSTR    R0                              ; 649B   0080
        INCR    R4                              ; 649C   000C
        INCR    R6                              ; 649D   000E
        DECLE   $0000,  $0000                   ; 649E   0000 0000

        COMR    R4                              ; 64A0   001C
        RSWD    R6                              ; 64A1   003E
        SARC    R3,     2                       ; 64A2   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64A3   0000 0000 0000 0000

        COMR    R0                              ; 64A7   0018
        RSWD    R4                              ; 64A8   003C
        RSWD    R4                              ; 64A9   003C
        RSWD    R4                              ; 64AA   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64B3   0000 0000 0000 0000

        SWAP    R0,     2                       ; 64B7   0044
        ADDR    R1,     R4                      ; 64B8   00CC
        MOVR    R5,     R2                      ; 64B9   00AA
        MOVR    R5,     R2                      ; 64BA   00AA
        ADDR    R6,     R2                      ; 64BB   00F2
        RRC     R0,     2                       ; 64BC   0074
        RSWD    R5                              ; 64BD   003D
        COMR    R6                              ; 64BE   001E
        DECLE   $0000,  $0000,  $0000           ; 64BF   0000 0000 0000

        DECR    R0                              ; 64C2   0010
        TSTR    R0                              ; 64C3   0080
        SLL     R0,     2                       ; 64C4   004C
        DECLE   $0036                           ; 64C5   0036

        ADDR    R7,     R7                      ; 64C6   00FF
        ADDR    R7,     R7                      ; 64C7   00FF
        SARC    R3,     2                       ; 64C8   007F
        RSWD    R7                              ; 64C9   003F
        COMR    R7                              ; 64CA   001F
        INCR    R7                              ; 64CB   000F
        SETC                                    ; 64CC   0007
        DIS                                     ; 64CD   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D2   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 64D6   00FF
        ADDR    R7,     R7                      ; 64D7   00FF
        SARC    R3,     2                       ; 64D8   007F
        RSWD    R7                              ; 64D9   003F
        COMR    R5                              ; 64DA   001D
        DIS                                     ; 64DB   0003
        SETC                                    ; 64DC   0007
        DIS                                     ; 64DD   0003
        DECLE   $0001                           ; 64DE   0001

        ADDR    R7,     R3                      ; 64DF   00FB
        ADDR    R7,     R7                      ; 64E0   00FF
        ADDR    R7,     R7                      ; 64E1   00FF
        ADDR    R7,     R7                      ; 64E2   00FF
        ADDR    R7,     R7                      ; 64E3   00FF
        ADDR    R7,     R7                      ; 64E4   00FF
        ADDR    R6,     R7                      ; 64E5   00F7
        ADDR    R5,     R7                      ; 64E6   00EF
        ADDR    R7,     R7                      ; 64E7   00FF
        ADDR    R7,     R7                      ; 64E8   00FF
        ADDR    R7,     R7                      ; 64E9   00FF
        ADDR    R7,     R7                      ; 64EA   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64EB   0000 0000 0000 0000

        TSTR    R0                              ; 64EF   0080
        ADDR    R0,     R0                      ; 64F0   00C0
        ADDR    R6,     R0                      ; 64F1   00F0
        ADDR    R7,     R4                      ; 64F2   00FC
        ADDR    R7,     R7                      ; 64F3   00FF
        ADDR    R7,     R7                      ; 64F4   00FF
        ADDR    R7,     R7                      ; 64F5   00FF
        ADDR    R7,     R7                      ; 64F6   00FF
        ADDR    R7,     R7                      ; 64F7   00FF
        SARC    R3,     2                       ; 64F8   007F
        RSWD    R7                              ; 64F9   003F
        COMR    R7                              ; 64FA   001F
        RSWD    R7                              ; 64FB   003F
        NEGR    R7                              ; 64FC   0027
        DIS                                     ; 64FD   0003
        DECLE   $0001                           ; 64FE   0001

        RSWD    R0                              ; 64FF   0038
        SARC    R3,     2                       ; 6500   007F
        SARC    R3,     2                       ; 6501   007F
        ADDR    R7,     R7                      ; 6502   00FF
        ADDR    R7,     R6                      ; 6503   00FE
        ADDR    R5,     R6                      ; 6504   00EE
        MOVR    R1,     R7                      ; 6505   008F
        SLR     R3,     2                       ; 6506   0067
        RSWD    R0                              ; 6507   0038
        SARC    R3,     2                       ; 6508   007F
        SARC    R3,     2                       ; 6509   007F
        ADDR    R7,     R6                      ; 650A   00FE
        ADDR    R5,     R6                      ; 650B   00EE
        ADDR    R5,     R7                      ; 650C   00EF
        MOVR    R1,     R7                      ; 650D   008F
        SLR     R3,     2                       ; 650E   0067
        SARC    R0,     1                       ; 650F   0078
        ADDR    R7,     R0                      ; 6510   00F8
        SLLC    R0,     1                       ; 6511   0058
        SLL     R0,     2                       ; 6512   004C
        SLLC    R0,     2                       ; 6513   005C
        ADDR    R5,     R4                      ; 6514   00EC
        ADDR    R5,     R0                      ; 6515   00E8
        SLR     R0,     1                       ; 6516   0060
        SARC    R0,     1                       ; 6517   0078
        ADDR    R7,     R0                      ; 6518   00F8
        ADDR    R3,     R0                      ; 6519   00D8
        ADDR    R1,     R4                      ; 651A   00CC
        ADDR    R3,     R4                      ; 651B   00DC
        ADDR    R7,     R4                      ; 651C   00FC
        ADDR    R5,     R0                      ; 651D   00E8
        SLR     R0,     1                       ; 651E   0060
        SETC                                    ; 651F   0007
        INCR    R7                              ; 6520   000F
        RSWD    R5                              ; 6521   003D
        SLL     R2,     2                       ; 6522   004E
        SLLC    R3,     2                       ; 6523   005F
        RSWD    R6                              ; 6524   003E
        INCR    R6                              ; 6525   000E
        DIS                                     ; 6526   0003
        DECLE   $0000                           ; 6527   0000

        SETC                                    ; 6528   0007
        COMR    R7                              ; 6529   001F
        ADCR    R5                              ; 652A   002D
        ADCR    R6                              ; 652B   002E
        COMR    R7                              ; 652C   001F
        INCR    R6                              ; 652D   000E
        SETC                                    ; 652E   0007
        TSTR    R0                              ; 652F   0080
        ADDR    R0,     R0                      ; 6530   00C0
        SLR     R0,     1                       ; 6531   0060
        ADDR    R4,     R0                      ; 6532   00E0
        ADDR    R0,     R0                      ; 6533   00C0
        ADDR    R0,     R0                      ; 6534   00C0
        TSTR    R0                              ; 6535   0080
        MOVR    R6,     R0                      ; 6536   00B0
        DECLE   $0000                           ; 6537   0000

        TSTR    R0                              ; 6538   0080
        ADDR    R0,     R0                      ; 6539   00C0
        SLR     R0,     1                       ; 653A   0060
        ADDR    R4,     R0                      ; 653B   00E0
        ADDR    R0,     R0                      ; 653C   00C0
        ADDR    R0,     R0                      ; 653D   00C0
        MOVR    R6,     R0                      ; 653E   00B0
        ADDR    R7,     R4                      ; 653F   00FC
        ADDR    R6,     R0                      ; 6540   00F0
        ADDR    R4,     R0                      ; 6541   00E0
        ADDR    R0,     R0                      ; 6542   00C0
        TSTR    R0                              ; 6543   0080
        TSTR    R0                              ; 6544   0080
        DECLE   $0000,  $0000                   ; 6545   0000 0000

        SARC    R3,     2                       ; 6547   007F
        RSWD    R7                              ; 6548   003F
        COMR    R7                              ; 6549   001F
        INCR    R7                              ; 654A   000F
        SETC                                    ; 654B   0007
        DIS                                     ; 654C   0003
        DECLE   $0001,  $0000                   ; 654D   0001 0000

        TSTR    R0                              ; 654F   0080
        ADDR    R0,     R0                      ; 6550   00C0
        ADDR    R4,     R0                      ; 6551   00E0
        ADDR    R6,     R0                      ; 6552   00F0
        ADDR    R7,     R0                      ; 6553   00F8
        ADDR    R7,     R4                      ; 6554   00FC
        ADDR    R7,     R6                      ; 6555   00FE
        ADDR    R7,     R7                      ; 6556   00FF
        DIS                                     ; 6557   0003
        INCR    R7                              ; 6558   000F
        COMR    R7                              ; 6559   001F
        RSWD    R7                              ; 655A   003F
        SARC    R3,     2                       ; 655B   007F
        SARC    R3,     2                       ; 655C   007F
        ADDR    R7,     R7                      ; 655D   00FF
        ADDR    R7,     R7                      ; 655E   00FF
        ADDR    R7,     R6                      ; 655F   00FE
        ADDR    R7,     R6                      ; 6560   00FE
        ADDR    R7,     R4                      ; 6561   00FC
        ADDR    R7,     R4                      ; 6562   00FC
        ADDR    R7,     R0                      ; 6563   00F8
        ADDR    R7,     R0                      ; 6564   00F8
        ADDR    R7,     R0                      ; 6565   00F8
        ADDR    R7,     R0                      ; 6566   00F8
        ADDR    R6,     R0                      ; 6567   00F0
        ADDR    R6,     R0                      ; 6568   00F0
        ADDR    R6,     R0                      ; 6569   00F0
        ADDR    R6,     R0                      ; 656A   00F0
        ADDR    R6,     R0                      ; 656B   00F0
        ADDR    R6,     R0                      ; 656C   00F0
        ADDR    R6,     R0                      ; 656D   00F0
        ADDR    R6,     R0                      ; 656E   00F0
        DECLE   $0000                           ; 656F   0000

        TSTR    R0                              ; 6570   0080
        ADDR    R0,     R0                      ; 6571   00C0
        ADDR    R0,     R0                      ; 6572   00C0
        ADDR    R4,     R0                      ; 6573   00E0
        ADDR    R4,     R0                      ; 6574   00E0
        ADDR    R6,     R0                      ; 6575   00F0
        ADDR    R6,     R0                      ; 6576   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6577   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 657B   0000 0000 0000 0000

        INCR    R4                              ; 657F   000C
        COMR    R6                              ; 6580   001E
        RSWD    R6                              ; 6581   003E
        RSWD    R6                              ; 6582   003E
        SARC    R3,     2                       ; 6583   007F
        SARC    R0,     1                       ; 6584   0078
        RRC     R0,     2                       ; 6585   0074
        GSWD    R1                              ; 6586   0031
        DECLE   $0036                           ; 6587   0036

        RSWD    R7                              ; 6588   003F
        COMR    R3                              ; 6589   001B
        ADCR    R4                              ; 658A   002C
        DECLE   $0036                           ; 658B   0036

        SARC    R0,     1                       ; 658C   0078
        SARC    R0,     1                       ; 658D   0078
        SARC    R0,     2                       ; 658E   007C
        ADDR    R7,     R7                      ; 658F   00FF
        ADDR    R5,     R6                      ; 6590   00EE
        ADDR    R6,     R7                      ; 6591   00F7
        ADDR    R7,     R3                      ; 6592   00FB
        SARC    R0,     1                       ; 6593   0078
        RSWD    R0                              ; 6594   0038
        GSWD    R3                              ; 6595   0033
        RRC     R3,     2                       ; 6596   0077
        DECLE   $0036                           ; 6597   0036

        ADDR    R0,     R0                      ; 6598   00C0
        ADDR    R4,     R0                      ; 6599   00E0
        RRC     R0,     1                       ; 659A   0070
        GSWD    R0                              ; 659B   0030
        DECLE   $0000,  $0000,  $0000           ; 659C   0000 0000 0000

        COMR    R4                              ; 659F   001C
        COMR    R6                              ; 65A0   001E
        RSWD    R6                              ; 65A1   003E
        RSWD    R7                              ; 65A2   003F
        RSWD    R0                              ; 65A3   0038
        RRC     R0,     2                       ; 65A4   0074
        RRC     R1,     1                       ; 65A5   0071
        RRC     R2,     2                       ; 65A6   0076
        RSWD    R7                              ; 65A7   003F
        RSWD    R3                              ; 65A8   003B
        RSWD    R0                              ; 65A9   0038
        COMR    R4                              ; 65AA   001C
        NEGR    R6                              ; 65AB   0026
        SARC    R0,     1                       ; 65AC   0078
        SARC    R0,     2                       ; 65AD   007C
        SARC    R0,     2                       ; 65AE   007C
        SARC    R3,     2                       ; 65AF   007F
        ADDR    R6,     R6                      ; 65B0   00F6
        ADDR    R7,     R3                      ; 65B1   00FB
        ADDR    R7,     R3                      ; 65B2   00FB
        SARC    R0,     1                       ; 65B3   0078
        RSWD    R4                              ; 65B4   003C
        RSWD    R4                              ; 65B5   003C
        ADDR    R3,     R4                      ; 65B6   00DC
        ADDR    R5,     R4                      ; 65B7   00EC
        SAR     R0,     1                       ; 65B8   0068
        DIS                                     ; 65B9   0003
        SETC                                    ; 65BA   0007
        INCR    R6                              ; 65BB   000E
        INCR    R4                              ; 65BC   000C
        DECLE   $0000,  $0000                   ; 65BD   0000 0000

        INCR    R0                              ; 65BF   0008
        COMR    R0                              ; 65C0   0018
        GSWD    R0                              ; 65C1   0030
        SLR     R0,     1                       ; 65C2   0060
        ADDR    R0,     R0                      ; 65C3   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C4   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 65C8   0000 0000

        ADDR    R4,     R0                      ; 65CA   00E0
        SWAP    R0,     1                       ; 65CB   0040
        COMR    R0                              ; 65CC   0018
        INCR    R4                              ; 65CD   000C
        CLRC                                    ; 65CE   0006
        DECLE   $0000,  $0000                   ; 65CF   0000 0000

        DECR    R0                              ; 65D1   0010
        DECLE   $0000                           ; 65D2   0000

        JSR     R4,     G_2000                  ; 65D3   0004 0020 0000

        COMR    R0                              ; 65D6   0018
        COMR    R0                              ; 65D7   0018
        COMR    R0                              ; 65D8   0018
        RSWD    R4                              ; 65D9   003C
        SLR     R2,     2                       ; 65DA   0066
        ADDR    R0,     R3                      ; 65DB   00C3
        ADDR    R0,     R3                      ; 65DC   00C3
        SLR     R2,     2                       ; 65DD   0066
        RSWD    R4                              ; 65DE   003C
        NEGR    R0                              ; 65DF   0020

        JSR     R4,     .STIC.A.0               ; 65E0   0004 0000 0010
        DECLE   $0000,  $0000                   ; 65E3   0000 0000

        NEGR    R0                              ; 65E5   0020
        DECLE   $0000                           ; 65E6   0000

        COMR    R0                              ; 65E7   0018
        COMR    R0                              ; 65E8   0018
        NEGR    R4                              ; 65E9   0024
        SLR     R2,     2                       ; 65EA   0066
        ADDR    R0,     R3                      ; 65EB   00C3
        MOVR    R2,     R1                      ; 65EC   0091
        SLR     R2,     1                       ; 65ED   0062
        RSWD    R4                              ; 65EE   003C
        DECLE   $0000,  $0000,  $0000           ; 65EF   0000 0000 0000

        SWAP    R0,     1                       ; 65F2   0040
        DECLE   $0000,  $0000                   ; 65F3   0000 0000

        EIS                                     ; 65F5   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F6   0000 0000 0000 0000

        COMR    R0                              ; 65FA   0018
        RSWD    R4                              ; 65FB   003C
        RSWD    R4                              ; 65FC   003C
        COMR    R0                              ; 65FD   0018
        DECLE   $0000,  $0000                   ; 65FE   0000 0000

        SWAP    R0,     1                       ; 6600   0040
        DECLE   $0000,  $0000                   ; 6601   0000 0000

        EIS                                     ; 6603   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6604   0000 0000 0000 0000
        DECLE   $0000                           ; 6608   0000

        COMR    R0                              ; 6609   0018
        COMR    R0                              ; 660A   0018
        RSWD    R4                              ; 660B   003C
        SAR     R2,     2                       ; 660C   006E
        COMR    R4                              ; 660D   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660E   0000 0000 0000 0000
        DECLE   $0000                           ; 6612   0000

        INCR    R0                              ; 6613   0008
        ADCR    R4                              ; 6614   002C
        ADCR    R2                              ; 6615   002A
        ADDR    R5,     R3                      ; 6616   00EB
        ADDR    R7,     R3                      ; 6617   00FB
        ADDR    R7,     R7                      ; 6618   00FF
        ADDR    R7,     R7                      ; 6619   00FF
        SARC    R2,     2                       ; 661A   007E
        COMR    R4                              ; 661B   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6620   0000 0000 0000

        INCR    R0                              ; 6623   0008
        RSWD    R6                              ; 6624   003E
        SARC    R3,     2                       ; 6625   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6626   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662A   0000 0000 0000 0000
        DECLE   $0000                           ; 662E   0000

        ADDR    R7,     R6                      ; 662F   00FE
        ADDR    R7,     R4                      ; 6630   00FC
        ADDR    R7,     R4                      ; 6631   00FC
        ADDR    R7,     R0                      ; 6632   00F8
        ADDR    R7,     R0                      ; 6633   00F8
        ADDR    R4,     R0                      ; 6634   00E0
        TSTR    R0                              ; 6635   0080
        DECLE   $0000,  $0001                   ; 6636   0000 0001

        DIS                                     ; 6638   0003
        DIS                                     ; 6639   0003
        SETC                                    ; 663A   0007
        SETC                                    ; 663B   0007
        COMR    R7                              ; 663C   001F
        SARC    R3,     2                       ; 663D   007F
        ADDR    R7,     R7                      ; 663E   00FF
        SWAP    R0,     1                       ; 663F   0040
        ADDR    R0,     R0                      ; 6640   00C0
        MOVR    R2,     R4                      ; 6641   0094
        MOVR    R7,     R6                      ; 6642   00BE
        MOVR    R3,     R0                      ; 6643   0098
        SLL     R0,     2                       ; 6644   004C
        DECLE   $0000                           ; 6645   0000

        DIS                                     ; 6646   0003
        DECLE   $0001                           ; 6647   0001

        SARC    R0,     2                       ; 6648   007C
        RRC     R2,     2                       ; 6649   0076
        ADDR    R4,     R0                      ; 664A   00E0
        DIS                                     ; 664B   0003
        ADDR    R0,     R0                      ; 664C   00C0
        ADDR    R0,     R0                      ; 664D   00C0
        SLR     R0,     1                       ; 664E   0060
        DECLE   $0000                           ; 664F   0000

        COMR    R4                              ; 6650   001C
        RSWD    R6                              ; 6651   003E
        RSWD    R7                              ; 6652   003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6653   0000 0000 0000 0000

        RSWD    R6                              ; 6657   003E
        SARC    R0,     1                       ; 6658   0078
        SARC    R0,     1                       ; 6659   0078
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665A   0000 0000 0000 0000
        DECLE   $0000                           ; 665E   0000

        JSR     R4,     .ECSRAM.018             ; 665F   0004 0040 0018

        COMR    R0                              ; 6662   0018
        RSWD    R4                              ; 6663   003C
        SARC    R2,     2                       ; 6664   007E
        SARC    R2,     2                       ; 6665   007E
        RSWD    R4                              ; 6666   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6667   0000 0000 0000 0000
        DECLE   $0000                           ; 666B   0000

        ADDR    R6,     R0                      ; 666C   00F0
        ADDR    R7,     R7                      ; 666D   00FF
        INCR    R7                              ; 666E   000F
        ADDR    R6,     R0                      ; 666F   00F0
        NEGR    R0                              ; 6670   0020
        SWAP    R0,     1                       ; 6671   0040
        ADDR    R6,     R0                      ; 6672   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6673   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6677   0000 0000 0000

        SETC                                    ; 667A   0007
        DECLE   $0001                           ; 667B   0001

        EIS                                     ; 667C   0002
        SETC                                    ; 667D   0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667E   0000 0000 0000 0000

        TSTR    R0                              ; 6682   0080
        DECLE   $0000,  $0000                   ; 6683   0000 0000

        TSTR    R0                              ; 6685   0080
        DECLE   $0000                           ; 6686   0000

        INCR    R0                              ; 6687   0008
        DECR    R0                              ; 6688   0010
        RSWD    R6                              ; 6689   003E
        TSTR    R0                              ; 668A   0080
        DECLE   $0000,  $0000                   ; 668B   0000 0000

        TSTR    R0                              ; 668D   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6692   0000 0000 0000

        RSWD    R6                              ; 6695   003E

        JSR     R4,     .STIC.X.0               ; 6696   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6699   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669D   0000 0000 0000 0000
        DECLE   $0000                           ; 66A1   0000

        INCR    R0                              ; 66A2   0008
        INCR    R4                              ; 66A3   000C
        ADCR    R6                              ; 66A4   002E
        RSWD    R7                              ; 66A5   003F
        ADDR    R7,     R3                      ; 66A6   00FB
        ADDR    R7,     R7                      ; 66A7   00FF
        ADDR    R7,     R7                      ; 66A8   00FF
        SARC    R2,     2                       ; 66A9   007E
        RSWD    R4                              ; 66AA   003C
        COMR    R0                              ; 66AB   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B4   0000 0000 0000 0000
        DECLE   $0000                           ; 66B8   0000

        TSTR    R0                              ; 66B9   0080
        MOVR    R5,     R0                      ; 66BA   00A8
        ADCR    R2                              ; 66BB   002A
        SUBR    R0,     R0                      ; 66BC   0100
        ADDR    R1,     R0                      ; 66BD   00C8
        SLR     R2,     2                       ; 66BE   0066
        DECLE   $0000,  $0000,  $0000           ; 66BF   0000 0000 0000

        SUBR    R0,     R0                      ; 66C2   0100
        ADDR    R1,     R0                      ; 66C3   00C8
        SLR     R2,     2                       ; 66C4   0066
        SWAP    R0,     1                       ; 66C5   0040
        MOVR    R6,     R5                      ; 66C6   00B5
        SLR     R2,     2                       ; 66C7   0066
        DECLE   $0000,  $0000,  $0000           ; 66C8   0000 0000 0000

        ADDR    R0,     R1                      ; 66CB   00C1
        SETC                                    ; 66CC   0007
        SETC                                    ; 66CD   0007
        SETC                                    ; 66CE   0007
        SETC                                    ; 66CF   0007
        ADDR    R0,     R1                      ; 66D0   00C1
        SETC                                    ; 66D1   0007
        SETC                                    ; 66D2   0007
        SETC                                    ; 66D3   0007
        SETC                                    ; 66D4   0007
        SETC                                    ; 66D5   0007
        ADDR    R0,     R1                      ; 66D6   00C1
        SETC                                    ; 66D7   0007
        SETC                                    ; 66D8   0007
        SETC                                    ; 66D9   0007
        SETC                                    ; 66DA   0007
        SETC                                    ; 66DB   0007
        SETC                                    ; 66DC   0007
        SETC                                    ; 66DD   0007
        SUBR    R0,     R0                      ; 66DE   0100
        INCR    R4                              ; 66DF   000C
        SLR     R3,     2                       ; 66E0   0067
        SETC                                    ; 66E1   0007
        SETC                                    ; 66E2   0007
        SETC                                    ; 66E3   0007
        SETC                                    ; 66E4   0007
        SETC                                    ; 66E5   0007
        SETC                                    ; 66E6   0007
        ADDR    R0,     R0                      ; 66E7   00C0
        COMR    R3                              ; 66E8   001B
        COMR    R3                              ; 66E9   001B
        COMR    R3                              ; 66EA   001B
        COMR    R3                              ; 66EB   001B
        DIS                                     ; 66EC   0003
        DIS                                     ; 66ED   0003
        SUBR    R0,     R0                      ; 66EE   0100
        ADCR    R0                              ; 66EF   0028
        SLR     R3,     2                       ; 66F0   0067
        DIS                                     ; 66F1   0003
        ADDR    R0,     R0                      ; 66F2   00C0
        DIS                                     ; 66F3   0003
        DIS                                     ; 66F4   0003
        DIS                                     ; 66F5   0003
        DIS                                     ; 66F6   0003
        DIS                                     ; 66F7   0003
        DIS                                     ; 66F8   0003
        DIS                                     ; 66F9   0003
        DIS                                     ; 66FA   0003
        DIS                                     ; 66FB   0003
        DIS                                     ; 66FC   0003
        SUBR    R0,     R0                      ; 66FD   0100
        SLLC    R2,     2                       ; 66FE   005E
        SLR     R3,     2                       ; 66FF   0067
        DIS                                     ; 6700   0003
        DIS                                     ; 6701   0003
        DIS                                     ; 6702   0003
        DIS                                     ; 6703   0003
        DIS                                     ; 6704   0003
        DIS                                     ; 6705   0003
        DIS                                     ; 6706   0003
        DIS                                     ; 6707   0003
        DIS                                     ; 6708   0003
        SWAP    R0,     1                       ; 6709   0040
        MOVR    R7,     R1                      ; 670A   00B9
        SLR     R2,     2                       ; 670B   0066
        ADDR    R0,     R0                      ; 670C   00C0
        COMR    R3                              ; 670D   001B
        SUBR    R0,     R0                      ; 670E   0100
        GSWD    R0                              ; 670F   0030
        SLR     R3,     2                       ; 6710   0067
        COMR    R3                              ; 6711   001B
        SUBR    R0,     R0                      ; 6712   0100
        RSWD    R5                              ; 6713   003D
        SLR     R3,     2                       ; 6714   0067
        ADDR    R0,     R1                      ; 6715   00C1
        SETC                                    ; 6716   0007
        SETC                                    ; 6717   0007
        SETC                                    ; 6718   0007
        SUBR    R0,     R0                      ; 6719   0100
        NEGR    R2                              ; 671A   0022
        SLR     R3,     2                       ; 671B   0067
        ADDR    R0,     R1                      ; 671C   00C1
        RSWD    R7                              ; 671D   003F
        RSWD    R7                              ; 671E   003F
        SWAP    R0,     1                       ; 671F   0040
        ADDR    R4,     R4                      ; 6720   00E4
        SLR     R2,     2                       ; 6721   0066
        ADDR    R0,     R0                      ; 6722   00C0
        COMR    R3                              ; 6723   001B
        COMR    R3                              ; 6724   001B
        SWAP    R0,     1                       ; 6725   0040
        ADDR    R6,     R2                      ; 6726   00F2
        SLR     R2,     2                       ; 6727   0066
        ADDR    R0,     R1                      ; 6728   00C1
        RSWD    R7                              ; 6729   003F
        RSWD    R7                              ; 672A   003F
        ADDR    R0,     R0                      ; 672B   00C0
        DIS                                     ; 672C   0003
        SWAP    R0,     1                       ; 672D   0040
        COMR    R1                              ; 672E   0019
        SLR     R3,     2                       ; 672F   0067
        ADDR    R0,     R0                      ; 6730   00C0
        DIS                                     ; 6731   0003
        DIS                                     ; 6732   0003
        DIS                                     ; 6733   0003
        DIS                                     ; 6734   0003
        DIS                                     ; 6735   0003
        DIS                                     ; 6736   0003
        DIS                                     ; 6737   0003
        ADDR    R0,     R1                      ; 6738   00C1
        RSWD    R7                              ; 6739   003F
        SWAP    R0,     1                       ; 673A   0040
        ADDR    R2,     R6                      ; 673B   00D6
        SLR     R2,     2                       ; 673C   0066
        ADDR    R0,     R0                      ; 673D   00C0
        DIS                                     ; 673E   0003
        DIS                                     ; 673F   0003
        DIS                                     ; 6740   0003
        DIS                                     ; 6741   0003
        DIS                                     ; 6742   0003
        DIS                                     ; 6743   0003
        DIS                                     ; 6744   0003
        SUBR    R0,     R0                      ; 6745   0100
        SLL     R2,     2                       ; 6746   004E
        SLR     R3,     2                       ; 6747   0067
        ADDR    R0,     R1                      ; 6748   00C1
        RSWD    R7                              ; 6749   003F
        RSWD    R7                              ; 674A   003F
        SWAP    R0,     1                       ; 674B   0040
        ADDR    R2,     R6                      ; 674C   00D6
        SLR     R2,     2                       ; 674D   0066
        ADDR    R0,     R0                      ; 674E   00C0
        DIS                                     ; 674F   0003
        DIS                                     ; 6750   0003
        DIS                                     ; 6751   0003
        DIS                                     ; 6752   0003
        DIS                                     ; 6753   0003
        SUBR    R0,     R0                      ; 6754   0100
        SLR     R0,     2                       ; 6755   0064
        SLR     R3,     2                       ; 6756   0067
        DIS                                     ; 6757   0003
        DIS                                     ; 6758   0003
        DIS                                     ; 6759   0003
        DIS                                     ; 675A   0003
        SWAP    R0,     1                       ; 675B   0040
        MOVR    R7,     R1                      ; 675C   00B9
        SLR     R2,     2                       ; 675D   0066
        ADDR    R0,     R1                      ; 675E   00C1
        RSWD    R7                              ; 675F   003F
        RSWD    R7                              ; 6760   003F
        SWAP    R0,     1                       ; 6761   0040
        SWAP    R1,     2                       ; 6762   0045
        SLR     R3,     2                       ; 6763   0067
        ADDR    R0,     R1                      ; 6764   00C1
        RSWD    R7                              ; 6765   003F
        RSWD    R7                              ; 6766   003F
        SWAP    R0,     1                       ; 6767   0040
        ADDR    R2,     R0                      ; 6768   00D0
        SLR     R2,     2                       ; 6769   0066
        RSWD    R1                              ; 676A   0039
        GSWD    R1                              ; 676B   0031
        ADCR    R0                              ; 676C   0028
        DECR    R0                              ; 676D   0010
        COMR    R1                              ; 676E   0019
        COMR    R1                              ; 676F   0019
        COMR    R1                              ; 6770   0019
        CLRR    R0                              ; 6771   01C0
        RSWD    R1                              ; 6772   0039
        GSWD    R1                              ; 6773   0031
        ADCR    R0                              ; 6774   0028
        DECR    R0                              ; 6775   0010
        COMR    R1                              ; 6776   0019
        COMR    R1                              ; 6777   0019
        COMR    R1                              ; 6778   0019
        CLRR    R0                              ; 6779   01C0
        RSWD    R1                              ; 677A   0039
        DECR    R1                              ; 677B   0011
        ADCR    R0                              ; 677C   0028
        DECR    R0                              ; 677D   0010
        COMR    R0                              ; 677E   0018
        COMR    R1                              ; 677F   0019
        COMR    R1                              ; 6780   0019
        COMR    R0                              ; 6781   0018
        DECR    R0                              ; 6782   0010
        CLRR    R0                              ; 6783   01C0
        RSWD    R1                              ; 6784   0039
        DECR    R1                              ; 6785   0011
        ADCR    R0                              ; 6786   0028
        DECR    R0                              ; 6787   0010
        COMR    R0                              ; 6788   0018
        COMR    R1                              ; 6789   0019
        COMR    R1                              ; 678A   0019
        COMR    R0                              ; 678B   0018
        DECR    R0                              ; 678C   0010
        CLRR    R0                              ; 678D   01C0
        RSWD    R1                              ; 678E   0039
        DECR    R1                              ; 678F   0011
        ADCR    R0                              ; 6790   0028
        DECR    R0                              ; 6791   0010
        COMR    R0                              ; 6792   0018
        COMR    R1                              ; 6793   0019
        COMR    R1                              ; 6794   0019
        COMR    R0                              ; 6795   0018
        DECR    R0                              ; 6796   0010
        CLRR    R0                              ; 6797   01C0
        RSWD    R1                              ; 6798   0039
        DECR    R1                              ; 6799   0011
        ADCR    R0                              ; 679A   0028
        DECR    R0                              ; 679B   0010
        COMR    R0                              ; 679C   0018
        COMR    R1                              ; 679D   0019
        COMR    R1                              ; 679E   0019
        CLRR    R0                              ; 679F   01C0
        SWAP    R0,     1                       ; 67A0   0040
        RRC     R3,     1                       ; 67A1   0073
        SAR     R0,     1                       ; 67A2   0068
        DECLE   $0035                           ; 67A3   0035

        ADCR    R6                              ; 67A4   002E
        INCR    R7                              ; 67A5   000F
        COMR    R7                              ; 67A6   001F
        COMR    R7                              ; 67A7   001F
        COMR    R7                              ; 67A8   001F
        COMR    R7                              ; 67A9   001F
        COMR    R7                              ; 67AA   001F
        COMR    R7                              ; 67AB   001F
        COMR    R7                              ; 67AC   001F
        CLRR    R0                              ; 67AD   01C0
        ADCR    R6                              ; 67AE   002E
        ADCR    R6                              ; 67AF   002E
        INCR    R6                              ; 67B0   000E
        DECR    R6                              ; 67B1   0016
        DECR    R6                              ; 67B2   0016
        COMR    R7                              ; 67B3   001F
        COMR    R7                              ; 67B4   001F
        CLRR    R0                              ; 67B5   01C0
        ADCR    R6                              ; 67B6   002E
        ADCR    R6                              ; 67B7   002E
        INCR    R6                              ; 67B8   000E
        DECR    R6                              ; 67B9   0016
        DECR    R6                              ; 67BA   0016
        COMR    R7                              ; 67BB   001F
        COMR    R7                              ; 67BC   001F
        CLRR    R0                              ; 67BD   01C0
        ADCR    R6                              ; 67BE   002E
        ADCR    R6                              ; 67BF   002E
        INCR    R6                              ; 67C0   000E
        DECR    R6                              ; 67C1   0016
        DECR    R6                              ; 67C2   0016
        COMR    R7                              ; 67C3   001F
        COMR    R7                              ; 67C4   001F
        CLRR    R0                              ; 67C5   01C0
        DECLE   $0036                           ; 67C6   0036

        ADCR    R5                              ; 67C7   002D
        INCR    R6                              ; 67C8   000E
        DECR    R5                              ; 67C9   0015
        DECR    R0                              ; 67CA   0010
        COMR    R0                              ; 67CB   0018
        COMR    R7                              ; 67CC   001F
        COMR    R0                              ; 67CD   0018
        COMR    R0                              ; 67CE   0018
        COMR    R0                              ; 67CF   0018
        COMR    R0                              ; 67D0   0018
        COMR    R0                              ; 67D1   0018
        COMR    R0                              ; 67D2   0018
        COMR    R0                              ; 67D3   0018
        COMR    R0                              ; 67D4   0018
        SWAP    R0,     1                       ; 67D5   0040
        RRC     R3,     1                       ; 67D6   0073
        SAR     R0,     1                       ; 67D7   0068
        INCR    R5                              ; 67D8   000D
        INCR    R5                              ; 67D9   000D
        DECR    R5                              ; 67DA   0015
        DECR    R5                              ; 67DB   0015
        COMR    R5                              ; 67DC   001D
        COMR    R5                              ; 67DD   001D
        COMR    R5                              ; 67DE   001D
        COMR    R0                              ; 67DF   0018
        CMPR    R3,     R0                      ; 67E0   0158
        SLLC    R3,     1                       ; 67E1   005B
        ANDR    R4,     R2                      ; 67E2   01A2
        SETC                                    ; 67E3   0007
        DECLE   $0000,  $0000                   ; 67E4   0000 0000

        ANDR    R4,     R3                      ; 67E6   01A3
        SETC                                    ; 67E7   0007
        CMPR    R3,     R1                      ; 67E8   0159
        SLLC    R3,     1                       ; 67E9   005B
        DECLE   $0000,  $0000,  $0000           ; 67EA   0000 0000 0000

        TSTR    R0                              ; 67ED   0080
        DECLE   $0000,  $0000                   ; 67EE   0000 0000

        ANDR    R6,     R0                      ; 67F0   01B0
        DECLE   $0000                           ; 67F1   0000

        CMPR    R0,     R2                      ; 67F2   0142
        SLLC    R3,     1                       ; 67F3   005B
        SWAP    R0,     1                       ; 67F4   0040
        RRC     R3,     1                       ; 67F5   0073
        SAR     R0,     1                       ; 67F6   0068
        TSTR    R0                              ; 67F7   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FC   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6800   0000 0000

        TSTR    R0                              ; 6802   0080
        SARC    R2,     2                       ; 6803   007E
        INCR    R4                              ; 6804   000C
        ADCR    R5                              ; 6805   002D
        DECLE   $0005                           ; 6806   0005

        INCR    R5                              ; 6807   000D
        INCR    R6                              ; 6808   000E
        INCR    R5                              ; 6809   000D
        CLRR    R0                              ; 680A   01C0
        DECLE   $0036                           ; 680B   0036

        ADCR    R6                              ; 680C   002E
        ADCR    R6                              ; 680D   002E
        INCR    R6                              ; 680E   000E
        DECR    R6                              ; 680F   0016
        DECR    R6                              ; 6810   0016
        COMR    R7                              ; 6811   001F
        COMR    R7                              ; 6812   001F
        CLRR    R0                              ; 6813   01C0
        SUBR    R0,     R0                      ; 6814   0100
        ADDR    R3,     R0                      ; 6815   00D8
        SLR     R3,     2                       ; 6816   0067
        ADCR    R6                              ; 6817   002E
        ADCR    R6                              ; 6818   002E
        INCR    R6                              ; 6819   000E
        DECR    R6                              ; 681A   0016
        DECR    R6                              ; 681B   0016
        COMR    R7                              ; 681C   001F
        COMR    R7                              ; 681D   001F
        CLRR    R0                              ; 681E   01C0
        SUBR    R0,     R0                      ; 681F   0100
        MOVR    R4,     R3                      ; 6820   00A3
        SLR     R3,     2                       ; 6821   0067
        DECLE   $0036                           ; 6822   0036

        ADCR    R5                              ; 6823   002D
        INCR    R6                              ; 6824   000E
        DECR    R5                              ; 6825   0015
        DECR    R0                              ; 6826   0010
        COMR    R0                              ; 6827   0018
        COMR    R7                              ; 6828   001F
        COMR    R0                              ; 6829   0018
        COMR    R0                              ; 682A   0018
        COMR    R0                              ; 682B   0018
        COMR    R0                              ; 682C   0018
        COMR    R0                              ; 682D   0018
        COMR    R0                              ; 682E   0018
        COMR    R0                              ; 682F   0018
        COMR    R0                              ; 6830   0018
        SUBR    R0,     R0                      ; 6831   0100
        SAR     R2,     1                       ; 6832   006A
        SLR     R3,     2                       ; 6833   0067
        CLRR    R0                              ; 6834   01C0
        DECLE   $0036                           ; 6835   0036

        ADCR    R5                              ; 6836   002D
        INCR    R6                              ; 6837   000E
        DECR    R6                              ; 6838   0016
        COMR    R6                              ; 6839   001E
        COMR    R6                              ; 683A   001E
        COMR    R5                              ; 683B   001D
        COMR    R5                              ; 683C   001D
        COMR    R5                              ; 683D   001D
        COMR    R0                              ; 683E   0018
        CMPR    R3,     R0                      ; 683F   0158
        MOVR    R7,     R3                      ; 6840   00BB
        ANDR    R4,     R2                      ; 6841   01A2
        SETC                                    ; 6842   0007
        DECLE   $0000,  $0000                   ; 6843   0000 0000

        CMPR    R3,     R1                      ; 6845   0159
        MOVR    R7,     R3                      ; 6846   00BB
        ANDR    R4,     R3                      ; 6847   01A3
        SETC                                    ; 6848   0007
        DECLE   $0000,  $0000,  $0000           ; 6849   0000 0000 0000

        CMPR    R0,     R2                      ; 684C   0142
        MOVR    R7,     R3                      ; 684D   00BB
        ANDR    R6,     R0                      ; 684E   01B0
        DECLE   $0000                           ; 684F   0000

        TSTR    R0                              ; 6850   0080
        DECLE   $0000,  $0000                   ; 6851   0000 0000

        SWAP    R0,     1                       ; 6853   0040
        RRC     R3,     1                       ; 6854   0073
        SAR     R0,     1                       ; 6855   0068
        TSTR    R0                              ; 6856   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6857   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 685B   0000 0000 0000

        SWAP    R0,     1                       ; 685E   0040
        ADDR    R6,     R7                      ; 685F   00F7
        SLR     R3,     2                       ; 6860   0067
        TSTR    R0                              ; 6861   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6862   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6866   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 686E   0000 0000

        SWAP    R0,     1                       ; 6870   0040
        ADDR    R6,     R7                      ; 6871   00F7
        SLR     R3,     2                       ; 6872   0067
        SUBR    R0,     R1                      ; 6873   0101
        ADDR    R6,     R7                      ; 6874   00F7
        SLR     R3,     2                       ; 6875   0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6876   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6882   0000 0000 0000 0000

        SWAP    R0,     1                       ; 6886   0040
        ADDR    R6,     R7                      ; 6887   00F7
        SLR     R3,     2                       ; 6888   0067
        INCR    R0                              ; 6889   0008
        DECR    R1                              ; 688A   0011
        COMR    R1                              ; 688B   0019
        COMR    R1                              ; 688C   0019
        COMR    R1                              ; 688D   0019
        COMR    R2                              ; 688E   001A
        DECR    R2                              ; 688F   0012
        DECR    R2                              ; 6890   0012
        DECR    R2                              ; 6891   0012
        DECR    R2                              ; 6892   0012
        DECR    R2                              ; 6893   0012
        DECR    R2                              ; 6894   0012
        DECLE   $0000                           ; 6895   0000

        GSWD    R1                              ; 6896   0031
        ADCR    R1                              ; 6897   0029
        NEGR    R0                              ; 6898   0020
        DECR    R1                              ; 6899   0011
        COMR    R1                              ; 689A   0019
        COMR    R1                              ; 689B   0019
        COMR    R1                              ; 689C   0019
        COMR    R1                              ; 689D   0019
        COMR    R1                              ; 689E   0019
        COMR    R0                              ; 689F   0018
        DECLE   $0000                           ; 68A0   0000

        RSWD    R2                              ; 68A1   003A
        RSWD    R2                              ; 68A2   003A
        GSWD    R2                              ; 68A3   0032
        GSWD    R2                              ; 68A4   0032
        GSWD    R1                              ; 68A5   0031
        ADCR    R1                              ; 68A6   0029
        INCR    R2                              ; 68A7   000A
        DECR    R2                              ; 68A8   0012
        DECR    R2                              ; 68A9   0012
        DECR    R2                              ; 68AA   0012
        DECLE   $0000                           ; 68AB   0000

        RSWD    R0                              ; 68AC   0038
        RSWD    R5                              ; 68AD   003D
        RSWD    R5                              ; 68AE   003D
        RSWD    R5                              ; 68AF   003D
        RSWD    R5                              ; 68B0   003D
        DECLE   $0035                           ; 68B1   0035

        ADCR    R5                              ; 68B2   002D
        ADCR    R0                              ; 68B3   0028
        INCR    R5                              ; 68B4   000D
        DECR    R5                              ; 68B5   0015
        DECLE   $0000,  $0036,  $0036           ; 68B6   0000 0036 0036

        NEGR    R6                              ; 68B9   0026
        ADCR    R5                              ; 68BA   002D
        INCR    R5                              ; 68BB   000D
        DECR    R5                              ; 68BC   0015
        DECR    R5                              ; 68BD   0015
        COMR    R6                              ; 68BE   001E
        COMR    R6                              ; 68BF   001E
        COMR    R6                              ; 68C0   001E
        DECLE   $0000                           ; 68C1   0000

        GSWD    R1                              ; 68C2   0031
        ADCR    R1                              ; 68C3   0029
        NEGR    R1                              ; 68C4   0021
        INCR    R1                              ; 68C5   0009
        DECR    R1                              ; 68C6   0011
        COMR    R1                              ; 68C7   0019
        COMR    R1                              ; 68C8   0019
        COMR    R1                              ; 68C9   0019
        COMR    R1                              ; 68CA   0019
        COMR    R1                              ; 68CB   0019
        COMR    R1                              ; 68CC   0019
        COMR    R1                              ; 68CD   0019
        COMR    R1                              ; 68CE   0019
        COMR    R1                              ; 68CF   0019
        COMR    R1                              ; 68D0   0019
        DECLE   $0000                           ; 68D1   0000

        RSWD    R1                              ; 68D2   0039
        GSWD    R1                              ; 68D3   0031
        GSWD    R1                              ; 68D4   0031
        ADCR    R1                              ; 68D5   0029
        ADCR    R1                              ; 68D6   0029
        INCR    R5                              ; 68D7   000D
        INCR    R5                              ; 68D8   000D
        DECR    R5                              ; 68D9   0015
        DECR    R5                              ; 68DA   0015
        COMR    R5                              ; 68DB   001D
        DECLE   $0000                           ; 68DC   0000

        RSWD    R5                              ; 68DD   003D
        DECLE   $0035,  $0035                   ; 68DE   0035 0035

        ADCR    R5                              ; 68E0   002D
        ADCR    R5                              ; 68E1   002D
        INCR    R1                              ; 68E2   0009
        INCR    R1                              ; 68E3   0009
        DECR    R1                              ; 68E4   0011
        DECR    R1                              ; 68E5   0011
        COMR    R1                              ; 68E6   0019
        DECLE   $0000,  $0036                   ; 68E7   0000 0036

        INCR    R6                              ; 68E9   000E
        DECR    R6                              ; 68EA   0016
        DECR    R6                              ; 68EB   0016
        DECR    R6                              ; 68EC   0016
        DECR    R6                              ; 68ED   0016
        DECR    R6                              ; 68EE   0016
        DECR    R6                              ; 68EF   0016
        DECR    R6                              ; 68F0   0016
        DECR    R6                              ; 68F1   0016
        DECR    R6                              ; 68F2   0016
        DECR    R6                              ; 68F3   0016
        DECR    R6                              ; 68F4   0016
        DECLE   $0000,  $0001                   ; 68F5   0000 0001

        ADCR    R1                              ; 68F7   0029
        INCR    R1                              ; 68F8   0009
        INCR    R1                              ; 68F9   0009
        ADCR    R1                              ; 68FA   0029
        DECLE   $0001,  $0001                   ; 68FB   0001 0001

        ADCR    R1                              ; 68FD   0029
        INCR    R1                              ; 68FE   0009
        INCR    R1                              ; 68FF   0009
        ADCR    R1                              ; 6900   0029
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6901   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6905   0000 0000 0000 0000
        DECLE   $0000,  $0005                   ; 6909   0000 0005

        INCR    R5                              ; 690B   000D
        ADCR    R5                              ; 690C   002D
        ADCR    R5                              ; 690D   002D
        INCR    R5                              ; 690E   000D
        DECLE   $0005,  $0005                   ; 690F   0005 0005

        INCR    R5                              ; 6911   000D
        ADCR    R5                              ; 6912   002D
        ADCR    R5                              ; 6913   002D
        INCR    R5                              ; 6914   000D
        DECLE   $0005,  $0000,  $0000,  $0000   ; 6915   0005 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6919   0000 0000 0000 0000
        DECLE   $0000                           ; 691D   0000

        SWAP    R0,     1                       ; 691E   0040
        ADDR    R6,     R6                      ; 691F   00F6
        SAR     R0,     1                       ; 6920   0068
        DECLE   $0000,  $0000                   ; 6921   0000 0000

        SWAP    R0,     1                       ; 6923   0040
        ADDR    R6,     R6                      ; 6924   00F6
        SAR     R0,     1                       ; 6925   0068
        DECLE   $0000,  $0000                   ; 6926   0000 0000

        SWAP    R0,     1                       ; 6928   0040
        NEGR    R1                              ; 6929   0021
        SAR     R1,     1                       ; 692A   0069
        SWAP    R0,     2                       ; 692B   0044
        SWAP    R0,     2                       ; 692C   0044
        SWAP    R0,     2                       ; 692D   0044
        SWAP    R0,     2                       ; 692E   0044
        SWAP    R0,     2                       ; 692F   0044
        SWAP    R0,     2                       ; 6930   0044
        SWAP    R0,     2                       ; 6931   0044
        SWAP    R0,     2                       ; 6932   0044
        SWAP    R0,     2                       ; 6933   0044
        SUBR    R0,     R2                      ; 6934   0102
        DECLE   $0000                           ; 6935   0000

        SUBR    R4,     R0                      ; 6936   0120
        CMPR    R2,     R2                      ; 6937   0152
        RLC     R1,     2                       ; 6938   0055
        RLC     R1,     2                       ; 6939   0055
        RLC     R1,     2                       ; 693A   0055
        RLC     R1,     2                       ; 693B   0055
        RLC     R1,     2                       ; 693C   0055
        RLC     R1,     2                       ; 693D   0055
        RLC     R1,     2                       ; 693E   0055
        SWAP    R0,     2                       ; 693F   0044
        SWAP    R0,     2                       ; 6940   0044
        SWAP    R0,     2                       ; 6941   0044
        SWAP    R0,     2                       ; 6942   0044
        SWAP    R0,     2                       ; 6943   0044
        SWAP    R0,     2                       ; 6944   0044
        SWAP    R0,     2                       ; 6945   0044
        SUBR    R0,     R7                      ; 6946   0107
        DECLE   $0000                           ; 6947   0000

        SUBR    R4,     R0                      ; 6948   0120
        SUBR    R0,     R2                      ; 6949   0102
        MOVR    R1,     R0                      ; 694A   0088
        ANDR    R5,     R0                      ; 694B   01A8
        CMPR    R3,     R2                      ; 694C   015A
        RLC     R1,     2                       ; 694D   0055
        RLC     R1,     2                       ; 694E   0055
        RLC     R1,     2                       ; 694F   0055
        RLC     R1,     2                       ; 6950   0055
        RLC     R1,     2                       ; 6951   0055
        RLC     R1,     2                       ; 6952   0055
        SWAP    R0,     2                       ; 6953   0044
        SWAP    R0,     2                       ; 6954   0044
        SWAP    R0,     2                       ; 6955   0044
        SWAP    R0,     2                       ; 6956   0044
        SWAP    R0,     2                       ; 6957   0044
        SWAP    R0,     2                       ; 6958   0044
        SWAP    R0,     2                       ; 6959   0044
        SUBR    R2,     R4                      ; 695A   0114
        SUBR    R0,     R7                      ; 695B   0107
        MOVR    R1,     R0                      ; 695C   0088
        ANDR    R5,     R0                      ; 695D   01A8
        ANDR    R1,     R2                      ; 695E   018A
        MOVR    R1,     R0                      ; 695F   0088
        ANDR    R5,     R0                      ; 6960   01A8
        SLR     R1,     1                       ; 6961   0061
        SUBR    R0,     R6                      ; 6962   0106
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6963   0000 0000 0000 0000

        SWAP    R0,     2                       ; 6967   0044
        SWAP    R0,     2                       ; 6968   0044
        SWAP    R0,     2                       ; 6969   0044
        SWAP    R0,     2                       ; 696A   0044
        SWAP    R0,     2                       ; 696B   0044
        SWAP    R0,     2                       ; 696C   0044
        SWAP    R0,     2                       ; 696D   0044
        SWAP    R0,     2                       ; 696E   0044
        SUBR    R2,     R4                      ; 696F   0114
        ANDR    R0,     R7                      ; 6970   0187
        MOVR    R1,     R0                      ; 6971   0088
        ANDR    R5,     R0                      ; 6972   01A8
        SLR     R2,     2                       ; 6973   0066
        SLR     R2,     2                       ; 6974   0066
        DECR    R1                              ; 6975   0011
        DECR    R1                              ; 6976   0011
        SLR     R0,     2                       ; 6977   0064
        SLR     R0,     2                       ; 6978   0064
        SLR     R0,     2                       ; 6979   0064
        SLR     R0,     2                       ; 697A   0064
        SWAP    R0,     2                       ; 697B   0044
        SWAP    R0,     2                       ; 697C   0044
        SWAP    R0,     2                       ; 697D   0044
        SWAP    R0,     2                       ; 697E   0044
        SWAP    R0,     2                       ; 697F   0044
        SUBR    R0,     R2                      ; 6980   0102
        DECLE   $0000                           ; 6981   0000

        CMPR    R0,     R0                      ; 6982   0140
        SUBR    R2,     R4                      ; 6983   0114
        SUBR    R2,     R4                      ; 6984   0114
        DECR    R1                              ; 6985   0011
        DECR    R1                              ; 6986   0011
        DECR    R1                              ; 6987   0011
        DECR    R1                              ; 6988   0011
        DECR    R1                              ; 6989   0011
        DECR    R1                              ; 698A   0011
        SWAP    R0,     2                       ; 698B   0044
        SWAP    R0,     2                       ; 698C   0044
        SWAP    R0,     2                       ; 698D   0044
        SWAP    R0,     2                       ; 698E   0044
        SWAP    R0,     2                       ; 698F   0044
        SWAP    R0,     2                       ; 6990   0044
        SWAP    R0,     2                       ; 6991   0044
        SUBR    R0,     R2                      ; 6992   0102
        DECLE   $0000                           ; 6993   0000

        SUBR    R4,     R0                      ; 6994   0120
        ANDR    R1,     R2                      ; 6995   018A
        MOVR    R1,     R0                      ; 6996   0088
        XORR    R1,     R0                      ; 6997   01C8
        SUBR    R2,     R4                      ; 6998   0114
        DECR    R1                              ; 6999   0011
        SUBR    R0,     R7                      ; 699A   0107
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699F   0000 0000 0000 0000

        SWAP    R0,     2                       ; 69A3   0044
        SUBR    R0,     R2                      ; 69A4   0102
        DECLE   $0000                           ; 69A5   0000

        SUBR    R4,     R0                      ; 69A6   0120
        ANDR    R1,     R2                      ; 69A7   018A
        MOVR    R1,     R0                      ; 69A8   0088
        ANDR    R5,     R0                      ; 69A9   01A8
        ANDR    R0,     R7                      ; 69AA   0187
        MOVR    R1,     R0                      ; 69AB   0088
        CMPR    R1,     R0                      ; 69AC   0148
        SUBR    R2,     R4                      ; 69AD   0114
        DECR    R1                              ; 69AE   0011
        SUBR    R0,     R7                      ; 69AF   0107
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B4   0000 0000 0000 0000

        SUBR    R4,     R0                      ; 69B8   0120
        ANDR    R1,     R2                      ; 69B9   018A
        MOVR    R1,     R0                      ; 69BA   0088
        ANDR    R5,     R0                      ; 69BB   01A8
        SLR     R2,     2                       ; 69BC   0066
        SLR     R2,     2                       ; 69BD   0066
        DECR    R1                              ; 69BE   0011
        ANDR    R0,     R7                      ; 69BF   0187
        TSTR    R0                              ; 69C0   0080
        CMPR    R0,     R0                      ; 69C1   0140
        SUBR    R2,     R4                      ; 69C2   0114
        DECR    R1                              ; 69C3   0011
        RRC     R3,     2                       ; 69C4   0077
        RRC     R3,     2                       ; 69C5   0077
        SLR     R2,     2                       ; 69C6   0066
        SLR     R2,     2                       ; 69C7   0066
        GSWD    R3                              ; 69C8   0033
        GSWD    R3                              ; 69C9   0033
        SUBR    R0,     R2                      ; 69CA   0102
        SUBR    R0,     R7                      ; 69CB   0107
        MOVR    R1,     R0                      ; 69CC   0088
        ANDR    R5,     R0                      ; 69CD   01A8
        MOVR    R7,     R3                      ; 69CE   00BB
        MOVR    R7,     R3                      ; 69CF   00BB
        DECR    R1                              ; 69D0   0011
        DECR    R1                              ; 69D1   0011
        DECR    R1                              ; 69D2   0011
        DECR    R1                              ; 69D3   0011
        MOVR    R1,     R0                      ; 69D4   0088
        SUBR    R1,     R0                      ; 69D5   0108
        DECLE   $0000                           ; 69D6   0000

        DECR    R1                              ; 69D7   0011
        DECR    R1                              ; 69D8   0011
        DECR    R1                              ; 69D9   0011
        DECR    R4                              ; 69DA   0014
        DECR    R4                              ; 69DB   0014
        SUBR    R0,     R2                      ; 69DC   0102
        DECLE   $0000                           ; 69DD   0000

        SUBR    R4,     R0                      ; 69DE   0120
        DECR    R1                              ; 69DF   0011
        SUBR    R0,     R7                      ; 69E0   0107
        MOVR    R1,     R0                      ; 69E1   0088
        MOVR    R1,     R0                      ; 69E2   0088
        DECLE   $0000                           ; 69E3   0000

        SUBR    R2,     R0                      ; 69E4   0110
        DECR    R1                              ; 69E5   0011
        DECR    R1                              ; 69E6   0011
        DECR    R1                              ; 69E7   0011
        MOVR    R1,     R0                      ; 69E8   0088
        SUBR    R1,     R0                      ; 69E9   0108
        DECLE   $0000                           ; 69EA   0000

        DECR    R1                              ; 69EB   0011
        DECR    R1                              ; 69EC   0011
        SWAP    R0,     2                       ; 69ED   0044
        SUBR    R0,     R2                      ; 69EE   0102
        DECLE   $0000                           ; 69EF   0000

        SUBR    R4,     R0                      ; 69F0   0120
        SUBR    R0,     R2                      ; 69F1   0102
        DECLE   $0000                           ; 69F2   0000

        DECR    R1                              ; 69F3   0011
        DECR    R1                              ; 69F4   0011
        GSWD    R3                              ; 69F5   0033
        GSWD    R3                              ; 69F6   0033
        GSWD    R3                              ; 69F7   0033
        GSWD    R3                              ; 69F8   0033
        DECR    R1                              ; 69F9   0011
        DECR    R1                              ; 69FA   0011
        DECR    R1                              ; 69FB   0011
        MOVR    R1,     R0                      ; 69FC   0088
        SUBR    R1,     R0                      ; 69FD   0108
        DECLE   $0000                           ; 69FE   0000

        DECR    R1                              ; 69FF   0011
        DECR    R1                              ; 6A00   0011
        SWAP    R0,     2                       ; 6A01   0044
        SWAP    R0,     2                       ; 6A02   0044
        GSWD    R3                              ; 6A03   0033
        GSWD    R3                              ; 6A04   0033
        SWAP    R0,     2                       ; 6A05   0044
        SLR     R2,     2                       ; 6A06   0066
        DECR    R1                              ; 6A07   0011
        DECR    R1                              ; 6A08   0011
        SUBR    R0,     R6                      ; 6A09   0106
        DECLE   $0000,  $0000,  $0000           ; 6A0A   0000 0000 0000

        SUBR    R2,     R0                      ; 6A0D   0110
        DECR    R1                              ; 6A0E   0011
        DECR    R1                              ; 6A0F   0011
        DECR    R1                              ; 6A10   0011
        ANDR    R0,     R1                      ; 6A11   0181
        SUBR    R1,     R0                      ; 6A12   0108
        DECLE   $0000                           ; 6A13   0000

        SUBR    R2,     R0                      ; 6A14   0110
        DECR    R1                              ; 6A15   0011
        SUBR    R0,     R1                      ; 6A16   0101
        DECLE   $0000,  $0000                   ; 6A17   0000 0000

        CMPR    R0,     R0                      ; 6A19   0140
        DECR    R1                              ; 6A1A   0011
        DECR    R1                              ; 6A1B   0011
        CMPR    R2,     R1                      ; 6A1C   0151
        RLC     R1,     2                       ; 6A1D   0055
        SUBR    R2,     R5                      ; 6A1E   0115
        DECR    R1                              ; 6A1F   0011
        DECR    R1                              ; 6A20   0011
        DECR    R1                              ; 6A21   0011
        DECR    R1                              ; 6A22   0011
        NEGR    R1                              ; 6A23   0021
        SUBR    R0,     R2                      ; 6A24   0102
        ANDR    R0,     R0                      ; 6A25   0180
        MOVR    R1,     R0                      ; 6A26   0088
        CMPR    R1,     R0                      ; 6A27   0148
        SUBR    R2,     R4                      ; 6A28   0114
        SUBR    R0,     R6                      ; 6A29   0106
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2A   0000 0000 0000 0000
        DECLE   $0000                           ; 6A2E   0000

        DECR    R1                              ; 6A2F   0011
        NEGR    R1                              ; 6A30   0021
        CMPR    R2,     R1                      ; 6A31   0151
        RLC     R1,     2                       ; 6A32   0055
        SUBR    R2,     R5                      ; 6A33   0115
        DECR    R1                              ; 6A34   0011
        DECR    R1                              ; 6A35   0011
        DECR    R1                              ; 6A36   0011
        DECR    R1                              ; 6A37   0011
        NEGR    R1                              ; 6A38   0021
        SUBR    R0,     R2                      ; 6A39   0102
        ANDR    R0,     R0                      ; 6A3A   0180
        MOVR    R1,     R0                      ; 6A3B   0088
        CMPR    R1,     R0                      ; 6A3C   0148
        SUBR    R2,     R4                      ; 6A3D   0114
        SUBR    R0,     R6                      ; 6A3E   0106
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3F   0000 0000 0000 0000

        DECR    R1                              ; 6A43   0011
        DECR    R1                              ; 6A44   0011
        NEGR    R1                              ; 6A45   0021
        CMPR    R2,     R1                      ; 6A46   0151
        RLC     R1,     2                       ; 6A47   0055
        SUBR    R2,     R5                      ; 6A48   0115
        DECR    R1                              ; 6A49   0011
        DECR    R1                              ; 6A4A   0011
        DECR    R1                              ; 6A4B   0011
        DECR    R1                              ; 6A4C   0011
        NEGR    R1                              ; 6A4D   0021
        GSWD    R1                              ; 6A4E   0031
        ANDR    R0,     R2                      ; 6A4F   0182
        MOVR    R1,     R0                      ; 6A50   0088
        CMPR    R1,     R0                      ; 6A51   0148
        SUBR    R2,     R4                      ; 6A52   0114
        SUBR    R0,     R6                      ; 6A53   0106
        DECLE   $0000,  $0000,  $0000           ; 6A54   0000 0000 0000

        DECR    R1                              ; 6A57   0011
        DECR    R1                              ; 6A58   0011
        DECR    R1                              ; 6A59   0011
        DECR    R1                              ; 6A5A   0011
        DECR    R1                              ; 6A5B   0011
        DECR    R1                              ; 6A5C   0011
        DECR    R1                              ; 6A5D   0011
        DECR    R1                              ; 6A5E   0011
        DECR    R1                              ; 6A5F   0011
        DECR    R1                              ; 6A60   0011
        DECR    R1                              ; 6A61   0011
        DECR    R1                              ; 6A62   0011
        NEGR    R1                              ; 6A63   0021
        ANDR    R0,     R1                      ; 6A64   0181
        MOVR    R1,     R0                      ; 6A65   0088
        CMPR    R1,     R0                      ; 6A66   0148
        SUBR    R2,     R4                      ; 6A67   0114
        GSWD    R3                              ; 6A68   0033
        GSWD    R3                              ; 6A69   0033
        GSWD    R3                              ; 6A6A   0033
        DECR    R1                              ; 6A6B   0011
        DECR    R1                              ; 6A6C   0011
        DECR    R1                              ; 6A6D   0011
        DECR    R1                              ; 6A6E   0011
        DECR    R1                              ; 6A6F   0011
        DECR    R1                              ; 6A70   0011
        DECR    R1                              ; 6A71   0011
        DECR    R1                              ; 6A72   0011
        DECR    R1                              ; 6A73   0011
        DECR    R1                              ; 6A74   0011
        DECR    R1                              ; 6A75   0011
        DECR    R1                              ; 6A76   0011
        DECR    R1                              ; 6A77   0011
        SUBR    R0,     R2                      ; 6A78   0102
        ANDR    R0,     R0                      ; 6A79   0180
        MOVR    R1,     R0                      ; 6A7A   0088
        CMPR    R1,     R0                      ; 6A7B   0148
        SUBR    R1,     R2                      ; 6A7C   010A
        DECLE   $0000,  $0000                   ; 6A7D   0000 0000

        SUBR    R2,     R0                      ; 6A7F   0110
        DECR    R1                              ; 6A80   0011
        DECR    R1                              ; 6A81   0011
        DECR    R1                              ; 6A82   0011
        DECR    R1                              ; 6A83   0011
        DECR    R1                              ; 6A84   0011
        CMPR    R2,     R1                      ; 6A85   0151
        RLC     R1,     2                       ; 6A86   0055
        SUBR    R2,     R5                      ; 6A87   0115
        DECR    R1                              ; 6A88   0011
        DECR    R1                              ; 6A89   0011
        DECR    R1                              ; 6A8A   0011
        DECR    R1                              ; 6A8B   0011
        NEGR    R1                              ; 6A8C   0021
        GSWD    R1                              ; 6A8D   0031
        ANDR    R0,     R1                      ; 6A8E   0181
        MOVR    R1,     R0                      ; 6A8F   0088
        ANDR    R5,     R0                      ; 6A90   01A8
        GSWD    R3                              ; 6A91   0033
        GSWD    R3                              ; 6A92   0033
        DECLE   $0000                           ; 6A93   0000

        SUBR    R2,     R0                      ; 6A94   0110
        DECR    R1                              ; 6A95   0011
        DECR    R1                              ; 6A96   0011
        DECR    R1                              ; 6A97   0011
        DECR    R1                              ; 6A98   0011
        DECR    R1                              ; 6A99   0011
        DECR    R1                              ; 6A9A   0011
        DECR    R1                              ; 6A9B   0011
        DECR    R1                              ; 6A9C   0011
        DECR    R1                              ; 6A9D   0011
        DECR    R1                              ; 6A9E   0011
        DECR    R1                              ; 6A9F   0011
        DECR    R1                              ; 6AA0   0011
        DECR    R1                              ; 6AA1   0011
        SUBR    R0,     R2                      ; 6AA2   0102
        ANDR    R0,     R0                      ; 6AA3   0180
        MOVR    R1,     R0                      ; 6AA4   0088
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA5   0000 0000 0000 0000

        SUBR    R2,     R0                      ; 6AA9   0110
        DECR    R1                              ; 6AAA   0011
        DECR    R1                              ; 6AAB   0011
        DECR    R1                              ; 6AAC   0011
        DECR    R1                              ; 6AAD   0011
        DECR    R1                              ; 6AAE   0011
        DECR    R1                              ; 6AAF   0011
        DECR    R1                              ; 6AB0   0011
        DECR    R1                              ; 6AB1   0011
        DECR    R1                              ; 6AB2   0011
        DECR    R1                              ; 6AB3   0011
        DECR    R1                              ; 6AB4   0011
        DECR    R1                              ; 6AB5   0011
        NEGR    R1                              ; 6AB6   0021
        GSWD    R1                              ; 6AB7   0031
        ANDR    R0,     R2                      ; 6AB8   0182
        MOVR    R1,     R0                      ; 6AB9   0088
        DECLE   $0000,  $0000                   ; 6ABA   0000 0000

        SUBR    R2,     R0                      ; 6ABC   0110
        DECR    R1                              ; 6ABD   0011
        DECR    R1                              ; 6ABE   0011
        DECR    R1                              ; 6ABF   0011
        DECR    R1                              ; 6AC0   0011
        DECR    R1                              ; 6AC1   0011
        DECR    R1                              ; 6AC2   0011
        DECR    R1                              ; 6AC3   0011
        CMPR    R2,     R1                      ; 6AC4   0151
        RLC     R1,     2                       ; 6AC5   0055
        SUBR    R2,     R5                      ; 6AC6   0115
        DECR    R1                              ; 6AC7   0011
        DECR    R1                              ; 6AC8   0011
        DECR    R1                              ; 6AC9   0011
        DECR    R1                              ; 6ACA   0011
        DECR    R1                              ; 6ACB   0011
        NEGR    R1                              ; 6ACC   0021
        ANDR    R0,     R1                      ; 6ACD   0181
        MOVR    R1,     R0                      ; 6ACE   0088
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACF   0000 0000 0000 0000

        SUBR    R2,     R0                      ; 6AD3   0110
        DECR    R1                              ; 6AD4   0011
        DECR    R1                              ; 6AD5   0011
        DECR    R1                              ; 6AD6   0011
        DECR    R1                              ; 6AD7   0011
        DECR    R1                              ; 6AD8   0011
        DECR    R1                              ; 6AD9   0011
        DECR    R1                              ; 6ADA   0011
        DECR    R1                              ; 6ADB   0011
        DECR    R1                              ; 6ADC   0011
        DECR    R1                              ; 6ADD   0011
        DECR    R1                              ; 6ADE   0011
        DECR    R1                              ; 6ADF   0011
        DECR    R1                              ; 6AE0   0011
        SUBR    R0,     R2                      ; 6AE1   0102
        MOVR    R1,     R0                      ; 6AE2   0088
        DECLE   $0000,  $0000,  $0000           ; 6AE3   0000 0000 0000

        SUBR    R2,     R0                      ; 6AE6   0110
        DECR    R1                              ; 6AE7   0011
        DECR    R1                              ; 6AE8   0011
        DECR    R1                              ; 6AE9   0011
        DECR    R1                              ; 6AEA   0011
        DECR    R1                              ; 6AEB   0011
        DECR    R1                              ; 6AEC   0011
        DECR    R1                              ; 6AED   0011
        DECR    R1                              ; 6AEE   0011
        DECR    R1                              ; 6AEF   0011
        DECR    R1                              ; 6AF0   0011
        DECR    R1                              ; 6AF1   0011
        DECR    R1                              ; 6AF2   0011
        DECR    R1                              ; 6AF3   0011
        DECR    R1                              ; 6AF4   0011
        NEGR    R1                              ; 6AF5   0021
        GSWD    R1                              ; 6AF6   0031
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF7   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6AFB   0000 0000

        SUBR    R2,     R0                      ; 6AFD   0110
        DECR    R1                              ; 6AFE   0011
        DECR    R1                              ; 6AFF   0011
        DECR    R1                              ; 6B00   0011
        DECR    R1                              ; 6B01   0011
        DECR    R1                              ; 6B02   0011
        DECR    R1                              ; 6B03   0011
        DECR    R1                              ; 6B04   0011
        DECR    R1                              ; 6B05   0011
        DECR    R1                              ; 6B06   0011
        DECR    R1                              ; 6B07   0011
        DECR    R1                              ; 6B08   0011
        DECR    R1                              ; 6B09   0011
        DECR    R1                              ; 6B0A   0011
        ADDR    R7,     R7                      ; 6B0B   00FF
        ADDR    R7,     R7                      ; 6B0C   00FF
        SARC    R3,     2                       ; 6B0D   007F
        RSWD    R7                              ; 6B0E   003F
        TSTR    R7                              ; 6B0F   00BF
        RSWD    R7                              ; 6B10   003F
        SARC    R3,     2                       ; 6B11   007F
        ADDR    R7,     R7                      ; 6B12   00FF
        ADDR    R7,     R7                      ; 6B13   00FF
        ADDR    R7,     R7                      ; 6B14   00FF
        ADDR    R3,     R7                      ; 6B15   00DF
        INCR    R7                              ; 6B16   000F
        ADCR    R7                              ; 6B17   002F
        SLL     R3,     2                       ; 6B18   004F
        COMR    R7                              ; 6B19   001F
        RSWD    R7                              ; 6B1A   003F
        RSWD    R7                              ; 6B1B   003F
        SARC    R3,     2                       ; 6B1C   007F
        DECLE   $0037                           ; 6B1D   0037

        SWAP    R3,     1                       ; 6B1E   0043
        MOVR    R1,     R3                      ; 6B1F   008B
        DECR    R3                              ; 6B20   0013
        SETC                                    ; 6B21   0007
        ADDR    R1,     R7                      ; 6B22   00CF
        ADDR    R1,     R1                      ; 6B23   00C9
        SLLC    R3,     1                       ; 6B24   005B
        DECLE   $0001                           ; 6B25   0001

        DECR    R5                              ; 6B26   0015
        DECLE   $0000,  $0000                   ; 6B27   0000 0000

        INCR    R2                              ; 6B29   000A
        ADDR    R0,     R1                      ; 6B2A   00C1
        ADDR    R6,     R3                      ; 6B2B   00F3
        ADDR    R0,     R7                      ; 6B2C   00C7
        RLC     R3,     1                       ; 6B2D   0053

        JSR     R4,     G_0801                  ; 6B2E   0004 0008 0001
        DECLE   $0000                           ; 6B31   0000

        COMR    R4                              ; 6B32   001C
        ADDR    R7,     R4                      ; 6B33   00FC
        GSWD    R1                              ; 6B34   0031
        DECR    R4                              ; 6B35   0014
        DECLE   $0001                           ; 6B36   0001

        EIS                                     ; 6B37   0002
        DECLE   $0000,  $0000                   ; 6B38   0000 0000

        SETC                                    ; 6B3A   0007
        ADDR    R7,     R7                      ; 6B3B   00FF
        INCR    R4                              ; 6B3C   000C
        DECLE   $0005,  $0000,  $0000,  $0000   ; 6B3D   0005 0000 0000 0000
        DECLE   $0000,  $0001                   ; 6B41   0000 0001

        ADDR    R4,     R0                      ; 6B43   00E0
        ADDR    R0,     R0                      ; 6B44   00C0
        TSTR    R0                              ; 6B45   0080
        TSTR    R0                              ; 6B46   0080
        TSTR    R0                              ; 6B47   0080
        TSTR    R0                              ; 6B48   0080
        TSTR    R0                              ; 6B49   0080
        ADDR    R0,     R0                      ; 6B4A   00C0
        ADDR    R7,     R7                      ; 6B4B   00FF
        ADDR    R4,     R0                      ; 6B4C   00E0
        ADDR    R0,     R0                      ; 6B4D   00C0
        ADDR    R0,     R0                      ; 6B4E   00C0
        ADDR    R0,     R0                      ; 6B4F   00C0
        ADDR    R0,     R0                      ; 6B50   00C0
        ADDR    R0,     R0                      ; 6B51   00C0
        ADDR    R4,     R0                      ; 6B52   00E0
        ADDR    R7,     R7                      ; 6B53   00FF
        ADDR    R7,     R0                      ; 6B54   00F8
        ADDR    R6,     R0                      ; 6B55   00F0
        ADDR    R6,     R0                      ; 6B56   00F0
        ADDR    R6,     R0                      ; 6B57   00F0
        ADDR    R6,     R0                      ; 6B58   00F0
        ADDR    R6,     R0                      ; 6B59   00F0
        ADDR    R7,     R0                      ; 6B5A   00F8
        ADDR    R7,     R7                      ; 6B5B   00FF
        ADDR    R7,     R6                      ; 6B5C   00FE
        ADDR    R7,     R4                      ; 6B5D   00FC
        ADDR    R7,     R4                      ; 6B5E   00FC
        ADDR    R7,     R4                      ; 6B5F   00FC
        ADDR    R7,     R4                      ; 6B60   00FC
        ADDR    R7,     R4                      ; 6B61   00FC
        ADDR    R7,     R6                      ; 6B62   00FE
        DECR    R0                              ; 6B63   0010
        RRC     R0,     1                       ; 6B64   0070
        MOVR    R7,     R0                      ; 6B65   00B8
        ADDR    R7,     R1                      ; 6B66   00F9
        SARC    R1,     2                       ; 6B67   007D
        RSWD    R7                              ; 6B68   003F
        RSWD    R7                              ; 6B69   003F
        RSWD    R7                              ; 6B6A   003F
        NEGR    R6                              ; 6B6B   0026
        NEGR    R0                              ; 6B6C   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6D   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6B71   0000 0000

        DECR    R0                              ; 6B73   0010
        RRC     R0,     1                       ; 6B74   0070
        MOVR    R6,     R0                      ; 6B75   00B0
        ADDR    R7,     R0                      ; 6B76   00F8
        SARC    R0,     1                       ; 6B77   0078
        SARC    R0,     1                       ; 6B78   0078
        RSWD    R0                              ; 6B79   0038
        RSWD    R4                              ; 6B7A   003C
        ADCR    R4                              ; 6B7B   002C
        ADCR    R6                              ; 6B7C   002E
        INCR    R0                              ; 6B7D   0008
        INCR    R0                              ; 6B7E   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7F   0000 0000 0000 0000

        NEGR    R0                              ; 6B83   0020
        RSWD    R0                              ; 6B84   0038
        GSWD    R0                              ; 6B85   0030
        DECR    R4                              ; 6B86   0014
        COMR    R4                              ; 6B87   001C
        COMR    R6                              ; 6B88   001E
        COMR    R6                              ; 6B89   001E
        COMR    R5                              ; 6B8A   001D
        INCR    R7                              ; 6B8B   000F
        INCR    R6                              ; 6B8C   000E
        INCR    R0                              ; 6B8D   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6B92   0000 0000

        SWAP    R0,     1                       ; 6B94   0040
        SWAP    R0,     1                       ; 6B95   0040
        SLR     R0,     2                       ; 6B96   0064
        ADDR    R7,     R4                      ; 6B97   00FC
        RSWD    R6                              ; 6B98   003E
        COMR    R6                              ; 6B99   001E
        COMR    R5                              ; 6B9A   001D
        COMR    R7                              ; 6B9B   001F
        INCR    R6                              ; 6B9C   000E
        INCR    R0                              ; 6B9D   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6BA2   0000 0000

        TSTR    R0                              ; 6BA4   0080
        MOVR    R4,     R0                      ; 6BA5   00A0
        ADDR    R7,     R0                      ; 6BA6   00F8
        SARC    R0,     2                       ; 6BA7   007C
        MOVR    R7,     R4                      ; 6BA8   00BC
        ADDR    R7,     R6                      ; 6BA9   00FE
        ADDR    R7,     R7                      ; 6BAA   00FF
        RSWD    R7                              ; 6BAB   003F
        SARC    R3,     2                       ; 6BAC   007F
        SARC    R3,     2                       ; 6BAD   007F
        SLLC    R3,     2                       ; 6BAE   005F
        SLL     R3,     2                       ; 6BAF   004F
        INCR    R2                              ; 6BB0   000A
        COMR    R6                              ; 6BB1   001E
        DECR    R4                              ; 6BB2   0014
        DECR    R0                              ; 6BB3   0010
        MOVR    R4,     R0                      ; 6BB4   00A0
        ADDR    R7,     R0                      ; 6BB5   00F8
        SARC    R0,     2                       ; 6BB6   007C
        MOVR    R7,     R4                      ; 6BB7   00BC
        ADDR    R7,     R6                      ; 6BB8   00FE
        ADDR    R7,     R7                      ; 6BB9   00FF
        RSWD    R7                              ; 6BBA   003F
        SARC    R0,     2                       ; 6BBB   007C
        MOVR    R0,     R2                      ; 6BBC   0082
        SARC    R0,     2                       ; 6BBD   007C
        DECLE   $0000                           ; 6BBE   0000

        SARC    R0,     2                       ; 6BBF   007C
        ADDR    R2,     R6                      ; 6BC0   00D6
        SARC    R0,     2                       ; 6BC1   007C
        NEGR    R4                              ; 6BC2   0024
        DECLE   $0000                           ; 6BC3   0000

        DECR    R0                              ; 6BC4   0010
        DECR    R0                              ; 6BC5   0010
        NEGR    R4                              ; 6BC6   0024
        ADDR    R0,     R6                      ; 6BC7   00C6
        SARC    R0,     2                       ; 6BC8   007C
        SARC    R0,     2                       ; 6BC9   007C
        SARC    R0,     2                       ; 6BCA   007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCB   0000 0000 0000 0000

        RSWD    R0                              ; 6BCF   0038
        SAR     R0,     2                       ; 6BD0   006C
        ADDR    R5,     R6                      ; 6BD1   00EE
        ADDR    R2,     R6                      ; 6BD2   00D6
        RSWD    R0                              ; 6BD3   0038
        DECLE   $0000,  $0000,  $0000           ; 6BD4   0000 0000 0000

        RSWD    R0                              ; 6BD7   0038
        RSWD    R0                              ; 6BD8   0038
        DECLE   $0000,  $0000                   ; 6BD9   0000 0000

        COMR    R2                              ; 6BDB   001A
        RSWD    R6                              ; 6BDC   003E
        COMR    R4                              ; 6BDD   001C
        DECLE   $0001                           ; 6BDE   0001

        COMR    R6                              ; 6BDF   001E
        DECLE   $0000                           ; 6BE0   0000

        EIS                                     ; 6BE1   0002
        SARC    R2,     2                       ; 6BE2   007E
        SARC    R2,     2                       ; 6BE3   007E
        RRC     R0,     2                       ; 6BE4   0074
        ADDR    R4,     R0                      ; 6BE5   00E0
        DECLE   $0000                           ; 6BE6   0000

        ADDR    R0,     R0                      ; 6BE7   00C0
        ADDR    R0,     R0                      ; 6BE8   00C0
        SLR     R0,     1                       ; 6BE9   0060
        DECLE   $0000                           ; 6BEA   0000

        COMR    R2                              ; 6BEB   001A
        RSWD    R6                              ; 6BEC   003E
        COMR    R4                              ; 6BED   001C
        DECLE   $0000                           ; 6BEE   0000

        DECR    R0                              ; 6BEF   0010
        INCR    R6                              ; 6BF0   000E
        SARC    R0,     1                       ; 6BF1   0078
        SARC    R0,     2                       ; 6BF2   007C
        ADDR    R4,     R0                      ; 6BF3   00E0
        SAR     R0,     2                       ; 6BF4   006C
        MOVR    R1,     R6                      ; 6BF5   008E
        ADDR    R4,     R0                      ; 6BF6   00E0
        SLR     R0,     1                       ; 6BF7   0060
        DECLE   $0000,  $0000,  $0000           ; 6BF8   0000 0000 0000

        COMR    R2                              ; 6BFB   001A
        RSWD    R6                              ; 6BFC   003E
        COMR    R4                              ; 6BFD   001C
        DECLE   $0000                           ; 6BFE   0000

        COMR    R4                              ; 6BFF   001C
        CLRC                                    ; 6C00   0006
        RSWD    R0                              ; 6C01   0038
        SARC    R0,     2                       ; 6C02   007C
        MOVR    R6,     R0                      ; 6C03   00B0
L_6C04:
        ADDR    R1,     R4                      ; 6C04   00CC
        SAR     R2,     2                       ; 6C05   006E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C06   0000 0000 0000 0000
        DECLE   $0000                           ; 6C0A   0000

        COMR    R2                              ; 6C0B   001A
        RSWD    R6                              ; 6C0C   003E
        COMR    R4                              ; 6C0D   001C
        DECLE   $0001                           ; 6C0E   0001

        COMR    R6                              ; 6C0F   001E
        DECLE   $0000                           ; 6C10   0000

        SARC    R0,     1                       ; 6C11   0078
        RSWD    R4                              ; 6C12   003C
        RSWD    R4                              ; 6C13   003C
        MOVR    R1,     R0                      ; 6C14   0088
        SLR     R0,     1                       ; 6C15   0060
        SARC    R0,     1                       ; 6C16   0078
        COMR    R4                              ; 6C17   001C
        DECLE   $0000,  $0000,  $0000           ; 6C18   0000 0000 0000

        SETC                                    ; 6C1B   0007
        RSWD    R5                              ; 6C1C   003D
        SAR     R3,     2                       ; 6C1D   006F
        SARC    R0,     2                       ; 6C1E   007C
        RRC     R0,     1                       ; 6C1F   0070
        ADDR    R4,     R0                      ; 6C20   00E0
        ADDR    R4,     R1                      ; 6C21   00E1
        ADDR    R4,     R7                      ; 6C22   00E7
        ADDR    R7,     R7                      ; 6C23   00FF
        ADDR    R7,     R6                      ; 6C24   00FE
        ADDR    R7,     R6                      ; 6C25   00FE
        ADDR    R7,     R4                      ; 6C26   00FC
        RSWD    R0                              ; 6C27   0038
        DECLE   $0000,  $0000,  $0000           ; 6C28   0000 0000 0000

        SETC                                    ; 6C2B   0007
        RSWD    R5                              ; 6C2C   003D
        SAR     R3,     2                       ; 6C2D   006F
        SARC    R0,     2                       ; 6C2E   007C
        RRC     R0,     1                       ; 6C2F   0070
        ADDR    R4,     R0                      ; 6C30   00E0
        ADDR    R4,     R1                      ; 6C31   00E1
        ADDR    R4,     R7                      ; 6C32   00E7
        ADDR    R7,     R7                      ; 6C33   00FF
        ADDR    R7,     R6                      ; 6C34   00FE
        ADDR    R7,     R6                      ; 6C35   00FE
        ADDR    R7,     R4                      ; 6C36   00FC
        RSWD    R0                              ; 6C37   0038
        DECLE   $0000,  $0000,  $0000           ; 6C38   0000 0000 0000

        SETC                                    ; 6C3B   0007
        RSWD    R5                              ; 6C3C   003D
        SAR     R3,     2                       ; 6C3D   006F
        SARC    R0,     2                       ; 6C3E   007C
        RRC     R0,     1                       ; 6C3F   0070
        ADDR    R4,     R0                      ; 6C40   00E0
        ADDR    R4,     R1                      ; 6C41   00E1
        ADDR    R4,     R7                      ; 6C42   00E7
        ADDR    R7,     R7                      ; 6C43   00FF
        ADDR    R7,     R6                      ; 6C44   00FE
        ADDR    R7,     R6                      ; 6C45   00FE
        ADDR    R7,     R4                      ; 6C46   00FC
        RSWD    R0                              ; 6C47   0038
        DECLE   $0000,  $0000,  $0000           ; 6C48   0000 0000 0000

        SETC                                    ; 6C4B   0007
        RSWD    R5                              ; 6C4C   003D
        SAR     R3,     2                       ; 6C4D   006F
        SARC    R0,     2                       ; 6C4E   007C
        RRC     R0,     1                       ; 6C4F   0070
        ADDR    R4,     R0                      ; 6C50   00E0
        ADDR    R4,     R1                      ; 6C51   00E1
        ADDR    R4,     R7                      ; 6C52   00E7
        ADDR    R7,     R7                      ; 6C53   00FF
        ADDR    R7,     R6                      ; 6C54   00FE
        ADDR    R7,     R6                      ; 6C55   00FE
        ADDR    R7,     R4                      ; 6C56   00FC
        RSWD    R0                              ; 6C57   0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C58   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6C5C   0000 0000

        GSWD    R0                              ; 6C5E   0030
        COMR    R0                              ; 6C5F   0018
        INCR    R4                              ; 6C60   000C
        CLRC                                    ; 6C61   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C62   0000 0000 0000 0000

        RSWD    R7                              ; 6C66   003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C67   0000 0000 0000 0000

        INCR    R4                              ; 6C6B   000C
        COMR    R0                              ; 6C6C   0018
        GSWD    R0                              ; 6C6D   0030
        SLR     R0,     1                       ; 6C6E   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6F   0000 0000 0000 0000

        NEGR    R0                              ; 6C73   0020
        DECR    R0                              ; 6C74   0010
        INCR    R4                              ; 6C75   000C
        GSWD    R0                              ; 6C76   0030
        SWAP    R0,     2                       ; 6C77   0044
        DECR    R0                              ; 6C78   0010
        DECLE   $0000,  $0000                   ; 6C79   0000 0000

        DECR    R0                              ; 6C7B   0010

        JSR     R4,     G_2C14                  ; 6C7C   0004 002C 0014

        NEGR    R2                              ; 6C7F   0022
        INCR    R4                              ; 6C80   000C
        DECLE   $0000,  $0000                   ; 6C81   0000 0000

        INCR    R0                              ; 6C83   0008
        INCR    R0                              ; 6C84   0008
        GSWD    R0                              ; 6C85   0030
        INCR    R4                              ; 6C86   000C
        RSWD    R0                              ; 6C87   0038
        INCR    R0                              ; 6C88   0008
        DECLE   $0000,  $0000                   ; 6C89   0000 0000

        JSRD    R4,     G_2000                  ; 6C8B   0004 0022 0000

        ADCR    R0                              ; 6C8E   0028
        DECR    R4                              ; 6C8F   0014
        DECR    R2                              ; 6C90   0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C91   0000 0000 0000 0000

        SLR     R0,     1                       ; 6C95   0060
        ADDR    R6,     R0                      ; 6C96   00F0
        ADDR    R7,     R0                      ; 6C97   00F8
        RLC     R0,     1                       ; 6C98   0050
        ADDR    R6,     R0                      ; 6C99   00F0
        SLR     R2,     2                       ; 6C9A   0066
        GSWD    R3                              ; 6C9B   0033
        SLR     R1,     2                       ; 6C9C   0065
        ADDR    R5,     R3                      ; 6C9D   00EB
        ADDR    R6,     R7                      ; 6C9E   00F7
        ADDR    R7,     R6                      ; 6C9F   00FE
        MOVR    R7,     R4                      ; 6CA0   00BC
        MOVR    R7,     R0                      ; 6CA1   00B8
        MOVR    R6,     R0                      ; 6CA2   00B0
        ADDR    R7,     R0                      ; 6CA3   00F8
        DECLE   $0000,  $0000,  $0000           ; 6CA4   0000 0000 0000

        SLR     R0,     1                       ; 6CA7   0060
        ADDR    R4,     R0                      ; 6CA8   00E0
        ADDR    R6,     R0                      ; 6CA9   00F0
        ADDR    R6,     R0                      ; 6CAA   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAF   0000 0000 0000 0000

        INCR    R0                              ; 6CB3   0008
        DECR    R4                              ; 6CB4   0014
        RLC     R0,     2                       ; 6CB5   0054
        NEGR    R5                              ; 6CB6   0025
        INCR    R3                              ; 6CB7   000B
        INCR    R2                              ; 6CB8   000A
        INCR    R7                              ; 6CB9   000F

        JSR     R4,     .EXEC.0B9               ; 6CBA   0004 0010 00B9

        ADDR    R5,     R3                      ; 6CBD   00EB
        SLL     R2,     2                       ; 6CBE   004E
        INCR    R3                              ; 6CBF   000B
        INCR    R2                              ; 6CC0   000A
        INCR    R6                              ; 6CC1   000E

        JSRE    R6,     G_7680                  ; 6CC2   0004 0275 0280

        SUB@    R4,     R0                      ; 6CC5   0320
        ANDI    #$001F, R0                      ; 6CC6   03B8 001F
        BEQ     L_6CCB                          ; 6CC8   0204 0001

        PULR    R7                              ; 6CCA   02B7
L_6CCB:
        MVI     G_0320, R0                      ; 6CCB   0280 0320
        SDBD                                    ; 6CCD   0001
        XORI    #$8000, R0                      ; 6CCE   03F8 0000 0080
        MVO     R0,     G_0320                  ; 6CD1   0240 0320
        SDBD                                    ; 6CD3   0001
        MVII    #$6BDB, R4                      ; 6CD4   02BC 00DB 006B
        SDBD                                    ; 6CD7   0001
        MVII    #$3920, R5                      ; 6CD8   02BD 0020 0039
        MVII    #$0040, R0                      ; 6CDB   02B8 0040
        PSHR    R5                              ; 6CDD   0275

        JSR     R5,     L_6FCC                  ; 6CDE   0004 016C 03CC

        MVI     G_0107, R0                      ; 6CE1   0280 0107
        ANDI    #$000F, R0                      ; 6CE3   03B8 000F
        MOVR    R0,     R2                      ; 6CE5   0082
        XORI    #$0010, R0                      ; 6CE6   03F8 0010
        SDBD                                    ; 6CE8   0001
        MVII    #$0927, R3                      ; 6CE9   02BB 0027 0009
        MVI     G_0150, R1                      ; 6CEC   0281 0150
        ANDI    #$0001, R2                      ; 6CEE   03BA 0001
        BNEQ    L_6D01                          ; 6CF0   020C 000F

        ANDI    #$0002, R1                      ; 6CF2   03B9 0002
        BNEQ    L_6CFC                          ; 6CF4   020C 0006

L_6CF6:
        XORI    #$0010, R0                      ; 6CF6   03F8 0010
        ADDI    #$00E0, R0                      ; 6CF8   02F8 00E0
        ADDI    #$0030, R3                      ; 6CFA   02FB 0030
L_6CFC:
        MVO     R0,     G_0107                  ; 6CFC   0240 0107
        MVO     R3,     G_0300                  ; 6CFE   0243 0300
        PULR    R7                              ; 6D00   02B7
L_6D01:
        ANDI    #$0004, R1                      ; 6D01   03B9 0004
        BNEQ    L_6CFC                          ; 6D03   022C 0008
        B       L_6CF6                          ; 6D05   0220 0010

L_6D07:
        PSHR    R5                              ; 6D07   0275
        MVI     G_01EE, R0                      ; 6D08   0280 01EE
        ANDI    #$0018, R0                      ; 6D0A   03B8 0018
        BNEQ    L_6D3B                          ; 6D0C   020C 002D

        MVI     G_0107, R0                      ; 6D0E   0280 0107
        ANDI    #$0007, R0                      ; 6D10   03B8 0007
        CMPI    #$0004, R0                      ; 6D12   0378 0004
        BEQ     L_6D3B                          ; 6D14   0204 0025

        MVI     G_0320, R0                      ; 6D16   0280 0320
        ANDI    #$001F, R0                      ; 6D18   03B8 001F
        BNEQ    L_6D3B                          ; 6D1A   020C 001F

        MVI     G_0108, R1                      ; 6D1C   0281 0108
        COMR    R1                              ; 6D1E   0019
        MOVR    R1,     R0                      ; 6D1F   0088
        ANDI    #$00F0, R0                      ; 6D20   03B8 00F0
        BNEQ    L_6D3B                          ; 6D22   020C 0017

        ANDI    #$000F, R1                      ; 6D24   03B9 000F
        BEQ     L_6D3B                          ; 6D26   0204 0013

        CLRR    R1                              ; 6D28   01C9
        SDBD                                    ; 6D29   0001
        MVII    #$5093, R3                      ; 6D2A   02BB 0093 0050

        JSR     R5,     .HEADER                 ; 6D2D   0004 0150 0000

        MVII    #$0117, R1                      ; 6D30   02B9 0117
        ADD     G_013C, R1                      ; 6D32   02C1 013C
        MVII    #$0001, R3                      ; 6D34   02BB 0001
        MVII    #$0405, R0                      ; 6D36   02B8 0005 0004
        CMPR    R2,     R4                      ; 6D39   0154
        DECR    R3                              ; 6D3A   0013
L_6D3B:
        MVII    #$0034, R1                      ; 6D3B   02B9 0034
        MVI     G_0106, R0                      ; 6D3D   0280 0106
        TSTR    R0                              ; 6D3F   0080
        BEQ     L_6D44                          ; 6D40   0204 0002

        MVII    #$0006, R1                      ; 6D42   02B9 0006
L_6D44:
        MVI     G_01EE, R0                      ; 6D44   0280 01EE
        ANDI    #$0040, R0                      ; 6D46   03B8 0040
        BEQ     L_6D83                          ; 6D48   0204 0039

        MVII    #$0116, R4                      ; 6D4A   02BC 0116
        ADD     G_013C, R4                      ; 6D4C   02C4 013C
        MVII    #$0006, R3                      ; 6D4E   02BB 0006

        JSR     R5,     L_6DA9                  ; 6D50   0004 016C 01A9

        MVI     G_0155, R0                      ; 6D53   0280 0155
        TSTR    R0                              ; 6D55   0080
        BNEQ    L_6D63                          ; 6D56   020C 000B

        INCR    R0                              ; 6D58   0008
        MVO     R0,     G_0155                  ; 6D59   0240 0155
        MVI     G_0124, R0                      ; 6D5B   0280 0124
        TSTR    R0                              ; 6D5D   0080
        BEQ     L_6D64                          ; 6D5E   0204 0004

        DECR    R0                              ; 6D60   0010
        MVO     R0,     G_0124                  ; 6D61   0240 0124
L_6D63:
        PULR    R7                              ; 6D63   02B7
L_6D64:
        MVI     G_0125, R0                      ; 6D64   0280 0125
        TSTR    R0                              ; 6D66   0080
        BEQ     L_6D71                          ; 6D67   0204 0008

        DECR    R0                              ; 6D69   0010
        MVO     R0,     G_0125                  ; 6D6A   0240 0125
        MVII    #$0009, R0                      ; 6D6C   02B8 0009
        MVO     R0,     G_0124                  ; 6D6E   0240 0124
        PULR    R7                              ; 6D70   02B7
L_6D71:
        MVI     G_0320, R0                      ; 6D71   0280 0320
        ANDI    #$0010, R0                      ; 6D73   03B8 0010
        BNEQ    L_6D82                          ; 6D75   020C 000B

        SDBD                                    ; 6D77   0001
        MVII    #$50B5, R3                      ; 6D78   02BB 00B5 0050
        CLRR    R1                              ; 6D7B   01C9

        JSR     R5,     .HEADER                 ; 6D7C   0004 0150 0000
        JSR     R5,     L_6DF2                  ; 6D7F   0004 016C 01F2

L_6D82:
        PULR    R7                              ; 6D82   02B7
L_6D83:
        CLRR    R0                              ; 6D83   01C0
        MVO     R0,     G_0155                  ; 6D84   0240 0155
        MVII    #$0122, R4                      ; 6D86   02BC 0122
        MVII    #$0004, R3                      ; 6D88   02BB 0004

        JSR     R5,     L_6DA9                  ; 6D8A   0004 016C 01A9

        MVI     G_0106, R0                      ; 6D8D   0280 0106
        TSTR    R0                              ; 6D8F   0080
        BEQ     L_6D9C                          ; 6D90   0204 000A

        SDBD                                    ; 6D92   0001
        MVII    #$0801, R0                      ; 6D93   02B8 0001 0008
        MVO     R0,     .BTAB.05                ; 6D96   0240 0205
        MVO     R0,     .BTAB.06                ; 6D98   0240 0206
        B       L_6DA8                          ; 6D9A   0200 000C

L_6D9C:
        SDBD                                    ; 6D9C   0001
        MVII    #$3C5C, R0                      ; 6D9D   02B8 005C 003C
        MVO     R0,     .BTAB.05                ; 6DA0   0240 0205
        SDBD                                    ; 6DA2   0001
        MVII    #$3C2C, R0                      ; 6DA3   02B8 002C 003C
        MVO     R0,     .BTAB.06                ; 6DA6   0240 0206
L_6DA8:
        PULR    R7                              ; 6DA8   02B7
L_6DA9:
        PSHR    R5                              ; 6DA9   0275
        SWAP    R1,     1                       ; 6DAA   0041
        MOVR    R1,     R5                      ; 6DAB   008D
        MVII    #$0200, R1                      ; 6DAC   02B9 0200
        ADDR    R3,     R1                      ; 6DAE   00D9
L_6DAF:
        MVI@    R4,     R2                      ; 6DAF   02A2
        ADDI    #$0010, R2                      ; 6DB0   02FA 0010
        SLL     R2,     2                       ; 6DB2   004E
        SLL     R2,     1                       ; 6DB3   004A
        MVI     G_013C, R0                      ; 6DB4   0280 013C
        TSTR    R0                              ; 6DB6   0080
        BNEQ    L_6DBB                          ; 6DB7   020C 0002

        XORI    #$0007, R2                      ; 6DB9   03FA 0007
L_6DBB:
        ADDR    R5,     R2                      ; 6DBB   00EA
        MVO@    R2,     R1                      ; 6DBC   024A
        PSHR    R1                              ; 6DBD   0271
        MVII    #$00F8, R0                      ; 6DBE   02B8 00F8
        COMR    R0                              ; 6DC0   0018
        ANDR    R0,     R2                      ; 6DC1   0182
        MVII    #$0139, R1                      ; 6DC2   02B9 0139
        ADD     G_013C, R1                      ; 6DC4   02C1 013C
        MVI@    R1,     R0                      ; 6DC6   0288
        ADDI    #$0010, R0                      ; 6DC7   02F8 0010
        SLL     R0,     1                       ; 6DC9   0048
        SLL     R0,     2                       ; 6DCA   004C
        ADDR    R0,     R2                      ; 6DCB   00C2
        MVO     R2,     .BTAB.15                ; 6DCC   0242 0215
        PULR    R1                              ; 6DCE   02B1
        DECR    R1                              ; 6DCF   0011
        DECR    R3                              ; 6DD0   0013
        BNEQ    L_6DAF                          ; 6DD1   022C 0023

        PULR    R7                              ; 6DD3   02B7
L_6DD4:
        PSHR    R5                              ; 6DD4   0275
        SDBD                                    ; 6DD5   0001
        MVII    #$50A3, R3                      ; 6DD6   02BB 00A3 0050
        CLRR    R1                              ; 6DD9   01C9

        JSR     R5,     .HEADER                 ; 6DDA   0004 0150 0000
        JSR     R5,     L_5125                  ; 6DDD   0004 0150 0125

        MVII    #$0009, R2                      ; 6DE0   02BA 0009
        MVI     G_0107, R0                      ; 6DE2   0280 0107
        SARC    R0,     1                       ; 6DE4   0078
        BNC     L_6DE8                          ; 6DE5   0209 0001

        ADDR    R2,     R2                      ; 6DE7   00D2
L_6DE8:
        MVO     R2,     G_012D                  ; 6DE8   0242 012D
        CLRR    R0                              ; 6DEA   01C0
        MVO     R0,     G_0107                  ; 6DEB   0240 0107
        MVII    #$0008, R2                      ; 6DED   02BA 0008
        MVO     R2,     G_0320                  ; 6DEF   0242 0320
        PULR    R7                              ; 6DF1   02B7
L_6DF2:
        PSHR    R5                              ; 6DF2   0275
        CLRR    R0                              ; 6DF3   01C0
        MVO     R0,     G_0154                  ; 6DF4   0240 0154
        MVO     R0,     G_0107                  ; 6DF6   0240 0107
        MVO     R0,     G_01E5                  ; 6DF8   0240 01E5

        JSR     R5,     L_5125                  ; 6DFA   0004 0150 0125

        MVII    #$0030, R3                      ; 6DFD   02BB 0030
        MVO     R3,     G_012E                  ; 6DFF   0243 012E
        CLRR    R0                              ; 6E01   01C0
        XORI    #$0010, R0                      ; 6E02   03F8 0010
        MVO     R0,     G_0320                  ; 6E04   0240 0320
        SDBD                                    ; 6E06   0001
        MVII    #$6C93, R4                      ; 6E07   02BC 0093 006C
        SDBD                                    ; 6E0A   0001
        MVII    #$3950, R5                      ; 6E0B   02BD 0050 0039
        MVII    #$0020, R0                      ; 6E0E   02B8 0020
        PSHR    R5                              ; 6E10   0275

        JSR     R5,     L_6FCC                  ; 6E11   0004 016C 03CC

        SDBD                                    ; 6E14   0001
        MVII    #$0962, R2                      ; 6E15   02BA 0062 0009
        MVO     R2,     G_0300                  ; 6E18   0242 0300
        SDBD                                    ; 6E1A   0001
        MVII    #$0957, R2                      ; 6E1B   02BA 0057 0009
        MVO     R2,     G_0301                  ; 6E1E   0242 0301
        MVI     G_02F8, R2                      ; 6E20   0282 02F8
        SDBD                                    ; 6E22   0001
        ANDI    #$07FF, R2                      ; 6E23   03BA 00FF 0007
        MVO     R2,     G_02F8                  ; 6E26   0242 02F8
        MVII    #$02F2, R4                      ; 6E28   02BC 02F2
        MVII    #$0006, R0                      ; 6E2A   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 6E2C   0004 0114 0338
        JSR     R5,     G_7972                  ; 6E2F   0004 0178 0172

        CLRR    R0                              ; 6E32   01C0
        MVO     R0,     G_0315                  ; 6E33   0240 0315
        MVO     R0,     G_0316                  ; 6E35   0240 0316
        PULR    R7                              ; 6E37   02B7
L_6E38:
        MVI     G_01EE, R2                      ; 6E38   0282 01EE
        ANDI    #$0001, R2                      ; 6E3A   03BA 0001
        BEQ     L_6E90                          ; 6E3C   0204 0052

        MVI     G_02F7, R2                      ; 6E3E   0282 02F7
        MVI     G_02FF, R3                      ; 6E40   0283 02FF
        MVI     G_0151, R1                      ; 6E42   0281 0151
        TSTR    R1                              ; 6E44   0089
        BNEQ    L_6E91                          ; 6E45   020C 004A

        MVI     G_0152, R1                      ; 6E47   0281 0152
        MOVR    R1,     R0                      ; 6E49   0088
        ANDI    #$007F, R1                      ; 6E4A   03B9 007F
        BEQ     L_6E95                          ; 6E4C   0204 0047

        DECR    R0                              ; 6E4E   0010
        MVO     R0,     G_0152                  ; 6E4F   0240 0152
        CLRR    R5                              ; 6E51   01ED
        DECR    R5                              ; 6E52   0015
        ANDI    #$0080, R0                      ; 6E53   03B8 0080
        BEQ     L_6E58                          ; 6E55   0204 0001

        NEGR    R5                              ; 6E57   0025
L_6E58:
        ADDR    R5,     R2                      ; 6E58   00EA
        ADDR    R5,     R3                      ; 6E59   00EB
        MVO     R2,     G_02F7                  ; 6E5A   0242 02F7
        MVO     R3,     G_02FF                  ; 6E5C   0243 02FF
        MOVR    R3,     R2                      ; 6E5E   009A
        MVI     G_0307, R3                      ; 6E5F   0283 0307
        XORI    #$0008, R3                      ; 6E61   03FB 0008
        MVO     R3,     G_0307                  ; 6E63   0243 0307
        SUBI    #$0004, R2                      ; 6E65   033A 0004
        MVII    #$0003, R1                      ; 6E67   02B9 0003

        JSR     R5,     L_51C3                  ; 6E69   0004 0150 01C3

        BNC     L_6E85                          ; 6E6C   0209 0017

        MVI     G_0310, R1                      ; 6E6E   0281 0310
        ANDI    #$0080, R1                      ; 6E70   03B9 0080
        BEQ     L_6E85                          ; 6E72   0204 0011

        CLRR    R1                              ; 6E74   01C9
        SDBD                                    ; 6E75   0001
        MVII    #$50B5, R3                      ; 6E76   02BB 00B5 0050

        JSR     R5,     .HEADER                 ; 6E79   0004 0150 0000

        MVI     G_0320, R1                      ; 6E7C   0281 0320
        XORI    #$0010, R1                      ; 6E7E   03F9 0010
        MVO     R1,     G_0320                  ; 6E80   0241 0320

        JSR     R5,     L_6DF2                  ; 6E82   0004 016C 01F2

L_6E85:
        MVI     G_031E, R1                      ; 6E85   0281 031E
        MOVR    R1,     R0                      ; 6E87   0088
L_6E88:
        ANDI    #$000F, R1                      ; 6E88   03B9 000F
        ANDI    #$0070, R0                      ; 6E8A   03B8 0070
        BNEQ    L_6E90                          ; 6E8C   020C 0002

        MVO     R1,     G_0151                  ; 6E8E   0241 0151
L_6E90:
        PULR    R7                              ; 6E90   02B7
L_6E91:
        DECR    R1                              ; 6E91   0011
        MVO     R1,     G_0151                  ; 6E92   0241 0151
        PULR    R7                              ; 6E94   02B7
L_6E95:
        XORI    #$0080, R0                      ; 6E95   03F8 0080
        ADDI    #$001C, R0                      ; 6E97   02F8 001C
        MVO     R0,     G_0152                  ; 6E99   0240 0152
        SDBD                                    ; 6E9B   0001
        MVII    #$613F, R4                      ; 6E9C   02BC 003F 0061
        ANDI    #$0080, R0                      ; 6E9F   03B8 0080
        BEQ     L_6EA7                          ; 6EA1   0204 0004

        SDBD                                    ; 6EA3   0001
        MVII    #$6CB3, R4                      ; 6EA4   02BC 00B3 006C
L_6EA7:
        SDBD                                    ; 6EA7   0001
        MVII    #$3800, R5                      ; 6EA8   02BD 0000 0038
        MVII    #$0010, R0                      ; 6EAB   02B8 0010
        PSHR    R5                              ; 6EAD   0275

        JSR     R5,     L_6FCC                  ; 6EAE   0004 016C 03CC

        PULR    R7                              ; 6EB1   02B7
L_6EB2:
        PSHR    R5                              ; 6EB2   0275
L_6EB3:
        MVI@    R3,     R1                      ; 6EB3   0299
        MVI@    R1,     R4                      ; 6EB4   028C
        MOVR    R4,     R5                      ; 6EB5   00A5
        INCR    R1                              ; 6EB6   0009
        MVO@    R1,     R3                      ; 6EB7   0259
        ANDI    #$003F, R4                      ; 6EB8   03BC 003F
        SUBR    R4,     R5                      ; 6EBA   0125
        TSTR    R5                              ; 6EBB   00AD
        BEQ     L_6EDB                          ; 6EBC   0204 001D

        CMPI    #$0040, R5                      ; 6EBE   037D 0040
        BEQ     L_6EF7                          ; 6EC0   0204 0035

        CMPI    #$0080, R5                      ; 6EC2   037D 0080
        BEQ     L_6EFD                          ; 6EC4   0204 0037

        CMPI    #$00C0, R5                      ; 6EC6   037D 00C0
        BEQ     L_6F15                          ; 6EC8   0204 004B

        CMPI    #$0100, R5                      ; 6ECA   037D 0100
        BEQ     L_6F23                          ; 6ECC   0204 0055

        CMPI    #$0140, R5                      ; 6ECE   037D 0140
        BEQ     L_6F32                          ; 6ED0   0204 0060

        CMPI    #$0180, R5                      ; 6ED2   037D 0180
        BEQ     L_6F44                          ; 6ED4   0204 006E

        CMPI    #$01C0, R5                      ; 6ED6   037D 01C0
        BEQ     L_6F60                          ; 6ED8   0204 0086

        PULR    R7                              ; 6EDA   02B7
L_6EDB:
        MOVR    R4,     R1                      ; 6EDB   00A1
        MVO     R4,     G_0311                  ; 6EDC   0244 0311

        JSR     R5,     L_6EEA                  ; 6EDE   0004 016C 02EA

        ADDI    #$0008, R2                      ; 6EE1   02FA 0008
        MOVR    R4,     R1                      ; 6EE3   00A1
        SLR     R1,     2                       ; 6EE4   0065
        SLR     R1,     1                       ; 6EE5   0061

        JSR     R5,     L_6EEA                  ; 6EE6   0004 016C 02EA

        PULR    R7                              ; 6EE9   02B7
L_6EEA:
        MVI@    R2,     R0                      ; 6EEA   0290
        ANDI    #$0007, R1                      ; 6EEB   03B9 0007
        CMPI    #$0004, R1                      ; 6EED   0379 0004
        BNC     L_6EF4                          ; 6EEF   0209 0003

        ANDI    #$0003, R1                      ; 6EF1   03B9 0003
        NEGR    R1                              ; 6EF3   0021
L_6EF4:
        ADDR    R1,     R0                      ; 6EF4   00C8
        MVO@    R0,     R2                      ; 6EF5   0250
        MOVR    R5,     R7                      ; 6EF6   00AF
L_6EF7:
        MOVR    R1,     R4                      ; 6EF7   008C
        SDBD                                    ; 6EF8   0001
        MVI@    R4,     R1                      ; 6EF9   02A1
        MVO@    R1,     R3                      ; 6EFA   0259
        B       L_6EB3                          ; 6EFB   0220 0049

L_6EFD:
        MOVR    R1,     R4                      ; 6EFD   008C
        MVI@    R4,     R5                      ; 6EFE   02A5
        MVI@    R2,     R0                      ; 6EFF   0290
        SDBD                                    ; 6F00   0001
        ANDI    #$0700, R0                      ; 6F01   03B8 0000 0007
        ADDR    R5,     R0                      ; 6F04   00E8
        MVO@    R0,     R2                      ; 6F05   0250
        ADDI    #$0008, R2                      ; 6F06   02FA 0008
        MVI@    R4,     R5                      ; 6F08   02A5
        MVI@    R2,     R0                      ; 6F09   0290
        SDBD                                    ; 6F0A   0001
        ANDI    #$0F80, R0                      ; 6F0B   03B8 0080 000F
        ADDR    R5,     R0                      ; 6F0E   00E8
        MVO@    R0,     R2                      ; 6F0F   0250
        MVO@    R4,     R3                      ; 6F10   025C
        SUBI    #$0008, R2                      ; 6F11   033A 0008
        B       L_6EB3                          ; 6F13   0220 0061

L_6F15:
        MOVR    R4,     R0                      ; 6F15   00A0
        SWAP    R0,     1                       ; 6F16   0040
        SLL     R0,     2                       ; 6F17   004C
        ADDI    #$0008, R2                      ; 6F18   02FA 0008
        MVI@    R2,     R1                      ; 6F1A   0291
        ANDI    #$03FF, R1                      ; 6F1B   03B9 03FF
        ADDR    R0,     R1                      ; 6F1D   00C1
        MVO@    R1,     R2                      ; 6F1E   0251
        SUBI    #$0008, R2                      ; 6F1F   033A 0008
        B       L_6EB3                          ; 6F21   0220 006F

L_6F23:
        JSR     R5,     G_7F7B                  ; 6F23   0004 017C 037B

        TSTR    R4                              ; 6F26   00A4
        BNEQ    L_6F6F                          ; 6F27   020C 0046

L_6F29:
        ANDI    #$0001, R0                      ; 6F29   03B8 0001
        BNEQ    L_6EF7                          ; 6F2B   022C 0035

        ADDI    #$0002, R1                      ; 6F2D   02F9 0002
        MVO@    R1,     R3                      ; 6F2F   0259
        B       L_6EB3                          ; 6F30   0220 007E

L_6F32:
        MVI@    R1,     R0                      ; 6F32   0288
        INCR    R1                              ; 6F33   0009
        MVO@    R1,     R3                      ; 6F34   0259
        ADDI    #$0200, R0                      ; 6F35   02F8 0200
        MOVR    R0,     R1                      ; 6F37   0081
        MVI@    R1,     R5                      ; 6F38   028D
        SDBD                                    ; 6F39   0001
        ANDI    #$3E07, R5                      ; 6F3A   03BD 0007 003E
        MOVR    R4,     R0                      ; 6F3D   00A0
        SLL     R0,     2                       ; 6F3E   004C
        SLL     R0,     1                       ; 6F3F   0048
        ADDR    R0,     R5                      ; 6F40   00C5
        MVO@    R5,     R1                      ; 6F41   024D
        B       L_6EB3                          ; 6F42   0220 0090

L_6F44:
        ADDI    #$0010, R2                      ; 6F44   02FA 0010
        MOVR    R4,     R0                      ; 6F46   00A0
        MOVR    R1,     R4                      ; 6F47   008C
        MVI@    R2,     R1                      ; 6F48   0291
        SDBD                                    ; 6F49   0001
        ANDI    #$2800, R1                      ; 6F4A   03B9 0000 0028
        SLL     R0,     2                       ; 6F4D   004C
        SLL     R0,     1                       ; 6F4E   0048
        ADDR    R0,     R1                      ; 6F4F   00C1
        MVI@    R4,     R0                      ; 6F50   02A0
        MVO@    R4,     R3                      ; 6F51   025C
        MOVR    R0,     R4                      ; 6F52   0084
        ANDI    #$0007, R4                      ; 6F53   03BC 0007
        ADDR    R4,     R1                      ; 6F55   00E1
        ANDI    #$0008, R0                      ; 6F56   03B8 0008
        SWAP    R0,     1                       ; 6F58   0040
        SLL     R0,     1                       ; 6F59   0048
        ADDR    R0,     R1                      ; 6F5A   00C1
        MVO@    R1,     R2                      ; 6F5B   0251
        SUBI    #$0010, R2                      ; 6F5C   033A 0010
        B       L_6EB3                          ; 6F5E   0220 00AC

L_6F60:
        PSHR    R5                              ; 6F60   0275
        PSHR    R3                              ; 6F61   0273
        SDBD                                    ; 6F62   0001
        MVII    #$509F, R3                      ; 6F63   02BB 009F 0050
        MVII    #$0001, R1                      ; 6F66   02B9 0001

        JSR     R5,     .HEADER                 ; 6F68   0004 0150 0000

        PULR    R3                              ; 6F6B   02B3
        PULR    R5                              ; 6F6C   02B5
        B       L_6EB3                          ; 6F6D   0220 00BB

L_6F6F:
        PSHR    R1                              ; 6F6F   0271
        SDBD                                    ; 6F70   0001
        MVII    #$7FB0, R1                      ; 6F71   02B9 00B0 007F
        ADD     G_0126, R1                      ; 6F74   02C1 0126
        MVI@    R1,     R0                      ; 6F76   0288
        SWAP    R0,     1                       ; 6F77   0040
        ANDI    #$0003, R0                      ; 6F78   03B8 0003
        AND     G_031E, R0                      ; 6F7A   0380 031E
        PULR    R1                              ; 6F7C   02B1
        B       L_6F29                          ; 6F7D   0220 0055

        DECLE   $0005                           ; 6F7F   0005

        CLRC                                    ; 6F80   0006
        SETC                                    ; 6F81   0007
        SETC                                    ; 6F82   0007
        INCR    R1                              ; 6F83   0009
        INCR    R1                              ; 6F84   0009
        INCR    R2                              ; 6F85   000A
        INCR    R3                              ; 6F86   000B
        SUBR    R0,     R0                      ; 6F87   0100
        SWAP    R3,     1                       ; 6F88   0043
        SLL     R3,     2                       ; 6F89   004F
        RLC     R0,     1                       ; 6F8A   0050
        SLLC    R1,     1                       ; 6F8B   0059
        RLC     R2,     1                       ; 6F8C   0052
        SLL     R1,     1                       ; 6F8D   0049
        SWAP    R3,     2                       ; 6F8E   0047
        SLL     R0,     1                       ; 6F8F   0048
        RLC     R0,     2                       ; 6F90   0054
        NEGR    R0                              ; 6F91   0020
        GSWD    R1                              ; 6F92   0031
        RSWD    R1                              ; 6F93   0039
        RSWD    R0                              ; 6F94   0038
        GSWD    R3                              ; 6F95   0033
        NEGR    R0                              ; 6F96   0020
        RLC     R3,     1                       ; 6F97   0053
        SWAP    R1,     2                       ; 6F98   0045
        SWAP    R3,     2                       ; 6F99   0047
        SWAP    R1,     1                       ; 6F9A   0041
L_6F9B:
        NEGR    R0                              ; 6F9B   0020
        SWAP    R1,     2                       ; 6F9C   0045
        SLL     R2,     2                       ; 6F9D   004E
        RLC     R0,     2                       ; 6F9E   0054
        SWAP    R1,     2                       ; 6F9F   0045
        RLC     R2,     1                       ; 6FA0   0052
        RLC     R0,     1                       ; 6FA1   0050
        RLC     R2,     1                       ; 6FA2   0052
        SLL     R1,     1                       ; 6FA3   0049
        RLC     R3,     1                       ; 6FA4   0053
        SWAP    R1,     2                       ; 6FA5   0045
        RLC     R3,     1                       ; 6FA6   0053
        NEGR    R0                              ; 6FA7   0020
        SLL     R1,     1                       ; 6FA8   0049
        SLL     R2,     2                       ; 6FA9   004E
        SWAP    R3,     1                       ; 6FAA   0043
        ADCR    R6                              ; 6FAB   002E
        NEGR    R0                              ; 6FAC   0020
        SWAP    R2,     1                       ; 6FAD   0042
        SWAP    R1,     2                       ; 6FAE   0045
        SWAP    R3,     1                       ; 6FAF   0043
        SLL     R3,     1                       ; 6FB0   004B
        ADCR    R5                              ; 6FB1   002D
        RLC     R0,     2                       ; 6FB2   0054
        SWAP    R1,     2                       ; 6FB3   0045
        SWAP    R3,     1                       ; 6FB4   0043
        SLL     R0,     1                       ; 6FB5   0048
        NEGR    R0                              ; 6FB6   0020
        SLL     R1,     2                       ; 6FB7   004D
        SLL     R1,     1                       ; 6FB8   0049
L_6FB9:
        SLL     R3,     1                       ; 6FB9   004B
        SWAP    R1,     2                       ; 6FBA   0045
        NEGR    R0                              ; 6FBB   0020
        SLL     R2,     2                       ; 6FBC   004E
        ADCR    R4                              ; 6FBD   002C
        RLC     R3,     1                       ; 6FBE   0053
L_6FBF:
        PSHR    R1                              ; 6FBF   0271
        PSHR    R0                              ; 6FC0   0270
        MVII    #$01EF, R1                      ; 6FC1   02B9 01EF
        CLRR    R0                              ; 6FC3   01C0
        MVO@    R0,     R1                      ; 6FC4   0248
L_6FC5:
        MVI@    R1,     R0                      ; 6FC5   0288
        TSTR    R0                              ; 6FC6   0080
        BEQ     L_6FC5                          ; 6FC7   0224 0003

        PULR    R0                              ; 6FC9   02B0
        PULR    R1                              ; 6FCA   02B1
        MOVR    R5,     R7                      ; 6FCB   00AF
L_6FCC:
        MOVR    R5,     R3                      ; 6FCC   00AB

        JSR     R5,     L_6FBF                  ; 6FCD   0004 016C 03BF

        PULR    R5                              ; 6FD0   02B5
L_6FD1:
        MVI@    R4,     R2                      ; 6FD1   02A2
        MVO@    R2,     R5                      ; 6FD2   026A
        DECR    R0                              ; 6FD3   0010
        BNEQ    L_6FD1                          ; 6FD4   022C 0004

        MOVR    R3,     R7                      ; 6FD6   009F
L_6FD7:
        PSHR    R5                              ; 6FD7   0275
        MVI     G_0126, R1                      ; 6FD8   0281 0126
        CMPI    #$0003, R1                      ; 6FDA   0379 0003
        BMI     L_6FE1                          ; 6FDC   020B 0003
        J       L_6E38                          ; 6FDE   0004 036C 0238

L_6FE1:
        MVI     G_0320, R1                      ; 6FE1   0281 0320
        ANDI    #$0002, R1                      ; 6FE3   03B9 0002
        BEQ     L_6FFB                          ; 6FE5   0204 0014

        MVII    #$030B, R3                      ; 6FE7   02BB 030B
        MVII    #$02F7, R2                      ; 6FE9   02BA 02F7

        JSR     R5,     L_6EB2                  ; 6FEB   0004 016C 02B2

        MVI@    R3,     R1                      ; 6FEE   0299
        SDBD                                    ; 6FEF   0001
        CMPI    #$6895, R1                      ; 6FF0   0379 0095 0068
        BNEQ    L_6FFB                          ; 6FF3   020C 0006

        MVI     G_0320, R3                      ; 6FF5   0283 0320
        XORI    #$0002, R3                      ; 6FF7   03FB 0002
        MVO     R3,     G_0320                  ; 6FF9   0243 0320
L_6FFB:
        PULR    R7                              ; 6FFB   02B7
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFC   0000 0000 0000 0000

        ORG     $D000

        DIS                                     ; D000   0003
        SDBD                                    ; D001   0001
        MVII    #$0340, R6                      ; D002   02BE 0040 0003
        SDBD                                    ; D005   0001
        MVII    #$7216, R0                      ; D006   02B8 0016 0072
        MVO     R0,     .ISRVEC.0               ; D009   0240 0100
        SWAP    R0,     1                       ; D00B   0040
        MVO     R0,     .ISRVEC.1               ; D00C   0240 0101
        CLRR    R1                              ; D00E   01C9
        MVO     R1,     G_0159                  ; D00F   0241 0159
        DECR    R1                              ; D011   0011
        MVO     R1,     G_031E                  ; D012   0241 031E
        MVII    #$023D, R0                      ; D014   02B8 023D
        MVII    #$0102, R4                      ; D016   02BC 0102

        JSR     R5,     X_FILL_ZERO             ; D018   0004 0114 0338

        MVI     .PSG0.rgt_hand,R1               ; D01B   0281 01FE
        CMPI    #$005A, R1                      ; D01D   0379 005A
        BNEQ    L_D023                          ; D01F   020C 0002

        MVO     R1,     G_0153                  ; D021   0241 0153
L_D023:
        EIS                                     ; D023   0002

        JSR     R5,     L_6FBF                  ; D024   0004 016C 03BF

        MVI     .STIC.VIDEN,R0                  ; D027   0280 0020
        MVII    #$0001, R0                      ; D029   02B8 0001

        JSR     R5,     L_6FBF                  ; D02B   0004 016C 03BF
        JSR     R5,     L_6FBF                  ; D02E   0004 016C 03BF

        MVO     R0,     .STIC.MODE              ; D031   0240 0021
        DECR    R0                              ; D033   0010
        MVO     R0,     .STIC.HDLY              ; D034   0240 0030
        MVO     R0,     .STIC.VDLY              ; D036   0240 0031
        MVO     R0,     .STIC.EDGE              ; D038   0240 0032
        SDBD                                    ; D03A   0001
        MVII    #$721B, R0                      ; D03B   02B8 001B 0072
        MVO     R0,     .ISRVEC.0               ; D03E   0240 0100
        SWAP    R0,     1                       ; D040   0040
        MVO     R0,     .ISRVEC.1               ; D041   0240 0101
        J       L_52BE                          ; D043   0004 0350 02BE

        DIS                                     ; D046   0003
        SDBD                                    ; D047   0001
        MVII    #$7216, R0                      ; D048   02B8 0016 0072
        MVO     R0,     .ISRVEC.0               ; D04B   0240 0100
        SWAP    R0,     1                       ; D04D   0040
        MVO     R0,     .ISRVEC.1               ; D04E   0240 0101
        EIS                                     ; D050   0002
        CLRR    R0                              ; D051   01C0
        MVO     R0,     G_014E                  ; D052   0240 014E
        MVO     R0,     G_0106                  ; D054   0240 0106
        MVO     R0,     G_012E                  ; D056   0240 012E

        JSR     R5,     L_6FBF                  ; D058   0004 016C 03BF
        JSR     R5,     L_5D09                  ; D05B   0004 015C 0109

        CLRR    R0                              ; D05E   01C0
        MVO     R0,     .STIC.C.0               ; D05F   0240 0018
        MVII    #$000D, R0                      ; D061   02B8 000D
        MVO     R0,     .STIC.BORD              ; D063   0240 002C

        JSR     R5,     G_7CEA                  ; D065   0004 017C 00EA
        JSR     R5,     G_722F                  ; D068   0004 0170 022F

        MVII    #$0109, R4                      ; D06B   02BC 0109
        MVII    #$0009, R0                      ; D06D   02B8 0009

        JSR     R5,     X_FILL_ZERO             ; D06F   0004 0114 0338

        MVII    #$0008, R1                      ; D072   02B9 0008
        SDBD                                    ; D074   0001
        MVII    #$613F, R4                      ; D075   02BC 003F 0061
        SDBD                                    ; D078   0001
        MVII    #$3800, R5                      ; D079   02BD 0000 0038
L_D07C:
        MVII    #$0040, R0                      ; D07C   02B8 0040
        PSHR    R5                              ; D07E   0275

        JSR     R5,     L_6FCC                  ; D07F   0004 016C 03CC

        PSHR    R5                              ; D082   0275

        JSR     R5,     L_5D09                  ; D083   0004 015C 0109

        PULR    R5                              ; D086   02B5
        DECR    R1                              ; D087   0011
        BNEQ    L_D07C                          ; D088   022C 000D

        SDBD                                    ; D08A   0001
        MVII    #$5D7F, R4                      ; D08B   02BC 007F 005D

        JSR     R5,     G_709F                  ; D08E   0004 0170 009F

        DIS                                     ; D091   0003
        SDBD                                    ; D092   0001
        MVII    #$721B, R0                      ; D093   02B8 001B 0072
        MVO     R0,     .ISRVEC.0               ; D096   0240 0100
        SWAP    R0,     1                       ; D098   0040
        MVO     R0,     .ISRVEC.1               ; D099   0240 0101
        EIS                                     ; D09B   0002
        J       G_70BE                          ; D09C   0004 0370 00BE

        PSHR    R5                              ; D09F   0275
        MVII    #$0200, R5                      ; D0A0   02BD 0200
        MVII    #$00F0, R3                      ; D0A2   02BB 00F0
L_D0A4:
        MVI@    R4,     R0                      ; D0A4   02A0
        MOVR    R0,     R1                      ; D0A5   0081
        ANDI    #$03F0, R0                      ; D0A6   03B8 03F0
        SUBR    R0,     R1                      ; D0A8   0101
        SAR     R0,     1                       ; D0A9   0068
        SDBD                                    ; D0AA   0001
        ADDI    #$0800, R0                      ; D0AB   02F8 0000 0008
        MOVR    R1,     R2                      ; D0AE   008A
        ANDI    #$0003, R1                      ; D0AF   03B9 0003
        SUBR    R1,     R2                      ; D0B1   010A
        SWAP    R1,     1                       ; D0B2   0041
        SLL     R1,     1                       ; D0B3   0049
        SWAP    R2,     1                       ; D0B4   0042
        SLL     R2,     2                       ; D0B5   004E
        ADDR    R1,     R0                      ; D0B6   00C8
        ADDR    R2,     R0                      ; D0B7   00D0
        ADD@    R4,     R0                      ; D0B8   02E0
        MVO@    R0,     R5                      ; D0B9   0268
        DECR    R3                              ; D0BA   0013
        BNEQ    L_D0A4                          ; D0BB   022C 0018

        PULR    R7                              ; D0BD   02B7
        EIS                                     ; D0BE   0002

L_D0BF:
        JSR     R5,     L_5427                  ; D0BF   0004 0154 0027

        MVII    #$02F0, R4                      ; D0C2   02BC 02F0
        MVII    #$0000, R1                      ; D0C4   02B9 0000
        MVII    #$0018, R0                      ; D0C6   02B8 0018
        CLRR    R2                              ; D0C8   01D2
        MVII    #$0002, R5                      ; D0C9   02BD 0002
        MVI     G_02F0, R3                      ; D0CB   0283 02F0
        MVO     R3,     G_02F1                  ; D0CD   0243 02F1
        MVI     G_02F8, R3                      ; D0CF   0283 02F8
        MOVR    R3,     R2                      ; D0D1   009A
        SDBD                                    ; D0D2   0001
        ANDI    #$0800, R2                      ; D0D3   03BA 0000 0008
        BNEQ    L_D0D9                          ; D0D6   020C 0001

        NEGR    R5                              ; D0D8   0025
L_D0D9:
        ADDR    R5,     R3                      ; D0D9   00EB
        MVO     R3,     G_02F9                  ; D0DA   0243 02F9

        JSR     R5,     L_6FBF                  ; D0DC   0004 016C 03BF

        MVI     .STIC.C.0,R3                    ; D0DF   0283 0018
        MVO     R3,     G_0310                  ; D0E1   0243 0310
        MVI     G_01EE, R3                      ; D0E3   0283 01EE
        ANDI    #$0007, R3                      ; D0E5   03BB 0007
        CMPI    #$0007, R3                      ; D0E7   037B 0007
        BNEQ    L_D0ED                          ; D0E9   020C 0002

        MVO     R2,     .STIC.C.0               ; D0EB   0242 0018

L_D0ED:
        JSR     R5,     .EXEC.730               ; D0ED   0004 0114 0330
        JSR     R5,     L_5D09                  ; D0F0   0004 015C 0109
        JSR     R5,     L_5007                  ; D0F3   0004 0150 0007
        JSR     R5,     G_7F7B                  ; D0F6   0004 017C 037B

        MVII    #$01FE, R1                      ; D0F9   02B9 01FE
        MVI     G_013C, R0                      ; D0FB   0280 013C
        SLR     R0,     2                       ; D0FD   0064
        XORI    #$0001, R0                      ; D0FE   03F8 0001
        ADDR    R0,     R1                      ; D100   00C1
        MVI@    R1,     R0                      ; D101   0288
        MVI     G_0142, R1                      ; D102   0281 0142
        MVO     R0,     G_0142                  ; D104   0240 0142
        CMPR    R1,     R0                      ; D106   0148
        BNEQ    L_D10B                          ; D107   020C 0002

        MVO     R0,     G_0108                  ; D109   0240 0108
L_D10B:
        MVI     G_012E, R1                      ; D10B   0281 012E
        TSTR    R1                              ; D10D   0089
        BEQ     L_D115                          ; D10E   0204 0005

        DECR    R1                              ; D110   0011
        MVO     R1,     G_012E                  ; D111   0241 012E
        B       L_D0BF                          ; D113   0220 0055

L_D115:
        MVI     G_0320, R1                      ; D115   0281 0320
        ANDI    #$0010, R1                      ; D117   03B9 0010
        BNEQ    L_D137                          ; D119   020C 001C

        MVI     G_0106, R1                      ; D11B   0281 0106
        TSTR    R1                              ; D11D   0089
        BNEQ    L_D17A                          ; D11E   020C 005A

        MVI     G_0320, R1                      ; D120   0281 0320
        ANDI    #$0020, R1                      ; D122   03B9 0020
        BEQ     L_D129                          ; D124   0204 0003
        J       G_7A88                          ; D126   0004 0378 0288

L_D129:
        SDBD                                    ; D129   0001
        MVII    #$7147, R5                      ; D12A   02BD 0047 0071
        MVI     G_01EE, R0                      ; D12D   0280 01EE
        ANDI    #$0007, R0                      ; D12F   03B8 0007
        ADDR    R0,     R0                      ; D131   00C0
        SDBD                                    ; D132   0001
        ADDI    #$716A, R0                      ; D133   02F8 006A 0071
        MOVR    R0,     R7                      ; D136   0087
L_D137:
        MVI     G_01EE, R0                      ; D137   0280 01EE
        INCR    R0                              ; D139   0008
        MVO     R0,     G_01EE                  ; D13A   0240 01EE
        ANDI    #$0003, R0                      ; D13C   03B8 0003
        BNEQ    L_D0BF                          ; D13E   022C 0080

        SDBD                                    ; D140   0001
        MVII    #$70BF, R5                      ; D141   02BD 00BF 0070
        PSHR    R5                              ; D144   0275
        B       L_D461                          ; D145   0200 031A

        MVI     G_01EE, R0                      ; D147   0280 01EE
        INCR    R0                              ; D149   0008
        MVO     R0,     G_01EE                  ; D14A   0240 01EE
        MVII    #$0309, R1                      ; D14C   02B9 0309
        MVII    #$0313, R2                      ; D14E   02BA 0313

        JSR     R5,     G_7223                  ; D150   0004 0170 0223

        MVII    #$02F5, R1                      ; D153   02B9 02F5
        MVII    #$0315, R2                      ; D155   02BA 0315

        JSR     R5,     G_7223                  ; D157   0004 0170 0223

        MVII    #$02FD, R1                      ; D15A   02B9 02FD
        MVII    #$0317, R2                      ; D15C   02BA 0317

        JSR     R5,     G_7223                  ; D15E   0004 0170 0223

        MVII    #$0305, R1                      ; D161   02B9 0305
        MVII    #$0319, R2                      ; D163   02BA 0319

        JSR     R5,     G_7223                  ; D165   0004 0170 0223

        B       L_D0BF                          ; D168   0220 00AA
        B       L_D19F                          ; D16A   0200 0033
        B       L_D1AD                          ; D16C   0200 003F
        B       L_D1B2                          ; D16E   0200 0042
        B       L_D1BA                          ; D170   0200 0048
        B       L_D1C2                          ; D172   0200 004E
        B       L_D1CA                          ; D174   0200 0054
        B       L_D1CF                          ; D176   0200 0057
        B       L_D1D7                          ; D178   0200 005D

L_D17A:
        SDBD                                    ; D17A   0001
        MVII    #$7188, R5                      ; D17B   02BD 0088 0071
        MVI     G_01EE, R0                      ; D17E   0280 01EE
        ANDI    #$0007, R0                      ; D180   03B8 0007
        ADDR    R0,     R0                      ; D182   00C0
        SDBD                                    ; D183   0001
        ADDI    #$718F, R0                      ; D184   02F8 008F 0071
        MOVR    R0,     R7                      ; D187   0087
        MVI     G_01EE, R0                      ; D188   0280 01EE
        INCR    R0                              ; D18A   0008
        MVO     R0,     G_01EE                  ; D18B   0240 01EE
        B       L_D0BF                          ; D18D   0220 00CF
        B       L_D1DF                          ; D18F   0200 004E
        B       L_D1ED                          ; D191   0200 005A
        B       L_D1F2                          ; D193   0200 005D
        B       L_D1F7                          ; D195   0200 0060
        B       L_D1FF                          ; D197   0200 0066
        B       L_D207                          ; D199   0200 006C
        B       L_D20C                          ; D19B   0200 006F
        B       L_D211                          ; D19D   0200 0072

L_D19F:
        PSHR    R5                              ; D19F   0275

        JSR     R5,     G_7715                  ; D1A0   0004 0174 0315
        JSR     R5,     G_74F2                  ; D1A3   0004 0174 00F2
        JSR     R5,     L_6FD7                  ; D1A6   0004 016C 03D7
        JSR     R5,     G_7F65                  ; D1A9   0004 017C 0365

        PULR    R7                              ; D1AC   02B7
L_D1AD:
        PSHR    R5                              ; D1AD   0275

        JSR     R5,     G_72DA                  ; D1AE   0004 0170 02DA

        PULR    R7                              ; D1B1   02B7
L_D1B2:
        PSHR    R5                              ; D1B2   0275

        JSR     R5,     G_77A2                  ; D1B3   0004 0174 03A2
        JSR     R5,     G_74A1                  ; D1B6   0004 0174 00A1

        PULR    R7                              ; D1B9   02B7
L_D1BA:
        PSHR    R5                              ; D1BA   0275

        JSR     R5,     G_74A1                  ; D1BB   0004 0174 00A1
        JSR     R5,     L_6FD7                  ; D1BE   0004 016C 03D7

        PULR    R7                              ; D1C1   02B7
L_D1C2:
        PSHR    R5                              ; D1C2   0275

        JSR     R5,     G_7745                  ; D1C3   0004 0174 0345
        JSR     R5,     G_7FBA                  ; D1C6   0004 017C 03BA

        PULR    R7                              ; D1C9   02B7
L_D1CA:
        PSHR    R5                              ; D1CA   0275

        JSR     R5,     G_72DA                  ; D1CB   0004 0170 02DA

        PULR    R7                              ; D1CE   02B7
L_D1CF:
        PSHR    R5                              ; D1CF   0275

        JSR     R5,     G_77A2                  ; D1D0   0004 0174 03A2
        JSR     R5,     G_74A1                  ; D1D3   0004 0174 00A1

        PULR    R7                              ; D1D6   02B7
L_D1D7:
        PSHR    R5                              ; D1D7   0275

        JSR     R5,     G_74A1                  ; D1D8   0004 0174 00A1
        JSR     R5,     L_6D07                  ; D1DB   0004 016C 0107

        PULR    R7                              ; D1DE   02B7
L_D1DF:
        PSHR    R5                              ; D1DF   0275

        JSR     R5,     G_7C7B                  ; D1E0   0004 017C 007B
        JSR     R5,     G_7C59                  ; D1E3   0004 017C 0059
        JSR     R5,     G_7745                  ; D1E6   0004 0174 0345
        JSR     R5,     G_72D3                  ; D1E9   0004 0170 02D3

        PULR    R7                              ; D1EC   02B7
L_D1ED:
        PSHR    R5                              ; D1ED   0275

        JSR     R5,     G_72DA                  ; D1EE   0004 0170 02DA

        PULR    R7                              ; D1F1   02B7
L_D1F2:
        PSHR    R5                              ; D1F2   0275

        JSR     R5,     G_77A2                  ; D1F3   0004 0174 03A2

        PULR    R7                              ; D1F6   02B7
L_D1F7:
        PSHR    R5                              ; D1F7   0275

        JSR     R5,     G_7576                  ; D1F8   0004 0174 0176
        JSR     R5,     G_7F65                  ; D1FB   0004 017C 0365

        PULR    R7                              ; D1FE   02B7
L_D1FF:
        PSHR    R5                              ; D1FF   0275

        JSR     R5,     G_7FBA                  ; D200   0004 017C 03BA
        JSR     R5,     G_72D3                  ; D203   0004 0170 02D3

        PULR    R7                              ; D206   02B7
L_D207:
        PSHR    R5                              ; D207   0275

        JSR     R5,     G_72DA                  ; D208   0004 0170 02DA

        PULR    R7                              ; D20B   02B7
L_D20C:
        PSHR    R5                              ; D20C   0275

        JSR     R5,     G_77A2                  ; D20D   0004 0174 03A2

        PULR    R7                              ; D210   02B7
L_D211:
        PSHR    R5                              ; D211   0275

        JSR     R5,     L_6D07                  ; D212   0004 016C 0107

        PULR    R7                              ; D215   02B7
        MVII    #$0001, R0                      ; D216   02B8 0001
        MVO     R0,     G_01EF                  ; D218   0240 01EF
        MOVR    R5,     R7                      ; D21A   00AF
        CLRR    R0                              ; D21B   01C0
        MVII    #$0001, R0                      ; D21C   02B8 0001
        MVO     R0,     G_01EF                  ; D21E   0240 01EF
        MVO     R0,     .STIC.VIDEN             ; D220   0240 0020
        MOVR    R5,     R7                      ; D222   00AF
        MVII    #$0002, R4                      ; D223   02BC 0002
L_D225:
        MVI@    R1,     R0                      ; D225   0288
        MVI@    R2,     R3                      ; D226   0293
        MVO@    R0,     R2                      ; D227   0250
        MVO@    R3,     R1                      ; D228   024B
        INCR    R1                              ; D229   0009
L_D22A:
        INCR    R2                              ; D22A   000A
        DECR    R4                              ; D22B   0014
        BNEQ    L_D225                          ; D22C   022C 0008

        MOVR    R5,     R7                      ; D22E   00AF
        PSHR    R5                              ; D22F   0275
        MVII    #$02F0, R5                      ; D230   02BD 02F0
        MVII    #$0018, R3                      ; D232   02BB 0018
        SDBD                                    ; D234   0001
        MVII    #$72A3, R4                      ; D235   02BC 00A3 0072
L_D238:
        SDBD                                    ; D238   0001
        MVI@    R4,     R1                      ; D239   02A1
        MVO@    R1,     R5                      ; D23A   0269
        DECR    R3                              ; D23B   0013
        BNEQ    L_D238                          ; D23C   022C 0005

        SDBD                                    ; D23E   0001
        MVII    #$66B5, R0                      ; D23F   02B8 00B5 0066
        MVO     R0,     G_030C                  ; D242   0240 030C
        SDBD                                    ; D244   0001
        MVII    #$66B9, R0                      ; D245   02B8 00B9 0066
        MVO     R0,     G_030D                  ; D248   0240 030D
        SDBD                                    ; D24A   0001
        MVII    #$66AF, R0                      ; D24B   02B8 00AF 0066
        MVO     R0,     G_030E                  ; D24E   0240 030E
        SDBD                                    ; D250   0001
        MVII    #$67F7, R0                      ; D251   02B8 00F7 0067
        MVO     R0,     G_0309                  ; D254   0240 0309
        SDBD                                    ; D256   0001
        MVII    #$6802, R0                      ; D257   02B8 0002 0068
        MVO     R0,     G_030A                  ; D25A   0240 030A
        SDBD                                    ; D25C   0001
        MVII    #$6856, R0                      ; D25D   02B8 0056 0068
        MVO     R0,     G_0313                  ; D260   0240 0313
        SDBD                                    ; D262   0001
        MVII    #$6889, R0                      ; D263   02B8 0089 0068
        MVO     R0,     G_030B                  ; D266   0240 030B
        SDBD                                    ; D268   0001
        MVII    #$6861, R0                      ; D269   02B8 0061 0068
        MVO     R0,     G_0314                  ; D26C   0240 0314
        MVII    #$0378, R0                      ; D26E   02B8 0378
        MVO     R0,     G_0315                  ; D270   0240 0315
        MVO     R0,     G_0316                  ; D272   0240 0316
        MVII    #$0000, R0                      ; D274   02B8 0000
        MVO     R0,     G_0317                  ; D276   0240 0317
        MVO     R0,     G_0318                  ; D278   0240 0318
        SDBD                                    ; D27A   0001
        MVII    #$0980, R1                      ; D27B   02B9 0080 0009
        MVO     R1,     G_0319                  ; D27E   0241 0319
        MVO     R1,     G_031A                  ; D280   0241 031A
        CLRR    R0                              ; D282   01C0
        MVO     R0,     G_013E                  ; D283   0240 013E
        MVO     R0,     G_0158                  ; D285   0240 0158
        MVI     G_0126, R1                      ; D287   0281 0126
        CMPI    #$0003, R1                      ; D289   0379 0003
        BMI     L_D2A2                          ; D28B   020B 0015

        SDBD                                    ; D28D   0001
        MVII    #$1807, R1                      ; D28E   02B9 0007 0018
        MVO     R1,     G_0307                  ; D291   0241 0307
        MVII    #$0044, R1                      ; D293   02B9 0044
        MVO     R1,     G_02FF                  ; D295   0241 02FF
        MVII    #$0358, R1                      ; D297   02B9 0358
        MVO     R1,     G_02F7                  ; D299   0241 02F7
        CLRR    R1                              ; D29B   01C9
        MVO     R1,     G_0151                  ; D29C   0241 0151
        ADDI    #$001C, R1                      ; D29E   02F9 001C
        MVO     R1,     G_0152                  ; D2A0   0241 0152
L_D2A2:
        PULR    R7                              ; D2A2   02B7
        NEGR    R0                              ; D2A3   0020
        DIS                                     ; D2A4   0003
        NEGR    R0                              ; D2A5   0020
        DIS                                     ; D2A6   0003
        MOVR    R0,     R4                      ; D2A7   0084
        DIS                                     ; D2A8   0003
        RRC     R2,     2                       ; D2A9   0076
        DIS                                     ; D2AA   0003
        MOVR    R0,     R4                      ; D2AB   0084
        DIS                                     ; D2AC   0003
        SARC    R0,     1                       ; D2AD   0078
        DIS                                     ; D2AE   0003
        SARC    R0,     1                       ; D2AF   0078
        DIS                                     ; D2B0   0003
        SLLC    R0,     1                       ; D2B1   0058
        DIS                                     ; D2B2   0003
        ADDR    R3,     R6                      ; D2B3   00DE
        DECLE   $0000                           ; D2B4   0000

        ADDR    R3,     R4                      ; D2B5   00DC
        DECLE   $0000,  $0000,  $0001,  $0000   ; D2B6   0000 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; D2BA   0001 0000 0001 0000
        DECLE   $0000,  $0000,  $0000           ; D2BE   0000 0000 0000

        RLC     R0,     1                       ; D2C1   0050
        DECLE   $0001                           ; D2C2   0001

        NEGR    R7                              ; D2C3   0027
        INCR    R1                              ; D2C4   0009
        SLR     R2,     1                       ; D2C5   0062
        INCR    R1                              ; D2C6   0009
        RRC     R3,     2                       ; D2C7   0077
        COMR    R1                              ; D2C8   0019
        RRC     R2,     2                       ; D2C9   0076
        COMR    R1                              ; D2CA   0019
        RRC     R1,     1                       ; D2CB   0071
        COMR    R1                              ; D2CC   0019
        TSTR    R0                              ; D2CD   0080
        INCR    R1                              ; D2CE   0009
        TSTR    R0                              ; D2CF   0080
        INCR    R1                              ; D2D0   0009
        SARC    R1,     1                       ; D2D1   0079
        COMR    R1                              ; D2D2   0019
        MVI     .BTAB.27,R2                     ; D2D3   0282 0227
        XORI    #$0008, R2                      ; D2D5   03FA 0008
        MVO     R2,     .BTAB.27                ; D2D7   0242 0227
        MOVR    R5,     R7                      ; D2D9   00AF
        PSHR    R5                              ; D2DA   0275
        MVI     G_0320, R0                      ; D2DB   0280 0320
        SARC    R0,     1                       ; D2DD   0078
        BC      L_D6D8                          ; D2DE   0201 03F8

        SARC    R0,     1                       ; D2E0   0078
        SARC    R0,     1                       ; D2E1   0078
        BC      L_D442                          ; D2E2   0201 015E

        SARC    R0,     1                       ; D2E4   0078
        BC      L_D445                          ; D2E5   0201 015E

        SARC    R0,     1                       ; D2E7   0078
        BC      L_D461                          ; D2E8   0201 0177

        MVI     G_0320, R0                      ; D2EA   0280 0320
        SLLC    R0,     1                       ; D2EC   0058
        BC      L_D392                          ; D2ED   0201 00A3

        JSR     R5,     G_7E65                  ; D2EF   0004 017C 0265

        TSTR    R2                              ; D2F2   0092
        BEQ     L_D306                          ; D2F3   0204 0011

        CMPI    #$0003, R2                      ; D2F5   037A 0003
        BNEQ    L_D2FE                          ; D2F7   020C 0005

        PULR    R2                              ; D2F9   02B2
        PULR    R2                              ; D2FA   02B2
        J       L_55C2                          ; D2FB   0004 0354 01C2

L_D2FE:
        MVI     G_01EE, R0                      ; D2FE   0280 01EE
        ANDI    #$000F, R0                      ; D300   03B8 000F
        CMPI    #$0001, R0                      ; D302   0378 0001
        BNEQ    L_D391                          ; D304   020C 008B

L_D306:
        MVI     G_0108, R0                      ; D306   0280 0108
        XORI    #$00FF, R0                      ; D308   03F8 00FF
        MOVR    R0,     R1                      ; D30A   0081
        CMPI    #$000F, R0                      ; D30B   0378 000F
        BMI     L_D319                          ; D30D   020B 000A

L_D30F:
        CLRR    R0                              ; D30F   01C0
        MVO     R0,     G_0150                  ; D310   0240 0150
        SDBD                                    ; D312   0001
        MVII    #$0927, R1                      ; D313   02B9 0027 0009
        MVO     R1,     G_0300                  ; D316   0241 0300
        PULR    R7                              ; D318   02B7
L_D319:
        ANDI    #$000F, R0                      ; D319   03B8 000F
        MVO     R0,     G_0150                  ; D31B   0240 0150
        BEQ     L_D30F                          ; D31D   0224 000F

        MVI     G_0300, R0                      ; D31F   0280 0300
        MOVR    R0,     R2                      ; D321   0082
        ANDI    #$01F0, R0                      ; D322   03B8 01F0
        CMPI    #$0131, R0                      ; D324   0378 0131
        BPL     L_D32C                          ; D326   0203 0004

        SDBD                                    ; D328   0001
        MVII    #$0967, R2                      ; D329   02BA 0067 0009
L_D32C:
        SUBI    #$0010, R2                      ; D32C   033A 0010
        MVO     R2,     G_0300                  ; D32E   0242 0300
        PSHR    R1                              ; D330   0271

        JSR     R5,     L_549A                  ; D331   0004 0154 009A

        PULR    R1                              ; D334   02B1
        MVI     G_02F0, R2                      ; D335   0282 02F0
        MVI     G_02F8, R3                      ; D337   0283 02F8
        CLRR    R4                              ; D339   01E4
        DECR    R4                              ; D33A   0014
        MVO     R4,     G_0322                  ; D33B   0244 0322
        SARC    R1,     1                       ; D33D   0079
        BC      L_D35A                          ; D33E   0201 001A

        SARC    R1,     1                       ; D340   0079
        BC      L_D362                          ; D341   0201 001F

        SARC    R1,     1                       ; D343   0079
        BC      L_D36B                          ; D344   0201 0025
        BEQ     L_D391                          ; D346   0204 0049

        DECR    R2                              ; D348   0012
        SDBD                                    ; D349   0001
        ANDI    #$FBFF, R3                      ; D34A   03BB 00FF 00FB
        SDBD                                    ; D34D   0001
        XORI    #$0400, R3                      ; D34E   03FB 0000 0004
        SUBI    #$0005, R4                      ; D351   033C 0005
        PSHR    R4                              ; D353   0274
        CLRR    R4                              ; D354   01E4
        MVO     R4,     G_0322                  ; D355   0244 0322
        PULR    R4                              ; D357   02B4
        B       L_D377                          ; D358   0200 001D

L_D35A:
        INCR    R2                              ; D35A   000A
        INCR    R3                              ; D35B   000B
        SDBD                                    ; D35C   0001
        ANDI    #$FBFF, R3                      ; D35D   03BB 00FF 00FB
        B       L_D377                          ; D360   0200 0015

L_D362:
        INCR    R2                              ; D362   000A
        SDBD                                    ; D363   0001
        ANDI    #$FBFF, R3                      ; D364   03BB 00FF 00FB
        SUBI    #$0003, R4                      ; D367   033C 0003
        B       L_D377                          ; D369   0200 000C

L_D36B:
        DECR    R3                              ; D36B   0013
        DECR    R2                              ; D36C   0012
        SUBI    #$0004, R4                      ; D36D   033C 0004
        SDBD                                    ; D36F   0001
        ANDI    #$FBFF, R3                      ; D370   03BB 00FF 00FB
        SDBD                                    ; D373   0001
        XORI    #$0400, R3                      ; D374   03FB 0000 0004
L_D377:
        MVO     R4,     G_0321                  ; D377   0244 0321

        JSR     R5,     G_7434                  ; D379   0004 0174 0034
        JSR     R5,     G_7761                  ; D37C   0004 0174 0361

        MVO     R1,     G_0107                  ; D37F   0241 0107
        ANDI    #$0007, R1                      ; D381   03B9 0007
        CMPI    #$0004, R1                      ; D383   0379 0004
        BEQ     L_D391                          ; D385   0204 000A

        JSR     R5,     G_7F47                  ; D387   0004 017C 0347

        TSTR    R1                              ; D38A   0089
        BNEQ    L_D391                          ; D38B   020C 0004

        MVO     R2,     G_02F0                  ; D38D   0242 02F0
        MVO     R3,     G_02F8                  ; D38F   0243 02F8
L_D391:
        PULR    R7                              ; D391   02B7
L_D392:
        MVI     G_0108, R1                      ; D392   0281 0108
        COMR    R1                              ; D394   0019
        MOVR    R1,     R0                      ; D395   0088
        ANDI    #$00F0, R0                      ; D396   03B8 00F0
        BNEQ    L_D40A                          ; D398   020C 0070

        MVI     G_02F8, R3                      ; D39A   0283 02F8
        MVI     G_0107, R0                      ; D39C   0280 0107
        MVII    #$0001, R5                      ; D39E   02BD 0001
        MOVR    R0,     R4                      ; D3A0   0084
        ANDI    #$0001, R4                      ; D3A1   03BC 0001
        BNEQ    L_D3AE                          ; D3A3   020C 0009

        MOVR    R1,     R2                      ; D3A5   008A
        SLL     R1,     1                       ; D3A6   0049
        ANDI    #$0004, R1                      ; D3A7   03B9 0004
        SLR     R2,     2                       ; D3A9   0066
        SLR     R2,     1                       ; D3AA   0062
        ANDI    #$0001, R2                      ; D3AB   03BA 0001
        ADDR    R2,     R1                      ; D3AD   00D1
L_D3AE:
        ANDI    #$0005, R1                      ; D3AE   03B9 0005
        MVI     G_02F0, R2                      ; D3B0   0282 02F0
        SARC    R1,     1                       ; D3B2   0079
        BC      L_D3BA                          ; D3B3   0201 0005

        SARC    R1,     1                       ; D3B5   0079
        SARC    R1,     1                       ; D3B6   0079
        BC      L_D40B                          ; D3B7   0201 0052

        PULR    R7                              ; D3B9   02B7
L_D3BA:
        MOVR    R0,     R4                      ; D3BA   0084
        ANDI    #$00E0, R0                      ; D3BB   03B8 00E0
        BEQ     L_D3DD                          ; D3BD   0204 001E

        SUBI    #$0020, R4                      ; D3BF   033C 0020
        MOVR    R4,     R0                      ; D3C1   00A0
        ANDI    #$0020, R4                      ; D3C2   03BC 0020
        BNEQ    L_D42C                          ; D3C4   020C 0066

L_D3C6:
        MVO     R0,     G_0107                  ; D3C6   0240 0107
        ANDI    #$0001, R0                      ; D3C8   03B8 0001
        BNEQ    L_D3D9                          ; D3CA   020C 000D

        ADDR    R5,     R3                      ; D3CC   00EB
        MVO     R3,     G_02F8                  ; D3CD   0243 02F8
        SLR     R3,     1                       ; D3CF   0063
        ANDI    #$0001, R3                      ; D3D0   03BB 0001
        BEQ     L_D40A                          ; D3D2   0204 0036

        NEGR    R5                              ; D3D4   0025
        ADDR    R5,     R2                      ; D3D5   00EA
        MVO     R2,     G_02F0                  ; D3D6   0242 02F0
        PULR    R7                              ; D3D8   02B7
L_D3D9:
        ADDR    R5,     R3                      ; D3D9   00EB
        MVO     R3,     G_02F8                  ; D3DA   0243 02F8
        PULR    R7                              ; D3DC   02B7
L_D3DD:
        MVI     G_02F8, R3                      ; D3DD   0283 02F8
        ADDR    R5,     R3                      ; D3DF   00EB
        MVO     R3,     G_02F8                  ; D3E0   0243 02F8
        SDBD                                    ; D3E2   0001
        MVII    #$625F, R4                      ; D3E3   02BC 005F 0062
        SDBD                                    ; D3E6   0001
        MVII    #$3920, R5                      ; D3E7   02BD 0020 0039
        MVII    #$0040, R0                      ; D3EA   02B8 0040
        PSHR    R5                              ; D3EC   0275

        JSR     R5,     L_6FCC                  ; D3ED   0004 016C 03CC

        MVI     G_0320, R0                      ; D3F0   0280 0320
        SDBD                                    ; D3F2   0001
        ANDI    #$7FFF, R0                      ; D3F3   03B8 00FF 007F
        MVO     R0,     G_0320                  ; D3F6   0240 0320

        JSR     R5,     G_7434                  ; D3F8   0004 0174 0034

        MVI     G_02F0, R2                      ; D3FB   0282 02F0
        MVI     G_02F8, R3                      ; D3FD   0283 02F8

        JSR     R5,     G_7761                  ; D3FF   0004 0174 0361

        MVO     R1,     G_0107                  ; D402   0241 0107
        SDBD                                    ; D404   0001
        MVII    #$0927, R0                      ; D405   02B8 0027 0009
        MVO     R0,     G_0300                  ; D408   0240 0300
L_D40A:
        PULR    R7                              ; D40A   02B7
L_D40B:
        NEGR    R5                              ; D40B   0025
        MVI     G_02F0, R2                      ; D40C   0282 02F0
        PSHR    R5                              ; D40E   0275

        JSR     R5,     G_7F47                  ; D40F   0004 017C 0347

        PULR    R5                              ; D412   02B5
        TSTR    R1                              ; D413   0089
        BEQ     L_D417                          ; D414   0204 0001

        CLRR    R5                              ; D416   01ED
L_D417:
        MOVR    R0,     R4                      ; D417   0084
        ADDI    #$0020, R0                      ; D418   02F8 0020
        ANDI    #$00E0, R4                      ; D41A   03BC 00E0
        CMPI    #$00E0, R4                      ; D41C   037C 00E0
        BEQ     L_D3DD                          ; D41E   0224 0042

        ANDI    #$0020, R4                      ; D420   03BC 0020
        BEQ     L_D3C6                          ; D422   0224 005D

        MVI     G_0300, R4                      ; D424   0284 0300
        ADDI    #$0010, R4                      ; D426   02FC 0010
        MVO     R4,     G_0300                  ; D428   0244 0300
        B       L_D3C6                          ; D42A   0220 0065

L_D42C:
        MVI     G_0300, R4                      ; D42C   0284 0300
        SUBI    #$0010, R4                      ; D42E   033C 0010
        MVO     R4,     G_0300                  ; D430   0244 0300
        B       L_D3C6                          ; D432   0220 006D

        SDBD                                    ; D434   0001
        MVII    #$692B, R4                      ; D435   02BC 002B 0069
        MVI     G_0106, R1                      ; D438   0281 0106
        TSTR    R1                              ; D43A   0089
        BEQ     L_D441                          ; D43B   0204 0004

        SDBD                                    ; D43D   0001
        MVII    #$6A1B, R4                      ; D43E   02BC 001B 006A
L_D441:
        MOVR    R5,     R7                      ; D441   00AF
L_D442:
        J       G_7E74                          ; D442   0004 037C 0274

L_D445:
        MVI     G_02F8, R2                      ; D445   0282 02F8
        ADDI    #$0002, R2                      ; D447   02FA 0002
        MVO     R2,     G_02F8                  ; D449   0242 02F8
        MVI     G_012D, R0                      ; D44B   0280 012D
        DECR    R0                              ; D44D   0010
        BEQ     L_D453                          ; D44E   0204 0003

        MVO     R0,     G_012D                  ; D450   0240 012D
        PULR    R7                              ; D452   02B7
L_D453:
        SDBD                                    ; D453   0001
        MVII    #$50B5, R3                      ; D454   02BB 00B5 0050
        CLRR    R1                              ; D457   01C9
        MVO     R1,     G_01D0                  ; D458   0241 01D0

        JSR     R5,     .HEADER                 ; D45A   0004 0150 0000
        JSR     R5,     L_6DF2                  ; D45D   0004 016C 01F2

        PULR    R7                              ; D460   02B7
L_D461:
        MVI     G_0154, R2                      ; D461   0282 0154
        TSTR    R2                              ; D463   0092
        BNEQ    L_D478                          ; D464   020C 0012

        INCR    R2                              ; D466   000A
        MVO     R2,     G_0154                  ; D467   0242 0154
        SDBD                                    ; D469   0001
        MVII    #$6BBB, R4                      ; D46A   02BC 00BB 006B
        MVII    #$0020, R0                      ; D46D   02B8 0020
        SDBD                                    ; D46F   0001
        MVII    #$3950, R5                      ; D470   02BD 0050 0039
        PSHR    R5                              ; D473   0275

        JSR     R5,     L_6FCC                  ; D474   0004 016C 03CC

        PULR    R7                              ; D477   02B7
L_D478:
        MVI     G_02F8, R2                      ; D478   0282 02F8
        DECR    R2                              ; D47A   0012
        DECR    R2                              ; D47B   0012
        MVO     R2,     G_02F8                  ; D47C   0242 02F8
        ANDI    #$007F, R2                      ; D47E   03BA 007F
        SUBI    #$0002, R2                      ; D480   033A 0002
        BPL     L_D49C                          ; D482   0203 0018

        SDBD                                    ; D484   0001
        MVII    #$625F, R4                      ; D485   02BC 005F 0062
        MVII    #$0050, R0                      ; D488   02B8 0050
        SDBD                                    ; D48A   0001
        MVII    #$3920, R5                      ; D48B   02BD 0020 0039
        PSHR    R5                              ; D48E   0275

        JSR     R5,     L_6FCC                  ; D48F   0004 016C 03CC
        JSR     R5,     G_7CEA                  ; D492   0004 017C 00EA

        CLRR    R0                              ; D495   01C0
        MVO     R0,     G_0320                  ; D496   0240 0320
        PULR    R2                              ; D498   02B2
        J       L_5259                          ; D499   0004 0350 0259

L_D49C:
        PULR    R7                              ; D49C   02B7
        EIS                                     ; D49D   0002
        DIS                                     ; D49E   0003
        DECLE   $0001,  $0000                   ; D49F   0001 0000

        PSHR    R5                              ; D4A1   0275
        MVI     G_01EE, R1                      ; D4A2   0281 01EE
        SLR     R1,     2                       ; D4A4   0065
        SLR     R1,     1                       ; D4A5   0061
        ANDI    #$0003, R1                      ; D4A6   03B9 0003
        SDBD                                    ; D4A8   0001
        ADDI    #$749D, R1                      ; D4A9   02F9 009D 0074
        MVI@    R1,     R0                      ; D4AC   0288
        SWAP    R0,     1                       ; D4AD   0040
        SLL     R0,     2                       ; D4AE   004C
        MVII    #$02FD, R2                      ; D4AF   02BA 02FD
        MVI@    R2,     R1                      ; D4B1   0291
        ANDI    #$007F, R1                      ; D4B2   03B9 007F
        MVI     G_0305, R3                      ; D4B4   0283 0305
        ANDI    #$0080, R3                      ; D4B6   03BB 0080
        BEQ     L_D4BB                          ; D4B8   0204 0001

        ADDR    R0,     R1                      ; D4BA   00C1
L_D4BB:
        MVO@    R1,     R2                      ; D4BB   0251
        SDBD                                    ; D4BC   0001
        XORI    #$4000, R0                      ; D4BD   03F8 0000 0040
        INCR    R2                              ; D4C0   000A
        MVI@    R2,     R1                      ; D4C1   0291
        ANDI    #$007F, R1                      ; D4C2   03B9 007F
        MVI     G_0306, R3                      ; D4C4   0283 0306
        ANDI    #$0080, R3                      ; D4C6   03BB 0080
        BEQ     L_D4CB                          ; D4C8   0204 0001

        ADDR    R0,     R1                      ; D4CA   00C1
L_D4CB:
        MVO@    R1,     R2                      ; D4CB   0251
        MVI     G_0126, R1                      ; D4CC   0281 0126
        MVII    #$0309, R3                      ; D4CE   02BB 0309
        MVII    #$02F5, R2                      ; D4D0   02BA 02F5
        MVII    #$0002, R0                      ; D4D2   02B8 0002
        CMPI    #$0002, R1                      ; D4D4   0379 0002
        BPL     L_D4E0                          ; D4D6   0203 0008

        DECR    R0                              ; D4D8   0010
        MVI     G_01EE, R1                      ; D4D9   0281 01EE
        SLR     R1,     2                       ; D4DB   0065
        ANDI    #$0001, R1                      ; D4DC   03B9 0001
        ADDR    R1,     R2                      ; D4DE   00CA
        ADDR    R1,     R3                      ; D4DF   00CB
L_D4E0:
        PSHR    R0                              ; D4E0   0270
        PSHR    R2                              ; D4E1   0272
        PSHR    R3                              ; D4E2   0273

        JSR     R5,     L_6EB2                  ; D4E3   0004 016C 02B2

        PULR    R3                              ; D4E6   02B3
        PULR    R2                              ; D4E7   02B2
        PULR    R0                              ; D4E8   02B0
        INCR    R2                              ; D4E9   000A
        INCR    R3                              ; D4EA   000B
        DECR    R0                              ; D4EB   0010
        BNEQ    L_D4E0                          ; D4EC   022C 000D

        PULR    R7                              ; D4EE   02B7
        NEGR    R0                              ; D4EF   0020
        SWAP    R0,     1                       ; D4F0   0040
        TSTR    R0                              ; D4F1   0080
        PSHR    R5                              ; D4F2   0275
        MVII    #$0003, R5                      ; D4F3   02BD 0003
        MVII    #$012F, R4                      ; D4F5   02BC 012F
        MVII    #$02F2, R2                      ; D4F7   02BA 02F2
        MVII    #$030C, R3                      ; D4F9   02BB 030C
L_D4FB:
        MVI@    R4,     R1                      ; D4FB   02A1
        MOVR    R1,     R0                      ; D4FC   0088
        ANDI    #$0080, R1                      ; D4FD   03B9 0080
        BNEQ    L_D517                          ; D4FF   020C 0016

        ANDI    #$0003, R0                      ; D501   03B8 0003
        BNEQ    L_D530                          ; D503   020C 002B

        PSHR    R4                              ; D505   0274
        PSHR    R5                              ; D506   0275
        PSHR    R2                              ; D507   0272

        JSR     R5,     L_6EB2                  ; D508   0004 016C 02B2

        PULR    R2                              ; D50B   02B2

        JSR     R5,     G_755F                  ; D50C   0004 0174 015F

        PULR    R5                              ; D50F   02B5
        PULR    R4                              ; D510   02B4
L_D511:
        INCR    R2                              ; D511   000A
        INCR    R3                              ; D512   000B
        DECR    R5                              ; D513   0015
        BNEQ    L_D4FB                          ; D514   022C 001A

        PULR    R7                              ; D516   02B7
L_D517:
        PSHR    R5                              ; D517   0275

        JSR     R5,     G_755F                  ; D518   0004 0174 015F

        PULR    R5                              ; D51B   02B5
L_D51C:
        MVI@    R2,     R1                      ; D51C   0291
        ADDI    #$0003, R1                      ; D51D   02F9 0003
        MVO@    R1,     R2                      ; D51F   0251
        ANDI    #$00FF, R1                      ; D520   03B9 00FF
        CMPI    #$00B0, R1                      ; D522   0379 00B0
        BMI     L_D511                          ; D524   022B 0014

        SDBD                                    ; D526   0001
        MVII    #$66B9, R1                      ; D527   02B9 00B9 0066
        MVO@    R1,     R3                      ; D52A   0259
        DECR    R4                              ; D52B   0014
        CLRR    R1                              ; D52C   01C9
        MVO@    R1,     R4                      ; D52D   0261
        B       L_D511                          ; D52E   0220 001E

L_D530:
        MOVR    R4,     R1                      ; D530   00A1
        ADDI    #$0016, R1                      ; D531   02F9 0016
        MVI@    R1,     R0                      ; D533   0288
        DECR    R0                              ; D534   0010
        MVO@    R0,     R1                      ; D535   0248
        BEQ     L_D568                          ; D536   0204 0030

        MVI     G_02F0, R0                      ; D538   0280 02F0
        MVI     G_02F8, R1                      ; D53A   0281 02F8
        SUBI    #$0003, R0                      ; D53C   0338 0003
        PSHR    R1                              ; D53E   0271
        SDBD                                    ; D53F   0001
        ANDI    #$0400, R1                      ; D540   03B9 0000 0004
        BEQ     L_D547                          ; D543   0204 0002

        ADDI    #$0006, R0                      ; D545   02F8 0006
L_D547:
        ANDI    #$00FF, R0                      ; D547   03B8 00FF
        MVI@    R2,     R1                      ; D549   0291
        ANDI    #$0300, R1                      ; D54A   03B9 0300
        ADDR    R0,     R1                      ; D54C   00C1
        MVO@    R1,     R2                      ; D54D   0251
        ADDI    #$0008, R2                      ; D54E   02FA 0008
        PULR    R0                              ; D550   02B0
        MOVR    R5,     R1                      ; D551   00A9
        SLL     R1,     1                       ; D552   0049
        SUBR    R1,     R0                      ; D553   0108
        MVI@    R2,     R1                      ; D554   0291
        ANDI    #$0380, R1                      ; D555   03B9 0380
        ANDI    #$007F, R0                      ; D557   03B8 007F
        ADDR    R0,     R1                      ; D559   00C1
        MVO@    R1,     R2                      ; D55A   0251
        SUBI    #$0008, R2                      ; D55B   033A 0008
        B       L_D511                          ; D55D   0220 004D

        ADDI    #$0010, R2                      ; D55F   02FA 0010
        MVI@    R2,     R1                      ; D561   0291
        XORI    #$0008, R1                      ; D562   03F9 0008
        MVO@    R1,     R2                      ; D564   0251
        SUBI    #$0010, R2                      ; D565   033A 0010
        MOVR    R5,     R7                      ; D567   00AF
L_D568:
        DECR    R4                              ; D568   0014
        MVII    #$0080, R1                      ; D569   02B9 0080
        MVO@    R1,     R4                      ; D56B   0261
        ADDI    #$0008, R2                      ; D56C   02FA 0008
        MVI@    R2,     R1                      ; D56E   0291
        ADDR    R5,     R1                      ; D56F   00E9
        ADDR    R5,     R1                      ; D570   00E9
        MVO@    R1,     R2                      ; D571   0251
        SUBI    #$0008, R2                      ; D572   033A 0008
        B       L_D511                          ; D574   0220 0064

        PSHR    R5                              ; D576   0275
        MVI     G_0115, R0                      ; D577   0280 0115
        ANDI    #$0080, R0                      ; D579   03B8 0080
        BNEQ    L_D6D5                          ; D57B   020C 0158

        MVI     G_0115, R0                      ; D57D   0280 0115
        ANDI    #$000E, R0                      ; D57F   03B8 000E
        CMPI    #$000E, R0                      ; D581   0378 000E
        BEQ     L_D654                          ; D583   0204 00CF

        MVII    #$0003, R5                      ; D585   02BD 0003
L_D587:
        MOVR    R5,     R1                      ; D587   00A9
        SDBD                                    ; D588   0001
        ADDI    #$75D5, R1                      ; D589   02F9 00D5 0075
        MVI@    R1,     R0                      ; D58C   0288
        PSHR    R0                              ; D58D   0270
        MVI     G_0115, R2                      ; D58E   0282 0115
        ANDR    R0,     R2                      ; D590   0182
        BNEQ    L_D5D1                          ; D591   020C 003E

        MVII    #$031A, R1                      ; D593   02B9 031A
        ADDR    R5,     R1                      ; D595   00E9
        MVI@    R1,     R0                      ; D596   0288
        PSHR    R0                              ; D597   0270
        PSHR    R1                              ; D598   0271
        SDBD                                    ; D599   0001
        ANDI    #$FF00, R0                      ; D59A   03B8 0000 00FF
        BEQ     L_D5A5                          ; D59D   0204 0006

        MVI@    R1,     R0                      ; D59F   0288
        SUBI    #$0100, R0                      ; D5A0   0338 0100
        MVO@    R0,     R1                      ; D5A2   0248
        B       L_D5CF                          ; D5A3   0200 002A

L_D5A5:
        PSHR    R5                              ; D5A5   0275
        MOVR    R5,     R2                      ; D5A6   00AA
        SLL     R2,     1                       ; D5A7   004A
        ADDR    R5,     R2                      ; D5A8   00EA
        ADDI    #$0106, R2                      ; D5A9   02FA 0106
        MOVR    R5,     R0                      ; D5AB   00A8

        JSR     R5,     G_75D9                  ; D5AC   0004 0174 01D9

        PULR    R5                              ; D5AF   02B5
        SDBD                                    ; D5B0   0001
        MVII    #$75D9, R1                      ; D5B1   02B9 00D9 0075
        SUBR    R5,     R1                      ; D5B4   0129
        MVI@    R1,     R0                      ; D5B5   0288
        SWAP    R0,     1                       ; D5B6   0040
        SLR     R0,     1                       ; D5B7   0060
        AND     G_0320, R0                      ; D5B8   0380 0320
        BEQ     L_D5C1                          ; D5BA   0204 0005

        ADDR    R3,     R3                      ; D5BC   00DB
        ADD     G_02F0, R3                      ; D5BD   02C3 02F0
        MVO     R3,     G_02F0                  ; D5BF   0243 02F0
L_D5C1:
        PULR    R1                              ; D5C1   02B1
        PULR    R0                              ; D5C2   02B0
        DECR    R0                              ; D5C3   0010
        MVO@    R0,     R1                      ; D5C4   0248
        BNEQ    L_D5D1                          ; D5C5   020C 000A

        PULR    R0                              ; D5C7   02B0
        MVI     G_0115, R1                      ; D5C8   0281 0115
        XORR    R0,     R1                      ; D5CA   01C1
        MVO     R1,     G_0115                  ; D5CB   0241 0115
        B       L_D5D2                          ; D5CD   0200 0003

L_D5CF:
        PULR    R0                              ; D5CF   02B0
        PULR    R1                              ; D5D0   02B1
L_D5D1:
        PULR    R0                              ; D5D1   02B0
L_D5D2:
        DECR    R5                              ; D5D2   0015
        BNEQ    L_D587                          ; D5D3   022C 004D

        PULR    R7                              ; D5D5   02B7
        EIS                                     ; D5D6   0002

        JSR     R4,     G_0801                  ; D5D7   0004 0008 0001

        MVII    #$FFFF, R3                      ; D5DA   02BB 00FF 00FF
        MVI     G_0115, R4                      ; D5DD   0284 0115
        ANDI    #$0001, R4                      ; D5DF   03BC 0001
        BEQ     L_D5E4                          ; D5E1   0204 0001

        NEGR    R3                              ; D5E3   0023
L_D5E4:
        PSHR    R0                              ; D5E4   0270
        MVII    #$0135, R1                      ; D5E5   02B9 0135
        SUBR    R0,     R1                      ; D5E7   0101
        MVI@    R1,     R0                      ; D5E8   0288
        ADDR    R3,     R0                      ; D5E9   00D8
        ADDR    R3,     R0                      ; D5EA   00D8
        MVO@    R0,     R1                      ; D5EB   0248
        TSTR    R4                              ; D5EC   00A4
        BNEQ    L_D5F1                          ; D5ED   020C 0002

        ADDI    #$0008, R0                      ; D5EF   02F8 0008
L_D5F1:
        PULR    R1                              ; D5F1   02B1
        NEGR    R1                              ; D5F2   0021
        ADDI    #$02F5, R1                      ; D5F3   02F9 02F5
        XORI    #$0300, R0                      ; D5F5   03F8 0300
        MVO@    R0,     R1                      ; D5F7   0248
        ADDI    #$0002, R2                      ; D5F8   02FA 0002
        MVI@    R2,     R4                      ; D5FA   0294
        ADDI    #$0200, R4                      ; D5FB   02FC 0200
        MVI@    R4,     R1                      ; D5FD   02A1
        ANDI    #$01F8, R1                      ; D5FE   03B9 01F8
        CMPI    #$00F0, R1                      ; D600   0379 00F0
        BEQ     L_D634                          ; D602   0204 0030

        SUBI    #$0002, R2                      ; D604   033A 0002
        MVI@    R2,     R1                      ; D606   0291
        CMPI    #$00FF, R1                      ; D607   0379 00FF
        BEQ     L_D611                          ; D609   0204 0006

        ADDI    #$0200, R1                      ; D60B   02F9 0200
        MVI@    R1,     R0                      ; D60D   0288
        ADDI    #$0008, R0                      ; D60E   02F8 0008
        MVO@    R0,     R1                      ; D610   0248
L_D611:
        INCR    R2                              ; D611   000A
        MVI@    R2,     R1                      ; D612   0291
        ADDI    #$0200, R1                      ; D613   02F9 0200
        MVI@    R1,     R0                      ; D615   0288
        ADDI    #$0008, R0                      ; D616   02F8 0008
        MVO@    R0,     R1                      ; D618   0248
        INCR    R2                              ; D619   000A
        MVI@    R2,     R1                      ; D61A   0291
        ADDI    #$0200, R1                      ; D61B   02F9 0200
        MVI@    R1,     R0                      ; D61D   0288
        ADDI    #$0008, R0                      ; D61E   02F8 0008
        MVO@    R0,     R1                      ; D620   0248
        ANDI    #$01F8, R0                      ; D621   03B8 01F8
        CMPI    #$00E0, R0                      ; D623   0378 00E0
        BNEQ    L_D633                          ; D625   020C 000C

        DECR    R2                              ; D627   0012
        MVI@    R2,     R1                      ; D628   0291
        ADDR    R3,     R1                      ; D629   00D9
        DECR    R2                              ; D62A   0012
        MVO@    R1,     R2                      ; D62B   0251
        ADDI    #$0200, R1                      ; D62C   02F9 0200
        SDBD                                    ; D62E   0001
        MVII    #$18A1, R0                      ; D62F   02B8 00A1 0018
        MVO@    R0,     R1                      ; D632   0248
L_D633:
        MOVR    R5,     R7                      ; D633   00AF
L_D634:
        DECR    R4                              ; D634   0014
        SDBD                                    ; D635   0001
        MVII    #$0801, R1                      ; D636   02B9 0001 0008
        MVO@    R1,     R4                      ; D639   0261
        MVI@    R2,     R1                      ; D63A   0291
        ADDR    R3,     R1                      ; D63B   00D9
        MVO@    R1,     R2                      ; D63C   0251
        SDBD                                    ; D63D   0001
        MVII    #$18D9, R0                      ; D63E   02B8 00D9 0018
        ADDI    #$0200, R1                      ; D641   02F9 0200
        MVO@    R0,     R1                      ; D643   0248
        DECR    R2                              ; D644   0012
        MVI@    R2,     R1                      ; D645   0291
        ADDR    R3,     R1                      ; D646   00D9
        MVO@    R1,     R2                      ; D647   0251
        SDBD                                    ; D648   0001
        MVII    #$18B9, R0                      ; D649   02B8 00B9 0018
        ADDI    #$0200, R1                      ; D64C   02F9 0200
        MVO@    R0,     R1                      ; D64E   0248
        DECR    R2                              ; D64F   0012
        MVII    #$00FF, R0                      ; D650   02B8 00FF
        MVO@    R0,     R2                      ; D652   0250
        MOVR    R5,     R7                      ; D653   00AF
L_D654:
        MVI     G_0115, R0                      ; D654   0280 0115
        XORI    #$0001, R0                      ; D656   03F8 0001
        MVO     R0,     G_0115                  ; D658   0240 0115
        PSHR    R0                              ; D65A   0270
        MVII    #$02F2, R5                      ; D65B   02BD 02F2
        MVII    #$0003, R4                      ; D65D   02BC 0003
        MVII    #$0008, R1                      ; D65F   02B9 0008
        SARC    R0,     1                       ; D661   0078
        BNC     L_D667                          ; D662   0209 0003

        NEGR    R1                              ; D664   0021
        INCR    R1                              ; D665   0009
        INCR    R1                              ; D666   0009
L_D667:
        MVI@    R5,     R0                      ; D667   02A8
        ADDR    R1,     R0                      ; D668   00C8
        DECR    R5                              ; D669   0015
        MVO@    R0,     R5                      ; D66A   0268
        ADDI    #$0007, R5                      ; D66B   02FD 0007
        MVI@    R5,     R0                      ; D66D   02A8
        SDBD                                    ; D66E   0001
        XORI    #$0400, R0                      ; D66F   03F8 0000 0004
        DECR    R5                              ; D672   0015
        MVO@    R0,     R5                      ; D673   0268
        SUBI    #$0008, R5                      ; D674   033D 0008
        DECR    R4                              ; D676   0014
        BNEQ    L_D667                          ; D677   022C 0011

        PULR    R0                              ; D679   02B0
        SDBD                                    ; D67A   0001
        MVII    #$63DF, R4                      ; D67B   02BC 00DF 0063
        SARC    R0,     1                       ; D67E   0078
        BNC     L_D685                          ; D67F   0209 0004

        SDBD                                    ; D681   0001
        MVII    #$6B0B, R4                      ; D682   02BC 000B 006B
L_D685:
        SDBD                                    ; D685   0001
        MVII    #$38A0, R5                      ; D686   02BD 00A0 0038
        MVII    #$0058, R0                      ; D689   02B8 0058
        PSHR    R5                              ; D68B   0275

        JSR     R5,     L_6FCC                  ; D68C   0004 016C 03CC

        MVI     G_0115, R0                      ; D68F   0280 0115
        ANDI    #$0001, R0                      ; D691   03B8 0001
        MVO     R0,     G_0115                  ; D693   0240 0115
        MVII    #$001C, R1                      ; D695   02B9 001C
        MVI     G_035E, R3                      ; D697   0283 035E

        JSR     R5,     G_76CA                  ; D699   0004 0174 02CA

        MVO     R0,     G_031B                  ; D69C   0240 031B

        JSR     R5,     G_76CA                  ; D69E   0004 0174 02CA

        MVO     R0,     G_031C                  ; D6A1   0240 031C

        JSR     R5,     G_76CA                  ; D6A3   0004 0174 02CA

        MVO     R1,     G_031D                  ; D6A6   0241 031D
        MVO     R3,     G_035E                  ; D6A8   0243 035E
        MVII    #$010A, R1                      ; D6AA   02B9 010A
        MVII    #$010B, R2                      ; D6AC   02BA 010B
        MVII    #$0003, R3                      ; D6AE   02BB 0003
L_D6B0:
        MVI@    R1,     R4                      ; D6B0   028C
        MVI@    R2,     R5                      ; D6B1   0295
        MVO@    R4,     R2                      ; D6B2   0254
        MVO@    R5,     R1                      ; D6B3   024D
        ADDI    #$0200, R4                      ; D6B4   02FC 0200
        ADDI    #$0200, R5                      ; D6B6   02FD 0200
        PSHR    R1                              ; D6B8   0271
        PSHR    R2                              ; D6B9   0272
        MVI@    R4,     R1                      ; D6BA   02A1
        MVI@    R5,     R2                      ; D6BB   02AA
        DECR    R4                              ; D6BC   0014
        DECR    R5                              ; D6BD   0015
        MVO@    R1,     R5                      ; D6BE   0269
        MVO@    R2,     R4                      ; D6BF   0262
        PULR    R2                              ; D6C0   02B2
        PULR    R1                              ; D6C1   02B1
        ADDI    #$0003, R2                      ; D6C2   02FA 0003
        ADDI    #$0003, R1                      ; D6C4   02F9 0003
        DECR    R3                              ; D6C6   0013
        BNEQ    L_D6B0                          ; D6C7   022C 0018

        PULR    R7                              ; D6C9   02B7
        PSHR    R5                              ; D6CA   0275

        JSR     R5,     G_7F7B                  ; D6CB   0004 017C 037B

        MVI     G_031E, R0                      ; D6CE   0280 031E
        ANDI    #$000F, R0                      ; D6D0   03B8 000F
        SWAP    R0,     1                       ; D6D2   0040
        ADDR    R1,     R0                      ; D6D3   00C8
        PULR    R7                              ; D6D4   02B7
L_D6D5:
        J       G_7CFA                          ; D6D5   0004 037C 00FA

L_D6D8:
        MVI     G_02F0, R2                      ; D6D8   0282 02F0
        MVI     G_02F8, R3                      ; D6DA   0283 02F8
        INCR    R2                              ; D6DC   000A
        ADDI    #$0002, R3                      ; D6DD   02FB 0002
        MVO     R2,     G_02F0                  ; D6DF   0242 02F0
        MVO     R3,     G_02F8                  ; D6E1   0243 02F8
        ANDI    #$007F, R3                      ; D6E3   03BB 007F
        MVI     G_0126, R1                      ; D6E5   0281 0126
        CMPI    #$0003, R1                      ; D6E7   0379 0003
        BPL     L_D707                          ; D6E9   0203 001C

        CMPI    #$004C, R3                      ; D6EB   037B 004C
        BPL     L_D6F5                          ; D6ED   0203 0006

        MVI     G_0310, R0                      ; D6EF   0280 0310
        ANDI    #$0080, R0                      ; D6F1   03B8 0080
        BEQ     L_D707                          ; D6F3   0204 0012

L_D6F5:
        MVI     G_0158, R1                      ; D6F5   0281 0158
        TSTR    R1                              ; D6F7   0089
        BNEQ    L_D707                          ; D6F8   020C 000D

        INCR    R1                              ; D6FA   0009
        MVO     R1,     G_0158                  ; D6FB   0241 0158
        MVI     G_0320, R1                      ; D6FD   0281 0320
        SDBD                                    ; D6FF   0001
        ANDI    #$FFFD, R1                      ; D700   03B9 00FD 00FF
        XORI    #$0002, R1                      ; D703   03F9 0002
        MVO     R1,     G_0320                  ; D705   0241 0320
L_D707:
        ANDI    #$007F, R3                      ; D707   03BB 007F
        CMPI    #$005C, R3                      ; D709   037B 005C
        BMI     L_D391                          ; D70B   022B 037B

        MVI     G_0320, R0                      ; D70D   0280 0320
        XORI    #$0001, R0                      ; D70F   03F8 0001
        MVO     R0,     G_0320                  ; D711   0240 0320
        B       L_D391                          ; D713   0220 0383

        MVI     .BTAB.5A,R0                     ; D715   0280 025A
        XORI    #$0008, R0                      ; D717   03F8 0008
        MVO     R0,     .BTAB.5A                ; D719   0240 025A
        MVII    #$02CE, R4                      ; D71B   02BC 02CE
        MVI@    R4,     R0                      ; D71D   02A0
        DECR    R4                              ; D71E   0014
        MOVR    R0,     R1                      ; D71F   0081
        ANDI    #$00F8, R0                      ; D720   03B8 00F8
        SUBR    R0,     R1                      ; D722   0101
        ADDI    #$0008, R0                      ; D723   02F8 0008
        MVII    #$00A8, R2                      ; D725   02BA 00A8
        CMPI    #$00C0, R0                      ; D727   0378 00C0
        BNEQ    L_D72C                          ; D729   020C 0001

        MOVR    R2,     R0                      ; D72B   0090
L_D72C:
        ADDR    R1,     R0                      ; D72C   00C8
        MVO@    R0,     R4                      ; D72D   0260
        MVO@    R0,     R4                      ; D72E   0260
        MVO@    R0,     R4                      ; D72F   0260
        MVI     .BTAB.6E,R1                     ; D730   0281 026E
        SDBD                                    ; D732   0001
        XORI    #$31F8, R1                      ; D733   03F9 00F8 0031
        MVO     R1,     .BTAB.6E                ; D736   0241 026E
        SDBD                                    ; D738   0001
        XORI    #$31F8, R1                      ; D739   03F9 00F8 0031
        MVO     R1,     .BTAB.82                ; D73C   0241 0282
        MOVR    R5,     R7                      ; D73E   00AF
        DECLE   $0211,  $0212                   ; D73F   0211 0212

        BLT     L_D51C                          ; D741   0225 0226

        DECLE   $0239,  $023A                   ; D743   0239 023A

        MVI     G_01EE, R0                      ; D745   0280 01EE
        ANDI    #$0018, R0                      ; D747   03B8 0018
        BNEQ    L_D760                          ; D749   020C 0015

        MVII    #$0006, R3                      ; D74B   02BB 0006
        MVI     G_0106, R0                      ; D74D   0280 0106
        TSTR    R0                              ; D74F   0080
        BEQ     L_D754                          ; D750   0204 0002

        DECR    R3                              ; D752   0013
        DECR    R3                              ; D753   0013
L_D754:
        SDBD                                    ; D754   0001
        MVII    #$773F, R4                      ; D755   02BC 003F 0077
L_D758:
        MVI@    R4,     R1                      ; D758   02A1
        MVI@    R1,     R0                      ; D759   0288
        XORI    #$0008, R0                      ; D75A   03F8 0008
        MVO@    R0,     R1                      ; D75C   0248
        DECR    R3                              ; D75D   0013
        BNEQ    L_D758                          ; D75E   022C 0007

L_D760:
        MOVR    R5,     R7                      ; D760   00AF
        PSHR    R5                              ; D761   0275
        PSHR    R3                              ; D762   0273
        PSHR    R2                              ; D763   0272
        ADD     G_0322, R3                      ; D764   02C3 0322
        ANDI    #$0078, R3                      ; D766   03BB 0078
        SLR     R3,     1                       ; D768   0063
        MOVR    R3,     R2                      ; D769   009A
        SLL     R3,     2                       ; D76A   004F
        ADDR    R3,     R2                      ; D76B   00DA
        PULR    R3                              ; D76C   02B3
        PSHR    R3                              ; D76D   0273
        ANDI    #$00FF, R3                      ; D76E   03BB 00FF
        ADD     G_0321, R3                      ; D770   02C3 0321
        SLR     R3,     2                       ; D772   0067
        SLR     R3,     1                       ; D773   0063
        ADDR    R3,     R2                      ; D774   00DA
        ADDR    R4,     R2                      ; D775   00E2
        MVI@    R2,     R0                      ; D776   0290
        MOVR    R0,     R1                      ; D777   0081
        PULR    R2                              ; D778   02B2
        PULR    R3                              ; D779   02B3
        PSHR    R3                              ; D77A   0273
        PSHR    R2                              ; D77B   0272
        ADD     G_0321, R2                      ; D77C   02C2 0321
        ADD     G_0322, R3                      ; D77E   02C3 0322
        ANDI    #$0007, R2                      ; D780   03BA 0007
        ANDI    #$0007, R3                      ; D782   03BB 0007
        ANDI    #$0100, R0                      ; D784   03B8 0100
        BEQ     L_D792                          ; D786   0204 000A

        SUBR    R3,     R2                      ; D788   011A
        BMI     L_D78D                          ; D789   020B 0002

L_D78B:
        SLR     R1,     2                       ; D78B   0065
        SLR     R1,     2                       ; D78C   0065
L_D78D:
        ANDI    #$000F, R1                      ; D78D   03B9 000F
        PULR    R2                              ; D78F   02B2
        PULR    R3                              ; D790   02B3
        PULR    R7                              ; D791   02B7
L_D792:
        CMPI    #$0004, R3                      ; D792   037B 0004
        BMI     L_D78B                          ; D794   022B 000A
        B       L_D78D                          ; D796   0220 000A

L_D798:
        JSR     R5,     G_7A7B                  ; D798   0004 0178 027B

        TSTR    R0                              ; D79B   0080
        BNEQ    L_D7B9                          ; D79C   020C 001B

        MVO     R0,     G_014B                  ; D79E   0240 014B
        B       L_D7B9                          ; D7A0   0200 0017

        PSHR    R5                              ; D7A2   0275
        MVI     G_0320, R0                      ; D7A3   0280 0320
        SDBD                                    ; D7A5   0001
        ANDI    #$801D, R0                      ; D7A6   03B8 001D 0080
        BNEQ    L_D7B9                          ; D7A9   020C 000E

        MVI     G_014B, R4                      ; D7AB   0284 014B
        TSTR    R4                              ; D7AD   00A4
        BNEQ    L_D798                          ; D7AE   022C 0017

        JSR     R5,     G_7A7B                  ; D7B0   0004 0178 027B

        TSTR    R0                              ; D7B3   0080
        BEQ     L_D7B9                          ; D7B4   0204 0003

        JSR     R5,     G_7999                  ; D7B6   0004 0178 0199

L_D7B9:
        MVI     G_0320, R1                      ; D7B9   0281 0320
        MOVR    R1,     R2                      ; D7BB   008A
        MVI     G_0107, R0                      ; D7BC   0280 0107
        ANDI    #$0010, R1                      ; D7BE   03B9 0010
        BNEQ    L_D80C                          ; D7C0   020C 004A

        MVI     G_0106, R1                      ; D7C2   0281 0106
        ANDI    #$0007, R0                      ; D7C4   03B8 0007
        TSTR    R1                              ; D7C6   0089
        BNEQ    L_D7D9                          ; D7C7   020C 0010

        CMPI    #$0001, R0                      ; D7C9   0378 0001
        BNEQ    L_D7D9                          ; D7CB   020C 000C

L_D7CD:
        SDBD                                    ; D7CD   0001
        MVII    #$50AB, R3                      ; D7CE   02BB 00AB 0050
        CLRR    R1                              ; D7D1   01C9

        JSR     R5,     .HEADER                 ; D7D2   0004 0150 0000
        JSR     R5,     L_6DF2                  ; D7D5   0004 016C 01F2

        PULR    R7                              ; D7D8   02B7
L_D7D9:
        ANDI    #$0008, R2                      ; D7D9   03BA 0008
        BNEQ    L_D7E5                          ; D7DB   020C 0008

        CMPI    #$0006, R0                      ; D7DD   0378 0006
        BMI     L_D7E5                          ; D7DF   020B 0004

        JSR     R5,     L_6DD4                  ; D7E1   0004 016C 01D4

        PULR    R7                              ; D7E4   02B7
L_D7E5:
        MVI     G_0107, R0                      ; D7E5   0280 0107
        ANDI    #$0008, R0                      ; D7E7   03B8 0008
        BEQ     L_D7FC                          ; D7E9   0204 0011

        MVI     G_0310, R0                      ; D7EB   0280 0310
        ANDI    #$0060, R0                      ; D7ED   03B8 0060
        BEQ     L_D7FC                          ; D7EF   0204 000B

        SDBD                                    ; D7F1   0001
        MVII    #$50B5, R3                      ; D7F2   02BB 00B5 0050
        CLRR    R1                              ; D7F5   01C9

        JSR     R5,     .HEADER                 ; D7F6   0004 0150 0000
        JSR     R5,     L_6DF2                  ; D7F9   0004 016C 01F2

L_D7FC:
        MVI     G_0320, R0                      ; D7FC   0280 0320
        SLLC    R0,     1                       ; D7FE   0058
        BC      L_D80C                          ; D7FF   0201 000B

        MVI     G_0107, R0                      ; D801   0280 0107
        ANDI    #$0006, R0                      ; D803   03B8 0006
        CMPI    #$0002, R0                      ; D805   0378 0002
        BNEQ    L_D80C                          ; D807   020C 0003

        JSR     R5,     L_6CC3                  ; D809   0004 016C 00C3

L_D80C:
        MVI     G_0106, R2                      ; D80C   0282 0106
        TSTR    R2                              ; D80E   0092
        BNEQ    L_D8F3                          ; D80F   020C 00E2

        MVI     G_0320, R1                      ; D811   0281 0320
        ANDI    #$001F, R1                      ; D813   03B9 001F
        BNEQ    L_D858                          ; D815   020C 0041

        MVI     G_0126, R1                      ; D817   0281 0126
        TSTR    R1                              ; D819   0089
        BEQ     L_D858                          ; D81A   0204 003C

        MVII    #$0003, R0                      ; D81C   02B8 0003
        MVII    #$012F, R4                      ; D81E   02BC 012F
L_D820:
        MVI@    R4,     R1                      ; D820   02A1
        TSTR    R1                              ; D821   0089
        BNEQ    L_D855                          ; D822   020C 0031

        SDBD                                    ; D824   0001
        MVII    #$75D9, R5                      ; D825   02BD 00D9 0075
        SUBR    R0,     R5                      ; D828   0105
        MVI@    R5,     R2                      ; D829   02AA
        SLL     R2,     1                       ; D82A   004A
        MVI     G_0310, R1                      ; D82B   0281 0310
        ANDR    R2,     R1                      ; D82D   0191
        BEQ     L_D855                          ; D82E   0204 0025

        MVI     G_013E, R1                      ; D830   0281 013E
        INCR    R1                              ; D832   0009
        MVO     R1,     G_013E                  ; D833   0241 013E
        MVII    #$0014, R2                      ; D835   02BA 0014
        SUB     G_0126, R2                      ; D837   0302 0126
        SUB     G_0126, R2                      ; D839   0302 0126
        SUBR    R2,     R1                      ; D83B   0111
        BNEQ    L_D858                          ; D83C   020C 001A

        CLRR    R1                              ; D83E   01C9
        MVO     R1,     G_013E                  ; D83F   0241 013E
        DECR    R4                              ; D841   0014
        MVII    #$0002, R1                      ; D842   02B9 0002
        MVO@    R1,     R4                      ; D844   0261
        MOVR    R4,     R1                      ; D845   00A1
        ADDI    #$0016, R1                      ; D846   02F9 0016
        MVII    #$0028, R3                      ; D848   02BB 0028
        MVO@    R3,     R1                      ; D84A   024B
        SDBD                                    ; D84B   0001
        MVII    #$50D7, R3                      ; D84C   02BB 00D7 0050
        CLRR    R1                              ; D84F   01C9
        PSHR    R4                              ; D850   0274

        JSR     R5,     .HEADER                 ; D851   0004 0150 0000

        PULR    R4                              ; D854   02B4
L_D855:
        DECR    R0                              ; D855   0010
        BNEQ    L_D820                          ; D856   022C 0037

L_D858:
        MVI     G_0320, R1                      ; D858   0281 0320
        ANDI    #$001F, R1                      ; D85A   03B9 001F
        BNEQ    L_D884                          ; D85C   020C 0026

        MVI     G_02F0, R2                      ; D85E   0282 02F0
        MVI     G_02F8, R3                      ; D860   0283 02F8
        ANDI    #$00FF, R2                      ; D862   03BA 00FF
        ANDI    #$007F, R3                      ; D864   03BB 007F
        CMPI    #$0048, R2                      ; D866   037A 0048
        BMI     L_D884                          ; D868   020B 001A

        CMPI    #$005C, R2                      ; D86A   037A 005C
        BPL     L_D884                          ; D86C   0203 0016

        CMPI    #$0041, R3                      ; D86E   037B 0041
        BMI     L_D884                          ; D870   020B 0012

        CMPI    #$0058, R3                      ; D872   037B 0058
        BPL     L_D884                          ; D874   0203 000E

        MVI     G_0320, R0                      ; D876   0280 0320
        XORI    #$0001, R0                      ; D878   03F8 0001
        MVO     R0,     G_0320                  ; D87A   0240 0320
        CLRR    R1                              ; D87C   01C9
        SDBD                                    ; D87D   0001
        MVII    #$50E7, R3                      ; D87E   02BB 00E7 0050

        JSR     R5,     .HEADER                 ; D881   0004 0150 0000

L_D884:
        MVI     G_0107, R1                      ; D884   0281 0107
        ANDI    #$0007, R1                      ; D886   03B9 0007
        CMPI    #$0005, R1                      ; D888   0379 0005
        BNEQ    L_D8A9                          ; D88A   020C 001D

L_D88C:
        SDBD                                    ; D88C   0001
        MVII    #$50BF, R3                      ; D88D   02BB 00BF 0050
        MVII    #$0001, R1                      ; D890   02B9 0001

        JSR     R5,     .HEADER                 ; D892   0004 0150 0000

        DECR    R1                              ; D895   0011
L_D896:
        MVO     R1,     G_0107                  ; D896   0241 0107
        SDBD                                    ; D898   0001
        MVII    #$50C5, R3                      ; D899   02BB 00C5 0050

        JSR     R5,     .HEADER                 ; D89C   0004 0150 0000

L_D89F:
        MVII    #$0064, R0                      ; D89F   02B8 0064
        MVO     R0,     G_012E                  ; D8A1   0240 012E
        MVI     G_0320, R1                      ; D8A3   0281 0320
        XORI    #$0020, R1                      ; D8A5   03F9 0020
        MVO     R1,     G_0320                  ; D8A7   0241 0320
L_D8A9:
        MVI     G_014E, R1                      ; D8A9   0281 014E
        TSTR    R1                              ; D8AB   0089
        BNEQ    L_D8E2                          ; D8AC   020C 0034

        MVI     G_02F8, R2                      ; D8AE   0282 02F8
        ANDI    #$007F, R2                      ; D8B0   03BA 007F
        CMPI    #$0050, R2                      ; D8B2   037A 0050
        BMI     L_D8F2                          ; D8B4   020B 003C

        MVI     G_02F0, R2                      ; D8B6   0282 02F0
        ANDI    #$00FF, R2                      ; D8B8   03BA 00FF
        CMPI    #$007E, R2                      ; D8BA   037A 007E
        BMI     L_D8F2                          ; D8BC   020B 0034

        MVII    #$0001, R1                      ; D8BE   02B9 0001
        MVO     R1,     G_014E                  ; D8C0   0241 014E
        SDBD                                    ; D8C2   0001
        MVII    #$3A1B, R1                      ; D8C3   02B9 001B 003A
        MVO     R1,     .BTAB.E8                ; D8C6   0241 02E8
        SDBD                                    ; D8C8   0001
        MVII    #$3A10, R1                      ; D8C9   02B9 0010 003A
        MVO     R1,     .BTAB.E9                ; D8CC   0241 02E9
        MVII    #$0118, R1                      ; D8CE   02B9 0118
        ADD     G_013C, R1                      ; D8D0   02C1 013C
        MVII    #$0005, R3                      ; D8D2   02BB 0005
        MVII    #$0004, R0                      ; D8D4   02B8 0004

        JSR     R5,     L_5413                  ; D8D6   0004 0154 0013

        SDBD                                    ; D8D9   0001
        MVII    #$50EF, R3                      ; D8DA   02BB 00EF 0050
        CLRR    R1                              ; D8DD   01C9

        JSR     R5,     .HEADER                 ; D8DE   0004 0150 0000

        PULR    R7                              ; D8E1   02B7
L_D8E2:
        MVI     G_02F8, R3                      ; D8E2   0283 02F8
        ANDI    #$007F, R3                      ; D8E4   03BB 007F
        CMPI    #$0050, R3                      ; D8E6   037B 0050
        BMI     L_D8F2                          ; D8E8   020B 0008

        MVI     G_02F0, R3                      ; D8EA   0283 02F0
        ANDI    #$00FF, R3                      ; D8EC   03BB 00FF
        CMPI    #$0070, R3                      ; D8EE   037B 0070
        BMI     L_D7CD                          ; D8F0   022B 0124

L_D8F2:
        PULR    R7                              ; D8F2   02B7
L_D8F3:
        MVI     G_0115, R0                      ; D8F3   0280 0115
        ANDI    #$0080, R0                      ; D8F5   03B8 0080
        BNEQ    L_D904                          ; D8F7   020C 000B

        MVI     G_0107, R0                      ; D8F9   0280 0107
        ANDI    #$0007, R0                      ; D8FB   03B8 0007
        CMPI    #$0005, R0                      ; D8FD   0378 0005
        BEQ     L_D907                          ; D8FF   0204 0006
        J       L_514F                          ; D901   0004 0350 014F
L_D904:
        J       L_51DC                          ; D904   0004 0350 01DC

L_D907:
        JSR     R5,     G_7972                  ; D907   0004 0178 0172

        MVI     G_0115, R0                      ; D90A   0280 0115
        XORI    #$0080, R0                      ; D90C   03F8 0080
        MVO     R0,     G_0115                  ; D90E   0240 0115
        SDBD                                    ; D910   0001
        MVII    #$7948, R4                      ; D911   02BC 0048 0079
        MVII    #$0003, R2                      ; D914   02BA 0003
        MVII    #$02F2, R5                      ; D916   02BD 02F2
L_D918:
        MVII    #$0006, R3                      ; D918   02BB 0006
L_D91A:
        SDBD                                    ; D91A   0001
        MVI@    R4,     R1                      ; D91B   02A1
        MVO@    R1,     R5                      ; D91C   0269
        DECR    R3                              ; D91D   0013
        BNEQ    L_D91A                          ; D91E   022C 0005

        ADDI    #$0002, R5                      ; D920   02FD 0002
        DECR    R2                              ; D922   0012
        BNEQ    L_D918                          ; D923   022C 000C

        MVII    #$0127, R4                      ; D925   02BC 0127
        SDBD                                    ; D927   0001
        MVII    #$796C, R5                      ; D928   02BD 006C 0079
        MVII    #$0006, R3                      ; D92B   02BB 0006
L_D92D:
        MVI@    R5,     R1                      ; D92D   02A9
        MVO@    R1,     R4                      ; D92E   0261
        DECR    R3                              ; D92F   0013
        BNEQ    L_D92D                          ; D930   022C 0004

        MVII    #$0058, R0                      ; D932   02B8 0058
        SDBD                                    ; D934   0001
        MVII    #$38A0, R5                      ; D935   02BD 00A0 0038
        SDBD                                    ; D938   0001
        MVII    #$6B63, R4                      ; D939   02BC 0063 006B
        PSHR    R5                              ; D93C   0275

        JSR     R5,     L_6FCC                  ; D93D   0004 016C 03CC

        MVII    #$0004, R0                      ; D940   02B8 0004
        MVII    #$0135, R4                      ; D942   02BC 0135

        JSR     R5,     X_FILL_ZERO             ; D944   0004 0114 0338

        PULR    R7                              ; D947   02B7
        SAR     R0,     2                       ; D948   006C
        SETC                                    ; D949   0007
        SARC    R0,     2                       ; D94A   007C
        SETC                                    ; D94B   0007
        SWAP    R2,     1                       ; D94C   0042
        SETC                                    ; D94D   0007
        SWAP    R0,     2                       ; D94E   0044
        SETC                                    ; D94F   0007
        MOVR    R5,     R0                      ; D950   00A8
        DIS                                     ; D951   0003
        MOVR    R5,     R0                      ; D952   00A8
        DIS                                     ; D953   0003
        MOVR    R7,     R4                      ; D954   00BC
        DECLE   $0000                           ; D955   0000

        ADDR    R4,     R0                      ; D956   00E0
        DECLE   $0000                           ; D957   0000

        MOVR    R1,     R7                      ; D958   008F
        DECLE   $0000                           ; D959   0000

        MOVR    R5,     R0                      ; D95A   00A8
        DECLE   $0000                           ; D95B   0000

        ADDR    R1,     R0                      ; D95C   00C8
        DECLE   $0001                           ; D95D   0001

        ADDR    R1,     R0                      ; D95E   00C8
        DECLE   $0001                           ; D95F   0001

        MOVR    R4,     R2                      ; D960   00A2
        INCR    R0                              ; D961   0008
        MOVR    R4,     R2                      ; D962   00A2
        INCR    R0                              ; D963   0008
        MOVR    R4,     R2                      ; D964   00A2
        INCR    R0                              ; D965   0008
        MOVR    R4,     R2                      ; D966   00A2
        INCR    R0                              ; D967   0008
        ADDR    R4,     R5                      ; D968   00E5
        COMR    R0                              ; D969   0018
        ADDR    R4,     R5                      ; D96A   00E5
        COMR    R0                              ; D96B   0018
        INCR    R0                              ; D96C   0008
        ADCR    R0                              ; D96D   0028
        INCR    R0                              ; D96E   0008
        NEGR    R0                              ; D96F   0020
        SLL     R0,     1                       ; D970   0048
        SLL     R0,     1                       ; D971   0048
        MVII    #$0109, R4                      ; D972   02BC 0109
        SDBD                                    ; D974   0001
        MVII    #$0801, R0                      ; D975   02B8 0001 0008
        MVII    #$0009, R3                      ; D978   02BB 0009
L_D97A:
        MVI@    R4,     R1                      ; D97A   02A1
        CMPI    #$00FF, R1                      ; D97B   0379 00FF
        BEQ     L_D985                          ; D97D   0204 0006

        TSTR    R1                              ; D97F   0089
        BEQ     L_D985                          ; D980   0204 0003

        ADDI    #$0200, R1                      ; D982   02F9 0200
        MVO@    R0,     R1                      ; D984   0248
L_D985:
        DECR    R3                              ; D985   0013
        BNEQ    L_D97A                          ; D986   022C 000D

        MOVR    R5,     R7                      ; D988   00AF
        DECLE   $0005,  $0005                   ; D989   0005 0005

        JSRE    R4,     G_0406                  ; D98B   0004 0005 0006

        CLRC                                    ; D98E   0006
        SETC                                    ; D98F   0007
        INCR    R1                              ; D990   0009
        INCR    R2                              ; D991   000A
        INCR    R2                              ; D992   000A
        INCR    R3                              ; D993   000B
        INCR    R4                              ; D994   000C
        SUBR    R0,     R0                      ; D995   0100
        INCR    R3                              ; D996   000B
        INCR    R3                              ; D997   000B
        SUBR    R0,     R0                      ; D998   0100
        PSHR    R5                              ; D999   0275
        MVI     G_014B, R1                      ; D99A   0281 014B
        TSTR    R1                              ; D99C   0089
        BEQ     L_D9A0                          ; D99D   0204 0001

        PULR    R7                              ; D99F   02B7
L_D9A0:
        MVO     R1,     G_014D                  ; D9A0   0241 014D
        INCR    R1                              ; D9A2   0009
        MVO     R1,     G_014B                  ; D9A3   0241 014B

        JSR     R5,     L_5101                  ; D9A5   0004 0150 0101

        SDBD                                    ; D9A8   0001
        MVII    #$6F7F, R4                      ; D9A9   02BC 007F 006F
        MVI     G_0106, R1                      ; D9AC   0281 0106
        TSTR    R1                              ; D9AE   0089
        BNEQ    L_D9DD                          ; D9AF   020C 002C

        SDBD                                    ; D9B1   0001
        MVII    #$798B, R4                      ; D9B2   02BC 008B 0079
        MVI     G_0126, R1                      ; D9B5   0281 0126
        CMPI    #$0008, R1                      ; D9B7   0379 0008
        BPL     L_D9DD                          ; D9B9   0203 0022

        MVI     G_02F8, R1                      ; D9BB   0281 02F8
        ANDI    #$007F, R1                      ; D9BD   03B9 007F
        CMPI    #$0028, R1                      ; D9BF   0379 0028
        BMI     L_D9DD                          ; D9C1   020B 001A

        CMPI    #$002C, R1                      ; D9C3   0379 002C
        BPL     L_D9DD                          ; D9C5   0203 0016

        MVI     G_02F0, R1                      ; D9C7   0281 02F0
        ANDI    #$00FF, R1                      ; D9C9   03B9 00FF
        CMPI    #$0058, R1                      ; D9CB   0379 0058
        BMI     L_D9DD                          ; D9CD   020B 000E

        CMPI    #$0068, R1                      ; D9CF   0379 0068
        BPL     L_D9DD                          ; D9D1   0203 000A

        SDBD                                    ; D9D3   0001
        MVII    #$7989, R4                      ; D9D4   02BC 0089 0079
        MVI     G_014D, R1                      ; D9D7   0281 014D
        XORI    #$0040, R1                      ; D9D9   03F9 0040
        MVO     R1,     G_014D                  ; D9DB   0241 014D
L_D9DD:
        MVO     R4,     G_031F                  ; D9DD   0244 031F
        MVII    #$0002, R3                      ; D9DF   02BB 0002
        MOVR    R3,     R2                      ; D9E1   009A
        MVI     G_0108, R0                      ; D9E2   0280 0108
        COMR    R0                              ; D9E4   0018
        SARC    R0,     1                       ; D9E5   0078
        BC      L_DA3F                          ; D9E6   0201 0057

        SARC    R0,     1                       ; D9E8   0078
        BC      L_DA47                          ; D9E9   0201 005C

        SARC    R0,     1                       ; D9EB   0078
        BC      L_DA56                          ; D9EC   0201 0068

        SARC    R0,     1                       ; D9EE   0078
        BC      L_DA4E                          ; D9EF   0201 005D

        CLRR    R3                              ; D9F1   01DB
        CLRR    R2                              ; D9F2   01D2
L_D9F3:
        MVO     R2,     G_0323                  ; D9F3   0242 0323
        MVO     R3,     G_0324                  ; D9F5   0243 0324
        TSTR    R2                              ; D9F7   0092
        BEQ     L_D9FC                          ; D9F8   0204 0002

        MVO     R2,     G_0157                  ; D9FA   0242 0157
L_D9FC:
        PSHR    R4                              ; D9FC   0274
        MVII    #$000A, R4                      ; D9FD   02BC 000A
        MVI     G_02F0, R2                      ; D9FF   0282 02F0
        MVI     G_02F8, R3                      ; DA01   0283 02F8
L_DA03:
        ADD     G_0323, R2                      ; DA03   02C2 0323
        ADD     G_0324, R3                      ; DA05   02C3 0324
        PSHR    R4                              ; DA07   0274

        JSR     R5,     G_7434                  ; DA08   0004 0174 0034
        JSR     R5,     G_7761                  ; DA0B   0004 0174 0361

        PULR    R4                              ; DA0E   02B4
        ANDI    #$0007, R1                      ; DA0F   03B9 0007
        CMPI    #$0002, R1                      ; DA11   0379 0002
        BEQ     L_DA2E                          ; DA13   0204 0019

        CMPI    #$0003, R1                      ; DA15   0379 0003
        BEQ     L_DA2E                          ; DA17   0204 0015

        DECR    R4                              ; DA19   0014
        BNEQ    L_DA03                          ; DA1A   022C 0018

        PULR    R4                              ; DA1C   02B4
L_DA1D:
        MVI     G_0320, R0                      ; DA1D   0280 0320
        XORI    #$0004, R0                      ; DA1F   03F8 0004
        MVO     R0,     G_0320                  ; DA21   0240 0320
        CLRR    R1                              ; DA23   01C9
        MVO     R1,     G_0325                  ; DA24   0241 0325
        SDBD                                    ; DA26   0001
        MVII    #$509B, R3                      ; DA27   02BB 009B 0050

        JSR     R5,     .HEADER                 ; DA2A   0004 0150 0000

        PULR    R7                              ; DA2D   02B7
L_DA2E:
        PULR    R5                              ; DA2E   02B5
        MVII    #$0001, R1                      ; DA2F   02B9 0001
        MVO     R1,     G_014D                  ; DA31   0241 014D
        CMPI    #$0007, R4                      ; DA33   037C 0007
        BMI     L_DA39                          ; DA35   020B 0002

        ADDI    #$0008, R5                      ; DA37   02FD 0008
L_DA39:
        SDBD                                    ; DA39   0001
        MVI@    R5,     R1                      ; DA3A   02A9
        MVO     R1,     G_0308                  ; DA3B   0241 0308
        B       L_DA1D                          ; DA3D   0220 0021

L_DA3F:
        DECR    R2                              ; DA3F   0012
        DECR    R3                              ; DA40   0013
        SDBD                                    ; DA41   0001
L_DA42:
        MVII    #$7A6B, R4                      ; DA42   02BC 006B 007A
        B       L_D9F3                          ; DA45   0220 0053

L_DA47:
        CLRR    R3                              ; DA47   01DB
        SDBD                                    ; DA48   0001
        MVII    #$7A6D, R4                      ; DA49   02BC 006D 007A
        B       L_D9F3                          ; DA4C   0220 005A

L_DA4E:
        CLRR    R3                              ; DA4E   01DB
        NEGR    R2                              ; DA4F   0022
        SDBD                                    ; DA50   0001
        MVII    #$7A71, R4                      ; DA51   02BC 0071 007A
        B       L_D9F3                          ; DA54   0220 0062

L_DA56:
        DECR    R2                              ; DA56   0012
        DECR    R3                              ; DA57   0013
        NEGR    R2                              ; DA58   0022
        NEGR    R3                              ; DA59   0023
        MVI     G_0106, R1                      ; DA5A   0281 0106
        TSTR    R1                              ; DA5C   0089
        BEQ     L_DA65                          ; DA5D   0204 0006

        SDBD                                    ; DA5F   0001
        MVII    #$798B, R4                      ; DA60   02BC 008B 0079
        MVO     R4,     G_031F                  ; DA63   0244 031F
L_DA65:
        SDBD                                    ; DA65   0001
        MVII    #$7A6F, R4                      ; DA66   02BC 006F 007A
        B       L_D9F3                          ; DA69   0220 0077

        MOVR    R2,     R6                      ; DA6B   0096
        SAR     R0,     1                       ; DA6C   0068
        MOVR    R4,     R1                      ; DA6D   00A1
        SAR     R0,     1                       ; DA6E   0068
        MOVR    R5,     R4                      ; DA6F   00AC
        SAR     R0,     1                       ; DA70   0068
        MOVR    R6,     R7                      ; DA71   00B7
        SAR     R0,     1                       ; DA72   0068
        ADDR    R0,     R2                      ; DA73   00C2
        SAR     R0,     1                       ; DA74   0068
        ADDR    R2,     R2                      ; DA75   00D2
        SAR     R0,     1                       ; DA76   0068
        ADDR    R3,     R5                      ; DA77   00DD
        SAR     R0,     1                       ; DA78   0068
        ADDR    R5,     R0                      ; DA79   00E8
        SAR     R0,     1                       ; DA7A   0068
        MVI     G_0108, R0                      ; DA7B   0280 0108
        COMR    R0                              ; DA7D   0018
        ANDI    #$00A0, R0                      ; DA7E   03B8 00A0
        CMPI    #$00A0, R0                      ; DA80   0378 00A0
        BEQ     L_DA85                          ; DA82   0204 0001

        CLRR    R0                              ; DA84   01C0
L_DA85:
        MOVR    R5,     R7                      ; DA85   00AF
        DECLE   $0000,  $0000                   ; DA86   0000 0000

        MVII    #$0004, R2                      ; DA88   02BA 0004
        MVO     R2,     G_01E5                  ; DA8A   0242 01E5
        CLRR    R1                              ; DA8C   01C9
        MVO     R1,     G_01D0                  ; DA8D   0241 01D0
        MVO     R1,     G_01D1                  ; DA8F   0241 01D1
        SDBD                                    ; DA91   0001
        MVII    #$7A86, R1                      ; DA92   02B9 0086 007A
        MVO     R1,     G_033E                  ; DA95   0241 033E
        MVO     R1,     G_033F                  ; DA97   0241 033F

        JSR     R5,     L_5007                  ; DA99   0004 0150 0007
        JSR     R5,     L_53FE                  ; DA9C   0004 0150 03FE

        MVII    #$013A, R1                      ; DA9F   02B9 013A
        ADD     G_013C, R1                      ; DAA1   02C1 013C
        MVII    #$0001, R0                      ; DAA3   02B8 0001
        MVO@    R0,     R1                      ; DAA5   0248
        MVO     R0,     G_0106                  ; DAA6   0240 0106
        MVII    #$0000, R4                      ; DAA8   02BC 0000
        MVII    #$0018, R0                      ; DAAA   02B8 0018

        JSR     R5,     L_6FBF                  ; DAAC   0004 016C 03BF

        MVII    #$0001, R1                      ; DAAF   02B9 0001
        MVO     R1,     .STIC.EDGE              ; DAB1   0241 0032
        SDBD                                    ; DAB3   0001
        MVII    #$5F5F, R2                      ; DAB4   02BA 005F 005F

        JSR     R5,     X_FILL_ZERO             ; DAB7   0004 0114 0338
L_DABA:
        JSR     R5,     L_6FBF                  ; DABA   0004 016C 03BF

        MVII    #$0007, R0                      ; DABD   02B8 0007
        MVO     R0,     .STIC.HDLY              ; DABF   0240 0030

        JSR     R5,     G_7BE5                  ; DAC1   0004 0178 03E5
        JSR     R5,     L_5D09                  ; DAC4   0004 015C 0109
        JSR     R5,     G_7C18                  ; DAC7   0004 017C 0018

        SDBD                                    ; DACA   0001
        CMPI    #$5F87, R2                      ; DACB   037A 0087 005F
        BNEQ    L_DABA                          ; DACE   022C 0015

L_DAD0:
        JSR     R5,     L_6FBF                  ; DAD0   0004 016C 03BF

        CLRR    R0                              ; DAD3   01C0
        MVO     R0,     .STIC.EDGE              ; DAD4   0240 0032

        JSR     R5,     L_5D09                  ; DAD6   0004 015C 0109

        MVI     G_014C, R2                      ; DAD9   0282 014C
        TSTR    R2                              ; DADB   0092
        BEQ     L_DAD0                          ; DADC   0224 000D

        MVII    #$0002, R1                      ; DADE   02B9 0002
        MVO     R1,     G_01E5                  ; DAE0   0241 01E5
        CLRR    R0                              ; DAE2   01C0
        MVO     R0,     G_0148                  ; DAE3   0240 0148
        MVO     R0,     G_0149                  ; DAE5   0240 0149
        MVO     R0,     G_014A                  ; DAE7   0240 014A

        JSR     R5,     L_6FBF                  ; DAE9   0004 016C 03BF

        MVII    #$0000, R4                      ; DAEC   02BC 0000
        MVII    #$0018, R0                      ; DAEE   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; DAF0   0004 0114 0338
        JSR     R5,     L_5D09                  ; DAF3   0004 015C 0109
        JSR     R5,     L_6FBF                  ; DAF6   0004 016C 03BF

        CLRR    R1                              ; DAF9   01C9
        MVO     R1,     .STIC.EDGE              ; DAFA   0241 0032
        INCR    R1                              ; DAFC   0009
        MVO     R1,     .STIC.BORD              ; DAFD   0241 002C

        JSR     R5,     L_5D09                  ; DAFF   0004 015C 0109

L_DB02:
        SDBD                                    ; DB02   0001
        MVII    #$633F, R4                      ; DB03   02BC 003F 0063
        SDBD                                    ; DB06   0001
        MVII    #$3800, R5                      ; DB07   02BD 0000 0038
        MVII    #$0008, R1                      ; DB0A   02B9 0008
L_DB0C:
        MVII    #$0040, R0                      ; DB0C   02B8 0040
        PSHR    R5                              ; DB0E   0275

L_DB0F:
        JSR     R5,     L_6FCC                  ; DB0F   0004 016C 03CC

        PSHR    R5                              ; DB12   0275

        JSR     R5,     L_5D09                  ; DB13   0004 015C 0109

        PULR    R5                              ; DB16   02B5
        DECR    R1                              ; DB17   0011
        BNEQ    L_DB0C                          ; DB18   022C 000D

        SDBD                                    ; DB1A   0001
        MVII    #$7C29, R4                      ; DB1B   02BC 0029 007C
        MVII    #$0018, R3                      ; DB1E   02BB 0018
        MVII    #$02F0, R5                      ; DB20   02BD 02F0
L_DB22:
        SDBD                                    ; DB22   0001
        MVI@    R4,     R1                      ; DB23   02A1
        MVO@    R1,     R5                      ; DB24   0269
        DECR    R3                              ; DB25   0013
        BNEQ    L_DB22                          ; DB26   022C 0005

        SDBD                                    ; DB28   0001
        MVII    #$68F6, R0                      ; DB29   02B8 00F6 0068
        MVO     R0,     G_0309                  ; DB2C   0240 0309
        SDBD                                    ; DB2E   0001
        MVII    #$6921, R0                      ; DB2F   02B8 0021 0069
        MVO     R0,     G_030A                  ; DB32   0240 030A
        SDBD                                    ; DB34   0001
        MVII    #$6926, R0                      ; DB35   02B8 0026 0069
        MVO     R0,     G_030B                  ; DB38   0240 030B
        CLRR    R0                              ; DB3A   01C0
        MVO     R0,     G_01EE                  ; DB3B   0240 01EE
        MVO     R0,     G_0107                  ; DB3D   0240 0107
        MVO     R0,     G_0320                  ; DB3F   0240 0320
        MVII    #$0330, R0                      ; DB41   02B8 0330
        MVO     R0,     G_0134                  ; DB43   0240 0134
        ADDI    #$0008, R0                      ; DB45   02F8 0008
        MVO     R0,     G_02F4                  ; DB47   0240 02F4
        MVII    #$0348, R0                      ; DB49   02B8 0348
        MVO     R0,     G_0133                  ; DB4B   0240 0133
        ADDI    #$0008, R0                      ; DB4D   02F8 0008
        MVO     R0,     G_02F3                  ; DB4F   0240 02F3
        MVII    #$0360, R0                      ; DB51   02B8 0360
        MVO     R0,     G_0132                  ; DB53   0240 0132
        ADDI    #$0008, R0                      ; DB55   02F8 0008
        MVO     R0,     G_02F2                  ; DB57   0240 02F2
        SDBD                                    ; DB59   0001
        MVII    #$7C71, R4                      ; DB5A   02BC 0071 007C
        SDBD                                    ; DB5D   0001
        MVII    #$1E81, R0                      ; DB5E   02B8 0081 001E
L_DB61:
        MVI@    R4,     R1                      ; DB61   02A1
        TSTR    R1                              ; DB62   0089
        BEQ     L_DB68                          ; DB63   0204 0003

        MVO@    R0,     R1                      ; DB65   0248
        B       L_DB61                          ; DB66   0220 0006

L_DB68:
        SDBD                                    ; DB68   0001
        MVII    #$7BDC, R4                      ; DB69   02BC 00DC 007B
        MVII    #$0109, R1                      ; DB6C   02B9 0109
        MVII    #$0009, R0                      ; DB6E   02B8 0009

        JSR     R5,     .EXEC.730               ; DB70   0004 0114 0330

        MVII    #$0003, R3                      ; DB73   02BB 0003
        MVII    #$010A, R4                      ; DB75   02BC 010A
        SDBD                                    ; DB77   0001
        MVII    #$18B9, R1                      ; DB78   02B9 00B9 0018
L_DB7B:
        MVI@    R4,     R5                      ; DB7B   02A5
        ADDI    #$0200, R5                      ; DB7C   02FD 0200
        MVO@    R1,     R5                      ; DB7E   0269
        ADDI    #$0002, R4                      ; DB7F   02FC 0002
        DECR    R3                              ; DB81   0013
        BNEQ    L_DB7B                          ; DB82   022C 0008

        MVII    #$0003, R3                      ; DB84   02BB 0003
        MVII    #$010B, R4                      ; DB86   02BC 010B
        SDBD                                    ; DB88   0001
        MVII    #$18D9, R1                      ; DB89   02B9 00D9 0018
L_DB8C:
        MVI@    R4,     R5                      ; DB8C   02A5
        ADDI    #$0200, R5                      ; DB8D   02FD 0200
        MVO@    R1,     R5                      ; DB8F   0269
        ADDI    #$0002, R4                      ; DB90   02FC 0002
        DECR    R3                              ; DB92   0013
        BNEQ    L_DB8C                          ; DB93   022C 0008

        CLRR    R0                              ; DB95   01C0
        MVO     R0,     G_0115                  ; DB96   0240 0115
        SDBD                                    ; DB98   0001
        MVII    #$0810, R1                      ; DB99   02B9 0010 0008
        MVO     R1,     G_031B                  ; DB9C   0241 031B
        MVII    #$0010, R1                      ; DB9E   02B9 0010
        MVO     R1,     G_031C                  ; DBA0   0241 031C
        SDBD                                    ; DBA2   0001
        MVII    #$1210, R1                      ; DBA3   02B9 0010 0012
        MVO     R1,     G_031D                  ; DBA6   0241 031D

        JSR     R5,     G_7CEA                  ; DBA8   0004 017C 00EA

        MVII    #$000B, R3                      ; DBAB   02BB 000B
        SDBD                                    ; DBAD   0001
        MVII    #$7BBB, R4                      ; DBAE   02BC 00BB 007B
L_DBB1:
        MVI@    R4,     R1                      ; DBB1   02A1
        SDBD                                    ; DBB2   0001
        MVI@    R4,     R2                      ; DBB3   02A2
        MVO@    R2,     R1                      ; DBB4   024A
        DECR    R3                              ; DBB5   0013
        BNEQ    L_DBB1                          ; DBB6   022C 0006
        J       G_70BF                          ; DBB8   0004 0370 00BF
        BGE     L_DC3A                          ; DBBB   020D 007D

        COMR    R7                              ; DBBD   001F
        DECLE   $0237                           ; DBBE   0237

        SARC    R1,     2                       ; DBBF   007D
        COMR    R7                              ; DBC0   001F
        MVO@    R4,     R1                      ; DBC1   024C
        SARC    R1,     2                       ; DBC2   007D
        COMR    R7                              ; DBC3   001F
        MVO@    R6,     R1                      ; DBC4   024E
        MOVR    R0,     R5                      ; DBC5   0085
        INCR    R1                              ; DBC6   0009
        PSHR    R7                              ; DBC7   0277
        MOVR    R0,     R5                      ; DBC8   0085
        INCR    R1                              ; DBC9   0009
        DECLE   $0211                           ; DBCA   0211

        ADDR    R4,     R2                      ; DBCB   00E2
        INCR    R7                              ; DBCC   000F
L_DBCD:
        DECLE   $0212                           ; DBCD   0212

        ADDR    R6,     R2                      ; DBCE   00F2
        INCR    R7                              ; DBCF   000F
        BLT     L_DB0F                          ; DBD0   0225 00C2

        INCR    R7                              ; DBD2   000F
        BLE     L_DB02                          ; DBD3   0226 00D2

        INCR    R7                              ; DBD5   000F
        DECLE   $0239                           ; DBD6   0239

        INCR    R2                              ; DBD7   000A
        INCR    R6                              ; DBD8   000E
        DECLE   $023A                           ; DBD9   023A

        ADCR    R2                              ; DBDA   002A
        INCR    R6                              ; DBDB   000E
        ADDR    R7,     R7                      ; DBDC   00FF
        RLC     R1,     2                       ; DBDD   0055
        RLC     R2,     2                       ; DBDE   0056
        ADDR    R7,     R7                      ; DBDF   00FF
        MOVR    R2,     R4                      ; DBE0   0094
        MOVR    R2,     R5                      ; DBE1   0095
        ADDR    R7,     R7                      ; DBE2   00FF
        ADDR    R2,     R3                      ; DBE3   00D3
        ADDR    R2,     R4                      ; DBE4   00D4
        PSHR    R5                              ; DBE5   0275
        MVII    #$00F0, R3                      ; DBE6   02BB 00F0
        MVII    #$0200, R5                      ; DBE8   02BD 0200
        MVII    #$0201, R4                      ; DBEA   02BC 0201
L_DBEC:
        MVI@    R4,     R1                      ; DBEC   02A1
        MVO@    R1,     R5                      ; DBED   0269
        DECR    R3                              ; DBEE   0013
        BNEQ    L_DBEC                          ; DBEF   022C 0004

        MVII    #$000C, R0                      ; DBF1   02B8 000C
        MOVR    R2,     R5                      ; DBF3   0095
        MVII    #$0213, R4                      ; DBF4   02BC 0213
L_DBF6:
        MVI@    R5,     R3                      ; DBF6   02AB
        MOVR    R3,     R1                      ; DBF7   0099
        ANDI    #$03F0, R3                      ; DBF8   03BB 03F0
        SUBR    R3,     R1                      ; DBFA   0119
        SAR     R3,     1                       ; DBFB   006B
        SDBD                                    ; DBFC   0001
        ADDI    #$0800, R3                      ; DBFD   02FB 0000 0008
        PSHR    R2                              ; DC00   0272
        MOVR    R1,     R2                      ; DC01   008A
        ANDI    #$0003, R1                      ; DC02   03B9 0003
        SUBR    R1,     R2                      ; DC04   010A
        SWAP    R1,     1                       ; DC05   0041
        SLL     R1,     1                       ; DC06   0049
        SWAP    R2,     1                       ; DC07   0042
        SLL     R2,     2                       ; DC08   004E
        ADDR    R1,     R3                      ; DC09   00CB
        ADDR    R2,     R3                      ; DC0A   00D3
        PULR    R2                              ; DC0B   02B2
        ADD@    R5,     R3                      ; DC0C   02EB
        MVO@    R3,     R4                      ; DC0D   0263
        ADDI    #$0026, R5                      ; DC0E   02FD 0026
        ADDI    #$0013, R4                      ; DC10   02FC 0013
        DECR    R0                              ; DC12   0010
        BNEQ    L_DBF6                          ; DC13   022C 001E

        INCR    R2                              ; DC15   000A
        INCR    R2                              ; DC16   000A
        PULR    R7                              ; DC17   02B7
        PSHR    R5                              ; DC18   0275

L_DC19:
        JSR     R5,     L_6FBF                  ; DC19   0004 016C 03BF

        MVI     .STIC.HDLY,R0                   ; DC1C   0280 0030
        DECR    R0                              ; DC1E   0010
        MVO     R0,     .STIC.HDLY              ; DC1F   0240 0030

        JSR     R5,     L_5D09                  ; DC21   0004 015C 0109

        ANDI    #$0007, R0                      ; DC24   03B8 0007
        BNEQ    L_DC19                          ; DC26   022C 000E

        PULR    R7                              ; DC28   02B7
        DECR    R4                              ; DC29   0014
        DIS                                     ; DC2A   0003
        DECR    R4                              ; DC2B   0014
        DIS                                     ; DC2C   0003
        SLR     R0,     1                       ; DC2D   0060
        DIS                                     ; DC2E   0003
        SLL     R0,     1                       ; DC2F   0048
        DIS                                     ; DC30   0003
        GSWD    R0                              ; DC31   0030
        DIS                                     ; DC32   0003
        SWAP    R0,     2                       ; DC33   0044
        DIS                                     ; DC34   0003
        GSWD    R2                              ; DC35   0032
        DIS                                     ; DC36   0003
        COMR    R4                              ; DC37   001C
        DIS                                     ; DC38   0003
        ADDR    R3,     R6                      ; DC39   00DE
L_DC3A:
        DECLE   $0000                           ; DC3A   0000

        ADDR    R3,     R4                      ; DC3B   00DC
        DECLE   $0000                           ; DC3C   0000

        ADDR    R3,     R0                      ; DC3D   00D8
        DECLE   $0000                           ; DC3E   0000

        ADDR    R0,     R0                      ; DC3F   00C0
        DECLE   $0000                           ; DC40   0000

        MOVR    R5,     R0                      ; DC41   00A8
        DECLE   $0000                           ; DC42   0000

        ADDR    R4,     R2                      ; DC43   00E2
        DECLE   $0000                           ; DC44   0000

        ADDR    R1,     R5                      ; DC45   00CD
        DECLE   $0000                           ; DC46   0000

        MOVR    R6,     R4                      ; DC47   00B4
        DECLE   $0000                           ; DC48   0000

        NEGR    R7                              ; DC49   0027
        INCR    R1                              ; DC4A   0009
        SLR     R2,     1                       ; DC4B   0062
        INCR    R1                              ; DC4C   0009
        SARC    R3,     2                       ; DC4D   007F
        INCR    R0                              ; DC4E   0008
        SARC    R3,     2                       ; DC4F   007F
        INCR    R0                              ; DC50   0008
        SARC    R3,     2                       ; DC51   007F
        INCR    R0                              ; DC52   0008
        CLRC                                    ; DC53   0006
        COMR    R1                              ; DC54   0019
        CLRC                                    ; DC55   0006
        COMR    R1                              ; DC56   0019
        CLRC                                    ; DC57   0006
        COMR    R1                              ; DC58   0019
        MVI     .BTAB.08,R1                     ; DC59   0281 0208
        MOVR    R1,     R0                      ; DC5B   0088
        SDBD                                    ; DC5C   0001
        ANDI    #$3FE7, R1                      ; DC5D   03B9 00E7 003F
        ADDI    #$0008, R0                      ; DC60   02F8 0008
        ANDI    #$0018, R0                      ; DC62   03B8 0018
        ADDR    R0,     R1                      ; DC64   00C1
        SDBD                                    ; DC65   0001
        MVII    #$7C71, R4                      ; DC66   02BC 0071 007C
L_DC69:
        MVI@    R4,     R2                      ; DC69   02A2
        TSTR    R2                              ; DC6A   0092
        BEQ     L_DC70                          ; DC6B   0204 0003

        MVO@    R1,     R2                      ; DC6D   0251
        B       L_DC69                          ; DC6E   0220 0006

L_DC70:
        MOVR    R5,     R7                      ; DC70   00AF
        SKIP                                    ; DC71   0208
        DECLE   $021D                           ; DC72   021D

        BNOV    L_DA42                          ; DC73   022A 0232

        MVO@    R0,     R1                      ; DC75   0248
        PSHR    R1                              ; DC76   0271
        MVI@    R3,     R3                      ; DC77   029B
        PULR    R1                              ; DC78   02B1
        ADD@    R3,     R2                      ; DC79   02DA
        DECLE   $0000                           ; DC7A   0000

        MVI     G_0115, R0                      ; DC7B   0280 0115
        ANDI    #$0080, R0                      ; DC7D   03B8 0080
        BEQ     L_DC82                          ; DC7F   0204 0001

        MOVR    R5,     R7                      ; DC81   00AF
L_DC82:
        PSHR    R5                              ; DC82   0275
        MVII    #$0003, R5                      ; DC83   02BD 0003
        MVII    #$02F5, R2                      ; DC85   02BA 02F5
        MVII    #$0309, R3                      ; DC87   02BB 0309
L_DC89:
        CLRR    R0                              ; DC89   01C0
        MVO     R0,     G_0311                  ; DC8A   0240 0311
        PSHR    R5                              ; DC8C   0275
        PSHR    R2                              ; DC8D   0272
        PSHR    R1                              ; DC8E   0271

        JSR     R5,     L_6EB2                  ; DC8F   0004 016C 02B2

        PULR    R1                              ; DC92   02B1
        PULR    R2                              ; DC93   02B2
        PULR    R5                              ; DC94   02B5
        SDBD                                    ; DC95   0001
        MVII    #$74F2, R1                      ; DC96   02B9 00F2 0074
        SUBR    R5,     R1                      ; DC99   0129
        MVI     G_0320, R0                      ; DC9A   0280 0320
        AND@    R1,     R0                      ; DC9C   0388
        BEQ     L_DCB1                          ; DC9D   0204 0012

        MVI     G_0311, R4                      ; DC9F   0284 0311
        PSHR    R2                              ; DCA1   0272
        PSHR    R5                              ; DCA2   0275
        PSHR    R1                              ; DCA3   0271
        MVII    #$02F0, R2                      ; DCA4   02BA 02F0
        SDBD                                    ; DCA6   0001
        MVII    #$7CAE, R5                      ; DCA7   02BD 00AE 007C
        PSHR    R5                              ; DCAA   0275

        JSR     R5,     L_6EDB                  ; DCAB   0004 016C 02DB

        PULR    R1                              ; DCAE   02B1
        PULR    R5                              ; DCAF   02B5
        PULR    R2                              ; DCB0   02B2
L_DCB1:
        MVII    #$014B, R1                      ; DCB1   02B9 014B
        SUBR    R5,     R1                      ; DCB3   0129
        MVI@    R1,     R4                      ; DCB4   028C
        TSTR    R4                              ; DCB5   00A4
        BNEQ    L_DCCA                          ; DCB6   020C 0012

        PSHR    R5                              ; DCB8   0275

        JSR     R5,     G_7FA0                  ; DCB9   0004 017C 03A0

        PULR    R5                              ; DCBC   02B5
        CMPI    #$0001, R0                      ; DCBD   0378 0001
        BNEQ    L_DCC4                          ; DCBF   020C 0003

        MVII    #$0011, R0                      ; DCC1   02B8 0011
        MVO@    R0,     R1                      ; DCC3   0248
L_DCC4:
        INCR    R2                              ; DCC4   000A
        INCR    R3                              ; DCC5   000B
        DECR    R5                              ; DCC6   0015
        BNEQ    L_DC89                          ; DCC7   022C 003F

        PULR    R7                              ; DCC9   02B7
L_DCCA:
        DECR    R4                              ; DCCA   0014
        MVO@    R4,     R1                      ; DCCB   024C
        ADDI    #$0010, R2                      ; DCCC   02FA 0010
        MVI@    R2,     R1                      ; DCCE   0291
        SDBD                                    ; DCCF   0001
        ADDI    #$7CD9, R4                      ; DCD0   02FC 00D9 007C
        XOR@    R4,     R1                      ; DCD3   03E1
        MVO@    R1,     R2                      ; DCD4   0251
        SUBI    #$0010, R2                      ; DCD5   033A 0010
        B       L_DCC4                          ; DCD7   0220 0014

        DECLE   $0000,  $0000                   ; DCD9   0000 0000

        CMPR    R0,     R0                      ; DCDB   0140
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCDC   0000 0000 0000 0000
        DECLE   $0000                           ; DCE0   0000

        NEGR    R0                              ; DCE1   0020
        DECLE   $0000,  $0000,  $0000           ; DCE2   0000 0000 0000

        NEGR    R0                              ; DCE5   0020
        DECLE   $0000,  $0000,  $0000           ; DCE6   0000 0000 0000

        CMPR    R0,     R0                      ; DCE9   0140
        CLRR    R0                              ; DCEA   01C0
        MVO     R0,     G_0124                  ; DCEB   0240 0124
        MVI     G_0126, R0                      ; DCED   0280 0126
        CMPI    #$0005, R0                      ; DCEF   0378 0005
        BMI     L_DCF5                          ; DCF1   020B 0002

        MVII    #$0004, R0                      ; DCF3   02B8 0004
L_DCF5:
        ADDI    #$0005, R0                      ; DCF5   02F8 0005
        MVO     R0,     G_0125                  ; DCF7   0240 0125
        MOVR    R5,     R7                      ; DCF9   00AF
        MVII    #$0127, R3                      ; DCFA   02BB 0127
        CLRR    R4                              ; DCFC   01E4
L_DCFD:
        MVI@    R3,     R1                      ; DCFD   0299
        MOVR    R1,     R0                      ; DCFE   0088
        ANDI    #$003F, R1                      ; DCFF   03B9 003F
        TSTR    R1                              ; DD01   0089
        BEQ     L_DE08                          ; DD02   0204 0104

        CLRR    R5                              ; DD04   01ED
        DECR    R5                              ; DD05   0015
        ANDI    #$0080, R0                      ; DD06   03B8 0080
        BEQ     L_DD0B                          ; DD08   0204 0001

        NEGR    R5                              ; DD0A   0025
L_DD0B:
        MVII    #$02F2, R2                      ; DD0B   02BA 02F2
        ADDR    R4,     R2                      ; DD0D   00E2
        MVI@    R2,     R1                      ; DD0E   0291
        ADDR    R5,     R1                      ; DD0F   00E9
        MVO@    R1,     R2                      ; DD10   0251
        ADDI    #$0008, R2                      ; DD11   02FA 0008
        MVI@    R2,     R1                      ; DD13   0291
        ADDR    R5,     R1                      ; DD14   00E9
        MVO@    R1,     R2                      ; DD15   0251
        MOVR    R3,     R1                      ; DD16   0099
        ADDI    #$000E, R1                      ; DD17   02F9 000E
        MVI@    R1,     R0                      ; DD19   0288
        TSTR    R0                              ; DD1A   0080
        BEQ     L_DD21                          ; DD1B   0204 0004

        CMPI    #$0003, R0                      ; DD1D   0378 0003
        BMI     L_DD27                          ; DD1F   020B 0006

L_DD21:
        ADDI    #$0008, R2                      ; DD21   02FA 0008
        MVI@    R2,     R1                      ; DD23   0291
        XORI    #$0010, R1                      ; DD24   03F9 0010
        MVO@    R1,     R2                      ; DD26   0251
L_DD27:
        MVI@    R3,     R1                      ; DD27   0299
        DECR    R1                              ; DD28   0011
        MVO@    R1,     R3                      ; DD29   0259
        SDBD                                    ; DD2A   0001
        MVII    #$51D8, R1                      ; DD2B   02B9 00D8 0051
        ADDR    R4,     R1                      ; DD2E   00E1
        MVI@    R1,     R0                      ; DD2F   0288
        SWAP    R0,     1                       ; DD30   0040
        AND     G_0320, R0                      ; DD31   0380 0320
        BEQ     L_DD3F                          ; DD33   0204 000A

        MVI     G_02F0, R1                      ; DD35   0281 02F0
        ADDR    R5,     R1                      ; DD37   00E9
        MVO     R1,     G_02F0                  ; DD38   0241 02F0
        MVI     G_02F8, R1                      ; DD3A   0281 02F8
        ADDR    R5,     R1                      ; DD3C   00E9
        MVO     R1,     G_02F8                  ; DD3D   0241 02F8
L_DD3F:
        MOVR    R3,     R2                      ; DD3F   009A
        ADDI    #$000E, R2                      ; DD40   02FA 000E
        MVI@    R2,     R1                      ; DD42   0291
        TSTR    R1                              ; DD43   0089
        BNEQ    L_DE20                          ; DD44   020C 00DA

        JSR     R5,     G_7FA0                  ; DD46   0004 017C 03A0

        CMPI    #$0001, R0                      ; DD49   0378 0001
        BNEQ    L_DD5B                          ; DD4B   020C 000E

        MVII    #$000D, R1                      ; DD4D   02B9 000D
        SUB     G_0126, R1                      ; DD4F   0301 0126
        MVO@    R1,     R2                      ; DD51   0251
        MVII    #$0302, R2                      ; DD52   02BA 0302
        ADDR    R4,     R2                      ; DD54   00E2
        MVI@    R2,     R1                      ; DD55   0291
        SDBD                                    ; DD56   0001
        XORI    #$1000, R1                      ; DD57   03F9 0000 0010
        MVO@    R1,     R2                      ; DD5A   0251
L_DD5B:
        INCR    R3                              ; DD5B   000B
        INCR    R4                              ; DD5C   000C
        MOVR    R4,     R1                      ; DD5D   00A1
        ANDI    #$0004, R1                      ; DD5E   03B9 0004
        BEQ     L_DCFD                          ; DD60   0224 0064

        MVII    #$0002, R4                      ; DD62   02BC 0002
        MVII    #$012B, R3                      ; DD64   02BB 012B
L_DD66:
        MVI@    R3,     R1                      ; DD66   0299
        ANDI    #$0080, R1                      ; DD67   03B9 0080
        BEQ     L_DDBA                          ; DD69   0204 004F

        MVII    #$02F6, R2                      ; DD6B   02BA 02F6

        JSR     R5,     G_7DF1                  ; DD6D   0004 017C 01F1

        MVI@    R3,     R1                      ; DD70   0299
        DECR    R1                              ; DD71   0011
        DECR    R1                              ; DD72   0011
        MVO@    R1,     R3                      ; DD73   0259
        ANDI    #$007F, R1                      ; DD74   03B9 007F
        BEQ     L_DDD9                          ; DD76   0204 0061

        MVI     G_0126, R2                      ; DD78   0282 0126
        SLR     R2,     1                       ; DD7A   0062
        ANDI    #$0003, R2                      ; DD7B   03BA 0003
        SDBD                                    ; DD7D   0001
        ADDI    #$7DED, R2                      ; DD7E   02FA 00ED 007D
        CMP@    R2,     R1                      ; DD81   0351
        BNEQ    L_DDBA                          ; DD82   020C 0036

        CMPI    #$012B, R3                      ; DD84   037B 012B
        BEQ     L_DDA2                          ; DD86   0204 001A

        DECR    R3                              ; DD88   0013
        MVI@    R3,     R1                      ; DD89   0299
        ANDI    #$0080, R1                      ; DD8A   03B9 0080
        BNEQ    L_DDBE                          ; DD8C   020C 0030

        MVI@    R3,     R1                      ; DD8E   0299
        XORI    #$0080, R1                      ; DD8F   03F9 0080
        MVO@    R1,     R3                      ; DD91   0259
        INCR    R3                              ; DD92   000B
        PSHR    R3                              ; DD93   0273
        PSHR    R4                              ; DD94   0274
        SDBD                                    ; DD95   0001
        MVII    #$50E1, R3                      ; DD96   02BB 00E1 0050
        MVII    #$0001, R1                      ; DD99   02B9 0001

        JSR     R5,     .HEADER                 ; DD9B   0004 0150 0000

        PULR    R4                              ; DD9E   02B4
        PULR    R3                              ; DD9F   02B3
        B       L_DDBE                          ; DDA0   0200 001C

L_DDA2:
        INCR    R3                              ; DDA2   000B
        MVI@    R3,     R1                      ; DDA3   0299
        ANDI    #$0080, R1                      ; DDA4   03B9 0080
        BNEQ    L_DDBA                          ; DDA6   020C 0012

        MVI@    R3,     R1                      ; DDA8   0299
        XORI    #$0080, R1                      ; DDA9   03F9 0080
        MVO@    R1,     R3                      ; DDAB   0259
        PSHR    R3                              ; DDAC   0273
        PSHR    R4                              ; DDAD   0274
        SDBD                                    ; DDAE   0001
        MVII    #$50E1, R3                      ; DDAF   02BB 00E1 0050
        MVII    #$0001, R1                      ; DDB2   02B9 0001

        JSR     R5,     .HEADER                 ; DDB4   0004 0150 0000

        PULR    R4                              ; DDB7   02B4
        PULR    R3                              ; DDB8   02B3
        DECR    R3                              ; DDB9   0013
L_DDBA:
        INCR    R3                              ; DDBA   000B
        DECR    R4                              ; DDBB   0014
        BNEQ    L_DD66                          ; DDBC   022C 0057

L_DDBE:
        MVII    #$012B, R3                      ; DDBE   02BB 012B
        MVI@    R3,     R1                      ; DDC0   0299
        ANDI    #$0080, R1                      ; DDC1   03B9 0080
        BNEQ    L_DDD8                          ; DDC3   020C 0013

        INCR    R3                              ; DDC5   000B
        MVI@    R3,     R1                      ; DDC6   0299
        ANDI    #$0080, R1                      ; DDC7   03B9 0080
        BNEQ    L_DDD8                          ; DDC9   020C 000D

        MVI@    R3,     R1                      ; DDCB   0299
        XORI    #$0080, R1                      ; DDCC   03F9 0080
        MVO@    R1,     R3                      ; DDCE   0259
        MVII    #$0001, R1                      ; DDCF   02B9 0001
        SDBD                                    ; DDD1   0001
        MVII    #$50E1, R3                      ; DDD2   02BB 00E1 0050

        JSR     R5,     .HEADER                 ; DDD5   0004 0150 0000

L_DDD8:
        PULR    R7                              ; DDD8   02B7
L_DDD9:
        MVII    #$0048, R1                      ; DDD9   02B9 0048
        MVO@    R1,     R3                      ; DDDB   0259
        MOVR    R4,     R1                      ; DDDC   00A1
        SUBI    #$0002, R1                      ; DDDD   0339 0002
        ANDI    #$0001, R1                      ; DDDF   03B9 0001
        ADDI    #$02F6, R1                      ; DDE1   02F9 02F6
        MVII    #$03A8, R0                      ; DDE3   02B8 03A8
        MVO@    R0,     R1                      ; DDE5   0248
        ADDI    #$0008, R1                      ; DDE6   02F9 0008
L_DDE8:
        MVII    #$01C8, R0                      ; DDE8   02B8 01C8
        MVO@    R0,     R1                      ; DDEA   0248
        B       L_DDBA                          ; DDEB   0220 0032

        INCR    R0                              ; DDED   0008
        COMR    R0                              ; DDEE   0018
        ADCR    R0                              ; DDEF   0028
        GSWD    R0                              ; DDF0   0030
        MOVR    R4,     R0                      ; DDF1   00A0
        SUBI    #$0002, R0                      ; DDF2   0338 0002
        ANDI    #$0001, R0                      ; DDF4   03B8 0001
        ADDR    R0,     R2                      ; DDF6   00C2
        MVI@    R2,     R1                      ; DDF7   0291
        SUBI    #$0002, R1                      ; DDF8   0339 0002
        MVO@    R1,     R2                      ; DDFA   0251
        ADDI    #$0008, R2                      ; DDFB   02FA 0008
        MVI@    R2,     R1                      ; DDFD   0291
        SUBI    #$0002, R1                      ; DDFE   0339 0002
        MVO@    R1,     R2                      ; DE00   0251
        ADDI    #$0008, R2                      ; DE01   02FA 0008
        MVI@    R2,     R1                      ; DE03   0291
        XORI    #$0010, R1                      ; DE04   03F9 0010
        MVO@    R1,     R2                      ; DE06   0251
        MOVR    R5,     R7                      ; DE07   00AF
L_DE08:
        MVII    #$0302, R2                      ; DE08   02BA 0302
        ADDR    R4,     R2                      ; DE0A   00E2
        MVI@    R2,     R1                      ; DE0B   0291
        XORI    #$0060, R1                      ; DE0C   03F9 0060
        MVO@    R1,     R2                      ; DE0E   0251
        SDBD                                    ; DE0F   0001
        MVII    #$7E1C, R2                      ; DE10   02BA 001C 007E
        ADDR    R4,     R2                      ; DE13   00E2
        MVI@    R2,     R0                      ; DE14   0290
        MVI@    R3,     R1                      ; DE15   0299
        XORI    #$0080, R1                      ; DE16   03F9 0080
        ADDR    R0,     R1                      ; DE18   00C1
        MVO@    R1,     R3                      ; DE19   0259
        B       L_DD3F                          ; DE1A   0220 00DC

        GSWD    R0                              ; DE1C   0030
        GSWD    R0                              ; DE1D   0030
        ADCR    R0                              ; DE1E   0028
        ADCR    R0                              ; DE1F   0028
L_DE20:
        DECR    R1                              ; DE20   0011
        MVO@    R1,     R2                      ; DE21   0251
        CMPI    #$0002, R1                      ; DE22   0379 0002
        BEQ     L_DE32                          ; DE24   0204 000C

        TSTR    R1                              ; DE26   0089
        BNEQ    L_DD5B                          ; DE27   022C 00CD

        MVII    #$0302, R2                      ; DE29   02BA 0302
        ADDR    R4,     R2                      ; DE2B   00E2
        MVI@    R2,     R1                      ; DE2C   0291
        XORI    #$0080, R1                      ; DE2D   03F9 0080
        MVO@    R1,     R2                      ; DE2F   0251
        B       L_DD5B                          ; DE30   0220 00D6

L_DE32:
        MVII    #$0302, R2                      ; DE32   02BA 0302
        ADDR    R4,     R2                      ; DE34   00E2
        MVI@    R2,     R1                      ; DE35   0291
        SDBD                                    ; DE36   0001
        XORI    #$1000, R1                      ; DE37   03F9 0000 0010
        SDBD                                    ; DE3A   0001
        ANDI    #$3FEF, R1                      ; DE3B   03B9 00EF 003F
        XORI    #$0090, R1                      ; DE3E   03F9 0090
        MVO@    R1,     R2                      ; DE40   0251
        PSHR    R3                              ; DE41   0273
        PSHR    R4                              ; DE42   0274
        MVII    #$0001, R1                      ; DE43   02B9 0001
        SDBD                                    ; DE45   0001
        MVII    #$50DB, R3                      ; DE46   02BB 00DB 0050

        JSR     R5,     .HEADER                 ; DE49   0004 0150 0000

        PULR    R4                              ; DE4C   02B4
        PULR    R3                              ; DE4D   02B3
        SDBD                                    ; DE4E   0001
        MVII    #$51D8, R1                      ; DE4F   02B9 00D8 0051
        ADDR    R4,     R1                      ; DE52   00E1
        MVI@    R1,     R0                      ; DE53   0288
        SWAP    R0,     1                       ; DE54   0040
        AND     G_0320, R0                      ; DE55   0380 0320
        BEQ     L_DD5B                          ; DE57   0224 00FD

        SDBD                                    ; DE59   0001
        MVII    #$50B5, R3                      ; DE5A   02BB 00B5 0050
        CLRR    R1                              ; DE5D   01C9

        JSR     R5,     .HEADER                 ; DE5E   0004 0150 0000
        JSR     R5,     L_6DF2                  ; DE61   0004 016C 01F2

        PULR    R7                              ; DE64   02B7
        MVII    #$012F, R4                      ; DE65   02BC 012F
        MVII    #$0003, R1                      ; DE67   02B9 0003
        CLRR    R2                              ; DE69   01D2
L_DE6A:
        MVI@    R4,     R0                      ; DE6A   02A0
        ANDI    #$0003, R0                      ; DE6B   03B8 0003
        BEQ     L_DE70                          ; DE6D   0204 0001

        INCR    R2                              ; DE6F   000A
L_DE70:
        DECR    R1                              ; DE70   0011
        BNEQ    L_DE6A                          ; DE71   022C 0008

        MOVR    R5,     R7                      ; DE73   00AF
        MVI     G_0323, R0                      ; DE74   0280 0323
        TSTR    R0                              ; DE76   0080
        BEQ     L_DE7F                          ; DE77   0204 0006

        SDBD                                    ; DE79   0001
        MVII    #$0957, R0                      ; DE7A   02B8 0057 0009
        MVO     R0,     G_0300                  ; DE7D   0240 0300
L_DE7F:
        MVI     G_014D, R0                      ; DE7F   0280 014D
        ANDI    #$0001, R0                      ; DE81   03B8 0001
        BNEQ    L_DF0E                          ; DE83   020C 0089

        MVI     G_031F, R4                      ; DE85   0284 031F
L_DE87:
        MVI@    R4,     R1                      ; DE87   02A1
        CMPI    #$0100, R1                      ; DE88   0379 0100
        BEQ     L_DEE9                          ; DE8A   0204 005D

        MVO     R4,     G_031F                  ; DE8C   0244 031F
L_DE8E:
        SUBI    #$0008, R1                      ; DE8E   0339 0008
        MVI     G_02F8, R3                      ; DE90   0283 02F8
        ADDR    R1,     R3                      ; DE92   00CB
        ADD     G_0325, R1                      ; DE93   02C1 0325
        MVO     R1,     G_0325                  ; DE95   0241 0325
        MVI     G_02F0, R2                      ; DE97   0282 02F0
        PSHR    R2                              ; DE99   0272

        JSR     R5,     G_7E65                  ; DE9A   0004 017C 0265

        TSTR    R2                              ; DE9D   0092
        PULR    R2                              ; DE9E   02B2
        BEQ     L_DEA9                          ; DE9F   0204 0008

        MVI     G_01EE, R1                      ; DEA1   0281 01EE
        ANDI    #$0007, R1                      ; DEA3   03B9 0007
        CMPI    #$0001, R1                      ; DEA5   0379 0001
L_DEA7:
        BNEQ    L_DEAD                          ; DEA7   020C 0004

L_DEA9:
        ADD     G_0323, R2                      ; DEA9   02C2 0323
        ADD     G_0324, R3                      ; DEAB   02C3 0324
L_DEAD:
        SUB     G_0325, R3                      ; DEAD   0303 0325

        JSR     R5,     G_7434                  ; DEAF   0004 0174 0034
        JSR     R5,     G_7761                  ; DEB2   0004 0174 0361

        ADD     G_0325, R3                      ; DEB5   02C3 0325
        MOVR    R1,     R0                      ; DEB7   0088
        ANDI    #$0008, R0                      ; DEB8   03B8 0008
        BEQ     L_DEBE                          ; DEBA   0204 0002

        MVO     R0,     G_0107                  ; DEBC   0240 0107
L_DEBE:
        ANDI    #$0007, R1                      ; DEBE   03B9 0007
        MVI     G_014D, R0                      ; DEC0   0280 014D
        ANDI    #$0004, R0                      ; DEC2   03B8 0004
        BNEQ    L_DEDC                          ; DEC4   020C 0016

        CMPI    #$0006, R1                      ; DEC6   0379 0006
        BMI     L_DECE                          ; DEC8   020B 0004

        MVO     R1,     G_0107                  ; DECA   0241 0107
        B       L_DEE4                          ; DECC   0200 0016

L_DECE:
        CMPI    #$0005, R1                      ; DECE   0379 0005
        BEQ     L_DEE4                          ; DED0   0204 0012

        CMPI    #$0004, R1                      ; DED2   0379 0004
        BNEQ    L_DEE4                          ; DED4   020C 000E

        MVI     G_014D, R0                      ; DED6   0280 014D
        XORI    #$0004, R0                      ; DED8   03F8 0004
        MVO     R0,     G_014D                  ; DEDA   0240 014D
L_DEDC:
        SUB     G_0323, R2                      ; DEDC   0302 0323
        SUB     G_0324, R3                      ; DEDE   0303 0324
        SUB     G_0323, R2                      ; DEE0   0302 0323
        SUB     G_0324, R3                      ; DEE2   0303 0324
L_DEE4:
        MVO     R2,     G_02F0                  ; DEE4   0242 02F0
        MVO     R3,     G_02F8                  ; DEE6   0243 02F8
        PULR    R7                              ; DEE8   02B7
L_DEE9:
        MVI     G_014D, R1                      ; DEE9   0281 014D
        MOVR    R1,     R0                      ; DEEB   0088
        ANDI    #$0040, R1                      ; DEEC   03B9 0040
        BEQ     L_DEF6                          ; DEEE   0204 0006

        ANDI    #$00BF, R0                      ; DEF0   03B8 00BF
        MVO     R0,     G_014D                  ; DEF2   0240 014D
        B       L_DE87                          ; DEF4   0220 006E

L_DEF6:
        MVI     G_02F8, R3                      ; DEF6   0283 02F8
        MVI     G_02F0, R2                      ; DEF8   0282 02F0

        JSR     R5,     G_7434                  ; DEFA   0004 0174 0034
        JSR     R5,     G_7761                  ; DEFD   0004 0174 0361

        MVO     R1,     G_0107                  ; DF00   0241 0107
        MVI     G_0320, R0                      ; DF02   0280 0320
        SDBD                                    ; DF04   0001
        ANDI    #$FFFB, R0                      ; DF05   03B8 00FB 00FF
        MVO     R0,     G_0320                  ; DF08   0240 0320
        CLRR    R0                              ; DF0A   01C0
        MVO     R0,     G_0143                  ; DF0B   0240 0143
        PULR    R7                              ; DF0D   02B7
L_DF0E:
        MVI     G_0308, R3                      ; DF0E   0283 0308
        SDBD                                    ; DF10   0001
        CMPI    #$68C2, R3                      ; DF11   037B 00C2 0068
        BEQ     L_DF1C                          ; DF14   0204 0006

        SDBD                                    ; DF16   0001
        CMPI    #$68E8, R3                      ; DF17   037B 00E8 0068
        BNEQ    L_DF22                          ; DF1A   020C 0006

L_DF1C:
        MVI     G_014D, R0                      ; DF1C   0280 014D
        XORI    #$0002, R0                      ; DF1E   03F8 0002
        MVO     R0,     G_014D                  ; DF20   0240 014D
L_DF22:
        MVII    #$0308, R3                      ; DF22   02BB 0308
        MVII    #$02F0, R2                      ; DF24   02BA 02F0

        JSR     R5,     L_6EB2                  ; DF26   0004 016C 02B2

        MVI     G_0311, R0                      ; DF29   0280 0311
        TSTR    R0                              ; DF2B   0080
        BEQ     L_DF2F                          ; DF2C   0204 0001

        PULR    R7                              ; DF2E   02B7
L_DF2F:
        MVI     G_014D, R0                      ; DF2F   0280 014D
        ANDI    #$0002, R0                      ; DF31   03B8 0002
        BEQ     L_DEE9                          ; DF33   0224 004B

        SDBD                                    ; DF35   0001
        MVII    #$50B5, R3                      ; DF36   02BB 00B5 0050
        CLRR    R1                              ; DF39   01C9

        JSR     R5,     .HEADER                 ; DF3A   0004 0150 0000

        MVI     G_0320, R1                      ; DF3D   0281 0320
        XORI    #$0010, R1                      ; DF3F   03F9 0010
        MVO     R1,     G_0320                  ; DF41   0241 0320

        JSR     R5,     L_6DF2                  ; DF43   0004 016C 01F2

        PULR    R7                              ; DF46   02B7
        CLRR    R1                              ; DF47   01C9
        PSHR    R2                              ; DF48   0272
        PSHR    R3                              ; DF49   0273
        ANDI    #$00FF, R2                      ; DF4A   03BA 00FF
        ANDI    #$007F, R3                      ; DF4C   03BB 007F
        CMPI    #$0001, R3                      ; DF4E   037B 0001
        BNEQ    L_DF53                          ; DF50   020C 0001

        INCR    R1                              ; DF52   0009
L_DF53:
        CMPI    #$0060, R3                      ; DF53   037B 0060
        BNEQ    L_DF58                          ; DF55   020C 0001

        INCR    R1                              ; DF57   0009
L_DF58:
        CMPI    #$0009, R2                      ; DF58   037A 0009
        BNEQ    L_DF5D                          ; DF5A   020C 0001

        INCR    R1                              ; DF5C   0009
L_DF5D:
        CMPI    #$00A0, R2                      ; DF5D   037A 00A0
        BNEQ    L_DF62                          ; DF5F   020C 0001

        INCR    R1                              ; DF61   0009
L_DF62:
        PULR    R3                              ; DF62   02B3
        PULR    R2                              ; DF63   02B2
        MOVR    R5,     R7                      ; DF64   00AF
        MVI     G_0126, R0                      ; DF65   0280 0126
        INCR    R0                              ; DF67   0008
        CMPI    #$000A, R0                      ; DF68   0378 000A
        BEQ     L_DF77                          ; DF6A   0204 000B

        ADDI    #$0010, R0                      ; DF6C   02F8 0010
L_DF6E:
        SLL     R0,     1                       ; DF6E   0048
        SLL     R0,     2                       ; DF6F   004C
        SDBD                                    ; DF70   0001
        ADDI    #$0605, R0                      ; DF71   02F8 0005 0006
        MVO     R0,     .BTAB.13                ; DF74   0240 0213
        MOVR    R5,     R7                      ; DF76   00AF
L_DF77:
        MVII    #$0001, R0                      ; DF77   02B8 0001
        B       L_DF6E                          ; DF79   0220 000C

        PSHR    R1                              ; DF7B   0271
        PSHR    R3                              ; DF7C   0273
        MVI     G_031E, R1                      ; DF7D   0281 031E
        TSTR    R1                              ; DF7F   0089
        BEQ     L_DF9A                          ; DF80   0204 0018

        PSHR    R1                              ; DF82   0271
        SDBD                                    ; DF83   0001
        ANDI    #$D008, R1                      ; DF84   03B9 0008 00D0
        MVII    #$000E, R3                      ; DF87   02BB 000E
        CLRR    R0                              ; DF89   01C0
L_DF8A:
        SLLC    R1,     1                       ; DF8A   0059
        BNC     L_DF8F                          ; DF8B   0209 0002

        XORI    #$0001, R0                      ; DF8D   03F8 0001
L_DF8F:
        DECR    R3                              ; DF8F   0013
        BNEQ    L_DF8A                          ; DF90   022C 0007

        PULR    R1                              ; DF92   02B1
        SLL     R1,     1                       ; DF93   0049
        ADDR    R0,     R1                      ; DF94   00C1
        MVO     R1,     G_031E                  ; DF95   0241 031E
L_DF97:
        PULR    R3                              ; DF97   02B3
        PULR    R1                              ; DF98   02B1
        MOVR    R5,     R7                      ; DF99   00AF
L_DF9A:
        INCR    R1                              ; DF9A   0009
        MVO     R1,     G_031E                  ; DF9B   0241 031E
        MOVR    R1,     R0                      ; DF9D   0088
        B       L_DF97                          ; DF9E   0220 0008

        PSHR    R5                              ; DFA0   0275

        JSR     R5,     G_7F7B                  ; DFA1   0004 017C 037B

        MVI     G_031E, R0                      ; DFA4   0280 031E
        PSHR    R1                              ; DFA6   0271
        MVI     G_0126, R1                      ; DFA7   0281 0126
        SDBD                                    ; DFA9   0001
        ADDI    #$7FB0, R1                      ; DFAA   02F9 00B0 007F
        AND@    R1,     R0                      ; DFAD   0388
        PULR    R1                              ; DFAE   02B1
        PULR    R7                              ; DFAF   02B7
        XORI    #$01FF, R7                      ; DFB0   03FF 01FF
        ADDR    R7,     R7                      ; DFB2   00FF
        SARC    R3,     2                       ; DFB3   007F
        RSWD    R7                              ; DFB4   003F
        COMR    R7                              ; DFB5   001F
        INCR    R7                              ; DFB6   000F
        SETC                                    ; DFB7   0007
        DIS                                     ; DFB8   0003
        DECLE   $0001                           ; DFB9   0001

        PSHR    R5                              ; DFBA   0275
        MVI     G_014F, R1                      ; DFBB   0281 014F
        MVI     G_013C, R0                      ; DFBD   0280 013C
        TSTR    R0                              ; DFBF   0080
        BEQ     L_DFE2                          ; DFC0   0204 0020

        ANDI    #$0002, R1                      ; DFC2   03B9 0002
        BNEQ    L_DFE1                          ; DFC4   020C 001B

        MVI     G_0120, R2                      ; DFC6   0282 0120
        CMPI    #$0001, R2                      ; DFC8   037A 0001
        BNEQ    L_DFE1                          ; DFCA   020C 0015

        MVI     G_014F, R1                      ; DFCC   0281 014F
        XORI    #$0002, R1                      ; DFCE   03F9 0002
        MVO     R1,     G_014F                  ; DFD0   0241 014F
L_DFD2:
        CLRR    R1                              ; DFD2   01C9
        SDBD                                    ; DFD3   0001
        MVII    #$50FB, R3                      ; DFD4   02BB 00FB 0050

        JSR     R5,     .HEADER                 ; DFD7   0004 0150 0000

        MVII    #$0139, R1                      ; DFDA   02B9 0139
        ADD     G_013C, R1                      ; DFDC   02C1 013C
        MVI@    R1,     R0                      ; DFDE   0288
        INCR    R0                              ; DFDF   0008
        MVO@    R0,     R1                      ; DFE0   0248
L_DFE1:
        PULR    R7                              ; DFE1   02B7
L_DFE2:
        ANDI    #$0001, R1                      ; DFE2   03B9 0001
        BNEQ    L_DFE1                          ; DFE4   022C 0004

        MVI     G_011A, R0                      ; DFE6   0280 011A
        CMPI    #$0001, R0                      ; DFE8   0378 0001
        BNEQ    L_DFE1                          ; DFEA   022C 000A

        MVI     G_014F, R0                      ; DFEC   0280 014F
        XORI    #$0001, R0                      ; DFEE   03F8 0001
        MVO     R0,     G_014F                  ; DFF0   0240 014F
        B       L_DFD2                          ; DFF2   0220 0021

        MOVR    R5,     R2                      ; DFF4   00AA
        RLC     R1,     2                       ; DFF5   0055
        RLC     R1,     2                       ; DFF6   0055
        MOVR    R5,     R2                      ; DFF7   00AA
        RLC     R1,     2                       ; DFF8   0055
        RLC     R1,     2                       ; DFF9   0055
        MOVR    R5,     R2                      ; DFFA   00AA
        RLC     R1,     2                       ; DFFB   0055
        RLC     R1,     2                       ; DFFC   0055
        MOVR    R5,     R2                      ; DFFD   00AA
        RLC     R1,     2                       ; DFFE   0055
        RLC     R1,     2                       ; DFFF   0055
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
