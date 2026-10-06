
        ORG     $5000
.HEADER:
        BIDECLE $6857           ; 5000  Ptr: MOB graphic images
        BIDECLE $2079           ; 5002  Ptr: EXEC timer table
        BIDECLE $7261           ; 5004  Ptr: Start of game
        BIDECLE $2065           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $6F79           ; 5008  Ptr: GRAM init sequence
        BIDECLE $2075           ; 500A  Ptr: Date/Title
        DECLE   $0064           ; 500C  Key-click / flags
        DECLE   $0069           ; 500D  Border extension
        DECLE   $0061           ; 500E  Color Stack / FGBG
        DECLE   $0073,  $0073   ; 500F  Color Stack init (0, 1)
        DECLE   $0065,  $006D   ; 5011  Color Stack init (2, 3)
        DECLE   $0062           ; 5013  Border color init


        SAR     R0,     2                       ; 5014   006C
        SAR     R1,     1                       ; 5015   0069
        SAR     R2,     2                       ; 5016   006E
        SLR     R3,     2                       ; 5017   0067
L_5018:
        NEGR    R0                              ; 5018   0020
        DECLE   $0074,  $0068,  $0069,  $0073   ; 5019   0074 0068 0069 0073
        DECLE   $0020,  $0063,  $006F,  $0064   ; 501D   0020 0063 006F 0064
        DECLE   $0065,  $003F                   ; 5021   0065 003F

        NEGR    R0                              ; 5023   0020
        RLC     R0,     2                       ; 5024   0054
        SAR     R0,     1                       ; 5025   0068
        SLR     R1,     1                       ; 5026   0061
        RRC     R0,     2                       ; 5027   0074
        NEGR    R0                              ; 5028   0020
        SAR     R1,     1                       ; 5029   0069
        RRC     R3,     1                       ; 502A   0073
        SAR     R2,     2                       ; 502B   006E
        SLR     R0,     1                       ; 502C   0060
        RRC     R0,     2                       ; 502D   0074
        NEGR    R0                              ; 502E   0020
        SAR     R2,     2                       ; 502F   006E
        SAR     R1,     1                       ; 5030   0069
        SLR     R3,     1                       ; 5031   0063
        SLR     R1,     2                       ; 5032   0065
        NEGR    R1                              ; 5033   0021
        PSHR    R5                              ; 5034   0275
        MVI     G_0167, R0                      ; 5035   0280 0167
        TSTR    R0                              ; 5037   0080
        BEQ     L_5045                          ; 5038   0204 000B

        MVI     G_0162, R0                      ; 503A   0280 0162
        TSTR    R0                              ; 503C   0080
        BEQ     L_5046                          ; 503D   0204 0007

        CLRR    R0                              ; 503F   01C0
        MVO     R0,     G_0162                  ; 5040   0240 0162

        JSR     R5,     L_652A                  ; 5042   0004 0164 012A

L_5045:
        PULR    R7                              ; 5045   02B7

L_5046:
        JSR     R5,     L_60DE                  ; 5046   0004 0160 00DE
        JSR     R5,     L_6093                  ; 5049   0004 0160 0093

        MVII    #$0005, R3                      ; 504C   02BB 0005
        MVII    #$0151, R4                      ; 504E   02BC 0151
        MVII    #$0318, R2                      ; 5050   02BA 0318
L_5052:
        MVI@    R4,     R1                      ; 5052   02A1
        CMPI    #$00FF, R1                      ; 5053   0379 00FF
        BEQ     L_5075                          ; 5055   0204 001E

        MVI@    R2,     R0                      ; 5057   0290
        SDBD                                    ; 5058   0001
        ANDI    #$06FF, R0                      ; 5059   03B8 00FF 0006
        XORI    #$0100, R0                      ; 505C   03F8 0100
        MVO@    R0,     R2                      ; 505E   0250
        MOVR    R1,     R5                      ; 505F   008D
        ANDI    #$0008, R5                      ; 5060   03BD 0008
        BEQ     L_506A                          ; 5062   0204 0006

        XORI    #$0008, R1                      ; 5064   03F9 0008
        DECR    R4                              ; 5066   0014
        MVO@    R1,     R4                      ; 5067   0261
        B       L_5072                          ; 5068   0200 0008

L_506A:
        JSR     R5,     L_6221                  ; 506A   0004 0160 0221

        ANDI    #$00F0, R5                      ; 506D   03BD 00F0
        XORR    R5,     R1                      ; 506F   01E9
        DECR    R4                              ; 5070   0014
        MVO@    R1,     R4                      ; 5071   0261

L_5072:
        JSR     R5,     L_612C                  ; 5072   0004 0160 012C

L_5075:
        INCR    R2                              ; 5075   000A
        DECR    R3                              ; 5076   0013
        BNEQ    L_5052                          ; 5077   022C 0026

        JSR     R5,     L_60A0                  ; 5079   0004 0160 00A0
        DECLE   $0004,  $0160,  $0086           ; 507C   0004 0160 0086

        MVI     G_0161, R0                      ; 507F   0280 0161

        JSR     R5,     L_6A43                  ; 5081   0004 0168 0243
        DECLE   $0000                           ; 5084   0000

        PULR    R7                              ; 5085   02B7

        MVII    #$0328, R1                      ; 5086   02B9 0328
        MVII    #$0005, R0                      ; 5088   02B8 0005
L_508A:
        MVI@    R1,     R2                      ; 508A   028A
        XORI    #$0010, R2                      ; 508B   03FA 0010
        MVO@    R2,     R1                      ; 508D   024A
        INCR    R1                              ; 508E   0009
        DECR    R0                              ; 508F   0010
        BNEQ    L_508A                          ; 5090   022C 0007
        MOVR    R5,     R7                      ; 5092   00AF

        PSHR    R5                              ; 5093   0275
        MVII    #$0005, R0                      ; 5094   02B8 0005
        MVII    #$0151, R4                      ; 5096   02BC 0151
        MVII    #$0156, R5                      ; 5098   02BD 0156
L_509A:
        MVI@    R4,     R1                      ; 509A   02A1
        MVO@    R1,     R5                      ; 509B   0269
        DECR    R0                              ; 509C   0010
        BNEQ    L_509A                          ; 509D   022C 0004
        PULR    R7                              ; 509F   02B7

        PSHR    R5                              ; 50A0   0275
        MVII    #$0156, R1                      ; 50A1   02B9 0156
        MVII    #$015B, R4                      ; 50A3   02BC 015B
        MVII    #$0151, R3                      ; 50A5   02BB 0151
        INCR    R3                              ; 50A7   000B
        INCR    R4                              ; 50A8   000C
        MVII    #$0004, R0                      ; 50A9   02B8 0004
L_50AB:
        MVI@    R1,     R2                      ; 50AB   028A
        MVI@    R4,     R5                      ; 50AC   02A5
        CMPI    #$00FF, R2                      ; 50AD   037A 00FF
        BEQ     L_50C7                          ; 50AF   0204 0016

        SWAP    R2,     2                       ; 50B1   0046
        BMI     L_50D1                          ; 50B2   020B 001D

        ANDI    #$0003, R2                      ; 50B4   03BA 0003
        CMPI    #$0003, R2                      ; 50B6   037A 0003
        BNEQ    L_50CD                          ; 50B8   020C 0013

L_50BA:
        TSTR    R5                              ; 50BA   00AD
        BNEQ    L_50C7                          ; 50BB   020C 000A

        MVI@    R3,     R2                      ; 50BD   029A
        CMPI    #$00FF, R2                      ; 50BE   037A 00FF
        BEQ     L_50C7                          ; 50C0   0204 0005

        ANDI    #$00FC, R2                      ; 50C2   03BA 00FC
        ADDI    #$0002, R2                      ; 50C4   02FA 0002
        MVO@    R2,     R3                      ; 50C6   025A
L_50C7:
        INCR    R1                              ; 50C7   0009
        INCR    R3                              ; 50C8   000B
        DECR    R0                              ; 50C9   0010
        BNEQ    L_50AB                          ; 50CA   022C 0020
        PULR    R7                              ; 50CC   02B7

L_50CD:
        MVI@    R1,     R2                      ; 50CD   028A
        SWAP    R2,     2                       ; 50CE   0046
        BPL     L_50C7                          ; 50CF   0223 0009

L_50D1:
        ANDI    #$0008, R2                      ; 50D1   03BA 0008
        BNEQ    L_50C7                          ; 50D3   022C 000D

        MVI@    R1,     R2                      ; 50D5   028A
        ANDI    #$0003, R2                      ; 50D6   03BA 0003
        CMPI    #$0002, R2                      ; 50D8   037A 0002
        BEQ     L_50BA                          ; 50DA   0224 0021
        B       L_50C7                          ; 50DC   0220 0016

        PSHR    R5                              ; 50DE   0275
        MVII    #$0010, R4                      ; 50DF   02BC 0010
        MVII    #$0182, R3                      ; 50E1   02BB 0182
L_50E3:
        MVI@    R3,     R0                      ; 50E3   0298
        ANDI    #$001F, R0                      ; 50E4   03B8 001F
        BEQ     L_5125                          ; 50E6   0204 003D

        MVII    #$0001, R1                      ; 50E8   02B9 0001
        CLRR    R2                              ; 50EA   01D2
L_50EB:
        MOVR    R1,     R5                      ; 50EB   008D
        ANDR    R0,     R5                      ; 50EC   0185
        BNEQ    L_50F3                          ; 50ED   020C 0004

        INCR    R2                              ; 50EF   000A
        SLL     R1,     1                       ; 50F0   0049
        B       L_50EB                          ; 50F1   0220 0007

L_50F3:
        SUBI    #$017E, R3                      ; 50F3   033B 017E
        ADDI    #$015B, R3                      ; 50F5   02FB 015B
        MVI@    R3,     R0                      ; 50F7   0298
        CMPI    #$00FF, R0                      ; 50F8   0378 00FF
        BNEQ    L_5121                          ; 50FA   020C 0025

        SUBI    #$015B, R3                      ; 50FC   033B 015B
        ADDI    #$0151, R2                      ; 50FE   02FA 0151
        ADDI    #$0151, R3                      ; 5100   02FB 0151
        MVI@    R2,     R0                      ; 5102   0290
        MVI@    R3,     R1                      ; 5103   0299
        ANDI    #$0003, R0                      ; 5104   03B8 0003
        ANDI    #$0003, R1                      ; 5106   03B9 0003
        CMPI    #$0001, R1                      ; 5108   0379 0001
        BGT     L_511D                          ; 510A   020E 0011

        CMPI    #$0001, R0                      ; 510C   0378 0001
        BGT     L_511D                          ; 510E   020E 000D

        MVI@    R3,     R1                      ; 5110   0299
        ANDI    #$00FC, R1                      ; 5111   03B9 00FC
        ADDI    #$0002, R1                      ; 5113   02F9 0002
        MVO@    R1,     R3                      ; 5115   0259
        MOVR    R4,     R5                      ; 5116   00A5
        SUBI    #$0151, R2                      ; 5117   033A 0151
        ADDI    #$017E, R2                      ; 5119   02FA 017E
        XOR@    R2,     R5                      ; 511B   03D5
        MVO@    R5,     R2                      ; 511C   0255
L_511D:
        SUBI    #$0151, R3                      ; 511D   033B 0151
        B       L_5123                          ; 511F   0200 0002

L_5121:
        SUBI    #$015B, R3                      ; 5121   033B 015B
L_5123:
        ADDI    #$017E, R3                      ; 5123   02FB 017E
L_5125:
        DECR    R3                              ; 5125   0013
        MOVR    R4,     R0                      ; 5126   00A0
        SLR     R0,     1                       ; 5127   0060
        MOVR    R0,     R4                      ; 5128   0084
        BNEQ    L_50E3                          ; 5129   022C 0047
        PULR    R7                              ; 512B   02B7

        PSHR    R5                              ; 512C   0275
        PSHR    R3                              ; 512D   0273
        MOVR    R4,     R3                      ; 512E   00A3
        SUBI    #$0151, R3                      ; 512F   033B 0151
        ADDI    #$015A, R3                      ; 5131   02FB 015A
        MVI@    R3,     R0                      ; 5133   0298
        TSTR    R0                              ; 5134   0080
        BEQ     L_518B                          ; 5135   0204 0054

        MOVR    R1,     R0                      ; 5137   0088
        ANDI    #$0010, R0                      ; 5138   03B8 0010
        SLR     R0,     1                       ; 513A   0060
        MOVR    R0,     R5                      ; 513B   0085
        BNEQ    L_5142                          ; 513C   020C 0004

        SDBD                                    ; 513E   0001
        MVII    #$FFF8, R5                      ; 513F   02BD 00F8 00FF
L_5142:
        ANDI    #$0003, R1                      ; 5142   03B9 0003
        CMPI    #$0001, R1                      ; 5144   0379 0001
        BGT     L_518B                          ; 5146   020E 0043

        PSHR    R2                              ; 5148   0272
        MVI@    R2,     R1                      ; 5149   0291
        ADDI    #$0008, R2                      ; 514A   02FA 0008
        MVI@    R2,     R0                      ; 514C   0290
        PSHR    R0                              ; 514D   0270
        ANDI    #$007F, R0                      ; 514E   03B8 007F
        SLR     R0,     2                       ; 5150   0064
        SLR     R0,     1                       ; 5151   0060
        DECR    R0                              ; 5152   0010
        SLL     R0,     2                       ; 5153   004C
        MOVR    R0,     R2                      ; 5154   0082
        SLL     R0,     2                       ; 5155   004C
        ADDR    R0,     R2                      ; 5156   00C2
        ANDI    #$00FF, R1                      ; 5157   03B9 00FF
        SUBR    R5,     R1                      ; 5159   0129
        SLR     R1,     2                       ; 515A   0065
        SLR     R1,     1                       ; 515B   0061
        ADDR    R1,     R2                      ; 515C   00CA
        ADDI    #$0200, R2                      ; 515D   02FA 0200
        MVI@    R2,     R0                      ; 515F   0290
        SDBD                                    ; 5160   0001
        ANDI    #$0800, R0                      ; 5161   03B8 0000 0008
        BNEQ    L_516A                          ; 5164   020C 0004

        PULR    R1                              ; 5166   02B1
        PULR    R2                              ; 5167   02B2
        B       L_518B                          ; 5168   0200 0021

L_516A:
        MVI@    R2,     R0                      ; 516A   0290
        MOVR    R2,     R3                      ; 516B   0093
        SLR     R0,     2                       ; 516C   0064
        SLR     R0,     1                       ; 516D   0060
        PULR    R1                              ; 516E   02B1
        PULR    R2                              ; 516F   02B2
        ANDI    #$0004, R1                      ; 5170   03B9 0004
        BNEQ    L_5175                          ; 5172   020C 0001

        SLR     R0,     2                       ; 5174   0064
L_5175:
        ANDI    #$0003, R0                      ; 5175   03B8 0003
        BEQ     L_518B                          ; 5177   0204 0012

        MOVR    R4,     R1                      ; 5179   00A1
        DECR    R1                              ; 517A   0011
        MVI@    R1,     R0                      ; 517B   0288
        ANDI    #$00F0, R0                      ; 517C   03B8 00F0
        ADDI    #$0002, R0                      ; 517E   02F8 0002
        MVO@    R0,     R1                      ; 5180   0248
        MVI@    R3,     R0                      ; 5181   0298
        TSTR    R0                              ; 5182   0080
        BPL     L_518B                          ; 5183   0203 0006

        MVI@    R1,     R0                      ; 5185   0288
        ANDI    #$00BF, R0                      ; 5186   03B8 00BF
        XORI    #$0040, R0                      ; 5188   03F8 0040
        MVO@    R0,     R1                      ; 518A   0248
L_518B:
        PULR    R3                              ; 518B   02B3
        PULR    R7                              ; 518C   02B7

        PSHR    R5                              ; 518D   0275
        MVII    #$0005, R0                      ; 518E   02B8 0005
        MVII    #$0320, R3                      ; 5190   02BB 0320
        MVII    #$0151, R4                      ; 5192   02BC 0151
L_5194:
        MVI@    R4,     R1                      ; 5194   02A1
        CMPI    #$00FF, R1                      ; 5195   0379 00FF
        BEQ     L_51B8                          ; 5197   0204 001F

        MOVR    R1,     R2                      ; 5199   008A
        ANDI    #$0040, R1                      ; 519A   03B9 0040
        BEQ     L_51B8                          ; 519C   0204 001A

        MVI@    R3,     R5                      ; 519E   029D
        ANDI    #$007F, R5                      ; 519F   03BD 007F
        CMPI    #$0064, R5                      ; 51A1   037D 0064
        BNEQ    L_51AB                          ; 51A3   020C 0006

        ANDI    #$00FC, R2                      ; 51A5   03BA 00FC
        ADDI    #$0002, R2                      ; 51A7   02FA 0002
        B       L_51B6                          ; 51A9   0200 000B

L_51AB:
        MOVR    R2,     R1                      ; 51AB   0091
        ANDI    #$0003, R1                      ; 51AC   03B9 0003
        CMPI    #$0001, R1                      ; 51AE   0379 0001
        BGT     L_51B8                          ; 51B0   020E 0006

        ANDI    #$00FC, R2                      ; 51B2   03BA 00FC
        ADDI    #$0002, R2                      ; 51B4   02FA 0002
L_51B6:
        DECR    R4                              ; 51B6   0014
        MVO@    R2,     R4                      ; 51B7   0262
L_51B8:
        INCR    R3                              ; 51B8   000B
        DECR    R0                              ; 51B9   0010
        BNEQ    L_5194                          ; 51BA   022C 0027
        PULR    R7                              ; 51BC   02B7

        DECLE   $0275,  $0280,  $0163,  $0010   ; 51BD   0275 0280 0163 0010
        DECLE   $020B,  $0010,  $02B8,  $0005   ; 51C1   020B 0010 02B8 0005
        DECLE   $02BB,  $0001,  $01E4,  $0281   ; 51C5   02BB 0001 01E4 0281
        DECLE   $0164,  $008A,  $019A,  $020C   ; 51C9   0164 008A 019A 020C
        DECLE   $000B,  $004B,  $000C,  $0010   ; 51CD   000B 004B 000C 0010
        DECLE   $022C,  $0008,  $0004,  $0168   ; 51D1   022C 0008 0004 0168
        DECLE   $0242                           ; 51D5   0242

        MOVR    R2,     R6                      ; 51D6   0096
        CLRC                                    ; 51D7   0006
        PULR    R7                              ; 51D8   02B7

        MOVR    R4,     R1                      ; 51D9   00A1
        ADDI    #$0151, R1                      ; 51DA   02F9 0151
        XOR     G_0164, R2                      ; 51DC   03C2 0164
        MVO     R2,     G_0164                  ; 51DE   0242 0164
        CLRR    R0                              ; 51E0   01C0
        MVO@    R0,     R1                      ; 51E1   0248
        MOVR    R1,     R3                      ; 51E2   008B
        SUBI    #$0151, R1                      ; 51E3   0339 0151
        MOVR    R1,     R2                      ; 51E5   008A
        ADDI    #$015B, R2                      ; 51E6   02FA 015B
        COMR    R0                              ; 51E8   0018
        MVO@    R0,     R2                      ; 51E9   0250
        ADDI    #$0318, R1                      ; 51EA   02F9 0318
        SDBD                                    ; 51EC   0001
        MVII    #$070C, R0                      ; 51ED   02B8 000C 0007
        MVO@    R0,     R1                      ; 51F0   0248
        ADDI    #$0008, R1                      ; 51F1   02F9 0008

        JSR     R5,     L_6A8F                  ; 51F3   0004 0168 028F

        ANDI    #$0001, R0                      ; 51F6   03B8 0001
        MVII    #$00D4, R0                      ; 51F8   02B8 00D4
        BEQ     L_520C                          ; 51FA   0204 0010

        MVII    #$0011, R0                      ; 51FC   02B8 0011
        MVO@    R0,     R3                      ; 51FE   0258
        SUBI    #$0008, R1                      ; 51FF   0339 0008
        SDBD                                    ; 5201   0001
        MVII    #$0794, R0                      ; 5202   02B8 0094 0007
        MVO@    R0,     R1                      ; 5205   0248
        ADDI    #$0008, R1                      ; 5206   02F9 0008
        SDBD                                    ; 5208   0001
        MVII    #$04D4, R0                      ; 5209   02B8 00D4 0004
L_520C:
        MVO@    R0,     R1                      ; 520C   0248
        DECLE   $02F9,  $0008,  $02B8,  $0010   ; 520D   02F9 0008 02B8 0010
        DECLE   $004C,  $00C0,  $0001,  $03F8   ; 5211   004C 00C0 0001 03F8
        DECLE   $0000,  $0028,  $03C0,  $0345   ; 5215   0000 0028 03C0 0345
        DECLE   $0248,  $0280,  $0147,  $0010   ; 5219   0248 0280 0147 0010
        DECLE   $0240,  $0147,  $0220,  $004D   ; 521D   0240 0147 0220 004D

        PSHR    R5                              ; 5221   0275
        MOVR    R1,     R5                      ; 5222   008D
        ANDI    #$0003, R1                      ; 5223   03B9 0003
        INCR    R1                              ; 5225   0009
        ADDR    R7,     R1                      ; 5226   00F9
        ADD@    R1,     R7                      ; 5227   02CF

        DECLE   $0004                           ; 5228   0004

        DECR    R3                              ; 5229   0013
        SLL     R0,     2                       ; 522A   004C
        TSTR    R2                              ; 522B   0092
        MVI@    R2,     R0                      ; 522C   0290
        ADDI    #$0008, R0                      ; 522D   02F8 0008
        MVO@    R0,     R2                      ; 522F   0250
        CLRR    R1                              ; 5230   01C9
        ANDI    #$00FF, R0                      ; 5231   03B8 00FF
        CMPI    #$0094, R0                      ; 5233   0378 0094
        BNEQ    L_52A2                          ; 5235   020C 006B

        MVII    #$0002, R1                      ; 5237   02B9 0002
        B       L_5249                          ; 5239   0200 000E

        MVI@    R2,     R0                      ; 523B   0290
        SUBI    #$0008, R0                      ; 523C   0338 0008
        MVO@    R0,     R2                      ; 523E   0250
        MVII    #$0001, R1                      ; 523F   02B9 0001
        ANDI    #$00FF, R0                      ; 5241   03B8 00FF
        CMPI    #$000C, R0                      ; 5243   0378 000C
        BNEQ    L_52A2                          ; 5245   020C 005B

        MVII    #$0002, R1                      ; 5247   02B9 0002
L_5249:
        PSHR    R2                              ; 5249   0272
        PSHR    R1                              ; 524A   0271
        PSHR    R0                              ; 524B   0270
        ADDI    #$0008, R2                      ; 524C   02FA 0008
        MVI@    R2,     R0                      ; 524E   0290
        ANDI    #$0004, R0                      ; 524F   03B8 0004
        BEQ     L_5270                          ; 5251   0204 001D

        MVI@    R2,     R0                      ; 5253   0290
        ANDI    #$007F, R0                      ; 5254   03B8 007F
        MVII    #$0200, R1                      ; 5256   02B9 0200
        SLR     R0,     2                       ; 5258   0064
        SLR     R0,     1                       ; 5259   0060
        DECR    R0                              ; 525A   0010
        SLL     R0,     2                       ; 525B   004C
        PSHR    R0                              ; 525C   0270
        SLL     R0,     2                       ; 525D   004C
        ADD@    R6,     R0                      ; 525E   02F0
        ADDR    R0,     R1                      ; 525F   00C1
        PULR    R0                              ; 5260   02B0
        PSHR    R0                              ; 5261   0270
        CMPI    #$0094, R0                      ; 5262   0378 0094
        BNEQ    L_5268                          ; 5264   020C 0002

        ADDI    #$0013, R1                      ; 5266   02F9 0013
L_5268:
        MVI@    R1,     R0                      ; 5268   0288
        TSTR    R0                              ; 5269   0080
        BPL     L_5270                          ; 526A   0203 0004

        ANDI    #$00B0, R5                      ; 526C   03BD 00B0
        XORI    #$0040, R5                      ; 526E   03FD 0040
L_5270:
        PULR    R0                              ; 5270   02B0
        PULR    R1                              ; 5271   02B1
        PULR    R2                              ; 5272   02B2
        PULR    R7                              ; 5273   02B7

        MOVR    R5,     R0                      ; 5274   00A8
        ANDI    #$0020, R0                      ; 5275   03B8 0020
        BNEQ    L_52A3                          ; 5277   020C 002A

        ADDI    #$0008, R2                      ; 5279   02FA 0008
        MVI@    R2,     R0                      ; 527B   0290
        SUBI    #$0008, R2                      ; 527C   033A 0008
        ANDI    #$007F, R0                      ; 527E   03B8 007F
        CMPI    #$0064, R0                      ; 5280   0378 0064
        BNEQ    L_5296                          ; 5282   020C 0012

        XORI    #$0020, R5                      ; 5284   03FD 0020
        PSHR    R5                              ; 5286   0275
        ANDI    #$0040, R5                      ; 5287   03BD 0040
        BEQ     L_5290                          ; 5289   0204 0005

        PULR    R5                              ; 528B   02B5
        XORI    #$0040, R5                      ; 528C   03FD 0040
        B       L_52A3                          ; 528E   0200 0013

L_5290:
        JSR     R5,     L_6306                  ; 5290   0004 0160 0306

        PULR    R5                              ; 5293   02B5
        B       L_52A3                          ; 5294   0200 000D

L_5296:
        ADDI    #$0010, R2                      ; 5296   02FA 0010
        MVI@    R2,     R0                      ; 5298   0290
        XORI    #$0020, R0                      ; 5299   03F8 0020
        MVO@    R0,     R2                      ; 529B   0250
        SUBI    #$0010, R2                      ; 529C   033A 0010
        MVII    #$0003, R1                      ; 529E   02B9 0003
        XORI    #$0010, R5                      ; 52A0   03FD 0010
L_52A2:
        PULR    R7                              ; 52A2   02B7

L_52A3:
        ADDI    #$0010, R2                      ; 52A3   02FA 0010
        MVI@    R2,     R0                      ; 52A5   0290
        XORI    #$0020, R0                      ; 52A6   03F8 0020
        MVO@    R0,     R2                      ; 52A8   0250
        SUBI    #$0008, R2                      ; 52A9   033A 0008
        MVI@    R2,     R0                      ; 52AB   0290
        SUBI    #$0004, R0                      ; 52AC   0338 0004
        SDBD                                    ; 52AE   0001
        XORI    #$0800, R0                      ; 52AF   03F8 0000 0008
        MVO@    R0,     R2                      ; 52B2   0250
        SUBI    #$0008, R2                      ; 52B3   033A 0008
        MVII    #$0003, R1                      ; 52B5   02B9 0003
        XORI    #$0010, R5                      ; 52B7   03FD 0010
        PULR    R7                              ; 52B9   02B7

        MOVR    R5,     R0                      ; 52BA   00A8
        ANDI    #$0020, R0                      ; 52BB   03B8 0020
        BNEQ    L_52EA                          ; 52BD   020C 002B

        ADDI    #$0010, R2                      ; 52BF   02FA 0010
        MVI@    R2,     R0                      ; 52C1   0290
        XORI    #$0020, R0                      ; 52C2   03F8 0020
        MVO@    R0,     R2                      ; 52C4   0250
        SUBI    #$0008, R2                      ; 52C5   033A 0008
        MVI@    R2,     R0                      ; 52C7   0290
        SDBD                                    ; 52C8   0001
        XORI    #$0400, R0                      ; 52C9   03F8 0000 0004
        ADDI    #$0004, R0                      ; 52CC   02F8 0004
        MVO@    R0,     R2                      ; 52CE   0250
L_52CF:
        SUBI    #$0008, R2                      ; 52CF   033A 0008
        MVI@    R2,     R0                      ; 52D1   0290
        ANDI    #$00FF, R0                      ; 52D2   03B8 00FF
        PSHR    R5                              ; 52D4   0275
        ANDI    #$0010, R5                      ; 52D5   03BD 0010
        PULR    R5                              ; 52D7   02B5
        BNEQ    L_52E2                          ; 52D8   020C 0008

        CLRR    R1                              ; 52DA   01C9
        CMPI    #$0094, R0                      ; 52DB   0378 0094
        BNEQ    L_52A2                          ; 52DD   022C 003C

        MVII    #$0002, R1                      ; 52DF   02B9 0002
        PULR    R7                              ; 52E1   02B7

L_52E2:
        MVII    #$0001, R1                      ; 52E2   02B9 0001
        CMPI    #$000C, R0                      ; 52E4   0378 000C
        BNEQ    L_52A2                          ; 52E6   022C 0045

        INCR    R1                              ; 52E8   0009
        PULR    R7                              ; 52E9   02B7

L_52EA:
        ADDI    #$0010, R2                      ; 52EA   02FA 0010
        MVI@    R2,     R0                      ; 52EC   0290
        XORI    #$0020, R0                      ; 52ED   03F8 0020
        MVO@    R0,     R2                      ; 52EF   0250
        SUBI    #$0008, R2                      ; 52F0   033A 0008
        MVI@    R2,     R0                      ; 52F2   0290
        SDBD                                    ; 52F3   0001
        XORI    #$0400, R0                      ; 52F4   03F8 0000 0004
        SDBD                                    ; 52F7   0001
        ANDI    #$07FF, R0                      ; 52F8   03B8 00FF 0007
        MVO@    R0,     R2                      ; 52FB   0250
        ANDI    #$007F, R0                      ; 52FC   03B8 007F
        CMPI    #$0054, R0                      ; 52FE   0378 0054
        BNEQ    L_52CF                          ; 5300   022C 0032

        XORI    #$0020, R5                      ; 5302   03FD 0020
        B       L_52CF                          ; 5304   0220 0036

        PSHR    R5                              ; 5306   0275
        PSHR    R0                              ; 5307   0270
        PSHR    R1                              ; 5308   0271
        NOP                                     ; 5309   0034
        PSHR    R2                              ; 530A   0272
        PSHR    R3                              ; 530B   0273
        PSHR    R4                              ; 530C   0274
        SUBI    #$0318, R2                      ; 530D   033A 0318
        ADDI    #$015B, R2                      ; 530F   02FA 015B
        MVI@    R2,     R3                      ; 5311   0293
        CMPI    #$00FF, R3                      ; 5312   037B 00FF
        BNEQ    L_534D                          ; 5314   020C 0037

        INCR    R2                              ; 5316   000A
        MVI@    R2,     R3                      ; 5317   0293
        CMPI    #$00FF, R3                      ; 5318   037B 00FF
        BEQ     L_5349                          ; 531A   0204 002D

        CMPI    #$0160, R2                      ; 531C   037A 0160
        BEQ     L_5349                          ; 531E   0204 0029

L_5320:
        MVI@    R2,     R3                      ; 5320   0293
        CMPI    #$00FF, R3                      ; 5321   037B 00FF
        BEQ     L_532C                          ; 5323   0204 0007

        CMPI    #$0160, R2                      ; 5325   037A 0160
        BEQ     L_532C                          ; 5327   0204 0003

        INCR    R2                              ; 5329   000A
        B       L_5320                          ; 532A   0220 000B

L_532C:
        DECR    R2                              ; 532C   0012
        MVII    #$00FF, R3                      ; 532D   02BB 00FF
        MVO@    R3,     R2                      ; 532F   0253
        SUBI    #$015B, R2                      ; 5330   033A 015B
        ADDI    #$0151, R2                      ; 5332   02FA 0151
        MVI@    R2,     R3                      ; 5334   0293
        MOVR    R3,     R4                      ; 5335   009C
        ANDI    #$0003, R4                      ; 5336   03BC 0003
        CMPI    #$0001, R4                      ; 5338   037C 0001
        BGT     L_534D                          ; 533A   020E 0011

        XORI    #$0011, R3                      ; 533C   03FB 0011
        MVO@    R3,     R2                      ; 533E   0253
        SUBI    #$0151, R2                      ; 533F   033A 0151
        ADDI    #$0320, R2                      ; 5341   02FA 0320
        MVI@    R2,     R3                      ; 5343   0293
        SDBD                                    ; 5344   0001
        XORI    #$0400, R3                      ; 5345   03FB 0000 0004
        MVO@    R3,     R2                      ; 5348   0253
L_5349:
        MVII    #$0001, R0                      ; 5349   02B8 0001
        MVO     R0,     G_0163                  ; 534B   0240 0163
L_534D:
        PULR    R4                              ; 534D   02B4
        PULR    R3                              ; 534E   02B3
        PULR    R2                              ; 534F   02B2
        PULR    R1                              ; 5350   02B1
        PULR    R0                              ; 5351   02B0
        PULR    R7                              ; 5352   02B7

        DECLE   $0275,  $0281,  $0184,  $03B9   ; 5353   0275 0281 0184 03B9
        DECLE   $003F,  $0204,  $0010,  $0281   ; 5357   003F 0204 0010 0281
        DECLE   $0102,  $0089,  $020C,  $000B   ; 535B   0102 0089 020C 000B
        DECLE   $0280,  $031E,  $0001,  $03B8   ; 535F   0280 031E 0001 03B8
        DECLE   $00FF,  $0006,  $0240,  $031E   ; 5363   00FF 0006 0240 031E
        DECLE   $0004                           ; 5367   0004

        CMP@    R6,     R4                      ; 5368   0374
        CMP@    R2,     R3                      ; 5369   0353
        MVI     G_013F, R0                      ; 536A   0280 013F
        TSTR    R0                              ; 536C   0080
        BEQ     L_537F                          ; 536D   0204 0010

        MVO     R0,     G_0146                  ; 536F   0240 0146
        MVI     G_0166, R1                      ; 5371   0281 0166

        JSR     R5,     L_6A8F                  ; 5373   0004 0168 028F

        ANDI    #$000F, R0                      ; 5376   03B8 000F
        BNEQ    L_5394                          ; 5378   020C 001A

        INCR    R1                              ; 537A   0009
        MVO     R1,     G_0166                  ; 537B   0241 0166
        B       L_5394                          ; 537D   0200 0015

L_537F:
        MVII    #$0001, R1                      ; 537F   02B9 0001
        MVI     G_0172, R0                      ; 5381   0280 0172
        XOR     G_0175, R0                      ; 5383   03C0 0175
        ANDI    #$0006, R0                      ; 5385   03B8 0006
        BEQ     L_538B                          ; 5387   0204 0002

        MVII    #$0005, R1                      ; 5389   02B9 0005
L_538B:
        MVO     R1,     G_0165                  ; 538B   0241 0165
L_538D:
        MVI     G_0173, R1                      ; 538D   0281 0173
        AND     G_0176, R1                      ; 538F   0381 0176
        SWAP    R1,     2                       ; 5391   0045
        BMI     L_540B                          ; 5392   020B 0077

L_5394:
        ANDI    #$0007, R1                      ; 5394   03B9 0007
        MVI     G_031E, R2                      ; 5396   0282 031E
        MVI     G_0326, R3                      ; 5398   0283 0326
        INCR    R1                              ; 539A   0009
        ADDR    R7,     R1                      ; 539B   00F9
        ADD@    R1,     R7                      ; 539C   02CF

        INCR    R0                              ; 539D   0008
        INCR    R4                              ; 539E   000C
        DECR    R2                              ; 539F   0012
        DECR    R6                              ; 53A0   0016
        COMR    R4                              ; 53A1   001C
        NEGR    R0                              ; 53A2   0020
        NEGR    R6                              ; 53A3   0026
        ADCR    R2                              ; 53A4   002A
        SUBI    #$0002, R3                      ; 53A5   033B 0002
        B       L_53CB                          ; 53A7   0200 0022

        SUBI    #$0002, R3                      ; 53A9   033B 0002
        SUBI    #$0002, R2                      ; 53AB   033A 0002
        B       L_53CB                          ; 53AD   0200 001C

        SUBI    #$0002, R2                      ; 53AF   033A 0002
        B       L_53CB                          ; 53B1   0200 0018

        SUBI    #$0002, R2                      ; 53B3   033A 0002
        ADDI    #$0002, R3                      ; 53B5   02FB 0002
        B       L_53CB                          ; 53B7   0200 0012

        ADDI    #$0002, R3                      ; 53B9   02FB 0002
        B       L_53CB                          ; 53BB   0200 000E

        ADDI    #$0002, R2                      ; 53BD   02FA 0002
        ADDI    #$0002, R3                      ; 53BF   02FB 0002
        B       L_53CB                          ; 53C1   0200 0008

        ADDI    #$0002, R2                      ; 53C3   02FA 0002
        B       L_53CB                          ; 53C5   0200 0004

        ADDI    #$0002, R2                      ; 53C7   02FA 0002
        SUBI    #$0002, R3                      ; 53C9   033B 0002
L_53CB:
        MOVR    R2,     R0                      ; 53CB   0090
        MOVR    R3,     R1                      ; 53CC   0099
        ANDI    #$00FF, R0                      ; 53CD   03B8 00FF
        ANDI    #$007F, R1                      ; 53CF   03B9 007F
        CMPI    #$000A, R0                      ; 53D1   0378 000A
        BGE     L_53D9                          ; 53D3   020D 0004

        MVII    #$000A, R0                      ; 53D5   02B8 000A
        B       L_53DF                          ; 53D7   0200 0006

