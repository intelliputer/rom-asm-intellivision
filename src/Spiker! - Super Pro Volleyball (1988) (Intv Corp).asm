
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $9000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500E           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
.TITLE:
        DECLE   $0058           ; 500E  Cartridge year
        STRING  "V"             ; 500F  Title string
.TITLECODE:
        EIS                     ; 5011  Color Stack init (2, 3)
        DECLE   $0154           ; 5013  Border color init


        SUB@    R5,     R3                      ; 5014   032B
        DIS                                     ; 5015   0003
        MVII    #$02F1, R6                      ; 5016   02BE 02F1
        CLRR    R0                              ; 5018   01C0
        CLRR    R5                              ; 5019   01ED
L_501A:
        MVO@    R0,     R5                      ; 501A   0268
        CMPI    #$035D, R5                      ; 501B   037D 035D
        BNEQ    L_501A                          ; 501D   022C 0004

        MVII    #$02F1, R4                      ; 501F   02BC 02F1
        MVII    #$0027, R0                      ; 5021   02B8 0027
        SDBD                                    ; 5023   0001
        MVII    #$FFFF, R1                      ; 5024   02B9 00FF 00FF
        MVII    #$02F1, R4                      ; 5027   02BC 02F1
L_5029:
        MVO@    R1,     R4                      ; 5029   0261
        DECR    R0                              ; 502A   0010
        BNEQ    L_5029                          ; 502B   022C 0003

        MVII    #$0012, R0                      ; 502D   02B8 0012
        MVII    #$00FF, R1                      ; 502F   02B9 00FF
        MVII    #$015E, R4                      ; 5031   02BC 015E

        JSR     R5,     X_FILL_MEM              ; 5033   0004 0114 0341

        MVII    #$003F, R0                      ; 5036   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 5038   0240 01F8
        MOVR    R7,     R0                      ; 503A   00B8
        ADDI    #$00DB, R0                      ; 503B   02F8 00DB
        MVO     R0,     G_033D                  ; 503D   0240 033D

        JSR     R5,     L_5621                  ; 503F   0004 0154 0221
        DECLE   $0001,  $02B8,  $0014,  $0050   ; 5042   0001 02B8 0014 0050
        DECLE   $0240,  $02F0,  $0004,  $0194   ; 5046   0240 02F0 0004 0194
        DECLE   $037A,  $0002,  $0280,  $0102   ; 504A   037A 0002 0280 0102
        DECLE   $0010,  $0223,  $0005           ; 504E   0010 0223 0005

        MVII    #$0002, R0                      ; 5051   02B8 0002
        MVO     R0,     G_0102                  ; 5053   0240 0102

        JSR     R5,     L_5628                  ; 5055   0004 0154 0228

        MVI     G_0173, R0                      ; 5058   0280 0173
        CMPI    #$0001, R0                      ; 505A   0378 0001
        BNEQ    L_50AC                          ; 505C   020C 004E

        MVI     G_0188, R0                      ; 505E   0280 0188
        DECR    R0                              ; 5060   0010
        BMI     L_507D                          ; 5061   020B 001A

        MVO     R0,     G_0188                  ; 5063   0240 0188
        BNEQ    L_507D                          ; 5065   020C 0016

        MVI     G_0343, R5                      ; 5067   0285 0343
L_5069:
        MVI@    R5,     R0                      ; 5069   02A8
        TSTR    R0                              ; 506A   0080
        BNEQ    L_5072                          ; 506B   020C 0005

        MOVR    R7,     R5                      ; 506D   00BD
        ADDI    #$007D, R5                      ; 506E   02FD 007D
        B       L_5069                          ; 5070   0220 0008

L_5072:
        MVO     R0,     G_0188                  ; 5072   0240 0188
        MVI@    R5,     R0                      ; 5074   02A8
        SDBD                                    ; 5075   0001
        ADDI    #$92F0, R0                      ; 5076   02F8 00F0 0092
        MVO     R0,     G_0334                  ; 5079   0240 0334
        MVO     R5,     G_0343                  ; 507B   0245 0343
L_507D:
        MVI     G_017B, R4                      ; 507D   0284 017B
        DECR    R4                              ; 507F   0014
        BMI     L_50AC                          ; 5080   020B 002A

        MVO     R4,     G_017B                  ; 5082   0244 017B
        BNEQ    L_50AC                          ; 5084   020C 0026

        MVI     G_0350, R4                      ; 5086   0284 0350
        MVI@    R4,     R0                      ; 5088   02A0
        TSTR    R0                              ; 5089   0080
        BEQ     L_508E                          ; 508A   0204 0002

        ADDI    #$0002, R4                      ; 508C   02FC 0002
L_508E:
        SDBD                                    ; 508E   0001
        DECLE   $037C,  $00D3,  $0099,  $0205   ; 508F   037C 00D3 0099 0205
        DECLE   $0010,  $0001,  $02BC,  $0041   ; 5093   0010 0001 02BC 0041
        DECLE   $0098,  $0280,  $0352,  $0010   ; 5097   0098 0280 0352 0010
        DECLE   $0240,  $0352,  $020C,  $0005   ; 509B   0240 0352 020C 0005
        DECLE   $0004,  $0198,  $0234,  $0200   ; 509F   0004 0198 0234 0200
        DECLE   $0008,  $0244,  $0350,  $0004   ; 50A3   0008 0244 0350 0004

        ANDR    R3,     R0                      ; 50A7   0198
        DECR    R1                              ; 50A8   0011

        JSR     R5,     L_5621                  ; 50A9   0004 0154 0221

L_50AC:
        MVI     G_0171, R0                      ; 50AC   0280 0171
        DECR    R0                              ; 50AE   0010
        MVO     R0,     G_0171                  ; 50AF   0240 0171
        MVII    #$0001, R0                      ; 50B1   02B8 0001

        JSR     R5,     X_RAND1                 ; 50B3   0004 0114 027D
        JSR     R5,     L_5157                  ; 50B6   0004 0150 0157
        JSR     R5,     L_6885                  ; 50B9   0004 0168 0085
        JSR     R5,     L_558C                  ; 50BC   0004 0154 018C
        JSR     R5,     L_512A                  ; 50BF   0004 0150 012A
        DECLE   $0004,  $01A8,  $0154,  $0004   ; 50C2   0004 01A8 0154 0004

        ANDR    R5,     R0                      ; 50C6   01A8
        SARC    R3,     1                       ; 50C7   007B

        JSR     R5,     .EXEC.AAD               ; 50C8   0004 0118 02AD

        MVI     G_0171, R0                      ; 50CB   0280 0171
        ANDI    #$0001, R0                      ; 50CD   03B8 0001
        BNEQ    L_50DD                          ; 50CF   020C 000C

        MVI     G_0174, R0                      ; 50D1   0280 0174
        DECR    R0                              ; 50D3   0010
        BMI     L_50DD                          ; 50D4   020B 0007

        MVO     R0,     G_0174                  ; 50D6   0240 0174

        JSR     R5,     L_5720                  ; 50D8   0004 0154 0320
        BIDECLE $0004                           ; 50DB   0004 0000
L_50DD:
        MVI     G_0189, R0                      ; 50DD   0280 0189
        DECLE   $0010,  $020B,  $0007,  $0240   ; 50DF   0010 020B 0007 0240
        DECLE   $0189,  $020C,  $0003           ; 50E3   0189 020C 0003

        JSR     R5,     L_5F14                  ; 50E6   0004 015C 0314
        DECLE   $0220,  $009F,  $0028,  $0060   ; 50E9   0220 009F 0028 0060
        DECLE   $0007,  $0000,  $0007,  $0060   ; 50ED   0007 0000 0007 0060
        DECLE   $0007,  $0000,  $0007,  $0060   ; 50F1   0007 0000 0007 0060
        DECLE   $0007,  $0000,  $0007,  $0060   ; 50F5   0007 0000 0007 0060
        DECLE   $0007,  $0000,  $0010,  $0010   ; 50F9   0007 0000 0010 0010
        DECLE   $000C,  $0020,  $000C,  $0030   ; 50FD   000C 0020 000C 0030
        DECLE   $000C,  $0040,  $001E,  $0060   ; 5101   000C 0040 001E 0060
        DECLE   $000C,  $0050,  $0014,  $0060   ; 5105   000C 0050 0014 0060
        DECLE   $000F,  $0000,  $000F,  $0010   ; 5109   000F 0000 000F 0010
        DECLE   $000F,  $0000,  $000F,  $0010   ; 510D   000F 0000 000F 0010
        DECLE   $000F,  $0000,  $000F,  $0000   ; 5111   000F 0000 000F 0000
        DECLE   $0000                           ; 5115   0000

        ADCR    R5                              ; 5116   002D
        SLLC    R3,     2                       ; 5117   005F
        SAR     R1,     2                       ; 5118   006D
        SLR     R2,     1                       ; 5119   0062
        SLL     R3,     1                       ; 511A   004B
        SLR     R0,     1                       ; 511B   0060
L_511C:
        MVI@    R5,     R0                      ; 511C   02A8
        MVO     R0,     G_0172                  ; 511D   0240 0172
        SDBD                                    ; 511F   0001
        MVI@    R5,     R0                      ; 5120   02A8
        MVO     R0,     G_0341                  ; 5121   0240 0341
        MOVR    R5,     R7                      ; 5123   00AF

L_5124:
        MVI@    R5,     R0                      ; 5124   02A8
        MVO     R0,     G_0172                  ; 5125   0240 0172
        MVO     R5,     G_0341                  ; 5127   0245 0341
        PULR    R7                              ; 5129   02B7

L_512A:
        PSHR    R5                              ; 512A   0275
        MVI     G_0172, R0                      ; 512B   0280 0172
        DECR    R0                              ; 512D   0010
        BMI     L_5136                          ; 512E   020B 0006

        MVO     R0,     G_0172                  ; 5130   0240 0172
        BNEQ    L_5136                          ; 5132   020C 0002
        MVI     G_0341, R7                      ; 5134   0287 0341
L_5136:
        PULR    R7                              ; 5136   02B7

        DECLE   $0000,  $0027,  $0000,  $0068   ; 5137   0000 0027 0000 0068
        DECLE   $0000,  $000A,  $0000,  $0054   ; 513B   0000 000A 0000 0054
        DECLE   $0000,  $0027,  $0000,  $0068   ; 513F   0000 0027 0000 0068
        DECLE   $0000,  $005A,  $0000,  $00A5   ; 5143   0000 005A 0000 00A5
        DECLE   $0000,  $0048,  $0000,  $0061   ; 5147   0000 0048 0000 0061
        DECLE   $0000,  $0030,  $0000,  $0047   ; 514B   0000 0030 0000 0047
        DECLE   $0000,  $0030,  $0000,  $0047   ; 514F   0000 0030 0000 0047
        DECLE   $0000,  $0048,  $0000           ; 5153   0000 0048 0000

        SLR     R1,     1                       ; 5156   0061
L_5157:
        PSHR    R5                              ; 5157   0275

        JSR     R5,     L_6F41                  ; 5158   0004 016C 0341

        MVI     G_0342, R0                      ; 515B   0280 0342
        SWAP    R0,     1                       ; 515D   0040
        MVO     R0,     G_017A                  ; 515E   0240 017A
        CLRR    R0                              ; 5160   01C0
        MVII    #$018E, R4                      ; 5161   02BC 018E
L_5163:
        MVO     R0,     G_017B                  ; 5163   0240 017B
        MVO     R4,     G_0350                  ; 5165   0244 0350
        CLRR    R5                              ; 5167   01ED
        CMPI    #$01BE, R4                      ; 5168   037C 01BE
        BLT     L_516D                          ; 516A   0205 0001

        INCR    R5                              ; 516C   000D
L_516D:
        MVO     R5,     G_0179                  ; 516D   0245 0179
        MVI@    R4,     R0                      ; 516F   02A0
        MVO     R0,     G_0178                  ; 5170   0240 0178
        ANDI    #$0007, R0                      ; 5172   03B8 0007
        BEQ     L_5345                          ; 5174   0204 01CF

        DECR    R0                              ; 5176   0010
        SLL     R0,     1                       ; 5177   0048
        PSHR    R0                              ; 5178   0270
        SLL     R0,     2                       ; 5179   004C
        ADD@    R6,     R0                      ; 517A   02F0
        MOVR    R0,     R5                      ; 517B   0085
        ADDI    #$0107, R5                      ; 517C   02FD 0107
        MVI@    R4,     R0                      ; 517E   02A0
        SWAP    R0,     1                       ; 517F   0040
        XOR@    R5,     R0                      ; 5180   03E8
        MVI@    R4,     R1                      ; 5181   02A1
        SWAP    R1,     1                       ; 5182   0041
        XOR@    R5,     R1                      ; 5183   03E9
        SDBD                                    ; 5184   0001
        ADD@    R5,     R0                      ; 5185   02E8
        SDBD                                    ; 5186   0001
        ADD@    R5,     R1                      ; 5187   02E9
        SUBI    #$0006, R5                      ; 5188   033D 0006
        MVO     R5,     G_0351                  ; 518A   0245 0351
        MVI     G_0173, R2                      ; 518C   0282 0173
        CMPI    #$0000, R2                      ; 518E   037A 0000
        BEQ     L_52AC                          ; 5190   0204 011A

        MVI     G_034F, R2                      ; 5192   0282 034F
        MOVR    R2,     R3                      ; 5194   0093
        ANDI    #$0020, R3                      ; 5195   03BB 0020
        BEQ     L_5216                          ; 5197   0204 007D

        MOVR    R2,     R3                      ; 5199   0093
        ANDI    #$0004, R2                      ; 519A   03BA 0004
        SLR     R2,     2                       ; 519C   0066
        CMP     G_0179, R2                      ; 519D   0342 0179
        BNEQ    L_5216                          ; 519F   020C 0075

        ANDI    #$0003, R3                      ; 51A1   03BB 0003
        CMPI    #$0001, R3                      ; 51A3   037B 0001
        BNEQ    L_5216                          ; 51A5   020C 006F

        SDBD                                    ; 51A7   0001
        MVII    #$5147, R4                      ; 51A8   02BC 0047 0051
        MVI     G_0352, R3                      ; 51AB   0283 0352
        ANDI    #$0080, R3                      ; 51AD   03BB 0080
        BEQ     L_51C8                          ; 51AF   0204 0017

        MVI     G_017D, R3                      ; 51B1   0283 017D
        ANDI    #$0002, R3                      ; 51B3   03BB 0002
        BEQ     L_51BB                          ; 51B5   0204 0004

        SDBD                                    ; 51B7   0001
        MVII    #$514F, R4                      ; 51B8   02BC 004F 0051
L_51BB:
        MVI     G_0350, R2                      ; 51BB   0282 0350
        ADDI    #$0007, R2                      ; 51BD   02FA 0007
        MVI@    R2,     R2                      ; 51BF   0292
        CMPI    #$0011, R2                      ; 51C0   037A 0011
        BEQ     L_51C8                          ; 51C2   0204 0004

        CMPI    #$0012, R2                      ; 51C4   037A 0012
        BNEQ    L_5216                          ; 51C6   020C 004E

L_51C8:
        MVI     G_0175, R3                      ; 51C8   0283 0175
        ANDI    #$0001, R3                      ; 51CA   03BB 0001
        XOR     G_0179, R3                      ; 51CC   03C3 0179
        TSTR    R3                              ; 51CE   009B
        BEQ     L_51D3                          ; 51CF   0204 0002

        ADDI    #$0004, R4                      ; 51D1   02FC 0004
L_51D3:
        SDBD                                    ; 51D3   0001
        MVI@    R4,     R2                      ; 51D4   02A2
        CMPR    R2,     R1                      ; 51D5   0151
        BGE     L_51D9                          ; 51D6   020D 0001

        MOVR    R2,     R1                      ; 51D8   0091
L_51D9:
        SDBD                                    ; 51D9   0001
        MVI@    R4,     R2                      ; 51DA   02A2
        CMPR    R2,     R1                      ; 51DB   0151
        BLE     L_51DF                          ; 51DC   0206 0001

        MOVR    R2,     R1                      ; 51DE   0091
L_51DF:
        MOVR    R1,     R2                      ; 51DF   008A
        SWAP    R2,     1                       ; 51E0   0042
        ANDI    #$00FF, R2                      ; 51E1   03BA 00FF
        SUBI    #$0030, R2                      ; 51E3   033A 0030
        SDBD                                    ; 51E5   0001
        ADDI    #$6F0F, R2                      ; 51E6   02FA 000F 006F
        MVI@    R2,     R2                      ; 51E9   0292
        TSTR    R3                              ; 51EA   009B
        BNEQ    L_5200                          ; 51EB   020C 0013

        SUBI    #$0003, R2                      ; 51ED   033A 0003
        SWAP    R2,     1                       ; 51EF   0042
        SDBD                                    ; 51F0   0001
        CMPI    #$0A00, R0                      ; 51F1   0378 0000 000A
        BGE     L_51FA                          ; 51F4   020D 0004

        SDBD                                    ; 51F6   0001
        MVII    #$0A00, R0                      ; 51F7   02B8 0000 000A
L_51FA:
        CMPR    R2,     R0                      ; 51FA   0150
        BLE     L_51FE                          ; 51FB   0206 0001

        MOVR    R2,     R0                      ; 51FD   0090
L_51FE:
        B       L_52AC                          ; 51FE   0200 00AC

L_5200:
        NEGR    R2                              ; 5200   0022
        ADDI    #$00AE, R2                      ; 5201   02FA 00AE
        ADDI    #$0004, R2                      ; 5203   02FA 0004
        SWAP    R2,     1                       ; 5205   0042
        SDBD                                    ; 5206   0001
        CMPI    #$A500, R0                      ; 5207   0378 0000 00A5
        BNC     L_5210                          ; 520A   0209 0004

        SDBD                                    ; 520C   0001
        MVII    #$A500, R0                      ; 520D   02B8 0000 00A5
L_5210:
        CMPR    R2,     R0                      ; 5210   0150
        BC      L_5214                          ; 5211   0201 0001

        MOVR    R2,     R0                      ; 5213   0090
L_5214:
        B       L_52AC                          ; 5214   0200 0096

L_5216:
        MVI     G_0350, R4                      ; 5216   0284 0350
        CLRR    R2                              ; 5218   01D2
        MVI     G_0175, R3                      ; 5219   0283 0175
        ANDI    #$0001, R3                      ; 521B   03BB 0001
        CMPI    #$01BE, R4                      ; 521D   037C 01BE
        BLT     L_5222                          ; 521F   0205 0001

        INCR    R2                              ; 5221   000A
L_5222:
        SDBD                                    ; 5222   0001
        MVII    #$5137, R4                      ; 5223   02BC 0037 0051
        XORR    R3,     R2                      ; 5226   01DA
        BEQ     L_522B                          ; 5227   0204 0002

        ADDI    #$0008, R4                      ; 5229   02FC 0008
L_522B:
        CLRR    R3                              ; 522B   01DB
        SDBD                                    ; 522C   0001
        MVI@    R4,     R2                      ; 522D   02A2
        CMPR    R2,     R1                      ; 522E   0151
        BC      L_5233                          ; 522F   0201 0002

        MOVR    R2,     R1                      ; 5231   0091
        INCR    R3                              ; 5232   000B
L_5233:
        SDBD                                    ; 5233   0001
        MVI@    R4,     R2                      ; 5234   02A2
        CMPR    R1,     R2                      ; 5235   014A
        BC      L_523A                          ; 5236   0201 0002

        MOVR    R2,     R1                      ; 5238   0091
        INCR    R3                              ; 5239   000B
L_523A:
        SDBD                                    ; 523A   0001
        MVI@    R4,     R2                      ; 523B   02A2
        CMPR    R2,     R0                      ; 523C   0150
        BC      L_5241                          ; 523D   0201 0002

        MOVR    R2,     R0                      ; 523F   0090
        INCR    R3                              ; 5240   000B
L_5241:
        SDBD                                    ; 5241   0001
        MVI@    R4,     R2                      ; 5242   02A2
        CMPR    R0,     R2                      ; 5243   0142
        BC      L_5248                          ; 5244   0201 0002

        MOVR    R2,     R0                      ; 5246   0090
        INCR    R3                              ; 5247   000B
L_5248:
        TSTR    R3                              ; 5248   009B
        BEQ     L_52AC                          ; 5249   0204 0061

        MOVR    R0,     R2                      ; 524B   0082
        MVI     G_0350, R4                      ; 524C   0284 0350
        ADDI    #$0007, R4                      ; 524E   02FC 0007
        MVI@    R4,     R0                      ; 5250   02A0

        JSR     R5,     L_5944                  ; 5251   0004 0158 0144
        BIDECLE $53D1                           ; 5254   00D1 0053

        BEQ     L_526E                          ; 5256   0204 0016

        JSR     R5,     L_5944                  ; 5258   0004 0158 0144
        BIDECLE $53D7                           ; 525B   00D7 0053

        BNEQ    L_52A4                          ; 525D   020C 0045

        MVI     G_0350, R4                      ; 525F   0284 0350

        JSR     R5,     L_67F4                  ; 5261   0004 0164 03F4

        MVI     G_0352, R5                      ; 5264   0285 0352
        ANDI    #$0080, R5                      ; 5266   03BD 0080
        BNEQ    L_52AB                          ; 5268   020C 0041

        MVII    #$000F, R3                      ; 526A   02BB 000F
        B       L_5275                          ; 526C   0200 0007

L_526E:
        MVII    #$000E, R3                      ; 526E   02BB 000E
        MVI     G_0350, R4                      ; 5270   0284 0350

        JSR     R5,     L_67F4                  ; 5272   0004 0164 03F4

L_5275:
        MOVR    R2,     R0                      ; 5275   0090
        SDBD                                    ; 5276   0001
        CMPI    #$5400, R0                      ; 5277   0378 0000 0054
        BEQ     L_5282                          ; 527A   0204 0006

        SDBD                                    ; 527C   0001
        CMPI    #$5A00, R0                      ; 527D   0378 0000 005A
        BNEQ    L_52AC                          ; 5280   020C 002A

L_5282:
        MVI     G_034F, R5                      ; 5282   0285 034F
        ANDI    #$0080, R5                      ; 5284   03BD 0080
        BNEQ    L_52AC                          ; 5286   020C 0024

        PSHR    R0                              ; 5288   0270
        PSHR    R1                              ; 5289   0271
        MVI     G_0179, R0                      ; 528A   0280 0179
        XORI    #$0001, R0                      ; 528C   03F8 0001
        SWAP    R0,     1                       ; 528E   0040
        SLR     R0,     2                       ; 528F   0064

        JSR     R5,     L_6EAE                  ; 5290   0004 016C 02AE

        MVII    #$000A, R0                      ; 5293   02B8 000A
        MVO     R0,     G_0174                  ; 5295   0240 0174
        PSHR    R3                              ; 5297   0273

        JSR     R5,     L_6378                  ; 5298   0004 0160 0378
        DECLE   $0004                           ; 529B   0004

        PULR    R1                              ; 529C   02B1

        JSR     R5,     L_5D41                  ; 529D   0004 015C 0141

        PULR    R1                              ; 52A0   02B1
        PULR    R0                              ; 52A1   02B0
        B       L_52AC                          ; 52A2   0200 0008

L_52A4:
        MVI     G_0350, R4                      ; 52A4   0284 0350
        MVII    #$0015, R0                      ; 52A6   02B8 0015

        JSR     R5,     L_67E2                  ; 52A8   0004 0164 03E2

L_52AB:
        MOVR    R2,     R0                      ; 52AB   0090
L_52AC:
        MVI     G_0350, R4                      ; 52AC   0284 0350
        MVI     G_0351, R5                      ; 52AE   0285 0351
        INCR    R4                              ; 52B0   000C
        MVO@    R0,     R5                      ; 52B1   0268
        SWAP    R0,     1                       ; 52B2   0040
        MVO@    R0,     R4                      ; 52B3   0260
        ANDI    #$00FF, R0                      ; 52B4   03B8 00FF
        MVO@    R1,     R5                      ; 52B6   0269
        SWAP    R1,     1                       ; 52B7   0041
        MVO@    R1,     R4                      ; 52B8   0261
        ANDI    #$007F, R1                      ; 52B9   03B9 007F
        ADDI    #$0004, R5                      ; 52BB   02FD 0004
        SDBD                                    ; 52BD   0001
        MVI@    R5,     R2                      ; 52BE   02AA
        MVI     G_0178, R3                      ; 52BF   0283 0178
        ANDI    #$0040, R3                      ; 52C1   03BB 0040
        BEQ     L_52E5                          ; 52C3   0204 0020

        SDBD                                    ; 52C5   0001
        MVI@    R5,     R3                      ; 52C6   02AB
        ADDR    R3,     R2                      ; 52C7   00DA
        SUBI    #$000B, R3                      ; 52C8   033B 000B
        TSTR    R2                              ; 52CA   0092
        BPL     L_52DB                          ; 52CB   0203 000E

        MVII    #$0001, R2                      ; 52CD   02BA 0001
        MVO@    R2,     R4                      ; 52CF   0262
        MVI     G_0178, R2                      ; 52D0   0282 0178
        ANDI    #$00BF, R2                      ; 52D2   03BA 00BF
        MVO     R2,     G_0178                  ; 52D4   0242 0178
        MVI     G_0350, R3                      ; 52D6   0283 0350
        MVO@    R2,     R3                      ; 52D8   025A
        CLRR    R2                              ; 52D9   01D2
        CLRR    R3                              ; 52DA   01DB
L_52DB:
        SUBI    #$0004, R5                      ; 52DB   033D 0004
        MVO@    R2,     R5                      ; 52DD   026A
        SWAP    R2,     1                       ; 52DE   0042
        MVO@    R2,     R5                      ; 52DF   026A
        ANDI    #$00FF, R2                      ; 52E0   03BA 00FF
        MVO@    R3,     R5                      ; 52E2   026B
        SWAP    R3,     1                       ; 52E3   0043
        MVO@    R3,     R5                      ; 52E4   026B
L_52E5:
        SUBI    #$0010, R1                      ; 52E5   0339 0010
        SUBR    R2,     R1                      ; 52E7   0111
        BPL     L_52EC                          ; 52E8   0203 0002

        MVII    #$007F, R1                      ; 52EA   02B9 007F
L_52EC:
        MVI     G_0178, R3                      ; 52EC   0283 0178
        ANDI    #$0007, R3                      ; 52EE   03BB 0007
        ADDI    #$0319, R3                      ; 52F0   02FB 0319
        SUBI    #$0004, R0                      ; 52F2   0338 0004
        XORI    #$0180, R1                      ; 52F4   03F9 0180

        JSR     R5,     L_53DB                  ; 52F6   0004 0150 03DB

        BEQ     L_52FC                          ; 52F9   0204 0001

        INCR    R0                              ; 52FB   0008
L_52FC:
        XORI    #$0200, R0                      ; 52FC   03F8 0200
        MVO     R0,     G_034D                  ; 52FE   0240 034D
        XORR    R2,     R1                      ; 5300   01D1
        MVO     R1,     G_034E                  ; 5301   0241 034E
        MVI     G_017B, R0                      ; 5303   0280 017B
        SLL     R0,     2                       ; 5305   004C
        SLL     R0,     2                       ; 5306   004C
        ADDI    #$0140, R0                      ; 5307   02F8 0140
        MVI     G_0178, R2                      ; 5309   0282 0178
        SLL     R2,     1                       ; 530B   004A
        SWAP    R2,     1                       ; 530C   0042
        ANDI    #$0001, R2                      ; 530D   03BA 0001
        BEQ     L_531C                          ; 530F   0204 000B

        MVI     G_0352, R5                      ; 5311   0285 0352
        ANDI    #$000C, R5                      ; 5313   03BD 000C
        BEQ     L_531C                          ; 5315   0204 0005

        MVI     G_017B, R5                      ; 5317   0285 017B
        ANDI    #$0001, R5                      ; 5319   03BD 0001
        ADDR    R5,     R2                      ; 531B   00EA
L_531C:
        ADDR    R2,     R2                      ; 531C   00D2
        MOVR    R2,     R5                      ; 531D   0095
        ADDR    R7,     R5                      ; 531E   00FD
        ADDI    #$00A6, R5                      ; 531F   02FD 00A6
        CMPI    #$01A0, R0                      ; 5321   0378 01A0
        BLT     L_5327                          ; 5323   0205 0002

        ADDI    #$0006, R5                      ; 5325   02FD 0006
L_5327:
        SDBD                                    ; 5327   0001
        XOR@    R5,     R0                      ; 5328   03E8
        MVI     G_0350, R4                      ; 5329   0284 0350
        ADDI    #$0007, R4                      ; 532B   02FC 0007
        MVI@    R4,     R4                      ; 532D   02A4
        CMPI    #$000F, R4                      ; 532E   037C 000F
        BEQ     L_5336                          ; 5330   0204 0004

        CMPI    #$0010, R4                      ; 5332   037C 0010
        BNEQ    L_533A                          ; 5334   020C 0004

L_5336:
        SDBD                                    ; 5336   0001
        XORI    #$2000, R0                      ; 5337   03F8 0000 0020
L_533A:
        MVI     G_034D, R1                      ; 533A   0281 034D
        MVI     G_034E, R5                      ; 533C   0285 034E
        MVO@    R1,     R3                      ; 533E   0259
        ADDI    #$0008, R3                      ; 533F   02FB 0008
        MVO@    R5,     R3                      ; 5341   025D
        ADDI    #$0008, R3                      ; 5342   02FB 0008
        MVO@    R0,     R3                      ; 5344   0258
L_5345:
        MVI     G_0350, R4                      ; 5345   0284 0350
        ADDI    #$0003, R4                      ; 5347   02FC 0003
        MVI@    R4,     R0                      ; 5349   02A0
        DECR    R4                              ; 534A   0014
        DECR    R0                              ; 534B   0010
        BMI     L_5354                          ; 534C   020B 0006

        MVO@    R0,     R4                      ; 534E   0260
        BNEQ    L_5354                          ; 534F   020C 0003

L_5351:
        JSR     R5,     L_65BC                  ; 5351   0004 0164 01BC

L_5354:
        MVI     G_0350, R3                      ; 5354   0283 0350
        ADDI    #$0005, R3                      ; 5356   02FB 0005
        MVI@    R3,     R0                      ; 5358   0298
        DECR    R0                              ; 5359   0010
        BMI     L_5394                          ; 535A   020B 0038
        BNEQ    L_5393                          ; 535C   020C 0035

        INCR    R3                              ; 535E   000B
        MVI@    R3,     R1                      ; 535F   0299
        INCR    R1                              ; 5360   0009
        INCR    R3                              ; 5361   000B
        MVI@    R3,     R5                      ; 5362   029D
        MVO     R5,     G_0351                  ; 5363   0245 0351
        DECR    R3                              ; 5365   0013
        ADDR    R5,     R5                      ; 5366   00ED
        SDBD                                    ; 5367   0001
        ADDI    #$656A, R5                      ; 5368   02FD 006A 0065
        SDBD                                    ; 536B   0001
        MVI@    R5,     R2                      ; 536C   02AA
        MVI@    R2,     R0                      ; 536D   0290
        ADDR    R1,     R2                      ; 536E   00CA
        MVI@    R2,     R5                      ; 536F   0295
        CMPI    #$03FD, R5                      ; 5370   037D 03FD
        BLT     L_5384                          ; 5372   0205 0010

        CMPI    #$03FF, R5                      ; 5374   037D 03FF
        BEQ     L_5351                          ; 5376   0224 0026

        CMPI    #$03FE, R5                      ; 5378   037D 03FE
        BEQ     L_5382                          ; 537A   0204 0006

        INCR    R2                              ; 537C   000A
        MVI@    R2,     R0                      ; 537D   0290
        ADDI    #$0002, R1                      ; 537E   02F9 0002
        B       L_5384                          ; 5380   0200 0002

L_5382:
        MVII    #$0001, R1                      ; 5382   02B9 0001
L_5384:
        MVO@    R1,     R3                      ; 5384   0259
        DECR    R3                              ; 5385   0013
        MVI     G_0351, R5                      ; 5386   0285 0351
        CMPI    #$0015, R5                      ; 5388   037D 0015
        BNEQ    L_5393                          ; 538A   020C 0007

        MVII    #$0004, R0                      ; 538C   02B8 0004

        JSR     R5,     X_RAND1                 ; 538E   0004 0114 027D

        ADDI    #$000B, R0                      ; 5391   02F8 000B
L_5393:
        MVO@    R0,     R3                      ; 5393   0258
L_5394:
        INCR    R3                              ; 5394   000B
        MVI@    R3,     R1                      ; 5395   0299
        INCR    R3                              ; 5396   000B
        MVI@    R3,     R5                      ; 5397   029D
        ADDR    R5,     R5                      ; 5398   00ED
        SDBD                                    ; 5399   0001
        ADDI    #$656A, R5                      ; 539A   02FD 006A 0065
        SDBD                                    ; 539D   0001
        MVI@    R5,     R4                      ; 539E   02AC
        ADDR    R1,     R4                      ; 539F   00CC
        MVI@    R4,     R1                      ; 53A0   02A1
        SLL     R1,     2                       ; 53A1   004D
        SLL     R1,     2                       ; 53A2   004D
        SDBD                                    ; 53A3   0001
        ADDI    #$93AA, R1                      ; 53A4   02F9 00AA 0093
        MVI     G_0178, R2                      ; 53A7   0282 0178
        ANDI    #$0007, R2                      ; 53A9   03BA 0007
        BNEQ    L_53B4                          ; 53AB   020C 0007

        JSR     R5,     L_53DB                  ; 53AD   0004 0150 03DB

        BEQ     L_53B4                          ; 53B0   0204 0002

        ADDI    #$00A0, R1                      ; 53B2   02F9 00A0
L_53B4:
        MVI     G_017B, R2                      ; 53B4   0282 017B
        ADDI    #$0331, R2                      ; 53B6   02FA 0331
        MVO@    R1,     R2                      ; 53B8   0251
        MVI     G_017B, R0                      ; 53B9   0280 017B
        MVI     G_0350, R4                      ; 53BB   0284 0350
        ADDI    #$0008, R4                      ; 53BD   02FC 0008
        INCR    R0                              ; 53BF   0008
        CMPI    #$000C, R0                      ; 53C0   0378 000C
        BLT     L_5163                          ; 53C2   0225 0260
        PULR    R7                              ; 53C4   02B7

        DECLE   $0002,  $0008,  $0002,  $0018   ; 53C5   0002 0008 0002 0018
        DECLE   $0007,  $0018,  $0001,  $0008   ; 53C9   0007 0018 0001 0008
        DECLE   $0005,  $0018,  $0000,  $0008   ; 53CD   0005 0018 0000 0008
        DECLE   $0005,  $0027,  $0028,  $001F   ; 53D1   0005 0027 0028 001F

        COMR    R4                              ; 53D5   001C
        COMR    R5                              ; 53D6   001D
        DIS                                     ; 53D7   0003
        NEGR    R0                              ; 53D8   0020
        NEGR    R1                              ; 53D9   0021
        NEGR    R2                              ; 53DA   0022
L_53DB:
        PSHR    R5                              ; 53DB   0275
        PSHR    R0                              ; 53DC   0270
        MVI     G_0350, R5                      ; 53DD   0285 0350
        MVI@    R5,     R0                      ; 53DF   02A8
        MOVR    R0,     R2                      ; 53E0   0082
        SLR     R2,     1                       ; 53E1   0062
        ANDI    #$0004, R2                      ; 53E2   03BA 0004
        ANDI    #$0010, R0                      ; 53E4   03B8 0010
        BEQ     L_53F0                          ; 53E6   0204 0008

        CLRR    R2                              ; 53E8   01D2
        MVI     G_017A, R0                      ; 53E9   0280 017A
        CMP@    R5,     R0                      ; 53EB   0368
        BGT     L_53F0                          ; 53EC   020E 0002

        MVII    #$0004, R2                      ; 53EE   02BA 0004
L_53F0:
        SWAP    R2,     1                       ; 53F0   0042
        PULR    R0                              ; 53F1   02B0
        PULR    R7                              ; 53F2   02B7

L_53F3:
        PSHR    R5                              ; 53F3   0275
        MVII    #$0006, R5                      ; 53F4   02BD 0006
        INCR    R4                              ; 53F6   000C
L_53F7:
        MVO@    R0,     R4                      ; 53F7   0260
        MVO@    R1,     R4                      ; 53F8   0261
        ADDI    #$0006, R4                      ; 53F9   02FC 0006
        DECR    R5                              ; 53FB   0015
        BNEQ    L_53F7                          ; 53FC   022C 0006
        PULR    R7                              ; 53FE   02B7

L_53FF:
        PSHR    R5                              ; 53FF   0275
        MVII    #$018E, R1                      ; 5400   02B9 018E
        MVII    #$000C, R3                      ; 5402   02BB 000C
        MVI     G_0352, R0                      ; 5404   0280 0352
        ANDI    #$0080, R0                      ; 5406   03B8 0080
        BEQ     L_541E                          ; 5408   0204 0014

        MVII    #$018E, R4                      ; 540A   02BC 018E

        JSR     R5,     L_5412                  ; 540C   0004 0154 0012

        MVII    #$01BE, R4                      ; 540F   02BC 01BE
        INCR    R7                              ; 5411   000F

L_5412:
        PSHR    R5                              ; 5412   0275
L_5413:
        MVII    #$0006, R3                      ; 5413   02BB 0006
        MOVR    R4,     R1                      ; 5415   00A1
        MVI     G_0352, R0                      ; 5416   0280 0352
        ANDI    #$0080, R0                      ; 5418   03B8 0080
        BEQ     L_541E                          ; 541A   0204 0002

        MVII    #$0002, R3                      ; 541C   02BB 0002
L_541E:
        MVI@    R1,     R0                      ; 541E   0288
        ANDI    #$00DF, R0                      ; 541F   03B8 00DF
        XORI    #$0020, R0                      ; 5421   03F8 0020
        MVO@    R0,     R1                      ; 5423   0248
        ADDI    #$0008, R1                      ; 5424   02F9 0008
        DECR    R3                              ; 5426   0013
        BNEQ    L_541E                          ; 5427   022C 000A
        PULR    R7                              ; 5429   02B7

L_542A:
        MVI@    R5,     R0                      ; 542A   02A8
        PSHR    R5                              ; 542B   0275
        PSHR    R3                              ; 542C   0273
        MVII    #$000C, R3                      ; 542D   02BB 000C
        MVI     G_0352, R5                      ; 542F   0285 0352
        ANDI    #$0080, R5                      ; 5431   03BD 0080
        BEQ     L_5437                          ; 5433   0204 0002

        MVII    #$0004, R3                      ; 5435   02BB 0004
L_5437:
        MOVR    R0,     R1                      ; 5437   0081
        ADDR    R3,     R1                      ; 5438   00D9
        MVI     G_0175, R5                      ; 5439   0285 0175
        ANDI    #$0001, R5                      ; 543B   03BD 0001
        BEQ     L_5441                          ; 543D   0204 0002

        SUBR    R3,     R1                      ; 543F   0119
        ADDR    R3,     R0                      ; 5440   00D8
L_5441:
        MVO     R0,     G_0143                  ; 5441   0240 0143
        MVO     R1,     G_0144                  ; 5443   0241 0144
        PULR    R3                              ; 5445   02B3
        PULR    R7                              ; 5446   02B7

L_5447:
        MVI@    R5,     R0                      ; 5447   02A8
L_5448:
        PSHR    R5                              ; 5448   0275
        PSHR    R3                              ; 5449   0273
        MVII    #$000C, R3                      ; 544A   02BB 000C
        MVI     G_0352, R5                      ; 544C   0285 0352
        ANDI    #$0080, R5                      ; 544E   03BD 0080
        BEQ     L_5454                          ; 5450   0204 0002

        MVII    #$0004, R3                      ; 5452   02BB 0004
L_5454:
        MVI     G_0175, R5                      ; 5454   0285 0175
        ANDI    #$0001, R5                      ; 5456   03BD 0001
        CMPI    #$01BE, R4                      ; 5458   037C 01BE
        BLT     L_5464                          ; 545A   0205 0008

        TSTR    R5                              ; 545C   00AD
        BNEQ    L_5460                          ; 545D   020C 0001

        ADDR    R3,     R0                      ; 545F   00D8
L_5460:
        MVO     R0,     G_0144                  ; 5460   0240 0144
        PULR    R3                              ; 5462   02B3
        PULR    R7                              ; 5463   02B7

L_5464:
        TSTR    R5                              ; 5464   00AD
        BEQ     L_5468                          ; 5465   0204 0001

        ADDR    R3,     R0                      ; 5467   00D8
L_5468:
        MVO     R0,     G_0143                  ; 5468   0240 0143
        PULR    R3                              ; 546A   02B3
        PULR    R7                              ; 546B   02B7

        PSHR    R5                              ; 546C   0275
        MVI     G_0102, R0                      ; 546D   0280 0102
        DECR    R0                              ; 546F   0010
        BMI     L_54CF                          ; 5470   020B 005D

        MVO     R0,     G_0102                  ; 5472   0240 0102
        MVII    #$0319, R4                      ; 5474   02BC 0319
        CLRR    R5                              ; 5476   01ED
        MVO     R5,     .STIC.HDLY              ; 5477   0245 0030
        MVO     R5,     .STIC.VDLY              ; 5479   0245 0031
        MVI@    R4,     R0                      ; 547B   02A0
        MVO@    R0,     R5                      ; 547C   0268
        MVI@    R4,     R0                      ; 547D   02A0
        MVO@    R0,     R5                      ; 547E   0268
        MVI@    R4,     R0                      ; 547F   02A0
        MVO@    R0,     R5                      ; 5480   0268
        MVI@    R4,     R0                      ; 5481   02A0
        MVO@    R0,     R5                      ; 5482   0268
        MVI@    R4,     R0                      ; 5483   02A0
        MVO@    R0,     R5                      ; 5484   0268
        MVI@    R4,     R0                      ; 5485   02A0
        MVO@    R0,     R5                      ; 5486   0268
        MVI@    R4,     R0                      ; 5487   02A0
        MVO@    R0,     R5                      ; 5488   0268
        MVI@    R4,     R0                      ; 5489   02A0
        MVO@    R0,     R5                      ; 548A   0268
        MVI@    R4,     R0                      ; 548B   02A0
        MVO@    R0,     R5                      ; 548C   0268
        MVI@    R4,     R0                      ; 548D   02A0
        MVO@    R0,     R5                      ; 548E   0268
        MVI@    R4,     R0                      ; 548F   02A0
        MVO@    R0,     R5                      ; 5490   0268
        MVI@    R4,     R0                      ; 5491   02A0
        MVO@    R0,     R5                      ; 5492   0268
        MVI@    R4,     R0                      ; 5493   02A0
        MVO@    R0,     R5                      ; 5494   0268
        MVI@    R4,     R0                      ; 5495   02A0
        MVO@    R0,     R5                      ; 5496   0268
        MVI@    R4,     R0                      ; 5497   02A0
        MVO@    R0,     R5                      ; 5498   0268
        MVI@    R4,     R0                      ; 5499   02A0
        MVO@    R0,     R5                      ; 549A   0268
        MVI@    R4,     R0                      ; 549B   02A0
        MVO@    R0,     R5                      ; 549C   0268
        MVI@    R4,     R0                      ; 549D   02A0
        MVO@    R0,     R5                      ; 549E   0268
        MVI@    R4,     R0                      ; 549F   02A0
        MVO@    R0,     R5                      ; 54A0   0268
        MVI@    R4,     R0                      ; 54A1   02A0
        MVO@    R0,     R5                      ; 54A2   0268
        MVI@    R4,     R0                      ; 54A3   02A0
        MVO@    R0,     R5                      ; 54A4   0268
        MVI@    R4,     R0                      ; 54A5   02A0
        MVO@    R0,     R5                      ; 54A6   0268
        MVI@    R4,     R0                      ; 54A7   02A0
        MVO@    R0,     R5                      ; 54A8   0268
        MVI@    R4,     R0                      ; 54A9   02A0
        MVO@    R0,     R5                      ; 54AA   0268
        MVI     G_0103, R0                      ; 54AB   0280 0103
        MVO     R0,     .STIC.EDGE              ; 54AD   0240 0032
        MVO     R0,     .STIC.MODE              ; 54AF   0240 0021
        ANDI    #$0004, R0                      ; 54B1   03B8 0004
        BNEQ    L_54B7                          ; 54B3   020C 0002

        MVI     .STIC.MODE,R0                   ; 54B5   0280 0021
L_54B7:
        SLR     R0,     2                       ; 54B7   0064
        MVO     R0,     G_0105                  ; 54B8   0240 0105
        MVI     G_0104, R0                      ; 54BA   0280 0104
        MVO     R0,     .STIC.BORD              ; 54BC   0240 002C
        ANDI    #$00F0, R0                      ; 54BE   03B8 00F0
        SLR     R0,     2                       ; 54C0   0064
        MOVR    R7,     R4                      ; 54C1   00BC
        ADDI    #$007E, R4                      ; 54C2   02FC 007E
        ADDR    R0,     R4                      ; 54C4   00C4
        MVII    #$0028, R5                      ; 54C5   02BD 0028
        MVI@    R4,     R0                      ; 54C7   02A0
        MVO@    R0,     R5                      ; 54C8   0268
        MVI@    R4,     R0                      ; 54C9   02A0
        MVO@    R0,     R5                      ; 54CA   0268
        MVI@    R4,     R0                      ; 54CB   02A0
        MVO@    R0,     R5                      ; 54CC   0268
        MVI@    R4,     R0                      ; 54CD   02A0
        MVO@    R0,     R5                      ; 54CE   0268
L_54CF:
        MVI     G_015D, R4                      ; 54CF   0284 015D
        ADDR    R4,     R4                      ; 54D1   00E4
        BEQ     L_54F8                          ; 54D2   0204 0024

        CLRR    R0                              ; 54D4   01C0
        MVO     R0,     .STIC.BORD              ; 54D5   0240 002C
        SDBD                                    ; 54D7   0001
        ADDI    #$58B7, R4                      ; 54D8   02FC 00B7 0058
        SDBD                                    ; 54DB   0001
        MVI@    R4,     R5                      ; 54DC   02A5
        MVO     R6,     G_033F                  ; 54DD   0246 033F
        SDBD                                    ; 54DF   0001
        MVII    #$10EF, R1                      ; 54E0   02B9 00EF 0010
        MVI@    R1,     R1                      ; 54E3   0289
        CMPI    #$0004, R1                      ; 54E4   0379 0004
        BNEQ    L_54EA                          ; 54E6   020C 0002

        MVII    #$0200, R6                      ; 54E8   02BE 0200

L_54EA:
        JSRD    R4,     X_NEW_GRAM_INIT         ; 54EA   0004 001E 0335

        MVI     G_033F, R6                      ; 54ED   0286 033F
        CLRR    R0                              ; 54EF   01C0
        MVO     R0,     G_015D                  ; 54F0   0240 015D

        JSR     R5,     L_593B                  ; 54F2   0004 0158 013B

        EIS                                     ; 54F5   0002
        B       L_5511                          ; 54F6   0200 0019

L_54F8:
        JSR     R5,     L_56B0                  ; 54F8   0004 0154 02B0
        DECLE   $0004                           ; 54FB   0004

        ANDR    R5,     R0                      ; 54FC   01A8
        SUBR    R2,     R4                      ; 54FD   0114
        MVI     G_0170, R0                      ; 54FE   0280 0170
        TSTR    R0                              ; 5500   0080
        BEQ     L_550F                          ; 5501   0204 000C

        CMPI    #$00FF, R0                      ; 5503   0378 00FF
        BEQ     L_550A                          ; 5505   0204 0003

        DECR    R0                              ; 5507   0010
        MVO     R0,     G_0170                  ; 5508   0240 0170
L_550A:
        CLRR    R0                              ; 550A   01C0
        MVO     R0,     .STIC.BORD              ; 550B   0240 002C
        B       L_5511                          ; 550D   0200 0002

L_550F:
        MVO     R0,     .STIC.VIDEN             ; 550F   0240 0020
L_5511:
        MVII    #$0331, R2                      ; 5511   02BA 0331
        SDBD                                    ; 5513   0001
        MVII    #$3940, R1                      ; 5514   02B9 0040 0039
        MVII    #$0003, R3                      ; 5517   02BB 0003
        MVI     G_0106, R0                      ; 5519   0280 0106
        XORI    #$0001, R0                      ; 551B   03F8 0001
        MVO     R0,     G_0106                  ; 551D   0240 0106
        BEQ     L_5525                          ; 551F   0204 0004

        ADDI    #$0006, R2                      ; 5521   02FA 0006
        ADDI    #$0060, R1                      ; 5523   02F9 0060
L_5525:
        MVI@    R2,     R4                      ; 5525   0294
        MVII    #$0001, R0                      ; 5526   02B8 0001

        JSR     R5,     L_574D                  ; 5528   0004 0154 034D

        INCR    R2                              ; 552B   000A
        MVI@    R2,     R4                      ; 552C   0294
        MVII    #$0001, R0                      ; 552D   02B8 0001

        JSR     R5,     L_574D                  ; 552F   0004 0154 034D

        INCR    R2                              ; 5532   000A
        DECR    R3                              ; 5533   0013
        BNEQ    L_5525                          ; 5534   022C 0010

        MVI     G_0170, R0                      ; 5536   0280 0170
        CMPI    #$00FF, R0                      ; 5538   0378 00FF
        BEQ     L_553F                          ; 553A   0204 0003

        JSR     R5,     X_PLAY_NOTE             ; 553C   0004 0118 02BD

L_553F:
        PULR    R7                              ; 553F   02B7

        DECLE   $000E,  $0003,  $000E,  $0003   ; 5540   000E 0003 000E 0003
        DECLE   $0001,  $0003,  $0003,  $0003   ; 5544   0001 0003 0003 0003
        DECLE   $0008,  $0003,  $0008,  $0003   ; 5548   0008 0003 0008 0003
        DECLE   $0000,  $0001,  $0000,  $0000   ; 554C   0000 0001 0000 0000
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5550   0003 0003 0003 0003
        DECLE   $0001,  $0012,  $0006,  $0000   ; 5554   0001 0012 0006 0000
        DECLE   $000A,  $0004,  $0008,  $0002   ; 5558   000A 0004 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 555C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 5560   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5564   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; 5568   0000 0004 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 556C   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 5570   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 5574   0000 0003 0000 0004

        INCR    R7                              ; 5578   000F

        DECR    R0                              ; 5579   0010
L_557A:
        INCR    R4                              ; 557A   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 557B   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 557F   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 5583   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 5587   0005 000E 0001 000D
        DECLE   $0000                           ; 558B   0000
L_558C:
        PSHR    R5                              ; 558C   0275

        JSR     R5,     L_564F                  ; 558D   0004 0154 024F
        JSR     R5,     L_5597                  ; 5590   0004 0154 0197
        JSR     R5,     L_55E5                  ; 5593   0004 0154 01E5

        PULR    R7                              ; 5596   02B7

L_5597:
        PSHR    R5                              ; 5597   0275
        MVI     G_0161, R0                      ; 5598   0280 0161
        MVII    #$015E, R4                      ; 559A   02BC 015E

        JSR     R5,     L_55A4                  ; 559C   0004 0154 01A4

        MVI     G_0165, R0                      ; 559F   0280 0165
        MVII    #$0162, R4                      ; 55A1   02BC 0162
        INCR    R7                              ; 55A3   000F

L_55A4:
        PSHR    R5                              ; 55A4   0275
L_55A5:
        MOVR    R0,     R1                      ; 55A5   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; 55A6   0065 0065 0061 0001
        DECLE   $02F9,  $0054,  $0055,  $0289   ; 55AA   02F9 0054 0055 0289
        DECLE   $0079,  $0201,  $001F,  $0079   ; 55AE   0079 0201 001F 0079
        DECLE   $0201,  $0020,  $02BD,  $00FF   ; 55B2   0201 0020 02BD 00FF
        DECLE   $0265,  $0265,  $0082,  $03B8   ; 55B6   0265 0265 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; 55BA   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; 55BE   000F 0001

        ADDI    #$005C, R2                      ; 55C0   02FA 005C
        RLC     R1,     2                       ; 55C2   0055
        ADD@    R2,     R1                      ; 55C3   02D1
        CMPI    #$000A, R1                      ; 55C4   0379 000A
        BLE     L_55D2                          ; 55C6   0206 000A

        SUBI    #$000B, R1                      ; 55C8   0339 000B
        BEQ     L_55D2                          ; 55CA   0204 0006

        ADDI    #$000A, R1                      ; 55CC   02F9 000A
        B       L_55D2                          ; 55CE   0200 0002

        MVII    #$00FF, R1                      ; 55D0   02B9 00FF
L_55D2:
        MVO@    R1,     R4                      ; 55D2   0261
        PULR    R7                              ; 55D3   02B7

        MOVR    R0,     R2                      ; 55D4   0082
        ANDI    #$001F, R2                      ; 55D5   03BA 001F
        SDBD                                    ; 55D7   0001
        ADDI    #$556C, R2                      ; 55D8   02FA 006C 0055
        MVI@    R2,     R2                      ; 55DB   0292
        DECR    R2                              ; 55DC   0012
        MVO@    R2,     R4                      ; 55DD   0262
        XORI    #$00FF, R1                      ; 55DE   03F9 00FF
        MVO@    R1,     R4                      ; 55E0   0261
        MVII    #$00FF, R2                      ; 55E1   02BA 00FF
        MVO@    R2,     R4                      ; 55E3   0262
        PULR    R7                              ; 55E4   02B7

L_55E5:
        PSHR    R5                              ; 55E5   0275
        CLRR    R1                              ; 55E6   01C9
        MVII    #$015E, R2                      ; 55E7   02BA 015E
        MVII    #$0166, R3                      ; 55E9   02BB 0166
        MVI     G_033D, R4                      ; 55EB   0284 033D

        JSR     R5,     L_55F9                  ; 55ED   0004 0154 01F9

        MVII    #$0001, R1                      ; 55F0   02B9 0001
        MVII    #$0162, R2                      ; 55F2   02BA 0162
        MVII    #$0169, R3                      ; 55F4   02BB 0169
        MVI     G_033D, R4                      ; 55F6   0284 033D
        INCR    R7                              ; 55F8   000F

L_55F9:
        PSHR    R5                              ; 55F9   0275
L_55FA:
        MVII    #$0002, R5                      ; 55FA   02BD 0002
L_55FC:
        PSHR    R5                              ; 55FC   0275
        MVI@    R2,     R0                      ; 55FD   0290
        CMP@    R3,     R0                      ; 55FE   0358
        BNEQ    L_5605                          ; 55FF   020C 0004

        CMPI    #$00FF, R0                      ; 5601   0378 00FF
        BEQ     L_5616                          ; 5603   0204 0011

L_5605:
        PSHR    R4                              ; 5605   0274
        PSHR    R3                              ; 5606   0273
        PSHR    R2                              ; 5607   0272
        NOP                                     ; 5608   0034
        PSHR    R1                              ; 5609   0271
        MOVR    R7,     R5                      ; 560A   00BD
        ADDI    #$0004, R5                      ; 560B   02FD 0004
        SDBD                                    ; 560D   0001
        MVI@    R4,     R7                      ; 560E   02A7

        JSR     R5,     L_5621                  ; 560F   0004 0154 0221

        PULR    R1                              ; 5612   02B1
        PULR    R2                              ; 5613   02B2
        PULR    R3                              ; 5614   02B3
        PULR    R4                              ; 5615   02B4
L_5616:
        MVI@    R2,     R0                      ; 5616   0290
        MVO@    R0,     R3                      ; 5617   0258
        INCR    R2                              ; 5618   000A
        INCR    R3                              ; 5619   000B
        ADDI    #$0002, R4                      ; 561A   02FC 0002
        PULR    R5                              ; 561C   02B5
        DECR    R5                              ; 561D   0015
        BPL     L_55FC                          ; 561E   0223 0023
        PULR    R7                              ; 5620   02B7

L_5621:
        SDBD                                    ; 5621   0001
        MVII    #$2A30, R0                      ; 5622   02B8 0030 002A
        MVO     R0,     G_033E                  ; 5625   0240 033E
        MOVR    R5,     R7                      ; 5627   00AF

L_5628:
        MVII    #$0001, R1                      ; 5628   02B9 0001
        MVI     .PSG0.lft_hand,R0               ; 562A   0280 01FF
        CMP     G_016C, R0                      ; 562C   0340 016C
        MVO     R0,     G_016C                  ; 562E   0240 016C
        BNEQ    L_5639                          ; 5630   020C 0007

        MVI     G_016E, R1                      ; 5632   0281 016E
        DECR    R1                              ; 5634   0011
        BNEQ    L_5639                          ; 5635   020C 0002

        MVO     R0,     G_0161                  ; 5637   0240 0161
L_5639:
        MVO     R1,     G_016E                  ; 5639   0241 016E
        MVII    #$0001, R1                      ; 563B   02B9 0001
        MVI     .PSG0.rgt_hand,R0               ; 563D   0280 01FE
        CMP     G_016D, R0                      ; 563F   0340 016D
        MVO     R0,     G_016D                  ; 5641   0240 016D
        BNEQ    L_564C                          ; 5643   020C 0007

        MVI     G_016F, R1                      ; 5645   0281 016F
        DECR    R1                              ; 5647   0011
        BNEQ    L_564C                          ; 5648   020C 0002

        MVO     R0,     G_0165                  ; 564A   0240 0165
L_564C:
        MVO     R1,     G_016F                  ; 564C   0241 016F
        MOVR    R5,     R7                      ; 564E   00AF

L_564F:
        PSHR    R5                              ; 564F   0275
        MVI     G_033E, R5                      ; 5650   0285 033E
        MVI     .PSG0.rgt_hand,R0               ; 5652   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5654   0380 01FF
        CMPI    #$00FF, R0                      ; 5656   0378 00FF
        BEQ     L_565E                          ; 5658   0204 0004

L_565A:
        SDBD                                    ; 565A   0001
        MVII    #$2A30, R5                      ; 565B   02BD 0030 002A
L_565E:
        DECR    R5                              ; 565E   0015
        MVO     R5,     G_033E                  ; 565F   0245 033E
        BEQ     L_566F                          ; 5661   0204 000C

        MVI     .PSG0.rgt_hand,R0               ; 5663   0280 01FE
        CMPI    #$005A, R0                      ; 5665   0378 005A
        BEQ     L_566F                          ; 5667   0204 0006

        MVI     .PSG0.lft_hand,R0               ; 5669   0280 01FF
        CMPI    #$005A, R0                      ; 566B   0378 005A
        BNEQ    L_5694                          ; 566D   020C 0025

L_566F:
        MVI     .ISRVEC.0,R2                    ; 566F   0282 0100
        MVI     .ISRVEC.1,R3                    ; 5671   0283 0101
        MOVR    R7,     R1                      ; 5673   00B9
        ADDI    #$003B, R1                      ; 5674   02F9 003B
        MVO     R1,     .ISRVEC.0               ; 5676   0241 0100
        SWAP    R1,     1                       ; 5678   0041
        MVO     R1,     .ISRVEC.1               ; 5679   0241 0101
        MVI     .PSG0.chan_enable,R1            ; 567B   0281 01F8
        MVII    #$003F, R5                      ; 567D   02BD 003F
        MVO     R5,     .PSG0.chan_enable       ; 567F   0245 01F8
        MVI     G_033E, R0                      ; 5681   0280 033E
        TSTR    R0                              ; 5683   0080
        BEQ     L_5689                          ; 5684   0204 0003

        JSR     R5,     L_5695                  ; 5686   0004 0154 0295
L_5689:
        JSR     R5,     L_5695                  ; 5689   0004 0154 0295

        MVO     R1,     .PSG0.chan_enable       ; 568C   0241 01F8
        MVO     R2,     .ISRVEC.0               ; 568E   0242 0100
        MVO     R3,     .ISRVEC.1               ; 5690   0243 0101
        B       L_565A                          ; 5692   0220 0039
L_5694:
        PULR    R7                              ; 5694   02B7

L_5695:
        MVII    #$0100, R4                      ; 5695   02BC 0100
L_5697:
        MVI     .PSG0.rgt_hand,R0               ; 5697   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5699   0380 01FF
        CMPI    #$00FF, R0                      ; 569B   0378 00FF
        BEQ     L_5695                          ; 569D   0224 0009

        DECR    R4                              ; 569F   0014
        BNEQ    L_5697                          ; 56A0   022C 000A

L_56A2:
        MVII    #$0100, R4                      ; 56A2   02BC 0100
L_56A4:
        MVI     .PSG0.rgt_hand,R0               ; 56A4   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 56A6   0380 01FF
        CMPI    #$00FF, R0                      ; 56A8   0378 00FF
        BNEQ    L_56A2                          ; 56AA   022C 0009

        DECR    R4                              ; 56AC   0014
        BNEQ    L_56A4                          ; 56AD   022C 000A
        MOVR    R5,     R7                      ; 56AF   00AF

L_56B0:
        PSHR    R5                              ; 56B0   0275
        CLRR    R1                              ; 56B1   01C9
        MVII    #$0001, R2                      ; 56B2   02BA 0001
        MVI     G_0340, R0                      ; 56B4   0280 0340
L_56B6:
        INCR    R1                              ; 56B6   0009
        SLL     R2,     1                       ; 56B7   004A
        SARC    R0,     1                       ; 56B8   0078
        BC      L_56BE                          ; 56B9   0201 0003
        BNEQ    L_56B6                          ; 56BB   022C 0006
        PULR    R7                              ; 56BD   02B7

L_56BE:
        SLR     R2,     1                       ; 56BE   0062
        COMR    R2                              ; 56BF   001A
        AND     G_0340, R2                      ; 56C0   0382 0340
        MVO     R2,     G_0340                  ; 56C2   0242 0340
        DECR    R1                              ; 56C4   0011
        INCR    R1                              ; 56C5   0009
        ADDR    R7,     R1                      ; 56C6   00F9
        ADD@    R1,     R7                      ; 56C7   02CF

        CLRC                                    ; 56C8   0006
        DECR    R2                              ; 56C9   0012
        COMR    R2                              ; 56CA   001A
        ADCR    R5                              ; 56CB   002D
        RSWD    R1                              ; 56CC   0039
        RLC     R0,     1                       ; 56CD   0050
        SDBD                                    ; 56CE   0001
        MVII    #$38F0, R4                      ; 56CF   02BC 00F0 0038
        MVI     G_0176, R1                      ; 56D2   0281 0176
L_56D4:
        ANDI    #$003F, R1                      ; 56D4   03B9 003F

        JSR     R5,     L_5EE0                  ; 56D6   0004 015C 02E0

        PULR    R7                              ; 56D9   02B7

        SDBD                                    ; 56DA   0001
        MVII    #$3900, R4                      ; 56DB   02BC 0000 0039
        MVI     G_0177, R1                      ; 56DE   0281 0177
        B       L_56D4                          ; 56E0   0220 000D

        MVI     G_0174, R0                      ; 56E2   0280 0174
        ANDI    #$0003, R0                      ; 56E4   03B8 0003
        SLL     R0,     2                       ; 56E6   004C
        SLL     R0,     1                       ; 56E7   0048
        SDBD                                    ; 56E8   0001
        MVII    #$9068, R4                      ; 56E9   02BC 0068 0090
        ADDR    R0,     R4                      ; 56EC   00C4
        SDBD                                    ; 56ED   0001
        MVII    #$38E8, R1                      ; 56EE   02B9 00E8 0038
        CLRR    R0                              ; 56F1   01C0
L_56F2:
        J       L_574E                          ; 56F2   0004 0354 034E

        SDBD                                    ; 56F5   0001
        MVII    #$9392, R4                      ; 56F6   02BC 0092 0093
        SDBD                                    ; 56F9   0001
        MVII    #$3928, R1                      ; 56FA   02B9 0028 0039
        MVII    #$0002, R0                      ; 56FD   02B8 0002
        B       L_56F2                          ; 56FF   0220 000E

        SDBD                                    ; 5701   0001
        MVII    #$38F8, R4                      ; 5702   02BC 00F8 0038
        MVI     G_0176, R1                      ; 5705   0281 0176
L_5707:
        SLL     R1,     2                       ; 5707   004D
        SWAP    R1,     1                       ; 5708   0041
        ANDI    #$0003, R1                      ; 5709   03B9 0003
        PSHR    R1                              ; 570B   0271
        SLL     R1,     2                       ; 570C   004D
        ADD@    R6,     R1                      ; 570D   02F1
        SDBD                                    ; 570E   0001
        ADDI    #$9360, R1                      ; 570F   02F9 0060 0093
        MVII    #$0001, R0                      ; 5712   02B8 0001

        JSR     R5,     L_594F                  ; 5714   0004 0158 014F

        PULR    R7                              ; 5717   02B7

        SDBD                                    ; 5718   0001
        MVII    #$3908, R4                      ; 5719   02BC 0008 0039
        MVI     G_0177, R1                      ; 571C   0281 0177
        B       L_5707                          ; 571E   0220 0018

L_5720:
        SDBD                                    ; 5720   0001
        MVI@    R5,     R0                      ; 5721   02A8
L_5722:
        PSHR    R5                              ; 5722   0275
        MOVR    R0,     R5                      ; 5723   0085
        COMR    R5                              ; 5724   001D
        AND     G_0340, R5                      ; 5725   0385 0340
        XORR    R0,     R5                      ; 5727   01C5
        MVO     R5,     G_0340                  ; 5728   0245 0340
        PULR    R7                              ; 572A   02B7

        PSHR    R5                              ; 572B   0275
        MVI     .ISRVEC.0,R1                    ; 572C   0281 0100
        SWAP    R1,     1                       ; 572E   0041
        XOR     .ISRVEC.1,R1                    ; 572F   03C1 0101
        MOVR    R7,     R0                      ; 5731   00B8
        ADDI    #$0008, R0                      ; 5732   02F8 0008
        MVO     R0,     .ISRVEC.0               ; 5734   0240 0100
        SWAP    R0,     1                       ; 5736   0040
        MVO     R0,     .ISRVEC.1               ; 5737   0240 0101
L_5739:
        DECR    R7                              ; 5739   0017

        SUBI    #$0008, R6                      ; 573A   033E 0008
        MVO     R1,     .ISRVEC.1               ; 573C   0241 0101
        SWAP    R1,     1                       ; 573E   0041
        MVO     R1,     .ISRVEC.0               ; 573F   0241 0100
        PULR    R7                              ; 5741   02B7

L_5742:
        MVI@    R5,     R0                      ; 5742   02A8
L_5743:
        INCR    R0                              ; 5743   0008
        MVO     R0,     G_015D                  ; 5744   0240 015D
L_5746:
        EIS                                     ; 5746   0002
        MVI     G_015D, R0                      ; 5747   0280 015D
        TSTR    R0                              ; 5749   0080
        BNEQ    L_5746                          ; 574A   022C 0005
        MOVR    R5,     R7                      ; 574C   00AF

L_574D:
        PSHR    R5                              ; 574D   0275
L_574E:
        MOVR    R1,     R5                      ; 574E   008D
L_574F:
        MVI@    R4,     R1                      ; 574F   02A1
        MVO@    R1,     R5                      ; 5750   0269
        MVI@    R4,     R1                      ; 5751   02A1
        MVO@    R1,     R5                      ; 5752   0269
        MVI@    R4,     R1                      ; 5753   02A1
        MVO@    R1,     R5                      ; 5754   0269
        MVI@    R4,     R1                      ; 5755   02A1
        MVO@    R1,     R5                      ; 5756   0269
        MVI@    R4,     R1                      ; 5757   02A1
        MVO@    R1,     R5                      ; 5758   0269
        MVI@    R4,     R1                      ; 5759   02A1
        MVO@    R1,     R5                      ; 575A   0269
        MVI@    R4,     R1                      ; 575B   02A1
        MVO@    R1,     R5                      ; 575C   0269
        MVI@    R4,     R1                      ; 575D   02A1
        MVO@    R1,     R5                      ; 575E   0269
        DECR    R0                              ; 575F   0010
        BPL     L_574F                          ; 5760   0223 0012

        MOVR    R5,     R1                      ; 5762   00A9
        PULR    R7                              ; 5763   02B7

        MVII    #$0001, R0                      ; 5764   02B8 0001
L_5766:
        PSHR    R5                              ; 5766   0275
        MOVR    R0,     R5                      ; 5767   0085
L_5768:
        SDBD                                    ; 5768   0001
        MVI@    R4,     R0                      ; 5769   02A0
        MVO@    R0,     R3                      ; 576A   0258
        ADDI    #$0008, R3                      ; 576B   02FB 0008
        SDBD                                    ; 576D   0001
        MVI@    R4,     R0                      ; 576E   02A0
        MVO@    R0,     R3                      ; 576F   0258
        ADDI    #$0008, R3                      ; 5770   02FB 0008
        SDBD                                    ; 5772   0001
        MVI@    R4,     R0                      ; 5773   02A0
        MVO@    R0,     R3                      ; 5774   0258
        SUBI    #$000F, R3                      ; 5775   033B 000F
        DECR    R5                              ; 5777   0015
        BNEQ    L_5768                          ; 5778   022C 0011
        PULR    R7                              ; 577A   02B7

        PSHR    R5                              ; 577B   0275
        MOVR    R1,     R0                      ; 577C   0088
        SWAP    R0,     1                       ; 577D   0040
        SLR     R0,     2                       ; 577E   0064
        SLR     R0,     2                       ; 577F   0064
        ANDI    #$000F, R0                      ; 5780   03B8 000F

        JSR     R5,     L_579B                  ; 5782   0004 0154 039B

        MOVR    R1,     R0                      ; 5785   0088
        SWAP    R0,     1                       ; 5786   0040
        ANDI    #$000F, R0                      ; 5787   03B8 000F

        JSR     R5,     L_579B                  ; 5789   0004 0154 039B

        MOVR    R1,     R0                      ; 578C   0088
        SLR     R0,     2                       ; 578D   0064
        SLR     R0,     2                       ; 578E   0064
        ANDI    #$000F, R0                      ; 578F   03B8 000F

        JSR     R5,     L_579B                  ; 5791   0004 0154 039B

        MOVR    R1,     R0                      ; 5794   0088
        ANDI    #$000F, R0                      ; 5795   03B8 000F

        JSR     R5,     L_579B                  ; 5797   0004 0154 039B

        PULR    R7                              ; 579A   02B7

L_579B:
        PSHR    R5                              ; 579B   0275
        CMPI    #$000A, R0                      ; 579C   0378 000A
        BC      L_57A4                          ; 579E   0201 0004

        ADDI    #$0010, R0                      ; 57A0   02F8 0010
        B       L_57A6                          ; 57A2   0200 0002

L_57A4:
        ADDI    #$0017, R0                      ; 57A4   02F8 0017
L_57A6:
        SLL     R0,     2                       ; 57A6   004C
        SLL     R0,     1                       ; 57A7   0048
        XORR    R3,     R0                      ; 57A8   01D8
        MVO@    R0,     R4                      ; 57A9   0260
        PULR    R7                              ; 57AA   02B7

L_57AB:
        PSHR    R5                              ; 57AB   0275
        PSHR    R3                              ; 57AC   0273
        MVO     R0,     G_018C                  ; 57AD   0240 018C
        MVO     R1,     G_018D                  ; 57AF   0241 018D
        SWAP    R0,     1                       ; 57B1   0040
        SWAP    R1,     1                       ; 57B2   0041
        MVI     G_0342, R2                      ; 57B3   0282 0342
        MVI     G_0344, R3                      ; 57B5   0283 0344
        MVII    #$0343, R4                      ; 57B7   02BC 0343
        B       L_57F2                          ; 57B9   0200 0037

L_57BB:
        PSHR    R5                              ; 57BB   0275
        PSHR    R4                              ; 57BC   0274
        PSHR    R0                              ; 57BD   0270
        PSHR    R1                              ; 57BE   0271
        CLRR    R5                              ; 57BF   01ED
        CMPI    #$0008, R0                      ; 57C0   0378 0008
        BLT     L_57D6                          ; 57C2   0205 0012

        CMPI    #$00A8, R0                      ; 57C4   0378 00A8
        BGE     L_57D6                          ; 57C6   020D 000E

        CMPI    #$0008, R1                      ; 57C8   0379 0008
        BLT     L_57D6                          ; 57CA   0205 000A

        CMPI    #$0068, R1                      ; 57CC   0379 0068
        BGE     L_57D6                          ; 57CE   020D 0006

        JSR     R5,     L_5971                  ; 57D0   0004 0158 0171

        MOVR    R0,     R5                      ; 57D3   0085
        SUBI    #$0028, R5                      ; 57D4   033D 0028
L_57D6:
        PULR    R1                              ; 57D6   02B1
        PULR    R0                              ; 57D7   02B0
        PSHR    R5                              ; 57D8   0275
        SWAP    R0,     1                       ; 57D9   0040
        SWAP    R1,     1                       ; 57DA   0041
        PSHR    R3                              ; 57DB   0273
        MVI@    R4,     R2                      ; 57DC   02A2
        ANDI    #$0007, R2                      ; 57DD   03BA 0007
        DECR    R2                              ; 57DF   0012
        BPL     L_57E3                          ; 57E0   0203 0001

        CLRR    R2                              ; 57E2   01D2
L_57E3:
        SLL     R2,     1                       ; 57E3   004A
        PSHR    R2                              ; 57E4   0272
        SLL     R2,     2                       ; 57E5   004E
        ADD@    R6,     R2                      ; 57E6   02F2
        MOVR    R2,     R5                      ; 57E7   0095
        ADDI    #$0107, R5                      ; 57E8   02FD 0107
        MVI@    R4,     R2                      ; 57EA   02A2
        SWAP    R2,     1                       ; 57EB   0042
        XOR@    R5,     R2                      ; 57EC   03EA
        MVI@    R4,     R3                      ; 57ED   02A3
        SWAP    R3,     1                       ; 57EE   0043
        XOR@    R5,     R3                      ; 57EF   03EB
        MVO     R5,     G_0351                  ; 57F0   0245 0351
L_57F2:
        SLR     R0,     1                       ; 57F2   0060
        SLR     R1,     1                       ; 57F3   0061
        NOP                                     ; 57F4   0034
        SLR     R2,     1                       ; 57F5   0062
        SLR     R3,     1                       ; 57F6   0063

        JSR     R5,     L_58A6                  ; 57F7   0004 0158 00A6

        CMPI    #$0343, R4                      ; 57FA   037C 0343
        BLT     L_5804                          ; 57FC   0205 0006

        CMPI    #$0200, R0                      ; 57FE   0378 0200
        BC      L_5804                          ; 5800   0201 0002

        MVII    #$0062, R0                      ; 5802   02B8 0062
L_5804:
        PULR    R1                              ; 5804   02B1
        PSHR    R2                              ; 5805   0272
        MOVR    R1,     R2                      ; 5806   008A
        MOVR    R0,     R1                      ; 5807   0081

        JSR     R5,     X_DIVR                  ; 5808   0004 011C 01F8

        MOVR    R0,     R2                      ; 580B   0082
        PULR    R1                              ; 580C   02B1
        PSHR    R2                              ; 580D   0272

        JSR     R5,     X_DIVR                  ; 580E   0004 011C 01F8

        PULR    R2                              ; 5811   02B2
        PSHR    R0                              ; 5812   0270
        MOVR    R3,     R1                      ; 5813   0099
        MOVR    R2,     R3                      ; 5814   0093

        JSR     R5,     X_DIVR                  ; 5815   0004 011C 01F8

        PSHR    R0                              ; 5818   0270
        CMPI    #$0342, R4                      ; 5819   037C 0342
        BLT     L_585D                          ; 581B   0205 0040

        MOVR    R3,     R0                      ; 581D   0098
        MVII    #$0008, R1                      ; 581E   02B9 0008

        JSR     R5,     X_MPY                   ; 5820   0004 011C 01DC

        PULR    R1                              ; 5823   02B1
        PULR    R0                              ; 5824   02B0
        MVO     R0,     G_0343                  ; 5825   0240 0343
        MVO     R1,     G_0345                  ; 5827   0241 0345
        SLR     R2,     1                       ; 5829   0062
        MVI     G_018C, R0                      ; 582A   0280 018C
        MVI     G_0342, R1                      ; 582C   0281 0342
        SWAP    R1,     1                       ; 582E   0041
        ANDI    #$00FF, R1                      ; 582F   03B9 00FF
        SUBR    R1,     R0                      ; 5831   0108
        BPL     L_5835                          ; 5832   0203 0001

        NEGR    R0                              ; 5834   0020
L_5835:
        MVI     G_018D, R5                      ; 5835   0285 018D
        MVI     G_0344, R1                      ; 5837   0281 0344
        SWAP    R1,     1                       ; 5839   0041
        ANDI    #$00FF, R1                      ; 583A   03B9 00FF
        SUBR    R1,     R5                      ; 583C   010D
        BPL     L_5840                          ; 583D   0203 0001

        NEGR    R5                              ; 583F   0025
L_5840:
        CLRR    R3                              ; 5840   01DB
        CMPR    R5,     R0                      ; 5841   0168
        BGT     L_5846                          ; 5842   020E 0002

        INCR    R3                              ; 5844   000B
        MOVR    R5,     R0                      ; 5845   00A8
L_5846:
        MVO     R2,     G_0347                  ; 5846   0242 0347
        MVO     R3,     G_0349                  ; 5848   0243 0349
        MVO     R0,     G_034B                  ; 584A   0240 034B
        SLL     R3,     1                       ; 584C   004B
        ADDI    #$0342, R3                      ; 584D   02FB 0342
        MVI@    R3,     R0                      ; 584F   0298
        MVO     R0,     G_034A                  ; 5850   0240 034A
        MVI     G_0346, R0                      ; 5852   0280 0346
        MVO     R0,     G_0348                  ; 5854   0240 0348
        SLL     R0,     1                       ; 5856   0048
        SWAP    R0,     1                       ; 5857   0040
        ANDI    #$00FF, R0                      ; 5858   03B8 00FF
        MVO     R0,     G_034C                  ; 585A   0240 034C
        PULR    R7                              ; 585C   02B7

L_585D:
        PULR    R1                              ; 585D   02B1
        PULR    R0                              ; 585E   02B0
        MVI     G_0351, R5                      ; 585F   0285 0351
        MVO@    R0,     R5                      ; 5861   0268
        SWAP    R0,     1                       ; 5862   0040
        MVO@    R0,     R5                      ; 5863   0268
        NOP                                     ; 5864   0034
        MVO@    R1,     R5                      ; 5865   0269
        SWAP    R1,     1                       ; 5866   0041
        MVO@    R1,     R5                      ; 5867   0269
        SLL     R3,     1                       ; 5868   004B
        BNEQ    L_586C                          ; 5869   020C 0001

        INCR    R3                              ; 586B   000B
L_586C:
        CMPI    #$00FF, R3                      ; 586C   037B 00FF
        BLE     L_5872                          ; 586E   0206 0002

        MVII    #$00FF, R3                      ; 5870   02BB 00FF
L_5872:
        MVO@    R3,     R4                      ; 5872   0263
        PULR    R5                              ; 5873   02B5
        MVO@    R5,     R4                      ; 5874   0265
        SWAP    R0,     1                       ; 5875   0040
        SWAP    R1,     1                       ; 5876   0041

        JSR     R5,     .EXEC.A2F               ; 5877   0004 0118 022F

        PULR    R4                              ; 587A   02B4
        MOVR    R4,     R2                      ; 587B   00A2
        MVI@    R2,     R5                      ; 587C   0295
        ANDI    #$00F7, R5                      ; 587D   03BD 00F7
        CLRR    R0                              ; 587F   01C0
        ANDI    #$000F, R1                      ; 5880   03B9 000F
        INCR    R1                              ; 5882   0009
        ADDR    R7,     R1                      ; 5883   00F9
        ADD@    R1,     R7                      ; 5884   02CF
L_5885:
        DECR    R7                              ; 5885   0017
L_5886:
        DECR    R7                              ; 5886   0017

        DECR    R2                              ; 5887   0012
        DECR    R2                              ; 5888   0012
        DECR    R2                              ; 5889   0012
        DECR    R0                              ; 588A   0010
        DECR    R0                              ; 588B   0010
        DECR    R5                              ; 588C   0015
        DECR    R5                              ; 588D   0015
        DECR    R5                              ; 588E   0015
        DECR    R0                              ; 588F   0010
        DECR    R0                              ; 5890   0010
        DECR    R2                              ; 5891   0012
        DECR    R2                              ; 5892   0012
        DECR    R2                              ; 5893   0012
L_5894:
        DECR    R7                              ; 5894   0017

        XORI    #$0008, R5                      ; 5895   03FD 0008
        INCR    R0                              ; 5897   0008
        B       L_589C                          ; 5898   0200 0002

        XORI    #$0008, R5                      ; 589A   03FD 0008
L_589C:
        MVO@    R5,     R2                      ; 589C   0255
        ADDI    #$0007, R2                      ; 589D   02FA 0007
        ADD@    R2,     R0                      ; 589F   02D0
        MVO@    R0,     R2                      ; 58A0   0250
        PULR    R7                              ; 58A1   02B7

        SDBD                                    ; 58A2   0001
        MVI@    R4,     R2                      ; 58A3   02A2
        SDBD                                    ; 58A4   0001
        MVI@    R4,     R3                      ; 58A5   02A3
L_58A6:
        PSHR    R5                              ; 58A6   0275
        SUBR    R2,     R0                      ; 58A7   0110
        MOVR    R0,     R2                      ; 58A8   0082
        BPL     L_58AC                          ; 58A9   0203 0001

        NEGR    R0                              ; 58AB   0020
L_58AC:
        SUBR    R3,     R1                      ; 58AC   0119
        MOVR    R1,     R3                      ; 58AD   008B
        BPL     L_58B1                          ; 58AE   0203 0001

        NEGR    R1                              ; 58B0   0021
L_58B1:
        CMPR    R0,     R1                      ; 58B1   0141
        BMI     L_58B6                          ; 58B2   020B 0002

        SLR     R0,     2                       ; 58B4   0064
        INCR    R7                              ; 58B5   000F

L_58B6:
        SLR     R1,     2                       ; 58B6   0065
L_58B7:
        ADDR    R1,     R0                      ; 58B7   00C8
        PULR    R7                              ; 58B8   02B7

        DECLE   $00C1,  $0058,  $00ED,  $0058   ; 58B9   00C1 0058 00ED 0058
        DECLE   $000C,  $0059,  $002D,  $0059   ; 58BD   000C 0059 002D 0059
        DECLE   $001D,  $0155,  $0082,  $0177   ; 58C1   001D 0155 0082 0177
        DECLE   $03B2,  $0039,  $01DA,  $0000   ; 58C5   03B2 0039 01DA 0000
        DECLE   $0041,  $00FA,  $0041,  $0205   ; 58C9   0041 00FA 0041 0205
        DECLE   $0201                           ; 58CD   0201

        CLRR    R0                              ; 58CE   01C0
        SUB@    R1,     R1                      ; 58CF   0309
L_58D0:
        SWAP    R0,     1                       ; 58D0   0040
        SUBR    R1,     R3                      ; 58D1   010B
        SWAP    R0,     1                       ; 58D2   0040
        INCR    R3                              ; 58D3   000B
        SLL     R0,     1                       ; 58D4   0048
        DECR    R5                              ; 58D5   0015
        MVI@    R2,     R2                      ; 58D6   0292
        RSWD    R1                              ; 58D7   0039
        AND@    R5,     R2                      ; 58D8   03AA
        SUBR    R0,     R1                      ; 58D9   0101
        BEQ     L_58D0                          ; 58DA   0224 000B

        CMPR    R5,     R2                      ; 58DC   016A
        NEGR    R1                              ; 58DD   0021
        RRC     R2,     1                       ; 58DE   0072
        ADCR    R1                              ; 58DF   0029
        NEGR    R2                              ; 58E0   0022
        CMPR    R0,     R1                      ; 58E1   0141
        MOVR    R0,     R2                      ; 58E2   0082
        SLR     R1,     1                       ; 58E3   0061
        SLL     R2,     1                       ; 58E4   004A
        INCR    R7                              ; 58E5   000F

        CLRR    R2                              ; 58E6   01D2
L_58E7:
        RSWD    R1                              ; 58E7   0039
        COMR    R2                              ; 58E8   001A
        RLC     R1,     1                       ; 58E9   0051
        COMR    R2                              ; 58EA   001A
        DIS                                     ; 58EB   0003
        B       L_590A                          ; 58EC   0200 001C

        DECLE   $0155,  $0082,  $0177,  $03B2   ; 58EE   0155 0082 0177 03B2
        DECLE   $0039,  $01DA,  $000D,  $0080   ; 58F2   0039 01DA 000D 0080
        DECLE   $0041,  $0205,  $0201,  $0240   ; 58F6   0041 0205 0201 0240
        DECLE   $010B,  $0040,  $0111,  $0224   ; 58FA   010B 0040 0111 0224
        DECLE   $0101,  $0224,  $0011,  $0100   ; 58FE   0101 0224 0011 0100
        DECLE   $0001,  $0010,  $0001,  $0010   ; 5902   0001 0010 0001 0010
        DECLE   $001F                           ; 5906   001F

        RRC     R0,     1                       ; 5907   0070
        COMR    R1                              ; 5908   0019
        RRC     R0,     1                       ; 5909   0070
L_590A:
        NEGR    R1                              ; 590A   0021
        DECLE   $0320,  $0024,  $0022,  $0281   ; 590B   0320 0024 0022 0281
        DECLE   $002A,  $0201,  $00C0,  $0003   ; 590F   002A 0201 00C0 0003
        DECLE   $0048,  $020F,  $02B6,  $000B   ; 5913   0048 020F 02B6 000B
        DECLE   $0048,  $000D,  $0048,  $000F   ; 5917   0048 000D 0048 000F
        DECLE   $0048,  $02FF                   ; 591B   0048 02FF

        SUB@    R5,     R1                      ; 591D   0329
        DECR    R3                              ; 591E   0013
        SLL     R0,     1                       ; 591F   0048
        DECR    R5                              ; 5920   0015
        SLL     R0,     1                       ; 5921   0048
L_5922:
        DECR    R7                              ; 5922   0017

        SLL     R0,     1                       ; 5923   0048
        NEGR    R5                              ; 5924   0025
        AND     G_0035, R0                      ; 5925   0380 0035
        AND     G_0045, R0                      ; 5927   0380 0045
        B       L_5B4C                          ; 5929   0200 0221

        SWAP    R0,     2                       ; 592B   0044
        SLL     R2,     2                       ; 592C   004E
        ADCR    R0                              ; 592D   0028
        RLC     R1,     1                       ; 592E   0051
        AND     G_0061, R0                      ; 592F   0380 0061
        AND     G_0071, R0                      ; 5931   0380 0071
        AND     .STIC.X.1,R0                    ; 5933   0380 0001
        AND@    R4,     R0                      ; 5935   03A0
        DECR    R1                              ; 5936   0011
        AND@    R4,     R0                      ; 5937   03A0
        MVII    #$02F8, R1                      ; 5938   02B9 02F8
        INCR    R7                              ; 593A   000F

L_593B:
        CLRR    R1                              ; 593B   01C9
L_593C:
        MVII    #$00F0, R0                      ; 593C   02B8 00F0
        MVII    #$0200, R4                      ; 593E   02BC 0200
        PSHR    R5                              ; 5940   0275
        J       .EXEC.742                       ; 5941   0004 0314 0342

L_5944:
        SDBD                                    ; 5944   0001
        MVI@    R5,     R4                      ; 5945   02AC
L_5946:
        PSHR    R5                              ; 5946   0275
        MVI@    R4,     R5                      ; 5947   02A5
L_5948:
        DECR    R5                              ; 5948   0015
        BMI     L_594E                          ; 5949   020B 0003

        CMP@    R4,     R0                      ; 594B   0360
        BNEQ    L_5948                          ; 594C   022C 0005
L_594E:
        PULR    R7                              ; 594E   02B7

L_594F:
        PSHR    R5                              ; 594F   0275
        CLRR    R3                              ; 5950   01DB
        MOVR    R1,     R5                      ; 5951   008D
L_5952:
        MVO@    R3,     R4                      ; 5952   0263
        MVI@    R5,     R1                      ; 5953   02A9
        MVO@    R1,     R4                      ; 5954   0261
        MVI@    R5,     R1                      ; 5955   02A9
        MVO@    R1,     R4                      ; 5956   0261
        MVI@    R5,     R1                      ; 5957   02A9
        MVO@    R1,     R4                      ; 5958   0261
        MVI@    R5,     R1                      ; 5959   02A9
        MVO@    R1,     R4                      ; 595A   0261
        MVI@    R5,     R1                      ; 595B   02A9
        MVO@    R1,     R4                      ; 595C   0261
        MVO@    R3,     R4                      ; 595D   0263
        MVO@    R3,     R4                      ; 595E   0263
        DECR    R0                              ; 595F   0010
        BNEQ    L_5952                          ; 5960   022C 000F

        MOVR    R5,     R1                      ; 5962   00A9
        PULR    R7                              ; 5963   02B7

L_5964:
        CLRR    R1                              ; 5964   01C9
L_5965:
        INCR    R1                              ; 5965   0009
        SUBI    #$0014, R0                      ; 5966   0338 0014
        BPL     L_5965                          ; 5968   0223 0004

        ADDI    #$0015, R0                      ; 596A   02F8 0015
        SLL     R0,     2                       ; 596C   004C
        SLL     R0,     1                       ; 596D   0048
        SLL     R1,     2                       ; 596E   004D
        SLL     R1,     1                       ; 596F   0049
        MOVR    R5,     R7                      ; 5970   00AF

L_5971:
        SLR     R0,     2                       ; 5971   0064
        SLR     R0,     1                       ; 5972   0060
        SLR     R1,     2                       ; 5973   0065
        SLR     R1,     1                       ; 5974   0061
        DECR    R0                              ; 5975   0010
        DECR    R1                              ; 5976   0011
        SLL     R1,     2                       ; 5977   004D
        PSHR    R1                              ; 5978   0271
        SLL     R1,     2                       ; 5979   004D
        ADD@    R6,     R1                      ; 597A   02F1
        ADDR    R1,     R0                      ; 597B   00C8
        MOVR    R5,     R7                      ; 597C   00AF

L_597D:
        MVI@    R5,     R0                      ; 597D   02A8
        PSHR    R5                              ; 597E   0275
        PSHR    R0                              ; 597F   0270

        JSR     R5,     L_5994                  ; 5980   0004 0158 0194

        NEGR    R1                              ; 5983   0021
        ADD@    R6,     R1                      ; 5984   02F1
        BPL     L_598C                          ; 5985   0203 0005

        NEGR    R1                              ; 5987   0021
        ADDR    R7,     R1                      ; 5988   00F9
        ADDI    #$0005, R1                      ; 5989   02F9 0005
        MVI@    R1,     R1                      ; 598B   0289
L_598C:
        MOVR    R1,     R0                      ; 598C   0088
        PULR    R7                              ; 598D   02B7

        DECLE   $0000,  $0005,  $0004,  $0003   ; 598E   0000 0005 0004 0003
        DECLE   $0002,  $0001                   ; 5992   0002 0001
L_5994:
        MOVR    R7,     R1                      ; 5994   00B9
        ADDI    #$0016, R1                      ; 5995   02F9 0016
        MVI     G_0175, R0                      ; 5997   0280 0175
        ANDI    #$0001, R0                      ; 5999   03B8 0001
        PSHR    R0                              ; 599B   0270
        CLRR    R0                              ; 599C   01C0
        CMPI    #$01BE, R4                      ; 599D   037C 01BE
        BLT     L_59A2                          ; 599F   0205 0001

        INCR    R0                              ; 59A1   0008
L_59A2:
        XOR@    R6,     R0                      ; 59A2   03F0
        BEQ     L_59A6                          ; 59A3   0204 0001

        DECR    R1                              ; 59A5   0011
L_59A6:
        ADD     G_017D, R1                      ; 59A6   02C1 017D
        MVI@    R1,     R1                      ; 59A8   0289
        MOVR    R5,     R7                      ; 59A9   00AF

        DECLE   $0000,  $0000,  $0000,  $0001   ; 59AA   0000 0000 0000 0001
        DECLE   $0001,  $0002,  $0002,  $0003   ; 59AE   0001 0002 0002 0003
        DECLE   $0003,  $0004,  $0004,  $0005   ; 59B2   0003 0004 0004 0005
        DECLE   $0005,  $0000                   ; 59B6   0005 0000
L_59B8:
        PSHR    R5                              ; 59B8   0275
        PSHR    R4                              ; 59B9   0274
        ADDI    #$0004, R4                      ; 59BA   02FC 0004
        MVI@    R4,     R3                      ; 59BC   02A3
        TSTR    R3                              ; 59BD   009B
        BEQ     L_59DF                          ; 59BE   0204 001F

        SDBD                                    ; 59C0   0001
        MVII    #$9E01, R5                      ; 59C1   02BD 0001 009E
        MVI     G_0352, R4                      ; 59C4   0284 0352
        ANDI    #$0080, R4                      ; 59C6   03BC 0080
        BEQ     L_59CE                          ; 59C8   0204 0004

        SDBD                                    ; 59CA   0001
        MVII    #$A07D, R5                      ; 59CB   02BD 007D 00A0
L_59CE:
        MOVR    R3,     R4                      ; 59CE   009C
        ADDI    #$0200, R4                      ; 59CF   02FC 0200
        SUBI    #$003C, R3                      ; 59D1   033B 003C
        SLL     R3,     1                       ; 59D3   004B
        ADDR    R3,     R5                      ; 59D4   00DD
        SDBD                                    ; 59D5   0001
        MVI@    R5,     R3                      ; 59D6   02AB
        MVO@    R3,     R4                      ; 59D7   0263
        ADDI    #$0013, R4                      ; 59D8   02FC 0013
        ADDI    #$0026, R5                      ; 59DA   02FD 0026
        SDBD                                    ; 59DC   0001
        MVI@    R5,     R3                      ; 59DD   02AB
        MVO@    R3,     R4                      ; 59DE   0263
L_59DF:
        PULR    R4                              ; 59DF   02B4
        PULR    R7                              ; 59E0   02B7

L_59E1:
        PSHR    R5                              ; 59E1   0275
        PSHR    R4                              ; 59E2   0274
        MVI     G_0352, R3                      ; 59E3   0283 0352
        ANDI    #$0080, R3                      ; 59E5   03BB 0080
        BNEQ    L_5A22                          ; 59E7   020C 0039

        MOVR    R4,     R1                      ; 59E9   00A1
        ADDI    #$0004, R1                      ; 59EA   02F9 0004
        MVI@    R1,     R0                      ; 59EC   0288
        TSTR    R0                              ; 59ED   0080
        BEQ     L_5A22                          ; 59EE   0204 0032

        PSHR    R0                              ; 59F0   0270

        JSR     R5,     L_5964                  ; 59F1   0004 0158 0164
        DECLE   $02F8,  $0004,  $02F9,  $0010   ; 59F4   02F8 0004 02F9 0010
        DECLE   $00A5,  $000D,  $0268,  $0269   ; 59F8   00A5 000D 0268 0269
        DECLE   $02B1,  $00A3,  $033B,  $018E   ; 59FC   02B1 00A3 033B 018E
        DECLE   $004B,  $0001                   ; 5A00   004B 0001

        ADDI    #$0040, R3                      ; 5A02   02FB 0040
        TSTR    R1                              ; 5A04   0089
        MVII    #$0002, R5                      ; 5A05   02BD 0002
        CMPI    #$01BE, R4                      ; 5A07   037C 01BE
        BLT     L_5A0D                          ; 5A09   0205 0002

        MVII    #$0001, R5                      ; 5A0B   02BD 0001
L_5A0D:
        XORR    R5,     R3                      ; 5A0D   01EB
        CMPI    #$003C, R1                      ; 5A0E   0379 003C
        BNEQ    L_5A16                          ; 5A10   020C 0004

        SDBD                                    ; 5A12   0001
        XORI    #$2000, R3                      ; 5A13   03FB 0000 0020
L_5A16:
        ADDI    #$0200, R1                      ; 5A16   02F9 0200
        MVO@    R3,     R1                      ; 5A18   024B
        ADDI    #$0014, R1                      ; 5A19   02F9 0014
        SDBD                                    ; 5A1B   0001
        ANDI    #$DFFF, R3                      ; 5A1C   03BB 00FF 00DF
        ADDI    #$0008, R3                      ; 5A1F   02FB 0008
        MVO@    R3,     R1                      ; 5A21   024B
L_5A22:
        PULR    R4                              ; 5A22   02B4
        MVII    #$0015, R0                      ; 5A23   02B8 0015

        JSR     R5,     L_67E2                  ; 5A25   0004 0164 03E2
        JSR     R5,     L_67F8                  ; 5A28   0004 0164 03F8

        PULR    R7                              ; 5A2B   02B7

L_5A2C:
        PSHR    R5                              ; 5A2C   0275
        PSHR    R0                              ; 5A2D   0270
        PSHR    R1                              ; 5A2E   0271
        MVI     G_017C, R1                      ; 5A2F   0281 017C
        SARC    R1,     1                       ; 5A31   0079
        MVII    #$0001, R0                      ; 5A32   02B8 0001
L_5A34:
        SARC    R1,     1                       ; 5A34   0079
        BNC     L_5A3F                          ; 5A35   0209 0008

        INCR    R0                              ; 5A37   0008
        CMPI    #$0006, R0                      ; 5A38   0378 0006
        BLE     L_5A34                          ; 5A3A   0226 0007

        CLRR    R0                              ; 5A3C   01C0
        B       L_5A43                          ; 5A3D   0200 0004

L_5A3F:
        JSR     R5,     X_CLR_BIT               ; 5A3F   0004 0114 02E6

        CMPR    R7,     R4                      ; 5A42   017C
L_5A43:
        MOVR    R0,     R5                      ; 5A43   0085
        PULR    R1                              ; 5A44   02B1
        PULR    R0                              ; 5A45   02B0
        PULR    R7                              ; 5A46   02B7

L_5A47:
        PSHR    R5                              ; 5A47   0275
        MVI     G_0352, R0                      ; 5A48   0280 0352
        ANDI    #$0080, R0                      ; 5A4A   03B8 0080
        BNEQ    L_5A7A                          ; 5A4C   020C 002C

        PSHR    R4                              ; 5A4E   0274
        MVI@    R4,     R0                      ; 5A4F   02A0
        MOVR    R0,     R1                      ; 5A50   0081
        ANDI    #$0007, R0                      ; 5A51   03B8 0007
        XORR    R0,     R1                      ; 5A53   01C1
        DECR    R4                              ; 5A54   0014
        MVO@    R1,     R4                      ; 5A55   0261
        CMPI    #$0006, R0                      ; 5A56   0378 0006
        BGT     L_594E                          ; 5A58   022E 010B

        TSTR    R0                              ; 5A5A   0080
        BEQ     L_594E                          ; 5A5B   0224 010E

        JSR     R5,     X_SET_BIT               ; 5A5D   0004 0114 02DB

        CMPR    R7,     R4                      ; 5A60   017C
        MOVR    R0,     R1                      ; 5A61   0081
        DECR    R0                              ; 5A62   0010
        SLL     R0,     1                       ; 5A63   0048
        PSHR    R0                              ; 5A64   0270
        SLL     R0,     2                       ; 5A65   004C
        ADD@    R6,     R0                      ; 5A66   02F0
        MOVR    R0,     R4                      ; 5A67   0084
        ADDI    #$0107, R4                      ; 5A68   02FC 0107
        MVII    #$000A, R0                      ; 5A6A   02B8 000A

        JSR     R5,     X_FILL_ZERO             ; 5A6C   0004 0114 0338

        CLRR    R5                              ; 5A6F   01ED
        ADDI    #$0319, R1                      ; 5A70   02F9 0319
        MVO@    R5,     R1                      ; 5A72   024D
        ADDI    #$0008, R1                      ; 5A73   02F9 0008
        MVO@    R5,     R1                      ; 5A75   024D
        ADDI    #$0008, R1                      ; 5A76   02F9 0008
        MVO@    R5,     R1                      ; 5A78   024D
        PULR    R4                              ; 5A79   02B4

L_5A7A:
        JSR     R5,     L_67F8                  ; 5A7A   0004 0164 03F8

        PULR    R7                              ; 5A7D   02B7

L_5A7E:
        PSHR    R5                              ; 5A7E   0275

L_5A7F:
        JSR     R5,     L_5994                  ; 5A7F   0004 0158 0194

        MOVR    R4,     R0                      ; 5A82   00A0
        SUBI    #$018E, R0                      ; 5A83   0338 018E
        SLR     R0,     2                       ; 5A85   0064
        SLR     R0,     1                       ; 5A86   0060
        CMPI    #$0006, R0                      ; 5A87   0378 0006
        BLT     L_5A8D                          ; 5A89   0205 0002

        SUBI    #$0006, R0                      ; 5A8B   0338 0006
L_5A8D:
        MVI     G_0352, R5                      ; 5A8D   0285 0352
        ANDI    #$0080, R5                      ; 5A8F   03BD 0080
        BNEQ    L_5A9A                          ; 5A91   020C 0007

        ADDR    R1,     R0                      ; 5A93   00C8
        CMPI    #$0006, R0                      ; 5A94   0378 0006
        BLT     L_5A9A                          ; 5A96   0205 0002

        SUBI    #$0006, R0                      ; 5A98   0338 0006
L_5A9A:
        SLL     R0,     1                       ; 5A9A   0048
        MVII    #$0143, R1                      ; 5A9B   02B9 0143
        CMPI    #$01BE, R4                      ; 5A9D   037C 01BE
        BLT     L_5AA2                          ; 5A9F   0205 0001

        INCR    R1                              ; 5AA1   0009
L_5AA2:
        MVI@    R1,     R1                      ; 5AA2   0289
        ADDR    R0,     R1                      ; 5AA3   00C1
        SDBD                                    ; 5AA4   0001
        ADDI    #$9F69, R1                      ; 5AA5   02F9 0069 009F
        MVI@    R1,     R0                      ; 5AA8   0288
        INCR    R1                              ; 5AA9   0009
        MVI@    R1,     R1                      ; 5AAA   0289
        INCR    R7                              ; 5AAB   000F

        PSHR    R5                              ; 5AAC   0275
L_5AAD:
        PSHR    R4                              ; 5AAD   0274
        MVI@    R4,     R5                      ; 5AAE   02A5
        DECR    R4                              ; 5AAF   0014
        ANDI    #$0007, R5                      ; 5AB0   03BD 0007
        BNEQ    L_5ABB                          ; 5AB2   020C 0007

        JSR     R5,     L_5A2C                  ; 5AB4   0004 0158 022C

        BNEQ    L_5ABB                          ; 5AB7   020C 0002

L_5AB9:
        PULR    R4                              ; 5AB9   02B4
        PULR    R7                              ; 5ABA   02B7

L_5ABB:
        MVI@    R4,     R2                      ; 5ABB   02A2
        ANDI    #$00C0, R2                      ; 5ABC   03BA 00C0
        XORR    R5,     R2                      ; 5ABE   01EA
        DECR    R4                              ; 5ABF   0014
        MVO@    R2,     R4                      ; 5AC0   0262
        PULR    R4                              ; 5AC1   02B4

        JSR     R5,     L_59B8                  ; 5AC2   0004 0158 01B8

        MVII    #$0154, R3                      ; 5AC5   02BB 0154

        JSR     R5,     L_57BB                  ; 5AC7   0004 0154 03BB

        PULR    R7                              ; 5ACA   02B7

L_5ACB:
        PSHR    R5                              ; 5ACB   0275
        MVI     G_0352, R0                      ; 5ACC   0280 0352
        ANDI    #$0080, R0                      ; 5ACE   03B8 0080
        BNEQ    L_5AFF                          ; 5AD0   020C 002D

        PSHR    R4                              ; 5AD2   0274
        MVI@    R4,     R2                      ; 5AD3   02A2
        MOVR    R2,     R0                      ; 5AD4   0090
        ANDI    #$0007, R0                      ; 5AD5   03B8 0007
        BEQ     L_5A22                          ; 5AD7   0224 00B6

        MOVR    R2,     R0                      ; 5AD9   0090
        ANDI    #$0020, R0                      ; 5ADA   03B8 0020
        BEQ     L_5AE6                          ; 5ADC   0204 0008

        PULR    R4                              ; 5ADE   02B4
        MVII    #$001A, R0                      ; 5ADF   02B8 001A

        JSR     R5,     L_67E2                  ; 5AE1   0004 0164 03E2

        B       L_5A7F                          ; 5AE4   0220 0066

L_5AE6:
        ANDI    #$0047, R2                      ; 5AE6   03BA 0047
        DECR    R4                              ; 5AE8   0014
        MVO@    R2,     R4                      ; 5AE9   0262
        ADDI    #$0003, R4                      ; 5AEA   02FC 0003
        MVI@    R4,     R0                      ; 5AEC   02A0

        JSR     R5,     L_5964                  ; 5AED   0004 0158 0164

        ADDI    #$0004, R0                      ; 5AF0   02F8 0004
        ADDI    #$0010, R1                      ; 5AF2   02F9 0010
        SUBI    #$0004, R4                      ; 5AF4   033C 0004
        MVI@    R4,     R3                      ; 5AF6   02A3
        MVI@    R4,     R5                      ; 5AF7   02A5
        CMPR    R3,     R0                      ; 5AF8   0158
        BNEQ    L_5B03                          ; 5AF9   020C 0008

        CMPR    R5,     R1                      ; 5AFB   0169
        BNEQ    L_5B03                          ; 5AFC   020C 0005

        PULR    R4                              ; 5AFE   02B4

L_5AFF:
        JSR     R5,     L_676E                  ; 5AFF   0004 0164 036E

        PULR    R7                              ; 5B02   02B7

L_5B03:
        PULR    R4                              ; 5B03   02B4
        PSHR    R0                              ; 5B04   0270
        MVII    #$001A, R0                      ; 5B05   02B8 001A

        JSR     R5,     L_67E2                  ; 5B07   0004 0164 03E2

        PULR    R0                              ; 5B0A   02B0
        MVII    #$018A, R3                      ; 5B0B   02BB 018A

        JSR     R5,     L_57BB                  ; 5B0D   0004 0154 03BB

        PULR    R7                              ; 5B10   02B7

L_5B11:
        PSHR    R5                              ; 5B11   0275
        PSHR    R0                              ; 5B12   0270
        PSHR    R4                              ; 5B13   0274
        B       L_5B28                          ; 5B14   0200 0012

L_5B16:
        PSHR    R5                              ; 5B16   0275
        PSHR    R0                              ; 5B17   0270
        PSHR    R4                              ; 5B18   0274
        MVII    #$0180, R5                      ; 5B19   02BD 0180
        CMPI    #$01BE, R4                      ; 5B1B   037C 01BE
        BLT     L_5B20                          ; 5B1D   0205 0001

        INCR    R5                              ; 5B1F   000D
L_5B20:
        MVI@    R5,     R0                      ; 5B20   02A8
        CMPI    #$00FF, R0                      ; 5B21   0378 00FF
        BEQ     L_5B3C                          ; 5B23   0204 0017

        SLL     R0,     2                       ; 5B25   004C
        SLL     R0,     1                       ; 5B26   0048
        ADDR    R0,     R4                      ; 5B27   00C4
L_5B28:
        MOVR    R4,     R2                      ; 5B28   00A2
        MVI@    R2,     R0                      ; 5B29   0290
        ANDI    #$007F, R0                      ; 5B2A   03B8 007F
        MVO@    R0,     R2                      ; 5B2C   0250
        ADDI    #$0007, R2                      ; 5B2D   02FA 0007
        MVI@    R2,     R0                      ; 5B2F   0290
        PSHR    R4                              ; 5B30   0274

        JSR     R5,     L_5944                  ; 5B31   0004 0158 0144
        BIDECLE $5B3F                           ; 5B34   003F 005B

        PULR    R4                              ; 5B36   02B4
        BNEQ    L_5B3C                          ; 5B37   020C 0003

        JSR     R5,     L_5ACB                  ; 5B39   0004 0158 02CB

L_5B3C:
        PULR    R4                              ; 5B3C   02B4
        PULR    R0                              ; 5B3D   02B0
        PULR    R7                              ; 5B3E   02B7

        CLRC                                    ; 5B3F   0006
        DECR    R5                              ; 5B40   0015
        DECR    R6                              ; 5B41   0016
L_5B42:
        DECR    R7                              ; 5B42   0017

        COMR    R0                              ; 5B43   0018
        COMR    R1                              ; 5B44   0019
        DECR    R3                              ; 5B45   0013
L_5B46:
        PSHR    R5                              ; 5B46   0275
        PSHR    R4                              ; 5B47   0274
        MVII    #$0180, R5                      ; 5B48   02BD 0180
        CMPI    #$01BE, R4                      ; 5B4A   037C 01BE
L_5B4C:
        BLT     L_5B4F                          ; 5B4C   0205 0001

        INCR    R5                              ; 5B4E   000D
L_5B4F:
        MVI@    R5,     R0                      ; 5B4F   02A8
        SLL     R0,     2                       ; 5B50   004C
        SLL     R0,     1                       ; 5B51   0048
        ADDR    R0,     R4                      ; 5B52   00C4
        MOVR    R4,     R2                      ; 5B53   00A2
        MVI@    R2,     R0                      ; 5B54   0290
        ANDI    #$0007, R0                      ; 5B55   03B8 0007
        BNEQ    L_5B64                          ; 5B57   020C 000B

        JSR     R5,     L_5A2C                  ; 5B59   0004 0158 022C

        BEQ     L_5AB9                          ; 5B5C   0224 00A4

        MVI@    R2,     R0                      ; 5B5E   0290
        XORR    R5,     R0                      ; 5B5F   01E8
        MVO@    R0,     R2                      ; 5B60   0250

        JSR     R5,     L_59B8                  ; 5B61   0004 0158 01B8

L_5B64:
        MVI@    R2,     R0                      ; 5B64   0290
        ANDI    #$0067, R0                      ; 5B65   03B8 0067
        XORI    #$0090, R0                      ; 5B67   03F8 0090
        MVO@    R0,     R2                      ; 5B69   0250
        ADDI    #$0007, R2                      ; 5B6A   02FA 0007
        MVI@    R2,     R0                      ; 5B6C   0290
        PSHR    R4                              ; 5B6D   0274

        JSR     R5,     L_5944                  ; 5B6E   0004 0158 0144
        BIDECLE $5B80                           ; 5B71   0080 005B

        PULR    R4                              ; 5B73   02B4
        BNEQ    L_5B7E                          ; 5B74   020C 0008

        MVII    #$0015, R0                      ; 5B76   02B8 0015

        JSR     R5,     L_67E2                  ; 5B78   0004 0164 03E2
        JSR     R5,     L_67F8                  ; 5B7B   0004 0164 03F8

L_5B7E:
        PULR    R4                              ; 5B7E   02B4
        PULR    R7                              ; 5B7F   02B7

        INCR    R0                              ; 5B80   0008
        DECR    R6                              ; 5B81   0016
L_5B82:
        DECR    R7                              ; 5B82   0017

        COMR    R2                              ; 5B83   001A
        COMR    R3                              ; 5B84   001B
        COMR    R0                              ; 5B85   0018
        COMR    R1                              ; 5B86   0019
        EIS                                     ; 5B87   0002
        DIS                                     ; 5B88   0003
L_5B89:
        PSHR    R5                              ; 5B89   0275
        MVI     G_034F, R0                      ; 5B8A   0280 034F
        MOVR    R0,     R1                      ; 5B8C   0081
        XORI    #$0004, R0                      ; 5B8D   03F8 0004
        MVO     R0,     G_034F                  ; 5B8F   0240 034F
        CLRR    R1                              ; 5B91   01C9
        ANDI    #$0004, R0                      ; 5B92   03B8 0004
        BEQ     L_5B97                          ; 5B94   0204 0001

        INCR    R1                              ; 5B96   0009
L_5B97:
        MVO     R1,     G_0179                  ; 5B97   0241 0179

        JSR     R5,     L_5D40                  ; 5B99   0004 015C 0140
        DECLE   $0008                           ; 5B9C   0008

        MVI     G_017D, R0                      ; 5B9D   0280 017D
        INCR    R0                              ; 5B9F   0008
        CMPI    #$000D, R0                      ; 5BA0   0378 000D
        BLT     L_5BA6                          ; 5BA2   0205 0002

        MVII    #$0001, R0                      ; 5BA4   02B8 0001
L_5BA6:
        MVI     G_0352, R1                      ; 5BA6   0281 0352
        ANDI    #$0080, R1                      ; 5BA8   03B9 0080
        BEQ     L_5BB1                          ; 5BAA   0204 0005

        CMPI    #$0003, R0                      ; 5BAC   0378 0003
        BLE     L_5BB1                          ; 5BAE   0206 0001

        CLRR    R0                              ; 5BB0   01C0
L_5BB1:
        MVO     R0,     G_017D                  ; 5BB1   0240 017D
        INCR    R7                              ; 5BB3   000F

L_5BB4:
        PSHR    R5                              ; 5BB4   0275
L_5BB5:
        MVI     G_0352, R0                      ; 5BB5   0280 0352
        ANDI    #$0080, R0                      ; 5BB7   03B8 0080
        BNEQ    L_5BEC                          ; 5BB9   020C 0031

        MVII    #$018E, R4                      ; 5BBB   02BC 018E
L_5BBD:
        MVI@    R4,     R0                      ; 5BBD   02A0
        ANDI    #$0007, R0                      ; 5BBE   03B8 0007
        BEQ     L_5BC9                          ; 5BC0   0204 0007

        JSR     R5,     L_511C                  ; 5BC2   0004 0150 011C
        DECLE   $0001                           ; 5BC5   0001
        BIDECLE $5BB5                           ; 5BC6   00B5 005B

        PULR    R7                              ; 5BC8   02B7

L_5BC9:
        ADDI    #$0007, R4                      ; 5BC9   02FC 0007
        CMPI    #$01E6, R4                      ; 5BCB   037C 01E6
        BLE     L_5BBD                          ; 5BCD   0226 0011

        JSR     R5,     L_53FF                  ; 5BCF   0004 0150 03FF
        JSR     R5,     L_542A                  ; 5BD2   0004 0154 002A
        DECLE   $0018                           ; 5BD5   0018

        JSR     R5,     L_67EE                  ; 5BD6   0004 0164 03EE
        DECLE   $000B                           ; 5BD9   000B

        MVI     G_034F, R0                      ; 5BDA   0280 034F
        MVII    #$018E, R4                      ; 5BDC   02BC 018E
        ANDI    #$0004, R0                      ; 5BDE   03B8 0004
        BEQ     L_5BE4                          ; 5BE0   0204 0002

        MVII    #$01BE, R4                      ; 5BE2   02BC 01BE

L_5BE4:
        JSR     R5,     L_5447                  ; 5BE4   0004 0154 0047
        DECLE   $0000                           ; 5BE7   0000

        JSR     R5,     L_5C92                  ; 5BE8   0004 015C 0092

        PULR    R7                              ; 5BEB   02B7

L_5BEC:
        JSR     R5,     L_53FF                  ; 5BEC   0004 0150 03FF
        JSR     R5,     L_542A                  ; 5BEF   0004 0154 002A
        DECLE   $0084                           ; 5BF2   0084

        JSR     R5,     L_67EE                  ; 5BF3   0004 0164 03EE
        DECLE   $000B                           ; 5BF6   000B

        MVI     G_034F, R0                      ; 5BF7   0280 034F
        MVII    #$018E, R4                      ; 5BF9   02BC 018E
        ANDI    #$0004, R0                      ; 5BFB   03B8 0004
        BEQ     L_5C01                          ; 5BFD   0204 0002

        MVII    #$01BE, R4                      ; 5BFF   02BC 01BE
L_5C01:
        MVII    #$008C, R0                      ; 5C01   02B8 008C
        MVI     G_017D, R1                      ; 5C03   0281 017D
        ANDI    #$0002, R1                      ; 5C05   03B9 0002
        BEQ     L_5C0B                          ; 5C07   0204 0002

        MVII    #$0094, R0                      ; 5C09   02B8 0094

L_5C0B:
        JSR     R5,     L_5448                  ; 5C0B   0004 0154 0048
        JSR     R5,     L_5C92                  ; 5C0E   0004 015C 0092

        PULR    R7                              ; 5C11   02B7

L_5C12:
        MVII    #$0000, R0                      ; 5C12   02B8 0000
        MVO     R0,     G_0173                  ; 5C14   0240 0173
        MVII    #$018E, R4                      ; 5C16   02BC 018E
        MVII    #$0060, R0                      ; 5C18   02B8 0060

        JSR     R5,     X_FILL_ZERO             ; 5C1A   0004 0114 0338

        MVII    #$0107, R4                      ; 5C1D   02BC 0107
        MVII    #$003C, R0                      ; 5C1F   02B8 003C

        JSR     R5,     X_FILL_ZERO             ; 5C21   0004 0114 0338

        MVII    #$0319, R4                      ; 5C24   02BC 0319
        MVII    #$0018, R0                      ; 5C26   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 5C28   0004 0114 0338
        DECLE   $0004                           ; 5C2B   0004

        ANDR    R3,     R4                      ; 5C2C   019C
        SUBR    R4,     R4                      ; 5C2D   0124
        CLRR    R0                              ; 5C2E   01C0
        MVO     R0,     G_017C                  ; 5C2F   0240 017C
        MVII    #$00FF, R0                      ; 5C31   02B8 00FF
        MVO     R0,     G_0180                  ; 5C33   0240 0180
        MVO     R0,     G_0181                  ; 5C35   0240 0181
        SDBD                                    ; 5C37   0001
        MVII    #$2928, R0                      ; 5C38   02B8 0028 0029
        MVO     R0,     G_0330                  ; 5C3B   0240 0330
        SDBD                                    ; 5C3D   0001
        MVII    #$0937, R0                      ; 5C3E   02B8 0037 0009
        MVO     R0,     G_0329                  ; 5C41   0240 0329

        JSR     R5,     L_5720                  ; 5C43   0004 0154 0320
        BIDECLE $000C                           ; 5C46   000C 0000

        MVII    #$018E, R4                      ; 5C48   02BC 018E
        CLRR    R0                              ; 5C4A   01C0
        MVII    #$0040, R1                      ; 5C4B   02B9 0040

        JSR     R5,     L_53F3                  ; 5C4D   0004 0150 03F3

        MVII    #$01BE, R4                      ; 5C50   02BC 01BE
        MVII    #$00B4, R0                      ; 5C52   02B8 00B4
        MVII    #$0066, R1                      ; 5C54   02B9 0066

        JSR     R5,     L_53F3                  ; 5C56   0004 0150 03F3
        JSR     R5,     L_651A                  ; 5C59   0004 0164 011A
        JSR     R5,     L_6DCC                  ; 5C5C   0004 016C 01CC
        JSR     R5,     L_6378                  ; 5C5F   0004 0160 0378
        DECLE   $0002                           ; 5C62   0002

        PULR    R7                              ; 5C63   02B7

L_5C64:
        MVI     G_0352, R3                      ; 5C64   0283 0352
        ANDI    #$0080, R3                      ; 5C66   03BB 0080
        BNEQ    L_5C8A                          ; 5C68   020C 0020

        PSHR    R5                              ; 5C6A   0275
        MVII    #$0003, R3                      ; 5C6B   02BB 0003
L_5C6D:
        MVII    #$0006, R0                      ; 5C6D   02B8 0006

        JSR     R5,     X_RAND2                 ; 5C6F   0004 0114 029E

        SLL     R0,     2                       ; 5C72   004C
        SLL     R0,     1                       ; 5C73   0048
        MOVR    R4,     R1                      ; 5C74   00A1
        ADDR    R0,     R1                      ; 5C75   00C1
        MVI@    R1,     R0                      ; 5C76   0288
        ANDI    #$0020, R0                      ; 5C77   03B8 0020
        BEQ     L_5C6D                          ; 5C79   0224 000D

        PSHR    R3                              ; 5C7B   0273
        PSHR    R4                              ; 5C7C   0274
        MOVR    R1,     R4                      ; 5C7D   008C

        JSR     R5,     L_67DA                  ; 5C7E   0004 0164 03DA
        JSR     R5,     L_5A7E                  ; 5C81   0004 0158 027E

        PULR    R4                              ; 5C84   02B4
        PULR    R3                              ; 5C85   02B3
        DECR    R3                              ; 5C86   0013
        BNEQ    L_5C6D                          ; 5C87   022C 001B
        PULR    R7                              ; 5C89   02B7

L_5C8A:
        MVII    #$0002, R3                      ; 5C8A   02BB 0002
        B       L_5C9A                          ; 5C8C   0200 000C

        MVII    #$0003, R3                      ; 5C8E   02BB 0003
        B       L_5C9A                          ; 5C90   0200 0008

L_5C92:
        MVI     G_0352, R3                      ; 5C92   0283 0352
        ANDI    #$0080, R3                      ; 5C94   03BB 0080
        BNEQ    L_5C8A                          ; 5C96   022C 000D

        MVII    #$0006, R3                      ; 5C98   02BB 0006
L_5C9A:
        PSHR    R5                              ; 5C9A   0275
        PSHR    R4                              ; 5C9B   0274
L_5C9C:
        PSHR    R3                              ; 5C9C   0273

        JSR     R5,     L_67DA                  ; 5C9D   0004 0164 03DA
        JSR     R5,     L_5A7E                  ; 5CA0   0004 0158 027E

        ADDI    #$0008, R4                      ; 5CA3   02FC 0008
        PULR    R3                              ; 5CA5   02B3
        DECR    R3                              ; 5CA6   0013
        BNEQ    L_5C9C                          ; 5CA7   022C 000C

        PULR    R4                              ; 5CA9   02B4
        PULR    R7                              ; 5CAA   02B7

L_5CAB:
        PSHR    R5                              ; 5CAB   0275
        MVI     G_034F, R5                      ; 5CAC   0285 034F
        CLRR    R1                              ; 5CAE   01C9
        MVII    #$0001, R0                      ; 5CAF   02B8 0001
        ANDI    #$0004, R5                      ; 5CB1   03BD 0004
        BEQ     L_5CB7                          ; 5CB3   0204 0002

        INCR    R1                              ; 5CB5   0009
        SLL     R0,     1                       ; 5CB6   0048
L_5CB7:
        MVO     R1,     G_0179                  ; 5CB7   0241 0179
        MOVR    R1,     R2                      ; 5CB9   008A
        ADDI    #$0176, R1                      ; 5CBA   02F9 0176
        XORI    #$0001, R2                      ; 5CBC   03FA 0001
        ADDI    #$0176, R2                      ; 5CBE   02FA 0176
        MVI@    R1,     R3                      ; 5CC0   028B
        MOVR    R3,     R5                      ; 5CC1   009D
        ANDI    #$003F, R3                      ; 5CC2   03BB 003F
        XORR    R3,     R5                      ; 5CC4   01DD
        INCR    R3                              ; 5CC5   000B
        XORR    R3,     R5                      ; 5CC6   01DD
        MVO@    R5,     R1                      ; 5CC7   024D

        JSR     R5,     L_5722                  ; 5CC8   0004 0154 0322

        CMPI    #$003F, R3                      ; 5CCB   037B 003F
        BEQ     L_5CED                          ; 5CCD   0204 001E

        CMPI    #$000F, R3                      ; 5CCF   037B 000F
        BLT     L_5CDE                          ; 5CD1   0205 000B

        MVI@    R2,     R0                      ; 5CD3   0290
        ANDI    #$003F, R0                      ; 5CD4   03B8 003F
        NEGR    R0                              ; 5CD6   0020
        ADDR    R3,     R0                      ; 5CD7   00D8
        BMI     L_5CDE                          ; 5CD8   020B 0004

        CMPI    #$0002, R0                      ; 5CDA   0378 0002
        BGE     L_5CED                          ; 5CDC   020D 000F

L_5CDE:
        MVII    #$0004, R1                      ; 5CDE   02B9 0004
        ADD     G_0179, R1                      ; 5CE0   02C1 0179

        JSR     R5,     L_5D41                  ; 5CE2   0004 015C 0141
        JSR     R5,     L_6378                  ; 5CE5   0004 0160 0378
        DECLE   $0002                           ; 5CE8   0002

        JSR     R5,     L_5BB4                  ; 5CE9   0004 0158 03B4

        PULR    R7                              ; 5CEC   02B7

L_5CED:
        MVI@    R1,     R0                      ; 5CED   0288
        ANDI    #$00C0, R0                      ; 5CEE   03B8 00C0
        ADDI    #$0040, R0                      ; 5CF0   02F8 0040
        XORR    R0,     R3                      ; 5CF2   01C3
        MVO@    R3,     R1                      ; 5CF3   024B
        CMPI    #$00C0, R0                      ; 5CF4   0378 00C0
        BEQ     L_5D28                          ; 5CF6   0204 0030

        MVII    #$0000, R1                      ; 5CF8   02B9 0000
        ADD     G_0179, R1                      ; 5CFA   02C1 0179

        JSR     R5,     L_5D41                  ; 5CFC   0004 015C 0141
        JSR     R5,     L_6378                  ; 5CFF   0004 0160 0378
        DECLE   $000D                           ; 5D02   000D

        MVII    #$0000, R0                      ; 5D03   02B8 0000
        MVO     R0,     G_0173                  ; 5D05   0240 0173
        MVI     G_0352, R0                      ; 5D07   0280 0352
        ANDI    #$0080, R0                      ; 5D09   03B8 0080
        BEQ     L_5D21                          ; 5D0B   0204 0014

        CLRR    R0                              ; 5D0D   01C0
        MVO     R0,     G_017D                  ; 5D0E   0240 017D
        MVI     G_0175, R0                      ; 5D10   0280 0175
        INCR    R0                              ; 5D12   0008
        MVO     R0,     G_0175                  ; 5D13   0240 0175
        ANDI    #$0001, R0                      ; 5D15   03B8 0001
        SLL     R0,     2                       ; 5D17   004C
        MVO     R0,     G_034F                  ; 5D18   0240 034F

        JSR     R5,     L_511C                  ; 5D1A   0004 0150 011C
        DECLE   $0001                           ; 5D1D   0001
        BIDECLE $6541                           ; 5D1E   0041 0065

        PULR    R7                              ; 5D20   02B7

L_5D21:
        JSR     R5,     L_511C                  ; 5D21   0004 0150 011C
        DECLE   $0001                           ; 5D24   0001
        BIDECLE $64AF                           ; 5D25   00AF 0064

        PULR    R7                              ; 5D27   02B7

L_5D28:
        JSR     R5,     L_5720                  ; 5D28   0004 0154 0320
        BIDECLE $0030                           ; 5D2B   0030 0000

        MVII    #$0002, R1                      ; 5D2D   02B9 0002
        ADD     G_0179, R1                      ; 5D2F   02C1 0179

        JSR     R5,     L_5D41                  ; 5D31   0004 015C 0141
        JSR     R5,     L_6378                  ; 5D34   0004 0160 0378
        DECLE   $000D                           ; 5D37   000D

        MVII    #$0003, R0                      ; 5D38   02B8 0003
        MVO     R0,     G_0173                  ; 5D3A   0240 0173
        CLRR    R0                              ; 5D3C   01C0
        MVO     R0,     G_0189                  ; 5D3D   0240 0189
        PULR    R7                              ; 5D3F   02B7

L_5D40:
        MVI@    R5,     R1                      ; 5D40   02A9
L_5D41:
        PSHR    R5                              ; 5D41   0275

        JSR     R5,     L_5F14                  ; 5D42   0004 015C 0314

        MVII    #$0002, R3                      ; 5D45   02BB 0002
        SUB     G_0179, R3                      ; 5D47   0303 0179
        PSHR    R1                              ; 5D49   0271
        MOVR    R7,     R1                      ; 5D4A   00B9
        ADDI    #$002B, R1                      ; 5D4B   02F9 002B
        MVI     G_0352, R5                      ; 5D4D   0285 0352
        ANDI    #$0020, R5                      ; 5D4F   03BD 0020
        BEQ     L_5D56                          ; 5D51   0204 0003

        MOVR    R7,     R1                      ; 5D53   00B9
        ADDI    #$0032, R1                      ; 5D54   02F9 0032
L_5D56:
        ADD@    R6,     R1                      ; 5D56   02F1
        ADD@    R1,     R1                      ; 5D57   02C9
        MOVR    R1,     R5                      ; 5D58   008D
        MVI@    R5,     R4                      ; 5D59   02AC
L_5D5A:
        MVI@    R5,     R0                      ; 5D5A   02A8
        SUBI    #$0020, R0                      ; 5D5B   0338 0020
        BMI     L_5D65                          ; 5D5D   020B 0006

        SLL     R0,     2                       ; 5D5F   004C
        SLL     R0,     1                       ; 5D60   0048
        XORR    R3,     R0                      ; 5D61   01D8
        MVO@    R0,     R4                      ; 5D62   0260
        B       L_5D5A                          ; 5D63   0220 000A

L_5D65:
        ADDI    #$0020, R0                      ; 5D65   02F8 0020
        BEQ     L_5D71                          ; 5D67   0204 0008

        MVI     G_0175, R0                      ; 5D69   0280 0175
        INCR    R0                              ; 5D6B   0008
        MVII    #$0001, R1                      ; 5D6C   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5D6E   0004 0118 00C5

L_5D71:
        MVII    #$0050, R0                      ; 5D71   02B8 0050
        MVO     R0,     G_0189                  ; 5D73   0240 0189
        PULR    R7                              ; 5D75   02B7

        NEGR    R0                              ; 5D76   0020
        GSWD    R0                              ; 5D77   0030
        SWAP    R1,     1                       ; 5D78   0041
        RLC     R1,     1                       ; 5D79   0051
        SLR     R2,     1                       ; 5D7A   0062
        SAR     R1,     2                       ; 5D7B   006D
        SARC    R1,     1                       ; 5D7C   0079
        MOVR    R0,     R5                      ; 5D7D   0085
        TSTR    R2                              ; 5D7E   0092
        TSTR    R3                              ; 5D7F   009B
        MOVR    R3,     R7                      ; 5D80   009F

        TSTR    R4                              ; 5D81   00A4
        MOVR    R6,     R3                      ; 5D82   00B3
        MOVR    R7,     R6                      ; 5D83   00BE
        ADDR    R1,     R7                      ; 5D84   00CF

        ADDR    R3,     R4                      ; 5D85   00DC
        ADDR    R5,     R3                      ; 5D86   00EB
        ADDR    R7,     R3                      ; 5D87   00FB
        SUBR    R1,     R6                      ; 5D88   010E
        SUBR    R3,     R6                      ; 5D89   011E
        SUBR    R6,     R1                      ; 5D8A   0131
        CMPR    R0,     R1                      ; 5D8B   0141
        SAR     R1,     1                       ; 5D8C   0069
        RRC     R1,     2                       ; 5D8D   0075
        MOVR    R0,     R2                      ; 5D8E   0082
        MOVR    R1,     R3                      ; 5D8F   008B
        MOVR    R1,     R7                      ; 5D90   008F

        DECLE   $0094,  $00A3,  $00AE,  $00BF   ; 5D91   0094 00A3 00AE 00BF
        DECLE   $00CC,  $023E,  $0052,  $0065   ; 5D95   00CC 023E 0052 0065
        DECLE   $0064,  $0073,  $0020,  $0057   ; 5D99   0064 0073 0020 0057
        DECLE   $0069,  $006E,  $0020,  $0047   ; 5D9D   0069 006E 0020 0047
        DECLE   $0061,  $006D,  $0065,  $0020   ; 5DA1   0061 006D 0065 0020
        DECLE   $0023,  $0001,  $023D,  $0042   ; 5DA5   0023 0001 023D 0042
        DECLE   $006C,  $0075,  $0065,  $0073   ; 5DA9   006C 0075 0065 0073
        DECLE   $0020,  $0057,  $0069,  $006E   ; 5DAD   0020 0057 0069 006E
        DECLE   $0020,  $0047,  $0061,  $006D   ; 5DB1   0020 0047 0061 006D
        DECLE   $0065,  $0020,  $0023,  $0001   ; 5DB5   0065 0020 0023 0001
        DECLE   $023F,  $0052,  $0065,  $0064   ; 5DB9   023F 0052 0065 0064
        DECLE   $0073,  $0020,  $0057,  $0069   ; 5DBD   0073 0020 0057 0069
        DECLE   $006E,  $0020,  $004D,  $0061   ; 5DC1   006E 0020 004D 0061
        DECLE   $0074,  $0063,  $0068,  $0021   ; 5DC5   0074 0063 0068 0021
        DECLE   $0000,  $023E,  $0042,  $006C   ; 5DC9   0000 023E 0042 006C
        DECLE   $0075,  $0065,  $0073,  $0020   ; 5DCD   0075 0065 0073 0020
        DECLE   $0057,  $0069,  $006E,  $0020   ; 5DD1   0057 0069 006E 0020
        DECLE   $004D,  $0061,  $0074,  $0063   ; 5DD5   004D 0061 0074 0063
        DECLE   $0068,  $0021,  $0000,  $0241   ; 5DD9   0068 0021 0000 0241
        DECLE   $0050,  $006F,  $0069,  $006E   ; 5DDD   0050 006F 0069 006E
        DECLE   $0074,  $0020,  $0052,  $0065   ; 5DE1   0074 0020 0052 0065
        DECLE   $0064,  $0073,  $0000,  $0241   ; 5DE5   0064 0073 0000 0241
        DECLE   $0050,  $006F,  $0069,  $006E   ; 5DE9   0050 006F 0069 006E
        DECLE   $0074,  $0020,  $0042,  $006C   ; 5DED   0074 0020 0042 006C
        DECLE   $0075,  $0065,  $0073,  $0000   ; 5DF1   0075 0065 0073 0000
        DECLE   $0241,  $0047,  $0061,  $006D   ; 5DF5   0241 0047 0061 006D
        DECLE   $0065,  $0020,  $0050,  $006F   ; 5DF9   0065 0020 0050 006F
        DECLE   $0069,  $006E,  $0074,  $0021   ; 5DFD   0069 006E 0074 0021
        DECLE   $0000,  $0240,  $004D,  $0061   ; 5E01   0000 0240 004D 0061
        DECLE   $0074,  $0063,  $0068,  $0020   ; 5E05   0074 0063 0068 0020
        DECLE   $0050,  $006F,  $0069,  $006E   ; 5E09   0050 006F 0069 006E
        DECLE   $0074,  $0021,  $0000,  $0242   ; 5E0D   0074 0021 0000 0242
        DECLE   $0053,  $0069,  $0064,  $0065   ; 5E11   0053 0069 0064 0065
        DECLE   $0020,  $004F,  $0075,  $0074   ; 5E15   0020 004F 0075 0074
        DECLE   $0000,  $0245,  $0049,  $006E   ; 5E19   0000 0245 0049 006E
        DECLE   $0021,  $0000,  $0244,  $004F   ; 5E1D   0021 0000 0244 004F
        DECLE   $0075,  $0074,  $0021,  $0000   ; 5E21   0075 0074 0021 0000
        DECLE   $023F,  $0055,  $006E,  $0064   ; 5E25   023F 0055 006E 0064
        DECLE   $0065,  $0072,  $0020,  $0054   ; 5E29   0065 0072 0020 0054
        DECLE   $0068,  $0065,  $0020,  $004E   ; 5E2D   0068 0065 0020 004E
        DECLE   $0065,  $0074,  $0021,  $0000   ; 5E31   0065 0074 0021 0000
        DECLE   $0241,  $004E,  $0065,  $0074   ; 5E35   0241 004E 0065 0074
        DECLE   $0020,  $0053,  $0065,  $0072   ; 5E39   0020 0053 0065 0072
        DECLE   $0076,  $0065,  $0021,  $0000   ; 5E3D   0076 0065 0021 0000
        DECLE   $023E,  $0053,  $0065,  $0072   ; 5E41   023E 0053 0065 0072
        DECLE   $0076,  $0065,  $0020,  $0055   ; 5E45   0076 0065 0020 0055
        DECLE   $006E,  $0064,  $0065,  $0072   ; 5E49   006E 0064 0065 0072
        DECLE   $0020,  $004E,  $0065,  $0074   ; 5E4D   0020 004E 0065 0074
        DECLE   $0021,  $0000,  $0240,  $004D   ; 5E51   0021 0000 0240 004D
        DECLE   $0061,  $006E,  $0020,  $0048   ; 5E55   0061 006E 0020 0048
        DECLE   $0069,  $0074,  $0020,  $004E   ; 5E59   0069 0074 0020 004E
        DECLE   $0065,  $0074,  $0021,  $0000   ; 5E5D   0065 0074 0021 0000
        DECLE   $023F,  $004D,  $0061,  $006E   ; 5E61   023F 004D 0061 006E
        DECLE   $0020,  $0055,  $006E,  $0064   ; 5E65   0020 0055 006E 0064
        DECLE   $0065,  $0072,  $0020,  $004E   ; 5E69   0065 0072 0020 004E
        DECLE   $0065,  $0074,  $0021,  $0000   ; 5E6D   0065 0074 0021 0000
        DECLE   $023E,  $004B,  $0079,  $006C   ; 5E71   023E 004B 0079 006C
        DECLE   $0065,  $0020,  $0057,  $0069   ; 5E75   0065 0020 0057 0069
        DECLE   $006E,  $0073,  $0020,  $0047   ; 5E79   006E 0073 0020 0047
        DECLE   $0061,  $006D,  $0065,  $0021   ; 5E7D   0061 006D 0065 0021
        DECLE   $0000,  $023D,  $0052,  $0075   ; 5E81   0000 023D 0052 0075
        DECLE   $0073,  $0073,  $0065,  $006C   ; 5E85   0073 0073 0065 006C
        DECLE   $006C,  $0020,  $0057,  $0069   ; 5E89   006C 0020 0057 0069
        DECLE   $006E,  $0073,  $0020,  $0047   ; 5E8D   006E 0073 0020 0047
        DECLE   $0061,  $006D,  $0065,  $0021   ; 5E91   0061 006D 0065 0021
        DECLE   $0000,  $023E,  $004B,  $0079   ; 5E95   0000 023E 004B 0079
        DECLE   $006C,  $0065,  $0020,  $0057   ; 5E99   006C 0065 0020 0057
        DECLE   $0069,  $006E,  $0073,  $0020   ; 5E9D   0069 006E 0073 0020
        DECLE   $004D,  $0061,  $0074,  $0063   ; 5EA1   004D 0061 0074 0063
        DECLE   $0068,  $0000,  $023D,  $0052   ; 5EA5   0068 0000 023D 0052
        DECLE   $0075,  $0073,  $0073,  $0065   ; 5EA9   0075 0073 0073 0065
        DECLE   $006C,  $006C,  $0020,  $0057   ; 5EAD   006C 006C 0020 0057
        DECLE   $0069,  $006E,  $0073,  $0020   ; 5EB1   0069 006E 0073 0020
        DECLE   $004D,  $0061,  $0074,  $0063   ; 5EB5   004D 0061 0074 0063
        DECLE   $0068,  $0000,  $023F,  $0050   ; 5EB9   0068 0000 023F 0050
        DECLE   $006F,  $0069,  $006E,  $0074   ; 5EBD   006F 0069 006E 0074
        DECLE   $0020,  $0046,  $006F,  $0072   ; 5EC1   0020 0046 006F 0072
        DECLE   $0020,  $004B,  $0079,  $006C   ; 5EC5   0020 004B 0079 006C
        DECLE   $0065,  $0021,  $0000,  $023D   ; 5EC9   0065 0021 0000 023D
        DECLE   $0050,  $006F,  $0069,  $006E   ; 5ECD   0050 006F 0069 006E
        DECLE   $0074,  $0020,  $0046,  $006F   ; 5ED1   0074 0020 0046 006F
        DECLE   $0072,  $0020,  $0052,  $0075   ; 5ED5   0072 0020 0052 0075
        DECLE   $0073,  $0073,  $0065,  $006C   ; 5ED9   0073 0073 0065 006C
        DECLE   $006C,  $0021,  $0000           ; 5EDD   006C 0021 0000
L_5EE0:
        PSHR    R5                              ; 5EE0   0275
        SDBD                                    ; 5EE1   0001
        MVII    #$9360, R5                      ; 5EE2   02BD 0060 0093
        CLRR    R2                              ; 5EE5   01D2
        CMPI    #$000A, R1                      ; 5EE6   0379 000A
        BLT     L_5EF3                          ; 5EE8   0205 0009

L_5EEA:
        SUBI    #$000A, R1                      ; 5EEA   0339 000A
        BMI     L_5EF1                          ; 5EEC   020B 0003

        INCR    R2                              ; 5EEE   000A
        B       L_5EEA                          ; 5EEF   0220 0006

L_5EF1:
        ADDI    #$000A, R1                      ; 5EF1   02F9 000A
L_5EF3:
        PSHR    R2                              ; 5EF3   0272
        SLL     R2,     2                       ; 5EF4   004E
        ADD@    R6,     R2                      ; 5EF5   02F2
        PSHR    R1                              ; 5EF6   0271
        SLL     R1,     2                       ; 5EF7   004D
        ADD@    R6,     R1                      ; 5EF8   02F1
        ADDR    R5,     R1                      ; 5EF9   00E9
        ADDR    R5,     R2                      ; 5EFA   00EA
        CMPR    R5,     R2                      ; 5EFB   016A
        BNEQ    L_5F02                          ; 5EFC   020C 0004

        SDBD                                    ; 5EFE   0001
        MVII    #$939A, R2                      ; 5EFF   02BA 009A 0093
L_5F02:
        CLRR    R0                              ; 5F02   01C0
        MVO@    R0,     R4                      ; 5F03   0260
        MVII    #$0005, R5                      ; 5F04   02BD 0005
L_5F06:
        MVI@    R2,     R0                      ; 5F06   0290
        SLL     R0,     2                       ; 5F07   004C
        SLL     R0,     2                       ; 5F08   004C
        XOR@    R1,     R0                      ; 5F09   03C8
        MVO@    R0,     R4                      ; 5F0A   0260
        INCR    R2                              ; 5F0B   000A
        INCR    R1                              ; 5F0C   0009
        DECR    R5                              ; 5F0D   0015
        BNEQ    L_5F06                          ; 5F0E   022C 0009

        CLRR    R0                              ; 5F10   01C0
        MVO@    R0,     R4                      ; 5F11   0260
        MVO@    R0,     R4                      ; 5F12   0260
        PULR    R7                              ; 5F13   02B7

L_5F14:
        PSHR    R5                              ; 5F14   0275
        MVII    #$023D, R4                      ; 5F15   02BC 023D
        SDBD                                    ; 5F17   0001
        MVII    #$9E03, R5                      ; 5F18   02BD 0003 009E
        MVI     G_0352, R0                      ; 5F1B   0280 0352
        ANDI    #$0080, R0                      ; 5F1D   03B8 0080
        BEQ     L_5F25                          ; 5F1F   0204 0004

        SDBD                                    ; 5F21   0001
        MVII    #$A07F, R5                      ; 5F22   02BD 007F 00A0
L_5F25:
        SDBD                                    ; 5F25   0001
        MVI@    R5,     R0                      ; 5F26   02A8
        MVO@    R0,     R4                      ; 5F27   0260
        CMPI    #$024F, R4                      ; 5F28   037C 024F
        BLT     L_5F25                          ; 5F2A   0225 0006
        PULR    R7                              ; 5F2C   02B7

        PSHR    R5                              ; 5F2D   0275
        MVI     G_0173, R2                      ; 5F2E   0282 0173
        INCR    R2                              ; 5F30   000A
        ADDR    R7,     R2                      ; 5F31   00FA
        ADD@    R2,     R7                      ; 5F32   02D7

        INCR    R0                              ; 5F33   0008
        INCR    R1                              ; 5F34   0009
        COMR    R0                              ; 5F35   0018
        INCR    R0                              ; 5F36   0008
        INCR    R0                              ; 5F37   0008
        INCR    R0                              ; 5F38   0008
        INCR    R0                              ; 5F39   0008
        INCR    R0                              ; 5F3A   0008
L_5F3B:
        PULR    R7                              ; 5F3B   02B7

        DECLE   $0358,  $0224,  $0003,  $0378   ; 5F3C   0358 0224 0003 0378
        DECLE   $00FF,  $0224,  $0007,  $0004   ; 5F40   00FF 0224 0007 0004

        AND@    R4,     R0                      ; 5F44   03A0
        XORR    R4,     R5                      ; 5F45   01E5
L_5F46:
        PSHR    R5                              ; 5F46   0275
        MVI     G_0350, R4                      ; 5F47   0284 0350
        B       L_5F80                          ; 5F49   0200 0035

        CMP@    R3,     R0                      ; 5F4B   0358
        BEQ     L_5F3B                          ; 5F4C   0224 0012

        MVII    #$0180, R2                      ; 5F4E   02BA 0180
        MVI     G_0352, R4                      ; 5F50   0284 0352
        ANDI    #$000C, R4                      ; 5F52   03BC 000C
        BEQ     L_5F5E                          ; 5F54   0204 0008

        MVO     R1,     G_017B                  ; 5F56   0241 017B
        CLRR    R1                              ; 5F58   01C9
        ANDI    #$0004, R4                      ; 5F59   03BC 0004
        BNEQ    L_5F5E                          ; 5F5B   020C 0001

        INCR    R1                              ; 5F5D   0009
L_5F5E:
        MVO     R1,     G_0179                  ; 5F5E   0241 0179
        DECLE   $0004                           ; 5F60   0004

        ANDR    R5,     R4                      ; 5F61   01AC
        MVO@    R0,     R1                      ; 5F62   0248
        BEQ     L_5F3B                          ; 5F63   0224 0029

        MVII    #$018E, R4                      ; 5F65   02BC 018E
        TSTR    R1                              ; 5F67   0089
        BEQ     L_5F6C                          ; 5F68   0204 0002

        MVII    #$01BE, R4                      ; 5F6A   02BC 01BE
L_5F6C:
        ADDR    R1,     R2                      ; 5F6C   00CA
        MVI     G_0352, R3                      ; 5F6D   0283 0352
        ANDI    #$000C, R3                      ; 5F6F   03BB 000C
        BEQ     L_5F76                          ; 5F71   0204 0003

        MVI     G_017B, R2                      ; 5F73   0282 017B
        INCR    R7                              ; 5F75   000F

L_5F76:
        MVI@    R2,     R2                      ; 5F76   0292
L_5F77:
        CMPI    #$00FF, R2                      ; 5F77   037A 00FF
        BEQ     L_5F3B                          ; 5F79   0224 003F

        SLL     R2,     2                       ; 5F7B   004E
        SLL     R2,     1                       ; 5F7C   004A
        ADDR    R2,     R4                      ; 5F7D   00D4
        MVO     R4,     G_0350                  ; 5F7E   0244 0350
L_5F80:
        MVO     R0,     G_017A                  ; 5F80   0240 017A
        MVI@    R4,     R3                      ; 5F82   02A3
        ANDI    #$0007, R3                      ; 5F83   03BB 0007
        DECR    R3                              ; 5F85   0013
        BMI     L_5F3B                          ; 5F86   022B 004C

        SLL     R3,     1                       ; 5F88   004B
        PSHR    R3                              ; 5F89   0273
        SLL     R3,     2                       ; 5F8A   004F
        ADD@    R6,     R3                      ; 5F8B   02F3
        ADDI    #$0107, R3                      ; 5F8C   02FB 0107
        ADDI    #$0002, R3                      ; 5F8E   02FB 0002
        ADDI    #$0006, R4                      ; 5F90   02FC 0006
        MVI@    R4,     R0                      ; 5F92   02A0

        JSR     R5,     L_5944                  ; 5F93   0004 0158 0144
        BIDECLE $6037                           ; 5F96   0037 0060

        BEQ     L_5F3B                          ; 5F98   0224 005E

        MOVR    R0,     R2                      ; 5F9A   0082
        CLRR    R0                              ; 5F9B   01C0
        CLRR    R1                              ; 5F9C   01C9
        MVI     G_017A, R5                      ; 5F9D   0285 017A
        CMPI    #$00FF, R5                      ; 5F9F   037D 00FF
        BEQ     L_5FB3                          ; 5FA1   0204 0010

        MVII    #$018A, R4                      ; 5FA3   02BC 018A
        ADD     G_0179, R4                      ; 5FA5   02C4 0179
        MVI@    R4,     R4                      ; 5FA7   02A4
        ADDR    R7,     R4                      ; 5FA8   00FC
        ADDI    #$0088, R4                      ; 5FA9   02FC 0088
        MVI@    R4,     R0                      ; 5FAB   02A0
        MOVR    R5,     R1                      ; 5FAC   00A9

        JSR     R5,     .EXEC.629               ; 5FAD   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5FB0   0004 0114 0357

L_5FB3:
        MOVR    R3,     R5                      ; 5FB3   009D
        SLL     R0,     1                       ; 5FB4   0048
        SLL     R1,     1                       ; 5FB5   0049
        MVO@    R0,     R5                      ; 5FB6   0268
        SWAP    R0,     1                       ; 5FB7   0040
        MVO@    R0,     R5                      ; 5FB8   0268
        NOP                                     ; 5FB9   0034
        MVO@    R1,     R5                      ; 5FBA   0269
        SWAP    R1,     1                       ; 5FBB   0041
        MVO@    R1,     R5                      ; 5FBC   0269
        MVI     G_017A, R3                      ; 5FBD   0283 017A
        MVI     G_0350, R4                      ; 5FBF   0284 0350

        JSR     R5,     L_6253                  ; 5FC1   0004 0160 0253

        BNEQ    L_600E                          ; 5FC4   020C 0048

L_5FC6:
        MVII    #$0015, R0                      ; 5FC6   02B8 0015
        CMPI    #$00FF, R3                      ; 5FC8   037B 00FF
        BEQ     L_5FFF                          ; 5FCA   0204 0033

        MVII    #$0016, R0                      ; 5FCC   02B8 0016
        ANDI    #$000F, R3                      ; 5FCE   03BB 000F
        INCR    R3                              ; 5FD0   000B
        ADDR    R7,     R3                      ; 5FD1   00FB
        ADD@    R3,     R7                      ; 5FD2   02DF

        DECR    R1                              ; 5FD3   0011
        DECR    R1                              ; 5FD4   0011
        DECR    R0                              ; 5FD5   0010
        DECR    R0                              ; 5FD6   0010
        DECR    R0                              ; 5FD7   0010
        DECR    R0                              ; 5FD8   0010
        DECR    R0                              ; 5FD9   0010
        DECR    R1                              ; 5FDA   0011
        DECR    R1                              ; 5FDB   0011
        DECR    R1                              ; 5FDC   0011
        DECR    R0                              ; 5FDD   0010
        DECR    R0                              ; 5FDE   0010
        DECR    R0                              ; 5FDF   0010
        DECR    R0                              ; 5FE0   0010
        DECR    R0                              ; 5FE1   0010
        DECR    R1                              ; 5FE2   0011
        INCR    R0                              ; 5FE3   0008
        MOVR    R4,     R3                      ; 5FE4   00A3
        INCR    R3                              ; 5FE5   000B
        MVI@    R3,     R3                      ; 5FE6   029B
        SWAP    R3,     1                       ; 5FE7   0043
        CLRR    R1                              ; 5FE8   01C9
        CMP     G_0342, R3                      ; 5FE9   0343 0342
        BNC     L_5FEE                          ; 5FEB   0209 0001

        INCR    R1                              ; 5FED   0009
L_5FEE:
        MVI     G_017A, R3                      ; 5FEE   0283 017A
        ADDI    #$0004, R3                      ; 5FF0   02FB 0004
        ANDI    #$000F, R3                      ; 5FF2   03BB 000F
        CLRR    R5                              ; 5FF4   01ED
        CMPI    #$0008, R3                      ; 5FF5   037B 0008
        BGT     L_5FFA                          ; 5FF7   020E 0001

        INCR    R5                              ; 5FF9   000D
L_5FFA:
        CMPR    R1,     R5                      ; 5FFA   014D
        BNEQ    L_5FFF                          ; 5FFB   020C 0002

        ADDI    #$0002, R0                      ; 5FFD   02F8 0002
L_5FFF:
        CMPR    R2,     R0                      ; 5FFF   0150
        BEQ     L_5F3B                          ; 6000   0224 00C6

        CMPI    #$0015, R0                      ; 6002   0378 0015
        BEQ     L_602D                          ; 6004   0204 0027

        CMPI    #$0015, R2                      ; 6006   037A 0015
        BEQ     L_602D                          ; 6008   0204 0023

        ADDI    #$0007, R4                      ; 600A   02FC 0007
        MVO@    R0,     R4                      ; 600C   0260
        PULR    R7                              ; 600D   02B7

L_600E:
        MVI     G_0352, R0                      ; 600E   0280 0352
        DECLE   $03B8,  $0080,  $0204,  $000E   ; 6010   03B8 0080 0204 000E
        DECLE   $0004                           ; 6014   0004

        ANDR    R5,     R4                      ; 6015   01AC
        MVO@    R0,     R4                      ; 6016   0260
        BNEQ    L_6022                          ; 6017   020C 0009

        MVI     G_017D, R0                      ; 6019   0280 017D
        ANDI    #$0002, R0                      ; 601B   03B8 0002
        SLR     R0,     1                       ; 601D   0060
        CMP     G_017B, R0                      ; 601E   0340 017B
        BNEQ    L_5FC6                          ; 6020   022C 005B

L_6022:
        MVII    #$0011, R0                      ; 6022   02B8 0011
        CMPI    #$00FF, R3                      ; 6024   037B 00FF
        BEQ     L_602A                          ; 6026   0204 0002

        MVII    #$0012, R0                      ; 6028   02B8 0012
L_602A:
        CMPR    R2,     R0                      ; 602A   0150
        BEQ     L_5F3B                          ; 602B   0224 00F1

L_602D:
        JSR     R5,     L_67E2                  ; 602D   0004 0164 03E2

        PULR    R7                              ; 6030   02B7

        DECLE   $002B,  $002F,  $0033,  $0037   ; 6031   002B 002F 0033 0037
        DECLE   $003B,  $003F,  $0013,  $0027   ; 6035   003B 003F 0013 0027
        DECLE   $0028,  $001F                   ; 6039   0028 001F

        NEGR    R5                              ; 603B   0025
        NEGR    R6                              ; 603C   0026
        NEGR    R3                              ; 603D   0023
        NEGR    R4                              ; 603E   0024
        DECR    R3                              ; 603F   0013
        COMR    R6                              ; 6040   001E
        COMR    R4                              ; 6041   001C
        COMR    R5                              ; 6042   001D
        DECR    R4                              ; 6043   0014
        COMR    R2                              ; 6044   001A
        COMR    R3                              ; 6045   001B
        EIS                                     ; 6046   0002
        DIS                                     ; 6047   0003
        NEGR    R0                              ; 6048   0020
        NEGR    R1                              ; 6049   0021
        NEGR    R2                              ; 604A   0022
        PSHR    R5                              ; 604B   0275
        CMP@    R3,     R0                      ; 604C   0358
        BEQ     L_6060                          ; 604D   0204 0011

        CMPI    #$00FF, R0                      ; 604F   0378 00FF
        BEQ     L_6060                          ; 6051   0204 000D

        MVI     G_0173, R2                      ; 6053   0282 0173
        INCR    R2                              ; 6055   000A
        ADDR    R7,     R2                      ; 6056   00FA
        ADD@    R2,     R7                      ; 6057   02D7

        INCR    R0                              ; 6058   0008
        INCR    R1                              ; 6059   0009
        ADDR    R6,     R1                      ; 605A   00F1
        INCR    R0                              ; 605B   0008
        DECR    R2                              ; 605C   0012
        RLC     R0,     2                       ; 605D   0054
        MOVR    R4,     R5                      ; 605E   00A5
        INCR    R0                              ; 605F   0008
L_6060:
        PULR    R7                              ; 6060   02B7

L_6061:
        TSTR    R0                              ; 6061   0080
        DECLE   $0204,  $0003,  $0004,  $03A0   ; 6062   0204 0003 0004 03A0
        DECLE   $01E5,  $0004,  $0398,  $0235   ; 6066   01E5 0004 0398 0235
        DECLE   $0378,  $000B,  $0204,  $0018   ; 606A   0378 000B 0204 0018
        DECLE   $0010,  $020B,  $0036,  $0378   ; 606E   0010 020B 0036 0378
        DECLE   $0002,  $020E,  $0032,  $0240   ; 6072   0002 020E 0032 0240
        DECLE   $017A,  $0004,  $01A0,  $0203   ; 6076   017A 0004 01A0 0203
        DECLE   $0280,  $017A,  $02B9,  $0250   ; 607A   0280 017A 02B9 0250
        DECLE   $0004                           ; 607E   0004

        ANDR    R4,     R0                      ; 607F   01A0
        MVI     .STIC.X.4,R4                    ; 6080   0284 0004
        CMPR    R4,     R0                      ; 6082   0160
        CMPI    #$0000, R0                      ; 6083   0378 0000
        PULR    R7                              ; 6085   02B7

        DECLE   $0280,  $017A,  $0378,  $00FF   ; 6086   0280 017A 0378 00FF
        DECLE   $0204,  $001B,  $0378,  $0002   ; 608A   0204 001B 0378 0002
        DECLE   $0204,  $0012                   ; 608E   0204 0012

        XORI    #$0001, R0                      ; 6090   03F8 0001
        SWAP    R0,     1                       ; 6092   0040
        SLR     R0,     1                       ; 6093   0060
        MVI     G_0352, R1                      ; 6094   0281 0352
        ANDI    #$007F, R1                      ; 6096   03B9 007F
        XORR    R0,     R1                      ; 6098   01C1
        MVO     R1,     G_0352                  ; 6099   0241 0352

        JSR     R5,     L_6378                  ; 609B   0004 0160 0378
        DECLE   $0007,  $0004,  $03A0,  $0237   ; 609E   0007 0004 03A0 0237
        DECLE   $0004                           ; 60A2   0004

        ANDR    R4,     R4                      ; 60A3   01A4
        SUBR    R5,     R6                      ; 60A4   012E
        B       L_6061                          ; 60A5   0220 0045

L_60A7:
        JSR     R5,     L_6378                  ; 60A7   0004 0160 0378
        DECLE   $0003                           ; 60AA   0003

        PULR    R7                              ; 60AB   02B7

        MVII    #$0004, R3                      ; 60AC   02BB 0004
        MVI     G_0352, R5                      ; 60AE   0285 0352
        ANDI    #$0080, R5                      ; 60B0   03BD 0080
        BEQ     L_60B6                          ; 60B2   0204 0002

        MVII    #$0006, R3                      ; 60B4   02BB 0006
L_60B6:
        CMPI    #$000B, R0                      ; 60B6   0378 000B
        DECLE   $0204,  $0011,  $0010,  $022B   ; 60B8   0204 0011 0010 022B
        DECLE   $0015,  $0158,  $022E,  $0018   ; 60BC   0015 0158 022E 0018
        DECLE   $0240,  $017A,  $0004,  $01A0   ; 60C0   0240 017A 0004 01A0
        DECLE   $0251,  $0280,  $017A,  $02B9   ; 60C4   0251 0280 017A 02B9
        DECLE   $023C,  $0220,  $004C,  $0280   ; 60C8   023C 0220 004C 0280
        DECLE   $017A,  $0378,  $00FF,  $0224   ; 60CC   017A 0378 00FF 0224
        DECLE   $0029,  $0158,  $0204,  $001A   ; 60D0   0029 0158 0204 001A

        MOVR    R7,     R1                      ; 60D4   00B9
        ADDI    #$0024, R1                      ; 60D5   02F9 0024
        CMPI    #$0004, R3                      ; 60D7   037B 0004
        BEQ     L_60DE                          ; 60D9   0204 0003

        MOVR    R7,     R1                      ; 60DB   00B9
L_60DC:
        ADDI    #$0017, R1                      ; 60DC   02F9 0017
L_60DE:
        ADDR    R0,     R1                      ; 60DE   00C1
        MVI@    R1,     R0                      ; 60DF   0288
        MVI     G_0352, R1                      ; 60E0   0281 0352
        ANDI    #$00F0, R1                      ; 60E2   03B9 00F0
        XORR    R0,     R1                      ; 60E4   01C1
        MVO     R1,     G_0352                  ; 60E5   0241 0352

        JSR     R5,     L_6378                  ; 60E7   0004 0160 0378
        DECLE   $0008,  $0004,  $03A0,  $0264   ; 60EA   0008 0004 03A0 0264
        DECLE   $0004,  $01A4,  $012E,  $0220   ; 60EE   0004 01A4 012E 0220
        DECLE   $0053,  $0000,  $0002,  $0001   ; 60F2   0053 0000 0002 0001
        DECLE   $0006,  $0009,  $0003,  $0000   ; 60F6   0006 0009 0003 0000
        DECLE   $0002,  $0001,  $0003,  $0241   ; 60FA   0002 0001 0003 0241
        DECLE   $0179,  $02F9,  $018A,  $0378   ; 60FE   0179 02F9 018A 0378
        DECLE   $000B,  $0204,  $0021,  $028A   ; 6102   000B 0204 0021 028A
        DECLE   $03BA,  $00F0,  $0224,  $00A9   ; 6106   03BA 00F0 0224 00A9
        DECLE   $0010,  $022B,  $0065,  $0378   ; 610A   0010 022B 0065 0378
        DECLE   $0005,  $022E,  $0069,  $0082   ; 610E   0005 022E 0069 0082
        DECLE   $03FA,  $00F0,  $024A,  $0004   ; 6112   03FA 00F0 024A 0004
        DECLE   $01A0,  $02C3,  $0339,  $0078   ; 6116   01A0 02C3 0339 0078
        DECLE   $02BA,  $0001,  $0004           ; 611A   02BA 0001 0004

        ANDR    R4,     R0                      ; 611D   01A0
        MVI     .BTAB.B8,R6                     ; 611E   0286 02B8
        INCR    R1                              ; 6120   0009
        ADD     G_0179, R0                      ; 6121   02C0 0179
        J       L_637A                          ; 6123   0004 0360 037A

        MVI@    R1,     R0                      ; 6126   0288
        CMPI    #$00FF, R0                      ; 6127   0378 00FF
        BEQ     L_60A7                          ; 6129   0224 0083

        ANDI    #$000F, R0                      ; 612B   03B8 000F
        MVO@    R0,     R1                      ; 612D   0248
        MVII    #$0007, R0                      ; 612E   02B8 0007
        ADD     G_0179, R0                      ; 6130   02C0 0179

        JSR     R5,     L_6379                  ; 6132   0004 0160 0379

        MVI     G_018A, R0                      ; 6135   0280 018A
        ANDI    #$00F0, R0                      ; 6137   03B8 00F0
        BNEQ    L_6060                          ; 6139   022C 00DA

        MVI     G_018B, R0                      ; 613B   0280 018B
        ANDI    #$00F0, R0                      ; 613D   03B8 00F0
        BNEQ    L_6060                          ; 613F   022C 00E0
        J       L_5C12                          ; 6141   0004 035C 0012

L_6144:
        PSHR    R5                              ; 6144   0275
        MVI     G_0350, R4                      ; 6145   0284 0350
        B       L_6182                          ; 6147   0200 0039

        MVII    #$0180, R2                      ; 6149   02BA 0180
        MVI     G_0352, R4                      ; 614B   0284 0352
        ANDI    #$000C, R4                      ; 614D   03BC 000C
        BEQ     L_6159                          ; 614F   0204 0008

        MVO     R1,     G_017B                  ; 6151   0241 017B
        CLRR    R1                              ; 6153   01C9
        ANDI    #$0004, R4                      ; 6154   03BC 0004
        BNEQ    L_6159                          ; 6156   020C 0001

        INCR    R1                              ; 6158   0009
L_6159:
        MVO     R1,     G_0179                  ; 6159   0241 0179
        DECLE   $0004                           ; 615B   0004

        ANDR    R5,     R4                      ; 615C   01AC
        MVO@    R0,     R1                      ; 615D   0248
        BEQ     L_6060                          ; 615E   0224 00FF

        MVII    #$018E, R4                      ; 6160   02BC 018E
        TSTR    R1                              ; 6162   0089
        BEQ     L_6167                          ; 6163   0204 0002

        MVII    #$01BE, R4                      ; 6165   02BC 01BE
L_6167:
        MVO     R4,     G_0350                  ; 6167   0244 0350
        ADDR    R1,     R2                      ; 6169   00CA
        CMPI    #$000A, R0                      ; 616A   0378 000A
        BGE     L_620A                          ; 616C   020D 009C

        TSTR    R0                              ; 616E   0080
        BNEQ    L_6175                          ; 616F   020C 0004

        JSR     R5,     L_6D60                  ; 6171   0004 016C 0160

        PULR    R7                              ; 6174   02B7

L_6175:
        MVI     G_0352, R3                      ; 6175   0283 0352
        ANDI    #$000C, R3                      ; 6177   03BB 000C
        BEQ     L_617E                          ; 6179   0204 0003

        MVI     G_017B, R3                      ; 617B   0283 017B
        INCR    R7                              ; 617D   000F

L_617E:
        MVI@    R2,     R3                      ; 617E   0293
L_617F:
        SLL     R3,     2                       ; 617F   004F
        SLL     R3,     1                       ; 6180   004B
        ADDR    R3,     R4                      ; 6181   00DC
L_6182:
        MVI     G_034F, R5                      ; 6182   0285 034F
        MOVR    R5,     R3                      ; 6184   00AB
        ANDI    #$0020, R5                      ; 6185   03BD 0020
        BEQ     L_6206                          ; 6187   0204 007D

        JSR     R5,     L_6EDE                  ; 6189   0004 016C 02DE
        DECLE   $020C,  $0078,  $0004           ; 618C   020C 0078 0004

        ANDR    R5,     R4                      ; 618F   01AC
        MVO@    R0,     R4                      ; 6190   0260
        BNEQ    L_619C                          ; 6191   020C 0009

        MVI     G_017D, R3                      ; 6193   0283 017D
        ANDI    #$0002, R3                      ; 6195   03BB 0002
        SLR     R3,     1                       ; 6197   0063
        CMP     G_017B, R3                      ; 6198   0343 017B
        BNEQ    L_6060                          ; 619A   022C 013B

L_619C:
        MVI     G_034F, R3                      ; 619C   0283 034F
        ANDI    #$0003, R3                      ; 619E   03BB 0003
        INCR    R3                              ; 61A0   000B
        ADDR    R7,     R3                      ; 61A1   00FB
        ADD@    R3,     R7                      ; 61A2   02DF

        DECLE   $0053,  $0004,  $0054,  $0053   ; 61A3   0053 0004 0054 0053

        JSR     R5,     L_6D56                  ; 61A7   0004 016C 0156
        JSR     R5,     L_6D81                  ; 61AA   0004 016C 0181
        DECLE   $0280,  $0352,  $03B8,  $0080   ; 61AD   0280 0352 03B8 0080
        DECLE   $0204,  $0012,  $0004           ; 61B1   0204 0012 0004

        ANDR    R5,     R4                      ; 61B4   01AC
        MVO@    R0,     R4                      ; 61B5   0260
        BEQ     L_61DE                          ; 61B6   0204 0026

        JSR     R5,     L_5447                  ; 61B8   0004 0154 0047
        DECLE   $0084                           ; 61BB   0084

        MOVR    R4,     R1                      ; 61BC   00A1
        MVI@    R1,     R0                      ; 61BD   0288
        ANDI    #$00DF, R0                      ; 61BE   03B8 00DF
        XORI    #$0020, R0                      ; 61C0   03F8 0020
        MVO@    R0,     R1                      ; 61C2   0248
        B       L_61DE                          ; 61C3   0200 0019

        MVII    #$0002, R5                      ; 61C5   02BD 0002
        MVII    #$017E, R2                      ; 61C7   02BA 017E
        ADD     G_0179, R2                      ; 61C9   02C2 0179
        MVO@    R5,     R2                      ; 61CB   0255
        PSHR    R4                              ; 61CC   0274
        MVII    #$018E, R4                      ; 61CD   02BC 018E
        MVI     G_0179, R0                      ; 61CF   0280 0179
        TSTR    R0                              ; 61D1   0080
        BEQ     L_61D6                          ; 61D2   0204 0002

        MVII    #$01BE, R4                      ; 61D4   02BC 01BE

L_61D6:
        JSR     R5,     L_5412                  ; 61D6   0004 0154 0012
        JSR     R5,     L_5447                  ; 61D9   0004 0154 0047
        DECLE   $0018                           ; 61DC   0018

        PULR    R4                              ; 61DD   02B4
L_61DE:
        MVII    #$0035, R0                      ; 61DE   02B8 0035

        JSR     R5,     X_RAND2                 ; 61E0   0004 0114 029E

        ADDI    #$0062, R0                      ; 61E3   02F8 0062
        MVO     R0,     G_0347                  ; 61E5   0240 0347

        JSR     R5,     L_6D4B                  ; 61E7   0004 016C 014B
        DECLE   $0100                           ; 61EA   0100

        MVII    #$0001, R0                      ; 61EB   02B8 0001
        MVO     R0,     G_0353                  ; 61ED   0240 0353
        MVO     R0,     G_0354                  ; 61EF   0240 0354
        MVII    #$0013, R0                      ; 61F1   02B8 0013

L_61F3:
        JSR     R5,     L_67E2                  ; 61F3   0004 0164 03E2

L_61F6:
        PULR    R7                              ; 61F6   02B7

        JSR     R5,     L_6D5A                  ; 61F7   0004 016C 015A

        MOVR    R4,     R1                      ; 61FA   00A1
        ADDI    #$0007, R1                      ; 61FB   02F9 0007
        MVI@    R1,     R0                      ; 61FD   0288
        CMPI    #$0013, R0                      ; 61FE   0378 0013
        BNEQ    L_61F6                          ; 6200   022C 000B

        MVII    #$001E, R0                      ; 6202   02B8 001E
        B       L_61F3                          ; 6204   0220 0012

L_6206:
        JSR     R5,     L_6D5A                  ; 6206   0004 016C 015A

        PULR    R7                              ; 6209   02B7

L_620A:
        MVI     G_0352, R5                      ; 620A   0285 0352
        ANDI    #$000C, R5                      ; 620C   03BD 000C
        BNEQ    L_6060                          ; 620E   022C 01AF

        JSR     R5,     L_6253                  ; 6210   0004 0160 0253

        BNEQ    L_6060                          ; 6213   022C 01B4

        MVII    #$0006, R3                      ; 6215   02BB 0006
        CLRR    R5                              ; 6217   01ED
L_6218:
        MVI@    R4,     R2                      ; 6218   02A2
        ANDI    #$0007, R2                      ; 6219   03BA 0007
        BEQ     L_621E                          ; 621B   0204 0001

        INCR    R5                              ; 621D   000D
L_621E:
        ADDI    #$0007, R4                      ; 621E   02FC 0007
        DECR    R3                              ; 6220   0013
        BNEQ    L_6218                          ; 6221   022C 000A

        CMPI    #$0003, R5                      ; 6223   037D 0003
        BLT     L_6228                          ; 6225   0205 0001
        PULR    R7                              ; 6227   02B7

L_6228:
        SUBI    #$000A, R0                      ; 6228   0338 000A
        BNEQ    L_622D                          ; 622A   020C 0001

        DECR    R0                              ; 622C   0010
L_622D:
        MVI     G_0350, R4                      ; 622D   0284 0350

        JSR     R5,     L_5B16                  ; 622F   0004 0158 0316

        MVII    #$0180, R1                      ; 6232   02B9 0180
        ADD     G_0179, R1                      ; 6234   02C1 0179
        MVI     G_0352, R5                      ; 6236   0285 0352
        ANDI    #$0080, R5                      ; 6238   03BD 0080
        BEQ     L_6241                          ; 623A   0204 0005

        MVI@    R1,     R0                      ; 623C   0288
        XORI    #$0001, R0                      ; 623D   03F8 0001
        B       L_624B                          ; 623F   0200 000A

L_6241:
        ADD@    R1,     R0                      ; 6241   02C8
        BPL     L_6246                          ; 6242   0203 0002

        MVII    #$0005, R0                      ; 6244   02B8 0005
L_6246:
        CMPI    #$0005, R0                      ; 6246   0378 0005
        BLE     L_624B                          ; 6248   0206 0001

        CLRR    R0                              ; 624A   01C0
L_624B:
        MVO@    R0,     R1                      ; 624B   0248
        MVI     G_0350, R4                      ; 624C   0284 0350

        JSR     R5,     L_5B46                  ; 624E   0004 0158 0346
        DECLE   $0220,  $0133                   ; 6251   0220 0133
L_6253:
        PSHR    R5                              ; 6253   0275
        PSHR    R2                              ; 6254   0272
        MVI     G_034F, R2                      ; 6255   0282 034F
        MOVR    R2,     R5                      ; 6257   0095
        ANDI    #$0020, R5                      ; 6258   03BD 0020
        BEQ     L_626A                          ; 625A   0204 000E

        MOVR    R2,     R5                      ; 625C   0095
        ANDI    #$0004, R2                      ; 625D   03BA 0004
        SLR     R2,     2                       ; 625F   0066
        CMP     G_0179, R2                      ; 6260   0342 0179
        BNEQ    L_626A                          ; 6262   020C 0006

        PULR    R2                              ; 6264   02B2
        ANDI    #$0003, R5                      ; 6265   03BD 0003
        CMPI    #$0003, R5                      ; 6267   037D 0003
        PULR    R7                              ; 6269   02B7

L_626A:
        PULR    R2                              ; 626A   02B2
        CMPR    R6,     R6                      ; 626B   0176
        PULR    R7                              ; 626C   02B7

        PSHR    R5                              ; 626D   0275
        MVI     G_0173, R2                      ; 626E   0282 0173
        INCR    R2                              ; 6270   000A
        ADDR    R7,     R2                      ; 6271   00FA
        ADD@    R2,     R7                      ; 6272   02D7

        INCR    R0                              ; 6273   0008
        INCR    R1                              ; 6274   0009
        COMR    R0                              ; 6275   0018
        INCR    R1                              ; 6276   0009
        INCR    R0                              ; 6277   0008
        INCR    R0                              ; 6278   0008
        INCR    R0                              ; 6279   0008
        INCR    R0                              ; 627A   0008
L_627B:
        PULR    R7                              ; 627B   02B7

        DECLE   $0358,  $0224,  $0003,  $0378   ; 627C   0358 0224 0003 0378
        DECLE   $00FF,  $0224,  $0007,  $0004   ; 6280   00FF 0224 0007 0004

        AND@    R4,     R0                      ; 6284   03A0
        XORR    R4,     R5                      ; 6285   01E5
L_6286:
        PSHR    R5                              ; 6286   0275
        MVI     G_0350, R4                      ; 6287   0284 0350
        B       L_62C0                          ; 6289   0200 0035

        CMP@    R3,     R0                      ; 628B   0358
        BEQ     L_627B                          ; 628C   0224 0012

        CMPI    #$00FF, R0                      ; 628E   0378 00FF
        BEQ     L_627B                          ; 6290   0224 0016

        MVII    #$0180, R2                      ; 6292   02BA 0180
        MVI     G_0352, R4                      ; 6294   0284 0352
        ANDI    #$000C, R4                      ; 6296   03BC 000C
        BEQ     L_62A2                          ; 6298   0204 0008

        MVO     R1,     G_017B                  ; 629A   0241 017B
        CLRR    R1                              ; 629C   01C9
        ANDI    #$0004, R4                      ; 629D   03BC 0004
        BNEQ    L_62A2                          ; 629F   020C 0001

        INCR    R1                              ; 62A1   0009
L_62A2:
        MVO     R1,     G_0179                  ; 62A2   0241 0179
        DECLE   $0004                           ; 62A4   0004

        ANDR    R5,     R4                      ; 62A5   01AC
        MVO@    R0,     R1                      ; 62A6   0248
        BEQ     L_627B                          ; 62A7   0224 002D

        MVII    #$018E, R4                      ; 62A9   02BC 018E
        TSTR    R1                              ; 62AB   0089
        BEQ     L_62B0                          ; 62AC   0204 0002

        MVII    #$01BE, R4                      ; 62AE   02BC 01BE
L_62B0:
        ADDR    R1,     R2                      ; 62B0   00CA
        MVI     G_0352, R3                      ; 62B1   0283 0352
        ANDI    #$000C, R3                      ; 62B3   03BB 000C
        BEQ     L_62BA                          ; 62B5   0204 0003

        MVI     G_017B, R2                      ; 62B7   0282 017B
        INCR    R7                              ; 62B9   000F

L_62BA:
        MVI@    R2,     R2                      ; 62BA   0292
L_62BB:
        SLL     R2,     2                       ; 62BB   004E
        SLL     R2,     1                       ; 62BC   004A
        ADDR    R2,     R4                      ; 62BD   00D4
        MVO     R4,     G_0350                  ; 62BE   0244 0350
L_62C0:
        MVO     R0,     G_017A                  ; 62C0   0240 017A
        MVI@    R4,     R3                      ; 62C2   02A3
        ANDI    #$0007, R3                      ; 62C3   03BB 0007
        DECR    R3                              ; 62C5   0013
        BPL     L_62C9                          ; 62C6   0203 0001
        PULR    R7                              ; 62C8   02B7

L_62C9:
        SLL     R3,     1                       ; 62C9   004B
        PSHR    R3                              ; 62CA   0273
        SLL     R3,     2                       ; 62CB   004F
        ADD@    R6,     R3                      ; 62CC   02F3
        ADDI    #$0107, R3                      ; 62CD   02FB 0107
        ADDI    #$0002, R3                      ; 62CF   02FB 0002
        ADDI    #$0006, R4                      ; 62D1   02FC 0006
        MVI@    R4,     R0                      ; 62D3   02A0

        JSR     R5,     L_5944                  ; 62D4   0004 0158 0144
        BIDECLE $6375                           ; 62D7   0075 0063

        BEQ     L_6363                          ; 62D9   0204 0088

        JSR     R5,     L_5944                  ; 62DB   0004 0158 0144
        BIDECLE $636F                           ; 62DE   006F 0063

        BNEQ    L_627B                          ; 62E0   022C 0066

        MVI     G_017A, R1                      ; 62E2   0281 017A
        CMPI    #$00FE, R1                      ; 62E4   0379 00FE
        BEQ     L_6337                          ; 62E6   0204 004F

        CMPI    #$0015, R0                      ; 62E8   0378 0015
        BEQ     L_6337                          ; 62EA   0204 004B

        JSR     R5,     L_6ECA                  ; 62EC   0004 016C 02CA

        BNEQ    L_6337                          ; 62EF   020C 0046

        MOVR    R3,     R5                      ; 62F1   009D
        SDBD                                    ; 62F2   0001
        MVI@    R5,     R0                      ; 62F3   02A8
        SDBD                                    ; 62F4   0001
        MVI@    R5,     R1                      ; 62F5   02A9
        SLL     R0,     1                       ; 62F6   0048
        SLL     R1,     1                       ; 62F7   0049
        MOVR    R3,     R5                      ; 62F8   009D
        MVO@    R0,     R5                      ; 62F9   0268
        SWAP    R0,     1                       ; 62FA   0040
        MVO@    R0,     R5                      ; 62FB   0268
        NOP                                     ; 62FC   0034
        MVO@    R1,     R5                      ; 62FD   0269
        SWAP    R1,     1                       ; 62FE   0041
        MVO@    R1,     R5                      ; 62FF   0269
        MVII    #$005E, R3                      ; 6300   02BB 005E
        ADDI    #$0002, R5                      ; 6302   02FD 0002
        MVO@    R3,     R5                      ; 6304   026B
        SWAP    R3,     1                       ; 6305   0043
        MVO@    R3,     R5                      ; 6306   026B
        SWAP    R0,     1                       ; 6307   0040
        SWAP    R1,     1                       ; 6308   0041

        JSR     R5,     .EXEC.A2F               ; 6309   0004 0118 022F

        MVI     G_0350, R2                      ; 630C   0282 0350
        MVI@    R2,     R3                      ; 630E   0293
        ANDI    #$00E7, R3                      ; 630F   03BB 00E7
        INCR    R1                              ; 6311   0009
        ADDR    R7,     R1                      ; 6312   00F9
        ADD@    R1,     R7                      ; 6313   02CF

        DECR    R2                              ; 6314   0012
        DECR    R2                              ; 6315   0012
        COMR    R0                              ; 6316   0018
        COMR    R0                              ; 6317   0018
        COMR    R0                              ; 6318   0018
        DECR    R6                              ; 6319   0016
        DECR    R6                              ; 631A   0016
        DECR    R0                              ; 631B   0010
        DECR    R0                              ; 631C   0010
        DECR    R0                              ; 631D   0010
        COMR    R4                              ; 631E   001C
        COMR    R4                              ; 631F   001C
        COMR    R4                              ; 6320   001C
        COMR    R6                              ; 6321   001E
        COMR    R6                              ; 6322   001E
        DECR    R2                              ; 6323   0012
        XORI    #$0008, R3                      ; 6324   03FB 0008
        MVII    #$0020, R0                      ; 6326   02B8 0020
        B       L_6334                          ; 6328   0200 000A

        XORI    #$0008, R3                      ; 632A   03FB 0008
        MVII    #$0021, R0                      ; 632C   02B8 0021
        B       L_6334                          ; 632E   0200 0004

        XORI    #$0008, R3                      ; 6330   03FB 0008
        MVII    #$0022, R0                      ; 6332   02B8 0022
L_6334:
        MVO@    R3,     R2                      ; 6334   0253
        B       L_6356                          ; 6335   0200 001F

L_6337:
        MOVR    R3,     R5                      ; 6337   009D
        SDBD                                    ; 6338   0001
        MVI@    R5,     R0                      ; 6339   02A8
        SDBD                                    ; 633A   0001
        MVI@    R5,     R2                      ; 633B   02AA
        SAR     R0,     2                       ; 633C   006C
        SAR     R2,     2                       ; 633D   006E
        MOVR    R3,     R5                      ; 633E   009D
        MVO@    R0,     R5                      ; 633F   0268
        SWAP    R0,     1                       ; 6340   0040
        MVO@    R0,     R5                      ; 6341   0268
        NOP                                     ; 6342   0034
        MVO@    R2,     R5                      ; 6343   026A
        SWAP    R2,     1                       ; 6344   0042
        MVO@    R2,     R5                      ; 6345   026A
        MVII    #$00FA, R0                      ; 6346   02B8 00FA
        ADDI    #$0002, R5                      ; 6348   02FD 0002
        MVO@    R0,     R5                      ; 634A   0268
        SWAP    R0,     1                       ; 634B   0040
        MVO@    R0,     R5                      ; 634C   0268
        MVII    #$001F, R0                      ; 634D   02B8 001F

        JSR     R5,     L_6EDE                  ; 634F   0004 016C 02DE

        BNEQ    L_6356                          ; 6352   020C 0002

        MVII    #$001C, R0                      ; 6354   02B8 001C
L_6356:
        MVI     G_0350, R4                      ; 6356   0284 0350

        JSR     R5,     L_67E2                  ; 6358   0004 0164 03E2

        MVI@    R4,     R0                      ; 635B   02A0
        ANDI    #$00BF, R0                      ; 635C   03B8 00BF
        XORI    #$0040, R0                      ; 635E   03F8 0040
        DECR    R4                              ; 6360   0014
        MVO@    R0,     R4                      ; 6361   0260
        PULR    R7                              ; 6362   02B7

L_6363:
        MVII    #$001C, R0                      ; 6363   02B8 001C
        MVI     G_017A, R3                      ; 6365   0283 017A
        CMPI    #$00FE, R3                      ; 6367   037B 00FE
        BEQ     L_6356                          ; 6369   0224 0014

        MVII    #$001D, R0                      ; 636B   02B8 001D
        B       L_6356                          ; 636D   0220 0018

        DECLE   $0005                           ; 636F   0005

        DECR    R5                              ; 6370   0015
        DECR    R6                              ; 6371   0016
L_6372:
        DECR    R7                              ; 6372   0017

        COMR    R0                              ; 6373   0018
        COMR    R1                              ; 6374   0019
        EIS                                     ; 6375   0002
        COMR    R4                              ; 6376   001C
        COMR    R5                              ; 6377   001D
L_6378:
        MVI@    R5,     R0                      ; 6378   02A8
L_6379:
        PSHR    R5                              ; 6379   0275
L_637A:
        MVII    #$0001, R5                      ; 637A   02BD 0001
        MVO     R5,     G_0147                  ; 637C   0245 0147
        MOVR    R7,     R4                      ; 637E   00BC
        ADDI    #$000B, R4                      ; 637F   02FC 000B
        ADDR    R0,     R4                      ; 6381   00C4
        ADDR    R0,     R4                      ; 6382   00C4
        ADDR    R0,     R4                      ; 6383   00C4
        MVI@    R4,     R3                      ; 6384   02A3
        SDBD                                    ; 6385   0001
        MVI@    R4,     R5                      ; 6386   02A5
        J       .EXEC.BBF                       ; 6387   0004 0318 03BF

        DECLE   $00BE,  $00C3,  $0063,  $00BE   ; 638A   00BE 00C3 0063 00BE
        DECLE   $00D9,  $001E,  $00BE,  $00D9   ; 638E   00D9 001E 00BE 00D9
        DECLE   $001E,  $00C8,  $00E4,  $0063   ; 6392   001E 00C8 00E4 0063
        DECLE   $00C8,  $001B,  $001F           ; 6396   00C8 001B 001F

        ADDR    R1,     R0                      ; 6399   00C8
        INCR    R2                              ; 639A   000A
        SLR     R0,     2                       ; 639B   0064
        ADDR    R1,     R0                      ; 639C   00C8
        SLR     R3,     1                       ; 639D   0063
        SLR     R0,     2                       ; 639E   0064
        MOVR    R7,     R6                      ; 639F   00BE
        ADDR    R2,     R4                      ; 63A0   00D4
        SLR     R3,     1                       ; 63A1   0063
        MOVR    R7,     R6                      ; 63A2   00BE
        ADDR    R3,     R0                      ; 63A3   00D8
        SLR     R3,     1                       ; 63A4   0063
        ADDR    R1,     R0                      ; 63A5   00C8
        ADDR    R3,     R4                      ; 63A6   00DC
        SLR     R3,     1                       ; 63A7   0063
        ADDR    R1,     R0                      ; 63A8   00C8
        ADDR    R4,     R0                      ; 63A9   00E0
        SLR     R3,     1                       ; 63AA   0063
        MOVR    R7,     R6                      ; 63AB   00BE
        SARC    R1,     1                       ; 63AC   0079
        SLR     R0,     2                       ; 63AD   0064
        MOVR    R7,     R6                      ; 63AE   00BE
        MOVR    R0,     R5                      ; 63AF   0085
        SLR     R0,     2                       ; 63B0   0064
        MOVR    R7,     R6                      ; 63B1   00BE
        ADDR    R3,     R1                      ; 63B2   00D9
        COMR    R6                              ; 63B3   001E
        MOVR    R7,     R6                      ; 63B4   00BE
        ADDR    R4,     R4                      ; 63B5   00E4
        SLR     R3,     1                       ; 63B6   0063
        MOVR    R2,     R6                      ; 63B7   0096
        ADCR    R1                              ; 63B8   0029
        SLR     R0,     2                       ; 63B9   0064
        ADDR    R2,     R2                      ; 63BA   00D2
        ADDR    R7,     R2                      ; 63BB   00FA
        SLR     R3,     1                       ; 63BC   0063
        SLR     R0,     2                       ; 63BD   0064
        INCR    R1                              ; 63BE   0009
        SLR     R0,     2                       ; 63BF   0064
        MOVR    R7,     R6                      ; 63C0   00BE
        SAR     R3,     1                       ; 63C1   006B
        SLR     R0,     2                       ; 63C2   0064
        SUB     G_008F, R0                      ; 63C3   0300 008F
        SAR     R3,     1                       ; 63C5   006B
        ADD@    R1,     R7                      ; 63C6   02CF

        DECLE   $0389,  $0040,  $00F0,  $0048   ; 63C7   0389 0040 00F0 0048
        DECLE   $0072,  $0044,  $0035           ; 63CB   0072 0044 0035

        SLLC    R0,     2                       ; 63CE   005C
        CMP@    R6,     R0                      ; 63CF   0370
        INCR    R3                              ; 63D0   000B
        MOVR    R1,     R7                      ; 63D1   008F

        GSWD    R1                              ; 63D2   0031
        ADD@    R1,     R7                      ; 63D3   02CF

        SUB     G_00BE, R0                      ; 63D4   0300 00BE
        SAR     R3,     1                       ; 63D6   006B
        ADD@    R1,     R7                      ; 63D7   02CF

        SUB     G_017C, R0                      ; 63D8   0300 017C
        SAR     R3,     1                       ; 63DA   006B
        ADD@    R1,     R7                      ; 63DB   02CF

        SUB     G_007F, R0                      ; 63DC   0300 007F
        SAR     R3,     1                       ; 63DE   006B
        ADD@    R1,     R7                      ; 63DF   02CF

        SUB     .PSG1.rgt_hand,R0               ; 63E0   0300 00FE
        SAR     R3,     1                       ; 63E2   006B
        ADD@    R1,     R7                      ; 63E3   02CF

        DECLE   $03C9,  $0300,  $0080,  $0308   ; 63E4   03C9 0300 0080 0308
        DECLE   $0082,  $019D,  $0305,  $0325   ; 63E8   0082 019D 0305 0325
        DECLE   $006B,  $0005                   ; 63EC   006B 0005

        NEGR    R5                              ; 63EE   0025
        SWAP    R3,     1                       ; 63EF   0043
        XOR@    R4,     R4                      ; 63F0   03E4
        ADD@    R1,     R7                      ; 63F1   02CF

        DECLE   $0379,  $03CD,  $00B7           ; 63F2   0379 03CD 00B7

        INCR    R4                              ; 63F5   000C
        ANDR    R2,     R0                      ; 63F6   0190
        INCR    R3                              ; 63F7   000B
        SUBR    R5,     R3                      ; 63F8   012B
        ADD@    R1,     R7                      ; 63F9   02CF

        DECLE   $03E9,  $00B7                   ; 63FA   03E9 00B7

        SLL     R3,     2                       ; 63FC   004F
        INCR    R2                              ; 63FD   000A
        RSWD    R4                              ; 63FE   003C
        AND@    R4,     R0                      ; 63FF   03A0
        INCR    R3                              ; 6400   000B
        SWAP    R0,     1                       ; 6401   0040
        SUBR    R5,     R4                      ; 6402   012C
        SAR     R3,     1                       ; 6403   006B
        SWAP    R0,     1                       ; 6404   0040
        MOVR    R2,     R6                      ; 6405   0096
        SWAP    R3,     1                       ; 6406   0043
        XOR@    R4,     R4                      ; 6407   03E4
        ADD@    R1,     R7                      ; 6408   02CF
        ADD@    R1,     R7                      ; 6409   02CF

        DECLE   $0048,  $0328,  $001B,  $0040   ; 640A   0048 0328 001B 0040
        DECLE   $0340,  $03C9,  $000C,  $0108   ; 640E   0340 03C9 000C 0108
        DECLE   $000B,  $03CF,  $0389,  $006C   ; 6412   000B 03CF 0389 006C
        DECLE   $0000,  $0050,  $0100,  $0058   ; 6416   0000 0050 0100 0058
        DECLE   $010C,  $005B,  $0044,  $0100   ; 641A   010C 005B 0044 0100
        DECLE   $0001,  $03A0,  $0001,  $03B2   ; 641E   0001 03A0 0001 03B2
        DECLE   $0001,  $03F1,  $000B,  $02EB   ; 6422   0001 03F1 000B 02EB
        DECLE   $0001,  $0003,  $03CF,  $0379   ; 6426   0001 0003 03CF 0379
        DECLE   $03CD,  $000C,  $012C,  $00B7   ; 642A   03CD 000C 012C 00B7

        INCR    R3                              ; 642E   000B
        MVO@    R3,     R5                      ; 642F   026B
        ADD@    R1,     R7                      ; 6430   02CF

        DECLE   $0369,  $01ED,  $000F,  $03FE   ; 6431   0369 01ED 000F 03FE
        DECLE   $0050,  $00B0,  $0001           ; 6435   0050 00B0 0001

        TSTR    R0                              ; 6438   0080
        COMR    R4                              ; 6439   001C
        ADDR    R0,     R4                      ; 643A   00C4
        INCR    R3                              ; 643B   000B
        MOVR    R1,     R7                      ; 643C   008F

        RSWD    R3                              ; 643D   003B
        ADD@    R1,     R7                      ; 643E   02CF

        DECLE   $0369,  $0013,  $0014,  $01ED   ; 643F   0369 0013 0014 01ED
        DECLE   $000F,  $03FE,  $0050,  $00B0   ; 6443   000F 03FE 0050 00B0
        DECLE   $015B,  $0001                   ; 6447   015B 0001

        TSTR    R0                              ; 6449   0080
        COMR    R4                              ; 644A   001C
        ADDR    R0,     R4                      ; 644B   00C4
        INCR    R3                              ; 644C   000B
L_644D:
        DECR    R7                              ; 644D   0017

        NEGR    R5                              ; 644E   0025
        DIS                                     ; 644F   0003
        XOR     G_008F, R4                      ; 6450   03C4 008F
        RSWD    R3                              ; 6452   003B
        ADD@    R1,     R7                      ; 6453   02CF

        DECLE   $0279,  $01B7                   ; 6454   0279 01B7

        RSWD    R4                              ; 6456   003C
        ADDR    R4,     R4                      ; 6457   00E4
        GSWD    R3                              ; 6458   0033
        SWAP    R0,     1                       ; 6459   0040
        SUBR    R1,     R5                      ; 645A   010D
        ADD     .STIC.Y.7,R7                    ; 645B   02C7 000F

        INCR    R0                              ; 645D   0008
L_645E:
        DECR    R7                              ; 645E   0017

        GSWD    R2                              ; 645F   0032
        DIS                                     ; 6460   0003
        XOR@    R4,     R0                      ; 6461   03E0
        ADD@    R1,     R7                      ; 6462   02CF

        CMPI    #$00B7, R1                      ; 6463   0379 00B7
        INCR    R4                              ; 6465   000C
        BLE     L_60DC                          ; 6466   0226 038B
        MOVR    R2,     R7                      ; 6468   0097

        MOVR    R4,     R1                      ; 6469   00A1
        ADD@    R1,     R7                      ; 646A   02CF

        DECLE   $0079,  $03B7,  $03CD,  $000C   ; 646B   0079 03B7 03CD 000C
        DECLE   $036B,  $000B,  $006B,  $014D   ; 646F   036B 000B 006B 014D
        DECLE   $01C7,  $006B,  $00B7           ; 6473   01C7 006B 00B7

        MOVR    R1,     R7                      ; 6476   008F

        DECR    R3                              ; 6477   0013
        ADD@    R1,     R7                      ; 6478   02CF

        XOR@    R1,     R1                      ; 6479   03C9
        SUB     G_0140, R0                      ; 647A   0300 0140
        ADD@    R1,     R0                      ; 647C   02C8
        MOVR    R4,     R0                      ; 647D   00A0
        ADDR    R5,     R3                      ; 647E   00EB
        SUB     .PSG1.chn_a_lo,R0               ; 647F   0300 00F0
        ADD@    R1,     R0                      ; 6481   02C8
        SARC    R0,     1                       ; 6482   0078
        ADDR    R5,     R3                      ; 6483   00EB
        ADD@    R1,     R7                      ; 6484   02CF

        XOR@    R1,     R1                      ; 6485   03C9
        SUB     .PSG1.rgt_hand,R0               ; 6486   0300 00FE
        ADD@    R1,     R0                      ; 6488   02C8
        SARC    R3,     2                       ; 6489   007F
        ADDR    R5,     R3                      ; 648A   00EB
        SUB     G_0154, R0                      ; 648B   0300 0154
        ADD@    R1,     R0                      ; 648D   02C8
        MOVR    R5,     R2                      ; 648E   00AA
        ADDR    R5,     R3                      ; 648F   00EB
        ADD@    R1,     R7                      ; 6490   02CF

        DECLE   $01C0,  $0240,  $017D,  $0280   ; 6491   01C0 0240 017D 0280
        DECLE   $0176,  $03B8,  $00C0,  $0240   ; 6495   0176 03B8 00C0 0240
        DECLE   $0176,  $0280,  $0177,  $03B8   ; 6499   0176 0280 0177 03B8
        DECLE   $00C0,  $0240,  $0177,  $0004   ; 649D   00C0 0240 0177 0004

        ANDR    R3,     R4                      ; 64A1   019C
        CMPR    R1,     R7                      ; 64A2   014F

        JSR     R5,     L_6378                  ; 64A3   0004 0160 0378
        DECLE   $0004                           ; 64A6   0004

        JSR     R5,     L_5124                  ; 64A7   0004 0150 0124
        DECLE   $0014                           ; 64AA   0014

        JSR     R5,     L_5BB4                  ; 64AB   0004 0158 03B4

        PULR    R7                              ; 64AE   02B7

        JSR     R5,     L_5124                  ; 64AF   0004 0150 0124
        DECLE   $0014                           ; 64B2   0014

        JSR     R5,     L_53FF                  ; 64B3   0004 0150 03FF
        JSR     R5,     L_67EE                  ; 64B6   0004 0164 03EE
        DECLE   $0004                           ; 64B9   0004

        JSR     R5,     L_542A                  ; 64BA   0004 0154 002A
        DECLE   $0030                           ; 64BD   0030

        MVII    #$018E, R4                      ; 64BE   02BC 018E

        JSR     R5,     L_5C64                  ; 64C0   0004 015C 0064

        MVII    #$01BE, R4                      ; 64C3   02BC 01BE

        JSR     R5,     L_5C64                  ; 64C5   0004 015C 0064

        PULR    R7                              ; 64C8   02B7

        JSR     R5,     L_5124                  ; 64C9   0004 0150 0124
        DECLE   $0014                           ; 64CC   0014

        JSR     R5,     L_53FF                  ; 64CD   0004 0150 03FF
        JSR     R5,     L_67EE                  ; 64D0   0004 0164 03EE
        DECLE   $0006                           ; 64D3   0006

        JSR     R5,     L_542A                  ; 64D4   0004 0154 002A
        DECLE   $0054                           ; 64D7   0054

        MVII    #$018E, R4                      ; 64D8   02BC 018E
        MVI     G_0175, R0                      ; 64DA   0280 0175
        ANDI    #$0001, R0                      ; 64DC   03B8 0001
        BNEQ    L_64E2                          ; 64DE   020C 0002

        MVII    #$01BE, R4                      ; 64E0   02BC 01BE

L_64E2:
        JSR     R5,     L_5C92                  ; 64E2   0004 015C 0092

        PULR    R7                              ; 64E5   02B7

L_64E6:
        CLRR    R0                              ; 64E6   01C0
        MVO     R0,     G_0188                  ; 64E7   0240 0188
        MVO     R0,     G_017D                  ; 64E9   0240 017D

        JSR     R5,     L_53FF                  ; 64EB   0004 0150 03FF
        JSR     R5,     L_67EE                  ; 64EE   0004 0164 03EE
        DECLE   $0008                           ; 64F1   0008

        JSR     R5,     L_542A                  ; 64F2   0004 0154 002A
        DECLE   $006C                           ; 64F5   006C

        MVII    #$018E, R4                      ; 64F6   02BC 018E
        MVI     G_0175, R0                      ; 64F8   0280 0175
        ANDI    #$0001, R0                      ; 64FA   03B8 0001
        BEQ     L_6500                          ; 64FC   0204 0002

        MVII    #$01BE, R4                      ; 64FE   02BC 01BE
L_6500:
        MVI     G_0188, R0                      ; 6500   0280 0188
        INCR    R0                              ; 6502   0008
        CMPI    #$0006, R0                      ; 6503   0378 0006
        BGT     L_6519                          ; 6505   020E 0012

        MVO     R0,     G_0188                  ; 6507   0240 0188
        DECR    R0                              ; 6509   0010
        SLL     R0,     2                       ; 650A   004C
        SLL     R0,     1                       ; 650B   0048
        ADDR    R0,     R4                      ; 650C   00C4

        JSR     R5,     L_67DA                  ; 650D   0004 0164 03DA
        JSR     R5,     L_5A7E                  ; 6510   0004 0158 027E
        JSR     R5,     L_511C                  ; 6513   0004 0150 011C
        DECLE   $0015                           ; 6516   0015
        BIDECLE $64F6                           ; 6517   00F6 0064
L_6519:
        PULR    R7                              ; 6519   02B7

L_651A:
        PSHR    R5                              ; 651A   0275
        MVI     G_0352, R0                      ; 651B   0280 0352
        ANDI    #$0080, R0                      ; 651D   03B8 0080
        BNEQ    L_652B                          ; 651F   020C 000A

        JSR     R5,     L_542A                  ; 6521   0004 0154 002A
        DECLE   $0030                           ; 6524   0030

        JSR     R5,     L_67EE                  ; 6525   0004 0164 03EE
        DECLE   $0000                           ; 6528   0000

        B       L_6533                          ; 6529   0200 0008

L_652B:
        JSR     R5,     L_542A                  ; 652B   0004 0154 002A
        DECLE   $0084                           ; 652E   0084

        JSR     R5,     L_67EE                  ; 652F   0004 0164 03EE
        DECLE   $000D                           ; 6532   000D
L_6533:
        JSR     R5,     L_53FF                  ; 6533   0004 0150 03FF

        MVII    #$018E, R4                      ; 6536   02BC 018E

        JSR     R5,     L_5C64                  ; 6538   0004 015C 0064

        MVII    #$01BE, R4                      ; 653B   02BC 01BE

        JSR     R5,     L_5C64                  ; 653D   0004 015C 0064

        PULR    R7                              ; 6540   02B7

        JSR     R5,     L_542A                  ; 6541   0004 0154 002A
        DECLE   $0084                           ; 6544   0084

        JSR     R5,     L_67EE                  ; 6545   0004 0164 03EE
        DECLE   $000F                           ; 6548   000F

        B       L_6533                          ; 6549   0220 0017

        JSR     R5,     L_6DCC                  ; 654B   0004 016C 01CC

        SDBD                                    ; 654E   0001
        MVII    #$5600, R1                      ; 654F   02B9 0000 0056
        MVO     R1,     G_0342                  ; 6552   0241 0342
        MOVR    R0,     R1                      ; 6554   0081
        ANDI    #$0004, R0                      ; 6555   03B8 0004
        ANDI    #$0040, R1                      ; 6557   03B9 0040
        SLR     R1,     2                       ; 6559   0065
        SLR     R1,     2                       ; 655A   0065
        CMPR    R0,     R1                      ; 655B   0141
        BEQ     L_6566                          ; 655C   0204 0008

        JSR     R5,     L_6378                  ; 655E   0004 0160 0378
        DECLE   $0001                           ; 6561   0001

        JSR     R5,     L_5B89                  ; 6562   0004 0158 0389

        PULR    R7                              ; 6565   02B7

L_6566:
        JSR     R5,     L_5CAB                  ; 6566   0004 015C 00AB

        PULR    R7                              ; 6569   02B7

        DECLE   $0018,  $0068,  $002C,  $0068   ; 656A   0018 0068 002C 0068
        DECLE   $0018,  $0068,  $002C,  $0068   ; 656E   0018 0068 002C 0068
        DECLE   $0018,  $0068,  $002C,  $0068   ; 6572   0018 0068 002C 0068
        DECLE   $0018,  $0068,  $002C,  $0068   ; 6576   0018 0068 002C 0068
        DECLE   $0018,  $0068,  $002C,  $0068   ; 657A   0018 0068 002C 0068
        DECLE   $002C,  $0068,  $0018,  $0068   ; 657E   002C 0068 0018 0068
        DECLE   $002C,  $0068,  $0018,  $0068   ; 6582   002C 0068 0018 0068
        DECLE   $002C,  $0068,  $0018,  $0068   ; 6586   002C 0068 0018 0068
        DECLE   $002C,  $0068,  $0040,  $0068   ; 658A   002C 0068 0040 0068
        DECLE   $0042,  $0068,  $0048,  $0068   ; 658E   0042 0068 0048 0068
        DECLE   $0051,  $0068,  $0014,  $0068   ; 6592   0051 0068 0014 0068
        DECLE   $0018,  $0068,  $002C,  $0068   ; 6596   0018 0068 002C 0068
        DECLE   $0022,  $0068,  $0036           ; 659A   0022 0068 0036

        SAR     R0,     1                       ; 659D   0068
        COMR    R0                              ; 659E   0018
        SAR     R0,     1                       ; 659F   0068
        ADCR    R4                              ; 65A0   002C
        SAR     R0,     1                       ; 65A1   0068
        SLLC    R0,     2                       ; 65A2   005C
        SAR     R0,     1                       ; 65A3   0068
        SLLC    R2,     2                       ; 65A4   005E
        SAR     R0,     1                       ; 65A5   0068
        SLL     R0,     2                       ; 65A6   004C
        SAR     R0,     1                       ; 65A7   0068
        SLR     R2,     1                       ; 65A8   0062
        SAR     R0,     1                       ; 65A9   0068
        SLR     R0,     2                       ; 65AA   0064
        SAR     R0,     1                       ; 65AB   0068
        SLR     R2,     2                       ; 65AC   0066
        SAR     R0,     1                       ; 65AD   0068
        SAR     R0,     1                       ; 65AE   0068
        SAR     R0,     1                       ; 65AF   0068
        SAR     R2,     1                       ; 65B0   006A
        SAR     R0,     1                       ; 65B1   0068
        RRC     R0,     1                       ; 65B2   0070
        SAR     R0,     1                       ; 65B3   0068
        RRC     R2,     2                       ; 65B4   0076
        SAR     R0,     1                       ; 65B5   0068
        SARC    R2,     2                       ; 65B6   007E
        SAR     R0,     1                       ; 65B7   0068
        RLC     R0,     2                       ; 65B8   0054
        SAR     R0,     1                       ; 65B9   0068
        SLR     R0,     1                       ; 65BA   0060
        SAR     R0,     1                       ; 65BB   0068
L_65BC:
        PSHR    R5                              ; 65BC   0275
        MVI     G_0350, R2                      ; 65BD   0282 0350
        MOVR    R2,     R4                      ; 65BF   0094
        ADDI    #$0007, R2                      ; 65C0   02FA 0007
        MVI@    R2,     R2                      ; 65C2   0292
        MVII    #$0180, R3                      ; 65C3   02BB 0180
        MVII    #$018E, R5                      ; 65C5   02BD 018E
        CMPI    #$01BE, R4                      ; 65C7   037C 01BE
        BLT     L_65CE                          ; 65C9   0205 0003

        INCR    R3                              ; 65CB   000B
        MVII    #$01BE, R5                      ; 65CC   02BD 01BE
L_65CE:
        MVI@    R3,     R3                      ; 65CE   029B
        SLL     R3,     2                       ; 65CF   004F
        SLL     R3,     1                       ; 65D0   004B
        ADDR    R5,     R3                      ; 65D1   00EB
        INCR    R2                              ; 65D2   000A
        ADDR    R7,     R2                      ; 65D3   00FA
        ADD@    R2,     R7                      ; 65D4   02D7

        DECLE   $002B,  $002B,  $0035,  $0035   ; 65D5   002B 002B 0035 0035

        RSWD    R1                              ; 65D9   0039
        RSWD    R1                              ; 65DA   0039
        SWAP    R3,     1                       ; 65DB   0043
        SWAP    R3,     1                       ; 65DC   0043
        SLL     R1,     1                       ; 65DD   0049
        RLC     R2,     2                       ; 65DE   0056
        RLC     R2,     2                       ; 65DF   0056
        SAR     R2,     1                       ; 65E0   006A
        SAR     R2,     1                       ; 65E1   006A
        ADCR    R3                              ; 65E2   002B
        ADCR    R3                              ; 65E3   002B
        ADCR    R3                              ; 65E4   002B
        ADCR    R3                              ; 65E5   002B
        ADCR    R2                              ; 65E6   002A
        MOVR    R2,     R6                      ; 65E7   0096
        ADCR    R2                              ; 65E8   002A
        MOVR    R1,     R0                      ; 65E9   0088
        ADCR    R2                              ; 65EA   002A
        SARC    R0,     1                       ; 65EB   0078
        SARC    R0,     1                       ; 65EC   0078
        ADCR    R2                              ; 65ED   002A
        ADCR    R2                              ; 65EE   002A
        RRC     R0,     2                       ; 65EF   0074
        RRC     R0,     2                       ; 65F0   0074
        SARC    R0,     1                       ; 65F1   0078
        SARC    R0,     1                       ; 65F2   0078
        MOVR    R6,     R5                      ; 65F3   00B5
        SARC    R0,     1                       ; 65F4   0078
        SARC    R0,     1                       ; 65F5   0078
        SARC    R0,     1                       ; 65F6   0078
        SARC    R0,     1                       ; 65F7   0078
        SARC    R0,     1                       ; 65F8   0078
        SARC    R0,     1                       ; 65F9   0078
        SARC    R0,     1                       ; 65FA   0078
        SARC    R0,     1                       ; 65FB   0078
        SARC    R0,     1                       ; 65FC   0078
        SARC    R0,     1                       ; 65FD   0078
        PULR    R7                              ; 65FE   02B7
        PULR    R7                              ; 65FF   02B7

        JSR     R5,     L_677D                  ; 6600   0004 0164 037D
        JSR     R5,     L_511C                  ; 6603   0004 0150 011C
        DECLE   $000A                           ; 6606   000A
        BIDECLE $6491                           ; 6607   0091 0064

        PULR    R7                              ; 6609   02B7

        JSR     R5,     L_677D                  ; 660A   0004 0164 037D

        PULR    R7                              ; 660D   02B7

        JSR     R5,     L_677D                  ; 660E   0004 0164 037D
        JSR     R5,     L_511C                  ; 6611   0004 0150 011C
        DECLE   $001E                           ; 6614   001E
        BIDECLE $64C9                           ; 6615   00C9 0064

        PULR    R7                              ; 6617   02B7

        JSR     R5,     L_677D                  ; 6618   0004 0164 037D

        J       L_64E6                          ; 661B   0004 0364 00E6

        JSR     R5,     L_5447                  ; 661E   0004 0154 0047
        DECLE   $003C                           ; 6621   003C

        MVII    #$0009, R0                      ; 6622   02B8 0009

        JSR     R5,     L_67E2                  ; 6624   0004 0164 03E2
        JSR     R5,     L_5A7E                  ; 6627   0004 0158 027E

        PULR    R7                              ; 662A   02B7

        JSR     R5,     L_677D                  ; 662B   0004 0164 037D

        MVI     G_0175, R0                      ; 662E   0280 0175
        INCR    R0                              ; 6630   0008
        MVO     R0,     G_0175                  ; 6631   0240 0175
        ANDI    #$0001, R0                      ; 6633   03B8 0001
        SLL     R0,     2                       ; 6635   004C
        MVO     R0,     G_034F                  ; 6636   0240 034F

        JSR     R5,     L_511C                  ; 6638   0004 0150 011C
        DECLE   $0014                           ; 663B   0014
        BIDECLE $6491                           ; 663C   0091 0064

        PULR    R7                              ; 663E   02B7

        JSR     R5,     L_677D                  ; 663F   0004 0164 037D
        JSR     R5,     L_511C                  ; 6642   0004 0150 011C
        DECLE   $0014                           ; 6645   0014
        BIDECLE $668F                           ; 6646   008F 0066

        PULR    R7                              ; 6648   02B7

        JSR     R5,     L_676E                  ; 6649   0004 0164 036E

        PULR    R7                              ; 664C   02B7

        JSR     R5,     L_67F8                  ; 664D   0004 0164 03F8

        MVI     G_0352, R0                      ; 6650   0280 0352
        ANDI    #$000C, R0                      ; 6652   03B8 000C
        BNEQ    L_667D                          ; 6654   020C 0027

        CMPR    R3,     R4                      ; 6656   015C
        BEQ     L_667D                          ; 6657   0204 0024

        JSR     R5,     L_5ACB                  ; 6659   0004 0158 02CB

        PULR    R7                              ; 665C   02B7

        DECLE   $0004                           ; 665D   0004

        ANDR    R5,     R4                      ; 665E   01AC
        MVO@    R0,     R4                      ; 665F   0260
        BEQ     L_667D                          ; 6660   0204 001B

        MVII    #$0002, R0                      ; 6662   02B8 0002

        JSR     R5,     L_67E2                  ; 6664   0004 0164 03E2
        JSR     R5,     L_5A7E                  ; 6667   0004 0158 027E

        PULR    R7                              ; 666A   02B7

        JSR     R5,     L_67F8                  ; 666B   0004 0164 03F8

        MVII    #$0004, R0                      ; 666E   02B8 0004

        JSR     R5,     X_RAND1                 ; 6670   0004 0114 027D

        ADDI    #$000A, R0                      ; 6673   02F8 000A
        MVO     R0,     G_0353                  ; 6675   0240 0353
        MVO     R0,     G_0354                  ; 6677   0240 0354
        MVII    #$0011, R0                      ; 6679   02B8 0011
        B       L_667F                          ; 667B   0200 0002

L_667D:
        MVII    #$0015, R0                      ; 667D   02B8 0015

L_667F:
        JSR     R5,     L_67E2                  ; 667F   0004 0164 03E2

        MOVR    R4,     R1                      ; 6682   00A1
        MVI@    R1,     R0                      ; 6683   0288
        ANDI    #$00E7, R0                      ; 6684   03B8 00E7
        XORI    #$0010, R0                      ; 6686   03F8 0010
        MVO@    R0,     R1                      ; 6688   0248
        PULR    R7                              ; 6689   02B7

        MVII    #$0014, R0                      ; 668A   02B8 0014
        B       L_667F                          ; 668C   0220 000E

        PSHR    R5                              ; 668E   0275
        CLRR    R5                              ; 668F   01ED
        MVII    #$0180, R2                      ; 6690   02BA 0180
        MVII    #$0181, R3                      ; 6692   02BB 0181
        MVII    #$018E, R4                      ; 6694   02BC 018E
        MVI     G_034F, R0                      ; 6696   0280 034F
        ANDI    #$0004, R0                      ; 6698   03B8 0004
        BEQ     L_66A3                          ; 669A   0204 0007

        MVII    #$0050, R5                      ; 669C   02BD 0050
        PSHR    R2                              ; 669E   0272
        MOVR    R3,     R2                      ; 669F   009A
        PULR    R3                              ; 66A0   02B3
        MVII    #$01BE, R4                      ; 66A1   02BC 01BE
L_66A3:
        XORI    #$0021, R5                      ; 66A3   03FD 0021
        XORR    R0,     R5                      ; 66A5   01C5
        MVI     G_0175, R1                      ; 66A6   0281 0175
        ANDI    #$0001, R1                      ; 66A8   03B9 0001
        SLR     R0,     2                       ; 66AA   0064
        XORR    R1,     R0                      ; 66AB   01C8
        SLL     R0,     2                       ; 66AC   004C
        SLL     R0,     1                       ; 66AD   0048
        XORR    R0,     R5                      ; 66AE   01C5
        MVO     R5,     G_034F                  ; 66AF   0245 034F
        CLRR    R0                              ; 66B1   01C0
        ANDI    #$0004, R5                      ; 66B2   03BD 0004
        BEQ     L_66B7                          ; 66B4   0204 0001

        INCR    R0                              ; 66B6   0008
L_66B7:
        MVO     R0,     G_0179                  ; 66B7   0240 0179
        MVI     G_0352, R0                      ; 66B9   0280 0352
        ANDI    #$0080, R0                      ; 66BB   03B8 0080
        BEQ     L_66C6                          ; 66BD   0204 0007

        MVI     G_017D, R0                      ; 66BF   0280 017D
        SLR     R0,     1                       ; 66C1   0060
        ANDI    #$0001, R0                      ; 66C2   03B8 0001
        B       L_66CA                          ; 66C4   0200 0004

L_66C6:
        JSR     R5,     L_597D                  ; 66C6   0004 0158 017D
        DECLE   $0000                           ; 66C9   0000
L_66CA:
        MVO@    R0,     R2                      ; 66CA   0250
        SLL     R0,     2                       ; 66CB   004C
        SLL     R0,     1                       ; 66CC   0048
        ADDR    R0,     R4                      ; 66CD   00C4
        MVO     R4,     G_0350                  ; 66CE   0244 0350
        MVII    #$0011, R0                      ; 66D0   02B8 0011

        JSR     R5,     L_67E2                  ; 66D2   0004 0164 03E2

        MVI     G_0352, R0                      ; 66D5   0280 0352
        ANDI    #$000C, R0                      ; 66D7   03B8 000C
        BEQ     L_66EF                          ; 66D9   0204 0014

        MOVR    R7,     R5                      ; 66DB   00BD
        ADDI    #$000E, R5                      ; 66DC   02FD 000E
L_66DE:
        MVI@    R5,     R1                      ; 66DE   02A9
        DECLE   $0089,  $0204,  $001A           ; 66DF   0089 0204 001A

        MVI@    R1,     R0                      ; 66E2   0288
        ANDI    #$007F, R0                      ; 66E3   03B8 007F
        XORI    #$0080, R0                      ; 66E5   03F8 0080
        MVO@    R0,     R1                      ; 66E7   0248
        B       L_66DE                          ; 66E8   0220 000B

        DECLE   $018E,  $0196,  $01BE,  $01C6   ; 66EA   018E 0196 01BE 01C6
        DECLE   $0000                           ; 66EE   0000
L_66EF:
        MVII    #$018E, R4                      ; 66EF   02BC 018E
        MVI     G_034F, R0                      ; 66F1   0280 034F
        ANDI    #$0004, R0                      ; 66F3   03B8 0004
        BEQ     L_66F9                          ; 66F5   0204 0002

        MVII    #$01BE, R4                      ; 66F7   02BC 01BE

L_66F9:
        JSR     R5,     L_5B46                  ; 66F9   0004 0158 0346
        DECLE   $0004                           ; 66FC   0004

        ANDR    R5,     R4                      ; 66FD   01AC
        MVO@    R0,     R1                      ; 66FE   0248
        BNEQ    L_6721                          ; 66FF   020C 0020

        MVII    #$0005, R0                      ; 6701   02B8 0005

        JSR     R5,     X_RAND1                 ; 6703   0004 0114 027D

        SUBI    #$0010, R0                      ; 6706   0338 0010
        MOVR    R0,     R1                      ; 6708   0081
        MVII    #$0004, R0                      ; 6709   02B8 0004

        JSR     R5,     X_RAND1                 ; 670B   0004 0114 027D

        SUBI    #$0008, R0                      ; 670E   0338 0008
        MVI     G_0350, R4                      ; 6710   0284 0350
        INCR    R4                              ; 6712   000C
        ADD@    R4,     R0                      ; 6713   02E0
        ADD@    R4,     R1                      ; 6714   02E1
        MVII    #$004B, R3                      ; 6715   02BB 004B
        MVI     G_0350, R4                      ; 6717   0284 0350

        JSR     R5,     L_57BB                  ; 6719   0004 0154 03BB

        MVII    #$0012, R0                      ; 671C   02B8 0012

        JSR     R5,     L_67E2                  ; 671E   0004 0164 03E2

L_6721:
        CLRR    R0                              ; 6721   01C0
        MVO     R0,     G_0184                  ; 6722   0240 0184
        MVO     R0,     G_0185                  ; 6724   0240 0185
        MVO     R0,     G_0343                  ; 6726   0240 0343
        SDBD                                    ; 6728   0001
        MVII    #$0500, R1                      ; 6729   02B9 0000 0005
        MVO     R0,     G_0345                  ; 672C   0240 0345
        MVO     R0,     G_0347                  ; 672E   0240 0347
        MVO     R1,     G_0348                  ; 6730   0241 0348
        MVII    #$00FF, R0                      ; 6732   02B8 00FF
        MVO     R0,     G_0182                  ; 6734   0240 0182
        MVO     R0,     G_0183                  ; 6736   0240 0183

        JSR     R5,     L_6378                  ; 6738   0004 0160 0378
        DECLE   $0004                           ; 673B   0004

        MVII    #$0002, R0                      ; 673C   02B8 0002
        MVO     R0,     G_0173                  ; 673E   0240 0173
        MVI     G_0179, R2                      ; 6740   0282 0179
        MOVR    R2,     R3                      ; 6742   0093
        ADDI    #$0176, R2                      ; 6743   02FA 0176
        XORI    #$0001, R3                      ; 6745   03FB 0001
        ADDI    #$0176, R3                      ; 6747   02FB 0176
        MVI@    R2,     R0                      ; 6749   0290
        ANDI    #$003F, R0                      ; 674A   03B8 003F
        CMPI    #$000E, R0                      ; 674C   0378 000E
        BLT     L_676D                          ; 674E   0205 001D

        CMPI    #$003E, R0                      ; 6750   0378 003E
        BEQ     L_675B                          ; 6752   0204 0007

        MVI@    R3,     R3                      ; 6754   029B
        ANDI    #$003F, R3                      ; 6755   03BB 003F
        NEGR    R0                              ; 6757   0020
        ADDR    R3,     R0                      ; 6758   00D8
        BPL     L_676D                          ; 6759   0203 0012

L_675B:
        MVII    #$0006, R1                      ; 675B   02B9 0006
        MVI@    R2,     R0                      ; 675D   0290
        ANDI    #$00C0, R0                      ; 675E   03B8 00C0
        CMPI    #$0080, R0                      ; 6760   0378 0080
        BLT     L_6766                          ; 6762   0205 0002

        MVII    #$0007, R1                      ; 6764   02B9 0007

L_6766:
        JSR     R5,     L_5D41                  ; 6766   0004 015C 0141
        JSR     R5,     L_6378                  ; 6769   0004 0160 0378
        DECLE   $0010                           ; 676C   0010
L_676D:
        PULR    R7                              ; 676D   02B7

L_676E:
        PSHR    R5                              ; 676E   0275

        JSR     R5,     L_5A47                  ; 676F   0004 0158 0247
        JSR     R5,     L_59E1                  ; 6772   0004 0158 01E1

        MVI@    R4,     R0                      ; 6775   02A0
        ANDI    #$004F, R0                      ; 6776   03B8 004F
        XORI    #$0010, R0                      ; 6778   03F8 0010
        DECR    R4                              ; 677A   0014
        MVO@    R0,     R4                      ; 677B   0260
        PULR    R7                              ; 677C   02B7

L_677D:
        PSHR    R5                              ; 677D   0275

        JSR     R5,     L_5A47                  ; 677E   0004 0158 0247
        JSR     R5,     L_59E1                  ; 6781   0004 0158 01E1

        MVI@    R4,     R0                      ; 6784   02A0
        ANDI    #$004F, R0                      ; 6785   03B8 004F
        XORI    #$0010, R0                      ; 6787   03F8 0010
        DECR    R4                              ; 6789   0014
        MVO@    R0,     R4                      ; 678A   0260
        MVII    #$018E, R2                      ; 678B   02BA 018E
        MVII    #$01BE, R3                      ; 678D   02BB 01BE
        CMPI    #$01BE, R4                      ; 678F   037C 01BE
        BLT     L_6796                          ; 6791   0205 0003

        PSHR    R2                              ; 6793   0272
        MOVR    R3,     R2                      ; 6794   009A
        PULR    R3                              ; 6795   02B3
L_6796:
        MVII    #$0002, R1                      ; 6796   02B9 0002
L_6798:
        MVII    #$0006, R5                      ; 6798   02BD 0006
L_679A:
        MVI@    R2,     R0                      ; 679A   0290
        ANDI    #$0020, R0                      ; 679B   03B8 0020
        BNEQ    L_67C6                          ; 679D   020C 0027

L_679F:
        ADDI    #$0008, R2                      ; 679F   02FA 0008
        DECR    R5                              ; 67A1   0015
        BNEQ    L_679A                          ; 67A2   022C 0009

        MOVR    R3,     R2                      ; 67A4   009A
        DECR    R1                              ; 67A5   0011
        BNEQ    L_6798                          ; 67A6   022C 000F

        MVI     G_0352, R0                      ; 67A8   0280 0352
        ANDI    #$0080, R0                      ; 67AA   03B8 0080
        BEQ     L_67C0                          ; 67AC   0204 0012

        MVII    #$0191, R5                      ; 67AE   02BD 0191
        CLRR    R3                              ; 67B0   01DB
L_67B1:
        MVI@    R5,     R0                      ; 67B1   02A8
        TSTR    R0                              ; 67B2   0080
        BEQ     L_67B6                          ; 67B3   0204 0001

        INCR    R3                              ; 67B5   000B
L_67B6:
        ADDI    #$0007, R5                      ; 67B6   02FD 0007
        CMPI    #$01E9, R5                      ; 67B8   037D 01E9
        BLE     L_67B1                          ; 67BA   0226 000A

        TSTR    R3                              ; 67BC   009B
        BNEQ    L_67D8                          ; 67BD   020C 0019
        PULR    R7                              ; 67BF   02B7

L_67C0:
        MVI     G_017C, R0                      ; 67C0   0280 017C
        TSTR    R0                              ; 67C2   0080
        BNEQ    L_67D8                          ; 67C3   020C 0013
        PULR    R7                              ; 67C5   02B7

L_67C6:
        MVI     G_0352, R0                      ; 67C6   0280 0352
        ANDI    #$0080, R0                      ; 67C8   03B8 0080
        BNEQ    L_67D1                          ; 67CA   020C 0005

        MVI@    R2,     R0                      ; 67CC   0290
        ANDI    #$0007, R0                      ; 67CD   03B8 0007
        BNEQ    L_679F                          ; 67CF   022C 0031

L_67D1:
        MOVR    R2,     R4                      ; 67D1   0094

        JSR     R5,     L_67DA                  ; 67D2   0004 0164 03DA
        JSR     R5,     L_5A7E                  ; 67D5   0004 0158 027E

L_67D8:
        PULR    R5                              ; 67D8   02B5
        PULR    R7                              ; 67D9   02B7

L_67DA:
        MVI     G_017E, R0                      ; 67DA   0280 017E
        CMPI    #$01BE, R4                      ; 67DC   037C 01BE
        BLT     L_67E2                          ; 67DE   0205 0002

        MVI     G_017F, R0                      ; 67E0   0280 017F
L_67E2:
        PSHR    R5                              ; 67E2   0275
        PSHR    R4                              ; 67E3   0274
        ADDI    #$0005, R4                      ; 67E4   02FC 0005
        MVII    #$0001, R5                      ; 67E6   02BD 0001
        MVO@    R5,     R4                      ; 67E8   0265
        CLRR    R5                              ; 67E9   01ED
        MVO@    R5,     R4                      ; 67EA   0265
        MVO@    R0,     R4                      ; 67EB   0260
        PULR    R4                              ; 67EC   02B4
        PULR    R7                              ; 67ED   02B7

L_67EE:
        MVI@    R5,     R0                      ; 67EE   02A8
        MVO     R0,     G_017E                  ; 67EF   0240 017E
        MVO     R0,     G_017F                  ; 67F1   0240 017F
        MOVR    R5,     R7                      ; 67F3   00AF

L_67F4:
        MVII    #$0004, R0                      ; 67F4   02B8 0004
        B       L_67FA                          ; 67F6   0200 0002

L_67F8:
        MVII    #$0008, R0                      ; 67F8   02B8 0008
L_67FA:
        PSHR    R5                              ; 67FA   0275
        MOVR    R4,     R5                      ; 67FB   00A5
        MVI@    R5,     R5                      ; 67FC   02AD
        ANDI    #$0007, R5                      ; 67FD   03BD 0007
        DECR    R5                              ; 67FF   0015
        BMI     L_6813                          ; 6800   020B 0011

        PSHR    R4                              ; 6802   0274
        PSHR    R0                              ; 6803   0270
        MOVR    R5,     R0                      ; 6804   00A8
        SLL     R0,     1                       ; 6805   0048
        PSHR    R0                              ; 6806   0270
        SLL     R0,     2                       ; 6807   004C
        ADD@    R6,     R0                      ; 6808   02F0
        ADDI    #$0107, R0                      ; 6809   02F8 0107
        MOVR    R0,     R4                      ; 680B   0084
        ADDI    #$0002, R4                      ; 680C   02FC 0002
        PULR    R0                              ; 680E   02B0

        JSR     R5,     X_FILL_ZERO             ; 680F   0004 0114 0338

        PULR    R4                              ; 6812   02B4
L_6813:
        PULR    R7                              ; 6813   02B7

        DECLE   $0013,  $0000                   ; 6814   0013 0000

        SDBD                                    ; 6816   0001
        XORI    #$1401, R6                      ; 6817   03FE 0001 0014
        DECR    R5                              ; 681A   0015
        DECR    R6                              ; 681B   0016
L_681C:
        DECR    R7                              ; 681C   0017

        COMR    R0                              ; 681D   0018
        COMR    R1                              ; 681E   0019
        COMR    R2                              ; 681F   001A
        COMR    R3                              ; 6820   001B
        XORI    #$0001, R6                      ; 6821   03FE 0001
        COMR    R3                              ; 6823   001B
        COMR    R2                              ; 6824   001A
        COMR    R1                              ; 6825   0019
        COMR    R0                              ; 6826   0018
L_6827:
        DECR    R7                              ; 6827   0017

        DECLE   $0016,  $0015,  $0014,  $03FE   ; 6828   0016 0015 0014 03FE
        DECLE   $0002,  $001C,  $001D,  $001E   ; 682C   0002 001C 001D 001E
        DECLE   $001F,  $0020,  $0021,  $0022   ; 6830   001F 0020 0021 0022
        DECLE   $0023,  $03FE,  $0002,  $0023   ; 6834   0023 03FE 0002 0023
        DECLE   $0022,  $0021,  $0020,  $001F   ; 6838   0022 0021 0020 001F
        DECLE   $001E,  $001D,  $001C,  $03FE   ; 683C   001E 001D 001C 03FE
        DECLE   $0000,  $002A,  $0002,  $002A   ; 6840   0000 002A 0002 002A
        DECLE   $002B,  $002C,  $002D,  $03FE   ; 6844   002B 002C 002D 03FE
        DECLE   $0008,  $002E,  $002F,  $03FE   ; 6848   0008 002E 002F 03FE
        DECLE   $0001,  $0030,  $0031,  $0032   ; 684C   0001 0030 0031 0032
        DECLE   $03FF,  $001E,  $0032,  $03FF   ; 6850   03FF 001E 0032 03FF
        DECLE   $0001,  $0026,  $0027,  $0028   ; 6854   0001 0026 0027 0028
        DECLE   $0029,  $03FD,  $0000,  $0029   ; 6858   0029 03FD 0000 0029
        DECLE   $0000,  $0025,  $0000,  $0025   ; 685C   0000 0025 0000 0025
        DECLE   $0000,  $0028,  $0000,  $0024   ; 6860   0000 0028 0000 0024
        DECLE   $0000,  $0034,  $0000,  $0035   ; 6864   0000 0034 0000 0035
        DECLE   $0000,  $0036,  $0004,  $0002   ; 6868   0000 0036 0004 0002
        DECLE   $0003,  $0004,  $0005,  $03FF   ; 686C   0003 0004 0005 03FF
        DECLE   $0003,  $0006,  $0007,  $0008   ; 6870   0003 0006 0007 0008
        DECLE   $0009,  $03FF,  $0003,  $0037   ; 6874   0009 03FF 0003 0037
        DECLE   $0038,  $0039,  $03FD,  $000A   ; 6878   0038 0039 03FD 000A
        DECLE   $0039,  $03FF                   ; 687C   0039 03FF

        DIS                                     ; 687E   0003
        RSWD    R2                              ; 687F   003A
        RSWD    R3                              ; 6880   003B
        RSWD    R4                              ; 6881   003C
        XORI    #$0000, R5                      ; 6882   03FD 0000
        RSWD    R4                              ; 6884   003C
L_6885:
        PSHR    R5                              ; 6885   0275

        JSR     R5,     L_6F41                  ; 6886   0004 016C 0341

        MVI     G_034F, R0                      ; 6889   0280 034F
        MOVR    R0,     R1                      ; 688B   0081
        ANDI    #$0020, R0                      ; 688C   03B8 0020
        BEQ     L_68CC                          ; 688E   0204 003C

        MOVR    R1,     R0                      ; 6890   0088
        ANDI    #$0080, R0                      ; 6891   03B8 0080
        BNEQ    L_68CC                          ; 6893   020C 0037

        MOVR    R1,     R0                      ; 6895   0088
        ANDI    #$0003, R1                      ; 6896   03B9 0003
        CMPI    #$0001, R1                      ; 6898   0379 0001
        BNEQ    L_68CC                          ; 689A   020C 0030

        MVII    #$018E, R4                      ; 689C   02BC 018E
        MVII    #$0180, R1                      ; 689E   02B9 0180
        ANDI    #$0004, R0                      ; 68A0   03B8 0004
        BEQ     L_68A7                          ; 68A2   0204 0003

        INCR    R1                              ; 68A4   0009
        MVII    #$01BE, R4                      ; 68A5   02BC 01BE
L_68A7:
        MVI@    R1,     R0                      ; 68A7   0288
        SLL     R0,     2                       ; 68A8   004C
        SLL     R0,     1                       ; 68A9   0048
        ADDR    R0,     R4                      ; 68AA   00C4
        MVI@    R4,     R0                      ; 68AB   02A0
        ANDI    #$0007, R0                      ; 68AC   03B8 0007
        DECR    R0                              ; 68AE   0010
        SLL     R0,     1                       ; 68AF   0048
        PSHR    R0                              ; 68B0   0270
        SLL     R0,     2                       ; 68B1   004C
        ADD@    R6,     R0                      ; 68B2   02F0
        MOVR    R0,     R5                      ; 68B3   0085
        ADDI    #$0107, R5                      ; 68B4   02FD 0107
        MVI@    R4,     R0                      ; 68B6   02A0
        SWAP    R0,     1                       ; 68B7   0040
        XOR@    R5,     R0                      ; 68B8   03E8
        MVI@    R4,     R1                      ; 68B9   02A1
        SWAP    R1,     1                       ; 68BA   0041
        XOR@    R5,     R1                      ; 68BB   03E9
        SDBD                                    ; 68BC   0001
        MVII    #$0400, R3                      ; 68BD   02BB 0000 0004
        MVI     G_034F, R5                      ; 68C0   0285 034F
        ANDI    #$0008, R5                      ; 68C2   03BD 0008
        BEQ     L_68C7                          ; 68C4   0204 0001

        NEGR    R3                              ; 68C6   0023
L_68C7:
        ADDR    R3,     R0                      ; 68C7   00D8
        MVO     R0,     G_0342                  ; 68C8   0240 0342
        MVO     R1,     G_0344                  ; 68CA   0241 0344
L_68CC:
        MVI     G_0342, R0                      ; 68CC   0280 0342
        MVI     G_0344, R1                      ; 68CE   0281 0344
        ADD     G_0343, R0                      ; 68D0   02C0 0343
        ADD     G_0345, R1                      ; 68D2   02C1 0345
        MVO     R0,     G_0342                  ; 68D4   0240 0342
        MVO     R1,     G_0344                  ; 68D6   0241 0344
        MVI     G_034F, R5                      ; 68D8   0285 034F
        ANDI    #$0100, R5                      ; 68DA   03BD 0100
        BEQ     L_68E9                          ; 68DC   0204 000B

        MVI     G_0348, R2                      ; 68DE   0282 0348
        MVI     G_0347, R3                      ; 68E0   0283 0347
        ADDR    R3,     R2                      ; 68E2   00DA
        SUBI    #$0004, R3                      ; 68E3   033B 0004
        MVO     R2,     G_0348                  ; 68E5   0242 0348
        MVO     R3,     G_0347                  ; 68E7   0243 0347
L_68E9:
        MVI     G_0349, R3                      ; 68E9   0283 0349
        SLL     R3,     1                       ; 68EB   004B
        ADDI    #$0342, R3                      ; 68EC   02FB 0342
        MVI@    R3,     R0                      ; 68EE   0298
        SUB     G_034A, R0                      ; 68EF   0300 034A
        BPL     L_68F4                          ; 68F1   0203 0001

        NEGR    R0                              ; 68F3   0020
L_68F4:
        SWAP    R0,     1                       ; 68F4   0040
        ANDI    #$00FF, R0                      ; 68F5   03B8 00FF
        MVI     G_034C, R1                      ; 68F7   0281 034C

        JSR     R5,     X_MPY                   ; 68F9   0004 011C 01DC

        MOVR    R2,     R1                      ; 68FC   0091
        MVI     G_034B, R2                      ; 68FD   0282 034B

        JSR     R5,     X_DIV                   ; 68FF   0004 011C 01FB

        SWAP    R0,     1                       ; 6902   0040
        SLR     R0,     1                       ; 6903   0060
        NEGR    R0                              ; 6904   0020
        ADD     G_0348, R0                      ; 6905   02C0 0348
        MVO     R0,     G_0346                  ; 6907   0240 0346
        TSTR    R0                              ; 6909   0080
        BPL     L_6921                          ; 690A   0203 0015

        JSR     R5,     L_6BF1                  ; 690C   0004 0168 03F1

        MVI     G_0347, R3                      ; 690F   0283 0347
        NEGR    R3                              ; 6911   0023
        SLR     R3,     1                       ; 6912   0063
        MVO     R3,     G_0347                  ; 6913   0243 0347
        CLRR    R2                              ; 6915   01D2
        MVO     R2,     G_0348                  ; 6916   0242 0348
        MVO     R2,     G_034A                  ; 6918   0242 034A
        MVO     R2,     G_034B                  ; 691A   0242 034B
        NOP                                     ; 691C   0034
        MVO     R2,     G_034C                  ; 691D   0242 034C
        MVO     R2,     G_0346                  ; 691F   0242 0346
L_6921:
        MVI     G_034F, R5                      ; 6921   0285 034F
        ANDI    #$0100, R5                      ; 6923   03BD 0100
        BEQ     L_6A1C                          ; 6925   0204 00F5

        MVI     G_0342, R0                      ; 6927   0280 0342
        MVI     G_0344, R1                      ; 6929   0281 0344
        SDBD                                    ; 692B   0001
        CMPI    #$A800, R0                      ; 692C   0378 0000 00A8
        BC      L_6A47                          ; 692F   0201 0116

        SDBD                                    ; 6931   0001
        CMPI    #$2000, R1                      ; 6932   0379 0000 0020
        BLT     L_6A47                          ; 6935   0205 0110

        SDBD                                    ; 6937   0001
        CMPI    #$7000, R1                      ; 6938   0379 0000 0070
        BGT     L_6A47                          ; 693B   020E 010A

        CLRR    R5                              ; 693D   01ED
        SDBD                                    ; 693E   0001
        CMPI    #$5700, R0                      ; 693F   0378 0000 0057
        BNC     L_6946                          ; 6942   0209 0002

        MVII    #$0008, R5                      ; 6944   02BD 0008
L_6946:
        PSHR    R5                              ; 6946   0275
        MVI     G_034F, R5                      ; 6947   0285 034F
        ANDI    #$0008, R5                      ; 6949   03BD 0008
        CMP@    R6,     R5                      ; 694B   0375
        BEQ     L_6A1C                          ; 694C   0204 00CE

        MVI     G_0346, R2                      ; 694E   0282 0346
        SLL     R2,     1                       ; 6950   004A
        SWAP    R2,     1                       ; 6951   0042
        ANDI    #$00FF, R2                      ; 6952   03BA 00FF
        CMPI    #$0012, R2                      ; 6954   037A 0012
        BLE     L_6976                          ; 6956   0206 001E

        MVI     G_034F, R3                      ; 6958   0283 034F
        XORI    #$0008, R3                      ; 695A   03FB 0008
        SDBD                                    ; 695C   0001
        ANDI    #$FFDC, R3                      ; 695D   03BB 00DC 00FF
        MVO     R3,     G_034F                  ; 6960   0243 034F
        MVII    #$0184, R1                      ; 6962   02B9 0184
        ANDI    #$0010, R3                      ; 6964   03BB 0010
        BEQ     L_6969                          ; 6966   0204 0001

        INCR    R1                              ; 6968   0009
L_6969:
        CLRR    R0                              ; 6969   01C0
        MVO@    R0,     R1                      ; 696A   0248
        ADDI    #$0002, R1                      ; 696B   02F9 0002
        MVO@    R0,     R1                      ; 696D   0248
        MVII    #$00FF, R0                      ; 696E   02B8 00FF
        MVO     R0,     G_0182                  ; 6970   0240 0182
        MVO     R0,     G_0183                  ; 6972   0240 0183
        B       L_6A1C                          ; 6974   0200 00A6

L_6976:
        MVI     G_034F, R0                      ; 6976   0280 034F
        MOVR    R0,     R1                      ; 6978   0081
        ANDI    #$0010, R1                      ; 6979   03B9 0010
        SLR     R1,     2                       ; 697B   0065
        SLR     R1,     2                       ; 697C   0065
        MVO     R1,     G_0179                  ; 697D   0241 0179
        MOVR    R0,     R1                      ; 697F   0081
        ANDI    #$0020, R1                      ; 6980   03B9 0020
        BEQ     L_699E                          ; 6982   0204 001A

        MOVR    R0,     R1                      ; 6984   0081
        ANDI    #$0080, R1                      ; 6985   03B9 0080
        BNEQ    L_699E                          ; 6987   020C 0015

        ANDI    #$0010, R0                      ; 6989   03B8 0010
        XORI    #$0010, R0                      ; 698B   03F8 0010
        SLL     R0,     2                       ; 698D   004C

        JSR     R5,     L_6EAE                  ; 698E   0004 016C 02AE

        MVII    #$000C, R1                      ; 6991   02B9 000C
        CMPI    #$000B, R2                      ; 6993   037A 000B
        BGT     L_6999                          ; 6995   020E 0002

        MVII    #$000D, R1                      ; 6997   02B9 000D
L_6999:
        PSHR    R2                              ; 6999   0272

        JSR     R5,     L_5D41                  ; 699A   0004 015C 0141

        PULR    R2                              ; 699D   02B2
L_699E:
        CMPI    #$000B, R2                      ; 699E   037A 000B
        BGT     L_69C3                          ; 69A0   020E 0021

        MVI     G_034F, R0                      ; 69A2   0280 034F
        MOVR    R0,     R1                      ; 69A4   0081
        ANDI    #$0080, R1                      ; 69A5   03B9 0080
        BNEQ    L_69B5                          ; 69A7   020C 000C

        ANDI    #$0010, R0                      ; 69A9   03B8 0010
        XORI    #$0010, R0                      ; 69AB   03F8 0010
        SLL     R0,     2                       ; 69AD   004C

        JSR     R5,     L_6EAE                  ; 69AE   0004 016C 02AE
        JSR     R5,     L_5D40                  ; 69B1   0004 015C 0140
        DECLE   $000B                           ; 69B4   000B
L_69B5:
        MVI     G_034F, R0                      ; 69B5   0280 034F
        XORI    #$0008, R0                      ; 69B7   03F8 0008
        SDBD                                    ; 69B9   0001
        ANDI    #$FFDC, R0                      ; 69BA   03B8 00DC 00FF
        MVO     R0,     G_034F                  ; 69BD   0240 034F
        MVII    #$000E, R0                      ; 69BF   02B8 000E
        B       L_6A19                          ; 69C1   0200 0056

L_69C3:
        CMPI    #$0010, R2                      ; 69C3   037A 0010
        BLT     L_69DF                          ; 69C5   0205 0018

        MVII    #$00FF, R0                      ; 69C7   02B8 00FF
        MVO     R0,     G_0182                  ; 69C9   0240 0182
        MVO     R0,     G_0183                  ; 69CB   0240 0183
        MVI     G_034F, R0                      ; 69CD   0280 034F
        XORI    #$0008, R0                      ; 69CF   03F8 0008
        SDBD                                    ; 69D1   0001
        ANDI    #$FFDC, R0                      ; 69D2   03B8 00DC 00FF
        MVO     R0,     G_034F                  ; 69D5   0240 034F
        MVII    #$000F, R0                      ; 69D7   02B8 000F
        MVII    #$0082, R3                      ; 69D9   02BB 0082
        MVII    #$0006, R4                      ; 69DB   02BC 0006
        B       L_6A05                          ; 69DD   0200 0026

L_69DF:
        MVI     G_034F, R1                      ; 69DF   0281 034F
        MOVR    R1,     R0                      ; 69E1   0088
        ANDI    #$0020, R0                      ; 69E2   03B8 0020
        BNEQ    L_69EA                          ; 69E4   020C 0004

        ANDI    #$0080, R1                      ; 69E6   03B9 0080
        BNEQ    L_6A1C                          ; 69E8   020C 0032

L_69EA:
        MVI     G_018C, R1                      ; 69EA   0281 018C
        NEGR    R1                              ; 69EC   0021
        ADDI    #$00AE, R1                      ; 69ED   02F9 00AE
        MVO     R1,     G_018C                  ; 69EF   0241 018C
        SDBD                                    ; 69F1   0001
        MVII    #$5600, R0                      ; 69F2   02B8 0000 0056
        CMPI    #$0057, R1                      ; 69F5   0379 0057
        BNC     L_69FD                          ; 69F7   0209 0004

        SDBD                                    ; 69F9   0001
        MVII    #$5800, R0                      ; 69FA   02B8 0000 0058
L_69FD:
        MVO     R0,     G_0342                  ; 69FD   0240 0342
        MVII    #$0006, R0                      ; 69FF   02B8 0006
        MVII    #$00D2, R3                      ; 6A01   02BB 00D2
        MVII    #$0013, R4                      ; 6A03   02BC 0013
L_6A05:
        PSHR    R0                              ; 6A05   0270
        MVO     R4,     G_0174                  ; 6A06   0244 0174
        MVI     G_018C, R0                      ; 6A08   0280 018C
        MVI     G_018D, R1                      ; 6A0A   0281 018D

        JSR     R5,     L_57AB                  ; 6A0C   0004 0154 03AB

        MVI     G_034F, R0                      ; 6A0F   0280 034F
        ANDI    #$0080, R0                      ; 6A11   03B8 0080
        BNEQ    L_6A18                          ; 6A13   020C 0003

        JSR     R5,     L_6E51                  ; 6A15   0004 016C 0251

L_6A18:
        PULR    R0                              ; 6A18   02B0

L_6A19:
        JSR     R5,     L_6379                  ; 6A19   0004 0160 0379

L_6A1C:
        MVI     G_0342, R0                      ; 6A1C   0280 0342
        MVI     G_0344, R1                      ; 6A1E   0281 0344
        SWAP    R0,     1                       ; 6A20   0040
        SUBI    #$0001, R0                      ; 6A21   0338 0001
        ANDI    #$00FF, R0                      ; 6A23   03B8 00FF
        SWAP    R1,     1                       ; 6A25   0041
        ANDI    #$007F, R1                      ; 6A26   03B9 007F
        XORI    #$0200, R0                      ; 6A28   03F8 0200
        MOVR    R1,     R5                      ; 6A2A   008D
        MVI     G_0346, R2                      ; 6A2B   0282 0346
        SLL     R2,     1                       ; 6A2D   004A
        SWAP    R2,     1                       ; 6A2E   0042
        ANDI    #$00FF, R2                      ; 6A2F   03BA 00FF
        SUBR    R2,     R1                      ; 6A31   0111
        BPL     L_6A35                          ; 6A32   0203 0001

        CLRR    R1                              ; 6A34   01C9
L_6A35:
        SUBI    #$0008, R1                      ; 6A35   0339 0008
        SUBI    #$0008, R5                      ; 6A37   033D 0008
        XORI    #$0100, R5                      ; 6A39   03FD 0100
        XORI    #$0080, R1                      ; 6A3B   03F9 0080
        MVO     R0,     G_0319                  ; 6A3D   0240 0319
        MVO     R1,     G_0321                  ; 6A3F   0241 0321
        MVO     R0,     G_0320                  ; 6A41   0240 0320
        MVO     R5,     G_0328                  ; 6A43   0245 0328
        B       L_6A4F                          ; 6A45   0200 0008

L_6A47:
        JSR     R5,     L_6BF1                  ; 6A47   0004 0168 03F1
        JSR     R5,     L_6DCC                  ; 6A4A   0004 016C 01CC

        B       L_6A1C                          ; 6A4D   0220 0032

L_6A4F:
        MVI     G_034F, R0                      ; 6A4F   0280 034F
        MOVR    R0,     R1                      ; 6A51   0081
        ANDI    #$0080, R1                      ; 6A52   03B9 0080
        BNEQ    L_6BDB                          ; 6A54   020C 0185

        MOVR    R0,     R1                      ; 6A56   0081
        ANDI    #$0100, R1                      ; 6A57   03B9 0100
        BEQ     L_6BDB                          ; 6A59   0204 0180

        MOVR    R0,     R1                      ; 6A5B   0081
        ANDI    #$0003, R1                      ; 6A5C   03B9 0003
        CMPI    #$0003, R1                      ; 6A5E   0379 0003
        BEQ     L_6BDB                          ; 6A60   0204 0179

        ANDI    #$0008, R0                      ; 6A62   03B8 0008
        SLR     R0,     2                       ; 6A64   0064
        SLR     R0,     1                       ; 6A65   0060
        MVI     G_0175, R1                      ; 6A66   0281 0175
        ANDI    #$0001, R1                      ; 6A68   03B9 0001
        MVII    #$018E, R4                      ; 6A6A   02BC 018E
        XORR    R1,     R0                      ; 6A6C   01C8
        BEQ     L_6A71                          ; 6A6D   0204 0002

        MVII    #$01BE, R4                      ; 6A6F   02BC 01BE
L_6A71:
        CLRR    R3                              ; 6A71   01DB
        MVO     R0,     G_0179                  ; 6A72   0240 0179
L_6A74:
        MVO     R3,     G_017B                  ; 6A74   0243 017B
        MVO     R4,     G_0350                  ; 6A76   0244 0350
        MVII    #$0182, R2                      ; 6A78   02BA 0182
        ADD     G_0179, R2                      ; 6A7A   02C2 0179
        CMP@    R2,     R3                      ; 6A7C   0353
        BEQ     L_6BD0                          ; 6A7D   0204 0151

        ADDI    #$0007, R4                      ; 6A7F   02FC 0007
        MVI@    R4,     R0                      ; 6A81   02A0

        JSR     R5,     L_5944                  ; 6A82   0004 0158 0144
        BIDECLE $6BE2                           ; 6A85   00E2 006B

        BNEQ    L_6BD0                          ; 6A87   020C 0147

        MVO     R0,     G_017A                  ; 6A89   0240 017A
        MVI     G_0350, R5                      ; 6A8B   0285 0350
        MVI@    R5,     R2                      ; 6A8D   02AA
        MVO     R2,     G_0178                  ; 6A8E   0242 0178
        MVI@    R5,     R2                      ; 6A90   02AA
        MVI@    R5,     R3                      ; 6A91   02AB
        MVI     G_0342, R0                      ; 6A92   0280 0342
        MVI     G_0344, R1                      ; 6A94   0281 0344
        SWAP    R0,     1                       ; 6A96   0040
        SWAP    R1,     1                       ; 6A97   0041
        ANDI    #$00FF, R0                      ; 6A98   03B8 00FF
        ANDI    #$00FF, R1                      ; 6A9A   03B9 00FF

        JSR     R5,     L_58A6                  ; 6A9C   0004 0158 00A6

        MVI     G_017A, R5                      ; 6A9F   0285 017A
        CMPI    #$001E, R5                      ; 6AA1   037D 001E
        BEQ     L_6AB1                          ; 6AA3   0204 000C

        MVII    #$018A, R4                      ; 6AA5   02BC 018A
        ADD     G_0179, R4                      ; 6AA7   02C4 0179
        MVI@    R4,     R4                      ; 6AA9   02A4
        ADDR    R7,     R4                      ; 6AAA   00FC
        ADDI    #$0131, R4                      ; 6AAB   02FC 0131
        MVI@    R4,     R4                      ; 6AAD   02A4
        CMPR    R4,     R0                      ; 6AAE   0160
        BGT     L_6BD0                          ; 6AAF   020E 011F

L_6AB1:
        MVI     G_0346, R2                      ; 6AB1   0282 0346
        SLL     R2,     1                       ; 6AB3   004A
        SWAP    R2,     1                       ; 6AB4   0042
        ANDI    #$00FF, R2                      ; 6AB5   03BA 00FF
        NEGR    R3                              ; 6AB7   0023
        ADDR    R2,     R3                      ; 6AB8   00D3
        CLRR    R2                              ; 6AB9   01D2
        MVI     G_0178, R1                      ; 6ABA   0281 0178
        ANDI    #$0007, R1                      ; 6ABC   03B9 0007
        DECR    R1                              ; 6ABE   0011
        BMI     L_6ACA                          ; 6ABF   020B 0009

        SLL     R1,     1                       ; 6AC1   0049
        PSHR    R1                              ; 6AC2   0271
        SLL     R1,     2                       ; 6AC3   004D
        ADD@    R6,     R1                      ; 6AC4   02F1
        ADDI    #$0107, R1                      ; 6AC5   02F9 0107
        ADDI    #$0007, R1                      ; 6AC7   02F9 0007
        MVI@    R1,     R2                      ; 6AC9   028A
L_6ACA:
        SUBR    R2,     R3                      ; 6ACA   0113
        BMI     L_6BD0                          ; 6ACB   020B 0103

        MVI     G_017A, R1                      ; 6ACD   0281 017A
        SUBI    #$0015, R1                      ; 6ACF   0339 0015
        SLL     R1,     1                       ; 6AD1   0049
        MOVR    R1,     R5                      ; 6AD2   008D
        ADDR    R7,     R5                      ; 6AD3   00FD
        ADDI    #$021D, R5                      ; 6AD4   02FD 021D
        CMP@    R5,     R3                      ; 6AD6   036B
        BLT     L_6BD0                          ; 6AD7   0205 00F7

        CMP@    R5,     R3                      ; 6AD9   036B
        BGT     L_6BD0                          ; 6ADA   020E 00F4

        JSR     R5,     L_6D81                  ; 6ADC   0004 016C 0181

        MVI     G_017B, R0                      ; 6ADF   0280 017B

        JSR     R5,     L_6D44                  ; 6AE1   0004 016C 0144
        DECLE   $0273,  $0004                   ; 6AE4   0273 0004

        ANDR    R5,     R0                      ; 6AE6   01A8
        XOR@    R2,     R1                      ; 6AE7   03D1
        PULR    R3                              ; 6AE8   02B3

        JSR     R5,     L_6D31                  ; 6AE9   0004 016C 0131

        MOVR    R5,     R2                      ; 6AEC   00AA
        ADDI    #$0184, R2                      ; 6AED   02FA 0184
        ADD     G_0179, R2                      ; 6AEF   02C2 0179
        MVI     G_0350, R4                      ; 6AF1   0284 0350
        MOVR    R4,     R1                      ; 6AF3   00A1
        ADDI    #$0007, R1                      ; 6AF4   02F9 0007
        MVI@    R1,     R1                      ; 6AF6   0289
        SUBI    #$0015, R1                      ; 6AF7   0339 0015
        CMPI    #$000D, R1                      ; 6AF9   0379 000D
        BLE     L_6AFF                          ; 6AFB   0206 0002

        MVII    #$000D, R1                      ; 6AFD   02B9 000D
L_6AFF:
        INCR    R1                              ; 6AFF   0009
        ADDR    R7,     R1                      ; 6B00   00F9
        ADD@    R1,     R7                      ; 6B01   02CF

        INCR    R6                              ; 6B02   000E
L_6B03:
        DECR    R7                              ; 6B03   0017
L_6B04:
        DECR    R7                              ; 6B04   0017
L_6B05:
        DECR    R7                              ; 6B05   0017
L_6B06:
        DECR    R7                              ; 6B06   0017

        MOVR    R1,     R4                      ; 6B07   008C
        MOVR    R1,     R4                      ; 6B08   008C
        NOP                                     ; 6B09   0034
        SLLC    R2,     1                       ; 6B0A   005A
        MOVR    R2,     R5                      ; 6B0B   0095
        SAR     R1,     2                       ; 6B0C   006D
        MOVR    R2,     R0                      ; 6B0D   0090
        MOVR    R2,     R0                      ; 6B0E   0090
        MOVR    R2,     R0                      ; 6B0F   0090
        MVI     G_0178, R0                      ; 6B10   0280 0178
        ANDI    #$0007, R0                      ; 6B12   03B8 0007
        BNEQ    L_6B19                          ; 6B14   020C 0003

        JSR     R5,     L_6D77                  ; 6B16   0004 016C 0177

L_6B19:
        MVI     G_034F, R0                      ; 6B19   0280 034F
        ANDI    #$0003, R0                      ; 6B1B   03B8 0003
        DECR    R0                              ; 6B1D   0010
        BEQ     L_6B26                          ; 6B1E   0204 0006

        MVII    #$0025, R0                      ; 6B20   02B8 0025
        CMPI    #$000A, R3                      ; 6B22   037B 000A
        BGT     L_6B2E                          ; 6B24   020E 0008

L_6B26:
        MVII    #$0023, R0                      ; 6B26   02B8 0023
        CMPI    #$0005, R3                      ; 6B28   037B 0005
        BGT     L_6B2E                          ; 6B2A   020E 0002

        MVII    #$0024, R0                      ; 6B2C   02B8 0024

L_6B2E:
        JSR     R5,     L_67E2                  ; 6B2E   0004 0164 03E2
        JSR     R5,     L_67F8                  ; 6B31   0004 0164 03F8

        B       L_6B97                          ; 6B34   0200 0061

        MVII    #$000A, R3                      ; 6B36   02BB 000A
        MVI     G_0178, R1                      ; 6B38   0281 0178
        ANDI    #$0007, R1                      ; 6B3A   03B9 0007
        DECR    R1                              ; 6B3C   0011
        SLL     R1,     1                       ; 6B3D   0049
        PSHR    R1                              ; 6B3E   0271
        SLL     R1,     2                       ; 6B3F   004D
        ADD@    R6,     R1                      ; 6B40   02F1
        MOVR    R1,     R5                      ; 6B41   008D
        ADDI    #$0107, R5                      ; 6B42   02FD 0107
        ADDI    #$0002, R5                      ; 6B44   02FD 0002
        CLRR    R0                              ; 6B46   01C0
        SDBD                                    ; 6B47   0001
        MVI@    R5,     R1                      ; 6B48   02A9
        TSTR    R1                              ; 6B49   0089
        BEQ     L_6B4D                          ; 6B4A   0204 0001

        INCR    R0                              ; 6B4C   0008
L_6B4D:
        SDBD                                    ; 6B4D   0001
        MVI@    R5,     R1                      ; 6B4E   02A9
        TSTR    R1                              ; 6B4F   0089
        BEQ     L_6B53                          ; 6B50   0204 0001

        INCR    R0                              ; 6B52   0008
L_6B53:
        TSTR    R0                              ; 6B53   0080
        BEQ     L_6B58                          ; 6B54   0204 0002

        MVII    #$000F, R3                      ; 6B56   02BB 000F
L_6B58:
        MVII    #$0027, R0                      ; 6B58   02B8 0027
        B       L_6B60                          ; 6B5A   0200 0004

        MVII    #$0028, R0                      ; 6B5C   02B8 0028
        MVII    #$000B, R3                      ; 6B5E   02BB 000B
L_6B60:
        MVI@    R2,     R5                      ; 6B60   0295
        ANDI    #$0080, R5                      ; 6B61   03BD 0080
        BNEQ    L_6B68                          ; 6B63   020C 0003

        MVII    #$0026, R0                      ; 6B65   02B8 0026
        CLRR    R3                              ; 6B67   01DB
L_6B68:
        MVO     R3,     G_0188                  ; 6B68   0243 0188

        JSR     R5,     L_67E2                  ; 6B6A   0004 0164 03E2

        B       L_6B97                          ; 6B6D   0200 0028

        JSR     R5,     L_6D77                  ; 6B6F   0004 016C 0177

        MVII    #$000C, R0                      ; 6B72   02B8 000C
        CMPI    #$000F, R3                      ; 6B74   037B 000F
        BGE     L_6B7D                          ; 6B76   020D 0005

        JSR     R5,     L_6D60                  ; 6B78   0004 016C 0160

        MVII    #$000D, R0                      ; 6B7B   02B8 000D
L_6B7D:
        MVO     R0,     G_0188                  ; 6B7D   0240 0188
        MVI     G_034F, R0                      ; 6B7F   0280 034F
        MOVR    R0,     R1                      ; 6B81   0081
        ANDI    #$0003, R0                      ; 6B82   03B8 0003
        XORR    R0,     R1                      ; 6B84   01C1
        DECR    R0                              ; 6B85   0010
        BPL     L_6B89                          ; 6B86   0203 0001

        CLRR    R0                              ; 6B88   01C0
L_6B89:
        XORR    R0,     R1                      ; 6B89   01C1
        MVO     R1,     G_034F                  ; 6B8A   0241 034F
        B       L_6B97                          ; 6B8C   0200 0009

        MVII    #$000E, R0                      ; 6B8E   02B8 000E
        MVO     R0,     G_0188                  ; 6B90   0240 0188

        JSR     R5,     L_6D77                  ; 6B92   0004 016C 0177

        B       L_6B97                          ; 6B95   0200 0000

L_6B97:
        MVI@    R2,     R0                      ; 6B97   0290
        MOVR    R0,     R3                      ; 6B98   0083
        ANDI    #$007F, R0                      ; 6B99   03B8 007F
        XORR    R0,     R3                      ; 6B9B   01C3
        DECR    R0                              ; 6B9C   0010
        BPL     L_6BA4                          ; 6B9D   0203 0005

        MVII    #$0009, R0                      ; 6B9F   02B8 0009

        JSR     R5,     X_RAND2                 ; 6BA1   0004 0114 029E
L_6BA4:
        JSR     R5,     L_6C82                  ; 6BA4   0004 016C 0082

        MVII    #$0005, R0                      ; 6BA7   02B8 0005
        MVI     G_0350, R1                      ; 6BA9   0281 0350
        ADDI    #$0007, R1                      ; 6BAB   02F9 0007
        MVI@    R1,     R1                      ; 6BAD   0289
        CMPI    #$0027, R1                      ; 6BAE   0379 0027
        BEQ     L_6BB6                          ; 6BB0   0204 0004

        CMPI    #$001F, R1                      ; 6BB2   0379 001F
        BNEQ    L_6BB8                          ; 6BB4   020C 0002

L_6BB6:
        MVII    #$0012, R0                      ; 6BB6   02B8 0012

L_6BB8:
        JSR     R5,     L_6379                  ; 6BB8   0004 0160 0379

        CLRR    R0                              ; 6BBB   01C0
        MVO     R0,     G_0188                  ; 6BBC   0240 0188

        JSR     R5,     L_6E51                  ; 6BBE   0004 016C 0251
        DECLE   $0004                           ; 6BC1   0004

        ANDR    R5,     R4                      ; 6BC2   01AC
        MVO@    R0,     R1                      ; 6BC3   0248
        BEQ     L_6BCF                          ; 6BC4   0204 0009

        JSR     R5,     L_6D31                  ; 6BC6   0004 016C 0131

        ADDI    #$0184, R5                      ; 6BC9   02FD 0184
        ADD     G_0179, R5                      ; 6BCB   02C5 0179
        CLRR    R0                              ; 6BCD   01C0
        MVO@    R0,     R5                      ; 6BCE   0268
L_6BCF:
        PULR    R7                              ; 6BCF   02B7

L_6BD0:
        MVI     G_017B, R3                      ; 6BD0   0283 017B
        MVI     G_0350, R4                      ; 6BD2   0284 0350
        ADDI    #$0008, R4                      ; 6BD4   02FC 0008
        INCR    R3                              ; 6BD6   000B
        CMPI    #$0006, R3                      ; 6BD7   037B 0006
        BLT     L_6A74                          ; 6BD9   0225 0166
L_6BDB:
        PULR    R7                              ; 6BDB   02B7

        DECLE   $0003,  $0004,  $0005,  $0005   ; 6BDC   0003 0004 0005 0005

        CLRC                                    ; 6BE0   0006
        SETC                                    ; 6BE1   0007
        INCR    R6                              ; 6BE2   000E
        DECR    R5                              ; 6BE3   0015
        DECR    R6                              ; 6BE4   0016
L_6BE5:
        DECR    R7                              ; 6BE5   0017

        DECLE   $001A,  $001B,  $0018,  $0019   ; 6BE6   001A 001B 0018 0019
        DECLE   $001C,  $001D,  $001E,  $001F   ; 6BEA   001C 001D 001E 001F

        NEGR    R0                              ; 6BEE   0020
        NEGR    R1                              ; 6BEF   0021
        NEGR    R2                              ; 6BF0   0022
L_6BF1:
        PSHR    R5                              ; 6BF1   0275
        MVI     G_0173, R5                      ; 6BF2   0285 0173
        CMPI    #$0007, R5                      ; 6BF4   037D 0007
        BEQ     L_6C81                          ; 6BF6   0204 0089

        MVII    #$0007, R5                      ; 6BF8   02BD 0007
        MVO     R5,     G_0173                  ; 6BFA   0245 0173
        CLRR    R0                              ; 6BFC   01C0
        MVO     R0,     G_0353                  ; 6BFD   0240 0353
        MVO     R0,     G_0354                  ; 6BFF   0240 0354

        JSR     R5,     L_511C                  ; 6C01   0004 0150 011C
        DECLE   $0041                           ; 6C04   0041
        BIDECLE $654B                           ; 6C05   004B 0065

        MVI     G_0352, R0                      ; 6C07   0280 0352
        ANDI    #$000C, R0                      ; 6C09   03B8 000C
        BEQ     L_6C21                          ; 6C0B   0204 0014

        SDBD                                    ; 6C0D   0001
        MVII    #$66EA, R5                      ; 6C0E   02BD 00EA 0066
L_6C11:
        MVI@    R5,     R1                      ; 6C11   02A9
        TSTR    R1                              ; 6C12   0089
        BEQ     L_6C2B                          ; 6C13   0204 0016

        MVI@    R1,     R0                      ; 6C15   0288
        ANDI    #$007F, R0                      ; 6C16   03B8 007F
        MVO@    R0,     R1                      ; 6C18   0248
        MOVR    R1,     R4                      ; 6C19   008C
        PSHR    R5                              ; 6C1A   0275

        JSR     R5,     L_5B11                  ; 6C1B   0004 0158 0311

        PULR    R5                              ; 6C1E   02B5
        B       L_6C11                          ; 6C1F   0220 000F

L_6C21:
        MVII    #$018E, R4                      ; 6C21   02BC 018E

        JSR     R5,     L_5B16                  ; 6C23   0004 0158 0316

        MVII    #$01BE, R4                      ; 6C26   02BC 01BE

        JSR     R5,     L_5B16                  ; 6C28   0004 0158 0316

L_6C2B:
        MVII    #$00FF, R0                      ; 6C2B   02B8 00FF
        MVO     R0,     G_0180                  ; 6C2D   0240 0180
        MVO     R0,     G_0181                  ; 6C2F   0240 0181
        MVI     G_034F, R0                      ; 6C31   0280 034F
        MOVR    R0,     R5                      ; 6C33   0085
        ANDI    #$0080, R5                      ; 6C34   03BD 0080
        BNEQ    L_6C81                          ; 6C36   020C 0049

        ANDI    #$0010, R0                      ; 6C38   03B8 0010
        SLR     R0,     2                       ; 6C3A   0064
        SLR     R0,     2                       ; 6C3B   0064
        MVO     R0,     G_0179                  ; 6C3C   0240 0179
        MVI     G_0342, R0                      ; 6C3E   0280 0342
        SWAP    R0,     1                       ; 6C40   0040
        ANDI    #$00FF, R0                      ; 6C41   03B8 00FF
        MVI     G_0344, R1                      ; 6C43   0281 0344
        SWAP    R1,     1                       ; 6C45   0041
        ANDI    #$00FF, R1                      ; 6C46   03B9 00FF
        CLRR    R3                              ; 6C48   01DB
        CMPI    #$0057, R0                      ; 6C49   0378 0057
        BLT     L_6C4E                          ; 6C4B   0205 0001

        INCR    R3                              ; 6C4D   000B
L_6C4E:
        MVI     G_0175, R5                      ; 6C4E   0285 0175
        ANDI    #$0001, R5                      ; 6C50   03BD 0001
        XORR    R5,     R3                      ; 6C52   01EB
        CLRR    R4                              ; 6C53   01E4

        JSR     R5,     L_6EEF                  ; 6C54   0004 016C 02EF

        BNEQ    L_6C5E                          ; 6C57   020C 0005

        TSTR    R3                              ; 6C59   009B
        BEQ     L_6C65                          ; 6C5A   0204 0009
        B       L_6C68                          ; 6C5C   0200 000A

L_6C5E:
        INCR    R4                              ; 6C5E   000C
        MVI     G_034F, R0                      ; 6C5F   0280 034F
        ANDI    #$0010, R0                      ; 6C61   03B8 0010
        BNEQ    L_6C68                          ; 6C63   020C 0003

L_6C65:
        MVII    #$0040, R0                      ; 6C65   02B8 0040
        INCR    R7                              ; 6C67   000F

L_6C68:
        CLRR    R0                              ; 6C68   01C0
L_6C69:
        MVO     R4,     G_017A                  ; 6C69   0244 017A

        JSR     R5,     L_6EAE                  ; 6C6B   0004 016C 02AE

        MVII    #$000B, R0                      ; 6C6E   02B8 000B
        ADDR    R4,     R0                      ; 6C70   00E0

        JSR     R5,     L_6379                  ; 6C71   0004 0160 0379

        MVI     G_034F, R0                      ; 6C74   0280 034F
        ANDI    #$0020, R0                      ; 6C76   03B8 0020
        BNEQ    L_6C81                          ; 6C78   020C 0007

        MVII    #$0009, R1                      ; 6C7A   02B9 0009
        ADD     G_017A, R1                      ; 6C7C   02C1 017A

        JSR     R5,     L_5D41                  ; 6C7E   0004 015C 0141

L_6C81:
        PULR    R7                              ; 6C81   02B7

L_6C82:
        PSHR    R5                              ; 6C82   0275
        MVI     G_034F, R2                      ; 6C83   0282 034F
        ANDI    #$0008, R2                      ; 6C85   03BA 0008
        SLR     R2,     2                       ; 6C87   0066
        SLR     R2,     1                       ; 6C88   0062
        TSTR    R3                              ; 6C89   009B
        BEQ     L_6C8E                          ; 6C8A   0204 0002

        XORI    #$0001, R2                      ; 6C8C   03FA 0001
L_6C8E:
        SLL     R2,     1                       ; 6C8E   004A
        PSHR    R2                              ; 6C8F   0272
        SLL     R2,     2                       ; 6C90   004E
        SLL     R2,     1                       ; 6C91   004A
        ADD@    R6,     R2                      ; 6C92   02F2
        MOVR    R7,     R4                      ; 6C93   00BC
        ADDI    #$0079, R4                      ; 6C94   02FC 0079
        ADDR    R2,     R4                      ; 6C96   00D4
        SLL     R0,     1                       ; 6C97   0048
        ADDR    R0,     R4                      ; 6C98   00C4

L_6C99:
        JSR     R5,     L_6EB9                  ; 6C99   0004 016C 02B9

        ADD@    R4,     R0                      ; 6C9C   02E0
        ADD@    R4,     R1                      ; 6C9D   02E1
        MVI     G_0188, R3                      ; 6C9E   0283 0188
        DECR    R3                              ; 6CA0   0013
        BPL     L_6CC8                          ; 6CA1   0203 0025

        MVI     G_0342, R2                      ; 6CA3   0282 0342
        MVI     G_0344, R3                      ; 6CA5   0283 0344
        SWAP    R2,     1                       ; 6CA7   0042
        SWAP    R3,     1                       ; 6CA8   0043
        ANDI    #$00FF, R2                      ; 6CA9   03BA 00FF
        ANDI    #$00FF, R3                      ; 6CAB   03BB 00FF
        PSHR    R0                              ; 6CAD   0270
        PSHR    R1                              ; 6CAE   0271

        JSR     R5,     L_58A6                  ; 6CAF   0004 0158 00A6

        CMPI    #$0003, R0                      ; 6CB2   0378 0003
        BGT     L_6CBC                          ; 6CB4   020E 0006

        PULR    R0                              ; 6CB6   02B0
        PULR    R0                              ; 6CB7   02B0
        SUBI    #$0002, R4                      ; 6CB8   033C 0002
        B       L_6C99                          ; 6CBA   0220 0022

L_6CBC:
        SWAP    R0,     1                       ; 6CBC   0040
        MOVR    R0,     R1                      ; 6CBD   0081
        MVII    #$006E, R2                      ; 6CBE   02BA 006E

        JSR     R5,     X_DIV                   ; 6CC0   0004 011C 01FB

        MOVR    R0,     R3                      ; 6CC3   0083
        PULR    R1                              ; 6CC4   02B1
        PULR    R0                              ; 6CC5   02B0
        B       L_6CCF                          ; 6CC6   0200 0007

L_6CC8:
        SLL     R3,     1                       ; 6CC8   004B
        MOVR    R3,     R5                      ; 6CC9   009D
        ADDR    R7,     R5                      ; 6CCA   00FD
        ADDI    #$0008, R5                      ; 6CCB   02FD 0008
        SDBD                                    ; 6CCD   0001
        MVI@    R5,     R3                      ; 6CCE   02AB

L_6CCF:
        JSR     R5,     L_57AB                  ; 6CCF   0004 0154 03AB

        PULR    R7                              ; 6CD2   02B7

        DECLE   $00B9,  $0000,  $00E1,  $0000   ; 6CD3   00B9 0000 00E1 0000
        DECLE   $0009,  $0001,  $0031,  $0001   ; 6CD7   0009 0001 0031 0001
        DECLE   $0059,  $0001,  $0081,  $0001   ; 6CDB   0059 0001 0081 0001
        DECLE   $00A9,  $0001,  $00D1,  $0001   ; 6CDF   00A9 0001 00D1 0001
        DECLE   $00F4,  $0001,  $00EE,  $0002   ; 6CE3   00F4 0001 00EE 0002
        DECLE   $00C8,  $0000,  $00DC,  $0000   ; 6CE7   00C8 0000 00DC 0000
        DECLE   $005E,  $0001,  $002C,  $0001   ; 6CEB   005E 0001 002C 0001
        DECLE   $0078,  $0005,  $0002,  $000B   ; 6CEF   0078 0005 0002 000B
        DECLE   $0002,  $000B,  $0002,  $000B   ; 6CF3   0002 000B 0002 000B
        DECLE   $0002,  $000B,  $0002,  $000B   ; 6CF7   0002 000B 0002 000B
        DECLE   $0004,  $000A,  $0004           ; 6CFB   0004 000A 0004

        INCR    R2                              ; 6CFE   000A
        INCR    R2                              ; 6CFF   000A
        DECR    R2                              ; 6D00   0012
        INCR    R2                              ; 6D01   000A
        DECR    R2                              ; 6D02   0012
        INCR    R7                              ; 6D03   000F

        DECR    R1                              ; 6D04   0011
L_6D05:
        INCR    R0                              ; 6D05   0008
        DECLE   $0010,  $0001,  $0008,  $0001   ; 6D06   0010 0001 0008 0001
        DECLE   $0008,  $0001,  $0008,  $0029   ; 6D0A   0008 0001 0008 0029
        DECLE   $0037,  $003C,  $0038,  $004F   ; 6D0E   0037 003C 0038 004F
        DECLE   $0038,  $0023,  $0048,  $003A   ; 6D12   0038 0023 0048 003A
        DECLE   $0048,  $004E,  $0047,  $001F   ; 6D16   0048 004E 0047 001F
        DECLE   $0058,  $0037                   ; 6D1A   0058 0037

        SLLC    R2,     1                       ; 6D1C   005A
        SLL     R1,     2                       ; 6D1D   004D
        SLLC    R2,     1                       ; 6D1E   005A
        SLR     R1,     1                       ; 6D1F   0061
        RSWD    R0                              ; 6D20   0038
        RRC     R0,     2                       ; 6D21   0074
        RSWD    R0                              ; 6D22   0038
        MOVR    R0,     R7                      ; 6D23   0087

        DECLE   $0037                           ; 6D24   0037

        SLR     R2,     1                       ; 6D25   0062
        SWAP    R3,     2                       ; 6D26   0047
        RRC     R2,     2                       ; 6D27   0076
        SLL     R0,     1                       ; 6D28   0048
        MOVR    R1,     R5                      ; 6D29   008D
        SLL     R0,     1                       ; 6D2A   0048
        SLR     R3,     1                       ; 6D2B   0063
        SLLC    R2,     1                       ; 6D2C   005A
        SARC    R1,     1                       ; 6D2D   0079
        SLLC    R2,     1                       ; 6D2E   005A
        MOVR    R2,     R1                      ; 6D2F   0091
        SLLC    R0,     1                       ; 6D30   0058
L_6D31:
        PSHR    R5                              ; 6D31   0275
        DECLE   $0270,  $01ED,  $0275,  $0004   ; 6D32   0270 01ED 0275 0004

        ANDR    R5,     R4                      ; 6D36   01AC
        MVO@    R0,     R4                      ; 6D37   0260
        PULR    R5                              ; 6D38   02B5
        BNEQ    L_6D42                          ; 6D39   020C 0007

        MVI     G_017B, R0                      ; 6D3B   0280 017B
        TSTR    R0                              ; 6D3D   0080
        BEQ     L_6D42                          ; 6D3E   0204 0002

        MVII    #$0002, R5                      ; 6D40   02BD 0002
L_6D42:
        PULR    R0                              ; 6D42   02B0
        PULR    R7                              ; 6D43   02B7

L_6D44:
        PSHR    R5                              ; 6D44   0275
        MVII    #$0182, R5                      ; 6D45   02BD 0182
        ADD     G_0179, R5                      ; 6D47   02C5 0179
        MVO@    R0,     R5                      ; 6D49   0268
        PULR    R7                              ; 6D4A   02B7

L_6D4B:
        PSHR    R1                              ; 6D4B   0271
        MVI@    R5,     R1                      ; 6D4C   02A9
        PSHR    R1                              ; 6D4D   0271
        COMR    R1                              ; 6D4E   0019
        AND     G_034F, R1                      ; 6D4F   0381 034F
        XOR@    R6,     R1                      ; 6D51   03F1
        MVO     R1,     G_034F                  ; 6D52   0241 034F
        PULR    R1                              ; 6D54   02B1
        MOVR    R5,     R7                      ; 6D55   00AF

L_6D56:
        MVO     R0,     G_0188                  ; 6D56   0240 0188
        MOVR    R5,     R7                      ; 6D58   00AF

        CLRR    R0                              ; 6D59   01C0
L_6D5A:
        PSHR    R5                              ; 6D5A   0275
        PSHR    R1                              ; 6D5B   0271
        MVII    #$0080, R1                      ; 6D5C   02B9 0080
        B       L_6D68                          ; 6D5E   0200 0008

L_6D60:
        MVII    #$0080, R0                      ; 6D60   02B8 0080
        INCR    R7                              ; 6D62   000F

        CLRR    R0                              ; 6D63   01C0
L_6D64:
        PSHR    R5                              ; 6D64   0275
        PSHR    R1                              ; 6D65   0271
        MVII    #$007F, R1                      ; 6D66   02B9 007F

L_6D68:
        JSR     R5,     L_6D31                  ; 6D68   0004 016C 0131

        ADDI    #$0184, R5                      ; 6D6B   02FD 0184
        ADD     G_0179, R5                      ; 6D6D   02C5 0179
        PSHR    R0                              ; 6D6F   0270
        MVI@    R5,     R0                      ; 6D70   02A8
        ANDR    R1,     R0                      ; 6D71   0188
        XOR@    R6,     R0                      ; 6D72   03F0
        DECR    R5                              ; 6D73   0015
        MVO@    R0,     R5                      ; 6D74   0268
        PULR    R1                              ; 6D75   02B1
        PULR    R7                              ; 6D76   02B7

L_6D77:
        PSHR    R5                              ; 6D77   0275
        MVII    #$0009, R0                      ; 6D78   02B8 0009

        JSR     R5,     X_RAND2                 ; 6D7A   0004 0114 029E
        JSR     R5,     L_6D5A                  ; 6D7D   0004 016C 015A

        PULR    R7                              ; 6D80   02B7

L_6D81:
        PSHR    R5                              ; 6D81   0275
        MVI     G_034F, R0                      ; 6D82   0280 034F
        MOVR    R0,     R5                      ; 6D84   0085
        ANDI    #$0003, R0                      ; 6D85   03B8 0003
        XORR    R0,     R5                      ; 6D87   01C5
        INCR    R0                              ; 6D88   0008
        PSHR    R0                              ; 6D89   0270
        ANDI    #$0003, R0                      ; 6D8A   03B8 0003
        XORR    R0,     R5                      ; 6D8C   01C5
        SDBD                                    ; 6D8D   0001
        ANDI    #$FFEF, R5                      ; 6D8E   03BD 00EF 00FF
        MOVR    R5,     R0                      ; 6D91   00A8
        ANDI    #$0008, R0                      ; 6D92   03B8 0008
        SLR     R0,     2                       ; 6D94   0064
        SLR     R0,     1                       ; 6D95   0060
        PSHR    R0                              ; 6D96   0270
        MVI     G_0175, R0                      ; 6D97   0280 0175
        ANDI    #$0001, R0                      ; 6D99   03B8 0001
        XOR@    R6,     R0                      ; 6D9B   03F0
        BEQ     L_6DA0                          ; 6D9C   0204 0002

        XORI    #$0010, R5                      ; 6D9E   03FD 0010
L_6DA0:
        MVO     R5,     G_034F                  ; 6DA0   0245 034F
        PULR    R0                              ; 6DA2   02B0
        CMPI    #$0004, R0                      ; 6DA3   0378 0004
        BLT     L_6DAC                          ; 6DA5   0205 0005

        JSR     R5,     L_6D4B                  ; 6DA7   0004 016C 014B
        DECLE   $0080                           ; 6DAA   0080

        PULR    R7                              ; 6DAB   02B7

L_6DAC:
        CMPI    #$0003, R0                      ; 6DAC   0378 0003
        DECLE   $020C,  $0008,  $0004           ; 6DAE   020C 0008 0004

        ANDR    R5,     R4                      ; 6DB1   01AC
        MVO@    R0,     R4                      ; 6DB2   0260
        BEQ     L_6DB9                          ; 6DB3   0204 0004

        JSR     R5,     L_6D60                  ; 6DB5   0004 016C 0160

        PULR    R7                              ; 6DB8   02B7

L_6DB9:
        PSHR    R1                              ; 6DB9   0271
        MVII    #$0184, R1                      ; 6DBA   02B9 0184
        ADDR    R5,     R1                      ; 6DBC   00E9
        MVII    #$0002, R5                      ; 6DBD   02BD 0002
L_6DBF:
        MVI@    R1,     R0                      ; 6DBF   0288
        ANDI    #$007F, R0                      ; 6DC0   03B8 007F
        XORI    #$0080, R0                      ; 6DC2   03F8 0080
        MVO@    R0,     R1                      ; 6DC4   0248
        ADDI    #$0002, R1                      ; 6DC5   02F9 0002
        DECR    R5                              ; 6DC7   0015
        BNEQ    L_6DBF                          ; 6DC8   022C 000A

        PULR    R1                              ; 6DCA   02B1
        PULR    R7                              ; 6DCB   02B7

L_6DCC:
        CLRR    R2                              ; 6DCC   01D2
        MVO     R2,     G_0344                  ; 6DCD   0242 0344
        MVO     R2,     G_0346                  ; 6DCF   0242 0346
        MVO     R2,     G_0348                  ; 6DD1   0242 0348
        NOP                                     ; 6DD3   0034
        MVO     R2,     G_0343                  ; 6DD4   0242 0343
        MVO     R2,     G_0345                  ; 6DD6   0242 0345
        MVO     R2,     G_0347                  ; 6DD8   0242 0347
        SDBD                                    ; 6DDA   0001
        MVII    #$5600, R0                      ; 6DDB   02B8 0000 0056
        MVO     R0,     G_0342                  ; 6DDE   0240 0342
        MVI     G_034F, R0                      ; 6DE0   0280 034F
        ANDI    #$02FF, R0                      ; 6DE2   03B8 02FF
        MVO     R0,     G_034F                  ; 6DE4   0240 034F
        MOVR    R5,     R7                      ; 6DE6   00AF

L_6DE7:
        PSHR    R5                              ; 6DE7   0275
        PSHR    R4                              ; 6DE8   0274
        MVII    #$0182, R2                      ; 6DE9   02BA 0182
        CLRR    R5                              ; 6DEB   01ED
        CMPI    #$01BE, R4                      ; 6DEC   037C 01BE
        BLT     L_6DF2                          ; 6DEE   0205 0002

        INCR    R2                              ; 6DF0   000A
        INCR    R5                              ; 6DF1   000D
L_6DF2:
        MVI     G_018C, R0                      ; 6DF2   0280 018C
        CLRR    R3                              ; 6DF4   01DB
        CMPI    #$0057, R0                      ; 6DF5   0378 0057
        BLT     L_6DFA                          ; 6DF7   0205 0001

        INCR    R3                              ; 6DF9   000B
L_6DFA:
        CLRR    R1                              ; 6DFA   01C9
        CMPR    R5,     R3                      ; 6DFB   016B
        BNEQ    L_6DFF                          ; 6DFC   020C 0001

        INCR    R1                              ; 6DFE   0009
L_6DFF:
        MVO     R1,     G_034D                  ; 6DFF   0241 034D
        MVII    #$00FF, R0                      ; 6E01   02B8 00FF
        MVO     R0,     G_017A                  ; 6E03   0240 017A
        SWAP    R0,     2                       ; 6E05   0044
        MVO     R0,     G_0351                  ; 6E06   0240 0351
        CLRR    R3                              ; 6E08   01DB
        INCR    R4                              ; 6E09   000C
L_6E0A:
        CMP@    R2,     R3                      ; 6E0A   0353
        BEQ     L_6E46                          ; 6E0B   0204 0039

        MOVR    R4,     R5                      ; 6E0D   00A5
        MVI@    R5,     R0                      ; 6E0E   02A8
        MVI@    R5,     R1                      ; 6E0F   02A9
        INCR    R5                              ; 6E10   000D
        MVI@    R5,     R5                      ; 6E11   02AD
        TSTR    R5                              ; 6E12   00AD
        BEQ     L_6E46                          ; 6E13   0204 0031

        PSHR    R2                              ; 6E15   0272
        PSHR    R3                              ; 6E16   0273
        MVI     G_018C, R2                      ; 6E17   0282 018C
        MVI     G_018D, R3                      ; 6E19   0283 018D

        JSR     R5,     L_58A6                  ; 6E1B   0004 0158 00A6

        PULR    R3                              ; 6E1E   02B3
        PULR    R2                              ; 6E1F   02B2
        CMP     G_0351, R0                      ; 6E20   0340 0351
        BC      L_6E46                          ; 6E22   0201 0022

        MVI     G_034D, R5                      ; 6E24   0285 034D
        TSTR    R5                              ; 6E26   00AD
        BEQ     L_6E42                          ; 6E27   0204 0019

        MVI     G_0352, R5                      ; 6E29   0285 0352
        ANDI    #$0080, R5                      ; 6E2B   03BD 0080
        BEQ     L_6E34                          ; 6E2D   0204 0005

        MVII    #$00FF, R5                      ; 6E2F   02BD 00FF
        CMP@    R2,     R5                      ; 6E31   0355
        BNEQ    L_6E42                          ; 6E32   020C 000E

L_6E34:
        PSHR    R0                              ; 6E34   0270
        PSHR    R4                              ; 6E35   0274
        ADDI    #$0006, R4                      ; 6E36   02FC 0006
        MVI@    R4,     R0                      ; 6E38   02A0

        JSR     R5,     L_5944                  ; 6E39   0004 0158 0144
        BIDECLE $53D1                           ; 6E3C   00D1 0053

        PULR    R4                              ; 6E3E   02B4
        PULR    R0                              ; 6E3F   02B0
        BEQ     L_6E46                          ; 6E40   0204 0004

L_6E42:
        MVO     R3,     G_017A                  ; 6E42   0243 017A
        MVO     R0,     G_0351                  ; 6E44   0240 0351
L_6E46:
        ADDI    #$0008, R4                      ; 6E46   02FC 0008
        INCR    R3                              ; 6E48   000B
        CMPI    #$0006, R3                      ; 6E49   037B 0006
        BLT     L_6E0A                          ; 6E4B   0225 0042

        MVI     G_017A, R0                      ; 6E4D   0280 017A
        PULR    R4                              ; 6E4F   02B4
        PULR    R7                              ; 6E50   02B7

L_6E51:
        PSHR    R5                              ; 6E51   0275
        DECLE   $0280,  $0179,  $0270,  $01C0   ; 6E52   0280 0179 0270 01C0
        DECLE   $0240,  $0179,  $0004           ; 6E56   0240 0179 0004

        ANDR    R5,     R4                      ; 6E59   01AC
        MVO@    R0,     R4                      ; 6E5A   0260
        BEQ     L_6E78                          ; 6E5B   0204 001B

        MVII    #$018E, R4                      ; 6E5D   02BC 018E

        JSR     R5,     L_6DE7                  ; 6E5F   0004 016C 01E7
        DECLE   $0340,  $0180,  $0204,  $000A   ; 6E62   0340 0180 0204 000A

        PSHR    R0                              ; 6E66   0270

        JSR     R5,     L_5B16                  ; 6E67   0004 0158 0316

        PULR    R0                              ; 6E6A   02B0
        MVO     R0,     G_0180                  ; 6E6B   0240 0180

        JSR     R5,     L_5B46                  ; 6E6D   0004 0158 0346
        DECLE   $0004                           ; 6E70   0004

        ANDR    R5,     R4                      ; 6E71   01AC
        MVO@    R0,     R1                      ; 6E72   0248
        BNEQ    L_6E78                          ; 6E73   020C 0003

        JSR     R5,     L_6EA0                  ; 6E75   0004 016C 02A0

L_6E78:
        MVII    #$0001, R0                      ; 6E78   02B8 0001
        DECLE   $0240,  $0179,  $0004           ; 6E7A   0240 0179 0004

        ANDR    R5,     R4                      ; 6E7D   01AC
        MVO@    R0,     R4                      ; 6E7E   0260
        BEQ     L_6E9C                          ; 6E7F   0204 001B

        MVII    #$01BE, R4                      ; 6E81   02BC 01BE

        JSR     R5,     L_6DE7                  ; 6E83   0004 016C 01E7
        DECLE   $0340,  $0181,  $0204,  $000A   ; 6E86   0340 0181 0204 000A

        PSHR    R0                              ; 6E8A   0270

        JSR     R5,     L_5B16                  ; 6E8B   0004 0158 0316

        PULR    R0                              ; 6E8E   02B0
        MVO     R0,     G_0181                  ; 6E8F   0240 0181

        JSR     R5,     L_5B46                  ; 6E91   0004 0158 0346
        DECLE   $0004                           ; 6E94   0004

        ANDR    R5,     R4                      ; 6E95   01AC
        MVO@    R0,     R1                      ; 6E96   0248
        BNEQ    L_6E9C                          ; 6E97   020C 0003

        JSR     R5,     L_6EA0                  ; 6E99   0004 016C 02A0

L_6E9C:
        PULR    R0                              ; 6E9C   02B0
        MVO     R0,     G_0179                  ; 6E9D   0240 0179
        PULR    R7                              ; 6E9F   02B7

L_6EA0:
        MVI     G_0352, R0                      ; 6EA0   0280 0352
        ANDI    #$0080, R0                      ; 6EA2   03B8 0080
        BEQ     L_6EAD                          ; 6EA4   0204 0007

        MVII    #$0357, R1                      ; 6EA6   02B9 0357
        ADD     G_0179, R1                      ; 6EA8   02C1 0179
        MVII    #$0001, R0                      ; 6EAA   02B8 0001
        MVO@    R0,     R1                      ; 6EAC   0248
L_6EAD:
        MOVR    R5,     R7                      ; 6EAD   00AF

L_6EAE:
        PSHR    R0                              ; 6EAE   0270
        MVI     G_034F, R0                      ; 6EAF   0280 034F
        ANDI    #$033F, R0                      ; 6EB1   03B8 033F
        XORI    #$0080, R0                      ; 6EB3   03F8 0080
        XOR@    R6,     R0                      ; 6EB5   03F0
        MVO     R0,     G_034F                  ; 6EB6   0240 034F
        MOVR    R5,     R7                      ; 6EB8   00AF

L_6EB9:
        PSHR    R5                              ; 6EB9   0275
        MVII    #$0004, R0                      ; 6EBA   02B8 0004

        JSR     R5,     X_RAND1                 ; 6EBC   0004 0114 027D

        SUBI    #$0008, R0                      ; 6EBF   0338 0008
        MOVR    R0,     R1                      ; 6EC1   0081
        MVII    #$0004, R0                      ; 6EC2   02B8 0004

        JSR     R5,     X_RAND1                 ; 6EC4   0004 0114 027D

        SUBI    #$0008, R0                      ; 6EC7   0338 0008
        PULR    R7                              ; 6EC9   02B7

L_6ECA:
        PSHR    R5                              ; 6ECA   0275
        MVI     G_018C, R0                      ; 6ECB   0280 018C
        MVI     G_018D, R1                      ; 6ECD   0281 018D
        CLRR    R5                              ; 6ECF   01ED
        CMPI    #$0057, R0                      ; 6ED0   0378 0057
        BLT     L_6ED5                          ; 6ED2   0205 0001

        INCR    R5                              ; 6ED4   000D
L_6ED5:
        PSHR    R5                              ; 6ED5   0275
        MVI     G_0175, R5                      ; 6ED6   0285 0175
        ANDI    #$0001, R5                      ; 6ED8   03BD 0001
        XOR     G_0179, R5                      ; 6EDA   03C5 0179
        CMP@    R6,     R5                      ; 6EDC   0375
        PULR    R7                              ; 6EDD   02B7

L_6EDE:
        PSHR    R5                              ; 6EDE   0275
        PSHR    R0                              ; 6EDF   0270
        MVI     G_0175, R5                      ; 6EE0   0285 0175
        ANDI    #$0001, R5                      ; 6EE2   03BD 0001
        XOR     G_0179, R5                      ; 6EE4   03C5 0179
        MVI     G_034F, R0                      ; 6EE6   0280 034F
        ANDI    #$0008, R0                      ; 6EE8   03B8 0008
        SLR     R0,     2                       ; 6EEA   0064
        SLR     R0,     1                       ; 6EEB   0060
        CMPR    R0,     R5                      ; 6EEC   0145
        PULR    R0                              ; 6EED   02B0
        PULR    R7                              ; 6EEE   02B7

L_6EEF:
        PSHR    R5                              ; 6EEF   0275
        SUBI    #$0030, R1                      ; 6EF0   0339 0030
        BMI     L_6F0D                          ; 6EF2   020B 0019

        CMPI    #$0031, R1                      ; 6EF4   0379 0031
        BGT     L_6F0D                          ; 6EF6   020E 0015

        ADDR    R7,     R1                      ; 6EF8   00F9
        ADDI    #$0016, R1                      ; 6EF9   02F9 0016
        CMPI    #$0057, R0                      ; 6EFB   0378 0057
        BGE     L_6F04                          ; 6EFD   020D 0005

        CMP@    R1,     R0                      ; 6EFF   0348
        BLT     L_6F0D                          ; 6F00   0205 000B
        B       L_6F0B                          ; 6F02   0200 0007

L_6F04:
        MVI@    R1,     R1                      ; 6F04   0289
        NEGR    R1                              ; 6F05   0021
        ADDI    #$00AE, R1                      ; 6F06   02F9 00AE
        CMPR    R1,     R0                      ; 6F08   0148
        BGT     L_6F0D                          ; 6F09   020E 0002

L_6F0B:
        CMPR    R6,     R6                      ; 6F0B   0176
        PULR    R7                              ; 6F0C   02B7

L_6F0D:
        CMPR    R6,     R7                      ; 6F0D   0177
        PULR    R7                              ; 6F0E   02B7

        COMR    R6                              ; 6F0F   001E
        COMR    R6                              ; 6F10   001E
        COMR    R6                              ; 6F11   001E
        COMR    R6                              ; 6F12   001E
        COMR    R5                              ; 6F13   001D
        COMR    R5                              ; 6F14   001D
        COMR    R5                              ; 6F15   001D
        COMR    R4                              ; 6F16   001C
        COMR    R4                              ; 6F17   001C
        COMR    R4                              ; 6F18   001C
        COMR    R3                              ; 6F19   001B
        COMR    R3                              ; 6F1A   001B
        COMR    R3                              ; 6F1B   001B
        COMR    R2                              ; 6F1C   001A
        COMR    R2                              ; 6F1D   001A
        COMR    R2                              ; 6F1E   001A
        COMR    R1                              ; 6F1F   0019
        COMR    R1                              ; 6F20   0019
        COMR    R1                              ; 6F21   0019
        COMR    R0                              ; 6F22   0018
        COMR    R0                              ; 6F23   0018
        COMR    R0                              ; 6F24   0018
L_6F25:
        DECR    R7                              ; 6F25   0017
L_6F26:
        DECR    R7                              ; 6F26   0017
L_6F27:
        DECR    R7                              ; 6F27   0017

        DECR    R6                              ; 6F28   0016
        DECR    R6                              ; 6F29   0016
        DECR    R6                              ; 6F2A   0016
        DECR    R5                              ; 6F2B   0015
        DECR    R5                              ; 6F2C   0015
        DECR    R5                              ; 6F2D   0015
        DECR    R4                              ; 6F2E   0014
        DECR    R4                              ; 6F2F   0014
        DECR    R4                              ; 6F30   0014
        DECR    R3                              ; 6F31   0013
        DECR    R3                              ; 6F32   0013
        DECR    R3                              ; 6F33   0013
        DECR    R2                              ; 6F34   0012
        DECR    R2                              ; 6F35   0012
        DECR    R2                              ; 6F36   0012
        DECR    R1                              ; 6F37   0011
        DECR    R1                              ; 6F38   0011
        DECR    R1                              ; 6F39   0011
        DECR    R0                              ; 6F3A   0010
        DECR    R0                              ; 6F3B   0010
        DECR    R0                              ; 6F3C   0010
        INCR    R7                              ; 6F3D   000F
        INCR    R7                              ; 6F3E   000F
L_6F3F:
        INCR    R7                              ; 6F3F   000F
L_6F40:
        INCR    R7                              ; 6F40   000F

L_6F41:
        PSHR    R5                              ; 6F41   0275
L_6F42:
        MVI     G_0173, R0                      ; 6F42   0280 0173

        JSR     R5,     L_5944                  ; 6F44   0004 0158 0144
        BIDECLE $6F4D                           ; 6F47   004D 006F

        BEQ     L_6F4C                          ; 6F49   0204 0001

        PULR    R5                              ; 6F4B   02B5
L_6F4C:
        PULR    R7                              ; 6F4C   02B7

        DECLE   $0004,  $0000                   ; 6F4D   0004 0000

        EIS                                     ; 6F4F   0002
        SETC                                    ; 6F50   0007
        DIS                                     ; 6F51   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
        DECLE   $000F,  $0000,  $000F,  $0000   ; D000   000F 0000 000F 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D004   00FF 0000 00FF 0000
        DECLE   $00FF,  $0030,  $00FF,  $007C   ; D008   00FF 0030 00FF 007C
        DECLE   $007F,  $00F8,  $00FF,  $0048   ; D00C   007F 00F8 00FF 0048
        DECLE   $00FF,  $0061,  $00FF,  $007B   ; D010   00FF 0061 00FF 007B
        DECLE   $00FF,  $00FD,  $00FF,  $0052   ; D014   00FF 00FD 00FF 0052
        DECLE   $00FF,  $0086,  $00FF,  $00CF   ; D018   00FF 0086 00FF 00CF
        DECLE   $00FF,  $00DF,  $00FF,  $0049   ; D01C   00FF 00DF 00FF 0049
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D020   00FF 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D024   00FF 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D028   00FF 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0003   ; D02C   00FF 0000 00FF 0003
        DECLE   $0000                           ; D030   0000

        RSWD    R4                              ; D031   003C
        RSWD    R4                              ; D032   003C
        MOVR    R7,     R5                      ; D033   00BD
        SARC    R2,     2                       ; D034   007E
        MOVR    R3,     R7                      ; D035   009F

        DECLE   $005F,  $0000,  $0000,  $0000   ; D036   005F 0000 0000 0000
        DECLE   $0078,  $0078,  $003C,  $003C   ; D03A   0078 0078 003C 003C
        DECLE   $001E,  $001E,  $0000,  $0002   ; D03E   001E 001E 0000 0002
        DECLE   $001F,  $007F,  $00FF,  $0002   ; D042   001F 007F 00FF 0002
        DECLE   $0002,  $0002,  $0000,  $0000   ; D046   0002 0002 0000 0000
        DECLE   $00C0,  $00F0,  $00F8,  $0000   ; D04A   00C0 00F0 00F8 0000
        DECLE   $0000,  $0000,  $0002,  $0002   ; D04E   0000 0000 0002 0002
        DECLE   $0002,  $0002,  $0000,  $0000   ; D052   0002 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D056   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D05A   0000 0000 0000 0000
        DECLE   $0048,  $0012,  $0000,  $0000   ; D05E   0048 0012 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; D062   0000 0000 0000 0008
        DECLE   $0042,  $0090,  $0001,  $0002   ; D066   0042 0090 0001 0002
        DECLE   $0001,  $0002,  $0001,  $0002   ; D06A   0001 0002 0001 0002
        DECLE   $0001,  $0002,  $0002,  $0004   ; D06E   0001 0002 0002 0004
        DECLE   $0002,  $0001,  $0002,  $0004   ; D072   0002 0001 0002 0004
        DECLE   $0002,  $0001,  $0002,  $0001   ; D076   0002 0001 0002 0001
        DECLE   $0002,  $0001,  $0002,  $0001   ; D07A   0002 0001 0002 0001
        DECLE   $0002,  $0001,  $0001,  $0002   ; D07E   0002 0001 0001 0002
        DECLE   $0004,  $0002,  $0001,  $0002   ; D082   0004 0002 0001 0002
        DECLE   $0004,  $0002,  $0000,  $0000   ; D086   0004 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; D08A   0000 0000 0000 0007
        DECLE   $0007,  $0007,  $0020,  $0020   ; D08E   0007 0007 0020 0020
        DECLE   $0010,  $0008,  $001C,  $00FF   ; D092   0010 0008 001C 00FF
        DECLE   $00FF,  $00FF,  $0020,  $0020   ; D096   00FF 00FF 0020 0020
        DECLE   $0020,  $0010,  $0008,  $0004   ; D09A   0020 0010 0008 0004
        DECLE   $000C,  $0010,  $0000,  $0038   ; D09E   000C 0010 0000 0038
        DECLE   $0028,  $0028,  $0028,  $0038   ; D0A2   0028 0028 0028 0038
        DECLE   $0000,  $0000,  $0000,  $0008   ; D0A6   0000 0000 0000 0008
        DECLE   $0018,  $0008,  $0008,  $0008   ; D0AA   0018 0008 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0AE   0000 0000 0000 0038
        DECLE   $0008,  $0038,  $0020,  $0038   ; D0B2   0008 0038 0020 0038
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0B6   0000 0000 0000 0038
        DECLE   $0008,  $0018,  $0008,  $0038   ; D0BA   0008 0018 0008 0038
        DECLE   $0000,  $0000,  $0000,  $0028   ; D0BE   0000 0000 0000 0028
        DECLE   $0028,  $0038,  $0008,  $0008   ; D0C2   0028 0038 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0C6   0000 0000 0000 0038
        DECLE   $0020,  $0038,  $0008,  $0038   ; D0CA   0020 0038 0008 0038
        DECLE   $0000,  $0000,  $0000,  $0020   ; D0CE   0000 0000 0000 0020
        DECLE   $0020,  $0038,  $0028,  $0038   ; D0D2   0020 0038 0028 0038
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0D6   0000 0000 0000 0038
        DECLE   $0008,  $0010,  $0010,  $0010   ; D0DA   0008 0010 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0DE   0000 0000 0000 0038
        DECLE   $0028,  $0038,  $0028,  $0038   ; D0E2   0028 0038 0028 0038
        DECLE   $0000,  $0000,  $0000,  $0038   ; D0E6   0000 0000 0000 0038
        DECLE   $0028,  $0038,  $0008,  $0008   ; D0EA   0028 0038 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0018   ; D0EE   0000 0000 0000 0018
        DECLE   $0020,  $0020,  $0020,  $0018   ; D0F2   0020 0020 0020 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; D0F6   0000 0000 0000 0018
        DECLE   $0020,  $0030,  $0020,  $0018   ; D0FA   0020 0030 0020 0018
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D0FE   0000 0000 0000 00E0
        DECLE   $0084,  $00C0,  $0084,  $00E0   ; D102   0084 00C0 0084 00E0
        DECLE   $0000,  $0000,  $0000,  $008B   ; D106   0000 0000 0000 008B
        DECLE   $00DA,  $00FA,  $00AA,  $008B   ; D10A   00DA 00FA 00AA 008B
        DECLE   $0000,  $0000,  $0000,  $00BB   ; D10E   0000 0000 0000 00BB
        DECLE   $00AA,  $00B3,  $00AA,  $00AB   ; D112   00AA 00B3 00AA 00AB
        DECLE   $0000,  $0000,  $0000,  $0080   ; D116   0000 0000 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0080   ; D11A   0000 0000 0000 0080
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D11E   0000 0000 0000 00E0
        DECLE   $0084,  $0080,  $0084,  $00E0   ; D122   0084 0080 0084 00E0
        DECLE   $0000,  $0000,  $0000,  $00EA   ; D126   0000 0000 0000 00EA
        DECLE   $008A,  $00C4,  $008A,  $00EA   ; D12A   008A 00C4 008A 00EA
        DECLE   $0000,  $0000,  $0000,  $00B8   ; D12E   0000 0000 0000 00B8
        DECLE   $0090,  $0090,  $0090,  $0090   ; D132   0090 0090 0090 0090
        DECLE   $0000,  $0000,  $00FE,  $00FE   ; D136   0000 0000 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $0000   ; D13A   00FE 00FE 00FE 0000
        DECLE   $0000,  $0000,  $00FF,  $0088   ; D13E   0000 0000 00FF 0088
        DECLE   $0088,  $0088,  $00FF,  $0088   ; D142   0088 0088 00FF 0088
        DECLE   $0088,  $0088,  $0000,  $0000   ; D146   0088 0088 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D14A   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D14E   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D152   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00F8   ; D156   0000 0000 00FF 00F8
        DECLE   $00F8,  $00F8,  $00FF,  $00F8   ; D15A   00F8 00F8 00FF 00F8
        DECLE   $00F8,  $00F8,  $00FF           ; D15E   00F8 00F8 00FF

        MOVR    R1,     R7                      ; D161   008F
        MOVR    R1,     R7                      ; D162   008F
        MOVR    R1,     R7                      ; D163   008F

        DECLE   $00FF,  $0088,  $0088,  $0088   ; D164   00FF 0088 0088 0088
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D168   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; D16C   00FF 00F8 00F8 00F8
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D170   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0088,  $0088,  $0088   ; D174   00FF 0088 0088 0088
        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; D178   00FF 00F8 00F8 00F8
        DECLE   $00FF,  $0088,  $0088,  $0088   ; D17C   00FF 0088 0088 0088
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D180   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; D184   00FF

        MOVR    R1,     R7                      ; D185   008F
        MOVR    R1,     R7                      ; D186   008F
        MOVR    R1,     R7                      ; D187   008F

        DECLE   $00FF,  $0088,  $0088,  $0088   ; D188   00FF 0088 0088 0088
        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; D18C   00FF 00F8 00F8 00F8
        DECLE   $00FF,  $0088,  $0088,  $0088   ; D190   00FF 0088 0088 0088
        DECLE   $00FF                           ; D194   00FF

        MOVR    R1,     R7                      ; D195   008F
        MOVR    R1,     R7                      ; D196   008F
        MOVR    R1,     R7                      ; D197   008F

        DECLE   $00FF                           ; D198   00FF

        MOVR    R1,     R7                      ; D199   008F
        MOVR    R1,     R7                      ; D19A   008F
        MOVR    R1,     R7                      ; D19B   008F

        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; D19C   00FF 00F8 00F8 00F8
        DECLE   $00FF                           ; D1A0   00FF

        MOVR    R1,     R7                      ; D1A1   008F
        MOVR    R1,     R7                      ; D1A2   008F
        MOVR    R1,     R7                      ; D1A3   008F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D1A4   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; D1A8   00FF 00F8 00F8 00F8
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D1AC   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; D1B0   00FF

        MOVR    R1,     R7                      ; D1B1   008F
        MOVR    R1,     R7                      ; D1B2   008F
        MOVR    R1,     R7                      ; D1B3   008F

        DECLE   $00FF                           ; D1B4   00FF

        MOVR    R1,     R7                      ; D1B5   008F
        MOVR    R1,     R7                      ; D1B6   008F
        MOVR    R1,     R7                      ; D1B7   008F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D1B8   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D1BC   00FF 00FF 00FF 00FF
        DECLE   $007F,  $007F,  $003F,  $003F   ; D1C0   007F 007F 003F 003F
        DECLE   $001F,  $001F                   ; D1C4   001F 001F

        INCR    R7                              ; D1C6   000F
        INCR    R7                              ; D1C7   000F

L_D1C8:
        ADDR    R6,     R0                      ; D1C8   00F0
L_D1C9:
        ADDR    R4,     R0                      ; D1C9   00E0
        DECLE   $00F0,  $00F0,  $00E0,  $00E0   ; D1CA   00F0 00F0 00E0 00E0
        DECLE   $00C0,  $0080,  $0007,  $0007   ; D1CE   00C0 0080 0007 0007
        DECLE   $0003,  $0003,  $0001,  $0001   ; D1D2   0003 0003 0001 0001
        DECLE   $0003,  $0003,  $0000,  $0000   ; D1D6   0003 0003 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; D1DA   0000 0000 00C0 00E0
        DECLE   $00E0,  $00F0,  $001F,  $003F   ; D1DE   00E0 00F0 001F 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; D1E2   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; D1E6   00FF 00FF 0000 0000
        DECLE   $00F0,  $00F8,  $00FC,  $00FC   ; D1EA   00F0 00F8 00FC 00FC
        DECLE   $00E8,  $00F0,  $0000,  $0000   ; D1EE   00E8 00F0 0000 0000

        DIS                                     ; D1F2   0003
        INCR    R7                              ; D1F3   000F

        DECLE   $001F                           ; D1F4   001F
L_D1F5:
        SARC    R3,     2                       ; D1F5   007F
        DECLE   $00FF,  $00FE,  $00F8,  $00F0   ; D1F6   00FF 00FE 00F8 00F0
        DECLE   $00E0,  $0080,  $0000,  $0000   ; D1FA   00E0 0080 0000 0000
        DECLE   $00FF,  $00FF,  $00BF,  $00BF   ; D1FE   00FF 00FF 00BF 00BF
        DECLE   $00BF                           ; D202   00BF

        ADDR    R3,     R7                      ; D203   00DF
        ADDR    R3,     R7                      ; D204   00DF
        ADDR    R3,     R7                      ; D205   00DF
        ADDR    R5,     R7                      ; D206   00EF
        ADDR    R5,     R7                      ; D207   00EF

        DECLE   $007F,  $007F,  $007F,  $003F   ; D208   007F 007F 007F 003F
        DECLE   $003F,  $003F,  $001F,  $001F   ; D20C   003F 003F 001F 001F
        DECLE   $00C0,  $00C0,  $00E0,  $00E0   ; D210   00C0 00C0 00E0 00E0
        DECLE   $00E0,  $00F0,  $00F0,  $00F0   ; D214   00E0 00F0 00F0 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D218   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0007   ; D21C   0000 0000 0001 0007
        DECLE   $0000,  $0020,  $0040,  $00C0   ; D220   0000 0020 0040 00C0
        DECLE   $00E3,  $0000,  $00FF,  $00FF   ; D224   00E3 0000 00FF 00FF
        DECLE   $000C,  $0018,  $0038,  $00F0   ; D228   000C 0018 0038 00F0
        DECLE   $00F0,  $0000,  $00FF,  $00FF   ; D22C   00F0 0000 00FF 00FF
        DECLE   $0000,  $0007,  $001F,  $003D   ; D230   0000 0007 001F 003D
        DECLE   $0077,  $007F,  $00FA,  $00FF   ; D234   0077 007F 00FA 00FF
        DECLE   $0000,  $00C0,  $00F0,  $0078   ; D238   0000 00C0 00F0 0078
        DECLE   $00DC,  $00FC,  $00BE,  $00FE   ; D23C   00DC 00FC 00BE 00FE
        DECLE   $00F7,  $00FD,  $007F,  $007F   ; D240   00F7 00FD 007F 007F
        DECLE   $002E,  $001F,  $0006,  $0000   ; D244   002E 001F 0006 0000
        DECLE   $00DE,  $007E,  $00FE,  $00FC   ; D248   00DE 007E 00FE 00FC
        DECLE   $00E8,  $00F0,  $00C0,  $0000   ; D24C   00E8 00F0 00C0 0000
        DECLE   $0015,  $003F,  $00FF,  $007F   ; D250   0015 003F 00FF 007F
        DECLE   $00FF,  $00FF,  $00FF,  $0097   ; D254   00FF 00FF 00FF 0097
        DECLE   $000B,  $0003,  $0001,  $0001   ; D258   000B 0003 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D25C   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0007,  $000F   ; D260   0000 0001 0007 000F
        DECLE   $001F,  $00FF,  $00FF,  $007F   ; D264   001F 00FF 00FF 007F
        DECLE   $007F,  $00FF,  $00CE,  $008C   ; D268   007F 00FF 00CE 008C
        DECLE   $001C,  $0018,  $0000,  $0000   ; D26C   001C 0018 0000 0000
        DECLE   $00FE,  $00FE,  $00FF,  $00FF   ; D270   00FE 00FE 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D274   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF           ; D278   00FF 00FF 00FF

        ADDR    R5,     R7                      ; D27B   00EF
        ADDR    R5,     R7                      ; D27C   00EF

        DECLE   $0000,  $0000,  $0000,  $0000   ; D27D   0000 0000 0000 0000
        DECLE   $0020,  $0060,  $0070,  $007C   ; D281   0020 0060 0070 007C
        DECLE   $00BA,  $000C,  $0002,  $0000   ; D285   00BA 000C 0002 0000
        DECLE   $0008,  $001C,  $002E,  $005D   ; D289   0008 001C 002E 005D
        DECLE   $008C,  $0030,  $0040,  $0000   ; D28D   008C 0030 0040 0000
        DECLE   $0004,  $000E,  $002E,  $005D   ; D291   0004 000E 002E 005D
        DECLE   $008C,  $0010,  $0020,  $0000   ; D295   008C 0010 0020 0000
        DECLE   $0010,  $0030,  $0074,  $00BA   ; D299   0010 0030 0074 00BA
        DECLE   $0031,  $000C,  $0002,  $0020   ; D29D   0031 000C 0002 0020
        DECLE   $0070,  $00B8,  $0074,  $0032   ; D2A1   0070 00B8 0074 0032
        DECLE   $0056,  $0056,  $0055,  $0018   ; D2A5   0056 0056 0055 0018
        DECLE   $0030,  $0078,  $0038,  $0018   ; D2A9   0030 0078 0038 0018
        DECLE   $0018,  $0028,  $0028,  $00FF   ; D2AD   0018 0028 0028 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0000   ; D2B5   0000 0000 0003 0000
        DECLE   $006C,  $00FE,  $00FE,  $007C   ; D2B9   006C 00FE 00FE 007C
        DECLE   $0038,  $0010,  $0000           ; D2BD   0038 0010 0000

        ADDR    R5,     R7                      ; D2C0   00EF
        ADDR    R5,     R7                      ; D2C1   00EF
        ADDR    R5,     R7                      ; D2C2   00EF
        ADDR    R5,     R7                      ; D2C3   00EF
        ADDR    R5,     R7                      ; D2C4   00EF
        ADDR    R5,     R7                      ; D2C5   00EF
        ADDR    R5,     R7                      ; D2C6   00EF
        ADDR    R5,     R7                      ; D2C7   00EF
        ADDR    R5,     R7                      ; D2C8   00EF
        ADDR    R5,     R7                      ; D2C9   00EF
        ADDR    R5,     R7                      ; D2CA   00EF
        ADDR    R5,     R7                      ; D2CB   00EF
        ADDR    R5,     R7                      ; D2CC   00EF
        ADDR    R4,     R7                      ; D2CD   00E7
        ADDR    R4,     R7                      ; D2CE   00E7
        ADDR    R4,     R7                      ; D2CF   00E7

        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; D2D0   0080 00C0 00E0 00F0
        DECLE   $00F8,  $00FC,  $007E,  $003F   ; D2D4   00F8 00FC 007E 003F
        DECLE   $001F,  $00FF,  $00FF,  $00FF   ; D2D8   001F 00FF 00FF 00FF
        DECLE   $00FE,  $00FC,  $0000,  $0000   ; D2DC   00FE 00FC 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D2E0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D2E4   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $007F,  $007F   ; D2E8   00FF 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $003F   ; D2EC   007F 007F 007F 003F
        DECLE   $00D9,  $0001,  $0000,  $00D8   ; D2F0   00D9 0001 0000 00D8
        DECLE   $0048,  $0000,  $0000,  $0061   ; D2F4   0048 0000 0000 0061
        DECLE   $0001,  $0070,  $0000,  $0021   ; D2F8   0001 0070 0000 0021
        DECLE   $0002,  $0004,  $0038,  $0000   ; D2FC   0002 0004 0038 0000
        DECLE   $00D9,  $0001,  $0000,  $00D8   ; D300   00D9 0001 0000 00D8
        DECLE   $0090,  $0000,  $0000,  $0061   ; D304   0090 0000 0000 0061
        DECLE   $0001,  $0070,  $0000,  $0021   ; D308   0001 0070 0000 0021
        DECLE   $0002,  $0004,  $0038,  $0000   ; D30C   0002 0004 0038 0000
        DECLE   $0089,  $0051,  $0000,  $00D8   ; D310   0089 0051 0000 00D8
        DECLE   $0090,  $0000,  $0000,  $0061   ; D314   0090 0000 0000 0061
        DECLE   $0001,  $0060,  $0050,  $0001   ; D318   0001 0060 0050 0001
        DECLE   $0022,  $0004,  $0038,  $0000   ; D31C   0022 0004 0038 0000
        DECLE   $0089,  $0051,  $0000,  $00D8   ; D320   0089 0051 0000 00D8
        DECLE   $0090,  $0000,  $0000,  $0061   ; D324   0090 0000 0000 0061
        DECLE   $0001,  $0070,  $0048,  $0071   ; D328   0001 0070 0048 0071
        DECLE   $0002,  $0024,  $0038,  $0000   ; D32C   0002 0024 0038 0000
        DECLE   $0089,  $0051,  $0000,  $00D8   ; D330   0089 0051 0000 00D8
        DECLE   $0048,  $0000,  $0000,  $0061   ; D334   0048 0000 0000 0061
        DECLE   $0001,  $0070,  $0048,  $0071   ; D338   0001 0070 0048 0071
        DECLE   $0002,  $0024,  $0038,  $0000   ; D33C   0002 0024 0038 0000
        DECLE   $0081,  $0049,  $0010,  $00D8   ; D340   0081 0049 0010 00D8
        DECLE   $0040,  $0000,  $0000,  $0061   ; D344   0040 0000 0000 0061
        DECLE   $0001,  $0070,  $0000,  $0021   ; D348   0001 0070 0000 0021
        DECLE   $0002,  $0004,  $0038,  $0000   ; D34C   0002 0004 0038 0000
        DECLE   $0001,  $00D9,  $0000,  $00D8   ; D350   0001 00D9 0000 00D8
        DECLE   $0048,  $0000,  $0000,  $0061   ; D354   0048 0000 0000 0061
        DECLE   $0001,  $0070,  $0000,  $0021   ; D358   0001 0070 0000 0021
        DECLE   $0002,  $0004,  $0038,  $0000   ; D35C   0002 0004 0038 0000
        DECLE   $000E,  $000A,  $000A,  $000A   ; D360   000E 000A 000A 000A
        DECLE   $000E,  $0004,  $000C,  $0004   ; D364   000E 0004 000C 0004
        DECLE   $0004,  $0004,  $000E,  $0002   ; D368   0004 0004 000E 0002
        DECLE   $000E,  $0008,  $000E,  $000E   ; D36C   000E 0008 000E 000E
        DECLE   $0002,  $0006,  $0002,  $000E   ; D370   0002 0006 0002 000E
        DECLE   $000A,  $000A,  $000E,  $0002   ; D374   000A 000A 000E 0002
        DECLE   $0002,  $000E,  $0008,  $000E   ; D378   0002 000E 0008 000E
        DECLE   $0002,  $000E,  $0008,  $0008   ; D37C   0002 000E 0008 0008
        DECLE   $000E,  $000A,  $000E,  $000E   ; D380   000E 000A 000E 000E
        DECLE   $0002,  $0004,  $0004,  $0004   ; D384   0002 0004 0004 0004
        DECLE   $000E,  $000A,  $000E,  $000A   ; D388   000E 000A 000E 000A
        DECLE   $000E,  $000E,  $000A,  $000E   ; D38C   000E 000E 000A 000E
        DECLE   $0002,  $0002,  $0000,  $0000   ; D390   0002 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D394   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $0000,  $0000   ; D398   0000 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D39C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3A0   0000 0000 0000 0000
        DECLE   $0040,  $00E0,  $00E0,  $00E0   ; D3A4   0040 00E0 00E0 00E0
        DECLE   $00E0,  $0040,  $0000,  $0000   ; D3A8   00E0 0040 0000 0000
        DECLE   $0000,  $0006,  $0006,  $000C   ; D3AC   0000 0006 0006 000C
        DECLE   $001C,  $0034,  $0044,  $0060   ; D3B0   001C 0034 0044 0060
        DECLE   $0034,  $0018,  $0008,  $0010   ; D3B4   0034 0018 0008 0010
        DECLE   $0020,  $0030,  $0000,  $0000   ; D3B8   0020 0030 0000 0000
        DECLE   $0006,  $0006,  $000C,  $001C   ; D3BC   0006 0006 000C 001C
        DECLE   $0034,  $0042,  $0062,  $0031   ; D3C0   0034 0042 0062 0031
        DECLE   $0018,  $0028,  $0028,  $0010   ; D3C4   0018 0028 0028 0010
        DECLE   $0050,  $0058,  $0000,  $0000   ; D3C8   0050 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; D3CC   0000 0000 0000 0018
        DECLE   $0038,  $0070,  $00D8,  $008C   ; D3D0   0038 0070 00D8 008C
        DECLE   $0066,  $0019,  $0024,  $0048   ; D3D4   0066 0019 0024 0048
        DECLE   $0090,  $00D8,  $0000,  $0000   ; D3D8   0090 00D8 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; D3DC   0000 0000 0018 0018
        DECLE   $0030,  $0078,  $006C,  $0042   ; D3E0   0030 0078 006C 0042
        DECLE   $0031,  $0018,  $0024,  $0028   ; D3E4   0031 0018 0024 0028
        DECLE   $0050,  $0078,  $0000,  $0000   ; D3E8   0050 0078 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0030   ; D3EC   0000 0018 0018 0030
        DECLE   $0038,  $006C,  $0062,  $0001   ; D3F0   0038 006C 0062 0001
        DECLE   $0060,  $0030,  $0018,  $0030   ; D3F4   0060 0030 0018 0030
        DECLE   $0060,  $0078,  $0000,  $0000   ; D3F8   0060 0078 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0060   ; D3FC   0000 0030 0030 0060
        DECLE   $0078,  $0067,  $0060,  $0000   ; D400   0078 0067 0060 0000
        DECLE   $0060,  $0030,  $0030,  $0030   ; D404   0060 0030 0030 0030
        DECLE   $0060,  $0078,  $0000,  $0000   ; D408   0060 0078 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D40C   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0030   ; D410   0000 0018 0018 0030
        DECLE   $0078,  $007C,  $0036,  $001B   ; D414   0078 007C 0036 001B
        DECLE   $007C,  $0040,  $0000,  $0000   ; D418   007C 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D41C   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0030,  $0078   ; D420   0018 0018 0030 0078
        DECLE   $007C,  $007F,  $0024,  $0024   ; D424   007C 007F 0024 0024
        DECLE   $00E6,  $0080,  $0000,  $0000   ; D428   00E6 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D42C   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0030,  $007C   ; D430   0018 0018 0030 007C
        DECLE   $007F,  $007C,  $0024,  $0024   ; D434   007F 007C 0024 0024
        DECLE   $00E6,  $0080,  $0000,  $0000   ; D438   00E6 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; D43C   0000 0000 0000 0030
        DECLE   $0030,  $0078,  $007F,  $0070   ; D440   0030 0078 007F 0070
        DECLE   $007C,  $007C,  $0024,  $0024   ; D444   007C 007C 0024 0024
        DECLE   $00E6,  $0080,  $0000,  $0000   ; D448   00E6 0080 0000 0000
        DECLE   $0000,  $0060,  $0060,  $0030   ; D44C   0000 0060 0060 0030
        DECLE   $0038,  $002C,  $0022,  $0006   ; D450   0038 002C 0022 0006
        DECLE   $002C,  $0018,  $0010,  $0008   ; D454   002C 0018 0010 0008
        DECLE   $0004,  $000C,  $0000,  $0000   ; D458   0004 000C 0000 0000
        DECLE   $0060,  $0060,  $0030,  $0038   ; D45C   0060 0060 0030 0038
        DECLE   $002C,  $0042,  $0046,  $008C   ; D460   002C 0042 0046 008C
        DECLE   $0018,  $0014,  $0014,  $0008   ; D464   0018 0014 0014 0008
        DECLE   $000A,  $001A,  $0000,  $0000   ; D468   000A 001A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; D46C   0000 0000 0000 0018
        DECLE   $001C,  $000E,  $001B,  $0031   ; D470   001C 000E 001B 0031
        DECLE   $0066,  $0098,  $0024,  $0012   ; D474   0066 0098 0024 0012
        DECLE   $0009,  $001B,  $0000,  $0000   ; D478   0009 001B 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; D47C   0000 0000 0018 0018
        DECLE   $000C,  $001E,  $0036,  $0042   ; D480   000C 001E 0036 0042
        DECLE   $008C,  $0018,  $0024,  $0014   ; D484   008C 0018 0024 0014
        DECLE   $000A,  $001E,  $0000,  $0000   ; D488   000A 001E 0000 0000
        DECLE   $0000,  $0018,  $0018,  $000C   ; D48C   0000 0018 0018 000C
        DECLE   $001C,  $0036,  $0046,  $0080   ; D490   001C 0036 0046 0080
        DECLE   $0006,  $000C,  $0018,  $000C   ; D494   0006 000C 0018 000C
        DECLE   $0006,  $001E,  $0000,  $0000   ; D498   0006 001E 0000 0000
        DECLE   $0000,  $000C,  $000C,  $0006   ; D49C   0000 000C 000C 0006
        DECLE   $001E,  $00E6,  $0006,  $0000   ; D4A0   001E 00E6 0006 0000
        DECLE   $0006,  $000C,  $000C,  $000C   ; D4A4   0006 000C 000C 000C
        DECLE   $0006,  $001E,  $0000,  $0000   ; D4A8   0006 001E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4AC   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $000C   ; D4B0   0000 0018 0018 000C
        DECLE   $001E,  $003E,  $006C,  $00D8   ; D4B4   001E 003E 006C 00D8
        DECLE   $003E,  $0002,  $0000,  $0000   ; D4B8   003E 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4BC   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $000C,  $001E   ; D4C0   0018 0018 000C 001E
        DECLE   $003E,  $00FE,  $0024,  $0024   ; D4C4   003E 00FE 0024 0024
        DECLE   $0067,  $0001,  $0000,  $0000   ; D4C8   0067 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4CC   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $000C,  $003E   ; D4D0   0018 0018 000C 003E
        DECLE   $00FE,  $003E,  $0024,  $0024   ; D4D4   00FE 003E 0024 0024
        DECLE   $0067,  $0001,  $0000,  $0000   ; D4D8   0067 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; D4DC   0000 0000 0000 000C
        DECLE   $000C,  $001E,  $00FE,  $000E   ; D4E0   000C 001E 00FE 000E
        DECLE   $003E,  $003E,  $0024,  $0024   ; D4E4   003E 003E 0024 0024
        DECLE   $0067,  $0001,  $0000,  $0000   ; D4E8   0067 0001 0000 0000
        DECLE   $0006,  $0006,  $000C,  $000C   ; D4EC   0006 0006 000C 000C
        DECLE   $000C,  $0000,  $000C,  $000C   ; D4F0   000C 0000 000C 000C
        DECLE   $000C,  $003C,  $0028,  $0028   ; D4F4   000C 003C 0028 0028
        DECLE   $0008,  $000C,  $0000,  $0000   ; D4F8   0008 000C 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0038   ; D4FC   000C 000C 0038 0038
        DECLE   $003C,  $0000,  $001C,  $003E   ; D500   003C 0000 001C 003E
        DECLE   $0022,  $002E,  $0028,  $0020   ; D504   0022 002E 0028 0020
        DECLE   $0020,  $0010,  $0000,  $0000   ; D508   0020 0010 0000 0000

        CLRC                                    ; D50C   0006
        CLRC                                    ; D50D   0006
        COMR    R4                              ; D50E   001C
        RSWD    R4                              ; D50F   003C
        ADCR    R7                              ; D510   002F

        NEGR    R0                              ; D511   0020
L_D512:
        COMR    R4                              ; D512   001C
        DECLE   $003F,  $0021,  $0027,  $0024   ; D513   003F 0021 0027 0024
        DECLE   $0044,  $0040,  $0040,  $0000   ; D517   0044 0040 0040 0000
        DECLE   $0000,  $000C,  $000C,  $0078   ; D51B   0000 000C 000C 0078
        DECLE   $0058,  $005F,  $0000,  $0018   ; D51F   0058 005F 0000 0018
        DECLE   $003F,  $0021,  $0062,  $0042   ; D523   003F 0021 0062 0042
        DECLE   $00C0,  $0080,  $0080,  $0000   ; D527   00C0 0080 0080 0000
        DECLE   $0000                           ; D52B   0000

        INCR    R4                              ; D52C   000C
        INCR    R4                              ; D52D   000C
        ADDR    R7,     R0                      ; D52E   00F8
        MOVR    R3,     R7                      ; D52F   009F

        DECLE   $0018,  $0000,  $0018,  $003F   ; D530   0018 0000 0018 003F
        DECLE   $0021,  $0061,  $0040,  $00C0   ; D534   0021 0061 0040 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; D538   0080 0000 0000 0000
        DECLE   $000C,  $000C,  $0078,  $0058   ; D53C   000C 000C 0078 0058
        DECLE   $005F,  $0000,  $0018,  $003C   ; D540   005F 0000 0018 003C
        DECLE   $0024,  $0066,  $00C2,  $0082   ; D544   0024 0066 00C2 0082
        DECLE   $0003,  $0000,  $0000,  $0000   ; D548   0003 0000 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0078   ; D54C   000C 000C 0038 0078
        DECLE   $005E,  $0040,  $0038,  $003C   ; D550   005E 0040 0038 003C
        DECLE   $0024,  $00E4,  $0084,  $0084   ; D554   0024 00E4 0084 0084
        DECLE   $0004,  $0006,  $0000,  $0000   ; D558   0004 0006 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0038   ; D55C   000C 000C 0038 0038
        DECLE   $003C,  $0000,  $0018,  $0018   ; D560   003C 0000 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0048   ; D564   0018 0078 0048 0048
        DECLE   $0008,  $000C,  $0000,  $0000   ; D568   0008 000C 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; D56C   0000 0030 0030 0078
        DECLE   $00FC,  $00B0,  $0000,  $0030   ; D570   00FC 00B0 0000 0030
        DECLE   $0028,  $0028,  $0068,  $0048   ; D574   0028 0028 0068 0048
        DECLE   $0008,  $0008,  $0000,  $0000   ; D578   0008 0008 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; D57C   0000 0030 0030 0078
        DECLE   $00F8,  $0074,  $0000,  $0030   ; D580   00F8 0074 0000 0030
        DECLE   $0070,  $0070,  $0050,  $0050   ; D584   0070 0070 0050 0050
        DECLE   $0010,  $0010,  $0000,  $0000   ; D588   0010 0010 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; D58C   0000 0030 0030 0078
        DECLE   $0078,  $0078,  $0028,  $0030   ; D590   0078 0078 0028 0030
        DECLE   $0030,  $0030,  $0030,  $0030   ; D594   0030 0030 0030 0030
        DECLE   $0020,  $0020,  $0000,  $0000   ; D598   0020 0020 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; D59C   0000 0030 0030 0078
        DECLE   $0078,  $0030,  $0020,  $0030   ; D5A0   0078 0030 0020 0030
        DECLE   $0038,  $0038,  $0030,  $0030   ; D5A4   0038 0038 0030 0030
        DECLE   $0020,  $0020,  $0000,  $0000   ; D5A8   0020 0020 0000 0000
        DECLE   $0030,  $0030,  $0078,  $0078   ; D5AC   0030 0030 0078 0078
        DECLE   $007C,  $0020,  $0030,  $0038   ; D5B0   007C 0020 0030 0038
        DECLE   $0038,  $0050,  $0050,  $0040   ; D5B4   0038 0050 0050 0040
        DECLE   $0040,  $0040,  $0000,  $0000   ; D5B8   0040 0040 0000 0000
        DECLE   $0030,  $0030,  $00F8,  $00BC   ; D5BC   0030 0030 00F8 00BC
        DECLE   $0030,  $0000,  $0030,  $004C   ; D5C0   0030 0000 0030 004C
        DECLE   $0044,  $0048,  $0048,  $0040   ; D5C4   0044 0048 0048 0040
        DECLE   $0040,  $0040,  $0000,  $0000   ; D5C8   0040 0040 0000 0000
        DECLE   $0030,  $00F0,  $00BC,  $0036   ; D5CC   0030 00F0 00BC 0036
        DECLE   $0030,  $0000,  $0038,  $0048   ; D5D0   0030 0000 0038 0048
        DECLE   $0044,  $0044,  $0048,  $00C8   ; D5D4   0044 0044 0048 00C8
        DECLE   $0080,  $0080,  $0000,  $0000   ; D5D8   0080 0080 0000 0000
        DECLE   $0000,  $0030,  $0070,  $00FC   ; D5DC   0000 0030 0070 00FC
        DECLE   $00B6,  $0030,  $0000,  $0030   ; D5E0   00B6 0030 0000 0030
        DECLE   $002C,  $0024,  $0024,  $006C   ; D5E4   002C 0024 0024 006C
        DECLE   $0048,  $0040,  $0021,  $0021   ; D5E8   0048 0040 0021 0021
        DECLE   $005A,  $005C,  $0038,  $0018   ; D5EC   005A 005C 0038 0018
        DECLE   $0018,  $0000,  $0018,  $0018   ; D5F0   0018 0000 0018 0018
        DECLE   $0028,  $0028,  $0028,  $0050   ; D5F4   0028 0028 0028 0050
        DECLE   $0050,  $0028,  $0000,  $0040   ; D5F8   0050 0028 0000 0040
        DECLE   $0098,  $0098,  $00F0,  $003C   ; D5FC   0098 0098 00F0 003C
        DECLE   $001A,  $0000,  $0038,  $001C   ; D600   001A 0000 0038 001C
        DECLE   $000A,  $000A,  $0014,  $0014   ; D604   000A 000A 0014 0014
        DECLE   $0024,  $0020,  $0000,  $0080   ; D608   0024 0020 0000 0080
        DECLE   $0058,  $0078,  $0030,  $0018   ; D60C   0058 0078 0030 0018
        DECLE   $001A,  $0000,  $0038,  $001C   ; D610   001A 0000 0038 001C
        DECLE   $0012,  $000A,  $000C,  $0014   ; D614   0012 000A 000C 0014
        DECLE   $0020,  $0020,  $0010,  $0010   ; D618   0020 0020 0010 0010
        DECLE   $0018,  $0018,  $0010,  $0018   ; D61C   0018 0018 0010 0018
        DECLE   $0018,  $0002,  $0038,  $0018   ; D620   0018 0002 0038 0018
        DECLE   $0014,  $000C,  $000C,  $0034   ; D624   0014 000C 000C 0034
        DECLE   $0028,  $0020,  $0001,  $0002   ; D628   0028 0020 0001 0002
        DECLE   $001C,  $0018,  $0010,  $0018   ; D62C   001C 0018 0010 0018
        DECLE   $0018,  $0004,  $0038,  $0018   ; D630   0018 0004 0038 0018
        DECLE   $0014,  $000C,  $000C,  $0034   ; D634   0014 000C 000C 0034
        DECLE   $0028,  $0020,  $0000,  $0000   ; D638   0028 0020 0000 0000
        DECLE   $0018,  $0018,  $0016,  $0019   ; D63C   0018 0018 0016 0019
        DECLE   $0018,  $0000,  $0038,  $0018   ; D640   0018 0000 0038 0018
        DECLE   $0010,  $0018,  $0038,  $0058   ; D644   0010 0018 0038 0058
        DECLE   $0048,  $000C,  $0000,  $0000   ; D648   0048 000C 0000 0000
        DECLE   $0018,  $0018,  $0012,  $001C   ; D64C   0018 0018 0012 001C
        DECLE   $001B,  $0000,  $0018,  $0018   ; D650   001B 0000 0018 0018
        DECLE   $0018,  $0034,  $0008,  $0028   ; D654   0018 0034 0008 0028
        DECLE   $002C,  $0030,  $0000,  $0000   ; D658   002C 0030 0000 0000
        DECLE   $0018,  $0018,  $0012,  $001C   ; D65C   0018 0018 0012 001C
        DECLE   $001B,  $0000,  $0018,  $0018   ; D660   001B 0000 0018 0018
        DECLE   $0028,  $0024,  $0024,  $0064   ; D664   0028 0024 0024 0064
        DECLE   $0046,  $0060,  $0000,  $0000   ; D668   0046 0060 0000 0000
        DECLE   $0018,  $0018,  $0012,  $001C   ; D66C   0018 0018 0012 001C
        DECLE   $001B,  $0000,  $0018,  $0018   ; D670   001B 0000 0018 0018
        DECLE   $0018,  $0018,  $0034,  $0028   ; D674   0018 0018 0034 0028
        DECLE   $0028,  $000C,  $0000,  $0000   ; D678   0028 000C 0000 0000
        DECLE   $0018,  $0018,  $0012,  $001C   ; D67C   0018 0018 0012 001C
        DECLE   $001B,  $0000,  $0018,  $0018   ; D680   001B 0000 0018 0018
        DECLE   $0008,  $0008,  $0010,  $0010   ; D684   0008 0008 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0080   ; D688   0010 0018 0000 0080
        DECLE   $0018,  $0099,  $00F2,  $003C   ; D68C   0018 0099 00F2 003C
        DECLE   $0018,  $0000,  $0018,  $001C   ; D690   0018 0000 0018 001C
        DECLE   $000A,  $0009,  $0011,  $0011   ; D694   000A 0009 0011 0011
        DECLE   $0022,  $0033,  $0000,  $0000   ; D698   0022 0033 0000 0000
        DECLE   $0058,  $0099,  $00F2,  $003C   ; D69C   0058 0099 00F2 003C
        DECLE   $0018,  $0000,  $0018,  $001C   ; D6A0   0018 0000 0018 001C
        DECLE   $000A,  $0009,  $0011,  $0011   ; D6A4   000A 0009 0011 0011
        DECLE   $0022,  $0033,  $0000,  $0080   ; D6A8   0022 0033 0000 0080
        DECLE   $0058,  $0078,  $0030,  $0018   ; D6AC   0058 0078 0030 0018
        DECLE   $001A,  $0000,  $0018,  $001C   ; D6B0   001A 0000 0018 001C
        DECLE   $0014,  $000A,  $000A,  $0012   ; D6B4   0014 000A 000A 0012
        DECLE   $0022,  $0033,  $0010,  $0010   ; D6B8   0022 0033 0010 0010
        DECLE   $0018,  $0018,  $0010,  $0018   ; D6BC   0018 0018 0010 0018
        DECLE   $0018,  $0002,  $0018,  $0018   ; D6C0   0018 0002 0018 0018
        DECLE   $0014,  $000C,  $001C,  $0034   ; D6C4   0014 000C 001C 0034
        DECLE   $0024,  $0036,  $0001           ; D6C8   0024 0036 0001

        EIS                                     ; D6CB   0002
        COMR    R4                              ; D6CC   001C
        COMR    R0                              ; D6CD   0018
        DECR    R0                              ; D6CE   0010
        COMR    R0                              ; D6CF   0018
        COMR    R0                              ; D6D0   0018

        JSR     R4,     .EXEC.818               ; D6D1   0004 0018 0018
        DECLE   $0014,  $000C,  $001C,  $0034   ; D6D4   0014 000C 001C 0034
        DECLE   $0024,  $0036,  $0000,  $0000   ; D6D8   0024 0036 0000 0000
        DECLE   $0018,  $001C,  $0012,  $0019   ; D6DC   0018 001C 0012 0019
        DECLE   $0018,  $0000,  $0010,  $0018   ; D6E0   0018 0000 0010 0018
        DECLE   $0018,  $0008,  $0010,  $0030   ; D6E4   0018 0008 0010 0030
        DECLE   $0030,  $0018,  $0000,  $0000   ; D6E8   0030 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; D6F0   0000 0000 0000 0006
        DECLE   $0086,  $009D,  $007E,  $00B1   ; D6F4   0086 009D 007E 00B1
        DECLE   $00E0,  $0000,  $0000,  $0000   ; D6F8   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6FC   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0006,  $0006   ; D700   0000 0001 0006 0006
        DECLE   $000D,  $001E,  $0038,  $0050   ; D704   000D 001E 0038 0050
        DECLE   $0050,  $00A0,  $0000,  $0000   ; D708   0050 00A0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D70C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00A0,  $00A0   ; D710   0000 0000 00A0 00A0
        DECLE   $00F6,  $007E,  $001D,  $0004   ; D714   00F6 007E 001D 0004
        DECLE   $0002,  $0001,  $0000,  $0000   ; D718   0002 0001 0000 0000
        DECLE   $0024,  $005A,  $005A,  $0054   ; D71C   0024 005A 005A 0054
        DECLE   $0038,  $0018,  $0000,  $0018   ; D720   0038 0018 0000 0018
        DECLE   $0018,  $0024,  $0022,  $0042   ; D724   0018 0024 0022 0042
        DECLE   $0044,  $0066,  $0000,  $0024   ; D728   0044 0066 0000 0024
        DECLE   $0042,  $005A,  $005C,  $0038   ; D72C   0042 005A 005C 0038
        DECLE   $0018,  $0018,  $0000,  $0018   ; D730   0018 0018 0000 0018
        DECLE   $0018,  $0024,  $0022,  $0042   ; D734   0018 0024 0022 0042
        DECLE   $0044,  $0066,  $0024,  $0042   ; D738   0044 0066 0024 0042
        DECLE   $0042,  $005C,  $0038,  $0018   ; D73C   0042 005C 0038 0018
        DECLE   $0018,  $0018,  $0000,  $0018   ; D740   0018 0018 0000 0018
        DECLE   $0018,  $0024,  $0022,  $0042   ; D744   0018 0024 0022 0042
        DECLE   $0044,  $0066,  $0000,  $0000   ; D748   0044 0066 0000 0000
        DECLE   $0024,  $005A,  $005A,  $0054   ; D74C   0024 005A 005A 0054
        DECLE   $0038,  $0018,  $0000,  $0038   ; D750   0038 0018 0000 0038
        DECLE   $001C,  $000A,  $000A,  $0014   ; D754   001C 000A 000A 0014
        DECLE   $0014,  $0024,  $0000,  $0024   ; D758   0014 0024 0000 0024
        DECLE   $0042,  $005A,  $005C,  $0038   ; D75C   0042 005A 005C 0038
        DECLE   $0018,  $0018,  $0000,  $0038   ; D760   0018 0018 0000 0038
        DECLE   $001C,  $000A,  $000A,  $0014   ; D764   001C 000A 000A 0014
        DECLE   $0014,  $0024,  $0024,  $0042   ; D768   0014 0024 0024 0042
        DECLE   $0042,  $005C,  $0038,  $0018   ; D76C   0042 005C 0038 0018
        DECLE   $0018,  $0018,  $0000           ; D770   0018 0018 0000

        RSWD    R0                              ; D773   0038
        COMR    R4                              ; D774   001C
        INCR    R2                              ; D775   000A
        INCR    R2                              ; D776   000A
        DECR    R4                              ; D777   0014
        DECR    R4                              ; D778   0014
        NEGR    R4                              ; D779   0024
        PSHR    R5                              ; D77A   0275
        SDBD                                    ; D77B   0001
        MVII    #$546C, R0                      ; D77C   02B8 006C 0054
        MVO     R0,     .ISRVEC.0               ; D77F   0240 0100
        SWAP    R0,     1                       ; D781   0040
        MVO     R0,     .ISRVEC.1               ; D782   0240 0101
        MVII    #$0003, R0                      ; D784   02B8 0003
        MVO     R0,     G_0352                  ; D786   0240 0352

        JSR     R5,     L_5742                  ; D788   0004 0154 0342
        DECLE   $0003                           ; D78B   0003
L_D78C:
        MVII    #$0006, R0                      ; D78C   02B8 0006
        DECLE   $0240,  $0103,  $0004           ; D78E   0240 0103 0004

        ANDR    R3,     R4                      ; D791   019C
        SUBR    R2,     R7                      ; D792   0117

        MVII    #$0001, R0                      ; D793   02B8 0001
        MVO     R0,     G_0173                  ; D795   0240 0173
        MVII    #$0264, R4                      ; D797   02BC 0264
        SDBD                                    ; D799   0001
        MVII    #$3A0F, R1                      ; D79A   02B9 000F 003A
        MVII    #$0014, R0                      ; D79D   02B8 0014

        JSR     R5,     X_FILL_MEM              ; D79F   0004 0114 0341

        MVII    #$0278, R4                      ; D7A2   02BC 0278
        SDBD                                    ; D7A4   0001
        MVII    #$3A00, R1                      ; D7A5   02B9 0000 003A
        MVII    #$0050, R0                      ; D7A8   02B8 0050

        JSR     R5,     X_FILL_MEM              ; D7AA   0004 0114 0341

        MVII    #$02C8, R4                      ; D7AD   02BC 02C8
        SDBD                                    ; D7AF   0001
        MVII    #$3A17, R1                      ; D7B0   02B9 0017 003A
        MVII    #$0014, R0                      ; D7B3   02B8 0014

        JSR     R5,     X_FILL_MEM              ; D7B5   0004 0114 0341
        DECLE   $00BC,  $02FC,  $025D,  $0004   ; D7B8   00BC 02FC 025D 0004

        ANDR    R4,     R4                      ; D7BC   01A4
        MVO@    R4,     R2                      ; D7BD   0254
        MOVR    R7,     R4                      ; D7BE   00BC
        ADDI    #$0227, R4                      ; D7BF   02FC 0227
        MVII    #$0008, R0                      ; D7C1   02B8 0008
        MVII    #$0319, R3                      ; D7C3   02BB 0319

        JSR     R5,     L_5766                  ; D7C5   0004 0154 0366
        DECLE   $02BD,  $0331,  $00BC,  $02FC   ; D7C8   02BD 0331 00BC 02FC
        DECLE   $003C,  $0001,  $02A0,  $0268   ; D7CC   003C 0001 02A0 0268
        DECLE   $037D,  $0335,  $0226,  $0006   ; D7D0   037D 0335 0226 0006
        DECLE   $0001,  $02B8,  $00EB,  $0050   ; D7D4   0001 02B8 00EB 0050
        DECLE   $0240,  $0343,  $02B8,  $0001   ; D7D8   0240 0343 02B8 0001
        DECLE   $0240,  $0188,  $00BC,  $02FC   ; D7DC   0240 0188 00BC 02FC
        DECLE   $0062,  $0244,  $0350,  $02B8   ; D7E0   0062 0244 0350 02B8
        DECLE   $0005,  $0240,  $0178,  $0004   ; D7E4   0005 0240 0178 0004

        ANDR    R3,     R0                      ; D7E8   0198
        DECR    R1                              ; D7E9   0011

        JSR     R5,     L_6378                  ; D7EA   0004 0160 0378
        DECLE   $000D                           ; D7ED   000D

        MVI     .PSG0.lft_hand,R0               ; D7EE   0280 01FF
        MVI     .PSG0.rgt_hand,R1               ; D7F0   0281 01FE
        CMPI    #$007E, R0                      ; D7F2   0378 007E
        BNEQ    L_D7FE                          ; D7F4   020C 0008

        CMPI    #$007E, R1                      ; D7F6   0379 007E
        BNEQ    L_D7FF                          ; D7F8   020C 0005

        MVII    #$0020, R0                      ; D7FA   02B8 0020
L_D7FC:
        MVO     R0,     G_0352                  ; D7FC   0240 0352
L_D7FE:
        PULR    R7                              ; D7FE   02B7

L_D7FF:
        CMPI    #$007D, R1                      ; D7FF   0379 007D
        BNEQ    L_D7FE                          ; D801   022C 0004

        MVII    #$0040, R0                      ; D803   02B8 0040
        B       L_D7FC                          ; D805   0220 000A

        ADDR    R0,     R0                      ; D807   00C0
        TSTR    R2                              ; D808   0092
        ADDR    R2,     R0                      ; D809   00D0
        TSTR    R2                              ; D80A   0092
        ADDR    R4,     R0                      ; D80B   00E0
        TSTR    R2                              ; D80C   0092
        ADDR    R6,     R0                      ; D80D   00F0
        TSTR    R2                              ; D80E   0092
        MOVR    R7,     R0                      ; D80F   00B8
        TSTR    R2                              ; D810   0092
        MVII    #$028C, R1                      ; D811   02B9 028C
        MVII    #$0014, R2                      ; D813   02BA 0014
L_D815:
        MVII    #$0003, R3                      ; D815   02BB 0003
L_D817:
        MVI@    R4,     R0                      ; D817   02A0
        DECLE   $0378,  $0000,  $020C,  $000F   ; D818   0378 0000 020C 000F
        DECLE   $0001                           ; D81C   0001

        MVII    #$0000, R0                      ; D81D   02B8 0000
        RSWD    R2                              ; D81F   003A
        MVO@    R0,     R1                      ; D820   0248
        ADDI    #$0014, R1                      ; D821   02F9 0014
        MVO@    R0,     R1                      ; D823   0248
        ADDI    #$0014, R1                      ; D824   02F9 0014
        MVO@    R0,     R1                      ; D826   0248
        ADDI    #$0014, R1                      ; D827   02F9 0014
        B       L_D837                          ; D829   0200 000C

        SLL     R0,     2                       ; D82B   004C
        SLL     R0,     1                       ; D82C   0048
        SDBD                                    ; D82D   0001
        XORI    #$3200, R0                      ; D82E   03F8 0000 0032
        MVO@    R0,     R1                      ; D831   0248
        ADDI    #$0014, R1                      ; D832   02F9 0014
        DECR    R3                              ; D834   0013
        BNEQ    L_D817                          ; D835   022C 001F

L_D837:
        SUBI    #$003B, R1                      ; D837   0339 003B
        DECR    R2                              ; D839   0012
        BNEQ    L_D815                          ; D83A   022C 0026

        MVI     G_0178, R0                      ; D83C   0280 0178
        MVO     R0,     G_017B                  ; D83E   0240 017B
        MOVR    R5,     R7                      ; D840   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; D841   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D845   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D84D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D851   0000 0000 0000 0000

        SUBR    R0,     R3                      ; D855   0103
        SUBR    R0,     R3                      ; D856   0103
        SUBR    R0,     R7                      ; D857   0107

        SUBR    R0,     R0                      ; D858   0100
        SUBR    R1,     R3                      ; D859   010B
        SUBR    R0,     R7                      ; D85A   0107

        DECLE   $010A,  $010C,  $0104,  $010A   ; D85B   010A 010C 0104 010A
        DECLE   $0100,  $0100,  $010D,  $0103   ; D85F   0100 0100 010D 0103
        DECLE   $0106,  $0100,  $0104,  $0100   ; D863   0106 0100 0104 0100
        DECLE   $0100,  $0109,  $0104,  $010A   ; D867   0100 0109 0104 010A
        DECLE   $0103,  $0100,  $0000,  $0000   ; D86B   0103 0100 0000 0000
        DECLE   $0000                           ; D86F   0000

        SUBR    R0,     R5                      ; D870   0105
        SUBR    R0,     R5                      ; D871   0105
        SUBR    R0,     R7                      ; D872   0107

        SUBR    R0,     R3                      ; D873   0103
        SUBR    R0,     R7                      ; D874   0107

        SUBR    R0,     R0                      ; D875   0100
        SUBR    R0,     R5                      ; D876   0105
        SUBR    R0,     R5                      ; D877   0105
        SUBR    R0,     R7                      ; D878   0107

        SUBR    R0,     R3                      ; D879   0103
        SUBR    R1,     R1                      ; D87A   0109
        SUBR    R0,     R7                      ; D87B   0107

        SUBR    R0,     R5                      ; D87C   0105
        SUBR    R0,     R5                      ; D87D   0105
        SUBR    R0,     R6                      ; D87E   0106
        SUBR    R0,     R7                      ; D87F   0107

        SUBR    R0,     R0                      ; D880   0100
        SUBR    R0,     R7                      ; D881   0107

        SUBR    R0,     R5                      ; D882   0105
        SUBR    R0,     R6                      ; D883   0106
        SUBR    R0,     R6                      ; D884   0106
        SUBR    R0,     R7                      ; D885   0107

        SUBR    R0,     R3                      ; D886   0103
        SUBR    R0,     R7                      ; D887   0107

        SUBR    R0,     R5                      ; D888   0105
        SUBR    R0,     R5                      ; D889   0105
        SUBR    R0,     R6                      ; D88A   0106
        SUBR    R0,     R7                      ; D88B   0107

        SUBR    R0,     R0                      ; D88C   0100
        SUBR    R0,     R7                      ; D88D   0107

        SUBR    R1,     R5                      ; D88E   010D
        SUBR    R0,     R5                      ; D88F   0105
        SUBR    R0,     R7                      ; D890   0107

        SUBR    R1,     R6                      ; D891   010E
        SUBR    R1,     R7                      ; D892   010F

        SUBR    R0,     R4                      ; D893   0104
        SUBR    R0,     R4                      ; D894   0104
        SUBR    R0,     R0                      ; D895   0100
        SUBR    R0,     R0                      ; D896   0100
        SUBR    R0,     R5                      ; D897   0105
        SUBR    R0,     R3                      ; D898   0103
        SUBR    R0,     R7                      ; D899   0107

        DECLE   $010E,  $0104,  $0104,  $0106   ; D89A   010E 0104 0104 0106
        DECLE   $0108,  $0106,  $0100,  $0100   ; D89E   0108 0106 0100 0100
        DECLE   $0104,  $0100,  $0100,  $0104   ; D8A2   0104 0100 0100 0104
        DECLE   $0100,  $0100,  $0104,  $0000   ; D8A6   0100 0100 0104 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D8B2   0000 0000 0000

        SUBR    R0,     R5                      ; D8B5   0105
        SUBR    R0,     R6                      ; D8B6   0106
        SUBR    R0,     R6                      ; D8B7   0106
        SUBR    R0,     R7                      ; D8B8   0107

        SUBR    R0,     R3                      ; D8B9   0103
        SUBR    R0,     R7                      ; D8BA   0107

        SUBR    R0,     R5                      ; D8BB   0105
        SUBR    R0,     R5                      ; D8BC   0105
        SUBR    R0,     R7                      ; D8BD   0107

        SUBR    R0,     R3                      ; D8BE   0103
        SUBR    R0,     R7                      ; D8BF   0107

        SUBR    R0,     R0                      ; D8C0   0100
        SUBR    R0,     R3                      ; D8C1   0103
        SUBR    R0,     R3                      ; D8C2   0103
        SUBR    R0,     R7                      ; D8C3   0107

        SUBR    R0,     R3                      ; D8C4   0103
        SUBR    R0,     R5                      ; D8C5   0105
        SUBR    R0,     R7                      ; D8C6   0107

        SUBR    R0,     R3                      ; D8C7   0103
        SUBR    R1,     R1                      ; D8C8   0109
        SUBR    R0,     R7                      ; D8C9   0107

        SUBR    R0,     R5                      ; D8CA   0105
        SUBR    R0,     R5                      ; D8CB   0105
        SUBR    R0,     R6                      ; D8CC   0106
        SUBR    R0,     R7                      ; D8CD   0107

        SUBR    R0,     R0                      ; D8CE   0100
        SUBR    R0,     R7                      ; D8CF   0107

        SUBR    R0,     R5                      ; D8D0   0105
        SUBR    R0,     R5                      ; D8D1   0105
        SUBR    R0,     R7                      ; D8D2   0107

        SUBR    R0,     R3                      ; D8D3   0103
        SUBR    R1,     R1                      ; D8D4   0109
        SUBR    R0,     R7                      ; D8D5   0107

        DECLE   $010E,  $0104,  $0104,  $0000   ; D8D6   010E 0104 0104 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8DA   0000 0000 0000 0000
        DECLE   $0000                           ; D8DE   0000

        SUBR    R0,     R5                      ; D8DF   0105
        SUBR    R0,     R6                      ; D8E0   0106
        SUBR    R0,     R6                      ; D8E1   0106
        SUBR    R0,     R7                      ; D8E2   0107

        SUBR    R0,     R3                      ; D8E3   0103
        SUBR    R0,     R7                      ; D8E4   0107

        SUBR    R0,     R3                      ; D8E5   0103
        SUBR    R0,     R3                      ; D8E6   0103
        SUBR    R0,     R6                      ; D8E7   0106
        SUBR    R0,     R3                      ; D8E8   0103
        SUBR    R0,     R3                      ; D8E9   0103
        SUBR    R0,     R7                      ; D8EA   0107

        SUBR    R0,     R5                      ; D8EB   0105
        SUBR    R0,     R5                      ; D8EC   0105
        SUBR    R0,     R7                      ; D8ED   0107

        SUBR    R0,     R3                      ; D8EE   0103
        SUBR    R0,     R7                      ; D8EF   0107

        SUBR    R0,     R0                      ; D8F0   0100
        SUBR    R0,     R5                      ; D8F1   0105
        SUBR    R0,     R5                      ; D8F2   0105
        SUBR    R0,     R6                      ; D8F3   0106
        SUBR    R0,     R7                      ; D8F4   0107

        SUBR    R0,     R0                      ; D8F5   0100
        SUBR    R0,     R7                      ; D8F6   0107

        SUBR    R0,     R5                      ; D8F7   0105
        SUBR    R0,     R5                      ; D8F8   0105
        SUBR    R0,     R7                      ; D8F9   0107

        SUBR    R0,     R3                      ; D8FA   0103
        SUBR    R1,     R1                      ; D8FB   0109
        SUBR    R0,     R7                      ; D8FC   0107

        DECLE   $0000,  $0000                   ; D8FD   0000 0000

        SUBR    R0,     R5                      ; D8FF   0105
        SUBR    R0,     R5                      ; D900   0105
        SUBR    R0,     R7                      ; D901   0107

        SUBR    R0,     R3                      ; D902   0103
        SUBR    R0,     R7                      ; D903   0107

        SUBR    R0,     R0                      ; D904   0100
        SUBR    R0,     R5                      ; D905   0105
        SUBR    R0,     R5                      ; D906   0105
        SUBR    R0,     R7                      ; D907   0107

        SUBR    R0,     R3                      ; D908   0103
        SUBR    R1,     R1                      ; D909   0109
        SUBR    R0,     R7                      ; D90A   0107

        SUBR    R0,     R5                      ; D90B   0105
        SUBR    R0,     R3                      ; D90C   0103
        SUBR    R0,     R6                      ; D90D   0106
        SUBR    R0,     R3                      ; D90E   0103
        SUBR    R0,     R3                      ; D90F   0103
        SUBR    R0,     R7                      ; D910   0107

        DECLE   $0000,  $0000                   ; D911   0000 0000

        SUBR    R0,     R3                      ; D913   0103
        SUBR    R0,     R3                      ; D914   0103
        SUBR    R0,     R4                      ; D915   0104
        SUBR    R0,     R3                      ; D916   0103
        SUBR    R0,     R3                      ; D917   0103
        SUBR    R0,     R0                      ; D918   0100
        SUBR    R0,     R5                      ; D919   0105
        SUBR    R0,     R3                      ; D91A   0103
        SUBR    R0,     R6                      ; D91B   0106
        SUBR    R0,     R3                      ; D91C   0103
        SUBR    R0,     R3                      ; D91D   0103
        SUBR    R0,     R7                      ; D91E   0107

        SUBR    R0,     R3                      ; D91F   0103
        SUBR    R0,     R3                      ; D920   0103
        SUBR    R0,     R6                      ; D921   0106
        SUBR    R0,     R0                      ; D922   0100
        SUBR    R0,     R0                      ; D923   0100
        SUBR    R0,     R7                      ; D924   0107

        SUBR    R0,     R3                      ; D925   0103
        SUBR    R0,     R3                      ; D926   0103
        SUBR    R0,     R6                      ; D927   0106
        SUBR    R0,     R0                      ; D928   0100
        SUBR    R0,     R0                      ; D929   0100
        SUBR    R0,     R7                      ; D92A   0107

        SUBR    R0,     R5                      ; D92B   0105
        SUBR    R0,     R5                      ; D92C   0105
        SUBR    R0,     R6                      ; D92D   0106
        SUBR    R0,     R7                      ; D92E   0107

        SUBR    R0,     R0                      ; D92F   0100
        SUBR    R0,     R7                      ; D930   0107

        SUBR    R0,     R3                      ; D931   0103
        SUBR    R1,     R0                      ; D932   0108
        SUBR    R0,     R4                      ; D933   0104
        SUBR    R0,     R3                      ; D934   0103
        SUBR    R0,     R7                      ; D935   0107

        SUBR    R0,     R0                      ; D936   0100
        SUBR    R0,     R5                      ; D937   0105
        SUBR    R0,     R5                      ; D938   0105
        SUBR    R0,     R6                      ; D939   0106
        SUBR    R0,     R3                      ; D93A   0103
        SUBR    R1,     R1                      ; D93B   0109
        SUBR    R0,     R7                      ; D93C   0107

        SUBR    R0,     R5                      ; D93D   0105
        SUBR    R0,     R5                      ; D93E   0105
        SUBR    R0,     R7                      ; D93F   0107

        SUBR    R0,     R3                      ; D940   0103
        SUBR    R0,     R3                      ; D941   0103
        SUBR    R0,     R7                      ; D942   0107

        SUBR    R0,     R3                      ; D943   0103
        SUBR    R0,     R3                      ; D944   0103
        SUBR    R0,     R6                      ; D945   0106
        SUBR    R0,     R0                      ; D946   0100
        SUBR    R0,     R0                      ; D947   0100
        SUBR    R0,     R7                      ; D948   0107

        SUBR    R0,     R3                      ; D949   0103
        SUBR    R0,     R3                      ; D94A   0103
        SUBR    R0,     R6                      ; D94B   0106
        SUBR    R0,     R0                      ; D94C   0100
        SUBR    R0,     R0                      ; D94D   0100
        SUBR    R0,     R7                      ; D94E   0107

        DECLE   $0000,  $0000,  $0000,  $0000   ; D94F   0000 0000 0000 0000

        SUBR    R0,     R5                      ; D953   0105
        SUBR    R0,     R3                      ; D954   0103
        SUBR    R0,     R6                      ; D955   0106
        SUBR    R0,     R7                      ; D956   0107

        SUBR    R0,     R0                      ; D957   0100
        SUBR    R0,     R7                      ; D958   0107

        SUBR    R0,     R0                      ; D959   0100
        SUBR    R0,     R5                      ; D95A   0105
        SUBR    R0,     R6                      ; D95B   0106
        SUBR    R0,     R0                      ; D95C   0100
        SUBR    R0,     R3                      ; D95D   0103
        SUBR    R0,     R7                      ; D95E   0107

        SUBR    R0,     R0                      ; D95F   0100
        SUBR    R0,     R5                      ; D960   0105
        SUBR    R0,     R5                      ; D961   0105
        SUBR    R0,     R0                      ; D962   0100
        SUBR    R0,     R3                      ; D963   0103
        SUBR    R0,     R7                      ; D964   0107

        SUBR    R0,     R0                      ; D965   0100
        SUBR    R0,     R3                      ; D966   0103
        SUBR    R0,     R6                      ; D967   0106
        SUBR    R0,     R0                      ; D968   0100
        SUBR    R0,     R3                      ; D969   0103
        SUBR    R0,     R3                      ; D96A   0103
        SUBR    R0,     R0                      ; D96B   0100
        SUBR    R0,     R5                      ; D96C   0105
        SUBR    R0,     R7                      ; D96D   0107

        SUBR    R0,     R4                      ; D96E   0104
        SUBR    R1,     R6                      ; D96F   010E
        SUBR    R0,     R4                      ; D970   0104
        SUBR    R0,     R0                      ; D971   0100
        SUBR    R1,     R6                      ; D972   010E
        SUBR    R0,     R4                      ; D973   0104
        SUBR    R0,     R0                      ; D974   0100
        SUBR    R1,     R0                      ; D975   0108
        SUBR    R1,     R0                      ; D976   0108
        SUBR    R1,     R6                      ; D977   010E
        SUBR    R1,     R6                      ; D978   010E
        SUBR    R0,     R4                      ; D979   0104
        SUBR    R0,     R0                      ; D97A   0100
        SUBR    R1,     R0                      ; D97B   0108
        SUBR    R0,     R4                      ; D97C   0104
        SUBR    R1,     R2                      ; D97D   010A
        SUBR    R0,     R0                      ; D97E   0100
        SUBR    R0,     R0                      ; D97F   0100
        SUBR    R1,     R5                      ; D980   010D
        SUBR    R0,     R3                      ; D981   0103
        SUBR    R0,     R7                      ; D982   0107

        DECLE   $0000,  $0000,  $0000           ; D983   0000 0000 0000

        SUBR    R1,     R2                      ; D986   010A
        SUBR    R0,     R0                      ; D987   0100
        SUBR    R0,     R0                      ; D988   0100
        SUBR    R0,     R3                      ; D989   0103
        SUBR    R0,     R3                      ; D98A   0103
        SUBR    R0,     R7                      ; D98B   0107

        SUBR    R0,     R5                      ; D98C   0105
        SUBR    R0,     R6                      ; D98D   0106
        SUBR    R0,     R0                      ; D98E   0100
        SUBR    R0,     R3                      ; D98F   0103
        SUBR    R0,     R3                      ; D990   0103
        SUBR    R0,     R7                      ; D991   0107

        SUBR    R0,     R5                      ; D992   0105
        SUBR    R0,     R5                      ; D993   0105
        SUBR    R0,     R6                      ; D994   0106
        SUBR    R0,     R3                      ; D995   0103
        SUBR    R0,     R3                      ; D996   0103
        SUBR    R0,     R7                      ; D997   0107

        SUBR    R0,     R5                      ; D998   0105
        SUBR    R0,     R5                      ; D999   0105
        SUBR    R0,     R6                      ; D99A   0106
        SUBR    R0,     R3                      ; D99B   0103
        SUBR    R0,     R3                      ; D99C   0103
        SUBR    R0,     R7                      ; D99D   0107

        DECLE   $0000,  $0000,  $0000           ; D99E   0000 0000 0000

        SUBR    R0,     R3                      ; D9A1   0103
        SUBR    R0,     R3                      ; D9A2   0103
        SUBR    R0,     R7                      ; D9A3   0107

        SUBR    R0,     R0                      ; D9A4   0100
        SUBR    R1,     R3                      ; D9A5   010B
        SUBR    R0,     R7                      ; D9A6   0107

        DECLE   $010A,  $010C,  $0104,  $010A   ; D9A7   010A 010C 0104 010A
        DECLE   $0100,  $0100,  $010D,  $0103   ; D9AB   0100 0100 010D 0103
        DECLE   $0106,  $0100,  $0104,  $0100   ; D9AF   0106 0100 0104 0100
        DECLE   $0100,  $0109,  $0104,  $010A   ; D9B3   0100 0109 0104 010A
        DECLE   $0103,  $0100,  $0000,  $0000   ; D9B7   0103 0100 0000 0000

        SUBR    R0,     R5                      ; D9BB   0105
        SUBR    R0,     R3                      ; D9BC   0103
        SUBR    R0,     R6                      ; D9BD   0106
        SUBR    R0,     R7                      ; D9BE   0107

        SUBR    R0,     R0                      ; D9BF   0100
        SUBR    R0,     R7                      ; D9C0   0107

        SUBR    R0,     R0                      ; D9C1   0100
        SUBR    R0,     R5                      ; D9C2   0105
        SUBR    R0,     R6                      ; D9C3   0106
        SUBR    R0,     R0                      ; D9C4   0100
        SUBR    R0,     R3                      ; D9C5   0103
        SUBR    R0,     R7                      ; D9C6   0107

        SUBR    R0,     R0                      ; D9C7   0100
        SUBR    R0,     R5                      ; D9C8   0105
        SUBR    R0,     R7                      ; D9C9   0107

        DECLE   $0100,  $010E,  $010E,  $0100   ; D9CA   0100 010E 010E 0100
        DECLE   $0108,  $0106,  $0100,  $0100   ; D9CE   0108 0106 0100 0100
        DECLE   $0104,  $0000,  $0000,  $0000   ; D9D2   0104 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9E2   0000 0000 0000 0000
        DECLE   $0058,  $0002,  $00A3,  $0000   ; D9E6   0058 0002 00A3 0000
        DECLE   $0010,  $0009,  $0057,  $0006   ; D9EA   0010 0009 0057 0006
        DECLE   $00B9,  $0000,  $0023,  $0029   ; D9EE   00B9 0000 0023 0029
        DECLE   $0059,  $0006,  $00C8,  $0001   ; D9F2   0059 0006 00C8 0001
        DECLE   $0032,  $0029,  $0059,  $0006   ; D9F6   0032 0029 0059 0006
        DECLE   $00D3,  $0001,  $0043,  $0029   ; D9FA   00D3 0001 0043 0029
        DECLE   $0067,  $0006,  $00B0,  $0001   ; D9FE   0067 0006 00B0 0001
        DECLE   $0053,  $0029,  $0050,  $0002   ; DA02   0053 0029 0050 0002
        DECLE   $0030,  $0001                   ; DA06   0030 0001

        INCR    R7                              ; DA08   000F

        INCR    R0                              ; DA09   0008
L_DA0A:
        RLC     R3,     2                       ; DA0A   0057
        DECLE   $0006,  $00B8,  $0001,  $0067   ; DA0B   0006 00B8 0001 0067
        DECLE   $0029,  $0058,  $0002,  $00A9   ; DA0F   0029 0058 0002 00A9
        DECLE   $0000,  $0073,  $0019,  $0231   ; DA13   0000 0073 0019 0231

        ANDR    R6,     R4                      ; DA17   01B4
        CMPR    R4,     R4                      ; DA18   0164
        CMPR    R2,     R4                      ; DA19   0154
        ADDR    R3,     R7                      ; DA1A   00DF

        XORR    R4,     R5                      ; DA1B   01E5
        XORR    R6,     R5                      ; DA1C   01F5
        ADCR    R7                              ; DA1D   002F

        CMPR    R0,     R4                      ; DA1E   0144
L_DA1F:
        CMPR    R6,     R4                      ; DA1F   0174
        SUBR    R6,     R6                      ; DA20   0136
        ADDR    R3,     R7                      ; DA21   00DF

        DECLE   $0205,  $0215                   ; DA22   0205 0215

        ADCR    R7                              ; DA24   002F

        SUBR    R0,     R4                      ; DA25   0104
L_DA26:
        ADDR    R6,     R4                      ; DA26   00F4
        SUBR    R2,     R6                      ; DA27   0116
        SUBR    R3,     R7                      ; DA28   011F

        DECLE   $0124,  $01C7,  $01D7,  $03FF   ; DA29   0124 01C7 01D7 03FF
        DECLE   $023F,  $0027,  $013F,  $0194   ; DA2D   023F 0027 013F 0194
        DECLE   $0184,  $01A4,  $0000           ; DA31   0184 01A4 0000

        PSHR    R5                              ; DA34   0275

        JSR     R5,     L_6378                  ; DA35   0004 0160 0378
        DECLE   $000D                           ; DA38   000D

        MOVR    R7,     R0                      ; DA39   00B8
        ADDI    #$00B9, R0                      ; DA3A   02F8 00B9
        MVO     R0,     G_031D                  ; DA3C   0240 031D
        CLRR    R0                              ; DA3E   01C0
        MVO     R0,     G_0102                  ; DA3F   0240 0102
        MVO     R0,     G_0103                  ; DA41   0240 0103
        MVO     R0,     G_0107                  ; DA43   0240 0107
        MVII    #$0003, R0                      ; DA45   02B8 0003
        MVO     R0,     G_0352                  ; DA47   0240 0352

        JSR     R5,     L_593B                  ; DA49   0004 0158 013B

        MOVR    R7,     R0                      ; DA4C   00B8
        ADDI    #$0019, R0                      ; DA4D   02F8 0019
        MVO     R0,     .ISRVEC.0               ; DA4F   0240 0100
        SWAP    R0,     1                       ; DA51   0040
        MVO     R0,     .ISRVEC.1               ; DA52   0240 0101
        EIS                                     ; DA54   0002
L_DA55:
        MVI     G_0107, R0                      ; DA55   0280 0107
        CMPI    #$0003, R0                      ; DA57   0378 0003
        BNEQ    L_DA55                          ; DA59   022C 0005

        SDBD                                    ; DA5B   0001
        MVII    #$546C, R0                      ; DA5C   02B8 006C 0054
        MVO     R0,     .ISRVEC.0               ; DA5F   0240 0100
        SWAP    R0,     1                       ; DA61   0040
        MVO     R0,     .ISRVEC.1               ; DA62   0240 0101
        B       L_D78C                          ; DA64   0220 02D9

        PSHR    R5                              ; DA66   0275
        MVI     .PSG0.rgt_hand,R0               ; DA67   0280 01FE
        AND     .PSG0.lft_hand,R0               ; DA69   0380 01FF
        CMP     G_0108, R0                      ; DA6B   0340 0108
        MVO     R0,     G_0108                  ; DA6D   0240 0108
        BNEQ    L_DA84                          ; DA6F   020C 0013

        MVI     G_0107, R1                      ; DA71   0281 0107
        CMPI    #$0001, R1                      ; DA73   0379 0001
        BEQ     L_DA7D                          ; DA75   0204 0006

        CMPI    #$00FF, R0                      ; DA77   0378 00FF
        BNEQ    L_DA84                          ; DA79   020C 0009
        B       L_DA81                          ; DA7B   0200 0004

L_DA7D:
        CMPI    #$00FF, R0                      ; DA7D   0378 00FF
        BEQ     L_DA84                          ; DA7F   0204 0003

L_DA81:
        INCR    R1                              ; DA81   0009
        MVO     R1,     G_0107                  ; DA82   0241 0107
L_DA84:
        MVII    #$0002, R0                      ; DA84   02B8 0002
        MVO     R0,     .STIC.EDGE              ; DA86   0240 0032
        MVO     R0,     .STIC.VIDEN             ; DA88   0240 0020
        MVI     .STIC.MODE,R0                   ; DA8A   0280 0021
        CLRR    R0                              ; DA8C   01C0
        MVO     R0,     .STIC.BORD              ; DA8D   0240 002C
        MVII    #$000D, R0                      ; DA8F   02B8 000D
        MVO     R0,     .STIC.CS.0              ; DA91   0240 0028
        CLRR    R0                              ; DA93   01C0
        CLRR    R5                              ; DA94   01ED
L_DA95:
        MVO@    R0,     R5                      ; DA95   0268
        CMPI    #$0018, R5                      ; DA96   037D 0018
        BNEQ    L_DA95                          ; DA98   022C 0004

        MVI     G_0102, R0                      ; DA9A   0280 0102
        DECR    R0                              ; DA9C   0010
        MVO     R0,     G_0102                  ; DA9D   0240 0102
        BPL     L_DAEF                          ; DA9F   0203 004E

        MVII    #$0001, R0                      ; DAA1   02B8 0001
        MVO     R0,     G_0102                  ; DAA3   0240 0102
        MVI     G_0103, R0                      ; DAA5   0280 0103
        DECR    R0                              ; DAA7   0010
        MVO     R0,     G_0103                  ; DAA8   0240 0103
        MVO     R0,     .STIC.VDLY              ; DAAA   0240 0031
        BPL     L_DAEF                          ; DAAC   0203 0041

        MVII    #$0007, R0                      ; DAAE   02B8 0007
        MVO     R0,     G_0103                  ; DAB0   0240 0103
        MVII    #$0214, R4                      ; DAB2   02BC 0214
        MVII    #$0200, R5                      ; DAB4   02BD 0200
        MVII    #$000B, R2                      ; DAB6   02BA 000B
L_DAB8:
        MVII    #$0014, R3                      ; DAB8   02BB 0014
L_DABA:
        MVI@    R4,     R0                      ; DABA   02A0
        MVO@    R0,     R5                      ; DABB   0268
        DECR    R3                              ; DABC   0013
        BNEQ    L_DABA                          ; DABD   022C 0004

        DECR    R2                              ; DABF   0012
        BNEQ    L_DAB8                          ; DAC0   022C 0009

        CLRR    R0                              ; DAC2   01C0
        MVII    #$0014, R3                      ; DAC3   02BB 0014
L_DAC5:
        MVO@    R0,     R5                      ; DAC5   0268
        DECR    R3                              ; DAC6   0013
        BNEQ    L_DAC5                          ; DAC7   022C 0003

        MVI     G_031D, R5                      ; DAC9   0285 031D
        MVI@    R5,     R4                      ; DACB   02AC
        CMPI    #$0001, R4                      ; DACC   037C 0001
        BLT     L_DAED                          ; DACE   0205 001D
        BEQ     L_DAE9                          ; DAD0   0204 0017

        MVI@    R5,     R3                      ; DAD2   02AB
        MOVR    R3,     R0                      ; DAD3   0098
        ANDI    #$0008, R0                      ; DAD4   03B8 0008
        XORR    R0,     R3                      ; DAD6   01C3
        TSTR    R0                              ; DAD7   0080
        BEQ     L_DADE                          ; DAD8   0204 0004

        SDBD                                    ; DADA   0001
        XORI    #$1000, R3                      ; DADB   03FB 0000 0010
L_DADE:
        MVI@    R5,     R0                      ; DADE   02A8
        SUBI    #$0020, R0                      ; DADF   0338 0020
        BMI     L_DAED                          ; DAE1   020B 000A

        SLL     R0,     2                       ; DAE3   004C
        SLL     R0,     1                       ; DAE4   0048
        XORR    R3,     R0                      ; DAE5   01D8
        MVO@    R0,     R4                      ; DAE6   0260
        B       L_DADE                          ; DAE7   0220 000A

L_DAE9:
        MVII    #$0003, R0                      ; DAE9   02B8 0003
        MVO     R0,     G_0107                  ; DAEB   0240 0107
L_DAED:
        MVO     R5,     G_031D                  ; DAED   0245 031D

L_DAEF:
        JSR     R5,     X_PLAY_NOTE             ; DAEF   0004 0118 02BD

        PULR    R7                              ; DAF2   02B7

        DECLE   $0000,  $02DC,  $0007,  $0121   ; DAF3   0000 02DC 0007 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DAF7   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DAFB   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DAFF   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DB03   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0000   ; DB07   0121 0121 0121 0000
        DECLE   $02DC,  $0000,  $0120,  $0120   ; DB0B   02DC 0000 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DB0F   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DB13   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DB17   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DB1B   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0000,  $02DC   ; DB1F   0120 0120 0000 02DC
        DECLE   $0000                           ; DB23   0000

        SUBR    R4,     R0                      ; DB24   0120
        SUBR    R4,     R0                      ; DB25   0120
        SUBR    R4,     R0                      ; DB26   0120
        SUBR    R4,     R0                      ; DB27   0120
        SUBR    R4,     R5                      ; DB28   0125
        SUBR    R4,     R7                      ; DB29   0127

        SUBR    R4,     R5                      ; DB2A   0125
        SUBR    R4,     R3                      ; DB2B   0123
        SUBR    R4,     R3                      ; DB2C   0123
        SUBR    R4,     R3                      ; DB2D   0123
        SUBR    R4,     R3                      ; DB2E   0123
        SUBR    R4,     R5                      ; DB2F   0125
        SUBR    R4,     R7                      ; DB30   0127

        DECLE   $0125,  $0123,  $012E,  $0120   ; DB31   0125 0123 012E 0120
        DECLE   $0120,  $0120,  $0120,  $0000   ; DB35   0120 0120 0120 0000
        DECLE   $02DC,  $0000                   ; DB39   02DC 0000

        SUBR    R4,     R0                      ; DB3B   0120
        SUBR    R4,     R0                      ; DB3C   0120
        SUBR    R4,     R0                      ; DB3D   0120
        SUBR    R4,     R0                      ; DB3E   0120
        SUBR    R4,     R6                      ; DB3F   0126
        SUBR    R4,     R3                      ; DB40   0123
        SUBR    R4,     R5                      ; DB41   0125
        SUBR    R4,     R7                      ; DB42   0127

        DECLE   $0123,  $0125,  $0129,  $0125   ; DB43   0123 0125 0129 0125
        DECLE   $0120,  $0125,  $0129,  $0124   ; DB47   0120 0125 0129 0124
        DECLE   $0120,  $0120,  $0120,  $0120   ; DB4B   0120 0120 0120 0120
        DECLE   $0000,  $02DC,  $0000           ; DB4F   0000 02DC 0000

        SUBR    R4,     R0                      ; DB52   0120
        SUBR    R4,     R0                      ; DB53   0120
        SUBR    R4,     R0                      ; DB54   0120
        SUBR    R4,     R0                      ; DB55   0120
        SUBR    R4,     R6                      ; DB56   0126
        SUBR    R4,     R7                      ; DB57   0127
        SUBR    R4,     R7                      ; DB58   0127

        SUBR    R4,     R0                      ; DB59   0120
        SUBR    R4,     R7                      ; DB5A   0127
        SUBR    R4,     R7                      ; DB5B   0127
        SUBR    R4,     R7                      ; DB5C   0127

        SUBR    R4,     R6                      ; DB5D   0126
        SUBR    R4,     R7                      ; DB5E   0127
        SUBR    R4,     R7                      ; DB5F   0127
        SUBR    R4,     R7                      ; DB60   0127

        DECLE   $0124,  $0120,  $0120,  $0120   ; DB61   0124 0120 0120 0120
        DECLE   $0120,  $0000,  $02DC,  $0007   ; DB65   0120 0000 02DC 0007
        DECLE   $0122,  $0122,  $0122,  $0122   ; DB69   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DB6D   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DB71   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DB75   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DB79   0122 0122 0122 0122
        DECLE   $0000,  $0000,  $02E1,  $0007   ; DB7D   0000 0000 02E1 0007
        DECLE   $0053,  $0075,  $0070,  $0065   ; DB81   0053 0075 0070 0065
        DECLE   $0072,  $0020,  $0050,  $0072   ; DB85   0072 0020 0050 0072
        DECLE   $006F,  $0000,  $02E1,  $0007   ; DB89   006F 0000 02E1 0007
        DECLE   $0056,  $006F,  $006C,  $006C   ; DB8D   0056 006F 006C 006C
        DECLE   $0065,  $0079,  $0062,  $0061   ; DB91   0065 0079 0062 0061
        DECLE   $006C,  $006C,  $0000,  $0000   ; DB95   006C 006C 0000 0000
        DECLE   $0000,  $0000,  $02DD,  $0000   ; DB99   0000 0000 02DD 0000
        DECLE   $0044,  $0065,  $0073,  $0069   ; DB9D   0044 0065 0073 0069
        DECLE   $0067,  $006E,  $0065,  $0064   ; DBA1   0067 006E 0065 0064
        DECLE   $0020,  $0061,  $006E,  $0064   ; DBA5   0020 0061 006E 0064
        DECLE   $0000,  $02DD,  $0000,  $0050   ; DBA9   0000 02DD 0000 0050
        DECLE   $0072,  $006F,  $0067,  $0072   ; DBAD   0072 006F 0067 0072
        DECLE   $0061,  $006D,  $006D,  $0065   ; DBB1   0061 006D 006D 0065
        DECLE   $0064,  $0020,  $0062,  $0079   ; DBB5   0064 0020 0062 0079
        DECLE   $003A,  $0000,  $0000,  $02E1   ; DBB9   003A 0000 0000 02E1
        DECLE   $0007,  $0053,  $0074,  $0065   ; DBBD   0007 0053 0074 0065
        DECLE   $0076,  $0065,  $0020,  $0045   ; DBC1   0076 0065 0020 0045
        DECLE   $0074,  $0074,  $0069,  $006E   ; DBC5   0074 0074 0069 006E
        DECLE   $0067,  $0065,  $0072,  $0000   ; DBC9   0067 0065 0072 0000
        DECLE   $0000,  $0000,  $02DD,  $0000   ; DBCD   0000 0000 02DD 0000
        DECLE   $0047,  $0072,  $0061,  $0070   ; DBD1   0047 0072 0061 0070
        DECLE   $0068,  $0069,  $0063,  $0073   ; DBD5   0068 0069 0063 0073
        DECLE   $0020,  $0042,  $0079,  $003A   ; DBD9   0020 0042 0079 003A
        DECLE   $0000,  $0000,  $02E1,  $0007   ; DBDD   0000 0000 02E1 0007
        DECLE   $0043,  $006F,  $006E,  $006E   ; DBE1   0043 006F 006E 006E
        DECLE   $0069,  $0065,  $0020,  $0047   ; DBE5   0069 0065 0020 0047
        DECLE   $006F,  $006C,  $0064,  $006D   ; DBE9   006F 006C 0064 006D
        DECLE   $0061,  $006E,  $0000,  $02E1   ; DBED   0061 006E 0000 02E1
        DECLE   $0007,  $0053,  $0074,  $0065   ; DBF1   0007 0053 0074 0065
        DECLE   $0076,  $0065,  $0020,  $0045   ; DBF5   0076 0065 0020 0045
        DECLE   $0074,  $0074,  $0069,  $006E   ; DBF9   0074 0074 0069 006E
        DECLE   $0067,  $0065,  $0072,  $0000   ; DBFD   0067 0065 0072 0000
        DECLE   $0000,  $0000,  $02DD,  $0000   ; DC01   0000 0000 02DD 0000
        DECLE   $0050,  $0072,  $006F,  $0064   ; DC05   0050 0072 006F 0064
        DECLE   $0075,  $0063,  $0065,  $0064   ; DC09   0075 0063 0065 0064
        DECLE   $0020,  $0042,  $0079,  $003A   ; DC0D   0020 0042 0079 003A
        DECLE   $0000,  $0000,  $02E4,  $0007   ; DC11   0000 0000 02E4 0007
        DECLE   $0044,  $0061,  $0076,  $0065   ; DC15   0044 0061 0076 0065
        DECLE   $0020,  $0057,  $0061,  $0072   ; DC19   0020 0057 0061 0072
        DECLE   $0068,  $006F,  $006C,  $0000   ; DC1D   0068 006F 006C 0000
        DECLE   $02DD,  $0000,  $0066,  $006F   ; DC21   02DD 0000 0066 006F
        DECLE   $0072,  $0000,  $02DF,  $0007   ; DC25   0072 0000 02DF 0007
        DECLE   $0049,  $004E,  $0054,  $0056   ; DC29   0049 004E 0054 0056
        DECLE   $0020,  $0043,  $006F,  $0072   ; DC2D   0020 0043 006F 0072
        DECLE   $0070,  $006F,  $0072,  $0061   ; DC31   0070 006F 0072 0061
        DECLE   $0074,  $0069,  $006F,  $006E   ; DC35   0074 0069 006F 006E
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC39   0000 0000 0000 0000
        DECLE   $02DC,  $0007,  $0121,  $0121   ; DC3D   02DC 0007 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DC41   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DC45   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DC49   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0121,  $0121   ; DC4D   0121 0121 0121 0121
        DECLE   $0121,  $0121,  $0000,  $02DC   ; DC51   0121 0121 0000 02DC
        DECLE   $0000,  $0120,  $0120,  $0120   ; DC55   0000 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DC59   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DC5D   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DC61   0120 0120 0120 0120
        DECLE   $0120,  $0120,  $0120,  $0120   ; DC65   0120 0120 0120 0120
        DECLE   $0120,  $0000,  $02DC,  $0000   ; DC69   0120 0000 02DC 0000

        SUBR    R4,     R0                      ; DC6D   0120
        SUBR    R4,     R0                      ; DC6E   0120
        SUBR    R4,     R0                      ; DC6F   0120
        SUBR    R4,     R0                      ; DC70   0120
        SUBR    R4,     R5                      ; DC71   0125
        SUBR    R4,     R7                      ; DC72   0127

        SUBR    R4,     R5                      ; DC73   0125
        SUBR    R4,     R3                      ; DC74   0123
        SUBR    R4,     R3                      ; DC75   0123
        SUBR    R4,     R3                      ; DC76   0123
        SUBR    R4,     R3                      ; DC77   0123
        SUBR    R4,     R5                      ; DC78   0125
        SUBR    R4,     R7                      ; DC79   0127

        DECLE   $0125,  $0123,  $012E,  $0120   ; DC7A   0125 0123 012E 0120
        DECLE   $0120,  $0120,  $0120,  $0000   ; DC7E   0120 0120 0120 0000
        DECLE   $02DC,  $0000                   ; DC82   02DC 0000

        SUBR    R4,     R0                      ; DC84   0120
        SUBR    R4,     R0                      ; DC85   0120
        SUBR    R4,     R0                      ; DC86   0120
        SUBR    R4,     R0                      ; DC87   0120
        SUBR    R4,     R6                      ; DC88   0126
        SUBR    R4,     R3                      ; DC89   0123
        SUBR    R4,     R5                      ; DC8A   0125
        SUBR    R4,     R7                      ; DC8B   0127

        DECLE   $0123,  $0125,  $0129,  $0125   ; DC8C   0123 0125 0129 0125
        DECLE   $0120,  $0125,  $0129,  $0124   ; DC90   0120 0125 0129 0124
        DECLE   $0120,  $0120,  $0120,  $0120   ; DC94   0120 0120 0120 0120
        DECLE   $0000,  $02DC,  $0000           ; DC98   0000 02DC 0000

        SUBR    R4,     R0                      ; DC9B   0120
        SUBR    R4,     R0                      ; DC9C   0120
        SUBR    R4,     R0                      ; DC9D   0120
        SUBR    R4,     R0                      ; DC9E   0120
        SUBR    R4,     R6                      ; DC9F   0126
        SUBR    R4,     R7                      ; DCA0   0127
        SUBR    R4,     R7                      ; DCA1   0127

        SUBR    R4,     R0                      ; DCA2   0120
        SUBR    R4,     R7                      ; DCA3   0127
        SUBR    R4,     R7                      ; DCA4   0127
        SUBR    R4,     R7                      ; DCA5   0127

        SUBR    R4,     R6                      ; DCA6   0126
        SUBR    R4,     R7                      ; DCA7   0127
        SUBR    R4,     R7                      ; DCA8   0127
        SUBR    R4,     R7                      ; DCA9   0127

        DECLE   $0124,  $0120,  $0120,  $0120   ; DCAA   0124 0120 0120 0120
        DECLE   $0120,  $0000,  $02DC,  $0007   ; DCAE   0120 0000 02DC 0007
        DECLE   $0122,  $0122,  $0122,  $0122   ; DCB2   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DCB6   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DCBA   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DCBE   0122 0122 0122 0122
        DECLE   $0122,  $0122,  $0122,  $0122   ; DCC2   0122 0122 0122 0122
        DECLE   $0000,  $0000,  $02E1,  $0007   ; DCC6   0000 0000 02E1 0007
        DECLE   $0053,  $0075,  $0070,  $0065   ; DCCA   0053 0075 0070 0065
        DECLE   $0072,  $0020,  $0050,  $0072   ; DCCE   0072 0020 0050 0072
        DECLE   $006F,  $0000,  $02E1,  $0007   ; DCD2   006F 0000 02E1 0007
        DECLE   $0056,  $006F,  $006C,  $006C   ; DCD6   0056 006F 006C 006C
        DECLE   $0065,  $0079,  $0062,  $0061   ; DCDA   0065 0079 0062 0061
        DECLE   $006C,  $006C,  $0000,  $0000   ; DCDE   006C 006C 0000 0000
        DECLE   $02DD,  $0007,  $0043,  $006F   ; DCE2   02DD 0007 0043 006F
        DECLE   $0070,  $0079,  $0072,  $0069   ; DCE6   0070 0079 0072 0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; DCEA   0067 0068 0074 0020
        DECLE   $0028,  $0063,  $0029,  $0020   ; DCEE   0028 0063 0029 0020
        DECLE   $0031,  $0039,  $0038,  $0038   ; DCF2   0031 0039 0038 0038
        DECLE   $0000,  $02DE,  $0007,  $0049   ; DCF6   0000 02DE 0007 0049
        DECLE   $004E,  $0054,  $0056,  $0020   ; DCFA   004E 0054 0056 0020
        DECLE   $0043,  $006F,  $0072,  $0070   ; DCFE   0043 006F 0072 0070
        DECLE   $006F,  $0072,  $0061,  $0074   ; DD02   006F 0072 0061 0074
        DECLE   $0069,  $006F,  $006E,  $0000   ; DD06   0069 006F 006E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD12   0000 0000 0000 0000
        DECLE   $0001                           ; DD16   0001

        PSHR    R5                              ; DD17   0275
        MVII    #$0200, R4                      ; DD18   02BC 0200
        SDBD                                    ; DD1A   0001
        MVII    #$3200, R1                      ; DD1B   02B9 0000 0032
        MVII    #$00F0, R0                      ; DD1E   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; DD20   0004 0114 0341

        PULR    R7                              ; DD23   02B7

        PSHR    R5                              ; DD24   0275
        MVII    #$000A, R0                      ; DD25   02B8 000A
        MVO     R0,     G_0170                  ; DD27   0240 0170
        MVI     G_0352, R0                      ; DD29   0280 0352
        ANDI    #$0080, R0                      ; DD2B   03B8 0080
        SLL     R0,     1                       ; DD2D   0048
        SWAP    R0,     1                       ; DD2E   0040
        MOVR    R0,     R1                      ; DD2F   0081
        SLL     R1,     2                       ; DD30   004D
        SLL     R1,     2                       ; DD31   004D
        XORI    #$0000, R1                      ; DD32   03F9 0000
        MVO     R1,     G_0104                  ; DD34   0241 0104

        JSR     R5,     L_5743                  ; DD36   0004 0154 0343

        MOVR    R7,     R5                      ; DD39   00BD
        ADDI    #$004F, R5                      ; DD3A   02FD 004F
        MVI     G_0352, R0                      ; DD3C   0280 0352
        ANDI    #$0080, R0                      ; DD3E   03B8 0080
        BEQ     L_DD45                          ; DD40   0204 0003

        MOVR    R7,     R5                      ; DD42   00BD
        ADDI    #$02C2, R5                      ; DD43   02FD 02C2
L_DD45:
        MVII    #$0200, R4                      ; DD45   02BC 0200
L_DD47:
        SDBD                                    ; DD47   0001
        MVI@    R5,     R0                      ; DD48   02A8
        MVO@    R0,     R4                      ; DD49   0260
        CMPI    #$02F0, R4                      ; DD4A   037C 02F0
        BLT     L_DD47                          ; DD4C   0225 0006
        INCR    R7                              ; DD4E   000F

        PSHR    R5                              ; DD4F   0275
L_DD50:
        MVII    #$0201, R1                      ; DD50   02B9 0201
        MVII    #$0212, R2                      ; DD52   02BA 0212
        MVI     G_0175, R0                      ; DD54   0280 0175
        ANDI    #$0001, R0                      ; DD56   03B8 0001
        BEQ     L_DD5D                          ; DD58   0204 0003

        MOVR    R1,     R3                      ; DD5A   008B
        MOVR    R2,     R1                      ; DD5B   0091
        MOVR    R3,     R2                      ; DD5C   009A
L_DD5D:
        MOVR    R7,     R3                      ; DD5D   00BB
        ADDI    #$0027, R3                      ; DD5E   02FB 0027
        MVI     G_0352, R5                      ; DD60   0285 0352
        ANDI    #$0080, R5                      ; DD62   03BD 0080
        BEQ     L_DD68                          ; DD64   0204 0002

        ADDI    #$0002, R3                      ; DD66   02FB 0002
L_DD68:
        MVII    #$0008, R5                      ; DD68   02BD 0008
        SDBD                                    ; DD6A   0001
        MVII    #$08F0, R0                      ; DD6B   02B8 00F0 0008
        XOR@    R3,     R0                      ; DD6E   03D8
        MVO@    R0,     R1                      ; DD6F   0248
        ADDR    R5,     R0                      ; DD70   00E8
        ADDI    #$0014, R1                      ; DD71   02F9 0014
        MVO@    R0,     R1                      ; DD73   0248
        INCR    R3                              ; DD74   000B
        SDBD                                    ; DD75   0001
        MVII    #$0900, R0                      ; DD76   02B8 0000 0009
        XOR@    R3,     R0                      ; DD79   03D8
        MVO@    R0,     R2                      ; DD7A   0250
        ADDR    R5,     R0                      ; DD7B   00E8
        ADDI    #$0014, R2                      ; DD7C   02FA 0014
        MVO@    R0,     R2                      ; DD7E   0250

        JSR     R5,     L_5720                  ; DD7F   0004 0154 0320
        BIDECLE $0033                           ; DD82   0033 0000

        PULR    R7                              ; DD84   02B7

        DECLE   $0002,  $0001,  $0007,  $0007   ; DD85   0002 0001 0007 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD8D   0000 0000 0000 0000
        DECLE   $0018,  $0008,  $00C0,  $0008   ; DD91   0018 0008 00C0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DD95   00C8 0008 00D0 0008
        DECLE   $00C0,  $0008,  $00C8,  $0008   ; DD99   00C0 0008 00C8 0008
        DECLE   $00D0,  $0008,  $00C8,  $0008   ; DD9D   00D0 0008 00C8 0008
        DECLE   $00D0,  $0008,  $00C8,  $0008   ; DDA1   00D0 0008 00C8 0008
        DECLE   $00D0,  $0008,  $0048,  $0008   ; DDA5   00D0 0008 0048 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0008   ; DDB5   0000 0000 0018 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDB9   00C8 0008 00D0 0008
        DECLE   $00C0,  $0008,  $00C0,  $0008   ; DDBD   00C0 0008 00C0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDC1   00C8 0008 00D0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDC5   00C8 0008 00D0 0008
        DECLE   $00C0,  $0008,  $00C0,  $0008   ; DDC9   00C0 0008 00C0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDCD   00C8 0008 00D0 0008
        DECLE   $0048,  $0008,  $0000,  $0000   ; DDD1   0048 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD5   0000 0000 0000 0000
        DECLE   $00A3,  $0003,  $0000,  $0020   ; DDD9   00A3 0003 0000 0020
        DECLE   $0018,  $0008,  $00C0,  $0008   ; DDDD   0018 0008 00C0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDE1   00C8 0008 00D0 0008
        DECLE   $00C0,  $0008,  $00C8,  $0008   ; DDE5   00C0 0008 00C8 0008
        DECLE   $00D0,  $0008,  $00E0,  $0008   ; DDE9   00D0 0008 00E0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDED   00C8 0008 00D0 0008
        DECLE   $00C8,  $0008,  $00D0,  $0008   ; DDF1   00C8 0008 00D0 0008
        DECLE   $00C0,  $0008,  $00C8,  $0008   ; DDF5   00C0 0008 00C8 0008
        DECLE   $00D0,  $0008,  $0048,  $0008   ; DDF9   00D0 0008 0048 0008
        DECLE   $0000,  $0000,  $00AB,  $0023   ; DDFD   0000 0000 00AB 0023
        DECLE   $0000,  $0020,  $0000,  $0000   ; DE01   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00EF,  $0088   ; DE11   0000 0000 00EF 0088
        DECLE   $0000,  $0080,  $0000,  $0000   ; DE15   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE29   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; DE2D   0000 0000

        SARC    R1,     2                       ; DE2F   007D
        CLRC                                    ; DE30   0006
        SARC    R1,     2                       ; DE31   007D
        CLRC                                    ; DE32   0006
        SARC    R1,     2                       ; DE33   007D
        CLRC                                    ; DE34   0006
        SARC    R1,     2                       ; DE35   007D
        CLRC                                    ; DE36   0006
        SARC    R1,     2                       ; DE37   007D
        CLRC                                    ; DE38   0006
        SARC    R1,     2                       ; DE39   007D
        CLRC                                    ; DE3A   0006
        ADDR    R5,     R7                      ; DE3B   00EF

        DECLE   $0088,  $005D,  $0088,  $007D   ; DE3C   0088 005D 0088 007D
        DECLE   $0006,  $007D,  $0006,  $007D   ; DE40   0006 007D 0006 007D
        DECLE   $0006,  $007D,  $0006,  $007D   ; DE44   0006 007D 0006 007D
        DECLE   $0006,  $007D,  $0006,  $0000   ; DE48   0006 007D 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE50   0000 0000 0000 0000
        DECLE   $0000,  $0005,  $0008,  $0000   ; DE54   0000 0005 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DE5C   0000 0000 0000

        SLR     R1,     2                       ; DE5F   0065
        INCR    R0                              ; DE60   0008
        MOVR    R2,     R5                      ; DE61   0095
        INCR    R0                              ; DE62   0008
        ADDR    R5,     R7                      ; DE63   00EF

        DECLE   $0088,  $0000,  $0080,  $00B5   ; DE64   0088 0000 0080 00B5
        DECLE   $0008,  $0000,  $0000,  $0000   ; DE68   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0035   ; DE70   0000 0000 0000 0035
        DECLE   $0008,  $0000,  $0000,  $0000   ; DE74   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE78   0000 0000 0000 0000
        DECLE   $0000,  $003D,  $0008,  $0000   ; DE7C   0000 003D 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $009D   ; DE84   0000 0000 0000 009D
        DECLE   $0008,  $0000,  $0000,  $00EF   ; DE88   0008 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0025   ; DE8C   0088 0000 0080 0025
        DECLE   $0008,  $0000,  $0000,  $0000   ; DE90   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000D   ; DE98   0000 0000 0000 000D
        DECLE   $0008,  $0000,  $0000,  $0000   ; DE9C   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA0   0000 0000 0000 0000
        DECLE   $0000,  $0045,  $0008,  $0000   ; DEA4   0000 0045 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00BD   ; DEAC   0000 0000 0000 00BD
        DECLE   $0008,  $0000,  $0000,  $00EF   ; DEB0   0008 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; DEB4   0088 0000 0080 0000
        DECLE   $0000,  $0055,  $0008,  $0000   ; DEB8   0000 0055 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0015   ; DEC0   0000 0000 0000 0015
        DECLE   $0008,  $0000,  $0000,  $0000   ; DEC4   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; DEC8   0000 0000 0000 0005
        DECLE   $0008,  $0000,  $0000,  $0000   ; DECC   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0085   ; DED4   0000 0000 0000 0085
        DECLE   $0008,  $0000,  $0000,  $00EF   ; DED8   0008 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; DEDC   0088 0000 0080 0000
        DECLE   $0000,  $00AD,  $0008,  $0000   ; DEE0   0000 00AD 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE8   0000 0000 0000 0000
        DECLE   $0000,  $0035,  $0008,  $0000   ; DEEC   0000 0035 0008 0000
        DECLE   $0000,  $0000,  $0000,  $003D   ; DEF0   0000 0000 0000 003D
        DECLE   $0008,  $0000,  $0000,  $0000   ; DEF4   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $008D   ; DEFC   0000 0000 0000 008D
        DECLE   $0008,  $0000,  $0000,  $00EA   ; DF00   0008 0000 0000 00EA
        DECLE   $0085,  $0000,  $0080,  $0000   ; DF04   0085 0000 0080 0000
        DECLE   $0000,  $00A5,  $0008,  $0000   ; DF08   0000 00A5 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF10   0000 0000 0000 0000
        DECLE   $0000,  $000D,  $0008,  $0000   ; DF14   0000 000D 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0045   ; DF18   0000 0000 0000 0045
        DECLE   $0008,  $0000,  $0000,  $0000   ; DF1C   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF20   0000 0000 0000 0000
        DECLE   $0000,  $0065,  $0008,  $006D   ; DF24   0000 0065 0008 006D
        DECLE   $0008,  $0000,  $0000,  $00EA   ; DF28   0008 0000 0000 00EA
        DECLE   $0085,  $0000,  $0080,  $0000   ; DF2C   0085 0000 0080 0000
        DECLE   $0000,  $0075,  $0008,  $0000   ; DF30   0000 0075 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF38   0000 0000 0000 0000
        DECLE   $0000,  $0015,  $0008,  $0000   ; DF3C   0000 0015 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0065   ; DF40   0000 0000 0000 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF44   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF48   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF4C   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $007A   ; DF50   0006 0065 0006 007A
        DECLE   $0088,  $002D,  $0088,  $0065   ; DF54   0088 002D 0088 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF58   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF5C   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $0065   ; DF60   0006 0065 0006 0065
        DECLE   $0006,  $0065,  $0006,  $0000   ; DF64   0006 0065 0006 0000
        DECLE   $0000,  $000C,  $0058,  $0034   ; DF68   0000 000C 0058 0034
        DECLE   $0048,  $002C,  $0038,  $004C   ; DF6C   0048 002C 0038 004C
        DECLE   $0038,  $004C,  $0050,  $004C   ; DF70   0038 004C 0050 004C
        DECLE   $0060,  $009C,  $0038,  $007C   ; DF74   0060 009C 0038 007C
        DECLE   $0048,  $008C,  $0058,  $0064   ; DF78   0048 008C 0058 0064
        DECLE   $0060,  $0064,  $0050,  $0064   ; DF7C   0060 0064 0050 0064
        DECLE   $0038,  $001C,  $0058,  $002C   ; DF80   0038 001C 0058 002C
        DECLE   $0048,  $0024,  $0038,  $003C   ; DF84   0048 0024 0038 003C
        DECLE   $0038,  $004C,  $0050,  $0034   ; DF88   0038 004C 0050 0034
        DECLE   $0060,  $008C,  $0038,  $0084   ; DF8C   0060 008C 0038 0084
        DECLE   $0048,  $0094,  $0058,  $007C   ; DF90   0048 0094 0058 007C
        DECLE   $0060,  $0064,  $0050,  $0074   ; DF94   0060 0064 0050 0074
        DECLE   $0038,  $000C,  $0060,  $000C   ; DF98   0038 000C 0060 000C
        DECLE   $0050,  $0014,  $0048,  $000C   ; DF9C   0050 0014 0048 000C
        DECLE   $0040,  $0014,  $0038,  $000C   ; DFA0   0040 0014 0038 000C
        DECLE   $0030,  $00A4,  $0030,  $009C   ; DFA4   0030 00A4 0030 009C
        DECLE   $0038,  $00A4,  $0040,  $009C   ; DFA8   0038 00A4 0040 009C
        DECLE   $0048,  $00A4,  $0050,  $00A4   ; DFAC   0048 00A4 0050 00A4
        DECLE   $0060,  $000C,  $0060,  $000C   ; DFB0   0060 000C 0060 000C
        DECLE   $0050,  $0014,  $0048,  $000C   ; DFB4   0050 0014 0048 000C
        DECLE   $0040,  $0014,  $0038,  $000C   ; DFB8   0040 0014 0038 000C
        DECLE   $0030,  $0000,  $0066,  $0000   ; DFBC   0030 0000 0066 0000
        DECLE   $0066,  $0000,  $0066,  $0000   ; DFC0   0066 0000 0066 0000
        DECLE   $0066,  $0000,  $0066,  $0000   ; DFC4   0066 0000 0066 0000

        SLR     R2,     2                       ; DFC8   0066
        MOVR    R6,     R4                      ; DFC9   00B4
        NEGR    R0                              ; DFCA   0020
        MOVR    R6,     R4                      ; DFCB   00B4
        NEGR    R0                              ; DFCC   0020
        MOVR    R6,     R4                      ; DFCD   00B4
        NEGR    R0                              ; DFCE   0020
        MOVR    R6,     R4                      ; DFCF   00B4
        NEGR    R0                              ; DFD0   0020
        MOVR    R6,     R4                      ; DFD1   00B4
        NEGR    R0                              ; DFD2   0020
        MOVR    R6,     R4                      ; DFD3   00B4
        NEGR    R0                              ; DFD4   0020
        TSTR    R4                              ; DFD5   00A4
        SLR     R2,     2                       ; DFD6   0066
        TSTR    R4                              ; DFD7   00A4
        SLR     R2,     2                       ; DFD8   0066
        TSTR    R4                              ; DFD9   00A4
        SLR     R2,     2                       ; DFDA   0066
        TSTR    R4                              ; DFDB   00A4
        SLR     R2,     2                       ; DFDC   0066
        TSTR    R4                              ; DFDD   00A4
        SLR     R2,     2                       ; DFDE   0066
        TSTR    R4                              ; DFDF   00A4
        SLR     R2,     2                       ; DFE0   0066
        COMR    R0                              ; DFE1   0018
        NEGR    R0                              ; DFE2   0020
        COMR    R0                              ; DFE3   0018
        NEGR    R0                              ; DFE4   0020
        COMR    R0                              ; DFE5   0018
        NEGR    R0                              ; DFE6   0020
        COMR    R0                              ; DFE7   0018
        NEGR    R0                              ; DFE8   0020
        COMR    R0                              ; DFE9   0018
        NEGR    R0                              ; DFEA   0020
        COMR    R0                              ; DFEB   0018
        NEGR    R0                              ; DFEC   0020
        NOP                                     ; DFED   0034
        SLLC    R0,     1                       ; DFEE   0058
        NOP                                     ; DFEF   0034
        SWAP    R0,     1                       ; DFF0   0040
        SARC    R0,     2                       ; DFF1   007C
        SWAP    R0,     1                       ; DFF2   0040
        SARC    R0,     2                       ; DFF3   007C
        SLLC    R0,     1                       ; DFF4   0058
        INCR    R4                              ; DFF5   000C
        SLLC    R0,     1                       ; DFF6   0058
        NOP                                     ; DFF7   0034
        SWAP    R0,     1                       ; DFF8   0040
        MOVR    R3,     R4                      ; DFF9   009C
        RSWD    R0                              ; DFFA   0038
        SARC    R0,     2                       ; DFFB   007C
        SLLC    R0,     1                       ; DFFC   0058
        NOP                                     ; DFFD   0034
        SLLC    R0,     1                       ; DFFE   0058
        DECR    R4                              ; DFFF   0014

        ORG     $F000
        DECLE   $0038,  $007C,  $0040,  $00A4   ; F000   0038 007C 0040 00A4
        DECLE   $0058,  $0000,  $0000,  $0000   ; F004   0058 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F008   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F00C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F010   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F014   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F018   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F01C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F020   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F024   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F028   0000 0000 0000 0000
        DECLE   $0000,  $0088,  $0018,  $0000   ; F02C   0000 0088 0018 0000
        DECLE   $0000,  $0090,  $0018,  $0088   ; F030   0000 0090 0018 0088
        DECLE   $0018,  $0090,  $0018,  $0088   ; F034   0018 0090 0018 0088
        DECLE   $0018,  $0076,  $0008,  $007E   ; F038   0018 0076 0008 007E
        DECLE   $0008,  $0088,  $0018,  $0090   ; F03C   0008 0088 0018 0090
        DECLE   $0018,  $0088,  $0018,  $0088   ; F040   0018 0088 0018 0088
        DECLE   $0018,  $0090,  $0018,  $0090   ; F044   0018 0090 0018 0090
        DECLE   $0018,  $0088,  $0018,  $0074   ; F048   0018 0088 0018 0074
        DECLE   $0018,  $007C,  $0018,  $0090   ; F04C   0018 007C 0018 0090
        DECLE   $0018,  $0000,  $0000,  $0088   ; F050   0018 0000 0000 0088
        DECLE   $0018,  $00CB,  $0038,  $0072   ; F054   0018 00CB 0038 0072
        DECLE   $0008,  $007A,  $0008,  $001F   ; F058   0008 007A 0008 001F
        DECLE   $0008,  $0061,  $0006,  $00AB   ; F05C   0008 0061 0006 00AB
        DECLE   $0018,  $0086,  $0008,  $00B3   ; F060   0018 0086 0008 00B3
        DECLE   $0018,  $0061,  $0006,  $00D9   ; F064   0018 0061 0006 00D9
        DECLE   $0008,  $0061,  $0006,  $0061   ; F068   0008 0061 0006 0061
        DECLE   $0006,  $00C3,  $0018,  $0025   ; F06C   0006 00C3 0018 0025
        DECLE   $0008,  $00B3,  $0018,  $0084   ; F070   0008 00B3 0018 0084
        DECLE   $0018,  $0061,  $0006,  $0061   ; F074   0018 0061 0006 0061
        DECLE   $0006,  $0071,  $0008,  $0079   ; F078   0006 0071 0008 0079
        DECLE   $0008,  $00AB,  $0018,  $0082   ; F07C   0008 00AB 0018 0082
        DECLE   $0008,  $00AB,  $0018,  $0000   ; F080   0008 00AB 0018 0000
        DECLE   $0000,  $001D,  $0018,  $0000   ; F084   0000 001D 0018 0000
        DECLE   $0000                           ; F088   0000

        ADDR    R0,     R3                      ; F089   00C3
        COMR    R0                              ; F08A   0018
        RLC     R0,     2                       ; F08B   0054
        COMR    R0                              ; F08C   0018
        ADDR    R2,     R3                      ; F08D   00D3
        COMR    R0                              ; F08E   0018
        ADDR    R5,     R7                      ; F08F   00EF

        DECLE   $0088,  $0000,  $0080,  $00CB   ; F090   0088 0000 0080 00CB
        DECLE   $0018,  $00D3,  $0018,  $00BB   ; F094   0018 00D3 0018 00BB
        DECLE   $0018,  $0056,  $0008,  $004C   ; F098   0018 0056 0008 004C
        DECLE   $0018,  $0000,  $0000,  $00BB   ; F09C   0018 0000 0000 00BB
        DECLE   $0018,  $0081,  $0008,  $00B3   ; F0A0   0018 0081 0008 00B3
        DECLE   $0018,  $0000,  $0000,  $0000   ; F0A4   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; F0A8   0000 0000 0000

        TSTR    R3                              ; F0AB   009B
        COMR    R0                              ; F0AC   0018
        TSTR    R3                              ; F0AD   009B
        COMR    R0                              ; F0AE   0018
        TSTR    R3                              ; F0AF   009B
        COMR    R0                              ; F0B0   0018
        TSTR    R3                              ; F0B1   009B
        COMR    R0                              ; F0B2   0018
        TSTR    R3                              ; F0B3   009B
        COMR    R0                              ; F0B4   0018
        TSTR    R3                              ; F0B5   009B
        COMR    R0                              ; F0B6   0018
        ADDR    R5,     R7                      ; F0B7   00EF

        DECLE   $0088,  $005B,  $0098,  $009B   ; F0B8   0088 005B 0098 009B
        DECLE   $0018,  $009B,  $0018,  $009B   ; F0BC   0018 009B 0018 009B
        DECLE   $0018,  $009B,  $0018,  $009B   ; F0C0   0018 009B 0018 009B
        DECLE   $0018,  $009B,  $0018,  $0000   ; F0C4   0018 009B 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0CC   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $0018,  $0000   ; F0D0   0000 0003 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00EF   ; F0DC   0000 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; F0E0   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0033   ; F0EC   0000 0000 0000 0033
        DECLE   $0018,  $0000,  $0000,  $0000   ; F0F0   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0F4   0000 0000 0000 0000
        DECLE   $0000,  $003B,  $0018,  $0000   ; F0F8   0000 003B 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F100   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00EF   ; F104   0000 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; F108   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F10C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F110   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000B   ; F114   0000 0000 0000 000B
        DECLE   $0018,  $0000,  $0000,  $0000   ; F118   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F11C   0000 0000 0000 0000
        DECLE   $0000,  $0043,  $0018,  $0000   ; F120   0000 0043 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F124   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F128   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00EF   ; F12C   0000 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; F130   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F134   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F138   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0013   ; F13C   0000 0000 0000 0013
        DECLE   $0018,  $0000,  $0000,  $0000   ; F140   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; F144   0000 0000 0000 0003
        DECLE   $0018,  $0000,  $0000,  $0000   ; F148   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F14C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F150   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00EF   ; F154   0000 0000 0000 00EF
        DECLE   $0088,  $0000,  $0080,  $0000   ; F158   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F15C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F160   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F164   0000 0000 0000 0000
        DECLE   $0000,  $0033,  $0018,  $0000   ; F168   0000 0033 0018 0000
        DECLE   $0000,  $0000,  $0000,  $003B   ; F16C   0000 0000 0000 003B
        DECLE   $0018,  $0000,  $0000,  $0000   ; F170   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F174   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F178   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; F17C   0000 0000 0000 0060
        DECLE   $0088,  $0000,  $0080,  $0000   ; F180   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F184   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F188   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F18C   0000 0000 0000 0000
        DECLE   $0000,  $000B,  $0018,  $0000   ; F190   0000 000B 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0043   ; F194   0000 0000 0000 0043
        DECLE   $0018,  $0000,  $0000,  $0000   ; F198   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F19C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; F1A4   0000 0000 0000 0060
        DECLE   $0088,  $0000,  $0080,  $0000   ; F1A8   0088 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B4   0000 0000 0000 0000
        DECLE   $0000,  $0013,  $0018,  $0000   ; F1B8   0000 0013 0018 0000
        DECLE   $0000,  $0000,  $0000,  $00A3   ; F1BC   0000 0000 0000 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1C0   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1C4   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1C8   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $0068   ; F1CC   0018 00A3 0018 0068
        DECLE   $0088,  $002B,  $0098,  $00A3   ; F1D0   0088 002B 0098 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1D4   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1D8   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $00A3   ; F1DC   0018 00A3 0018 00A3
        DECLE   $0018,  $00A3,  $0018,  $0000   ; F1E0   0018 00A3 0018 0000
        DECLE   $0000                           ; F1E4   0000

        CLRR    R0                              ; F1E5   01C0
        MVO     R0,     G_0103                  ; F1E6   0240 0103
        MVO     R0,     G_0176                  ; F1E8   0240 0176
        MVII    #$0030, R1                      ; F1EA   02B9 0030
        MVO     R0,     G_0177                  ; F1EC   0240 0177
        MVO     R1,     G_0104                  ; F1EE   0241 0104
        MVII    #$0319, R4                      ; F1F0   02BC 0319
        MVII    #$0018, R0                      ; F1F2   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; F1F4   0004 0114 0338

        MVII    #$0004, R0                      ; F1F7   02B8 0004
        MVO     R0,     G_0173                  ; F1F9   0240 0173
        MVII    #$00FF, R0                      ; F1FB   02B8 00FF
        MVO     R0,     G_017A                  ; F1FD   0240 017A

        JSR     R5,     L_593B                  ; F1FF   0004 0158 013B

        INCR    R7                              ; F202   000F

        PSHR    R5                              ; F203   0275
L_F204:
        MVI     G_0352, R0                      ; F204   0280 0352
        DECLE   $03B8,  $0040,  $020C,  $000F   ; F206   03B8 0040 020C 000F
        DECLE   $00BC,  $02FC,  $00F1,  $0004   ; F20A   00BC 02FC 00F1 0004
        DECLE   $01A4,  $023E,  $0280,  $0352   ; F20E   01A4 023E 0280 0352
        DECLE   $03B8,  $0020,  $0204,  $00C5   ; F212   03B8 0020 0204 00C5
        DECLE   $0004,  $03A4,  $023F           ; F216   0004 03A4 023F

        MOVR    R7,     R4                      ; F219   00BC
        ADDI    #$029C, R4                      ; F21A   02FC 029C
        SDBD                                    ; F21C   0001
        MVII    #$1984, R0                      ; F21D   02B8 0084 0019
        MOVR    R7,     R5                      ; F220   00BD
        ADDI    #$0009, R5                      ; F221   02FD 0009
L_F223:
        MVI@    R5,     R1                      ; F223   02A9
        DECLE   $0089,  $0224,  $0010           ; F224   0089 0224 0010

        MVO@    R0,     R1                      ; F227   0248
        B       L_F223                          ; F228   0220 0006
        B       L_F42F                          ; F22A   0200 0203

        DECLE   $0210,  $0213,  $0228,  $023B   ; F22C   0210 0213 0228 023B

        MVO@    R4,     R4                      ; F230   0264
        PSHR    R7                              ; F231   0277
        MVI@    R4,     R0                      ; F232   02A0
        PULR    R3                              ; F233   02B3
        ADD@    R3,     R4                      ; F234   02DC
        ADD@    R5,     R7                      ; F235   02EF

        DECLE   $0000                           ; F236   0000

        CLRR    R0                              ; F237   01C0
        MVO     R0,     G_0103                  ; F238   0240 0103
        MVII    #$0030, R0                      ; F23A   02B8 0030
        MVO     R0,     G_0104                  ; F23C   0240 0104
        MVII    #$0319, R4                      ; F23E   02BC 0319
        MVII    #$0018, R0                      ; F240   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; F242   0004 0114 0338

        MVII    #$0005, R0                      ; F245   02B8 0005
        MVO     R0,     G_0173                  ; F247   0240 0173
        MVII    #$00FF, R0                      ; F249   02B8 00FF
        MVO     R0,     G_017A                  ; F24B   0240 017A

        JSR     R5,     L_593B                  ; F24D   0004 0158 013B

        INCR    R7                              ; F250   000F

        PSHR    R5                              ; F251   0275
L_F252:
        MOVR    R7,     R4                      ; F252   00BC
        DECLE   $02FC,  $011B,  $0004,  $01A4   ; F253   02FC 011B 0004 01A4
        DECLE   $023E,  $0280,  $0352,  $03B8   ; F257   023E 0280 0352 03B8
        DECLE   $0080,  $020C,  $0003,  $00BC   ; F25B   0080 020C 0003 00BC
        DECLE   $02FC,  $01BD,  $0004,  $03A4   ; F25F   02FC 01BD 0004 03A4
        DECLE   $023F                           ; F263   023F

        MVII    #$0006, R0                      ; F264   02B8 0006
        MVO     R0,     G_0173                  ; F266   0240 0173

        JSR     R5,     L_593B                  ; F268   0004 0158 013B
        DECLE   $02B8,  $00FF,  $0240,  $018A   ; F26B   02B8 00FF 0240 018A
        DECLE   $0240,  $018B,  $01C0,  $0240   ; F26F   0240 018B 01C0 0240
        DECLE   $0179,  $0004,  $01A0,  $0298   ; F273   0179 0004 01A0 0298
        DECLE   $02B8,  $0001,  $0240,  $0179   ; F277   02B8 0001 0240 0179
        DECLE   $0004,  $01A0,  $0298,  $00BC   ; F27B   0004 01A0 0298 00BC
        DECLE   $02FC,  $01D1,  $0004,  $03A4   ; F27F   02FC 01D1 0004 03A4
        DECLE   $023F                           ; F283   023F

        MVII    #$0014, R2                      ; F284   02BA 0014
        SLL     R0,     2                       ; F286   004C
        PSHR    R0                              ; F287   0270
        SLL     R0,     2                       ; F288   004C
        ADD@    R6,     R0                      ; F289   02F0
        ADDR    R0,     R1                      ; F28A   00C1
L_F28B:
        MVI@    R1,     R0                      ; F28B   0288
        SDBD                                    ; F28C   0001
        ANDI    #$FFF8, R0                      ; F28D   03B8 00F8 00FF
        XORI    #$0007, R0                      ; F290   03F8 0007
        MVO@    R0,     R1                      ; F292   0248
        INCR    R1                              ; F293   0009
        DECR    R2                              ; F294   0012
        BNEQ    L_F28B                          ; F295   022C 000B
        MOVR    R5,     R7                      ; F297   00AF

        DECLE   $0275,  $0283,  $0179,  $004B   ; F298   0275 0283 0179 004B
        DECLE   $00BD,  $02FD,  $0043,  $00DD   ; F29C   00BD 02FD 0043 00DD
        DECLE   $02AB,  $02AC,  $0004,  $01AC   ; F2A0   02AB 02AC 0004 01AC
        DECLE   $0248,  $0204,  $0015,  $0004   ; F2A4   0248 0204 0015 0004

        ANDR    R5,     R4                      ; F2A8   01AC
        MVO@    R0,     R4                      ; F2A9   0260
        BEQ     L_F2B7                          ; F2AA   0204 000B

        MVI     G_0179, R1                      ; F2AC   0281 0179
        PSHR    R1                              ; F2AE   0271
        SLL     R1,     1                       ; F2AF   0049
        ADD@    R6,     R1                      ; F2B0   02F1
        ADDR    R1,     R4                      ; F2B1   00CC
        MOVR    R7,     R1                      ; F2B2   00B9
        ADDI    #$0031, R1                      ; F2B3   02F9 0031
        B       L_F2BF                          ; F2B5   0200 0008

L_F2B7:
        MOVR    R7,     R1                      ; F2B7   00B9
        ADDI    #$0032, R1                      ; F2B8   02F9 0032
        B       L_F2BF                          ; F2BA   0200 0003

        MOVR    R7,     R1                      ; F2BC   00B9
        ADDI    #$0036, R1                      ; F2BD   02F9 0036

L_F2BF:
        JSR     R5,     X_PRINT_R1              ; F2BF   0004 0118 0067

        INCR    R7                              ; F2C2   000F

        PSHR    R5                              ; F2C3   0275
L_F2C4:
        PSHR    R0                              ; F2C4   0270
        MVI     G_0179, R3                      ; F2C5   0283 0179
        SLL     R3,     1                       ; F2C7   004B
        MOVR    R7,     R5                      ; F2C8   00BD
        ADDI    #$0013, R5                      ; F2C9   02FD 0013
        ADDR    R3,     R5                      ; F2CB   00DD
        MVI@    R5,     R3                      ; F2CC   02AB
        MVI@    R5,     R1                      ; F2CD   02A9
        MVII    #$0006, R0                      ; F2CE   02B8 0006
        XORI    #$0088, R3                      ; F2D0   03FB 0088
L_F2D2:
        MVO@    R3,     R1                      ; F2D2   024B
        ADDI    #$0008, R3                      ; F2D3   02FB 0008
        ADDI    #$0014, R1                      ; F2D5   02F9 0014
        DECR    R0                              ; F2D7   0010
        BNEQ    L_F2D2                          ; F2D8   022C 0007

        PULR    R0                              ; F2DA   02B0
        PULR    R7                              ; F2DB   02B7

        DECLE   $0002,  $0252,  $0001,  $0261   ; F2DC   0002 0252 0001 0261
        DECLE   $0002,  $0228,  $0001,  $0234   ; F2E0   0002 0228 0001 0234
        DECLE   $0048,  $0075,  $006D,  $0061   ; F2E4   0048 0075 006D 0061
        DECLE   $006E,  $0000,  $0032,  $0020   ; F2E8   006E 0000 0032 0020
        DECLE   $0048,  $0075,  $006D,  $0061   ; F2EC   0048 0075 006D 0061
        DECLE   $006E,  $0073,  $0000,  $0043   ; F2F0   006E 0073 0000 0043
        DECLE   $006F,  $006D,  $0070,  $0075   ; F2F4   006F 006D 0070 0075
        DECLE   $0074,  $0065,  $0072,  $0000   ; F2F8   0074 0065 0072 0000
        DECLE   $0007,  $0205,  $0056,  $006F   ; F2FC   0007 0205 0056 006F
        DECLE   $006C,  $006C,  $0065,  $0079   ; F300   006C 006C 0065 0079
        DECLE   $0062,  $0061,  $006C,  $006C   ; F304   0062 0061 006C 006C
        DECLE   $0000,  $021C,  $004D,  $0065   ; F308   0000 021C 004D 0065
        DECLE   $006E,  $0075,  $0001,  $0003   ; F30C   006E 0075 0001 0003
        DECLE   $0251,  $0031,  $0020,  $0020   ; F310   0251 0031 0020 0020
        DECLE   $0054,  $0077,  $006F,  $0020   ; F314   0054 0077 006F 0020
        DECLE   $004F,  $006E,  $0020,  $0054   ; F318   004F 006E 0020 0054
        DECLE   $0077,  $006F,  $0000,  $0265   ; F31C   0077 006F 0000 0265
        DECLE   $0032,  $0020,  $0020,  $0053   ; F320   0032 0020 0020 0053
        DECLE   $0069,  $0078,  $0020,  $004F   ; F324   0069 0078 0020 004F
        DECLE   $006E,  $0020,  $0053,  $0069   ; F328   006E 0020 0053 0069
        DECLE   $0078,  $0000,  $0279,  $0033   ; F32C   0078 0000 0279 0033
        DECLE   $0020,  $0020,  $0043,  $006F   ; F330   0020 0020 0043 006F
        DECLE   $006E,  $0074,  $0072,  $006F   ; F334   006E 0074 0072 006F
        DECLE   $006C,  $006C,  $0065,  $0072   ; F338   006C 006C 0065 0072
        DECLE   $0020,  $0048,  $0065,  $006C   ; F33C   0020 0048 0065 006C
        DECLE   $0070,  $0001,  $0005,  $02DE   ; F340   0070 0001 0005 02DE
        DECLE   $0074,  $0068,  $0065,  $006E   ; F344   0074 0068 0065 006E
        DECLE   $0020,  $0070,  $0072,  $0065   ; F348   0020 0070 0072 0065
        DECLE   $0073,  $0073,  $0020,  $0065   ; F34C   0073 0073 0020 0065
        DECLE   $006E,  $0074,  $0065,  $0072   ; F350   006E 0074 0065 0072
        DECLE   $0002,  $0002,  $0202,  $004B   ; F354   0002 0002 0202 004B
        DECLE   $0079,  $006C,  $0065,  $0020   ; F358   0079 006C 0065 0020
        DECLE   $0001,  $0007,  $0207,  $0026   ; F35C   0001 0007 0207 0026
        DECLE   $0020,  $0001,  $0001,  $0209   ; F360   0020 0001 0001 0209
        DECLE   $0052,  $0075,  $0073,  $0073   ; F364   0052 0075 0073 0073
        DECLE   $0065,  $006C,  $006C,  $0027   ; F368   0065 006C 006C 0027
        DECLE   $0073,  $0002,  $0003,  $023D   ; F36C   0073 0002 0003 023D
        DECLE   $0031,  $0020,  $0020,  $0048   ; F370   0031 0020 0020 0048
        DECLE   $0075,  $006D,  $0061,  $006E   ; F374   0075 006D 0061 006E
        DECLE   $0020,  $0076,  $0020,  $0048   ; F378   0020 0076 0020 0048
        DECLE   $0075,  $006D,  $0061,  $006E   ; F37C   0075 006D 0061 006E
        DECLE   $0000,  $0251,  $0032,  $0020   ; F380   0000 0251 0032 0020
        DECLE   $0020,  $0048,  $0075,  $006D   ; F384   0020 0048 0075 006D
        DECLE   $0061,  $006E,  $0020,  $0076   ; F388   0061 006E 0020 0076
        DECLE   $0020,  $0043,  $006F,  $006D   ; F38C   0020 0043 006F 006D
        DECLE   $0070,  $0075,  $0074,  $0065   ; F390   0070 0075 0074 0065
        DECLE   $0072,  $0000,  $0265,  $0033   ; F394   0072 0000 0265 0033
        DECLE   $0020,  $0020,  $0043,  $006F   ; F398   0020 0020 0043 006F
        DECLE   $006D,  $0070,  $0075,  $0074   ; F39C   006D 0070 0075 0074
        DECLE   $0065,  $0072,  $0020,  $0076   ; F3A0   0065 0072 0020 0076
        DECLE   $0020,  $0048,  $0075,  $006D   ; F3A4   0020 0048 0075 006D
        DECLE   $0061,  $006E,  $0001,  $0005   ; F3A8   0061 006E 0001 0005
        DECLE   $02DE,  $0074,  $0068,  $0065   ; F3AC   02DE 0074 0068 0065
        DECLE   $006E,  $0020,  $0070,  $0072   ; F3B0   006E 0020 0070 0072
        DECLE   $0065,  $0073,  $0073,  $0020   ; F3B4   0065 0073 0073 0020
        DECLE   $0065,  $006E,  $0074,  $0065   ; F3B8   0065 006E 0074 0065
        DECLE   $0072,  $0002,  $0007,  $0205   ; F3BC   0072 0002 0007 0205
        DECLE   $0054,  $0077,  $006F,  $0020   ; F3C0   0054 0077 006F 0020
        DECLE   $004F,  $006E,  $0020,  $0054   ; F3C4   004F 006E 0020 0054
        DECLE   $0077,  $006F,  $0001,  $0003   ; F3C8   0077 006F 0001 0003
        DECLE   $0279,  $0034,  $0020,  $0020   ; F3CC   0279 0034 0020 0020
        DECLE   $0032,  $0020,  $0048,  $0075   ; F3D0   0032 0020 0048 0075
        DECLE   $006D,  $0061,  $006E,  $0073   ; F3D4   006D 0061 006E 0073
        DECLE   $0020,  $0076,  $0020,  $0043   ; F3D8   0020 0076 0020 0043
        DECLE   $006F,  $006D,  $0070,  $002E   ; F3DC   006F 006D 0070 002E
        DECLE   $0000,  $028D,  $0035,  $0020   ; F3E0   0000 028D 0035 0020
        DECLE   $0020,  $0043,  $006F,  $006D   ; F3E4   0020 0043 006F 006D
        DECLE   $0070,  $002E,  $0020,  $0076   ; F3E8   0070 002E 0020 0076
        DECLE   $0020,  $0032,  $0020,  $0048   ; F3EC   0020 0032 0020 0048
        DECLE   $0075,  $006D,  $0061,  $006E   ; F3F0   0075 006D 0061 006E
        DECLE   $0073,  $0000,  $02A1,  $0036   ; F3F4   0073 0000 02A1 0036
        DECLE   $0020,  $0020,  $0043,  $006F   ; F3F8   0020 0020 0043 006F
        DECLE   $006D,  $0070,  $002E,  $0020   ; F3FC   006D 0070 002E 0020
        DECLE   $0076,  $0020,  $0043,  $006F   ; F400   0076 0020 0043 006F
        DECLE   $006D,  $0070,  $002E,  $0000   ; F404   006D 0070 002E 0000
        DECLE   $02B5,  $0037,  $0020,  $0020   ; F408   02B5 0037 0020 0020
        DECLE   $0043,  $006F,  $006E,  $0074   ; F40C   0043 006F 006E 0074
        DECLE   $0072,  $006F,  $006C,  $006C   ; F410   0072 006F 006C 006C
        DECLE   $0065,  $0072,  $0020,  $0048   ; F414   0065 0072 0020 0048
        DECLE   $0065,  $006C,  $0070,  $0002   ; F418   0065 006C 0070 0002
        DECLE   $0007,  $0205,  $0053,  $0069   ; F41C   0007 0205 0053 0069
        DECLE   $0078,  $0020,  $004F,  $006E   ; F420   0078 0020 004F 006E
        DECLE   $0020,  $0053,  $0069,  $0078   ; F424   0020 0053 0069 0078
        DECLE   $0001,  $0003,  $0279           ; F428   0001 0003 0279

        NOP                                     ; F42B   0034
        NEGR    R0                              ; F42C   0020
        NEGR    R0                              ; F42D   0020
        SWAP    R3,     1                       ; F42E   0043
L_F42F:
        SAR     R3,     2                       ; F42F   006F
        DECLE   $006D,  $0070,  $002E,  $0020   ; F430   006D 0070 002E 0020
        DECLE   $0076,  $0020,  $0043,  $006F   ; F434   0076 0020 0043 006F
        DECLE   $006D,  $0070,  $002E,  $0000   ; F438   006D 0070 002E 0000
        DECLE   $028D,  $0035,  $0020,  $0020   ; F43C   028D 0035 0020 0020
        DECLE   $0043,  $006F,  $006E,  $0074   ; F440   0043 006F 006E 0074
        DECLE   $0072,  $006F,  $006C,  $006C   ; F444   0072 006F 006C 006C
        DECLE   $0065,  $0072,  $0020,  $0048   ; F448   0065 0072 0020 0048
        DECLE   $0065,  $006C,  $0070,  $0002   ; F44C   0065 006C 0070 0002
        DECLE   $0007,  $0201,  $0053,  $0065   ; F450   0007 0201 0053 0065
        DECLE   $006C,  $0065,  $0063,  $0074   ; F454   006C 0065 0063 0074
        DECLE   $0020,  $0053,  $006B,  $0069   ; F458   0020 0053 006B 0069
        DECLE   $006C,  $006C,  $0020,  $004C   ; F45C   006C 006C 0020 004C
        DECLE   $0065,  $0076,  $0065,  $006C   ; F460   0065 0076 0065 006C
        DECLE   $0001,  $0003,  $0254,  $0042   ; F464   0001 0003 0254 0042
        DECLE   $0065,  $0067,  $0069,  $006E   ; F468   0065 0067 0069 006E
        DECLE   $006E,  $0065,  $0072,  $0000   ; F46C   006E 0065 0072 0000
        DECLE   $0268,  $0041,  $006D,  $0061   ; F470   0268 0041 006D 0061
        DECLE   $0074,  $0065,  $0075,  $0072   ; F474   0074 0065 0075 0072
        DECLE   $0000,  $027C,  $0052,  $006F   ; F478   0000 027C 0052 006F
        DECLE   $006F,  $006B,  $0069,  $0065   ; F47C   006F 006B 0069 0065
        DECLE   $0000,  $0290,  $0056,  $0065   ; F480   0000 0290 0056 0065
        DECLE   $0074,  $0065,  $0072,  $0061   ; F484   0074 0065 0072 0061
        DECLE   $006E,  $0000,  $02A4,  $0050   ; F488   006E 0000 02A4 0050
        DECLE   $0072,  $006F,  $0066,  $0065   ; F48C   0072 006F 0066 0065
        DECLE   $0073,  $0073,  $0069,  $006F   ; F490   0073 0073 0069 006F
        DECLE   $006E,  $0061,  $006C,  $0000   ; F494   006E 0061 006C 0000
        DECLE   $02B8,  $0053,  $0075,  $0070   ; F498   02B8 0053 0075 0070
        DECLE   $0065,  $0072,  $0020,  $0050   ; F49C   0065 0072 0020 0050
        DECLE   $0072,  $006F,  $0001,  $0005   ; F4A0   0072 006F 0001 0005
        DECLE   $02DE,  $0074,  $0068,  $0065   ; F4A4   02DE 0074 0068 0065
        DECLE   $006E,  $0020,  $0070,  $0072   ; F4A8   006E 0020 0070 0072
        DECLE   $0065,  $0073,  $0073,  $0020   ; F4AC   0065 0073 0073 0020
        DECLE   $0065,  $006E,  $0074,  $0065   ; F4B0   0065 006E 0074 0065
        DECLE   $0072,  $0002,  $0005,  $0205   ; F4B4   0072 0002 0005 0205
        DECLE   $0041,  $004E,  $004E,  $004F   ; F4B8   0041 004E 004E 004F
        DECLE   $0055,  $004E,  $0043,  $0049   ; F4BC   0055 004E 0043 0049
        DECLE   $004E,  $0047,  $0001,  $0006   ; F4C0   004E 0047 0001 0006
        DECLE   $022B,  $004A,  $0065,  $0073   ; F4C4   022B 004A 0065 0073
        DECLE   $0073,  $0069,  $0063,  $0061   ; F4C8   0073 0069 0063 0061
        DECLE   $0020,  $004C,  $006F,  $0075   ; F4CC   0020 004C 006F 0075
        DECLE   $0069,  $0073,  $0065,  $0000   ; F4D0   0069 0073 0065 0000
        DECLE   $0242,  $0045,  $0074,  $0074   ; F4D4   0242 0045 0074 0074
        DECLE   $0069,  $006E,  $0067,  $0065   ; F4D8   0069 006E 0067 0065
        DECLE   $0072,  $0001,  $0002,  $0267   ; F4DC   0072 0001 0002 0267
        DECLE   $004A,  $0075,  $006C,  $0079   ; F4E0   004A 0075 006C 0079
        DECLE   $0020,  $0031,  $0039,  $002C   ; F4E4   0020 0031 0039 002C
        DECLE   $0020,  $0031,  $0039,  $0038   ; F4E8   0020 0031 0039 0038
        DECLE   $0038,  $0000,  $027E,  $0033   ; F4EC   0038 0000 027E 0033
        DECLE   $003A,  $0032,  $0035,  $0020   ; F4F0   003A 0032 0035 0020
        DECLE   $0061,  $002E,  $006D,  $002E   ; F4F4   0061 002E 006D 002E
        DECLE   $0001,  $0001,  $02A3,  $0057   ; F4F8   0001 0001 02A3 0057
        DECLE   $0065,  $006C,  $0063,  $006F   ; F4FC   0065 006C 0063 006F
        DECLE   $006D,  $0065,  $0020,  $0054   ; F500   006D 0065 0020 0054
        DECLE   $006F,  $0020,  $0054,  $0068   ; F504   006F 0020 0054 0068
        DECLE   $0065,  $0000,  $02B7,  $0046   ; F508   0065 0000 02B7 0046
        DECLE   $0075,  $006E,  $0020,  $0041   ; F50C   0075 006E 0020 0041
        DECLE   $006E,  $0064,  $0020,  $0047   ; F510   006E 0064 0020 0047
        DECLE   $0061,  $006D,  $0065,  $0073   ; F514   0061 006D 0065 0073
        DECLE   $0021,  $0001                   ; F518   0021 0001

        DIS                                     ; F51A   0003
        ADD@    R3,     R6                      ; F51B   02DE
        RLC     R3,     2                       ; F51C   0057
        SLR     R1,     1                       ; F51D   0061
        SARC    R1,     1                       ; F51E   0079
        NEGR    R0                              ; F51F   0020
        RLC     R0,     2                       ; F520   0054
        SAR     R3,     2                       ; F521   006F
        NEGR    R0                              ; F522   0020
        SWAP    R3,     2                       ; F523   0047
        SAR     R3,     2                       ; F524   006F
        ADCR    R4                              ; F525   002C
        NEGR    R0                              ; F526   0020
        SLL     R0,     2                       ; F527   004C
        SAR     R1,     1                       ; F528   0069
        SAR     R2,     2                       ; F529   006E
        SLR     R0,     2                       ; F52A   0064
        SLR     R1,     1                       ; F52B   0061
        NEGR    R1                              ; F52C   0021
        EIS                                     ; F52D   0002
        PSHR    R5                              ; F52E   0275
        CLRR    R0                              ; F52F   01C0
        MVO     R0,     G_0103                  ; F530   0240 0103
        MVO     R6,     G_034B                  ; F532   0246 034B
        MVI     G_033D, R0                      ; F534   0280 033D
        MVO     R0,     G_0345                  ; F536   0240 0345
        MOVR    R7,     R0                      ; F538   00B8
        ADDI    #$0061, R0                      ; F539   02F8 0061
        MVO     R0,     G_033D                  ; F53B   0240 033D
        MVII    #$0012, R0                      ; F53D   02B8 0012
        MVII    #$00FF, R1                      ; F53F   02B9 00FF
        MVII    #$015E, R4                      ; F541   02BC 015E

        JSR     R5,     X_FILL_MEM              ; F543   0004 0114 0341

        MVII    #$0008, R0                      ; F546   02B8 0008
        MVO     R0,     G_0170                  ; F548   0240 0170

        JSR     R5,     L_5742                  ; F54A   0004 0154 0342
        DECLE   $0002,  $02B8,  $0008,  $03F8   ; F54D   0002 02B8 0008 03F8
        DECLE   $0020,  $0240,  $0104,  $00B8   ; F551   0020 0240 0104 00B8
        DECLE   $02F8,  $011E,  $0240,  $0346   ; F555   02F8 011E 0240 0346
        DECLE   $0004                           ; F559   0004

        ANDR    R4,     R4                      ; F55A   01A4
        ANDR    R4,     R0                      ; F55B   01A0
L_F55C:
        MVI     G_0102, R0                      ; F55C   0280 0102
        DECLE   $0010,  $0223,  $0004,  $02B8   ; F55E   0010 0223 0004 02B8
        DECLE   $0002,  $0240,  $0102,  $0004   ; F562   0002 0240 0102 0004

        ANDR    R4,     R4                      ; F566   01A4
        ANDR    R0,     R2                      ; F567   0182

        JSR     R5,     L_5628                  ; F568   0004 0154 0228
        JSR     R5,     L_558C                  ; F56B   0004 0154 018C
        JSR     R5,     .EXEC.AAD               ; F56E   0004 0118 02AD

        MVI     G_034B, R0                      ; F571   0280 034B
        TSTR    R0                              ; F573   0080
        BNEQ    L_F55C                          ; F574   022C 0019

        MVI     G_0345, R0                      ; F576   0280 0345
        MVO     R0,     G_033D                  ; F578   0240 033D
        MVII    #$0343, R4                      ; F57A   02BC 0343
        MVII    #$0008, R0                      ; F57C   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; F57E   0004 0114 0338

L_F581:
        PULR    R7                              ; F581   02B7

        PSHR    R5                              ; F582   0275
        MVI     G_0343, R0                      ; F583   0280 0343
        DECR    R0                              ; F585   0010
        BMI     L_F581                          ; F586   022B 0006

        MVO     R0,     G_0343                  ; F588   0240 0343
        BNEQ    L_F581                          ; F58A   022C 000A

        MVII    #$0006, R0                      ; F58C   02B8 0006
        MVO     R0,     G_0343                  ; F58E   0240 0343
        MVI     G_0344, R0                      ; F590   0280 0344
        XORI    #$0001, R0                      ; F592   03F8 0001
        MVO     R0,     G_0344                  ; F594   0240 0344
        BEQ     L_F62D                          ; F596   0204 0095
        B       L_F5D8                          ; F598   0200 003E

        SETC                                    ; F59A   0007
        MOVR    R4,     R6                      ; F59B   00A6
        SETC                                    ; F59C   0007
        MOVR    R4,     R6                      ; F59D   00A6
        INCR    R0                              ; F59E   0008
        MOVR    R4,     R6                      ; F59F   00A6
        PSHR    R5                              ; F5A0   0275
L_F5A1:
        CLRR    R0                              ; F5A1   01C0
        MVO     R0,     G_034A                  ; F5A2   0240 034A
        MVI     G_0346, R5                      ; F5A4   0285 0346
        MVI@    R5,     R4                      ; F5A6   02AC
        TSTR    R4                              ; F5A7   00A4
        BEQ     L_F628                          ; F5A8   0204 007E

        ADDR    R7,     R4                      ; F5AA   00FC
        ADDI    #$00C8, R4                      ; F5AB   02FC 00C8
        MVO     R4,     G_0347                  ; F5AD   0244 0347
        MVI@    R5,     R0                      ; F5AF   02A8
        MVO     R0,     G_0349                  ; F5B0   0240 0349
        MVI@    R5,     R0                      ; F5B2   02A8
        MVO     R0,     G_0348                  ; F5B3   0240 0348
        MVO     R5,     G_0346                  ; F5B5   0245 0346
        MVII    #$0205, R4                      ; F5B7   02BC 0205
L_F5B9:
        MVII    #$000F, R0                      ; F5B9   02B8 000F

        JSR     R5,     X_FILL_ZERO             ; F5BB   0004 0114 0338

        ADDI    #$0005, R4                      ; F5BE   02FC 0005
        CMPI    #$02F0, R4                      ; F5C0   037C 02F0
        BLT     L_F5B9                          ; F5C2   0225 000A

L_F5C4:
        MVII    #$0006, R0                      ; F5C4   02B8 0006
        DECLE   $0240,  $0343,  $02B8,  $0001   ; F5C6   0240 0343 02B8 0001
        DECLE   $0240,  $0344,  $0284,  $0347   ; F5CA   0240 0344 0284 0347
        DECLE   $0004,  $01A4,  $023E,  $0004   ; F5CE   0004 01A4 023E 0004
        DECLE   $01A4,  $022C                   ; F5D2   01A4 022C

        JSR     R5,     L_6378                  ; F5D4   0004 0160 0378
        DECLE   $0000                           ; F5D7   0000
L_F5D8:
        MVI     G_0348, R4                      ; F5D8   0284 0348
        ADDR    R7,     R4                      ; F5DA   00FC
        ADDI    #$01AE, R4                      ; F5DB   02FC 01AE
        MVI@    R4,     R4                      ; F5DD   02A4
        ADDR    R7,     R4                      ; F5DE   00FC
        ADDI    #$01AA, R4                      ; F5DF   02FC 01AA
        MVI@    R4,     R5                      ; F5E1   02A5
        ADDR    R7,     R5                      ; F5E2   00FD
        ADDI    #$01F7, R5                      ; F5E3   02FD 01F7
L_F5E5:
        MVI@    R5,     R1                      ; F5E5   02A9
        TSTR    R1                              ; F5E6   0089
        BEQ     L_F5F3                          ; F5E7   0204 000A

        MVI@    R1,     R0                      ; F5E9   0288
        SDBD                                    ; F5EA   0001
        ANDI    #$FFF8, R0                      ; F5EB   03B8 00F8 00FF
        XORI    #$0007, R0                      ; F5EE   03F8 0007
        MVO@    R0,     R1                      ; F5F0   0248
        B       L_F5E5                          ; F5F1   0220 000D

L_F5F3:
        MVI@    R4,     R1                      ; F5F3   02A1
        TSTR    R1                              ; F5F4   0089
        BEQ     L_F606                          ; F5F5   0204 000F

        MVI@    R4,     R5                      ; F5F7   02A5
L_F5F8:
        MVI@    R1,     R0                      ; F5F8   0288
        SDBD                                    ; F5F9   0001
        ANDI    #$FFF8, R0                      ; F5FA   03B8 00F8 00FF
        XORI    #$0007, R0                      ; F5FD   03F8 0007
        MVO@    R0,     R1                      ; F5FF   0248
        INCR    R1                              ; F600   0009
        DECR    R5                              ; F601   0015
        BNEQ    L_F5F8                          ; F602   022C 000B
        B       L_F5F3                          ; F604   0220 0012
L_F606:
        PULR    R7                              ; F606   02B7
        MOVR    R5,     R7                      ; F607   00AF

        PSHR    R5                              ; F608   0275
        CMP@    R3,     R0                      ; F609   0358
        BEQ     L_F581                          ; F60A   0224 008A

        CMPI    #$00FF, R0                      ; F60C   0378 00FF
        BEQ     L_F581                          ; F60E   0224 008E

        CMPI    #$000A, R0                      ; F610   0378 000A
        BEQ     L_F628                          ; F612   0204 0014

        CMPI    #$000B, R0                      ; F614   0378 000B
        BNEQ    L_F581                          ; F616   022C 0096

        MVI     G_0348, R0                      ; F618   0280 0348
        INCR    R0                              ; F61A   0008
        MVO     R0,     G_0348                  ; F61B   0240 0348
        MVI     G_034A, R0                      ; F61D   0280 034A
        INCR    R0                              ; F61F   0008
        MVO     R0,     G_034A                  ; F620   0240 034A
        CMP     G_0349, R0                      ; F622   0340 0349
        BGE     L_F5A1                          ; F624   022D 0084
        B       L_F5C4                          ; F626   0220 0063

L_F628:
        CLRR    R0                              ; F628   01C0
        MVO     R0,     G_034B                  ; F629   0240 034B
        PULR    R7                              ; F62B   02B7

        PSHR    R5                              ; F62C   0275
L_F62D:
        MOVR    R7,     R4                      ; F62D   00BC
        DECLE   $02FC,  $01FD,  $0004           ; F62E   02FC 01FD 0004

        ANDR    R4,     R4                      ; F631   01A4
        MVO@    R4,     R2                      ; F632   0254
        MOVR    R7,     R4                      ; F633   00BC
        ADDI    #$01C3, R4                      ; F634   02FC 01C3
        MVII    #$0006, R0                      ; F636   02B8 0006
        MVII    #$0319, R3                      ; F638   02BB 0319

        JSR     R5,     L_5766                  ; F63A   0004 0154 0366

        PULR    R7                              ; F63D   02B7

        PSHR    R5                              ; F63E   0275
L_F63F:
        MVI@    R4,     R3                      ; F63F   02A3
L_F640:
        MVI@    R4,     R5                      ; F640   02A5
L_F641:
        MVI@    R4,     R0                      ; F641   02A0
        SUBI    #$0020, R0                      ; F642   0338 0020
        BMI     L_F64C                          ; F644   020B 0006

        SLL     R0,     2                       ; F646   004C
        SLL     R0,     1                       ; F647   0048
        XORR    R3,     R0                      ; F648   01D8
        MVO@    R0,     R5                      ; F649   0268
        B       L_F641                          ; F64A   0220 000A

L_F64C:
        ADDI    #$0020, R0                      ; F64C   02F8 0020
        BEQ     L_F640                          ; F64E   0224 000F

        DECR    R0                              ; F650   0010
        BEQ     L_F63F                          ; F651   0224 0013
        PULR    R7                              ; F653   02B7

        PSHR    R5                              ; F654   0275
        MVI@    R4,     R3                      ; F655   02A3
L_F656:
        MVI@    R4,     R0                      ; F656   02A0
        TSTR    R0                              ; F657   0080
        BEQ     L_F581                          ; F658   0224 00D8

        MOVR    R0,     R1                      ; F65A   0081
        ANDI    #$000F, R0                      ; F65B   03B8 000F
        XORR    R0,     R1                      ; F65D   01C1
        CMPI    #$000F, R0                      ; F65E   0378 000F
        BNEQ    L_F667                          ; F660   020C 0005

        SLR     R1,     2                       ; F662   0065
        SLR     R1,     2                       ; F663   0065
        ADDR    R1,     R3                      ; F664   00CB
        B       L_F656                          ; F665   0220 0010

L_F667:
        MOVR    R7,     R5                      ; F667   00BD
        ADDI    #$01B3, R5                      ; F668   02FD 01B3
        SLL     R0,     1                       ; F66A   0048
        ADDR    R0,     R5                      ; F66B   00C5
        SLR     R1,     1                       ; F66C   0061
        SDBD                                    ; F66D   0001
        XOR@    R5,     R1                      ; F66E   03E9
        MVO@    R1,     R3                      ; F66F   0259
        INCR    R3                              ; F670   000B
        B       L_F656                          ; F671   0220 001C

        DECLE   $000A,  $0003,  $0000,  $0063   ; F673   000A 0003 0000 0063
        DECLE   $0007,  $0003,  $00C4,  $0005   ; F677   0007 0003 00C4 0005
        DECLE   $000A,  $0000,  $0007,  $0205   ; F67B   000A 0000 0007 0205
        DECLE   $0053,  $0045,  $0052,  $0056   ; F67F   0053 0045 0052 0056
        DECLE   $0049,  $004E,  $0047,  $0001   ; F683   0049 004E 0047 0001
        DECLE   $0003,  $0242,  $004D,  $006F   ; F687   0003 0242 004D 006F
        DECLE   $0076,  $0065,  $0020,  $0053   ; F68B   0076 0065 0020 0053
        DECLE   $0065,  $0072,  $0076,  $0065   ; F68F   0065 0072 0076 0065
        DECLE   $0072,  $0000,  $026A,  $0031   ; F693   0072 0000 026A 0031
        DECLE   $0073,  $0074,  $0020,  $0050   ; F697   0073 0074 0020 0050
        DECLE   $0072,  $0065,  $0073,  $0073   ; F69B   0072 0065 0073 0073
        DECLE   $003A,  $0000,  $027F,  $0053   ; F69F   003A 0000 027F 0053
        DECLE   $0065,  $006C,  $0065,  $0063   ; F6A3   0065 006C 0065 0063
        DECLE   $0074,  $0020,  $0053,  $0070   ; F6A7   0074 0020 0053 0070
        DECLE   $0065,  $0065,  $0064,  $0000   ; F6AB   0065 0065 0064 0000
        DECLE   $0293,  $0054,  $006F,  $0073   ; F6AF   0293 0054 006F 0073
        DECLE   $0073,  $0020,  $0042,  $0061   ; F6B3   0073 0020 0042 0061
        DECLE   $006C,  $006C,  $0020,  $0055   ; F6B7   006C 006C 0020 0055
        DECLE   $0070,  $0000,  $02BA,  $0032   ; F6BB   0070 0000 02BA 0032
        DECLE   $006E,  $0064,  $0020,  $0050   ; F6BF   006E 0064 0020 0050
        DECLE   $0072,  $0065,  $0073,  $0073   ; F6C3   0072 0065 0073 0073
        DECLE   $003A,  $0000,  $02CF,  $0048   ; F6C7   003A 0000 02CF 0048
        DECLE   $0069,  $0074,  $0020,  $0054   ; F6CB   0069 0074 0020 0054
        DECLE   $006F,  $0020,  $0041,  $0072   ; F6CF   006F 0020 0041 0072
        DECLE   $0065,  $0061,  $0002,  $0007   ; F6D3   0065 0061 0002 0007
        DECLE   $0205,  $004F,  $0046,  $0046   ; F6D7   0205 004F 0046 0046
        DECLE   $0045,  $004E,  $0053,  $0045   ; F6DB   0045 004E 0053 0045
        DECLE   $0001,  $0003,  $022E,  $004D   ; F6DF   0001 0003 022E 004D
        DECLE   $006F,  $0076,  $0065,  $0020   ; F6E3   006F 0076 0065 0020
        DECLE   $004D,  $0061,  $006E,  $0000   ; F6E7   004D 0061 006E 0000
        DECLE   $0256,  $004E,  $0065,  $0078   ; F6EB   0256 004E 0065 0078
        DECLE   $0074,  $0020,  $0053,  $0068   ; F6EF   0074 0020 0053 0068
        DECLE   $006F,  $0074,  $0020,  $0041   ; F6F3   006F 0074 0020 0041
        DECLE   $0072,  $0065,  $0061,  $0000   ; F6F7   0072 0065 0061 0000
        DECLE   $027E,  $0053,  $0070,  $0069   ; F6FB   027E 0053 0070 0069
        DECLE   $006B,  $0065,  $0020,  $002D   ; F6FF   006B 0065 0020 002D
        DECLE   $0020,  $0044,  $0069,  $006E   ; F703   0020 0044 0069 006E
        DECLE   $006B,  $0000,  $0292,  $0052   ; F707   006B 0000 0292 0052
        DECLE   $0075,  $006E,  $0020,  $0041   ; F70B   0075 006E 0020 0041
        DECLE   $006E,  $0064,  $0020,  $0044   ; F70F   006E 0064 0020 0044
        DECLE   $0069,  $0076,  $0065,  $0000   ; F713   0069 0076 0065 0000
        DECLE   $02BA,  $0048,  $0069,  $0074   ; F717   02BA 0048 0069 0074
        DECLE   $0020,  $004F,  $0076,  $0065   ; F71B   0020 004F 0076 0065
        DECLE   $0072,  $0020,  $0045,  $0061   ; F71F   0072 0020 0045 0061
        DECLE   $0072,  $006C,  $0079,  $0000   ; F723   0072 006C 0079 0000
        DECLE   $02E2,  $0053,  $0065,  $006C   ; F727   02E2 0053 0065 006C
        DECLE   $0065,  $0063,  $0074,  $0020   ; F72B   0065 0063 0074 0020
        DECLE   $004E,  $0065,  $0077,  $0020   ; F72F   004E 0065 0077 0020
        DECLE   $004D,  $0061,  $006E,  $0002   ; F733   004D 0061 006E 0002
        DECLE   $0007,  $0205,  $0044,  $0045   ; F737   0007 0205 0044 0045
        DECLE   $0046,  $0045,  $004E,  $0053   ; F73B   0046 0045 004E 0053
        DECLE   $0045,  $0001,  $0003,  $0242   ; F73F   0045 0001 0003 0242
        DECLE   $004D,  $006F,  $0076,  $0065   ; F743   004D 006F 0076 0065
        DECLE   $0020,  $004D,  $0061,  $006E   ; F747   0020 004D 0061 006E
        DECLE   $0000,  $026A,  $004A,  $0075   ; F74B   0000 026A 004A 0075
        DECLE   $006D,  $0070,  $0020,  $0054   ; F74F   006D 0070 0020 0054
        DECLE   $006F,  $0020,  $0042,  $006C   ; F753   006F 0020 0042 006C
        DECLE   $006F,  $0063,  $006B,  $0000   ; F757   006F 0063 006B 0000
        DECLE   $0292,  $0052,  $0075,  $006E   ; F75B   0292 0052 0075 006E
        DECLE   $0020,  $0041,  $006E,  $0064   ; F75F   0020 0041 006E 0064
        DECLE   $0020,  $0044,  $0069,  $0076   ; F763   0020 0044 0069 0076
        DECLE   $0065,  $0000,  $02BA,  $0048   ; F767   0065 0000 02BA 0048
        DECLE   $0069,  $0074,  $0020,  $004F   ; F76B   0069 0074 0020 004F
        DECLE   $0076,  $0065,  $0072,  $0020   ; F76F   0076 0065 0072 0020
        DECLE   $0045,  $0061,  $0072,  $006C   ; F773   0045 0061 0072 006C
        DECLE   $0079,  $0000                   ; F777   0079 0000

        ADD@    R4,     R2                      ; F779   02E2
        RLC     R3,     1                       ; F77A   0053
        SLR     R1,     2                       ; F77B   0065
        SAR     R0,     2                       ; F77C   006C
        SLR     R1,     2                       ; F77D   0065
        SLR     R3,     1                       ; F77E   0063
        RRC     R0,     2                       ; F77F   0074
        NEGR    R0                              ; F780   0020
        SLL     R2,     2                       ; F781   004E
        SLR     R1,     2                       ; F782   0065
        RRC     R3,     2                       ; F783   0077
        NEGR    R0                              ; F784   0020
        SLL     R1,     2                       ; F785   004D
        SLR     R1,     1                       ; F786   0061
        SAR     R2,     2                       ; F787   006E
        EIS                                     ; F788   0002
        INCR    R7                              ; F789   000F

        DECR    R3                              ; F78A   0013
L_F78B:
        COMR    R3                              ; F78B   001B
        DECLE   $0021,  $0025,  $0029,  $002D   ; F78C   0021 0025 0029 002D
        DECLE   $0031,  $0035,  $0039,  $003D   ; F790   0031 0035 0039 003D
        DECLE   $0041,  $0045,  $0049,  $004D   ; F794   0041 0045 0049 004D
        DECLE   $0015,  $0242,  $000C,  $0000   ; F798   0015 0242 000C 0000
        DECLE   $0000,  $026A,  $000B,  $027F   ; F79C   0000 026A 000B 027F
        DECLE   $000C,  $0293,  $000C,  $0000   ; F7A0   000C 0293 000C 0000
        DECLE   $0000                           ; F7A4   0000

        MVII    #$000A, R2                      ; F7A5   02BA 000A
        ADD@    R1,     R7                      ; F7A7   02CF

        DECLE   $000B,  $0000,  $0015,  $022E   ; F7A8   000B 0000 0015 022E
        DECLE   $0008,  $0000,  $0000,  $0256   ; F7AC   0008 0000 0000 0256
        DECLE   $000E,  $0000,  $000F,  $027E   ; F7B0   000E 0000 000F 027E
        DECLE   $0005,  $0000,  $0012,  $0286   ; F7B4   0005 0000 0012 0286
        DECLE   $0004,  $0000,  $0018,  $0292   ; F7B8   0004 0000 0018 0292
        DECLE   $000D,  $0000,  $000D,  $02BA   ; F7BC   000D 0000 000D 02BA
        DECLE   $000E,  $0000,  $000A,  $02E2   ; F7C0   000E 0000 000A 02E2
        DECLE   $000E,  $0000,  $0015,  $0242   ; F7C4   000E 0000 0015 0242
        DECLE   $0008,  $0000                   ; F7C8   0008 0000

        INCR    R7                              ; F7CA   000F

        MVO@    R2,     R5                      ; F7CB   026A
L_F7CC:
        INCR    R5                              ; F7CC   000D
        DECLE   $0000,  $0018,  $0292,  $000D   ; F7CD   0000 0018 0292 000D
        DECLE   $0000,  $000D,  $02BA,  $000E   ; F7D1   0000 000D 02BA 000E
        DECLE   $0000,  $000A,  $02E2,  $000E   ; F7D5   0000 000A 02E2 000E
        DECLE   $0000,  $023D,  $023E,  $023F   ; F7D9   0000 023D 023E 023F
        DECLE   $0251,  $0252,  $0253,  $0265   ; F7DD   0251 0252 0253 0265
        DECLE   $0266,  $0267,  $0000,  $0279   ; F7E1   0266 0267 0000 0279
        DECLE   $027B,  $0000,  $027A,  $0000   ; F7E5   027B 0000 027A 0000
        DECLE   $0329,  $032A,  $0000,  $032B   ; F7E9   0329 032A 0000 032B
        DECLE   $032C,  $0000,  $032D,  $032E   ; F7ED   032C 0000 032D 032E
        DECLE   $0000,  $032B,  $032C,  $032D   ; F7F1   0000 032B 032C 032D
        DECLE   $032E,  $0000,  $000B,  $0002   ; F7F5   032E 0000 000B 0002
        DECLE   $0028,  $0001,  $0010,  $0009   ; F7F9   0028 0001 0010 0009
        DECLE   $002B,  $0002,  $0028,  $0001   ; F7FD   002B 0002 0028 0001
        DECLE   $0010,  $0009,  $000B,  $0002   ; F801   0010 0009 000B 0002
        DECLE   $0032,  $0001,  $0010,  $0009   ; F805   0032 0001 0010 0009
        DECLE   $002B,  $0002,  $0032,  $0001   ; F809   002B 0002 0032 0001
        DECLE   $0010,  $0009,  $000E,  $0006   ; F80D   0010 0009 000E 0006
        DECLE   $0042,  $0003,  $001B,  $0029   ; F811   0042 0003 001B 0029
        DECLE   $001C,  $0006,  $0042,  $0003   ; F815   001C 0006 0042 0003
        DECLE   $001B,  $0029,  $0000,  $0028   ; F819   001B 0029 0000 0028
        DECLE   $0000,  $0000,  $0000,  $0008   ; F81D   0000 0000 0000 0008
        DECLE   $0007,  $0008,  $0003,  $003A   ; F821   0007 0008 0003 003A
        DECLE   $0007,  $003A,  $0000,  $003A   ; F825   0007 003A 0000 003A
        DECLE   $0007,  $000E,  $0203,  $00E2   ; F829   0007 000E 0203 00E2
        DECLE   $013F                           ; F82D   013F

        ADDR    R4,     R2                      ; F82E   00E2
        SUBR    R1,     R7                      ; F82F   010F

        DECLE   $0002,  $0042,  $0042,  $00D2   ; F830   0002 0042 0042 00D2
        DECLE   $0022,  $00FF,  $0012,  $0100   ; F834   0022 00FF 0012 0100
        DECLE   $0112,  $0122,  $0030,  $00FF   ; F838   0112 0122 0030 00FF
        DECLE   $0012,  $0130,  $0142,  $0152   ; F83C   0012 0130 0142 0152
        DECLE   $0030,  $00FF,  $0012,  $0160   ; F840   0030 00FF 0012 0160
        DECLE   $0172,  $0182,  $0030,  $00FF   ; F844   0172 0182 0030 00FF
        DECLE   $0012,  $0190,  $00F2,  $01A2   ; F848   0012 0190 00F2 01A2
        DECLE   $0030,  $00FF,  $0012,  $00C0   ; F84C   0030 00FF 0012 00C0
        DECLE   $0052,  $0092,  $0030,  $00FF   ; F850   0052 0092 0030 00FF
        DECLE   $0012,  $0080,  $0001,  $0062   ; F854   0012 0080 0001 0062
        DECLE   $0030,  $00FF                   ; F858   0030 00FF

        DECR    R2                              ; F85A   0012
        MOVR    R6,     R0                      ; F85B   00B0
        RRC     R2,     1                       ; F85C   0072
        MOVR    R4,     R2                      ; F85D   00A2
        GSWD    R0                              ; F85E   0030
        SUBR    R1,     R7                      ; F85F   010F

        ANDR    R6,     R3                      ; F860   01B3
        XORR    R0,     R3                      ; F861   01C3
        XORR    R2,     R3                      ; F862   01D3
        XORR    R4,     R3                      ; F863   01E3
        SUBR    R1,     R7                      ; F864   010F

        DECLE   $01F3,  $0203,  $0213,  $0000   ; F865   01F3 0203 0213 0000

        SWAP    R0,     2                       ; F869   0044
        MOVR    R5,     R2                      ; F86A   00AA
        RLC     R0,     2                       ; F86B   0054
        DECR    R5                              ; F86C   0015
        RLC     R2,     1                       ; F86D   0052
        MOVR    R4,     R1                      ; F86E   00A1
        ADCR    R2                              ; F86F   002A
        TSTR    R4                              ; F870   00A4
        MOVR    R1,     R0                      ; F871   0088
        EIS                                     ; F872   0002
        ADCR    R0                              ; F873   0028
        NEGR    R2                              ; F874   0022
        SWAP    R0,     1                       ; F875   0040
        MOVR    R0,     R1                      ; F876   0081
        DECR    R1                              ; F877   0011
        RLC     R1,     2                       ; F878   0055
        TSTR    R4                              ; F879   00A4
        MOVR    R1,     R0                      ; F87A   0088
        PSHR    R5                              ; F87B   0275

        JSR     R5,     L_6F41                  ; F87C   0004 016C 0341
        DECLE   $0280,  $0352,  $03B8,  $0080   ; F87F   0280 0352 03B8 0080
        DECLE   $0204,  $0073,  $0281,  $0171   ; F883   0204 0073 0281 0171
        DECLE   $0089,  $020C,  $0011,  $0283   ; F887   0089 020C 0011 0283
        DECLE   $035E,  $03BB,  $001F,  $037B   ; F88B   035E 03BB 001F 037B
        DECLE   $0014,  $020D,  $0009,  $02FB   ; F88F   0014 020D 0009 02FB
        DECLE   $0214,  $0001,  $02B8,  $00E7   ; F893   0214 0001 02B8 00E7
        DECLE   $0048,  $0004                   ; F897   0048 0004

        ANDR    R5,     R0                      ; F899   01A8
        ADDR    R7,     R1                      ; F89A   00F9
        ANDI    #$0003, R1                      ; F89B   03B9 0003
        BNEQ    L_F8F8                          ; F89D   020C 0059

        MVII    #$0214, R3                      ; F89F   02BB 0214
L_F8A1:
        MVI@    R3,     R0                      ; F8A1   0298
        DECLE   $0040,  $03B8,  $00C0,  $0204   ; F8A2   0040 03B8 00C0 0204
        DECLE   $004C,  $0298,  $0001,  $02F8   ; F8A6   004C 0298 0001 02F8
        DECLE   $0000,  $0040,  $0004           ; F8AA   0000 0040 0004

        ANDR    R5,     R0                      ; F8AD   01A8
        ADDR    R7,     R1                      ; F8AE   00F9
        SWAP    R0,     1                       ; F8AF   0040
        ANDI    #$00C0, R0                      ; F8B0   03B8 00C0
        BEQ     L_F8B8                          ; F8B2   0204 0004

        CMPI    #$00C0, R0                      ; F8B4   0378 00C0
        BNEQ    L_F8C6                          ; F8B6   020C 000E

L_F8B8:
        SWAP    R0,     1                       ; F8B8   0040
        DECLE   $0001,  $02F8,  $0088,  $0018   ; F8B9   0001 02F8 0088 0018
        DECLE   $0281,  $035E,  $03B9,  $0008   ; F8BD   0281 035E 03B9 0008
        DECLE   $00C8,  $0004                   ; F8C1   00C8 0004

        ANDR    R5,     R0                      ; F8C3   01A8
        ADDR    R7,     R1                      ; F8C4   00F9
        SWAP    R0,     1                       ; F8C5   0040
L_F8C6:
        ANDI    #$00C0, R0                      ; F8C6   03B8 00C0
        DECLE   $0378,  $0080,  $020C,  $0027   ; F8C8   0378 0080 020C 0027
        DECLE   $0013,  $037B,  $0214,  $0205   ; F8CC   0013 037B 0214 0205
        DECLE   $000E,  $0298,  $0001,  $03B8   ; F8D0   000E 0298 0001 03B8
        DECLE   $0000,  $00C0,  $020C,  $0007   ; F8D4   0000 00C0 020C 0007
        DECLE   $0001,  $02B8,  $00E7,  $0048   ; F8D8   0001 02B8 00E7 0048
        DECLE   $0004,  $01A8,  $00F9,  $02FB   ; F8DC   0004 01A8 00F9 02FB
        DECLE   $0002,  $037B,  $0228,  $020D   ; F8E0   0002 037B 0228 020D
        DECLE   $000F,  $0298,  $0001,  $03B8   ; F8E4   000F 0298 0001 03B8
        DECLE   $0000,  $00C0,  $020C,  $0008   ; F8E8   0000 00C0 020C 0008
        DECLE   $0001,  $02B8,  $00E7,  $0048   ; F8EC   0001 02B8 00E7 0048
        DECLE   $0004                           ; F8F0   0004

        ANDR    R5,     R0                      ; F8F1   01A8
        ADDR    R7,     R1                      ; F8F2   00F9
        INCR    R3                              ; F8F3   000B
        CMPI    #$0228, R3                      ; F8F4   037B 0228
        BLT     L_F8A1                          ; F8F6   0225 0056
L_F8F8:
        PULR    R7                              ; F8F8   02B7

        MVI@    R3,     R1                      ; F8F9   0299
        ANDI    #$01F8, R1                      ; F8FA   03B9 01F8
        CMPI    #$0088, R1                      ; F8FC   0379 0088
        BEQ     L_F912                          ; F8FE   0204 0012

        CMPI    #$0090, R1                      ; F900   0379 0090
        BEQ     L_F912                          ; F902   0204 000E

        CMPI    #$00E0, R1                      ; F904   0379 00E0
        BEQ     L_F912                          ; F906   0204 000A

        MVI@    R3,     R1                      ; F908   0299
        SDBD                                    ; F909   0001
        ANDI    #$3FFF, R1                      ; F90A   03B9 00FF 003F
        SDBD                                    ; F90D   0001
        ANDI    #$C000, R0                      ; F90E   03B8 0000 00C0
        ADDR    R1,     R0                      ; F911   00C8
L_F912:
        MVO@    R0,     R3                      ; F912   0258
        MOVR    R5,     R7                      ; F913   00AF

        PSHR    R5                              ; F914   0275
        MVI     G_0352, R0                      ; F915   0280 0352
        ANDI    #$0080, R0                      ; F917   03B8 0080
        BEQ     L_F8F8                          ; F919   0224 0022

        MVI     G_0173, R0                      ; F91B   0280 0173

        JSR     R5,     L_5944                  ; F91D   0004 0158 0144
        BIDECLE $6F4D                           ; F920   004D 006F

        BNEQ    L_F8F8                          ; F922   022C 002B

        MVI     G_0171, R4                      ; F924   0284 0171
        ANDI    #$000E, R4                      ; F926   03BC 000E
        SDBD                                    ; F928   0001
        ADDI    #$A869, R4                      ; F929   02FC 0069 00A8
        SDBD                                    ; F92C   0001
        MVII    #$388E, R5                      ; F92D   02BD 008E 0038
        MVI@    R4,     R0                      ; F930   02A0
        MVO@    R0,     R5                      ; F931   0268
        MVI@    R4,     R0                      ; F932   02A0
        MVO@    R0,     R5                      ; F933   0268
        ADDI    #$0006, R5                      ; F934   02FD 0006
        MVI@    R4,     R0                      ; F936   02A0
        MVO@    R0,     R5                      ; F937   0268
        MVI@    R4,     R0                      ; F938   02A0
        MVO@    R0,     R5                      ; F939   0268
        SDBD                                    ; F93A   0001
        MVII    #$38E0, R5                      ; F93B   02BD 00E0 0038
        CLRR    R0                              ; F93E   01C0
        MVO@    R0,     R5                      ; F93F   0268
        MVO@    R0,     R5                      ; F940   0268
        MVO@    R0,     R5                      ; F941   0268
        MVO@    R0,     R5                      ; F942   0268
        MVO@    R0,     R5                      ; F943   0268
        MVI     G_0171, R4                      ; F944   0284 0171
        COMR    R4                              ; F946   001C
        ANDI    #$0007, R4                      ; F947   03BC 0007
        SDBD                                    ; F949   0001
        ADDI    #$A869, R4                      ; F94A   02FC 0069 00A8
        MVI@    R4,     R0                      ; F94D   02A0
        MVO@    R0,     R5                      ; F94E   0268
        MVI@    R4,     R0                      ; F94F   02A0
        MVO@    R0,     R5                      ; F950   0268
        MVI@    R4,     R0                      ; F951   02A0
        MVO@    R0,     R5                      ; F952   0268
        PULR    R7                              ; F953   02B7

        DECLE   $0275,  $0280,  $0173,  $0378   ; F954   0275 0280 0173 0378
        DECLE   $0002,  $020C,  $0275,  $0280   ; F958   0002 020C 0275 0280
        DECLE   $0352,  $03B8,  $0001,  $0204   ; F95C   0352 03B8 0001 0204
        DECLE   $0011,  $01C0,  $0240,  $0179   ; F960   0011 01C0 0240 0179
        DECLE   $0280,  $0180,  $0378,  $00FF   ; F964   0280 0180 0378 00FF
        DECLE   $0204,  $0008,  $004C,  $0048   ; F968   0204 0008 004C 0048
        DECLE   $02BC,  $018E,  $00C4,  $0004   ; F96C   02BC 018E 00C4 0004

        ANDR    R5,     R0                      ; F970   01A8
        ANDR    R1,     R0                      ; F971   0188
        MVI     G_0352, R0                      ; F972   0280 0352
        ANDI    #$0002, R0                      ; F974   03B8 0002
        BEQ     L_FBD0                          ; F976   0204 0258

        MVII    #$0001, R0                      ; F978   02B8 0001
        MVO     R0,     G_0179                  ; F97A   0240 0179
        MVI     G_0181, R0                      ; F97C   0280 0181
        CMPI    #$00FF, R0                      ; F97E   0378 00FF
        BEQ     L_FBD0                          ; F980   0204 024E

        SLL     R0,     2                       ; F982   004C
        SLL     R0,     1                       ; F983   0048
        MVII    #$01BE, R4                      ; F984   02BC 01BE
        ADDR    R0,     R4                      ; F986   00C4
        INCR    R7                              ; F987   000F

        PSHR    R5                              ; F988   0275
L_F989:
        MVII    #$0353, R1                      ; F989   02B9 0353
        ADD     G_0179, R1                      ; F98B   02C1 0179
        MVI@    R1,     R0                      ; F98D   0288
        DECR    R0                              ; F98E   0010
        BMI     L_FBD0                          ; F98F   020B 023F

        MVO@    R0,     R1                      ; F991   0248
        BNEQ    L_FBD0                          ; F992   020C 023C

        JSR     R5,     L_5621                  ; F994   0004 0154 0221

        MVI     G_034F, R0                      ; F997   0280 034F
        ANDI    #$0080, R0                      ; F999   03B8 0080
        BNEQ    L_FBC1                          ; F99B   020C 0224

        MVO     R4,     G_0350                  ; F99D   0244 0350

        JSR     R5,     L_6253                  ; F99F   0004 0160 0253

        BEQ     L_FA06                          ; F9A2   0204 0062

        MVI     G_034F, R0                      ; F9A4   0280 034F
        ANDI    #$0100, R0                      ; F9A6   03B8 0100
        BNEQ    L_F9B5                          ; F9A8   020C 000B

        MVII    #$0009, R0                      ; F9AA   02B8 0009

        JSR     R5,     X_RAND2                 ; F9AC   0004 0114 029E

        INCR    R0                              ; F9AF   0008

        JSR     R5,     L_6144                  ; F9B0   0004 0160 0144

        B       L_FBBD                          ; F9B3   0200 0208

L_F9B5:
        MVI     G_0347, R0                      ; F9B5   0280 0347
        TSTR    R0                              ; F9B7   0080
        BPL     L_FBBD                          ; F9B8   0203 0203

        MVI     G_0346, R0                      ; F9BA   0280 0346
        SLL     R0,     1                       ; F9BC   0048
        SWAP    R0,     1                       ; F9BD   0040
        ANDI    #$00FF, R0                      ; F9BE   03B8 00FF
        CMPI    #$0012, R0                      ; F9C0   0378 0012
        BGT     L_FBBD                          ; F9C2   020E 01F9

        CMPI    #$000F, R0                      ; F9C4   0378 000F
        BLT     L_FBBD                          ; F9C6   0205 01F5

        MOVR    R7,     R3                      ; F9C8   00BB
        ADDI    #$0399, R3                      ; F9C9   02FB 0399
        MVI     G_0175, R0                      ; F9CB   0280 0175
        ANDI    #$0001, R0                      ; F9CD   03B8 0001
        XOR     G_0179, R0                      ; F9CF   03C0 0179
        TSTR    R0                              ; F9D1   0080
        BEQ     L_F9D7                          ; F9D2   0204 0003

        MOVR    R7,     R3                      ; F9D4   00BB
        ADDI    #$0396, R3                      ; F9D5   02FB 0396
L_F9D7:
        MVII    #$0009, R0                      ; F9D7   02B8 0009
        MVI     G_0171, R2                      ; F9D9   0282 0171
        MVI     G_0188, R1                      ; F9DB   0281 0188
        INCR    R1                              ; F9DD   0009
        ADDR    R7,     R1                      ; F9DE   00F9
        ADD@    R1,     R7                      ; F9DF   02CF

        XORR    R6,     R0                      ; F9E0   01F0
        COMR    R4                              ; F9E1   001C
        COMR    R4                              ; F9E2   001C
        INCR    R2                              ; F9E3   000A
        INCR    R6                              ; F9E4   000E
        INCR    R6                              ; F9E5   000E
        DECR    R2                              ; F9E6   0012
        DECR    R2                              ; F9E7   0012
        COMR    R2                              ; F9E8   001A
        COMR    R2                              ; F9E9   001A
        ANDI    #$0001, R2                      ; F9EA   03BA 0001
        BEQ     L_F9FC                          ; F9EC   0204 000E

L_F9EE:
        SUBI    #$0003, R0                      ; F9EE   0338 0003
        B       L_F9FC                          ; F9F0   0200 000A

        SUBI    #$0003, R0                      ; F9F2   0338 0003
        ANDI    #$0003, R2                      ; F9F4   03BA 0003
        BNEQ    L_F9EE                          ; F9F6   022C 0009
        B       L_F9FC                          ; F9F8   0200 0002

        SUBI    #$0006, R0                      ; F9FA   0338 0006

L_F9FC:
        JSR     R5,     X_RAND2                 ; F9FC   0004 0114 029E

        ADDR    R0,     R3                      ; F9FF   00C3
        MVI@    R3,     R0                      ; FA00   0298

        JSR     R5,     L_6144                  ; FA01   0004 0160 0144

        B       L_FBC1                          ; FA04   0200 01BB

L_FA06:
        JSR     R5,     L_6ECA                  ; FA06   0004 016C 02CA

        BNEQ    L_FAD4                          ; FA09   020C 00C9

        JSR     R5,     L_6EEF                  ; FA0B   0004 016C 02EF

        BEQ     L_FA1A                          ; FA0E   0204 000A

        MVI     G_034F, R0                      ; FA10   0280 034F
        ANDI    #$0010, R0                      ; FA12   03B8 0010
        SLR     R0,     2                       ; FA14   0064
        SLR     R0,     2                       ; FA15   0064
        CMP     G_0179, R0                      ; FA16   0340 0179
        BNEQ    L_FBC1                          ; FA18   020C 01A7

L_FA1A:
        MVI     G_034F, R0                      ; FA1A   0280 034F
        CLRR    R5                              ; FA1C   01ED
        ANDI    #$0008, R0                      ; FA1D   03B8 0008
        BEQ     L_FA22                          ; FA1F   0204 0001

        INCR    R5                              ; FA21   000D
L_FA22:
        MVI     G_0175, R2                      ; FA22   0282 0175
        ANDI    #$0001, R2                      ; FA24   03BA 0001
        XOR     G_0179, R2                      ; FA26   03C2 0179
        CMPR    R5,     R2                      ; FA28   016A
        BNEQ    L_FA33                          ; FA29   020C 0008

        MVI     G_034F, R1                      ; FA2B   0281 034F
        ANDI    #$0003, R1                      ; FA2D   03B9 0003
        CMPI    #$0003, R1                      ; FA2F   0379 0003
        BEQ     L_FBC1                          ; FA31   0204 018E

L_FA33:
        MVI     G_0350, R1                      ; FA33   0281 0350
        ADDI    #$0007, R1                      ; FA35   02F9 0007
        MVI@    R1,     R0                      ; FA37   0288

        JSR     R5,     L_5944                  ; FA38   0004 0158 0144
        BIDECLE $6375                           ; FA3B   0075 0063

        BEQ     L_FBC1                          ; FA3D   0204 0182

        MVI     G_018C, R0                      ; FA3F   0280 018C
        MVI     G_018D, R1                      ; FA41   0281 018D
        MVI     G_0350, R4                      ; FA43   0284 0350
        INCR    R4                              ; FA45   000C
        MVI@    R4,     R2                      ; FA46   02A2
        MVI@    R4,     R3                      ; FA47   02A3

        JSR     R5,     L_58A6                  ; FA48   0004 0158 00A6

        CMPI    #$0001, R0                      ; FA4B   0378 0001
        BLE     L_FA75                          ; FA4D   0206 0026

        MVI     G_018C, R0                      ; FA4F   0280 018C
        MVI     G_018D, R1                      ; FA51   0281 018D
        MVI     G_0350, R4                      ; FA53   0284 0350
        INCR    R4                              ; FA55   000C
        SUB@    R4,     R0                      ; FA56   0320
        SUB@    R4,     R1                      ; FA57   0321

        JSR     R5,     .EXEC.A2F               ; FA58   0004 0118 022F

        MOVR    R1,     R0                      ; FA5B   0088

        JSR     R5,     L_5F46                  ; FA5C   0004 015C 0346

        MVI     G_0347, R0                      ; FA5F   0280 0347
        TSTR    R0                              ; FA61   0080
        BPL     L_FA7A                          ; FA62   0203 0016

        MVI     G_0346, R0                      ; FA64   0280 0346
        SLL     R0,     1                       ; FA66   0048
        SWAP    R0,     1                       ; FA67   0040
        ANDI    #$00FF, R0                      ; FA68   03B8 00FF
        CMPI    #$0009, R0                      ; FA6A   0378 0009
        BGT     L_FA7A                          ; FA6C   020E 000C

        MVII    #$00FB, R0                      ; FA6E   02B8 00FB

        JSR     R5,     L_6286                  ; FA70   0004 0160 0286

        B       L_FBC1                          ; FA73   0200 014C

L_FA75:
        MVII    #$00FF, R0                      ; FA75   02B8 00FF

        JSR     R5,     L_5F46                  ; FA77   0004 015C 0346

L_FA7A:
        MVI     G_034F, R3                      ; FA7A   0283 034F
        MOVR    R3,     R0                      ; FA7C   0098
        ANDI    #$0008, R0                      ; FA7D   03B8 0008
        SLR     R0,     2                       ; FA7F   0064
        SLR     R0,     1                       ; FA80   0060
        MVI     G_0175, R2                      ; FA81   0282 0175
        ANDI    #$0001, R2                      ; FA83   03BA 0001
        XOR     G_0179, R2                      ; FA85   03C2 0179
        CMPR    R0,     R2                      ; FA87   0142
        BNEQ    L_FBC1                          ; FA88   020C 0137

        MVI     G_034F, R3                      ; FA8A   0283 034F
        ANDI    #$0003, R3                      ; FA8C   03BB 0003
        BEQ     L_FBC1                          ; FA8E   0204 0131

        MVI     G_0347, R0                      ; FA90   0280 0347
        TSTR    R0                              ; FA92   0080
        BPL     L_FBC1                          ; FA93   0203 012C

        MVI     G_0346, R0                      ; FA95   0280 0346
        SLL     R0,     1                       ; FA97   0048
        SWAP    R0,     1                       ; FA98   0040
        ANDI    #$00FF, R0                      ; FA99   03B8 00FF
        CMPI    #$0034, R0                      ; FA9B   0378 0034
        BGT     L_FBC1                          ; FA9D   020E 0122

        CMPI    #$0019, R0                      ; FA9F   0378 0019
        BGT     L_FAAF                          ; FAA1   020E 000C

        CMPI    #$0001, R3                      ; FAA3   037B 0001
        BNEQ    L_FBC1                          ; FAA5   020C 011A

        MVI     G_0171, R0                      ; FAA7   0280 0171
        ANDI    #$000C, R0                      ; FAA9   03B8 000C
        BNEQ    L_FBC1                          ; FAAB   020C 0114
        B       L_FABB                          ; FAAD   0200 000C

L_FAAF:
        CMPI    #$0002, R3                      ; FAAF   037B 0002
        BEQ     L_FABB                          ; FAB1   0204 0008

        MVII    #$0358, R1                      ; FAB3   02B9 0358
        ADD     G_0179, R1                      ; FAB5   02C1 0179
        MVI@    R1,     R0                      ; FAB7   0288
        TSTR    R0                              ; FAB8   0080
        BNEQ    L_FBC1                          ; FAB9   020C 0106

L_FABB:
        MVI     G_0350, R4                      ; FABB   0284 0350
        INCR    R4                              ; FABD   000C
        MVI@    R4,     R0                      ; FABE   02A0
        SUBI    #$0057, R0                      ; FABF   0338 0057
        BPL     L_FAC4                          ; FAC1   0203 0001

        NEGR    R0                              ; FAC3   0020
L_FAC4:
        CMPI    #$0003, R0                      ; FAC4   0378 0003
        BGT     L_FACD                          ; FAC6   020E 0005

        MVII    #$00FF, R0                      ; FAC8   02B8 00FF

        JSR     R5,     L_5F46                  ; FACA   0004 015C 0346

L_FACD:
        MVII    #$00FE, R0                      ; FACD   02B8 00FE

        JSR     R5,     L_6286                  ; FACF   0004 0160 0286

        B       L_FBC1                          ; FAD2   0200 00ED

L_FAD4:
        MVI     G_0175, R5                      ; FAD4   0285 0175
        ANDI    #$0001, R5                      ; FAD6   03BD 0001
        XOR     G_0179, R5                      ; FAD8   03C5 0179
        MVO     R5,     G_0356                  ; FADA   0245 0356
        MVII    #$018A, R1                      ; FADC   02B9 018A
        ADD     G_0179, R1                      ; FADE   02C1 0179
        MVI@    R1,     R1                      ; FAE0   0289
        ADDR    R7,     R1                      ; FAE1   00F9
        ADDI    #$0332, R1                      ; FAE2   02F9 0332
        MVI@    R1,     R0                      ; FAE4   0288
        TSTR    R5                              ; FAE5   00AD
        BEQ     L_FAEB                          ; FAE6   0204 0003

        NEGR    R0                              ; FAE8   0020
        ADDI    #$00AE, R0                      ; FAE9   02F8 00AE
L_FAEB:
        MVO     R0,     G_0355                  ; FAEB   0240 0355
        MVI     G_018D, R1                      ; FAED   0281 018D
        MVI     G_0350, R4                      ; FAEF   0284 0350
        INCR    R4                              ; FAF1   000C
        MVI@    R4,     R2                      ; FAF2   02A2
        MVI@    R4,     R3                      ; FAF3   02A3

        JSR     R5,     L_58A6                  ; FAF4   0004 0158 00A6

        CMPI    #$0002, R0                      ; FAF7   0378 0002
        BLE     L_FB0D                          ; FAF9   0206 0012

        MVI     G_0355, R0                      ; FAFB   0280 0355
        MVI     G_018D, R1                      ; FAFD   0281 018D
        MVI     G_0350, R4                      ; FAFF   0284 0350
        INCR    R4                              ; FB01   000C
        SUB@    R4,     R0                      ; FB02   0320
        SUB@    R4,     R1                      ; FB03   0321

        JSR     R5,     .EXEC.A2F               ; FB04   0004 0118 022F

        MOVR    R1,     R0                      ; FB07   0088

        JSR     R5,     L_5F46                  ; FB08   0004 015C 0346

        B       L_FB12                          ; FB0B   0200 0005

L_FB0D:
        MVII    #$00FF, R0                      ; FB0D   02B8 00FF

        JSR     R5,     L_5F46                  ; FB0F   0004 015C 0346

L_FB12:
        MVII    #$018E, R4                      ; FB12   02BC 018E
        MVI     G_0179, R5                      ; FB14   0285 0179
        TSTR    R5                              ; FB16   00AD
        BNEQ    L_FB1B                          ; FB17   020C 0002

        MVII    #$01BE, R4                      ; FB19   02BC 01BE

L_FB1B:
        JSR     R5,     L_6DE7                  ; FB1B   0004 016C 01E7
        DECLE   $004C,  $0048,  $00C4,  $00A1   ; FB1E   004C 0048 00C4 00A1
        DECLE   $02FC,  $0007,  $02A0,  $0378   ; FB22   02FC 0007 02A0 0378
        DECLE   $001C,  $0204,  $0004,  $0378   ; FB26   001C 0204 0004 0378
        DECLE   $001D,  $020C,  $0028,  $0004   ; FB2A   001D 020C 0028 0004

        ANDR    R5,     R4                      ; FB2E   01AC
        MVI@    R4,     R5                      ; FB2F   02A5
        CMPI    #$0007, R1                      ; FB30   0379 0007
        BLT     L_FB55                          ; FB32   0205 0021

        MVII    #$0358, R1                      ; FB34   02B9 0358
        ADD     G_0179, R1                      ; FB36   02C1 0179
        MVI@    R1,     R0                      ; FB38   0288
        DECR    R0                              ; FB39   0010
        BMI     L_FB3E                          ; FB3A   020B 0002
        BNEQ    L_FB55                          ; FB3C   020C 0017

L_FB3E:
        MVI     G_0350, R4                      ; FB3E   0284 0350
        INCR    R4                              ; FB40   000C
        MVI@    R4,     R0                      ; FB41   02A0
        SUBI    #$0057, R0                      ; FB42   0338 0057
        BPL     L_FB47                          ; FB44   0203 0001

        NEGR    R0                              ; FB46   0020
L_FB47:
        CMPI    #$0003, R0                      ; FB47   0378 0003
        BGT     L_FB50                          ; FB49   020E 0005

        MVII    #$00FF, R0                      ; FB4B   02B8 00FF

        JSR     R5,     L_5F46                  ; FB4D   0004 015C 0346

L_FB50:
        MVII    #$00FE, R0                      ; FB50   02B8 00FE

        JSR     R5,     L_6286                  ; FB52   0004 0160 0286

L_FB55:
        MVI     G_0352, R0                      ; FB55   0280 0352
        ANDI    #$0080, R0                      ; FB57   03B8 0080
        BEQ     L_FBC1                          ; FB59   0204 0066

        MVII    #$0180, R1                      ; FB5B   02B9 0180
        ADD     G_0179, R1                      ; FB5D   02C1 0179
        MVI@    R1,     R0                      ; FB5F   0288
        XORI    #$0001, R0                      ; FB60   03F8 0001
        SLL     R0,     2                       ; FB62   004C
        SLL     R0,     1                       ; FB63   0048
        MVII    #$018E, R3                      ; FB64   02BB 018E
        MVI     G_0179, R5                      ; FB66   0285 0179
        TSTR    R5                              ; FB68   00AD
        BEQ     L_FB6D                          ; FB69   0204 0002

        MVII    #$01BE, R3                      ; FB6B   02BB 01BE
L_FB6D:
        ADDR    R0,     R3                      ; FB6D   00C3
        MVII    #$0357, R1                      ; FB6E   02B9 0357
        ADD     G_0179, R1                      ; FB70   02C1 0179
        MVI@    R1,     R5                      ; FB72   028D
        TSTR    R5                              ; FB73   00AD
        BEQ     L_FBC1                          ; FB74   0204 004B

        MOVR    R3,     R5                      ; FB76   009D
        ADDI    #$0007, R5                      ; FB77   02FD 0007
        MVI@    R5,     R0                      ; FB79   02A8

        JSR     R5,     L_5944                  ; FB7A   0004 0158 0144
        BIDECLE $AE20                           ; FB7D   0020 00AE

        BEQ     L_FBC1                          ; FB7F   0204 0040

        CLRR    R5                              ; FB81   01ED
        MVO@    R5,     R1                      ; FB82   024D
        MVI@    R3,     R0                      ; FB83   0298
        ANDI    #$00C7, R0                      ; FB84   03B8 00C7
        MVO@    R0,     R3                      ; FB86   0258
        MOVR    R3,     R4                      ; FB87   009C
        MVII    #$0016, R0                      ; FB88   02B8 0016

        JSR     R5,     L_67E2                  ; FB8A   0004 0164 03E2

        MVI     G_018D, R1                      ; FB8D   0281 018D
        SUBI    #$0048, R1                      ; FB8F   0339 0048
        NEGR    R1                              ; FB91   0021
        ADDI    #$0048, R1                      ; FB92   02F9 0048
        CMPI    #$0038, R1                      ; FB94   0379 0038
        BGE     L_FB9A                          ; FB96   020D 0002

        MVII    #$0038, R1                      ; FB98   02B9 0038
L_FB9A:
        CMPI    #$0058, R1                      ; FB9A   0379 0058
        BLE     L_FBA0                          ; FB9C   0206 0002

        MVII    #$0058, R1                      ; FB9E   02B9 0058
L_FBA0:
        MOVR    R1,     R5                      ; FBA0   008D
        SUBI    #$0038, R5                      ; FBA1   033D 0038
        ADDR    R7,     R5                      ; FBA3   00FD
        ADDI    #$0283, R5                      ; FBA4   02FD 0283
        MVI@    R5,     R0                      ; FBA6   02A8
        MVI     G_0356, R5                      ; FBA7   0285 0356
        TSTR    R5                              ; FBA9   00AD
        BEQ     L_FBAF                          ; FBAA   0204 0003

        NEGR    R0                              ; FBAC   0020
        ADDI    #$00AE, R0                      ; FBAD   02F8 00AE
L_FBAF:
        MVII    #$018A, R3                      ; FBAF   02BB 018A
        ADD     G_0179, R3                      ; FBB1   02C3 0179
        MVI@    R3,     R3                      ; FBB3   029B
        ADDR    R7,     R3                      ; FBB4   00FB
        ADDI    #$0265, R3                      ; FBB5   02FB 0265
        MVI@    R3,     R3                      ; FBB7   029B

        JSR     R5,     L_57BB                  ; FBB8   0004 0154 03BB

        B       L_FBC1                          ; FBBB   0200 0004

L_FBBD:
        MVII    #$0001, R0                      ; FBBD   02B8 0001
        B       L_FBCB                          ; FBBF   0200 000A

L_FBC1:
        MVII    #$018A, R1                      ; FBC1   02B9 018A
        ADD     G_0179, R1                      ; FBC3   02C1 0179
        MVI@    R1,     R0                      ; FBC5   0288
        MOVR    R7,     R1                      ; FBC6   00B9
        ADDI    #$0207, R1                      ; FBC7   02F9 0207
        ADDR    R0,     R1                      ; FBC9   00C1
        MVI@    R1,     R0                      ; FBCA   0288
L_FBCB:
        MVII    #$0353, R1                      ; FBCB   02B9 0353
        ADD     G_0179, R1                      ; FBCD   02C1 0179
        MVO@    R0,     R1                      ; FBCF   0248
L_FBD0:
        PULR    R7                              ; FBD0   02B7

        DECLE   $0275,  $0004                   ; FBD1   0275 0004

        ANDR    R5,     R4                      ; FBD3   01AC
        MVO@    R0,     R1                      ; FBD4   0248
        BNEQ    L_FBD0                          ; FBD5   022C 0006

        MVII    #$0184, R2                      ; FBD7   02BA 0184
        ADD     G_0179, R2                      ; FBD9   02C2 0179
        MVI     G_034F, R0                      ; FBDB   0280 034F
        ANDI    #$0003, R0                      ; FBDD   03B8 0003
        CMPI    #$0001, R0                      ; FBDF   0378 0001
        BEQ     L_FBEB                          ; FBE1   0204 0008

        CMPI    #$0002, R0                      ; FBE3   0378 0002
        BEQ     L_FC38                          ; FBE5   0204 0051

        CMPI    #$0003, R0                      ; FBE7   0378 0003
        BEQ     L_FC9F                          ; FBE9   0204 00B4

L_FBEB:
        MVII    #$018A, R4                      ; FBEB   02BC 018A
        MVII    #$0358, R3                      ; FBED   02BB 0358
L_FBEF:
        MVI@    R4,     R5                      ; FBEF   02A5
        ADDR    R7,     R5                      ; FBF0   00FD
        ADDI    #$01E3, R5                      ; FBF1   02FD 01E3
        MVI@    R5,     R0                      ; FBF3   02A8

        JSR     R5,     X_RAND2                 ; FBF4   0004 0114 029E

        MVO@    R0,     R3                      ; FBF7   0258
        INCR    R3                              ; FBF8   000B
        CMPI    #$0359, R3                      ; FBF9   037B 0359
        BLE     L_FBEF                          ; FBFB   0226 000D

        MVII    #$018A, R1                      ; FBFD   02B9 018A
        ADD     G_0179, R1                      ; FBFF   02C1 0179
        MVI@    R1,     R1                      ; FC01   0289
        ADDR    R7,     R1                      ; FC02   00F9
        ADDI    #$01CB, R1                      ; FC03   02F9 01CB
        MVI@    R1,     R0                      ; FC05   0288
        ADDI    #$0005, R0                      ; FC06   02F8 0005

        JSR     R5,     X_RAND2                 ; FC08   0004 0114 029E

        TSTR    R0                              ; FC0B   0080
        BNEQ    L_FC25                          ; FC0C   020C 0017

        JSR     R5,     L_6D60                  ; FC0E   0004 016C 0160

        MOVR    R7,     R1                      ; FC11   00B9
        ADDI    #$01D2, R1                      ; FC12   02F9 01D2
        MVI     G_034F, R5                      ; FC14   0285 034F
        ANDI    #$0008, R5                      ; FC16   03BD 0008
        BEQ     L_FC1D                          ; FC18   0204 0003

        MOVR    R7,     R1                      ; FC1A   00B9
        ADDI    #$01C5, R1                      ; FC1B   02F9 01C5
L_FC1D:
        MVII    #$0003, R0                      ; FC1D   02B8 0003

        JSR     R5,     X_RAND2                 ; FC1F   0004 0114 029E

        ADDR    R0,     R1                      ; FC22   00C1
        B       L_FC99                          ; FC23   0200 0074

L_FC25:
        MOVR    R7,     R1                      ; FC25   00B9
        ADDI    #$01BA, R1                      ; FC26   02F9 01BA
        MVI     G_034F, R5                      ; FC28   0285 034F
        ANDI    #$0008, R5                      ; FC2A   03BD 0008
        BEQ     L_FC31                          ; FC2C   0204 0003

        MOVR    R7,     R1                      ; FC2E   00B9
        ADDI    #$01B5, R1                      ; FC2F   02F9 01B5
L_FC31:
        MVI     G_0171, R0                      ; FC31   0280 0171
        ANDI    #$0003, R0                      ; FC33   03B8 0003
        ADDR    R0,     R1                      ; FC35   00C1
        B       L_FC99                          ; FC36   0200 0061

L_FC38:
        MVI     G_0350, R1                      ; FC38   0281 0350
        DECLE   $02F9,  $0007,  $0288,  $0378   ; FC3A   02F9 0007 0288 0378
        DECLE   $001C,  $020C,  $003F,  $0281   ; FC3E   001C 020C 003F 0281
        DECLE   $0350,  $0004,  $01AC,  $02A5   ; FC42   0350 0004 01AC 02A5
        DECLE   $0379,  $000A,  $0205,  $0036   ; FC46   0379 000A 0205 0036
        DECLE   $0272,  $0004                   ; FC4A   0272 0004

        ANDR    R5,     R4                      ; FC4C   01AC
        MVO@    R3,     R5                      ; FC4D   026B
        PULR    R2                              ; FC4E   02B2
        MVII    #$018A, R1                      ; FC4F   02B9 018A
        ADD     G_0179, R1                      ; FC51   02C1 0179
        MVI@    R1,     R1                      ; FC53   0289
        ADDR    R7,     R1                      ; FC54   00F9
        ADDI    #$017F, R1                      ; FC55   02F9 017F
        MVI@    R1,     R0                      ; FC57   0288
        INCR    R0                              ; FC58   0008

        JSR     R5,     X_RAND2                 ; FC59   0004 0114 029E

        TSTR    R0                              ; FC5C   0080
        BNEQ    L_FC80                          ; FC5D   020C 0021

        MVI     G_0350, R1                      ; FC5F   0281 0350
        INCR    R1                              ; FC61   0009
        MVI@    R1,     R1                      ; FC62   0289
        SUBI    #$0057, R1                      ; FC63   0339 0057
        BPL     L_FC68                          ; FC65   0203 0001

        NEGR    R1                              ; FC67   0021
L_FC68:
        CMPI    #$0004, R1                      ; FC68   0379 0004
        BLT     L_FC7B                          ; FC6A   0205 000F

        MVII    #$018A, R1                      ; FC6C   02B9 018A
        ADD     G_0179, R1                      ; FC6E   02C1 0179
        MVI@    R1,     R1                      ; FC70   0289
        ADDR    R7,     R1                      ; FC71   00F9
        ADDI    #$0162, R1                      ; FC72   02F9 0162
        MVI@    R1,     R0                      ; FC74   0288

        JSR     R5,     X_RAND2                 ; FC75   0004 0114 029E

        TSTR    R0                              ; FC78   0080
        BNEQ    L_FC80                          ; FC79   020C 0005

L_FC7B:
        JSR     R5,     L_6D60                  ; FC7B   0004 016C 0160

        B       L_FC9F                          ; FC7E   0200 001F

L_FC80:
        MVI@    R2,     R0                      ; FC80   0290
        ANDI    #$007F, R0                      ; FC81   03B8 007F
        BEQ     L_FC86                          ; FC83   0204 0001

        DECR    R0                              ; FC85   0010
L_FC86:
        SLL     R0,     1                       ; FC86   0048
        MOVR    R7,     R1                      ; FC87   00B9
        ADDI    #$0168, R1                      ; FC88   02F9 0168
        MVI     G_034F, R5                      ; FC8A   0285 034F
        ANDI    #$0008, R5                      ; FC8C   03BD 0008
        BEQ     L_FC93                          ; FC8E   0204 0003

        MOVR    R7,     R1                      ; FC90   00B9
        ADDI    #$0171, R1                      ; FC91   02F9 0171
L_FC93:
        ADDR    R0,     R1                      ; FC93   00C1
        MVI     G_0171, R0                      ; FC94   0280 0171
        ANDI    #$0001, R0                      ; FC96   03B8 0001
        ADDR    R0,     R1                      ; FC98   00C1
L_FC99:
        MVI@    R2,     R0                      ; FC99   0290
        ANDI    #$0080, R0                      ; FC9A   03B8 0080
        XOR@    R1,     R0                      ; FC9C   03C8
        MVO@    R0,     R2                      ; FC9D   0250
        PULR    R7                              ; FC9E   02B7

L_FC9F:
        MVI     G_017A, R0                      ; FC9F   0280 017A
        DECLE   $0378,  $001E,  $0224,  $00D4   ; FCA1   0378 001E 0224 00D4
        DECLE   $0272,  $0280,  $0175,  $03B8   ; FCA5   0272 0280 0175 03B8
        DECLE   $0001,  $03C0,  $0179,  $03F8   ; FCA9   0001 03C0 0179 03F8
        DECLE   $0001,  $0240,  $0356,  $0004   ; FCAD   0001 0240 0356 0004

        ANDR    R5,     R4                      ; FCB1   01AC
        MVO@    R3,     R5                      ; FCB2   026B
        MOVR    R4,     R1                      ; FCB3   00A1
        ADDI    #$0007, R1                      ; FCB4   02F9 0007
        MVI@    R1,     R0                      ; FCB6   0288
        CMPI    #$001F, R0                      ; FCB7   0378 001F
        BNEQ    L_FD19                          ; FCB9   020C 005E

        INCR    R4                              ; FCBB   000C
        MVI@    R4,     R0                      ; FCBC   02A0
        MVI@    R4,     R1                      ; FCBD   02A1
        MVI     G_0350, R4                      ; FCBE   0284 0350
        INCR    R4                              ; FCC0   000C
        MVI@    R4,     R2                      ; FCC1   02A2
        MVI@    R4,     R3                      ; FCC2   02A3

        JSR     R5,     L_58A6                  ; FCC3   0004 0158 00A6

        MVII    #$018A, R1                      ; FCC6   02B9 018A
        ADD     G_0179, R1                      ; FCC8   02C1 0179
        MVI@    R1,     R1                      ; FCCA   0289
        ADDR    R7,     R1                      ; FCCB   00F9
        ADDI    #$010E, R1                      ; FCCC   02F9 010E
        CMP@    R1,     R0                      ; FCCE   0348
        BGT     L_FD19                          ; FCCF   020E 0048

        MOVR    R2,     R0                      ; FCD1   0090
        MOVR    R3,     R1                      ; FCD2   0099

        JSR     R5,     .EXEC.A2F               ; FCD3   0004 0118 022F

        MVO     R1,     G_0355                  ; FCD6   0241 0355
        MVII    #$018A, R1                      ; FCD8   02B9 018A
        ADD     G_0179, R1                      ; FCDA   02C1 0179
        MVI@    R1,     R1                      ; FCDC   0289
        ADDR    R7,     R1                      ; FCDD   00F9
        ADDI    #$00F6, R1                      ; FCDE   02F9 00F6
        MVI@    R1,     R0                      ; FCE0   0288

        JSR     R5,     X_RAND2                 ; FCE1   0004 0114 029E
        DECLE   $0080,  $020C,  $0032,  $0280   ; FCE4   0080 020C 0032 0280
        DECLE   $0171,  $0064,  $03B8,  $0003   ; FCE8   0171 0064 03B8 0003
        DECLE   $020C,  $0010,  $0281,  $0350   ; FCEC   020C 0010 0281 0350
        DECLE   $0004                           ; FCF0   0004

        ANDR    R5,     R4                      ; FCF1   01AC
        MVI@    R4,     R5                      ; FCF2   02A5
        CMPI    #$000A, R1                      ; FCF3   0379 000A
        BLT     L_FCFE                          ; FCF5   0205 0007

        MVII    #$00FD, R0                      ; FCF7   02B8 00FD

        JSR     R5,     L_6286                  ; FCF9   0004 0160 0286

        B       L_FD3F                          ; FCFC   0200 0041

L_FCFE:
        MVI     G_0171, R0                      ; FCFE   0280 0171
        DECLE   $03B8,  $0001,  $0240,  $0357   ; FD00   03B8 0001 0240 0357
        DECLE   $02BB,  $0002,  $0004,  $01AC   ; FD04   02BB 0002 0004 01AC
        DECLE   $0174,  $0204,  $0007,  $02BB   ; FD08   0174 0204 0007 02BB
        DECLE   $0001,  $0004                   ; FD0C   0001 0004

        ANDR    R5,     R4                      ; FD0E   01AC
        CMPR    R6,     R4                      ; FD0F   0174
        BNEQ    L_FD4E                          ; FD10   020C 003C

L_FD12:
        PULR    R2                              ; FD12   02B2
        MVI@    R2,     R1                      ; FD13   0291
        ANDI    #$0080, R1                      ; FD14   03B9 0080
        XORR    R1,     R0                      ; FD16   01C8
        MVO@    R0,     R2                      ; FD17   0250
        PULR    R7                              ; FD18   02B7

L_FD19:
        MVI     G_0350, R4                      ; FD19   0284 0350
        INCR    R4                              ; FD1B   000C
        MVI@    R4,     R1                      ; FD1C   02A1
        SUBI    #$0057, R1                      ; FD1D   0339 0057
        BPL     L_FD22                          ; FD1F   0203 0001

        NEGR    R1                              ; FD21   0021
L_FD22:
        MVII    #$0006, R2                      ; FD22   02BA 0006
        DECLE   $0379,  $0004,  $020E,  $0026   ; FD24   0379 0004 020E 0026
        DECLE   $0281,  $0350,  $0004           ; FD28   0281 0350 0004

        ANDR    R5,     R4                      ; FD2B   01AC
        MVI@    R4,     R5                      ; FD2C   02A5
        CMPI    #$000A, R1                      ; FD2D   0379 000A
        BLT     L_FD4E                          ; FD2F   0205 001D

        MVI     G_0171, R1                      ; FD31   0281 0171
        ANDI    #$0003, R1                      ; FD33   03B9 0003
        BNEQ    L_FD3F                          ; FD35   020C 0008

        MVII    #$0009, R0                      ; FD37   02B8 0009

        JSR     R5,     X_RAND2                 ; FD39   0004 0114 029E

        INCR    R0                              ; FD3C   0008
        B       L_FD12                          ; FD3D   0220 002C

L_FD3F:
        MVII    #$0003, R0                      ; FD3F   02B8 0003
        MOVR    R7,     R3                      ; FD41   00BB
        ADDI    #$0020, R3                      ; FD42   02FB 0020
        MVI     G_0356, R1                      ; FD44   0281 0356
        TSTR    R1                              ; FD46   0089
        BEQ     L_FD5B                          ; FD47   0204 0012

        MOVR    R7,     R3                      ; FD49   00BB
        ADDI    #$0021, R3                      ; FD4A   02FB 0021
        B       L_FD5B                          ; FD4C   0200 000D

L_FD4E:
        MVII    #$0006, R0                      ; FD4E   02B8 0006
        MOVR    R7,     R3                      ; FD50   00BB
        ADDI    #$0011, R3                      ; FD51   02FB 0011
        MVI     G_0356, R1                      ; FD53   0281 0356
        TSTR    R1                              ; FD55   0089
        BNEQ    L_FD5B                          ; FD56   020C 0003

        MOVR    R7,     R3                      ; FD58   00BB
        ADDI    #$0012, R3                      ; FD59   02FB 0012

L_FD5B:
        JSR     R5,     X_RAND2                 ; FD5B   0004 0114 029E

        ADDR    R0,     R3                      ; FD5E   00C3
        MVI@    R3,     R0                      ; FD5F   0298
        B       L_FD12                          ; FD60   0220 004F

        DECLE   $0003,  $0006,  $0009,  $0002   ; FD62   0003 0006 0009 0002
        DECLE   $0005,  $0008,  $0001,  $0004   ; FD66   0005 0008 0001 0004
        DECLE   $0007,  $0007,  $0004,  $0001   ; FD6A   0007 0007 0004 0001
        DECLE   $0008,  $0005                   ; FD6E   0008 0005

        EIS                                     ; FD70   0002
        INCR    R1                              ; FD71   0009
        CLRC                                    ; FD72   0006
        DIS                                     ; FD73   0003
        PSHR    R5                              ; FD74   0275
        MVI     G_0357, R0                      ; FD75   0280 0357
        TSTR    R0                              ; FD77   0080
        BEQ     L_FD7B                          ; FD78   0204 0001

        NEGR    R3                              ; FD7A   0023
L_FD7B:
        MVII    #$0002, R1                      ; FD7B   02B9 0002
L_FD7D:
        PSHR    R1                              ; FD7D   0271
        MVI     G_0355, R2                      ; FD7E   0282 0355
        ADDR    R3,     R2                      ; FD80   00DA
        ANDI    #$000F, R2                      ; FD81   03BA 000F
        CLRR    R0                              ; FD83   01C0
L_FD84:
        PSHR    R0                              ; FD84   0270
        SLL     R0,     1                       ; FD85   0048
        MVI     G_0350, R4                      ; FD86   0284 0350
        INCR    R4                              ; FD88   000C
        SDBD                                    ; FD89   0001
        MVII    #$6D0D, R5                      ; FD8A   02BD 000D 006D
        MVI     G_0356, R1                      ; FD8D   0281 0356
        TSTR    R1                              ; FD8F   0089
        BEQ     L_FD96                          ; FD90   0204 0004

        SDBD                                    ; FD92   0001
        MVII    #$6D1F, R5                      ; FD93   02BD 001F 006D
L_FD96:
        ADDR    R0,     R5                      ; FD96   00C5
        MVI@    R5,     R0                      ; FD97   02A8
        MVI@    R5,     R1                      ; FD98   02A9
        SUB@    R4,     R0                      ; FD99   0320
        SUB@    R4,     R1                      ; FD9A   0321

        JSR     R5,     .EXEC.A2F               ; FD9B   0004 0118 022F

        PULR    R0                              ; FD9E   02B0
        INCR    R0                              ; FD9F   0008
        CMPR    R1,     R2                      ; FDA0   014A
        BNEQ    L_FDC3                          ; FDA1   020C 0020

        MOVR    R7,     R4                      ; FDA3   00BC
        ADDI    #$0044, R4                      ; FDA4   02FC 0044
        MVI     G_0356, R5                      ; FDA6   0285 0356
        TSTR    R5                              ; FDA8   00AD
        BEQ     L_FDAE                          ; FDA9   0204 0003

        MOVR    R7,     R4                      ; FDAB   00BC
        ADDI    #$0040, R4                      ; FDAC   02FC 0040

L_FDAE:
        JSR     R5,     L_5946                  ; FDAE   0004 0158 0146

        BEQ     L_FDB6                          ; FDB1   0204 0003

L_FDB3:
        PULR    R1                              ; FDB3   02B1
        CMPR    R6,     R6                      ; FDB4   0176
        PULR    R7                              ; FDB5   02B7

L_FDB6:
        MVI     G_0350, R4                      ; FDB6   0284 0350
        INCR    R4                              ; FDB8   000C
        MVI@    R4,     R1                      ; FDB9   02A1
        SUBI    #$0057, R1                      ; FDBA   0339 0057
        BPL     L_FDBF                          ; FDBC   0203 0001

        NEGR    R1                              ; FDBE   0021
L_FDBF:
        CMPI    #$0004, R1                      ; FDBF   0379 0004
        BLT     L_FDB3                          ; FDC1   0225 000F

L_FDC3:
        CMPI    #$0009, R0                      ; FDC3   0378 0009
        BLT     L_FD84                          ; FDC5   0225 0042

        NEGR    R3                              ; FDC7   0023
        PULR    R1                              ; FDC8   02B1
        DECR    R1                              ; FDC9   0011
        BNEQ    L_FD7D                          ; FDCA   022C 004E

        CMPR    R6,     R7                      ; FDCC   0177
        PULR    R7                              ; FDCD   02B7

        DECLE   $0006,  $0005,  $0004,  $0003   ; FDCE   0006 0005 0004 0003
        DECLE   $0002,  $0001,  $0003,  $0003   ; FDD2   0002 0001 0003 0003
        DECLE   $0002,  $0002,  $0002,  $0001   ; FDD6   0002 0002 0002 0001

        INCR    R7                              ; FDDA   000F

        DECR    R1                              ; FDDB   0011
L_FDDC:
        DECR    R3                              ; FDDC   0013
        DECR    R5                              ; FDDD   0015
L_FDDE:
        DECR    R7                              ; FDDE   0017

        DECLE   $0019,  $0003,  $0006,  $0009   ; FDDF   0019 0003 0006 0009
        DECLE   $0005,  $0001,  $0004,  $0007   ; FDE3   0005 0001 0004 0007
        DECLE   $0005,  $0003,  $0003,  $0006   ; FDE7   0005 0003 0003 0006
        DECLE   $0009,  $0003,  $0001,  $0004   ; FDEB   0009 0003 0001 0004
        DECLE   $0007,  $0006,  $0009,  $0006   ; FDEF   0007 0006 0009 0006
        DECLE   $0009,  $0006,  $0009,  $0003   ; FDF3   0009 0006 0009 0003
        DECLE   $0009,  $0003,  $0009,  $0003   ; FDF7   0009 0003 0009 0003
        DECLE   $0009,  $0003,  $0006,  $0003   ; FDFB   0009 0003 0006 0003
        DECLE   $0006,  $0003,  $0006,  $0004   ; FDFF   0006 0003 0006 0004
        DECLE   $0007,  $0004,  $0007,  $0004   ; FE03   0007 0004 0007 0004
        DECLE   $0007,  $0001,  $0007,  $0001   ; FE07   0007 0001 0007 0001
        DECLE   $0007,  $0001,  $0007,  $0001   ; FE0B   0007 0001 0007 0001
        DECLE   $0004,  $0001,  $0004,  $0001   ; FE0F   0004 0001 0004 0001
        DECLE   $0004,  $0050,  $0051,  $0052   ; FE13   0004 0050 0051 0052
        DECLE   $0053,  $0054,  $0055,  $0064   ; FE17   0053 0054 0055 0064
        DECLE   $0078,  $008C,  $00A0,  $00B4   ; FE1B   0078 008C 00A0 00B4
        DECLE   $00C8,  $0006,  $001F,  $0020   ; FE1F   00C8 0006 001F 0020
        DECLE   $0021,  $0022,  $0027,  $0028   ; FE23   0021 0022 0027 0028
        DECLE   $0038,  $0037,  $0036,  $0035   ; FE27   0038 0037 0036 0035

        NOP                                     ; FE2B   0034
        GSWD    R3                              ; FE2C   0033
        GSWD    R2                              ; FE2D   0032
        GSWD    R1                              ; FE2E   0031
        GSWD    R0                              ; FE2F   0030
        ADCR    R7                              ; FE30   002F

        ADCR    R6                              ; FE31   002E
L_FE32:
        ADCR    R5                              ; FE32   002D
        ADCR    R4                              ; FE33   002C
        ADCR    R3                              ; FE34   002B
        ADCR    R2                              ; FE35   002A
        ADCR    R1                              ; FE36   0029
        ADCR    R0                              ; FE37   0028
        ADCR    R1                              ; FE38   0029
        ADCR    R2                              ; FE39   002A
        ADCR    R3                              ; FE3A   002B
        ADCR    R4                              ; FE3B   002C
        ADCR    R5                              ; FE3C   002D
        ADCR    R6                              ; FE3D   002E
        ADCR    R7                              ; FE3E   002F

        GSWD    R0                              ; FE3F   0030
L_FE40:
        GSWD    R1                              ; FE40   0031
        DECLE   $0032,  $0033,  $0034,  $0035   ; FE41   0032 0033 0034 0035
        DECLE   $0036,  $0037                   ; FE45   0036 0037

        RSWD    R0                              ; FE47   0038
        PSHR    R5                              ; FE48   0275
        PSHR    R3                              ; FE49   0273
        MVI     G_0352, R3                      ; FE4A   0283 0352
        ANDI    #$0003, R3                      ; FE4C   03BB 0003
        BEQ     L_FE5D                          ; FE4E   0204 000D

L_FE50:
        MVI     G_0179, R5                      ; FE50   0285 0179
        TSTR    R5                              ; FE52   00AD
        BEQ     L_FE56                          ; FE53   0204 0001

        SLR     R3,     1                       ; FE55   0063
L_FE56:
        ANDI    #$0001, R3                      ; FE56   03BB 0001
        BEQ     L_FE5D                          ; FE58   0204 0003

        PULR    R3                              ; FE5A   02B3
        CMPR    R6,     R6                      ; FE5B   0176
        PULR    R7                              ; FE5C   02B7

L_FE5D:
        PULR    R3                              ; FE5D   02B3
        CMPR    R6,     R7                      ; FE5E   0177
        PULR    R7                              ; FE5F   02B7

        PSHR    R5                              ; FE60   0275
        PSHR    R3                              ; FE61   0273
        MVI     G_0352, R3                      ; FE62   0283 0352
        ANDI    #$000C, R3                      ; FE64   03BB 000C
        BEQ     L_FE5D                          ; FE66   0224 000A

        SLR     R3,     2                       ; FE68   0067
        B       L_FE50                          ; FE69   0220 001A

        PSHR    R5                              ; FE6B   0275
        MVII    #$018E, R4                      ; FE6C   02BC 018E
        MVI     G_0350, R0                      ; FE6E   0280 0350
        CMPI    #$01BE, R0                      ; FE70   0378 01BE
        BGE     L_FE76                          ; FE72   020D 0002

        MVII    #$01BE, R4                      ; FE74   02BC 01BE
L_FE76:
        MVII    #$00FF, R0                      ; FE76   02B8 00FF
        MVO     R0,     G_0355                  ; FE78   0240 0355
        SWAP    R0,     2                       ; FE7A   0044
        MVO     R0,     G_0351                  ; FE7B   0240 0351
        CLRR    R3                              ; FE7D   01DB
        INCR    R4                              ; FE7E   000C
L_FE7F:
        MOVR    R4,     R5                      ; FE7F   00A5
        MVI@    R5,     R0                      ; FE80   02A8
        MVI@    R5,     R1                      ; FE81   02A9
        MVI     G_0350, R5                      ; FE82   0285 0350
        INCR    R5                              ; FE84   000D
        PSHR    R3                              ; FE85   0273
        MVI@    R5,     R2                      ; FE86   02AA
        MVI@    R5,     R3                      ; FE87   02AB

        JSR     R5,     L_58A6                  ; FE88   0004 0158 00A6

        PULR    R3                              ; FE8B   02B3
        CMP     G_0351, R0                      ; FE8C   0340 0351
        BC      L_FE94                          ; FE8E   0201 0004

        MVO     R3,     G_0355                  ; FE90   0243 0355
        MVO     R0,     G_0351                  ; FE92   0240 0351
L_FE94:
        ADDI    #$0008, R4                      ; FE94   02FC 0008
        INCR    R3                              ; FE96   000B
        CMPI    #$0006, R3                      ; FE97   037B 0006
        BLT     L_FE7F                          ; FE99   0225 001B

        MVI     G_0355, R0                      ; FE9B   0280 0355
        SLL     R0,     2                       ; FE9D   004C
        SLL     R0,     1                       ; FE9E   0048
        SUBI    #$0031, R4                      ; FE9F   033C 0031
        ADDR    R0,     R4                      ; FEA1   00C4
        MVI     G_0351, R5                      ; FEA2   0285 0351
        PULR    R7                              ; FEA4   02B7

        MVI@    R1,     R1                      ; FEA5   0289
        ANDI    #$0007, R1                      ; FEA6   03B9 0007
        DECR    R1                              ; FEA8   0011
        SLL     R1,     1                       ; FEA9   0049
        PSHR    R1                              ; FEAA   0271
        SLL     R1,     2                       ; FEAB   004D
        ADD@    R6,     R1                      ; FEAC   02F1
        ADDI    #$0107, R1                      ; FEAD   02F9 0107
        ADDI    #$0007, R1                      ; FEAF   02F9 0007
        MVI@    R1,     R1                      ; FEB1   0289
        MOVR    R5,     R7                      ; FEB2   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FECB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FECF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFB   0000 0000 0000 0000
        DECLE   $0000                           ; FFFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5011       <entry>
;;  $501A       $501D  
;;  $5029       $502B  
;;  $5069       $5070  
;;  $5072       $506B  
;;  $507D       $5061   $5065  
;;  $508E       $508A  
;;  $50AC       $505C   $5080   $5084  
;;  $50DD       $50CF   $50D4  
;;  $511C       $5BC2   $5D1A   $5D21   $6513   $6603   $6611   $6638   $6642  
;;  $511C       $6C01  
;;  $5124       $64A7   $64AF   $64C9  
;;  $512A       $50BF  
;;  $5136       $512E   $5132  
;;  $5157       $50B6  
;;  $5163       $53C2  
;;  $516D       $516A  
;;  $51BB       $51B5  
;;  $51C8       $51AF   $51C2  
;;  $51D3       $51CF  
;;  $51D9       $51D6  
;;  $51DF       $51DC  
;;  $51FA       $51F4  
;;  $51FE       $51FB  
;;  $5200       $51EB  
;;  $5210       $520A  
;;  $5214       $5211  
;;  $5216       $5197   $519F   $51A5   $51C6  
;;  $5222       $521F  
;;  $522B       $5227  
;;  $5233       $522F  
;;  $523A       $5236  
;;  $5241       $523D  
;;  $5248       $5244  
;;  $526E       $5256  
;;  $5275       $526C  
;;  $5282       $527A  
;;  $52A4       $525D  
;;  $52AB       $5268  
;;  $52AC       $5190   $51FE   $5214   $5249   $5280   $5286   $52A2  
;;  $52DB       $52CB  
;;  $52E5       $52C3  
;;  $52EC       $52E8  
;;  $52FC       $52F9  
;;  $531C       $530F   $5315  
;;  $5327       $5323  
;;  $5336       $5330  
;;  $533A       $5334  
;;  $5345       $5174  
;;  $5351       $5376  
;;  $5354       $534C   $534F  
;;  $5382       $537A  
;;  $5384       $5372   $5380  
;;  $5393       $535C   $538A  
;;  $5394       $535A  
;;  $53B4       $53AB   $53B0  
;;  $53DB       $52F6   $53AD  
;;  $53F0       $53E6   $53EC  
;;  $53F3       $5C4D   $5C56  
;;  $53F7       $53FC  
;;  $53FF       $5BCF   $5BEC   $64B3   $64CD   $64EB   $6533  
;;  $5412       $540C   $61D6  
;;  $5413       $5411  
;;  $541E       $5408   $541A   $5427  
;;  $542A       $5BD2   $5BEF   $64BA   $64D4   $64F2   $6521   $652B   $6541  
;;  $5437       $5433  
;;  $5441       $543D  
;;  $5447       $5BE4   $61B8   $61D9   $661E  
;;  $5448       $5C0B  
;;  $5454       $5450  
;;  $5460       $545D  
;;  $5464       $545A  
;;  $5468       $5465  
;;  $54B7       $54B3  
;;  $54CF       $5470  
;;  $54EA       $54E6  
;;  $54F8       $54D2  
;;  $550A       $5505  
;;  $550F       $5501  
;;  $5511       $54F6   $550D  
;;  $5525       $551F   $5534  
;;  $553F       $553A  
;;  $557A       $5578  
;;  $558C       $50BC   $F56B  
;;  $5597       $5590  
;;  $55A4       $559C  
;;  $55A5       $55A3  
;;  $55D2       $55C6   $55CA   $55CE  
;;  $55E5       $5593  
;;  $55F9       $55ED  
;;  $55FA       $55F8  
;;  $55FC       $561E  
;;  $5605       $55FF  
;;  $5616       $5603  
;;  $5621       $503F   $50A9   $560F   $F994  
;;  $5628       $5055   $F568  
;;  $5639       $5630   $5635  
;;  $564C       $5643   $5648  
;;  $564F       $558D  
;;  $565A       $5692  
;;  $565E       $5658  
;;  $566F       $5661   $5667  
;;  $5689       $5684  
;;  $5694       $566D  
;;  $5695       $5686   $5689   $569D  
;;  $5697       $56A0  
;;  $56A2       $56AA  
;;  $56A4       $56AD  
;;  $56B0       $54F8  
;;  $56B6       $56BB  
;;  $56BE       $56B9  
;;  $56D4       $56E0  
;;  $56F2       $56FF  
;;  $5707       $571E  
;;  $5720       $50D8   $5C43   $5D28   $DD7F  
;;  $5722       $5CC8  
;;  $5739       $5739  
;;  $5742       $D788   $F54A  
;;  $5743       $DD36  
;;  $5746       $574A  
;;  $574D       $5528   $552F  
;;  $574E       $56F2  
;;  $574F       $5760  
;;  $5766       $D7C5   $F63A  
;;  $5768       $5778  
;;  $579B       $5782   $5789   $5791   $5797  
;;  $57A4       $579E  
;;  $57A6       $57A2  
;;  $57AB       $6A0C   $6CCF  
;;  $57BB       $5AC7   $5B0D   $6719   $FBB8  
;;  $57D6       $57C2   $57C6   $57CA   $57CE  
;;  $57E3       $57E0  
;;  $57F2       $57B9  
;;  $5804       $57FC   $5800  
;;  $5835       $5832  
;;  $5840       $583D  
;;  $5846       $5842  
;;  $585D       $581B  
;;  $586C       $5869  
;;  $5872       $586E  
;;  $5885       $5885  
;;  $5886       $5886  
;;  $5894       $5894  
;;  $589C       $5898  
;;  $58A6       $57F7   $6A9C   $6CAF   $6E1B   $FA48   $FAF4   $FCC3   $FE88  
;;  $58AC       $58A9  
;;  $58B1       $58AE  
;;  $58B6       $58B2  
;;  $58B7       $58B5  
;;  $58D0       $58DA  
;;  $58E7       $58E5  
;;  $590A       $58EC  
;;  $5922       $5922  
;;  $593B       $54F2   $DA49   $F1FF   $F24D   $F268  
;;  $593C       $593A  
;;  $5944       $5251   $5258   $5B31   $5B6E   $5F93   $62D4   $62DB   $6A82  
;;  $5944       $6E39   $6F44   $F91D   $FA38   $FB7A  
;;  $5946       $FDAE  
;;  $5948       $594C  
;;  $594E       $5949   $5A58   $5A5B  
;;  $594F       $5714  
;;  $5952       $5960  
;;  $5964       $59F1   $5AED  
;;  $5965       $5968  
;;  $5971       $57D0  
;;  $597D       $66C6  
;;  $598C       $5985  
;;  $5994       $5980   $5A7F  
;;  $59A2       $599F  
;;  $59A6       $59A3  
;;  $59B8       $5AC2   $5B61  
;;  $59CE       $59C8  
;;  $59DF       $59BE  
;;  $59E1       $6772   $6781  
;;  $5A0D       $5A09  
;;  $5A16       $5A10  
;;  $5A22       $59E7   $59EE   $5AD7  
;;  $5A2C       $5AB4   $5B59  
;;  $5A34       $5A3A  
;;  $5A3F       $5A35  
;;  $5A43       $5A3D  
;;  $5A47       $676F   $677E  
;;  $5A7A       $5A4C  
;;  $5A7E       $5C81   $5CA0   $6510   $6627   $6667   $67D5  
;;  $5A7F       $5AE4  
;;  $5A8D       $5A89  
;;  $5A9A       $5A91   $5A96  
;;  $5AA2       $5A9F  
;;  $5AAD       $5AAB  
;;  $5AB9       $5B5C  
;;  $5ABB       $5AB2   $5AB7  
;;  $5ACB       $5B39   $6659  
;;  $5AE6       $5ADC  
;;  $5AFF       $5AD0  
;;  $5B03       $5AF9   $5AFC  
;;  $5B11       $6C1B  
;;  $5B16       $622F   $6C23   $6C28   $6E67   $6E8B  
;;  $5B20       $5B1D  
;;  $5B28       $5B14  
;;  $5B3C       $5B23   $5B37  
;;  $5B42       $5B42  
;;  $5B46       $624E   $66F9   $6E6D   $6E91  
;;  $5B4C       $5929  
;;  $5B4F       $5B4C  
;;  $5B64       $5B57  
;;  $5B7E       $5B74  
;;  $5B82       $5B82  
;;  $5B89       $6562  
;;  $5B97       $5B94  
;;  $5BA6       $5BA2  
;;  $5BB1       $5BAA   $5BAE  
;;  $5BB4       $5CE9   $64AB  
;;  $5BB5       $5BB3  
;;  $5BBD       $5BCD  
;;  $5BC9       $5BC0  
;;  $5BE4       $5BE0  
;;  $5BEC       $5BB9  
;;  $5C01       $5BFD  
;;  $5C0B       $5C07  
;;  $5C12       $6141  
;;  $5C64       $64C0   $64C5   $6538   $653D  
;;  $5C6D       $5C79   $5C87  
;;  $5C8A       $5C68   $5C96  
;;  $5C92       $5BE8   $5C0E   $64E2  
;;  $5C9A       $5C8C   $5C90  
;;  $5C9C       $5CA7  
;;  $5CAB       $6566  
;;  $5CB7       $5CB3  
;;  $5CDE       $5CD1   $5CD8  
;;  $5CED       $5CCD   $5CDC  
;;  $5D21       $5D0B  
;;  $5D28       $5CF6  
;;  $5D40       $5B99   $69B1  
;;  $5D41       $529D   $5CE2   $5CFC   $5D31   $6766   $699A   $6C7E  
;;  $5D56       $5D51  
;;  $5D5A       $5D63  
;;  $5D65       $5D5D  
;;  $5D71       $5D67  
;;  $5EE0       $56D6  
;;  $5EEA       $5EEF  
;;  $5EF1       $5EEC  
;;  $5EF3       $5EE8  
;;  $5F02       $5EFC  
;;  $5F06       $5F0E  
;;  $5F14       $50E6   $5D42  
;;  $5F25       $5F1F   $5F2A  
;;  $5F3B       $5F4C   $5F63   $5F79   $5F86   $5F98   $6000   $602B  
;;  $5F46       $FA5C   $FA77   $FACA   $FB08   $FB0F   $FB4D  
;;  $5F5E       $5F54   $5F5B  
;;  $5F6C       $5F68  
;;  $5F76       $5F71  
;;  $5F77       $5F75  
;;  $5F80       $5F49  
;;  $5FB3       $5FA1  
;;  $5FC6       $6020  
;;  $5FEE       $5FEB  
;;  $5FFA       $5FF7  
;;  $5FFF       $5FCA   $5FFB  
;;  $600E       $5FC4  
;;  $6022       $6017  
;;  $602A       $6026  
;;  $602D       $6004   $6008  
;;  $6060       $604D   $6051   $6139   $613F   $615E   $619A   $620E   $6213  
;;  $6061       $60A5  
;;  $60A7       $6129  
;;  $60B6       $60B2  
;;  $60DC       $6466  
;;  $60DE       $60D9  
;;  $6144       $F9B0   $FA01  
;;  $6159       $614F   $6156  
;;  $6167       $6163  
;;  $6175       $616F  
;;  $617E       $6179  
;;  $617F       $617D  
;;  $6182       $6147  
;;  $619C       $6191  
;;  $61D6       $61D2  
;;  $61DE       $61B6   $61C3  
;;  $61F3       $6204  
;;  $61F6       $6200  
;;  $6206       $6187  
;;  $620A       $616C  
;;  $6218       $6221  
;;  $621E       $621B  
;;  $6228       $6225  
;;  $622D       $622A  
;;  $6241       $623A  
;;  $6246       $6242  
;;  $624B       $623F   $6248  
;;  $6253       $5FC1   $6210   $F99F  
;;  $626A       $625A   $6262  
;;  $627B       $628C   $6290   $62A7   $62E0  
;;  $6286       $FA70   $FACF   $FB52   $FCF9  
;;  $62A2       $6298   $629F  
;;  $62B0       $62AC  
;;  $62BA       $62B5  
;;  $62BB       $62B9  
;;  $62C0       $6289  
;;  $62C9       $62C6  
;;  $6334       $6328   $632E  
;;  $6337       $62E6   $62EA   $62EF  
;;  $6356       $6335   $6352   $6369   $636D  
;;  $6363       $62D9  
;;  $6372       $6372  
;;  $6378       $5298   $5C5F   $5CE5   $5CFF   $5D34   $609B   $60A7   $60E7  
;;  $6378       $64A3   $655E   $6738   $6769   $D7EA   $DA35   $F5D4  
;;  $6379       $6132   $6A19   $6BB8   $6C71  
;;  $637A       $6123  
;;  $644D       $644D  
;;  $645E       $645E  
;;  $64E2       $64DE  
;;  $64E6       $661B  
;;  $6500       $64FC  
;;  $6519       $6505  
;;  $651A       $5C59  
;;  $652B       $651F  
;;  $6533       $6529   $6549  
;;  $6566       $655C  
;;  $65BC       $5351  
;;  $65CE       $65C9  
;;  $667D       $6654   $6657   $6660  
;;  $667F       $667B   $668C  
;;  $66A3       $669A  
;;  $66B7       $66B4  
;;  $66C6       $66BD  
;;  $66CA       $66C4  
;;  $66DE       $66E8  
;;  $66EF       $66D9  
;;  $66F9       $66F5  
;;  $6721       $66FF  
;;  $675B       $6752  
;;  $6766       $6762  
;;  $676D       $674E   $6759  
;;  $676E       $5AFF   $6649  
;;  $677D       $6600   $660A   $660E   $6618   $662B   $663F  
;;  $6796       $6791  
;;  $6798       $67A6  
;;  $679A       $67A2  
;;  $679F       $67CF  
;;  $67B1       $67BA  
;;  $67B6       $67B3  
;;  $67C0       $67AC  
;;  $67C6       $679D  
;;  $67D1       $67CA  
;;  $67D8       $67BD   $67C3  
;;  $67DA       $5C7E   $5C9D   $650D   $67D2  
;;  $67E2       $52A8   $5A25   $5AE1   $5B07   $5B78   $602D   $61F3   $6358  
;;  $67E2       $6624   $6664   $667F   $66D2   $671E   $67DE   $6B2E   $6B6A  
;;  $67E2       $FB8A  
;;  $67EE       $5BD6   $5BF3   $64B6   $64D0   $64EE   $6525   $652F   $6545  
;;  $67F4       $5261   $5272  
;;  $67F8       $5A28   $5A7A   $5B7B   $664D   $666B   $6B31  
;;  $67FA       $67F6  
;;  $6813       $6800  
;;  $681C       $681C  
;;  $6827       $6827  
;;  $6885       $50B9  
;;  $68A7       $68A2  
;;  $68C7       $68C4  
;;  $68CC       $688E   $6893   $689A  
;;  $68E9       $68DC  
;;  $68F4       $68F1  
;;  $6921       $690A  
;;  $6946       $6942  
;;  $6969       $6966  
;;  $6976       $6956  
;;  $6999       $6995  
;;  $699E       $6982   $6987  
;;  $69B5       $69A7  
;;  $69C3       $69A0  
;;  $69DF       $69C5  
;;  $69EA       $69E4  
;;  $69FD       $69F7  
;;  $6A05       $69DD  
;;  $6A18       $6A13  
;;  $6A19       $69C1  
;;  $6A1C       $6925   $694C   $6974   $69E8   $6A4D  
;;  $6A35       $6A32  
;;  $6A47       $692F   $6935   $693B  
;;  $6A4F       $6A45  
;;  $6A71       $6A6D  
;;  $6A74       $6BD9  
;;  $6AB1       $6AA3  
;;  $6ACA       $6ABF  
;;  $6AFF       $6AFB  
;;  $6B03       $6B03  
;;  $6B04       $6B04  
;;  $6B05       $6B05  
;;  $6B06       $6B06  
;;  $6B19       $6B14  
;;  $6B26       $6B1E  
;;  $6B2E       $6B24   $6B2A  
;;  $6B4D       $6B4A  
;;  $6B53       $6B50  
;;  $6B58       $6B54  
;;  $6B60       $6B5A  
;;  $6B68       $6B63  
;;  $6B7D       $6B76  
;;  $6B89       $6B86  
;;  $6B97       $6B34   $6B6D   $6B8C   $6B95  
;;  $6BA4       $6B9D  
;;  $6BB6       $6BB0  
;;  $6BB8       $6BB4  
;;  $6BCF       $6BC4  
;;  $6BD0       $6A7D   $6A87   $6AAF   $6ACB   $6AD7   $6ADA  
;;  $6BDB       $6A54   $6A59   $6A60  
;;  $6BE5       $6BE5  
;;  $6BF1       $690C   $6A47  
;;  $6C11       $6C1F  
;;  $6C21       $6C0B  
;;  $6C2B       $6C13  
;;  $6C4E       $6C4B  
;;  $6C5E       $6C57  
;;  $6C65       $6C5A  
;;  $6C68       $6C5C   $6C63  
;;  $6C69       $6C67  
;;  $6C81       $6BF6   $6C36   $6C78  
;;  $6C82       $6BA4  
;;  $6C8E       $6C8A  
;;  $6C99       $6CBA  
;;  $6CBC       $6CB4  
;;  $6CC8       $6CA1  
;;  $6CCF       $6CC6  
;;  $6D05       $6D03  
;;  $6D31       $6AE9   $6BC6   $6D68  
;;  $6D42       $6D39   $6D3E  
;;  $6D44       $6AE1  
;;  $6D4B       $61E7   $6DA7  
;;  $6D56       $61A7  
;;  $6D5A       $61F7   $6206   $6D7D  
;;  $6D60       $6171   $6B78   $6DB5   $FC0E   $FC7B  
;;  $6D64       $6D62  
;;  $6D68       $6D5E  
;;  $6D77       $6B16   $6B6F   $6B92  
;;  $6D81       $61AA   $6ADC  
;;  $6DA0       $6D9C  
;;  $6DAC       $6DA5  
;;  $6DB9       $6DB3  
;;  $6DBF       $6DC8  
;;  $6DCC       $5C5C   $654B   $6A4A  
;;  $6DE7       $6E5F   $6E83   $FB1B  
;;  $6DF2       $6DEE  
;;  $6DFA       $6DF7  
;;  $6DFF       $6DFC  
;;  $6E0A       $6E4B  
;;  $6E34       $6E2D  
;;  $6E42       $6E27   $6E32  
;;  $6E46       $6E0B   $6E13   $6E22   $6E40  
;;  $6E51       $6A15   $6BBE  
;;  $6E78       $6E5B   $6E73  
;;  $6E9C       $6E7F   $6E97  
;;  $6EA0       $6E75   $6E99  
;;  $6EAD       $6EA4  
;;  $6EAE       $5290   $698E   $69AE   $6C6B  
;;  $6EB9       $6C99  
;;  $6ECA       $62EC   $FA06  
;;  $6ED5       $6ED2  
;;  $6EDE       $6189   $634F  
;;  $6EEF       $6C54   $FA0B  
;;  $6F04       $6EFD  
;;  $6F0B       $6F02  
;;  $6F0D       $6EF2   $6EF6   $6F00   $6F09  
;;  $6F25       $6F25  
;;  $6F26       $6F26  
;;  $6F27       $6F27  
;;  $6F3F       $6F3D  
;;  $6F40       $6F3E  
;;  $6F41       $5158   $6886   $6F3F   $F87C  
;;  $6F42       $6F40  
;;  $6F4C       $6F49  
;;  $D1C8       $D1C6  
;;  $D1C9       $D1C7  
;;  $D1F5       $D1F3  
;;  $D512       $D510  
;;  $D78C       $DA64  
;;  $D7FC       $D805  
;;  $D7FE       $D7F4   $D801  
;;  $D7FF       $D7F8  
;;  $D815       $D83A  
;;  $D817       $D835  
;;  $D837       $D829  
;;  $DA0A       $DA08  
;;  $DA1F       $DA1D  
;;  $DA26       $DA24  
;;  $DA55       $DA59  
;;  $DA7D       $DA75  
;;  $DA81       $DA7B  
;;  $DA84       $DA6F   $DA79   $DA7F  
;;  $DA95       $DA98  
;;  $DAB8       $DAC0  
;;  $DABA       $DABD  
;;  $DAC5       $DAC7  
;;  $DADE       $DAD8   $DAE7  
;;  $DAE9       $DAD0  
;;  $DAED       $DACE   $DAE1  
;;  $DAEF       $DA9F   $DAAC  
;;  $DD45       $DD40  
;;  $DD47       $DD4C  
;;  $DD50       $DD4E  
;;  $DD5D       $DD58  
;;  $DD68       $DD64  
;;  $F204       $F202  
;;  $F223       $F228  
;;  $F252       $F250  
;;  $F28B       $F295  
;;  $F2B7       $F2AA  
;;  $F2BF       $F2B5   $F2BA  
;;  $F2C4       $F2C2  
;;  $F2D2       $F2D8  
;;  $F42F       $F22A  
;;  $F55C       $F574  
;;  $F581       $F586   $F58A   $F60A   $F60E   $F616   $F658  
;;  $F5A1       $F624  
;;  $F5B9       $F5C2  
;;  $F5C4       $F626  
;;  $F5D8       $F598  
;;  $F5E5       $F5F1  
;;  $F5F3       $F5E7   $F604  
;;  $F5F8       $F602  
;;  $F606       $F5F5  
;;  $F628       $F5A8   $F612  
;;  $F62D       $F596  
;;  $F63F       $F651  
;;  $F640       $F64E  
;;  $F641       $F64A  
;;  $F64C       $F644  
;;  $F656       $F665   $F671  
;;  $F667       $F660  
;;  $F78B       $F789  
;;  $F7CC       $F7CA  
;;  $F8A1       $F8F6  
;;  $F8B8       $F8B2  
;;  $F8C6       $F8B6  
;;  $F8F8       $F89D   $F919   $F922  
;;  $F912       $F8FE   $F902   $F906  
;;  $F989       $F987  
;;  $F9B5       $F9A8  
;;  $F9D7       $F9D2  
;;  $F9EE       $F9F6  
;;  $F9FC       $F9EC   $F9F0   $F9F8  
;;  $FA06       $F9A2  
;;  $FA1A       $FA0E  
;;  $FA22       $FA1F  
;;  $FA33       $FA29  
;;  $FA75       $FA4D  
;;  $FA7A       $FA62   $FA6C  
;;  $FAAF       $FAA1  
;;  $FABB       $FAAD   $FAB1  
;;  $FAC4       $FAC1  
;;  $FACD       $FAC6  
;;  $FAD4       $FA09  
;;  $FAEB       $FAE6  
;;  $FB0D       $FAF9  
;;  $FB12       $FB0B  
;;  $FB1B       $FB17  
;;  $FB3E       $FB3A  
;;  $FB47       $FB44  
;;  $FB50       $FB49  
;;  $FB55       $FB32   $FB3C  
;;  $FB6D       $FB69  
;;  $FB9A       $FB96  
;;  $FBA0       $FB9C  
;;  $FBAF       $FBAA  
;;  $FBBD       $F9B3   $F9B8   $F9C2   $F9C6  
;;  $FBC1       $F99B   $FA04   $FA18   $FA31   $FA3D   $FA73   $FA88   $FA8E  
;;  $FBC1       $FA93   $FA9D   $FAA5   $FAAB   $FAB9   $FAD2   $FB59   $FB74  
;;  $FBC1       $FB7F   $FBBB  
;;  $FBCB       $FBBF  
;;  $FBD0       $F976   $F980   $F98F   $F992   $FBD5  
;;  $FBEB       $FBE1  
;;  $FBEF       $FBFB  
;;  $FC1D       $FC18  
;;  $FC25       $FC0C  
;;  $FC31       $FC2C  
;;  $FC38       $FBE5  
;;  $FC68       $FC65  
;;  $FC7B       $FC6A  
;;  $FC80       $FC5D   $FC79  
;;  $FC86       $FC83  
;;  $FC93       $FC8E  
;;  $FC99       $FC23   $FC36  
;;  $FC9F       $FBE9   $FC7E  
;;  $FCFE       $FCF5  
;;  $FD12       $FD3D   $FD60  
;;  $FD19       $FCB9   $FCCF  
;;  $FD22       $FD1F  
;;  $FD3F       $FCFC   $FD35  
;;  $FD4E       $FD10   $FD2F  
;;  $FD5B       $FD47   $FD4C   $FD56  
;;  $FD7B       $FD78  
;;  $FD7D       $FDCA  
;;  $FD84       $FDC5  
;;  $FD96       $FD90  
;;  $FDAE       $FDA9  
;;  $FDB3       $FDC1  
;;  $FDB6       $FDB1  
;;  $FDBF       $FDBC  
;;  $FDC3       $FDA1  
;;  $FDDC       $FDDA  
;;  $FDDE       $FDDE  
;;  $FE32       $FE30  
;;  $FE40       $FE3E  
;;  $FE50       $FE69  
;;  $FE56       $FE53  
;;  $FE5D       $FE4E   $FE58   $FE66  
;;  $FE76       $FE72  
;;  $FE7F       $FE99  
;;  $FE94       $FE8E  
;; ======================================================================== ;;
