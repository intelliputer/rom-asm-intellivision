
        ORG     $5000
.HEADER:
        BIDECLE $501C           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $50D7           ; 5004  Ptr: Start of game
        BIDECLE $500C           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501E           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5021           ; 500A  Ptr: Date/Title
.GFX_LIST_500C:
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5014  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5018  
.TIMER:
        BIDECLE $0000           ; 501C  End of timer table

.GRAM_INIT_501E:
        DECLE   $0001           ; 501E  # of GRAM cards to init
        DECLE   $0001,  $0300   ; 501F  #00-06:  CART #00-06 ----
.TITLE:
        DECLE   $0052                           ; 5021  Cartridge year
        STRING  "  "                            ; 5022  Title string
        STRING  "   A"                          ; 5024  CART PIC #03
        STRING  "ctiv"                          ; 5028  
        STRING  "isio"                          ; 502C  CART PIC #04
        STRING  "n   "                          ; 5030  
        STRING  "    "                          ; 5034  CART PIC #05
        STRING  "    "                          ; 5038  
        STRING  "pres"                          ; 503C  CART PIC #06
        STRING  "ents"                          ; 5040  
        STRING  "              THE   "          ; 5044  
        STRING  "    tm DREADNAUGHT F"          ; 5058  
        STRING  "ACTOR               "          ; 506C  
        STRING  "       Select Option"          ; 5080  
        STRING  " 1-7                "          ; 5094  
        STRING  "         Copyright 1"          ; 50A8  
        STRING  "983     Activision, "          ; 50BC  
        STRING  "Inc.  "                        ; 50D0  
        DECLE   $0000                           ; 50D6  

.TITLECODE:
        DIS                                     ; 50D7   0003
        MVII    #$003D, R0                      ; 50D8   02B8 003D
        MVO     R0,     .ISRVEC.0               ; 50DA   0240 0100
        MVII    #$005D, R0                      ; 50DC   02B8 005D
        MVO     R0,     .ISRVEC.1               ; 50DE   0240 0101
        MVII    #$02F0, R6                      ; 50E0   02BE 02F0
        EIS                                     ; 50E2   0002
        MVII    #$01FE, R1                      ; 50E3   02B9 01FE
L_50E5:
        XORI    #$0001, R1                      ; 50E5   03F9 0001
        MVI@    R1,     R0                      ; 50E7   0288
        CLRR    R2                              ; 50E8   01D2
        MOVR    R7,     R4                      ; 50E9   00BC
        ADDI    #$00E4, R4                      ; 50EA   02FC 00E4
L_50EC:
        INCR    R2                              ; 50EC   000A
        CMP@    R4,     R0                      ; 50ED   0360
        BEQ     L_50F6                          ; 50EE   0204 0006

        CMPI    #$0007, R2                      ; 50F0   037A 0007
        BNEQ    L_50EC                          ; 50F2   022C 0007
        B       L_50E5                          ; 50F4   0220 0010

L_50F6:
        DIS                                     ; 50F6   0003
        CLRR    R0                              ; 50F7   01C0
        MVII    #$0102, R4                      ; 50F8   02BC 0102
        MVII    #$025E, R3                      ; 50FA   02BB 025E
L_50FC:
        MVO@    R0,     R4                      ; 50FC   0260
        DECR    R3                              ; 50FD   0013
        BNEQ    L_50FC                          ; 50FE   022C 0003

        MVO     R1,     G_0316                  ; 5100   0241 0316
        MVO     R2,     G_0105                  ; 5102   0242 0105
        XORI    #$0001, R1                      ; 5104   03F9 0001
        MVI@    R1,     R3                      ; 5106   028B
        CMPI    #$0007, R3                      ; 5107   037B 0007
        BNEQ    L_510D                          ; 5109   020C 0002

        MVO     R3,     G_01BD                  ; 510B   0243 01BD
L_510D:
        MVII    #$02F0, R6                      ; 510D   02BE 02F0
        MVII    #$00A9, R0                      ; 510F   02B8 00A9
        MVO     R0,     .ISRVEC.0               ; 5111   0240 0100
        MVII    #$005C, R0                      ; 5113   02B8 005C
        MVO     R0,     .ISRVEC.1               ; 5115   0240 0101
        MVII    #$000A, R0                      ; 5117   02B8 000A
        MVO     R0,     G_0106                  ; 5119   0240 0106
        MVO     R0,     G_0132                  ; 511B   0240 0132

        JSR     R4,     L_68E7                  ; 511D   0004 0068 00E7

        COMR    R0                              ; 5120   0018
        MVO     R0,     G_0102                  ; 5121   0240 0102
        SDBD                                    ; 5123   0001
        MVII    #$1458, R0                      ; 5124   02B8 0058 0014
        MVO     R0,     G_0352                  ; 5127   0240 0352
        MVII    #$0060, R0                      ; 5129   02B8 0060
        MVO     R0,     G_035A                  ; 512B   0240 035A
        EIS                                     ; 512D   0002
L_512E:
        MVI     G_0102, R0                      ; 512E   0280 0102
        TSTR    R0                              ; 5130   0080
        BNEQ    L_512E                          ; 5131   022C 0004

        JSR     R4,     L_5231                  ; 5133   0004 0050 0231

L_5136:
        CLRR    R0                              ; 5136   01C0
        MVO     R0,     G_0102                  ; 5137   0240 0102
L_5139:
        MVI     G_0316, R1                      ; 5139   0281 0316
        MVI     G_0359, R0                      ; 513B   0280 0359
        MVI     G_0103, R4                      ; 513D   0284 0103
        CMPI    #$0006, R4                      ; 513F   037C 0006
        BNEQ    L_5147                          ; 5141   020C 0004

        MOVR    R0,     R2                      ; 5143   0082
        ANDI    #$0001, R2                      ; 5144   03BA 0001
        XORR    R2,     R1                      ; 5146   01D1
L_5147:
        MVI@    R1,     R2                      ; 5147   028A
        MVO     R2,     G_0109                  ; 5148   0242 0109
        MVI     G_010A, R2                      ; 514A   0282 010A
        CMPI    #$005A, R2                      ; 514C   037A 005A
        BNEQ    L_5159                          ; 514E   020C 0009

        CMPI    #$0015, R0                      ; 5150   0378 0015
        BNC     L_51AB                          ; 5152   0209 0057

        JSR     R4,     L_5653                  ; 5154   0004 0054 0253

        B       L_51AB                          ; 5157   0200 0052

L_5159:
        JSR     R4,     L_6706                  ; 5159   0004 0064 0306

        MVI     G_0103, R0                      ; 515C   0280 0103
        CMPI    #$0006, R0                      ; 515E   0378 0006
        BNEQ    L_517A                          ; 5160   020C 0018

        MVII    #$022E, R4                      ; 5162   02BC 022E
        MOVR    R4,     R5                      ; 5164   00A5
L_5165:
        MVI@    R4,     R1                      ; 5165   02A1
        XORI    #$0004, R1                      ; 5166   03F9 0004
        MVO@    R1,     R5                      ; 5168   0269
        CMPI    #$0233, R4                      ; 5169   037C 0233
        BLE     L_5165                          ; 516B   0226 0007

        MVI     G_01C2, R1                      ; 516D   0281 01C2
        DECR    R1                              ; 516F   0011
        ANDI    #$0007, R1                      ; 5170   03B9 0007
        MVO     R1,     G_01C2                  ; 5172   0241 01C2
        ADDI    #$02D1, R1                      ; 5174   02F9 02D1
        MVI@    R1,     R2                      ; 5176   028A
        XORI    #$0005, R2                      ; 5177   03FA 0005
        MVO@    R2,     R1                      ; 5179   024A
L_517A:
        MVII    #$0001, R1                      ; 517A   02B9 0001
        MVO     R1,     G_01BB                  ; 517C   0241 01BB
        CMPI    #$0007, R0                      ; 517E   0378 0007
        BNEQ    L_5197                          ; 5180   020C 0015

        JSR     R4,     L_55AE                  ; 5182   0004 0054 01AE
        JSR     R4,     L_5475                  ; 5185   0004 0054 0075
        JSR     R4,     L_674C                  ; 5188   0004 0064 034C

        MVI     G_0103, R0                      ; 518B   0280 0103
        CMPI    #$0007, R0                      ; 518D   0378 0007
        BNEQ    L_5197                          ; 518F   020C 0006

        JSR     R4,     L_581F                  ; 5191   0004 0058 001F
        JSR     R4,     L_5796                  ; 5194   0004 0054 0396

L_5197:
        CLRR    R0                              ; 5197   01C0
        MVO     R0,     G_01BB                  ; 5198   0240 01BB

        JSR     R4,     L_6728                  ; 519A   0004 0064 0328
        JSR     R4,     L_5653                  ; 519D   0004 0054 0253
        JSR     R4,     L_53F7                  ; 51A0   0004 0050 03F7
        JSR     R4,     L_51D5                  ; 51A3   0004 0050 01D5

        MVI     G_0104, R1                      ; 51A6   0281 0104
        INCR    R1                              ; 51A8   0009
        MVO     R1,     G_0104                  ; 51A9   0241 0104
L_51AB:
        MVI     G_0359, R1                      ; 51AB   0281 0359
        INCR    R1                              ; 51AD   0009
        MVO     R1,     G_0359                  ; 51AE   0241 0359
        SDBD                                    ; 51B0   0001
        CMPI    #$8CA0, R1                      ; 51B1   0379 00A0 008C
        BNC     L_51BD                          ; 51B4   0209 0007

        MVII    #$005A, R1                      ; 51B6   02B9 005A
        MVO     R1,     G_010A                  ; 51B8   0241 010A

        JSR     R4,     L_56B6                  ; 51BA   0004 0054 02B6

L_51BD:
        MVII    #$0001, R1                      ; 51BD   02B9 0001

        JSR     R4,     L_66EE                  ; 51BF   0004 0064 02EE

        MVI     G_0102, R0                      ; 51C2   0280 0102
        CMPI    #$0002, R0                      ; 51C4   0378 0002
        BLT     L_51BD                          ; 51C6   0225 000A

        CMPI    #$00FF, R0                      ; 51C8   0378 00FF
        BEQ     L_5139                          ; 51CA   0224 0092
        B       L_5136                          ; 51CC   0220 0097

        SARC    R2,     2                       ; 51CE   007E
        MOVR    R7,     R6                      ; 51CF   00BE
        ADDR    R3,     R6                      ; 51D0   00DE
        SARC    R1,     2                       ; 51D1   007D
        MOVR    R7,     R5                      ; 51D2   00BD
        ADDR    R3,     R5                      ; 51D3   00DD
        SARC    R3,     1                       ; 51D4   007B
L_51D5:
        PSHR    R4                              ; 51D5   0274
        MVI     G_035A, R0                      ; 51D6   0280 035A
        DECR    R0                              ; 51D8   0010
        BMI     L_539D                          ; 51D9   020B 01C2

        MVO     R0,     G_035A                  ; 51DB   0240 035A
        BNEQ    L_539D                          ; 51DD   020C 01BE

        MVI     G_0103, R1                      ; 51DF   0281 0103
        INCR    R1                              ; 51E1   0009
        ADDR    R7,     R1                      ; 51E2   00F9
        ADD@    R1,     R7                      ; 51E3   02CF

        ADDR    R3,     R4                      ; 51E4   00DC
        ANDR    R7,     R1                      ; 51E5   01B9
        CMPR    R4,     R6                      ; 51E6   0166
        SARC    R2,     2                       ; 51E7   007E
        SLR     R0,     1                       ; 51E8   0060
        ANDR    R7,     R1                      ; 51E9   01B9
        ANDR    R7,     R1                      ; 51EA   01B9
        ANDR    R7,     R1                      ; 51EB   01B9
        NEGR    R1                              ; 51EC   0021
        INCR    R2                              ; 51ED   000A
        MVII    #$0003, R3                      ; 51EE   02BB 0003
        MVO     R3,     G_0103                  ; 51F0   0243 0103
        MVII    #$0035, R0                      ; 51F2   02B8 0035
        MVO     R0,     G_035A                  ; 51F4   0240 035A
        MVII    #$0005, R1                      ; 51F6   02B9 0005

        JSR     R4,     L_6048                  ; 51F8   0004 0060 0048

        SDBD                                    ; 51FB   0001
        MVII    #$6287, R0                      ; 51FC   02B8 0087 0062
        MVO     R0,     G_0353                  ; 51FF   0240 0353
        CLRR    R0                              ; 5201   01C0
        MVO     R0,     G_01B5                  ; 5202   0240 01B5
        PULR    R7                              ; 5204   02B7

        MVI     G_0107, R0                      ; 5205   0280 0107
        INCR    R0                              ; 5207   0008
        MVO     R0,     G_0107                  ; 5208   0240 0107

        JSR     R4,     L_68E7                  ; 520A   0004 0068 00E7

        CLRR    R0                              ; 520D   01C0
        MVO     R0,     G_0103                  ; 520E   0240 0103
L_5210:
        MVI     G_0102, R0                      ; 5210   0280 0102
        TSTR    R0                              ; 5212   0080
        BNEQ    L_5210                          ; 5213   022C 0004

        MVII    #$0060, R0                      ; 5215   02B8 0060
        MVO     R0,     G_035A                  ; 5217   0240 035A

        JSR     R4,     L_5339                  ; 5219   0004 0050 0339

        BEQ     L_523B                          ; 521C   0204 001D

        MVI     G_0106, R0                      ; 521E   0280 0106
        MVI     G_0105, R1                      ; 5220   0281 0105
        CMPI    #$0005, R1                      ; 5222   0379 0005
        BLT     L_5228                          ; 5224   0205 0002

        ADDI    #$0002, R0                      ; 5226   02F8 0002
L_5228:
        ADDI    #$0002, R0                      ; 5228   02F8 0002
        CMPI    #$0100, R0                      ; 522A   0378 0100
        BGE     L_5230                          ; 522C   020D 0002

        MVO     R0,     G_0106                  ; 522E   0240 0106
L_5230:
        INCR    R7                              ; 5230   000F

L_5231:
        PSHR    R4                              ; 5231   0274
L_5232:
        CLRR    R3                              ; 5232   01DB
        MVII    #$0001, R1                      ; 5233   02B9 0001

        JSR     R4,     L_6048                  ; 5235   0004 0060 0048
        JSR     R4,     L_5AAE                  ; 5238   0004 0058 02AE
L_523B:
        JSR     R4,     L_5AAD                  ; 523B   0004 0058 02AD

        MVI     G_0106, R0                      ; 523E   0280 0106
        DECR    R0                              ; 5240   0010
        MVO     R0,     G_0106                  ; 5241   0240 0106
        PULR    R7                              ; 5243   02B7

        MVII    #$0006, R0                      ; 5244   02B8 0006
        MVO     R0,     G_0103                  ; 5246   0240 0103
        MVII    #$0200, R4                      ; 5248   02BC 0200
        CLRR    R0                              ; 524A   01C0
        MVO     R0,     G_0102                  ; 524B   0240 0102
L_524D:
        MVO@    R0,     R4                      ; 524D   0260
        MVO@    R0,     R4                      ; 524E   0260
        CMPI    #$02F0, R4                      ; 524F   037C 02F0
        BLT     L_524D                          ; 5251   0225 0005

        SDBD                                    ; 5253   0001
        MVII    #$5BC7, R4                      ; 5254   02BC 00C7 005B
        MVII    #$0010, R0                      ; 5257   02B8 0010

        JSR     R5,     L_5ACC                  ; 5259   0004 0158 02CC

        CLRR    R0                              ; 525C   01C0
        MVO     R0,     G_0317                  ; 525D   0240 0317
        MVO     R0,     G_031A                  ; 525F   0240 031A
        PULR    R7                              ; 5261   02B7

        MVII    #$0004, R0                      ; 5262   02B8 0004
        MVO     R0,     G_0103                  ; 5264   0240 0103
        SWAP    R0,     1                       ; 5266   0040
        ADDI    #$00FF, R0                      ; 5267   02F8 00FF
        MVO     R0,     G_035A                  ; 5269   0240 035A
        MVII    #$0200, R1                      ; 526B   02B9 0200
L_526D:
        MVI@    R1,     R2                      ; 526D   028A
        SWAP    R2,     1                       ; 526E   0042
        ANDI    #$0036, R2                      ; 526F   03BA 0036
        CMPI    #$0012, R2                      ; 5271   037A 0012
        BNEQ    L_527A                          ; 5273   020C 0005

        XORI    #$0004, R2                      ; 5275   03FA 0004
        SWAP    R2,     1                       ; 5277   0042
        XOR@    R1,     R2                      ; 5278   03CA
        MVO@    R2,     R1                      ; 5279   024A
L_527A:
        INCR    R1                              ; 527A   0009
        CMPI    #$02F0, R1                      ; 527B   0379 02F0
        BLT     L_526D                          ; 527D   0225 0011

        SLL     R1,     2                       ; 527F   004D
L_5280:
        DECR    R1                              ; 5280   0011
        NOP                                     ; 5281   0034
        BNEQ    L_5280                          ; 5282   022C 0003

        MVII    #$0200, R4                      ; 5284   02BC 0200
        SDBD                                    ; 5286   0001
        MVII    #$0400, R2                      ; 5287   02BA 0000 0004
L_528A:
        MVII    #$0005, R1                      ; 528A   02B9 0005
L_528C:
        MVO@    R2,     R4                      ; 528C   0262
        DECR    R1                              ; 528D   0011
        BNEQ    L_528C                          ; 528E   022C 0003

        ADDI    #$000F, R4                      ; 5290   02FC 000F
        CMPI    #$02F0, R4                      ; 5292   037C 02F0
        BLT     L_528A                          ; 5294   0225 000B

        MVII    #$0205, R0                      ; 5296   02B8 0205
L_5298:
        MOVR    R0,     R5                      ; 5298   0085
        MVII    #$00D0, R1                      ; 5299   02B9 00D0
L_529B:
        DECR    R1                              ; 529B   0011
        BNEQ    L_529B                          ; 529C   022C 0002

        SDBD                                    ; 529E   0001
        MVII    #$0400, R2                      ; 529F   02BA 0000 0004
        MVO@    R2,     R5                      ; 52A2   026A
        ADDI    #$0013, R5                      ; 52A3   02FD 0013
L_52A5:
        MOVR    R5,     R4                      ; 52A5   00AC
        MVI@    R4,     R1                      ; 52A6   02A1
        MVO@    R1,     R4                      ; 52A7   0261
        XORI    #$0002, R1                      ; 52A8   03F9 0002
        MVO@    R1,     R5                      ; 52AA   0269
        ADDI    #$0012, R4                      ; 52AB   02FC 0012
        ADDI    #$0013, R5                      ; 52AD   02FD 0013
        CMPI    #$02DC, R4                      ; 52AF   037C 02DC
        BLT     L_52A5                          ; 52B1   0225 000D

        MVO@    R2,     R5                      ; 52B3   026A
        INCR    R0                              ; 52B4   0008
        CMPI    #$0212, R0                      ; 52B5   0378 0212
        BLE     L_5298                          ; 52B7   0226 0020

        CLRR    R1                              ; 52B9   01C9
        MVO     R1,     G_0106                  ; 52BA   0241 0106
        COMR    R1                              ; 52BC   0019
        MVO     R1,     G_0102                  ; 52BD   0241 0102
        PULR    R7                              ; 52BF   02B7

        CLRR    R0                              ; 52C0   01C0
        MVO     R0,     G_010A                  ; 52C1   0240 010A
        INCR    R0                              ; 52C3   0008
        MVO     R0,     G_0103                  ; 52C4   0240 0103

        JSR     R4,     L_5339                  ; 52C6   0004 0050 0339

        BEQ     L_52CE                          ; 52C9   0204 0003
        J       L_57D5                          ; 52CB   0004 0354 03D5

L_52CE:
        MVII    #$0006, R0                      ; 52CE   02B8 0006
        MVO     R0,     G_0103                  ; 52D0   0240 0103
        MVI     G_0106, R0                      ; 52D2   0280 0106
        TSTR    R0                              ; 52D4   0080
        BEQ     L_52DD                          ; 52D5   0204 0006

        CLRR    R3                              ; 52D7   01DB
        MVII    #$0006, R1                      ; 52D8   02B9 0006

        JSR     R4,     L_6048                  ; 52DA   0004 0060 0048

L_52DD:
        MVI     G_0107, R1                      ; 52DD   0281 0107
        SLL     R1,     1                       ; 52DF   0049
        MOVR    R1,     R2                      ; 52E0   008A
        SLL     R1,     2                       ; 52E1   004D
        SLL     R1,     1                       ; 52E2   0049
        ADDR    R1,     R2                      ; 52E3   00CA
        SLL     R1,     1                       ; 52E4   0049
        ADDR    R2,     R1                      ; 52E5   00D1
        MVII    #$035B, R2                      ; 52E6   02BA 035B
        MVO@    R1,     R2                      ; 52E8   0251
        SDBD                                    ; 52E9   0001
        MVII    #$6252, R1                      ; 52EA   02B9 0052 0062
        INCR    R0                              ; 52ED   0008
        MVO     R0,     G_01B8                  ; 52EE   0240 01B8
        MVO     R1,     G_0353                  ; 52F0   0241 0353
L_52F2:
        CLRR    R1                              ; 52F2   01C9
        MVO     R1,     G_0102                  ; 52F3   0241 0102
        MVII    #$0067, R1                      ; 52F5   02B9 0067
        SWAP    R1,     1                       ; 52F7   0041
L_52F8:
        DECR    R1                              ; 52F8   0011
        BNEQ    L_52F8                          ; 52F9   022C 0002

        DECR    R0                              ; 52FB   0010
        BEQ     L_5322                          ; 52FC   0204 0024

        PSHR    R0                              ; 52FE   0270

        JSR     R5,     L_608A                  ; 52FF   0004 0160 008A

        PSHR    R2                              ; 5302   0272
        MOVR    R0,     R1                      ; 5303   0081
        NEGR    R1                              ; 5304   0021
        ADD     G_0106, R1                      ; 5305   02C1 0106
        INCR    R1                              ; 5307   0009
        MVII    #$02C2, R5                      ; 5308   02BD 02C2

        JSR     R4,     L_6013                  ; 530A   0004 0060 0013
        JSR     R4,     L_5B4A                  ; 530D   0004 0058 034A

        PULR    R2                              ; 5310   02B2
        PULR    R0                              ; 5311   02B0
        CMP     G_0106, R0                      ; 5312   0340 0106
        BEQ     L_5320                          ; 5314   0204 000A

        MVI     G_031F, R3                      ; 5316   0283 031F
        ADDI    #$0002, R3                      ; 5318   02FB 0002
        CMPI    #$016A, R3                      ; 531A   037B 016A
        BGT     L_5320                          ; 531C   020E 0002

        MVO     R3,     G_031F                  ; 531E   0243 031F
L_5320:
        B       L_52F2                          ; 5320   0220 002F

L_5322:
        MVO     R0,     G_0317                  ; 5322   0240 0317
        MVII    #$02D1, R4                      ; 5324   02BC 02D1
        SDBD                                    ; 5326   0001
        MVII    #$5331, R5                      ; 5327   02BD 0031 0053
L_532A:
        MVI@    R5,     R1                      ; 532A   02A9
        MVO@    R1,     R4                      ; 532B   0261
        CMPI    #$02D8, R4                      ; 532C   037C 02D8
        BLE     L_532A                          ; 532E   0226 0005
        PULR    R7                              ; 5330   02B7

        DECLE   $01B7                           ; 5331   01B7

        CMPR    R1,     R7                      ; 5332   014F
        SUBR    R3,     R7                      ; 5333   011F

        DECLE   $01A7,  $017F,  $0197,  $01CF   ; 5334   01A7 017F 0197 01CF

        INCR    R7                              ; 5338   000F

L_5339:
        PSHR    R4                              ; 5339   0274
L_533A:
        MVI     G_0105, R1                      ; 533A   0281 0105
        ADDR    R7,     R1                      ; 533C   00F9
        ADDI    #$0005, R1                      ; 533D   02F9 0005
        MVI     G_0107, R2                      ; 533F   0282 0107
        CMP@    R1,     R2                      ; 5341   034A
        PULR    R7                              ; 5342   02B7

        DECLE   $0001,  $0001,  $0002,  $0005   ; 5343   0001 0001 0002 0005

        INCR    R2                              ; 5347   000A
        INCR    R7                              ; 5348   000F

        SLR     R0,     2                       ; 5349   0064
L_534A:
        SDBD                                    ; 534A   0001
        MVII    #$61A9, R0                      ; 534B   02B8 00A9 0061
        MVO     R0,     G_0354                  ; 534E   0240 0354
        CLRR    R0                              ; 5350   01C0
        MVO     R0,     G_01B5                  ; 5351   0240 01B5
        MVO     R0,     G_0353                  ; 5353   0240 0353
        MVII    #$0007, R0                      ; 5355   02B8 0007
        MVO     R0,     G_0103                  ; 5357   0240 0103
        MVII    #$00FF, R0                      ; 5359   02B8 00FF
        MVO     R0,     G_0102                  ; 535B   0240 0102
        MVI     G_0108, R0                      ; 535D   0280 0108
        SLR     R0,     1                       ; 535F   0060
        ADDI    #$0019, R0                      ; 5360   02F8 0019
        MVO     R0,     G_012E                  ; 5362   0240 012E
        CLRR    R0                              ; 5364   01C0
        MVO     R0,     G_034F                  ; 5365   0240 034F
        MVI     G_0132, R1                      ; 5367   0281 0132
        SDBD                                    ; 5369   0001
        ADDI    #$68E2, R1                      ; 536A   02F9 00E2 0068
        MVI@    R1,     R0                      ; 536D   0288
        SWAP    R0,     1                       ; 536E   0040
        MVO     R0,     G_0350                  ; 536F   0240 0350
        SDBD                                    ; 5371   0001
        MVII    #$623F, R0                      ; 5372   02B8 003F 0062
        MVO     R0,     G_0355                  ; 5375   0240 0355
        MVII    #$0010, R0                      ; 5377   02B8 0010
        MVO     R0,     G_010C                  ; 5379   0240 010C
        MVII    #$0133, R5                      ; 537B   02BD 0133
        CLRR    R2                              ; 537D   01D2
L_537E:
        ADD@    R5,     R2                      ; 537E   02EA
        CMPI    #$0199, R5                      ; 537F   037D 0199
        BLT     L_537E                          ; 5381   0225 0004

        SLR     R2,     2                       ; 5383   0066
        SLR     R2,     1                       ; 5384   0062
        MVI     G_0131, R4                      ; 5385   0284 0131
        MOVR    R4,     R1                      ; 5387   00A1
        ANDI    #$000F, R4                      ; 5388   03BC 000F
        ADDR    R4,     R5                      ; 538A   00E5
        SLR     R1,     2                       ; 538B   0065
        SLR     R1,     2                       ; 538C   0065
        SUBR    R2,     R1                      ; 538D   0111
        BLE     L_5395                          ; 538E   0206 0005

        CLRR    R0                              ; 5390   01C0
L_5391:
        MVO@    R0,     R5                      ; 5391   0268
        DECR    R1                              ; 5392   0011
        BNEQ    L_5391                          ; 5393   022C 0003

L_5395:
        MVI     G_0102, R0                      ; 5395   0280 0102
        TSTR    R0                              ; 5397   0080
        BNEQ    L_5395                          ; 5398   022C 0004

        JSR     R4,     L_5BE7                  ; 539A   0004 0058 03E7

L_539D:
        MVI     G_0103, R0                      ; 539D   0280 0103
        CMPI    #$0002, R0                      ; 539F   0378 0002
        BGT     L_53C6                          ; 53A1   020E 0023

        MVI     G_0104, R1                      ; 53A3   0281 0104
        MVI     G_0118, R2                      ; 53A5   0282 0118
        SWAP    R2,     2                       ; 53A7   0046
        BPL     L_53B6                          ; 53A8   0203 000C

        MVI     G_0317, R3                      ; 53AA   0283 0317
        ANDI    #$01FF, R3                      ; 53AC   03BB 01FF
        MOVR    R1,     R2                      ; 53AE   008A
        SLR     R2,     1                       ; 53AF   0062
        ANDI    #$0002, R2                      ; 53B0   03BA 0002
        SWAP    R2,     1                       ; 53B2   0042
        XORR    R2,     R3                      ; 53B3   01D3
        MVO     R3,     G_0317                  ; 53B4   0243 0317
L_53B6:
        MVI     G_011A, R2                      ; 53B6   0282 011A
        SWAP    R2,     2                       ; 53B8   0046
        BPL     L_53C6                          ; 53B9   0203 000B

        MVI     G_0319, R3                      ; 53BB   0283 0319
        ANDI    #$01FF, R3                      ; 53BD   03BB 01FF
        SLR     R1,     2                       ; 53BF   0065
        ANDI    #$0002, R1                      ; 53C0   03B9 0002
        SWAP    R1,     1                       ; 53C2   0041
        XORR    R1,     R3                      ; 53C3   01CB
        MVO     R3,     G_0319                  ; 53C4   0243 0319
L_53C6:
        CMPI    #$0001, R0                      ; 53C6   0378 0001
        BLT     L_53DA                          ; 53C8   0205 0010
        BNEQ    L_53D9                          ; 53CA   020C 000D

        MVI     G_010A, R1                      ; 53CC   0281 010A
        TSTR    R1                              ; 53CE   0089
        BEQ     L_53D9                          ; 53CF   0204 0008

        MVII    #$0002, R0                      ; 53D1   02B8 0002
        MVO     R0,     G_0103                  ; 53D3   0240 0103
        MVII    #$0001, R0                      ; 53D5   02B8 0001
        MVO     R0,     G_035A                  ; 53D7   0240 035A
L_53D9:
        PULR    R7                              ; 53D9   02B7

L_53DA:
        MVI     G_01C1, R1                      ; 53DA   0281 01C1
        DECR    R1                              ; 53DC   0011
        BMI     L_53F6                          ; 53DD   020B 0017

        MVO     R1,     G_01C1                  ; 53DF   0241 01C1
        MVII    #$02AE, R5                      ; 53E1   02BD 02AE

        JSR     R4,     L_6013                  ; 53E3   0004 0060 0013

        TSTR    R3                              ; 53E6   009B
        BNEQ    L_53EB                          ; 53E7   020C 0002

        MVO     R3,     .BTAB.B1                ; 53E9   0243 02B1
L_53EB:
        MVII    #$000A, R1                      ; 53EB   02B9 000A
        MVII    #$01B3, R2                      ; 53ED   02BA 01B3
        MVO@    R1,     R2                      ; 53EF   0251

        JSR     R5,     L_608A                  ; 53F0   0004 0160 008A
        JSR     R4,     L_5B4A                  ; 53F3   0004 0058 034A

L_53F6:
        PULR    R7                              ; 53F6   02B7

L_53F7:
        MVI     G_0103, R0                      ; 53F7   0280 0103
        CMPI    #$0007, R0                      ; 53F9   0378 0007
        BNEQ    L_5403                          ; 53FB   020C 0006

        MVII    #$016F, R5                      ; 53FD   02BD 016F
L_53FF:
        MVI@    R5,     R0                      ; 53FF   02A8
        TSTR    R0                              ; 5400   0080
        BNEQ    L_5404                          ; 5401   020C 0001
L_5403:
        MOVR    R4,     R7                      ; 5403   00A7

L_5404:
        INCR    R5                              ; 5404   000D
        CMPI    #$018F, R5                      ; 5405   037D 018F
        BLT     L_53FF                          ; 5407   0225 0009

        MVII    #$0008, R0                      ; 5409   02B8 0008
        MVO     R0,     G_0103                  ; 540B   0240 0103
        SDBD                                    ; 540D   0001
        MVII    #$05FF, R0                      ; 540E   02B8 00FF 0005
        MVO     R0,     G_035A                  ; 5411   0240 035A
        CLRR    R0                              ; 5413   01C0
        SDBD                                    ; 5414   0001
        MVII    #$6291, R1                      ; 5415   02B9 0091 0062
        MVII    #$0353, R5                      ; 5418   02BD 0353
        MVO@    R0,     R5                      ; 541A   0268
        MVO@    R1,     R5                      ; 541B   0269
        MVO@    R0,     R5                      ; 541C   0268
        MVO     R0,     G_01B6                  ; 541D   0240 01B6
L_541F:
        NOP                                     ; 541F   0034
        INCR    R5                              ; 5420   000D
        BNEQ    L_541F                          ; 5421   022C 0003

        MVII    #$0200, R3                      ; 5423   02BB 0200
L_5425:
        MVI@    R3,     R0                      ; 5425   0298
        SDBD                                    ; 5426   0001
        ANDI    #$09F8, R0                      ; 5427   03B8 00F8 0009
        MOVR    R0,     R1                      ; 542A   0081
        XOR@    R3,     R1                      ; 542B   03D9
        MOVR    R1,     R2                      ; 542C   008A
        ANDI    #$0007, R1                      ; 542D   03B9 0007
        CMPI    #$0002, R1                      ; 542F   0379 0002
        BLE     L_5435                          ; 5431   0206 0002

        MVII    #$0006, R1                      ; 5433   02B9 0006
L_5435:
        SWAP    R2,     1                       ; 5435   0042
        ANDI    #$0036, R2                      ; 5436   03BA 0036
        BEQ     L_543C                          ; 5438   0204 0002

        MVII    #$0024, R2                      ; 543A   02BA 0024
L_543C:
        SWAP    R2,     1                       ; 543C   0042
        XORR    R2,     R1                      ; 543D   01D1
        XORR    R1,     R0                      ; 543E   01C8
        MVO@    R0,     R3                      ; 543F   0258
        INCR    R3                              ; 5440   000B
        CMPI    #$02F0, R3                      ; 5441   037B 02F0
        BLT     L_5425                          ; 5443   0225 001F

        NEGR    R3                              ; 5445   0023
        SLR     R3,     1                       ; 5446   0063
L_5447:
        DECR    R3                              ; 5447   0013
        BNEQ    L_5447                          ; 5448   022C 0002

        MVII    #$0200, R3                      ; 544A   02BB 0200
L_544C:
        MVI@    R3,     R0                      ; 544C   0298
        SDBD                                    ; 544D   0001
        ANDI    #$09F8, R0                      ; 544E   03B8 00F8 0009
        MOVR    R0,     R1                      ; 5451   0081
        XOR@    R3,     R1                      ; 5452   03D9
        MOVR    R1,     R2                      ; 5453   008A
        ANDI    #$0007, R1                      ; 5454   03B9 0007
        CMPI    #$0002, R1                      ; 5456   0379 0002
        BLE     L_545C                          ; 5458   0206 0002

        MVII    #$0007, R1                      ; 545A   02B9 0007
L_545C:
        SWAP    R2,     1                       ; 545C   0042
        ANDI    #$0036, R2                      ; 545D   03BA 0036
        BEQ     L_5463                          ; 545F   0204 0002

        MVII    #$0026, R2                      ; 5461   02BA 0026
L_5463:
        SWAP    R2,     1                       ; 5463   0042
        XORR    R2,     R1                      ; 5464   01D1
        XORR    R1,     R0                      ; 5465   01C8
        MVO@    R0,     R3                      ; 5466   0258
        INCR    R3                              ; 5467   000B
        CMPI    #$02F0, R3                      ; 5468   037B 02F0
        BLT     L_544C                          ; 546A   0225 001F

        NEGR    R3                              ; 546C   0023
        SLR     R3,     2                       ; 546D   0067
L_546E:
        DECR    R3                              ; 546E   0013
        BNEQ    L_546E                          ; 546F   022C 0002

        COMR    R3                              ; 5471   001B
        MVO     R3,     G_0102                  ; 5472   0243 0102
        MOVR    R4,     R7                      ; 5474   00A7

L_5475:
        PSHR    R4                              ; 5475   0274
        MVII    #$0318, R1                      ; 5476   02B9 0318