L_53D9:
        CMPI    #$009E, R0                      ; 53D9   0378 009E
        BLE     L_53DF                          ; 53DB   0206 0002

        MVII    #$009E, R0                      ; 53DD   02B8 009E
L_53DF:
        CMPI    #$0050, R1                      ; 53DF   0379 0050
        BGE     L_53E7                          ; 53E1   020D 0004

        MVII    #$0050, R1                      ; 53E3   02B9 0050
        B       L_53ED                          ; 53E5   0200 0006

L_53E7:
        CMPI    #$0060, R1                      ; 53E7   0379 0060
        BLE     L_53ED                          ; 53E9   0206 0002

        MVII    #$0060, R1                      ; 53EB   02B9 0060
L_53ED:
        SDBD                                    ; 53ED   0001
        DECLE   $03BA,  $0000,  $00FF,  $00C2   ; 53EE   03BA 0000 00FF 00C2
        DECLE   $0001,  $03BB,  $0080,  $00FF   ; 53F2   0001 03BB 0080 00FF
        DECLE   $00CB,  $0272,  $0273,  $0004   ; 53F6   00CB 0272 0273 0004

        CMPR    R4,     R4                      ; 53FA   0164
        INCR    R4                              ; 53FB   000C
        PULR    R3                              ; 53FC   02B3
        PULR    R2                              ; 53FD   02B2
        BC      L_540B                          ; 53FE   0201 000B

        MVO     R2,     G_031E                  ; 5400   0242 031E
        MVO     R3,     G_0326                  ; 5402   0243 0326
        MVI     G_0165, R0                      ; 5404   0280 0165
        DECR    R0                              ; 5406   0010
        MVO     R0,     G_0165                  ; 5407   0240 0165
        BNEQ    L_538D                          ; 5409   022C 007D
L_540B:
        PULR    R7                              ; 540B   02B7

        PSHR    R5                              ; 540C   0275
        PSHR    R3                              ; 540D   0273
        PSHR    R2                              ; 540E   0272
        DECR    R1                              ; 540F   0011
        SLR     R1,     2                       ; 5410   0065
        SLR     R1,     1                       ; 5411   0061
        SLL     R1,     2                       ; 5412   004D
        PSHR    R1                              ; 5413   0271
        SLL     R1,     2                       ; 5414   004D
        ADD@    R6,     R1                      ; 5415   02F1
        DECR    R0                              ; 5416   0010
        SLR     R0,     2                       ; 5417   0064
        SLR     R0,     1                       ; 5418   0060
        ADDI    #$01EB, R1                      ; 5419   02F9 01EB
        ADDR    R0,     R1                      ; 541B   00C1
        MVII    #$0334, R3                      ; 541C   02BB 0334

        JSR     R5,     L_6443                  ; 541E   0004 0164 0043
        JSR     R5,     L_6443                  ; 5421   0004 0164 0043

        PULR    R1                              ; 5424   02B1
        ANDI    #$0007, R1                      ; 5425   03B9 0007
        SLL     R1,     2                       ; 5427   004D
        SDBD                                    ; 5428   0001
        MVII    #$6488, R4                      ; 5429   02BC 0088 0064
        ADDR    R1,     R4                      ; 542C   00CC
        ADDR    R1,     R4                      ; 542D   00CC
        MVII    #$0340, R5                      ; 542E   02BD 0340
        PULR    R1                              ; 5430   02B1
        NEGR    R1                              ; 5431   0021
        ANDI    #$0007, R1                      ; 5432   03B9 0007
        SUBR    R1,     R5                      ; 5434   010D
        MVII    #$0004, R0                      ; 5435   02B8 0004
L_5437:
        MVI@    R5,     R1                      ; 5437   02A9
        SDBD                                    ; 5438   0001
        AND@    R4,     R1                      ; 5439   03A1
        BNEQ    L_5441                          ; 543A   020C 0005

        DECR    R0                              ; 543C   0010
        BNEQ    L_5437                          ; 543D   022C 0007

        CLRC                                    ; 543F   0006
        PULR    R7                              ; 5440   02B7

L_5441:
        SETC                                    ; 5441   0007
        PULR    R7                              ; 5442   02B7

        PSHR    R5                              ; 5443   0275
        MVI@    R1,     R0                      ; 5444   0288
        ANDI    #$0078, R0                      ; 5445   03B8 0078
        SDBD                                    ; 5447   0001
        MVII    #$70BD, R4                      ; 5448   02BC 00BD 0070
        INCR    R4                              ; 544B   000C
        MOVR    R4,     R5                      ; 544C   00A5
        ADDR    R0,     R4                      ; 544D   00C4
        INCR    R1                              ; 544E   0009
        MVI@    R1,     R0                      ; 544F   0288
        ANDI    #$0078, R0                      ; 5450   03B8 0078
        ADDR    R0,     R5                      ; 5452   00C5
        ADDI    #$0013, R1                      ; 5453   02F9 0013
        PSHR    R1                              ; 5455   0271
        MVI@    R4,     R0                      ; 5456   02A0
        MVI@    R5,     R1                      ; 5457   02A9
        SWAP    R0,     1                       ; 5458   0040
        XORR    R0,     R1                      ; 5459   01C1
        MVO@    R1,     R3                      ; 545A   0259
        INCR    R3                              ; 545B   000B
        MVI@    R4,     R0                      ; 545C   02A0
        MVI@    R5,     R1                      ; 545D   02A9
        SWAP    R0,     1                       ; 545E   0040
        XORR    R0,     R1                      ; 545F   01C1
        MVO@    R1,     R3                      ; 5460   0259
        INCR    R3                              ; 5461   000B
        MVI@    R4,     R0                      ; 5462   02A0
        MVI@    R5,     R1                      ; 5463   02A9
        SWAP    R0,     1                       ; 5464   0040
        XORR    R0,     R1                      ; 5465   01C1
        MVO@    R1,     R3                      ; 5466   0259
        INCR    R3                              ; 5467   000B
        MVI@    R4,     R0                      ; 5468   02A0
        MVI@    R5,     R1                      ; 5469   02A9
        SWAP    R0,     1                       ; 546A   0040
        XORR    R0,     R1                      ; 546B   01C1
        MVO@    R1,     R3                      ; 546C   0259
        INCR    R3                              ; 546D   000B
        MVI@    R4,     R0                      ; 546E   02A0
        MVI@    R5,     R1                      ; 546F   02A9
        SWAP    R0,     1                       ; 5470   0040
        XORR    R0,     R1                      ; 5471   01C1
        MVO@    R1,     R3                      ; 5472   0259
        INCR    R3                              ; 5473   000B
        MVI@    R4,     R0                      ; 5474   02A0
        MVI@    R5,     R1                      ; 5475   02A9
        SWAP    R0,     1                       ; 5476   0040
        XORR    R0,     R1                      ; 5477   01C1
        MVO@    R1,     R3                      ; 5478   0259
        INCR    R3                              ; 5479   000B
        MVI@    R4,     R0                      ; 547A   02A0
        MVI@    R5,     R1                      ; 547B   02A9
        SWAP    R0,     1                       ; 547C   0040
        XORR    R0,     R1                      ; 547D   01C1
        MVO@    R1,     R3                      ; 547E   0259
        INCR    R3                              ; 547F   000B
        MVI@    R4,     R0                      ; 5480   02A0
        MVI@    R5,     R1                      ; 5481   02A9
        SWAP    R0,     1                       ; 5482   0040
        XORR    R0,     R1                      ; 5483   01C1
        MVO@    R1,     R3                      ; 5484   0259
        INCR    R3                              ; 5485   000B
        PULR    R1                              ; 5486   02B1
        PULR    R7                              ; 5487   02B7

        DECLE   $0010,  $0000,  $0038,  $0000   ; 5488   0010 0000 0038 0000
        DECLE   $007C,  $0000,  $0038,  $0000   ; 548C   007C 0000 0038 0000
        DECLE   $0000,  $0008,  $0000,  $001C   ; 5490   0000 0008 0000 001C
        DECLE   $0000,  $003E,  $0000,  $001C   ; 5494   0000 003E 0000 001C
        DECLE   $0000,  $0004,  $0000,  $000E   ; 5498   0000 0004 0000 000E
        DECLE   $0000,  $001F,  $0000,  $000E   ; 549C   0000 001F 0000 000E
        DECLE   $0000,  $0002,  $0000           ; 54A0   0000 0002 0000

        SETC                                    ; 54A3   0007
        TSTR    R0                              ; 54A4   0080
        INCR    R7                              ; 54A5   000F

        DECLE   $0000                           ; 54A6   0000
L_54A7:
        SETC                                    ; 54A7   0007
        DECLE   $0000,  $0001,  $0080,  $0003   ; 54A8   0000 0001 0080 0003
        DECLE   $00C0,  $0007,  $0080,  $0003   ; 54AC   00C0 0007 0080 0003
        DECLE   $0080,  $0000,  $00C0,  $0001   ; 54B0   0080 0000 00C0 0001
        DECLE   $00E0,  $0003,  $00C0,  $0001   ; 54B4   00E0 0003 00C0 0001
        DECLE   $0040,  $0000,  $00E0,  $0000   ; 54B8   0040 0000 00E0 0000
        DECLE   $00F0,  $0001,  $00E0,  $0000   ; 54BC   00F0 0001 00E0 0000
        DECLE   $0020,  $0000,  $0070,  $0000   ; 54C0   0020 0000 0070 0000
        DECLE   $00F8,  $0000,  $0070,  $0000   ; 54C4   00F8 0000 0070 0000
        DECLE   $004A,  $006F,  $0065,  $003A   ; 54C8   004A 006F 0065 003A
        DECLE   $0020,  $004B,  $006E,  $006F   ; 54CC   0020 004B 006E 006F
        DECLE   $0063,  $006B,  $0020,  $006B   ; 54D0   0063 006B 0020 006B
        DECLE   $006E,  $006F,  $0063,  $006B   ; 54D4   006E 006F 0063 006B
        DECLE   $0021,  $0010,  $0005,  $0005   ; 54D8   0021 0010 0005 0005
        DECLE   $0000,  $0001,  $0000,  $0002   ; 54DC   0000 0001 0000 0002
        DECLE   $0010,  $0011,  $0006,  $0007   ; 54E0   0010 0011 0006 0007
        DECLE   $0010,  $0005,  $0000,  $0001   ; 54E4   0010 0005 0000 0001
        DECLE   $0000,  $0013,  $0005,  $0004   ; 54E8   0000 0013 0005 0004
        DECLE   $0000,  $0007,  $0010,  $0000   ; 54EC   0000 0007 0010 0000

        DECR    R0                              ; 54F0   0010
L_54F1:
        DECR    R7                              ; 54F1   0017

        DECLE   $0004,  $0001,  $0010,  $0004   ; 54F2   0004 0001 0010 0004
        DECLE   $0000,  $0006,  $0000           ; 54F6   0000 0006 0000
L_54F9:
        DECR    R7                              ; 54F9   0017

        DECLE   $0005,  $0001,  $0000           ; 54FA   0005 0001 0000

        CLRC                                    ; 54FD   0006
        DECR    R0                              ; 54FE   0010

        JSR     R4,     .EXEC.01F               ; 54FF   0004 0010 001F
        DECLE   $0004,  $0003,  $0000,  $0005   ; 5502   0004 0003 0000 0005
        DECLE   $0010,  $0007,  $0010,  $001F   ; 5506   0010 0007 0010 001F
        DECLE   $0003,  $0005,  $0010,  $0007   ; 550A   0003 0005 0010 0007
        DECLE   $0000,  $0003,  $0010,  $001F   ; 550E   0000 0003 0010 001F
        DECLE   $0003,  $0006,  $0010,  $0001   ; 5512   0003 0006 0010 0001
        DECLE   $0010,  $0007,  $0000,  $004D   ; 5516   0010 0007 0000 004D
        DECLE   $006F,  $0065,  $003A,  $0020   ; 551A   006F 0065 003A 0020
        DECLE   $0057,  $0068,  $006F,  $0060   ; 551E   0057 0068 006F 0060
        DECLE   $0073,  $0020,  $0074,  $0068   ; 5522   0073 0020 0074 0068
        DECLE   $0065,  $0072,  $0065,  $003F   ; 5526   0065 0072 0065 003F

        PSHR    R5                              ; 552A   0275
        CLRR    R0                              ; 552B   01C0
        MVO     R0,     G_0167                  ; 552C   0240 0167
        MVO     R0,     G_0163                  ; 552E   0240 0163
        MVO     R0,     G_0147                  ; 5530   0240 0147
L_5532:
        MVI     G_0164, R0                      ; 5532   0280 0164
        DECLE   $0378,  $001F,  $0204,  $0006   ; 5534   0378 001F 0204 0006
        DECLE   $0004,  $016C,  $007B,  $0001   ; 5538   0004 016C 007B 0001

        B       L_5532                          ; 553C   0220 000B

        CLRR    R0                              ; 553E   01C0
        MVO     R0,     G_0164                  ; 553F   0240 0164
        MVII    #$0005, R0                      ; 5541   02B8 0005
        MVII    #$0151, R4                      ; 5543   02BC 0151
        MVII    #$00FF, R1                      ; 5545   02B9 00FF

        JSR     R5,     L_6C67                  ; 5547   0004 016C 0067

        MVII    #$0318, R4                      ; 554A   02BC 0318
        MVII    #$0300, R1                      ; 554C   02B9 0300
        MVII    #$0005, R0                      ; 554E   02B8 0005

        JSR     R5,     L_6C67                  ; 5550   0004 016C 0067

        MVII    #$0320, R4                      ; 5553   02BC 0320
        MVII    #$0005, R0                      ; 5555   02B8 0005
        MVII    #$0090, R1                      ; 5557   02B9 0090

        JSR     R5,     L_6C67                  ; 5559   0004 016C 0067

        MVII    #$0005, R0                      ; 555C   02B8 0005
        MVII    #$0010, R1                      ; 555E   02B9 0010
        SLL     R1,     2                       ; 5560   004D
        ADDR    R1,     R1                      ; 5561   00C9
        SDBD                                    ; 5562   0001
        XORI    #$0800, R1                      ; 5563   03F9 0000 0008
        MVII    #$0328, R4                      ; 5566   02BC 0328

        JSR     R5,     L_6C67                  ; 5568   0004 016C 0067
        JSR     R5,     L_6A8F                  ; 556B   0004 0168 028F

        ANDI    #$0010, R0                      ; 556E   03B8 0010
        MVO     R0,     G_0168                  ; 5570   0240 0168
        BEQ     L_5586                          ; 5572   0204 0012

        MVII    #$0320, R1                      ; 5574   02B9 0320
        MVII    #$0005, R0                      ; 5576   02B8 0005
L_5578:
        MVI@    R1,     R2                      ; 5578   028A
        SDBD                                    ; 5579   0001
        ANDI    #$FBFF, R2                      ; 557A   03BA 00FF 00FB
        SDBD                                    ; 557D   0001
        XORI    #$0400, R2                      ; 557E   03FA 0000 0004
        MVO@    R2,     R1                      ; 5581   024A
        INCR    R1                              ; 5582   0009
        DECR    R0                              ; 5583   0010
        BNEQ    L_5578                          ; 5584   022C 000D

L_5586:
        JSR     R5,     L_659B                  ; 5586   0004 0164 019B

        MVI     G_0161, R0                      ; 5589   0280 0161

        JSR     R5,     L_6A43                  ; 558B   0004 0168 0243
        DECLE   $0001                           ; 558E   0001

        PULR    R7                              ; 558F   02B7

        SLL     R2,     1                       ; 5590   004A
        SAR     R3,     2                       ; 5591   006F
        SLR     R1,     2                       ; 5592   0065
        RSWD    R2                              ; 5593   003A
        NEGR    R0                              ; 5594   0020
        RLC     R3,     1                       ; 5595   0053
        SLR     R1,     1                       ; 5596   0061
        SAR     R2,     2                       ; 5597   006E
        RRC     R0,     2                       ; 5598   0074
        SLR     R1,     1                       ; 5599   0061
        NEGR    R1                              ; 559A   0021
        PSHR    R5                              ; 559B   0275
        MVI     G_0169, R1                      ; 559C   0281 0169
        INCR    R1                              ; 559E   0009
        MVO     R1,     G_0169                  ; 559F   0241 0169
        DECR    R1                              ; 55A1   0011
        ANDI    #$000F, R1                      ; 55A2   03B9 000F
        SLR     R1,     1                       ; 55A4   0061
        SLL     R1,     2                       ; 55A5   004D
        ADDR    R1,     R1                      ; 55A6   00C9
        MOVR    R1,     R5                      ; 55A7   008D
        SDBD                                    ; 55A8   0001
        ADDI    #$64D9, R5                      ; 55A9   02FD 00D9 0064
        MVI@    R5,     R0                      ; 55AC   02A8
        MVII    #$0010, R2                      ; 55AD   02BA 0010
        MVII    #$015B, R4                      ; 55AF   02BC 015B
L_55B1:
        MOVR    R2,     R3                      ; 55B1   0093
        ANDR    R0,     R3                      ; 55B2   0183
        BEQ     L_55B7                          ; 55B3   0204 0002

        MVII    #$00FF, R3                      ; 55B5   02BB 00FF
L_55B7:
        MVO@    R3,     R4                      ; 55B7   0263
        SLR     R2,     1                       ; 55B8   0062
        BNEQ    L_55B1                          ; 55B9   022C 0009

        MVI@    R5,     R0                      ; 55BB   02A8
        MVO     R0,     G_0161                  ; 55BC   0240 0161
        SDBD                                    ; 55BE   0001
        MVI@    R5,     R0                      ; 55BF   02A8
        MVII    #$0214, R2                      ; 55C0   02BA 0214
L_55C2:
        MVI@    R2,     R3                      ; 55C2   0293
        MOVR    R3,     R4                      ; 55C3   009C
        SDBD                                    ; 55C4   0001
        ANDI    #$1007, R4                      ; 55C5   03BC 0007 0010
        CMPI    #$0006, R4                      ; 55C8   037C 0006
        BEQ     L_55D2                          ; 55CA   0204 0006

        SDBD                                    ; 55CC   0001
        ANDI    #$EFF8, R3                      ; 55CD   03BB 00F8 00EF
        XORR    R0,     R3                      ; 55D0   01C3
        MVO@    R3,     R2                      ; 55D1   0253
L_55D2:
        INCR    R2                              ; 55D2   000A
        CMPI    #$02F0, R2                      ; 55D3   037A 02F0
        BNEQ    L_55C2                          ; 55D5   022C 0014

        SDBD                                    ; 55D7   0001
        XORI    #$0800, R0                      ; 55D8   03F8 0000 0008
        MVO     R0,     G_0344                  ; 55DB   0240 0344
        SDBD                                    ; 55DD   0001
        MVI@    R5,     R0                      ; 55DE   02A8
        MVO     R0,     G_0345                  ; 55DF   0240 0345
        MVII    #$0328, R2                      ; 55E1   02BA 0328
        MVII    #$0005, R1                      ; 55E3   02B9 0005
L_55E5:
        MVI@    R2,     R3                      ; 55E5   0293
        SDBD                                    ; 55E6   0001
        ANDI    #$CFF8, R3                      ; 55E7   03BB 00F8 00CF
        XORR    R0,     R3                      ; 55EA   01C3
        MVO@    R3,     R2                      ; 55EB   0253
        INCR    R2                              ; 55EC   000A
        DECR    R1                              ; 55ED   0011
        BNEQ    L_55E5                          ; 55EE   022C 000A

        MVI     G_032E, R0                      ; 55F0   0280 032E
        SDBD                                    ; 55F2   0001
        ANDI    #$EFF8, R0                      ; 55F3   03B8 00F8 00EF
        SDBD                                    ; 55F6   0001
        XOR@    R5,     R0                      ; 55F7   03E8
        MVO     R0,     G_032E                  ; 55F8   0240 032E
        MVI     G_0169, R3                      ; 55FA   0283 0169
        CMPI    #$0018, R3                      ; 55FC   037B 0018
        BLT     L_5604                          ; 55FE   0205 0004

        MVII    #$0096, R3                      ; 5600   02BB 0096
        B       L_5608                          ; 5602   0200 0004

L_5604:
        DECR    R3                              ; 5604   0013
        SLL     R3,     2                       ; 5605   004F
        ADDI    #$0060, R3                      ; 5606   02FB 0060
L_5608:
        MVO     R3,     G_0331                  ; 5608   0243 0331
        PULR    R7                              ; 560A   02B7

        SLL     R1,     2                       ; 560B   004D
        SAR     R3,     2                       ; 560C   006F
        SLR     R1,     2                       ; 560D   0065
        RSWD    R2                              ; 560E   003A
        NEGR    R0                              ; 560F   0020
        RLC     R3,     1                       ; 5610   0053
        SLR     R1,     1                       ; 5611   0061
        SAR     R2,     2                       ; 5612   006E
        RRC     R0,     2                       ; 5613   0074
        SLR     R1,     1                       ; 5614   0061
        NEGR    R0                              ; 5615   0020
        RRC     R3,     2                       ; 5616   0077
        SAR     R0,     1                       ; 5617   0068
        SAR     R3,     2                       ; 5618   006F
        NEGR    R1                              ; 5619   0021
        PSHR    R5                              ; 561A   0275
        MVI     G_0167, R1                      ; 561B   0281 0167
        MOVR    R1,     R2                      ; 561D   008A
        MOVR    R1,     R3                      ; 561E   008B
        BEQ     L_5647                          ; 561F   0204 0026

        ADDI    #$015B, R3                      ; 5621   02FB 015B
        MVI@    R3,     R0                      ; 5623   0298
        CMPI    #$00FF, R0                      ; 5624   0378 00FF
        BNEQ    L_5647                          ; 5626   020C 001F

L_5628:
        JSR     R5,     L_6A8F                  ; 5628   0004 0168 028F

        ANDI    #$000F, R0                      ; 562B   03B8 000F
        ADDI    #$0002, R0                      ; 562D   02F8 0002
        CMPI    #$000A, R0                      ; 562F   0378 000A
        BEQ     L_5628                          ; 5631   0224 000A

        SLL     R0,     2                       ; 5633   004C
        ADDR    R0,     R0                      ; 5634   00C0
        SDBD                                    ; 5635   0001
        ADDI    #$0704, R0                      ; 5636   02F8 0004 0007
        ADDI    #$0318, R1                      ; 5639   02F9 0318
        MVO@    R0,     R1                      ; 563B   0248
        SUBI    #$0318, R1                      ; 563C   0339 0318
        ADDI    #$0151, R2                      ; 563E   02FA 0151
        MVII    #$0002, R0                      ; 5640   02B8 0002
        ADD     G_0168, R0                      ; 5642   02C0 0168
        MVO@    R0,     R2                      ; 5644   0250
        B       L_5656                          ; 5645   0200 000F

L_5647:
        ADDI    #$0151, R2                      ; 5647   02FA 0151
        MVII    #$0002, R0                      ; 5649   02B8 0002
        ADD     G_0168, R0                      ; 564B   02C0 0168
        MVO@    R0,     R2                      ; 564D   0250
        SDBD                                    ; 564E   0001
        MVII    #$0754, R0                      ; 564F   02B8 0054 0007
        MVII    #$0318, R2                      ; 5652   02BA 0318
        ADDR    R1,     R2                      ; 5654   00CA
        MVO@    R0,     R2                      ; 5655   0250
L_5656:
        INCR    R1                              ; 5656   0009
        MVO     R1,     G_0167                  ; 5657   0241 0167
        CMPI    #$0001, R1                      ; 5659   0379 0001
        BNEQ    L_5667                          ; 565B   020C 000A

        JSR     R5,     L_6034                  ; 565D   0004 0160 0034

        MVI     G_0161, R0                      ; 5660   0280 0161

        JSR     R5,     L_6A43                  ; 5662   0004 0168 0243
        DECLE   $0001                           ; 5665   0001

        PULR    R7                              ; 5666   02B7

L_5667:
        CMPI    #$0005, R1                      ; 5667   0379 0005
        BEQ     L_5672                          ; 5669   0204 0007

        MVI     G_0161, R0                      ; 566B   0280 0161
        ADDR    R0,     R0                      ; 566D   00C0

        JSR     R5,     L_6A43                  ; 566E   0004 0168 0243
        DECLE   $0001                           ; 5671   0001
L_5672:
        PULR    R7                              ; 5672   02B7

        SLL     R2,     1                       ; 5673   004A
        SAR     R3,     2                       ; 5674   006F
        SLR     R1,     2                       ; 5675   0065
        RSWD    R2                              ; 5676   003A
        NEGR    R0                              ; 5677   0020
        RLC     R3,     1                       ; 5678   0053
        SLR     R1,     1                       ; 5679   0061
        SAR     R2,     2                       ; 567A   006E
        RRC     R0,     2                       ; 567B   0074
        SLR     R1,     1                       ; 567C   0061
        RRC     R0,     1                       ; 567D   0070
        SLR     R1,     2                       ; 567E   0065
        SLR     R0,     2                       ; 567F   0064
        SLR     R1,     2                       ; 5680   0065
        NEGR    R0                              ; 5681   0020
        SAR     R1,     1                       ; 5682   0069
        RRC     R3,     1                       ; 5683   0073
        NEGR    R0                              ; 5684   0020
        SLR     R3,     1                       ; 5685   0063
        SAR     R3,     2                       ; 5686   006F
        SAR     R1,     2                       ; 5687   006D
        SAR     R1,     1                       ; 5688   0069
        SAR     R2,     2                       ; 5689   006E
        SLR     R0,     1                       ; 568A   0060
        NEGR    R0                              ; 568B   0020
        RRC     R0,     2                       ; 568C   0074
        SAR     R3,     2                       ; 568D   006F
        NEGR    R0                              ; 568E   0020
        RRC     R0,     2                       ; 568F   0074
        SAR     R3,     2                       ; 5690   006F
        RRC     R3,     2                       ; 5691   0077
        SAR     R2,     2                       ; 5692   006E
        NEGR    R1                              ; 5693   0021
        NEGR    R1                              ; 5694   0021
        NEGR    R1                              ; 5695   0021
        MVI@    R5,     R3                      ; 5696   02AB
        MVI     G_013F, R2                      ; 5697   0282 013F
        TSTR    R2                              ; 5699   0092
        BNEQ    L_56A8                          ; 569A   020C 000C

        MVII    #$00FF, R2                      ; 569C   02BA 00FF
        ADDI    #$016A, R3                      ; 569E   02FB 016A
        MVI@    R3,     R1                      ; 56A0   0299
        CMPR    R1,     R2                      ; 56A1   014A
        BEQ     L_56A8                          ; 56A2   0204 0004

        MVO@    R2,     R3                      ; 56A4   025A
        J       L_6AFB                          ; 56A5   0004 0368 02FB
L_56A8:
        MOVR    R5,     R7                      ; 56A8   00AF

        ADDR    R2,     R6                      ; 56A9   00D6
        SLR     R2,     2                       ; 56AA   0066
        INCR    R1                              ; 56AB   0009
        SLR     R3,     2                       ; 56AC   0067
        GSWD    R2                              ; 56AD   0032
        SLR     R3,     2                       ; 56AE   0067
        MOVR    R0,     R7                      ; 56AF   0087

        DECLE   $0067,  $00F0,  $0067,  $0025   ; 56B0   0067 00F0 0067 0025
        DECLE   $0068,  $006E,  $0068,  $02A9   ; 56B4   0068 006E 0068 02A9
        DECLE   $0275,  $0282,  $013F,  $0092   ; 56B8   0275 0282 013F 0092
        DECLE   $020C,  $0017,  $0271,  $0001   ; 56BC   020C 0017 0271 0001
        DECLE   $02BC,  $00A9,  $0066,  $00CC   ; 56C0   02BC 00A9 0066 00CC
        DECLE   $00CC,  $0001,  $02A5,  $0001   ; 56C4   00CC 0001 02A5 0001
        DECLE   $02BC,  $00CE,  $0066,  $0004   ; 56C8   02BC 00CE 0066 0004
        DECLE   $0368,  $029E                   ; 56CC   0368 029E

        MVII    #$016A, R1                      ; 56CE   02B9 016A
        ADD@    R6,     R1                      ; 56D0   02F1
        TSTR    R0                              ; 56D1   0080
        BMI     L_56D5                          ; 56D2   020B 0001

        MVO@    R0,     R1                      ; 56D4   0248
L_56D5:
        PULR    R7                              ; 56D5   02B7

        DECLE   $0029,  $00D3,  $00FE,  $0080   ; 56D6   0029 00D3 00FE 0080
        DECLE   $0045,  $0062,  $0000,  $0080   ; 56DA   0045 0062 0000 0080
        DECLE   $0095,  $0062,  $0000           ; 56DE   0095 0062 0000

        TSTR    R0                              ; 56E1   0080
L_56E2:
        DECR    R7                              ; 56E2   0017

        DECLE   $0062,  $0000,  $0080,  $0047   ; 56E3   0062 0000 0080 0047
        DECLE   $0022,  $0001,  $0080,  $0027   ; 56E7   0022 0001 0080 0027
        DECLE   $0062,  $0000,  $0080,  $0047   ; 56EB   0062 0000 0080 0047
        DECLE   $00E2,  $0000                   ; 56EF   00E2 0000

        TSTR    R0                              ; 56F1   0080
        MOVR    R2,     R7                      ; 56F2   0097

        DECLE   $0062,  $0000,  $0080,  $0019   ; 56F3   0062 0000 0080 0019
        DECLE   $0062,  $0000,  $0080,  $0049   ; 56F7   0062 0000 0080 0049
        DECLE   $0042,  $0001,  $0080,  $0019   ; 56FB   0042 0001 0080 0019
        DECLE   $0062,  $0000,  $0080,  $0049   ; 56FF   0062 0000 0080 0049
        DECLE   $00A2,  $0001,  $0001,  $0000   ; 5703   00A2 0001 0001 0000
        DECLE   $0007,  $0000,  $0011,  $00D3   ; 5707   0007 0000 0011 00D3
        DECLE   $00FE,  $0039,  $0031,  $0014   ; 570B   00FE 0039 0031 0014
        DECLE   $0000,  $0012,  $0000,  $0001   ; 570F   0000 0012 0000 0001
        DECLE   $0000,  $0012,  $0000,  $0039   ; 5713   0000 0012 0000 0039
        DECLE   $002A,  $0010,  $0000,  $0012   ; 5717   002A 0010 0000 0012
        DECLE   $0000,  $0001,  $0000,  $0012   ; 571B   0000 0001 0000 0012
        DECLE   $0000,  $0039,  $0023,  $000E   ; 571F   0000 0039 0023 000E
        DECLE   $0000,  $0022,  $0000,  $0001   ; 5723   0000 0022 0000 0001
        DECLE   $0000,  $0022,  $0000,  $00B9   ; 5727   0000 0022 0000 00B9
        DECLE   $0018,  $000C,  $0000,  $0012   ; 572B   0018 000C 0000 0012
        DECLE   $0000,  $0086,  $003D,  $0019   ; 572F   0000 0086 003D 0019
        DECLE   $00D3,  $00F6,  $0063,  $000A   ; 5733   00D3 00F6 0063 000A
        DECLE   $0089,  $0003,  $0018,  $0000   ; 5737   0089 0003 0018 0000
        DECLE   $0002,  $0000,  $0009,  $0007   ; 573B   0002 0000 0009 0007
        DECLE   $0018,  $0000,  $0002,  $0000   ; 573F   0018 0000 0002 0000
        DECLE   $0089,  $000A,  $0018,  $0000   ; 5743   0089 000A 0018 0000
        DECLE   $0002,  $0000,  $0009,  $000E   ; 5747   0002 0000 0009 000E
        DECLE   $0018,  $0000,  $0002,  $0000   ; 574B   0018 0000 0002 0000
        DECLE   $0089,  $0011,  $0018,  $0000   ; 574F   0089 0011 0018 0000
        DECLE   $0002,  $0000,  $0009,  $0015   ; 5753   0002 0000 0009 0015
        DECLE   $0018,  $0000,  $0002,  $0000   ; 5757   0018 0000 0002 0000
        DECLE   $0089,  $0018,  $0018,  $0000   ; 575B   0089 0018 0018 0000
        DECLE   $0002,  $0000,  $0009,  $001C   ; 575F   0002 0000 0009 001C
        DECLE   $0018,  $0000,  $0002,  $0000   ; 5763   0018 0000 0002 0000
        DECLE   $0089,  $001F,  $0018,  $0000   ; 5767   0089 001F 0018 0000
        DECLE   $0002,  $0000,  $0009,  $0023   ; 576B   0002 0000 0009 0023
        DECLE   $0018,  $0000,  $0002,  $0000   ; 576F   0018 0000 0002 0000
        DECLE   $0089,  $0026,  $0018,  $0000   ; 5773   0089 0026 0018 0000
        DECLE   $0002,  $0000,  $0009,  $002A   ; 5777   0002 0000 0009 002A
        DECLE   $0018,  $0000,  $0002,  $0000   ; 577B   0018 0000 0002 0000
        DECLE   $0089,  $002D,  $0018,  $0000   ; 577F   0089 002D 0018 0000
        DECLE   $0001,  $0000,  $0007,  $0000   ; 5783   0001 0000 0007 0000
        DECLE   $0012,  $00D3,  $00FD,  $0099   ; 5787   0012 00D3 00FD 0099
        DECLE   $000B,  $0036,  $0000,  $0012   ; 578B   000B 0036 0000 0012
        DECLE   $0000,  $0011,  $0000,  $0012   ; 578F   0000 0011 0000 0012
        DECLE   $0000,  $0089,  $000A,  $003A   ; 5793   0000 0089 000A 003A
        DECLE   $0000,  $0012,  $0000,  $0011   ; 5797   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0009   ; 579B   0000 0012 0000 0009
        DECLE   $0007,  $0036,  $0000,  $0012   ; 579F   0007 0036 0000 0012
        DECLE   $0000,  $0011,  $0000,  $0012   ; 57A3   0000 0011 0000 0012
        DECLE   $0000,  $0019,  $0001,  $0032   ; 57A7   0000 0019 0001 0032
        DECLE   $0000,  $0012,  $0000,  $0011   ; 57AB   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0009   ; 57AF   0000 0012 0000 0009
        DECLE   $0007,  $0036,  $0000,  $0012   ; 57B3   0007 0036 0000 0012
        DECLE   $0000,  $0011,  $0000,  $0012   ; 57B7   0000 0011 0000 0012
        DECLE   $0000,  $0089,  $000A,  $003A   ; 57BB   0000 0089 000A 003A
        DECLE   $0000,  $0012,  $0000,  $0011   ; 57BF   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0099   ; 57C3   0000 0012 0000 0099
        DECLE   $000B,  $003C,  $0000,  $0012   ; 57C7   000B 003C 0000 0012
        DECLE   $0000,  $0011,  $0000,  $0012   ; 57CB   0000 0011 0000 0012
        DECLE   $0000,  $0089,  $000A,  $003A   ; 57CF   0000 0089 000A 003A
        DECLE   $0000,  $0012,  $0000,  $0011   ; 57D3   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0009   ; 57D7   0000 0012 0000 0009
        DECLE   $0007,  $0036,  $0000,  $0012   ; 57DB   0007 0036 0000 0012
        DECLE   $0000,  $0011,  $0000,  $0012   ; 57DF   0000 0011 0000 0012
        DECLE   $0000,  $0019,  $0001,  $0032   ; 57E3   0000 0019 0001 0032
        DECLE   $0000,  $0012,  $0000,  $0011   ; 57E7   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0086   ; 57EB   0000 0012 0000 0086
        DECLE   $0039,  $0014,  $00D3,  $00FB   ; 57EF   0039 0014 00D3 00FB
        DECLE   $0009,  $001C,  $005A,  $0000   ; 57F3   0009 001C 005A 0000
        DECLE   $0022,  $0000,  $0089,  $0011   ; 57F7   0022 0000 0089 0011
        DECLE   $005A,  $0000,  $0022,  $0000   ; 57FB   005A 0000 0022 0000
        DECLE   $0009,  $001C,  $005A,  $0000   ; 57FF   0009 001C 005A 0000
        DECLE   $0012,  $0000,  $0089,  $0011   ; 5803   0012 0000 0089 0011
        DECLE   $005A,  $0000,  $0012,  $0000   ; 5807   005A 0000 0012 0000
        DECLE   $0089,  $0018,  $005A,  $0000   ; 580B   0089 0018 005A 0000
        DECLE   $0022,  $0000,  $0009,  $0015   ; 580F   0022 0000 0009 0015
        DECLE   $005A,  $0000,  $0022,  $0000   ; 5813   005A 0000 0022 0000
        DECLE   $0089,  $0018,  $005A,  $0000   ; 5817   0089 0018 005A 0000
        DECLE   $0012,  $0000,  $0009,  $0015   ; 581B   0012 0000 0009 0015
        DECLE   $005A,  $0000,  $0012,  $0000   ; 581F   005A 0000 0012 0000
        DECLE   $00C6,  $003C,  $001A,  $00D3   ; 5823   00C6 003C 001A 00D3
        DECLE   $00FD,  $00B9,  $000B,  $0038   ; 5827   00FD 00B9 000B 0038
        DECLE   $0000,  $0002,  $0000,  $0009   ; 582B   0000 0002 0000 0009
        DECLE   $0011,  $003A,  $0000,  $0002   ; 582F   0011 003A 0000 0002
        DECLE   $0000,  $0059,  $0016,  $003A   ; 5833   0000 0059 0016 003A
        DECLE   $0000,  $0002,  $0000,  $0009   ; 5837   0000 0002 0000 0009
        DECLE   $0022,  $003C,  $0000,  $0002   ; 583B   0022 003C 0000 0002
        DECLE   $0000,  $0059,  $0027,  $003C   ; 583F   0000 0059 0027 003C
        DECLE   $0000,  $0002,  $0000,  $0009   ; 5843   0000 0002 0000 0009
        DECLE   $0033,  $003E,  $0000,  $0002   ; 5847   0033 003E 0000 0002
        DECLE   $0000,  $0059,  $0038,  $003E   ; 584B   0000 0059 0038 003E
        DECLE   $0000,  $0002,  $0000,  $0009   ; 584F   0000 0002 0000 0009
        DECLE   $0044,  $003E,  $0000,  $0002   ; 5853   0044 003E 0000 0002
        DECLE   $0000,  $0009,  $0055,  $003C   ; 5857   0000 0009 0055 003C
        DECLE   $0000,  $0002,  $0000,  $0009   ; 585B   0000 0002 0000 0009
        DECLE   $0066,  $003C,  $0000,  $0002   ; 585F   0066 003C 0000 0002
        DECLE   $0000,  $0009,  $0077,  $003A   ; 5863   0000 0009 0077 003A
        DECLE   $0000,  $0002,  $0000,  $0011   ; 5867   0000 0002 0000 0011
        DECLE   $0000,  $0007,  $0000,  $003F   ; 586B   0000 0007 0000 003F

        ADDR    R2,     R3                      ; 586F   00D3
        ADDR    R0,     R7                      ; 5870   00C7

        DECLE   $0063,  $0000,  $0043,  $0038   ; 5871   0063 0000 0043 0038
        DECLE   $0073,  $0000,  $0008,  $000C   ; 5875   0073 0000 0008 000C
        DECLE   $0018,  $000C,  $0028,  $000C   ; 5879   0018 000C 0028 000C
        DECLE   $0022,  $0008,  $0007,  $0000   ; 587D   0022 0008 0007 0000

        PSHR    R5                              ; 5881   0275
        MVII    #$01FE, R2                      ; 5882   02BA 01FE
        MVII    #$0171, R3                      ; 5884   02BB 0171
