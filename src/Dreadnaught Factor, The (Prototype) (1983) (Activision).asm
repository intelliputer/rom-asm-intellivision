
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
        MVII    #$0042, R0                      ; 50D8   02B8 0042
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
        ADDI    #$00E8, R4                      ; 50EA   02FC 00E8
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

        MVII    #$000B, R0                      ; 5100   02B8 000B
        MVO     R0,     G_0107                  ; 5102   0240 0107
        MVO     R1,     G_0316                  ; 5104   0241 0316
        MVO     R2,     G_0105                  ; 5106   0242 0105
        XORI    #$0001, R1                      ; 5108   03F9 0001
        MVI@    R1,     R3                      ; 510A   028B
        CMPI    #$0007, R3                      ; 510B   037B 0007
        BNEQ    L_5111                          ; 510D   020C 0002

        MVO     R3,     G_01BD                  ; 510F   0243 01BD
L_5111:
        MVII    #$02F0, R6                      ; 5111   02BE 02F0
        MVII    #$00AE, R0                      ; 5113   02B8 00AE
        MVO     R0,     .ISRVEC.0               ; 5115   0240 0100
        MVII    #$005C, R0                      ; 5117   02B8 005C
        MVO     R0,     .ISRVEC.1               ; 5119   0240 0101
        MVII    #$000A, R0                      ; 511B   02B8 000A
        MVO     R0,     G_0106                  ; 511D   0240 0106
        MVO     R0,     G_0132                  ; 511F   0240 0132

        JSR     R4,     L_68EC                  ; 5121   0004 0068 00EC

        COMR    R0                              ; 5124   0018
        MVO     R0,     G_0102                  ; 5125   0240 0102
        SDBD                                    ; 5127   0001
        MVII    #$1458, R0                      ; 5128   02B8 0058 0014
        MVO     R0,     G_0352                  ; 512B   0240 0352
        MVII    #$0060, R0                      ; 512D   02B8 0060
        MVO     R0,     G_035A                  ; 512F   0240 035A
        EIS                                     ; 5131   0002
L_5132:
        MVI     G_0102, R0                      ; 5132   0280 0102
        TSTR    R0                              ; 5134   0080
        BNEQ    L_5132                          ; 5135   022C 0004

        JSR     R4,     L_5235                  ; 5137   0004 0050 0235

L_513A:
        CLRR    R0                              ; 513A   01C0
        MVO     R0,     G_0102                  ; 513B   0240 0102
L_513D:
        MVI     G_0316, R1                      ; 513D   0281 0316
        MVI     G_0359, R0                      ; 513F   0280 0359
        MVI     G_0103, R4                      ; 5141   0284 0103
        CMPI    #$0006, R4                      ; 5143   037C 0006
        BNEQ    L_514B                          ; 5145   020C 0004

        MOVR    R0,     R2                      ; 5147   0082
        ANDI    #$0001, R2                      ; 5148   03BA 0001
        XORR    R2,     R1                      ; 514A   01D1
L_514B:
        MVI@    R1,     R2                      ; 514B   028A
        MVO     R2,     G_0109                  ; 514C   0242 0109
        MVI     G_010A, R2                      ; 514E   0282 010A
        CMPI    #$005A, R2                      ; 5150   037A 005A
        BNEQ    L_515D                          ; 5152   020C 0009

        CMPI    #$0015, R0                      ; 5154   0378 0015
        BNC     L_51AF                          ; 5156   0209 0057

        JSR     R4,     L_5658                  ; 5158   0004 0054 0258

        B       L_51AF                          ; 515B   0200 0052

L_515D:
        JSR     R4,     L_670B                  ; 515D   0004 0064 030B

        MVI     G_0103, R0                      ; 5160   0280 0103
        CMPI    #$0006, R0                      ; 5162   0378 0006
        BNEQ    L_517E                          ; 5164   020C 0018

        MVII    #$022E, R4                      ; 5166   02BC 022E
        MOVR    R4,     R5                      ; 5168   00A5
L_5169:
        MVI@    R4,     R1                      ; 5169   02A1
        XORI    #$0004, R1                      ; 516A   03F9 0004
        MVO@    R1,     R5                      ; 516C   0269
        CMPI    #$0233, R4                      ; 516D   037C 0233
        BLE     L_5169                          ; 516F   0226 0007

        MVI     G_01C2, R1                      ; 5171   0281 01C2
        DECR    R1                              ; 5173   0011
        ANDI    #$0007, R1                      ; 5174   03B9 0007
        MVO     R1,     G_01C2                  ; 5176   0241 01C2
        ADDI    #$02D1, R1                      ; 5178   02F9 02D1
        MVI@    R1,     R2                      ; 517A   028A
        XORI    #$0005, R2                      ; 517B   03FA 0005
        MVO@    R2,     R1                      ; 517D   024A
L_517E:
        MVII    #$0001, R1                      ; 517E   02B9 0001
        MVO     R1,     G_01BB                  ; 5180   0241 01BB
        CMPI    #$0007, R0                      ; 5182   0378 0007
        BNEQ    L_519B                          ; 5184   020C 0015

        JSR     R4,     L_55B2                  ; 5186   0004 0054 01B2
        JSR     R4,     L_5479                  ; 5189   0004 0054 0079
        JSR     R4,     L_6751                  ; 518C   0004 0064 0351

        MVI     G_0103, R0                      ; 518F   0280 0103
        CMPI    #$0007, R0                      ; 5191   0378 0007
        BNEQ    L_519B                          ; 5193   020C 0006

        JSR     R4,     L_5824                  ; 5195   0004 0058 0024
        JSR     R4,     L_579B                  ; 5198   0004 0054 039B

L_519B:
        CLRR    R0                              ; 519B   01C0
        MVO     R0,     G_01BB                  ; 519C   0240 01BB

        JSR     R4,     L_672D                  ; 519E   0004 0064 032D
        JSR     R4,     L_5658                  ; 51A1   0004 0054 0258
        JSR     R4,     L_53FB                  ; 51A4   0004 0050 03FB
        JSR     R4,     L_51D9                  ; 51A7   0004 0050 01D9

        MVI     G_0104, R1                      ; 51AA   0281 0104
        INCR    R1                              ; 51AC   0009
        MVO     R1,     G_0104                  ; 51AD   0241 0104
L_51AF:
        MVI     G_0359, R1                      ; 51AF   0281 0359
        INCR    R1                              ; 51B1   0009
        MVO     R1,     G_0359                  ; 51B2   0241 0359
        SDBD                                    ; 51B4   0001
        CMPI    #$8CA0, R1                      ; 51B5   0379 00A0 008C
        BNC     L_51C1                          ; 51B8   0209 0007

        MVII    #$005A, R1                      ; 51BA   02B9 005A
        MVO     R1,     G_010A                  ; 51BC   0241 010A

        JSR     R4,     L_56BB                  ; 51BE   0004 0054 02BB

L_51C1:
        MVII    #$0001, R1                      ; 51C1   02B9 0001

        JSR     R4,     L_66F3                  ; 51C3   0004 0064 02F3

        MVI     G_0102, R0                      ; 51C6   0280 0102
        CMPI    #$0002, R0                      ; 51C8   0378 0002
        BLT     L_51C1                          ; 51CA   0225 000A

        CMPI    #$00FF, R0                      ; 51CC   0378 00FF
        BEQ     L_513D                          ; 51CE   0224 0092
        B       L_513A                          ; 51D0   0220 0097

        SARC    R2,     2                       ; 51D2   007E
        MOVR    R7,     R6                      ; 51D3   00BE
        ADDR    R3,     R6                      ; 51D4   00DE
        SARC    R1,     2                       ; 51D5   007D
        MOVR    R7,     R5                      ; 51D6   00BD
        ADDR    R3,     R5                      ; 51D7   00DD
        SARC    R3,     1                       ; 51D8   007B
L_51D9:
        PSHR    R4                              ; 51D9   0274
        MVI     G_035A, R0                      ; 51DA   0280 035A
        DECR    R0                              ; 51DC   0010
        BMI     L_53A1                          ; 51DD   020B 01C2

        MVO     R0,     G_035A                  ; 51DF   0240 035A
        BNEQ    L_53A1                          ; 51E1   020C 01BE

        MVI     G_0103, R1                      ; 51E3   0281 0103
        INCR    R1                              ; 51E5   0009
        ADDR    R7,     R1                      ; 51E6   00F9
        ADD@    R1,     R7                      ; 51E7   02CF

        ADDR    R3,     R4                      ; 51E8   00DC
        ANDR    R7,     R1                      ; 51E9   01B9
        CMPR    R4,     R6                      ; 51EA   0166
        SARC    R2,     2                       ; 51EB   007E
        SLR     R0,     1                       ; 51EC   0060
        ANDR    R7,     R1                      ; 51ED   01B9
        ANDR    R7,     R1                      ; 51EE   01B9
        ANDR    R7,     R1                      ; 51EF   01B9
        NEGR    R1                              ; 51F0   0021
        INCR    R2                              ; 51F1   000A
        MVII    #$0003, R3                      ; 51F2   02BB 0003
        MVO     R3,     G_0103                  ; 51F4   0243 0103
        MVII    #$0035, R0                      ; 51F6   02B8 0035
        MVO     R0,     G_035A                  ; 51F8   0240 035A
        MVII    #$0005, R1                      ; 51FA   02B9 0005

        JSR     R4,     L_604D                  ; 51FC   0004 0060 004D

        SDBD                                    ; 51FF   0001
        MVII    #$628C, R0                      ; 5200   02B8 008C 0062
        MVO     R0,     G_0353                  ; 5203   0240 0353
        CLRR    R0                              ; 5205   01C0
        MVO     R0,     G_01B5                  ; 5206   0240 01B5
        PULR    R7                              ; 5208   02B7

        MVI     G_0107, R0                      ; 5209   0280 0107
        INCR    R0                              ; 520B   0008
        MVO     R0,     G_0107                  ; 520C   0240 0107

        JSR     R4,     L_68EC                  ; 520E   0004 0068 00EC

        CLRR    R0                              ; 5211   01C0
        MVO     R0,     G_0103                  ; 5212   0240 0103
L_5214:
        MVI     G_0102, R0                      ; 5214   0280 0102
        TSTR    R0                              ; 5216   0080
        BNEQ    L_5214                          ; 5217   022C 0004

        MVII    #$0060, R0                      ; 5219   02B8 0060
        MVO     R0,     G_035A                  ; 521B   0240 035A

        JSR     R4,     L_533D                  ; 521D   0004 0050 033D

        BEQ     L_523F                          ; 5220   0204 001D

        MVI     G_0106, R0                      ; 5222   0280 0106
        MVI     G_0105, R1                      ; 5224   0281 0105
        CMPI    #$0005, R1                      ; 5226   0379 0005
        BLT     L_522C                          ; 5228   0205 0002

        ADDI    #$0002, R0                      ; 522A   02F8 0002
L_522C:
        ADDI    #$0002, R0                      ; 522C   02F8 0002
        CMPI    #$0100, R0                      ; 522E   0378 0100
        BGE     L_5234                          ; 5230   020D 0002

        MVO     R0,     G_0106                  ; 5232   0240 0106
L_5234:
        INCR    R7                              ; 5234   000F

L_5235:
        PSHR    R4                              ; 5235   0274
L_5236:
        CLRR    R3                              ; 5236   01DB
        MVII    #$0001, R1                      ; 5237   02B9 0001

        JSR     R4,     L_604D                  ; 5239   0004 0060 004D
        JSR     R4,     L_5AB3                  ; 523C   0004 0058 02B3
L_523F:
        JSR     R4,     L_5AB2                  ; 523F   0004 0058 02B2

        MVI     G_0106, R0                      ; 5242   0280 0106
        DECR    R0                              ; 5244   0010
        MVO     R0,     G_0106                  ; 5245   0240 0106
        PULR    R7                              ; 5247   02B7

        MVII    #$0006, R0                      ; 5248   02B8 0006
        MVO     R0,     G_0103                  ; 524A   0240 0103
        MVII    #$0200, R4                      ; 524C   02BC 0200
        CLRR    R0                              ; 524E   01C0
        MVO     R0,     G_0102                  ; 524F   0240 0102
L_5251:
        MVO@    R0,     R4                      ; 5251   0260
        MVO@    R0,     R4                      ; 5252   0260
        CMPI    #$02F0, R4                      ; 5253   037C 02F0
        BLT     L_5251                          ; 5255   0225 0005

        SDBD                                    ; 5257   0001
        MVII    #$5BCC, R4                      ; 5258   02BC 00CC 005B
        MVII    #$0010, R0                      ; 525B   02B8 0010

        JSR     R5,     L_5AD1                  ; 525D   0004 0158 02D1

        CLRR    R0                              ; 5260   01C0
        MVO     R0,     G_0317                  ; 5261   0240 0317
        MVO     R0,     G_031A                  ; 5263   0240 031A
        PULR    R7                              ; 5265   02B7

        MVII    #$0004, R0                      ; 5266   02B8 0004
        MVO     R0,     G_0103                  ; 5268   0240 0103
        SWAP    R0,     1                       ; 526A   0040
        ADDI    #$00FF, R0                      ; 526B   02F8 00FF
        MVO     R0,     G_035A                  ; 526D   0240 035A
        MVII    #$0200, R1                      ; 526F   02B9 0200
L_5271:
        MVI@    R1,     R2                      ; 5271   028A
        SWAP    R2,     1                       ; 5272   0042
        ANDI    #$0036, R2                      ; 5273   03BA 0036
        CMPI    #$0012, R2                      ; 5275   037A 0012
        BNEQ    L_527E                          ; 5277   020C 0005

        XORI    #$0004, R2                      ; 5279   03FA 0004
        SWAP    R2,     1                       ; 527B   0042
        XOR@    R1,     R2                      ; 527C   03CA
        MVO@    R2,     R1                      ; 527D   024A
L_527E:
        INCR    R1                              ; 527E   0009
        CMPI    #$02F0, R1                      ; 527F   0379 02F0
        BLT     L_5271                          ; 5281   0225 0011

        SLL     R1,     2                       ; 5283   004D
L_5284:
        DECR    R1                              ; 5284   0011
        NOP                                     ; 5285   0034
        BNEQ    L_5284                          ; 5286   022C 0003

        MVII    #$0200, R4                      ; 5288   02BC 0200
        SDBD                                    ; 528A   0001
        MVII    #$0400, R2                      ; 528B   02BA 0000 0004
L_528E:
        MVII    #$0005, R1                      ; 528E   02B9 0005
L_5290:
        MVO@    R2,     R4                      ; 5290   0262
        DECR    R1                              ; 5291   0011
        BNEQ    L_5290                          ; 5292   022C 0003

        ADDI    #$000F, R4                      ; 5294   02FC 000F
        CMPI    #$02F0, R4                      ; 5296   037C 02F0
        BLT     L_528E                          ; 5298   0225 000B

        MVII    #$0205, R0                      ; 529A   02B8 0205
L_529C:
        MOVR    R0,     R5                      ; 529C   0085
        DECLE   $02B9,  $00D0,  $0011,  $022C   ; 529D   02B9 00D0 0011 022C
        DECLE   $0002,  $0001                   ; 52A1   0002 0001

        MVII    #$0000, R2                      ; 52A3   02BA 0000

        JSRD    R6,     L_6AFD                  ; 52A5   0004 026A 02FD

        DECR    R3                              ; 52A8   0013
L_52A9:
        MOVR    R5,     R4                      ; 52A9   00AC
        MVI@    R4,     R1                      ; 52AA   02A1
        MVO@    R1,     R4                      ; 52AB   0261
        XORI    #$0002, R1                      ; 52AC   03F9 0002
        MVO@    R1,     R5                      ; 52AE   0269
        ADDI    #$0012, R4                      ; 52AF   02FC 0012
        ADDI    #$0013, R5                      ; 52B1   02FD 0013
        CMPI    #$02DC, R4                      ; 52B3   037C 02DC
        BLT     L_52A9                          ; 52B5   0225 000D

        MVO@    R2,     R5                      ; 52B7   026A
        INCR    R0                              ; 52B8   0008
        CMPI    #$0212, R0                      ; 52B9   0378 0212
        BLE     L_529C                          ; 52BB   0226 0020

        CLRR    R1                              ; 52BD   01C9
        MVO     R1,     G_0106                  ; 52BE   0241 0106
        COMR    R1                              ; 52C0   0019
        MVO     R1,     G_0102                  ; 52C1   0241 0102
        PULR    R7                              ; 52C3   02B7

        CLRR    R0                              ; 52C4   01C0
        MVO     R0,     G_010A                  ; 52C5   0240 010A
        INCR    R0                              ; 52C7   0008
        MVO     R0,     G_0103                  ; 52C8   0240 0103

        JSR     R4,     L_533D                  ; 52CA   0004 0050 033D

        BEQ     L_52D2                          ; 52CD   0204 0003
        J       L_57DA                          ; 52CF   0004 0354 03DA

L_52D2:
        MVII    #$0006, R0                      ; 52D2   02B8 0006
        MVO     R0,     G_0103                  ; 52D4   0240 0103
        MVI     G_0106, R0                      ; 52D6   0280 0106
        TSTR    R0                              ; 52D8   0080
        BEQ     L_52E1                          ; 52D9   0204 0006

        CLRR    R3                              ; 52DB   01DB
        MVII    #$0006, R1                      ; 52DC   02B9 0006

        JSR     R4,     L_604D                  ; 52DE   0004 0060 004D

L_52E1:
        MVI     G_0107, R1                      ; 52E1   0281 0107
        SLL     R1,     1                       ; 52E3   0049
        MOVR    R1,     R2                      ; 52E4   008A
        SLL     R1,     2                       ; 52E5   004D
        SLL     R1,     1                       ; 52E6   0049
        ADDR    R1,     R2                      ; 52E7   00CA
        SLL     R1,     1                       ; 52E8   0049
        ADDR    R2,     R1                      ; 52E9   00D1
        MVII    #$035B, R2                      ; 52EA   02BA 035B
        MVO@    R1,     R2                      ; 52EC   0251
        SDBD                                    ; 52ED   0001
        MVII    #$6257, R1                      ; 52EE   02B9 0057 0062
        INCR    R0                              ; 52F1   0008
        MVO     R0,     G_01B8                  ; 52F2   0240 01B8
        MVO     R1,     G_0353                  ; 52F4   0241 0353
L_52F6:
        CLRR    R1                              ; 52F6   01C9
        MVO     R1,     G_0102                  ; 52F7   0241 0102
        MVII    #$0067, R1                      ; 52F9   02B9 0067
        SWAP    R1,     1                       ; 52FB   0041
L_52FC:
        DECR    R1                              ; 52FC   0011
        BNEQ    L_52FC                          ; 52FD   022C 0002

        DECR    R0                              ; 52FF   0010
        BEQ     L_5326                          ; 5300   0204 0024

        PSHR    R0                              ; 5302   0270

        JSR     R5,     L_608F                  ; 5303   0004 0160 008F

        PSHR    R2                              ; 5306   0272
        MOVR    R0,     R1                      ; 5307   0081
        NEGR    R1                              ; 5308   0021
        ADD     G_0106, R1                      ; 5309   02C1 0106
        INCR    R1                              ; 530B   0009
        MVII    #$02C2, R5                      ; 530C   02BD 02C2

        JSR     R4,     L_6018                  ; 530E   0004 0060 0018
        JSR     R4,     L_5B4F                  ; 5311   0004 0058 034F

        PULR    R2                              ; 5314   02B2
        PULR    R0                              ; 5315   02B0
        CMP     G_0106, R0                      ; 5316   0340 0106
        BEQ     L_5324                          ; 5318   0204 000A

        MVI     G_031F, R3                      ; 531A   0283 031F
        ADDI    #$0002, R3                      ; 531C   02FB 0002
        CMPI    #$016A, R3                      ; 531E   037B 016A
        BGT     L_5324                          ; 5320   020E 0002

        MVO     R3,     G_031F                  ; 5322   0243 031F
L_5324:
        B       L_52F6                          ; 5324   0220 002F

L_5326:
        MVO     R0,     G_0317                  ; 5326   0240 0317
        MVII    #$02D1, R4                      ; 5328   02BC 02D1
        SDBD                                    ; 532A   0001
        MVII    #$5335, R5                      ; 532B   02BD 0035 0053
L_532E:
        MVI@    R5,     R1                      ; 532E   02A9
        MVO@    R1,     R4                      ; 532F   0261
        CMPI    #$02D8, R4                      ; 5330   037C 02D8
        BLE     L_532E                          ; 5332   0226 0005
        PULR    R7                              ; 5334   02B7

        DECLE   $01B7                           ; 5335   01B7

        CMPR    R1,     R7                      ; 5336   014F
        SUBR    R3,     R7                      ; 5337   011F

        DECLE   $01A7,  $017F,  $0197,  $01CF   ; 5338   01A7 017F 0197 01CF

        INCR    R7                              ; 533C   000F

L_533D:
        PSHR    R4                              ; 533D   0274
L_533E:
        MVI     G_0105, R1                      ; 533E   0281 0105
        ADDR    R7,     R1                      ; 5340   00F9
        ADDI    #$0005, R1                      ; 5341   02F9 0005
        MVI     G_0107, R2                      ; 5343   0282 0107
        CMP@    R1,     R2                      ; 5345   034A
        PULR    R7                              ; 5346   02B7

        DECLE   $0001,  $0001,  $0002,  $0005   ; 5347   0001 0001 0002 0005

        INCR    R2                              ; 534B   000A
        INCR    R7                              ; 534C   000F

        SLR     R0,     2                       ; 534D   0064
L_534E:
        SDBD                                    ; 534E   0001
        MVII    #$61AE, R0                      ; 534F   02B8 00AE 0061
        MVO     R0,     G_0354                  ; 5352   0240 0354
        CLRR    R0                              ; 5354   01C0
        MVO     R0,     G_01B5                  ; 5355   0240 01B5
        MVO     R0,     G_0353                  ; 5357   0240 0353
        MVII    #$0007, R0                      ; 5359   02B8 0007
        MVO     R0,     G_0103                  ; 535B   0240 0103
        MVII    #$00FF, R0                      ; 535D   02B8 00FF
        MVO     R0,     G_0102                  ; 535F   0240 0102
        MVI     G_0108, R0                      ; 5361   0280 0108
        SLR     R0,     1                       ; 5363   0060
        ADDI    #$0019, R0                      ; 5364   02F8 0019
        MVO     R0,     G_012E                  ; 5366   0240 012E
        CLRR    R0                              ; 5368   01C0
        MVO     R0,     G_034F                  ; 5369   0240 034F
        MVI     G_0132, R1                      ; 536B   0281 0132
        SDBD                                    ; 536D   0001
        ADDI    #$68E7, R1                      ; 536E   02F9 00E7 0068
        MVI@    R1,     R0                      ; 5371   0288
        SWAP    R0,     1                       ; 5372   0040
        MVO     R0,     G_0350                  ; 5373   0240 0350
        SDBD                                    ; 5375   0001
        MVII    #$6244, R0                      ; 5376   02B8 0044 0062
        MVO     R0,     G_0355                  ; 5379   0240 0355
        MVII    #$0010, R0                      ; 537B   02B8 0010
        MVO     R0,     G_010C                  ; 537D   0240 010C
        MVII    #$0133, R5                      ; 537F   02BD 0133
        CLRR    R2                              ; 5381   01D2
L_5382:
        ADD@    R5,     R2                      ; 5382   02EA
        CMPI    #$0199, R5                      ; 5383   037D 0199
        BLT     L_5382                          ; 5385   0225 0004

        SLR     R2,     2                       ; 5387   0066
        SLR     R2,     1                       ; 5388   0062
        MVI     G_0131, R4                      ; 5389   0284 0131
        MOVR    R4,     R1                      ; 538B   00A1
        ANDI    #$000F, R4                      ; 538C   03BC 000F
        ADDR    R4,     R5                      ; 538E   00E5
        SLR     R1,     2                       ; 538F   0065
        SLR     R1,     2                       ; 5390   0065
        SUBR    R2,     R1                      ; 5391   0111
        BLE     L_5399                          ; 5392   0206 0005

        CLRR    R0                              ; 5394   01C0
L_5395:
        MVO@    R0,     R5                      ; 5395   0268
        DECR    R1                              ; 5396   0011
        BNEQ    L_5395                          ; 5397   022C 0003

L_5399:
        MVI     G_0102, R0                      ; 5399   0280 0102
        TSTR    R0                              ; 539B   0080
        BNEQ    L_5399                          ; 539C   022C 0004

        JSR     R4,     L_5BEC                  ; 539E   0004 0058 03EC

L_53A1:
        MVI     G_0103, R0                      ; 53A1   0280 0103
        CMPI    #$0002, R0                      ; 53A3   0378 0002
        BGT     L_53CA                          ; 53A5   020E 0023

        MVI     G_0104, R1                      ; 53A7   0281 0104
        MVI     G_0118, R2                      ; 53A9   0282 0118
        SWAP    R2,     2                       ; 53AB   0046
        BPL     L_53BA                          ; 53AC   0203 000C

        MVI     G_0317, R3                      ; 53AE   0283 0317
        ANDI    #$01FF, R3                      ; 53B0   03BB 01FF
        MOVR    R1,     R2                      ; 53B2   008A
        SLR     R2,     1                       ; 53B3   0062
        ANDI    #$0002, R2                      ; 53B4   03BA 0002
        SWAP    R2,     1                       ; 53B6   0042
        XORR    R2,     R3                      ; 53B7   01D3
        MVO     R3,     G_0317                  ; 53B8   0243 0317
L_53BA:
        MVI     G_011A, R2                      ; 53BA   0282 011A
        SWAP    R2,     2                       ; 53BC   0046
        BPL     L_53CA                          ; 53BD   0203 000B

        MVI     G_0319, R3                      ; 53BF   0283 0319
        ANDI    #$01FF, R3                      ; 53C1   03BB 01FF
        SLR     R1,     2                       ; 53C3   0065
        ANDI    #$0002, R1                      ; 53C4   03B9 0002
        SWAP    R1,     1                       ; 53C6   0041
        XORR    R1,     R3                      ; 53C7   01CB
        MVO     R3,     G_0319                  ; 53C8   0243 0319
L_53CA:
        CMPI    #$0001, R0                      ; 53CA   0378 0001
        BLT     L_53DE                          ; 53CC   0205 0010
        BNEQ    L_53DD                          ; 53CE   020C 000D

        MVI     G_010A, R1                      ; 53D0   0281 010A
        TSTR    R1                              ; 53D2   0089
        BEQ     L_53DD                          ; 53D3   0204 0008

        MVII    #$0002, R0                      ; 53D5   02B8 0002
        MVO     R0,     G_0103                  ; 53D7   0240 0103
        MVII    #$0001, R0                      ; 53D9   02B8 0001
        MVO     R0,     G_035A                  ; 53DB   0240 035A
L_53DD:
        PULR    R7                              ; 53DD   02B7

L_53DE:
        MVI     G_01C1, R1                      ; 53DE   0281 01C1
        DECR    R1                              ; 53E0   0011
        BMI     L_53FA                          ; 53E1   020B 0017

        MVO     R1,     G_01C1                  ; 53E3   0241 01C1
        MVII    #$02AE, R5                      ; 53E5   02BD 02AE

        JSR     R4,     L_6018                  ; 53E7   0004 0060 0018

        TSTR    R3                              ; 53EA   009B
        BNEQ    L_53EF                          ; 53EB   020C 0002

        MVO     R3,     .BTAB.B1                ; 53ED   0243 02B1
L_53EF:
        MVII    #$000A, R1                      ; 53EF   02B9 000A
        MVII    #$01B3, R2                      ; 53F1   02BA 01B3
        MVO@    R1,     R2                      ; 53F3   0251

        JSR     R5,     L_608F                  ; 53F4   0004 0160 008F
        JSR     R4,     L_5B4F                  ; 53F7   0004 0058 034F

L_53FA:
        PULR    R7                              ; 53FA   02B7

L_53FB:
        MVI     G_0103, R0                      ; 53FB   0280 0103
        CMPI    #$0007, R0                      ; 53FD   0378 0007
        BNEQ    L_5407                          ; 53FF   020C 0006

        MVII    #$016F, R5                      ; 5401   02BD 016F
L_5403:
        MVI@    R5,     R0                      ; 5403   02A8
        TSTR    R0                              ; 5404   0080
        BNEQ    L_5408                          ; 5405   020C 0001
L_5407:
        MOVR    R4,     R7                      ; 5407   00A7

L_5408:
        INCR    R5                              ; 5408   000D
        CMPI    #$018F, R5                      ; 5409   037D 018F
        BLT     L_5403                          ; 540B   0225 0009

        MVII    #$0008, R0                      ; 540D   02B8 0008
        MVO     R0,     G_0103                  ; 540F   0240 0103
        SDBD                                    ; 5411   0001
        MVII    #$05FF, R0                      ; 5412   02B8 00FF 0005
        MVO     R0,     G_035A                  ; 5415   0240 035A
        CLRR    R0                              ; 5417   01C0
        SDBD                                    ; 5418   0001
        MVII    #$6296, R1                      ; 5419   02B9 0096 0062
        MVII    #$0353, R5                      ; 541C   02BD 0353
        MVO@    R0,     R5                      ; 541E   0268
        MVO@    R1,     R5                      ; 541F   0269
        MVO@    R0,     R5                      ; 5420   0268
        MVO     R0,     G_01B6                  ; 5421   0240 01B6
L_5423:
        NOP                                     ; 5423   0034
        INCR    R5                              ; 5424   000D
        BNEQ    L_5423                          ; 5425   022C 0003

        MVII    #$0200, R3                      ; 5427   02BB 0200
L_5429:
        MVI@    R3,     R0                      ; 5429   0298
        SDBD                                    ; 542A   0001
        ANDI    #$09F8, R0                      ; 542B   03B8 00F8 0009
        MOVR    R0,     R1                      ; 542E   0081
        XOR@    R3,     R1                      ; 542F   03D9
        MOVR    R1,     R2                      ; 5430   008A
        ANDI    #$0007, R1                      ; 5431   03B9 0007
        CMPI    #$0002, R1                      ; 5433   0379 0002
        BLE     L_5439                          ; 5435   0206 0002

        MVII    #$0006, R1                      ; 5437   02B9 0006
L_5439:
        SWAP    R2,     1                       ; 5439   0042
        ANDI    #$0036, R2                      ; 543A   03BA 0036
        BEQ     L_5440                          ; 543C   0204 0002

        MVII    #$0024, R2                      ; 543E   02BA 0024
L_5440:
        SWAP    R2,     1                       ; 5440   0042
        XORR    R2,     R1                      ; 5441   01D1
        XORR    R1,     R0                      ; 5442   01C8
        MVO@    R0,     R3                      ; 5443   0258
        INCR    R3                              ; 5444   000B
        CMPI    #$02F0, R3                      ; 5445   037B 02F0
        BLT     L_5429                          ; 5447   0225 001F

        NEGR    R3                              ; 5449   0023
        SLR     R3,     1                       ; 544A   0063
L_544B:
        DECR    R3                              ; 544B   0013
        BNEQ    L_544B                          ; 544C   022C 0002

        MVII    #$0200, R3                      ; 544E   02BB 0200
L_5450:
        MVI@    R3,     R0                      ; 5450   0298
        SDBD                                    ; 5451   0001
        ANDI    #$09F8, R0                      ; 5452   03B8 00F8 0009
        MOVR    R0,     R1                      ; 5455   0081
        XOR@    R3,     R1                      ; 5456   03D9
        MOVR    R1,     R2                      ; 5457   008A
        ANDI    #$0007, R1                      ; 5458   03B9 0007
        CMPI    #$0002, R1                      ; 545A   0379 0002
        BLE     L_5460                          ; 545C   0206 0002

        MVII    #$0007, R1                      ; 545E   02B9 0007
L_5460:
        SWAP    R2,     1                       ; 5460   0042
        ANDI    #$0036, R2                      ; 5461   03BA 0036
        BEQ     L_5467                          ; 5463   0204 0002

        MVII    #$0026, R2                      ; 5465   02BA 0026
L_5467:
        SWAP    R2,     1                       ; 5467   0042
        XORR    R2,     R1                      ; 5468   01D1
        XORR    R1,     R0                      ; 5469   01C8
        MVO@    R0,     R3                      ; 546A   0258
        INCR    R3                              ; 546B   000B
        CMPI    #$02F0, R3                      ; 546C   037B 02F0
        BLT     L_5450                          ; 546E   0225 001F

        NEGR    R3                              ; 5470   0023
        SLR     R3,     2                       ; 5471   0067
L_5472:
        DECR    R3                              ; 5472   0013
        BNEQ    L_5472                          ; 5473   022C 0002

        COMR    R3                              ; 5475   001B
        MVO     R3,     G_0102                  ; 5476   0243 0102
        MOVR    R4,     R7                      ; 5478   00A7

L_5479:
        PSHR    R4                              ; 5479   0274
        MVII    #$0318, R1                      ; 547A   02B9 0318
L_547C:
        PSHR    R1                              ; 547C   0271
        MVI@    R1,     R0                      ; 547D   0288
        ANDI    #$0300, R0                      ; 547E   03B8 0300
        BEQ     L_5502                          ; 5480   0204 0080

        MOVR    R1,     R2                      ; 5482   008A
        ADDI    #$0028, R2                      ; 5483   02FA 0028
        MVI@    R2,     R3                      ; 5485   0293
        SDBD                                    ; 5486   0001
        CMPI    #$0600, R3                      ; 5487   037B 0000 0006
        BNEQ    L_5502                          ; 548A   020C 0076

        SUBI    #$0227, R2                      ; 548C   033A 0227
        MVI@    R2,     R3                      ; 548E   0293
        ANDI    #$0040, R3                      ; 548F   03BB 0040
        BNEQ    L_5502                          ; 5491   020C 006F

        MVII    #$0002, R2                      ; 5493   02BA 0002
        MVII    #$0007, R3                      ; 5495   02BB 0007

        JSR     R4,     L_555B                  ; 5497   0004 0054 015B

        TSTR    R5                              ; 549A   00AD
        BEQ     L_5502                          ; 549B   0204 0065

        CMPI    #$0224, R1                      ; 549D   0379 0224
        BEQ     L_54CC                          ; 549F   0204 002B

        CMPI    #$0228, R1                      ; 54A1   0379 0228
        BEQ     L_54CC                          ; 54A3   0204 0027

        MVII    #$0244, R5                      ; 54A5   02BD 0244
        CMPI    #$0226, R1                      ; 54A7   0379 0226
        BEQ     L_54C6                          ; 54A9   0204 001B

        CMPI    #$0254, R1                      ; 54AB   0379 0254
        BEQ     L_54C6                          ; 54AD   0204 0017

        CMPI    #$0256, R1                      ; 54AF   0379 0256
        BEQ     L_54C6                          ; 54B1   0204 0013

        CMPI    #$025C, R1                      ; 54B3   0379 025C
        BEQ     L_54C6                          ; 54B5   0204 000F

        CMPI    #$025E, R1                      ; 54B7   0379 025E
        BEQ     L_54C6                          ; 54B9   0204 000B

        MVII    #$0248, R5                      ; 54BB   02BD 0248
        CMPI    #$022A, R1                      ; 54BD   0379 022A
        BEQ     L_54C6                          ; 54BF   0204 0005

        CMPI    #$0244, R1                      ; 54C1   0379 0244
        BLT     L_5502                          ; 54C3   0205 003D
        INCR    R7                              ; 54C5   000F

L_54C6:
        MOVR    R5,     R1                      ; 54C6   00A9
L_54C7:
        MOVR    R1,     R5                      ; 54C7   008D
        ANDI    #$0002, R5                      ; 54C8   03BD 0002
        BNEQ    L_5502                          ; 54CA   020C 0036

L_54CC:
        MVO@    R1,     R4                      ; 54CC   0261
        PSHR    R2                              ; 54CD   0272
        DECR    R4                              ; 54CE   0014
        MOVR    R4,     R2                      ; 54CF   00A2

        JSR     R5,     L_6089                  ; 54D0   0004 0160 0089

        PULR    R2                              ; 54D3   02B2
        MVI     G_0118, R4                      ; 54D4   0284 0118
        ANDI    #$0040, R4                      ; 54D6   03BC 0040
        BNEQ    L_54E0                          ; 54D8   020C 0006

        SDBD                                    ; 54DA   0001
        MVII    #$61F5, R4                      ; 54DB   02BC 00F5 0061
        MVO     R4,     G_0353                  ; 54DE   0244 0353