L_5478:
        PSHR    R1                              ; 5478   0271
        MVI@    R1,     R0                      ; 5479   0288
        ANDI    #$0300, R0                      ; 547A   03B8 0300
        BEQ     L_54FE                          ; 547C   0204 0080

        MOVR    R1,     R2                      ; 547E   008A
        ADDI    #$0028, R2                      ; 547F   02FA 0028
        MVI@    R2,     R3                      ; 5481   0293
        SDBD                                    ; 5482   0001
        CMPI    #$0600, R3                      ; 5483   037B 0000 0006
        BNEQ    L_54FE                          ; 5486   020C 0076

        SUBI    #$0227, R2                      ; 5488   033A 0227
        MVI@    R2,     R3                      ; 548A   0293
        ANDI    #$0040, R3                      ; 548B   03BB 0040
        BNEQ    L_54FE                          ; 548D   020C 006F

        MVII    #$0002, R2                      ; 548F   02BA 0002
        MVII    #$0007, R3                      ; 5491   02BB 0007

        JSR     R4,     L_5557                  ; 5493   0004 0054 0157

        TSTR    R5                              ; 5496   00AD
        BEQ     L_54FE                          ; 5497   0204 0065

        CMPI    #$0224, R1                      ; 5499   0379 0224
        BEQ     L_54C8                          ; 549B   0204 002B

        CMPI    #$0228, R1                      ; 549D   0379 0228
        BEQ     L_54C8                          ; 549F   0204 0027

        MVII    #$0244, R5                      ; 54A1   02BD 0244
        CMPI    #$0226, R1                      ; 54A3   0379 0226
        BEQ     L_54C2                          ; 54A5   0204 001B

        CMPI    #$0254, R1                      ; 54A7   0379 0254
        BEQ     L_54C2                          ; 54A9   0204 0017

        CMPI    #$0256, R1                      ; 54AB   0379 0256
        BEQ     L_54C2                          ; 54AD   0204 0013

        CMPI    #$025C, R1                      ; 54AF   0379 025C
        BEQ     L_54C2                          ; 54B1   0204 000F

        CMPI    #$025E, R1                      ; 54B3   0379 025E
        BEQ     L_54C2                          ; 54B5   0204 000B

        MVII    #$0248, R5                      ; 54B7   02BD 0248
        CMPI    #$022A, R1                      ; 54B9   0379 022A
        BEQ     L_54C2                          ; 54BB   0204 0005

        CMPI    #$0244, R1                      ; 54BD   0379 0244
        BLT     L_54FE                          ; 54BF   0205 003D
        INCR    R7                              ; 54C1   000F

L_54C2:
        MOVR    R5,     R1                      ; 54C2   00A9
L_54C3:
        MOVR    R1,     R5                      ; 54C3   008D
        ANDI    #$0002, R5                      ; 54C4   03BD 0002
        BNEQ    L_54FE                          ; 54C6   020C 0036

L_54C8:
        MVO@    R1,     R4                      ; 54C8   0261
        PSHR    R2                              ; 54C9   0272
        DECR    R4                              ; 54CA   0014
        MOVR    R4,     R2                      ; 54CB   00A2

        JSR     R5,     L_6084                  ; 54CC   0004 0160 0084

        PULR    R2                              ; 54CF   02B2
        MVI     G_0118, R4                      ; 54D0   0284 0118
        ANDI    #$0040, R4                      ; 54D2   03BC 0040
        BNEQ    L_54DC                          ; 54D4   020C 0006

        SDBD                                    ; 54D6   0001
        MVII    #$61F0, R4                      ; 54D7   02BC 00F0 0061
        MVO     R4,     G_0353                  ; 54DA   0244 0353
L_54DC:
        MVI@    R2,     R4                      ; 54DC   0294
        SDBD                                    ; 54DD   0001
        ANDI    #$F607, R4                      ; 54DE   03BC 0007 00F6
        CMPI    #$0244, R1                      ; 54E1   0379 0244
        BLT     L_54E9                          ; 54E3   0205 0004

        SLL     R1,     2                       ; 54E5   004D
        ADDI    #$0008, R1                      ; 54E6   02F9 0008
        XORR    R1,     R4                      ; 54E8   01CC
L_54E9:
        MVO@    R4,     R2                      ; 54E9   0254

        JSR     R4,     L_557D                  ; 54EA   0004 0054 017D

        MVII    #$0004, R0                      ; 54ED   02B8 0004
        MVII    #$00C1, R2                      ; 54EF   02BA 00C1
        PULR    R1                              ; 54F1   02B1
        PSHR    R1                              ; 54F2   0271
        SUBI    #$0207, R1                      ; 54F3   0339 0207
        MVO@    R0,     R1                      ; 54F5   0248
        ADDI    #$0008, R1                      ; 54F6   02F9 0008
        MVO@    R2,     R1                      ; 54F8   024A
        ADDI    #$0227, R1                      ; 54F9   02F9 0227
        MVII    #$0080, R4                      ; 54FB   02BC 0080
        MVO@    R4,     R1                      ; 54FD   024C
L_54FE:
        PULR    R1                              ; 54FE   02B1
        INCR    R1                              ; 54FF   0009
        CMPI    #$0319, R1                      ; 5500   0379 0319
        BEQ     L_5478                          ; 5502   0224 008B
        PULR    R7                              ; 5504   02B7

L_5505:
        PSHR    R4                              ; 5505   0274
        PSHR    R1                              ; 5506   0271
        ADDI    #$01FF, R1                      ; 5507   02F9 01FF
        MVII    #$0005, R2                      ; 5509   02BA 0005
        MVII    #$0006, R3                      ; 550B   02BB 0006

        JSR     R4,     L_5557                  ; 550D   0004 0054 0157

        TSTR    R5                              ; 5510   00AD
        BEQ     L_5555                          ; 5511   0204 0042

        MVII    #$0001, R5                      ; 5513   02BD 0001
        CMPI    #$022C, R1                      ; 5515   0379 022C
        BEQ     L_5531                          ; 5517   0204 0018

        NEGR    R5                              ; 5519   0025
        CMPI    #$0230, R1                      ; 551A   0379 0230
        BEQ     L_5531                          ; 551C   0204 0013

        MVII    #$0014, R5                      ; 551E   02BD 0014
        CMPI    #$0234, R1                      ; 5520   0379 0234
        BEQ     L_5531                          ; 5522   0204 000D

        CMPI    #$023C, R1                      ; 5524   0379 023C
        BEQ     L_5531                          ; 5526   0204 0009

        NEGR    R5                              ; 5528   0025
        CMPI    #$0238, R1                      ; 5529   0379 0238
        BEQ     L_5531                          ; 552B   0204 0004

        CMPI    #$0240, R1                      ; 552D   0379 0240
        BNEQ    L_5555                          ; 552F   020C 0024

L_5531:
        MVO@    R1,     R4                      ; 5531   0261
        PSHR    R2                              ; 5532   0272
        PSHR    R5                              ; 5533   0275
        DECR    R4                              ; 5534   0014
        MOVR    R4,     R2                      ; 5535   00A2

        JSR     R5,     L_6084                  ; 5536   0004 0160 0084

        PULR    R5                              ; 5539   02B5
        PULR    R2                              ; 553A   02B2
        MVI@    R2,     R1                      ; 553B   0291
        ADDI    #$0008, R1                      ; 553C   02F9 0008
        MVO@    R1,     R2                      ; 553E   0251
        ADDR    R5,     R2                      ; 553F   00EA
        CMPI    #$0200, R2                      ; 5540   037A 0200
        BLT     L_554C                          ; 5542   0205 0008

        CMPI    #$02EF, R2                      ; 5544   037A 02EF
        BGT     L_554C                          ; 5546   020E 0004

        MVI@    R2,     R1                      ; 5548   0291
        ADDI    #$0008, R1                      ; 5549   02F9 0008
        MVO@    R1,     R2                      ; 554B   0251

L_554C:
        JSR     R4,     L_557D                  ; 554C   0004 0054 017D

        TSTR    R5                              ; 554F   00AD
        BPL     L_5554                          ; 5550   0203 0002

        SUBI    #$0002, R4                      ; 5552   033C 0002
L_5554:
        MVO@    R3,     R4                      ; 5554   0263
L_5555:
        PULR    R1                              ; 5555   02B1
        PULR    R7                              ; 5556   02B7

L_5557:
        PSHR    R4                              ; 5557   0274
        CLRR    R5                              ; 5558   01ED
        MVI@    R1,     R0                      ; 5559   0288
        SUBR    R2,     R0                      ; 555A   0110
        SLR     R0,     1                       ; 555B   0060
        SLR     R0,     2                       ; 555C   0064
        ANDI    #$001F, R0                      ; 555D   03B8 001F
        CMPI    #$0014, R0                      ; 555F   0378 0014
        BGE     L_557C                          ; 5561   020D 0019

        ADDI    #$0008, R1                      ; 5563   02F9 0008
        MVI@    R1,     R2                      ; 5565   028A
        SUBR    R3,     R2                      ; 5566   011A
        ANDI    #$0078, R2                      ; 5567   03BA 0078
        MOVR    R2,     R3                      ; 5569   0093
        SLR     R3,     1                       ; 556A   0063
        CMPI    #$0030, R3                      ; 556B   037B 0030
        BGE     L_557C                          ; 556D   020D 000D

        SLL     R2,     1                       ; 556F   004A
        ADDR    R3,     R2                      ; 5570   00DA
        ADDR    R0,     R2                      ; 5571   00C2
        ADDI    #$0200, R2                      ; 5572   02FA 0200
        SUBI    #$016D, R1                      ; 5574   0339 016D
        MOVR    R1,     R4                      ; 5576   008C
        MVI@    R2,     R1                      ; 5577   0291
        SLR     R1,     2                       ; 5578   0065
        ANDI    #$027E, R1                      ; 5579   03B9 027E
        INCR    R5                              ; 557B   000D
L_557C:
        PULR    R7                              ; 557C   02B7

L_557D:
        PSHR    R4                              ; 557D   0274
        SLR     R3,     2                       ; 557E   0067
        MVI     G_0350, R1                      ; 557F   0281 0350
        SWAP    R1,     1                       ; 5581   0041
        SUBI    #$0006, R1                      ; 5582   0339 0006
        ADDR    R3,     R1                      ; 5584   00D9
        MVI     G_012B, R2                      ; 5585   0282 012B
        TSTR    R2                              ; 5587   0092
        BEQ     L_558B                          ; 5588   0204 0001

        INCR    R1                              ; 558A   0009
L_558B:
        ANDI    #$007F, R1                      ; 558B   03B9 007F
        MVI     G_012F, R2                      ; 558D   0282 012F
        MVI     G_034F, R3                      ; 558F   0283 034F
        SWAP    R3,     1                       ; 5591   0043
        ADDR    R0,     R3                      ; 5592   00C3
        SUB     G_012E, R3                      ; 5593   0303 012E
        MVI     G_0128, R0                      ; 5595   0280 0128
        TSTR    R0                              ; 5597   0080
        BNEQ    L_559B                          ; 5598   020C 0001

        DECR    R3                              ; 559A   0013
L_559B:
        ANDI    #$00FF, R3                      ; 559B   03BB 00FF

        JSR     R4,     L_66D2                  ; 559D   0004 0064 02D2

        ADDR    R0,     R3                      ; 55A0   00C3
        MVI     G_035E, R4                      ; 55A1   0284 035E
L_55A3:
        CMP@    R4,     R3                      ; 55A3   0363
        BNEQ    L_55A3                          ; 55A4   022C 0002

        SUB     G_035E, R4                      ; 55A6   0304 035E
        ADDI    #$0132, R4                      ; 55A8   02FC 0132
        MVII    #$0001, R3                      ; 55AA   02BB 0001
        MVO@    R3,     R4                      ; 55AC   0263
        PULR    R7                              ; 55AD   02B7

L_55AE:
        PSHR    R4                              ; 55AE   0274
        MVII    #$010D, R5                      ; 55AF   02BD 010D
        MVI@    R5,     R0                      ; 55B1   02A8
        ANDI    #$00F8, R0                      ; 55B2   03B8 00F8
        BEQ     L_55DE                          ; 55B4   0204 0028

        MVI     G_0105, R0                      ; 55B6   0280 0105
        DECR    R0                              ; 55B8   0010
        BEQ     L_55DE                          ; 55B9   0204 0023

        MVI     G_0118, R0                      ; 55BB   0280 0118
        ANDI    #$0040, R0                      ; 55BD   03B8 0040
        BNEQ    L_55DE                          ; 55BF   020C 001D

        MVII    #$00C1, R0                      ; 55C1   02B8 00C1
        MVO     R0,     G_0118                  ; 55C3   0240 0118
        MVII    #$0018, R0                      ; 55C5   02B8 0018
        MVO     R0,     G_0110                  ; 55C7   0240 0110
        SDBD                                    ; 55C9   0001
        MVII    #$6209, R0                      ; 55CA   02B8 0009 0062
        MVII    #$0353, R4                      ; 55CD   02BC 0353
        MVO@    R0,     R4                      ; 55CF   0260
        CLRR    R0                              ; 55D0   01C0
        MVO@    R0,     R4                      ; 55D1   0260
        MVO@    R0,     R4                      ; 55D2   0260
        MVO     R0,     G_01B5                  ; 55D3   0240 01B5
        MVO     R0,     G_012A                  ; 55D5   0240 012A
        NOP                                     ; 55D7   0034
        MVO     R0,     G_012D                  ; 55D8   0240 012D
        MVO     R0,     G_0129                  ; 55DA   0240 0129
        MVO     R0,     G_012C                  ; 55DC   0240 012C
L_55DE:
        MOVR    R5,     R1                      ; 55DE   00A9
        MVI@    R5,     R0                      ; 55DF   02A8
        SLR     R0,     2                       ; 55E0   0064
        SLR     R0,     1                       ; 55E1   0060
        BEQ     L_564E                          ; 55E2   0204 006A

        ADDI    #$0232, R1                      ; 55E4   02F9 0232
        MVI@    R1,     R2                      ; 55E6   028A
        SWAP    R2,     1                       ; 55E7   0042
        CMPI    #$0006, R2                      ; 55E8   037A 0006
        BNEQ    L_564E                          ; 55EA   020C 0062

        SUBI    #$022F, R1                      ; 55EC   0339 022F
        MVI@    R1,     R2                      ; 55EE   028A
        TSTR    R2                              ; 55EF   0092
        BEQ     L_5652                          ; 55F0   0204 0060

        ADDI    #$0008, R1                      ; 55F2   02F9 0008
        MVI@    R1,     R2                      ; 55F4   028A
        ANDI    #$00C0, R2                      ; 55F5   03BA 00C0
        CMPI    #$0080, R2                      ; 55F7   037A 0080
        BNEQ    L_564E                          ; 55F9   020C 0053

        MVII    #$0003, R2                      ; 55FB   02BA 0003
L_55FD:
        MOVR    R0,     R4                      ; 55FD   0084
        ANDI    #$0001, R4                      ; 55FE   03BC 0001
        BEQ     L_5617                          ; 5600   0204 0015

        MOVR    R2,     R3                      ; 5602   0093
        ADDI    #$0118, R3                      ; 5603   02FB 0118
        MVI@    R3,     R4                      ; 5605   029C
        ANDI    #$00C0, R4                      ; 5606   03BC 00C0
        CMPI    #$0080, R4                      ; 5608   037C 0080
        BNEQ    L_5617                          ; 560A   020C 000B

        ADDI    #$0008, R3                      ; 560C   02FB 0008
        MVI@    R3,     R4                      ; 560E   029C
        CMPI    #$0064, R4                      ; 560F   037C 0064
        BLT     L_5617                          ; 5611   0205 0004

        CMPI    #$0078, R4                      ; 5613   037C 0078
        BLE     L_561F                          ; 5615   0206 0008

L_5617:
        INCR    R2                              ; 5617   000A
        SLR     R0,     1                       ; 5618   0060
        CMPI    #$0007, R2                      ; 5619   037A 0007
        BLE     L_55FD                          ; 561B   0226 001F
        B       L_564E                          ; 561D   0200 002F

L_561F:
        MVII    #$00C1, R2                      ; 561F   02BA 00C1
        MVO@    R2,     R1                      ; 5621   024A
        SUBI    #$0008, R1                      ; 5622   0339 0008
        MVII    #$0004, R2                      ; 5624   02BA 0004
        MVO@    R2,     R1                      ; 5626   024A
        SUBI    #$0008, R3                      ; 5627   033B 0008
        MVII    #$00C1, R2                      ; 5629   02BA 00C1
        MVO@    R2,     R3                      ; 562B   025A
        SUBI    #$0008, R3                      ; 562C   033B 0008
        MVII    #$0024, R2                      ; 562E   02BA 0024
        MVO@    R2,     R3                      ; 5630   025A
        CLRR    R2                              ; 5631   01D2
        ADDI    #$022F, R3                      ; 5632   02FB 022F
        MVO@    R2,     R3                      ; 5634   025A
        ADDI    #$0008, R3                      ; 5635   02FB 0008
        MVO@    R2,     R3                      ; 5637   025A
        SUBI    #$0008, R4                      ; 5638   033C 0008
        ADDI    #$00A2, R1                      ; 563A   02F9 00A2
        MVO@    R4,     R1                      ; 563C   024C
        PSHR    R5                              ; 563D   0275
        MOVR    R1,     R2                      ; 563E   008A

        JSR     R5,     L_6084                  ; 563F   0004 0160 0084

        PULR    R5                              ; 5642   02B5
        ADDI    #$018D, R1                      ; 5643   02F9 018D
        MVII    #$0080, R4                      ; 5645   02BC 0080
        MVO@    R4,     R1                      ; 5647   024C
        SDBD                                    ; 5648   0001
        MVII    #$61F0, R1                      ; 5649   02B9 00F0 0061
        MVO     R1,     G_0353                  ; 564C   0241 0353
L_564E:
        CMPI    #$010F, R5                      ; 564E   037D 010F
        BLE     L_55DE                          ; 5650   0226 0073
L_5652:
        PULR    R7                              ; 5652   02B7

L_5653:
        PSHR    R4                              ; 5653   0274
        MVI     G_0316, R1                      ; 5654   0281 0316
        MVI     G_0103, R4                      ; 5656   0284 0103
        CMPI    #$0006, R4                      ; 5658   037C 0006
        BNEQ    L_5661                          ; 565A   020C 0005

        MVI     G_0359, R0                      ; 565C   0280 0359
        ANDI    #$0001, R0                      ; 565E   03B8 0001
        XORR    R0,     R1                      ; 5660   01C1
L_5661:
        MVI@    R1,     R1                      ; 5661   0289
        CMP     G_0109, R1                      ; 5662   0341 0109
        BNEQ    L_56DE                          ; 5664   020C 0078

        CLRR    R2                              ; 5666   01D2
        CMPI    #$00FF, R1                      ; 5667   0379 00FF
        BEQ     L_5676                          ; 5669   0204 000B

        MVI     G_010A, R2                      ; 566B   0282 010A
        MVO     R1,     G_010A                  ; 566D   0241 010A
        CLRR    R4                              ; 566F   01E4
        MVO     R4,     G_0359                  ; 5670   0244 0359
        CMPI    #$005A, R1                      ; 5672   0379 005A
        BEQ     L_56B7                          ; 5674   0204 0041

L_5676:
        CMPI    #$005A, R2                      ; 5676   037A 005A
        BNEQ    L_5684                          ; 5678   020C 000A

        MVII    #$01BE, R4                      ; 567A   02BC 01BE
        MVII    #$01FB, R5                      ; 567C   02BD 01FB
        MVI@    R5,     R2                      ; 567E   02AA
        MVO@    R2,     R4                      ; 567F   0262
        MVI@    R5,     R2                      ; 5680   02AA
        MVO@    R2,     R4                      ; 5681   0262
        MVI@    R5,     R2                      ; 5682   02AA
        MVO@    R2,     R4                      ; 5683   0262
L_5684:
        MVI     G_0103, R4                      ; 5684   0284 0103
        CMPI    #$0006, R4                      ; 5686   037C 0006
        BEQ     L_56DF                          ; 5688   0204 0055

        CMPI    #$0007, R4                      ; 568A   037C 0007
        BNEQ    L_56DE                          ; 568C   020C 0050

        MVI     G_0118, R4                      ; 568E   0284 0118
        ANDI    #$00C0, R4                      ; 5690   03BC 00C0
        CMPI    #$0080, R4                      ; 5692   037C 0080
        BNEQ    L_56DE                          ; 5694   020C 0048

        SLR     R1,     2                       ; 5696   0065
        SLR     R1,     2                       ; 5697   0065
        SLR     R1,     1                       ; 5698   0061
        ADDR    R7,     R1                      ; 5699   00F9
        ADDI    #$005F, R1                      ; 569A   02F9 005F
        MVI@    R1,     R1                      ; 569C   0289
        MVI     G_010B, R2                      ; 569D   0282 010B
        MVO     R1,     G_010B                  ; 569F   0241 010B
        CMPR    R1,     R2                      ; 56A1   014A
        BEQ     L_56C5                          ; 56A2   0204 0021

        CMPI    #$0001, R1                      ; 56A4   0379 0001
        BLT     L_56C5                          ; 56A6   0205 001D
        BNEQ    L_5743                          ; 56A8   020C 0099

        CLRR    R0                              ; 56AA   01C0
        MVII    #$0006, R2                      ; 56AB   02BA 0006
        SWAP    R2,     1                       ; 56AD   0042
        MVII    #$0014, R5                      ; 56AE   02BD 0014
        SDBD                                    ; 56B0   0001
        MVII    #$61C5, R1                      ; 56B1   02B9 00C5 0061
        B       L_574D                          ; 56B4   0200 0097

L_56B6:
        PSHR    R4                              ; 56B6   0274
L_56B7:
        MVII    #$01BE, R4                      ; 56B7   02BC 01BE
        MVII    #$01FB, R2                      ; 56B9   02BA 01FB
        CLRR    R3                              ; 56BB   01DB
L_56BC:
        MVI@    R2,     R5                      ; 56BC   0295
        MVO@    R3,     R2                      ; 56BD   0253
        MVO@    R5,     R4                      ; 56BE   0265
        INCR    R2                              ; 56BF   000A
        CMPI    #$01C0, R4                      ; 56C0   037C 01C0
        BLE     L_56BC                          ; 56C2   0226 0007
        PULR    R7                              ; 56C4   02B7

L_56C5:
        MVI     G_0109, R1                      ; 56C5   0281 0109
        ANDI    #$001F, R1                      ; 56C7   03B9 001F
        ADDR    R7,     R1                      ; 56C9   00F9
        ADDI    #$0037, R1                      ; 56CA   02F9 0037
        MVI@    R1,     R4                      ; 56CC   028C
        MVI     G_010C, R2                      ; 56CD   0282 010C
        MVO     R4,     G_010C                  ; 56CF   0244 010C
        CMPR    R4,     R2                      ; 56D1   0162
        BEQ     L_56DE                          ; 56D2   0204 000A

        ADDR    R4,     R4                      ; 56D4   00E4
        ADDR    R7,     R4                      ; 56D5   00FC
        ADDI    #$004B, R4                      ; 56D6   02FC 004B
        MVI@    R4,     R2                      ; 56D8   02A2
        MVO     R2,     G_012A                  ; 56D9   0242 012A
        MVI@    R4,     R2                      ; 56DB   02A2
        MVO     R2,     G_012D                  ; 56DC   0242 012D
L_56DE:
        PULR    R7                              ; 56DE   02B7

L_56DF:
        CMPI    #$00B7, R1                      ; 56DF   0379 00B7
        BNEQ    L_56EB                          ; 56E1   020C 0008

        MVI     G_0105, R2                      ; 56E3   0282 0105
L_56E5:
        MVI     G_0316, R1                      ; 56E5   0281 0316
        XORR    R0,     R1                      ; 56E7   01C1
        J       L_50F6                          ; 56E8   0004 0350 00F6

L_56EB:
        CLRR    R2                              ; 56EB   01D2
        SDBD                                    ; 56EC   0001
        MVII    #$51CE, R4                      ; 56ED   02BC 00CE 0051
L_56F0:
        INCR    R2                              ; 56F0   000A
        CMP@    R4,     R1                      ; 56F1   0361
        BEQ     L_56E5                          ; 56F2   0224 000E

        CMPI    #$0007, R2                      ; 56F4   037A 0007
        BNEQ    L_56F0                          ; 56F6   022C 0007
        PULR    R7                              ; 56F8   02B7

        DECLE   $0000,  $0002,  $0001,  $0000   ; 56F9   0000 0002 0001 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 56FD   0002 0000 0000 0000
        DECLE   $0010,  $0010,  $0010,  $000E   ; 5701   0010 0010 0010 000E
        DECLE   $0010,  $0010,  $000A,  $000D   ; 5705   0010 0010 000A 000D
        DECLE   $0010,  $0002,  $0010,  $0001   ; 5709   0010 0002 0010 0001
        DECLE   $0006,  $0005                   ; 570D   0006 0005

        INCR    R1                              ; 570F   0009
        DECR    R0                              ; 5710   0010
        DECR    R0                              ; 5711   0010
        DECR    R0                              ; 5712   0010
        DECR    R0                              ; 5713   0010
        INCR    R7                              ; 5714   000F

        DECR    R0                              ; 5715   0010
L_5716:
        DECR    R0                              ; 5716   0010
        DECLE   $000B,  $000C,  $0010,  $0003   ; 5717   000B 000C 0010 0003
        DECLE   $0010,  $0000,  $0007,  $0004   ; 571B   0010 0000 0007 0004
        DECLE   $0008,  $0010,  $0000,  $00FC   ; 571F   0008 0010 0000 00FC
        DECLE   $0000,  $00FD,  $0001,  $00FE   ; 5723   0000 00FD 0001 00FE
        DECLE   $0003,  $00FF,  $0004,  $0000   ; 5727   0003 00FF 0004 0000
        DECLE   $0003,  $0001,  $0001,  $0002   ; 572B   0003 0001 0001 0002
        DECLE   $0000,  $0003,  $0000,  $0004   ; 572F   0000 0003 0000 0004
        DECLE   $00FF,  $0003,  $00FF,  $0002   ; 5733   00FF 0003 00FF 0002
        DECLE   $00FE,  $0001,  $00FE,  $0000   ; 5737   00FE 0001 00FE 0000
        DECLE   $00FE,  $00FF,  $00FF,  $00FE   ; 573B   00FE 00FF 00FF 00FE
        DECLE   $00FF,  $00FD,  $0000,  $0000   ; 573F   00FF 00FD 0000 0000
L_5743:
        MVII    #$000D, R0                      ; 5743   02B8 000D
        MVII    #$0020, R2                      ; 5745   02BA 0020
        MVII    #$0024, R5                      ; 5747   02BD 0024
        SDBD                                    ; 5749   0001
        MVII    #$61D4, R1                      ; 574A   02B9 00D4 0061
L_574D:
        MOVR    R1,     R4                      ; 574D   008C
        MVII    #$0119, R1                      ; 574E   02B9 0119
        MVI@    R1,     R3                      ; 5750   028B
        ANDI    #$00C0, R3                      ; 5751   03BB 00C0
        BEQ     L_575F                          ; 5753   0204 000A

        INCR    R1                              ; 5755   0009
        MVI@    R1,     R3                      ; 5756   028B
        SWAP    R3,     2                       ; 5757   0047
        BPL     L_575F                          ; 5758   0203 0005

        DECR    R1                              ; 575A   0011
        MVI@    R1,     R3                      ; 575B   028B
        SWAP    R3,     2                       ; 575C   0047
        BMI     L_5794                          ; 575D   020B 0035

L_575F:
        MVO     R4,     G_0353                  ; 575F   0244 0353
        CLRR    R4                              ; 5761   01E4
        MVO     R4,     G_01B5                  ; 5762   0244 01B5
        MVII    #$0082, R3                      ; 5764   02BB 0082
        MVO@    R3,     R1                      ; 5766   024B
        MOVR    R1,     R3                      ; 5767   008B
        SUBI    #$0118, R3                      ; 5768   033B 0118
        MVII    #$0008, R4                      ; 576A   02BC 0008
        ADDR    R4,     R1                      ; 576C   00E1
        MVO@    R5,     R1                      ; 576D   024D
        SUBI    #$0010, R1                      ; 576E   0339 0010
        MVO@    R0,     R1                      ; 5770   0248
        ADDI    #$020F, R1                      ; 5771   02F9 020F
        MVI     G_031F, R0                      ; 5773   0280 031F
        MVO@    R0,     R1                      ; 5775   0248
        ADDR    R4,     R1                      ; 5776   00E1
        SDBD                                    ; 5777   0001
        MVII    #$0987, R0                      ; 5778   02B8 0087 0009
        SLL     R3,     2                       ; 577B   004F
        SLL     R3,     2                       ; 577C   004F
        ADDR    R3,     R0                      ; 577D   00D8
        MVO@    R0,     R1                      ; 577E   0248
        ADDR    R4,     R1                      ; 577F   00E1
        MVI     G_032F, R0                      ; 5780   0280 032F
        MVO@    R0,     R1                      ; 5782   0248
        ADDR    R4,     R1                      ; 5783   00E1
        MVI     G_0337, R0                      ; 5784   0280 0337
        MVO@    R0,     R1                      ; 5786   0248
        ADDR    R4,     R1                      ; 5787   00E1
        MVO@    R2,     R1                      ; 5788   024A
        ADDR    R4,     R1                      ; 5789   00E1
        CLRR    R0                              ; 578A   01C0
        MVO@    R0,     R1                      ; 578B   0248
        SUBI    #$0030, R1                      ; 578C   0339 0030
        MVI     G_0317, R4                      ; 578E   0284 0317
        MVO@    R4,     R1                      ; 5790   024C
        SUBI    #$0165, R1                      ; 5791   0339 0165
        MVO@    R0,     R1                      ; 5793   0248
L_5794:
        B       L_56C5                          ; 5794   0220 00D0

L_5796:
        PSHR    R4                              ; 5796   0274
        MVI     G_0129, R1                      ; 5797   0281 0129
        ADD     G_012A, R1                      ; 5799   02C1 012A
        ANDI    #$00FF, R1                      ; 579B   03B9 00FF
        CMPI    #$0002, R1                      ; 579D   0379 0002
        BLE     L_57A5                          ; 579F   0206 0004

        CMPI    #$0060, R1                      ; 57A1   0379 0060
        BLT     L_57A7                          ; 57A3   0205 0002

L_57A5:
        MVII    #$0002, R1                      ; 57A5   02B9 0002
L_57A7:
        CMPI    #$0041, R1                      ; 57A7   0379 0041
        BLE     L_57AD                          ; 57A9   0206 0002

        MVII    #$0041, R1                      ; 57AB   02B9 0041
L_57AD:
        CMPI    #$0007, R1                      ; 57AD   0379 0007
        BLE     L_57B2                          ; 57AF   0206 0001

        DECR    R1                              ; 57B1   0011
L_57B2:
        MVO     R1,     G_0129                  ; 57B2   0241 0129
        SLL     R1,     1                       ; 57B4   0049
        ADD     G_034F, R1                      ; 57B5   02C1 034F
        MVO     R1,     G_034F                  ; 57B7   0241 034F
        MVI     G_012E, R2                      ; 57B9   0282 012E
        ADD     G_012F, R2                      ; 57BB   02C2 012F
        ADDI    #$0003, R2                      ; 57BD   02FA 0003
        SWAP    R2,     1                       ; 57BF   0042
        CMPR    R2,     R1                      ; 57C0   0151
        BLT     L_57DC                          ; 57C1   0205 0019

        CLRR    R1                              ; 57C3   01C9
        MVO     R1,     G_0103                  ; 57C4   0241 0103
        COMR    R1                              ; 57C6   0019
        MVO     R1,     G_0102                  ; 57C7   0241 0102
        MVII    #$0010, R1                      ; 57C9   02B9 0010
        MVO     R1,     G_035A                  ; 57CB   0241 035A
L_57CD:
        MVI     G_0102, R1                      ; 57CD   0281 0102
        TSTR    R1                              ; 57CF   0089
        BNEQ    L_57CD                          ; 57D0   022C 0004

        JSR     R4,     L_5AAD                  ; 57D2   0004 0058 02AD

L_57D5:
        CLRR    R3                              ; 57D5   01DB
        MVII    #$0002, R1                      ; 57D6   02B9 0002

        JSR     R4,     L_6048                  ; 57D8   0004 0060 0048

        PULR    R7                              ; 57DB   02B7

L_57DC:
        MVI     G_012C, R1                      ; 57DC   0281 012C
        ADD     G_012D, R1                      ; 57DE   02C1 012D
        ANDI    #$00FF, R1                      ; 57E0   03B9 00FF
        BEQ     L_5808                          ; 57E2   0204 0024

        CMPI    #$00D0, R1                      ; 57E4   0379 00D0
        BLT     L_57ED                          ; 57E6   0205 0005

        INCR    R1                              ; 57E8   0009
        ANDI    #$00FF, R1                      ; 57E9   03B9 00FF
        B       L_57F3                          ; 57EB   0200 0006

L_57ED:
        CMPI    #$0080, R1                      ; 57ED   0379 0080
        BLT     L_57FF                          ; 57EF   0205 000E

        MVII    #$00D0, R1                      ; 57F1   02B9 00D0
L_57F3:
        MVO     R1,     G_012C                  ; 57F3   0241 012C
        NEGR    R1                              ; 57F5   0021
        ANDI    #$00FF, R1                      ; 57F6   03B9 00FF
        SLL     R1,     1                       ; 57F8   0049
        SUB     G_0350, R1                      ; 57F9   0301 0350
        NEGR    R1                              ; 57FB   0021
        MVO     R1,     G_0350                  ; 57FC   0241 0350
        PULR    R7                              ; 57FE   02B7

L_57FF:
        CMPI    #$0030, R1                      ; 57FF   0379 0030
        BGT     L_5806                          ; 5801   020E 0003

        DECR    R1                              ; 5803   0011
        B       L_5808                          ; 5804   0200 0002

L_5806:
        MVII    #$0030, R1                      ; 5806   02B9 0030
L_5808:
        MVO     R1,     G_012C                  ; 5808   0241 012C
        SLL     R1,     1                       ; 580A   0049
        ADD     G_0350, R1                      ; 580B   02C1 0350
        MVO     R1,     G_0350                  ; 580D   0241 0350
        PULR    R7                              ; 580F   02B7

L_5810:
        MVI@    R3,     R2                      ; 5810   029A
        SLR     R2,     2                       ; 5811   0066
        ANDR    R0,     R2                      ; 5812   0182
        CMPR    R1,     R2                      ; 5813   014A
        BNEQ    L_581A                          ; 5814   020C 0004

        MVI@    R3,     R2                      ; 5816   029A
        XORI    #$0188, R2                      ; 5817   03FA 0188
        MVO@    R2,     R3                      ; 5819   025A
L_581A:
        INCR    R3                              ; 581A   000B
        DECR    R5                              ; 581B   0015
        BNEQ    L_5810                          ; 581C   022C 000D
        MOVR    R4,     R7                      ; 581E   00A7

L_581F:
        PSHR    R4                              ; 581F   0274
        MVI     G_0104, R3                      ; 5820   0283 0104
        ANDI    #$0007, R3                      ; 5822   03BB 0007
        SLL     R3,     1                       ; 5824   004B
        MOVR    R3,     R2                      ; 5825   009A
        SLL     R3,     2                       ; 5826   004F
        SLL     R3,     2                       ; 5827   004F
        SUBR    R2,     R3                      ; 5828   0113
        ADDI    #$0200, R3                      ; 5829   02FB 0200
        MVII    #$001E, R5                      ; 582B   02BD 001E
        MVII    #$0226, R1                      ; 582D   02B9 0226
        MVII    #$027E, R0                      ; 582F   02B8 027E

        JSR     R4,     L_5810                  ; 5831   0004 0058 0010

        MVI     G_0104, R3                      ; 5834   0283 0104
        ANDI    #$003E, R3                      ; 5836   03BB 003E
        MOVR    R3,     R2                      ; 5838   009A
        SLL     R3,     2                       ; 5839   004F
        SLR     R2,     1                       ; 583A   0062
        SUBR    R2,     R3                      ; 583B   0113
        ADDI    #$0208, R3                      ; 583C   02FB 0208
        MVII    #$0007, R5                      ; 583E   02BD 0007
        MVII    #$022A, R1                      ; 5840   02B9 022A

        JSR     R4,     L_5810                  ; 5842   0004 0058 0010

        MVI     G_0118, R0                      ; 5845   0280 0118
        ANDI    #$0040, R0                      ; 5847   03B8 0040
        BNEQ    L_58EC                          ; 5849   020C 00A1

        MVI     G_0105, R1                      ; 584B   0281 0105
        SUBI    #$0004, R1                      ; 584D   0339 0004
        NEGR    R1                              ; 584F   0021
        ADDI    #$0007, R1                      ; 5850   02F9 0007
        CMPI    #$000A, R1                      ; 5852   0379 000A
        BLT     L_5857                          ; 5854   0205 0001

        DECR    R1                              ; 5856   0011
L_5857:
        MVII    #$0004, R4                      ; 5857   02BC 0004
        MVII    #$013B, R5                      ; 5859   02BD 013B
        MVI     G_0132, R0                      ; 585B   0280 0132
        TSTR    R0                              ; 585D   0080
        BEQ     L_5862                          ; 585E   0204 0002

        MVII    #$0006, R4                      ; 5860   02BC 0006
L_5862:
        MVI@    R5,     R0                      ; 5862   02A8
        TSTR    R0                              ; 5863   0080
        BEQ     L_586A                          ; 5864   0204 0004

        DECR    R4                              ; 5866   0014
        BNEQ    L_5862                          ; 5867   022C 0006

        INCR    R1                              ; 5869   0009
L_586A:
        CMPI    #$0005, R1                      ; 586A   0379 0005
        BGE     L_5870                          ; 586C   020D 0002

        MVII    #$0005, R1                      ; 586E   02B9 0005

