
        ORG     $5000
.HEADER:
        BIDECLE $5D2B           ; 5000  Ptr: MOB graphic images
        BIDECLE $5015           ; 5002  Ptr: EXEC timer table
        BIDECLE $50ED           ; 5004  Ptr: Start of game
        BIDECLE $5D23           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5D3B           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501F           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $01F0                           ; 5014   01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5015  Timer dispatch/interval
        DECLE   $007C,  $0052,  $0001,  $0000; 5019  Timer dispatch/interval
        BIDECLE $0000           ; 501D  End of timer table

.TITLE:
        DECLE   $0051                           ; 501F  Cartridge year
        STRING  "REVERSI"                       ; 5020  Title string
        DECLE   $0000                           ; 5027  

        DECLE   $0040,  $0010,  $0038,  $0050   ; 5028   0040 0010 0038 0050
        DECLE   $0000,  $0050,  $0000,  $0030   ; 502C   0000 0050 0000 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5030   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5034   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $00F2,  $0054   ; 5038   0300 0000 00F2 0054
        DECLE   $0001,  $0000,  $0000           ; 503C   0001 0000 0000

        SUB     .STIC.X.0,R0                    ; 503F   0300 0000
        MOVR    R3,     R7                      ; 5041   009F

        DECLE   $0056,  $0001,  $0000,  $0000   ; 5042   0056 0001 0000 0000
L_5046:
        PSHR    R5                              ; 5046   0275
        MVI     .BTAB.8C,R5                     ; 5047   0285 028C
        ADDI    #$0006, R5                      ; 5049   02FD 0006
        MOVR    R5,     R3                      ; 504B   00AB
        SLR     R3,     1                       ; 504C   0063
        MOVR    R5,     R1                      ; 504D   00A9
L_504E:
        MOVR    R3,     R2                      ; 504E   009A
L_504F:
        MVO@    R0,     R4                      ; 504F   0260
        INCR    R4                              ; 5050   000C
        DECR    R2                              ; 5051   0012
        BNEQ    L_504F                          ; 5052   022C 0004

        SUBR    R5,     R4                      ; 5054   012C
        ADDI    #$0015, R4                      ; 5055   02FC 0015
        MVI     .BTAB.8C,R2                     ; 5057   0282 028C
        SLR     R2,     1                       ; 5059   0062
        XORR    R4,     R2                      ; 505A   01E2
        RRC     R2,     1                       ; 505B   0072
        BNC     L_5060                          ; 505C   0209 0002

        SUBI    #$0002, R4                      ; 505E   033C 0002
L_5060:
        DECR    R1                              ; 5060   0011
        BNEQ    L_504E                          ; 5061   022C 0014
        PULR    R7                              ; 5063   02B7

L_5064:
        PSHR    R5                              ; 5064   0275
        SDBD                                    ; 5065   0001
        MVII    #$280D, R3                      ; 5066   02BB 000D 0028
        SWAP    R3,     1                       ; 5069   0043
        MVI     G_01ED, R1                      ; 506A   0281 01ED
        DECR    R1                              ; 506C   0011
        SLL     R1,     1                       ; 506D   0049
        ADDR    R1,     R7                      ; 506E   00CF

        ADDI    #$001E, R3                      ; 506F   02FB 001E
        SUBI    #$0010, R3                      ; 5071   033B 0010
        NOP                                     ; 5073   0034
        NOP                                     ; 5074   0034
        SUBI    #$000A, R3                      ; 5075   033B 000A
        SWAP    R3,     1                       ; 5077   0043
        MVI     .BTAB.00,R1                     ; 5078   0281 0200

        JSR     R5,     L_5446                  ; 507A   0004 0154 0046

        MOVR    R1,     R4                      ; 507D   008C
        SUBI    #$0015, R4                      ; 507E   033C 0015
        MVI     .BTAB.8C,R0                     ; 5080   0280 028C
        ADDI    #$0006, R0                      ; 5082   02F8 0006
        MVO@    R3,     R4                      ; 5084   0263
        CLRR    R1                              ; 5085   01C9

        JSR     R5,     L_50A6                  ; 5086   0004 0150 00A6

        ADDI    #$0008, R3                      ; 5089   02FB 0008
        MVO@    R3,     R4                      ; 508B   0263
        MVII    #$0013, R1                      ; 508C   02B9 0013

        JSR     R5,     L_50A6                  ; 508E   0004 0150 00A6

        ADDI    #$0008, R3                      ; 5091   02FB 0008
        ADDR    R1,     R4                      ; 5093   00CC
        MVO@    R3,     R4                      ; 5094   0263
        MVII    #$0002, R1                      ; 5095   02B9 0002
        NEGR    R1                              ; 5097   0021

        JSR     R5,     L_50A6                  ; 5098   0004 0150 00A6

        ADDI    #$0008, R3                      ; 509B   02FB 0008
        ADDR    R1,     R4                      ; 509D   00CC
        MVO@    R3,     R4                      ; 509E   0263
        MVII    #$0015, R1                      ; 509F   02B9 0015
        NEGR    R1                              ; 50A1   0021

        JSR     R5,     L_50A6                  ; 50A2   0004 0150 00A6

        PULR    R7                              ; 50A5   02B7

L_50A6:
        ADDI    #$0008, R3                      ; 50A6   02FB 0008
        MOVR    R0,     R2                      ; 50A8   0082
L_50A9:
        ADDR    R1,     R4                      ; 50A9   00CC
        MVO@    R3,     R4                      ; 50AA   0263
        DECR    R2                              ; 50AB   0012
        BNEQ    L_50A9                          ; 50AC   022C 0004
        MOVR    R5,     R7                      ; 50AE   00AF

L_50AF:
        PSHR    R5                              ; 50AF   0275
        SDBD                                    ; 50B0   0001
        MVII    #$5D53, R4                      ; 50B1   02BC 0053 005D
        ADD     .BTAB.8C,R4                     ; 50B4   02C4 028C
        SDBD                                    ; 50B6   0001
        MVI@    R4,     R0                      ; 50B7   02A0
        MVII    #$0131, R4                      ; 50B8   02BC 0131
        MVO@    R0,     R4                      ; 50BA   0260
        INCR    R4                              ; 50BB   000C
        MVO@    R0,     R4                      ; 50BC   0260
        SUBI    #$0002, R4                      ; 50BD   033C 0002
        SWAP    R0,     1                       ; 50BF   0040
        MVO@    R0,     R4                      ; 50C0   0260
        INCR    R4                              ; 50C1   000C
        MVO@    R0,     R4                      ; 50C2   0260
        MVII    #$0000, R3                      ; 50C3   02BB 0000

        JSR     R5,     L_5290                  ; 50C5   0004 0150 0290

        MVII    #$0007, R3                      ; 50C8   02BB 0007

        JSR     R5,     L_5290                  ; 50CA   0004 0150 0290

        SDBD                                    ; 50CD   0001
        MVII    #$5019, R1                      ; 50CE   02B9 0019 0050

        JSR     R5,     X_TIMER_START           ; 50D1   0004 0118 0044

        MVII    #$003C, R0                      ; 50D4   02B8 003C
        MVO     R0,     .BTAB.B4                ; 50D6   0240 02B4
        PULR    R7                              ; 50D8   02B7

        DECLE   $0000,  $0000,  $00E9,  $0050   ; 50D9   0000 0000 00E9 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50DD   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50E1   0000 0000
L_50E3:
        MVO     R5,     .BTAB.C8                ; 50E3   0245 02C8

        JSR     R5,     L_5C5E                  ; 50E5   0004 015C 005E

        PULR    R7                              ; 50E8   02B7

        PSHR    R5                              ; 50E9   0275
        MOVR    R0,     R1                      ; 50EA   0081
        MVI     .BTAB.C8,R7                     ; 50EB   0287 02C8

.START:
        PSHR    R5                              ; 50ED   0275
        MVII    #$0003, R0                      ; 50EE   02B8 0003
        MVO     R0,     G_0103                  ; 50F0   0240 0103
        MVII    #$0001, R0                      ; 50F2   02B8 0001
        MVO     R0,     G_0104                  ; 50F4   0240 0104
        SDBD                                    ; 50F6   0001
        MVII    #$5019, R1                      ; 50F7   02B9 0019 0050

        JSR     R5,     X_TIMER_STOP            ; 50FA   0004 0118 0038

        SDBD                                    ; 50FD   0001
        MVII    #$50D9, R0                      ; 50FE   02B8 00D9 0050
        MVO     R0,     G_035D                  ; 5101   0240 035D
        MVII    #$00F0, R0                      ; 5103   02B8 00F0
        SDBD                                    ; 5105   0001
        MVII    #$2200, R1                      ; 5106   02B9 0000 0022
        MVII    #$0200, R4                      ; 5109   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 510B   0004 0114 0341

L_510E:
        SDBD                                    ; 510E   0001
        MVII    #$5C8A, R1                      ; 510F   02B9 008A 005C

        JSR     R5,     L_50E3                  ; 5112   0004 0150 00E3

        TSTR    R1                              ; 5115   0089
        BEQ     L_511C                          ; 5116   0204 0004

        CMPI    #$0004, R1                      ; 5118   0379 0004
        BMI     L_5121                          ; 511A   020B 0005

L_511C:
        JSR     R5,     X_PLAY_RAZZ2            ; 511C   0004 011C 02BD

        B       L_510E                          ; 511F   0220 0012

L_5121:
        DECR    R1                              ; 5121   0011
        SLL     R1,     1                       ; 5122   0049
        MVO     R1,     .BTAB.8C                ; 5123   0241 028C
        MVII    #$0219, R4                      ; 5125   02BC 0219
        ADDR    R1,     R7                      ; 5127   00CF

        ADDI    #$0015, R4                      ; 5128   02FC 0015
        ADDI    #$0015, R4                      ; 512A   02FC 0015
        PSHR    R4                              ; 512C   0274
        SDBD                                    ; 512D   0001
        MVII    #$1000, R0                      ; 512E   02B8 0000 0010

        JSR     R5,     L_5046                  ; 5131   0004 0150 0046

        PULR    R4                              ; 5134   02B4
        INCR    R4                              ; 5135   000C
        SDBD                                    ; 5136   0001
        MVII    #$3200, R0                      ; 5137   02B8 0000 0032

        JSR     R5,     L_5046                  ; 513A   0004 0150 0046

L_513D:
        SDBD                                    ; 513D   0001
        MVII    #$5C98, R1                      ; 513E   02B9 0098 005C

        JSR     R5,     L_50E3                  ; 5141   0004 0150 00E3

        CMPI    #$0004, R1                      ; 5144   0379 0004
        BMI     L_514C                          ; 5146   020B 0004

        CMPI    #$0007, R1                      ; 5148   0379 0007
        BMI     L_5151                          ; 514A   020B 0005

L_514C:
        JSR     R5,     X_PLAY_RAZZ2            ; 514C   0004 011C 02BD

        B       L_513D                          ; 514F   0220 0013

L_5151:
        SDBD                                    ; 5151   0001
        MVII    #$5D45, R4                      ; 5152   02BC 0045 005D
        SLL     R1,     1                       ; 5155   0049
        ADDR    R1,     R4                      ; 5156   00CC
        SDBD                                    ; 5157   0001
        MVI@    R4,     R3                      ; 5158   02A3
        MVO     R3,     .BTAB.78                ; 5159   0243 0278
L_515B:
        SDBD                                    ; 515B   0001
        MVII    #$5CA8, R1                      ; 515C   02B9 00A8 005C

        JSR     R5,     L_50E3                  ; 515F   0004 0150 00E3

        TSTR    R1                              ; 5162   0089
        BEQ     L_5172                          ; 5163   0204 000D

        CMPI    #$0007, R1                      ; 5165   0379 0007
        BMI     L_516D                          ; 5167   020B 0004

        CMPI    #$000A, R1                      ; 5169   0379 000A
        BMI     L_5174                          ; 516B   020B 0007

L_516D:
        JSR     R5,     X_PLAY_RAZZ2            ; 516D   0004 011C 02BD

        B       L_515B                          ; 5170   0220 0016

L_5172:
        MVII    #$000B, R1                      ; 5172   02B9 000B
L_5174:
        SUBI    #$0006, R1                      ; 5174   0339 0006
        MVO     R1,     G_01ED                  ; 5176   0241 01ED
        MVI     .BTAB.8C,R1                     ; 5178   0281 028C
        SLL     R1,     2                       ; 517A   004D
        MVII    #$0040, R0                      ; 517B   02B8 0040
        SUBR    R1,     R0                      ; 517D   0108
        MVO     R0,     G_0117                  ; 517E   0240 0117
        MVII    #$0020, R0                      ; 5180   02B8 0020
        SUBR    R1,     R0                      ; 5182   0108
        MVO     R0,     G_0119                  ; 5183   0240 0119
        MVII    #$0068, R0                      ; 5185   02B8 0068
        ADDR    R1,     R0                      ; 5187   00C8
        MVO     R0,     G_0116                  ; 5188   0240 0116
        MVII    #$0048, R0                      ; 518A   02B8 0048
        ADDR    R1,     R0                      ; 518C   00C8
        MVO     R0,     G_0118                  ; 518D   0240 0118
        CLRR    R0                              ; 518F   01C0
        MVO     R0,     G_01EF                  ; 5190   0240 01EF
        MVO     R0,     .BTAB.50                ; 5192   0240 0250
        MVO     R0,     .BTAB.64                ; 5194   0240 0264
        MVO     R0,     .BTAB.28                ; 5196   0240 0228
        MVO     R0,     .BTAB.3C                ; 5198   0240 023C

        JSR     R5,     L_5244                  ; 519A   0004 0150 0244

        MVII    #$000B, R3                      ; 519D   02BB 000B
        SDBD                                    ; 519F   0001
        MVII    #$5D6B, R4                      ; 51A0   02BC 006B 005D
        MVII    #$034B, R5                      ; 51A3   02BD 034B
L_51A5:
        SDBD                                    ; 51A5   0001
        MVI@    R4,     R2                      ; 51A6   02A2
        MVO@    R2,     R5                      ; 51A7   026A
        DECR    R3                              ; 51A8   0013
        BNEQ    L_51A5                          ; 51A9   022C 0005

        MVII    #$015D, R4                      ; 51AB   02BC 015D
        MVII    #$0090, R0                      ; 51AD   02B8 0090

        JSR     R5,     X_FILL_ZERO             ; 51AF   0004 0114 0338

        SDBD                                    ; 51B2   0001
        MVII    #$5DB1, R4                      ; 51B3   02BC 00B1 005D
        ADD     .BTAB.8C,R7                     ; 51B6   02C7 028C

        SUBI    #$0015, R4                      ; 51B8   033C 0015
        SUBI    #$001B, R4                      ; 51BA   033C 001B
        MVI@    R4,     R1                      ; 51BC   02A1
        MVI@    R4,     R5                      ; 51BD   02A5
L_51BE:
        MVII    #$0006, R0                      ; 51BE   02B8 0006
L_51C0:
        MVI@    R4,     R2                      ; 51C0   02A2
        MVO@    R2,     R5                      ; 51C1   026A
        DECR    R0                              ; 51C2   0010
        BNEQ    L_51C0                          ; 51C3   022C 0004

        MVII    #$0006, R0                      ; 51C5   02B8 0006
        MOVR    R5,     R3                      ; 51C7   00AB
L_51C8:
        DECR    R3                              ; 51C8   0013
        MVI@    R3,     R2                      ; 51C9   029A
        MVO@    R2,     R5                      ; 51CA   026A
        DECR    R0                              ; 51CB   0010
        BNEQ    L_51C8                          ; 51CC   022C 0005

        DECR    R1                              ; 51CE   0011
        BNEQ    L_51BE                          ; 51CF   022C 0012

        MVI@    R4,     R4                      ; 51D1   02A4
        MOVR    R5,     R3                      ; 51D2   00AB
L_51D3:
        DECR    R3                              ; 51D3   0013
        MVI@    R3,     R2                      ; 51D4   029A
        MVO@    R2,     R5                      ; 51D5   026A
        CMPR    R4,     R3                      ; 51D6   0163
        BNEQ    L_51D3                          ; 51D7   022C 0005

        MVO     R4,     .BTAB.00                ; 51D9   0244 0200
        MVO     R5,     .BTAB.14                ; 51DB   0245 0214

        JSR     R5,     L_5064                  ; 51DD   0004 0150 0064
        JSR     R5,     L_50AF                  ; 51E0   0004 0150 00AF

        MVI     .BTAB.8C,R1                     ; 51E3   0281 028C
        MVII    #$0064, R2                      ; 51E5   02BA 0064
        ADDR    R1,     R7                      ; 51E7   00CF

        SUBI    #$001C, R2                      ; 51E8   033A 001C
        SUBI    #$0024, R2                      ; 51EA   033A 0024
        MVO     R2,     .BTAB.8C                ; 51EC   0242 028C

        JSR     R5,     L_5C69                  ; 51EE   0004 015C 0069

        SDBD                                    ; 51F1   0001
        MVII    #$5028, R1                      ; 51F2   02B9 0028 0050
        MVII    #$031D, R2                      ; 51F5   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 51F7   0004 0114 02B2
L_51FA:
        JSR     R5,     L_534F                  ; 51FA   0004 0150 034F

        BC      L_520D                          ; 51FD   0201 000E

        MVI     .BTAB.78,R1                     ; 51FF   0281 0278
        RSWD    R1                              ; 5201   0039
        BMI     L_5207                          ; 5202   020B 0003
        J       L_5546                          ; 5204   0004 0354 0146
L_5207:
        J       L_561E                          ; 5207   0004 0354 021E

L_520A:
        JSR     R5,     L_53E9                  ; 520A   0004 0150 03E9

L_520D:
        MVI     .BTAB.78,R2                     ; 520D   0282 0278
        SWAP    R2,     1                       ; 520F   0042
        MVO     R2,     .BTAB.78                ; 5210   0242 0278
        MVI     .BTAB.50,R2                     ; 5212   0282 0250
        SWAP    R2,     1                       ; 5214   0042
        MVO     R2,     .BTAB.50                ; 5215   0242 0250
        MVI     G_031D, R2                      ; 5217   0282 031D
        XORI    #$0007, R2                      ; 5219   03FA 0007
        MVO     R2,     G_031D                  ; 521B   0242 031D
        MVII    #$003C, R2                      ; 521D   02BA 003C
        MVO     R2,     .BTAB.B4                ; 521F   0242 02B4
        B       L_51FA                          ; 5221   0220 0028

L_5223:
        MVII    #$0122, R2                      ; 5223   02BA 0122
        SUBR    R1,     R2                      ; 5225   010A
        MVI@    R2,     R3                      ; 5226   0293
        TSTR    R3                              ; 5227   009B
        BNEQ    L_5231                          ; 5228   020C 0007

        INCR    R1                              ; 522A   0009
        SLL     R1,     2                       ; 522B   004D
        AND     .BTAB.78,R1                     ; 522C   0381 0278
        BEQ     L_5231                          ; 522E   0204 0001
        MOVR    R5,     R7                      ; 5230   00AF
L_5231:
        PULR    R7                              ; 5231   02B7

L_5232:
        PSHR    R5                              ; 5232   0275
        MVII    #$031D, R1                      ; 5233   02B9 031D

        JSR     R5,     .EXEC.777               ; 5235   0004 0114 0377

        SLR     R2,     2                       ; 5238   0066
        SLR     R2,     1                       ; 5239   0062
        SUBI    #$0005, R2                      ; 523A   033A 0005
        MOVR    R3,     R4                      ; 523C   009C
        SLR     R3,     1                       ; 523D   0063
        ADDR    R4,     R3                      ; 523E   00E3
        ADDR    R2,     R3                      ; 523F   00D3
        ADDI    #$0151, R3                      ; 5240   02FB 0151
        MOVR    R3,     R1                      ; 5242   0099
        PULR    R7                              ; 5243   02B7

L_5244:
        MOVR    R0,     R2                      ; 5244   0082
        MVI     .BTAB.78,R1                     ; 5245   0281 0278
        PSHR    R5                              ; 5247   0275
        SLL     R1,     2                       ; 5248   004D
        RSWD    R1                              ; 5249   0039
        MVI     .BTAB.78,R1                     ; 524A   0281 0278
        BOV     L_5250                          ; 524C   0202 0002

        SWAP    R2,     1                       ; 524E   0042
        SWAP    R1,     1                       ; 524F   0041
L_5250:
        MVII    #$02B1, R4                      ; 5250   02BC 02B1
        SDBD                                    ; 5252   0001
        MVII    #$2200, R3                      ; 5253   02BB 0000 0022
        RSWD    R1                              ; 5256   0039
        BNEQ    L_525B                          ; 5257   020C 0002

        XORI    #$0007, R3                      ; 5259   03FB 0007
L_525B:
        MVII    #$0002, R1                      ; 525B   02B9 0002
        MOVR    R2,     R0                      ; 525D   0090
        ANDI    #$00FF, R0                      ; 525E   03B8 00FF
        CMPI    #$0064, R0                      ; 5260   0378 0064
        BNEQ    L_5266                          ; 5262   020C 0002

        INCR    R1                              ; 5264   0009
        DECR    R4                              ; 5265   0014