L_54E0:
        MVI@    R2,     R4                      ; 54E0   0294
        SDBD                                    ; 54E1   0001
        ANDI    #$F607, R4                      ; 54E2   03BC 0007 00F6
        CMPI    #$0244, R1                      ; 54E5   0379 0244
        BLT     L_54ED                          ; 54E7   0205 0004

        SLL     R1,     2                       ; 54E9   004D
        ADDI    #$0008, R1                      ; 54EA   02F9 0008
        XORR    R1,     R4                      ; 54EC   01CC
L_54ED:
        MVO@    R4,     R2                      ; 54ED   0254

        JSR     R4,     L_5581                  ; 54EE   0004 0054 0181

        MVII    #$0004, R0                      ; 54F1   02B8 0004
        MVII    #$00C1, R2                      ; 54F3   02BA 00C1
        PULR    R1                              ; 54F5   02B1
        PSHR    R1                              ; 54F6   0271
        SUBI    #$0207, R1                      ; 54F7   0339 0207
        MVO@    R0,     R1                      ; 54F9   0248
        ADDI    #$0008, R1                      ; 54FA   02F9 0008
        MVO@    R2,     R1                      ; 54FC   024A
        ADDI    #$0227, R1                      ; 54FD   02F9 0227
        MVII    #$0080, R4                      ; 54FF   02BC 0080
        MVO@    R4,     R1                      ; 5501   024C
L_5502:
        PULR    R1                              ; 5502   02B1
        INCR    R1                              ; 5503   0009
        CMPI    #$0319, R1                      ; 5504   0379 0319
        BEQ     L_547C                          ; 5506   0224 008B
        PULR    R7                              ; 5508   02B7

L_5509:
        PSHR    R4                              ; 5509   0274
        PSHR    R1                              ; 550A   0271
        ADDI    #$01FF, R1                      ; 550B   02F9 01FF
        MVII    #$0005, R2                      ; 550D   02BA 0005
        MVII    #$0006, R3                      ; 550F   02BB 0006

        JSR     R4,     L_555B                  ; 5511   0004 0054 015B

        TSTR    R5                              ; 5514   00AD
        BEQ     L_5559                          ; 5515   0204 0042

        MVII    #$0001, R5                      ; 5517   02BD 0001
        CMPI    #$022C, R1                      ; 5519   0379 022C
        BEQ     L_5535                          ; 551B   0204 0018

        NEGR    R5                              ; 551D   0025
        CMPI    #$0230, R1                      ; 551E   0379 0230
        BEQ     L_5535                          ; 5520   0204 0013

        MVII    #$0014, R5                      ; 5522   02BD 0014
        CMPI    #$0234, R1                      ; 5524   0379 0234
        BEQ     L_5535                          ; 5526   0204 000D

        CMPI    #$023C, R1                      ; 5528   0379 023C
        BEQ     L_5535                          ; 552A   0204 0009

        NEGR    R5                              ; 552C   0025
        CMPI    #$0238, R1                      ; 552D   0379 0238
        BEQ     L_5535                          ; 552F   0204 0004

        CMPI    #$0240, R1                      ; 5531   0379 0240
        BNEQ    L_5559                          ; 5533   020C 0024

L_5535:
        MVO@    R1,     R4                      ; 5535   0261
        PSHR    R2                              ; 5536   0272
        PSHR    R5                              ; 5537   0275
        DECR    R4                              ; 5538   0014
        MOVR    R4,     R2                      ; 5539   00A2

        JSR     R5,     L_6089                  ; 553A   0004 0160 0089

        PULR    R5                              ; 553D   02B5
        PULR    R2                              ; 553E   02B2
        MVI@    R2,     R1                      ; 553F   0291
        ADDI    #$0008, R1                      ; 5540   02F9 0008
        MVO@    R1,     R2                      ; 5542   0251
        ADDR    R5,     R2                      ; 5543   00EA
        CMPI    #$0200, R2                      ; 5544   037A 0200
        BLT     L_5550                          ; 5546   0205 0008

        CMPI    #$02EF, R2                      ; 5548   037A 02EF
        BGT     L_5550                          ; 554A   020E 0004

        MVI@    R2,     R1                      ; 554C   0291
        ADDI    #$0008, R1                      ; 554D   02F9 0008
        MVO@    R1,     R2                      ; 554F   0251

L_5550:
        JSR     R4,     L_5581                  ; 5550   0004 0054 0181

        TSTR    R5                              ; 5553   00AD
        BPL     L_5558                          ; 5554   0203 0002

        SUBI    #$0002, R4                      ; 5556   033C 0002
L_5558:
        MVO@    R3,     R4                      ; 5558   0263
L_5559:
        PULR    R1                              ; 5559   02B1
        PULR    R7                              ; 555A   02B7

L_555B:
        PSHR    R4                              ; 555B   0274
        CLRR    R5                              ; 555C   01ED
        MVI@    R1,     R0                      ; 555D   0288
        SUBR    R2,     R0                      ; 555E   0110
        SLR     R0,     1                       ; 555F   0060
        SLR     R0,     2                       ; 5560   0064
        ANDI    #$001F, R0                      ; 5561   03B8 001F
        CMPI    #$0014, R0                      ; 5563   0378 0014
        BGE     L_5580                          ; 5565   020D 0019

        ADDI    #$0008, R1                      ; 5567   02F9 0008
        MVI@    R1,     R2                      ; 5569   028A
        SUBR    R3,     R2                      ; 556A   011A
        ANDI    #$0078, R2                      ; 556B   03BA 0078
        MOVR    R2,     R3                      ; 556D   0093
        SLR     R3,     1                       ; 556E   0063
        CMPI    #$0030, R3                      ; 556F   037B 0030
        BGE     L_5580                          ; 5571   020D 000D

        SLL     R2,     1                       ; 5573   004A
        ADDR    R3,     R2                      ; 5574   00DA
        ADDR    R0,     R2                      ; 5575   00C2
        ADDI    #$0200, R2                      ; 5576   02FA 0200
        SUBI    #$016D, R1                      ; 5578   0339 016D
        MOVR    R1,     R4                      ; 557A   008C
        MVI@    R2,     R1                      ; 557B   0291
        SLR     R1,     2                       ; 557C   0065
        ANDI    #$027E, R1                      ; 557D   03B9 027E
        INCR    R5                              ; 557F   000D
L_5580:
        PULR    R7                              ; 5580   02B7

L_5581:
        PSHR    R4                              ; 5581   0274
        SLR     R3,     2                       ; 5582   0067
        MVI     G_0350, R1                      ; 5583   0281 0350
        SWAP    R1,     1                       ; 5585   0041
        SUBI    #$0006, R1                      ; 5586   0339 0006
        ADDR    R3,     R1                      ; 5588   00D9
        MVI     G_012B, R2                      ; 5589   0282 012B
        TSTR    R2                              ; 558B   0092
        BEQ     L_558F                          ; 558C   0204 0001

        INCR    R1                              ; 558E   0009
L_558F:
        ANDI    #$007F, R1                      ; 558F   03B9 007F
        MVI     G_012F, R2                      ; 5591   0282 012F
        MVI     G_034F, R3                      ; 5593   0283 034F
        SWAP    R3,     1                       ; 5595   0043
        ADDR    R0,     R3                      ; 5596   00C3
        SUB     G_012E, R3                      ; 5597   0303 012E
        MVI     G_0128, R0                      ; 5599   0280 0128
        TSTR    R0                              ; 559B   0080
        BNEQ    L_559F                          ; 559C   020C 0001

        DECR    R3                              ; 559E   0013
L_559F:
        ANDI    #$00FF, R3                      ; 559F   03BB 00FF

        JSR     R4,     L_66D7                  ; 55A1   0004 0064 02D7

        ADDR    R0,     R3                      ; 55A4   00C3
        MVI     G_035E, R4                      ; 55A5   0284 035E
L_55A7:
        CMP@    R4,     R3                      ; 55A7   0363
        BNEQ    L_55A7                          ; 55A8   022C 0002

        SUB     G_035E, R4                      ; 55AA   0304 035E
        ADDI    #$0132, R4                      ; 55AC   02FC 0132
        MVII    #$0001, R3                      ; 55AE   02BB 0001
        MVO@    R3,     R4                      ; 55B0   0263
        PULR    R7                              ; 55B1   02B7

L_55B2:
        PSHR    R4                              ; 55B2   0274
        MVII    #$010D, R5                      ; 55B3   02BD 010D
        MVI@    R5,     R0                      ; 55B5   02A8
        ANDI    #$00F8, R0                      ; 55B6   03B8 00F8
        BEQ     L_55E3                          ; 55B8   0204 0029

        MVI     G_0105, R0                      ; 55BA   0280 0105
        CMPI    #$0006, R0                      ; 55BC   0378 0006
        BNEQ    L_55E3                          ; 55BE   020C 0023

        MVI     G_0118, R0                      ; 55C0   0280 0118
        ANDI    #$0040, R0                      ; 55C2   03B8 0040
        BNEQ    L_55E3                          ; 55C4   020C 001D

        MVII    #$00C1, R0                      ; 55C6   02B8 00C1
        MVO     R0,     G_0118                  ; 55C8   0240 0118
        MVII    #$0018, R0                      ; 55CA   02B8 0018
        MVO     R0,     G_0110                  ; 55CC   0240 0110
        SDBD                                    ; 55CE   0001
        MVII    #$620E, R0                      ; 55CF   02B8 000E 0062
        MVII    #$0353, R4                      ; 55D2   02BC 0353
        MVO@    R0,     R4                      ; 55D4   0260
        CLRR    R0                              ; 55D5   01C0
        MVO@    R0,     R4                      ; 55D6   0260
        MVO@    R0,     R4                      ; 55D7   0260
        MVO     R0,     G_01B5                  ; 55D8   0240 01B5
        MVO     R0,     G_012A                  ; 55DA   0240 012A
        NOP                                     ; 55DC   0034
        MVO     R0,     G_012D                  ; 55DD   0240 012D
        MVO     R0,     G_0129                  ; 55DF   0240 0129
        MVO     R0,     G_012C                  ; 55E1   0240 012C
L_55E3:
        MOVR    R5,     R1                      ; 55E3   00A9
        MVI@    R5,     R0                      ; 55E4   02A8
        SLR     R0,     2                       ; 55E5   0064
        SLR     R0,     1                       ; 55E6   0060
        BEQ     L_5653                          ; 55E7   0204 006A

        ADDI    #$0232, R1                      ; 55E9   02F9 0232
        MVI@    R1,     R2                      ; 55EB   028A
        SWAP    R2,     1                       ; 55EC   0042
        CMPI    #$0006, R2                      ; 55ED   037A 0006
        BNEQ    L_5653                          ; 55EF   020C 0062

        SUBI    #$022F, R1                      ; 55F1   0339 022F
        MVI@    R1,     R2                      ; 55F3   028A
        TSTR    R2                              ; 55F4   0092
        BEQ     L_5657                          ; 55F5   0204 0060

        ADDI    #$0008, R1                      ; 55F7   02F9 0008
        MVI@    R1,     R2                      ; 55F9   028A
        ANDI    #$00C0, R2                      ; 55FA   03BA 00C0
        CMPI    #$0080, R2                      ; 55FC   037A 0080
        BNEQ    L_5653                          ; 55FE   020C 0053

        MVII    #$0003, R2                      ; 5600   02BA 0003
L_5602:
        MOVR    R0,     R4                      ; 5602   0084
        ANDI    #$0001, R4                      ; 5603   03BC 0001
        BEQ     L_561C                          ; 5605   0204 0015

        MOVR    R2,     R3                      ; 5607   0093
        ADDI    #$0118, R3                      ; 5608   02FB 0118
        MVI@    R3,     R4                      ; 560A   029C
        ANDI    #$00C0, R4                      ; 560B   03BC 00C0
        CMPI    #$0080, R4                      ; 560D   037C 0080
        BNEQ    L_561C                          ; 560F   020C 000B

        ADDI    #$0008, R3                      ; 5611   02FB 0008
        MVI@    R3,     R4                      ; 5613   029C
        CMPI    #$0064, R4                      ; 5614   037C 0064
        BLT     L_561C                          ; 5616   0205 0004

        CMPI    #$0078, R4                      ; 5618   037C 0078
        BLE     L_5624                          ; 561A   0206 0008

L_561C:
        INCR    R2                              ; 561C   000A
        SLR     R0,     1                       ; 561D   0060
        CMPI    #$0007, R2                      ; 561E   037A 0007
        BLE     L_5602                          ; 5620   0226 001F
        B       L_5653                          ; 5622   0200 002F

L_5624:
        MVII    #$00C1, R2                      ; 5624   02BA 00C1
        MVO@    R2,     R1                      ; 5626   024A
        SUBI    #$0008, R1                      ; 5627   0339 0008
        MVII    #$0004, R2                      ; 5629   02BA 0004
        MVO@    R2,     R1                      ; 562B   024A
        SUBI    #$0008, R3                      ; 562C   033B 0008
        MVII    #$00C1, R2                      ; 562E   02BA 00C1
        MVO@    R2,     R3                      ; 5630   025A
        SUBI    #$0008, R3                      ; 5631   033B 0008
        MVII    #$0024, R2                      ; 5633   02BA 0024
        MVO@    R2,     R3                      ; 5635   025A
        CLRR    R2                              ; 5636   01D2
        ADDI    #$022F, R3                      ; 5637   02FB 022F
        MVO@    R2,     R3                      ; 5639   025A
        ADDI    #$0008, R3                      ; 563A   02FB 0008
        MVO@    R2,     R3                      ; 563C   025A
        SUBI    #$0008, R4                      ; 563D   033C 0008
        ADDI    #$00A2, R1                      ; 563F   02F9 00A2
        MVO@    R4,     R1                      ; 5641   024C
        PSHR    R5                              ; 5642   0275
        MOVR    R1,     R2                      ; 5643   008A

        JSR     R5,     L_6089                  ; 5644   0004 0160 0089

        PULR    R5                              ; 5647   02B5
        ADDI    #$018D, R1                      ; 5648   02F9 018D
        MVII    #$0080, R4                      ; 564A   02BC 0080
        MVO@    R4,     R1                      ; 564C   024C
        SDBD                                    ; 564D   0001
        MVII    #$61F5, R1                      ; 564E   02B9 00F5 0061
        MVO     R1,     G_0353                  ; 5651   0241 0353
L_5653:
        CMPI    #$010F, R5                      ; 5653   037D 010F
        BLE     L_55E3                          ; 5655   0226 0073
L_5657:
        PULR    R7                              ; 5657   02B7

L_5658:
        PSHR    R4                              ; 5658   0274
        MVI     G_0316, R1                      ; 5659   0281 0316
        MVI     G_0103, R4                      ; 565B   0284 0103
        CMPI    #$0006, R4                      ; 565D   037C 0006
        BNEQ    L_5666                          ; 565F   020C 0005

        MVI     G_0359, R0                      ; 5661   0280 0359
        ANDI    #$0001, R0                      ; 5663   03B8 0001
        XORR    R0,     R1                      ; 5665   01C1
L_5666:
        MVI@    R1,     R1                      ; 5666   0289
        CMP     G_0109, R1                      ; 5667   0341 0109
        BNEQ    L_56E3                          ; 5669   020C 0078

        CLRR    R2                              ; 566B   01D2
        CMPI    #$00FF, R1                      ; 566C   0379 00FF
        BEQ     L_567B                          ; 566E   0204 000B

        MVI     G_010A, R2                      ; 5670   0282 010A
        MVO     R1,     G_010A                  ; 5672   0241 010A
        CLRR    R4                              ; 5674   01E4
        MVO     R4,     G_0359                  ; 5675   0244 0359
        CMPI    #$005A, R1                      ; 5677   0379 005A
        BEQ     L_56BC                          ; 5679   0204 0041

L_567B:
        CMPI    #$005A, R2                      ; 567B   037A 005A
        BNEQ    L_5689                          ; 567D   020C 000A

        MVII    #$01BE, R4                      ; 567F   02BC 01BE
        MVII    #$01FB, R5                      ; 5681   02BD 01FB
        MVI@    R5,     R2                      ; 5683   02AA
        MVO@    R2,     R4                      ; 5684   0262
        MVI@    R5,     R2                      ; 5685   02AA
        MVO@    R2,     R4                      ; 5686   0262
        MVI@    R5,     R2                      ; 5687   02AA
        MVO@    R2,     R4                      ; 5688   0262
L_5689:
        MVI     G_0103, R4                      ; 5689   0284 0103
        CMPI    #$0006, R4                      ; 568B   037C 0006
        BEQ     L_56E4                          ; 568D   0204 0055

        CMPI    #$0007, R4                      ; 568F   037C 0007
        BNEQ    L_56E3                          ; 5691   020C 0050

        MVI     G_0118, R4                      ; 5693   0284 0118
        ANDI    #$00C0, R4                      ; 5695   03BC 00C0
        CMPI    #$0080, R4                      ; 5697   037C 0080
        BNEQ    L_56E3                          ; 5699   020C 0048

        SLR     R1,     2                       ; 569B   0065
        SLR     R1,     2                       ; 569C   0065
        SLR     R1,     1                       ; 569D   0061
        ADDR    R7,     R1                      ; 569E   00F9
        ADDI    #$005F, R1                      ; 569F   02F9 005F
        MVI@    R1,     R1                      ; 56A1   0289
        MVI     G_010B, R2                      ; 56A2   0282 010B
        MVO     R1,     G_010B                  ; 56A4   0241 010B
        CMPR    R1,     R2                      ; 56A6   014A
        BEQ     L_56CA                          ; 56A7   0204 0021

        CMPI    #$0001, R1                      ; 56A9   0379 0001
        BLT     L_56CA                          ; 56AB   0205 001D
        BNEQ    L_5748                          ; 56AD   020C 0099

        CLRR    R0                              ; 56AF   01C0
        MVII    #$0006, R2                      ; 56B0   02BA 0006
        SWAP    R2,     1                       ; 56B2   0042
        MVII    #$0014, R5                      ; 56B3   02BD 0014
        SDBD                                    ; 56B5   0001
        MVII    #$61CA, R1                      ; 56B6   02B9 00CA 0061
        B       L_5752                          ; 56B9   0200 0097

L_56BB:
        PSHR    R4                              ; 56BB   0274
L_56BC:
        MVII    #$01BE, R4                      ; 56BC   02BC 01BE
        MVII    #$01FB, R2                      ; 56BE   02BA 01FB
        CLRR    R3                              ; 56C0   01DB
L_56C1:
        MVI@    R2,     R5                      ; 56C1   0295
        MVO@    R3,     R2                      ; 56C2   0253
        MVO@    R5,     R4                      ; 56C3   0265
        INCR    R2                              ; 56C4   000A
        CMPI    #$01C0, R4                      ; 56C5   037C 01C0
        BLE     L_56C1                          ; 56C7   0226 0007
        PULR    R7                              ; 56C9   02B7

L_56CA:
        MVI     G_0109, R1                      ; 56CA   0281 0109
        ANDI    #$001F, R1                      ; 56CC   03B9 001F
        ADDR    R7,     R1                      ; 56CE   00F9
        ADDI    #$0037, R1                      ; 56CF   02F9 0037
        MVI@    R1,     R4                      ; 56D1   028C
        MVI     G_010C, R2                      ; 56D2   0282 010C
        MVO     R4,     G_010C                  ; 56D4   0244 010C
        CMPR    R4,     R2                      ; 56D6   0162
        BEQ     L_56E3                          ; 56D7   0204 000A

        ADDR    R4,     R4                      ; 56D9   00E4
        ADDR    R7,     R4                      ; 56DA   00FC
        ADDI    #$004B, R4                      ; 56DB   02FC 004B
        MVI@    R4,     R2                      ; 56DD   02A2
        MVO     R2,     G_012A                  ; 56DE   0242 012A
        MVI@    R4,     R2                      ; 56E0   02A2
        MVO     R2,     G_012D                  ; 56E1   0242 012D
L_56E3:
        PULR    R7                              ; 56E3   02B7

L_56E4:
        CMPI    #$00B7, R1                      ; 56E4   0379 00B7
        BNEQ    L_56F0                          ; 56E6   020C 0008

        MVI     G_0105, R2                      ; 56E8   0282 0105
L_56EA:
        MVI     G_0316, R1                      ; 56EA   0281 0316
        XORR    R0,     R1                      ; 56EC   01C1
        J       L_50F6                          ; 56ED   0004 0350 00F6

L_56F0:
        CLRR    R2                              ; 56F0   01D2
        SDBD                                    ; 56F1   0001
        MVII    #$51D2, R4                      ; 56F2   02BC 00D2 0051
L_56F5:
        INCR    R2                              ; 56F5   000A
        CMP@    R4,     R1                      ; 56F6   0361
        BEQ     L_56EA                          ; 56F7   0224 000E

        CMPI    #$0007, R2                      ; 56F9   037A 0007
        BNEQ    L_56F5                          ; 56FB   022C 0007
        PULR    R7                              ; 56FD   02B7

        DECLE   $0000,  $0002,  $0001,  $0000   ; 56FE   0000 0002 0001 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5702   0002 0000 0000 0000
        DECLE   $0010,  $0010,  $0010,  $000E   ; 5706   0010 0010 0010 000E
        DECLE   $0010,  $0010,  $000A,  $000D   ; 570A   0010 0010 000A 000D
        DECLE   $0010,  $0002,  $0010,  $0001   ; 570E   0010 0002 0010 0001
        DECLE   $0006,  $0005                   ; 5712   0006 0005

        INCR    R1                              ; 5714   0009
        DECR    R0                              ; 5715   0010
        DECR    R0                              ; 5716   0010
        DECR    R0                              ; 5717   0010
        DECR    R0                              ; 5718   0010
        INCR    R7                              ; 5719   000F

        DECR    R0                              ; 571A   0010
L_571B:
        DECR    R0                              ; 571B   0010
        DECLE   $000B,  $000C,  $0010,  $0003   ; 571C   000B 000C 0010 0003
        DECLE   $0010,  $0000,  $0007,  $0004   ; 5720   0010 0000 0007 0004
        DECLE   $0008,  $0010,  $0000,  $00FC   ; 5724   0008 0010 0000 00FC
        DECLE   $0000,  $00FD,  $0001,  $00FE   ; 5728   0000 00FD 0001 00FE
        DECLE   $0003,  $00FF,  $0004,  $0000   ; 572C   0003 00FF 0004 0000
        DECLE   $0003,  $0001,  $0001,  $0002   ; 5730   0003 0001 0001 0002
        DECLE   $0000,  $0003,  $0000,  $0004   ; 5734   0000 0003 0000 0004
        DECLE   $00FF,  $0003,  $00FF,  $0002   ; 5738   00FF 0003 00FF 0002
        DECLE   $00FE,  $0001,  $00FE,  $0000   ; 573C   00FE 0001 00FE 0000
        DECLE   $00FE,  $00FF,  $00FF,  $00FE   ; 5740   00FE 00FF 00FF 00FE
        DECLE   $00FF,  $00FD,  $0000,  $0000   ; 5744   00FF 00FD 0000 0000
L_5748:
        MVII    #$000D, R0                      ; 5748   02B8 000D
        MVII    #$0020, R2                      ; 574A   02BA 0020
        MVII    #$0024, R5                      ; 574C   02BD 0024
        SDBD                                    ; 574E   0001
        MVII    #$61D9, R1                      ; 574F   02B9 00D9 0061
L_5752:
        MOVR    R1,     R4                      ; 5752   008C
        MVII    #$0119, R1                      ; 5753   02B9 0119
        MVI@    R1,     R3                      ; 5755   028B
        ANDI    #$00C0, R3                      ; 5756   03BB 00C0
        BEQ     L_5764                          ; 5758   0204 000A

        INCR    R1                              ; 575A   0009
        MVI@    R1,     R3                      ; 575B   028B
        SWAP    R3,     2                       ; 575C   0047
        BPL     L_5764                          ; 575D   0203 0005

        DECR    R1                              ; 575F   0011
        MVI@    R1,     R3                      ; 5760   028B
        SWAP    R3,     2                       ; 5761   0047
        BMI     L_5799                          ; 5762   020B 0035

L_5764:
        MVO     R4,     G_0353                  ; 5764   0244 0353
        CLRR    R4                              ; 5766   01E4
        MVO     R4,     G_01B5                  ; 5767   0244 01B5
        MVII    #$0082, R3                      ; 5769   02BB 0082
        MVO@    R3,     R1                      ; 576B   024B
        MOVR    R1,     R3                      ; 576C   008B
        SUBI    #$0118, R3                      ; 576D   033B 0118
        MVII    #$0008, R4                      ; 576F   02BC 0008
        ADDR    R4,     R1                      ; 5771   00E1
        MVO@    R5,     R1                      ; 5772   024D
        SUBI    #$0010, R1                      ; 5773   0339 0010
        MVO@    R0,     R1                      ; 5775   0248
        ADDI    #$020F, R1                      ; 5776   02F9 020F
        MVI     G_031F, R0                      ; 5778   0280 031F
        MVO@    R0,     R1                      ; 577A   0248
        ADDR    R4,     R1                      ; 577B   00E1
        SDBD                                    ; 577C   0001
        MVII    #$0987, R0                      ; 577D   02B8 0087 0009
        SLL     R3,     2                       ; 5780   004F
        SLL     R3,     2                       ; 5781   004F
        ADDR    R3,     R0                      ; 5782   00D8
        MVO@    R0,     R1                      ; 5783   0248
        ADDR    R4,     R1                      ; 5784   00E1
        MVI     G_032F, R0                      ; 5785   0280 032F
        MVO@    R0,     R1                      ; 5787   0248
        ADDR    R4,     R1                      ; 5788   00E1
        MVI     G_0337, R0                      ; 5789   0280 0337
        MVO@    R0,     R1                      ; 578B   0248
        ADDR    R4,     R1                      ; 578C   00E1
        MVO@    R2,     R1                      ; 578D   024A
        ADDR    R4,     R1                      ; 578E   00E1
        CLRR    R0                              ; 578F   01C0
        MVO@    R0,     R1                      ; 5790   0248
        SUBI    #$0030, R1                      ; 5791   0339 0030
        MVI     G_0317, R4                      ; 5793   0284 0317
        MVO@    R4,     R1                      ; 5795   024C
        SUBI    #$0165, R1                      ; 5796   0339 0165
        MVO@    R0,     R1                      ; 5798   0248
L_5799:
        B       L_56CA                          ; 5799   0220 00D0

L_579B:
        PSHR    R4                              ; 579B   0274
        MVI     G_0129, R1                      ; 579C   0281 0129
        ADD     G_012A, R1                      ; 579E   02C1 012A
        ANDI    #$00FF, R1                      ; 57A0   03B9 00FF
        CMPI    #$0002, R1                      ; 57A2   0379 0002
        BLE     L_57AA                          ; 57A4   0206 0004

        CMPI    #$0060, R1                      ; 57A6   0379 0060
        BLT     L_57AC                          ; 57A8   0205 0002

L_57AA:
        MVII    #$0002, R1                      ; 57AA   02B9 0002
L_57AC:
        CMPI    #$0041, R1                      ; 57AC   0379 0041
        BLE     L_57B2                          ; 57AE   0206 0002

        MVII    #$0041, R1                      ; 57B0   02B9 0041
L_57B2:
        CMPI    #$0007, R1                      ; 57B2   0379 0007
        BLE     L_57B7                          ; 57B4   0206 0001

        DECR    R1                              ; 57B6   0011
L_57B7:
        MVO     R1,     G_0129                  ; 57B7   0241 0129
        SLL     R1,     1                       ; 57B9   0049
        ADD     G_034F, R1                      ; 57BA   02C1 034F
        MVO     R1,     G_034F                  ; 57BC   0241 034F
        MVI     G_012E, R2                      ; 57BE   0282 012E
        ADD     G_012F, R2                      ; 57C0   02C2 012F
        ADDI    #$0003, R2                      ; 57C2   02FA 0003
        SWAP    R2,     1                       ; 57C4   0042
        CMPR    R2,     R1                      ; 57C5   0151
        BLT     L_57E1                          ; 57C6   0205 0019

        CLRR    R1                              ; 57C8   01C9
        MVO     R1,     G_0103                  ; 57C9   0241 0103
        COMR    R1                              ; 57CB   0019
        MVO     R1,     G_0102                  ; 57CC   0241 0102
        MVII    #$0010, R1                      ; 57CE   02B9 0010
        MVO     R1,     G_035A                  ; 57D0   0241 035A
L_57D2:
        MVI     G_0102, R1                      ; 57D2   0281 0102
        TSTR    R1                              ; 57D4   0089
        BNEQ    L_57D2                          ; 57D5   022C 0004

        JSR     R4,     L_5AB2                  ; 57D7   0004 0058 02B2

L_57DA:
        CLRR    R3                              ; 57DA   01DB
        MVII    #$0002, R1                      ; 57DB   02B9 0002

        JSR     R4,     L_604D                  ; 57DD   0004 0060 004D

        PULR    R7                              ; 57E0   02B7

L_57E1:
        MVI     G_012C, R1                      ; 57E1   0281 012C
        ADD     G_012D, R1                      ; 57E3   02C1 012D
        ANDI    #$00FF, R1                      ; 57E5   03B9 00FF
        BEQ     L_580D                          ; 57E7   0204 0024

        CMPI    #$00D0, R1                      ; 57E9   0379 00D0
        BLT     L_57F2                          ; 57EB   0205 0005

        INCR    R1                              ; 57ED   0009
        ANDI    #$00FF, R1                      ; 57EE   03B9 00FF
        B       L_57F8                          ; 57F0   0200 0006

L_57F2:
        CMPI    #$0080, R1                      ; 57F2   0379 0080
        BLT     L_5804                          ; 57F4   0205 000E

        MVII    #$00D0, R1                      ; 57F6   02B9 00D0
L_57F8:
        MVO     R1,     G_012C                  ; 57F8   0241 012C
        NEGR    R1                              ; 57FA   0021
        ANDI    #$00FF, R1                      ; 57FB   03B9 00FF
        SLL     R1,     1                       ; 57FD   0049
        SUB     G_0350, R1                      ; 57FE   0301 0350
        NEGR    R1                              ; 5800   0021
        MVO     R1,     G_0350                  ; 5801   0241 0350
        PULR    R7                              ; 5803   02B7

L_5804:
        CMPI    #$0030, R1                      ; 5804   0379 0030
        BGT     L_580B                          ; 5806   020E 0003

        DECR    R1                              ; 5808   0011
        B       L_580D                          ; 5809   0200 0002

L_580B:
        MVII    #$0030, R1                      ; 580B   02B9 0030
L_580D:
        MVO     R1,     G_012C                  ; 580D   0241 012C
        SLL     R1,     1                       ; 580F   0049
        ADD     G_0350, R1                      ; 5810   02C1 0350
        MVO     R1,     G_0350                  ; 5812   0241 0350
        PULR    R7                              ; 5814   02B7

L_5815:
        MVI@    R3,     R2                      ; 5815   029A
        SLR     R2,     2                       ; 5816   0066
        ANDR    R0,     R2                      ; 5817   0182
        CMPR    R1,     R2                      ; 5818   014A
        BNEQ    L_581F                          ; 5819   020C 0004

        MVI@    R3,     R2                      ; 581B   029A
        XORI    #$0188, R2                      ; 581C   03FA 0188
        MVO@    R2,     R3                      ; 581E   025A
L_581F:
        INCR    R3                              ; 581F   000B
        DECR    R5                              ; 5820   0015
        BNEQ    L_5815                          ; 5821   022C 000D
        MOVR    R4,     R7                      ; 5823   00A7

L_5824:
        PSHR    R4                              ; 5824   0274
        MVI     G_0104, R3                      ; 5825   0283 0104
        ANDI    #$0007, R3                      ; 5827   03BB 0007
        SLL     R3,     1                       ; 5829   004B
        MOVR    R3,     R2                      ; 582A   009A
        SLL     R3,     2                       ; 582B   004F
        SLL     R3,     2                       ; 582C   004F
        SUBR    R2,     R3                      ; 582D   0113
        ADDI    #$0200, R3                      ; 582E   02FB 0200
        MVII    #$001E, R5                      ; 5830   02BD 001E
        MVII    #$0226, R1                      ; 5832   02B9 0226
        MVII    #$027E, R0                      ; 5834   02B8 027E

        JSR     R4,     L_5815                  ; 5836   0004 0058 0015

        MVI     G_0104, R3                      ; 5839   0283 0104
        ANDI    #$003E, R3                      ; 583B   03BB 003E
        MOVR    R3,     R2                      ; 583D   009A
        SLL     R3,     2                       ; 583E   004F
        SLR     R2,     1                       ; 583F   0062
        SUBR    R2,     R3                      ; 5840   0113
        ADDI    #$0208, R3                      ; 5841   02FB 0208
        MVII    #$0007, R5                      ; 5843   02BD 0007
        MVII    #$022A, R1                      ; 5845   02B9 022A

        JSR     R4,     L_5815                  ; 5847   0004 0058 0015

        MVI     G_0118, R0                      ; 584A   0280 0118
        ANDI    #$0040, R0                      ; 584C   03B8 0040
        BNEQ    L_58F1                          ; 584E   020C 00A1

        MVI     G_0105, R1                      ; 5850   0281 0105
        SUBI    #$0004, R1                      ; 5852   0339 0004
        NEGR    R1                              ; 5854   0021
        ADDI    #$0007, R1                      ; 5855   02F9 0007
        CMPI    #$000A, R1                      ; 5857   0379 000A
        BLT     L_585C                          ; 5859   0205 0001

        DECR    R1                              ; 585B   0011
L_585C:
        MVII    #$0004, R4                      ; 585C   02BC 0004
        MVII    #$013B, R5                      ; 585E   02BD 013B
        MVI     G_0132, R0                      ; 5860   0280 0132
        TSTR    R0                              ; 5862   0080
        BEQ     L_5867                          ; 5863   0204 0002

        MVII    #$0006, R4                      ; 5865   02BC 0006
L_5867:
        MVI@    R5,     R0                      ; 5867   02A8
        TSTR    R0                              ; 5868   0080
        BEQ     L_586F                          ; 5869   0204 0004

        DECR    R4                              ; 586B   0014
        BNEQ    L_5867                          ; 586C   022C 0006

        INCR    R1                              ; 586E   0009
L_586F:
        CMPI    #$0005, R1                      ; 586F   0379 0005
        BGE     L_5875                          ; 5871   020D 0002

        MVII    #$0005, R1                      ; 5873   02B9 0005

L_5875:
        JSR     R4,     L_66F3                  ; 5875   0004 0064 02F3

        MVI     G_0107, R1                      ; 5878   0281 0107
        CMPI    #$000E, R1                      ; 587A   0379 000E
        BLE     L_5880                          ; 587C   0206 0002

        MVII    #$000E, R1                      ; 587E   02B9 000E
L_5880:
        SLL     R1,     1                       ; 5880   0049
        ADDI    #$0003, R1                      ; 5881   02F9 0003
        CMPR    R0,     R1                      ; 5883   0141
        BLE     L_58F1                          ; 5884   0206 006B

        JSR     R4,     L_59EF                  ; 5886   0004 0058 01EF

        MOVR    R0,     R1                      ; 5889   0081
        INCR    R1                              ; 588A   0009
        ADDR    R7,     R1                      ; 588B   00F9
        ADD@    R1,     R7                      ; 588C   02CF

        DECLE   $001F,  $001F                   ; 588D   001F 001F

        MOVR    R4,     R7                      ; 588F   00A7
        SUBR    R2,     R7                      ; 5890   0117

        DECLE   $001F,  $006F,  $001F,  $001F   ; 5891   001F 006F 001F 001F
        DECLE   $006F,  $00AD,  $00AD,  $012D   ; 5895   006F 00AD 00AD 012D
        DECLE   $001F,  $001F                   ; 5899   001F 001F

        TSTR    R5                              ; 589B   00AD
        SUBR    R2,     R1                      ; 589C   0111
        SAR     R3,     2                       ; 589D   006F
        MOVR    R4,     R7                      ; 589E   00A7

        DECLE   $001F,  $011D,  $00AD,  $001F   ; 589F   001F 011D 00AD 001F
        DECLE   $006F,  $001F                   ; 58A3   006F 001F

        SUBR    R6,     R3                      ; 58A5   0133
        SUBR    R2,     R7                      ; 58A6   0117

        DECLE   $001F,  $006F,  $00AD,  $006F   ; 58A7   001F 006F 00AD 006F
        DECLE   $001F                           ; 58AB   001F

        SARC    R0,     2                       ; 58AC   007C
        BNOV    L_58C1                          ; 58AD   020A 0012
        BC      L_58B9                          ; 58AF   0201 0008

        MVII    #$0003, R3                      ; 58B1   02BB 0003
        MVII    #$025C, R0                      ; 58B3   02B8 025C
        MVII    #$025E, R1                      ; 58B5   02B9 025E
        B       L_58C5                          ; 58B7   0200 000C