L_5870:
        JSR     R4,     L_66EE                  ; 5870   0004 0064 02EE

        MVI     G_0107, R1                      ; 5873   0281 0107
        CMPI    #$000E, R1                      ; 5875   0379 000E
        BLE     L_587B                          ; 5877   0206 0002

        MVII    #$000E, R1                      ; 5879   02B9 000E
L_587B:
        SLL     R1,     1                       ; 587B   0049
        ADDI    #$0003, R1                      ; 587C   02F9 0003
        CMPR    R0,     R1                      ; 587E   0141
        BLE     L_58EC                          ; 587F   0206 006B

        JSR     R4,     L_59EA                  ; 5881   0004 0058 01EA

        MOVR    R0,     R1                      ; 5884   0081
        INCR    R1                              ; 5885   0009
        ADDR    R7,     R1                      ; 5886   00F9
        ADD@    R1,     R7                      ; 5887   02CF

        DECLE   $001F,  $001F                   ; 5888   001F 001F

        MOVR    R4,     R7                      ; 588A   00A7
        SUBR    R2,     R7                      ; 588B   0117

        DECLE   $001F,  $006F,  $001F,  $001F   ; 588C   001F 006F 001F 001F
        DECLE   $006F,  $00AD,  $00AD,  $012D   ; 5890   006F 00AD 00AD 012D
        DECLE   $001F,  $001F                   ; 5894   001F 001F

        TSTR    R5                              ; 5896   00AD
        SUBR    R2,     R1                      ; 5897   0111
        SAR     R3,     2                       ; 5898   006F
        MOVR    R4,     R7                      ; 5899   00A7

        DECLE   $001F,  $011D,  $00AD,  $001F   ; 589A   001F 011D 00AD 001F
        DECLE   $006F,  $001F                   ; 589E   006F 001F

        SUBR    R6,     R3                      ; 58A0   0133
        SUBR    R2,     R7                      ; 58A1   0117

        DECLE   $001F,  $006F,  $00AD,  $006F   ; 58A2   001F 006F 00AD 006F
        DECLE   $001F                           ; 58A6   001F

        SARC    R0,     2                       ; 58A7   007C
        BNOV    L_58BC                          ; 58A8   020A 0012
        BC      L_58B4                          ; 58AA   0201 0008

        MVII    #$0003, R3                      ; 58AC   02BB 0003
        MVII    #$025C, R0                      ; 58AE   02B8 025C
        MVII    #$025E, R1                      ; 58B0   02B9 025E
        B       L_58C0                          ; 58B2   0200 000C

L_58B4:
        MVII    #$0001, R3                      ; 58B4   02BB 0001
        MVII    #$0254, R0                      ; 58B6   02B8 0254
        MVII    #$0256, R1                      ; 58B8   02B9 0256
        B       L_58C0                          ; 58BA   0200 0004

L_58BC:
        MVII    #$0244, R0                      ; 58BC   02B8 0244
        MOVR    R0,     R1                      ; 58BE   0081
        CLRR    R3                              ; 58BF   01DB

L_58C0:
        JSR     R4,     L_59C4                  ; 58C0   0004 0058 01C4

        BNC     L_59B4                          ; 58C3   0209 00EF

        ADDR    R4,     R3                      ; 58C5   00E3
        MOVR    R3,     R1                      ; 58C6   0099
        PSHR    R1                              ; 58C7   0271

        JSR     R4,     L_59F8                  ; 58C8   0004 0058 01F8

        PULR    R4                              ; 58CB   02B4
        ADDR    R4,     R4                      ; 58CC   00E4
        BNEQ    L_58D5                          ; 58CD   020C 0006

        DECR    R5                              ; 58CF   0015
        MVI@    R5,     R2                      ; 58D0   02AA
        SUBI    #$0078, R2                      ; 58D1   033A 0078
        DECR    R5                              ; 58D3   0015
        MVO@    R2,     R5                      ; 58D4   026A
L_58D5:
        ADDR    R7,     R4                      ; 58D5   00FC
        ADDI    #$0017, R4                      ; 58D6   02FC 0017
        ADDI    #$0028, R3                      ; 58D8   02FB 0028
        MVI@    R4,     R0                      ; 58DA   02A0
        SLL     R0,     2                       ; 58DB   004C
        SLL     R0,     2                       ; 58DC   004C
        SLL     R0,     2                       ; 58DD   004C
        MVO@    R0,     R3                      ; 58DE   0258
        ADDI    #$0008, R3                      ; 58DF   02FB 0008
        MVI@    R4,     R0                      ; 58E1   02A0
        SLL     R0,     2                       ; 58E2   004C
        SLL     R0,     2                       ; 58E3   004C
        SLL     R0,     2                       ; 58E4   004C
        MVO@    R0,     R3                      ; 58E5   0258
        SDBD                                    ; 58E6   0001
        MVII    #$6219, R4                      ; 58E7   02BC 0019 0062
        MVO     R4,     G_0354                  ; 58EA   0244 0354
L_58EC:
        PULR    R7                              ; 58EC   02B7

        DECLE   $03EC,  $0000                   ; 58ED   03EC 0000

        XOR@    R6,     R0                      ; 58EF   03F0
        INCR    R0                              ; 58F0   0008
        XOR@    R6,     R2                      ; 58F1   03F2
        INCR    R6                              ; 58F2   000E
        XOR@    R6,     R0                      ; 58F3   03F0
        XORI    #$03F2, R0                      ; 58F4   03F8 03F2
        XOR@    R6,     R2                      ; 58F6   03F2
        MVII    #$0248, R0                      ; 58F7   02B8 0248
        MOVR    R0,     R1                      ; 58F9   0081

        JSR     R4,     L_59C4                  ; 58FA   0004 0058 01C4

        BNC     L_59B4                          ; 58FD   0209 00B5

        MVII    #$0005, R3                      ; 58FF   02BB 0005
        ADDI    #$0013, R5                      ; 5901   02FD 0013
        MVI@    R5,     R0                      ; 5903   02A8
        SLR     R0,     2                       ; 5904   0064
        ANDI    #$027E, R0                      ; 5905   03B8 027E
        CMPR    R0,     R1                      ; 5907   0141
        BNEQ    L_590B                          ; 5908   020C 0001

        INCR    R3                              ; 590A   000B
L_590B:
        SUBI    #$0014, R5                      ; 590B   033D 0014
        MOVR    R3,     R1                      ; 590D   0099
        MOVR    R5,     R3                      ; 590E   00AB
        DECR    R3                              ; 590F   0013
        MVI@    R3,     R4                      ; 5910   029C
        XORI    #$0188, R4                      ; 5911   03FC 0188
        MVO@    R4,     R3                      ; 5913   025C
        CMPI    #$0006, R1                      ; 5914   0379 0006
        BNEQ    L_591E                          ; 5916   020C 0006

        ADDI    #$0014, R3                      ; 5918   02FB 0014
        MVI@    R3,     R4                      ; 591A   029C
        XORI    #$0188, R4                      ; 591B   03FC 0188
        MVO@    R4,     R3                      ; 591D   025C

L_591E:
        JSR     R4,     L_59F8                  ; 591E   0004 0058 01F8

        ADDI    #$0028, R3                      ; 5921   02FB 0028
        SDBD                                    ; 5923   0001
        MVII    #$F880, R0                      ; 5924   02B8 0080 00F8
        MVO@    R0,     R3                      ; 5927   0258
        SDBD                                    ; 5928   0001
        MVII    #$622D, R4                      ; 5929   02BC 002D 0062
        MVO     R4,     G_0354                  ; 592C   0244 0354
        PULR    R7                              ; 592E   02B7

        MVII    #$0224, R0                      ; 592F   02B8 0224
        MVII    #$0007, R1                      ; 5931   02B9 0007
        B       L_59A9                          ; 5933   0200 0074

        SARC    R0,     2                       ; 5935   007C
        BOV     L_593D                          ; 5936   0202 0005

        MVII    #$0244, R0                      ; 5938   02B8 0244
        MOVR    R0,     R1                      ; 593A   0081
        B       L_5949                          ; 593B   0200 000C
L_593D:
        BC      L_5945                          ; 593D   0201 0006

        MVII    #$0254, R0                      ; 593F   02B8 0254
        MVII    #$025C, R1                      ; 5941   02B9 025C
        B       L_5949                          ; 5943   0200 0004

L_5945:
        MVII    #$0256, R1                      ; 5945   02B9 0256
        MVII    #$025E, R0                      ; 5947   02B8 025E

L_5949:
        JSR     R4,     L_59C4                  ; 5949   0004 0058 01C4

        BNC     L_59B4                          ; 594C   0209 0066

        MOVR    R5,     R1                      ; 594E   00A9
        SUBI    #$0201, R1                      ; 594F   0339 0201
        MVII    #$0014, R2                      ; 5951   02BA 0014

        JSR     R4,     L_66DD                  ; 5953   0004 0064 02DD

        INCR    R1                              ; 5956   0009
L_5957:
        SLL     R1,     2                       ; 5957   004D
        SLL     R1,     1                       ; 5958   0049
        SWAP    R1,     1                       ; 5959   0041
        SUB     G_032F, R1                      ; 595A   0301 032F
        BMI     L_59B4                          ; 595C   020B 0056

        INCR    R0                              ; 595E   0008
        SLL     R0,     2                       ; 595F   004C
        SLL     R0,     1                       ; 5960   0048
        SWAP    R0,     1                       ; 5961   0040
        SUB     G_0337, R0                      ; 5962   0300 0337
        PSHR    R0                              ; 5964   0270
        BPL     L_5968                          ; 5965   0203 0001

        NEGR    R0                              ; 5967   0020
L_5968:
        MOVR    R0,     R2                      ; 5968   0082
        MVII    #$0005, R0                      ; 5969   02B8 0005
        SLR     R2,     2                       ; 596B   0066
        BEQ     L_5972                          ; 596C   0204 0004

        SLR     R1,     2                       ; 596E   0065

        JSR     R4,     L_66DD                  ; 596F   0004 0064 02DD

L_5972:
        PULR    R2                              ; 5972   02B2
        MVII    #$0244, R3                      ; 5973   02BB 0244
        CMPI    #$0005, R0                      ; 5975   0378 0005
        BGE     L_598E                          ; 5977   020D 0015

        TSTR    R2                              ; 5979   0092
        BMI     L_5986                          ; 597A   020B 000A

        MVII    #$025C, R3                      ; 597C   02BB 025C
        CMPI    #$0002, R0                      ; 597E   0378 0002
        BGE     L_598E                          ; 5980   020D 000C

        MVII    #$025E, R3                      ; 5982   02BB 025E
        B       L_598E                          ; 5984   0200 0008

L_5986:
        MVII    #$0254, R3                      ; 5986   02BB 0254
        CMPI    #$0002, R0                      ; 5988   0378 0002
        BGE     L_598E                          ; 598A   020D 0002

        MVII    #$0256, R3                      ; 598C   02BB 0256
L_598E:
        DECR    R5                              ; 598E   0015
        MVI@    R5,     R0                      ; 598F   02A8
        SDBD                                    ; 5990   0001
        ANDI    #$3607, R0                      ; 5991   03B8 0007 0036
        SLL     R3,     2                       ; 5994   004F
        XORR    R3,     R0                      ; 5995   01D8
        DECR    R5                              ; 5996   0015
        MVO@    R0,     R5                      ; 5997   0268
        PULR    R7                              ; 5998   02B7

        MVII    #$0244, R0                      ; 5999   02B8 0244
        MVII    #$0008, R1                      ; 599B   02B9 0008
        B       L_59A9                          ; 599D   0200 000A

        MVII    #$024C, R0                      ; 599F   02B8 024C
        MVII    #$0009, R1                      ; 59A1   02B9 0009
        B       L_59A9                          ; 59A3   0200 0004

        MVII    #$0248, R0                      ; 59A5   02B8 0248
        MVII    #$000A, R1                      ; 59A7   02B9 000A
L_59A9:
        PSHR    R1                              ; 59A9   0271
        MOVR    R0,     R1                      ; 59AA   0081

L_59AB:
        JSR     R4,     L_59C4                  ; 59AB   0004 0058 01C4

        PULR    R1                              ; 59AE   02B1
        BNC     L_59B4                          ; 59AF   0209 0003

        JSR     R4,     L_59F8                  ; 59B1   0004 0058 01F8

L_59B4:
        PULR    R7                              ; 59B4   02B7

        MVII    #$0228, R0                      ; 59B5   02B8 0228
        MVII    #$000C, R1                      ; 59B7   02B9 000C
        B       L_59A9                          ; 59B9   0220 0011

        MVII    #$0224, R0                      ; 59BB   02B8 0224
        MVII    #$000B, R1                      ; 59BD   02B9 000B
        PSHR    R1                              ; 59BF   0271
        MVII    #$0228, R1                      ; 59C0   02B9 0228
        B       L_59AB                          ; 59C2   0220 0018

L_59C4:
        PSHR    R4                              ; 59C4   0274
        PSHR    R3                              ; 59C5   0273
        PSHR    R0                              ; 59C6   0270
        PSHR    R1                              ; 59C7   0271
        MVII    #$0007, R1                      ; 59C8   02B9 0007
        PSHR    R2                              ; 59CA   0272

        JSR     R4,     L_66EE                  ; 59CB   0004 0064 02EE

        MOVR    R0,     R5                      ; 59CE   0085
        ADDI    #$0228, R5                      ; 59CF   02FD 0228
        PULR    R2                              ; 59D1   02B2
        PULR    R1                              ; 59D2   02B1
        PULR    R0                              ; 59D3   02B0
        CLRR    R4                              ; 59D4   01E4
L_59D5:
        MVI@    R5,     R3                      ; 59D5   02AB
        SLR     R3,     2                       ; 59D6   0067
        ANDI    #$027E, R3                      ; 59D7   03BB 027E
        CMPR    R0,     R3                      ; 59D9   0143
        BEQ     L_59E4                          ; 59DA   0204 0008

        CMPR    R1,     R3                      ; 59DC   014B
        BEQ     L_59E6                          ; 59DD   0204 0007

        CMPI    #$02C8, R5                      ; 59DF   037D 02C8
        BLT     L_59D5                          ; 59E1   0225 000D

        CLRC                                    ; 59E3   0006
L_59E4:
        PULR    R3                              ; 59E4   02B3
        PULR    R7                              ; 59E5   02B7

L_59E6:
        INCR    R4                              ; 59E6   000C
        SETC                                    ; 59E7   0007
        PULR    R3                              ; 59E8   02B3
        PULR    R7                              ; 59E9   02B7

L_59EA:
        MVII    #$011B, R2                      ; 59EA   02BA 011B
L_59EC:
        MVI@    R2,     R5                      ; 59EC   0295
        ANDI    #$0080, R5                      ; 59ED   03BD 0080
        BEQ     L_59F7                          ; 59EF   0204 0006

        INCR    R2                              ; 59F1   000A
        CMPI    #$011F, R2                      ; 59F2   037A 011F
        BLE     L_59EC                          ; 59F4   0226 0009

        PULR    R4                              ; 59F6   02B4
L_59F7:
        MOVR    R4,     R7                      ; 59F7   00A7

L_59F8:
        PSHR    R4                              ; 59F8   0274
        SLL     R1,     2                       ; 59F9   004D
        ADDR    R7,     R1                      ; 59FA   00F9
        ADDI    #$007E, R1                      ; 59FB   02F9 007E
        MVI@    R1,     R0                      ; 59FD   0288
        MVII    #$0080, R4                      ; 59FE   02BC 0080
        CMPI    #$0060, R0                      ; 5A00   0378 0060
        BLE     L_5A14                          ; 5A02   0206 0010

        CMPI    #$007C, R0                      ; 5A04   0378 007C
        BGE     L_5A14                          ; 5A06   020D 000C

        XORI    #$0024, R4                      ; 5A08   03FC 0024
        CMPI    #$006C, R0                      ; 5A0A   0378 006C
        BEQ     L_5A12                          ; 5A0C   0204 0004

        CMPI    #$0070, R0                      ; 5A0E   0378 0070
        BNEQ    L_5A14                          ; 5A10   020C 0002

L_5A12:
        XORI    #$0005, R4                      ; 5A12   03FC 0005
L_5A14:
        MVO@    R4,     R2                      ; 5A14   0254
        ADDI    #$0008, R2                      ; 5A15   02FA 0008
        MVI     G_01BD, R4                      ; 5A17   0284 01BD
        TSTR    R4                              ; 5A19   00A4
        BEQ     L_5A22                          ; 5A1A   0204 0006

        CMPI    #$0054, R0                      ; 5A1C   0378 0054
        BNEQ    L_5A22                          ; 5A1E   020C 0002

        MVII    #$0004, R0                      ; 5A20   02B8 0004
L_5A22:
        MVO@    R0,     R2                      ; 5A22   0250
        INCR    R1                              ; 5A23   0009
        PSHR    R2                              ; 5A24   0272
        PSHR    R1                              ; 5A25   0271
        MOVR    R5,     R1                      ; 5A26   00A9
        SUBI    #$0201, R1                      ; 5A27   0339 0201
        MVII    #$0014, R2                      ; 5A29   02BA 0014

        JSR     R4,     L_66DD                  ; 5A2B   0004 0064 02DD

        SLL     R1,     2                       ; 5A2E   004D
        SLL     R1,     1                       ; 5A2F   0049
        PULR    R4                              ; 5A30   02B4
        ADD@    R4,     R1                      ; 5A31   02E1
        ANDI    #$00FF, R1                      ; 5A32   03B9 00FF
        SLL     R0,     2                       ; 5A34   004C
        SLL     R0,     1                       ; 5A35   0048
        ADD@    R4,     R0                      ; 5A36   02E0
        ANDI    #$007F, R0                      ; 5A37   03B8 007F
        MVI@    R4,     R2                      ; 5A39   02A2
        MOVR    R2,     R4                      ; 5A3A   0094
        ANDI    #$0007, R4                      ; 5A3B   03BC 0007
        XORR    R4,     R2                      ; 5A3D   01E2
        SLL     R2,     2                       ; 5A3E   004E
        SLL     R2,     2                       ; 5A3F   004E
        XORR    R4,     R2                      ; 5A40   01E2
        MOVR    R2,     R4                      ; 5A41   0094
        SDBD                                    ; 5A42   0001
        ANDI    #$0400, R2                      ; 5A43   03BA 0000 0004
        XORR    R2,     R4                      ; 5A46   01D4
        XORR    R2,     R1                      ; 5A47   01D1
        XORI    #$0300, R1                      ; 5A48   03F9 0300
        PULR    R3                              ; 5A4A   02B3
        PSHR    R1                              ; 5A4B   0271
        ANDI    #$00FF, R1                      ; 5A4C   03B9 00FF
        SWAP    R1,     1                       ; 5A4E   0041
        ADDI    #$020F, R3                      ; 5A4F   02FB 020F
        MVO@    R1,     R3                      ; 5A51   0259
        CLRR    R1                              ; 5A52   01C9
        ADDI    #$0010, R3                      ; 5A53   02FB 0010
        MVO@    R1,     R3                      ; 5A55   0259
        MOVR    R4,     R2                      ; 5A56   00A2
        SDBD                                    ; 5A57   0001
        ANDI    #$0B80, R2                      ; 5A58   03BA 0080 000B
        XORR    R2,     R4                      ; 5A5B   01D4
        XORR    R2,     R0                      ; 5A5C   01D0
        SUBI    #$0020, R3                      ; 5A5D   033B 0020
        MVO@    R0,     R3                      ; 5A5F   0258
        ANDI    #$007F, R0                      ; 5A60   03B8 007F
        SWAP    R0,     1                       ; 5A62   0040
        ADDI    #$0018, R3                      ; 5A63   02FB 0018
        MVO@    R0,     R3                      ; 5A65   0258
        ADDI    #$0010, R3                      ; 5A66   02FB 0010
        MVO@    R1,     R3                      ; 5A68   0259
        SUBI    #$0020, R3                      ; 5A69   033B 0020
        MOVR    R3,     R0                      ; 5A6B   0098
        SUBI    #$0327, R0                      ; 5A6C   0338 0327
        ADDI    #$0098, R0                      ; 5A6E   02F8 0098
        SLL     R0,     2                       ; 5A70   004C
        SLL     R0,     2                       ; 5A71   004C
        XORR    R4,     R0                      ; 5A72   01E0
        MVO@    R0,     R3                      ; 5A73   0258
        PULR    R1                              ; 5A74   02B1
        SUBI    #$0010, R3                      ; 5A75   033B 0010
        MVO@    R1,     R3                      ; 5A77   0259
        PULR    R7                              ; 5A78   02B7

        DECLE   $0054,  $0002,  $000A,  $0104   ; 5A79   0054 0002 000A 0104
        DECLE   $0058,  $0002,  $000C,  $010C   ; 5A7D   0058 0002 000C 010C
        DECLE   $0060,  $0003,  $000E,  $0114   ; 5A81   0060 0003 000E 0114
        DECLE   $0058,  $0002,  $0004,  $018C   ; 5A85   0058 0002 0004 018C
        DECLE   $0060,  $0003,  $0002,  $0194   ; 5A89   0060 0003 0002 0194
        DECLE   $0020,  $00FA,  $0005,  $0164   ; 5A8D   0020 00FA 0005 0164
        DECLE   $007C,  $00FA,  $0009,  $0164   ; 5A91   007C 00FA 0009 0164
        DECLE   $0064,  $0008,  $000A,  $0104   ; 5A95   0064 0008 000A 0104
        DECLE   $0070,  $0002,  $000A,  $0007   ; 5A99   0070 0002 000A 0007
        DECLE   $0074,  $000A,  $000C,  $0104   ; 5A9D   0074 000A 000C 0104
        DECLE   $006C,  $0005                   ; 5AA1   006C 0005

        INCR    R1                              ; 5AA3   0009
        SETC                                    ; 5AA4   0007
        SARC    R0,     1                       ; 5AA5   0078
        INCR    R0                              ; 5AA6   0008
        INCR    R2                              ; 5AA7   000A
        SUBR    R0,     R4                      ; 5AA8   0104
        SAR     R0,     1                       ; 5AA9   0068
        INCR    R0                              ; 5AAA   0008
        INCR    R2                              ; 5AAB   000A
        SUBR    R0,     R4                      ; 5AAC   0104
L_5AAD:
        PSHR    R4                              ; 5AAD   0274
L_5AAE:
        MVII    #$0200, R5                      ; 5AAE   02BD 0200
        MVII    #$000B, R0                      ; 5AB0   02B8 000B
L_5AB2:
        MVII    #$0005, R1                      ; 5AB2   02B9 0005
        MVII    #$001B, R2                      ; 5AB4   02BA 001B
        SWAP    R2,     1                       ; 5AB6   0042
L_5AB7:
        MVO@    R2,     R5                      ; 5AB7   026A
        DECR    R1                              ; 5AB8   0011
        BPL     L_5AB7                          ; 5AB9   0223 0003

        MVII    #$000D, R1                      ; 5ABB   02B9 000D
        MVII    #$0100, R2                      ; 5ABD   02BA 0100
L_5ABF:
        MVO@    R2,     R5                      ; 5ABF   026A
        DECR    R1                              ; 5AC0   0011
        BPL     L_5ABF                          ; 5AC1   0223 0003

        DECR    R0                              ; 5AC3   0010
        BPL     L_5AB2                          ; 5AC4   0223 0013

        SDBD                                    ; 5AC6   0001
        MVII    #$5B66, R4                      ; 5AC7   02BC 0066 005B
        MVI@    R4,     R0                      ; 5ACA   02A0
        INCR    R7                              ; 5ACB   000F

L_5ACC:
        PSHR    R5                              ; 5ACC   0275
L_5ACD:
        MVI@    R4,     R1                      ; 5ACD   02A1
        MOVR    R1,     R5                      ; 5ACE   008D
        ANDI    #$00FF, R5                      ; 5ACF   03BD 00FF
        XORR    R5,     R1                      ; 5AD1   01E9
        ADDI    #$0200, R5                      ; 5AD2   02FD 0200
        XORI    #$0080, R1                      ; 5AD4   03F9 0080
        SLL     R1,     2                       ; 5AD6   004D
        SLL     R1,     2                       ; 5AD7   004D
        XOR@    R4,     R1                      ; 5AD8   03E1
        MVO@    R1,     R5                      ; 5AD9   0269
        DECR    R0                              ; 5ADA   0010
        BNEQ    L_5ACD                          ; 5ADB   022C 000F

        MVI     G_0106, R0                      ; 5ADD   0280 0106
        DECR    R0                              ; 5ADF   0010
        BLE     L_5AFD                          ; 5AE0   0206 001B

        MVII    #$0280, R3                      ; 5AE2   02BB 0280
L_5AE4:
        MOVR    R0,     R2                      ; 5AE4   0082
        CMPI    #$0004, R2                      ; 5AE5   037A 0004
        BLE     L_5AEB                          ; 5AE7   0206 0002

        MVII    #$0004, R2                      ; 5AE9   02BA 0004
L_5AEB:
        SUBR    R2,     R0                      ; 5AEB   0110
        DECR    R2                              ; 5AEC   0012
        SLL     R2,     2                       ; 5AED   004E
        SLL     R2,     1                       ; 5AEE   004A
        SDBD                                    ; 5AEF   0001
        ADDI    #$0891, R2                      ; 5AF0   02FA 0091 0008
        MVO@    R2,     R3                      ; 5AF3   025A
        ADDI    #$0014, R3                      ; 5AF4   02FB 0014
        CMPI    #$02F0, R3                      ; 5AF6   037B 02F0
        BGE     L_5AFD                          ; 5AF8   020D 0003

        TSTR    R0                              ; 5AFA   0080
        BNEQ    L_5AE4                          ; 5AFB   022C 0018

L_5AFD:
        JSR     R4,     L_5B4A                  ; 5AFD   0004 0058 034A

        MVI     G_0107, R1                      ; 5B00   0281 0107
        MVII    #$0236, R5                      ; 5B02   02BD 0236

        JSR     R4,     L_6013                  ; 5B04   0004 0060 0013

        MVII    #$0001, R3                      ; 5B07   02BB 0001
        MVII    #$0003, R1                      ; 5B09   02B9 0003

        JSR     R4,     L_6048                  ; 5B0B   0004 0060 0048

        MVII    #$0008, R4                      ; 5B0E   02BC 0008
        MVO     R4,     G_0121                  ; 5B10   0244 0121
        MVI     G_0105, R4                      ; 5B12   0284 0105
        SDBD                                    ; 5B14   0001
        ADDI    #$5B5E, R4                      ; 5B15   02FC 005E 005B
        MVI@    R4,     R1                      ; 5B18   02A1
        MOVR    R1,     R2                      ; 5B19   008A
        ANDI    #$0007, R2                      ; 5B1A   03BA 0007
        XORR    R2,     R1                      ; 5B1C   01D1
        SWAP    R1,     1                       ; 5B1D   0041
        XORR    R2,     R1                      ; 5B1E   01D1
        XOR     G_0328, R1                      ; 5B1F   03C1 0328
        MVO     R1,     G_0328                  ; 5B21   0241 0328

        JSR     R4,     L_5339                  ; 5B23   0004 0050 0339

        BEQ     L_5B49                          ; 5B26   0204 0021

        MVI     G_0108, R1                      ; 5B28   0281 0108
        MVII    #$02C2, R5                      ; 5B2A   02BD 02C2

        JSR     R4,     L_6013                  ; 5B2C   0004 0060 0013

        MVII    #$0002, R3                      ; 5B2F   02BB 0002
        MVII    #$0004, R1                      ; 5B31   02B9 0004

        JSR     R4,     L_6048                  ; 5B33   0004 0060 0048

        MVI     G_0108, R1                      ; 5B36   0281 0108
        SLR     R1,     1                       ; 5B38   0061
        ADDI    #$0071, R1                      ; 5B39   02F9 0071
        SWAP    R1,     1                       ; 5B3B   0041
        MVO     R1,     G_0331                  ; 5B3C   0241 0331
        MVI     G_0132, R1                      ; 5B3E   0281 0132
        SLL     R1,     1                       ; 5B40   0049
        ADDI    #$0016, R1                      ; 5B41   02F9 0016
        SLL     R1,     2                       ; 5B43   004D
        SLL     R1,     1                       ; 5B44   0049
        ADD     G_0329, R1                      ; 5B45   02C1 0329
        MVO     R1,     G_0329                  ; 5B47   0241 0329
L_5B49:
        PULR    R7                              ; 5B49   02B7

L_5B4A:
        PSHR    R4                              ; 5B4A   0274
        MVI     G_01BC, R1                      ; 5B4B   0281 01BC
        MOVR    R1,     R3                      ; 5B4D   008B
        MVII    #$022E, R5                      ; 5B4E   02BD 022E
        MVII    #$000A, R0                      ; 5B50   02B8 000A

        JSR     R4,     L_6015                  ; 5B52   0004 0060 0015

        MVI     G_0351, R1                      ; 5B55   0281 0351
        NEGR    R3                              ; 5B57   0023
        BNEQ    L_5B5B                          ; 5B58   020C 0001

        MOVR    R1,     R3                      ; 5B5A   008B

L_5B5B:
        JSR     R4,     L_6014                  ; 5B5B   0004 0060 0014

        PULR    R7                              ; 5B5E   02B7

        DECLE   $0010,  $0011,  $0001,  $0005   ; 5B5F   0010 0011 0001 0005

        DECR    R2                              ; 5B63   0012
        EIS                                     ; 5B64   0002
L_5B65:
        DECR    R7                              ; 5B65   0017

        DECLE   $003B,  $0100,  $0234           ; 5B66   003B 0100 0234

        SUBR    R0,     R2                      ; 5B69   0102
        BNEQ    L_5957                          ; 5B6A   022C 0214

        SUBR    R0,     R4                      ; 5B6C   0104
        SUBR    R2,     R5                      ; 5B6D   0115
        BEQ     L_5D86                          ; 5B6E   0204 0216

        SUBR    R0,     R4                      ; 5B70   0104
        SUBR    R2,     R7                      ; 5B71   0117

        DECLE   $020C,  $0228,  $0104,  $0229   ; 5B72   020C 0228 0104 0229
        DECLE   $0104,  $022A,  $0104,  $012B   ; 5B76   0104 022A 0104 012B
        DECLE   $0214,  $023C,  $0104,  $023D   ; 5B7A   0214 023C 0104 023D
        DECLE   $0104,  $013E,  $021C,  $0150   ; 5B7E   0104 013E 021C 0150
        DECLE   $0224,  $0151,  $0214,  $01A1   ; 5B82   0224 0151 0214 01A1
        DECLE   $022C,  $01B4,  $0204,  $02B5   ; 5B86   022C 01B4 0204 02B5
        DECLE   $0104,  $01B6,  $0234,  $02C8   ; 5B8A   0104 01B6 0234 02C8
        DECLE   $0104,  $01C9,  $0224,  $01CA   ; 5B8E   0104 01C9 0224 01CA
        DECLE   $023C,  $01DC,  $021C,  $0104   ; 5B92   023C 01DC 021C 0104
        DECLE   $0308,  $0005                   ; 5B96   0308 0005

        SUBR    R0,     R0                      ; 5B98   0100
        SUBR    R3,     R1                      ; 5B99   0119
        SUB@    R2,     R0                      ; 5B9A   0310
        SUBR    R5,     R5                      ; 5B9B   012D
        SUB@    R3,     R0                      ; 5B9C   0318
        CMPR    R0,     R1                      ; 5B9D   0141
        SUB@    R4,     R0                      ; 5B9E   0320
        CMPR    R2,     R5                      ; 5B9F   0155
        SUB@    R5,     R0                      ; 5BA0   0328
        ANDR    R2,     R1                      ; 5BA1   0191
        CMP@    R3,     R0                      ; 5BA2   0358
        ANDR    R4,     R5                      ; 5BA3   01A5
        CMP@    R2,     R0                      ; 5BA4   0350
        ANDR    R7,     R1                      ; 5BA5   01B9
        CMP@    R1,     R0                      ; 5BA6   0348
        XORR    R1,     R5                      ; 5BA7   01CD
        CMP     G_01E0, R0                      ; 5BA8   0340 01E0
        SUBI    #$00E1, R0                      ; 5BAA   0338 00E1
        SUBR    R0,     R0                      ; 5BAC   0100
        SUBR    R5,     R4                      ; 5BAD   012C
        MVO     R7,     G_013F                  ; 5BAE   0247 013F
        MVO@    R7,     R2                      ; 5BB0   0257
        CMPR    R0,     R0                      ; 5BB1   0140
        MVO@    R7,     R1                      ; 5BB2   024F
        CMPR    R2,     R3                      ; 5BB3   0153
        MVO@    R7,     R4                      ; 5BB4   0267
        CMPR    R2,     R4                      ; 5BB5   0154
        MVO@    R7,     R3                      ; 5BB6   025F
        CMPR    R4,     R6                      ; 5BB7   0166
        PSHR    R7                              ; 5BB8   0277
        CMPR    R4,     R7                      ; 5BB9   0167
        MVO@    R7,     R5                      ; 5BBA   026F
        CMPR    R7,     R0                      ; 5BBB   0178
        MVI@    R1,     R7                      ; 5BBC   028F

        CMPR    R7,     R1                      ; 5BBD   0179
        MVI     G_017A, R7                      ; 5BBE   0287 017A

        DECLE   $027F,  $01CB,  $0247,  $01DE   ; 5BC0   027F 01CB 0247 01DE
        DECLE   $0257,  $01DF,  $024F,  $000B   ; 5BC4   0257 01DF 024F 000B
        DECLE   $0137,  $0024,  $0137,  $0048   ; 5BC8   0137 0024 0137 0048
        DECLE   $0167,  $0058,  $0167,  $005F   ; 5BCC   0167 0058 0167 005F
        DECLE   $0137,  $0082,  $0137,  $0089   ; 5BD0   0137 0082 0137 0089
        DECLE   $0167,  $00BF                   ; 5BD4   0167 00BF

        CMPR    R4,     R7                      ; 5BD6   0167
        ADDR    R1,     R7                      ; 5BD7   00CF

        DECLE   $0167,  $00DA,  $0137,  $00EA   ; 5BD8   0167 00DA 0137 00EA
        DECLE   $0137,  $0015,  $0167,  $0090   ; 5BDC   0137 0015 0167 0090
        DECLE   $0167,  $00B5,  $0167,  $002B   ; 5BE0   0167 00B5 0167 002B
        DECLE   $0137,  $0064,  $0137           ; 5BE4   0137 0064 0137
L_5BE7:
        PSHR    R4                              ; 5BE7   0274
        MVII    #$0200, R5                      ; 5BE8   02BD 0200

L_5BEA:
        JSR     R4,     L_5C8A                  ; 5BEA   0004 005C 008A

        CMPI    #$02F0, R5                      ; 5BED   037D 02F0
        BLT     L_5BEA                          ; 5BEF   0225 0006

        CLRR    R3                              ; 5BF1   01DB
        CLRR    R1                              ; 5BF2   01C9

        JSR     R4,     L_6048                  ; 5BF3   0004 0060 0048

        MVII    #$0010, R4                      ; 5BF6   02BC 0010
        MVO     R4,     G_0120                  ; 5BF8   0244 0120
        PULR    R7                              ; 5BFA   02B7

        INCR    R2                              ; 5BFB   000A
        INCR    R3                              ; 5BFC   000B
        INCR    R4                              ; 5BFD   000C
        INCR    R5                              ; 5BFE   000D
        INCR    R6                              ; 5BFF   000E
        INCR    R7                              ; 5C00   000F

        DECR    R0                              ; 5C01   0010
L_5C02:
        DECR    R1                              ; 5C02   0011
        DECLE   $0012,  $0001,  $0002,  $0003   ; 5C03   0012 0001 0002 0003
        DECLE   $0004,  $0005                   ; 5C07   0004 0005

        CLRC                                    ; 5C09   0006
        SETC                                    ; 5C0A   0007
        INCR    R0                              ; 5C0B   0008
        INCR    R1                              ; 5C0C   0009
        DECR    R3                              ; 5C0D   0013
        DECR    R4                              ; 5C0E   0014
        DECR    R5                              ; 5C0F   0015
        DECR    R6                              ; 5C10   0016
L_5C11:
        DECR    R7                              ; 5C11   0017

        DECLE   $0018,  $0019,  $001A,  $001D   ; 5C12   0018 0019 001A 001D
        DECLE   $001E,  $001B,  $001C,  $0021   ; 5C16   001E 001B 001C 0021
        DECLE   $0022,  $001F,  $0020,  $0023   ; 5C1A   0022 001F 0020 0023
        DECLE   $0024,  $0025,  $0026,  $0027   ; 5C1E   0024 0025 0026 0027

        ADCR    R0                              ; 5C22   0028
        ADCR    R5                              ; 5C23   002D
        ADCR    R6                              ; 5C24   002E
        ADCR    R3                              ; 5C25   002B
        ADCR    R4                              ; 5C26   002C
        ADCR    R1                              ; 5C27   0029