L_5266:
        JSR     R5,     X_PRNUM_RGT             ; 5266   0004 0118 00C5

        MVII    #$0002, R1                      ; 5269   02B9 0002
        SWAP    R2,     1                       ; 526B   0042
        MOVR    R2,     R0                      ; 526C   0090
        ANDI    #$00FF, R0                      ; 526D   03B8 00FF
        CMPI    #$0064, R0                      ; 526F   0378 0064
        BNEQ    L_5274                          ; 5271   020C 0001

        INCR    R1                              ; 5273   0009
L_5274:
        XORI    #$0007, R3                      ; 5274   03FB 0007
        MVII    #$02A1, R4                      ; 5276   02BC 02A1

        JSR     R5,     X_PRNUM_RGT             ; 5278   0004 0118 00C5

        PULR    R7                              ; 527B   02B7

L_527C:
        PSHR    R5                              ; 527C   0275
        MVI     .BTAB.B4,R0                     ; 527D   0280 02B4
        SUBI    #$0003, R0                      ; 527F   0338 0003
        BGT     L_528D                          ; 5281   020E 000A

        JSR     R5,     .EXEC.60A               ; 5283   0004 0114 020A

        MVI     G_031D, R3                      ; 5286   0283 031D

        JSR     R5,     L_5290                  ; 5288   0004 0150 0290

        MVII    #$003C, R0                      ; 528B   02B8 003C
L_528D:
        MVO     R0,     .BTAB.B4                ; 528D   0240 02B4
        PULR    R7                              ; 528F   02B7

L_5290:
        PSHR    R5                              ; 5290   0275
        ANDI    #$0007, R3                      ; 5291   03BB 0007
        MVII    #$0201, R4                      ; 5293   02BC 0201
        MVII    #$0131, R5                      ; 5295   02BD 0131
        MVII    #$02A2, R2                      ; 5297   02BA 02A2
        MVI@    R2,     R1                      ; 5299   0291
        ANDI    #$0007, R1                      ; 529A   03B9 0007
        XORR    R3,     R1                      ; 529C   01D9
        BEQ     L_52A3                          ; 529D   0204 0004

        ADDI    #$000B, R4                      ; 529F   02FC 000B
        MVII    #$0133, R5                      ; 52A1   02BD 0133
L_52A3:
        SDBD                                    ; 52A3   0001
        ADDI    #$2280, R3                      ; 52A4   02FB 0080 0022
        SDBD                                    ; 52A7   0001
        MVI@    R5,     R2                      ; 52A8   02AA
        DECR    R2                              ; 52A9   0012
        SUBI    #$0002, R5                      ; 52AA   033D 0002
        MVO@    R2,     R5                      ; 52AC   026A
        SWAP    R2,     1                       ; 52AD   0042
        MVO@    R2,     R5                      ; 52AE   026A
        SWAP    R2,     1                       ; 52AF   0042
        TSTR    R2                              ; 52B0   0092
        BGT     L_52BA                          ; 52B1   020E 0007
        BNEQ    L_52B5                          ; 52B3   020C 0000

L_52B5:
        SDBD                                    ; 52B5   0001
        MVII    #$2282, R3                      ; 52B6   02BB 0082 0022
        NEGR    R2                              ; 52B9   0022
L_52BA:
        MOVR    R2,     R1                      ; 52BA   0091
        MVII    #$003C, R2                      ; 52BB   02BA 003C

        JSR     R5,     X_DIV                   ; 52BD   0004 011C 01FB

        PSHR    R1                              ; 52C0   0271
        MOVR    R0,     R1                      ; 52C1   0081
        MVII    #$000A, R2                      ; 52C2   02BA 000A

        JSR     R5,     X_DIV                   ; 52C4   0004 011C 01FB

        MVI@    R4,     R2                      ; 52C7   02A2
        TSTR    R0                              ; 52C8   0080
        BNEQ    L_52D2                          ; 52C9   020C 0007

        MVO@    R2,     R4                      ; 52CB   0262
        TSTR    R1                              ; 52CC   0089
        BNEQ    L_52D6                          ; 52CD   020C 0007

        MVO@    R2,     R4                      ; 52CF   0262
        B       L_52DA                          ; 52D0   0200 0008

L_52D2:
        SLL     R0,     2                       ; 52D2   004C
        SLL     R0,     1                       ; 52D3   0048
        ADDR    R3,     R0                      ; 52D4   00D8
        MVO@    R0,     R4                      ; 52D5   0260
L_52D6:
        SLL     R1,     2                       ; 52D6   004D
        SLL     R1,     1                       ; 52D7   0049
        ADDR    R3,     R1                      ; 52D8   00D9
        MVO@    R1,     R4                      ; 52D9   0261
L_52DA:
        MVII    #$0050, R0                      ; 52DA   02B8 0050
        ADDR    R3,     R0                      ; 52DC   00D8
        MVO@    R0,     R4                      ; 52DD   0260
        PULR    R1                              ; 52DE   02B1
        MVII    #$000A, R2                      ; 52DF   02BA 000A

        JSR     R5,     X_DIV                   ; 52E1   0004 011C 01FB

        SLL     R0,     2                       ; 52E4   004C
        SLL     R0,     1                       ; 52E5   0048
        ADDR    R3,     R0                      ; 52E6   00D8
        MVO@    R0,     R4                      ; 52E7   0260
        SLL     R1,     2                       ; 52E8   004D
        SLL     R1,     1                       ; 52E9   0049
        ADDR    R3,     R1                      ; 52EA   00D9
        MVO@    R1,     R4                      ; 52EB   0261
        PULR    R7                              ; 52EC   02B7

L_52ED:
        MVO     R5,     .BTAB.C8                ; 52ED   0245 02C8
        MVI     .BTAB.64,R0                     ; 52EF   0280 0264
        CMPI    #$0004, R0                      ; 52F1   0378 0004
        BPL     L_530B                          ; 52F3   0203 0016

        MVI@    R1,     R0                      ; 52F5   0288
        RSWD    R0                              ; 52F6   0038
        BC      L_5310                          ; 52F7   0201 0017

        CMPI    #$019E, R1                      ; 52F9   0379 019E
        BEQ     L_5324                          ; 52FB   0204 0027

        CMPI    #$019F, R1                      ; 52FD   0379 019F
        BEQ     L_5324                          ; 52FF   0204 0023

        CMPI    #$01AA, R1                      ; 5301   0379 01AA
        BEQ     L_5324                          ; 5303   0204 001F

        CMPI    #$01AB, R1                      ; 5305   0379 01AB
        BEQ     L_5324                          ; 5307   0204 001B
        B       L_5310                          ; 5309   0200 0005

L_530B:
        JSR     R5,     L_5328                  ; 530B   0004 0150 0328

        BNC     L_5324                          ; 530E   0209 0014

L_5310:
        SDBD                                    ; 5310   0001
        MVII    #$5CB8, R1                      ; 5311   02B9 00B8 005C

        JSR     R5,     L_5C5E                  ; 5314   0004 015C 005E
        JSR     R5,     X_PLAY_RAZZ2            ; 5317   0004 011C 02BD
        JSR     R5,     .EXEC.A61               ; 531A   0004 0118 0261

        SETC                                    ; 531D   0007

        JSR     R5,     L_5C69                  ; 531E   0004 015C 0069

        SETC                                    ; 5321   0007
        B       L_5326                          ; 5322   0200 0002

L_5324:
        MOVR    R1,     R2                      ; 5324   008A
        CLRC                                    ; 5325   0006
L_5326:
        MVI     .BTAB.C8,R7                     ; 5326   0287 02C8

L_5328:
        PSHR    R5                              ; 5328   0275
        MVI@    R1,     R0                      ; 5329   0288
        RSWD    R0                              ; 532A   0038
        BC      L_534D                          ; 532B   0201 0020

        MVI     .BTAB.78,R5                     ; 532D   0285 0278
        ANDI    #$0040, R5                      ; 532F   03BD 0040
        SDBD                                    ; 5331   0001
        MVII    #$5D59, R4                      ; 5332   02BC 0059 005D
L_5335:
        SDBD                                    ; 5335   0001
        MVI@    R4,     R3                      ; 5336   02A3
        TSTR    R3                              ; 5337   009B
        BEQ     L_534D                          ; 5338   0204 0013

        MOVR    R1,     R2                      ; 533A   008A
        ADDR    R3,     R2                      ; 533B   00DA
        MVI@    R2,     R0                      ; 533C   0290
        XORR    R5,     R0                      ; 533D   01E8
        RSWD    R0                              ; 533E   0038
        BNC     L_5335                          ; 533F   0229 000B
        BNEQ    L_5335                          ; 5341   022C 000D

L_5343:
        ADDR    R3,     R2                      ; 5343   00DA
        MVI@    R2,     R0                      ; 5344   0290
        XORR    R5,     R0                      ; 5345   01E8
        RSWD    R0                              ; 5346   0038
        BNC     L_5335                          ; 5347   0229 0013
        BEQ     L_5343                          ; 5349   0224 0007

        CLRC                                    ; 534B   0006
        PULR    R7                              ; 534C   02B7

L_534D:
        SETC                                    ; 534D   0007
        PULR    R7                              ; 534E   02B7

L_534F:
        PSHR    R5                              ; 534F   0275
        MVI     .BTAB.64,R0                     ; 5350   0280 0264
        CMPI    #$0004, R0                      ; 5352   0378 0004
        BMI     L_5394                          ; 5354   020B 003E

        CMP     .BTAB.8C,R0                     ; 5356   0340 028C
        BEQ     L_53A7                          ; 5358   0204 004D

        JSR     R5,     L_5395                  ; 535A   0004 0150 0395

        BNC     L_5394                          ; 535D   0209 0035

        MVI     .BTAB.A0,R0                     ; 535F   0280 02A0
        TSTR    R0                              ; 5361   0080
        BEQ     L_53A7                          ; 5362   0204 0043

        CLRR    R0                              ; 5364   01C0
        MVO     R0,     .BTAB.A0                ; 5365   0240 02A0
        MVI     .BTAB.78,R0                     ; 5367   0280 0278
        RSWD    R0                              ; 5369   0038
        BPL     L_5372                          ; 536A   0203 0006

        SDBD                                    ; 536C   0001
        MVII    #$5CC7, R1                      ; 536D   02B9 00C7 005C
        B       L_5386                          ; 5370   0200 0014

L_5372:
        SWAP    R0,     1                       ; 5372   0040
        RSWD    R0                              ; 5373   0038
        BPL     L_537C                          ; 5374   0203 0006

        SDBD                                    ; 5376   0001
        MVII    #$5CD5, R1                      ; 5377   02B9 00D5 005C
        B       L_5386                          ; 537A   0200 000A

L_537C:
        MVI     .BTAB.78,R0                     ; 537C   0280 0278
        ANDI    #$0040, R0                      ; 537E   03B8 0040
        SLR     R0,     2                       ; 5380   0064
        SDBD                                    ; 5381   0001
        MVII    #$5CE4, R1                      ; 5382   02B9 00E4 005C
        ADDR    R0,     R1                      ; 5385   00C1

L_5386:
        JSR     R5,     L_5C5E                  ; 5386   0004 015C 005E
        JSR     R5,     X_PLAY_WHST1            ; 5389   0004 011C 031B

        CLRR    R0                              ; 538C   01C0
L_538D:
        DECR    R0                              ; 538D   0010
        BNEQ    L_538D                          ; 538E   022C 0002

        JSR     R5,     L_5C69                  ; 5390   0004 015C 0069

        SETC                                    ; 5393   0007
L_5394:
        PULR    R7                              ; 5394   02B7

L_5395:
        PSHR    R5                              ; 5395   0275
        MVI     .BTAB.00,R1                     ; 5396   0281 0200
L_5398:
        MVI@    R1,     R0                      ; 5398   0288
        RSWD    R0                              ; 5399   0038
        BPL     L_53A1                          ; 539A   0203 0005

        JSR     R5,     L_5328                  ; 539C   0004 0150 0328

        BNC     L_53A6                          ; 539F   0209 0005

L_53A1:
        INCR    R1                              ; 53A1   0009
        CMP     .BTAB.14,R1                     ; 53A2   0341 0214
        BNEQ    L_5398                          ; 53A4   022C 000D
L_53A6:
        PULR    R7                              ; 53A6   02B7

L_53A7:
        SDBD                                    ; 53A7   0001
        MVII    #$5019, R1                      ; 53A8   02B9 0019 0050

        JSR     R5,     X_TIMER_STOP            ; 53AB   0004 0118 0038

        SDBD                                    ; 53AE   0001
        MVII    #$5D04, R1                      ; 53AF   02B9 0004 005D

        JSR     R5,     L_5C5E                  ; 53B2   0004 015C 005E

        PULR    R0                              ; 53B5   02B0
        MVI     .BTAB.50,R0                     ; 53B6   0280 0250
        MVI     .BTAB.78,R1                     ; 53B8   0281 0278
        TSTR    R1                              ; 53BA   0089
        BMI     L_53C1                          ; 53BB   020B 0004

        SWAP    R1,     2                       ; 53BD   0045
        BPL     L_53D5                          ; 53BE   0203 0015

        SWAP    R0,     1                       ; 53C0   0040
L_53C1:
        MOVR    R0,     R1                      ; 53C1   0081
        SWAP    R1,     1                       ; 53C2   0041
        CMPR    R0,     R1                      ; 53C3   0141
        BGE     L_53D5                          ; 53C4   020D 000F

        JSR     R5,     X_PLAY_MUS2             ; 53C6   0004 0118 035D
        DECLE   $01DE                           ; 53C9  Note (short)
        DECLE   $01DE                           ; 53CA  Note (short)
        DECLE   $01DE                           ; 53CB  Note (short)
        DECLE   $0107                           ; 53CC  Note (short)
        DECLE   $0096                           ; 53CD  Note (short)
        DECLE   $03F4,  $002E                   ; 53CE  Note (long)
        DECLE   $0000                           ; 53D0  End of music

        JSR     R5,     X_PLAY_SFX1             ; 53D1   0004 0118 03BB
        DECLE   $02CF                           ; 53D4  SFX end

L_53D5:
        JSR     R5,     X_PLAY_MUS1             ; 53D5   0004 0118 0327
        DECLE   $018E                           ; 53D8  Note (short)
        DECLE   $01FC                           ; 53D9  Note (short)
        DECLE   $01FC                           ; 53DA  Note (short)
        DECLE   $01CC                           ; 53DB  Note (short)
        DECLE   $000C                           ; 53DC  Note (short)
        DECLE   $024C                           ; 53DD  Note (short)
        DECLE   $000C                           ; 53DE  Note (short)
        DECLE   $028E                           ; 53DF  Note (short)
        DECLE   $0244                           ; 53E0  Note (short)
        DECLE   $02B4                           ; 53E1  Note (short)
        DECLE   $03F4,  $0304                   ; 53E2  Note (long)
        DECLE   $0000                           ; 53E4  End of music

        JSR     R5,     X_PLAY_SFX1             ; 53E5   0004 0118 03BB
        DECLE   $02CF                           ; 53E8  SFX end

L_53E9:
        PSHR    R5                              ; 53E9   0275
        MVI     .BTAB.64,R0                     ; 53EA   0280 0264
        INCR    R0                              ; 53EC   0008
        MVO     R0,     .BTAB.64                ; 53ED   0240 0264
        MVO     R0,     .BTAB.A0                ; 53EF   0240 02A0
        MVI     .BTAB.50,R0                     ; 53F1   0280 0250
        INCR    R0                              ; 53F3   0008
        PSHR    R0                              ; 53F4   0270
        MVI     .BTAB.78,R4                     ; 53F5   0284 0278
        ANDI    #$0040, R4                      ; 53F7   03BC 0040
        MVI@    R2,     R0                      ; 53F9   0290
        ADDR    R4,     R0                      ; 53FA   00E0
        ADDI    #$0010, R0                      ; 53FB   02F8 0010
        MVO@    R0,     R2                      ; 53FD   0250
        MOVR    R2,     R1                      ; 53FE   0091

        JSR     R5,     L_5446                  ; 53FF   0004 0154 0046

        MVI@    R1,     R0                      ; 5402   0288
        SDBD                                    ; 5403   0001
        XORI    #$0800, R0                      ; 5404   03F8 0000 0008
        TSTR    R4                              ; 5407   00A4
        BEQ     L_540C                          ; 5408   0204 0002

        ADDI    #$0007, R0                      ; 540A   02F8 0007
L_540C:
        MVO@    R0,     R1                      ; 540C   0248
        SDBD                                    ; 540D   0001
        MVII    #$5D59, R5                      ; 540E   02BD 0059 005D
L_5411:
        MOVR    R2,     R1                      ; 5411   0091
        SDBD                                    ; 5412   0001
        MVI@    R5,     R3                      ; 5413   02AB
        TSTR    R3                              ; 5414   009B
        BEQ     L_543F                          ; 5415   0204 0028

L_5417:
        ADDR    R3,     R1                      ; 5417   00D9
        MVI@    R1,     R0                      ; 5418   0288
        XORR    R4,     R0                      ; 5419   01E0
        RSWD    R0                              ; 541A   0038
        BNC     L_5411                          ; 541B   0229 000B
        BEQ     L_5417                          ; 541D   0224 0007

L_541F:
        SUBR    R3,     R1                      ; 541F   0119
        CMPR    R2,     R1                      ; 5420   0151
        BEQ     L_5411                          ; 5421   0224 0011

        MVI@    R1,     R0                      ; 5423   0288
        XORI    #$0040, R0                      ; 5424   03F8 0040
        MVO@    R0,     R1                      ; 5426   0248
        PULR    R0                              ; 5427   02B0
        SUBI    #$0100, R0                      ; 5428   0338 0100
        INCR    R0                              ; 542A   0008
        PSHR    R0                              ; 542B   0270
        MVII    #$0027, R0                      ; 542C   02B8 0027
        SWAP    R0,     1                       ; 542E   0040
L_542F:
        DECR    R0                              ; 542F   0010
        BNEQ    L_542F                          ; 5430   022C 0002

        PSHR    R1                              ; 5432   0271
        PSHR    R5                              ; 5433   0275

        JSR     R5,     L_5446                  ; 5434   0004 0154 0046

        PULR    R5                              ; 5437   02B5
        MVI@    R1,     R0                      ; 5438   0288
        XORI    #$0007, R0                      ; 5439   03F8 0007
        MVO@    R0,     R1                      ; 543B   0248
        PULR    R1                              ; 543C   02B1
        B       L_541F                          ; 543D   0220 001F

L_543F:
        PULR    R0                              ; 543F   02B0
        MVO     R0,     .BTAB.50                ; 5440   0240 0250

        JSR     R5,     L_5244                  ; 5442   0004 0150 0244

        PULR    R7                              ; 5445   02B7

L_5446:
        PSHR    R5                              ; 5446   0275
        PSHR    R2                              ; 5447   0272
        SUBI    #$015D, R1                      ; 5448   0339 015D
        MVII    #$000C, R2                      ; 544A   02BA 000C

        JSR     R5,     X_DIV                   ; 544C   0004 011C 01FB

        ADDI    #$0004, R1                      ; 544F   02F9 0004
        SLL     R0,     2                       ; 5451   004C
        MOVR    R0,     R2                      ; 5452   0082
        SLL     R0,     2                       ; 5453   004C
        ADDR    R2,     R0                      ; 5454   00D0
        ADDR    R0,     R1                      ; 5455   00C1
        ADDI    #$0200, R1                      ; 5456   02F9 0200
        PULR    R2                              ; 5458   02B2
        PULR    R7                              ; 5459   02B7

L_545A:
        PSHR    R5                              ; 545A   0275
        MVI     .BTAB.78,R4                     ; 545B   0284 0278
        ANDI    #$0040, R4                      ; 545D   03BC 0040
        MOVR    R2,     R1                      ; 545F   0091

        JSR     R5,     L_5446                  ; 5460   0004 0154 0046

        MVI@    R1,     R0                      ; 5463   0288
        SDBD                                    ; 5464   0001
        XORI    #$0800, R0                      ; 5465   03F8 0000 0008
        TSTR    R4                              ; 5468   00A4
        BEQ     L_546D                          ; 5469   0204 0002

        ADDI    #$0007, R0                      ; 546B   02F8 0007
L_546D:
        MVO@    R0,     R1                      ; 546D   0248
        SDBD                                    ; 546E   0001
        MVII    #$5D59, R5                      ; 546F   02BD 0059 005D
L_5472:
        MOVR    R2,     R1                      ; 5472   0091
        SDBD                                    ; 5473   0001
        MVI@    R5,     R3                      ; 5474   02AB
        TSTR    R3                              ; 5475   009B
        BEQ     L_5497                          ; 5476   0204 001F

L_5478:
        ADDR    R3,     R1                      ; 5478   00D9
        MVI@    R1,     R0                      ; 5479   0288
        XORR    R4,     R0                      ; 547A   01E0
        RSWD    R0                              ; 547B   0038
        BNC     L_5472                          ; 547C   0229 000B
        BEQ     L_5478                          ; 547E   0224 0007