L_58B9:
        MVII    #$0001, R3                      ; 58B9   02BB 0001
        MVII    #$0254, R0                      ; 58BB   02B8 0254
        MVII    #$0256, R1                      ; 58BD   02B9 0256
        B       L_58C5                          ; 58BF   0200 0004

L_58C1:
        MVII    #$0244, R0                      ; 58C1   02B8 0244
        MOVR    R0,     R1                      ; 58C3   0081
        CLRR    R3                              ; 58C4   01DB

L_58C5:
        JSR     R4,     L_59C9                  ; 58C5   0004 0058 01C9

        BNC     L_59B9                          ; 58C8   0209 00EF

        ADDR    R4,     R3                      ; 58CA   00E3
        MOVR    R3,     R1                      ; 58CB   0099
        PSHR    R1                              ; 58CC   0271

        JSR     R4,     L_59FD                  ; 58CD   0004 0058 01FD

        PULR    R4                              ; 58D0   02B4
        ADDR    R4,     R4                      ; 58D1   00E4
        BNEQ    L_58DA                          ; 58D2   020C 0006

        DECR    R5                              ; 58D4   0015
        MVI@    R5,     R2                      ; 58D5   02AA
        SUBI    #$0078, R2                      ; 58D6   033A 0078
        DECR    R5                              ; 58D8   0015
        MVO@    R2,     R5                      ; 58D9   026A
L_58DA:
        ADDR    R7,     R4                      ; 58DA   00FC
        ADDI    #$0017, R4                      ; 58DB   02FC 0017
        ADDI    #$0028, R3                      ; 58DD   02FB 0028
        MVI@    R4,     R0                      ; 58DF   02A0
        SLL     R0,     2                       ; 58E0   004C
        SLL     R0,     2                       ; 58E1   004C
        SLL     R0,     2                       ; 58E2   004C
        MVO@    R0,     R3                      ; 58E3   0258
        ADDI    #$0008, R3                      ; 58E4   02FB 0008
        MVI@    R4,     R0                      ; 58E6   02A0
        SLL     R0,     2                       ; 58E7   004C
        SLL     R0,     2                       ; 58E8   004C
        SLL     R0,     2                       ; 58E9   004C
        MVO@    R0,     R3                      ; 58EA   0258
        SDBD                                    ; 58EB   0001
        MVII    #$621E, R4                      ; 58EC   02BC 001E 0062
        MVO     R4,     G_0354                  ; 58EF   0244 0354
L_58F1:
        PULR    R7                              ; 58F1   02B7

        DECLE   $03EC,  $0000                   ; 58F2   03EC 0000

        XOR@    R6,     R0                      ; 58F4   03F0
        INCR    R0                              ; 58F5   0008
        XOR@    R6,     R2                      ; 58F6   03F2
        INCR    R6                              ; 58F7   000E
        XOR@    R6,     R0                      ; 58F8   03F0
        XORI    #$03F2, R0                      ; 58F9   03F8 03F2
        XOR@    R6,     R2                      ; 58FB   03F2
        MVII    #$0248, R0                      ; 58FC   02B8 0248
        MOVR    R0,     R1                      ; 58FE   0081

        JSR     R4,     L_59C9                  ; 58FF   0004 0058 01C9

        BNC     L_59B9                          ; 5902   0209 00B5

        MVII    #$0005, R3                      ; 5904   02BB 0005
        ADDI    #$0013, R5                      ; 5906   02FD 0013
        MVI@    R5,     R0                      ; 5908   02A8
        SLR     R0,     2                       ; 5909   0064
        ANDI    #$027E, R0                      ; 590A   03B8 027E
        CMPR    R0,     R1                      ; 590C   0141
        BNEQ    L_5910                          ; 590D   020C 0001

        INCR    R3                              ; 590F   000B
L_5910:
        SUBI    #$0014, R5                      ; 5910   033D 0014
        MOVR    R3,     R1                      ; 5912   0099
        MOVR    R5,     R3                      ; 5913   00AB
        DECR    R3                              ; 5914   0013
        MVI@    R3,     R4                      ; 5915   029C
        XORI    #$0188, R4                      ; 5916   03FC 0188
        MVO@    R4,     R3                      ; 5918   025C
        CMPI    #$0006, R1                      ; 5919   0379 0006
        BNEQ    L_5923                          ; 591B   020C 0006

        ADDI    #$0014, R3                      ; 591D   02FB 0014
        MVI@    R3,     R4                      ; 591F   029C
        XORI    #$0188, R4                      ; 5920   03FC 0188
        MVO@    R4,     R3                      ; 5922   025C

L_5923:
        JSR     R4,     L_59FD                  ; 5923   0004 0058 01FD

        ADDI    #$0028, R3                      ; 5926   02FB 0028
        SDBD                                    ; 5928   0001
        MVII    #$F880, R0                      ; 5929   02B8 0080 00F8
        MVO@    R0,     R3                      ; 592C   0258
        SDBD                                    ; 592D   0001
        MVII    #$6232, R4                      ; 592E   02BC 0032 0062
        MVO     R4,     G_0354                  ; 5931   0244 0354
        PULR    R7                              ; 5933   02B7

        MVII    #$0224, R0                      ; 5934   02B8 0224
        MVII    #$0007, R1                      ; 5936   02B9 0007
        B       L_59AE                          ; 5938   0200 0074

        SARC    R0,     2                       ; 593A   007C
        BOV     L_5942                          ; 593B   0202 0005

        MVII    #$0244, R0                      ; 593D   02B8 0244
        MOVR    R0,     R1                      ; 593F   0081
        B       L_594E                          ; 5940   0200 000C
L_5942:
        BC      L_594A                          ; 5942   0201 0006

        MVII    #$0254, R0                      ; 5944   02B8 0254
        MVII    #$025C, R1                      ; 5946   02B9 025C
        B       L_594E                          ; 5948   0200 0004

L_594A:
        MVII    #$0256, R1                      ; 594A   02B9 0256
        MVII    #$025E, R0                      ; 594C   02B8 025E

L_594E:
        JSR     R4,     L_59C9                  ; 594E   0004 0058 01C9

        BNC     L_59B9                          ; 5951   0209 0066

        MOVR    R5,     R1                      ; 5953   00A9
        SUBI    #$0201, R1                      ; 5954   0339 0201
        MVII    #$0014, R2                      ; 5956   02BA 0014

        JSR     R4,     L_66E2                  ; 5958   0004 0064 02E2

        INCR    R1                              ; 595B   0009
L_595C:
        SLL     R1,     2                       ; 595C   004D
        SLL     R1,     1                       ; 595D   0049
        SWAP    R1,     1                       ; 595E   0041
        SUB     G_032F, R1                      ; 595F   0301 032F
        BMI     L_59B9                          ; 5961   020B 0056

        INCR    R0                              ; 5963   0008
        SLL     R0,     2                       ; 5964   004C
        SLL     R0,     1                       ; 5965   0048
        SWAP    R0,     1                       ; 5966   0040
        SUB     G_0337, R0                      ; 5967   0300 0337
        PSHR    R0                              ; 5969   0270
        BPL     L_596D                          ; 596A   0203 0001

        NEGR    R0                              ; 596C   0020
L_596D:
        MOVR    R0,     R2                      ; 596D   0082
        MVII    #$0005, R0                      ; 596E   02B8 0005
        SLR     R2,     2                       ; 5970   0066
        BEQ     L_5977                          ; 5971   0204 0004

        SLR     R1,     2                       ; 5973   0065

        JSR     R4,     L_66E2                  ; 5974   0004 0064 02E2

L_5977:
        PULR    R2                              ; 5977   02B2
        MVII    #$0244, R3                      ; 5978   02BB 0244
        CMPI    #$0005, R0                      ; 597A   0378 0005
        BGE     L_5993                          ; 597C   020D 0015

        TSTR    R2                              ; 597E   0092
        BMI     L_598B                          ; 597F   020B 000A

        MVII    #$025C, R3                      ; 5981   02BB 025C
        CMPI    #$0002, R0                      ; 5983   0378 0002
        BGE     L_5993                          ; 5985   020D 000C

        MVII    #$025E, R3                      ; 5987   02BB 025E
        B       L_5993                          ; 5989   0200 0008

L_598B:
        MVII    #$0254, R3                      ; 598B   02BB 0254
        CMPI    #$0002, R0                      ; 598D   0378 0002
        BGE     L_5993                          ; 598F   020D 0002

        MVII    #$0256, R3                      ; 5991   02BB 0256
L_5993:
        DECR    R5                              ; 5993   0015
        MVI@    R5,     R0                      ; 5994   02A8
        SDBD                                    ; 5995   0001
        ANDI    #$3607, R0                      ; 5996   03B8 0007 0036
        SLL     R3,     2                       ; 5999   004F
        XORR    R3,     R0                      ; 599A   01D8
        DECR    R5                              ; 599B   0015
        MVO@    R0,     R5                      ; 599C   0268
        PULR    R7                              ; 599D   02B7

        MVII    #$0244, R0                      ; 599E   02B8 0244
        MVII    #$0008, R1                      ; 59A0   02B9 0008
        B       L_59AE                          ; 59A2   0200 000A

        MVII    #$024C, R0                      ; 59A4   02B8 024C
        MVII    #$0009, R1                      ; 59A6   02B9 0009
        B       L_59AE                          ; 59A8   0200 0004

        MVII    #$0248, R0                      ; 59AA   02B8 0248
        MVII    #$000A, R1                      ; 59AC   02B9 000A
L_59AE:
        PSHR    R1                              ; 59AE   0271
        MOVR    R0,     R1                      ; 59AF   0081

L_59B0:
        JSR     R4,     L_59C9                  ; 59B0   0004 0058 01C9

        PULR    R1                              ; 59B3   02B1
        BNC     L_59B9                          ; 59B4   0209 0003

        JSR     R4,     L_59FD                  ; 59B6   0004 0058 01FD

L_59B9:
        PULR    R7                              ; 59B9   02B7

        MVII    #$0228, R0                      ; 59BA   02B8 0228
        MVII    #$000C, R1                      ; 59BC   02B9 000C
        B       L_59AE                          ; 59BE   0220 0011

        MVII    #$0224, R0                      ; 59C0   02B8 0224
        MVII    #$000B, R1                      ; 59C2   02B9 000B
        PSHR    R1                              ; 59C4   0271
        MVII    #$0228, R1                      ; 59C5   02B9 0228
        B       L_59B0                          ; 59C7   0220 0018

L_59C9:
        PSHR    R4                              ; 59C9   0274
        PSHR    R3                              ; 59CA   0273
        PSHR    R0                              ; 59CB   0270
        PSHR    R1                              ; 59CC   0271
        MVII    #$0007, R1                      ; 59CD   02B9 0007
        PSHR    R2                              ; 59CF   0272

        JSR     R4,     L_66F3                  ; 59D0   0004 0064 02F3

        MOVR    R0,     R5                      ; 59D3   0085
        ADDI    #$0228, R5                      ; 59D4   02FD 0228
        PULR    R2                              ; 59D6   02B2
        PULR    R1                              ; 59D7   02B1
        PULR    R0                              ; 59D8   02B0
        CLRR    R4                              ; 59D9   01E4
L_59DA:
        MVI@    R5,     R3                      ; 59DA   02AB
        SLR     R3,     2                       ; 59DB   0067
        ANDI    #$027E, R3                      ; 59DC   03BB 027E
        CMPR    R0,     R3                      ; 59DE   0143
        BEQ     L_59E9                          ; 59DF   0204 0008

        CMPR    R1,     R3                      ; 59E1   014B
        BEQ     L_59EB                          ; 59E2   0204 0007

        CMPI    #$02C8, R5                      ; 59E4   037D 02C8
        BLT     L_59DA                          ; 59E6   0225 000D

        CLRC                                    ; 59E8   0006
L_59E9:
        PULR    R3                              ; 59E9   02B3
        PULR    R7                              ; 59EA   02B7

L_59EB:
        INCR    R4                              ; 59EB   000C
        SETC                                    ; 59EC   0007
        PULR    R3                              ; 59ED   02B3
        PULR    R7                              ; 59EE   02B7

L_59EF:
        MVII    #$011B, R2                      ; 59EF   02BA 011B
L_59F1:
        MVI@    R2,     R5                      ; 59F1   0295
        ANDI    #$0080, R5                      ; 59F2   03BD 0080
        BEQ     L_59FC                          ; 59F4   0204 0006

        INCR    R2                              ; 59F6   000A
        CMPI    #$011F, R2                      ; 59F7   037A 011F
        BLE     L_59F1                          ; 59F9   0226 0009

        PULR    R4                              ; 59FB   02B4
L_59FC:
        MOVR    R4,     R7                      ; 59FC   00A7

L_59FD:
        PSHR    R4                              ; 59FD   0274
        SLL     R1,     2                       ; 59FE   004D
        ADDR    R7,     R1                      ; 59FF   00F9
        ADDI    #$007E, R1                      ; 5A00   02F9 007E
        MVI@    R1,     R0                      ; 5A02   0288
        MVII    #$0080, R4                      ; 5A03   02BC 0080
        CMPI    #$0060, R0                      ; 5A05   0378 0060
        BLE     L_5A19                          ; 5A07   0206 0010

        CMPI    #$007C, R0                      ; 5A09   0378 007C
        BGE     L_5A19                          ; 5A0B   020D 000C

        XORI    #$0024, R4                      ; 5A0D   03FC 0024
        CMPI    #$006C, R0                      ; 5A0F   0378 006C
        BEQ     L_5A17                          ; 5A11   0204 0004

        CMPI    #$0070, R0                      ; 5A13   0378 0070
        BNEQ    L_5A19                          ; 5A15   020C 0002

L_5A17:
        XORI    #$0005, R4                      ; 5A17   03FC 0005
L_5A19:
        MVO@    R4,     R2                      ; 5A19   0254
        ADDI    #$0008, R2                      ; 5A1A   02FA 0008
        MVI     G_01BD, R4                      ; 5A1C   0284 01BD
        TSTR    R4                              ; 5A1E   00A4
        BEQ     L_5A27                          ; 5A1F   0204 0006

        CMPI    #$0054, R0                      ; 5A21   0378 0054
        BNEQ    L_5A27                          ; 5A23   020C 0002

        MVII    #$0004, R0                      ; 5A25   02B8 0004
L_5A27:
        MVO@    R0,     R2                      ; 5A27   0250
        INCR    R1                              ; 5A28   0009
        PSHR    R2                              ; 5A29   0272
        PSHR    R1                              ; 5A2A   0271
        MOVR    R5,     R1                      ; 5A2B   00A9
        SUBI    #$0201, R1                      ; 5A2C   0339 0201
        MVII    #$0014, R2                      ; 5A2E   02BA 0014

        JSR     R4,     L_66E2                  ; 5A30   0004 0064 02E2

        SLL     R1,     2                       ; 5A33   004D
        SLL     R1,     1                       ; 5A34   0049
        PULR    R4                              ; 5A35   02B4
        ADD@    R4,     R1                      ; 5A36   02E1
        ANDI    #$00FF, R1                      ; 5A37   03B9 00FF
        SLL     R0,     2                       ; 5A39   004C
        SLL     R0,     1                       ; 5A3A   0048
        ADD@    R4,     R0                      ; 5A3B   02E0
        ANDI    #$007F, R0                      ; 5A3C   03B8 007F
        MVI@    R4,     R2                      ; 5A3E   02A2
        MOVR    R2,     R4                      ; 5A3F   0094
        ANDI    #$0007, R4                      ; 5A40   03BC 0007
        XORR    R4,     R2                      ; 5A42   01E2
        SLL     R2,     2                       ; 5A43   004E
        SLL     R2,     2                       ; 5A44   004E
        XORR    R4,     R2                      ; 5A45   01E2
        MOVR    R2,     R4                      ; 5A46   0094
        SDBD                                    ; 5A47   0001
        ANDI    #$0400, R2                      ; 5A48   03BA 0000 0004
        XORR    R2,     R4                      ; 5A4B   01D4
        XORR    R2,     R1                      ; 5A4C   01D1
        XORI    #$0300, R1                      ; 5A4D   03F9 0300
        PULR    R3                              ; 5A4F   02B3
        PSHR    R1                              ; 5A50   0271
        ANDI    #$00FF, R1                      ; 5A51   03B9 00FF
        SWAP    R1,     1                       ; 5A53   0041
        ADDI    #$020F, R3                      ; 5A54   02FB 020F
        MVO@    R1,     R3                      ; 5A56   0259
        CLRR    R1                              ; 5A57   01C9
        ADDI    #$0010, R3                      ; 5A58   02FB 0010
        MVO@    R1,     R3                      ; 5A5A   0259
        MOVR    R4,     R2                      ; 5A5B   00A2
        SDBD                                    ; 5A5C   0001
        ANDI    #$0B80, R2                      ; 5A5D   03BA 0080 000B
        XORR    R2,     R4                      ; 5A60   01D4
        XORR    R2,     R0                      ; 5A61   01D0
        SUBI    #$0020, R3                      ; 5A62   033B 0020
        MVO@    R0,     R3                      ; 5A64   0258
        ANDI    #$007F, R0                      ; 5A65   03B8 007F
        SWAP    R0,     1                       ; 5A67   0040
        ADDI    #$0018, R3                      ; 5A68   02FB 0018
        MVO@    R0,     R3                      ; 5A6A   0258
        ADDI    #$0010, R3                      ; 5A6B   02FB 0010
        MVO@    R1,     R3                      ; 5A6D   0259
        SUBI    #$0020, R3                      ; 5A6E   033B 0020
        MOVR    R3,     R0                      ; 5A70   0098
        SUBI    #$0327, R0                      ; 5A71   0338 0327
        ADDI    #$0098, R0                      ; 5A73   02F8 0098
        SLL     R0,     2                       ; 5A75   004C
        SLL     R0,     2                       ; 5A76   004C
        XORR    R4,     R0                      ; 5A77   01E0
        MVO@    R0,     R3                      ; 5A78   0258
        PULR    R1                              ; 5A79   02B1
        SUBI    #$0010, R3                      ; 5A7A   033B 0010
        MVO@    R1,     R3                      ; 5A7C   0259
        PULR    R7                              ; 5A7D   02B7

        DECLE   $0054,  $0002,  $000A,  $0104   ; 5A7E   0054 0002 000A 0104
        DECLE   $0058,  $0002,  $000C,  $010C   ; 5A82   0058 0002 000C 010C
        DECLE   $0060,  $0003,  $000E,  $0114   ; 5A86   0060 0003 000E 0114
        DECLE   $0058,  $0002,  $0004,  $018C   ; 5A8A   0058 0002 0004 018C
        DECLE   $0060,  $0003,  $0002,  $0194   ; 5A8E   0060 0003 0002 0194
        DECLE   $0020,  $00FA,  $0005,  $0164   ; 5A92   0020 00FA 0005 0164
        DECLE   $007C,  $00FA,  $0009,  $0164   ; 5A96   007C 00FA 0009 0164
        DECLE   $0064,  $0008,  $000A,  $0104   ; 5A9A   0064 0008 000A 0104
        DECLE   $0070,  $0002,  $000A,  $0007   ; 5A9E   0070 0002 000A 0007
        DECLE   $0074,  $000A,  $000C,  $0104   ; 5AA2   0074 000A 000C 0104
        DECLE   $006C,  $0005                   ; 5AA6   006C 0005

        INCR    R1                              ; 5AA8   0009
        SETC                                    ; 5AA9   0007
        SARC    R0,     1                       ; 5AAA   0078
        INCR    R0                              ; 5AAB   0008
        INCR    R2                              ; 5AAC   000A
        SUBR    R0,     R4                      ; 5AAD   0104
        SAR     R0,     1                       ; 5AAE   0068
        INCR    R0                              ; 5AAF   0008
        INCR    R2                              ; 5AB0   000A
        SUBR    R0,     R4                      ; 5AB1   0104
L_5AB2:
        PSHR    R4                              ; 5AB2   0274
L_5AB3:
        MVII    #$0200, R5                      ; 5AB3   02BD 0200
        MVII    #$000B, R0                      ; 5AB5   02B8 000B
L_5AB7:
        MVII    #$0005, R1                      ; 5AB7   02B9 0005
        MVII    #$001B, R2                      ; 5AB9   02BA 001B
        SWAP    R2,     1                       ; 5ABB   0042
L_5ABC:
        MVO@    R2,     R5                      ; 5ABC   026A
        DECR    R1                              ; 5ABD   0011
        BPL     L_5ABC                          ; 5ABE   0223 0003

        MVII    #$000D, R1                      ; 5AC0   02B9 000D
        MVII    #$0100, R2                      ; 5AC2   02BA 0100
L_5AC4:
        MVO@    R2,     R5                      ; 5AC4   026A
        DECR    R1                              ; 5AC5   0011
        BPL     L_5AC4                          ; 5AC6   0223 0003

        DECR    R0                              ; 5AC8   0010
        BPL     L_5AB7                          ; 5AC9   0223 0013

        SDBD                                    ; 5ACB   0001
        MVII    #$5B6B, R4                      ; 5ACC   02BC 006B 005B
        MVI@    R4,     R0                      ; 5ACF   02A0
        INCR    R7                              ; 5AD0   000F

L_5AD1:
        PSHR    R5                              ; 5AD1   0275
L_5AD2:
        MVI@    R4,     R1                      ; 5AD2   02A1
        MOVR    R1,     R5                      ; 5AD3   008D
        ANDI    #$00FF, R5                      ; 5AD4   03BD 00FF
        XORR    R5,     R1                      ; 5AD6   01E9
        ADDI    #$0200, R5                      ; 5AD7   02FD 0200
        XORI    #$0080, R1                      ; 5AD9   03F9 0080
        SLL     R1,     2                       ; 5ADB   004D
        SLL     R1,     2                       ; 5ADC   004D
        XOR@    R4,     R1                      ; 5ADD   03E1
        MVO@    R1,     R5                      ; 5ADE   0269
        DECR    R0                              ; 5ADF   0010
        BNEQ    L_5AD2                          ; 5AE0   022C 000F

        MVI     G_0106, R0                      ; 5AE2   0280 0106
        DECR    R0                              ; 5AE4   0010
        BLE     L_5B02                          ; 5AE5   0206 001B

        MVII    #$0280, R3                      ; 5AE7   02BB 0280
L_5AE9:
        MOVR    R0,     R2                      ; 5AE9   0082
        CMPI    #$0004, R2                      ; 5AEA   037A 0004
        BLE     L_5AF0                          ; 5AEC   0206 0002

        MVII    #$0004, R2                      ; 5AEE   02BA 0004
L_5AF0:
        SUBR    R2,     R0                      ; 5AF0   0110
        DECR    R2                              ; 5AF1   0012
        SLL     R2,     2                       ; 5AF2   004E
        SLL     R2,     1                       ; 5AF3   004A
        SDBD                                    ; 5AF4   0001
        ADDI    #$0891, R2                      ; 5AF5   02FA 0091 0008
        MVO@    R2,     R3                      ; 5AF8   025A
        ADDI    #$0014, R3                      ; 5AF9   02FB 0014
        CMPI    #$02F0, R3                      ; 5AFB   037B 02F0
        BGE     L_5B02                          ; 5AFD   020D 0003

        TSTR    R0                              ; 5AFF   0080
        BNEQ    L_5AE9                          ; 5B00   022C 0018

L_5B02:
        JSR     R4,     L_5B4F                  ; 5B02   0004 0058 034F

        MVI     G_0107, R1                      ; 5B05   0281 0107
        MVII    #$0236, R5                      ; 5B07   02BD 0236

        JSR     R4,     L_6018                  ; 5B09   0004 0060 0018

        MVII    #$0001, R3                      ; 5B0C   02BB 0001
        MVII    #$0003, R1                      ; 5B0E   02B9 0003

        JSR     R4,     L_604D                  ; 5B10   0004 0060 004D

        MVII    #$0008, R4                      ; 5B13   02BC 0008
        MVO     R4,     G_0121                  ; 5B15   0244 0121
        MVI     G_0105, R4                      ; 5B17   0284 0105
        SDBD                                    ; 5B19   0001
        ADDI    #$5B63, R4                      ; 5B1A   02FC 0063 005B
        MVI@    R4,     R1                      ; 5B1D   02A1
        MOVR    R1,     R2                      ; 5B1E   008A
        ANDI    #$0007, R2                      ; 5B1F   03BA 0007
        XORR    R2,     R1                      ; 5B21   01D1
        SWAP    R1,     1                       ; 5B22   0041
        XORR    R2,     R1                      ; 5B23   01D1
        XOR     G_0328, R1                      ; 5B24   03C1 0328
        MVO     R1,     G_0328                  ; 5B26   0241 0328

        JSR     R4,     L_533D                  ; 5B28   0004 0050 033D

        BEQ     L_5B4E                          ; 5B2B   0204 0021

        MVI     G_0108, R1                      ; 5B2D   0281 0108
        MVII    #$02C2, R5                      ; 5B2F   02BD 02C2

        JSR     R4,     L_6018                  ; 5B31   0004 0060 0018

        MVII    #$0002, R3                      ; 5B34   02BB 0002
        MVII    #$0004, R1                      ; 5B36   02B9 0004

        JSR     R4,     L_604D                  ; 5B38   0004 0060 004D

        MVI     G_0108, R1                      ; 5B3B   0281 0108
        SLR     R1,     1                       ; 5B3D   0061
        ADDI    #$0071, R1                      ; 5B3E   02F9 0071
        SWAP    R1,     1                       ; 5B40   0041
        MVO     R1,     G_0331                  ; 5B41   0241 0331
        MVI     G_0132, R1                      ; 5B43   0281 0132
        SLL     R1,     1                       ; 5B45   0049
        ADDI    #$0016, R1                      ; 5B46   02F9 0016
        SLL     R1,     2                       ; 5B48   004D
        SLL     R1,     1                       ; 5B49   0049
        ADD     G_0329, R1                      ; 5B4A   02C1 0329
        MVO     R1,     G_0329                  ; 5B4C   0241 0329
L_5B4E:
        PULR    R7                              ; 5B4E   02B7

L_5B4F:
        PSHR    R4                              ; 5B4F   0274
        MVI     G_01BC, R1                      ; 5B50   0281 01BC
        MOVR    R1,     R3                      ; 5B52   008B
        MVII    #$022E, R5                      ; 5B53   02BD 022E
        MVII    #$000A, R0                      ; 5B55   02B8 000A

        JSR     R4,     L_601A                  ; 5B57   0004 0060 001A

        MVI     G_0351, R1                      ; 5B5A   0281 0351
        NEGR    R3                              ; 5B5C   0023
        BNEQ    L_5B60                          ; 5B5D   020C 0001

        MOVR    R1,     R3                      ; 5B5F   008B

L_5B60:
        JSR     R4,     L_6019                  ; 5B60   0004 0060 0019

        PULR    R7                              ; 5B63   02B7

        DECLE   $0010,  $0011,  $0001,  $0005   ; 5B64   0010 0011 0001 0005

        DECR    R2                              ; 5B68   0012
        EIS                                     ; 5B69   0002
L_5B6A:
        DECR    R7                              ; 5B6A   0017

        DECLE   $003B,  $0100,  $0234           ; 5B6B   003B 0100 0234

        SUBR    R0,     R2                      ; 5B6E   0102
        BNEQ    L_595C                          ; 5B6F   022C 0214

        SUBR    R0,     R4                      ; 5B71   0104
        SUBR    R2,     R5                      ; 5B72   0115
        BEQ     L_5D8B                          ; 5B73   0204 0216

        SUBR    R0,     R4                      ; 5B75   0104
        SUBR    R2,     R7                      ; 5B76   0117

        DECLE   $020C,  $0228,  $0104,  $0229   ; 5B77   020C 0228 0104 0229
        DECLE   $0104,  $022A,  $0104,  $012B   ; 5B7B   0104 022A 0104 012B
        DECLE   $0214,  $023C,  $0104,  $023D   ; 5B7F   0214 023C 0104 023D
        DECLE   $0104,  $013E,  $021C,  $0150   ; 5B83   0104 013E 021C 0150
        DECLE   $0224,  $0151,  $0214,  $01A1   ; 5B87   0224 0151 0214 01A1
        DECLE   $022C,  $01B4,  $0204,  $02B5   ; 5B8B   022C 01B4 0204 02B5
        DECLE   $0104,  $01B6,  $0234,  $02C8   ; 5B8F   0104 01B6 0234 02C8
        DECLE   $0104,  $01C9,  $0224,  $01CA   ; 5B93   0104 01C9 0224 01CA
        DECLE   $023C,  $01DC,  $021C,  $0104   ; 5B97   023C 01DC 021C 0104
        DECLE   $0308,  $0005                   ; 5B9B   0308 0005

        SUBR    R0,     R0                      ; 5B9D   0100
        SUBR    R3,     R1                      ; 5B9E   0119
        SUB@    R2,     R0                      ; 5B9F   0310
        SUBR    R5,     R5                      ; 5BA0   012D
        SUB@    R3,     R0                      ; 5BA1   0318
        CMPR    R0,     R1                      ; 5BA2   0141
        SUB@    R4,     R0                      ; 5BA3   0320
        CMPR    R2,     R5                      ; 5BA4   0155
        SUB@    R5,     R0                      ; 5BA5   0328
        ANDR    R2,     R1                      ; 5BA6   0191
        CMP@    R3,     R0                      ; 5BA7   0358
        ANDR    R4,     R5                      ; 5BA8   01A5
        CMP@    R2,     R0                      ; 5BA9   0350
        ANDR    R7,     R1                      ; 5BAA   01B9
        CMP@    R1,     R0                      ; 5BAB   0348
        XORR    R1,     R5                      ; 5BAC   01CD
        CMP     G_01E0, R0                      ; 5BAD   0340 01E0
        SUBI    #$00E1, R0                      ; 5BAF   0338 00E1
        SUBR    R0,     R0                      ; 5BB1   0100
        SUBR    R5,     R4                      ; 5BB2   012C
        MVO     R7,     G_013F                  ; 5BB3   0247 013F
        MVO@    R7,     R2                      ; 5BB5   0257
        CMPR    R0,     R0                      ; 5BB6   0140
        MVO@    R7,     R1                      ; 5BB7   024F
        CMPR    R2,     R3                      ; 5BB8   0153
        MVO@    R7,     R4                      ; 5BB9   0267
        CMPR    R2,     R4                      ; 5BBA   0154
        MVO@    R7,     R3                      ; 5BBB   025F
        CMPR    R4,     R6                      ; 5BBC   0166
        PSHR    R7                              ; 5BBD   0277
        CMPR    R4,     R7                      ; 5BBE   0167
        MVO@    R7,     R5                      ; 5BBF   026F
        CMPR    R7,     R0                      ; 5BC0   0178
        MVI@    R1,     R7                      ; 5BC1   028F

        CMPR    R7,     R1                      ; 5BC2   0179
        MVI     G_017A, R7                      ; 5BC3   0287 017A

        DECLE   $027F,  $01CB,  $0247,  $01DE   ; 5BC5   027F 01CB 0247 01DE
        DECLE   $0257,  $01DF,  $024F,  $000B   ; 5BC9   0257 01DF 024F 000B
        DECLE   $0137,  $0024,  $0137,  $0048   ; 5BCD   0137 0024 0137 0048
        DECLE   $0167,  $0058,  $0167,  $005F   ; 5BD1   0167 0058 0167 005F
        DECLE   $0137,  $0082,  $0137,  $0089   ; 5BD5   0137 0082 0137 0089
        DECLE   $0167,  $00BF                   ; 5BD9   0167 00BF

        CMPR    R4,     R7                      ; 5BDB   0167
        ADDR    R1,     R7                      ; 5BDC   00CF

        DECLE   $0167,  $00DA,  $0137,  $00EA   ; 5BDD   0167 00DA 0137 00EA
        DECLE   $0137,  $0015,  $0167,  $0090   ; 5BE1   0137 0015 0167 0090
        DECLE   $0167,  $00B5,  $0167,  $002B   ; 5BE5   0167 00B5 0167 002B
        DECLE   $0137,  $0064,  $0137           ; 5BE9   0137 0064 0137
L_5BEC:
        PSHR    R4                              ; 5BEC   0274
        MVII    #$0200, R5                      ; 5BED   02BD 0200

L_5BEF:
        JSR     R4,     L_5C8F                  ; 5BEF   0004 005C 008F

        CMPI    #$02F0, R5                      ; 5BF2   037D 02F0
        BLT     L_5BEF                          ; 5BF4   0225 0006

        CLRR    R3                              ; 5BF6   01DB
        CLRR    R1                              ; 5BF7   01C9

        JSR     R4,     L_604D                  ; 5BF8   0004 0060 004D

        MVII    #$0010, R4                      ; 5BFB   02BC 0010
        MVO     R4,     G_0120                  ; 5BFD   0244 0120
        PULR    R7                              ; 5BFF   02B7

        INCR    R2                              ; 5C00   000A
        INCR    R3                              ; 5C01   000B
        INCR    R4                              ; 5C02   000C
        INCR    R5                              ; 5C03   000D
        INCR    R6                              ; 5C04   000E
        INCR    R7                              ; 5C05   000F

        DECR    R0                              ; 5C06   0010
L_5C07:
        DECR    R1                              ; 5C07   0011
        DECLE   $0012,  $0001,  $0002,  $0003   ; 5C08   0012 0001 0002 0003
        DECLE   $0004,  $0005                   ; 5C0C   0004 0005

        CLRC                                    ; 5C0E   0006
        SETC                                    ; 5C0F   0007
        INCR    R0                              ; 5C10   0008
        INCR    R1                              ; 5C11   0009
        DECR    R3                              ; 5C12   0013
        DECR    R4                              ; 5C13   0014
        DECR    R5                              ; 5C14   0015
        DECR    R6                              ; 5C15   0016
L_5C16:
        DECR    R7                              ; 5C16   0017

        DECLE   $0018,  $0019,  $001A,  $001D   ; 5C17   0018 0019 001A 001D
        DECLE   $001E,  $001B,  $001C,  $0021   ; 5C1B   001E 001B 001C 0021
        DECLE   $0022,  $001F,  $0020,  $0023   ; 5C1F   0022 001F 0020 0023
        DECLE   $0024,  $0025,  $0026,  $0027   ; 5C23   0024 0025 0026 0027

        ADCR    R0                              ; 5C27   0028
        ADCR    R5                              ; 5C28   002D
        ADCR    R6                              ; 5C29   002E
        ADCR    R3                              ; 5C2A   002B
        ADCR    R4                              ; 5C2B   002C
        ADCR    R1                              ; 5C2C   0029
L_5C2D:
        PSHR    R4                              ; 5C2D   0274
        PSHR    R0                              ; 5C2E   0270
        PSHR    R1                              ; 5C2F   0271
        PSHR    R3                              ; 5C30   0273
        SUB     G_012E, R3                      ; 5C31   0303 012E
        BMI     L_5C93                          ; 5C33   020B 005E

        CMP     G_012F, R3                      ; 5C35   0343 012F
        BGE     L_5C93                          ; 5C37   020D 005A

        CMP     G_0130, R1                      ; 5C39   0341 0130
        BGE     L_5C93                          ; 5C3B   020D 0056

        MOVR    R0,     R4                      ; 5C3D   0084
        CMP     G_035B, R0                      ; 5C3E   0340 035B
        BLT     L_5C45                          ; 5C40   0205 0003

        SUB     G_035C, R0                      ; 5C42   0300 035C
        NEGR    R0                              ; 5C44   0020