L_5C28:
        PSHR    R4                              ; 5C28   0274
        PSHR    R0                              ; 5C29   0270
        PSHR    R1                              ; 5C2A   0271
        PSHR    R3                              ; 5C2B   0273
        SUB     G_012E, R3                      ; 5C2C   0303 012E
        BMI     L_5C8E                          ; 5C2E   020B 005E

        CMP     G_012F, R3                      ; 5C30   0343 012F
        BGE     L_5C8E                          ; 5C32   020D 005A

        CMP     G_0130, R1                      ; 5C34   0341 0130
        BGE     L_5C8E                          ; 5C36   020D 0056

        MOVR    R0,     R4                      ; 5C38   0084
        CMP     G_035B, R0                      ; 5C39   0340 035B
        BLT     L_5C40                          ; 5C3B   0205 0003

        SUB     G_035C, R0                      ; 5C3D   0300 035C
        NEGR    R0                              ; 5C3F   0020
L_5C40:
        ADDR    R3,     R4                      ; 5C40   00DC
        ADDR    R0,     R3                      ; 5C41   00C3
        MOVR    R4,     R0                      ; 5C42   00A0
        ADD     G_035D, R3                      ; 5C43   02C3 035D
        MVI@    R3,     R2                      ; 5C45   029A
        ANDI    #$000F, R2                      ; 5C46   03BA 000F
        BEQ     L_5C8E                          ; 5C48   0204 0044

        MOVR    R2,     R1                      ; 5C4A   0091
        SLL     R2,     1                       ; 5C4B   004A
        SDBD                                    ; 5C4C   0001
        ADDI    #$6990, R2                      ; 5C4D   02FA 0090 0069
        XOR@    R3,     R1                      ; 5C50   03D9
        BEQ     L_5C84                          ; 5C51   0204 0031

        SLR     R1,     2                       ; 5C53   0065
        CMP     G_035B, R4                      ; 5C54   0344 035B
        BLT     L_5C5F                          ; 5C56   0205 0007

        SLR     R1,     2                       ; 5C58   0065
        SDBD                                    ; 5C59   0001
        ADDI    #$5BFA, R1                      ; 5C5A   02F9 00FA 005B
        MVI@    R1,     R1                      ; 5C5D   0289
        SLL     R1,     2                       ; 5C5E   004D
L_5C5F:
        SLL     R1,     1                       ; 5C5F   0049
        CMPI    #$0098, R1                      ; 5C60   0379 0098
        BLT     L_5C7E                          ; 5C62   0205 001A

        MVI     G_035E, R4                      ; 5C64   0284 035E
        CMPI    #$00F8, R1                      ; 5C66   0379 00F8
        BGE     L_5C6C                          ; 5C68   020D 0002

        ADDI    #$003C, R4                      ; 5C6A   02FC 003C
L_5C6C:
        CMP@    R4,     R0                      ; 5C6C   0360
        BNEQ    L_5C6C                          ; 5C6D   022C 0002

        SUB     G_035E, R4                      ; 5C6F   0304 035E
        ADDI    #$0132, R4                      ; 5C71   02FC 0132
        MVI@    R4,     R0                      ; 5C73   02A0
        TSTR    R0                              ; 5C74   0080
        BEQ     L_5C7E                          ; 5C75   0204 0007

        CMPI    #$00A8, R1                      ; 5C77   0379 00A8
        BGT     L_5C80                          ; 5C79   020E 0005

        CLRR    R1                              ; 5C7B   01C9
        B       L_5C84                          ; 5C7C   0200 0006

L_5C7E:
        SUBI    #$0008, R1                      ; 5C7E   0339 0008
L_5C80:
        SDBD                                    ; 5C80   0001
        XORI    #$0800, R1                      ; 5C81   03F9 0000 0008
L_5C84:
        MOVR    R2,     R4                      ; 5C84   0094
        SDBD                                    ; 5C85   0001
        XOR@    R4,     R1                      ; 5C86   03E1
        MVO@    R1,     R5                      ; 5C87   0269
        B       L_5CA5                          ; 5C88   0200 001B

L_5C8A:
        PSHR    R4                              ; 5C8A   0274
        PSHR    R0                              ; 5C8B   0270
        PSHR    R1                              ; 5C8C   0271
        PSHR    R3                              ; 5C8D   0273
L_5C8E:
        MVI     G_0352, R0                      ; 5C8E   0280 0352
        XORR    R5,     R0                      ; 5C90   01E8
        SLL     R0,     2                       ; 5C91   004C
        XORR    R5,     R0                      ; 5C92   01E8
        SLR     R0,     2                       ; 5C93   0064
        ANDI    #$001F, R0                      ; 5C94   03B8 001F
        SDBD                                    ; 5C96   0001
        MVII    #$084F, R3                      ; 5C97   02BB 004F 0008
        DECR    R0                              ; 5C9A   0010
        BEQ     L_5CA4                          ; 5C9B   0204 0007

        SUBI    #$0048, R3                      ; 5C9D   033B 0048
        CMPI    #$0007, R0                      ; 5C9F   0378 0007
        BEQ     L_5CA4                          ; 5CA1   0204 0001

        CLRR    R3                              ; 5CA3   01DB
L_5CA4:
        MVO@    R3,     R5                      ; 5CA4   026B
L_5CA5:
        PULR    R3                              ; 5CA5   02B3
        PULR    R1                              ; 5CA6   02B1
        PULR    R0                              ; 5CA7   02B0
        PULR    R7                              ; 5CA8   02B7

        DIS                                     ; 5CA9   0003
        CLRR    R5                              ; 5CAA   01ED
        MVO     R5,     .STIC.MODE              ; 5CAB   0245 0021
        MVI     G_0102, R0                      ; 5CAD   0280 0102
        INCR    R0                              ; 5CAF   0008
        MVO     R0,     G_0102                  ; 5CB0   0240 0102
        CMPI    #$0100, R0                      ; 5CB2   0378 0100
        BEQ     L_5D42                          ; 5CB4   0204 008C

        MVO     R5,     .STIC.BORD              ; 5CB6   0245 002C
        MVI     G_010A, R1                      ; 5CB8   0281 010A
        CMPI    #$005A, R1                      ; 5CBA   0379 005A
        BEQ     L_5D33                          ; 5CBC   0204 0075

        CMPI    #$0002, R0                      ; 5CBE   0378 0002
        BLT     L_5CC6                          ; 5CC0   0205 0004
        BEQ     L_5DEC                          ; 5CC2   0204 0128
        B       L_5D2D                          ; 5CC4   0200 0067

L_5CC6:
        MVO     R5,     .STIC.VIDEN             ; 5CC6   0245 0020
        SLL     R0,     2                       ; 5CC8   004C
        MVII    #$0317, R4                      ; 5CC9   02BC 0317
L_5CCB:
        MVI@    R4,     R1                      ; 5CCB   02A1
        MVO@    R1,     R5                      ; 5CCC   0269
        MVI@    R4,     R1                      ; 5CCD   02A1
        MVO@    R1,     R5                      ; 5CCE   0269
        MVI@    R4,     R1                      ; 5CCF   02A1
        MVO@    R1,     R5                      ; 5CD0   0269
        MVI@    R4,     R1                      ; 5CD1   02A1
        MVO@    R1,     R5                      ; 5CD2   0269
        MVI@    R4,     R1                      ; 5CD3   02A1
        MVO@    R1,     R5                      ; 5CD4   0269
        MVI@    R4,     R1                      ; 5CD5   02A1
        MVO@    R1,     R5                      ; 5CD6   0269
        DECR    R0                              ; 5CD7   0010
        BNEQ    L_5CCB                          ; 5CD8   022C 000E

        SDBD                                    ; 5CDA   0001
        MVII    #$3980, R5                      ; 5CDB   02BD 0080 0039
        MVII    #$0120, R3                      ; 5CDE   02BB 0120
        SDBD                                    ; 5CE0   0001
        MVII    #$645A, R2                      ; 5CE1   02BA 005A 0064
        DECR    R0                              ; 5CE4   0010
L_5CE5:
        MVI@    R3,     R4                      ; 5CE5   029C
        ADDR    R4,     R4                      ; 5CE6   00E4
        ADDR    R2,     R4                      ; 5CE7   00D4
        NEGR    R0                              ; 5CE8   0020
L_5CE9:
        MVI@    R4,     R1                      ; 5CE9   02A1
        MVO@    R1,     R5                      ; 5CEA   0269
        MVI@    R4,     R1                      ; 5CEB   02A1
        MVO@    R1,     R5                      ; 5CEC   0269
        MVI@    R4,     R1                      ; 5CED   02A1
        MVO@    R1,     R5                      ; 5CEE   0269
        MVI@    R4,     R1                      ; 5CEF   02A1
        MVO@    R1,     R5                      ; 5CF0   0269
        MVI@    R4,     R1                      ; 5CF1   02A1
        MVO@    R1,     R5                      ; 5CF2   0269
        MVI@    R4,     R1                      ; 5CF3   02A1
        MVO@    R1,     R5                      ; 5CF4   0269
        MVI@    R4,     R1                      ; 5CF5   02A1
        MVO@    R1,     R5                      ; 5CF6   0269
        MVI@    R4,     R1                      ; 5CF7   02A1
        MVO@    R1,     R5                      ; 5CF8   0269
        DECR    R0                              ; 5CF9   0010
        BEQ     L_5CE9                          ; 5CFA   0224 0012

        INCR    R3                              ; 5CFC   000B
        CMPI    #$0128, R3                      ; 5CFD   037B 0128
        BNEQ    L_5CE5                          ; 5CFF   022C 001B

        MVI     G_0103, R0                      ; 5D01   0280 0103
        AND     G_0104, R0                      ; 5D03   0380 0104
        CMPI    #$0007, R0                      ; 5D05   0378 0007
        BNEQ    L_5D2D                          ; 5D07   020C 0024

        MOVR    R5,     R1                      ; 5D09   00A9
        SUBI    #$0129, R1                      ; 5D0A   0339 0129
        MVI@    R1,     R2                      ; 5D0C   028A
        XORI    #$000C, R2                      ; 5D0D   03FA 000C
        MVO@    R2,     R1                      ; 5D0F   024A
        ADDI    #$0009, R1                      ; 5D10   02F9 0009
        MVI@    R1,     R2                      ; 5D12   028A
        XORI    #$000C, R2                      ; 5D13   03FA 000C
        MVO@    R2,     R1                      ; 5D15   024A
        ADDI    #$0053, R1                      ; 5D16   02F9 0053
        MVI@    R1,     R2                      ; 5D18   028A
        XORI    #$0008, R2                      ; 5D19   03FA 0008
        MVO@    R2,     R1                      ; 5D1B   024A
        INCR    R1                              ; 5D1C   0009
        MVI@    R1,     R2                      ; 5D1D   028A
        XORI    #$0008, R2                      ; 5D1E   03FA 0008
        MVO@    R2,     R1                      ; 5D20   024A
        ADDI    #$000D, R1                      ; 5D21   02F9 000D
        MVI@    R1,     R2                      ; 5D23   028A
        XORI    #$0008, R2                      ; 5D24   03FA 0008
        MVO@    R2,     R1                      ; 5D26   024A
        ADDI    #$0025, R1                      ; 5D27   02F9 0025
        MVI@    R1,     R2                      ; 5D29   028A
        XORI    #$0008, R2                      ; 5D2A   03FA 0008
        MVO@    R2,     R1                      ; 5D2C   024A
L_5D2D:
        CLRR    R0                              ; 5D2D   01C0
        MVO     R0,     .STIC.VIDEN             ; 5D2E   0240 0020

L_5D30:
        JSR     R4,     L_60AC                  ; 5D30   0004 0060 00AC

L_5D33:
        PULR    R5                              ; 5D33   02B5
        PULR    R4                              ; 5D34   02B4
        PULR    R3                              ; 5D35   02B3
        PULR    R2                              ; 5D36   02B2
        PULR    R1                              ; 5D37   02B1
        PULR    R0                              ; 5D38   02B0
        RSWD    R0                              ; 5D39   0038
        PULR    R0                              ; 5D3A   02B0
        EIS                                     ; 5D3B   0002
        PULR    R7                              ; 5D3C   02B7

        CLRR    R0                              ; 5D3D   01C0
        MVO     R0,     .STIC.VIDEN             ; 5D3E   0240 0020
        B       L_5D33                          ; 5D40   0220 000E

L_5D42:
        MVI     G_0103, R0                      ; 5D42   0280 0103
        SLL     R0,     1                       ; 5D44   0048
        MVI     G_035A, R1                      ; 5D45   0281 035A
        ADDR    R0,     R7                      ; 5D47   00C7
        B       L_5D9C                          ; 5D48   0200 0052
        B       L_5D33                          ; 5D4A   0220 0018
        B       L_5D33                          ; 5D4C   0220 001A
        B       L_5D33                          ; 5D4E   0220 001C
        B       L_5D7C                          ; 5D50   0200 002A
        B       L_5D33                          ; 5D52   0220 0020
        B       L_5D33                          ; 5D54   0220 0022
        B       L_5DE0                          ; 5D56   0200 0088

        MOVR    R1,     R2                      ; 5D58   008A
        SWAP    R2,     1                       ; 5D59   0042
        ANDI    #$0007, R2                      ; 5D5A   03BA 0007
        SLL     R2,     2                       ; 5D5C   004E
        ADDR    R2,     R7                      ; 5D5D   00D7

        ANDI    #$0000, R1                      ; 5D5E   03B9 0000
        B       L_5D74                          ; 5D60   0200 0012

        ANDI    #$0002, R1                      ; 5D62   03B9 0002
        B       L_5D96                          ; 5D64   0200 0030

        SLR     R1,     1                       ; 5D66   0061
        NOP                                     ; 5D67   0034
        NOP                                     ; 5D68   0034
        NOP                                     ; 5D69   0034
        ANDI    #$0001, R1                      ; 5D6A   03B9 0001
        B       L_5D74                          ; 5D6C   0200 0006

        ANDI    #$000B, R1                      ; 5D6E   03B9 000B
        B       L_5D74                          ; 5D70   0200 0002

        ANDI    #$0003, R1                      ; 5D72   03B9 0003
L_5D74:
        MVII    #$00FF, R0                      ; 5D74   02B8 00FF
        MVO     R0,     G_0102                  ; 5D76   0240 0102
        MVO     R1,     .STIC.BORD              ; 5D78   0241 002C
        B       L_5D30                          ; 5D7A   0220 004B

L_5D7C:
        MOVR    R1,     R2                      ; 5D7C   008A
        SWAP    R2,     1                       ; 5D7D   0042
        ANDI    #$0007, R2                      ; 5D7E   03BA 0007
        SLL     R2,     2                       ; 5D80   004E
        ADDR    R2,     R7                      ; 5D81   00D7

        ANDI    #$0000, R1                      ; 5D82   03B9 0000
        B       L_5D74                          ; 5D84   0220 0011

L_5D86:
        ANDI    #$0002, R1                      ; 5D86   03B9 0002
        B       L_5D96                          ; 5D88   0200 000C

        ANDI    #$0002, R1                      ; 5D8A   03B9 0002
        B       L_5D74                          ; 5D8C   0220 0019

        ANDI    #$0006, R1                      ; 5D8E   03B9 0006
        B       L_5D74                          ; 5D90   0220 001D

        ANDI    #$000A, R1                      ; 5D92   03B9 000A
        B       L_5D74                          ; 5D94   0220 0021
L_5D96:
        BEQ     L_5D74                          ; 5D96   0224 0023

        MVII    #$000F, R1                      ; 5D98   02B9 000F
        B       L_5D74                          ; 5D9A   0220 0027

L_5D9C:
        JSR     R4,     L_6063                  ; 5D9C   0004 0060 0063

        MVO     R0,     .STIC.EDGE              ; 5D9F   0240 0032

        JSR     R4,     L_6326                  ; 5DA1   0004 0060 0326

        MVII    #$0353, R4                      ; 5DA4   02BC 0353
        SDBD                                    ; 5DA6   0001
        MVII    #$6279, R0                      ; 5DA7   02B8 0079 0062
        MVO@    R0,     R4                      ; 5DAA   0260
        MVO@    R1,     R4                      ; 5DAB   0261
        MVO@    R1,     R4                      ; 5DAC   0261
        MVO     R1,     G_01B5                  ; 5DAD   0241 01B5
        MVI     G_0106, R0                      ; 5DAF   0280 0106
        DECR    R0                              ; 5DB1   0010
        BMI     L_5DD6                          ; 5DB2   020B 0022

        MVI     G_0133, R0                      ; 5DB4   0280 0133
        ADD     G_0135, R0                      ; 5DB6   02C0 0135
        ADD     G_0137, R0                      ; 5DB8   02C0 0137
        ADD     G_0139, R0                      ; 5DBA   02C0 0139
        ADDR    R0,     R0                      ; 5DBC   00C0
        ADD     G_0108, R0                      ; 5DBD   02C0 0108
        SUB     G_0105, R0                      ; 5DBF   0300 0105
        SUBI    #$0008, R0                      ; 5DC1   0338 0008
        BPL     L_5DC6                          ; 5DC3   0203 0001

        CLRR    R0                              ; 5DC5   01C0
L_5DC6:
        MVO     R0,     G_0108                  ; 5DC6   0240 0108
        BNEQ    L_5D33                          ; 5DC8   022C 0096

        MVII    #$018F, R4                      ; 5DCA   02BC 018F
L_5DCC:
        MVI@    R4,     R0                      ; 5DCC   02A0
        TSTR    R0                              ; 5DCD   0080
        BEQ     L_5DD6                          ; 5DCE   0204 0006

        CMPI    #$0199, R4                      ; 5DD0   037C 0199
        BLT     L_5DCC                          ; 5DD2   0225 0007
        B       L_5D33                          ; 5DD4   0220 00A2

L_5DD6:
        MVII    #$0009, R0                      ; 5DD6   02B8 0009
        MVO     R0,     G_0103                  ; 5DD8   0240 0103
        MVII    #$0001, R0                      ; 5DDA   02B8 0001
        MVO     R0,     G_035A                  ; 5DDC   0240 035A
        B       L_5D33                          ; 5DDE   0220 00AC

L_5DE0:
        JSR     R4,     L_6063                  ; 5DE0   0004 0060 0063

        MVII    #$0003, R0                      ; 5DE3   02B8 0003
        MVO     R0,     .STIC.EDGE              ; 5DE5   0240 0032

        JSR     R4,     L_6310                  ; 5DE7   0004 0060 0310

        B       L_5D33                          ; 5DEA   0220 00B8

L_5DEC:
        SUB     G_01BB, R0                      ; 5DEC   0300 01BB
        MVO     R0,     G_0102                  ; 5DEE   0240 0102
        CMPI    #$0002, R0                      ; 5DF0   0378 0002
        BNEQ    L_5D2D                          ; 5DF2   022C 00C6

        MVII    #$0018, R5                      ; 5DF4   02BD 0018
        CLRR    R2                              ; 5DF6   01D2
        MVII    #$010D, R4                      ; 5DF7   02BC 010D
        MVI@    R5,     R0                      ; 5DF9   02A8
        MVO@    R0,     R4                      ; 5DFA   0260
        DECR    R5                              ; 5DFB   0015
        MVO@    R2,     R5                      ; 5DFC   026A
        MVI@    R5,     R0                      ; 5DFD   02A8
        MVO@    R0,     R4                      ; 5DFE   0260
        DECR    R5                              ; 5DFF   0015
        MVO@    R2,     R5                      ; 5E00   026A
        MVI@    R5,     R0                      ; 5E01   02A8
        MVO@    R0,     R4                      ; 5E02   0260
        DECR    R5                              ; 5E03   0015
        MVO@    R2,     R5                      ; 5E04   026A
        MVI     G_0103, R1                      ; 5E05   0281 0103
        CMPI    #$0007, R1                      ; 5E07   0379 0007
        BNEQ    L_5D2D                          ; 5E09   022C 00DD

        MVI     G_0128, R1                      ; 5E0B   0281 0128
        SUB     G_0129, R1                      ; 5E0D   0301 0129
        MOVR    R1,     R0                      ; 5E0F   0088
        ANDI    #$007F, R1                      ; 5E10   03B9 007F
        MVO     R1,     G_0128                  ; 5E12   0241 0128
        SLR     R1,     2                       ; 5E14   0065
        SLR     R1,     2                       ; 5E15   0065
        MVO     R1,     .STIC.HDLY              ; 5E16   0241 0030
        NEGR    R1                              ; 5E18   0021
        ADDI    #$0330, R1                      ; 5E19   02F9 0330
        MVO     R1,     .STIC.X.0               ; 5E1B   0241 0000
        MVO     R1,     G_0317                  ; 5E1D   0241 0317
        MVI     G_012B, R1                      ; 5E1F   0281 012B
        MVI     G_012C, R2                      ; 5E21   0282 012C
        SUBR    R2,     R1                      ; 5E23   0111
        MOVR    R1,     R3                      ; 5E24   008B
        ANDI    #$007F, R3                      ; 5E25   03BB 007F
        MVO     R3,     G_012B                  ; 5E27   0243 012B
        SLR     R3,     2                       ; 5E29   0067
        SLR     R3,     2                       ; 5E2A   0067
        MVO     R3,     .STIC.VDLY              ; 5E2B   0243 0031
        NEGR    R3                              ; 5E2D   0023
        ADDI    #$003A, R3                      ; 5E2E   02FB 003A
        MVI     G_031F, R4                      ; 5E30   0284 031F
        ANDI    #$0380, R4                      ; 5E32   03BC 0380
        XORR    R3,     R4                      ; 5E34   01DC
        MVO     R4,     .STIC.Y.0               ; 5E35   0244 0008
        MVO     R4,     G_031F                  ; 5E37   0244 031F
        SWAP    R0,     2                       ; 5E39   0044
        BPL     L_5E4E                          ; 5E3A   0203 0012

        MVII    #$0001, R3                      ; 5E3C   02BB 0001
L_5E3E:
        MVI@    R3,     R4                      ; 5E3E   029C
        ANDI    #$00FF, R4                      ; 5E3F   03BC 00FF
        MOVR    R4,     R5                      ; 5E41   00A5
        XOR@    R3,     R4                      ; 5E42   03DC
        SUBI    #$0008, R5                      ; 5E43   033D 0008
        ANDI    #$00FF, R5                      ; 5E45   03BD 00FF
        ADDR    R5,     R4                      ; 5E47   00EC
        MVO@    R4,     R3                      ; 5E48   025C
        INCR    R3                              ; 5E49   000B
        CMPI    #$0007, R3                      ; 5E4A   037B 0007
        BLE     L_5E3E                          ; 5E4C   0226 000F

L_5E4E:
        SWAP    R1,     2                       ; 5E4E   0045
        BPL     L_5E74                          ; 5E4F   0203 0023

        MVII    #$0008, R5                      ; 5E51   02BD 0008
        SWAP    R2,     2                       ; 5E53   0046
        BMI     L_5E57                          ; 5E54   020B 0001

        NEGR    R5                              ; 5E56   0025
L_5E57:
        MVII    #$0320, R3                      ; 5E57   02BB 0320
L_5E59:
        MVI@    R3,     R4                      ; 5E59   029C
        ANDI    #$007F, R4                      ; 5E5A   03BC 007F
        MOVR    R4,     R2                      ; 5E5C   00A2
        XOR@    R3,     R4                      ; 5E5D   03DC
        ADDR    R5,     R2                      ; 5E5E   00EA
        ANDI    #$007F, R2                      ; 5E5F   03BA 007F
        ADDR    R2,     R4                      ; 5E61   00D4
        MVO@    R4,     R3                      ; 5E62   025C
        SUBI    #$0317, R3                      ; 5E63   033B 0317
        MVO@    R4,     R3                      ; 5E65   025C
        ADDI    #$032F, R3                      ; 5E66   02FB 032F
        MVI@    R3,     R4                      ; 5E68   029C
        ANDI    #$00FF, R4                      ; 5E69   03BC 00FF
        SWAP    R2,     1                       ; 5E6B   0042
        ADDR    R2,     R4                      ; 5E6C   00D4
        MVO@    R4,     R3                      ; 5E6D   025C
        SUBI    #$0017, R3                      ; 5E6E   033B 0017
        CMPI    #$0326, R3                      ; 5E70   037B 0326
        BLE     L_5E59                          ; 5E72   0226 001A

L_5E74:
        CLRR    R2                              ; 5E74   01D2
        MVO     R2,     .STIC.VIDEN             ; 5E75   0242 0020
        EIS                                     ; 5E77   0002
        PSHR    R1                              ; 5E78   0271
        PSHR    R5                              ; 5E79   0275
        PSHR    R0                              ; 5E7A   0270
        TSTR    R1                              ; 5E7B   0089
        BPL     L_5F34                          ; 5E7C   0203 00B6

        TSTR    R5                              ; 5E7E   00AD
        BPL     L_5EAF                          ; 5E7F   0203 002E

        MVII    #$0200, R4                      ; 5E81   02BC 0200
        MVII    #$0214, R5                      ; 5E83   02BD 0214
        TSTR    R0                              ; 5E85   0080
        BPL     L_5E97                          ; 5E86   0203 000F

        INCR    R5                              ; 5E88   000D
        MVII    #$0228, R1                      ; 5E89   02B9 0228
        CLRR    R3                              ; 5E8B   01DB
        MVII    #$0005, R2                      ; 5E8C   02BA 0005
L_5E8E:
        MVO@    R3,     R1                      ; 5E8E   024B
        ADDI    #$0014, R1                      ; 5E8F   02F9 0014
        MVO@    R3,     R1                      ; 5E91   024B
        ADDI    #$0014, R1                      ; 5E92   02F9 0014
        DECR    R2                              ; 5E94   0012
        BNEQ    L_5E8E                          ; 5E95   022C 0008

L_5E97:
        MVII    #$0037, R2                      ; 5E97   02BA 0037
L_5E99:
        MVI@    R5,     R3                      ; 5E99   02AB
        MVO@    R3,     R4                      ; 5E9A   0263
        MVI@    R5,     R3                      ; 5E9B   02AB
        MVO@    R3,     R4                      ; 5E9C   0263
        MVI@    R5,     R3                      ; 5E9D   02AB
        MVO@    R3,     R4                      ; 5E9E   0263
        MVI@    R5,     R3                      ; 5E9F   02AB
        MVO@    R3,     R4                      ; 5EA0   0263
        DECR    R2                              ; 5EA1   0012
        BNEQ    L_5E99                          ; 5EA2   022C 000A

        TSTR    R0                              ; 5EA4   0080
        BPL     L_5EA8                          ; 5EA5   0203 0001

        DECR    R4                              ; 5EA7   0014
L_5EA8:
        MVO@    R2,     R4                      ; 5EA8   0262
        CMPI    #$02F0, R4                      ; 5EA9   037C 02F0
        BLT     L_5EA8                          ; 5EAB   0225 0004
        B       L_5F59                          ; 5EAD   0200 00AA

L_5EAF:
        MVII    #$0200, R1                      ; 5EAF   02B9 0200
        CLRR    R2                              ; 5EB1   01D2
        TSTR    R0                              ; 5EB2   0080
        BPL     L_5EB8                          ; 5EB3   0203 0003

        INCR    R1                              ; 5EB5   0009
        MVO     R2,     .BTAB.00                ; 5EB6   0242 0200
L_5EB8:
        MVII    #$0005, R3                      ; 5EB8   02BB 0005
        MVII    #$02DC, R4                      ; 5EBA   02BC 02DC
L_5EBC:
        MVI@    R1,     R5                      ; 5EBC   028D
        MVO@    R2,     R1                      ; 5EBD   024A
        MVO@    R5,     R4                      ; 5EBE   0265
        INCR    R1                              ; 5EBF   0009
        MVI@    R1,     R5                      ; 5EC0   028D
        MVO@    R2,     R1                      ; 5EC1   024A
        MVO@    R5,     R4                      ; 5EC2   0265
        INCR    R1                              ; 5EC3   0009
        MVI@    R1,     R5                      ; 5EC4   028D
        MVO@    R2,     R1                      ; 5EC5   024A
        MVO@    R5,     R4                      ; 5EC6   0265
        INCR    R1                              ; 5EC7   0009
        MVI@    R1,     R5                      ; 5EC8   028D
        MVO@    R2,     R1                      ; 5EC9   024A
        MVO@    R5,     R4                      ; 5ECA   0265
        INCR    R1                              ; 5ECB   0009
        DECR    R3                              ; 5ECC   0013
        BNEQ    L_5EBC                          ; 5ECD   022C 0012

        MVII    #$0214, R1                      ; 5ECF   02B9 0214
        MVII    #$0228, R2                      ; 5ED1   02BA 0228
        TSTR    R0                              ; 5ED3   0080
        BPL     L_5F0F                          ; 5ED4   0203 0039

        MVII    #$0005, R5                      ; 5ED6   02BD 0005
L_5ED8:
        MVII    #$02DC, R3                      ; 5ED8   02BB 02DC
        MVII    #$0006, R0                      ; 5EDA   02B8 0006
L_5EDC:
        MVI@    R3,     R4                      ; 5EDC   029C
        MVO@    R4,     R1                      ; 5EDD   024C
        INCR    R1                              ; 5EDE   0009
        MVI@    R1,     R4                      ; 5EDF   028C
        MVO@    R4,     R2                      ; 5EE0   0254
        INCR    R2                              ; 5EE1   000A
        MVI@    R2,     R4                      ; 5EE2   0294
        MVO@    R4,     R3                      ; 5EE3   025C
        INCR    R3                              ; 5EE4   000B
        MVI@    R3,     R4                      ; 5EE5   029C
        MVO@    R4,     R1                      ; 5EE6   024C
        INCR    R1                              ; 5EE7   0009
        MVI@    R1,     R4                      ; 5EE8   028C
        MVO@    R4,     R2                      ; 5EE9   0254
        INCR    R2                              ; 5EEA   000A
        MVI@    R2,     R4                      ; 5EEB   0294
        MVO@    R4,     R3                      ; 5EEC   025C
        INCR    R3                              ; 5EED   000B
        MVI@    R3,     R4                      ; 5EEE   029C
        MVO@    R4,     R1                      ; 5EEF   024C
        INCR    R1                              ; 5EF0   0009
        MVI@    R1,     R4                      ; 5EF1   028C
        MVO@    R4,     R2                      ; 5EF2   0254
        INCR    R2                              ; 5EF3   000A
        MVI@    R2,     R4                      ; 5EF4   0294
        MVO@    R4,     R3                      ; 5EF5   025C
        INCR    R3                              ; 5EF6   000B
        DECR    R0                              ; 5EF7   0010
        BNEQ    L_5EDC                          ; 5EF8   022C 001D

        MVI@    R3,     R4                      ; 5EFA   029C
        MVO@    R4,     R1                      ; 5EFB   024C
        INCR    R1                              ; 5EFC   0009
        MVI@    R1,     R4                      ; 5EFD   028C
        MVO@    R4,     R2                      ; 5EFE   0254
        INCR    R2                              ; 5EFF   000A
        MVI@    R2,     R4                      ; 5F00   0294
        MVO@    R4,     R3                      ; 5F01   025C
        MVO@    R0,     R1                      ; 5F02   0248
        MVO@    R0,     R2                      ; 5F03   0250
        ADDI    #$0015, R1                      ; 5F04   02F9 0015
        ADDI    #$0015, R2                      ; 5F06   02FA 0015
        DECR    R5                              ; 5F08   0015
        BNEQ    L_5ED8                          ; 5F09   022C 0032

        INCR    R3                              ; 5F0B   000B
        MVO@    R0,     R3                      ; 5F0C   0258
        B       L_5F59                          ; 5F0D   0200 004A

L_5F0F:
        MVII    #$0005, R0                      ; 5F0F   02B8 0005
L_5F11:
        PSHR    R0                              ; 5F11   0270
        MVII    #$02DC, R3                      ; 5F12   02BB 02DC
        MVII    #$0009, R0                      ; 5F14   02B8 0009
L_5F16:
        MVI@    R1,     R4                      ; 5F16   028C
        MVI@    R3,     R5                      ; 5F17   029D
        MVO@    R5,     R1                      ; 5F18   024D
        MVI@    R2,     R5                      ; 5F19   0295
        MVO@    R4,     R2                      ; 5F1A   0254
        MVO@    R5,     R3                      ; 5F1B   025D
        INCR    R1                              ; 5F1C   0009
        INCR    R2                              ; 5F1D   000A
        INCR    R3                              ; 5F1E   000B
        MVI@    R1,     R4                      ; 5F1F   028C
        MVI@    R3,     R5                      ; 5F20   029D
        MVO@    R5,     R1                      ; 5F21   024D
        MVI@    R2,     R5                      ; 5F22   0295
        MVO@    R4,     R2                      ; 5F23   0254
        MVO@    R5,     R3                      ; 5F24   025D
        INCR    R1                              ; 5F25   0009
        INCR    R2                              ; 5F26   000A
        INCR    R3                              ; 5F27   000B
        DECR    R0                              ; 5F28   0010
        BPL     L_5F16                          ; 5F29   0223 0014

        ADDI    #$0014, R1                      ; 5F2B   02F9 0014
        ADDI    #$0014, R2                      ; 5F2D   02FA 0014
        ADD@    R6,     R0                      ; 5F2F   02F0
        BNEQ    L_5F11                          ; 5F30   022C 0020
        B       L_5F59                          ; 5F32   0200 0025

L_5F34:
        PULR    R0                              ; 5F34   02B0
        PSHR    R0                              ; 5F35   0270
        TSTR    R0                              ; 5F36   0080
        BPL     L_5F59                          ; 5F37   0203 0020

        MVII    #$0200, R5                      ; 5F39   02BD 0200
        MOVR    R5,     R4                      ; 5F3B   00AC
        CLRR    R2                              ; 5F3C   01D2
        MVII    #$0006, R1                      ; 5F3D   02B9 0006
L_5F3F:
        MVO@    R2,     R5                      ; 5F3F   026A
        ADDI    #$0013, R5                      ; 5F40   02FD 0013
        MVO@    R2,     R5                      ; 5F42   026A
        ADDI    #$0013, R5                      ; 5F43   02FD 0013
        DECR    R1                              ; 5F45   0011
        BNEQ    L_5F3F                          ; 5F46   022C 0008

        MOVR    R4,     R5                      ; 5F48   00A5
        INCR    R5                              ; 5F49   000D
        MVII    #$003C, R2                      ; 5F4A   02BA 003C
L_5F4C:
        MVI@    R5,     R3                      ; 5F4C   02AB
        MVO@    R3,     R4                      ; 5F4D   0263
        MVI@    R5,     R3                      ; 5F4E   02AB
        MVO@    R3,     R4                      ; 5F4F   0263
        MVI@    R5,     R3                      ; 5F50   02AB
        MVO@    R3,     R4                      ; 5F51   0263
        MVI@    R5,     R3                      ; 5F52   02AB
        MVO@    R3,     R4                      ; 5F53   0263
        DECR    R2                              ; 5F54   0012
        BNEQ    L_5F4C                          ; 5F55   022C 000A

        MVO     R2,     .BTAB.EF                ; 5F57   0242 02EF
L_5F59:
        MVI     G_0317, R1                      ; 5F59   0281 0317
        SWAP    R1,     1                       ; 5F5B   0041
        MVO     R1,     G_032F                  ; 5F5C   0241 032F
        MVI     G_031F, R1                      ; 5F5E   0281 031F
        ANDI    #$007F, R1                      ; 5F60   03B9 007F
        SWAP    R1,     1                       ; 5F62   0041
        MVO     R1,     G_0337                  ; 5F63   0241 0337
        PULR    R0                              ; 5F65   02B0
        TSTR    R0                              ; 5F66   0080
        BPL     L_5F84                          ; 5F67   0203 001B

        MVII    #$0318, R3                      ; 5F69   02BB 0318
L_5F6B:
        MVI@    R3,     R4                      ; 5F6B   029C
        MOVR    R4,     R5                      ; 5F6C   00A5
        ANDI    #$00FF, R5                      ; 5F6D   03BD 00FF
        XORR    R5,     R4                      ; 5F6F   01EC
        SUBI    #$0008, R5                      ; 5F70   033D 0008
        ANDI    #$00FF, R5                      ; 5F72   03BD 00FF
        XORR    R5,     R4                      ; 5F74   01EC
        MVO@    R4,     R3                      ; 5F75   025C
        ADDI    #$0018, R3                      ; 5F76   02FB 0018
        MVI@    R3,     R4                      ; 5F78   029C
        SDBD                                    ; 5F79   0001
        SUBI    #$0800, R4                      ; 5F7A   033C 0000 0008
        MVO@    R4,     R3                      ; 5F7D   025C
        SUBI    #$0017, R3                      ; 5F7E   033B 0017
        CMPI    #$031E, R3                      ; 5F80   037B 031E
        BLE     L_5F6B                          ; 5F82   0226 0018