L_5480:
        SUBR    R3,     R1                      ; 5480   0119
        CMPR    R2,     R1                      ; 5481   0151
        BEQ     L_5472                          ; 5482   0224 0011

        MVII    #$0027, R0                      ; 5484   02B8 0027
        SWAP    R0,     1                       ; 5486   0040
L_5487:
        DECR    R0                              ; 5487   0010
        BNEQ    L_5487                          ; 5488   022C 0002

        PSHR    R1                              ; 548A   0271
        PSHR    R5                              ; 548B   0275

        JSR     R5,     L_5446                  ; 548C   0004 0154 0046

        PULR    R5                              ; 548F   02B5
        MVI@    R1,     R0                      ; 5490   0288
        XORI    #$0007, R0                      ; 5491   03F8 0007
        MVO@    R0,     R1                      ; 5493   0248
        PULR    R1                              ; 5494   02B1
        B       L_5480                          ; 5495   0220 0016
L_5497:
        PULR    R7                              ; 5497   02B7

L_5498:
        PSHR    R5                              ; 5498   0275
        MVII    #$015D, R4                      ; 5499   02BC 015D
L_549B:
        MOVR    R4,     R1                      ; 549B   00A1

        JSR     R5,     L_5446                  ; 549C   0004 0154 0046

        MVI@    R1,     R2                      ; 549F   028A
        SDBD                                    ; 54A0   0001
        ANDI    #$3600, R2                      ; 54A1   03BA 0000 0036
        MVI@    R4,     R0                      ; 54A4   02A0
        RSWD    R0                              ; 54A5   0038
        BPL     L_54B3                          ; 54A6   0203 000B
        BNC     L_54B2                          ; 54A8   0209 0008
        BNEQ    L_54AE                          ; 54AA   020C 0002

        ADDI    #$0007, R2                      ; 54AC   02FA 0007
L_54AE:
        SDBD                                    ; 54AE   0001
        ADDI    #$0800, R2                      ; 54AF   02FA 0000 0008
L_54B2:
        MVO@    R2,     R1                      ; 54B2   024A
L_54B3:
        CMPI    #$01ED, R4                      ; 54B3   037C 01ED
        BNEQ    L_549B                          ; 54B5   022C 001B
        PULR    R7                              ; 54B7   02B7

        ADDR    R0,     R2                      ; 54B8   00C2
        RLC     R0,     2                       ; 54B9   0054
        RSWD    R1                              ; 54BA   0039
        RLC     R1,     2                       ; 54BB   0055
        COMR    R4                              ; 54BC   001C
        RLC     R1,     2                       ; 54BD   0055
        ADDR    R7,     R6                      ; 54BE   00FE
        RLC     R0,     2                       ; 54BF   0054
        ADDR    R7,     R6                      ; 54C0   00FE
        RLC     R0,     2                       ; 54C1   0054
        PSHR    R5                              ; 54C2   0275

        JSR     R5,     L_5223                  ; 54C3   0004 0150 0223

        TSTR    R0                              ; 54C6   0080
        BMI     L_54D4                          ; 54C7   020B 000B

        MOVR    R0,     R1                      ; 54C9   0081

        JSR     R5,     .EXEC.628               ; 54CA   0004 0114 0228

        COMR    R1                              ; 54CD   0019
        MVO     R0,     G_0321                  ; 54CE   0240 0321
        CLRR    R0                              ; 54D0   01C0
        MVO     R0,     G_0323                  ; 54D1   0240 0323
        PULR    R7                              ; 54D3   02B7

L_54D4:
        MVII    #$031D, R1                      ; 54D4   02B9 031D

        JSR     R5,     .EXEC.777               ; 54D6   0004 0114 0377

        ADDI    #$0004, R2                      ; 54D9   02FA 0004
        ADDI    #$0004, R3                      ; 54DB   02FB 0004
        MVII    #$0007, R4                      ; 54DD   02BC 0007
        COMR    R4                              ; 54DF   001C
        ANDR    R4,     R2                      ; 54E0   01A2
        ANDR    R4,     R3                      ; 54E1   01A3
        SWAP    R2,     1                       ; 54E2   0042
        ADDR    R3,     R2                      ; 54E3   00DA
        MVO     R2,     G_0324                  ; 54E4   0242 0324
        MVII    #$000C, R3                      ; 54E6   02BB 000C

        JSR     R5,     .EXEC.9A1               ; 54E8   0004 0118 01A1

        SDBD                                    ; 54EB   0001
        MVII    #$5038, R0                      ; 54EC   02B8 0038 0050
        MVO     R0,     G_031E                  ; 54EF   0240 031E
        PULR    R7                              ; 54F1   02B7

        PSHR    R5                              ; 54F2   0275
        MVI     G_0324, R0                      ; 54F3   0280 0324
        MVO     R0,     G_031F                  ; 54F5   0240 031F
        SWAP    R0,     1                       ; 54F7   0040
        MVO     R0,     G_0320                  ; 54F8   0240 0320
        CLRR    R0                              ; 54FA   01C0
        MVO     R0,     G_0321                  ; 54FB   0240 0321
        PULR    R7                              ; 54FD   02B7

        PSHR    R5                              ; 54FE   0275

        JSR     R5,     L_5223                  ; 54FF   0004 0150 0223

        TSTR    R0                              ; 5502   0080
        BEQ     L_551B                          ; 5503   0204 0016
        BMI     L_5518                          ; 5505   020B 0011

        MVI     G_0323, R0                      ; 5507   0280 0323
        TSTR    R0                              ; 5509   0080
        BNEQ    L_551B                          ; 550A   020C 000F

        JSR     R5,     L_5232                  ; 550C   0004 0150 0232
        JSR     R5,     L_52ED                  ; 550F   0004 0150 02ED

        BC      L_551B                          ; 5512   0201 0007

        JSR     R5,     L_545A                  ; 5514   0004 0154 005A

        PULR    R7                              ; 5517   02B7

L_5518:
        JSR     R5,     L_5498                  ; 5518   0004 0154 0098

L_551B:
        PULR    R7                              ; 551B   02B7

        PSHR    R5                              ; 551C   0275

        JSR     R5,     L_5223                  ; 551D   0004 0150 0223

        DECR    R0                              ; 5520   0010
        BMI     L_551B                          ; 5521   022B 0007

        MVI     G_0323, R0                      ; 5523   0280 0323
        TSTR    R0                              ; 5525   0080
        BNEQ    L_551B                          ; 5526   022C 000C

        JSR     R5,     L_5232                  ; 5528   0004 0150 0232
        JSR     R5,     L_52ED                  ; 552B   0004 0150 02ED

        BC      L_551B                          ; 552E   0221 0014

        SDBD                                    ; 5530   0001
        MVII    #$1906, R0                      ; 5531   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5534   0240 035D
        J       L_520A                          ; 5536   0004 0350 020A

        PSHR    R5                              ; 5539   0275

        JSR     R5,     L_5223                  ; 553A   0004 0150 0223

        SDBD                                    ; 553D   0001
        MVII    #$1906, R0                      ; 553E   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5541   0240 035D

        JSR     R5,     L_55FF                  ; 5543   0004 0154 01FF

L_5546:
        SDBD                                    ; 5546   0001
        MVII    #$54B8, R0                      ; 5547   02B8 00B8 0054
        MVO     R0,     G_035D                  ; 554A   0240 035D
        PULR    R7                              ; 554C   02B7

        DECLE   $0275,  $0240,  $0020,  $02BC   ; 554D   0275 0240 0020 02BC
        DECLE   $031D,  $0001                   ; 5551   031D 0001

        MVII    #$0078, R5                      ; 5553   02BD 0078
        RSWD    R0                              ; 5555   0038
L_5556:
        MVI@    R4,     R0                      ; 5556   02A0
        MVO@    R0,     R5                      ; 5557   0268
        SWAP    R0,     1                       ; 5558   0040
        MVO@    R0,     R5                      ; 5559   0268
        CMPI    #$0324, R4                      ; 555A   037C 0324
        BNEQ    L_5556                          ; 555C   022C 0007

        MVII    #$035D, R4                      ; 555E   02BC 035D
L_5560:
        MVI@    R4,     R0                      ; 5560   02A0
        MVO@    R0,     R5                      ; 5561   0268
        SWAP    R0,     1                       ; 5562   0040
        MVO@    R0,     R5                      ; 5563   0268
        CMPI    #$0360, R4                      ; 5564   037C 0360
        BNEQ    L_5560                          ; 5566   022C 0007

        SDBD                                    ; 5568   0001
        MVII    #$0105, R4                      ; 5569   02BC 0005 0001
        SDBD                                    ; 556C   0001
        MVII    #$001F, R3                      ; 556D   02BB 001F 0000
L_5570:
        MVI@    R4,     R0                      ; 5570   02A0
        MVO@    R0,     R5                      ; 5571   0268
        DECR    R3                              ; 5572   0013
        BNEQ    L_5570                          ; 5573   022C 0004

        MVO     R3,     G_0123                  ; 5575   0243 0123
        MVO     R3,     G_0122                  ; 5577   0243 0122
        INCR    R3                              ; 5579   000B
        MVO     R3,     G_01EE                  ; 557A   0243 01EE
        SDBD                                    ; 557C   0001
        MVII    #$5586, R0                      ; 557D   02B8 0086 0055
        MVO     R0,     .ISRVEC.0               ; 5580   0240 0100
        SWAP    R0,     1                       ; 5582   0040
        MVO     R0,     .ISRVEC.1               ; 5583   0240 0101
        PULR    R7                              ; 5585   02B7

        PSHR    R5                              ; 5586   0275
        MVO     R0,     .STIC.VIDEN             ; 5587   0240 0020
        MVI     G_0122, R3                      ; 5589   0283 0122
        DECR    R3                              ; 558B   0013
        BPL     L_55AD                          ; 558C   0203 001F

        XOR     .BTAB.28,R0                     ; 558E   03C0 0228
        ANDI    #$007F, R0                      ; 5590   03B8 007F
        ADDI    #$0080, R0                      ; 5592   02F8 0080
        MVII    #$01F0, R4                      ; 5594   02BC 01F0
        MVO@    R0,     R4                      ; 5596   0260
        INCR    R0                              ; 5597   0008
        MVO@    R0,     R4                      ; 5598   0260
        SLR     R0,     1                       ; 5599   0060
        MVO@    R0,     R4                      ; 559A   0260
        MVII    #$01F7, R4                      ; 559B   02BC 01F7
        MVII    #$0002, R0                      ; 559D   02B8 0002
        MVO@    R0,     R4                      ; 559F   0260
        MVII    #$0038, R0                      ; 55A0   02B8 0038
        MVO@    R0,     R4                      ; 55A2   0260
        INCR    R4                              ; 55A3   000C
        CLRR    R0                              ; 55A4   01C0
        MVO@    R0,     R4                      ; 55A5   0260
        MVII    #$0030, R0                      ; 55A6   02B8 0030
        MVO@    R0,     R4                      ; 55A8   0260
        MVO@    R0,     R4                      ; 55A9   0260
        MVO@    R0,     R4                      ; 55AA   0260
        MVII    #$0005, R3                      ; 55AB   02BB 0005
L_55AD:
        MVO     R3,     G_0122                  ; 55AD   0243 0122
        DECLE   $0280,  $02B4,  $0010,  $020C   ; 55AF   0280 02B4 0010 020C
        DECLE   $000F,  $0001                   ; 55B3   000F 0001

        MVII    #$0078, R3                      ; 55B5   02BB 0078
        RSWD    R0                              ; 55B7   0038
        MVI@    R3,     R3                      ; 55B8   029B

        JSR     R5,     L_5290                  ; 55B9   0004 0150 0290

        MVI     G_0123, R0                      ; 55BC   0280 0123
        INCR    R0                              ; 55BE   0008
        MVO     R0,     G_0123                  ; 55BF   0240 0123
        MVII    #$003C, R0                      ; 55C1   02B8 003C
        MVO     R0,     .BTAB.B4                ; 55C3   0240 02B4
        PULR    R7                              ; 55C5   02B7

        PSHR    R5                              ; 55C6   0275
        MVO     R0,     .STIC.VIDEN             ; 55C7   0240 0020
        MVI     G_011C, R0                      ; 55C9   0280 011C
        ADDI    #$015D, R0                      ; 55CB   02F8 015D
        MVO     R0,     G_0348                  ; 55CD   0240 0348
        MVI     G_011D, R0                      ; 55CF   0280 011D
        ADDI    #$015D, R0                      ; 55D1   02F8 015D
        MVO     R0,     G_0349                  ; 55D3   0240 0349
        MVI     G_011E, R0                      ; 55D5   0280 011E
        MVO     R0,     G_0347                  ; 55D7   0240 0347
        SDBD                                    ; 55D9   0001
        MVII    #$3878, R4                      ; 55DA   02BC 0078 0038
        MVII    #$031D, R5                      ; 55DD   02BD 031D
L_55DF:
        SDBD                                    ; 55DF   0001
        MVI@    R4,     R0                      ; 55E0   02A0
        MVO@    R0,     R5                      ; 55E1   0268
        CMPI    #$0324, R5                      ; 55E2   037D 0324
        BNEQ    L_55DF                          ; 55E4   022C 0006

        MVII    #$035D, R5                      ; 55E6   02BD 035D
L_55E8:
        SDBD                                    ; 55E8   0001
        MVI@    R4,     R0                      ; 55E9   02A0
        MVO@    R0,     R5                      ; 55EA   0268
        CMPI    #$0360, R5                      ; 55EB   037D 0360
        BNEQ    L_55E8                          ; 55ED   022C 0006

        SDBD                                    ; 55EF   0001
        MVII    #$0105, R5                      ; 55F0   02BD 0005 0001
        SDBD                                    ; 55F3   0001
        MVII    #$001F, R3                      ; 55F4   02BB 001F 0000
L_55F7:
        MVI@    R4,     R0                      ; 55F7   02A0
        MVO@    R0,     R5                      ; 55F8   0268
        DECR    R3                              ; 55F9   0013
        BNEQ    L_55F7                          ; 55FA   022C 0004

        MVO     R3,     G_01EE                  ; 55FC   0243 01EE
        PULR    R7                              ; 55FE   02B7

L_55FF:
        MVI     .BTAB.64,R0                     ; 55FF   0280 0264
        CMPI    #$0005, R0                      ; 5601   0378 0005
        BMI     L_5622                          ; 5603   020B 001D

        MVI     G_01ED, R0                      ; 5605   0280 01ED
        CMPI    #$0002, R0                      ; 5607   0378 0002
        BLE     L_5622                          ; 5609   0206 0017

        MVI     .BTAB.78,R0                     ; 560B   0280 0278
        SWAP    R0,     1                       ; 560D   0040
        RSWD    R0                              ; 560E   0038
        BPL     L_5622                          ; 560F   0203 0011

        MVI     .BTAB.A0,R0                     ; 5611   0280 02A0
        TSTR    R0                              ; 5613   0080
        BEQ     L_5622                          ; 5614   0204 000C

        MVO     R5,     .BTAB.C8                ; 5616   0245 02C8
        MVI     G_0349, R0                      ; 5618   0280 0349
        MVO     R0,     G_0348                  ; 561A   0240 0348
        B       L_567C                          ; 561C   0200 005E

L_561E:
        SDBD                                    ; 561E   0001
        MVII    #$520A, R5                      ; 561F   02BD 000A 0052
L_5622:
        MVO     R5,     .BTAB.C8                ; 5622   0245 02C8
        MVI     .BTAB.64,R0                     ; 5624   0280 0264
        CMPI    #$0004, R0                      ; 5626   0378 0004
        BMI     L_565E                          ; 5628   020B 0034

        JSR     R5,     .EXEC.A61               ; 562A   0004 0118 0261

        EIS                                     ; 562D   0002
        DIS                                     ; 562E   0003
        MVII    #$0100, R5                      ; 562F   02BD 0100
        SDBD                                    ; 5631   0001
        MVI@    R5,     R0                      ; 5632   02A8
        MVO     R0,     .BTAB.DC                ; 5633   0240 02DC
        SDBD                                    ; 5635   0001
        MVII    #$554D, R0                      ; 5636   02B8 004D 0055
        MVO     R0,     .ISRVEC.0               ; 5639   0240 0100
        SWAP    R0,     1                       ; 563B   0040
        MVO     R0,     .ISRVEC.1               ; 563C   0240 0101
        CLRR    R0                              ; 563E   01C0
        MVO     R0,     G_01EE                  ; 563F   0240 01EE
        EIS                                     ; 5641   0002
L_5642:
        MVI     G_01EE, R0                      ; 5642   0280 01EE
        TSTR    R0                              ; 5644   0080
        BEQ     L_5642                          ; 5645   0224 0004
        J       L_56C5                          ; 5647   0004 0354 02C5

L_564A:
        SDBD                                    ; 564A   0001
        MVII    #$55C6, R0                      ; 564B   02B8 00C6 0055
        MVO     R0,     .ISRVEC.0               ; 564E   0240 0100
        SWAP    R0,     1                       ; 5650   0040
        MVO     R0,     .ISRVEC.1               ; 5651   0240 0101
        EIS                                     ; 5653   0002
L_5654:
        MVI     G_01EE, R0                      ; 5654   0280 01EE
        TSTR    R0                              ; 5656   0080
        BNEQ    L_5654                          ; 5657   022C 0004

        JSR     R5,     .EXEC.A83               ; 5659   0004 0118 0283

        B       L_5675                          ; 565C   0200 0017

L_565E:
        MVII    #$019E, R2                      ; 565E   02BA 019E
        MVII    #$0004, R0                      ; 5660   02B8 0004

        JSR     R5,     X_RAND2                 ; 5662   0004 0114 029E

        SLL     R0,     1                       ; 5665   0048
        ADDR    R0,     R7                      ; 5666   00C7

        SUBI    #$0001, R2                      ; 5667   033A 0001
        ADDI    #$000C, R2                      ; 5669   02FA 000C
        ADDI    #$0001, R2                      ; 566B   02FA 0001
        MVI@    R2,     R0                      ; 566D   0290
        RSWD    R0                              ; 566E   0038
        BC      L_565E                          ; 566F   0221 0012

        MVO     R2,     G_0348                  ; 5671   0242 0348
        B       L_567C                          ; 5673   0200 0007

L_5675:
        MVI     .BTAB.DC,R0                     ; 5675   0280 02DC
        MVO     R0,     .ISRVEC.0               ; 5677   0240 0100
        SWAP    R0,     1                       ; 5679   0040
        MVO     R0,     .ISRVEC.1               ; 567A   0240 0101
L_567C:
        MVI     G_0348, R1                      ; 567C   0281 0348
        SUBI    #$015D, R1                      ; 567E   0339 015D
        MVII    #$000C, R2                      ; 5680   02BA 000C

        JSR     R5,     X_DIV                   ; 5682   0004 011C 01FB

        ADDI    #$0005, R1                      ; 5685   02F9 0005
        SLL     R1,     2                       ; 5687   004D
        SLL     R1,     1                       ; 5688   0049
        INCR    R0                              ; 5689   0008
        SLL     R0,     2                       ; 568A   004C
        SLL     R0,     1                       ; 568B   0048
        MOVR    R0,     R2                      ; 568C   0082
        SWAP    R1,     1                       ; 568D   0041
        ADDR    R1,     R2                      ; 568E   00CA
        MVO     R2,     G_0324                  ; 568F   0242 0324
        MVII    #$0014, R3                      ; 5691   02BB 0014
        MVII    #$031D, R1                      ; 5693   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 5695   0004 0118 01A1

        SDBD                                    ; 5698   0001
        MVII    #$503F, R0                      ; 5699   02B8 003F 0050
        MVO     R0,     G_031E                  ; 569C   0240 031E
        PULR    R7                              ; 569E   02B7

        PSHR    R5                              ; 569F   0275
        CLRR    R0                              ; 56A0   01C0
        MVO     R0,     G_0321                  ; 56A1   0240 0321
        MVI     G_0324, R0                      ; 56A3   0280 0324
        MVO     R0,     G_031F                  ; 56A5   0240 031F
        SWAP    R0,     1                       ; 56A7   0040
        MVO     R0,     G_0320                  ; 56A8   0240 0320
        MVI     G_031D, R0                      ; 56AA   0280 031D
        SDBD                                    ; 56AC   0001
        XORI    #$1000, R0                      ; 56AD   03F8 0000 0010
        MVO     R0,     G_031D                  ; 56B0   0240 031D
        SDBD                                    ; 56B2   0001
        MVII    #$1388, R0                      ; 56B3   02B8 0088 0013
L_56B6:
        DECR    R0                              ; 56B6   0010
        BNEQ    L_56B6                          ; 56B7   022C 0002

        MVI     G_031D, R0                      ; 56B9   0280 031D
        SDBD                                    ; 56BB   0001
        XORI    #$1000, R0                      ; 56BC   03F8 0000 0010
        MVO     R0,     G_031D                  ; 56BF   0240 031D
        MVI     G_0348, R2                      ; 56C1   0282 0348
        MVI     .BTAB.C8,R7                     ; 56C3   0287 02C8