L_5886:
        CLRR    R0                              ; 5886   01C0
        MVO     R0,     G_0178                  ; 5887   0240 0178
        COMR    R0                              ; 5889   0018
        MVO     R0,     G_0179                  ; 588A   0240 0179
        PSHR    R2                              ; 588C   0272
        PSHR    R3                              ; 588D   0273
L_588E:
        MVI@    R2,     R0                      ; 588E   0290
        TSTR    R0                              ; 588F   0080
        BNEQ    L_5894                          ; 5890   020C 0002

        MVII    #$00FF, R0                      ; 5892   02B8 00FF
L_5894:
        CMP@    R3,     R0                      ; 5894   0358
        DECLE   $020C,  $0094,  $0378,  $005A   ; 5895   020C 0094 0378 005A
        DECLE   $0204,  $00CA,  $0378,  $0076   ; 5899   0204 00CA 0378 0076
        DECLE   $0204,  $0098                   ; 589D   0204 0098

        CMPI    #$00FF, R0                      ; 589F   0378 00FF
        BEQ     L_5913                          ; 58A1   0204 0070

        MOVR    R0,     R1                      ; 58A3   0081
        SLL     R1,     2                       ; 58A4   004D
        SLL     R1,     1                       ; 58A5   0049
        SWAP    R1,     1                       ; 58A6   0041
        ANDI    #$0007, R1                      ; 58A7   03B9 0007
        INCR    R1                              ; 58A9   0009
        ADDR    R7,     R1                      ; 58AA   00F9
        ADD@    R1,     R7                      ; 58AB   02CF
L_58AC:
        DECR    R7                              ; 58AC   0017

        DECR    R3                              ; 58AD   0013
        INCR    R3                              ; 58AE   000B
        RLC     R3,     1                       ; 58AF   0053
        INCR    R7                              ; 58B0   000F

        RLC     R3,     1                       ; 58B1   0053
L_58B2:
        RLC     R3,     1                       ; 58B2   0053
        INCR    R0                              ; 58B3   0008
        CLRR    R1                              ; 58B4   01C9
        B       L_58C5                          ; 58B5   0200 000E

        MVII    #$0001, R1                      ; 58B7   02B9 0001
        B       L_58C5                          ; 58B9   0200 000A

        MVII    #$0002, R1                      ; 58BB   02B9 0002
        B       L_58C5                          ; 58BD   0200 0006

        MVII    #$0004, R1                      ; 58BF   02B9 0004
        B       L_58C5                          ; 58C1   0200 0002

        MVII    #$0007, R1                      ; 58C3   02B9 0007
L_58C5:
        MVO     R1,     G_0178                  ; 58C5   0241 0178
        ANDI    #$001F, R0                      ; 58C7   03B8 001F
        CMPI    #$001F, R0                      ; 58C9   0378 001F
        BNEQ    L_58D3                          ; 58CB   020C 0006

        MVII    #$00FF, R3                      ; 58CD   02BB 00FF
        MVO     R3,     G_0179                  ; 58CF   0243 0179
        B       L_5913                          ; 58D1   0200 0040

L_58D3:
        MVI     G_0177, R1                      ; 58D3   0281 0177
        DECLE   $008A,  $0066,  $0066,  $03B9   ; 58D5   008A 0066 0066 03B9
        DECLE   $000F,  $0001                   ; 58D9   000F 0001

        MVII    #$00CD, R5                      ; 58DB   02BD 00CD
        SAR     R1,     1                       ; 58DD   0069
        ADDR    R1,     R5                      ; 58DE   00CD
        MVII    #$0010, R1                      ; 58DF   02B9 0010
        CLRR    R3                              ; 58E1   01DB
        CLRR    R4                              ; 58E2   01E4
L_58E3:
        CMP@    R5,     R0                      ; 58E3   0368
        BEQ     L_58FB                          ; 58E4   0204 0015

        SDBD                                    ; 58E6   0001
        CMPI    #$69DD, R5                      ; 58E7   037D 00DD 0069
        BNEQ    L_58F0                          ; 58EA   020C 0004

        SDBD                                    ; 58EC   0001
        MVII    #$69CD, R5                      ; 58ED   02BD 00CD 0069
L_58F0:
        INCR    R4                              ; 58F0   000C
        CMPR    R4,     R2                      ; 58F1   0162
        BNEQ    L_58F6                          ; 58F2   020C 0002

        CLRR    R4                              ; 58F4   01E4
        INCR    R3                              ; 58F5   000B
L_58F6:
        DECR    R1                              ; 58F6   0011
        BNEQ    L_58E3                          ; 58F7   022C 0015
        B       L_592B                          ; 58F9   0200 0030

L_58FB:
        MVO     R3,     G_0179                  ; 58FB   0243 0179
        B       L_5913                          ; 58FD   0200 0014

        SDBD                                    ; 58FF   0001
        MVII    #$69DD, R4                      ; 5900   02BC 00DD 0069
        MVII    #$0080, R1                      ; 5903   02B9 0080
L_5905:
        CMP@    R4,     R0                      ; 5905   0360
        BEQ     L_5911                          ; 5906   0204 0009

        SDBD                                    ; 5908   0001
        CMPI    #$69E9, R4                      ; 5909   037C 00E9 0069
        BEQ     L_592B                          ; 590C   0204 001D

        INCR    R1                              ; 590E   0009
        B       L_5905                          ; 590F   0220 000B

L_5911:
        MVO     R1,     G_0179                  ; 5911   0241 0179
L_5913:
        PULR    R5                              ; 5913   02B5
        PULR    R2                              ; 5914   02B2
        MVI@    R2,     R0                      ; 5915   0290
        TSTR    R0                              ; 5916   0080
        BNEQ    L_591B                          ; 5917   020C 0002

        MVII    #$00FF, R0                      ; 5919   02B8 00FF
L_591B:
        MVO@    R0,     R5                      ; 591B   0268
        MVI     G_0178, R0                      ; 591C   0280 0178
        MVO@    R0,     R5                      ; 591E   0268
        MVI     G_0179, R0                      ; 591F   0280 0179
        MVO@    R0,     R5                      ; 5921   0268
        CMPI    #$01FF, R2                      ; 5922   037A 01FF
        BEQ     L_5936                          ; 5924   0204 0010

        MVII    #$0174, R3                      ; 5926   02BB 0174
        INCR    R2                              ; 5928   000A
        B       L_5886                          ; 5929   0220 00A4

L_592B:
        PULR    R5                              ; 592B   02B5
        PSHR    R5                              ; 592C   0275
        INCR    R5                              ; 592D   000D
        MVI@    R5,     R0                      ; 592E   02A8
        MVO     R0,     G_0178                  ; 592F   0240 0178
        MVI@    R5,     R0                      ; 5931   02A8
        MVO     R0,     G_0179                  ; 5932   0240 0179
        B       L_5913                          ; 5934   0220 0022
L_5936:
        PULR    R7                              ; 5936   02B7

        DECLE   $0004,  $0168,  $01C2           ; 5937   0004 0168 01C2

        CLRR    R0                              ; 593A   01C0
        MVO     R0,     G_017B                  ; 593B   0240 017B
        MVO     R0,     G_017C                  ; 593D   0240 017C
        MVI     .ISRVEC.1,R0                    ; 593F   0280 0101
        PSHR    R0                              ; 5941   0270
        MVI     .ISRVEC.0,R0                    ; 5942   0280 0100
        PSHR    R0                              ; 5944   0270
        SDBD                                    ; 5945   0001
        MVII    #$69A3, R0                      ; 5946   02B8 00A3 0069
        MVO     R0,     .ISRVEC.0               ; 5949   0240 0100
        SWAP    R0,     1                       ; 594B   0040
        MVO     R0,     .ISRVEC.1               ; 594C   0240 0101
        MVII    #$000A, R4                      ; 594E   02BC 000A
        CLRR    R0                              ; 5950   01C0
L_5951:
        MVI@    R2,     R5                      ; 5951   0295
        CMPI    #$00FF, R5                      ; 5952   037D 00FF
        BNEQ    L_5951                          ; 5954   022C 0004

L_5956:
        DECR    R0                              ; 5956   0010
        BEQ     L_5960                          ; 5957   0204 0007

        MVI@    R2,     R5                      ; 5959   0295
        CMPI    #$00FF, R5                      ; 595A   037D 00FF
        BNEQ    L_5992                          ; 595C   020C 0034
        B       L_5956                          ; 595E   0220 0009

L_5960:
        DECR    R4                              ; 5960   0014
        BNEQ    L_5956                          ; 5961   022C 000C
        B       L_5977                          ; 5963   0200 0012

        DECLE   $0004,  $0168,  $01C2           ; 5965   0004 0168 01C2

        MVI     .ISRVEC.1,R0                    ; 5968   0280 0101
        PSHR    R0                              ; 596A   0270
        MVI     .ISRVEC.0,R0                    ; 596B   0280 0100
        PSHR    R0                              ; 596D   0270
        SDBD                                    ; 596E   0001
        MVII    #$69A3, R0                      ; 596F   02B8 00A3 0069
        MVO     R0,     .ISRVEC.0               ; 5972   0240 0100
        SWAP    R0,     1                       ; 5974   0040
        MVO     R0,     .ISRVEC.1               ; 5975   0240 0101
L_5977:
        MVII    #$0001, R0                      ; 5977   02B8 0001
        MVO     R0,     G_017B                  ; 5979   0240 017B
        INCR    R0                              ; 597B   0008
        MVO     R0,     G_017C                  ; 597C   0240 017C
L_597E:
        MVI@    R2,     R5                      ; 597E   0295
        CMPI    #$00FF, R5                      ; 597F   037D 00FF
        BNEQ    L_597E                          ; 5981   022C 0004

L_5983:
        MVI@    R2,     R5                      ; 5983   0295
        CMPI    #$00FF, R5                      ; 5984   037D 00FF
        BEQ     L_5983                          ; 5986   0224 0004

        MVII    #$0002, R0                      ; 5988   02B8 0002
        MVO     R0,     G_017B                  ; 598A   0240 017B
L_598C:
        MVI     G_017B, R0                      ; 598C   0280 017B
        CMPI    #$0002, R0                      ; 598E   0378 0002
        BEQ     L_598C                          ; 5990   0224 0005

L_5992:
        MVI@    R2,     R5                      ; 5992   0295
        CMPI    #$00FF, R5                      ; 5993   037D 00FF
        BNEQ    L_5992                          ; 5995   022C 0004

        PULR    R0                              ; 5997   02B0
        MVO     R0,     .ISRVEC.0               ; 5998   0240 0100
        PULR    R0                              ; 599A   02B0
        MVO     R0,     .ISRVEC.1               ; 599B   0240 0101
        MVI     G_017D, R0                      ; 599D   0280 017D
        MVO     R0,     .PSG0.chan_enable       ; 599F   0240 01F8
        B       L_588E                          ; 59A1   0220 0114

        MVI     G_017B, R1                      ; 59A3   0281 017B
        INCR    R1                              ; 59A5   0009
        ADDR    R7,     R1                      ; 59A6   00F9
        ADD@    R1,     R7                      ; 59A7   02CF

        DECR    R5                              ; 59A8   0015
        DIS                                     ; 59A9   0003
        INCR    R5                              ; 59AA   000D
        MVI     .STIC.BORD,R0                   ; 59AB   0280 002C
        MVO     R0,     G_017A                  ; 59AD   0240 017A
        CLRR    R0                              ; 59AF   01C0
        MVO     R0,     .STIC.BORD              ; 59B0   0240 002C
        MVO     R0,     G_017B                  ; 59B2   0240 017B
        MOVR    R5,     R7                      ; 59B4   00AF

        MVI     G_017A, R0                      ; 59B5   0280 017A
        MVO     R0,     .STIC.BORD              ; 59B7   0240 002C
        CLRR    R0                              ; 59B9   01C0
        MVO     R0,     G_017B                  ; 59BA   0240 017B
        MOVR    R5,     R7                      ; 59BC   00AF
        ADD     G_017C, R7                      ; 59BD   02C7 017C

        MVO     R0,     .STIC.VIDEN             ; 59BF   0240 0020
        MOVR    R5,     R7                      ; 59C1   00AF

        MVI     .PSG0.chan_enable,R0            ; 59C2   0280 01F8
        MVO     R0,     G_017D                  ; 59C4   0240 017D
        ANDI    #$00C0, R0                      ; 59C6   03B8 00C0
        XORI    #$003F, R0                      ; 59C8   03F8 003F
        MVO     R0,     .PSG0.chan_enable       ; 59CA   0240 01F8
        MOVR    R5,     R7                      ; 59CC   00AF

        COMR    R3                              ; 59CD   001B
        DECR    R3                              ; 59CE   0013
        DIS                                     ; 59CF   0003
        SETC                                    ; 59D0   0007
L_59D1:
        DECR    R7                              ; 59D1   0017

        DECLE   $0016,  $0006,  $000E,  $001E   ; 59D2   0016 0006 000E 001E
        DECLE   $001C,  $000C,  $000D,  $001D   ; 59D6   001C 000C 000D 001D
        DECLE   $0019,  $0009,  $000B,  $00B7   ; 59DA   0019 0009 000B 00B7

        SARC    R2,     2                       ; 59DE   007E
        MOVR    R7,     R6                      ; 59DF   00BE
        ADDR    R3,     R6                      ; 59E0   00DE
        SARC    R1,     2                       ; 59E1   007D
        MOVR    R7,     R5                      ; 59E2   00BD
        ADDR    R3,     R5                      ; 59E3   00DD
        SARC    R3,     1                       ; 59E4   007B
        MOVR    R7,     R3                      ; 59E5   00BB
        ADDR    R3,     R3                      ; 59E6   00DB
        RRC     R3,     2                       ; 59E7   0077
        ADDR    R2,     R7                      ; 59E8   00D7

        PSHR    R5                              ; 59E9   0275
        CLRR    R1                              ; 59EA   01C9
        CLRR    R2                              ; 59EB   01D2
        CLRR    R4                              ; 59EC   01E4
        MVII    #$0018, R3                      ; 59ED   02BB 0018
        MVII    #$017E, R5                      ; 59EF   02BD 017E
L_59F1:
        MVI@    R3,     R0                      ; 59F1   0298
        MVO@    R4,     R3                      ; 59F2   025C
        MVO@    R0,     R5                      ; 59F3   0268
        SWAP    R0,     1                       ; 59F4   0040
        RRC     R0,     1                       ; 59F5   0070
        RRC     R1,     1                       ; 59F6   0071
        RRC     R0,     1                       ; 59F7   0070
        RRC     R2,     1                       ; 59F8   0072
        INCR    R3                              ; 59F9   000B
        CMPI    #$0020, R3                      ; 59FA   037B 0020
        BNEQ    L_59F1                          ; 59FC   022C 000C

        SWAP    R1,     1                       ; 59FE   0041
        MVO@    R1,     R5                      ; 59FF   0269
        SWAP    R2,     1                       ; 5A00   0042
        MVO@    R2,     R5                      ; 5A01   026A
        PULR    R7                              ; 5A02   02B7

        PSHR    R5                              ; 5A03   0275
        MVII    #$019D, R4                      ; 5A04   02BC 019D
        MVII    #$0014, R0                      ; 5A06   02B8 0014

        JSR     R5,     L_6C66                  ; 5A08   0004 016C 0066

        MVII    #$0001, R0                      ; 5A0B   02B8 0001
        MVO     R0,     G_0188                  ; 5A0D   0240 0188
        MVII    #$0189, R4                      ; 5A0F   02BC 0189
L_5A11:
        MVI@    R4,     R1                      ; 5A11   02A1
        MVI@    R4,     R2                      ; 5A12   02A2
        TSTR    R1                              ; 5A13   0089
        BEQ     L_5A1D                          ; 5A14   0204 0007

        SUBI    #$0002, R4                      ; 5A16   033C 0002
        DECR    R1                              ; 5A18   0011
        MVO@    R1,     R4                      ; 5A19   0261
        BEQ     L_5A31                          ; 5A1A   0204 0015

        INCR    R4                              ; 5A1C   000C
L_5A1D:
        CMPI    #$019D, R4                      ; 5A1D   037C 019D
        BNEQ    L_5A11                          ; 5A1F   022C 000F

        CLRR    R0                              ; 5A21   01C0
        MVO     R0,     G_0188                  ; 5A22   0240 0188
L_5A24:
        MVI@    R4,     R0                      ; 5A24   02A0
        MVI@    R4,     R1                      ; 5A25   02A1
        TSTR    R0                              ; 5A26   0080
        BEQ     L_5A30                          ; 5A27   0204 0007

        PSHR    R4                              ; 5A29   0274

        JSR     R5,     L_6A44                  ; 5A2A   0004 0168 0244

        PULR    R4                              ; 5A2D   02B4
        B       L_5A24                          ; 5A2E   0220 000B
L_5A30:
        PULR    R7                              ; 5A30   02B7

L_5A31:
        INCR    R4                              ; 5A31   000C
        PSHR    R4                              ; 5A32   0274
        SDBD                                    ; 5A33   0001
        MVII    #$70A9, R4                      ; 5A34   02BC 00A9 0070
        ADDR    R2,     R4                      ; 5A37   00D4
        ADDR    R2,     R4                      ; 5A38   00D4
        SDBD                                    ; 5A39   0001
        MVII    #$6A3F, R5                      ; 5A3A   02BD 003F 006A
        SDBD                                    ; 5A3D   0001
        MVI@    R4,     R7                      ; 5A3E   02A7

        PULR    R4                              ; 5A3F   02B4
        B       L_5A1D                          ; 5A40   0220 0024

        MVI@    R5,     R0                      ; 5A42   02A8
        MVI@    R5,     R1                      ; 5A43   02A9
        PSHR    R5                              ; 5A44   0275
        MVII    #$0189, R4                      ; 5A45   02BC 0189
        MVII    #$0014, R5                      ; 5A47   02BD 0014
        MVI     G_0188, R2                      ; 5A49   0282 0188
        TSTR    R2                              ; 5A4B   0092
        BEQ     L_5A52                          ; 5A4C   0204 0004

        MVII    #$019D, R4                      ; 5A4E   02BC 019D
        MVII    #$0014, R5                      ; 5A50   02BD 0014
L_5A52:
        ADDR    R4,     R5                      ; 5A52   00E5
        ADDI    #$0014, R5                      ; 5A53   02FD 0014
L_5A55:
        MVI@    R4,     R2                      ; 5A55   02A2
        TSTR    R2                              ; 5A56   0092
        BEQ     L_5A60                          ; 5A57   0204 0007

        INCR    R4                              ; 5A59   000C
        CMPR    R5,     R4                      ; 5A5A   016C
        BNEQ    L_5A55                          ; 5A5B   022C 0007

        CLRR    R0                              ; 5A5D   01C0
        DECR    R0                              ; 5A5E   0010
        PULR    R7                              ; 5A5F   02B7

L_5A60:
        DECR    R4                              ; 5A60   0014
        MVO@    R0,     R4                      ; 5A61   0260
        MVO@    R1,     R4                      ; 5A62   0261
        PULR    R7                              ; 5A63   02B7

        MVI@    R5,     R1                      ; 5A64   02A9
        MVII    #$0189, R4                      ; 5A65   02BC 0189
        CLRR    R0                              ; 5A67   01C0
L_5A68:
        INCR    R4                              ; 5A68   000C
        CMP@    R4,     R1                      ; 5A69   0361
        BNEQ    L_5A70                          ; 5A6A   020C 0004

        SUBI    #$0002, R4                      ; 5A6C   033C 0002
        MVO@    R0,     R4                      ; 5A6E   0260
        MVO@    R0,     R4                      ; 5A6F   0260
L_5A70:
        CMPI    #$019D, R4                      ; 5A70   037C 019D
        BNEQ    L_5A68                          ; 5A72   022C 000B
        MOVR    R5,     R7                      ; 5A74   00AF

        MVII    #$0188, R4                      ; 5A75   02BC 0188
        MVII    #$0015, R0                      ; 5A77   02B8 0015
        J       L_6C66                          ; 5A79   0004 036C 0066

        MVII    #$0010, R4                      ; 5A7C   02BC 0010
L_5A7E:
        ADDR    R3,     R3                      ; 5A7E   00DB
        ADDR    R2,     R2                      ; 5A7F   00D2
        BNC     L_5A83                          ; 5A80   0209 0001

        INCR    R3                              ; 5A82   000B
L_5A83:
        CLRC                                    ; 5A83   0006
        INCR    R2                              ; 5A84   000A
        SUBR    R1,     R3                      ; 5A85   010B
        BPL     L_5A8B                          ; 5A86   0203 0003

        ADDR    R1,     R3                      ; 5A88   00CB
        SAR     R2,     1                       ; 5A89   006A
        SLL     R2,     1                       ; 5A8A   004A
L_5A8B:
        DECR    R4                              ; 5A8B   0014
        BNEQ    L_5A7E                          ; 5A8C   022C 000F
        MOVR    R5,     R7                      ; 5A8E   00AF

        PSHR    R1                              ; 5A8F   0271
        MVI     G_0348, R0                      ; 5A90   0280 0348
        MOVR    R0,     R1                      ; 5A92   0081
        SLL     R0,     2                       ; 5A93   004C
        SLL     R0,     2                       ; 5A94   004C
        ADDR    R1,     R0                      ; 5A95   00C8
        ADDI    #$0025, R0                      ; 5A96   02F8 0025
        MVO     R0,     G_0348                  ; 5A98   0240 0348
        ANDI    #$00FF, R0                      ; 5A9A   03B8 00FF
        PULR    R1                              ; 5A9C   02B1
        MOVR    R5,     R7                      ; 5A9D   00AF

        PSHR    R4                              ; 5A9E   0274
        CLRR    R0                              ; 5A9F   01C0
        MVO     R0,     G_01C6                  ; 5AA0   0240 01C6
        MVI@    R5,     R0                      ; 5AA2   02A8
        PSHR    R5                              ; 5AA3   0275
        MOVR    R0,     R1                      ; 5AA4   0081
        SLR     R1,     2                       ; 5AA5   0065
        SLR     R1,     1                       ; 5AA6   0061
        ANDI    #$0007, R0                      ; 5AA7   03B8 0007
        MVII    #$01C2, R4                      ; 5AA9   02BC 01C2
L_5AAB:
        MVI@    R4,     R2                      ; 5AAB   02A2
        MOVR    R2,     R3                      ; 5AAC   0093
        SLR     R3,     2                       ; 5AAD   0067
        SLR     R3,     1                       ; 5AAE   0063
        ANDR    R0,     R2                      ; 5AAF   0182
        BEQ     L_5AB8                          ; 5AB0   0204 0006

        CMP     G_01C6, R3                      ; 5AB2   0343 01C6
        BLE     L_5AB8                          ; 5AB4   0206 0002

        MVO     R3,     G_01C6                  ; 5AB6   0243 01C6
L_5AB8:
        CMPI    #$01C5, R4                      ; 5AB8   037C 01C5
        BLT     L_5AAB                          ; 5ABA   0225 0010

        CMP     G_01C6, R1                      ; 5ABC   0341 01C6
        BLT     L_5AE3                          ; 5ABE   0205 0023
        BGT     L_5AC5                          ; 5AC0   020E 0003

        RRC     R1,     1                       ; 5AC2   0071
        BNC     L_5AE3                          ; 5AC3   0209 001E

L_5AC5:
        MVII    #$01C2, R4                      ; 5AC5   02BC 01C2
        CLRR    R1                              ; 5AC7   01C9
L_5AC8:
        MVI@    R4,     R2                      ; 5AC8   02A2
        MOVR    R0,     R5                      ; 5AC9   0085
        ANDR    R2,     R5                      ; 5ACA   0195
        BEQ     L_5AD0                          ; 5ACB   0204 0003

        JSR     R5,     L_6AFB                  ; 5ACD   0004 0168 02FB

L_5AD0:
        INCR    R1                              ; 5AD0   0009
        CMPI    #$01C5, R4                      ; 5AD1   037C 01C5
        BLT     L_5AC8                          ; 5AD3   0225 000C

        MVII    #$01C2, R4                      ; 5AD5   02BC 01C2
        MVI@    R4,     R2                      ; 5AD7   02A2
        TSTR    R2                              ; 5AD8   0092
        BEQ     L_5AE7                          ; 5AD9   0204 000C

        MVI@    R4,     R2                      ; 5ADB   02A2
        TSTR    R2                              ; 5ADC   0092
        BEQ     L_5AE7                          ; 5ADD   0204 0008

        MVI@    R4,     R2                      ; 5ADF   02A2
        TSTR    R2                              ; 5AE0   0092
        BEQ     L_5AE7                          ; 5AE1   0204 0004

L_5AE3:
        CLRR    R0                              ; 5AE3   01C0
        COMR    R0                              ; 5AE4   0018
        DECR    R6                              ; 5AE5   0016
        PULR    R7                              ; 5AE6   02B7

L_5AE7:
        DECR    R4                              ; 5AE7   0014
        PULR    R5                              ; 5AE8   02B5
        DECR    R5                              ; 5AE9   0015
        MVI@    R5,     R0                      ; 5AEA   02A8
        MVO@    R0,     R4                      ; 5AEB   0260
        DECR    R4                              ; 5AEC   0014
        SUBI    #$01C2, R4                      ; 5AED   033C 01C2
        MOVR    R4,     R0                      ; 5AEF   00A0
        MOVR    R4,     R3                      ; 5AF0   00A3
        SLL     R3,     1                       ; 5AF1   004B
        ADDR    R3,     R4                      ; 5AF2   00DC
        ADDI    #$01B1, R4                      ; 5AF3   02FC 01B1
        INCR    R4                              ; 5AF5   000C
        MOVR    R5,     R1                      ; 5AF6   00A9
        MVO@    R1,     R4                      ; 5AF7   0261
        SWAP    R1,     1                       ; 5AF8   0041
        MVO@    R1,     R4                      ; 5AF9   0261
        PULR    R7                              ; 5AFA   02B7

        PSHR    R5                              ; 5AFB   0275
        PSHR    R1                              ; 5AFC   0271
        ADDI    #$01C2, R1                      ; 5AFD   02F9 01C2
        PSHR    R1                              ; 5AFF   0271
        MVI@    R1,     R2                      ; 5B00   028A
        ANDI    #$0007, R2                      ; 5B01   03BA 0007
        MOVR    R2,     R5                      ; 5B03   0095
        SLL     R2,     2                       ; 5B04   004E
        SLL     R2,     1                       ; 5B05   004A
        XORR    R5,     R2                      ; 5B06   01EA
        MOVR    R2,     R5                      ; 5B07   0095
        MVI     .PSG0.chan_enable,R3            ; 5B08   0283 01F8
        COMR    R5                              ; 5B0A   001D
        ANDR    R5,     R3                      ; 5B0B   01AB
        XORR    R2,     R3                      ; 5B0C   01D3
        MVO     R3,     .PSG0.chan_enable       ; 5B0D   0243 01F8
        CLRR    R1                              ; 5B0F   01C9
        MVII    #$01FB, R3                      ; 5B10   02BB 01FB
        RRC     R2,     1                       ; 5B12   0072
        BNC     L_5B16                          ; 5B13   0209 0001

        MVO@    R1,     R3                      ; 5B15   0259
L_5B16:
        INCR    R3                              ; 5B16   000B
        RRC     R2,     1                       ; 5B17   0072
        BNC     L_5B1B                          ; 5B18   0209 0001

        MVO@    R1,     R3                      ; 5B1A   0259
L_5B1B:
        INCR    R3                              ; 5B1B   000B
        RRC     R2,     1                       ; 5B1C   0072
        BNC     L_5B20                          ; 5B1D   0209 0001

        MVO@    R1,     R3                      ; 5B1F   0259
L_5B20:
        PULR    R5                              ; 5B20   02B5
        MVO@    R1,     R5                      ; 5B21   0269
        PULR    R5                              ; 5B22   02B5
        PSHR    R5                              ; 5B23   0275
        MOVR    R5,     R3                      ; 5B24   00AB
        SLL     R3,     1                       ; 5B25   004B
        ADDR    R3,     R5                      ; 5B26   00DD
        ADDI    #$01B1, R5                      ; 5B27   02FD 01B1
        MVO@    R1,     R5                      ; 5B29   0269
        MVO@    R1,     R5                      ; 5B2A   0269
        MVO@    R1,     R5                      ; 5B2B   0269
        PULR    R1                              ; 5B2C   02B1
        PULR    R7                              ; 5B2D   02B7

        PSHR    R5                              ; 5B2E   0275
        MVII    #$00FF, R0                      ; 5B2F   02B8 00FF
        MVO     R0,     G_01C5                  ; 5B31   0240 01C5
        MVII    #$01B1, R4                      ; 5B33   02BC 01B1
L_5B35:
        CMPI    #$01B8, R4                      ; 5B35   037C 01B8
        BLT     L_5B3A                          ; 5B37   0205 0001
        PULR    R7                              ; 5B39   02B7

L_5B3A:
        MVI     G_01C5, R0                      ; 5B3A   0280 01C5
        INCR    R0                              ; 5B3C   0008
        MVO     R0,     G_01C5                  ; 5B3D   0240 01C5
        MVI@    R4,     R0                      ; 5B3F   02A0
        TSTR    R0                              ; 5B40   0080
        BLE     L_5B4A                          ; 5B41   0206 0007

        DECR    R0                              ; 5B43   0010
        DECR    R4                              ; 5B44   0014
        MVO@    R0,     R4                      ; 5B45   0260
        ADDI    #$0002, R4                      ; 5B46   02FC 0002
        B       L_5B35                          ; 5B48   0220 0014

L_5B4A:
        SDBD                                    ; 5B4A   0001
        MVI@    R4,     R5                      ; 5B4B   02A5
        TSTR    R5                              ; 5B4C   00AD
        BEQ     L_5B35                          ; 5B4D   0224 0019

L_5B4F:
        SDBD                                    ; 5B4F   0001
        DECLE   $02A9,  $008B,  $0065,  $0065   ; 5B50   02A9 008B 0065 0065
        DECLE   $008A,  $03BB,  $000F,  $0001   ; 5B54   008A 03BB 000F 0001

        ADDI    #$0061, R3                      ; 5B58   02FB 0061
        SAR     R3,     1                       ; 5B5A   006B
        MVI@    R3,     R3                      ; 5B5B   029B
        SDBD                                    ; 5B5C   0001
        ADDI    #$6B6D, R3                      ; 5B5D   02FB 006D 006B
        MOVR    R3,     R7                      ; 5B60   009F

        DECLE   $0000                           ; 5B61   0000

        ADCR    R4                              ; 5B62   002C
        GSWD    R2                              ; 5B63   0032
        RSWD    R3                              ; 5B64   003B
        RLC     R3,     1                       ; 5B65   0053
        SAR     R1,     2                       ; 5B66   006D
        SARC    R3,     1                       ; 5B67   007B
        MOVR    R0,     R6                      ; 5B68   0086
        MOVR    R1,     R5                      ; 5B69   008D
        MOVR    R2,     R5                      ; 5B6A   0095
        MOVR    R6,     R5                      ; 5B6B   00B5
        ADDR    R0,     R5                      ; 5B6C   00C5
        ANDI    #$0003, R2                      ; 5B6D   03BA 0003
        MOVR    R2,     R3                      ; 5B6F   0093
        ADDI    #$01FB, R2                      ; 5B70   02FA 01FB
        SLR     R1,     2                       ; 5B72   0065
        MOVR    R1,     R0                      ; 5B73   0088
        ANDI    #$0007, R0                      ; 5B74   03B8 0007
        ADDI    #$0007, R0                      ; 5B76   02F8 0007
        MVO@    R0,     R2                      ; 5B78   0250
        SLR     R1,     2                       ; 5B79   0065
        SLR     R1,     1                       ; 5B7A   0061
        MOVR    R1,     R0                      ; 5B7B   0088
        ANDI    #$0007, R0                      ; 5B7C   03B8 0007
        SLR     R1,     2                       ; 5B7E   0065
        SLR     R1,     1                       ; 5B7F   0061
        SLL     R1,     1                       ; 5B80   0049
        MOVR    R4,     R2                      ; 5B81   00A2
        MOVR    R1,     R4                      ; 5B82   008C
        SDBD                                    ; 5B83   0001
        ADDI    #$6C4E, R4                      ; 5B84   02FC 004E 006C
        SDBD                                    ; 5B87   0001
        MVI@    R4,     R1                      ; 5B88   02A1
        MOVR    R2,     R4                      ; 5B89   0094
L_5B8A:
        DECR    R0                              ; 5B8A   0010
        BLT     L_5B90                          ; 5B8B   0205 0003

        SLR     R1,     1                       ; 5B8D   0061
        B       L_5B8A                          ; 5B8E   0220 0005

L_5B90:
        ADDI    #$01F0, R3                      ; 5B90   02FB 01F0
        MVO@    R1,     R3                      ; 5B92   0259
        SWAP    R1,     1                       ; 5B93   0041
        ADDI    #$0004, R3                      ; 5B94   02FB 0004
        MVO@    R1,     R3                      ; 5B96   0259
        B       L_5B4F                          ; 5B97   0220 0049

        ADDI    #$01FB, R1                      ; 5B99   02F9 01FB
        CLRR    R0                              ; 5B9B   01C0
        MVO@    R0,     R1                      ; 5B9C   0248
        B       L_5B4F                          ; 5B9D   0220 004F

        SUBI    #$0003, R4                      ; 5B9F   033C 0003
        MVO@    R1,     R4                      ; 5BA1   0261
        MOVR    R5,     R0                      ; 5BA2   00A8
        MVO@    R0,     R4                      ; 5BA3   0260
        SWAP    R0,     1                       ; 5BA4   0040
        MVO@    R0,     R4                      ; 5BA5   0260
        B       L_5B35                          ; 5BA6   0220 0072

        ANDI    #$0007, R2                      ; 5BA8   03BA 0007
        ADDI    #$01F3, R2                      ; 5BAA   02FA 01F3
        SLR     R1,     2                       ; 5BAC   0065
        SLR     R1,     1                       ; 5BAD   0061
        CLRC                                    ; 5BAE   0006
        RRC     R1,     1                       ; 5BAF   0071
        BNC     L_5BBD                          ; 5BB0   0209 000B

        MOVR    R1,     R3                      ; 5BB2   008B
        CMPI    #$01F8, R2                      ; 5BB3   037A 01F8
        BNEQ    L_5BBA                          ; 5BB5   020C 0003

        AND@    R2,     R1                      ; 5BB7   0391
        B       L_5BBD                          ; 5BB8   0200 0003

L_5BBA:
        COMR    R1                              ; 5BBA   0019
        AND@    R2,     R1                      ; 5BBB   0391
        XORR    R3,     R1                      ; 5BBC   01D9