L_5F84:
        TSTR    R0                              ; 5F84   0080
        BPL     L_5FB5                          ; 5F85   0203 002E

        MVI     G_0350, R1                      ; 5F87   0281 0350
        SWAP    R1,     1                       ; 5F89   0041
        SUBI    #$0006, R1                      ; 5F8A   0339 0006
        MVI     G_012B, R3                      ; 5F8C   0283 012B
        TSTR    R3                              ; 5F8E   009B
        BEQ     L_5F92                          ; 5F8F   0204 0001

        INCR    R1                              ; 5F91   0009
L_5F92:
        ANDI    #$007F, R1                      ; 5F92   03B9 007F
        PSHR    R1                              ; 5F94   0271
        MVI     G_012F, R2                      ; 5F95   0282 012F

        JSR     R4,     L_66D2                  ; 5F97   0004 0064 02D2

        PULR    R1                              ; 5F9A   02B1
        MVI     G_034F, R3                      ; 5F9B   0283 034F
        SWAP    R3,     1                       ; 5F9D   0043
        ADDI    #$0013, R3                      ; 5F9E   02FB 0013
        ANDI    #$00FF, R3                      ; 5FA0   03BB 00FF
        MVII    #$0213, R5                      ; 5FA2   02BD 0213

L_5FA4:
        JSR     R4,     L_5C28                  ; 5FA4   0004 005C 0028

        ADD     G_012F, R0                      ; 5FA7   02C0 012F
        INCR    R1                              ; 5FA9   0009
        ANDI    #$007F, R1                      ; 5FAA   03B9 007F
        BNEQ    L_5FAF                          ; 5FAC   020C 0001

        MOVR    R1,     R0                      ; 5FAE   0088
L_5FAF:
        ADDI    #$0013, R5                      ; 5FAF   02FD 0013
        CMPI    #$02F0, R5                      ; 5FB1   037D 02F0
        BLT     L_5FA4                          ; 5FB3   0225 0010

L_5FB5:
        PULR    R5                              ; 5FB5   02B5
        PULR    R1                              ; 5FB6   02B1
        TSTR    R1                              ; 5FB7   0089
        BPL     L_5D33                          ; 5FB8   0223 0286

        TSTR    R5                              ; 5FBA   00AD
        BPL     L_5FE8                          ; 5FBB   0203 002B

        MVI     G_0350, R1                      ; 5FBD   0281 0350
        SWAP    R1,     1                       ; 5FBF   0041
        ADDI    #$0005, R1                      ; 5FC0   02F9 0005
        MVI     G_012B, R3                      ; 5FC2   0283 012B
        TSTR    R3                              ; 5FC4   009B
        BEQ     L_5FC8                          ; 5FC5   0204 0001

        INCR    R1                              ; 5FC7   0009
L_5FC8:
        ANDI    #$007F, R1                      ; 5FC8   03B9 007F
        MVI     G_034F, R3                      ; 5FCA   0283 034F
        SWAP    R3,     1                       ; 5FCC   0043
        MVI     G_0128, R0                      ; 5FCD   0280 0128
        TSTR    R0                              ; 5FCF   0080
        BNEQ    L_5FD3                          ; 5FD0   020C 0001

        DECR    R3                              ; 5FD2   0013
L_5FD3:
        ANDI    #$00FF, R3                      ; 5FD3   03BB 00FF
        PSHR    R1                              ; 5FD5   0271
        MVI     G_012F, R2                      ; 5FD6   0282 012F

        JSR     R4,     L_66D2                  ; 5FD8   0004 0064 02D2

        PULR    R1                              ; 5FDB   02B1
        MVII    #$02DC, R5                      ; 5FDC   02BD 02DC

L_5FDE:
        JSR     R4,     L_5C28                  ; 5FDE   0004 005C 0028

        INCR    R3                              ; 5FE1   000B
        CMPI    #$02F0, R5                      ; 5FE2   037D 02F0
        BLT     L_5FDE                          ; 5FE4   0225 0007
        B       L_5D33                          ; 5FE6   0220 02B4

L_5FE8:
        MVI     G_0350, R1                      ; 5FE8   0281 0350
        SWAP    R1,     1                       ; 5FEA   0041
        SUBI    #$0006, R1                      ; 5FEB   0339 0006
        MVI     G_012B, R3                      ; 5FED   0283 012B
        TSTR    R3                              ; 5FEF   009B
        BEQ     L_5FF3                          ; 5FF0   0204 0001

        INCR    R1                              ; 5FF2   0009
L_5FF3:
        ANDI    #$007F, R1                      ; 5FF3   03B9 007F
        MVI     G_034F, R3                      ; 5FF5   0283 034F
        SWAP    R3,     1                       ; 5FF7   0043
        MVI     G_0128, R0                      ; 5FF8   0280 0128
        TSTR    R0                              ; 5FFA   0080
        BNEQ    L_5FFE                          ; 5FFB   020C 0001

        DECR    R3                              ; 5FFD   0013
L_5FFE:
        ANDI    #$00FF, R3                      ; 5FFE   03BB 00FF
        PSHR    R1                              ; 6000   0271
        MVI     G_012F, R2                      ; 6001   0282 012F

        JSR     R4,     L_66D2                  ; 6003   0004 0064 02D2

        PULR    R1                              ; 6006   02B1
        MVII    #$0200, R5                      ; 6007   02BD 0200

L_6009:
        JSR     R4,     L_5C28                  ; 6009   0004 005C 0028

        INCR    R3                              ; 600C   000B
        CMPI    #$0214, R5                      ; 600D   037D 0214
        BLT     L_6009                          ; 600F   0225 0007
        B       L_5D33                          ; 6011   0220 02DF

L_6013:
        MOVR    R1,     R3                      ; 6013   008B
L_6014:
        CLRR    R0                              ; 6014   01C0
L_6015:
        PSHR    R4                              ; 6015   0274
        PSHR    R0                              ; 6016   0270
        ADDR    R0,     R7                      ; 6017   00C7

        MVII    #$03E8, R0                      ; 6018   02B8 03E8

        JSR     R4,     L_6035                  ; 601A   0004 0060 0035

        MVII    #$0064, R0                      ; 601D   02B8 0064

        JSR     R4,     L_6035                  ; 601F   0004 0060 0035

        MVII    #$000A, R0                      ; 6022   02B8 000A

        JSR     R4,     L_6035                  ; 6024   0004 0060 0035

        MVII    #$0001, R0                      ; 6027   02B8 0001

        JSR     R4,     L_6035                  ; 6029   0004 0060 0035

        PULR    R0                              ; 602C   02B0
        ADDR    R3,     R0                      ; 602D   00D8
        BNEQ    L_6034                          ; 602E   020C 0004

        DECR    R5                              ; 6030   0015
        MVII    #$0086, R2                      ; 6031   02BA 0086
        MVO@    R2,     R5                      ; 6033   026A
L_6034:
        PULR    R7                              ; 6034   02B7

L_6035:
        CLRR    R2                              ; 6035   01D2
        CMPR    R0,     R3                      ; 6036   0143
        BNC     L_6044                          ; 6037   0209 000B

L_6039:
        CMPR    R0,     R1                      ; 6039   0141
        BLT     L_6040                          ; 603A   0205 0004

        INCR    R2                              ; 603C   000A
        SUBR    R0,     R1                      ; 603D   0101
        B       L_6039                          ; 603E   0220 0006

L_6040:
        ADDI    #$0010, R2                      ; 6040   02FA 0010
        SLL     R2,     2                       ; 6042   004E
        SLL     R2,     1                       ; 6043   004A
L_6044:
        ADDI    #$0006, R2                      ; 6044   02FA 0006
        MVO@    R2,     R5                      ; 6046   026A
        MOVR    R4,     R7                      ; 6047   00A7

L_6048:
        ADDI    #$0317, R3                      ; 6048   02FB 0317
        SLL     R1,     2                       ; 604A   004D
        MOVR    R1,     R5                      ; 604B   008D
        SLL     R1,     1                       ; 604C   0049
        ADDR    R5,     R1                      ; 604D   00E9
        MOVR    R1,     R5                      ; 604E   008D
        ADDR    R7,     R5                      ; 604F   00FD
        ADDI    #$026C, R5                      ; 6050   02FD 026C
L_6052:
        SDBD                                    ; 6052   0001
        MVI@    R5,     R1                      ; 6053   02A9
        MVO@    R1,     R3                      ; 6054   0259
        ADDI    #$0008, R3                      ; 6055   02FB 0008
        CMPI    #$0347, R3                      ; 6057   037B 0347
        BLT     L_6052                          ; 6059   0225 0008

        CLRR    R1                              ; 605B   01C9
        MVO@    R1,     R3                      ; 605C   0259
        SUBI    #$022F, R3                      ; 605D   033B 022F
        MVII    #$0080, R1                      ; 605F   02B9 0080
        MVO@    R1,     R3                      ; 6061   0259
        MOVR    R4,     R7                      ; 6062   00A7

L_6063:
        MVII    #$0317, R5                      ; 6063   02BD 0317
        CLRR    R0                              ; 6065   01C0
L_6066:
        MVO@    R0,     R5                      ; 6066   0268
        CMPI    #$034F, R5                      ; 6067   037D 034F
        BLT     L_6066                          ; 6069   0225 0004

        MVII    #$010D, R5                      ; 606B   02BD 010D
L_606D:
        MVO@    R0,     R5                      ; 606D   0268
        CMPI    #$012D, R5                      ; 606E   037D 012D
        BLE     L_606D                          ; 6070   0226 0004

        CLRR    R5                              ; 6072   01ED
L_6073:
        MVO@    R0,     R5                      ; 6073   0268
        CMPI    #$0020, R5                      ; 6074   037D 0020
        BLT     L_6073                          ; 6076   0225 0004

        MVO     R0,     .STIC.HDLY              ; 6078   0240 0030
        MVO     R0,     .STIC.VDLY              ; 607A   0240 0031
        MVII    #$0200, R5                      ; 607C   02BD 0200
L_607E:
        MVO@    R0,     R5                      ; 607E   0268
        CMPI    #$02F0, R5                      ; 607F   037D 02F0
        BLT     L_607E                          ; 6081   0225 0004
        MOVR    R4,     R7                      ; 6083   00A7

L_6084:
        MVI@    R2,     R2                      ; 6084   0292
        SLR     R2,     1                       ; 6085   0062
        SDBD                                    ; 6086   0001
        ADDI    #$67DC, R2                      ; 6087   02FA 00DC 0067
L_608A:
        PSHR    R5                              ; 608A   0275
        PSHR    R3                              ; 608B   0273
        MVI     G_0351, R5                      ; 608C   0285 0351
        ADD@    R2,     R5                      ; 608E   02D5
        SDBD                                    ; 608F   0001
        CMPI    #$270F, R5                      ; 6090   037D 000F 0027
        BLE     L_60A8                          ; 6093   0206 0013

        MVI     G_01BC, R3                      ; 6095   0283 01BC
        CMPI    #$0063, R3                      ; 6097   037B 0063
        BLT     L_60A1                          ; 6099   0205 0006

        SDBD                                    ; 609B   0001
        MVII    #$270F, R5                      ; 609C   02BD 000F 0027
        B       L_60A8                          ; 609F   0200 0007

L_60A1:
        INCR    R3                              ; 60A1   000B
        MVO     R3,     G_01BC                  ; 60A2   0243 01BC
        SDBD                                    ; 60A4   0001
        SUBI    #$2710, R5                      ; 60A5   033D 0010 0027
L_60A8:
        MVO     R5,     G_0351                  ; 60A8   0245 0351
        PULR    R3                              ; 60AA   02B3
        PULR    R7                              ; 60AB   02B7

L_60AC:
        PSHR    R4                              ; 60AC   0274
        CLRR    R0                              ; 60AD   01C0
        MVII    #$0353, R4                      ; 60AE   02BC 0353
L_60B0:
        MOVR    R0,     R2                      ; 60B0   0082
        ADDI    #$01F4, R2                      ; 60B1   02FA 01F4
        MVI@    R2,     R1                      ; 60B3   0291
        SWAP    R1,     1                       ; 60B4   0041
        SUBI    #$0004, R2                      ; 60B5   033A 0004
        ADD@    R2,     R1                      ; 60B7   02D1
        MOVR    R0,     R3                      ; 60B8   0083
        ADDI    #$0356, R3                      ; 60B9   02FB 0356
        ADD@    R3,     R1                      ; 60BB   02D9
        MVO@    R1,     R2                      ; 60BC   0251
        SWAP    R1,     1                       ; 60BD   0041
        ADDI    #$0004, R2                      ; 60BE   02FA 0004
        MVO@    R1,     R2                      ; 60C0   0251
        MVI@    R4,     R3                      ; 60C1   02A3
        MOVR    R0,     R1                      ; 60C2   0081
        ADDI    #$01B5, R1                      ; 60C3   02F9 01B5
        MVI@    R1,     R2                      ; 60C5   028A
        DECR    R2                              ; 60C6   0012
        BMI     L_60CC                          ; 60C7   020B 0003

        MVO@    R2,     R1                      ; 60C9   024A
        BNEQ    L_60F0                          ; 60CA   020C 0024

L_60CC:
        TSTR    R3                              ; 60CC   009B
        BEQ     L_60F0                          ; 60CD   0204 0021

        MVI@    R3,     R5                      ; 60CF   029D
        ANDI    #$000F, R5                      ; 60D0   03BD 000F
        MVI@    R3,     R1                      ; 60D2   0299
        SLR     R1,     2                       ; 60D3   0065
        SLR     R1,     2                       ; 60D4   0065
        INCR    R5                              ; 60D5   000D
        ADDR    R7,     R5                      ; 60D6   00FD
        ADD@    R5,     R7                      ; 60D7   02EF

        DECLE   $000E,  $001E,  $0027,  $0034   ; 60D8   000E 001E 0027 0034
        DECLE   $0037                           ; 60DC   0037

        RSWD    R3                              ; 60DD   003B
        SWAP    R3,     2                       ; 60DE   0047
        SLL     R1,     2                       ; 60DF   004D
        RLC     R3,     1                       ; 60E0   0053
        SARC    R2,     1                       ; 60E1   007A
        MOVR    R5,     R3                      ; 60E2   00AB
        MOVR    R5,     R7                      ; 60E3   00AF

        MOVR    R6,     R3                      ; 60E4   00B3
        MOVR    R7,     R4                      ; 60E5   00BC
        MOVR    R0,     R2                      ; 60E6   0082
        ADDI    #$01B5, R2                      ; 60E7   02FA 01B5
        TSTR    R1                              ; 60E9   0089
        BEQ     L_60F0                          ; 60EA   0204 0004

        MVO@    R1,     R2                      ; 60EC   0251
        INCR    R3                              ; 60ED   000B
        DECR    R4                              ; 60EE   0014
        MVO@    R3,     R4                      ; 60EF   0263
L_60F0:
        INCR    R0                              ; 60F0   0008
        CMPI    #$0002, R0                      ; 60F1   0378 0002
        BLE     L_60B0                          ; 60F3   0226 0044
        PULR    R7                              ; 60F5   02B7

        MOVR    R0,     R2                      ; 60F6   0082
        ADDI    #$01B8, R2                      ; 60F7   02FA 01B8
        MVO@    R1,     R2                      ; 60F9   0251
L_60FA:
        INCR    R3                              ; 60FA   000B
L_60FB:
        DECR    R4                              ; 60FB   0014
        MVO@    R3,     R4                      ; 60FC   0263
        B       L_60CC                          ; 60FD   0220 0032

        MOVR    R0,     R2                      ; 60FF   0082
        ADDI    #$01B8, R2                      ; 6100   02FA 01B8
        MVI@    R2,     R5                      ; 6102   0295
        DECR    R5                              ; 6103   0015
        BMI     L_6109                          ; 6104   020B 0003

        MVO@    R5,     R2                      ; 6106   0255
        BEQ     L_60FA                          ; 6107   0224 000E

L_6109:
        SUBR    R1,     R3                      ; 6109   010B
        B       L_60FB                          ; 610A   0220 0010

        ADDR    R1,     R3                      ; 610C   00CB
        B       L_60FB                          ; 610D   0220 0013

        MVO     R1,     .PSG0.noise             ; 610F   0241 01F9
        B       L_60FA                          ; 6111   0220 0018

        MVO     R1,     .PSG0.envelope          ; 6113   0241 01FA
        INCR    R3                              ; 6115   000B
        MVI@    R3,     R1                      ; 6116   0299
        MVO     R1,     .PSG0.envlp_lo          ; 6117   0241 01F3
        INCR    R3                              ; 6119   000B
        MVI@    R3,     R1                      ; 611A   0299
        MVO     R1,     .PSG0.envlp_hi          ; 611B   0241 01F7
        B       L_60FA                          ; 611D   0220 0024

        MVII    #$01FB, R2                      ; 611F   02BA 01FB
        MVII    #$00F6, R5                      ; 6121   02BD 00F6
        B       L_612F                          ; 6123   0200 000A

        MVII    #$01FC, R2                      ; 6125   02BA 01FC
        MVII    #$00ED, R5                      ; 6127   02BD 00ED
        B       L_612F                          ; 6129   0200 0004

        MVII    #$01FD, R2                      ; 612B   02BA 01FD
        MVII    #$00DB, R5                      ; 612D   02BD 00DB
L_612F:
        PSHR    R0                              ; 612F   0270
        MOVR    R1,     R0                      ; 6130   0088
        ANDI    #$001F, R1                      ; 6131   03B9 001F
        SLL     R0,     1                       ; 6133   0048
        ANDI    #$0020, R0                      ; 6134   03B8 0020
        ADDR    R0,     R1                      ; 6136   00C1
        PULR    R0                              ; 6137   02B0
        MVO@    R1,     R2                      ; 6138   0251
        MVI@    R3,     R1                      ; 6139   0299
        ANDI    #$0200, R1                      ; 613A   03B9 0200
        BNEQ    L_60FA                          ; 613C   022C 0043

        INCR    R3                              ; 613E   000B
        MVI@    R3,     R1                      ; 613F   0299
        SUBI    #$000B, R2                      ; 6140   033A 000B
        MVO@    R1,     R2                      ; 6142   0251
        INCR    R3                              ; 6143   000B
        MVI@    R3,     R1                      ; 6144   0299
        ADDI    #$0004, R2                      ; 6145   02FA 0004
        MVO@    R1,     R2                      ; 6147   0251
        SLR     R1,     2                       ; 6148   0065
        SLR     R1,     2                       ; 6149   0065
        MVI     .PSG0.chan_enable,R2            ; 614A   0282 01F8
        ANDR    R5,     R2                      ; 614C   01AA
        XORR    R1,     R2                      ; 614D   01CA
        MVO     R2,     .PSG0.chan_enable       ; 614E   0242 01F8
        B       L_60FA                          ; 6150   0220 0057

        MVI     .PSG0.noise,R2                  ; 6152   0282 01F9
        DECR    R1                              ; 6154   0011
        BMI     L_615B                          ; 6155   020B 0004
        BGT     L_6160                          ; 6157   020E 0007

        DECR    R2                              ; 6159   0012
        INCR    R7                              ; 615A   000F

L_615B:
        INCR    R2                              ; 615B   000A
L_615C:
        MVO     R2,     .PSG0.noise             ; 615C   0242 01F9
        B       L_60FA                          ; 615E   0220 0065

L_6160:
        MVI     G_012E, R2                      ; 6160   0282 012E
        ADD     G_012F, R2                      ; 6162   02C2 012F
        ADDI    #$0003, R2                      ; 6164   02FA 0003
        SWAP    R2,     1                       ; 6166   0042
        SUB     G_034F, R2                      ; 6167   0302 034F
        SWAP    R2,     1                       ; 6169   0042
        SLR     R2,     2                       ; 616A   0066
        SLR     R2,     2                       ; 616B   0066
        ANDI    #$000F, R2                      ; 616C   03BA 000F
        SUBR    R2,     R1                      ; 616E   0111
        MVO     R1,     .PSG0.chn_c_vol         ; 616F   0241 01FD
        MVII    #$00FF, R1                      ; 6171   02B9 00FF
        MVO     R1,     .PSG0.chn_c_lo          ; 6173   0241 01F2
        MVI     G_0133, R1                      ; 6175   0281 0133
        ADD     G_0135, R1                      ; 6177   02C1 0135
        ADD     G_0137, R1                      ; 6179   02C1 0137
        ADD     G_0139, R1                      ; 617B   02C1 0139
        ADDI    #$000B, R1                      ; 617D   02F9 000B
        MVO     R1,     .PSG0.chn_c_hi          ; 617F   0241 01F6
        B       L_60FA                          ; 6181   0220 0088

        MVII    #$0356, R5                      ; 6183   02BD 0356
        B       L_618D                          ; 6185   0200 0006

        MVII    #$0357, R5                      ; 6187   02BD 0357
        B       L_618D                          ; 6189   0200 0002

        MVII    #$0358, R5                      ; 618B   02BD 0358
L_618D:
        SWAP    R1,     1                       ; 618D   0041
        SLL     R1,     2                       ; 618E   004D
        INCR    R3                              ; 618F   000B
        ADD@    R3,     R1                      ; 6190   02D9
        MVO@    R1,     R5                      ; 6191   0269
        B       L_60FA                          ; 6192   0220 0099

        MVII    #$01F4, R2                      ; 6194   02BA 01F4
        MVO@    R1,     R2                      ; 6196   0251
        PSHR    R3                              ; 6197   0273
        PSHR    R4                              ; 6198   0274
        PSHR    R0                              ; 6199   0270
        PSHR    R2                              ; 619A   0272
        MVII    #$0008, R1                      ; 619B   02B9 0008

        JSR     R4,     L_66EE                  ; 619D   0004 0064 02EE

        PULR    R2                              ; 61A0   02B2
        SUBI    #$0004, R2                      ; 61A1   033A 0004
        MVO@    R0,     R2                      ; 61A3   0250
        PULR    R0                              ; 61A4   02B0
        PULR    R4                              ; 61A5   02B4
        PULR    R3                              ; 61A6   02B3
        B       L_60FA                          ; 61A7   0220 00AE

        DECLE   $000B,  $0000,  $00C7,  $0000   ; 61A9   000B 0000 00C7 0000

        NEGR    R0                              ; 61AD   0020
        XORR    R6,     R4                      ; 61AE   01F4
        RRC     R1,     1                       ; 61AF   0071
        COMR    R1                              ; 61B0   0019
        COMR    R1                              ; 61B1   0019
        COMR    R1                              ; 61B2   0019
        COMR    R1                              ; 61B3   0019
        DECR    R0                              ; 61B4   0010
        RLC     R2,     1                       ; 61B5   0052
        MVI@    R4,     R7                      ; 61B6   02A7

        SLR     R0,     1                       ; 61B7   0060
        MVI@    R2,     R7                      ; 61B8   0297

        SLR     R0,     1                       ; 61B9   0060
        MVI     G_0060, R7                      ; 61BA   0287 0060

        DECLE   $0267,  $0060,  $0247,  $0060   ; 61BC   0267 0060 0247 0060
        DECLE   $0227,  $0060,  $0207,  $01F4   ; 61C0   0227 0060 0207 01F4
        DECLE   $0000,  $00E6,  $0030,  $0000   ; 61C4   0000 00E6 0030 0000

        INCR    R2                              ; 61C8   000A
        DECR    R0                              ; 61C9   0010
        XORR    R6,     R4                      ; 61CA   01F4
        SWAP    R0,     1                       ; 61CB   0040
        ADD@    R2,     R6                      ; 61CC   02D6
        SWAP    R0,     1                       ; 61CD   0040
        PULR    R6                              ; 61CE   02B6
        SWAP    R0,     1                       ; 61CF   0040
        PSHR    R6                              ; 61D0   0276
        SWAP    R0,     1                       ; 61D1   0040
        BLE     L_61D4                          ; 61D2   0206 0000

L_61D4:
        MOVR    R4,     R6                      ; 61D4   00A6
        DECLE   $0001,  $0080,  $000A,  $000B   ; 61D5   0001 0080 000A 000B
        DECLE   $0140,  $03FA,  $0080,  $01F4   ; 61D9   0140 03FA 0080 01F4
        DECLE   $00F6,  $00FF                   ; 61DD   00F6 00FF

        INCR    R7                              ; 61DF   000F

        ADDR    R0,     R1                      ; 61E0   00C1
L_61E1:
        MOVR    R7,     R5                      ; 61E1   00BD
        DECLE   $0020,  $0022,  $02D6,  $0050   ; 61E2   0020 0022 02D6 0050
        DECLE   $02B6,  $0050,  $0296,  $0050   ; 61E6   02B6 0050 0296 0050
        DECLE   $0256,  $0050,  $0206,  $000A   ; 61EA   0256 0050 0206 000A
        DECLE   $0000,  $0000,  $0094,  $00F6   ; 61EE   0000 0000 0094 00F6
        DECLE   $00FF,  $0003,  $0020,  $0206   ; 61F2   00FF 0003 0020 0206
        DECLE   $0010,  $02E6,  $000A,  $0160   ; 61F6   0010 02E6 000A 0160
        DECLE   $0081,  $0010,  $0009,  $0009   ; 61FA   0081 0010 0009 0009
        DECLE   $0032,  $02B6,  $0050,  $0286   ; 61FE   0032 02B6 0050 0286
        DECLE   $0050,  $0246,  $0050,  $0206   ; 6202   0050 0246 0050 0206
        DECLE   $000A,  $0000,  $0000,  $0106   ; 6206   000A 0000 0000 0106
        DECLE   $00FF,  $000F,  $0107,  $00FF   ; 620A   00FF 000F 0107 00FF
        DECLE   $0009,  $0108,  $00FF,  $0005   ; 620E   0009 0108 00FF 0005
        DECLE   $000A,  $0000,  $01F4,  $0005   ; 6212   000A 0000 01F4 0005
        DECLE   $00FF,  $003F,  $0000,  $00F7   ; 6216   00FF 003F 0000 00F7
        DECLE   $0010,  $0000,  $000B,  $0014   ; 621A   0010 0000 000B 0014
        DECLE   $0020,  $0207                   ; 621E   0020 0207

        DECR    R0                              ; 6220   0010
        ADD@    R6,     R7                      ; 6221   02F7

        GSWD    R0                              ; 6222   0030
        ADD@    R2,     R7                      ; 6223   02D7

        GSWD    R0                              ; 6224   0030
        PULR    R7                              ; 6225   02B7

        DECLE   $0030,  $0267,  $0040,  $0207   ; 6226   0030 0267 0040 0207
        DECLE   $000B,  $0000,  $0000,  $00F7   ; 622A   000B 0000 0000 00F7
        DECLE   $0000,  $0002,  $000B,  $0001   ; 622E   0000 0002 000B 0001

        NEGR    R0                              ; 6232   0020
        ADD@    R6,     R7                      ; 6233   02F7

        SWAP    R0,     1                       ; 6234   0040
        ADD@    R4,     R7                      ; 6235   02E7

        GSWD    R0                              ; 6236   0030
        MVI     G_0070, R7                      ; 6237   0287 0070

        DECLE   $0247,  $0050,  $0207,  $000B   ; 6239   0247 0050 0207 000B
        DECLE   $0000,  $0000,  $0001,  $000C   ; 623D   0000 0000 0001 000C
        DECLE   $0000,  $0008,  $00FF,  $020F   ; 6241   0000 0008 00FF 020F
        DECLE   $00D9                           ; 6245   00D9

        GSWD    R0                              ; 6246   0030
        ADDR    R1,     R1                      ; 6247   00C9
        NEGR    R0                              ; 6248   0020
        MOVR    R5,     R1                      ; 6249   00A9
        NEGR    R0                              ; 624A   0020
        MOVR    R3,     R1                      ; 624B   0099
        GSWD    R0                              ; 624C   0030
        MOVR    R5,     R1                      ; 624D   00A9
        NEGR    R0                              ; 624E   0020
        ADDR    R1,     R1                      ; 624F   00C9
        NEGR    R0                              ; 6250   0020
        ADDR    R0,     R2                      ; 6251   00C2
        XORI    #$0380, R4                      ; 6252   03FC 0380
        XORI    #$0380, R3                      ; 6254   03FB 0380
        B       L_626A                          ; 6256   0200 0012

        DECLE   $000B,  $0001,  $000C,  $0002   ; 6258   000B 0001 000C 0002
        DECLE   $03F0,  $03F0,  $0277,  $0278   ; 625C   03F0 03F0 0277 0278

        XOR@    R6,     R0                      ; 6260   03F0
        XOR@    R6,     R0                      ; 6261   03F0
        MVO@    R7,     R4                      ; 6262   0267
        MVO@    R0,     R5                      ; 6263   0268
        XOR@    R6,     R0                      ; 6264   03F0
        XOR@    R6,     R0                      ; 6265   03F0
        MVO@    R7,     R2                      ; 6266   0257
        MVO@    R0,     R3                      ; 6267   0258
        XOR@    R6,     R0                      ; 6268   03F0
        XOR@    R6,     R0                      ; 6269   03F0
L_626A:
        MVO     R7,     .BTAB.48                ; 626A   0247 0248
        DECLE   $03F0,  $03F0,  $0237,  $0238   ; 626C   03F0 03F0 0237 0238
        DECLE   $03F0,  $03F0,  $0227,  $0228   ; 6270   03F0 03F0 0227 0228
        DECLE   $03F0,  $03F0,  $0207,  $0208   ; 6274   03F0 03F0 0207 0208
        DECLE   $0000,  $0001,  $03FB,  $03FF   ; 6278   0000 0001 03FB 03FF
        DECLE   $000C,  $0010,  $0206,  $0087   ; 627C   000C 0010 0206 0087
        DECLE   $00FF,  $0105,  $0088,  $00FF   ; 6280   00FF 0105 0088 00FF
        DECLE   $0201,  $03A0,  $0072,  $00A6   ; 6284   0201 03A0 0072 00A6
        DECLE   $0040,  $0000,  $0207,  $0208   ; 6288   0040 0000 0207 0208
        DECLE   $000A,  $0010,  $02F0,  $0340   ; 628C   000A 0010 02F0 0340
        DECLE   $00A3,  $0014,  $0206,  $00A8   ; 6290   00A3 0014 0206 00A8
        DECLE   $0000,  $0010,  $01F1,  $0019   ; 6294   0000 0010 01F1 0019
        DECLE   $0060,  $0022,  $000B,  $0000   ; 6298   0060 0022 000B 0000
        DECLE   $000A,  $0000,  $000C,  $0000   ; 629C   000A 0000 000C 0000
        DECLE   $00F6,  $00FF,  $000F,  $0040   ; 62A0   00F6 00FF 000F 0040
        DECLE   $0206,  $0020,  $00F6,  $007F   ; 62A4   0206 0020 00F6 007F
        DECLE   $000B,  $00F7,  $00B1,  $000A   ; 62A8   000B 00F7 00B1 000A
        DECLE   $00F8,  $0037,  $0009,  $0024   ; 62AC   00F8 0037 0009 0024
        DECLE   $0200,  $0005,  $00FF,  $00DF   ; 62B0   0200 0005 00FF 00DF
        DECLE   $03F6,  $03F7,  $03F8,  $01C1   ; 62B4   03F6 03F7 03F8 01C1
        DECLE   $0009,  $0050,  $0022,  $0000   ; 62B8   0009 0050 0022 0000
        DECLE   $0030,  $0003,  $003A,  $0000   ; 62BC   0030 0003 003A 0000
        DECLE   $0082,  $0019,  $0000,  $0030   ; 62C0   0082 0019 0000 0030
        DECLE   $0000,  $003A,  $0000,  $0000   ; 62C4   0000 003A 0000 0000
        DECLE   $0048,  $0002,  $0035,  $0001   ; 62C8   0048 0002 0035 0001
        DECLE   $0092,  $0018,  $0000,  $0048   ; 62CC   0092 0018 0000 0048
        DECLE   $0000,  $0035,  $0060,  $0000   ; 62D0   0000 0035 0060 0000
        DECLE   $006C,  $0002,  $0035,  $0001   ; 62D4   006C 0002 0035 0001
        DECLE   $0092,  $0018,  $0000,  $006C   ; 62D8   0092 0018 0000 006C
        DECLE   $0000,  $0035,  $0000,  $0000   ; 62DC   0000 0035 0000 0000
        DECLE   $006C,  $0002,  $00B2,  $0000   ; 62E0   006C 0002 00B2 0000
        DECLE   $0090,  $0009,  $0000,  $006C   ; 62E4   0090 0009 0000 006C
        DECLE   $0000,  $0032,  $0000,  $0000   ; 62E8   0000 0032 0000 0000
        DECLE   $0000,  $0002,  $00B1,  $0000   ; 62EC   0000 0002 00B1 0000
        DECLE   $0004,  $0008,  $0000,  $0000   ; 62F0   0004 0008 0000 0000
        DECLE   $0000,  $0031,  $0000,  $0000   ; 62F4   0000 0031 0000 0000
        DECLE   $006C,  $0002,  $0036,  $0000   ; 62F8   006C 0002 0036 0000
        DECLE   $0094,  $0018,  $0000,  $006C   ; 62FC   0094 0018 0000 006C
        DECLE   $0000,  $0036,  $0000,  $00FE   ; 6300   0000 0036 0000 00FE
        DECLE   $0048,  $0002,  $0038,  $0001   ; 6304   0048 0002 0038 0001
        DECLE   $0096,  $0008,  $0000,  $0048   ; 6308   0096 0008 0000 0048
        DECLE   $0000,  $0038,  $0000,  $0000   ; 630C   0000 0038 0000 0000
L_6310:
        PSHR    R4                              ; 6310   0274
        SDBD                                    ; 6311   0001
        MVII    #$634A, R3                      ; 6312   02BB 004A 0063
        MVII    #$0048, R2                      ; 6315   02BA 0048
        MVII    #$0048, R1                      ; 6317   02B9 0048

        JSR     R4,     L_632E                  ; 6319   0004 0060 032E

        SUBI    #$0007, R3                      ; 631C   033B 0007
        MVII    #$00D0, R2                      ; 631E   02BA 00D0
        MVII    #$0020, R1                      ; 6320   02B9 0020

        JSR     R4,     L_6332                  ; 6322   0004 0060 0332

        PULR    R7                              ; 6325   02B7

L_6326:
        SDBD                                    ; 6326   0001
        MVII    #$659A, R3                      ; 6327   02BB 009A 0065
        MVII    #$0138, R2                      ; 632A   02BA 0138
        MVII    #$0030, R1                      ; 632C   02B9 0030
L_632E:
        SDBD                                    ; 632E   0001
        MVII    #$3800, R5                      ; 632F   02BD 0000 0038
L_6332:
        MVI@    R3,     R0                      ; 6332   0298
        MVO@    R0,     R5                      ; 6333   0268
        INCR    R3                              ; 6334   000B
        DECR    R2                              ; 6335   0012
        BNEQ    L_6332                          ; 6336   022C 0005

        SUBR    R1,     R3                      ; 6338   010B
        ADDI    #$0007, R3                      ; 6339   02FB 0007
L_633B:
        MVII    #$0008, R2                      ; 633B   02BA 0008
L_633D:
        MVI@    R3,     R0                      ; 633D   0298
        MVO@    R0,     R5                      ; 633E   0268
        DECR    R3                              ; 633F   0013
        DECR    R1                              ; 6340   0011
        DECR    R2                              ; 6341   0012
        BNEQ    L_633D                          ; 6342   022C 0006

        ADDI    #$0010, R3                      ; 6344   02FB 0010
        TSTR    R1                              ; 6346   0089
        BNEQ    L_633B                          ; 6347   022C 000D
        MOVR    R4,     R7                      ; 6349   00A7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 634A   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 634E   0000 0002 0000 0000
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 6352   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00F0,  $00F0,  $00E0   ; 6356   00F8 00F0 00F0 00E0
        DECLE   $0000,  $0001,  $0003,  $0007   ; 635A   0000 0001 0003 0007
        DECLE   $000F,  $000F,  $001F,  $001F   ; 635E   000F 000F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6362   0000 0000 0000 0000
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 6366   0003 000F 003F 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636A   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 636E   00FF 00FF 00FF 00FF
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 6372   0003 000F 003F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6376   00FF 00FF 00FF 00FF
        DECLE   $00C0,  $00F0,  $00FC,  $00FF   ; 637A   00C0 00F0 00FC 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 637E   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6382   0000 0000 0000 0000
        DECLE   $00C0,  $00F0,  $00FC,  $00FF   ; 6386   00C0 00F0 00FC 00FF
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 638A   0003 000F 003F 00FF
        DECLE   $007F,  $00FF,  $007F,  $00FF   ; 638E   007F 00FF 007F 00FF
        DECLE   $0000,  $0000,  $006E,  $00F8   ; 6392   0000 0000 006E 00F8
        DECLE   $00F8,  $006E,  $0000,  $0000   ; 6396   00F8 006E 0000 0000
        DECLE   $0000,  $000E,  $003F,  $000F   ; 639A   0000 000E 003F 000F
        DECLE   $000F,  $003F,  $000E,  $0000   ; 639E   000F 003F 000E 0000
        DECLE   $0000,  $0000,  $0000,  $006E   ; 63A2   0000 0000 0000 006E
        DECLE   $00F8,  $006E,  $0000,  $0000   ; 63A6   00F8 006E 0000 0000
        DECLE   $0000,  $0001,  $0001,  $003F   ; 63AA   0000 0001 0001 003F
        DECLE   $003F,  $0001,  $0001,  $0000   ; 63AE   003F 0001 0001 0000
        DECLE   $0000,  $0003,  $000D,  $0015   ; 63B2   0000 0003 000D 0015
        DECLE   $0015,  $000D,  $0003,  $0000   ; 63B6   0015 000D 0003 0000
        DECLE   $0000,  $0003,  $000D,  $003F   ; 63BA   0000 0003 000D 003F
