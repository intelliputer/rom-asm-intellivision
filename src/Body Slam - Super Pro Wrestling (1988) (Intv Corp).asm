
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $99F0           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500E           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
.TITLE:
        DECLE   $0058           ; 500E  Cartridge year
        STRING  "W"             ; 500F  Title string
.TITLECODE:
        EIS                     ; 5011  Color Stack init (2, 3)
        DECLE   $0154           ; 5013  Border color init


        BNOV    L_5019                          ; 5014   020A 0003

        MVII    #$02F1, R6                      ; 5016   02BE 02F1
        CLRR    R0                              ; 5018   01C0
L_5019:
        CLRR    R5                              ; 5019   01ED
L_501A:
        MVO@    R0,     R5                      ; 501A   0268
        CMPI    #$035D, R5                      ; 501B   037D 035D
        BNEQ    L_501A                          ; 501D   022C 0004

        MVII    #$0012, R0                      ; 501F   02B8 0012
        MVII    #$00FF, R1                      ; 5021   02B9 00FF
        MVII    #$010B, R4                      ; 5023   02BC 010B

        JSR     R5,     X_FILL_MEM              ; 5025   0004 0114 0341

        MVII    #$003F, R0                      ; 5028   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 502A   0240 01F8
        SDBD                                    ; 502C   0001
        MVII    #$9ED3, R0                      ; 502D   02B8 00D3 009E
        MVO     R0,     G_0337                  ; 5030   0240 0337

        JSR     R5,     L_6048                  ; 5032   0004 0160 0048

        SDBD                                    ; 5035   0001
        MVII    #$5014, R0                      ; 5036   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 5039   0240 02F0
        SDBD                                    ; 503B   0001
        MVII    #$5CF8, R0                      ; 503C   02B8 00F8 005C
        MVO     R0,     .ISRVEC.0               ; 503F   0240 0100
        SWAP    R0,     1                       ; 5041   0040
        MVO     R0,     .ISRVEC.1               ; 5042   0240 0101

        JSR     R5,     L_5643                  ; 5044   0004 0154 0243

L_5047:
        EIS                                     ; 5047   0002
        MVI     G_0102, R0                      ; 5048   0280 0102
        DECR    R0                              ; 504A   0010
        BPL     L_5047                          ; 504B   0223 0005

        MVII    #$0002, R0                      ; 504D   02B8 0002
        MVO     R0,     G_0102                  ; 504F   0240 0102
        MVI     G_0138, R0                      ; 5051   0280 0138
        CMPI    #$000C, R0                      ; 5053   0378 000C
        BEQ     L_505A                          ; 5055   0204 0003

        TSTR    R0                              ; 5057   0080
        BNEQ    L_5064                          ; 5058   020C 000A

L_505A:
        MVI     G_0348, R0                      ; 505A   0280 0348
        DECR    R0                              ; 505C   0010
        MVO     R0,     G_0348                  ; 505D   0240 0348
        BNEQ    L_5064                          ; 505F   020C 0003

        JSR     R5,     L_6489                  ; 5061   0004 0164 0089
L_5064:
        JSR     R5,     L_524C                  ; 5064   0004 0150 024C
        JSR     R5,     L_54BA                  ; 5067   0004 0154 00BA

        MVI     .PSG0.lft_hand,R0               ; 506A   0280 01FF
        CMP     G_0119, R0                      ; 506C   0340 0119
        MVO     R0,     G_0119                  ; 506E   0240 0119
        BNEQ    L_5074                          ; 5070   020C 0002

        MVO     R0,     G_010E                  ; 5072   0240 010E
L_5074:
        MVI     .PSG0.rgt_hand,R0               ; 5074   0280 01FE
        CMP     G_011A, R0                      ; 5076   0340 011A
        MVO     R0,     G_011A                  ; 5078   0240 011A
        BNEQ    L_507E                          ; 507A   020C 0002

        MVO     R0,     G_0112                  ; 507C   0240 0112
L_507E:
        MVI     G_0135, R0                      ; 507E   0280 0135
        DECR    R0                              ; 5080   0010
        MVO     R0,     G_0135                  ; 5081   0240 0135

        JSR     R5,     L_6B1A                  ; 5083   0004 0168 031A
        JSR     R5,     L_5F7B                  ; 5086   0004 015C 037B
        DECLE   $0280,  $0138,  $0378,  $0008   ; 5089   0280 0138 0378 0008
        DECLE   $020C,  $0084,  $0280,  $0172   ; 508D   020C 0084 0280 0172
        DECLE   $0080,  $0204,  $0008,  $02BA   ; 5091   0080 0204 0008 02BA
        DECLE   $015D,  $01C0,  $02B9,  $0121   ; 5095   015D 01C0 02B9 0121
        DECLE   $0004,  $01A8,  $0158,  $0280   ; 5099   0004 01A8 0158 0280
        DECLE   $0195,  $0080,  $0204,  $0009   ; 509D   0195 0080 0204 0009
        DECLE   $02BA,  $0180,  $02B8,  $0001   ; 50A1   02BA 0180 02B8 0001
        DECLE   $02B9,  $012A,  $0004           ; 50A5   02B9 012A 0004

        ANDR    R5,     R0                      ; 50A8   01A8
        CMPR    R3,     R0                      ; 50A9   0158
        MVII    #$015D, R2                      ; 50AA   02BA 015D
L_50AC:
        MVI@    R2,     R0                      ; 50AC   0290
        ANDI    #$0008, R0                      ; 50AD   03B8 0008
        BEQ     L_510D                          ; 50AF   0204 005C

        MOVR    R2,     R5                      ; 50B1   0095
        ADDI    #$0006, R5                      ; 50B2   02FD 0006
        SDBD                                    ; 50B4   0001
        MVI@    R5,     R0                      ; 50B5   02A8
        ADDI    #$0004, R5                      ; 50B6   02FD 0004
        SDBD                                    ; 50B8   0001
        MVI@    R5,     R1                      ; 50B9   02A9
        TSTR    R1                              ; 50BA   0089
        BPL     L_50C1                          ; 50BB   0203 0004

        MVII    #$0001, R3                      ; 50BD   02BB 0001
        MVO     R3,     G_015C                  ; 50BF   0243 015C
L_50C1:
        ADDR    R1,     R0                      ; 50C1   00C8
        SUBI    #$0023, R1                      ; 50C2   0339 0023
        TSTR    R0                              ; 50C4   0080
        BPL     L_5102                          ; 50C5   0203 003B

        MVI@    R2,     R0                      ; 50C7   0290
        ANDI    #$0010, R0                      ; 50C8   03B8 0010
        BEQ     L_50DC                          ; 50CA   0204 0010

        MVII    #$0349, R5                      ; 50CC   02BD 0349
        CMPI    #$015D, R2                      ; 50CE   037A 015D
        BEQ     L_50D4                          ; 50D0   0204 0002

        ADDI    #$0002, R5                      ; 50D2   02FD 0002
L_50D4:
        MVI@    R5,     R0                      ; 50D4   02A8
        MVI@    R5,     R1                      ; 50D5   02A9
        MOVR    R2,     R4                      ; 50D6   0094
        ADDI    #$0002, R4                      ; 50D7   02FC 0002

        JSR     R5,     L_61EE                  ; 50D9   0004 0160 01EE

L_50DC:
        MVI@    R2,     R0                      ; 50DC   0290
        DECLE   $03B8,  $00E7,  $0250,  $0093   ; 50DD   03B8 00E7 0250 0093
        DECLE   $02FB,  $001A,  $0298,  $0080   ; 50E1   02FB 001A 0298 0080
        DECLE   $0204,  $0011,  $0378,  $0003   ; 50E5   0204 0011 0378 0003
        DECLE   $020C,  $0008,  $0270,  $0093   ; 50E9   020C 0008 0270 0093
        DECLE   $02B9,  $0043,  $0004           ; 50ED   02B9 0043 0004

        ANDR    R5,     R4                      ; 50F0   01AC
        MVO@    R4,     R3                      ; 50F1   025C
        PULR    R0                              ; 50F2   02B0

        JSR     R5,     L_60D4                  ; 50F3   0004 0160 00D4

        B       L_5100                          ; 50F6   0200 0008

        SUBI    #$000C, R3                      ; 50F8   033B 000C
        MVI@    R3,     R0                      ; 50FA   0298
        DECR    R0                              ; 50FB   0010
        BPL     L_5100                          ; 50FC   0203 0002

        NEGR    R0                              ; 50FE   0020
        MVO@    R0,     R3                      ; 50FF   0258
L_5100:
        CLRR    R0                              ; 5100   01C0
        CLRR    R1                              ; 5101   01C9
L_5102:
        MOVR    R2,     R4                      ; 5102   0094
        ADDI    #$0006, R4                      ; 5103   02FC 0006
        MVO@    R0,     R4                      ; 5105   0260
        SWAP    R0,     1                       ; 5106   0040
        MVO@    R0,     R4                      ; 5107   0260
        ADDI    #$0004, R4                      ; 5108   02FC 0004
        MVO@    R1,     R4                      ; 510A   0261
        SWAP    R1,     1                       ; 510B   0041
        MVO@    R1,     R4                      ; 510C   0261
L_510D:
        ADDI    #$0023, R2                      ; 510D   02FA 0023
        CMPI    #$0180, R2                      ; 510F   037A 0180
        BLE     L_50AC                          ; 5111   0226 0066

        MVI     G_0142, R0                      ; 5113   0280 0142
        DECR    R0                              ; 5115   0010
        BMI     L_511A                          ; 5116   020B 0002

        MVO     R0,     G_0142                  ; 5118   0240 0142
L_511A:
        MVII    #$0001, R0                      ; 511A   02B8 0001
        MVO     R0,     G_0133                  ; 511C   0240 0133

        JSR     R5,     L_525A                  ; 511E   0004 0150 025A

        MVI     G_0138, R0                      ; 5121   0280 0138
        CMPI    #$0008, R0                      ; 5123   0378 0008
        BNEQ    L_5175                          ; 5125   020C 004E

        MVI     G_0103, R2                      ; 5127   0282 0103
        ANDI    #$00FE, R2                      ; 5129   03BA 00FE
        MVII    #$0057, R0                      ; 512B   02B8 0057
        MVII    #$0007, R1                      ; 512D   02B9 0007
        CMP     G_0173, R1                      ; 512F   0341 0173
        BLT     L_513F                          ; 5131   0205 000C

        CMP     G_0196, R1                      ; 5133   0341 0196
        BLT     L_513F                          ; 5135   0205 0008

        CMP     G_0345, R0                      ; 5137   0340 0345
        BNEQ    L_515A                          ; 5139   020C 001F

L_513B:
        MVO     R2,     G_0103                  ; 513B   0242 0103
        B       L_5175                          ; 513D   0200 0036

L_513F:
        MVII    #$015F, R5                      ; 513F   02BD 015F
        DECLE   $0001,  $02A8,  $02BD,  $0182   ; 5141   0001 02A8 02BD 0182
        DECLE   $0001,  $02A9,  $0148,  $0205   ; 5145   0001 02A9 0148 0205
        DECLE   $0001,  $0088,  $0004           ; 5149   0001 0088 0004

        ANDR    R5,     R0                      ; 514C   01A8
        SAR     R3,     1                       ; 514D   006B
        SUBI    #$0010, R0                      ; 514E   0338 0010
        BPL     L_5156                          ; 5150   0203 0004

        CLRR    R0                              ; 5152   01C0
        DECR    R0                              ; 5153   0010
        B       L_515A                          ; 5154   0200 0004

L_5156:
        ANDI    #$03FE, R0                      ; 5156   03B8 03FE
        XORI    #$0001, R0                      ; 5158   03F8 0001
L_515A:
        MVII    #$0002, R3                      ; 515A   02BB 0002
        CMP     G_0345, R0                      ; 515C   0340 0345
        BEQ     L_5171                          ; 515E   0204 0011
        BGT     L_5163                          ; 5160   020E 0001

        NEGR    R3                              ; 5162   0023
L_5163:
        ADD     G_0345, R3                      ; 5163   02C3 0345
        CMPI    #$00A7, R3                      ; 5165   037B 00A7
        BGT     L_5171                          ; 5167   020E 0008

        MVO     R3,     G_0345                  ; 5169   0243 0345

        JSR     R5,     L_587F                  ; 516B   0004 0158 007F
        DECLE   $0004                           ; 516E   0004

        ANDR    R5,     R0                      ; 516F   01A8
        SLLC    R2,     1                       ; 5170   005A
L_5171:
        XORI    #$0001, R2                      ; 5171   03FA 0001
        B       L_513B                          ; 5173   0220 0039

L_5175:
        JSR     R5,     L_62C6                  ; 5175   0004 0160 02C6

        CLRR    R0                              ; 5178   01C0
        MVO     R0,     G_0133                  ; 5179   0240 0133
        MVI     G_0138, R0                      ; 517B   0280 0138
        CMPI    #$0008, R0                      ; 517D   0378 0008
        BNEQ    L_5233                          ; 517F   020C 00B2

        MVII    #$0002, R0                      ; 5181   02B8 0002
        MVII    #$015D, R2                      ; 5183   02BA 015D
        MVI     G_0135, R1                      ; 5185   0281 0135
        ANDI    #$0001, R1                      ; 5187   03B9 0001
        BEQ     L_518D                          ; 5189   0204 0002

        MVII    #$0180, R2                      ; 518B   02BA 0180
L_518D:
        MVO     R0,     G_0339                  ; 518D   0240 0339
        MOVR    R2,     R1                      ; 518F   0091
        ADDI    #$0017, R1                      ; 5190   02F9 0017
        MVI@    R1,     R0                      ; 5192   0288
        DECR    R0                              ; 5193   0010
        BMI     L_5224                          ; 5194   020B 008E

        JSR     R5,     L_60C2                  ; 5196   0004 0160 00C2

        MVI@    R3,     R1                      ; 5199   0299
        ANDI    #$0010, R1                      ; 519A   03B9 0010
        BNEQ    L_5224                          ; 519C   020C 0086

        MOVR    R3,     R4                      ; 519E   009C
        ADDI    #$0002, R4                      ; 519F   02FC 0002
        MOVR    R7,     R1                      ; 51A1   00B9
        ADDI    #$0221, R1                      ; 51A2   02F9 0221
        PSHR    R0                              ; 51A4   0270
        SLL     R0,     1                       ; 51A5   0048
        ADD@    R6,     R0                      ; 51A6   02F0
        ADDR    R0,     R1                      ; 51A7   00C1

        JSR     R5,     L_614D                  ; 51A8   0004 0160 014D

        BNEQ    L_5224                          ; 51AB   020C 0077

        MOVR    R3,     R1                      ; 51AD   0099
        ADDI    #$0014, R1                      ; 51AE   02F9 0014
        MVI@    R1,     R1                      ; 51B0   0289
        CMPI    #$0008, R1                      ; 51B1   0379 0008
        BEQ     L_5233                          ; 51B3   0204 007E

        CMPI    #$0020, R1                      ; 51B5   0379 0020
        BEQ     L_5233                          ; 51B7   0204 007A

        MOVR    R2,     R4                      ; 51B9   0094
        ADDI    #$0014, R4                      ; 51BA   02FC 0014
        MVI@    R4,     R0                      ; 51BC   02A0
        MVO     R0,     G_01A9                  ; 51BD   0240 01A9

        JSR     R5,     L_617A                  ; 51BF   0004 0160 017A
        BIDECLE $53CF                           ; 51C2   00CF 0053

        BNEQ    L_51CE                          ; 51C4   020C 0008

        MOVR    R1,     R0                      ; 51C6   0088

        JSR     R5,     L_617A                  ; 51C7   0004 0160 017A
        BIDECLE $53D9                           ; 51CA   00D9 0053

        BEQ     L_5224                          ; 51CC   0204 0056

L_51CE:
        MVI     G_01A9, R0                      ; 51CE   0280 01A9
        CMPI    #$001C, R0                      ; 51D0   0378 001C
        BEQ     L_51F3                          ; 51D2   0204 001F

        JSR     R5,     L_617A                  ; 51D4   0004 0160 017A
        BIDECLE $53D5                           ; 51D7   00D5 0053

        BNEQ    L_51EA                          ; 51D9   020C 000F

        MOVR    R1,     R0                      ; 51DB   0088

        JSR     R5,     L_617A                  ; 51DC   0004 0160 017A
        BIDECLE $53D9                           ; 51DF   00D9 0053

        BNEQ    L_51EA                          ; 51E1   020C 0007

        MVII    #$002B, R0                      ; 51E3   02B8 002B

L_51E5:
        JSR     R5,     L_60D4                  ; 51E5   0004 0160 00D4

        B       L_5233                          ; 51E8   0200 0049

L_51EA:
        MVI     G_01A9, R1                      ; 51EA   0281 01A9
        DECLE   $0379,  $0007,  $0204,  $0003   ; 51EC   0379 0007 0204 0003
        DECLE   $0004                           ; 51F0   0004

        ANDR    R5,     R4                      ; 51F1   01AC
        MVO@    R4,     R3                      ; 51F2   025C
L_51F3:
        MOVR    R3,     R1                      ; 51F3   0099
        ADDI    #$0014, R1                      ; 51F4   02F9 0014
        MVI@    R1,     R0                      ; 51F6   0288
        MOVR    R2,     R4                      ; 51F7   0094
        ADDI    #$0018, R4                      ; 51F8   02FC 0018
        MVI@    R4,     R1                      ; 51FA   02A1
        MVI@    R4,     R5                      ; 51FB   02A5
        MVO     R5,     G_01A9                  ; 51FC   0245 01A9
        CMPI    #$0009, R1                      ; 51FE   0379 0009
        BNEQ    L_5209                          ; 5200   020C 0007

        JSR     R5,     L_617A                  ; 5202   0004 0160 017A
        BIDECLE $53E1                           ; 5205   00E1 0053

        BNEQ    L_5233                          ; 5207   020C 002A

L_5209:
        MOVR    R1,     R0                      ; 5209   0088
        PSHR    R2                              ; 520A   0272
        MOVR    R3,     R2                      ; 520B   009A

        JSR     R5,     L_60D4                  ; 520C   0004 0160 00D4

        PULR    R2                              ; 520F   02B2
        MVI     G_01A9, R0                      ; 5210   0280 01A9
        TSTR    R0                              ; 5212   0080
        BEQ     L_521E                          ; 5213   0204 0009

        MVI@    R2,     R1                      ; 5215   0291
        ANDI    #$0018, R1                      ; 5216   03B9 0018
        BEQ     L_51E5                          ; 5218   0224 0034

        MOVR    R2,     R1                      ; 521A   0091
        ADDI    #$001A, R1                      ; 521B   02F9 001A
        MVO@    R0,     R1                      ; 521D   0248
L_521E:
        ADDI    #$0017, R2                      ; 521E   02FA 0017
        CLRR    R0                              ; 5220   01C0
        MVO@    R0,     R2                      ; 5221   0250
        B       L_5233                          ; 5222   0200 000F

L_5224:
        MVI     G_0339, R0                      ; 5224   0280 0339
        DECR    R0                              ; 5226   0010
        BEQ     L_5233                          ; 5227   0204 000A

        ADDI    #$0023, R2                      ; 5229   02FA 0023
        CMPI    #$0180, R2                      ; 522B   037A 0180
        BEQ     L_518D                          ; 522D   0224 00A1

        MVII    #$015D, R2                      ; 522F   02BA 015D
        B       L_518D                          ; 5231   0220 00A5

L_5233:
        JSR     R5,     L_5448                  ; 5233   0004 0154 0048

        MVII    #$0001, R0                      ; 5236   02B8 0001

        JSR     R5,     X_RAND1                 ; 5238   0004 0114 027D
        JSR     R5,     .EXEC.AAD               ; 523B   0004 0118 02AD

        B       L_5047                          ; 523E   0220 01F8

L_5240:
        MVII    #$00FF, R0                      ; 5240   02B8 00FF
        INCR    R7                              ; 5242   000F

L_5243:
        CLRR    R0                              ; 5243   01C0
L_5244:
        MVO     R0,     G_013A                  ; 5244   0240 013A
        MVI@    R5,     R0                      ; 5246   02A8
        MVO     R0,     G_0139                  ; 5247   0240 0139
        MVO     R5,     G_0344                  ; 5249   0245 0344
L_524B:
        PULR    R7                              ; 524B   02B7

L_524C:
        PSHR    R5                              ; 524C   0275
        MVI     G_0139, R0                      ; 524D   0280 0139
        DECR    R0                              ; 524F   0010
        BMI     L_524B                          ; 5250   022B 0006

        MVO     R0,     G_0139                  ; 5252   0240 0139
        BNEQ    L_524B                          ; 5254   022C 000A

        MVO     R0,     G_013A                  ; 5256   0240 013A
        MVI     G_0344, R7                      ; 5258   0287 0344

L_525A:
        PSHR    R5                              ; 525A   0275

        JSR     R5,     L_6127                  ; 525B   0004 0160 0127

        MVII    #$015D, R2                      ; 525E   02BA 015D
L_5260:
        MVI@    R2,     R0                      ; 5260   0290
        MOVR    R0,     R5                      ; 5261   0085
        ANDI    #$0004, R0                      ; 5262   03B8 0004
        BNEQ    L_5344                          ; 5264   020C 00DE

        MOVR    R2,     R4                      ; 5266   0094
        ADDI    #$0002, R4                      ; 5267   02FC 0002
        SDBD                                    ; 5269   0001
        MVI@    R4,     R0                      ; 526A   02A0
        SDBD                                    ; 526B   0001
        MVI@    R4,     R1                      ; 526C   02A1
        MVO     R0,     G_034E                  ; 526D   0240 034E
        MVO     R1,     G_034F                  ; 526F   0241 034F
        SDBD                                    ; 5271   0001
        MVI@    R4,     R3                      ; 5272   02A3
        MVO     R3,     G_033C                  ; 5273   0243 033C
        SDBD                                    ; 5275   0001
        ADD@    R4,     R0                      ; 5276   02E0
        SDBD                                    ; 5277   0001
        ADD@    R4,     R1                      ; 5278   02E1
        MVO     R0,     G_033A                  ; 5279   0240 033A
        MVO     R1,     G_033B                  ; 527B   0241 033B
        ANDI    #$0010, R5                      ; 527D   03BD 0010
        BNEQ    L_52F9                          ; 527F   020C 0078

        JSR     R5,     L_53E6                  ; 5281   0004 0150 03E6

        BC      L_52E2                          ; 5284   0201 005C

        MOVR    R2,     R5                      ; 5286   0095
        ADDI    #$0014, R5                      ; 5287   02FD 0014
        MVI@    R5,     R5                      ; 5289   02AD
        CMPI    #$001C, R5                      ; 528A   037D 001C
        BNEQ    L_52D9                          ; 528C   020C 004B

        MVI     G_033A, R5                      ; 528E   0285 033A
        PSHR    R5                              ; 5290   0275
        MVI     G_034E, R0                      ; 5291   0280 034E
        MVO     R0,     G_033A                  ; 5293   0240 033A
        MVI     G_033B, R1                      ; 5295   0281 033B

        JSR     R5,     L_53E6                  ; 5297   0004 0150 03E6

        PULR    R5                              ; 529A   02B5
        BC      L_52E2                          ; 529B   0201 0045

        MVO     R5,     G_033A                  ; 529D   0245 033A
        MOVR    R5,     R0                      ; 529F   00A8
        MOVR    R2,     R5                      ; 52A0   0095
        ADDI    #$0008, R5                      ; 52A1   02FD 0008
        SDBD                                    ; 52A3   0001
        MVI@    R5,     R4                      ; 52A4   02AC
        TSTR    R4                              ; 52A5   00A4
        BEQ     L_52BC                          ; 52A6   0204 0014

        MVI     G_033B, R5                      ; 52A8   0285 033B
        PSHR    R5                              ; 52AA   0275
        MVI     G_034F, R1                      ; 52AB   0281 034F
        MVO     R1,     G_033B                  ; 52AD   0241 033B

        JSR     R5,     L_53E6                  ; 52AF   0004 0150 03E6

        PULR    R5                              ; 52B2   02B5
        BC      L_52E2                          ; 52B3   0201 002D

        MOVR    R5,     R1                      ; 52B5   00A9
        MVO     R1,     G_033B                  ; 52B6   0241 033B
        MVI     G_033A, R0                      ; 52B8   0280 033A
        B       L_52D4                          ; 52BA   0200 0018

L_52BC:
        SDBD                                    ; 52BC   0001
        DECLE   $02AC,  $00A4,  $0203,  $0013   ; 52BD   02AC 00A4 0203 0013
        DECLE   $02BC,  $00C0,  $0004           ; 52C1   02BC 00C0 0004

        ANDR    R5,     R0                      ; 52C4   01A8
        CMPR    R1,     R4                      ; 52C5   014C
        CMPI    #$0001, R5                      ; 52C6   037D 0001
        BEQ     L_52CF                          ; 52C8   0204 0005

        NEGR    R4                              ; 52CA   0024
        CMPI    #$0002, R5                      ; 52CB   037D 0002
        BNEQ    L_52D4                          ; 52CD   020C 0005

L_52CF:
        ADDR    R4,     R0                      ; 52CF   00E0
        MVO     R0,     G_033A                  ; 52D0   0240 033A
        MVI     G_033B, R1                      ; 52D2   0281 033B

L_52D4:
        JSR     R5,     L_53E6                  ; 52D4   0004 0150 03E6

        BC      L_52E2                          ; 52D7   0201 0009

L_52D9:
        MOVR    R2,     R1                      ; 52D9   0091
        ADDI    #$0021, R1                      ; 52DA   02F9 0021
        MVO@    R3,     R1                      ; 52DC   024B

        JSR     R5,     L_538E                  ; 52DD   0004 0150 038E

        B       L_5344                          ; 52E0   0200 0062

L_52E2:
        CMPI    #$0007, R3                      ; 52E2   037B 0007
        BGE     L_52F0                          ; 52E4   020D 000A

        INCR    R3                              ; 52E6   000B
        ADDR    R7,     R3                      ; 52E7   00FB
        ADD@    R3,     R7                      ; 52E8   02DF

        SLR     R2,     1                       ; 52E9   0062
        RRC     R0,     1                       ; 52EA   0070
        RRC     R0,     1                       ; 52EB   0070
        SARC    R1,     1                       ; 52EC   0079
        SARC    R1,     1                       ; 52ED   0079
        MOVR    R1,     R2                      ; 52EE   008A
        MOVR    R4,     R1                      ; 52EF   00A1
L_52F0:
        CLRR    R0                              ; 52F0   01C0
L_52F1:
        ADDI    #$0016, R2                      ; 52F1   02FA 0016
        MVI     G_01A7, R3                      ; 52F3   0283 01A7
        MVO@    R3,     R2                      ; 52F5   0253
        SUBI    #$0016, R2                      ; 52F6   033A 0016
        INCR    R7                              ; 52F8   000F

L_52F9:
        CLRR    R0                              ; 52F9   01C0
L_52FA:
        MVI@    R2,     R3                      ; 52FA   0293
        ANDI    #$00FD, R3                      ; 52FB   03BB 00FD
        XORR    R0,     R3                      ; 52FD   01C3
        MVO@    R3,     R2                      ; 52FE   0253
        MVI     G_033A, R0                      ; 52FF   0280 033A
        MVI     G_033B, R1                      ; 5301   0281 033B
        MVI     G_0138, R3                      ; 5303   0283 0138
        CMPI    #$0008, R3                      ; 5305   037B 0008
        BNEQ    L_533E                          ; 5307   020C 0035

        MVI@    R2,     R5                      ; 5309   0295
        ANDI    #$0010, R5                      ; 530A   03BD 0010
        BNEQ    L_533E                          ; 530C   020C 0030

        MOVR    R2,     R5                      ; 530E   0095
        ADDI    #$0015, R5                      ; 530F   02FD 0015
        MVI@    R5,     R5                      ; 5311   02AD
        TSTR    R5                              ; 5312   00AD
        BNEQ    L_533E                          ; 5313   020C 0029

        JSR     R5,     L_60C2                  ; 5315   0004 0160 00C2

        MOVR    R3,     R5                      ; 5318   009D
        ADDI    #$0002, R5                      ; 5319   02FD 0002
        MOVR    R5,     R4                      ; 531B   00AC
        SDBD                                    ; 531C   0001
        MVI@    R5,     R3                      ; 531D   02AB
        SUBR    R0,     R3                      ; 531E   0103
        BPL     L_5322                          ; 531F   0203 0001

        NEGR    R3                              ; 5321   0023
L_5322:
        SDBD                                    ; 5322   0001
        CMPI    #$2200, R3                      ; 5323   037B 0000 0022
        BLT     L_533E                          ; 5326   0205 0016

        MVO     R3,     G_0341                  ; 5328   0243 0341
        MOVR    R2,     R5                      ; 532A   0095
        ADDI    #$0002, R5                      ; 532B   02FD 0002
        SDBD                                    ; 532D   0001
        MVI@    R5,     R3                      ; 532E   02AB
        SDBD                                    ; 532F   0001
        SUB@    R4,     R3                      ; 5330   0323
        BPL     L_5334                          ; 5331   0203 0001

        NEGR    R3                              ; 5333   0023
L_5334:
        SDBD                                    ; 5334   0001
        CMPI    #$2200, R3                      ; 5335   037B 0000 0022
        BLT     L_5383                          ; 5338   0205 0049

        CMP     G_0341, R3                      ; 533A   0343 0341
        BLE     L_5344                          ; 533C   0206 0006

L_533E:
        MOVR    R2,     R4                      ; 533E   0094
        ADDI    #$0002, R4                      ; 533F   02FC 0002

        JSR     R5,     L_61EE                  ; 5341   0004 0160 01EE

L_5344:
        ADDI    #$0023, R2                      ; 5344   02FA 0023
        CMPI    #$0180, R2                      ; 5346   037A 0180
        BLE     L_5260                          ; 5348   0226 00E9
        PULR    R7                              ; 534A   02B7

        DECLE   $0280,  $033C,  $0004           ; 534B   0280 033C 0004

        ANDR    R5,     R0                      ; 534E   01A8
        SAR     R3,     1                       ; 534F   006B
        SUBR    R0,     R1                      ; 5350   0101
        CMPI    #$0042, R1                      ; 5351   0379 0042
        BLT     L_52F0                          ; 5353   0225 0064

        MVII    #$0002, R0                      ; 5355   02B8 0002
        B       L_52F1                          ; 5357   0220 0067

        DECLE   $0379,  $0042,  $0225,  $006C   ; 5359   0379 0042 0225 006C
        DECLE   $0004                           ; 535D   0004

        ANDR    R5,     R0                      ; 535E   01A8
        GSWD    R0                              ; 535F   0030
        B       L_52F0                          ; 5360   0220 0071

        JSR     R5,     L_60C2                  ; 5362   0004 0160 00C2

        ADDI    #$0016, R3                      ; 5365   02FB 0016
        MVI@    R3,     R3                      ; 5367   029B
        CMP     G_01A7, R3                      ; 5368   0343 01A7
        BEQ     L_5344                          ; 536A   0224 0027

        MVII    #$0008, R0                      ; 536C   02B8 0008

L_536E:
        JSR     R5,     L_60D4                  ; 536E   0004 0160 00D4

        B       L_52F0                          ; 5371   0220 0082

        JSR     R5,     L_60C2                  ; 5373   0004 0160 00C2

        ADDI    #$0016, R3                      ; 5376   02FB 0016
        MVI@    R3,     R0                      ; 5378   0298
        MVII    #$0003, R3                      ; 5379   02BB 0003
        CMPI    #$0004, R0                      ; 537B   0378 0004
        BLE     L_52D9                          ; 537D   0226 00A5

        MVII    #$0022, R0                      ; 537F   02B8 0022
        B       L_5385                          ; 5381   0200 0002

L_5383:
        MVII    #$0001, R0                      ; 5383   02B8 0001

L_5385:
        JSR     R5,     L_60D4                  ; 5385   0004 0160 00D4

        B       L_5344                          ; 5388   0220 0045

        MVII    #$0021, R0                      ; 538A   02B8 0021
        B       L_536E                          ; 538C   0220 001F

L_538E:
        PSHR    R5                              ; 538E   0275
        MOVR    R2,     R1                      ; 538F   0091
        ADDI    #$0016, R1                      ; 5390   02F9 0016
        MVI@    R1,     R1                      ; 5392   0289
        CMPI    #$0002, R1                      ; 5393   0379 0002
        BGT     L_53BE                          ; 5395   020E 0027

        MOVR    R2,     R1                      ; 5397   0091
        ADDI    #$0014, R1                      ; 5398   02F9 0014
        MVI@    R1,     R1                      ; 539A   0289
        CMPI    #$001C, R1                      ; 539B   0379 001C
        BEQ     L_53BE                          ; 539D   0204 001F

        MVII    #$0002, R0                      ; 539F   02B8 0002
        CMPI    #$0007, R1                      ; 53A1   0379 0007
        BEQ     L_53C0                          ; 53A3   0204 001B

        MOVR    R2,     R5                      ; 53A5   0095
        ADDI    #$0008, R5                      ; 53A6   02FD 0008
        CMPI    #$0002, R3                      ; 53A8   037B 0002
        BLT     L_53AE                          ; 53AA   0205 0002

        ADDI    #$0002, R5                      ; 53AC   02FD 0002
L_53AE:
        SDBD                                    ; 53AE   0001
        MVI@    R5,     R0                      ; 53AF   02A8
        SAR     R0,     2                       ; 53B0   006C
        NEGR    R0                              ; 53B1   0020
        SUBI    #$0002, R5                      ; 53B2   033D 0002
        MVO@    R0,     R5                      ; 53B4   0268
        SWAP    R0,     1                       ; 53B5   0040
        MVO@    R0,     R5                      ; 53B6   0268
        MOVR    R3,     R1                      ; 53B7   0099
        MVII    #$0005, R0                      ; 53B8   02B8 0005

        JSR     R5,     L_60FE                  ; 53BA   0004 0160 00FE

        PULR    R7                              ; 53BD   02B7

L_53BE:
        MVII    #$0001, R0                      ; 53BE   02B8 0001
L_53C0:
        J       L_60D5                          ; 53C0   0004 0360 00D5

        DECLE   $00C0,  $0080,  $0000,  $0200   ; 53C3   00C0 0080 0000 0200
        DECLE   $0200,  $0180,  $0140,  $00C0   ; 53C7   0200 0180 0140 00C0
        DECLE   $0300,  $01C0,  $0080,  $0000   ; 53CB   0300 01C0 0080 0000
        DECLE   $0005,  $0033,  $0034,  $0030   ; 53CF   0005 0033 0034 0030
        DECLE   $0032,  $0037,  $0003,  $0007   ; 53D3   0032 0037 0003 0007
        DECLE   $0039,  $003A,  $0007,  $0003   ; 53D7   0039 003A 0007 0003
        DECLE   $0005,  $0036,  $003C,  $0004   ; 53DB   0005 0036 003C 0004

        CLRC                                    ; 53DF   0006
        SWAP    R1,     2                       ; 53E0   0045

        JSR     R4,     .EXEC.C00               ; 53E1   0004 001C 0000
        DECLE   $000A,  $0001                   ; 53E4   000A 0001
L_53E6:
        PSHR    R5                              ; 53E6   0275
        DECLE   $0004                           ; 53E7   0004

        ANDR    R5,     R0                      ; 53E8   01A8
        SLR     R3,     2                       ; 53E9   0067
        MOVR    R7,     R3                      ; 53EA   00BB
        ADDI    #$0097, R3                      ; 53EB   02FB 0097
L_53ED:
        MOVR    R3,     R5                      ; 53ED   009D
        CMP@    R5,     R0                      ; 53EE   0368
        BLT     L_5426                          ; 53EF   0205 0035

        CMP@    R5,     R0                      ; 53F1   0368
        BGT     L_5426                          ; 53F2   020E 0032

        CMP@    R5,     R1                      ; 53F4   0369
        BLT     L_5426                          ; 53F5   0205 002F

        CMP@    R5,     R1                      ; 53F7   0369
        BGT     L_5426                          ; 53F8   020E 002C

        SDBD                                    ; 53FA   0001
        SUBI    #$5482, R3                      ; 53FB   033B 0082 0054
        SLR     R3,     2                       ; 53FE   0067
        MVO     R3,     G_01A7                  ; 53FF   0243 01A7
        MOVR    R1,     R3                      ; 5401   008B
        SUBI    #$0030, R3                      ; 5402   033B 0030
        SLR     R3,     1                       ; 5404   0063
        MVI     G_01A7, R5                      ; 5405   0285 01A7
        CMPI    #$0001, R5                      ; 5407   037D 0001
        BEQ     L_541C                          ; 5409   0204 0011

        CMPI    #$0002, R5                      ; 540B   037D 0002
        BEQ     L_5413                          ; 540D   0204 0004

L_540F:
        MVI     G_01A7, R3                      ; 540F   0283 01A7
        SETC                                    ; 5411   0007
        PULR    R7                              ; 5412   02B7

L_5413:
        ADDI    #$00D7, R3                      ; 5413   02FB 00D7
        SUBR    R0,     R3                      ; 5415   0103
        BGT     L_540F                          ; 5416   022E 0008

        MVII    #$0001, R3                      ; 5418   02BB 0001
        B       L_5444                          ; 541A   0200 0028

L_541C:
        PSHR    R3                              ; 541C   0273
        MVII    #$0068, R3                      ; 541D   02BB 0068
        SUB@    R6,     R3                      ; 541F   0333
        SUBR    R0,     R3                      ; 5420   0103
        BLT     L_540F                          ; 5421   0225 0013

        CLRR    R3                              ; 5423   01DB
        B       L_5444                          ; 5424   0200 001E

L_5426:
        ADDI    #$0004, R3                      ; 5426   02FB 0004
        SDBD                                    ; 5428   0001
        CMPI    #$54BA, R3                      ; 5429   037B 00BA 0054
        BLT     L_53ED                          ; 542C   0225 0040

        MOVR    R2,     R3                      ; 542E   0093
        ADDI    #$0016, R3                      ; 542F   02FB 0016
        MVI@    R3,     R3                      ; 5431   029B
        SLL     R3,     2                       ; 5432   004F
        ADDR    R7,     R3                      ; 5433   00FB
        ADDI    #$004E, R3                      ; 5434   02FB 004E
        MOVR    R3,     R5                      ; 5436   009D
        CMP@    R3,     R0                      ; 5437   0358
        BLT     L_5443                          ; 5438   0205 0009

        INCR    R3                              ; 543A   000B
        CMP@    R3,     R0                      ; 543B   0358
        BGT     L_5443                          ; 543C   020E 0005

        INCR    R3                              ; 543E   000B
        CMP@    R3,     R1                      ; 543F   0359
        BLT     L_5443                          ; 5440   0205 0001

        INCR    R3                              ; 5442   000B
L_5443:
        SUBR    R5,     R3                      ; 5443   012B
L_5444:
        MVO     R3,     G_01A7                  ; 5444   0243 01A7
        CLRC                                    ; 5446   0006
        PULR    R7                              ; 5447   02B7

L_5448:
        PSHR    R5                              ; 5448   0275
        MVI     G_0138, R0                      ; 5449   0280 0138
        CMPI    #$0005, R0                      ; 544B   0378 0005
        BNEQ    L_524B                          ; 544D   022C 0203

        CLRR    R3                              ; 544F   01DB
L_5450:
        MVI     G_01A3, R1                      ; 5450   0281 01A3
        DECR    R1                              ; 5452   0011
        BNEQ    L_545E                          ; 5453   020C 0009

        MVII    #$0002, R0                      ; 5455   02B8 0002

        JSR     R5,     X_RAND1                 ; 5457   0004 0114 027D

        MVO     R0,     G_01A4                  ; 545A   0240 01A4
        MVII    #$0011, R1                      ; 545C   02B9 0011
L_545E:
        MVO     R1,     G_01A3                  ; 545E   0241 01A3
        MVI     G_01A5, R1                      ; 5460   0281 01A5
        DECR    R1                              ; 5462   0011
        BNEQ    L_5473                          ; 5463   020C 000E

        MVI     G_01A6, R2                      ; 5465   0282 01A6
        XORI    #$0001, R2                      ; 5467   03FA 0001
        MVO     R2,     G_01A6                  ; 5469   0242 01A6
        MVII    #$000B, R1                      ; 546B   02B9 000B
        TSTR    R2                              ; 546D   0092
        BNEQ    L_5473                          ; 546E   020C 0003

        MVII    #$003C, R1                      ; 5470   02B9 003C
        INCR    R3                              ; 5472   000B
L_5473:
        MVO     R1,     G_01A5                  ; 5473   0241 01A5

        JSR     R5,     L_55FF                  ; 5475   0004 0154 01FF
        BIDECLE $4000                           ; 5478   0000 0040
        DECLE   $009B,  $0224,  $0231,  $02B8   ; 547A   009B 0224 0231 02B8
        DECLE   $001A,  $0004                   ; 547E   001A 0004

        AND@    R4,     R0                      ; 5480   03A0
        MOVR    R7,     R3                      ; 5481   00BB
        SAR     R3,     2                       ; 5482   006F
        ADDR    R2,     R0                      ; 5483   00D0
        GSWD    R0                              ; 5484   0030
        SLL     R3,     2                       ; 5485   004F
        SLLC    R0,     1                       ; 5486   0058
        SAR     R2,     2                       ; 5487   006E
        GSWD    R0                              ; 5488   0030
        SLL     R3,     2                       ; 5489   004F
        ADDR    R2,     R1                      ; 548A   00D1
        ADDR    R4,     R7                      ; 548B   00E7

        GSWD    R0                              ; 548C   0030
        SLL     R3,     2                       ; 548D   004F
        SAR     R1,     1                       ; 548E   0069
        SAR     R3,     1                       ; 548F   006B
        ADCR    R6                              ; 5490   002E
        ADCR    R7                              ; 5491   002F

        ADDR    R2,     R4                      ; 5492   00D4
L_5493:
        ADDR    R2,     R6                      ; 5493   00D6
        ADCR    R6                              ; 5494   002E
        ADCR    R7                              ; 5495   002F

        SAR     R0,     2                       ; 5496   006C
L_5497:
        ADDR    R2,     R4                      ; 5497   00D4
        RLC     R0,     1                       ; 5498   0050
        RLC     R1,     1                       ; 5499   0051
        SAR     R0,     2                       ; 549A   006C
        ADDR    R2,     R4                      ; 549B   00D4
        RLC     R3,     2                       ; 549C   0057
        RLC     R3,     2                       ; 549D   0057
        SAR     R0,     1                       ; 549E   0068
        ADDR    R3,     R0                      ; 549F   00D8
        SLLC    R0,     1                       ; 54A0   0058
        SLR     R3,     2                       ; 54A1   0067
        ADCR    R0                              ; 54A2   0028
        RLC     R0,     2                       ; 54A3   0054
        RLC     R0,     1                       ; 54A4   0050
        SLR     R3,     2                       ; 54A5   0067
        ADDR    R5,     R3                      ; 54A6   00EB
        SUBR    R2,     R7                      ; 54A7   0117

        DECLE   $0050,  $0067,  $0002,  $004F   ; 54A8   0050 0067 0002 004F
        DECLE   $0038,  $004F,  $00F0,  $013F   ; 54AC   0038 004F 00F0 013F

        RSWD    R0                              ; 54B0   0038
        SLL     R3,     2                       ; 54B1   004F
        RLC     R1,     2                       ; 54B2   0055
        SLR     R3,     2                       ; 54B3   0067
        SLLC    R0,     1                       ; 54B4   0058
        SLR     R3,     2                       ; 54B5   0067
        ADDR    R3,     R1                      ; 54B6   00D9
        ADDR    R5,     R2                      ; 54B7   00EA
        SLLC    R0,     1                       ; 54B8   0058
        SLR     R3,     2                       ; 54B9   0067
L_54BA:
        PSHR    R5                              ; 54BA   0275
        MVI     G_0138, R0                      ; 54BB   0280 0138
        CMPI    #$0008, R0                      ; 54BD   0378 0008
        BNEQ    L_55FE                          ; 54BF   020C 013D

        MVI     G_0141, R3                      ; 54C1   0283 0141
        TSTR    R3                              ; 54C3   009B
        BEQ     L_5532                          ; 54C4   0204 006C

        MVII    #$0012, R0                      ; 54C6   02B8 0012
        CMPI    #$0003, R3                      ; 54C8   037B 0003
        BNEQ    L_54CD                          ; 54CA   020C 0001

        INCR    R0                              ; 54CC   0008
L_54CD:
        MVI     G_0135, R2                      ; 54CD   0282 0135
        DECLE   $03BA,  $003F,  $020C,  $005F   ; 54CF   03BA 003F 020C 005F
        DECLE   $0004                           ; 54D3   0004

        ANDR    R4,     R0                      ; 54D4   01A0
        MOVR    R7,     R2                      ; 54D5   00BA
        MVI     G_0140, R2                      ; 54D6   0282 0140
        INCR    R2                              ; 54D8   000A
        MVO     R2,     G_0140                  ; 54D9   0242 0140
        MVI     G_0141, R3                      ; 54DB   0283 0141

        JSR     R5,     L_55FF                  ; 54DD   0004 0154 01FF
        BIDECLE $2000                           ; 54E0   0000 0020

        CMPR    R3,     R2                      ; 54E2   015A
        BNEQ    L_5532                          ; 54E3   020C 004D

        CLRR    R0                              ; 54E5   01C0
        MVO     R0,     G_0141                  ; 54E6   0240 0141
        MVO     R0,     G_0142                  ; 54E8   0240 0142
        MVO     R0,     G_01AF                  ; 54EA   0240 01AF
        MVO     R0,     G_01B0                  ; 54EC   0240 01B0
        SDBD                                    ; 54EE   0001
        MVII    #$9C1C, R1                      ; 54EF   02B9 001C 009C
        CMPI    #$0003, R3                      ; 54F2   037B 0003
        BEQ     L_551C                          ; 54F4   0204 0026

        MVII    #$0002, R4                      ; 54F6   02BC 0002
        MVII    #$015D, R2                      ; 54F8   02BA 015D
        CMP     G_0173, R4                      ; 54FA   0344 0173
        BGE     L_5528                          ; 54FC   020D 002A

        ADDI    #$0023, R2                      ; 54FE   02FA 0023
        CMP     G_0196, R4                      ; 5500   0344 0196
        BGE     L_5528                          ; 5502   020D 0024

        SDBD                                    ; 5504   0001
        MVII    #$9BF0, R1                      ; 5505   02B9 00F0 009B
        MVII    #$0006, R3                      ; 5508   02BB 0006

        JSR     R5,     L_585B                  ; 550A   0004 0158 005B
        DECLE   $02B8,  $0009,  $0240,  $0138   ; 550D   02B8 0009 0240 0138
        DECLE   $0004                           ; 5511   0004

        ANDR    R4,     R0                      ; 5512   01A0
        MOVR    R7,     R1                      ; 5513   00B9
        COMR    R1                              ; 5514   0019

        JSR     R5,     L_5240                  ; 5515   0004 0150 0240
        DECLE   $00C8                           ; 5518   00C8

        J       L_5B27                          ; 5519   0004 0358 0327

L_551C:
        MVII    #$015D, R2                      ; 551C   02BA 015D
        MOVR    R2,     R3                      ; 551E   0093
        ADDI    #$0014, R3                      ; 551F   02FB 0014
        MVI@    R3,     R3                      ; 5521   029B
        CMPI    #$0029, R3                      ; 5522   037B 0029
        BEQ     L_5528                          ; 5524   0204 0002

        ADDI    #$0023, R2                      ; 5526   02FA 0023
L_5528:
        MVII    #$0006, R3                      ; 5528   02BB 0006

        JSR     R5,     L_585B                  ; 552A   0004 0158 005B

        MVII    #$0024, R0                      ; 552D   02B8 0024

        JSR     R5,     L_60D4                  ; 552F   0004 0160 00D4

L_5532:
        MVI     G_0135, R0                      ; 5532   0280 0135
        ANDI    #$001F, R0                      ; 5534   03B8 001F
        BNEQ    L_5570                          ; 5536   020C 0038

        MVII    #$01AF, R4                      ; 5538   02BC 01AF
        MVI@    R4,     R1                      ; 553A   02A1
        DECR    R4                              ; 553B   0014
        SDBD                                    ; 553C   0001
        MVI@    R4,     R0                      ; 553D   02A0
        TSTR    R1                              ; 553E   0089
        BNEQ    L_5543                          ; 553F   020C 0002

        SUBI    #$00C4, R0                      ; 5541   0338 00C4
L_5543:
        DECR    R0                              ; 5543   0010
        BMI     L_5570                          ; 5544   020B 002A
        BEQ     L_554D                          ; 5546   0204 0005

        JSR     R5,     L_60A3                  ; 5548   0004 0160 00A3

        B       L_5570                          ; 554B   0200 0023

L_554D:
        JSR     R5,     L_60A3                  ; 554D   0004 0160 00A3

        CLRR    R0                              ; 5550   01C0
        MVO     R0,     G_0142                  ; 5551   0240 0142
        SDBD                                    ; 5553   0001
        MVII    #$9BC4, R1                      ; 5554   02B9 00C4 009B
        MVII    #$0006, R3                      ; 5557   02BB 0006

        JSR     R5,     L_585B                  ; 5559   0004 0158 005B
        DECLE   $02B8,  $0009,  $0240,  $0138   ; 555C   02B8 0009 0240 0138
        DECLE   $0004                           ; 5560   0004

        ANDR    R4,     R0                      ; 5561   01A0
        MOVR    R7,     R1                      ; 5562   00B9
        COMR    R0                              ; 5563   0018

        JSR     R5,     L_5240                  ; 5564   0004 0150 0240
        DECLE   $0064                           ; 5567   0064

        MVI     G_0136, R0                      ; 5568   0280 0136
        INCR    R0                              ; 556A   0008
        MVO     R0,     G_0136                  ; 556B   0240 0136
        J       L_6A71                          ; 556D   0004 0368 0271

L_5570:
        MVI     G_0135, R0                      ; 5570   0280 0135
        ANDI    #$00FF, R0                      ; 5572   03B8 00FF
        BNEQ    L_5581                          ; 5574   020C 000B

        DECR    R0                              ; 5576   0010
        MVII    #$017A, R1                      ; 5577   02B9 017A

        JSR     R5,     L_69A3                  ; 5579   0004 0168 01A3

        MVII    #$019D, R1                      ; 557C   02B9 019D

        JSR     R5,     L_69A3                  ; 557E   0004 0168 01A3

L_5581:
        MVI     G_013F, R0                      ; 5581   0280 013F
        MOVR    R0,     R1                      ; 5583   0081
        ANDI    #$0080, R1                      ; 5584   03B9 0080
        BNEQ    L_5593                          ; 5586   020C 000B

        DECR    R0                              ; 5588   0010
        BMI     L_5593                          ; 5589   020B 0008

        MVO     R0,     G_013F                  ; 558B   0240 013F
        BNEQ    L_5593                          ; 558D   020C 0004

        MVO     R0,     G_0319                  ; 558F   0240 0319
        MVO     R0,     G_031A                  ; 5591   0240 031A
L_5593:
        MVI     G_0135, R0                      ; 5593   0280 0135
        ANDI    #$0003, R0                      ; 5595   03B8 0003
        BNEQ    L_55A5                          ; 5597   020C 000C

        MVI     G_01B1, R0                      ; 5599   0280 01B1
        DECR    R0                              ; 559B   0010
        BMI     L_55A5                          ; 559C   020B 0007

        MVO     R0,     G_01B1                  ; 559E   0240 01B1
        BNEQ    L_55A5                          ; 55A0   020C 0003

        JSR     R5,     L_587F                  ; 55A2   0004 0158 007F

L_55A5:
        MVI     G_01AE, R3                      ; 55A5   0283 01AE
        DECLE   $009B,  $0204,  $0022,  $02BC   ; 55A7   009B 0204 0022 02BC
        DECLE   $0161,  $0001,  $02A0,  $02BD   ; 55AB   0161 0001 02A0 02BD
        DECLE   $0184,  $0001,  $02A9,  $0004   ; 55AF   0184 0001 02A9 0004

        ANDR    R5,     R0                      ; 55B3   01A8
        SLR     R3,     2                       ; 55B4   0067
        CMP     G_0173, R3                      ; 55B5   0343 0173
        BNEQ    L_55BD                          ; 55B7   020C 0004

        CMPI    #$0042, R0                      ; 55B9   0378 0042
        BGE     L_55CC                          ; 55BB   020D 000F

L_55BD:
        CMP     G_0196, R3                      ; 55BD   0343 0196
        BNEQ    L_55C5                          ; 55BF   020C 0004

        CMPI    #$0042, R1                      ; 55C1   0379 0042
        BGE     L_55CC                          ; 55C3   020D 0007

L_55C5:
        CLRR    R0                              ; 55C5   01C0
        MVO     R0,     G_0319                  ; 55C6   0240 0319
        MVO     R0,     G_031A                  ; 55C8   0240 031A
        MVO     R0,     G_01AE                  ; 55CA   0240 01AE
L_55CC:
        MVI     G_0135, R0                      ; 55CC   0280 0135
        ANDI    #$0001, R0                      ; 55CE   03B8 0001
        BNEQ    L_55E7                          ; 55D0   020C 0015

        MVII    #$01AA, R3                      ; 55D2   02BB 01AA
        MVII    #$0040, R0                      ; 55D4   02B8 0040
L_55D6:
        MVI@    R3,     R1                      ; 55D6   0299
        MOVR    R1,     R2                      ; 55D7   008A
        ANDI    #$0080, R2                      ; 55D8   03BA 0080
        BNEQ    L_55E1                          ; 55DA   020C 0005

        DECR    R1                              ; 55DC   0011
        MVO@    R1,     R3                      ; 55DD   0259

        JSR     R5,     L_5601                  ; 55DE   0004 0154 0201

L_55E1:
        SLL     R0,     1                       ; 55E1   0048
        INCR    R3                              ; 55E2   000B
        CMPI    #$01AD, R3                      ; 55E3   037B 01AD
        BLE     L_55D6                          ; 55E5   0226 0010

L_55E7:
        MVI     G_0135, R0                      ; 55E7   0280 0135
        ANDI    #$0003, R0                      ; 55E9   03B8 0003
        BNEQ    L_55FE                          ; 55EB   020C 0011

        MVII    #$016E, R1                      ; 55ED   02B9 016E
L_55EF:
        MVI@    R1,     R0                      ; 55EF   0288
        CMPI    #$00FF, R0                      ; 55F0   0378 00FF
        BEQ     L_55F8                          ; 55F2   0204 0004

        DECR    R0                              ; 55F4   0010
        BMI     L_55F8                          ; 55F5   020B 0001

        MVO@    R0,     R1                      ; 55F7   0248
L_55F8:
        ADDI    #$0023, R1                      ; 55F8   02F9 0023
        CMPI    #$0191, R1                      ; 55FA   0379 0191
        BLE     L_55EF                          ; 55FC   0226 000E
L_55FE:
        PULR    R7                              ; 55FE   02B7

L_55FF:
        SDBD                                    ; 55FF   0001
        MVI@    R5,     R0                      ; 5600   02A8
L_5601:
        PSHR    R5                              ; 5601   0275
        MOVR    R0,     R5                      ; 5602   0085
        COMR    R5                              ; 5603   001D
        AND     G_0343, R5                      ; 5604   0385 0343
        XORR    R0,     R5                      ; 5606   01C5
        MVO     R5,     G_0343                  ; 5607   0245 0343
        PULR    R7                              ; 5609   02B7

        PSHR    R5                              ; 560A   0275
        MVI     .ISRVEC.0,R1                    ; 560B   0281 0100
        SWAP    R1,     1                       ; 560D   0041
        XOR     .ISRVEC.1,R1                    ; 560E   03C1 0101
        MOVR    R7,     R0                      ; 5610   00B8
        ADDI    #$0008, R0                      ; 5611   02F8 0008
        MVO     R0,     .ISRVEC.0               ; 5613   0240 0100
        SWAP    R0,     1                       ; 5615   0040
        MVO     R0,     .ISRVEC.1               ; 5616   0240 0101
L_5618:
        DECR    R7                              ; 5618   0017

        SUBI    #$0008, R6                      ; 5619   033E 0008
        MVO     R1,     .ISRVEC.1               ; 561B   0241 0101
        SWAP    R1,     1                       ; 561D   0041
        MVO     R1,     .ISRVEC.0               ; 561E   0241 0100
        PULR    R7                              ; 5620   02B7

L_5621:
        MVI@    R5,     R0                      ; 5621   02A8
        INCR    R0                              ; 5622   0008
        MVO     R0,     G_0107                  ; 5623   0240 0107
L_5625:
        EIS                                     ; 5625   0002
        MVI     G_0107, R0                      ; 5626   0280 0107
        TSTR    R0                              ; 5628   0080
        BNEQ    L_5625                          ; 5629   022C 0005
        MOVR    R5,     R7                      ; 562B   00AF

L_562C:
        PSHR    R5                              ; 562C   0275
L_562D:
        MOVR    R1,     R5                      ; 562D   008D
L_562E:
        MVI@    R4,     R1                      ; 562E   02A1
        MVO@    R1,     R5                      ; 562F   0269
        MVI@    R4,     R1                      ; 5630   02A1
        MVO@    R1,     R5                      ; 5631   0269
        MVI@    R4,     R1                      ; 5632   02A1
        MVO@    R1,     R5                      ; 5633   0269
        MVI@    R4,     R1                      ; 5634   02A1
        MVO@    R1,     R5                      ; 5635   0269
        MVI@    R4,     R1                      ; 5636   02A1
        MVO@    R1,     R5                      ; 5637   0269
        MVI@    R4,     R1                      ; 5638   02A1
        MVO@    R1,     R5                      ; 5639   0269
        MVI@    R4,     R1                      ; 563A   02A1
        MVO@    R1,     R5                      ; 563B   0269
        MVI@    R4,     R1                      ; 563C   02A1
        MVO@    R1,     R5                      ; 563D   0269
        DECR    R0                              ; 563E   0010
        BPL     L_562E                          ; 563F   0223 0012

        MOVR    R5,     R1                      ; 5641   00A9
        PULR    R7                              ; 5642   02B7

L_5643:
        PSHR    R5                              ; 5643   0275
L_5644:
        MVII    #$000D, R0                      ; 5644   02B8 000D
        SWAP    R0,     1                       ; 5646   0040
        MVO     R0,     G_0348                  ; 5647   0240 0348
        CLRR    R0                              ; 5649   01C0
        MVO     R0,     G_0138                  ; 564A   0240 0138
        MVO     R0,     G_015E                  ; 564C   0240 015E
        MVO     R0,     G_01B2                  ; 564E   0240 01B2
        INCR    R0                              ; 5650   0008
        MVO     R0,     G_0181                  ; 5651   0240 0181
        SDBD                                    ; 5653   0001
        MVII    #$5A35, R2                      ; 5654   02BA 0035 005A

        JSR     R5,     L_6139                  ; 5657   0004 0160 0139

        MVII    #$001F, R0                      ; 565A   02B8 001F

        JSR     R5,     L_60CB                  ; 565C   0004 0160 00CB
        JSR     R5,     L_6067                  ; 565F   0004 0160 0067

        MVI     .PSG0.rgt_hand,R0               ; 5662   0280 01FE
        CMPI    #$009C, R0                      ; 5664   0378 009C
        BNEQ    L_567F                          ; 5666   020C 0017

        MVI     .PSG0.lft_hand,R0               ; 5668   0280 01FF
        CMPI    #$009E, R0                      ; 566A   0378 009E
        BNEQ    L_567F                          ; 566C   020C 0011

        MVII    #$000D, R0                      ; 566E   02B8 000D
        MVO     R0,     G_0138                  ; 5670   0240 0138

        JSR     R5,     L_6054                  ; 5672   0004 0160 0054

        MVII    #$000B, R0                      ; 5675   02B8 000B
        MVO     R0,     G_015E                  ; 5677   0240 015E

        JSR     R5,     L_570F                  ; 5679   0004 0154 030F
        BIDECLE $93F0                           ; 567C   00F0 0093

        PULR    R7                              ; 567E   02B7

L_567F:
        JSR     R5,     L_5823                  ; 567F   0004 0158 0023
L_5682:
        JSR     R5,     L_6048                  ; 5682   0004 0160 0048

        MVI     G_01B2, R1                      ; 5685   0281 01B2
        INCR    R1                              ; 5687   0009
        ANDI    #$0003, R1                      ; 5688   03B9 0003
        MVO     R1,     G_01B2                  ; 568A   0241 01B2
        INCR    R1                              ; 568C   0009
        ADDR    R7,     R1                      ; 568D   00F9
        ADD@    R1,     R7                      ; 568E   02CF

        DECLE   $001E,  $0004                   ; 568F   001E 0004

        ADCR    R3                              ; 5691   002B
        RSWD    R2                              ; 5692   003A

        JSR     R5,     L_570F                  ; 5693   0004 0154 030F
        BIDECLE $9298                           ; 5696   0098 0092
        DECLE   $0004                           ; 5698   0004

        ANDR    R4,     R0                      ; 5699   01A0
        MOVR    R7,     R1                      ; 569A   00B9
        INCR    R6                              ; 569B   000E
        MVII    #$02CA, R4                      ; 569C   02BC 02CA
L_569E:
        SDBD                                    ; 569E   0001
        MVII    #$9C68, R1                      ; 569F   02B9 0068 009C
        MVII    #$0001, R3                      ; 56A2   02BB 0001

        JSR     R5,     L_56E3                  ; 56A4   0004 0154 02E3
        JSR     R5,     L_5243                  ; 56A7   0004 0150 0243
        DECLE   $0031                           ; 56AA   0031

        B       L_56D6                          ; 56AB   0200 0029

        JSR     R5,     L_570F                  ; 56AD   0004 0154 030F
        BIDECLE $93A8                           ; 56B0   00A8 0093
        DECLE   $0004                           ; 56B2   0004

        ANDR    R4,     R0                      ; 56B3   01A0
        MOVR    R7,     R1                      ; 56B4   00B9
        DIS                                     ; 56B5   0003
        MVII    #$02DE, R4                      ; 56B6   02BC 02DE
        B       L_569E                          ; 56B8   0220 001B

        JSR     R5,     L_570F                  ; 56BA   0004 0154 030F
        BIDECLE $92C8                           ; 56BD   00C8 0092
        DECLE   $02B8,  $0008,  $0240,  $0142   ; 56BF   02B8 0008 0240 0142
        DECLE   $0004                           ; 56C3   0004

        ANDR    R4,     R0                      ; 56C4   01A0
        MOVR    R7,     R1                      ; 56C5   00B9
        DECR    R6                              ; 56C6   0016
        B       L_56D2                          ; 56C7   0200 0009

        JSR     R5,     L_570F                  ; 56C9   0004 0154 030F
        BIDECLE $9320                           ; 56CC   0020 0093
        DECLE   $0004                           ; 56CE   0004

        ANDR    R4,     R0                      ; 56CF   01A0
        MOVR    R7,     R1                      ; 56D0   00B9
        DECR    R5                              ; 56D1   0015

L_56D2:
        JSR     R5,     L_5243                  ; 56D2   0004 0150 0243
        DECLE   $004E                           ; 56D5   004E
L_56D6:
        MVII    #$02C8, R4                      ; 56D6   02BC 02C8
        MVII    #$0028, R0                      ; 56D8   02B8 0028

        JSR     R5,     X_FILL_ZERO             ; 56DA   0004 0114 0338
        JSR     R5,     L_5243                  ; 56DD   0004 0150 0243
        DECLE   $0014                           ; 56E0   0014

        B       L_5682                          ; 56E1   0220 0060

L_56E3:
        PSHR    R5                              ; 56E3   0275
        MVII    #$0020, R0                      ; 56E4   02B8 0020
        B       L_56EA                          ; 56E6   0200 0002

L_56E8:
        PSHR    R5                              ; 56E8   0275
L_56E9:
        CLRR    R0                              ; 56E9   01C0
L_56EA:
        PSHR    R2                              ; 56EA   0272
        MOVR    R0,     R2                      ; 56EB   0082
        PSHR    R4                              ; 56EC   0274
        MOVR    R1,     R4                      ; 56ED   008C
        PULR    R1                              ; 56EE   02B1
L_56EF:
        SDBD                                    ; 56EF   0001
        CMPI    #$AED6, R4                      ; 56F0   037C 00D6 00AE
        BGE     L_56F9                          ; 56F3   020D 0004

        JSR     R5,     L_618C                  ; 56F5   0004 0160 018C

        INCR    R7                              ; 56F8   000F

L_56F9:
        MVI@    R4,     R0                      ; 56F9   02A0
L_56FA:
        SUBI    #$0020, R0                      ; 56FA   0338 0020
        BMI     L_570A                          ; 56FC   020B 000C

        CMPI    #$0041, R0                      ; 56FE   0378 0041
        BLT     L_5703                          ; 5700   0205 0001

        SUBR    R2,     R0                      ; 5702   0110
L_5703:
        SLL     R0,     2                       ; 5703   004C
        SLL     R0,     1                       ; 5704   0048
        XORR    R3,     R0                      ; 5705   01D8
        MVO@    R0,     R1                      ; 5706   0248
        INCR    R1                              ; 5707   0009
        B       L_56EF                          ; 5708   0220 001A

L_570A:
        MOVR    R4,     R2                      ; 570A   00A2
        MOVR    R1,     R4                      ; 570B   008C
        MOVR    R2,     R1                      ; 570C   0091
        PULR    R2                              ; 570D   02B2
L_570E:
        PULR    R7                              ; 570E   02B7

L_570F:
        SDBD                                    ; 570F   0001
        MVI@    R5,     R4                      ; 5710   02AC
        PSHR    R5                              ; 5711   0275

L_5712:
        JSR     R5,     L_618C                  ; 5712   0004 0160 018C

        MOVR    R0,     R3                      ; 5715   0083

L_5716:
        JSR     R5,     L_618C                  ; 5716   0004 0160 018C

        MOVR    R0,     R1                      ; 5719   0081
        ADDI    #$0200, R1                      ; 571A   02F9 0200

L_571C:
        JSR     R5,     L_618C                  ; 571C   0004 0160 018C

        CMPI    #$00FF, R0                      ; 571F   0378 00FF
        BEQ     L_570E                          ; 5721   0224 0014

        CMPI    #$00FE, R0                      ; 5723   0378 00FE
        BEQ     L_5712                          ; 5725   0224 0014

        CMPI    #$00FD, R0                      ; 5727   0378 00FD
        BEQ     L_5716                          ; 5729   0224 0014

        SUBI    #$0020, R0                      ; 572B   0338 0020
        BMI     L_571C                          ; 572D   022B 0012

        SLL     R0,     2                       ; 572F   004C
        SLL     R0,     1                       ; 5730   0048
        XORR    R3,     R0                      ; 5731   01D8
        MVO@    R0,     R1                      ; 5732   0248
        INCR    R1                              ; 5733   0009
        B       L_571C                          ; 5734   0220 0019

L_5736:
        PSHR    R5                              ; 5736   0275
        MVII    #$0205, R3                      ; 5737   02BB 0205
L_5739:
        SDBD                                    ; 5739   0001
        MVII    #$9CAC, R4                      ; 573A   02BC 00AC 009C

        JSR     R5,     L_593A                  ; 573D   0004 0158 013A

        CMPI    #$0295, R3                      ; 5740   037B 0295
        BGT     L_5748                          ; 5742   020E 0004

        MVII    #$020E, R3                      ; 5744   02BB 020E
        B       L_5739                          ; 5746   0220 000E

L_5748:
        MVII    #$0008, R0                      ; 5748   02B8 0008
        MVII    #$0200, R1                      ; 574A   02B9 0200
L_574C:
        MOVR    R7,     R4                      ; 574C   00BC
        ADDI    #$0019, R4                      ; 574D   02FC 0019
        MVII    #$0004, R3                      ; 574F   02BB 0004
L_5751:
        MVI@    R1,     R5                      ; 5751   028D
        SDBD                                    ; 5752   0001
        XORI    #$2000, R5                      ; 5753   03FD 0000 0020
        MVO@    R5,     R1                      ; 5756   024D
        ADD@    R4,     R1                      ; 5757   02E1
        DECR    R3                              ; 5758   0013
        BNEQ    L_5751                          ; 5759   022C 0009

        DECR    R0                              ; 575B   0010
        BNEQ    L_574C                          ; 575C   022C 0011

        MOVR    R7,     R4                      ; 575E   00BC
        ADDI    #$000B, R4                      ; 575F   02FC 000B

        JSR     R5,     L_5939                  ; 5761   0004 0158 0139
        DECLE   $02CB                           ; 5764   02CB

        PULR    R7                              ; 5765   02B7

        DECLE   $0001,  $0009,  $0009,  $0001   ; 5766   0001 0009 0009 0001
        DECLE   $017A,  $018A,  $001D,  $019A   ; 576A   017A 018A 001D 019A
        DECLE   $01AA,  $004D,  $01EA,  $01FA   ; 576E   01AA 004D 01EA 01FA
        DECLE   $001D,  $020A,  $021A,  $004D   ; 5772   001D 020A 021A 004D
        DECLE   $014B,  $01BA,  $001D,  $015B   ; 5776   014B 01BA 001D 015B
        DECLE   $01CA,  $001D,  $016B,  $01DA   ; 577A   01CA 001D 016B 01DA
        DECLE   $002D,  $014C,  $022A,  $001D   ; 577E   002D 014C 022A 001D
        DECLE   $015C,  $023A,  $001D,  $016C   ; 5782   015C 023A 001D 016C
        DECLE   $024A,  $0000                   ; 5786   024A 0000
L_5788:
        PSHR    R5                              ; 5788   0275
        SLR     R0,     2                       ; 5789   0064
        SLR     R0,     1                       ; 578A   0060
        SDBD                                    ; 578B   0001
        MVII    #$9ED9, R4                      ; 578C   02BC 00D9 009E
        ADDR    R0,     R4                      ; 578F   00C4
        MVII    #$000C, R0                      ; 5790   02B8 000C
L_5792:
        MVI@    R4,     R1                      ; 5792   02A1
        ADDI    #$0027, R4                      ; 5793   02FC 0027
        MOVR    R1,     R2                      ; 5795   008A
        ANDI    #$000F, R2                      ; 5796   03BA 000F
        XORR    R2,     R1                      ; 5798   01D1
        SLR     R1,     1                       ; 5799   0061
        SLL     R2,     1                       ; 579A   004A
        SDBD                                    ; 579B   0001
        MVII    #$9EAB, R5                      ; 579C   02BD 00AB 009E
        ADDR    R2,     R5                      ; 579F   00D5
        SDBD                                    ; 57A0   0001
        XOR@    R5,     R1                      ; 57A1   03E9
        MVO@    R1,     R3                      ; 57A2   0259
        ADDI    #$0014, R3                      ; 57A3   02FB 0014
        DECR    R0                              ; 57A5   0010
        BNEQ    L_5792                          ; 57A6   022C 0015
        PULR    R7                              ; 57A8   02B7

L_57A9:
        PSHR    R5                              ; 57A9   0275
        MVI     G_0345, R0                      ; 57AA   0280 0345
        MVI     G_0346, R1                      ; 57AC   0281 0346
        MVO     R0,     G_0346                  ; 57AE   0240 0346
        CMPR    R0,     R1                      ; 57B0   0141
        BEQ     L_5822                          ; 57B1   0204 006F
        BGT     L_57E4                          ; 57B3   020E 002F

        MVII    #$0200, R5                      ; 57B5   02BD 0200
        MVII    #$0201, R4                      ; 57B7   02BC 0201
        CLRR    R2                              ; 57B9   01D2
L_57BA:
        CLRR    R3                              ; 57BA   01DB
        INCR    R3                              ; 57BB   000B
L_57BC:
        MVI@    R4,     R0                      ; 57BC   02A0
        MVO@    R0,     R5                      ; 57BD   0268
        NOP                                     ; 57BE   0034
        MVI@    R4,     R0                      ; 57BF   02A0
        MVO@    R0,     R5                      ; 57C0   0268
        NOP                                     ; 57C1   0034
        MVI@    R4,     R0                      ; 57C2   02A0
        MVO@    R0,     R5                      ; 57C3   0268
        NOP                                     ; 57C4   0034
        MVI@    R4,     R0                      ; 57C5   02A0
        MVO@    R0,     R5                      ; 57C6   0268
        NOP                                     ; 57C7   0034
        MVI@    R4,     R0                      ; 57C8   02A0
        MVO@    R0,     R5                      ; 57C9   0268
        NOP                                     ; 57CA   0034
        MVI@    R4,     R0                      ; 57CB   02A0
        MVO@    R0,     R5                      ; 57CC   0268
        NOP                                     ; 57CD   0034
        MVI@    R4,     R0                      ; 57CE   02A0
        MVO@    R0,     R5                      ; 57CF   0268
        NOP                                     ; 57D0   0034
        MVI@    R4,     R0                      ; 57D1   02A0
        MVO@    R0,     R5                      ; 57D2   0268
        NOP                                     ; 57D3   0034
        MVI@    R4,     R0                      ; 57D4   02A0
        MVO@    R0,     R5                      ; 57D5   0268
        NOP                                     ; 57D6   0034
        MVI@    R4,     R0                      ; 57D7   02A0
        MVO@    R0,     R5                      ; 57D8   0268
        NOP                                     ; 57D9   0034
        NEGR    R3                              ; 57DA   0023
        TSTR    R3                              ; 57DB   009B
        BMI     L_57BC                          ; 57DC   022B 0021

        CMPI    #$02E6, R4                      ; 57DE   037C 02E6
        BLT     L_57BA                          ; 57E0   0225 0027
        B       L_5814                          ; 57E2   0200 0030

L_57E4:
        MVII    #$0212, R5                      ; 57E4   02BD 0212
        MVII    #$0003, R1                      ; 57E6   02B9 0003
L_57E8:
        CLRR    R3                              ; 57E8   01DB
        INCR    R3                              ; 57E9   000B
L_57EA:
        MVI@    R5,     R0                      ; 57EA   02A8
        MVO@    R0,     R5                      ; 57EB   0268
        SUBR    R1,     R5                      ; 57EC   010D
        MVI@    R5,     R0                      ; 57ED   02A8
        MVO@    R0,     R5                      ; 57EE   0268
        SUBR    R1,     R5                      ; 57EF   010D
        MVI@    R5,     R0                      ; 57F0   02A8
        MVO@    R0,     R5                      ; 57F1   0268
        SUBR    R1,     R5                      ; 57F2   010D
        MVI@    R5,     R0                      ; 57F3   02A8
        MVO@    R0,     R5                      ; 57F4   0268
        SUBR    R1,     R5                      ; 57F5   010D
        MVI@    R5,     R0                      ; 57F6   02A8
        MVO@    R0,     R5                      ; 57F7   0268
        SUBR    R1,     R5                      ; 57F8   010D
        MVI@    R5,     R0                      ; 57F9   02A8
        MVO@    R0,     R5                      ; 57FA   0268
        SUBR    R1,     R5                      ; 57FB   010D
        MVI@    R5,     R0                      ; 57FC   02A8
        MVO@    R0,     R5                      ; 57FD   0268
        SUBR    R1,     R5                      ; 57FE   010D
        MVI@    R5,     R0                      ; 57FF   02A8
        MVO@    R0,     R5                      ; 5800   0268
        SUBR    R1,     R5                      ; 5801   010D
        MVI@    R5,     R0                      ; 5802   02A8
        MVO@    R0,     R5                      ; 5803   0268
        SUBR    R1,     R5                      ; 5804   010D
        MVI@    R5,     R0                      ; 5805   02A8
        MVO@    R0,     R5                      ; 5806   0268
        SUBR    R1,     R5                      ; 5807   010D
        NEGR    R3                              ; 5808   0023
        TSTR    R3                              ; 5809   009B
        BMI     L_57EA                          ; 580A   022B 0021

        ADDI    #$0028, R5                      ; 580C   02FD 0028
        CMPI    #$02F0, R5                      ; 580E   037D 02F0
        BLT     L_57E8                          ; 5810   0225 0029

        CLRR    R2                              ; 5812   01D2
        INCR    R2                              ; 5813   000A
L_5814:
        MVII    #$0200, R3                      ; 5814   02BB 0200
        MVI     G_0345, R0                      ; 5816   0280 0345
        TSTR    R2                              ; 5818   0092
        BNEQ    L_581F                          ; 5819   020C 0004

        ADDI    #$0013, R3                      ; 581B   02FB 0013
        ADDI    #$0098, R0                      ; 581D   02F8 0098

L_581F:
        JSR     R5,     L_5788                  ; 581F   0004 0154 0388

L_5822:
        PULR    R7                              ; 5822   02B7

L_5823:
        PSHR    R5                              ; 5823   0275
        MVII    #$0004, R0                      ; 5824   02B8 0004
        MVO     R0,     G_0103                  ; 5826   0240 0103

        JSR     R5,     L_5621                  ; 5828   0004 0154 0221
        DECLE   $0001                           ; 582B   0001

        JSR     R5,     L_6054                  ; 582C   0004 0160 0054

        CLRR    R0                              ; 582F   01C0
        MVO     R0,     G_01AE                  ; 5830   0240 01AE
        INCR    R0                              ; 5832   0008
        MVO     R0,     G_01AA                  ; 5833   0240 01AA
        MVO     R0,     G_01AB                  ; 5835   0240 01AB
        MVO     R0,     G_01AC                  ; 5837   0240 01AC
        MVO     R0,     G_01AD                  ; 5839   0240 01AD
        SDBD                                    ; 583B   0001
        MVII    #$2BCE, R0                      ; 583C   02B8 00CE 002B
        MVO     R0,     G_0343                  ; 583F   0240 0343
        MVII    #$000E, R0                      ; 5841   02B8 000E
        MVO     R0,     G_0134                  ; 5843   0240 0134
        MVI     G_0345, R0                      ; 5845   0280 0345
        MVII    #$0200, R3                      ; 5847   02BB 0200
        MVII    #$0014, R1                      ; 5849   02B9 0014
L_584B:
        PSHR    R1                              ; 584B   0271
        PSHR    R3                              ; 584C   0273
        PSHR    R0                              ; 584D   0270

        JSR     R5,     L_5788                  ; 584E   0004 0154 0388

        PULR    R0                              ; 5851   02B0
        ADDI    #$0008, R0                      ; 5852   02F8 0008
        PULR    R3                              ; 5854   02B3
        INCR    R3                              ; 5855   000B
        PULR    R1                              ; 5856   02B1
        DECR    R1                              ; 5857   0011
        BNEQ    L_584B                          ; 5858   022C 000E
        PULR    R7                              ; 585A   02B7

L_585B:
        PSHR    R5                              ; 585B   0275
        B       L_586A                          ; 585C   0200 000C

L_585E:
        PSHR    R5                              ; 585E   0275

        JSR     R5,     L_5CB3                  ; 585F   0004 015C 00B3

        MVII    #$0005, R3                      ; 5862   02BB 0005
        CMPI    #$015D, R2                      ; 5864   037A 015D
        BEQ     L_586A                          ; 5866   0204 0002

        MVII    #$0001, R3                      ; 5868   02BB 0001
L_586A:
        PSHR    R0                              ; 586A   0270

        JSR     R5,     L_587F                  ; 586B   0004 0158 007F

        ADDI    #$0008, R4                      ; 586E   02FC 0008

        JSR     R5,     L_6086                  ; 5870   0004 0160 0086

        SARC    R0,     1                       ; 5873   0078
        ADCR    R0                              ; 5874   0028
        SUBR    R0,     R4                      ; 5875   0104

        JSR     R5,     L_56E3                  ; 5876   0004 0154 02E3

        MVII    #$000E, R0                      ; 5879   02B8 000E
        MVO     R0,     G_01B1                  ; 587B   0240 01B1
        PULR    R0                              ; 587D   02B0
        PULR    R7                              ; 587E   02B7

L_587F:
        PSHR    R5                              ; 587F   0275

        JSR     R5,     L_588E                  ; 5880   0004 0158 008E

        PSHR    R4                              ; 5883   0274
        MVII    #$000F, R0                      ; 5884   02B8 000F

        JSR     R5,     X_FILL_ZERO             ; 5886   0004 0114 0338

        CLRR    R0                              ; 5889   01C0
        MVO     R0,     G_01B1                  ; 588A   0240 01B1
        PULR    R4                              ; 588C   02B4
        PULR    R7                              ; 588D   02B7

L_588E:
        PSHR    R5                              ; 588E   0275
        MVII    #$02DE, R4                      ; 588F   02BC 02DE
        MVI     G_0345, R5                      ; 5891   0285 0345
        CMPI    #$0007, R5                      ; 5893   037D 0007
        BLE     L_58A8                          ; 5895   0206 0011

        CMPI    #$000F, R5                      ; 5897   037D 000F
        BLE     L_58A9                          ; 5899   0206 000E

        CMPI    #$0016, R5                      ; 589B   037D 0016
        BLE     L_58AA                          ; 589D   0206 000B

        CMPI    #$009F, R5                      ; 589F   037D 009F
        BGE     L_58AC                          ; 58A1   020D 0009

        CMPI    #$0097, R5                      ; 58A3   037D 0097
        BGE     L_58AD                          ; 58A5   020D 0006
        PULR    R7                              ; 58A7   02B7

L_58A8:
        INCR    R4                              ; 58A8   000C
L_58A9:
        INCR    R4                              ; 58A9   000C
L_58AA:
        INCR    R4                              ; 58AA   000C
        PULR    R7                              ; 58AB   02B7

L_58AC:
        DECR    R4                              ; 58AC   0014
L_58AD:
        DECR    R4                              ; 58AD   0014
        PULR    R7                              ; 58AE   02B7

L_58AF:
        PSHR    R5                              ; 58AF   0275
        MVII    #$0005, R0                      ; 58B0   02B8 0005
        MVO     R0,     G_0138                  ; 58B2   0240 0138
        MVII    #$0004, R0                      ; 58B4   02B8 0004
        MVO     R0,     G_0103                  ; 58B6   0240 0103

        JSR     R5,     L_5621                  ; 58B8   0004 0154 0221
        DECLE   $0002                           ; 58BB   0002

        MVII    #$000C, R0                      ; 58BC   02B8 000C
        MVO     R0,     G_0134                  ; 58BE   0240 0134
        SDBD                                    ; 58C0   0001
        MVII    #$9D7E, R4                      ; 58C1   02BC 007E 009D

        JSR     R5,     L_5939                  ; 58C4   0004 0158 0139
        DECLE   $0204                           ; 58C7   0204

        MVI     G_0136, R0                      ; 58C8   0280 0136
        MVII    #$0002, R1                      ; 58CA   02B9 0002
        SDBD                                    ; 58CC   0001
        MVII    #$2602, R3                      ; 58CD   02BB 0002 0026
        MVII    #$021E, R4                      ; 58D0   02BC 021E

        JSR     R5,     X_PRNUM_RGT             ; 58D2   0004 0118 00C5

        MVII    #$0319, R4                      ; 58D5   02BC 0319
        MOVR    R7,     R5                      ; 58D7   00BD
        ADDI    #$0041, R5                      ; 58D8   02FD 0041
L_58DA:
        MVI@    R5,     R0                      ; 58DA   02A8
        MVO@    R0,     R4                      ; 58DB   0260
        CMPI    #$0329, R4                      ; 58DC   037C 0329
        BLT     L_58DA                          ; 58DE   0225 0005

L_58E0:
        SDBD                                    ; 58E0   0001
        MVI@    R5,     R0                      ; 58E1   02A8
        MVO@    R0,     R4                      ; 58E2   0260
        CMPI    #$0331, R4                      ; 58E3   037C 0331
        BLT     L_58E0                          ; 58E5   0225 0006

        MVII    #$0331, R4                      ; 58E7   02BC 0331
        SDBD                                    ; 58E9   0001
        MVII    #$9B60, R0                      ; 58EA   02B8 0060 009B
        MVII    #$0010, R1                      ; 58ED   02B9 0010
L_58EF:
        MVO@    R0,     R4                      ; 58EF   0260
        ADDR    R1,     R0                      ; 58F0   00C8
        CMPI    #$0336, R4                      ; 58F1   037C 0336
        BLE     L_58EF                          ; 58F3   0226 0005

        MVII    #$0001, R0                      ; 58F5   02B8 0001
        MVO     R0,     G_01A4                  ; 58F7   0240 01A4
        MVO     R0,     G_01A6                  ; 58F9   0240 01A6
        MVO     R0,     G_01A3                  ; 58FB   0240 01A3
        MVO     R0,     G_01A5                  ; 58FD   0240 01A5

        JSR     R5,     L_55FF                  ; 58FF   0004 0154 01FF
        BIDECLE $1000                           ; 5902   0000 0010

        MOVR    R7,     R4                      ; 5904   00BC
        ADDI    #$000B, R4                      ; 5905   02FC 000B

        JSR     R5,     L_5939                  ; 5907   0004 0158 0139
        DECLE   $02E8                           ; 590A   02E8

        CLRR    R3                              ; 590B   01DB
        DECR    R3                              ; 590C   0013
        J       L_5450                          ; 590D   0004 0354 0050

        DECLE   $0274,  $0284,  $0294,  $02A4   ; 5910   0274 0284 0294 02A4
        DECLE   $02B4,  $02C4,  $02D4,  $02E0   ; 5914   02B4 02C4 02D4 02E0
        DECLE   $0000                           ; 5918   0000

        MVO@    R0,     R2                      ; 5919   0250
        MVO@    R0,     R2                      ; 591A   0250
        MVO     R3,     .BTAB.53                ; 591B   0243 0253
        MVO@    R1,     R1                      ; 591D   0249
        MVO     R7,     .BTAB.60                ; 591E   0247 0260
        MVO@    R0,     R3                      ; 5920   0258
        TSTR    R3                              ; 5921   009B
        MOVR    R4,     R2                      ; 5922   00A2
        MOVR    R5,     R4                      ; 5923   00AC
        MOVR    R4,     R3                      ; 5924   00A3
        MOVR    R5,     R7                      ; 5925   00AF

        ADDR    R0,     R6                      ; 5926   00C6
        MOVR    R4,     R3                      ; 5927   00A3
        MOVR    R3,     R6                      ; 5928   009E
        MOVR    R0,     R1                      ; 5929   0081
        INCR    R1                              ; 592A   0009
        TSTR    R2                              ; 592B   0092
        INCR    R1                              ; 592C   0009
        MOVR    R4,     R6                      ; 592D   00A6
        INCR    R1                              ; 592E   0009
        TSTR    R6                              ; 592F   00B6
        INCR    R1                              ; 5930   0009
        ADDR    R0,     R4                      ; 5931   00C4
        COMR    R1                              ; 5932   0019
        ADDR    R2,     R4                      ; 5933   00D4
        COMR    R1                              ; 5934   0019
        ADDR    R4,     R3                      ; 5935   00E3
        INCR    R1                              ; 5936   0009
        ADDR    R6,     R0                      ; 5937   00F0
        INCR    R1                              ; 5938   0009
L_5939:
        MVI@    R5,     R3                      ; 5939   02AB
L_593A:
        PSHR    R5                              ; 593A   0275
L_593B:
        SDBD                                    ; 593B   0001
        CMPI    #$9000, R4                      ; 593C   037C 0000 0090
        BNC     L_5945                          ; 593F   0209 0004

        JSR     R5,     L_6187                  ; 5941   0004 0160 0187

        INCR    R7                              ; 5944   000F

L_5945:
        MVI@    R4,     R0                      ; 5945   02A0
L_5946:
        TSTR    R0                              ; 5946   0080
        BEQ     L_570E                          ; 5947   0224 023A

        MOVR    R0,     R1                      ; 5949   0081
        ANDI    #$000F, R0                      ; 594A   03B8 000F
        XORR    R0,     R1                      ; 594C   01C1
        CMPI    #$000D, R0                      ; 594D   0378 000D
        BNEQ    L_5956                          ; 594F   020C 0005

        SLR     R1,     2                       ; 5951   0065
        SLR     R1,     2                       ; 5952   0065
        ADDR    R1,     R3                      ; 5953   00CB
        B       L_593B                          ; 5954   0220 001A

L_5956:
        SDBD                                    ; 5956   0001
        MVII    #$9E91, R5                      ; 5957   02BD 0091 009E
        SLL     R0,     1                       ; 595A   0048
        ADDR    R0,     R5                      ; 595B   00C5
        SLR     R1,     1                       ; 595C   0061
        SDBD                                    ; 595D   0001
        XOR@    R5,     R1                      ; 595E   03E9
        MVO@    R1,     R3                      ; 595F   0259
        INCR    R3                              ; 5960   000B
        B       L_593B                          ; 5961   0220 0027

L_5963:
        PSHR    R5                              ; 5963   0275
        MVII    #$0349, R5                      ; 5964   02BD 0349
        CMPI    #$015D, R4                      ; 5966   037C 015D
        BEQ     L_596C                          ; 5968   0204 0002

        ADDI    #$0002, R5                      ; 596A   02FD 0002
L_596C:
        MVO@    R0,     R5                      ; 596C   0268
        MVO@    R1,     R5                      ; 596D   0269
        MVI@    R4,     R5                      ; 596E   02A5
        ANDI    #$00E7, R5                      ; 596F   03BD 00E7
        XORI    #$0018, R5                      ; 5971   03FD 0018
        DECR    R4                              ; 5973   0014
        MVO@    R5,     R4                      ; 5974   0265
        MOVR    R4,     R5                      ; 5975   00A5
        ADDI    #$0003, R5                      ; 5976   02FD 0003
        SDBD                                    ; 5978   0001
        MVI@    R5,     R2                      ; 5979   02AA
        SDBD                                    ; 597A   0001
        SUB@    R5,     R2                      ; 597B   032A
        SUBI    #$0004, R5                      ; 597C   033D 0004
        MVO@    R2,     R5                      ; 597E   026A
        SWAP    R2,     1                       ; 597F   0042
        MVO@    R2,     R5                      ; 5980   026A
        CLRR    R2                              ; 5981   01D2
        MVO@    R2,     R5                      ; 5982   026A
        MVO@    R2,     R5                      ; 5983   026A
        PSHR    R3                              ; 5984   0273
        ADDI    #$0001, R4                      ; 5985   02FC 0001

        JSR     R5,     L_59B5                  ; 5987   0004 0158 01B5

        PULR    R1                              ; 598A   02B1
        PSHR    R2                              ; 598B   0272
        MOVR    R1,     R2                      ; 598C   008A
        MOVR    R0,     R1                      ; 598D   0081

        JSR     R5,     X_DIVR                  ; 598E   0004 011C 01F8

        SDBD                                    ; 5991   0001
        ANDI    #$FFFE, R0                      ; 5992   03B8 00FE 00FF
        MOVR    R0,     R2                      ; 5995   0082
        PULR    R1                              ; 5996   02B1
        PSHR    R2                              ; 5997   0272

        JSR     R5,     X_DIVR                  ; 5998   0004 011C 01F8

        PULR    R2                              ; 599B   02B2
        ADDI    #$0002, R4                      ; 599C   02FC 0002
        MVO@    R0,     R4                      ; 599E   0260
        SWAP    R0,     1                       ; 599F   0040
        MVO@    R0,     R4                      ; 59A0   0260
        MOVR    R3,     R1                      ; 59A1   0099
        PSHR    R2                              ; 59A2   0272

        JSR     R5,     X_DIVR                  ; 59A3   0004 011C 01F8

        PULR    R2                              ; 59A6   02B2
        MVO@    R0,     R4                      ; 59A7   0260
        SWAP    R0,     1                       ; 59A8   0040
        MVO@    R0,     R4                      ; 59A9   0260
        SLR     R2,     1                       ; 59AA   0062
        MOVR    R2,     R0                      ; 59AB   0090
        MVII    #$0023, R1                      ; 59AC   02B9 0023

        JSR     R5,     X_MPY                   ; 59AE   0004 011C 01DC

        MVO@    R2,     R4                      ; 59B1   0262
        SWAP    R2,     1                       ; 59B2   0042
        MVO@    R2,     R4                      ; 59B3   0262
        PULR    R7                              ; 59B4   02B7

L_59B5:
        SDBD                                    ; 59B5   0001
        MVI@    R4,     R2                      ; 59B6   02A2
        SDBD                                    ; 59B7   0001
        MVI@    R4,     R3                      ; 59B8   02A3
        PSHR    R5                              ; 59B9   0275
        SUBR    R2,     R0                      ; 59BA   0110
        MOVR    R0,     R2                      ; 59BB   0082
        BGE     L_59BF                          ; 59BC   020D 0001

        NEGR    R0                              ; 59BE   0020
L_59BF:
        SUBR    R3,     R1                      ; 59BF   0119
        MOVR    R1,     R3                      ; 59C0   008B
        BGE     L_59C4                          ; 59C1   020D 0001

        NEGR    R1                              ; 59C3   0021
L_59C4:
        CMPR    R0,     R1                      ; 59C4   0141
        BMI     L_59C9                          ; 59C5   020B 0002

        SLR     R0,     2                       ; 59C7   0064
        INCR    R7                              ; 59C8   000F

L_59C9:
        SLR     R1,     2                       ; 59C9   0065
L_59CA:
        ADDR    R1,     R0                      ; 59CA   00C8
        PULR    R7                              ; 59CB   02B7

L_59CC:
        JSR     R5,     L_6054                  ; 59CC   0004 0160 0054

        MVO     R1,     G_0103                  ; 59CF   0241 0103
        MVO     R1,     G_0142                  ; 59D1   0241 0142

        JSR     R5,     L_606E                  ; 59D3   0004 0160 006E

        MVII    #$0001, R0                      ; 59D6   02B8 0001
        MVO     R0,     G_0138                  ; 59D8   0240 0138

        JSR     R5,     L_570F                  ; 59DA   0004 0154 030F
        BIDECLE $96F4                           ; 59DD   00F4 0096

        MOVR    R7,     R2                      ; 59DF   00BA
        ADDI    #$01F3, R2                      ; 59E0   02FA 01F3
        J       L_5BBA                          ; 59E2   0004 0358 03BA

L_59E5:
        JSR     R5,     L_6054                  ; 59E5   0004 0160 0054
        JSR     R5,     L_605C                  ; 59E8   0004 0160 005C

        MVO     R1,     G_0172                  ; 59EB   0241 0172
        MVO     R1,     G_0195                  ; 59ED   0241 0195
        MVII    #$0002, R0                      ; 59EF   02B8 0002
        MVO     R0,     G_0138                  ; 59F1   0240 0138

        JSR     R5,     L_570F                  ; 59F3   0004 0154 030F
        BIDECLE $9584                           ; 59F6   0084 0095

        MOVR    R7,     R2                      ; 59F8   00BA
        ADDI    #$01E1, R2                      ; 59F9   02FA 01E1
        J       L_5BBA                          ; 59FB   0004 0358 03BA

L_59FE:
        MVII    #$001F, R0                      ; 59FE   02B8 001F

        JSR     R5,     L_60CB                  ; 5A00   0004 0160 00CB

        MVII    #$0003, R0                      ; 5A03   02B8 0003
        MVO     R0,     G_0138                  ; 5A05   0240 0138
        CLRR    R0                              ; 5A07   01C0
        MVO     R0,     G_0103                  ; 5A08   0240 0103

        JSR     R5,     L_6067                  ; 5A0A   0004 0160 0067
        JSR     R5,     L_5621                  ; 5A0D   0004 0154 0221
        DECLE   $0000                           ; 5A10   0000

        JSR     R5,     L_6051                  ; 5A11   0004 0160 0051

        MVII    #$0001, R0                      ; 5A14   02B8 0001
        MVO     R0,     G_0343                  ; 5A16   0240 0343

        JSR     R5,     L_640A                  ; 5A18   0004 0164 000A
        JSR     R5,     L_606E                  ; 5A1B   0004 0160 006E

        MOVR    R7,     R2                      ; 5A1E   00BA
        ADDI    #$0016, R2                      ; 5A1F   02FA 0016

        JSR     R5,     L_6139                  ; 5A21   0004 0160 0139

        MVII    #$0001, R1                      ; 5A24   02B9 0001
        MVO     R1,     G_0180                  ; 5A26   0241 0180

        JSR     R5,     L_5736                  ; 5A28   0004 0154 0336

        MVII    #$015D, R2                      ; 5A2B   02BA 015D

        JSR     R5,     L_5BFB                  ; 5A2D   0004 0158 03FB

        MVII    #$0180, R2                      ; 5A30   02BA 0180
        J       L_5BFC                          ; 5A32   0004 0358 03FC

        DECLE   $007B,  $0037,  $00C5,  $0037   ; 5A35   007B 0037 00C5 0037
L_5A39:
        MVII    #$0007, R0                      ; 5A39   02B8 0007
        MVO     R0,     G_0138                  ; 5A3B   0240 0138

        JSR     R5,     L_6054                  ; 5A3D   0004 0160 0054
        JSR     R5,     L_5CC8                  ; 5A40   0004 015C 00C8
        DECLE   $0005,  $0006,  $0252           ; 5A43   0005 0006 0252

        JSR     R5,     L_5CC8                  ; 5A46   0004 015C 00C8
        DECLE   $0001,  $0006,  $0261           ; 5A49   0001 0006 0261

        MVII    #$00FF, R0                      ; 5A4C   02B8 00FF
        MVO     R0,     G_017B                  ; 5A4E   0240 017B
        MVO     R0,     G_019E                  ; 5A50   0240 019E

        JSR     R5,     L_570F                  ; 5A52   0004 0154 030F
        BIDECLE $9748                           ; 5A55   0048 0097

        MOVR    R7,     R2                      ; 5A57   00BA
        ADDI    #$0187, R2                      ; 5A58   02FA 0187
        J       L_5BBA                          ; 5A5A   0004 0358 03BA

L_5A5D:
        MVII    #$002D, R0                      ; 5A5D   02B8 002D
        MVO     R0,     G_01A9                  ; 5A5F   0240 01A9
        CLRR    R0                              ; 5A61   01C0
        MVO     R0,     G_0136                  ; 5A62   0240 0136
        MVII    #$0004, R0                      ; 5A64   02B8 0004
        MVO     R0,     G_0138                  ; 5A66   0240 0138

L_5A68:
        JSR     R5,     L_6054                  ; 5A68   0004 0160 0054

        MVO     R1,     G_0103                  ; 5A6B   0241 0103

        JSR     R5,     L_606E                  ; 5A6D   0004 0160 006E
        JSR     R5,     L_55FF                  ; 5A70   0004 0154 01FF
        BIDECLE $0030                           ; 5A73   0030 0000

        MVII    #$0005, R3                      ; 5A75   02BB 0005
        MVI     G_0339, R2                      ; 5A77   0282 0339
        CMPI    #$015D, R2                      ; 5A79   037A 015D
        BEQ     L_5A7F                          ; 5A7B   0204 0002

        MVII    #$0001, R3                      ; 5A7D   02BB 0001
L_5A7F:
        MVI     G_0137, R4                      ; 5A7F   0284 0137
        CMPI    #$0000, R4                      ; 5A81   037C 0000
        BEQ     L_5A8C                          ; 5A83   0204 0007

        MVII    #$0205, R4                      ; 5A85   02BC 0205

        JSR     R5,     L_5B9F                  ; 5A87   0004 0158 039F

        B       L_5AAD                          ; 5A8A   0200 0021

L_5A8C:
        MVII    #$020A, R4                      ; 5A8C   02BC 020A

        JSR     R5,     L_6990                  ; 5A8E   0004 0168 0190
        DECLE   $0000                           ; 5A91   0000

        MOVR    R1,     R5                      ; 5A92   008D
        SDBD                                    ; 5A93   0001
        MVI@    R5,     R1                      ; 5A94   02A9

        JSR     R5,     L_6086                  ; 5A95   0004 0160 0086

        INCR    R0                              ; 5A98   0008
        PSHR    R1                              ; 5A99   0271
        PSHR    R0                              ; 5A9A   0270
        MOVR    R5,     R1                      ; 5A9B   00A9

        JSR     R5,     L_6086                  ; 5A9C   0004 0160 0086

        ADD@    R6,     R0                      ; 5A9F   02F0
        SARC    R0,     1                       ; 5AA0   0078
        ADCR    R0                              ; 5AA1   0028
        SUBR    R0,     R4                      ; 5AA2   0104
        MOVR    R1,     R2                      ; 5AA3   008A
        PULR    R1                              ; 5AA4   02B1

        JSR     R5,     L_56E8                  ; 5AA5   0004 0154 02E8

        MOVR    R2,     R1                      ; 5AA8   0091
        INCR    R4                              ; 5AA9   000C

        JSR     R5,     L_56E8                  ; 5AAA   0004 0154 02E8

L_5AAD:
        MVI     G_0138, R0                      ; 5AAD   0280 0138
        CMPI    #$0004, R0                      ; 5AAF   0378 0004
        BEQ     L_5ACC                          ; 5AB1   0204 0019

        MOVR    R7,     R4                      ; 5AB3   00BC
        ADDI    #$0013, R4                      ; 5AB4   02FC 0013

        JSR     R5,     L_5939                  ; 5AB6   0004 0158 0139
        DECLE   $0230                           ; 5AB9   0230

        MVII    #$0003, R3                      ; 5ABA   02BB 0003
        MVII    #$0218, R4                      ; 5ABC   02BC 0218
        SDBD                                    ; 5ABE   0001
        MVII    #$9A54, R1                      ; 5ABF   02B9 0054 009A

        JSR     R5,     L_56E8                  ; 5AC2   0004 0154 02E8

        B       L_5AD6                          ; 5AC5   0200 000F

        DECLE   $0084,  $0094,  $00A4,  $00F0   ; 5AC7   0084 0094 00A4 00F0
        DECLE   $0000                           ; 5ACB   0000
L_5ACC:
        MOVR    R7,     R4                      ; 5ACC   00BC
        ADDI    #$0049, R4                      ; 5ACD   02FC 0049

        JSR     R5,     L_5939                  ; 5ACF   0004 0158 0139
        DECLE   $0216                           ; 5AD2   0216

        JSR     R5,     L_5C93                  ; 5AD3   0004 015C 0093

L_5AD6:
        MVI     G_017B, R0                      ; 5AD6   0280 017B
        MVI     G_0339, R3                      ; 5AD8   0283 0339
        CMPI    #$015D, R3                      ; 5ADA   037B 015D
        BEQ     L_5AE0                          ; 5ADC   0204 0002

        MVI     G_019E, R0                      ; 5ADE   0280 019E
L_5AE0:
        MVII    #$0007, R3                      ; 5AE0   02BB 0007
        MVI     G_0138, R1                      ; 5AE2   0281 0138
        CMPI    #$0004, R1                      ; 5AE4   0379 0004
        BEQ     L_5AEA                          ; 5AE6   0204 0002

        MVII    #$0003, R3                      ; 5AE8   02BB 0003

L_5AEA:
        JSR     R5,     L_5CCA                  ; 5AEA   0004 015C 00CA
        DECLE   $023C                           ; 5AED   023C

        MVI     G_0339, R4                      ; 5AEE   0284 0339
        MVII    #$0121, R2                      ; 5AF0   02BA 0121
        MVII    #$0005, R3                      ; 5AF2   02BB 0005
        CMPI    #$015D, R4                      ; 5AF4   037C 015D
        BEQ     L_5AFC                          ; 5AF6   0204 0004

        MVII    #$012A, R2                      ; 5AF8   02BA 012A
        MVII    #$0001, R3                      ; 5AFA   02BB 0001
L_5AFC:
        MVII    #$023E, R4                      ; 5AFC   02BC 023E
L_5AFE:
        MVII    #$0012, R0                      ; 5AFE   02B8 0012
        PSHR    R4                              ; 5B00   0274

        JSR     R5,     X_FILL_ZERO             ; 5B01   0004 0114 0338

        PULR    R4                              ; 5B04   02B4
        MVI@    R2,     R0                      ; 5B05   0290
        TSTR    R0                              ; 5B06   0080
        BEQ     L_5B0E                          ; 5B07   0204 0005

        PSHR    R4                              ; 5B09   0274

        JSR     R5,     L_5CAC                  ; 5B0A   0004 015C 00AC

        PULR    R4                              ; 5B0D   02B4
L_5B0E:
        INCR    R2                              ; 5B0E   000A
        ADDI    #$0014, R4                      ; 5B0F   02FC 0014
        CMPI    #$02DE, R4                      ; 5B11   037C 02DE
        BLE     L_5AFE                          ; 5B13   0226 0016
        PULR    R7                              ; 5B15   02B7

        JSR     R4,     .EXEC.424               ; 5B16   0004 0014 0024
        DECLE   $0034,  $00B0,  $00C0,  $0044   ; 5B19   0034 00B0 00C0 0044
        DECLE   $0054,  $0064,  $0074,  $00D0   ; 5B1D   0054 0064 0074 00D0
        DECLE   $00E0,  $0084,  $0094,  $00A4   ; 5B21   00E0 0084 0094 00A4
        DECLE   $00F0,  $0000                   ; 5B25   00F0 0000
L_5B27:
        JSR     R5,     L_6054                  ; 5B27   0004 0160 0054

        MVO     R1,     G_0103                  ; 5B2A   0241 0103
        MVO     R1,     G_0179                  ; 5B2C   0241 0179
        MVO     R1,     G_019C                  ; 5B2E   0241 019C
        MVO     R1,     G_0140                  ; 5B30   0241 0140

        JSR     R5,     L_6067                  ; 5B32   0004 0160 0067
        JSR     R5,     L_606E                  ; 5B35   0004 0160 006E

        MVII    #$000A, R0                      ; 5B38   02B8 000A
        MVO     R0,     G_0138                  ; 5B3A   0240 0138
        MVII    #$0003, R3                      ; 5B3C   02BB 0003
        MOVR    R7,     R2                      ; 5B3E   00BA
        ADDI    #$00A4, R2                      ; 5B3F   02FA 00A4

        JSR     R5,     L_5BB9                  ; 5B41   0004 0158 03B9
        JSR     R5,     L_5CC9                  ; 5B44   0004 015C 00C9
        DECLE   $0003,  $0266                   ; 5B47   0003 0266

        PULR    R7                              ; 5B49   02B7

L_5B4A:
        PSHR    R5                              ; 5B4A   0275
        MVII    #$0003, R3                      ; 5B4B   02BB 0003
        MOVR    R7,     R2                      ; 5B4D   00BA
        ADDI    #$00A3, R2                      ; 5B4E   02FA 00A3

        JSR     R5,     L_5BB9                  ; 5B50   0004 0158 03B9

        MVI     G_0137, R0                      ; 5B53   0280 0137
        TSTR    R0                              ; 5B55   0080
        BNEQ    L_5B61                          ; 5B56   020C 0009

        MVII    #$0269, R4                      ; 5B58   02BC 0269
L_5B5A:
        SDBD                                    ; 5B5A   0001
        MVII    #$9A88, R1                      ; 5B5B   02B9 0088 009A
        J       L_56E9                          ; 5B5E   0004 0354 02E9

L_5B61:
        MVII    #$026B, R4                      ; 5B61   02BC 026B
        SDBD                                    ; 5B63   0001
        MVII    #$9B6C, R1                      ; 5B64   02B9 006C 009B
        MVI     G_0136, R0                      ; 5B67   0280 0136
        CMPI    #$0001, R0                      ; 5B69   0378 0001
        BEQ     L_5B72                          ; 5B6B   0204 0005

        SDBD                                    ; 5B6D   0001
        MVII    #$9B84, R1                      ; 5B6E   02B9 0084 009B
        DECR    R4                              ; 5B71   0014

L_5B72:
        JSR     R5,     L_56E8                  ; 5B72   0004 0154 02E8

        MVII    #$0291, R4                      ; 5B75   02BC 0291
        B       L_5B5A                          ; 5B77   0220 001E

L_5B79:
        PSHR    R5                              ; 5B79   0275

        JSR     R5,     L_6054                  ; 5B7A   0004 0160 0054

        MVII    #$0003, R3                      ; 5B7D   02BB 0003
        MOVR    R7,     R2                      ; 5B7F   00BA
        ADDI    #$0075, R2                      ; 5B80   02FA 0075

        JSR     R5,     L_5BB9                  ; 5B82   0004 0158 03B9

        DECR    R4                              ; 5B85   0014
        MVII    #$0063, R1                      ; 5B86   02B9 0063
        MVO@    R1,     R4                      ; 5B88   0261
        MVI     G_0339, R2                      ; 5B89   0282 0339
        MVII    #$0005, R3                      ; 5B8B   02BB 0005
        CMPI    #$015D, R2                      ; 5B8D   037A 015D
        BEQ     L_5B93                          ; 5B8F   0204 0002

        MVII    #$0001, R3                      ; 5B91   02BB 0001
L_5B93:
        MVI     G_0137, R1                      ; 5B93   0281 0137
        TSTR    R1                              ; 5B95   0089
        BNEQ    L_5B9C                          ; 5B96   020C 0004

        MVII    #$0296, R4                      ; 5B98   02BC 0296
        B       L_5C78                          ; 5B9A   0200 00DC

L_5B9C:
        MVII    #$0291, R4                      ; 5B9C   02BC 0291
        INCR    R7                              ; 5B9E   000F

L_5B9F:
        PSHR    R5                              ; 5B9F   0275
L_5BA0:
        MVII    #$0088, R2                      ; 5BA0   02BA 0088
        MVII    #$0005, R3                      ; 5BA2   02BB 0005
        MVI     G_0339, R5                      ; 5BA4   0285 0339
        CMPI    #$015D, R5                      ; 5BA6   037D 015D
        BEQ     L_5BAE                          ; 5BA8   0204 0004

        ADDI    #$0008, R2                      ; 5BAA   02FA 0008
        MVII    #$0001, R3                      ; 5BAC   02BB 0001
L_5BAE:
        SDBD                                    ; 5BAE   0001
        MVII    #$9BA0, R1                      ; 5BAF   02B9 00A0 009B

        JSR     R5,     L_56E8                  ; 5BB2   0004 0154 02E8

        INCR    R4                              ; 5BB5   000C
        XORR    R2,     R3                      ; 5BB6   01D3
        MVO@    R3,     R4                      ; 5BB7   0263
        PULR    R7                              ; 5BB8   02B7

L_5BB9:
        PSHR    R5                              ; 5BB9   0275
L_5BBA:
        MVI@    R2,     R4                      ; 5BBA   0294
        INCR    R2                              ; 5BBB   000A
L_5BBC:
        MVI@    R2,     R1                      ; 5BBC   0291
        INCR    R2                              ; 5BBD   000A
        TSTR    R1                              ; 5BBE   0089
        BEQ     L_5BD2                          ; 5BBF   0204 0011

        CMPI    #$00F0, R1                      ; 5BC1   0379 00F0
        BGE     L_5BC8                          ; 5BC3   020D 0003

        ADDR    R1,     R4                      ; 5BC5   00CC
        B       L_5BBC                          ; 5BC6   0220 000B

L_5BC8:
        SDBD                                    ; 5BC8   0001
        ADDI    #$9934, R1                      ; 5BC9   02F9 0034 0099

        JSR     R5,     L_56E8                  ; 5BCC   0004 0154 02E8

        INCR    R4                              ; 5BCF   000C
        B       L_5BBC                          ; 5BD0   0220 0015
L_5BD2:
        PULR    R7                              ; 5BD2   02B7

        DECLE   $023E,  $00F0,  $017C,  $01A4   ; 5BD3   023E 00F0 017C 01A4
        DECLE   $0043,  $026C,  $0000,  $0202   ; 5BD7   0043 026C 0000 0202
        DECLE   $00F0,  $017C,  $0190,  $0000   ; 5BDB   00F0 017C 0190 0000
        DECLE   $0215,  $00F0,  $01B8,  $0000   ; 5BDF   0215 00F0 01B8 0000
        DECLE   $0229,  $00F0,  $01E8,  $0190   ; 5BE3   0229 00F0 01E8 0190
        DECLE   $002D,  $0204,  $0154,  $0006   ; 5BE7   002D 0204 0154 0006
        DECLE   $0204,  $013C,  $000A,  $0214   ; 5BEB   0204 013C 000A 0214
        DECLE   $02D0,  $0000,  $0240,  $00F0   ; 5BEF   02D0 0000 0240 00F0
        DECLE   $010C,  $0000,  $0240,  $00F0   ; 5BF3   010C 0000 0240 00F0
        DECLE   $010C,  $001F,  $013C,  $0000   ; 5BF7   010C 001F 013C 0000
L_5BFB:
        PSHR    R5                              ; 5BFB   0275
L_5BFC:
        PSHR    R2                              ; 5BFC   0272
        MVII    #$01A9, R4                      ; 5BFD   02BC 01A9
        CMPI    #$015D, R2                      ; 5BFF   037A 015D
        BEQ     L_5C05                          ; 5C01   0204 0002

        MVII    #$01CC, R4                      ; 5C03   02BC 01CC

L_5C05:
        JSR     R5,     L_6990                  ; 5C05   0004 0168 0190
        DECLE   $0002                           ; 5C08   0002

        PSHR    R1                              ; 5C09   0271
        MOVR    R0,     R1                      ; 5C0A   0081
        SDBD                                    ; 5C0B   0001
        MVII    #$9BF2, R3                      ; 5C0C   02BB 00F2 009B
        MOVR    R1,     R2                      ; 5C0F   008A
        ANDI    #$000F, R2                      ; 5C10   03BA 000F
        XORR    R2,     R1                      ; 5C12   01D1
        SLR     R1,     2                       ; 5C13   0065
        SLR     R1,     2                       ; 5C14   0065
L_5C15:
        PSHR    R1                              ; 5C15   0271
        SLL     R1,     2                       ; 5C16   004D
        ADD@    R6,     R1                      ; 5C17   02F1
        SDBD                                    ; 5C18   0001
        ADDI    #$9BC0, R1                      ; 5C19   02F9 00C0 009B
        MVII    #$0005, R5                      ; 5C1C   02BD 0005
L_5C1E:
        MVI@    R1,     R0                      ; 5C1E   0288
        SWAP    R0,     1                       ; 5C1F   0040
        SLR     R0,     2                       ; 5C20   0064
        SLR     R0,     1                       ; 5C21   0060
        XOR@    R3,     R0                      ; 5C22   03D8
        MVO@    R0,     R4                      ; 5C23   0260
        INCR    R3                              ; 5C24   000B
        INCR    R1                              ; 5C25   0009
        DECR    R5                              ; 5C26   0015
        BNEQ    L_5C1E                          ; 5C27   022C 000A

        SDBD                                    ; 5C29   0001
        CMPI    #$9BF7, R3                      ; 5C2A   037B 00F7 009B
        BGT     L_5C36                          ; 5C2D   020E 0007

        MOVR    R2,     R1                      ; 5C2F   0091
        SDBD                                    ; 5C30   0001
        MVII    #$9BF7, R3                      ; 5C31   02BB 00F7 009B
        B       L_5C15                          ; 5C34   0220 0020

L_5C36:
        PULR    R2                              ; 5C36   02B2
        DECLE   $000A,  $0272,  $02B8,  $0001   ; 5C37   000A 0272 02B8 0001
        DECLE   $0291,  $0004                   ; 5C3B   0291 0004

        ANDR    R4,     R4                      ; 5C3D   01A4
        CMP@    R2,     R3                      ; 5C3E   0353
        PULR    R2                              ; 5C3F   02B2
        MVII    #$0003, R3                      ; 5C40   02BB 0003
L_5C42:
        INCR    R2                              ; 5C42   000A
        DECLE   $0291,  $0272,  $0273,  $01C0   ; 5C43   0291 0272 0273 01C0
        DECLE   $0004                           ; 5C47   0004

        ANDR    R4,     R4                      ; 5C48   01A4
        CMP@    R2,     R3                      ; 5C49   0353
        PULR    R3                              ; 5C4A   02B3
        PULR    R2                              ; 5C4B   02B2
        DECR    R3                              ; 5C4C   0013
        BNEQ    L_5C42                          ; 5C4D   022C 000C

        PULR    R2                              ; 5C4F   02B2
        MVII    #$013D, R4                      ; 5C50   02BC 013D
        CMPI    #$015D, R2                      ; 5C52   037A 015D
        BEQ     L_5C57                          ; 5C54   0204 0001

        INCR    R4                              ; 5C56   000C

L_5C57:
        JSR     R5,     L_6990                  ; 5C57   0004 0168 0190
        DECLE   $000A                           ; 5C5A   000A

        MVO@    R0,     R4                      ; 5C5B   0260
        MVII    #$0004, R0                      ; 5C5C   02B8 0004
        CMPI    #$015D, R2                      ; 5C5E   037A 015D
        BEQ     L_5C63                          ; 5C60   0204 0001

        SLL     R0,     1                       ; 5C62   0048

L_5C63:
        JSR     R5,     L_5601                  ; 5C63   0004 0154 0201

        CLRR    R1                              ; 5C66   01C9
        MVII    #$02A0, R4                      ; 5C67   02BC 02A0
        CMPI    #$015D, R2                      ; 5C69   037A 015D
        BEQ     L_5C70                          ; 5C6B   0204 0003

        INCR    R1                              ; 5C6D   0009
        ADDI    #$000A, R4                      ; 5C6E   02FC 000A

L_5C70:
        JSR     R5,     L_5C89                  ; 5C70   0004 015C 0089

        SUBI    #$0018, R4                      ; 5C73   033C 0018
        SUBR    R1,     R4                      ; 5C75   010C
        MVII    #$0007, R3                      ; 5C76   02BB 0007

L_5C78:
        JSR     R5,     L_6990                  ; 5C78   0004 0168 0190
        DECLE   $0000                           ; 5C7B   0000

        MOVR    R1,     R5                      ; 5C7C   008D
        SDBD                                    ; 5C7D   0001
        MVI@    R5,     R1                      ; 5C7E   02A9
        PSHR    R4                              ; 5C7F   0274

        JSR     R5,     L_5CBE                  ; 5C80   0004 015C 00BE

        PULR    R4                              ; 5C83   02B4
        ADDI    #$0014, R4                      ; 5C84   02FC 0014
        J       L_5CBF                          ; 5C86   0004 035C 00BF

L_5C89:
        PSHR    R5                              ; 5C89   0275
        MVII    #$000A, R0                      ; 5C8A   02B8 000A

        JSR     R5,     X_FILL_ZERO             ; 5C8C   0004 0114 0338

        ADDR    R0,     R4                      ; 5C8F   00C4
        J       .EXEC.739                       ; 5C90   0004 0314 0339

L_5C93:
        PSHR    R5                              ; 5C93   0275
L_5C94:
        MVII    #$0228, R4                      ; 5C94   02BC 0228
        MVII    #$0014, R0                      ; 5C96   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 5C98   0004 0114 0338

        MVI     G_01A9, R0                      ; 5C9B   0280 01A9

        JSR     R5,     L_5CA3                  ; 5C9D   0004 015C 00A3
        DECLE   $0006,  $0232                   ; 5CA0   0006 0232

        PULR    R7                              ; 5CA2   02B7

L_5CA3:
        MVI@    R5,     R3                      ; 5CA3   02AB
        MVI@    R5,     R4                      ; 5CA4   02AC
        PSHR    R5                              ; 5CA5   0275

        JSR     R5,     L_5CB3                  ; 5CA6   0004 015C 00B3

        J       L_5CBF                          ; 5CA9   0004 035C 00BF

L_5CAC:
        PSHR    R5                              ; 5CAC   0275

        JSR     R5,     L_5CB3                  ; 5CAD   0004 015C 00B3

        J       L_56E9                          ; 5CB0   0004 0354 02E9

L_5CB3:
        PSHR    R0                              ; 5CB3   0270
        SDBD                                    ; 5CB4   0001
        MVII    #$AEBC, R1                      ; 5CB5   02B9 00BC 00AE
        SUBI    #$002D, R0                      ; 5CB8   0338 002D
        ADDR    R0,     R1                      ; 5CBA   00C1
        ADD@    R1,     R1                      ; 5CBB   02C9
        PULR    R0                              ; 5CBC   02B0
        MOVR    R5,     R7                      ; 5CBD   00AF

L_5CBE:
        PSHR    R5                              ; 5CBE   0275

L_5CBF:
        JSR     R5,     L_6086                  ; 5CBF   0004 0160 0086

        SARC    R0,     1                       ; 5CC2   0078
        ADCR    R0                              ; 5CC3   0028
        SUBR    R0,     R4                      ; 5CC4   0104
        J       L_56E9                          ; 5CC5   0004 0354 02E9

L_5CC8:
        MVI@    R5,     R3                      ; 5CC8   02AB
L_5CC9:
        MVI@    R5,     R0                      ; 5CC9   02A8
L_5CCA:
        MVI@    R5,     R1                      ; 5CCA   02A9
        XORI    #$0088, R3                      ; 5CCB   03FB 0088
L_5CCD:
        MVO@    R3,     R1                      ; 5CCD   024B
        ADDI    #$0008, R3                      ; 5CCE   02FB 0008
        ADDI    #$0014, R1                      ; 5CD0   02F9 0014
        DECR    R0                              ; 5CD2   0010
        BNEQ    L_5CCD                          ; 5CD3   022C 0007
        MOVR    R5,     R7                      ; 5CD5   00AF

L_5CD6:
        JSR     R5,     L_6054                  ; 5CD6   0004 0160 0054
        DECLE   $0241,  $0103,  $02B8,  $000C   ; 5CD9   0241 0103 02B8 000C
        DECLE   $0240,  $0138,  $02B8,  $00FF   ; 5CDD   0240 0138 02B8 00FF
        DECLE   $0240,  $0348,  $0004           ; 5CE1   0240 0348 0004

        ANDR    R4,     R0                      ; 5CE4   01A0
        MOVR    R7,     R1                      ; 5CE5   00B9
        COMR    R4                              ; 5CE6   001C

        JSR     R5,     L_606E                  ; 5CE7   0004 0160 006E
        JSR     R5,     L_570F                  ; 5CEA   0004 0154 030F
        BIDECLE $9858                           ; 5CED   0058 0098

        MVII    #$02DF, R4                      ; 5CEF   02BC 02DF
        SDBD                                    ; 5CF1   0001
        MVII    #$9C68, R1                      ; 5CF2   02B9 0068 009C
        J       L_56E9                          ; 5CF5   0004 0354 02E9

        PSHR    R5                              ; 5CF8   0275
        MVI     G_0102, R0                      ; 5CF9   0280 0102
        DECR    R0                              ; 5CFB   0010
        BMI     L_5D7A                          ; 5CFC   020B 007C

        MVO     R0,     G_0102                  ; 5CFE   0240 0102
        MVI     G_0133, R0                      ; 5D00   0280 0133
        TSTR    R0                              ; 5D02   0080
        BNEQ    L_5D7A                          ; 5D03   020C 0075

        MVII    #$0319, R4                      ; 5D05   02BC 0319
        CLRR    R5                              ; 5D07   01ED
        MVI@    R4,     R0                      ; 5D08   02A0
        MVO@    R0,     R5                      ; 5D09   0268
        MVI@    R4,     R0                      ; 5D0A   02A0
        MVO@    R0,     R5                      ; 5D0B   0268
        MVI@    R4,     R0                      ; 5D0C   02A0
        MVO@    R0,     R5                      ; 5D0D   0268
        MVI@    R4,     R0                      ; 5D0E   02A0
        MVO@    R0,     R5                      ; 5D0F   0268
        MVI@    R4,     R0                      ; 5D10   02A0
        MVO@    R0,     R5                      ; 5D11   0268
        MVI@    R4,     R0                      ; 5D12   02A0
        MVO@    R0,     R5                      ; 5D13   0268
        MVI@    R4,     R0                      ; 5D14   02A0
        MVO@    R0,     R5                      ; 5D15   0268
        MVI@    R4,     R0                      ; 5D16   02A0
        MVO@    R0,     R5                      ; 5D17   0268
        MVI@    R4,     R0                      ; 5D18   02A0
        MVO@    R0,     R5                      ; 5D19   0268
        MVI@    R4,     R0                      ; 5D1A   02A0
        MVO@    R0,     R5                      ; 5D1B   0268
        MVI@    R4,     R0                      ; 5D1C   02A0
        MVO@    R0,     R5                      ; 5D1D   0268
        MVI@    R4,     R0                      ; 5D1E   02A0
        MVO@    R0,     R5                      ; 5D1F   0268
        MVI@    R4,     R0                      ; 5D20   02A0
        MVO@    R0,     R5                      ; 5D21   0268
        MVI@    R4,     R0                      ; 5D22   02A0
        MVO@    R0,     R5                      ; 5D23   0268
        MVI@    R4,     R0                      ; 5D24   02A0
        MVO@    R0,     R5                      ; 5D25   0268
        MVI@    R4,     R0                      ; 5D26   02A0
        MVO@    R0,     R5                      ; 5D27   0268
        MVI@    R4,     R0                      ; 5D28   02A0
        MVO@    R0,     R5                      ; 5D29   0268
        MVI@    R4,     R0                      ; 5D2A   02A0
        MVO@    R0,     R5                      ; 5D2B   0268
        MVI@    R4,     R0                      ; 5D2C   02A0
        MVO@    R0,     R5                      ; 5D2D   0268
        MVI@    R4,     R0                      ; 5D2E   02A0
        MVO@    R0,     R5                      ; 5D2F   0268
        MVI@    R4,     R0                      ; 5D30   02A0
        MVO@    R0,     R5                      ; 5D31   0268
        MVI@    R4,     R0                      ; 5D32   02A0
        MVO@    R0,     R5                      ; 5D33   0268
        MVI@    R4,     R0                      ; 5D34   02A0
        MVO@    R0,     R5                      ; 5D35   0268
        MVI@    R4,     R0                      ; 5D36   02A0
        MVO@    R0,     R5                      ; 5D37   0268
        MVI     G_0345, R0                      ; 5D38   0280 0345
        ANDI    #$0007, R0                      ; 5D3A   03B8 0007
        NEGR    R0                              ; 5D3C   0020
        ADDI    #$0007, R0                      ; 5D3D   02F8 0007
        MVO     R0,     .STIC.HDLY              ; 5D3F   0240 0030
        MVI     G_0345, R0                      ; 5D41   0280 0345
        MVI     G_0346, R1                      ; 5D43   0281 0346
        SDBD                                    ; 5D45   0001
        ANDI    #$FFF8, R0                      ; 5D46   03B8 00F8 00FF
        SDBD                                    ; 5D49   0001
        ANDI    #$FFF8, R1                      ; 5D4A   03B9 00F8 00FF
        CMPR    R0,     R1                      ; 5D4D   0141
        BEQ     L_5D55                          ; 5D4E   0204 0005

        MVO     R0,     .STIC.VIDEN             ; 5D50   0240 0020

        JSR     R5,     L_57A9                  ; 5D52   0004 0154 03A9

L_5D55:
        MVI     G_0103, R0                      ; 5D55   0280 0103
        MVO     R0,     .STIC.EDGE              ; 5D57   0240 0032
        MVO     R0,     .STIC.MODE              ; 5D59   0240 0021
        ANDI    #$0004, R0                      ; 5D5B   03B8 0004
        BNEQ    L_5D61                          ; 5D5D   020C 0002

        MVI     .STIC.MODE,R0                   ; 5D5F   0280 0021
L_5D61:
        SLR     R0,     2                       ; 5D61   0064
        MVO     R0,     G_0105                  ; 5D62   0240 0105
        MVI     G_0142, R0                      ; 5D64   0280 0142
        ANDI    #$0003, R0                      ; 5D66   03B8 0003
        MVO     R0,     .STIC.VDLY              ; 5D68   0240 0031
        MVI     G_0106, R0                      ; 5D6A   0280 0106
        MVO     R0,     .STIC.BORD              ; 5D6C   0240 002C
        MVII    #$013B, R4                      ; 5D6E   02BC 013B
        MVII    #$0028, R5                      ; 5D70   02BD 0028
        MVI@    R4,     R0                      ; 5D72   02A0
        MVO@    R0,     R5                      ; 5D73   0268
        MVI@    R4,     R0                      ; 5D74   02A0
        MVO@    R0,     R5                      ; 5D75   0268
        MVI@    R4,     R0                      ; 5D76   02A0
        MVO@    R0,     R5                      ; 5D77   0268
        MVI@    R4,     R0                      ; 5D78   02A0
        MVO@    R0,     R5                      ; 5D79   0268
L_5D7A:
        MVI     G_0107, R4                      ; 5D7A   0284 0107
        ADDR    R4,     R4                      ; 5D7C   00E4
        BEQ     L_5DA3                          ; 5D7D   0204 0024

        CLRR    R0                              ; 5D7F   01C0
        MVO     R0,     .STIC.BORD              ; 5D80   0240 002C
        SDBD                                    ; 5D82   0001
        ADDI    #$67EE, R4                      ; 5D83   02FC 00EE 0067
        SDBD                                    ; 5D86   0001
        MVI@    R4,     R5                      ; 5D87   02A5
        MVO     R6,     G_0338                  ; 5D88   0246 0338
        SDBD                                    ; 5D8A   0001
        MVII    #$10EF, R1                      ; 5D8B   02B9 00EF 0010
        MVI@    R1,     R1                      ; 5D8E   0289
        CMPI    #$0004, R1                      ; 5D8F   0379 0004
        BNEQ    L_5D95                          ; 5D91   020C 0002

        MVII    #$0200, R6                      ; 5D93   02BE 0200

L_5D95:
        JSRD    R4,     X_NEW_GRAM_INIT         ; 5D95   0004 001E 0335

        MVI     G_0338, R6                      ; 5D98   0286 0338
        CLRR    R0                              ; 5D9A   01C0
        MVO     R0,     G_0107                  ; 5D9B   0240 0107

        JSR     R5,     L_6054                  ; 5D9D   0004 0160 0054

        EIS                                     ; 5DA0   0002
        B       L_5DB9                          ; 5DA1   0200 0016

L_5DA3:
        JSR     R5,     L_5DE8                  ; 5DA3   0004 015C 01E8

        MVI     G_0134, R0                      ; 5DA6   0280 0134
        TSTR    R0                              ; 5DA8   0080
        BEQ     L_5DB7                          ; 5DA9   0204 000C

        CMPI    #$00FF, R0                      ; 5DAB   0378 00FF
        BEQ     L_5DB2                          ; 5DAD   0204 0003

        DECR    R0                              ; 5DAF   0010
        MVO     R0,     G_0134                  ; 5DB0   0240 0134
L_5DB2:
        CLRR    R0                              ; 5DB2   01C0
        MVO     R0,     .STIC.BORD              ; 5DB3   0240 002C
        B       L_5DB9                          ; 5DB5   0200 0002

L_5DB7:
        MVO     R0,     .STIC.VIDEN             ; 5DB7   0240 0020
L_5DB9:
        MVI     G_0133, R0                      ; 5DB9   0280 0133
        TSTR    R0                              ; 5DBB   0080
        BNEQ    L_5DDE                          ; 5DBC   020C 0020

        MVII    #$0331, R2                      ; 5DBE   02BA 0331
        SDBD                                    ; 5DC0   0001
        MVII    #$39A0, R1                      ; 5DC1   02B9 00A0 0039
        MVII    #$0002, R3                      ; 5DC4   02BB 0002
L_5DC6:
        MVI@    R2,     R4                      ; 5DC6   0294
        MVII    #$0001, R0                      ; 5DC7   02B8 0001

        JSR     R5,     L_562C                  ; 5DC9   0004 0154 022C

        INCR    R2                              ; 5DCC   000A
        MVI@    R2,     R4                      ; 5DCD   0294
        MVII    #$0001, R0                      ; 5DCE   02B8 0001

        JSR     R5,     L_562C                  ; 5DD0   0004 0154 022C

        INCR    R2                              ; 5DD3   000A
        MVI@    R2,     R4                      ; 5DD4   0294
        MVII    #$0001, R0                      ; 5DD5   02B8 0001

        JSR     R5,     L_562C                  ; 5DD7   0004 0154 022C

        INCR    R2                              ; 5DDA   000A
        DECR    R3                              ; 5DDB   0013
        BNEQ    L_5DC6                          ; 5DDC   022C 0017

L_5DDE:
        MVI     G_0134, R0                      ; 5DDE   0280 0134
        CMPI    #$00FF, R0                      ; 5DE0   0378 00FF
        BEQ     L_5DE7                          ; 5DE2   0204 0003

        JSR     R5,     X_PLAY_NOTE             ; 5DE4   0004 0118 02BD

L_5DE7:
        PULR    R7                              ; 5DE7   02B7

L_5DE8:
        PSHR    R5                              ; 5DE8   0275
        CLRR    R1                              ; 5DE9   01C9
        MVII    #$0001, R2                      ; 5DEA   02BA 0001
        MVI     G_0343, R0                      ; 5DEC   0280 0343
L_5DEE:
        INCR    R1                              ; 5DEE   0009
        SLL     R2,     1                       ; 5DEF   004A
        SARC    R0,     1                       ; 5DF0   0078
        BC      L_5DF6                          ; 5DF1   0201 0003
        BNEQ    L_5DEE                          ; 5DF3   022C 0006
        PULR    R7                              ; 5DF5   02B7

L_5DF6:
        SLR     R2,     1                       ; 5DF6   0062
        COMR    R2                              ; 5DF7   001A
        AND     G_0343, R2                      ; 5DF8   0382 0343
        MVO     R2,     G_0343                  ; 5DFA   0242 0343
        DECR    R1                              ; 5DFC   0011
        INCR    R1                              ; 5DFD   0009
        ADDR    R7,     R1                      ; 5DFE   00F9
        ADD@    R1,     R7                      ; 5DFF   02CF
        INCR    R7                              ; 5E00   000F

        COMR    R0                              ; 5E01   0018
L_5E02:
        NEGR    R0                              ; 5E02   0020
        RSWD    R4                              ; 5E03   003C
        RLC     R2,     1                       ; 5E04   0052
        SLLC    R2,     2                       ; 5E05   005E
        SARC    R2,     2                       ; 5E06   007E
        MOVR    R2,     R3                      ; 5E07   0093
        MOVR    R3,     R7                      ; 5E08   009F

        DECLE   $00AB,  $00B7                   ; 5E09   00AB 00B7

        ADDR    R4,     R7                      ; 5E0B   00E7

        SUBR    R2,     R0                      ; 5E0C   0110
        SUBR    R3,     R4                      ; 5E0D   011C
        SUBR    R4,     R4                      ; 5E0E   0124
        SDBD                                    ; 5E0F   0001
        MVII    #$38B8, R4                      ; 5E10   02BC 00B8 0038
        MVII    #$0078, R0                      ; 5E13   02B8 0078
L_5E15:
        J       .EXEC.739                       ; 5E15   0004 0314 0339

        SDBD                                    ; 5E18   0001
        MVII    #$3908, R4                      ; 5E19   02BC 0008 0039
        MVII    #$0028, R0                      ; 5E1C   02B8 0028
        B       L_5E15                          ; 5E1E   0220 000A

        DECLE   $0280,  $0138,  $0378,  $0003   ; 5E20   0280 0138 0378 0003
        DECLE   $020C,  $000B                   ; 5E24   020C 000B

        MVII    #$01A9, R1                      ; 5E26   02B9 01A9
        SDBD                                    ; 5E28   0001
        MVII    #$38B8, R4                      ; 5E29   02BC 00B8 0038
L_5E2C:
        MVII    #$0007, R0                      ; 5E2C   02B8 0007
        DECLE   $0004                           ; 5E2E   0004

        AND@    R4,     R4                      ; 5E2F   03A4
        ANDI    #$0281, R2                      ; 5E30   03BA 0281
        CMPR    R7,     R1                      ; 5E32   0179
        SDBD                                    ; 5E33   0001
        MVII    #$3918, R4                      ; 5E34   02BC 0018 0039
L_5E37:
        SLR     R1,     1                       ; 5E37   0061
L_5E38:
        CLRR    R0                              ; 5E38   01C0
        DECLE   $0004                           ; 5E39   0004

        AND@    R4,     R4                      ; 5E3A   03A4
        CMP@    R2,     R4                      ; 5E3B   0354
        MVI     G_0138, R0                      ; 5E3C   0280 0138
        CMPI    #$0003, R0                      ; 5E3E   0378 0003
        BNEQ    L_5E4A                          ; 5E40   020C 0008

        MVII    #$01CC, R1                      ; 5E42   02B9 01CC
        SDBD                                    ; 5E44   0001
        MVII    #$38F0, R4                      ; 5E45   02BC 00F0 0038
        B       L_5E2C                          ; 5E48   0220 001D

L_5E4A:
        MVI     G_019C, R1                      ; 5E4A   0281 019C
        SDBD                                    ; 5E4C   0001
        MVII    #$3920, R4                      ; 5E4D   02BC 0020 0039
        B       L_5E37                          ; 5E50   0220 001A

        DECLE   $0001,  $02B9,  $0001,  $009C   ; 5E52   0001 02B9 0001 009C
        DECLE   $0001,  $02BC,  $0000,  $0038   ; 5E56   0001 02BC 0000 0038
        DECLE   $02B8,  $0010,  $0220,  $002F   ; 5E5A   02B8 0010 0220 002F

        MVI     G_017B, R2                      ; 5E5E   0282 017B
        MVI     G_0339, R3                      ; 5E60   0283 0339
        CMPI    #$015D, R3                      ; 5E62   037B 015D
        BEQ     L_5E68                          ; 5E64   0204 0002

        MVI     G_019E, R2                      ; 5E66   0282 019E
L_5E68:
        PSHR    R2                              ; 5E68   0272
        SLL     R2,     2                       ; 5E69   004E
        ADD@    R6,     R2                      ; 5E6A   02F2
        SDBD                                    ; 5E6B   0001
        ADDI    #$9BC0, R2                      ; 5E6C   02FA 00C0 009B
        SDBD                                    ; 5E6F   0001
        MVII    #$3871, R4                      ; 5E70   02BC 0071 0038
        MVII    #$0005, R0                      ; 5E73   02B8 0005
        MOVR    R2,     R5                      ; 5E75   0095
L_5E76:
        MVI@    R5,     R1                      ; 5E76   02A9
        SLL     R1,     2                       ; 5E77   004D
        SLL     R1,     2                       ; 5E78   004D
        MVO@    R1,     R4                      ; 5E79   0261
        DECR    R0                              ; 5E7A   0010
        BNEQ    L_5E76                          ; 5E7B   022C 0006
        PULR    R7                              ; 5E7D   02B7

        MVI     G_01AA, R0                      ; 5E7E   0280 01AA
        SDBD                                    ; 5E80   0001
        MVII    #$3858, R1                      ; 5E81   02B9 0058 0038
        SDBD                                    ; 5E84   0001
        MVII    #$9D11, R4                      ; 5E85   02BC 0011 009D
L_5E88:
        ANDI    #$0001, R0                      ; 5E88   03B8 0001
        BEQ     L_5E8E                          ; 5E8A   0204 0002

        ADDI    #$0030, R4                      ; 5E8C   02FC 0030
L_5E8E:
        MVII    #$0005, R0                      ; 5E8E   02B8 0005
L_5E90:
        J       L_562D                          ; 5E90   0004 0354 022D

        MVI     G_01AB, R0                      ; 5E93   0280 01AB
        SDBD                                    ; 5E95   0001
        MVII    #$38A8, R1                      ; 5E96   02B9 00A8 0038
        SDBD                                    ; 5E99   0001
        MVII    #$9D71, R4                      ; 5E9A   02BC 0071 009D
        B       L_5E88                          ; 5E9D   0220 0016

        MVI     G_01AC, R0                      ; 5E9F   0280 01AC
        SDBD                                    ; 5EA1   0001
        MVII    #$38D8, R1                      ; 5EA2   02B9 00D8 0038
        SDBD                                    ; 5EA5   0001
        MVII    #$9DD1, R4                      ; 5EA6   02BC 00D1 009D
        B       L_5E88                          ; 5EA9   0220 0022

        MVI     G_01AD, R0                      ; 5EAB   0280 01AD
        SDBD                                    ; 5EAD   0001
        MVII    #$3880, R1                      ; 5EAE   02B9 0080 0038
        SDBD                                    ; 5EB1   0001
        MVII    #$9E31, R4                      ; 5EB2   02BC 0031 009E
        B       L_5E88                          ; 5EB5   0220 002E

        MVII    #$0003, R0                      ; 5EB7   02B8 0003
        SDBD                                    ; 5EB9   0001
        MVII    #$3980, R1                      ; 5EBA   02B9 0080 0039
        SDBD                                    ; 5EBD   0001
        MVII    #$9C79, R4                      ; 5EBE   02BC 0079 009C

        JSR     R5,     L_562C                  ; 5EC1   0004 0154 022C

        SDBD                                    ; 5EC4   0001
        MVII    #$9C99, R4                      ; 5EC5   02BC 0099 009C
        SDBD                                    ; 5EC8   0001
        MVII    #$3982, R5                      ; 5EC9   02BD 0082 0039
        MVI     G_013F, R0                      ; 5ECC   0280 013F
        ANDI    #$007F, R0                      ; 5ECE   03B8 007F
        ADDR    R0,     R4                      ; 5ED0   00C4
        MVII    #$0002, R3                      ; 5ED1   02BB 0002
L_5ED3:
        MVI@    R4,     R0                      ; 5ED3   02A0
        MVO@    R0,     R5                      ; 5ED4   0268
        MVI@    R4,     R0                      ; 5ED5   02A0
        MVO@    R0,     R5                      ; 5ED6   0268
        MVI@    R4,     R0                      ; 5ED7   02A0
        MVO@    R0,     R5                      ; 5ED8   0268
        MVI@    R4,     R0                      ; 5ED9   02A0
        MVO@    R0,     R5                      ; 5EDA   0268
        MVI@    R4,     R0                      ; 5EDB   02A0
        MVO@    R0,     R5                      ; 5EDC   0268
        ADDI    #$000B, R5                      ; 5EDD   02FD 000B
        DECR    R3                              ; 5EDF   0013
        BNEQ    L_5ED3                          ; 5EE0   022C 000E

        MVII    #$0023, R0                      ; 5EE2   02B8 0023
        MVO     R0,     G_013F                  ; 5EE4   0240 013F
        PULR    R7                              ; 5EE6   02B7

        DECLE   $01C0,  $0281,  $01AF,  $0001   ; 5EE7   01C0 0281 01AF 0001
        DECLE   $02BC,  $0010,  $0039,  $0004   ; 5EEB   02BC 0010 0039 0004

        ANDR    R4,     R4                      ; 5EEF   01A4
        CMP@    R2,     R3                      ; 5EF0   0353
        MVI     G_01B0, R0                      ; 5EF1   0280 01B0
        PSHR    R0                              ; 5EF3   0270
        SLL     R0,     2                       ; 5EF4   004C
        ADD@    R6,     R0                      ; 5EF5   02F0
        SDBD                                    ; 5EF6   0001
        MVII    #$9BC0, R5                      ; 5EF7   02BD 00C0 009B
        ADDR    R0,     R5                      ; 5EFA   00C5
        SDBD                                    ; 5EFB   0001
        MVII    #$3909, R4                      ; 5EFC   02BC 0009 0039
        SDBD                                    ; 5EFF   0001
        MVII    #$9BFC, R3                      ; 5F00   02BB 00FC 009B
L_5F03:
        MVI@    R5,     R0                      ; 5F03   02A8
        SLL     R0,     2                       ; 5F04   004C
        SLL     R0,     1                       ; 5F05   0048
        XOR@    R3,     R0                      ; 5F06   03D8
        INCR    R3                              ; 5F07   000B
        MVO@    R0,     R4                      ; 5F08   0260
        SDBD                                    ; 5F09   0001
        CMPI    #$390D, R4                      ; 5F0A   037C 000D 0039
        BLE     L_5F03                          ; 5F0D   0226 000B
        PULR    R7                              ; 5F0F   02B7

        DECLE   $0001,  $02B9,  $0051,  $009C   ; 5F10   0001 02B9 0051 009C
        DECLE   $0001,  $02BC,  $0038,  $0039   ; 5F14   0001 02BC 0038 0039
        DECLE   $02B8,  $0008,  $0220,  $00ED   ; 5F18   02B8 0008 0220 00ED

        MVI     G_0140, R1                      ; 5F1C   0281 0140
        SDBD                                    ; 5F1E   0001
        MVII    #$3928, R4                      ; 5F1F   02BC 0028 0039
        B       L_5E38                          ; 5F22   0220 00EB

        SDBD                                    ; 5F24   0001
        MVII    #$3980, R1                      ; 5F25   02B9 0080 0039
        MVI     G_01A4, R0                      ; 5F28   0280 01A4
        SLL     R0,     2                       ; 5F2A   004C
        SLL     R0,     2                       ; 5F2B   004C
        SDBD                                    ; 5F2C   0001
        MVII    #$9B20, R4                      ; 5F2D   02BC 0020 009B
        ADDR    R0,     R4                      ; 5F30   00C4
        MVII    #$0001, R0                      ; 5F31   02B8 0001

        JSR     R5,     L_562C                  ; 5F33   0004 0154 022C

        MVI     G_01A6, R0                      ; 5F36   0280 01A6
        SLL     R0,     2                       ; 5F38   004C
        SLL     R0,     2                       ; 5F39   004C
        SDBD                                    ; 5F3A   0001
        MVII    #$9B00, R4                      ; 5F3B   02BC 0000 009B
        ADDR    R0,     R4                      ; 5F3E   00C4
        MVII    #$0001, R0                      ; 5F3F   02B8 0001
        B       L_5E90                          ; 5F41   0220 00B2

        DECLE   $0001,  $0012,  $0006,  $0000   ; 5F43   0001 0012 0006 0000
        DECLE   $000A,  $0004,  $0008,  $0002   ; 5F47   000A 0004 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 5F4F   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5F53   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; 5F57   0000 0004 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5F5B   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 5F5F   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 5F63   0000 0003 0000 0004

        INCR    R7                              ; 5F67   000F

        DECR    R0                              ; 5F68   0010
L_5F69:
        INCR    R4                              ; 5F69   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6A   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 5F6E   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 5F72   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 5F76   0005 000E 0001 000D
        DECLE   $0000                           ; 5F7A   0000
L_5F7B:
        PSHR    R5                              ; 5F7B   0275
        MVII    #$0143, R4                      ; 5F7C   02BC 0143
        MOVR    R4,     R5                      ; 5F7E   00A5
        SDBD                                    ; 5F7F   0001
        MVI@    R4,     R0                      ; 5F80   02A0
        DECR    R0                              ; 5F81   0010
        BMI     L_6024                          ; 5F82   020B 00A0

        MVO@    R0,     R5                      ; 5F84   0268
        SWAP    R0,     1                       ; 5F85   0040
        MVO@    R0,     R5                      ; 5F86   0268
        MVI     G_010E, R0                      ; 5F87   0280 010E
        CMPI    #$005A, R0                      ; 5F89   0378 005A
        BEQ     L_6024                          ; 5F8B   0204 0097

        MVI     G_0112, R0                      ; 5F8D   0280 0112
        CMPI    #$005A, R0                      ; 5F8F   0378 005A
        BEQ     L_6024                          ; 5F91   0204 0091

        JSR     R5,     L_5F9A                  ; 5F93   0004 015C 039A
        JSR     R5,     L_5FE8                  ; 5F96   0004 015C 03E8

        PULR    R7                              ; 5F99   02B7

L_5F9A:
        PSHR    R5                              ; 5F9A   0275
        MVI     G_010E, R0                      ; 5F9B   0280 010E
        MVII    #$010B, R4                      ; 5F9D   02BC 010B

        JSR     R5,     L_5FA7                  ; 5F9F   0004 015C 03A7

        MVI     G_0112, R0                      ; 5FA2   0280 0112
        MVII    #$010F, R4                      ; 5FA4   02BC 010F
        INCR    R7                              ; 5FA6   000F

L_5FA7:
        PSHR    R5                              ; 5FA7   0275
L_5FA8:
        MOVR    R0,     R1                      ; 5FA8   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; 5FA9   0065 0065 0061 0001
        DECLE   $02F9,  $0043,  $005F,  $0289   ; 5FAD   02F9 0043 005F 0289
        DECLE   $0079,  $0201,  $001F,  $0079   ; 5FB1   0079 0201 001F 0079
        DECLE   $0201,  $0020,  $02BD,  $00FF   ; 5FB5   0201 0020 02BD 00FF
        DECLE   $0265,  $0265,  $0082,  $03B8   ; 5FB9   0265 0265 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; 5FBD   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; 5FC1   000F 0001

        ADDI    #$004B, R2                      ; 5FC3   02FA 004B
        SLLC    R3,     2                       ; 5FC5   005F
        ADD@    R2,     R1                      ; 5FC6   02D1
        CMPI    #$000A, R1                      ; 5FC7   0379 000A
        BLE     L_5FD5                          ; 5FC9   0206 000A

        SUBI    #$000B, R1                      ; 5FCB   0339 000B
        BEQ     L_5FD5                          ; 5FCD   0204 0006

        ADDI    #$000A, R1                      ; 5FCF   02F9 000A
        B       L_5FD5                          ; 5FD1   0200 0002

        MVII    #$00FF, R1                      ; 5FD3   02B9 00FF
L_5FD5:
        MVO@    R1,     R4                      ; 5FD5   0261
        PULR    R7                              ; 5FD6   02B7

        MOVR    R0,     R2                      ; 5FD7   0082
        ANDI    #$001F, R2                      ; 5FD8   03BA 001F
        SDBD                                    ; 5FDA   0001
        ADDI    #$5F5B, R2                      ; 5FDB   02FA 005B 005F
        MVI@    R2,     R2                      ; 5FDE   0292
        DECR    R2                              ; 5FDF   0012
        MVO@    R2,     R4                      ; 5FE0   0262
        XORI    #$00FF, R1                      ; 5FE1   03F9 00FF
        MVO@    R1,     R4                      ; 5FE3   0261
        MVII    #$00FF, R2                      ; 5FE4   02BA 00FF
        MVO@    R2,     R4                      ; 5FE6   0262
        PULR    R7                              ; 5FE7   02B7

L_5FE8:
        PSHR    R5                              ; 5FE8   0275
        CLRR    R1                              ; 5FE9   01C9
        MVII    #$010B, R2                      ; 5FEA   02BA 010B
        MVII    #$0113, R3                      ; 5FEC   02BB 0113
        MVI     G_0337, R4                      ; 5FEE   0284 0337

        JSR     R5,     L_5FFC                  ; 5FF0   0004 015C 03FC

        MVII    #$0001, R1                      ; 5FF3   02B9 0001
        MVII    #$010F, R2                      ; 5FF5   02BA 010F
        MVII    #$0116, R3                      ; 5FF7   02BB 0116
        MVI     G_0337, R4                      ; 5FF9   0284 0337
        INCR    R7                              ; 5FFB   000F

L_5FFC:
        PSHR    R5                              ; 5FFC   0275
L_5FFD:
        MVII    #$0002, R5                      ; 5FFD   02BD 0002
L_5FFF:
        PSHR    R5                              ; 5FFF   0275
        MVI@    R2,     R0                      ; 6000   0290
        CMP@    R3,     R0                      ; 6001   0358
        BNEQ    L_6008                          ; 6002   020C 0004

        CMPI    #$00FF, R0                      ; 6004   0378 00FF
        BEQ     L_6019                          ; 6006   0204 0011

L_6008:
        PSHR    R4                              ; 6008   0274
        PSHR    R3                              ; 6009   0273
        PSHR    R2                              ; 600A   0272
        NOP                                     ; 600B   0034
        PSHR    R1                              ; 600C   0271
        MOVR    R7,     R5                      ; 600D   00BD
        ADDI    #$0004, R5                      ; 600E   02FD 0004
        SDBD                                    ; 6010   0001
        MVI@    R4,     R7                      ; 6011   02A7

        JSR     R5,     L_6048                  ; 6012   0004 0160 0048

        PULR    R1                              ; 6015   02B1
        PULR    R2                              ; 6016   02B2
        PULR    R3                              ; 6017   02B3
        PULR    R4                              ; 6018   02B4
L_6019:
        MVI@    R2,     R0                      ; 6019   0290
        MVO@    R0,     R3                      ; 601A   0258
        INCR    R2                              ; 601B   000A
        INCR    R3                              ; 601C   000B
        ADDI    #$0002, R4                      ; 601D   02FC 0002
        PULR    R5                              ; 601F   02B5
        DECR    R5                              ; 6020   0015
        BPL     L_5FFF                          ; 6021   0223 0023
        PULR    R7                              ; 6023   02B7

L_6024:
        MVII    #$00FF, R3                      ; 6024   02BB 00FF
        MVO     R3,     G_0134                  ; 6026   0243 0134
        CLRR    R3                              ; 6028   01DB
        MVII    #$01FB, R4                      ; 6029   02BC 01FB
        MOVR    R4,     R5                      ; 602B   00A5
        MVI@    R4,     R0                      ; 602C   02A0
        MVO@    R3,     R5                      ; 602D   026B
        MVI@    R4,     R1                      ; 602E   02A1
        MVO@    R3,     R5                      ; 602F   026B
        MVI@    R4,     R2                      ; 6030   02A2
        MVO@    R3,     R5                      ; 6031   026B
        PSHR    R2                              ; 6032   0272

        JSR     R5,     .EXEC.4C3               ; 6033   0004 0114 00C3

        PULR    R2                              ; 6036   02B2
        MVII    #$01FB, R4                      ; 6037   02BC 01FB
        MVO@    R0,     R4                      ; 6039   0260
        MVO@    R1,     R4                      ; 603A   0261
        MVO@    R2,     R4                      ; 603B   0262

        JSR     R5,     L_6048                  ; 603C   0004 0160 0048

        CLRR    R0                              ; 603F   01C0
        MVO     R0,     G_0134                  ; 6040   0240 0134
        DECR    R0                              ; 6042   0010
        MVO     R0,     G_010E                  ; 6043   0240 010E
        MVO     R0,     G_0112                  ; 6045   0240 0112
        PULR    R7                              ; 6047   02B7

L_6048:
        MVII    #$0030, R0                      ; 6048   02B8 0030
        MVO     R0,     G_0143                  ; 604A   0240 0143
        MVII    #$002A, R0                      ; 604C   02B8 002A
        MVO     R0,     G_0144                  ; 604E   0240 0144
        MOVR    R5,     R7                      ; 6050   00AF

L_6051:
        MVII    #$02F8, R1                      ; 6051   02B9 02F8
        INCR    R7                              ; 6053   000F

L_6054:
        CLRR    R1                              ; 6054   01C9
L_6055:
        MVII    #$00F0, R0                      ; 6055   02B8 00F0
        MVII    #$0200, R4                      ; 6057   02BC 0200
        J       X_FILL_MEM                      ; 6059   0004 0314 0341

L_605C:
        MVII    #$00FF, R1                      ; 605C   02B9 00FF
        MVO     R1,     G_015E                  ; 605E   0241 015E
        MVO     R1,     G_0181                  ; 6060   0241 0181
        MVO     R1,     G_017C                  ; 6062   0241 017C
        MVO     R1,     G_019F                  ; 6064   0241 019F
        MOVR    R5,     R7                      ; 6066   00AF

L_6067:
        MVII    #$0057, R0                      ; 6067   02B8 0057
        MVO     R0,     G_0345                  ; 6069   0240 0345
        MVO     R0,     G_0346                  ; 606B   0240 0346
        MOVR    R5,     R7                      ; 606D   00AF

L_606E:
        PSHR    R5                              ; 606E   0275
        CLRR    R0                              ; 606F   01C0
        MVO     R0,     G_015D                  ; 6070   0240 015D
        MVO     R0,     G_0180                  ; 6072   0240 0180
        MVII    #$015F, R4                      ; 6074   02BC 015F
        MVII    #$000C, R0                      ; 6076   02B8 000C

        JSR     R5,     X_FILL_ZERO             ; 6078   0004 0114 0338

        MVII    #$0182, R4                      ; 607B   02BC 0182

        JSR     R5,     X_FILL_ZERO             ; 607D   0004 0114 0338

        MVII    #$0319, R4                      ; 6080   02BC 0319
        SLL     R0,     1                       ; 6082   0048
        J       .EXEC.739                       ; 6083   0004 0314 0339

L_6086:
        PSHR    R5                              ; 6086   0275
        PSHR    R1                              ; 6087   0271
        PSHR    R4                              ; 6088   0274
        MOVR    R1,     R4                      ; 6089   008C
        CLRR    R1                              ; 608A   01C9
L_608B:
        SDBD                                    ; 608B   0001
        CMPI    #$AED6, R4                      ; 608C   037C 00D6 00AE
        BGE     L_6095                          ; 608F   020D 0004

        JSR     R5,     L_618C                  ; 6091   0004 0160 018C

        INCR    R7                              ; 6094   000F

L_6095:
        MVI@    R4,     R0                      ; 6095   02A0
L_6096:
        INCR    R1                              ; 6096   0009
        TSTR    R0                              ; 6097   0080
        BNEQ    L_608B                          ; 6098   022C 000E

        DECR    R1                              ; 609A   0011
        MOVR    R1,     R0                      ; 609B   0088
        MOVR    R4,     R5                      ; 609C   00A5
        PULR    R4                              ; 609D   02B4
        PULR    R1                              ; 609E   02B1
        PULR    R7                              ; 609F   02B7

L_60A0:
        MVII    #$0004, R0                      ; 60A0   02B8 0004
        SWAP    R0,     1                       ; 60A2   0040
L_60A3:
        PSHR    R5                              ; 60A3   0275
        MVO     R0,     G_01AF                  ; 60A4   0240 01AF
        SWAP    R0,     1                       ; 60A6   0040
        MVO     R0,     G_01B0                  ; 60A7   0240 01B0

        JSR     R5,     L_55FF                  ; 60A9   0004 0154 01FF
        BIDECLE $0800                           ; 60AC   0000 0008

        PULR    R7                              ; 60AE   02B7

L_60AF:
        MVI     G_0141, R1                      ; 60AF   0281 0141
        CMPR    R1,     R0                      ; 60B1   0148
        BLE     L_60BA                          ; 60B2   0206 0006

        MVO     R0,     G_0141                  ; 60B4   0240 0141
        MVII    #$00FF, R0                      ; 60B6   02B8 00FF
        MVO     R0,     G_0135                  ; 60B8   0240 0135
L_60BA:
        MOVR    R5,     R7                      ; 60BA   00AF

L_60BB:
        MVII    #$01A9, R4                      ; 60BB   02BC 01A9
        MVII    #$0046, R0                      ; 60BD   02B8 0046
        J       X_FILL_ZERO                     ; 60BF   0004 0314 0338

L_60C2:
        MVII    #$0180, R3                      ; 60C2   02BB 0180
        CMPI    #$015D, R2                      ; 60C4   037A 015D
        BEQ     L_60CA                          ; 60C6   0204 0002

        MVII    #$015D, R3                      ; 60C8   02BB 015D
L_60CA:
        MOVR    R5,     R7                      ; 60CA   00AF

L_60CB:
        PSHR    R5                              ; 60CB   0275
        MVII    #$015D, R2                      ; 60CC   02BA 015D

        JSR     R5,     L_60D4                  ; 60CE   0004 0160 00D4

        MVII    #$0180, R2                      ; 60D1   02BA 0180
        INCR    R7                              ; 60D3   000F

L_60D4:
        PSHR    R5                              ; 60D4   0275
L_60D5:
        PSHR    R0                              ; 60D5   0270
        PSHR    R2                              ; 60D6   0272
        ADDI    #$0014, R2                      ; 60D7   02FA 0014
        MVO@    R0,     R2                      ; 60D9   0250
        ADDI    #$0003, R2                      ; 60DA   02FA 0003
        CLRR    R5                              ; 60DC   01ED
        MVO@    R5,     R2                      ; 60DD   0255
        INCR    R2                              ; 60DE   000A
        MVO@    R5,     R2                      ; 60DF   0255
        INCR    R2                              ; 60E0   000A
        MVO@    R5,     R2                      ; 60E1   0255
        INCR    R2                              ; 60E2   000A
        MVO@    R5,     R2                      ; 60E3   0255
        INCR    R2                              ; 60E4   000A
        MVO@    R5,     R2                      ; 60E5   0255
        SUBI    #$000C, R2                      ; 60E6   033A 000C
        SDBD                                    ; 60E8   0001
        MVII    #$A597, R5                      ; 60E9   02BD 0097 00A5
        ADDR    R0,     R5                      ; 60EC   00C5
        MVI@    R5,     R0                      ; 60ED   02A8
        SDBD                                    ; 60EE   0001
        ADDI    #$A249, R0                      ; 60EF   02F8 0049 00A2
        MOVR    R2,     R5                      ; 60F2   0095
        MVO@    R0,     R5                      ; 60F3   0268
        SWAP    R0,     1                       ; 60F4   0040
        MVO@    R0,     R5                      ; 60F5   0268
        SUBI    #$0001, R2                      ; 60F6   033A 0001
        MVII    #$0001, R0                      ; 60F8   02B8 0001
        MVO@    R0,     R2                      ; 60FA   0250
        PULR    R2                              ; 60FB   02B2
        PULR    R0                              ; 60FC   02B0
        PULR    R7                              ; 60FD   02B7

L_60FE:
        ADDI    #$01AA, R1                      ; 60FE   02F9 01AA
        MVO@    R0,     R1                      ; 6100   0248
        SUBI    #$01AA, R1                      ; 6101   0339 01AA
        CMPI    #$0080, R0                      ; 6103   0378 0080
        BNEQ    L_60BA                          ; 6105   022C 004C

        MVII    #$0040, R0                      ; 6107   02B8 0040
        TSTR    R1                              ; 6109   0089
        BEQ     L_6110                          ; 610A   0204 0004

L_610C:
        SLL     R0,     1                       ; 610C   0048
        DECR    R1                              ; 610D   0011
        BNEQ    L_610C                          ; 610E   022C 0003
L_6110:
        J       L_5601                          ; 6110   0004 0354 0201

L_6113:
        MVII    #$0014, R2                      ; 6113   02BA 0014
L_6115:
        SLL     R0,     2                       ; 6115   004C
        PSHR    R0                              ; 6116   0270
        SLL     R0,     2                       ; 6117   004C
        ADD@    R6,     R0                      ; 6118   02F0
        ADDR    R0,     R1                      ; 6119   00C1
L_611A:
        MVI@    R1,     R0                      ; 611A   0288
        SDBD                                    ; 611B   0001
        ANDI    #$FFF8, R0                      ; 611C   03B8 00F8 00FF
        XORI    #$0007, R0                      ; 611F   03F8 0007
        MVO@    R0,     R1                      ; 6121   0248
        INCR    R1                              ; 6122   0009
        DECR    R2                              ; 6123   0012
        BNEQ    L_611A                          ; 6124   022C 000B
        MOVR    R5,     R7                      ; 6126   00AF

L_6127:
        PSHR    R5                              ; 6127   0275
        MVI     G_0138, R0                      ; 6128   0280 0138

        JSR     R5,     L_617A                  ; 612A   0004 0160 017A
        BIDECLE $6133                           ; 612D   0033 0061

        BEQ     L_6132                          ; 612F   0204 0001

        PULR    R5                              ; 6131   02B5
L_6132:
        PULR    R7                              ; 6132   02B7

        DECLE   $0005,  $0000                   ; 6133   0005 0000

        DIS                                     ; 6135   0003
        INCR    R5                              ; 6136   000D
        CLRC                                    ; 6137   0006
        INCR    R0                              ; 6138   0008
L_6139:
        PSHR    R5                              ; 6139   0275
        MVII    #$015F, R4                      ; 613A   02BC 015F
L_613C:
        MOVR    R2,     R5                      ; 613C   0095
        DECLE   $02A8,  $02A9,  $00AA,  $0004   ; 613D   02A8 02A9 00AA 0004

        ANDR    R5,     R0                      ; 6141   01A8
        RRC     R0,     1                       ; 6142   0070

        JSR     R5,     L_61EE                  ; 6143   0004 0160 01EE

        ADDI    #$001F, R4                      ; 6146   02FC 001F
        CMPI    #$0182, R4                      ; 6148   037C 0182
        BLE     L_613C                          ; 614A   0226 000F
        PULR    R7                              ; 614C   02B7

L_614D:
        PSHR    R5                              ; 614D   0275
        MOVR    R2,     R5                      ; 614E   0095
        ADDI    #$0002, R5                      ; 614F   02FD 0002
        SDBD                                    ; 6151   0001
        MVI@    R5,     R0                      ; 6152   02A8
        SDBD                                    ; 6153   0001
        SUB@    R4,     R0                      ; 6154   0320
        BPL     L_6158                          ; 6155   0203 0001

        NEGR    R0                              ; 6157   0020
L_6158:
        CMP@    R1,     R0                      ; 6158   0348
        BGT     L_6173                          ; 6159   020E 0018

        INCR    R1                              ; 615B   0009
        SDBD                                    ; 615C   0001
        MVI@    R5,     R0                      ; 615D   02A8
        SDBD                                    ; 615E   0001
        SUB@    R4,     R0                      ; 615F   0320
        BPL     L_6163                          ; 6160   0203 0001

        NEGR    R0                              ; 6162   0020
L_6163:
        CMP@    R1,     R0                      ; 6163   0348
        BGT     L_6173                          ; 6164   020E 000D

        INCR    R1                              ; 6166   0009
        SDBD                                    ; 6167   0001
        MVI@    R5,     R0                      ; 6168   02A8
        SDBD                                    ; 6169   0001
        SUB@    R4,     R0                      ; 616A   0320
        BPL     L_616E                          ; 616B   0203 0001

        NEGR    R0                              ; 616D   0020
L_616E:
        CMP@    R1,     R0                      ; 616E   0348
        BGT     L_6173                          ; 616F   020E 0002

        CMPR    R6,     R6                      ; 6171   0176
        PULR    R7                              ; 6172   02B7

L_6173:
        CMPR    R6,     R7                      ; 6173   0177
        PULR    R7                              ; 6174   02B7

L_6175:
        PSHR    R5                              ; 6175   0275
        MVII    #$0009, R5                      ; 6176   02BD 0009
        B       L_6180                          ; 6178   0200 0006

L_617A:
        SDBD                                    ; 617A   0001
        MVI@    R5,     R4                      ; 617B   02AC
L_617C:
        PSHR    R5                              ; 617C   0275
        MVI@    R4,     R5                      ; 617D   02A5
        MVO     R5,     G_034D                  ; 617E   0245 034D
L_6180:
        DECR    R5                              ; 6180   0015
        BMI     L_6186                          ; 6181   020B 0003

        CMP@    R4,     R0                      ; 6183   0360
        BNEQ    L_6180                          ; 6184   022C 0005
L_6186:
        PULR    R7                              ; 6186   02B7

L_6187:
        PSHR    R5                              ; 6187   0275
        MVII    #$0005, R5                      ; 6188   02BD 0005
        B       L_618F                          ; 618A   0200 0003

L_618C:
        PSHR    R5                              ; 618C   0275
        MVII    #$0004, R5                      ; 618D   02BD 0004
L_618F:
        CLRR    R0                              ; 618F   01C0
L_6190:
        SLL     R0,     2                       ; 6190   004C
        PSHR    R0                              ; 6191   0270
        MVI@    R4,     R0                      ; 6192   02A0
        SWAP    R0,     1                       ; 6193   0040
        ANDI    #$0003, R0                      ; 6194   03B8 0003
        XOR@    R6,     R0                      ; 6196   03F0
        DECR    R5                              ; 6197   0015
        BNEQ    L_6190                          ; 6198   022C 0009
        PULR    R7                              ; 619A   02B7

L_619B:
        MOVR    R3,     R4                      ; 619B   009C
        ADDI    #$0002, R4                      ; 619C   02FC 0002
L_619E:
        PSHR    R5                              ; 619E   0275
        PSHR    R4                              ; 619F   0274
        MOVR    R2,     R5                      ; 61A0   0095
        ADDI    #$0002, R5                      ; 61A1   02FD 0002
        SDBD                                    ; 61A3   0001
        MVI@    R5,     R0                      ; 61A4   02A8
        SDBD                                    ; 61A5   0001
        MVI@    R5,     R1                      ; 61A6   02A9
        PSHR    R2                              ; 61A7   0272
        PSHR    R3                              ; 61A8   0273

        JSR     R5,     L_59B5                  ; 61A9   0004 0158 01B5

        PULR    R3                              ; 61AC   02B3
        PULR    R2                              ; 61AD   02B2
        PULR    R4                              ; 61AE   02B4
        PULR    R7                              ; 61AF   02B7

L_61B0:
        MOVR    R3,     R4                      ; 61B0   009C
        ADDI    #$0002, R4                      ; 61B1   02FC 0002
L_61B3:
        SDBD                                    ; 61B3   0001
        MVI@    R4,     R0                      ; 61B4   02A0
        SDBD                                    ; 61B5   0001
        MVI@    R4,     R1                      ; 61B6   02A1
L_61B7:
        PSHR    R5                              ; 61B7   0275
        MOVR    R2,     R4                      ; 61B8   0094
        ADDI    #$0002, R4                      ; 61B9   02FC 0002
        SDBD                                    ; 61BB   0001
        SUB@    R4,     R0                      ; 61BC   0320
        SDBD                                    ; 61BD   0001
        SUB@    R4,     R1                      ; 61BE   0321

        JSR     R5,     .EXEC.A2F               ; 61BF   0004 0118 022F

        MOVR    R1,     R0                      ; 61C2   0088
        PULR    R7                              ; 61C3   02B7

L_61C4:
        PSHR    R5                              ; 61C4   0275
        PSHR    R1                              ; 61C5   0271

        JSR     R5,     L_61B0                  ; 61C6   0004 0160 01B0

        PSHR    R0                              ; 61C9   0270
        MOVR    R2,     R5                      ; 61CA   0095
        ADDI    #$0008, R5                      ; 61CB   02FD 0008
        SDBD                                    ; 61CD   0001
        MVI@    R5,     R0                      ; 61CE   02A8
        SDBD                                    ; 61CF   0001
        MVI@    R5,     R1                      ; 61D0   02A9

        JSR     R5,     .EXEC.A2F               ; 61D1   0004 0118 022F

        PULR    R0                              ; 61D4   02B0
        CMPR    R0,     R1                      ; 61D5   0141
        BLT     L_61DB                          ; 61D6   0205 0003

        PSHR    R0                              ; 61D8   0270
        MOVR    R1,     R0                      ; 61D9   0088
        PULR    R1                              ; 61DA   02B1
L_61DB:
        SUBR    R1,     R0                      ; 61DB   0108
        PULR    R1                              ; 61DC   02B1
        PULR    R7                              ; 61DD   02B7

L_61DE:
        PSHR    R5                              ; 61DE   0275
        MOVR    R2,     R5                      ; 61DF   0095
        B       L_61E4                          ; 61E0   0200 0002

L_61E2:
        PSHR    R5                              ; 61E2   0275
        MOVR    R3,     R5                      ; 61E3   009D
L_61E4:
        ADDI    #$0014, R5                      ; 61E4   02FD 0014
        MVI@    R5,     R5                      ; 61E6   02AD
        CMPI    #$0003, R5                      ; 61E7   037D 0003
        BEQ     L_61ED                          ; 61E9   0204 0002

        CMPI    #$0005, R5                      ; 61EB   037D 0005
L_61ED:
        PULR    R7                              ; 61ED   02B7

L_61EE:
        MVO@    R0,     R4                      ; 61EE   0260
        SWAP    R0,     1                       ; 61EF   0040
        MVO@    R0,     R4                      ; 61F0   0260
        NOP                                     ; 61F1   0034
        MVO@    R1,     R4                      ; 61F2   0261
        SWAP    R1,     1                       ; 61F3   0041
        MVO@    R1,     R4                      ; 61F4   0261
        MOVR    R5,     R7                      ; 61F5   00AF

L_61F6:
        PSHR    R5                              ; 61F6   0275
        SDBD                                    ; 61F7   0001
        MVII    #$0FAA, R1                      ; 61F8   02B9 00AA 000F
        MOVR    R3,     R5                      ; 61FB   009D
        ADDI    #$0016, R5                      ; 61FC   02FD 0016
        MVI@    R5,     R5                      ; 61FE   02AD
        CMPI    #$0004, R5                      ; 61FF   037D 0004
        BLT     L_6206                          ; 6201   0205 0003

        MVII    #$0015, R1                      ; 6203   02B9 0015
        SWAP    R1,     1                       ; 6205   0041
L_6206:
        CMPI    #$0200, R0                      ; 6206   0378 0200
        BLT     L_6173                          ; 6208   0225 0096

        CMPR    R1,     R0                      ; 620A   0148
        BGT     L_6173                          ; 620B   022E 0099

        CMPR    R6,     R6                      ; 620D   0176
        PULR    R7                              ; 620E   02B7

L_620F:
        MOVR    R2,     R1                      ; 620F   0091
        INCR    R7                              ; 6210   000F

L_6211:
        MOVR    R3,     R1                      ; 6211   0099
L_6212:
        PSHR    R5                              ; 6212   0275
        ADDI    #$0011, R1                      ; 6213   02F9 0011
        MVII    #$00FF, R5                      ; 6215   02BD 00FF
        MVO@    R5,     R1                      ; 6217   024D
        PULR    R7                              ; 6218   02B7

L_6219:
        PSHR    R5                              ; 6219   0275
        MVI     G_0172, R0                      ; 621A   0280 0172
        MVII    #$0121, R1                      ; 621C   02B9 0121
        MVI     G_017B, R3                      ; 621E   0283 017B
L_6220:
        TSTR    R0                              ; 6220   0080
        BEQ     L_6236                          ; 6221   0204 0013

        MOVR    R1,     R2                      ; 6223   008A
L_6224:
        MOVR    R1,     R4                      ; 6224   008C
        MVII    #$001A, R0                      ; 6225   02B8 001A

        JSR     R5,     X_RAND2                 ; 6227   0004 0114 029E

        ADDI    #$002D, R0                      ; 622A   02F8 002D

        JSR     R5,     L_6175                  ; 622C   0004 0160 0175

        BEQ     L_6224                          ; 622F   0224 000C

        MVO@    R0,     R2                      ; 6231   0250
        INCR    R2                              ; 6232   000A
        DECR    R3                              ; 6233   0013
        BNEQ    L_6224                          ; 6234   022C 0011

L_6236:
        CMPI    #$012A, R1                      ; 6236   0379 012A
        BGE     L_6132                          ; 6238   022D 0107

        MVII    #$012A, R1                      ; 623A   02B9 012A
        MVI     G_019E, R3                      ; 623C   0283 019E
        MVI     G_0195, R0                      ; 623E   0280 0195
        B       L_6220                          ; 6240   0220 0021

        DECLE   $0000,  $0090,  $0061,  $012C   ; 6242   0000 0090 0061 012C
        DECLE   $0046,  $002D,  $0023,  $0007   ; 6246   0046 002D 0023 0007
        DECLE   $0002,  $0003,  $0004,  $0030   ; 624A   0002 0003 0004 0030
        DECLE   $0090,  $0062,  $00F2,  $0041   ; 624E   0090 0062 00F2 0041
        DECLE   $001E,  $0037,  $0006,  $000D   ; 6252   001E 0037 0006 000D
        DECLE   $000C,  $0002,  $0060,  $0090   ; 6256   000C 0002 0060 0090
        DECLE   $0068,  $0143,  $0032,  $0032   ; 625A   0068 0143 0032 0032
        DECLE   $0032,  $000B,  $000A,  $0003   ; 625E   0032 000B 000A 0003
        DECLE   $0008,  $00A4,  $0090,  $0065   ; 6262   0008 00A4 0090 0065
        DECLE   $00EE,  $0023,  $0032,  $0041   ; 6266   00EE 0023 0032 0041
        DECLE   $0006,  $000C,  $000B,  $000E   ; 626A   0006 000C 000B 000E
        DECLE   $00E4,  $0090,  $0063,  $011B   ; 626E   00E4 0090 0063 011B
        DECLE   $0037                           ; 6272   0037

        RSWD    R4                              ; 6273   003C
        NEGR    R3                              ; 6274   0023
        DIS                                     ; 6275   0003
        EIS                                     ; 6276   0002
        INCR    R1                              ; 6277   0009
        INCR    R3                              ; 6278   000B
        DECR    R4                              ; 6279   0014
        MOVR    R2,     R1                      ; 627A   0091
        SLR     R2,     1                       ; 627B   0062
        SUBR    R2,     R0                      ; 627C   0110
        RSWD    R4                              ; 627D   003C
        COMR    R1                              ; 627E   0019
        SWAP    R1,     1                       ; 627F   0041
        SETC                                    ; 6280   0007
        INCR    R4                              ; 6281   000C
        INCR    R7                              ; 6282   000F

        CLRC                                    ; 6283   0006
L_6284:
        SLL     R0,     2                       ; 6284   004C
        DECLE   $0091,  $0063,  $012B,  $0028   ; 6285   0091 0063 012B 0028
        DECLE   $0032,  $003C,  $0003,  $0006   ; 6289   0032 003C 0003 0006
        DECLE   $000B,  $0009,  $0088,  $0091   ; 628D   000B 0009 0088 0091
        DECLE   $0065,  $0108,  $002D,  $0041   ; 6291   0065 0108 002D 0041
        DECLE   $0028,  $0001,  $000D,  $0006   ; 6295   0028 0001 000D 0006
        DECLE   $000A,  $00B8,  $0091,  $0069   ; 6299   000A 00B8 0091 0069
        DECLE   $013D,  $0037                   ; 629D   013D 0037

        SWAP    R1,     1                       ; 629F   0041
        COMR    R6                              ; 62A0   001E
        INCR    R7                              ; 62A1   000F

        INCR    R3                              ; 62A2   000B
L_62A3:
        INCR    R2                              ; 62A3   000A
        DECLE   $0003,  $0000,  $0092,  $0066   ; 62A4   0003 0000 0092 0066
        DECLE   $011E,  $0032,  $002D,  $0037   ; 62A8   011E 0032 002D 0037
        DECLE   $0006,  $000E,  $000D,  $0001   ; 62AC   0006 000E 000D 0001
        DECLE   $0040,  $0092,  $0065,  $0101   ; 62B0   0040 0092 0065 0101
        DECLE   $003C,  $0032,  $0028,  $0002   ; 62B4   003C 0032 0028 0002
        DECLE   $0004,  $0003,  $000D,  $0064   ; 62B8   0004 0003 000D 0064
        DECLE   $0092,  $0067,  $0124,  $0037   ; 62BC   0092 0067 0124 0037
        DECLE   $0019,  $0046,  $0003,  $0005   ; 62C0   0019 0046 0003 0005
        DECLE   $0001                           ; 62C4   0001

        INCR    R7                              ; 62C5   000F

L_62C6:
        PSHR    R5                              ; 62C6   0275

L_62C7:
        JSR     R5,     L_6127                  ; 62C7   0004 0160 0127

        MVII    #$0032, R0                      ; 62CA   02B8 0032
        MVO     R0,     G_01A5                  ; 62CC   0240 01A5
        CLRR    R0                              ; 62CE   01C0
        MVO     R0,     G_01A8                  ; 62CF   0240 01A8
        MVII    #$015D, R4                      ; 62D1   02BC 015D
        MVII    #$0161, R5                      ; 62D3   02BD 0161
        SDBD                                    ; 62D5   0001
        MVI@    R5,     R2                      ; 62D6   02AA
        MVII    #$0184, R5                      ; 62D7   02BD 0184
        SDBD                                    ; 62D9   0001
        MVI@    R5,     R3                      ; 62DA   02AB
        CMPR    R2,     R3                      ; 62DB   0153
        BLT     L_62E0                          ; 62DC   0205 0002

        ADDI    #$0023, R4                      ; 62DE   02FC 0023
L_62E0:
        MVII    #$031B, R3                      ; 62E0   02BB 031B
L_62E2:
        MVO     R4,     G_0339                  ; 62E2   0244 0339
        DECLE   $02A0,  $0081,  $03B8,  $0001   ; 62E4   02A0 0081 03B8 0001
        DECLE   $0240,  $01A6,  $03B9,  $0002   ; 62E8   0240 01A6 03B9 0002
        DECLE   $0241,  $01A7,  $02A0,  $0240   ; 62EC   0241 01A7 02A0 0240
        DECLE   $01A3,  $0001,  $02A0,  $0001   ; 62F0   01A3 0001 02A0 0001
        DECLE   $02A1,  $0004,  $01A8,  $0067   ; 62F4   02A1 0004 01A8 0067
        DECLE   $0240,  $033A,  $0241,  $033B   ; 62F8   0240 033A 0241 033B
        DECLE   $0001,  $02A0,  $0004           ; 62FC   0001 02A0 0004

        ANDR    R5,     R0                      ; 62FF   01A8
        SAR     R3,     1                       ; 6300   006B
        MVO     R0,     G_033C                  ; 6301   0240 033C
        ADDI    #$000A, R4                      ; 6303   02FC 000A
        MVI@    R4,     R0                      ; 6305   02A0
        MVO     R0,     G_01A4                  ; 6306   0240 01A4

        JSR     R5,     L_6458                  ; 6308   0004 0164 0058

        MVI     G_01A4, R2                      ; 630B   0282 01A4
        SLL     R2,     1                       ; 630D   004A
        PSHR    R2                              ; 630E   0272
        SLL     R2,     1                       ; 630F   004A
        ADD@    R6,     R2                      ; 6310   02F2
        MOVR    R2,     R4                      ; 6311   0094
        SDBD                                    ; 6312   0001
        ADDI    #$A5DE, R4                      ; 6313   02FC 00DE 00A5
        MVI     G_01A3, R1                      ; 6316   0281 01A3

        JSR     R5,     L_6994                  ; 6318   0004 0168 0194
        DECLE   $0007                           ; 631B   0007

        MOVR    R1,     R2                      ; 631C   008A

        JSR     R5,     L_642D                  ; 631D   0004 0164 002D

        PSHR    R0                              ; 6320   0270
        PSHR    R1                              ; 6321   0271

        JSR     R5,     L_642D                  ; 6322   0004 0164 002D

        MVI     G_01A6, R5                      ; 6325   0285 01A6
        TSTR    R5                              ; 6327   00AD
        BEQ     L_632B                          ; 6328   0204 0001

        MOVR    R1,     R0                      ; 632A   0088

L_632B:
        JSR     R5,     L_6436                  ; 632B   0004 0164 0036

        XORI    #$0200, R0                      ; 632E   03F8 0200
        MVO@    R0,     R3                      ; 6330   0258
        ADDI    #$0008, R3                      ; 6331   02FB 0008
        PULR    R1                              ; 6333   02B1

        JSR     R5,     L_644E                  ; 6334   0004 0164 004E
        JSR     R5,     L_63CE                  ; 6337   0004 0160 03CE

        XORI    #$0080, R1                      ; 633A   03F9 0080
        PULR    R0                              ; 633C   02B0
        RRC     R0,     1                       ; 633D   0070
        BNC     L_6344                          ; 633E   0209 0004

        SDBD                                    ; 6340   0001
        XORI    #$0800, R1                      ; 6341   03F9 0000 0008
L_6344:
        PSHR    R0                              ; 6344   0270
        MVO@    R1,     R3                      ; 6345   0259
        ADDI    #$0008, R3                      ; 6346   02FB 0008

        JSR     R5,     L_63D9                  ; 6348   0004 0160 03D9

        MVO@    R0,     R3                      ; 634B   0258
        MVI     G_01A3, R1                      ; 634C   0281 01A3
        PSHR    R1                              ; 634E   0271
        SLL     R1,     2                       ; 634F   004D
        ADD@    R6,     R1                      ; 6350   02F1
        SLL     R1,     2                       ; 6351   004D
        SLL     R1,     2                       ; 6352   004D
        SDBD                                    ; 6353   0001
        ADDI    #$9000, R1                      ; 6354   02F9 0000 0090
        PULR    R0                              ; 6357   02B0

        JSR     R5,     L_63FD                  ; 6358   0004 0160 03FD

        SUBI    #$000F, R3                      ; 635B   033B 000F
        MVI@    R4,     R0                      ; 635D   02A0
        PSHR    R0                              ; 635E   0270

        JSR     R5,     L_642D                  ; 635F   0004 0164 002D

        CMPI    #$0010, R0                      ; 6362   0378 0010
        BLT     L_6368                          ; 6364   0205 0002

        SUBI    #$0020, R0                      ; 6366   0338 0020
L_6368:
        MVI     G_01A6, R5                      ; 6368   0285 01A6
        TSTR    R5                              ; 636A   00AD
        BEQ     L_636E                          ; 636B   0204 0001

        NEGR    R0                              ; 636D   0020

L_636E:
        JSR     R5,     L_643C                  ; 636E   0004 0164 003C

        SDBD                                    ; 6371   0001
        XORI    #$0600, R0                      ; 6372   03F8 0000 0006
        MVO@    R0,     R3                      ; 6375   0258
        ADDI    #$0008, R3                      ; 6376   02FB 0008

        JSR     R5,     L_644E                  ; 6378   0004 0164 004E
        JSR     R5,     L_63CE                  ; 637B   0004 0160 03CE

        XORI    #$0180, R1                      ; 637E   03F9 0180
        MVO@    R1,     R3                      ; 6380   0259
        ADDI    #$0008, R3                      ; 6381   02FB 0008

        JSR     R5,     L_63D9                  ; 6383   0004 0160 03D9

        MVO@    R0,     R3                      ; 6386   0258
        PULR    R0                              ; 6387   02B0
        SDBD                                    ; 6388   0001
        MVII    #$93C0, R1                      ; 6389   02B9 00C0 0093

        JSR     R5,     L_63FD                  ; 638C   0004 0160 03FD

        SUBI    #$000F, R3                      ; 638F   033B 000F
        MVI@    R4,     R0                      ; 6391   02A0
        PSHR    R0                              ; 6392   0270
        MVI     G_033A, R0                      ; 6393   0280 033A

        JSR     R5,     L_6440                  ; 6395   0004 0164 0040

        SDBD                                    ; 6398   0001
        XORI    #$0600, R0                      ; 6399   03F8 0000 0006
        MVO@    R0,     R3                      ; 639C   0258
        ADDI    #$0008, R3                      ; 639D   02FB 0008

        JSR     R5,     L_642D                  ; 639F   0004 0164 002D
        JSR     R5,     L_644E                  ; 63A2   0004 0164 004E
        JSR     R5,     L_63CE                  ; 63A5   0004 0160 03CE

        XORI    #$0180, R1                      ; 63A8   03F9 0180
        MVO@    R1,     R3                      ; 63AA   0259
        ADDI    #$0008, R3                      ; 63AB   02FB 0008

        JSR     R5,     L_63D9                  ; 63AD   0004 0160 03D9

        MVO@    R0,     R3                      ; 63B0   0258
        PULR    R0                              ; 63B1   02B0
        SDBD                                    ; 63B2   0001
        MVII    #$96B0, R1                      ; 63B3   02B9 00B0 0096

        JSR     R5,     L_63FD                  ; 63B6   0004 0160 03FD

        MVI     G_01A8, R0                      ; 63B9   0280 01A8
        CMPI    #$0005, R0                      ; 63BB   0378 0005
        BGT     L_63CD                          ; 63BD   020E 000E

        SUBI    #$000F, R3                      ; 63BF   033B 000F
        MVI     G_0339, R4                      ; 63C1   0284 0339
        ADDI    #$0023, R4                      ; 63C3   02FC 0023
        CMPI    #$0180, R4                      ; 63C5   037C 0180
        BEQ     L_62E2                          ; 63C7   0224 00E6

        MVII    #$015D, R4                      ; 63C9   02BC 015D
        B       L_62E2                          ; 63CB   0220 00EA
L_63CD:
        PULR    R7                              ; 63CD   02B7

L_63CE:
        PSHR    R5                              ; 63CE   0275
        MVI     G_01A6, R5                      ; 63CF   0285 01A6
        TSTR    R5                              ; 63D1   00AD
        BEQ     L_63D8                          ; 63D2   0204 0004

        SDBD                                    ; 63D4   0001
        XORI    #$0400, R1                      ; 63D5   03F9 0000 0004
L_63D8:
        PULR    R7                              ; 63D8   02B7

L_63D9:
        MVI@    R2,     R0                      ; 63D9   0290
        INCR    R2                              ; 63DA   000A
        MOVR    R0,     R1                      ; 63DB   0081
        ANDI    #$0007, R0                      ; 63DC   03B8 0007
        ANDI    #$0008, R1                      ; 63DE   03B9 0008
        BEQ     L_63E6                          ; 63E0   0204 0004

        SDBD                                    ; 63E2   0001
        XORI    #$1000, R0                      ; 63E3   03F8 0000 0010
L_63E6:
        MVI     G_01A7, R1                      ; 63E6   0281 01A7
        TSTR    R1                              ; 63E8   0089
        BEQ     L_63EF                          ; 63E9   0204 0004

        SDBD                                    ; 63EB   0001
        XORI    #$2000, R0                      ; 63EC   03F8 0000 0020
L_63EF:
        MVI     G_01A5, R1                      ; 63EF   0281 01A5
        ADDI    #$0002, R1                      ; 63F1   02F9 0002
        MVO     R1,     G_01A5                  ; 63F3   0241 01A5
        SLL     R1,     2                       ; 63F5   004D
        SLL     R1,     1                       ; 63F6   0049
        XORR    R1,     R0                      ; 63F7   01C8
        SDBD                                    ; 63F8   0001
        XORI    #$0800, R0                      ; 63F9   03F8 0000 0008
        MOVR    R5,     R7                      ; 63FC   00AF

L_63FD:
        SLL     R0,     2                       ; 63FD   004C
        SLL     R0,     2                       ; 63FE   004C
        ADDR    R1,     R0                      ; 63FF   00C8
        MVI     G_01A8, R1                      ; 6400   0281 01A8
        ADDI    #$0331, R1                      ; 6402   02F9 0331
        MVO@    R0,     R1                      ; 6404   0248
        SUBI    #$0330, R1                      ; 6405   0339 0330
        MVO     R1,     G_01A8                  ; 6407   0241 01A8
        MOVR    R5,     R7                      ; 6409   00AF

L_640A:
        PSHR    R5                              ; 640A   0275
        MVI     G_0181, R2                      ; 640B   0282 0181
        MVI     G_017C, R3                      ; 640D   0283 017C
        MVI     G_019F, R4                      ; 640F   0284 019F
        MVII    #$015E, R1                      ; 6411   02B9 015E
        MVII    #$0002, R0                      ; 6413   02B8 0002
L_6415:
        PSHR    R0                              ; 6415   0270
L_6416:
        MVII    #$000C, R0                      ; 6416   02B8 000C

        JSR     R5,     X_RAND2                 ; 6418   0004 0114 029E

L_641B:
        CMPR    R0,     R2                      ; 641B   0142
        BEQ     L_6416                          ; 641C   0224 0007

        CMPR    R0,     R3                      ; 641E   0143
        BEQ     L_6416                          ; 641F   0224 000A

        CMPR    R0,     R4                      ; 6421   0144
        BEQ     L_6416                          ; 6422   0224 000D

        MVO@    R0,     R1                      ; 6424   0248
        MOVR    R0,     R2                      ; 6425   0082
        MVII    #$0181, R1                      ; 6426   02B9 0181
        PULR    R0                              ; 6428   02B0
        DECR    R0                              ; 6429   0010
        BNEQ    L_6415                          ; 642A   022C 0016
        PULR    R7                              ; 642C   02B7

L_642D:
        MVI@    R4,     R0                      ; 642D   02A0
L_642E:
        MOVR    R0,     R1                      ; 642E   0081
        ANDI    #$001F, R0                      ; 642F   03B8 001F
        XORR    R0,     R1                      ; 6431   01C1
        SLL     R1,     2                       ; 6432   004D
        SLL     R1,     1                       ; 6433   0049
        SWAP    R1,     1                       ; 6434   0041
        MOVR    R5,     R7                      ; 6435   00AF

L_6436:
        CMPI    #$0010, R0                      ; 6436   0378 0010
        BLT     L_643C                          ; 6438   0205 0002

        SUBI    #$0020, R0                      ; 643A   0338 0020
L_643C:
        PSHR    R5                              ; 643C   0275
        ADD     G_033A, R0                      ; 643D   02C0 033A
        INCR    R7                              ; 643F   000F

L_6440:
        PSHR    R5                              ; 6440   0275
L_6441:
        MVI     G_0345, R5                      ; 6441   0285 0345
        SDBD                                    ; 6443   0001
        ANDI    #$FFF8, R5                      ; 6444   03BD 00F8 00FF
        SUBR    R5,     R0                      ; 6447   0128
        CMPI    #$00A8, R0                      ; 6448   0378 00A8
        BLE     L_644D                          ; 644A   0206 0001

        CLRR    R0                              ; 644C   01C0
L_644D:
        PULR    R7                              ; 644D   02B7

L_644E:
        NEGR    R1                              ; 644E   0021
        ADD     G_033B, R1                      ; 644F   02C1 033B
        SUB     G_033C, R1                      ; 6451   0301 033C
        BPL     L_6457                          ; 6453   0203 0002

        MVII    #$007F, R1                      ; 6455   02B9 007F
L_6457:
        MOVR    R5,     R7                      ; 6457   00AF

L_6458:
        PSHR    R5                              ; 6458   0275
        MVI     G_0138, R0                      ; 6459   0280 0138
        CMPI    #$0008, R0                      ; 645B   0378 0008
        BNEQ    L_6481                          ; 645D   020C 0022

        MVI     G_0339, R2                      ; 645F   0282 0339
        MOVR    R2,     R5                      ; 6461   0095
        ADDI    #$0014, R5                      ; 6462   02FD 0014
        MVI@    R5,     R0                      ; 6464   02A8

        JSR     R5,     L_617A                  ; 6465   0004 0160 017A
        BIDECLE $6482                           ; 6468   0082 0064

        BNEQ    L_6481                          ; 646A   020C 0015

        PSHR    R3                              ; 646C   0273

        JSR     R5,     L_60C2                  ; 646D   0004 0160 00C2

        MOVR    R3,     R5                      ; 6470   009D
        PULR    R3                              ; 6471   02B3
        ADDI    #$0002, R5                      ; 6472   02FD 0002
        SDBD                                    ; 6474   0001
        MVI@    R5,     R0                      ; 6475   02A8
        MOVR    R2,     R5                      ; 6476   0095
        ADDI    #$0002, R5                      ; 6477   02FD 0002
        CLRR    R1                              ; 6479   01C9
        SDBD                                    ; 647A   0001
        CMP@    R5,     R0                      ; 647B   0368
        BGT     L_647F                          ; 647C   020E 0001

        INCR    R1                              ; 647E   0009
L_647F:
        MVO     R1,     G_01A6                  ; 647F   0241 01A6
L_6481:
        PULR    R7                              ; 6481   02B7

        DECLE   $0006,  $001C,  $0001,  $0008   ; 6482   0006 001C 0001 0008
        DECLE   $0037                           ; 6486   0037

        GSWD    R3                              ; 6487   0033
        RSWD    R1                              ; 6488   0039
L_6489:
        PSHR    R5                              ; 6489   0275
        MVI     G_0138, R2                      ; 648A   0282 0138
        CMPI    #$0006, R2                      ; 648C   037A 0006
        BEQ     L_6644                          ; 648E   0204 01B4

        CMPI    #$0005, R2                      ; 6490   037A 0005
        BEQ     L_6650                          ; 6492   0204 01BC

        JSR     R5,     L_67D0                  ; 6494   0004 0164 03D0

        MVI     G_0138, R2                      ; 6497   0282 0138
        INCR    R2                              ; 6499   000A
        ADDR    R7,     R2                      ; 649A   00FA
        ADD@    R2,     R7                      ; 649B   02D7

        INCR    R6                              ; 649C   000E
        COMR    R2                              ; 649D   001A
        GSWD    R3                              ; 649E   0033
        ADDR    R1,     R2                      ; 649F   00CA
        CMPR    R0,     R2                      ; 64A0   0142
        ANDR    R6,     R4                      ; 64A1   01B4
        ANDR    R5,     R0                      ; 64A2   01A8
        SAR     R2,     1                       ; 64A3   006A
        XORR    R2,     R6                      ; 64A4   01D6
        MVO@    R4,     R2                      ; 64A5   0254
        ADD@    R1,     R7                      ; 64A6   02CF

        ADDI    #$0017, R0                      ; 64A7   02F8 0017
        MVO@    R4,     R2                      ; 64A9   0254
        TSTR    R0                              ; 64AA   0080
        BEQ     L_64B0                          ; 64AB   0204 0003
        J       L_59CC                          ; 64AD   0004 0358 01CC
L_64B0:
        J       L_5CD6                          ; 64B0   0004 035C 00D6
        J       L_5644                          ; 64B3   0004 0354 0244

        DECR    R0                              ; 64B6   0010
        BMI     L_6636                          ; 64B7   020B 017D

        CMPI    #$0002, R0                      ; 64B9   0378 0002
        BGE     L_6636                          ; 64BB   020D 0179

        MVO     R0,     G_0137                  ; 64BD   0240 0137
        MVII    #$0278, R1                      ; 64BF   02B9 0278

        JSR     R5,     L_6113                  ; 64C1   0004 0160 0113
        DECLE   $0004,  $01A0,  $00B9,  $0000   ; 64C4   0004 01A0 00B9 0000

        JSR     R5,     L_5240                  ; 64C8   0004 0150 0240
        DECLE   $0019                           ; 64CB   0019

        J       L_59E5                          ; 64CC   0004 0358 01E5

        DECR    R0                              ; 64CF   0010
        BMI     L_6636                          ; 64D0   020B 0164

        CMPI    #$0002, R0                      ; 64D2   0378 0002
        BGE     L_6636                          ; 64D4   020D 0160

        MVII    #$0006, R3                      ; 64D6   02BB 0006
        MVII    #$0172, R2                      ; 64D8   02BA 0172
        TSTR    R1                              ; 64DA   0089
        BEQ     L_64E0                          ; 64DB   0204 0003

        ADDI    #$0023, R2                      ; 64DD   02FA 0023
        INCR    R3                              ; 64DF   000B
L_64E0:
        MVI@    R2,     R1                      ; 64E0   0291
        CMPI    #$00FF, R1                      ; 64E1   0379 00FF
        BNEQ    L_66F0                          ; 64E3   020C 020B

        MVO@    R0,     R2                      ; 64E5   0250
        MVII    #$0250, R1                      ; 64E6   02B9 0250
        CMPI    #$0172, R2                      ; 64E8   037A 0172
        BEQ     L_64EE                          ; 64EA   0204 0002

        ADDI    #$0064, R1                      ; 64EC   02F9 0064

L_64EE:
        JSR     R5,     L_6113                  ; 64EE   0004 0160 0113
        DECLE   $0098,  $0004                   ; 64F1   0098 0004

        ANDR    R4,     R0                      ; 64F3   01A0
        MOVR    R7,     R2                      ; 64F4   00BA
        MVII    #$00FF, R0                      ; 64F5   02B8 00FF
        CMP     G_0172, R0                      ; 64F7   0340 0172
        BEQ     L_66F0                          ; 64F9   0204 01F5

        CMP     G_0195, R0                      ; 64FB   0340 0195
        BEQ     L_66F0                          ; 64FD   0204 01F1

        JSR     R5,     L_5240                  ; 64FF   0004 0150 0240
        DECLE   $001E                           ; 6502   001E

        J       L_5A39                          ; 6503   0004 0358 0239

        MOVR    R1,     R4                      ; 6506   008C
        MVII    #$0252, R1                      ; 6507   02B9 0252
        MVII    #$017B, R2                      ; 6509   02BA 017B
        MVII    #$0006, R3                      ; 650B   02BB 0006
        TSTR    R4                              ; 650D   00A4
        BEQ     L_6515                          ; 650E   0204 0005

        MVII    #$0261, R1                      ; 6510   02B9 0261
L_6512:
        ADDI    #$0023, R2                      ; 6512   02FA 0023
        INCR    R3                              ; 6514   000B
L_6515:
        DECR    R0                              ; 6515   0010
        BMI     L_6636                          ; 6516   020B 011E

        CMPI    #$0006, R0                      ; 6518   0378 0006
        BGE     L_6636                          ; 651A   020D 011A

        MVI@    R2,     R4                      ; 651C   0294
        CMPI    #$00FF, R4                      ; 651D   037C 00FF
        BNEQ    L_66F0                          ; 651F   020C 01CF

        MVO@    R0,     R2                      ; 6521   0250
        MVII    #$0001, R2                      ; 6522   02BA 0001

        JSR     R5,     L_6115                  ; 6524   0004 0160 0115
        DECLE   $0098,  $0004                   ; 6527   0098 0004

        ANDR    R4,     R0                      ; 6529   01A0
        MOVR    R7,     R2                      ; 652A   00BA
        MVII    #$00FF, R0                      ; 652B   02B8 00FF
        CMP     G_017B, R0                      ; 652D   0340 017B
        BEQ     L_66F0                          ; 652F   0204 01BF

        CMP     G_019E, R0                      ; 6531   0340 019E
        BEQ     L_66F0                          ; 6533   0204 01BB

        MVII    #$017B, R2                      ; 6535   02BA 017B
L_6537:
        MVI@    R2,     R1                      ; 6537   0291
        ANDI    #$007F, R1                      ; 6538   03B9 007F
        ADDR    R7,     R1                      ; 653A   00F9
        ADDI    #$0025, R1                      ; 653B   02F9 0025
        MVI@    R1,     R0                      ; 653D   0288
        MVO@    R0,     R2                      ; 653E   0250
        ADDI    #$0023, R2                      ; 653F   02FA 0023
        CMPI    #$019E, R2                      ; 6541   037A 019E
        BLE     L_6537                          ; 6543   0226 000D

        JSR     R5,     L_6219                  ; 6545   0004 0160 0219
        JSR     R5,     L_5240                  ; 6548   0004 0150 0240
        DECLE   $001E                           ; 654B   001E
L_654C:
        JSR     R5,     L_605C                  ; 654C   0004 0160 005C

        MVI     G_0137, R0                      ; 654F   0280 0137
        MVO     R0,     G_0136                  ; 6551   0240 0136

        JSR     R5,     L_6054                  ; 6553   0004 0160 0054
L_6556:
        JSR     R5,     L_5B4A                  ; 6556   0004 0158 034A
        JSR     R5,     L_5240                  ; 6559   0004 0150 0240
        DECLE   $0032                           ; 655C   0032

        J       L_59FE                          ; 655D   0004 0358 01FE

        DECLE   $0004,  $0005                   ; 6560   0004 0005

        CLRC                                    ; 6562   0006
        SETC                                    ; 6563   0007
        INCR    R0                              ; 6564   0008
        INCR    R1                              ; 6565   0009
        CMPI    #$000B, R0                      ; 6566   0378 000B
        BNEQ    L_6636                          ; 6568   020C 00CC

        MVII    #$0172, R2                      ; 656A   02BA 0172
        MVII    #$02C8, R4                      ; 656C   02BC 02C8
        MVII    #$0006, R0                      ; 656E   02B8 0006
        MVII    #$0005, R3                      ; 6570   02BB 0005
        TSTR    R1                              ; 6572   0089
        BEQ     L_657C                          ; 6573   0204 0007

        INCR    R0                              ; 6575   0008
        MVII    #$0195, R2                      ; 6576   02BA 0195
        MVII    #$0001, R3                      ; 6578   02BB 0001
        ADDI    #$000A, R4                      ; 657A   02FC 000A
L_657C:
        MVI@    R2,     R5                      ; 657C   0295
        MOVR    R5,     R1                      ; 657D   00A9
        ANDI    #$0002, R5                      ; 657E   03BD 0002
        BNEQ    L_66F0                          ; 6580   020C 016E

        XORI    #$0002, R1                      ; 6582   03F9 0002
        MVO@    R1,     R2                      ; 6584   0251
        PSHR    R0                              ; 6585   0270

        JSR     R5,     L_5C89                  ; 6586   0004 015C 0089

        SUBI    #$0008, R4                      ; 6589   033C 0008
        SDBD                                    ; 658B   0001
        MVII    #$9C48, R1                      ; 658C   02B9 0048 009C

        JSR     R5,     L_56E8                  ; 658F   0004 0154 02E8
        DECLE   $02B0,  $0004                   ; 6592   02B0 0004

        ANDR    R4,     R0                      ; 6594   01A0
        MOVR    R7,     R2                      ; 6595   00BA
        MVI     G_0172, R0                      ; 6596   0280 0172
        ANDI    #$0002, R0                      ; 6598   03B8 0002
        BEQ     L_66F0                          ; 659A   0204 0154

        MVI     G_0195, R0                      ; 659C   0280 0195
        ANDI    #$0002, R0                      ; 659E   03B8 0002
        BEQ     L_66F0                          ; 65A0   0204 014E

        MVI     G_0172, R0                      ; 65A2   0280 0172
        ANDI    #$00FD, R0                      ; 65A4   03B8 00FD
        MVO     R0,     G_0172                  ; 65A6   0240 0172
        MVI     G_0195, R0                      ; 65A8   0280 0195
        ANDI    #$00FD, R0                      ; 65AA   03B8 00FD
        MVO     R0,     G_0195                  ; 65AC   0240 0195

        JSR     R5,     L_5240                  ; 65AE   0004 0150 0240
        DECLE   $001E                           ; 65B1   001E

        JSR     R5,     L_6051                  ; 65B2   0004 0160 0051
        JSR     R5,     L_606E                  ; 65B5   0004 0160 006E

        MVI     G_0137, R0                      ; 65B8   0280 0137
        TSTR    R0                              ; 65BA   0080
        BEQ     L_65D0                          ; 65BB   0204 0013

        MVI     G_0136, R0                      ; 65BD   0280 0136
        INCR    R0                              ; 65BF   0008
        MVO     R0,     G_0136                  ; 65C0   0240 0136
        CMPI    #$0002, R0                      ; 65C2   0378 0002
        BGT     L_65D0                          ; 65C4   020E 000A

        MVI     G_015E, R0                      ; 65C6   0280 015E
        MVO     R0,     G_017C                  ; 65C8   0240 017C
        MVI     G_0181, R0                      ; 65CA   0280 0181
        MVO     R0,     G_019F                  ; 65CC   0240 019F
        B       L_6556                          ; 65CE   0220 0079

L_65D0:
        MVII    #$015D, R0                      ; 65D0   02B8 015D
        MVO     R0,     G_0339                  ; 65D2   0240 0339

L_65D4:
        JSR     R5,     L_5B79                  ; 65D4   0004 0158 0379
        JSR     R5,     L_5240                  ; 65D7   0004 0150 0240
        DECLE   $0032                           ; 65DA   0032

        J       L_5A5D                          ; 65DB   0004 0358 025D

        JSR     R5,     L_67E2                  ; 65DE   0004 0164 03E2

        DECR    R0                              ; 65E1   0010
        BMI     L_6636                          ; 65E2   020B 0052

        MVII    #$0121, R1                      ; 65E4   02B9 0121
        MVI     G_017B, R2                      ; 65E6   0282 017B
        MVII    #$0005, R3                      ; 65E8   02BB 0005
        MVII    #$0006, R5                      ; 65EA   02BD 0006
        CMPI    #$015D, R4                      ; 65EC   037C 015D
        BEQ     L_65F7                          ; 65EE   0204 0007

        MVII    #$012A, R1                      ; 65F0   02B9 012A
        MVI     G_019E, R2                      ; 65F2   0282 019E
        MVII    #$0001, R3                      ; 65F4   02BB 0001
        INCR    R5                              ; 65F6   000D
L_65F7:
        CMPI    #$000A, R0                      ; 65F7   0378 000A
        BEQ     L_661A                          ; 65F9   0204 001F

        CMPR    R2,     R0                      ; 65FB   0150
        BGE     L_6636                          ; 65FC   020D 0038

        ADDR    R0,     R1                      ; 65FE   00C1
        MVI     G_01A9, R4                      ; 65FF   0284 01A9
        MVO@    R4,     R1                      ; 6601   024C
        SLL     R0,     2                       ; 6602   004C
        PSHR    R0                              ; 6603   0270
        SLL     R0,     2                       ; 6604   004C
        ADD@    R6,     R0                      ; 6605   02F0
        MVII    #$023E, R4                      ; 6606   02BC 023E
        ADDR    R0,     R4                      ; 6608   00C4
        MVII    #$0012, R0                      ; 6609   02B8 0012
        PSHR    R4                              ; 660B   0274

        JSR     R5,     X_FILL_ZERO             ; 660C   0004 0114 0338

        PULR    R4                              ; 660F   02B4
        MVI     G_01A9, R0                      ; 6610   0280 01A9

        JSR     R5,     L_5CAC                  ; 6612   0004 015C 00AC
        DECLE   $02B8,  $0000,  $0004           ; 6615   02B8 0000 0004

        AND@    R4,     R0                      ; 6618   03A0
        MOVR    R7,     R3                      ; 6619   00BB
L_661A:
        MVI@    R1,     R0                      ; 661A   0288
        DECLE   $0080,  $0204,  $0018,  $0009   ; 661B   0080 0204 0018 0009
        DECLE   $0012,  $022C,  $0007,  $00A8   ; 661F   0012 022C 0007 00A8
        DECLE   $0004                           ; 6623   0004

        ANDR    R4,     R0                      ; 6624   01A0
        MOVR    R7,     R2                      ; 6625   00BA

        JSR     R5,     L_5240                  ; 6626   0004 0150 0240
        DECLE   $0014                           ; 6629   0014

        MVI     G_0339, R0                      ; 662A   0280 0339
        CMPI    #$0180, R0                      ; 662C   0378 0180
        BEQ     L_663A                          ; 662E   0204 000A

        MVII    #$0180, R0                      ; 6630   02B8 0180
        MVO     R0,     G_0339                  ; 6632   0240 0339
        B       L_65D4                          ; 6634   0220 0061

L_6636:
        MVII    #$0008, R0                      ; 6636   02B8 0008
        DECLE   $0220,  $0022                   ; 6638   0220 0022
L_663A:
        MVII    #$0001, R0                      ; 663A   02B8 0001
        MVO     R0,     G_0136                  ; 663C   0240 0136

        JSR     R5,     L_60BB                  ; 663E   0004 0160 00BB

        J       L_69BD                          ; 6641   0004 0368 01BD

L_6644:
        CMPI    #$000B, R0                      ; 6644   0378 000B
        BNEQ    L_66F0                          ; 6646   020C 00A8

        JSR     R5,     L_67D0                  ; 6648   0004 0164 03D0

        MVO     R2,     G_0139                  ; 664B   0242 0139
        J       L_6A66                          ; 664D   0004 0368 0266

L_6650:
        CMPI    #$000A, R0                      ; 6650   0378 000A
        BLT     L_66F0                          ; 6652   0205 009C

        JSR     R5,     L_67D0                  ; 6654   0004 0164 03D0
        DECLE   $0242,  $0139,  $0378,  $000B   ; 6657   0242 0139 0378 000B
        DECLE   $0204,  $000F,  $0004,  $01A0   ; 665B   0204 000F 0004 01A0
        DECLE   $00B9,  $0000                   ; 665F   00B9 0000

        MVII    #$000B, R1                      ; 6661   02B9 000B
        MVO     R1,     G_0138                  ; 6663   0241 0138
        MVII    #$015D, R1                      ; 6665   02B9 015D
        MVO     R1,     G_0339                  ; 6667   0241 0339
L_6669:
        J       L_5A68                          ; 6669   0004 0358 0268
        J       L_6A85                          ; 666C   0004 0368 0285

        PSHR    R5                              ; 666F   0275
        MVI     G_01B3, R1                      ; 6670   0281 01B3
        MVII    #$015D, R2                      ; 6672   02BA 015D
        MVII    #$0121, R4                      ; 6674   02BC 0121
        TSTR    R1                              ; 6676   0089
        BEQ     L_667D                          ; 6677   0204 0004

        ADDI    #$0023, R2                      ; 6679   02FA 0023
        MVII    #$012A, R4                      ; 667B   02BC 012A

L_667D:
        JSR     R5,     L_60C2                  ; 667D   0004 0160 00C2

        MOVR    R2,     R1                      ; 6680   0091
        ADDI    #$0011, R1                      ; 6681   02F9 0011
        MVI@    R1,     R1                      ; 6683   0289
        TSTR    R1                              ; 6684   0089
        BNEQ    L_66F0                          ; 6685   020C 0069

        JSR     R5,     L_61DE                  ; 6687   0004 0160 01DE
        DECLE   $0245,  $01A9,  $0010,  $020B   ; 668A   0245 01A9 0010 020B
        DECLE   $0087,  $0378,  $0009,  $0204   ; 668E   0087 0378 0009 0204
        DECLE   $00BB,  $0378,  $000A,  $0204   ; 6692   00BB 0378 000A 0204
        DECLE   $00BB,  $0091,  $02F9,  $001E   ; 6696   00BB 0091 02F9 001E
        DECLE   $0348,  $020D,  $0053,  $00C4   ; 669A   0348 020D 0053 00C4
        DECLE   $02A0,  $0281,  $01A9,  $0379   ; 669E   02A0 0281 01A9 0379
        DECLE   $0002,  $0204,  $004B,  $0001   ; 66A2   0002 0204 004B 0001
L_66A6:
        ADDI    #$002E, R1                      ; 66A6   02F9 002E
        MOVR    R4,     R7                      ; 66A8   00A7

        MVI@    R1,     R1                      ; 66A9   0289
        TSTR    R1                              ; 66AA   0089
        BEQ     L_66F0                          ; 66AB   0204 0043

        SDBD                                    ; 66AD   0001
        MVII    #$A739, R4                      ; 66AE   02BC 0039 00A7
        SUBI    #$002D, R0                      ; 66B1   0338 002D
        ADDR    R0,     R4                      ; 66B3   00C4
        AND@    R4,     R1                      ; 66B4   03A1
        BEQ     L_66F0                          ; 66B5   0204 0039

        ADDI    #$002D, R0                      ; 66B7   02F8 002D
        MOVR    R2,     R1                      ; 66B9   0091
        ADDI    #$0016, R1                      ; 66BA   02F9 0016
        MVI@    R1,     R1                      ; 66BC   0289
        CMPI    #$003C, R0                      ; 66BD   0378 003C
        BEQ     L_66E8                          ; 66BF   0204 0027

        JSR     R5,     L_617A                  ; 66C1   0004 0160 017A
        BIDECLE $6745                           ; 66C4   0045 0067

        BEQ     L_66EC                          ; 66C6   0204 0024

        JSR     R5,     L_617A                  ; 66C8   0004 0160 017A
        BIDECLE $674A                           ; 66CB   004A 0067

        BEQ     L_66F1                          ; 66CD   0204 0022

L_66CF:
        PSHR    R3                              ; 66CF   0273

        JSR     R5,     L_585E                  ; 66D0   0004 0158 005E

        PULR    R3                              ; 66D3   02B3
        MVI     G_01A9, R5                      ; 66D4   0285 01A9
        CMPI    #$0009, R5                      ; 66D6   037D 0009
        BNEQ    L_66DD                          ; 66D8   020C 0003

        JSR     R5,     L_6211                  ; 66DA   0004 0160 0211
L_66DD:
        JSR     R5,     L_620F                  ; 66DD   0004 0160 020F
        JSR     R5,     L_60D4                  ; 66E0   0004 0160 00D4
        DECLE   $0004                           ; 66E3   0004

        ANDR    R4,     R0                      ; 66E4   01A0
        MOVR    R7,     R1                      ; 66E5   00B9
        COMR    R4                              ; 66E6   001C
        PULR    R7                              ; 66E7   02B7

L_66E8:
        CMPI    #$0007, R1                      ; 66E8   0379 0007
        BLE     L_66CF                          ; 66EA   0226 001C

L_66EC:
        CMPI    #$0003, R1                      ; 66EC   0379 0003
        BLE     L_66CF                          ; 66EE   0226 0020
L_66F0:
        PULR    R7                              ; 66F0   02B7

L_66F1:
        MVO     R0,     G_0104                  ; 66F1   0240 0104
        MVI     G_01A9, R5                      ; 66F3   0285 01A9
        SDBD                                    ; 66F5   0001
        ADDI    #$A72E, R5                      ; 66F6   02FD 002E 00A7
        MVI@    R5,     R5                      ; 66F9   02AD
        CMPI    #$0004, R5                      ; 66FA   037D 0004
        BNEQ    L_670A                          ; 66FC   020C 000C

        JSR     R5,     L_61C4                  ; 66FE   0004 0160 01C4

        CMPI    #$0001, R0                      ; 6701   0378 0001
        BGT     L_66F0                          ; 6703   022E 0014

        JSR     R5,     L_61E2                  ; 6705   0004 0160 01E2

        BNEQ    L_66F0                          ; 6708   022C 0019

L_670A:
        JSR     R5,     L_619B                  ; 670A   0004 0160 019B
        JSR     R5,     L_61F6                  ; 670D   0004 0160 01F6

        BNEQ    L_66F0                          ; 6710   022C 0021

        MVI     G_0104, R0                      ; 6712   0280 0104
        B       L_66CF                          ; 6714   0220 0046

        MVI     G_0137, R0                      ; 6716   0280 0137
        CMPI    #$0001, R0                      ; 6718   0378 0001
        BNEQ    L_66F0                          ; 671A   022C 002B

        MVI     G_01A9, R1                      ; 671C   0281 01A9
        CMPI    #$0009, R1                      ; 671E   0379 0009
        BEQ     L_66F0                          ; 6720   0224 0031

        SDBD                                    ; 6722   0001
        MVII    #$9EC7, R4                      ; 6723   02BC 00C7 009E
        CMPI    #$015D, R2                      ; 6726   037A 015D
        BEQ     L_672C                          ; 6728   0204 0002

        ADDI    #$0006, R4                      ; 672A   02FC 0006
L_672C:
        SDBD                                    ; 672C   0001
        MVII    #$53C9, R1                      ; 672D   02B9 00C9 0053
        MVII    #$0025, R0                      ; 6730   02B8 0025
L_6732:
        PSHR    R0                              ; 6732   0270

        JSR     R5,     L_614D                  ; 6733   0004 0160 014D

        PULR    R0                              ; 6736   02B0
        BNEQ    L_66F0                          ; 6737   022C 0048

        CMPI    #$0025, R0                      ; 6739   0378 0025
        BEQ     L_66DD                          ; 673B   0224 005F

        ADDI    #$0011, R3                      ; 673D   02FB 0011
        MVII    #$0002, R5                      ; 673F   02BD 0002
        ADD@    R3,     R5                      ; 6741   02DD
        MVO@    R5,     R3                      ; 6742   025D
        B       L_66DD                          ; 6743   0220 0067

        DECLE   $0004,  $003F                   ; 6745   0004 003F

        RSWD    R1                              ; 6747   0039
        SWAP    R2,     1                       ; 6748   0042
        ADCR    R5                              ; 6749   002D
        DIS                                     ; 674A   0003
        RSWD    R3                              ; 674B   003B
        RSWD    R0                              ; 674C   0038
        RSWD    R5                              ; 674D   003D
        MVII    #$002C, R0                      ; 674E   02B8 002C
        B       L_675D                          ; 6750   0200 000B

        MVII    #$0029, R0                      ; 6752   02B8 0029
        MVII    #$0002, R5                      ; 6754   02BD 0002
        MOVR    R2,     R1                      ; 6756   0091
        ADDI    #$0016, R1                      ; 6757   02F9 0016
        MVI@    R1,     R1                      ; 6759   0289
        CMPR    R5,     R1                      ; 675A   0169
        BGT     L_66F0                          ; 675B   022E 006C

L_675D:
        JSR     R5,     L_61E2                  ; 675D   0004 0160 01E2

        BNEQ    L_66F0                          ; 6760   022C 0071

L_6762:
        MOVR    R3,     R4                      ; 6762   009C
        ADDI    #$0002, R4                      ; 6763   02FC 0002
        SDBD                                    ; 6765   0001
        MVII    #$53C6, R1                      ; 6766   02B9 00C6 0053
        B       L_6732                          ; 6769   0220 0038

        JSR     R5,     L_67D0                  ; 676B   0004 0164 03D0

        DECR    R0                              ; 676E   0010
        BMI     L_6636                          ; 676F   022B 013A

        CMPI    #$0003, R0                      ; 6771   0378 0003
        BGE     L_6636                          ; 6773   022D 013E

        MVO     R0,     G_0136                  ; 6775   0240 0136
        MVII    #$0266, R1                      ; 6777   02B9 0266

        JSR     R5,     L_6113                  ; 6779   0004 0160 0113
        DECLE   $0004,  $01A0,  $00B9,  $0000   ; 677C   0004 01A0 00B9 0000

        JSR     R5,     L_5240                  ; 6780   0004 0150 0240
        DECLE   $0028                           ; 6783   0028

        MVII    #$015D, R0                      ; 6784   02B8 015D
        MVO     R0,     G_0339                  ; 6786   0240 0339
        MVI     G_0136, R1                      ; 6788   0281 0136
        DECR    R1                              ; 678A   0011
        BMI     L_654C                          ; 678B   022B 0240
        BNEQ    L_663A                          ; 678D   022C 0154

        JSR     R5,     L_6219                  ; 678F   0004 0160 0219

        B       L_65D0                          ; 6792   0220 01C3

        JSR     R5,     L_67E2                  ; 6794   0004 0164 03E2
        DECLE   $0378,  $000B,  $022C,  $0164   ; 6797   0378 000B 022C 0164
        DECLE   $02B8,  $0006,  $0089,  $0204   ; 679B   02B8 0006 0089 0204
        DECLE   $0001,  $0008,  $0004           ; 679F   0001 0008 0004

        ANDR    R4,     R0                      ; 67A2   01A0
        MOVR    R7,     R2                      ; 67A3   00BA
        MVI     G_0339, R1                      ; 67A4   0281 0339
        ADDI    #$0023, R1                      ; 67A6   02F9 0023
        CMPI    #$0180, R1                      ; 67A8   0379 0180
        BGT     L_67B0                          ; 67AA   020E 0004

        MVO     R1,     G_0339                  ; 67AC   0241 0339
        B       L_6669                          ; 67AE   0220 0146
L_67B0:
        J       L_6A71                          ; 67B0   0004 0368 0271

        DECLE   $0379,  $03CD,  $00B7           ; 67B3   0379 03CD 00B7

        INCR    R4                              ; 67B6   000C
        ANDR    R2,     R0                      ; 67B7   0190
        INCR    R3                              ; 67B8   000B
        SUBR    R5,     R3                      ; 67B9   012B
        ADD@    R1,     R7                      ; 67BA   02CF

        ADCR    R5                              ; 67BB   002D
        INCR    R7                              ; 67BC   000F

        INCR    R0                              ; 67BD   0008
L_67BE:
        DIS                                     ; 67BE   0003
        NEGR    R1                              ; 67BF   0021
        MVI@    R1,     R5                      ; 67C0   028D
        INCR    R7                              ; 67C1   000F

        DECLE   $0004                           ; 67C2   0004
L_67C3:
        DIS                                     ; 67C3   0003
        DECLE   $000D,  $03CD,  $000F,  $03F8   ; 67C4   000D 03CD 000F 03F8
        DECLE   $0279,  $002C,  $00CA,  $01B7   ; 67C8   0279 002C 00CA 01B7

        INCR    R3                              ; 67CC   000B
        MOVR    R1,     R7                      ; 67CD   008F

        DECR    R3                              ; 67CE   0013
        ADD@    R1,     R7                      ; 67CF   02CF

L_67D0:
        CMP@    R3,     R0                      ; 67D0   0358
        BEQ     L_67E1                          ; 67D1   0204 000E

        CMPI    #$00FF, R0                      ; 67D3   0378 00FF
        BEQ     L_67E1                          ; 67D5   0204 000A

        MVI     G_013A, R2                      ; 67D7   0282 013A
        CMPI    #$00FF, R2                      ; 67D9   037A 00FF
        BEQ     L_67E1                          ; 67DB   0204 0004

        CLRR    R2                              ; 67DD   01D2
        MVO     R2,     G_0139                  ; 67DE   0242 0139
        PSHR    R5                              ; 67E0   0275
L_67E1:
        PULR    R7                              ; 67E1   02B7

L_67E2:
        PSHR    R5                              ; 67E2   0275
        CLRR    R5                              ; 67E3   01ED
        MVI     G_0339, R4                      ; 67E4   0284 0339
        CMPI    #$015D, R4                      ; 67E6   037C 015D
        BEQ     L_67EB                          ; 67E8   0204 0001

        INCR    R5                              ; 67EA   000D
L_67EB:
        CMPR    R1,     R5                      ; 67EB   014D
        BEQ     L_67EF                          ; 67EC   0204 0001

        PULR    R5                              ; 67EE   02B5
L_67EF:
        PULR    R7                              ; 67EF   02B7

        ADDR    R6,     R6                      ; 67F0   00F6
        SLR     R3,     2                       ; 67F1   0067
        SETC                                    ; 67F2   0007
        SAR     R0,     1                       ; 67F3   0068
        INCR    R4                              ; 67F4   000C
        SAR     R0,     1                       ; 67F5   0068
L_67F6:
        DECR    R7                              ; 67F6   0017

        DECLE   $0001                           ; 67F7   0001

        SUB     G_03DB, R0                      ; 67F8   0300 03DB
        SUB     .BTAB.5B,R7                     ; 67FA   0307 025B

        DECLE   $016A,  $0239,  $0215,  $0229   ; 67FC   016A 0239 0215 0229
        DECLE   $0305,  $0207,  $03C0           ; 6800   0305 0207 03C0

        MOVR    R3,     R1                      ; 6803   0099
        RRC     R0,     1                       ; 6804   0070
        INCR    R7                              ; 6805   000F

        SUBR    R0,     R0                      ; 6806   0100
L_6807:
        INCR    R3                              ; 6807   000B
        DECLE   $0015,  $0380,  $0025,  $0100   ; 6808   0015 0380 0025 0100
        DECLE   $0027                           ; 680C   0027

        ADCR    R3                              ; 680D   002B
        AND     G_003B, R0                      ; 680E   0380 003B
        B       L_6AC5                          ; 6810   0200 02B3

        ADD@    R1,     R2                      ; 6812   02CA
        RSWD    R5                              ; 6813   003D
        RLC     R0,     1                       ; 6814   0050
        SUBI    #$00B5, R7                      ; 6815   033F 00B5
        BGE     L_66A6                          ; 6817   022D 0172

        SUBR    R0,     R1                      ; 6819   0101
        XORR    R0,     R6                      ; 681A   01C6
        ADD@    R4,     R5                      ; 681B   02E5
        XORR    R4,     R2                      ; 681C   01E2
        PULR    R7                              ; 681D   02B7

        DECLE   $02FE,  $0295,  $0016,  $02B1   ; 681E   02FE 0295 0016 02B1
        DECLE   $0051,  $0281,  $026E,  $03B1   ; 6822   0051 0281 026E 03B1
        DECLE   $0209,  $02A1,  $030E,  $02E9   ; 6826   0209 02A1 030E 02E9
        DECLE   $0132,  $0209,  $008A,  $00DB   ; 682A   0132 0209 008A 00DB
        DECLE   $0146,  $022D,  $0346,  $03B1   ; 682E   0146 022D 0346 03B1
        DECLE   $0111,  $0289,  $0312,  $0269   ; 6832   0111 0289 0312 0269
        DECLE   $0006,  $021D,  $0392,  $00DB   ; 6836   0006 021D 0392 00DB
        DECLE   $016E,  $020D,  $03A9,  $0219   ; 683A   016E 020D 03A9 0219

        MVI@    R5,     R1                      ; 683E   02A9
        ADDR    R7,     R1                      ; 683F   00F9
        XOR     G_006F, R6                      ; 6840   03C6 006F
        GSWD    R0                              ; 6842   0030
L_6843:
        DECR    R7                              ; 6843   0017

        RRC     R0,     1                       ; 6844   0070
        GSWD    R0                              ; 6845   0030
        ADCR    R0                              ; 6846   0028
        COMR    R3                              ; 6847   001B
        DECR    R4                              ; 6848   0014
        DECR    R0                              ; 6849   0010
        DECR    R4                              ; 684A   0014
        COMR    R3                              ; 684B   001B
        ADCR    R0                              ; 684C   0028
        PSHR    R5                              ; 684D   0275
        MVI     G_0138, R2                      ; 684E   0282 0138
        INCR    R2                              ; 6850   000A
        ADDR    R7,     R2                      ; 6851   00FA
        ADD@    R2,     R7                      ; 6852   02D7

        INCR    R6                              ; 6853   000E
        SUBR    R2,     R1                      ; 6854   0111
        SUBR    R2,     R1                      ; 6855   0111
        DECR    R4                              ; 6856   0014
        RLC     R3,     2                       ; 6857   0057
        SUBR    R2,     R1                      ; 6858   0111
        SUBR    R2,     R1                      ; 6859   0111
        SUBR    R2,     R1                      ; 685A   0111
        MOVR    R1,     R5                      ; 685B   008D
        SUBR    R2,     R1                      ; 685C   0111
        SUBR    R2,     R1                      ; 685D   0111
        SUBR    R2,     R1                      ; 685E   0111
        INCR    R6                              ; 685F   000E
        SUBR    R2,     R1                      ; 6860   0111

        JSR     R5,     L_67D0                  ; 6861   0004 0164 03D0

        J       L_59CC                          ; 6864   0004 0358 01CC

        JSR     R5,     L_67D0                  ; 6867   0004 0164 03D0

        MVII    #$0001, R4                      ; 686A   02BC 0001
        CMPI    #$0008, R0                      ; 686C   0378 0008
        BGT     L_6871                          ; 686E   020E 0001

        NEGR    R4                              ; 6870   0024
L_6871:
        MVII    #$015E, R2                      ; 6871   02BA 015E
        MVII    #$0181, R5                      ; 6873   02BD 0181
        MVII    #$0004, R0                      ; 6875   02B8 0004
        TSTR    R1                              ; 6877   0089
        BEQ     L_687F                          ; 6878   0204 0005

        INCR    R0                              ; 687A   0008
        ADDI    #$0023, R2                      ; 687B   02FA 0023
        SUBI    #$0023, R5                      ; 687D   033D 0023
L_687F:
        PSHR    R2                              ; 687F   0272
        ADDI    #$0014, R2                      ; 6880   02FA 0014
        MVI@    R2,     R3                      ; 6882   0293
        PULR    R2                              ; 6883   02B2
        ANDI    #$0002, R3                      ; 6884   03BB 0002
        BNEQ    L_6964                          ; 6886   020C 00DC

        MVI@    R5,     R3                      ; 6888   02AB
        MVI@    R2,     R1                      ; 6889   0291
        ADDR    R4,     R1                      ; 688A   00E1
        BPL     L_6891                          ; 688B   0203 0004

        MVII    #$000B, R1                      ; 688D   02B9 000B
        B       L_6896                          ; 688F   0200 0005

L_6891:
        CMPI    #$000C, R1                      ; 6891   0379 000C
        BLT     L_6896                          ; 6893   0205 0001

        CLRR    R1                              ; 6895   01C9
L_6896:
        CMPR    R1,     R3                      ; 6896   014B
        DECLE   $0224,  $000E,  $0341,  $017C   ; 6897   0224 000E 0341 017C
        DECLE   $0224,  $0012,  $0341,  $019F   ; 689B   0224 0012 0341 019F
        DECLE   $0224,  $0016,  $0251,  $033A   ; 689F   0224 0016 0251 033A
        DECLE   $0001,  $0004                   ; 68A3   0001 0004

        ANDR    R4,     R0                      ; 68A5   01A0
        MOVR    R7,     R2                      ; 68A6   00BA
        J       L_5BFC                          ; 68A7   0004 0358 03FC

        JSR     R5,     L_67D0                  ; 68AA   0004 0164 03D0
        JSR     R5,     L_67E2                  ; 68AD   0004 0164 03E2

        MVII    #$002D, R2                      ; 68B0   02BA 002D
        MVII    #$0001, R4                      ; 68B2   02BC 0001
        CMPI    #$0008, R0                      ; 68B4   0378 0008
        BGT     L_68BB                          ; 68B6   020E 0003

        NEGR    R4                              ; 68B8   0024
        MVII    #$0046, R2                      ; 68B9   02BA 0046
L_68BB:
        MVI     G_01A9, R0                      ; 68BB   0280 01A9
        ADDR    R4,     R0                      ; 68BD   00E0
        CMPI    #$002D, R0                      ; 68BE   0378 002D
        BLT     L_68C6                          ; 68C0   0205 0004

        CMPI    #$0046, R0                      ; 68C2   0378 0046
        BLE     L_68C7                          ; 68C4   0206 0001

L_68C6:
        MOVR    R2,     R0                      ; 68C6   0090
L_68C7:
        MVO     R0,     G_01A9                  ; 68C7   0240 01A9
        DECLE   $02B8,  $0004,  $0089,  $0204   ; 68C9   02B8 0004 0089 0204
        DECLE   $0003,  $0008,  $02B8,  $0005   ; 68CD   0003 0008 02B8 0005
        DECLE   $0004                           ; 68D1   0004

        ANDR    R4,     R0                      ; 68D2   01A0
        MOVR    R7,     R2                      ; 68D3   00BA
        J       L_5C94                          ; 68D4   0004 035C 0094

L_68D7:
        PSHR    R5                              ; 68D7   0275
        B       L_6921                          ; 68D8   0200 0047

L_68DA:
        PSHR    R5                              ; 68DA   0275
L_68DB:
        MVI     G_01B3, R1                      ; 68DB   0281 01B3
        MVII    #$00FF, R4                      ; 68DD   02BC 00FF
        INCR    R7                              ; 68DF   000F

        MVI@    R3,     R4                      ; 68E0   029C
L_68E1:
        MVII    #$015D, R2                      ; 68E1   02BA 015D
        TSTR    R1                              ; 68E3   0089
        BEQ     L_68E8                          ; 68E4   0204 0002

        ADDI    #$0023, R2                      ; 68E6   02FA 0023
L_68E8:
        MOVR    R2,     R1                      ; 68E8   0091
        ADDI    #$0011, R1                      ; 68E9   02F9 0011
        MVI@    R1,     R1                      ; 68EB   0289
        TSTR    R1                              ; 68EC   0089
        BNEQ    L_6964                          ; 68ED   020C 0075

        JSR     R5,     L_61DE                  ; 68EF   0004 0160 01DE

        BEQ     L_6975                          ; 68F2   0204 0081

        CMPI    #$0007, R5                      ; 68F4   037D 0007
        BNEQ    L_68FC                          ; 68F6   020C 0004

        CMPI    #$00FF, R4                      ; 68F8   037C 00FF
        BNEQ    L_6964                          ; 68FA   020C 0068

L_68FC:
        CMPI    #$0002, R5                      ; 68FC   037D 0002
        DECLE   $0204,  $0064,  $037D,  $0008   ; 68FE   0204 0064 037D 0008
        DECLE   $0204,  $0065,  $037D,  $0009   ; 6902   0204 0065 037D 0009
        DECLE   $0204,  $0075,  $037D,  $000A   ; 6906   0204 0075 037D 000A
        DECLE   $020C,  $0006,  $0270,  $0004   ; 690A   020C 0006 0270 0004

        ANDR    R4,     R0                      ; 690E   01A0
        MOVR    R7,     R1                      ; 690F   00B9
        COMR    R4                              ; 6910   001C
        PULR    R0                              ; 6911   02B0
L_6912:
        CMPI    #$00FF, R0                      ; 6912   0378 00FF
        BEQ     L_6965                          ; 6914   0204 004F

        CMPI    #$001C, R5                      ; 6916   037D 001C
        BEQ     L_6921                          ; 6918   0204 0007

        PSHR    R0                              ; 691A   0270
        MVII    #$001C, R0                      ; 691B   02B8 001C

        JSR     R5,     L_60D4                  ; 691D   0004 0160 00D4

        PULR    R0                              ; 6920   02B0
L_6921:
        MOVR    R0,     R1                      ; 6921   0081
        CLRR    R5                              ; 6922   01ED
        ADDI    #$0004, R0                      ; 6923   02F8 0004
        ANDI    #$000F, R0                      ; 6925   03B8 000F
        CMPI    #$0008, R0                      ; 6927   0378 0008
        BLT     L_692C                          ; 6929   0205 0001

        INCR    R5                              ; 692B   000D
L_692C:
        MVI@    R2,     R0                      ; 692C   0290
        ANDI    #$00FE, R0                      ; 692D   03B8 00FE
        XORR    R5,     R0                      ; 692F   01E8
        MVO@    R0,     R2                      ; 6930   0250
        MOVR    R1,     R5                      ; 6931   008D
        ANDI    #$0007, R5                      ; 6932   03BD 0007
        ADDR    R7,     R5                      ; 6934   00FD
        SUBI    #$00F0, R5                      ; 6935   033D 00F0
        MVI@    R5,     R4                      ; 6937   02AC
        PSHR    R1                              ; 6938   0271
        MVI     G_0138, R5                      ; 6939   0285 0138
        CMPI    #$0006, R5                      ; 693B   037D 0006
        BEQ     L_6956                          ; 693D   0204 0017

        MOVR    R4,     R1                      ; 693F   00A1
        SLR     R1,     2                       ; 6940   0065
        SUBR    R1,     R4                      ; 6941   010C
        SLR     R1,     2                       ; 6942   0065
        PSHR    R1                              ; 6943   0271
        ADDR    R1,     R4                      ; 6944   00CC
        ADDR    R1,     R4                      ; 6945   00CC

        JSR     R5,     L_6990                  ; 6946   0004 0168 0190
        DECLE   $0003                           ; 6949   0003

        SUBI    #$00C8, R0                      ; 694A   0338 00C8
        SLR     R0,     2                       ; 694C   0064
        SLR     R0,     2                       ; 694D   0064
        PULR    R1                              ; 694E   02B1
        PSHR    R2                              ; 694F   0272

        JSR     R5,     X_MPY                   ; 6950   0004 011C 01DC

        NEGR    R2                              ; 6953   0022
        ADDR    R2,     R4                      ; 6954   00D4
        PULR    R2                              ; 6955   02B2
L_6956:
        MOVR    R4,     R0                      ; 6956   00A0
        PULR    R1                              ; 6957   02B1

        JSR     R5,     .EXEC.629               ; 6958   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 695B   0004 0114 0357

        MOVR    R2,     R4                      ; 695E   0094
        ADDI    #$0008, R4                      ; 695F   02FC 0008

        JSR     R5,     L_61EE                  ; 6961   0004 0160 01EE

L_6964:
        PULR    R7                              ; 6964   02B7

L_6965:
        MVII    #$0001, R0                      ; 6965   02B8 0001
        B       L_697A                          ; 6967   0200 0011

        CMPI    #$000B, R0                      ; 6969   0378 000B
        BLT     L_6964                          ; 696B   0225 0008

        CMPI    #$000D, R0                      ; 696D   0378 000D
        BGT     L_6964                          ; 696F   022E 000C

        MVII    #$0020, R0                      ; 6971   02B8 0020
        B       L_697A                          ; 6973   0200 0005

L_6975:
        MOVR    R5,     R0                      ; 6975   00A8
        INCR    R0                              ; 6976   0008

        JSR     R5,     L_620F                  ; 6977   0004 0160 020F

L_697A:
        J       L_60D5                          ; 697A   0004 0360 00D5

        JSR     R5,     L_60C2                  ; 697D   0004 0160 00C2

        PSHR    R0                              ; 6980   0270
        PSHR    R2                              ; 6981   0272
        MOVR    R3,     R2                      ; 6982   009A
        MVII    #$0001, R0                      ; 6983   02B8 0001

        JSR     R5,     L_60D4                  ; 6985   0004 0160 00D4
        DECLE   $0004                           ; 6988   0004

        ANDR    R4,     R0                      ; 6989   01A0
        MOVR    R7,     R1                      ; 698A   00B9
        COMR    R4                              ; 698B   001C
        PULR    R2                              ; 698C   02B2
        PULR    R0                              ; 698D   02B0
        B       L_6912                          ; 698E   0220 007D

L_6990:
        MOVR    R2,     R1                      ; 6990   0091
L_6991:
        ADDI    #$0001, R1                      ; 6991   02F9 0001
        MVI@    R1,     R1                      ; 6993   0289
L_6994:
        PSHR    R1                              ; 6994   0271
        SLL     R1,     1                       ; 6995   0049
        PSHR    R1                              ; 6996   0271
        SLL     R1,     2                       ; 6997   004D
        ADD@    R6,     R1                      ; 6998   02F1
        ADD@    R6,     R1                      ; 6999   02F1
        SDBD                                    ; 699A   0001
        ADDI    #$6242, R1                      ; 699B   02F9 0042 0062
        ADD@    R5,     R1                      ; 699E   02E9
        MVI@    R1,     R0                      ; 699F   0288
        MOVR    R5,     R7                      ; 69A0   00AF

L_69A1:
        ADDI    #$001C, R1                      ; 69A1   02F9 001C
L_69A3:
        PSHR    R5                              ; 69A3   0275
        PSHR    R0                              ; 69A4   0270
        NEGR    R0                              ; 69A5   0020
        ADD@    R1,     R0                      ; 69A6   02C8
        BPL     L_69AA                          ; 69A7   0203 0001

        CLRR    R0                              ; 69A9   01C0
L_69AA:
        CMPI    #$00C6, R0                      ; 69AA   0378 00C6
        BLE     L_69B0                          ; 69AC   0206 0002

        MVII    #$00C6, R0                      ; 69AE   02B8 00C6
L_69B0:
        MVO@    R0,     R1                      ; 69B0   0248
        MVII    #$0004, R0                      ; 69B1   02B8 0004
        CMPI    #$0180, R1                      ; 69B3   0379 0180
        BLT     L_69B8                          ; 69B5   0205 0001

        SLL     R0,     1                       ; 69B7   0048

L_69B8:
        JSR     R5,     L_5601                  ; 69B8   0004 0154 0201

        PULR    R0                              ; 69BB   02B0
        PULR    R7                              ; 69BC   02B7

L_69BD:
        MVII    #$0007, R0                      ; 69BD   02B8 0007
        MVO     R0,     G_0345                  ; 69BF   0240 0345
        MVO     R0,     G_0346                  ; 69C1   0240 0346

        JSR     R5,     L_5823                  ; 69C3   0004 0158 0023
        JSR     R5,     L_606E                  ; 69C6   0004 0160 006E

        CLRR    R0                              ; 69C9   01C0
        MVO     R0,     G_016E                  ; 69CA   0240 016E
        MVO     R0,     G_0191                  ; 69CC   0240 0191
        MVO     R0,     G_01CC                  ; 69CE   0240 01CC
        MVO     R0,     G_01CD                  ; 69D0   0240 01CD
        MVII    #$0001, R0                      ; 69D2   02B8 0001

        JSR     R5,     L_60CB                  ; 69D4   0004 0160 00CB

        MVII    #$0006, R0                      ; 69D7   02B8 0006
        MVO     R0,     G_0138                  ; 69D9   0240 0138
        MVII    #$00C6, R0                      ; 69DB   02B8 00C6
        MVO     R0,     G_0179                  ; 69DD   0240 0179
        MVO     R0,     G_017A                  ; 69DF   0240 017A
        MVO     R0,     G_019C                  ; 69E1   0240 019C
        MVO     R0,     G_019D                  ; 69E3   0240 019D

        JSR     R5,     L_60A0                  ; 69E5   0004 0160 00A0

        MVI     G_015E, R0                      ; 69E8   0280 015E
        MVO     R0,     G_01CE                  ; 69EA   0240 01CE
        MVI     G_0181, R0                      ; 69EC   0280 0181
        MVO     R0,     G_01CF                  ; 69EE   0240 01CF
        MVII    #$0002, R0                      ; 69F0   02B8 0002
        MVO     R0,     G_0348                  ; 69F2   0240 0348

L_69F4:
        JSR     R5,     L_6AF0                  ; 69F4   0004 0168 02F0
        DECLE   $0004                           ; 69F7   0004

        ANDR    R4,     R0                      ; 69F8   01A0
        MOVR    R7,     R1                      ; 69F9   00B9
        EIS                                     ; 69FA   0002

        JSR     R5,     L_6ACB                  ; 69FB   0004 0168 02CB
        JSR     R5,     L_5243                  ; 69FE   0004 0150 0243
        DECLE   $0019                           ; 6A01   0019

        JSR     R5,     L_6ACB                  ; 6A02   0004 0168 02CB
        JSR     R5,     L_5243                  ; 6A05   0004 0150 0243
        DECLE   $002A                           ; 6A08   002A

        JSR     R5,     L_6ACB                  ; 6A09   0004 0168 02CB
        JSR     R5,     L_5243                  ; 6A0C   0004 0150 0243
        DECLE   $0023                           ; 6A0F   0023

        JSR     R5,     L_6ACB                  ; 6A10   0004 0168 02CB
        JSR     R5,     L_5243                  ; 6A13   0004 0150 0243
        DECLE   $003E                           ; 6A16   003E

        JSR     R5,     L_6ACB                  ; 6A17   0004 0168 02CB
        JSR     R5,     L_5243                  ; 6A1A   0004 0150 0243
        DECLE   $0018                           ; 6A1D   0018

        JSR     R5,     L_6ACB                  ; 6A1E   0004 0168 02CB

        MVII    #$001F, R0                      ; 6A21   02B8 001F

        JSR     R5,     L_60CB                  ; 6A23   0004 0160 00CB
        DECLE   $0004                           ; 6A26   0004

        ANDR    R4,     R0                      ; 6A27   01A0
        MOVR    R7,     R1                      ; 6A28   00B9
        EIS                                     ; 6A29   0002

        JSR     R5,     L_5243                  ; 6A2A   0004 0150 0243
        DECLE   $0012                           ; 6A2D   0012

        MVI     G_0348, R0                      ; 6A2E   0280 0348
        DECR    R0                              ; 6A30   0010
        BEQ     L_6A62                          ; 6A31   0204 002F

        MVO     R0,     G_0348                  ; 6A33   0240 0348
        MVI     G_0103, R5                      ; 6A35   0285 0103
        ANDI    #$00FE, R5                      ; 6A37   03BD 00FE
        XORI    #$0001, R5                      ; 6A39   03FD 0001
        MVO     R5,     G_0103                  ; 6A3B   0245 0103
        MVI     G_0345, R0                      ; 6A3D   0280 0345
        ADDI    #$0002, R0                      ; 6A3F   02F8 0002
        MVO     R0,     G_0345                  ; 6A41   0240 0345

        JSR     R5,     L_5243                  ; 6A43   0004 0150 0243
        DECLE   $0001,  $0280,  $0345,  $0378   ; 6A46   0001 0280 0345 0378
        DECLE   $00A7,  $0225,  $0017,  $0285   ; 6A4A   00A7 0225 0017 0285
        DECLE   $0103,  $03BD,  $00FE,  $0245   ; 6A4E   0103 03BD 00FE 0245
        DECLE   $0103,  $02B8,  $0001,  $0240   ; 6A52   0103 02B8 0001 0240
        DECLE   $01CC,  $0280,  $01CF,  $0240   ; 6A56   01CC 0280 01CF 0240
        DECLE   $0181,  $0281,  $0137,  $0089   ; 6A5A   0181 0281 0137 0089
        DECLE   $0224,  $0068                   ; 6A5E   0224 0068

        B       L_69F4                          ; 6A60   0220 006D

L_6A62:
        JSR     R5,     L_5243                  ; 6A62   0004 0150 0243
        DECLE   $0026                           ; 6A65   0026
L_6A66:
        CLRR    R0                              ; 6A66   01C0
        MVO     R0,     G_0343                  ; 6A67   0240 0343
        MVI     G_01CE, R0                      ; 6A69   0280 01CE
        MVO     R0,     G_015E                  ; 6A6B   0240 015E
        MVI     G_01CF, R0                      ; 6A6D   0280 01CF
        MVO     R0,     G_0181                  ; 6A6F   0240 0181

L_6A71:
        JSR     R5,     L_606E                  ; 6A71   0004 0160 006E
        JSR     R5,     L_6054                  ; 6A74   0004 0160 0054
        JSR     R5,     L_6067                  ; 6A77   0004 0160 0067
        JSR     R5,     L_58AF                  ; 6A7A   0004 0158 00AF
        DECLE   $0004                           ; 6A7D   0004

        ANDR    R4,     R0                      ; 6A7E   01A0
        MOVR    R7,     R1                      ; 6A7F   00B9
        COMR    R3                              ; 6A80   001B

        JSR     R5,     L_5243                  ; 6A81   0004 0150 0243
        DECLE   $00B4                           ; 6A84   00B4
L_6A85:
        JSR     R5,     L_60A0                  ; 6A85   0004 0160 00A0

        MOVR    R7,     R2                      ; 6A88   00BA
        ADDI    #$0032, R2                      ; 6A89   02FA 0032

        JSR     R5,     L_6139                  ; 6A8B   0004 0160 0139

        MVII    #$0001, R0                      ; 6A8E   02B8 0001

        JSR     R5,     L_60CB                  ; 6A90   0004 0160 00CB

        CLRR    R0                              ; 6A93   01C0
        MVO     R0,     G_0140                  ; 6A94   0240 0140
        MVO     R0,     G_0141                  ; 6A96   0240 0141
        INCR    R0                              ; 6A98   0008
        MVO     R0,     G_01B4                  ; 6A99   0240 01B4
        MVO     R0,     G_01B5                  ; 6A9B   0240 01B5
        MVII    #$001E, R0                      ; 6A9D   02B8 001E
        NEGR    R0                              ; 6A9F   0020
        MVII    #$0179, R1                      ; 6AA0   02B9 0179

L_6AA2:
        JSR     R5,     L_69A3                  ; 6AA2   0004 0168 01A3

        INCR    R1                              ; 6AA5   0009

        JSR     R5,     L_69A3                  ; 6AA6   0004 0168 01A3

        ADDI    #$0022, R1                      ; 6AA9   02F9 0022
        CMPI    #$019D, R1                      ; 6AAB   0379 019D
        BLE     L_6AA2                          ; 6AAD   0226 000C

        MVII    #$0008, R0                      ; 6AAF   02B8 0008
        MVO     R0,     G_0138                  ; 6AB1   0240 0138

        JSR     R5,     L_5823                  ; 6AB3   0004 0158 0023
        DECLE   $0004                           ; 6AB6   0004

        ANDR    R4,     R0                      ; 6AB7   01A0
        MOVR    R7,     R1                      ; 6AB8   00B9
        COMR    R0                              ; 6AB9   0018
        PULR    R7                              ; 6ABA   02B7

        DECLE   $0062,  $004E,  $00D2,  $0032   ; 6ABB   0062 004E 00D2 0032
        DECLE   $0000,  $000E,  $0000,  $0003   ; 6ABF   0000 000E 0000 0003
        DECLE   $0003,  $00FF                   ; 6AC3   0003 00FF
L_6AC5:
        INCR    R0                              ; 6AC5   0008
        DECLE   $000A,  $0008,  $0005,  $0005   ; 6AC6   000A 0008 0005 0005
        DECLE   $00FF                           ; 6ACA   00FF
L_6ACB:
        PSHR    R5                              ; 6ACB   0275
        MVI     G_01CD, R4                      ; 6ACC   0284 01CD
        SDBD                                    ; 6ACE   0001
        ADDI    #$6ABF, R4                      ; 6ACF   02FC 00BF 006A
        MVI@    R4,     R0                      ; 6AD2   02A0
        SDBD                                    ; 6AD3   0001
        SUBI    #$6ABF, R4                      ; 6AD4   033C 00BF 006A
        MVO     R4,     G_01CD                  ; 6AD7   0244 01CD
        MVI     G_01CC, R1                      ; 6AD9   0281 01CC
        MVO     R1,     G_01B3                  ; 6ADB   0241 01B3
        MVI     G_0137, R4                      ; 6ADD   0284 0137
        TSTR    R4                              ; 6ADF   00A4
        BEQ     L_6AED                          ; 6AE0   0204 000B

        PSHR    R0                              ; 6AE2   0270

        JSR     R5,     L_68DA                  ; 6AE3   0004 0168 00DA

        PULR    R0                              ; 6AE6   02B0
        MVI     G_01B3, R1                      ; 6AE7   0281 01B3
        XORI    #$0001, R1                      ; 6AE9   03F9 0001
        MVO     R1,     G_01B3                  ; 6AEB   0241 01B3
L_6AED:
        J       L_68DB                          ; 6AED   0004 0368 00DB

L_6AF0:
        MOVR    R7,     R2                      ; 6AF0   00BA
        ADDI    #$0023, R2                      ; 6AF1   02FA 0023
        MVI     G_01CC, R0                      ; 6AF3   0280 01CC
        MVII    #$015D, R4                      ; 6AF5   02BC 015D
        MVII    #$0180, R3                      ; 6AF7   02BB 0180
        TSTR    R0                              ; 6AF9   0080
        BEQ     L_6B02                          ; 6AFA   0204 0006

        ADDI    #$0004, R2                      ; 6AFC   02FA 0004
        MVII    #$0180, R4                      ; 6AFE   02BC 0180
        MVII    #$015D, R3                      ; 6B00   02BB 015D
L_6B02:
        MVI     G_0137, R1                      ; 6B02   0281 0137
        TSTR    R1                              ; 6B04   0089
        BEQ     L_6B0F                          ; 6B05   0204 0008

        SUBI    #$0002, R2                      ; 6B07   033A 0002
        ADDI    #$001F, R4                      ; 6B09   02FC 001F
        MVI@    R4,     R0                      ; 6B0B   02A0
        ADDI    #$0001, R3                      ; 6B0C   02FB 0001
        MVO@    R0,     R3                      ; 6B0E   0258
L_6B0F:
        J       L_6139                          ; 6B0F   0004 0360 0139

        DECR    R0                              ; 6B12   0010
        SWAP    R0,     2                       ; 6B13   0044
        EIS                                     ; 6B14   0002
        SLL     R0,     1                       ; 6B15   0048
        SUBR    R7,     R6                      ; 6B16   013E
        SLL     R0,     1                       ; 6B17   0048
        SUBR    R6,     R0                      ; 6B18   0130
        SWAP    R0,     2                       ; 6B19   0044
L_6B1A:
        PSHR    R5                              ; 6B1A   0275

        JSR     R5,     L_6127                  ; 6B1B   0004 0160 0127

        MVII    #$015D, R2                      ; 6B1E   02BA 015D
L_6B20:
        MOVR    R2,     R1                      ; 6B20   0091
        DECLE   $02F9,  $000E,  $0288,  $0010   ; 6B21   02F9 000E 0288 0010
        DECLE   $020B,  $003A,  $0248,  $020C   ; 6B25   020B 003A 0248 020C
        DECLE   $0037,  $0094,  $02FC,  $000F   ; 6B29   0037 0094 02FC 000F
        DECLE   $0001                           ; 6B2D   0001

        MVI@    R4,     R0                      ; 6B2E   02A0
        MOVR    R0,     R4                      ; 6B2F   0084

L_6B30:
        JSR     R5,     L_60C2                  ; 6B30   0004 0160 00C2

        MOVR    R2,     R5                      ; 6B33   0095
        ADDI    #$0002, R5                      ; 6B34   02FD 0002
        SDBD                                    ; 6B36   0001
        MVI@    R5,     R0                      ; 6B37   02A8
        MVO     R0,     G_033A                  ; 6B38   0240 033A
        SDBD                                    ; 6B3A   0001
        MVI@    R5,     R0                      ; 6B3B   02A8
        MVO     R0,     G_033B                  ; 6B3C   0240 033B
        MOVR    R3,     R5                      ; 6B3E   009D
        ADDI    #$0002, R5                      ; 6B3F   02FD 0002
        SDBD                                    ; 6B41   0001
        MVI@    R5,     R0                      ; 6B42   02A8
        MVO     R0,     G_033D                  ; 6B43   0240 033D
        SDBD                                    ; 6B45   0001
        MVI@    R5,     R0                      ; 6B46   02A8
        MVO     R0,     G_033E                  ; 6B47   0240 033E
        MVI@    R4,     R1                      ; 6B49   02A1
        MOVR    R1,     R0                      ; 6B4A   0088
        SLR     R0,     2                       ; 6B4B   0064
        SLR     R0,     2                       ; 6B4C   0064
        ANDI    #$000F, R1                      ; 6B4D   03B9 000F
        INCR    R1                              ; 6B4F   0009
        ADDR    R7,     R1                      ; 6B50   00F9
        ADD@    R1,     R7                      ; 6B51   02CF

        SAR     R0,     1                       ; 6B52   0068
        DECR    R6                              ; 6B53   0016
        ADCR    R1                              ; 6B54   0029
        ADCR    R7                              ; 6B55   002F

        RSWD    R0                              ; 6B56   0038
L_6B57:
        CMPR    R1,     R5                      ; 6B57   014D
        SAR     R1,     2                       ; 6B58   006D
        SARC    R3,     1                       ; 6B59   007B
        TSTR    R1                              ; 6B5A   0089
        MOVR    R1,     R5                      ; 6B5B   008D
        MOVR    R2,     R1                      ; 6B5C   0091
        MOVR    R2,     R5                      ; 6B5D   0095
        MOVR    R3,     R1                      ; 6B5E   0099
        MOVR    R4,     R0                      ; 6B5F   00A0
        MOVR    R5,     R0                      ; 6B60   00A8
L_6B61:
        ADDI    #$0023, R2                      ; 6B61   02FA 0023
        CMPI    #$0180, R2                      ; 6B63   037A 0180
        BLE     L_6B20                          ; 6B65   0226 0046
        PULR    R7                              ; 6B67   02B7

L_6B68:
        MOVR    R2,     R1                      ; 6B68   0091
        ADDI    #$0012, R1                      ; 6B69   02F9 0012
        MVO@    R0,     R1                      ; 6B6B   0248
        ADDI    #$0001, R1                      ; 6B6C   02F9 0001
        MVI@    R1,     R0                      ; 6B6E   0288
        SUBI    #$0005, R1                      ; 6B6F   0339 0005
        MVO@    R0,     R1                      ; 6B71   0248
        ADDI    #$0001, R1                      ; 6B72   02F9 0001
        MOVR    R4,     R0                      ; 6B74   00A0
        MOVR    R1,     R4                      ; 6B75   008C
        MVO@    R0,     R4                      ; 6B76   0260
        SWAP    R0,     1                       ; 6B77   0040
        MVO@    R0,     R4                      ; 6B78   0260
        B       L_6B61                          ; 6B79   0220 0019

        MOVR    R2,     R1                      ; 6B7B   0091
        ADDI    #$0013, R1                      ; 6B7C   02F9 0013
        MVO@    R0,     R1                      ; 6B7E   0248
        B       L_6B30                          ; 6B7F   0220 0050

L_6B81:
        PSHR    R2                              ; 6B81   0272
        DECLE   $0274,  $0004                   ; 6B82   0274 0004

        ANDR    R4,     R0                      ; 6B84   01A0
        MOVR    R7,     R2                      ; 6B85   00BA
        PULR    R4                              ; 6B86   02B4
        PULR    R2                              ; 6B87   02B2
        B       L_6B30                          ; 6B88   0220 0059

        MOVR    R2,     R1                      ; 6B8A   0091
        ADDI    #$001C, R1                      ; 6B8B   02F9 001C
        MVI@    R1,     R3                      ; 6B8D   028B
        MOVR    R2,     R1                      ; 6B8E   0091
        ADDI    #$0011, R1                      ; 6B8F   02F9 0011
        TSTR    R0                              ; 6B91   0080
        BEQ     L_6BA4                          ; 6B92   0204 0010

        CMPI    #$003F, R0                      ; 6B94   0378 003F
        BEQ     L_6BA7                          ; 6B96   0204 000F

        CMPI    #$0001, R0                      ; 6B98   0378 0001
        BEQ     L_6BAB                          ; 6B9A   0204 000F

        CMPI    #$0003, R0                      ; 6B9C   0378 0003
        BEQ     L_6BB6                          ; 6B9E   0204 0016

        SLR     R3,     2                       ; 6BA0   0067
        SLR     R3,     1                       ; 6BA1   0063
        SUBR    R3,     R0                      ; 6BA2   0118
L_6BA3:
        ADD@    R1,     R0                      ; 6BA3   02C8
L_6BA4:
        MVO@    R0,     R1                      ; 6BA4   0248
        B       L_6B30                          ; 6BA5   0220 0076

L_6BA7:
        MVII    #$00FF, R0                      ; 6BA7   02B8 00FF
        B       L_6BA4                          ; 6BA9   0220 0006

L_6BAB:
        NEGR    R3                              ; 6BAB   0023
        ADDI    #$00BE, R3                      ; 6BAC   02FB 00BE
        BPL     L_6BB2                          ; 6BAE   0203 0002

        MVII    #$0002, R3                      ; 6BB0   02BB 0002
L_6BB2:
        SLR     R3,     2                       ; 6BB2   0067
        MOVR    R3,     R0                      ; 6BB3   0098
        B       L_6BA4                          ; 6BB4   0220 0011

L_6BB6:
        MVII    #$000A, R0                      ; 6BB6   02B8 000A
        B       L_6BA3                          ; 6BB8   0220 0016

L_6BBA:
        JSR     R5,     L_60D4                  ; 6BBA   0004 0160 00D4

        B       L_6B20                          ; 6BBD   0220 009E

        DECLE   $0378,  $003F,  $0204,  $0005   ; 6BBF   0378 003F 0204 0005
        DECLE   $0004                           ; 6BC3   0004

        ANDR    R4,     R4                      ; 6BC4   01A4
        XOR@    R1,     R6                      ; 6BC5   03CE
        B       L_6B30                          ; 6BC6   0220 0097

        DECLE   $0004                           ; 6BC8   0004

        ANDR    R4,     R4                      ; 6BC9   01A4
        XOR@    R2,     R1                      ; 6BCA   03D1
        B       L_6B30                          ; 6BCB   0220 009C

        MOVR    R2,     R1                      ; 6BCD   0091
        ADDI    #$001B, R1                      ; 6BCE   02F9 001B
        MVI@    R1,     R3                      ; 6BD0   028B
        DECR    R3                              ; 6BD1   0013
        BMI     L_6BD7                          ; 6BD2   020B 0003

        MVO@    R3,     R1                      ; 6BD4   024B
        BEQ     L_6B30                          ; 6BD5   0224 00A6

L_6BD7:
        INCR    R0                              ; 6BD7   0008
        SUBR    R0,     R4                      ; 6BD8   0104
        B       L_6B30                          ; 6BD9   0220 00AA

        MVII    #$0019, R3                      ; 6BDB   02BB 0019
        B       L_6BED                          ; 6BDD   0200 000E

        MVII    #$0018, R3                      ; 6BDF   02BB 0018
        B       L_6BED                          ; 6BE1   0200 000A

        MVII    #$001A, R3                      ; 6BE3   02BB 001A
        B       L_6BED                          ; 6BE5   0200 0006

        MVII    #$0017, R3                      ; 6BE7   02BB 0017
        B       L_6BED                          ; 6BE9   0200 0002

L_6BEB:
        MVII    #$001B, R3                      ; 6BEB   02BB 001B
L_6BED:
        MOVR    R2,     R1                      ; 6BED   0091
L_6BEE:
        ADDR    R3,     R1                      ; 6BEE   00D9
        MVO@    R0,     R1                      ; 6BEF   0248
        B       L_6B30                          ; 6BF0   0220 00C1

L_6BF2:
        PSHR    R2                              ; 6BF2   0272
        MOVR    R3,     R2                      ; 6BF3   009A

        JSR     R5,     L_60D4                  ; 6BF4   0004 0160 00D4

        PULR    R2                              ; 6BF7   02B2
        B       L_6B30                          ; 6BF8   0220 00C9

        PSHR    R2                              ; 6BFA   0272
        PSHR    R4                              ; 6BFB   0274
        MOVR    R0,     R1                      ; 6BFC   0081
        INCR    R1                              ; 6BFD   0009
        ADDR    R7,     R1                      ; 6BFE   00F9
        ADD@    R1,     R7                      ; 6BFF   02CF

        CLRC                                    ; 6C00   0006
        MOVR    R1,     R6                      ; 6C01   008E
        NEGR    R4                              ; 6C02   0024
        RSWD    R4                              ; 6C03   003C
        SWAP    R2,     2                       ; 6C04   0046
        SLL     R1,     2                       ; 6C05   004D
        MOVR    R7,     R5                      ; 6C06   00BD
        ADDI    #$004E, R5                      ; 6C07   02FD 004E
        MVII    #$0096, R0                      ; 6C09   02B8 0096
        MOVR    R2,     R1                      ; 6C0B   0091
        ADDI    #$0016, R1                      ; 6C0C   02F9 0016
        MVI@    R1,     R1                      ; 6C0E   0289
        ADDR    R1,     R5                      ; 6C0F   00CD
        SLL     R1,     1                       ; 6C10   0049
        ADDR    R1,     R5                      ; 6C11   00CD
L_6C12:
        MOVR    R3,     R4                      ; 6C12   009C
        DECLE   $02FB,  $0016,  $02A9,  $0259   ; 6C13   02FB 0016 02A9 0259
        DECLE   $0083,  $02A8,  $02A9,  $0004   ; 6C17   0083 02A8 02A9 0004

        ANDR    R5,     R0                      ; 6C1B   01A8
        RRC     R0,     1                       ; 6C1C   0070

L_6C1D:
        JSR     R5,     L_5963                  ; 6C1D   0004 0158 0163

        PULR    R4                              ; 6C20   02B4
        PULR    R2                              ; 6C21   02B2
        B       L_6B30                          ; 6C22   0220 00F3

        MVII    #$00C8, R0                      ; 6C24   02B8 00C8
        MOVR    R7,     R5                      ; 6C26   00BD
        ADDI    #$0037, R5                      ; 6C27   02FD 0037
L_6C29:
        MVI     G_033A, R1                      ; 6C29   0281 033A
        SDBD                                    ; 6C2B   0001
        CMPI    #$2800, R1                      ; 6C2C   0379 0000 0028
        BLT     L_6C33                          ; 6C2F   0205 0002

        ADDI    #$0006, R5                      ; 6C31   02FD 0006
L_6C33:
        MVI@    R2,     R1                      ; 6C33   0291
        ANDI    #$0001, R1                      ; 6C34   03B9 0001
        BEQ     L_6C12                          ; 6C36   0224 0025

        ADDI    #$0003, R5                      ; 6C38   02FD 0003
        B       L_6C12                          ; 6C3A   0220 0029

        MOVR    R3,     R0                      ; 6C3C   0098
        MOVR    R2,     R3                      ; 6C3D   0093
        MOVR    R0,     R2                      ; 6C3E   0082
        MVII    #$00A0, R0                      ; 6C3F   02B8 00A0
        MOVR    R7,     R5                      ; 6C41   00BD
        ADDI    #$0028, R5                      ; 6C42   02FD 0028
        B       L_6C29                          ; 6C44   0220 001C

        MOVR    R7,     R5                      ; 6C46   00BD
        ADDI    #$002F, R5                      ; 6C47   02FD 002F
        MVII    #$008C, R0                      ; 6C49   02B8 008C
        B       L_6C29                          ; 6C4B   0220 0023

        MOVR    R7,     R5                      ; 6C4D   00BD
        ADDI    #$0034, R5                      ; 6C4E   02FD 0034
        MVII    #$00DC, R0                      ; 6C50   02B8 00DC
        MOVR    R2,     R3                      ; 6C52   0093
        B       L_6C29                          ; 6C53   0220 002B

        DECLE   $0000,  $00A0,  $0040,  $0008   ; 6C55   0000 00A0 0040 0008
        DECLE   $0040,  $0050,  $0009,  $0100   ; 6C59   0040 0050 0009 0100
        DECLE   $0050,  $000D,  $00E0,  $0060   ; 6C5D   0050 000D 00E0 0060
        DECLE   $000A,  $0028,  $0044,  $000B   ; 6C61   000A 0028 0044 000B
        DECLE   $0118,  $0044,  $000C,  $0060   ; 6C65   0118 0044 000C 0060
        DECLE   $0060,  $0007,  $00C0,  $0060   ; 6C69   0060 0007 00C0 0060
        DECLE   $000A,  $001E,  $0044,  $000B   ; 6C6D   000A 001E 0044 000B
        DECLE   $0120,  $0044,  $0007,  $0080   ; 6C71   0120 0044 0007 0080
        DECLE   $0060,  $0007,  $00D0,  $0060   ; 6C75   0060 0007 00D0 0060
        DECLE   $0008,  $0034,  $005C,  $0009   ; 6C79   0008 0034 005C 0009
        DECLE   $010C,  $005C,  $0007,  $0070   ; 6C7D   010C 005C 0007 0070
        DECLE   $0060,  $0000,  $00CC,  $0048   ; 6C81   0060 0000 00CC 0048
        DECLE   $0000,  $00CC,  $0038,  $0000   ; 6C85   0000 00CC 0038 0000
        DECLE   $0074,  $0048,  $0000           ; 6C89   0074 0048 0000

        RRC     R0,     2                       ; 6C8C   0074
        RSWD    R0                              ; 6C8D   0038
        MOVR    R3,     R1                      ; 6C8E   0099
        ADDI    #$0016, R1                      ; 6C8F   02F9 0016
        MVI@    R1,     R0                      ; 6C91   0288
        MOVR    R2,     R1                      ; 6C92   0091
        ADDI    #$0016, R1                      ; 6C93   02F9 0016
        MVO@    R0,     R1                      ; 6C95   0248
        MVI     G_033D, R0                      ; 6C96   0280 033D
        MVI     G_033E, R1                      ; 6C98   0281 033E
        MOVR    R2,     R4                      ; 6C9A   0094
        MVII    #$00A0, R3                      ; 6C9B   02BB 00A0
        B       L_6C1D                          ; 6C9D   0220 0081

        MOVR    R0,     R1                      ; 6C9F   0081
        INCR    R1                              ; 6CA0   0009
        ADDR    R7,     R1                      ; 6CA1   00F9
        ADD@    R1,     R7                      ; 6CA2   02CF

        DECLE   $0039,  $0040,  $0046,  $0050   ; 6CA3   0039 0040 0046 0050
        DECLE   $0054,  $0059,  $005D,  $0067   ; 6CA7   0054 0059 005D 0067
        DECLE   $006E,  $0073,  $0079,  $00A9   ; 6CAB   006E 0073 0079 00A9
        DECLE   $00B5,  $00C9,  $00D0,  $00D3   ; 6CAF   00B5 00C9 00D0 00D3
        DECLE   $00DC,  $00F5,  $00F9,  $00FD   ; 6CB3   00DC 00F5 00F9 00FD
        DECLE   $0110,  $0125,  $012C,  $0143   ; 6CB7   0110 0125 012C 0143
        DECLE   $0156,  $0159,  $016E,  $0176   ; 6CBB   0156 0159 016E 0176
        DECLE   $0183,  $018E,  $01A5,  $01AB   ; 6CBF   0183 018E 01A5 01AB
        DECLE   $01CE,  $01E7,  $0205,  $020E   ; 6CC3   01CE 01E7 0205 020E
        DECLE   $0213,  $0227,  $023B,  $0248   ; 6CC7   0213 0227 023B 0248
        DECLE   $0258,  $0264,  $026B,  $0271   ; 6CCB   0258 0264 026B 0271
        DECLE   $027E                           ; 6CCF   027E

        MVI@    R3,     R2                      ; 6CD0   029A
        MVI@    R4,     R3                      ; 6CD1   02A3
        PULR    R2                              ; 6CD2   02B2
        PULR    R5                              ; 6CD3   02B5
        ADD     G_0311, R3                      ; 6CD4   02C3 0311
        SUB@    R2,     R5                      ; 6CD6   0315
        SUB@    R3,     R7                      ; 6CD7   031F

        SUB@    R5,     R0                      ; 6CD8   0328
        SUB@    R6,     R4                      ; 6CD9   0334
        SUBI    #$034C, R0                      ; 6CDA   0338 034C
        MOVR    R3,     R1                      ; 6CDC   0099
        ADDI    #$0011, R1                      ; 6CDD   02F9 0011
        MVII    #$0019, R0                      ; 6CDF   02B8 0019
        B       L_6BA3                          ; 6CE1   0220 013F

        MOVR    R3,     R1                      ; 6CE3   0099
        MVII    #$0017, R3                      ; 6CE4   02BB 0017
        CLRR    R0                              ; 6CE6   01C0
        B       L_6BEE                          ; 6CE7   0220 00FA

        MVI@    R4,     R0                      ; 6CE9   02A0
        MOVR    R2,     R1                      ; 6CEA   0091
        ADDI    #$0021, R1                      ; 6CEB   02F9 0021
        MVI@    R1,     R1                      ; 6CED   0289

        JSR     R5,     L_60FE                  ; 6CEE   0004 0160 00FE

        B       L_6B30                          ; 6CF1   0220 01C2

        MVII    #$0002, R3                      ; 6CF3   02BB 0002
        B       L_6CF8                          ; 6CF5   0200 0001

        CLRR    R3                              ; 6CF7   01DB
L_6CF8:
        MVII    #$00FD, R5                      ; 6CF8   02BD 00FD
        B       L_6D03                          ; 6CFA   0200 0007

        MVII    #$0004, R3                      ; 6CFC   02BB 0004
        B       L_6D01                          ; 6CFE   0200 0001

        CLRR    R3                              ; 6D00   01DB
L_6D01:
        MVII    #$00FB, R5                      ; 6D01   02BD 00FB
L_6D03:
        MOVR    R2,     R1                      ; 6D03   0091
L_6D04:
        MVI@    R1,     R0                      ; 6D04   0288
        ANDR    R5,     R0                      ; 6D05   01A8
        XORR    R3,     R0                      ; 6D06   01D8
        MVO@    R0,     R1                      ; 6D07   0248
        B       L_6B30                          ; 6D08   0220 01D9

        MVII    #$0001, R3                      ; 6D0A   02BB 0001
L_6D0C:
        MOVR    R2,     R1                      ; 6D0C   0091
L_6D0D:
        MVII    #$00FF, R5                      ; 6D0D   02BD 00FF
        B       L_6D04                          ; 6D0F   0220 000C

        MOVR    R3,     R1                      ; 6D11   0099
        MVII    #$0001, R3                      ; 6D12   02BB 0001
        B       L_6D0D                          ; 6D14   0220 0008

        MVII    #$000C, R0                      ; 6D16   02B8 000C
        MVO     R0,     G_0142                  ; 6D18   0240 0142
        B       L_6B30                          ; 6D1A   0220 01EB

        MOVR    R2,     R5                      ; 6D1C   0095
        ADDI    #$0008, R5                      ; 6D1D   02FD 0008
        SDBD                                    ; 6D1F   0001
        MVI@    R5,     R0                      ; 6D20   02A8
        SDBD                                    ; 6D21   0001
        MVI@    R5,     R1                      ; 6D22   02A9

        JSR     R5,     .EXEC.A2F               ; 6D23   0004 0118 022F

        MOVR    R1,     R0                      ; 6D26   0088
        MOVR    R2,     R1                      ; 6D27   0091
        ADDI    #$0021, R1                      ; 6D28   02F9 0021
        CLRR    R3                              ; 6D2A   01DB
        MVI@    R1,     R1                      ; 6D2B   0289
        MOVR    R2,     R5                      ; 6D2C   0095
        ADDI    #$000A, R5                      ; 6D2D   02FD 000A
        CMPI    #$0002, R1                      ; 6D2F   0379 0002
        BGE     L_6D42                          ; 6D31   020D 000F

        SUBI    #$0003, R0                      ; 6D33   0338 0003
        BMI     L_6D3F                          ; 6D35   020B 0008

        CMPI    #$0002, R0                      ; 6D37   0378 0002
        BGT     L_6D3F                          ; 6D39   020E 0004

        MVII    #$0001, R0                      ; 6D3B   02B8 0001
        B       L_6BBA                          ; 6D3D   0220 0184

L_6D3F:
        SUBI    #$0002, R5                      ; 6D3F   033D 0002
        INCR    R3                              ; 6D41   000B
L_6D42:
        SDBD                                    ; 6D42   0001
        MVI@    R5,     R0                      ; 6D43   02A8
        NEGR    R0                              ; 6D44   0020
        SUBI    #$0002, R5                      ; 6D45   033D 0002
        MVO@    R0,     R5                      ; 6D47   0268
        SWAP    R0,     1                       ; 6D48   0040
        MVO@    R0,     R5                      ; 6D49   0268
        B       L_6D0C                          ; 6D4A   0220 003F

        MOVR    R3,     R5                      ; 6D4C   009D
        ADDI    #$0008, R5                      ; 6D4D   02FD 0008
        SDBD                                    ; 6D4F   0001
        MVI@    R5,     R0                      ; 6D50   02A8
        SDBD                                    ; 6D51   0001
        MVI@    R5,     R1                      ; 6D52   02A9
        MOVR    R2,     R5                      ; 6D53   0095
        ADDI    #$0008, R5                      ; 6D54   02FD 0008
        B       L_6D63                          ; 6D56   0200 000B

        MOVR    R2,     R5                      ; 6D58   0095
        ADDI    #$0008, R5                      ; 6D59   02FD 0008
        SDBD                                    ; 6D5B   0001
        MVI@    R5,     R0                      ; 6D5C   02A8
        SLL     R0,     1                       ; 6D5D   0048
        SDBD                                    ; 6D5E   0001
        MVI@    R5,     R1                      ; 6D5F   02A9
        SLL     R1,     1                       ; 6D60   0049
        SUBI    #$0004, R5                      ; 6D61   033D 0004
L_6D63:
        MVO@    R0,     R5                      ; 6D63   0268
        SWAP    R0,     1                       ; 6D64   0040
        MVO@    R0,     R5                      ; 6D65   0268
        NOP                                     ; 6D66   0034
L_6D67:
        MVO@    R1,     R5                      ; 6D67   0269
        SWAP    R1,     1                       ; 6D68   0041
        MVO@    R1,     R5                      ; 6D69   0269
        B       L_6B30                          ; 6D6A   0220 023B

        MOVR    R2,     R5                      ; 6D6C   0095
L_6D6D:
        ADDI    #$0008, R5                      ; 6D6D   02FD 0008
        CLRR    R0                              ; 6D6F   01C0
        CLRR    R1                              ; 6D70   01C9
        B       L_6D63                          ; 6D71   0220 000F

        MOVR    R3,     R5                      ; 6D73   009D
        B       L_6D6D                          ; 6D74   0220 0008

        MOVR    R3,     R1                      ; 6D76   0099
        ADDI    #$000E, R1                      ; 6D77   02F9 000E
        CLRR    R0                              ; 6D79   01C0
        MVO@    R0,     R1                      ; 6D7A   0248
        ADDI    #$0003, R1                      ; 6D7B   02F9 0003
        B       L_6BA7                          ; 6D7D   0220 01D7

        MVI@    R4,     R0                      ; 6D7F   02A0

        JSR     R5,     L_6FF5                  ; 6D80   0004 016C 03F5
        DECLE   $0004                           ; 6D83   0004

        ANDR    R5,     R0                      ; 6D84   01A8
        RRC     R0,     2                       ; 6D85   0074
        MVI@    R2,     R1                      ; 6D86   0291
        ANDI    #$0001, R1                      ; 6D87   03B9 0001
        BEQ     L_6D8C                          ; 6D89   0204 0001

        NEGR    R0                              ; 6D8B   0020
L_6D8C:
        MVI     G_033A, R1                      ; 6D8C   0281 033A
        ADDR    R0,     R1                      ; 6D8E   00C1
        MOVR    R2,     R5                      ; 6D8F   0095
        ADDI    #$0002, R5                      ; 6D90   02FD 0002
        B       L_6D67                          ; 6D92   0220 002C

        MVII    #$0002, R3                      ; 6D94   02BB 0002
        B       L_6DD4                          ; 6D96   0200 003C

        MVII    #$0004, R3                      ; 6D98   02BB 0004
        B       L_6DD4                          ; 6D9A   0200 0038

        MVII    #$0006, R3                      ; 6D9C   02BB 0006
        B       L_6DD4                          ; 6D9E   0200 0034

        MOVR    R2,     R1                      ; 6DA0   0091
        MVI@    R1,     R0                      ; 6DA1   0288
        ANDI    #$00F7, R0                      ; 6DA2   03B8 00F7
        XORI    #$0008, R0                      ; 6DA4   03F8 0008
        MVO@    R0,     R1                      ; 6DA6   0248
        MOVR    R1,     R5                      ; 6DA7   008D
        ADDI    #$000C, R5                      ; 6DA8   02FD 000C
        MVI@    R4,     R0                      ; 6DAA   02A0
        PSHR    R5                              ; 6DAB   0275

        JSR     R5,     L_6FF5                  ; 6DAC   0004 016C 03F5

        PULR    R5                              ; 6DAF   02B5
        MOVR    R0,     R1                      ; 6DB0   0081
        B       L_6D67                          ; 6DB1   0220 004B

        MVI@    R4,     R0                      ; 6DB3   02A0

        JSR     R5,     L_6FF5                  ; 6DB4   0004 016C 03F5
        DECLE   $0004                           ; 6DB7   0004

        ANDR    R5,     R0                      ; 6DB8   01A8
        RRC     R0,     2                       ; 6DB9   0074
        MVI@    R2,     R1                      ; 6DBA   0291
        ANDI    #$0001, R1                      ; 6DBB   03B9 0001
        BEQ     L_6DC0                          ; 6DBD   0204 0001

        NEGR    R0                              ; 6DBF   0020
L_6DC0:
        MVI     G_033A, R1                      ; 6DC0   0281 033A
        MOVR    R3,     R5                      ; 6DC2   009D
        ADDI    #$0002, R5                      ; 6DC3   02FD 0002
        ADDR    R0,     R1                      ; 6DC5   00C1
        B       L_6D67                          ; 6DC6   0220 0060

        MVI     G_033B, R1                      ; 6DC8   0281 033B
        MOVR    R3,     R5                      ; 6DCA   009D
        ADDI    #$0004, R5                      ; 6DCB   02FD 0004
        B       L_6DDA                          ; 6DCD   0200 000B

        MOVR    R3,     R5                      ; 6DCF   009D
        MVII    #$0006, R3                      ; 6DD0   02BB 0006
        B       L_6DD5                          ; 6DD2   0200 0001

L_6DD4:
        MOVR    R2,     R5                      ; 6DD4   0095
L_6DD5:
        ADDR    R3,     R5                      ; 6DD5   00DD
        SDBD                                    ; 6DD6   0001
        MVI@    R5,     R1                      ; 6DD7   02A9
        SUBI    #$0002, R5                      ; 6DD8   033D 0002
L_6DDA:
        MVI@    R4,     R0                      ; 6DDA   02A0
        PSHR    R5                              ; 6DDB   0275

        JSR     R5,     L_6FF5                  ; 6DDC   0004 016C 03F5
        DECLE   $0004                           ; 6DDF   0004

        ANDR    R5,     R0                      ; 6DE0   01A8
        RRC     R0,     2                       ; 6DE1   0074
        PULR    R5                              ; 6DE2   02B5
        ADDR    R0,     R1                      ; 6DE3   00C1
        B       L_6D67                          ; 6DE4   0220 007E

        PSHR    R3                              ; 6DE6   0273
L_6DE7:
        MVI@    R4,     R0                      ; 6DE7   02A0

        JSR     R5,     L_6FF5                  ; 6DE8   0004 016C 03F5

        MOVR    R0,     R1                      ; 6DEB   0081
        MVI     G_033A, R0                      ; 6DEC   0280 033A
        MVI     G_033D, R3                      ; 6DEE   0283 033D
        PULR    R5                              ; 6DF0   02B5
        ADDI    #$0008, R5                      ; 6DF1   02FD 0008
        CMPR    R3,     R0                      ; 6DF3   0158
        BLT     L_6D67                          ; 6DF4   0225 008E

        NEGR    R1                              ; 6DF6   0021
        B       L_6D67                          ; 6DF7   0220 0091

        PSHR    R2                              ; 6DF9   0272
        B       L_6DE7                          ; 6DFA   0220 0014

        MVI     G_033A, R0                      ; 6DFC   0280 033A
        MOVR    R3,     R1                      ; 6DFE   0099
        CLRR    R3                              ; 6DFF   01DB
        CMP     G_033D, R0                      ; 6E00   0340 033D
        BGT     L_6E06                          ; 6E02   020E 0002

        MVII    #$0001, R3                      ; 6E04   02BB 0001
L_6E06:
        MVI@    R1,     R0                      ; 6E06   0288
        ANDI    #$00FE, R0                      ; 6E07   03B8 00FE
        XORR    R3,     R0                      ; 6E09   01D8
        MVO@    R0,     R1                      ; 6E0A   0248
        XORI    #$0001, R3                      ; 6E0B   03FB 0001
        MVII    #$00FE, R5                      ; 6E0D   02BD 00FE
        B       L_6D03                          ; 6E0F   0220 010D

        MOVR    R3,     R1                      ; 6E11   0099
        MVI@    R2,     R3                      ; 6E12   0293
        ANDI    #$0001, R3                      ; 6E13   03BB 0001
        MVII    #$00FE, R5                      ; 6E15   02BD 00FE
        B       L_6D04                          ; 6E17   0220 0114

        CLRR    R3                              ; 6E19   01DB
        MVI     G_033A, R0                      ; 6E1A   0280 033A
        CMP     G_033D, R0                      ; 6E1C   0340 033D
        BLT     L_6E22                          ; 6E1E   0205 0002

L_6E20:
        MVII    #$0001, R3                      ; 6E20   02BB 0001
L_6E22:
        MVII    #$00FE, R5                      ; 6E22   02BD 00FE
        B       L_6D03                          ; 6E24   0220 0122

        MVI     G_033A, R0                      ; 6E26   0280 033A
        CLRR    R3                              ; 6E28   01DB
        SDBD                                    ; 6E29   0001
        CMPI    #$2800, R0                      ; 6E2A   0378 0000 0028
        BLE     L_6E22                          ; 6E2D   0226 000C
        B       L_6E20                          ; 6E2F   0220 0010

        JSR     R5,     L_6990                  ; 6E31   0004 0168 0190
        DECLE   $0005                           ; 6E34   0005

        PSHR    R0                              ; 6E35   0270
        MOVR    R3,     R1                      ; 6E36   0099

        JSR     R5,     L_6991                  ; 6E37   0004 0168 0191
        DECLE   $0005                           ; 6E3A   0005

        NEGR    R0                              ; 6E3B   0020
        ADD@    R6,     R0                      ; 6E3C   02F0
        ADDI    #$0028, R0                      ; 6E3D   02F8 0028
        SLR     R0,     2                       ; 6E3F   0064
        SLR     R0,     2                       ; 6E40   0064
        ADD@    R4,     R0                      ; 6E41   02E0
        MVI     G_0135, R1                      ; 6E42   0281 0135
        SARC    R1,     1                       ; 6E44   0079
        ADCR    R0                              ; 6E45   0028
        B       L_6BEB                          ; 6E46   0220 025C

        MVI@    R4,     R0                      ; 6E48   02A0

        JSR     R5,     L_60AF                  ; 6E49   0004 0160 00AF

        B       L_6B30                          ; 6E4C   0220 031D

        MOVR    R3,     R1                      ; 6E4E   0099
        ADDI    #$0016, R3                      ; 6E4F   02FB 0016
        MVI@    R3,     R0                      ; 6E51   0298
        CMPI    #$0006, R0                      ; 6E52   0378 0006
        BGT     L_6B30                          ; 6E54   022E 0325

        CMPI    #$0003, R0                      ; 6E56   0378 0003
        BEQ     L_6E5E                          ; 6E58   0204 0004

        CMPI    #$0004, R0                      ; 6E5A   0378 0004
        BNEQ    L_6E65                          ; 6E5C   020C 0007

L_6E5E:
        ADDI    #$0014, R1                      ; 6E5E   02F9 0014
        MVI@    R1,     R1                      ; 6E60   0289
        CMPI    #$0020, R1                      ; 6E61   0379 0020
        BNEQ    L_6B30                          ; 6E63   022C 0334

L_6E65:
        CLRR    R0                              ; 6E65   01C0
        MVO     R0,     G_0140                  ; 6E66   0240 0140
        MVO     R0,     G_0141                  ; 6E68   0240 0141

        JSR     R5,     L_55FF                  ; 6E6A   0004 0154 01FF
        BIDECLE $2000                           ; 6E6D   0000 0020

        B       L_6B30                          ; 6E6F   0220 0340

        DECLE   $0280,  $033D,  $0281,  $033E   ; 6E71   0280 033D 0281 033E
        DECLE   $0004,  $01A8,  $0067,  $0004   ; 6E75   0004 01A8 0067 0004

        ANDR    R5,     R0                      ; 6E79   01A8
        RRC     R0,     1                       ; 6E7A   0070
        PSHR    R4                              ; 6E7B   0274
        MOVR    R3,     R4                      ; 6E7C   009C
        ADDI    #$0002, R4                      ; 6E7D   02FC 0002

        JSR     R5,     L_61EE                  ; 6E7F   0004 0160 01EE

        PULR    R4                              ; 6E82   02B4
        SWAP    R0,     1                       ; 6E83   0040
        SWAP    R1,     1                       ; 6E84   0041
        MOVR    R2,     R5                      ; 6E85   0095
        ADDI    #$0002, R5                      ; 6E86   02FD 0002
        B       L_6D63                          ; 6E88   0220 0126

        MOVR    R2,     R1                      ; 6E8A   0091
        MOVR    R2,     R3                      ; 6E8B   0093
        ADDI    #$0001, R1                      ; 6E8C   02F9 0001
        ADDI    #$001F, R3                      ; 6E8E   02FB 001F
        MVI@    R1,     R0                      ; 6E90   0288
        MVI@    R3,     R5                      ; 6E91   029D
        MVO@    R0,     R3                      ; 6E92   0258
        MVO@    R5,     R1                      ; 6E93   024D
        ADDI    #$001B, R1                      ; 6E94   02F9 001B
        SUBI    #$0002, R3                      ; 6E96   033B 0002
        MVI@    R1,     R0                      ; 6E98   0288
        MVI@    R3,     R5                      ; 6E99   029D
        MVO@    R0,     R3                      ; 6E9A   0258
        MVO@    R5,     R1                      ; 6E9B   024D
        MVII    #$0004, R0                      ; 6E9C   02B8 0004
        CMPI    #$015D, R2                      ; 6E9E   037A 015D
        BEQ     L_6EA3                          ; 6EA0   0204 0001

        SLL     R0,     1                       ; 6EA2   0048

L_6EA3:
        JSR     R5,     L_5601                  ; 6EA3   0004 0154 0201

        B       L_6B30                          ; 6EA6   0220 0377

        DECLE   $0091,  $02F9,  $0014,  $0289   ; 6EA8   0091 02F9 0014 0289
        DECLE   $0004                           ; 6EAC   0004

        ANDR    R5,     R4                      ; 6EAD   01AC
        MVO@    R4,     R3                      ; 6EAE   025C
L_6EAF:
        B       L_6B30                          ; 6EAF   0220 0380

        DECLE   $02B9,  $0045,  $0093,  $0220   ; 6EB1   02B9 0045 0093 0220
        DECLE   $0009,  $0004,  $0168,  $0190   ; 6EB5   0009 0004 0168 0190
        DECLE   $0005                           ; 6EB9   0005

        SLR     R0,     2                       ; 6EBA   0064
        SLR     R0,     1                       ; 6EBB   0060
        MOVR    R0,     R1                      ; 6EBC   0081
        MVII    #$000F, R0                      ; 6EBD   02B8 000F

        JSR     R5,     X_RAND2                 ; 6EBF   0004 0114 029E

        ADDI    #$000A, R0                      ; 6EC2   02F8 000A
        SUBR    R1,     R0                      ; 6EC4   0108
        MOVR    R2,     R1                      ; 6EC5   0091
        ADDI    #$0011, R1                      ; 6EC6   02F9 0011
        B       L_6BA4                          ; 6EC8   0220 0325

        MVII    #$0021, R0                      ; 6ECA   02B8 0021
        MOVR    R2,     R3                      ; 6ECC   0093
        ADDI    #$0021, R3                      ; 6ECD   02FB 0021
        MVI@    R3,     R3                      ; 6ECF   029B
        CMPI    #$0002, R3                      ; 6ED0   037B 0002
        BLT     L_6EDC                          ; 6ED2   0205 0008

        MVII    #$0022, R0                      ; 6ED4   02B8 0022
        CMPI    #$0002, R3                      ; 6ED6   037B 0002
        BEQ     L_6EDC                          ; 6ED8   0204 0002

        MVII    #$0023, R0                      ; 6EDA   02B8 0023
L_6EDC:
        B       L_6B68                          ; 6EDC   0220 0375

        MVI     G_033A, R0                      ; 6EDE   0280 033A
        MVI     G_033B, R1                      ; 6EE0   0281 033B

        JSR     R5,     L_53E6                  ; 6EE2   0004 0150 03E6

        BC      L_6EAF                          ; 6EE5   0221 0037

        ADDI    #$0004, R4                      ; 6EE7   02FC 0004
        B       L_6EAF                          ; 6EE9   0220 003B

        MVI     G_033B, R0                      ; 6EEB   0280 033B
        MOVR    R2,     R5                      ; 6EED   0095
        ADDI    #$000A, R5                      ; 6EEE   02FD 000A
        MVII    #$0030, R1                      ; 6EF0   02B9 0030
        SDBD                                    ; 6EF2   0001
        CMPI    #$1080, R0                      ; 6EF3   0378 0080 0010
        BLE     L_6EF9                          ; 6EF6   0206 0001

        NEGR    R1                              ; 6EF8   0021
L_6EF9:
        B       L_6D67                          ; 6EF9   0220 0193

        MOVR    R2,     R1                      ; 6EFB   0091
        ADDI    #$0012, R1                      ; 6EFC   02F9 0012
        MVI@    R1,     R1                      ; 6EFE   0289
        CMPI    #$0005, R1                      ; 6EFF   0379 0005
        BEQ     L_6EAF                          ; 6F01   0224 0053

        ADDI    #$0002, R4                      ; 6F03   02FC 0002
        B       L_6EAF                          ; 6F05   0220 0057

        MVI@    R4,     R0                      ; 6F07   02A0
        MOVR    R2,     R1                      ; 6F08   0091
        ADDI    #$0020, R1                      ; 6F09   02F9 0020
        MVO@    R0,     R1                      ; 6F0B   0248
        B       L_6EAF                          ; 6F0C   0220 005E

        MOVR    R2,     R1                      ; 6F0E   0091
        ADDI    #$0020, R1                      ; 6F0F   02F9 0020
        MVI@    R1,     R0                      ; 6F11   0288
        B       L_6B68                          ; 6F12   0220 03AB

        JSR     R5,     L_6990                  ; 6F14   0004 0168 0190
        DECLE   $0006                           ; 6F17   0006

        PSHR    R0                              ; 6F18   0270
        SLR     R0,     2                       ; 6F19   0064
        NEGR    R0                              ; 6F1A   0020
        ADD@    R6,     R0                      ; 6F1B   02F0
        MOVR    R2,     R1                      ; 6F1C   0091
        ADDI    #$0011, R1                      ; 6F1D   02F9 0011
        B       L_6BA4                          ; 6F1F   0220 037C

        MOVR    R2,     R1                      ; 6F21   0091
        ADDI    #$0022, R1                      ; 6F22   02F9 0022
        MVI@    R1,     R5                      ; 6F24   028D
        CLRR    R0                              ; 6F25   01C0
        MVO@    R0,     R1                      ; 6F26   0248
        CMPI    #$0005, R5                      ; 6F27   037D 0005
        BLT     L_6EAF                          ; 6F29   0225 007B

        JSR     R5,     L_6990                  ; 6F2B   0004 0168 0190
        DECLE   $0006                           ; 6F2E   0006

        MOVR    R0,     R1                      ; 6F2F   0081
        MVII    #$0064, R0                      ; 6F30   02B8 0064

        JSR     R5,     X_RAND2                 ; 6F32   0004 0114 029E

        INCR    R0                              ; 6F35   0008
        CMPR    R0,     R1                      ; 6F36   0141
        BLT     L_6EAF                          ; 6F37   0225 0089

        MVII    #$0000, R0                      ; 6F39   02B8 0000
        B       L_6BBA                          ; 6F3B   0220 0382

        MOVR    R2,     R1                      ; 6F3D   0091
        MVII    #$0003, R0                      ; 6F3E   02B8 0003
        NEGR    R0                              ; 6F40   0020

        JSR     R5,     L_69A1                  ; 6F41   0004 0168 01A1

        B       L_6EAF                          ; 6F44   0220 0096

        MVI@    R2,     R0                      ; 6F46   0290
        ANDI    #$00F7, R0                      ; 6F47   03B8 00F7
        MVO@    R0,     R2                      ; 6F49   0250
        CLRR    R1                              ; 6F4A   01C9
        MOVR    R2,     R5                      ; 6F4B   0095
        ADDI    #$0006, R5                      ; 6F4C   02FD 0006
        MVO@    R1,     R5                      ; 6F4E   0269
        MVO@    R1,     R5                      ; 6F4F   0269
        MOVR    R2,     R5                      ; 6F50   0095
        ADDI    #$000C, R5                      ; 6F51   02FD 000C
        B       L_6D67                          ; 6F53   0220 01ED
        J       L_5B27                          ; 6F55   0004 0358 0327

        MOVR    R3,     R1                      ; 6F58   0099
        ADDI    #$0014, R1                      ; 6F59   02F9 0014
        MVI@    R1,     R0                      ; 6F5B   0288
        CMPI    #$0029, R0                      ; 6F5C   0378 0029
        BEQ     L_6F63                          ; 6F5E   0204 0003

        INCR    R4                              ; 6F60   000C
        B       L_6EAF                          ; 6F61   0220 00B3

L_6F63:
        INCR    R0                              ; 6F63   0008
        B       L_6BF2                          ; 6F64   0220 0373

        MVI     G_033A, R1                      ; 6F66   0281 033A
        MOVR    R2,     R3                      ; 6F68   0093
L_6F69:
        MOVR    R3,     R5                      ; 6F69   009D
        ADDI    #$0016, R5                      ; 6F6A   02FD 0016
        MVI@    R5,     R0                      ; 6F6C   02A8
        MVI@    R3,     R3                      ; 6F6D   029B
        ANDI    #$0001, R3                      ; 6F6E   03BB 0001
        CMPI    #$0002, R0                      ; 6F70   0378 0002
        BGT     L_6FA0                          ; 6F72   020E 002C

        SDBD                                    ; 6F74   0001
        CMPI    #$2080, R1                      ; 6F75   0379 0080 0020
        BLE     L_6F85                          ; 6F78   0206 000B

        SDBD                                    ; 6F7A   0001
        CMPI    #$2F80, R1                      ; 6F7B   0379 0080 002F
        BLT     L_6EAF                          ; 6F7E   0225 00D0

L_6F80:
        TSTR    R3                              ; 6F80   009B
        BEQ     L_6EAF                          ; 6F81   0224 00D3
        B       L_6F88                          ; 6F83   0200 0003

L_6F85:
        TSTR    R3                              ; 6F85   009B
        BNEQ    L_6EAF                          ; 6F86   022C 00D8

L_6F88:
        MVI     G_015D, R0                      ; 6F88   0280 015D
        MVI     G_0180, R1                      ; 6F8A   0281 0180
        MVO     R0,     G_0180                  ; 6F8C   0240 0180
        MVO     R1,     G_015D                  ; 6F8E   0241 015D
        MVII    #$015F, R1                      ; 6F90   02B9 015F
        MVII    #$0182, R3                      ; 6F92   02BB 0182
L_6F94:
        MVI@    R1,     R0                      ; 6F94   0288
        MVI@    R3,     R5                      ; 6F95   029D
        MVO@    R5,     R1                      ; 6F96   024D
        MVO@    R0,     R3                      ; 6F97   0258
        INCR    R1                              ; 6F98   0009
        INCR    R3                              ; 6F99   000B
        CMPI    #$0163, R1                      ; 6F9A   0379 0163
        BLT     L_6F94                          ; 6F9C   0225 0009
        B       L_6EAF                          ; 6F9E   0220 00F0

L_6FA0:
        SLL     R0,     2                       ; 6FA0   004C
        DECLE   $0001,  $02BD,  $0082,  $0054   ; 6FA1   0001 02BD 0082 0054
        DECLE   $00C5,  $02A8,  $0270,  $0328   ; 6FA5   00C5 02A8 0270 0328
        DECLE   $0020,  $0060,  $02F0,  $0004   ; 6FA9   0020 0060 02F0 0004

        ANDR    R5,     R0                      ; 6FAD   01A8
        RRC     R0,     2                       ; 6FAE   0074
        CMPR    R0,     R1                      ; 6FAF   0141
        BGT     L_6F80                          ; 6FB0   022E 0031
        B       L_6F85                          ; 6FB2   0220 002E

        MVI     G_033D, R1                      ; 6FB4   0281 033D
        B       L_6F69                          ; 6FB6   0220 004E

        MVI     G_033A, R0                      ; 6FB8   0280 033A
        MVO     R0,     G_033F                  ; 6FBA   0240 033F
        MVI     G_033B, R0                      ; 6FBC   0280 033B
        MVO     R0,     G_0340                  ; 6FBE   0240 0340
        B       L_6EAF                          ; 6FC0   0220 0112

        MVI     G_033F, R0                      ; 6FC2   0280 033F
        MVI     G_0340, R1                      ; 6FC4   0281 0340
        MOVR    R2,     R5                      ; 6FC6   0095
        ADDI    #$0002, R5                      ; 6FC7   02FD 0002
        B       L_6D63                          ; 6FC9   0220 0267

        MOVR    R2,     R0                      ; 6FCB   0090
        MOVR    R3,     R5                      ; 6FCC   009D
L_6FCD:
        ADDI    #$0004, R5                      ; 6FCD   02FD 0004
        SDBD                                    ; 6FCF   0001
        MVI@    R5,     R1                      ; 6FD0   02A9
        INCR    R1                              ; 6FD1   0009
        MOVR    R0,     R5                      ; 6FD2   0085
        ADDI    #$0004, R5                      ; 6FD3   02FD 0004
        B       L_6D67                          ; 6FD5   0220 026F

        MOVR    R3,     R0                      ; 6FD7   0098
        MOVR    R2,     R5                      ; 6FD8   0095
        B       L_6FCD                          ; 6FD9   0220 000D

        MOVR    R2,     R1                      ; 6FDB   0091
        MVII    #$0016, R0                      ; 6FDC   02B8 0016
        ADDI    #$0016, R1                      ; 6FDE   02F9 0016
        MVI@    R1,     R1                      ; 6FE0   0289
        CMPI    #$0002, R1                      ; 6FE1   0379 0002
        BLE     L_6FEC                          ; 6FE3   0206 0007

        MVII    #$0014, R0                      ; 6FE5   02B8 0014

        JSR     R5,     L_60AF                  ; 6FE7   0004 0160 00AF

        MVII    #$0015, R0                      ; 6FEA   02B8 0015
L_6FEC:
        J       L_6B81                          ; 6FEC   0004 0368 0381

        ADDI    #$0022, R3                      ; 6FEF   02FB 0022
        CLRR    R0                              ; 6FF1   01C0
        MVO@    R0,     R3                      ; 6FF2   0258
        B       L_6EAF                          ; 6FF3   0220 0145

L_6FF5:
        PSHR    R5                              ; 6FF5   0275
        MOVR    R0,     R5                      ; 6FF6   0085
        ANDI    #$01FF, R0                      ; 6FF7   03B8 01FF
        XORR    R0,     R5                      ; 6FF9   01C5
        BEQ     L_6FFD                          ; 6FFA   0204 0001

        NEGR    R0                              ; 6FFC   0020
L_6FFD:
        PULR    R7                              ; 6FFD   02B7

        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
        DECLE   $0100,  $001C,  $023E,  $023E   ; D000   0100 001C 023E 023E
        DECLE   $017F,  $027F                   ; D004   017F 027F

        SLR     R1,     1                       ; D006   0061
        CMPR    R0,     R0                      ; D007   0140
        CMPR    R1,     R2                      ; D008   014A
        MVO@    R0,     R4                      ; D009   0260
        GSWD    R0                              ; D00A   0030
        SUB@    R1,     R6                      ; D00B   030E
        SUBR    R0,     R0                      ; D00C   0100
        B       L_D20F                          ; D00D   0200 0200

        DECLE   $0300,  $0000,  $001C,  $003E   ; D00F   0300 0000 001C 003E
        DECLE   $003E,  $017F,  $007F,  $027F   ; D013   003E 017F 007F 027F
        DECLE   $007F,  $017F,  $027F,  $003E   ; D017   007F 017F 027F 003E
        DECLE   $0100,  $0100,  $0200,  $0300   ; D01B   0100 0100 0200 0300
        DECLE   $0100,  $0100,  $021C,  $033E   ; D01F   0100 0100 021C 033E
        DECLE   $013E,  $017F,  $027F,  $0178   ; D023   013E 017F 027F 0178
        DECLE   $0170,  $0172,  $0370,  $0018   ; D027   0170 0172 0370 0018
        DECLE   $020E,  $0000,  $0000,  $0000   ; D02B   020E 0000 0000 0000
        DECLE   $0000,  $0100,  $0100,  $0100   ; D02F   0000 0100 0100 0100
        DECLE   $0220,  $0169,  $0261,  $02E1   ; D033   0220 0169 0261 02E1
        DECLE   $01E1,  $01F1,  $02FA,  $00FA   ; D037   01E1 01F1 02FA 00FA
        DECLE   $03FC,  $007C,  $003C,  $0000   ; D03B   03FC 007C 003C 0000
        DECLE   $0000,  $0100,  $0100,  $013C   ; D03F   0000 0100 0100 013C
        DECLE   $023E,  $013E,  $025F,  $025F   ; D043   023E 013E 025F 025F
        DECLE   $018F,  $0187,  $0287,  $0086   ; D047   018F 0187 0287 0086
        DECLE   $0396,  $0104,  $0200,  $0200   ; D04B   0396 0104 0200 0200
        DECLE   $0100,  $0100,  $0209,  $032A   ; D04F   0100 0100 0209 032A
        DECLE   $03BE,  $017F,  $032A,  $0121   ; D053   03BE 017F 032A 0121
        DECLE   $0140,  $014A,  $0300,  $0000   ; D057   0140 014A 0300 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; D05B   0300 0000 0000 0000
        DECLE   $0000,  $0100,  $0008,  $002A   ; D05F   0000 0100 0008 002A
        DECLE   $023E,  $017F,  $023E,  $003F   ; D063   023E 017F 023E 003F
        DECLE   $017E,  $013E,  $031D,  $0014   ; D067   017E 013E 031D 0014
        DECLE   $0200,  $0100,  $0200,  $0100   ; D06B   0200 0100 0200 0100
        DECLE   $0200,  $0000,  $0214           ; D06F   0200 0000 0214

        DECR    R4                              ; D072   0014
        SLLC    R2,     2                       ; D073   005E
        SUBR    R7,     R6                      ; D074   013E
        SUB@    R6,     R5                      ; D075   0335
        CMPR    R6,     R0                      ; D076   0170
        NEGR    R0                              ; D077   0020
        SUBR    R4,     R2                      ; D078   0122
        MVO@    R0,     R2                      ; D079   0250
        B       L_D07C                          ; D07A   0200 0000

L_D07C:
        SUBR    R0,     R0                      ; D07C   0100
        B       L_D17F                          ; D07D   0200 0100

        DECLE   $0100,  $0000,  $0000,  $0000   ; D07F   0100 0000 0000 0000
        DECLE   $0000                           ; D083   0000

        SUBR    R5,     R0                      ; D084   0128
        NEGR    R0                              ; D085   0020
        RRC     R0,     1                       ; D086   0070
        SUB@    R4,     R0                      ; D087   0320
        SUBR    R6,     R0                      ; D088   0130
        PSHR    R0                              ; D089   0270
        MOVR    R5,     R2                      ; D08A   00AA
        SUBR    R7,     R4                      ; D08B   013C
        SUBR    R2,     R6                      ; D08C   0116
        SUB@    R4,     R4                      ; D08D   0324
        SUBR    R4,     R0                      ; D08E   0120
        B       L_D191                          ; D08F   0200 0100

        DECLE   $0200,  $0114,  $0118,  $013C   ; D091   0200 0114 0118 013C
        DECLE   $027E,  $0354,  $0106,  $010C   ; D095   027E 0354 0106 010C
        DECLE   $0206,  $0004,  $0114,  $0100   ; D099   0206 0004 0114 0100
        DECLE   $0208,  $0300,  $0200,  $0000   ; D09D   0208 0300 0200 0000
        DECLE   $001C,  $003E,  $003E,  $017F   ; D0A1   001C 003E 003E 017F
        DECLE   $0073,  $0061,  $02C0,  $01CA   ; D0A5   0073 0061 02C0 01CA
        DECLE   $02E0,  $01EE,  $01BB,  $013F   ; D0A9   02E0 01EE 01BB 013F
        DECLE   $021E,  $001E,  $010C,  $0100   ; D0AD   021E 001E 010C 0100
        DECLE   $021C,  $003E,  $033E,  $017F   ; D0B1   021C 003E 033E 017F
        DECLE   $027F,  $027F,  $007F,  $017F   ; D0B5   027F 027F 007F 017F
        DECLE   $027F,  $007E,  $023E,  $012C   ; D0B9   027F 007E 023E 012C
        DECLE   $0300,  $0100,  $0100,  $0100   ; D0BD   0300 0100 0100 0100
        DECLE   $021C,  $033E,  $013F,  $007F   ; D0C1   021C 033E 013F 007F
        DECLE   $007F,  $0079,  $0070,  $0172   ; D0C5   007F 0079 0070 0172
        DECLE   $0078,  $00FB,  $02FE,  $01CF   ; D0C9   0078 00FB 02FE 01CF
        DECLE   $0207,  $0007                   ; D0CD   0207 0007

        SUBR    R0,     R3                      ; D0CF   0103
        SUBR    R0,     R0                      ; D0D0   0100
        SUB     .STIC.X.0,R0                    ; D0D1   0300 0000
        MVO@    R0,     R4                      ; D0D3   0260
        CMPR    R1,     R0                      ; D0D4   0148
        ADD     G_03C6, R6                      ; D0D5   02C6 03C6
        ADD     G_01E3, R7                      ; D0D7   02C7 01E3
        ADD@    R4,     R7                      ; D0D9   02E7

        DECLE   $01FF,  $01FF,  $017D,  $033E   ; D0DA   01FF 01FF 017D 033E
        DECLE   $020F,  $0106,  $0000,  $0000   ; D0DE   020F 0106 0000 0000
        DECLE   $0000,  $003C,  $017E,  $007F   ; D0E2   0000 003C 017E 007F
        DECLE   $01E7,  $00C7,  $01E3,  $02E3   ; D0E6   01E7 00C7 01E3 02E3
        DECLE   $03E3,  $03D2,  $01C6,  $02C0   ; D0EA   03E3 03D2 01C6 02C0
        DECLE   $0060,  $0360,  $0100,  $031C   ; D0EE   0060 0360 0100 031C
        DECLE   $013E,  $003F,  $017F,  $0277   ; D0F2   013E 003F 017F 0277
        DECLE   $0371,  $0361,  $016A,  $0360   ; D0F6   0371 0361 016A 0360
        DECLE   $0024,  $022E,  $000A,  $0000   ; D0FA   0024 022E 000A 0000
        DECLE   $0000,  $0000,  $0100,  $011C   ; D0FE   0000 0000 0100 011C
        DECLE   $003E,  $003E,  $017F,  $027F   ; D102   003E 003E 017F 027F
        DECLE   $007F,  $017F,  $013E,  $023E   ; D106   007F 017F 013E 023E
        DECLE   $021C,  $0108,  $0100,  $0200   ; D10A   021C 0108 0100 0200
        DECLE   $0300,  $0200,  $0000,  $001C   ; D10E   0300 0200 0000 001C
        DECLE   $003E,  $003E,  $017F,  $017F   ; D112   003E 003E 017F 017F
        DECLE   $0079,  $0378,  $0172,  $0270   ; D116   0079 0378 0172 0270
        DECLE   $0239,  $0013,  $0102,  $0200   ; D11A   0239 0013 0102 0200
        DECLE   $0200                           ; D11E   0200

        SUBR    R0,     R0                      ; D11F   0100
        SUBR    R0,     R0                      ; D120   0100
        B       L_D223                          ; D121   0200 0100

        DECLE   $0120,  $016A,  $0263,  $02F1   ; D123   0120 016A 0263 02F1
        DECLE   $03F0,  $00F0,  $00F4,  $00FE   ; D127   03F0 00F0 00F4 00FE
        DECLE   $00FE,  $01FE,  $00FC,  $037C   ; D12B   00FE 01FE 00FC 037C
        DECLE   $0330,  $0100,  $0200,  $011C   ; D12F   0330 0100 0200 011C
        DECLE   $023E,  $007E,  $027F,  $002F   ; D133   023E 007E 027F 002F
        DECLE   $000F,  $010F,  $018F,  $00C7   ; D137   000F 010F 018F 00C7
        DECLE   $0356,  $0106,  $0204,  $0300   ; D13B   0356 0106 0204 0300
        DECLE   $0000,  $0100,  $021C,  $003E   ; D13F   0000 0100 021C 003E
        DECLE   $013E,  $017F,  $027F,  $037F   ; D143   013E 017F 027F 037F
        DECLE   $0161,  $004A,  $0000,  $003E   ; D147   0161 004A 0000 003E
        DECLE   $001E,  $013E,  $001C,  $0000   ; D14B   001E 013E 001C 0000
        DECLE   $0200,  $0100,  $021C,  $003E   ; D14F   0200 0100 021C 003E
        DECLE   $017F,  $017F,  $037F,  $007F   ; D153   017F 017F 037F 007F
        DECLE   $027F,  $017F,  $027F           ; D157   027F 017F 027F

        SUBI    #$031C, R6                      ; D15A   033E 031C
        SUBR    R0,     R0                      ; D15C   0100
        B       L_D45F                          ; D15D   0200 0300
        B       L_D161                          ; D15F   0200 0000

L_D161:
        COMR    R4                              ; D161   001C
        DECLE   $003E,  $003E,  $017F,  $037F   ; D162   003E 003E 017F 037F
        DECLE   $017F,  $0278                   ; D166   017F 0278

        CMPR    R6,     R2                      ; D168   0172
        PSHR    R0                              ; D169   0270
        SUB@    R5,     R7                      ; D16A   032F
L_D16B:
        SUB@    R4,     R7                      ; D16B   0327
        SUBR    R2,     R7                      ; D16C   0117

        DECLE   $020E,  $0300,  $0200,  $0000   ; D16D   020E 0300 0200 0000

        B       L_D179                          ; D171   0200 0006

        SLR     R3,     2                       ; D173   0067
        CMPR    R5,     R3                      ; D174   016B
        XORR    R4,     R3                      ; D175   01E3
        XORR    R6,     R5                      ; D176   01F5
        ADDR    R6,     R5                      ; D177   00F5
        XORR    R6,     R5                      ; D178   01F5
L_D179:
        ADDI    #$02FA, R2                      ; D179   02FA 02FA
        SARC    R2,     2                       ; D17B   007E
        CMPR    R7,     R4                      ; D17C   017C
        SUBI    #$0100, R0                      ; D17D   0338 0100
L_D17F:
        SUBR    R0,     R0                      ; D17F   0100
        SUBR    R0,     R0                      ; D180   0100
        B       L_D29F                          ; D181   0200 011C

        RSWD    R6                              ; D183   003E
        SARC    R2,     2                       ; D184   007E
        SLLC    R3,     2                       ; D185   005F
        SLLC    R3,     2                       ; D186   005F
        MOVR    R5,     R7                      ; D187   00AF

        DECLE   $01A7,  $00A7,  $03C6,  $01D6   ; D188   01A7 00A7 03C6 01D6
        DECLE   $01E4,  $0260,  $0200,  $0100   ; D18C   01E4 0260 0200 0100

        SUBR    R0,     R0                      ; D190   0100
L_D191:
        SUB@    R1,     R4                      ; D191   030C
        DECLE   $001E,  $033E,  $011F,  $0320   ; D192   001E 033E 011F 0320
        DECLE   $013F                           ; D196   013F

        NEGR    R0                              ; D197   0020
        SUBR    R5,     R2                      ; D198   012A
        MVO@    R0,     R4                      ; D199   0260
        CMPR    R4,     R1                      ; D19A   0161
        CMPR    R4,     R1                      ; D19B   0161
        CMPR    R6,     R1                      ; D19C   0171
        CMP@    R6,     R1                      ; D19D   0371
        DECR    R1                              ; D19E   0011
        B       L_D1A1                          ; D19F   0200 0000

L_D1A1:
        INCR    R4                              ; D1A1   000C
        DECLE   $001E,  $001E,  $013F,  $011E   ; D1A2   001E 001E 013F 011E
        DECLE   $0121,  $013F,  $013F,  $027F   ; D1A6   0121 013F 013F 027F
        DECLE   $017F,  $037F,  $017F,  $023E   ; D1AA   017F 037F 017F 023E
        DECLE   $033E,  $001C,  $0100,  $030C   ; D1AE   033E 001C 0100 030C
        DECLE   $021E,  $013E,  $000F,  $0030   ; D1B2   021E 013E 000F 0030
        DECLE   $003F,  $0038,  $013A,  $0038   ; D1B6   003F 0038 013A 0038
        DECLE   $0078,  $037C,  $017C,  $0278   ; D1BA   0078 037C 017C 0278
        DECLE   $0240,  $0000,  $0100,  $0200   ; D1BE   0240 0000 0100 0200
        DECLE   $0220,  $01A0,  $01A8,  $02A0   ; D1C2   0220 01A0 01A8 02A0
        DECLE   $01B0,  $01BE,  $01BE,  $02BE   ; D1C6   01B0 01BE 01BE 02BE
        DECLE   $013F,  $021F,  $0007,  $0203   ; D1CA   013F 021F 0007 0203
        DECLE   $0003,  $0001,  $0100,  $0000   ; D1CE   0003 0001 0100 0000
        DECLE   $0000,  $0200,  $0138,  $027C   ; D1D2   0000 0200 0138 027C

        ADDI    #$01FD, R5                      ; D1D6   02FD 01FD
        XORR    R7,     R5                      ; D1D8   01FD
L_D1D9:
        ADD@    R1,     R5                      ; D1D9   02CD
        DECLE   $0185,  $0395,  $0085,  $0004   ; D1DA   0185 0395 0085 0004
        DECLE   $0000,  $0000,  $0100,  $010A   ; D1DE   0000 0000 0100 010A
        DECLE   $013E,  $003E,  $01CE,  $02F5   ; D1E2   013E 003E 01CE 02F5
        DECLE   $023F,  $0000,  $011A,  $0318   ; D1E6   023F 0000 011A 0318
        DECLE   $0124,  $010A,  $012E,  $020E   ; D1EA   0124 010A 012E 020E

        SUB@    R4,     R4                      ; D1EE   0324
        B       L_D32B                          ; D1EF   0200 013A

        DECLE   $023E,  $017E,  $007E,  $01CE   ; D1F1   023E 017E 007E 01CE
        DECLE   $02F3,  $013F,  $010E,  $0100   ; D1F5   02F3 013F 010E 0100
        DECLE   $0301,  $0000,  $0201,  $0000   ; D1F9   0301 0000 0201 0000
        DECLE   $0001,  $0000,  $0000,  $0104   ; D1FD   0001 0000 0000 0104
        DECLE   $003C,  $013C,  $037C,  $017A   ; D201   003C 013C 037C 017A
        DECLE   $027F,  $03AF                   ; D205   027F 03AF

        XORI    #$01FA, R4                      ; D207   03FC 01FA
        CMP@    R4,     R2                      ; D209   0362
        INCR    R1                              ; D20A   0009
        BOV     L_D318                          ; D20B   0202 010B
        BPL     L_D318                          ; D20D   0203 0109

L_D20F:
        SUB     G_0108, R0                      ; D20F   0300 0108
        DECLE   $0208,  $0119,  $01D1,  $015B   ; D211   0208 0119 01D1 015B
        DECLE   $02DB,  $03D4,  $03D2,  $01D1   ; D215   02DB 03D4 03D2 01D1
        DECLE   $03D8,  $01E8,  $0168,  $0168   ; D219   03D8 01E8 0168 0168
        DECLE   $0314,  $0004,  $0300,  $0000   ; D21D   0314 0004 0300 0000
        DECLE   $0000,  $0000                   ; D221   0000 0000
L_D223:
        NEGR    R0                              ; D223   0020
        SUBR    R4,     R0                      ; D224   0120
        ADCR    R0                              ; D225   0028
        SUBR    R6,     R6                      ; D226   0136
        SUB@    R2,     R6                      ; D227   0316
        SUBR    R2,     R7                      ; D228   0117

        DECLE   $0217,  $031B,  $031B,  $012A   ; D229   0217 031B 031B 012A
        DECLE   $035B,  $005C,  $02EE,  $0118   ; D22D   035B 005C 02EE 0118
        DECLE   $020C,  $010C,  $001E,  $011E   ; D231   020C 010C 001E 011E
        DECLE   $021E,  $033F,  $033F,  $0135   ; D235   021E 033F 033F 0135
        DECLE   $0235,  $033F,  $023F,  $003E   ; D239   0235 033F 023F 003E
        DECLE   $001E,  $000C,  $0000,  $0106   ; D23D   001E 000C 0000 0106
        DECLE   $010C,  $000C,  $021C,  $011E   ; D241   010C 000C 021C 011E
        DECLE   $023E,  $003E,  $013F,  $013F   ; D245   023E 003E 013F 013F
        DECLE   $023F,  $033F,  $011E,  $011E   ; D249   023F 033F 011E 011E
        DECLE   $020E,  $0003,  $0200,  $0118   ; D24D   020E 0003 0200 0118
        DECLE   $022C,  $010C,  $010E,  $011E   ; D251   022C 010C 010E 011E
        DECLE   $021F,  $001F,  $013F,  $013D   ; D255   021F 001F 013F 013D
        DECLE   $033D,  $013F,  $013E,  $003E   ; D259   033D 013F 013E 003E
        DECLE   $003C,  $0070,  $0000,  $0000   ; D25D   003C 0070 0000 0000
        DECLE   $0000                           ; D261   0000

        COMR    R4                              ; D262   001C
        RSWD    R6                              ; D263   003E
        CMPR    R6,     R6                      ; D264   0176
        RRC     R3,     2                       ; D265   0077
        ADDI    #$02FF, R7                      ; D266   02FF 02FF

        DECLE   $01BF,  $039F                   ; D268   01BF 039F

        CMPR    R1,     R7                      ; D26A   014F
        SUBR    R0,     R1                      ; D26B   0101
        SUBR    R0,     R1                      ; D26C   0101
        B       L_D36F                          ; D26D   0200 0100

        DECLE   $0000                           ; D26F   0000

        SUBR    R0,     R0                      ; D270   0100
        B       L_D373                          ; D271   0200 0100

        DECLE   $0300,  $0100,  $023C,  $017E   ; D273   0300 0100 023C 017E
        DECLE   $017E,  $007F,  $00FF,  $00EF   ; D277   017E 007F 00FF 00EF
        DECLE   $00ED,  $01F9,  $00F1,  $0282   ; D27B   00ED 01F9 00F1 0282
        DECLE   $0100,  $0138,  $021C,  $031C   ; D27F   0100 0138 021C 031C
        DECLE   $020C,  $010C,  $020C,  $0200   ; D283   020C 010C 020C 0200

        B       L_D393                          ; D287   0200 010A

        SUB     .ISRVEC.0,R0                    ; D289   0300 0100
        SUBR    R0,     R0                      ; D28B   0100
        SUBR    R0,     R0                      ; D28C   0100
        SUB     .STIC.X.0,R0                    ; D28D   0300 0000
        B       L_D3C1                          ; D28F   0200 0130

        DECLE   $0338,  $0218,  $0118,  $0018   ; D291   0338 0218 0118 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; D295   0018 0018 0018 0018
        DECLE   $0018,  $0118,  $0228           ; D299   0018 0118 0228

        SUB@    R4,     R0                      ; D29C   0320
        MVO@    R0,     R4                      ; D29D   0260
        SWAP    R0,     1                       ; D29E   0040
L_D29F:
        MVO     R0,     .ISRVEC.0               ; D29F   0240 0100
        DECLE   $0118,  $003E,  $003E,  $017F   ; D2A1   0118 003E 003E 017F
        DECLE   $0173,  $0061,  $0240,  $0142   ; D2A5   0173 0061 0240 0142
        DECLE   $0040,  $0100,  $0100,  $0140   ; D2A9   0040 0100 0100 0140
        DECLE   $0100,  $0040,  $0320,  $0100   ; D2AD   0100 0040 0320 0100
        DECLE   $0000,  $0130,  $0160,  $0168   ; D2B1   0000 0130 0160 0168
        DECLE   $00C0,  $03C0,  $02C0,  $01C0   ; D2B5   00C0 03C0 02C0 01C0
        DECLE   $01C0,  $0160,  $0070,  $013C   ; D2B9   01C0 0160 0070 013C
        DECLE   $0102,  $0000,  $0301,  $0000   ; D2BD   0102 0000 0301 0000
        DECLE   $0000,  $0000,  $003C,  $034E   ; D2C1   0000 0000 003C 034E
        DECLE   $0306,  $0383,  $0303,  $0083   ; D2C5   0306 0383 0303 0083
        DECLE   $0003,  $0103,  $0316,  $0306   ; D2C9   0003 0103 0316 0306
        DECLE   $010C,  $0300,  $0100,  $0100   ; D2CD   010C 0300 0100 0100
        DECLE   $0000,  $0036,  $023A,  $007F   ; D2D1   0000 0036 023A 007F
        DECLE   $027F,  $0071,  $00E0,  $01EA   ; D2D5   027F 0071 00E0 01EA
        DECLE   $00E0,  $0340,  $0340,  $0000   ; D2D9   00E0 0340 0340 0000
        DECLE   $0200,  $0000,  $0000,  $0100   ; D2DD   0200 0000 0000 0100
        DECLE   $0014,  $013E,  $003E,  $007E   ; D2E1   0014 013E 003E 007E
        DECLE   $027E                           ; D2E5   027E

        SARC    R2,     2                       ; D2E6   007E
        SARC    R2,     2                       ; D2E7   007E
        SUBR    R7,     R4                      ; D2E8   013C
        SUBR    R3,     R0                      ; D2E9   0118
        B       L_D3FC                          ; D2EA   0200 0110

        DECLE   $0018,  $0238,  $0038,  $0070   ; D2EC   0018 0238 0038 0070
        DECLE   $0000,  $021C,  $003E,  $003E   ; D2F0   0000 021C 003E 003E
        DECLE   $007F,  $027F,  $0079,  $0078   ; D2F4   007F 027F 0079 0078
        DECLE   $0072,  $0270,  $0040,  $0000   ; D2F8   0072 0270 0040 0000
        DECLE   $0140,  $01C0,  $00E0,  $0370   ; D2FC   0140 01C0 00E0 0370
        DECLE   $0000                           ; D300   0000

        B       L_D303                          ; D301   0200 0000

L_D303:
        NEGR    R0                              ; D303   0020
        DECLE   $0168,  $0060,  $0370,  $00F0   ; D304   0168 0060 0370 00F0
        DECLE   $00F0,  $02F8,  $00F8,  $00FC   ; D308   00F0 02F8 00F8 00FC
        DECLE   $017C,  $007B,  $0031,  $0101   ; D30C   017C 007B 0031 0101
        DECLE   $0000,  $02C0,  $00DC,  $00BE   ; D310   0000 02C0 00DC 00BE
        DECLE   $019E,  $001F                   ; D314   019E 001F

        SUB@    R1,     R7                      ; D316   030F
        SUBR    R1,     R7                      ; D317   010F
L_D318:
        INCR    R7                              ; D318   000F
        INCR    R7                              ; D319   000F

L_D31A:
        SETC                                    ; D31A   0007
L_D31B:
        DECR    R6                              ; D31B   0016
        DECLE   $0306,  $0304,  $0300,  $0300   ; D31C   0306 0304 0300 0300
        DECLE   $0000,  $0000,  $0000           ; D320   0000 0000 0000

        SUBR    R3,     R7                      ; D323   011F

        CMP@    R6,     R5                      ; D324   0375
        SLLC    R3,     2                       ; D325   005F
        CMP@    R4,     R0                      ; D326   0360
        ANDR    R0,     R0                      ; D327   0180
        CLRR    R3                              ; D328   01DB
        CLRR    R0                              ; D329   01C0
        ADDR    R0,     R0                      ; D32A   00C0
L_D32B:
        CMP     G_0140, R0                      ; D32B   0340 0140
        DECLE   $0100,  $0100,  $0100,  $0100   ; D32D   0100 0100 0100 0100
        DECLE   $0100,  $0000                   ; D331   0100 0000

        RRC     R3,     2                       ; D333   0077
        SUBR    R5,     R5                      ; D334   012D
        SARC    R3,     2                       ; D335   007F
        SUBR    R3,     R4                      ; D336   011C
        SUBR    R3,     R6                      ; D337   011E
        SUBR    R6,     R6                      ; D338   0136
        SUBR    R6,     R2                      ; D339   0132
        GSWD    R3                              ; D33A   0033
        BPL     L_D31B                          ; D33B   0223 0021
L_D33D:
        BC      L_D33D                          ; D33D   0221 0001

        DECLE   $0000,  $0100,  $0100,  $0000   ; D33F   0000 0100 0100 0000
        DECLE   $001F,  $013A,  $016F,  $0078   ; D343   001F 013A 016F 0078
        DECLE   $0280,  $01C2,  $00C0,  $03C0   ; D347   0280 01C2 00C0 03C0
        DECLE   $0360,  $0060,  $0060,  $0020   ; D34B   0360 0060 0060 0020
        DECLE   $0000                           ; D34F   0000

        SUB     G_0300, R0                      ; D350   0300 0300
        SUB     .BTAB.60,R0                     ; D352   0300 0260
        SAR     R0,     1                       ; D354   0068
        SLR     R0,     1                       ; D355   0060
        CMPR    R4,     R0                      ; D356   0160
        CMP@    R6,     R0                      ; D357   0370
        CMP@    R6,     R0                      ; D358   0370
        SUBR    R6,     R0                      ; D359   0130
        SUB@    R6,     R0                      ; D35A   0330
        SUBR    R6,     R0                      ; D35B   0130
        SUBR    R7,     R0                      ; D35C   0138
        SUBR    R1,     R6                      ; D35D   010E
        SUBR    R0,     R6                      ; D35E   0106
        SUB     .STIC.X.0,R3                    ; D35F   0303 0000
        B       L_D363                          ; D361   0200 0000

L_D363:
        GSWD    R0                              ; D363   0030
        DECLE   $017C,  $01CC,  $00CC,  $028C   ; D364   017C 01CC 00CC 028C
        DECLE   $000E,  $0206,  $0006,  $0016   ; D368   000E 0206 0006 0016
        DECLE   $0106,  $0000                   ; D36C   0106 0000

        SUBR    R0,     R0                      ; D36E   0100
L_D36F:
        SUBR    R0,     R0                      ; D36F   0100
        DECLE   $000C,  $0236                   ; D370   000C 0236

        RSWD    R3                              ; D372   003B
L_D373:
        SARC    R1,     2                       ; D373   007D
        DECLE   $017D,  $0170,  $00E0,  $03C0   ; D374   017D 0170 00E0 03C0
        DECLE   $00CA,  $0240,  $0000,  $0061   ; D378   00CA 0240 0000 0061
        DECLE   $0100,  $0161,  $0100,  $0061   ; D37C   0100 0161 0100 0061
        DECLE   $0014,  $023E,  $0036           ; D380   0014 023E 0036

        SARC    R3,     2                       ; D383   007F
        CMPR    R6,     R7                      ; D384   0177
        SARC    R3,     2                       ; D385   007F
        CMP@    R6,     R7                      ; D386   0377
        SARC    R3,     2                       ; D387   007F
        RRC     R3,     2                       ; D388   0077
        PSHR    R7                              ; D389   0277
        NEGR    R2                              ; D38A   0022
        SLR     R3,     1                       ; D38B   0063
        SUBR    R0,     R0                      ; D38C   0100
        ADDR    R0,     R3                      ; D38D   00C3
        B       L_D553                          ; D38E   0200 01C3

        DECLE   $001C,  $023E                   ; D390   001C 023E

        RSWD    R6                              ; D392   003E
L_D393:
        SARC    R3,     2                       ; D393   007F
        DECLE   $017D,  $0078,  $0370,  $0270   ; D394   017D 0078 0370 0270
        DECLE   $0072,  $0260,  $0000,  $0060   ; D398   0072 0260 0000 0060
        DECLE   $0100,  $0060,  $0100,  $0330   ; D39C   0100 0060 0100 0330
        DECLE   $0000,  $0000,  $0000           ; D3A0   0000 0000 0000

        SLR     R0,     1                       ; D3A3   0060
        CMP@    R5,     R0                      ; D3A4   0368
        XOR     G_03C0, R0                      ; D3A5   03C0 03C0
        XOR     .UART.0,R0                      ; D3A7   03C0 00E0
        ADDR    R4,     R0                      ; D3A9   00E0
        XORR    R6,     R0                      ; D3AA   01F0
L_D3AB:
        XORR    R7,     R4                      ; D3AB   01FC
        DECLE   $0378,  $0036,  $0200,  $0303   ; D3AC   0378 0036 0200 0303
        DECLE   $0100,  $0000,  $0000           ; D3B0   0100 0000 0000

        SUBI    #$013E, R4                      ; D3B3   033C 013E
        SARC    R3,     2                       ; D3B5   007F
        CMP@    R6,     R7                      ; D3B6   0377
        CMP@    R4,     R7                      ; D3B7   0367
        SUBR    R0,     R3                      ; D3B8   0103
        XORR    R0,     R3                      ; D3B9   01C3
        DIS                                     ; D3BA   0003
        ADDR    R2,     R6                      ; D3BB   00D6
        SUBR    R0,     R6                      ; D3BC   0106
        CLRR    R0                              ; D3BD   01C0
        B       L_D4C0                          ; D3BE   0200 0100

        SUBR    R0,     R0                      ; D3C0   0100
L_D3C1:
        SUBR    R0,     R0                      ; D3C1   0100
        DECLE   $0000                           ; D3C2   0000

        B       L_D4D3                          ; D3C3   0200 010E

        CLRC                                    ; D3C5   0006
        B       L_D4C8                          ; D3C6   0200 0100

        DECLE   $0100,  $0000,  $0100,  $031B   ; D3C8   0100 0000 0100 031B
        DECLE   $011B,  $000A,  $020A,  $001B   ; D3CC   011B 000A 020A 001B
        DECLE   $0100,  $0100,  $0100,  $0000   ; D3D0   0100 0100 0100 0000
        DECLE   $0000                           ; D3D4   0000

        B       L_D3DB                          ; D3D5   0200 0004

        CLRC                                    ; D3D7   0006
        NEGR    R6                              ; D3D8   0026
        CMP@    R4,     R0                      ; D3D9   0360
        ADDR    R4,     R0                      ; D3DA   00E0
L_D3DB:
        ANDR    R0,     R0                      ; D3DB   0180
        DECLE   $0090,  $0338,  $0220,  $0120   ; D3DC   0090 0338 0220 0120
        DECLE   $0000,  $0300,  $0200,  $0000   ; D3E0   0000 0300 0200 0000
        DECLE   $0000,  $0300,  $0200,  $0040   ; D3E4   0000 0300 0200 0040
        DECLE   $0049,  $0066,  $0049,  $000F   ; D3E8   0049 0066 0049 000F
        DECLE   $0307,  $0300,  $0300,  $0300   ; D3EC   0307 0300 0300 0300
        DECLE   $0000,  $0000,  $0000,  $0300   ; D3F0   0000 0000 0000 0300
        DECLE   $0000,  $001C,  $0104,  $0000   ; D3F4   0000 001C 0104 0000

        SUBR    R0,     R0                      ; D3F8   0100
        SUBR    R0,     R0                      ; D3F9   0100
        SUBR    R0,     R0                      ; D3FA   0100
        COMR    R0                              ; D3FB   0018
L_D3FC:
        SUBR    R3,     R0                      ; D3FC   0118
        DECLE   $0218,  $0314,  $0318,  $0000   ; D3FD   0218 0314 0318 0000
        DECLE   $0200,  $0000,  $0000,  $0100   ; D401   0200 0000 0000 0100
        DECLE   $001C,  $0304,  $0100,  $0100   ; D405   001C 0304 0100 0100
        DECLE   $0300,  $0204,  $0124,  $0076   ; D409   0300 0204 0124 0076
        DECLE   $0240,  $0040,  $0000,  $0100   ; D40D   0240 0040 0000 0100
        DECLE   $0000,  $0100,  $0200           ; D411   0000 0100 0200

        SUBR    R2,     R0                      ; D414   0110
        BNEQ    L_D41B                          ; D415   020C 0004

        SUBR    R0,     R0                      ; D417   0100
        SUBR    R0,     R0                      ; D418   0100
        B       L_D71B                          ; D419   0200 0300

L_D41B:
        CMPR    R4,     R0                      ; D41B   0160
        CMPR    R0,     R6                      ; D41C   0146
        MVO     R4,     .BTAB.04                ; D41D   0244 0204
        SUBR    R0,     R6                      ; D41F   0106
        SUBR    R0,     R0                      ; D420   0100
        B       L_D723                          ; D421   0200 0300

        DECLE   $0000,  $0100,  $031C,  $0204   ; D423   0000 0100 031C 0204
        DECLE   $0100,  $0000,  $0000,  $0000   ; D427   0100 0000 0000 0000
        DECLE   $0030,  $032C,  $0338,  $0308   ; D42B   0030 032C 0338 0308
        DECLE   $010C,  $0000                   ; D42F   010C 0000

        SUBR    R0,     R0                      ; D431   0100
        B       L_D534                          ; D432   0200 0100

        DECLE   $0102,  $0103,  $0103,  $0361   ; D434   0102 0103 0103 0361
        DECLE   $01E1,  $02A0,  $0284,  $010C   ; D438   01E1 02A0 0284 010C
        DECLE   $0108,  $0308,  $0100,  $0000   ; D43C   0108 0308 0100 0000

        SUBR    R0,     R0                      ; D440   0100
        B       L_D643                          ; D441   0200 0200

        DECLE   $0000,  $0000,  $021C,  $0004   ; D443   0000 0000 021C 0004
        DECLE   $0000,  $0100,  $0000           ; D447   0000 0100 0000

        SUB     .STIC.X.0,R0                    ; D44A   0300 0000
        CMPR    R4,     R3                      ; D44C   0163
        MVO     R2,     G_0362                  ; D44D   0242 0362
        SUB     .ISRVEC.0,R3                    ; D44F   0303 0100
        SUB     .ISRVEC.0,R0                    ; D451   0300 0100
        B       L_D56D                          ; D453   0200 0118

        DECLE   $0230,  $0110,  $0100,  $0000   ; D455   0230 0110 0100 0000

        SUB     .BTAB.02,R6                     ; D459   0306 0202
        BOV     L_D4BD                          ; D45B   0202 0060

        SWAP    R0,     1                       ; D45D   0040
        SWAP    R0,     1                       ; D45E   0040
L_D45F:
        SLR     R0,     1                       ; D45F   0060
        DECLE   $0300,  $0300,  $0300,  $0200   ; D460   0300 0300 0300 0200
        DECLE   $0000                           ; D464   0000

        RSWD    R0                              ; D465   0038
        GSWD    R0                              ; D466   0030
        SUBR    R0,     R0                      ; D467   0100
        SUBR    R4,     R0                      ; D468   0120
        SUB@    R4,     R0                      ; D469   0320
        B       L_D16B                          ; D46A   0220 0300

        DECLE   $0118,  $0110,  $0010,  $0218   ; D46C   0118 0110 0010 0218

        SUBR    R0,     R0                      ; D470   0100
        B       L_D773                          ; D471   0200 0300

        SUB     .ISRVEC.0,R0                    ; D473   0300 0100
        SUB@    R1,     R0                      ; D475   0308
        SUBR    R1,     R6                      ; D476   010E
        SUB     .ISRVEC.0,R2                    ; D477   0302 0100
        B       L_D57B                          ; D479   0200 0100

        DECLE   $0000,  $0100,  $0312,  $0212   ; D47B   0000 0100 0312 0212
        DECLE   $011B,  $0000,  $0000,  $0000   ; D47F   011B 0000 0000 0000
        DECLE   $0000,  $0300,  $0300,  $0302   ; D483   0000 0300 0300 0302
        DECLE   $0112,  $0272,  $00F2,  $0380   ; D487   0112 0272 00F2 0380
        DECLE   $0290,  $0170,  $01F0,  $0080   ; D48B   0290 0170 01F0 0080
        DECLE   $0280,  $0100,  $0300,  $0100   ; D48F   0280 0100 0300 0100
        DECLE   $0100,  $0100,  $0338,  $0008   ; D493   0100 0100 0338 0008
        DECLE   $0300,  $0100,  $0300,  $0000   ; D497   0300 0100 0300 0000
        DECLE   $032C,  $0134,  $0224,  $0126   ; D49B   032C 0134 0224 0126
        DECLE   $0130,  $0100,  $0200,  $0300   ; D49F   0130 0100 0200 0300
        DECLE   $0000,  $0100,  $0238,  $0308   ; D4A3   0000 0100 0238 0308
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4A7   0000 0000 0000 0000
        DECLE   $0006,  $0326,  $0362,  $0343   ; D4AB   0006 0326 0362 0343
        DECLE   $0260,  $0000,  $0000,  $0000   ; D4AF   0260 0000 0000 0000
        DECLE   $0202,  $0206,  $0006,  $0106   ; D4B3   0202 0206 0006 0106
        DECLE   $0000                           ; D4B7   0000

        SUBR    R7,     R0                      ; D4B8   0138
        RRC     R0,     1                       ; D4B9   0070
        MVO@    R0,     R1                      ; D4BA   0248
        SUBI    #$0178, R0                      ; D4BB   0338 0178
L_D4BD:
        MVO     R0,     .BTAB.00                ; D4BD   0240 0200
        SUBR    R0,     R0                      ; D4BF   0100
L_D4C0:
        SUBR    R0,     R0                      ; D4C0   0100
        B       L_D7C3                          ; D4C1   0200 0300

        DECLE   $0000                           ; D4C3   0000

        SUBR    R0,     R0                      ; D4C4   0100
        B       L_D7C7                          ; D4C5   0200 0300

        RRC     R0,     1                       ; D4C7   0070
L_D4C8:
        CMPR    R7,     R0                      ; D4C8   0178
        DECLE   $0258,  $0110,  $0100,  $01E0   ; D4C9   0258 0110 0100 01E0
        DECLE   $03E0,  $0080,  $0280,  $0000   ; D4CD   03E0 0080 0280 0000
        DECLE   $0000,  $0000                   ; D4D1   0000 0000
L_D4D3:
        COMR    R0                              ; D4D3   0018
        SUB@    R3,     R4                      ; D4D4   031C
        SUB@    R3,     R4                      ; D4D5   031C
        SUB@    R2,     R0                      ; D4D6   0310
        SUBR    R0,     R0                      ; D4D7   0100
        B       L_D5DA                          ; D4D8   0200 0100
        B       L_D614                          ; D4DA   0200 0138

        SUBR    R6,     R6                      ; D4DC   0136
        NEGR    R4                              ; D4DD   0024
        BEQ     L_D1D9                          ; D4DE   0224 0306

        SUBR    R0,     R0                      ; D4E0   0100
        SUB     .BTAB.00,R0                     ; D4E1   0300 0200
        SUBR    R0,     R0                      ; D4E3   0100
        SUBR    R0,     R0                      ; D4E4   0100
        MVO     R0,     G_0340                  ; D4E5   0240 0340
        ADDR    R1,     R0                      ; D4E7   00C8
        ANDR    R1,     R5                      ; D4E8   018D
        BUSC    L_D5ED                          ; D4E9   0207 0102

        SUBR    R1,     R1                      ; D4EB   0109
        INCR    R7                              ; D4EC   000F

        CLRC                                    ; D4ED   0006
L_D4EE:
        EIS                                     ; D4EE   0002
        DECLE   $0000,  $0300,  $0300,  $0300   ; D4EF   0000 0300 0300 0300
        DECLE   $0200,  $0000                   ; D4F3   0200 0000

        SWAP    R0,     1                       ; D4F5   0040
        CMPR    R1,     R0                      ; D4F6   0148
        ADD@    R1,     R5                      ; D4F7   02CD
        MVI     G_0302, R7                      ; D4F8   0287 0302

        DECLE   $0100,  $0200                   ; D4FA   0100 0200

        SUBR    R1,     R1                      ; D4FC   0109
        BESC    L_D505                          ; D4FD   020F 0006

        SUBR    R0,     R2                      ; D4FF   0102
L_D500:
        SUBR    R0,     R0                      ; D500   0100
        B       L_D803                          ; D501   0200 0300
        B       L_D605                          ; D503   0200 0100
L_D505:
        B       L_D607                          ; D505   0200 0100

        RRC     R0,     1                       ; D507   0070
        SLR     R0,     1                       ; D508   0060
        B       L_D50B                          ; D509   0200 0000

L_D50B:
        CLRC                                    ; D50B   0006
        SUBR    R0,     R2                      ; D50C   0102
        SUB@    R3,     R3                      ; D50D   031B
        SUBR    R1,     R0                      ; D50E   0108
        INCR    R4                              ; D50F   000C
        SUBR    R0,     R0                      ; D510   0100
        B       L_D713                          ; D511   0200 0200

        DECLE   $0000,  $0100,  $021C           ; D513   0000 0100 021C

        SUBR    R0,     R4                      ; D516   0104
        SUBR    R0,     R0                      ; D517   0100
        SUBR    R0,     R0                      ; D518   0100
        B       L_D71B                          ; D519   0200 0200

        DECLE   $0100,  $0134,  $0334,  $0026   ; D51B   0100 0134 0334 0026
        DECLE   $0230,  $0000,  $0200,  $0000   ; D51F   0230 0000 0200 0000
        DECLE   $0000,  $0100,  $021C           ; D523   0000 0100 021C

        SUB     .ISRVEC.0,R4                    ; D526   0304 0100
        SUBR    R0,     R0                      ; D528   0100
        B       L_D5A3                          ; D529   0200 0078

        CMPR    R2,     R0                      ; D52B   0150
        CMPR    R3,     R0                      ; D52C   0158
        MVO@    R0,     R4                      ; D52D   0260
        SUB     .BTAB.00,R0                     ; D52E   0300 0200
        SUBR    R0,     R0                      ; D530   0100
        B       L_D533                          ; D531   0200 0000

L_D533:
        SUBR    R0,     R0                      ; D533   0100
L_D534:
        SUBR    R0,     R0                      ; D534   0100
        DECLE   $0200,  $0100,  $03C0,  $01C0   ; D535   0200 0100 03C0 01C0
        DECLE   $0240,  $0100,  $0106,  $0146   ; D539   0240 0100 0106 0146
        DECLE   $03C3,  $0040,  $0240,  $0000   ; D53D   03C3 0040 0240 0000
        DECLE   $0001,  $0001                   ; D541   0001 0001

        DIS                                     ; D543   0003
        SUB     G_0306, R7                      ; D544   0307 0306

        DECLE   $0302,  $01C0,  $03C0,  $0040   ; D546   0302 01C0 03C0 0040
        DECLE   $0300,  $0038,  $0138,  $0008   ; D54A   0300 0038 0138 0008
        DECLE   $0308,  $0000                   ; D54E   0308 0000

        SUBR    R0,     R0                      ; D550   0100
        B       L_D853                          ; D551   0200 0300

L_D553:
        SUB     .ISRVEC.0,R0                    ; D553   0300 0100
        SUB     G_01E0, R0                      ; D555   0300 01E0
        MVO     R0,     .ISRVEC.0               ; D557   0240 0100
        B       L_D65B                          ; D559   0200 0100

        DECLE   $0122,  $0166,  $0242,  $0342   ; D55B   0122 0166 0242 0342
        DECLE   $0000                           ; D55F   0000

        SUBR    R0,     R0                      ; D560   0100
        SUB     .BTAB.00,R0                     ; D561   0300 0200
        SUBR    R0,     R0                      ; D563   0100
        CLRC                                    ; D564   0006
        BPL     L_D647                          ; D565   0203 00E0

L_D567:
        SWAP    R0,     1                       ; D567   0040
        DECLE   $0100,  $0000                   ; D568   0100 0000

        SUB@    R4,     R0                      ; D56A   0320
        RRC     R0,     1                       ; D56B   0070
        SUBR    R0,     R0                      ; D56C   0100
L_D56D:
        B       L_D76F                          ; D56D   0200 0200

        SUBR    R0,     R0                      ; D56F   0100
        SUBR    R0,     R0                      ; D570   0100
        B       L_D873                          ; D571   0200 0300
        B       L_D675                          ; D573   0200 0100

        DECLE   $0238,  $0110,  $0000           ; D575   0238 0110 0000

        SUBR    R0,     R0                      ; D578   0100
        B       L_D59B                          ; D579   0200 0020

L_D57B:
        CMPR    R4,     R6                      ; D57B   0166
        DECLE   $0066,  $0042,  $00C3,  $0000   ; D57C   0066 0042 00C3 0000
        DECLE   $0300,  $0300,  $0300,  $0300   ; D580   0300 0300 0300 0300
        DECLE   $0000,  $0000                   ; D584   0000 0000

        SUBR    R0,     R0                      ; D586   0100
        SUBR    R0,     R0                      ; D587   0100
        COMR    R4                              ; D588   001C
        SUB@    R3,     R0                      ; D589   0318
        SUB     .ISRVEC.0,R0                    ; D58A   0300 0100
        SUBR    R0,     R0                      ; D58C   0100
        SLR     R0,     1                       ; D58D   0060
        CMP     G_00C3, R6                      ; D58E   0346 00C3
        SUBR    R0,     R0                      ; D590   0100
        B       L_D693                          ; D591   0200 0100

        SUBR    R0,     R0                      ; D593   0100
        SUBR    R0,     R0                      ; D594   0100
        ADD@    R4,     R0                      ; D595   02E0
        CLRR    R0                              ; D596   01C0
        B       L_D699                          ; D597   0200 0100

        SUB     .ISRVEC.0,R0                    ; D599   0300 0100
L_D59B:
        ADDR    R2,     R0                      ; D59B   00D0
        DECLE   $00D0,  $0298,  $0080,  $00C0   ; D59C   00D0 0298 0080 00C0
        DECLE   $0100,  $0000,  $0000           ; D5A0   0100 0000 0000
L_D5A3:
        SUB     .ISRVEC.0,R0                    ; D5A3   0300 0100
        DECLE   $021C                           ; D5A5   021C

        SUB@    R1,     R0                      ; D5A6   0308
        SUB     .ISRVEC.0,R0                    ; D5A7   0300 0100
        B       L_D8AB                          ; D5A9   0200 0300
        B       L_D719                          ; D5AB   0200 016C

        DECLE   $0364,  $0146,  $00C0,  $0100   ; D5AD   0364 0146 00C0 0100
        DECLE   $0300,  $0000,  $0200           ; D5B1   0300 0000 0200

        SUBR    R0,     R0                      ; D5B4   0100
        MVI     G_03E0, R0                      ; D5B5   0280 03E0
        XOR     .ISRVEC.0,R0                    ; D5B7   03C0 0100
        B       L_D8BB                          ; D5B9   0200 0300

        DECLE   $0018,  $0110,  $0230           ; D5BB   0018 0110 0230

        SUB@    R5,     R0                      ; D5BE   0328
        GSWD    R0                              ; D5BF   0030
        SUBR    R0,     R0                      ; D5C0   0100
        B       L_D6C3                          ; D5C1   0200 0100

        SUBR    R0,     R0                      ; D5C3   0100
        SUBR    R0,     R0                      ; D5C4   0100
        CMP@    R6,     R0                      ; D5C5   0370
        SLR     R0,     1                       ; D5C6   0060
        B       L_D5C9                          ; D5C7   0200 0000

L_D5C9:
        SUB@    R1,     R0                      ; D5C9   0308
        DECLE   $0208,  $02C8,  $00C4,  $0080   ; D5CA   0208 02C8 00C4 0080
        DECLE   $0080,  $00C0,  $0300,  $0300   ; D5CE   0080 00C0 0300 0300
        DECLE   $0300,  $0200,  $00E0,  $00C8   ; D5D2   0300 0200 00E0 00C8
        DECLE   $0004                           ; D5D6   0004

        SUBR    R0,     R0                      ; D5D7   0100
        B       L_D7F2                          ; D5D8   0200 0218

L_D5DA:
        COMR    R0                              ; D5DA   0018
        SUBR    R3,     R0                      ; D5DB   0118
        SUBR    R2,     R0                      ; D5DC   0110
        SUBR    R2,     R0                      ; D5DD   0110
        COMR    R0                              ; D5DE   0018
        B       L_D6E1                          ; D5DF   0200 0100

        DECLE   $0200,  $0200                   ; D5E1   0200 0200

        SUBR    R0,     R0                      ; D5E3   0100
        SUBR    R0,     R0                      ; D5E4   0100
        B       L_D6E7                          ; D5E5   0200 0100

        CMP@    R6,     R0                      ; D5E7   0370
        CMPR    R0,     R0                      ; D5E8   0140
        B       L_D7F1                          ; D5E9   0200 0206

        RRC     R0,     2                       ; D5EB   0074
        XORR    R5,     R4                      ; D5EC   01EC
L_D5ED:
        XOR@    R1,     R0                      ; D5ED   03C8
        DECLE   $0188,  $0080,  $0000,  $0200   ; D5EE   0188 0080 0000 0200
        DECLE   $0000,  $0000,  $0100,  $0000   ; D5F2   0000 0000 0100 0000
        DECLE   $0000,  $0300,  $0114,  $02F4   ; D5F6   0000 0300 0114 02F4
        DECLE   $03F6,  $0380,  $01BE,  $023C   ; D5FA   03F6 0380 01BE 023C

        SUB@    R4,     R0                      ; D5FE   0320
        B       L_D500                          ; D5FF   0220 0100

        DECLE   $0300,  $0100,  $0000           ; D601   0300 0100 0000

        SUBR    R0,     R0                      ; D604   0100
L_D605:
        SUB     .STIC.X.0,R0                    ; D605   0300 0000
L_D607:
        B       L_D709                          ; D607   0200 0100
        B       L_D90C                          ; D609   0200 0301
        SUB     G_0137, R7                      ; D60B   0307 0137

        DECLE   $0218                           ; D60D   0218

        SUB@    R3,     R4                      ; D60E   031C
        INCR    R6                              ; D60F   000E
        SUBR    R0,     R0                      ; D610   0100
        B       L_D913                          ; D611   0200 0300

        DECLE   $0000                           ; D613   0000
L_D614:
        SUBR    R0,     R0                      ; D614   0100
        DECLE   $0238                           ; D615   0238

        SUBR    R6,     R0                      ; D616   0130
        SUBR    R0,     R0                      ; D617   0100
        SUBR    R0,     R0                      ; D618   0100
        SUB     .STIC.X.0,R0                    ; D619   0300 0000
        B       L_D6F5                          ; D61B   0200 00D8

        DECLE   $03D8,  $0288,  $028C,  $0000   ; D61D   03D8 0288 028C 0000
        DECLE   $0000,  $0000,  $0000,  $0300   ; D621   0000 0000 0000 0300
        DECLE   $0300,  $0300,  $0200,  $0000   ; D625   0300 0300 0200 0000
        DECLE   $0000,  $0000,  $0300,  $0100   ; D629   0000 0000 0300 0100
        DECLE   $0100,  $0000,  $0300,  $0040   ; D62D   0100 0000 0300 0040
        DECLE   $0340,  $0060,  $0160,  $0030   ; D631   0340 0060 0160 0030
        DECLE   $0230,  $0000,  $0000,  $0000   ; D635   0230 0000 0000 0000
        DECLE   $0200,  $0040,  $0070,  $0100   ; D639   0200 0040 0070 0100
        DECLE   $0000                           ; D63D   0000

        B       L_D640                          ; D63E   0200 0000

L_D640:
        SUBR    R0,     R0                      ; D640   0100
        SUB     .ISRVEC.0,R0                    ; D641   0300 0100
L_D643:
        SUBR    R0,     R0                      ; D643   0100
        SUBR    R0,     R0                      ; D644   0100
        ADD     G_03F0, R0                      ; D645   02C0 03F0
L_D647:
        ANDR    R6,     R4                      ; D647   01B4
        SUBR    R2,     R6                      ; D648   0116
        BOV     L_D64B                          ; D649   0202 0000

L_D64B:
        CMPR    R6,     R0                      ; D64B   0170
        DECLE   $01F0,  $0280,  $0380,  $0200   ; D64C   01F0 0280 0380 0200
        DECLE   $0000,  $0000,  $0000,  $0000   ; D650   0000 0000 0000 0000

        SUB     G_0338, R0                      ; D654   0300 0338
        SUB@    R1,     R0                      ; D656   0308
        SUBR    R0,     R0                      ; D657   0100
        SUBR    R0,     R0                      ; D658   0100
        B       L_D75B                          ; D659   0200 0100

L_D65B:
        CMP@    R3,     R0                      ; D65B   0358
        DECLE   $0058,  $03D8,  $0088,  $028C   ; D65C   0058 03D8 0088 028C
        DECLE   $0000,  $0200,  $0000,  $0000   ; D660   0000 0200 0000 0000
        DECLE   $0000                           ; D664   0000

        B       L_D667                          ; D665   0200 0000

L_D667:
        RRC     R0,     1                       ; D667   0070
        DECLE   $0160,  $0000,  $0000,  $0318   ; D668   0160 0000 0000 0318
        DECLE   $0118,  $0218                   ; D66C   0118 0218

        SUB@    R1,     R0                      ; D66E   0308
        SUB@    R1,     R4                      ; D66F   030C
        SUBR    R0,     R0                      ; D670   0100
        B       L_D973                          ; D671   0200 0300

        SUBR    R0,     R0                      ; D673   0100
        SUBR    R0,     R0                      ; D674   0100
L_D675:
        SUB     .STIC.X.0,R0                    ; D675   0300 0000
        DECLE   $0000                           ; D677   0000

        SUBR    R0,     R0                      ; D678   0100
        SUB     .ISRVEC.0,R0                    ; D679   0300 0100
        SUBR    R0,     R0                      ; D67B   0100
        SUBR    R0,     R0                      ; D67C   0100
        CMP@    R6,     R1                      ; D67D   0371
        CMPR    R4,     R5                      ; D67E   0165
        SETC                                    ; D67F   0007
        SUBR    R0,     R0                      ; D680   0100
        B       L_D783                          ; D681   0200 0100

        DECLE   $0100,  $0100,  $030E,  $0004   ; D683   0100 0100 030E 0004
        DECLE   $0200,  $0000,  $0000,  $0000   ; D687   0200 0000 0000 0000
        DECLE   $0004                           ; D68B   0004

        SUB@    R6,     R6                      ; D68C   0336
        SUB@    R2,     R2                      ; D68D   0312
        SUB@    R2,     R6                      ; D68E   0316
        SUBR    R6,     R0                      ; D68F   0130
        B       L_D992                          ; D690   0200 0300

        SUBR    R0,     R0                      ; D692   0100
L_D693:
        SUB     .STIC.X.0,R0                    ; D693   0300 0000
        SUB     .STIC.X.0,R0                    ; D695   0300 0000
        SUBR    R3,     R4                      ; D697   011C
        INCR    R0                              ; D698   0008
L_D699:
        B       L_D69B                          ; D699   0200 0000

L_D69B:
        NEGR    R2                              ; D69B   0022
        DECLE   $0032,  $0203,  $0000,  $0000   ; D69C   0032 0203 0000 0000

        SUBR    R0,     R4                      ; D6A0   0104
        ADCR    R0                              ; D6A1   0028
        SKIP                                    ; D6A2   0208
        SAR     R0,     1                       ; D6A3   0068
        SUBR    R0,     R0                      ; D6A4   0100
        SUB@    R2,     R0                      ; D6A5   0310
        SUBR    R7,     R0                      ; D6A6   0138
        SUBR    R0,     R0                      ; D6A7   0100
        SUBR    R0,     R0                      ; D6A8   0100
        B       L_D9AB                          ; D6A9   0200 0300

        SUBR    R0,     R0                      ; D6AB   0100
        SUBR    R0,     R0                      ; D6AC   0100
        B       L_D6AF                          ; D6AD   0200 0000

L_D6AF:
        SUBR    R0,     R0                      ; D6AF   0100
        DECLE   $014D,  $020C,  $034D,  $027F   ; D6B0   014D 020C 034D 027F
        DECLE   $007F,  $003F,  $001E,  $001C   ; D6B4   007F 003F 001E 001C
        DECLE   $030C,  $0300,  $0300,  $0112   ; D6B8   030C 0300 0300 0112
        DECLE   $0336,  $0036                   ; D6BC   0336 0036

        BOV     L_D3AB                          ; D6BE   0222 0314

        INCR    R4                              ; D6C0   000C
        CMP@    R1,     R5                      ; D6C1   034D
        INCR    R4                              ; D6C2   000C
L_D6C3:
        MVO@    R5,     R3                      ; D6C3   025D
        DECLE   $007F,  $027F,  $003F           ; D6C4   007F 027F 003F

        COMR    R6                              ; D6C7   001E
        INCR    R4                              ; D6C8   000C
        B       L_D6CB                          ; D6C9   0200 0000

L_D6CB:
        DECR    R2                              ; D6CB   0012
        DECLE   $0136,  $0036,  $0022,  $0314   ; D6CC   0136 0036 0022 0314
        DECLE   $0199,  $0299,  $03DA,  $03FE   ; D6D0   0199 0299 03DA 03FE
        DECLE   $017C,  $023C                   ; D6D4   017C 023C

        SUBI    #$0138, R4                      ; D6D6   033C 0138
        SUBR    R7,     R0                      ; D6D8   0138
        CMP@    R6,     R0                      ; D6D9   0370
        RRC     R0,     1                       ; D6DA   0070
        ADDR    R6,     R0                      ; D6DB   00F0
        XORR    R6,     R0                      ; D6DC   01F0
        AND@    R6,     R0                      ; D6DD   03B0
        CMPR    R4,     R0                      ; D6DE   0160
        XORR    R4,     R0                      ; D6DF   01E0
        SUBR    R0,     R0                      ; D6E0   0100
L_D6E1:
        SUB     .ISRVEC.0,R0                    ; D6E1   0300 0100
        DECLE   $0000                           ; D6E3   0000

        SUBR    R0,     R0                      ; D6E4   0100
        B       L_D7E7                          ; D6E5   0200 0100

L_D6E7:
        SUBR    R0,     R0                      ; D6E7   0100
        SUBR    R0,     R0                      ; D6E8   0100
        SUB@    R3,     R4                      ; D6E9   031C
        ADDR    R3,     R7                      ; D6EA   00DF

        DECLE   $02F9,  $00FE,  $002F,  $0037   ; D6EB   02F9 00FE 002F 0037

        COMR    R0                              ; D6EF   0018
        SUB@    R6,     R0                      ; D6F0   0330
        SUB@    R6,     R0                      ; D6F1   0330
        CMP@    R6,     R0                      ; D6F2   0370
        XOR@    R4,     R0                      ; D6F3   03E0
        ADDR    R6,     R0                      ; D6F4   00F0
L_D6F5:
        ADDR    R6,     R0                      ; D6F5   00F0
        DECLE   $00B8,  $0370,  $0130,  $0330   ; D6F6   00B8 0370 0130 0330
        DECLE   $0228,  $0338,  $0010,  $0320   ; D6FA   0228 0338 0010 0320
        DECLE   $0030,  $0110,  $0030,  $0230   ; D6FE   0030 0110 0030 0230

        ADDR    R4,     R0                      ; D702   00E0
        ADDR    R6,     R0                      ; D703   00F0
        ADDR    R7,     R2                      ; D704   00FA
        MVII    #$0030, R4                      ; D705   02BC 0030
        MOVR    R6,     R0                      ; D707   00B0
        SUBR    R6,     R0                      ; D708   0130
L_D709:
        NEGR    R0                              ; D709   0020
        DECLE   $0368,  $036C,  $0124,  $0248   ; D70A   0368 036C 0124 0248
        DECLE   $0368,  $0240,  $0130,  $0230   ; D70E   0368 0240 0130 0230

        CMPR    R4,     R0                      ; D712   0160
L_D713:
        XORR    R6,     R0                      ; D713   01F0
        ADDR    R7,     R0                      ; D714   00F8
        MVII    #$0370, R0                      ; D715   02B8 0370
        SUBR    R6,     R0                      ; D717   0130
        SUBR    R6,     R0                      ; D718   0130
L_D719:
        RRC     R0,     1                       ; D719   0070
        CMP@    R5,     R0                      ; D71A   0368
L_D71B:
        SUB@    R5,     R4                      ; D71B   032C
        DECLE   $0144,  $0268,  $03CC,  $0288   ; D71C   0144 0268 03CC 0288
        DECLE   $0030,  $0230                   ; D720   0030 0230

        CMP@    R6,     R0                      ; D722   0370
L_D723:
        CMPR    R4,     R0                      ; D723   0160
        DECLE   $0170,  $0070,  $0330,  $0330   ; D724   0170 0070 0330 0330
        DECLE   $0130,  $0230,  $0368,  $0268   ; D728   0130 0230 0368 0268
        DECLE   $0118,  $0260,  $0158,  $0150   ; D72C   0118 0260 0158 0150
        DECLE   $0003,  $0003,  $001F           ; D730   0003 0003 001F

        RSWD    R6                              ; D733   003E
        SUB@    R5,     R7                      ; D734   032F
        SUB@    R4,     R7                      ; D735   0327
        SUB@    R2,     R7                      ; D736   0317
        SUBR    R0,     R7                      ; D737   0107

        DECLE   $020F,  $001E,  $031C,  $033C   ; D738   020F 001E 031C 033C
        DECLE   $00FE,  $0366,  $000E,  $021C   ; D73C   00FE 0366 000E 021C
        DECLE   $0030,  $0030,  $0030,  $0060   ; D740   0030 0030 0030 0060
        DECLE   $03F4,  $03FC,  $03B8,  $0350   ; D744   03F4 03FC 03B8 0350
        DECLE   $0030,  $0030,  $0028,  $0338   ; D748   0030 0030 0028 0338
        DECLE   $0110,  $0120,  $0130,  $0010   ; D74C   0110 0120 0130 0010
        DECLE   $0130,  $0030,  $0030,  $0260   ; D750   0130 0030 0030 0260
        DECLE   $01F4,  $02FC,  $01B8,  $0150   ; D754   01F4 02FC 01B8 0150
        DECLE   $0130,  $0230                   ; D758   0130 0230

        CMPR    R5,     R0                      ; D75A   0168
L_D75B:
        CMP@    R5,     R0                      ; D75B   0368
        DECLE   $0118,  $0260,  $0258,  $0150   ; D75C   0118 0260 0258 0150
        DECLE   $0118,  $0218,  $0339,  $027D   ; D760   0118 0218 0339 027D
        DECLE   $0178,  $0230,  $0300,  $0230   ; D764   0178 0230 0300 0230
        DECLE   $0130,  $0230                   ; D768   0130 0230

        CMPR    R5,     R0                      ; D76A   0168
        CMPR    R5,     R0                      ; D76B   0168
        CMPR    R3,     R0                      ; D76C   0158
        SUB@    R4,     R0                      ; D76D   0320
        SAR     R0,     1                       ; D76E   0068
L_D76F:
        MVO@    R4,     R1                      ; D76F   024C
        GSWD    R0                              ; D770   0030
        GSWD    R0                              ; D771   0030
        RRC     R0,     1                       ; D772   0070
L_D773:
        SARC    R0,     1                       ; D773   0078
        DECLE   $037C,  $037C,  $0334,  $0132   ; D774   037C 037C 0334 0132
        DECLE   $013C,  $023C,  $0238,  $0026   ; D778   013C 023C 0238 0026
        DECLE   $0164,  $0040,  $0020,  $0160   ; D77C   0164 0040 0020 0160
        DECLE   $0130,  $0230                   ; D780   0130 0230

        SUB@    R6,     R0                      ; D782   0330
L_D783:
        CMPR    R7,     R0                      ; D783   0178
        XORR    R7,     R0                      ; D784   01F8
        ADDI    #$00F8, R0                      ; D785   02F8 00F8
        CMPR    R7,     R0                      ; D787   0178
        SUBR    R6,     R0                      ; D788   0130
        SUB@    R6,     R0                      ; D789   0330
        SUBR    R6,     R0                      ; D78A   0130
        GSWD    R0                              ; D78B   0030
        SUBR    R2,     R0                      ; D78C   0110
        B       L_D89F                          ; D78D   0200 0110

        DECLE   $0130,  $0126,  $035E,  $017E   ; D78F   0130 0126 035E 017E
        DECLE   $013C,  $011C,  $0318,  $0038   ; D793   013C 011C 0318 0038
        DECLE   $023C,  $003E,  $001F,  $001B   ; D797   023C 003E 001F 001B
        DECLE   $000B,  $031B,  $0336,  $0324   ; D79B   000B 031B 0336 0324
        DECLE   $0100,  $0100,  $0300,  $0300   ; D79F   0100 0100 0300 0300
        DECLE   $0000,  $0100,  $0100,  $0000   ; D7A3   0000 0100 0100 0000
        DECLE   $0200,  $010E,  $027F,  $03FF   ; D7A7   0200 010E 027F 03FF
        DECLE   $03BF                           ; D7AB   03BF

        CMPR    R5,     R4                      ; D7AC   016C
        ADD@    R5,     R4                      ; D7AD   02EC
        XOR     G_0306, R5                      ; D7AE   03C5 0306
L_D7B0:
        SUBR    R6,     R0                      ; D7B0   0130
        DECLE   $0230,  $0279,  $037E,  $0178   ; D7B1   0230 0279 037E 0178
        DECLE   $027D                           ; D7B5   027D

        PSHR    R0                              ; D7B6   0270
        CMPR    R4,     R0                      ; D7B7   0160
        CMPR    R4,     R0                      ; D7B8   0160
        MVO@    R0,     R4                      ; D7B9   0260
        XORR    R2,     R0                      ; D7BA   01D0
        XORR    R2,     R0                      ; D7BB   01D0
        RLC     R0,     1                       ; D7BC   0050
        TSTR    R0                              ; D7BD   0080
        ADDR    R2,     R0                      ; D7BE   00D0
        RLC     R0,     1                       ; D7BF   0050
        SUB@    R6,     R0                      ; D7C0   0330
        SUB@    R6,     R0                      ; D7C1   0330
        SUB@    R6,     R0                      ; D7C2   0330
L_D7C3:
        CMPR    R7,     R0                      ; D7C3   0178
        ADDI    #$01F8, R5                      ; D7C4   02FD 01F8
        ADDR    R7,     R2                      ; D7C6   00FA
L_D7C7:
        SLR     R0,     1                       ; D7C7   0060
        DECLE   $0160,  $0160,  $01F0,  $02D8   ; D7C8   0160 0160 01F0 02D8
        DECLE   $0158,  $0290,  $01C8,  $0198   ; D7CC   0158 0290 01C8 0198
        DECLE   $0100,  $0300,  $0100,  $0000   ; D7D0   0100 0300 0100 0000
        DECLE   $0100,  $0238,  $017C,  $017E   ; D7D4   0100 0238 017C 017E
        DECLE   $017E,  $036F,  $00B7,  $0237   ; D7D8   017E 036F 00B7 0237
        DECLE   $0174,  $026C,  $0008,  $0104   ; D7DC   0174 026C 0008 0104
        DECLE   $0100,  $0200,  $0300,  $0200   ; D7E0   0100 0200 0300 0200
        DECLE   $0000                           ; D7E4   0000

        COMR    R6                              ; D7E5   001E
        RSWD    R6                              ; D7E6   003E
L_D7E7:
        SARC    R2,     2                       ; D7E7   007E
        DECLE   $0378,  $0368,  $036C,  $0162   ; D7E8   0378 0368 036C 0162
        DECLE   $0230,  $0218,  $0178,  $0000   ; D7EC   0230 0218 0178 0000

        SUBR    R0,     R6                      ; D7F0   0106
L_D7F1:
        SUBR    R1,     R6                      ; D7F1   010E
L_D7F2:
        COMR    R6                              ; D7F2   001E
        DECLE   $001C,  $013E,  $033E,  $007E   ; D7F3   001C 013E 033E 007E
        DECLE   $0275,  $0166,  $0260,  $0370   ; D7F7   0275 0166 0260 0370
        DECLE   $0330,  $0118,  $0228,  $0150   ; D7FB   0330 0118 0228 0150
        DECLE   $0218                           ; D7FF   0218

        SUBR    R0,     R0                      ; D800   0100
        B       L_D903                          ; D801   0200 0100

L_D803:
        SUBR    R0,     R0                      ; D803   0100
        DECLE   $011C,  $033A,  $00F0,  $03F0   ; D804   011C 033A 00F0 03F0
        DECLE   $01F8,  $033E,  $007F,  $036D   ; D808   01F8 033E 007F 036D
        DECLE   $016E,  $0237,  $0203,  $0101   ; D80C   016E 0237 0203 0101

        SUBR    R0,     R0                      ; D810   0100
        B       L_DB73                          ; D811   0200 0360

        DECLE   $03B0,  $0130,  $0230,  $03F0   ; D813   03B0 0130 0230 03F0
        DECLE   $02F8,  $01FE,  $023F,  $00BD   ; D817   02F8 01FE 023F 00BD
        DECLE   $016C,  $016E,  $0206,  $0303   ; D81B   016C 016E 0206 0303
        DECLE   $0001,  $0000,  $0030,  $0030   ; D81F   0001 0000 0030 0030
        DECLE   $0030,  $0360,  $03F0,  $03F8   ; D823   0030 0360 03F0 03F8
        DECLE   $01B8,  $02B8,  $0358,  $021E   ; D827   01B8 02B8 0358 021E
        DECLE   $0016,  $0109,  $011B,  $001C   ; D82B   0016 0109 011B 001C
        DECLE   $030C,  $0130,  $0331,  $013F   ; D82F   030C 0130 0331 013F
        DECLE   $017C,  $01F8,  $03F0,  $00B0   ; D833   017C 01F8 03F0 00B0
        DECLE   $0070,  $0130,  $0230,  $0120   ; D837   0070 0130 0230 0120
        DECLE   $0170,  $0110,  $0360,  $0070   ; D83B   0170 0110 0360 0070
        DECLE   $0250,  $0031,  $023F           ; D83F   0250 0031 023F

        RSWD    R4                              ; D842   003C
        SARC    R0,     1                       ; D843   0078
        CMPR    R6,     R0                      ; D844   0170
        CMPR    R6,     R0                      ; D845   0170
        RLC     R0,     1                       ; D846   0050
        GSWD    R0                              ; D847   0030
        SUBR    R6,     R0                      ; D848   0130
        SUB@    R6,     R0                      ; D849   0330
        NEGR    R0                              ; D84A   0020
        PSHR    R0                              ; D84B   0270
        SUBR    R2,     R0                      ; D84C   0110
        MVO@    R0,     R4                      ; D84D   0260
        CMP@    R6,     R0                      ; D84E   0370
        CMP@    R2,     R0                      ; D84F   0350
        COMR    R1                              ; D850   0019
        COMR    R2                              ; D851   001A
        COMR    R6                              ; D852   001E
L_D853:
        RSWD    R6                              ; D853   003E
        SUBI    #$0378, R4                      ; D854   033C 0378
        CMP@    R3,     R0                      ; D856   0358
        AND@    R3,     R0                      ; D857   0398
        COMR    R0                              ; D858   0018
        COMR    R0                              ; D859   0018
        COMR    R0                              ; D85A   0018
        SUB@    R6,     R0                      ; D85B   0330
        RRC     R0,     1                       ; D85C   0070
        CMPR    R2,     R0                      ; D85D   0150
        SUBR    R0,     R0                      ; D85E   0100
        SUBR    R0,     R0                      ; D85F   0100
        SUBR    R3,     R0                      ; D860   0118
        MOVR    R3,     R0                      ; D861   0098
        CMPR    R3,     R4                      ; D862   015C
        SARC    R2,     2                       ; D863   007E
L_D864:
        SUBR    R7,     R6                      ; D864   013E
        DECLE   $023A                           ; D865   023A

        SUBR    R3,     R1                      ; D866   0119
        SUBR    R3,     R0                      ; D867   0118
        SUBR    R3,     R0                      ; D868   0118
        SUB@    R3,     R0                      ; D869   0318
        COMR    R0                              ; D86A   0018
        SUB@    R6,     R0                      ; D86B   0330
        CMPR    R6,     R0                      ; D86C   0170
        MVO@    R0,     R2                      ; D86D   0250
        B       L_D970                          ; D86E   0200 0100

        DECLE   $0100,  $0230                   ; D870   0100 0230

        SUBR    R6,     R0                      ; D872   0130
L_D873:
        SUB@    R6,     R0                      ; D873   0330
        DECLE   $0179,  $02FE,  $03FC,  $02B0   ; D874   0179 02FE 03FC 02B0
        DECLE   $01B0,  $0270,  $013E,  $017C   ; D878   01B0 0270 013E 017C
        DECLE   $01F2,  $02C3,  $0120,  $0060   ; D87C   01F2 02C3 0120 0060
        DECLE   $0000,  $0230                   ; D880   0000 0230

        NOP                                     ; D882   0034
        GSWD    R2                              ; D883   0032
        CMPR    R7,     R2                      ; D884   017A
        ADDI    #$00FC, R6                      ; D885   02FE 00FC
        ANDR    R6,     R0                      ; D887   01B0
        SUBR    R6,     R3                      ; D888   0133
        PULR    R7                              ; D889   02B7

        DECLE   $033E,  $023C,  $0170,  $02E0   ; D88A   033E 023C 0170 02E0
        DECLE   $01F0,  $0030,  $0000,  $0030   ; D88E   01F0 0030 0000 0030
        DECLE   $0030,  $003C,  $037E,  $03FA   ; D892   0030 003C 037E 03FA
        DECLE   $03F0,  $01B2,  $0030,  $02B0   ; D896   03F0 01B2 0030 02B0
        DECLE   $021C,  $012E,  $0137           ; D89A   021C 012E 0137

        SUBR    R4,     R2                      ; D89D   0122
        DECR    R1                              ; D89E   0011
L_D89F:
        GSWD    R3                              ; D89F   0033
        DECLE   $0100,  $0300,  $0031,  $0236   ; D8A0   0100 0300 0031 0236
        DECLE   $013E,  $027C,  $03F8,  $03F0   ; D8A4   013E 027C 03F8 03F0
        DECLE   $01B0,  $0277,  $013F           ; D8A8   01B0 0277 013F
L_D8AB:
        SUB@    R3,     R4                      ; D8AB   031C
        SUBR    R4,     R0                      ; D8AC   0120
        SUB@    R6,     R0                      ; D8AD   0330
        GSWD    R0                              ; D8AE   0030
        B       L_D7B0                          ; D8AF   0220 0100

        DECLE   $0218,  $0018,  $011E,  $017F   ; D8B1   0218 0018 011E 017F
        DECLE   $02FE,  $033D,  $01BC,  $0118   ; D8B5   02FE 033D 01BC 0118
        DECLE   $0218                           ; D8B9   0218

        SUB@    R3,     R0                      ; D8BA   0318
L_D8BB:
        SUBR    R3,     R4                      ; D8BB   011C
        DECLE   $0136,  $0236,  $0124,  $0102   ; D8BC   0136 0236 0124 0102
        DECLE   $0100,  $0206,  $0106,  $000E   ; D8C0   0100 0206 0106 000E
        DECLE   $003C,  $027C                   ; D8C4   003C 027C

        SARC    R0,     2                       ; D8C6   007C
        MOVR    R3,     R0                      ; D8C7   0098
        SUBR    R7,     R0                      ; D8C8   0138
        RRC     R0,     1                       ; D8C9   0070
        SLR     R0,     1                       ; D8CA   0060
        MVO     R0,     G_0160                  ; D8CB   0240 0160
        SUB@    R4,     R0                      ; D8CD   0320
L_D8CE:
        MVO@    R0,     R5                      ; D8CE   0268
        DECLE   $0168,  $0030,  $0030,  $0030   ; D8CF   0168 0030 0030 0030
        DECLE   $0071,  $03F1,  $03F1,  $03B2   ; D8D3   0071 03F1 03F1 03B2
        DECLE   $0170,  $0130,  $0230,  $0170   ; D8D7   0170 0130 0230 0170
        DECLE   $01D8,  $0190,  $0048,  $01D8   ; D8DB   01D8 0190 0048 01D8
        DECLE   $0390,  $0100,  $0300,  $0000   ; D8DF   0390 0100 0300 0000
        DECLE   $0218,  $0118,  $0218,  $0030   ; D8E3   0218 0118 0218 0030
        DECLE   $0178,  $0178,  $03FC,  $00EC   ; D8E7   0178 0178 03FC 00EC
        DECLE   $00E6,  $01E3,  $0271,  $0230   ; D8EB   00E6 01E3 0271 0230
        DECLE   $0018,  $0100,  $0230,  $0230   ; D8EF   0018 0100 0230 0230

        SUBR    R6,     R0                      ; D8F3   0130
        CMPR    R4,     R0                      ; D8F4   0160
        ADD@    R6,     R0                      ; D8F5   02F0
        ADDR    R7,     R0                      ; D8F6   00F8
        ANDI    #$01B8, R0                      ; D8F7   03B8 01B8
        CMP@    R3,     R0                      ; D8F9   0358
        COMR    R3                              ; D8FA   001B
        SUB@    R2,     R7                      ; D8FB   0317

        DECLE   $0019,  $021A,  $0030,  $0030   ; D8FC   0019 021A 0030 0030
        DECLE   $0100,  $0000,  $0004           ; D900   0100 0000 0004
L_D903:
        ADD@    R1,     R0                      ; D903   02C8
        DECLE   $01F8,  $03F0,  $0278           ; D904   01F8 03F0 0278

        CMPR    R7,     R3                      ; D907   017B
        SARC    R3,     1                       ; D908   007B
        ADCR    R5                              ; D909   002D
        ADCR    R6                              ; D90A   002E
L_D90B:
        DECR    R7                              ; D90B   0017

L_D90C:
        SUB     G_0301, R3                      ; D90C   0303 0301
        DECLE   $0300,  $0100,  $0200,  $0200   ; D90E   0300 0100 0200 0200

        MOVR    R6,     R4                      ; D912   00B4
L_D913:
        SUBR    R6,     R0                      ; D913   0130
        DECLE   $01B4,  $01A4,  $00FC,  $00FC   ; D914   01B4 01A4 00FC 00FC
        DECLE   $0178,  $0330,  $0030,  $0230   ; D918   0178 0330 0030 0230
        DECLE   $0136,  $0236,  $033A,  $031C   ; D91C   0136 0236 033A 031C
        DECLE   $0100,  $0200,  $0100,  $0000   ; D920   0100 0200 0100 0000

        SUBR    R0,     R0                      ; D924   0100
        SUB     .ISRVEC.0,R0                    ; D925   0300 0100
        SUBR    R1,     R4                      ; D927   010C
        SUBR    R1,     R5                      ; D928   010D
        BNEQ    L_D944                          ; D929   020C 0019

        SUBI    #$01FF, R5                      ; D92B   033D 01FF
        ADD@    R6,     R7                      ; D92D   02F7

        DECLE   $0163,  $0160,  $0100,  $0200   ; D92E   0163 0160 0100 0200
        DECLE   $0100,  $0000,  $0000,  $0200   ; D932   0100 0000 0000 0200
        DECLE   $0030,  $0030,  $0130,  $0060   ; D936   0030 0030 0130 0060
        DECLE   $0070,  $02F6,  $01F7           ; D93A   0070 02F6 01F7

        ANDI    #$02DD, R2                      ; D93D   03BA 02DD
        XORR    R4,     R0                      ; D93F   01E0
        COMR    R0                              ; D940   0018
        MOVR    R3,     R0                      ; D941   0098
        COMR    R0                              ; D942   0018
        MOVR    R6,     R0                      ; D943   00B0
L_D944:
        XORI    #$03F8, R0                      ; D944   03F8 03F8
        DECLE   $037A,  $011C,  $0318,  $0018   ; D946   037A 011C 0318 0018
        DECLE   $0210,  $0118,  $0108,  $0010   ; D94A   0210 0118 0108 0010
        DECLE   $0118,  $0228,  $0118,  $0218   ; D94E   0118 0228 0118 0218
        DECLE   $031A,  $0310,  $011A,  $031E   ; D952   031A 0310 011A 031E
        DECLE   $001C,  $0218,  $0018,  $0018   ; D956   001C 0218 0018 0018
        DECLE   $0010,  $0018,  $0308,  $0310   ; D95A   0010 0018 0308 0310
        DECLE   $0318,  $0228,  $0018,  $0008   ; D95E   0318 0228 0018 0008
        DECLE   $0110,  $0118,  $0130,  $0030   ; D962   0110 0118 0130 0030
        DECLE   $0030,  $0130,  $0130,  $0130   ; D966   0030 0130 0130 0130
        DECLE   $003C,  $037C,  $0164,  $0368   ; D96A   003C 037C 0164 0368
        DECLE   $0100,  $0000                   ; D96E   0100 0000
L_D970:
        SUBR    R0,     R0                      ; D970   0100
        B       L_DA77                          ; D971   0200 0104

L_D973:
        SUBR    R0,     R1                      ; D973   0101
        DECLE   $0104,  $030D,  $010D,  $020F   ; D974   0104 030D 010D 020F
        DECLE   $011F,  $023C,  $01FC,  $01B8   ; D978   011F 023C 01FC 01B8
        DECLE   $0060,  $02E0,  $00C0,  $0080   ; D97C   0060 02E0 00C0 0080
        DECLE   $0130,  $0034,  $0134,  $012C   ; D980   0130 0034 0134 012C
        DECLE   $0138,  $0338,  $0138,  $0030   ; D984   0138 0338 0138 0030
        DECLE   $0130,  $0330,  $0130,  $0030   ; D988   0130 0330 0130 0030
        DECLE   $0130,  $0250,  $0258,  $0158   ; D98C   0130 0250 0258 0158
        DECLE   $0130,  $0230                   ; D990   0130 0230
L_D992:
        SUB@    R6,     R0                      ; D992   0330
        B       L_D864                          ; D993   0220 0130

        DECLE   $0238,  $0139,  $033E,  $0130   ; D995   0238 0139 033E 0130
        DECLE   $0230,  $0130,  $0130,  $0130   ; D999   0230 0130 0130 0130
        DECLE   $0330,  $0038,  $0218           ; D99D   0330 0038 0218

        GSWD    R0                              ; D9A0   0030
        GSWD    R0                              ; D9A1   0030
        GSWD    R0                              ; D9A2   0030
        NEGR    R0                              ; D9A3   0020
        SUB@    R6,     R0                      ; D9A4   0330
        SUBI    #$0339, R0                      ; D9A5   0338 0339
        SUBR    R7,     R6                      ; D9A7   013E
        SUBR    R6,     R0                      ; D9A8   0130
        SUB@    R6,     R0                      ; D9A9   0330
        SUB@    R6,     R0                      ; D9AA   0330
L_D9AB:
        SUBR    R6,     R0                      ; D9AB   0130
        SUBR    R6,     R0                      ; D9AC   0130
        RSWD    R4                              ; D9AD   003C
        RSWD    R4                              ; D9AE   003C
        SUB     .ISRVEC.0,R0                    ; D9AF   0300 0100
        B       L_DCB3                          ; D9B1   0200 0300

        SUB     .ISRVEC.0,R0                    ; D9B3   0300 0100
        B       L_DCB7                          ; D9B5   0200 0300

        DECLE   $0218,  $013C,  $027E,  $03FF   ; D9B7   0218 013C 027E 03FF
        DECLE   $02FF,  $01BD,  $0281,  $0240   ; D9BB   02FF 01BD 0281 0240
        DECLE   $0101,  $010C,  $020C,  $010C   ; D9BF   0101 010C 020C 010C
        DECLE   $011E,  $003F,  $023F,  $002D   ; D9C3   011E 003F 023F 002D
        DECLE   $001E,  $010C,  $000C,  $011E   ; D9C7   001E 010C 000C 011E
        DECLE   $0336,  $0134,  $0202           ; D9CB   0336 0134 0202

        SUB@    R6,     R6                      ; D9CE   0336
        SUB@    R4,     R4                      ; D9CF   0324
        SUBR    R0,     R0                      ; D9D0   0100
        B       L_DCD3                          ; D9D1   0200 0300

        DECLE   $0000,  $0118,  $0218,  $0118   ; D9D3   0000 0118 0218 0118
        DECLE   $003C,  $017E,  $0259,  $0398   ; D9D7   003C 017E 0259 0398
        DECLE   $013E,  $0137,  $0233,  $0033   ; D9DB   013E 0137 0233 0033
        DECLE   $0131,  $016C,  $0228,  $0398   ; D9DF   0131 016C 0228 0398
        DECLE   $0259,  $007E,  $003C,  $0018   ; D9E3   0259 007E 003C 0018
        DECLE   $0000                           ; D9E7   0000

        SUB     G_0300, R0                      ; D9E8   0300 0300
        SUB     .ISRVEC.0,R0                    ; D9EA   0300 0100
        B       L_DCEE                          ; D9EC   0200 0300

        DECLE   $0300,  $0000,  $01FF,  $00FF   ; D9EE   0300 0000 01FF 00FF
        DECLE   $01FF,  $00FF,  $01E7           ; D9F2   01FF 00FF 01E7

        ADD@    R4,     R7                      ; D9F5   02E7

        ADDR    R0,     R3                      ; D9F6   00C3
        XORR    R0,     R3                      ; D9F7   01C3
        ANDR    R0,     R1                      ; D9F8   0181
        AND     .ISRVEC.0,R1                    ; D9F9   0381 0100
        B       L_DAFD                          ; D9FB   0200 0100
        B       L_DAFF                          ; D9FD   0200 0100

        DECLE   $0100,  $0000,  $027E,  $00FF   ; D9FF   0100 0000 027E 00FF
        DECLE   $00FF,  $01FF,  $01FF,  $01FF   ; DA03   00FF 01FF 01FF 01FF
        DECLE   $03FF,  $0100,  $0200,  $0080   ; DA07   03FF 0100 0200 0080
        DECLE   $01E0,  $01F8,  $03FE,  $00FF   ; DA0B   01E0 01F8 03FE 00FF
        DECLE   $02FF                           ; DA0F   02FF

        XORR    R7,     R0                      ; DA10   01F8
L_DA11:
        ADDI    #$02FE, R6                      ; DA11   02FE 02FE
        DECLE   $00FE,  $01FE,  $02FE,  $03FC   ; DA13   00FE 01FE 02FE 03FC
        DECLE   $03FC,  $0180,  $0280,  $0300   ; DA17   03FC 0180 0280 0300
        DECLE   $0000,  $0000,  $0000,  $0001   ; DA1B   0000 0000 0000 0001
        DECLE   $0007,  $03F8,  $03F8,  $03F1   ; DA1F   0007 03F8 03F8 03F1
        DECLE   $03F7,  $01FF,  $00FF,  $00FF   ; DA23   03F7 01FF 00FF 00FF
        DECLE   $03FF,  $0100,  $02E0,  $0284   ; DA27   03FF 0100 02E0 0284
        DECLE   $00EE,  $0124,  $02E4,  $0300   ; DA2B   00EE 0124 02E4 0300
        DECLE   $0300,  $0100,  $02E0,  $0380   ; DA2F   0300 0100 02E0 0380
        DECLE   $038E,  $018A,  $03EE,  $0000   ; DA33   038E 018A 03EE 0000

        SUB     .ISRVEC.0,R0                    ; DA37   0300 0100
        ADD@    R4,     R0                      ; DA39   02E0
        ANDR    R0,     R0                      ; DA3A   0180
        XORR    R1,     R6                      ; DA3B   01CE
        MOVR    R1,     R2                      ; DA3C   008A
        ADDR    R5,     R6                      ; DA3D   00EE
        EIS                                     ; DA3E   0002
        INCR    R6                              ; DA3F   000E
        XORR    R4,     R0                      ; DA40   01E0
        XORR    R4,     R0                      ; DA41   01E0
        ADD@    R4,     R0                      ; DA42   02E0
        XORR    R4,     R0                      ; DA43   01E0
        XORR    R4,     R0                      ; DA44   01E0
        ADD@    R4,     R0                      ; DA45   02E0
        XOR@    R4,     R0                      ; DA46   03E0
        XOR@    R4,     R0                      ; DA47   03E0
        SUBR    R0,     R7                      ; DA48   0107
        SUB     G_0107, R7                      ; DA49   0307 0107
        SUBR    R0,     R7                      ; DA4B   0107
        SUBR    R0,     R7                      ; DA4C   0107
        SUB     .STIC.X.7,R7                    ; DA4D   0307 0007
        BUSC    L_DB50                          ; DA4F   0207 00FF

        MOVR    R1,     R0                      ; DA51   0088
        ADDR    R1,     R1                      ; DA52   00C9
        ADDR    R5,     R3                      ; DA53   00EB
        ANDR    R7,     R6                      ; DA54   01BE
        ANDR    R3,     R4                      ; DA55   019C
        MOVR    R1,     R0                      ; DA56   0088
        ADDI    #$01FF, R7                      ; DA57   02FF 01FF

        DECLE   $024F,  $014F,  $0187           ; DA59   024F 014F 0187

        ANDR    R6,     R4                      ; DA5C   01B4
        XOR@    R1,     R4                      ; DA5D   03CC
        CMPR    R1,     R0                      ; DA5E   0148
        BPL     L_DC5D                          ; DA5F   0203 01FC

        MVO@    R0,     R1                      ; DA61   0248
        MVO@    R7,     R1                      ; DA62   024F
        ANDR    R0,     R3                      ; DA63   0183
        ANDR    R6,     R3                      ; DA64   01B3
        ADD@    R1,     R7                      ; DA65   02CF

        DECLE   $014F,  $0187,  $01FF,  $034F   ; DA66   014F 0187 01FF 034F
        DECLE   $014F,  $038F,  $00BF,  $02FF   ; DA6A   014F 038F 00BF 02FF
        DECLE   $007F,  $003F,  $01FC,  $00C8   ; DA6E   007F 003F 01FC 00C8
        DECLE   $03CB,  $01C7                   ; DA72   03CB 01C7

        ANDR    R6,     R4                      ; DA74   01B4
        ADD@    R1,     R4                      ; DA75   02CC
        CMP@    R1,     R0                      ; DA76   0348
L_DA77:
        SUB     .PSG0.chn_b_vol,R3              ; DA77   0303 01FC
        XOR@    R1,     R0                      ; DA79   03C8
        XORR    R1,     R3                      ; DA7A   01CB
        MVI     G_01BC, R7                      ; DA7B   0287 01BC

        DECLE   $02FC,  $01F8,  $01FF,  $01FC   ; DA7D   02FC 01F8 01FF 01FC
        DECLE   $03F8,  $00FB,  $03FF,  $00FC   ; DA81   03F8 00FB 03FF 00FC
        DECLE   $00FC,  $00FF,  $00FF,  $01FC   ; DA85   00FC 00FF 00FF 01FC
        DECLE   $0148,  $014B,  $0387,  $01BC   ; DA89   0148 014B 0387 01BC
        DECLE   $03FC,  $0078,  $02FF,  $01FC   ; DA8D   03FC 0078 02FF 01FC
        DECLE   $0248,  $014B,  $0187,  $01B4   ; DA91   0248 014B 0187 01B4
        DECLE   $03CC,  $0048,  $0303,  $0183   ; DA95   03CC 0048 0303 0183
        DECLE   $0381,  $0101,  $0041,  $0101   ; DA99   0381 0101 0041 0101
        DECLE   $0283,  $0307,  $001F           ; DA9D   0283 0307 001F

        SUBR    R0,     R1                      ; DAA0   0101
        B       L_DBA4                          ; DAA1   0200 0101

        DECLE   $0100,  $0101,  $0300,  $0001   ; DAA3   0100 0101 0300 0001
        DECLE   $0200,  $01FF,  $03FC,  $00FF   ; DAA7   0200 01FF 03FC 00FF
        DECLE   $03FF,  $00FF,  $00FB,  $00FD   ; DAAB   03FF 00FF 00FB 00FD
        DECLE   $00FE,  $01FF,  $00FF,  $01FF   ; DAAF   00FE 01FF 00FF 01FF

        XORI    #$01FC, R6                      ; DAB3   03FE 01FC
        ADD@    R5,     R0                      ; DAB5   02E8
        ADDR    R6,     R0                      ; DAB6   00F0
        XORR    R7,     R0                      ; DAB7   01F8
        CLRR    R0                              ; DAB8   01C0
        ADD     G_03C0, R0                      ; DAB9   02C0 03C0
        CLRR    R0                              ; DABB   01C0
        XORR    R4,     R1                      ; DABC   01E1
        ADD@    R4,     R7                      ; DABD   02E7

        DECLE   $016F,  $017F,  $00FF,  $00FF   ; DABE   016F 017F 00FF 00FF
        DECLE   $00FF,  $00FD,  $01FF,  $00FF   ; DAC2   00FF 00FD 01FF 00FF
        DECLE   $03FF,  $01FF,  $0107,  $0207   ; DAC6   03FF 01FF 0107 0207
        DECLE   $030F                           ; DACA   030F

        SUBI    #$01FF, R7                      ; DACB   033F 01FF
        ADDI    #$01FE, R7                      ; DACD   02FF 01FE

        DECLE   $00F8,  $0178,  $027C,  $013E   ; DACF   00F8 0178 027C 013E
        DECLE   $013F,  $001F,  $001F           ; DAD3   013F 001F 001F

        INCR    R7                              ; DAD6   000F
        INCR    R7                              ; DAD7   000F

L_DAD8:
        SUBR    R0,     R2                      ; DAD8   0102
L_DAD9:
        SUBR    R0,     R3                      ; DAD9   0103
        DECLE   $0103,  $0001,  $0101,  $0300   ; DADA   0103 0001 0101 0300
        DECLE   $0200,  $0100,  $017F,  $037F   ; DADE   0200 0100 017F 037F
        DECLE   $007F,  $003F,  $013F,  $023E   ; DAE2   007F 003F 013F 023E
        DECLE   $013E,  $017D,  $00C0,  $00E0   ; DAE6   013E 017D 00C0 00E0
        DECLE   $00F8,  $00FE,  $01FF,  $01FF   ; DAEA   00F8 00FE 01FF 01FF
        DECLE   $00FF,  $037F,  $01FE,  $023F   ; DAEE   00FF 037F 01FE 023F
        DECLE   $021F                           ; DAF2   021F

        SUB@    R1,     R7                      ; DAF3   030F
        SUBR    R0,     R7                      ; DAF4   0107

        DECLE   $0203,  $0201,  $0100,  $017D   ; DAF5   0203 0201 0100 017D
        DECLE   $027B,  $03FB,  $00F7,  $01F7   ; DAF9   027B 03FB 00F7 01F7
L_DAFD:
        ADD@    R5,     R7                      ; DAFD   02EF

        DECLE   $03EF                           ; DAFE   03EF
L_DAFF:
        ADDR    R3,     R7                      ; DAFF   00DF

        DECLE   $0000,  $0200,  $0000,  $0000   ; DB00   0000 0200 0000 0000
        DECLE   $0100,  $0086,  $0360,  $0000   ; DB04   0100 0086 0360 0000

        SUBR    R1,     R6                      ; DB08   010E
        MVI     G_01C4, R0                      ; DB09   0280 01C4
        SUBR    R4,     R0                      ; DB0B   0120
        SUBR    R2,     R1                      ; DB0C   0111
        SUB@    R1,     R6                      ; DB0D   030E
        SUBR    R0,     R0                      ; DB0E   0100
        B       L_DC11                          ; DB0F   0200 0100
        B       L_DC13                          ; DB11   0200 0100

        DECLE   $0100,  $0100,  $0286,  $0360   ; DB13   0100 0100 0286 0360
        DECLE   $0004,  $008E,  $00C4,  $00A1   ; DB17   0004 008E 00C4 00A1
        DECLE   $0011,  $010E,  $0100,  $0000   ; DB1B   0011 010E 0100 0000

        B       L_DCAD                          ; DB1F   0200 018C
        B       L_DA11                          ; DB21   0220 0111

        DECLE   $0100,  $0100,  $0300,  $0000   ; DB23   0100 0100 0300 0000
        DECLE   $0000,  $0100,  $0263,  $0380   ; DB27   0000 0100 0263 0380
        DECLE   $0000,  $0163,  $02B5,  $0021   ; DB2B   0000 0163 02B5 0021
        DECLE   $0100,  $018C,  $0320,  $0211   ; DB2F   0100 018C 0320 0211
        DECLE   $0100,  $0000,  $0000,  $0000   ; DB33   0100 0000 0000 0000
        DECLE   $0000,  $0100,  $0063,  $0380   ; DB37   0000 0100 0063 0380
        DECLE   $0200,  $0163,  $02D6,  $0142   ; DB3B   0200 0163 02D6 0142
        DECLE   $0100,  $018C,  $0320,  $0111   ; DB3F   0100 018C 0320 0111
        DECLE   $0300,  $0000,  $0000,  $0000   ; DB43   0300 0000 0000 0000
        DECLE   $0000,  $0163,  $0180,  $0000   ; DB47   0000 0163 0180 0000

        B       L_DCB0                          ; DB4B   0200 0163

        ADD@    R2,     R6                      ; DB4D   02D6
        CMPR    R0,     R2                      ; DB4E   0142
        SUBR    R0,     R0                      ; DB4F   0100
L_DB50:
        MOVR    R1,     R4                      ; DB50   008C
        DECLE   $0220,  $0311,  $0100,  $0100   ; DB51   0220 0311 0100 0100
        DECLE   $0300,  $0000,  $0300,  $0100   ; DB55   0300 0000 0300 0100
        DECLE   $0363,  $0180,  $0000,  $0103   ; DB59   0363 0180 0000 0103
        DECLE   $0206,  $0062,  $01C0,  $0120   ; DB5D   0206 0062 01C0 0120
        DECLE   $0330,  $0070,  $0270,  $0178   ; DB61   0330 0070 0270 0178
        DECLE   $03F8,  $01F8,  $00F8,  $00FC   ; DB65   03F8 01F8 00F8 00FC
        DECLE   $00FC,  $00BC,  $00BC,  $01BC   ; DB69   00FC 00BC 00BC 01BC
        DECLE   $00CE,  $0176,  $021E           ; DB6D   00CE 0176 021E

        SUBR    R0,     R2                      ; DB70   0102
        BOV     L_DD75                          ; DB71   0202 0202

L_DB73:
        SUBR    R0,     R2                      ; DB73   0102
        SUBR    R0,     R2                      ; DB74   0102
        SUB     .STIC.X.6,R2                    ; DB75   0302 0006
        BUSC    L_DC80                          ; DB77   0207 0107
        SUB     .STIC.Y.7,R7                    ; DB79   0307 000F
        SUB@    R1,     R7                      ; DB7B   030F
        SUBR    R3,     R7                      ; DB7C   011F

        DECLE   $037E,  $017E,  $0038,  $0000   ; DB7D   037E 017E 0038 0000
        DECLE   $0000,  $0000                   ; DB81   0000 0000

        CLRC                                    ; DB83   0006
        SUBR    R1,     R7                      ; DB84   010F
        SUBR    R3,     R7                      ; DB85   011F

        DECLE   $001F,  $033F,  $013F,  $023F   ; DB86   001F 033F 013F 023F
        DECLE   $013F,  $013F,  $013F,  $021F   ; DB8A   013F 013F 013F 021F
        DECLE   $001F                           ; DB8E   001F

        SUB     .ISRVEC.0,R7                    ; DB8F   0307 0100
        B       L_DF91                          ; DB91   0200 03FE

        DECLE   $03FF,  $01FF,  $02FF,  $03FF   ; DB93   03FF 01FF 02FF 03FF
        DECLE   $02FF,  $01FF,  $02FF,  $017E   ; DB97   02FF 01FF 02FF 017E
        DECLE   $007C,  $0078,  $0038,  $0030   ; DB9B   007C 0078 0038 0030
        DECLE   $0010,  $0100,  $0100,  $0100   ; DB9F   0010 0100 0100 0100
        DECLE   $0000                           ; DBA3   0000
L_DBA4:
        SUBR    R0,     R0                      ; DBA4   0100
        B       L_DBA8                          ; DBA5   0200 0001

        SUBR    R0,     R1                      ; DBA7   0101
L_DBA8:
        SUBR    R0,     R6                      ; DBA8   0106
        BEQ     L_DCC3                          ; DBA9   0204 0118

        SUB@    R2,     R0                      ; DBAB   0310
        NEGR    R0                              ; DBAC   0020
        B       L_DC2F                          ; DBAD   0200 0080

        DECLE   $0000,  $0100,  $0100,  $0140   ; DBAF   0000 0100 0100 0140
        DECLE   $0000                           ; DBB3   0000

        SUBR    R0,     R0                      ; DBB4   0100
        B       L_DCB7                          ; DBB5   0200 0100

        ANDR    R0,     R0                      ; DBB7   0180
        SUBR    R0,     R0                      ; DBB8   0100
        B       L_DBBB                          ; DBB9   0200 0000

L_DBBB:
        SUBR    R0,     R0                      ; DBBB   0100
        SUBR    R0,     R1                      ; DBBC   0101
        B       L_DEC3                          ; DBBD   0200 0304

        DECLE   $0100,  $0007,  $0005,  $0005   ; DBBF   0100 0007 0005 0005
        DECLE   $0005,  $0107,  $0102,  $0006   ; DBC3   0005 0107 0102 0006
        DECLE   $0202,  $0102,  $0202           ; DBC7   0202 0102 0202

        SUB     G_0301, R7                      ; DBCA   0307 0301
        SUBR    R0,     R7                      ; DBCC   0107

        SUB     G_0107, R4                      ; DBCD   0304 0107
        SUBR    R0,     R7                      ; DBCF   0107

        DECLE   $0101,  $0203,  $0301,  $0207   ; DBD0   0101 0203 0301 0207
        DECLE   $0105,  $0205,  $0107,  $0001   ; DBD4   0105 0205 0107 0001
        DECLE   $0001,  $0207,  $0004           ; DBD8   0001 0207 0004

        SETC                                    ; DBDB   0007
        SUBR    R0,     R1                      ; DBDC   0101
        SETC                                    ; DBDD   0007
        SUB     G_0304, R4                      ; DBDE   0304 0304
        SUBR    R0,     R7                      ; DBE0   0107

        SUB     G_0107, R5                      ; DBE1   0305 0107
        BUSC    L_DCE6                          ; DBE3   0207 0101
        BOV     L_DCE9                          ; DBE5   0202 0102

        SUBR    R0,     R2                      ; DBE7   0102
        SUBR    R0,     R7                      ; DBE8   0107

        DECLE   $0305,  $0007,  $0205,  $0007   ; DBE9   0305 0007 0205 0007
        DECLE   $0007,  $0005,  $0007,  $0101   ; DBED   0007 0005 0007 0101
        DECLE   $0001,  $0102,  $0004           ; DBF1   0001 0102 0004

        SUBR    R0,     R0                      ; DBF4   0100
        SUB     .STIC.X.0,R0                    ; DBF5   0300 0000
        BLT     L_DD03                          ; DBF7   0205 010A
        B       L_DBFB                          ; DBF9   0200 0000

L_DBFB:
        SUBR    R0,     R0                      ; DBFB   0100
        DECLE   $0100,  $0302,  $0100,  $0302   ; DBFC   0100 0302 0100 0302
        DECLE   $0000,  $0219,  $0015,  $0015   ; DC00   0000 0219 0015 0015
        DECLE   $0115,  $0019,  $0377,  $0145   ; DC04   0115 0019 0377 0145
        DECLE   $0177,  $0214                   ; DC08   0177 0214

        RRC     R0,     2                       ; DC0A   0074
        CMPR    R0,     R7                      ; DC0B   0147
        CMPR    R0,     R5                      ; DC0C   0145
        CMP     G_0145, R7                      ; DC0D   0347 0145
        RRC     R1,     2                       ; DC0F   0075
        CMPR    R2,     R0                      ; DC10   0150
L_DC11:
        MVO@    R4,     R2                      ; DC11   0254
        RRC     R0,     1                       ; DC12   0070
L_DC13:
        SUB@    R4,     R4                      ; DC13   0324
        DECLE   $0120,  $0207,  $0204,  $0007   ; DC14   0120 0207 0204 0007
        DECLE   $0001,  $0007,  $0074,  $0044   ; DC18   0001 0007 0074 0044
        DECLE   $0164,  $0044,  $0377,  $0177   ; DC1C   0164 0044 0377 0177
        DECLE   $0144,  $0264,  $0044,  $0177   ; DC20   0144 0264 0044 0177
        DECLE   $0170,  $0324,  $0120,  $0024   ; DC24   0170 0324 0120 0024
        DECLE   $0120,  $0233,  $002A,  $032A   ; DC28   0120 0233 002A 032A
        DECLE   $012A,  $0233                   ; DC2C   012A 0233

        MVI@    R4,     R5                      ; DC2E   02A5
L_DC2F:
        MOVR    R6,     R5                      ; DC2F   00B5
        DECLE   $00BD,  $02AD,  $00A5,  $00C0   ; DC30   00BD 02AD 00A5 00C0
        DECLE   $0110,  $0080,  $0310,  $03C0   ; DC34   0110 0080 0310 03C0
        DECLE   $0132,  $032A,  $012A,  $022A   ; DC38   0132 032A 012A 022A
        DECLE   $0132,  $02EE,  $0188,  $01E8   ; DC3C   0132 02EE 0188 01E8
        DECLE   $0128,  $03EE,  $0010,  $0230   ; DC40   0128 03EE 0010 0230
L_DC44:
        DECR    R7                              ; DC44   0017

        DECLE   $0010,  $0010,  $0000,  $0100   ; DC45   0010 0010 0000 0100
        DECLE   $0100,  $0000,  $0200,  $01E0   ; DC49   0100 0000 0200 01E0
        DECLE   $0280,  $01C0,  $0180,  $01E0   ; DC4D   0280 01C0 0180 01E0
        DECLE   $020E,  $000A,  $010C,  $010A   ; DC51   020E 000A 010C 010A
        DECLE   $020A                           ; DC55   020A

        XORR    R5,     R2                      ; DC56   01EA
        MOVR    R1,     R2                      ; DC57   008A
L_DC58:
        XORR    R1,     R2                      ; DC58   01CA
        AND@    R1,     R2                      ; DC59   038A
        ADD@    R4,     R4                      ; DC5A   02E4
        ANDR    R7,     R2                      ; DC5B   01BA
        MOVR    R4,     R2                      ; DC5C   00A2
L_DC5D:
        PULR    R2                              ; DC5D   02B2
        DECLE   $03A3,  $02B9,  $0022,  $0223   ; DC5E   03A3 02B9 0022 0223
        DECLE   $03A3,  $02E2,  $0042,  $002E   ; DC62   03A3 02E2 0042 002E
        DECLE   $006A,  $00EA,  $01AA,  $002E   ; DC66   006A 00EA 01AA 002E
        DECLE   $02AE,  $01A8,  $01AC,  $00A8   ; DC6A   02AE 01A8 01AC 00A8
        DECLE   $034E,  $02E0,  $0188,  $01E0   ; DC6E   034E 02E0 0188 01E0
        DECLE   $0128,  $00E0,  $0170,  $0140   ; DC72   0128 00E0 0170 0140
        DECLE   $0140,  $0240,  $0070,  $023F   ; DC76   0140 0240 0070 023F
        DECLE   $007F,  $00FF,  $01FF,  $00FF   ; DC7A   007F 00FF 01FF 00FF
        DECLE   $00FF,  $03FF                   ; DC7E   00FF 03FF
L_DC80:
        CMPR    R7,     R7                      ; DC80   017F
        DECLE   $023F,  $0301,  $0301,  $0102   ; DC81   023F 0301 0301 0102
        DECLE   $0304,  $0000,  $0200,  $0100   ; DC85   0304 0000 0200 0100
        DECLE   $03FC,  $00FE,  $00FF,  $01FF   ; DC89   03FC 00FE 00FF 01FF
        DECLE   $02FF,  $03FF,  $03FF           ; DC8D   02FF 03FF 03FF

        XORR    R7,     R6                      ; DC90   01FE
        XORI    #$0080, R4                      ; DC91   03FC 0080
        B       L_DD95                          ; DC93   0200 0100
        B       L_DC97                          ; DC95   0200 0000

L_DC97:
        SUBR    R0,     R0                      ; DC97   0100
        SUBR    R0,     R0                      ; DC98   0100
        XOR     G_01D5, R4                      ; DC99   03C4 01D5
        ADDR    R2,     R5                      ; DC9B   00D5
        XORR    R2,     R5                      ; DC9C   01D5
        ADD     .BTAB.47,R4                     ; DC9D   02C4 0247
        CMPR    R3,     R7                      ; DC9F   015F
        CMPR    R1,     R7                      ; DCA0   014F
        MVO@    R7,     R3                      ; DCA1   025F
        CMP@    R3,     R7                      ; DCA2   035F
        XOR@    R2,     R4                      ; DCA3   03D4
        XORR    R2,     R5                      ; DCA4   01D5
        ADD@    R2,     R5                      ; DCA5   02D5
        XOR@    R2,     R5                      ; DCA6   03D5
        ADD     G_0057, R4                      ; DCA7   02C4 0057
        ADDR    R2,     R7                      ; DCA9   00D7

        SWAP    R3,     2                       ; DCAA   0047
        RLC     R3,     2                       ; DCAB   0057
        RLC     R3,     2                       ; DCAC   0057
L_DCAD:
        ADDR    R2,     R6                      ; DCAD   00D6
        MOVR    R0,     R2                      ; DCAE   0082
        ADD@    R2,     R6                      ; DCAF   02D6
L_DCB0:
        ANDR    R0,     R3                      ; DCB0   0183
        XORR    R2,     R6                      ; DCB1   01D6
        ADDR    R1,     R7                      ; DCB2   00CF
L_DCB3:
        PULR    R7                              ; DCB3   02B7

        DECLE   $03AF                           ; DCB4   03AF

        ANDR    R7,     R3                      ; DCB5   01BB
        ADDR    R0,     R7                      ; DCB6   00C7

L_DCB7:
        ANDR    R1,     R2                      ; DCB7   018A
        AND@    R5,     R2                      ; DCB8   03AA
        MVI@    R5,     R2                      ; DCB9   02AA
        ANDR    R5,     R2                      ; DCBA   01AA
        MOVR    R1,     R0                      ; DCBB   0088
        MOVR    R2,     R5                      ; DCBC   0095
        ANDR    R6,     R5                      ; DCBD   01B5
        PULR    R1                              ; DCBE   02B1
        ANDR    R6,     R5                      ; DCBF   01B5
        MOVR    R2,     R5                      ; DCC0   0095
        AND@    R1,     R0                      ; DCC1   0388
        AND@    R5,     R2                      ; DCC2   03AA
L_DCC3:
        MVI@    R1,     R0                      ; DCC3   0288
        ANDR    R7,     R2                      ; DCC4   01BA
        ANDR    R7,     R2                      ; DCC5   01BA
        TSTR    R5                              ; DCC6   00AD
        ANDR    R4,     R5                      ; DCC7   01A5
        AND@    R4,     R1                      ; DCC8   03A1
        ANDR    R5,     R1                      ; DCC9   01A9
        TSTR    R5                              ; DCCA   00AD
        MVI@    R1,     R2                      ; DCCB   028A
        MOVR    R5,     R2                      ; DCCC   00AA
L_DCCD:
        MVI@    R1,     R2                      ; DCCD   028A
        ANDR    R5,     R2                      ; DCCE   01AA
        MOVR    R5,     R2                      ; DCCF   00AA
        SLL     R3,     1                       ; DCD0   004B
        ADDR    R3,     R3                      ; DCD1   00DB
        MVO@    R3,     R1                      ; DCD2   024B
L_DCD3:
        ADDR    R3,     R7                      ; DCD3   00DF

        CMPR    R1,     R3                      ; DCD4   014B
        ADDR    R0,     R4                      ; DCD5   00C4
        ADDR    R2,     R5                      ; DCD6   00D5
        ADD     G_01DD, R5                      ; DCD7   02C5 01DD
        ADDR    R3,     R4                      ; DCD9   00DC
        CMP@    R2,     R7                      ; DCDA   0357
        MVO@    R7,     R2                      ; DCDB   0257
        CMP     G_0147, R7                      ; DCDC   0347 0147
        RLC     R3,     2                       ; DCDE   0057
        ADD@    R2,     R4                      ; DCDF   02D4
        XORR    R2,     R5                      ; DCE0   01D5
        ADD     G_01D5, R4                      ; DCE1   02C4 01D5
        ADDR    R2,     R4                      ; DCE3   00D4
        MOVR    R6,     R1                      ; DCE4   00B1
        AND@    R6,     R5                      ; DCE5   03B5
L_DCE6:
        PULR    R1                              ; DCE6   02B1
        DECLE   $01B7                           ; DCE7   01B7

        MOVR    R2,     R7                      ; DCE8   0097

L_DCE9:
        MVI@    R5,     R2                      ; DCE9   02AA
        MVI@    R5,     R2                      ; DCEA   02AA
        MVI@    R3,     R2                      ; DCEB   029A
        ANDR    R5,     R2                      ; DCEC   01AA
        ANDR    R5,     R2                      ; DCED   01AA
L_DCEE:
        ADCR    R3                              ; DCEE   002B
        XOR@    R5,     R3                      ; DCEF   03EB
        ADD@    R4,     R7                      ; DCF0   02E7

        XORR    R5,     R3                      ; DCF1   01EB
        SUBR    R5,     R3                      ; DCF2   012B
        MOVR    R2,     R1                      ; DCF3   0091
        AND@    R6,     R5                      ; DCF4   03B5
        MVI@    R2,     R5                      ; DCF5   0295
        XORR    R2,     R5                      ; DCF6   01D5
        ANDR    R2,     R1                      ; DCF7   0191
        ADCR    R3                              ; DCF8   002B
        CMP@    R5,     R3                      ; DCF9   036B
        MVO@    R7,     R4                      ; DCFA   0267
        CMPR    R5,     R3                      ; DCFB   016B
        SUBR    R5,     R3                      ; DCFC   012B
        MOVR    R1,     R0                      ; DCFD   0088
        MVII    #$02A9, R2                      ; DCFE   02BA 02A9
        ANDR    R5,     R2                      ; DD00   01AA
        MOVR    R1,     R2                      ; DD01   008A
        MVI@    R1,     R3                      ; DD02   028B
L_DD03:
        AND@    R5,     R3                      ; DD03   03AB
        DECLE   $029B,  $01AF,  $01AB,  $00B7   ; DD04   029B 01AF 01AB 00B7
        DECLE   $01B5,  $02B0,  $01BA,  $00BA   ; DD08   01B5 02B0 01BA 00BA
        DECLE   $0355,  $0151,  $0351,  $01D1   ; DD0C   0355 0151 0351 01D1
        DECLE   $00D5,  $01FD,  $00FD,  $02FA   ; DD10   00D5 01FD 00FD 02FA
        DECLE   $01FA,  $00F5,  $00F5,  $03EA   ; DD14   01FA 00F5 00F5 03EA
        DECLE   $03EA,  $01E0,  $00E0,  $03C0   ; DD18   03EA 01E0 00E0 03C0
        DECLE   $00C0,  $0280,  $0180,  $0000   ; DD1C   00C0 0280 0180 0000

        SUB     G_03D5, R0                      ; DD20   0300 03D5
        XOR@    R2,     R5                      ; DD22   03D5
        ANDR    R5,     R3                      ; DD23   01AB
        MOVR    R5,     R3                      ; DD24   00AB
        MVO@    R7,     R2                      ; DD25   0257
        RLC     R3,     2                       ; DD26   0057
        MVI@    R5,     R7                      ; DD27   02AF

        DECLE   $01AF,  $00FF,  $00FF,  $03FF   ; DD28   01AF 00FF 00FF 03FF
        DECLE   $03FF,  $01FF,  $01FF           ; DD2C   03FF 01FF 01FF

        ADDR    R7,     R6                      ; DD2F   00FE
        ADDR    R7,     R6                      ; DD30   00FE
        MVO@    R6,     R3                      ; DD31   025E
        CMPR    R3,     R6                      ; DD32   015E
        MOVR    R7,     R4                      ; DD33   00BC
        ANDI    #$0278, R4                      ; DD34   03BC 0278
        CMPI    #$01F0, R0                      ; DD36   0378 01F0
        ADDR    R6,     R0                      ; DD38   00F0
        CMPR    R3,     R6                      ; DD39   015E
        CMP@    R3,     R6                      ; DD3A   035E
        PULR    R5                              ; DD3B   02B5
        ANDR    R7,     R4                      ; DD3C   01BC
        SARC    R0,     1                       ; DD3D   0078
        CMPR    R7,     R0                      ; DD3E   0178
        XORR    R2,     R5                      ; DD3F   01D5
        ADD@    R6,     R0                      ; DD40   02F0
        XORR    R7,     R6                      ; DD41   01FE
        ADDR    R7,     R6                      ; DD42   00FE
        ADDI    #$03FD, R5                      ; DD43   02FD 03FD
        ADDI    #$01FA, R2                      ; DD45   02FA 01FA
        ADDR    R6,     R5                      ; DD47   00F5
        ADDR    R6,     R5                      ; DD48   00F5
        ADD@    R4,     R0                      ; DD49   02E0
        ADD@    R4,     R0                      ; DD4A   02E0
        CLRR    R0                              ; DD4B   01C0
        ADDR    R0,     R0                      ; DD4C   00C0
        TSTR    R0                              ; DD4D   0080
        AND     .BTAB.00,R0                     ; DD4E   0380 0200
        SUBR    R0,     R0                      ; DD50   0100
        ADDR    R5,     R2                      ; DD51   00EA
        XOR@    R5,     R2                      ; DD52   03EA
        XORR    R2,     R5                      ; DD53   01D5
        ADD@    R2,     R5                      ; DD54   02D5
        ANDR    R5,     R3                      ; DD55   01AB
        MOVR    R5,     R3                      ; DD56   00AB
        CMP@    R2,     R7                      ; DD57   0357
        CMP@    R2,     R7                      ; DD58   0357
        ADDI    #$01FF, R7                      ; DD59   02FF 01FF

        DECLE   $00FF,  $03FF,  $01FF,  $03FF   ; DD5B   00FF 03FF 01FF 03FF
        DECLE   $01FF,  $00FF                   ; DD5F   01FF 00FF

        ANDR    R5,     R6                      ; DD61   01AE
        MVI@    R5,     R6                      ; DD62   02AE
        MVO@    R4,     R3                      ; DD63   025C
        CMPR    R3,     R4                      ; DD64   015C
        ANDR    R7,     R0                      ; DD65   01B8
        MOVR    R7,     R0                      ; DD66   00B8
        CMPR    R6,     R0                      ; DD67   0170
        PSHR    R0                              ; DD68   0270
        ANDR    R5,     R6                      ; DD69   01AE
L_DD6A:
        MOVR    R5,     R6                      ; DD6A   00AE
        DECLE   $0055,  $035C,  $03B8,  $01B8   ; DD6B   0055 035C 03B8 01B8
        DECLE   $0055,  $0270,  $017A,  $027A   ; DD6F   0055 0270 017A 027A

        SUBR    R5,     R5                      ; DD73   012D
        RSWD    R5                              ; DD74   003D
L_DD75:
        SUB@    R3,     R6                      ; DD75   031E
        DECLE   $021E                           ; DD76   021E

        MVO@    R5,     R1                      ; DD77   024D
        SUBR    R1,     R7                      ; DD78   010F

        DECLE   $0007,  $0007,  $0003,  $0003   ; DD79   0007 0007 0003 0003
        DECLE   $0001                           ; DD7D   0001

        BC      L_DE80                          ; DD7E   0201 0100
        B       L_DE2D                          ; DD80   0200 00AB

        DECLE   $00AB,  $02D5,  $01D5,  $02EA   ; DD82   00AB 02D5 01D5 02EA
        DECLE   $00EA,  $00F5,  $02F5,  $01FF   ; DD86   00EA 00F5 02F5 01FF
        DECLE   $02FF,  $00FF,  $00FF,  $02FF   ; DD8A   02FF 00FF 00FF 02FF
        DECLE   $01FF,  $027F,  $007F,  $007A   ; DD8E   01FF 027F 007F 007A
        DECLE   $027A,  $013D,  $023D           ; DD92   027A 013D 023D
L_DD95:
        COMR    R6                              ; DD95   001E
        DECLE   $001E,  $020F,  $010F,  $02BF   ; DD96   001E 020F 010F 02BF
        DECLE   $00BF,  $005F,  $025F,  $01AF   ; DD9A   00BF 005F 025F 01AF

        MVI@    R5,     R7                      ; DD9E   02AF

        RLC     R3,     2                       ; DD9F   0057
        RLC     R3,     2                       ; DDA0   0057
        PSHR    R5                              ; DDA1   0275
        CMPR    R6,     R5                      ; DDA2   0175
        BNOV    L_DD6A                          ; DDA3   022A 003A

        COMR    R5                              ; DDA5   001D
        COMR    R5                              ; DDA6   001D
        MVO@    R2,     R1                      ; DDA7   024A
        SUB@    R1,     R6                      ; DDA8   030E
        SUB     G_0107, R7                      ; DDA9   0307 0107

        DECLE   $0003,  $0003,  $0101,  $0101   ; DDAB   0003 0003 0101 0101
        DECLE   $0000,  $0300,  $0057,  $0257   ; DDAF   0000 0300 0057 0257
        DECLE   $00AB,  $02AB,  $02D5,  $03D5   ; DDB3   00AB 02AB 02D5 03D5
        DECLE   $03EA,  $00EA,  $02FF,  $03FF   ; DDB7   03EA 00EA 02FF 03FF
        DECLE   $01FF,  $01FF,  $00FF,  $02FF   ; DDBB   01FF 01FF 00FF 02FF
        DECLE   $02FF,  $03FF,  $0275,  $0075   ; DDBF   02FF 03FF 0275 0075
        DECLE   $023A,  $023A,  $011D,  $001D   ; DDC3   023A 023A 011D 001D
        DECLE   $000E,  $020E,  $007F,  $007F   ; DDC7   000E 020E 007F 007F
        DECLE   $00BF,  $00BF                   ; DDCB   00BF 00BF

        MVO@    R7,     R3                      ; DDCD   025F
        SLLC    R3,     2                       ; DDCE   005F
        MOVR    R5,     R7                      ; DDCF   00AF
        MOVR    R5,     R7                      ; DDD0   00AF

        ADDR    R2,     R5                      ; DDD1   00D5
        ADD     G_00C0, R0                      ; DDD2   02C0 00C0
        ADDR    R2,     R5                      ; DDD4   00D5
        ADDR    R0,     R0                      ; DDD5   00C0
        ADDR    R0,     R0                      ; DDD6   00C0
        ADD@    R2,     R5                      ; DDD7   02D5
        ADDR    R0,     R0                      ; DDD8   00C0
        XOR     G_01C0, R0                      ; DDD9   03C0 01C0
        XOR     G_01C0, R0                      ; DDDB   03C0 01C0
        ADDR    R0,     R0                      ; DDDD   00C0
        ADD     G_03C0, R0                      ; DDDE   02C0 03C0
        CLRR    R0                              ; DDE0   01C0
        RLC     R1,     2                       ; DDE1   0055
        B       L_DDE4                          ; DDE2   0200 0000

L_DDE4:
        MVO@    R5,     R2                      ; DDE4   0255
        DECLE   $0100,  $0000,  $0055,  $0000   ; DDE5   0100 0000 0055 0000
        DECLE   $0000                           ; DDE9   0000

        B       L_DDEC                          ; DDEA   0200 0000

L_DDEC:
        SUBR    R0,     R0                      ; DDEC   0100
        DECLE   $0200,  $0000,  $0000,  $0300   ; DDED   0200 0000 0000 0300
        DECLE   $0157,  $0103,  $0203,  $0057   ; DDF1   0157 0103 0203 0057
        DECLE   $0303,  $0103,  $0157,  $0303   ; DDF5   0303 0103 0157 0303
        DECLE   $0003,  $0303,  $0003,  $0103   ; DDF9   0003 0303 0003 0103
        DECLE   $0303,  $0103,  $0003,  $0103   ; DDFD   0303 0103 0003 0103
        DECLE   $03C0,  $01D5,  $01C0,  $00C0   ; DE01   03C0 01D5 01C0 00C0
        DECLE   $00D5,  $03C0,  $01C0,  $03D5   ; DE05   00D5 03C0 01C0 03D5
        DECLE   $01C0,  $01C0,  $01C0,  $01C0   ; DE09   01C0 01C0 01C0 01C0
        DECLE   $01C0,  $00C0,  $00C0,  $02C0   ; DE0D   01C0 00C0 00C0 02C0
        DECLE   $0200,  $0155,  $0000,  $0100   ; DE11   0200 0155 0000 0100
        DECLE   $0255,  $0100,  $0000,  $0355   ; DE15   0255 0100 0000 0355
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE19   0000 0000 0000 0000
        DECLE   $0100,  $0000,  $0100,  $0000   ; DE1D   0100 0000 0100 0000
        DECLE   $0103,  $0057,  $0003,  $0103   ; DE21   0103 0057 0003 0103
        DECLE   $0257,  $0103,  $0003,  $0157   ; DE25   0257 0103 0003 0157
        DECLE   $0203                           ; DE29   0203

        BPL     L_DF2F                          ; DE2A   0203 0103

        DIS                                     ; DE2C   0003
L_DE2D:
        DIS                                     ; DE2D   0003
        DECLE   $0303,  $0203,  $0303,  $01AE   ; DE2E   0303 0203 0303 01AE
        DECLE   $01AE,  $035C,  $0255,  $01B8   ; DE32   01AE 035C 0255 01B8
        DECLE   $00B8,  $0170,  $0355,  $00E0   ; DE36   00B8 0170 0355 00E0
        DECLE   $01E0,  $0140,  $0055,  $0080   ; DE3A   01E0 0140 0055 0080
        DECLE   $0280,  $0100,  $0200,  $0000   ; DE3E   0280 0100 0200 0000
        DECLE   $0000,  $0300,  $0155,  $0000   ; DE42   0000 0300 0155 0000
        DECLE   $0100,  $0300,  $0355,  $0100   ; DE46   0100 0300 0355 0100
        DECLE   $0000,  $0100,  $0055,  $0000   ; DE4A   0000 0100 0055 0000
        DECLE   $0300,  $0100,  $0100,  $0007   ; DE4E   0300 0100 0100 0007
        DECLE   $0207,  $0102,  $0056,  $0101   ; DE52   0207 0102 0056 0101
        DECLE   $0001,  $0100,  $0100,  $0275   ; DE56   0001 0100 0100 0275
        DECLE   $0075,  $007A,  $002A,  $011D   ; DE5A   0075 007A 002A 011D
        DECLE   $031D,  $010E,  $005A,  $01AE   ; DE5E   031D 010E 005A 01AE
        DECLE   $03AE,  $0155,  $005C,  $03B8   ; DE62   03AE 0155 005C 03B8
        DECLE   $02B8,  $0155,  $0070,  $00E0   ; DE66   02B8 0155 0070 00E0
        DECLE   $00E0,  $0055,  $0040,  $0180   ; DE6A   00E0 0055 0040 0180
        DECLE   $0180,  $0000,  $0000,  $0100   ; DE6E   0180 0000 0000 0100
        DECLE   $0000,  $0155,  $0000,  $0100   ; DE72   0000 0155 0000 0100
        DECLE   $0300,  $0155,  $0000,  $0300   ; DE76   0300 0155 0000 0300
        DECLE   $0100,  $0155,  $0000,  $0000   ; DE7A   0100 0155 0000 0000

        SUBR    R0,     R0                      ; DE7E   0100
        SUBR    R0,     R0                      ; DE7F   0100
L_DE80:
        SUBR    R0,     R0                      ; DE80   0100
        SETC                                    ; DE81   0007
        SUBR    R0,     R7                      ; DE82   0107

        DECLE   $0056,  $0202,  $0301,  $0101   ; DE83   0056 0202 0301 0101
        DECLE   $0000,  $0300,  $0375,  $0175   ; DE87   0000 0300 0375 0175
        DECLE   $002A,  $011A,  $011D,  $001D   ; DE8B   002A 011A 011D 001D
        DECLE   $014A,  $020E,  $0107,  $0008   ; DE8F   014A 020E 0107 0008
        DECLE   $0303,  $0106,  $0002,  $0126   ; DE93   0303 0106 0002 0126
        DECLE   $0006,  $0108,  $0303,  $0108   ; DE97   0006 0108 0303 0108
        DECLE   $0006,  $020E,  $0003,  $0138   ; DE9B   0006 020E 0003 0138
        DECLE   $0000,  $0238,  $0000,  $0100   ; DE9F   0000 0238 0000 0100
        DECLE   $0100,  $0008,  $0100,  $0218   ; DEA3   0100 0008 0100 0218
        DECLE   $0305,  $0108,  $0001,  $0208   ; DEA7   0305 0108 0001 0208
        DECLE   $0000,  $0300,  $0100,  $0028   ; DEAB   0000 0300 0100 0028
        DECLE   $0100,  $001E,  $0100,  $031A   ; DEAF   0100 001E 0100 031A
        DECLE   $0100,  $002A,  $0200,  $0118   ; DEB3   0100 002A 0200 0118
        DECLE   $0100,  $003C,  $0200           ; DEB7   0100 003C 0200

        SUBR    R1,     R6                      ; DEBA   010E
        EIS                                     ; DEBB   0002
        SUBR    R1,     R0                      ; DEBC   0108
        DIS                                     ; DEBD   0003
        SKIP                                    ; DEBE   0208
        SUBR    R0,     R0                      ; DEBF   0100
        SUBR    R2,     R0                      ; DEC0   0110
        SUBR    R0,     R6                      ; DEC1   0106
        INCR    R4                              ; DEC2   000C
L_DEC3:
        SUBR    R0,     R3                      ; DEC3   0103
        INCR    R4                              ; DEC4   000C
        SUBR    R0,     R7                      ; DEC5   0107

        DECLE   $0308,  $0180,  $0018,  $0380   ; DEC6   0308 0180 0018 0380
        DECLE   $0013,  $0100,  $0000,  $0280   ; DECA   0013 0100 0000 0280
        DECLE   $0134,  $01C0,  $010C,  $0000   ; DECE   0134 01C0 010C 0000
        DECLE   $0000                           ; DED2   0000

        SLL     R1,     2                       ; DED3   004D
        SAR     R0,     1                       ; DED4   0068
        SARC    R1,     1                       ; DED5   0079
        MOVR    R5,     R0                      ; DED6   00A8
        TSTR    R1                              ; DED7   0089
        SLR     R0,     2                       ; DED8   0064
        MOVR    R4,     R1                      ; DED9   00A1
        MOVR    R4,     R2                      ; DEDA   00A2
        MOVR    R4,     R1                      ; DEDB   00A1
        MOVR    R4,     R1                      ; DEDC   00A1
        MOVR    R4,     R3                      ; DEDD   00A3
        MOVR    R4,     R2                      ; DEDE   00A2
        MOVR    R4,     R1                      ; DEDF   00A1
        MOVR    R4,     R1                      ; DEE0   00A1
        MOVR    R4,     R2                      ; DEE1   00A2
        MOVR    R4,     R5                      ; DEE2   00A5
        RLC     R1,     1                       ; DEE3   0051
        MVO@    R5,     R3                      ; DEE4   025D
        SLR     R1,     1                       ; DEE5   0061
        MOVR    R4,     R1                      ; DEE6   00A1
        MOVR    R4,     R2                      ; DEE7   00A2
        MOVR    R4,     R3                      ; DEE8   00A3
        MOVR    R4,     R1                      ; DEE9   00A1
        MOVR    R4,     R1                      ; DEEA   00A1
        MOVR    R4,     R3                      ; DEEB   00A3
        MOVR    R4,     R1                      ; DEEC   00A1
        MOVR    R4,     R2                      ; DEED   00A2
        MOVR    R4,     R1                      ; DEEE   00A1
        MOVR    R4,     R3                      ; DEEF   00A3
        MOVR    R4,     R2                      ; DEF0   00A2
        MOVR    R4,     R1                      ; DEF1   00A1
        MOVR    R4,     R3                      ; DEF2   00A3
        MOVR    R4,     R1                      ; DEF3   00A1
        GSWD    R2                              ; DEF4   0032
        MVO@    R5,     R3                      ; DEF5   025D
        MOVR    R0,     R1                      ; DEF6   0081
        MOVR    R4,     R5                      ; DEF7   00A5
        MOVR    R4,     R2                      ; DEF8   00A2
        MOVR    R4,     R1                      ; DEF9   00A1
        MOVR    R4,     R1                      ; DEFA   00A1
        MOVR    R4,     R2                      ; DEFB   00A2
        MOVR    R4,     R3                      ; DEFC   00A3
        MOVR    R4,     R1                      ; DEFD   00A1
        MOVR    R4,     R1                      ; DEFE   00A1
        MOVR    R4,     R2                      ; DEFF   00A2
        MOVR    R4,     R1                      ; DF00   00A1
        MOVR    R4,     R3                      ; DF01   00A3
        TSTR    R4                              ; DF02   00A4
        TSTR    R4                              ; DF03   00A4
        TSTR    R4                              ; DF04   00A4
        MOVR    R4,     R7                      ; DF05   00A7

        DECLE   $00A5,  $00A4,  $00A4,  $0061   ; DF06   00A5 00A4 00A4 0061
        DECLE   $0057,  $0000,  $0062,  $00A4   ; DF0A   0057 0000 0062 00A4
        DECLE   $00A4,  $00A5,  $00A4,  $00A4   ; DF0E   00A4 00A5 00A4 00A4
        DECLE   $00A5,  $00A4,  $00A4,  $00A4   ; DF12   00A5 00A4 00A4 00A4
        DECLE   $00A5,  $00A4,  $00A4,  $00A5   ; DF16   00A5 00A4 00A4 00A5
        DECLE   $00A4,  $00A4,  $00A5,  $0031   ; DF1A   00A4 00A4 00A5 0031
        DECLE   $0000                           ; DF1E   0000

        RRC     R3,     2                       ; DF1F   0077
        SLR     R1,     1                       ; DF20   0061
        TSTR    R4                              ; DF21   00A4
        TSTR    R4                              ; DF22   00A4
        MOVR    R4,     R5                      ; DF23   00A5
        MOVR    R4,     R7                      ; DF24   00A7

        TSTR    R4                              ; DF25   00A4
        TSTR    R4                              ; DF26   00A4
        TSTR    R4                              ; DF27   00A4
        MOVR    R4,     R3                      ; DF28   00A3
        MOVR    R4,     R1                      ; DF29   00A1
        MOVR    R4,     R7                      ; DF2A   00A7

        RLC     R2,     2                       ; DF2B   0056
        MOVR    R4,     R2                      ; DF2C   00A2
        MOVR    R4,     R1                      ; DF2D   00A1
        MOVR    R4,     R1                      ; DF2E   00A1
L_DF2F:
        SLR     R3,     1                       ; DF2F   0063
        DECLE   $0062,  $0046,  $0000           ; DF30   0062 0046 0000

        SLR     R3,     1                       ; DF33   0063
        TSTR    R4                              ; DF34   00A4
        MOVR    R2,     R6                      ; DF35   0096
        MOVR    R2,     R7                      ; DF36   0097

        MOVR    R2,     R6                      ; DF37   0096
        MOVR    R2,     R6                      ; DF38   0096
        MOVR    R2,     R7                      ; DF39   0097

        MOVR    R2,     R6                      ; DF3A   0096
        MOVR    R2,     R6                      ; DF3B   0096
        MOVR    R2,     R7                      ; DF3C   0097

        MOVR    R2,     R6                      ; DF3D   0096
        MOVR    R2,     R6                      ; DF3E   0096
        MOVR    R2,     R6                      ; DF3F   0096
        MOVR    R2,     R7                      ; DF40   0097

        DECLE   $0096,  $0096,  $0095,  $0096   ; DF41   0096 0096 0095 0096
        DECLE   $00A4,  $0032,  $0000           ; DF45   00A4 0032 0000

        MOVR    R0,     R7                      ; DF48   0087

        SLR     R2,     1                       ; DF49   0062
        SLR     R3,     1                       ; DF4A   0063
        MOVR    R4,     R1                      ; DF4B   00A1
        MOVR    R4,     R1                      ; DF4C   00A1
        RLC     R2,     1                       ; DF4D   0052
        MOVR    R0,     R6                      ; DF4E   0086
        MOVR    R2,     R7                      ; DF4F   0097

        DECLE   $00A1,  $00A1,  $0045,  $0000   ; DF50   00A1 00A1 0045 0000

        TSTR    R4                              ; DF54   00A4
        MOVR    R4,     R5                      ; DF55   00A5
        MOVR    R4,     R7                      ; DF56   00A7

        DECLE   $00A1,  $0045,  $0000           ; DF57   00A1 0045 0000
L_DF5A:
        SLR     R2,     1                       ; DF5A   0062
        DECLE   $00A4,  $0045,  $00B5,  $01B8   ; DF5B   00A4 0045 00B5 01B8
        DECLE   $01D9,  $01D9,  $01D9,  $01D9   ; DF5F   01D9 01D9 01D9 01D9
        DECLE   $01D9,  $01D9,  $01D9,  $01D9   ; DF63   01D9 01D9 01D9 01D9
        DECLE   $01D9,  $01D9,  $01D9,  $01D9   ; DF67   01D9 01D9 01D9 01D9
        DECLE   $01F8,  $01A5,  $0077,  $00A3   ; DF6B   01F8 01A5 0077 00A3
        DECLE   $0032,  $0000                   ; DF6F   0032 0000

        RRC     R1,     2                       ; DF71   0075
        MOVR    R4,     R1                      ; DF72   00A1
        MOVR    R4,     R7                      ; DF73   00A7

        DECLE   $00A5,  $0034,  $0000,  $0073   ; DF74   00A5 0034 0000 0073
        DECLE   $00A4,  $00A1,  $0000,  $0062   ; DF78   00A4 00A1 0000 0062
        DECLE   $0063,  $00A1,  $00A1,  $0046   ; DF7C   0063 00A1 00A1 0046
        DECLE   $0000                           ; DF80   0000

        SLR     R1,     1                       ; DF81   0061
        SLR     R3,     1                       ; DF82   0063
        SWAP    R2,     1                       ; DF83   0042
        ADDR    R4,     R5                      ; DF84   00E5
        ADDR    R2,     R5                      ; DF85   00D5
        XORR    R1,     R0                      ; DF86   01C8
        XORR    R5,     R1                      ; DF87   01E9
        XORR    R5,     R1                      ; DF88   01E9
        XORR    R5,     R1                      ; DF89   01E9
        XORR    R5,     R1                      ; DF8A   01E9
        XORR    R5,     R1                      ; DF8B   01E9
        XORR    R5,     R1                      ; DF8C   01E9
        XORR    R5,     R1                      ; DF8D   01E9
        XORR    R5,     R1                      ; DF8E   01E9
        XORR    R5,     R1                      ; DF8F   01E9
        XORR    R5,     R1                      ; DF90   01E9
L_DF91:
        XORR    R5,     R1                      ; DF91   01E9
        DECLE   $01E9,  $0208,  $0175,  $0185   ; DF92   01E9 0208 0175 0185
        DECLE   $00A4,  $0063,  $0031,  $0000   ; DF96   00A4 0063 0031 0000
        DECLE   $0076,  $00A1,  $00A1,  $0063   ; DF9A   0076 00A1 00A1 0063
        DECLE   $0032,  $0000,  $0071,  $0057   ; DF9E   0032 0000 0071 0057
        DECLE   $0000                           ; DFA2   0000

        MOVR    R4,     R5                      ; DFA3   00A5
        MOVR    R4,     R7                      ; DFA4   00A7

        DECLE   $00A4,  $00A4,  $0057,  $0000   ; DFA5   00A4 00A4 0057 0000
        DECLE   $00A4,  $00A5,  $0056,  $00B5   ; DFA9   00A4 00A5 0056 00B5
        DECLE   $00F5,  $000A,  $000A,  $000A   ; DFAD   00F5 000A 000A 000A
        DECLE   $000A,  $000A,  $000A,  $000A   ; DFB1   000A 000A 000A 000A
        DECLE   $000A,  $000A,  $000A,  $000A   ; DFB5   000A 000A 000A 000A
        DECLE   $000A,  $000A,  $000A,  $0195   ; DFB9   000A 000A 000A 0195
        DECLE   $01A5,  $0077,  $00A5,  $00A4   ; DFBD   01A5 0077 00A5 00A4
        DECLE   $0000                           ; DFC1   0000

        MOVR    R0,     R7                      ; DFC2   0087

        TSTR    R4                              ; DFC3   00A4
        TSTR    R4                              ; DFC4   00A4
        MOVR    R4,     R7                      ; DFC5   00A7

        DECLE   $00A5,  $0000,  $0087,  $0000   ; DFC6   00A5 0000 0087 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFCE   0000 0000 0000 0000
        DECLE   $0000,  $00E5,  $00D5,  $00C5   ; DFD2   0000 00E5 00D5 00C5
        DECLE   $000A,  $000A,  $000A,  $000A   ; DFD6   000A 000A 000A 000A
        DECLE   $000A,  $000A,  $000A,  $000A   ; DFDA   000A 000A 000A 000A
        DECLE   $000A,  $000A,  $000A,  $000A   ; DFDE   000A 000A 000A 000A
        DECLE   $000A,  $000A,  $0165,  $0175   ; DFE2   000A 000A 0165 0175
        DECLE   $0185,  $0000,  $0000,  $0000   ; DFE6   0185 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF6   0000 0000 0000 0000
        DECLE   $0000                           ; DFFA   0000

        COMR    R0                              ; DFFB   0018
        SUBR    R0,     R5                      ; DFFC   0105
        SUBR    R4,     R5                      ; DFFD   0125
        SUBR    R4,     R5                      ; DFFE   0125
        SUBR    R4,     R5                      ; DFFF   0125

        ORG     $F000
        DECLE   $0125,  $0125,  $0125,  $0125   ; F000   0125 0125 0125 0125
        DECLE   $0125,  $0125,  $0125,  $0125   ; F004   0125 0125 0125 0125
        DECLE   $0125,  $0125,  $0125,  $0125   ; F008   0125 0125 0125 0125
        DECLE   $0125,  $0155,  $0008,  $0000   ; F00C   0125 0155 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F010   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F014   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F018   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F01C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F020   0000 0000 0000 0018
        DECLE   $0115,  $0135,  $0135,  $0135   ; F024   0115 0135 0135 0135
        DECLE   $0135,  $0135,  $0135,  $0135   ; F028   0135 0135 0135 0135
        DECLE   $0135,  $0135,  $0135,  $0135   ; F02C   0135 0135 0135 0135
        DECLE   $0135,  $0135,  $0135,  $0135   ; F030   0135 0135 0135 0135
        DECLE   $0135,  $0145,  $0008,  $0000   ; F034   0135 0145 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F038   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F03C   0000 0000 0000 0000
        DECLE   $0000,  $00A5,  $0062,  $00A1   ; F040   0000 00A5 0062 00A1
        DECLE   $0063,  $0046,  $0000,  $0000   ; F044   0063 0046 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F048   0000 0000 0000 0018
        DECLE   $0028,  $0028,  $023C,  $0028   ; F04C   0028 0028 023C 0028
        DECLE   $0028,  $0028,  $0028,  $0028   ; F050   0028 0028 0028 0028
        DECLE   $021B,  $022B,  $0028,  $0028   ; F054   021B 022B 0028 0028
        DECLE   $0028,  $0028,  $0028,  $024C   ; F058   0028 0028 0028 024C
        DECLE   $0028,  $0028,  $0008,  $0000   ; F05C   0028 0028 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F060   0000 0000 0000 0000

        RRC     R2,     2                       ; F064   0076
        SLR     R3,     1                       ; F065   0063
        MOVR    R4,     R1                      ; F066   00A1
        SLR     R2,     1                       ; F067   0062
        MOVR    R4,     R5                      ; F068   00A5
        SLR     R3,     1                       ; F069   0063
        MOVR    R2,     R7                      ; F06A   0097

        DECLE   $00A4,  $0062,  $0057,  $0000   ; F06B   00A4 0062 0057 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F06F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F073   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F077   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F07B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F07F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F083   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F087   0000 0000 0000 0000
        DECLE   $0000                           ; F08B   0000

        MOVR    R0,     R1                      ; F08C   0081
        SLR     R2,     1                       ; F08D   0062
        TSTR    R4                              ; F08E   00A4
        MOVR    R2,     R7                      ; F08F   0097

        DECLE   $0063,  $00A2,  $00A4,  $0063   ; F090   0063 00A2 00A4 0063
        DECLE   $0045,  $0000,  $0000,  $0000   ; F094   0045 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F098   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F09C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0B0   0000 0000 0000 0000
        DECLE   $0000                           ; F0B4   0000

        SWAP    R1,     2                       ; F0B5   0045
        SLR     R3,     1                       ; F0B6   0063
        TSTR    R4                              ; F0B7   00A4
        MOVR    R4,     R2                      ; F0B8   00A2
        MVI@    R5,     R0                      ; F0B9   02A8
        PSHR    R5                              ; F0BA   0275
        MVII    #$0001, R5                      ; F0BB   02BD 0001
        MVO     R5,     G_0147                  ; F0BD   0245 0147
        MOVR    R7,     R4                      ; F0BF   00BC
        ADDI    #$000B, R4                      ; F0C0   02FC 000B
        ADDR    R0,     R4                      ; F0C2   00C4
        ADDR    R0,     R4                      ; F0C3   00C4
        ADDR    R0,     R4                      ; F0C4   00C4
        MVI@    R4,     R3                      ; F0C5   02A3
        SDBD                                    ; F0C6   0001
        MVI@    R4,     R5                      ; F0C7   02A5
        J       .EXEC.BBF                       ; F0C8   0004 0318 03BF

        DECLE   $00C8,  $0035,  $00A1,  $0064   ; F0CB   00C8 0035 00A1 0064
        DECLE   $0083,  $00A1,  $00BE,  $00D9   ; F0CF   0083 00A1 00BE 00D9
        DECLE   $001E,  $0064,  $00D9,  $001E   ; F0D3   001E 0064 00D9 001E
        DECLE   $00C8,  $002D,  $00A1,  $00C8   ; F0D7   00C8 002D 00A1 00C8
        DECLE   $0031,  $00A1,  $00C8,  $0025   ; F0DB   0031 00A1 00C8 0025
        DECLE   $00A1,  $00C8,  $0029,  $00A1   ; F0DF   00A1 00C8 0029 00A1
        DECLE   $00C8,  $0075,  $00A1,  $0064   ; F0E3   00C8 0075 00A1 0064
        DECLE   $00BB,  $0067,  $0064,  $00C0   ; F0E7   00BB 0067 0064 00C0
        DECLE   $0067,  $0064,  $00C5,  $0067   ; F0EB   0067 0064 00C5 0067
        DECLE   $00F0,  $00D9,  $001E,  $005A   ; F0EF   00F0 00D9 001E 005A
        DECLE   $0094,  $00A1,  $00AA,  $00A9   ; F0F3   0094 00A1 00AA 00A9
        DECLE   $00A1,  $0064,  $00B5,  $00A1   ; F0F7   00A1 0064 00B5 00A1
        DECLE   $0064,  $00C4,  $00A1,  $0064   ; F0FB   0064 00C4 00A1 0064
        DECLE   $00D5,  $00A1,  $005A,  $00E2   ; F0FF   00D5 00A1 005A 00E2
        DECLE   $00A1,  $006E,  $0034,  $00A2   ; F103   00A1 006E 0034 00A2
        DECLE   $0064,  $00F1,  $00A1,  $00B5   ; F107   0064 00F1 00A1 00B5
        DECLE   $0003,  $00A2,  $00B5,  $0010   ; F10B   0003 00A2 00B5 0010
        DECLE   $00A2,  $0064,  $001F           ; F10F   00A2 0064 001F

        MOVR    R4,     R2                      ; F112   00A2
        ADDR    R4,     R6                      ; F113   00E6
        SLR     R2,     1                       ; F114   0062
        MOVR    R4,     R1                      ; F115   00A1
        ADDR    R4,     R6                      ; F116   00E6
        SLR     R1,     2                       ; F117   0065
        MOVR    R4,     R1                      ; F118   00A1
        MOVR    R2,     R6                      ; F119   0096
        MOVR    R6,     R3                      ; F11A   00B3
        SLR     R3,     2                       ; F11B   0067
        ADDR    R3,     R4                      ; F11C   00DC
        RSWD    R5                              ; F11D   003D
        MOVR    R4,     R1                      ; F11E   00A1
        SLR     R0,     2                       ; F11F   0064
        SLL     R0,     1                       ; F120   0048
        MOVR    R4,     R2                      ; F121   00A2
        SLR     R0,     2                       ; F122   0064
        SLLC    R0,     1                       ; F123   0058
        MOVR    R4,     R1                      ; F124   00A1
        SUB     G_00BE, R0                      ; F125   0300 00BE
        SAR     R3,     1                       ; F127   006B
        ADD@    R1,     R7                      ; F128   02CF

        SUB     G_017C, R0                      ; F129   0300 017C
        SAR     R3,     1                       ; F12B   006B
        ADD@    R1,     R7                      ; F12C   02CF

        SUB     G_007F, R0                      ; F12D   0300 007F
        SAR     R3,     1                       ; F12F   006B
        ADD@    R1,     R7                      ; F130   02CF

        SUB     .PSG1.rgt_hand,R0               ; F131   0300 00FE
        SAR     R3,     1                       ; F133   006B
        ADD@    R1,     R7                      ; F134   02CF

        SUB     G_008F, R0                      ; F135   0300 008F
        SAR     R3,     1                       ; F137   006B
        ADD@    R1,     R7                      ; F138   02CF

        SUB     G_011E, R0                      ; F139   0300 011E
        SAR     R3,     1                       ; F13B   006B
        ADD@    R1,     R7                      ; F13C   02CF

        DECLE   $03E9,  $0300,  $0078,  $009B   ; F13D   03E9 0300 0078 009B
        DECLE   $0001,  $03F4,  $0057,  $007A   ; F141   0001 03F4 0057 007A
        DECLE   $0001,  $0000                   ; F145   0001 0000
L_F147:
        DECR    R7                              ; F147   0017

        DECLE   $002D,  $0005                   ; F148   002D 0005
L_F14A:
        DECR    R7                              ; F14A   0017

        DECLE   $0021,  $0300,  $0082,  $005B   ; F14B   0021 0300 0082 005B
        DECLE   $0001,  $03F4,  $0057,  $0052   ; F14F   0001 03F4 0057 0052
        DECLE   $0001                           ; F153   0001

        INCR    R4                              ; F154   000C
        RLC     R3,     2                       ; F155   0057
        MOVR    R4,     R2                      ; F156   00A2
        ADD@    R1,     R7                      ; F157   02CF

        DECLE   $0279,  $01B7,  $010D,  $0387   ; F158   0279 01B7 010D 0387

        COMR    R4                              ; F15C   001C
        XOR@    R2,     R0                      ; F15D   03D0
        AND@    R1,     R3                      ; F15E   038B
        MOVR    R1,     R7                      ; F15F   008F

        DECLE   $0027,  $02CF,  $011D,  $0003   ; F160   0027 02CF 011D 0003
        DECLE   $0004,  $019D,  $0389,  $0040   ; F164   0004 019D 0389 0040
        DECLE   $00F0,  $0048,  $0072,  $0044   ; F168   00F0 0048 0072 0044
        DECLE   $0035                           ; F16C   0035

        SLLC    R0,     2                       ; F16D   005C
        CMP@    R6,     R0                      ; F16E   0370
        INCR    R3                              ; F16F   000B
        MVO     R3,     G_03F4                  ; F170   0243 03F4
        MOVR    R1,     R7                      ; F172   008F

        GSWD    R1                              ; F173   0031
        ADD@    R1,     R7                      ; F174   02CF

        DECLE   $03C9,  $0300,  $0080,  $0308   ; F175   03C9 0300 0080 0308
        DECLE   $0082,  $019D,  $0305,  $0325   ; F179   0082 019D 0305 0325
        DECLE   $006B,  $0005                   ; F17D   006B 0005

        NEGR    R5                              ; F17F   0025
        SWAP    R3,     1                       ; F180   0043
        XOR@    R4,     R4                      ; F181   03E4
        ADD@    R1,     R7                      ; F182   02CF

        DECLE   $03E9,  $0340,  $02BC,  $005B   ; F183   03E9 0340 02BC 005B
        DECLE   $0073,  $0060,  $0345,  $0001   ; F187   0073 0060 0345 0001
        DECLE   $01FC,  $002B,  $01C5,  $0001   ; F18B   01FC 002B 01C5 0001
        DECLE   $0220,  $0023,  $03DC,  $0003   ; F18F   0220 0023 03DC 0003
        DECLE   $03C0,  $03C9,  $0050,  $00B0   ; F193   03C0 03C9 0050 00B0
        DECLE   $0058,  $00A6,  $00DB,  $0001   ; F197   0058 00A6 00DB 0001
        DECLE   $03E8,  $006C,  $0290,  $000B   ; F19B   03E8 006C 0290 000B
        DECLE   $004F,  $000C,  $0001,  $0396   ; F19F   004F 000C 0001 0396
        DECLE   $00AB,  $0001                   ; F1A3   00AB 0001

        SLL     R2,     1                       ; F1A5   004A
        SLR     R3,     1                       ; F1A6   0063
        XOR@    R4,     R4                      ; F1A7   03E4
        ADD@    R1,     R7                      ; F1A8   02CF

        DECLE   $0035                           ; F1A9   0035

        ADCR    R3                              ; F1AA   002B
        ADD@    R5,     R1                      ; F1AB   02E9
        XOR@    R1,     R5                      ; F1AC   03CD
        INCR    R7                              ; F1AD   000F

        DECLE   $03FF                           ; F1AE   03FF
L_F1AF:
        SLLC    R0,     2                       ; F1AF   005C
        DECLE   $0370,  $0137,  $000B,  $0003   ; F1B0   0370 0137 000B 0003
        DECLE   $0005,  $03E9,  $0300,  $0078   ; F1B4   0005 03E9 0300 0078
        DECLE   $019B,  $0001,  $03FC,  $034F   ; F1B8   019B 0001 03FC 034F
        DECLE   $0046,  $0023,  $03FB,  $0001   ; F1BC   0046 0023 03FB 0001
        DECLE   $0004,  $008F,  $0383,  $02CF   ; F1C0   0004 008F 0383 02CF
        DECLE   $003D,  $0389,  $0350,  $0178   ; F1C4   003D 0389 0350 0178
        DECLE   $0358,  $0182,  $0001,  $03FC   ; F1C8   0358 0182 0001 03FC
        DECLE   $0001,  $03FE,  $0345,  $0365   ; F1CC   0001 03FE 0345 0365
        DECLE   $002B,  $0005,  $0025,  $0023   ; F1D0   002B 0005 0025 0023
        DECLE   $03E5,  $0279,  $01B7,  $03CD   ; F1D4   03E5 0279 01B7 03CD
        DECLE   $000F                           ; F1D8   000F

        XORI    #$000C, R0                      ; F1D9   03F8 000C
        SUBR    R5,     R4                      ; F1DB   012C
        DECR    R3                              ; F1DC   0013
        SARC    R0,     2                       ; F1DD   007C
        INCR    R3                              ; F1DE   000B
        NEGR    R3                              ; F1DF   0023
        XOR@    R6,     R4                      ; F1E0   03F4
        ADD@    R1,     R7                      ; F1E1   02CF

        DECLE   $03E9,  $00B7                   ; F1E2   03E9 00B7

        SLL     R3,     2                       ; F1E4   004F
        INCR    R2                              ; F1E5   000A
        RSWD    R4                              ; F1E6   003C
        AND@    R4,     R0                      ; F1E7   03A0
        INCR    R3                              ; F1E8   000B
        SWAP    R0,     1                       ; F1E9   0040
        SUBR    R5,     R4                      ; F1EA   012C
        SAR     R3,     1                       ; F1EB   006B
        SWAP    R0,     1                       ; F1EC   0040
        MOVR    R2,     R6                      ; F1ED   0096
        SWAP    R3,     1                       ; F1EE   0043
        XOR@    R4,     R4                      ; F1EF   03E4
        ADD@    R1,     R7                      ; F1F0   02CF

        ADD@    R5,     R1                      ; F1F1   02E9
        ANDR    R2,     R0                      ; F1F2   0190
        SUBR    R2,     R4                      ; F1F3   0114
        SLLC    R3,     1                       ; F1F4   005B
        SDBD                                    ; F1F5   0001
        XOR@    R1,     R4                      ; F1F6   03CC
        CLRR    R5                              ; F1F7   01ED
        ADDR    R0,     R7                      ; F1F8   00C7

        DECLE   $0062,  $0165,  $005A,  $02EB   ; F1F9   0062 0165 005A 02EB
        DECLE   $0001                           ; F1FD   0001

        SLL     R0,     2                       ; F1FE   004C
        AND@    R4,     R2                      ; F1FF   03A2
        XOR@    R3,     R2                      ; F200   03DA
        XOR@    R5,     R3                      ; F201   03EB
        ADD@    R1,     R7                      ; F202   02CF

        DECLE   $0389,  $03C0,  $01C0,  $03D8   ; F203   0389 03C0 01C0 03D8
        DECLE   $0000                           ; F207   0000

        XOR@    R2,     R4                      ; F208   03D4
        B       L_F366                          ; F209   0200 015B

        DECLE   $03CE,  $0001                   ; F20B   03CE 0001

        XORR    R4,     R3                      ; F20D   01E3
        AND@    R5,     R3                      ; F20E   03AB
        ADD@    R1,     R7                      ; F20F   02CF

        DECLE   $0379,  $005C,  $0370,  $00B7   ; F210   0379 005C 0370 00B7

        INCR    R3                              ; F214   000B
        SLL     R3,     2                       ; F215   004F
        INCR    R4                              ; F216   000C
        XOR@    R5,     R5                      ; F217   03ED
        ADDR    R0,     R7                      ; F218   00C7

        SAR     R3,     1                       ; F219   006B
        BGE     L_F2E3                          ; F21A   020D 00C7

        NEGR    R3                              ; F21C   0023
        XOR@    R4,     R4                      ; F21D   03E4
        ADD@    R1,     R7                      ; F21E   02CF

        DECLE   $03C9,  $0040,  $0028,  $0048   ; F21F   03C9 0040 0028 0048
        DECLE   $002A,  $011B,  $001D,  $000C   ; F223   002A 011B 001D 000C
        DECLE   $01CB,  $038B,  $0001,  $0008   ; F227   01CB 038B 0001 0008
        DECLE   $0001,  $000A,  $01EB,  $0001   ; F22B   0001 000A 01EB 0001
        DECLE   $03F8,  $0001,  $03FA,  $0103   ; F22F   03F8 0001 03FA 0103
        DECLE   $03D4,  $03C9,  $0240,  $0384   ; F233   03D4 03C9 0240 0384
        DECLE   $0248,  $0388,  $0001,  $03D8   ; F237   0248 0388 0001 03D8
        DECLE   $0001,  $03DA,  $0062,  $006A   ; F23B   0001 03DA 0062 006A
        DECLE   $01AB,  $0001,  $0050,  $0001   ; F23F   01AB 0001 0050 0001

        SLLC    R2,     1                       ; F243   005A
        XOR     G_03CA, R2                      ; F244   03C2 03CA
        MOVR    R1,     R7                      ; F246   008F

        COMR    R1                              ; F247   0019
        ADD@    R1,     R7                      ; F248   02CF

        DECLE   $02B5,  $00D5,  $0023,  $0112   ; F249   02B5 00D5 0023 0112
        DECLE   $02D5,  $0021,  $0031,  $0021   ; F24D   02D5 0021 0031 0021
        DECLE   $0031,  $0075,  $0311,  $0311   ; F251   0031 0075 0311 0311
        DECLE   $02D5,  $0023,  $0001,  $0011   ; F255   02D5 0023 0001 0011
        DECLE   $0001                           ; F259   0001

        DECR    R1                              ; F25A   0011
        RRC     R1,     2                       ; F25B   0075
L_F25C:
        SUB@    R2,     R1                      ; F25C   0311
        DECLE   $0311,  $0137,  $0385,  $02E5   ; F25D   0311 0137 0385 02E5
        DECLE   $0065,  $00D5,  $0004,  $0002   ; F261   0065 00D5 0004 0002
        DECLE   $00B1,  $0055,  $00A5,  $0025   ; F265   00B1 0055 00A5 0025
        DECLE   $0080,  $0082,  $0255,  $00D3   ; F269   0080 0082 0255 00D3
        DECLE   $0025,  $000E,  $0070,  $0295   ; F26D   0025 000E 0070 0295
        DECLE   $0011,  $0065,  $02E5,  $0014   ; F271   0011 0065 02E5 0014
        DECLE   $0375,  $0095,  $00D5,  $0012   ; F275   0375 0095 00D5 0012
        DECLE   $02A5,  $03F6,  $0002,  $0235   ; F279   02A5 03F6 0002 0235
        DECLE   $02A5,  $02E5,  $03F4,  $0062   ; F27D   02A5 02E5 03F4 0062
        DECLE   $0305,  $01F5,  $0111,  $0141   ; F281   0305 01F5 0111 0141
        DECLE   $0151,  $0161,  $02C5,  $00B1   ; F285   0151 0161 02C5 00B1
        DECLE   $0010,  $0295,  $0005,  $01A7   ; F289   0010 0295 0005 01A7
        DECLE   $0075,  $0040,  $02E5,  $0065   ; F28D   0075 0040 02E5 0065
        DECLE   $0198,  $0199,  $0022,  $0061   ; F291   0198 0199 0022 0061
        DECLE   $0071,  $0081,  $0091,  $004B   ; F295   0071 0081 0091 004B
        DECLE   $0067,  $0055,  $00D5,  $02E5   ; F299   0067 0055 00D5 02E5
        DECLE   $03F4,  $0062,  $00F1,  $0125   ; F29D   03F4 0062 00F1 0125
        DECLE   $0002,  $00E1,  $0125,  $0005   ; F2A1   0002 00E1 0125 0005
        DECLE   $00F1,  $0125,  $0003,  $00E1   ; F2A5   00F1 0125 0003 00E1
        DECLE   $0002,  $0004,  $01E5,  $0005   ; F2A9   0002 0004 01E5 0005
        DECLE   $0101,  $00D5,  $0082,  $0245   ; F2AD   0101 00D5 0082 0245
        DECLE   $0121,  $0131,  $0027,  $0173   ; F2B1   0121 0131 0027 0173
        DECLE   $006C,  $00C2,  $0211,  $0082   ; F2B5   006C 00C2 0211 0082
        DECLE   $0221,  $0075,  $0211,  $0062   ; F2B9   0221 0075 0211 0062
        DECLE   $0241,  $00A2,  $0231,  $0075   ; F2BD   0241 00A2 0231 0075
        DECLE   $00B7,  $0270,  $03F4,  $0113   ; F2C1   00B7 0270 03F4 0113
        DECLE   $0185,  $0232,  $0122,  $0056   ; F2C5   0185 0232 0122 0056
        DECLE   $0241,  $0030,  $0086,  $00E5   ; F2C9   0241 0030 0086 00E5
        DECLE   $0185,  $0290,  $0135,  $016D   ; F2CD   0185 0290 0135 016D
        DECLE   $00E3,  $03F4,  $01B5,  $0065   ; F2D1   00E3 03F4 01B5 0065
        DECLE   $005A,  $0062,  $0171,  $0181   ; F2D5   005A 0062 0171 0181
        DECLE   $0027                           ; F2D9   0027

        ANDR    R0,     R5                      ; F2DA   0185
        MVI     G_0135, R0                      ; F2DB   0280 0135
        MOVR    R3,     R6                      ; F2DD   009E
        ADDR    R0,     R7                      ; F2DE   00C7

        MVI@    R2,     R5                      ; F2DF   0295
        INCR    R3                              ; F2E0   000B
        XOR@    R6,     R4                      ; F2E1   03F4
        ADDR    R2,     R5                      ; F2E2   00D5
L_F2E3:
        EIS                                     ; F2E3   0002
        DECLE   $02A5,  $0295,  $0005           ; F2E4   02A5 0295 0005

        SLR     R3,     2                       ; F2E7   0067
        MVI@    R2,     R5                      ; F2E8   0295
        DECR    R1                              ; F2E9   0011
        MOVR    R2,     R7                      ; F2EA   0097

        DECLE   $0052,  $0045,  $0055,  $0051   ; F2EB   0052 0045 0055 0051
        DECLE   $0371,  $0051,  $02E1,  $0051   ; F2EF   0371 0051 02E1 0051
        DECLE   $0047,  $0010,  $0062,  $01F1   ; F2F3   0047 0010 0062 01F1
        DECLE   $0201,  $0027,  $0295,  $001F   ; F2F7   0201 0027 0295 001F
        DECLE   $01A7,  $0295,  $0026,  $01D7   ; F2FB   01A7 0295 0026 01D7
        DECLE   $0295,  $002F,  $0207,  $0034   ; F2FF   0295 002F 0207 0034
        DECLE   $01B5,  $0142,  $02A1,  $0161   ; F303   01B5 0142 02A1 0161
        DECLE   $00A0,  $00E3,  $00B5,  $0135   ; F307   00A0 00E3 00B5 0135
        DECLE   $00BE,  $03A7                   ; F30B   00BE 03A7

        ADDR    R4,     R3                      ; F30D   00E3
        CMP     .BTAB.94,R7                     ; F30E   0347 0294
        RRC     R0,     1                       ; F310   0070
        MVI@    R2,     R5                      ; F311   0295
        NEGR    R1                              ; F312   0021
        SUB@    R4,     R7                      ; F313   0327

        JSRE    R4,     L_641B                  ; F314   0004 0065 001B
        DECLE   $0238,  $0099,  $0042,  $00B1   ; F317   0238 0099 0042 00B1
        DECLE   $00C1,  $0027,  $03F4,  $0096   ; F31B   00C1 0027 03F4 0096
        DECLE   $0072,  $0093,  $0185,  $0238   ; F31F   0072 0093 0185 0238

        MVI     .STIC.A.0,R1                    ; F323   0281 0010
        XOR@    R6,     R4                      ; F325   03F4
        MOVR    R6,     R3                      ; F326   00B3
        MOVR    R2,     R6                      ; F327   0096
        ANDR    R0,     R5                      ; F328   0185
        ADD     G_0162, R0                      ; F329   02C0 0162
        MVI     G_0050, R1                      ; F32B   0281 0050
        ADDR    R2,     R5                      ; F32D   00D5

        JSRE    R4,     L_6512                  ; F32E   0004 0065 0112
        DECLE   $0001,  $0011,  $0027,  $03F4   ; F331   0001 0011 0027 03F4
        DECLE   $01F5,  $0062,  $0125,  $0203   ; F335   01F5 0062 0125 0203
        DECLE   $00F1,  $0125,  $0205,  $00E1   ; F339   00F1 0125 0205 00E1
        DECLE   $0125,  $0202,  $00F1           ; F33D   0125 0202 00F1

        SUBR    R2,     R5                      ; F340   0115
        EIS                                     ; F341   0002
        ADDR    R4,     R1                      ; F342   00E1
        DECR    R0                              ; F343   0010
        XOR@    R6,     R4                      ; F344   03F4
        RLC     R1,     2                       ; F345   0055
        XORR    R6,     R5                      ; F346   01F5
        ADDR    R2,     R5                      ; F347   00D5
        SLR     R2,     1                       ; F348   0062
L_F349:
        ADDR    R4,     R1                      ; F349   00E1
        SUBR    R4,     R5                      ; F34A   0125

        JSRE    R5,     .EXEC.125               ; F34B   0004 0111 0125
        DECLE   $0005,  $0111,  $0035           ; F34E   0005 0111 0035

        CMPR    R0,     R1                      ; F351   0141
        CMPR    R2,     R1                      ; F352   0151
        CMPR    R4,     R1                      ; F353   0161
        SLR     R1,     2                       ; F354   0065
        SUBR    R2,     R5                      ; F355   0115
        BNC     L_F63D                          ; F356   0209 02E5

        MOVR    R6,     R1                      ; F358   00B1
        DECR    R0                              ; F359   0010
        XOR@    R6,     R4                      ; F35A   03F4
        SUBR    R2,     R5                      ; F35B   0115
L_F35C:
        BC      L_F3B3                          ; F35C   0201 0055

        DECLE   $00D5,  $0062,  $0161,  $0151   ; F35E   00D5 0062 0161 0151
        DECLE   $0141,  $0111,  $0115,  $0001   ; F362   0141 0111 0115 0001
L_F366:
        SWAP    R1,     2                       ; F366   0045
        DECLE   $0111,  $0115,  $0005,  $00E1   ; F367   0111 0115 0005 00E1
        DECLE   $0115,  $0004,  $01E5,  $0014   ; F36B   0115 0004 01E5 0014
        DECLE   $0010,  $0195,  $0335,  $0205   ; F36F   0010 0195 0335 0205
        DECLE   $0105,  $0208,  $0265,  $00A6   ; F373   0105 0208 0265 00A6
        DECLE   $0013,  $009D,  $0090,  $0345   ; F377   0013 009D 0090 0345
        DECLE   $001D,  $0010,  $03F4,  $00F5   ; F37B   001D 0010 03F4 00F5
        DECLE   $00D5,  $00E5,  $0162,  $0001   ; F37F   00D5 00E5 0162 0001
        DECLE   $0193,  $0011,  $0001,  $00C3   ; F383   0193 0011 0001 00C3
        DECLE   $007C,  $0135,  $00D2,  $0002   ; F387   007C 0135 00D2 0002
        DECLE   $0001                           ; F38B   0001

        TSTR    R6                              ; F38C   00B6
        RLC     R3,     2                       ; F38D   0057
L_F38E:
        CMPR    R0,     R2                      ; F38E   0142
        DECLE   $0001,  $02F5,  $0305,  $01F5   ; F38F   0001 02F5 0305 01F5
        DECLE   $00D5,  $0135,  $0132,  $0092   ; F393   00D5 0135 0132 0092
        DECLE   $0011,  $0215,  $0143,  $0002   ; F397   0011 0215 0143 0002
        DECLE   $0011,  $0010,  $03F4,  $003E   ; F39B   0011 0010 03F4 003E
        DECLE   $00E3,  $0180,  $03F4,  $0072   ; F39F   00E3 0180 03F4 0072
        DECLE   $00D5,  $0281,  $0050,  $0030   ; F3A3   00D5 0281 0050 0030
        DECLE   $00D5,  $0005                   ; F3A7   00D5 0005

        BLT     L_F700                          ; F3A9   0205 0355

        SUBR    R4,     R5                      ; F3AB   0125
        EIS                                     ; F3AC   0002
        MOVR    R2,     R5                      ; F3AD   0095
        CMPR    R2,     R3                      ; F3AE   0153
        MOVR    R4,     R2                      ; F3AF   00A2
        ADD@    R4,     R1                      ; F3B0   02E1
        XORR    R4,     R5                      ; F3B1   01E5
        DIS                                     ; F3B2   0003
L_F3B3:
        EIS                                     ; F3B3   0002
        DECLE   $02E1,  $0040,  $0135,  $00F7   ; F3B4   02E1 0040 0135 00F7

        RLC     R3,     2                       ; F3B8   0057
        ADDR    R4,     R3                      ; F3B9   00E3
        ADDR    R0,     R5                      ; F3BA   00C5
        XOR@    R6,     R4                      ; F3BB   03F4
        RSWD    R2                              ; F3BC   003A
        SUBR    R6,     R5                      ; F3BD   0135
        ADDR    R2,     R2                      ; F3BE   00D2
        EIS                                     ; F3BF   0002
        SUB     G_00D5, R1                      ; F3C0   0301 00D5
        ANDR    R2,     R5                      ; F3C2   0195
        SUB@    R2,     R5                      ; F3C3   0315
        BLT     L_F71B                          ; F3C4   0205 0355

        SUBR    R0,     R5                      ; F3C6   0105
        BLE     L_F536                          ; F3C7   0206 016D

        CMPR    R0,     R2                      ; F3C9   0142
        MVO@    R1,     R4                      ; F3CA   0261
        SUBR    R0,     R5                      ; F3CB   0105
        BEQ     L_F6EF                          ; F3CC   0204 0321

        ANDR    R0,     R5                      ; F3CE   0185
        B       L_F38E                          ; F3CF   0220 0042

        DECLE   $00B1,  $00C1,  $00B1,  $02C5   ; F3D1   00B1 00C1 00B1 02C5
        DECLE   $0010,  $0085,  $010D,  $0165   ; F3D5   0010 0085 010D 0165
        DECLE   $0011,  $0355,  $0145,  $0001   ; F3D9   0011 0355 0145 0001
L_F3DD:
        BOV     L_F3DD                          ; F3DD   0222 0001

        DECLE   $0225,  $000E,  $00F3,  $018D   ; F3DF   0225 000E 00F3 018D
        DECLE   $0012,  $0001,  $0102,  $01B5   ; F3E3   0012 0001 0102 01B5
        DECLE   $00D1,  $02C5,  $0010,  $00BD   ; F3E7   00D1 02C5 0010 00BD
        DECLE   $01E2,  $0105,  $0004,  $0225   ; F3EB   01E2 0105 0004 0225

        PSHR    R1                              ; F3EF   0271
        ADD     .STIC.A.0,R5                    ; F3F0   02C5 0010
L_F3F2:
        CMPR    R1,     R5                      ; F3F2   014D
        DECLE   $0145,  $0003,  $0355,  $0165   ; F3F3   0145 0003 0355 0165
        DECLE   $0002,  $00F2,  $0251,  $0145   ; F3F7   0002 00F2 0251 0145
        DECLE   $0006,  $0165,  $0202,  $01D5   ; F3FB   0006 0165 0202 01D5
        DECLE   $0001,  $0082,  $02C1,  $0022   ; F3FF   0001 0082 02C1 0022
        DECLE   $02D1,  $00A3,  $0225,  $0067   ; F403   02D1 00A3 0225 0067
        DECLE   $027D,  $03A7                   ; F407   027D 03A7

        MVI@    R2,     R5                      ; F409   0295
        INCR    R2                              ; F40A   000A
        ADDR    R6,     R3                      ; F40B   00F3
        RSWD    R2                              ; F40C   003A
        MVI@    R1,     R0                      ; F40D   0288
        CMPR    R7,     R1                      ; F40E   0179
        SUBR    R6,     R5                      ; F40F   0135
        ADDR    R1,     R0                      ; F410   00C8
        ADDR    R0,     R5                      ; F411   00C5
        RRC     R2,     1                       ; F412   0072
        MVI@    R4,     R5                      ; F413   02A5
        ADCR    R3                              ; F414   002B
        EIS                                     ; F415   0002
L_F416:
        MVI@    R4,     R5                      ; F416   02A5
        SUB@    R4,     R5                      ; F417   0325
        CMP@    R2,     R5                      ; F418   0355
        SUBR    R5,     R5                      ; F419   012D
        RLC     R2,     1                       ; F41A   0052
        SUBR    R0,     R3                      ; F41B   0103
L_F41C:
        XORR    R2,     R5                      ; F41C   01D5
        DIS                                     ; F41D   0003
L_F41E:
        CMPR    R4,     R5                      ; F41E   0165
        DIS                                     ; F41F   0003
L_F420:
        CMPR    R0,     R5                      ; F420   0145
        DECLE   $0008,  $0165,  $0201,  $01D1   ; F421   0008 0165 0201 01D1

        CMPR    R0,     R5                      ; F425   0145
        INCR    R1                              ; F426   0009
L_F427:
        CMPR    R4,     R5                      ; F427   0165
        DECLE   $0001,  $01E1,  $0225,  $00B7   ; F428   0001 01E1 0225 00B7
        DECLE   $00DD,  $0122,  $00F3,  $01D1   ; F42C   00DD 0122 00F3 01D1
        DECLE   $02C5,  $0010,  $0135,  $00CC   ; F430   02C5 0010 0135 00CC
        DECLE   $0042,  $01B1,  $003B,  $00C9   ; F434   0042 01B1 003B 00C9
        DECLE   $0278,  $0002,  $01C1,  $0050   ; F438   0278 0002 01C1 0050
        DECLE   $01D9,  $0082,  $00D5,  $004B   ; F43C   01D9 0082 00D5 004B
        DECLE   $00D1,  $000B,  $00D1,  $0042   ; F440   00D1 000B 00D1 0042
        DECLE   $00B1,  $02C5,  $0010,  $0295   ; F444   00B1 02C5 0010 0295
        DECLE   $0030,  $03E7,  $0315,  $01A5   ; F448   0030 03E7 0315 01A5
        DECLE   $015D,  $0165,  $0012,  $0145   ; F44C   015D 0165 0012 0145
        DECLE   $0201                           ; F450   0201

        CMP@    R2,     R5                      ; F451   0355
        SUBR    R4,     R2                      ; F452   0122
        SUB@    R2,     R1                      ; F453   0311
        CMPR    R4,     R5                      ; F454   0165
        BEQ     L_F59C                          ; F455   0204 0145
L_F457:
        BEQ     L_F4AB                          ; F457   0204 0052

        DECLE   $0281,  $0165,  $020C,  $0145   ; F459   0281 0165 020C 0145
        DECLE   $0207,  $0225,  $00B3,  $0051   ; F45D   0207 0225 00B3 0051
        DECLE   $005D,  $0145,  $0210           ; F461   005D 0145 0210

        MOVR    R0,     R5                      ; F464   0085
        ANDR    R0,     R5                      ; F465   0185
        B       L_F427                          ; F466   0220 0040

        DECLE   $00D5,  $0062,  $0361,  $0142   ; F468   00D5 0062 0361 0142
        DECLE   $02E1,  $0062,  $0361,  $0010   ; F46C   02E1 0062 0361 0010
        DECLE   $01D3,  $0042,  $01B1,  $02C1   ; F470   01D3 0042 01B1 02C1
        DECLE   $01E9,  $0377,  $0288,  $003A   ; F474   01E9 0377 0288 003A
        DECLE   $0295,  $002B,  $01B5,  $0065   ; F478   0295 002B 01B5 0065
        DECLE   $01F5,  $002B,  $0059,  $00F3   ; F47C   01F5 002B 0059 00F3
        DECLE   $001E,  $0062,  $0291,  $0002   ; F480   001E 0062 0291 0002
        DECLE   $02A5,  $01D3,  $0135,  $00DA   ; F484   02A5 01D3 0135 00DA
        DECLE   $0072,  $0191,  $003B,  $0269   ; F488   0072 0191 003B 0269
        DECLE   $0042,  $01A1,  $000B,  $0002   ; F48C   0042 01A1 000B 0002
        DECLE   $0191,  $02C5,  $0010,  $0072   ; F490   0191 02C5 0010 0072
        DECLE   $0279,  $02C1,  $004B,  $0015   ; F494   0279 02C1 004B 0015
        DECLE   $02D1,  $02C5,  $0010,  $0288   ; F498   02D1 02C5 0010 0288
        DECLE   $003A,  $0295,  $0004           ; F49C   003A 0295 0004

        MVO@    R7,     R2                      ; F49F   0257
        ADDR    R2,     R5                      ; F4A0   00D5
        SLR     R2,     1                       ; F4A1   0062
L_F4A2:
        XORR    R6,     R5                      ; F4A2   01F5
        CMP@    R4,     R1                      ; F4A3   0361
        SLLC    R2,     2                       ; F4A4   005E
        XORR    R0,     R5                      ; F4A5   01C5
        COMR    R2                              ; F4A6   001A
        GSWD    R2                              ; F4A7   0032
        ADDR    R6,     R3                      ; F4A8   00F3
        MVO     R1,     G_0111                  ; F4A9   0241 0111
L_F4AB:
        ADD@    R6,     R1                      ; F4AB   02F1
        DECLE   $0051,  $0002,  $0291,  $0058   ; F4AC   0051 0002 0291 0058
        DECLE   $005A,  $0295,  $002A,  $0397   ; F4B0   005A 0295 002A 0397
        DECLE   $010D,  $0085,  $0182,  $0145   ; F4B4   010D 0085 0182 0145
        DECLE   $0001,  $0355,  $0165,  $0011   ; F4B8   0001 0355 0165 0011
        DECLE   $0001,  $0082,  $0365,  $00FD   ; F4BC   0001 0082 0365 00FD
        DECLE   $0001,  $0165,  $020D,  $0113   ; F4C0   0001 0165 020D 0113
        DECLE   $0225,  $0361,  $0145,  $0000   ; F4C4   0225 0361 0145 0000
        DECLE   $005D,  $0102,  $0361,  $02C5   ; F4C8   005D 0102 0361 02C5
        DECLE   $0010,  $011D,  $0052,  $01D5   ; F4CC   0010 011D 0052 01D5
        DECLE   $0002,  $0145,  $0014,  $0155   ; F4D0   0002 0145 0014 0155
        DECLE   $020C,  $0321,  $0143,  $0145   ; F4D4   020C 0321 0143 0145
        DECLE   $0001,  $0155,  $0001,  $0341   ; F4D8   0001 0155 0001 0341
        DECLE   $0145,  $0214,  $0155,  $020C   ; F4DC   0145 0214 0155 020C
        DECLE   $0075,  $0085,  $0321,  $0145   ; F4E0   0075 0085 0321 0145
        DECLE   $0001                           ; F4E4   0001

        CMPR    R2,     R5                      ; F4E5   0155
        BMI     L_F55D                          ; F4E6   020B 0075

        MOVR    R0,     R5                      ; F4E8   0085
        CMP@    R2,     R1                      ; F4E9   0351
        CMPR    R0,     R5                      ; F4EA   0145
        DECR    R4                              ; F4EB   0014
        CMPR    R2,     R5                      ; F4EC   0155
        BNEQ    L_F810                          ; F4ED   020C 0321
        BLT     L_F349                          ; F4EF   0225 01A7

        MOVR    R4,     R2                      ; F4F1   00A2
        MOVR    R0,     R5                      ; F4F2   0085
        ADDR    R6,     R3                      ; F4F3   00F3
        ADCR    R6                              ; F4F4   002E
        ANDR    R1,     R5                      ; F4F5   018D
        SUB@    R4,     R1                      ; F4F6   0321
        ADD     .STIC.A.0,R5                    ; F4F7   02C5 0010
L_F4F9:
        RLC     R1,     2                       ; F4F9   0055
        DECLE   $00ED,  $0355,  $0105,  $0206   ; F4FA   00ED 0355 0105 0206
        DECLE   $0135,  $0102,  $0042,  $0281   ; F4FE   0135 0102 0042 0281
        DECLE   $0051,  $00CD,  $0225,  $0032   ; F502   0051 00CD 0225 0032
        DECLE   $02F1,  $0111,  $0105,  $0006   ; F506   02F1 0111 0105 0006
        DECLE   $0002,  $00B1,  $02C5,  $0010   ; F50A   0002 00B1 02C5 0010
        DECLE   $0325,  $00ED,  $0205,  $0355   ; F50E   0325 00ED 0205 0355
        DECLE   $0105,  $0202,  $0052,  $0261   ; F512   0105 0202 0052 0261
        DECLE   $0105,  $0008,  $01BD,  $0075   ; F516   0105 0008 01BD 0075
        DECLE   $0165,  $0003,  $0321,  $00FD   ; F51A   0165 0003 0321 00FD
        DECLE   $0165,  $000F,  $0145,  $0204   ; F51E   0165 000F 0145 0204
        DECLE   $00F2,  $0311,  $015D,  $0085   ; F522   00F2 0311 015D 0085
        DECLE   $0165,  $0205,  $0145,  $020B   ; F526   0165 0205 0145 020B
        DECLE   $0052,  $0281,  $0165,  $020D   ; F52A   0052 0281 0165 020D
        DECLE   $0145,  $020A,  $0225,  $00B3   ; F52E   0145 020A 0225 00B3
        DECLE   $0051,  $005D,  $0145,  $0001   ; F532   0051 005D 0145 0001
L_F536:
        MOVR    R0,     R5                      ; F536   0085
        ANDR    R0,     R5                      ; F537   0185
        B       L_F4F9                          ; F538   0220 0040

        CMPR    R1,     R5                      ; F53A   014D
        CMPR    R0,     R5                      ; F53B   0145
        DIS                                     ; F53C   0003
        CMP@    R2,     R5                      ; F53D   0355
        CMPR    R4,     R5                      ; F53E   0165
        EIS                                     ; F53F   0002
        CMPR    R0,     R2                      ; F540   0142
        MVO@    R1,     R2                      ; F541   0251
        MOVR    R0,     R2                      ; F542   0082
        CMP@    R4,     R5                      ; F543   0365
        ANDR    R2,     R1                      ; F544   0191
        SLL     R2,     2                       ; F545   004E
        ADDR    R4,     R3                      ; F546   00E3
        ANDR    R1,     R5                      ; F547   018D
        BLT     L_F457                          ; F548   0225 00F2

        ADDR    R2,     R1                      ; F54A   00D1
        ADD     .STIC.A.0,R5                    ; F54B   02C5 0010
        CMPR    R1,     R5                      ; F54D   014D
        SUB@    R2,     R5                      ; F54E   0315
        CMPR    R0,     R5                      ; F54F   0145
        DIS                                     ; F550   0003
        CMPR    R4,     R5                      ; F551   0165
        EIS                                     ; F552   0002
        CMP@    R2,     R5                      ; F553   0355
        ADDR    R6,     R2                      ; F554   00F2
        MVO@    R1,     R2                      ; F555   0251
L_F556:
        CMP@    R4,     R5                      ; F556   0365
        CMPR    R0,     R5                      ; F557   0145
        BLT     L_F6CF                          ; F558   0205 0175

        TSTR    R0                              ; F55A   0080
        ANDR    R5,     R5                      ; F55B   01AD
        RRC     R1,     2                       ; F55C   0075
L_F55D:
        SLR     R2,     1                       ; F55D   0062
        ADDR    R2,     R1                      ; F55E   00D1

        JSR     R4,     .EXEC.13D               ; F55F   0004 0010 013D
        DECLE   $0122,  $0355,  $0165,  $0002   ; F562   0122 0355 0165 0002
        DECLE   $01D1,  $0072,  $019D,  $0225   ; F566   01D1 0072 019D 0225
        DECLE   $0241,  $02C5,  $0010,  $0305   ; F56A   0241 02C5 0010 0305
        DECLE   $01F5,  $0275,  $0042,  $0285   ; F56E   01F5 0275 0042 0285
        DECLE   $0075,  $0111,  $002C,  $0075   ; F572   0075 0111 002C 0075
        DECLE   $0051,  $0075,  $0111,  $0047   ; F576   0051 0075 0111 0047
        DECLE   $0075,  $0051,  $0075,  $00D5   ; F57A   0075 0051 0075 00D5
        DECLE   $0040,  $01A5,  $015D,  $0122   ; F57E   0040 01A5 015D 0122
        DECLE   $0165,  $000A,  $0145,  $0006   ; F582   0165 000A 0145 0006
        DECLE   $0355,  $0321,  $0062,  $0165   ; F586   0355 0321 0062 0165
        DECLE   $020A                           ; F58A   020A

        MOVR    R6,     R3                      ; F58B   00B3
        BLT     L_F25C                          ; F58C   0225 0331

        SLLC    R1,     2                       ; F58E   005D
        MOVR    R0,     R5                      ; F58F   0085
        ANDR    R2,     R2                      ; F590   0192
        CMPR    R0,     R5                      ; F591   0145
        SDBD                                    ; F592   0001
        MVI@    R4,     R1                      ; F593   02A1
        ANDR    R0,     R5                      ; F594   0185
        B       L_F556                          ; F595   0220 0040

        DECLE   $0000,  $0016,  $001D,  $0027   ; F597   0000 0016 001D 0027
        DECLE   $0035                           ; F59B   0035
L_F59C:
        SWAP    R1,     1                       ; F59C   0041
        SWAP    R0,     2                       ; F59D   0044
        SWAP    R2,     2                       ; F59E   0046
        RLC     R1,     1                       ; F59F   0051
        SLR     R1,     2                       ; F5A0   0065
        SAR     R3,     1                       ; F5A1   006B
        SARC    R2,     1                       ; F5A2   007A
        MOVR    R0,     R2                      ; F5A3   0082
        MOVR    R2,     R1                      ; F5A4   0091
        MOVR    R2,     R6                      ; F5A5   0096
        MOVR    R3,     R4                      ; F5A6   009C
        MOVR    R3,     R7                      ; F5A7   009F

        DECLE   $00A2,  $00AC,  $00B0,  $00B3   ; F5A8   00A2 00AC 00B0 00B3
        DECLE   $00B6,  $00B9,  $00BF           ; F5AC   00B6 00B9 00BF

        ADDR    R0,     R3                      ; F5AF   00C3
        ADDR    R0,     R4                      ; F5B0   00C4
        ADDR    R0,     R6                      ; F5B1   00C6
        ADDR    R1,     R0                      ; F5B2   00C8
        ADDR    R1,     R3                      ; F5B3   00CB
        ADDR    R2,     R4                      ; F5B4   00D4
        ADDR    R3,     R4                      ; F5B5   00DC
        ADDR    R4,     R4                      ; F5B6   00E4
        ADDR    R5,     R3                      ; F5B7   00EB
        ADDR    R7,     R3                      ; F5B8   00FB
        SUBR    R2,     R1                      ; F5B9   0111
        SUBR    R4,     R7                      ; F5BA   0127

        DECLE   $0134,  $0148,  $0154,  $0158   ; F5BB   0134 0148 0154 0158
        DECLE   $015D,  $015E,  $016D,  $0170   ; F5BF   015D 015E 016D 0170
        DECLE   $0178,  $018D,  $01A1,  $01A9   ; F5C3   0178 018D 01A1 01A9
        DECLE   $01C0,  $01CE,  $01E9,  $01F3   ; F5C7   01C0 01CE 01E9 01F3
        DECLE   $01FE,  $0201,  $021F,  $0227   ; F5CB   01FE 0201 021F 0227
        DECLE   $022D,  $023C,  $024A,  $0252   ; F5CF   022D 023C 024A 0252
        DECLE   $0257,  $0266,  $026B,  $0284   ; F5D3   0257 0266 026B 0284
        DECLE   $02B0,  $02C5,  $02F1,  $0304   ; F5D7   02B0 02C5 02F1 0304
        DECLE   $0318,  $0324,  $0336,  $02E0   ; F5DB   0318 0324 0336 02E0
        DECLE   $0065,  $0000,  $01FE,  $0000   ; F5DF   0065 0000 01FE 0000
        DECLE   $0280,  $02E0,  $0065,  $0000   ; F5E3   0280 02E0 0065 0000
        DECLE   $01FE,  $0001,  $0280,  $02E2   ; F5E7   01FE 0001 0280 02E2
        DECLE   $0065,  $0000,  $01FE,  $0000   ; F5EB   0065 0000 01FE 0000
        DECLE   $0280,  $02E2,  $0065,  $0000   ; F5EF   0280 02E2 0065 0000
        DECLE   $01FE,  $0001,  $0280,  $02A0   ; F5F3   01FE 0001 0280 02A0
        DECLE   $00A3,  $0001,  $01FA,  $0002   ; F5F7   00A3 0001 01FA 0002
        DECLE   $0240,  $00E6,  $017D,  $0002   ; F5FB   0240 00E6 017D 0002
        DECLE   $0188,  $0003,  $01E0,  $02C4   ; F5FF   0188 0003 01E0 02C4
        DECLE   $00E1,  $0003,  $01FD,  $0004   ; F603   00E1 0003 01FD 0004

        MVO@    R0,     R4                      ; F607   0260
        ADD     .UART.1,R4                      ; F608   02C4 00E1

        JSRE    R5,     L_FC05                  ; F60A   0004 01FD 0005
        DECLE   $0260,  $02C4,  $00E1,  $0005   ; F60D   0260 02C4 00E1 0005

        XORR    R7,     R5                      ; F611   01FD
        CLRC                                    ; F612   0006
        MVO@    R0,     R4                      ; F613   0260
        ADD     .UART.1,R4                      ; F614   02C4 00E1
        CLRC                                    ; F616   0006
        XORR    R7,     R5                      ; F617   01FD
        SETC                                    ; F618   0007
        MVO@    R0,     R4                      ; F619   0260
        MVI     G_03E9, R4                      ; F61A   0284 03E9
        SETC                                    ; F61C   0007
        ANDR    R7,     R4                      ; F61D   01BC
        INCR    R0                              ; F61E   0008
        B       L_F35C                          ; F61F   0220 02C4

        DECLE   $00E1,  $0003,  $01FC,  $0009   ; F621   00E1 0003 01FC 0009
        DECLE   $0260,  $02C4,  $00E1,  $0006   ; F625   0260 02C4 00E1 0006
        DECLE   $01FC,  $000A,  $0260,  $02C4   ; F629   01FC 000A 0260 02C4
        DECLE   $00A3,  $0008,  $01FC,  $000B   ; F62D   00A3 0008 01FC 000B
        DECLE   $0260,  $02A2,  $00E1,  $0009   ; F631   0260 02A2 00E1 0009
        DECLE   $01FF,  $000C,  $0260,  $02C2   ; F635   01FF 000C 0260 02C2
        DECLE   $00E1,  $000A,  $01FF           ; F639   00E1 000A 01FF

        INCR    R5                              ; F63C   000D
L_F63D:
        MVO@    R0,     R4                      ; F63D   0260
        DECLE   $0264,  $0027                   ; F63E   0264 0027

        INCR    R3                              ; F640   000B
        XORR    R7,     R4                      ; F641   01FC
        INCR    R6                              ; F642   000E
        B       L_F74D                          ; F643   0200 0108

        AND@    R5,     R3                      ; F645   03AB
        INCR    R4                              ; F646   000C
L_F647:
        CMPR    R7,     R0                      ; F647   0178
        INCR    R7                              ; F648   000F

        CLRR    R0                              ; F649   01C0
L_F64A:
        ADD     .UART.1,R4                      ; F64A   02C4 00E1
        INCR    R5                              ; F64C   000D
        XORR    R7,     R4                      ; F64D   01FC
        DECR    R0                              ; F64E   0010
        MVO@    R0,     R4                      ; F64F   0260
        ADD     .UART.1,R4                      ; F650   02C4 00E1
        INCR    R6                              ; F652   000E
        XORR    R7,     R4                      ; F653   01FC
        DECR    R1                              ; F654   0011
        MVO@    R0,     R4                      ; F655   0260
        CMPR    R5,     R0                      ; F656   0168
        AND@    R5,     R3                      ; F657   03AB
        INCR    R7                              ; F658   000F

        XORR    R7,     R0                      ; F659   01F8
L_F65A:
        DECR    R2                              ; F65A   0012
        DECLE   $0220,  $01E8,  $03E9,  $0010   ; F65B   0220 01E8 03E9 0010
        DECLE   $021C,  $0013,  $0220,  $0264   ; F65F   021C 0013 0220 0264
        DECLE   $0027                           ; F663   0027

        DECR    R1                              ; F664   0011
        ANDR    R7,     R3                      ; F665   01BB
        DECR    R4                              ; F666   0014
        B       L_F4A2                          ; F667   0220 01C6

        CMPR    R7,     R5                      ; F669   017D
        DECR    R2                              ; F66A   0012
        XORR    R5,     R0                      ; F66B   01E8
        DECR    R5                              ; F66C   0015
        MVO     R0,     G_01C6                  ; F66D   0240 01C6
        CMPR    R7,     R5                      ; F66F   017D
        DECR    R3                              ; F670   0013
        XORR    R5,     R0                      ; F671   01E8
        DECR    R6                              ; F672   0016
        MVO     R0,     .BTAB.64                ; F673   0240 0264
        ADDR    R4,     R1                      ; F675   00E1
L_F676:
        DECR    R7                              ; F676   0017

        XORR    R0,     R4                      ; F677   01C4
        COMR    R4                              ; F678   001C
        B       L_F416                          ; F679   0220 0264

        ADDR    R4,     R1                      ; F67B   00E1
        COMR    R0                              ; F67C   0018
        XORR    R0,     R4                      ; F67D   01C4
        COMR    R5                              ; F67E   001D
        B       L_F41C                          ; F67F   0220 0264

        DECLE   $00E1,  $0019,  $01C4,  $001E   ; F681   00E1 0019 01C4 001E
        DECLE   $0240,  $0264,  $00E1,  $001A   ; F685   0240 0264 00E1 001A
        DECLE   $01C4,  $001F                   ; F689   01C4 001F

        MVO     R0,     .BTAB.C4                ; F68B   0240 02C4
        ADDR    R4,     R1                      ; F68D   00E1
        DECR    R5                              ; F68E   0015
        XORR    R7,     R5                      ; F68F   01FD
        COMR    R0                              ; F690   0018
        MVO@    R0,     R4                      ; F691   0260
        ADD     .UART.1,R4                      ; F692   02C4 00E1
        DECR    R5                              ; F694   0015
        XORR    R7,     R5                      ; F695   01FD
        COMR    R1                              ; F696   0019
        MVO@    R0,     R4                      ; F697   0260
        MVI     G_00A3, R4                      ; F698   0284 00A3
        DECR    R6                              ; F69A   0016
        ANDR    R7,     R6                      ; F69B   01BE
        COMR    R2                              ; F69C   001A
        B       L_F41E                          ; F69D   0220 0280

        MOVR    R4,     R3                      ; F69F   00A3
        DECR    R6                              ; F6A0   0016
        ANDR    R7,     R6                      ; F6A1   01BE
        COMR    R3                              ; F6A2   001B
        B       L_F420                          ; F6A3   0220 0284

        ADDR    R4,     R1                      ; F6A5   00E1
        DECR    R4                              ; F6A6   0014
        XORR    R4,     R3                      ; F6A7   01E3
L_F6A8:
        DECR    R7                              ; F6A8   0017

        MVO     R0,     .BTAB.80                ; F6A9   0240 0280
        MOVR    R0,     R4                      ; F6AB   0084
        COMR    R3                              ; F6AC   001B
        XORR    R0,     R1                      ; F6AD   01C1
        NEGR    R0                              ; F6AE   0020
        MVO@    R0,     R4                      ; F6AF   0260
        MVI     G_00A3, R2                      ; F6B0   0282 00A3
        COMR    R4                              ; F6B2   001C
        XORR    R4,     R0                      ; F6B3   01E0
        NEGR    R0                              ; F6B4   0020
        B       L_F3F2                          ; F6B5   0220 02C4

        DECLE   $0027,  $001D,  $01E1,  $0021   ; F6B7   0027 001D 01E1 0021
        DECLE   $0280,  $02C4,  $00E1,  $001E   ; F6BB   0280 02C4 00E1 001E
        DECLE   $01FD,  $0022,  $0260,  $0284   ; F6BF   01FD 0022 0260 0284
        DECLE   $00A3,  $001F,  $01FF           ; F6C3   00A3 001F 01FF

        NEGR    R3                              ; F6C6   0023
        MVI     .BTAB.C4,R0                     ; F6C7   0280 02C4
        ADDR    R4,     R1                      ; F6C9   00E1
        NEGR    R0                              ; F6CA   0020
        XORR    R4,     R3                      ; F6CB   01E3
        NEGR    R4                              ; F6CC   0024
        MVI     .BTAB.46,R0                     ; F6CD   0280 0246
L_F6CF:
        CMPR    R7,     R5                      ; F6CF   017D
        DECLE   $0021,  $01C7,  $0025,  $0260   ; F6D0   0021 01C7 0025 0260
        DECLE   $02A4,  $00E1,  $0022,  $01E1   ; F6D4   02A4 00E1 0022 01E1
        DECLE   $0026,  $0280,  $01A4,  $00E1   ; F6D8   0026 0280 01A4 00E1
        DECLE   $0024,  $01E6,  $0028,  $0200   ; F6DC   0024 01E6 0028 0200
        DECLE   $01E4,  $0065,  $0023,  $01F8   ; F6E0   01E4 0065 0023 01F8
        DECLE   $0027                           ; F6E4   0027

        MVO@    R0,     R4                      ; F6E5   0260
        ADD     G_00A3, R4                      ; F6E6   02C4 00A3
        NEGR    R5                              ; F6E8   0025
        XORR    R4,     R1                      ; F6E9   01E1
        ADCR    R1                              ; F6EA   0029
        MVO@    R0,     R4                      ; F6EB   0260
        ADD     G_00A3, R4                      ; F6EC   02C4 00A3
        NEGR    R5                              ; F6EE   0025
L_F6EF:
        XORR    R4,     R1                      ; F6EF   01E1
        DECLE   $002A,  $0260,  $00C0,  $00A4   ; F6F0   002A 0260 00C0 00A4
        DECLE   $0026,  $0000,  $0030,  $01A0   ; F6F4   0026 0000 0030 01A0
        DECLE   $0085,  $013F,  $0027           ; F6F8   0085 013F 0027

        MVO@    R1,     R4                      ; F6FB   0261
        ADCR    R3                              ; F6FC   002B
        ANDR    R4,     R0                      ; F6FD   01A0
        CLRR    R4                              ; F6FE   01E4
        SLR     R1,     2                       ; F6FF   0065
L_F700:
        ADCR    R0                              ; F700   0028
        XORR    R3,     R0                      ; F701   01D8
        ADCR    R4                              ; F702   002C
        B       L_F420                          ; F703   0220 02E4

        DECLE   $00E1,  $0029,  $01FF           ; F705   00E1 0029 01FF

        ADCR    R5                              ; F708   002D
        MVI     .BTAB.E4,R0                     ; F709   0280 02E4
        ADDR    R4,     R1                      ; F70B   00E1
        ADCR    R2                              ; F70C   002A
        XORR    R4,     R1                      ; F70D   01E1
        ADCR    R6                              ; F70E   002E
        MVI     .BTAB.24,R0                     ; F70F   0280 0224
        ADDR    R4,     R1                      ; F711   00E1
        ADCR    R3                              ; F712   002B
        XORR    R4,     R1                      ; F713   01E1
        ADCR    R7                              ; F714   002F

        CLRR    R0                              ; F715   01C0
L_F716:
        ADD     G_0065, R0                      ; F716   02C0 0065
        DECLE   $002C,  $01FF                   ; F718   002C 01FF

        GSWD    R1                              ; F71A   0031
L_F71B:
        MVO@    R0,     R4                      ; F71B   0260
        DECLE   $02C2,  $0065,  $002C,  $01FF   ; F71C   02C2 0065 002C 01FF

        GSWD    R1                              ; F720   0031
        MVO@    R0,     R4                      ; F721   0260
        B       L_F7C7                          ; F722   0200 00A3

        DECLE   $002D,  $01BF                   ; F724   002D 01BF

        GSWD    R2                              ; F726   0032
        B       L_F647                          ; F727   0220 00E1

        DECLE   $00A3,  $002E,  $01A0,  $0033   ; F729   00A3 002E 01A0 0033
        DECLE   $0120,  $0001,  $0001,  $0004   ; F72D   0120 0001 0001 0004
        DECLE   $0010,  $0000,  $0010,  $0000   ; F731   0010 0000 0010 0000
        DECLE   $0004,  $0008,  $0002,  $0001   ; F735   0004 0008 0002 0001
        DECLE   $0002,  $0022,  $0022,  $0004   ; F739   0002 0022 0022 0004
        DECLE   $0022,  $0004,  $0001,  $0004   ; F73D   0022 0004 0001 0004
        DECLE   $0022,  $0005,  $0001,  $000C   ; F741   0022 0005 0001 000C
        DECLE   $0004,  $0004,  $0008,  $0001   ; F745   0004 0004 0008 0001

        INCR    R4                              ; F749   000C
        NEGR    R2                              ; F74A   0022
        EIS                                     ; F74B   0002
        NEGR    R2                              ; F74C   0022
L_F74D:
        NEGR    R2                              ; F74D   0022
        EIS                                     ; F74E   0002
        EIS                                     ; F74F   0002
        NEGR    R2                              ; F750   0022
        DECR    R0                              ; F751   0010
        NEGR    R2                              ; F752   0022
        PSHR    R5                              ; F753   0275
        SDBD                                    ; F754   0001
        MVII    #$9BC0, R5                      ; F755   02BD 00C0 009B
        CLRR    R2                              ; F758   01D2
        CLRR    R3                              ; F759   01DB
        CMPI    #$000A, R1                      ; F75A   0379 000A
        BLT     L_F774                          ; F75C   0205 0016

        CMPI    #$0064, R1                      ; F75E   0379 0064
        BLT     L_F76B                          ; F760   0205 0009

L_F762:
        SUBI    #$0064, R1                      ; F762   0339 0064
        BMI     L_F769                          ; F764   020B 0003

        INCR    R3                              ; F766   000B
        B       L_F762                          ; F767   0220 0006

L_F769:
        ADDI    #$0064, R1                      ; F769   02F9 0064
L_F76B:
        SUBI    #$000A, R1                      ; F76B   0339 000A
        BMI     L_F772                          ; F76D   020B 0003

        INCR    R2                              ; F76F   000A
        B       L_F76B                          ; F770   0220 0006

L_F772:
        ADDI    #$000A, R1                      ; F772   02F9 000A
L_F774:
        TSTR    R0                              ; F774   0080
        BEQ     L_F77A                          ; F775   0204 0003

        PSHR    R3                              ; F777   0273
        SLL     R3,     2                       ; F778   004F
        ADD@    R6,     R3                      ; F779   02F3
L_F77A:
        PSHR    R2                              ; F77A   0272
        SLL     R2,     2                       ; F77B   004E
        ADD@    R6,     R2                      ; F77C   02F2
        PSHR    R1                              ; F77D   0271
        SLL     R1,     2                       ; F77E   004D
        ADD@    R6,     R1                      ; F77F   02F1
        ADDR    R5,     R1                      ; F780   00E9
        ADDR    R5,     R2                      ; F781   00EA
        TSTR    R0                              ; F782   0080
        BEQ     L_F78D                          ; F783   0204 0008

        ADDR    R5,     R3                      ; F785   00EB
        CMPR    R5,     R3                      ; F786   016B
        BNEQ    L_F790                          ; F787   020C 0007

        SDBD                                    ; F789   0001
        MVII    #$9C47, R3                      ; F78A   02BB 0047 009C
L_F78D:
        CMPR    R5,     R2                      ; F78D   016A
        BNEQ    L_F790                          ; F78E   020C 0000

L_F790:
        CMPI    #$03FF, R4                      ; F790   037C 03FF
        BLT     L_F795                          ; F792   0205 0001

        INCR    R4                              ; F794   000C
L_F795:
        MVII    #$0005, R5                      ; F795   02BD 0005
        TSTR    R0                              ; F797   0080
        BEQ     L_F7A8                          ; F798   0204 000E

L_F79A:
        MVI@    R3,     R0                      ; F79A   0298
        MVO@    R0,     R4                      ; F79B   0260
        INCR    R3                              ; F79C   000B
        DECR    R5                              ; F79D   0015
        BNEQ    L_F79A                          ; F79E   022C 0005

        CMPI    #$03FF, R4                      ; F7A0   037C 03FF
        BLT     L_F7A6                          ; F7A2   0205 0002

        ADDI    #$0003, R4                      ; F7A4   02FC 0003
L_F7A6:
        MVII    #$0005, R5                      ; F7A6   02BD 0005
L_F7A8:
        MVI@    R2,     R0                      ; F7A8   0290
        SLL     R0,     2                       ; F7A9   004C
        SLL     R0,     2                       ; F7AA   004C
        XOR@    R1,     R0                      ; F7AB   03C8
        MVO@    R0,     R4                      ; F7AC   0260
        INCR    R2                              ; F7AD   000A
        INCR    R1                              ; F7AE   0009
        DECR    R5                              ; F7AF   0015
        BNEQ    L_F7A8                          ; F7B0   022C 0009

        CMPI    #$03FF, R4                      ; F7B2   037C 03FF
        BLT     L_F7B8                          ; F7B4   0205 0002

        ADDI    #$0002, R4                      ; F7B6   02FC 0002
L_F7B8:
        PULR    R7                              ; F7B8   02B7

        PSHR    R5                              ; F7B9   0275
        CLRR    R3                              ; F7BA   01DB
        MOVR    R1,     R5                      ; F7BB   008D
L_F7BC:
        MVO@    R3,     R4                      ; F7BC   0263
        MVI@    R5,     R1                      ; F7BD   02A9
        MVO@    R1,     R4                      ; F7BE   0261
        MVI@    R5,     R1                      ; F7BF   02A9
        MVO@    R1,     R4                      ; F7C0   0261
        MVI@    R5,     R1                      ; F7C1   02A9
        MVO@    R1,     R4                      ; F7C2   0261
        MVI@    R5,     R1                      ; F7C3   02A9
        MVO@    R1,     R4                      ; F7C4   0261
        MVI@    R5,     R1                      ; F7C5   02A9
        MVO@    R1,     R4                      ; F7C6   0261
L_F7C7:
        MVO@    R3,     R4                      ; F7C7   0263
        MVO@    R3,     R4                      ; F7C8   0263
        DECR    R0                              ; F7C9   0010
        BNEQ    L_F7BC                          ; F7CA   022C 000F

        MOVR    R5,     R1                      ; F7CC   00A9
        PULR    R7                              ; F7CD   02B7

        PSHR    R5                              ; F7CE   0275
        B       L_F7D7                          ; F7CF   0200 0006

        PSHR    R5                              ; F7D1   0275
        MVII    #$0007, R0                      ; F7D2   02B8 0007

        JSR     R5,     X_RAND2                 ; F7D4   0004 0114 029E

L_F7D7:
        SLL     R0,     1                       ; F7D7   0048
        PSHR    R0                              ; F7D8   0270
        SLL     R0,     2                       ; F7D9   004C
        ADD@    R6,     R0                      ; F7DA   02F0
        CMPI    #$006E, R0                      ; F7DB   0378 006E
        BEQ     L_F7E4                          ; F7DD   0204 0005

        MVI     G_01AE, R1                      ; F7DF   0281 01AE
        TSTR    R1                              ; F7E1   0089
        BNEQ    L_F7B8                          ; F7E2   022C 002B

L_F7E4:
        MVI     G_013F, R1                      ; F7E4   0281 013F
        CMPI    #$0005, R1                      ; F7E6   0379 0005
        BGT     L_F7B8                          ; F7E8   022E 0031

        XORI    #$0080, R0                      ; F7EA   03F8 0080
        MVO     R0,     G_013F                  ; F7EC   0240 013F

        JSR     R5,     L_55FF                  ; F7EE   0004 0154 01FF
        BIDECLE $0400                           ; F7F1   0000 0004

        MOVR    R2,     R3                      ; F7F3   0093
        ADDI    #$0012, R3                      ; F7F4   02FB 0012
        MVI@    R3,     R3                      ; F7F6   029B
        SLL     R3,     1                       ; F7F7   004B
        PSHR    R3                              ; F7F8   0273
        SLL     R3,     1                       ; F7F9   004B
        ADD@    R6,     R3                      ; F7FA   02F3
        MOVR    R3,     R5                      ; F7FB   009D
        SDBD                                    ; F7FC   0001
        ADDI    #$A5DE, R5                      ; F7FD   02FD 00DE 00A5
        MVI@    R5,     R0                      ; F800   02A8

        JSR     R5,     L_642E                  ; F801   0004 0164 002E
        DECLE   $008B,  $02FB,  $0009,  $0095   ; F804   008B 02FB 0009 0095
        DECLE   $02FD,  $0002,  $0001,  $02A8   ; F808   02FD 0002 0001 02A8
        DECLE   $0001,  $02A9,  $0004           ; F80C   0001 02A9 0004

        ANDR    R5,     R0                      ; F80F   01A8
L_F810:
        SLR     R3,     2                       ; F810   0067

        JSR     R5,     L_6440                  ; F811   0004 0164 0040

        ADDI    #$0005, R0                      ; F814   02F8 0005
        XORI    #$0200, R0                      ; F816   03F8 0200
        MVO     R0,     G_0319                  ; F818   0240 0319
        ADDI    #$0008, R0                      ; F81A   02F8 0008
        SUBR    R3,     R1                      ; F81C   0119
        XORI    #$0080, R1                      ; F81D   03F9 0080
        SDBD                                    ; F81F   0001
        MVII    #$0987, R5                      ; F820   02BD 0087 0009
        MVO     R5,     G_0329                  ; F823   0245 0329
        ADDI    #$0010, R5                      ; F825   02FD 0010
L_F827:
        MVO     R0,     G_031A                  ; F827   0240 031A
        MVO     R1,     G_0321                  ; F829   0241 0321
        MVO     R1,     G_0322                  ; F82B   0241 0322
        MVO     R5,     G_032A                  ; F82D   0245 032A
        PULR    R7                              ; F82F   02B7

        PSHR    R5                              ; F830   0275
        MVI     G_01AE, R1                      ; F831   0281 01AE
        TSTR    R1                              ; F833   0089
        BNEQ    L_F7B8                          ; F834   022C 007D

        CLRR    R0                              ; F836   01C0
        MVO     R0,     G_013F                  ; F837   0240 013F
        MVI     G_01A7, R3                      ; F839   0283 01A7
        MVII    #$0062, R0                      ; F83B   02B8 0062
        CMPI    #$0001, R3                      ; F83D   037B 0001
        BEQ     L_F843                          ; F83F   0204 0002

        MVII    #$00DA, R0                      ; F841   02B8 00DA
L_F843:
        MVO     R3,     G_01AE                  ; F843   0243 01AE
        MVO     R0,     G_0347                  ; F845   0240 0347

L_F847:
        JSR     R5,     L_6440                  ; F847   0004 0164 0040

        XORI    #$0200, R0                      ; F84A   03F8 0200
        MVO     R0,     G_0319                  ; F84C   0240 0319
        ADDI    #$000A, R0                      ; F84E   02F8 000A
        MVII    #$01C0, R1                      ; F850   02B9 01C0
        SDBD                                    ; F852   0001
        MVII    #$0890, R5                      ; F853   02BD 0090 0008
        MVO     R5,     G_0329                  ; F856   0245 0329
        B       L_F827                          ; F858   0220 0032

        PSHR    R5                              ; F85A   0275
        MVI     G_0347, R0                      ; F85B   0280 0347
        MVI     G_01AE, R1                      ; F85D   0281 01AE
        TSTR    R1                              ; F85F   0089
        BNEQ    L_F847                          ; F860   022C 001A

        MVII    #$0001, R0                      ; F862   02B8 0001
        MVO     R0,     G_013F                  ; F864   0240 013F
        PULR    R7                              ; F866   02B7

        SLR     R1,     2                       ; F867   0065
        SLR     R1,     2                       ; F868   0065
        NOP                                     ; F869   0034
        SLR     R1,     2                       ; F86A   0065
        SLR     R0,     2                       ; F86B   0064
        NOP                                     ; F86C   0034
        SLR     R0,     2                       ; F86D   0064
        SLR     R0,     2                       ; F86E   0064
        MOVR    R5,     R7                      ; F86F   00AF

        SLL     R1,     2                       ; F870   004D
        SLL     R1,     2                       ; F871   004D
        NOP                                     ; F872   0034
        SLL     R1,     2                       ; F873   004D
        SLL     R0,     2                       ; F874   004C
        SLL     R0,     2                       ; F875   004C
        NOP                                     ; F876   0034
        SLL     R0,     2                       ; F877   004C
        MOVR    R5,     R7                      ; F878   00AF

        PSHR    R5                              ; F879   0275
        MVI     G_0138, R2                      ; F87A   0282 0138
        CMPI    #$0008, R2                      ; F87C   037A 0008
        BEQ     L_F883                          ; F87E   0204 0003
        PULR    R7                              ; F880   02B7

        MVI     G_01B3, R1                      ; F881   0281 01B3
L_F883:
        MVII    #$015D, R2                      ; F883   02BA 015D
        TSTR    R1                              ; F885   0089
        BEQ     L_F88A                          ; F886   0204 0002

        MVII    #$0180, R2                      ; F888   02BA 0180

L_F88A:
        JSR     R5,     L_61DE                  ; F88A   0004 0160 01DE

        BEQ     L_F8A7                          ; F88D   0204 0018

        CMPI    #$001C, R5                      ; F88F   037D 001C
        BNEQ    L_F8A6                          ; F891   020C 0013

        MVII    #$0007, R0                      ; F893   02B8 0007

        JSR     R5,     L_60D4                  ; F895   0004 0160 00D4

        MOVR    R2,     R4                      ; F898   0094
        ADDI    #$0008, R4                      ; F899   02FC 0008
        SDBD                                    ; F89B   0001
        MVI@    R4,     R0                      ; F89C   02A0
        SLL     R0,     1                       ; F89D   0048
        SDBD                                    ; F89E   0001
        MVI@    R4,     R1                      ; F89F   02A1
        SLL     R1,     1                       ; F8A0   0049
        SUBI    #$0004, R4                      ; F8A1   033C 0004

        JSR     R5,     L_61EE                  ; F8A3   0004 0160 01EE

L_F8A6:
        PULR    R7                              ; F8A6   02B7

L_F8A7:
        CMPI    #$00FF, R0                      ; F8A7   0378 00FF
        BNEQ    L_F8A6                          ; F8A9   022C 0004

        MOVR    R2,     R1                      ; F8AB   0091
        ADDI    #$001C, R1                      ; F8AC   02F9 001C
        MVI@    R1,     R1                      ; F8AE   0289
        TSTR    R1                              ; F8AF   0089
        BEQ     L_F8A6                          ; F8B0   0224 000B

        MOVR    R2,     R1                      ; F8B2   0091
        ADDI    #$0011, R1                      ; F8B3   02F9 0011
        MVI@    R1,     R0                      ; F8B5   0288
        SUBI    #$0002, R0                      ; F8B6   0338 0002
        BMI     L_F8C2                          ; F8B8   020B 0008

        MVO@    R0,     R1                      ; F8BA   0248
        MOVR    R2,     R1                      ; F8BB   0091
        MVII    #$0002, R0                      ; F8BC   02B8 0002

        JSR     R5,     L_69A1                  ; F8BE   0004 0168 01A1

        PULR    R7                              ; F8C1   02B7

L_F8C2:
        MOVR    R5,     R0                      ; F8C2   00A8
        INCR    R0                              ; F8C3   0008
        J       L_66DD                          ; F8C4   0004 0364 02DD

        MVI@    R5,     R0                      ; F8C7   02A8
        MVO     R0,     G_0351                  ; F8C8   0240 0351
        MVI@    R5,     R0                      ; F8CA   02A8
        MVO     R0,     G_01BA                  ; F8CB   0240 01BA
        PSHR    R5                              ; F8CD   0275
        MOVR    R2,     R5                      ; F8CE   0095
        ADDI    #$001E, R5                      ; F8CF   02FD 001E
        MVI@    R5,     R0                      ; F8D1   02A8
        MVO     R0,     G_01C8                  ; F8D2   0240 01C8

        JSR     R5,     X_RAND2                 ; F8D4   0004 0114 029E

        MVO     R0,     G_01C9                  ; F8D7   0240 01C9
L_F8D9:
        DECR    R0                              ; F8D9   0010
        BPL     L_F8DF                          ; F8DA   0203 0003

        MVI     G_01C8, R0                      ; F8DC   0280 01C8
        DECR    R0                              ; F8DE   0010
L_F8DF:
        PSHR    R0                              ; F8DF   0270
        MVI     G_0342, R5                      ; F8E0   0285 0342
        ADDR    R0,     R5                      ; F8E2   00C5
        MVI@    R5,     R0                      ; F8E3   02A8
        MVI     G_0351, R4                      ; F8E4   0284 0351
        MVI     G_01BA, R5                      ; F8E6   0285 01BA
        INCR    R5                              ; F8E8   000D
        ADDR    R7,     R5                      ; F8E9   00FD
        ADD@    R5,     R7                      ; F8EA   02EF

        DECR    R4                              ; F8EB   0014
        COMR    R6                              ; F8EC   001E
        NEGR    R1                              ; F8ED   0021
        NEGR    R6                              ; F8EE   0026
L_F8EF:
        PULR    R0                              ; F8EF   02B0
        BEQ     L_F8F8                          ; F8F0   0204 0006

        CMP     G_01C9, R0                      ; F8F2   0340 01C9
        BNEQ    L_F8D9                          ; F8F4   022C 001C

        CMPR    R6,     R7                      ; F8F6   0177
        PULR    R7                              ; F8F7   02B7

L_F8F8:
        MVI     G_0342, R5                      ; F8F8   0285 0342
        ADDR    R0,     R5                      ; F8FA   00C5
        MVI@    R5,     R1                      ; F8FB   02A9
        INCR    R0                              ; F8FC   0008
        CMPR    R6,     R6                      ; F8FD   0176
        PULR    R7                              ; F8FE   02B7

        MOVR    R0,     R5                      ; F8FF   0085
        SDBD                                    ; F900   0001
        ADDI    #$A70C, R5                      ; F901   02FD 000C 00A7
        MVI@    R5,     R5                      ; F904   02AD
        ANDR    R4,     R5                      ; F905   01A5
        CMPR    R4,     R5                      ; F906   0165
        B       L_F8EF                          ; F907   0220 0019

        CMPR    R0,     R4                      ; F909   0144
        B       L_F8EF                          ; F90A   0220 001C

        JSR     R5,     L_617C                  ; F90C   0004 0160 017C

        B       L_F8EF                          ; F90F   0220 0021

        JSR     R5,     L_617C                  ; F911   0004 0160 017C

        BNEQ    L_F8EF                          ; F914   022C 0026

        ADD     G_034D, R4                      ; F916   02C4 034D
        DECR    R4                              ; F918   0014
        MVI@    R4,     R1                      ; F919   02A1
        SDBD                                    ; F91A   0001
        ADDI    #$53C3, R1                      ; F91B   02F9 00C3 0053
        MOVR    R3,     R4                      ; F91E   009C
        ADDI    #$0002, R4                      ; F91F   02FC 0002

        JSR     R5,     L_614D                  ; F921   0004 0160 014D

        B       L_F8EF                          ; F924   0220 0036

        RLC     R2,     2                       ; F926   0056
        SLR     R2,     2                       ; F927   0066
        ADDR    R5,     R0                      ; F928   00E8
        SLR     R2,     2                       ; F929   0066
        SLL     R2,     1                       ; F92A   004A
        RLC     R2,     1                       ; F92B   0052
        ADDR    R6,     R6                      ; F92C   00F6
        RLC     R2,     1                       ; F92D   0052
        MOVR    R4,     R0                      ; F92E   00A0
        SLLC    R2,     1                       ; F92F   005A
        MOVR    R4,     R0                      ; F930   00A0
        SLLC    R2,     1                       ; F931   005A
        ADDR    R1,     R0                      ; F932   00C8
        ADDR    R1,     R0                      ; F933   00C8
        GSWD    R2                              ; F934   0032
        ADDR    R1,     R0                      ; F935   00C8
        ADDR    R1,     R0                      ; F936   00C8
        GSWD    R2                              ; F937   0032
        RLC     R0,     1                       ; F938   0050
        ADDR    R1,     R0                      ; F939   00C8
        GSWD    R2                              ; F93A   0032
        GSWD    R2                              ; F93B   0032
        RLC     R0,     1                       ; F93C   0050
        GSWD    R2                              ; F93D   0032
        SARC    R0,     1                       ; F93E   0078
        GSWD    R2                              ; F93F   0032
        GSWD    R2                              ; F940   0032
        ADDR    R1,     R0                      ; F941   00C8
        ADDR    R1,     R0                      ; F942   00C8
        RLC     R0,     1                       ; F943   0050
        RLC     R0,     1                       ; F944   0050
        RLC     R0,     1                       ; F945   0050
        DECR    R0                              ; F946   0010
        ADDR    R1,     R0                      ; F947   00C8
        PSHR    R5                              ; F948   0275
        MOVR    R3,     R5                      ; F949   009D
        B       L_F94E                          ; F94A   0200 0002

        PSHR    R5                              ; F94C   0275
        MOVR    R2,     R5                      ; F94D   0095
L_F94E:
        ADDI    #$0016, R5                      ; F94E   02FD 0016
        MVI@    R5,     R5                      ; F950   02AD
        CMPI    #$0003, R5                      ; F951   037D 0003
        BEQ     L_F957                          ; F953   0204 0002

        CMPI    #$0004, R5                      ; F955   037D 0004
L_F957:
        PULR    R7                              ; F957   02B7

        PSHR    R5                              ; F958   0275
        MVO     R0,     G_01B3                  ; F959   0240 01B3
        MVO     R1,     G_0342                  ; F95B   0241 0342
        MVII    #$01B6, R1                      ; F95D   02B9 01B6
        ADDR    R0,     R1                      ; F95F   00C1
        MVI@    R1,     R5                      ; F960   028D
        DECR    R5                              ; F961   0015
        BMI     L_F965                          ; F962   020B 0001

        MVO@    R5,     R1                      ; F964   024D

L_F965:
        JSR     R5,     L_6048                  ; F965   0004 0160 0048

        MOVR    R2,     R5                      ; F968   0095
        ADDI    #$0011, R5                      ; F969   02FD 0011
        MVI@    R5,     R5                      ; F96B   02AD
        TSTR    R5                              ; F96C   00AD
        BNEQ    L_F957                          ; F96D   022C 0017

        MVII    #$01B4, R1                      ; F96F   02B9 01B4
        ADD     G_01B3, R1                      ; F971   02C1 01B3
        MVI@    R1,     R5                      ; F973   028D
        DECR    R5                              ; F974   0015
        BMI     L_F97A                          ; F975   020B 0003

        MVO@    R5,     R1                      ; F977   024D
        BNEQ    L_F957                          ; F978   022C 0022

L_F97A:
        JSR     R5,     L_60C2                  ; F97A   0004 0160 00C2
        JSR     R5,     L_619B                  ; F97D   0004 0160 019B
        DECLE   $0240,  $0350,  $01C0,  $0004   ; F980   0240 0350 01C0 0004
        DECLE   $01A8,  $014C,  $037D,  $0005   ; F984   01A8 014C 037D 0005
        DECLE   $020D,  $0008,  $0004           ; F988   020D 0008 0004

        ANDR    R5,     R0                      ; F98B   01A8
        CMPR    R1,     R0                      ; F98C   0148
        CMPI    #$0006, R5                      ; F98D   037D 0006
        BLT     L_F992                          ; F98F   0205 0001

        INCR    R0                              ; F991   0008
L_F992:
        MVO     R0,     G_01C3                  ; F992   0240 01C3
        MOVR    R2,     R5                      ; F994   0095
        ADDI    #$0014, R5                      ; F995   02FD 0014
        MVI@    R5,     R0                      ; F997   02A8
        CMPI    #$0002, R0                      ; F998   0378 0002
        BEQ     L_FCB9                          ; F99A   0204 031D

        MVO     R0,     G_01C1                  ; F99C   0240 01C1

        JSR     R5,     L_61E2                  ; F99E   0004 0160 01E2
        DECLE   $0245,  $01C2,  $020C,  $0005   ; F9A1   0245 01C2 020C 0005

        JSR     R5,     L_61DE                  ; F9A5   0004 0160 01DE
        DECLE   $0204,  $009E,  $0004,  $01A8   ; F9A8   0204 009E 0004 01A8
        DECLE   $0148,  $037D,  $0006,  $0204   ; F9AC   0148 037D 0006 0204
        DECLE   $0308,  $0004,  $01A8,  $014C   ; F9B0   0308 0004 01A8 014C
        DECLE   $037D,  $0005,  $0205,  $002A   ; F9B4   037D 0005 0205 002A
        DECLE   $0280,  $0140,  $0378,  $000F   ; F9B8   0280 0140 0378 000F
        DECLE   $020E,  $0008,  $0099,  $02F9   ; F9BC   020E 0008 0099 02F9
        DECLE   $0016,  $0289,  $0379,  $0004   ; F9C0   0016 0289 0379 0004
        DECLE   $020E,  $0052,  $037D,  $0007   ; F9C4   020E 0052 037D 0007
        DECLE   $02B8,  $00A0,  $02B9,  $0040   ; F9C8   02B8 00A0 02B9 0040
        DECLE   $0206,  $0009,  $033D,  $0008   ; F9CC   0206 0009 033D 0008
        DECLE   $00ED,  $0001,  $02FD,  $0026   ; F9D0   00ED 0001 02FD 0026
        DECLE   $00A9,  $02A8,  $02A9,  $0004   ; F9D4   00A9 02A8 02A9 0004

        ANDR    R5,     R0                      ; F9D8   01A8
        RRC     R0,     1                       ; F9D9   0070

        JSR     R5,     L_61B7                  ; F9DA   0004 0160 01B7
        DECLE   $0004                           ; F9DD   0004

        ANDR    R5,     R4                      ; F9DE   01AC
        XORR    R5,     R3                      ; F9DF   01EB
        B       L_FCB9                          ; F9E0   0200 02D7

        DECLE   $0280,  $0137,  $0080,  $0204   ; F9E2   0280 0137 0080 0204
        DECLE   $0031,  $0004,  $0168,  $0190   ; F9E6   0031 0004 0168 0190
        DECLE   $0006,  $0338,  $000A,  $0095   ; F9EA   0006 0338 000A 0095
        DECLE   $02FD,  $001C,  $02E8,  $0368   ; F9EE   02FD 001C 02E8 0368
        DECLE   $020E,  $0024                   ; F9F2   020E 0024

        SDBD                                    ; F9F4   0001
        MVII    #$9EC7, R4                      ; F9F5   02BC 00C7 009E
        MVI     G_01B3, R0                      ; F9F8   0280 01B3
        SLL     R0,     1                       ; F9FA   0048
        ADDR    R0,     R4                      ; F9FB   00C4
        SLL     R0,     1                       ; F9FC   0048
        ADDR    R0,     R4                      ; F9FD   00C4
        SDBD                                    ; F9FE   0001
        MVII    #$53C3, R1                      ; F9FF   02B9 00C3 0053
        PSHR    R4                              ; FA02   0274

        JSR     R5,     L_614D                  ; FA03   0004 0160 014D
        DECLE   $02B4,  $02B8,  $0000,  $0204   ; FA06   02B4 02B8 0000 0204
        DECLE   $03CE                           ; FA0A   03CE

        JSR     R5,     L_619E                  ; FA0B   0004 0160 019E

        PSHR    R0                              ; FA0E   0270
        PSHR    R2                              ; FA0F   0272
        MOVR    R3,     R2                      ; FA10   009A

        JSR     R5,     L_619E                  ; FA11   0004 0160 019E
        DECLE   $02B2,  $0370,  $020D,  $028A   ; FA14   02B2 0370 020D 028A
        DECLE   $0004,  $01A8,  $014C,  $020C   ; FA18   0004 01A8 014C 020C
        DECLE   $0008,  $0004,  $01AC,  $020D   ; FA1C   0008 0004 01AC 020D
        DECLE   $0010                           ; FA20   0010

        BNEQ    L_FC1C                          ; FA21   020C 01F9
        B       L_FAD7                          ; FA23   0200 00B2

        MVI     G_01C1, R0                      ; FA25   0280 01C1
        CMPI    #$0009, R0                      ; FA27   0378 0009
        BNEQ    L_FA4A                          ; FA29   020C 001F

        MOVR    R2,     R5                      ; FA2B   0095
        ADDI    #$001E, R5                      ; FA2C   02FD 001E
        MVI@    R5,     R0                      ; FA2E   02A8

        JSR     R5,     X_RAND2                 ; FA2F   0004 0114 029E
        DECLE   $0010,  $0203,  $03AA,  $0004   ; FA32   0010 0203 03AA 0004

        ANDR    R5,     R0                      ; FA36   01A8
        ADDR    R0,     R7                      ; FA37   00C7

        DECLE   $0002,  $0000,  $0204,  $039D   ; FA38   0002 0000 0204 039D

        JSR     R5,     L_61B0                  ; FA3C   0004 0160 01B0

        ADDI    #$0006, R0                      ; FA3F   02F8 0006
        PSHR    R0                              ; FA41   0270
        MVII    #$0005, R0                      ; FA42   02B8 0005

        JSR     R5,     X_RAND2                 ; FA44   0004 0114 029E
        DECLE   $02F0,  $0200,  $037E           ; FA47   02F0 0200 037E
L_FA4A:
        CMPI    #$000A, R0                      ; FA4A   0378 000A
        DECLE   $020C,  $0011,  $00B8,  $02F8   ; FA4C   020C 0011 00B8 02F8
        DECLE   $03C7,  $0004,  $01A8,  $00C8   ; FA50   03C7 0004 01A8 00C8
        DECLE   $0002,  $020C,  $0371,  $0004   ; FA54   0002 020C 0371 0004
        DECLE   $01AC,  $020D,  $0015           ; FA58   01AC 020D 0015

        BEQ     L_FAD7                          ; FA5B   0204 007A
        B       L_FC1C                          ; FA5D   0200 01BD

        DECLE   $0378,  $0007,  $020C,  $0012   ; FA5F   0378 0007 020C 0012
        DECLE   $0280,  $0350,  $0378,  $03E8   ; FA63   0280 0350 0378 03E8
        DECLE   $020E,  $000C,  $0004,  $0160   ; FA67   020E 000C 0004 0160
        DECLE   $01C4,  $0378,  $0002,  $020E   ; FA6B   01C4 0378 0002 020E
        DECLE   $0005,  $0004,  $01AC,  $0203   ; FA6F   0005 0004 01AC 0203
        DECLE   $0200,  $0221,  $0280,  $01C2   ; FA73   0200 0221 0280 01C2
        DECLE   $0378,  $003B,  $0204,  $004A   ; FA77   0378 003B 0204 004A

        CMPI    #$0001, R0                      ; FA7B   0378 0001
        BEQ     L_FAD7                          ; FA7D   0204 0058

        CMPI    #$0037, R0                      ; FA7F   0378 0037
        BEQ     L_FAB6                          ; FA81   0204 0033

        PSHR    R0                              ; FA83   0270
        PSHR    R2                              ; FA84   0272
        PSHR    R3                              ; FA85   0273
        MOVR    R2,     R4                      ; FA86   0094
        MOVR    R3,     R2                      ; FA87   009A
        MOVR    R4,     R3                      ; FA88   00A3

        JSR     R5,     L_61C4                  ; FA89   0004 0160 01C4

        CMPI    #$0001, R0                      ; FA8C   0378 0001
        PULR    R3                              ; FA8E   02B3
        PULR    R2                              ; FA8F   02B2
        PULR    R0                              ; FA90   02B0
        BGT     L_FAD7                          ; FA91   020E 0044

        CMPI    #$0007, R0                      ; FA93   0378 0007
        BEQ     L_FAB6                          ; FA95   0204 001F

        JSR     R5,     L_617A                  ; FA97   0004 0160 017A
        BIDECLE $AE2B                           ; FA9A   002B 00AE
        DECLE   $020C,  $0039,  $0280,  $0350   ; FA9C   020C 0039 0280 0350
        DECLE   $0001,  $0378,  $0000,  $0006   ; FAA0   0001 0378 0000 0006
        DECLE   $020E,  $0031,  $0004           ; FAA4   020E 0031 0004

        ANDR    R5,     R0                      ; FAA7   01A8
        ADDR    R0,     R7                      ; FAA8   00C7

        DECLE   $0036,  $0001,  $0204,  $032C   ; FAA9   0036 0001 0204 032C
        DECLE   $0004                           ; FAAD   0004

        ANDR    R5,     R0                      ; FAAE   01A8
        ADDR    R0,     R7                      ; FAAF   00C7

        DECLE   $003C,  $0001,  $0204,  $0325   ; FAB0   003C 0001 0204 0325
        DECLE   $0200,  $000F                   ; FAB4   0200 000F
L_FAB6:
        MVI     G_0350, R0                      ; FAB6   0280 0350
        DECLE   $0378,  $03E8,  $020E,  $001B   ; FAB8   0378 03E8 020E 001B
        DECLE   $00B8,  $02F8,  $0374,  $0004   ; FABC   00B8 02F8 0374 0004
        DECLE   $01A8,  $00C8,  $0002,  $0204   ; FAC0   01A8 00C8 0002 0204
        DECLE   $030D,  $0004                   ; FAC4   030D 0004

        ANDR    R5,     R4                      ; FAC6   01AC
        BGE     L_FADD                          ; FAC7   020D 0014
        BEQ     L_FC31                          ; FAC9   0204 0166

        JSR     R5,     L_61B0                  ; FACB   0004 0160 01B0
        DECLE   $0338,  $0004,  $0004           ; FACE   0338 0004 0004

        ANDR    R5,     R4                      ; FAD1   01AC
        XORR    R5,     R3                      ; FAD2   01EB
        MVII    #$0014, R5                      ; FAD3   02BD 0014
        B       L_FC1C                          ; FAD5   0200 0145

L_FAD7:
        MVII    #$01B6, R1                      ; FAD7   02B9 01B6
        ADD     G_01B3, R1                      ; FAD9   02C1 01B3
        MVI@    R1,     R0                      ; FADB   0288
        TSTR    R0                              ; FADC   0080
L_FADD:
        BNEQ    L_FC31                          ; FADD   020C 0152

        MVII    #$00FF, R0                      ; FADF   02B8 00FF

        JSR     R5,     L_68DA                  ; FAE1   0004 0168 00DA

        MVII    #$0009, R0                      ; FAE4   02B8 0009
        CLRR    R4                              ; FAE6   01E4

        JSR     R5,     L_61E2                  ; FAE7   0004 0160 01E2

        BEQ     L_FB0F                          ; FAEA   0204 0023

        MVII    #$000E, R0                      ; FAEC   02B8 000E
        MVII    #$000A, R4                      ; FAEE   02BC 000A
        CMPI    #$000A, R5                      ; FAF0   037D 000A
        BEQ     L_FB0F                          ; FAF2   0204 001B

        JSR     R5,     L_61DE                  ; FAF4   0004 0160 01DE

        CMPI    #$0001, R5                      ; FAF7   037D 0001
        BEQ     L_FB0F                          ; FAF9   0204 0014

        CMPI    #$001C, R5                      ; FAFB   037D 001C
        BEQ     L_FB0F                          ; FAFD   0204 0010

        CMPI    #$000A, R5                      ; FAFF   037D 000A
        BEQ     L_FB0F                          ; FB01   0204 000C

        CMPI    #$0007, R5                      ; FB03   037D 0007
        BEQ     L_FB0F                          ; FB05   0204 0008

        MVII    #$000F, R0                      ; FB07   02B8 000F
        MOVR    R0,     R4                      ; FB09   0084

        JSR     R5,     L_61DE                  ; FB0A   0004 0160 01DE

        BNEQ    L_FDDF                          ; FB0D   020C 02D0

L_FB0F:
        MVO     R0,     G_01C4                  ; FB0F   0240 01C4
        MVO     R4,     G_01C5                  ; FB11   0244 01C5
        SUBR    R4,     R0                      ; FB13   0120
        MVO     R0,     G_01C6                  ; FB14   0240 01C6

        JSR     R5,     X_RAND2                 ; FB16   0004 0114 029E

        ADDR    R4,     R0                      ; FB19   00E0
        MVO     R0,     G_01C7                  ; FB1A   0240 01C7
L_FB1C:
        MVI     G_01C4, R1                      ; FB1C   0281 01C4
        MVI     G_01C6, R0                      ; FB1E   0280 01C6
        DECR    R0                              ; FB20   0010
        BMI     L_FB30                          ; FB21   020B 000D

        MVO     R0,     G_01C6                  ; FB23   0240 01C6
        MVI     G_01C7, R1                      ; FB25   0281 01C7
        INCR    R1                              ; FB27   0009
        CMP     G_01C4, R1                      ; FB28   0341 01C4
        BLT     L_FB2E                          ; FB2A   0205 0002

        MVI     G_01C5, R1                      ; FB2C   0281 01C5
L_FB2E:
        MVO     R1,     G_01C7                  ; FB2E   0241 01C7
L_FB30:
        INCR    R1                              ; FB30   0009
        ADDR    R7,     R1                      ; FB31   00F9
        ADD@    R1,     R7                      ; FB32   02CF

        DECLE   $0011,  $0022,  $009B,  $0051   ; FB33   0011 0022 009B 0051
        DECLE   $0011,  $0081,  $002D,  $0056   ; FB37   0011 0081 002D 0056
        DECLE   $008B,  $00B6,  $003E,  $009B   ; FB3B   008B 00B6 003E 009B
        DECLE   $00AB,  $0081,  $00B6,  $00E3   ; FB3F   00AB 0081 00B6 00E3
        DECLE   $00E3,  $0004                   ; FB43   00E3 0004

        ANDR    R5,     R0                      ; FB45   01A8
        CMPR    R1,     R4                      ; FB46   014C
        CMPI    #$0003, R5                      ; FB47   037D 0003
        BGE     L_FB1C                          ; FB49   022D 002E

        MOVR    R3,     R5                      ; FB4B   009D
        ADDI    #$001C, R5                      ; FB4C   02FD 001C
        MVI@    R5,     R0                      ; FB4E   02A8
        CMPI    #$0046, R0                      ; FB4F   0378 0046
        BLT     L_FC1A                          ; FB51   0205 00C7
        B       L_FB1C                          ; FB53   0220 0038

        DECLE   $00B8,  $02F8,  $02D5,  $0004   ; FB55   00B8 02F8 02D5 0004

        ANDR    R5,     R0                      ; FB59   01A8
        ADDR    R1,     R0                      ; FB5A   00C8
        EIS                                     ; FB5B   0002
        BEQ     L_FC1A                          ; FB5C   0204 00BC
        B       L_FB68                          ; FB5E   0200 0008

        MOVR    R3,     R5                      ; FB60   009D
        ADDI    #$001C, R5                      ; FB61   02FD 001C
        MVI@    R5,     R0                      ; FB63   02A8
        CMPI    #$0050, R0                      ; FB64   0378 0050
        BLE     L_FB1C                          ; FB66   0226 004B

L_FB68:
        MOVR    R7,     R0                      ; FB68   00B8
        DECLE   $02F8,  $02CC,  $0004,  $01A8   ; FB69   02F8 02CC 0004 01A8
        DECLE   $00C8,  $0002,  $0204,  $00A9   ; FB6D   00C8 0002 0204 00A9
        DECLE   $02B8,  $0002,  $0004,  $01A8   ; FB71   02B8 0002 0004 01A8
        DECLE   $014C,  $037D,  $0006,  $0206   ; FB75   014C 037D 0006 0206
        DECLE   $0002,  $02B8,  $0020,  $0004   ; FB79   0002 02B8 0020 0004
        DECLE   $01A8,  $00C8,  $0000           ; FB7D   01A8 00C8 0000

        BEQ     L_FC1A                          ; FB80   0204 0098
        B       L_FB1C                          ; FB82   0220 0067

        MOVR    R7,     R4                      ; FB84   00BC
        ADDI    #$02B5, R4                      ; FB85   02FC 02B5
        B       L_FB8C                          ; FB87   0200 0003

        MOVR    R7,     R4                      ; FB89   00BC
        ADDI    #$02B4, R4                      ; FB8A   02FC 02B4
L_FB8C:
        PSHR    R2                              ; FB8C   0272
        MOVR    R3,     R2                      ; FB8D   009A

        JSR     R5,     L_619E                  ; FB8E   0004 0160 019E

        PULR    R2                              ; FB91   02B2

        JSR     R5,     L_61F6                  ; FB92   0004 0160 01F6
        DECLE   $022C,  $007A,  $0004,  $01A8   ; FB95   022C 007A 0004 01A8
        DECLE   $014C,  $037D,  $0005,  $022D   ; FB99   014C 037D 0005 022D
        DECLE   $0081,  $0004,  $01A8,  $0148   ; FB9D   0081 0004 01A8 0148
        DECLE   $037D,  $0006,  $0206,  $0006   ; FBA1   037D 0006 0206 0006
        DECLE   $0280,  $0140,  $0378,  $000D   ; FBA5   0280 0140 0378 000D
        DECLE   $022E,  $008E,  $0004           ; FBA9   022E 008E 0004

        ANDR    R5,     R0                      ; FBAC   01A8
        ADDR    R0,     R7                      ; FBAD   00C7

        DECLE   $0008,  $0000                   ; FBAE   0008 0000

        BNEQ    L_FB1C                          ; FBB0   022C 0095
        B       L_FC1A                          ; FBB2   0200 0066

        DECLE   $0280,  $01C3,  $0080,  $022C   ; FBB4   0280 01C3 0080 022C
        DECLE   $009C,  $00B8,  $02F8,  $0265   ; FBB8   009C 00B8 02F8 0265
        DECLE   $0200,  $0018                   ; FBBC   0200 0018

        MVI     G_01C3, R0                      ; FBBE   0280 01C3
        TSTR    R0                              ; FBC0   0080
        BEQ     L_FBC9                          ; FBC1   0204 0006

        MVI     G_0140, R0                      ; FBC3   0280 0140
        CMPI    #$000D, R0                      ; FBC5   0378 000D
        BGT     L_FB1C                          ; FBC7   022E 00AC

L_FBC9:
        MOVR    R7,     R0                      ; FBC9   00B8
        DECLE   $02F8,  $0259,  $0200,  $0008   ; FBCA   02F8 0259 0200 0008
        DECLE   $0280,  $01C3,  $0080,  $022C   ; FBCE   0280 01C3 0080 022C
        DECLE   $00B6,  $00B8,  $02F8,  $0248   ; FBD2   00B6 00B8 02F8 0248
        DECLE   $0004                           ; FBD6   0004

        ANDR    R5,     R0                      ; FBD7   01A8
        ADDR    R1,     R0                      ; FBD8   00C8
        EIS                                     ; FBD9   0002
        BNEQ    L_FB1C                          ; FBDA   022C 00BF
        B       L_FBED                          ; FBDC   0200 000F

        DECLE   $00B8,  $02F8,  $0256,  $0004   ; FBDE   00B8 02F8 0256 0004

        ANDR    R5,     R0                      ; FBE2   01A8
        ADDR    R1,     R0                      ; FBE3   00C8
        EIS                                     ; FBE4   0002
        BNEQ    L_FB1C                          ; FBE5   022C 00CA
        B       L_FC1A                          ; FBE7   0200 0031

        MVI     G_01C4, R0                      ; FBE9   0280 01C4
        MVO     R0,     G_01C7                  ; FBEB   0240 01C7
L_FBED:
        MVI     G_0350, R0                      ; FBED   0280 0350
        SDBD                                    ; FBEF   0001
        CMPI    #$0DAC, R0                      ; FBF0   0378 00AC 000D
        BGE     L_FC1A                          ; FBF3   020D 0025

        MVII    #$0001, R1                      ; FBF5   02B9 0001

        JSR     R5,     L_61DE                  ; FBF7   0004 0160 01DE

        CMPI    #$0007, R5                      ; FBFA   037D 0007
        BNEQ    L_FC0B                          ; FBFC   020C 000D

        JSR     R5,     L_61C4                  ; FBFE   0004 0160 01C4

        CMPI    #$0001, R0                      ; FC01   0378 0001
        BGT     L_FC0B                          ; FC03   020E 0006

L_FC05:
        MVII    #$0003, R0                      ; FC05   02B8 0003

        JSR     R5,     X_RAND2                 ; FC07   0004 0114 029E

        MOVR    R0,     R1                      ; FC0A   0081

L_FC0B:
        JSR     R5,     L_61B0                  ; FC0B   0004 0160 01B0
        DECLE   $02F8,  $0007,  $00C8,  $0004   ; FC0E   02F8 0007 00C8 0004

        ANDR    R5,     R4                      ; FC12   01AC
        XORR    R5,     R3                      ; FC13   01EB
        B       L_FC1A                          ; FC14   0200 0004

        MVI     G_01C4, R0                      ; FC16   0280 01C4
        MVO     R0,     G_01C7                  ; FC18   0240 01C7
L_FC1A:
        MVI     G_01C7, R5                      ; FC1A   0285 01C7
L_FC1C:
        MVII    #$01B8, R1                      ; FC1C   02B9 01B8
        ADD     G_01B3, R1                      ; FC1E   02C1 01B3
        MVO@    R5,     R1                      ; FC20   024D
        SDBD                                    ; FC21   0001
        ADDI    #$A932, R5                      ; FC22   02FD 0032 00A9
        MVI@    R5,     R0                      ; FC25   02A8
        PSHR    R0                              ; FC26   0270
        SLR     R0,     2                       ; FC27   0064
        SLR     R0,     1                       ; FC28   0060

        JSR     R5,     X_RAND2                 ; FC29   0004 0114 029E

        NEGR    R0                              ; FC2C   0020
        ADD@    R6,     R0                      ; FC2D   02F0
        SUBI    #$0002, R1                      ; FC2E   0339 0002
        MVO@    R0,     R1                      ; FC30   0248
L_FC31:
        MVII    #$01B8, R1                      ; FC31   02B9 01B8
        ADD     G_01B3, R1                      ; FC33   02C1 01B3
        MVI@    R1,     R1                      ; FC35   0289
        INCR    R1                              ; FC36   0009
        ADDR    R7,     R1                      ; FC37   00F9
        ADD@    R1,     R7                      ; FC38   02CF

        DECR    R6                              ; FC39   0016
        COMR    R2                              ; FC3A   001A
        RRC     R2,     2                       ; FC3B   0076
        SLR     R1,     1                       ; FC3C   0061
        DECR    R6                              ; FC3D   0016
        SAR     R2,     2                       ; FC3E   006E
        RLC     R3,     2                       ; FC3F   0057
        SLR     R2,     2                       ; FC40   0066
        RRC     R2,     1                       ; FC41   0072
        SUBR    R0,     R4                      ; FC42   0104
        SWAP    R2,     2                       ; FC43   0046
        RRC     R2,     2                       ; FC44   0076
        SUBR    R1,     R6                      ; FC45   010E
        SAR     R2,     2                       ; FC46   006E
        SUBR    R0,     R4                      ; FC47   0104
        SUBR    R5,     R0                      ; FC48   0128
        CMPR    R2,     R5                      ; FC49   0155
        MOVR    R7,     R5                      ; FC4A   00BD
        MOVR    R4,     R2                      ; FC4B   00A2
        MOVR    R0,     R2                      ; FC4C   0082
        SUBR    R1,     R4                      ; FC4D   010C
        ANDR    R0,     R4                      ; FC4E   0184
        MVII    #$000B, R0                      ; FC4F   02B8 000B
        B       L_FC55                          ; FC51   0200 0002

        MVII    #$000A, R0                      ; FC53   02B8 000A
L_FC55:
        MVI     G_0350, R5                      ; FC55   0285 0350
        DECLE   $037D,  $0180,  $0206,  $017E   ; FC57   037D 0180 0206 017E
        DECLE   $0004,  $01A8,  $0148,  $037D   ; FC5B   0004 01A8 0148 037D
        DECLE   $0006,  $0204,  $0034,  $0004   ; FC5F   0006 0204 0034 0004

        ANDR    R5,     R0                      ; FC63   01A8
        CMPR    R1,     R4                      ; FC64   014C
        CMPI    #$0005, R5                      ; FC65   037D 0005
        BGT     L_FC7A                          ; FC67   020E 0011

        MVI     G_0140, R5                      ; FC69   0285 0140
        CMPI    #$000F, R5                      ; FC6B   037D 000F
        BLT     L_FC7A                          ; FC6D   0205 000B

        MOVR    R2,     R5                      ; FC6F   0095
        ADDI    #$0004, R5                      ; FC70   02FD 0004
        SDBD                                    ; FC72   0001
        MVI@    R5,     R0                      ; FC73   02A8
        SDBD                                    ; FC74   0001
        CMPI    #$1200, R0                      ; FC75   0378 0000 0012
        BGE     L_FC96                          ; FC78   020D 001C

L_FC7A:
        JSR     R5,     L_61B0                  ; FC7A   0004 0160 01B0

        B       L_FDCB                          ; FC7D   0200 014C

        DECLE   $0285,  $0350,  $037D,  $0080   ; FC7F   0285 0350 037D 0080
        DECLE   $022E,  $0029                   ; FC83   022E 0029

        MVI     G_01C2, R0                      ; FC85   0280 01C2

        JSR     R5,     L_617A                  ; FC87   0004 0160 017A
        BIDECLE $53D9                           ; FC8A   00D9 0053
        DECLE   $0204,  $0008,  $0220,  $0034   ; FC8C   0204 0008 0220 0034
        DECLE   $0280,  $0350,  $0378,  $0180   ; FC90   0280 0350 0378 0180
        DECLE   $022E,  $003A                   ; FC94   022E 003A
L_FC96:
        MVII    #$00FF, R0                      ; FC96   02B8 00FF
        B       L_FDCD                          ; FC98   0200 0133

        MOVR    R7,     R4                      ; FC9A   00BC
        ADDI    #$019F, R4                      ; FC9B   02FC 019F
        B       L_FCA2                          ; FC9D   0200 0003

        MOVR    R7,     R4                      ; FC9F   00BC
        ADDI    #$019E, R4                      ; FCA0   02FC 019E

L_FCA2:
        JSR     R5,     L_61B3                  ; FCA2   0004 0160 01B3

        B       L_FDCB                          ; FCA5   0200 0124

        MVII    #$0013, R5                      ; FCA7   02BD 0013
        B       L_FCB1                          ; FCA9   0200 0006

        MVII    #$0012, R5                      ; FCAB   02BD 0012
        B       L_FCB1                          ; FCAD   0200 0002

        MVII    #$0011, R5                      ; FCAF   02BD 0011
L_FCB1:
        MVI     G_0350, R0                      ; FCB1   0280 0350
        SDBD                                    ; FCB3   0001
        CMPI    #$0DAC, R0                      ; FCB4   0378 00AC 000D
        BGE     L_FC1C                          ; FCB7   022D 009C
L_FCB9:
        B       L_FDDF                          ; FCB9   0200 0124

        MVI     G_01C2, R0                      ; FCBB   0280 01C2

        JSR     R5,     L_617A                  ; FCBD   0004 0160 017A
        BIDECLE $AE26                           ; FCC0   0026 00AE

        BNEQ    L_FC96                          ; FCC2   022C 002D

        JSR     R5,     L_61B0                  ; FCC4   0004 0160 01B0
        DECLE   $0004,  $01AC,  $01EB,  $0280   ; FCC7   0004 01AC 01EB 0280
        DECLE   $0350,  $0001,  $0378,  $00E2   ; FCCB   0350 0001 0378 00E2
        DECLE   $0004,  $020E,  $010D,  $00B8   ; FCCF   0004 020E 010D 00B8
        DECLE   $02F8,  $014C,  $0004,  $01A8   ; FCD3   02F8 014C 0004 01A8
        DECLE   $00C8,  $0002,  $0200,  $00FE   ; FCD7   00C8 0002 0200 00FE

        JSR     R5,     L_61E2                  ; FCDB   0004 0160 01E2
        DECLE   $020C,  $0058                   ; FCDE   020C 0058

        JSR     R5,     L_61B0                  ; FCE0   0004 0160 01B0
        DECLE   $0004                           ; FCE3   0004

        ANDR    R5,     R4                      ; FCE4   01AC
        XORR    R5,     R3                      ; FCE5   01EB
        MVI     G_0350, R0                      ; FCE6   0280 0350

        JSR     R5,     L_61F6                  ; FCE8   0004 0160 01F6
        DECLE   $020C,  $00F2,  $00B8,  $02F8   ; FCEB   020C 00F2 00B8 02F8
        DECLE   $0135,  $0004,  $01A8,  $00C8   ; FCEF   0135 0004 01A8 00C8
        DECLE   $0002,  $0200,  $00E3           ; FCF3   0002 0200 00E3

        MVI     G_01C2, R0                      ; FCF6   0280 01C2

        JSR     R5,     L_617A                  ; FCF8   0004 0160 017A
        BIDECLE $AE26                           ; FCFB   0026 00AE

        BNEQ    L_FC96                          ; FCFD   022C 0068

        JSR     R5,     L_61B0                  ; FCFF   0004 0160 01B0
        DECLE   $0004                           ; FD02   0004

        ANDR    R5,     R4                      ; FD03   01AC
        XORR    R5,     R3                      ; FD04   01EB
        MVII    #$01BB, R5                      ; FD05   02BD 01BB
        MOVR    R2,     R4                      ; FD07   0094
        ADDI    #$0002, R4                      ; FD08   02FC 0002
L_FD0A:
        SDBD                                    ; FD0A   0001
        MVI@    R4,     R0                      ; FD0B   02A0
        ADDI    #$0004, R4                      ; FD0C   02FC 0004
        SDBD                                    ; FD0E   0001
        MVI@    R4,     R1                      ; FD0F   02A1
        SLL     R1,     1                       ; FD10   0049
        SLL     R1,     1                       ; FD11   0049
        ADDR    R1,     R0                      ; FD12   00C8
        SLL     R1,     2                       ; FD13   004D
        ADDR    R1,     R0                      ; FD14   00C8
        MVO@    R0,     R5                      ; FD15   0268
        SWAP    R0,     1                       ; FD16   0040
        MVO@    R0,     R5                      ; FD17   0268
        SUBI    #$0006, R4                      ; FD18   033C 0006
        CMPI    #$01BD, R5                      ; FD1A   037D 01BD
        BLE     L_FD0A                          ; FD1C   0226 0013

        CLRR    R0                              ; FD1E   01C0
        MVO@    R0,     R5                      ; FD1F   0268
        MVO@    R0,     R5                      ; FD20   0268
        PSHR    R2                              ; FD21   0272
        MOVR    R3,     R2                      ; FD22   009A
        MVII    #$01BB, R4                      ; FD23   02BC 01BB
        SDBD                                    ; FD25   0001
        MVII    #$53C6, R1                      ; FD26   02B9 00C6 0053

        JSR     R5,     L_614D                  ; FD29   0004 0160 014D
        DECLE   $02B2,  $020C,  $00B0,  $00B8   ; FD2C   02B2 020C 00B0 00B8
        DECLE   $02F8,  $00EC,  $0004,  $01A8   ; FD30   02F8 00EC 0004 01A8
        DECLE   $00C8,  $0002,  $0200,  $00A1   ; FD34   00C8 0002 0200 00A1
        DECLE   $0004                           ; FD38   0004

        ANDR    R5,     R4                      ; FD39   01AC
        BPL     L_FF3C                          ; FD3A   0203 0200

        MOVR    R4,     R2                      ; FD3C   00A2
        MVI     G_0350, R0                      ; FD3D   0280 0350
        SDBD                                    ; FD3F   0001
        CMPI    #$0DAC, R0                      ; FD40   0378 00AC 000D
        BGT     L_FC96                          ; FD43   022E 00AE
        B       L_FDDF                          ; FD45   0200 0098

        MVI     G_01C2, R0                      ; FD47   0280 01C2

        JSR     R5,     L_617A                  ; FD49   0004 0160 017A
        BIDECLE $53D9                           ; FD4C   00D9 0053
        DECLE   $0204,  $0009,  $00B8,  $02F8   ; FD4E   0204 0009 00B8 02F8
        DECLE   $00E4,  $0004,  $01A8,  $00C8   ; FD52   00E4 0004 01A8 00C8
        DECLE   $0003,  $0204,  $0079,  $0280   ; FD56   0003 0204 0079 0280
        DECLE   $0350,  $0378,  $00A0,  $022E   ; FD5A   0350 0378 00A0 022E
        DECLE   $0103                           ; FD5E   0103

        B       L_FC96                          ; FD5F   0220 00CA

        DECLE   $0285,  $01C2,  $037D,  $0000   ; FD61   0285 01C2 037D 0000
        DECLE   $0204,  $0061,  $037D,  $0029   ; FD65   0204 0061 037D 0029
        DECLE   $0204,  $005D                   ; FD69   0204 005D

        MVII    #$008C, R0                      ; FD6B   02B8 008C

        JSR     R5,     X_RAND2                 ; FD6D   0004 0114 029E
        DECLE   $0080,  $0204,  $0055,  $0004   ; FD70   0080 0204 0055 0004

        ANDR    R5,     R0                      ; FD74   01A8
        ADDR    R0,     R7                      ; FD75   00C7

        DECLE   $0045,  $0001,  $020C,  $000D   ; FD76   0045 0001 020C 000D
        DECLE   $029D,  $03BD,  $0010,  $0204   ; FD7A   029D 03BD 0010 0204
        DECLE   $000D,  $0285,  $01C2,  $037D   ; FD7E   000D 0285 01C2 037D
        DECLE   $003C,  $020C,  $0054,  $0200   ; FD82   003C 020C 0054 0200
        DECLE   $0005,  $0004,  $01A8,  $0148   ; FD86   0005 0004 01A8 0148
        DECLE   $0204,  $003C                   ; FD8A   0204 003C

        B       L_FDDF                          ; FD8C   0200 0051

        MVII    #$0006, R0                      ; FD8E   02B8 0006

        JSR     R5,     X_RAND2                 ; FD90   0004 0114 029E
        DECLE   $0080,  $020C,  $0049,  $0004   ; FD93   0080 020C 0049 0004

        ANDR    R5,     R0                      ; FD97   01A8
        ADDR    R0,     R7                      ; FD98   00C7

        DECLE   $0008,  $0000,  $0204,  $0004   ; FD99   0008 0000 0204 0004
        DECLE   $02B8,  $000C,  $0200,  $0027   ; FD9D   02B8 000C 0200 0027

        PSHR    R0                              ; FDA1   0270
        MVI     G_0350, R0                      ; FDA2   0280 0350

        JSR     R5,     L_61F6                  ; FDA4   0004 0160 01F6
        DECLE   $02B0,  $022C,  $000C,  $0378   ; FDA7   02B0 022C 000C 0378
        DECLE   $003B,  $0204,  $000D           ; FDAB   003B 0204 000D

        JSR     R5,     L_61E2                  ; FDAE   0004 0160 01E2
        DECLE   $0204,  $0026,  $037D,  $0006   ; FDB1   0204 0026 037D 0006
        DECLE   $0204,  $0022,  $037D,  $0004   ; FDB5   0204 0022 037D 0004
        DECLE   $022C,  $001D,  $0200,  $001C   ; FDB9   022C 001D 0200 001C
        DECLE   $00B8,  $02F8,  $0077,  $0004   ; FDBD   00B8 02F8 0077 0004

        ANDR    R5,     R0                      ; FDC1   01A8
        ADDR    R1,     R0                      ; FDC2   00C8
        DIS                                     ; FDC3   0003
        BEQ     L_FDD2                          ; FDC4   0204 000C
        B       L_FDDF                          ; FDC6   0200 0017

        DECLE   $0004,  $01AC,  $0203           ; FDC8   0004 01AC 0203
L_FDCB:
        ANDI    #$000F, R0                      ; FDCB   03B8 000F

L_FDCD:
        JSR     R5,     L_68DA                  ; FDCD   0004 0168 00DA

        B       L_FDDF                          ; FDD0   0200 000D

L_FDD2:
        PSHR    R0                              ; FDD2   0270
        MVII    #$00FF, R0                      ; FDD3   02B8 00FF

        JSR     R5,     L_68DA                  ; FDD5   0004 0168 00DA
        DECLE   $02B0,  $0004                   ; FDD8   02B0 0004

        ANDR    R5,     R4                      ; FDDA   01AC
        BPL     L_FDE1                          ; FDDB   0203 0004

        CMPR    R4,     R4                      ; FDDD   0164
        MVO@    R7,     R5                      ; FDDE   026F
L_FDDF:
        ADDI    #$001E, R2                      ; FDDF   02FA 001E
L_FDE1:
        MVI@    R2,     R2                      ; FDE1   0292
        NEGR    R2                              ; FDE2   0022
        ADDI    #$000A, R2                      ; FDE3   02FA 000A
        MVII    #$01B4, R1                      ; FDE5   02B9 01B4
        ADD     G_01B3, R1                      ; FDE7   02C1 01B3
        MVO@    R2,     R1                      ; FDE9   024A
        PULR    R7                              ; FDEA   02B7

        PSHR    R5                              ; FDEB   0275
        ANDI    #$000F, R0                      ; FDEC   03B8 000F

        JSR     R5,     L_61DE                  ; FDEE   0004 0160 01DE

        CMPI    #$0007, R5                      ; FDF1   037D 0007
        BEQ     L_FDFD                          ; FDF3   0204 0008

        JSR     R5,     L_68DA                  ; FDF5   0004 0168 00DA
        DECLE   $02B8,  $00FE,  $0004           ; FDF8   02B8 00FE 0004

        AND@    R5,     R0                      ; FDFB   03A8
        MOVR    R0,     R1                      ; FDFC   0081

L_FDFD:
        JSR     R5,     L_68D7                  ; FDFD   0004 0168 00D7
        DECLE   $0004                           ; FE00   0004

        AND@    R5,     R0                      ; FE01   03A8
        MOVR    R3,     R0                      ; FE02   0098
        PSHR    R5                              ; FE03   0275
        PSHR    R1                              ; FE04   0271
        MVII    #$01B6, R1                      ; FE05   02B9 01B6
        ADD     G_01B3, R1                      ; FE07   02C1 01B3
        CLRR    R5                              ; FE09   01ED
        MVO@    R5,     R1                      ; FE0A   024D
        PULR    R1                              ; FE0B   02B1
        PULR    R7                              ; FE0C   02B7

        MVI@    R5,     R0                      ; FE0D   02A8
        PSHR    R5                              ; FE0E   0275
        MOVR    R0,     R5                      ; FE0F   0085
        MVII    #$01B8, R1                      ; FE10   02B9 01B8
        ADD     G_01B3, R1                      ; FE12   02C1 01B3
        CMP@    R1,     R5                      ; FE14   034D
        PULR    R7                              ; FE15   02B7

        DECLE   $0005,  $0033,  $0037,  $0039   ; FE16   0005 0033 0037 0039
        DECLE   $003C,  $0036,  $0002,  $0034   ; FE1A   003C 0036 0002 0034
        DECLE   $0030,  $0003,  $003A,  $0032   ; FE1E   0030 0003 003A 0032
        DECLE   $0039,  $0002,  $0038,  $003D   ; FE22   0039 0002 0038 003D
        DECLE   $0004,  $0001,  $001C,  $000A   ; FE26   0004 0001 001C 000A
        DECLE   $0000,  $0005,  $0030,  $0034   ; FE2A   0000 0005 0030 0034
        DECLE   $003A,  $0032,  $0039,  $0003   ; FE2E   003A 0032 0039 0003
        DECLE   $0036,  $0033,  $003C,  $0002   ; FE32   0036 0033 003C 0002
        DECLE   $0037,  $0033,  $0009,  $0009   ; FE36   0037 0033 0009 0009
        DECLE   $0040,  $001A,  $0080,  $000B   ; FE3A   0040 001A 0080 000B
        DECLE   $0040,  $0035,  $0080,  $000B   ; FE3E   0040 0035 0080 000B
        DECLE   $0112,  $00A1,  $0041,  $0113   ; FE42   0112 00A1 0041 0113
        DECLE   $0011,  $0101,  $0051,  $00C3   ; FE46   0011 0101 0051 00C3
        DECLE   $0112,  $0000,  $0021,  $0073   ; FE4A   0112 0000 0021 0073
        DECLE   $0091,  $0291,  $0133,  $0000   ; FE4E   0091 0291 0133 0000
        DECLE   $00D3,  $0042,  $0041,  $00C1   ; FE52   00D3 0042 0041 00C1
        DECLE   $0092,  $0041,  $01D1,  $00D2   ; FE56   0092 0041 01D1 00D2
        DECLE   $0004                           ; FE5A   0004

        ADDR    R4,     R2                      ; FE5B   00E2
        PSHR    R5                              ; FE5C   0275
        PSHR    R1                              ; FE5D   0271
        SUBI    #$002D, R1                      ; FE5E   0339 002D
        SDBD                                    ; FE60   0001
        ADDI    #$AE42, R1                      ; FE61   02F9 0042 00AE
        MVI@    R1,     R0                      ; FE64   0288
        MOVR    R0,     R5                      ; FE65   0085
        ANDI    #$0007, R5                      ; FE66   03BD 0007
        SLR     R0,     2                       ; FE68   0064
        MOVR    R0,     R1                      ; FE69   0081
        ANDI    #$000E, R0                      ; FE6A   03B8 000E
        SLR     R1,     2                       ; FE6C   0065
        SLR     R1,     2                       ; FE6D   0065
        PSHR    R5                              ; FE6E   0275

        JSR     R5,     X_RAND2                 ; FE6F   0004 0114 029E

        PULR    R5                              ; FE72   02B5
        ADDR    R1,     R0                      ; FE73   00C8
        INCR    R5                              ; FE74   000D
        ADDR    R7,     R5                      ; FE75   00FD
        ADD@    R5,     R7                      ; FE76   02EF

        DECLE   $0028,  $0010,  $0005           ; FE77   0028 0010 0005

        ADCR    R2                              ; FE7A   002A
        ADCR    R5                              ; FE7B   002D
        PSHR    R0                              ; FE7C   0270
        MOVR    R2,     R1                      ; FE7D   0091

        JSR     R5,     L_6991                  ; FE7E   0004 0168 0191
        DECLE   $0004                           ; FE81   0004

        SUBI    #$0023, R0                      ; FE82   0338 0023
        SLR     R0,     2                       ; FE84   0064
        SLR     R0,     1                       ; FE85   0060
L_FE86:
        ADD@    R6,     R0                      ; FE86   02F0
        PULR    R1                              ; FE87   02B1
        PSHR    R1                              ; FE88   0271
        CMPI    #$0045, R1                      ; FE89   0379 0045
        BEQ     L_FE9B                          ; FE8B   0204 000E

        PSHR    R3                              ; FE8D   0273
        CMPR    R3,     R2                      ; FE8E   015A
        BNEQ    L_FE96                          ; FE8F   020C 0005

        JSR     R5,     L_60C2                  ; FE91   0004 0160 00C2

        MOVR    R3,     R1                      ; FE94   0099
        INCR    R7                              ; FE95   000F

L_FE96:
        MOVR    R2,     R1                      ; FE96   0091
L_FE97:
        ADDI    #$0022, R1                      ; FE97   02F9 0022
        MVO@    R0,     R1                      ; FE99   0248
        PULR    R3                              ; FE9A   02B3
L_FE9B:
        MOVR    R3,     R1                      ; FE9B   0099

        JSR     R5,     L_69A1                  ; FE9C   0004 0168 01A1

        PULR    R1                              ; FE9F   02B1
        PULR    R7                              ; FEA0   02B7

        MOVR    R2,     R1                      ; FEA1   0091
        B       L_FEAF                          ; FEA2   0200 000B

        MOVR    R3,     R1                      ; FEA4   0099
        MOVR    R1,     R5                      ; FEA5   008D
        ADDI    #$0016, R5                      ; FEA6   02FD 0016
        MVI@    R5,     R5                      ; FEA8   02AD
        CMPI    #$0002, R5                      ; FEA9   037D 0002
        BLE     L_FEAF                          ; FEAB   0206 0002

        ADDI    #$0005, R0                      ; FEAD   02F8 0005
L_FEAF:
        PSHR    R0                              ; FEAF   0270

        JSR     R5,     L_6991                  ; FEB0   0004 0168 0191
        DECLE   $0003                           ; FEB3   0003

        SUBI    #$00C8, R0                      ; FEB4   0338 00C8
        SLR     R0,     1                       ; FEB6   0060
        SLR     R0,     2                       ; FEB7   0064
        NOP                                     ; FEB8   0034
        SLR     R0,     2                       ; FEB9   0064
        B       L_FE86                          ; FEBA   0220 0035

        DECLE   $001A,  $0023,  $002C,  $0037   ; FEBC   001A 0023 002C 0037
        DECLE   $0042,  $004B,  $0054,  $005D   ; FEC0   0042 004B 0054 005D
        DECLE   $0067,  $0073,  $007F,  $008C   ; FEC4   0067 0073 007F 008C
        DECLE   $0096,  $00A0,  $00AB,  $00B7   ; FEC8   0096 00A0 00AB 00B7

        ADDR    R0,     R0                      ; FECC   00C0
        ADDR    R1,     R7                      ; FECD   00CF

        ADDR    R3,     R3                      ; FECE   00DB
        ADDR    R4,     R5                      ; FECF   00E5
        ADDR    R5,     R6                      ; FED0   00EE
        ADDR    R6,     R4                      ; FED1   00F4
        SUBR    R0,     R1                      ; FED2   0101
        SUBR    R1,     R3                      ; FED3   010B
        SUBR    R2,     R4                      ; FED4   0114
        SUBR    R3,     R7                      ; FED5   011F

        DECLE   $0042,  $006F,  $0064,  $0079   ; FED6   0042 006F 0064 0079
        DECLE   $0020,  $0053,  $006C,  $0061   ; FEDA   0020 0053 006C 0061
        DECLE   $006D,  $0000,  $004B,  $006E   ; FEDE   006D 0000 004B 006E
        DECLE   $0065,  $0065,  $0020,  $0042   ; FEE2   0065 0065 0020 0042
        DECLE   $0075,  $0074,  $0074,  $0000   ; FEE6   0075 0074 0074 0000
        DECLE   $0046,  $0061,  $0063,  $0065   ; FEEA   0046 0061 0063 0065
        DECLE   $0020,  $004D,  $0061,  $0073   ; FEEE   0020 004D 0061 0073
        DECLE   $0068,  $0065,  $0072,  $0000   ; FEF2   0068 0065 0072 0000
        DECLE   $0043,  $0068,  $0065,  $0073   ; FEF6   0043 0068 0065 0073
        DECLE   $0074,  $0020,  $0053,  $006D   ; FEFA   0074 0020 0053 006D
        DECLE   $0061,  $0073,  $0068,  $0000   ; FEFE   0061 0073 0068 0000
        DECLE   $0049,  $0072,  $006F,  $006E   ; FF02   0049 0072 006F 006E
        DECLE   $0020,  $0043,  $006C,  $0061   ; FF06   0020 0043 006C 0061
        DECLE   $0077,  $0000,  $0044,  $0072   ; FF0A   0077 0000 0044 0072
        DECLE   $006F,  $0070,  $0020,  $004B   ; FF0E   006F 0070 0020 004B
        DECLE   $0069,  $0063,  $006B,  $0000   ; FF12   0069 0063 006B 0000
        DECLE   $0051,  $0075,  $0069,  $0063   ; FF16   0051 0075 0069 0063
        DECLE   $006B,  $0020,  $004A,  $0061   ; FF1A   006B 0020 004A 0061
        DECLE   $0062,  $0000,  $0043,  $0072   ; FF1E   0062 0000 0043 0072
        DECLE   $006F,  $0073,  $0073,  $0020   ; FF22   006F 0073 0073 0020
        DECLE   $0043,  $0068,  $006F,  $0070   ; FF26   0043 0068 006F 0070
        DECLE   $0000,  $0042,  $0072,  $0061   ; FF2A   0000 0042 0072 0061
        DECLE   $0069,  $006E,  $0020,  $0042   ; FF2E   0069 006E 0020 0042
        DECLE   $0075,  $0073,  $0074,  $0065   ; FF32   0075 0073 0074 0065
        DECLE   $0072,  $0000                   ; FF36   0072 0000

        SWAP    R0,     2                       ; FF38   0044
        RRC     R1,     2                       ; FF39   0075
        SLR     R3,     1                       ; FF3A   0063
        SAR     R3,     1                       ; FF3B   006B
L_FF3C:
        NEGR    R0                              ; FF3C   0020
        DECLE   $0026,  $0020,  $0043,  $006F   ; FF3D   0026 0020 0043 006F
        DECLE   $0076,  $0065,  $0072,  $0000   ; FF41   0076 0065 0072 0000
        DECLE   $0042,  $0061,  $007A,  $006F   ; FF45   0042 0061 007A 006F
        DECLE   $006F,  $006B,  $0061,  $0020   ; FF49   006F 006B 0061 0020
        DECLE   $0050,  $0075,  $006E,  $0063   ; FF4D   0050 0075 006E 0063
        DECLE   $0068,  $0000,  $0045,  $006C   ; FF51   0068 0000 0045 006C
        DECLE   $0062,  $006F,  $0077,  $0020   ; FF55   0062 006F 0077 0020
        DECLE   $0044,  $0072,  $006F,  $0070   ; FF59   0044 0072 006F 0070
        DECLE   $0000,  $0050,  $006F,  $0077   ; FF5D   0000 0050 006F 0077
        DECLE   $0065,  $0072,  $0020,  $004B   ; FF61   0065 0072 0020 004B
        DECLE   $0069,  $0063,  $006B,  $0000   ; FF65   0069 0063 006B 0000
        DECLE   $0043,  $006C,  $006F,  $0074   ; FF69   0043 006C 006F 0074
        DECLE   $0068,  $0065,  $0073,  $006C   ; FF6D   0068 0065 0073 006C
        DECLE   $0069,  $006E,  $0065,  $0000   ; FF71   0069 006E 0065 0000
        DECLE   $0047,  $0069,  $0061,  $006E   ; FF75   0047 0069 0061 006E
        DECLE   $0074,  $0020,  $0053,  $0070   ; FF79   0074 0020 0053 0070
        DECLE   $006C,  $0061,  $0073,  $0068   ; FF7D   006C 0061 0073 0068
        DECLE   $0000,  $004D,  $0065,  $0067   ; FF81   0000 004D 0065 0067
        DECLE   $0061,  $002D,  $004C,  $0065   ; FF85   0061 002D 004C 0065
        DECLE   $0061,  $0070,  $0000,  $0046   ; FF89   0061 0070 0000 0046
        DECLE   $006C,  $0079,  $0069,  $006E   ; FF8D   006C 0079 0069 006E
        DECLE   $0067,  $0020,  $0053,  $0069   ; FF91   0067 0020 0053 0069
        DECLE   $0074,  $0020,  $0044,  $0072   ; FF95   0074 0020 0044 0072
        DECLE   $006F,  $0070,  $0000,  $0042   ; FF99   006F 0070 0000 0042
        DECLE   $0061,  $0063,  $006B,  $0020   ; FF9D   0061 0063 006B 0020
        DECLE   $0042,  $0072,  $0065,  $0061   ; FFA1   0042 0072 0065 0061
        DECLE   $006B,  $0065,  $0072,  $0000   ; FFA5   006B 0065 0072 0000
        DECLE   $0053,  $0070,  $0069,  $006E   ; FFA9   0053 0070 0069 006E
        DECLE   $0020,  $0048,  $0065,  $0061   ; FFAD   0020 0048 0065 0061
        DECLE   $0076,  $0065,  $0000,  $0046   ; FFB1   0076 0065 0000 0046
        DECLE   $006C,  $0069,  $0070,  $0020   ; FFB5   006C 0069 0070 0020
        DECLE   $004B,  $0069,  $0063,  $006B   ; FFB9   004B 0069 0063 006B
        DECLE   $0000,  $0053,  $0075,  $0070   ; FFBD   0000 0053 0075 0070
        DECLE   $006C,  $0065,  $0078,  $0000   ; FFC1   006C 0065 0078 0000
        DECLE   $0052,  $0061,  $0069,  $006E   ; FFC5   0052 0061 0069 006E
        DECLE   $0062,  $006F,  $0077,  $0020   ; FFC9   0062 006F 0077 0020
        DECLE   $0050,  $0075,  $006E,  $0063   ; FFCD   0050 0075 006E 0063
        DECLE   $0068,  $0000,  $0052,  $006F   ; FFD1   0068 0000 0052 006F
        DECLE   $0070,  $0065,  $0020,  $0053   ; FFD5   0070 0065 0020 0053
        DECLE   $006C,  $0069,  $006E,  $0067   ; FFD9   006C 0069 006E 0067
        DECLE   $0000,  $0048,  $0065,  $0061   ; FFDD   0000 0048 0065 0061
        DECLE   $0064,  $0020,  $0042,  $0075   ; FFE1   0064 0020 0042 0075
        DECLE   $0074,  $0074,  $0000,  $0050   ; FFE5   0074 0074 0000 0050
        DECLE   $006F,  $0073,  $0073,  $0075   ; FFE9   006F 0073 0073 0075
        DECLE   $006D,  $0020,  $0052,  $006F   ; FFED   006D 0020 0052 006F
        DECLE   $006C,  $006C,  $0000           ; FFF1   006C 006C 0000

        RLC     R0,     1                       ; FFF4   0050
        SAR     R1,     1                       ; FFF5   0069
        SAR     R0,     2                       ; FFF6   006C
        SLR     R1,     2                       ; FFF7   0065
        NEGR    R0                              ; FFF8   0020
        SWAP    R0,     2                       ; FFF9   0044
        RRC     R2,     1                       ; FFFA   0072
        SAR     R1,     1                       ; FFFB   0069
        RRC     R2,     2                       ; FFFC   0076
        SLR     R1,     2                       ; FFFD   0065
        RRC     R2,     1                       ; FFFE   0072
        DECLE   $0000                           ; FFFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5011       <entry>
;;  $5019       $5014  
;;  $501A       $501D  
;;  $5047       $504B   $523E  
;;  $505A       $5055  
;;  $5064       $5058   $505F  
;;  $5074       $5070  
;;  $507E       $507A  
;;  $50AC       $5111  
;;  $50C1       $50BB  
;;  $50D4       $50D0  
;;  $50DC       $50CA  
;;  $5100       $50F6   $50FC  
;;  $5102       $50C5  
;;  $510D       $50AF  
;;  $511A       $5116  
;;  $513B       $5173  
;;  $513F       $5131   $5135  
;;  $5156       $5150  
;;  $515A       $5139   $5154  
;;  $5163       $5160  
;;  $5171       $515E   $5167  
;;  $5175       $5125   $513D  
;;  $518D       $5189   $522D   $5231  
;;  $51CE       $51C4  
;;  $51E5       $5218  
;;  $51EA       $51D9   $51E1  
;;  $51F3       $51D2  
;;  $5209       $5200  
;;  $521E       $5213  
;;  $5224       $5194   $519C   $51AB   $51CC  
;;  $5233       $517F   $51B3   $51B7   $51E8   $5207   $5222   $5227  
;;  $5240       $5515   $5564   $64C8   $64FF   $6548   $6559   $65AE   $65D7  
;;  $5240       $6626   $6780  
;;  $5243       $56A7   $56D2   $56DD   $69FE   $6A05   $6A0C   $6A13   $6A1A  
;;  $5243       $6A2A   $6A43   $6A62   $6A81  
;;  $5244       $5242  
;;  $524B       $5250   $5254   $544D  
;;  $524C       $5064  
;;  $525A       $511E  
;;  $5260       $5348  
;;  $52BC       $52A6  
;;  $52CF       $52C8  
;;  $52D4       $52BA   $52CD  
;;  $52D9       $528C   $537D  
;;  $52E2       $5284   $529B   $52B3   $52D7  
;;  $52F0       $52E4   $5353   $5360   $5371  
;;  $52F1       $5357  
;;  $52F9       $527F  
;;  $52FA       $52F8  
;;  $5322       $531F  
;;  $5334       $5331  
;;  $533E       $5307   $530C   $5313   $5326  
;;  $5344       $5264   $52E0   $533C   $536A   $5388  
;;  $536E       $538C  
;;  $5383       $5338  
;;  $5385       $5381  
;;  $538E       $52DD  
;;  $53AE       $53AA  
;;  $53BE       $5395   $539D  
;;  $53C0       $53A3  
;;  $53E6       $5281   $5297   $52AF   $52D4   $6EE2  
;;  $53ED       $542C  
;;  $540F       $5416   $5421  
;;  $5413       $540D  
;;  $541C       $5409  
;;  $5426       $53EF   $53F2   $53F5   $53F8  
;;  $5443       $5438   $543C   $5440  
;;  $5444       $541A   $5424  
;;  $5448       $5233  
;;  $5450       $590D  
;;  $545E       $5453  
;;  $5473       $5463   $546E  
;;  $5493       $5491  
;;  $5497       $5495  
;;  $54BA       $5067  
;;  $54CD       $54CA  
;;  $551C       $54F4  
;;  $5528       $54FC   $5502   $5524  
;;  $5532       $54C4   $54E3  
;;  $5543       $553F  
;;  $554D       $5546  
;;  $5570       $5536   $5544   $554B  
;;  $5581       $5574  
;;  $5593       $5586   $5589   $558D  
;;  $55A5       $5597   $559C   $55A0  
;;  $55BD       $55B7  
;;  $55C5       $55BF  
;;  $55CC       $55BB   $55C3  
;;  $55D6       $55E5  
;;  $55E1       $55DA  
;;  $55E7       $55D0  
;;  $55EF       $55FC  
;;  $55F8       $55F2   $55F5  
;;  $55FE       $54BF   $55EB  
;;  $55FF       $5475   $54DD   $58FF   $5A70   $60A9   $6E6A   $F7EE  
;;  $5601       $55DE   $5C63   $6110   $69B8   $6EA3  
;;  $5618       $5618  
;;  $5621       $5828   $58B8   $5A0D  
;;  $5625       $5629  
;;  $562C       $5DC9   $5DD0   $5DD7   $5EC1   $5F33  
;;  $562D       $5E90  
;;  $562E       $563F  
;;  $5643       $5044  
;;  $5644       $64B3  
;;  $567F       $5666   $566C  
;;  $5682       $56E1  
;;  $569E       $56B8  
;;  $56D2       $56C7  
;;  $56D6       $56AB  
;;  $56E3       $56A4   $5876  
;;  $56E8       $5AA5   $5AAA   $5AC2   $5B72   $5BB2   $5BCC   $658F  
;;  $56E9       $5B5E   $5CB0   $5CC5   $5CF5  
;;  $56EA       $56E6  
;;  $56EF       $5708  
;;  $56F9       $56F3  
;;  $56FA       $56F8  
;;  $5703       $5700  
;;  $570A       $56FC  
;;  $570E       $5721   $5947  
;;  $570F       $5679   $5693   $56AD   $56BA   $56C9   $59DA   $59F3   $5A52  
;;  $570F       $5CEA  
;;  $5712       $5725  
;;  $5716       $5729  
;;  $571C       $572D   $5734  
;;  $5736       $5A28  
;;  $5739       $5746  
;;  $5748       $5742  
;;  $574C       $575C  
;;  $5751       $5759  
;;  $5788       $581F   $584E  
;;  $5792       $57A6  
;;  $57A9       $5D52  
;;  $57BA       $57E0  
;;  $57BC       $57DC  
;;  $57E4       $57B3  
;;  $57E8       $5810  
;;  $57EA       $580A  
;;  $5814       $57E2  
;;  $581F       $5819  
;;  $5822       $57B1  
;;  $5823       $567F   $69C3   $6AB3  
;;  $584B       $5858  
;;  $585B       $550A   $552A   $5559  
;;  $585E       $66D0  
;;  $586A       $585C   $5866  
;;  $587F       $516B   $55A2   $586B  
;;  $588E       $5880  
;;  $58A8       $5895  
;;  $58A9       $5899  
;;  $58AA       $589D  
;;  $58AC       $58A1  
;;  $58AD       $58A5  
;;  $58AF       $6A7A  
;;  $58DA       $58DE  
;;  $58E0       $58E5  
;;  $58EF       $58F3  
;;  $5939       $5761   $58C4   $5907   $5AB6   $5ACF  
;;  $593A       $573D  
;;  $593B       $5954   $5961  
;;  $5945       $593F  
;;  $5946       $5944  
;;  $5956       $594F  
;;  $5963       $6C1D  
;;  $596C       $5968  
;;  $59B5       $5987   $61A9  
;;  $59BF       $59BC  
;;  $59C4       $59C1  
;;  $59C9       $59C5  
;;  $59CA       $59C8  
;;  $59CC       $64AD   $6864  
;;  $59E5       $64CC  
;;  $59FE       $655D  
;;  $5A39       $6503  
;;  $5A5D       $65DB  
;;  $5A68       $6669  
;;  $5A7F       $5A7B  
;;  $5A8C       $5A83  
;;  $5AAD       $5A8A  
;;  $5ACC       $5AB1  
;;  $5AD6       $5AC5  
;;  $5AE0       $5ADC  
;;  $5AEA       $5AE6  
;;  $5AFC       $5AF6  
;;  $5AFE       $5B13  
;;  $5B0E       $5B07  
;;  $5B27       $5519   $6F55  
;;  $5B4A       $6556  
;;  $5B5A       $5B77  
;;  $5B61       $5B56  
;;  $5B72       $5B6B  
;;  $5B79       $65D4  
;;  $5B93       $5B8F  
;;  $5B9C       $5B96  
;;  $5B9F       $5A87  
;;  $5BA0       $5B9E  
;;  $5BAE       $5BA8  
;;  $5BB9       $5B41   $5B50   $5B82  
;;  $5BBA       $59E2   $59FB   $5A5A  
;;  $5BBC       $5BC6   $5BD0  
;;  $5BC8       $5BC3  
;;  $5BD2       $5BBF  
;;  $5BFB       $5A2D  
;;  $5BFC       $5A32   $68A7  
;;  $5C05       $5C01  
;;  $5C15       $5C34  
;;  $5C1E       $5C27  
;;  $5C36       $5C2D  
;;  $5C42       $5C4D  
;;  $5C57       $5C54  
;;  $5C63       $5C60  
;;  $5C70       $5C6B  
;;  $5C78       $5B9A  
;;  $5C89       $5C70   $6586  
;;  $5C93       $5AD3  
;;  $5C94       $68D4  
;;  $5CA3       $5C9D  
;;  $5CAC       $5B0A   $6612  
;;  $5CB3       $585F   $5CA6   $5CAD  
;;  $5CBE       $5C80  
;;  $5CBF       $5C86   $5CA9  
;;  $5CC8       $5A40   $5A46  
;;  $5CC9       $5B44  
;;  $5CCA       $5AEA  
;;  $5CCD       $5CD3  
;;  $5CD6       $64B0  
;;  $5D55       $5D4E  
;;  $5D61       $5D5D  
;;  $5D7A       $5CFC   $5D03  
;;  $5D95       $5D91  
;;  $5DA3       $5D7D  
;;  $5DB2       $5DAD  
;;  $5DB7       $5DA9  
;;  $5DB9       $5DA1   $5DB5  
;;  $5DC6       $5DDC  
;;  $5DDE       $5DBC  
;;  $5DE7       $5DE2  
;;  $5DE8       $5DA3  
;;  $5DEE       $5DF3  
;;  $5DF6       $5DF1  
;;  $5E02       $5E00  
;;  $5E15       $5E1E  
;;  $5E2C       $5E48  
;;  $5E37       $5E50  
;;  $5E38       $5F22  
;;  $5E4A       $5E40  
;;  $5E68       $5E64  
;;  $5E76       $5E7B  
;;  $5E88       $5E9D   $5EA9   $5EB5  
;;  $5E8E       $5E8A  
;;  $5E90       $5F41  
;;  $5ED3       $5EE0  
;;  $5F03       $5F0D  
;;  $5F69       $5F67  
;;  $5F7B       $5086  
;;  $5F9A       $5F93  
;;  $5FA7       $5F9F  
;;  $5FA8       $5FA6  
;;  $5FD5       $5FC9   $5FCD   $5FD1  
;;  $5FE8       $5F96  
;;  $5FFC       $5FF0  
;;  $5FFD       $5FFB  
;;  $5FFF       $6021  
;;  $6008       $6002  
;;  $6019       $6006  
;;  $6024       $5F82   $5F8B   $5F91  
;;  $6048       $5032   $5682   $6012   $603C   $F965  
;;  $6051       $5A11   $65B2  
;;  $6054       $5672   $582C   $59CC   $59E5   $5A3D   $5A68   $5B27   $5B7A  
;;  $6054       $5CD6   $5D9D   $6553   $6A74  
;;  $6055       $6053  
;;  $605C       $59E8   $654C  
;;  $6067       $565F   $5A0A   $5B32   $6A77  
;;  $606E       $59D3   $5A1B   $5A6D   $5B35   $5CE7   $65B5   $69C6   $6A71  
;;  $6086       $5870   $5A95   $5A9C   $5CBF  
;;  $608B       $6098  
;;  $6095       $608F  
;;  $6096       $6094  
;;  $60A0       $69E5   $6A85  
;;  $60A3       $5548   $554D  
;;  $60AF       $6E49   $6FE7  
;;  $60BA       $60B2   $6105  
;;  $60BB       $663E  
;;  $60C2       $5196   $5315   $5362   $5373   $646D   $667D   $697D   $6B30  
;;  $60C2       $F97A   $FE91  
;;  $60CA       $60C6  
;;  $60CB       $565C   $5A00   $69D4   $6A23   $6A90  
;;  $60D4       $50F3   $51E5   $520C   $536E   $5385   $552F   $60CE   $66E0  
;;  $60D4       $691D   $6985   $6BBA   $6BF4   $F895  
;;  $60D5       $53C0   $60D3   $697A  
;;  $60FE       $53BA   $6CEE  
;;  $610C       $610E  
;;  $6110       $610A  
;;  $6113       $64C1   $64EE   $6779  
;;  $6115       $6524  
;;  $611A       $6124  
;;  $6127       $525B   $62C7   $6B1B  
;;  $6132       $612F   $6238  
;;  $6139       $5657   $5A21   $6A8B   $6B0F  
;;  $613C       $614A  
;;  $614D       $51A8   $6733   $F921   $FA03   $FD29  
;;  $6158       $6155  
;;  $6163       $6160  
;;  $616E       $616B  
;;  $6173       $6159   $6164   $616F   $6208   $620B  
;;  $6175       $622C  
;;  $617A       $51BF   $51C7   $51D4   $51DC   $5202   $612A   $6465   $66C1  
;;  $617A       $66C8   $FA97   $FC87   $FCBD   $FCF8   $FD49  
;;  $617C       $F90C   $F911  
;;  $6180       $6178   $6184  
;;  $6186       $6181  
;;  $6187       $5941  
;;  $618C       $56F5   $5712   $5716   $571C   $6091  
;;  $618F       $618A  
;;  $6190       $6198  
;;  $619B       $670A   $F97D  
;;  $619E       $FA0B   $FA11   $FB8E  
;;  $61B0       $61C6   $FA3C   $FACB   $FC0B   $FC7A   $FCC4   $FCE0   $FCFF  
;;  $61B3       $FCA2  
;;  $61B7       $F9DA  
;;  $61C4       $66FE   $FA89   $FBFE  
;;  $61DB       $61D6  
;;  $61DE       $6687   $68EF   $F88A   $F9A5   $FAF4   $FB0A   $FBF7   $FDEE  
;;  $61E2       $6705   $675D   $F99E   $FAE7   $FCDB   $FDAE  
;;  $61E4       $61E0  
;;  $61ED       $61E9  
;;  $61EE       $50D9   $5341   $6143   $6961   $6E7F   $F8A3  
;;  $61F6       $670D   $FB92   $FCE8   $FDA4  
;;  $6206       $6201  
;;  $620F       $66DD   $6977  
;;  $6211       $66DA  
;;  $6212       $6210  
;;  $6219       $6545   $678F  
;;  $6220       $6240  
;;  $6224       $622F   $6234  
;;  $6236       $6221  
;;  $6284       $6282  
;;  $62A3       $62A1  
;;  $62C6       $5175  
;;  $62C7       $62C5  
;;  $62E0       $62DC  
;;  $62E2       $63C7   $63CB  
;;  $632B       $6328  
;;  $6344       $633E  
;;  $6368       $6364  
;;  $636E       $636B  
;;  $63CD       $63BD  
;;  $63CE       $6337   $637B   $63A5  
;;  $63D8       $63D2  
;;  $63D9       $6348   $6383   $63AD  
;;  $63E6       $63E0  
;;  $63EF       $63E9  
;;  $63FD       $6358   $638C   $63B6  
;;  $640A       $5A18  
;;  $6415       $642A  
;;  $6416       $641C   $641F   $6422  
;;  $641B       $F314  
;;  $642D       $631D   $6322   $635F   $639F  
;;  $642E       $F801  
;;  $6436       $632B  
;;  $643C       $636E   $6438  
;;  $6440       $6395   $F811   $F847  
;;  $6441       $643F  
;;  $644D       $644A  
;;  $644E       $6334   $6378   $63A2  
;;  $6457       $6453  
;;  $6458       $6308  
;;  $647F       $647C  
;;  $6481       $645D   $646A  
;;  $6489       $5061  
;;  $64B0       $64AB  
;;  $64E0       $64DB  
;;  $64EE       $64EA  
;;  $6512       $F32E  
;;  $6515       $650E  
;;  $6537       $6543  
;;  $654C       $678B  
;;  $6556       $65CE  
;;  $657C       $6573  
;;  $65D0       $65BB   $65C4   $6792  
;;  $65D4       $6634  
;;  $65F7       $65EE  
;;  $661A       $65F9  
;;  $6636       $64B7   $64BB   $64D0   $64D4   $6516   $651A   $6568   $65E2  
;;  $6636       $65FC   $676F   $6773  
;;  $663A       $662E   $678D  
;;  $6644       $648E  
;;  $6650       $6492  
;;  $6669       $67AE  
;;  $667D       $6677  
;;  $66A6       $6817  
;;  $66CF       $66EA   $66EE   $6714  
;;  $66DD       $66D8   $673B   $6743   $F8C4  
;;  $66E8       $66BF  
;;  $66EC       $66C6  
;;  $66F0       $64E3   $64F9   $64FD   $651F   $652F   $6533   $6580   $659A  
;;  $66F0       $65A0   $6646   $6652   $6685   $66AB   $66B5   $6703   $6708  
;;  $66F0       $6710   $671A   $6720   $6737   $675B   $6760  
;;  $66F1       $66CD  
;;  $670A       $66FC  
;;  $672C       $6728  
;;  $6732       $6769  
;;  $675D       $6750  
;;  $6762       $6815  
;;  $67B0       $67AA  
;;  $67BE       $67BC  
;;  $67C3       $67C1  
;;  $67D0       $6494   $6648   $6654   $676B   $6861   $6867   $68AA  
;;  $67E1       $67D1   $67D5   $67DB  
;;  $67E2       $65DE   $6794   $68AD  
;;  $67EB       $67E8  
;;  $67EF       $67EC  
;;  $67F6       $67F6  
;;  $6807       $6805  
;;  $6843       $6843  
;;  $6871       $686E  
;;  $687F       $6878  
;;  $6891       $688B  
;;  $6896       $688F   $6893  
;;  $68BB       $68B6  
;;  $68C6       $68C0  
;;  $68C7       $68C4  
;;  $68D7       $FDFD  
;;  $68DA       $6AE3   $FAE1   $FDCD   $FDD5   $FDF5  
;;  $68DB       $6AED  
;;  $68E1       $68DF  
;;  $68E8       $68E4  
;;  $68FC       $68F6  
;;  $6912       $698E  
;;  $6921       $68D8   $6918  
;;  $692C       $6929  
;;  $6956       $693D  
;;  $6964       $6886   $68ED   $68FA   $696B   $696F  
;;  $6965       $6914  
;;  $6975       $68F2  
;;  $697A       $6967   $6973  
;;  $6990       $5A8E   $5C05   $5C57   $5C78   $6946   $6E31   $6F14   $6F2B  
;;  $6991       $6E37   $FE7E   $FEB0  
;;  $6994       $6318  
;;  $69A1       $6F41   $F8BE   $FE9C  
;;  $69A3       $5579   $557E   $6AA2   $6AA6  
;;  $69AA       $69A7  
;;  $69B0       $69AC  
;;  $69B8       $69B5  
;;  $69BD       $6641  
;;  $69F4       $6A60  
;;  $6A62       $6A31  
;;  $6A66       $664D  
;;  $6A71       $556D   $67B0  
;;  $6A85       $666C  
;;  $6AA2       $6AAD  
;;  $6AC5       $6810  
;;  $6ACB       $69FB   $6A02   $6A09   $6A10   $6A17   $6A1E  
;;  $6AED       $6AE0  
;;  $6AF0       $69F4  
;;  $6B02       $6AFA  
;;  $6B0F       $6B05  
;;  $6B1A       $5083  
;;  $6B20       $6B65   $6BBD  
;;  $6B30       $6B7F   $6B88   $6BA5   $6BC6   $6BCB   $6BD5   $6BD9   $6BF0  
;;  $6B30       $6BF8   $6C22   $6CF1   $6D08   $6D1A   $6D6A   $6E4C   $6E54  
;;  $6B30       $6E63   $6E6F   $6EA6   $6EAF  
;;  $6B57       $6B55  
;;  $6B61       $6B79  
;;  $6B68       $6EDC   $6F12  
;;  $6B81       $6FEC  
;;  $6BA3       $6BB8   $6CE1  
;;  $6BA4       $6B92   $6BA9   $6BB4   $6EC8   $6F1F  
;;  $6BA7       $6B96   $6D7D  
;;  $6BAB       $6B9A  
;;  $6BB2       $6BAE  
;;  $6BB6       $6B9E  
;;  $6BBA       $6D3D   $6F3B  
;;  $6BD7       $6BD2  
;;  $6BEB       $6E46  
;;  $6BED       $6BDD   $6BE1   $6BE5   $6BE9  
;;  $6BEE       $6CE7  
;;  $6BF2       $6F64  
;;  $6C12       $6C36   $6C3A  
;;  $6C1D       $6C9D  
;;  $6C29       $6C44   $6C4B   $6C53  
;;  $6C33       $6C2F  
;;  $6CF8       $6CF5  
;;  $6D01       $6CFE  
;;  $6D03       $6CFA   $6E0F   $6E24  
;;  $6D04       $6D0F   $6E17  
;;  $6D0C       $6D4A  
;;  $6D0D       $6D14  
;;  $6D3F       $6D35   $6D39  
;;  $6D42       $6D31  
;;  $6D63       $6D56   $6D71   $6E88   $6FC9  
;;  $6D67       $6D92   $6DB1   $6DC6   $6DE4   $6DF4   $6DF7   $6EF9   $6F53  
;;  $6D67       $6FD5  
;;  $6D6D       $6D74  
;;  $6D8C       $6D89  
;;  $6DC0       $6DBD  
;;  $6DD4       $6D96   $6D9A   $6D9E  
;;  $6DD5       $6DD2  
;;  $6DDA       $6DCD  
;;  $6DE7       $6DFA  
;;  $6E06       $6E02  
;;  $6E20       $6E2F  
;;  $6E22       $6E1E   $6E2D  
;;  $6E5E       $6E58  
;;  $6E65       $6E5C  
;;  $6EA3       $6EA0  
;;  $6EAF       $6EE5   $6EE9   $6F01   $6F05   $6F0C   $6F29   $6F37   $6F44  
;;  $6EAF       $6F61   $6F7E   $6F81   $6F86   $6F9E   $6FC0   $6FF3  
;;  $6EDC       $6ED2   $6ED8  
;;  $6EF9       $6EF6  
;;  $6F63       $6F5E  
;;  $6F69       $6FB6  
;;  $6F80       $6FB0  
;;  $6F85       $6F78   $6FB2  
;;  $6F88       $6F83  
;;  $6F94       $6F9C  
;;  $6FA0       $6F72  
;;  $6FCD       $6FD9  
;;  $6FEC       $6FE3  
;;  $6FF5       $6D80   $6DAC   $6DB4   $6DDC   $6DE8  
;;  $6FFD       $6FFA  
;;  $D07C       $D07A  
;;  $D161       $D15F  
;;  $D16B       $D46A  
;;  $D179       $D171  
;;  $D17F       $D07D  
;;  $D191       $D08F  
;;  $D1A1       $D19F  
;;  $D1D9       $D4DE  
;;  $D20F       $D00D  
;;  $D223       $D121  
;;  $D29F       $D181  
;;  $D303       $D301  
;;  $D318       $D20B   $D20D  
;;  $D31A       $D318  
;;  $D31B       $D319   $D33B  
;;  $D32B       $D1EF  
;;  $D33D       $D33D  
;;  $D363       $D361  
;;  $D36F       $D26D  
;;  $D373       $D271  
;;  $D393       $D287  
;;  $D3AB       $D6BE  
;;  $D3C1       $D28F  
;;  $D3DB       $D3D5  
;;  $D3FC       $D2EA  
;;  $D41B       $D415  
;;  $D45F       $D15D  
;;  $D4BD       $D45B  
;;  $D4C0       $D3BE  
;;  $D4C8       $D3C6  
;;  $D4D3       $D3C3  
;;  $D4EE       $D4EC  
;;  $D500       $D5FF  
;;  $D505       $D4FD  
;;  $D50B       $D509  
;;  $D533       $D531  
;;  $D534       $D432  
;;  $D553       $D38E  
;;  $D567       $D266  
;;  $D56D       $D453  
;;  $D57B       $D479  
;;  $D59B       $D579  
;;  $D5A3       $D529  
;;  $D5C9       $D5C7  
;;  $D5DA       $D4D8  
;;  $D5ED       $D4E9  
;;  $D605       $D503  
;;  $D607       $D505  
;;  $D614       $D4DA  
;;  $D640       $D63E  
;;  $D643       $D441  
;;  $D647       $D565  
;;  $D64B       $D649  
;;  $D65B       $D559  
;;  $D667       $D665  
;;  $D675       $D573  
;;  $D693       $D591  
;;  $D699       $D597  
;;  $D69B       $D699  
;;  $D6AF       $D6AD  
;;  $D6C3       $D5C1  
;;  $D6CB       $D6C9  
;;  $D6E1       $D5DF  
;;  $D6E7       $D5E5  
;;  $D6F5       $D61B  
;;  $D709       $D607  
;;  $D713       $D511  
;;  $D719       $D5AB  
;;  $D71B       $D419   $D519  
;;  $D723       $D421  
;;  $D75B       $D659  
;;  $D76F       $D56D  
;;  $D773       $D471  
;;  $D783       $D681  
;;  $D7B0       $D8AF  
;;  $D7C3       $D4C1  
;;  $D7C7       $D4C5  
;;  $D7E7       $D6E5  
;;  $D7F1       $D5E9  
;;  $D7F2       $D5D8  
;;  $D803       $D501  
;;  $D853       $D551  
;;  $D864       $D993  
;;  $D873       $D571  
;;  $D89F       $D78D  
;;  $D8AB       $D5A9  
;;  $D8BB       $D5B9  
;;  $D8CE       $DACB  
;;  $D903       $D801  
;;  $D90B       $D90B  
;;  $D90C       $D609  
;;  $D913       $D611  
;;  $D944       $D929  
;;  $D970       $D86E  
;;  $D973       $D671  
;;  $D992       $D690  
;;  $D9AB       $D6A9  
;;  $DA11       $DB21  
;;  $DA77       $D971  
;;  $DAD8       $DAD6  
;;  $DAD9       $DAD7  
;;  $DAFD       $D9FB  
;;  $DAFF       $D9FD  
;;  $DB50       $DA4F  
;;  $DB73       $D811  
;;  $DBA4       $DAA1  
;;  $DBA8       $DBA5  
;;  $DBBB       $DBB9  
;;  $DBFB       $DBF9  
;;  $DC11       $DB0F  
;;  $DC13       $DB11  
;;  $DC2F       $DBAD  
;;  $DC44       $DC44  
;;  $DC58       $DA57  
;;  $DC5D       $DA5F  
;;  $DC80       $DB77  
;;  $DC97       $DC95  
;;  $DCAD       $DB1F  
;;  $DCB0       $DB4B  
;;  $DCB3       $D9B1  
;;  $DCB7       $D9B5   $DBB5  
;;  $DCC3       $DBA9  
;;  $DCCD       $DACD  
;;  $DCD3       $D9D1  
;;  $DCE6       $DBE3  
;;  $DCE9       $DBE5  
;;  $DCEE       $D9EC  
;;  $DD03       $DBF7  
;;  $DD6A       $DDA3  
;;  $DD75       $DB71  
;;  $DD95       $DC93  
;;  $DDE4       $DDE2  
;;  $DDEC       $DDEA  
;;  $DE2D       $DD80  
;;  $DE80       $DD7E  
;;  $DEC3       $DBBD  
;;  $DF2F       $DE2A  
;;  $DF5A       $DD59  
;;  $DF91       $DB91  
;;  $F147       $F147  
;;  $F14A       $F14A  
;;  $F1AF       $F1AD  
;;  $F25C       $F58C  
;;  $F2E3       $F21A  
;;  $F349       $F4EF  
;;  $F35C       $F61F  
;;  $F366       $F209  
;;  $F38E       $F3CF  
;;  $F3B3       $F35C  
;;  $F3DD       $F3DD  
;;  $F3F2       $F6B5  
;;  $F416       $F679  
;;  $F41C       $F67F  
;;  $F41E       $F69D  
;;  $F420       $F6A3   $F703  
;;  $F427       $F466  
;;  $F457       $F548  
;;  $F4A2       $F667  
;;  $F4AB       $F457  
;;  $F4F9       $F538  
;;  $F536       $F3C7  
;;  $F556       $F595  
;;  $F55D       $F4E6  
;;  $F59C       $F455  
;;  $F63D       $F356  
;;  $F647       $F727  
;;  $F64A       $F648  
;;  $F65A       $F658  
;;  $F676       $F676  
;;  $F6A8       $F6A8  
;;  $F6CF       $F558  
;;  $F6EF       $F3CC  
;;  $F700       $F3A9  
;;  $F716       $F714  
;;  $F71B       $F3C4  
;;  $F74D       $F643  
;;  $F762       $F767  
;;  $F769       $F764  
;;  $F76B       $F760   $F770  
;;  $F772       $F76D  
;;  $F774       $F75C  
;;  $F77A       $F775  
;;  $F78D       $F783  
;;  $F790       $F787   $F78E  
;;  $F795       $F792  
;;  $F79A       $F79E  
;;  $F7A6       $F7A2  
;;  $F7A8       $F798   $F7B0  
;;  $F7B8       $F7B4   $F7E2   $F7E8   $F834  
;;  $F7BC       $F7CA  
;;  $F7C7       $F722  
;;  $F7D7       $F7CF  
;;  $F7E4       $F7DD  
;;  $F810       $F4ED  
;;  $F827       $F858  
;;  $F843       $F83F  
;;  $F847       $F860  
;;  $F883       $F87E  
;;  $F88A       $F886  
;;  $F8A6       $F891   $F8A9   $F8B0  
;;  $F8A7       $F88D  
;;  $F8C2       $F8B8  
;;  $F8D9       $F8F4  
;;  $F8DF       $F8DA  
;;  $F8EF       $F907   $F90A   $F90F   $F914   $F924  
;;  $F8F8       $F8F0  
;;  $F94E       $F94A  
;;  $F957       $F953   $F96D   $F978  
;;  $F965       $F962  
;;  $F97A       $F975  
;;  $F992       $F98F  
;;  $FA4A       $FA29  
;;  $FAB6       $FA81   $FA95  
;;  $FAD7       $FA23   $FA5B   $FA7D   $FA91  
;;  $FADD       $FAC7  
;;  $FB0F       $FAEA   $FAF2   $FAF9   $FAFD   $FB01   $FB05  
;;  $FB1C       $FB49   $FB53   $FB66   $FB82   $FBB0   $FBC7   $FBDA   $FBE5  
;;  $FB2E       $FB2A  
;;  $FB30       $FB21  
;;  $FB68       $FB5E  
;;  $FB8C       $FB87  
;;  $FBC9       $FBC1  
;;  $FBED       $FBDC  
;;  $FC05       $F60A  
;;  $FC0B       $FBFC   $FC03  
;;  $FC1A       $FB51   $FB5C   $FB80   $FBB2   $FBE7   $FBF3   $FC14  
;;  $FC1C       $FA21   $FA5D   $FAD5   $FCB7  
;;  $FC31       $FAC9   $FADD  
;;  $FC55       $FC51  
;;  $FC7A       $FC67   $FC6D  
;;  $FC96       $FC78   $FCC2   $FCFD   $FD43   $FD5F  
;;  $FCA2       $FC9D  
;;  $FCB1       $FCA9   $FCAD  
;;  $FCB9       $F99A   $F9E0  
;;  $FD0A       $FD1C  
;;  $FDCB       $FC7D   $FCA5  
;;  $FDCD       $FC98  
;;  $FDD2       $FDC4  
;;  $FDDF       $FB0D   $FCB9   $FD45   $FD8C   $FDC6   $FDD0  
;;  $FDE1       $FDDB  
;;  $FDFD       $FDF3  
;;  $FE86       $FEBA  
;;  $FE96       $FE8F  
;;  $FE97       $FE95  
;;  $FE9B       $FE8B  
;;  $FEAF       $FEA2   $FEAB  
;;  $FF3C       $FD3A  
;; ======================================================================== ;;