L_5BBD:
        MVO@    R1,     R2                      ; 5BBD   0251
        B       L_5B4F                          ; 5BBE   0220 0070

        MOVR    R2,     R3                      ; 5BC0   0093
        SLR     R2,     2                       ; 5BC1   0066
        MOVR    R2,     R1                      ; 5BC2   0091
        SLR     R1,     2                       ; 5BC3   0065
        SLR     R1,     1                       ; 5BC4   0061
        ANDI    #$0007, R2                      ; 5BC5   03BA 0007
        ADDI    #$01BA, R2                      ; 5BC7   02FA 01BA
        ANDI    #$0003, R3                      ; 5BC9   03BB 0003
        BEQ     L_5BD7                          ; 5BCB   0204 000A

        CMPI    #$0001, R3                      ; 5BCD   037B 0001
        BGT     L_5BD4                          ; 5BCF   020E 0003

        ADD@    R2,     R1                      ; 5BD1   02D1
        B       L_5BD7                          ; 5BD2   0200 0003

L_5BD4:
        MVI@    R2,     R0                      ; 5BD4   0290
        SUBR    R1,     R0                      ; 5BD5   0108
        MOVR    R0,     R1                      ; 5BD6   0081
L_5BD7:
        MVO@    R1,     R2                      ; 5BD7   0251
        B       L_5B4F                          ; 5BD8   0220 008A

        SLR     R1,     2                       ; 5BDA   0065
        ANDI    #$0003, R2                      ; 5BDB   03BA 0003
        ADDI    #$01BA, R2                      ; 5BDD   02FA 01BA
        MVI@    R2,     R0                      ; 5BDF   0290
        DECR    R0                              ; 5BE0   0010
        BNEQ    L_5BE6                          ; 5BE1   020C 0003

        MVO@    R0,     R2                      ; 5BE3   0250
        B       L_5B4F                          ; 5BE4   0220 0096

L_5BE6:
        MVO@    R0,     R2                      ; 5BE6   0250
        MOVR    R1,     R2                      ; 5BE7   008A
        SWAP    R2,     1                       ; 5BE8   0042
        RRC     R2,     2                       ; 5BE9   0076
        BNOV    L_5BF0                          ; 5BEA   020A 0004

        SDBD                                    ; 5BEC   0001
        XORI    #$FC00, R1                      ; 5BED   03F9 0000 00FC
L_5BF0:
        ADDR    R1,     R5                      ; 5BF0   00CD
        B       L_5B4F                          ; 5BF1   0220 00A3

        MVI     G_01C5, R1                      ; 5BF3   0281 01C5

        JSR     R5,     L_6AFB                  ; 5BF5   0004 0168 02FB

        B       L_5B35                          ; 5BF8   0220 00C4

        ANDI    #$0003, R2                      ; 5BFA   03BA 0003
        ADDI    #$01FB, R2                      ; 5BFC   02FA 01FB
        SLR     R1,     2                       ; 5BFE   0065
        MVO@    R1,     R2                      ; 5BFF   0251
        B       L_5B4F                          ; 5C00   0220 00B2

        SDBD                                    ; 5C02   0001
        MVI@    R5,     R0                      ; 5C03   02A8
        CLRC                                    ; 5C04   0006
        RRC     R0,     1                       ; 5C05   0070
        BNC     L_5C0D                          ; 5C06   0209 0005

        MOVR    R0,     R1                      ; 5C08   0081
        ADDI    #$01F0, R1                      ; 5C09   02F9 01F0
        B       L_5C1B                          ; 5C0B   0200 000E

L_5C0D:
        MOVR    R0,     R1                      ; 5C0D   0081
        ANDI    #$000F, R0                      ; 5C0E   03B8 000F
        SLR     R1,     2                       ; 5C10   0065
        SLR     R1,     2                       ; 5C11   0065
        ADDI    #$01FB, R1                      ; 5C12   02F9 01FB
        MVI@    R1,     R3                      ; 5C14   028B
        ANDI    #$0030, R3                      ; 5C15   03BB 0030
        XORR    R3,     R0                      ; 5C17   01D8
        MVO@    R0,     R1                      ; 5C18   0248
        SUBI    #$000B, R1                      ; 5C19   0339 000B
L_5C1B:
        MVO@    R2,     R1                      ; 5C1B   024A
        ADDI    #$0004, R1                      ; 5C1C   02F9 0004
        SWAP    R2,     1                       ; 5C1E   0042
        MVO@    R2,     R1                      ; 5C1F   024A
        B       L_5B4F                          ; 5C20   0220 00D2

        SDBD                                    ; 5C22   0001
        MVI@    R5,     R2                      ; 5C23   02AA
        MOVR    R1,     R0                      ; 5C24   0088
        SLR     R0,     2                       ; 5C25   0064
        MOVR    R5,     R3                      ; 5C26   00AB
        MOVR    R2,     R5                      ; 5C27   0095
        SDBD                                    ; 5C28   0001
        MVI@    R5,     R2                      ; 5C29   02AA
        MOVR    R3,     R5                      ; 5C2A   009D
        ANDI    #$0003, R1                      ; 5C2B   03B9 0003
        ADDI    #$01BA, R1                      ; 5C2D   02F9 01BA
        ADD@    R1,     R2                      ; 5C2F   02CA
        B       L_5C0D                          ; 5C30   0220 0024

        SDBD                                    ; 5C32   0001
        MVI@    R5,     R3                      ; 5C33   02AB
        SLR     R1,     2                       ; 5C34   0065
        ANDI    #$0003, R2                      ; 5C35   03BA 0003
        BEQ     L_5C48                          ; 5C37   0204 000F

        MOVR    R5,     R0                      ; 5C39   00A8
        MOVR    R3,     R5                      ; 5C3A   009D
        CMPI    #$0001, R2                      ; 5C3B   037A 0001
        BGT     L_5C43                          ; 5C3D   020E 0004

        SDBD                                    ; 5C3F   0001
        ADD@    R5,     R1                      ; 5C40   02E9
        B       L_5C47                          ; 5C41   0200 0004

L_5C43:
        SDBD                                    ; 5C43   0001
        MVI@    R5,     R2                      ; 5C44   02AA
        SUBR    R1,     R2                      ; 5C45   010A
        MOVR    R2,     R1                      ; 5C46   0091
L_5C47:
        MOVR    R0,     R5                      ; 5C47   0085
L_5C48:
        MVO@    R1,     R3                      ; 5C48   0259
        SWAP    R1,     1                       ; 5C49   0041
        INCR    R3                              ; 5C4A   000B
        MVO@    R1,     R3                      ; 5C4B   0259
        B       L_5B4F                          ; 5C4C   0220 00FE

        SLLC    R1,     2                       ; 5C4E   005D
        INCR    R5                              ; 5C4F   000D
        MOVR    R3,     R4                      ; 5C50   009C
        INCR    R4                              ; 5C51   000C
        ADDR    R4,     R7                      ; 5C52   00E7

        INCR    R3                              ; 5C53   000B
        RSWD    R4                              ; 5C54   003C
        INCR    R3                              ; 5C55   000B
        TSTR    R3                              ; 5C56   009B
        INCR    R2                              ; 5C57   000A
        EIS                                     ; 5C58   0002
        INCR    R2                              ; 5C59   000A
        RRC     R3,     1                       ; 5C5A   0073
        INCR    R1                              ; 5C5B   0009
        ADDR    R5,     R3                      ; 5C5C   00EB
        INCR    R0                              ; 5C5D   0008
        SAR     R3,     1                       ; 5C5E   006B
        INCR    R0                              ; 5C5F   0008
        ADDR    R6,     R2                      ; 5C60   00F2
        SETC                                    ; 5C61   0007
        TSTR    R0                              ; 5C62   0080
        SETC                                    ; 5C63   0007
        DECR    R4                              ; 5C64   0014
        SETC                                    ; 5C65   0007
        CLRR    R1                              ; 5C66   01C9
L_5C67:
        DECR    R0                              ; 5C67   0010
        BMI     L_5C6D                          ; 5C68   020B 0003

        MVO@    R1,     R4                      ; 5C6A   0261
        B       L_5C67                          ; 5C6B   0220 0005
L_5C6D:
        MOVR    R5,     R7                      ; 5C6D   00AF

        PSHR    R5                              ; 5C6E   0275
        MVI     G_034A, R0                      ; 5C6F   0280 034A
        DECR    R0                              ; 5C71   0010
        BMI     L_5C7A                          ; 5C72   020B 0006

        MVO     R0,     G_034A                  ; 5C74   0240 034A
        BNEQ    L_5C7A                          ; 5C76   020C 0002
        MVI     G_0349, R7                      ; 5C78   0287 0349
L_5C7A:
        PULR    R7                              ; 5C7A   02B7

        MVI@    R5,     R0                      ; 5C7B   02A8
        MVO     R5,     G_0349                  ; 5C7C   0245 0349
        MVO     R0,     G_034A                  ; 5C7E   0240 034A
        PULR    R7                              ; 5C80   02B7

        MVI@    R5,     R0                      ; 5C81   02A8
        PSHR    R5                              ; 5C82   0275
        MVO     R0,     G_034B                  ; 5C83   0240 034B
        SDBD                                    ; 5C85   0001
        MVII    #$6D95, R0                      ; 5C86   02B8 0095 006D
        MVO     R0,     .ISRVEC.0               ; 5C89   0240 0100
        SWAP    R0,     1                       ; 5C8B   0040
        MVO     R0,     .ISRVEC.1               ; 5C8C   0240 0101
        MVII    #$0003, R0                      ; 5C8E   02B8 0003
        MVO     R0,     G_01C9                  ; 5C90   0240 01C9
L_5C92:
        EIS                                     ; 5C92   0002

        JSR     R5,     L_6A8F                  ; 5C93   0004 0168 028F

        MVI     G_01C9, R0                      ; 5C96   0280 01C9
        CMPI    #$0001, R0                      ; 5C98   0378 0001
        BNEQ    L_5C92                          ; 5C9A   022C 0009

        DIS                                     ; 5C9C   0003
        MVO     R0,     G_01C7                  ; 5C9D   0240 01C7
        MVII    #$0318, R4                      ; 5C9F   02BC 0318
        MVII    #$0018, R0                      ; 5CA1   02B8 0018

        JSR     R5,     L_6C66                  ; 5CA3   0004 016C 0066

        MVII    #$00F0, R0                      ; 5CA6   02B8 00F0
        MVII    #$0200, R4                      ; 5CA8   02BC 0200

        JSR     R5,     L_6C66                  ; 5CAA   0004 016C 0066

        SDBD                                    ; 5CAD   0001
        MVII    #$6F2E, R5                      ; 5CAE   02BD 002E 006F
        MVI@    R5,     R4                      ; 5CB1   02AC
L_5CB2:
        SDBD                                    ; 5CB2   0001
        MVI@    R5,     R0                      ; 5CB3   02A8
        TSTR    R0                              ; 5CB4   0080
        BEQ     L_5CBA                          ; 5CB5   0204 0003

        MVO@    R0,     R4                      ; 5CB7   0260
        B       L_5CB2                          ; 5CB8   0220 0007

L_5CBA:
        MVI@    R5,     R4                      ; 5CBA   02AC
        DECLE   $00A4,  $022C,  $000B,  $02BC   ; 5CBB   00A4 022C 000B 02BC
        DECLE   $0318,  $02B8,  $0018,  $0004   ; 5CBF   0318 02B8 0018 0004
        DECLE   $0170,  $02F6,  $0038,  $0003   ; 5CC3   0170 02F6 0038 0003
        DECLE   $0040,  $0003,  $0048,  $0003   ; 5CC7   0040 0003 0048 0003
        DECLE   $0048,  $0003,  $0068,  $0003   ; 5CCB   0048 0003 0068 0003
        DECLE   $0060,  $0003,  $0058,  $0003   ; 5CCF   0060 0003 0058 0003
        DECLE   $0058,  $0003,  $00A0,  $0001   ; 5CD3   0058 0003 00A0 0001
        DECLE   $00A0,  $0001,  $0098,  $0001   ; 5CD7   00A0 0001 0098 0001
        DECLE   $0088,  $0001,  $00A0,  $0005   ; 5CDB   0088 0001 00A0 0005
        DECLE   $00A0,  $0005,  $0098,  $0005   ; 5CDF   00A0 0005 0098 0005
        DECLE   $0088,  $0005,  $00E0,  $0008   ; 5CE3   0088 0005 00E0 0008
        DECLE   $00F0,  $0008,  $0000,  $0009   ; 5CE7   00F0 0008 0000 0009
        DECLE   $0010,  $0009,  $00E0,  $0008   ; 5CEB   0010 0009 00E0 0008
        DECLE   $00F0,  $0008,  $0000           ; 5CEF   00F0 0008 0000

        INCR    R1                              ; 5CF2   0009
        DECR    R0                              ; 5CF3   0010
        INCR    R1                              ; 5CF4   0009
        CLRR    R0                              ; 5CF5   01C0
        MVO     R0,     G_01C8                  ; 5CF6   0240 01C8
L_5CF8:
        EIS                                     ; 5CF8   0002

        JSR     R5,     L_6A8F                  ; 5CF9   0004 0168 028F
        DECLE   $0280,  $01C9,  $0002,  $0378   ; 5CFC   0280 01C9 0002 0378
        DECLE   $0001,  $022C,  $0009,  $01C0   ; 5D00   0001 022C 0009 01C0
        DECLE   $0240,  $01C9,  $0004           ; 5D04   0240 01C9 0004

        CMPR    R6,     R0                      ; 5D07   0170
        MVII    #$0280, R6                      ; 5D08   02BE 0280
        CMP@    R1,     R3                      ; 5D0A   034B
        DECR    R0                              ; 5D0B   0010
        BMI     L_5D13                          ; 5D0C   020B 0005

        MVO     R0,     G_034B                  ; 5D0E   0240 034B
        BNEQ    L_5D13                          ; 5D10   020C 0001
        PULR    R7                              ; 5D12   02B7

L_5D13:
        MVI     G_0172, R0                      ; 5D13   0280 0172
        XOR     G_0175, R0                      ; 5D15   03C0 0175
        BNEQ    L_5D1F                          ; 5D17   020C 0006

        MVI     G_0173, R0                      ; 5D19   0280 0173
        XOR     G_0176, R0                      ; 5D1B   03C0 0176
        BEQ     L_5CF8                          ; 5D1D   0224 0026
L_5D1F:
        PULR    R7                              ; 5D1F   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D20   0000 0000 0000 0000
        DECLE   $0001                           ; 5D24   0001

        PSHR    R5                              ; 5D25   0275
        MVI     G_01C7, R0                      ; 5D26   0280 01C7
        TSTR    R0                              ; 5D28   0080
        BEQ     L_5D58                          ; 5D29   0204 002D

        CLRR    R0                              ; 5D2B   01C0
        MVO     R0,     G_01C7                  ; 5D2C   0240 01C7
        SDBD                                    ; 5D2E   0001
        MVII    #$6D59, R5                      ; 5D2F   02BD 0059 006D
        MVI     G_01C8, R4                      ; 5D32   0284 01C8
        DECR    R4                              ; 5D34   0014
        BPL     L_5D39                          ; 5D35   0203 0002

        MVII    #$0005, R4                      ; 5D37   02BC 0005
L_5D39:
        MVO     R4,     G_01C8                  ; 5D39   0244 01C8
        ADDR    R4,     R4                      ; 5D3B   00E4
        SDBD                                    ; 5D3C   0001
        ADDI    #$6D7D, R4                      ; 5D3D   02FC 007D 006D
L_5D40:
        SDBD                                    ; 5D40   0001
        MVI@    R5,     R1                      ; 5D41   02A9
        SDBD                                    ; 5D42   0001
        MVI@    R4,     R2                      ; 5D43   02A2
L_5D44:
        MVI@    R1,     R3                      ; 5D44   028B
        TSTR    R3                              ; 5D45   009B
        BEQ     L_5D52                          ; 5D46   0204 000A

        MVI@    R3,     R0                      ; 5D48   0298
        SDBD                                    ; 5D49   0001
        ANDI    #$09F8, R0                      ; 5D4A   03B8 00F8 0009
        XORR    R2,     R0                      ; 5D4D   01D0
        MVO@    R0,     R3                      ; 5D4E   0258
        INCR    R1                              ; 5D4F   0009
        B       L_5D44                          ; 5D50   0220 000D

L_5D52:
        SDBD                                    ; 5D52   0001
        CMPI    #$6D63, R5                      ; 5D53   037D 0063 006D
        BNEQ    L_5D40                          ; 5D56   022C 0017
L_5D58:
        PULR    R7                              ; 5D58   02B7

        DECLE   $0063,  $006D,  $0067,  $006D   ; 5D59   0063 006D 0067 006D
        DECLE   $006B,  $006D,  $006F,  $006D   ; 5D5D   006B 006D 006F 006D
        DECLE   $0077,  $006D,  $0208,  $0209   ; 5D61   0077 006D 0208 0209
        DECLE   $020A,  $0000,  $021C,  $021D   ; 5D65   020A 0000 021C 021D
        DECLE   $021E,  $0000,  $0230,  $0231   ; 5D69   021E 0000 0230 0231
        DECLE   $0232,  $0000,  $0242,  $0243   ; 5D6D   0232 0000 0242 0243
        DECLE   $0244,  $0245,  $0246,  $0247   ; 5D71   0244 0245 0246 0247
        DECLE   $0248,  $0000,  $0256,  $0257   ; 5D75   0248 0000 0256 0257
        DECLE   $0259,  $025B,  $025C,  $0000   ; 5D79   0259 025B 025C 0000
        DECLE   $0001,  $0004,  $0004,  $0002   ; 5D7D   0001 0004 0004 0002
        DECLE   $0005,  $0020,  $0006,  $0022   ; 5D81   0005 0020 0006 0022
        DECLE   $0003,  $0024,  $0002,  $0006   ; 5D85   0003 0024 0002 0006
        DECLE   $0001,  $0004,  $0004,  $0002   ; 5D89   0001 0004 0004 0002
        DECLE   $0005                           ; 5D8D   0005

        NEGR    R0                              ; 5D8E   0020
        CLRC                                    ; 5D8F   0006
        NEGR    R2                              ; 5D90   0022
        DIS                                     ; 5D91   0003
        NEGR    R4                              ; 5D92   0024
        EIS                                     ; 5D93   0002
        CLRC                                    ; 5D94   0006
        PSHR    R5                              ; 5D95   0275
        MVI     G_01C9, R0                      ; 5D96   0280 01C9
        SLL     R0,     1                       ; 5D98   0048
        ADDR    R0,     R7                      ; 5D99   00C7
        B       L_5DA2                          ; 5D9A   0200 0006
        B       L_5DB1                          ; 5D9C   0200 0013
        B       L_5DB1                          ; 5D9E   0200 0011
        B       L_5DBA                          ; 5DA0   0200 0018

L_5DA2:
        MVI     G_0125, R0                      ; 5DA2   0280 0125
        DECLE   $0080,  $020C,  $000A,  $0004   ; 5DA4   0080 020C 000A 0004
        DECLE   $0174,  $001F                   ; 5DA8   0174 001F

        JSR     R5,     L_6DCB                  ; 5DAA   0004 016C 01CB

L_5DAD:
        MVII    #$0001, R0                      ; 5DAD   02B8 0001
        MVO     R0,     G_01C9                  ; 5DAF   0240 01C9
L_5DB1:
        MVO     R0,     .STIC.VIDEN             ; 5DB1   0240 0020

        JSR     R5,     L_6D25                  ; 5DB3   0004 016C 0125
        JSR     R5,     L_6881                  ; 5DB6   0004 0168 0081

        PULR    R7                              ; 5DB9   02B7

L_5DBA:
        DIS                                     ; 5DBA   0003
        DECLE   $0001,  $02BC,  $0020,  $006D   ; 5DBB   0001 02BC 0020 006D
        DECLE   $0004,  $0174,  $0054,  $0001   ; 5DBF   0004 0174 0054 0001
        DECLE   $02B9,  $00F5,  $006D,  $0004   ; 5DC3   02B9 00F5 006D 0004

        CMPR    R6,     R4                      ; 5DC7   0174
        MOVR    R0,     R4                      ; 5DC8   0084
        B       L_5DAD                          ; 5DC9   0220 001D

        PSHR    R5                              ; 5DCB   0275
        MVI     G_01CB, R0                      ; 5DCC   0280 01CB
        INCR    R0                              ; 5DCE   0008
        MVO     R0,     G_01CB                  ; 5DCF   0240 01CB
        ANDI    #$0001, R0                      ; 5DD1   03B8 0001
        BNEQ    L_5DE4                          ; 5DD3   020C 000F

        MVI     G_01CA, R1                      ; 5DD5   0281 01CA
        INCR    R1                              ; 5DD7   0009
        ANDI    #$0007, R1                      ; 5DD8   03B9 0007
        MVO     R1,     G_01CA                  ; 5DDA   0241 01CA
        BEQ     L_5DE5                          ; 5DDC   0204 0007

        SDBD                                    ; 5DDE   0001
        ADDI    #$38D7, R1                      ; 5DDF   02F9 00D7 0038
        CLRR    R0                              ; 5DE2   01C0
        MVO@    R0,     R1                      ; 5DE3   0248
L_5DE4:
        PULR    R7                              ; 5DE4   02B7

L_5DE5:
        MVII    #$00FF, R0                      ; 5DE5   02B8 00FF
        SDBD                                    ; 5DE7   0001
        MVII    #$38D8, R5                      ; 5DE8   02BD 00D8 0038
        MVO@    R0,     R5                      ; 5DEB   0268
        MVO@    R0,     R5                      ; 5DEC   0268
        MVO@    R0,     R5                      ; 5DED   0268
        MVO@    R0,     R5                      ; 5DEE   0268
        MVO@    R0,     R5                      ; 5DEF   0268
        MVO@    R0,     R5                      ; 5DF0   0268
        MVO@    R0,     R5                      ; 5DF1   0268
        MVO     R0,     G_01C7                  ; 5DF2   0240 01C7
        PULR    R7                              ; 5DF4   02B7

        DECLE   $0027,  $00FF,  $00FF,  $00FF   ; 5DF5   0027 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DF9   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DFD   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00CF,  $00FF   ; 5E01   00FF 00FF 00CF 00FF
        DECLE   $0087,  $00FF,  $00FF,  $00FF   ; 5E05   0087 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00C0,  $00FF   ; 5E09   00FF 00FF 00C0 00FF
        DECLE   $00C0,  $00FF,  $00FF,  $00FF   ; 5E0D   00C0 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $00FF   ; 5E11   00FF 00FF 0000 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 5E15   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00FF   ; 5E19   00FF 00FF 00FC 00FF
        DECLE   $00F8,  $00FF,  $00FF,  $00FF   ; 5E1D   00F8 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E21   00FF 00FF 00FF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5E25   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00FF   ; 5E29   00FF 00FF 00FC 00FF
        DECLE   $00F0,  $00FF,  $00FF,  $00FF   ; 5E2D   00F0 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0003,  $00FF   ; 5E31   00FF 00FF 0003 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 5E35   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00E1,  $00FF   ; 5E39   00FF 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00FF,  $00FF   ; 5E3D   00E1 00FF 00FF 00FF
        DECLE   $00FE,  $00FF,  $00FC,  $00FF   ; 5E41   00FE 00FF 00FC 00FF
        DECLE   $00F8,  $00FF,  $0003,  $00FF   ; 5E45   00F8 00FF 0003 00FF
        DECLE   $0001,  $00FF,  $0030,  $00FF   ; 5E49   0001 00FF 0030 00FF
        DECLE   $0078,  $00FF,  $00FE,  $00FF   ; 5E4D   0078 00FF 00FE 00FF
        DECLE   $00FE,  $00FF,  $00FE,  $00FF   ; 5E51   00FE 00FF 00FE 00FF
        DECLE   $007E,  $00FF,  $001F,  $00FF   ; 5E55   007E 00FF 001F 00FF
        DECLE   $001F,  $00FF,  $001F,  $00FF   ; 5E59   001F 00FF 001F 00FF
        DECLE   $001F,  $00FF,  $00F0,  $00FF   ; 5E5D   001F 00FF 00F0 00FF
        DECLE   $00E0,  $00FF,  $00C3,  $00FF   ; 5E61   00E0 00FF 00C3 00FF
        DECLE   $0087,  $00FF,  $003F,  $00FF   ; 5E65   0087 00FF 003F 00FF
        DECLE   $001F,  $00FF,  $000F,  $00FF   ; 5E69   001F 00FF 000F 00FF
        DECLE   $0087,  $00FF,  $00E1,  $00FF   ; 5E6D   0087 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00E1,  $00FF   ; 5E71   00E1 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00F8,  $00FF   ; 5E75   00E1 00FF 00F8 00FF
        DECLE   $00F8,  $00FF,  $00E1,  $00FF   ; 5E79   00F8 00FF 00E1 00FF
        DECLE   $0087,  $00FF,  $0061,  $00FF   ; 5E7D   0087 00FF 0061 00FF
        DECLE   $0061,  $00FF,  $00E1,  $00FF   ; 5E81   0061 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00F0,  $00FF   ; 5E85   00E1 00FF 00F0 00FF
        DECLE   $00E0,  $00FF,  $00C3,  $00FF   ; 5E89   00E0 00FF 00C3 00FF
        DECLE   $0087,  $00FF,  $0000,  $00FF   ; 5E8D   0087 00FF 0000 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 5E91   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003E,  $00FF   ; 5E95   00FF 00FF 003E 00FF
        DECLE   $001E,  $00FF,  $000E,  $00FF   ; 5E99   001E 00FF 000E 00FF
        DECLE   $0086,  $00FF,  $001F,  $00FF   ; 5E9D   0086 00FF 001F 00FF
        DECLE   $001E,  $00FF,  $001C,  $00FF   ; 5EA1   001E 00FF 001C 00FF
        DECLE   $0018,  $00FF,  $0000,  $00FF   ; 5EA5   0018 00FF 0000 00FF
        DECLE   $0000,  $00FF,  $003F,  $00FF   ; 5EA9   0000 00FF 003F 00FF
        DECLE   $007F,  $00FF,  $0003,  $00FF   ; 5EAD   007F 00FF 0003 00FF
        DECLE   $0001,  $00FF,  $00F0,  $00FF   ; 5EB1   0001 00FF 00F0 00FF
        DECLE   $00F8,  $00FF,  $00E1,  $00FF   ; 5EB5   00F8 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00E1,  $00FF   ; 5EB9   00E1 00FF 00E1 00FF
        DECLE   $0061,  $00FF,  $00C3,  $00FF   ; 5EBD   0061 00FF 00C3 00FF
        DECLE   $00E1,  $00FF,  $00F0,  $00FF   ; 5EC1   00E1 00FF 00F0 00FF
        DECLE   $00F8,  $00FF,  $00E1,  $00FF   ; 5EC5   00F8 00FF 00E1 00FF
        DECLE   $00E1,  $00FF,  $00E1,  $00FF   ; 5EC9   00E1 00FF 00E1 00FF
        DECLE   $0061,  $00FF,  $00FF,  $00FF   ; 5ECD   0061 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5ED1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5ED5   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00F8   ; 5ED9   00FF 00FF 00FE 00F8
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5EDD   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5EE1   0000 0000 0000 0003
        DECLE   $001F,  $00FE,  $00FC,  $00F8   ; 5EE5   001F 00FE 00FC 00F8
        DECLE   $00E0,  $0080,  $0000,  $0000   ; 5EE9   00E0 0080 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 5EED   0000 0000 0001 0003
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 5EF1   000F 003F 00FF 00FF
        DECLE   $00FF,  $00F3,  $00F3,  $00E3   ; 5EF5   00FF 00F3 00F3 00E3
        DECLE   $00E3,  $00C3,  $00C3,  $0083   ; 5EF9   00E3 00C3 00C3 0083
        DECLE   $0003,  $0003,  $0003,  $0007   ; 5EFD   0003 0003 0003 0007
        DECLE   $0007,  $000F,  $001F,  $003F   ; 5F01   0007 000F 001F 003F
        DECLE   $007F,  $00F3,  $00F3,  $00F3   ; 5F05   007F 00F3 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; 5F09   00F3 00F3 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; 5F0D   00F3 00F3 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; 5F11   00F3 00F3 00F3 00F3
        DECLE   $00F3,  $007C,  $0082,  $00BA   ; 5F15   00F3 007C 0082 00BA
        DECLE   $00A2,  $00A2,  $00BA,  $0082   ; 5F19   00A2 00A2 00BA 0082
        DECLE   $007C,  $00C1,  $00BE,  $00A2   ; 5F1D   007C 00C1 00BE 00A2
        DECLE   $00AA,  $00A6,  $00AA,  $00BE   ; 5F21   00AA 00A6 00AA 00BE
        DECLE   $00C1,  $0060,  $0060,  $0060   ; 5F25   00C1 0060 0060 0060
        DECLE   $0060,  $0060,  $0060,  $0060   ; 5F29   0060 0060 0060 0060
        DECLE   $0000,  $0208,  $00D9,  $0008   ; 5F2D   0000 0208 00D9 0008
        DECLE   $00D9,  $0008,  $00D9,  $0008   ; 5F31   00D9 0008 00D9 0008
        DECLE   $0000,  $0000,  $021C,  $00D9   ; 5F35   0000 0000 021C 00D9
        DECLE   $0008,  $00D9,  $0008,  $00D9   ; 5F39   0008 00D9 0008 00D9
        DECLE   $0008,  $0000,  $0000,  $0230   ; 5F3D   0008 0000 0000 0230
        DECLE   $00D9,  $0008,  $00D9,  $0008   ; 5F41   00D9 0008 00D9 0008
        DECLE   $00D9,  $0008,  $0000,  $0000   ; 5F45   00D9 0008 0000 0000
        DECLE   $0242,  $00D9,  $0008,  $00D9   ; 5F49   0242 00D9 0008 00D9
        DECLE   $0008,  $00D9,  $0008,  $00D9   ; 5F4D   0008 00D9 0008 00D9
        DECLE   $0008,  $00D9,  $0008,  $00D9   ; 5F51   0008 00D9 0008 00D9
        DECLE   $0008,  $00D9,  $0008,  $0000   ; 5F55   0008 00D9 0008 0000
        DECLE   $0000,  $0256,  $00D9,  $0008   ; 5F59   0000 0256 00D9 0008
        DECLE   $00D9,  $0008,  $0001,  $0000   ; 5F5D   00D9 0008 0001 0000
        DECLE   $00D9,  $0008,  $0001,  $0000   ; 5F61   00D9 0008 0001 0000
        DECLE   $00D9,  $0008,  $00D9,  $0008   ; 5F65   00D9 0008 00D9 0008
        DECLE   $0000,  $0000,  $0269,  $0000   ; 5F69   0000 0000 0269 0000
        DECLE   $003C,  $0008,  $003C,  $0010   ; 5F6D   003C 0008 003C 0010
        DECLE   $003C,  $0018,  $003C,  $0020   ; 5F71   003C 0018 003C 0020
        DECLE   $003C,  $0028,  $003C,  $0030   ; 5F75   003C 0028 003C 0030
        DECLE   $003C,  $0038,  $003C,  $0040   ; 5F79   003C 0038 003C 0040
        DECLE   $003C,  $0028,  $003D,  $0000   ; 5F7D   003C 0028 003D 0000
        DECLE   $0000,  $027D,  $0048,  $003C   ; 5F81   0000 027D 0048 003C
        DECLE   $0050,  $003C,  $0058,  $003C   ; 5F85   0050 003C 0058 003C
        DECLE   $0060,  $003C,  $0068,  $003C   ; 5F89   0060 003C 0068 003C
        DECLE   $0070,  $003C,  $0078,  $003C   ; 5F8D   0070 003C 0078 003C
        DECLE   $0080,  $003C,  $0088,  $003C   ; 5F91   0080 003C 0088 003C
        DECLE   $0000,  $0000,  $0291,  $0090   ; 5F95   0000 0000 0291 0090
        DECLE   $003C,  $0098,  $003C,  $00A0   ; 5F99   003C 0098 003C 00A0
        DECLE   $003C,  $00A8,  $003C,  $00B0   ; 5F9D   003C 00A8 003C 00B0
        DECLE   $003C,  $00B8,  $003C,  $00C0   ; 5FA1   003C 00B8 003C 00C0
        DECLE   $003C,  $00C8,  $003C,  $00D0   ; 5FA5   003C 00C8 003C 00D0
        DECLE   $003C,  $0000,  $0000,  $02B9   ; 5FA9   003C 0000 0000 02B9
        DECLE   $001B,  $0001,  $002B,  $0001   ; 5FAD   001B 0001 002B 0001
        DECLE   $0073,  $0001,  $00A3,  $0001   ; 5FB1   0073 0001 00A3 0001
        DECLE   $004B,  $0001,  $0083,  $0001   ; 5FB5   004B 0001 0083 0001
        DECLE   $002B,  $0001,  $0023,  $0001   ; 5FB9   002B 0001 0023 0001
        DECLE   $002B,  $0001,  $0000,  $0000   ; 5FBD   002B 0001 0000 0000
        DECLE   $02E0,  $0023,  $0009,  $008B   ; 5FC1   02E0 0023 0009 008B
        DECLE   $0000,  $00CB,  $0000,  $00C3   ; 5FC5   0000 00CB 0000 00C3
        DECLE   $0000,  $009B,  $0000,  $0001   ; 5FC9   0000 009B 0000 0001
        DECLE   $0000,  $000B,  $0001,  $00A3   ; 5FCD   0000 000B 0001 00A3
        DECLE   $0001,  $000B,  $0001,  $0093   ; 5FD1   0001 000B 0001 0093
        DECLE   $0001,  $0033,  $0009,  $0000   ; 5FD5   0001 0033 0009 0000
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

        DIS                                     ; 6000   0003
        MVII    #$02F0, R6                      ; 6001   02BE 02F0
        MVII    #$0100, R4                      ; 6003   02BC 0100
        MVII    #$00EF, R0                      ; 6005   02B8 00EF

        JSR     R5,     L_6C66                  ; 6007   0004 016C 0066
        DECLE   $0004                           ; 600A   0004

        CMPR    R5,     R4                      ; 600B   016C
        MOVR    R0,     R1                      ; 600C   0081
        SUBR    R5,     R4                      ; 600D   012C
        DIS                                     ; 600E   0003
        MVII    #$00F0, R0                      ; 600F   02B8 00F0
        MVII    #$0200, R4                      ; 6011   02BC 0200

        JSR     R5,     L_6C66                  ; 6013   0004 016C 0066

        SDBD                                    ; 6016   0001
        MVII    #$73C5, R0                      ; 6017   02B8 00C5 0073
        MVO     R0,     .ISRVEC.0               ; 601A   0240 0100
        SWAP    R0,     1                       ; 601C   0040
        MVO     R0,     .ISRVEC.1               ; 601D   0240 0101
        MVII    #$0003, R0                      ; 601F   02B8 0003
        MVO     R0,     G_0124                  ; 6021   0240 0124
L_6023:
        EIS                                     ; 6023   0002
        MVI     G_0124, R0                      ; 6024   0280 0124
        CMPI    #$0003, R0                      ; 6026   0378 0003
        BEQ     L_6023                          ; 6028   0224 0006

        DIS                                     ; 602A   0003
        MVI     G_0172, R0                      ; 602B   0280 0172
        PSHR    R0                              ; 602D   0270
        MVI     G_0173, R0                      ; 602E   0280 0173
        PSHR    R0                              ; 6030   0270
        MVI     G_0175, R0                      ; 6031   0280 0175
        PSHR    R0                              ; 6033   0270
L_6034:
        MVI     G_0176, R0                      ; 6034   0280 0176
        PSHR    R0                              ; 6036   0270
        MVII    #$0102, R4                      ; 6037   02BC 0102
        MVII    #$00ED, R0                      ; 6039   02B8 00ED

        JSR     R5,     L_6C66                  ; 603B   0004 016C 0066
        DECLE   $02B0,  $0240,  $0176,  $02B0   ; 603E   02B0 0240 0176 02B0
        DECLE   $0240,  $0175,  $02B0,  $0240   ; 6042   0240 0175 02B0 0240
        DECLE   $0173,  $02B0,  $0240,  $0172   ; 6046   0173 02B0 0240 0172
        DECLE   $02B8,  $0001,  $0240,  $013F   ; 604A   02B8 0001 0240 013F
        DECLE   $0004                           ; 604E   0004

        CMPR    R6,     R5                      ; 604F   0175
        ANDR    R6,     R6                      ; 6050   01B6
        MVII    #$00DC, R0                      ; 6051   02B8 00DC
        MVII    #$0214, R4                      ; 6053   02BC 0214

        JSR     R5,     L_6C66                  ; 6055   0004 016C 0066

        MVI     G_0348, R0                      ; 6058   0280 0348
        PSHR    R0                              ; 605A   0270
        MVII    #$0318, R4                      ; 605B   02BC 0318
        MVII    #$0360, R0                      ; 605D   02B8 0360
        SUBI    #$0318, R0                      ; 605F   0338 0318

        JSR     R5,     L_6C66                  ; 6061   0004 016C 0066
        DECLE   $02B0,  $0240,  $0348,  $02B8   ; 6064   02B0 0240 0348 02B8
        DECLE   $0020,  $0240,  $0177,  $0004   ; 6068   0020 0240 0177 0004
        DECLE   $0170,  $0369,  $0004,  $0170   ; 606C   0170 0369 0004 0170
        DECLE   $02FD,  $02B8,  $0001           ; 6070   02FD 02B8 0001

        MVO     R0,     G_0102                  ; 6073   0240 0102