L_63BE:
        DECR    R7                              ; 63BE   0017

        DECLE   $000F,  $0003,  $0000,  $0000   ; 63BF   000F 0003 0000 0000
        DECLE   $00E0,  $0058,  $0054,  $0054   ; 63C3   00E0 0058 0054 0054
        DECLE   $0058,  $00E0,  $0000,  $0020   ; 63C7   0058 00E0 0000 0020
        DECLE   $00C0,  $00F8,  $00FC,  $00FE   ; 63CB   00C0 00F8 00FC 00FE
        DECLE   $00DC,  $00E0,  $0000,  $0000   ; 63CF   00DC 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 63D3   0000 0000 0000 0006
        DECLE   $001E,  $007E,  $003E,  $0000   ; 63D7   001E 007E 003E 0000
        DECLE   $0000,  $0000,  $0001,  $0006   ; 63DB   0000 0000 0001 0006
        DECLE   $003D,  $007F,  $007E,  $003E   ; 63DF   003D 007F 007E 003E
        DECLE   $007E,  $001E,  $0006,  $0000   ; 63E3   007E 001E 0006 0000
        DECLE   $0000,  $0000,  $0000,  $00BF   ; 63E7   0000 0000 0000 00BF
        DECLE   $005F,  $003E,  $0046,  $0008   ; 63EB   005F 003E 0046 0008
        DECLE   $0000,  $0000,  $0000,  $0003   ; 63EF   0000 0000 0000 0003
        DECLE   $0004,  $000B,  $003C,  $003B   ; 63F3   0004 000B 003C 003B
        DECLE   $000C,  $000B,  $000C,  $0001   ; 63F7   000C 000B 000C 0001
        DECLE   $0002,  $0003,  $0016,  $000B   ; 63FB   0002 0003 0016 000B
        DECLE   $0005                           ; 63FF   0005

        INCR    R7                              ; 6400   000F

        INCR    R2                              ; 6401   000A
L_6402:
        INCR    R3                              ; 6402   000B
        DECLE   $000C,  $003B,  $003C,  $000B   ; 6403   000C 003B 003C 000B
        DECLE   $0004,  $0003,  $0000           ; 6407   0004 0003 0000

        SETC                                    ; 640A   0007
        INCR    R2                              ; 640B   000A
        INCR    R5                              ; 640C   000D
L_640D:
        DECR    R7                              ; 640D   0017

        DECLE   $000B,  $0006,  $0003,  $0000   ; 640E   000B 0006 0003 0000
        DECLE   $0000                           ; 6412   0000

        INCR    R6                              ; 6413   000E
        RRC     R3,     2                       ; 6414   0077
        INCR    R7                              ; 6415   000F
        INCR    R7                              ; 6416   000F

L_6417:
        RRC     R3,     2                       ; 6417   0077
L_6418:
        INCR    R6                              ; 6418   000E
        DECLE   $0000,  $0000,  $004E,  $0037   ; 6419   0000 0000 004E 0037

        INCR    R7                              ; 641D   000F

        SETC                                    ; 641E   0007
L_641F:
        COMR    R3                              ; 641F   001B
        DECLE   $0026,  $0000,  $0000,  $0001   ; 6420   0026 0000 0000 0001
        DECLE   $0001,  $007E,  $007E,  $0001   ; 6424   0001 007E 007E 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 6428   0001 0000 0000 0001
        DECLE   $001D,  $003F,  $0007,  $0000   ; 642C   001D 003F 0007 0000
        DECLE   $0001,  $0000,  $0000,  $0008   ; 6430   0001 0000 0000 0008
        DECLE   $001C,  $0036,  $0036,  $001C   ; 6434   001C 0036 0036 001C
        DECLE   $0008,  $0000,  $0000,  $0002   ; 6438   0008 0000 0000 0002
        DECLE   $000C,  $001A,  $000E,  $001C   ; 643C   000C 001A 000E 001C
        DECLE   $0008,  $0000,  $001C,  $007E   ; 6440   0008 0000 001C 007E
        DECLE   $00FE,  $00F7,  $0077,  $0037   ; 6444   00FE 00F7 0077 0037
        DECLE   $0037,  $0037,  $002C,  $0016   ; 6448   0037 0037 002C 0016
        DECLE   $001F,  $002A,  $0075,  $002D   ; 644C   001F 002A 0075 002D
        DECLE   $001B,  $000B,  $0018,  $003C   ; 6450   001B 000B 0018 003C
        DECLE   $003E,  $00DE,  $000F,  $000F   ; 6454   003E 00DE 000F 000F
        DECLE   $0036,  $0000,  $0000           ; 6458   0036 0000 0000

        GSWD    R0                              ; 645B   0030
        SARC    R0,     2                       ; 645C   007C
        RSWD    R6                              ; 645D   003E
        SLLC    R3,     2                       ; 645E   005F
        MOVR    R0,     R7                      ; 645F   0087

        DECLE   $000A,  $0010,  $0000,  $00E8   ; 6460   000A 0010 0000 00E8
        DECLE   $0048,  $0048,  $0048,  $004A   ; 6464   0048 0048 0048 004A
        DECLE   $004E,  $0000,  $0081,  $00C3   ; 6468   004E 0000 0081 00C3
        DECLE   $0066,  $003C,  $0018,  $0018   ; 646C   0066 003C 0018 0018
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6470   0000 0000 0018 0018
        DECLE   $003C,  $0066,  $00C3,  $0081   ; 6474   003C 0066 00C3 0081
        DECLE   $0000,  $0000,  $007F,  $0030   ; 6478   0000 0000 007F 0030
        DECLE   $00B8,  $00F4,  $00B8,  $0030   ; 647C   00B8 00F4 00B8 0030
        DECLE   $007F,  $0000,  $0020,  $0010   ; 6480   007F 0000 0020 0010
        DECLE   $0000,  $00C0,  $0000,  $0010   ; 6484   0000 00C0 0000 0010
        DECLE   $0020,  $0000,  $0020,  $0010   ; 6488   0020 0000 0020 0010
        DECLE   $0008,  $00F0,  $0008,  $0010   ; 648C   0008 00F0 0008 0010
        DECLE   $0020,  $0000,  $0000,  $0010   ; 6490   0020 0000 0000 0010
        DECLE   $0008,  $00FC,  $0008,  $0010   ; 6494   0008 00FC 0008 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6498   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 649C   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 64A0   0000 0000 0000 0060
        DECLE   $0000,  $0006,  $0000,  $0060   ; 64A4   0000 0006 0000 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64A8   0000 0000 0000 0000
        DECLE   $0000,  $000A,  $0071,  $0038   ; 64AC   0000 000A 0071 0038
        DECLE   $00B4,  $00E0,  $00B0,  $0038   ; 64B0   00B4 00E0 00B0 0038
        DECLE   $0060,  $0019,  $0004,  $0000   ; 64B4   0060 0019 0004 0000
        DECLE   $0000,  $0000,  $0008,  $0012   ; 64B8   0000 0000 0008 0012
        DECLE   $0001,  $0048,  $0030,  $0012   ; 64BC   0001 0048 0030 0012
        DECLE   $00A0,  $00C0,  $00A0,  $0030   ; 64C0   00A0 00C0 00A0 0030
        DECLE   $0012,  $0058,  $0000,  $0021   ; 64C4   0012 0058 0000 0021
        DECLE   $0010,  $0004,  $0004,  $0002   ; 64C8   0010 0004 0004 0002
        DECLE   $0006,  $00F9,  $0006,  $000A   ; 64CC   0006 00F9 0006 000A
        DECLE   $0001,  $0000,  $0000,  $0000   ; 64D0   0001 0000 0000 0000
        DECLE   $0000,  $0008,  $0004,  $0002   ; 64D4   0000 0008 0004 0002
        DECLE   $001A,  $000C,  $001E,  $00E5   ; 64D8   001A 000C 001E 00E5
        DECLE   $000E,  $001C,  $002A,  $0002   ; 64DC   000E 001C 002A 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E0   0000 0000 0000 0000
        DECLE   $0008,  $0004,  $0004,  $0022   ; 64E4   0008 0004 0004 0022
        DECLE   $001A,  $000E,  $0015,  $002E   ; 64E8   001A 000E 0015 002E
        DECLE   $0037,  $001D,  $002E,  $007A   ; 64EC   0037 001D 002E 007A
        DECLE   $002A,  $0000,  $0000,  $0004   ; 64F0   002A 0000 0000 0004
        DECLE   $0000,  $0020,  $0001,  $0000   ; 64F4   0000 0020 0001 0000
        DECLE   $0004                           ; 64F8   0004

        INCR    R2                              ; 64F9   000A
        EIS                                     ; 64FA   0002

        JSRD    R4,     .EXEC.008               ; 64FB   0004 0012 0008
        DECLE   $0001,  $0000,  $0020,  $0002   ; 64FE   0001 0000 0020 0002
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6502   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; 6506   0000 0000 00FF 0000
        DECLE   $0004,  $0008,  $0010,  $0020   ; 650A   0004 0008 0010 0020
        DECLE   $0040,  $0080,  $0001,  $0002   ; 650E   0040 0080 0001 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; 6512   0004 0008 0010 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6516   0000 0000 0000 0000
        DECLE   $0008,  $0010,  $0021,  $0042   ; 651A   0008 0010 0021 0042
        DECLE   $0084,  $0008,  $0010,  $0000   ; 651E   0084 0008 0010 0000
        DECLE   $006E,  $006E,  $00F8,  $00F8   ; 6522   006E 006E 00F8 00F8
        DECLE   $00F8,  $00F8,  $006E,  $006E   ; 6526   00F8 00F8 006E 006E
        DECLE   $0000,  $0000,  $006E,  $006E   ; 652A   0000 0000 006E 006E
        DECLE   $00F8,  $00F8,  $006E,  $006E   ; 652E   00F8 00F8 006E 006E
        DECLE   $0000,  $0000,  $0000,  $0060   ; 6532   0000 0000 0000 0060
        DECLE   $00F0,  $0060,  $0000,  $0000   ; 6536   00F0 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 653A   0000 0000 0000 0010
        DECLE   $0038,  $0010,  $0000,  $0000   ; 653E   0038 0010 0000 0000
        DECLE   $0008,  $001C,  $0048,  $00E0   ; 6542   0008 001C 0048 00E0
        DECLE   $0042,  $0007,  $0002,  $0000   ; 6546   0042 0007 0002 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 654A   0000 0000 0040 0040
        DECLE   $00E0,  $00E0,  $0040,  $0040   ; 654E   00E0 00E0 0040 0040
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6552   0000 00FF 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6556   0000 00FF 0000 0000
        DECLE   $0000,  $0010,  $0030,  $0010   ; 655A   0000 0010 0030 0010
        DECLE   $0010,  $0010,  $0038,  $0000   ; 655E   0010 0010 0038 0000
        DECLE   $0000,  $0038,  $0020,  $0030   ; 6562   0000 0038 0020 0030
        DECLE   $0008,  $0008,  $0030,  $0000   ; 6566   0008 0008 0030 0000
        DECLE   $0000,  $004A,  $00D5,  $0055   ; 656A   0000 004A 00D5 0055
        DECLE   $0055,  $0055,  $00EA,  $0000   ; 656E   0055 0055 00EA 0000
        DECLE   $0000,  $0044,  $00CA,  $004A   ; 6572   0000 0044 00CA 004A
        DECLE   $004A,  $004A,  $00E4,  $0000   ; 6576   004A 004A 00E4 0000
        DECLE   $0000,  $0044,  $00AA,  $002A   ; 657A   0000 0044 00AA 002A
        DECLE   $004A,  $008A,  $00E4,  $0000   ; 657E   004A 008A 00E4 0000
        DECLE   $0000,  $004E,  $00A8,  $002C   ; 6582   0000 004E 00A8 002C
        DECLE   $0042,  $0082,  $00EC,  $0000   ; 6586   0042 0082 00EC 0000
        DECLE   $0000,  $00E4,  $008A,  $00CA   ; 658A   0000 00E4 008A 00CA
        DECLE   $002A,  $002A,  $00C4,  $0000   ; 658E   002A 002A 00C4 0000
        DECLE   $0000,  $00EE,  $0028,  $002C   ; 6592   0000 00EE 0028 002C
        DECLE   $0042,  $0042,  $004C,  $0000   ; 6596   0042 0042 004C 0000

        INCR    R3                              ; 659A   000B
        MOVR    R3,     R7                      ; 659B   009F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 659C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0080,  $00E0   ; 65A0   00FF 00FF 0080 00E0
        DECLE   $00F8,  $00F0,  $00FC,  $00F4   ; 65A4   00F8 00F0 00FC 00F4
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 65A8   00F8 00FC 00FE 00FF

        ADDR    R7,     R6                      ; 65AC   00FE
        ADDR    R7,     R4                      ; 65AD   00FC
        ADDR    R7,     R6                      ; 65AE   00FE
        SARC    R3,     2                       ; 65AF   007F
        ADCR    R7                              ; 65B0   002F

        MOVR    R0,     R6                      ; 65B1   0086
L_65B2:
        ADDR    R7,     R6                      ; 65B2   00FE
        DECLE   $00FC,  $00F0,  $00F8,  $00F8   ; 65B3   00FC 00F0 00F8 00F8
        DECLE   $00EC,  $00E0,  $00C0,  $00FF   ; 65B7   00EC 00E0 00C0 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 65BB   00FF 00FF 00FF 00FF

        ADDR    R7,     R6                      ; 65BF   00FE
        ADDR    R5,     R7                      ; 65C0   00EF

        DECLE   $0086,  $0000,  $0000,  $0000   ; 65C1   0086 0000 0000 0000
        DECLE   $0000,  $0000                   ; 65C5   0000 0000

        DECR    R0                              ; 65C7   0010
        RSWD    R2                              ; 65C8   003A
        ADDR    R3,     R7                      ; 65C9   00DF

        DECLE   $0080,  $00C0,  $00F0,  $00FC   ; 65CA   0080 00C0 00F0 00FC
        DECLE   $00F8,  $00FE,  $00FC,  $00F8   ; 65CE   00F8 00FE 00FC 00F8
        DECLE   $00E0,  $00F0,  $00E0,  $0080   ; 65D2   00E0 00F0 00E0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D6   0000 0000 0000 0000
        DECLE   $0040,  $0020,  $0060,  $00F0   ; 65DA   0040 0020 0060 00F0
        DECLE   $0078,  $0038,  $003C,  $0074   ; 65DE   0078 0038 003C 0074
        DECLE   $00EE,  $00CC,  $009C,  $0018   ; 65E2   00EE 00CC 009C 0018
        DECLE   $0038,  $0070,  $00F0,  $00C0   ; 65E6   0038 0070 00F0 00C0
        DECLE   $0000,  $0001,  $0007,  $000F   ; 65EA   0000 0001 0007 000F
        DECLE   $001E,  $001F                   ; 65EE   001E 001F

        RSWD    R6                              ; 65F0   003E
        SARC    R1,     2                       ; 65F1   007D
        MOVR    R1,     R0                      ; 65F2   0088
        COMR    R0                              ; 65F3   0018
        GSWD    R0                              ; 65F4   0030
        GSWD    R0                              ; 65F5   0030
        SLR     R0,     1                       ; 65F6   0060
        ADDR    R4,     R0                      ; 65F7   00E0
        ADDR    R4,     R0                      ; 65F8   00E0
        ADDR    R0,     R0                      ; 65F9   00C0
        SARC    R3,     1                       ; 65FA   007B
        ADDR    R4,     R7                      ; 65FB   00E7

        MOVR    R1,     R6                      ; 65FC   008E
        COMR    R6                              ; 65FD   001E
        RSWD    R4                              ; 65FE   003C
        ADDR    R7,     R0                      ; 65FF   00F8
        SARC    R1,     2                       ; 6600   007D
        SARC    R3,     1                       ; 6601   007B
        ADDR    R4,     R7                      ; 6602   00E7
        MOVR    R0,     R7                      ; 6603   0087

        DECLE   $000C,  $0078,  $00F0,  $00E0   ; 6604   000C 0078 00F0 00E0
        DECLE   $00C0,  $0080,  $0001,  $0007   ; 6608   00C0 0080 0001 0007
        DECLE   $0000,  $0000,  $0001,  $000F   ; 660C   0000 0000 0001 000F
        DECLE   $003F,  $007F,  $00FF,  $00FE   ; 6610   003F 007F 00FF 00FE
        DECLE   $00EC,  $00DC,  $0038,  $00F0   ; 6614   00EC 00DC 0038 00F0
        DECLE   $00C0,  $0000,  $0000,  $00F3   ; 6618   00C0 0000 0000 00F3
        DECLE   $00FF,  $00DE,  $0000,  $0000   ; 661C   00FF 00DE 0000 0000
        DECLE   $0003,  $003F,  $007B,  $00FD   ; 6620   0003 003F 007B 00FD
        DECLE   $003F,  $0007,  $0000,  $0000   ; 6624   003F 0007 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6628   0000 0000 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6630   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6634   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6638   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0030,  $0000   ; 663C   0030 0000 0030 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6640   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0030,  $0000   ; 6644   0030 0000 0030 0000
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6648   0030 0000 0000 0000
        DECLE   $0002,  $0007,  $000F,  $001F   ; 664C   0002 0007 000F 001F
        DECLE   $003F,  $007F,  $00FF,  $007F   ; 6650   003F 007F 00FF 007F
        DECLE   $003F,  $001F                   ; 6654   003F 001F

        INCR    R7                              ; 6656   000F

        SETC                                    ; 6657   0007
L_6658:
        EIS                                     ; 6658   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6659   0000 0000 0000 0000
        DECLE   $0006,  $001F,  $007F,  $003F   ; 665D   0006 001F 007F 003F
        DECLE   $001F,  $000F,  $001F,  $003F   ; 6661   001F 000F 001F 003F
        DECLE   $007F,  $001F,  $0006,  $0000   ; 6665   007F 001F 0006 0000
        DECLE   $0000,  $0004,  $000C,  $000E   ; 6669   0000 0004 000C 000E
        DECLE   $001E,  $001C,  $001C,  $003E   ; 666D   001E 001C 001C 003E
        DECLE   $003E,  $003E,  $003E,  $001C   ; 6671   003E 003E 003E 001C
        DECLE   $001C,  $001E,  $000E,  $000C   ; 6675   001C 001E 000E 000C
        DECLE   $0004,  $0000,  $0000,  $0018   ; 6679   0004 0000 0000 0018
        DECLE   $0038,  $003C,  $0076,  $0067   ; 667D   0038 003C 0076 0067
        DECLE   $00F3,  $00F3,  $00F3,  $0067   ; 6681   00F3 00F3 00F3 0067
        DECLE   $0076,  $003C,  $0038,  $0018   ; 6685   0076 003C 0038 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6689   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 668D   0000 0000 0000 001E
        DECLE   $007F,  $00FF,  $007F,  $001E   ; 6691   007F 00FF 007F 001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6695   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6699   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669D   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0003   ; 66A1   0000 0007 0007 0003
        DECLE   $0003,  $0001,  $0001,  $0000   ; 66A5   0003 0001 0001 0000
        DECLE   $0000,  $007F,  $007F,  $003F   ; 66A9   0000 007F 007F 003F
        DECLE   $003F,  $003F,  $001F,  $001F   ; 66AD   003F 003F 001F 001F
        DECLE   $001F                           ; 66B1   001F

        INCR    R7                              ; 66B2   000F
        INCR    R7                              ; 66B3   000F
L_66B4:
        INCR    R7                              ; 66B4   000F

L_66B5:
        SETC                                    ; 66B5   0007
L_66B6:
        SETC                                    ; 66B6   0007
        DECLE   $0007,  $0007,  $0003,  $0003   ; 66B7   0007 0007 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0001   ; 66BB   0003 0003 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 66BF   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 66C3   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CB   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000           ; 66CF   0002 0000 0000
L_66D2:
        CLRR    R0                              ; 66D2   01C0
        B       L_66D7                          ; 66D3   0200 0002

L_66D5:
        ADDR    R2,     R0                      ; 66D5   00D0
L_66D6:
        ADDR    R2,     R2                      ; 66D6   00D2
L_66D7:
        SARC    R1,     1                       ; 66D7   0079
        BC      L_66D5                          ; 66D8   0221 0004
        BNEQ    L_66D6                          ; 66DA   022C 0005
        MOVR    R4,     R7                      ; 66DC   00A7

L_66DD:
        CLRR    R0                              ; 66DD   01C0
        MOVR    R2,     R3                      ; 66DE   0093
L_66DF:
        ADDR    R2,     R2                      ; 66DF   00D2
        CMPR    R2,     R1                      ; 66E0   0151
        BC      L_66DF                          ; 66E1   0221 0003

L_66E3:
        ADDR    R0,     R0                      ; 66E3   00C0
        SARC    R2,     1                       ; 66E4   007A
        CMPR    R2,     R1                      ; 66E5   0151
        BNC     L_66EA                          ; 66E6   0209 0002

        SUBR    R2,     R1                      ; 66E8   0111
        INCR    R0                              ; 66E9   0008
L_66EA:
        CMPR    R2,     R3                      ; 66EA   0153
        BNEQ    L_66E3                          ; 66EB   022C 0009
        MOVR    R4,     R7                      ; 66ED   00A7

L_66EE:
        CLRR    R5                              ; 66EE   01ED
        MVI     G_0352, R0                      ; 66EF   0280 0352
L_66F1:
        MOVR    R0,     R2                      ; 66F1   0082
        MOVR    R0,     R3                      ; 66F2   0083
        SARC    R3,     2                       ; 66F3   007F
        SARC    R3,     2                       ; 66F4   007F
        XORR    R3,     R2                      ; 66F5   01DA
        SWAP    R3,     1                       ; 66F6   0043
        SARC    R3,     1                       ; 66F7   007B
        XORR    R3,     R2                      ; 66F8   01DA
        SARC    R3,     2                       ; 66F9   007F
        XORR    R3,     R2                      ; 66FA   01DA
        SARC    R2,     1                       ; 66FB   007A
        RLC     R0,     1                       ; 66FC   0050
        ADDR    R5,     R5                      ; 66FD   00ED
        INCR    R5                              ; 66FE   000D
        DECR    R1                              ; 66FF   0011
        BNEQ    L_66F1                          ; 6700   022C 0010

        MVO     R0,     G_0352                  ; 6702   0240 0352
        ANDR    R5,     R0                      ; 6704   01A8
        MOVR    R4,     R7                      ; 6705   00A7

L_6706:
        PSHR    R4                              ; 6706   0274
        MVII    #$0317, R1                      ; 6707   02B9 0317
        MVII    #$033F, R5                      ; 6709   02BD 033F
        MVII    #$032F, R3                      ; 670B   02BB 032F
        MVII    #$00FF, R2                      ; 670D   02BA 00FF
L_670F:
        MVI@    R3,     R0                      ; 670F   0298
        ADD@    R5,     R0                      ; 6710   02E8
        MVO@    R0,     R3                      ; 6711   0258
        SWAP    R0,     1                       ; 6712   0040
        ANDR    R2,     R0                      ; 6713   0190
        MVI@    R1,     R4                      ; 6714   028C
        COMR    R2                              ; 6715   001A
        ANDR    R2,     R4                      ; 6716   0194
        COMR    R2                              ; 6717   001A
        ADDR    R0,     R4                      ; 6718   00C4
        MVO@    R4,     R1                      ; 6719   024C
        INCR    R1                              ; 671A   0009
        INCR    R3                              ; 671B   000B
        CMPI    #$031F, R1                      ; 671C   0379 031F
        BLT     L_670F                          ; 671E   0225 0010
        BGT     L_6723                          ; 6720   020E 0001

        SLR     R2,     1                       ; 6722   0062
L_6723:
        CMPI    #$0327, R1                      ; 6723   0379 0327
        BLT     L_670F                          ; 6725   0225 0017
        PULR    R7                              ; 6727   02B7

L_6728:
        PSHR    R4                              ; 6728   0274
        CLRR    R0                              ; 6729   01C0
        MVII    #$0317, R1                      ; 672A   02B9 0317
        MVII    #$032F, R4                      ; 672C   02BC 032F
        MVII    #$0337, R5                      ; 672E   02BD 0337
L_6730:
        MVI@    R4,     R2                      ; 6730   02A2
        SWAP    R2,     1                       ; 6731   0042
        MVI@    R5,     R3                      ; 6732   02AB
        SWAP    R3,     1                       ; 6733   0043
        ANDI    #$00FF, R2                      ; 6734   03BA 00FF
        CMPI    #$00A8, R2                      ; 6736   037A 00A8
        BGE     L_6740                          ; 6738   020D 0006

        ANDI    #$00FF, R3                      ; 673A   03BB 00FF
        CMPI    #$0068, R3                      ; 673C   037B 0068
        BLT     L_6746                          ; 673E   0205 0006

L_6740:
        MVO@    R0,     R1                      ; 6740   0248
        SUBI    #$01FF, R1                      ; 6741   0339 01FF
        MVO@    R0,     R1                      ; 6743   0248
        ADDI    #$01FF, R1                      ; 6744   02F9 01FF
L_6746:
        INCR    R1                              ; 6746   0009
        CMPI    #$031E, R1                      ; 6747   0379 031E
        BLE     L_6730                          ; 6749   0226 001A
        PULR    R7                              ; 674B   02B7

L_674C:
        PSHR    R4                              ; 674C   0274
        CLRR    R4                              ; 674D   01E4
        MVII    #$0118, R1                      ; 674E   02B9 0118
L_6750:
        MVI@    R1,     R2                      ; 6750   028A
        MOVR    R2,     R3                      ; 6751   0093
        ANDI    #$0007, R3                      ; 6752   03BB 0007
        BEQ     L_6838                          ; 6754   0204 00E2

        DECR    R2                              ; 6756   0012
        MVO@    R2,     R1                      ; 6757   024A
        DECR    R3                              ; 6758   0013
        BNEQ    L_6838                          ; 6759   020C 00DD

        ANDI    #$0020, R2                      ; 675B   03BA 0020
        BNEQ    L_6845                          ; 675D   020C 00E6

L_675F:
        MOVR    R4,     R2                      ; 675F   00A2
        ADDI    #$0110, R2                      ; 6760   02FA 0110
        MVI@    R2,     R3                      ; 6762   0293
        INCR    R3                              ; 6763   000B
        MVO@    R3,     R2                      ; 6764   0253
        SDBD                                    ; 6765   0001
        ADDI    #$6887, R3                      ; 6766   02FB 0087 0068
        MVI@    R3,     R0                      ; 6769   0298
        ANDI    #$0300, R0                      ; 676A   03B8 0300
        BNEQ    L_677E                          ; 676C   020C 0010

        XOR@    R3,     R0                      ; 676E   03D8
        ANDI    #$0007, R0                      ; 676F   03B8 0007
        ADD@    R1,     R0                      ; 6771   02C8
        MVO@    R0,     R1                      ; 6772   0248
        MVI@    R3,     R0                      ; 6773   0298
        ANDI    #$00F8, R0                      ; 6774   03B8 00F8
        SLR     R0,     1                       ; 6776   0060
        ADDI    #$0008, R1                      ; 6777   02F9 0008
        MVO@    R0,     R1                      ; 6779   0248
        SUBI    #$0008, R1                      ; 677A   0339 0008
        B       L_6838                          ; 677C   0200 00BA

L_677E:
        CMPI    #$0200, R0                      ; 677E   0378 0200
        BGE     L_678A                          ; 6780   020D 0008

L_6782:
        CLRR    R0                              ; 6782   01C0
        MVO@    R0,     R1                      ; 6783   0248
        MOVR    R4,     R2                      ; 6784   00A2
        ADDI    #$0317, R2                      ; 6785   02FA 0317
        MVO@    R0,     R2                      ; 6787   0250
        B       L_6838                          ; 6788   0200 00AE
L_678A:
        BGT     L_6815                          ; 678A   020E 0089

        MVI@    R3,     R0                      ; 678C   0298
        CMPI    #$02FF, R0                      ; 678D   0378 02FF
        BNEQ    L_67B6                          ; 678F   020C 0025

        MVI     G_0106, R2                      ; 6791   0282 0106
        DECR    R2                              ; 6793   0012
        MVO     R2,     G_0106                  ; 6794   0242 0106
        BNEQ    L_679A                          ; 6796   020C 0002

        MVO     R2,     G_0108                  ; 6798   0242 0108
L_679A:
        CLRR    R0                              ; 679A   01C0
        MVO     R0,     G_0103                  ; 679B   0240 0103
        COMR    R0                              ; 679D   0018
        MVO     R0,     G_0102                  ; 679E   0240 0102
        MVII    #$0060, R0                      ; 67A0   02B8 0060
        MVO     R0,     G_035A                  ; 67A2   0240 035A
L_67A4:
        MVI     G_0102, R0                      ; 67A4   0280 0102
        TSTR    R0                              ; 67A6   0080
        BNEQ    L_67A4                          ; 67A7   022C 0004

        TSTR    R2                              ; 67A9   0092
        BEQ     L_67B2                          ; 67AA   0204 0006

        CLRR    R3                              ; 67AC   01DB
        MVII    #$0001, R1                      ; 67AD   02B9 0001

        JSR     R4,     L_6048                  ; 67AF   0004 0060 0048
L_67B2:
        JSR     R4,     L_5AAD                  ; 67B2   0004 0058 02AD

        PULR    R7                              ; 67B5   02B7

L_67B6:
        CMPI    #$02FE, R0                      ; 67B6   0378 02FE
        BNEQ    L_67C1                          ; 67B8   020C 0007

        PSHR    R4                              ; 67BA   0274

        JSR     R4,     L_5505                  ; 67BB   0004 0054 0105

        PULR    R4                              ; 67BE   02B4
        B       L_675F                          ; 67BF   0220 0061

L_67C1:
        CMPI    #$0280, R0                      ; 67C1   0378 0280
        BLT     L_67C9                          ; 67C3   0205 0004

        XOR@    R1,     R0                      ; 67C5   03C8
        MVO@    R0,     R1                      ; 67C6   0248
        B       L_675F                          ; 67C7   0220 0069

L_67C9:
        XOR@    R1,     R0                      ; 67C9   03C8
        MVO@    R0,     R1                      ; 67CA   0248
        MOVR    R1,     R2                      ; 67CB   008A
        ADDI    #$009A, R2                      ; 67CC   02FA 009A
        MVI@    R2,     R2                      ; 67CE   0292
        TSTR    R2                              ; 67CF   0092
        BEQ     L_6782                          ; 67D0   0224 004F

        SUBI    #$0024, R2                      ; 67D2   033A 0024
        SLR     R2,     1                       ; 67D4   0062
        SDBD                                    ; 67D5   0001
        ADDI    #$67ED, R2                      ; 67D6   02FA 00ED 0067
        MVI@    R2,     R2                      ; 67D9   0292
        ADDI    #$0008, R1                      ; 67DA   02F9 0008
        MVO@    R2,     R1                      ; 67DC   024A
        SUBI    #$0010, R1                      ; 67DD   0339 0010
        MVII    #$002C, R2                      ; 67DF   02BA 002C
        MVO@    R2,     R1                      ; 67E1   024A
        ADDI    #$020F, R1                      ; 67E2   02F9 020F
        MVI@    R1,     R2                      ; 67E4   028A
        ANDI    #$007F, R2                      ; 67E5   03BA 007F
        MVO@    R2,     R1                      ; 67E7   024A
        SUBI    #$0207, R1                      ; 67E8   0339 0207
        B       L_6838                          ; 67EA   0200 004C

        DECLE   $0000,  $0084,  $0005,  $008C   ; 67EC   0000 0084 0005 008C
        DECLE   $000A,  $0090,  $0014,  $0090   ; 67F0   000A 0090 0014 0090
        DECLE   $0014,  $0098,  $0032,  $0098   ; 67F4   0014 0098 0032 0098
        DECLE   $0032,  $0094,  $0019,  $0094   ; 67F8   0032 0094 0019 0094
        DECLE   $0019,  $0080,  $0001,  $0084   ; 67FC   0019 0080 0001 0084
        DECLE   $0005,  $0084,  $0005,  $008C   ; 6800   0005 0084 0005 008C
        DECLE   $000A,  $0000,  $0000           ; 6804   000A 0000 0000

        MOVR    R1,     R4                      ; 6807   008C
        INCR    R2                              ; 6808   000A
        MOVR    R1,     R4                      ; 6809   008C
        INCR    R2                              ; 680A   000A
        MOVR    R2,     R4                      ; 680B   0094
        COMR    R1                              ; 680C   0019
        MOVR    R3,     R4                      ; 680D   009C
        SLL     R3,     1                       ; 680E   004B
        MOVR    R3,     R0                      ; 680F   0098
        GSWD    R2                              ; 6810   0032
        MOVR    R2,     R0                      ; 6811   0090
        DECR    R4                              ; 6812   0014
        MOVR    R1,     R0                      ; 6813   0088
        SLR     R0,     2                       ; 6814   0064
L_6815:
        XOR@    R3,     R0                      ; 6815   03D8
        MOVR    R0,     R2                      ; 6816   0082
        ANDI    #$0007, R0                      ; 6817   03B8 0007
        XORR    R0,     R2                      ; 6819   01C2
        SWAP    R2,     1                       ; 681A   0042
        SLR     R2,     1                       ; 681B   0062
        MOVR    R2,     R3                      ; 681C   0093
        SDBD                                    ; 681D   0001
        ANDI    #$1000, R2                      ; 681E   03BA 0000 0010
        XORR    R2,     R3                      ; 6821   01D3
        XORR    R2,     R0                      ; 6822   01D0
        SLR     R3,     2                       ; 6823   0067
        SLR     R3,     1                       ; 6824   0063
        MOVR    R4,     R2                      ; 6825   00A2
        ADDI    #$0327, R2                      ; 6826   02FA 0327
        MVI@    R2,     R5                      ; 6828   0295
        SDBD                                    ; 6829   0001
        ANDI    #$EFF8, R5                      ; 682A   03BD 00F8 00EF
        XORR    R0,     R5                      ; 682D   01C5
        MVO@    R5,     R2                      ; 682E   0255
        SUBI    #$0008, R2                      ; 682F   033A 0008
        MVI@    R2,     R5                      ; 6831   0295
        ANDI    #$027F, R5                      ; 6832   03BD 027F
        XORR    R3,     R5                      ; 6834   01DD
        MVO@    R5,     R2                      ; 6835   0255
        B       L_675F                          ; 6836   0220 00D8

L_6838:
        INCR    R1                              ; 6838   0009
        INCR    R4                              ; 6839   000C
        CMPI    #$0007, R4                      ; 683A   037C 0007
        BLE     L_6750                          ; 683C   0226 00ED
        PULR    R7                              ; 683E   02B7
L_683F:
        DECR    R7                              ; 683F   0017

        NEGR    R2                              ; 6840   0022
        GSWD    R3                              ; 6841   0033
        ADCR    R6                              ; 6842   002E
        COMR    R5                              ; 6843   001D
        RSWD    R1                              ; 6844   0039
L_6845:
        MOVR    R1,     R3                      ; 6845   008B
        ADDI    #$0008, R3                      ; 6846   02FB 0008
        MVI@    R3,     R2                      ; 6848   029A
        SLR     R2,     2                       ; 6849   0066
        SDBD                                    ; 684A   0001
        ADDI    #$6826, R2                      ; 684B   02FA 0026 0068
        MVI@    R2,     R3                      ; 684E   0293
        ANDI    #$0007, R3                      ; 684F   03BB 0007
        XOR@    R1,     R3                      ; 6851   03CB
        MVO@    R3,     R1                      ; 6852   024B
        MVI@    R2,     R3                      ; 6853   0293
        ANDI    #$0078, R3                      ; 6854   03BB 0078
        SLL     R3,     2                       ; 6856   004F
        SLL     R3,     2                       ; 6857   004F
        NEGR    R3                              ; 6858   0023
        ADDI    #$0227, R1                      ; 6859   02F9 0227
        MVO@    R3,     R1                      ; 685B   024B
        SUBI    #$0008, R1                      ; 685C   0339 0008
        MVI@    R1,     R0                      ; 685E   0288
        SAR     R3,     2                       ; 685F   006F
        SUB     G_0337, R0                      ; 6860   0300 0337
        BPL     L_6865                          ; 6862   0203 0001

        NEGR    R3                              ; 6864   0023