L_5C45:
        ADDR    R3,     R4                      ; 5C45   00DC
        ADDR    R0,     R3                      ; 5C46   00C3
        MOVR    R4,     R0                      ; 5C47   00A0
        ADD     G_035D, R3                      ; 5C48   02C3 035D
        MVI@    R3,     R2                      ; 5C4A   029A
        ANDI    #$000F, R2                      ; 5C4B   03BA 000F
        BEQ     L_5C93                          ; 5C4D   0204 0044

        MOVR    R2,     R1                      ; 5C4F   0091
        SLL     R2,     1                       ; 5C50   004A
        SDBD                                    ; 5C51   0001
        ADDI    #$6995, R2                      ; 5C52   02FA 0095 0069
        XOR@    R3,     R1                      ; 5C55   03D9
        BEQ     L_5C89                          ; 5C56   0204 0031

        SLR     R1,     2                       ; 5C58   0065
        CMP     G_035B, R4                      ; 5C59   0344 035B
        BLT     L_5C64                          ; 5C5B   0205 0007

        SLR     R1,     2                       ; 5C5D   0065
        SDBD                                    ; 5C5E   0001
        ADDI    #$5BFF, R1                      ; 5C5F   02F9 00FF 005B
        MVI@    R1,     R1                      ; 5C62   0289
        SLL     R1,     2                       ; 5C63   004D
L_5C64:
        SLL     R1,     1                       ; 5C64   0049
        CMPI    #$0098, R1                      ; 5C65   0379 0098
        BLT     L_5C83                          ; 5C67   0205 001A

        MVI     G_035E, R4                      ; 5C69   0284 035E
        CMPI    #$00F8, R1                      ; 5C6B   0379 00F8
        BGE     L_5C71                          ; 5C6D   020D 0002

        ADDI    #$003C, R4                      ; 5C6F   02FC 003C
L_5C71:
        CMP@    R4,     R0                      ; 5C71   0360
        BNEQ    L_5C71                          ; 5C72   022C 0002

        SUB     G_035E, R4                      ; 5C74   0304 035E
        ADDI    #$0132, R4                      ; 5C76   02FC 0132
        MVI@    R4,     R0                      ; 5C78   02A0
        TSTR    R0                              ; 5C79   0080
        BEQ     L_5C83                          ; 5C7A   0204 0007

        CMPI    #$00A8, R1                      ; 5C7C   0379 00A8
        BGT     L_5C85                          ; 5C7E   020E 0005

        CLRR    R1                              ; 5C80   01C9
        B       L_5C89                          ; 5C81   0200 0006

L_5C83:
        SUBI    #$0008, R1                      ; 5C83   0339 0008
L_5C85:
        SDBD                                    ; 5C85   0001
        XORI    #$0800, R1                      ; 5C86   03F9 0000 0008
L_5C89:
        MOVR    R2,     R4                      ; 5C89   0094
        SDBD                                    ; 5C8A   0001
        XOR@    R4,     R1                      ; 5C8B   03E1
        MVO@    R1,     R5                      ; 5C8C   0269
        B       L_5CAA                          ; 5C8D   0200 001B

L_5C8F:
        PSHR    R4                              ; 5C8F   0274
        PSHR    R0                              ; 5C90   0270
        PSHR    R1                              ; 5C91   0271
        PSHR    R3                              ; 5C92   0273
L_5C93:
        MVI     G_0352, R0                      ; 5C93   0280 0352
        XORR    R5,     R0                      ; 5C95   01E8
        SLL     R0,     2                       ; 5C96   004C
        XORR    R5,     R0                      ; 5C97   01E8
        SLR     R0,     2                       ; 5C98   0064
        ANDI    #$001F, R0                      ; 5C99   03B8 001F
        SDBD                                    ; 5C9B   0001
        MVII    #$084F, R3                      ; 5C9C   02BB 004F 0008
        DECR    R0                              ; 5C9F   0010
        BEQ     L_5CA9                          ; 5CA0   0204 0007

        SUBI    #$0048, R3                      ; 5CA2   033B 0048
        CMPI    #$0007, R0                      ; 5CA4   0378 0007
        BEQ     L_5CA9                          ; 5CA6   0204 0001

        CLRR    R3                              ; 5CA8   01DB
L_5CA9:
        MVO@    R3,     R5                      ; 5CA9   026B
L_5CAA:
        PULR    R3                              ; 5CAA   02B3
        PULR    R1                              ; 5CAB   02B1
        PULR    R0                              ; 5CAC   02B0
        PULR    R7                              ; 5CAD   02B7

        DIS                                     ; 5CAE   0003
        CLRR    R5                              ; 5CAF   01ED
        MVO     R5,     .STIC.MODE              ; 5CB0   0245 0021
        MVI     G_0102, R0                      ; 5CB2   0280 0102
        INCR    R0                              ; 5CB4   0008
        MVO     R0,     G_0102                  ; 5CB5   0240 0102
        CMPI    #$0100, R0                      ; 5CB7   0378 0100
        BEQ     L_5D47                          ; 5CB9   0204 008C

        MVO     R5,     .STIC.BORD              ; 5CBB   0245 002C
        MVI     G_010A, R1                      ; 5CBD   0281 010A
        CMPI    #$005A, R1                      ; 5CBF   0379 005A
        BEQ     L_5D38                          ; 5CC1   0204 0075

        CMPI    #$0002, R0                      ; 5CC3   0378 0002
        BLT     L_5CCB                          ; 5CC5   0205 0004
        BEQ     L_5DF1                          ; 5CC7   0204 0128
        B       L_5D32                          ; 5CC9   0200 0067

L_5CCB:
        MVO     R5,     .STIC.VIDEN             ; 5CCB   0245 0020
        SLL     R0,     2                       ; 5CCD   004C
        MVII    #$0317, R4                      ; 5CCE   02BC 0317
L_5CD0:
        MVI@    R4,     R1                      ; 5CD0   02A1
        MVO@    R1,     R5                      ; 5CD1   0269
        MVI@    R4,     R1                      ; 5CD2   02A1
        MVO@    R1,     R5                      ; 5CD3   0269
        MVI@    R4,     R1                      ; 5CD4   02A1
        MVO@    R1,     R5                      ; 5CD5   0269
        MVI@    R4,     R1                      ; 5CD6   02A1
        MVO@    R1,     R5                      ; 5CD7   0269
        MVI@    R4,     R1                      ; 5CD8   02A1
        MVO@    R1,     R5                      ; 5CD9   0269
        MVI@    R4,     R1                      ; 5CDA   02A1
        MVO@    R1,     R5                      ; 5CDB   0269
        DECR    R0                              ; 5CDC   0010
        BNEQ    L_5CD0                          ; 5CDD   022C 000E

        SDBD                                    ; 5CDF   0001
        MVII    #$3980, R5                      ; 5CE0   02BD 0080 0039
        MVII    #$0120, R3                      ; 5CE3   02BB 0120
        SDBD                                    ; 5CE5   0001
        MVII    #$645F, R2                      ; 5CE6   02BA 005F 0064
        DECR    R0                              ; 5CE9   0010
L_5CEA:
        MVI@    R3,     R4                      ; 5CEA   029C
        ADDR    R4,     R4                      ; 5CEB   00E4
        ADDR    R2,     R4                      ; 5CEC   00D4
        NEGR    R0                              ; 5CED   0020
L_5CEE:
        MVI@    R4,     R1                      ; 5CEE   02A1
        MVO@    R1,     R5                      ; 5CEF   0269
        MVI@    R4,     R1                      ; 5CF0   02A1
        MVO@    R1,     R5                      ; 5CF1   0269
        MVI@    R4,     R1                      ; 5CF2   02A1
        MVO@    R1,     R5                      ; 5CF3   0269
        MVI@    R4,     R1                      ; 5CF4   02A1
        MVO@    R1,     R5                      ; 5CF5   0269
        MVI@    R4,     R1                      ; 5CF6   02A1
        MVO@    R1,     R5                      ; 5CF7   0269
        MVI@    R4,     R1                      ; 5CF8   02A1
        MVO@    R1,     R5                      ; 5CF9   0269
        MVI@    R4,     R1                      ; 5CFA   02A1
        MVO@    R1,     R5                      ; 5CFB   0269
        MVI@    R4,     R1                      ; 5CFC   02A1
        MVO@    R1,     R5                      ; 5CFD   0269
        DECR    R0                              ; 5CFE   0010
        BEQ     L_5CEE                          ; 5CFF   0224 0012

        INCR    R3                              ; 5D01   000B
        CMPI    #$0128, R3                      ; 5D02   037B 0128
        BNEQ    L_5CEA                          ; 5D04   022C 001B

        MVI     G_0103, R0                      ; 5D06   0280 0103
        AND     G_0104, R0                      ; 5D08   0380 0104
        CMPI    #$0007, R0                      ; 5D0A   0378 0007
        BNEQ    L_5D32                          ; 5D0C   020C 0024

        MOVR    R5,     R1                      ; 5D0E   00A9
        SUBI    #$0129, R1                      ; 5D0F   0339 0129
        MVI@    R1,     R2                      ; 5D11   028A
        XORI    #$000C, R2                      ; 5D12   03FA 000C
        MVO@    R2,     R1                      ; 5D14   024A
        ADDI    #$0009, R1                      ; 5D15   02F9 0009
        MVI@    R1,     R2                      ; 5D17   028A
        XORI    #$000C, R2                      ; 5D18   03FA 000C
        MVO@    R2,     R1                      ; 5D1A   024A
        ADDI    #$0053, R1                      ; 5D1B   02F9 0053
        MVI@    R1,     R2                      ; 5D1D   028A
        XORI    #$0008, R2                      ; 5D1E   03FA 0008
        MVO@    R2,     R1                      ; 5D20   024A
        INCR    R1                              ; 5D21   0009
        MVI@    R1,     R2                      ; 5D22   028A
        XORI    #$0008, R2                      ; 5D23   03FA 0008
        MVO@    R2,     R1                      ; 5D25   024A
        ADDI    #$000D, R1                      ; 5D26   02F9 000D
        MVI@    R1,     R2                      ; 5D28   028A
        XORI    #$0008, R2                      ; 5D29   03FA 0008
        MVO@    R2,     R1                      ; 5D2B   024A
        ADDI    #$0025, R1                      ; 5D2C   02F9 0025
        MVI@    R1,     R2                      ; 5D2E   028A
        XORI    #$0008, R2                      ; 5D2F   03FA 0008
        MVO@    R2,     R1                      ; 5D31   024A
L_5D32:
        CLRR    R0                              ; 5D32   01C0
        MVO     R0,     .STIC.VIDEN             ; 5D33   0240 0020

L_5D35:
        JSR     R4,     L_60B1                  ; 5D35   0004 0060 00B1

L_5D38:
        PULR    R5                              ; 5D38   02B5
        PULR    R4                              ; 5D39   02B4
        PULR    R3                              ; 5D3A   02B3
        PULR    R2                              ; 5D3B   02B2
        PULR    R1                              ; 5D3C   02B1
        PULR    R0                              ; 5D3D   02B0
        RSWD    R0                              ; 5D3E   0038
        PULR    R0                              ; 5D3F   02B0
        EIS                                     ; 5D40   0002
        PULR    R7                              ; 5D41   02B7

        CLRR    R0                              ; 5D42   01C0
        MVO     R0,     .STIC.VIDEN             ; 5D43   0240 0020
        B       L_5D38                          ; 5D45   0220 000E

L_5D47:
        MVI     G_0103, R0                      ; 5D47   0280 0103
        SLL     R0,     1                       ; 5D49   0048
        MVI     G_035A, R1                      ; 5D4A   0281 035A
        ADDR    R0,     R7                      ; 5D4C   00C7
        B       L_5DA1                          ; 5D4D   0200 0052
        B       L_5D38                          ; 5D4F   0220 0018
        B       L_5D38                          ; 5D51   0220 001A
        B       L_5D38                          ; 5D53   0220 001C
        B       L_5D81                          ; 5D55   0200 002A
        B       L_5D38                          ; 5D57   0220 0020
        B       L_5D38                          ; 5D59   0220 0022
        B       L_5DE5                          ; 5D5B   0200 0088

        MOVR    R1,     R2                      ; 5D5D   008A
        SWAP    R2,     1                       ; 5D5E   0042
        ANDI    #$0007, R2                      ; 5D5F   03BA 0007
        SLL     R2,     2                       ; 5D61   004E
        ADDR    R2,     R7                      ; 5D62   00D7

        ANDI    #$0000, R1                      ; 5D63   03B9 0000
        B       L_5D79                          ; 5D65   0200 0012

        ANDI    #$0002, R1                      ; 5D67   03B9 0002
        B       L_5D9B                          ; 5D69   0200 0030

        SLR     R1,     1                       ; 5D6B   0061
        NOP                                     ; 5D6C   0034
        NOP                                     ; 5D6D   0034
        NOP                                     ; 5D6E   0034
        ANDI    #$0001, R1                      ; 5D6F   03B9 0001
        B       L_5D79                          ; 5D71   0200 0006

        ANDI    #$000B, R1                      ; 5D73   03B9 000B
        B       L_5D79                          ; 5D75   0200 0002

        ANDI    #$0003, R1                      ; 5D77   03B9 0003
L_5D79:
        MVII    #$00FF, R0                      ; 5D79   02B8 00FF
        MVO     R0,     G_0102                  ; 5D7B   0240 0102
        MVO     R1,     .STIC.BORD              ; 5D7D   0241 002C
        B       L_5D35                          ; 5D7F   0220 004B

L_5D81:
        MOVR    R1,     R2                      ; 5D81   008A
        SWAP    R2,     1                       ; 5D82   0042
        ANDI    #$0007, R2                      ; 5D83   03BA 0007
        SLL     R2,     2                       ; 5D85   004E
        ADDR    R2,     R7                      ; 5D86   00D7

        ANDI    #$0000, R1                      ; 5D87   03B9 0000
        B       L_5D79                          ; 5D89   0220 0011

L_5D8B:
        ANDI    #$0002, R1                      ; 5D8B   03B9 0002
        B       L_5D9B                          ; 5D8D   0200 000C

        ANDI    #$0002, R1                      ; 5D8F   03B9 0002
        B       L_5D79                          ; 5D91   0220 0019

        ANDI    #$0006, R1                      ; 5D93   03B9 0006
        B       L_5D79                          ; 5D95   0220 001D

        ANDI    #$000A, R1                      ; 5D97   03B9 000A
        B       L_5D79                          ; 5D99   0220 0021
L_5D9B:
        BEQ     L_5D79                          ; 5D9B   0224 0023

        MVII    #$000F, R1                      ; 5D9D   02B9 000F
        B       L_5D79                          ; 5D9F   0220 0027

L_5DA1:
        JSR     R4,     L_6068                  ; 5DA1   0004 0060 0068

        MVO     R0,     .STIC.EDGE              ; 5DA4   0240 0032

        JSR     R4,     L_632B                  ; 5DA6   0004 0060 032B

        MVII    #$0353, R4                      ; 5DA9   02BC 0353
        SDBD                                    ; 5DAB   0001
        MVII    #$627E, R0                      ; 5DAC   02B8 007E 0062
        MVO@    R0,     R4                      ; 5DAF   0260
        MVO@    R1,     R4                      ; 5DB0   0261
        MVO@    R1,     R4                      ; 5DB1   0261
        MVO     R1,     G_01B5                  ; 5DB2   0241 01B5
        MVI     G_0106, R0                      ; 5DB4   0280 0106
        DECR    R0                              ; 5DB6   0010
        BMI     L_5DDB                          ; 5DB7   020B 0022

        MVI     G_0133, R0                      ; 5DB9   0280 0133
        ADD     G_0135, R0                      ; 5DBB   02C0 0135
        ADD     G_0137, R0                      ; 5DBD   02C0 0137
        ADD     G_0139, R0                      ; 5DBF   02C0 0139
        ADDR    R0,     R0                      ; 5DC1   00C0
        ADD     G_0108, R0                      ; 5DC2   02C0 0108
        SUB     G_0105, R0                      ; 5DC4   0300 0105
        SUBI    #$0008, R0                      ; 5DC6   0338 0008
        BPL     L_5DCB                          ; 5DC8   0203 0001

        CLRR    R0                              ; 5DCA   01C0
L_5DCB:
        MVO     R0,     G_0108                  ; 5DCB   0240 0108
        BNEQ    L_5D38                          ; 5DCD   022C 0096

        MVII    #$018F, R4                      ; 5DCF   02BC 018F
L_5DD1:
        MVI@    R4,     R0                      ; 5DD1   02A0
        TSTR    R0                              ; 5DD2   0080
        BEQ     L_5DDB                          ; 5DD3   0204 0006

        CMPI    #$0199, R4                      ; 5DD5   037C 0199
        BLT     L_5DD1                          ; 5DD7   0225 0007
        B       L_5D38                          ; 5DD9   0220 00A2

L_5DDB:
        MVII    #$0009, R0                      ; 5DDB   02B8 0009
        MVO     R0,     G_0103                  ; 5DDD   0240 0103
        MVII    #$0001, R0                      ; 5DDF   02B8 0001
        MVO     R0,     G_035A                  ; 5DE1   0240 035A
        B       L_5D38                          ; 5DE3   0220 00AC

L_5DE5:
        JSR     R4,     L_6068                  ; 5DE5   0004 0060 0068

        MVII    #$0003, R0                      ; 5DE8   02B8 0003
        MVO     R0,     .STIC.EDGE              ; 5DEA   0240 0032

        JSR     R4,     L_6315                  ; 5DEC   0004 0060 0315

        B       L_5D38                          ; 5DEF   0220 00B8

L_5DF1:
        SUB     G_01BB, R0                      ; 5DF1   0300 01BB
        MVO     R0,     G_0102                  ; 5DF3   0240 0102
        CMPI    #$0002, R0                      ; 5DF5   0378 0002
        BNEQ    L_5D32                          ; 5DF7   022C 00C6

        MVII    #$0018, R5                      ; 5DF9   02BD 0018
        CLRR    R2                              ; 5DFB   01D2
        MVII    #$010D, R4                      ; 5DFC   02BC 010D
        MVI@    R5,     R0                      ; 5DFE   02A8
        MVO@    R0,     R4                      ; 5DFF   0260
        DECR    R5                              ; 5E00   0015
        MVO@    R2,     R5                      ; 5E01   026A
        MVI@    R5,     R0                      ; 5E02   02A8
        MVO@    R0,     R4                      ; 5E03   0260
        DECR    R5                              ; 5E04   0015
        MVO@    R2,     R5                      ; 5E05   026A
        MVI@    R5,     R0                      ; 5E06   02A8
        MVO@    R0,     R4                      ; 5E07   0260
        DECR    R5                              ; 5E08   0015
        MVO@    R2,     R5                      ; 5E09   026A
        MVI     G_0103, R1                      ; 5E0A   0281 0103
        CMPI    #$0007, R1                      ; 5E0C   0379 0007
        BNEQ    L_5D32                          ; 5E0E   022C 00DD

        MVI     G_0128, R1                      ; 5E10   0281 0128
        SUB     G_0129, R1                      ; 5E12   0301 0129
        MOVR    R1,     R0                      ; 5E14   0088
        ANDI    #$007F, R1                      ; 5E15   03B9 007F
        MVO     R1,     G_0128                  ; 5E17   0241 0128
        SLR     R1,     2                       ; 5E19   0065
        SLR     R1,     2                       ; 5E1A   0065
        MVO     R1,     .STIC.HDLY              ; 5E1B   0241 0030
        NEGR    R1                              ; 5E1D   0021
        ADDI    #$0330, R1                      ; 5E1E   02F9 0330
        MVO     R1,     .STIC.X.0               ; 5E20   0241 0000
        MVO     R1,     G_0317                  ; 5E22   0241 0317
        MVI     G_012B, R1                      ; 5E24   0281 012B
        MVI     G_012C, R2                      ; 5E26   0282 012C
        SUBR    R2,     R1                      ; 5E28   0111
        MOVR    R1,     R3                      ; 5E29   008B
        ANDI    #$007F, R3                      ; 5E2A   03BB 007F
        MVO     R3,     G_012B                  ; 5E2C   0243 012B
        SLR     R3,     2                       ; 5E2E   0067
        SLR     R3,     2                       ; 5E2F   0067
        MVO     R3,     .STIC.VDLY              ; 5E30   0243 0031
        NEGR    R3                              ; 5E32   0023
        ADDI    #$003A, R3                      ; 5E33   02FB 003A
        MVI     G_031F, R4                      ; 5E35   0284 031F
        ANDI    #$0380, R4                      ; 5E37   03BC 0380
        XORR    R3,     R4                      ; 5E39   01DC
        MVO     R4,     .STIC.Y.0               ; 5E3A   0244 0008
        MVO     R4,     G_031F                  ; 5E3C   0244 031F
        SWAP    R0,     2                       ; 5E3E   0044
        BPL     L_5E53                          ; 5E3F   0203 0012

        MVII    #$0001, R3                      ; 5E41   02BB 0001
L_5E43:
        MVI@    R3,     R4                      ; 5E43   029C
        ANDI    #$00FF, R4                      ; 5E44   03BC 00FF
        MOVR    R4,     R5                      ; 5E46   00A5
        XOR@    R3,     R4                      ; 5E47   03DC
        SUBI    #$0008, R5                      ; 5E48   033D 0008
        ANDI    #$00FF, R5                      ; 5E4A   03BD 00FF
        ADDR    R5,     R4                      ; 5E4C   00EC
        MVO@    R4,     R3                      ; 5E4D   025C
        INCR    R3                              ; 5E4E   000B
        CMPI    #$0007, R3                      ; 5E4F   037B 0007
        BLE     L_5E43                          ; 5E51   0226 000F

L_5E53:
        SWAP    R1,     2                       ; 5E53   0045
        BPL     L_5E79                          ; 5E54   0203 0023

        MVII    #$0008, R5                      ; 5E56   02BD 0008
        SWAP    R2,     2                       ; 5E58   0046
        BMI     L_5E5C                          ; 5E59   020B 0001

        NEGR    R5                              ; 5E5B   0025
L_5E5C:
        MVII    #$0320, R3                      ; 5E5C   02BB 0320
L_5E5E:
        MVI@    R3,     R4                      ; 5E5E   029C
        ANDI    #$007F, R4                      ; 5E5F   03BC 007F
        MOVR    R4,     R2                      ; 5E61   00A2
        XOR@    R3,     R4                      ; 5E62   03DC
        ADDR    R5,     R2                      ; 5E63   00EA
        ANDI    #$007F, R2                      ; 5E64   03BA 007F
        ADDR    R2,     R4                      ; 5E66   00D4
        MVO@    R4,     R3                      ; 5E67   025C
        SUBI    #$0317, R3                      ; 5E68   033B 0317
        MVO@    R4,     R3                      ; 5E6A   025C
        ADDI    #$032F, R3                      ; 5E6B   02FB 032F
        MVI@    R3,     R4                      ; 5E6D   029C
        ANDI    #$00FF, R4                      ; 5E6E   03BC 00FF
        SWAP    R2,     1                       ; 5E70   0042
        ADDR    R2,     R4                      ; 5E71   00D4
        MVO@    R4,     R3                      ; 5E72   025C
        SUBI    #$0017, R3                      ; 5E73   033B 0017
        CMPI    #$0326, R3                      ; 5E75   037B 0326
        BLE     L_5E5E                          ; 5E77   0226 001A

L_5E79:
        CLRR    R2                              ; 5E79   01D2
        MVO     R2,     .STIC.VIDEN             ; 5E7A   0242 0020
        EIS                                     ; 5E7C   0002
        PSHR    R1                              ; 5E7D   0271
        PSHR    R5                              ; 5E7E   0275
        PSHR    R0                              ; 5E7F   0270
        TSTR    R1                              ; 5E80   0089
        BPL     L_5F39                          ; 5E81   0203 00B6

        TSTR    R5                              ; 5E83   00AD
        BPL     L_5EB4                          ; 5E84   0203 002E

        MVII    #$0200, R4                      ; 5E86   02BC 0200
        MVII    #$0214, R5                      ; 5E88   02BD 0214
        TSTR    R0                              ; 5E8A   0080
        BPL     L_5E9C                          ; 5E8B   0203 000F

        INCR    R5                              ; 5E8D   000D
        MVII    #$0228, R1                      ; 5E8E   02B9 0228
        CLRR    R3                              ; 5E90   01DB
        MVII    #$0005, R2                      ; 5E91   02BA 0005
L_5E93:
        MVO@    R3,     R1                      ; 5E93   024B
        ADDI    #$0014, R1                      ; 5E94   02F9 0014
        MVO@    R3,     R1                      ; 5E96   024B
        ADDI    #$0014, R1                      ; 5E97   02F9 0014
        DECR    R2                              ; 5E99   0012
        BNEQ    L_5E93                          ; 5E9A   022C 0008

L_5E9C:
        MVII    #$0037, R2                      ; 5E9C   02BA 0037
L_5E9E:
        MVI@    R5,     R3                      ; 5E9E   02AB
        MVO@    R3,     R4                      ; 5E9F   0263
        MVI@    R5,     R3                      ; 5EA0   02AB
        MVO@    R3,     R4                      ; 5EA1   0263
        MVI@    R5,     R3                      ; 5EA2   02AB
        MVO@    R3,     R4                      ; 5EA3   0263
        MVI@    R5,     R3                      ; 5EA4   02AB
        MVO@    R3,     R4                      ; 5EA5   0263
        DECR    R2                              ; 5EA6   0012
        BNEQ    L_5E9E                          ; 5EA7   022C 000A

        TSTR    R0                              ; 5EA9   0080
        BPL     L_5EAD                          ; 5EAA   0203 0001

        DECR    R4                              ; 5EAC   0014
L_5EAD:
        MVO@    R2,     R4                      ; 5EAD   0262
        CMPI    #$02F0, R4                      ; 5EAE   037C 02F0
        BLT     L_5EAD                          ; 5EB0   0225 0004
        B       L_5F5E                          ; 5EB2   0200 00AA

L_5EB4:
        MVII    #$0200, R1                      ; 5EB4   02B9 0200
        CLRR    R2                              ; 5EB6   01D2
        TSTR    R0                              ; 5EB7   0080
        BPL     L_5EBD                          ; 5EB8   0203 0003

        INCR    R1                              ; 5EBA   0009
        MVO     R2,     .BTAB.00                ; 5EBB   0242 0200
L_5EBD:
        MVII    #$0005, R3                      ; 5EBD   02BB 0005
        MVII    #$02DC, R4                      ; 5EBF   02BC 02DC
L_5EC1:
        MVI@    R1,     R5                      ; 5EC1   028D
        MVO@    R2,     R1                      ; 5EC2   024A
        MVO@    R5,     R4                      ; 5EC3   0265
        INCR    R1                              ; 5EC4   0009
        MVI@    R1,     R5                      ; 5EC5   028D
        MVO@    R2,     R1                      ; 5EC6   024A
        MVO@    R5,     R4                      ; 5EC7   0265
        INCR    R1                              ; 5EC8   0009
        MVI@    R1,     R5                      ; 5EC9   028D
        MVO@    R2,     R1                      ; 5ECA   024A
        MVO@    R5,     R4                      ; 5ECB   0265
        INCR    R1                              ; 5ECC   0009
        MVI@    R1,     R5                      ; 5ECD   028D
        MVO@    R2,     R1                      ; 5ECE   024A
        MVO@    R5,     R4                      ; 5ECF   0265
        INCR    R1                              ; 5ED0   0009
        DECR    R3                              ; 5ED1   0013
        BNEQ    L_5EC1                          ; 5ED2   022C 0012

        MVII    #$0214, R1                      ; 5ED4   02B9 0214
        MVII    #$0228, R2                      ; 5ED6   02BA 0228
        TSTR    R0                              ; 5ED8   0080
        BPL     L_5F14                          ; 5ED9   0203 0039

        MVII    #$0005, R5                      ; 5EDB   02BD 0005
L_5EDD:
        MVII    #$02DC, R3                      ; 5EDD   02BB 02DC
        MVII    #$0006, R0                      ; 5EDF   02B8 0006
L_5EE1:
        MVI@    R3,     R4                      ; 5EE1   029C
        MVO@    R4,     R1                      ; 5EE2   024C
        INCR    R1                              ; 5EE3   0009
        MVI@    R1,     R4                      ; 5EE4   028C
        MVO@    R4,     R2                      ; 5EE5   0254
        INCR    R2                              ; 5EE6   000A
        MVI@    R2,     R4                      ; 5EE7   0294
        MVO@    R4,     R3                      ; 5EE8   025C
        INCR    R3                              ; 5EE9   000B
        MVI@    R3,     R4                      ; 5EEA   029C
        MVO@    R4,     R1                      ; 5EEB   024C
        INCR    R1                              ; 5EEC   0009
        MVI@    R1,     R4                      ; 5EED   028C
        MVO@    R4,     R2                      ; 5EEE   0254
        INCR    R2                              ; 5EEF   000A
        MVI@    R2,     R4                      ; 5EF0   0294
        MVO@    R4,     R3                      ; 5EF1   025C
        INCR    R3                              ; 5EF2   000B
        MVI@    R3,     R4                      ; 5EF3   029C
        MVO@    R4,     R1                      ; 5EF4   024C
        INCR    R1                              ; 5EF5   0009
        MVI@    R1,     R4                      ; 5EF6   028C
        MVO@    R4,     R2                      ; 5EF7   0254
        INCR    R2                              ; 5EF8   000A
        MVI@    R2,     R4                      ; 5EF9   0294
        MVO@    R4,     R3                      ; 5EFA   025C
        INCR    R3                              ; 5EFB   000B
        DECR    R0                              ; 5EFC   0010
        BNEQ    L_5EE1                          ; 5EFD   022C 001D

        MVI@    R3,     R4                      ; 5EFF   029C
        MVO@    R4,     R1                      ; 5F00   024C
        INCR    R1                              ; 5F01   0009
        MVI@    R1,     R4                      ; 5F02   028C
        MVO@    R4,     R2                      ; 5F03   0254
        INCR    R2                              ; 5F04   000A
        MVI@    R2,     R4                      ; 5F05   0294
        MVO@    R4,     R3                      ; 5F06   025C
        MVO@    R0,     R1                      ; 5F07   0248
        MVO@    R0,     R2                      ; 5F08   0250
        ADDI    #$0015, R1                      ; 5F09   02F9 0015
        ADDI    #$0015, R2                      ; 5F0B   02FA 0015
        DECR    R5                              ; 5F0D   0015
        BNEQ    L_5EDD                          ; 5F0E   022C 0032

        INCR    R3                              ; 5F10   000B
        MVO@    R0,     R3                      ; 5F11   0258
        B       L_5F5E                          ; 5F12   0200 004A

L_5F14:
        MVII    #$0005, R0                      ; 5F14   02B8 0005
L_5F16:
        PSHR    R0                              ; 5F16   0270
        MVII    #$02DC, R3                      ; 5F17   02BB 02DC
        MVII    #$0009, R0                      ; 5F19   02B8 0009
L_5F1B:
        MVI@    R1,     R4                      ; 5F1B   028C
        MVI@    R3,     R5                      ; 5F1C   029D
        MVO@    R5,     R1                      ; 5F1D   024D
        MVI@    R2,     R5                      ; 5F1E   0295
        MVO@    R4,     R2                      ; 5F1F   0254
        MVO@    R5,     R3                      ; 5F20   025D
        INCR    R1                              ; 5F21   0009
        INCR    R2                              ; 5F22   000A
        INCR    R3                              ; 5F23   000B
        MVI@    R1,     R4                      ; 5F24   028C
        MVI@    R3,     R5                      ; 5F25   029D
        MVO@    R5,     R1                      ; 5F26   024D
        MVI@    R2,     R5                      ; 5F27   0295
        MVO@    R4,     R2                      ; 5F28   0254
        MVO@    R5,     R3                      ; 5F29   025D
        INCR    R1                              ; 5F2A   0009
        INCR    R2                              ; 5F2B   000A
        INCR    R3                              ; 5F2C   000B
        DECR    R0                              ; 5F2D   0010
        BPL     L_5F1B                          ; 5F2E   0223 0014

        ADDI    #$0014, R1                      ; 5F30   02F9 0014
        ADDI    #$0014, R2                      ; 5F32   02FA 0014
        ADD@    R6,     R0                      ; 5F34   02F0
        BNEQ    L_5F16                          ; 5F35   022C 0020
        B       L_5F5E                          ; 5F37   0200 0025

L_5F39:
        PULR    R0                              ; 5F39   02B0
        PSHR    R0                              ; 5F3A   0270
        TSTR    R0                              ; 5F3B   0080
        BPL     L_5F5E                          ; 5F3C   0203 0020

        MVII    #$0200, R5                      ; 5F3E   02BD 0200
        MOVR    R5,     R4                      ; 5F40   00AC
        CLRR    R2                              ; 5F41   01D2
        MVII    #$0006, R1                      ; 5F42   02B9 0006
L_5F44:
        MVO@    R2,     R5                      ; 5F44   026A
        ADDI    #$0013, R5                      ; 5F45   02FD 0013
        MVO@    R2,     R5                      ; 5F47   026A
        ADDI    #$0013, R5                      ; 5F48   02FD 0013
        DECR    R1                              ; 5F4A   0011
        BNEQ    L_5F44                          ; 5F4B   022C 0008

        MOVR    R4,     R5                      ; 5F4D   00A5
        INCR    R5                              ; 5F4E   000D
        MVII    #$003C, R2                      ; 5F4F   02BA 003C
L_5F51:
        MVI@    R5,     R3                      ; 5F51   02AB
        MVO@    R3,     R4                      ; 5F52   0263
        MVI@    R5,     R3                      ; 5F53   02AB
        MVO@    R3,     R4                      ; 5F54   0263
        MVI@    R5,     R3                      ; 5F55   02AB
        MVO@    R3,     R4                      ; 5F56   0263
        MVI@    R5,     R3                      ; 5F57   02AB
        MVO@    R3,     R4                      ; 5F58   0263
        DECR    R2                              ; 5F59   0012
        BNEQ    L_5F51                          ; 5F5A   022C 000A

        MVO     R2,     .BTAB.EF                ; 5F5C   0242 02EF
L_5F5E:
        MVI     G_0317, R1                      ; 5F5E   0281 0317
        SWAP    R1,     1                       ; 5F60   0041
        MVO     R1,     G_032F                  ; 5F61   0241 032F
        MVI     G_031F, R1                      ; 5F63   0281 031F
        ANDI    #$007F, R1                      ; 5F65   03B9 007F
        SWAP    R1,     1                       ; 5F67   0041
        MVO     R1,     G_0337                  ; 5F68   0241 0337
        PULR    R0                              ; 5F6A   02B0
        TSTR    R0                              ; 5F6B   0080
        BPL     L_5F89                          ; 5F6C   0203 001B

        MVII    #$0318, R3                      ; 5F6E   02BB 0318
L_5F70:
        MVI@    R3,     R4                      ; 5F70   029C
        MOVR    R4,     R5                      ; 5F71   00A5
        ANDI    #$00FF, R5                      ; 5F72   03BD 00FF
        XORR    R5,     R4                      ; 5F74   01EC
        SUBI    #$0008, R5                      ; 5F75   033D 0008
        ANDI    #$00FF, R5                      ; 5F77   03BD 00FF
        XORR    R5,     R4                      ; 5F79   01EC
        MVO@    R4,     R3                      ; 5F7A   025C
        ADDI    #$0018, R3                      ; 5F7B   02FB 0018
        MVI@    R3,     R4                      ; 5F7D   029C
        SDBD                                    ; 5F7E   0001
        SUBI    #$0800, R4                      ; 5F7F   033C 0000 0008
        MVO@    R4,     R3                      ; 5F82   025C
        SUBI    #$0017, R3                      ; 5F83   033B 0017
        CMPI    #$031E, R3                      ; 5F85   037B 031E
        BLE     L_5F70                          ; 5F87   0226 0018

L_5F89:
        TSTR    R0                              ; 5F89   0080
        BPL     L_5FBA                          ; 5F8A   0203 002E

        MVI     G_0350, R1                      ; 5F8C   0281 0350
        SWAP    R1,     1                       ; 5F8E   0041
        SUBI    #$0006, R1                      ; 5F8F   0339 0006
        MVI     G_012B, R3                      ; 5F91   0283 012B
        TSTR    R3                              ; 5F93   009B
        BEQ     L_5F97                          ; 5F94   0204 0001

        INCR    R1                              ; 5F96   0009
L_5F97:
        ANDI    #$007F, R1                      ; 5F97   03B9 007F
        PSHR    R1                              ; 5F99   0271
        MVI     G_012F, R2                      ; 5F9A   0282 012F

        JSR     R4,     L_66D7                  ; 5F9C   0004 0064 02D7

        PULR    R1                              ; 5F9F   02B1
        MVI     G_034F, R3                      ; 5FA0   0283 034F
        SWAP    R3,     1                       ; 5FA2   0043
        ADDI    #$0013, R3                      ; 5FA3   02FB 0013
        ANDI    #$00FF, R3                      ; 5FA5   03BB 00FF
        MVII    #$0213, R5                      ; 5FA7   02BD 0213