L_56C5:
        MVII    #$0302, R0                      ; 56C5   02B8 0302
        MVO     R0,     G_034A                  ; 56C7   0240 034A
        SDBD                                    ; 56C9   0001
        MVII    #$0041, R0                      ; 56CA   02B8 0041 0000
        MVO     R0,     G_0105                  ; 56CD   0240 0105
L_56CF:
        MVII    #$0080, R0                      ; 56CF   02B8 0080
        SWAP    R0,     1                       ; 56D1   0040
        MOVR    R0,     R1                      ; 56D2   0081
L_56D3:
        MVO     R0,     G_0356                  ; 56D3   0240 0356
        MVO     R1,     G_0357                  ; 56D5   0241 0357
        J       L_5952                          ; 56D7   0004 0358 0152

L_56DA:
        MVI     G_0357, R0                      ; 56DA   0280 0357
        NEGR    R0                              ; 56DC   0020
        CMP     G_0356, R0                      ; 56DD   0340 0356
        BEQ     L_56CF                          ; 56DF   0224 0011

        SUBI    #$003C, R0                      ; 56E1   0338 003C
        CMP     G_0356, R0                      ; 56E3   0340 0356
        BEQ     L_56CF                          ; 56E5   0224 0017

        MVI     G_01EE, R3                      ; 56E7   0283 01EE
        MOVR    R3,     R2                      ; 56E9   009A
        CMP     G_01ED, R3                      ; 56EA   0343 01ED
        BPL     L_5714                          ; 56EC   0203 0026

        INCR    R2                              ; 56EE   000A
        CMP     G_01ED, R2                      ; 56EF   0342 01ED
        BEQ     L_56F4                          ; 56F1   0204 0001

        INCR    R2                              ; 56F3   000A
L_56F4:
        MVO     R2,     G_01EE                  ; 56F4   0242 01EE
L_56F6:
        MVII    #$011C, R4                      ; 56F6   02BC 011C
        MVII    #$0105, R5                      ; 56F8   02BD 0105
L_56FA:
        MVI@    R4,     R0                      ; 56FA   02A0
        MVO@    R0,     R5                      ; 56FB   0268
        DECR    R3                              ; 56FC   0013
        BNEQ    L_56FA                          ; 56FD   022C 0004

        MVO@    R0,     R5                      ; 56FF   0268
        MVO@    R0,     R5                      ; 5700   0268
        MVI     .BTAB.8C,R0                     ; 5701   0280 028C
        SLR     R0,     2                       ; 5703   0064
        ADDI    #$000A, R0                      ; 5704   02F8 000A
        CMP     .BTAB.64,R0                     ; 5706   0340 0264
        BMI     L_56CF                          ; 5708   022B 003A

        MVI     G_0357, R0                      ; 570A   0280 0357
        MOVR    R0,     R1                      ; 570C   0081
        ADDI    #$001E, R0                      ; 570D   02F8 001E
        NEGR    R0                              ; 570F   0020
        SUBI    #$001E, R1                      ; 5710   0339 001E
        B       L_56D3                          ; 5712   0220 0040

L_5714:
        MVI     G_01ED, R0                      ; 5714   0280 01ED
        DECR    R0                              ; 5716   0010
        SLL     R0,     1                       ; 5717   0048
        MVII    #$0009, R1                      ; 5718   02B9 0009
        ADDR    R0,     R7                      ; 571A   00C7

        SUBI    #$0003, R1                      ; 571B   0339 0003
        SUBI    #$0003, R1                      ; 571D   0339 0003
        NOP                                     ; 571F   0034
        NOP                                     ; 5720   0034
        SUBI    #$0003, R1                      ; 5721   0339 0003
        CMP     G_0123, R1                      ; 5723   0341 0123
        BLE     L_5736                          ; 5725   0206 000F

        CMPI    #$0006, R2                      ; 5727   037A 0006
        BEQ     L_5730                          ; 5729   0204 0005

        CMP     G_01ED, R2                      ; 572B   0342 01ED
        BGT     L_5736                          ; 572D   020E 0007

        DECR    R2                              ; 572F   0012
L_5730:
        ADDI    #$0002, R2                      ; 5730   02FA 0002
        MVO     R2,     G_01EE                  ; 5732   0242 01EE
        B       L_56F6                          ; 5734   0220 003F
L_5736:
        J       L_564A                          ; 5736   0004 0354 024A

L_5739:
        DECR    R5                              ; 5739   0015
        MVO     R5,     G_034A                  ; 573A   0245 034A
        MVO     R1,     .BTAB.3C                ; 573C   0241 023C
        MVO     R0,     .BTAB.28                ; 573E   0240 0228
        MVII    #$0358, R3                      ; 5740   02BB 0358
        ADD     G_01EF, R3                      ; 5742   02C3 01EF
        MVI@    R3,     R0                      ; 5744   0298
        NEGR    R0                              ; 5745   0020
        DECR    R3                              ; 5746   0013
        CMP@    R3,     R0                      ; 5747   0358
        BLE     L_5AD2                          ; 5748   0206 0388

        MVO@    R0,     R3                      ; 574A   0258
        B       L_5AD2                          ; 574B   0200 0385

        MOVR    R2,     R3                      ; 574D   0093
        SUBI    #$0001, R3                      ; 574E   033B 0001
        MVI@    R3,     R4                      ; 5750   029C
        XOR     .BTAB.78,R4                     ; 5751   03C4 0278
        RSWD    R4                              ; 5753   003C
        BNC     L_5781                          ; 5754   0209 002B
        BNEQ    L_5781                          ; 5756   020C 0029

L_5758:
        SUBI    #$0001, R3                      ; 5758   033B 0001
        MVI@    R3,     R4                      ; 575A   029C
        XOR     .BTAB.78,R4                     ; 575B   03C4 0278
        RSWD    R4                              ; 575D   003C
        BNC     L_5781                          ; 575E   0209 0021
        BEQ     L_5758                          ; 5760   0224 0009
        B       L_576C                          ; 5762   0200 0008

L_5764:
        MVI     G_034A, R5                      ; 5764   0285 034A
        MVO@    R2,     R5                      ; 5766   026A
        CLRR    R4                              ; 5767   01E4
        MVI     .BTAB.3C,R1                     ; 5768   0281 023C
        MVI     .BTAB.28,R0                     ; 576A   0280 0228
L_576C:
        MVO@    R3,     R5                      ; 576C   026B
        ADDI    #$0001, R3                      ; 576D   02FB 0001
L_576F:
        MVI@    R3,     R4                      ; 576F   029C
        XORI    #$0040, R4                      ; 5770   03FC 0040
        MVO@    R4,     R3                      ; 5772   025C
        ADDI    #$0002, R1                      ; 5773   02F9 0002
        ANDI    #$000F, R4                      ; 5775   03BC 000F
        ADDI    #$034B, R4                      ; 5777   02FC 034B
        ADD@    R4,     R0                      ; 5779   02E0
        ADDI    #$0001, R3                      ; 577A   02FB 0001
        CMPR    R3,     R2                      ; 577C   015A
        BNEQ    L_576F                          ; 577D   022C 000F
        B       L_5783                          ; 577F   0200 0002

L_5781:
        CLRR    R4                              ; 5781   01E4
        MVO@    R4,     R5                      ; 5782   026C
L_5783:
        MOVR    R2,     R3                      ; 5783   0093
        SUBI    #$000D, R3                      ; 5784   033B 000D
        MVI@    R3,     R4                      ; 5786   029C
        XOR     .BTAB.78,R4                     ; 5787   03C4 0278
        RSWD    R4                              ; 5789   003C
        BNC     L_57B8                          ; 578A   0209 002C
        BNEQ    L_57B8                          ; 578C   020C 002A

L_578E:
        SUBI    #$000D, R3                      ; 578E   033B 000D
        MVI@    R3,     R4                      ; 5790   029C
        XOR     .BTAB.78,R4                     ; 5791   03C4 0278
        RSWD    R4                              ; 5793   003C
        BNC     L_57B8                          ; 5794   0209 0022
        BEQ     L_578E                          ; 5796   0224 0009
        B       L_57A3                          ; 5798   0200 0009

L_579A:
        MVI     G_034A, R5                      ; 579A   0285 034A
        MVO@    R2,     R5                      ; 579C   026A
        CLRR    R4                              ; 579D   01E4
        MVO@    R4,     R5                      ; 579E   026C
        MVI     .BTAB.3C,R1                     ; 579F   0281 023C
        MVI     .BTAB.28,R0                     ; 57A1   0280 0228
L_57A3:
        MVO@    R3,     R5                      ; 57A3   026B
        ADDI    #$000D, R3                      ; 57A4   02FB 000D
L_57A6:
        MVI@    R3,     R4                      ; 57A6   029C
        XORI    #$0040, R4                      ; 57A7   03FC 0040
        MVO@    R4,     R3                      ; 57A9   025C
        ADDI    #$0002, R1                      ; 57AA   02F9 0002
        ANDI    #$000F, R4                      ; 57AC   03BC 000F
        ADDI    #$034B, R4                      ; 57AE   02FC 034B
        ADD@    R4,     R0                      ; 57B0   02E0
        ADDI    #$000D, R3                      ; 57B1   02FB 000D
        CMPR    R3,     R2                      ; 57B3   015A
        BNEQ    L_57A6                          ; 57B4   022C 000F
        B       L_57BA                          ; 57B6   0200 0002

L_57B8:
        CLRR    R4                              ; 57B8   01E4
        MVO@    R4,     R5                      ; 57B9   026C
L_57BA:
        MOVR    R2,     R3                      ; 57BA   0093
        SUBI    #$000C, R3                      ; 57BB   033B 000C
        MVI@    R3,     R4                      ; 57BD   029C
        XOR     .BTAB.78,R4                     ; 57BE   03C4 0278
        RSWD    R4                              ; 57C0   003C
        BNC     L_57F0                          ; 57C1   0209 002D
        BNEQ    L_57F0                          ; 57C3   020C 002B

L_57C5:
        SUBI    #$000C, R3                      ; 57C5   033B 000C
        MVI@    R3,     R4                      ; 57C7   029C
        XOR     .BTAB.78,R4                     ; 57C8   03C4 0278
        RSWD    R4                              ; 57CA   003C
        BNC     L_57F0                          ; 57CB   0209 0023
        BEQ     L_57C5                          ; 57CD   0224 0009
        B       L_57DB                          ; 57CF   0200 000A

L_57D1:
        MVI     G_034A, R5                      ; 57D1   0285 034A
        MVO@    R2,     R5                      ; 57D3   026A
        CLRR    R4                              ; 57D4   01E4
        MVO@    R4,     R5                      ; 57D5   026C
        MVO@    R4,     R5                      ; 57D6   026C
        MVI     .BTAB.3C,R1                     ; 57D7   0281 023C
        MVI     .BTAB.28,R0                     ; 57D9   0280 0228
L_57DB:
        MVO@    R3,     R5                      ; 57DB   026B
        ADDI    #$000C, R3                      ; 57DC   02FB 000C
L_57DE:
        MVI@    R3,     R4                      ; 57DE   029C
        XORI    #$0040, R4                      ; 57DF   03FC 0040
        MVO@    R4,     R3                      ; 57E1   025C
        ADDI    #$0002, R1                      ; 57E2   02F9 0002
        ANDI    #$000F, R4                      ; 57E4   03BC 000F
        ADDI    #$034B, R4                      ; 57E6   02FC 034B
        ADD@    R4,     R0                      ; 57E8   02E0
        ADDI    #$000C, R3                      ; 57E9   02FB 000C
        CMPR    R3,     R2                      ; 57EB   015A
        BNEQ    L_57DE                          ; 57EC   022C 000F
        B       L_57F2                          ; 57EE   0200 0002

L_57F0:
        CLRR    R4                              ; 57F0   01E4
        MVO@    R4,     R5                      ; 57F1   026C
L_57F2:
        MOVR    R2,     R3                      ; 57F2   0093
        SUBI    #$000B, R3                      ; 57F3   033B 000B
        MVI@    R3,     R4                      ; 57F5   029C
        XOR     .BTAB.78,R4                     ; 57F6   03C4 0278
        RSWD    R4                              ; 57F8   003C
        BNC     L_5829                          ; 57F9   0209 002E
        BNEQ    L_5829                          ; 57FB   020C 002C

L_57FD:
        SUBI    #$000B, R3                      ; 57FD   033B 000B
        MVI@    R3,     R4                      ; 57FF   029C
        XOR     .BTAB.78,R4                     ; 5800   03C4 0278
        RSWD    R4                              ; 5802   003C
        BNC     L_5829                          ; 5803   0209 0024
        BEQ     L_57FD                          ; 5805   0224 0009
        B       L_5814                          ; 5807   0200 000B

L_5809:
        MVI     G_034A, R5                      ; 5809   0285 034A
        MVO@    R2,     R5                      ; 580B   026A
        CLRR    R4                              ; 580C   01E4
        MVO@    R4,     R5                      ; 580D   026C
        MVO@    R4,     R5                      ; 580E   026C
        MVO@    R4,     R5                      ; 580F   026C
        MVI     .BTAB.3C,R1                     ; 5810   0281 023C
        MVI     .BTAB.28,R0                     ; 5812   0280 0228
L_5814:
        MVO@    R3,     R5                      ; 5814   026B
        ADDI    #$000B, R3                      ; 5815   02FB 000B
L_5817:
        MVI@    R3,     R4                      ; 5817   029C
        XORI    #$0040, R4                      ; 5818   03FC 0040
        MVO@    R4,     R3                      ; 581A   025C
        ADDI    #$0002, R1                      ; 581B   02F9 0002
        ANDI    #$000F, R4                      ; 581D   03BC 000F
        ADDI    #$034B, R4                      ; 581F   02FC 034B
        ADD@    R4,     R0                      ; 5821   02E0
        ADDI    #$000B, R3                      ; 5822   02FB 000B
        CMPR    R3,     R2                      ; 5824   015A
        BNEQ    L_5817                          ; 5825   022C 000F
        B       L_582B                          ; 5827   0200 0002

L_5829:
        CLRR    R4                              ; 5829   01E4
        MVO@    R4,     R5                      ; 582A   026C
L_582B:
        MOVR    R2,     R3                      ; 582B   0093
        ADDI    #$0001, R3                      ; 582C   02FB 0001
        MVI@    R3,     R4                      ; 582E   029C
        XOR     .BTAB.78,R4                     ; 582F   03C4 0278
        RSWD    R4                              ; 5831   003C
        BNC     L_5864                          ; 5832   0209 0030
        BNEQ    L_5864                          ; 5834   020C 002E

L_5836:
        ADDI    #$0001, R3                      ; 5836   02FB 0001
        MVI@    R3,     R4                      ; 5838   029C
        XOR     .BTAB.78,R4                     ; 5839   03C4 0278
        RSWD    R4                              ; 583B   003C
        BNC     L_5864                          ; 583C   0209 0026
        BEQ     L_5836                          ; 583E   0224 0009
        B       L_584F                          ; 5840   0200 000D

L_5842:
        MVI     G_034A, R5                      ; 5842   0285 034A
        MVO@    R2,     R5                      ; 5844   026A
        CLRR    R4                              ; 5845   01E4
        MVO@    R4,     R5                      ; 5846   026C
        MVO@    R4,     R5                      ; 5847   026C
        MVO@    R4,     R5                      ; 5848   026C
        MVO@    R4,     R5                      ; 5849   026C
        NOP                                     ; 584A   0034
        MVI     .BTAB.3C,R1                     ; 584B   0281 023C
        MVI     .BTAB.28,R0                     ; 584D   0280 0228
L_584F:
        MVO@    R3,     R5                      ; 584F   026B
        SUBI    #$0001, R3                      ; 5850   033B 0001
L_5852:
        MVI@    R3,     R4                      ; 5852   029C
        XORI    #$0040, R4                      ; 5853   03FC 0040
        MVO@    R4,     R3                      ; 5855   025C
        ADDI    #$0002, R1                      ; 5856   02F9 0002
        ANDI    #$000F, R4                      ; 5858   03BC 000F
        ADDI    #$034B, R4                      ; 585A   02FC 034B
        ADD@    R4,     R0                      ; 585C   02E0
        SUBI    #$0001, R3                      ; 585D   033B 0001
        CMPR    R3,     R2                      ; 585F   015A
        BNEQ    L_5852                          ; 5860   022C 000F
        B       L_5866                          ; 5862   0200 0002

L_5864:
        CLRR    R4                              ; 5864   01E4
        MVO@    R4,     R5                      ; 5865   026C
L_5866:
        MOVR    R2,     R3                      ; 5866   0093
        ADDI    #$000D, R3                      ; 5867   02FB 000D
        MVI@    R3,     R4                      ; 5869   029C
        XOR     .BTAB.78,R4                     ; 586A   03C4 0278
        RSWD    R4                              ; 586C   003C
        BNC     L_58A0                          ; 586D   0209 0031
        BNEQ    L_58A0                          ; 586F   020C 002F

L_5871:
        ADDI    #$000D, R3                      ; 5871   02FB 000D
        MVI@    R3,     R4                      ; 5873   029C
        XOR     .BTAB.78,R4                     ; 5874   03C4 0278
        RSWD    R4                              ; 5876   003C
        BNC     L_58A0                          ; 5877   0209 0027
        BEQ     L_5871                          ; 5879   0224 0009
        B       L_588B                          ; 587B   0200 000E

L_587D:
        MVI     G_034A, R5                      ; 587D   0285 034A
        MVO@    R2,     R5                      ; 587F   026A
        CLRR    R4                              ; 5880   01E4
        MVO@    R4,     R5                      ; 5881   026C
        MVO@    R4,     R5                      ; 5882   026C
        MVO@    R4,     R5                      ; 5883   026C
        MVO@    R4,     R5                      ; 5884   026C
        NOP                                     ; 5885   0034
        MVO@    R4,     R5                      ; 5886   026C
        MVI     .BTAB.3C,R1                     ; 5887   0281 023C
        MVI     .BTAB.28,R0                     ; 5889   0280 0228
L_588B:
        MVO@    R3,     R5                      ; 588B   026B
        SUBI    #$000D, R3                      ; 588C   033B 000D
L_588E:
        MVI@    R3,     R4                      ; 588E   029C
        XORI    #$0040, R4                      ; 588F   03FC 0040
        MVO@    R4,     R3                      ; 5891   025C
        ADDI    #$0002, R1                      ; 5892   02F9 0002
        ANDI    #$000F, R4                      ; 5894   03BC 000F
        ADDI    #$034B, R4                      ; 5896   02FC 034B
        ADD@    R4,     R0                      ; 5898   02E0
        SUBI    #$000D, R3                      ; 5899   033B 000D
        CMPR    R3,     R2                      ; 589B   015A
        BNEQ    L_588E                          ; 589C   022C 000F
        B       L_58A2                          ; 589E   0200 0002

L_58A0:
        CLRR    R4                              ; 58A0   01E4
        MVO@    R4,     R5                      ; 58A1   026C
L_58A2:
        MOVR    R2,     R3                      ; 58A2   0093
        ADDI    #$000C, R3                      ; 58A3   02FB 000C
        MVI@    R3,     R4                      ; 58A5   029C
        XOR     .BTAB.78,R4                     ; 58A6   03C4 0278
        RSWD    R4                              ; 58A8   003C
        BNC     L_58DD                          ; 58A9   0209 0032
        BNEQ    L_58DD                          ; 58AB   020C 0030

L_58AD:
        ADDI    #$000C, R3                      ; 58AD   02FB 000C
        MVI@    R3,     R4                      ; 58AF   029C
        XOR     .BTAB.78,R4                     ; 58B0   03C4 0278
        RSWD    R4                              ; 58B2   003C
        BNC     L_58DD                          ; 58B3   0209 0028
        BEQ     L_58AD                          ; 58B5   0224 0009
        B       L_58C8                          ; 58B7   0200 000F

L_58B9:
        MVI     G_034A, R5                      ; 58B9   0285 034A
        MVO@    R2,     R5                      ; 58BB   026A
        CLRR    R4                              ; 58BC   01E4
        MVO@    R4,     R5                      ; 58BD   026C
        MVO@    R4,     R5                      ; 58BE   026C
        MVO@    R4,     R5                      ; 58BF   026C
        MVO@    R4,     R5                      ; 58C0   026C
        NOP                                     ; 58C1   0034
        MVO@    R4,     R5                      ; 58C2   026C
        MVO@    R4,     R5                      ; 58C3   026C
        MVI     .BTAB.3C,R1                     ; 58C4   0281 023C
        MVI     .BTAB.28,R0                     ; 58C6   0280 0228
L_58C8:
        MVO@    R3,     R5                      ; 58C8   026B
        SUBI    #$000C, R3                      ; 58C9   033B 000C
L_58CB:
        MVI@    R3,     R4                      ; 58CB   029C
        XORI    #$0040, R4                      ; 58CC   03FC 0040
        MVO@    R4,     R3                      ; 58CE   025C
        ADDI    #$0002, R1                      ; 58CF   02F9 0002
        ANDI    #$000F, R4                      ; 58D1   03BC 000F
        ADDI    #$034B, R4                      ; 58D3   02FC 034B
        ADD@    R4,     R0                      ; 58D5   02E0
        SUBI    #$000C, R3                      ; 58D6   033B 000C
        CMPR    R3,     R2                      ; 58D8   015A
        BNEQ    L_58CB                          ; 58D9   022C 000F
        B       L_58DF                          ; 58DB   0200 0002