L_6865:
        ADDI    #$0010, R1                      ; 6865   02F9 0010
        ADD@    R1,     R3                      ; 6867   02CB
        MVO@    R3,     R1                      ; 6868   024B
        SUBI    #$0018, R1                      ; 6869   0339 0018
        MVI@    R1,     R0                      ; 686B   0288
        SUBI    #$0217, R1                      ; 686C   0339 0217
        SUB     G_032F, R0                      ; 686E   0300 032F
        SDBD                                    ; 6870   0001
        CMPI    #$0800, R0                      ; 6871   0378 0000 0008
        BGT     L_6838                          ; 6874   022E 003D

        MVII    #$0081, R0                      ; 6876   02B8 0081
        MVO@    R0,     R1                      ; 6878   0248
        MVII    #$0024, R0                      ; 6879   02B8 0024
        MOVR    R1,     R2                      ; 687B   008A
        SUBI    #$0008, R2                      ; 687C   033A 0008
        MVO@    R0,     R2                      ; 687E   0250
        CLRR    R0                              ; 687F   01C0
        ADDI    #$022F, R2                      ; 6880   02FA 022F
        MVO@    R0,     R2                      ; 6882   0250
        ADDI    #$0008, R2                      ; 6883   02FA 0008
        MVO@    R0,     R2                      ; 6885   0250
        B       L_6838                          ; 6886   0220 004F

        ADCR    R1                              ; 6888   0029
        GSWD    R1                              ; 6889   0031
        RSWD    R1                              ; 688A   0039
        SWAP    R0,     1                       ; 688B   0040
        RRC     R3,     1                       ; 688C   0073
        SUB@    R1,     R7                      ; 688D   030F

        SARC    R3,     2                       ; 688E   007F
        MVI     G_030A, R0                      ; 688F   0280 030A
        MOVR    R1,     R7                      ; 6891   008F
        MOVR    R3,     R7                      ; 6892   009F
        SUB     .BTAB.07,R7                     ; 6893   0307 0207

        SLL     R2,     2                       ; 6895   004E
        SLL     R3,     2                       ; 6896   004F
        CMP@    R1,     R7                      ; 6897   034F
        SARC    R3,     2                       ; 6898   007F
        ADDI    #$02C0, R6                      ; 6899   02FE 02C0
        CMP@    R1,     R2                      ; 689B   034A
        MOVR    R1,     R7                      ; 689C   008F
        MOVR    R3,     R7                      ; 689D   009F
        SUB     .BTAB.07,R7                     ; 689E   0307 0207
        SUB@    R1,     R7                      ; 68A0   030F

        RLC     R3,     2                       ; 68A1   0057
        SUB@    R1,     R6                      ; 68A2   030E
        RLC     R3,     2                       ; 68A3   0057
        SUB@    R5,     R2                      ; 68A4   032A
        SLR     R3,     2                       ; 68A5   0067
        SUB@    R1,     R2                      ; 68A6   030A
        SLR     R1,     2                       ; 68A7   0065
        MOVR    R3,     R7                      ; 68A8   009F
        SUB@    R5,     R7                      ; 68A9   032F
        MOVR    R3,     R7                      ; 68AA   009F

        DECLE   $02FF,  $03CF,  $0079,  $03CE   ; 68AB   02FF 03CF 0079 03CE
        DECLE   $0079,  $03EC,  $008B,  $03EF   ; 68AF   0079 03EC 008B 03EF

        MOVR    R3,     R4                      ; 68B3   009C
        SUBR    R0,     R0                      ; 68B4   0100
        COMR    R1                              ; 68B5   0019
        DECR    R6                              ; 68B6   0016
        TSTR    R0                              ; 68B7   0080
        SUBR    R2,     R3                      ; 68B8   0113
        BGE     L_696B                          ; 68B9   020D 00B0

        SAR     R1,     1                       ; 68BB   0069
        NEGR    R4                              ; 68BC   0024
        SAR     R1,     1                       ; 68BD   0069
        DECR    R6                              ; 68BE   0016
        DECR    R6                              ; 68BF   0016
        ADDR    R4,     R6                      ; 68C0   00E6
        ADDR    R6,     R2                      ; 68C1   00F2
        XORR    R1,     R6                      ; 68C2   01CE
        RSWD    R5                              ; 68C3   003D
        SAR     R3,     1                       ; 68C4   006B
        ADDR    R0,     R3                      ; 68C5   00C3
        SAR     R2,     1                       ; 68C6   006A
        INCR    R2                              ; 68C7   000A
        NEGR    R0                              ; 68C8   0020
        ADDR    R0,     R4                      ; 68C9   00C4
        MOVR    R4,     R0                      ; 68CA   00A0
        SUBR    R6,     R6                      ; 68CB   0136
        MOVR    R4,     R5                      ; 68CC   00A5
        SAR     R0,     2                       ; 68CD   006C
        ADCR    R7                              ; 68CE   002F

        SAR     R0,     2                       ; 68CF   006C
L_68D0:
        DECR    R6                              ; 68D0   0016
        DECLE   $0014,  $00CE,  $00DC,  $01A2   ; 68D1   0014 00CE 00DC 01A2
        DECLE   $00C5,  $006D,  $0045,  $006D   ; 68D5   00C5 006D 0045 006D
        DECLE   $002C,  $000A,  $00C6,  $00DC   ; 68D9   002C 000A 00C6 00DC
        DECLE   $018C,  $0019,  $006F,  $00A1   ; 68DD   018C 0019 006F 00A1
        DECLE   $006E,  $000B,  $000B,  $0010   ; 68E1   006E 000B 000B 0010
        DECLE   $000A,  $0005                   ; 68E5   000A 0005
L_68E7:
        PSHR    R4                              ; 68E7   0274
L_68E8:
        MVII    #$0003, R1                      ; 68E8   02B9 0003

        JSR     R4,     L_66EE                  ; 68EA   0004 0064 02EE

        CMPI    #$0004, R0                      ; 68ED   0378 0004
        BGT     L_68E8                          ; 68EF   022E 0008

        CMP     G_0132, R0                      ; 68F1   0340 0132
        BEQ     L_68E8                          ; 68F3   0224 000C

        MVO     R0,     G_0132                  ; 68F5   0240 0132
        MVI     G_0108, R5                      ; 68F7   0285 0108
        MVO     R5,     G_01C1                  ; 68F9   0245 01C1
        MVII    #$0066, R5                      ; 68FB   02BD 0066
        MVO     R5,     G_0108                  ; 68FD   0245 0108
        MOVR    R0,     R5                      ; 68FF   0085
        SLL     R0,     2                       ; 6900   004C
        SLL     R0,     1                       ; 6901   0048
        ADDR    R0,     R5                      ; 6902   00C5
        SDBD                                    ; 6903   0001
        ADDI    #$68B5, R5                      ; 6904   02FD 00B5 0068
        MVI@    R5,     R1                      ; 6907   02A9
        MVII    #$012F, R4                      ; 6908   02BC 012F
        MVO@    R1,     R4                      ; 690A   0261
        MVI@    R5,     R1                      ; 690B   02A9
        MVO@    R1,     R4                      ; 690C   0261
        MVI@    R5,     R1                      ; 690D   02A9
        MVO@    R1,     R4                      ; 690E   0261
        MVI@    R5,     R1                      ; 690F   02A9
        MVII    #$035B, R4                      ; 6910   02BC 035B
        MVO@    R1,     R4                      ; 6912   0261
        MVI@    R5,     R1                      ; 6913   02A9
        MVO@    R1,     R4                      ; 6914   0261
        SDBD                                    ; 6915   0001
        MVI@    R5,     R1                      ; 6916   02A9
        MVO@    R1,     R4                      ; 6917   0261
        SDBD                                    ; 6918   0001
        MVI@    R5,     R1                      ; 6919   02A9
        MVO@    R1,     R4                      ; 691A   0261
        MVII    #$0133, R5                      ; 691B   02BD 0133
        CLRR    R1                              ; 691D   01C9
L_691E:
        MVO@    R1,     R5                      ; 691E   0269
        CMPI    #$01B3, R5                      ; 691F   037D 01B3
        BLT     L_691E                          ; 6921   0225 0004
        PULR    R7                              ; 6923   02B7

        DECLE   $007C,  $0095,  $00E0,  $00F9   ; 6924   007C 0095 00E0 00F9
        DECLE   $0144,  $015D,  $01A8,  $01C1   ; 6928   0144 015D 01A8 01C1
        DECLE   $0109,  $0122,  $0110,  $0129   ; 692C   0109 0122 0110 0129
        DECLE   $00F0,  $013B,  $00F7           ; 6930   00F0 013B 00F7

        CMPR    R0,     R2                      ; 6933   0142
        ADDR    R7,     R5                      ; 6934   00FD
        SUBR    R2,     R6                      ; 6935   0116
        ADCR    R7                              ; 6936   002F

        SLL     R0,     1                       ; 6937   0048
L_6938:
        XORR    R6,     R1                      ; 6938   01F1
        DECLE   $020A,  $0079,  $0092,  $01A5   ; 6939   020A 0079 0092 01A5
        DECLE   $01BE,  $00A6,  $00BF,  $016E   ; 693D   01BE 00A6 00BF 016E
        DECLE   $0187                           ; 6941   0187

        SUBR    R0,     R4                      ; 6942   0104
        SUBR    R3,     R5                      ; 6943   011D
        SWAP    R3,     1                       ; 6944   0043
        XORR    R5,     R4                      ; 6945   01EC
        RRC     R1,     1                       ; 6946   0071
        ANDR    R6,     R6                      ; 6947   01B6
        MOVR    R3,     R7                      ; 6948   009F

        ANDR    R0,     R0                      ; 6949   0180
        ADDR    R1,     R5                      ; 694A   00CD
        CMPR    R1,     R2                      ; 694B   014A
        ADDR    R4,     R4                      ; 694C   00E4
        SUBR    R5,     R7                      ; 694D   012F

        ADDR    R7,     R3                      ; 694E   00FB
        SUBR    R2,     R4                      ; 694F   0114
        MOVR    R1,     R7                      ; 6950   008F

        DECLE   $01A2,  $00D6,  $0153,  $00EC   ; 6951   01A2 00D6 0153 00EC
        DECLE   $0137                           ; 6955   0137

        SUBR    R0,     R2                      ; 6956   0102
        SUBR    R3,     R3                      ; 6957   011B
        ADDR    R0,     R3                      ; 6958   00C3
        ADDR    R3,     R4                      ; 6959   00DC
        CMPR    R3,     R1                      ; 695A   0159
        CMPR    R6,     R2                      ; 695B   0172
        ADDR    R6,     R3                      ; 695C   00F3
        SUBR    R1,     R4                      ; 695D   010C
        SUBR    R4,     R5                      ; 695E   0125
        SUBR    R7,     R6                      ; 695F   013E
        SLLC    R1,     2                       ; 6960   005D
        SLLC    R2,     2                       ; 6961   005E
        RRC     R0,     2                       ; 6962   0074
        RRC     R1,     2                       ; 6963   0075
        MOVR    R1,     R3                      ; 6964   008B
        MOVR    R1,     R4                      ; 6965   008C
        MOVR    R4,     R2                      ; 6966   00A2
        MOVR    R4,     R3                      ; 6967   00A3
        MOVR    R7,     R1                      ; 6968   00B9
        MOVR    R7,     R2                      ; 6969   00BA
        ADDR    R2,     R0                      ; 696A   00D0
L_696B:
        ADDR    R2,     R1                      ; 696B   00D1
        ADDR    R4,     R7                      ; 696C   00E7

        DECLE   $00E8,  $0132,  $0133,  $014D   ; 696D   00E8 0132 0133 014D
        DECLE   $014E,  $0168,  $0169,  $0183   ; 6971   014E 0168 0169 0183
        DECLE   $0184,  $019E,  $019F,  $01B9   ; 6975   0184 019E 019F 01B9
        DECLE   $01BA,  $01D4,  $01D5,  $00F4   ; 6979   01BA 01D4 01D5 00F4
        DECLE   $00F5,  $013F,  $0140,  $0100   ; 697D   00F5 013F 0140 0100
        DECLE   $0119,  $00F2,  $010B,  $0124   ; 6981   0119 00F2 010B 0124
        DECLE   $013D,  $00C5,  $00DE,  $015B   ; 6985   013D 00C5 00DE 015B
        DECLE   $0174,  $0165,  $00B6,  $019B   ; 6989   0174 0165 00B6 019B
        DECLE   $0088,  $005A,  $01D1,  $0207   ; 698D   0088 005A 01D1 0207
        DECLE   $002C,  $0002,  $0022,  $0001   ; 6991   002C 0002 0022 0001
        DECLE   $0022,  $0001,  $0016,  $0001   ; 6995   0022 0001 0016 0001
        DECLE   $0020,  $0000,  $0022,  $0000   ; 6999   0020 0000 0022 0000
        DECLE   $0016,  $0000,  $0020,  $0006   ; 699D   0016 0000 0020 0006
        DECLE   $0022,  $0006,  $0016,  $0006   ; 69A1   0022 0006 0016 0006
        DECLE   $0020,  $0006,  $0036,  $0005   ; 69A5   0020 0006 0036 0005
        DECLE   $0000,  $0005                   ; 69A9   0000 0005

        DECR    R6                              ; 69AB   0016

        JSRD    R4,     .EXEC.404               ; 69AC   0004 0016 0004
        DECLE   $0036,  $0000,  $0000,  $0000   ; 69AF   0036 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BF   0000 0000 0000 0000
        DECLE   $004C,  $005C,  $006C,  $0002   ; 69C3   004C 005C 006C 0002
        DECLE   $0002,  $007C,  $0000,  $0000   ; 69C7   0002 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 69D7   0000 0000 0000 004C
        DECLE   $006C,  $0152,  $0002,  $0002   ; 69DB   006C 0152 0002 0002
        DECLE   $0252,  $00B2,  $0002,  $0000   ; 69DF   0252 00B2 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $006C   ; 69EF   0000 0000 004C 006C
        DECLE   $0232,  $0002,  $0002,  $0002   ; 69F3   0232 0002 0002 0002
        DECLE   $0002,  $0252,  $0022,  $0002   ; 69F7   0002 0252 0022 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A03   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $006C,  $0132   ; 6A07   0000 004C 006C 0132
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6A0B   0002 0002 0175 0195
        DECLE   $010D,  $00ED,  $00ED,  $00FD   ; 6A0F   010D 00ED 00ED 00FD
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6A13   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1B   0000 0000 0000 0000
        DECLE   $004C,  $006C,  $0232,  $0002   ; 6A1F   004C 006C 0232 0002
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6A23   0002 0175 0195 010D
        DECLE   $011D,  $0003,  $0253,  $00B3   ; 6A27   011D 0003 0253 00B3
        DECLE   $0003,  $01F1,  $0000,  $0000   ; 6A2B   0003 01F1 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6A33   0000 0000 0000 004C
        DECLE   $006C,  $0152,  $0002,  $0002   ; 6A37   006C 0152 0002 0002
        DECLE   $0175,  $0195,  $010D,  $011D   ; 6A3B   0175 0195 010D 011D
        DECLE   $0233,  $0003,  $0003,  $0253   ; 6A3F   0233 0003 0003 0253
        DECLE   $0023,  $0003,  $0211,  $0000   ; 6A43   0023 0003 0211 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $006C   ; 6A4B   0000 0000 004C 006C
        DECLE   $0232,  $0002,  $0002,  $0175   ; 6A4F   0232 0002 0002 0175
        DECLE   $0195,  $010D,  $011D,  $0253   ; 6A53   0195 010D 011D 0253
        DECLE   $00B3,  $0003,  $0003,  $004E   ; 6A57   00B3 0003 0003 004E
        DECLE   $005E,  $008E,  $0003,  $0002   ; 6A5B   005E 008E 0003 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5F   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $006C,  $0132   ; 6A63   0000 004C 006C 0132
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6A67   0002 0002 0175 0195
        DECLE   $010D,  $011D,  $0003,  $0003   ; 6A6B   010D 011D 0003 0003
        DECLE   $0253,  $0023,  $0003,  $0003   ; 6A6F   0253 0023 0003 0003
        DECLE   $0234,  $0004,  $01B7,  $0003   ; 6A73   0234 0004 01B7 0003
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6A77   0002 0000 0000 0000
        DECLE   $004C,  $006C,  $0232,  $0002   ; 6A7B   004C 006C 0232 0002
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6A7F   0002 0175 0195 010D
        DECLE   $011D,  $0003,  $0003,  $0233   ; 6A83   011D 0003 0003 0233
        DECLE   $0003,  $0003,  $0003,  $004E   ; 6A87   0003 0003 0003 004E
        DECLE   $006E,  $0234,  $0004,  $01D7   ; 6A8B   006E 0234 0004 01D7
        DECLE   $0003,  $01F1,  $0000,  $004C   ; 6A8F   0003 01F1 0000 004C
        DECLE   $006C,  $0232,  $0002,  $0002   ; 6A93   006C 0232 0002 0002
        DECLE   $0175,  $0195,  $010D,  $011D   ; 6A97   0175 0195 010D 011D
        DECLE   $0003,  $0233,  $0003,  $0003   ; 6A9B   0003 0233 0003 0003
        DECLE   $004E,  $027A,  $0003,  $01B6   ; 6A9F   004E 027A 0003 01B6
        DECLE   $0234,  $0177,  $0197           ; 6AA3   0234 0177 0197

        SUBR    R1,     R7                      ; 6AA6   010F

        DECLE   $027B,  $0003,  $0211,  $009C   ; 6AA7   027B 0003 0211 009C
        DECLE   $0232,  $0002,  $0252,  $00B2   ; 6AAB   0232 0002 0252 00B2
        DECLE   $0002,  $01B5,  $002D,  $0233   ; 6AAF   0002 01B5 002D 0233

        DIS                                     ; 6AB3   0003
        MVO@    R3,     R2                      ; 6AB4   0253
        MOVR    R6,     R3                      ; 6AB5   00B3
        DIS                                     ; 6AB6   0003
        MOVR    R3,     R6                      ; 6AB7   009E
        ADCR    R7                              ; 6AB8   002F

        MVI@    R3,     R3                      ; 6AB9   029B
L_6ABA:
        DIS                                     ; 6ABA   0003
        DECLE   $01D6,  $0234,  $0004           ; 6ABB   01D6 0234 0004

        ADCR    R7                              ; 6ABE   002F

        INCR    R3                              ; 6ABF   000B
L_6AC0:
        MVI@    R3,     R3                      ; 6AC0   029B
        DIS                                     ; 6AC1   0003
        EIS                                     ; 6AC2   0002
        RLC     R3,     2                       ; 6AC3   0057
        SAR     R1,     2                       ; 6AC4   006D
        MOVR    R5,     R7                      ; 6AC5   00AF

        ADDR    R0,     R5                      ; 6AC6   00C5
        SUBR    R6,     R3                      ; 6AC7   0133
        CMPR    R1,     R1                      ; 6AC8   0149
        ANDR    R1,     R3                      ; 6AC9   018B
        ANDR    R4,     R1                      ; 6ACA   01A1
        MOVR    R0,     R2                      ; 6ACB   0082
        MOVR    R3,     R0                      ; 6ACC   0098
        CMPR    R3,     R6                      ; 6ACD   015E
        CMPR    R6,     R4                      ; 6ACE   0174
        ADDR    R5,     R6                      ; 6ACF   00EE
        SUBR    R0,     R4                      ; 6AD0   0104
        SAR     R0,     2                       ; 6AD1   006C
        MOVR    R5,     R6                      ; 6AD2   00AE
        CMPR    R1,     R0                      ; 6AD3   0148
        ANDR    R1,     R2                      ; 6AD4   018A
        RSWD    R6                              ; 6AD5   003E
        RLC     R0,     2                       ; 6AD6   0054
        ANDR    R3,     R6                      ; 6AD7   019E
        ANDR    R6,     R4                      ; 6AD8   01B4
        SLR     R0,     2                       ; 6AD9   0064
        SARC    R2,     1                       ; 6ADA   007A
        MOVR    R4,     R6                      ; 6ADB   00A6
        MOVR    R7,     R4                      ; 6ADC   00BC
        SUBR    R5,     R2                      ; 6ADD   012A
        CMPR    R0,     R0                      ; 6ADE   0140
        CMPR    R5,     R4                      ; 6ADF   016C
        ANDR    R0,     R2                      ; 6AE0   0182
        DECR    R2                              ; 6AE1   0012
        XORR    R4,     R0                      ; 6AE2   01E0
        ADCR    R2                              ; 6AE3   002A
        XORR    R1,     R4                      ; 6AE4   01CC
        TSTR    R0                              ; 6AE5   0080
        MOVR    R2,     R6                      ; 6AE6   0096
        CMPR    R3,     R4                      ; 6AE7   015C
        CMPR    R6,     R2                      ; 6AE8   0172
        ADDR    R0,     R3                      ; 6AE9   00C3
        SUBR    R6,     R1                      ; 6AEA   0131
        ADDR    R5,     R4                      ; 6AEB   00EC
        SUBR    R0,     R2                      ; 6AEC   0102
        ADDR    R2,     R5                      ; 6AED   00D5
        SUBR    R2,     R7                      ; 6AEE   0117

        DECLE   $00E9,  $00FF,  $0037           ; 6AEF   00E9 00FF 0037

        ANDR    R5,     R5                      ; 6AF2   01AD
        MOVR    R1,     R7                      ; 6AF3   008F

        DECLE   $0155,  $00D0,  $00E5,  $00FB   ; 6AF4   0155 00D0 00E5 00FB
        DECLE   $0112,  $00A0,  $00B8,  $0126   ; 6AF8   0112 00A0 00B8 0126
        DECLE   $013A,  $0049,  $005B,  $004B   ; 6AFC   013A 0049 005B 004B
        DECLE   $004C,  $005F,  $0060,  $0073   ; 6B00   004C 005F 0060 0073
        DECLE   $0074,  $008A,  $008B,  $00A1   ; 6B04   0074 008A 008B 00A1
        DECLE   $00A2,  $013B,  $013C,  $0150   ; 6B08   00A2 013B 013C 0150
        DECLE   $0151,  $0165,  $0166,  $017D   ; 6B0C   0151 0165 0166 017D
        DECLE   $017E,  $0195,  $0196,  $0025   ; 6B10   017E 0195 0196 0025
        DECLE   $0026,  $003A,  $003B,  $0051   ; 6B14   0026 003A 003B 0051
        DECLE   $0052,  $019B,  $019C,  $01B0   ; 6B18   0052 019B 019C 01B0
        DECLE   $01B1,  $01C7                   ; 6B1C   01B1 01C7

        XORR    R1,     R0                      ; 6B1E   01C8
        ADDR    R4,     R7                      ; 6B1F   00E7

        ADDR    R7,     R5                      ; 6B20   00FD
        SARC    R2,     2                       ; 6B21   007E
        MOVR    R2,     R4                      ; 6B22   0094
        CMPR    R3,     R2                      ; 6B23   015A
        CMPR    R6,     R0                      ; 6B24   0170
        ADDR    R0,     R1                      ; 6B25   00C1
        ADDR    R2,     R7                      ; 6B26   00D7

        SUBR    R3,     R1                      ; 6B27   0119
        SUBR    R5,     R7                      ; 6B28   012F

        ANDR    R2,     R3                      ; 6B29   0193
        CMPR    R7,     R1                      ; 6B2A   0179
        RRC     R0,     1                       ; 6B2B   0070
        MOVR    R0,     R7                      ; 6B2C   0087

        DECLE   $0162,  $014D,  $0145,  $00AB   ; 6B2D   0162 014D 0145 00AB
        DECLE   $00D9,  $011B,  $0153,  $008D   ; 6B31   00D9 011B 0153 008D
        DECLE   $0076,  $0168,  $0187,  $0069   ; 6B35   0076 0168 0187 0069
        DECLE   $0024,  $01C6,  $0061,  $017F   ; 6B39   0024 01C6 0061 017F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6B49   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0232,  $0002   ; 6B4D   005C 006C 0232 0002
        DECLE   $0002,  $007C,  $0000,  $0000   ; 6B51   0002 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B59   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $005C,  $006C   ; 6B5D   0000 004C 005C 006C
        DECLE   $0152,  $0175,  $0195,  $0002   ; 6B61   0152 0175 0195 0002
        DECLE   $0002,  $0002,  $0232,  $0002   ; 6B65   0002 0002 0232 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6B6D   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0002,  $0232   ; 6B71   005C 006C 0002 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6B75   0002 0002 0175 0195
        DECLE   $0002,  $002D,  $0253,  $00B3   ; 6B79   0002 002D 0253 00B3
        DECLE   $00DD,  $0002,  $0000,  $0000   ; 6B7D   00DD 0002 0000 0000
        DECLE   $0000,  $004C,  $005C,  $006C   ; 6B81   0000 004C 005C 006C
        DECLE   $0002,  $0232,  $0002,  $0175   ; 6B85   0002 0232 0002 0175
        DECLE   $0195,  $010D,  $00ED,  $00ED   ; 6B89   0195 010D 00ED 00ED
        DECLE   $00FD,  $0175,  $0195,  $00BD   ; 6B8D   00FD 0175 0195 00BD
        DECLE   $0253,  $0023,  $0003,  $01F1   ; 6B91   0253 0023 0003 01F1
        DECLE   $009C,  $0002,  $0002,  $0232   ; 6B95   009C 0002 0002 0232
        DECLE   $0002,  $0002,  $0002,  $0175   ; 6B99   0002 0002 0002 0175
        DECLE   $0195,  $0132,  $002D,  $0003   ; 6B9D   0195 0132 002D 0003
        DECLE   $0253,  $00B3,  $0003,  $0003   ; 6BA1   0253 00B3 0003 0003
        DECLE   $0003,  $0133,  $0003,  $003E   ; 6BA5   0003 0133 0003 003E
        DECLE   $027A,  $0211,  $012C,  $0002   ; 6BA9   027A 0211 012C 0002
        DECLE   $0232,  $0002,  $0002,  $0175   ; 6BAD   0232 0002 0002 0175
        DECLE   $0195,  $0002,  $0152,  $0002   ; 6BB1   0195 0002 0152 0002
        DECLE   $00BD,  $0003,  $0253,  $0023   ; 6BB5   00BD 0003 0253 0023
        DECLE   $0003,  $0003,  $01B6,  $009E   ; 6BB9   0003 0003 01B6 009E
        DECLE   $0234                           ; 6BBD   0234

        ADCR    R7                              ; 6BBE   002F

        MVI@    R3,     R3                      ; 6BBF   029B