L_6075:
        EIS                                     ; 6075   0002
        DECLE   $0004                           ; 6076   0004

        CMPR    R7,     R0                      ; 6077   0178
        ADD@    R5,     R5                      ; 6078   02ED

        JSR     R5,     L_6353                  ; 6079   0004 0160 0353
        DECLE   $0004,  $0168,  $0203,  $0004   ; 607C   0004 0168 0203 0004

        CMPR    R4,     R0                      ; 6080   0160
        ANDR    R1,     R5                      ; 6081   018D

        JSR     R5,     L_6C6E                  ; 6082   0004 016C 006E
        JSR     R5,     L_66B7                  ; 6085   0004 0164 02B7
        DECLE   $0001                           ; 6088   0001
L_6089:
        JSR     R5,     L_6A8F                  ; 6089   0004 0168 028F
        DECLE   $0004                           ; 608C   0004

        CMPR    R6,     R5                      ; 608D   0175
        ANDR    R6,     R6                      ; 608E   01B6
        MVI     G_0124, R0                      ; 608F   0280 0124
        CMPI    #$0002, R0                      ; 6091   0378 0002
L_6093:
        BNEQ    L_6089                          ; 6093   022C 000B

        CLRR    R0                              ; 6095   01C0
        MVO     R0,     G_0124                  ; 6096   0240 0124
        B       L_6075                          ; 6098   0220 0024

        MVI     G_0172, R0                      ; 609A   0280 0172
        SWAP    R0,     1                       ; 609C   0040
        XOR     G_0173, R0                      ; 609D   03C0 0173
        PSHR    R0                              ; 609F   0270
L_60A0:
        AND     G_0176, R0                      ; 60A0   0380 0176
        PSHR    R0                              ; 60A2   0270
        MOVR    R5,     R7                      ; 60A3   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 60A4   0000 0000 0000 0000
        DECLE   $0000,  $0034,  $0060,  $001A   ; 60A8   0000 0034 0060 001A
        DECLE   $0066,  $0015,  $007D,  $0047   ; 60AC   0066 0015 007D 0047
        DECLE   $007D,  $0042,  $0079,  $008C   ; 60B0   007D 0042 0079 008C
        DECLE   $0079,  $00BD,  $0061,  $004E   ; 60B4   0079 00BD 0061 004E
        DECLE   $0076,  $0074,  $0078,  $0076   ; 60B8   0076 0074 0078 0076
        DECLE   $007F,  $0040,  $0000,  $0000   ; 60BC   007F 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $0076   ; 60C8   0000 0000 003C 0076
        DECLE   $0010,  $0000,  $0000,  $0000   ; 60CC   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $007E   ; 60D0   0000 0000 003C 007E
        DECLE   $0018,  $0008,  $0000,  $0000   ; 60D4   0018 0008 0000 0000
        DECLE   $0000,  $0000                   ; 60D8   0000 0000

        RSWD    R4                              ; 60DA   003C
        SARC    R2,     2                       ; 60DB   007E
        COMR    R0                              ; 60DC   0018
        COMR    R0                              ; 60DD   0018
L_60DE:
        RSWD    R4                              ; 60DE   003C
        DECLE   $0076,  $0010,  $0000,  $0000   ; 60DF   0076 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 60E3   0000 0000 0000 003C
        DECLE   $0076,  $0010,  $0000,  $003C   ; 60E7   0076 0010 0000 003C
        DECLE   $0076,  $0010,  $0000,  $003C   ; 60EB   0076 0010 0000 003C
        DECLE   $0076,  $0010,  $0000,  $003C   ; 60EF   0076 0010 0000 003C
        DECLE   $007E,  $0018,  $0008,  $003C   ; 60F3   007E 0018 0008 003C
        DECLE   $0076,  $0010,  $0000,  $003C   ; 60F7   0076 0010 0000 003C
        DECLE   $007E,  $0018,  $0018,  $003C   ; 60FB   007E 0018 0018 003C
        DECLE   $007E,  $0018,  $0008,  $0000   ; 60FF   007E 0018 0008 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6103   0000 0000 0000 003C
        DECLE   $007E,  $0018,  $0008,  $003C   ; 6107   007E 0018 0008 003C
        DECLE   $0076,  $0010,  $0000,  $003C   ; 610B   0076 0010 0000 003C
        DECLE   $007E,  $0018,  $0008,  $003C   ; 610F   007E 0018 0008 003C
        DECLE   $007E,  $0018,  $0008,  $003C   ; 6113   007E 0018 0008 003C
        DECLE   $007E,  $0018,  $0008,  $003C   ; 6117   007E 0018 0008 003C
        DECLE   $007E,  $0018,  $0018,  $003C   ; 611B   007E 0018 0018 003C
        DECLE   $007E,  $0018,  $0018,  $0000   ; 611F   007E 0018 0018 0000
        DECLE   $0000,  $0000,  $0000           ; 6123   0000 0000 0000

        RSWD    R4                              ; 6126   003C
        SARC    R2,     2                       ; 6127   007E
        COMR    R0                              ; 6128   0018
        COMR    R0                              ; 6129   0018
        RSWD    R4                              ; 612A   003C
        RRC     R2,     2                       ; 612B   0076
L_612C:
        DECR    R0                              ; 612C   0010
        DECLE   $0000,  $003C,  $007E,  $0018   ; 612D   0000 003C 007E 0018
        DECLE   $0018,  $003C,  $007E,  $0018   ; 6131   0018 003C 007E 0018
        DECLE   $0008,  $003C,  $007E,  $0018   ; 6135   0008 003C 007E 0018
        DECLE   $0018,  $003C,  $007E,  $0018   ; 6139   0018 003C 007E 0018
        DECLE   $0018,  $0044,  $0022,  $0077   ; 613D   0018 0044 0022 0077
        DECLE   $00FF,  $00FF,  $0077,  $0022   ; 6141   00FF 00FF 0077 0022
        DECLE   $0044,  $0000,  $0000,  $0000   ; 6145   0044 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6149   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0044,  $00EE   ; 614D   0000 0022 0044 00EE
        DECLE   $00FF,  $00FF,  $00EE,  $0044   ; 6151   00FF 00FF 00EE 0044
        DECLE   $0022,  $0000,  $0000,  $0000   ; 6155   0022 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6159   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0004,  $0006   ; 615D   0000 0002 0004 0006
        DECLE   $000E,  $000E,  $0006,  $0004   ; 6161   000E 000E 0006 0004
        DECLE   $0000                           ; 6165   0000

        EIS                                     ; 6166   0002
        CLRC                                    ; 6167   0006
        CLRC                                    ; 6168   0006
        CLRC                                    ; 6169   0006
        INCR    R7                              ; 616A   000F

        CLRC                                    ; 616B   0006
L_616C:
        CLRC                                    ; 616C   0006
        DECLE   $0006,  $0002,  $0004,  $0006   ; 616D   0006 0002 0004 0006
        DECLE   $000E,  $000E,  $0006,  $0004   ; 6171   000E 000E 0006 0004
        DECLE   $0000                           ; 6175   0000

        EIS                                     ; 6176   0002
        CLRC                                    ; 6177   0006
        CLRC                                    ; 6178   0006
        CLRC                                    ; 6179   0006
        INCR    R7                              ; 617A   000F

        CLRC                                    ; 617B   0006
L_617C:
        CLRC                                    ; 617C   0006
        DECLE   $0006,  $0004                   ; 617D   0006 0004

        EIS                                     ; 617F   0002
        SETC                                    ; 6180   0007
        INCR    R7                              ; 6181   000F
        INCR    R7                              ; 6182   000F

L_6183:
        SETC                                    ; 6183   0007
L_6184:
        EIS                                     ; 6184   0002
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6185   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6189   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0004           ; 618D   0000 0002 0004

        INCR    R6                              ; 6190   000E
        INCR    R7                              ; 6191   000F

        DECLE   $000F                           ; 6192   000F
L_6193:
        INCR    R6                              ; 6193   000E
        DECLE   $0004,  $0002,  $0000,  $0000   ; 6194   0004 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6198   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 619C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61A0   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 61A4   0000 0000

        EIS                                     ; 61A6   0002
        CLRC                                    ; 61A7   0006
        CLRC                                    ; 61A8   0006
        CLRC                                    ; 61A9   0006
        INCR    R7                              ; 61AA   000F

        CLRC                                    ; 61AB   0006
L_61AC:
        CLRC                                    ; 61AC   0006
        DECLE   $0006,  $0000,  $0000,  $0000   ; 61AD   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61B1   0000 0000 0000 0000
        DECLE   $0000                           ; 61B5   0000

        EIS                                     ; 61B6   0002
        CLRC                                    ; 61B7   0006
        CLRC                                    ; 61B8   0006
        CLRC                                    ; 61B9   0006
        INCR    R7                              ; 61BA   000F

        CLRC                                    ; 61BB   0006
L_61BC:
        CLRC                                    ; 61BC   0006
        CLRC                                    ; 61BD   0006
        SWAP    R2,     1                       ; 61BE   0042
        MOVR    R7,     R5                      ; 61BF   00BD
        RSWD    R4                              ; 61C0   003C
        COMR    R0                              ; 61C1   0018
        RSWD    R4                              ; 61C2   003C
        SLR     R2,     2                       ; 61C3   0066
        RSWD    R4                              ; 61C4   003C
        MOVR    R0,     R1                      ; 61C5   0081
        ADDR    R0,     R3                      ; 61C6   00C3
        RSWD    R4                              ; 61C7   003C
        RSWD    R4                              ; 61C8   003C
        COMR    R0                              ; 61C9   0018
        RSWD    R4                              ; 61CA   003C
        ADDR    R4,     R7                      ; 61CB   00E7

        DECLE   $003C,  $0000,  $0042,  $00BD   ; 61CC   003C 0000 0042 00BD
        DECLE   $003C,  $0018,  $00BD,  $0066   ; 61D0   003C 0018 00BD 0066
        DECLE   $003C,  $0000,  $00C3,  $003C   ; 61D4   003C 0000 00C3 003C
        DECLE   $003C,  $0018,  $003C,  $0066   ; 61D8   003C 0018 003C 0066
        DECLE   $00BD,  $0000,  $0042,  $00DB   ; 61DC   00BD 0000 0042 00DB
        DECLE   $0066,  $003C,  $00D8,  $0058   ; 61E0   0066 003C 00D8 0058
        DECLE   $0078,  $0030,  $001C,  $003E   ; 61E4   0078 0030 001C 003E
        DECLE   $007E,  $003E,  $007E,  $002C   ; 61E8   007E 003E 007E 002C
        DECLE   $004A,  $0028,  $00A5,  $005A   ; 61EC   004A 0028 00A5 005A
        DECLE   $0066,  $003C,  $0098,  $00D8   ; 61F0   0066 003C 0098 00D8
        DECLE   $0078,  $0030,  $001C,  $003E   ; 61F4   0078 0030 001C 003E
        DECLE   $007E,  $003E,  $007E,  $002C   ; 61F8   007E 003E 007E 002C
        DECLE   $0048,  $0044,  $0000,  $0000   ; 61FC   0048 0044 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 6200   0000 0000 0010 0038
        DECLE   $007C,  $0038,  $0000,  $0000   ; 6204   007C 0038 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 6208   0000 0000 0010 0010
        DECLE   $0010,  $0010,  $00E0,  $0020   ; 620C   0010 0010 00E0 0020
        DECLE   $0060,  $0020,  $00E0,  $0000   ; 6210   0060 0020 00E0 0000
        DECLE   $0038,  $0028,  $0028,  $0038   ; 6214   0038 0028 0028 0038
        DECLE   $0000,  $000E,  $000A,  $000A   ; 6218   0000 000E 000A 000A
        DECLE   $000E,  $0000                   ; 621C   000E 0000

        ADDR    R4,     R0                      ; 621E   00E0
        TSTR    R0                              ; 621F   0080
        ADDR    R4,     R0                      ; 6220   00E0
L_6221:
        MOVR    R4,     R0                      ; 6221   00A0
        DECLE   $00E0,  $0000,  $0038,  $0028   ; 6222   00E0 0000 0038 0028
        DECLE   $0028,  $0038,  $0000,  $000E   ; 6226   0028 0038 0000 000E
        DECLE   $000A,  $000A,  $000E,  $0000   ; 622A   000A 000A 000E 0000
        DECLE   $00E0,  $00A0,  $00E0,  $0020   ; 622E   00E0 00A0 00E0 0020
        DECLE   $00E0,  $0000,  $0038,  $0028   ; 6232   00E0 0000 0038 0028
        DECLE   $0028,  $0038,  $0000,  $000E   ; 6236   0028 0038 0000 000E
        DECLE   $000A,  $000A,  $000E,  $0000   ; 623A   000A 000A 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 623E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6242   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6246   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 624A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 624E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6252   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6256   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 625A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 625E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6262   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6266   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 626A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0077   ; 626E   0000 0000 0000 0077
        DECLE   $0055,  $0055,  $0055,  $0077   ; 6272   0055 0055 0055 0077
        DECLE   $0000,  $0000,  $0000,  $0077   ; 6276   0000 0000 0000 0077
        DECLE   $0055,  $0055,  $0055,  $0077   ; 627A   0055 0055 0055 0077
        DECLE   $0000,  $0000,  $0000,  $0077   ; 627E   0000 0000 0000 0077
        DECLE   $0055,  $0055,  $0055,  $0077   ; 6282   0055 0055 0055 0077
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6286   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 628A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 628E   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; 6292   0018 003C 007E 007E
        DECLE   $007E,  $007E,  $003C,  $0018   ; 6296   007E 007E 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 629A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 629E   0000 0000 0000 0000
        DECLE   $0001,  $0080,  $0000,  $0000   ; 62A2   0001 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62AA   0000 0000 0000 0000
        DECLE   $0018,  $0052,  $0004           ; 62AE   0018 0052 0004

        MOVR    R4,     R0                      ; 62B1   00A0
        COMR    R0                              ; 62B2   0018
        NEGR    R4                              ; 62B3   0024
        SWAP    R3,     1                       ; 62B4   0043
        SWAP    R2,     1                       ; 62B5   0042
        SWAP    R2,     1                       ; 62B6   0042
        SWAP    R3,     1                       ; 62B7   0043
        NEGR    R4                              ; 62B8   0024
        COMR    R0                              ; 62B9   0018
        MOVR    R4,     R0                      ; 62BA   00A0

        JSRD    R4,     L_5018                  ; 62BB   0004 0052 0018

        PSHR    R5                              ; 62BE   0275
        CLRR    R1                              ; 62BF   01C9
        ADD     .PSG0.rgt_hand,R1               ; 62C0   02C1 01FE
        BNEQ    L_62F5                          ; 62C2   020C 0031

        MVII    #$0269, R4                      ; 62C4   02BC 0269
        MVII    #$0009, R0                      ; 62C6   02B8 0009

        JSR     R5,     L_6C66                  ; 62C8   0004 016C 0066
        DECLE   $02BC,  $026C,  $0004,  $0170   ; 62CB   02BC 026C 0004 0170
        DECLE   $035D,  $002D,  $002B,  $002B   ; 62CF   035D 002D 002B 002B
        DECLE   $0100,  $02BC,  $027C,  $0004   ; 62D3   0100 02BC 027C 0004
        DECLE   $0170,  $035D,  $0030,  $0032   ; 62D7   0170 035D 0030 0032
        DECLE   $002F,  $0027,  $0032,  $0021   ; 62DB   002F 0027 0032 0021
        DECLE   $002D,  $002D,  $0029,  $002E   ; 62DF   002D 002D 0029 002E
        DECLE   $0027,  $0100,  $02BC,  $0291   ; 62E3   0027 0100 02BC 0291
        DECLE   $0004                           ; 62E7   0004

        CMPR    R6,     R0                      ; 62E8   0170
        CMP@    R3,     R5                      ; 62E9   035D
        GSWD    R0                              ; 62EA   0030
        GSWD    R2                              ; 62EB   0032
        NEGR    R5                              ; 62EC   0025
        GSWD    R3                              ; 62ED   0033
        NEGR    R5                              ; 62EE   0025
        ADCR    R6                              ; 62EF   002E
        NOP                                     ; 62F0   0034
        GSWD    R3                              ; 62F1   0033
        COMR    R2                              ; 62F2   001A
        SUBR    R0,     R0                      ; 62F3   0100
L_62F4:
        DECR    R7                              ; 62F4   0017
L_62F5:
        PULR    R7                              ; 62F5   02B7

L_62F6:
        SDBD                                    ; 62F6   0001
        MVI@    R5,     R1                      ; 62F7   02A9
        MVO@    R1,     R4                      ; 62F8   0261
        DECR    R0                              ; 62F9   0010
        BNEQ    L_62F6                          ; 62FA   022C 0005
        MOVR    R5,     R7                      ; 62FC   00AF

        DECLE   $0275,  $02B8,  $0001,  $0240   ; 62FD   0275 02B8 0001 0240
        DECLE   $0125,  $0004,  $0174,  $0093   ; 6301   0125 0004 0174 0093
        DECLE   $0004                           ; 6305   0004
L_6306:
        CMPR    R6,     R0                      ; 6306   0170
        SUB@    R1,     R1                      ; 6307   0309
        PULR    R7                              ; 6308   02B7

        PSHR    R5                              ; 6309   0275

        JSR     R5,     L_6A75                  ; 630A   0004 0168 0275
        DECLE   $02BC,  $0318,  $02B8,  $0018   ; 630D   02BC 0318 02B8 0018
        DECLE   $0004,  $0170,  $02F6,  $0000   ; 6311   0004 0170 02F6 0000
        DECLE   $0003,  $0000,  $0003,  $0000   ; 6315   0003 0000 0003 0000
        DECLE   $0003,  $0000,  $0003,  $0000   ; 6319   0003 0000 0003 0000
        DECLE   $0003,  $0000,  $0003,  $0050   ; 631D   0003 0000 0003 0050
        DECLE   $0003,  $0000,  $0003,  $0088   ; 6321   0003 0000 0003 0088
        DECLE   $0000,  $0088,  $0000,  $0088   ; 6325   0000 0088 0000 0088
        DECLE   $0000,  $0088,  $0000,  $0088   ; 6329   0000 0088 0000 0088
        DECLE   $0000,  $0000,  $0000,  $0060   ; 632D   0000 0000 0000 0060
        DECLE   $0001,  $0000,  $0001,  $0000   ; 6331   0001 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6335   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6339   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0009,  $0040   ; 633D   0000 0000 0009 0040
        DECLE   $0009,  $004A,  $0029,  $0004   ; 6341   0009 004A 0029 0004
        DECLE   $0168,  $0242,  $0096,  $0002   ; 6345   0168 0242 0096 0002
        DECLE   $0004,  $0168,  $0242,  $0096   ; 6349   0004 0168 0242 0096
        DECLE   $0008,  $0004,  $0168,  $0242   ; 634D   0008 0004 0168 0242
        DECLE   $00FF                           ; 6351   00FF

        CLRC                                    ; 6352   0006

L_6353:
        JSR     R5,     L_652A                  ; 6353   0004 0164 012A
        DECLE   $01C0,  $0240,  $0125,  $0004   ; 6356   01C0 0240 0125 0004

        CMPR    R6,     R4                      ; 635A   0174
        MVO@    R6,     R1                      ; 635B   024E
        PULR    R7                              ; 635C   02B7

L_635D:
        MVI@    R5,     R0                      ; 635D   02A8
        ANDI    #$00FF, R0                      ; 635E   03B8 00FF
        BNEQ    L_6363                          ; 6360   020C 0001
        MOVR    R5,     R7                      ; 6362   00AF

L_6363:
        SLL     R0,     2                       ; 6363   004C
        ADDR    R0,     R0                      ; 6364   00C0
        INCR    R0                              ; 6365   0008
        MVO@    R0,     R4                      ; 6366   0260
        B       L_635D                          ; 6367   0220 000B

        PSHR    R5                              ; 6369   0275
        MVII    #$00DC, R0                      ; 636A   02B8 00DC
        MVII    #$0214, R4                      ; 636C   02BC 0214

        JSR     R5,     L_6C66                  ; 636E   0004 016C 0066

        MVII    #$0214, R4                      ; 6371   02BC 0214
        MVII    #$00DC, R0                      ; 6373   02B8 00DC
        SDBD                                    ; 6375   0001
        MVII    #$0805, R1                      ; 6376   02B9 0005 0008

        JSR     R5,     L_6C67                  ; 6379   0004 016C 0067

        CLRR    R3                              ; 637C   01DB
        MVII    #$0214, R2                      ; 637D   02BA 0214

L_637F:
        JSR     R5,     L_6A8F                  ; 637F   0004 0168 028F

        ANDI    #$001F, R0                      ; 6382   03B8 001F
        CMPI    #$0018, R0                      ; 6384   0378 0018
        BGT     L_637F                          ; 6386   022E 0008

        CMPI    #$0007, R0                      ; 6388   0378 0007
        BGT     L_63A5                          ; 638A   020E 0019

        INCR    R3                              ; 638C   000B
        CMPI    #$0007, R0                      ; 638D   0378 0007
        BNEQ    L_6392                          ; 638F   020C 0001

        INCR    R3                              ; 6391   000B
L_6392:
        SDBD                                    ; 6392   0001
        MVII    #$73AD, R5                      ; 6393   02BD 00AD 0073
        MOVR    R0,     R4                      ; 6396   0084
        ADDR    R0,     R4                      ; 6397   00C4
        ADDR    R0,     R5                      ; 6398   00C5
        MVI@    R5,     R0                      ; 6399   02A8
        SDBD                                    ; 639A   0001
        ADDI    #$73B5, R4                      ; 639B   02FC 00B5 0073
        SDBD                                    ; 639E   0001
        XOR@    R4,     R0                      ; 639F   03E0
        SDBD                                    ; 63A0   0001
        ADDI    #$0805, R0                      ; 63A1   02F8 0005 0008
        MVO@    R0,     R2                      ; 63A4   0250
L_63A5:
        INCR    R2                              ; 63A5   000A
        CMPI    #$02DC, R2                      ; 63A6   037A 02DC
        BNEQ    L_637F                          ; 63A8   022C 002A

        MVO     R3,     G_0332                  ; 63AA   0243 0332
        PULR    R7                              ; 63AC   02B7

        DECLE   $0018,  $0060,  $0018,  $0060   ; 63AD   0018 0060 0018 0060
        DECLE   $0060,  $0018,  $0060,  $0078   ; 63B1   0060 0018 0060 0078
        DECLE   $0000,  $0002,  $0000,  $0004   ; 63B5   0000 0002 0000 0004
        DECLE   $0000,  $0002,  $0000,  $0004   ; 63B9   0000 0002 0000 0004
        DECLE   $0000,  $0004,  $0000,  $0002   ; 63BD   0000 0004 0000 0002
        DECLE   $0000,  $0004,  $0000,  $0006   ; 63C1   0000 0004 0000 0006
        DECLE   $0275,  $0004                   ; 63C5   0275 0004

        CMPR    R7,     R0                      ; 63C7   0178
        PULR    R3                              ; 63C8   02B3
        MVI     G_0124, R1                      ; 63C9   0281 0124
        SLL     R1,     1                       ; 63CB   0049
        ADDR    R1,     R7                      ; 63CC   00CF
        B       L_6405                          ; 63CD   0200 0036
        B       L_6413                          ; 63CF   0200 0042
        B       L_63DB                          ; 63D1   0200 0008
        B       L_63E5                          ; 63D3   0200 0010

        MVII    #$0003, R0                      ; 63D5   02B8 0003
        MVO     R0,     G_0124                  ; 63D7   0240 0124
        B       L_63DB                          ; 63D9   0200 0000

L_63DB:
        MVO     R0,     .STIC.VIDEN             ; 63DB   0240 0020

        JSR     R5,     L_6881                  ; 63DD   0004 0168 0081
        DECLE   $0004,  $0168,  $032E           ; 63E0   0004 0168 032E

        EIS                                     ; 63E3   0002
        PULR    R7                              ; 63E4   02B7

L_63E5:
        DIS                                     ; 63E5   0003
        SDBD                                    ; 63E6   0001
        MVII    #$3800, R4                      ; 63E7   02BC 0000 0038
        MVII    #$0200, R0                      ; 63EA   02B8 0200

        JSR     R5,     L_6C66                  ; 63EC   0004 016C 0066
        DECLE   $0001,  $02BC,  $00A4,  $0070   ; 63EF   0001 02BC 00A4 0070
        DECLE   $0004,  $0174,  $0054,  $0004   ; 63F3   0004 0174 0054 0004
        DECLE   $0174,  $0077,  $0001,  $02B9   ; 63F7   0174 0077 0001 02B9
        DECLE   $00BD,  $0070,  $0004           ; 63FB   00BD 0070 0004

        CMPR    R6,     R4                      ; 63FE   0174
        MOVR    R0,     R4                      ; 63FF   0084
        MVO     R2,     G_0124                  ; 6400   0242 0124
        MVO     R0,     .STIC.VIDEN             ; 6402   0240 0020
        PULR    R7                              ; 6404   02B7

L_6405:
        MVI     G_0125, R1                      ; 6405   0281 0125
        DECLE   $0089,  $022C,  $002E,  $0004   ; 6407   0089 022C 002E 0004
        DECLE   $0174,  $001F                   ; 640B   0174 001F

        MVII    #$0001, R0                      ; 640D   02B8 0001
        MVO     R0,     G_0124                  ; 640F   0240 0124
        B       L_63DB                          ; 6411   0220 0037

L_6413:
        JSR     R5,     L_69E9                  ; 6413   0004 0168 01E9
        DECLE   $0004                           ; 6416   0004

        CMPR    R6,     R4                      ; 6417   0174
        ADD@    R2,     R7                      ; 6418   02D7

        MVII    #$0002, R0                      ; 6419   02B8 0002
        MVO     R0,     G_0124                  ; 641B   0240 0124
        B       L_63DB                          ; 641D   0220 0043

        PSHR    R5                              ; 641F   0275
        MVII    #$0318, R4                      ; 6420   02BC 0318
        CLRR    R5                              ; 6422   01ED
        MVI@    R4,     R1                      ; 6423   02A1
        MVO@    R1,     R5                      ; 6424   0269
        MVI@    R4,     R1                      ; 6425   02A1
        MVO@    R1,     R5                      ; 6426   0269
        MVI@    R4,     R1                      ; 6427   02A1
        MVO@    R1,     R5                      ; 6428   0269
        MVI@    R4,     R1                      ; 6429   02A1
        MVO@    R1,     R5                      ; 642A   0269
        MVI@    R4,     R1                      ; 642B   02A1
        MVO@    R1,     R5                      ; 642C   0269
        MVI@    R4,     R1                      ; 642D   02A1
        MVO@    R1,     R5                      ; 642E   0269
        MVI@    R4,     R1                      ; 642F   02A1
        MVO@    R1,     R5                      ; 6430   0269
        MVI@    R4,     R1                      ; 6431   02A1
        MVO@    R1,     R5                      ; 6432   0269
        MVI@    R4,     R1                      ; 6433   02A1
        MVO@    R1,     R5                      ; 6434   0269
        MVI@    R4,     R1                      ; 6435   02A1
        MVO@    R1,     R5                      ; 6436   0269
        MVI@    R4,     R1                      ; 6437   02A1
        MVO@    R1,     R5                      ; 6438   0269
        MVI@    R4,     R1                      ; 6439   02A1
        MVO@    R1,     R5                      ; 643A   0269
        MVI@    R4,     R1                      ; 643B   02A1
        MVO@    R1,     R5                      ; 643C   0269
        MVI@    R4,     R1                      ; 643D   02A1
        MVO@    R1,     R5                      ; 643E   0269
        MVI@    R4,     R1                      ; 643F   02A1
        MVO@    R1,     R5                      ; 6440   0269
        MVI@    R4,     R1                      ; 6441   02A1
        MVO@    R1,     R5                      ; 6442   0269
L_6443:
        MVI@    R4,     R1                      ; 6443   02A1
        MVO@    R1,     R5                      ; 6444   0269
        MVI@    R4,     R1                      ; 6445   02A1
        MVO@    R1,     R5                      ; 6446   0269
        MVI@    R4,     R1                      ; 6447   02A1
        MVO@    R1,     R5                      ; 6448   0269
        MVI@    R4,     R1                      ; 6449   02A1
        MVO@    R1,     R5                      ; 644A   0269
        MVI@    R4,     R1                      ; 644B   02A1
        MVO@    R1,     R5                      ; 644C   0269
        MVI@    R4,     R1                      ; 644D   02A1
        MVO@    R1,     R5                      ; 644E   0269
        MVI@    R4,     R1                      ; 644F   02A1
        MVO@    R1,     R5                      ; 6450   0269
        MVI@    R4,     R1                      ; 6451   02A1
        MVO@    R1,     R5                      ; 6452   0269
        PULR    R7                              ; 6453   02B7

        PSHR    R5                              ; 6454   0275
        MVII    #$0028, R5                      ; 6455   02BD 0028
        MVI@    R4,     R0                      ; 6457   02A0
        MVO@    R0,     R5                      ; 6458   0268
        MVI@    R4,     R0                      ; 6459   02A0
        MVO@    R0,     R5                      ; 645A   0268
        MVI@    R4,     R0                      ; 645B   02A0
        MVO@    R0,     R5                      ; 645C   0268
        MVI@    R4,     R0                      ; 645D   02A0
        MVO@    R0,     R5                      ; 645E   0268
        MVI@    R4,     R0                      ; 645F   02A0
        RRC     R0,     1                       ; 6460   0070
        BC      L_6467                          ; 6461   0201 0004

        MVI     .STIC.MODE,R3                   ; 6463   0283 0021
        B       L_6469                          ; 6465   0200 0002

L_6467:
        MVO     R3,     .STIC.MODE              ; 6467   0243 0021
L_6469:
        MVO@    R0,     R5                      ; 6469   0268
        CLRR    R0                              ; 646A   01C0
        MVII    #$0030, R5                      ; 646B   02BD 0030
        MVO@    R0,     R5                      ; 646D   0268
        MVO@    R0,     R5                      ; 646E   0268
        MVO@    R0,     R5                      ; 646F   0268
        CLRR    R4                              ; 6470   01E4
        MVII    #$0020, R0                      ; 6471   02B8 0020

        JSR     R5,     L_6C66                  ; 6473   0004 016C 0066

        PULR    R7                              ; 6476   02B7

        PSHR    R5                              ; 6477   0275
        MVII    #$01F0, R4                      ; 6478   02BC 01F0
        MVII    #$000E, R0                      ; 647A   02B8 000E

        JSR     R5,     L_6C66                  ; 647C   0004 016C 0066

        MVII    #$003F, R0                      ; 647F   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6481   0240 01F8
        PULR    R7                              ; 6483   02B7

        PSHR    R5                              ; 6484   0275
        MOVR    R1,     R5                      ; 6485   008D
        SDBD                                    ; 6486   0001
        MVII    #$3800, R4                      ; 6487   02BC 0000 0038
        MVI@    R5,     R2                      ; 648A   02AA
        SLL     R2,     2                       ; 648B   004E
        SLL     R2,     1                       ; 648C   004A
L_648D:
        MVI@    R5,     R0                      ; 648D   02A8
        MVO@    R0,     R4                      ; 648E   0260
        DECR    R2                              ; 648F   0012
        BNEQ    L_648D                          ; 6490   022C 0004
        PULR    R7                              ; 6492   02B7

        DECLE   $0275,  $02B8,  $001F,  $0240   ; 6493   0275 02B8 001F 0240
        DECLE   $0164,  $0004,  $0174,  $010E   ; 6497   0164 0004 0174 010E
        DECLE   $0280,  $013E,  $03C0,  $01F8   ; 649B   0280 013E 03C0 01F8
        DECLE   $0240,  $01F8,  $0004           ; 649F   0240 01F8 0004

        CMPR    R6,     R4                      ; 64A2   0174
        SUBR    R0,     R0                      ; 64A3   0100
        BOV     L_64AA                          ; 64A4   0202 0004

        CMPR    R6,     R4                      ; 64A6   0174
        SUBR    R0,     R0                      ; 64A7   0100
        BGT     L_666A                          ; 64A8   020E 01C0

L_64AA:
        MVO     R0,     G_0145                  ; 64AA   0240 0145
        MVO     R0,     G_0146                  ; 64AC   0240 0146
        MVI     G_0169, R0                      ; 64AE   0280 0169
        DECR    R0                              ; 64B0   0010
        BPL     L_64B4                          ; 64B1   0203 0001

        CLRR    R0                              ; 64B3   01C0
L_64B4:
        MVI     G_0126, R1                      ; 64B4   0281 0126
        MOVR    R1,     R2                      ; 64B6   008A
        INCR    R1                              ; 64B7   0009
        ANDI    #$0001, R1                      ; 64B8   03B9 0001
        MVO     R1,     G_0126                  ; 64BA   0241 0126
        SLL     R1,     2                       ; 64BC   004D
        SLL     R2,     2                       ; 64BD   004E
        ADDR    R1,     R1                      ; 64BE   00C9
        ADDR    R2,     R2                      ; 64BF   00D2
        ADDI    #$0127, R1                      ; 64C0   02F9 0127
        ADDI    #$0127, R2                      ; 64C2   02FA 0127
        MVO@    R0,     R1                      ; 64C4   0248
        MVI@    R2,     R0                      ; 64C5   0290
        MVO     R0,     G_0169                  ; 64C6   0240 0169
        MOVR    R2,     R1                      ; 64C8   0091
        INCR    R1                              ; 64C9   0009
        MVO     R1,     G_0330                  ; 64CA   0241 0330
        CLRR    R4                              ; 64CC   01E4
        MVII    #$0214, R1                      ; 64CD   02B9 0214
L_64CF:
        MVI@    R1,     R2                      ; 64CF   028A
        MVI@    R1,     R0                      ; 64D0   0288
        SDBD                                    ; 64D1   0001
        MVII    #$0800, R3                      ; 64D2   02BB 0000 0008
        MOVR    R0,     R5                      ; 64D5   0085
        SDBD                                    ; 64D6   0001
        ANDI    #$0400, R5                      ; 64D7   03BD 0000 0004
        BEQ     L_64DF                          ; 64DA   0204 0003

        INCR    R4                              ; 64DC   000C
        XORI    #$0060, R3                      ; 64DD   03FB 0060
L_64DF:
        MOVR    R0,     R5                      ; 64DF   0085
        ANDI    #$0200, R5                      ; 64E0   03BD 0200
        BEQ     L_64E7                          ; 64E2   0204 0003

        INCR    R4                              ; 64E4   000C
        XORI    #$0018, R3                      ; 64E5   03FB 0018
L_64E7:
        MOVR    R2,     R5                      ; 64E7   0095
        ANDI    #$0060, R5                      ; 64E8   03BD 0060
        BEQ     L_64F0                          ; 64EA   0204 0004

        SDBD                                    ; 64EC   0001
        XORI    #$0400, R3                      ; 64ED   03FB 0000 0004
L_64F0:
        MOVR    R2,     R5                      ; 64F0   0095
        ANDI    #$0018, R5                      ; 64F1   03BD 0018
        BEQ     L_64F7                          ; 64F3   0204 0002

        XORI    #$0200, R3                      ; 64F5   03FB 0200
L_64F7:
        MVO@    R3,     R1                      ; 64F7   024B
        INCR    R1                              ; 64F8   0009
        CMPI    #$02F0, R1                      ; 64F9   0379 02F0
        BNEQ    L_64CF                          ; 64FB   022C 002D

        MVO     R4,     G_0332                  ; 64FD   0244 0332
        PULR    R7                              ; 64FF   02B7

        MVI@    R5,     R1                      ; 6500   02A9
        MVII    #$0003, R0                      ; 6501   02B8 0003
L_6503:
        MVI@    R1,     R2                      ; 6503   028A
        SDBD                                    ; 6504   0001
        XORI    #$1000, R2                      ; 6505   03FA 0000 0010
        MVO@    R2,     R1                      ; 6508   024A
        INCR    R1                              ; 6509   0009
        DECR    R0                              ; 650A   0010
        BNEQ    L_6503                          ; 650B   022C 0009
        MOVR    R5,     R7                      ; 650D   00AF

        PSHR    R5                              ; 650E   0275
        MVI     G_012E, R1                      ; 650F   0281 012E
        MVI     G_0136, R2                      ; 6511   0282 0136
        MVI     G_0126, R0                      ; 6513   0280 0126
        TSTR    R0                              ; 6515   0080
        BEQ     L_6527                          ; 6516   0204 000F

        TSTR    R2                              ; 6518   0092
        BNEQ    L_6524                          ; 6519   020C 0009

        TSTR    R1                              ; 651B   0089
        BEQ     L_6540                          ; 651C   0204 0022

        DECR    R1                              ; 651E   0011
        MVO     R1,     G_012E                  ; 651F   0241 012E
        DECR    R6                              ; 6521   0016
        B       L_6531                          ; 6522   0200 000D