L_58DD:
        CLRR    R4                              ; 58DD   01E4
        MVO@    R4,     R5                      ; 58DE   026C
L_58DF:
        MOVR    R2,     R3                      ; 58DF   0093
        ADDI    #$000B, R3                      ; 58E0   02FB 000B
        MVI@    R3,     R4                      ; 58E2   029C
        XOR     .BTAB.78,R4                     ; 58E3   03C4 0278
        RSWD    R4                              ; 58E5   003C
        BNC     L_591B                          ; 58E6   0209 0033
        BNEQ    L_591B                          ; 58E8   020C 0031

L_58EA:
        ADDI    #$000B, R3                      ; 58EA   02FB 000B
        MVI@    R3,     R4                      ; 58EC   029C
        XOR     .BTAB.78,R4                     ; 58ED   03C4 0278
        RSWD    R4                              ; 58EF   003C
        BNC     L_591B                          ; 58F0   0209 0029
        BEQ     L_58EA                          ; 58F2   0224 0009
        B       L_5906                          ; 58F4   0200 0010

L_58F6:
        MVI     G_034A, R5                      ; 58F6   0285 034A
        MVO@    R2,     R5                      ; 58F8   026A
        CLRR    R4                              ; 58F9   01E4
        MVO@    R4,     R5                      ; 58FA   026C
        MVO@    R4,     R5                      ; 58FB   026C
        MVO@    R4,     R5                      ; 58FC   026C
        MVO@    R4,     R5                      ; 58FD   026C
        NOP                                     ; 58FE   0034
        MVO@    R4,     R5                      ; 58FF   026C
        MVO@    R4,     R5                      ; 5900   026C
        MVO@    R4,     R5                      ; 5901   026C
        MVI     .BTAB.3C,R1                     ; 5902   0281 023C
        MVI     .BTAB.28,R0                     ; 5904   0280 0228
L_5906:
        MVO@    R3,     R5                      ; 5906   026B
        SUBI    #$000B, R3                      ; 5907   033B 000B
L_5909:
        MVI@    R3,     R4                      ; 5909   029C
        XORI    #$0040, R4                      ; 590A   03FC 0040
        MVO@    R4,     R3                      ; 590C   025C
        ADDI    #$0002, R1                      ; 590D   02F9 0002
        ANDI    #$000F, R4                      ; 590F   03BC 000F
        ADDI    #$034B, R4                      ; 5911   02FC 034B
        ADD@    R4,     R0                      ; 5913   02E0
        SUBI    #$000B, R3                      ; 5914   033B 000B
        CMPR    R3,     R2                      ; 5916   015A
        BNEQ    L_5909                          ; 5917   022C 000F
        B       L_591D                          ; 5919   0200 0002

L_591B:
        CLRR    R4                              ; 591B   01E4
        MVO@    R4,     R5                      ; 591C   026C
L_591D:
        MVI     .BTAB.78,R4                     ; 591D   0284 0278
        ANDI    #$0040, R4                      ; 591F   03BC 0040
        ADDI    #$0010, R4                      ; 5921   02FC 0010
        ADD@    R2,     R4                      ; 5923   02D4
        MVO@    R4,     R2                      ; 5924   0254
        INCR    R1                              ; 5925   0009
        SLL     R0,     1                       ; 5926   0048
        ANDI    #$000F, R4                      ; 5927   03BC 000F
        ADDI    #$034B, R4                      ; 5929   02FC 034B
        ADD@    R4,     R0                      ; 592B   02E0
        SAR     R0,     1                       ; 592C   0068
        MVI     .BTAB.64,R4                     ; 592D   0284 0264
        INCR    R4                              ; 592F   000C
        MVO     R4,     .BTAB.64                ; 5930   0244 0264
L_5932:
        MVO     R5,     G_034A                  ; 5932   0245 034A
        NEGR    R1                              ; 5934   0021
        MVO     R1,     .BTAB.3C                ; 5935   0241 023C
        NEGR    R0                              ; 5937   0020
        MVO     R0,     .BTAB.28                ; 5938   0240 0228
        MVI     .BTAB.78,R3                     ; 593A   0283 0278
        SWAP    R3,     1                       ; 593C   0043
        MVO     R3,     .BTAB.78                ; 593D   0243 0278
        MVI     G_01EF, R4                      ; 593F   0284 01EF
        INCR    R4                              ; 5941   000C
        MVO     R4,     G_01EF                  ; 5942   0244 01EF
        CMP     G_01EE, R4                      ; 5944   0344 01EE
        BNEQ    L_5954                          ; 5946   020C 000C
        J       L_5DD2                          ; 5948   0004 035C 01D2

L_594B:
        MVII    #$0357, R5                      ; 594B   02BD 0357
        ADD     G_01EF, R5                      ; 594D   02C5 01EF
        MVO@    R3,     R5                      ; 594F   026B
        B       L_5AD2                          ; 5950   0200 0180
L_5952:
        B       L_5959                          ; 5952   0200 0005

L_5954:
        ADDI    #$0355, R4                      ; 5954   02FC 0355
        MVI@    R4,     R0                      ; 5956   02A0
        INCR    R4                              ; 5957   000C
        MVO@    R0,     R4                      ; 5958   0260
L_5959:
        MVI     .BTAB.78,R1                     ; 5959   0281 0278
        MVI     .BTAB.14,R4                     ; 595B   0284 0214
        MVO     R4,     .BTAB.A0                ; 595D   0244 02A0
        MVII    #$0105, R4                      ; 595F   02BC 0105
        ADD     G_01EF, R4                      ; 5961   02C4 01EF
        MVI@    R4,     R2                      ; 5963   02A2
        ADDI    #$015D, R2                      ; 5964   02FA 015D
        MVI@    R2,     R0                      ; 5966   0290
        RSWD    R0                              ; 5967   0038
        BESC    L_5A12                          ; 5968   020F 00A8

        MOVR    R2,     R3                      ; 596A   0093
        SUBI    #$0001, R3                      ; 596B   033B 0001
        MVI@    R3,     R0                      ; 596D   0298
        XORR    R1,     R0                      ; 596E   01C8
        RSWD    R0                              ; 596F   0038
        BNC     L_597F                          ; 5970   0209 000D
        BNEQ    L_597F                          ; 5972   020C 000B

L_5974:
        SUBI    #$0001, R3                      ; 5974   033B 0001
        MVI@    R3,     R0                      ; 5976   0298
        XORR    R1,     R0                      ; 5977   01C8
        RSWD    R0                              ; 5978   0038
        BNC     L_597F                          ; 5979   0209 0004
        BEQ     L_5974                          ; 597B   0224 0008
        B       L_5764                          ; 597D   0220 021A

L_597F:
        MOVR    R2,     R3                      ; 597F   0093
        SUBI    #$000D, R3                      ; 5980   033B 000D
        MVI@    R3,     R0                      ; 5982   0298
        XORR    R1,     R0                      ; 5983   01C8
        RSWD    R0                              ; 5984   0038
        BNC     L_5994                          ; 5985   0209 000D
        BNEQ    L_5994                          ; 5987   020C 000B

L_5989:
        SUBI    #$000D, R3                      ; 5989   033B 000D
        MVI@    R3,     R0                      ; 598B   0298
        XORR    R1,     R0                      ; 598C   01C8
        RSWD    R0                              ; 598D   0038
        BNC     L_5994                          ; 598E   0209 0004
        BEQ     L_5989                          ; 5990   0224 0008
        B       L_579A                          ; 5992   0220 01F9

L_5994:
        MOVR    R2,     R3                      ; 5994   0093
        SUBI    #$000C, R3                      ; 5995   033B 000C
        MVI@    R3,     R0                      ; 5997   0298
        XORR    R1,     R0                      ; 5998   01C8
        RSWD    R0                              ; 5999   0038
        BNC     L_59A9                          ; 599A   0209 000D
        BNEQ    L_59A9                          ; 599C   020C 000B

L_599E:
        SUBI    #$000C, R3                      ; 599E   033B 000C
        MVI@    R3,     R0                      ; 59A0   0298
        XORR    R1,     R0                      ; 59A1   01C8
        RSWD    R0                              ; 59A2   0038
        BNC     L_59A9                          ; 59A3   0209 0004
        BEQ     L_599E                          ; 59A5   0224 0008
        B       L_57D1                          ; 59A7   0220 01D7

L_59A9:
        MOVR    R2,     R3                      ; 59A9   0093
        SUBI    #$000B, R3                      ; 59AA   033B 000B
        MVI@    R3,     R0                      ; 59AC   0298
        XORR    R1,     R0                      ; 59AD   01C8
        RSWD    R0                              ; 59AE   0038
        BNC     L_59BE                          ; 59AF   0209 000D
        BNEQ    L_59BE                          ; 59B1   020C 000B

L_59B3:
        SUBI    #$000B, R3                      ; 59B3   033B 000B
        MVI@    R3,     R0                      ; 59B5   0298
        XORR    R1,     R0                      ; 59B6   01C8
        RSWD    R0                              ; 59B7   0038
        BNC     L_59BE                          ; 59B8   0209 0004
        BEQ     L_59B3                          ; 59BA   0224 0008
        B       L_5809                          ; 59BC   0220 01B4

L_59BE:
        MOVR    R2,     R3                      ; 59BE   0093
        ADDI    #$0001, R3                      ; 59BF   02FB 0001
        MVI@    R3,     R0                      ; 59C1   0298
        XORR    R1,     R0                      ; 59C2   01C8
        RSWD    R0                              ; 59C3   0038
        BNC     L_59D3                          ; 59C4   0209 000D
        BNEQ    L_59D3                          ; 59C6   020C 000B

L_59C8:
        ADDI    #$0001, R3                      ; 59C8   02FB 0001
        MVI@    R3,     R0                      ; 59CA   0298
        XORR    R1,     R0                      ; 59CB   01C8
        RSWD    R0                              ; 59CC   0038
        BNC     L_59D3                          ; 59CD   0209 0004
        BEQ     L_59C8                          ; 59CF   0224 0008
        B       L_5842                          ; 59D1   0220 0190

L_59D3:
        MOVR    R2,     R3                      ; 59D3   0093
        ADDI    #$000D, R3                      ; 59D4   02FB 000D
        MVI@    R3,     R0                      ; 59D6   0298
        XORR    R1,     R0                      ; 59D7   01C8
        RSWD    R0                              ; 59D8   0038
        BNC     L_59E8                          ; 59D9   0209 000D
        BNEQ    L_59E8                          ; 59DB   020C 000B

L_59DD:
        ADDI    #$000D, R3                      ; 59DD   02FB 000D
        MVI@    R3,     R0                      ; 59DF   0298
        XORR    R1,     R0                      ; 59E0   01C8
        RSWD    R0                              ; 59E1   0038
        BNC     L_59E8                          ; 59E2   0209 0004
        BEQ     L_59DD                          ; 59E4   0224 0008
        B       L_587D                          ; 59E6   0220 016A

L_59E8:
        MOVR    R2,     R3                      ; 59E8   0093
        ADDI    #$000C, R3                      ; 59E9   02FB 000C
        MVI@    R3,     R0                      ; 59EB   0298
        XORR    R1,     R0                      ; 59EC   01C8
        RSWD    R0                              ; 59ED   0038
        BNC     L_59FD                          ; 59EE   0209 000D
        BNEQ    L_59FD                          ; 59F0   020C 000B

L_59F2:
        ADDI    #$000C, R3                      ; 59F2   02FB 000C
        MVI@    R3,     R0                      ; 59F4   0298
        XORR    R1,     R0                      ; 59F5   01C8
        RSWD    R0                              ; 59F6   0038
        BNC     L_59FD                          ; 59F7   0209 0004
        BEQ     L_59F2                          ; 59F9   0224 0008
        B       L_58B9                          ; 59FB   0220 0143

L_59FD:
        MOVR    R2,     R3                      ; 59FD   0093
        ADDI    #$000B, R3                      ; 59FE   02FB 000B
        MVI@    R3,     R0                      ; 5A00   0298
        XORR    R1,     R0                      ; 5A01   01C8
        RSWD    R0                              ; 5A02   0038
        BNC     L_5A12                          ; 5A03   0209 000D
        BNEQ    L_5A12                          ; 5A05   020C 000B

L_5A07:
        ADDI    #$000B, R3                      ; 5A07   02FB 000B
        MVI@    R3,     R0                      ; 5A09   0298
        XORR    R1,     R0                      ; 5A0A   01C8
        RSWD    R0                              ; 5A0B   0038
        BNC     L_5A12                          ; 5A0C   0209 0004
        BEQ     L_5A07                          ; 5A0E   0224 0008
        B       L_58F6                          ; 5A10   0220 011B

L_5A12:
        MVI     .BTAB.00,R2                     ; 5A12   0282 0200
L_5A14:
        MVI@    R2,     R0                      ; 5A14   0290
        RSWD    R0                              ; 5A15   0038
        BESC    L_5AC7                          ; 5A16   020F 00AF

        DECR    R4                              ; 5A18   0014
        MVI@    R4,     R3                      ; 5A19   02A3
        ADDI    #$015D, R3                      ; 5A1A   02FB 015D
        CMPR    R3,     R2                      ; 5A1C   015A
        BEQ     L_5AC7                          ; 5A1D   0204 00A8

        MOVR    R2,     R3                      ; 5A1F   0093
        SUBI    #$0001, R3                      ; 5A20   033B 0001
        MVI@    R3,     R0                      ; 5A22   0298
        XORR    R1,     R0                      ; 5A23   01C8
        RSWD    R0                              ; 5A24   0038
        BNC     L_5A34                          ; 5A25   0209 000D
        BNEQ    L_5A34                          ; 5A27   020C 000B

L_5A29:
        SUBI    #$0001, R3                      ; 5A29   033B 0001
        MVI@    R3,     R0                      ; 5A2B   0298
        XORR    R1,     R0                      ; 5A2C   01C8
        RSWD    R0                              ; 5A2D   0038
        BNC     L_5A34                          ; 5A2E   0209 0004
        BEQ     L_5A29                          ; 5A30   0224 0008
        B       L_5764                          ; 5A32   0220 02CF

L_5A34:
        MOVR    R2,     R3                      ; 5A34   0093
        SUBI    #$000D, R3                      ; 5A35   033B 000D
        MVI@    R3,     R0                      ; 5A37   0298
        XORR    R1,     R0                      ; 5A38   01C8
        RSWD    R0                              ; 5A39   0038
        BNC     L_5A49                          ; 5A3A   0209 000D
        BNEQ    L_5A49                          ; 5A3C   020C 000B

L_5A3E:
        SUBI    #$000D, R3                      ; 5A3E   033B 000D
        MVI@    R3,     R0                      ; 5A40   0298
        XORR    R1,     R0                      ; 5A41   01C8
        RSWD    R0                              ; 5A42   0038
        BNC     L_5A49                          ; 5A43   0209 0004
        BEQ     L_5A3E                          ; 5A45   0224 0008
        B       L_579A                          ; 5A47   0220 02AE

L_5A49:
        MOVR    R2,     R3                      ; 5A49   0093
        SUBI    #$000C, R3                      ; 5A4A   033B 000C
        MVI@    R3,     R0                      ; 5A4C   0298
        XORR    R1,     R0                      ; 5A4D   01C8
        RSWD    R0                              ; 5A4E   0038
        BNC     L_5A5E                          ; 5A4F   0209 000D
        BNEQ    L_5A5E                          ; 5A51   020C 000B

L_5A53:
        SUBI    #$000C, R3                      ; 5A53   033B 000C
        MVI@    R3,     R0                      ; 5A55   0298
        XORR    R1,     R0                      ; 5A56   01C8
        RSWD    R0                              ; 5A57   0038
        BNC     L_5A5E                          ; 5A58   0209 0004
        BEQ     L_5A53                          ; 5A5A   0224 0008
        B       L_57D1                          ; 5A5C   0220 028C

L_5A5E:
        MOVR    R2,     R3                      ; 5A5E   0093
        SUBI    #$000B, R3                      ; 5A5F   033B 000B
        MVI@    R3,     R0                      ; 5A61   0298
        XORR    R1,     R0                      ; 5A62   01C8
        RSWD    R0                              ; 5A63   0038
        BNC     L_5A73                          ; 5A64   0209 000D
        BNEQ    L_5A73                          ; 5A66   020C 000B

L_5A68:
        SUBI    #$000B, R3                      ; 5A68   033B 000B
        MVI@    R3,     R0                      ; 5A6A   0298
        XORR    R1,     R0                      ; 5A6B   01C8
        RSWD    R0                              ; 5A6C   0038
        BNC     L_5A73                          ; 5A6D   0209 0004
        BEQ     L_5A68                          ; 5A6F   0224 0008
        B       L_5809                          ; 5A71   0220 0269

L_5A73:
        MOVR    R2,     R3                      ; 5A73   0093
        ADDI    #$0001, R3                      ; 5A74   02FB 0001
        MVI@    R3,     R0                      ; 5A76   0298
        XORR    R1,     R0                      ; 5A77   01C8
        RSWD    R0                              ; 5A78   0038
        BNC     L_5A88                          ; 5A79   0209 000D
        BNEQ    L_5A88                          ; 5A7B   020C 000B

L_5A7D:
        ADDI    #$0001, R3                      ; 5A7D   02FB 0001
        MVI@    R3,     R0                      ; 5A7F   0298
        XORR    R1,     R0                      ; 5A80   01C8
        RSWD    R0                              ; 5A81   0038
        BNC     L_5A88                          ; 5A82   0209 0004
        BEQ     L_5A7D                          ; 5A84   0224 0008
        B       L_5842                          ; 5A86   0220 0245

L_5A88:
        MOVR    R2,     R3                      ; 5A88   0093
        ADDI    #$000D, R3                      ; 5A89   02FB 000D
        MVI@    R3,     R0                      ; 5A8B   0298
        XORR    R1,     R0                      ; 5A8C   01C8
        RSWD    R0                              ; 5A8D   0038
        BNC     L_5A9D                          ; 5A8E   0209 000D
        BNEQ    L_5A9D                          ; 5A90   020C 000B

L_5A92:
        ADDI    #$000D, R3                      ; 5A92   02FB 000D
        MVI@    R3,     R0                      ; 5A94   0298
        XORR    R1,     R0                      ; 5A95   01C8
        RSWD    R0                              ; 5A96   0038
        BNC     L_5A9D                          ; 5A97   0209 0004
        BEQ     L_5A92                          ; 5A99   0224 0008
        B       L_587D                          ; 5A9B   0220 021F

L_5A9D:
        MOVR    R2,     R3                      ; 5A9D   0093
        ADDI    #$000C, R3                      ; 5A9E   02FB 000C
        MVI@    R3,     R0                      ; 5AA0   0298
        XORR    R1,     R0                      ; 5AA1   01C8
        RSWD    R0                              ; 5AA2   0038
        BNC     L_5AB2                          ; 5AA3   0209 000D
        BNEQ    L_5AB2                          ; 5AA5   020C 000B

L_5AA7:
        ADDI    #$000C, R3                      ; 5AA7   02FB 000C
        MVI@    R3,     R0                      ; 5AA9   0298
        XORR    R1,     R0                      ; 5AAA   01C8
        RSWD    R0                              ; 5AAB   0038
        BNC     L_5AB2                          ; 5AAC   0209 0004
        BEQ     L_5AA7                          ; 5AAE   0224 0008
        B       L_58B9                          ; 5AB0   0220 01F8

L_5AB2:
        MOVR    R2,     R3                      ; 5AB2   0093
        ADDI    #$000B, R3                      ; 5AB3   02FB 000B
        MVI@    R3,     R0                      ; 5AB5   0298
        XORR    R1,     R0                      ; 5AB6   01C8
        RSWD    R0                              ; 5AB7   0038
        BNC     L_5AC7                          ; 5AB8   0209 000D
        BNEQ    L_5AC7                          ; 5ABA   020C 000B

L_5ABC:
        ADDI    #$000B, R3                      ; 5ABC   02FB 000B
        MVI@    R3,     R0                      ; 5ABE   0298
        XORR    R1,     R0                      ; 5ABF   01C8
        RSWD    R0                              ; 5AC0   0038
        BNC     L_5AC7                          ; 5AC1   0209 0004
        BEQ     L_5ABC                          ; 5AC3   0224 0008
        B       L_58F6                          ; 5AC5   0220 01D0

L_5AC7:
        INCR    R2                              ; 5AC7   000A
        CMP     .BTAB.14,R2                     ; 5AC8   0342 0214
        BNEQ    L_5A14                          ; 5ACA   022C 00B7

        MVI     .BTAB.14,R4                     ; 5ACC   0284 0214
        SUB     .BTAB.A0,R4                     ; 5ACE   0304 02A0
        BEQ     L_5C36                          ; 5AD0   0204 0164