L_6BC0:
        EIS                                     ; 6BC0   0002
        DECLE   $0000,  $00DC,  $00FC,  $0232   ; 6BC1   0000 00DC 00FC 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6BC5   0002 0002 0175 0195
        DECLE   $0002,  $0132,  $0002,  $0233   ; 6BC9   0002 0132 0002 0233
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6BCD   0003 0003 0003 0003
        DECLE   $01D6,  $012E,  $0234,  $00BF   ; 6BD1   01D6 012E 0234 00BF
        DECLE   $02DB,  $0002,  $0000,  $0000   ; 6BD5   02DB 0002 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6BD9   0000 00DC 00FC 0002
        DECLE   $0232,  $0175,  $0195,  $0002   ; 6BDD   0232 0175 0195 0002
        DECLE   $002D,  $0003,  $0253,  $00B3   ; 6BE1   002D 0003 0253 00B3
        DECLE   $0003,  $0003,  $0003,  $0133   ; 6BE5   0003 0003 0003 0133
        DECLE   $0003,  $00CE,  $027A,  $01F1   ; 6BE9   0003 00CE 027A 01F1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BED   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6BF1   0000 00DC 00FC 0002
        DECLE   $0232,  $0002,  $00BD,  $0003   ; 6BF5   0232 0002 00BD 0003
        DECLE   $0253,  $0023,  $0003,  $0003   ; 6BF9   0253 0023 0003 0003
        DECLE   $0003,  $01B6,  $0003,  $0233   ; 6BFD   0003 01B6 0003 0233
        DECLE   $0003,  $0211,  $0000,  $0000   ; 6C01   0003 0211 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C05   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6C09   0000 00DC 00FC 0002
        DECLE   $0232,  $007D,  $008D,  $0003   ; 6C0D   0232 007D 008D 0003
        DECLE   $0003,  $0233,  $0003,  $01D6   ; 6C11   0003 0233 0003 01D6
        DECLE   $0003,  $0153,  $006D,  $010C   ; 6C15   0003 0153 006D 010C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1D   0000 0000 0000 0000
        DECLE   $003C,  $0232,  $0002,  $01B5   ; 6C21   003C 0232 0002 01B5
        DECLE   $002D,  $0233,  $0003,  $003E   ; 6C25   002D 0233 0003 003E
        DECLE   $0234,  $0004,  $029A,  $003D   ; 6C29   0234 0004 029A 003D
        DECLE   $002C,  $0000                   ; 6C2D   002C 0000

        GSWD    R1                              ; 6C2F   0031
        RSWD    R3                              ; 6C30   003B
        MOVR    R1,     R3                      ; 6C31   008B
        MOVR    R2,     R5                      ; 6C32   0095
        MOVR    R6,     R3                      ; 6C33   00B3
        MOVR    R7,     R5                      ; 6C34   00BD
        SUBR    R1,     R5                      ; 6C35   010D
        SUBR    R2,     R7                      ; 6C36   0117

        MOVR    R3,     R6                      ; 6C37   009E
        MOVR    R5,     R0                      ; 6C38   00A8
        GSWD    R0                              ; 6C39   0030
        RSWD    R2                              ; 6C3A   003A
        SUBR    R1,     R4                      ; 6C3B   010C
        SUBR    R2,     R6                      ; 6C3C   0116
        MOVR    R2,     R4                      ; 6C3D   0094
        MOVR    R6,     R2                      ; 6C3E   00B2
        NEGR    R6                              ; 6C3F   0026
        SWAP    R0,     2                       ; 6C40   0044
        SUBR    R0,     R2                      ; 6C41   0102
        SUBR    R4,     R0                      ; 6C42   0120
        DECR    R1                              ; 6C43   0011
        COMR    R3                              ; 6C44   001B
        SUBR    R5,     R1                      ; 6C45   0129
        SUBR    R6,     R3                      ; 6C46   0133
        SLLC    R3,     2                       ; 6C47   005F
        SAR     R1,     1                       ; 6C48   0069
        ADDR    R2,     R7                      ; 6C49   00D7

        ADDR    R4,     R1                      ; 6C4A   00E1
        MOVR    R1,     R6                      ; 6C4B   008E
        MOVR    R3,     R0                      ; 6C4C   0098
        MOVR    R4,     R2                      ; 6C4D   00A2
        MOVR    R5,     R4                      ; 6C4E   00AC
        MOVR    R1,     R4                      ; 6C4F   008C
        MOVR    R2,     R6                      ; 6C50   0096
        MOVR    R4,     R0                      ; 6C51   00A0
        MOVR    R5,     R2                      ; 6C52   00AA
        MOVR    R0,     R3                      ; 6C53   0083
        MOVR    R6,     R5                      ; 6C54   00B5
        SARC    R2,     1                       ; 6C55   007A
        ADDR    R0,     R0                      ; 6C56   00C0
        RRC     R0,     1                       ; 6C57   0070
        ADDR    R1,     R2                      ; 6C58   00CA
        SLR     R3,     2                       ; 6C59   0067
        ADDR    R2,     R5                      ; 6C5A   00D5
        RLC     R3,     1                       ; 6C5B   0053
        ADDR    R5,     R1                      ; 6C5C   00E9
        SLL     R2,     1                       ; 6C5D   004A
        ADDR    R6,     R4                      ; 6C5E   00F4
        MOVR    R2,     R1                      ; 6C5F   0091
        MOVR    R5,     R7                      ; 6C60   00AF

        MOVR    R3,     R5                      ; 6C61   009D
        MOVR    R4,     R7                      ; 6C62   00A7

        DECLE   $0089,  $00BB,  $002D,  $0037   ; 6C63   0089 00BB 002D 0037
        DECLE   $0109,  $0113,  $0025,  $0043   ; 6C67   0109 0113 0025 0043
        DECLE   $004B,  $004C,  $004D,  $004E   ; 6C6B   004B 004C 004D 004E
        DECLE   $0054,  $0055,  $0056,  $0057   ; 6C6F   0054 0055 0056 0057
        DECLE   $0072,  $0073,  $007B,  $007C   ; 6C73   0072 0073 007B 007C
        DECLE   $0080,  $0081,  $0084,  $0085   ; 6C77   0080 0081 0084 0085
        DECLE   $00B6,  $00B7                   ; 6C7B   00B6 00B7

        ADDR    R0,     R1                      ; 6C7D   00C1
        ADDR    R0,     R2                      ; 6C7E   00C2
        ADDR    R0,     R6                      ; 6C7F   00C6
        ADDR    R0,     R7                      ; 6C80   00C7

        DECLE   $00CC,  $00CD,  $00EA,  $00EB   ; 6C81   00CC 00CD 00EA 00EB
        DECLE   $00EC,  $00ED,  $00F5,  $00F6   ; 6C85   00EC 00ED 00F5 00F6
        DECLE   $00F7                           ; 6C89   00F7

        ADDR    R7,     R0                      ; 6C8A   00F8
        ADCR    R6                              ; 6C8B   002E
        RSWD    R0                              ; 6C8C   0038
        SARC    R2,     2                       ; 6C8D   007E
        MOVR    R1,     R0                      ; 6C8E   0088
        TSTR    R3                              ; 6C8F   009B
        MOVR    R4,     R5                      ; 6C90   00A5
        MOVR    R7,     R2                      ; 6C91   00BA
        ADDR    R0,     R4                      ; 6C92   00C4
        SUBR    R1,     R2                      ; 6C93   010A
        SUBR    R2,     R4                      ; 6C94   0114
        SUBR    R0,     R1                      ; 6C95   0101
        SUBR    R3,     R7                      ; 6C96   011F

        COMR    R1                              ; 6C97   0019
        SUBR    R4,     R7                      ; 6C98   0127

        MOVR    R0,     R6                      ; 6C99   0086
        MOVR    R7,     R0                      ; 6C9A   00B8
        RRC     R1,     2                       ; 6C9B   0075
        ADDR    R1,     R7                      ; 6C9C   00CF

        SLLC    R1,     2                       ; 6C9D   005D
        ADDR    R3,     R7                      ; 6C9E   00DF

        DECLE   $0040,  $00FE,  $0007,  $013D   ; 6C9F   0040 00FE 0007 013D
        DECLE   $0132,  $0010,  $0000,  $0000   ; 6CA3   0132 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA7   0000 0000 0000 0000
        DECLE   $009C,  $0132,  $007C,  $0000   ; 6CAB   009C 0132 007C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAF   0000 0000 0000 0000
        DECLE   $0000,  $009C,  $0152,  $0252   ; 6CB3   0000 009C 0152 0252
        DECLE   $00B2,  $0000,  $0000,  $0000   ; 6CB7   00B2 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0232   ; 6CBB   0000 0000 0000 0232
        DECLE   $0002,  $0252,  $0022,  $008C   ; 6CBF   0002 0252 0022 008C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC3   0000 0000 0000 0000
        DECLE   $009C,  $010D,  $011D,  $0233   ; 6CC7   009C 010D 011D 0233
        DECLE   $0279,  $0002,  $0000,  $0000   ; 6CCB   0279 0002 0000 0000
        DECLE   $0000,  $0000,  $002D,  $0233   ; 6CCF   0000 0000 002D 0233
        DECLE   $01B6,  $009E,  $029A,  $01F1   ; 6CD3   01B6 009E 029A 01F1
        DECLE   $0000,  $0000,  $0000,  $009C   ; 6CD7   0000 0000 0000 009C
        DECLE   $00BD,  $0233,  $01D6,  $012E   ; 6CDB   00BD 0233 01D6 012E
        DECLE   $02DA,  $0211,  $0000,  $0000   ; 6CDF   02DA 0211 0000 0000
        DECLE   $0000,  $0002,  $0152,  $007D   ; 6CE3   0000 0002 0152 007D
        DECLE   $008D,  $0233,  $0279,  $0002   ; 6CE7   008D 0233 0279 0002
        DECLE   $0000,  $0000,  $009C,  $0002   ; 6CEB   0000 0000 009C 0002
        DECLE   $0232,  $0175,  $0195,  $0175   ; 6CEF   0232 0175 0195 0175
        DECLE   $0195,  $011C,  $0000,  $0000   ; 6CF3   0195 011C 0000 0000
        DECLE   $0002,  $0232,  $0175,  $0195   ; 6CF7   0002 0232 0175 0195
        DECLE   $0175,  $0195,  $011C,  $0000   ; 6CFB   0175 0195 011C 0000
        DECLE   $0000,  $0000,  $0002,  $0132   ; 6CFF   0000 0000 0002 0132
        DECLE   $0002,  $0252,  $00B2,  $002C   ; 6D03   0002 0252 00B2 002C
        DECLE   $0000,  $0000,  $0000,  $009C   ; 6D07   0000 0000 0000 009C
        DECLE   $0002,  $0232,  $0002,  $0252   ; 6D0B   0002 0232 0002 0252
        DECLE   $0022,  $00BC,  $0000,  $0000   ; 6D0F   0022 00BC 0000 0000
        DECLE   $0000,  $0002,  $0232,  $0002   ; 6D13   0000 0002 0232 0002
        DECLE   $0175,  $0195,  $0002,  $0152   ; 6D17   0175 0195 0002 0152
        DECLE   $007C,  $008C,  $0000,  $0002   ; 6D1B   007C 008C 0000 0002
        DECLE   $0232,  $0175,  $0195,  $011D   ; 6D1F   0232 0175 0195 011D
        DECLE   $01B6,  $00DD,  $0175,  $0195   ; 6D23   01B6 00DD 0175 0195
        DECLE   $009C,  $0232,  $0175,  $0195   ; 6D27   009C 0232 0175 0195
        DECLE   $0132,  $0003,  $01D6,  $0233   ; 6D2B   0132 0003 01D6 0233
        DECLE   $00DD,  $01F1,  $0232,  $0002   ; 6D2F   00DD 01F1 0232 0002
        DECLE   $0252,  $00B2,  $002D,  $0233   ; 6D33   0252 00B2 002D 0233
        DECLE   $0003,  $009E,  $027A,  $0211   ; 6D37   0003 009E 027A 0211
        DECLE   $0232,  $0002,  $0252,  $0022   ; 6D3B   0232 0002 0252 0022
        DECLE   $00BD,  $01B6,  $003E,  $0234   ; 6D3F   00BD 01B6 003E 0234
        DECLE   $029A,  $002C,  $003F           ; 6D43   029A 002C 003F

        RLC     R1,     2                       ; 6D46   0055
        CMPR    R6,     R3                      ; 6D47   0173
        ANDR    R1,     R1                      ; 6D48   0189
        MOVR    R5,     R7                      ; 6D49   00AF

        ADDR    R0,     R5                      ; 6D4A   00C5
        SUBR    R0,     R7                      ; 6D4B   0107

        SUBR    R3,     R5                      ; 6D4C   011D
        ADDR    R1,     R6                      ; 6D4D   00CE
        ADDR    R4,     R4                      ; 6D4E   00E4
        RSWD    R2                              ; 6D4F   003A
        RLC     R0,     1                       ; 6D50   0050
        CMPR    R5,     R6                      ; 6D51   016E
        ANDR    R0,     R4                      ; 6D52   0184
        MOVR    R7,     R0                      ; 6D53   00B8
        ADDR    R7,     R2                      ; 6D54   00FA
        NEGR    R5                              ; 6D55   0025
        SLR     R3,     2                       ; 6D56   0067
        CMPR    R3,     R1                      ; 6D57   0159
        ANDR    R3,     R3                      ; 6D58   019B
        ADDR    R1,     R1                      ; 6D59   00C9
        ADDR    R3,     R7                      ; 6D5A   00DF

        DECLE   $0032,  $0048,  $0166,  $017C   ; 6D5B   0032 0048 0166 017C
        DECLE   $0036                           ; 6D5F   0036

        SLL     R0,     2                       ; 6D60   004C
        CMPR    R5,     R2                      ; 6D61   016A
        ANDR    R0,     R0                      ; 6D62   0180
        ADDR    R0,     R7                      ; 6D63   00C7

        DECLE   $00DD,  $009C,  $010A,  $0071   ; 6D64   00DD 009C 010A 0071
        DECLE   $0137,  $0046,  $0030,  $0164   ; 6D68   0137 0046 0030 0164
        DECLE   $017A,  $00B5,  $00CC,  $00E2   ; 6D6C   017A 00B5 00CC 00E2
        DECLE   $00F7,  $008B,  $0125,  $0060   ; 6D70   00F7 008B 0125 0060
        DECLE   $0152,  $001E,  $0194,  $0035   ; 6D74   0152 001E 0194 0035

        SLL     R3,     1                       ; 6D78   004B
        CMPR    R5,     R1                      ; 6D79   0169
        CMPR    R7,     R7                      ; 6D7A   017F
        INCR    R3                              ; 6D7B   000B
        ANDR    R5,     R5                      ; 6D7C   01AD
        SARC    R0,     2                       ; 6D7D   007C
        CMPR    R0,     R2                      ; 6D7E   0142
        SAR     R0,     1                       ; 6D7F   0068
        CMPR    R3,     R2                      ; 6D80   015A
        MOVR    R3,     R6                      ; 6D81   009E
        MOVR    R3,     R7                      ; 6D82   009F

        TSTR    R1                              ; 6D83   0089
        MOVR    R1,     R2                      ; 6D84   008A
        RRC     R0,     2                       ; 6D85   0074
        RRC     R1,     2                       ; 6D86   0075
        SUBR    R1,     R4                      ; 6D87   010C
        SUBR    R1,     R5                      ; 6D88   010D
        SUBR    R4,     R3                      ; 6D89   0123
        SUBR    R4,     R4                      ; 6D8A   0124
        SUBR    R7,     R2                      ; 6D8B   013A
        SUBR    R7,     R3                      ; 6D8C   013B
        NEGR    R2                              ; 6D8D   0022
        NEGR    R3                              ; 6D8E   0023
        SLR     R0,     2                       ; 6D8F   0064
        SLR     R1,     2                       ; 6D90   0065
        CMPR    R2,     R6                      ; 6D91   0156
        CMPR    R2,     R7                      ; 6D92   0157
        ANDR    R3,     R0                      ; 6D93   0198
        ANDR    R3,     R1                      ; 6D94   0199
        MOVR    R2,     R5                      ; 6D95   0095
        MOVR    R2,     R6                      ; 6D96   0096
        MOVR    R5,     R4                      ; 6D97   00AC
        TSTR    R5                              ; 6D98   00AD
        ADDR    R0,     R3                      ; 6D99   00C3
        ADDR    R0,     R4                      ; 6D9A   00C4
        SUBR    R0,     R5                      ; 6D9B   0105
        SUBR    R0,     R6                      ; 6D9C   0106
        SUBR    R3,     R2                      ; 6D9D   011A
        SUBR    R3,     R3                      ; 6D9E   011B
        SUBR    R5,     R7                      ; 6D9F   012F

        SUBR    R6,     R0                      ; 6DA0   0130
        ADDR    R1,     R7                      ; 6DA1   00CF

        ADDR    R4,     R5                      ; 6DA2   00E5
        RSWD    R0                              ; 6DA3   0038
        SLL     R2,     2                       ; 6DA4   004E
        CMPR    R5,     R4                      ; 6DA5   016C
        ANDR    R0,     R2                      ; 6DA6   0182
        RSWD    R4                              ; 6DA7   003C
        RLC     R2,     1                       ; 6DA8   0052
        CMPR    R6,     R0                      ; 6DA9   0170
        ANDR    R0,     R6                      ; 6DAA   0186
        NEGR    R6                              ; 6DAB   0026
        ANDR    R3,     R4                      ; 6DAC   019C
        MOVR    R5,     R3                      ; 6DAD   00AB
        SUBR    R3,     R1                      ; 6DAE   0119
        ADDR    R0,     R2                      ; 6DAF   00C2
        SUBR    R0,     R4                      ; 6DB0   0104
        ADDR    R3,     R1                      ; 6DB1   00D9
        ADDR    R5,     R7                      ; 6DB2   00EF

        DECLE   $003E,  $0054,  $0172,  $0188   ; 6DB3   003E 0054 0172 0188
        DECLE   $0098,  $0132,  $010E,  $00A0   ; 6DB7   0098 0132 010E 00A0
        DECLE   $007E,  $0144,  $01B2,  $0010   ; 6DBB   007E 0144 01B2 0010
        DECLE   $005C,  $014E,  $011C,  $00AE   ; 6DBF   005C 014E 011C 00AE
        DECLE   $0080,  $0146,  $0000,  $0000   ; 6DC3   0080 0146 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC7   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $005C,  $005C   ; 6DCB   0000 004C 005C 005C
        DECLE   $006C,  $0232,  $0002,  $0002   ; 6DCF   006C 0232 0002 0002
        DECLE   $0002,  $0002,  $0152,  $007C   ; 6DD3   0002 0002 0152 007C
        DECLE   $008C,  $0000,  $0000,  $0000   ; 6DD7   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDB   0000 0000 0000 0000
        DECLE   $004C,  $006C,  $0002,  $0002   ; 6DDF   004C 006C 0002 0002
        DECLE   $0232,  $010D,  $00ED,  $011D   ; 6DE3   0232 010D 00ED 011D
        DECLE   $0176,  $0196,  $0003,  $0279   ; 6DE7   0176 0196 0003 0279
        DECLE   $0233,  $00DD,  $00FD,  $007C   ; 6DEB   0233 00DD 00FD 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEF   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0232,  $0002   ; 6DF3   0000 003C 0232 0002
        DECLE   $0252,  $00B2,  $002D,  $0233   ; 6DF7   0252 00B2 002D 0233
        DECLE   $0253,  $00B3,  $01B6,  $003E   ; 6DFB   0253 00B3 01B6 003E
        DECLE   $029A,  $0003,  $01B6,  $0003   ; 6DFF   029A 0003 01B6 0003
        DECLE   $0233,  $01F1,  $0000,  $0000   ; 6E03   0233 01F1 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00CC   ; 6E07   0000 0000 0000 00CC
        DECLE   $0232,  $0002,  $0252,  $0022   ; 6E0B   0232 0002 0252 0022
        DECLE   $00BD,  $0233,  $0253,  $0023   ; 6E0F   00BD 0233 0253 0023
        DECLE   $01D6,  $00CE,  $02DA,  $0003   ; 6E13   01D6 00CE 02DA 0003
        DECLE   $01D6,  $0003,  $0233,  $0211   ; 6E17   01D6 0003 0233 0211
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1B   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $0152,  $0002   ; 6E1F   0000 004C 0152 0002
        DECLE   $0002,  $0002,  $0232,  $007D   ; 6E23   0002 0002 0232 007D
        DECLE   $005D,  $008D,  $0176,  $0196   ; 6E27   005D 008D 0176 0196
        DECLE   $0003,  $0279,  $0233,  $004D   ; 6E2B   0003 0279 0233 004D
        DECLE   $006D,  $0002,  $0000,  $0000   ; 6E2F   006D 0002 0000 0000
        DECLE   $0000,  $0000,  $009C,  $0232   ; 6E33   0000 0000 009C 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6E37   0002 0002 0175 0195
        DECLE   $010C,  $011C,  $0000,  $00DC   ; 6E3B   010C 011C 0000 00DC
        DECLE   $00EC,  $00FC,  $0232,  $0002   ; 6E3F   00EC 00FC 0232 0002
        DECLE   $0132,  $0002,  $0152,  $0002   ; 6E43   0132 0002 0152 0002
        DECLE   $007C,  $0000,  $0000,  $0000   ; 6E47   007C 0000 0000 0000
        DECLE   $0002,  $0002,  $0002,  $0175   ; 6E4B   0002 0002 0002 0175
        DECLE   $0195,  $0232,  $0000,  $0000   ; 6E4F   0195 0232 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E53   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $0002,  $0175   ; 6E57   0000 00DC 0002 0175
        DECLE   $0195,  $0002,  $0232,  $007C   ; 6E5B   0195 0002 0232 007C
        DECLE   $0000,  $009C,  $0232,  $0002   ; 6E5F   0000 009C 0232 0002
        DECLE   $0175,  $0195,  $0132,  $0002   ; 6E63   0175 0195 0132 0002
        DECLE   $008C,  $0000,  $0000,  $0000   ; 6E67   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6B   0000 0000 0000 0000
        DECLE   $00DC,  $0232,  $0175,  $0195   ; 6E6F   00DC 0232 0175 0195
        DECLE   $0132,  $01F1,  $0000,  $0002   ; 6E73   0132 01F1 0000 0002
        DECLE   $0002,  $0002,  $0002,  $0232   ; 6E77   0002 0002 0002 0232
        DECLE   $010D,  $011D,  $0279,  $007C   ; 6E7B   010D 011D 0279 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 6E83   0000 0000 0000 00FC
        DECLE   $0232,  $0175,  $0195,  $0211   ; 6E87   0232 0175 0195 0211
        DECLE   $009C,  $0232,  $0002,  $0252   ; 6E8B   009C 0232 0002 0252
        DECLE   $00B2,  $002D,  $0233,  $003E   ; 6E8F   00B2 002D 0233 003E
        DECLE   $029A,  $01B5,  $0000,  $0000   ; 6E93   029A 01B5 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E97   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0002,  $0232   ; 6E9B   0000 003C 0002 0232

        EIS                                     ; 6E9F   0002
        EIS                                     ; 6EA0   0002
        RLC     R3,     2                       ; 6EA1   0057
        MOVR    R0,     R3                      ; 6EA2   0083
        MOVR    R5,     R7                      ; 6EA3   00AF

        ADDR    R3,     R3                      ; 6EA4   00DB
        SUBR    R0,     R7                      ; 6EA5   0107

        DECLE   $0133,  $015F,  $018B,  $00BF   ; 6EA6   0133 015F 018B 00BF

        ADDR    R5,     R3                      ; 6EAA   00EB
        ADDR    R1,     R1                      ; 6EAB   00C9
        ADDR    R6,     R5                      ; 6EAC   00F5
        ADDR    R2,     R7                      ; 6EAD   00D7

        SUBR    R0,     R3                      ; 6EAE   0103
        MOVR    R3,     R5                      ; 6EAF   009D
        SUBR    R4,     R1                      ; 6EB0   0121
        MOVR    R5,     R4                      ; 6EB1   00AC
        SUBR    R6,     R0                      ; 6EB2   0130
        MOVR    R6,     R3                      ; 6EB3   00B3
        ADDR    R3,     R7                      ; 6EB4   00DF

        MOVR    R7,     R3                      ; 6EB5   00BB
        ADDR    R4,     R7                      ; 6EB6   00E7

        DECLE   $006C,  $0098,  $011C,  $0148   ; 6EB7   006C 0098 011C 0148
        DECLE   $0046,  $0072,  $014E,  $017A   ; 6EBB   0046 0072 014E 017A
        DECLE   $0054,  $0080,  $015C,  $0188   ; 6EBF   0054 0080 015C 0188
        DECLE   $00B1,  $00DD,  $0089,  $010D   ; 6EC3   00B1 00DD 0089 010D
        DECLE   $0062,  $013E,  $00B9,  $00E5   ; 6EC7   0062 013E 00B9 00E5
        DECLE   $0094,  $0118,  $006A,  $0146   ; 6ECB   0094 0118 006A 0146
        DECLE   $003F                           ; 6ECF   003F

        CMPR    R6,     R3                      ; 6ED0   0173
        ADDR    R0,     R3                      ; 6ED1   00C3
        ADDR    R5,     R7                      ; 6ED2   00EF

        DECR    R6                              ; 6ED3   0016
        ANDR    R4,     R2                      ; 6ED4   01A2
        ADDR    R0,     R7                      ; 6ED5   00C7

        ADDR    R6,     R3                      ; 6ED6   00F3
        MOVR    R4,     R0                      ; 6ED7   00A0
        SUBR    R4,     R4                      ; 6ED8   0124
        SARC    R3,     1                       ; 6ED9   007B
        CMPR    R2,     R7                      ; 6EDA   0157
        ADDR    R2,     R4                      ; 6EDB   00D4
        SUBR    R0,     R0                      ; 6EDC   0100
        SLL     R0,     2                       ; 6EDD   004C
        SLL     R1,     2                       ; 6EDE   004D
        RRC     R3,     2                       ; 6EDF   0077
        SARC    R0,     1                       ; 6EE0   0078
        MOVR    R4,     R2                      ; 6EE1   00A2
        MOVR    R4,     R3                      ; 6EE2   00A3
        ADDR    R1,     R5                      ; 6EE3   00CD
        ADDR    R1,     R6                      ; 6EE4   00CE
        ADDR    R7,     R1                      ; 6EE5   00F9
        ADDR    R7,     R2                      ; 6EE6   00FA
        SUBR    R4,     R6                      ; 6EE7   0126
        SUBR    R4,     R7                      ; 6EE8   0127

        DECLE   $0153,  $0154,  $0180,  $0181   ; 6EE9   0153 0154 0180 0181
        DECLE   $008B,  $008C,  $00B6,  $00B7   ; 6EED   008B 008C 00B6 00B7

        ADDR    R4,     R2                      ; 6EF1   00E2
        ADDR    R4,     R3                      ; 6EF2   00E3
        SUBR    R1,     R7                      ; 6EF3   010F

        DECLE   $0110,  $0064,  $0065,  $0140   ; 6EF4   0110 0064 0065 0140
        DECLE   $0141,  $003C,  $003D,  $0170   ; 6EF8   0141 003C 003D 0170
        DECLE   $0171,  $00D8,  $0104,  $00CB   ; 6EFC   0171 00D8 0104 00CB
        DECLE   $00F7,  $0096,  $00C2,  $00C1   ; 6F00   00F7 0096 00C2 00C1
        DECLE   $00ED,  $00EE,  $011A,  $0051   ; 6F04   00ED 00EE 011A 0051
        DECLE   $0185,  $00AA,  $012E,  $002A   ; 6F08   0185 00AA 012E 002A
        DECLE   $01B6,  $014C,  $0070,  $00D0   ; 6F0C   01B6 014C 0070 00D0
        DECLE   $00FC,  $0115,  $0091,  $00A5   ; 6F10   00FC 0115 0091 00A5
        DECLE   $0129,  $016F,  $003B,  $00DA   ; 6F14   0129 016F 003B 00DA
        DECLE   $0106,  $0000,  $0000,  $0000   ; 6F18   0106 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $005C   ; 6F28   0000 0000 004C 005C
        DECLE   $005C,  $005C,  $006C,  $0232   ; 6F2C   005C 005C 006C 0232
        DECLE   $0002,  $0002,  $010D,  $00ED   ; 6F30   0002 0002 010D 00ED
        DECLE   $00ED,  $00FD,  $0002,  $007C   ; 6F34   00ED 00FD 0002 007C
        DECLE   $005C,  $005C,  $005C,  $008C   ; 6F38   005C 005C 005C 008C
        DECLE   $0000,  $004C,  $006C,  $0002   ; 6F3C   0000 004C 006C 0002
        DECLE   $0002,  $010D,  $00FD,  $0232   ; 6F40   0002 010D 00FD 0232
        DECLE   $007C,  $0000,  $0000,  $0000   ; 6F44   007C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4C   0000 0000 0000 0000
        DECLE   $004C,  $005C,  $005C,  $006C   ; 6F50   004C 005C 005C 006C
        DECLE   $0152,  $0175,  $0195,  $0002   ; 6F54   0152 0175 0195 0002
        DECLE   $0232,  $010D,  $00ED,  $00ED   ; 6F58   0232 010D 00ED 00ED
        DECLE   $011D,  $0003,  $0003,  $0253   ; 6F5C   011D 0003 0003 0253
        DECLE   $00B3,  $0003,  $00DD,  $0002   ; 6F60   00B3 0003 00DD 0002
        DECLE   $0002,  $0175,  $0195,  $0002   ; 6F64   0002 0175 0195 0002
        DECLE   $0002,  $0002,  $0232,  $010D   ; 6F68   0002 0002 0232 010D
        DECLE   $011D,  $0253,  $00B3,  $00DD   ; 6F6C   011D 0253 00B3 00DD
        DECLE   $01F1,  $0000,  $0000,  $0000   ; 6F70   01F1 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6F74   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0002,  $0232   ; 6F78   005C 006C 0002 0232
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6F7C   0002 0175 0195 010D
        DECLE   $00ED,  $00ED,  $011D,  $0233   ; 6F80   00ED 00ED 011D 0233
        DECLE   $0003,  $0253,  $00B3,  $0003   ; 6F84   0003 0253 00B3 0003
        DECLE   $0003,  $0133,  $0003,  $0253   ; 6F88   0003 0133 0003 0253
        DECLE   $0023,  $0003,  $0003,  $0002   ; 6F8C   0023 0003 0003 0002
        DECLE   $0175,  $0195,  $0002,  $0002   ; 6F90   0175 0195 0002 0002
        DECLE   $0232,  $0002,  $011D,  $0003   ; 6F94   0232 0002 011D 0003
        DECLE   $0003,  $0253,  $0023,  $0003   ; 6F98   0003 0253 0023 0003
        DECLE   $0211,  $0000,  $0000,  $004C   ; 6F9C   0211 0000 0000 004C
        DECLE   $005C,  $006C,  $0232,  $0002   ; 6FA0   005C 006C 0232 0002
        DECLE   $0175,  $0195,  $010D,  $00ED   ; 6FA4   0175 0195 010D 00ED
        DECLE   $011D,  $0003,  $0133,  $0003   ; 6FA8   011D 0003 0133 0003
        DECLE   $0003,  $0233,  $0003,  $01B6   ; 6FAC   0003 0233 0003 01B6
        DECLE   $0003,  $0253,  $0023,  $0003   ; 6FB0   0003 0253 0023 0003
        DECLE   $004E,  $006E,  $027A,  $0003   ; 6FB4   004E 006E 027A 0003
        DECLE   $0003,  $0233,  $004D,  $0175   ; 6FB8   0003 0233 004D 0175
        DECLE   $0195,  $0002,  $0132,  $0002   ; 6FBC   0195 0002 0132 0002
        DECLE   $010D,  $011D,  $0003,  $0233   ; 6FC0   010D 011D 0003 0233
        DECLE   $0003,  $0279,  $0003,  $004D   ; 6FC4   0003 0279 0003 004D
        DECLE   $01F1,  $009C,  $0232,  $0002   ; 6FC8   01F1 009C 0232 0002
        DECLE   $0252,  $00B2,  $0002,  $0175   ; 6FCC   0252 00B2 0002 0175
        DECLE   $0195,  $002D,  $0233,  $0003   ; 6FD0   0195 002D 0233 0003
        DECLE   $0253,  $00B3,  $0003,  $003E   ; 6FD4   0253 00B3 0003 003E
        DECLE   $029A,  $0003,  $01B6,  $01D6   ; 6FD8   029A 0003 01B6 01D6
        DECLE   $0233,  $0003,  $0003,  $009E   ; 6FDC   0233 0003 0003 009E
        DECLE   $0234                           ; 6FE0   0234

        ADCR    R7                              ; 6FE1   002F

        MVI@    R3,     R3                      ; 6FE2   029B
L_6FE3:
        DIS                                     ; 6FE3   0003
        DECLE   $01B6,  $0003,  $0175,  $0195   ; 6FE4   01B6 0003 0175 0195
        DECLE   $0002,  $0152,  $0002,  $002D   ; 6FE8   0002 0152 0002 002D
        DECLE   $0003,  $0233,  $0003,  $009E   ; 6FEC   0003 0233 0003 009E
        DECLE   $029A,  $01B6,  $0003,  $0132   ; 6FF0   029A 01B6 0003 0132
        DECLE   $0211                           ; 6FF4   0211

        RLC     R0,     2                       ; 6FF5   0054
        NEGR    R0                              ; 6FF6   0020
        SLL     R2,     1                       ; 6FF7   004A
        NEGR    R0                              ; 6FF8   0020
        SLL     R0,     2                       ; 6FF9   004C
        SAR     R3,     2                       ; 6FFA   006F
        RRC     R1,     2                       ; 6FFB   0075
        SLR     R3,     2                       ; 6FFC   0067
        SAR     R0,     1                       ; 6FFD   0068
        RRC     R2,     1                       ; 6FFE   0072
        SARC    R1,     1                       ; 6FFF   0079
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $50D7       <entry>
;;  $50E5       $50F4  
;;  $50EC       $50F2  
;;  $50F6       $50EE   $56E8  
;;  $50FC       $50FE  
;;  $510D       $5109  
;;  $512E       $5131  
;;  $5136       $51CC  
;;  $5139       $51CA  
;;  $5147       $5141  
;;  $5159       $514E  
;;  $5165       $516B  
;;  $517A       $5160  
;;  $5197       $5180   $518F  
;;  $51AB       $5152   $5157  
;;  $51BD       $51B4   $51C6  
;;  $51D5       $51A3  
;;  $5210       $5213  
;;  $5228       $5224  
;;  $5230       $522C  
;;  $5231       $5133  
;;  $5232       $5230  
;;  $523B       $521C  
;;  $524D       $5251  
;;  $526D       $527D  
;;  $527A       $5273  
;;  $5280       $5282  
;;  $528A       $5294  
;;  $528C       $528E  
;;  $5298       $52B7  
;;  $529B       $529C  
;;  $52A5       $52B1  
;;  $52CE       $52C9  
;;  $52DD       $52D5  
;;  $52F2       $5320  
;;  $52F8       $52F9  
;;  $5320       $5314   $531C  
;;  $5322       $52FC  
;;  $532A       $532E  
;;  $5339       $5219   $52C6   $5B23  
;;  $533A       $5338  
;;  $534A       $5348  
;;  $537E       $5381  
;;  $5391       $5393  
;;  $5395       $538E   $5398  
;;  $539D       $51D9   $51DD  
;;  $53B6       $53A8  
;;  $53C6       $53A1   $53B9  
;;  $53D9       $53CA   $53CF  
;;  $53DA       $53C8  
;;  $53EB       $53E7  
;;  $53F6       $53DD  
;;  $53F7       $51A0  
;;  $53FF       $5407  
;;  $5403       $53FB  
;;  $5404       $5401  
;;  $541F       $5421  
;;  $5425       $5443  
;;  $5435       $5431  
;;  $543C       $5438  
;;  $5447       $5448  
;;  $544C       $546A  
;;  $545C       $5458  
;;  $5463       $545F  
;;  $546E       $546F  
;;  $5475       $5185  
;;  $5478       $5502  
;;  $54C2       $54A5   $54A9   $54AD   $54B1   $54B5   $54BB  
;;  $54C3       $54C1  
;;  $54C8       $549B   $549F  
;;  $54DC       $54D4  
;;  $54E9       $54E3  
;;  $54FE       $547C   $5486   $548D   $5497   $54BF   $54C6  
;;  $5505       $67BB  
;;  $5531       $5517   $551C   $5522   $5526   $552B  
;;  $554C       $5542   $5546  
;;  $5554       $5550  
;;  $5555       $5511   $552F  
;;  $5557       $5493   $550D  
;;  $557C       $5561   $556D  
;;  $557D       $54EA   $554C  
;;  $558B       $5588  
;;  $559B       $5598  
;;  $55A3       $55A4  
;;  $55AE       $5182  
;;  $55DE       $55B4   $55B9   $55BF   $5650  
;;  $55FD       $561B  
;;  $5617       $5600   $560A   $5611  
;;  $561F       $5615  
;;  $564E       $55E2   $55EA   $55F9   $561D  
;;  $5652       $55F0  
;;  $5653       $5154   $519D  
;;  $5661       $565A  
;;  $5676       $5669  
;;  $5684       $5678  
;;  $56B6       $51BA  
;;  $56B7       $5674  
;;  $56BC       $56C2  
;;  $56C5       $56A2   $56A6   $5794  
;;  $56DE       $5664   $568C   $5694   $56D2  
;;  $56DF       $5688  
;;  $56E5       $56F2  
;;  $56EB       $56E1  
;;  $56F0       $56F6  
;;  $5716       $5714  
;;  $5743       $56A8  
;;  $574D       $56B4  
;;  $575F       $5753   $5758  
;;  $5794       $575D  
;;  $5796       $5194  
;;  $57A5       $579F  
;;  $57A7       $57A3  
;;  $57AD       $57A9  
;;  $57B2       $57AF  
;;  $57CD       $57D0  
;;  $57D5       $52CB  
;;  $57DC       $57C1  
;;  $57ED       $57E6  
;;  $57F3       $57EB  
;;  $57FF       $57EF  
;;  $5806       $5801  
;;  $5808       $57E2   $5804  
;;  $5810       $581C   $5831   $5842  
;;  $581A       $5814  
;;  $581F       $5191  
;;  $5857       $5854  
;;  $5862       $585E   $5867  
;;  $586A       $5864  
;;  $5870       $586C  
;;  $587B       $5877  
;;  $58B4       $58AA  
;;  $58BC       $58A8  
;;  $58C0       $58B2   $58BA  
;;  $58D5       $58CD  
;;  $58EC       $5849   $587F  
;;  $590B       $5908  
;;  $591E       $5916  
;;  $593D       $5936  
;;  $5945       $593D  
;;  $5949       $593B   $5943  
;;  $5957       $5B6A  
;;  $5968       $5965  
;;  $5972       $596C  
;;  $5986       $597A  
;;  $598E       $5977   $5980   $5984   $598A  
;;  $59A9       $5933   $599D   $59A3   $59B9  
;;  $59AB       $59C2  
;;  $59B4       $58C3   $58FD   $594C   $595C   $59AF  
;;  $59C4       $58C0   $58FA   $5949   $59AB  
;;  $59D5       $59E1  
;;  $59E4       $59DA  
;;  $59E6       $59DD  
;;  $59EA       $5881  
;;  $59EC       $59F4  
;;  $59F7       $59EF  
;;  $59F8       $58C8   $591E   $59B1  
;;  $5A12       $5A0C  
;;  $5A14       $5A02   $5A06   $5A10  
;;  $5A22       $5A1A   $5A1E  
;;  $5AAD       $523B   $57D2   $67B2  
;;  $5AAE       $5238  
;;  $5AB2       $5AC4  
;;  $5AB7       $5AB9  
;;  $5ABF       $5AC1  
;;  $5ACC       $5259  
;;  $5ACD       $5ACB   $5ADB  
;;  $5AE4       $5AFB  
;;  $5AEB       $5AE7  
;;  $5AFD       $5AE0   $5AF8  
;;  $5B49       $5B26  
;;  $5B4A       $530D   $53F3   $5AFD  
;;  $5B5B       $5B58  
;;  $5B65       $5B65  
;;  $5BE7       $539A  
;;  $5BEA       $5BEF  
;;  $5C02       $5C00  
;;  $5C11       $5C11  
;;  $5C28       $5FA4   $5FDE   $6009  
;;  $5C40       $5C3B  
;;  $5C5F       $5C56  
;;  $5C6C       $5C68   $5C6D  
;;  $5C7E       $5C62   $5C75  
;;  $5C80       $5C79  
;;  $5C84       $5C51   $5C7C  
;;  $5C8A       $5BEA  
;;  $5C8E       $5C2E   $5C32   $5C36   $5C48  
;;  $5CA4       $5C9B   $5CA1  
;;  $5CA5       $5C88  
;;  $5CC6       $5CC0  
;;  $5CCB       $5CD8  
;;  $5CE5       $5CFF  
;;  $5CE9       $5CFA  
;;  $5D2D       $5CC4   $5D07   $5DF2   $5E09  
;;  $5D30       $5D7A  
;;  $5D33       $5CBC   $5D40   $5D4A   $5D4C   $5D4E   $5D52   $5D54   $5DC8  
;;  $5D33       $5DD4   $5DDE   $5DEA   $5FB8   $5FE6   $6011  
;;  $5D42       $5CB4  
;;  $5D74       $5D60   $5D6C   $5D70   $5D84   $5D8C   $5D90   $5D94   $5D96  
;;  $5D74       $5D9A  
;;  $5D7C       $5D50  
;;  $5D86       $5B6E  
;;  $5D96       $5D64   $5D88  
;;  $5D9C       $5D48  
;;  $5DC6       $5DC3  
;;  $5DCC       $5DD2  
;;  $5DD6       $5DB2   $5DCE  
;;  $5DE0       $5D56  
;;  $5DEC       $5CC2  
;;  $5E3E       $5E4C  
;;  $5E4E       $5E3A  
;;  $5E57       $5E54  
;;  $5E59       $5E72  
;;  $5E74       $5E4F  
;;  $5E8E       $5E95  
;;  $5E97       $5E86  
;;  $5E99       $5EA2  
;;  $5EA8       $5EA5   $5EAB  
;;  $5EAF       $5E7F  
;;  $5EB8       $5EB3  
;;  $5EBC       $5ECD  
;;  $5ED8       $5F09  
;;  $5EDC       $5EF8  
;;  $5F0F       $5ED4  
;;  $5F11       $5F30  
;;  $5F16       $5F29  
;;  $5F34       $5E7C  
;;  $5F3F       $5F46  
;;  $5F4C       $5F55  
;;  $5F59       $5EAD   $5F0D   $5F32   $5F37  
;;  $5F6B       $5F82  
;;  $5F84       $5F67  
;;  $5F92       $5F8F  
;;  $5FA4       $5FB3  
;;  $5FAF       $5FAC  
;;  $5FB5       $5F85  
;;  $5FC8       $5FC5  
;;  $5FD3       $5FD0  
;;  $5FDE       $5FE4  
;;  $5FE8       $5FBB  
;;  $5FF3       $5FF0  
;;  $5FFE       $5FFB  
;;  $6009       $600F  
;;  $6013       $530A   $53E3   $5B04   $5B2C  
;;  $6014       $5B5B  
;;  $6015       $5B52  
;;  $6034       $602E  
;;  $6035       $601A   $601F   $6024   $6029  
;;  $6039       $603E  
;;  $6040       $603A  
;;  $6044       $6037  
;;  $6048       $51F8   $5235   $52DA   $57D8   $5B0B   $5B33   $5BF3   $67AF  
;;  $6052       $6059  
;;  $6063       $5D9C   $5DE0  
;;  $6066       $6069  
;;  $606D       $6070  
;;  $6073       $6076  
;;  $607E       $6081  
;;  $6084       $54CC   $5536   $563F  
;;  $608A       $52FF   $53F0  
;;  $60A1       $6099  
;;  $60A8       $6093   $609F  
;;  $60AC       $5D30  
;;  $60B0       $60F3  
;;  $60CC       $60C7   $60FD  
;;  $60F0       $60CA   $60CD   $60EA  
;;  $60FA       $6107   $6111   $611D   $613C   $6150   $615E   $6181   $6192  
;;  $60FA       $61A7  
;;  $60FB       $610A   $610D  
;;  $6109       $6104  
;;  $612F       $6123   $6129  
;;  $615B       $6155  
;;  $615C       $615A  
;;  $6160       $6157  
;;  $618D       $6185   $6189  
;;  $61D4       $61D2  
;;  $61E1       $61DF  
;;  $626A       $6256  
;;  $6310       $5DE7  
;;  $6326       $5DA1  
;;  $632E       $6319  
;;  $6332       $6322   $6336  
;;  $633B       $6347  
;;  $633D       $6342  
;;  $63BE       $63BE  
;;  $6402       $6400  
;;  $640D       $640D  
;;  $6417       $6415  
;;  $6418       $6416  
;;  $641F       $641D  
;;  $65B2       $65B0  
;;  $6658       $6656  
;;  $66B4       $66B2  
;;  $66B5       $66B3  
;;  $66B6       $66B4  
;;  $66D2       $559D   $5F97   $5FD8   $6003  
;;  $66D5       $66D8  
;;  $66D6       $66DA  
;;  $66D7       $66D3  
;;  $66DD       $5953   $596F   $5A2B  
;;  $66DF       $66E1  
;;  $66E3       $66EB  
;;  $66EA       $66E6  
;;  $66EE       $51BF   $5870   $59CB   $619D   $68EA  
;;  $66F1       $6700  
;;  $6706       $5159  
;;  $670F       $671E   $6725  
;;  $6723       $6720  
;;  $6728       $519A  
;;  $6730       $6749  
;;  $6740       $6738  
;;  $6746       $673E  
;;  $674C       $5188  
;;  $6750       $683C  
;;  $675F       $67BF   $67C7   $6836  
;;  $677E       $676C  
;;  $6782       $67D0  
;;  $678A       $6780  
;;  $679A       $6796  
;;  $67A4       $67A7  
;;  $67B2       $67AA  
;;  $67B6       $678F  
;;  $67C1       $67B8  
;;  $67C9       $67C3  
;;  $6815       $678A  
;;  $6838       $6754   $6759   $677C   $6788   $67EA   $6874   $6886  
;;  $683F       $683F  
;;  $6845       $675D  
;;  $6865       $6862  
;;  $68D0       $68CE  
;;  $68E7       $511D   $520A  
;;  $68E8       $68EF   $68F3  
;;  $691E       $6921  
;;  $6938       $6936  
;;  $696B       $68B9  
;;  $6ABA       $6AB8  
;;  $6AC0       $6ABE  
;;  $6BC0       $6BBE  
;;  $6FE3       $6FE1  
;; ======================================================================== ;;