L_6524:
        DECR    R2                              ; 6524   0012
        B       L_653B                          ; 6525   0200 0014

L_6527:
        TSTR    R1                              ; 6527   0089
        BNEQ    L_653A                          ; 6528   020C 0010

L_652A:
        TSTR    R2                              ; 652A   0092
        BEQ     L_6540                          ; 652B   0204 0013

        DECR    R2                              ; 652D   0012
        MVO     R2,     G_0136                  ; 652E   0242 0136
        DECR    R6                              ; 6530   0016
L_6531:
        MVI     G_0169, R0                      ; 6531   0280 0169
        DECR    R0                              ; 6533   0010
        BPL     L_6537                          ; 6534   0203 0001

        CLRR    R0                              ; 6536   01C0
L_6537:
        MVO     R0,     G_0169                  ; 6537   0240 0169
        INCR    R7                              ; 6539   000F

L_653A:
        DECR    R1                              ; 653A   0011
L_653B:
        MVO     R1,     G_012E                  ; 653B   0241 012E
        MVO     R2,     G_0136                  ; 653D   0242 0136
        PULR    R7                              ; 653F   02B7

L_6540:
        MVI     G_013F, R0                      ; 6540   0280 013F
        DECLE   $0080,  $020C,  $0069           ; 6542   0080 020C 0069

        MVII    #$0128, R3                      ; 6545   02BB 0128
        MVII    #$0130, R2                      ; 6547   02BA 0130
        ADDI    #$0005, R2                      ; 6549   02FA 0005
        ADDI    #$0005, R3                      ; 654B   02FB 0005
        MVII    #$0006, R0                      ; 654D   02B8 0006
L_654F:
        MVI@    R2,     R1                      ; 654F   0291
        CMP@    R3,     R1                      ; 6550   0359
        BGT     L_6562                          ; 6551   020E 000F
        BLT     L_655A                          ; 6553   0205 0005

        DECR    R3                              ; 6555   0013
        DECR    R2                              ; 6556   0012
        DECR    R0                              ; 6557   0010
        BNEQ    L_654F                          ; 6558   022C 000A

L_655A:
        MVII    #$0128, R3                      ; 655A   02BB 0128
        SDBD                                    ; 655C   0001
        MVII    #$3980, R2                      ; 655D   02BA 0080 0039
        B       L_6568                          ; 6560   0200 0006

L_6562:
        MVII    #$0130, R3                      ; 6562   02BB 0130
        SDBD                                    ; 6564   0001
        MVII    #$3998, R2                      ; 6565   02BA 0098 0039
L_6568:
        MVII    #$0137, R1                      ; 6568   02B9 0137
        MOVR    R3,     R4                      ; 656A   009C
        ADDI    #$0005, R3                      ; 656B   02FB 0005
        ADDI    #$0005, R1                      ; 656D   02F9 0005
        MVII    #$0006, R0                      ; 656F   02B8 0006
L_6571:
        MVI@    R3,     R5                      ; 6571   029D
        DECLE   $034D,  $0205,  $001F           ; 6572   034D 0205 001F

        BGT     L_657C                          ; 6575   020E 0005

        DECR    R1                              ; 6577   0011
        DECR    R3                              ; 6578   0013
        DECR    R0                              ; 6579   0010
        BNEQ    L_6571                          ; 657A   022C 000A

L_657C:
        MVII    #$0137, R1                      ; 657C   02B9 0137
        DECLE   $02B8,  $0006,  $0004,  $0174   ; 657E   02B8 0006 0004 0174
        DECLE   $0246,  $0240,  $013D,  $0001   ; 6582   0246 0240 013D 0001
        DECLE   $02B8,  $002C,  $0076,  $0240   ; 6586   02B8 002C 0076 0240
        DECLE   $0100,  $0040,  $0240,  $0101   ; 658A   0100 0040 0240 0101
        DECLE   $0002,  $0280,  $013D,  $0080   ; 658E   0002 0280 013D 0080
        DECLE   $0224,  $0005,  $0004,  $0174   ; 6592   0224 0005 0004 0174
        DECLE   $01F7                           ; 6596   01F7

        MVII    #$003F, R0                      ; 6597   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6599   0240 01F8
L_659B:
        MVI     .PSG0.rgt_hand,R0               ; 659B   0280 01FE
        DECLE   $03C0,  $01FF,  $022C,  $000C   ; 659D   03C0 01FF 022C 000C
        DECLE   $0004,  $0175,  $021C           ; 65A1   0004 0175 021C

        INCR    R0                              ; 65A4   0008
        MVO     R0,     G_013F                  ; 65A5   0240 013F
        MVII    #$0018, R0                      ; 65A7   02B8 0018
        MVII    #$0318, R4                      ; 65A9   02BC 0318

        JSR     R5,     L_6C66                  ; 65AB   0004 016C 0066
        DECLE   $0004,  $0170,  $0309,  $02BE   ; 65AE   0004 0170 0309 02BE
        DECLE   $02F0,  $0004                   ; 65B2   02F0 0004

        CMP@    R6,     R0                      ; 65B4   0370
        RRC     R1,     2                       ; 65B5   0075
        PSHR    R5                              ; 65B6   0275
        ADD     G_013F, R7                      ; 65B7   02C7 013F
        PULR    R7                              ; 65B9   02B7

        MVI     G_0172, R5                      ; 65BA   0285 0172
        XOR     G_0175, R5                      ; 65BC   03C5 0175
        BNEQ    L_65C7                          ; 65BE   020C 0007

        MVI     G_0173, R5                      ; 65C0   0285 0173
        XOR     G_0176, R5                      ; 65C2   03C5 0176
        BNEQ    L_65C7                          ; 65C4   020C 0001
        PULR    R7                              ; 65C6   02B7

L_65C7:
        DIS                                     ; 65C7   0003
        DECLE   $02BC,  $0137,  $02B8,  $0006   ; 65C8   02BC 0137 02B8 0006
        DECLE   $00B1,  $02A2,  $0272,  $0010   ; 65CC   00B1 02A2 0272 0010
        DECLE   $022C,  $0004,  $0271,  $0004   ; 65D0   022C 0004 0271 0004

        CMPR    R6,     R0                      ; 65D4   0170
        MOVR    R3,     R2                      ; 65D5   009A
        PULR    R3                              ; 65D6   02B3
        PULR    R2                              ; 65D7   02B2
        MVII    #$0102, R4                      ; 65D8   02BC 0102
        MVII    #$00ED, R0                      ; 65DA   02B8 00ED

        JSR     R5,     L_6C66                  ; 65DC   0004 016C 0066
        DECLE   $02B5,  $0240,  $0173,  $0240   ; 65DF   02B5 0240 0173 0240
        DECLE   $0176,  $02BC,  $0137,  $02B8   ; 65E3   0176 02BC 0137 02B8
        DECLE   $0006,  $02A9,  $0261,  $0010   ; 65E7   0006 02A9 0261 0010
        DECLE   $022C,  $0004,  $02BE,  $02F0   ; 65EB   022C 0004 02BE 02F0
        DECLE   $0272,  $0273,  $0004,  $0174   ; 65EF   0272 0273 0004 0174
        DECLE   $0275,  $0004,  $0370,  $0051   ; 65F3   0275 0004 0370 0051
        DECLE   $0275,  $02BC,  $0318,  $02B8   ; 65F7   0275 02BC 0318 02B8
        DECLE   $0018,  $0004,  $0174,  $0226   ; 65FB   0018 0004 0174 0226
        DECLE   $0234,  $023C,  $0244,  $024C   ; 65FF   0234 023C 0244 024C
        DECLE   $025C,  $0264,  $026C,  $0274   ; 6603   025C 0264 026C 0274
        DECLE   $0058,  $0058,  $0058,  $0058   ; 6607   0058 0058 0058 0058
        DECLE   $0058,  $0058,  $0058,  $0058   ; 660B   0058 0058 0058 0058
        DECLE   $013E,  $020E,  $026E,  $022E   ; 660F   013E 020E 026E 022E
        DECLE   $017E,  $02B6,  $022E,  $0296   ; 6613   017E 02B6 022E 0296

        MVO     R0,     G_0124                  ; 6617   0240 0124
        MVO     R0,     G_0125                  ; 6619   0240 0125
        PULR    R7                              ; 661B   02B7

        MVII    #$0005, R0                      ; 661C   02B8 0005
        CLRR    R1                              ; 661E   01C9
L_661F:
        DECR    R1                              ; 661F   0011
        BNEQ    L_661F                          ; 6620   022C 0002

        DECR    R0                              ; 6622   0010
        BNEQ    L_661F                          ; 6623   022C 0005
        MOVR    R5,     R7                      ; 6625   00AF

L_6626:
        MVI@    R5,     R1                      ; 6626   02A9
        MVO@    R1,     R4                      ; 6627   0261
        DECR    R0                              ; 6628   0010
        BNEQ    L_6626                          ; 6629   022C 0004
        MOVR    R5,     R7                      ; 662B   00AF

        DECLE   $0275,  $0240,  $0020,  $0094   ; 662C   0275 0240 0020 0094
        DECLE   $0001,  $02B9,  $00B0,  $0039   ; 6630   0001 02B9 00B0 0039
        DECLE   $02B8,  $0018,  $0004           ; 6634   02B8 0018 0004

        CMPR    R6,     R4                      ; 6637   0174
        MVO     R6,     .STIC.Y.0               ; 6638   0246 0008
        MVO     R0,     G_013D                  ; 663A   0240 013D
        SDBD                                    ; 663C   0001
        MVII    #$73C5, R0                      ; 663D   02B8 00C5 0073
        MVO     R0,     .ISRVEC.0               ; 6640   0240 0100
        SWAP    R0,     1                       ; 6642   0040
        MVO     R0,     .ISRVEC.1               ; 6643   0240 0101
        PULR    R7                              ; 6645   02B7

        PSHR    R5                              ; 6646   0275
        MOVR    R1,     R5                      ; 6647   008D
L_6648:
        MVI@    R4,     R1                      ; 6648   02A1
        MVO@    R1,     R5                      ; 6649   0269
        DECR    R0                              ; 664A   0010
        BNEQ    L_6648                          ; 664B   022C 0004
        PULR    R7                              ; 664D   02B7

        DECLE   $0275,  $0280,  $012E,  $02BC   ; 664E   0275 0280 012E 02BC
        DECLE   $0205,  $0004,  $0174,  $0263   ; 6652   0205 0004 0174 0263
        DECLE   $0280,  $0136,  $02BC,  $0211   ; 6656   0280 0136 02BC 0211
        DECLE   $0004,  $0174,  $0263,  $0004   ; 665A   0004 0174 0263 0004
        DECLE   $0168,  $0242                   ; 665E   0168 0242

        INCR    R2                              ; 6660   000A
        SETC                                    ; 6661   0007
        PULR    R7                              ; 6662   02B7

        SDBD                                    ; 6663   0001
        MVII    #$0942, R1                      ; 6664   02B9 0042 0009
        MVII    #$0003, R2                      ; 6667   02BA 0003
        CLRR    R3                              ; 6669   01DB
L_666A:
        DECR    R0                              ; 666A   0010
        BMI     L_6670                          ; 666B   020B 0003

        MVO@    R1,     R4                      ; 666D   0261
        B       L_6671                          ; 666E   0200 0001

L_6670:
        MVO@    R3,     R4                      ; 6670   0263
L_6671:
        DECR    R2                              ; 6671   0012
        BNEQ    L_666A                          ; 6672   022C 0009
        MOVR    R5,     R7                      ; 6674   00AF

        PULR    R3                              ; 6675   02B3
        PULR    R0                              ; 6676   02B0
        CMPI    #$00FF, R0                      ; 6677   0378 00FF
        MVII    #$0080, R0                      ; 6679   02B8 0080
        BEQ     L_667E                          ; 667B   0204 0001

        SLR     R0,     1                       ; 667D   0060
L_667E:
        MVI     .PSG0.chan_enable,R1            ; 667E   0281 01F8
        DECLE   $03B9,  $003F,  $01C1,  $0241   ; 6680   03B9 003F 01C1 0241
        DECLE   $01F8,  $02B8,  $00C0,  $0240   ; 6684   01F8 02B8 00C0 0240
        DECLE   $013E,  $02B8,  $0003,  $0240   ; 6688   013E 02B8 0003 0240
        DECLE   $012E,  $0240,  $0136,  $0001   ; 668C   012E 0240 0136 0001
        DECLE   $02B9,  $0081,  $0009,  $02B8   ; 6690   02B9 0081 0009 02B8
        DECLE   $0003,  $02BA,  $0204,  $0251   ; 6694   0003 02BA 0204 0251
        DECLE   $0012,  $02F9,  $0008,  $0010   ; 6698   0012 02F9 0008 0010
        DECLE   $022C,  $0006,  $037B,  $0082   ; 669C   022C 0006 037B 0082
        DECLE   $0204,  $0014                   ; 66A0   0204 0014

        MVII    #$003F, R0                      ; 66A2   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 66A4   0240 01F8
        CLRR    R0                              ; 66A6   01C0
        MVO     R0,     G_0136                  ; 66A7   0240 0136
        MVO     R0,     G_013E                  ; 66A9   0240 013E
        MVO     R0,     .BTAB.0E                ; 66AB   0240 020E
        NOP                                     ; 66AD   0034
        MVO     R0,     .BTAB.0F                ; 66AE   0240 020F
        MVO     R0,     .BTAB.10                ; 66B0   0240 0210
        ADDI    #$0018, R1                      ; 66B2   02F9 0018
        B       L_66C5                          ; 66B4   0200 000F

        DECLE   $0001                           ; 66B6   0001
L_66B7:
        XORI    #$0000, R1                      ; 66B7   03F9 0000
        DECR    R0                              ; 66B9   0010
        MVII    #$0003, R0                      ; 66BA   02B8 0003
        MVII    #$0210, R2                      ; 66BC   02BA 0210
L_66BE:
        MVO@    R1,     R2                      ; 66BE   0251
        ADDI    #$0008, R1                      ; 66BF   02F9 0008
        DECR    R2                              ; 66C1   0012
        DECR    R0                              ; 66C2   0010
        BNEQ    L_66BE                          ; 66C3   022C 0006

L_66C5:
        SDBD                                    ; 66C5   0001
        ANDI    #$EFF8, R1                      ; 66C6   03B9 00F8 00EF
        XORI    #$0007, R1                      ; 66C9   03F9 0007
        MVII    #$0003, R0                      ; 66CB   02B8 0003
        MVII    #$020A, R2                      ; 66CD   02BA 020A
L_66CF:
        MVO@    R1,     R2                      ; 66CF   0251
        DECR    R2                              ; 66D0   0012
        ADDI    #$0008, R1                      ; 66D1   02F9 0008
        DECR    R0                              ; 66D3   0010
        BNEQ    L_66CF                          ; 66D4   022C 0006
        MOVR    R5,     R7                      ; 66D6   00AF

        PSHR    R5                              ; 66D7   0275
        MVO     R0,     .STIC.VIDEN             ; 66D8   0240 0020
        MVII    #$0003, R0                      ; 66DA   02B8 0003
        SDBD                                    ; 66DC   0001
        MVII    #$3983, R3                      ; 66DD   02BB 0083 0039
        MVII    #$0128, R1                      ; 66E0   02B9 0128
L_66E2:
        MVI@    R1,     R2                      ; 66E2   028A
        SLL     R2,     2                       ; 66E3   004E
        ADD@    R1,     R2                      ; 66E4   02CA
        SDBD                                    ; 66E5   0001
        MVII    #$7842, R4                      ; 66E6   02BC 0042 0078
        ADDR    R2,     R4                      ; 66E9   00D4
        INCR    R1                              ; 66EA   0009
        MVI@    R1,     R2                      ; 66EB   028A
        SLL     R2,     2                       ; 66EC   004E
        ADD@    R1,     R2                      ; 66ED   02CA
        INCR    R1                              ; 66EE   0009
        SDBD                                    ; 66EF   0001
        MVII    #$7842, R5                      ; 66F0   02BD 0042 0078
        ADDR    R2,     R5                      ; 66F3   00D5
        PSHR    R0                              ; 66F4   0270
        MVII    #$0005, R0                      ; 66F5   02B8 0005
L_66F7:
        MVI@    R5,     R2                      ; 66F7   02AA
        SLL     R2,     2                       ; 66F8   004E
        SLL     R2,     2                       ; 66F9   004E
        XOR@    R4,     R2                      ; 66FA   03E2
        MVO@    R2,     R3                      ; 66FB   025A
        INCR    R3                              ; 66FC   000B
        DECR    R0                              ; 66FD   0010
        BNEQ    L_66F7                          ; 66FE   022C 0008

        PULR    R0                              ; 6700   02B0
        ADDI    #$0003, R3                      ; 6701   02FB 0003
        DECR    R0                              ; 6703   0010
        BNEQ    L_66E2                          ; 6704   022C 0023

        CMPI    #$0130, R1                      ; 6706   0379 0130
        BGT     L_6710                          ; 6708   020E 0006

        MVII    #$0130, R1                      ; 670A   02B9 0130
        MVII    #$0003, R0                      ; 670C   02B8 0003
        B       L_66E2                          ; 670E   0220 002D
L_6710:
        PULR    R7                              ; 6710   02B7

        PSHR    R0                              ; 6711   0270
        PSHR    R1                              ; 6712   0271
        NOP                                     ; 6713   0034
        PSHR    R2                              ; 6714   0272
        PSHR    R3                              ; 6715   0273
        PSHR    R4                              ; 6716   0274
        MVI     G_0330, R3                      ; 6717   0283 0330
        ADDI    #$0004, R3                      ; 6719   02FB 0004
        MVI@    R3,     R0                      ; 671B   0298
        PSHR    R0                              ; 671C   0270
        SUBI    #$0004, R3                      ; 671D   033B 0004
        MVI@    R5,     R1                      ; 671F   02A9
        MVI@    R5,     R0                      ; 6720   02A8
        MVI     G_013F, R4                      ; 6721   0284 013F
        TSTR    R4                              ; 6723   00A4
        BNEQ    L_673A                          ; 6724   020C 0014

L_6726:
        ADDR    R0,     R3                      ; 6726   00C3
L_6727:
        ADD@    R3,     R1                      ; 6727   02D9
        CMPI    #$0009, R1                      ; 6728   0379 0009
        BGT     L_672F                          ; 672A   020E 0003

        MVO@    R1,     R3                      ; 672C   0259
        B       L_673A                          ; 672D   0200 000B

L_672F:
        SUBI    #$000A, R1                      ; 672F   0339 000A
        MVO@    R1,     R3                      ; 6731   0259
        MVII    #$0001, R1                      ; 6732   02B9 0001
        INCR    R3                              ; 6734   000B
        INCR    R0                              ; 6735   0008
        CMPI    #$0006, R0                      ; 6736   0378 0006
        BNEQ    L_6727                          ; 6738   022C 0012

L_673A:
        MVI     G_0330, R3                      ; 673A   0283 0330
        ADDI    #$0004, R3                      ; 673C   02FB 0004
        MVI@    R3,     R0                      ; 673E   0298
        CMP@    R6,     R0                      ; 673F   0370
        BEQ     L_674D                          ; 6740   0204 000B

        ADDI    #$0002, R3                      ; 6742   02FB 0002
        MVI@    R3,     R0                      ; 6744   0298
        INCR    R0                              ; 6745   0008
        MVO@    R0,     R3                      ; 6746   0258
        PSHR    R5                              ; 6747   0275

        JSR     R5,     L_66B7                  ; 6748   0004 0164 02B7
        DECLE   $0000                           ; 674B   0000

        PULR    R5                              ; 674C   02B5
L_674D:
        PULR    R4                              ; 674D   02B4
        PULR    R3                              ; 674E   02B3
        PULR    R2                              ; 674F   02B2
        PULR    R1                              ; 6750   02B1
        PULR    R0                              ; 6751   02B0
        MOVR    R5,     R7                      ; 6752   00AF

        PSHR    R5                              ; 6753   0275

        JSR     R5,     L_66B7                  ; 6754   0004 0164 02B7

        CLRC                                    ; 6757   0006
        MVI     G_0326, R0                      ; 6758   0280 0326
        XORI    #$0180, R0                      ; 675A   03F8 0180
        ADDI    #$0004, R0                      ; 675C   02F8 0004
        MOVR    R0,     R1                      ; 675E   0081
        ANDI    #$007F, R1                      ; 675F   03B9 007F
        CMPI    #$0060, R1                      ; 6761   0379 0060
        BLE     L_6767                          ; 6763   0206 0002

        SUBI    #$0004, R0                      ; 6765   0338 0004
L_6767:
        MVO     R0,     G_0326                  ; 6767   0240 0326
        CLRR    R0                              ; 6769   01C0
        MVO     R0,     G_031D                  ; 676A   0240 031D
        MVII    #$0020, R0                      ; 676C   02B8 0020
L_676E:
        INCR    R1                              ; 676E   0009
        DECLE   $03B9,  $0003,  $008C,  $0001   ; 676F   03B9 0003 008C 0001
        DECLE   $02FC,  $003E,  $0078,  $0282   ; 6773   02FC 003E 0078 0282
        DECLE   $032E,  $0001,  $03BA,  $0007   ; 6777   032E 0001 03BA 0007
        DECLE   $0018,  $03E2,  $0242,  $032E   ; 677B   0018 03E2 0242 032E
        DECLE   $02BC,  $0002,  $0004,  $0175   ; 677F   02BC 0002 0004 0175
        DECLE   $01B6,  $0282,  $0124,  $037A   ; 6783   01B6 0282 0124 037A
        DECLE   $0002,  $022C,  $0008,  $01D2   ; 6787   0002 022C 0008 01D2
        DECLE   $0242,  $0124,  $0014,  $022C   ; 678B   0242 0124 0014 022C
        DECLE   $000E                           ; 678F   000E

        DECR    R0                              ; 6790   0010
        BNEQ    L_676E                          ; 6791   022C 0024

        MVO     R0,     G_031E                  ; 6793   0240 031E
        MVO     R0,     G_0326                  ; 6795   0240 0326
        NOP                                     ; 6797   0034
        MVO     R0,     G_031F                  ; 6798   0240 031F
        MVO     R0,     G_0327                  ; 679A   0240 0327
        SDBD                                    ; 679C   0001
        MVII    #$0818, R0                      ; 679D   02B8 0018 0008
        MVI     G_0344, R1                      ; 67A0   0281 0344
        SDBD                                    ; 67A2   0001
        ANDI    #$1007, R1                      ; 67A3   03B9 0007 0010
        SDBD                                    ; 67A6   0001
        XORI    #$1000, R1                      ; 67A7   03F9 0000 0010
        XORR    R1,     R0                      ; 67AA   01C8
        MVO     R0,     G_032E                  ; 67AB   0240 032E
        MVII    #$0208, R3                      ; 67AD   02BB 0208
        MVII    #$0110, R4                      ; 67AF   02BC 0110
        MVII    #$0214, R1                      ; 67B1   02B9 0214
L_67B3:
        MVII    #$0005, R0                      ; 67B3   02B8 0005
        DECLE   $0004                           ; 67B5   0004

        CMPR    R6,     R5                      ; 67B6   0175
        ANDR    R6,     R6                      ; 67B7   01B6
        CMPI    #$0002, R0                      ; 67B8   0378 0002
        BGT     L_67C1                          ; 67BA   020E 0005

        CLRR    R2                              ; 67BC   01D2
        MVO     R2,     G_031E                  ; 67BD   0242 031E
        MVO     R2,     G_0326                  ; 67BF   0242 0326
L_67C1:
        MVI     G_0124, R2                      ; 67C1   0282 0124
        DECLE   $037A,  $0002,  $022C,  $0011   ; 67C3   037A 0002 022C 0011
        DECLE   $01D2,  $0242,  $0124,  $0010   ; 67C7   01D2 0242 0124 0010
        DECLE   $022C,  $0017,  $0089,  $020B   ; 67CB   022C 0017 0089 020B
        DECLE   $0066                           ; 67CF   0066
L_67D0:
        MVI@    R1,     R2                      ; 67D0   028A
        TSTR    R2                              ; 67D1   0092
        BPL     L_67DA                          ; 67D2   0203 0006

        MVI     G_0344, R2                      ; 67D4   0282 0344
        XORI    #$0018, R2                      ; 67D6   03FA 0018
        B       L_67FB                          ; 67D8   0200 0021

L_67DA:
        ANDI    #$0060, R2                      ; 67DA   03BA 0060
        DECLE   $0204,  $0011,  $037A,  $0060   ; 67DC   0204 0011 037A 0060
        DECLE   $0204,  $000D,  $03CA,  $03FA   ; 67E0   0204 000D 03CA 03FA
        DECLE   $0060,  $024A,  $0243,  $031E   ; 67E4   0060 024A 0243 031E
        DECLE   $00A0,  $0338,  $0004,  $0240   ; 67E8   00A0 0338 0004 0240
        DECLE   $0326,  $0200,  $0011           ; 67EC   0326 0200 0011

        MVI@    R1,     R2                      ; 67EF   028A
        ANDI    #$0018, R2                      ; 67F0   03BA 0018
        BEQ     L_6816                          ; 67F2   0204 0022

        CMPI    #$0018, R2                      ; 67F4   037A 0018
        BEQ     L_6816                          ; 67F6   0204 001E

        XOR@    R1,     R2                      ; 67F8   03CA
        XORI    #$0018, R2                      ; 67F9   03FA 0018
L_67FB:
        MVO@    R2,     R1                      ; 67FB   024A
        DECLE   $0243,  $031E,  $0244,  $0326   ; 67FC   0243 031E 0244 0326
        DECLE   $0004,  $0174,  $0311,  $0005   ; 6800   0004 0174 0311 0005
        DECLE   $0000                           ; 6804   0000

        PSHR    R0                              ; 6805   0270
        PSHR    R1                              ; 6806   0271
        PSHR    R2                              ; 6807   0272
        NOP                                     ; 6808   0034
        PSHR    R3                              ; 6809   0273
        PSHR    R4                              ; 680A   0274

        JSR     R5,     L_66B7                  ; 680B   0004 0164 02B7
        DECLE   $0005                           ; 680E   0005

        PULR    R4                              ; 680F   02B4
        PULR    R3                              ; 6810   02B3
        PULR    R2                              ; 6811   02B2
        PULR    R1                              ; 6812   02B1
        PULR    R0                              ; 6813   02B0
        B       L_67B3                          ; 6814   0220 0062

L_6816:
        CMPI    #$02EF, R1                      ; 6816   0379 02EF
        DECLE   $020C,  $000A,  $01DB,  $01E4   ; 6818   020C 000A 01DB 01E4
        DECLE   $0001,  $02B9,  $00FF,  $00FF   ; 681C   0001 02B9 00FF 00FF
        DECLE   $02B8,  $001E,  $0220,  $006E   ; 6820   02B8 001E 0220 006E

        CMPI    #$02DC, R1                      ; 6824   0379 02DC
        BLT     L_6830                          ; 6826   0205 0008

        SUBI    #$00C7, R1                      ; 6828   0339 00C7
        SUBI    #$0050, R4                      ; 682A   033C 0050
        ADDI    #$0008, R3                      ; 682C   02FB 0008
        B       L_67D0                          ; 682E   0220 005F

L_6830:
        ADDI    #$0014, R1                      ; 6830   02F9 0014
        ADDI    #$0008, R4                      ; 6832   02FC 0008
        B       L_67D0                          ; 6834   0220 0065

        DECLE   $0004,  $0170,  $02FD,  $02BE   ; 6836   0004 0170 02FD 02BE
        DECLE   $02F0,  $0004,  $0370,  $0075   ; 683A   02F0 0004 0370 0075
        DECLE   $01D0,  $01E0,  $01D0,  $01F0   ; 683E   01D0 01E0 01D0 01F0
        DECLE   $0007,  $0005,  $0005,  $0005   ; 6842   0007 0005 0005 0005
        DECLE   $0007,  $0002,  $0006,  $0002   ; 6846   0007 0002 0006 0002
        DECLE   $0002,  $0007,  $0007,  $0001   ; 684A   0002 0007 0007 0001
        DECLE   $0007,  $0004,  $0007,  $0007   ; 684E   0007 0004 0007 0007
        DECLE   $0001,  $0003,  $0001,  $0007   ; 6852   0001 0003 0001 0007
        DECLE   $0005,  $0005,  $0007,  $0001   ; 6856   0005 0005 0007 0001
        DECLE   $0001,  $0007,  $0004,  $0007   ; 685A   0001 0007 0004 0007
        DECLE   $0001,  $0007,  $0007,  $0004   ; 685E   0001 0007 0007 0004
        DECLE   $0007,  $0005,  $0007,  $0007   ; 6862   0007 0005 0007 0007
        DECLE   $0001,  $0002,  $0002,  $0002   ; 6866   0001 0002 0002 0002
        DECLE   $0007,  $0005,  $0007,  $0005   ; 686A   0007 0005 0007 0005
        DECLE   $0007,  $0007,  $0005,  $0007   ; 686E   0007 0007 0005 0007
        DECLE   $0001,  $0007,  $0275,  $0004   ; 6872   0001 0007 0275 0004
        DECLE   $0168,  $0264,  $0005,  $0004   ; 6876   0168 0264 0005 0004

        CMPR    R5,     R0                      ; 687A   0168
        MVO@    R4,     R4                      ; 687B   0264
        INCR    R0                              ; 687C   0008
        MVI     G_0169, R0                      ; 687D   0280 0169
        DECR    R0                              ; 687F   0010
        SLR     R0,     1                       ; 6880   0060
L_6881:
        CMPI    #$0001, R0                      ; 6881   0378 0001
        BLE     L_68D2                          ; 6883   0206 004D

        MVI     G_0141, R0                      ; 6885   0280 0141
        DECR    R0                              ; 6887   0010
        MVO     R0,     G_0141                  ; 6888   0240 0141
        BPL     L_68D2                          ; 688A   0203 0046

        JSR     R5,     L_6A8F                  ; 688C   0004 0168 028F
        DECLE   $03B8,  $0007,  $0240,  $0141   ; 688F   03B8 0007 0240 0141
        DECLE   $0004                           ; 6893   0004

        CMPR    R7,     R0                      ; 6894   0178
        MVI@    R3,     R0                      ; 6895   0298
        BC      L_6925                          ; 6896   0201 008D

        MVII    #$0014, R4                      ; 6898   02BC 0014

        JSR     R5,     L_6A8F                  ; 689A   0004 0168 028F

        ANDI    #$0007, R0                      ; 689D   03B8 0007
        SLL     R0,     2                       ; 689F   004C
        SLL     R0,     1                       ; 68A0   0048
        ADDR    R0,     R4                      ; 68A1   00C4
        MVII    #$0300, R1                      ; 68A2   02B9 0300
        MVII    #$0002, R2                      ; 68A4   02BA 0002

        JSR     R5,     L_6A8F                  ; 68A6   0004 0168 028F

        ANDI    #$0001, R0                      ; 68A9   03B8 0001
        BNEQ    L_68B4                          ; 68AB   020C 0007

        NEGR    R2                              ; 68AD   0022
        SDBD                                    ; 68AE   0001
        XORI    #$0400, R4                      ; 68AF   03FC 0000 0004
        ADDI    #$00A8, R1                      ; 68B2   02F9 00A8
L_68B4:
        MVO@    R1,     R3                      ; 68B4   0259
        DECLE   $02FB,  $0008,  $025C,  $02FB   ; 68B5   02FB 0008 025C 02FB
        DECLE   $0008,  $02B8,  $0024,  $004C   ; 68B9   0008 02B8 0024 004C
        DECLE   $00C0,  $0001,  $03F8,  $0006   ; 68BD   00C0 0001 03F8 0006
        DECLE   $0008,  $0258,  $0242,  $0140   ; 68C1   0008 0258 0242 0140
        DECLE   $0004,  $0168,  $0242,  $0004   ; 68C5   0004 0168 0242 0004
        DECLE   $0004                           ; 68C9   0004

        JSR     R5,     L_66B7                  ; 68CA   0004 0164 02B7
        DECLE   $0004                           ; 68CD   0004

        CLRR    R0                              ; 68CE   01C0
        MVO     R0,     G_0144                  ; 68CF   0240 0144
        PULR    R7                              ; 68D1   02B7

L_68D2:
        CLRR    R0                              ; 68D2   01C0
        DECLE   $0240,  $0144,  $0280,  $01F8   ; 68D3   0240 0144 0280 01F8
        DECLE   $03B8,  $00FB,  $03F8,  $0004   ; 68D7   03B8 00FB 03F8 0004
        DECLE   $0240,  $01F8,  $0280,  $0169   ; 68DB   0240 01F8 0280 0169
        DECLE   $0010,  $0204,  $0043,  $0280   ; 68DF   0010 0204 0043 0280
        DECLE   $0147,  $0080,  $0204,  $003E   ; 68E3   0147 0080 0204 003E
        DECLE   $0280,  $0332,  $0340,  $0331   ; 68E7   0280 0332 0340 0331
        DECLE   $020E,  $0038,  $0004           ; 68EB   020E 0038 0004

        CMPR    R7,     R0                      ; 68EE   0178
        MVI@    R3,     R0                      ; 68EF   0298
        BC      L_6925                          ; 68F0   0201 0033

        MVI     G_013F, R0                      ; 68F2   0280 013F
        TSTR    R0                              ; 68F4   0080
        BNEQ    L_68FB                          ; 68F5   020C 0004

        MVII    #$000F, R0                      ; 68F7   02B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 68F9   0240 01FD

L_68FB:
        JSR     R5,     L_6A8F                  ; 68FB   0004 0168 028F
        DECLE   $03B8,  $001F,  $0378,  $0013   ; 68FE   03B8 001F 0378 0013
        DECLE   $022E,  $0008,  $004C,  $00C0   ; 6902   022E 0008 004C 00C0
        DECLE   $02F8,  $0308,  $0258,  $02FB   ; 6906   02F8 0308 0258 02FB
        DECLE   $0008,  $02B8,  $000C,  $0258   ; 690A   0008 02B8 000C 0258
        DECLE   $02FB,  $0008,  $02B8,  $0025   ; 690E   02FB 0008 02B8 0025
        DECLE   $004C,  $00C0,  $03C0,  $0344   ; 6912   004C 00C0 03C0 0344
        DECLE   $0001,  $03F8,  $0000,  $0010   ; 6916   0001 03F8 0000 0010
        DECLE   $0258,  $02B8,  $0001,  $0240   ; 691A   0258 02B8 0001 0240
        DECLE   $0143,  $0004,  $0168,  $0242   ; 691E   0143 0004 0168 0242
        DECLE   $0002,  $0005                   ; 6922   0002 0005

        PULR    R7                              ; 6924   02B7

L_6925:
        JSR     R5,     L_6A8F                  ; 6925   0004 0168 028F

        ANDI    #$003F, R0                      ; 6928   03B8 003F
        BEQ     L_6925                          ; 692A   0224 0006

        JSR     R5,     L_6A43                  ; 692C   0004 0168 0243
        DECLE   $0008,  $0004,  $0168,  $0264   ; 692F   0008 0004 0168 0264
        DECLE   $0004                           ; 6933   0004

        PULR    R7                              ; 6934   02B7

        DECLE   $0004,  $0178,  $0283,  $0004   ; 6935   0004 0178 0283 0004
        DECLE   $0164,  $0296,  $0004,  $0004   ; 6939   0164 0296 0004 0004
        DECLE   $0168,  $0264,  $0004,  $0220   ; 693D   0168 0264 0004 0220
        DECLE   $006F,  $0275,  $01C9,  $0004   ; 6941   006F 0275 01C9 0004

        CMPR    R7,     R0                      ; 6945   0178
        B       L_6726                          ; 6946   0220 0221

        DECLE   $0010,  $02BB,  $0318,  $02C3   ; 6948   0010 02BB 0318 02C3
        DECLE   $0142,  $0298,  $02C0,  $0140   ; 694C   0142 0298 02C0 0140
        DECLE   $03B8,  $00FF,  $0081,  $03F8   ; 6950   03B8 00FF 0081 03F8
        DECLE   $0300,  $0258,  $0089,  $0224   ; 6954   0300 0258 0089 0224
        DECLE   $0023,  $0379,  $00A8,  $0224   ; 6958   0023 0379 00A8 0224
        DECLE   $0027,  $03B8,  $0007,  $020C   ; 695C   0027 03B8 0007 020C
        DECLE   $0025,  $02FB,  $0008,  $0298   ; 6960   0025 02FB 0008 0298
        DECLE   $03B8,  $007F,  $0064,  $0060   ; 6964   03B8 007F 0064 0060
        DECLE   $0010,  $004C,  $0270,  $004C   ; 6968   0010 004C 0270 004C
        DECLE   $02F0,  $0065,  $0061,  $02F9   ; 696C   02F0 0065 0061 02F9
        DECLE   $01FF,  $00C1,  $0288,  $03B8   ; 6970   01FF 00C1 0288 03B8
        DECLE   $0018,  $0204,  $000F           ; 6974   0018 0204 000F

        MVI@    R1,     R5                      ; 6977   028D
        ANDI    #$0060, R5                      ; 6978   03BD 0060
        BEQ     L_6981                          ; 697A   0204 0005

        MVI     G_0332, R5                      ; 697C   0285 0332
        DECR    R5                              ; 697E   0015
        MVO     R5,     G_0332                  ; 697F   0245 0332