L_5FA9:
        JSR     R4,     L_5C2D                  ; 5FA9   0004 005C 002D

        ADD     G_012F, R0                      ; 5FAC   02C0 012F
        INCR    R1                              ; 5FAE   0009
        ANDI    #$007F, R1                      ; 5FAF   03B9 007F
        BNEQ    L_5FB4                          ; 5FB1   020C 0001

        MOVR    R1,     R0                      ; 5FB3   0088
L_5FB4:
        ADDI    #$0013, R5                      ; 5FB4   02FD 0013
        CMPI    #$02F0, R5                      ; 5FB6   037D 02F0
        BLT     L_5FA9                          ; 5FB8   0225 0010

L_5FBA:
        PULR    R5                              ; 5FBA   02B5
        PULR    R1                              ; 5FBB   02B1
        TSTR    R1                              ; 5FBC   0089
        BPL     L_5D38                          ; 5FBD   0223 0286

        TSTR    R5                              ; 5FBF   00AD
        BPL     L_5FED                          ; 5FC0   0203 002B

        MVI     G_0350, R1                      ; 5FC2   0281 0350
        SWAP    R1,     1                       ; 5FC4   0041
        ADDI    #$0005, R1                      ; 5FC5   02F9 0005
        MVI     G_012B, R3                      ; 5FC7   0283 012B
        TSTR    R3                              ; 5FC9   009B
        BEQ     L_5FCD                          ; 5FCA   0204 0001

        INCR    R1                              ; 5FCC   0009
L_5FCD:
        ANDI    #$007F, R1                      ; 5FCD   03B9 007F
        MVI     G_034F, R3                      ; 5FCF   0283 034F
        SWAP    R3,     1                       ; 5FD1   0043
        MVI     G_0128, R0                      ; 5FD2   0280 0128
        TSTR    R0                              ; 5FD4   0080
        BNEQ    L_5FD8                          ; 5FD5   020C 0001

        DECR    R3                              ; 5FD7   0013
L_5FD8:
        ANDI    #$00FF, R3                      ; 5FD8   03BB 00FF
        PSHR    R1                              ; 5FDA   0271
        MVI     G_012F, R2                      ; 5FDB   0282 012F

        JSR     R4,     L_66D7                  ; 5FDD   0004 0064 02D7

        PULR    R1                              ; 5FE0   02B1
        MVII    #$02DC, R5                      ; 5FE1   02BD 02DC

L_5FE3:
        JSR     R4,     L_5C2D                  ; 5FE3   0004 005C 002D

        INCR    R3                              ; 5FE6   000B
        CMPI    #$02F0, R5                      ; 5FE7   037D 02F0
        BLT     L_5FE3                          ; 5FE9   0225 0007
        B       L_5D38                          ; 5FEB   0220 02B4

L_5FED:
        MVI     G_0350, R1                      ; 5FED   0281 0350
        SWAP    R1,     1                       ; 5FEF   0041
        SUBI    #$0006, R1                      ; 5FF0   0339 0006
        MVI     G_012B, R3                      ; 5FF2   0283 012B
        TSTR    R3                              ; 5FF4   009B
        BEQ     L_5FF8                          ; 5FF5   0204 0001

        INCR    R1                              ; 5FF7   0009
L_5FF8:
        ANDI    #$007F, R1                      ; 5FF8   03B9 007F
        MVI     G_034F, R3                      ; 5FFA   0283 034F
        SWAP    R3,     1                       ; 5FFC   0043
        MVI     G_0128, R0                      ; 5FFD   0280 0128
        TSTR    R0                              ; 5FFF   0080
        BNEQ    L_6003                          ; 6000   020C 0001

        DECR    R3                              ; 6002   0013
L_6003:
        ANDI    #$00FF, R3                      ; 6003   03BB 00FF
        PSHR    R1                              ; 6005   0271
        MVI     G_012F, R2                      ; 6006   0282 012F

        JSR     R4,     L_66D7                  ; 6008   0004 0064 02D7

        PULR    R1                              ; 600B   02B1
        MVII    #$0200, R5                      ; 600C   02BD 0200

L_600E:
        JSR     R4,     L_5C2D                  ; 600E   0004 005C 002D

        INCR    R3                              ; 6011   000B
        CMPI    #$0214, R5                      ; 6012   037D 0214
        BLT     L_600E                          ; 6014   0225 0007
        B       L_5D38                          ; 6016   0220 02DF

L_6018:
        MOVR    R1,     R3                      ; 6018   008B
L_6019:
        CLRR    R0                              ; 6019   01C0
L_601A:
        PSHR    R4                              ; 601A   0274
        PSHR    R0                              ; 601B   0270
        ADDR    R0,     R7                      ; 601C   00C7

        MVII    #$03E8, R0                      ; 601D   02B8 03E8

        JSR     R4,     L_603A                  ; 601F   0004 0060 003A

        MVII    #$0064, R0                      ; 6022   02B8 0064

        JSR     R4,     L_603A                  ; 6024   0004 0060 003A

        MVII    #$000A, R0                      ; 6027   02B8 000A

        JSR     R4,     L_603A                  ; 6029   0004 0060 003A

        MVII    #$0001, R0                      ; 602C   02B8 0001

        JSR     R4,     L_603A                  ; 602E   0004 0060 003A

        PULR    R0                              ; 6031   02B0
        ADDR    R3,     R0                      ; 6032   00D8
        BNEQ    L_6039                          ; 6033   020C 0004

        DECR    R5                              ; 6035   0015
        MVII    #$0086, R2                      ; 6036   02BA 0086
        MVO@    R2,     R5                      ; 6038   026A
L_6039:
        PULR    R7                              ; 6039   02B7

L_603A:
        CLRR    R2                              ; 603A   01D2
        CMPR    R0,     R3                      ; 603B   0143
        BNC     L_6049                          ; 603C   0209 000B

L_603E:
        CMPR    R0,     R1                      ; 603E   0141
        BLT     L_6045                          ; 603F   0205 0004

        INCR    R2                              ; 6041   000A
        SUBR    R0,     R1                      ; 6042   0101
        B       L_603E                          ; 6043   0220 0006

L_6045:
        ADDI    #$0010, R2                      ; 6045   02FA 0010
        SLL     R2,     2                       ; 6047   004E
        SLL     R2,     1                       ; 6048   004A
L_6049:
        ADDI    #$0006, R2                      ; 6049   02FA 0006
        MVO@    R2,     R5                      ; 604B   026A
        MOVR    R4,     R7                      ; 604C   00A7

L_604D:
        ADDI    #$0317, R3                      ; 604D   02FB 0317
        SLL     R1,     2                       ; 604F   004D
        MOVR    R1,     R5                      ; 6050   008D
        SLL     R1,     1                       ; 6051   0049
        ADDR    R5,     R1                      ; 6052   00E9
        MOVR    R1,     R5                      ; 6053   008D
        ADDR    R7,     R5                      ; 6054   00FD
        ADDI    #$026C, R5                      ; 6055   02FD 026C
L_6057:
        SDBD                                    ; 6057   0001
        MVI@    R5,     R1                      ; 6058   02A9
        MVO@    R1,     R3                      ; 6059   0259
        ADDI    #$0008, R3                      ; 605A   02FB 0008
        CMPI    #$0347, R3                      ; 605C   037B 0347
        BLT     L_6057                          ; 605E   0225 0008

        CLRR    R1                              ; 6060   01C9
        MVO@    R1,     R3                      ; 6061   0259
        SUBI    #$022F, R3                      ; 6062   033B 022F
        MVII    #$0080, R1                      ; 6064   02B9 0080
        MVO@    R1,     R3                      ; 6066   0259
        MOVR    R4,     R7                      ; 6067   00A7

L_6068:
        MVII    #$0317, R5                      ; 6068   02BD 0317
        CLRR    R0                              ; 606A   01C0
L_606B:
        MVO@    R0,     R5                      ; 606B   0268
        CMPI    #$034F, R5                      ; 606C   037D 034F
        BLT     L_606B                          ; 606E   0225 0004

        MVII    #$010D, R5                      ; 6070   02BD 010D
L_6072:
        MVO@    R0,     R5                      ; 6072   0268
        CMPI    #$012D, R5                      ; 6073   037D 012D
        BLE     L_6072                          ; 6075   0226 0004

        CLRR    R5                              ; 6077   01ED
L_6078:
        MVO@    R0,     R5                      ; 6078   0268
        CMPI    #$0020, R5                      ; 6079   037D 0020
        BLT     L_6078                          ; 607B   0225 0004

        MVO     R0,     .STIC.HDLY              ; 607D   0240 0030
        MVO     R0,     .STIC.VDLY              ; 607F   0240 0031
        MVII    #$0200, R5                      ; 6081   02BD 0200
L_6083:
        MVO@    R0,     R5                      ; 6083   0268
        CMPI    #$02F0, R5                      ; 6084   037D 02F0
        BLT     L_6083                          ; 6086   0225 0004
        MOVR    R4,     R7                      ; 6088   00A7

L_6089:
        MVI@    R2,     R2                      ; 6089   0292
        SLR     R2,     1                       ; 608A   0062
        SDBD                                    ; 608B   0001
        ADDI    #$67E1, R2                      ; 608C   02FA 00E1 0067
L_608F:
        PSHR    R5                              ; 608F   0275
        PSHR    R3                              ; 6090   0273
        MVI     G_0351, R5                      ; 6091   0285 0351
        ADD@    R2,     R5                      ; 6093   02D5
        SDBD                                    ; 6094   0001
        CMPI    #$270F, R5                      ; 6095   037D 000F 0027
        BLE     L_60AD                          ; 6098   0206 0013

        MVI     G_01BC, R3                      ; 609A   0283 01BC
        CMPI    #$0063, R3                      ; 609C   037B 0063
        BLT     L_60A6                          ; 609E   0205 0006

        SDBD                                    ; 60A0   0001
        MVII    #$270F, R5                      ; 60A1   02BD 000F 0027
        B       L_60AD                          ; 60A4   0200 0007

L_60A6:
        INCR    R3                              ; 60A6   000B
        MVO     R3,     G_01BC                  ; 60A7   0243 01BC
        SDBD                                    ; 60A9   0001
        SUBI    #$2710, R5                      ; 60AA   033D 0010 0027
L_60AD:
        MVO     R5,     G_0351                  ; 60AD   0245 0351
        PULR    R3                              ; 60AF   02B3
        PULR    R7                              ; 60B0   02B7

L_60B1:
        PSHR    R4                              ; 60B1   0274
        CLRR    R0                              ; 60B2   01C0
        MVII    #$0353, R4                      ; 60B3   02BC 0353
L_60B5:
        MOVR    R0,     R2                      ; 60B5   0082
        ADDI    #$01F4, R2                      ; 60B6   02FA 01F4
        MVI@    R2,     R1                      ; 60B8   0291
        SWAP    R1,     1                       ; 60B9   0041
        SUBI    #$0004, R2                      ; 60BA   033A 0004
        ADD@    R2,     R1                      ; 60BC   02D1
        MOVR    R0,     R3                      ; 60BD   0083
        ADDI    #$0356, R3                      ; 60BE   02FB 0356
        ADD@    R3,     R1                      ; 60C0   02D9
        MVO@    R1,     R2                      ; 60C1   0251
        SWAP    R1,     1                       ; 60C2   0041
        ADDI    #$0004, R2                      ; 60C3   02FA 0004
        MVO@    R1,     R2                      ; 60C5   0251
        MVI@    R4,     R3                      ; 60C6   02A3
        MOVR    R0,     R1                      ; 60C7   0081
        ADDI    #$01B5, R1                      ; 60C8   02F9 01B5
        MVI@    R1,     R2                      ; 60CA   028A
        DECR    R2                              ; 60CB   0012
        BMI     L_60D1                          ; 60CC   020B 0003

        MVO@    R2,     R1                      ; 60CE   024A
        BNEQ    L_60F5                          ; 60CF   020C 0024

L_60D1:
        TSTR    R3                              ; 60D1   009B
        BEQ     L_60F5                          ; 60D2   0204 0021

        MVI@    R3,     R5                      ; 60D4   029D
        ANDI    #$000F, R5                      ; 60D5   03BD 000F
        MVI@    R3,     R1                      ; 60D7   0299
        SLR     R1,     2                       ; 60D8   0065
        SLR     R1,     2                       ; 60D9   0065
        INCR    R5                              ; 60DA   000D
        ADDR    R7,     R5                      ; 60DB   00FD
        ADD@    R5,     R7                      ; 60DC   02EF

        DECLE   $000E,  $001E,  $0027,  $0034   ; 60DD   000E 001E 0027 0034
        DECLE   $0037                           ; 60E1   0037

        RSWD    R3                              ; 60E2   003B
        SWAP    R3,     2                       ; 60E3   0047
        SLL     R1,     2                       ; 60E4   004D
        RLC     R3,     1                       ; 60E5   0053
        SARC    R2,     1                       ; 60E6   007A
        MOVR    R5,     R3                      ; 60E7   00AB
        MOVR    R5,     R7                      ; 60E8   00AF

        MOVR    R6,     R3                      ; 60E9   00B3
        MOVR    R7,     R4                      ; 60EA   00BC
        MOVR    R0,     R2                      ; 60EB   0082
        ADDI    #$01B5, R2                      ; 60EC   02FA 01B5
        TSTR    R1                              ; 60EE   0089
        BEQ     L_60F5                          ; 60EF   0204 0004

        MVO@    R1,     R2                      ; 60F1   0251
        INCR    R3                              ; 60F2   000B
        DECR    R4                              ; 60F3   0014
        MVO@    R3,     R4                      ; 60F4   0263
L_60F5:
        INCR    R0                              ; 60F5   0008
        CMPI    #$0002, R0                      ; 60F6   0378 0002
        BLE     L_60B5                          ; 60F8   0226 0044
        PULR    R7                              ; 60FA   02B7

        MOVR    R0,     R2                      ; 60FB   0082
        ADDI    #$01B8, R2                      ; 60FC   02FA 01B8
        MVO@    R1,     R2                      ; 60FE   0251
L_60FF:
        INCR    R3                              ; 60FF   000B
L_6100:
        DECR    R4                              ; 6100   0014
        MVO@    R3,     R4                      ; 6101   0263
        B       L_60D1                          ; 6102   0220 0032

        MOVR    R0,     R2                      ; 6104   0082
        ADDI    #$01B8, R2                      ; 6105   02FA 01B8
        MVI@    R2,     R5                      ; 6107   0295
        DECR    R5                              ; 6108   0015
        BMI     L_610E                          ; 6109   020B 0003

        MVO@    R5,     R2                      ; 610B   0255
        BEQ     L_60FF                          ; 610C   0224 000E

L_610E:
        SUBR    R1,     R3                      ; 610E   010B
        B       L_6100                          ; 610F   0220 0010

        ADDR    R1,     R3                      ; 6111   00CB
        B       L_6100                          ; 6112   0220 0013

        MVO     R1,     .PSG0.noise             ; 6114   0241 01F9
        B       L_60FF                          ; 6116   0220 0018

        MVO     R1,     .PSG0.envelope          ; 6118   0241 01FA
        INCR    R3                              ; 611A   000B
        MVI@    R3,     R1                      ; 611B   0299
        MVO     R1,     .PSG0.envlp_lo          ; 611C   0241 01F3
        INCR    R3                              ; 611E   000B
        MVI@    R3,     R1                      ; 611F   0299
        MVO     R1,     .PSG0.envlp_hi          ; 6120   0241 01F7
        B       L_60FF                          ; 6122   0220 0024

        MVII    #$01FB, R2                      ; 6124   02BA 01FB
        MVII    #$00F6, R5                      ; 6126   02BD 00F6
        B       L_6134                          ; 6128   0200 000A

        MVII    #$01FC, R2                      ; 612A   02BA 01FC
        MVII    #$00ED, R5                      ; 612C   02BD 00ED
        B       L_6134                          ; 612E   0200 0004

        MVII    #$01FD, R2                      ; 6130   02BA 01FD
        MVII    #$00DB, R5                      ; 6132   02BD 00DB
L_6134:
        PSHR    R0                              ; 6134   0270
        MOVR    R1,     R0                      ; 6135   0088
        ANDI    #$001F, R1                      ; 6136   03B9 001F
        SLL     R0,     1                       ; 6138   0048
        ANDI    #$0020, R0                      ; 6139   03B8 0020
        ADDR    R0,     R1                      ; 613B   00C1
        PULR    R0                              ; 613C   02B0
        MVO@    R1,     R2                      ; 613D   0251
        MVI@    R3,     R1                      ; 613E   0299
        ANDI    #$0200, R1                      ; 613F   03B9 0200
        BNEQ    L_60FF                          ; 6141   022C 0043

        INCR    R3                              ; 6143   000B
        MVI@    R3,     R1                      ; 6144   0299
        SUBI    #$000B, R2                      ; 6145   033A 000B
        MVO@    R1,     R2                      ; 6147   0251
        INCR    R3                              ; 6148   000B
        MVI@    R3,     R1                      ; 6149   0299
        ADDI    #$0004, R2                      ; 614A   02FA 0004
        MVO@    R1,     R2                      ; 614C   0251
        SLR     R1,     2                       ; 614D   0065
        SLR     R1,     2                       ; 614E   0065
        MVI     .PSG0.chan_enable,R2            ; 614F   0282 01F8
        ANDR    R5,     R2                      ; 6151   01AA
        XORR    R1,     R2                      ; 6152   01CA
        MVO     R2,     .PSG0.chan_enable       ; 6153   0242 01F8
        B       L_60FF                          ; 6155   0220 0057

        MVI     .PSG0.noise,R2                  ; 6157   0282 01F9
        DECR    R1                              ; 6159   0011
        BMI     L_6160                          ; 615A   020B 0004
        BGT     L_6165                          ; 615C   020E 0007

        DECR    R2                              ; 615E   0012
        INCR    R7                              ; 615F   000F

L_6160:
        INCR    R2                              ; 6160   000A
L_6161:
        MVO     R2,     .PSG0.noise             ; 6161   0242 01F9
        B       L_60FF                          ; 6163   0220 0065

L_6165:
        MVI     G_012E, R2                      ; 6165   0282 012E
        ADD     G_012F, R2                      ; 6167   02C2 012F
        ADDI    #$0003, R2                      ; 6169   02FA 0003
        SWAP    R2,     1                       ; 616B   0042
        SUB     G_034F, R2                      ; 616C   0302 034F
        SWAP    R2,     1                       ; 616E   0042
        SLR     R2,     2                       ; 616F   0066
        SLR     R2,     2                       ; 6170   0066
        ANDI    #$000F, R2                      ; 6171   03BA 000F
        SUBR    R2,     R1                      ; 6173   0111
        MVO     R1,     .PSG0.chn_c_vol         ; 6174   0241 01FD
        MVII    #$00FF, R1                      ; 6176   02B9 00FF
        MVO     R1,     .PSG0.chn_c_lo          ; 6178   0241 01F2
        MVI     G_0133, R1                      ; 617A   0281 0133
        ADD     G_0135, R1                      ; 617C   02C1 0135
        ADD     G_0137, R1                      ; 617E   02C1 0137
        ADD     G_0139, R1                      ; 6180   02C1 0139
        ADDI    #$000B, R1                      ; 6182   02F9 000B
        MVO     R1,     .PSG0.chn_c_hi          ; 6184   0241 01F6
        B       L_60FF                          ; 6186   0220 0088

        MVII    #$0356, R5                      ; 6188   02BD 0356
        B       L_6192                          ; 618A   0200 0006

        MVII    #$0357, R5                      ; 618C   02BD 0357
        B       L_6192                          ; 618E   0200 0002

        MVII    #$0358, R5                      ; 6190   02BD 0358
L_6192:
        SWAP    R1,     1                       ; 6192   0041
        SLL     R1,     2                       ; 6193   004D
        INCR    R3                              ; 6194   000B
        ADD@    R3,     R1                      ; 6195   02D9
        MVO@    R1,     R5                      ; 6196   0269
        B       L_60FF                          ; 6197   0220 0099

        MVII    #$01F4, R2                      ; 6199   02BA 01F4
        MVO@    R1,     R2                      ; 619B   0251
        PSHR    R3                              ; 619C   0273
        PSHR    R4                              ; 619D   0274
        PSHR    R0                              ; 619E   0270
        PSHR    R2                              ; 619F   0272
        MVII    #$0008, R1                      ; 61A0   02B9 0008

        JSR     R4,     L_66F3                  ; 61A2   0004 0064 02F3

        PULR    R2                              ; 61A5   02B2
        SUBI    #$0004, R2                      ; 61A6   033A 0004
        MVO@    R0,     R2                      ; 61A8   0250
        PULR    R0                              ; 61A9   02B0
        PULR    R4                              ; 61AA   02B4
        PULR    R3                              ; 61AB   02B3
        B       L_60FF                          ; 61AC   0220 00AE

        DECLE   $000B,  $0000,  $00C7,  $0000   ; 61AE   000B 0000 00C7 0000

        NEGR    R0                              ; 61B2   0020
        XORR    R6,     R4                      ; 61B3   01F4
        RRC     R1,     1                       ; 61B4   0071
        COMR    R1                              ; 61B5   0019
        COMR    R1                              ; 61B6   0019
        COMR    R1                              ; 61B7   0019
        COMR    R1                              ; 61B8   0019
        DECR    R0                              ; 61B9   0010
        RLC     R2,     1                       ; 61BA   0052
        MVI@    R4,     R7                      ; 61BB   02A7

        SLR     R0,     1                       ; 61BC   0060
        MVI@    R2,     R7                      ; 61BD   0297

        SLR     R0,     1                       ; 61BE   0060
        MVI     G_0060, R7                      ; 61BF   0287 0060

        DECLE   $0267,  $0060,  $0247,  $0060   ; 61C1   0267 0060 0247 0060
        DECLE   $0227,  $0060,  $0207,  $01F4   ; 61C5   0227 0060 0207 01F4
        DECLE   $0000,  $00E6,  $0030,  $0000   ; 61C9   0000 00E6 0030 0000

        INCR    R2                              ; 61CD   000A
        DECR    R0                              ; 61CE   0010
        XORR    R6,     R4                      ; 61CF   01F4
        SWAP    R0,     1                       ; 61D0   0040
        ADD@    R2,     R6                      ; 61D1   02D6
        SWAP    R0,     1                       ; 61D2   0040
        PULR    R6                              ; 61D3   02B6
        SWAP    R0,     1                       ; 61D4   0040
        PSHR    R6                              ; 61D5   0276
        SWAP    R0,     1                       ; 61D6   0040
        BLE     L_61D9                          ; 61D7   0206 0000

L_61D9:
        MOVR    R4,     R6                      ; 61D9   00A6
        DECLE   $0001,  $0080,  $000A,  $000B   ; 61DA   0001 0080 000A 000B
        DECLE   $0140,  $03FA,  $0080,  $01F4   ; 61DE   0140 03FA 0080 01F4
        DECLE   $00F6,  $00FF                   ; 61E2   00F6 00FF

        INCR    R7                              ; 61E4   000F

        ADDR    R0,     R1                      ; 61E5   00C1
L_61E6:
        MOVR    R7,     R5                      ; 61E6   00BD
        DECLE   $0020,  $0022,  $02D6,  $0050   ; 61E7   0020 0022 02D6 0050
        DECLE   $02B6,  $0050,  $0296,  $0050   ; 61EB   02B6 0050 0296 0050
        DECLE   $0256,  $0050,  $0206,  $000A   ; 61EF   0256 0050 0206 000A
        DECLE   $0000,  $0000,  $0094,  $00F6   ; 61F3   0000 0000 0094 00F6
        DECLE   $00FF,  $0003,  $0020,  $0206   ; 61F7   00FF 0003 0020 0206
        DECLE   $0010,  $02E6,  $000A,  $0160   ; 61FB   0010 02E6 000A 0160
        DECLE   $0081,  $0010,  $0009,  $0009   ; 61FF   0081 0010 0009 0009
        DECLE   $0032,  $02B6,  $0050,  $0286   ; 6203   0032 02B6 0050 0286
        DECLE   $0050,  $0246,  $0050,  $0206   ; 6207   0050 0246 0050 0206
        DECLE   $000A,  $0000,  $0000,  $0106   ; 620B   000A 0000 0000 0106
        DECLE   $00FF,  $000F,  $0107,  $00FF   ; 620F   00FF 000F 0107 00FF
        DECLE   $0009,  $0108,  $00FF,  $0005   ; 6213   0009 0108 00FF 0005
        DECLE   $000A,  $0000,  $01F4,  $0005   ; 6217   000A 0000 01F4 0005
        DECLE   $00FF,  $003F,  $0000,  $00F7   ; 621B   00FF 003F 0000 00F7
        DECLE   $0010,  $0000,  $000B,  $0014   ; 621F   0010 0000 000B 0014
        DECLE   $0020,  $0207                   ; 6223   0020 0207

        DECR    R0                              ; 6225   0010
        ADD@    R6,     R7                      ; 6226   02F7

        GSWD    R0                              ; 6227   0030
        ADD@    R2,     R7                      ; 6228   02D7

        GSWD    R0                              ; 6229   0030
        PULR    R7                              ; 622A   02B7

        DECLE   $0030,  $0267,  $0040,  $0207   ; 622B   0030 0267 0040 0207
        DECLE   $000B,  $0000,  $0000,  $00F7   ; 622F   000B 0000 0000 00F7
        DECLE   $0000,  $0002,  $000B,  $0001   ; 6233   0000 0002 000B 0001

        NEGR    R0                              ; 6237   0020
        ADD@    R6,     R7                      ; 6238   02F7

        SWAP    R0,     1                       ; 6239   0040
        ADD@    R4,     R7                      ; 623A   02E7

        GSWD    R0                              ; 623B   0030
        MVI     G_0070, R7                      ; 623C   0287 0070

        DECLE   $0247,  $0050,  $0207,  $000B   ; 623E   0247 0050 0207 000B
        DECLE   $0000,  $0000,  $0001,  $000C   ; 6242   0000 0000 0001 000C
        DECLE   $0000,  $0008,  $00FF,  $020F   ; 6246   0000 0008 00FF 020F
        DECLE   $00D9                           ; 624A   00D9

        GSWD    R0                              ; 624B   0030
        ADDR    R1,     R1                      ; 624C   00C9
        NEGR    R0                              ; 624D   0020
        MOVR    R5,     R1                      ; 624E   00A9
        NEGR    R0                              ; 624F   0020
        MOVR    R3,     R1                      ; 6250   0099
        GSWD    R0                              ; 6251   0030
        MOVR    R5,     R1                      ; 6252   00A9
        NEGR    R0                              ; 6253   0020
        ADDR    R1,     R1                      ; 6254   00C9
        NEGR    R0                              ; 6255   0020
        ADDR    R0,     R2                      ; 6256   00C2
        XORI    #$0380, R4                      ; 6257   03FC 0380
        XORI    #$0380, R3                      ; 6259   03FB 0380
        B       L_626F                          ; 625B   0200 0012

        DECLE   $000B,  $0001,  $000C,  $0002   ; 625D   000B 0001 000C 0002
        DECLE   $03F0,  $03F0,  $0277,  $0278   ; 6261   03F0 03F0 0277 0278

        XOR@    R6,     R0                      ; 6265   03F0
        XOR@    R6,     R0                      ; 6266   03F0
        MVO@    R7,     R4                      ; 6267   0267
        MVO@    R0,     R5                      ; 6268   0268
        XOR@    R6,     R0                      ; 6269   03F0
        XOR@    R6,     R0                      ; 626A   03F0
        MVO@    R7,     R2                      ; 626B   0257
        MVO@    R0,     R3                      ; 626C   0258
        XOR@    R6,     R0                      ; 626D   03F0
        XOR@    R6,     R0                      ; 626E   03F0
L_626F:
        MVO     R7,     .BTAB.48                ; 626F   0247 0248
        DECLE   $03F0,  $03F0,  $0237,  $0238   ; 6271   03F0 03F0 0237 0238
        DECLE   $03F0,  $03F0,  $0227,  $0228   ; 6275   03F0 03F0 0227 0228
        DECLE   $03F0,  $03F0,  $0207,  $0208   ; 6279   03F0 03F0 0207 0208
        DECLE   $0000,  $0001,  $03FB,  $03FF   ; 627D   0000 0001 03FB 03FF
        DECLE   $000C,  $0010,  $0206,  $0087   ; 6281   000C 0010 0206 0087
        DECLE   $00FF,  $0105,  $0088,  $00FF   ; 6285   00FF 0105 0088 00FF
        DECLE   $0201,  $03A0,  $0072,  $00A6   ; 6289   0201 03A0 0072 00A6
        DECLE   $0040,  $0000,  $0207,  $0208   ; 628D   0040 0000 0207 0208
        DECLE   $000A,  $0010,  $02F0,  $0340   ; 6291   000A 0010 02F0 0340
        DECLE   $00A3,  $0014,  $0206,  $00A8   ; 6295   00A3 0014 0206 00A8
        DECLE   $0000,  $0010,  $01F1,  $0019   ; 6299   0000 0010 01F1 0019
        DECLE   $0060,  $0022,  $000B,  $0000   ; 629D   0060 0022 000B 0000
        DECLE   $000A,  $0000,  $000C,  $0000   ; 62A1   000A 0000 000C 0000
        DECLE   $00F6,  $00FF,  $000F,  $0040   ; 62A5   00F6 00FF 000F 0040
        DECLE   $0206,  $0020,  $00F6,  $007F   ; 62A9   0206 0020 00F6 007F
        DECLE   $000B,  $00F7,  $00B1,  $000A   ; 62AD   000B 00F7 00B1 000A
        DECLE   $00F8,  $0037,  $0009,  $0024   ; 62B1   00F8 0037 0009 0024
        DECLE   $0200,  $0005,  $00FF,  $00DF   ; 62B5   0200 0005 00FF 00DF
        DECLE   $03F6,  $03F7,  $03F8,  $01C1   ; 62B9   03F6 03F7 03F8 01C1
        DECLE   $0009,  $0050,  $0022,  $0000   ; 62BD   0009 0050 0022 0000
        DECLE   $0030,  $0003,  $003A,  $0000   ; 62C1   0030 0003 003A 0000
        DECLE   $0082,  $0019,  $0000,  $0030   ; 62C5   0082 0019 0000 0030
        DECLE   $0000,  $003A,  $0000,  $0000   ; 62C9   0000 003A 0000 0000
        DECLE   $0048,  $0002,  $0035,  $0001   ; 62CD   0048 0002 0035 0001
        DECLE   $0092,  $0018,  $0000,  $0048   ; 62D1   0092 0018 0000 0048
        DECLE   $0000,  $0035,  $0060,  $0000   ; 62D5   0000 0035 0060 0000
        DECLE   $006C,  $0002,  $0035,  $0001   ; 62D9   006C 0002 0035 0001
        DECLE   $0092,  $0018,  $0000,  $006C   ; 62DD   0092 0018 0000 006C
        DECLE   $0000,  $0035,  $0000,  $0000   ; 62E1   0000 0035 0000 0000
        DECLE   $006C,  $0002,  $00B2,  $0000   ; 62E5   006C 0002 00B2 0000
        DECLE   $0090,  $0009,  $0000,  $006C   ; 62E9   0090 0009 0000 006C
        DECLE   $0000,  $0032,  $0000,  $0000   ; 62ED   0000 0032 0000 0000
        DECLE   $0000,  $0002,  $00B1,  $0000   ; 62F1   0000 0002 00B1 0000
        DECLE   $0004,  $0008,  $0000,  $0000   ; 62F5   0004 0008 0000 0000
        DECLE   $0000,  $0031,  $0000,  $0000   ; 62F9   0000 0031 0000 0000
        DECLE   $006C,  $0002,  $0036,  $0000   ; 62FD   006C 0002 0036 0000
        DECLE   $0094,  $0018,  $0000,  $006C   ; 6301   0094 0018 0000 006C
        DECLE   $0000,  $0036,  $0000,  $00FE   ; 6305   0000 0036 0000 00FE
        DECLE   $0048,  $0002,  $0038,  $0001   ; 6309   0048 0002 0038 0001
        DECLE   $0096,  $0008,  $0000,  $0048   ; 630D   0096 0008 0000 0048
        DECLE   $0000,  $0038,  $0000,  $0000   ; 6311   0000 0038 0000 0000
L_6315:
        PSHR    R4                              ; 6315   0274
        SDBD                                    ; 6316   0001
        MVII    #$634F, R3                      ; 6317   02BB 004F 0063
        MVII    #$0048, R2                      ; 631A   02BA 0048
        MVII    #$0048, R1                      ; 631C   02B9 0048

        JSR     R4,     L_6333                  ; 631E   0004 0060 0333

        SUBI    #$0007, R3                      ; 6321   033B 0007
        MVII    #$00D0, R2                      ; 6323   02BA 00D0
        MVII    #$0020, R1                      ; 6325   02B9 0020

        JSR     R4,     L_6337                  ; 6327   0004 0060 0337

        PULR    R7                              ; 632A   02B7

L_632B:
        SDBD                                    ; 632B   0001
        MVII    #$659F, R3                      ; 632C   02BB 009F 0065
        MVII    #$0138, R2                      ; 632F   02BA 0138
        MVII    #$0030, R1                      ; 6331   02B9 0030
L_6333:
        SDBD                                    ; 6333   0001
        MVII    #$3800, R5                      ; 6334   02BD 0000 0038
L_6337:
        MVI@    R3,     R0                      ; 6337   0298
        MVO@    R0,     R5                      ; 6338   0268
        INCR    R3                              ; 6339   000B
        DECR    R2                              ; 633A   0012
        BNEQ    L_6337                          ; 633B   022C 0005

        SUBR    R1,     R3                      ; 633D   010B
        ADDI    #$0007, R3                      ; 633E   02FB 0007
L_6340:
        MVII    #$0008, R2                      ; 6340   02BA 0008
L_6342:
        MVI@    R3,     R0                      ; 6342   0298
        MVO@    R0,     R5                      ; 6343   0268
        DECR    R3                              ; 6344   0013
        DECR    R1                              ; 6345   0011
        DECR    R2                              ; 6346   0012
        BNEQ    L_6342                          ; 6347   022C 0006

        ADDI    #$0010, R3                      ; 6349   02FB 0010
        TSTR    R1                              ; 634B   0089
        BNEQ    L_6340                          ; 634C   022C 000D
        MOVR    R4,     R7                      ; 634E   00A7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 634F   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 6353   0000 0002 0000 0000
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 6357   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00F0,  $00F0,  $00E0   ; 635B   00F8 00F0 00F0 00E0
        DECLE   $0000,  $0001,  $0003,  $0007   ; 635F   0000 0001 0003 0007
        DECLE   $000F,  $000F,  $001F,  $001F   ; 6363   000F 000F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6367   0000 0000 0000 0000
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 636B   0003 000F 003F 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636F   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6373   00FF 00FF 00FF 00FF
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 6377   0003 000F 003F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 637B   00FF 00FF 00FF 00FF
        DECLE   $00C0,  $00F0,  $00FC,  $00FF   ; 637F   00C0 00F0 00FC 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6383   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6387   0000 0000 0000 0000
        DECLE   $00C0,  $00F0,  $00FC,  $00FF   ; 638B   00C0 00F0 00FC 00FF
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 638F   0003 000F 003F 00FF
        DECLE   $007F,  $00FF,  $007F,  $00FF   ; 6393   007F 00FF 007F 00FF
        DECLE   $0000,  $0000,  $006E,  $00F8   ; 6397   0000 0000 006E 00F8
        DECLE   $00F8,  $006E,  $0000,  $0000   ; 639B   00F8 006E 0000 0000
        DECLE   $0000,  $000E,  $003F,  $000F   ; 639F   0000 000E 003F 000F
        DECLE   $000F,  $003F,  $000E,  $0000   ; 63A3   000F 003F 000E 0000
        DECLE   $0000,  $0000,  $0000,  $006E   ; 63A7   0000 0000 0000 006E
        DECLE   $00F8,  $006E,  $0000,  $0000   ; 63AB   00F8 006E 0000 0000
        DECLE   $0000,  $0001,  $0001,  $003F   ; 63AF   0000 0001 0001 003F
        DECLE   $003F,  $0001,  $0001,  $0000   ; 63B3   003F 0001 0001 0000
        DECLE   $0000,  $0003,  $000D,  $0015   ; 63B7   0000 0003 000D 0015
        DECLE   $0015,  $000D,  $0003,  $0000   ; 63BB   0015 000D 0003 0000
        DECLE   $0000,  $0003,  $000D,  $003F   ; 63BF   0000 0003 000D 003F