L_5AD2:
        MVI     G_01EF, R4                      ; 5AD2   0284 01EF
        DECR    R4                              ; 5AD4   0014
        BMI     L_5C33                          ; 5AD5   020B 015C

        MVO     R4,     G_01EF                  ; 5AD7   0244 01EF
        MVI     .BTAB.78,R3                     ; 5AD9   0283 0278
        SWAP    R3,     1                       ; 5ADB   0043
        MVO     R3,     .BTAB.78                ; 5ADC   0243 0278
        MVI     G_034A, R5                      ; 5ADE   0285 034A
        SUBI    #$0009, R5                      ; 5AE0   033D 0009
        MVI@    R5,     R2                      ; 5AE2   02AA
        MVI     .BTAB.3C,R1                     ; 5AE3   0281 023C
        NEGR    R1                              ; 5AE5   0021
        MVI     .BTAB.28,R0                     ; 5AE6   0280 0228
        NEGR    R0                              ; 5AE8   0020
        TSTR    R2                              ; 5AE9   0092
        BEQ     L_5739                          ; 5AEA   0224 03B2

        MVI@    R5,     R3                      ; 5AEC   02AB
        TSTR    R3                              ; 5AED   009B
        BEQ     L_5B02                          ; 5AEE   0204 0012

        ADDI    #$0001, R3                      ; 5AF0   02FB 0001
L_5AF2:
        MVI@    R3,     R4                      ; 5AF2   029C
        XORI    #$0040, R4                      ; 5AF3   03FC 0040
        MVO@    R4,     R3                      ; 5AF5   025C
        SUBI    #$0002, R1                      ; 5AF6   0339 0002
        ANDI    #$000F, R4                      ; 5AF8   03BC 000F
        ADDI    #$034B, R4                      ; 5AFA   02FC 034B
        SUB@    R4,     R0                      ; 5AFC   0320
        ADDI    #$0001, R3                      ; 5AFD   02FB 0001
        CMPR    R3,     R2                      ; 5AFF   015A
        BNEQ    L_5AF2                          ; 5B00   022C 000F

L_5B02:
        MVI@    R5,     R3                      ; 5B02   02AB
        TSTR    R3                              ; 5B03   009B
        BEQ     L_5B18                          ; 5B04   0204 0012

        ADDI    #$000D, R3                      ; 5B06   02FB 000D
L_5B08:
        MVI@    R3,     R4                      ; 5B08   029C
        XORI    #$0040, R4                      ; 5B09   03FC 0040
        MVO@    R4,     R3                      ; 5B0B   025C
        SUBI    #$0002, R1                      ; 5B0C   0339 0002
        ANDI    #$000F, R4                      ; 5B0E   03BC 000F
        ADDI    #$034B, R4                      ; 5B10   02FC 034B
        SUB@    R4,     R0                      ; 5B12   0320
        ADDI    #$000D, R3                      ; 5B13   02FB 000D
        CMPR    R3,     R2                      ; 5B15   015A
        BNEQ    L_5B08                          ; 5B16   022C 000F

L_5B18:
        MVI@    R5,     R3                      ; 5B18   02AB
        TSTR    R3                              ; 5B19   009B
        BEQ     L_5B2E                          ; 5B1A   0204 0012

        ADDI    #$000C, R3                      ; 5B1C   02FB 000C
L_5B1E:
        MVI@    R3,     R4                      ; 5B1E   029C
        XORI    #$0040, R4                      ; 5B1F   03FC 0040
        MVO@    R4,     R3                      ; 5B21   025C
        SUBI    #$0002, R1                      ; 5B22   0339 0002
        ANDI    #$000F, R4                      ; 5B24   03BC 000F
        ADDI    #$034B, R4                      ; 5B26   02FC 034B
        SUB@    R4,     R0                      ; 5B28   0320
        ADDI    #$000C, R3                      ; 5B29   02FB 000C
        CMPR    R3,     R2                      ; 5B2B   015A
        BNEQ    L_5B1E                          ; 5B2C   022C 000F

L_5B2E:
        MVI@    R5,     R3                      ; 5B2E   02AB
        TSTR    R3                              ; 5B2F   009B
        BEQ     L_5B44                          ; 5B30   0204 0012

        ADDI    #$000B, R3                      ; 5B32   02FB 000B
L_5B34:
        MVI@    R3,     R4                      ; 5B34   029C
        XORI    #$0040, R4                      ; 5B35   03FC 0040
        MVO@    R4,     R3                      ; 5B37   025C
        SUBI    #$0002, R1                      ; 5B38   0339 0002
        ANDI    #$000F, R4                      ; 5B3A   03BC 000F
        ADDI    #$034B, R4                      ; 5B3C   02FC 034B
        SUB@    R4,     R0                      ; 5B3E   0320
        ADDI    #$000B, R3                      ; 5B3F   02FB 000B
        CMPR    R3,     R2                      ; 5B41   015A
        BNEQ    L_5B34                          ; 5B42   022C 000F

L_5B44:
        MVI@    R5,     R3                      ; 5B44   02AB
        TSTR    R3                              ; 5B45   009B
        BEQ     L_5B5A                          ; 5B46   0204 0012

        SUBI    #$0001, R3                      ; 5B48   033B 0001
L_5B4A:
        MVI@    R3,     R4                      ; 5B4A   029C
        XORI    #$0040, R4                      ; 5B4B   03FC 0040
        MVO@    R4,     R3                      ; 5B4D   025C
        SUBI    #$0002, R1                      ; 5B4E   0339 0002
        ANDI    #$000F, R4                      ; 5B50   03BC 000F
        ADDI    #$034B, R4                      ; 5B52   02FC 034B
        SUB@    R4,     R0                      ; 5B54   0320
        SUBI    #$0001, R3                      ; 5B55   033B 0001
        CMPR    R3,     R2                      ; 5B57   015A
        BNEQ    L_5B4A                          ; 5B58   022C 000F

L_5B5A:
        MVI@    R5,     R3                      ; 5B5A   02AB
        TSTR    R3                              ; 5B5B   009B
        BEQ     L_5B70                          ; 5B5C   0204 0012

        SUBI    #$000D, R3                      ; 5B5E   033B 000D
L_5B60:
        MVI@    R3,     R4                      ; 5B60   029C
        XORI    #$0040, R4                      ; 5B61   03FC 0040
        MVO@    R4,     R3                      ; 5B63   025C
        SUBI    #$0002, R1                      ; 5B64   0339 0002
        ANDI    #$000F, R4                      ; 5B66   03BC 000F
        ADDI    #$034B, R4                      ; 5B68   02FC 034B
        SUB@    R4,     R0                      ; 5B6A   0320
        SUBI    #$000D, R3                      ; 5B6B   033B 000D
        CMPR    R3,     R2                      ; 5B6D   015A
        BNEQ    L_5B60                          ; 5B6E   022C 000F

L_5B70:
        MVI@    R5,     R3                      ; 5B70   02AB
        TSTR    R3                              ; 5B71   009B
        BEQ     L_5B86                          ; 5B72   0204 0012

        SUBI    #$000C, R3                      ; 5B74   033B 000C
L_5B76:
        MVI@    R3,     R4                      ; 5B76   029C
        XORI    #$0040, R4                      ; 5B77   03FC 0040
        MVO@    R4,     R3                      ; 5B79   025C
        SUBI    #$0002, R1                      ; 5B7A   0339 0002
        ANDI    #$000F, R4                      ; 5B7C   03BC 000F
        ADDI    #$034B, R4                      ; 5B7E   02FC 034B
        SUB@    R4,     R0                      ; 5B80   0320
        SUBI    #$000C, R3                      ; 5B81   033B 000C
        CMPR    R3,     R2                      ; 5B83   015A
        BNEQ    L_5B76                          ; 5B84   022C 000F

L_5B86:
        MVI@    R5,     R3                      ; 5B86   02AB
        TSTR    R3                              ; 5B87   009B
        BEQ     L_5B9C                          ; 5B88   0204 0012

        SUBI    #$000B, R3                      ; 5B8A   033B 000B
L_5B8C:
        MVI@    R3,     R4                      ; 5B8C   029C
        XORI    #$0040, R4                      ; 5B8D   03FC 0040
        MVO@    R4,     R3                      ; 5B8F   025C
        SUBI    #$0002, R1                      ; 5B90   0339 0002
        ANDI    #$000F, R4                      ; 5B92   03BC 000F
        ADDI    #$034B, R4                      ; 5B94   02FC 034B
        SUB@    R4,     R0                      ; 5B96   0320
        SUBI    #$000B, R3                      ; 5B97   033B 000B
        CMPR    R3,     R2                      ; 5B99   015A
        BNEQ    L_5B8C                          ; 5B9A   022C 000F

L_5B9C:
        MVI@    R2,     R4                      ; 5B9C   0294
        ANDI    #$008F, R4                      ; 5B9D   03BC 008F
        MVO@    R4,     R2                      ; 5B9F   0254
        DECR    R1                              ; 5BA0   0011
        SLL     R0,     1                       ; 5BA1   0048
        ANDI    #$000F, R4                      ; 5BA2   03BC 000F
        ADDI    #$034B, R4                      ; 5BA4   02FC 034B
        SUB@    R4,     R0                      ; 5BA6   0320
        SAR     R0,     1                       ; 5BA7   0068
        MVI     .BTAB.64,R4                     ; 5BA8   0284 0264
        DECR    R4                              ; 5BAA   0014
        MVO     R4,     .BTAB.64                ; 5BAB   0244 0264
        MVO     R2,     .BTAB.A0                ; 5BAD   0242 02A0
        SUBI    #$0009, R5                      ; 5BAF   033D 0009
        MVO     R5,     G_034A                  ; 5BB1   0245 034A
        MVO     R1,     .BTAB.3C                ; 5BB3   0241 023C
        MVO     R0,     .BTAB.28                ; 5BB5   0240 0228
        SUBI    #$015D, R2                      ; 5BB7   033A 015D
        MVII    #$0358, R3                      ; 5BB9   02BB 0358
        ADD     G_01EF, R3                      ; 5BBB   02C3 01EF
        MVI@    R3,     R0                      ; 5BBD   0298
        NEGR    R0                              ; 5BBE   0020
        DECR    R3                              ; 5BBF   0013
        CMP@    R3,     R0                      ; 5BC0   0358
        BLE     L_5C22                          ; 5BC1   0206 005F

        MVO@    R0,     R3                      ; 5BC3   0258
        DECR    R3                              ; 5BC4   0013
        NEGR    R0                              ; 5BC5   0020
        CMP@    R3,     R0                      ; 5BC6   0358
        BGT     L_5BD0                          ; 5BC7   020E 0007

        SDBD                                    ; 5BC9   0001
        ADDI    #$FDAF, R3                      ; 5BCA   02FB 00AF 00FD
        MVO@    R2,     R3                      ; 5BCD   025A
        B       L_5AD2                          ; 5BCE   0220 00FD

L_5BD0:
        MVI     G_01EF, R0                      ; 5BD0   0280 01EF
        SLL     R0,     1                       ; 5BD2   0048
        ADDR    R0,     R7                      ; 5BD3   00C7
        B       L_5BE4                          ; 5BD4   0200 000E
        B       L_5BF8                          ; 5BD6   0200 0020
        B       L_5C05                          ; 5BD8   0200 002B
        B       L_5C10                          ; 5BDA   0200 0034
        B       L_5C19                          ; 5BDC   0200 003B
        B       L_5C20                          ; 5BDE   0200 0040
        B       L_5C22                          ; 5BE0   0200 0040
        B       L_5C22                          ; 5BE2   0200 003E

L_5BE4:
        MVII    #$0117, R5                      ; 5BE4   02BD 0117
        MVI@    R5,     R0                      ; 5BE6   02A8
        MVI@    R5,     R1                      ; 5BE7   02A9
        MVI@    R5,     R3                      ; 5BE8   02AB
        MVI@    R5,     R4                      ; 5BE9   02AC
        INCR    R5                              ; 5BEA   000D
        MVO@    R2,     R5                      ; 5BEB   026A
        MVO@    R0,     R5                      ; 5BEC   0268
        MVO@    R1,     R5                      ; 5BED   0269
        MVO@    R3,     R5                      ; 5BEE   026B
        MVO@    R4,     R5                      ; 5BEF   026C
        SUBI    #$0006, R5                      ; 5BF0   033D 0006
        MVI@    R5,     R0                      ; 5BF2   02A8
        ADDI    #$0005, R5                      ; 5BF3   02FD 0005
        MVO@    R0,     R5                      ; 5BF5   0268
        B       L_5C22                          ; 5BF6   0200 002A

L_5BF8:
        MVII    #$0113, R5                      ; 5BF8   02BD 0113
        MVI@    R5,     R0                      ; 5BFA   02A8
        MVI@    R5,     R1                      ; 5BFB   02A9
        MVI@    R5,     R3                      ; 5BFC   02AB
        MVI@    R5,     R4                      ; 5BFD   02AC
        MVO@    R2,     R5                      ; 5BFE   026A
        MVO@    R0,     R5                      ; 5BFF   0268
        MVO@    R1,     R5                      ; 5C00   0269
        MVO@    R3,     R5                      ; 5C01   026B
        MVO@    R4,     R5                      ; 5C02   026C
        B       L_5C22                          ; 5C03   0200 001D

L_5C05:
        MVII    #$0110, R5                      ; 5C05   02BD 0110
        MVI@    R5,     R0                      ; 5C07   02A8
        MVI@    R5,     R1                      ; 5C08   02A9
        MVI@    R5,     R3                      ; 5C09   02AB
        MVO@    R2,     R5                      ; 5C0A   026A
        MVO@    R0,     R5                      ; 5C0B   0268
        MVO@    R1,     R5                      ; 5C0C   0269
        MVO@    R3,     R5                      ; 5C0D   026B
        B       L_5C22                          ; 5C0E   0200 0012

L_5C10:
        MVII    #$010E, R5                      ; 5C10   02BD 010E
        MVI@    R5,     R0                      ; 5C12   02A8
        MVI@    R5,     R1                      ; 5C13   02A9
        MVO@    R2,     R5                      ; 5C14   026A
        MVO@    R0,     R5                      ; 5C15   0268
        MVO@    R1,     R5                      ; 5C16   0269
        B       L_5C22                          ; 5C17   0200 0009

L_5C19:
        MVII    #$010D, R5                      ; 5C19   02BD 010D
        MVI@    R5,     R0                      ; 5C1B   02A8
        MVO@    R2,     R5                      ; 5C1C   026A
        MVO@    R0,     R5                      ; 5C1D   0268
        B       L_5C22                          ; 5C1E   0200 0002

L_5C20:
        MVO     R2,     G_010D                  ; 5C20   0242 010D
L_5C22:
        MVI     .BTAB.78,R1                     ; 5C22   0281 0278
        MVII    #$0105, R4                      ; 5C24   02BC 0105
        ADD     G_01EF, R4                      ; 5C26   02C4 01EF
        CMP@    R4,     R2                      ; 5C28   0362
        BEQ     L_5A12                          ; 5C29   0224 0218

        ADDI    #$015E, R2                      ; 5C2B   02FA 015E
        CMP     .BTAB.14,R2                     ; 5C2D   0342 0214
        BNEQ    L_5A14                          ; 5C2F   022C 021C
        B       L_5AD2                          ; 5C31   0220 0160
L_5C33:
        J       L_56DA                          ; 5C33   0004 0354 02DA

L_5C36:
        MVI     G_034A, R5                      ; 5C36   0285 034A
        SUBI    #$0009, R5                      ; 5C38   033D 0009
        MVI@    R5,     R0                      ; 5C3A   02A8
        TSTR    R0                              ; 5C3B   0080
        BEQ     L_5C49                          ; 5C3C   0204 000B

        ADDI    #$0008, R5                      ; 5C3E   02FD 0008
        MVO@    R4,     R5                      ; 5C40   026C
        ADDI    #$0008, R5                      ; 5C41   02FD 0008
        MVI     .BTAB.3C,R1                     ; 5C43   0281 023C
        MVI     .BTAB.28,R0                     ; 5C45   0280 0228
        B       L_5932                          ; 5C47   0220 0316

L_5C49:
        MVI     .BTAB.3C,R3                     ; 5C49   0283 023C
        SDBD                                    ; 5C4B   0001
        MVII    #$4000, R2                      ; 5C4C   02BA 0000 0040
        TSTR    R3                              ; 5C4F   009B
        BGE     L_5C53                          ; 5C50   020D 0001

        NEGR    R2                              ; 5C52   0022
L_5C53:
        ADDR    R2,     R3                      ; 5C53   00D3
        MVII    #$0357, R2                      ; 5C54   02BA 0357
        ADD     G_01EF, R2                      ; 5C56   02C2 01EF
        CMP@    R2,     R3                      ; 5C58   0353
        BLE     L_5AD2                          ; 5C59   0226 0188

        MVO@    R3,     R2                      ; 5C5B   0253
        B       L_5AD2                          ; 5C5C   0220 018B

L_5C5E:
        PSHR    R5                              ; 5C5E   0275
        MVII    #$02DE, R4                      ; 5C5F   02BC 02DE
        SDBD                                    ; 5C61   0001
        MVII    #$2200, R3                      ; 5C62   02BB 0000 0022

        JSR     R5,     X_PRINT_R1              ; 5C65   0004 0118 0067

        PULR    R7                              ; 5C68   02B7

L_5C69:
        PSHR    R5                              ; 5C69   0275
        SDBD                                    ; 5C6A   0001
        MVII    #$5D13, R1                      ; 5C6B   02B9 0013 005D

        JSR     R5,     L_5C5E                  ; 5C6E   0004 015C 005E

        MVI     .BTAB.8C,R3                     ; 5C71   0283 028C
        CMPI    #$0064, R3                      ; 5C73   037B 0064
        BNEQ    L_5C89                          ; 5C75   020C 0012

        MVI     .BTAB.CC,R0                     ; 5C77   0280 02CC
        SUBI    #$0008, R0                      ; 5C79   0338 0008
        MVII    #$02E0, R4                      ; 5C7B   02BC 02E0
        MVO@    R0,     R4                      ; 5C7D   0260
        SUBI    #$0008, R0                      ; 5C7E   0338 0008
        MVII    #$000A, R3                      ; 5C80   02BB 000A
L_5C82:
        MVO@    R0,     R4                      ; 5C82   0260
        DECR    R3                              ; 5C83   0013
        BNEQ    L_5C82                          ; 5C84   022C 0003

        SUBI    #$0008, R0                      ; 5C86   0338 0008
        MVO@    R0,     R4                      ; 5C88   0260
L_5C89:
        PULR    R7                              ; 5C89   02B7

        DECLE   $0020,  $0020,  $0042,  $004F   ; 5C8A   0020 0020 0042 004F
        DECLE   $0041,  $0052,  $0044,  $0020   ; 5C8E   0041 0052 0044 0020
        DECLE   $0053,  $0049,  $005A,  $0045   ; 5C92   0053 0049 005A 0045
        DECLE   $003F,  $0000,  $0031,  $0020   ; 5C96   003F 0000 0031 0020
        DECLE   $004F,  $0052,  $0020,  $0032   ; 5C9A   004F 0052 0020 0032
        DECLE   $0020,  $0050,  $004C,  $0041   ; 5C9E   0020 0050 004C 0041
        DECLE   $0059,  $0045,  $0052,  $0053   ; 5CA2   0059 0045 0052 0053
        DECLE   $003F,  $0000,  $0020,  $0020   ; 5CA6   003F 0000 0020 0020
        DECLE   $0053,  $004B,  $0049,  $004C   ; 5CAA   0053 004B 0049 004C
        DECLE   $004C,  $0020,  $004C,  $0045   ; 5CAE   004C 0020 004C 0045
        DECLE   $0056,  $0045,  $004C,  $003F   ; 5CB2   0056 0045 004C 003F
        DECLE   $0020,  $0000,  $0020,  $0020   ; 5CB6   0020 0000 0020 0020
        DECLE   $0049,  $004C,  $004C,  $0045   ; 5CBA   0049 004C 004C 0045
        DECLE   $0047,  $0041,  $004C,  $0020   ; 5CBE   0047 0041 004C 0020
        DECLE   $004D,  $004F,  $0056,  $0045   ; 5CC2   004D 004F 0056 0045
        DECLE   $0000,  $0020,  $0020,  $0049   ; 5CC6   0000 0020 0020 0049
        DECLE   $0020,  $004D,  $0055,  $0053   ; 5CCA   0020 004D 0055 0053
        DECLE   $0054,  $0020,  $0050,  $0041   ; 5CCE   0054 0020 0050 0041
        DECLE   $0053,  $0053,  $0000,  $0020   ; 5CD2   0053 0053 0000 0020
        DECLE   $0059,  $004F,  $0055,  $0020   ; 5CD6   0059 004F 0055 0020
        DECLE   $004D,  $0055,  $0053,  $0054   ; 5CDA   004D 0055 0053 0054
        DECLE   $0020,  $0050,  $0041,  $0053   ; 5CDE   0020 0050 0041 0053
        DECLE   $0053,  $0000,  $0042,  $004C   ; 5CE2   0053 0000 0042 004C
        DECLE   $0041,  $0043,  $004B,  $0020   ; 5CE6   0041 0043 004B 0020
        DECLE   $004D,  $0055,  $0053,  $0054   ; 5CEA   004D 0055 0053 0054
        DECLE   $0020,  $0050,  $0041,  $0053   ; 5CEE   0020 0050 0041 0053
        DECLE   $0053,  $0000,  $0057,  $0048   ; 5CF2   0053 0000 0057 0048
        DECLE   $0049,  $0054,  $0045,  $0020   ; 5CF6   0049 0054 0045 0020
        DECLE   $004D,  $0055,  $0053,  $0054   ; 5CFA   004D 0055 0053 0054
        DECLE   $0020,  $0050,  $0041,  $0053   ; 5CFE   0020 0050 0041 0053
        DECLE   $0053,  $0000,  $0020,  $0020   ; 5D02   0053 0000 0020 0020
        DECLE   $0045,  $004E,  $0044,  $0020   ; 5D06   0045 004E 0044 0020
        DECLE   $004F,  $0046,  $0020,  $0047   ; 5D0A   004F 0046 0020 0047
        DECLE   $0041,  $004D,  $0045,  $0021   ; 5D0E   0041 004D 0045 0021
        DECLE   $0000,  $0020,  $0020,  $0020   ; 5D12   0000 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5D16   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5D1A   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5D1E   0020 0020 0020 0020
        DECLE   $0000                           ; 5D22   0000