L_6981:
        SDBD                                    ; 6981   0001
        DECLE   $03F8,  $0006,  $0088,  $0248   ; 6982   03F8 0006 0088 0248
        DECLE   $0004,  $0168,  $0242,  $0001   ; 6986   0004 0168 0242 0001
        DECLE   $0004,  $02B7,  $0275,  $02B9   ; 698A   0004 02B7 0275 02B9
        DECLE   $0001,  $0004,  $0178,  $0220   ; 698E   0001 0004 0178 0220
        DECLE   $0209,  $0009,  $0280,  $0143   ; 6992   0209 0009 0280 0143
        DECLE   $0008,  $0378,  $0002,  $022C   ; 6996   0008 0378 0002 022C
        DECLE   $0125                           ; 699A   0125

        MVO     R0,     G_0143                  ; 699B   0240 0143
        MVII    #$0318, R3                      ; 699D   02BB 0318
        ADD     G_0142, R3                      ; 699F   02C3 0142
        ADDI    #$0008, R3                      ; 69A1   02FB 0008
        MVI@    R3,     R0                      ; 69A3   0298
        XORI    #$0080, R0                      ; 69A4   03F8 0080
        SLL     R0,     2                       ; 69A6   004C
        ADDR    R0,     R0                      ; 69A7   00C0
        SUB@    R3,     R0                      ; 69A8   0318
        MVO     R0,     .PSG0.chn_c_lo          ; 69A9   0240 01F2
        SWAP    R0,     1                       ; 69AB   0040
        MVO     R0,     .PSG0.chn_c_hi          ; 69AC   0240 01F6
        MVI     .PSG0.chan_enable,R0            ; 69AE   0280 01F8
        ANDI    #$00FB, R0                      ; 69B0   03B8 00FB
        MVO     R0,     .PSG0.chan_enable       ; 69B2   0240 01F8
        MVI@    R3,     R0                      ; 69B4   0298
        MOVR    R0,     R1                      ; 69B5   0081
        ANDI    #$007F, R1                      ; 69B6   03B9 007F
        MVI     G_0143, R5                      ; 69B8   0285 0143
        ADDR    R5,     R0                      ; 69BA   00E8
        ADDR    R5,     R0                      ; 69BB   00E8
        CMPI    #$0002, R5                      ; 69BC   037D 0002
        BNEQ    L_69C7                          ; 69BE   020C 0007

        MOVR    R0,     R5                      ; 69C0   0085
        ANDI    #$0003, R5                      ; 69C1   03BD 0003
        BEQ     L_69C7                          ; 69C3   0204 0002

        INCR    R0                              ; 69C5   0008
        INCR    R0                              ; 69C6   0008
L_69C7:
        MVO@    R0,     R3                      ; 69C7   0258
        DECLE   $0081,  $03B9,  $0003,  $020C   ; 69C8   0081 03B9 0003 020C
        DECLE   $004D,  $03B8,  $007F,  $0338   ; 69CC   004D 03B8 007F 0338
        DECLE   $0004,  $0378,  $0060,  $0206   ; 69D0   0004 0378 0060 0206
        DECLE   $000A,  $01C0,  $0258,  $033B   ; 69D4   000A 01C0 0258 033B
        DECLE   $0008,  $0258,  $0004,  $0178   ; 69D8   0008 0258 0004 0178
        DECLE   $0283,  $0220,  $0169,  $0378   ; 69DC   0283 0220 0169 0378
        DECLE   $0060,  $0204,  $0037           ; 69E0   0060 0204 0037

        MOVR    R0,     R5                      ; 69E3   0085
        DECR    R0                              ; 69E4   0010
        SLR     R0,     2                       ; 69E5   0064
        SLR     R0,     1                       ; 69E6   0060
        SLL     R0,     2                       ; 69E7   004C
        PSHR    R0                              ; 69E8   0270
L_69E9:
        SLL     R0,     2                       ; 69E9   004C
        ADD@    R6,     R0                      ; 69EA   02F0
        SUBI    #$0008, R3                      ; 69EB   033B 0008
        MVI@    R3,     R1                      ; 69ED   0299
        ANDI    #$00FF, R1                      ; 69EE   03B9 00FF
        SLR     R1,     2                       ; 69F0   0065
        SLR     R1,     1                       ; 69F1   0061
        ADDR    R0,     R1                      ; 69F2   00C1
        ADDI    #$01FF, R1                      ; 69F3   02F9 01FF
        MVI@    R1,     R0                      ; 69F5   0288
        MVII    #$0018, R2                      ; 69F6   02BA 0018
        ANDI    #$0004, R5                      ; 69F8   03BD 0004
        BEQ     L_69FD                          ; 69FA   0204 0001

        SLL     R2,     2                       ; 69FC   004E
L_69FD:
        ANDR    R2,     R0                      ; 69FD   0190
        DECLE   $020C,  $001A,  $0288,  $0001   ; 69FE   020C 001A 0288 0001
        DECLE   $03B8,  $0007,  $0010,  $0378   ; 6A02   03B8 0007 0010 0378
        DECLE   $0006,  $0204,  $0011,  $0004   ; 6A06   0006 0204 0011 0004
        DECLE   $0168,  $028F,  $03B8,  $0018   ; 6A0A   0168 028F 03B8 0018
        DECLE   $020C,  $000A,  $0090,  $0018   ; 6A0E   020C 000A 0090 0018
        DECLE   $0388,  $01D0,  $0248,  $0280   ; 6A12   0388 01D0 0248 0280
        DECLE   $0332,  $0008,  $0240,  $0332   ; 6A16   0332 0008 0240 0332
        DECLE   $0004,  $0168,  $0242,  $0001   ; 6A1A   0004 0168 0242 0001
        DECLE   $0005,  $02B7,  $0275,  $0283   ; 6A1E   0005 02B7 0275 0283
        DECLE   $0144,  $009B,  $020C,  $0058   ; 6A22   0144 009B 020C 0058
        DECLE   $02BB,  $017E,  $02C3,  $0142   ; 6A26   02BB 017E 02C3 0142
        DECLE   $029A,  $03BA,  $0080,  $0204   ; 6A2A   029A 03BA 0080 0204
        DECLE   $0021,  $029A,  $03FA,  $0080   ; 6A2E   0021 029A 03FA 0080
        DECLE   $025A,  $0089,  $020C,  $0007   ; 6A32   025A 0089 020C 0007
        DECLE   $0004,  $0174,  $0311,  $0001   ; 6A36   0004 0174 0311 0001
        DECLE   $0003,  $0200,  $000A           ; 6A3A   0003 0200 000A
L_6A3D:
        MVI     G_0143, R0                      ; 6A3D   0280 0143
        DECLE   $0010,  $0204,  $0008,  $0004   ; 6A3F   0010 0204 0008 0004
L_6A43:
        CMPR    R6,     R4                      ; 6A43   0174
L_6A44:
        SUB@    R2,     R1                      ; 6A44   0311
        DECLE   $0002,  $0002,  $0004,  $0178   ; 6A45   0002 0002 0004 0178
        DECLE   $0283,  $02BB,  $0001           ; 6A49   0283 02BB 0001

        MVO     R3,     G_0144                  ; 6A4C   0243 0144
        SETC                                    ; 6A4E   0007
        PULR    R7                              ; 6A4F   02B7

        TSTR    R1                              ; 6A50   0089
        BEQ     L_6A7E                          ; 6A51   0204 002B

        SUBI    #$017E, R3                      ; 6A53   033B 017E
        ADDI    #$0318, R3                      ; 6A55   02FB 0318
        MVI@    R3,     R5                      ; 6A57   029D
        ANDI    #$00FF, R5                      ; 6A58   03BD 00FF
        MVI     G_031F, R0                      ; 6A5A   0280 031F
        ANDI    #$00FF, R0                      ; 6A5C   03B8 00FF
        SUBR    R0,     R5                      ; 6A5E   0105
        CMPI    #$0003, R5                      ; 6A5F   037D 0003
        BGT     L_6A7E                          ; 6A61   020E 001B

        SDBD                                    ; 6A63   0001
        CMPI    #$FFFE, R5                      ; 6A64   037D 00FE 00FF
        BLT     L_6A7E                          ; 6A67   0205 0015

        ADDI    #$0008, R3                      ; 6A69   02FB 0008
        MVI@    R3,     R5                      ; 6A6B   029D
        MVI     G_0327, R0                      ; 6A6C   0280 0327
        ANDI    #$007F, R0                      ; 6A6E   03B8 007F
        ANDI    #$007F, R5                      ; 6A70   03BD 007F
        CMPR    R5,     R0                      ; 6A72   0168
        BGT     L_6A7E                          ; 6A73   020E 0009

L_6A75:
        CLRR    R0                              ; 6A75   01C0
        MVO     R0,     G_0148                  ; 6A76   0240 0148
        MVO     R0,     G_0145                  ; 6A78   0240 0145
        MVO     R0,     G_031F                  ; 6A7A   0240 031F
L_6A7C:
        B       L_6A3D                          ; 6A7C   0220 0040

L_6A7E:
        CLRR    R3                              ; 6A7E   01DB
        MVO     R3,     G_0144                  ; 6A7F   0243 0144
        CLRC                                    ; 6A81   0006
        PULR    R7                              ; 6A82   02B7

        CLRR    R0                              ; 6A83   01C0
        MVI     G_0142, R1                      ; 6A84   0281 0142
        ADDI    #$0318, R1                      ; 6A86   02F9 0318
        MVO@    R0,     R1                      ; 6A88   0248
        INCR    R0                              ; 6A89   0008
        SUBI    #$0318, R1                      ; 6A8A   0339 0318
L_6A8C:
        TSTR    R1                              ; 6A8C   0089
        BEQ     L_6A93                          ; 6A8D   0204 0004

L_6A8F:
        SLL     R0,     1                       ; 6A8F   0048
        DECR    R1                              ; 6A90   0011
        B       L_6A8C                          ; 6A91   0220 0006

L_6A93:
        XOR     G_0164, R0                      ; 6A93   03C0 0164
        MVO     R0,     G_0164                  ; 6A95   0240 0164
        MOVR    R5,     R7                      ; 6A97   00AF

        PSHR    R5                              ; 6A98   0275
        MVI     G_0164, R0                      ; 6A99   0280 0164
        MVII    #$0010, R1                      ; 6A9B   02B9 0010
        MVII    #$0004, R3                      ; 6A9D   02BB 0004
L_6A9F:
        MOVR    R1,     R2                      ; 6A9F   008A
        ANDR    R0,     R2                      ; 6AA0   0182
        BNEQ    L_6AA9                          ; 6AA1   020C 0006

        DECR    R3                              ; 6AA3   0013
        SLR     R1,     1                       ; 6AA4   0061
        BNEQ    L_6A9F                          ; 6AA5   022C 0007

        SETC                                    ; 6AA7   0007
        PULR    R7                              ; 6AA8   02B7

L_6AA9:
        XOR     G_0164, R1                      ; 6AA9   03C1 0164
        MVO     R1,     G_0164                  ; 6AAB   0241 0164
        MVO     R3,     G_0142                  ; 6AAD   0243 0142
        ADDI    #$0318, R3                      ; 6AAF   02FB 0318
        CLRC                                    ; 6AB1   0006
        PULR    R7                              ; 6AB2   02B7

        PSHR    R5                              ; 6AB3   0275
        MVI     G_0148, R0                      ; 6AB4   0280 0148
        TSTR    R0                              ; 6AB6   0080
        BEQ     L_6AEC                          ; 6AB7   0204 0033

        MVI     .STIC.C.7,R0                    ; 6AB9   0280 001F
        MVO     R0,     G_0333                  ; 6ABB   0240 0333
        ANDI    #$013F, R0                      ; 6ABD   03B8 013F
        BEQ     L_6ACF                          ; 6ABF   0204 000E

        MVI     G_0327, R0                      ; 6AC1   0280 0327
        MVO     R0,     G_0149                  ; 6AC3   0240 0149
        SDBD                                    ; 6AC5   0001
        ANDI    #$0F80, R0                      ; 6AC6   03B8 0080 000F
        MVO     R0,     G_0327                  ; 6AC9   0240 0327
        CLRR    R0                              ; 6ACB   01C0
        MVO     R0,     G_0148                  ; 6ACC   0240 0148
        PULR    R7                              ; 6ACE   02B7

L_6ACF:
        MVI     G_0327, R0                      ; 6ACF   0280 0327
        DECLE   $0338,  $0004,  $0240,  $0327   ; 6AD1   0338 0004 0240 0327
        DECLE   $0240,  $000F,  $03B8,  $007F   ; 6AD5   0240 000F 03B8 007F
        DECLE   $0378,  $0008,  $020C,  $000F   ; 6AD9   0378 0008 020C 000F
        DECLE   $0280,  $000F,  $0001,  $03B8   ; 6ADD   0280 000F 0001 03B8
        DECLE   $0080,  $000F                   ; 6AE1   0080 000F

        MVO     R0,     G_0327                  ; 6AE3   0240 0327
        MVO     R0,     .STIC.Y.7               ; 6AE5   0240 000F
        CLRR    R0                              ; 6AE7   01C0
        MVO     R0,     G_0145                  ; 6AE8   0240 0145
        MVO     R0,     G_0148                  ; 6AEA   0240 0148
L_6AEC:
        PULR    R7                              ; 6AEC   02B7

        PSHR    R5                              ; 6AED   0275
        MVI     G_0184, R0                      ; 6AEE   0280 0184
        ANDI    #$003F, R0                      ; 6AF0   03B8 003F
        BNEQ    L_6B34                          ; 6AF2   020C 0040

        MVI     G_0145, R1                      ; 6AF4   0281 0145
        INCR    R1                              ; 6AF6   0009
        ADDR    R7,     R1                      ; 6AF7   00F9
        ADD@    R1,     R7                      ; 6AF8   02CF

        XORR    R4,     R2                      ; 6AF9   01E2
        DIS                                     ; 6AFA   0003
L_6AFB:
        ADCR    R0                              ; 6AFB   0028
L_6AFC:
        MVI     G_031E, R1                      ; 6AFC   0281 031E
        ANDI    #$00FF, R1                      ; 6AFE   03B9 00FF
        MVII    #$0300, R0                      ; 6B00   02B8 0300
        ADDR    R0,     R1                      ; 6B02   00C1
        MVI     G_0326, R2                      ; 6B03   0282 0326
        MVO     R2,     G_014A                  ; 6B05   0242 014A
        MVI     G_0327, R0                      ; 6B07   0280 0327
        ADDI    #$0004, R2                      ; 6B09   02FA 0004
        ANDI    #$007C, R2                      ; 6B0B   03BA 007C
        SDBD                                    ; 6B0D   0001
        ANDI    #$FF80, R0                      ; 6B0E   03B8 0080 00FF
        ADDR    R0,     R2                      ; 6B11   00C2
        MVO     R1,     G_031F                  ; 6B12   0241 031F
        MVO     R2,     G_0327                  ; 6B14   0242 0327
        MVII    #$0002, R0                      ; 6B16   02B8 0002
        MVO     R0,     G_0145                  ; 6B18   0240 0145
        MVO     R0,     G_0148                  ; 6B1A   0240 0148

        JSR     R5,     L_66B7                  ; 6B1C   0004 0164 02B7

        EIS                                     ; 6B1F   0002
        PULR    R7                              ; 6B20   02B7

        DECLE   $0280,  $0333,  $03B8,  $001F   ; 6B21   0280 0333 03B8 001F
        DECLE   $020C,  $001B,  $0280,  $0333   ; 6B25   020C 001B 0280 0333
        DECLE   $03B8,  $0020,  $020C,  $0007   ; 6B29   03B8 0020 020C 0007
        DECLE   $0281,  $0333,  $03B9,  $0100   ; 6B2D   0281 0333 03B9 0100
        DECLE   $020C,  $0174                   ; 6B31   020C 0174

        PULR    R7                              ; 6B33   02B7

L_6B34:
        CLRR    R0                              ; 6B34   01C0
        MVO     R0,     G_0145                  ; 6B35   0240 0145
        MVO     R0,     G_0148                  ; 6B37   0240 0148
        MVI     G_031F, R0                      ; 6B39   0280 031F
        SDBD                                    ; 6B3B   0001
        ANDI    #$FF00, R0                      ; 6B3C   03B8 0000 00FF
        MVO     R0,     G_031F                  ; 6B3F   0240 031F
        PULR    R7                              ; 6B41   02B7

L_6B42:
        CLRR    R2                              ; 6B42   01D2
        MVII    #$0001, R5                      ; 6B43   02BD 0001
L_6B45:
        MOVR    R5,     R4                      ; 6B45   00AC
        ANDR    R0,     R4                      ; 6B46   0184
        BNEQ    L_6B4D                          ; 6B47   020C 0004

        INCR    R2                              ; 6B49   000A
        ADDR    R5,     R5                      ; 6B4A   00ED
        B       L_6B45                          ; 6B4B   0220 0007

L_6B4D:
        XOR     G_0333, R5                      ; 6B4D   03C5 0333
        DECLE   $0245,  $0333,  $0093,  $02FB   ; 6B4F   0245 0333 0093 02FB
        DECLE   $0151,  $029D,  $037D,  $00FF   ; 6B53   0151 029D 037D 00FF
        DECLE   $0224,  $0024,  $02FA,  $0318   ; 6B57   0224 0024 02FA 0318
        DECLE   $0290,  $0001,  $03B8,  $00FF   ; 6B5B   0290 0001 03B8 00FF
        DECLE   $0006,  $0250,  $033A,  $0318   ; 6B5F   0006 0250 033A 0318
        DECLE   $00A9,  $0093,  $02FA,  $0151   ; 6B63   00A9 0093 02FA 0151
        DECLE   $0272,  $03B9,  $0080,  $020C   ; 6B67   0272 03B9 0080 020C
        DECLE   $00B7,  $0291,  $03F9,  $0080   ; 6B6B   00B7 0291 03F9 0080
        DECLE   $0251,  $03B9,  $0003,  $0379   ; 6B6F   0251 03B9 0003 0379
        DECLE   $0003,  $020C,  $002D,  $0291   ; 6B73   0003 020C 002D 0291
        DECLE   $03B9,  $0020,  $020C,  $0059   ; 6B77   03B9 0020 020C 0059
        DECLE   $02FB,  $0328,  $0299,  $02F9   ; 6B7B   02FB 0328 0299 02F9
        DECLE   $0020,  $0259,  $033B,  $0328   ; 6B7F   0020 0259 033B 0328
        DECLE   $0291,  $03B9,  $00FC,  $03F9   ; 6B83   0291 03B9 00FC 03F9
        DECLE   $0012,  $0251,  $02FB,  $015B   ; 6B87   0012 0251 02FB 015B
        DECLE   $0298,  $0378,  $00FF,  $020C   ; 6B8B   0298 0378 00FF 020C
        DECLE   $0007,  $0004,  $0174,  $0311   ; 6B8F   0007 0004 0174 0311
        DECLE   $0001                           ; 6B93   0001

        EIS                                     ; 6B94   0002
        B       L_6B9F                          ; 6B95   0200 0008

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6B97   0004 0174 0311 0001
        DECLE   $0001                           ; 6B9B   0001

        MVII    #$00FF, R0                      ; 6B9C   02B8 00FF
        MVO@    R0,     R3                      ; 6B9E   0258
L_6B9F:
        SUBI    #$015B, R3                      ; 6B9F   033B 015B
        B       L_6C66                          ; 6BA1   0200 00C3

        DECLE   $0281,  $031F,  $03B8,  $00FF   ; 6BA3   0281 031F 03B8 00FF
        DECLE   $03B9,  $00FF,  $0339,  $0004   ; 6BA7   03B9 00FF 0339 0004
        DECLE   $0141,  $020E,  $003C,  $0290   ; 6BAB   0141 020E 003C 0290
        DECLE   $03B8,  $0010,  $0204,  $0021   ; 6BAF   03B8 0010 0204 0021
        DECLE   $02FB,  $015B,  $0299,  $0379   ; 6BB3   02FB 015B 0299 0379
        DECLE   $00FF,  $020C,  $0007,  $0004   ; 6BB7   00FF 020C 0007 0004
        DECLE   $0174,  $0311,  $0001           ; 6BBB   0174 0311 0001

        EIS                                     ; 6BBE   0002
        B       L_6BC9                          ; 6BBF   0200 0008

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6BC1   0004 0174 0311 0001
        DECLE   $0001                           ; 6BC5   0001

        MVII    #$00FF, R1                      ; 6BC6   02B9 00FF
        MVO@    R1,     R3                      ; 6BC8   0259
L_6BC9:
        MVII    #$00FF, R1                      ; 6BC9   02B9 00FF
        MVO@    R1,     R3                      ; 6BCB   0259
        SUBI    #$015B, R3                      ; 6BCC   033B 015B
        MVI@    R2,     R0                      ; 6BCE   0290
        XORI    #$0008, R0                      ; 6BCF   03F8 0008
        MVO@    R0,     R2                      ; 6BD1   0250
        B       L_6BE2                          ; 6BD2   0200 000E

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6BD4   0004 0174 0311 0001
        DECLE   $0001                           ; 6BD8   0001

        INCR    R3                              ; 6BD9   000B
        ADDI    #$015B, R3                      ; 6BDA   02FB 015B
        MVII    #$00FF, R0                      ; 6BDC   02B8 00FF
        MVO@    R0,     R3                      ; 6BDE   0258
        SUBI    #$015B, R3                      ; 6BDF   033B 015B
        DECR    R3                              ; 6BE1   0013
L_6BE2:
        ADDI    #$0328, R3                      ; 6BE2   02FB 0328
        MVI@    R3,     R0                      ; 6BE4   0298
        XORI    #$0040, R0                      ; 6BE5   03F8 0040
        MVO@    R0,     R3                      ; 6BE7   0258
        B       L_6C66                          ; 6BE8   0200 007C

        DECLE   $0290,  $03B8,  $0010,  $020C   ; 6BEA   0290 03B8 0010 020C
        DECLE   $001E,  $02FB,  $015B,  $0299   ; 6BEE   001E 02FB 015B 0299
        DECLE   $0379,  $00FF,  $020C,  $0007   ; 6BF2   0379 00FF 020C 0007
        DECLE   $0004,  $0174,  $0311,  $0001   ; 6BF6   0004 0174 0311 0001

        EIS                                     ; 6BFA   0002
        B       L_6C05                          ; 6BFB   0200 0008

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6BFD   0004 0174 0311 0001
        DECLE   $0001                           ; 6C01   0001

        MVII    #$00FF, R1                      ; 6C02   02B9 00FF
        MVO@    R1,     R3                      ; 6C04   0259
L_6C05:
        SUBI    #$015B, R3                      ; 6C05   033B 015B
        MVI@    R2,     R0                      ; 6C07   0290
        XORI    #$0008, R0                      ; 6C08   03F8 0008
        MVO@    R0,     R2                      ; 6C0A   0250
        B       L_6C1B                          ; 6C0B   0200 000E

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6C0D   0004 0174 0311 0001
        DECLE   $0001                           ; 6C11   0001

        INCR    R3                              ; 6C12   000B
        ADDI    #$015B, R3                      ; 6C13   02FB 015B
        MVII    #$00FF, R0                      ; 6C15   02B8 00FF
        MVO@    R0,     R3                      ; 6C17   0258
        SUBI    #$015B, R3                      ; 6C18   033B 015B
        DECR    R3                              ; 6C1A   0013
L_6C1B:
        ADDI    #$0328, R3                      ; 6C1B   02FB 0328
        MVI@    R3,     R0                      ; 6C1D   0298
        XORI    #$0040, R0                      ; 6C1E   03F8 0040
        MVO@    R0,     R3                      ; 6C20   0258
        B       L_6C66                          ; 6C21   0200 0043

        DECLE   $02B8,  $00FF,  $0250,  $02FB   ; 6C23   02B8 00FF 0250 02FB
        DECLE   $015B,  $0298,  $0378,  $00FF   ; 6C27   015B 0298 0378 00FF
        DECLE   $020C,  $0007,  $0004,  $0174   ; 6C2B   020C 0007 0004 0174
        DECLE   $0311,  $0001                   ; 6C2F   0311 0001

        EIS                                     ; 6C31   0002
        B       L_6C39                          ; 6C32   0200 0005

        DECLE   $0004,  $0174,  $0311,  $0001   ; 6C34   0004 0174 0311 0001
        DECLE   $0001                           ; 6C38   0001
L_6C39:
        MVII    #$00FF, R0                      ; 6C39   02B8 00FF
        MVO@    R0,     R3                      ; 6C3B   0258
        INCR    R3                              ; 6C3C   000B
        MVO@    R0,     R3                      ; 6C3D   0258
        INCR    R2                              ; 6C3E   000A
        MVI@    R2,     R0                      ; 6C3F   0290
        ANDI    #$0003, R0                      ; 6C40   03B8 0003
        CMPI    #$0001, R0                      ; 6C42   0378 0001
        BGT     L_6C4B                          ; 6C44   020E 0005

        MVI@    R2,     R0                      ; 6C46   0290
        ANDI    #$00FC, R0                      ; 6C47   03B8 00FC
        ADDI    #$0002, R0                      ; 6C49   02F8 0002
L_6C4B:
        DECR    R2                              ; 6C4B   0012
        SUBI    #$0151, R2                      ; 6C4C   033A 0151
        ADDI    #$0318, R2                      ; 6C4E   02FA 0318
        CLRR    R0                              ; 6C50   01C0
        MVO@    R0,     R2                      ; 6C51   0250
        SUBI    #$0318, R2                      ; 6C52   033A 0318
        MVII    #$0001, R0                      ; 6C54   02B8 0001
L_6C56:
        TSTR    R2                              ; 6C56   0092
        BEQ     L_6C5D                          ; 6C57   0204 0004

        DECR    R2                              ; 6C59   0012
        SLL     R0,     1                       ; 6C5A   0048
        B       L_6C56                          ; 6C5B   0220 0006

L_6C5D:
        XOR     G_0164, R0                      ; 6C5D   03C0 0164
        MVO     R0,     G_0164                  ; 6C5F   0240 0164
        MVI     G_0147, R0                      ; 6C61   0280 0147
        INCR    R0                              ; 6C63   0008
        MVO     R0,     G_0147                  ; 6C64   0240 0147
L_6C66:
        PULR    R2                              ; 6C66   02B2
L_6C67:
        MVI@    R2,     R0                      ; 6C67   0290
        MVI     G_031F, R3                      ; 6C68   0283 031F
        ANDI    #$0010, R0                      ; 6C6A   03B8 0010
        BNEQ    L_6C72                          ; 6C6C   020C 0004

L_6C6E:
        ADDI    #$0005, R3                      ; 6C6E   02FB 0005
        B       L_6C74                          ; 6C70   0200 0002

L_6C72:
        SUBI    #$0005, R3                      ; 6C72   033B 0005
L_6C74:
        MVO     R3,     G_031F                  ; 6C74   0243 031F
        DECLE   $0004                           ; 6C76   0004

        CMPR    R7,     R4                      ; 6C77   017C
        ADDR    R7,     R3                      ; 6C78   00FB
        MVI@    R1,     R0                      ; 6C79   0288
        MVII    #$0018, R2                      ; 6C7A   02BA 0018
        MVI     G_0149, R3                      ; 6C7C   0283 0149
        ANDI    #$0004, R3                      ; 6C7E   03BB 0004
        BEQ     L_6C83                          ; 6C80   0204 0001

        SLL     R2,     2                       ; 6C82   004E
L_6C83:
        MOVR    R0,     R3                      ; 6C83   0083
        ANDR    R2,     R3                      ; 6C84   0193
        BNEQ    L_6C8C                          ; 6C85   020C 0005

        MVI     G_0332, R3                      ; 6C87   0283 0332
        INCR    R3                              ; 6C89   000B
        MVO     R3,     G_0332                  ; 6C8A   0243 0332
L_6C8C:
        COMR    R2                              ; 6C8C   001A
        ANDR    R2,     R0                      ; 6C8D   0190
        COMR    R2                              ; 6C8E   001A
        XORR    R2,     R0                      ; 6C8F   01D0
        MVO@    R0,     R1                      ; 6C90   0248
        MVI     G_0147, R0                      ; 6C91   0280 0147
        CMPI    #$0005, R0                      ; 6C93   0378 0005
        BNEQ    L_6C9F                          ; 6C95   020C 0008

        CLRR    R0                              ; 6C97   01C0
        MVO     R0,     G_0163                  ; 6C98   0240 0163
        MVO     R0,     G_0147                  ; 6C9A   0240 0147
        INCR    R0                              ; 6C9C   0008
        MVO     R0,     G_0162                  ; 6C9D   0240 0162
L_6C9F:
        MVI     G_0333, R0                      ; 6C9F   0280 0333
        ANDI    #$001F, R0                      ; 6CA1   03B8 001F
        BNEQ    L_6B42                          ; 6CA3   022C 0162
        B       L_6B34                          ; 6CA5   0220 0172

        DECLE   $0004                           ; 6CA7   0004

        CMPR    R7,     R4                      ; 6CA8   017C
        ADDR    R7,     R3                      ; 6CA9   00FB
        MVI@    R1,     R0                      ; 6CAA   0288
        MVII    #$0008, R2                      ; 6CAB   02BA 0008
        MVII    #$0018, R3                      ; 6CAD   02BB 0018
        MVI     G_0149, R4                      ; 6CAF   0284 0149
        ANDI    #$0004, R4                      ; 6CB1   03BC 0004
        BEQ     L_6CB7                          ; 6CB3   0204 0002

        SLL     R3,     2                       ; 6CB5   004F
        SLL     R2,     2                       ; 6CB6   004E
L_6CB7:
        PSHR    R0                              ; 6CB7   0270
        DECLE   $0198,  $02B0,  $0224,  $0187   ; 6CB8   0198 02B0 0224 0187
        DECLE   $0110,  $0248,  $0270,  $0198   ; 6CBC   0110 0248 0270 0198
        DECLE   $02B0,  $020C,  $000A,  $0004   ; 6CC0   02B0 020C 000A 0004
        DECLE   $0174,  $0311,  $0001,  $0000   ; 6CC4   0174 0311 0001 0000

        MVI     G_0332, R3                      ; 6CC8   0283 0332
        DECR    R3                              ; 6CCA   0013
        MVO     R3,     G_0332                  ; 6CCB   0243 0332
        ANDI    #$0078, R0                      ; 6CCD   03B8 0078
        BNEQ    L_6B34                          ; 6CCF   022C 019C

        MVI@    R1,     R0                      ; 6CD1   0288
        SDBD                                    ; 6CD2   0001
        ANDI    #$0600, R0                      ; 6CD3   03B8 0000 0006
        XOR     G_0344, R0                      ; 6CD6   03C0 0344
        MVO@    R0,     R1                      ; 6CD8   0248
        B       L_6B34                          ; 6CD9   0220 01A6

        MVI     G_0172, R0                      ; 6CDB   0280 0172
        XOR     G_0175, R0                      ; 6CDD   03C0 0175
        ANDI    #$0001, R0                      ; 6CDF   03B8 0001
        BNEQ    L_6CF6                          ; 6CE1   020C 0013

        ADD     G_0146, R0                      ; 6CE3   02C0 0146
        BNEQ    L_6AFC                          ; 6CE5   022C 01EA

        MVI     G_0173, R0                      ; 6CE7   0280 0173
        AND     G_0176, R0                      ; 6CE9   0380 0176
        SWAP    R0,     2                       ; 6CEB   0044
        INCR    R0                              ; 6CEC   0008
        BEQ     L_6CF5                          ; 6CED   0204 0006
        BPL     L_6CF5                          ; 6CEF   0203 0004

        MVO     R0,     G_0146                  ; 6CF1   0240 0146
        B       L_6AFC                          ; 6CF3   0220 01F8
L_6CF5:
        PULR    R7                              ; 6CF5   02B7

L_6CF6:
        CLRR    R0                              ; 6CF6   01C0
        MVO     R0,     G_0146                  ; 6CF7   0240 0146
        B       L_6AFC                          ; 6CF9   0220 01FE

        PSHR    R5                              ; 6CFB   0275
        MVI     G_031F, R0                      ; 6CFC   0280 031F
        MVI     G_0149, R1                      ; 6CFE   0281 0149
        ANDI    #$007F, R1                      ; 6D00   03B9 007F
        ADDI    #$0004, R1                      ; 6D02   02F9 0004
        SLR     R1,     2                       ; 6D04   0065
        SLR     R1,     1                       ; 6D05   0061
        DECR    R1                              ; 6D06   0011
        SLL     R1,     2                       ; 6D07   004D
        PSHR    R1                              ; 6D08   0271
        SLL     R1,     2                       ; 6D09   004D
        ADD@    R6,     R1                      ; 6D0A   02F1
        ANDI    #$00FF, R0                      ; 6D0B   03B8 00FF
        SUBI    #$0004, R0                      ; 6D0D   0338 0004
        SLR     R0,     2                       ; 6D0F   0064
        SLR     R0,     1                       ; 6D10   0060
        ADDR    R0,     R1                      ; 6D11   00C1
        ADDI    #$0200, R1                      ; 6D12   02F9 0200
        PULR    R7                              ; 6D14   02B7

        PSHR    R5                              ; 6D15   0275

        JSR     R5,     L_6A8F                  ; 6D16   0004 0168 028F

        ANDI    #$0001, R0                      ; 6D19   03B8 0001
        MVO     R0,     G_014E                  ; 6D1B   0240 014E
        MVII    #$0300, R0                      ; 6D1D   02B8 0300
        MVO     R0,     G_0102                  ; 6D1F   0240 0102
        BEQ     L_6D25                          ; 6D21   0204 0002

        ADDI    #$00A8, R0                      ; 6D23   02F8 00A8
L_6D25:
        MVO     R0,     G_031D                  ; 6D25   0240 031D

        JSR     R5,     L_6A8F                  ; 6D27   0004 0168 028F
        DECLE   $03B8,  $000F,  $02F8,  $004C   ; 6D2A   03B8 000F 02F8 004C
        DECLE   $0240,  $0325,  $0280,  $0345   ; 6D2E   0240 0325 0280 0345
        DECLE   $0001,  $03F8,  $0000,  $0018   ; 6D32   0001 03F8 0000 0018
        DECLE   $02B9,  $0020,  $004D,  $00C9   ; 6D36   02B9 0020 004D 00C9
        DECLE   $01C8,  $0240,  $032D,  $02B8   ; 6D3A   01C8 0240 032D 02B8
        DECLE   $0001,  $0240,  $014B,  $0240   ; 6D3E   0001 0240 014B 0240
        DECLE   $0150,  $0004                   ; 6D42   0150 0004

        CMPR    R7,     R4                      ; 6D44   017C
        CMPR    R0,     R7                      ; 6D45   0147
        PULR    R7                              ; 6D46   02B7

        PSHR    R5                              ; 6D47   0275

        JSR     R5,     L_66B7                  ; 6D48   0004 0164 02B7
        DECLE   $0003,  $0004,  $017C,  $0303   ; 6D4B   0003 0004 017C 0303
        DECLE   $0280,  $0150,  $0010,  $0240   ; 6D4F   0280 0150 0010 0240
        DECLE   $0150,  $020C,  $00BD,  $0004   ; 6D53   0150 020C 00BD 0004

        CMPR    R7,     R4                      ; 6D57   017C
        ADD@    R6,     R4                      ; 6D58   02F4
        MVI     G_0183, R0                      ; 6D59   0280 0183
        ANDI    #$001F, R0                      ; 6D5B   03B8 001F
        BEQ     L_6D68                          ; 6D5D   0204 0009

        CMP     G_014F, R0                      ; 6D5F   0340 014F
        BEQ     L_6D68                          ; 6D61   0204 0005

        MVI     G_014D, R1                      ; 6D63   0281 014D
        NEGR    R1                              ; 6D65   0021
        MVO     R1,     G_014D                  ; 6D66   0241 014D
L_6D68:
        MVO     R0,     G_014F                  ; 6D68   0240 014F
        DECLE   $0280,  $014B,  $0010,  $0240   ; 6D6A   0280 014B 0010 0240
        DECLE   $014B,  $020C,  $0005,  $0004   ; 6D6E   014B 020C 0005 0004
        DECLE   $017C,  $0219                   ; 6D72   017C 0219

        B       L_6D8F                          ; 6D74   0200 0019

        MVI     G_014C, R0                      ; 6D76   0280 014C
        TSTR    R0                              ; 6D78   0080
        BNEQ    L_6D8F                          ; 6D79   020C 0014

        JSR     R5,     L_6A8F                  ; 6D7B   0004 0168 028F

        ANDI    #$007F, R0                      ; 6D7E   03B8 007F
        BNEQ    L_6D8F                          ; 6D80   020C 000D

        MVI     G_014D, R0                      ; 6D82   0280 014D
        NEGR    R0                              ; 6D84   0020
        MVO     R0,     G_014D                  ; 6D85   0240 014D

        JSR     R5,     L_6A8F                  ; 6D87   0004 0168 028F

        ANDI    #$000F, R0                      ; 6D8A   03B8 000F
        INCR    R0                              ; 6D8C   0008
        MVO     R0,     G_014B                  ; 6D8D   0240 014B