L_63C3:
        DECR    R7                              ; 63C3   0017

        DECLE   $000F,  $0003,  $0000,  $0000   ; 63C4   000F 0003 0000 0000
        DECLE   $00E0,  $0058,  $0054,  $0054   ; 63C8   00E0 0058 0054 0054
        DECLE   $0058,  $00E0,  $0000,  $0020   ; 63CC   0058 00E0 0000 0020
        DECLE   $00C0,  $00F8,  $00FC,  $00FE   ; 63D0   00C0 00F8 00FC 00FE
        DECLE   $00DC,  $00E0,  $0000,  $0000   ; 63D4   00DC 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 63D8   0000 0000 0000 0006
        DECLE   $001E,  $007E,  $003E,  $0000   ; 63DC   001E 007E 003E 0000
        DECLE   $0000,  $0000,  $0001,  $0006   ; 63E0   0000 0000 0001 0006
        DECLE   $003D,  $007F,  $007E,  $003E   ; 63E4   003D 007F 007E 003E
        DECLE   $007E,  $001E,  $0006,  $0000   ; 63E8   007E 001E 0006 0000
        DECLE   $0000,  $0000,  $0000,  $00BF   ; 63EC   0000 0000 0000 00BF
        DECLE   $005F,  $003E,  $0046,  $0008   ; 63F0   005F 003E 0046 0008
        DECLE   $0000,  $0000,  $0000,  $0003   ; 63F4   0000 0000 0000 0003
        DECLE   $0004,  $000B,  $003C,  $003B   ; 63F8   0004 000B 003C 003B
        DECLE   $000C,  $000B,  $000C,  $0001   ; 63FC   000C 000B 000C 0001
        DECLE   $0002,  $0003,  $0016,  $000B   ; 6400   0002 0003 0016 000B
        DECLE   $0005                           ; 6404   0005

        INCR    R7                              ; 6405   000F

        INCR    R2                              ; 6406   000A
L_6407:
        INCR    R3                              ; 6407   000B
        DECLE   $000C,  $003B,  $003C,  $000B   ; 6408   000C 003B 003C 000B
        DECLE   $0004,  $0003,  $0000           ; 640C   0004 0003 0000

        SETC                                    ; 640F   0007
        INCR    R2                              ; 6410   000A
        INCR    R5                              ; 6411   000D
L_6412:
        DECR    R7                              ; 6412   0017

        DECLE   $000B,  $0006,  $0003,  $0000   ; 6413   000B 0006 0003 0000
        DECLE   $0000                           ; 6417   0000

        INCR    R6                              ; 6418   000E
        RRC     R3,     2                       ; 6419   0077
        INCR    R7                              ; 641A   000F
        INCR    R7                              ; 641B   000F

L_641C:
        RRC     R3,     2                       ; 641C   0077
L_641D:
        INCR    R6                              ; 641D   000E
        DECLE   $0000,  $0000,  $004E,  $0037   ; 641E   0000 0000 004E 0037

        INCR    R7                              ; 6422   000F

        SETC                                    ; 6423   0007
L_6424:
        COMR    R3                              ; 6424   001B
        DECLE   $0026,  $0000,  $0000,  $0001   ; 6425   0026 0000 0000 0001
        DECLE   $0001,  $007E,  $007E,  $0001   ; 6429   0001 007E 007E 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 642D   0001 0000 0000 0001
        DECLE   $001D,  $003F,  $0007,  $0000   ; 6431   001D 003F 0007 0000
        DECLE   $0001,  $0000,  $0000,  $0008   ; 6435   0001 0000 0000 0008
        DECLE   $001C,  $0036,  $0036,  $001C   ; 6439   001C 0036 0036 001C
        DECLE   $0008,  $0000,  $0000,  $0002   ; 643D   0008 0000 0000 0002
        DECLE   $000C,  $001A,  $000E,  $001C   ; 6441   000C 001A 000E 001C
        DECLE   $0008,  $0000,  $001C,  $007E   ; 6445   0008 0000 001C 007E
        DECLE   $00FE,  $00F7,  $0077,  $0037   ; 6449   00FE 00F7 0077 0037
        DECLE   $0037,  $0037,  $002C,  $0016   ; 644D   0037 0037 002C 0016
        DECLE   $001F,  $002A,  $0075,  $002D   ; 6451   001F 002A 0075 002D
        DECLE   $001B,  $000B,  $0018,  $003C   ; 6455   001B 000B 0018 003C
        DECLE   $003E,  $00DE,  $000F,  $000F   ; 6459   003E 00DE 000F 000F
        DECLE   $0036,  $0000,  $0000           ; 645D   0036 0000 0000

        GSWD    R0                              ; 6460   0030
        SARC    R0,     2                       ; 6461   007C
        RSWD    R6                              ; 6462   003E
        SLLC    R3,     2                       ; 6463   005F
        MOVR    R0,     R7                      ; 6464   0087

        DECLE   $000A,  $0010,  $0000,  $00E8   ; 6465   000A 0010 0000 00E8
        DECLE   $0048,  $0048,  $0048,  $004A   ; 6469   0048 0048 0048 004A
        DECLE   $004E,  $0000,  $0081,  $00C3   ; 646D   004E 0000 0081 00C3
        DECLE   $0066,  $003C,  $0018,  $0018   ; 6471   0066 003C 0018 0018
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6475   0000 0000 0018 0018
        DECLE   $003C,  $0066,  $00C3,  $0081   ; 6479   003C 0066 00C3 0081
        DECLE   $0000,  $0000,  $007F,  $0030   ; 647D   0000 0000 007F 0030
        DECLE   $00B8,  $00F4,  $00B8,  $0030   ; 6481   00B8 00F4 00B8 0030
        DECLE   $007F,  $0000,  $0020,  $0010   ; 6485   007F 0000 0020 0010
        DECLE   $0000,  $00C0,  $0000,  $0010   ; 6489   0000 00C0 0000 0010
        DECLE   $0020,  $0000,  $0020,  $0010   ; 648D   0020 0000 0020 0010
        DECLE   $0008,  $00F0,  $0008,  $0010   ; 6491   0008 00F0 0008 0010
        DECLE   $0020,  $0000,  $0000,  $0010   ; 6495   0020 0000 0000 0010
        DECLE   $0008,  $00FC,  $0008,  $0010   ; 6499   0008 00FC 0008 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 649D   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 64A1   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 64A5   0000 0000 0000 0060
        DECLE   $0000,  $0006,  $0000,  $0060   ; 64A9   0000 0006 0000 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64AD   0000 0000 0000 0000
        DECLE   $0000,  $000A,  $0071,  $0038   ; 64B1   0000 000A 0071 0038
        DECLE   $00B4,  $00E0,  $00B0,  $0038   ; 64B5   00B4 00E0 00B0 0038
        DECLE   $0060,  $0019,  $0004,  $0000   ; 64B9   0060 0019 0004 0000
        DECLE   $0000,  $0000,  $0008,  $0012   ; 64BD   0000 0000 0008 0012
        DECLE   $0001,  $0048,  $0030,  $0012   ; 64C1   0001 0048 0030 0012
        DECLE   $00A0,  $00C0,  $00A0,  $0030   ; 64C5   00A0 00C0 00A0 0030
        DECLE   $0012,  $0058,  $0000,  $0021   ; 64C9   0012 0058 0000 0021
        DECLE   $0010,  $0004,  $0004,  $0002   ; 64CD   0010 0004 0004 0002
        DECLE   $0006,  $00F9,  $0006,  $000A   ; 64D1   0006 00F9 0006 000A
        DECLE   $0001,  $0000,  $0000,  $0000   ; 64D5   0001 0000 0000 0000
        DECLE   $0000,  $0008,  $0004,  $0002   ; 64D9   0000 0008 0004 0002
        DECLE   $001A,  $000C,  $001E,  $00E5   ; 64DD   001A 000C 001E 00E5
        DECLE   $000E,  $001C,  $002A,  $0002   ; 64E1   000E 001C 002A 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E5   0000 0000 0000 0000
        DECLE   $0008,  $0004,  $0004,  $0022   ; 64E9   0008 0004 0004 0022
        DECLE   $001A,  $000E,  $0015,  $002E   ; 64ED   001A 000E 0015 002E
        DECLE   $0037,  $001D,  $002E,  $007A   ; 64F1   0037 001D 002E 007A
        DECLE   $002A,  $0000,  $0000,  $0004   ; 64F5   002A 0000 0000 0004
        DECLE   $0000,  $0020,  $0001,  $0000   ; 64F9   0000 0020 0001 0000
        DECLE   $0004                           ; 64FD   0004

        INCR    R2                              ; 64FE   000A
        EIS                                     ; 64FF   0002

        JSRD    R4,     .EXEC.008               ; 6500   0004 0012 0008
        DECLE   $0001,  $0000,  $0020,  $0002   ; 6503   0001 0000 0020 0002
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6507   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; 650B   0000 0000 00FF 0000
        DECLE   $0004,  $0008,  $0010,  $0020   ; 650F   0004 0008 0010 0020
        DECLE   $0040,  $0080,  $0001,  $0002   ; 6513   0040 0080 0001 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; 6517   0004 0008 0010 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 651B   0000 0000 0000 0000
        DECLE   $0008,  $0010,  $0021,  $0042   ; 651F   0008 0010 0021 0042
        DECLE   $0084,  $0008,  $0010,  $0000   ; 6523   0084 0008 0010 0000
        DECLE   $006E,  $006E,  $00F8,  $00F8   ; 6527   006E 006E 00F8 00F8
        DECLE   $00F8,  $00F8,  $006E,  $006E   ; 652B   00F8 00F8 006E 006E
        DECLE   $0000,  $0000,  $006E,  $006E   ; 652F   0000 0000 006E 006E
        DECLE   $00F8,  $00F8,  $006E,  $006E   ; 6533   00F8 00F8 006E 006E
        DECLE   $0000,  $0000,  $0000,  $0060   ; 6537   0000 0000 0000 0060
        DECLE   $00F0,  $0060,  $0000,  $0000   ; 653B   00F0 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 653F   0000 0000 0000 0010
        DECLE   $0038,  $0010,  $0000,  $0000   ; 6543   0038 0010 0000 0000
        DECLE   $0008,  $001C,  $0048,  $00E0   ; 6547   0008 001C 0048 00E0
        DECLE   $0042,  $0007,  $0002,  $0000   ; 654B   0042 0007 0002 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 654F   0000 0000 0040 0040
        DECLE   $00E0,  $00E0,  $0040,  $0040   ; 6553   00E0 00E0 0040 0040
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6557   0000 00FF 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 655B   0000 00FF 0000 0000
        DECLE   $0000,  $0010,  $0030,  $0010   ; 655F   0000 0010 0030 0010
        DECLE   $0010,  $0010,  $0038,  $0000   ; 6563   0010 0010 0038 0000
        DECLE   $0000,  $0038,  $0020,  $0030   ; 6567   0000 0038 0020 0030
        DECLE   $0008,  $0008,  $0030,  $0000   ; 656B   0008 0008 0030 0000
        DECLE   $0000,  $004A,  $00D5,  $0055   ; 656F   0000 004A 00D5 0055
        DECLE   $0055,  $0055,  $00EA,  $0000   ; 6573   0055 0055 00EA 0000
        DECLE   $0000,  $0044,  $00CA,  $004A   ; 6577   0000 0044 00CA 004A
        DECLE   $004A,  $004A,  $00E4,  $0000   ; 657B   004A 004A 00E4 0000
        DECLE   $0000,  $0044,  $00AA,  $002A   ; 657F   0000 0044 00AA 002A
        DECLE   $004A,  $008A,  $00E4,  $0000   ; 6583   004A 008A 00E4 0000
        DECLE   $0000,  $004E,  $00A8,  $002C   ; 6587   0000 004E 00A8 002C
        DECLE   $0042,  $0082,  $00EC,  $0000   ; 658B   0042 0082 00EC 0000
        DECLE   $0000,  $00E4,  $008A,  $00CA   ; 658F   0000 00E4 008A 00CA
        DECLE   $002A,  $002A,  $00C4,  $0000   ; 6593   002A 002A 00C4 0000
        DECLE   $0000,  $00EE,  $0028,  $002C   ; 6597   0000 00EE 0028 002C
        DECLE   $0042,  $0042,  $004C,  $0000   ; 659B   0042 0042 004C 0000

        INCR    R3                              ; 659F   000B
        MOVR    R3,     R7                      ; 65A0   009F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 65A1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0080,  $00E0   ; 65A5   00FF 00FF 0080 00E0
        DECLE   $00F8,  $00F0,  $00FC,  $00F4   ; 65A9   00F8 00F0 00FC 00F4
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 65AD   00F8 00FC 00FE 00FF

        ADDR    R7,     R6                      ; 65B1   00FE
        ADDR    R7,     R4                      ; 65B2   00FC
        ADDR    R7,     R6                      ; 65B3   00FE
        SARC    R3,     2                       ; 65B4   007F
        ADCR    R7                              ; 65B5   002F

        MOVR    R0,     R6                      ; 65B6   0086
L_65B7:
        ADDR    R7,     R6                      ; 65B7   00FE
        DECLE   $00FC,  $00F0,  $00F8,  $00F8   ; 65B8   00FC 00F0 00F8 00F8
        DECLE   $00EC,  $00E0,  $00C0,  $00FF   ; 65BC   00EC 00E0 00C0 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 65C0   00FF 00FF 00FF 00FF

        ADDR    R7,     R6                      ; 65C4   00FE
        ADDR    R5,     R7                      ; 65C5   00EF

        DECLE   $0086,  $0000,  $0000,  $0000   ; 65C6   0086 0000 0000 0000
        DECLE   $0000,  $0000                   ; 65CA   0000 0000

        DECR    R0                              ; 65CC   0010
        RSWD    R2                              ; 65CD   003A
        ADDR    R3,     R7                      ; 65CE   00DF

        DECLE   $0080,  $00C0,  $00F0,  $00FC   ; 65CF   0080 00C0 00F0 00FC
        DECLE   $00F8,  $00FE,  $00FC,  $00F8   ; 65D3   00F8 00FE 00FC 00F8
        DECLE   $00E0,  $00F0,  $00E0,  $0080   ; 65D7   00E0 00F0 00E0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DB   0000 0000 0000 0000
        DECLE   $0040,  $0020,  $0060,  $00F0   ; 65DF   0040 0020 0060 00F0
        DECLE   $0078,  $0038,  $003C,  $0074   ; 65E3   0078 0038 003C 0074
        DECLE   $00EE,  $00CC,  $009C,  $0018   ; 65E7   00EE 00CC 009C 0018
        DECLE   $0038,  $0070,  $00F0,  $00C0   ; 65EB   0038 0070 00F0 00C0
        DECLE   $0000,  $0001,  $0007,  $000F   ; 65EF   0000 0001 0007 000F
        DECLE   $001E,  $001F                   ; 65F3   001E 001F

        RSWD    R6                              ; 65F5   003E
        SARC    R1,     2                       ; 65F6   007D
        MOVR    R1,     R0                      ; 65F7   0088
        COMR    R0                              ; 65F8   0018
        GSWD    R0                              ; 65F9   0030
        GSWD    R0                              ; 65FA   0030
        SLR     R0,     1                       ; 65FB   0060
        ADDR    R4,     R0                      ; 65FC   00E0
        ADDR    R4,     R0                      ; 65FD   00E0
        ADDR    R0,     R0                      ; 65FE   00C0
        SARC    R3,     1                       ; 65FF   007B
        ADDR    R4,     R7                      ; 6600   00E7

        MOVR    R1,     R6                      ; 6601   008E
        COMR    R6                              ; 6602   001E
        RSWD    R4                              ; 6603   003C
        ADDR    R7,     R0                      ; 6604   00F8
        SARC    R1,     2                       ; 6605   007D
        SARC    R3,     1                       ; 6606   007B
        ADDR    R4,     R7                      ; 6607   00E7
        MOVR    R0,     R7                      ; 6608   0087

        DECLE   $000C,  $0078,  $00F0,  $00E0   ; 6609   000C 0078 00F0 00E0
        DECLE   $00C0,  $0080,  $0001,  $0007   ; 660D   00C0 0080 0001 0007
        DECLE   $0000,  $0000,  $0001,  $000F   ; 6611   0000 0000 0001 000F
        DECLE   $003F,  $007F,  $00FF,  $00FE   ; 6615   003F 007F 00FF 00FE
        DECLE   $00EC,  $00DC,  $0038,  $00F0   ; 6619   00EC 00DC 0038 00F0
        DECLE   $00C0,  $0000,  $0000,  $00F3   ; 661D   00C0 0000 0000 00F3
        DECLE   $00FF,  $00DE,  $0000,  $0000   ; 6621   00FF 00DE 0000 0000
        DECLE   $0003,  $003F,  $007B,  $00FD   ; 6625   0003 003F 007B 00FD
        DECLE   $003F,  $0007,  $0000,  $0000   ; 6629   003F 0007 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 662D   0000 0000 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6631   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6635   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6639   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 663D   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0030,  $0000   ; 6641   0030 0000 0030 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 6645   0000 0000 0030 0000
        DECLE   $0030,  $0000,  $0030,  $0000   ; 6649   0030 0000 0030 0000
        DECLE   $0030,  $0000,  $0000,  $0000   ; 664D   0030 0000 0000 0000
        DECLE   $0002,  $0007,  $000F,  $001F   ; 6651   0002 0007 000F 001F
        DECLE   $003F,  $007F,  $00FF,  $007F   ; 6655   003F 007F 00FF 007F
        DECLE   $003F,  $001F                   ; 6659   003F 001F

        INCR    R7                              ; 665B   000F

        SETC                                    ; 665C   0007
L_665D:
        EIS                                     ; 665D   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665E   0000 0000 0000 0000
        DECLE   $0006,  $001F,  $007F,  $003F   ; 6662   0006 001F 007F 003F
        DECLE   $001F,  $000F,  $001F,  $003F   ; 6666   001F 000F 001F 003F
        DECLE   $007F,  $001F,  $0006,  $0000   ; 666A   007F 001F 0006 0000
        DECLE   $0000,  $0004,  $000C,  $000E   ; 666E   0000 0004 000C 000E
        DECLE   $001E,  $001C,  $001C,  $003E   ; 6672   001E 001C 001C 003E
        DECLE   $003E,  $003E,  $003E,  $001C   ; 6676   003E 003E 003E 001C
        DECLE   $001C,  $001E,  $000E,  $000C   ; 667A   001C 001E 000E 000C
        DECLE   $0004,  $0000,  $0000,  $0018   ; 667E   0004 0000 0000 0018
        DECLE   $0038,  $003C,  $0076,  $0067   ; 6682   0038 003C 0076 0067
        DECLE   $00F3,  $00F3,  $00F3,  $0067   ; 6686   00F3 00F3 00F3 0067
        DECLE   $0076,  $003C,  $0038,  $0018   ; 668A   0076 003C 0038 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6692   0000 0000 0000 001E
        DECLE   $007F,  $00FF,  $007F,  $001E   ; 6696   007F 00FF 007F 001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A2   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0003   ; 66A6   0000 0007 0007 0003
        DECLE   $0003,  $0001,  $0001,  $0000   ; 66AA   0003 0001 0001 0000
        DECLE   $0000,  $007F,  $007F,  $003F   ; 66AE   0000 007F 007F 003F
        DECLE   $003F,  $003F,  $001F,  $001F   ; 66B2   003F 003F 001F 001F
        DECLE   $001F                           ; 66B6   001F

        INCR    R7                              ; 66B7   000F
        INCR    R7                              ; 66B8   000F
L_66B9:
        INCR    R7                              ; 66B9   000F

L_66BA:
        SETC                                    ; 66BA   0007
L_66BB:
        SETC                                    ; 66BB   0007
        DECLE   $0007,  $0007,  $0003,  $0003   ; 66BC   0007 0007 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0001   ; 66C0   0003 0003 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 66C4   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 66C8   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D0   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000           ; 66D4   0002 0000 0000
L_66D7:
        CLRR    R0                              ; 66D7   01C0
        B       L_66DC                          ; 66D8   0200 0002

L_66DA:
        ADDR    R2,     R0                      ; 66DA   00D0
L_66DB:
        ADDR    R2,     R2                      ; 66DB   00D2
L_66DC:
        SARC    R1,     1                       ; 66DC   0079
        BC      L_66DA                          ; 66DD   0221 0004
        BNEQ    L_66DB                          ; 66DF   022C 0005
        MOVR    R4,     R7                      ; 66E1   00A7

L_66E2:
        CLRR    R0                              ; 66E2   01C0
        MOVR    R2,     R3                      ; 66E3   0093
L_66E4:
        ADDR    R2,     R2                      ; 66E4   00D2
        CMPR    R2,     R1                      ; 66E5   0151
        BC      L_66E4                          ; 66E6   0221 0003

L_66E8:
        ADDR    R0,     R0                      ; 66E8   00C0
        SARC    R2,     1                       ; 66E9   007A
        CMPR    R2,     R1                      ; 66EA   0151
        BNC     L_66EF                          ; 66EB   0209 0002

        SUBR    R2,     R1                      ; 66ED   0111
        INCR    R0                              ; 66EE   0008
L_66EF:
        CMPR    R2,     R3                      ; 66EF   0153
        BNEQ    L_66E8                          ; 66F0   022C 0009
        MOVR    R4,     R7                      ; 66F2   00A7

L_66F3:
        CLRR    R5                              ; 66F3   01ED
        MVI     G_0352, R0                      ; 66F4   0280 0352
L_66F6:
        MOVR    R0,     R2                      ; 66F6   0082
        MOVR    R0,     R3                      ; 66F7   0083
        SARC    R3,     2                       ; 66F8   007F
        SARC    R3,     2                       ; 66F9   007F
        XORR    R3,     R2                      ; 66FA   01DA
        SWAP    R3,     1                       ; 66FB   0043
        SARC    R3,     1                       ; 66FC   007B
        XORR    R3,     R2                      ; 66FD   01DA
        SARC    R3,     2                       ; 66FE   007F
        XORR    R3,     R2                      ; 66FF   01DA
        SARC    R2,     1                       ; 6700   007A
        RLC     R0,     1                       ; 6701   0050
        ADDR    R5,     R5                      ; 6702   00ED
        INCR    R5                              ; 6703   000D
        DECR    R1                              ; 6704   0011
        BNEQ    L_66F6                          ; 6705   022C 0010

        MVO     R0,     G_0352                  ; 6707   0240 0352
        ANDR    R5,     R0                      ; 6709   01A8
        MOVR    R4,     R7                      ; 670A   00A7

L_670B:
        PSHR    R4                              ; 670B   0274
        MVII    #$0317, R1                      ; 670C   02B9 0317
        MVII    #$033F, R5                      ; 670E   02BD 033F
        MVII    #$032F, R3                      ; 6710   02BB 032F
        MVII    #$00FF, R2                      ; 6712   02BA 00FF
L_6714:
        MVI@    R3,     R0                      ; 6714   0298
        ADD@    R5,     R0                      ; 6715   02E8
        MVO@    R0,     R3                      ; 6716   0258
        SWAP    R0,     1                       ; 6717   0040
        ANDR    R2,     R0                      ; 6718   0190
        MVI@    R1,     R4                      ; 6719   028C
        COMR    R2                              ; 671A   001A
        ANDR    R2,     R4                      ; 671B   0194
        COMR    R2                              ; 671C   001A
        ADDR    R0,     R4                      ; 671D   00C4
        MVO@    R4,     R1                      ; 671E   024C
        INCR    R1                              ; 671F   0009
        INCR    R3                              ; 6720   000B
        CMPI    #$031F, R1                      ; 6721   0379 031F
        BLT     L_6714                          ; 6723   0225 0010
        BGT     L_6728                          ; 6725   020E 0001

        SLR     R2,     1                       ; 6727   0062
L_6728:
        CMPI    #$0327, R1                      ; 6728   0379 0327
        BLT     L_6714                          ; 672A   0225 0017
        PULR    R7                              ; 672C   02B7

L_672D:
        PSHR    R4                              ; 672D   0274
        CLRR    R0                              ; 672E   01C0
        MVII    #$0317, R1                      ; 672F   02B9 0317
        MVII    #$032F, R4                      ; 6731   02BC 032F
        MVII    #$0337, R5                      ; 6733   02BD 0337
L_6735:
        MVI@    R4,     R2                      ; 6735   02A2
        SWAP    R2,     1                       ; 6736   0042
        MVI@    R5,     R3                      ; 6737   02AB
        SWAP    R3,     1                       ; 6738   0043
        ANDI    #$00FF, R2                      ; 6739   03BA 00FF
        CMPI    #$00A8, R2                      ; 673B   037A 00A8
        BGE     L_6745                          ; 673D   020D 0006

        ANDI    #$00FF, R3                      ; 673F   03BB 00FF
        CMPI    #$0068, R3                      ; 6741   037B 0068
        BLT     L_674B                          ; 6743   0205 0006

L_6745:
        MVO@    R0,     R1                      ; 6745   0248
        SUBI    #$01FF, R1                      ; 6746   0339 01FF
        MVO@    R0,     R1                      ; 6748   0248
        ADDI    #$01FF, R1                      ; 6749   02F9 01FF
L_674B:
        INCR    R1                              ; 674B   0009
        CMPI    #$031E, R1                      ; 674C   0379 031E
        BLE     L_6735                          ; 674E   0226 001A
        PULR    R7                              ; 6750   02B7

L_6751:
        PSHR    R4                              ; 6751   0274
        CLRR    R4                              ; 6752   01E4
        MVII    #$0118, R1                      ; 6753   02B9 0118
L_6755:
        MVI@    R1,     R2                      ; 6755   028A
        MOVR    R2,     R3                      ; 6756   0093
        ANDI    #$0007, R3                      ; 6757   03BB 0007
        BEQ     L_683D                          ; 6759   0204 00E2

        DECR    R2                              ; 675B   0012
        MVO@    R2,     R1                      ; 675C   024A
        DECR    R3                              ; 675D   0013
        BNEQ    L_683D                          ; 675E   020C 00DD

        ANDI    #$0020, R2                      ; 6760   03BA 0020
        BNEQ    L_684A                          ; 6762   020C 00E6

L_6764:
        MOVR    R4,     R2                      ; 6764   00A2
        ADDI    #$0110, R2                      ; 6765   02FA 0110
        MVI@    R2,     R3                      ; 6767   0293
        INCR    R3                              ; 6768   000B
        MVO@    R3,     R2                      ; 6769   0253
        SDBD                                    ; 676A   0001
        ADDI    #$688C, R3                      ; 676B   02FB 008C 0068
        MVI@    R3,     R0                      ; 676E   0298
        ANDI    #$0300, R0                      ; 676F   03B8 0300
        BNEQ    L_6783                          ; 6771   020C 0010

        XOR@    R3,     R0                      ; 6773   03D8
        ANDI    #$0007, R0                      ; 6774   03B8 0007
        ADD@    R1,     R0                      ; 6776   02C8
        MVO@    R0,     R1                      ; 6777   0248
        MVI@    R3,     R0                      ; 6778   0298
        ANDI    #$00F8, R0                      ; 6779   03B8 00F8
        SLR     R0,     1                       ; 677B   0060
        ADDI    #$0008, R1                      ; 677C   02F9 0008
        MVO@    R0,     R1                      ; 677E   0248
        SUBI    #$0008, R1                      ; 677F   0339 0008
        B       L_683D                          ; 6781   0200 00BA

L_6783:
        CMPI    #$0200, R0                      ; 6783   0378 0200
        BGE     L_678F                          ; 6785   020D 0008

L_6787:
        CLRR    R0                              ; 6787   01C0
        MVO@    R0,     R1                      ; 6788   0248
        MOVR    R4,     R2                      ; 6789   00A2
        ADDI    #$0317, R2                      ; 678A   02FA 0317
        MVO@    R0,     R2                      ; 678C   0250
        B       L_683D                          ; 678D   0200 00AE
L_678F:
        BGT     L_681A                          ; 678F   020E 0089

        MVI@    R3,     R0                      ; 6791   0298
        CMPI    #$02FF, R0                      ; 6792   0378 02FF
        BNEQ    L_67BB                          ; 6794   020C 0025

        MVI     G_0106, R2                      ; 6796   0282 0106
        DECR    R2                              ; 6798   0012
        MVO     R2,     G_0106                  ; 6799   0242 0106
        BNEQ    L_679F                          ; 679B   020C 0002

        MVO     R2,     G_0108                  ; 679D   0242 0108
L_679F:
        CLRR    R0                              ; 679F   01C0
        MVO     R0,     G_0103                  ; 67A0   0240 0103
        COMR    R0                              ; 67A2   0018
        MVO     R0,     G_0102                  ; 67A3   0240 0102
        MVII    #$0060, R0                      ; 67A5   02B8 0060
        MVO     R0,     G_035A                  ; 67A7   0240 035A
L_67A9:
        MVI     G_0102, R0                      ; 67A9   0280 0102
        TSTR    R0                              ; 67AB   0080
        BNEQ    L_67A9                          ; 67AC   022C 0004

        TSTR    R2                              ; 67AE   0092
        BEQ     L_67B7                          ; 67AF   0204 0006

        CLRR    R3                              ; 67B1   01DB
        MVII    #$0001, R1                      ; 67B2   02B9 0001

        JSR     R4,     L_604D                  ; 67B4   0004 0060 004D
L_67B7:
        JSR     R4,     L_5AB2                  ; 67B7   0004 0058 02B2

        PULR    R7                              ; 67BA   02B7

L_67BB:
        CMPI    #$02FE, R0                      ; 67BB   0378 02FE
        BNEQ    L_67C6                          ; 67BD   020C 0007

        PSHR    R4                              ; 67BF   0274

        JSR     R4,     L_5509                  ; 67C0   0004 0054 0109

        PULR    R4                              ; 67C3   02B4
        B       L_6764                          ; 67C4   0220 0061

L_67C6:
        CMPI    #$0280, R0                      ; 67C6   0378 0280
        BLT     L_67CE                          ; 67C8   0205 0004

        XOR@    R1,     R0                      ; 67CA   03C8
        MVO@    R0,     R1                      ; 67CB   0248
        B       L_6764                          ; 67CC   0220 0069

L_67CE:
        XOR@    R1,     R0                      ; 67CE   03C8
        MVO@    R0,     R1                      ; 67CF   0248
        MOVR    R1,     R2                      ; 67D0   008A
        ADDI    #$009A, R2                      ; 67D1   02FA 009A
        MVI@    R2,     R2                      ; 67D3   0292
        TSTR    R2                              ; 67D4   0092
        BEQ     L_6787                          ; 67D5   0224 004F

        SUBI    #$0024, R2                      ; 67D7   033A 0024
        SLR     R2,     1                       ; 67D9   0062
        SDBD                                    ; 67DA   0001
        ADDI    #$67F2, R2                      ; 67DB   02FA 00F2 0067
        MVI@    R2,     R2                      ; 67DE   0292
        ADDI    #$0008, R1                      ; 67DF   02F9 0008
        MVO@    R2,     R1                      ; 67E1   024A
        SUBI    #$0010, R1                      ; 67E2   0339 0010
        MVII    #$002C, R2                      ; 67E4   02BA 002C
        MVO@    R2,     R1                      ; 67E6   024A
        ADDI    #$020F, R1                      ; 67E7   02F9 020F
        MVI@    R1,     R2                      ; 67E9   028A
        ANDI    #$007F, R2                      ; 67EA   03BA 007F
        MVO@    R2,     R1                      ; 67EC   024A
        SUBI    #$0207, R1                      ; 67ED   0339 0207
        B       L_683D                          ; 67EF   0200 004C

        DECLE   $0000,  $0084,  $0005,  $008C   ; 67F1   0000 0084 0005 008C
        DECLE   $000A,  $0090,  $0014,  $0090   ; 67F5   000A 0090 0014 0090
        DECLE   $0014,  $0098,  $0032,  $0098   ; 67F9   0014 0098 0032 0098
        DECLE   $0032,  $0094,  $0019,  $0094   ; 67FD   0032 0094 0019 0094
        DECLE   $0019,  $0080,  $0001,  $0084   ; 6801   0019 0080 0001 0084
        DECLE   $0005,  $0084,  $0005,  $008C   ; 6805   0005 0084 0005 008C
        DECLE   $000A,  $0000,  $0000           ; 6809   000A 0000 0000

        MOVR    R1,     R4                      ; 680C   008C
        INCR    R2                              ; 680D   000A
        MOVR    R1,     R4                      ; 680E   008C
        INCR    R2                              ; 680F   000A
        MOVR    R2,     R4                      ; 6810   0094
        COMR    R1                              ; 6811   0019
        MOVR    R3,     R4                      ; 6812   009C
        SLL     R3,     1                       ; 6813   004B
        MOVR    R3,     R0                      ; 6814   0098
        GSWD    R2                              ; 6815   0032
        MOVR    R2,     R0                      ; 6816   0090
        DECR    R4                              ; 6817   0014
        MOVR    R1,     R0                      ; 6818   0088
        SLR     R0,     2                       ; 6819   0064
L_681A:
        XOR@    R3,     R0                      ; 681A   03D8
        MOVR    R0,     R2                      ; 681B   0082
        ANDI    #$0007, R0                      ; 681C   03B8 0007
        XORR    R0,     R2                      ; 681E   01C2
        SWAP    R2,     1                       ; 681F   0042
        SLR     R2,     1                       ; 6820   0062
        MOVR    R2,     R3                      ; 6821   0093
        SDBD                                    ; 6822   0001
        ANDI    #$1000, R2                      ; 6823   03BA 0000 0010
        XORR    R2,     R3                      ; 6826   01D3
        XORR    R2,     R0                      ; 6827   01D0
        SLR     R3,     2                       ; 6828   0067
        SLR     R3,     1                       ; 6829   0063
        MOVR    R4,     R2                      ; 682A   00A2
        ADDI    #$0327, R2                      ; 682B   02FA 0327
        MVI@    R2,     R5                      ; 682D   0295
        SDBD                                    ; 682E   0001
        ANDI    #$EFF8, R5                      ; 682F   03BD 00F8 00EF
        XORR    R0,     R5                      ; 6832   01C5
        MVO@    R5,     R2                      ; 6833   0255
        SUBI    #$0008, R2                      ; 6834   033A 0008
        MVI@    R2,     R5                      ; 6836   0295
        ANDI    #$027F, R5                      ; 6837   03BD 027F
        XORR    R3,     R5                      ; 6839   01DD
        MVO@    R5,     R2                      ; 683A   0255
        B       L_6764                          ; 683B   0220 00D8

L_683D:
        INCR    R1                              ; 683D   0009
        INCR    R4                              ; 683E   000C
        CMPI    #$0007, R4                      ; 683F   037C 0007
        BLE     L_6755                          ; 6841   0226 00ED
        PULR    R7                              ; 6843   02B7
L_6844:
        DECR    R7                              ; 6844   0017

        NEGR    R2                              ; 6845   0022
        GSWD    R3                              ; 6846   0033
        ADCR    R6                              ; 6847   002E
        COMR    R5                              ; 6848   001D
        RSWD    R1                              ; 6849   0039
L_684A:
        MOVR    R1,     R3                      ; 684A   008B
        ADDI    #$0008, R3                      ; 684B   02FB 0008
        MVI@    R3,     R2                      ; 684D   029A
        SLR     R2,     2                       ; 684E   0066
        SDBD                                    ; 684F   0001
        ADDI    #$682B, R2                      ; 6850   02FA 002B 0068
        MVI@    R2,     R3                      ; 6853   0293
        ANDI    #$0007, R3                      ; 6854   03BB 0007
        XOR@    R1,     R3                      ; 6856   03CB
        MVO@    R3,     R1                      ; 6857   024B
        MVI@    R2,     R3                      ; 6858   0293
        ANDI    #$0078, R3                      ; 6859   03BB 0078
        SLL     R3,     2                       ; 685B   004F
        SLL     R3,     2                       ; 685C   004F
        NEGR    R3                              ; 685D   0023
        ADDI    #$0227, R1                      ; 685E   02F9 0227
        MVO@    R3,     R1                      ; 6860   024B
        SUBI    #$0008, R1                      ; 6861   0339 0008
        MVI@    R1,     R0                      ; 6863   0288
        SAR     R3,     2                       ; 6864   006F
        SUB     G_0337, R0                      ; 6865   0300 0337
        BPL     L_686A                          ; 6867   0203 0001

        NEGR    R3                              ; 6869   0023