.GFX_LIST_5D23:
        DECLE   $0000,  $0018,  $003C,  $007E   ; 5D23  CART PIC #00
        DECLE   $007E,  $003C,  $0018,  $0000   ; 5D27  
        DECLE   $007E,  $00C3,  $0081,  $0081   ; 5D2B   007E 00C3 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 5D2F   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 5D33   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $00C3,  $007E   ; 5D37   0081 0081 00C3 007E
.GRAM_INIT_5D3B:
        DECLE   $0009           ; 5D3B  # of GRAM cards to init
        DECLE   $0000           ; 5D3C  #00   :  CART #00    ----
        DECLE   $0267,  $03FC   ; 5D3D  #01   :  4x4 tile
        DECLE   $00A3,  $0070   ; 5D3F  #02-02:  GROM #11-11 --I-
        DECLE   $0203,  $0040   ; 5D41  #03-03:  GRAM #01-01 X---
        DECLE   $00CB,  $0050   ; 5D43  #04-04:  GROM #25-25 --I-
        DECLE   $0107,  $0040   ; 5D45  #05-05:  GRAM #03-03 -Y--
        DECLE   $00A1,  $0070   ; 5D47  #06-06:  GROM #10-10 --I-
        DECLE   $020B,  $0040   ; 5D49  #07-07:  GRAM #05-05 X---
        DECLE   $00C9,  $0050   ; 5D4B  #08-08:  GROM #24-24 --I-

        DECLE   $0080,  $004C,  $000C,  $00C0   ; 5D4D   0080 004C 000C 00C0
        DECLE   $0004,  $0048,  $0085,  $0003   ; 5D51   0004 0048 0085 0003
        DECLE   $0009,  $0007,  $0011,  $000E   ; 5D55   0009 0007 0011 000E
        DECLE   $00FF,  $00FF,  $00F3,  $00FF   ; 5D59   00FF 00FF 00F3 00FF
        DECLE   $00F4,  $00FF,  $00F5,  $00FF   ; 5D5D   00F4 00FF 00F5 00FF
        DECLE   $0001,  $0000,  $000D,  $0000   ; 5D61   0001 0000 000D 0000
        DECLE   $000C,  $0000,  $000B,  $0000   ; 5D65   000C 0000 000B 0000
        DECLE   $0000,  $0000,  $00FE,  $00FF   ; 5D69   0000 0000 00FE 00FF
        DECLE   $0002,  $0000,  $0008,  $0000   ; 5D6D   0002 0000 0008 0000
        DECLE   $0000,  $0001,  $0026,  $0010   ; 5D71   0000 0001 0026 0010
        DECLE   $0080,  $00FF,  $0060,  $00FF   ; 5D75   0080 00FF 0060 00FF
        DECLE   $0000,  $00F8,  $0020,  $0000   ; 5D79   0000 00F8 0020 0000
        DECLE   $00F8,  $00FF,  $00F0,  $00FF   ; 5D7D   00F8 00FF 00F0 00FF
        DECLE   $0003,  $0181,  $0000,  $0000   ; 5D81   0003 0181 0000 0000
        DECLE   $0000,  $0084,  $0086,  $0083   ; 5D85   0000 0084 0086 0083
        DECLE   $0000,  $0000,  $0000           ; 5D89   0000 0000 0000

        MOVR    R0,     R6                      ; 5D8C   0086
        MOVR    R0,     R7                      ; 5D8D   0087

        DECLE   $0085,  $0000,  $0000,  $0000   ; 5D8E   0085 0000 0000 0000
        DECLE   $0083,  $0085,  $0082,  $0184   ; 5D92   0083 0085 0082 0184
        DECLE   $0004,  $0175,  $0000,  $0000   ; 5D96   0004 0175 0000 0000
        DECLE   $0084,  $0086,  $0083,  $0088   ; 5D9A   0084 0086 0083 0088
        DECLE   $0000,  $0000                   ; 5D9E   0000 0000

        MOVR    R0,     R6                      ; 5DA0   0086
        MOVR    R0,     R7                      ; 5DA1   0087

        DECLE   $0085,  $0085,  $0000,  $0000   ; 5DA2   0085 0085 0000 0000
        DECLE   $0083,  $0085,  $0082,  $0081   ; 5DA6   0083 0085 0082 0081
        DECLE   $0000,  $0000,  $0088,  $0085   ; 5DAA   0000 0000 0088 0085
        DECLE   $0081,  $0081,  $0177,  $0005   ; 5DAE   0081 0081 0177 0005
        DECLE   $0169,  $0000,  $0084,  $0086   ; 5DB2   0169 0000 0084 0086
        DECLE   $0083,  $008A,  $0088,  $0000   ; 5DB6   0083 008A 0088 0000

        MOVR    R0,     R6                      ; 5DBA   0086
        MOVR    R0,     R7                      ; 5DBB   0087

        DECLE   $0085,  $0085,  $0085,  $0000   ; 5DBC   0085 0085 0085 0000
        DECLE   $0083,  $0085,  $0082,  $0081   ; 5DC0   0083 0085 0082 0081
        DECLE   $0081,  $0000,  $008A,  $0085   ; 5DC4   0081 0000 008A 0085
        DECLE   $0081,  $0089,  $0080,  $0000   ; 5DC8   0081 0089 0080 0000

        MOVR    R1,     R0                      ; 5DCC   0088
        MOVR    R0,     R5                      ; 5DCD   0085
        MOVR    R0,     R1                      ; 5DCE   0081
        TSTR    R0                              ; 5DCF   0080
        MOVR    R0,     R1                      ; 5DD0   0081
        CMPR    R5,     R2                      ; 5DD1   016A
L_5DD2:
        MVI     .BTAB.64,R3                     ; 5DD2   0283 0264
        CMP     .BTAB.8C,R3                     ; 5DD4   0343 028C
        BPL     L_5FEE                          ; 5DD6   0203 0216

        MVI     .BTAB.14,R4                     ; 5DD8   0284 0214
        MVI     .BTAB.00,R2                     ; 5DDA   0282 0200
        CLRR    R3                              ; 5DDC   01DB
L_5DDD:
        MVI@    R2,     R1                      ; 5DDD   0291
        RSWD    R1                              ; 5DDE   0039
        BESC    L_5FDE                          ; 5DDF   020F 01FD

        ANDI    #$000F, R1                      ; 5DE1   03B9 000F
        ADDI    #$034B, R1                      ; 5DE3   02F9 034B
        MVI@    R1,     R1                      ; 5DE5   0289
        TSTR    R1                              ; 5DE6   0089
        BMI     L_5FDE                          ; 5DE7   020B 01F5

        MOVR    R2,     R1                      ; 5DE9   0091
        SUBI    #$0001, R1                      ; 5DEA   0339 0001
        MVI@    R1,     R0                      ; 5DEC   0288
        RSWD    R0                              ; 5DED   0038
        BNC     L_5E06                          ; 5DEE   0209 0016
        BEQ     L_5DFC                          ; 5DF0   0204 000A

L_5DF2:
        SUBI    #$0001, R1                      ; 5DF2   0339 0001
        MVI@    R1,     R0                      ; 5DF4   0288
        RSWD    R0                              ; 5DF5   0038
        BNC     L_5E06                          ; 5DF6   0209 000E
        BNEQ    L_5DF2                          ; 5DF8   022C 0007
        B       L_5F56                          ; 5DFA   0200 015A

L_5DFC:
        SUBI    #$0001, R1                      ; 5DFC   0339 0001
        MVI@    R1,     R0                      ; 5DFE   0288
        RSWD    R0                              ; 5DFF   0038
        BNC     L_5E06                          ; 5E00   0209 0004
        BEQ     L_5DFC                          ; 5E02   0224 0007
        B       L_5ED1                          ; 5E04   0200 00CB

L_5E06:
        MOVR    R2,     R1                      ; 5E06   0091
        SUBI    #$000D, R1                      ; 5E07   0339 000D
        MVI@    R1,     R0                      ; 5E09   0288
        RSWD    R0                              ; 5E0A   0038
        BNC     L_5E23                          ; 5E0B   0209 0016
        BEQ     L_5E19                          ; 5E0D   0204 000A

L_5E0F:
        SUBI    #$000D, R1                      ; 5E0F   0339 000D
        MVI@    R1,     R0                      ; 5E11   0288
        RSWD    R0                              ; 5E12   0038
        BNC     L_5E23                          ; 5E13   0209 000E
        BNEQ    L_5E0F                          ; 5E15   022C 0007
        B       L_5F69                          ; 5E17   0200 0150

L_5E19:
        SUBI    #$000D, R1                      ; 5E19   0339 000D
        MVI@    R1,     R0                      ; 5E1B   0288
        RSWD    R0                              ; 5E1C   0038
        BNC     L_5E23                          ; 5E1D   0209 0004
        BEQ     L_5E19                          ; 5E1F   0224 0007
        B       L_5EE4                          ; 5E21   0200 00C1

L_5E23:
        MOVR    R2,     R1                      ; 5E23   0091
        SUBI    #$000C, R1                      ; 5E24   0339 000C
        MVI@    R1,     R0                      ; 5E26   0288
        RSWD    R0                              ; 5E27   0038
        BNC     L_5E40                          ; 5E28   0209 0016
        BEQ     L_5E36                          ; 5E2A   0204 000A

L_5E2C:
        SUBI    #$000C, R1                      ; 5E2C   0339 000C
        MVI@    R1,     R0                      ; 5E2E   0288
        RSWD    R0                              ; 5E2F   0038
        BNC     L_5E40                          ; 5E30   0209 000E
        BNEQ    L_5E2C                          ; 5E32   022C 0007
        B       L_5F7C                          ; 5E34   0200 0146

L_5E36:
        SUBI    #$000C, R1                      ; 5E36   0339 000C
        MVI@    R1,     R0                      ; 5E38   0288
        RSWD    R0                              ; 5E39   0038
        BNC     L_5E40                          ; 5E3A   0209 0004
        BEQ     L_5E36                          ; 5E3C   0224 0007
        B       L_5EF7                          ; 5E3E   0200 00B7

L_5E40:
        MOVR    R2,     R1                      ; 5E40   0091
        SUBI    #$000B, R1                      ; 5E41   0339 000B
        MVI@    R1,     R0                      ; 5E43   0288
        RSWD    R0                              ; 5E44   0038
        BNC     L_5E5D                          ; 5E45   0209 0016
        BEQ     L_5E53                          ; 5E47   0204 000A

L_5E49:
        SUBI    #$000B, R1                      ; 5E49   0339 000B
        MVI@    R1,     R0                      ; 5E4B   0288
        RSWD    R0                              ; 5E4C   0038
        BNC     L_5E5D                          ; 5E4D   0209 000E
        BNEQ    L_5E49                          ; 5E4F   022C 0007
        B       L_5F8F                          ; 5E51   0200 013C

L_5E53:
        SUBI    #$000B, R1                      ; 5E53   0339 000B
        MVI@    R1,     R0                      ; 5E55   0288
        RSWD    R0                              ; 5E56   0038
        BNC     L_5E5D                          ; 5E57   0209 0004
        BEQ     L_5E53                          ; 5E59   0224 0007
        B       L_5F0A                          ; 5E5B   0200 00AD

L_5E5D:
        MOVR    R2,     R1                      ; 5E5D   0091
        ADDI    #$0001, R1                      ; 5E5E   02F9 0001
        MVI@    R1,     R0                      ; 5E60   0288
        RSWD    R0                              ; 5E61   0038
        BNC     L_5E7A                          ; 5E62   0209 0016
        BEQ     L_5E70                          ; 5E64   0204 000A

L_5E66:
        ADDI    #$0001, R1                      ; 5E66   02F9 0001
        MVI@    R1,     R0                      ; 5E68   0288
        RSWD    R0                              ; 5E69   0038
        BNC     L_5E7A                          ; 5E6A   0209 000E
        BNEQ    L_5E66                          ; 5E6C   022C 0007
        B       L_5FA2                          ; 5E6E   0200 0132

L_5E70:
        ADDI    #$0001, R1                      ; 5E70   02F9 0001
        MVI@    R1,     R0                      ; 5E72   0288
        RSWD    R0                              ; 5E73   0038
        BNC     L_5E7A                          ; 5E74   0209 0004
        BEQ     L_5E70                          ; 5E76   0224 0007
        B       L_5F1D                          ; 5E78   0200 00A3

L_5E7A:
        MOVR    R2,     R1                      ; 5E7A   0091
        ADDI    #$000D, R1                      ; 5E7B   02F9 000D
        MVI@    R1,     R0                      ; 5E7D   0288
        RSWD    R0                              ; 5E7E   0038
        BNC     L_5E97                          ; 5E7F   0209 0016
        BEQ     L_5E8D                          ; 5E81   0204 000A

L_5E83:
        ADDI    #$000D, R1                      ; 5E83   02F9 000D
        MVI@    R1,     R0                      ; 5E85   0288
        RSWD    R0                              ; 5E86   0038
        BNC     L_5E97                          ; 5E87   0209 000E
        BNEQ    L_5E83                          ; 5E89   022C 0007
        B       L_5FB5                          ; 5E8B   0200 0128

L_5E8D:
        ADDI    #$000D, R1                      ; 5E8D   02F9 000D
        MVI@    R1,     R0                      ; 5E8F   0288
        RSWD    R0                              ; 5E90   0038
        BNC     L_5E97                          ; 5E91   0209 0004
        BEQ     L_5E8D                          ; 5E93   0224 0007
        B       L_5F30                          ; 5E95   0200 0099

L_5E97:
        MOVR    R2,     R1                      ; 5E97   0091
        ADDI    #$000C, R1                      ; 5E98   02F9 000C
        MVI@    R1,     R0                      ; 5E9A   0288
        RSWD    R0                              ; 5E9B   0038
        BNC     L_5EB4                          ; 5E9C   0209 0016
        BEQ     L_5EAA                          ; 5E9E   0204 000A

L_5EA0:
        ADDI    #$000C, R1                      ; 5EA0   02F9 000C
        MVI@    R1,     R0                      ; 5EA2   0288
        RSWD    R0                              ; 5EA3   0038
        BNC     L_5EB4                          ; 5EA4   0209 000E
        BNEQ    L_5EA0                          ; 5EA6   022C 0007
        B       L_5FC8                          ; 5EA8   0200 011E

L_5EAA:
        ADDI    #$000C, R1                      ; 5EAA   02F9 000C
        MVI@    R1,     R0                      ; 5EAC   0288
        RSWD    R0                              ; 5EAD   0038
        BNC     L_5EB4                          ; 5EAE   0209 0004
        BEQ     L_5EAA                          ; 5EB0   0224 0007
        B       L_5F43                          ; 5EB2   0200 008F

L_5EB4:
        MOVR    R2,     R1                      ; 5EB4   0091
        ADDI    #$000B, R1                      ; 5EB5   02F9 000B
        MVI@    R1,     R0                      ; 5EB7   0288
        RSWD    R0                              ; 5EB8   0038
        BNC     L_5FDE                          ; 5EB9   0209 0123
        BEQ     L_5EC7                          ; 5EBB   0204 000A

L_5EBD:
        ADDI    #$000B, R1                      ; 5EBD   02F9 000B
        MVI@    R1,     R0                      ; 5EBF   0288
        RSWD    R0                              ; 5EC0   0038
        BNC     L_5FDE                          ; 5EC1   0209 011B
        BNEQ    L_5EBD                          ; 5EC3   022C 0007
        B       L_5FDD                          ; 5EC5   0200 0116

L_5EC7:
        ADDI    #$000B, R1                      ; 5EC7   02F9 000B
        MVI@    R1,     R0                      ; 5EC9   0288
        RSWD    R0                              ; 5ECA   0038
        BNC     L_5FDE                          ; 5ECB   0209 0111
        BEQ     L_5EC7                          ; 5ECD   0224 0007
        B       L_5FDB                          ; 5ECF   0200 010A

L_5ED1:
        MOVR    R2,     R1                      ; 5ED1   0091
        SUBI    #$000D, R1                      ; 5ED2   0339 000D
        MVI@    R1,     R0                      ; 5ED4   0288
        RSWD    R0                              ; 5ED5   0038
        BNC     L_5EE4                          ; 5ED6   0209 000C
        BEQ     L_5EE4                          ; 5ED8   0204 000A

L_5EDA:
        SUBI    #$000D, R1                      ; 5EDA   0339 000D
        MVI@    R1,     R0                      ; 5EDC   0288
        RSWD    R0                              ; 5EDD   0038
        BNC     L_5EE4                          ; 5EDE   0209 0004
        BNEQ    L_5EDA                          ; 5EE0   022C 0007
        B       L_5FDE                          ; 5EE2   0200 00FA

L_5EE4:
        MOVR    R2,     R1                      ; 5EE4   0091
        SUBI    #$000C, R1                      ; 5EE5   0339 000C
        MVI@    R1,     R0                      ; 5EE7   0288
        RSWD    R0                              ; 5EE8   0038
        BNC     L_5EF7                          ; 5EE9   0209 000C
        BEQ     L_5EF7                          ; 5EEB   0204 000A

L_5EED:
        SUBI    #$000C, R1                      ; 5EED   0339 000C
        MVI@    R1,     R0                      ; 5EEF   0288
        RSWD    R0                              ; 5EF0   0038
        BNC     L_5EF7                          ; 5EF1   0209 0004
        BNEQ    L_5EED                          ; 5EF3   022C 0007
        B       L_5FDE                          ; 5EF5   0200 00E7

L_5EF7:
        MOVR    R2,     R1                      ; 5EF7   0091
        SUBI    #$000B, R1                      ; 5EF8   0339 000B
        MVI@    R1,     R0                      ; 5EFA   0288
        RSWD    R0                              ; 5EFB   0038
        BNC     L_5F0A                          ; 5EFC   0209 000C
        BEQ     L_5F0A                          ; 5EFE   0204 000A

L_5F00:
        SUBI    #$000B, R1                      ; 5F00   0339 000B
        MVI@    R1,     R0                      ; 5F02   0288
        RSWD    R0                              ; 5F03   0038
        BNC     L_5F0A                          ; 5F04   0209 0004
        BNEQ    L_5F00                          ; 5F06   022C 0007
        B       L_5FDE                          ; 5F08   0200 00D4

L_5F0A:
        MOVR    R2,     R1                      ; 5F0A   0091
        ADDI    #$0001, R1                      ; 5F0B   02F9 0001
        MVI@    R1,     R0                      ; 5F0D   0288
        RSWD    R0                              ; 5F0E   0038
        BNC     L_5F1D                          ; 5F0F   0209 000C
        BEQ     L_5F1D                          ; 5F11   0204 000A

L_5F13:
        ADDI    #$0001, R1                      ; 5F13   02F9 0001
        MVI@    R1,     R0                      ; 5F15   0288
        RSWD    R0                              ; 5F16   0038
        BNC     L_5F1D                          ; 5F17   0209 0004
        BNEQ    L_5F13                          ; 5F19   022C 0007
        B       L_5FDE                          ; 5F1B   0200 00C1

L_5F1D:
        MOVR    R2,     R1                      ; 5F1D   0091
        ADDI    #$000D, R1                      ; 5F1E   02F9 000D
        MVI@    R1,     R0                      ; 5F20   0288
        RSWD    R0                              ; 5F21   0038
        BNC     L_5F30                          ; 5F22   0209 000C
        BEQ     L_5F30                          ; 5F24   0204 000A

L_5F26:
        ADDI    #$000D, R1                      ; 5F26   02F9 000D
        MVI@    R1,     R0                      ; 5F28   0288
        RSWD    R0                              ; 5F29   0038
        BNC     L_5F30                          ; 5F2A   0209 0004
        BNEQ    L_5F26                          ; 5F2C   022C 0007
        B       L_5FDE                          ; 5F2E   0200 00AE