L_6D8F:
        MVI     G_014C, R0                      ; 6D8F   0280 014C
        TSTR    R0                              ; 6D91   0080
        BNEQ    L_6DA8                          ; 6D92   020C 0014

        JSR     R5,     L_6A8F                  ; 6D94   0004 0168 028F

        ANDI    #$000F, R0                      ; 6D97   03B8 000F
        BNEQ    L_6DA8                          ; 6D99   020C 000D

        MVI     G_014D, R0                      ; 6D9B   0280 014D
        NEGR    R0                              ; 6D9D   0020
        MVO     R0,     G_014D                  ; 6D9E   0240 014D

        JSR     R5,     L_6A8F                  ; 6DA0   0004 0168 028F

        ANDI    #$0007, R0                      ; 6DA3   03B8 0007
        INCR    R0                              ; 6DA5   0008
        MVO     R0,     G_014B                  ; 6DA6   0240 014B
L_6DA8:
        MVI     G_0325, R0                      ; 6DA8   0280 0325
        DECLE   $02C0,  $014D,  $03B8,  $007F   ; 6DAA   02C0 014D 03B8 007F
        DECLE   $0378,  $0048,  $0226,  $0040   ; 6DAE   0378 0048 0226 0040
        DECLE   $0378,  $0064,  $022E,  $0044   ; 6DB2   0378 0064 022E 0044
        DECLE   $0281,  $0325,  $0001,  $03B9   ; 6DB6   0281 0325 0001 03B9
        DECLE   $0080,  $00FF,  $01C1,  $0241   ; 6DBA   0080 00FF 01C1 0241
        DECLE   $0325,  $0280,  $031D,  $02C0   ; 6DBE   0325 0280 031D 02C0
        DECLE   $014C,  $03B8,  $00FF,  $0378   ; 6DC2   014C 03B8 00FF 0378
        DECLE   $00A8,  $020D,  $0118           ; 6DC6   00A8 020D 0118

        MVI     G_031D, R1                      ; 6DC9   0281 031D
L_6DCB:
        SDBD                                    ; 6DCB   0001
        ANDI    #$FF00, R1                      ; 6DCC   03B9 0000 00FF
        XORR    R0,     R1                      ; 6DCF   01C1
        MVO     R1,     G_031D                  ; 6DD0   0241 031D
        MVI     G_0325, R0                      ; 6DD2   0280 0325
        SUBI    #$0006, R0                      ; 6DD4   0338 0006
        CMPI    #$0060, R0                      ; 6DD6   0378 0060
        BGT     L_6E03                          ; 6DD8   020E 0029

        SLR     R0,     2                       ; 6DDA   0064
        SARC    R0,     1                       ; 6DDB   0078
        GSWD    R3                              ; 6DDC   0033
        SLL     R0,     2                       ; 6DDD   004C
        PSHR    R0                              ; 6DDE   0270
        SLL     R0,     2                       ; 6DDF   004C
        ADD@    R6,     R0                      ; 6DE0   02F0
        ANDI    #$00FF, R1                      ; 6DE1   03B9 00FF
        SUBI    #$0004, R1                      ; 6DE3   0339 0004
        CMPI    #$0003, R1                      ; 6DE5   0379 0003
        BLE     L_6E03                          ; 6DE7   0206 001A

        CMPI    #$00A0, R1                      ; 6DE9   0379 00A0
        BGE     L_6E03                          ; 6DEB   020D 0016

        SLR     R1,     2                       ; 6DED   0065
        SLR     R1,     1                       ; 6DEE   0061
        ADDR    R0,     R1                      ; 6DEF   00C1
        ADDI    #$0200, R1                      ; 6DF0   02F9 0200
        MVI@    R1,     R0                      ; 6DF2   0288
        MVII    #$0018, R2                      ; 6DF3   02BA 0018
        RSWD    R3                              ; 6DF5   003B
        BC      L_6DF9                          ; 6DF6   0201 0001

        SLL     R2,     2                       ; 6DF8   004E
L_6DF9:
        ANDR    R0,     R2                      ; 6DF9   0182
        BEQ     L_6E03                          ; 6DFA   0204 0007

        XORR    R2,     R0                      ; 6DFC   01D0
        MVO@    R0,     R1                      ; 6DFD   0248
        MVI     G_0332, R0                      ; 6DFE   0280 0332
        DECR    R0                              ; 6E00   0010
        MVO     R0,     G_0332                  ; 6E01   0240 0332
L_6E03:
        MVII    #$0003, R0                      ; 6E03   02B8 0003
        MVI     G_0169, R1                      ; 6E05   0281 0169
        CMPI    #$000C, R1                      ; 6E07   0379 000C
        BLE     L_6E11                          ; 6E09   0206 0006

        DECR    R0                              ; 6E0B   0010
        CMPI    #$0018, R1                      ; 6E0C   0379 0018
        BLT     L_6E11                          ; 6E0E   0205 0001

        DECR    R0                              ; 6E10   0010
L_6E11:
        MVO     R0,     G_0150                  ; 6E11   0240 0150
        DECLE   $0004,  $0168,  $0242,  $0001   ; 6E13   0004 0168 0242 0001

        DIS                                     ; 6E17   0003
        PULR    R7                              ; 6E18   02B7

        PSHR    R5                              ; 6E19   0275

        JSR     R5,     L_6A8F                  ; 6E1A   0004 0168 028F

        ANDI    #$003F, R0                      ; 6E1D   03B8 003F
        CMP     G_0169, R0                      ; 6E1F   0340 0169
        BLE     L_6E40                          ; 6E21   0206 001D

        JSR     R5,     L_6A8F                  ; 6E23   0004 0168 028F

        ANDI    #$000F, R0                      ; 6E26   03B8 000F
        INCR    R0                              ; 6E28   0008
        SLL     R0,     2                       ; 6E29   004C
        MVO     R0,     G_014B                  ; 6E2A   0240 014B

        JSR     R5,     L_6A8F                  ; 6E2C   0004 0168 028F

        MOVR    R0,     R3                      ; 6E2F   0083
        ANDI    #$0003, R3                      ; 6E30   03BB 0003

        JSR     R5,     L_6A8F                  ; 6E32   0004 0168 028F

        MOVR    R0,     R1                      ; 6E35   0081
        ANDI    #$0003, R1                      ; 6E36   03B9 0003
        INCR    R1                              ; 6E38   0009

        JSR     R5,     L_6A8F                  ; 6E39   0004 0168 028F

        ANDI    #$0003, R0                      ; 6E3C   03B8 0003
        B       L_6E5E                          ; 6E3E   0200 001E

L_6E40:
        MVI     G_031D, R0                      ; 6E40   0280 031D
        ANDI    #$00FF, R0                      ; 6E42   03B8 00FF
        MVI     G_031E, R1                      ; 6E44   0281 031E
        ANDI    #$00FF, R1                      ; 6E46   03B9 00FF
        CLRR    R3                              ; 6E48   01DB
        SUBR    R1,     R0                      ; 6E49   0108
        BPL     L_6E4F                          ; 6E4A   0203 0003

        NEGR    R0                              ; 6E4C   0020
        XORI    #$0001, R3                      ; 6E4D   03FB 0001
L_6E4F:
        MVI     G_0325, R1                      ; 6E4F   0281 0325
        MVI     G_0326, R2                      ; 6E51   0282 0326
        ANDI    #$007F, R2                      ; 6E53   03BA 007F
        SUBR    R2,     R1                      ; 6E55   0111
        BNEQ    L_6E59                          ; 6E56   020C 0001

        INCR    R1                              ; 6E58   0009
L_6E59:
        BPL     L_6E5E                          ; 6E59   0203 0003

        NEGR    R1                              ; 6E5B   0021
        XORI    #$0002, R3                      ; 6E5C   03FB 0002
L_6E5E:
        PSHR    R3                              ; 6E5E   0273
        TSTR    R0                              ; 6E5F   0080
        BNEQ    L_6E66                          ; 6E60   020C 0004

        MVII    #$0001, R1                      ; 6E62   02B9 0001
        B       L_6E8E                          ; 6E64   0200 0028

L_6E66:
        TSTR    R1                              ; 6E66   0089
        BNEQ    L_6E6C                          ; 6E67   020C 0003

        INCR    R1                              ; 6E69   0009
        B       L_6E8E                          ; 6E6A   0200 0022

L_6E6C:
        CMPR    R0,     R1                      ; 6E6C   0141
        BGT     L_6E7F                          ; 6E6D   020E 0010

        PSHR    R1                              ; 6E6F   0271
        SLL     R1,     2                       ; 6E70   004D
        ADDR    R1,     R1                      ; 6E71   00C9
        MVO     R1,     G_014B                  ; 6E72   0241 014B
        PULR    R1                              ; 6E74   02B1
        MOVR    R0,     R2                      ; 6E75   0082
        CLRR    R3                              ; 6E76   01DB

        JSR     R5,     L_6A7C                  ; 6E77   0004 0168 027C

        MOVR    R2,     R0                      ; 6E7A   0090
        MVII    #$0001, R1                      ; 6E7B   02B9 0001
        B       L_6E8E                          ; 6E7D   0200 000F

L_6E7F:
        PSHR    R0                              ; 6E7F   0270
        SLL     R0,     2                       ; 6E80   004C
        ADDR    R0,     R0                      ; 6E81   00C0
        MVO     R0,     G_014B                  ; 6E82   0240 014B
        PULR    R0                              ; 6E84   02B0
        MOVR    R1,     R2                      ; 6E85   008A
        MOVR    R0,     R1                      ; 6E86   0081
        CLRR    R3                              ; 6E87   01DB

        JSR     R5,     L_6A7C                  ; 6E88   0004 0168 027C

        MOVR    R2,     R1                      ; 6E8B   0091
        MVII    #$0001, R0                      ; 6E8C   02B8 0001
L_6E8E:
        CMPI    #$0002, R0                      ; 6E8E   0378 0002
        BLE     L_6E94                          ; 6E90   0206 0002

        MVII    #$0002, R0                      ; 6E92   02B8 0002
L_6E94:
        PULR    R3                              ; 6E94   02B3
        RRC     R3,     1                       ; 6E95   0073
        BNC     L_6E99                          ; 6E96   0209 0001

        NEGR    R0                              ; 6E98   0020
L_6E99:
        MVI     G_014D, R3                      ; 6E99   0283 014D
        SWAP    R3,     2                       ; 6E9B   0047
        BMI     L_6E9F                          ; 6E9C   020B 0001

        NEGR    R1                              ; 6E9E   0021
L_6E9F:
        TSTR    R0                              ; 6E9F   0080
        BMI     L_6EAA                          ; 6EA0   020B 0008

        MVI     G_014E, R2                      ; 6EA2   0282 014E
        TSTR    R2                              ; 6EA4   0092
        BEQ     L_6EB0                          ; 6EA5   0204 0009

        NEGR    R0                              ; 6EA7   0020
        B       L_6EB0                          ; 6EA8   0200 0006

L_6EAA:
        MVI     G_014E, R2                      ; 6EAA   0282 014E
        TSTR    R2                              ; 6EAC   0092
        BNEQ    L_6EB0                          ; 6EAD   020C 0001

        NEGR    R0                              ; 6EAF   0020
L_6EB0:
        TSTR    R0                              ; 6EB0   0080
        BMI     L_6EBB                          ; 6EB1   020B 0008

        CMPI    #$0004, R0                      ; 6EB3   0378 0004
        BLE     L_6EC5                          ; 6EB5   0206 000E

        MVII    #$0004, R0                      ; 6EB7   02B8 0004
        B       L_6EC5                          ; 6EB9   0200 000A

L_6EBB:
        SDBD                                    ; 6EBB   0001
        CMPI    #$FFFC, R0                      ; 6EBC   0378 00FC 00FF
        BGE     L_6EC5                          ; 6EBF   020D 0004

        SDBD                                    ; 6EC1   0001
        MVII    #$FFFC, R0                      ; 6EC2   02B8 00FC 00FF
L_6EC5:
        TSTR    R1                              ; 6EC5   0089
        BMI     L_6ED0                          ; 6EC6   020B 0008

        CMPI    #$0004, R1                      ; 6EC8   0379 0004
        BLE     L_6EDA                          ; 6ECA   0206 000E

        MVII    #$0004, R1                      ; 6ECC   02B9 0004
        B       L_6EDA                          ; 6ECE   0200 000A

L_6ED0:
        SDBD                                    ; 6ED0   0001
        CMPI    #$FFFC, R1                      ; 6ED1   0379 00FC 00FF
        BGE     L_6EDA                          ; 6ED4   020D 0004

        SDBD                                    ; 6ED6   0001
        MVII    #$FFFC, R1                      ; 6ED7   02B9 00FC 00FF
L_6EDA:
        ADDR    R0,     R0                      ; 6EDA   00C0
        ADDR    R1,     R1                      ; 6EDB   00C9
        MVO     R0,     G_014C                  ; 6EDC   0240 014C
        MVO     R1,     G_014D                  ; 6EDE   0241 014D
        PULR    R7                              ; 6EE0   02B7

        DECLE   $0004,  $0164,  $0296           ; 6EE1   0004 0164 0296

        DIS                                     ; 6EE4   0003
L_6EE5:
        CLRR    R0                              ; 6EE5   01C0
        MVO     R0,     G_031D                  ; 6EE6   0240 031D

        JSR     R5,     L_6A8F                  ; 6EE8   0004 0168 028F

        ANDI    #$003F, R0                      ; 6EEB   03B8 003F
        BEQ     L_6EE5                          ; 6EED   0224 0009

        JSR     R5,     L_6A43                  ; 6EEF   0004 0168 0243

        EIS                                     ; 6EF2   0002
        PULR    R7                              ; 6EF3   02B7

        MVI     G_032D, R0                      ; 6EF4   0280 032D
        MOVR    R0,     R1                      ; 6EF6   0081
        SDBD                                    ; 6EF7   0001
        ANDI    #$FFE7, R0                      ; 6EF8   03B8 00E7 00FF
        ADDI    #$0008, R1                      ; 6EFB   02F9 0008
        ANDI    #$0018, R1                      ; 6EFD   03B9 0018
        XORR    R1,     R0                      ; 6EFF   01C8
        MVO     R0,     G_032D                  ; 6F00   0240 032D
        MOVR    R5,     R7                      ; 6F02   00AF

        DECLE   $0282,  $0183,  $03BA,  $0080   ; 6F03   0282 0183 03BA 0080
        DECLE   $0204,  $0077,  $0281,  $014A   ; 6F07   0204 0077 0281 014A
        DECLE   $03B9,  $007F,  $0282,  $0325   ; 6F0B   03B9 007F 0282 0325
        DECLE   $0111,  $0379,  $0004,  $020E   ; 6F0F   0111 0379 0004 020E
        DECLE   $0009,  $0004                   ; 6F13   0009 0004

        CMPR    R6,     R4                      ; 6F15   0174
        SUB@    R2,     R1                      ; 6F16   0311
        INCR    R1                              ; 6F17   0009
        EIS                                     ; 6F18   0002
        MVII    #$002E, R2                      ; 6F19   02BA 002E
        B       L_6F31                          ; 6F1B   0200 0014

        DECLE   $0379,  $000C,  $020E,  $0009   ; 6F1D   0379 000C 020E 0009
        DECLE   $0004                           ; 6F21   0004

        CMPR    R6,     R4                      ; 6F22   0174
        SUB@    R2,     R1                      ; 6F23   0311
        CLRC                                    ; 6F24   0006
        EIS                                     ; 6F25   0002
        MVII    #$002C, R2                      ; 6F26   02BA 002C
        B       L_6F31                          ; 6F28   0200 0007

        DECLE   $0004                           ; 6F2A   0004

        CMPR    R6,     R4                      ; 6F2B   0174
        SUB@    R2,     R1                      ; 6F2C   0311
        DIS                                     ; 6F2D   0003
        EIS                                     ; 6F2E   0002
        MVII    #$002A, R2                      ; 6F2F   02BA 002A
L_6F31:
        SLL     R2,     2                       ; 6F31   004E
        ADDR    R2,     R2                      ; 6F32   00D2
        MVI     G_032D, R0                      ; 6F33   0280 032D
        SDBD                                    ; 6F35   0001
        ANDI    #$F807, R0                      ; 6F36   03B8 0007 00F8
        XORR    R2,     R0                      ; 6F39   01D0
        MVO     R0,     G_032D                  ; 6F3A   0240 032D
        MVI     G_0325, R2                      ; 6F3C   0282 0325
        XORI    #$0080, R2                      ; 6F3E   03FA 0080
        MVO     R2,     G_0325                  ; 6F40   0242 0325
        ANDI    #$007F, R2                      ; 6F42   03BA 007F
        CMPI    #$0060, R2                      ; 6F44   037A 0060
        BLE     L_6F52                          ; 6F46   0206 000A

        MVI     G_0325, R2                      ; 6F48   0282 0325
        SDBD                                    ; 6F4A   0001
        ANDI    #$FF80, R2                      ; 6F4B   03BA 0080 00FF
        XORI    #$0060, R2                      ; 6F4E   03FA 0060
        MVO     R2,     G_0325                  ; 6F50   0242 0325
L_6F52:
        MVI     G_031D, R2                      ; 6F52   0282 031D
        XORI    #$0100, R2                      ; 6F54   03FA 0100
        MOVR    R2,     R0                      ; 6F56   0090
        ANDI    #$00FF, R0                      ; 6F57   03B8 00FF
        CMPI    #$0008, R0                      ; 6F59   0378 0008
        BGE     L_6F5F                          ; 6F5B   020D 0002

        MVII    #$0008, R0                      ; 6F5D   02B8 0008
L_6F5F:
        CMPI    #$00A0, R0                      ; 6F5F   0378 00A0
        BLE     L_6F65                          ; 6F61   0206 0002

        MVII    #$00A0, R0                      ; 6F63   02B8 00A0
L_6F65:
        SDBD                                    ; 6F65   0001
        DECLE   $03BA,  $0000,  $00FF,  $00C2   ; 6F66   03BA 0000 00FF 00C2
        DECLE   $0242,  $031D,  $0004,  $0168   ; 6F6A   0242 031D 0004 0168
        DECLE   $0242                           ; 6F6E   0242

        SARC    R0,     1                       ; 6F6F   0078
        INCR    R1                              ; 6F70   0009

        JSR     R5,     L_66B7                  ; 6F71   0004 0164 02B7
        DECLE   $0005                           ; 6F74   0005

        PULR    R7                              ; 6F75   02B7

        PSHR    R5                              ; 6F76   0275
        CLRR    R0                              ; 6F77   01C0
        MVO     R0,     G_031D                  ; 6F78   0240 031D
        MVO     R0,     G_0325                  ; 6F7A   0240 0325
        MVO     R0,     G_032D                  ; 6F7C   0240 032D
        B       L_6EE5                          ; 6F7E   0220 009A
        MOVR    R5,     R7                      ; 6F80   00AF

        RLC     R0,     1                       ; 6F81   0050
        RRC     R2,     1                       ; 6F82   0072
        SAR     R3,     2                       ; 6F83   006F
        SLR     R3,     2                       ; 6F84   0067
        RRC     R2,     1                       ; 6F85   0072
        SLR     R1,     1                       ; 6F86   0061
        SAR     R1,     2                       ; 6F87   006D
        SAR     R1,     2                       ; 6F88   006D
        SLR     R1,     2                       ; 6F89   0065
        SLR     R0,     2                       ; 6F8A   0064
        NEGR    R0                              ; 6F8B   0020
        SLR     R2,     1                       ; 6F8C   0062
        SARC    R1,     1                       ; 6F8D   0079
        NEGR    R0                              ; 6F8E   0020
        SLL     R1,     2                       ; 6F8F   004D
        SLR     R1,     1                       ; 6F90   0061
        RRC     R2,     1                       ; 6F91   0072
        SAR     R3,     1                       ; 6F92   006B
        NEGR    R0                              ; 6F93   0020
        SLL     R3,     1                       ; 6F94   004B
        SLR     R1,     2                       ; 6F95   0065
        SAR     R2,     2                       ; 6F96   006E
        SAR     R2,     2                       ; 6F97   006E
        SLR     R1,     2                       ; 6F98   0065
        SLR     R0,     2                       ; 6F99   0064
        SARC    R1,     1                       ; 6F9A   0079
        NEGR    R0                              ; 6F9B   0020
        SWAP    R3,     2                       ; 6F9C   0047
        RRC     R2,     1                       ; 6F9D   0072
        SLR     R1,     1                       ; 6F9E   0061
        RRC     R0,     1                       ; 6F9F   0070
        SAR     R0,     1                       ; 6FA0   0068
        SAR     R1,     1                       ; 6FA1   0069
        SLR     R3,     1                       ; 6FA2   0063
        RRC     R3,     1                       ; 6FA3   0073
        NEGR    R0                              ; 6FA4   0020
        SLR     R2,     1                       ; 6FA5   0062
        SARC    R1,     1                       ; 6FA6   0079
        NEGR    R0                              ; 6FA7   0020
        SWAP    R1,     2                       ; 6FA8   0045
        RRC     R2,     1                       ; 6FA9   0072
        SAR     R1,     1                       ; 6FAA   0069
        SLR     R3,     1                       ; 6FAB   0063
        NEGR    R0                              ; 6FAC   0020
        RLC     R3,     2                       ; 6FAD   0057
        SLR     R1,     2                       ; 6FAE   0065
        SAR     R0,     2                       ; 6FAF   006C
        RRC     R3,     1                       ; 6FB0   0073
        NEGR    R0                              ; 6FB1   0020
        RLC     R3,     1                       ; 6FB2   0053
        SAR     R3,     2                       ; 6FB3   006F
        RRC     R1,     2                       ; 6FB4   0075
        SAR     R2,     2                       ; 6FB5   006E
        SLR     R0,     2                       ; 6FB6   0064
        RRC     R3,     1                       ; 6FB7   0073
        NEGR    R0                              ; 6FB8   0020
        SLR     R2,     1                       ; 6FB9   0062
        SARC    R1,     1                       ; 6FBA   0079
        NEGR    R0                              ; 6FBB   0020
        RLC     R2,     1                       ; 6FBC   0052
        RRC     R1,     2                       ; 6FBD   0075
        RRC     R3,     1                       ; 6FBE   0073
        RRC     R3,     1                       ; 6FBF   0073
        NEGR    R0                              ; 6FC0   0020
        SLL     R0,     1                       ; 6FC1   0048
        SLR     R1,     1                       ; 6FC2   0061
        SLR     R2,     2                       ; 6FC3   0066
        RRC     R0,     2                       ; 6FC4   0074
        ADCR    R6                              ; 6FC5   002E
        NEGR    R0                              ; 6FC6   0020
        SWAP    R3,     2                       ; 6FC7   0047
        RRC     R2,     1                       ; 6FC8   0072
        SLR     R1,     2                       ; 6FC9   0065
        SLR     R1,     2                       ; 6FCA   0065
        RRC     R0,     2                       ; 6FCB   0074
        SAR     R1,     1                       ; 6FCC   0069
        SAR     R2,     2                       ; 6FCD   006E
        SLR     R3,     2                       ; 6FCE   0067
        RRC     R3,     1                       ; 6FCF   0073
        NEGR    R0                              ; 6FD0   0020
        SLR     R2,     2                       ; 6FD1   0066
        RRC     R2,     1                       ; 6FD2   0072
        SAR     R3,     2                       ; 6FD3   006F
        SAR     R1,     2                       ; 6FD4   006D
        NEGR    R0                              ; 6FD5   0020
        SWAP    R1,     1                       ; 6FD6   0041
        RLC     R0,     2                       ; 6FD7   0054
        SWAP    R1,     1                       ; 6FD8   0041
        RLC     R2,     1                       ; 6FD9   0052
        SLL     R1,     1                       ; 6FDA   0049
        NEGR    R1                              ; 6FDB   0021
        NEGR    R1                              ; 6FDC   0021
        NEGR    R1                              ; 6FDD   0021
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5018       $62BB  
;;  $5045       $5038  
;;  $5046       $503D  
;;  $5052       $5077  
;;  $506A       $5062  
;;  $5072       $5068  
;;  $5075       $5055  
;;  $508A       $5090  
;;  $509A       $509D  
;;  $50AB       $50CA  
;;  $50BA       $50DA  
;;  $50C7       $50AF   $50BB   $50C0   $50CF   $50D3   $50DC  
;;  $50CD       $50B8  
;;  $50D1       $50B2  
;;  $50E3       $5129  
;;  $50EB       $50F1  
;;  $50F3       $50ED  
;;  $511D       $510A   $510E  
;;  $5121       $50FA  
;;  $5123       $511F  
;;  $5125       $50E6  
;;  $5142       $513C  
;;  $516A       $5164  
;;  $5175       $5172  
;;  $518B       $5135   $5146   $5168   $5177   $5183  
;;  $5194       $51BA  
;;  $51AB       $51A3  
;;  $51B6       $51A9  
;;  $51B8       $5197   $519C   $51B0  
;;  $520C       $51FA  
;;  $5249       $5239  
;;  $5268       $5264  
;;  $5270       $5251   $526A  
;;  $5290       $5289  
;;  $5296       $5282  
;;  $52A2       $5235   $5245   $52DD   $52E6  
;;  $52A3       $5277   $528E   $5294  
;;  $52CF       $5300   $5304  
;;  $52E2       $52D8  
;;  $52EA       $52BD  
;;  $5320       $532A  
;;  $532C       $5323   $5327  
;;  $5349       $531A   $531E  
;;  $534D       $5314   $533A  
;;  $537F       $536D  
;;  $538B       $5387  
;;  $538D       $5409  
;;  $5394       $5378   $537D  
;;  $53CB       $53A7   $53AD   $53B1   $53B7   $53BB   $53C1   $53C5  
;;  $53D9       $53D3  
;;  $53DF       $53D7   $53DB  
;;  $53E7       $53E1  
;;  $53ED       $53E5   $53E9  
;;  $540B       $5392   $53FE  
;;  $5437       $543D  
;;  $5441       $543A  
;;  $54A7       $54A5  
;;  $54F1       $54F1  
;;  $54F9       $54F9  
;;  $5532       $553C  
;;  $5578       $5584  
;;  $5586       $5572  
;;  $55B1       $55B9  
;;  $55B7       $55B3  
;;  $55C2       $55D5  
;;  $55D2       $55CA  
;;  $55E5       $55EE  
;;  $5604       $55FE  
;;  $5608       $5602  
;;  $5628       $5631  
;;  $5647       $561F   $5626  
;;  $5656       $5645  
;;  $5667       $565B  
;;  $5672       $5669  
;;  $56A8       $569A   $56A2  
;;  $56D5       $56D2  
;;  $56E2       $56E2  
;;  $5886       $5929  
;;  $588E       $59A1  
;;  $5894       $5890  
;;  $58AC       $58AC  
;;  $58B2       $58B0  
;;  $58C5       $58B5   $58B9   $58BD   $58C1  
;;  $58D3       $58CB  
;;  $58E3       $58F7  
;;  $58F0       $58EA  
;;  $58F6       $58F2  
;;  $58FB       $58E4  
;;  $5905       $590F  
;;  $5911       $5906  
;;  $5913       $58A1   $58D1   $58FD   $5934  
;;  $591B       $5917  
;;  $592B       $58F9   $590C  
;;  $5936       $5924  
;;  $5951       $5954  
;;  $5956       $595E   $5961  
;;  $5960       $5957  
;;  $5977       $5963  
;;  $597E       $5981  
;;  $5983       $5986  
;;  $598C       $5990  
;;  $5992       $595C   $5995  
;;  $59D1       $59D1  
;;  $59F1       $59FC  
;;  $5A11       $5A1F  
;;  $5A1D       $5A14   $5A40  
;;  $5A24       $5A2E  
;;  $5A30       $5A27  
;;  $5A31       $5A1A  
;;  $5A52       $5A4C  
;;  $5A55       $5A5B  
;;  $5A60       $5A57  
;;  $5A68       $5A72  
;;  $5A70       $5A6A  
;;  $5A7E       $5A8C  
;;  $5A83       $5A80  
;;  $5A8B       $5A86  
;;  $5AAB       $5ABA  
;;  $5AB8       $5AB0   $5AB4  
;;  $5AC5       $5AC0  
;;  $5AC8       $5AD3  
;;  $5AD0       $5ACB  
;;  $5AE3       $5ABE   $5AC3  
;;  $5AE7       $5AD9   $5ADD   $5AE1  
;;  $5B16       $5B13  
;;  $5B1B       $5B18  
;;  $5B20       $5B1D  
;;  $5B35       $5B48   $5B4D   $5BA6   $5BF8  
;;  $5B3A       $5B37  
;;  $5B4A       $5B41  
;;  $5B4F       $5B97   $5B9D   $5BBE   $5BD8   $5BE4   $5BF1   $5C00   $5C20  
;;  $5B4F       $5C4C  
;;  $5B8A       $5B8E  
;;  $5B90       $5B8B  
;;  $5BBA       $5BB5  
;;  $5BBD       $5BB0   $5BB8  
;;  $5BD4       $5BCF  
;;  $5BD7       $5BCB   $5BD2  
;;  $5BE6       $5BE1  
;;  $5BF0       $5BEA  
;;  $5C0D       $5C06   $5C30  
;;  $5C1B       $5C0B  
;;  $5C43       $5C3D  
;;  $5C47       $5C41  
;;  $5C48       $5C37  
;;  $5C67       $5C6B  
;;  $5C6D       $5C68  
;;  $5C7A       $5C72   $5C76  
;;  $5C92       $5C9A  
;;  $5CB2       $5CB8  
;;  $5CBA       $5CB5  
;;  $5CF8       $5D1D  
;;  $5D13       $5D0C   $5D10  
;;  $5D1F       $5D17  
;;  $5D39       $5D35  
;;  $5D40       $5D56  
;;  $5D44       $5D50  
;;  $5D52       $5D46  
;;  $5D58       $5D29  
;;  $5DA2       $5D9A  
;;  $5DAD       $5DC9  
;;  $5DB1       $5D9C   $5D9E  
;;  $5DBA       $5DA0  
;;  $5DE4       $5DD3  
;;  $5DE5       $5DDC  
;;  $6023       $6028  
;;  $6034       $565D  
;;  $6075       $6098  
;;  $6089       $6093  
;;  $6093       $5049  
;;  $60A0       $5079  
;;  $60DE       $5046  
;;  $612C       $5072  
;;  $616C       $616A  
;;  $617C       $617A  
;;  $6183       $6181  
;;  $6184       $6182  
;;  $6193       $6191  
;;  $61AC       $61AA  
;;  $61BC       $61BA  
;;  $6221       $506A  
;;  $62F4       $62F4  
;;  $62F5       $62C2  
;;  $62F6       $62FA  
;;  $6306       $5290  
;;  $6353       $6079  
;;  $635D       $6367  
;;  $6363       $6360  
;;  $637F       $6386   $63A8  
;;  $6392       $638F  
;;  $63A5       $638A  
;;  $63DB       $63D1   $63D9   $6411   $641D  
;;  $63E5       $63D3  
;;  $6405       $63CD  
;;  $6413       $63CF  
;;  $6443       $541E   $5421  
;;  $6467       $6461  
;;  $6469       $6465  
;;  $648D       $6490  
;;  $64AA       $64A4  
;;  $64B4       $64B1  
;;  $64CF       $64FB  
;;  $64DF       $64DA  
;;  $64E7       $64E2  
;;  $64F0       $64EA  
;;  $64F7       $64F3  
;;  $6503       $650B  
;;  $6524       $6519  
;;  $6527       $6516  
;;  $652A       $5042   $6353  
;;  $6531       $6522  
;;  $6537       $6534  
;;  $653A       $6528  
;;  $653B       $6525   $6539  
;;  $6540       $651C   $652B  
;;  $654F       $6558  
;;  $655A       $6553  
;;  $6562       $6551  
;;  $6568       $6560  
;;  $6571       $657A  
;;  $657C       $6575  
;;  $659B       $5586  
;;  $65C7       $65BE   $65C4  
;;  $661F       $6620   $6623  
;;  $6626       $6629  
;;  $6648       $664B  
;;  $666A       $64A8   $6672  
;;  $6670       $666B  
;;  $6671       $666E  
;;  $667E       $667B  
;;  $66B7       $6085   $6748   $6754   $680B   $68CA   $6B1C   $6D48   $6F71  
;;  $66BE       $66C3  
;;  $66C5       $66B4  
;;  $66CF       $66D4  
;;  $66E2       $6704   $670E  
;;  $66F7       $66FE  
;;  $6710       $6708  
;;  $6726       $6946  
;;  $6727       $6738  
;;  $672F       $672A  
;;  $673A       $6724   $672D  
;;  $674D       $6740  
;;  $6767       $6763  
;;  $676E       $6791  
;;  $67B3       $6814  
;;  $67C1       $67BA  
;;  $67D0       $682E   $6834  
;;  $67DA       $67D2  
;;  $67FB       $67D8  
;;  $6816       $67F2   $67F6  
;;  $6830       $6826  
;;  $6881       $5DB6   $63DD  
;;  $68B4       $68AB  
;;  $68D2       $6883   $688A  
;;  $68FB       $68F5  
;;  $6925       $6896   $68F0   $692A  
;;  $6981       $697A  
;;  $69C7       $69BE   $69C3  
;;  $69E9       $6413  
;;  $69FD       $69FA  
;;  $6A3D       $6A7C  
;;  $6A43       $5081   $558B   $5662   $566E   $692C   $6EEF  
;;  $6A44       $5A2A  
;;  $6A75       $630A  
;;  $6A7C       $6E77   $6E88  
;;  $6A7E       $6A51   $6A61   $6A67   $6A73  
;;  $6A8C       $6A91  
;;  $6A8F       $51F3   $5373   $556B   $5628   $5C93   $5CF9   $6089   $637F  
;;  $6A8F       $688C   $689A   $68A6   $68FB   $6925   $6D16   $6D27   $6D7B  
;;  $6A8F       $6D87   $6D94   $6DA0   $6E1A   $6E23   $6E2C   $6E32   $6E39  
;;  $6A8F       $6EE8  
;;  $6A93       $6A8D  
;;  $6A9F       $6AA5  
;;  $6AA9       $6AA1  
;;  $6ACF       $6ABF  
;;  $6AEC       $6AB7  
;;  $6AFB       $56A5   $5ACD   $5BF5  
;;  $6AFC       $6CE5   $6CF3   $6CF9  
;;  $6B34       $6AF2   $6CA5   $6CCF   $6CD9  
;;  $6B42       $6CA3  
;;  $6B45       $6B4B  
;;  $6B4D       $6B47  
;;  $6B9F       $6B95  
;;  $6BC9       $6BBF  
;;  $6BE2       $6BD2  
;;  $6C05       $6BFB  
;;  $6C1B       $6C0B  
;;  $6C39       $6C32  
;;  $6C4B       $6C44  
;;  $6C56       $6C5B  
;;  $6C5D       $6C57  
;;  $6C66       $5A08   $5A79   $5CA3   $5CAA   $6007   $6013   $603B   $6055  
;;  $6C66       $6061   $62C8   $636E   $63EC   $6473   $647C   $65AB   $65DC  
;;  $6C66       $6BA1   $6BE8   $6C21  
;;  $6C67       $5547   $5550   $5559   $5568   $6379  
;;  $6C6E       $6082  
;;  $6C72       $6C6C  
;;  $6C74       $6C70  
;;  $6C83       $6C80  
;;  $6C8C       $6C85  
;;  $6C9F       $6C95  
;;  $6CB7       $6CB3  
;;  $6CF5       $6CED   $6CEF  
;;  $6CF6       $6CE1  
;;  $6D25       $5DB3   $6D21  
;;  $6D68       $6D5D   $6D61  
;;  $6D8F       $6D74   $6D79   $6D80  
;;  $6DA8       $6D92   $6D99  
;;  $6DCB       $5DAA  
;;  $6DF9       $6DF6  
;;  $6E03       $6DD8   $6DE7   $6DEB   $6DFA  
;;  $6E11       $6E09   $6E0E  
;;  $6E40       $6E21  
;;  $6E4F       $6E4A  
;;  $6E59       $6E56  
;;  $6E5E       $6E3E   $6E59  
;;  $6E66       $6E60  
;;  $6E6C       $6E67  
;;  $6E7F       $6E6D  
;;  $6E8E       $6E64   $6E6A   $6E7D  
;;  $6E94       $6E90  
;;  $6E99       $6E96  
;;  $6E9F       $6E9C  
;;  $6EAA       $6EA0  
;;  $6EB0       $6EA5   $6EA8   $6EAD  
;;  $6EBB       $6EB1  
;;  $6EC5       $6EB5   $6EB9   $6EBF  
;;  $6ED0       $6EC6  
;;  $6EDA       $6ECA   $6ECE   $6ED4  
;;  $6EE5       $6EED   $6F7E  
;;  $6F31       $6F1B   $6F28  
;;  $6F52       $6F46  
;;  $6F5F       $6F5B  
;;  $6F65       $6F61  
;; ======================================================================== ;;