L_686A:
        ADDI    #$0010, R1                      ; 686A   02F9 0010
        ADD@    R1,     R3                      ; 686C   02CB
        MVO@    R3,     R1                      ; 686D   024B
        SUBI    #$0018, R1                      ; 686E   0339 0018
        MVI@    R1,     R0                      ; 6870   0288
        SUBI    #$0217, R1                      ; 6871   0339 0217
        SUB     G_032F, R0                      ; 6873   0300 032F
        SDBD                                    ; 6875   0001
        CMPI    #$0800, R0                      ; 6876   0378 0000 0008
        BGT     L_683D                          ; 6879   022E 003D

        MVII    #$0081, R0                      ; 687B   02B8 0081
        MVO@    R0,     R1                      ; 687D   0248
        MVII    #$0024, R0                      ; 687E   02B8 0024
        MOVR    R1,     R2                      ; 6880   008A
        SUBI    #$0008, R2                      ; 6881   033A 0008
        MVO@    R0,     R2                      ; 6883   0250
        CLRR    R0                              ; 6884   01C0
        ADDI    #$022F, R2                      ; 6885   02FA 022F
        MVO@    R0,     R2                      ; 6887   0250
        ADDI    #$0008, R2                      ; 6888   02FA 0008
        MVO@    R0,     R2                      ; 688A   0250
        B       L_683D                          ; 688B   0220 004F

        ADCR    R1                              ; 688D   0029
        GSWD    R1                              ; 688E   0031
        RSWD    R1                              ; 688F   0039
        SWAP    R0,     1                       ; 6890   0040
        RRC     R3,     1                       ; 6891   0073
        SUB@    R1,     R7                      ; 6892   030F

        SARC    R3,     2                       ; 6893   007F
        MVI     G_030A, R0                      ; 6894   0280 030A
        MOVR    R1,     R7                      ; 6896   008F
        MOVR    R3,     R7                      ; 6897   009F
        SUB     .BTAB.07,R7                     ; 6898   0307 0207

        SLL     R2,     2                       ; 689A   004E
        SLL     R3,     2                       ; 689B   004F
        CMP@    R1,     R7                      ; 689C   034F
        SARC    R3,     2                       ; 689D   007F
        ADDI    #$02C0, R6                      ; 689E   02FE 02C0
        CMP@    R1,     R2                      ; 68A0   034A
        MOVR    R1,     R7                      ; 68A1   008F
        MOVR    R3,     R7                      ; 68A2   009F
        SUB     .BTAB.07,R7                     ; 68A3   0307 0207
        SUB@    R1,     R7                      ; 68A5   030F

        RLC     R3,     2                       ; 68A6   0057
        SUB@    R1,     R6                      ; 68A7   030E
        RLC     R3,     2                       ; 68A8   0057
        SUB@    R5,     R2                      ; 68A9   032A
        SLR     R3,     2                       ; 68AA   0067
        SUB@    R1,     R2                      ; 68AB   030A
        SLR     R1,     2                       ; 68AC   0065
        MOVR    R3,     R7                      ; 68AD   009F
        SUB@    R5,     R7                      ; 68AE   032F
        MOVR    R3,     R7                      ; 68AF   009F

        DECLE   $02FF,  $03CF,  $0079,  $03CE   ; 68B0   02FF 03CF 0079 03CE
        DECLE   $0079,  $03EC,  $008B,  $03EF   ; 68B4   0079 03EC 008B 03EF
        DECLE   $009C,  $0100,  $0019,  $0016   ; 68B8   009C 0100 0019 0016
        DECLE   $0080,  $0113,  $020D,  $00B5   ; 68BC   0080 0113 020D 00B5
        DECLE   $0069,  $0029,  $0069,  $0016   ; 68C0   0069 0029 0069 0016
        DECLE   $0016,  $00E6,  $00F2,  $01CE   ; 68C4   0016 00E6 00F2 01CE
        DECLE   $0042,  $006B,  $00C8,  $006A   ; 68C8   0042 006B 00C8 006A
        DECLE   $000A,  $0020,  $00C4,  $00A0   ; 68CC   000A 0020 00C4 00A0
        DECLE   $0136,  $00AA,  $006C,  $0034   ; 68D0   0136 00AA 006C 0034
        DECLE   $006C,  $0016,  $0014,  $00CE   ; 68D4   006C 0016 0014 00CE
        DECLE   $00DC,  $01A2,  $00CA,  $006D   ; 68D8   00DC 01A2 00CA 006D
        DECLE   $004A,  $006D,  $002C,  $000A   ; 68DC   004A 006D 002C 000A
        DECLE   $00C6,  $00DC,  $018C,  $001E   ; 68E0   00C6 00DC 018C 001E
        DECLE   $006F,  $00A6,  $006E,  $000B   ; 68E4   006F 00A6 006E 000B
        DECLE   $000B,  $0010,  $000A,  $0005   ; 68E8   000B 0010 000A 0005
L_68EC:
        PSHR    R4                              ; 68EC   0274
L_68ED:
        MVII    #$0003, R1                      ; 68ED   02B9 0003

        JSR     R4,     L_66F3                  ; 68EF   0004 0064 02F3

        CMPI    #$0004, R0                      ; 68F2   0378 0004
        BGT     L_68ED                          ; 68F4   022E 0008

        CMP     G_0132, R0                      ; 68F6   0340 0132
        BEQ     L_68ED                          ; 68F8   0224 000C

        MVO     R0,     G_0132                  ; 68FA   0240 0132
        MVI     G_0108, R5                      ; 68FC   0285 0108
        MVO     R5,     G_01C1                  ; 68FE   0245 01C1
        MVII    #$0066, R5                      ; 6900   02BD 0066
        MVO     R5,     G_0108                  ; 6902   0245 0108
        MOVR    R0,     R5                      ; 6904   0085
        SLL     R0,     2                       ; 6905   004C
        SLL     R0,     1                       ; 6906   0048
        ADDR    R0,     R5                      ; 6907   00C5
        SDBD                                    ; 6908   0001
        ADDI    #$68BA, R5                      ; 6909   02FD 00BA 0068
        MVI@    R5,     R1                      ; 690C   02A9
        MVII    #$012F, R4                      ; 690D   02BC 012F
        MVO@    R1,     R4                      ; 690F   0261
        MVI@    R5,     R1                      ; 6910   02A9
        MVO@    R1,     R4                      ; 6911   0261
        MVI@    R5,     R1                      ; 6912   02A9
        MVO@    R1,     R4                      ; 6913   0261
        MVI@    R5,     R1                      ; 6914   02A9
        MVII    #$035B, R4                      ; 6915   02BC 035B
        MVO@    R1,     R4                      ; 6917   0261
        MVI@    R5,     R1                      ; 6918   02A9
        MVO@    R1,     R4                      ; 6919   0261
        SDBD                                    ; 691A   0001
        MVI@    R5,     R1                      ; 691B   02A9
        MVO@    R1,     R4                      ; 691C   0261
        SDBD                                    ; 691D   0001
        MVI@    R5,     R1                      ; 691E   02A9
        MVO@    R1,     R4                      ; 691F   0261
        MVII    #$0133, R5                      ; 6920   02BD 0133
        CLRR    R1                              ; 6922   01C9
L_6923:
        MVO@    R1,     R5                      ; 6923   0269
        CMPI    #$01B3, R5                      ; 6924   037D 01B3
        BLT     L_6923                          ; 6926   0225 0004
        PULR    R7                              ; 6928   02B7

        DECLE   $007C,  $0095,  $00E0,  $00F9   ; 6929   007C 0095 00E0 00F9
        DECLE   $0144,  $015D,  $01A8,  $01C1   ; 692D   0144 015D 01A8 01C1
        DECLE   $0109,  $0122,  $0110,  $0129   ; 6931   0109 0122 0110 0129
        DECLE   $00F0,  $013B,  $00F7           ; 6935   00F0 013B 00F7

        CMPR    R0,     R2                      ; 6938   0142
        ADDR    R7,     R5                      ; 6939   00FD
        SUBR    R2,     R6                      ; 693A   0116
        ADCR    R7                              ; 693B   002F

        SLL     R0,     1                       ; 693C   0048
L_693D:
        XORR    R6,     R1                      ; 693D   01F1
        DECLE   $020A,  $0079,  $0092,  $01A5   ; 693E   020A 0079 0092 01A5
        DECLE   $01BE,  $00A6,  $00BF,  $016E   ; 6942   01BE 00A6 00BF 016E
        DECLE   $0187                           ; 6946   0187

        SUBR    R0,     R4                      ; 6947   0104
        SUBR    R3,     R5                      ; 6948   011D
        SWAP    R3,     1                       ; 6949   0043
        XORR    R5,     R4                      ; 694A   01EC
        RRC     R1,     1                       ; 694B   0071
        ANDR    R6,     R6                      ; 694C   01B6
        MOVR    R3,     R7                      ; 694D   009F

        ANDR    R0,     R0                      ; 694E   0180
        ADDR    R1,     R5                      ; 694F   00CD
        CMPR    R1,     R2                      ; 6950   014A
        ADDR    R4,     R4                      ; 6951   00E4
        SUBR    R5,     R7                      ; 6952   012F

        ADDR    R7,     R3                      ; 6953   00FB
        SUBR    R2,     R4                      ; 6954   0114
        MOVR    R1,     R7                      ; 6955   008F

        DECLE   $01A2,  $00D6,  $0153,  $00EC   ; 6956   01A2 00D6 0153 00EC
        DECLE   $0137                           ; 695A   0137

        SUBR    R0,     R2                      ; 695B   0102
        SUBR    R3,     R3                      ; 695C   011B
        ADDR    R0,     R3                      ; 695D   00C3
        ADDR    R3,     R4                      ; 695E   00DC
        CMPR    R3,     R1                      ; 695F   0159
        CMPR    R6,     R2                      ; 6960   0172
        ADDR    R6,     R3                      ; 6961   00F3
        SUBR    R1,     R4                      ; 6962   010C
        SUBR    R4,     R5                      ; 6963   0125
        SUBR    R7,     R6                      ; 6964   013E
        SLLC    R1,     2                       ; 6965   005D
        SLLC    R2,     2                       ; 6966   005E
        RRC     R0,     2                       ; 6967   0074
        RRC     R1,     2                       ; 6968   0075
        MOVR    R1,     R3                      ; 6969   008B
        MOVR    R1,     R4                      ; 696A   008C
        MOVR    R4,     R2                      ; 696B   00A2
        MOVR    R4,     R3                      ; 696C   00A3
        MOVR    R7,     R1                      ; 696D   00B9
        MOVR    R7,     R2                      ; 696E   00BA
        ADDR    R2,     R0                      ; 696F   00D0
        ADDR    R2,     R1                      ; 6970   00D1
        ADDR    R4,     R7                      ; 6971   00E7

        DECLE   $00E8,  $0132,  $0133,  $014D   ; 6972   00E8 0132 0133 014D
        DECLE   $014E,  $0168,  $0169,  $0183   ; 6976   014E 0168 0169 0183
        DECLE   $0184,  $019E,  $019F,  $01B9   ; 697A   0184 019E 019F 01B9
        DECLE   $01BA,  $01D4,  $01D5,  $00F4   ; 697E   01BA 01D4 01D5 00F4
        DECLE   $00F5,  $013F,  $0140,  $0100   ; 6982   00F5 013F 0140 0100
        DECLE   $0119,  $00F2,  $010B,  $0124   ; 6986   0119 00F2 010B 0124
        DECLE   $013D,  $00C5,  $00DE,  $015B   ; 698A   013D 00C5 00DE 015B
        DECLE   $0174,  $0165,  $00B6,  $019B   ; 698E   0174 0165 00B6 019B
        DECLE   $0088,  $005A,  $01D1,  $0207   ; 6992   0088 005A 01D1 0207
        DECLE   $002C,  $0002,  $0022,  $0001   ; 6996   002C 0002 0022 0001
        DECLE   $0022,  $0001,  $0016,  $0001   ; 699A   0022 0001 0016 0001
        DECLE   $0020,  $0000,  $0022,  $0000   ; 699E   0020 0000 0022 0000
        DECLE   $0016,  $0000,  $0020,  $0006   ; 69A2   0016 0000 0020 0006
        DECLE   $0022,  $0006,  $0016,  $0006   ; 69A6   0022 0006 0016 0006
        DECLE   $0020,  $0006,  $0036,  $0005   ; 69AA   0020 0006 0036 0005
        DECLE   $0000,  $0005                   ; 69AE   0000 0005

        DECR    R6                              ; 69B0   0016

        JSRD    R4,     .EXEC.404               ; 69B1   0004 0016 0004
        DECLE   $0036,  $0000,  $0000,  $0000   ; 69B4   0036 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C4   0000 0000 0000 0000
        DECLE   $004C,  $005C,  $006C,  $0002   ; 69C8   004C 005C 006C 0002
        DECLE   $0002,  $007C,  $0000,  $0000   ; 69CC   0002 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 69DC   0000 0000 0000 004C
        DECLE   $006C,  $0152,  $0002,  $0002   ; 69E0   006C 0152 0002 0002
        DECLE   $0252,  $00B2,  $0002,  $0000   ; 69E4   0252 00B2 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $006C   ; 69F4   0000 0000 004C 006C
        DECLE   $0232,  $0002,  $0002,  $0002   ; 69F8   0232 0002 0002 0002
        DECLE   $0002,  $0252,  $0022,  $0002   ; 69FC   0002 0252 0022 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A08   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $006C,  $0132   ; 6A0C   0000 004C 006C 0132
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6A10   0002 0002 0175 0195
        DECLE   $010D,  $00ED,  $00ED,  $00FD   ; 6A14   010D 00ED 00ED 00FD
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6A18   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A20   0000 0000 0000 0000
        DECLE   $004C,  $006C,  $0232,  $0002   ; 6A24   004C 006C 0232 0002
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6A28   0002 0175 0195 010D
        DECLE   $011D,  $0003,  $0253,  $00B3   ; 6A2C   011D 0003 0253 00B3
        DECLE   $0003,  $01F1,  $0000,  $0000   ; 6A30   0003 01F1 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6A38   0000 0000 0000 004C
        DECLE   $006C,  $0152,  $0002,  $0002   ; 6A3C   006C 0152 0002 0002
        DECLE   $0175,  $0195,  $010D,  $011D   ; 6A40   0175 0195 010D 011D
        DECLE   $0233,  $0003,  $0003,  $0253   ; 6A44   0233 0003 0003 0253
        DECLE   $0023,  $0003,  $0211,  $0000   ; 6A48   0023 0003 0211 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $006C   ; 6A50   0000 0000 004C 006C
        DECLE   $0232,  $0002,  $0002,  $0175   ; 6A54   0232 0002 0002 0175
        DECLE   $0195,  $010D,  $011D,  $0253   ; 6A58   0195 010D 011D 0253
        DECLE   $00B3,  $0003,  $0003,  $004E   ; 6A5C   00B3 0003 0003 004E
        DECLE   $005E,  $008E,  $0003,  $0002   ; 6A60   005E 008E 0003 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A64   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $006C,  $0132   ; 6A68   0000 004C 006C 0132
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6A6C   0002 0002 0175 0195
        DECLE   $010D,  $011D,  $0003,  $0003   ; 6A70   010D 011D 0003 0003
        DECLE   $0253,  $0023,  $0003,  $0003   ; 6A74   0253 0023 0003 0003
        DECLE   $0234,  $0004,  $01B7,  $0003   ; 6A78   0234 0004 01B7 0003
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6A7C   0002 0000 0000 0000
        DECLE   $004C,  $006C,  $0232,  $0002   ; 6A80   004C 006C 0232 0002
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6A84   0002 0175 0195 010D
        DECLE   $011D,  $0003,  $0003,  $0233   ; 6A88   011D 0003 0003 0233
        DECLE   $0003,  $0003,  $0003,  $004E   ; 6A8C   0003 0003 0003 004E
        DECLE   $006E,  $0234,  $0004,  $01D7   ; 6A90   006E 0234 0004 01D7
        DECLE   $0003,  $01F1,  $0000,  $004C   ; 6A94   0003 01F1 0000 004C
        DECLE   $006C,  $0232,  $0002,  $0002   ; 6A98   006C 0232 0002 0002
        DECLE   $0175,  $0195,  $010D,  $011D   ; 6A9C   0175 0195 010D 011D
        DECLE   $0003,  $0233,  $0003,  $0003   ; 6AA0   0003 0233 0003 0003
        DECLE   $004E,  $027A,  $0003,  $01B6   ; 6AA4   004E 027A 0003 01B6
        DECLE   $0234,  $0177,  $0197           ; 6AA8   0234 0177 0197

        SUBR    R1,     R7                      ; 6AAB   010F

        DECLE   $027B,  $0003,  $0211,  $009C   ; 6AAC   027B 0003 0211 009C
        DECLE   $0232,  $0002,  $0252,  $00B2   ; 6AB0   0232 0002 0252 00B2
        DECLE   $0002,  $01B5,  $002D,  $0233   ; 6AB4   0002 01B5 002D 0233

        DIS                                     ; 6AB8   0003
        MVO@    R3,     R2                      ; 6AB9   0253
        MOVR    R6,     R3                      ; 6ABA   00B3
        DIS                                     ; 6ABB   0003
        MOVR    R3,     R6                      ; 6ABC   009E
        ADCR    R7                              ; 6ABD   002F

        MVI@    R3,     R3                      ; 6ABE   029B
L_6ABF:
        DIS                                     ; 6ABF   0003
        DECLE   $01D6,  $0234,  $0004           ; 6AC0   01D6 0234 0004

        ADCR    R7                              ; 6AC3   002F

        INCR    R3                              ; 6AC4   000B
L_6AC5:
        MVI@    R3,     R3                      ; 6AC5   029B
        DIS                                     ; 6AC6   0003
        EIS                                     ; 6AC7   0002
        RLC     R3,     2                       ; 6AC8   0057
        SAR     R1,     2                       ; 6AC9   006D
        MOVR    R5,     R7                      ; 6ACA   00AF

        ADDR    R0,     R5                      ; 6ACB   00C5
        SUBR    R6,     R3                      ; 6ACC   0133
        CMPR    R1,     R1                      ; 6ACD   0149
        ANDR    R1,     R3                      ; 6ACE   018B
        ANDR    R4,     R1                      ; 6ACF   01A1
        MOVR    R0,     R2                      ; 6AD0   0082
        MOVR    R3,     R0                      ; 6AD1   0098
        CMPR    R3,     R6                      ; 6AD2   015E
        CMPR    R6,     R4                      ; 6AD3   0174
        ADDR    R5,     R6                      ; 6AD4   00EE
        SUBR    R0,     R4                      ; 6AD5   0104
        SAR     R0,     2                       ; 6AD6   006C
        MOVR    R5,     R6                      ; 6AD7   00AE
        CMPR    R1,     R0                      ; 6AD8   0148
        ANDR    R1,     R2                      ; 6AD9   018A
        RSWD    R6                              ; 6ADA   003E
        RLC     R0,     2                       ; 6ADB   0054
        ANDR    R3,     R6                      ; 6ADC   019E
        ANDR    R6,     R4                      ; 6ADD   01B4
        SLR     R0,     2                       ; 6ADE   0064
        SARC    R2,     1                       ; 6ADF   007A
        MOVR    R4,     R6                      ; 6AE0   00A6
        MOVR    R7,     R4                      ; 6AE1   00BC
        SUBR    R5,     R2                      ; 6AE2   012A
        CMPR    R0,     R0                      ; 6AE3   0140
        CMPR    R5,     R4                      ; 6AE4   016C
        ANDR    R0,     R2                      ; 6AE5   0182
        DECR    R2                              ; 6AE6   0012
        XORR    R4,     R0                      ; 6AE7   01E0
        ADCR    R2                              ; 6AE8   002A
        XORR    R1,     R4                      ; 6AE9   01CC
        TSTR    R0                              ; 6AEA   0080
        MOVR    R2,     R6                      ; 6AEB   0096
        CMPR    R3,     R4                      ; 6AEC   015C
        CMPR    R6,     R2                      ; 6AED   0172
        ADDR    R0,     R3                      ; 6AEE   00C3
        SUBR    R6,     R1                      ; 6AEF   0131
        ADDR    R5,     R4                      ; 6AF0   00EC
        SUBR    R0,     R2                      ; 6AF1   0102
        ADDR    R2,     R5                      ; 6AF2   00D5
        SUBR    R2,     R7                      ; 6AF3   0117

        DECLE   $00E9,  $00FF,  $0037           ; 6AF4   00E9 00FF 0037

        ANDR    R5,     R5                      ; 6AF7   01AD
        MOVR    R1,     R7                      ; 6AF8   008F

        CMPR    R2,     R5                      ; 6AF9   0155
        ADDR    R2,     R0                      ; 6AFA   00D0
        ADDR    R4,     R5                      ; 6AFB   00E5
        ADDR    R7,     R3                      ; 6AFC   00FB
L_6AFD:
        SUBR    R2,     R2                      ; 6AFD   0112
        DECLE   $00A0,  $00B8,  $0126,  $013A   ; 6AFE   00A0 00B8 0126 013A
        DECLE   $0049,  $005B,  $004B,  $004C   ; 6B02   0049 005B 004B 004C
        DECLE   $005F,  $0060,  $0073,  $0074   ; 6B06   005F 0060 0073 0074
        DECLE   $008A,  $008B,  $00A1,  $00A2   ; 6B0A   008A 008B 00A1 00A2
        DECLE   $013B,  $013C,  $0150,  $0151   ; 6B0E   013B 013C 0150 0151
        DECLE   $0165,  $0166,  $017D,  $017E   ; 6B12   0165 0166 017D 017E
        DECLE   $0195,  $0196,  $0025,  $0026   ; 6B16   0195 0196 0025 0026
        DECLE   $003A,  $003B,  $0051,  $0052   ; 6B1A   003A 003B 0051 0052
        DECLE   $019B,  $019C,  $01B0,  $01B1   ; 6B1E   019B 019C 01B0 01B1
        DECLE   $01C7                           ; 6B22   01C7

        XORR    R1,     R0                      ; 6B23   01C8
        ADDR    R4,     R7                      ; 6B24   00E7

        ADDR    R7,     R5                      ; 6B25   00FD
        SARC    R2,     2                       ; 6B26   007E
        MOVR    R2,     R4                      ; 6B27   0094
        CMPR    R3,     R2                      ; 6B28   015A
        CMPR    R6,     R0                      ; 6B29   0170
        ADDR    R0,     R1                      ; 6B2A   00C1
        ADDR    R2,     R7                      ; 6B2B   00D7

        SUBR    R3,     R1                      ; 6B2C   0119
        SUBR    R5,     R7                      ; 6B2D   012F

        ANDR    R2,     R3                      ; 6B2E   0193
        CMPR    R7,     R1                      ; 6B2F   0179
        RRC     R0,     1                       ; 6B30   0070
        MOVR    R0,     R7                      ; 6B31   0087

        DECLE   $0162,  $014D,  $0145,  $00AB   ; 6B32   0162 014D 0145 00AB
        DECLE   $00D9,  $011B,  $0153,  $008D   ; 6B36   00D9 011B 0153 008D
        DECLE   $0076,  $0168,  $0187,  $0069   ; 6B3A   0076 0168 0187 0069
        DECLE   $0024,  $01C6,  $0061,  $017F   ; 6B3E   0024 01C6 0061 017F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6B4E   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0232,  $0002   ; 6B52   005C 006C 0232 0002
        DECLE   $0002,  $007C,  $0000,  $0000   ; 6B56   0002 007C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5E   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $005C,  $006C   ; 6B62   0000 004C 005C 006C
        DECLE   $0152,  $0175,  $0195,  $0002   ; 6B66   0152 0175 0195 0002
        DECLE   $0002,  $0002,  $0232,  $0002   ; 6B6A   0002 0002 0232 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6B72   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0002,  $0232   ; 6B76   005C 006C 0002 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6B7A   0002 0002 0175 0195
        DECLE   $0002,  $002D,  $0253,  $00B3   ; 6B7E   0002 002D 0253 00B3
        DECLE   $00DD,  $0002,  $0000,  $0000   ; 6B82   00DD 0002 0000 0000
        DECLE   $0000,  $004C,  $005C,  $006C   ; 6B86   0000 004C 005C 006C
        DECLE   $0002,  $0232,  $0002,  $0175   ; 6B8A   0002 0232 0002 0175
        DECLE   $0195,  $010D,  $00ED,  $00ED   ; 6B8E   0195 010D 00ED 00ED
        DECLE   $00FD,  $0175,  $0195,  $00BD   ; 6B92   00FD 0175 0195 00BD
        DECLE   $0253,  $0023,  $0003,  $01F1   ; 6B96   0253 0023 0003 01F1
        DECLE   $009C,  $0002,  $0002,  $0232   ; 6B9A   009C 0002 0002 0232
        DECLE   $0002,  $0002,  $0002,  $0175   ; 6B9E   0002 0002 0002 0175
        DECLE   $0195,  $0132,  $002D,  $0003   ; 6BA2   0195 0132 002D 0003
        DECLE   $0253,  $00B3,  $0003,  $0003   ; 6BA6   0253 00B3 0003 0003
        DECLE   $0003,  $0133,  $0003,  $003E   ; 6BAA   0003 0133 0003 003E
        DECLE   $027A,  $0211,  $012C,  $0002   ; 6BAE   027A 0211 012C 0002
        DECLE   $0232,  $0002,  $0002,  $0175   ; 6BB2   0232 0002 0002 0175
        DECLE   $0195,  $0002,  $0152,  $0002   ; 6BB6   0195 0002 0152 0002
        DECLE   $00BD,  $0003,  $0253,  $0023   ; 6BBA   00BD 0003 0253 0023
        DECLE   $0003,  $0003,  $01B6,  $009E   ; 6BBE   0003 0003 01B6 009E
        DECLE   $0234                           ; 6BC2   0234

        ADCR    R7                              ; 6BC3   002F

        MVI@    R3,     R3                      ; 6BC4   029B