L_5F30:
        MOVR    R2,     R1                      ; 5F30   0091
        ADDI    #$000C, R1                      ; 5F31   02F9 000C
        MVI@    R1,     R0                      ; 5F33   0288
        RSWD    R0                              ; 5F34   0038
        BNC     L_5F43                          ; 5F35   0209 000C
        BEQ     L_5F43                          ; 5F37   0204 000A

L_5F39:
        ADDI    #$000C, R1                      ; 5F39   02F9 000C
        MVI@    R1,     R0                      ; 5F3B   0288
        RSWD    R0                              ; 5F3C   0038
        BNC     L_5F43                          ; 5F3D   0209 0004
        BNEQ    L_5F39                          ; 5F3F   022C 0007
        B       L_5FDE                          ; 5F41   0200 009B

L_5F43:
        MOVR    R2,     R1                      ; 5F43   0091
        ADDI    #$000B, R1                      ; 5F44   02F9 000B
        MVI@    R1,     R0                      ; 5F46   0288
        RSWD    R0                              ; 5F47   0038
        BNC     L_5FDB                          ; 5F48   0209 0091
        BEQ     L_5FDB                          ; 5F4A   0204 008F

L_5F4C:
        ADDI    #$000B, R1                      ; 5F4C   02F9 000B
        MVI@    R1,     R0                      ; 5F4E   0288
        RSWD    R0                              ; 5F4F   0038
        BNC     L_5FDB                          ; 5F50   0209 0089
        BNEQ    L_5F4C                          ; 5F52   022C 0007
        B       L_5FDE                          ; 5F54   0200 0088

L_5F56:
        MOVR    R2,     R1                      ; 5F56   0091
        SUBI    #$000D, R1                      ; 5F57   0339 000D
        MVI@    R1,     R0                      ; 5F59   0288
        RSWD    R0                              ; 5F5A   0038
        BNC     L_5F69                          ; 5F5B   0209 000C
        BNEQ    L_5F69                          ; 5F5D   020C 000A

L_5F5F:
        SUBI    #$000D, R1                      ; 5F5F   0339 000D
        MVI@    R1,     R0                      ; 5F61   0288
        RSWD    R0                              ; 5F62   0038
        BNC     L_5F69                          ; 5F63   0209 0004
        BEQ     L_5F5F                          ; 5F65   0224 0007
        B       L_5FDE                          ; 5F67   0200 0075

L_5F69:
        MOVR    R2,     R1                      ; 5F69   0091
        SUBI    #$000C, R1                      ; 5F6A   0339 000C
        MVI@    R1,     R0                      ; 5F6C   0288
        RSWD    R0                              ; 5F6D   0038
        BNC     L_5F7C                          ; 5F6E   0209 000C
        BNEQ    L_5F7C                          ; 5F70   020C 000A

L_5F72:
        SUBI    #$000C, R1                      ; 5F72   0339 000C
        MVI@    R1,     R0                      ; 5F74   0288
        RSWD    R0                              ; 5F75   0038
        BNC     L_5F7C                          ; 5F76   0209 0004
        BEQ     L_5F72                          ; 5F78   0224 0007
        B       L_5FDE                          ; 5F7A   0200 0062

L_5F7C:
        MOVR    R2,     R1                      ; 5F7C   0091
        SUBI    #$000B, R1                      ; 5F7D   0339 000B
        MVI@    R1,     R0                      ; 5F7F   0288
        RSWD    R0                              ; 5F80   0038
        BNC     L_5F8F                          ; 5F81   0209 000C
        BNEQ    L_5F8F                          ; 5F83   020C 000A

L_5F85:
        SUBI    #$000B, R1                      ; 5F85   0339 000B
        MVI@    R1,     R0                      ; 5F87   0288
        RSWD    R0                              ; 5F88   0038
        BNC     L_5F8F                          ; 5F89   0209 0004
        BEQ     L_5F85                          ; 5F8B   0224 0007
        B       L_5FDE                          ; 5F8D   0200 004F

L_5F8F:
        MOVR    R2,     R1                      ; 5F8F   0091
        ADDI    #$0001, R1                      ; 5F90   02F9 0001
        MVI@    R1,     R0                      ; 5F92   0288
        RSWD    R0                              ; 5F93   0038
        BNC     L_5FA2                          ; 5F94   0209 000C
        BNEQ    L_5FA2                          ; 5F96   020C 000A

L_5F98:
        ADDI    #$0001, R1                      ; 5F98   02F9 0001
        MVI@    R1,     R0                      ; 5F9A   0288
        RSWD    R0                              ; 5F9B   0038
        BNC     L_5FA2                          ; 5F9C   0209 0004
        BEQ     L_5F98                          ; 5F9E   0224 0007
        B       L_5FDE                          ; 5FA0   0200 003C

L_5FA2:
        MOVR    R2,     R1                      ; 5FA2   0091
        ADDI    #$000D, R1                      ; 5FA3   02F9 000D
        MVI@    R1,     R0                      ; 5FA5   0288
        RSWD    R0                              ; 5FA6   0038
        BNC     L_5FB5                          ; 5FA7   0209 000C
        BNEQ    L_5FB5                          ; 5FA9   020C 000A

L_5FAB:
        ADDI    #$000D, R1                      ; 5FAB   02F9 000D
        MVI@    R1,     R0                      ; 5FAD   0288
        RSWD    R0                              ; 5FAE   0038
        BNC     L_5FB5                          ; 5FAF   0209 0004
        BEQ     L_5FAB                          ; 5FB1   0224 0007
        B       L_5FDE                          ; 5FB3   0200 0029

L_5FB5:
        MOVR    R2,     R1                      ; 5FB5   0091
        ADDI    #$000C, R1                      ; 5FB6   02F9 000C
        MVI@    R1,     R0                      ; 5FB8   0288
        RSWD    R0                              ; 5FB9   0038
        BNC     L_5FC8                          ; 5FBA   0209 000C
        BNEQ    L_5FC8                          ; 5FBC   020C 000A

L_5FBE:
        ADDI    #$000C, R1                      ; 5FBE   02F9 000C
        MVI@    R1,     R0                      ; 5FC0   0288
        RSWD    R0                              ; 5FC1   0038
        BNC     L_5FC8                          ; 5FC2   0209 0004
        BEQ     L_5FBE                          ; 5FC4   0224 0007
        B       L_5FDE                          ; 5FC6   0200 0016

L_5FC8:
        MOVR    R2,     R1                      ; 5FC8   0091
        ADDI    #$000B, R1                      ; 5FC9   02F9 000B
        MVI@    R1,     R0                      ; 5FCB   0288
        RSWD    R0                              ; 5FCC   0038
        BNC     L_5FDD                          ; 5FCD   0209 000E
        BNEQ    L_5FDD                          ; 5FCF   020C 000C

L_5FD1:
        ADDI    #$000B, R1                      ; 5FD1   02F9 000B
        MVI@    R1,     R0                      ; 5FD3   0288
        RSWD    R0                              ; 5FD4   0038
        BNC     L_5FDD                          ; 5FD5   0209 0006
        BEQ     L_5FD1                          ; 5FD7   0224 0007
        B       L_5FDE                          ; 5FD9   0200 0003

L_5FDB:
        SUBI    #$0002, R3                      ; 5FDB   033B 0002
L_5FDD:
        INCR    R3                              ; 5FDD   000B
L_5FDE:
        INCR    R2                              ; 5FDE   000A
        CMPR    R4,     R2                      ; 5FDF   0162
        BNEQ    L_5DDD                          ; 5FE0   022C 0204

        MVI     .BTAB.78,R0                     ; 5FE2   0280 0278
        RSWD    R0                              ; 5FE4   0038
        BEQ     L_5FE8                          ; 5FE5   0204 0001

        NEGR    R3                              ; 5FE7   0023
L_5FE8:
        SLL     R3,     1                       ; 5FE8   004B
        ADD     .BTAB.28,R3                     ; 5FE9   02C3 0228
        J       L_594B                          ; 5FEB   0004 0358 014B

L_5FEE:
        MVI     .BTAB.3C,R3                     ; 5FEE   0283 023C
        SDBD                                    ; 5FF0   0001
        MVII    #$4000, R2                      ; 5FF1   02BA 0000 0040
        TSTR    R3                              ; 5FF4   009B
        BGE     L_5FF8                          ; 5FF5   020D 0001

        NEGR    R2                              ; 5FF7   0022
L_5FF8:
        ADDR    R2,     R3                      ; 5FF8   00D3
        J       L_594B                          ; 5FF9   0004 0358 014B

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5046       $5131   $513A  
;;  $504E       $5061  
;;  $504F       $5052  
;;  $5060       $505C  
;;  $5064       $51DD  
;;  $50A6       $5086   $508E   $5098   $50A2  
;;  $50A9       $50AC  
;;  $50AF       $51E0  
;;  $50E3       $5112   $5141   $515F  
;;  $50ED       <entry>
;;  $510E       $511F  
;;  $511C       $5116  
;;  $5121       $511A  
;;  $513D       $514F  
;;  $514C       $5146  
;;  $5151       $514A  
;;  $515B       $5170  
;;  $516D       $5167  
;;  $5172       $5163  
;;  $5174       $516B  
;;  $51A5       $51A9  
;;  $51BE       $51CF  
;;  $51C0       $51C3  
;;  $51C8       $51CC  
;;  $51D3       $51D7  
;;  $51FA       $5221  
;;  $5207       $5202  
;;  $520A       $5536  
;;  $520D       $51FD  
;;  $5223       $54C3   $54FF   $551D   $553A  
;;  $5231       $5228   $522E  
;;  $5232       $550C   $5528  
;;  $5244       $519A   $5442  
;;  $5250       $524C  
;;  $525B       $5257  
;;  $5266       $5262  
;;  $5274       $5271  
;;  $527C       <entry>
;;  $528D       $5281  
;;  $5290       $50C5   $50CA   $5288   $55B9  
;;  $52A3       $529D  
;;  $52B5       $52B3  
;;  $52BA       $52B1  
;;  $52D2       $52C9  
;;  $52D6       $52CD  
;;  $52DA       $52D0  
;;  $52ED       $550F   $552B  
;;  $530B       $52F3  
;;  $5310       $52F7   $5309  
;;  $5324       $52FB   $52FF   $5303   $5307   $530E  
;;  $5326       $5322  
;;  $5328       $530B   $539C  
;;  $5335       $533F   $5341   $5347  
;;  $5343       $5349  
;;  $534D       $532B   $5338  
;;  $534F       $51FA  
;;  $5372       $536A  
;;  $537C       $5374  
;;  $5386       $5370   $537A  
;;  $538D       $538E  
;;  $5394       $5354   $535D  
;;  $5395       $535A  
;;  $5398       $53A4  
;;  $53A1       $539A  
;;  $53A6       $539F  
;;  $53A7       $5358   $5362  
;;  $53C1       $53BB  
;;  $53D5       $53BE   $53C4  
;;  $53E9       $520A  
;;  $540C       $5408  
;;  $5411       $541B   $5421  
;;  $5417       $541D  
;;  $541F       $543D  
;;  $542F       $5430  
;;  $543F       $5415  
;;  $5446       $507A   $53FF   $5434   $5460   $548C   $549C  
;;  $545A       $5514  
;;  $546D       $5469  
;;  $5472       $547C   $5482  
;;  $5478       $547E  
;;  $5480       $5495  
;;  $5487       $5488  
;;  $5497       $5476  
;;  $5498       $5518  
;;  $549B       $54B5  
;;  $54AE       $54AA  
;;  $54B2       $54A8  
;;  $54B3       $54A6  
;;  $54D4       $54C7  
;;  $5518       $5505  
;;  $551B       $5503   $550A   $5512   $5521   $5526   $552E  
;;  $5546       $5204  
;;  $5556       $555C  
;;  $5560       $5566  
;;  $5570       $5573  
;;  $55AD       $558C  
;;  $55DF       $55E4  
;;  $55E8       $55ED  
;;  $55F7       $55FA  
;;  $55FF       $5543  
;;  $561E       $5207  
;;  $5622       $5603   $5609   $560F   $5614  
;;  $5642       $5645  
;;  $564A       $5736  
;;  $5654       $5657  
;;  $565E       $5628   $566F  
;;  $5675       $565C  
;;  $567C       $561C   $5673  
;;  $56B6       $56B7  
;;  $56C5       $5647  
;;  $56CF       $56DF   $56E5   $5708  
;;  $56D3       $5712  
;;  $56DA       $5C33  
;;  $56F4       $56F1  
;;  $56F6       $5734  
;;  $56FA       $56FD  
;;  $5714       $56EC  
;;  $5730       $5729  
;;  $5736       $5725   $572D  
;;  $5739       $5AEA  
;;  $5758       $5760  
;;  $5764       $597D   $5A32  
;;  $576C       $5762  
;;  $576F       $577D  
;;  $5781       $5754   $5756   $575E  
;;  $5783       $577F  
;;  $578E       $5796  
;;  $579A       $5992   $5A47  
;;  $57A3       $5798  
;;  $57A6       $57B4  
;;  $57B8       $578A   $578C   $5794  
;;  $57BA       $57B6  
;;  $57C5       $57CD  
;;  $57D1       $59A7   $5A5C  
;;  $57DB       $57CF  
;;  $57DE       $57EC  
;;  $57F0       $57C1   $57C3   $57CB  
;;  $57F2       $57EE  
;;  $57FD       $5805  
;;  $5809       $59BC   $5A71  
;;  $5814       $5807  
;;  $5817       $5825  
;;  $5829       $57F9   $57FB   $5803  
;;  $582B       $5827  
;;  $5836       $583E  
;;  $5842       $59D1   $5A86  
;;  $584F       $5840  
;;  $5852       $5860  
;;  $5864       $5832   $5834   $583C  
;;  $5866       $5862  
;;  $5871       $5879  
;;  $587D       $59E6   $5A9B  
;;  $588B       $587B  
;;  $588E       $589C  
;;  $58A0       $586D   $586F   $5877  
;;  $58A2       $589E  
;;  $58AD       $58B5  
;;  $58B9       $59FB   $5AB0  
;;  $58C8       $58B7  
;;  $58CB       $58D9  
;;  $58DD       $58A9   $58AB   $58B3  
;;  $58DF       $58DB  
;;  $58EA       $58F2  
;;  $58F6       $5A10   $5AC5  
;;  $5906       $58F4  
;;  $5909       $5917  
;;  $591B       $58E6   $58E8   $58F0  
;;  $591D       $5919  
;;  $5932       $5C47  
;;  $594B       $5FEB   $5FF9  
;;  $5952       $56D7  
;;  $5954       $5946  
;;  $5959       $5952  
;;  $5974       $597B  
;;  $597F       $5970   $5972   $5979  
;;  $5989       $5990  
;;  $5994       $5985   $5987   $598E  
;;  $599E       $59A5  
;;  $59A9       $599A   $599C   $59A3  
;;  $59B3       $59BA  
;;  $59BE       $59AF   $59B1   $59B8  
;;  $59C8       $59CF  
;;  $59D3       $59C4   $59C6   $59CD  
;;  $59DD       $59E4  
;;  $59E8       $59D9   $59DB   $59E2  
;;  $59F2       $59F9  
;;  $59FD       $59EE   $59F0   $59F7  
;;  $5A07       $5A0E  
;;  $5A12       $5968   $5A03   $5A05   $5A0C   $5C29  
;;  $5A14       $5ACA   $5C2F  
;;  $5A29       $5A30  
;;  $5A34       $5A25   $5A27   $5A2E  
;;  $5A3E       $5A45  
;;  $5A49       $5A3A   $5A3C   $5A43  
;;  $5A53       $5A5A  
;;  $5A5E       $5A4F   $5A51   $5A58  
;;  $5A68       $5A6F  
;;  $5A73       $5A64   $5A66   $5A6D  
;;  $5A7D       $5A84  
;;  $5A88       $5A79   $5A7B   $5A82  
;;  $5A92       $5A99  
;;  $5A9D       $5A8E   $5A90   $5A97  
;;  $5AA7       $5AAE  
;;  $5AB2       $5AA3   $5AA5   $5AAC  
;;  $5ABC       $5AC3  
;;  $5AC7       $5A16   $5A1D   $5AB8   $5ABA   $5AC1  
;;  $5AD2       $5748   $574B   $5950   $5BCE   $5C31   $5C59   $5C5C  
;;  $5AF2       $5B00  
;;  $5B02       $5AEE  
;;  $5B08       $5B16  
;;  $5B18       $5B04  
;;  $5B1E       $5B2C  
;;  $5B2E       $5B1A  
;;  $5B34       $5B42  
;;  $5B44       $5B30  
;;  $5B4A       $5B58  
;;  $5B5A       $5B46  
;;  $5B60       $5B6E  
;;  $5B70       $5B5C  
;;  $5B76       $5B84  
;;  $5B86       $5B72  
;;  $5B8C       $5B9A  
;;  $5B9C       $5B88  
;;  $5BD0       $5BC7  
;;  $5BE4       $5BD4  
;;  $5BF8       $5BD6  
;;  $5C05       $5BD8  
;;  $5C10       $5BDA  
;;  $5C19       $5BDC  
;;  $5C20       $5BDE  
;;  $5C22       $5BC1   $5BE0   $5BE2   $5BF6   $5C03   $5C0E   $5C17   $5C1E  
;;  $5C33       $5AD5  
;;  $5C36       $5AD0  
;;  $5C49       $5C3C  
;;  $5C53       $5C50  
;;  $5C5E       $50E5   $5314   $5386   $53B2   $5C6E  
;;  $5C69       $51EE   $531E   $5390  
;;  $5C82       $5C84  
;;  $5C89       $5C75  
;;  $5DD2       $5948  
;;  $5DDD       $5FE0  
;;  $5DF2       $5DF8  
;;  $5DFC       $5DF0   $5E02  
;;  $5E06       $5DEE   $5DF6   $5E00  
;;  $5E0F       $5E15  
;;  $5E19       $5E0D   $5E1F  
;;  $5E23       $5E0B   $5E13   $5E1D  
;;  $5E2C       $5E32  
;;  $5E36       $5E2A   $5E3C  
;;  $5E40       $5E28   $5E30   $5E3A  
;;  $5E49       $5E4F  
;;  $5E53       $5E47   $5E59  
;;  $5E5D       $5E45   $5E4D   $5E57  
;;  $5E66       $5E6C  
;;  $5E70       $5E64   $5E76  
;;  $5E7A       $5E62   $5E6A   $5E74  
;;  $5E83       $5E89  
;;  $5E8D       $5E81   $5E93  
;;  $5E97       $5E7F   $5E87   $5E91  
;;  $5EA0       $5EA6  
;;  $5EAA       $5E9E   $5EB0  
;;  $5EB4       $5E9C   $5EA4   $5EAE  
;;  $5EBD       $5EC3  
;;  $5EC7       $5EBB   $5ECD  
;;  $5ED1       $5E04  
;;  $5EDA       $5EE0  
;;  $5EE4       $5E21   $5ED6   $5ED8   $5EDE  
;;  $5EED       $5EF3  
;;  $5EF7       $5E3E   $5EE9   $5EEB   $5EF1  
;;  $5F00       $5F06  
;;  $5F0A       $5E5B   $5EFC   $5EFE   $5F04  
;;  $5F13       $5F19  
;;  $5F1D       $5E78   $5F0F   $5F11   $5F17  
;;  $5F26       $5F2C  
;;  $5F30       $5E95   $5F22   $5F24   $5F2A  
;;  $5F39       $5F3F  
;;  $5F43       $5EB2   $5F35   $5F37   $5F3D  
;;  $5F4C       $5F52  
;;  $5F56       $5DFA  
;;  $5F5F       $5F65  
;;  $5F69       $5E17   $5F5B   $5F5D   $5F63  
;;  $5F72       $5F78  
;;  $5F7C       $5E34   $5F6E   $5F70   $5F76  
;;  $5F85       $5F8B  
;;  $5F8F       $5E51   $5F81   $5F83   $5F89  
;;  $5F98       $5F9E  
;;  $5FA2       $5E6E   $5F94   $5F96   $5F9C  
;;  $5FAB       $5FB1  
;;  $5FB5       $5E8B   $5FA7   $5FA9   $5FAF  
;;  $5FBE       $5FC4  
;;  $5FC8       $5EA8   $5FBA   $5FBC   $5FC2  
;;  $5FD1       $5FD7  
;;  $5FDB       $5ECF   $5F48   $5F4A   $5F50  
;;  $5FDD       $5EC5   $5FCD   $5FCF   $5FD5  
;;  $5FDE       $5DDF   $5DE7   $5EB9   $5EC1   $5ECB   $5EE2   $5EF5   $5F08  
;;  $5FDE       $5F1B   $5F2E   $5F41   $5F54   $5F67   $5F7A   $5F8D   $5FA0  
;;  $5FDE       $5FB3   $5FC6   $5FD9  
;;  $5FE8       $5FE5  
;;  $5FEE       $5DD6  
;;  $5FF8       $5FF5  
;; ======================================================================== ;;