L_6BC5:
        EIS                                     ; 6BC5   0002
        DECLE   $0000,  $00DC,  $00FC,  $0232   ; 6BC6   0000 00DC 00FC 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6BCA   0002 0002 0175 0195
        DECLE   $0002,  $0132,  $0002,  $0233   ; 6BCE   0002 0132 0002 0233
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6BD2   0003 0003 0003 0003
        DECLE   $01D6,  $012E,  $0234,  $00BF   ; 6BD6   01D6 012E 0234 00BF
        DECLE   $02DB,  $0002,  $0000,  $0000   ; 6BDA   02DB 0002 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6BDE   0000 00DC 00FC 0002
        DECLE   $0232,  $0175,  $0195,  $0002   ; 6BE2   0232 0175 0195 0002
        DECLE   $002D,  $0003,  $0253,  $00B3   ; 6BE6   002D 0003 0253 00B3
        DECLE   $0003,  $0003,  $0003,  $0133   ; 6BEA   0003 0003 0003 0133
        DECLE   $0003,  $00CE,  $027A,  $01F1   ; 6BEE   0003 00CE 027A 01F1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF2   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6BF6   0000 00DC 00FC 0002
        DECLE   $0232,  $0002,  $00BD,  $0003   ; 6BFA   0232 0002 00BD 0003
        DECLE   $0253,  $0023,  $0003,  $0003   ; 6BFE   0253 0023 0003 0003
        DECLE   $0003,  $01B6,  $0003,  $0233   ; 6C02   0003 01B6 0003 0233
        DECLE   $0003,  $0211,  $0000,  $0000   ; 6C06   0003 0211 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0A   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $00FC,  $0002   ; 6C0E   0000 00DC 00FC 0002
        DECLE   $0232,  $007D,  $008D,  $0003   ; 6C12   0232 007D 008D 0003
        DECLE   $0003,  $0233,  $0003,  $01D6   ; 6C16   0003 0233 0003 01D6
        DECLE   $0003,  $0153,  $006D,  $010C   ; 6C1A   0003 0153 006D 010C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C22   0000 0000 0000 0000
        DECLE   $003C,  $0232,  $0002,  $01B5   ; 6C26   003C 0232 0002 01B5
        DECLE   $002D,  $0233,  $0003,  $003E   ; 6C2A   002D 0233 0003 003E
        DECLE   $0234,  $0004,  $029A,  $003D   ; 6C2E   0234 0004 029A 003D
        DECLE   $002C,  $0000                   ; 6C32   002C 0000

        GSWD    R1                              ; 6C34   0031
        RSWD    R3                              ; 6C35   003B
        MOVR    R1,     R3                      ; 6C36   008B
        MOVR    R2,     R5                      ; 6C37   0095
        MOVR    R6,     R3                      ; 6C38   00B3
        MOVR    R7,     R5                      ; 6C39   00BD
        SUBR    R1,     R5                      ; 6C3A   010D
        SUBR    R2,     R7                      ; 6C3B   0117

        MOVR    R3,     R6                      ; 6C3C   009E
        MOVR    R5,     R0                      ; 6C3D   00A8
        GSWD    R0                              ; 6C3E   0030
        RSWD    R2                              ; 6C3F   003A
        SUBR    R1,     R4                      ; 6C40   010C
        SUBR    R2,     R6                      ; 6C41   0116
        MOVR    R2,     R4                      ; 6C42   0094
        MOVR    R6,     R2                      ; 6C43   00B2
        NEGR    R6                              ; 6C44   0026
        SWAP    R0,     2                       ; 6C45   0044
        SUBR    R0,     R2                      ; 6C46   0102
        SUBR    R4,     R0                      ; 6C47   0120
        DECR    R1                              ; 6C48   0011
        COMR    R3                              ; 6C49   001B
        SUBR    R5,     R1                      ; 6C4A   0129
        SUBR    R6,     R3                      ; 6C4B   0133
        SLLC    R3,     2                       ; 6C4C   005F
        SAR     R1,     1                       ; 6C4D   0069
        ADDR    R2,     R7                      ; 6C4E   00D7

        ADDR    R4,     R1                      ; 6C4F   00E1
        MOVR    R1,     R6                      ; 6C50   008E
        MOVR    R3,     R0                      ; 6C51   0098
        MOVR    R4,     R2                      ; 6C52   00A2
        MOVR    R5,     R4                      ; 6C53   00AC
        MOVR    R1,     R4                      ; 6C54   008C
        MOVR    R2,     R6                      ; 6C55   0096
        MOVR    R4,     R0                      ; 6C56   00A0
        MOVR    R5,     R2                      ; 6C57   00AA
        MOVR    R0,     R3                      ; 6C58   0083
        MOVR    R6,     R5                      ; 6C59   00B5
        SARC    R2,     1                       ; 6C5A   007A
        ADDR    R0,     R0                      ; 6C5B   00C0
        RRC     R0,     1                       ; 6C5C   0070
        ADDR    R1,     R2                      ; 6C5D   00CA
        SLR     R3,     2                       ; 6C5E   0067
        ADDR    R2,     R5                      ; 6C5F   00D5
        RLC     R3,     1                       ; 6C60   0053
        ADDR    R5,     R1                      ; 6C61   00E9
        SLL     R2,     1                       ; 6C62   004A
        ADDR    R6,     R4                      ; 6C63   00F4
        MOVR    R2,     R1                      ; 6C64   0091
        MOVR    R5,     R7                      ; 6C65   00AF

        MOVR    R3,     R5                      ; 6C66   009D
        MOVR    R4,     R7                      ; 6C67   00A7

        DECLE   $0089,  $00BB,  $002D,  $0037   ; 6C68   0089 00BB 002D 0037
        DECLE   $0109,  $0113,  $0025,  $0043   ; 6C6C   0109 0113 0025 0043
        DECLE   $004B,  $004C,  $004D,  $004E   ; 6C70   004B 004C 004D 004E
        DECLE   $0054,  $0055,  $0056,  $0057   ; 6C74   0054 0055 0056 0057
        DECLE   $0072,  $0073,  $007B,  $007C   ; 6C78   0072 0073 007B 007C
        DECLE   $0080,  $0081,  $0084,  $0085   ; 6C7C   0080 0081 0084 0085
        DECLE   $00B6,  $00B7                   ; 6C80   00B6 00B7

        ADDR    R0,     R1                      ; 6C82   00C1
        ADDR    R0,     R2                      ; 6C83   00C2
        ADDR    R0,     R6                      ; 6C84   00C6
        ADDR    R0,     R7                      ; 6C85   00C7

        DECLE   $00CC,  $00CD,  $00EA,  $00EB   ; 6C86   00CC 00CD 00EA 00EB
        DECLE   $00EC,  $00ED,  $00F5,  $00F6   ; 6C8A   00EC 00ED 00F5 00F6
        DECLE   $00F7                           ; 6C8E   00F7

        ADDR    R7,     R0                      ; 6C8F   00F8
        ADCR    R6                              ; 6C90   002E
        RSWD    R0                              ; 6C91   0038
        SARC    R2,     2                       ; 6C92   007E
        MOVR    R1,     R0                      ; 6C93   0088
        TSTR    R3                              ; 6C94   009B
        MOVR    R4,     R5                      ; 6C95   00A5
        MOVR    R7,     R2                      ; 6C96   00BA
        ADDR    R0,     R4                      ; 6C97   00C4
        SUBR    R1,     R2                      ; 6C98   010A
        SUBR    R2,     R4                      ; 6C99   0114
        SUBR    R0,     R1                      ; 6C9A   0101
        SUBR    R3,     R7                      ; 6C9B   011F

        COMR    R1                              ; 6C9C   0019
        SUBR    R4,     R7                      ; 6C9D   0127

        MOVR    R0,     R6                      ; 6C9E   0086
        MOVR    R7,     R0                      ; 6C9F   00B8
        RRC     R1,     2                       ; 6CA0   0075
        ADDR    R1,     R7                      ; 6CA1   00CF

        SLLC    R1,     2                       ; 6CA2   005D
        ADDR    R3,     R7                      ; 6CA3   00DF

        DECLE   $0040,  $00FE,  $0007,  $013D   ; 6CA4   0040 00FE 0007 013D
        DECLE   $0132,  $0010,  $0000,  $0000   ; 6CA8   0132 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAC   0000 0000 0000 0000
        DECLE   $009C,  $0132,  $007C,  $0000   ; 6CB0   009C 0132 007C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB4   0000 0000 0000 0000
        DECLE   $0000,  $009C,  $0152,  $0252   ; 6CB8   0000 009C 0152 0252
        DECLE   $00B2,  $0000,  $0000,  $0000   ; 6CBC   00B2 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0232   ; 6CC0   0000 0000 0000 0232
        DECLE   $0002,  $0252,  $0022,  $008C   ; 6CC4   0002 0252 0022 008C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC8   0000 0000 0000 0000
        DECLE   $009C,  $010D,  $011D,  $0233   ; 6CCC   009C 010D 011D 0233
        DECLE   $0279,  $0002,  $0000,  $0000   ; 6CD0   0279 0002 0000 0000
        DECLE   $0000,  $0000,  $002D,  $0233   ; 6CD4   0000 0000 002D 0233
        DECLE   $01B6,  $009E,  $029A,  $01F1   ; 6CD8   01B6 009E 029A 01F1
        DECLE   $0000,  $0000,  $0000,  $009C   ; 6CDC   0000 0000 0000 009C
        DECLE   $00BD,  $0233,  $01D6,  $012E   ; 6CE0   00BD 0233 01D6 012E
        DECLE   $02DA,  $0211,  $0000,  $0000   ; 6CE4   02DA 0211 0000 0000
        DECLE   $0000,  $0002,  $0152,  $007D   ; 6CE8   0000 0002 0152 007D
        DECLE   $008D,  $0233,  $0279,  $0002   ; 6CEC   008D 0233 0279 0002
        DECLE   $0000,  $0000,  $009C,  $0002   ; 6CF0   0000 0000 009C 0002
        DECLE   $0232,  $0175,  $0195,  $0175   ; 6CF4   0232 0175 0195 0175
        DECLE   $0195,  $011C,  $0000,  $0000   ; 6CF8   0195 011C 0000 0000
        DECLE   $0002,  $0232,  $0175,  $0195   ; 6CFC   0002 0232 0175 0195
        DECLE   $0175,  $0195,  $011C,  $0000   ; 6D00   0175 0195 011C 0000
        DECLE   $0000,  $0000,  $0002,  $0132   ; 6D04   0000 0000 0002 0132
        DECLE   $0002,  $0252,  $00B2,  $002C   ; 6D08   0002 0252 00B2 002C
        DECLE   $0000,  $0000,  $0000,  $009C   ; 6D0C   0000 0000 0000 009C
        DECLE   $0002,  $0232,  $0002,  $0252   ; 6D10   0002 0232 0002 0252
        DECLE   $0022,  $00BC,  $0000,  $0000   ; 6D14   0022 00BC 0000 0000
        DECLE   $0000,  $0002,  $0232,  $0002   ; 6D18   0000 0002 0232 0002
        DECLE   $0175,  $0195,  $0002,  $0152   ; 6D1C   0175 0195 0002 0152
        DECLE   $007C,  $008C,  $0000,  $0002   ; 6D20   007C 008C 0000 0002
        DECLE   $0232,  $0175,  $0195,  $011D   ; 6D24   0232 0175 0195 011D
        DECLE   $01B6,  $00DD,  $0175,  $0195   ; 6D28   01B6 00DD 0175 0195
        DECLE   $009C,  $0232,  $0175,  $0195   ; 6D2C   009C 0232 0175 0195
        DECLE   $0132,  $0003,  $01D6,  $0233   ; 6D30   0132 0003 01D6 0233
        DECLE   $00DD,  $01F1,  $0232,  $0002   ; 6D34   00DD 01F1 0232 0002
        DECLE   $0252,  $00B2,  $002D,  $0233   ; 6D38   0252 00B2 002D 0233
        DECLE   $0003,  $009E,  $027A,  $0211   ; 6D3C   0003 009E 027A 0211
        DECLE   $0232,  $0002,  $0252,  $0022   ; 6D40   0232 0002 0252 0022
        DECLE   $00BD,  $01B6,  $003E,  $0234   ; 6D44   00BD 01B6 003E 0234
        DECLE   $029A,  $002C,  $003F           ; 6D48   029A 002C 003F

        RLC     R1,     2                       ; 6D4B   0055
        CMPR    R6,     R3                      ; 6D4C   0173
        ANDR    R1,     R1                      ; 6D4D   0189
        MOVR    R5,     R7                      ; 6D4E   00AF

        ADDR    R0,     R5                      ; 6D4F   00C5
        SUBR    R0,     R7                      ; 6D50   0107

        SUBR    R3,     R5                      ; 6D51   011D
        ADDR    R1,     R6                      ; 6D52   00CE
        ADDR    R4,     R4                      ; 6D53   00E4
        RSWD    R2                              ; 6D54   003A
        RLC     R0,     1                       ; 6D55   0050
        CMPR    R5,     R6                      ; 6D56   016E
        ANDR    R0,     R4                      ; 6D57   0184
        MOVR    R7,     R0                      ; 6D58   00B8
        ADDR    R7,     R2                      ; 6D59   00FA
        NEGR    R5                              ; 6D5A   0025
        SLR     R3,     2                       ; 6D5B   0067
        CMPR    R3,     R1                      ; 6D5C   0159
        ANDR    R3,     R3                      ; 6D5D   019B
        ADDR    R1,     R1                      ; 6D5E   00C9
        ADDR    R3,     R7                      ; 6D5F   00DF

        DECLE   $0032,  $0048,  $0166,  $017C   ; 6D60   0032 0048 0166 017C
        DECLE   $0036                           ; 6D64   0036

        SLL     R0,     2                       ; 6D65   004C
        CMPR    R5,     R2                      ; 6D66   016A
        ANDR    R0,     R0                      ; 6D67   0180
        ADDR    R0,     R7                      ; 6D68   00C7

        DECLE   $00DD,  $009C,  $010A,  $0071   ; 6D69   00DD 009C 010A 0071
        DECLE   $0137,  $0046,  $0030,  $0164   ; 6D6D   0137 0046 0030 0164
        DECLE   $017A,  $00B5,  $00CC,  $00E2   ; 6D71   017A 00B5 00CC 00E2
        DECLE   $00F7,  $008B,  $0125,  $0060   ; 6D75   00F7 008B 0125 0060
        DECLE   $0152,  $001E,  $0194,  $0035   ; 6D79   0152 001E 0194 0035

        SLL     R3,     1                       ; 6D7D   004B
        CMPR    R5,     R1                      ; 6D7E   0169
        CMPR    R7,     R7                      ; 6D7F   017F
        INCR    R3                              ; 6D80   000B
        ANDR    R5,     R5                      ; 6D81   01AD
        SARC    R0,     2                       ; 6D82   007C
        CMPR    R0,     R2                      ; 6D83   0142
        SAR     R0,     1                       ; 6D84   0068
        CMPR    R3,     R2                      ; 6D85   015A
        MOVR    R3,     R6                      ; 6D86   009E
        MOVR    R3,     R7                      ; 6D87   009F

        TSTR    R1                              ; 6D88   0089
        MOVR    R1,     R2                      ; 6D89   008A
        RRC     R0,     2                       ; 6D8A   0074
        RRC     R1,     2                       ; 6D8B   0075
        SUBR    R1,     R4                      ; 6D8C   010C
        SUBR    R1,     R5                      ; 6D8D   010D
        SUBR    R4,     R3                      ; 6D8E   0123
        SUBR    R4,     R4                      ; 6D8F   0124
        SUBR    R7,     R2                      ; 6D90   013A
        SUBR    R7,     R3                      ; 6D91   013B
        NEGR    R2                              ; 6D92   0022
        NEGR    R3                              ; 6D93   0023
        SLR     R0,     2                       ; 6D94   0064
        SLR     R1,     2                       ; 6D95   0065
        CMPR    R2,     R6                      ; 6D96   0156
        CMPR    R2,     R7                      ; 6D97   0157
        ANDR    R3,     R0                      ; 6D98   0198
        ANDR    R3,     R1                      ; 6D99   0199
        MOVR    R2,     R5                      ; 6D9A   0095
        MOVR    R2,     R6                      ; 6D9B   0096
        MOVR    R5,     R4                      ; 6D9C   00AC
        TSTR    R5                              ; 6D9D   00AD
        ADDR    R0,     R3                      ; 6D9E   00C3
        ADDR    R0,     R4                      ; 6D9F   00C4
        SUBR    R0,     R5                      ; 6DA0   0105
        SUBR    R0,     R6                      ; 6DA1   0106
        SUBR    R3,     R2                      ; 6DA2   011A
        SUBR    R3,     R3                      ; 6DA3   011B
        SUBR    R5,     R7                      ; 6DA4   012F

        SUBR    R6,     R0                      ; 6DA5   0130
        ADDR    R1,     R7                      ; 6DA6   00CF

        ADDR    R4,     R5                      ; 6DA7   00E5
        RSWD    R0                              ; 6DA8   0038
        SLL     R2,     2                       ; 6DA9   004E
        CMPR    R5,     R4                      ; 6DAA   016C
        ANDR    R0,     R2                      ; 6DAB   0182
        RSWD    R4                              ; 6DAC   003C
        RLC     R2,     1                       ; 6DAD   0052
        CMPR    R6,     R0                      ; 6DAE   0170
        ANDR    R0,     R6                      ; 6DAF   0186
        NEGR    R6                              ; 6DB0   0026
        ANDR    R3,     R4                      ; 6DB1   019C
        MOVR    R5,     R3                      ; 6DB2   00AB
        SUBR    R3,     R1                      ; 6DB3   0119
        ADDR    R0,     R2                      ; 6DB4   00C2
        SUBR    R0,     R4                      ; 6DB5   0104
        ADDR    R3,     R1                      ; 6DB6   00D9
        ADDR    R5,     R7                      ; 6DB7   00EF

        DECLE   $003E,  $0054,  $0172,  $0188   ; 6DB8   003E 0054 0172 0188
        DECLE   $0098,  $0132,  $010E,  $00A0   ; 6DBC   0098 0132 010E 00A0
        DECLE   $007E,  $0144,  $01B2,  $0010   ; 6DC0   007E 0144 01B2 0010
        DECLE   $005C,  $014E,  $011C,  $00AE   ; 6DC4   005C 014E 011C 00AE
        DECLE   $0080,  $0146,  $0000,  $0000   ; 6DC8   0080 0146 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCC   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $005C,  $005C   ; 6DD0   0000 004C 005C 005C
        DECLE   $006C,  $0232,  $0002,  $0002   ; 6DD4   006C 0232 0002 0002
        DECLE   $0002,  $0002,  $0152,  $007C   ; 6DD8   0002 0002 0152 007C
        DECLE   $008C,  $0000,  $0000,  $0000   ; 6DDC   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE0   0000 0000 0000 0000
        DECLE   $004C,  $006C,  $0002,  $0002   ; 6DE4   004C 006C 0002 0002
        DECLE   $0232,  $010D,  $00ED,  $011D   ; 6DE8   0232 010D 00ED 011D
        DECLE   $0176,  $0196,  $0003,  $0279   ; 6DEC   0176 0196 0003 0279
        DECLE   $0233,  $00DD,  $00FD,  $007C   ; 6DF0   0233 00DD 00FD 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF4   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0232,  $0002   ; 6DF8   0000 003C 0232 0002
        DECLE   $0252,  $00B2,  $002D,  $0233   ; 6DFC   0252 00B2 002D 0233
        DECLE   $0253,  $00B3,  $01B6,  $003E   ; 6E00   0253 00B3 01B6 003E
        DECLE   $029A,  $0003,  $01B6,  $0003   ; 6E04   029A 0003 01B6 0003
        DECLE   $0233,  $01F1,  $0000,  $0000   ; 6E08   0233 01F1 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00CC   ; 6E0C   0000 0000 0000 00CC
        DECLE   $0232,  $0002,  $0252,  $0022   ; 6E10   0232 0002 0252 0022
        DECLE   $00BD,  $0233,  $0253,  $0023   ; 6E14   00BD 0233 0253 0023
        DECLE   $01D6,  $00CE,  $02DA,  $0003   ; 6E18   01D6 00CE 02DA 0003
        DECLE   $01D6,  $0003,  $0233,  $0211   ; 6E1C   01D6 0003 0233 0211
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E20   0000 0000 0000 0000
        DECLE   $0000,  $004C,  $0152,  $0002   ; 6E24   0000 004C 0152 0002
        DECLE   $0002,  $0002,  $0232,  $007D   ; 6E28   0002 0002 0232 007D
        DECLE   $005D,  $008D,  $0176,  $0196   ; 6E2C   005D 008D 0176 0196
        DECLE   $0003,  $0279,  $0233,  $004D   ; 6E30   0003 0279 0233 004D
        DECLE   $006D,  $0002,  $0000,  $0000   ; 6E34   006D 0002 0000 0000
        DECLE   $0000,  $0000,  $009C,  $0232   ; 6E38   0000 0000 009C 0232
        DECLE   $0002,  $0002,  $0175,  $0195   ; 6E3C   0002 0002 0175 0195
        DECLE   $010C,  $011C,  $0000,  $00DC   ; 6E40   010C 011C 0000 00DC
        DECLE   $00EC,  $00FC,  $0232,  $0002   ; 6E44   00EC 00FC 0232 0002
        DECLE   $0132,  $0002,  $0152,  $0002   ; 6E48   0132 0002 0152 0002
        DECLE   $007C,  $0000,  $0000,  $0000   ; 6E4C   007C 0000 0000 0000
        DECLE   $0002,  $0002,  $0002,  $0175   ; 6E50   0002 0002 0002 0175
        DECLE   $0195,  $0232,  $0000,  $0000   ; 6E54   0195 0232 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E58   0000 0000 0000 0000
        DECLE   $0000,  $00DC,  $0002,  $0175   ; 6E5C   0000 00DC 0002 0175
        DECLE   $0195,  $0002,  $0232,  $007C   ; 6E60   0195 0002 0232 007C
        DECLE   $0000,  $009C,  $0232,  $0002   ; 6E64   0000 009C 0232 0002
        DECLE   $0175,  $0195,  $0132,  $0002   ; 6E68   0175 0195 0132 0002
        DECLE   $008C,  $0000,  $0000,  $0000   ; 6E6C   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E70   0000 0000 0000 0000
        DECLE   $00DC,  $0232,  $0175,  $0195   ; 6E74   00DC 0232 0175 0195
        DECLE   $0132,  $01F1,  $0000,  $0002   ; 6E78   0132 01F1 0000 0002
        DECLE   $0002,  $0002,  $0002,  $0232   ; 6E7C   0002 0002 0002 0232
        DECLE   $010D,  $011D,  $0279,  $007C   ; 6E80   010D 011D 0279 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 6E88   0000 0000 0000 00FC
        DECLE   $0232,  $0175,  $0195,  $0211   ; 6E8C   0232 0175 0195 0211
        DECLE   $009C,  $0232,  $0002,  $0252   ; 6E90   009C 0232 0002 0252
        DECLE   $00B2,  $002D,  $0233,  $003E   ; 6E94   00B2 002D 0233 003E
        DECLE   $029A,  $01B5,  $0000,  $0000   ; 6E98   029A 01B5 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9C   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0002,  $0232   ; 6EA0   0000 003C 0002 0232

        EIS                                     ; 6EA4   0002
        EIS                                     ; 6EA5   0002
        RLC     R3,     2                       ; 6EA6   0057
        MOVR    R0,     R3                      ; 6EA7   0083
        MOVR    R5,     R7                      ; 6EA8   00AF

        ADDR    R3,     R3                      ; 6EA9   00DB
        SUBR    R0,     R7                      ; 6EAA   0107

        DECLE   $0133,  $015F,  $018B,  $00BF   ; 6EAB   0133 015F 018B 00BF

        ADDR    R5,     R3                      ; 6EAF   00EB
        ADDR    R1,     R1                      ; 6EB0   00C9
        ADDR    R6,     R5                      ; 6EB1   00F5
        ADDR    R2,     R7                      ; 6EB2   00D7

        SUBR    R0,     R3                      ; 6EB3   0103
        MOVR    R3,     R5                      ; 6EB4   009D
        SUBR    R4,     R1                      ; 6EB5   0121
        MOVR    R5,     R4                      ; 6EB6   00AC
        SUBR    R6,     R0                      ; 6EB7   0130
        MOVR    R6,     R3                      ; 6EB8   00B3
        ADDR    R3,     R7                      ; 6EB9   00DF

        MOVR    R7,     R3                      ; 6EBA   00BB
        ADDR    R4,     R7                      ; 6EBB   00E7

        DECLE   $006C,  $0098,  $011C,  $0148   ; 6EBC   006C 0098 011C 0148
        DECLE   $0046,  $0072,  $014E,  $017A   ; 6EC0   0046 0072 014E 017A
        DECLE   $0054,  $0080,  $015C,  $0188   ; 6EC4   0054 0080 015C 0188
        DECLE   $00B1,  $00DD,  $0089,  $010D   ; 6EC8   00B1 00DD 0089 010D
        DECLE   $0062,  $013E,  $00B9,  $00E5   ; 6ECC   0062 013E 00B9 00E5
        DECLE   $0094,  $0118,  $006A,  $0146   ; 6ED0   0094 0118 006A 0146
        DECLE   $003F                           ; 6ED4   003F

        CMPR    R6,     R3                      ; 6ED5   0173
        ADDR    R0,     R3                      ; 6ED6   00C3
        ADDR    R5,     R7                      ; 6ED7   00EF

        DECR    R6                              ; 6ED8   0016
        ANDR    R4,     R2                      ; 6ED9   01A2
        ADDR    R0,     R7                      ; 6EDA   00C7

        ADDR    R6,     R3                      ; 6EDB   00F3
        MOVR    R4,     R0                      ; 6EDC   00A0
        SUBR    R4,     R4                      ; 6EDD   0124
        SARC    R3,     1                       ; 6EDE   007B
        CMPR    R2,     R7                      ; 6EDF   0157
        ADDR    R2,     R4                      ; 6EE0   00D4
        SUBR    R0,     R0                      ; 6EE1   0100
        SLL     R0,     2                       ; 6EE2   004C
        SLL     R1,     2                       ; 6EE3   004D
        RRC     R3,     2                       ; 6EE4   0077
        SARC    R0,     1                       ; 6EE5   0078
        MOVR    R4,     R2                      ; 6EE6   00A2
        MOVR    R4,     R3                      ; 6EE7   00A3
        ADDR    R1,     R5                      ; 6EE8   00CD
        ADDR    R1,     R6                      ; 6EE9   00CE
        ADDR    R7,     R1                      ; 6EEA   00F9
        ADDR    R7,     R2                      ; 6EEB   00FA
        SUBR    R4,     R6                      ; 6EEC   0126
        SUBR    R4,     R7                      ; 6EED   0127

        DECLE   $0153,  $0154,  $0180,  $0181   ; 6EEE   0153 0154 0180 0181
        DECLE   $008B,  $008C,  $00B6,  $00B7   ; 6EF2   008B 008C 00B6 00B7

        ADDR    R4,     R2                      ; 6EF6   00E2
        ADDR    R4,     R3                      ; 6EF7   00E3
        SUBR    R1,     R7                      ; 6EF8   010F

        DECLE   $0110,  $0064,  $0065,  $0140   ; 6EF9   0110 0064 0065 0140
        DECLE   $0141,  $003C,  $003D,  $0170   ; 6EFD   0141 003C 003D 0170
        DECLE   $0171,  $00D8,  $0104,  $00CB   ; 6F01   0171 00D8 0104 00CB
        DECLE   $00F7,  $0096,  $00C2,  $00C1   ; 6F05   00F7 0096 00C2 00C1
        DECLE   $00ED,  $00EE,  $011A,  $0051   ; 6F09   00ED 00EE 011A 0051
        DECLE   $0185,  $00AA,  $012E,  $002A   ; 6F0D   0185 00AA 012E 002A
        DECLE   $01B6,  $014C,  $0070,  $00D0   ; 6F11   01B6 014C 0070 00D0
        DECLE   $00FC,  $0115,  $0091,  $00A5   ; 6F15   00FC 0115 0091 00A5
        DECLE   $0129,  $016F,  $003B,  $00DA   ; 6F19   0129 016F 003B 00DA
        DECLE   $0106,  $0000,  $0000,  $0000   ; 6F1D   0106 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $005C   ; 6F2D   0000 0000 004C 005C
        DECLE   $005C,  $005C,  $006C,  $0232   ; 6F31   005C 005C 006C 0232
        DECLE   $0002,  $0002,  $010D,  $00ED   ; 6F35   0002 0002 010D 00ED
        DECLE   $00ED,  $00FD,  $0002,  $007C   ; 6F39   00ED 00FD 0002 007C
        DECLE   $005C,  $005C,  $005C,  $008C   ; 6F3D   005C 005C 005C 008C
        DECLE   $0000,  $004C,  $006C,  $0002   ; 6F41   0000 004C 006C 0002
        DECLE   $0002,  $010D,  $00FD,  $0232   ; 6F45   0002 010D 00FD 0232
        DECLE   $007C,  $0000,  $0000,  $0000   ; 6F49   007C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F51   0000 0000 0000 0000
        DECLE   $004C,  $005C,  $005C,  $006C   ; 6F55   004C 005C 005C 006C
        DECLE   $0152,  $0175,  $0195,  $0002   ; 6F59   0152 0175 0195 0002
        DECLE   $0232,  $010D,  $00ED,  $00ED   ; 6F5D   0232 010D 00ED 00ED
        DECLE   $011D,  $0003,  $0003,  $0253   ; 6F61   011D 0003 0003 0253
        DECLE   $00B3,  $0003,  $00DD,  $0002   ; 6F65   00B3 0003 00DD 0002
        DECLE   $0002,  $0175,  $0195,  $0002   ; 6F69   0002 0175 0195 0002
        DECLE   $0002,  $0002,  $0232,  $010D   ; 6F6D   0002 0002 0232 010D
        DECLE   $011D,  $0253,  $00B3,  $00DD   ; 6F71   011D 0253 00B3 00DD
        DECLE   $01F1,  $0000,  $0000,  $0000   ; 6F75   01F1 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $004C   ; 6F79   0000 0000 0000 004C
        DECLE   $005C,  $006C,  $0002,  $0232   ; 6F7D   005C 006C 0002 0232
        DECLE   $0002,  $0175,  $0195,  $010D   ; 6F81   0002 0175 0195 010D
        DECLE   $00ED,  $00ED,  $011D,  $0233   ; 6F85   00ED 00ED 011D 0233
        DECLE   $0003,  $0253,  $00B3,  $0003   ; 6F89   0003 0253 00B3 0003
        DECLE   $0003,  $0133,  $0003,  $0253   ; 6F8D   0003 0133 0003 0253
        DECLE   $0023,  $0003,  $0003,  $0002   ; 6F91   0023 0003 0003 0002
        DECLE   $0175,  $0195,  $0002,  $0002   ; 6F95   0175 0195 0002 0002
        DECLE   $0232,  $0002,  $011D,  $0003   ; 6F99   0232 0002 011D 0003
        DECLE   $0003,  $0253,  $0023,  $0003   ; 6F9D   0003 0253 0023 0003
        DECLE   $0211,  $0000,  $0000,  $004C   ; 6FA1   0211 0000 0000 004C
        DECLE   $005C,  $006C,  $0232,  $0002   ; 6FA5   005C 006C 0232 0002
        DECLE   $0175,  $0195,  $010D,  $00ED   ; 6FA9   0175 0195 010D 00ED
        DECLE   $011D,  $0003,  $0133,  $0003   ; 6FAD   011D 0003 0133 0003
        DECLE   $0003,  $0233,  $0003,  $01B6   ; 6FB1   0003 0233 0003 01B6
        DECLE   $0003,  $0253,  $0023,  $0003   ; 6FB5   0003 0253 0023 0003
        DECLE   $004E,  $006E,  $027A,  $0003   ; 6FB9   004E 006E 027A 0003
        DECLE   $0003,  $0233,  $004D,  $0175   ; 6FBD   0003 0233 004D 0175
        DECLE   $0195,  $0002,  $0132,  $0002   ; 6FC1   0195 0002 0132 0002
        DECLE   $010D,  $011D,  $0003,  $0233   ; 6FC5   010D 011D 0003 0233
        DECLE   $0003,  $0279,  $0003,  $004D   ; 6FC9   0003 0279 0003 004D
        DECLE   $01F1,  $009C,  $0232,  $0002   ; 6FCD   01F1 009C 0232 0002
        DECLE   $0252,  $00B2,  $0002,  $0175   ; 6FD1   0252 00B2 0002 0175
        DECLE   $0195,  $002D,  $0233,  $0003   ; 6FD5   0195 002D 0233 0003
        DECLE   $0253,  $00B3,  $0003,  $003E   ; 6FD9   0253 00B3 0003 003E
        DECLE   $029A,  $0003,  $01B6,  $01D6   ; 6FDD   029A 0003 01B6 01D6
        DECLE   $0233,  $0003,  $0003,  $009E   ; 6FE1   0233 0003 0003 009E
        DECLE   $0234                           ; 6FE5   0234

        ADCR    R7                              ; 6FE6   002F

        MVI@    R3,     R3                      ; 6FE7   029B
L_6FE8:
        DIS                                     ; 6FE8   0003
        DECLE   $01B6,  $0003,  $0175,  $0195   ; 6FE9   01B6 0003 0175 0195
        DECLE   $0002,  $0152,  $0002,  $002D   ; 6FED   0002 0152 0002 002D
        DECLE   $0003,  $0233,  $0003,  $009E   ; 6FF1   0003 0233 0003 009E
        DECLE   $029A,  $01B6,  $0003,  $0132   ; 6FF5   029A 01B6 0003 0132
        DECLE   $0211                           ; 6FF9   0211

        RLC     R0,     2                       ; 6FFA   0054
        ADCR    R6                              ; 6FFB   002E
        SLL     R2,     1                       ; 6FFC   004A
        ADCR    R6                              ; 6FFD   002E
        SLL     R0,     2                       ; 6FFE   004C
        ADCR    R6                              ; 6FFF   002E
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $50D7       <entry>
;;  $50E5       $50F4  
;;  $50EC       $50F2  
;;  $50F6       $50EE   $56ED  
;;  $50FC       $50FE  
;;  $5111       $510D  
;;  $5132       $5135  
;;  $513A       $51D0  
;;  $513D       $51CE  
;;  $514B       $5145  
;;  $515D       $5152  
;;  $5169       $516F  
;;  $517E       $5164  
;;  $519B       $5184   $5193  
;;  $51AF       $5156   $515B  
;;  $51C1       $51B8   $51CA  
;;  $51D9       $51A7  
;;  $5214       $5217  
;;  $522C       $5228  
;;  $5234       $5230  
;;  $5235       $5137  
;;  $5236       $5234  
;;  $523F       $5220  
;;  $5251       $5255  
;;  $5271       $5281  
;;  $527E       $5277  
;;  $5284       $5286  
;;  $528E       $5298  
;;  $5290       $5292  
;;  $529C       $52BB  
;;  $52A9       $52B5  
;;  $52D2       $52CD  
;;  $52E1       $52D9  
;;  $52F6       $5324  
;;  $52FC       $52FD  
;;  $5324       $5318   $5320  
;;  $5326       $5300  
;;  $532E       $5332  
;;  $533D       $521D   $52CA   $5B28  
;;  $533E       $533C  
;;  $534E       $534C  
;;  $5382       $5385  
;;  $5395       $5397  
;;  $5399       $5392   $539C  
;;  $53A1       $51DD   $51E1  
;;  $53BA       $53AC  
;;  $53CA       $53A5   $53BD  
;;  $53DD       $53CE   $53D3  
;;  $53DE       $53CC  
;;  $53EF       $53EB  
;;  $53FA       $53E1  
;;  $53FB       $51A4  
;;  $5403       $540B  
;;  $5407       $53FF  
;;  $5408       $5405  
;;  $5423       $5425  
;;  $5429       $5447  
;;  $5439       $5435  
;;  $5440       $543C  
;;  $544B       $544C  
;;  $5450       $546E  
;;  $5460       $545C  
;;  $5467       $5463  
;;  $5472       $5473  
;;  $5479       $5189  
;;  $547C       $5506  
;;  $54C6       $54A9   $54AD   $54B1   $54B5   $54B9   $54BF  
;;  $54C7       $54C5  
;;  $54CC       $549F   $54A3  
;;  $54E0       $54D8  
;;  $54ED       $54E7  
;;  $5502       $5480   $548A   $5491   $549B   $54C3   $54CA  
;;  $5509       $67C0  
;;  $5535       $551B   $5520   $5526   $552A   $552F  
;;  $5550       $5546   $554A  
;;  $5558       $5554  
;;  $5559       $5515   $5533  
;;  $555B       $5497   $5511  
;;  $5580       $5565   $5571  
;;  $5581       $54EE   $5550  
;;  $558F       $558C  
;;  $559F       $559C  
;;  $55A7       $55A8  
;;  $55B2       $5186  
;;  $55E3       $55B8   $55BE   $55C4   $5655  
;;  $5602       $5620  
;;  $561C       $5605   $560F   $5616  
;;  $5624       $561A  
;;  $5653       $55E7   $55EF   $55FE   $5622  
;;  $5657       $55F5  
;;  $5658       $5158   $51A1  
;;  $5666       $565F  
;;  $567B       $566E  
;;  $5689       $567D  
;;  $56BB       $51BE  
;;  $56BC       $5679  
;;  $56C1       $56C7  
;;  $56CA       $56A7   $56AB   $5799  
;;  $56E3       $5669   $5691   $5699   $56D7  
;;  $56E4       $568D  
;;  $56EA       $56F7  
;;  $56F0       $56E6  
;;  $56F5       $56FB  
;;  $571B       $5719  
;;  $5748       $56AD  
;;  $5752       $56B9  
;;  $5764       $5758   $575D  
;;  $5799       $5762  
;;  $579B       $5198  
;;  $57AA       $57A4  
;;  $57AC       $57A8  
;;  $57B2       $57AE  
;;  $57B7       $57B4  
;;  $57D2       $57D5  
;;  $57DA       $52CF  
;;  $57E1       $57C6  
;;  $57F2       $57EB  
;;  $57F8       $57F0  
;;  $5804       $57F4  
;;  $580B       $5806  
;;  $580D       $57E7   $5809  
;;  $5815       $5821   $5836   $5847  
;;  $581F       $5819  
;;  $5824       $5195  
;;  $585C       $5859  
;;  $5867       $5863   $586C  
;;  $586F       $5869  
;;  $5875       $5871  
;;  $5880       $587C  
;;  $58B9       $58AF  
;;  $58C1       $58AD  
;;  $58C5       $58B7   $58BF  
;;  $58DA       $58D2  
;;  $58F1       $584E   $5884  
;;  $5910       $590D  
;;  $5923       $591B  
;;  $5942       $593B  
;;  $594A       $5942  
;;  $594E       $5940   $5948  
;;  $595C       $5B6F  
;;  $596D       $596A  
;;  $5977       $5971  
;;  $598B       $597F  
;;  $5993       $597C   $5985   $5989   $598F  
;;  $59AE       $5938   $59A2   $59A8   $59BE  
;;  $59B0       $59C7  
;;  $59B9       $58C8   $5902   $5951   $5961   $59B4  
;;  $59C9       $58C5   $58FF   $594E   $59B0  
;;  $59DA       $59E6  
;;  $59E9       $59DF  
;;  $59EB       $59E2  
;;  $59EF       $5886  
;;  $59F1       $59F9  
;;  $59FC       $59F4  
;;  $59FD       $58CD   $5923   $59B6  
;;  $5A17       $5A11  
;;  $5A19       $5A07   $5A0B   $5A15  
;;  $5A27       $5A1F   $5A23  
;;  $5AB2       $523F   $57D7   $67B7  
;;  $5AB3       $523C  
;;  $5AB7       $5AC9  
;;  $5ABC       $5ABE  
;;  $5AC4       $5AC6  
;;  $5AD1       $525D  
;;  $5AD2       $5AD0   $5AE0  
;;  $5AE9       $5B00  
;;  $5AF0       $5AEC  
;;  $5B02       $5AE5   $5AFD  
;;  $5B4E       $5B2B  
;;  $5B4F       $5311   $53F7   $5B02  
;;  $5B60       $5B5D  
;;  $5B6A       $5B6A  
;;  $5BEC       $539E  
;;  $5BEF       $5BF4  
;;  $5C07       $5C05  
;;  $5C16       $5C16  
;;  $5C2D       $5FA9   $5FE3   $600E  
;;  $5C45       $5C40  
;;  $5C64       $5C5B  
;;  $5C71       $5C6D   $5C72  
;;  $5C83       $5C67   $5C7A  
;;  $5C85       $5C7E  
;;  $5C89       $5C56   $5C81  
;;  $5C8F       $5BEF  
;;  $5C93       $5C33   $5C37   $5C3B   $5C4D  
;;  $5CA9       $5CA0   $5CA6  
;;  $5CAA       $5C8D  
;;  $5CCB       $5CC5  
;;  $5CD0       $5CDD  
;;  $5CEA       $5D04  
;;  $5CEE       $5CFF  
;;  $5D32       $5CC9   $5D0C   $5DF7   $5E0E  
;;  $5D35       $5D7F  
;;  $5D38       $5CC1   $5D45   $5D4F   $5D51   $5D53   $5D57   $5D59   $5DCD  
;;  $5D38       $5DD9   $5DE3   $5DEF   $5FBD   $5FEB   $6016  
;;  $5D47       $5CB9  
;;  $5D79       $5D65   $5D71   $5D75   $5D89   $5D91   $5D95   $5D99   $5D9B  
;;  $5D79       $5D9F  
;;  $5D81       $5D55  
;;  $5D8B       $5B73  
;;  $5D9B       $5D69   $5D8D  
;;  $5DA1       $5D4D  
;;  $5DCB       $5DC8  
;;  $5DD1       $5DD7  
;;  $5DDB       $5DB7   $5DD3  
;;  $5DE5       $5D5B  
;;  $5DF1       $5CC7  
;;  $5E43       $5E51  
;;  $5E53       $5E3F  
;;  $5E5C       $5E59  
;;  $5E5E       $5E77  
;;  $5E79       $5E54  
;;  $5E93       $5E9A  
;;  $5E9C       $5E8B  
;;  $5E9E       $5EA7  
;;  $5EAD       $5EAA   $5EB0  
;;  $5EB4       $5E84  
;;  $5EBD       $5EB8  
;;  $5EC1       $5ED2  
;;  $5EDD       $5F0E  
;;  $5EE1       $5EFD  
;;  $5F14       $5ED9  
;;  $5F16       $5F35  
;;  $5F1B       $5F2E  
;;  $5F39       $5E81  
;;  $5F44       $5F4B  
;;  $5F51       $5F5A  
;;  $5F5E       $5EB2   $5F12   $5F37   $5F3C  
;;  $5F70       $5F87  
;;  $5F89       $5F6C  
;;  $5F97       $5F94  
;;  $5FA9       $5FB8  
;;  $5FB4       $5FB1  
;;  $5FBA       $5F8A  
;;  $5FCD       $5FCA  
;;  $5FD8       $5FD5  
;;  $5FE3       $5FE9  
;;  $5FED       $5FC0  
;;  $5FF8       $5FF5  
;;  $6003       $6000  
;;  $600E       $6014  
;;  $6018       $530E   $53E7   $5B09   $5B31  
;;  $6019       $5B60  
;;  $601A       $5B57  
;;  $6039       $6033  
;;  $603A       $601F   $6024   $6029   $602E  
;;  $603E       $6043  
;;  $6045       $603F  
;;  $6049       $603C  
;;  $604D       $51FC   $5239   $52DE   $57DD   $5B10   $5B38   $5BF8   $67B4  
;;  $6057       $605E  
;;  $6068       $5DA1   $5DE5  
;;  $606B       $606E  
;;  $6072       $6075  
;;  $6078       $607B  
;;  $6083       $6086  
;;  $6089       $54D0   $553A   $5644  
;;  $608F       $5303   $53F4  
;;  $60A6       $609E  
;;  $60AD       $6098   $60A4  
;;  $60B1       $5D35  
;;  $60B5       $60F8  
;;  $60D1       $60CC   $6102  
;;  $60F5       $60CF   $60D2   $60EF  
;;  $60FF       $610C   $6116   $6122   $6141   $6155   $6163   $6186   $6197  
;;  $60FF       $61AC  
;;  $6100       $610F   $6112  
;;  $610E       $6109  
;;  $6134       $6128   $612E  
;;  $6160       $615A  
;;  $6161       $615F  
;;  $6165       $615C  
;;  $6192       $618A   $618E  
;;  $61D9       $61D7  
;;  $61E6       $61E4  
;;  $626F       $625B  
;;  $6315       $5DEC  
;;  $632B       $5DA6  
;;  $6333       $631E  
;;  $6337       $6327   $633B  
;;  $6340       $634C  
;;  $6342       $6347  
;;  $63C3       $63C3  
;;  $6407       $6405  
;;  $6412       $6412  
;;  $641C       $641A  
;;  $641D       $641B  
;;  $6424       $6422  
;;  $65B7       $65B5  
;;  $665D       $665B  
;;  $66B9       $66B7  
;;  $66BA       $66B8  
;;  $66BB       $66B9  
;;  $66D7       $55A1   $5F9C   $5FDD   $6008  
;;  $66DA       $66DD  
;;  $66DB       $66DF  
;;  $66DC       $66D8  
;;  $66E2       $5958   $5974   $5A30  
;;  $66E4       $66E6  
;;  $66E8       $66F0  
;;  $66EF       $66EB  
;;  $66F3       $51C3   $5875   $59D0   $61A2   $68EF  
;;  $66F6       $6705  
;;  $670B       $515D  
;;  $6714       $6723   $672A  
;;  $6728       $6725  
;;  $672D       $519E  
;;  $6735       $674E  
;;  $6745       $673D  
;;  $674B       $6743  
;;  $6751       $518C  
;;  $6755       $6841  
;;  $6764       $67C4   $67CC   $683B  
;;  $6783       $6771  
;;  $6787       $67D5  
;;  $678F       $6785  
;;  $679F       $679B  
;;  $67A9       $67AC  
;;  $67B7       $67AF  
;;  $67BB       $6794  
;;  $67C6       $67BD  
;;  $67CE       $67C8  
;;  $681A       $678F  
;;  $683D       $6759   $675E   $6781   $678D   $67EF   $6879   $688B  
;;  $6844       $6844  
;;  $684A       $6762  
;;  $686A       $6867  
;;  $68EC       $5121   $520E  
;;  $68ED       $68F4   $68F8  
;;  $6923       $6926  
;;  $693D       $693B  
;;  $6ABF       $6ABD  
;;  $6AC5       $6AC3  
;;  $6AFD       $52A5  
;;  $6BC5       $6BC3  
;;  $6FE8       $6FE6  
;; ======================================================================== ;;
