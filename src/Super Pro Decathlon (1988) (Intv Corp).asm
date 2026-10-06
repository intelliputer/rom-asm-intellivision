
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $0000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500E           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
.TITLE:
        DECLE   $0056           ; 500E  Cartridge year
        STRING  " "             ; 500F  Title string
.TITLECODE:
        EIS                     ; 5011  Color Stack init (2, 3)
        DECLE   $0168           ; 5013  Border color init


        ADDR    R5,     R4                      ; 5014   00EC
        DIS                                     ; 5015   0003
        CLRR    R0                              ; 5016   01C0
        CLRR    R5                              ; 5017   01ED
L_5018:
        MVO@    R0,     R5                      ; 5018   0268
        CMPI    #$035D, R5                      ; 5019   037D 035D
        BNEQ    L_5018                          ; 501B   022C 0004

        MVII    #$02F0, R6                      ; 501D   02BE 02F0
        SDBD                                    ; 501F   0001
        MVII    #$FFFF, R0                      ; 5020   02B8 00FF 00FF
        PSHR    R0                              ; 5023   0270
        PSHR    R0                              ; 5024   0270
        PSHR    R0                              ; 5025   0270
        PSHR    R0                              ; 5026   0270
        PSHR    R0                              ; 5027   0270
        PSHR    R0                              ; 5028   0270
        PSHR    R0                              ; 5029   0270
        PSHR    R0                              ; 502A   0270
        PSHR    R0                              ; 502B   0270
        PSHR    R0                              ; 502C   0270
        PSHR    R0                              ; 502D   0270
        PSHR    R0                              ; 502E   0270
        PSHR    R0                              ; 502F   0270
        PSHR    R0                              ; 5030   0270
        PSHR    R0                              ; 5031   0270
        PSHR    R0                              ; 5032   0270
        PSHR    R0                              ; 5033   0270
        PSHR    R0                              ; 5034   0270
        PSHR    R0                              ; 5035   0270
        PSHR    R0                              ; 5036   0270
        PSHR    R0                              ; 5037   0270
        PSHR    R0                              ; 5038   0270
        PSHR    R0                              ; 5039   0270
        PSHR    R0                              ; 503A   0270
        PSHR    R0                              ; 503B   0270
        PSHR    R0                              ; 503C   0270
        PSHR    R0                              ; 503D   0270
        PSHR    R0                              ; 503E   0270
        PSHR    R0                              ; 503F   0270
        PSHR    R0                              ; 5040   0270
        PSHR    R0                              ; 5041   0270
        PSHR    R0                              ; 5042   0270
        PSHR    R0                              ; 5043   0270
        PSHR    R0                              ; 5044   0270
        PSHR    R0                              ; 5045   0270
        PSHR    R0                              ; 5046   0270
        PSHR    R0                              ; 5047   0270
        PSHR    R0                              ; 5048   0270
        PSHR    R0                              ; 5049   0270
        PSHR    R0                              ; 504A   0270
        PSHR    R0                              ; 504B   0270
        MVII    #$02F0, R6                      ; 504C   02BE 02F0
        MVII    #$0010, R0                      ; 504E   02B8 0010
        MVII    #$00FF, R1                      ; 5050   02B9 00FF
        MVII    #$010B, R4                      ; 5052   02BC 010B

        JSR     R5,     X_FILL_MEM              ; 5054   0004 0114 0341

        MVII    #$003F, R0                      ; 5057   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 5059   0240 01F8

        JSR     R5,     L_68E4                  ; 505B   0004 0168 00E4
        BIDECLE $60D1                           ; 505E   00D1 0060

        SDBD                                    ; 5060   0001
        MVII    #$AF04, R0                      ; 5061   02B8 0004 00AF
        MVO     R0,     G_0343                  ; 5064   0240 0343

        JSR     R5,     L_68CE                  ; 5066   0004 0168 00CE
        JSR     R5,     L_6E70                  ; 5069   0004 016C 0270
        DECLE   $0000                           ; 506C   0000
L_506D:
        EIS                                     ; 506D   0002
        MVI     G_0102, R0                      ; 506E   0280 0102
        DECR    R0                              ; 5070   0010
        BPL     L_506D                          ; 5071   0223 0005

        JSR     R5,     L_51E3                  ; 5073   0004 0150 01E3
        JSR     R5,     L_699A                  ; 5076   0004 0168 019A
        JSR     R5,     L_509B                  ; 5079   0004 0150 009B
        JSR     R5,     L_50A6                  ; 507C   0004 0150 00A6

        MVII    #$0001, R0                      ; 507F   02B8 0001
        MVO     R0,     G_0102                  ; 5081   0240 0102
        B       L_506D                          ; 5083   0220 0017

        ADDR    R5,     R5                      ; 5085   00ED
        RLC     R1,     1                       ; 5086   0051
        ADDR    R5,     R7                      ; 5087   00EF

        DECLE   $0050,  $00A5,  $0050,  $0012   ; 5088   0050 00A5 0050 0012
        DECLE   $0052,  $0038,  $0053,  $00ED   ; 508C   0052 0038 0053 00ED
        DECLE   $0054,  $003F                   ; 5090   0054 003F

        RLC     R3,     2                       ; 5092   0057
        TSTR    R6                              ; 5093   00B6
        SLLC    R2,     1                       ; 5094   005A
        SLLC    R0,     1                       ; 5095   0058
        SLLC    R3,     1                       ; 5096   005B
        ADDR    R2,     R6                      ; 5097   00D6
        SLLC    R2,     1                       ; 5098   005A
        ADDR    R7,     R6                      ; 5099   00FE
        SAR     R1,     2                       ; 509A   006D
L_509B:
        MVI     G_0347, R4                      ; 509B   0284 0347
        ADDR    R4,     R4                      ; 509D   00E4
        SDBD                                    ; 509E   0001
        ADDI    #$5085, R4                      ; 509F   02FC 0085 0050
        SDBD                                    ; 50A2   0001
        MVI@    R4,     R0                      ; 50A3   02A0
        MOVR    R0,     R7                      ; 50A4   0087
        MOVR    R5,     R7                      ; 50A5   00AF

L_50A6:
        PSHR    R5                              ; 50A6   0275
        MVI     G_0105, R0                      ; 50A7   0280 0105
        ANDI    #$0007, R0                      ; 50A9   03B8 0007
        MOVR    R0,     R1                      ; 50AB   0081
        SUB     G_0136, R0                      ; 50AC   0300 0136
        BEQ     L_50C5                          ; 50AE   0204 0015

        MVO     R1,     G_0136                  ; 50B0   0241 0136
        NEGR    R0                              ; 50B2   0020
        MVII    #$0318, R3                      ; 50B3   02BB 0318
L_50B5:
        MVI@    R3,     R4                      ; 50B5   029C
        MOVR    R4,     R5                      ; 50B6   00A5
        ADDR    R0,     R4                      ; 50B7   00C4
        ANDI    #$00FF, R4                      ; 50B8   03BC 00FF
        SDBD                                    ; 50BA   0001
        ANDI    #$FF00, R5                      ; 50BB   03BD 0000 00FF
        ADDR    R5,     R4                      ; 50BE   00EC
        MVO@    R4,     R3                      ; 50BF   025C
        INCR    R3                              ; 50C0   000B
        CMPI    #$0320, R3                      ; 50C1   037B 0320
        BNEQ    L_50B5                          ; 50C3   022C 000F

L_50C5:
        MVI     G_0148, R0                      ; 50C5   0280 0148
        CMPI    #$0002, R0                      ; 50C7   0378 0002
        BNEQ    L_50D7                          ; 50C9   020C 000C

        MVII    #$0080, R0                      ; 50CB   02B8 0080
        MVI     G_0346, R1                      ; 50CD   0281 0346
        ANDI    #$0020, R1                      ; 50CF   03B9 0020
        BEQ     L_50D5                          ; 50D1   0204 0002

        ADDI    #$0010, R0                      ; 50D3   02F8 0010
L_50D5:
        MVO     R0,     G_011C                  ; 50D5   0240 011C

L_50D7:
        JSR     R5,     L_5F2C                  ; 50D7   0004 015C 032C

L_50DA:
        PULR    R7                              ; 50DA   02B7

L_50DB:
        PSHR    R5                              ; 50DB   0275

        JSR     R5,     L_68C7                  ; 50DC   0004 0168 00C7

        SDBD                                    ; 50DF   0001
        MVII    #$A6C8, R0                      ; 50E0   02B8 00C8 00A6
        MVO     R0,     G_0348                  ; 50E3   0240 0348
        MVO     R0,     G_0349                  ; 50E5   0240 0349
        MVII    #$0001, R0                      ; 50E7   02B8 0001
        MVO     R0,     G_0347                  ; 50E9   0240 0347

        JSR     R5,     L_68B7                  ; 50EB   0004 0168 00B7

        PULR    R7                              ; 50EE   02B7

        MVI     G_012B, R0                      ; 50EF   0280 012B
        DECR    R0                              ; 50F1   0010
        MVO     R0,     G_012B                  ; 50F2   0240 012B
        BPL     L_5101                          ; 50F4   0203 000B

        MVII    #$0002, R0                      ; 50F6   02B8 0002
        MVO     R0,     G_012B                  ; 50F8   0240 012B
        MVI     G_0106, R0                      ; 50FA   0280 0106
        DECR    R0                              ; 50FC   0010
        ANDI    #$000F, R0                      ; 50FD   03B8 000F
        MVO     R0,     G_0106                  ; 50FF   0240 0106
L_5101:
        MOVR    R5,     R7                      ; 5101   00AF

        PSHR    R5                              ; 5102   0275
        CMPI    #$00FF, R0                      ; 5103   0378 00FF
        BNEQ    L_50DA                          ; 5105   022C 002C

        CLRR    R0                              ; 5107   01C0
        MVO     R0,     G_0106                  ; 5108   0240 0106

        JSR     R5,     L_68C7                  ; 510A   0004 0168 00C7
        JSR     R5,     L_68B7                  ; 510D   0004 0168 00B7

        MVII    #$0002, R0                      ; 5110   02B8 0002
        MVO     R0,     G_0347                  ; 5112   0240 0347
        SDBD                                    ; 5114   0001
        MVII    #$AF0A, R0                      ; 5115   02B8 000A 00AF
        MVO     R0,     G_0343                  ; 5118   0240 0343

        JSR     R5,     L_6B04                  ; 511A   0004 0168 0304

        PULR    R7                              ; 511D   02B7

L_511E:
        PSHR    R5                              ; 511E   0275
        MVI     G_0319, R0                      ; 511F   0280 0319
        MVI     G_034A, R1                      ; 5121   0281 034A
        ANDI    #$00FF, R0                      ; 5123   03B8 00FF
        ADDR    R1,     R0                      ; 5125   00C8
        MVI     G_033C, R1                      ; 5126   0281 033C
        ADDI    #$003D, R1                      ; 5128   02F9 003D
        SUBR    R0,     R1                      ; 512A   0101
        BPL     L_5152                          ; 512B   0203 0025

        MVI     G_014C, R0                      ; 512D   0280 014C
        ANDI    #$00FE, R0                      ; 512F   03B8 00FE
        ADDI    #$0001, R0                      ; 5131   02F8 0001
        MVO     R0,     G_014C                  ; 5133   0240 014C
        MVI     G_0149, R0                      ; 5135   0280 0149
        CMPI    #$0007, R0                      ; 5137   0378 0007
        BEQ     L_5152                          ; 5139   0204 0017

        CMPI    #$0003, R0                      ; 513B   0378 0003
        BEQ     L_5152                          ; 513D   0204 0013

        JSR     R5,     L_5153                  ; 513F   0004 0150 0153
        DECLE   $0280,  $0346,  $0240,  $034B   ; 5142   0280 0346 0240 034B
        DECLE   $0004                           ; 5146   0004

        ANDR    R5,     R4                      ; 5147   01AC
        CMP@    R6,     R1                      ; 5148   0371
        MVI     G_034A, R1                      ; 5149   0281 034A
        MVI     G_033C, R0                      ; 514B   0280 033C
        SUBR    R1,     R0                      ; 514D   0108
        ADDI    #$0010, R0                      ; 514E   02F8 0010
        MVO     R0,     G_034D                  ; 5150   0240 034D
L_5152:
        PULR    R7                              ; 5152   02B7

L_5153:
        MVII    #$0080, R0                      ; 5153   02B8 0080
        MVO     R0,     G_011C                  ; 5155   0240 011C
        MVII    #$0002, R0                      ; 5157   02B8 0002
        MVO     R0,     G_0148                  ; 5159   0240 0148
        MOVR    R5,     R7                      ; 515B   00AF

        PSHR    R5                              ; 515C   0275
        MVI@    R3,     R1                      ; 515D   0299
        SLR     R0,     1                       ; 515E   0060
        SLR     R1,     1                       ; 515F   0061
        CMPR    R0,     R1                      ; 5160   0141
        BEQ     L_517E                          ; 5161   0204 001B

        MVI     G_033E, R0                      ; 5163   0280 033E
        DECR    R0                              ; 5165   0010
        MVO     R0,     G_033E                  ; 5166   0240 033E
        MVI     G_0132, R0                      ; 5168   0280 0132
        TSTR    R0                              ; 516A   0080
        BNEQ    L_5172                          ; 516B   020C 0005

        MVO     R0,     G_0346                  ; 516D   0240 0346
        INCR    R0                              ; 516F   0008
        MVO     R0,     G_0132                  ; 5170   0240 0132
L_5172:
        MVII    #$0082, R0                      ; 5172   02B8 0082
        MVI     G_0149, R1                      ; 5174   0281 0149
        CMPI    #$0006, R1                      ; 5176   0379 0006
        BEQ     L_517C                          ; 5178   0204 0002

        MVII    #$011F, R0                      ; 517A   02B8 011F
L_517C:
        MVO     R0,     G_033D                  ; 517C   0240 033D
L_517E:
        PULR    R7                              ; 517E   02B7

        DECLE   $0275,  $0004                   ; 517F   0275 0004

        ANDR    R5,     R4                      ; 5181   01AC
        CMP@    R6,     R1                      ; 5182   0371
        MVI     G_0131, R0                      ; 5183   0280 0131
        INCR    R0                              ; 5185   0008
        MVO     R0,     G_0131                  ; 5186   0240 0131
        MVII    #$0030, R0                      ; 5188   02B8 0030
        MVO     R0,     G_011C                  ; 518A   0240 011C
        PULR    R7                              ; 518C   02B7

        DECLE   $0006,  $0003,  $0000,  $0003   ; 518D   0006 0003 0000 0003
        DECLE   $0006,  $0003,  $0000           ; 5191   0006 0003 0000

        DIS                                     ; 5194   0003
L_5195:
        PSHR    R5                              ; 5195   0275
        MOVR    R0,     R1                      ; 5196   0081
        SLR     R1,     2                       ; 5197   0065
        SLR     R1,     2                       ; 5198   0065
        SDBD                                    ; 5199   0001
        MVII    #$518D, R4                      ; 519A   02BC 008D 0051
        ADDR    R1,     R4                      ; 519D   00CC
        MVI@    R4,     R1                      ; 519E   02A1
        MVII    #$0319, R2                      ; 519F   02BA 0319
        MVI@    R2,     R3                      ; 51A1   0293
        ANDI    #$00FF, R3                      ; 51A2   03BB 00FF
        ADDI    #$0003, R2                      ; 51A4   02FA 0003
        MVI@    R2,     R4                      ; 51A6   0294
        SDBD                                    ; 51A7   0001
        ANDI    #$FF00, R4                      ; 51A8   03BC 0000 00FF
        ADDR    R3,     R4                      ; 51AB   00DC
        ADDR    R1,     R4                      ; 51AC   00CC
        SUBI    #$0005, R4                      ; 51AD   033C 0005
        MVO@    R4,     R2                      ; 51AF   0254
        PULR    R7                              ; 51B0   02B7

        DECLE   $0000,  $0019,  $0001           ; 51B1   0000 0019 0001

        MOVR    R2,     R1                      ; 51B4   0091
        TSTR    R2                              ; 51B5   0092
        MOVR    R2,     R1                      ; 51B6   0091
        TSTR    R2                              ; 51B7   0092
        TSTR    R2                              ; 51B8   0092
L_51B9:
        PSHR    R5                              ; 51B9   0275
        MOVR    R0,     R1                      ; 51BA   0081
        SLR     R1,     2                       ; 51BB   0065
        SLR     R1,     2                       ; 51BC   0065
        SDBD                                    ; 51BD   0001
        MVII    #$51B1, R4                      ; 51BE   02BC 00B1 0051
        ADDR    R1,     R4                      ; 51C1   00CC
        MVI@    R4,     R1                      ; 51C2   02A1
        MOVR    R1,     R2                      ; 51C3   008A
        ANDI    #$000F, R1                      ; 51C4   03B9 000F
        MVII    #$031C, R4                      ; 51C6   02BC 031C

        JSR     R5,     L_51D4                  ; 51C8   0004 0150 01D4

        ADDI    #$0007, R4                      ; 51CB   02FC 0007
        MOVR    R2,     R1                      ; 51CD   0091
        SLR     R1,     2                       ; 51CE   0065
        SLR     R1,     2                       ; 51CF   0065

        JSR     R5,     L_51D4                  ; 51D0   0004 0150 01D4

        PULR    R7                              ; 51D3   02B7

L_51D4:
        PSHR    R5                              ; 51D4   0275
        MVI@    R4,     R3                      ; 51D5   02A3
        DECR    R4                              ; 51D6   0014
        CMPI    #$0008, R1                      ; 51D7   0379 0008
        BGE     L_51DE                          ; 51D9   020D 0003

        ADDR    R1,     R3                      ; 51DB   00CB
        B       L_51E1                          ; 51DC   0200 0003

L_51DE:
        ANDI    #$0007, R1                      ; 51DE   03B9 0007
        SUBR    R1,     R3                      ; 51E0   010B
L_51E1:
        MVO@    R3,     R4                      ; 51E1   0263
        PULR    R7                              ; 51E2   02B7

L_51E3:
        PSHR    R5                              ; 51E3   0275
        MVI     G_0346, R0                      ; 51E4   0280 0346
        INCR    R0                              ; 51E6   0008
        MVO     R0,     G_0346                  ; 51E7   0240 0346

        JSR     R5,     L_6059                  ; 51E9   0004 0160 0059

        PULR    R7                              ; 51EC   02B7

        PSHR    R5                              ; 51ED   0275
        SDBD                                    ; 51EE   0001
        MVII    #$2A30, R5                      ; 51EF   02BD 0030 002A
        MVO     R5,     G_0345                  ; 51F2   0245 0345
        MVI     G_0346, R0                      ; 51F4   0280 0346
        CMPI    #$0180, R0                      ; 51F6   0378 0180
        BNEQ    L_51FD                          ; 51F8   020C 0003

        JSR     R5,     L_5C35                  ; 51FA   0004 015C 0035

L_51FD:
        CMPI    #$0300, R0                      ; 51FD   0378 0300
        BNEQ    L_5211                          ; 51FF   020C 0010

        JSR     R5,     L_5C2A                  ; 5201   0004 015C 002A

        CLRR    R0                              ; 5204   01C0
        MVO     R0,     G_0346                  ; 5205   0240 0346
        MVI     G_0131, R0                      ; 5207   0280 0131
        DECR    R0                              ; 5209   0010
        MVO     R0,     G_0131                  ; 520A   0240 0131
        BNEQ    L_5211                          ; 520C   020C 0003

        JSR     R5,     L_50DB                  ; 520E   0004 0150 00DB

L_5211:
        PULR    R7                              ; 5211   02B7

        PSHR    R5                              ; 5212   0275

        JSR     R5,     L_5239                  ; 5213   0004 0150 0239

        MVI     G_034A, R0                      ; 5216   0280 034A
        CMPI    #$0080, R0                      ; 5218   0378 0080
        BNEQ    L_5211                          ; 521A   022C 000A

        MVII    #$0004, R0                      ; 521C   02B8 0004
        MVO     R0,     G_0347                  ; 521E   0240 0347
        CLRR    R0                              ; 5220   01C0
        MVO     R0,     G_0346                  ; 5221   0240 0346
        SDBD                                    ; 5223   0001
        MVII    #$ABAD, R4                      ; 5224   02BC 00AD 00AB
        SDBD                                    ; 5227   0001
        MVII    #$947E, R5                      ; 5228   02BD 007E 0094
        SDBD                                    ; 522B   0001
        MVI@    R5,     R1                      ; 522C   02A9
        MVII    #$02BC, R5                      ; 522D   02BD 02BC
        MVII    #$0004, R2                      ; 522F   02BA 0004
L_5231:
        MVI@    R4,     R0                      ; 5231   02A0
        SLR     R0,     1                       ; 5232   0060
        ADDR    R1,     R0                      ; 5233   00C8
        MVO@    R0,     R5                      ; 5234   0268
        DECR    R2                              ; 5235   0012
        BNEQ    L_5231                          ; 5236   022C 0006
        PULR    R7                              ; 5238   02B7

L_5239:
        PSHR    R5                              ; 5239   0275
        MVI     G_034A, R0                      ; 523A   0280 034A
        INCR    R0                              ; 523C   0008
        MVO     R0,     G_034A                  ; 523D   0240 034A
        MVI     G_0105, R1                      ; 523F   0281 0105
        DECR    R1                              ; 5241   0011
        CMPI    #$0086, R1                      ; 5242   0379 0086
        BEQ     L_524E                          ; 5244   0204 0008

        ANDI    #$0007, R1                      ; 5246   03B9 0007
        CMPI    #$0007, R1                      ; 5248   0379 0007
        BNEQ    L_524E                          ; 524A   020C 0002

        ADDI    #$0080, R1                      ; 524C   02F9 0080
L_524E:
        MVO     R1,     G_0105                  ; 524E   0241 0105

        JSR     R5,     L_525A                  ; 5250   0004 0150 025A
        JSR     R5,     L_52F9                  ; 5253   0004 0150 02F9
        JSR     R5,     L_5303                  ; 5256   0004 0150 0303

        PULR    R7                              ; 5259   02B7

L_525A:
        PSHR    R5                              ; 525A   0275
        MVI     G_0149, R0                      ; 525B   0280 0149
        CMPI    #$0005, R0                      ; 525D   0378 0005
        BNEQ    L_5272                          ; 525F   020C 0011

        MVI     G_0347, R0                      ; 5261   0280 0347
        CMPI    #$0006, R0                      ; 5263   0378 0006
        BNEQ    L_5272                          ; 5265   020C 000B

        MVII    #$0003, R2                      ; 5267   02BA 0003
        MVII    #$031C, R3                      ; 5269   02BB 031C

L_526B:
        JSR     R5,     L_5273                  ; 526B   0004 0150 0273

        INCR    R3                              ; 526E   000B
        DECR    R2                              ; 526F   0012
        BNEQ    L_526B                          ; 5270   022C 0006
L_5272:
        PULR    R7                              ; 5272   02B7

L_5273:
        PSHR    R5                              ; 5273   0275
        MVI@    R3,     R0                      ; 5274   0298
        DECR    R0                              ; 5275   0010
        MOVR    R0,     R1                      ; 5276   0081
        ANDI    #$00FF, R1                      ; 5277   03B9 00FF
        BNEQ    L_529B                          ; 5279   020C 0020

        SDBD                                    ; 527B   0001
        ANDI    #$40FF, R0                      ; 527C   03B8 00FF 0040
        ADDI    #$00D8, R0                      ; 527F   02F8 00D8
        MVI     G_034A, R4                      ; 5281   0284 034A
        CMPI    #$0258, R4                      ; 5283   037C 0258
        BGE     L_529B                          ; 5285   020D 0014

        ADDI    #$0200, R0                      ; 5287   02F8 0200
        SDBD                                    ; 5289   0001
        CMPI    #$3FFF, R0                      ; 528A   0378 00FF 003F
        BLT     L_529B                          ; 528D   0205 000C

        ADDI    #$0008, R3                      ; 528F   02FB 0008
        MVI@    R3,     R4                      ; 5291   029C
        SUBI    #$0008, R4                      ; 5292   033C 0008
        MVO@    R4,     R3                      ; 5294   025C
        SUBI    #$0008, R3                      ; 5295   033B 0008
        SUBI    #$0008, R0                      ; 5297   0338 0008
        ANDI    #$02FF, R0                      ; 5299   03B8 02FF
L_529B:
        MVO@    R0,     R3                      ; 529B   0258
        PULR    R7                              ; 529C   02B7

L_529D:
        PSHR    R5                              ; 529D   0275
        MVII    #$0003, R2                      ; 529E   02BA 0003
        MVII    #$031C, R3                      ; 52A0   02BB 031C

L_52A2:
        JSR     R5,     L_52AA                  ; 52A2   0004 0150 02AA

        INCR    R3                              ; 52A5   000B
        DECR    R2                              ; 52A6   0012
        BNEQ    L_52A2                          ; 52A7   022C 0006
        PULR    R7                              ; 52A9   02B7

L_52AA:
        PSHR    R5                              ; 52AA   0275
        MVI@    R3,     R0                      ; 52AB   0298
        MOVR    R0,     R1                      ; 52AC   0081
        ANDI    #$00FF, R1                      ; 52AD   03B9 00FF
        SDBD                                    ; 52AF   0001
        CMPI    #$3FFF, R0                      ; 52B0   0378 00FF 003F
        BGT     L_52DD                          ; 52B3   020E 0028

        MVI     G_0319, R4                      ; 52B5   0284 0319
        ANDI    #$00FF, R4                      ; 52B7   03BC 00FF
        SUBR    R4,     R1                      ; 52B9   0121
        BMI     L_52F8                          ; 52BA   020B 003C

        CMPI    #$0001, R1                      ; 52BC   0379 0001
        BGT     L_52F8                          ; 52BE   020E 0038

        MVI     G_0321, R4                      ; 52C0   0284 0321
        ANDI    #$007F, R4                      ; 52C2   03BC 007F
        CMPI    #$0054, R4                      ; 52C4   037C 0054
        BLT     L_52F8                          ; 52C6   0205 0030

        ANDI    #$03FF, R0                      ; 52C8   03B8 03FF
        CMPI    #$0200, R0                      ; 52CA   0378 0200
        BLT     L_52F8                          ; 52CC   0205 002A

        SDBD                                    ; 52CE   0001
        ADDI    #$4000, R0                      ; 52CF   02F8 0000 0040
        MVO@    R0,     R3                      ; 52D2   0258
        MVI     G_034D, R1                      ; 52D3   0281 034D
        SLR     R1,     1                       ; 52D5   0061
        MVO     R1,     G_034D                  ; 52D6   0241 034D

        JSR     R5,     L_6E70                  ; 52D8   0004 016C 0270
        DECLE   $001B                           ; 52DB   001B
L_52DC:
        PULR    R7                              ; 52DC   02B7

L_52DD:
        SDBD                                    ; 52DD   0001
        CMPI    #$3FFF, R0                      ; 52DE   0378 00FF 003F
        BLE     L_52F8                          ; 52E1   0206 0015

        ADDI    #$0008, R3                      ; 52E3   02FB 0008
        MVI@    R3,     R1                      ; 52E5   0299
        SUBI    #$0008, R3                      ; 52E6   033B 0008
        ANDI    #$007F, R1                      ; 52E8   03B9 007F
        CMPI    #$0056, R1                      ; 52EA   0379 0056
        BEQ     L_52F8                          ; 52EC   0204 000A

        MVI@    R3,     R1                      ; 52EE   0299
        INCR    R1                              ; 52EF   0009
        MVO@    R1,     R3                      ; 52F0   0259
        ADDI    #$0008, R3                      ; 52F1   02FB 0008
        MVI@    R3,     R1                      ; 52F3   0299
        INCR    R1                              ; 52F4   0009
        MVO@    R1,     R3                      ; 52F5   0259
        SUBI    #$0008, R3                      ; 52F6   033B 0008
L_52F8:
        PULR    R7                              ; 52F8   02B7

L_52F9:
        PSHR    R5                              ; 52F9   0275
        MVI     G_0149, R0                      ; 52FA   0280 0149
        CMPI    #$0003, R0                      ; 52FC   0378 0003
        BNEQ    L_5302                          ; 52FE   020C 0002
        B       L_530A                          ; 5300   0200 0008
L_5302:
        PULR    R7                              ; 5302   02B7

L_5303:
        PSHR    R5                              ; 5303   0275
        MVI     G_0149, R0                      ; 5304   0280 0149
        CMPI    #$0007, R0                      ; 5306   0378 0007
        BNEQ    L_5302                          ; 5308   022C 0007

L_530A:
        MVI     G_0347, R0                      ; 530A   0280 0347
        CMPI    #$0006, R0                      ; 530C   0378 0006
        BNEQ    L_5302                          ; 530E   022C 000D

        MVII    #$0318, R3                      ; 5310   02BB 0318

        JSR     R5,     L_531F                  ; 5312   0004 0150 031F

        ADDI    #$0006, R3                      ; 5315   02FB 0006

        JSR     R5,     L_531F                  ; 5317   0004 0150 031F

        INCR    R3                              ; 531A   000B

        JSR     R5,     L_531F                  ; 531B   0004 0150 031F

        PULR    R7                              ; 531E   02B7

L_531F:
        PSHR    R5                              ; 531F   0275
        MVI@    R3,     R0                      ; 5320   0298
        MOVR    R0,     R1                      ; 5321   0081
        ANDI    #$00FF, R1                      ; 5322   03B9 00FF
        DECR    R1                              ; 5324   0011
        ANDI    #$00FF, R1                      ; 5325   03B9 00FF
        SDBD                                    ; 5327   0001
        ANDI    #$FF00, R0                      ; 5328   03B8 0000 00FF
        ADDR    R1,     R0                      ; 532B   00C8
        CMPI    #$00E0, R1                      ; 532C   0379 00E0
        BLT     L_5336                          ; 532E   0205 0006

        SDBD                                    ; 5330   0001
        ANDI    #$FDFF, R0                      ; 5331   03B8 00FF 00FD
        ADDI    #$0200, R0                      ; 5334   02F8 0200
L_5336:
        MVO@    R0,     R3                      ; 5336   0258
        PULR    R7                              ; 5337   02B7

        PSHR    R5                              ; 5338   0275
        MVI     G_0346, R0                      ; 5339   0280 0346
        CMPI    #$00B4, R0                      ; 533B   0378 00B4
        BNEQ    L_5211                          ; 533D   022C 012D

        MVI     G_0341, R0                      ; 533F   0280 0341
        ANDI    #$003F, R0                      ; 5341   03B8 003F
        MVO     R0,     G_0346                  ; 5343   0240 0346
        MVII    #$0005, R0                      ; 5345   02B8 0005
        MVO     R0,     G_0347                  ; 5347   0240 0347

        JSR     R5,     L_66AE                  ; 5349   0004 0164 02AE

        MVI     .BTAB.7E,R0                     ; 534C   0280 027E
        MVO     R0,     G_033E                  ; 534E   0240 033E
        MVII    #$0003, R0                      ; 5350   02B8 0003
        MVII    #$0319, R3                      ; 5352   02BB 0319
        MOVR    R7,     R4                      ; 5354   00BC
        ADDI    #$02E3, R4                      ; 5355   02FC 02E3

        JSR     R5,     L_692C                  ; 5357   0004 0168 012C
        JSR     R5,     L_6E70                  ; 535A   0004 016C 0270
        DECLE   $0006                           ; 535D   0006

        MVII    #$0330, R5                      ; 535E   02BD 0330
        CLRR    R0                              ; 5360   01C0
L_5361:
        MVO@    R0,     R5                      ; 5361   0268
        CMPI    #$0338, R5                      ; 5362   037D 0338
        BNEQ    L_5361                          ; 5364   022C 0004

        MVI     G_0149, R1                      ; 5366   0281 0149
        INCR    R1                              ; 5368   0009
        ADDR    R7,     R1                      ; 5369   00F9
        ADD@    R1,     R7                      ; 536A   02CF

        INCR    R3                              ; 536B   000B
        ADCR    R0                              ; 536C   0028
        RSWD    R5                              ; 536D   003D
        RRC     R0,     1                       ; 536E   0070
        ADCR    R0                              ; 536F   0028
        MOVR    R4,     R2                      ; 5370   00A2
        MOVR    R7,     R6                      ; 5371   00BE
        ADDR    R3,     R2                      ; 5372   00DA
        SUBR    R6,     R5                      ; 5373   0135
        MOVR    R4,     R0                      ; 5374   00A0
        CMPR    R6,     R0                      ; 5375   0170

L_5376:
        JSR     R5,     L_690B                  ; 5376   0004 0168 010B
        DECLE   $0331,  $00AA,  $00A4,  $0332   ; 5379   0331 00AA 00A4 0332
        DECLE   $00A4,  $00A4,  $0333,  $009E   ; 537D   00A4 00A4 0333 009E
        DECLE   $00A4,  $0000                   ; 5381   00A4 0000

        MVII    #$00A0, R0                      ; 5383   02B8 00A0
        MVO     R0,     G_011C                  ; 5385   0240 011C
        CLRR    R0                              ; 5387   01C0
        MVO     R0,     G_0148                  ; 5388   0240 0148
        MVO     R0,     G_0155                  ; 538A   0240 0155
        SDBD                                    ; 538C   0001
        MVII    #$AF4C, R0                      ; 538D   02B8 004C 00AF
        MVO     R0,     G_0343                  ; 5390   0240 0343
        PULR    R7                              ; 5392   02B7

        MVII    #$0001, R0                      ; 5393   02B8 0001
        MVII    #$031F, R3                      ; 5395   02BB 031F
        MOVR    R7,     R4                      ; 5397   00BC
        ADDI    #$02F4, R4                      ; 5398   02FC 02F4

        JSR     R5,     L_692C                  ; 539A   0004 0168 012C

        SDBD                                    ; 539D   0001
        MVII    #$A504, R0                      ; 539E   02B8 0004 00A5
        MVO     R0,     G_0337                  ; 53A1   0240 0337
        CLRR    R0                              ; 53A3   01C0
        MVO     R0,     G_0124                  ; 53A4   0240 0124
        B       L_5376                          ; 53A6   0220 0031

        MVII    #$0001, R0                      ; 53A8   02B8 0001
        MVII    #$031C, R3                      ; 53AA   02BB 031C
        MOVR    R7,     R4                      ; 53AC   00BC
        ADDI    #$029D, R4                      ; 53AD   02FC 029D

        JSR     R5,     L_692C                  ; 53AF   0004 0168 012C
        JSR     R5,     L_690B                  ; 53B2   0004 0168 010B
        DECLE   $0331,  $00AA,  $00A4,  $0332   ; 53B5   0331 00AA 00A4 0332
        DECLE   $00B6,  $00A4,  $0333,  $00B0   ; 53B9   00B6 00A4 0333 00B0
        DECLE   $00A4,  $0334,  $00BC,  $00A4   ; 53BD   00A4 0334 00BC 00A4
        DECLE   $0000                           ; 53C1   0000
L_53C2:
        JSR     R5,     L_54C7                  ; 53C2   0004 0154 00C7

        MVO     R0,     G_011C                  ; 53C5   0240 011C
        MVO     R0,     G_011F                  ; 53C7   0240 011F
        MVO     R0,     G_0148                  ; 53C9   0240 0148
        MVO     R0,     G_033F                  ; 53CB   0240 033F
        MVI     G_0319, R0                      ; 53CD   0280 0319
        SDBD                                    ; 53CF   0001
        ANDI    #$FF00, R0                      ; 53D0   03B8 0000 00FF
        ADDI    #$000E, R0                      ; 53D3   02F8 000E
        MVO     R0,     G_0319                  ; 53D5   0240 0319

        JSR     R5,     L_603C                  ; 53D7   0004 0160 003C

        PULR    R7                              ; 53DA   02B7

        MVII    #$0002, R0                      ; 53DB   02B8 0002
        MVII    #$031E, R3                      ; 53DD   02BB 031E
        MOVR    R7,     R4                      ; 53DF   00BC
        ADDI    #$0282, R4                      ; 53E0   02FC 0282

        JSR     R5,     L_692C                  ; 53E2   0004 0168 012C

        MVII    #$0001, R0                      ; 53E5   02B8 0001
        MVII    #$0318, R3                      ; 53E7   02BB 0318
        MOVR    R7,     R4                      ; 53E9   00BC
        ADDI    #$0284, R4                      ; 53EA   02FC 0284

        JSR     R5,     L_692C                  ; 53EC   0004 0168 012C
        JSR     R5,     L_690B                  ; 53EF   0004 0168 010B
        DECLE   $0336                           ; 53F2   0336

        ADDR    R5,     R4                      ; 53F3   00EC
        TSTR    R4                              ; 53F4   00A4
        SUB@    R6,     R7                      ; 53F5   0337

        DECLE   $00F8,  $00A4,  $0330,  $00F8   ; 53F6   00F8 00A4 0330 00F8
        DECLE   $00A4,  $0000                   ; 53FA   00A4 0000

        CLRR    R0                              ; 53FC   01C0
        MVO     R0,     G_011F                  ; 53FD   0240 011F
        MVO     R0,     G_0122                  ; 53FF   0240 0122
        MVI     G_0146, R0                      ; 5401   0280 0146
        TSTR    R0                              ; 5403   0080
        BNEQ    L_5409                          ; 5404   020C 0003

        CLRR    R0                              ; 5406   01C0
        MVO     R0,     G_013A                  ; 5407   0240 013A
L_5409:
        B       L_5376                          ; 5409   0220 0094
        B       L_5376                          ; 540B   0220 0096

        MVII    #$0003, R0                      ; 540D   02B8 0003
        MVII    #$031C, R3                      ; 540F   02BB 031C
        MOVR    R7,     R4                      ; 5411   00BC
        ADDI    #$023E, R4                      ; 5412   02FC 023E

        JSR     R5,     L_692C                  ; 5414   0004 0168 012C
        JSR     R5,     L_690B                  ; 5417   0004 0168 010B
        DECLE   $0334,  $00EC,  $00A4,  $0335   ; 541A   0334 00EC 00A4 0335
        DECLE   $00EC,  $00A4,  $0336,  $00EC   ; 541E   00EC 00A4 0336 00EC
        DECLE   $00A4,  $0000                   ; 5422   00A4 0000

        CLRR    R0                              ; 5424   01C0
        MVO     R0,     G_011F                  ; 5425   0240 011F
        B       L_5376                          ; 5427   0220 00B2

        MVII    #$0001, R0                      ; 5429   02B8 0001
        MVII    #$031C, R3                      ; 542B   02BB 031C
        MOVR    R7,     R4                      ; 542D   00BC
        ADDI    #$0258, R4                      ; 542E   02FC 0258

        JSR     R5,     L_692C                  ; 5430   0004 0168 012C
        JSR     R5,     L_690B                  ; 5433   0004 0168 010B
        DECLE   $0331,  $00AA,  $00A4,  $0332   ; 5436   0331 00AA 00A4 0332
        DECLE   $00E0,  $00A4,  $0333,  $00DA   ; 543A   00E0 00A4 0333 00DA
        DECLE   $00A4,  $0334,  $00E6,  $00A4   ; 543E   00A4 0334 00E6 00A4
        DECLE   $0000                           ; 5442   0000

        B       L_53C2                          ; 5443   0220 0082

        MVII    #$0003, R0                      ; 5445   02B8 0003
        MVII    #$031C, R3                      ; 5447   02BB 031C
        MOVR    R7,     R4                      ; 5449   00BC
        ADDI    #$0254, R4                      ; 544A   02FC 0254

        JSR     R5,     L_692C                  ; 544C   0004 0168 012C

        MVII    #$0001, R0                      ; 544F   02B8 0001
        MVII    #$031E, R3                      ; 5451   02BB 031E
        MOVR    R7,     R4                      ; 5453   00BC
        ADDI    #$0220, R4                      ; 5454   02FC 0220

        JSR     R5,     L_692C                  ; 5456   0004 0168 012C

        MVII    #$0001, R0                      ; 5459   02B8 0001
        MVII    #$0318, R3                      ; 545B   02BB 0318
        MOVR    R7,     R4                      ; 545D   00BC
        ADDI    #$0222, R4                      ; 545E   02FC 0222

        JSR     R5,     L_692C                  ; 5460   0004 0168 012C

        MVII    #$0001, R0                      ; 5463   02B8 0001
        MVII    #$031F, R3                      ; 5465   02BB 031F
        MOVR    R7,     R4                      ; 5467   00BC
        ADDI    #$0212, R4                      ; 5468   02FC 0212

        JSR     R5,     L_692C                  ; 546A   0004 0168 012C
        JSR     R5,     L_690B                  ; 546D   0004 0168 010B
        DECLE   $0330                           ; 5470   0330

        ADDR    R7,     R6                      ; 5471   00FE
        TSTR    R4                              ; 5472   00A4
        SUB@    R6,     R1                      ; 5473   0331
        MOVR    R5,     R2                      ; 5474   00AA
        TSTR    R4                              ; 5475   00A4
        SUB@    R6,     R2                      ; 5476   0332
        DECR    R0                              ; 5477   0010
        MOVR    R4,     R5                      ; 5478   00A5
        SUB@    R6,     R3                      ; 5479   0333
        DECR    R6                              ; 547A   0016
        MOVR    R4,     R5                      ; 547B   00A5
        SUB@    R6,     R4                      ; 547C   0334
        ADCR    R0                              ; 547D   0028
        MOVR    R4,     R5                      ; 547E   00A5
        SUB@    R6,     R5                      ; 547F   0335
        ADCR    R6                              ; 5480   002E
        MOVR    R4,     R5                      ; 5481   00A5
        SUB@    R6,     R6                      ; 5482   0336
        ADDR    R6,     R2                      ; 5483   00F2
        TSTR    R4                              ; 5484   00A4
        SUB@    R6,     R7                      ; 5485   0337

        DECLE   $00FE,  $00A4,  $0000           ; 5486   00FE 00A4 0000

        MVII    #$0070, R0                      ; 5489   02B8 0070
        MVO     R0,     G_011C                  ; 548B   0240 011C
        CLRR    R0                              ; 548D   01C0
        MVO     R0,     G_0120                  ; 548E   0240 0120
        MVO     R0,     G_011F                  ; 5490   0240 011F
        MVO     R0,     G_0121                  ; 5492   0240 0121
        INCR    R0                              ; 5494   0008
        MVO     R0,     G_0148                  ; 5495   0240 0148
        MVI     G_0146, R0                      ; 5497   0280 0146
        TSTR    R0                              ; 5499   0080
        BNEQ    L_549F                          ; 549A   020C 0003

        CLRR    R0                              ; 549C   01C0
        MVO     R0,     G_013A                  ; 549D   0240 013A
L_549F:
        PULR    R7                              ; 549F   02B7

        MVII    #$0001, R0                      ; 54A0   02B8 0001
        MVII    #$031C, R3                      ; 54A2   02BB 031C
        MOVR    R7,     R4                      ; 54A4   00BC
        ADDI    #$01F3, R4                      ; 54A5   02FC 01F3

        JSR     R5,     L_692C                  ; 54A7   0004 0168 012C
        JSR     R5,     L_690B                  ; 54AA   0004 0168 010B
        DECLE   $0331,  $00AA,  $00A4,  $0332   ; 54AD   0331 00AA 00A4 0332
        DECLE   $00C8,  $00A4,  $0333,  $00C2   ; 54B1   00C8 00A4 0333 00C2
        DECLE   $00A4,  $0334,  $00CE,  $00A4   ; 54B5   00A4 0334 00CE 00A4
        DECLE   $0000                           ; 54B9   0000

        MVII    #$0070, R0                      ; 54BA   02B8 0070
        MVO     R0,     G_011C                  ; 54BC   0240 011C
        MVO     R0,     G_011F                  ; 54BE   0240 011F

        JSR     R5,     L_54C7                  ; 54C0   0004 0154 00C7

        INCR    R0                              ; 54C3   0008
        MVO     R0,     G_0148                  ; 54C4   0240 0148
        PULR    R7                              ; 54C6   02B7

L_54C7:
        PSHR    R5                              ; 54C7   0275
        MVII    #$0001, R0                      ; 54C8   02B8 0001
        MVII    #$031F, R3                      ; 54CA   02BB 031F
        MOVR    R7,     R4                      ; 54CC   00BC
        ADDI    #$01C5, R4                      ; 54CD   02FC 01C5

        JSR     R5,     L_692C                  ; 54CF   0004 0168 012C

        SDBD                                    ; 54D2   0001
        MVII    #$A50A, R0                      ; 54D3   02B8 000A 00A5
        MVO     R0,     G_0337                  ; 54D6   0240 0337
        CLRR    R0                              ; 54D8   01C0
        MVO     R0,     G_0124                  ; 54D9   0240 0124
        PULR    R7                              ; 54DB   02B7

L_54DC:
        PSHR    R5                              ; 54DC   0275

        JSR     R5,     L_6E70                  ; 54DD   0004 016C 0270
        DECLE   $0012                           ; 54E0   0012

        MVI     G_0155, R0                      ; 54E1   0280 0155
        TSTR    R0                              ; 54E3   0080
        BEQ     L_54EC                          ; 54E4   0204 0006

        JSR     R5,     L_5E71                  ; 54E6   0004 015C 0271
        JSR     R5,     L_5AC6                  ; 54E9   0004 0158 02C6

L_54EC:
        PULR    R7                              ; 54EC   02B7

        PSHR    R5                              ; 54ED   0275

        JSR     R5,     L_5BFC                  ; 54EE   0004 0158 03FC

        MVI     G_0346, R0                      ; 54F1   0280 0346
        MOVR    R0,     R1                      ; 54F3   0081
        ANDI    #$000F, R0                      ; 54F4   03B8 000F
        BNEQ    L_5508                          ; 54F6   020C 0010

        ANDI    #$0010, R1                      ; 54F8   03B9 0010
        BEQ     L_5504                          ; 54FA   0204 0008

        MVI     .BTAB.7E,R0                     ; 54FC   0280 027E
        MVO     R0,     G_033E                  ; 54FE   0240 033E
        MVI     .BTAB.7F,R0                     ; 5500   0280 027F
        B       L_5506                          ; 5502   0200 0002

L_5504:
        MVI     G_033E, R0                      ; 5504   0280 033E
L_5506:
        MVO     R0,     .BTAB.7E                ; 5506   0240 027E
L_5508:
        MVI     G_0346, R1                      ; 5508   0281 0346
        CMPI    #$012C, R1                      ; 550A   0379 012C
        BNEQ    L_5211                          ; 550C   022C 02FC

        MVII    #$00B9, R0                      ; 550E   02B8 00B9
        MVO     R0,     G_01AF                  ; 5510   0240 01AF
        MVI     G_0149, R1                      ; 5512   0281 0149
        INCR    R1                              ; 5514   0009
        ADDR    R7,     R1                      ; 5515   00F9
        ADD@    R1,     R7                      ; 5516   02CF

        INCR    R2                              ; 5517   000A
        COMR    R5                              ; 5518   001D
        ADCR    R5                              ; 5519   002D
        RLC     R1,     1                       ; 551A   0051
        ADDR    R2,     R7                      ; 551B   00D7

        SARC    R1,     1                       ; 551C   0079
        MOVR    R1,     R4                      ; 551D   008C
        MOVR    R2,     R4                      ; 551E   0094
        MOVR    R7,     R4                      ; 551F   00BC
        SLR     R0,     2                       ; 5520   0064
        SDBD                                    ; 5521   0001
        MVII    #$AD2F, R0                      ; 5522   02B8 002F 00AD
        MVII    #$02D0, R2                      ; 5525   02BA 02D0

        JSR     R5,     L_5601                  ; 5527   0004 0154 0201

        SDBD                                    ; 552A   0001
        MVII    #$AF28, R0                      ; 552B   02B8 0028 00AF
        MVO     R0,     G_0343                  ; 552E   0240 0343

        JSR     R5,     L_54DC                  ; 5530   0004 0154 00DC

        PULR    R7                              ; 5533   02B7

        SDBD                                    ; 5534   0001
        MVII    #$AD57, R0                      ; 5535   02B8 0057 00AD
        MVII    #$011D, R2                      ; 5538   02BA 011D

        JSR     R5,     L_5601                  ; 553A   0004 0154 0201

        SDBD                                    ; 553D   0001
        MVII    #$AF1C, R0                      ; 553E   02B8 001C 00AF
        MVO     R0,     G_0343                  ; 5541   0240 0343
        PULR    R7                              ; 5543   02B7

        SDBD                                    ; 5544   0001
        MVII    #$AF3A, R0                      ; 5545   02B8 003A 00AF
        MVO     R0,     G_0343                  ; 5548   0240 0343
L_554A:
        MVII    #$000A, R0                      ; 554A   02B8 000A
        MVO     R0,     G_033D                  ; 554C   0240 033D
        SDBD                                    ; 554E   0001
        MVII    #$AE8D, R0                      ; 554F   02B8 008D 00AE
        MVII    #$02D0, R2                      ; 5552   02BA 02D0

        JSR     R5,     L_5601                  ; 5554   0004 0154 0201

        CLRR    R0                              ; 5557   01C0
        MVO     R0,     G_033E                  ; 5558   0240 033E
        MVO     R0,     G_0346                  ; 555A   0240 0346
        MVO     R0,     G_0348                  ; 555C   0240 0348
        MVII    #$0004, R0                      ; 555E   02B8 0004
        MVO     R0,     G_014A                  ; 5560   0240 014A
        MVO     R0,     G_014B                  ; 5562   0240 014B

        JSR     R5,     L_5E93                  ; 5564   0004 015C 0293

        PULR    R7                              ; 5567   02B7

        SDBD                                    ; 5568   0001
        MVII    #$AD97, R0                      ; 5569   02B8 0097 00AD
        MVII    #$0131, R2                      ; 556C   02BA 0131

        JSR     R5,     L_5601                  ; 556E   0004 0154 0201

        SDBD                                    ; 5571   0001
        MVII    #$AF22, R0                      ; 5572   02B8 0022 00AF
        MVO     R0,     G_0343                  ; 5575   0240 0343

        JSR     R5,     L_6809                  ; 5577   0004 0168 0009

        PULR    R7                              ; 557A   02B7

        SDBD                                    ; 557B   0001
        MVII    #$ADB0, R0                      ; 557C   02B8 00B0 00AD
        SDBD                                    ; 557F   0001
        MVII    #$0B40, R2                      ; 5580   02BA 0040 000B

        JSR     R5,     L_5601                  ; 5583   0004 0154 0201

        SDBD                                    ; 5586   0001
        MVII    #$AF28, R0                      ; 5587   02B8 0028 00AF
        MVO     R0,     G_0343                  ; 558A   0240 0343

        JSR     R5,     L_54DC                  ; 558C   0004 0154 00DC

        PULR    R7                              ; 558F   02B7

        SDBD                                    ; 5590   0001
        MVII    #$AE47, R0                      ; 5591   02B8 0047 00AE
        MVII    #$0318, R2                      ; 5594   02BA 0318

        JSR     R5,     L_5601                  ; 5596   0004 0154 0201

        SDBD                                    ; 5599   0001
        MVII    #$AF2E, R0                      ; 559A   02B8 002E 00AF
        MVO     R0,     G_0343                  ; 559D   0240 0343

        JSR     R5,     L_54DC                  ; 559F   0004 0154 00DC

        PULR    R7                              ; 55A2   02B7

        SDBD                                    ; 55A3   0001
        MVII    #$AF40, R0                      ; 55A4   02B8 0040 00AF
        MVO     R0,     G_0343                  ; 55A7   0240 0343
        B       L_554A                          ; 55A9   0220 0060

        SDBD                                    ; 55AB   0001
        MVII    #$AD97, R0                      ; 55AC   02B8 0097 00AD
        MVII    #$012C, R2                      ; 55AF   02BA 012C

        JSR     R5,     L_5601                  ; 55B1   0004 0154 0201

        SDBD                                    ; 55B4   0001
        MVII    #$AF34, R0                      ; 55B5   02B8 0034 00AF
        MVO     R0,     G_0343                  ; 55B8   0240 0343
        MVII    #$007D, R0                      ; 55BA   02B8 007D
        NEGR    R0                              ; 55BC   0020
        MVO     R0,     G_033E                  ; 55BD   0240 033E
        MVII    #$0032, R0                      ; 55BF   02B8 0032
        MVO     R0,     G_033D                  ; 55C1   0240 033D
        MVII    #$0001, R0                      ; 55C3   02B8 0001
        MVO     R0,     G_014A                  ; 55C5   0240 014A
        MVII    #$0002, R0                      ; 55C7   02B8 0002
        MVO     R0,     G_014B                  ; 55C9   0240 014B
        MVII    #$0003, R0                      ; 55CB   02B8 0003
        MVO     R0,     G_0148                  ; 55CD   0240 0148

        JSR     R5,     L_6809                  ; 55CF   0004 0168 0009

        PULR    R7                              ; 55D2   02B7

        SDBD                                    ; 55D3   0001
        MVII    #$AEA6, R0                      ; 55D4   02B8 00A6 00AE
        MVII    #$011D, R2                      ; 55D7   02BA 011D

        JSR     R5,     L_5601                  ; 55D9   0004 0154 0201

        SDBD                                    ; 55DC   0001
        MVII    #$AF34, R0                      ; 55DD   02B8 0034 00AF
        MVO     R0,     G_0343                  ; 55E0   0240 0343
        MVII    #$0004, R0                      ; 55E2   02B8 0004
        MVO     R0,     G_014A                  ; 55E4   0240 014A
        MVII    #$0002, R0                      ; 55E6   02B8 0002
        MVO     R0,     G_014B                  ; 55E8   0240 014B

        JSR     R5,     L_63DA                  ; 55EA   0004 0160 03DA

        PULR    R7                              ; 55ED   02B7

        SDBD                                    ; 55EE   0001
        MVII    #$AD57, R0                      ; 55EF   02B8 0057 00AD
        MVII    #$011D, R2                      ; 55F2   02BA 011D

        JSR     R5,     L_5601                  ; 55F4   0004 0154 0201

        SDBD                                    ; 55F7   0001
        MVII    #$AF1C, R0                      ; 55F8   02B8 001C 00AF
        MVO     R0,     G_0343                  ; 55FB   0240 0343
        CLRR    R0                              ; 55FD   01C0
        MVO     R0,     G_013A                  ; 55FE   0240 013A
        PULR    R7                              ; 5600   02B7

L_5601:
        PSHR    R5                              ; 5601   0275
        MVO     R0,     G_0339                  ; 5602   0240 0339
        MVO     R2,     G_033C                  ; 5604   0242 033C
        CLRR    R0                              ; 5606   01C0

        JSR     R5,     L_5620                  ; 5607   0004 0154 0220
        DECLE   $034A                           ; 560A   034A

        CMP     G_014C, R6                      ; 560B   0346 014C
        CMP@    R1,     R5                      ; 560D   034D
        CMPR    R1,     R5                      ; 560E   014D
        SUBR    R5,     R4                      ; 560F   012C
        SUBR    R5,     R5                      ; 5610   012D
        SUBR    R5,     R6                      ; 5611   012E
        SUBR    R5,     R7                      ; 5612   012F

        SUBR    R6,     R0                      ; 5613   0130
        SUBR    R6,     R1                      ; 5614   0131
        SUBR    R6,     R2                      ; 5615   0132
        SUBR    R5,     R0                      ; 5616   0128
        SUBR    R5,     R1                      ; 5617   0129
        CMPR    R1,     R6                      ; 5618   014E
        SUBR    R7,     R3                      ; 5619   013B
        CMPR    R1,     R7                      ; 561A   014F
        CMPR    R2,     R6                      ; 561B   0156
        SUBI    #$0342, R7                      ; 561C   033F 0342

        DECLE   $0137,  $0000                   ; 561E   0137 0000
L_5620:
        MVI@    R5,     R1                      ; 5620   02A9
        TSTR    R1                              ; 5621   0089
        BEQ     L_5627                          ; 5622   0204 0003

        MVO@    R0,     R1                      ; 5624   0248
        B       L_5620                          ; 5625   0220 0006

L_5627:
        MVII    #$0014, R0                      ; 5627   02B8 0014
        MVO     R0,     G_033D                  ; 5629   0240 033D
        MVII    #$00DC, R0                      ; 562B   02B8 00DC
        NEGR    R0                              ; 562D   0020
        MVO     R0,     G_033E                  ; 562E   0240 033E
        MVII    #$0006, R0                      ; 5630   02B8 0006
        MVO     R0,     G_0347                  ; 5632   0240 0347

        JSR     R5,     L_5E93                  ; 5634   0004 015C 0293

        PULR    R7                              ; 5637   02B7
        ADCR    R7                              ; 5638   002F

        EIS                                     ; 5639   0002
L_563A:
        SLLC    R0,     1                       ; 563A   0058
        DECLE   $0004,  $00D7,  $0009,  $002D   ; 563B   0004 00D7 0009 002D
        DECLE   $0002,  $00D0,  $0004           ; 563F   0002 00D0 0004

        ADDR    R4,     R0                      ; 5642   00E0
        INCR    R1                              ; 5643   0009
        ADCR    R5                              ; 5644   002D
        EIS                                     ; 5645   0002
        ADDR    R3,     R0                      ; 5646   00D8

        JSR     R4,     L_F009                  ; 5647   0004 00F0 0009
        DECLE   $000C,  $0002,  $0053,  $0005   ; 564A   000C 0002 0053 0005
        DECLE   $00C0,  $0009,  $0031,  $0000   ; 564E   00C0 0009 0031 0000

        SLL     R2,     2                       ; 5652   004E
        EIS                                     ; 5653   0002
        ADDR    R1,     R7                      ; 5654   00CF

        INCR    R1                              ; 5655   0009
        SARC    R1,     1                       ; 5656   0079
        EIS                                     ; 5657   0002
        SLL     R2,     2                       ; 5658   004E
        EIS                                     ; 5659   0002
        ADDR    R1,     R7                      ; 565A   00CF

        INCR    R1                              ; 565B   0009
        ADDR    R0,     R1                      ; 565C   00C1
        EIS                                     ; 565D   0002
        SLL     R2,     2                       ; 565E   004E
        EIS                                     ; 565F   0002
        ADDR    R1,     R7                      ; 5660   00CF

        DECLE   $0009,  $005D,  $0000           ; 5661   0009 005D 0000

        SLL     R3,     1                       ; 5664   004B
        EIS                                     ; 5665   0002
        ADDR    R1,     R7                      ; 5666   00CF

        DECLE   $0009,  $005D,  $0004,  $0040   ; 5667   0009 005D 0004 0040
        DECLE   $0002,  $0090,  $0019,  $0055   ; 566B   0002 0090 0019 0055
        DECLE   $0004,  $0050,  $0002,  $0090   ; 566F   0004 0050 0002 0090
        DECLE   $0019,  $005D,  $0000           ; 5673   0019 005D 0000

        RSWD    R2                              ; 5676   003A
        EIS                                     ; 5677   0002
        MOVR    R0,     R7                      ; 5678   0087

        DECLE   $0009,  $005D,  $0004,  $00AE   ; 5679   0009 005D 0004 00AE
        DECLE   $0002,  $0090,  $0019,  $0055   ; 567D   0002 0090 0019 0055
        DECLE   $0004,  $00BE,  $0002,  $0090   ; 5681   0004 00BE 0002 0090
        DECLE   $0019,  $000C,  $0002,  $0056   ; 5685   0019 000C 0002 0056
        DECLE   $0004,  $00C0,  $0019,  $00C8   ; 5689   0004 00C0 0019 00C8
        DECLE   $0006,  $005D,  $0000,  $0083   ; 568D   0006 005D 0000 0083
        DECLE   $0019,  $00C8,  $0002,  $00D9   ; 5691   0019 00C8 0002 00D9
        DECLE   $0000,  $0080,  $0019,  $002B   ; 5695   0000 0080 0019 002B
        DECLE   $0006,  $00D1,  $0004,  $00C2   ; 5699   0006 00D1 0004 00C2
        DECLE   $0019,  $002B,  $0006,  $00D5   ; 569D   0019 002B 0006 00D5
        DECLE   $0004,  $00C2,  $0009,  $003B   ; 56A1   0004 00C2 0009 003B
        DECLE   $0006,  $00D5,  $0004,  $00B2   ; 56A5   0006 00D5 0004 00B2
        DECLE   $0009,  $002F,  $0000,  $00D8   ; 56A9   0009 002F 0000 00D8
        DECLE   $0004,  $00D7,  $0009,  $0075   ; 56AD   0004 00D7 0009 0075
        DECLE   $0006,  $00C4,  $0000,  $00F7   ; 56B1   0006 00C4 0000 00F7

        INCR    R1                              ; 56B5   0009
L_56B6:
        PSHR    R5                              ; 56B6   0275
        MVI     G_014C, R0                      ; 56B7   0280 014C
        ANDI    #$0080, R0                      ; 56B9   03B8 0080
        BNEQ    L_56F7                          ; 56BB   020C 003A

        MVI     G_014D, R0                      ; 56BD   0280 014D
        INCR    R0                              ; 56BF   0008
        MVO     R0,     G_014D                  ; 56C0   0240 014D
        MVI     G_034D, R1                      ; 56C2   0281 034D
        CMPI    #$0002, R1                      ; 56C4   0379 0002
        BLT     L_56F8                          ; 56C6   0205 0030

        MVII    #$00FF, R1                      ; 56C8   02B9 00FF
        SUB     G_034D, R1                      ; 56CA   0301 034D
        SLR     R1,     2                       ; 56CC   0065
        SLR     R1,     2                       ; 56CD   0065
        SLR     R1,     1                       ; 56CE   0061
        INCR    R1                              ; 56CF   0009
        CMPR    R0,     R1                      ; 56D0   0141
        BGT     L_56F7                          ; 56D1   020E 0024

        CLRR    R0                              ; 56D3   01C0
        MVO     R0,     G_014D                  ; 56D4   0240 014D
        MVI     G_011C, R0                      ; 56D6   0280 011C
        MVI     G_0148, R1                      ; 56D8   0281 0148
        MVI     G_014E, R2                      ; 56DA   0282 014E
        ADDI    #$0010, R0                      ; 56DC   02F8 0010
        TSTR    R2                              ; 56DE   0092
        BNEQ    L_5707                          ; 56DF   020C 0026

        TSTR    R1                              ; 56E1   0089
        BNEQ    L_56F3                          ; 56E2   020C 000F

        MVI     G_0149, R3                      ; 56E4   0283 0149
        CMPI    #$0008, R3                      ; 56E6   037B 0008
        BEQ     L_56F3                          ; 56E8   0204 0009

        CMPI    #$00C0, R0                      ; 56EA   0378 00C0
        BLE     L_56F5                          ; 56EC   0206 0007

        MVII    #$0001, R1                      ; 56EE   02B9 0001
        MVO     R1,     G_0148                  ; 56F0   0241 0148
        CLRR    R0                              ; 56F2   01C0
L_56F3:
        ANDI    #$007F, R0                      ; 56F3   03B8 007F
L_56F5:
        MVO     R0,     G_011C                  ; 56F5   0240 011C
L_56F7:
        PULR    R7                              ; 56F7   02B7

L_56F8:
        MVI     G_011C, R0                      ; 56F8   0280 011C
        CMPI    #$0080, R0                      ; 56FA   0378 0080
        BGE     L_56F5                          ; 56FC   022D 0008

        MVI     G_0156, R1                      ; 56FE   0281 0156
        TSTR    R1                              ; 5700   0089
        BEQ     L_56F7                          ; 5701   0224 000B

        MVII    #$0070, R0                      ; 5703   02B8 0070
        B       L_56F5                          ; 5705   0220 0011

L_5707:
        MVI     G_0149, R5                      ; 5707   0285 0149
        CMPI    #$0007, R5                      ; 5709   037D 0007
        BNEQ    L_56F7                          ; 570B   022C 0015

        CMPI    #$00A0, R0                      ; 570D   0378 00A0
        BNEQ    L_56F5                          ; 570F   022C 001B

        JSR     R5,     L_6E70                  ; 5711   0004 016C 0270
        DECLE   $0018                           ; 5714   0018

        MVII    #$00A0, R0                      ; 5715   02B8 00A0
        B       L_56F5                          ; 5717   0220 0023

L_5719:
        PSHR    R5                              ; 5719   0275

        JSR     R5,     L_690B                  ; 571A   0004 0168 010B
        DECLE   $0332,  $00A4,  $00A4,  $0333   ; 571D   0332 00A4 00A4 0333
        DECLE   $009E,  $00A4,  $0000           ; 5721   009E 00A4 0000

        MVII    #$0070, R0                      ; 5724   02B8 0070
        MVO     R0,     G_011C                  ; 5726   0240 011C
        PULR    R7                              ; 5728   02B7

L_5729:
        PSHR    R5                              ; 5729   0275
        MVI     G_014D, R0                      ; 572A   0280 014D
        TSTR    R0                              ; 572C   0080
        BEQ     L_5734                          ; 572D   0204 0005

        DECR    R0                              ; 572F   0010
        MVO     R0,     G_014D                  ; 5730   0240 014D
        B       L_573E                          ; 5732   0200 000A

L_5734:
        MVII    #$0020, R0                      ; 5734   02B8 0020
        MVO     R0,     G_014D                  ; 5736   0240 014D
        MVI     G_011C, R0                      ; 5738   0280 011C
        ADDI    #$0010, R0                      ; 573A   02F8 0010
        MVO     R0,     G_011C                  ; 573C   0240 011C
L_573E:
        PULR    R7                              ; 573E   02B7

        PSHR    R5                              ; 573F   0275
        MVI     G_0346, R0                      ; 5740   0280 0346
        ANDI    #$001F, R0                      ; 5742   03B8 001F
        BNEQ    L_5754                          ; 5744   020C 000E

        MVI     G_01AF, R0                      ; 5746   0280 01AF
        DECR    R0                              ; 5748   0010
        MVO     R0,     G_01AF                  ; 5749   0240 01AF
        BNEQ    L_5754                          ; 574B   020C 0007

        JSR     R5,     L_5E6B                  ; 574D   0004 015C 026B
        JSR     R5,     L_5AC6                  ; 5750   0004 0158 02C6

        PULR    R7                              ; 5753   02B7

L_5754:
        MVI     G_0149, R1                      ; 5754   0281 0149
        INCR    R1                              ; 5756   0009
        ADDR    R7,     R1                      ; 5757   00F9
        ADD@    R1,     R7                      ; 5758   02CF

        DECLE   $0115,  $000A,  $005B,  $00CE   ; 5759   0115 000A 005B 00CE
        DECLE   $000A,  $015B,  $0163,  $01E9   ; 575D   000A 015B 0163 01E9
        DECLE   $02F0,  $0115,  $0004           ; 5761   02F0 0115 0004

        ANDR    R5,     R4                      ; 5764   01AC
        SLLC    R0,     1                       ; 5765   0058

        JSR     R5,     L_5BFC                  ; 5766   0004 0158 03FC

        MVI     G_014C, R0                      ; 5769   0280 014C
        ANDI    #$0001, R0                      ; 576B   03B8 0001
        BNEQ    L_5884                          ; 576D   020C 0115

        MVI     G_014C, R0                      ; 576F   0280 014C
        ANDI    #$0008, R0                      ; 5771   03B8 0008
        BNEQ    L_577F                          ; 5773   020C 000A

        JSR     R5,     L_5AEC                  ; 5775   0004 0158 02EC
        JSR     R5,     L_5B2F                  ; 5778   0004 0158 032F
        JSR     R5,     L_511E                  ; 577B   0004 0150 011E

        PULR    R7                              ; 577E   02B7

L_577F:
        MVI     G_0149, R0                      ; 577F   0280 0149
        CMPI    #$0004, R0                      ; 5781   0378 0004
        BNEQ    L_578A                          ; 5783   020C 0005

        JSR     R5,     L_5FEA                  ; 5785   0004 015C 03EA

        B       L_578D                          ; 5788   0200 0003

L_578A:
        JSR     R5,     L_5FA3                  ; 578A   0004 015C 03A3

L_578D:
        MVI     G_0124, R0                      ; 578D   0280 0124
        TSTR    R0                              ; 578F   0080
        BNEQ    L_57A3                          ; 5790   020C 0011

        JSR     R5,     L_5239                  ; 5792   0004 0150 0239

        MVI     G_013A, R0                      ; 5795   0280 013A
        CMPI    #$0002, R0                      ; 5797   0378 0002
        BNEQ    L_57A3                          ; 5799   020C 0008

        JSR     R5,     L_6079                  ; 579B   0004 0160 0079

        BNEQ    L_57A3                          ; 579E   020C 0003

        JSR     R5,     L_6073                  ; 57A0   0004 0160 0073

L_57A3:
        MVI     G_014C, R0                      ; 57A3   0280 014C
        CMPI    #$003F, R0                      ; 57A5   0378 003F
        BGT     L_57B3                          ; 57A7   020E 000A

        JSR     R5,     L_5153                  ; 57A9   0004 0150 0153

        CLRR    R0                              ; 57AC   01C0

        JSR     R5,     L_6099                  ; 57AD   0004 0160 0099
        JSR     R5,     L_5AC6                  ; 57B0   0004 0158 02C6

L_57B3:
        PULR    R7                              ; 57B3   02B7

        JSR     R5,     L_5BFC                  ; 57B4   0004 0158 03FC

        MVI     G_0132, R0                      ; 57B7   0280 0132
        TSTR    R0                              ; 57B9   0080
        BEQ     L_5826                          ; 57BA   0204 006A

        MVI     G_0346, R0                      ; 57BC   0280 0346
        CMPI    #$0071, R0                      ; 57BE   0378 0071
        BEQ     L_57D4                          ; 57C0   0204 0012
        BGT     L_57EF                          ; 57C2   020E 002B

        ANDI    #$000F, R0                      ; 57C4   03B8 000F
        BNEQ    L_5826                          ; 57C6   020C 005E

        MVI     G_011C, R0                      ; 57C8   0280 011C
        ADDI    #$0010, R0                      ; 57CA   02F8 0010
        ANDI    #$0070, R0                      ; 57CC   03B8 0070
        MVO     R0,     G_011C                  ; 57CE   0240 011C

        JSR     R5,     L_51B9                  ; 57D0   0004 0150 01B9

        PULR    R7                              ; 57D3   02B7

L_57D4:
        MVI     G_033E, R0                      ; 57D4   0280 033E
        SDBD                                    ; 57D6   0001
        CMPI    #$FF9A, R0                      ; 57D7   0378 009A 00FF
        BGT     L_57E0                          ; 57DA   020E 0004

        SDBD                                    ; 57DC   0001
        MVII    #$FF9A, R0                      ; 57DD   02B8 009A 00FF
L_57E0:
        ADDR    R0,     R0                      ; 57E0   00C0
        DECLE   $0281,  $0341,  $03B9,  $0001   ; 57E1   0281 0341 03B9 0001
        DECLE   $0108,  $0240,  $033E,  $0004   ; 57E5   0108 0240 033E 0004

        ANDR    R5,     R4                      ; 57E9   01AC
        CMP@    R6,     R1                      ; 57EA   0371

        JSR     R5,     L_6E70                  ; 57EB   0004 016C 0270
        DECLE   $0030                           ; 57EE   0030
L_57EF:
        CMPI    #$0080, R0                      ; 57EF   0378 0080
        BNEQ    L_57F6                          ; 57F1   020C 0003

        JSR     R5,     L_5719                  ; 57F3   0004 0154 0319

L_57F6:
        MVI     G_014C, R0                      ; 57F6   0280 014C
        ANDI    #$0040, R0                      ; 57F8   03B8 0040
        BNEQ    L_5803                          ; 57FA   020C 0007

        JSR     R5,     L_63A2                  ; 57FC   0004 0160 03A2

        CMPI    #$005E, R0                      ; 57FF   0378 005E
        BLT     L_5826                          ; 5801   0205 0023

L_5803:
        JSR     R5,     L_6662                  ; 5803   0004 0164 0262

        CMPI    #$0070, R0                      ; 5806   0378 0070
        BNEQ    L_5826                          ; 5808   020C 001C

        MVI     G_031C, R0                      ; 580A   0280 031C
        ANDI    #$00FF, R0                      ; 580C   03B8 00FF
        SUBI    #$0010, R0                      ; 580E   0338 0010
        MVI     G_0149, R1                      ; 5810   0281 0149
        CMPI    #$0002, R1                      ; 5812   0379 0002
        BEQ     L_5818                          ; 5814   0204 0002

        SUBI    #$0018, R0                      ; 5816   0338 0018
L_5818:
        ADD     G_0348, R0                      ; 5818   02C0 0348
        SLL     R0,     2                       ; 581A   004C
        SLL     R0,     1                       ; 581B   0048
        MVI     G_0341, R1                      ; 581C   0281 0341
        ANDI    #$0007, R1                      ; 581E   03B9 0007
        ADDR    R1,     R0                      ; 5820   00C8
        MVO     R0,     G_033F                  ; 5821   0240 033F

        JSR     R5,     L_5AC6                  ; 5823   0004 0158 02C6

L_5826:
        PULR    R7                              ; 5826   02B7

        DECLE   $0004                           ; 5827   0004

        ANDR    R5,     R4                      ; 5828   01AC
        SLLC    R0,     1                       ; 5829   0058

        JSR     R5,     L_5BFC                  ; 582A   0004 0158 03FC
        JSR     R5,     L_67A4                  ; 582D   0004 0164 03A4

        MVI     G_014C, R0                      ; 5830   0280 014C
        ANDI    #$0001, R0                      ; 5832   03B8 0001
        BNEQ    L_5884                          ; 5834   020C 004E

        MVI     G_014F, R0                      ; 5836   0280 014F
        ANDI    #$0001, R0                      ; 5838   03B8 0001
        BNEQ    L_5846                          ; 583A   020C 000A

        JSR     R5,     L_5AEC                  ; 583C   0004 0158 02EC
        JSR     R5,     L_5B2F                  ; 583F   0004 0158 032F
        JSR     R5,     L_511E                  ; 5842   0004 0150 011E

        PULR    R7                              ; 5845   02B7

L_5846:
        JSR     R5,     L_5F8B                  ; 5846   0004 015C 038B
        JSR     R5,     L_5B5A                  ; 5849   0004 0158 035A

        MVI     G_014C, R0                      ; 584C   0280 014C
        SWAP    R0,     2                       ; 584E   0044
        BMI     L_586D                          ; 584F   020B 001C

        MVI     G_031E, R0                      ; 5851   0280 031E
        SDBD                                    ; 5853   0001
        CMPI    #$3FFF, R0                      ; 5854   0378 00FF 003F
        BLE     L_5862                          ; 5857   0206 0009

        MVI     G_0326, R0                      ; 5859   0280 0326
        ANDI    #$007F, R0                      ; 585B   03B8 007F
        CMPI    #$0058, R0                      ; 585D   0378 0058
        BEQ     L_5862                          ; 585F   0204 0001
        PULR    R7                              ; 5861   02B7

L_5862:
        MVI     G_013B, R0                      ; 5862   0280 013B
        TSTR    R0                              ; 5864   0080
        BNEQ    L_586A                          ; 5865   020C 0003

        CLRR    R0                              ; 5867   01C0
        MVO     R0,     G_033F                  ; 5868   0240 033F

L_586A:
        JSR     R5,     L_5AC6                  ; 586A   0004 0158 02C6

L_586D:
        PULR    R7                              ; 586D   02B7

        DECLE   $0004                           ; 586E   0004

        ANDR    R5,     R4                      ; 586F   01AC
        SLLC    R0,     1                       ; 5870   0058

        JSR     R5,     L_5BFC                  ; 5871   0004 0158 03FC

        MVI     G_014C, R0                      ; 5874   0280 014C
        ANDI    #$0001, R0                      ; 5876   03B8 0001
        BNEQ    L_5884                          ; 5878   020C 000A

        JSR     R5,     L_5AEC                  ; 587A   0004 0158 02EC
        JSR     R5,     L_5B2F                  ; 587D   0004 0158 032F
        JSR     R5,     L_511E                  ; 5880   0004 0150 011E

        PULR    R7                              ; 5883   02B7

L_5884:
        JSR     R5,     L_5239                  ; 5884   0004 0150 0239

        MVI     G_0319, R0                      ; 5887   0280 0319
        DECR    R0                              ; 5889   0010
        MVO     R0,     G_0319                  ; 588A   0240 0319
        MVI     G_034A, R0                      ; 588C   0280 034A
        SUB     G_033C, R0                      ; 588E   0300 033C
        BMI     L_58B3                          ; 5890   020B 0021

        JSR     R5,     L_5153                  ; 5892   0004 0150 0153

        MVI     G_034B, R0                      ; 5895   0280 034B
        MVI     G_014C, R1                      ; 5897   0281 014C
        SARC    R1,     1                       ; 5899   0079
        BNC     L_58AE                          ; 589A   0209 0012

        MVI     G_0149, R1                      ; 589C   0281 0149
        TSTR    R1                              ; 589E   0089
        BEQ     L_58AE                          ; 589F   0204 000D

        CMPI    #$0009, R1                      ; 58A1   0379 0009
        BEQ     L_58AE                          ; 58A3   0204 0009

        CMPI    #$0005, R1                      ; 58A5   0379 0005
        BEQ     L_58AE                          ; 58A7   0204 0005

        JSR     R5,     L_5E77                  ; 58A9   0004 015C 0277

        B       L_58B0                          ; 58AC   0200 0002

L_58AE:
        MVO     R0,     G_033F                  ; 58AE   0240 033F

L_58B0:
        JSR     R5,     L_5AC6                  ; 58B0   0004 0158 02C6

L_58B3:
        PULR    R7                              ; 58B3   02B7

        JSR     R5,     L_5F72                  ; 58B4   0004 015C 0372
        JSR     R5,     L_529D                  ; 58B7   0004 0150 029D
        DECLE   $0220,  $004D                   ; 58BA   0220 004D

        JSR     R5,     L_5BFC                  ; 58BC   0004 0158 03FC
        DECLE   $0004                           ; 58BF   0004

        ANDR    R5,     R4                      ; 58C0   01AC
        SLLC    R0,     1                       ; 58C1   0058
        MVI     G_0132, R0                      ; 58C2   0280 0132
        TSTR    R0                              ; 58C4   0080
        BEQ     L_592E                          ; 58C5   0204 0067

        MVI     G_0346, R0                      ; 58C7   0280 0346
        MVI     G_0131, R1                      ; 58C9   0281 0131
        DECR    R1                              ; 58CB   0011
        BEQ     L_58FC                          ; 58CC   0204 002E

        DECR    R1                              ; 58CE   0011
        BEQ     L_590F                          ; 58CF   0204 003E

        CMPI    #$013C, R0                      ; 58D1   0378 013C
        BEQ     L_592F                          ; 58D3   0204 005A
        BGT     L_590F                          ; 58D5   020E 0038

        ANDI    #$0007, R0                      ; 58D7   03B8 0007
        BNEQ    L_592E                          ; 58D9   020C 0053

        MVI     G_011C, R0                      ; 58DB   0280 011C
        ADDI    #$0010, R0                      ; 58DD   02F8 0010
        ANDI    #$007F, R0                      ; 58DF   03B8 007F
        MVO     R0,     G_011C                  ; 58E1   0240 011C

        JSR     R5,     L_5195                  ; 58E3   0004 0150 0195

        MOVR    R0,     R1                      ; 58E6   0081
        ANDI    #$0010, R0                      ; 58E7   03B8 0010
        BEQ     L_592E                          ; 58E9   0204 0043

        JSR     R5,     L_6073                  ; 58EB   0004 0160 0073

        CMPI    #$0030, R1                      ; 58EE   0379 0030
        BNEQ    L_592E                          ; 58F0   020C 003C

        MVI     G_0341, R1                      ; 58F2   0281 0341
        ANDI    #$003F, R1                      ; 58F4   03B9 003F
        INCR    R1                              ; 58F6   0009

        JSR     R5,     L_6E70                  ; 58F7   0004 016C 0270
        DECLE   $001E                           ; 58FA   001E

        PULR    R7                              ; 58FB   02B7

L_58FC:
        MVI     G_033E, R0                      ; 58FC   0280 033E
        DECLE   $0081,  $006D,  $00C8,  $0240   ; 58FE   0081 006D 00C8 0240
        DECLE   $033E,  $0280,  $0131,  $0008   ; 5902   033E 0280 0131 0008
        DECLE   $0240,  $0131,  $0004           ; 5906   0240 0131 0004

        ANDR    R5,     R4                      ; 5909   01AC
        CMP@    R6,     R1                      ; 590A   0371

        JSR     R5,     L_6E70                  ; 590B   0004 016C 0270
        DECLE   $0015                           ; 590E   0015
L_590F:
        MVI     G_014C, R0                      ; 590F   0280 014C
        ANDI    #$0040, R0                      ; 5911   03B8 0040
        BNEQ    L_5803                          ; 5913   022C 0111

        JSR     R5,     L_5239                  ; 5915   0004 0150 0239
        JSR     R5,     L_5239                  ; 5918   0004 0150 0239
        JSR     R5,     L_60C3                  ; 591B   0004 0160 00C3

        MVI     G_0348, R0                      ; 591E   0280 0348
        ADDI    #$0002, R0                      ; 5920   02F8 0002
        MVO     R0,     G_0348                  ; 5922   0240 0348

        JSR     R5,     L_638C                  ; 5924   0004 0160 038C
        JSR     R5,     L_63A2                  ; 5927   0004 0160 03A2

        CMPI    #$005E, R0                      ; 592A   0378 005E
        BGE     L_5803                          ; 592C   022D 012A
L_592E:
        PULR    R7                              ; 592E   02B7

L_592F:
        JSR     R5,     L_5E77                  ; 592F   0004 015C 0277
        JSR     R5,     L_5719                  ; 5932   0004 0154 0319
        DECLE   $0004                           ; 5935   0004

        ANDR    R5,     R4                      ; 5936   01AC
        CMP@    R6,     R1                      ; 5937   0371
        MVI     G_0319, R0                      ; 5938   0280 0319
        ADDI    #$0002, R0                      ; 593A   02F8 0002
        MVO     R0,     G_0319                  ; 593C   0240 0319

        JSR     R5,     L_5AC6                  ; 593E   0004 0158 02C6

        PULR    R7                              ; 5941   02B7

        DECLE   $0004                           ; 5942   0004

        ANDR    R5,     R4                      ; 5943   01AC
        SLLC    R0,     1                       ; 5944   0058

        JSR     R5,     L_5BFC                  ; 5945   0004 0158 03FC
        JSR     R5,     L_67A4                  ; 5948   0004 0164 03A4

        MVI     G_014C, R1                      ; 594B   0281 014C
        MOVR    R1,     R0                      ; 594D   0088
        ANDI    #$0001, R0                      ; 594E   03B8 0001
        BNEQ    L_5A20                          ; 5950   020C 00CE

        ANDI    #$0002, R1                      ; 5952   03B9 0002
        BNEQ    L_59A3                          ; 5954   020C 004D

        MVI     G_011C, R0                      ; 5956   0280 011C
        CMPI    #$00A0, R0                      ; 5958   0378 00A0
        BGE     L_597E                          ; 595A   020D 0022

        JSR     R5,     L_5AEC                  ; 595C   0004 0158 02EC
        JSR     R5,     L_5B2F                  ; 595F   0004 0158 032F

        MVI     G_011C, R0                      ; 5962   0280 011C
        CMPI    #$0090, R0                      ; 5964   0378 0090
        BGE     L_5974                          ; 5966   020D 000C

        MVI     G_0319, R0                      ; 5968   0280 0319
        SDBD                                    ; 596A   0001
        ANDI    #$FDFF, R0                      ; 596B   03B8 00FF 00FD
        MVO     R0,     G_0338                  ; 596E   0240 0338
        MVI     G_0321, R0                      ; 5970   0280 0321
        MVO     R0,     G_0340                  ; 5972   0240 0340

L_5974:
        JSR     R5,     L_6438                  ; 5974   0004 0164 0038
        JSR     R5,     L_6527                  ; 5977   0004 0164 0127
        JSR     R5,     L_511E                  ; 597A   0004 0150 011E

        PULR    R7                              ; 597D   02B7

L_597E:
        JSR     R5,     L_5729                  ; 597E   0004 0154 0329
        JSR     R5,     L_6438                  ; 5981   0004 0164 0038
        JSR     R5,     L_6527                  ; 5984   0004 0164 0127
        JSR     R5,     L_5B5A                  ; 5987   0004 0158 035A

        MVI     G_011C, R0                      ; 598A   0280 011C
        CMPI    #$00E0, R0                      ; 598C   0378 00E0
        BLT     L_5A48                          ; 598E   0205 00B8

        MVI     G_014C, R0                      ; 5990   0280 014C
        ANDI    #$00FD, R0                      ; 5992   03B8 00FD
        ADDI    #$0002, R0                      ; 5994   02F8 0002
        MVO     R0,     G_014C                  ; 5996   0240 014C
        MVI     G_012E, R0                      ; 5998   0280 012E
        MOVR    R0,     R1                      ; 599A   0081
        SLR     R1,     2                       ; 599B   0065
        SUBR    R1,     R0                      ; 599C   0108
        ADD     G_0131, R0                      ; 599D   02C0 0131
        NEGR    R0                              ; 599F   0020
        MVO     R0,     G_033E                  ; 59A0   0240 033E
        PULR    R7                              ; 59A2   02B7

L_59A3:
        JSR     R5,     L_64A2                  ; 59A3   0004 0164 00A2

        MVI     G_033E, R1                      ; 59A6   0281 033E
        SDBD                                    ; 59A8   0001
        CMPI    #$FFBA, R1                      ; 59A9   0379 00BA 00FF
        BLT     L_59E3                          ; 59AC   0205 0035

        CMPI    #$0046, R1                      ; 59AE   0379 0046
        BLT     L_59DF                          ; 59B0   0205 002D

        CLRR    R0                              ; 59B2   01C0
        MVO     R0,     G_011C                  ; 59B3   0240 011C

        JSR     R5,     L_690B                  ; 59B5   0004 0168 010B
        DECLE   $0332,  $003A,  $00A5,  $0333   ; 59B8   0332 003A 00A5 0333
        DECLE   $0034,  $00A5,  $0000           ; 59BC   0034 00A5 0000

        MVI     G_033E, R1                      ; 59BF   0281 033E
        CMPI    #$008C, R1                      ; 59C1   0379 008C
        BLT     L_59E3                          ; 59C3   0205 001E

        MVII    #$0010, R0                      ; 59C5   02B8 0010
        MVO     R0,     G_011C                  ; 59C7   0240 011C
        MVI     G_0321, R1                      ; 59C9   0281 0321
        ANDI    #$007F, R1                      ; 59CB   03B9 007F
        CMPI    #$0050, R1                      ; 59CD   0379 0050
        BLT     L_59E3                          ; 59CF   0205 0012

        MVII    #$0020, R0                      ; 59D1   02B8 0020
        MVO     R0,     G_011C                  ; 59D3   0240 011C
        CMPI    #$005A, R1                      ; 59D5   0379 005A
        BLT     L_59E3                          ; 59D7   0205 000A

        MVII    #$0030, R0                      ; 59D9   02B8 0030
        MVO     R0,     G_011C                  ; 59DB   0240 011C
        B       L_59E3                          ; 59DD   0200 0004

L_59DF:
        MVII    #$00F0, R0                      ; 59DF   02B8 00F0
        MVO     R0,     G_011C                  ; 59E1   0240 011C
L_59E3:
        MVI     G_0321, R0                      ; 59E3   0280 0321
        ANDI    #$007F, R0                      ; 59E5   03B8 007F
        CMPI    #$005C, R0                      ; 59E7   0378 005C
        BGE     L_59F9                          ; 59E9   020D 000E

        JSR     R5,     L_63A2                  ; 59EB   0004 0160 03A2

        CMPI    #$005C, R0                      ; 59EE   0378 005C
        BLT     L_59F6                          ; 59F0   0205 0004

        JSR     R5,     L_6E70                  ; 59F2   0004 016C 0270
        DECLE   $002A                           ; 59F5   002A
L_59F6:
        JSR     R5,     L_65C9                  ; 59F6   0004 0164 01C9
L_59F9:
        JSR     R5,     L_5B5A                  ; 59F9   0004 0158 035A

        MVI     G_031E, R0                      ; 59FC   0280 031E
        SDBD                                    ; 59FE   0001
        CMPI    #$3FFF, R0                      ; 59FF   0378 00FF 003F
        BLE     L_5A0C                          ; 5A02   0206 0008

        MVI     G_0326, R0                      ; 5A04   0280 0326
        ANDI    #$007F, R0                      ; 5A06   03B8 007F
        CMPI    #$0058, R0                      ; 5A08   0378 0058
        BLT     L_5A48                          ; 5A0A   0205 003C

L_5A0C:
        MVI     G_0321, R0                      ; 5A0C   0280 0321
        ANDI    #$007F, R0                      ; 5A0E   03B8 007F
        CMPI    #$005C, R0                      ; 5A10   0378 005C
        BLT     L_5A48                          ; 5A12   0205 0034

        MVI     G_013B, R0                      ; 5A14   0280 013B
        TSTR    R0                              ; 5A16   0080
        BNEQ    L_5A1C                          ; 5A17   020C 0003

        CLRR    R0                              ; 5A19   01C0
        MVO     R0,     G_033F                  ; 5A1A   0240 033F

L_5A1C:
        JSR     R5,     L_5AC6                  ; 5A1C   0004 0158 02C6

        PULR    R7                              ; 5A1F   02B7

L_5A20:
        MVI     G_011C, R0                      ; 5A20   0280 011C
        CMPI    #$0070, R0                      ; 5A22   0378 0070
        BEQ     L_5A34                          ; 5A24   0204 000E

        MVII    #$0070, R0                      ; 5A26   02B8 0070
        MVO     R0,     G_011C                  ; 5A28   0240 011C
        MVO     R0,     G_011F                  ; 5A2A   0240 011F
        MVO     R0,     G_0120                  ; 5A2C   0240 0120

        JSR     R5,     L_6527                  ; 5A2E   0004 0164 0127
        JSR     R5,     L_6438                  ; 5A31   0004 0164 0038

L_5A34:
        MVI     G_0324, R0                      ; 5A34   0280 0324
        MOVR    R0,     R1                      ; 5A36   0081
        INCR    R0                              ; 5A37   0008
        MVO     R0,     G_0324                  ; 5A38   0240 0324
        MVO     R0,     G_0325                  ; 5A3A   0240 0325
        ANDI    #$007F, R1                      ; 5A3C   03B9 007F
        CMPI    #$0058, R1                      ; 5A3E   0379 0058
        BLT     L_5A48                          ; 5A40   0205 0006

        CLRR    R0                              ; 5A42   01C0
        MVO     R0,     G_033F                  ; 5A43   0240 033F

        JSR     R5,     L_5AC6                  ; 5A45   0004 0158 02C6

L_5A48:
        PULR    R7                              ; 5A48   02B7

        DECLE   $0004                           ; 5A49   0004

        ANDR    R5,     R4                      ; 5A4A   01AC
        SLLC    R0,     1                       ; 5A4B   0058

        JSR     R5,     L_5BFC                  ; 5A4C   0004 0158 03FC

        MVI     G_014C, R0                      ; 5A4F   0280 014C
        ANDI    #$0001, R0                      ; 5A51   03B8 0001
        BNEQ    L_5A92                          ; 5A53   020C 003D

        MVI     G_011C, R0                      ; 5A55   0280 011C
        CMPI    #$00F0, R0                      ; 5A57   0378 00F0
        BEQ     L_5A68                          ; 5A59   0204 000D

        JSR     R5,     L_5AEC                  ; 5A5B   0004 0158 02EC
        JSR     R5,     L_5B2F                  ; 5A5E   0004 0158 032F
        JSR     R5,     L_63DA                  ; 5A61   0004 0160 03DA
        JSR     R5,     L_511E                  ; 5A64   0004 0150 011E

L_5A67:
        PULR    R7                              ; 5A67   02B7

L_5A68:
        MVI     G_014C, R0                      ; 5A68   0280 014C
        MOVR    R0,     R1                      ; 5A6A   0081
        ANDI    #$0002, R1                      ; 5A6B   03B9 0002
        BNEQ    L_5A7F                          ; 5A6D   020C 0010

        ANDI    #$00FD, R0                      ; 5A6F   03B8 00FD
        ADDI    #$0002, R0                      ; 5A71   02F8 0002
        MVO     R0,     G_014C                  ; 5A73   0240 014C
        SDBD                                    ; 5A75   0001
        MVII    #$A4D4, R0                      ; 5A76   02B8 00D4 00A4
        MVO     R0,     G_0334                  ; 5A79   0240 0334

        JSR     R5,     L_6E70                  ; 5A7B   0004 016C 0270
        DECLE   $0015                           ; 5A7E   0015
L_5A7F:
        JSR     R5,     L_684A                  ; 5A7F   0004 0168 004A

        MVI     G_014C, R0                      ; 5A82   0280 014C
        ANDI    #$0040, R0                      ; 5A84   03B8 0040
        BNEQ    L_5A67                          ; 5A86   022C 0020

        JSR     R5,     L_5239                  ; 5A88   0004 0150 0239
        JSR     R5,     L_5239                  ; 5A8B   0004 0150 0239
        JSR     R5,     L_60C3                  ; 5A8E   0004 0160 00C3

        PULR    R7                              ; 5A91   02B7

L_5A92:
        MVII    #$00F0, R0                      ; 5A92   02B8 00F0
        MVO     R0,     G_011C                  ; 5A94   0240 011C
        CLRR    R0                              ; 5A96   01C0
        MVO     R0,     G_011F                  ; 5A97   0240 011F
        INCR    R0                              ; 5A99   0008
        MVO     R0,     G_0148                  ; 5A9A   0240 0148
        MVII    #$031C, R1                      ; 5A9C   02B9 031C
        MVI@    R1,     R0                      ; 5A9E   0288
        INCR    R0                              ; 5A9F   0008
        MVO@    R0,     R1                      ; 5AA0   0248
        MVI     G_0324, R0                      ; 5AA1   0280 0324
        INCR    R0                              ; 5AA3   0008
        MVO     R0,     G_0324                  ; 5AA4   0240 0324
        ANDI    #$007F, R0                      ; 5AA6   03B8 007F
        CMPI    #$0058, R0                      ; 5AA8   0378 0058
        BLT     L_5A67                          ; 5AAA   0225 0044

        JSR     R5,     L_5E77                  ; 5AAC   0004 015C 0277
        JSR     R5,     L_5719                  ; 5AAF   0004 0154 0319
        JSR     R5,     L_5AC6                  ; 5AB2   0004 0158 02C6

        PULR    R7                              ; 5AB5   02B7

        PSHR    R5                              ; 5AB6   0275

        JSR     R5,     L_5BFC                  ; 5AB7   0004 0158 03FC

        MVI     G_0346, R0                      ; 5ABA   0280 0346
        CMPI    #$0168, R0                      ; 5ABC   0378 0168
        BLT     L_5AC5                          ; 5ABE   0205 0005

        MVII    #$000B, R0                      ; 5AC0   02B8 000B

        JSR     R5,     L_6251                  ; 5AC2   0004 0160 0251

L_5AC5:
        PULR    R7                              ; 5AC5   02B7

L_5AC6:
        PSHR    R5                              ; 5AC6   0275
        MVII    #$003C, R0                      ; 5AC7   02B8 003C
        MVO     R0,     G_0132                  ; 5AC9   0240 0132
        MVII    #$0009, R0                      ; 5ACB   02B8 0009
        MVO     R0,     G_0347                  ; 5ACD   0240 0347

        JSR     R5,     L_5EF1                  ; 5ACF   0004 015C 02F1

        CLRR    R0                              ; 5AD2   01C0
        MVO     R0,     G_0346                  ; 5AD3   0240 0346
        PULR    R7                              ; 5AD5   02B7

        PSHR    R5                              ; 5AD6   0275

        JSR     R5,     L_5BFC                  ; 5AD7   0004 0158 03FC

        MVI     G_0132, R0                      ; 5ADA   0280 0132
        DECR    R0                              ; 5ADC   0010
        MVO     R0,     G_0132                  ; 5ADD   0240 0132
        BNEQ    L_5AEB                          ; 5ADF   020C 000A

        JSR     R5,     L_5DA2                  ; 5AE1   0004 015C 01A2

        MVII    #$0007, R0                      ; 5AE4   02B8 0007
        MVO     R0,     G_0347                  ; 5AE6   0240 0347

        JSR     R5,     L_6034                  ; 5AE8   0004 0160 0034

L_5AEB:
        PULR    R7                              ; 5AEB   02B7

L_5AEC:
        PSHR    R5                              ; 5AEC   0275
        MVI     G_034D, R0                      ; 5AED   0280 034D
        CMPI    #$0001, R0                      ; 5AEF   0378 0001
        BLE     L_5B13                          ; 5AF1   0206 0020

        MOVR    R0,     R1                      ; 5AF3   0081
        MOVR    R1,     R2                      ; 5AF4   008A
        SWAP    R0,     1                       ; 5AF5   0040
        ADD     G_012C, R0                      ; 5AF6   02C0 012C
        ADDI    #$007F, R1                      ; 5AF8   02F9 007F
        SUBR    R1,     R0                      ; 5AFA   0108
        MVO     R0,     G_012C                  ; 5AFB   0240 012C
        SWAP    R0,     1                       ; 5AFD   0040
        ANDI    #$00FF, R0                      ; 5AFE   03B8 00FF
        MVI     G_014C, R3                      ; 5B00   0283 014C
        ANDI    #$0008, R3                      ; 5B02   03BB 0008
        BNEQ    L_5B0D                          ; 5B04   020C 0007

        MVI     G_014E, R3                      ; 5B06   0283 014E
        SARC    R3,     1                       ; 5B08   007B
        BC      L_5B0D                          ; 5B09   0201 0002

        MVO     R0,     G_034D                  ; 5B0B   0240 034D
L_5B0D:
        CMPR    R0,     R2                      ; 5B0D   0142
        BEQ     L_5B13                          ; 5B0E   0204 0003

        JSR     R5,     L_5239                  ; 5B10   0004 0150 0239

L_5B13:
        PULR    R7                              ; 5B13   02B7

        PSHR    R5                              ; 5B14   0275
        MVI     G_034D, R0                      ; 5B15   0280 034D
        ADDR    R0,     R0                      ; 5B17   00C0
        CMPI    #$00FF, R0                      ; 5B18   0378 00FF
        BLE     L_5B1E                          ; 5B1A   0206 0002

        MVII    #$00FF, R0                      ; 5B1C   02B8 00FF
L_5B1E:
        MOVR    R0,     R1                      ; 5B1E   0081
        SWAP    R0,     1                       ; 5B1F   0040
        ADD     G_012C, R0                      ; 5B20   02C0 012C
        ADDR    R1,     R0                      ; 5B22   00C8
        MVO     R0,     G_012C                  ; 5B23   0240 012C
        SWAP    R0,     1                       ; 5B25   0040
        ANDI    #$00FF, R0                      ; 5B26   03B8 00FF
        CMPR    R0,     R1                      ; 5B28   0141
        BEQ     L_5B2E                          ; 5B29   0204 0003

        JSR     R5,     L_5239                  ; 5B2B   0004 0150 0239

L_5B2E:
        PULR    R7                              ; 5B2E   02B7

L_5B2F:
        PSHR    R5                              ; 5B2F   0275
        MVI     G_034D, R0                      ; 5B30   0280 034D
        SLR     R0,     1                       ; 5B32   0060
        MVI     G_012E, R2                      ; 5B33   0282 012E
        MOVR    R2,     R3                      ; 5B35   0093
        SLL     R2,     2                       ; 5B36   004E
        SLL     R2,     2                       ; 5B37   004E
        SUBR    R3,     R2                      ; 5B38   011A
        ADDR    R0,     R2                      ; 5B39   00C2
        SLR     R2,     2                       ; 5B3A   0066
        SLR     R2,     2                       ; 5B3B   0066
        MVO     R2,     G_012E                  ; 5B3C   0242 012E
        MVI     G_0319, R1                      ; 5B3E   0281 0319
        MVI     G_0149, R4                      ; 5B40   0284 0149
        CMPI    #$0007, R4                      ; 5B42   037C 0007
        BEQ     L_5B4E                          ; 5B44   0204 0008

        CMPI    #$0003, R4                      ; 5B46   037C 0003
        BEQ     L_5B4E                          ; 5B48   0204 0004

        CMPI    #$0005, R4                      ; 5B4A   037C 0005
        BNEQ    L_5B50                          ; 5B4C   020C 0002

L_5B4E:
        SLR     R3,     1                       ; 5B4E   0063
        SLR     R2,     1                       ; 5B4F   0062
L_5B50:
        SUBR    R3,     R2                      ; 5B50   011A
        ADDR    R2,     R1                      ; 5B51   00D1
        MVO     R1,     G_0319                  ; 5B52   0241 0319

        JSR     R5,     L_56B6                  ; 5B54   0004 0154 02B6

        PULR    R7                              ; 5B57   02B7

        PSHR    R5                              ; 5B58   0275
        PULR    R7                              ; 5B59   02B7

L_5B5A:
        PSHR    R5                              ; 5B5A   0275
        MVII    #$031E, R3                      ; 5B5B   02BB 031E
        MVI@    R3,     R0                      ; 5B5D   0298
        SDBD                                    ; 5B5E   0001
        CMPI    #$3FFF, R0                      ; 5B5F   0378 00FF 003F
        BGT     L_5BBB                          ; 5B62   020E 0057

        ANDI    #$00FF, R0                      ; 5B64   03B8 00FF
        SUBI    #$0005, R3                      ; 5B66   033B 0005
        MVI@    R3,     R1                      ; 5B68   0299
        ANDI    #$00FF, R1                      ; 5B69   03B9 00FF
        SUBR    R0,     R1                      ; 5B6B   0101
        TSTR    R1                              ; 5B6C   0089
        BGT     L_5B70                          ; 5B6D   020E 0001

        NEGR    R1                              ; 5B6F   0021
L_5B70:
        CMPI    #$0002, R1                      ; 5B70   0379 0002
        BLE     L_5B75                          ; 5B72   0206 0001
L_5B74:
        PULR    R7                              ; 5B74   02B7

L_5B75:
        ADDI    #$0008, R3                      ; 5B75   02FB 0008
        MVI@    R3,     R1                      ; 5B77   0299
        ANDI    #$007F, R1                      ; 5B78   03B9 007F
        ADDI    #$0005, R3                      ; 5B7A   02FB 0005
        MVI@    R3,     R0                      ; 5B7C   0298
        ADDI    #$0008, R0                      ; 5B7D   02F8 0008
        ANDI    #$007F, R0                      ; 5B7F   03B8 007F
        SUBR    R0,     R1                      ; 5B81   0101
        TSTR    R1                              ; 5B82   0089
        BGT     L_5B98                          ; 5B83   020E 0013

        NEGR    R1                              ; 5B85   0021
        CMPI    #$0002, R1                      ; 5B86   0379 0002
        BLE     L_5B9D                          ; 5B88   0206 0013

        MVI     G_013B, R0                      ; 5B8A   0280 013B
        TSTR    R0                              ; 5B8C   0080
        BNEQ    L_5B74                          ; 5B8D   022C 001A

        INCR    R0                              ; 5B8F   0008
        MVO     R0,     G_013B                  ; 5B90   0240 013B
        MVI     G_013A, R0                      ; 5B92   0280 013A
        INCR    R0                              ; 5B94   0008
        MVO     R0,     G_013A                  ; 5B95   0240 013A
        PULR    R7                              ; 5B97   02B7

L_5B98:
        CMPI    #$0010, R1                      ; 5B98   0379 0010
        BLE     L_5B9D                          ; 5B9A   0206 0001
        PULR    R7                              ; 5B9C   02B7

L_5B9D:
        SUBI    #$0008, R3                      ; 5B9D   033B 0008
        MVI@    R3,     R0                      ; 5B9F   0298
        SDBD                                    ; 5BA0   0001
        ADDI    #$4000, R0                      ; 5BA1   02F8 0000 0040
        MVO@    R0,     R3                      ; 5BA4   0258
        MVI     G_033E, R0                      ; 5BA5   0280 033E
        MVO     R0,     G_0348                  ; 5BA7   0240 0348

        JSR     R5,     L_6E70                  ; 5BA9   0004 016C 0270
        DECLE   $002D                           ; 5BAC   002D

        MVI     G_013B, R0                      ; 5BAD   0280 013B
        TSTR    R0                              ; 5BAF   0080
        BEQ     L_5B74                          ; 5BB0   0224 003D

        CLRR    R0                              ; 5BB2   01C0
        MVO     R0,     G_013B                  ; 5BB3   0240 013B
        MVI     G_013A, R0                      ; 5BB5   0280 013A
        DECR    R0                              ; 5BB7   0010
        MVO     R0,     G_013A                  ; 5BB8   0240 013A
        PULR    R7                              ; 5BBA   02B7

L_5BBB:
        ADDI    #$0008, R3                      ; 5BBB   02FB 0008
        MVI@    R3,     R0                      ; 5BBD   0298
        ANDI    #$007F, R0                      ; 5BBE   03B8 007F
        CMPI    #$0058, R0                      ; 5BC0   0378 0058
        BNEQ    L_5BC5                          ; 5BC2   020C 0001
        PULR    R7                              ; 5BC4   02B7

L_5BC5:
        MVI     G_014A, R0                      ; 5BC5   0280 014A
        ADDI    #$0005, R0                      ; 5BC7   02F8 0005
        MVO     R0,     G_014A                  ; 5BC9   0240 014A
        MVI     G_0348, R1                      ; 5BCB   0281 0348
        MVI     G_033E, R0                      ; 5BCD   0280 033E
        PSHR    R0                              ; 5BCF   0270
        MVO     R1,     G_033E                  ; 5BD0   0241 033E

        JSR     R5,     L_5BE9                  ; 5BD2   0004 0158 03E9
        JSR     R5,     L_63A2                  ; 5BD5   0004 0160 03A2
        JSR     R5,     L_5BE9                  ; 5BD8   0004 0158 03E9

        MVI     G_033E, R1                      ; 5BDB   0281 033E
        PULR    R0                              ; 5BDD   02B0
        MVO     R0,     G_033E                  ; 5BDE   0240 033E
        MVO     R1,     G_0348                  ; 5BE0   0241 0348
        MVI     G_014A, R0                      ; 5BE2   0280 014A
        SUBI    #$0005, R0                      ; 5BE4   0338 0005
        MVO     R0,     G_014A                  ; 5BE6   0240 014A
        PULR    R7                              ; 5BE8   02B7

L_5BE9:
        PSHR    R5                              ; 5BE9   0275
        MVI     G_0151, R3                      ; 5BEA   0283 0151
        MVI     G_0152, R4                      ; 5BEC   0284 0152
        MVI     G_0128, R0                      ; 5BEE   0280 0128
        MVI     G_0129, R1                      ; 5BF0   0281 0129
        MVO     R3,     G_0128                  ; 5BF2   0243 0128
        MVO     R4,     G_0129                  ; 5BF4   0244 0129
        NOP                                     ; 5BF6   0034
        MVO     R0,     G_0151                  ; 5BF7   0240 0151
        MVO     R1,     G_0152                  ; 5BF9   0241 0152
        PULR    R7                              ; 5BFB   02B7

L_5BFC:
        PSHR    R5                              ; 5BFC   0275
        MVI     G_0346, R0                      ; 5BFD   0280 0346
        ANDI    #$0007, R0                      ; 5BFF   03B8 0007
        CMPI    #$0003, R0                      ; 5C01   0378 0003
        BNEQ    L_5C29                          ; 5C03   020C 0024

        MVII    #$0226, R3                      ; 5C05   02BB 0226
        SDBD                                    ; 5C07   0001
        MVII    #$0800, R1                      ; 5C08   02B9 0000 0008
L_5C0B:
        DECR    R3                              ; 5C0B   0013
        MVI@    R3,     R0                      ; 5C0C   0298
        ANDR    R1,     R0                      ; 5C0D   0188
        BEQ     L_5C0B                          ; 5C0E   0224 0004

        MVI@    R3,     R3                      ; 5C10   029B
        MVII    #$0014, R2                      ; 5C11   02BA 0014
        MVII    #$0214, R4                      ; 5C13   02BC 0214
L_5C15:
        MVI@    R4,     R0                      ; 5C15   02A0
        ANDR    R1,     R0                      ; 5C16   0188
        BEQ     L_5C26                          ; 5C17   0204 000D

        DECR    R4                              ; 5C19   0014
        MOVR    R3,     R0                      ; 5C1A   0098
        SDBD                                    ; 5C1B   0001
        ANDI    #$3FF8, R0                      ; 5C1C   03B8 00F8 003F
        MVI@    R4,     R3                      ; 5C1F   02A3
        MOVR    R3,     R5                      ; 5C20   009D
        ANDI    #$0007, R5                      ; 5C21   03BD 0007
        ADDR    R5,     R0                      ; 5C23   00E8
        DECR    R4                              ; 5C24   0014
        MVO@    R0,     R4                      ; 5C25   0260
L_5C26:
        DECR    R2                              ; 5C26   0012
        BNEQ    L_5C15                          ; 5C27   022C 0013
L_5C29:
        PULR    R7                              ; 5C29   02B7

L_5C2A:
        PSHR    R5                              ; 5C2A   0275

        JSR     R5,     L_68C7                  ; 5C2B   0004 0168 00C7
        JSR     R5,     L_6773                  ; 5C2E   0004 0164 0373
        JSR     R5,     L_6941                  ; 5C31   0004 0168 0141

        PULR    R7                              ; 5C34   02B7

L_5C35:
        PSHR    R5                              ; 5C35   0275

        JSR     R5,     L_6784                  ; 5C36   0004 0164 0384

        MVII    #$0001, R0                      ; 5C39   02B8 0001
        MVII    #$0318, R3                      ; 5C3B   02BB 0318
        SDBD                                    ; 5C3D   0001
        MVII    #$56B0, R4                      ; 5C3E   02BC 00B0 0056

        JSR     R5,     L_692C                  ; 5C41   0004 0168 012C

        SDBD                                    ; 5C44   0001
        MVII    #$A498, R0                      ; 5C45   02B8 0098 00A4
        MVO     R0,     G_0330                  ; 5C48   0240 0330
L_5C4A:
        PULR    R7                              ; 5C4A   02B7

        PSHR    R5                              ; 5C4B   0275
        CMP@    R3,     R0                      ; 5C4C   0358
        BEQ     L_5C4A                          ; 5C4D   0224 0004

        CMPI    #$000B, R0                      ; 5C4F   0378 000B
        BNEQ    L_5C4A                          ; 5C51   022C 0008

        MVI     G_0149, R0                      ; 5C53   0280 0149
        CMPI    #$000A, R0                      ; 5C55   0378 000A
        BEQ     L_5C68                          ; 5C57   0204 000F

        JSR     R5,     L_68B7                  ; 5C59   0004 0168 00B7
        DECLE   $02B8,  $0004,  $0240,  $0347   ; 5C5C   02B8 0004 0240 0347
        DECLE   $02B8,  $00B3,  $0240,  $0346   ; 5C60   02B8 00B3 0240 0346
        DECLE   $0004                           ; 5C64   0004

        ANDR    R5,     R4                      ; 5C65   01AC
        CMP@    R6,     R1                      ; 5C66   0371
        PULR    R7                              ; 5C67   02B7

L_5C68:
        JSR     R5,     L_6DE7                  ; 5C68   0004 016C 01E7

        PULR    R7                              ; 5C6B   02B7

L_5C6C:
        PSHR    R5                              ; 5C6C   0275
        MVI     G_0134, R0                      ; 5C6D   0280 0134
        SARC    R0,     1                       ; 5C6F   0078
        BC      L_5C8C                          ; 5C70   0201 001A

        MVII    #$0003, R0                      ; 5C72   02B8 0003
        MVO     R0,     G_0105                  ; 5C74   0240 0105

        JSR     R5,     L_675B                  ; 5C76   0004 0164 035B
        DECLE   $02B8,  $0003,  $0240,  $0347   ; 5C79   02B8 0003 0240 0347
        DECLE   $01C0,  $0240,  $034A,  $02B8   ; 5C7D   01C0 0240 034A 02B8
        DECLE   $0003,  $0240,  $0135,  $0004   ; 5C81   0003 0240 0135 0004

        ANDR    R5,     R4                      ; 5C85   01AC
        CMP@    R6,     R1                      ; 5C86   0371

        JSR     R5,     L_6E70                  ; 5C87   0004 016C 0270
        DECLE   $0003                           ; 5C8A   0003

        PULR    R7                              ; 5C8B   02B7

L_5C8C:
        MVII    #$0008, R0                      ; 5C8C   02B8 0008
        MVO     R0,     G_0347                  ; 5C8E   0240 0347
        SDBD                                    ; 5C90   0001
        MVII    #$AF64, R0                      ; 5C91   02B8 0064 00AF
        MVO     R0,     G_0343                  ; 5C94   0240 0343

        JSR     R5,     L_68B7                  ; 5C96   0004 0168 00B7
        JSR     R5,     L_6364                  ; 5C99   0004 0160 0364

        MVI     G_0149, R5                      ; 5C9C   0285 0149
        ADDR    R5,     R5                      ; 5C9E   00ED
        SDBD                                    ; 5C9F   0001
        ADDI    #$A540, R5                      ; 5CA0   02FD 0040 00A5
        SDBD                                    ; 5CA3   0001
        MVI@    R5,     R4                      ; 5CA4   02AC

        JSR     R5,     L_6D45                  ; 5CA5   0004 016C 0145

        PULR    R7                              ; 5CA8   02B7

        DECLE   $0000,  $0005,  $0005,  $000A   ; 5CA9   0000 0005 0005 000A
        DECLE   $0005,  $0000,  $0005,  $000A   ; 5CAD   0005 0000 0005 000A
        DECLE   $0005,  $0000                   ; 5CB1   0005 0000
L_5CB3:
        PSHR    R5                              ; 5CB3   0275
        SDBD                                    ; 5CB4   0001
        MVII    #$5CA9, R5                      ; 5CB5   02BD 00A9 005C
        ADD     G_0149, R5                      ; 5CB8   02C5 0149
        MVI@    R5,     R5                      ; 5CBA   02AD
        TSTR    R5                              ; 5CBB   00AD
        PULR    R7                              ; 5CBC   02B7

L_5CBD:
        PSHR    R5                              ; 5CBD   0275
        SDBD                                    ; 5CBE   0001
        MVII    #$A955, R0                      ; 5CBF   02B8 0055 00A9
        MVO     R0,     G_0348                  ; 5CC2   0240 0348

        JSR     R5,     L_6941                  ; 5CC4   0004 0168 0141

        MVI     G_0147, R0                      ; 5CC7   0280 0147
        INCR    R0                              ; 5CC9   0008

        JSR     R5,     L_5D99                  ; 5CCA   0004 015C 0199

        MVII    #$0001, R1                      ; 5CCD   02B9 0001
        MVII    #$027E, R4                      ; 5CCF   02BC 027E

        JSR     R5,     X_PRNUM_RGT             ; 5CD1   0004 0118 00C5

        MVI     G_0146, R0                      ; 5CD4   0280 0146
        INCR    R0                              ; 5CD6   0008
        MVII    #$0002, R1                      ; 5CD7   02B9 0002
        MVII    #$0291, R4                      ; 5CD9   02BC 0291

        JSR     R5,     X_PRNUM_RGT             ; 5CDB   0004 0118 00C5
        DECLE   $0001,  $02BC,  $005C,  $00A4   ; 5CDE   0001 02BC 005C 00A4
        DECLE   $0280,  $0149,  $00C0,  $0081   ; 5CE2   0280 0149 00C0 0081
        DECLE   $00C0,  $00C8,  $0281,  $0134   ; 5CE6   00C0 00C8 0281 0134
        DECLE   $03B9,  $0018,  $0065,  $00C8   ; 5CEA   03B9 0018 0065 00C8
        DECLE   $00C4,  $0001                   ; 5CEE   00C4 0001

        MVI@    R4,     R0                      ; 5CF0   02A0
        MVO     R0,     G_033F                  ; 5CF1   0240 033F

        JSR     R5,     L_5EC0                  ; 5CF3   0004 015C 02C0

        MVI     G_0144, R0                      ; 5CF6   0280 0144

        JSR     R5,     L_5D99                  ; 5CF8   0004 015C 0199

        MVII    #$0002, R1                      ; 5CFB   02B9 0002
        MVII    #$0286, R4                      ; 5CFD   02BC 0286

        JSR     R5,     X_PRNUM_RGT             ; 5CFF   0004 0118 00C5

        ADDR    R1,     R4                      ; 5D02   00CC
        MVII    #$0070, R0                      ; 5D03   02B8 0070
        XORR    R3,     R0                      ; 5D05   01D8
        MVO@    R0,     R4                      ; 5D06   0260
        MVI     G_0145, R0                      ; 5D07   0280 0145
        MVII    #$0289, R4                      ; 5D09   02BC 0289

        JSR     R5,     X_PRNUM_ZRO             ; 5D0B   0004 0118 00AD

        MVII    #$029A, R4                      ; 5D0E   02BC 029A

        JSR     R5,     L_5D29                  ; 5D10   0004 015C 0129
        JSR     R5,     L_5D81                  ; 5D13   0004 015C 0181
        JSR     R5,     L_5D99                  ; 5D16   0004 015C 0199

        MVII    #$02A5, R4                      ; 5D19   02BC 02A5

        JSR     R5,     X_PRINT_R5              ; 5D1B   0004 0118 007B
        STRING  "GET READY"                     ; 5D1E  
        DECLE   $0000                           ; 5D27   0000

        PULR    R7                              ; 5D28   02B7

L_5D29:
        PSHR    R5                              ; 5D29   0275
        PSHR    R4                              ; 5D2A   0274

        JSR     R5,     L_5F19                  ; 5D2B   0004 015C 0319

        MVO     R0,     G_033F                  ; 5D2E   0240 033F

        JSR     R5,     L_5EC0                  ; 5D30   0004 015C 02C0

        MVI     G_0144, R0                      ; 5D33   0280 0144

        JSR     R5,     L_5EC0                  ; 5D35   0004 015C 02C0

        MVI     G_0144, R0                      ; 5D38   0280 0144

        JSR     R5,     L_5D91                  ; 5D3A   0004 015C 0191

        MVII    #$0002, R1                      ; 5D3D   02B9 0002
        PULR    R4                              ; 5D3F   02B4

        JSR     R5,     X_PRNUM_RGT             ; 5D40   0004 0118 00C5

        ADDR    R1,     R4                      ; 5D43   00CC
        MVII    #$0070, R0                      ; 5D44   02B8 0070
        XORR    R3,     R0                      ; 5D46   01D8
        MVO@    R0,     R4                      ; 5D47   0260
        MVI     G_0145, R0                      ; 5D48   0280 0145

        JSR     R5,     X_PRNUM_ZRO             ; 5D4A   0004 0118 00AD

        ADDR    R1,     R4                      ; 5D4D   00CC
        PULR    R7                              ; 5D4E   02B7

L_5D4F:
        PSHR    R5                              ; 5D4F   0275
        MVI     G_0147, R0                      ; 5D50   0280 0147
        INCR    R0                              ; 5D52   0008
        MVII    #$0001, R1                      ; 5D53   02B9 0001

        JSR     R5,     L_5D91                  ; 5D55   0004 015C 0191

        MVII    #$027E, R4                      ; 5D58   02BC 027E

        JSR     R5,     X_PRNUM_RGT             ; 5D5A   0004 0118 00C5

        MVI     G_0146, R0                      ; 5D5D   0280 0146
        INCR    R0                              ; 5D5F   0008
        MVII    #$0002, R1                      ; 5D60   02B9 0002
        MVII    #$0291, R4                      ; 5D62   02BC 0291

        JSR     R5,     X_PRNUM_RGT             ; 5D64   0004 0118 00C5
        JSR     R5,     L_5EC0                  ; 5D67   0004 015C 02C0

        MVI     G_0144, R0                      ; 5D6A   0280 0144
        MVII    #$0002, R1                      ; 5D6C   02B9 0002

        JSR     R5,     L_5D91                  ; 5D6E   0004 015C 0191

        MVII    #$029A, R4                      ; 5D71   02BC 029A

        JSR     R5,     X_PRNUM_RGT             ; 5D73   0004 0118 00C5

        ADDR    R1,     R4                      ; 5D76   00CC
        MVII    #$0070, R0                      ; 5D77   02B8 0070
        XORR    R3,     R0                      ; 5D79   01D8
        MVO@    R0,     R4                      ; 5D7A   0260
        MVI     G_0145, R0                      ; 5D7B   0280 0145

        JSR     R5,     X_PRNUM_ZRO             ; 5D7D   0004 0118 00AD

        PULR    R7                              ; 5D80   02B7

L_5D81:
        PSHR    R5                              ; 5D81   0275
        MVII    #$0278, R4                      ; 5D82   02BC 0278

        JSR     R5,     L_6882                  ; 5D84   0004 0168 0082

        ADDI    #$0014, R4                      ; 5D87   02FC 0014

        JSR     R5,     L_6882                  ; 5D89   0004 0168 0082

        PULR    R7                              ; 5D8C   02B7

        DECLE   $0003,  $0006,  $0001           ; 5D8D   0003 0006 0001

        SETC                                    ; 5D90   0007
L_5D91:
        SDBD                                    ; 5D91   0001
        MVII    #$5D8D, R3                      ; 5D92   02BB 008D 005D
        ADD     G_0147, R3                      ; 5D95   02C3 0147
        MVI@    R3,     R3                      ; 5D97   029B
        MOVR    R5,     R7                      ; 5D98   00AF

L_5D99:
        PSHR    R5                              ; 5D99   0275

        JSR     R5,     L_5D91                  ; 5D9A   0004 015C 0191

        SDBD                                    ; 5D9D   0001
        XORI    #$2200, R3                      ; 5D9E   03FB 0000 0022
        PULR    R7                              ; 5DA1   02B7

L_5DA2:
        PSHR    R5                              ; 5DA2   0275
        SDBD                                    ; 5DA3   0001
        MVII    #$A45C, R4                      ; 5DA4   02BC 005C 00A4
        MVI     G_0149, R0                      ; 5DA7   0280 0149
        ADDR    R0,     R0                      ; 5DA9   00C0
        MOVR    R0,     R1                      ; 5DAA   0081
        ADDR    R0,     R0                      ; 5DAB   00C0
        ADDR    R1,     R0                      ; 5DAC   00C8
        MVI     G_0134, R1                      ; 5DAD   0281 0134
        ANDI    #$0018, R1                      ; 5DAF   03B9 0018
        SLR     R1,     2                       ; 5DB1   0065
        ADDR    R1,     R0                      ; 5DB2   00C8
        ADDR    R0,     R4                      ; 5DB3   00C4
        SDBD                                    ; 5DB4   0001
        MVI@    R4,     R0                      ; 5DB5   02A0
        MVO     R0,     G_0342                  ; 5DB6   0240 0342
        MVI     G_0137, R0                      ; 5DB8   0280 0137
        TSTR    R0                              ; 5DBA   0080
        BNEQ    L_5DF3                          ; 5DBB   020C 0036

        SDBD                                    ; 5DBD   0001
        MVII    #$A93F, R0                      ; 5DBE   02B8 003F 00A9
        MVO     R0,     G_0348                  ; 5DC1   0240 0348

        JSR     R5,     L_6941                  ; 5DC3   0004 0168 0141
        JSR     R5,     L_6E70                  ; 5DC6   0004 016C 0270
        DECLE   $0009                           ; 5DC9   0009

        CLRR    R3                              ; 5DCA   01DB
        MVII    #$0295, R4                      ; 5DCB   02BC 0295

        JSR     R5,     L_5E5D                  ; 5DCD   0004 015C 025D
        JSR     R5,     L_5D4F                  ; 5DD0   0004 015C 014F

        MVI     G_0342, R0                      ; 5DD3   0280 0342
        MVO     R0,     G_033F                  ; 5DD5   0240 033F

        JSR     R5,     L_5EC0                  ; 5DD7   0004 015C 02C0

        MVI     G_0144, R0                      ; 5DDA   0280 0144
        MVII    #$0002, R1                      ; 5DDC   02B9 0002

        JSR     R5,     L_5D99                  ; 5DDE   0004 015C 0199

        MVII    #$0286, R4                      ; 5DE1   02BC 0286

        JSR     R5,     X_PRNUM_RGT             ; 5DE3   0004 0118 00C5

        ADDR    R1,     R4                      ; 5DE6   00CC
        MVII    #$0070, R0                      ; 5DE7   02B8 0070
        XORR    R3,     R0                      ; 5DE9   01D8
        MVO@    R0,     R4                      ; 5DEA   0260
        MVI     G_0145, R0                      ; 5DEB   0280 0145

        JSR     R5,     X_PRNUM_ZRO             ; 5DED   0004 0118 00AD
        JSR     R5,     L_5D81                  ; 5DF0   0004 015C 0181
L_5DF3:
        JSR     R5,     L_5EA0                  ; 5DF3   0004 015C 02A0

        BC      L_5E59                          ; 5DF6   0201 0061

        JSR     R5,     L_5F19                  ; 5DF8   0004 015C 0319

        TSTR    R0                              ; 5DFB   0080
        BEQ     L_5E0D                          ; 5DFC   0204 000F

        MVI     G_0342, R1                      ; 5DFE   0281 0342

        JSR     R5,     L_5CB3                  ; 5E00   0004 015C 00B3

        BEQ     L_5E0A                          ; 5E03   0204 0005

        CMPR    R1,     R0                      ; 5E05   0148
        BGE     L_5E2C                          ; 5E06   020D 0024
        B       L_5E0D                          ; 5E08   0200 0003

L_5E0A:
        CMPR    R0,     R1                      ; 5E0A   0141
        BGT     L_5E2C                          ; 5E0B   020E 001F

L_5E0D:
        MVO     R0,     G_033F                  ; 5E0D   0240 033F

        JSR     R5,     L_5EC0                  ; 5E0F   0004 015C 02C0

        SDBD                                    ; 5E12   0001
        MVII    #$A9CA, R0                      ; 5E13   02B8 00CA 00A9
        MVO     R0,     G_0348                  ; 5E16   0240 0348

        JSR     R5,     L_6941                  ; 5E18   0004 0168 0141
        JSR     R5,     L_6E70                  ; 5E1B   0004 016C 0270
        DECLE   $000F                           ; 5E1E   000F

        MVII    #$01B0, R2                      ; 5E1F   02BA 01B0
        ADD     G_0149, R2                      ; 5E21   02C2 0149

        JSR     R5,     L_6334                  ; 5E23   0004 0160 0334

        XOR@    R2,     R5                      ; 5E26   03D5
        MVO@    R5,     R2                      ; 5E27   0255
        MVII    #$0001, R3                      ; 5E28   02BB 0001
        B       L_5E40                          ; 5E2A   0200 0014

L_5E2C:
        MVO     R0,     G_033F                  ; 5E2C   0240 033F

        JSR     R5,     L_5EC0                  ; 5E2E   0004 015C 02C0

        SDBD                                    ; 5E31   0001
        MVII    #$A9B7, R0                      ; 5E32   02B8 00B7 00A9
        MVO     R0,     G_0348                  ; 5E35   0240 0348

        JSR     R5,     L_6941                  ; 5E37   0004 0168 0141
        JSR     R5,     L_6E70                  ; 5E3A   0004 016C 0270
        DECLE   $000C                           ; 5E3D   000C

        MVII    #$0007, R3                      ; 5E3E   02BB 0007
L_5E40:
        MVI     G_0144, R0                      ; 5E40   0280 0144
        MVII    #$0002, R1                      ; 5E42   02B9 0002
        MVII    #$02AE, R4                      ; 5E44   02BC 02AE

        JSR     R5,     X_PRNUM_RGT             ; 5E46   0004 0118 00C5

        MVI     G_0145, R0                      ; 5E49   0280 0145
        MVII    #$0002, R1                      ; 5E4B   02B9 0002
        MVII    #$02B1, R4                      ; 5E4D   02BC 02B1

        JSR     R5,     X_PRNUM_ZRO             ; 5E4F   0004 0118 00AD

        MVII    #$02A0, R0                      ; 5E52   02B8 02A0
        MVO     R0,     G_0348                  ; 5E54   0240 0348

        JSR     R5,     L_6880                  ; 5E56   0004 0168 0080

L_5E59:
        PULR    R7                              ; 5E59   02B7

L_5E5A:
        MVII    #$000F, R1                      ; 5E5A   02B9 000F
        INCR    R7                              ; 5E5C   000F

L_5E5D:
        CLRR    R1                              ; 5E5D   01C9
L_5E5E:
        PSHR    R5                              ; 5E5E   0275

        JSR     R5,     L_5CB3                  ; 5E5F   0004 015C 00B3

        SDBD                                    ; 5E62   0001
        ADDI    #$A973, R5                      ; 5E63   02FD 0073 00A9
        ADDR    R5,     R1                      ; 5E66   00E9

        JSR     R5,     X_PRINT_R1              ; 5E67   0004 0118 0067

        PULR    R7                              ; 5E6A   02B7

L_5E6B:
        SDBD                                    ; 5E6B   0001
        MVII    #$A9AB, R0                      ; 5E6C   02B8 00AB 00A9
        B       L_5E7B                          ; 5E6F   0200 000A

L_5E71:
        SDBD                                    ; 5E71   0001
        MVII    #$A991, R0                      ; 5E72   02B8 0091 00A9
        B       L_5E7B                          ; 5E75   0200 0004

L_5E77:
        SDBD                                    ; 5E77   0001
        MVII    #$A99F, R0                      ; 5E78   02B8 009F 00A9
L_5E7B:
        PSHR    R5                              ; 5E7B   0275
        MVO     R0,     G_0348                  ; 5E7C   0240 0348

        JSR     R5,     L_6941                  ; 5E7E   0004 0168 0141

        MVII    #$028C, R0                      ; 5E81   02B8 028C
        MVO     R0,     G_0348                  ; 5E83   0240 0348

        JSR     R5,     L_6880                  ; 5E85   0004 0168 0080

        CLRR    R0                              ; 5E88   01C0
        MVO     R0,     G_033F                  ; 5E89   0240 033F
        INCR    R0                              ; 5E8B   0008
        MVO     R0,     G_0137                  ; 5E8C   0240 0137

        JSR     R5,     L_6E70                  ; 5E8E   0004 016C 0270
        DECLE   $0027                           ; 5E91   0027

        PULR    R7                              ; 5E92   02B7

L_5E93:
        PSHR    R5                              ; 5E93   0275
        MVII    #$0278, R4                      ; 5E94   02BC 0278
        MOVR    R4,     R5                      ; 5E96   00A5
        INCR    R5                              ; 5E97   000D
        MVII    #$0035, R1                      ; 5E98   02B9 0035
L_5E9A:
        MVI@    R4,     R0                      ; 5E9A   02A0
        MVO@    R0,     R5                      ; 5E9B   0268
        DECR    R1                              ; 5E9C   0011
        BNEQ    L_5E9A                          ; 5E9D   022C 0004
        PULR    R7                              ; 5E9F   02B7

L_5EA0:
        MVI     G_0146, R0                      ; 5EA0   0280 0146
        CMPI    #$0002, R0                      ; 5EA2   0378 0002
        BLT     L_5EB7                          ; 5EA4   0205 0011

        MVI     G_0149, R1                      ; 5EA6   0281 0149
        ANDI    #$0003, R1                      ; 5EA8   03B9 0003
        CMPI    #$0003, R1                      ; 5EAA   0379 0003
        BNEQ    L_5EBE                          ; 5EAC   020C 0010

        CMPI    #$0002, R0                      ; 5EAE   0378 0002
        BGT     L_5EB9                          ; 5EB0   020E 0007

        MVI     G_013A, R0                      ; 5EB2   0280 013A
        TSTR    R0                              ; 5EB4   0080
        BEQ     L_5EBE                          ; 5EB5   0204 0007

L_5EB7:
        SETC                                    ; 5EB7   0007
        MOVR    R5,     R7                      ; 5EB8   00AF

L_5EB9:
        MVI     G_013B, R1                      ; 5EB9   0281 013B
        TSTR    R1                              ; 5EBB   0089
        BNEQ    L_5EB7                          ; 5EBC   022C 0006

L_5EBE:
        CLRC                                    ; 5EBE   0006
        MOVR    R5,     R7                      ; 5EBF   00AF

L_5EC0:
        PSHR    R5                              ; 5EC0   0275
        CLRR    R0                              ; 5EC1   01C0
        MVO     R0,     G_0144                  ; 5EC2   0240 0144
        MVO     R0,     G_0145                  ; 5EC4   0240 0145
        MVII    #$003C, R2                      ; 5EC6   02BA 003C

        JSR     R5,     L_5CB3                  ; 5EC8   0004 015C 00B3

        BEQ     L_5ECF                          ; 5ECB   0204 0002

        MVII    #$0040, R2                      ; 5ECD   02BA 0040
L_5ECF:
        MVI     G_033F, R0                      ; 5ECF   0280 033F
        CLRR    R1                              ; 5ED1   01C9
L_5ED2:
        CMPR    R2,     R0                      ; 5ED2   0150
        BLT     L_5ED9                          ; 5ED3   0205 0004

        SUBR    R2,     R0                      ; 5ED5   0110
        INCR    R1                              ; 5ED6   0009
        B       L_5ED2                          ; 5ED7   0220 0006

L_5ED9:
        MVO     R1,     G_0144                  ; 5ED9   0241 0144
        MOVR    R0,     R1                      ; 5EDB   0081
        TSTR    R5                              ; 5EDC   00AD
        BNEQ    L_5EEA                          ; 5EDD   020C 000B

        SLR     R1,     1                       ; 5EDF   0061
        ADDR    R1,     R0                      ; 5EE0   00C8
        SLR     R1,     2                       ; 5EE1   0065
        ADDR    R1,     R0                      ; 5EE2   00C8
        SLR     R1,     1                       ; 5EE3   0061
        ADDR    R1,     R0                      ; 5EE4   00C8
        SLR     R1,     1                       ; 5EE5   0061
        ADDR    R1,     R0                      ; 5EE6   00C8
L_5EE7:
        MVO     R0,     G_0145                  ; 5EE7   0240 0145
        PULR    R7                              ; 5EE9   02B7

L_5EEA:
        SLR     R1,     1                       ; 5EEA   0061
        ADDR    R1,     R0                      ; 5EEB   00C8
        SLR     R1,     2                       ; 5EEC   0065
        SLR     R1,     1                       ; 5EED   0061
        ADDR    R1,     R0                      ; 5EEE   00C8
        B       L_5EE7                          ; 5EEF   0220 0009

L_5EF1:
        PSHR    R5                              ; 5EF1   0275
        MVII    #$015F, R4                      ; 5EF2   02BC 015F
        MVI     G_0147, R0                      ; 5EF4   0280 0147
        ADDR    R0,     R0                      ; 5EF6   00C0
        ADDR    R0,     R4                      ; 5EF7   00C4
        MVI     G_0149, R0                      ; 5EF8   0280 0149
        SLL     R0,     2                       ; 5EFA   004C
        ADDR    R0,     R0                      ; 5EFB   00C0
        ADDR    R0,     R4                      ; 5EFC   00C4
        MVI     G_033F, R0                      ; 5EFD   0280 033F
        TSTR    R0                              ; 5EFF   0080
        BEQ     L_5F18                          ; 5F00   0204 0016

        SDBD                                    ; 5F02   0001
        MVI@    R4,     R1                      ; 5F03   02A1
        TSTR    R1                              ; 5F04   0089
        BEQ     L_5F12                          ; 5F05   0204 000B

        JSR     R5,     L_5CB3                  ; 5F07   0004 015C 00B3

        BNEQ    L_5F0F                          ; 5F0A   020C 0003

        CMPR    R1,     R0                      ; 5F0C   0148
        B       L_5F10                          ; 5F0D   0200 0001

L_5F0F:
        CMPR    R0,     R1                      ; 5F0F   0141
L_5F10:
        BGT     L_5F18                          ; 5F10   020E 0006

L_5F12:
        DECR    R4                              ; 5F12   0014
        DECR    R4                              ; 5F13   0014
        MOVR    R0,     R1                      ; 5F14   0081
        SWAP    R1,     1                       ; 5F15   0041
        MVO@    R0,     R4                      ; 5F16   0260
        MVO@    R1,     R4                      ; 5F17   0261
L_5F18:
        PULR    R7                              ; 5F18   02B7

L_5F19:
        PSHR    R5                              ; 5F19   0275
        MVII    #$015F, R4                      ; 5F1A   02BC 015F
        MVI     G_0147, R0                      ; 5F1C   0280 0147
        ADDR    R0,     R0                      ; 5F1E   00C0
        ADDR    R0,     R4                      ; 5F1F   00C4
        MVI     G_0149, R0                      ; 5F20   0280 0149
        SLL     R0,     2                       ; 5F22   004C
        ADDR    R0,     R0                      ; 5F23   00C0
        ADDR    R0,     R4                      ; 5F24   00C4
        SDBD                                    ; 5F25   0001
        MVI@    R4,     R0                      ; 5F26   02A0
        PULR    R7                              ; 5F27   02B7

        DECLE   $0020,  $0020,  $0001,  $0000   ; 5F28   0020 0020 0001 0000
L_5F2C:
        PSHR    R5                              ; 5F2C   0275
        MVI     G_011C, R0                      ; 5F2D   0280 011C
        MVO     R0,     G_011D                  ; 5F2F   0240 011D
        MVI     G_0148, R1                      ; 5F31   0281 0148
        SLR     R0,     1                       ; 5F33   0060
        TSTR    R1                              ; 5F34   0089
        BEQ     L_5F3D                          ; 5F35   0204 0006

        CMPI    #$0002, R1                      ; 5F37   0379 0002
        BEQ     L_5F3D                          ; 5F39   0204 0002

        ANDI    #$003F, R0                      ; 5F3B   03B8 003F
L_5F3D:
        MVO     R0,     G_011E                  ; 5F3D   0240 011E
        SDBD                                    ; 5F3F   0001
        MVII    #$5F28, R4                      ; 5F40   02BC 0028 005F
        ADD     G_0148, R4                      ; 5F43   02C4 0148
        MVI@    R4,     R0                      ; 5F45   02A0
        TSTR    R0                              ; 5F46   0080
        BEQ     L_5F65                          ; 5F47   0204 001C

        MVII    #$0319, R4                      ; 5F49   02BC 0319
        MVI@    R4,     R1                      ; 5F4B   02A1
        MOVR    R1,     R2                      ; 5F4C   008A

        JSR     R5,     L_5F66                  ; 5F4D   0004 015C 0366

        MVO@    R1,     R4                      ; 5F50   0261
        MOVR    R2,     R1                      ; 5F51   0091

        JSR     R5,     L_5F66                  ; 5F52   0004 015C 0366

        MVO@    R1,     R4                      ; 5F55   0261
        MVII    #$0321, R4                      ; 5F56   02BC 0321
        MVI@    R4,     R1                      ; 5F58   02A1
        ADDI    #$0080, R1                      ; 5F59   02F9 0080
        MOVR    R1,     R2                      ; 5F5B   008A

        JSR     R5,     L_5F66                  ; 5F5C   0004 015C 0366

        MVO@    R1,     R4                      ; 5F5F   0261
        MOVR    R2,     R1                      ; 5F60   0091

        JSR     R5,     L_5F66                  ; 5F61   0004 015C 0366

        MVO@    R1,     R4                      ; 5F64   0261
L_5F65:
        PULR    R7                              ; 5F65   02B7

L_5F66:
        PSHR    R5                              ; 5F66   0275
        RRC     R0,     1                       ; 5F67   0070
        BNC     L_5F6C                          ; 5F68   0209 0002

        ADDI    #$0008, R1                      ; 5F6A   02F9 0008
L_5F6C:
        RRC     R0,     1                       ; 5F6C   0070
        BNC     L_5F71                          ; 5F6D   0209 0002

        SUBI    #$0008, R1                      ; 5F6F   0339 0008
L_5F71:
        PULR    R7                              ; 5F71   02B7

L_5F72:
        PSHR    R5                              ; 5F72   0275
        MVI     G_014C, R0                      ; 5F73   0280 014C
        CMPI    #$007F, R0                      ; 5F75   0378 007F
        BLE     L_5F8A                          ; 5F77   0206 0011

        JSR     R5,     L_63A2                  ; 5F79   0004 0160 03A2

        MVII    #$00E0, R1                      ; 5F7C   02B9 00E0
        MVO     R1,     G_011C                  ; 5F7E   0241 011C
        CMPI    #$0058, R0                      ; 5F80   0378 0058
        BLT     L_5F8A                          ; 5F82   0205 0006

        MVI     G_014C, R0                      ; 5F84   0280 014C
        ANDI    #$007F, R0                      ; 5F86   03B8 007F
        MVO     R0,     G_014C                  ; 5F88   0240 014C
L_5F8A:
        PULR    R7                              ; 5F8A   02B7

L_5F8B:
        PSHR    R5                              ; 5F8B   0275
        MVI     G_014C, R0                      ; 5F8C   0280 014C
        SWAP    R0,     2                       ; 5F8E   0044
        BPL     L_5FA2                          ; 5F8F   0203 0011

        JSR     R5,     L_6556                  ; 5F91   0004 0164 0156

        CMPI    #$005E, R0                      ; 5F94   0378 005E
        BLT     L_5FA2                          ; 5F96   0205 000A

        MVI     G_014C, R0                      ; 5F98   0280 014C
        ANDI    #$007F, R0                      ; 5F9A   03B8 007F
        MVO     R0,     G_014C                  ; 5F9C   0240 014C

        JSR     R5,     L_6E70                  ; 5F9E   0004 016C 0270
        DECLE   $002A                           ; 5FA1   002A
L_5FA2:
        PULR    R7                              ; 5FA2   02B7

L_5FA3:
        PSHR    R5                              ; 5FA3   0275
        MVII    #$0002, R0                      ; 5FA4   02B8 0002
        MVO     R0,     G_013A                  ; 5FA6   0240 013A
        MVI     G_014C, R0                      ; 5FA8   0280 014C
        CMPI    #$007F, R0                      ; 5FAA   0378 007F
        BLE     L_5FE9                          ; 5FAC   0206 003B

        ANDI    #$0040, R0                      ; 5FAE   03B8 0040
        BNEQ    L_5FB5                          ; 5FB0   020C 0003

        JSR     R5,     L_63A2                  ; 5FB2   0004 0160 03A2

L_5FB5:
        MVI     G_0321, R0                      ; 5FB5   0280 0321
        ANDI    #$007F, R0                      ; 5FB7   03B8 007F
L_5FB9:
        MVI     G_033E, R1                      ; 5FB9   0281 033E
        TSTR    R1                              ; 5FBB   0089
        BPL     L_5FCE                          ; 5FBC   0203 0010

L_5FBE:
        MVI     G_0346, R1                      ; 5FBE   0281 0346
        ANDI    #$0003, R1                      ; 5FC0   03B9 0003
        BNEQ    L_5FD2                          ; 5FC2   020C 000E

        MVI     G_011C, R1                      ; 5FC4   0281 011C
        ADDI    #$0010, R1                      ; 5FC6   02F9 0010
        ANDI    #$007F, R1                      ; 5FC8   03B9 007F
        MVO     R1,     G_011C                  ; 5FCA   0241 011C
        B       L_5FD2                          ; 5FCC   0200 0004

L_5FCE:
        MVII    #$00D0, R1                      ; 5FCE   02B9 00D0
        MVO     R1,     G_011C                  ; 5FD0   0241 011C
L_5FD2:
        CMPI    #$005C, R0                      ; 5FD2   0378 005C
        BLT     L_5FE9                          ; 5FD4   0205 0013

        JSR     R5,     L_6662                  ; 5FD6   0004 0164 0262

        CMPI    #$0020, R0                      ; 5FD9   0378 0020
        BNEQ    L_5FE9                          ; 5FDB   020C 000C

        MVI     G_014C, R0                      ; 5FDD   0280 014C
        ANDI    #$003F, R0                      ; 5FDF   03B8 003F
        MVO     R0,     G_014C                  ; 5FE1   0240 014C
        MVI     G_0321, R0                      ; 5FE3   0280 0321
        SUBI    #$0004, R0                      ; 5FE5   0338 0004
        MVO     R0,     G_0321                  ; 5FE7   0240 0321
L_5FE9:
        PULR    R7                              ; 5FE9   02B7

L_5FEA:
        PSHR    R5                              ; 5FEA   0275
        MVI     G_0121, R0                      ; 5FEB   0280 0121
        INCR    R0                              ; 5FED   0008
        CMPI    #$001F, R0                      ; 5FEE   0378 001F
        BGE     L_5FF4                          ; 5FF0   020D 0002

        MVO     R0,     G_0121                  ; 5FF2   0240 0121
L_5FF4:
        MVI     G_014C, R0                      ; 5FF4   0280 014C
        CMPI    #$007F, R0                      ; 5FF6   0378 007F
        BLE     L_5FE9                          ; 5FF8   0226 0010

        ANDI    #$0040, R0                      ; 5FFA   03B8 0040
        BNEQ    L_6001                          ; 5FFC   020C 0003

        JSR     R5,     L_63A2                  ; 5FFE   0004 0160 03A2

L_6001:
        MVI     G_0321, R0                      ; 6001   0280 0321
        ANDI    #$007F, R0                      ; 6003   03B8 007F
        MVI     G_013A, R1                      ; 6005   0281 013A
        CMPI    #$0002, R1                      ; 6007   0379 0002
        BEQ     L_5FB9                          ; 6009   0224 0051

        CMPI    #$0058, R0                      ; 600B   0378 0058
        BLT     L_5FBE                          ; 600D   0225 0050

        INCR    R1                              ; 600F   0009
        MVO     R1,     G_013A                  ; 6010   0241 013A
        MVI     G_0121, R2                      ; 6012   0282 0121
        SLR     R2,     1                       ; 6014   0062
        MVII    #$0006, R4                      ; 6015   02BC 0006
        ADDR    R2,     R4                      ; 6017   00D4
        CMPI    #$0001, R1                      ; 6018   0379 0001
        BEQ     L_6028                          ; 601A   0204 000C

        MVII    #$0003, R4                      ; 601C   02BC 0003
        ADDR    R2,     R4                      ; 601E   00D4
        MVI     G_0348, R0                      ; 601F   0280 0348
        NEGR    R0                              ; 6021   0020
        MOVR    R0,     R1                      ; 6022   0081
        SLR     R1,     2                       ; 6023   0065
        SUBR    R1,     R0                      ; 6024   0108
        NEGR    R0                              ; 6025   0020
        MVO     R0,     G_0348                  ; 6026   0240 0348
L_6028:
        MVO     R4,     G_014B                  ; 6028   0244 014B
        MVI     G_0348, R1                      ; 602A   0281 0348
        MVO     R1,     G_033E                  ; 602C   0241 033E

        JSR     R5,     L_6E70                  ; 602E   0004 016C 0270
        DECLE   $0018                           ; 6031   0018

        B       L_5FBE                          ; 6032   0220 0075

L_6034:
        PSHR    R5                              ; 6034   0275
        SDBD                                    ; 6035   0001
        MVII    #$AF52, R0                      ; 6036   02B8 0052 00AF
        MVO     R0,     G_0343                  ; 6039   0240 0343
        PULR    R7                              ; 603B   02B7

L_603C:
        PSHR    R5                              ; 603C   0275
        MVII    #$02CA, R2                      ; 603D   02BA 02CA
        SDBD                                    ; 603F   0001
        MVII    #$A450, R4                      ; 6040   02BC 0050 00A4

        JSR     R5,     L_604C                  ; 6043   0004 0160 004C

        ADDI    #$0012, R2                      ; 6046   02FA 0012

        JSR     R5,     L_604C                  ; 6048   0004 0160 004C

        PULR    R7                              ; 604B   02B7

L_604C:
        PSHR    R5                              ; 604C   0275
        SDBD                                    ; 604D   0001
        MVI@    R4,     R0                      ; 604E   02A0
        MVO@    R0,     R2                      ; 604F   0250
        INCR    R2                              ; 6050   000A
        SDBD                                    ; 6051   0001
        MVI@    R4,     R0                      ; 6052   02A0
        MVO@    R0,     R2                      ; 6053   0250
        INCR    R2                              ; 6054   000A
        SDBD                                    ; 6055   0001
        MVI@    R4,     R0                      ; 6056   02A0
        MVO@    R0,     R2                      ; 6057   0250
        PULR    R7                              ; 6058   02B7

L_6059:
        PSHR    R5                              ; 6059   0275
        PSHR    R0                              ; 605A   0270
        MVI     G_0341, R0                      ; 605B   0280 0341
        MOVR    R0,     R1                      ; 605D   0081
        SDBD                                    ; 605E   0001
        ANDI    #$7FFF, R1                      ; 605F   03B9 00FF 007F
        ANDI    #$0003, R0                      ; 6062   03B8 0003
        BEQ     L_606E                          ; 6064   0204 0008

        CMPI    #$0003, R0                      ; 6066   0378 0003
        BEQ     L_606E                          ; 6068   0204 0004

        SDBD                                    ; 606A   0001
        ADDI    #$8000, R1                      ; 606B   02F9 0000 0080
L_606E:
        SLR     R1,     1                       ; 606E   0061
        MVO     R1,     G_0341                  ; 606F   0241 0341
        PULR    R0                              ; 6071   02B0
        PULR    R7                              ; 6072   02B7

L_6073:
        MVI     G_0319, R0                      ; 6073   0280 0319
        INCR    R0                              ; 6075   0008
        MVO     R0,     G_0319                  ; 6076   0240 0319
        MOVR    R5,     R7                      ; 6078   00AF

L_6079:
        MVI     G_0346, R0                      ; 6079   0280 0346
        ANDI    #$0003, R0                      ; 607B   03B8 0003
        MOVR    R5,     R7                      ; 607D   00AF

L_607E:
        MVI     G_0346, R0                      ; 607E   0280 0346
        ANDI    #$0007, R0                      ; 6080   03B8 0007
        MOVR    R5,     R7                      ; 6082   00AF

        PSHR    R5                              ; 6083   0275

        JSR     R5,     L_6079                  ; 6084   0004 0160 0079

        BNEQ    L_608D                          ; 6087   020C 0004

        MVI     G_011C, R0                      ; 6089   0280 011C
        ADDI    #$0010, R0                      ; 608B   02F8 0010
L_608D:
        PULR    R7                              ; 608D   02B7

        PSHR    R5                              ; 608E   0275

        JSR     R5,     L_607E                  ; 608F   0004 0160 007E

        BNEQ    L_6098                          ; 6092   020C 0004

        MVI     G_011C, R0                      ; 6094   0280 011C
        ADDI    #$0010, R0                      ; 6096   02F8 0010
L_6098:
        PULR    R7                              ; 6098   02B7

L_6099:
        PSHR    R5                              ; 6099   0275
        MOVR    R0,     R1                      ; 609A   0081
        SWAP    R1,     1                       ; 609B   0041
        ANDI    #$00FF, R0                      ; 609C   03B8 00FF
        ANDI    #$00FF, R1                      ; 609E   03B9 00FF
        MVII    #$0319, R2                      ; 60A0   02BA 0319
        ADDR    R1,     R2                      ; 60A2   00CA
        MVI@    R2,     R1                      ; 60A3   0291
        ANDI    #$00FF, R1                      ; 60A4   03B9 00FF
        MVI     G_0105, R2                      ; 60A6   0282 0105
        ANDI    #$0007, R2                      ; 60A8   03BA 0007
        ADDR    R2,     R0                      ; 60AA   00D0
        ADDR    R1,     R0                      ; 60AB   00C8
        ADD     G_034A, R0                      ; 60AC   02C0 034A
        SUBI    #$0159, R0                      ; 60AE   0338 0159
        BMI     L_60C2                          ; 60B0   020B 0010

        MOVR    R0,     R1                      ; 60B2   0081
        SLL     R0,     2                       ; 60B3   004C
        SLL     R0,     1                       ; 60B4   0048
        ADDR    R1,     R0                      ; 60B5   00C8
        SLR     R1,     2                       ; 60B6   0065
        SLR     R1,     1                       ; 60B7   0061
        SUBR    R1,     R0                      ; 60B8   0108
        MVI     G_0149, R2                      ; 60B9   0282 0149
        CMPI    #$0008, R2                      ; 60BB   037A 0008
        BEQ     L_60C0                          ; 60BD   0204 0001

        SLR     R0,     1                       ; 60BF   0060
L_60C0:
        MVO     R0,     G_033F                  ; 60C0   0240 033F
L_60C2:
        PULR    R7                              ; 60C2   02B7

L_60C3:
        MVI     G_0319, R0                      ; 60C3   0280 0319
        MOVR    R0,     R1                      ; 60C5   0081
        ANDI    #$00FF, R1                      ; 60C6   03B9 00FF
        CMPI    #$00F0, R1                      ; 60C8   0379 00F0
        BGT     L_60D0                          ; 60CA   020E 0004

        SUBI    #$0002, R0                      ; 60CC   0338 0002
        MVO     R0,     G_0319                  ; 60CE   0240 0319
L_60D0:
        MOVR    R5,     R7                      ; 60D0   00AF

        PSHR    R5                              ; 60D1   0275
        MVI     G_011B, R0                      ; 60D2   0280 011B
        DECR    R0                              ; 60D4   0010
        BMI     L_60DB                          ; 60D5   020B 0004

        MVO     R0,     G_011B                  ; 60D7   0240 011B
        B       L_624D                          ; 60D9   0200 0172

L_60DB:
        MVI     G_0103, R0                      ; 60DB   0280 0103
        INCR    R0                              ; 60DD   0008
        MVO     R0,     G_0103                  ; 60DE   0240 0103
        MVI     G_0102, R0                      ; 60E0   0280 0102
        DECR    R0                              ; 60E2   0010
        BPL     L_60E9                          ; 60E3   0203 0004

        MVO     R0,     .STIC.VIDEN             ; 60E5   0240 0020
        B       L_6238                          ; 60E7   0200 014F

L_60E9:
        MVO     R0,     G_0102                  ; 60E9   0240 0102
        MVII    #$0318, R4                      ; 60EB   02BC 0318
        CLRR    R5                              ; 60ED   01ED
        MVII    #$0002, R1                      ; 60EE   02B9 0002
        MVI     G_0347, R3                      ; 60F0   0283 0347
        TSTR    R3                              ; 60F2   009B
        BNEQ    L_60F6                          ; 60F3   020C 0001

        CLRR    R1                              ; 60F5   01C9
L_60F6:
        MVI@    R4,     R0                      ; 60F6   02A0
        MVO@    R0,     R5                      ; 60F7   0268
        MVI@    R4,     R0                      ; 60F8   02A0
        MVO@    R0,     R5                      ; 60F9   0268
        MVI@    R4,     R0                      ; 60FA   02A0
        MVO@    R0,     R5                      ; 60FB   0268
        MVI@    R4,     R0                      ; 60FC   02A0
        MVO@    R0,     R5                      ; 60FD   0268
        MVI@    R4,     R0                      ; 60FE   02A0
        MVO@    R0,     R5                      ; 60FF   0268
        MVI@    R4,     R0                      ; 6100   02A0
        MVO@    R0,     R5                      ; 6101   0268
        MVI@    R4,     R0                      ; 6102   02A0
        MVO@    R0,     R5                      ; 6103   0268
        MVI@    R4,     R0                      ; 6104   02A0
        MVO@    R0,     R5                      ; 6105   0268
        MVI@    R4,     R0                      ; 6106   02A0
        ADDR    R1,     R0                      ; 6107   00C8
        MVO@    R0,     R5                      ; 6108   0268
        MVI@    R4,     R0                      ; 6109   02A0
        ADDR    R1,     R0                      ; 610A   00C8
        MVO@    R0,     R5                      ; 610B   0268
        MVI@    R4,     R0                      ; 610C   02A0
        ADDR    R1,     R0                      ; 610D   00C8
        MVO@    R0,     R5                      ; 610E   0268
        MVI@    R4,     R0                      ; 610F   02A0
        ADDR    R1,     R0                      ; 6110   00C8
        MVO@    R0,     R5                      ; 6111   0268
        MVI@    R4,     R0                      ; 6112   02A0
        ADDR    R1,     R0                      ; 6113   00C8
        MVO@    R0,     R5                      ; 6114   0268
        MVI@    R4,     R0                      ; 6115   02A0
        ADDR    R1,     R0                      ; 6116   00C8
        MVO@    R0,     R5                      ; 6117   0268
        MVI@    R4,     R0                      ; 6118   02A0
        ADDR    R1,     R0                      ; 6119   00C8
        MVO@    R0,     R5                      ; 611A   0268
        MVI@    R4,     R0                      ; 611B   02A0
        ADDR    R1,     R0                      ; 611C   00C8
        MVO@    R0,     R5                      ; 611D   0268
        MVI@    R4,     R0                      ; 611E   02A0
        MVO@    R0,     R5                      ; 611F   0268
        MVI@    R4,     R0                      ; 6120   02A0
        MVO@    R0,     R5                      ; 6121   0268
        MVI@    R4,     R0                      ; 6122   02A0
        MVO@    R0,     R5                      ; 6123   0268
        MVI@    R4,     R0                      ; 6124   02A0
        MVO@    R0,     R5                      ; 6125   0268
        MVI@    R4,     R0                      ; 6126   02A0
        MVO@    R0,     R5                      ; 6127   0268
        MVI@    R4,     R0                      ; 6128   02A0
        MVO@    R0,     R5                      ; 6129   0268
        MVI@    R4,     R0                      ; 612A   02A0
        MVO@    R0,     R5                      ; 612B   0268
        MVI@    R4,     R0                      ; 612C   02A0
        MVO@    R0,     R5                      ; 612D   0268
        MVI     .STIC.MODE,R0                   ; 612E   0280 0021
        MVI     G_0347, R0                      ; 6130   0280 0347
        CMPI    #$0001, R0                      ; 6132   0378 0001
        BEQ     L_6144                          ; 6134   0204 000E

        CMPI    #$0002, R0                      ; 6136   0378 0002
        BEQ     L_6144                          ; 6138   0204 000A

        CMPI    #$0008, R0                      ; 613A   0378 0008
        BEQ     L_6144                          ; 613C   0204 0006

        CMPI    #$000A, R0                      ; 613E   0378 000A
        BEQ     L_6144                          ; 6140   0204 0002

        MVO     R7,     .STIC.MODE              ; 6142   0247 0021
L_6144:
        MVII    #$0001, R1                      ; 6144   02B9 0001
        CMPI    #$0001, R0                      ; 6146   0378 0001
        BNEQ    L_614C                          ; 6148   020C 0002

        MVII    #$0003, R1                      ; 614A   02B9 0003
L_614C:
        MVO     R1,     .STIC.EDGE              ; 614C   0241 0032
        MVI     G_0105, R0                      ; 614E   0280 0105
        MVO     R0,     .STIC.HDLY              ; 6150   0240 0030
        MVI     G_0106, R0                      ; 6152   0280 0106
        MVO     R0,     .STIC.VDLY              ; 6154   0240 0031
        MVI     G_0104, R0                      ; 6156   0280 0104
        MVO     R0,     .STIC.BORD              ; 6158   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 615A   0240 0020
        MVII    #$0004, R2                      ; 615C   02BA 0004
        MVII    #$0330, R4                      ; 615E   02BC 0330
        MVI     G_0103, R0                      ; 6160   0280 0103
        SARC    R0,     1                       ; 6162   0078
        BNC     L_6167                          ; 6163   0209 0002

        MVII    #$0334, R4                      ; 6165   02BC 0334
L_6167:
        MVI@    R4,     R5                      ; 6167   02A5
        TSTR    R5                              ; 6168   00AD
        BEQ     L_617D                          ; 6169   0204 0012

        PSHR    R4                              ; 616B   0274
        SDBD                                    ; 616C   0001
        MVI@    R5,     R4                      ; 616D   02AC
        MVI@    R5,     R0                      ; 616E   02A8
        ANDI    #$0001, R0                      ; 616F   03B8 0001
        MVI@    R5,     R3                      ; 6171   02AB
        ANDI    #$00FF, R3                      ; 6172   03BB 00FF
        ADDI    #$0100, R3                      ; 6174   02FB 0100
        ADD@    R3,     R4                      ; 6176   02DC
        SDBD                                    ; 6177   0001
        MVI@    R5,     R1                      ; 6178   02A9

        JSR     R5,     L_6914                  ; 6179   0004 0168 0114

        PULR    R4                              ; 617C   02B4
L_617D:
        DECR    R2                              ; 617D   0012
        BNEQ    L_6167                          ; 617E   022C 0018

        MVI     G_0106, R0                      ; 6180   0280 0106
        CMPI    #$000F, R0                      ; 6182   0378 000F
        BNEQ    L_61A3                          ; 6184   020C 001D

        ANDI    #$0007, R0                      ; 6186   03B8 0007
        MVO     R0,     G_0106                  ; 6188   0240 0106
        MVII    #$0214, R4                      ; 618A   02BC 0214
        MVII    #$0200, R5                      ; 618C   02BD 0200
        MVII    #$000B, R2                      ; 618E   02BA 000B
L_6190:
        MVII    #$0014, R3                      ; 6190   02BB 0014
L_6192:
        MVI@    R4,     R0                      ; 6192   02A0
        MVO@    R0,     R5                      ; 6193   0268
        DECR    R3                              ; 6194   0013
        BNEQ    L_6192                          ; 6195   022C 0004

        DECR    R2                              ; 6197   0012
        BNEQ    L_6190                          ; 6198   022C 0009

        MVII    #$0014, R3                      ; 619A   02BB 0014
L_619C:
        MVO@    R2,     R5                      ; 619C   026A
        DECR    R3                              ; 619D   0013
        BNEQ    L_619C                          ; 619E   022C 0003

        JSR     R5,     L_6941                  ; 61A0   0004 0168 0141

L_61A3:
        MVI     G_0105, R0                      ; 61A3   0280 0105
        MVI     G_0143, R1                      ; 61A5   0281 0143
        MVO     R0,     G_0143                  ; 61A7   0240 0143
        CMPR    R0,     R1                      ; 61A9   0141
        BEQ     L_61B1                          ; 61AA   0204 0005

        MVI     G_0142, R1                      ; 61AC   0281 0142
        INCR    R1                              ; 61AE   0009
        MVO     R1,     G_0142                  ; 61AF   0241 0142
L_61B1:
        CMPI    #$0007, R0                      ; 61B1   0378 0007
        BLE     L_6238                          ; 61B3   0206 0083

        MOVR    R0,     R1                      ; 61B5   0081
        ANDI    #$0007, R0                      ; 61B6   03B8 0007
        MVO     R0,     G_0105                  ; 61B8   0240 0105
        CMPI    #$007F, R1                      ; 61BA   0379 007F
        BGT     L_620D                          ; 61BC   020E 004F

        MVII    #$0200, R4                      ; 61BE   02BC 0200
        MVII    #$0200, R5                      ; 61C0   02BD 0200
        MVII    #$000F, R2                      ; 61C2   02BA 000F
        MVII    #$0000, R0                      ; 61C4   02B8 0000
L_61C6:
        MVI@    R4,     R1                      ; 61C6   02A1
        MVO@    R0,     R5                      ; 61C7   0268
        MOVR    R1,     R0                      ; 61C8   0088
        MVI@    R4,     R1                      ; 61C9   02A1
        MVO@    R0,     R5                      ; 61CA   0268
        MOVR    R1,     R0                      ; 61CB   0088
        MVI@    R4,     R1                      ; 61CC   02A1
        MVO@    R0,     R5                      ; 61CD   0268
        MOVR    R1,     R0                      ; 61CE   0088
        MVI@    R4,     R1                      ; 61CF   02A1
        MVO@    R0,     R5                      ; 61D0   0268
        MOVR    R1,     R0                      ; 61D1   0088
        MVI@    R4,     R1                      ; 61D2   02A1
        MVO@    R0,     R5                      ; 61D3   0268
        MOVR    R1,     R0                      ; 61D4   0088
        MVI@    R4,     R1                      ; 61D5   02A1
        MVO@    R0,     R5                      ; 61D6   0268
        MOVR    R1,     R0                      ; 61D7   0088
        MVI@    R4,     R1                      ; 61D8   02A1
        MVO@    R0,     R5                      ; 61D9   0268
        MOVR    R1,     R0                      ; 61DA   0088
        MVI@    R4,     R1                      ; 61DB   02A1
        MVO@    R0,     R5                      ; 61DC   0268
        MOVR    R1,     R0                      ; 61DD   0088
        MVI@    R4,     R1                      ; 61DE   02A1
        MVO@    R0,     R5                      ; 61DF   0268
        MOVR    R1,     R0                      ; 61E0   0088
        MVI@    R4,     R1                      ; 61E1   02A1
        MVO@    R0,     R5                      ; 61E2   0268
        MOVR    R1,     R0                      ; 61E3   0088
        MVI@    R4,     R1                      ; 61E4   02A1
        MVO@    R0,     R5                      ; 61E5   0268
        MOVR    R1,     R0                      ; 61E6   0088
        MVI@    R4,     R1                      ; 61E7   02A1
        MVO@    R0,     R5                      ; 61E8   0268
        MOVR    R1,     R0                      ; 61E9   0088
        MVI@    R4,     R1                      ; 61EA   02A1
        MVO@    R0,     R5                      ; 61EB   0268
        MOVR    R1,     R0                      ; 61EC   0088
        MVI@    R4,     R1                      ; 61ED   02A1
        MVO@    R0,     R5                      ; 61EE   0268
        MOVR    R1,     R0                      ; 61EF   0088
        MVI@    R4,     R1                      ; 61F0   02A1
        MVO@    R0,     R5                      ; 61F1   0268
        MOVR    R1,     R0                      ; 61F2   0088
        MVI@    R4,     R1                      ; 61F3   02A1
        MVO@    R0,     R5                      ; 61F4   0268
        MOVR    R1,     R0                      ; 61F5   0088
        DECR    R2                              ; 61F6   0012
        BNEQ    L_61C6                          ; 61F7   022C 0032

        MVII    #$0213, R3                      ; 61F9   02BB 0213
        MVI     G_0135, R0                      ; 61FB   0280 0135
        SUBR    R0,     R3                      ; 61FD   0103
        MVII    #$0200, R1                      ; 61FE   02B9 0200
        MVII    #$000C, R2                      ; 6200   02BA 000C
L_6202:
        MVI@    R3,     R0                      ; 6202   0298
        MVO@    R0,     R1                      ; 6203   0248
        ADDI    #$0014, R3                      ; 6204   02FB 0014
        ADDI    #$0014, R1                      ; 6206   02F9 0014
        DECR    R2                              ; 6208   0012
        BNEQ    L_6202                          ; 6209   022C 0008
        B       L_6238                          ; 620B   0200 002B

L_620D:
        MVII    #$0200, R4                      ; 620D   02BC 0200
        MVII    #$0201, R5                      ; 620F   02BD 0201
        MVII    #$001E, R2                      ; 6211   02BA 001E
L_6213:
        MVI@    R5,     R0                      ; 6213   02A8
        MVO@    R0,     R4                      ; 6214   0260
        MVI@    R5,     R0                      ; 6215   02A8
        MVO@    R0,     R4                      ; 6216   0260
        MVI@    R5,     R0                      ; 6217   02A8
        MVO@    R0,     R4                      ; 6218   0260
        MVI@    R5,     R0                      ; 6219   02A8
        MVO@    R0,     R4                      ; 621A   0260
        MVI@    R5,     R0                      ; 621B   02A8
        MVO@    R0,     R4                      ; 621C   0260
        MVI@    R5,     R0                      ; 621D   02A8
        MVO@    R0,     R4                      ; 621E   0260
        MVI@    R5,     R0                      ; 621F   02A8
        MVO@    R0,     R4                      ; 6220   0260
        MVI@    R5,     R0                      ; 6221   02A8
        MVO@    R0,     R4                      ; 6222   0260
        DECR    R2                              ; 6223   0012
        BNEQ    L_6213                          ; 6224   022C 0012

        MVII    #$0200, R3                      ; 6226   02BB 0200
        MVI     G_0135, R0                      ; 6228   0280 0135
        ADDR    R0,     R3                      ; 622A   00C3
        MVII    #$0213, R1                      ; 622B   02B9 0213
        MVII    #$000C, R2                      ; 622D   02BA 000C
L_622F:
        MVI@    R3,     R0                      ; 622F   0298
        MVO@    R0,     R1                      ; 6230   0248
        ADDI    #$0014, R3                      ; 6231   02FB 0014
        ADDI    #$0014, R1                      ; 6233   02F9 0014
        DECR    R2                              ; 6235   0012
        BNEQ    L_622F                          ; 6236   022C 0008

L_6238:
        MVI     .PSG0.lft_hand,R0               ; 6238   0280 01FF
        AND     .PSG0.rgt_hand,R0               ; 623A   0380 01FE
        MVI     G_0347, R1                      ; 623C   0281 0347
        CMPI    #$0006, R1                      ; 623E   0379 0006
        BEQ     L_6248                          ; 6240   0204 0006

        CMP     G_0119, R0                      ; 6242   0340 0119
        MVO     R0,     G_0119                  ; 6244   0240 0119
        BNEQ    L_624A                          ; 6246   020C 0002

L_6248:
        MVO     R0,     G_010E                  ; 6248   0240 010E

L_624A:
        JSR     R5,     L_6A56                  ; 624A   0004 0168 0256
L_624D:
        JSR     R5,     L_6E96                  ; 624D   0004 016C 0296

        PULR    R7                              ; 6250   02B7

L_6251:
        PSHR    R5                              ; 6251   0275
        MVI     G_0134, R1                      ; 6252   0281 0134
        ANDI    #$0001, R1                      ; 6254   03B9 0001
        BEQ     L_625F                          ; 6256   0204 0007

        CMPI    #$000A, R0                      ; 6258   0378 000A
        BNEQ    L_6279                          ; 625A   020C 001D
        J       L_6C18                          ; 625C   0004 036C 0018

L_625F:
        JSR     R5,     L_5EA0                  ; 625F   0004 015C 02A0

        MVI     G_0146, R0                      ; 6262   0280 0146
        INCR    R0                              ; 6264   0008
        MVO     R0,     G_0146                  ; 6265   0240 0146
        BC      L_626D                          ; 6267   0201 0004

        CMPI    #$0003, R0                      ; 6269   0378 0003
        BGE     L_6279                          ; 626B   020D 000C

L_626D:
        MVII    #$0004, R0                      ; 626D   02B8 0004
        DECLE   $0240,  $0347,  $02B8,  $00AF   ; 626F   0240 0347 02B8 00AF
        DECLE   $0240,  $0346,  $0004           ; 6273   0240 0346 0004

        ANDR    R5,     R4                      ; 6276   01AC
        CMP@    R6,     R1                      ; 6277   0371
        PULR    R7                              ; 6278   02B7

L_6279:
        CLRR    R0                              ; 6279   01C0
        MVO     R0,     G_0146                  ; 627A   0240 0146
        MVI     G_0147, R0                      ; 627C   0280 0147
        INCR    R0                              ; 627E   0008
        MVO     R0,     G_0147                  ; 627F   0240 0147
        MVI     G_0134, R1                      ; 6281   0281 0134
        SLR     R1,     1                       ; 6283   0061
        ANDI    #$0003, R1                      ; 6284   03B9 0003
        CMPR    R1,     R0                      ; 6286   0148
        BGT     L_6299                          ; 6287   020E 0010

        MVI     G_012A, R1                      ; 6289   0281 012A
        MVII    #$0001, R2                      ; 628B   02BA 0001
        INCR    R0                              ; 628D   0008
L_628E:
        DECR    R0                              ; 628E   0010
        BEQ     L_6294                          ; 628F   0204 0003

        ADDR    R2,     R2                      ; 6291   00D2
        B       L_628E                          ; 6292   0220 0005

L_6294:
        ANDR    R2,     R1                      ; 6294   0191
        BNEQ    L_6279                          ; 6295   022C 001D
        B       L_626D                          ; 6297   0220 002B

L_6299:
        CLRR    R0                              ; 6299   01C0
        MVO     R0,     G_0146                  ; 629A   0240 0146
        MVO     R0,     G_0147                  ; 629C   0240 0147
        MVI     G_0134, R1                      ; 629E   0281 0134
        ANDI    #$0001, R1                      ; 62A0   03B9 0001
        BNEQ    L_626D                          ; 62A2   022C 0036

        JSR     R5,     L_62B2                  ; 62A4   0004 0160 02B2

        SDBD                                    ; 62A7   0001
        MVII    #$AF58, R0                      ; 62A8   02B8 0058 00AF
        MVO     R0,     G_0343                  ; 62AB   0240 0343
        MVII    #$0008, R0                      ; 62AD   02B8 0008
        MVO     R0,     G_0347                  ; 62AF   0240 0347
        PULR    R7                              ; 62B1   02B7

L_62B2:
        PSHR    R5                              ; 62B2   0275

        JSR     R5,     L_68B7                  ; 62B3   0004 0168 00B7
        JSR     R5,     L_68C7                  ; 62B6   0004 0168 00C7
        JSR     R5,     L_6364                  ; 62B9   0004 0160 0364

        MVII    #$0005, R3                      ; 62BC   02BB 0005
        MVII    #$0229, R4                      ; 62BE   02BC 0229

        JSR     R5,     X_PRINT_R5              ; 62C0   0004 0118 007B
        STRING  "#       Pts  Total"            ; 62C3  
        DECLE   $0000                           ; 62D5   0000

        MVII    #$022B, R4                      ; 62D6   02BC 022B

        JSR     R5,     L_5E5A                  ; 62D8   0004 015C 025A

        CLRR    R0                              ; 62DB   01C0
        MVII    #$0251, R4                      ; 62DC   02BC 0251
L_62DE:
        PSHR    R4                              ; 62DE   0274
        MVO     R0,     G_0147                  ; 62DF   0240 0147
        INCR    R0                              ; 62E1   0008
        MVII    #$0001, R1                      ; 62E2   02B9 0001

        JSR     R5,     L_5D91                  ; 62E4   0004 015C 0191
        JSR     R5,     X_PRNUM_RGT             ; 62E7   0004 0118 00C5

        ADDI    #$0002, R4                      ; 62EA   02FC 0002

        JSR     R5,     L_5D29                  ; 62EC   0004 015C 0129
        JSR     R5,     L_6D80                  ; 62EF   0004 016C 0180

        MVII    #$0004, R1                      ; 62F2   02B9 0004

        JSR     R5,     L_5D91                  ; 62F4   0004 015C 0191

        PULR    R4                              ; 62F7   02B4
        PSHR    R4                              ; 62F8   0274
        ADDI    #$0008, R4                      ; 62F9   02FC 0008
        MVII    #$01B0, R2                      ; 62FB   02BA 01B0
        ADD     G_0149, R2                      ; 62FD   02C2 0149

        JSR     R5,     L_6334                  ; 62FF   0004 0160 0334

        AND@    R2,     R5                      ; 6302   0395
        BEQ     L_6306                          ; 6303   0204 0001

        CLRR    R0                              ; 6305   01C0
L_6306:
        PSHR    R0                              ; 6306   0270

        JSR     R5,     X_PRNUM_RGT             ; 6307   0004 0118 00C5

        PULR    R0                              ; 630A   02B0
        MVII    #$034E, R2                      ; 630B   02BA 034E
        ADD     G_0147, R2                      ; 630D   02C2 0147
        MVI     G_0347, R5                      ; 630F   0285 0347
        CMPI    #$000A, R5                      ; 6311   037D 000A
        BEQ     L_6317                          ; 6313   0204 0002

        ADD@    R2,     R0                      ; 6315   02D0
        MVO@    R0,     R2                      ; 6316   0250
L_6317:
        MVI@    R2,     R0                      ; 6317   0290
        ADDI    #$0006, R4                      ; 6318   02FC 0006

        JSR     R5,     L_6340                  ; 631A   0004 0160 0340

        PULR    R4                              ; 631D   02B4
        ADDI    #$0014, R4                      ; 631E   02FC 0014
        MVI     G_0147, R0                      ; 6320   0280 0147
        INCR    R0                              ; 6322   0008
        MVI     G_0134, R1                      ; 6323   0281 0134
        SLR     R1,     1                       ; 6325   0061
        ANDI    #$0003, R1                      ; 6326   03B9 0003
        CMPR    R1,     R0                      ; 6328   0148
        BLE     L_62DE                          ; 6329   0226 004C

        MVI     G_0149, R0                      ; 632B   0280 0149
        INCR    R0                              ; 632D   0008
        MVO     R0,     G_0149                  ; 632E   0240 0149
        CLRR    R0                              ; 6330   01C0
        MVO     R0,     G_0147                  ; 6331   0240 0147
        PULR    R7                              ; 6333   02B7

L_6334:
        PSHR    R5                              ; 6334   0275

        JSR     R5,     L_633C                  ; 6335   0004 0160 033C
        DECLE   $0001,  $0002,  $0004           ; 6338   0001 0002 0004

        INCR    R0                              ; 633B   0008
L_633C:
        ADD     G_0147, R5                      ; 633C   02C5 0147
        MVI@    R5,     R5                      ; 633E   02AD
        PULR    R7                              ; 633F   02B7

L_6340:
        PSHR    R5                              ; 6340   0275
        MOVR    R0,     R2                      ; 6341   0082
        SDBD                                    ; 6342   0001
        MVII    #$2710, R5                      ; 6343   02BD 0010 0027
        CLRR    R0                              ; 6346   01C0
L_6347:
        INCR    R0                              ; 6347   0008
        SUBR    R5,     R2                      ; 6348   012A
        BPL     L_6347                          ; 6349   0223 0003

        ADDR    R5,     R2                      ; 634B   00EA
        DECR    R0                              ; 634C   0010
        BEQ     L_635C                          ; 634D   0204 000D

        MVII    #$0001, R1                      ; 634F   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6351   0004 0118 00C5

        INCR    R4                              ; 6354   000C
        MOVR    R2,     R0                      ; 6355   0090
        MVII    #$0004, R1                      ; 6356   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 6358   0004 0118 00AD

        PULR    R7                              ; 635B   02B7

L_635C:
        INCR    R4                              ; 635C   000C
        MOVR    R2,     R0                      ; 635D   0090
        MVII    #$0004, R1                      ; 635E   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 6360   0004 0118 00C5

        PULR    R7                              ; 6363   02B7

L_6364:
        PSHR    R5                              ; 6364   0275
        MVII    #$0007, R3                      ; 6365   02BB 0007
        MVII    #$0201, R4                      ; 6367   02BC 0201
        SDBD                                    ; 6369   0001
        MVII    #$A935, R5                      ; 636A   02BD 0035 00A9
        ADD     G_0149, R5                      ; 636D   02C5 0149
        MVI@    R5,     R1                      ; 636F   02A9
        SDBD                                    ; 6370   0001
        ADDI    #$A89E, R1                      ; 6371   02F9 009E 00A8

        JSR     R5,     X_PRINT_R1              ; 6374   0004 0118 0067

        MVII    #$00D7, R0                      ; 6377   02B8 00D7
        MVO@    R0,     R4                      ; 6379   0260
        PULR    R7                              ; 637A   02B7

L_637B:
        PSHR    R5                              ; 637B   0275
        MVII    #$0318, R4                      ; 637C   02BC 0318
        SDBD                                    ; 637E   0001
        MVII    #$FDFF, R0                      ; 637F   02B8 00FF 00FD
        MVII    #$0008, R1                      ; 6382   02B9 0008
L_6384:
        MVI@    R4,     R2                      ; 6384   02A2
        ANDR    R0,     R2                      ; 6385   0182
        DECR    R4                              ; 6386   0014
        MVO@    R2,     R4                      ; 6387   0262
        DECR    R1                              ; 6388   0011
        BNEQ    L_6384                          ; 6389   022C 0006
        PULR    R7                              ; 638B   02B7

L_638C:
        PSHR    R5                              ; 638C   0275
        MVI     G_0149, R0                      ; 638D   0280 0149
        CMPI    #$0006, R0                      ; 638F   0378 0006
        BNEQ    L_63A1                          ; 6391   020C 000E

        MVI     G_0346, R0                      ; 6393   0280 0346
        ANDI    #$0007, R0                      ; 6395   03B8 0007
        BNEQ    L_63A1                          ; 6397   020C 0008

        MVI     G_011F, R0                      ; 6399   0280 011F
        ADDI    #$0008, R0                      ; 639B   02F8 0008
        ANDI    #$001F, R0                      ; 639D   03B8 001F
        MVO     R0,     G_011F                  ; 639F   0240 011F
L_63A1:
        PULR    R7                              ; 63A1   02B7

L_63A2:
        PSHR    R5                              ; 63A2   0275
        MVII    #$0318, R3                      ; 63A3   02BB 0318
        ADD     G_014A, R3                      ; 63A5   02C3 014A
        MVI@    R3,     R0                      ; 63A7   0298
        MOVR    R0,     R1                      ; 63A8   0081
        ANDI    #$00FF, R0                      ; 63A9   03B8 00FF
        SWAP    R0,     1                       ; 63AB   0040
        ADD     G_0128, R0                      ; 63AC   02C0 0128
        ADD     G_033D, R0                      ; 63AE   02C0 033D
        MVO     R0,     G_0128                  ; 63B0   0240 0128
        SWAP    R0,     1                       ; 63B2   0040
        ANDI    #$00FF, R0                      ; 63B3   03B8 00FF
        SDBD                                    ; 63B5   0001
        ANDI    #$FF00, R1                      ; 63B6   03B9 0000 00FF
        ADDR    R1,     R0                      ; 63B9   00C8
        MVO@    R0,     R3                      ; 63BA   0258
        ADDI    #$0008, R3                      ; 63BB   02FB 0008
        MVI@    R3,     R0                      ; 63BD   0298
        MOVR    R0,     R1                      ; 63BE   0081
        ANDI    #$00FF, R0                      ; 63BF   03B8 00FF
        SWAP    R0,     1                       ; 63C1   0040
        ADD     G_0129, R0                      ; 63C2   02C0 0129
        ADD     G_033E, R0                      ; 63C4   02C0 033E
        MVO     R0,     G_0129                  ; 63C6   0240 0129
        SWAP    R0,     1                       ; 63C8   0040
        ANDI    #$00FF, R0                      ; 63C9   03B8 00FF
        SDBD                                    ; 63CB   0001
        ANDI    #$FF00, R1                      ; 63CC   03B9 0000 00FF
        ADDR    R1,     R0                      ; 63CF   00C8
        MVO@    R0,     R3                      ; 63D0   0258
        MVI     G_033E, R1                      ; 63D1   0281 033E
        ADD     G_014B, R1                      ; 63D3   02C1 014B
        MVO     R1,     G_033E                  ; 63D5   0241 033E
        ANDI    #$007F, R0                      ; 63D7   03B8 007F
        PULR    R7                              ; 63D9   02B7

L_63DA:
        PSHR    R5                              ; 63DA   0275
        MVI     G_014C, R0                      ; 63DB   0280 014C
        ANDI    #$0002, R0                      ; 63DD   03B8 0002
        BNEQ    L_6433                          ; 63DF   020C 0052

        MVI     G_011C, R0                      ; 63E1   0280 011C
        MVO     R0,     G_011F                  ; 63E3   0240 011F
        MVII    #$0002, R0                      ; 63E5   02B8 0002
        MVO     R0,     G_0125                  ; 63E7   0240 0125
        MVII    #$0004, R0                      ; 63E9   02B8 0004
        MVO     R0,     G_0126                  ; 63EB   0240 0126
        SDBD                                    ; 63ED   0001
        MVII    #$A554, R2                      ; 63EE   02BA 0054 00A5

        JSR     R5,     L_64E8                  ; 63F1   0004 0164 00E8

        MVI     G_011C, R0                      ; 63F4   0280 011C
        CMPI    #$0080, R0                      ; 63F6   0378 0080
        BLT     L_6433                          ; 63F8   0205 0039

        MVI     G_0346, R1                      ; 63FA   0281 0346
        ANDI    #$0007, R1                      ; 63FC   03B9 0007
        BNEQ    L_6433                          ; 63FE   020C 0033

        ADDI    #$0010, R0                      ; 6400   02F8 0010
        MVO     R0,     G_011C                  ; 6402   0240 011C
        CMPI    #$00F0, R0                      ; 6404   0378 00F0
        BNEQ    L_6433                          ; 6406   020C 002B

        MVI     G_033C, R0                      ; 6408   0280 033C
        MVI     G_034A, R1                      ; 640A   0281 034A
        ADD     G_012E, R1                      ; 640C   02C1 012E
        DECR    R1                              ; 640E   0011
        SUBR    R1,     R0                      ; 640F   0108
        BPL     L_641B                          ; 6410   0203 0009

        NEGR    R0                              ; 6412   0020
        MVI     G_014C, R0                      ; 6413   0280 014C
        ANDI    #$00FE, R0                      ; 6415   03B8 00FE
        ADDI    #$0001, R0                      ; 6417   02F8 0001
        MVO     R0,     G_014C                  ; 6419   0240 014C
L_641B:
        SLR     R0,     1                       ; 641B   0060
        MVII    #$0064, R2                      ; 641C   02BA 0064
        MVII    #$0000, R3                      ; 641E   02BB 0000
L_6420:
        TSTR    R0                              ; 6420   0080
        BEQ     L_642A                          ; 6421   0204 0007

        INCR    R3                              ; 6423   000B
        SUBR    R3,     R2                      ; 6424   011A
        BMI     L_642A                          ; 6425   020B 0003

        DECR    R0                              ; 6427   0010
        B       L_6420                          ; 6428   0220 0009

L_642A:
        MVI     G_034D, R0                      ; 642A   0280 034D
        ADDR    R2,     R0                      ; 642C   00D0
        MOVR    R0,     R1                      ; 642D   0081
        SLR     R1,     2                       ; 642E   0065
        SLR     R1,     1                       ; 642F   0061
        NEGR    R0                              ; 6430   0020
        MVO     R0,     G_033E                  ; 6431   0240 033E
L_6433:
        PULR    R7                              ; 6433   02B7

        DECLE   $0000                           ; 6434   0000

        EIS                                     ; 6435   0002
        TSTR    R0                              ; 6436   0080
        EIS                                     ; 6437   0002
L_6438:
        PSHR    R5                              ; 6438   0275
        MVI     G_011C, R0                      ; 6439   0280 011C
        MVO     R0,     G_011F                  ; 643B   0240 011F
        MVO     R0,     G_0120                  ; 643D   0240 0120
        CMPI    #$00A0, R0                      ; 643F   0378 00A0
        BNEQ    L_6457                          ; 6441   020C 0014

        MVII    #$031D, R2                      ; 6443   02BA 031D
        MVI@    R2,     R0                      ; 6445   0290
        SDBD                                    ; 6446   0001
        ANDI    #$FBFF, R0                      ; 6447   03B8 00FF 00FB
        MVO@    R0,     R2                      ; 644A   0250
        ADDI    #$0008, R2                      ; 644B   02FA 0008
        MVI@    R2,     R0                      ; 644D   0290
        SDBD                                    ; 644E   0001
        ANDI    #$FDFF, R0                      ; 644F   03B8 00FF 00FD
        ADDI    #$0200, R0                      ; 6452   02F8 0200
        MVO@    R0,     R2                      ; 6454   0250
        B       L_646F                          ; 6455   0200 0018

L_6457:
        CMPI    #$00A0, R0                      ; 6457   0378 00A0
        BGT     L_646F                          ; 6459   020E 0014

        MVII    #$031D, R2                      ; 645B   02BA 031D
        MVI@    R2,     R0                      ; 645D   0290
        SDBD                                    ; 645E   0001
        ANDI    #$FBFF, R0                      ; 645F   03B8 00FF 00FB
        SDBD                                    ; 6462   0001
        ADDI    #$0400, R0                      ; 6463   02F8 0000 0004
        MVO@    R0,     R2                      ; 6466   0250
        ADDI    #$0008, R2                      ; 6467   02FA 0008
        MVI@    R2,     R0                      ; 6469   0290
        SDBD                                    ; 646A   0001
        ANDI    #$FDFF, R0                      ; 646B   03B8 00FF 00FD
        MVO@    R0,     R2                      ; 646E   0250
L_646F:
        MVII    #$0020, R0                      ; 646F   02B8 0020
        MVO     R0,     G_0125                  ; 6471   0240 0125
        MVII    #$0004, R0                      ; 6473   02B8 0004
        MVO     R0,     G_0126                  ; 6475   0240 0126
        SDBD                                    ; 6477   0001
        MVII    #$A574, R2                      ; 6478   02BA 0074 00A5

        JSR     R5,     L_64DA                  ; 647B   0004 0164 00DA

        MVII    #$0004, R0                      ; 647E   02B8 0004
        MVO     R0,     G_0125                  ; 6480   0240 0125
        MVII    #$0005, R0                      ; 6482   02B8 0005
        MVO     R0,     G_0126                  ; 6484   0240 0126
        SDBD                                    ; 6486   0001
        MVII    #$A594, R2                      ; 6487   02BA 0094 00A5

        JSR     R5,     L_64DA                  ; 648A   0004 0164 00DA

        MVI     G_031C, R0                      ; 648D   0280 031C
        MVI     G_011F, R1                      ; 648F   0281 011F
        SDBD                                    ; 6491   0001
        ANDI    #$FDFF, R0                      ; 6492   03B8 00FF 00FD
        ADDI    #$0200, R0                      ; 6495   02F8 0200
        CMPI    #$00A0, R1                      ; 6497   0379 00A0
        BLT     L_649F                          ; 6499   0205 0004

        SDBD                                    ; 649B   0001
        ANDI    #$FDFF, R0                      ; 649C   03B8 00FF 00FD
L_649F:
        MVO     R0,     G_031C                  ; 649F   0240 031C
        PULR    R7                              ; 64A1   02B7

L_64A2:
        PSHR    R5                              ; 64A2   0275
        MVI     G_0346, R0                      ; 64A3   0280 0346
        ANDI    #$0007, R0                      ; 64A5   03B8 0007
        BNEQ    L_64D9                          ; 64A7   020C 0030

        MVI     G_011F, R0                      ; 64A9   0280 011F
        CMPI    #$0070, R0                      ; 64AB   0378 0070
        BEQ     L_64D9                          ; 64AD   0204 002A

        SUBI    #$0010, R0                      ; 64AF   0338 0010
        MVO     R0,     G_011F                  ; 64B1   0240 011F
        MVO     R0,     G_0120                  ; 64B3   0240 0120
        CMPI    #$0070, R0                      ; 64B5   0378 0070
        BNEQ    L_64BF                          ; 64B7   020C 0006

        MVI     G_0340, R1                      ; 64B9   0281 0340
        ADDI    #$0005, R1                      ; 64BB   02F9 0005
        MVO     R1,     G_0340                  ; 64BD   0241 0340
L_64BF:
        CMPI    #$00A0, R0                      ; 64BF   0378 00A0
        BGE     L_64D7                          ; 64C1   020D 0014

        MVII    #$031D, R2                      ; 64C3   02BA 031D
        MVI@    R2,     R0                      ; 64C5   0290
        SDBD                                    ; 64C6   0001
        ANDI    #$FBFF, R0                      ; 64C7   03B8 00FF 00FB
        SDBD                                    ; 64CA   0001
        ADDI    #$0400, R0                      ; 64CB   02F8 0000 0004
        MVO@    R0,     R2                      ; 64CE   0250
        ADDI    #$0008, R2                      ; 64CF   02FA 0008
        MVI@    R2,     R0                      ; 64D1   0290
        SDBD                                    ; 64D2   0001
        ANDI    #$FDFF, R0                      ; 64D3   03B8 00FF 00FD
        MVO@    R0,     R2                      ; 64D6   0250
L_64D7:
        B       L_646F                          ; 64D7   0220 0069
L_64D9:
        PULR    R7                              ; 64D9   02B7

L_64DA:
        PSHR    R5                              ; 64DA   0275
        MVI     G_011F, R1                      ; 64DB   0281 011F
        B       L_64EB                          ; 64DD   0200 000C

L_64DF:
        PSHR    R5                              ; 64DF   0275
        MVI     G_011C, R1                      ; 64E0   0281 011C
        ADDI    #$0020, R1                      ; 64E2   02F9 0020
        ANDI    #$00FF, R1                      ; 64E4   03B9 00FF
        B       L_64EB                          ; 64E6   0200 0003

L_64E8:
        PSHR    R5                              ; 64E8   0275
        MVI     G_011C, R1                      ; 64E9   0281 011C
L_64EB:
        SLR     R1,     2                       ; 64EB   0065
        SLR     R1,     1                       ; 64EC   0061
        ADDR    R1,     R2                      ; 64ED   00CA

        JSR     R5,     L_651C                  ; 64EE   0004 0164 011C

        MVII    #$0318, R3                      ; 64F1   02BB 0318
        ADD     G_0125, R3                      ; 64F3   02C3 0125
        MVI@    R3,     R1                      ; 64F5   0299
        ANDI    #$00FF, R1                      ; 64F6   03B9 00FF
        ADDR    R0,     R1                      ; 64F8   00C1
        SUB     G_0125, R3                      ; 64F9   0303 0125
        ADD     G_0126, R3                      ; 64FB   02C3 0126
        MVI@    R3,     R0                      ; 64FD   0298
        SDBD                                    ; 64FE   0001
        ANDI    #$FF00, R0                      ; 64FF   03B8 0000 00FF
        ADDR    R1,     R0                      ; 6502   00C8
        MVO@    R0,     R3                      ; 6503   0258
        INCR    R2                              ; 6504   000A

        JSR     R5,     L_651C                  ; 6505   0004 0164 011C

        MVII    #$0320, R3                      ; 6508   02BB 0320
        ADD     G_0125, R3                      ; 650A   02C3 0125
        MVI@    R3,     R1                      ; 650C   0299
        ANDI    #$007F, R1                      ; 650D   03B9 007F
        ADDR    R0,     R1                      ; 650F   00C1
        SUB     G_0125, R3                      ; 6510   0303 0125
        ADD     G_0126, R3                      ; 6512   02C3 0126
        MVI@    R3,     R0                      ; 6514   0298
        SDBD                                    ; 6515   0001
        ANDI    #$FF80, R0                      ; 6516   03B8 0080 00FF
        ADDR    R1,     R0                      ; 6519   00C8
        MVO@    R0,     R3                      ; 651A   0258
        PULR    R7                              ; 651B   02B7

L_651C:
        PSHR    R5                              ; 651C   0275
        MVI@    R2,     R0                      ; 651D   0290
        MOVR    R0,     R1                      ; 651E   0081
        ANDI    #$007F, R0                      ; 651F   03B8 007F
        ANDI    #$0080, R1                      ; 6521   03B9 0080
        BEQ     L_6526                          ; 6523   0204 0001

        NEGR    R0                              ; 6525   0020
L_6526:
        PULR    R7                              ; 6526   02B7

L_6527:
        PSHR    R5                              ; 6527   0275
        MVII    #$0020, R0                      ; 6528   02B8 0020
        MVO     R0,     G_0125                  ; 652A   0240 0125
        MVII    #$0002, R0                      ; 652C   02B8 0002
        MVO     R0,     G_0126                  ; 652E   0240 0126
        SDBD                                    ; 6530   0001
        MVII    #$A5C4, R2                      ; 6531   02BA 00C4 00A5

        JSR     R5,     L_64E8                  ; 6534   0004 0164 00E8

        MVII    #$0020, R0                      ; 6537   02B8 0020
        MVO     R0,     G_0125                  ; 6539   0240 0125
        MVII    #$0003, R0                      ; 653B   02B8 0003
        MVO     R0,     G_0126                  ; 653D   0240 0126
        SDBD                                    ; 653F   0001
        MVII    #$A5E4, R2                      ; 6540   02BA 00E4 00A5

        JSR     R5,     L_64E8                  ; 6543   0004 0164 00E8

        MVII    #$0020, R0                      ; 6546   02B8 0020
        MVO     R0,     G_0125                  ; 6548   0240 0125
        MVII    #$0001, R0                      ; 654A   02B8 0001
        MVO     R0,     G_0126                  ; 654C   0240 0126
        SDBD                                    ; 654E   0001
        MVII    #$A604, R2                      ; 654F   02BA 0004 00A6

        JSR     R5,     L_64E8                  ; 6552   0004 0164 00E8

        PULR    R7                              ; 6555   02B7

L_6556:
        PSHR    R5                              ; 6556   0275
        MVI     G_033E, R1                      ; 6557   0281 033E
        TSTR    R1                              ; 6559   0089
        BMI     L_6564                          ; 655A   020B 0008

        MVI     G_0321, R2                      ; 655C   0282 0321
        ANDI    #$007F, R2                      ; 655E   03BA 007F
        CMPI    #$0054, R2                      ; 6560   037A 0054
        BGE     L_6593                          ; 6562   020D 002F

L_6564:
        MVII    #$0020, R0                      ; 6564   02B8 0020
        SDBD                                    ; 6566   0001
        CMPI    #$FF8D, R1                      ; 6567   0379 008D 00FF
        BLT     L_659B                          ; 656A   0205 002F

        MVII    #$0030, R0                      ; 656C   02B8 0030
        SDBD                                    ; 656E   0001
        CMPI    #$FFB5, R1                      ; 656F   0379 00B5 00FF
        BLT     L_659B                          ; 6572   0205 0027

        MVII    #$0040, R0                      ; 6574   02B8 0040
        SDBD                                    ; 6576   0001
        CMPI    #$FFDD, R1                      ; 6577   0379 00DD 00FF
        BLT     L_659B                          ; 657A   0205 001F

        MVII    #$0050, R0                      ; 657C   02B8 0050
        TSTR    R1                              ; 657E   0089
        BLT     L_659B                          ; 657F   0205 001A

        MVII    #$0060, R0                      ; 6581   02B8 0060
        CMPI    #$0023, R1                      ; 6583   0379 0023
        BLT     L_659B                          ; 6585   0205 0014

        MVII    #$0070, R0                      ; 6587   02B8 0070
        CMPI    #$004B, R1                      ; 6589   0379 004B
        BLT     L_659B                          ; 658B   0205 000E

        MVII    #$0080, R0                      ; 658D   02B8 0080
        CMPI    #$0078, R1                      ; 658F   0379 0078
        BLT     L_659B                          ; 6591   0205 0008

L_6593:
        MVII    #$00A0, R0                      ; 6593   02B8 00A0
        CMPI    #$0057, R2                      ; 6595   037A 0057
        BGT     L_659B                          ; 6597   020E 0002

        MVII    #$0090, R0                      ; 6599   02B8 0090
L_659B:
        MVI     G_011C, R1                      ; 659B   0281 011C
        CMPR    R1,     R0                      ; 659D   0148
        BLT     L_65A7                          ; 659E   0205 0007

        MVO     R0,     G_011C                  ; 65A0   0240 011C
        MVO     R0,     G_011D                  ; 65A2   0240 011D
        SLR     R0,     1                       ; 65A4   0060
        MVO     R0,     G_011E                  ; 65A5   0240 011E
L_65A7:
        MVII    #$0001, R0                      ; 65A7   02B8 0001
        MVO     R0,     G_0125                  ; 65A9   0240 0125
        MVII    #$0002, R0                      ; 65AB   02B8 0002
        MVO     R0,     G_0126                  ; 65AD   0240 0126
        SDBD                                    ; 65AF   0001
        MVII    #$A624, R2                      ; 65B0   02BA 0024 00A6

        JSR     R5,     L_64E8                  ; 65B3   0004 0164 00E8

        MVII    #$0001, R0                      ; 65B6   02B8 0001
        MVO     R0,     G_0125                  ; 65B8   0240 0125
        MVII    #$0003, R0                      ; 65BA   02B8 0003
        MVO     R0,     G_0126                  ; 65BC   0240 0126
        SDBD                                    ; 65BE   0001
        MVII    #$A63A, R2                      ; 65BF   02BA 003A 00A6

        JSR     R5,     L_64E8                  ; 65C2   0004 0164 00E8
        JSR     R5,     L_63A2                  ; 65C5   0004 0160 03A2

        PULR    R7                              ; 65C8   02B7

L_65C9:
        PSHR    R5                              ; 65C9   0275
        MVII    #$0001, R0                      ; 65CA   02B8 0001
        MVO     R0,     G_0125                  ; 65CC   0240 0125
        MVII    #$0002, R0                      ; 65CE   02B8 0002
        MVO     R0,     G_0126                  ; 65D0   0240 0126
        SDBD                                    ; 65D2   0001
        MVII    #$A650, R2                      ; 65D3   02BA 0050 00A6

        JSR     R5,     L_64DF                  ; 65D6   0004 0164 00DF

        MVII    #$0001, R0                      ; 65D9   02B8 0001
        MVO     R0,     G_0125                  ; 65DB   0240 0125
        MVII    #$0003, R0                      ; 65DD   02B8 0003
        MVO     R0,     G_0126                  ; 65DF   0240 0126
        SDBD                                    ; 65E1   0001
        MVII    #$A65C, R2                      ; 65E2   02BA 005C 00A6

        JSR     R5,     L_64DF                  ; 65E5   0004 0164 00DF

        PULR    R7                              ; 65E8   02B7

        PSHR    R5                              ; 65E9   0275

        JSR     R5,     L_638C                  ; 65EA   0004 0160 038C
        JSR     R5,     L_63A2                  ; 65ED   0004 0160 03A2

        CMPI    #$005D, R0                      ; 65F0   0378 005D
        BLE     L_660D                          ; 65F2   0206 0019

        MVII    #$0007, R0                      ; 65F4   02B8 0007
        MVO     R0,     G_0347                  ; 65F6   0240 0347
        MVI     G_031C, R0                      ; 65F8   0280 031C
        ANDI    #$00FF, R0                      ; 65FA   03B8 00FF
        SUBI    #$0016, R0                      ; 65FC   0338 0016
        SLL     R0,     2                       ; 65FE   004C
        SLL     R0,     1                       ; 65FF   0048
        MVO     R1,     G_0128                  ; 6600   0241 0128
        SLL     R1,     2                       ; 6602   004D
        SLL     R1,     1                       ; 6603   0049
        SWAP    R1,     1                       ; 6604   0041
        ANDI    #$0007, R1                      ; 6605   03B9 0007
        ADDR    R1,     R0                      ; 6607   00C8
        MVO     R0,     G_033F                  ; 6608   0240 033F

        JSR     R5,     L_5AC6                  ; 660A   0004 0158 02C6

L_660D:
        PULR    R7                              ; 660D   02B7

L_660E:
        PSHR    R5                              ; 660E   0275
        MVI     G_014C, R0                      ; 660F   0280 014C
        ANDI    #$0040, R0                      ; 6611   03B8 0040
        BNEQ    L_662B                          ; 6613   020C 0016

        JSR     R5,     L_63A2                  ; 6615   0004 0160 03A2

        CMPI    #$005D, R0                      ; 6618   0378 005D
        BLE     L_6661                          ; 661A   0206 0045

        MVI     G_014C, R0                      ; 661C   0280 014C
        ADDI    #$0040, R0                      ; 661E   02F8 0040
        MVO     R0,     G_014C                  ; 6620   0240 014C
        MVI     G_0341, R1                      ; 6622   0281 0341
        ANDI    #$0003, R1                      ; 6624   03B9 0003
        INCR    R1                              ; 6626   0009

        JSR     R5,     L_6E70                  ; 6627   0004 016C 0270
        DECLE   $0021                           ; 662A   0021
L_662B:
        MVI     G_0124, R0                      ; 662B   0280 0124
        CMPI    #$0070, R0                      ; 662D   0378 0070
        BEQ     L_664E                          ; 662F   0204 001D

        MVI     G_031C, R0                      ; 6631   0280 031C
        MVI     G_031F, R1                      ; 6633   0281 031F
        ANDI    #$00FF, R0                      ; 6635   03B8 00FF
        SDBD                                    ; 6637   0001
        ANDI    #$FF00, R1                      ; 6638   03B9 0000 00FF
        ADDR    R0,     R1                      ; 663B   00C1
        ADDI    #$000F, R1                      ; 663C   02F9 000F
        MVO     R1,     G_031F                  ; 663E   0241 031F
        MVI     G_0346, R0                      ; 6640   0280 0346
        ANDI    #$0007, R0                      ; 6642   03B8 0007
        BNEQ    L_6661                          ; 6644   020C 001B

        MVI     G_0124, R0                      ; 6646   0280 0124
        ADDI    #$0010, R0                      ; 6648   02F8 0010
        MVO     R0,     G_0124                  ; 664A   0240 0124
        B       L_6661                          ; 664C   0200 0013

L_664E:
        MVII    #$0080, R0                      ; 664E   02B8 0080
        MVO     R0,     G_011F                  ; 6650   0240 011F
        MVII    #$0007, R0                      ; 6652   02B8 0007
        MVO     R0,     G_0347                  ; 6654   0240 0347
        MVII    #$0003, R0                      ; 6656   02B8 0003
        SWAP    R0,     1                       ; 6658   0040
        ADDI    #$0010, R0                      ; 6659   02F8 0010

        JSR     R5,     L_6099                  ; 665B   0004 0160 0099
        JSR     R5,     L_5AC6                  ; 665E   0004 0158 02C6

L_6661:
        PULR    R7                              ; 6661   02B7

L_6662:
        PSHR    R5                              ; 6662   0275
        MVI     G_014C, R0                      ; 6663   0280 014C
        MOVR    R0,     R1                      ; 6665   0081
        ANDI    #$0040, R1                      ; 6666   03B9 0040
        BNEQ    L_6684                          ; 6668   020C 001A

        XORI    #$0040, R0                      ; 666A   03F8 0040
        MVO     R0,     G_014C                  ; 666C   0240 014C
        MVII    #$0024, R0                      ; 666E   02B8 0024
        MVI     G_0149, R5                      ; 6670   0285 0149
        CMPI    #$0001, R5                      ; 6672   037D 0001
        BEQ     L_6681                          ; 6674   0204 000B

        CMPI    #$0004, R5                      ; 6676   037D 0004
        BEQ     L_6681                          ; 6678   0204 0007

        MVI     G_0341, R1                      ; 667A   0281 0341
        ANDI    #$0003, R1                      ; 667C   03B9 0003
        INCR    R1                              ; 667E   0009
        MVII    #$0021, R0                      ; 667F   02B8 0021

L_6681:
        JSR     R5,     L_6E71                  ; 6681   0004 016C 0271

L_6684:
        MVI     G_0319, R0                      ; 6684   0280 0319
        MVII    #$0008, R4                      ; 6686   02BC 0008
        MVI     G_0149, R5                      ; 6688   0285 0149
        CMPI    #$0001, R5                      ; 668A   037D 0001
        BEQ     L_6695                          ; 668C   0204 0007

        CMPI    #$0004, R5                      ; 668E   037D 0004
        BEQ     L_6695                          ; 6690   0204 0003

        MVI     G_031C, R0                      ; 6692   0280 031C
        ADDR    R4,     R4                      ; 6694   00E4
L_6695:
        MVI     G_031F, R1                      ; 6695   0281 031F
        ANDI    #$00FF, R0                      ; 6697   03B8 00FF
        SDBD                                    ; 6699   0001
        ANDI    #$FF00, R1                      ; 669A   03B9 0000 00FF
        ADDR    R0,     R1                      ; 669D   00C1
        ADDI    #$0004, R1                      ; 669E   02F9 0004
        MVO     R1,     G_031F                  ; 66A0   0241 031F
        MVI     G_0346, R0                      ; 66A2   0280 0346
        ANDI    #$0007, R0                      ; 66A4   03B8 0007
        BNEQ    L_66AD                          ; 66A6   020C 0005

        MVI     G_0124, R0                      ; 66A8   0280 0124
        ADDR    R4,     R0                      ; 66AA   00E0
        MVO     R0,     G_0124                  ; 66AB   0240 0124
L_66AD:
        PULR    R7                              ; 66AD   02B7

L_66AE:
        PSHR    R5                              ; 66AE   0275
        DECLE   $0004,  $01A8,  $03D5,  $0016   ; 66AF   0004 01A8 03D5 0016
        DECLE   $00EE,  $0092,  $0004,  $01A8   ; 66B3   00EE 0092 0004 01A8
        DECLE   $03F6,  $0019,  $0016,  $0080   ; 66B7   03F6 0019 0016 0080
        DECLE   $0094,  $0280,  $0149,  $0378   ; 66BB   0094 0280 0149 0378
        DECLE   $0003,  $0204,  $0004,  $0378   ; 66BF   0003 0204 0004 0378
        DECLE   $0007,  $020C,  $0007,  $0004   ; 66C3   0007 020C 0007 0004
        DECLE   $01A8,  $03F6,  $0006,  $0016   ; 66C7   01A8 03F6 0006 0016
        DECLE   $00E4,  $00A3,  $0280,  $0149   ; 66CB   00E4 00A3 0280 0149
        DECLE   $0378,  $0002,  $0204,  $0004   ; 66CF   0378 0002 0204 0004
        DECLE   $0378,  $0006,  $020C,  $0007   ; 66D3   0378 0006 020C 0007
        DECLE   $0004,  $01A8,  $03F6,  $0006   ; 66D7   0004 01A8 03F6 0006
        DECLE   $0016,  $0020,  $00A4,  $0004   ; 66DB   0016 0020 00A4 0004

        ANDR    R5,     R4                      ; 66DF   01AC
        GSWD    R0                              ; 66E0   0030
        B       L_69D3                          ; 66E1   0200 02F0

        DECLE   $009E,  $0093,  $0035           ; 66E3   009E 0093 0035

        MOVR    R5,     R3                      ; 66E6   00AB
        MVII    #$0009, R0                      ; 66E7   02B8 0009
        MVI     G_0149, R1                      ; 66E9   0281 0149
        CMPI    #$0006, R1                      ; 66EB   0379 0006
        BEQ     L_66F1                          ; 66ED   0204 0002

        MVII    #$0001, R0                      ; 66EF   02B8 0001
L_66F1:
        MVO     R0,     G_0135                  ; 66F1   0240 0135
        MVI     G_0134, R0                      ; 66F3   0280 0134
        ANDI    #$0001, R0                      ; 66F5   03B8 0001
        BEQ     L_6715                          ; 66F7   0204 001C

        MVII    #$028C, R4                      ; 66F9   02BC 028C
        MVII    #$0250, R5                      ; 66FB   02BD 0250
        MVI@    R4,     R0                      ; 66FD   02A0
        MVO@    R0,     R5                      ; 66FE   0268
        MVI@    R4,     R0                      ; 66FF   02A0
        MVO@    R0,     R5                      ; 6700   0268
        MVI@    R4,     R0                      ; 6701   02A0
        MVO@    R0,     R5                      ; 6702   0268
        MVII    #$0250, R4                      ; 6703   02BC 0250
        MVII    #$0011, R1                      ; 6705   02B9 0011
L_6707:
        MVI@    R4,     R0                      ; 6707   02A0
        MVO@    R0,     R5                      ; 6708   0268
        DECR    R1                              ; 6709   0011
        BNEQ    L_6707                          ; 670A   022C 0004

        MVII    #$0250, R4                      ; 670C   02BC 0250
        MVII    #$0014, R1                      ; 670E   02B9 0014
L_6710:
        MVI@    R4,     R0                      ; 6710   02A0
        MVO@    R0,     R5                      ; 6711   0268
        DECR    R1                              ; 6712   0011
        BNEQ    L_6710                          ; 6713   022C 0004

L_6715:
        MVII    #$0278, R4                      ; 6715   02BC 0278
        MVII    #$028C, R5                      ; 6717   02BD 028C
        MVI@    R4,     R0                      ; 6719   02A0
        MVO@    R0,     R5                      ; 671A   0268
        MVI@    R4,     R0                      ; 671B   02A0
        MVO@    R0,     R5                      ; 671C   0268
        MVI@    R4,     R0                      ; 671D   02A0
        MVO@    R0,     R5                      ; 671E   0268
        SDBD                                    ; 671F   0001
        MVII    #$ACDE, R0                      ; 6720   02B8 00DE 00AC
        MVI     G_0149, R1                      ; 6723   0281 0149
        TSTR    R1                              ; 6725   0089
        BEQ     L_674C                          ; 6726   0204 0024

        SDBD                                    ; 6728   0001
        MVII    #$ACE6, R0                      ; 6729   02B8 00E6 00AC
        CMPI    #$0002, R1                      ; 672C   0379 0002
        BEQ     L_674C                          ; 672E   0204 001C

        SDBD                                    ; 6730   0001
        MVII    #$AD1D, R0                      ; 6731   02B8 001D 00AD
        CMPI    #$0009, R1                      ; 6734   0379 0009
        BEQ     L_674C                          ; 6736   0204 0014

        SDBD                                    ; 6738   0001
        MVII    #$AD24, R0                      ; 6739   02B8 0024 00AD
        CMPI    #$0005, R1                      ; 673C   0379 0005
        BEQ     L_674C                          ; 673E   0204 000C

        SDBD                                    ; 6740   0001
        MVII    #$AD03, R0                      ; 6741   02B8 0003 00AD
        CMPI    #$0006, R1                      ; 6744   0379 0006
        BEQ     L_674C                          ; 6746   0204 0004

        SDBD                                    ; 6748   0001
        MVII    #$ACE5, R0                      ; 6749   02B8 00E5 00AC
L_674C:
        MVO     R0,     G_0339                  ; 674C   0240 0339
        DECLE   $0004                           ; 674E   0004

        ANDR    R5,     R4                      ; 674F   01AC
        MOVR    R4,     R7                      ; 6750   00A7

        MVII    #$0007, R0                      ; 6751   02B8 0007
        MVO     R0,     G_0105                  ; 6753   0240 0105
        MVO     R0,     G_0136                  ; 6755   0240 0136

        JSR     R5,     L_5CBD                  ; 6757   0004 015C 00BD

        PULR    R7                              ; 675A   02B7

L_675B:
        PSHR    R5                              ; 675B   0275

        JSR     R5,     L_68B7                  ; 675C   0004 0168 00B7
        DECLE   $0004,  $01A8,  $03D5,  $0010   ; 675F   0004 01A8 03D5 0010
        DECLE   $0000,  $0090,  $0004,  $01AC   ; 6763   0000 0090 0004 01AC
        DECLE   $0009,  $0004,  $0004,  $01AC   ; 6767   0009 0004 0004 01AC
        DECLE   $0030,  $0200                   ; 676B   0030 0200

        ADD@    R6,     R0                      ; 676D   02F0
        TSTR    R0                              ; 676E   0080
        MOVR    R2,     R0                      ; 676F   0090
        ADDR    R3,     R5                      ; 6770   00DD
        MOVR    R5,     R1                      ; 6771   00A9
        PULR    R7                              ; 6772   02B7

L_6773:
        PSHR    R5                              ; 6773   0275
        DECLE   $0004,  $01A8,  $03D5,  $001B   ; 6774   0004 01A8 03D5 001B
        DECLE   $0092,  $0090,  $0004,  $01AC   ; 6778   0092 0090 0004 01AC
        DECLE   $0030,  $0200,  $02F0           ; 677C   0030 0200 02F0

        SAR     R2,     1                       ; 677F   006A
        MOVR    R2,     R1                      ; 6780   0091
        TSTR    R0                              ; 6781   0080
        MOVR    R5,     R2                      ; 6782   00AA
        PULR    R7                              ; 6783   02B7

L_6784:
        PSHR    R5                              ; 6784   0275
        DECLE   $0004,  $01A8,  $03D5,  $002D   ; 6785   0004 01A8 03D5 002D
        DECLE   $007A,  $0091,  $0004           ; 6789   007A 0091 0004

        ANDR    R5,     R4                      ; 678C   01AC
        GSWD    R0                              ; 678D   0030
        B       L_6A80                          ; 678E   0200 02F0

        ADDR    R4,     R2                      ; 6790   00E2
        TSTR    R2                              ; 6791   0092
        ADDR    R5,     R0                      ; 6792   00E8
        MOVR    R5,     R2                      ; 6793   00AA
        MVI     G_0348, R0                      ; 6794   0280 0348
        PSHR    R0                              ; 6796   0270
        SDBD                                    ; 6797   0001
        MVII    #$A690, R0                      ; 6798   02B8 0090 00A6
        MVO     R0,     G_0348                  ; 679B   0240 0348

        JSR     R5,     L_6941                  ; 679D   0004 0168 0141

        PULR    R0                              ; 67A0   02B0
        MVO     R0,     G_0348                  ; 67A1   0240 0348
        PULR    R7                              ; 67A3   02B7

L_67A4:
        PSHR    R5                              ; 67A4   0275
        MVI     G_034A, R1                      ; 67A5   0281 034A
        CMPI    #$00C9, R1                      ; 67A7   0379 00C9
        BLT     L_67E5                          ; 67A9   0205 003A

        MOVR    R1,     R2                      ; 67AB   008A
        DECR    R2                              ; 67AC   0012
        ANDI    #$0007, R2                      ; 67AD   03BA 0007
        BNEQ    L_6808                          ; 67AF   020C 0057

        MVII    #$02B3, R3                      ; 67B1   02BB 02B3
        MVII    #$0014, R2                      ; 67B3   02BA 0014
        MVI@    R3,     R0                      ; 67B5   0298
        ADDR    R2,     R3                      ; 67B6   00D3
        MVO@    R0,     R3                      ; 67B7   0258
        ADDR    R2,     R3                      ; 67B8   00D3
        MVO@    R0,     R3                      ; 67B9   0258
        ADDR    R2,     R3                      ; 67BA   00D3
        MVO@    R0,     R3                      ; 67BB   0258
        SUBR    R2,     R3                      ; 67BC   0113
        SDBD                                    ; 67BD   0001
        MVII    #$A414, R4                      ; 67BE   02BC 0014 00A4
        SDBD                                    ; 67C1   0001
        MVI@    R4,     R0                      ; 67C2   02A0
        SDBD                                    ; 67C3   0001
        MVI@    R4,     R2                      ; 67C4   02A2
        CMPI    #$00C9, R1                      ; 67C5   0379 00C9
        BNEQ    L_67D0                          ; 67C7   020C 0007

L_67C9:
        MVO@    R0,     R3                      ; 67C9   0258
        ADDI    #$0014, R3                      ; 67CA   02FB 0014
        MVO@    R2,     R3                      ; 67CC   025A
        SUBI    #$0014, R3                      ; 67CD   033B 0014
        PULR    R7                              ; 67CF   02B7

L_67D0:
        SDBD                                    ; 67D0   0001
        MVI@    R4,     R0                      ; 67D1   02A0
        SDBD                                    ; 67D2   0001
        MVI@    R4,     R2                      ; 67D3   02A2
        CMPI    #$00D1, R1                      ; 67D4   0379 00D1
        BEQ     L_67C9                          ; 67D6   0224 000E

        CMPI    #$00D9, R1                      ; 67D8   0379 00D9
        BEQ     L_67C9                          ; 67DA   0224 0012

        SDBD                                    ; 67DC   0001
        MVI@    R4,     R0                      ; 67DD   02A0
        SDBD                                    ; 67DE   0001
        MVI@    R4,     R2                      ; 67DF   02A2
        CMPI    #$00E1, R1                      ; 67E0   0379 00E1
        BEQ     L_67C9                          ; 67E2   0224 001A
        PULR    R7                              ; 67E4   02B7

L_67E5:
        MVII    #$02B3, R3                      ; 67E5   02BB 02B3
        CMPI    #$00B9, R1                      ; 67E7   0379 00B9
        BNEQ    L_67F8                          ; 67E9   020C 000D

        MVI@    R3,     R2                      ; 67EB   029A
        SDBD                                    ; 67EC   0001
        ANDI    #$C9FF, R2                      ; 67ED   03BA 00FF 00C9
        SDBD                                    ; 67F0   0001
        ADDI    #$1000, R2                      ; 67F1   02FA 0000 0010
        ADDI    #$003C, R3                      ; 67F4   02FB 003C
        MVO@    R2,     R3                      ; 67F6   025A
        PULR    R7                              ; 67F7   02B7

L_67F8:
        CMPI    #$00C1, R1                      ; 67F8   0379 00C1
        BNEQ    L_6808                          ; 67FA   020C 000C

        MVI@    R3,     R2                      ; 67FC   029A
        SDBD                                    ; 67FD   0001
        ANDI    #$C9FF, R2                      ; 67FE   03BA 00FF 00C9
        SDBD                                    ; 6801   0001
        ADDI    #$1000, R2                      ; 6802   02FA 0000 0010
        ADDI    #$0014, R3                      ; 6805   02FB 0014
        MVO@    R2,     R3                      ; 6807   025A
L_6808:
        PULR    R7                              ; 6808   02B7

L_6809:
        PSHR    R5                              ; 6809   0275
        MVII    #$0326, R3                      ; 680A   02BB 0326
        MVI     G_0327, R1                      ; 680C   0281 0327
        ANDI    #$007F, R1                      ; 680E   03B9 007F
        SUBI    #$0002, R1                      ; 6810   0339 0002
        MVI@    R3,     R4                      ; 6812   029C
        ANDI    #$007F, R4                      ; 6813   03BC 007F
        CMPR    R4,     R1                      ; 6815   0161
        BGT     L_6808                          ; 6816   022E 000F

        MVI@    R3,     R2                      ; 6818   029A
        MVI     G_0149, R4                      ; 6819   0284 0149
        MVI     G_0134, R0                      ; 681B   0280 0134
        ANDI    #$0018, R0                      ; 681D   03B8 0018
        BEQ     L_682C                          ; 681F   0204 000B

        SLR     R0,     2                       ; 6821   0064
        SLR     R0,     1                       ; 6822   0060

        JSR     R5,     L_6840                  ; 6823   0004 0168 0040

        DECR    R0                              ; 6826   0010
        BEQ     L_682C                          ; 6827   0204 0003

        JSR     R5,     L_6840                  ; 6829   0004 0168 0040

L_682C:
        MVI     G_013A, R0                      ; 682C   0280 013A
L_682E:
        TSTR    R0                              ; 682E   0080
        BEQ     L_6835                          ; 682F   0204 0004

        DECR    R2                              ; 6831   0012
        DECR    R0                              ; 6832   0010
        B       L_682E                          ; 6833   0220 0006

L_6835:
        MVO@    R2,     R3                      ; 6835   025A
        ANDI    #$007F, R2                      ; 6836   03BA 007F
        SUBI    #$0058, R2                      ; 6838   033A 0058
        NEGR    R2                              ; 683A   0022
        SLL     R2,     2                       ; 683B   004E
        SLL     R2,     1                       ; 683C   004A
        MVO     R2,     G_033F                  ; 683D   0242 033F
        PULR    R7                              ; 683F   02B7

L_6840:
        PSHR    R5                              ; 6840   0275
        SUBI    #$0003, R2                      ; 6841   033A 0003
        CMPI    #$0003, R4                      ; 6843   037C 0003
        BEQ     L_6849                          ; 6845   0204 0002

        SUBI    #$0001, R2                      ; 6847   033A 0001
L_6849:
        PULR    R7                              ; 6849   02B7

L_684A:
        PSHR    R5                              ; 684A   0275

        JSR     R5,     L_660E                  ; 684B   0004 0164 020E

        MVI     G_0346, R0                      ; 684E   0280 0346
        ANDI    #$0003, R0                      ; 6850   03B8 0003
        BNEQ    L_686C                          ; 6852   020C 0018

        MVI     G_011F, R0                      ; 6854   0280 011F
        ADDI    #$0010, R0                      ; 6856   02F8 0010
        ANDI    #$003F, R0                      ; 6858   03B8 003F
        MVI     G_033E, R1                      ; 685A   0281 033E
        SDBD                                    ; 685C   0001
        CMPI    #$FFB0, R1                      ; 685D   0379 00B0 00FF
        BLT     L_686A                          ; 6860   0205 0008

        ADDI    #$0040, R0                      ; 6862   02F8 0040
        CMPI    #$0050, R1                      ; 6864   0379 0050
        BLT     L_686A                          ; 6866   0205 0002

        ADDI    #$0040, R0                      ; 6868   02F8 0040
L_686A:
        MVO     R0,     G_011F                  ; 686A   0240 011F
L_686C:
        PULR    R7                              ; 686C   02B7

L_686D:
        MVI     G_0348, R4                      ; 686D   0284 0348
        PSHR    R5                              ; 686F   0275
        PSHR    R4                              ; 6870   0274
        MOVR    R4,     R5                      ; 6871   00A5
        MVII    #$0014, R0                      ; 6872   02B8 0014
L_6874:
        MVI@    R4,     R2                      ; 6874   02A2
        SDBD                                    ; 6875   0001
        ANDI    #$FFF8, R2                      ; 6876   03BA 00F8 00FF
        ADDR    R1,     R2                      ; 6879   00CA
        MVO@    R2,     R5                      ; 687A   026A
        DECR    R0                              ; 687B   0010
        BNEQ    L_6874                          ; 687C   022C 0009

        PULR    R4                              ; 687E   02B4
        PULR    R7                              ; 687F   02B7

L_6880:
        MVI     G_0348, R4                      ; 6880   0284 0348
L_6882:
        PSHR    R5                              ; 6882   0275
        PSHR    R4                              ; 6883   0274
        MOVR    R4,     R5                      ; 6884   00A5
        MVI@    R4,     R1                      ; 6885   02A1
        DECR    R4                              ; 6886   0014
        SDBD                                    ; 6887   0001
        ANDI    #$3E00, R1                      ; 6888   03B9 0000 003E
        MVII    #$0014, R0                      ; 688B   02B8 0014
L_688D:
        MVI@    R4,     R2                      ; 688D   02A2
        ANDI    #$01FF, R2                      ; 688E   03BA 01FF
        ADDR    R1,     R2                      ; 6890   00CA
        MVO@    R2,     R5                      ; 6891   026A
        DECR    R0                              ; 6892   0010
        BNEQ    L_688D                          ; 6893   022C 0007

        PULR    R4                              ; 6895   02B4
        PULR    R7                              ; 6896   02B7

L_6897:
        PSHR    R5                              ; 6897   0275
        PSHR    R2                              ; 6898   0272
        PSHR    R3                              ; 6899   0273
        CLRR    R2                              ; 689A   01D2
        MVII    #$0007, R3                      ; 689B   02BB 0007
L_689D:
        RRC     R1,     1                       ; 689D   0071
        BNC     L_68A1                          ; 689E   0209 0001

        ADDR    R0,     R2                      ; 68A0   00C2
L_68A1:
        ADDR    R0,     R0                      ; 68A1   00C0
        DECR    R3                              ; 68A2   0013
        BNEQ    L_689D                          ; 68A3   022C 0007

        ADDR    R2,     R2                      ; 68A5   00D2
        SWAP    R2,     1                       ; 68A6   0042
        ANDI    #$00FF, R2                      ; 68A7   03BA 00FF
        MOVR    R2,     R0                      ; 68A9   0090
        PULR    R3                              ; 68AA   02B3
        PULR    R2                              ; 68AB   02B2
        PULR    R7                              ; 68AC   02B7

L_68AD:
        PSHR    R5                              ; 68AD   0275
        MVI     G_0319, R1                      ; 68AE   0281 0319
        ANDI    #$00FF, R1                      ; 68B0   03B9 00FF
        ADD     G_034A, R1                      ; 68B2   02C1 034A
        SUBI    #$002D, R1                      ; 68B4   0339 002D
        PULR    R7                              ; 68B6   02B7

L_68B7:
        PSHR    R5                              ; 68B7   0275
        CLRR    R0                              ; 68B8   01C0
        MVO     R0,     G_0105                  ; 68B9   0240 0105
        MVII    #$0006, R0                      ; 68BB   02B8 0006
        MVO     R0,     G_011B                  ; 68BD   0240 011B
        MVII    #$0200, R4                      ; 68BF   02BC 0200
        MVII    #$00F0, R0                      ; 68C1   02B8 00F0

L_68C3:
        JSR     R5,     X_FILL_ZERO             ; 68C3   0004 0114 0338

        PULR    R7                              ; 68C6   02B7

L_68C7:
        PSHR    R5                              ; 68C7   0275
        MVII    #$0318, R4                      ; 68C8   02BC 0318
        MVII    #$0008, R0                      ; 68CA   02B8 0008
        B       L_68C3                          ; 68CC   0220 000A

L_68CE:
        MVII    #$017E, R0                      ; 68CE   02B8 017E
        MVO     R0,     G_0346                  ; 68D0   0240 0346
        CLRR    R0                              ; 68D2   01C0
        MVO     R0,     G_0106                  ; 68D3   0240 0106
        MVO     R0,     G_0347                  ; 68D5   0240 0347
        SDBD                                    ; 68D7   0001
        MVII    #$A807, R0                      ; 68D8   02B8 0007 00A8
        MVO     R0,     G_0348                  ; 68DB   0240 0348
        MVO     R0,     G_0349                  ; 68DD   0240 0349
        MVII    #$0006, R0                      ; 68DF   02B8 0006
        MVO     R0,     G_0131                  ; 68E1   0240 0131
        MOVR    R5,     R7                      ; 68E3   00AF

L_68E4:
        SDBD                                    ; 68E4   0001
        MVI@    R5,     R0                      ; 68E5   02A8
        MVO     R0,     .ISRVEC.0               ; 68E6   0240 0100
        SWAP    R0,     1                       ; 68E8   0040
        MVO     R0,     .ISRVEC.1               ; 68E9   0240 0101
L_68EB:
        MOVR    R5,     R7                      ; 68EB   00AF

L_68EC:
        PSHR    R5                              ; 68EC   0275
        MVI     .ISRVEC.0,R1                    ; 68ED   0281 0100
        SWAP    R1,     1                       ; 68EF   0041
        XOR     .ISRVEC.1,R1                    ; 68F0   03C1 0101
        MOVR    R7,     R0                      ; 68F2   00B8
        ADDI    #$0008, R0                      ; 68F3   02F8 0008
        MVO     R0,     .ISRVEC.0               ; 68F5   0240 0100
        SWAP    R0,     1                       ; 68F7   0040
        MVO     R0,     .ISRVEC.1               ; 68F8   0240 0101
L_68FA:
        DECR    R7                              ; 68FA   0017

        SUBI    #$0008, R6                      ; 68FB   033E 0008
        MVO     R1,     .ISRVEC.1               ; 68FD   0241 0101
        SWAP    R1,     1                       ; 68FF   0041
        MVO     R1,     .ISRVEC.0               ; 6900   0241 0100
        PULR    R7                              ; 6902   02B7

L_6903:
        MVI@    R5,     R1                      ; 6903   02A9
        TSTR    R1                              ; 6904   0089
        BEQ     L_68EB                          ; 6905   0224 001B

        MVI@    R5,     R0                      ; 6907   02A8
        MVO@    R0,     R1                      ; 6908   0248
        B       L_6903                          ; 6909   0220 0007

L_690B:
        MVI@    R5,     R1                      ; 690B   02A9
        TSTR    R1                              ; 690C   0089
        BEQ     L_68EB                          ; 690D   0224 0023

        SDBD                                    ; 690F   0001
        MVI@    R5,     R0                      ; 6910   02A8
        MVO@    R0,     R1                      ; 6911   0248
        B       L_690B                          ; 6912   0220 0008

L_6914:
        PSHR    R5                              ; 6914   0275
        MOVR    R1,     R5                      ; 6915   008D
L_6916:
        MVI@    R4,     R1                      ; 6916   02A1
        MVO@    R1,     R5                      ; 6917   0269
        MVI@    R4,     R1                      ; 6918   02A1
        MVO@    R1,     R5                      ; 6919   0269
        MVI@    R4,     R1                      ; 691A   02A1
        MVO@    R1,     R5                      ; 691B   0269
        MVI@    R4,     R1                      ; 691C   02A1
        MVO@    R1,     R5                      ; 691D   0269
        MVI@    R4,     R1                      ; 691E   02A1
        MVO@    R1,     R5                      ; 691F   0269
        MVI@    R4,     R1                      ; 6920   02A1
        MVO@    R1,     R5                      ; 6921   0269
        MVI@    R4,     R1                      ; 6922   02A1
        MVO@    R1,     R5                      ; 6923   0269
        MVI@    R4,     R1                      ; 6924   02A1
        MVO@    R1,     R5                      ; 6925   0269
        DECR    R0                              ; 6926   0010
        BPL     L_6916                          ; 6927   0223 0012
        PULR    R7                              ; 6929   02B7

        MVII    #$0001, R0                      ; 692A   02B8 0001
L_692C:
        PSHR    R5                              ; 692C   0275
        MOVR    R0,     R5                      ; 692D   0085
L_692E:
        SDBD                                    ; 692E   0001
        MVI@    R4,     R0                      ; 692F   02A0
        MVO@    R0,     R3                      ; 6930   0258
        ADDI    #$0008, R3                      ; 6931   02FB 0008
        SDBD                                    ; 6933   0001
        MVI@    R4,     R0                      ; 6934   02A0
        MVO@    R0,     R3                      ; 6935   0258
        ADDI    #$0008, R3                      ; 6936   02FB 0008
        SDBD                                    ; 6938   0001
        MVI@    R4,     R0                      ; 6939   02A0
        MVO@    R0,     R3                      ; 693A   0258
        SUBI    #$000F, R3                      ; 693B   033B 000F
        DECR    R5                              ; 693D   0015
        BNEQ    L_692E                          ; 693E   022C 0011
        PULR    R7                              ; 6940   02B7

L_6941:
        PSHR    R5                              ; 6941   0275
        MVI     G_0348, R4                      ; 6942   0284 0348
        MVI     G_012B, R0                      ; 6944   0280 012B
        INCR    R0                              ; 6946   0008
        CMP     G_0349, R4                      ; 6947   0344 0349
        BNEQ    L_694C                          ; 6949   020C 0001

        CLRR    R0                              ; 694B   01C0
L_694C:
        MVO     R0,     G_012B                  ; 694C   0240 012B
        B       L_6954                          ; 694E   0200 0004

L_6950:
        ADDI    #$0020, R0                      ; 6950   02F8 0020
        B       L_6957                          ; 6952   0200 0003

L_6954:
        JSR     R5,     L_698B                  ; 6954   0004 0168 018B

L_6957:
        MOVR    R0,     R2                      ; 6957   0082
        CMPI    #$0001, R2                      ; 6958   037A 0001
        BLT     L_6954                          ; 695A   0225 0007
        BEQ     L_6984                          ; 695C   0204 0026

        CMPI    #$0002, R2                      ; 695E   037A 0002
        BEQ     L_6982                          ; 6960   0204 0020

        CMPI    #$0003, R2                      ; 6962   037A 0003
        BEQ     L_6987                          ; 6964   0204 0021

        JSR     R5,     L_698B                  ; 6966   0004 0168 018B

        MOVR    R0,     R3                      ; 6969   0083

L_696A:
        JSR     R5,     L_698B                  ; 696A   0004 0168 018B

        SUBI    #$0020, R0                      ; 696D   0338 0020
        BMI     L_6950                          ; 696F   022B 0020

        ADDR    R0,     R0                      ; 6971   00C0
        ADDR    R0,     R0                      ; 6972   00C0
        ADDR    R0,     R0                      ; 6973   00C0
        ADDR    R3,     R0                      ; 6974   00D8
        MVI@    R2,     R1                      ; 6975   0291
        SDBD                                    ; 6976   0001
        ANDI    #$3600, R1                      ; 6977   03B9 0000 0036
        COMR    R1                              ; 697A   0019
        COMR    R0                              ; 697B   0018
        ANDR    R1,     R0                      ; 697C   0188
        COMR    R0                              ; 697D   0018
        MVO@    R0,     R2                      ; 697E   0250
        INCR    R2                              ; 697F   000A
        B       L_696A                          ; 6980   0220 0017

L_6982:
        MVI     G_0349, R4                      ; 6982   0284 0349
L_6984:
        MVO     R4,     G_0348                  ; 6984   0244 0348
        PULR    R7                              ; 6986   02B7

L_6987:
        JSR     R5,     L_68CE                  ; 6987   0004 0168 00CE

        PULR    R7                              ; 698A   02B7

L_698B:
        PSHR    R5                              ; 698B   0275
        SDBD                                    ; 698C   0001
        CMPI    #$A68F, R4                      ; 698D   037C 008F 00A6
        BNC     L_6994                          ; 6990   0209 0002

        MVI@    R4,     R0                      ; 6992   02A0
        PULR    R7                              ; 6993   02B7

L_6994:
        JSR     R5,     L_6FDB                  ; 6994   0004 016C 03DB

        PULR    R7                              ; 6997   02B7

        DECLE   $0228,  $0005                   ; 6998   0228 0005
L_699A:
        PSHR    R5                              ; 699A   0275

        JSR     R5,     L_6A0C                  ; 699B   0004 0168 020C
        JSR     R5,     L_69A2                  ; 699E   0004 0168 01A2

        PULR    R7                              ; 69A1   02B7

L_69A2:
        PSHR    R5                              ; 69A2   0275
        CLRR    R1                              ; 69A3   01C9
        MVII    #$010B, R2                      ; 69A4   02BA 010B
        MVII    #$0113, R3                      ; 69A6   02BB 0113
        MVI     G_0343, R4                      ; 69A8   0284 0343

        JSR     R5,     L_69AE                  ; 69AA   0004 0168 01AE

        PULR    R7                              ; 69AD   02B7

L_69AE:
        PSHR    R5                              ; 69AE   0275
        MVII    #$0002, R5                      ; 69AF   02BD 0002
L_69B1:
        MVI@    R2,     R0                      ; 69B1   0290
        CMP@    R3,     R0                      ; 69B2   0358
        BNEQ    L_69B9                          ; 69B3   020C 0004

        CMPI    #$00FF, R0                      ; 69B5   0378 00FF
        BEQ     L_69CA                          ; 69B7   0204 0011

L_69B9:
        PSHR    R5                              ; 69B9   0275
        PSHR    R4                              ; 69BA   0274
        PSHR    R3                              ; 69BB   0273
        NOP                                     ; 69BC   0034
        PSHR    R2                              ; 69BD   0272
        PSHR    R1                              ; 69BE   0271
        SDBD                                    ; 69BF   0001
        MVII    #$69C5, R5                      ; 69C0   02BD 00C5 0069
        SDBD                                    ; 69C3   0001
        MVI@    R4,     R7                      ; 69C4   02A7

        PULR    R1                              ; 69C5   02B1
        PULR    R2                              ; 69C6   02B2
        PULR    R3                              ; 69C7   02B3
        PULR    R4                              ; 69C8   02B4
        PULR    R5                              ; 69C9   02B5
L_69CA:
        MVI@    R2,     R0                      ; 69CA   0290
        MVO@    R0,     R3                      ; 69CB   0258
        INCR    R2                              ; 69CC   000A
        INCR    R3                              ; 69CD   000B
        ADDI    #$0002, R4                      ; 69CE   02FC 0002
        DECR    R5                              ; 69D0   0015
        BPL     L_69B1                          ; 69D1   0223 0021
L_69D3:
        PULR    R7                              ; 69D3   02B7

        DECLE   $0001,  $0012,  $0006,  $0000   ; 69D4   0001 0012 0006 0000
        DECLE   $000A,  $0004,  $0008,  $0002   ; 69D8   000A 0004 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 69E0   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; 69E4   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; 69E8   0000 0004 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 69EC   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 69F0   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 69F4   0000 0003 0000 0004

        INCR    R7                              ; 69F8   000F

        DECR    R0                              ; 69F9   0010
L_69FA:
        INCR    R4                              ; 69FA   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FB   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 69FF   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 6A03   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 6A07   0005 000E 0001 000D
        DECLE   $0000                           ; 6A0B   0000
L_6A0C:
        PSHR    R5                              ; 6A0C   0275
        MVI     G_010E, R0                      ; 6A0D   0280 010E
        MVII    #$010B, R4                      ; 6A0F   02BC 010B

        JSR     R5,     L_6A19                  ; 6A11   0004 0168 0219

        MVI     G_0112, R0                      ; 6A14   0280 0112
        MVII    #$010F, R4                      ; 6A16   02BC 010F
        INCR    R7                              ; 6A18   000F

L_6A19:
        PSHR    R5                              ; 6A19   0275
L_6A1A:
        MOVR    R0,     R1                      ; 6A1A   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; 6A1B   0065 0065 0061 0001
        DECLE   $02F9,  $00D4,  $0069,  $0289   ; 6A1F   02F9 00D4 0069 0289
        DECLE   $0079,  $0201,  $001B,  $0079   ; 6A23   0079 0201 001B 0079
        DECLE   $0201,  $001C,  $0082,  $03B8   ; 6A27   0201 001C 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; 6A2B   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; 6A2F   000F 0001

        ADDI    #$00DC, R2                      ; 6A31   02FA 00DC
        SAR     R1,     1                       ; 6A33   0069
        ADD@    R2,     R1                      ; 6A34   02D1
        CMPI    #$000A, R1                      ; 6A35   0379 000A
        BLE     L_6A43                          ; 6A37   0206 000A

        SUBI    #$000B, R1                      ; 6A39   0339 000B
        BEQ     L_6A43                          ; 6A3B   0204 0006

        ADDI    #$000A, R1                      ; 6A3D   02F9 000A
        B       L_6A43                          ; 6A3F   0200 0002

        MVII    #$00FF, R1                      ; 6A41   02B9 00FF
L_6A43:
        MVO@    R1,     R4                      ; 6A43   0261
        PULR    R7                              ; 6A44   02B7

        MVII    #$00FF, R2                      ; 6A45   02BA 00FF
        MVO@    R2,     R4                      ; 6A47   0262
        XORI    #$00FF, R1                      ; 6A48   03F9 00FF
        MVO@    R1,     R4                      ; 6A4A   0261
        MOVR    R0,     R1                      ; 6A4B   0081
        ANDI    #$001F, R1                      ; 6A4C   03B9 001F
        SDBD                                    ; 6A4E   0001
        ADDI    #$69EC, R1                      ; 6A4F   02F9 00EC 0069
        MVI@    R1,     R1                      ; 6A52   0289
        DECR    R1                              ; 6A53   0011
        MVO@    R1,     R4                      ; 6A54   0261
        PULR    R7                              ; 6A55   02B7

L_6A56:
        PSHR    R5                              ; 6A56   0275
        MVI     G_0345, R5                      ; 6A57   0285 0345
        MVI     .PSG0.rgt_hand,R0               ; 6A59   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6A5B   0380 01FF
        CMPI    #$00FF, R0                      ; 6A5D   0378 00FF
        BEQ     L_6A65                          ; 6A5F   0204 0004

L_6A61:
        SDBD                                    ; 6A61   0001
        MVII    #$2A30, R5                      ; 6A62   02BD 0030 002A
L_6A65:
        DECR    R5                              ; 6A65   0015
        MVO     R5,     G_0345                  ; 6A66   0245 0345
        BEQ     L_6A76                          ; 6A68   0204 000C

        MVI     .PSG0.rgt_hand,R0               ; 6A6A   0280 01FE
        CMPI    #$005A, R0                      ; 6A6C   0378 005A
        BEQ     L_6A76                          ; 6A6E   0204 0006

        AND     .PSG0.lft_hand,R0               ; 6A70   0380 01FF
        CMPI    #$005A, R0                      ; 6A72   0378 005A
        BNEQ    L_6A9C                          ; 6A74   020C 0026

L_6A76:
        MVI     .ISRVEC.0,R2                    ; 6A76   0282 0100
        MVI     .ISRVEC.1,R3                    ; 6A78   0283 0101
        SDBD                                    ; 6A7A   0001
        MVII    #$6AAD, R1                      ; 6A7B   02B9 00AD 006A
        MVO     R1,     .ISRVEC.0               ; 6A7E   0241 0100
L_6A80:
        SWAP    R1,     1                       ; 6A80   0041
        MVO     R1,     .ISRVEC.1               ; 6A81   0241 0101
        MVI     .PSG0.chan_enable,R1            ; 6A83   0281 01F8
        MVII    #$003F, R5                      ; 6A85   02BD 003F
        MVO     R5,     .PSG0.chan_enable       ; 6A87   0245 01F8
        MVI     G_0345, R0                      ; 6A89   0280 0345
        TSTR    R0                              ; 6A8B   0080
        BEQ     L_6A91                          ; 6A8C   0204 0003

        JSR     R5,     L_6A9D                  ; 6A8E   0004 0168 029D
L_6A91:
        JSR     R5,     L_6A9D                  ; 6A91   0004 0168 029D

        MVO     R1,     .PSG0.chan_enable       ; 6A94   0241 01F8
        MVO     R2,     .ISRVEC.0               ; 6A96   0242 0100
        MVO     R3,     .ISRVEC.1               ; 6A98   0243 0101
        B       L_6A61                          ; 6A9A   0220 003A
L_6A9C:
        PULR    R7                              ; 6A9C   02B7

L_6A9D:
        MVI     .PSG0.rgt_hand,R0               ; 6A9D   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6A9F   0380 01FF
        CMPI    #$00FF, R0                      ; 6AA1   0378 00FF
        BEQ     L_6A9D                          ; 6AA3   0224 0007

L_6AA5:
        MVI     .PSG0.rgt_hand,R0               ; 6AA5   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6AA7   0380 01FF
        CMPI    #$00FF, R0                      ; 6AA9   0378 00FF
        BNEQ    L_6AA5                          ; 6AAB   022C 0007
        MOVR    R5,     R7                      ; 6AAD   00AF

        DECLE   $0002,  $0004                   ; 6AAE   0002 0004

        DIS                                     ; 6AB0   0003
        ADDR    R1,     R4                      ; 6AB1   00CC
        MOVR    R4,     R2                      ; 6AB2   00A2
        ADDR    R2,     R5                      ; 6AB3   00D5
        MOVR    R4,     R3                      ; 6AB4   00A3
        SLR     R2,     2                       ; 6AB5   0066
        TSTR    R4                              ; 6AB6   00A4
        PSHR    R5                              ; 6AB7   0275
        CMPI    #$00FF, R0                      ; 6AB8   0378 00FF
        BEQ     L_6ADE                          ; 6ABA   0204 0022

        CMP@    R3,     R0                      ; 6ABC   0358
        BEQ     L_6ADE                          ; 6ABD   0204 001F

        TSTR    R0                              ; 6ABF   0080
        BEQ     L_6ADE                          ; 6AC0   0204 001C

        CMPI    #$000A, R0                      ; 6AC2   0378 000A
        BEQ     L_6ADF                          ; 6AC4   0204 0019

        CMPI    #$000B, R0                      ; 6AC6   0378 000B
        BEQ     L_6AE5                          ; 6AC8   0204 001B

        MVI     G_0153, R1                      ; 6ACA   0281 0153
        SDBD                                    ; 6ACC   0001
        ADDI    #$6AAE, R1                      ; 6ACD   02F9 00AE 006A
        CMP@    R1,     R0                      ; 6AD0   0348
        BGT     L_6ADE                          ; 6AD1   020E 000B

        MVO     R0,     G_0154                  ; 6AD3   0240 0154
        MVII    #$0001, R1                      ; 6AD5   02B9 0001
        MVII    #$0006, R3                      ; 6AD7   02BB 0006
        MVII    #$0295, R4                      ; 6AD9   02BC 0295

        JSR     R5,     X_PRNUM_RGT             ; 6ADB   0004 0118 00C5

L_6ADE:
        PULR    R7                              ; 6ADE   02B7

L_6ADF:
        CLRR    R0                              ; 6ADF   01C0
        MVO     R0,     G_0154                  ; 6AE0   0240 0154
        MVO     R0,     .BTAB.95                ; 6AE2   0240 0295
        PULR    R7                              ; 6AE4   02B7

L_6AE5:
        MVI     G_0154, R0                      ; 6AE5   0280 0154
        DECR    R0                              ; 6AE7   0010
        BMI     L_6ADE                          ; 6AE8   022B 000B

        MVI     G_0153, R1                      ; 6AEA   0281 0153
        INCR    R1                              ; 6AEC   0009
        ADDR    R7,     R1                      ; 6AED   00F9
        ADD@    R1,     R7                      ; 6AEE   02CF

        DECLE   $0005,  $0004                   ; 6AEF   0005 0004

        DIS                                     ; 6AF1   0003
        SLL     R0,     2                       ; 6AF2   004C
        SLL     R0,     1                       ; 6AF3   0048
        XOR     G_0134, R0                      ; 6AF4   03C0 0134
        MVO     R0,     G_0134                  ; 6AF6   0240 0134
        MVI     G_0153, R1                      ; 6AF8   0281 0153
        INCR    R1                              ; 6AFA   0009
        MVO     R1,     G_0153                  ; 6AFB   0241 0153
        CMPI    #$0003, R1                      ; 6AFD   0379 0003
        BNEQ    L_6B05                          ; 6AFF   020C 0004
        J       L_6C0B                          ; 6B01   0004 036C 000B

L_6B04:
        PSHR    R5                              ; 6B04   0275
L_6B05:
        MVII    #$0200, R4                      ; 6B05   02BC 0200
        MVII    #$00C8, R0                      ; 6B07   02B8 00C8

        JSR     R5,     X_FILL_ZERO             ; 6B09   0004 0114 0338

        MVI     G_0153, R4                      ; 6B0C   0284 0153
        ADDR    R4,     R4                      ; 6B0E   00E4
        SDBD                                    ; 6B0F   0001
        ADDI    #$6AB1, R4                      ; 6B10   02FC 00B1 006A
        SDBD                                    ; 6B13   0001
        MVI@    R4,     R1                      ; 6B14   02A1
        MVO     R1,     G_0348                  ; 6B15   0241 0348

        JSR     R5,     L_6941                  ; 6B17   0004 0168 0141

        B       L_6ADF                          ; 6B1A   0220 003C

        PSHR    R5                              ; 6B1C   0275
        MVI@    R3,     R0                      ; 6B1D   0298
        CMPI    #$00FF, R0                      ; 6B1E   0378 00FF
        BNEQ    L_6B5C                          ; 6B20   020C 003A

        MVI     G_014C, R0                      ; 6B22   0280 014C
        CMPI    #$007F, R0                      ; 6B24   0378 007F
        BGT     L_6B5C                          ; 6B26   020E 0034

        MVI     G_0319, R0                      ; 6B28   0280 0319
        ANDI    #$00FF, R0                      ; 6B2A   03B8 00FF
        SUBI    #$002D, R0                      ; 6B2C   0338 002D
        ADD     G_034A, R0                      ; 6B2E   02C0 034A
        CMPI    #$0024, R0                      ; 6B30   0378 0024
        BLT     L_6B5C                          ; 6B32   0205 0028

        CMPI    #$02DA, R0                      ; 6B34   0378 02DA
        BGT     L_6B5C                          ; 6B36   020E 0024

        MVI     G_012E, R0                      ; 6B38   0280 012E
        CMPI    #$0003, R0                      ; 6B3A   0378 0003
        BLT     L_6B5C                          ; 6B3C   0205 001E

        MVII    #$0001, R0                      ; 6B3E   02B8 0001
        MVO     R0,     G_014A                  ; 6B40   0240 014A
        MVII    #$009D, R0                      ; 6B42   02B8 009D
        NEGR    R0                              ; 6B44   0020
        MVO     R0,     G_033E                  ; 6B45   0240 033E
        MVII    #$000C, R0                      ; 6B47   02B8 000C
        MVO     R0,     G_014B                  ; 6B49   0240 014B
        MVI     G_014C, R0                      ; 6B4B   0280 014C
        ANDI    #$007F, R0                      ; 6B4D   03B8 007F
        ADDI    #$0080, R0                      ; 6B4F   02F8 0080
        MVO     R0,     G_014C                  ; 6B51   0240 014C
        CLRR    R0                              ; 6B53   01C0
        MVO     R0,     G_0128                  ; 6B54   0240 0128
        MVO     R0,     G_0129                  ; 6B56   0240 0129

        JSR     R5,     L_6E70                  ; 6B58   0004 016C 0270
        DECLE   $0033                           ; 6B5B   0033
L_6B5C:
        PULR    R7                              ; 6B5C   02B7

        PSHR    R5                              ; 6B5D   0275
        MVI@    R3,     R1                      ; 6B5E   0299
        CMPI    #$00FF, R1                      ; 6B5F   0379 00FF
        BEQ     L_6BC7                          ; 6B61   0204 0064

        CMPI    #$00FF, R0                      ; 6B63   0378 00FF
        BNEQ    L_6BCC                          ; 6B65   020C 0065

        JSR     R5,     L_68AD                  ; 6B67   0004 0168 00AD

        MOVR    R1,     R0                      ; 6B6A   0088
        SUB     G_033D, R0                      ; 6B6B   0300 033D
        MVII    #$011D, R2                      ; 6B6D   02BA 011D
        SUBR    R1,     R2                      ; 6B6F   010A
        MVI     G_033D, R3                      ; 6B70   0283 033D
        SUBI    #$00FA, R3                      ; 6B72   033B 00FA
        BPL     L_6B77                          ; 6B74   0203 0001

        NEGR    R3                              ; 6B76   0023
L_6B77:
        SUBR    R3,     R0                      ; 6B77   0118
        SUBR    R2,     R0                      ; 6B78   0110
        TSTR    R0                              ; 6B79   0080
        BMI     L_6BCC                          ; 6B7A   020B 0050

        ADDI    #$000A, R0                      ; 6B7C   02F8 000A
        SLL     R0,     1                       ; 6B7E   0048
        ADD     G_034D, R0                      ; 6B7F   02C0 034D
        MVII    #$0059, R1                      ; 6B81   02B9 0059

        JSR     R5,     L_6897                  ; 6B83   0004 0168 0097
        DECLE   $0020,  $0240,  $033E,  $0240   ; 6B86   0020 0240 033E 0240
        DECLE   $0348,  $02B8,  $0004,  $0240   ; 6B8A   0348 02B8 0004 0240
        DECLE   $014B,  $01C0,  $0240,  $0128   ; 6B8E   014B 01C0 0240 0128
        DECLE   $0240,  $0129,  $0240,  $033D   ; 6B92   0240 0129 0240 033D
        DECLE   $0008,  $0240,  $014A,  $02B8   ; 6B96   0008 0240 014A 02B8
        DECLE   $0100,  $0300,  $034D,  $0240   ; 6B9A   0100 0300 034D 0240
        DECLE   $034D,  $0280,  $014C,  $03B8   ; 6B9E   034D 0280 014C 03B8
        DECLE   $0077,  $02F8,  $0088,  $0240   ; 6BA2   0077 02F8 0088 0240
        DECLE   $014C,  $0280,  $0319,  $0240   ; 6BA6   014C 0280 0319 0240
        DECLE   $0130,  $0004                   ; 6BAA   0130 0004

        ANDR    R5,     R4                      ; 6BAC   01AC
        CMP@    R6,     R1                      ; 6BAD   0371

        JSR     R5,     L_6E70                  ; 6BAE   0004 016C 0270
        DECLE   $0030                           ; 6BB1   0030

        MVI     G_0149, R0                      ; 6BB2   0280 0149
        CMPI    #$0004, R0                      ; 6BB4   0378 0004
        BNEQ    L_6BCC                          ; 6BB6   020C 0014

        MVII    #$0009, R0                      ; 6BB8   02B8 0009
        MVO     R0,     G_014B                  ; 6BBA   0240 014B
        CLRR    R0                              ; 6BBC   01C0
        MVO     R0,     G_0121                  ; 6BBD   0240 0121

        JSR     R5,     L_690B                  ; 6BBF   0004 0168 010B
        DECLE   $0343                           ; 6BC2   0343

        SWAP    R2,     2                       ; 6BC3   0046
        MOVR    R5,     R7                      ; 6BC4   00AF

        DECLE   $0000                           ; 6BC5   0000

        PULR    R7                              ; 6BC6   02B7

L_6BC7:
        JSR     R5,     L_68AD                  ; 6BC7   0004 0168 00AD

        MVO     R1,     G_033D                  ; 6BCA   0241 033D
L_6BCC:
        PULR    R7                              ; 6BCC   02B7

        DECLE   $0275,  $0299,  $0379,  $00FF   ; 6BCD   0275 0299 0379 00FF
        DECLE   $020C,  $0015,  $0284,  $0149   ; 6BD1   020C 0015 0284 0149
        DECLE   $0280,  $014E,  $0080,  $020C   ; 6BD5   0280 014E 0080 020C
        DECLE   $000F,  $0008,  $0240,  $014E   ; 6BD9   000F 0008 0240 014E
        DECLE   $02B8,  $0080,  $0240,  $011C   ; 6BDD   02B8 0080 0240 011C
        DECLE   $037C,  $0008,  $020C,  $0003   ; 6BE1   037C 0008 020C 0003
        DECLE   $0004                           ; 6BE5   0004

        ANDR    R5,     R4                      ; 6BE6   01AC
        CMP@    R6,     R1                      ; 6BE7   0371
L_6BE8:
        PULR    R7                              ; 6BE8   02B7

        CMPI    #$0007, R4                      ; 6BE9   037C 0007
        BNEQ    L_6BE8                          ; 6BEB   022C 0004

        MVI     G_011C, R0                      ; 6BED   0280 011C
        CMPI    #$00A0, R0                      ; 6BEF   0378 00A0
        BLT     L_6BE8                          ; 6BF1   0225 000A

        CMPI    #$00E0, R0                      ; 6BF3   0378 00E0
        BGE     L_6BE8                          ; 6BF5   022D 000E

        MVI     G_014D, R0                      ; 6BF7   0280 014D
        SLR     R0,     1                       ; 6BF9   0060
        MVO     R0,     G_014D                  ; 6BFA   0240 014D
        ADD     G_0131, R0                      ; 6BFC   02C0 0131
        MVO     R0,     G_0131                  ; 6BFE   0240 0131
        PULR    R7                              ; 6C00   02B7

        PSHR    R5                              ; 6C01   0275
        MVI@    R3,     R1                      ; 6C02   0299
        CMPI    #$00FF, R1                      ; 6C03   0379 00FF
        BNEQ    L_6C0A                          ; 6C05   020C 0003

        CLRR    R0                              ; 6C07   01C0
        MVO     R0,     G_0121                  ; 6C08   0240 0121
L_6C0A:
        PULR    R7                              ; 6C0A   02B7

L_6C0B:
        MVI     G_0346, R0                      ; 6C0B   0280 0346
        MVO     R0,     G_0341                  ; 6C0D   0240 0341
        CLRR    R0                              ; 6C0F   01C0
        MVO     R0,     G_0149                  ; 6C10   0240 0149
        MVI     G_0134, R1                      ; 6C12   0281 0134
        ANDI    #$0001, R1                      ; 6C14   03B9 0001
        BEQ     L_6C49                          ; 6C16   0204 0031

L_6C18:
        JSR     R5,     L_68C7                  ; 6C18   0004 0168 00C7

        MVII    #$0002, R0                      ; 6C1B   02B8 0002
        MVO     R0,     G_0347                  ; 6C1D   0240 0347
        SDBD                                    ; 6C1F   0001
        MVII    #$AF10, R0                      ; 6C20   02B8 0010 00AF
        MVO     R0,     G_0343                  ; 6C23   0240 0343

        JSR     R5,     L_68B7                  ; 6C25   0004 0168 00B7

        SDBD                                    ; 6C28   0001
        MVII    #$A89E, R0                      ; 6C29   02B8 009E 00A8
        MVO     R0,     G_0348                  ; 6C2C   0240 0348

        JSR     R5,     L_6941                  ; 6C2E   0004 0168 0141

        MVII    #$0006, R1                      ; 6C31   02B9 0006
        MVII    #$0214, R0                      ; 6C33   02B8 0214
        MVI     G_0149, R2                      ; 6C35   0282 0149
        MVO     R2,     G_012C                  ; 6C37   0242 012C
        TSTR    R2                              ; 6C39   0092
        BEQ     L_6C41                          ; 6C3A   0204 0005

L_6C3C:
        ADDI    #$0014, R0                      ; 6C3C   02F8 0014
        DECR    R2                              ; 6C3E   0012
        BNEQ    L_6C3C                          ; 6C3F   022C 0004

L_6C41:
        MVO     R0,     G_0348                  ; 6C41   0240 0348

        JSR     R5,     L_686D                  ; 6C43   0004 0168 006D

        MVO     R0,     G_0147                  ; 6C46   0240 0147
        PULR    R7                              ; 6C48   02B7

L_6C49:
        SDBD                                    ; 6C49   0001
        MVII    #$AF16, R0                      ; 6C4A   02B8 0016 00AF
        MVO     R0,     G_0343                  ; 6C4D   0240 0343

        JSR     R5,     L_5C6C                  ; 6C4F   0004 015C 006C

L_6C52:
        PULR    R7                              ; 6C52   02B7

        PSHR    R5                              ; 6C53   0275
        CMP@    R3,     R0                      ; 6C54   0358
        BEQ     L_6C52                          ; 6C55   0224 0004

        CMPI    #$00FF, R0                      ; 6C57   0378 00FF
        BEQ     L_6C52                          ; 6C59   0224 0008

        CMPI    #$000B, R0                      ; 6C5B   0378 000B
        BNEQ    L_6C52                          ; 6C5D   022C 000C

        MVI     G_012C, R0                      ; 6C5F   0280 012C
        MVO     R0,     G_0149                  ; 6C61   0240 0149
        B       L_6C49                          ; 6C63   0220 001B

        PSHR    R5                              ; 6C65   0275
        CMP@    R3,     R0                      ; 6C66   0358
        BEQ     L_6C52                          ; 6C67   0224 0016

        MVI     G_012C, R1                      ; 6C69   0281 012C
        MVI     G_0348, R2                      ; 6C6B   0282 0348
        CMPI    #$000C, R0                      ; 6C6D   0378 000C
        BEQ     L_6C80                          ; 6C6F   0204 000F

        CMPI    #$0004, R0                      ; 6C71   0378 0004
        BNEQ    L_6C52                          ; 6C73   022C 0022

        SUBI    #$0014, R2                      ; 6C75   033A 0014
        DECR    R1                              ; 6C77   0011
        BPL     L_6C8A                          ; 6C78   0203 0010

        MVII    #$0009, R1                      ; 6C7A   02B9 0009
        MVII    #$02C8, R2                      ; 6C7C   02BA 02C8
        B       L_6C8A                          ; 6C7E   0200 000A

L_6C80:
        ADDI    #$0014, R2                      ; 6C80   02FA 0014
        INCR    R1                              ; 6C82   0009
        CMPI    #$000A, R1                      ; 6C83   0379 000A
        BLT     L_6C8A                          ; 6C85   0205 0003

        MVII    #$0214, R2                      ; 6C87   02BA 0214
        CLRR    R1                              ; 6C89   01C9
L_6C8A:
        PSHR    R1                              ; 6C8A   0271
        PSHR    R2                              ; 6C8B   0272
        MVII    #$0003, R1                      ; 6C8C   02B9 0003

        JSR     R5,     L_686D                  ; 6C8E   0004 0168 006D

        PULR    R2                              ; 6C91   02B2
        PULR    R1                              ; 6C92   02B1
        MVO     R1,     G_012C                  ; 6C93   0241 012C
        MVO     R2,     G_0348                  ; 6C95   0242 0348
        MVII    #$0006, R1                      ; 6C97   02B9 0006

        JSR     R5,     L_686D                  ; 6C99   0004 0168 006D

        PULR    R7                              ; 6C9C   02B7

        PSHR    R5                              ; 6C9D   0275
        CMP@    R3,     R0                      ; 6C9E   0358
        BEQ     L_6CA7                          ; 6C9F   0204 0006

        CMPI    #$00FF, R0                      ; 6CA1   0378 00FF
        BNEQ    L_6CA7                          ; 6CA3   020C 0002

        CMPI    #$000B, R0                      ; 6CA5   0378 000B
L_6CA7:
        MOVR    R0,     R1                      ; 6CA7   0081
        CMPI    #$00FF, R1                      ; 6CA8   0379 00FF
        BEQ     L_6CC5                          ; 6CAA   0204 0019

        CMPI    #$0004, R1                      ; 6CAC   0379 0004
        BNEQ    L_6CB5                          ; 6CAE   020C 0005

        JSR     R5,     L_5239                  ; 6CB0   0004 0150 0239

        B       L_6CC5                          ; 6CB3   0200 0010

L_6CB5:
        CMPI    #$0006, R1                      ; 6CB5   0379 0006
        BNEQ    L_6CC5                          ; 6CB7   020C 000C

        MVI     G_0105, R1                      ; 6CB9   0281 0105
        INCR    R1                              ; 6CBB   0009
        ANDI    #$0007, R1                      ; 6CBC   03B9 0007
        TSTR    R1                              ; 6CBE   0089
        BNEQ    L_6CC3                          ; 6CBF   020C 0002

        ADDI    #$0040, R1                      ; 6CC1   02F9 0040
L_6CC3:
        MVO     R1,     G_0105                  ; 6CC3   0241 0105
L_6CC5:
        PULR    R7                              ; 6CC5   02B7

        PSHR    R5                              ; 6CC6   0275
        CMPI    #$00FF, R0                      ; 6CC7   0378 00FF
        BEQ     L_6CC5                          ; 6CC9   0224 0005

        CMPI    #$000B, R0                      ; 6CCB   0378 000B
        BEQ     L_6CD8                          ; 6CCD   0204 0009

        CMPI    #$000A, R0                      ; 6CCF   0378 000A
        BNEQ    L_6CC5                          ; 6CD1   022C 000D

        MVI     G_0134, R1                      ; 6CD3   0281 0134
        SARC    R1,     1                       ; 6CD5   0079
        BNC     L_6CC5                          ; 6CD6   0229 0012

L_6CD8:
        JSR     R5,     L_6251                  ; 6CD8   0004 0160 0251

        PULR    R7                              ; 6CDB   02B7

        PSHR    R5                              ; 6CDC   0275
        CMP@    R3,     R0                      ; 6CDD   0358
        BEQ     L_6CF7                          ; 6CDE   0204 0017

        CMPI    #$000B, R0                      ; 6CE0   0378 000B
        BNEQ    L_6CF7                          ; 6CE2   020C 0013

        MVI     G_0149, R0                      ; 6CE4   0280 0149
        CMPI    #$000A, R0                      ; 6CE6   0378 000A
        BEQ     L_6CF8                          ; 6CE8   0204 000E

        MVII    #$0003, R0                      ; 6CEA   02B8 0003
        MVO     R0,     G_0347                  ; 6CEC   0240 0347

        JSR     R5,     L_637B                  ; 6CEE   0004 0160 037B
        JSR     R5,     L_5C6C                  ; 6CF1   0004 015C 006C
        DECLE   $0004                           ; 6CF4   0004

        ANDR    R5,     R4                      ; 6CF5   01AC
        CMP@    R6,     R1                      ; 6CF6   0371
L_6CF7:
        PULR    R7                              ; 6CF7   02B7

L_6CF8:
        JSR     R5,     L_6DE7                  ; 6CF8   0004 016C 01E7

        PULR    R7                              ; 6CFB   02B7

        PSHR    R5                              ; 6CFC   0275
        MVI@    R3,     R1                      ; 6CFD   0299
        CMPI    #$00FF, R1                      ; 6CFE   0379 00FF
        BNEQ    L_6D40                          ; 6D00   020C 003E

        MVI     G_014F, R0                      ; 6D02   0280 014F
        DECR    R0                              ; 6D04   0010
        BEQ     L_6D37                          ; 6D05   0204 0030

        MVII    #$0001, R0                      ; 6D07   02B8 0001
        MVO     R0,     G_014F                  ; 6D09   0240 014F
        MVII    #$0020, R0                      ; 6D0B   02B8 0020
        MVO     R0,     G_011C                  ; 6D0D   0240 011C

        JSR     R5,     L_690B                  ; 6D0F   0004 0168 010B
        DECLE   $0332,  $001C,  $00A5,  $0333   ; 6D12   0332 001C 00A5 0333
        DECLE   $0022,  $00A5,  $0000           ; 6D16   0022 00A5 0000

        MVI     G_014C, R0                      ; 6D19   0280 014C
        ANDI    #$0077, R0                      ; 6D1B   03B8 0077
        ADDI    #$0088, R0                      ; 6D1D   02F8 0088
        MVO     R0,     G_014C                  ; 6D1F   0240 014C
        MVI     G_034D, R0                      ; 6D21   0280 034D
        NEGR    R0                              ; 6D23   0020
        MVO     R0,     G_033E                  ; 6D24   0240 033E
        MVII    #$004B, R0                      ; 6D26   02B8 004B
        MVO     R0,     G_033D                  ; 6D28   0240 033D
        MVII    #$0001, R0                      ; 6D2A   02B8 0001
        MVO     R0,     G_014A                  ; 6D2C   0240 014A
        MVII    #$0004, R0                      ; 6D2E   02B8 0004
        MVO     R0,     G_014B                  ; 6D30   0240 014B
        MVII    #$0003, R0                      ; 6D32   02B8 0003
        MVO     R0,     G_0148                  ; 6D34   0240 0148
        PULR    R7                              ; 6D36   02B7

L_6D37:
        MVI     G_033E, R0                      ; 6D37   0280 033E
        DECLE   $0080,  $0203,  $0005           ; 6D39   0080 0203 0005

        SUBI    #$000A, R0                      ; 6D3C   0338 000A
        MVO     R0,     G_033E                  ; 6D3E   0240 033E
L_6D40:
        PULR    R7                              ; 6D40   02B7

        DECLE   $0004                           ; 6D41   0004

        ANDR    R5,     R4                      ; 6D42   01AC
        CMP@    R6,     R1                      ; 6D43   0371
        PULR    R7                              ; 6D44   02B7

L_6D45:
        PSHR    R5                              ; 6D45   0275
        MVII    #$022A, R2                      ; 6D46   02BA 022A
        MOVR    R2,     R3                      ; 6D48   0093

L_6D49:
        JSR     R5,     L_6FDB                  ; 6D49   0004 016C 03DB

        PSHR    R0                              ; 6D4C   0270

        JSR     R5,     L_6D5A                  ; 6D4D   0004 016C 015A

        PULR    R0                              ; 6D50   02B0
        SLR     R0,     2                       ; 6D51   0064
        SLR     R0,     2                       ; 6D52   0064
        SLR     R0,     1                       ; 6D53   0060

        JSR     R5,     L_6D5A                  ; 6D54   0004 016C 015A

        BNEQ    L_6D49                          ; 6D57   022C 000F
        PULR    R7                              ; 6D59   02B7

L_6D5A:
        PSHR    R5                              ; 6D5A   0275
        ANDI    #$001F, R0                      ; 6D5B   03B8 001F
        MOVR    R0,     R1                      ; 6D5D   0081
        SUBI    #$001A, R1                      ; 6D5E   0339 001A
        BPL     L_6D6B                          ; 6D60   0203 0009

        ADDI    #$0041, R0                      ; 6D62   02F8 0041
L_6D64:
        SLL     R0,     2                       ; 6D64   004C
        SLL     R0,     1                       ; 6D65   0048
        XORI    #$0003, R0                      ; 6D66   03F8 0003
L_6D68:
        MVO@    R0,     R3                      ; 6D68   0258
        INCR    R3                              ; 6D69   000B
        PULR    R7                              ; 6D6A   02B7

L_6D6B:
        INCR    R1                              ; 6D6B   0009
        ADDR    R7,     R1                      ; 6D6C   00F9
        ADD@    R1,     R7                      ; 6D6D   02CF

        DECLE   $0004                           ; 6D6E   0004

        SETC                                    ; 6D6F   0007
        INCR    R4                              ; 6D70   000C
        DECR    R0                              ; 6D71   0010
        CLRR    R0                              ; 6D72   01C0
        B       L_6D68                          ; 6D73   0220 000C

        MVII    #$000A, R0                      ; 6D75   02B8 000A
        DECR    R3                              ; 6D77   0013
        B       L_6D64                          ; 6D78   0220 0015

        ADDI    #$0014, R2                      ; 6D7A   02FA 0014
        MOVR    R2,     R3                      ; 6D7C   0093
        PULR    R7                              ; 6D7D   02B7

        CLRR    R0                              ; 6D7E   01C0
        PULR    R7                              ; 6D7F   02B7

L_6D80:
        PSHR    R5                              ; 6D80   0275
        MVI     G_0144, R0                      ; 6D81   0280 0144
        MVI     G_0145, R3                      ; 6D83   0283 0145
        TSTR    R0                              ; 6D85   0080
        BNEQ    L_6D8B                          ; 6D86   020C 0003

        TSTR    R3                              ; 6D88   009B
        BEQ     L_6DB4                          ; 6D89   0204 0029

L_6D8B:
        MVII    #$0064, R1                      ; 6D8B   02B9 0064

        JSR     R5,     X_MPY                   ; 6D8D   0004 011C 01DC

        ADDR    R3,     R2                      ; 6D90   00DA
        MOVR    R2,     R0                      ; 6D91   0090
        MVI     G_0149, R5                      ; 6D92   0285 0149
        ADDR    R5,     R5                      ; 6D94   00ED
        ADDR    R5,     R5                      ; 6D95   00ED
        SDBD                                    ; 6D96   0001
        ADDI    #$A668, R5                      ; 6D97   02FD 0068 00A6
        SDBD                                    ; 6D9A   0001
        MVI@    R5,     R1                      ; 6D9B   02A9
        PSHR    R5                              ; 6D9C   0275

        JSR     R5,     L_6DB5                  ; 6D9D   0004 016C 01B5
        JSR     R5,     L_6DDF                  ; 6DA0   0004 016C 01DF

        PULR    R5                              ; 6DA3   02B5
        SDBD                                    ; 6DA4   0001
        ADD@    R5,     R0                      ; 6DA5   02E8
        TSTR    R0                              ; 6DA6   0080
        BPL     L_6DAA                          ; 6DA7   0203 0001

        CLRR    R0                              ; 6DA9   01C0
L_6DAA:
        SDBD                                    ; 6DAA   0001
        CMPI    #$07D0, R0                      ; 6DAB   0378 00D0 0007
        BLE     L_6DB4                          ; 6DAE   0206 0004

        SDBD                                    ; 6DB0   0001
        MVII    #$07D0, R0                      ; 6DB1   02B8 00D0 0007
L_6DB4:
        PULR    R7                              ; 6DB4   02B7

L_6DB5:
        PSHR    R5                              ; 6DB5   0275
        CLRR    R3                              ; 6DB6   01DB
        TSTR    R0                              ; 6DB7   0080
        BPL     L_6DBC                          ; 6DB8   0203 0002

        INCR    R3                              ; 6DBA   000B
        NEGR    R0                              ; 6DBB   0020
L_6DBC:
        TSTR    R1                              ; 6DBC   0089
        BPL     L_6DC1                          ; 6DBD   0203 0002

        DECR    R3                              ; 6DBF   0013
        NEGR    R1                              ; 6DC0   0021
L_6DC1:
        CLRR    R2                              ; 6DC1   01D2
        CLRR    R4                              ; 6DC2   01E4
        CLRR    R5                              ; 6DC3   01ED
        TSTR    R0                              ; 6DC4   0080
        BEQ     L_6DDC                          ; 6DC5   0204 0015

        TSTR    R1                              ; 6DC7   0089
        BEQ     L_6DDC                          ; 6DC8   0204 0012

L_6DCA:
        SARC    R0,     1                       ; 6DCA   0078
        BNC     L_6DD1                          ; 6DCB   0209 0004

        CLRC                                    ; 6DCD   0006
        ADDR    R1,     R4                      ; 6DCE   00CC
        ADCR    R5                              ; 6DCF   002D
        ADDR    R2,     R5                      ; 6DD0   00D5
L_6DD1:
        CLRC                                    ; 6DD1   0006
        SLLC    R1,     1                       ; 6DD2   0059
        RLC     R2,     1                       ; 6DD3   0052
        TSTR    R0                              ; 6DD4   0080
        BNEQ    L_6DCA                          ; 6DD5   022C 000C

        TSTR    R3                              ; 6DD7   009B
        BEQ     L_6DDC                          ; 6DD8   0204 0002

        NEGR    R4                              ; 6DDA   0024
        COMR    R5                              ; 6DDB   001D
L_6DDC:
        MOVR    R4,     R0                      ; 6DDC   00A0
        MOVR    R5,     R1                      ; 6DDD   00A9
        PULR    R7                              ; 6DDE   02B7

L_6DDF:
        SWAP    R0,     1                       ; 6DDF   0040
        ANDI    #$00FF, R0                      ; 6DE0   03B8 00FF
        ANDI    #$00FF, R1                      ; 6DE2   03B9 00FF
        SWAP    R1,     1                       ; 6DE4   0041
        XORR    R1,     R0                      ; 6DE5   01C8
        MOVR    R5,     R7                      ; 6DE6   00AF

L_6DE7:
        PSHR    R5                              ; 6DE7   0275
        MVII    #$000A, R0                      ; 6DE8   02B8 000A
        MVO     R0,     G_0347                  ; 6DEA   0240 0347
        CLRR    R0                              ; 6DEC   01C0
        MVO     R0,     G_0149                  ; 6DED   0240 0149
        SDBD                                    ; 6DEF   0001
        MVII    #$AF6A, R0                      ; 6DF0   02B8 006A 00AF
        MVO     R0,     G_0343                  ; 6DF3   0240 0343

        JSR     R5,     L_6E70                  ; 6DF5   0004 016C 0270
        DECLE   $0000                           ; 6DF8   0000
L_6DF9:
        MVII    #$013F, R0                      ; 6DF9   02B8 013F
        MVO     R0,     G_0346                  ; 6DFB   0240 0346
        PULR    R7                              ; 6DFD   02B7

        PSHR    R5                              ; 6DFE   0275
        MVI     G_0346, R0                      ; 6DFF   0280 0346
        CMPI    #$0140, R0                      ; 6E01   0378 0140
        BLT     L_6E2A                          ; 6E03   0205 0025

        MVI     G_0149, R0                      ; 6E05   0280 0149
        CMPI    #$000A, R0                      ; 6E07   0378 000A
        BNEQ    L_6E0E                          ; 6E09   020C 0003

        CLRR    R0                              ; 6E0B   01C0
        MVO     R0,     G_0149                  ; 6E0C   0240 0149
L_6E0E:
        CLRR    R0                              ; 6E0E   01C0
        MVO     R0,     G_0346                  ; 6E0F   0240 0346

        JSR     R5,     L_62B2                  ; 6E11   0004 0160 02B2

        MVII    #$0002, R3                      ; 6E14   02BB 0002
        MVII    #$02DF, R4                      ; 6E16   02BC 02DF

        JSR     R5,     X_PRINT_R5              ; 6E18   0004 0118 007B
        STRING  " Final Scores "                ; 6E1B  
        DECLE   $0000                           ; 6E29   0000
L_6E2A:
        PULR    R7                              ; 6E2A   02B7

        CMPI    #$00FF, R0                      ; 6E2B   0378 00FF
        BNEQ    L_6E32                          ; 6E2D   020C 0003
        J       .TITLECODE                      ; 6E2F   0004 0350 0011
L_6E32:
        MOVR    R5,     R7                      ; 6E32   00AF

        MVI@    R1,     R0                      ; 6E33   0288
        CMPI    #$00FF, R0                      ; 6E34   0378 00FF
        BEQ     L_6DF9                          ; 6E36   0224 003E
        MOVR    R5,     R7                      ; 6E38   00AF

        DECLE   $01F0,  $01F1,  $01F2,  $01C8   ; 6E39   01F0 01F1 01F2 01C8
        DECLE   $01CA,  $01CC,  $01C0,  $01C1   ; 6E3D   01CA 01CC 01C0 01C1
        DECLE   $01F3,  $01FA,  $01C2,  $01C3   ; 6E41   01F3 01FA 01C2 01C3
        DECLE   $01C4,  $01C5,  $01C6,  $01C7   ; 6E45   01C4 01C5 01C6 01C7
        DECLE   $01F8,  $01F8,  $01BC,  $01BD   ; 6E49   01F8 01F8 01BC 01BD
        DECLE   $01BE,  $01BF                   ; 6E4D   01BE 01BF

        ANDR    R7,     R2                      ; 6E4F   01BA
        SLLC    R1,     2                       ; 6E50   005D
        INCR    R5                              ; 6E51   000D
        MOVR    R3,     R4                      ; 6E52   009C
        INCR    R4                              ; 6E53   000C
        ADDR    R4,     R7                      ; 6E54   00E7

        INCR    R3                              ; 6E55   000B
        RSWD    R4                              ; 6E56   003C
        INCR    R3                              ; 6E57   000B
        TSTR    R3                              ; 6E58   009B
        INCR    R2                              ; 6E59   000A
        EIS                                     ; 6E5A   0002
        INCR    R2                              ; 6E5B   000A
        RRC     R3,     1                       ; 6E5C   0073
        INCR    R1                              ; 6E5D   0009
        ADDR    R5,     R3                      ; 6E5E   00EB
        INCR    R0                              ; 6E5F   0008
        SAR     R3,     1                       ; 6E60   006B
        INCR    R0                              ; 6E61   0008
        ADDR    R6,     R2                      ; 6E62   00F2
        SETC                                    ; 6E63   0007
        TSTR    R0                              ; 6E64   0080
        SETC                                    ; 6E65   0007
        DECR    R4                              ; 6E66   0014
        SETC                                    ; 6E67   0007
        INCR    R0                              ; 6E68   0008
        INCR    R4                              ; 6E69   000C
        DECR    R0                              ; 6E6A   0010
        COMR    R0                              ; 6E6B   0018
        NEGR    R0                              ; 6E6C   0020
        GSWD    R0                              ; 6E6D   0030
        SWAP    R0,     1                       ; 6E6E   0040
        SLR     R0,     1                       ; 6E6F   0060
L_6E70:
        MVI@    R5,     R0                      ; 6E70   02A8
L_6E71:
        PSHR    R5                              ; 6E71   0275
        SDBD                                    ; 6E72   0001
        MVII    #$AFC3, R5                      ; 6E73   02BD 00C3 00AF
        ADDR    R0,     R5                      ; 6E76   00C5
        MVI@    R5,     R2                      ; 6E77   02AA
        CMP     G_01BB, R2                      ; 6E78   0342 01BB
        BLT     L_6E95                          ; 6E7A   0205 0019
        BGT     L_6E82                          ; 6E7C   020E 0004

        SARC    R2,     1                       ; 6E7E   007A
        BC      L_6E95                          ; 6E7F   0201 0014

        RLC     R2,     1                       ; 6E81   0052
L_6E82:
        SDBD                                    ; 6E82   0001
        MVI@    R5,     R3                      ; 6E83   02AB
        MVII    #$0018, R0                      ; 6E84   02B8 0018
        MVII    #$01BA, R4                      ; 6E86   02BC 01BA

        JSR     R5,     X_FILL_ZERO             ; 6E88   0004 0114 0338

        MVO     R1,     G_01BC                  ; 6E8B   0241 01BC
        MVO     R2,     G_01BB                  ; 6E8D   0242 01BB
        MVO     R3,     G_0352                  ; 6E8F   0243 0352
        MVII    #$0001, R0                      ; 6E91   02B8 0001
        MVO     R0,     G_01BA                  ; 6E93   0240 01BA
L_6E95:
        PULR    R7                              ; 6E95   02B7

L_6E96:
        PSHR    R5                              ; 6E96   0275
        MVI     G_01BA, R0                      ; 6E97   0280 01BA
        DECR    R0                              ; 6E99   0010
        BMI     L_6E95                          ; 6E9A   022B 0006

        MVO     R0,     G_01BA                  ; 6E9C   0240 01BA
        BNEQ    L_6EA7                          ; 6E9E   020C 0007

        MVI     G_0352, R4                      ; 6EA0   0284 0352

        JSR     R5,     L_6EF8                  ; 6EA2   0004 016C 02F8

        MVO     R4,     G_0352                  ; 6EA5   0244 0352
L_6EA7:
        MVII    #$01F4, R3                      ; 6EA7   02BB 01F4
        MVII    #$01C8, R5                      ; 6EA9   02BD 01C8
L_6EAB:
        MVI@    R3,     R0                      ; 6EAB   0298
        ANDI    #$000F, R0                      ; 6EAC   03B8 000F
        SUBI    #$0004, R3                      ; 6EAE   033B 0004
        SWAP    R0,     1                       ; 6EB0   0040
        ADD@    R3,     R0                      ; 6EB1   02D8
        SDBD                                    ; 6EB2   0001
        ADD@    R5,     R0                      ; 6EB3   02E8
        MOVR    R3,     R4                      ; 6EB4   009C
        ADDI    #$0004, R3                      ; 6EB5   02FB 0004
        MOVR    R0,     R1                      ; 6EB7   0081
        SWAP    R1,     1                       ; 6EB8   0041
        MVO@    R0,     R4                      ; 6EB9   0260
        MVO@    R1,     R3                      ; 6EBA   0259
        INCR    R3                              ; 6EBB   000B
        CMPI    #$01F7, R3                      ; 6EBC   037B 01F7
        BNEQ    L_6EAB                          ; 6EBE   022C 0014

        MVI     G_01C0, R0                      ; 6EC0   0280 01C0
        MOVR    R0,     R1                      ; 6EC2   0081
        SLR     R0,     2                       ; 6EC3   0064
        SLR     R0,     1                       ; 6EC4   0060
        ADD     G_01C1, R1                      ; 6EC5   02C1 01C1
        MVO     R0,     .PSG0.noise             ; 6EC7   0240 01F9
        MVO     R1,     G_01C0                  ; 6EC9   0241 01C0
        MVII    #$01CE, R2                      ; 6ECB   02BA 01CE
        MVII    #$01C5, R3                      ; 6ECD   02BB 01C5
        MVII    #$01C2, R4                      ; 6ECF   02BC 01C2
        MVII    #$01FB, R5                      ; 6ED1   02BD 01FB
L_6ED3:
        MVI@    R2,     R0                      ; 6ED3   0290
        DECR    R0                              ; 6ED4   0010
        BMI     L_6EDF                          ; 6ED5   020B 0008

        MVO@    R0,     R2                      ; 6ED7   0250
        BNEQ    L_6EDF                          ; 6ED8   020C 0005

        SDBD                                    ; 6EDA   0001
        MVII    #$FFFA, R0                      ; 6EDB   02B8 00FA 00FF
        MVO@    R0,     R3                      ; 6EDE   0258
L_6EDF:
        MVI@    R4,     R0                      ; 6EDF   02A0
        CMPI    #$00FF, R0                      ; 6EE0   0378 00FF
        BEQ     L_6EF0                          ; 6EE2   0204 000C

        ADD@    R3,     R0                      ; 6EE4   02D8
        SWAP    R0,     2                       ; 6EE5   0044
        BPL     L_6EEA                          ; 6EE6   0203 0002

        CLRR    R0                              ; 6EE8   01C0
        MVO@    R0,     R3                      ; 6EE9   0258
L_6EEA:
        DECR    R4                              ; 6EEA   0014
        MVO@    R0,     R4                      ; 6EEB   0260
        SLR     R0,     2                       ; 6EEC   0064
        SLR     R0,     1                       ; 6EED   0060
        ANDI    #$000F, R0                      ; 6EEE   03B8 000F
L_6EF0:
        MVO@    R0,     R5                      ; 6EF0   0268
        INCR    R2                              ; 6EF1   000A
        INCR    R3                              ; 6EF2   000B
        CMPI    #$01FE, R5                      ; 6EF3   037D 01FE
        BNEQ    L_6ED3                          ; 6EF5   022C 0023
        PULR    R7                              ; 6EF7   02B7

L_6EF8:
        PSHR    R5                              ; 6EF8   0275
        MVI     G_01D1, R0                      ; 6EF9   0280 01D1
        TSTR    R0                              ; 6EFB   0080
        BNEQ    L_6F70                          ; 6EFC   020C 0072

L_6EFE:
        JSR     R5,     L_6FDB                  ; 6EFE   0004 016C 03DB

        MOVR    R0,     R2                      ; 6F01   0082
        MOVR    R2,     R3                      ; 6F02   0093
        ANDI    #$001F, R3                      ; 6F03   03BB 001F
        MOVR    R3,     R5                      ; 6F05   009D
        SDBD                                    ; 6F06   0001
        ADDI    #$6E39, R3                      ; 6F07   02FB 0039 006E
        MVI@    R3,     R3                      ; 6F0A   029B
        INCR    R5                              ; 6F0B   000D
        ADDR    R7,     R5                      ; 6F0C   00FD
        ADD@    R5,     R7                      ; 6F0D   02EF

        DECLE   $0018,  $0018,  $0018,  $001C   ; 6F0E   0018 0018 0018 001C
        DECLE   $001C,  $001C,  $002F,  $002F   ; 6F12   001C 001C 002F 002F
        DECLE   $0018,  $002F,  $0027,  $0027   ; 6F16   0018 002F 0027 0027
        DECLE   $0027,  $002F,  $002F,  $002F   ; 6F1A   0027 002F 002F 002F
        DECLE   $002F,  $0050,  $0035,  $0035   ; 6F1E   002F 0050 0035 0035
        DECLE   $0035,  $0035                   ; 6F22   0035 0035

        SWAP    R2,     2                       ; 6F24   0046
        SLLC    R2,     1                       ; 6F25   005A
        MVII    #$0004, R1                      ; 6F26   02B9 0004
        B       L_6F2C                          ; 6F28   0200 0002

        MVII    #$0001, R1                      ; 6F2A   02B9 0001

L_6F2C:
        JSR     R5,     L_6FCA                  ; 6F2C   0004 016C 03CA

        MVO@    R0,     R3                      ; 6F2F   0258
        SWAP    R0,     1                       ; 6F30   0040
        ADDR    R1,     R3                      ; 6F31   00CB
        MVO@    R0,     R3                      ; 6F32   0258
        B       L_6EFE                          ; 6F33   0220 0036

        ANDI    #$0020, R2                      ; 6F35   03BA 0020
        BEQ     L_6F3D                          ; 6F37   0204 0004

        MVII    #$00FF, R0                      ; 6F39   02B8 00FF
        B       L_6F40                          ; 6F3B   0200 0003

L_6F3D:
        JSR     R5,     L_6FDB                  ; 6F3D   0004 016C 03DB

L_6F40:
        MVO@    R0,     R3                      ; 6F40   0258
        B       L_6EFE                          ; 6F41   0220 0044

        ANDI    #$0020, R2                      ; 6F43   03BA 0020
        BEQ     L_6F3D                          ; 6F45   0224 0009

        JSR     R5,     L_6FCA                  ; 6F47   0004 016C 03CA

        MVI@    R3,     R5                      ; 6F4A   029D
        DECR    R5                              ; 6F4B   0015
        BMI     L_6F51                          ; 6F4C   020B 0003

        MVO@    R5,     R3                      ; 6F4E   025D
        BEQ     L_6EFE                          ; 6F4F   0224 0052

L_6F51:
        MOVR    R0,     R4                      ; 6F51   0084
        B       L_6EFE                          ; 6F52   0220 0055

        JSR     R5,     L_6FDB                  ; 6F54   0004 016C 03DB

        MVO@    R0,     R3                      ; 6F57   0258
        TSTR    R0                              ; 6F58   0080
        BNEQ    L_6F5D                          ; 6F59   020C 0002

L_6F5B:
        MVO     R0,     G_01BB                  ; 6F5B   0240 01BB
L_6F5D:
        PULR    R7                              ; 6F5D   02B7

L_6F5E:
        CLRR    R0                              ; 6F5E   01C0
        MVO     R0,     G_01C2                  ; 6F5F   0240 01C2
        MVO     R0,     G_01C3                  ; 6F61   0240 01C3
        NOP                                     ; 6F63   0034
        MVO     R0,     G_01C4                  ; 6F64   0240 01C4
        B       L_6F5B                          ; 6F66   0220 000C

        MVII    #$0001, R0                      ; 6F68   02B8 0001
        MVO     R0,     G_01D1                  ; 6F6A   0240 01D1
        MVII    #$0038, R0                      ; 6F6C   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 6F6E   0240 01F8

L_6F70:
        JSR     R5,     L_6FDB                  ; 6F70   0004 016C 03DB

        MOVR    R0,     R1                      ; 6F73   0081
        ANDI    #$003F, R1                      ; 6F74   03B9 003F
        CMPI    #$003F, R1                      ; 6F76   0379 003F
        BGE     L_6F5E                          ; 6F78   022D 001B

        MOVR    R0,     R2                      ; 6F7A   0082
        SLL     R2,     2                       ; 6F7B   004E
        SWAP    R2,     1                       ; 6F7C   0042
        ANDI    #$0007, R2                      ; 6F7D   03BA 0007
        SDBD                                    ; 6F7F   0001
        ADDI    #$6E68, R2                      ; 6F80   02FA 0068 006E
        MVI@    R2,     R2                      ; 6F83   0292
        MVO     R2,     G_01BA                  ; 6F84   0242 01BA
        TSTR    R1                              ; 6F86   0089
        BEQ     L_6FC5                          ; 6F87   0204 003C

        MVII    #$01CE, R3                      ; 6F89   02BB 01CE
L_6F8B:
        MVI@    R3,     R2                      ; 6F8B   029A
        TSTR    R2                              ; 6F8C   0092
        BEQ     L_6F96                          ; 6F8D   0204 0007

        INCR    R3                              ; 6F8F   000B
        CMPI    #$01D1, R3                      ; 6F90   037B 01D1
        BNEQ    L_6F8B                          ; 6F92   022C 0008
        B       L_6FC5                          ; 6F94   0200 002F

L_6F96:
        MVI     G_01BA, R1                      ; 6F96   0281 01BA
        SUBI    #$0003, R1                      ; 6F98   0339 0003
        BPL     L_6F9D                          ; 6F9A   0203 0001

        CLRR    R1                              ; 6F9C   01C9
L_6F9D:
        MVO@    R1,     R3                      ; 6F9D   0259
        SUBI    #$000C, R3                      ; 6F9E   033B 000C
        MVII    #$0060, R1                      ; 6FA0   02B9 0060
        MVO@    R1,     R3                      ; 6FA2   0259
        ADDI    #$0003, R3                      ; 6FA3   02FB 0003
        CLRR    R1                              ; 6FA5   01C9
        MVO@    R1,     R3                      ; 6FA6   0259
        ADDI    #$002B, R3                      ; 6FA7   02FB 002B
        MOVR    R0,     R5                      ; 6FA9   0085
        ANDI    #$003F, R5                      ; 6FAA   03BD 003F
        CLRR    R1                              ; 6FAC   01C9
L_6FAD:
        INCR    R1                              ; 6FAD   0009
        SUBI    #$000C, R5                      ; 6FAE   033D 000C
        BPL     L_6FAD                          ; 6FB0   0223 0004

        ADDI    #$000C, R5                      ; 6FB2   02FD 000C
        ADDR    R5,     R5                      ; 6FB4   00ED
        SDBD                                    ; 6FB5   0001
        ADDI    #$6E50, R5                      ; 6FB6   02FD 0050 006E
        SDBD                                    ; 6FB9   0001
        MVI@    R5,     R2                      ; 6FBA   02AA
L_6FBB:
        SARC    R2,     1                       ; 6FBB   007A
        ADCR    R2                              ; 6FBC   002A
        DECR    R1                              ; 6FBD   0011
        BNEQ    L_6FBB                          ; 6FBE   022C 0004

        MVO@    R2,     R3                      ; 6FC0   025A
        SWAP    R2,     1                       ; 6FC1   0042
        ADDI    #$0004, R3                      ; 6FC2   02FB 0004
        MVO@    R2,     R3                      ; 6FC4   025A
L_6FC5:
        ANDI    #$0200, R0                      ; 6FC5   03B8 0200
        BEQ     L_6F70                          ; 6FC7   0224 0058
        PULR    R7                              ; 6FC9   02B7

L_6FCA:
        PSHR    R5                              ; 6FCA   0275
        PSHR    R1                              ; 6FCB   0271
        MVII    #$0008, R5                      ; 6FCC   02BD 0008
        CLRR    R0                              ; 6FCE   01C0
L_6FCF:
        SLR     R0,     2                       ; 6FCF   0064
        MVI@    R4,     R1                      ; 6FD0   02A1
        ANDI    #$0300, R1                      ; 6FD1   03B9 0300
        SLR     R1,     2                       ; 6FD3   0065
        SWAP    R1,     1                       ; 6FD4   0041
        XORR    R1,     R0                      ; 6FD5   01C8
        DECR    R5                              ; 6FD6   0015
        BNEQ    L_6FCF                          ; 6FD7   022C 0009

        PULR    R1                              ; 6FD9   02B1
        PULR    R7                              ; 6FDA   02B7

L_6FDB:
        PSHR    R5                              ; 6FDB   0275
        PSHR    R1                              ; 6FDC   0271
        MVII    #$0005, R5                      ; 6FDD   02BD 0005
        CLRR    R0                              ; 6FDF   01C0
L_6FE0:
        SLR     R0,     2                       ; 6FE0   0064
        MVI@    R4,     R1                      ; 6FE1   02A1
        ANDI    #$0300, R1                      ; 6FE2   03B9 0300
        XORR    R1,     R0                      ; 6FE4   01C8
        DECR    R5                              ; 6FE5   0015
        BNEQ    L_6FE0                          ; 6FE6   022C 0007

        PULR    R1                              ; 6FE8   02B1
        PULR    R7                              ; 6FE9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000

        RLC     R2,     2                       ; D000   0056
        RLC     R2,     2                       ; D001   0056
        CMPR    R2,     R6                      ; D002   0156
        RLC     R2,     2                       ; D003   0056
        RLC     R2,     2                       ; D004   0056
        CMP@    R2,     R6                      ; D005   0356
        CMPR    R2,     R6                      ; D006   0156
        MVO@    R6,     R2                      ; D007   0256
        SAR     R2,     1                       ; D008   006A
        SAR     R2,     1                       ; D009   006A
        MVO@    R2,     R5                      ; D00A   026A
        CMPR    R5,     R2                      ; D00B   016A
        SAR     R2,     1                       ; D00C   006A
        SAR     R2,     1                       ; D00D   006A
        SAR     R2,     1                       ; D00E   006A
        SAR     R2,     1                       ; D00F   006A
        ADDI    #$02C7, R7                      ; D010   02FF 02C7

        DECLE   $039C,  $00B0,  $00A0,  $02E0   ; D012   039C 00B0 00A0 02E0
        DECLE   $00C0,  $00C0,  $00FF,  $00E3   ; D016   00C0 00C0 00FF 00E3
        DECLE   $0039,  $020D                   ; D01A   0039 020D

        SUBR    R0,     R5                      ; D01C   0105
        SUBR    R0,     R7                      ; D01D   0107

        DECLE   $0203,  $0003,  $00FF,  $0242   ; D01E   0203 0003 00FF 0242
        DECLE   $0266,  $023C,  $003C,  $0066   ; D022   0266 023C 003C 0066
        DECLE   $0342,  $02FF,  $02FF,  $00C7   ; D026   0342 02FF 02FF 00C7
        DECLE   $009C,  $01B0,  $02A1,  $00E3   ; D02A   009C 01B0 02A1 00E3
        DECLE   $00C6,  $00CD,  $00FF           ; D02E   00C6 00CD 00FF

        ADDR    R4,     R3                      ; D031   00E3
        RSWD    R1                              ; D032   0039
        INCR    R5                              ; D033   000D
        MOVR    R0,     R5                      ; D034   0085
        ADD     G_0163, R7                      ; D035   02C7 0163

        ANDR    R6,     R3                      ; D037   01B3
        ADDR    R1,     R5                      ; D038   00CD
        ADDR    R0,     R6                      ; D039   00C6
        ADD@    R4,     R3                      ; D03A   02E3
        AND@    R4,     R1                      ; D03B   03A1
        ANDR    R6,     R0                      ; D03C   01B0
        MOVR    R3,     R4                      ; D03D   009C
        ADDR    R0,     R7                      ; D03E   00C7

        DECLE   $01FF                           ; D03F   01FF

        MOVR    R6,     R3                      ; D040   00B3
        CMPR    R4,     R3                      ; D041   0163
        ADDR    R0,     R7                      ; D042   00C7

        DECLE   $0085,  $000D,  $0039,  $01E3   ; D043   0085 000D 0039 01E3
        DECLE   $00FF,  $0000                   ; D047   00FF 0000

        SUB     .ISRVEC.0,R0                    ; D049   0300 0100
        ADDI    #$00FF, R7                      ; D04B   02FF 00FF

        DECLE   $0066,  $0266,  $0166,  $0066   ; D04D   0066 0266 0166 0066
        DECLE   $00E6,  $006E,  $0076,  $00CA   ; D051   00E6 006E 0076 00CA
        DECLE   $0264,  $00AA,  $00D4,  $0366   ; D055   0264 00AA 00D4 0366
        DECLE   $0167,  $0076,  $00EE,  $0053   ; D059   0167 0076 00EE 0053
        DECLE   $01A6,  $02D5,  $032B,  $03A5   ; D05D   01A6 02D5 032B 03A5
        DECLE   $0359,  $0094,  $0221,  $0084   ; D061   0359 0094 0221 0084
        DECLE   $0011,  $0000,  $0000,  $02A5   ; D065   0011 0000 0000 02A5
        DECLE   $019A,  $0229,  $0084,  $0221   ; D069   019A 0229 0084 0221
        DECLE   $0088,  $0000,  $0200,  $02FF   ; D06D   0088 0000 0200 02FF
        DECLE   $02FF,  $00FF,  $00FF,  $03FF   ; D071   02FF 00FF 00FF 03FF
        DECLE   $029B,  $0200,  $0000,  $00FF   ; D075   029B 0200 0000 00FF
        DECLE   $01FF,  $02FF,  $00FF,  $00FF   ; D079   01FF 02FF 00FF 00FF

        ADDR    R3,     R1                      ; D07D   00D9
        B       L_D380                          ; D07E   0200 0300

        DECLE   $0005,  $0032,  $0003,  $0218   ; D080   0005 0032 0003 0218
        DECLE   $0103,  $0110,  $0007,  $003A   ; D084   0103 0110 0007 003A
        DECLE   $0007,  $011E,  $0106,  $002A   ; D088   0007 011E 0106 002A
        DECLE   $0006,  $0322,  $0105,  $001E   ; D08C   0006 0322 0105 001E
        DECLE   $0005,  $0016,  $0300,  $010F   ; D090   0005 0016 0300 010F
        DECLE   $003A,  $00EA,  $00AA,  $02AA   ; D094   003A 00EA 00AA 02AA
        DECLE   $01AA,  $01FF,  $0000,  $00F0   ; D098   01AA 01FF 0000 00F0
        DECLE   $005C,  $0157,  $0155,  $0055   ; D09C   005C 0157 0155 0055
        DECLE   $0055,  $01FF,  $00FC,  $0157   ; D0A0   0055 01FF 00FC 0157
        DECLE   $0055,  $0055,  $0055,  $0055   ; D0A4   0055 0055 0055 0055
        DECLE   $0155,  $00FF,  $003F,  $00EA   ; D0A8   0155 00FF 003F 00EA
        DECLE   $02AA,  $03AA,  $00AA,  $00AA   ; D0AC   02AA 03AA 00AA 00AA
        DECLE   $00AA,  $00FF,  $00FF,  $00AD   ; D0B0   00AA 00FF 00FF 00AD
        DECLE   $00AE,  $01AC,  $02AC,  $02AC   ; D0B4   00AE 01AC 02AC 02AC
        DECLE   $00AC,  $00FF,  $00FF,  $00B5   ; D0B8   00AC 00FF 00FF 00B5
        DECLE   $0075,  $0135,  $0035,  $0035   ; D0BC   0075 0135 0035 0035
        DECLE   $0035,  $00FF,  $0200,  $02E0   ; D0C0   0035 00FF 0200 02E0
        DECLE   $02D0,  $0080,  $0080,  $00F0   ; D0C4   02D0 0080 0080 00F0
        DECLE   $00FC,  $00FF                   ; D0C8   00FC 00FF

        B       L_D0CC                          ; D0CA   0200 0000

L_D0CC:
        SUBR    R0,     R0                      ; D0CC   0100
        DECLE   $0000,  $0001,  $000F,  $023F   ; D0CD   0000 0001 000F 023F
        DECLE   $00FF,  $0000,  $00F0,  $02FF   ; D0D1   00FF 0000 00F0 02FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D0D5   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0200,  $020F,  $00FF   ; D0D9   00FF 0200 020F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D0DD   00FF 00FF 00FF 00FF
        DECLE   $02FF,  $0200,  $0000,  $00FF   ; D0E1   02FF 0200 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $02FF   ; D0E5   00FF 00FF 00FF 02FF
        DECLE   $01FF,  $00FF,  $034B,  $02B0   ; D0E9   01FF 00FF 034B 02B0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D0ED   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $02FF,  $01FF,  $00E8   ; D0F1   00FF 02FF 01FF 00E8
        DECLE   $0003,  $03BF,  $00FF,  $00FF   ; D0F5   0003 03BF 00FF 00FF
        DECLE   $00FF,  $003F,  $001F,  $020F   ; D0F9   00FF 003F 001F 020F
        DECLE   $0187,  $00C3,  $02E3,  $01C3   ; D0FD   0187 00C3 02E3 01C3
        DECLE   $0187                           ; D101   0187

        MOVR    R0,     R7                      ; D102   0087
        MOVR    R0,     R7                      ; D103   0087

        DECLE   $0201,  $0001,  $0001,  $0000   ; D104   0201 0001 0001 0000
        DECLE   $0000,  $0200,  $00FF,  $00FF   ; D108   0000 0200 00FF 00FF
        DECLE   $00F8,  $00E0,  $00C0,  $00C0   ; D10C   00F8 00E0 00C0 00C0
        DECLE   $0380,  $0080,  $000F,  $001F   ; D110   0380 0080 000F 001F
        DECLE   $001F,  $003F,  $023F,  $027F   ; D114   001F 003F 023F 027F
        DECLE   $007F,  $00FF,  $0000,  $0001   ; D118   007F 00FF 0000 0001
        DECLE   $0001                           ; D11C   0001

        SUBR    R0,     R3                      ; D11D   0103
        SUBR    R0,     R3                      ; D11E   0103
        SETC                                    ; D11F   0007
        SUB     .BTAB.0F,R7                     ; D120   0307 020F

        DECLE   $0000,  $0000,  $0000,  $0000   ; D122   0000 0000 0000 0000
        DECLE   $0001                           ; D126   0001

        SUBR    R0,     R7                      ; D127   0107
        SUBR    R3,     R7                      ; D128   011F

        DECLE   $007F,  $0001,  $0307,  $001F   ; D129   007F 0001 0307 001F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; D12D   007F 00FF 00FF 00FF
        DECLE   $01FF                           ; D131   01FF

        XORR    R6,     R0                      ; D132   01F0
        ADDR    R7,     R0                      ; D133   00F8
        ADDI    #$01FC, R0                      ; D134   02F8 01FC
        XORR    R7,     R4                      ; D136   01FC
        ADDR    R7,     R6                      ; D137   00FE
        ADDR    R7,     R6                      ; D138   00FE
        ADDI    #$0000, R7                      ; D139   02FF 0000

L_D13B:
        TSTR    R0                              ; D13B   0080
        DECLE   $0080,  $00C0,  $02C0,  $00E0   ; D13C   0080 00C0 02C0 00E0
        DECLE   $03E0,  $00F0,  $0000,  $0000   ; D140   03E0 00F0 0000 0000

        SUBR    R0,     R0                      ; D144   0100
        SUBR    R0,     R0                      ; D145   0100
        AND     .UART.0,R0                      ; D146   0380 00E0
        ADDR    R7,     R0                      ; D148   00F8
        XORR    R7,     R6                      ; D149   01FE
        MVI     G_01E0, R0                      ; D14A   0280 01E0
L_D14C:
        ADDR    R7,     R0                      ; D14C   00F8
        DECLE   $01FE,  $00FF,  $00FF,  $00FF   ; D14D   01FE 00FF 00FF 00FF
        DECLE   $00FF,  $0100,  $0000,  $005C   ; D151   00FF 0100 0000 005C
        DECLE   $03FF,  $01FF,  $03FF,  $00FF   ; D155   03FF 01FF 03FF 00FF
        DECLE   $00FF,  $0200,  $0100,  $00C0   ; D159   00FF 0200 0100 00C0
        DECLE   $00F8,  $00FC,  $00FC,  $02FE   ; D15D   00F8 00FC 00FC 02FE
        DECLE   $01FE,  $0100,  $0000,  $0303   ; D161   01FE 0100 0000 0303
        DECLE   $011F,  $003F,  $003F,  $007F   ; D165   011F 003F 003F 007F
        DECLE   $007F,  $0003,  $0332,  $0303   ; D169   007F 0003 0332 0303
        DECLE   $033A,  $0005,  $023A,  $0006   ; D16D   033A 0005 023A 0006
        DECLE   $0022,  $0005,  $002C,  $0305   ; D171   0022 0005 002C 0305
        DECLE   $0028,  $0106,  $002A,  $0105   ; D175   0028 0106 002A 0105
        DECLE   $0024,  $00BF,  $02FF,  $027F   ; D179   0024 00BF 02FF 027F
        DECLE   $027F,  $007F,  $003F,  $013F   ; D17D   027F 007F 003F 013F
        DECLE   $023F,  $003F,  $003F,  $003F   ; D181   023F 003F 003F 003F
        DECLE   $023F,  $033F,  $007F,  $007F   ; D185   023F 033F 007F 007F
        DECLE   $007F,  $0207,  $0100,  $0100   ; D189   007F 0207 0100 0100
        DECLE   $00E0,  $00FF,  $02FF,  $00FF   ; D18D   00E0 00FF 02FF 00FF
        DECLE   $01FF,  $00F8,  $0000,  $0200   ; D191   01FF 00F8 0000 0200
        DECLE   $0000,  $0187,  $0087,  $000F   ; D195   0000 0187 0087 000F
        DECLE   $023F,  $0000,  $0000,  $0000   ; D199   023F 0000 0000 0000
        DECLE   $0000,  $0280,  $00C0,  $03E0   ; D19D   0000 0280 00C0 03E0
        DECLE   $00F0,  $00F8,  $03FE,  $01FF   ; D1A1   00F0 00F8 03FE 01FF
        DECLE   $03FF,  $00FF,  $02FF,  $00FF   ; D1A5   03FF 00FF 02FF 00FF
        DECLE   $017F,  $027F,  $007F,  $003F   ; D1A9   017F 027F 007F 003F

        SUBR    R3,     R7                      ; D1AD   011F
        INCR    R7                              ; D1AE   000F

        SETC                                    ; D1AF   0007
L_D1B0:
        SUB     .ISRVEC.0,R1                    ; D1B0   0301 0100
        DECLE   $03FF,  $00FF,  $00FE,  $02FC   ; D1B2   03FF 00FF 00FE 02FC
        DECLE   $01F0,  $0080,  $0000,  $0000   ; D1B6   01F0 0080 0000 0000
        DECLE   $0000,  $0000,  $0100,  $0001   ; D1BA   0000 0000 0100 0001
        DECLE   $0007,  $020F,  $021F,  $007F   ; D1BE   0007 020F 021F 007F
        DECLE   $00FF,  $00FF,  $00FF,  $02FF   ; D1C2   00FF 00FF 00FF 02FF
        DECLE   $00FF,  $01FF,  $00FE,  $02F8   ; D1C6   00FF 01FF 00FE 02F8
        DECLE   $01F7,  $01FF,  $00EE,  $00FE   ; D1CA   01F7 01FF 00EE 00FE
        DECLE   $02DE,  $00FC,  $00DC,  $00EE   ; D1CE   02DE 00FC 00DC 00EE
        DECLE   $00FF,  $02FD,  $02FF,  $00FF   ; D1D2   00FF 02FD 02FF 00FF
        DECLE   $00FF,  $00FB,  $00FF,  $00FF   ; D1D6   00FF 00FB 00FF 00FF
        DECLE   $00FE,  $00FC,  $00F8,  $02D0   ; D1DA   00FE 00FC 00F8 02D0
        DECLE   $01E0,  $01C0,  $0080,  $0080   ; D1DE   01E0 01C0 0080 0080
        DECLE   $0200,  $0001,  $0003,  $000F   ; D1E2   0200 0001 0003 000F
        DECLE   $001F,  $023F,  $027F,  $007F   ; D1E6   001F 023F 027F 007F
        DECLE   $00E0,  $00C0,  $00C0,  $0280   ; D1EA   00E0 00C0 00C0 0280
        DECLE   $0380,  $0180,  $0000,  $0200   ; D1EE   0380 0180 0000 0200
        DECLE   $017F,  $01FF,  $00FF,  $00FF   ; D1F2   017F 01FF 00FF 00FF
        DECLE   $02FF,  $00FF,  $00FF,  $00FF   ; D1F6   02FF 00FF 00FF 00FF
        DECLE   $0000                           ; D1FA   0000

        B       L_D3FE                          ; D1FB   0200 0201
        ADDR    R0,     R7                      ; D1FD   00C7

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D1FE   00FF 00FF 00FF 00FF
        DECLE   $007F,  $007F,  $00FF,  $02FF   ; D202   007F 007F 00FF 02FF
        DECLE   $01FF,  $01FF,  $00FF,  $00FF   ; D206   01FF 01FF 00FF 00FF
        DECLE   $0200,  $00C0,  $00F0,  $00FF   ; D20A   0200 00C0 00F0 00FF
        DECLE   $00FF,  $02FF,  $02FF,  $00FF   ; D20E   00FF 02FF 02FF 00FF
        DECLE   $003F,  $00FF,  $00FF           ; D212   003F 00FF 00FF

        ADDI    #$02FC, R6                      ; D215   02FE 02FC
        XORR    R6,     R0                      ; D217   01F0
        ADDR    R0,     R0                      ; D218   00C0
        B       L_D419                          ; D219   0200 01FE

        DECLE   $01FF,  $00FF,  $007F,  $023F   ; D21B   01FF 00FF 007F 023F
        DECLE   $000F,  $0007,  $0001,  $0000   ; D21F   000F 0007 0001 0000
        DECLE   $0200,  $0280,  $0080,  $00D0   ; D223   0200 0280 0080 00D0
        DECLE   $00D0,  $00F0,  $00F1,  $007F   ; D227   00D0 00F0 00F1 007F
        DECLE   $003F,  $003F,  $023F,  $013F   ; D22B   003F 003F 023F 013F
        DECLE   $013F,  $007F,  $007F,  $02FF   ; D22F   013F 007F 007F 02FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D233   00FF 00FF 00FF 00FF
        DECLE   $02FF,  $02FF                   ; D237   02FF 02FF

        TSTR    R0                              ; D239   0080
        DIS                                     ; D23A   0003
        DIS                                     ; D23B   0003
        DIS                                     ; D23C   0003
        BUSC    L_D346                          ; D23D   0207 0107
        SUBR    R0,     R7                      ; D23F   0107
        INCR    R7                              ; D240   000F

        DECLE   $021F                           ; D241   021F
L_D242:
        CLRR    R0                              ; D242   01C0
        DECLE   $0180,  $0000,  $0000,  $0200   ; D243   0180 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D247   0000 0000 0000 00E0
        DECLE   $02E0,  $02E0,  $00E0,  $00E0   ; D24B   02E0 02E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; D24F   00E0 00E0 00E0 00E0
        DECLE   $00F0,  $00F0,  $02F0,  $01E0   ; D253   00F0 00F0 02F0 01E0
        DECLE   $01E0,  $00E0,  $00E0,  $0201   ; D257   01E0 00E0 00E0 0201
        DECLE   $0003,  $0003,  $0003,  $0001   ; D25B   0003 0003 0003 0001
        DECLE   $0201,  $0201,  $0001,  $003E   ; D25F   0201 0201 0001 003E
        DECLE   $003E,  $003E,  $023F,  $003F   ; D263   003E 003E 023F 003F
        DECLE   $013F,  $003F,  $023F           ; D267   013F 003F 023F

        SUBR    R3,     R7                      ; D26A   011F
        SUBR    R0,     R7                      ; D26B   0107

        DECLE   $0001,  $0000,  $0200,  $0000   ; D26C   0001 0000 0200 0000
        DECLE   $0000,  $0000,  $0000,  $0200   ; D270   0000 0000 0000 0200
        DECLE   $0200,  $0000,  $0000,  $0080   ; D274   0200 0000 0000 0080
        DECLE   $00E0,  $00F8,  $003F,  $001F   ; D278   00E0 00F8 003F 001F
        DECLE   $001E,  $021E,  $011E,  $013E   ; D27C   001E 021E 011E 013E
        DECLE   $003E,  $003E,  $0200,  $0000   ; D280   003E 003E 0200 0000
        DECLE   $0000,  $0000,  $0000,  $021E   ; D284   0000 0000 0000 021E
        DECLE   $023F,  $003F,  $007F,  $007F   ; D288   023F 003F 007F 007F
        DECLE   $007E,  $027E,  $037E,  $007E   ; D28C   007E 027E 037E 007E
        DECLE   $00FE,  $02FE,  $01FF,  $01FF   ; D290   00FE 02FE 01FF 01FF
        DECLE   $00FF,  $003E,  $0200,  $0000   ; D294   00FF 003E 0200 0000
        DECLE   $0000,  $0000,  $0003,  $023F   ; D298   0000 0000 0003 023F
        DECLE   $02FF,  $00F8,  $0000,  $0000   ; D29C   02FF 00F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2A0   0000 0000 0000 0000
        DECLE   $0000,  $02C0,  $01F0,  $01FF   ; D2A4   0000 02C0 01F0 01FF
        DECLE   $00FF,  $00FF,  $023F,  $001F   ; D2A8   00FF 00FF 023F 001F
        DECLE   $000F,  $0007,  $0000           ; D2AC   000F 0007 0000

        B       L_D2B1                          ; D2AF   0200 0000

L_D2B1:
        SUB     .PSG1.lft_hand,R0               ; D2B1   0300 00FF
        DECLE   $00FF,  $03FF,  $0180,  $0300   ; D2B3   00FF 03FF 0180 0300
        DECLE   $0000,  $0200,  $0000,  $01FF   ; D2B7   0000 0200 0000 01FF
        DECLE   $02FF,  $0101,  $0000,  $0100   ; D2BB   02FF 0101 0000 0100
        DECLE   $0000,  $0000,  $0200,  $0100   ; D2BF   0000 0000 0200 0100
        DECLE   $0100,  $0000,  $0000,  $0100   ; D2C3   0100 0000 0000 0100
        DECLE   $00C0,  $00FF,  $00FF,  $00F8   ; D2C7   00C0 00FF 00FF 00F8
        DECLE   $02F8,  $00F8,  $03FC,  $007E   ; D2CB   02F8 00F8 03FC 007E
        DECLE   $003E,  $010E,  $000E,  $0000   ; D2CF   003E 010E 000E 0000
        DECLE   $0300,  $0200,  $0000           ; D2D3   0300 0200 0000

        SUBR    R0,     R0                      ; D2D6   0100
        B       L_D3C9                          ; D2D7   0200 00F0

L_D2D9:
        ADDR    R6,     R0                      ; D2D9   00F0
        DECLE   $017E,  $0081,  $00BD,  $02A5   ; D2DA   017E 0081 00BD 02A5
        DECLE   $03A1,  $02BD,  $0081,  $007E   ; D2DE   03A1 02BD 0081 007E
        DECLE   $0000,  $0000,  $0006,  $0008   ; D2E2   0000 0000 0006 0008
        DECLE   $0000                           ; D2E6   0000

        COMR    R6                              ; D2E7   001E
        CLRC                                    ; D2E8   0006
        SUB@    R3,     R6                      ; D2E9   031E
        BLE     L_D31A                          ; D2EA   0206 002E

        SUBR    R0,     R3                      ; D2EC   0103
        INCR    R0                              ; D2ED   0008
        ADDR    R3,     R4                      ; D2EE   00DC
        ANDI    #$006C, R3                      ; D2EF   03BB 006C
        ADDR    R3,     R3                      ; D2F1   00DB
        MOVR    R5,     R1                      ; D2F2   00A9
        RLC     R2,     2                       ; D2F3   0056
        SUBI    #$005A, R5                      ; D2F4   033D 005A
        CMP@    R3,     R2                      ; D2F6   035A
        ANDI    #$036A, R4                      ; D2F7   03BC 036A
        AND@    R2,     R5                      ; D2F9   0395
        XOR@    R3,     R3                      ; D2FA   03DB
        SUB@    R6,     R6                      ; D2FB   0336
        ADD@    R3,     R5                      ; D2FC   02DD
        SUBR    R7,     R3                      ; D2FD   013B
        COMR    R3                              ; D2FE   001B
        TSTR    R5                              ; D2FF   00AD
        RLC     R2,     2                       ; D300   0056
        ADDR    R5,     R3                      ; D301   00EB
        ADD@    R3,     R7                      ; D302   02DF

        CMPR    R4,     R5                      ; D303   0165
        MOVR    R5,     R2                      ; D304   00AA
        SLLC    R2,     1                       ; D305   005A
        ADD@    R3,     R4                      ; D306   02DC
        MVII    #$006C, R3                      ; D307   02BB 006C
        ADDR    R3,     R3                      ; D309   00DB
        MOVR    R5,     R1                      ; D30A   00A9
        RLC     R2,     2                       ; D30B   0056
        RSWD    R5                              ; D30C   003D
        CMP@    R3,     R2                      ; D30D   035A
        SLLC    R2,     1                       ; D30E   005A
        RLC     R1,     2                       ; D30F   0055
        ANDR    R4,     R6                      ; D310   01A6
        XORI    #$0057, R3                      ; D311   03FB 0057
        ADDR    R5,     R2                      ; D313   00EA
        MOVR    R6,     R5                      ; D314   00B5
        ADD@    R3,     R0                      ; D315   02D8
        CMPR    R7,     R6                      ; D316   017E
        SLLC    R2,     1                       ; D317   005A
        COMR    R0                              ; D318   0018
        COMR    R0                              ; D319   0018
L_D31A:
        SUB@    R3,     R0                      ; D31A   0318
        DECLE   $0218,  $0018,  $0018,  $00AA   ; D31B   0218 0018 0018 00AA
        DECLE   $00FF,  $02DD,  $0255,  $0055   ; D31F   00FF 02DD 0255 0055
        DECLE   $0055,  $02FF,  $03FF           ; D323   0055 02FF 03FF

        SLLC    R0,     2                       ; D326   005C
        SARC    R3,     2                       ; D327   007F
        SAR     R0,     2                       ; D328   006C
        CMPR    R4,     R0                      ; D329   0160
        CMPR    R0,     R0                      ; D32A   0140
        SWAP    R0,     1                       ; D32B   0040
        SWAP    R0,     1                       ; D32C   0040
        SWAP    R0,     1                       ; D32D   0040
        B       L_D430                          ; D32E   0200 0100

        DECLE   $0100,  $0000,  $0000,  $0000   ; D330   0100 0000 0000 0000
        DECLE   $03A2,  $0075,  $0000,  $0000   ; D334   03A2 0075 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; D338   0300 0000 0000 0000
        DECLE   $0069,  $03B6,  $00FF,  $01FF   ; D33C   0069 03B6 00FF 01FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D340   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $01FF                   ; D344   00FF 01FF
L_D346:
        CMP@    R2,     R6                      ; D346   0356
        DECLE   $00FF,  $00FF,  $00FF,  $02FF   ; D347   00FF 00FF 00FF 02FF
        DECLE   $02FF,  $03FF,  $03FF,  $0366   ; D34B   02FF 03FF 03FF 0366
        DECLE   $02FF,  $03FF,  $00FF,  $00FF   ; D34F   02FF 03FF 00FF 00FF
        DECLE   $00FF,  $01FF,  $03FF,  $0300   ; D353   00FF 01FF 03FF 0300
        DECLE   $0301,  $0300,  $0202,  $0100   ; D357   0301 0300 0202 0100
        DECLE   $0104,  $0000,  $0008,  $006C   ; D35B   0104 0000 0008 006C
        DECLE   $007F,  $0179,  $0040,  $0040   ; D35F   007F 0179 0040 0040
        DECLE   $0240,  $0240,  $0040,  $005B   ; D363   0240 0240 0040 005B
        DECLE   $007E,  $007C,  $0070,  $0040   ; D367   007E 007C 0070 0040
        DECLE   $0040,  $0040,  $0340,  $0258   ; D36B   0040 0040 0340 0258
        DECLE   $007F,  $006E,  $0040,  $0040   ; D36F   007F 006E 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0076   ; D373   0040 0040 0040 0076
        DECLE   $027F,  $017C,  $0140,  $0040   ; D377   027F 017C 0140 0040
        DECLE   $0040,  $0340,  $0040,  $0278   ; D37B   0040 0340 0040 0278

        SARC    R0,     2                       ; D37F   007C
L_D380:
        SARC    R2,     2                       ; D380   007E
        DECLE   $025B,  $0040,  $0340,  $0040   ; D381   025B 0040 0340 0040
        DECLE   $0040,  $00FF,  $0200,  $01FF   ; D385   0040 00FF 0200 01FF
        DECLE   $0300,  $02FF,  $0000,  $01FF   ; D389   0300 02FF 0000 01FF

        B       L_D452                          ; D38D   0200 00C3

        SARC    R2,     2                       ; D38F   007E
        XORR    R0,     R3                      ; D390   01C3
        SARC    R2,     2                       ; D391   007E
        ADDR    R0,     R3                      ; D392   00C3
        CMPI    #$01C3, R6                      ; D393   037E 01C3
        CMPI    #$0000, R6                      ; D395   037E 0000
        DECR    R0                              ; D397   0010
        B       L_D5BA                          ; D398   0200 0220

        DECLE   $0000,  $0040,  $0000           ; D39A   0000 0040 0000

        TSTR    R0                              ; D39D   0080
        DIS                                     ; D39E   0003
        SUB@    R6,     R2                      ; D39F   0332
        SUBR    R0,     R2                      ; D3A0   0102
        RSWD    R2                              ; D3A1   003A
        SUBR    R0,     R7                      ; D3A2   0107

        SUBI    #$0006, R2                      ; D3A3   033A 0006
        RSWD    R2                              ; D3A5   003A
        DIS                                     ; D3A6   0003
        SUB@    R3,     R0                      ; D3A7   0318
        BPL     L_D6E4                          ; D3A8   0203 033A

        SUB     G_0318, R6                      ; D3AA   0306 0318
        BLE     L_D3D0                          ; D3AC   0206 0022

        SUBR    R0,     R4                      ; D3AE   0104
        ADCR    R2                              ; D3AF   002A
        CLRC                                    ; D3B0   0006
        SUBR    R3,     R6                      ; D3B1   011E
        SUBR    R0,     R7                      ; D3B2   0107

        ADCR    R4                              ; D3B3   002C
        CLRC                                    ; D3B4   0006
        INCR    R0                              ; D3B5   0008
        MVII    #$01AA, R3                      ; D3B6   02BB 01AA
        MOVR    R5,     R2                      ; D3B8   00AA
        MOVR    R5,     R2                      ; D3B9   00AA
        MOVR    R7,     R3                      ; D3BA   00BB
        MOVR    R5,     R0                      ; D3BB   00A8
        MOVR    R7,     R0                      ; D3BC   00B8
        MVII    #$01A8, R0                      ; D3BD   02B8 01A8
        MOVR    R5,     R0                      ; D3BF   00A8
        ADD@    R1,     R6                      ; D3C0   02CE
        ANDR    R5,     R2                      ; D3C1   01AA
        ANDR    R5,     R6                      ; D3C2   01AE
        MOVR    R5,     R2                      ; D3C3   00AA
        ADDR    R1,     R2                      ; D3C4   00CA
        XORR    R5,     R2                      ; D3C5   01EA
        MOVR    R1,     R2                      ; D3C6   008A
        ADDR    R5,     R6                      ; D3C7   00EE
        ADCR    R2                              ; D3C8   002A
L_D3C9:
        ADDR    R5,     R2                      ; D3C9   00EA
        ADD@    R5,     R6                      ; D3CA   02EE
        ANDR    R5,     R2                      ; D3CB   01AA
        ADDR    R5,     R4                      ; D3CC   00EC
        MOVR    R5,     R2                      ; D3CD   00AA
        ADDR    R5,     R2                      ; D3CE   00EA
        ADDR    R5,     R6                      ; D3CF   00EE
L_D3D0:
        MOVR    R5,     R2                      ; D3D0   00AA
        MOVR    R5,     R6                      ; D3D1   00AE
        MVI@    R5,     R2                      ; D3D2   02AA
        ADDR    R5,     R2                      ; D3D3   00EA
        ADD     G_01A0, R0                      ; D3D4   02C0 01A0
        ANDR    R4,     R0                      ; D3D6   01A0
        MOVR    R4,     R0                      ; D3D7   00A0
        ADDR    R0,     R0                      ; D3D8   00C0
        SUBR    R5,     R6                      ; D3D9   012E
        ADCR    R2                              ; D3DA   002A
        ADCR    R6                              ; D3DB   002E
        MOVR    R5,     R0                      ; D3DC   00A8
        ADDR    R5,     R1                      ; D3DD   00E9
        ADD@    R5,     R2                      ; D3DE   02EA
        MOVR    R1,     R2                      ; D3DF   008A
        XOR@    R5,     R6                      ; D3E0   03EE
        ADCR    R2                              ; D3E1   002A
        ADDR    R5,     R2                      ; D3E2   00EA
        ADD@    R5,     R6                      ; D3E3   02EE
        ANDR    R4,     R4                      ; D3E4   01A4
        AND@    R4,     R4                      ; D3E5   03A4
        MVI@    R4,     R4                      ; D3E6   02A4
        XOR@    R4,     R4                      ; D3E7   03E4
        INCR    R6                              ; D3E8   000E
        SUBR    R1,     R2                      ; D3E9   010A
        ADD@    R5,     R6                      ; D3EA   02EE
        SUBR    R1,     R0                      ; D3EB   0108
        INCR    R0                              ; D3EC   0008
        ANDR    R5,     R6                      ; D3ED   01AE
        TSTR    R4                              ; D3EE   00A4
        TSTR    R4                              ; D3EF   00A4
        TSTR    R4                              ; D3F0   00A4
        ADDR    R4,     R4                      ; D3F1   00E4
        ANDR    R5,     R6                      ; D3F2   01AE
        TSTR    R4                              ; D3F3   00A4
        ADDR    R4,     R4                      ; D3F4   00E4
        MVI@    R4,     R4                      ; D3F5   02A4
        ANDR    R5,     R6                      ; D3F6   01AE
        ADD@    R5,     R2                      ; D3F7   02EA
        MOVR    R1,     R2                      ; D3F8   008A
        MOVR    R5,     R6                      ; D3F9   00AE
        MOVR    R5,     R2                      ; D3FA   00AA
        ADDR    R5,     R2                      ; D3FB   00EA
        EIS                                     ; D3FC   0002
        EIS                                     ; D3FD   0002
L_D3FE:
        EIS                                     ; D3FE   0002
        DECLE   $000A,  $020E,  $00E0           ; D3FF   000A 020E 00E0

        MOVR    R4,     R0                      ; D402   00A0
        XOR@    R4,     R0                      ; D403   03E0
        ANDR    R0,     R0                      ; D404   0180
        MOVR    R2,     R0                      ; D405   0090
        ADDR    R5,     R6                      ; D406   00EE
        CMP@    R1,     R2                      ; D407   034A
        SLL     R0,     2                       ; D408   004C
        SLL     R2,     1                       ; D409   004A
        SLL     R2,     1                       ; D40A   004A
        MOVR    R7,     R2                      ; D40B   00BA
        MOVR    R5,     R2                      ; D40C   00AA
        MVII    #$00A2, R2                      ; D40D   02BA 00A2
        AND@    R4,     R3                      ; D40F   03A3
        RSWD    R0                              ; D410   0038
        NEGR    R0                              ; D411   0020
        RSWD    R0                              ; D412   0038
        NEGR    R0                              ; D413   0020
        MVII    #$012E, R0                      ; D414   02B8 012E
        ADCR    R2                              ; D416   002A
        ADCR    R6                              ; D417   002E
        MOVR    R5,     R0                      ; D418   00A8
L_D419:
        ADDR    R5,     R1                      ; D419   00E9
        MOVR    R5,     R2                      ; D41A   00AA
        MVI@    R5,     R2                      ; D41B   02AA
        ADD@    R5,     R2                      ; D41C   02EA
        MOVR    R5,     R2                      ; D41D   00AA
        MVI@    R5,     R6                      ; D41E   02AE
        ADD@    R5,     R4                      ; D41F   02EC
        MOVR    R5,     R2                      ; D420   00AA
        ADDR    R1,     R2                      ; D421   00CA
        MOVR    R5,     R2                      ; D422   00AA
        MOVR    R5,     R4                      ; D423   00AC
        MVI@    R1,     R6                      ; D424   028E
        AND@    R1,     R0                      ; D425   0388
        ANDR    R1,     R6                      ; D426   018E
        MOVR    R1,     R0                      ; D427   0088
        XOR@    R5,     R6                      ; D428   03EE
        ADD@    R4,     R0                      ; D429   02E0
        TSTR    R0                              ; D42A   0080
        ADDR    R4,     R0                      ; D42B   00E0
        NEGR    R0                              ; D42C   0020
        ADDR    R4,     R0                      ; D42D   00E0
        BNEQ    L_D63A                          ; D42E   020C 020A

L_D430:
        SUBR    R1,     R2                      ; D430   010A
        INCR    R2                              ; D431   000A
        SUBR    R1,     R4                      ; D432   010C
        XOR@    R5,     R6                      ; D433   03EE
        SLL     R0,     1                       ; D434   0048
        SLL     R2,     2                       ; D435   004E
        SWAP    R2,     1                       ; D436   0042
        ADD@    R5,     R6                      ; D437   02EE
        ADD@    R5,     R2                      ; D438   02EA
        AND@    R5,     R2                      ; D439   03AA
        AND@    R1,     R2                      ; D43A   038A
        AND@    R5,     R2                      ; D43B   03AA
        ADD@    R5,     R6                      ; D43C   02EE
        XOR@    R4,     R0                      ; D43D   03E0
        TSTR    R0                              ; D43E   0080
        ADDR    R4,     R0                      ; D43F   00E0
        NEGR    R0                              ; D440   0020
        ADD@    R4,     R0                      ; D441   02E0
        ADD@    R5,     R6                      ; D442   02EE
        AND@    R5,     R2                      ; D443   03AA
        XOR@    R5,     R2                      ; D444   03EA
        AND@    R1,     R2                      ; D445   038A
        MVI@    R1,     R6                      ; D446   028E
        ANDR    R3,     R0                      ; D447   0198
        ANDR    R2,     R0                      ; D448   0190
        MOVR    R3,     R0                      ; D449   0098
        MOVR    R2,     R0                      ; D44A   0090
        ADD@    R3,     R0                      ; D44B   02D8
        ANDR    R5,     R6                      ; D44C   01AE
        MOVR    R5,     R2                      ; D44D   00AA
        MOVR    R5,     R6                      ; D44E   00AE
        MOVR    R5,     R2                      ; D44F   00AA
        CMPR    R1,     R2                      ; D450   014A
        MOVR    R5,     R3                      ; D451   00AB
L_D452:
        ANDR    R5,     R1                      ; D452   01A9
        MOVR    R5,     R1                      ; D453   00A9
        MOVR    R5,     R1                      ; D454   00A9
        ADDR    R5,     R5                      ; D455   00ED
        INCR    R3                              ; D456   000B
        SUBR    R1,     R2                      ; D457   010A
        INCR    R3                              ; D458   000B
        ADCR    R2                              ; D459   002A
        RSWD    R2                              ; D45A   003A
        MVI@    R5,     R3                      ; D45B   02AB
        AND@    R5,     R2                      ; D45C   03AA
        MOVR    R5,     R3                      ; D45D   00AB
        MOVR    R5,     R2                      ; D45E   00AA
        MOVR    R2,     R3                      ; D45F   0093
        MOVR    R4,     R2                      ; D460   00A2
        NEGR    R2                              ; D461   0022
        MOVR    R4,     R2                      ; D462   00A2
        NEGR    R2                              ; D463   0022
        MOVR    R7,     R2                      ; D464   00BA
        MOVR    R2,     R0                      ; D465   0090
        ADDR    R2,     R0                      ; D466   00D0
        XOR@    R6,     R0                      ; D467   03F0
        ANDR    R6,     R0                      ; D468   01B0
        MOVR    R2,     R0                      ; D469   0090
        MOVR    R5,     R6                      ; D46A   00AE
        MOVR    R5,     R2                      ; D46B   00AA
        XORR    R5,     R2                      ; D46C   01EA
        ADCR    R2                              ; D46D   002A
        ADCR    R6                              ; D46E   002E
        ADDR    R5,     R0                      ; D46F   00E8
        TSTR    R5                              ; D470   00AD
        MOVR    R5,     R7                      ; D471   00AF

        MOVR    R5,     R2                      ; D472   00AA
        ADDR    R5,     R0                      ; D473   00E8
        MOVR    R1,     R6                      ; D474   008E
        MOVR    R1,     R2                      ; D475   008A
        ANDR    R1,     R4                      ; D476   018C
        MOVR    R1,     R2                      ; D477   008A
        MOVR    R1,     R2                      ; D478   008A
        MVI@    R5,     R1                      ; D479   02A9
        TSTR    R5                              ; D47A   00AD
        MOVR    R5,     R7                      ; D47B   00AF

        DECLE   $00AB,  $00E9,  $0000,  $002A   ; D47C   00AB 00E9 0000 002A
        DECLE   $0077,  $0055,  $0255,  $0155   ; D480   0077 0055 0255 0155
        DECLE   $0077,  $0000,  $0280,  $0280   ; D484   0077 0000 0280 0280
        DECLE   $0037                           ; D488   0037

        DECR    R5                              ; D489   0015
        DECR    R5                              ; D48A   0015
        DECR    R5                              ; D48B   0015
L_D48C:
        DECR    R7                              ; D48C   0017

        DECLE   $0300,  $0180,  $0080,  $0377   ; D48D   0300 0180 0080 0377
        DECLE   $0215,  $0075,  $0045,  $0077   ; D491   0215 0075 0045 0077
        DECLE   $0000,  $0080,  $0380,  $0177   ; D495   0000 0080 0380 0177
        DECLE   $0015,  $0075,  $0315,  $0077   ; D499   0015 0075 0315 0077
        DECLE   $0000                           ; D49D   0000

        TSTR    R0                              ; D49E   0080
        TSTR    R0                              ; D49F   0080
        RLC     R3,     2                       ; D4A0   0057
        CMP@    R2,     R5                      ; D4A1   0355
        CMPR    R6,     R5                      ; D4A2   0175
        DECR    R5                              ; D4A3   0015
        SUBR    R2,     R7                      ; D4A4   0117

        SUB     .IV.ALD,R0                      ; D4A5   0300 0080
        TSTR    R0                              ; D4A7   0080
        RRC     R3,     2                       ; D4A8   0077
        CMP     .BTAB.75,R5                     ; D4A9   0345 0275
        SUB@    R2,     R5                      ; D4AB   0315
        CMP@    R6,     R7                      ; D4AC   0377
        SUB     .BTAB.80,R0                     ; D4AD   0300 0280
        AND     G_0077, R0                      ; D4AF   0380 0077
        SWAP    R1,     2                       ; D4B1   0045
        RRC     R1,     2                       ; D4B2   0075
        CMP@    R2,     R5                      ; D4B3   0355
        PSHR    R7                              ; D4B4   0277
        SUB     G_0380, R0                      ; D4B5   0300 0380
        AND     G_0377, R0                      ; D4B7   0380 0377
        CMP@    R2,     R5                      ; D4B9   0355
        DECR    R5                              ; D4BA   0015
        DECR    R5                              ; D4BB   0015
L_D4BC:
        DECR    R7                              ; D4BC   0017

        DECLE   $0300,  $0280,  $0380,  $0377   ; D4BD   0300 0280 0380 0377
        DECLE   $0355,  $0375,  $0055,  $0077   ; D4C1   0355 0375 0055 0077
        DECLE   $0000,  $0080,  $0080,  $0277   ; D4C5   0000 0080 0080 0277
        DECLE   $0355,  $0175,  $0015,  $0077   ; D4C9   0355 0175 0015 0077
        DECLE   $0000,  $0080,  $0080,  $0103   ; D4CD   0000 0080 0080 0103
        DECLE   $0001,  $0001,  $0001,  $0001   ; D4D1   0001 0001 0001 0001
        DECLE   $0200,  $0300,  $0100,  $0070   ; D4D5   0200 0300 0100 0070
        DECLE   $0050,  $0050,  $0050,  $0170   ; D4D9   0050 0050 0050 0170
        DECLE   $0100,  $0080,  $0080,  $0007   ; D4DD   0100 0080 0080 0007
        DECLE   $0001,  $0207,  $0304,  $0107   ; D4E1   0001 0207 0304 0107
        DECLE   $0000,  $0000,  $0000,  $0007   ; D4E5   0000 0000 0000 0007
        DECLE   $0201,  $0107,  $0101,  $0007   ; D4E9   0201 0107 0101 0007
        DECLE   $0000,  $0300,  $0300,  $0005   ; D4ED   0000 0300 0300 0005
        DECLE   $0005,  $0007,  $0101,  $0001   ; D4F1   0005 0007 0101 0001
        DECLE   $0100,  $0000,  $0000,  $0007   ; D4F5   0100 0000 0000 0007
        DECLE   $0004,  $0107,  $0001           ; D4F9   0004 0107 0001

        SETC                                    ; D4FC   0007
        B       L_D7FF                          ; D4FD   0200 0300

        DECLE   $0300,  $0007,  $0004,  $0007   ; D4FF   0300 0007 0004 0007
        DECLE   $0005,  $0007,  $0000,  $0000   ; D503   0005 0007 0000 0000
        DECLE   $0000,  $0207,  $0105,  $0101   ; D507   0000 0207 0105 0101
        DECLE   $0201,  $0001,  $0000,  $0000   ; D50B   0201 0001 0000 0000
        DECLE   $0300,  $0007,  $0005,  $0007   ; D50F   0300 0007 0005 0007
        DECLE   $0005                           ; D513   0005

        BUSC    L_D516                          ; D514   0207 0000
L_D516:
        B       L_D818                          ; D516   0200 0300
        SUB     G_0305, R7                      ; D518   0307 0305
        SUB     G_0301, R7                      ; D51A   0307 0301

        DECLE   $0007,  $0200,  $0000,  $0000   ; D51C   0007 0200 0000 0000
        DECLE   $0037,  $0015,  $0215,  $0215   ; D520   0037 0015 0215 0215
        DECLE   $0317,  $0300,  $0000,  $0000   ; D524   0317 0300 0000 0000
        DECLE   $001B,  $0209,  $0209,  $0209   ; D528   001B 0209 0209 0209
        DECLE   $0009,  $0000,  $0100,  $0200   ; D52C   0009 0000 0100 0200
        DECLE   $00E0,  $0080,  $0080,  $0080   ; D530   00E0 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; D534   0080 0080 0080 0080
        DECLE   $0201,  $0101,  $0103,  $0003   ; D538   0201 0101 0103 0003
        DECLE   $0007,  $0207,  $020F,  $000F   ; D53C   0007 0207 020F 000F
        DECLE   $001F,  $001F,  $013F,  $003F   ; D540   001F 001F 013F 003F
        DECLE   $017F,  $007F,  $00FF,  $00FF   ; D544   017F 007F 00FF 00FF
        DECLE   $00FE,  $01FE,  $00FC,  $00FC   ; D548   00FE 01FE 00FC 00FC
        DECLE   $00F8,  $03F8,  $03F0,  $00F0   ; D54C   00F8 03F8 03F0 00F0
        DECLE   $00E0,  $00E0,  $00C0,  $00C0   ; D550   00E0 00E0 00C0 00C0
        DECLE   $0080,  $0080,  $0000,  $0200   ; D554   0080 0080 0000 0200
        DECLE   $0307,  $012A,  $0100,  $0122   ; D558   0307 012A 0100 0122
        DECLE   $0000                           ; D55C   0000

        NEGR    R4                              ; D55D   0024
        SUBR    R0,     R7                      ; D55E   0107

        DECLE   $002C,  $0005,  $002C,  $0006   ; D55F   002C 0005 002C 0006
        DECLE   $002A,  $0301,  $0002,  $0204   ; D563   002A 0301 0002 0204
        DECLE   $0108,  $0110,  $0020,  $0040   ; D567   0108 0110 0020 0040
        DECLE   $0280,  $0210,  $0210,  $0010   ; D56B   0280 0210 0210 0010
        DECLE   $0010,  $0310,  $0210,  $0210   ; D56F   0010 0310 0210 0210
        DECLE   $0010,  $0010,  $0210,  $0210   ; D573   0010 0010 0210 0210
        DECLE   $0010,  $0010,  $0010,  $0038   ; D577   0010 0010 0010 0038
        DECLE   $007C,  $0000,  $010C,  $001C   ; D57B   007C 0000 010C 001C
        DECLE   $031C,  $020C,  $0000,  $0000   ; D57F   031C 020C 0000 0000
        DECLE   $0000,  $0000,  $000C,  $000E   ; D583   0000 0000 000C 000E
        DECLE   $010C,  $0000,  $0100,  $0300   ; D587   010C 0000 0100 0300
        DECLE   $0000,  $0000,  $0018,  $001C   ; D58B   0000 0000 0018 001C
        DECLE   $020C,  $0000,  $0000,  $0000   ; D58F   020C 0000 0000 0000
        DECLE   $0200,  $0300,  $001C,  $001C   ; D593   0200 0300 001C 001C
        DECLE   $0000,  $0000,  $0200,  $0000   ; D597   0000 0000 0200 0000
        DECLE   $0000,  $0000,  $021C,  $011C   ; D59B   0000 0000 021C 011C
        DECLE   $0100,  $0000,  $0000,  $0200   ; D59F   0100 0000 0000 0200
        DECLE   $0100,  $0000,  $000C,  $001C   ; D5A3   0100 0000 000C 001C
        DECLE   $0318,  $0000,  $0000,  $0000   ; D5A7   0318 0000 0000 0000
        DECLE   $0000,  $0000,  $0100,  $011C   ; D5AB   0000 0000 0100 011C
        DECLE   $001C,  $0008,  $0000,  $0000   ; D5AF   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0100,  $001C   ; D5B3   0000 0000 0100 001C
        DECLE   $0018,  $0000,  $0000           ; D5B7   0018 0000 0000
L_D5BA:
        SUBR    R0,     R0                      ; D5BA   0100
        DECLE   $0100,  $0000,  $0006,  $0007   ; D5BB   0100 0000 0006 0007
        DECLE   $0003,  $0001,  $0100,  $0300   ; D5BF   0003 0001 0100 0300
        DECLE   $0000,  $0000,  $0000,  $0306   ; D5C3   0000 0000 0000 0306
        DECLE   $0107,  $0303,  $0301,  $0300   ; D5C7   0107 0303 0301 0300
        DECLE   $0200,  $0300,  $0000,  $0000   ; D5CB   0200 0300 0000 0000

        CLRC                                    ; D5CF   0006
        SUB     G_0103, R7                      ; D5D0   0307 0103

        SUB     G_0300, R1                      ; D5D2   0301 0300
        SUB     .BTAB.00,R0                     ; D5D4   0300 0200
        SUBR    R0,     R6                      ; D5D6   0106
        SUBR    R0,     R7                      ; D5D7   0107

        DECLE   $0003,  $0001                   ; D5D8   0003 0001

        B       L_D5DC                          ; D5DA   0200 0000

L_D5DC:
        SUBR    R0,     R0                      ; D5DC   0100
        DECLE   $000C,  $001C,  $0118,  $0000   ; D5DD   000C 001C 0118 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; D5E1   0100 0000 0000 0000
        DECLE   $0000,  $0100,  $0000,  $0000   ; D5E5   0000 0100 0000 0000
        DECLE   $0000,  $0200,  $0318,  $0018   ; D5E9   0000 0200 0318 0018
        DECLE   $0018,  $0008,  $001C,  $001E   ; D5ED   0018 0008 001C 001E
        DECLE   $001F,  $001F,  $001F           ; D5F1   001F 001F 001F

        B       L_D5F6                          ; D5F4   0200 0000

L_D5F6:
        SUB     .STIC.X.0,R0                    ; D5F6   0300 0000
        DECLE   $0000,  $0000,  $0000,  $0118   ; D5F8   0000 0000 0000 0118
        DECLE   $0018,  $0018,  $0008,  $001E   ; D5FC   0018 0018 0008 001E
        DECLE   $021F,  $021F,  $007F,  $033E   ; D600   021F 021F 007F 033E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D604   0000 0000 0000 0000
        DECLE   $0000                           ; D608   0000

        B       L_D60B                          ; D609   0200 0000

L_D60B:
        GSWD    R0                              ; D60B   0030
        DECLE   $0030,  $0030,  $0018,  $011E   ; D60C   0030 0030 0018 011E
        DECLE   $02BF,  $01FF,  $0079,  $0019   ; D610   02BF 01FF 0079 0019
        DECLE   $0000,  $0200,  $0200,  $0200   ; D614   0000 0200 0200 0200
        DECLE   $0000,  $0000,  $0300,  $0230   ; D618   0000 0000 0300 0230
        DECLE   $0230,  $0030,  $009C,  $00BF   ; D61C   0230 0030 009C 00BF
        DECLE   $03FF,  $0279,  $0019,  $0018   ; D620   03FF 0279 0019 0018
        DECLE   $0100,  $0200,  $0000,  $0000   ; D624   0100 0200 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; D628   0000 0000 0000 0030
        DECLE   $0030,  $0030,  $0218,  $011C   ; D62C   0030 0030 0218 011C
        DECLE   $01BE,  $00FE,  $007A,  $001A   ; D630   01BE 00FE 007A 001A
        DECLE   $0100,  $0100,  $0000,  $0000   ; D634   0100 0100 0000 0000
        DECLE   $0100,  $0000                   ; D638   0100 0000
L_D63A:
        SUBR    R0,     R0                      ; D63A   0100
        DECLE   $0000,  $0030,  $0330,  $0130   ; D63B   0000 0030 0330 0130
        DECLE   $0118,  $001C,  $001C,  $013E   ; D63F   0118 001C 001C 013E
        DECLE   $02FE,  $0200,  $0000           ; D643   02FE 0200 0000
L_D646:
        SUBR    R0,     R0                      ; D646   0100
        SUBR    R0,     R0                      ; D647   0100
        SUBR    R0,     R0                      ; D648   0100
        B       L_D64B                          ; D649   0200 0000

L_D64B:
        SUB     G_0330, R0                      ; D64B   0300 0330
        DECLE   $0130,  $0230,  $0218,  $0018   ; D64D   0130 0230 0218 0018
        DECLE   $001C,  $001C,  $023C           ; D651   001C 001C 023C

        B       L_D856                          ; D654   0200 0200

        SUB     .ISRVEC.0,R0                    ; D656   0300 0100
        B       L_D85A                          ; D658   0200 0200

        DECLE   $0000,  $0000,  $0018,  $0218   ; D65A   0000 0000 0018 0218
        DECLE   $0218,  $0208,  $011C,  $021C   ; D65E   0218 0208 011C 021C
        DECLE   $021C                           ; D662   021C

        COMR    R4                              ; D663   001C
        SUBR    R0,     R0                      ; D664   0100
        SUBR    R0,     R0                      ; D665   0100
        SUBR    R0,     R0                      ; D666   0100
        BOV     L_D66C                          ; D667   0202 0003

        SUB     G_0300, R3                      ; D669   0303 0300
L_D66B:
        SUBR    R0,     R0                      ; D66B   0100
L_D66C:
        B       L_D86E                          ; D66C   0200 0200

        DECLE   $0000,  $0000,  $0000,  $0200   ; D66E   0000 0000 0000 0200
        DECLE   $0200,  $0200,  $0300,  $0100   ; D672   0200 0200 0300 0100
        DECLE   $0200,  $0200,  $0002,  $0003   ; D676   0200 0200 0002 0003
        DECLE   $0003,  $0200,  $0200           ; D67A   0003 0200 0200

        B       L_D67F                          ; D67D   0200 0000

L_D67F:
        SUB     .BTAB.00,R0                     ; D67F   0300 0200
        DECLE   $0000,  $0100,  $0100,  $0200   ; D681   0000 0100 0100 0200

        B       L_D687                          ; D685   0200 0000

L_D687:
        SUB     .BTAB.00,R0                     ; D687   0300 0200
        B       L_D88B                          ; D689   0200 0200
        B       L_D68D                          ; D68B   0200 0000

L_D68D:
        SUB     .ISRVEC.0,R0                    ; D68D   0300 0100
        DECLE   $0200,  $0200,  $0200,  $0100   ; D68F   0200 0200 0200 0100

        B       L_D895                          ; D693   0200 0200
        B       L_D697                          ; D695   0200 0000

L_D697:
        SUBR    R0,     R0                      ; D697   0100
        SUBR    R0,     R0                      ; D698   0100
        B       L_D89B                          ; D699   0200 0200

        DECLE   $0200                           ; D69B   0200

        SUB     .ISRVEC.0,R0                    ; D69C   0300 0100
        B       L_D8A0                          ; D69E   0200 0200

        SUBR    R0,     R0                      ; D6A0   0100
        ADDR    R0,     R0                      ; D6A1   00C0
        CLRR    R0                              ; D6A2   01C0
        ADD@    R6,     R0                      ; D6A3   02F0
        B       L_D9A6                          ; D6A4   0200 0300

        SUBR    R0,     R0                      ; D6A6   0100
        SUBR    R0,     R0                      ; D6A7   0100
        B       L_D8AA                          ; D6A8   0200 0200

        DECLE   $0000,  $0118,  $0318,  $0118   ; D6AA   0000 0118 0318 0118
        DECLE   $0208,  $021C                   ; D6AE   0208 021C

        SUBR    R3,     R6                      ; D6B0   011E
        SUBR    R3,     R7                      ; D6B1   011F

        DECLE   $021F,  $001F,  $0000,  $0100   ; D6B2   021F 001F 0000 0100
        DECLE   $0300,  $0100,  $0000,  $0200   ; D6B6   0300 0100 0000 0200
        DECLE   $0380,  $01D8,  $0258,  $007A   ; D6BA   0380 01D8 0258 007A
        DECLE   $002E,  $003F,  $001F,  $020C   ; D6BE   002E 003F 001F 020C
        DECLE   $000C,  $020C,  $0100,  $0200   ; D6C2   000C 020C 0100 0200
        DECLE   $0200,  $0200,  $0000,  $0100   ; D6C6   0200 0200 0000 0100
        DECLE   $0100,  $0260,  $0260,  $0260   ; D6CA   0100 0260 0260 0260
        DECLE   $011C,  $01BF,  $02FF,  $0279   ; D6CE   011C 01BF 02FF 0279
        DECLE   $0019,  $0118,  $033E,  $010E   ; D6D2   0019 0118 033E 010E
        DECLE   $021C,  $023C,  $037C,  $014C   ; D6D6   021C 023C 037C 014C
        DECLE   $026C,  $022C,  $0036,  $0016   ; D6DA   026C 022C 0036 0016
        DECLE   $0012,  $0202,  $0202,  $0206   ; D6DE   0012 0202 0202 0206

        SUB     .ISRVEC.0,R0                    ; D6E2   0300 0100
L_D6E4:
        BGT     L_D6F2                          ; D6E4   020E 000C

        DECLE   $003E,  $007E,  $0076,  $0246   ; D6E6   003E 007E 0076 0246
        DECLE   $0046,  $0266,  $0122,  $0223   ; D6EA   0046 0266 0122 0223
        DECLE   $0203,  $0001,  $0001           ; D6EE   0203 0001 0001

        SUBR    R0,     R3                      ; D6F1   0103
L_D6F2:
        SUBR    R0,     R0                      ; D6F2   0100
        DECLE   $0200,  $0018                   ; D6F3   0200 0018

        ADDI    #$02FC, R0                      ; D6F5   02F8 02FC
        MVI@    R1,     R4                      ; D6F7   028C
        MVI@    R1,     R4                      ; D6F8   028C
        MVO@    R4,     R1                      ; D6F9   024C
        SLL     R0,     2                       ; D6FA   004C
        SUB     G_0106, R6                      ; D6FB   0306 0106
        BLE     L_D902                          ; D6FD   0206 0203
        BC      L_DA02                          ; D6FF   0201 0301

        SUBR    R0,     R1                      ; D701   0101
        B       L_D904                          ; D702   0200 0200

        DECLE   $0018,  $007C,  $01FC,  $02CC   ; D704   0018 007C 01FC 02CC
        DECLE   $028C,  $028C,  $0186,  $0206   ; D708   028C 028C 0186 0206
        DECLE   $0206,  $0203,  $0001,  $0101   ; D70C   0206 0203 0001 0101
        DECLE   $0100,  $0200,  $0200,  $0200   ; D710   0100 0200 0200 0200
        DECLE   $0118,  $023C,  $023C           ; D714   0118 023C 023C

        SAR     R0,     2                       ; D717   006C
        SAR     R0,     2                       ; D718   006C
        CMPR    R1,     R4                      ; D719   014C
        CMPR    R1,     R7                      ; D71A   014F
        MVO     R7,     G_0041                  ; D71B   0247 0041
        BC      L_D91F                          ; D71D   0201 0200
        B       L_D921                          ; D71F   0200 0200

        DECLE   $0000,  $0000,  $0300,  $0118   ; D721   0000 0000 0300 0118
        DECLE   $0218,  $0038,  $0238,  $006F   ; D725   0218 0038 0238 006F
        DECLE   $036F,  $0241,  $0241,  $0040   ; D729   036F 0241 0241 0040
        DECLE   $0120,  $0220                   ; D72D   0120 0220

        B       L_D931                          ; D72F   0200 0200
        B       L_D833                          ; D731   0200 0100
        B       L_D9B1                          ; D733   0200 027C

        DECLE   $021C,  $001C,  $0118,  $0138   ; D735   021C 001C 0118 0138
        DECLE   $0238,  $023C,  $023E,  $0326   ; D739   0238 023C 023E 0326
        DECLE   $0132,  $0232,  $0210,  $0110   ; D73D   0132 0232 0210 0110
        DECLE   $0000,  $0000,  $0200,  $021C   ; D741   0000 0000 0200 021C
        DECLE   $011C,  $001C,  $0038,  $0038   ; D745   011C 001C 0038 0038
        DECLE   $0238,  $0238,  $0018,  $031C   ; D749   0238 0238 0018 031C
        DECLE   $021C,  $000C,  $020C,  $001C   ; D74D   021C 000C 020C 001C
        DECLE   $0300,  $0200,  $0000,  $027C   ; D751   0300 0200 0000 027C
        DECLE   $00FE,  $03FF,  $02EF,  $0267   ; D755   00FE 03FF 02EF 0267
        DECLE   $0237,  $001E,  $030E,  $0206   ; D759   0237 001E 030E 0206
        DECLE   $0206,  $0203,  $0103,  $0205   ; D75D   0206 0203 0103 0205
        DECLE   $0205,  $000D,  $0103,  $0100   ; D761   0205 000D 0103 0100
        DECLE   $0178,  $02FE,  $00FF,  $01EF   ; D765   0178 02FE 00FF 01EF
        DECLE   $0077,  $031E,  $020E,  $0006   ; D769   0077 031E 020E 0006
        DECLE   $0206,  $0003,  $0303,  $0205   ; D76D   0206 0003 0303 0205
        DECLE   $0005                           ; D771   0005

        BGE     L_D777                          ; D772   020D 0003

        SUB     .BTAB.38,R0                     ; D774   0300 0238
        XORR    R7,     R4                      ; D776   01FC
L_D777:
        XORR    R7,     R6                      ; D777   01FE
        DECLE   $00FF,  $007F,  $007F,  $026F   ; D778   00FF 007F 007F 026F
        DECLE   $025E,  $037C,  $0178,  $027F   ; D77C   025E 037C 0178 027F
        DECLE   $025F,  $00C1,  $009B,  $0000   ; D780   025F 00C1 009B 0000
        DECLE   $0278,  $027C,  $027E,  $036F   ; D784   0278 027C 027E 036F
        DECLE   $0167,  $0247,  $02CE,  $009C   ; D788   0167 0247 02CE 009C
        DECLE   $0038,  $0030,  $021A,  $021B   ; D78C   0038 0030 021A 021B

        BGE     L_D8AF                          ; D790   020D 011D
        B       L_D994                          ; D792   0200 0200

        DECLE   $003E,  $010E,  $011C,  $013C   ; D794   003E 010E 011C 013C
        DECLE   $027C,  $004C,  $016C,  $002C   ; D798   027C 004C 016C 002C
        DECLE   $0336,  $0216,  $0012,  $0202   ; D79C   0336 0216 0012 0202
        DECLE   $0002,  $0306,  $0200,  $0000   ; D7A0   0002 0306 0200 0000
        DECLE   $022C                           ; D7A4   022C

        SAR     R0,     2                       ; D7A5   006C
        CMP@    R3,     R4                      ; D7A6   035C
        MVO@    R0,     R3                      ; D7A7   0258
        ANDR    R6,     R0                      ; D7A8   01B0
        ANDR    R6,     R0                      ; D7A9   01B0
        NEGR    R0                              ; D7AA   0020
        NEGR    R0                              ; D7AB   0020
        SLR     R0,     1                       ; D7AC   0060
        MVO     R0,     .BTAB.00                ; D7AD   0240 0200
        SUB     .ISRVEC.0,R0                    ; D7AF   0300 0100
        B       L_D9B3                          ; D7B1   0200 0200

        DECLE   $0000,  $00F8,  $00FC,  $028C   ; D7B3   0000 00F8 00FC 028C
        DECLE   $028C,  $028C,  $030C,  $010C   ; D7B7   028C 028C 030C 010C
        DECLE   $020C,  $0206,  $0007,  $0001   ; D7BB   020C 0206 0007 0001
        DECLE   $0000                           ; D7BF   0000

        B       L_D9C2                          ; D7C0   0200 0200
        B       L_D7C4                          ; D7C2   0200 0000

L_D7C4:
        SUB     .BTAB.00,R0                     ; D7C4   0300 0200
        DECLE   $0000                           ; D7C6   0000

        SUBR    R0,     R0                      ; D7C7   0100
        SUBR    R0,     R0                      ; D7C8   0100
        B       L_D9CB                          ; D7C9   0200 0200

        DECLE   $0018,  $0118,  $001C,  $001A   ; D7CB   0018 0118 001C 001A
        DECLE   $003F,  $003F,  $0238           ; D7CF   003F 003F 0238

        COMR    R4                              ; D7D2   001C
        SUB@    R3,     R0                      ; D7D3   0318
        B       L_D7D6                          ; D7D4   0200 0000
L_D7D6:
        B       L_D7D8                          ; D7D6   0200 0000

L_D7D8:
        SUB     .BTAB.00,R0                     ; D7D8   0300 0200
        DECLE   $0100,  $010C,  $000C,  $004E   ; D7DA   0100 010C 000C 004E
        DECLE   $007A,  $023F,  $021F,  $021B   ; D7DE   007A 023F 021F 021B
        DECLE   $0218,  $0218                   ; D7E2   0218 0218

        B       L_D7E6                          ; D7E4   0200 0000

L_D7E6:
        SUB     .ISRVEC.0,R0                    ; D7E6   0300 0100
        DECLE   $0200,  $0280,  $0280,  $0140   ; D7E8   0200 0280 0280 0140
        DECLE   $0266,  $0236,  $023E           ; D7EC   0266 0236 023E

        COMR    R6                              ; D7EF   001E
        SUBR    R3,     R7                      ; D7F0   011F
        SUBR    R1,     R7                      ; D7F1   010F

        DECLE   $020F,  $020C                   ; D7F2   020F 020C

        B       L_DAF6                          ; D7F4   0200 0300

        SUBR    R0,     R0                      ; D7F6   0100
        B       L_D9F9                          ; D7F7   0200 0200

        DECLE   $0100,  $0000,  $010C,  $020C   ; D7F9   0100 0000 010C 020C

        MVI@    R1,     R4                      ; D7FD   028C
        CMPR    R7,     R6                      ; D7FE   017E
L_D7FF:
        RSWD    R6                              ; D7FF   003E
        DECLE   $001E,  $001C,  $0218,  $0218   ; D800   001E 001C 0218 0218
        DECLE   $0000,  $0300,  $0200,  $0000   ; D804   0000 0300 0200 0000

        B       L_D80A                          ; D808   0200 0000

L_D80A:
        SUB@    R1,     R0                      ; D80A   0308
        DECLE   $0218,  $001C,  $021C,  $000E   ; D80B   0218 001C 021C 000E
        DECLE   $033E,  $023C,  $0278,  $02D8   ; D80F   033E 023C 0278 02D8
        DECLE   $0098,  $0300,  $0200,  $0200   ; D813   0098 0300 0200 0200
        DECLE   $0200                           ; D817   0200
L_D818:
        SUBR    R4,     R0                      ; D818   0120
        DECLE   $0130,  $0210,  $0238,  $0038   ; D819   0130 0210 0238 0038
        DECLE   $013C,  $031C,  $011C,  $021C   ; D81D   013C 031C 011C 021C
        DECLE   $001C,  $0038,  $0378,  $0200   ; D821   001C 0038 0378 0200
        DECLE   $0000                           ; D825   0000

        B       L_D828                          ; D826   0200 0000

L_D828:
        XOR     .BTAB.60,R0                     ; D828   03C0 0260
        DECLE   $0070,  $0230                   ; D82A   0070 0230

        RSWD    R0                              ; D82C   0038
        SUBI    #$0238, R0                      ; D82D   0338 0238
        SUBR    R3,     R4                      ; D82F   011C
        SUBR    R3,     R4                      ; D830   011C
        SUBR    R3,     R4                      ; D831   011C
        SUB@    R3,     R4                      ; D832   031C
L_D833:
        SUBR    R3,     R0                      ; D833   0118
        DECLE   $0000,  $0000                   ; D834   0000 0000

        SUBR    R0,     R0                      ; D836   0100
        SUBR    R0,     R0                      ; D837   0100
        B       L_D83A                          ; D838   0200 0000

L_D83A:
        MVI     G_03EC, R0                      ; D83A   0280 03EC
        DECLE   $017C,  $023C                   ; D83C   017C 023C

        COMR    R6                              ; D83E   001E
        INCR    R7                              ; D83F   000F
        INCR    R7                              ; D840   000F

L_D841:
        INCR    R5                              ; D841   000D
L_D842:
        BGE     L_D851                          ; D842   020D 000D

        DECLE   $0218,  $011C,  $021C,  $021C   ; D844   0218 011C 021C 021C
        DECLE   $023C                           ; D848   023C

        RSWD    R0                              ; D849   0038
        SUBR    R7,     R0                      ; D84A   0138
        CMPR    R5,     R4                      ; D84B   016C
        MVO@    R4,     R5                      ; D84C   026C
        MVO@    R4,     R1                      ; D84D   024C
        MVO     R4,     G_0124                  ; D84E   0244 0124
        SUBR    R4,     R4                      ; D850   0124
L_D851:
        BEQ     L_D646                          ; D851   0224 020C

        DECLE   $0000                           ; D853   0000

        SUBR    R3,     R0                      ; D854   0118
        SUB@    R3,     R4                      ; D855   031C
L_D856:
        SUBR    R7,     R4                      ; D856   013C
        DECLE   $023C,  $027C                   ; D857   023C 027C

        CMP@    R5,     R4                      ; D859   036C
L_D85A:
        CMPR    R1,     R4                      ; D85A   014C
        DECLE   $024E,  $0266,  $0026,  $0022   ; D85B   024E 0266 0026 0022
        DECLE   $0002,  $0202,  $0202,  $0006   ; D85F   0002 0202 0202 0006
        DECLE   $0000,  $031C,  $021C,  $003C   ; D863   0000 031C 021C 003C
        DECLE   $027C                           ; D867   027C

        SAR     R0,     2                       ; D868   006C
        XOR@    R1,     R4                      ; D869   03CC
        MVI@    R1,     R6                      ; D86A   028E
        MOVR    R0,     R6                      ; D86B   0086
        MVO     R6,     G_0042                  ; D86C   0246 0042
L_D86E:
        SUB     .BTAB.01,R3                     ; D86E   0303 0201
        DECLE   $0101,  $0101,  $0003,  $0000   ; D870   0101 0101 0003 0000
        DECLE   $0218,  $001C,  $003C,  $033C   ; D874   0218 001C 003C 033C
        DECLE   $017C,  $026C,  $004C,  $026E   ; D878   017C 026C 004C 026E
        DECLE   $0126,  $0226,  $0202           ; D87C   0126 0226 0202

        EIS                                     ; D87F   0002
        EIS                                     ; D880   0002
        SUBR    R0,     R2                      ; D881   0102
        SUBR    R0,     R3                      ; D882   0103
        B       L_D89D                          ; D883   0200 0018

        DECLE   $0218,  $0218,  $023C,  $023C   ; D885   0218 0218 023C 023C

        MVO@    R4,     R5                      ; D889   026C
        SAR     R0,     2                       ; D88A   006C
L_D88B:
        CMP@    R1,     R4                      ; D88B   034C
        CMPR    R0,     R4                      ; D88C   0144
        MVO@    R4,     R4                      ; D88D   0264
        BEQ     L_D66B                          ; D88E   0224 0224

        SUB     G_0104, R4                      ; D890   0304 0104
        BLE     L_DA94                          ; D892   0206 0200

        COMR    R0                              ; D894   0018
L_D895:
        COMR    R4                              ; D895   001C
        DECLE   $011C,  $023C,  $023C           ; D896   011C 023C 023C

        MVO@    R4,     R5                      ; D899   026C
        SAR     R0,     2                       ; D89A   006C
L_D89B:
        CMP@    R1,     R4                      ; D89B   034C
        MVO@    R4,     R5                      ; D89C   026C
L_D89D:
        SUB@    R4,     R4                      ; D89D   0324
        NOP                                     ; D89E   0034
        SUBR    R2,     R4                      ; D89F   0114
L_D8A0:
        SUBR    R2,     R4                      ; D8A0   0114
        DECLE   $0204,  $020C,  $0000,  $0118   ; D8A1   0204 020C 0000 0118
        DECLE   $021C,  $021C,  $023C,  $0238   ; D8A5   021C 021C 023C 0238

        GSWD    R0                              ; D8A9   0030
L_D8AA:
        SUBI    #$0218, R0                      ; D8AA   0338 0218
        SUBR    R3,     R0                      ; D8AC   0118
        INCR    R4                              ; D8AD   000C
        SUBR    R1,     R4                      ; D8AE   010C
L_D8AF:
        SUBR    R0,     R4                      ; D8AF   0104
        DECLE   $0214,  $0010,  $0030,  $0100   ; D8B0   0214 0010 0030 0100
        DECLE   $020C,  $020E,  $000E,  $020E   ; D8B4   020C 020E 000E 020E
        DECLE   $001C,  $0318,  $0230           ; D8B8   001C 0318 0230

        SUBR    R7,     R0                      ; D8BB   0138
        COMR    R6                              ; D8BC   001E
        SUB     G_0111, R7                      ; D8BD   0307 0111

        DECLE   $0211,  $0008,  $0008,  $0218   ; D8BF   0211 0008 0008 0218
        DECLE   $0200,  $0200,  $0000           ; D8C3   0200 0200 0000

        B       L_D8C8                          ; D8C6   0200 0000

L_D8C8:
        SUB     .BTAB.30,R0                     ; D8C8   0300 0230
        DECLE   $0230,  $0030,  $0110,  $0218   ; D8CA   0230 0030 0110 0218
        DECLE   $023C,  $023C,  $007C,  $01D8   ; D8CE   023C 023C 007C 01D8
        DECLE   $0098,  $0318,  $0200,  $0200   ; D8D2   0098 0318 0200 0200
        DECLE   $0000,  $0300,  $0200,  $0200   ; D8D6   0000 0300 0200 0200
        DECLE   $0030,  $0330,  $0130,  $0218   ; D8DA   0030 0330 0130 0218
        DECLE   $021C,  $003E,  $023A,  $0278   ; D8DE   021C 003E 023A 0278
        DECLE   $0258,  $0218,  $0200,  $0100   ; D8E2   0258 0218 0200 0100
        DECLE   $0000,  $0300,  $0200,  $0100   ; D8E6   0000 0300 0200 0100
        DECLE   $0000,  $0318,  $0218,  $0218   ; D8EA   0000 0318 0218 0218
        DECLE   $0110,  $0138,  $023C,  $023E   ; D8EE   0110 0138 023C 023E
        DECLE   $0238,  $0330,  $0300,  $0300   ; D8F2   0238 0330 0300 0300
        DECLE   $0300,  $0000,  $0000           ; D8F6   0300 0000 0000

        SUB     .ISRVEC.0,R0                    ; D8F9   0300 0100
        SUBR    R0,     R0                      ; D8FB   0100
        GSWD    R0                              ; D8FC   0030
        GSWD    R0                              ; D8FD   0030
        SUBR    R6,     R0                      ; D8FE   0130
        SUB@    R4,     R0                      ; D8FF   0320
        CMPR    R7,     R0                      ; D900   0178
        SARC    R0,     2                       ; D901   007C
L_D902:
        SARC    R2,     2                       ; D902   007E
        SARC    R3,     1                       ; D903   007B
L_D904:
        B       L_DA06                          ; D904   0200 0100

        DECLE   $0000,  $0000,  $0100,  $0100   ; D906   0000 0000 0100 0100
        DECLE   $0100,  $0000,  $0200,  $0130   ; D90A   0100 0000 0200 0130
        DECLE   $0330,  $0130,  $0010,  $0078   ; D90E   0330 0130 0010 0078
        DECLE   $007C,  $027C,  $0100,  $0000   ; D912   007C 027C 0100 0000
        DECLE   $0000,  $0100,  $0100,  $0100   ; D916   0000 0100 0100 0100
        DECLE   $0000,  $0200,  $0118           ; D91A   0000 0200 0118

        SUB@    R3,     R0                      ; D91D   0318
        SUBR    R3,     R0                      ; D91E   0118
L_D91F:
        INCR    R0                              ; D91F   0008
        COMR    R4                              ; D920   001C
L_D921:
        RSWD    R4                              ; D921   003C
        DECLE   $027C,  $01DC,  $0000,  $0000   ; D922   027C 01DC 0000 0000
        DECLE   $0100,  $0100,  $0100,  $0000   ; D926   0100 0100 0100 0000
        DECLE   $0200,  $0218,  $0018,  $0218   ; D92A   0200 0218 0018 0218

        DECR    R0                              ; D92E   0010
        COMR    R4                              ; D92F   001C
        SUBR    R7,     R4                      ; D930   013C
L_D931:
        CMPI    #$0179, R6                      ; D931   037E 0179
        DECLE   $0030,  $0000,  $0000,  $0200   ; D933   0030 0000 0000 0200
        DECLE   $0100,  $0000,  $0230,  $0230   ; D937   0100 0000 0230 0230
        DECLE   $0030,  $0220,  $0038,  $007C   ; D93B   0030 0220 0038 007C
        DECLE   $017E,  $03F3,  $01B0,  $0070   ; D93F   017E 03F3 01B0 0070
        DECLE   $0070,  $0018,  $0218,  $0138   ; D943   0070 0018 0218 0138
        DECLE   $0030,  $0270,  $0260,  $0058   ; D947   0030 0270 0260 0058
        DECLE   $0258,  $0068,  $002C,  $012C   ; D94B   0258 0068 002C 012C
        DECLE   $0304,  $011C,  $0000,  $0000   ; D94F   0304 011C 0000 0000
        DECLE   $0000,  $0218,  $0118,  $0038   ; D953   0000 0218 0118 0038
        DECLE   $0230,  $0034,  $0176,  $0266   ; D957   0230 0034 0176 0266
        DECLE   $0063,  $0061,  $0331,  $0330   ; D95B   0063 0061 0331 0330
        DECLE   $0118,  $0038,  $0000,  $0100   ; D95F   0118 0038 0000 0100
        DECLE   $0300,  $0130,  $0038,  $0238   ; D963   0300 0130 0038 0238
        DECLE   $001C,  $010C,  $0206,  $0036   ; D967   001C 010C 0206 0036
        DECLE   $0032,  $0322,  $0363,  $0143   ; D96B   0032 0322 0363 0143
        DECLE   $00C0,  $00E0,  $0100,  $0300   ; D96F   00C0 00E0 0100 0300
        DECLE   $0100,  $0030,  $0230,  $0030   ; D973   0100 0030 0230 0030
        DECLE   $0118,  $0218,  $000C,  $010C   ; D977   0118 0218 000C 010C
        DECLE   $0324,  $0364,  $0144,  $004C   ; D97B   0324 0364 0144 004C
        DECLE   $010C,  $000E,  $0300,  $0100   ; D97F   010C 000E 0300 0100
        DECLE   $0000,  $037A,  $0338,  $0318   ; D983   0000 037A 0338 0318
        DECLE   $0318,  $0038,  $0074,  $0376   ; D987   0318 0038 0074 0376
        DECLE   $0167,  $0131,  $0031,  $0010   ; D98B   0167 0131 0031 0010
        DECLE   $0118,  $0138,  $0200           ; D98F   0118 0138 0200

        B       L_D994                          ; D992   0200 0000

L_D994:
        SUBR    R3,     R4                      ; D994   011C
        DECLE   $031C,  $0118,  $0218,  $0038   ; D995   031C 0118 0218 0038
        DECLE   $0030,  $0376,  $0266,  $0063   ; D999   0030 0376 0266 0063
        DECLE   $0233,  $0031,  $0311,  $0213   ; D99D   0233 0031 0311 0213
        DECLE   $0000                           ; D9A1   0000

        B       L_D9A4                          ; D9A2   0200 0000

L_D9A4:
        SUB@    R6,     R0                      ; D9A4   0330
        DECLE   $0218                           ; D9A5   0218
L_D9A6:
        SUBR    R3,     R0                      ; D9A6   0118
        DECLE   $011C,  $010C,  $0366,  $01F6   ; D9A7   011C 010C 0366 01F6
        DECLE   $00C6,  $008C,  $018C,  $0118   ; D9AB   00C6 008C 018C 0118
        DECLE   $0218                           ; D9AF   0218

        COMR    R4                              ; D9B0   001C
L_D9B1:
        B       L_DCB3                          ; D9B1   0200 0300

L_D9B3:
        SUBR    R0,     R0                      ; D9B3   0100
        DECLE   $0238,  $0038,  $001C,  $000C   ; D9B4   0238 0038 001C 000C
        DECLE   $0006,  $0236,  $0036           ; D9B8   0006 0236 0036

        MVO@    R4,     R5                      ; D9BB   026C
        CMPR    R5,     R4                      ; D9BC   016C
        MVO@    R0,     R5                      ; D9BD   0268
        MVO@    R0,     R1                      ; D9BE   0248
        MVO     R0,     G_0060                  ; D9BF   0240 0060
        SUBR    R0,     R0                      ; D9C1   0100
L_D9C2:
        SUBR    R0,     R0                      ; D9C2   0100
        DECLE   $0200,  $0200,  $0200,  $0100   ; D9C3   0200 0200 0200 0100
        DECLE   $0100,  $0200                   ; D9C7   0100 0200

        B       L_D9CB                          ; D9C9   0200 0000

L_D9CB:
        SUBR    R3,     R0                      ; D9CB   0118
        DECLE   $031A,  $011A,  $020A,  $021E   ; D9CC   031A 011A 020A 021E
        DECLE   $031E,  $011E,  $021E,  $021C   ; D9D0   031E 011E 021E 021C
        DECLE   $0000,  $0000,  $0000,  $0200   ; D9D4   0000 0000 0000 0200
        DECLE   $0200,  $0000,  $0000,  $0318   ; D9D8   0200 0000 0000 0318
        DECLE   $021A,  $001A,  $020A,  $001E   ; D9DC   021A 001A 020A 001E
        DECLE   $031E,  $021E,  $007E,  $023C   ; D9E0   031E 021E 007E 023C
        DECLE   $0000,  $0300,  $0200,  $0100   ; D9E4   0000 0300 0200 0100
        DECLE   $0100,  $0000,  $0000,  $0230   ; D9E8   0100 0000 0000 0230
        DECLE   $0034,  $0034,  $0314,  $011C   ; D9EC   0034 0034 0314 011C
        DECLE   $02BC,  $00FC,  $0278,  $0118   ; D9F0   02BC 00FC 0278 0118
        DECLE   $0200,  $0200,  $0000,  $0000   ; D9F4   0200 0200 0000 0000

        SUBR    R0,     R0                      ; D9F8   0100
L_D9F9:
        SUBR    R0,     R0                      ; D9F9   0100
        DECLE   $0200,  $0030,  $0234,  $0234   ; D9FA   0200 0030 0234 0234

        MVI@    R2,     R4                      ; D9FE   0294
        MVII    #$02FC, R4                      ; D9FF   02BC 02FC
        SARC    R0,     1                       ; DA01   0078
L_DA02:
        SUB@    R3,     R0                      ; DA02   0318
        SUBR    R3,     R0                      ; DA03   0118
        B       L_DC06                          ; DA04   0200 0200
L_DA06:
        B       L_DD08                          ; DA06   0200 0300

        SUBR    R0,     R0                      ; DA08   0100
        B       L_DC0B                          ; DA09   0200 0200

        DECLE   $0030,  $0034,  $0134,  $0214   ; DA0B   0030 0034 0134 0214
        DECLE   $021C,  $02BC,  $00FC,  $0378   ; DA0F   021C 02BC 00FC 0378
        DECLE   $0218,  $0300,  $0000,  $0100   ; DA13   0218 0300 0000 0100
        DECLE   $0100,  $0200                   ; DA17   0100 0200

        B       L_DA1B                          ; DA19   0200 0000

L_DA1B:
        SUBR    R0,     R0                      ; DA1B   0100
        DECLE   $0230,  $0234,  $0234,  $0214   ; DA1C   0230 0234 0234 0214
        DECLE   $001C,  $031C,  $023C,  $01F8   ; DA20   001C 031C 023C 01F8
        DECLE   $0000,  $0100,  $0100,  $0200   ; DA24   0000 0100 0100 0200
        DECLE   $0000,  $0000                   ; DA28   0000 0000

        SUBR    R0,     R0                      ; DA2A   0100
        B       L_DC5D                          ; DA2B   0200 0230

        DECLE   $0030,  $0234,  $0014,  $031C   ; DA2D   0030 0234 0014 031C
        DECLE   $021C,  $011C,  $003C,  $0300   ; DA31   021C 011C 003C 0300
        DECLE   $0100,  $0200,  $0000,  $0000   ; DA35   0100 0200 0000 0000
        DECLE   $0200,  $0200,  $0200,  $0018   ; DA39   0200 0200 0200 0018
        DECLE   $0218,  $001C,  $030C,  $021C   ; DA3D   0218 001C 030C 021C
        DECLE   $021C,  $001C,  $011C,  $0200   ; DA41   021C 001C 011C 0200
        DECLE   $0200                           ; DA45   0200

        B       L_DA48                          ; DA46   0200 0000

L_DA48:
        SUBR    R0,     R0                      ; DA48   0100
        DECLE   $0000,  $0300,  $0218,  $0218   ; DA49   0000 0300 0218 0218
        DECLE   $0018,  $0308,  $021C,  $023E   ; DA4D   0018 0308 021C 023E

        RSWD    R6                              ; DA51   003E
        CMPI    #$01DC, R6                      ; DA52   037E 01DC
        B       L_DC56                          ; DA54   0200 0200

        DECLE   $0000,  $0200,  $0200           ; DA56   0000 0200 0200

        B       L_DC5B                          ; DA59   0200 0200
        B       L_DB69                          ; DA5B   0200 010C

        DECLE   $000C,  $030C,  $023C           ; DA5D   000C 030C 023C

        CMPR    R7,     R6                      ; DA60   017E
        ADDR    R3,     R6                      ; DA61   00DE
        CMPI    #$021A, R6                      ; DA62   037E 021A
        B       L_DB66                          ; DA64   0200 0100

        DECLE   $0100,  $0200,  $0200,  $0200   ; DA66   0100 0200 0200 0200
        DECLE   $0300,  $0300,  $0300,  $030C   ; DA6A   0300 0300 0300 030C
        DECLE   $000C,  $003C,  $037E,  $013E   ; DA6E   000C 003C 037E 013E
        DECLE   $011B,  $0019,  $0000,  $0000   ; DA72   011B 0019 0000 0000
        DECLE   $0100,  $0200,  $0200,  $0000   ; DA76   0100 0200 0200 0000
        DECLE   $0100,  $0000,  $0200,  $0200   ; DA7A   0100 0000 0200 0200
        DECLE   $0080,  $01C6,  $0366,  $017E   ; DA7E   0080 01C6 0366 017E
        DECLE   $023C,  $021E,  $0000,  $0100   ; DA82   023C 021E 0000 0100
        DECLE   $0200,  $0000,  $0000,  $0100   ; DA86   0200 0000 0000 0100
        DECLE   $0000                           ; DA8A   0000

        B       L_DA8D                          ; DA8B   0200 0000

L_DA8D:
        COMR    R0                              ; DA8D   0018
        DECLE   $0118,  $0318,  $013C,  $00FE   ; DA8E   0118 0318 013C 00FE
        DECLE   $021F                           ; DA92   021F

        COMR    R3                              ; DA93   001B
L_DA94:
        B       L_DB96                          ; DA94   0200 0100

        DECLE   $0100,  $0100,  $0300,  $0300   ; DA96   0100 0100 0300 0300
        DECLE   $0100,  $0110,  $0118,  $0318   ; DA9A   0100 0110 0118 0318
        DECLE   $021C                           ; DA9E   021C

        SUBR    R3,     R4                      ; DA9F   011C
        SUBR    R3,     R4                      ; DAA0   011C
        SUB@    R3,     R0                      ; DAA1   0318
        SUBR    R7,     R0                      ; DAA2   0138
        ADDR    R7,     R0                      ; DAA3   00F8
        B       L_DCA6                          ; DAA4   0200 0200

        DECLE   $0000,  $0000,  $0280,  $01C0   ; DAA6   0000 0000 0280 01C0
        DECLE   $0260,  $0060,  $0238,  $0238   ; DAAA   0260 0060 0238 0238
        DECLE   $013C,  $001C,  $023C,  $0338   ; DAAE   013C 001C 023C 0338
        DECLE   $0278,  $0130,  $0000,  $0200   ; DAB2   0278 0130 0000 0200
        DECLE   $0100,  $0300,  $0100,  $0000   ; DAB6   0100 0300 0100 0000
        DECLE   $0000,  $0100,  $0030,  $02B0   ; DABA   0000 0100 0030 02B0
        DECLE   $00F0,  $0078,  $0038,  $023C   ; DABE   00F0 0078 0038 023C
        DECLE   $013C,  $0038,  $023C,  $030C   ; DAC2   013C 0038 023C 030C
        DECLE   $021C,  $013C,  $037C,  $004C   ; DAC6   021C 013C 037C 004C
        DECLE   $036C,  $002C,  $0136,  $0316   ; DACA   036C 002C 0136 0316
        DECLE   $0012,  $0202,  $0202,  $0106   ; DACE   0012 0202 0202 0106
        DECLE   $0000,  $0200,  $000C,  $020C   ; DAD2   0000 0200 000C 020C
        DECLE   $013E,  $007E,  $0276,  $0246   ; DAD6   013E 007E 0276 0246
        DECLE   $0146,  $0166,  $0022,  $0223   ; DADA   0146 0166 0022 0223
        DECLE   $0103,  $0001,  $0101,  $0303   ; DADE   0103 0001 0101 0303
        DECLE   $0000,  $0100,  $0118,  $01F8   ; DAE2   0000 0100 0118 01F8
        DECLE   $03FC,  $008C,  $008C,  $024C   ; DAE6   03FC 008C 008C 024C
        DECLE   $014C,  $0306,  $0206,  $0306   ; DAEA   014C 0306 0206 0306
        DECLE   $0303,  $0301,  $0001,  $0001   ; DAEE   0303 0301 0001 0001

        SUB     .ISRVEC.0,R0                    ; DAF2   0300 0100
        SUBR    R3,     R0                      ; DAF4   0118
        SARC    R0,     2                       ; DAF5   007C
L_DAF6:
        ADDR    R7,     R4                      ; DAF6   00FC
        DECLE   $02CC,  $028C,  $018C,  $0086   ; DAF7   02CC 028C 018C 0086
        DECLE   $0206,  $0206,  $0303,  $0101   ; DAFB   0206 0206 0303 0101
        DECLE   $0001,  $0200,  $0100,  $0000   ; DAFF   0001 0200 0100 0000
        DECLE   $0200,  $0218,  $023C,  $003C   ; DB03   0200 0218 023C 003C
        DECLE   $026C,  $016C,  $004C,  $004F   ; DB07   026C 016C 004C 004F
        DECLE   $0047,  $0341,  $0101,  $0000   ; DB0B   0047 0341 0101 0000
        DECLE   $0000,  $0100,  $0000,  $0200   ; DB0F   0000 0100 0000 0200
        DECLE   $0000,  $0218,  $0018,  $0238   ; DB13   0000 0218 0018 0238
        DECLE   $0138,  $006F,  $006F,  $0041   ; DB17   0138 006F 006F 0041
        DECLE   $0341,  $0140,  $0020,  $0020   ; DB1B   0341 0140 0020 0020
        DECLE   $0100,  $0000                   ; DB1F   0100 0000

        B       L_DB23                          ; DB21   0200 0000
L_DB23:
        B       L_DE9D                          ; DB23   0200 0378

        DECLE   $0318,  $0118,  $0018,  $0038   ; DB25   0318 0118 0018 0038
        DECLE   $0138,  $003C,  $023E,  $0026   ; DB29   0138 003C 023E 0026
        DECLE   $0032,  $0032,  $0110,  $0210   ; DB2D   0032 0032 0110 0210
        DECLE   $0000,  $0200,  $0300,  $031C   ; DB31   0000 0200 0300 031C
        DECLE   $011C,  $001C,  $0038,  $0138   ; DB35   011C 001C 0038 0138
        DECLE   $0038,  $0238,  $0018,  $001C   ; DB39   0038 0238 0018 001C
        DECLE   $001C,  $010C,  $020C,  $001C   ; DB3D   001C 010C 020C 001C
        DECLE   $0200,  $0200,  $0300,  $010C   ; DB41   0200 0200 0300 010C
        DECLE   $000C,  $013E,  $017E,  $0076   ; DB45   000C 013E 017E 0076
        DECLE   $0246,  $0046,  $0166,  $0222   ; DB49   0246 0046 0166 0222
        DECLE   $0123,  $0203,  $0001,  $0301   ; DB4D   0123 0203 0001 0301
        DECLE   $0303,  $0300,  $0300,  $0018   ; DB51   0303 0300 0300 0018
        DECLE   $0078,  $02FC,  $01CC,  $01CC   ; DB55   0078 02FC 01CC 01CC
        DECLE   $004C,  $004C,  $0206,  $0206   ; DB59   004C 004C 0206 0206
        DECLE   $0006,  $0003,  $0001,  $0301   ; DB5D   0006 0003 0001 0301
        DECLE   $0101,  $0100,  $0000           ; DB61   0101 0100 0000

        COMR    R1                              ; DB64   0019
        SUBR    R7,     R4                      ; DB65   013C
L_DB66:
        CMPI    #$016C, R4                      ; DB66   037C 016C
        MVO@    R4,     R5                      ; DB68   026C
L_DB69:
        ADCR    R4                              ; DB69   002C
        DECLE   $012C,  $0006,  $0206,  $0202   ; DB6A   012C 0006 0206 0202
        DECLE   $0002,  $0000                   ; DB6E   0002 0000

        SUBR    R0,     R0                      ; DB70   0100
        B       L_DD73                          ; DB71   0200 0200
        B       L_DC93                          ; DB73   0200 011E

        DECLE   $033F,  $013F,  $007D,  $0078   ; DB75   033F 013F 007D 0078
        DECLE   $0158,  $0038,  $022C,  $000C   ; DB79   0158 0038 022C 000C
        DECLE   $0004,  $0004                   ; DB7D   0004 0004

        SUBR    R0,     R6                      ; DB7F   0106
        B       L_DB82                          ; DB80   0200 0000
L_DB82:
        B       L_DB84                          ; DB82   0200 0000

L_DB84:
        COMR    R0                              ; DB84   0018
        DECLE   $021C,  $013E,  $0136,  $0136   ; DB85   021C 013E 0136 0136
        DECLE   $0166,  $0262,  $0162,  $0143   ; DB89   0166 0262 0162 0143
        DECLE   $01C3,  $02C0,  $0280,  $0100   ; DB8D   01C3 02C0 0280 0100
        DECLE   $0300,  $0000,  $0000,  $0218   ; DB91   0300 0000 0000 0218

        COMR    R0                              ; DB95   0018
L_DB96:
        RSWD    R4                              ; DB96   003C
        CMPR    R7,     R4                      ; DB97   017C
        CMPR    R5,     R4                      ; DB98   016C
        ADD@    R1,     R4                      ; DB99   02CC
        MOVR    R0,     R6                      ; DB9A   0086
        MOVR    R0,     R6                      ; DB9B   0086
        XORR    R0,     R2                      ; DB9C   01C2
        MVO     R2,     .BTAB.40                ; DB9D   0242 0240
        ADDR    R0,     R0                      ; DB9F   00C0
        B       L_DEA2                          ; DBA0   0200 0300

        DECLE   $0100,  $0200,  $0030,  $0230   ; DBA2   0100 0200 0030 0230
        DECLE   $0130,  $0170,  $0278           ; DBA6   0130 0170 0278

        SARC    R3,     1                       ; DBA9   007B
        ADD@    R3,     R7                      ; DBAA   02DF

        ADDR    R1,     R5                      ; DBAB   00CD
        MOVR    R0,     R1                      ; DBAC   0081
        MVI     .BTAB.40,R0                     ; DBAD   0280 0240
        SWAP    R0,     1                       ; DBAF   0040
        SWAP    R0,     1                       ; DBB0   0040
        CLRR    R0                              ; DBB1   01C0
        B       L_DDB4                          ; DBB2   0200 0200

        DECLE   $0030,  $0330,  $0138,  $0238   ; DBB4   0030 0330 0138 0238
        DECLE   $027F,  $026F,  $006D,  $0061   ; DBB8   027F 026F 006D 0061
        DECLE   $0240,  $0040,  $0020,  $0020   ; DBBC   0240 0040 0020 0020
        DECLE   $0160,  $0200,  $0000,  $0000   ; DBC0   0160 0200 0000 0000

        SUB     .ISRVEC.0,R0                    ; DBC4   0300 0100
        B       L_DBC8                          ; DBC6   0200 0000
L_DBC8:
        B       L_DECA                          ; DBC8   0200 0300

        DECLE   $0000,  $0218,  $0118,  $0118   ; DBCA   0000 0218 0118 0118
        DECLE   $0108,  $011E,  $023F,  $013F   ; DBCE   0108 011E 023F 013F

        SUBR    R7,     R5                      ; DBD2   013D
        MVO@    R5,     R5                      ; DBD3   026D
        B       L_DDD6                          ; DBD4   0200 0200

        DECLE   $0100,  $0300,  $0300,  $0300   ; DBD6   0100 0300 0300 0300
        DECLE   $0300,  $0018,  $0018,  $0318   ; DBDA   0300 0018 0018 0318
        DECLE   $0208,  $011E,  $023F,  $023F   ; DBDE   0208 011E 023F 023F
        DECLE   $023D                           ; DBE2   023D

        SAR     R1,     2                       ; DBE3   006D
        SUBR    R0,     R0                      ; DBE4   0100
        B       L_DBE7                          ; DBE5   0200 0000
L_DBE7:
        B       L_DDE9                          ; DBE7   0200 0200

        DECLE   $0100,  $0300,  $0230,  $0330   ; DBE9   0100 0300 0230 0330
        DECLE   $0130,  $0018,  $023C,  $007E   ; DBED   0130 0018 023C 007E
        DECLE   $007E,  $017A,  $02DA,  $0100   ; DBF1   007E 017A 02DA 0100
        DECLE   $0100,  $0200,  $0200,  $0300   ; DBF5   0100 0200 0200 0300

        SUBR    R0,     R0                      ; DBF9   0100
        B       L_DE2C                          ; DBFA   0200 0230

        SUB@    R6,     R0                      ; DBFC   0330
        GSWD    R0                              ; DBFD   0030
        SUBR    R3,     R0                      ; DBFE   0118
        SUBI    #$017E, R4                      ; DBFF   033C 017E
        SARC    R2,     2                       ; DC01   007E
        CMPR    R7,     R2                      ; DC02   017A
        ADD@    R3,     R2                      ; DC03   02DA
        B       L_DD06                          ; DC04   0200 0100

L_DC06:
        SUB     .BTAB.00,R0                     ; DC06   0300 0200
        DECLE   $0200,  $0300                   ; DC08   0200 0300

        SUBR    R0,     R0                      ; DC0A   0100
L_DC0B:
        SUB@    R6,     R0                      ; DC0B   0330
        DECLE   $0330,  $0230                   ; DC0C   0330 0230

        SUB@    R3,     R0                      ; DC0E   0318
        RSWD    R4                              ; DC0F   003C
        CMPI    #$017E, R6                      ; DC10   037E 017E
        SARC    R2,     1                       ; DC12   007A
        ADDR    R3,     R2                      ; DC13   00DA
        SUB     .BTAB.00,R0                     ; DC14   0300 0200
        SUBR    R0,     R0                      ; DC16   0100
        B       L_DE19                          ; DC17   0200 0200
        B       L_DC1B                          ; DC19   0200 0000

L_DC1B:
        SUBR    R0,     R0                      ; DC1B   0100
        DECLE   $0230,  $0030,  $0230,  $0218   ; DC1C   0230 0030 0230 0218
        DECLE   $013C,  $037C,  $027E,  $037E   ; DC20   013C 037C 027E 037E
        DECLE   $0100,  $0000,  $0200,  $0000   ; DC24   0100 0000 0200 0000
        DECLE   $0000                           ; DC28   0000

        SUBR    R0,     R0                      ; DC29   0100
        B       L_DD2C                          ; DC2A   0200 0100

        DECLE   $0130,  $0230,  $0230,  $0318   ; DC2C   0130 0230 0230 0318
        DECLE   $013C,  $023C,  $027E,  $037E   ; DC30   013C 023C 027E 037E
        DECLE   $0000,  $0100,  $0300,  $0100   ; DC34   0000 0100 0300 0100
        DECLE   $0000,  $0100,  $0200,  $0200   ; DC38   0000 0100 0200 0200
        DECLE   $0118,  $0318,  $0018,  $0208   ; DC3C   0118 0318 0018 0208
        DECLE   $031E,  $003F,  $033F,  $037D   ; DC40   031E 003F 033F 037D
        DECLE   $0100,  $0300,  $0300,  $0100   ; DC44   0100 0300 0300 0100
        DECLE   $0000,  $0300,  $0100,  $0318   ; DC48   0000 0300 0100 0318
        DECLE   $0218,  $0218,  $0108,  $001E   ; DC4C   0218 0218 0108 001E
        DECLE   $023F,  $023F,  $033D,  $016D   ; DC50   023F 023F 033D 016D
        DECLE   $0000,  $0200                   ; DC54   0000 0200
L_DC56:
        SUB     .STIC.X.0,R0                    ; DC56   0300 0000
        SUB     .BTAB.00,R0                     ; DC58   0300 0200
        SUBR    R0,     R0                      ; DC5A   0100
L_DC5B:
        SUB@    R6,     R0                      ; DC5B   0330
        GSWD    R0                              ; DC5C   0030
L_DC5D:
        ANDR    R6,     R0                      ; DC5D   01B0
        DECLE   $03D8,  $02BC,  $00FC,  $017C   ; DC5E   03D8 02BC 00FC 017C
        DECLE   $0018,  $0118,  $0300,  $0000   ; DC62   0018 0118 0300 0000
        DECLE   $0000,  $0218,  $0018,  $0210   ; DC66   0000 0218 0018 0210
        DECLE   $0230,  $0138,  $0178,  $0178   ; DC6A   0230 0138 0178 0178
        DECLE   $003C,  $013C,  $003C,  $0018   ; DC6E   003C 013C 003C 0018
        DECLE   $0318,  $0018,  $0300,  $0100   ; DC72   0318 0018 0300 0100
        DECLE   $0000                           ; DC76   0000

        CLRC                                    ; DC77   0006
        SUB     .STIC.Y.4,R6                    ; DC78   0306 000C
        SUBR    R1,     R4                      ; DC7A   010C
        SUBR    R1,     R4                      ; DC7B   010C
        SUB@    R1,     R4                      ; DC7C   030C
        SUB@    R1,     R7                      ; DC7D   030F

        DECLE   $0207,  $0007                   ; DC7E   0207 0007

        INCR    R6                              ; DC80   000E
        INCR    R6                              ; DC81   000E
        BGT     L_DC92                          ; DC82   020E 000E

        SUB     .ISRVEC.0,R0                    ; DC84   0300 0100
        B       L_DE88                          ; DC86   0200 0200

        DECLE   $0200,  $0303,  $010F,  $011C   ; DC88   0200 0303 010F 011C
        DECLE   $001F                           ; DC8C   001F

        BESC    L_DE9E                          ; DC8D   020F 020F

        MVI@    R3,     R6                      ; DC8F   029E
        XORR    R7,     R4                      ; DC90   01FC
        ADDR    R7,     R4                      ; DC91   00FC
L_DC92:
        XORR    R7,     R0                      ; DC92   01F8
L_DC93:
        RRC     R0,     1                       ; DC93   0070
        B       L_DF96                          ; DC94   0200 0300

        DECLE   $0000,  $0300,  $03C0,  $01E0   ; DC96   0000 0300 03C0 01E0
        DECLE   $03F0,  $01F8,  $007E,  $013E   ; DC9A   03F0 01F8 007E 013E
        DECLE   $023E,  $0018,  $031A,  $021E   ; DC9E   023E 0018 031A 021E

        INCR    R4                              ; DCA2   000C
        B       L_DD85                          ; DCA3   0200 00E0

        ADDR    R4,     R0                      ; DCA5   00E0
L_DCA6:
        ADDR    R6,     R0                      ; DCA6   00F0
        DECLE   $0070,  $0178,  $0278,  $003C   ; DCA7   0070 0178 0278 003C
        DECLE   $013C,  $003C,  $0138,  $0330   ; DCAB   013C 003C 0138 0330
        DECLE   $0230                           ; DCAF   0230

        RSWD    R0                              ; DCB0   0038
        SUBR    R3,     R0                      ; DCB1   0118
        INCR    R4                              ; DCB2   000C
L_DCB3:
        SUBR    R1,     R4                      ; DCB3   010C
        DECLE   $0300,  $0000,  $0000,  $0200   ; DCB4   0300 0000 0000 0200
        DECLE   $0010,  $02B8,  $02F8,  $01F0   ; DCB8   0010 02B8 02F8 01F0
        DECLE   $01F0,  $0178,  $001C,  $010E   ; DCBC   01F0 0178 001C 010E
        DECLE   $0003,  $0001                   ; DCC0   0003 0001

        SUB     .STIC.X.0,R0                    ; DCC2   0300 0000
        SUB     G_0300, R0                      ; DCC4   0300 0300
        SUBR    R0,     R0                      ; DCC6   0100
        B       L_DEC9                          ; DCC7   0200 0200

        DECLE   $0300,  $0000,  $0118,  $0318   ; DCC9   0300 0000 0118 0318
        DECLE   $0118,  $0208,  $001E,  $023F   ; DCCD   0118 0208 001E 023F
        DECLE   $023F                           ; DCD1   023F

        ADCR    R5                              ; DCD2   002D
        CMP@    R5,     R5                      ; DCD3   036D
        B       L_DFD6                          ; DCD4   0200 0300

        DECLE   $0100,  $0100,  $0300,  $0300   ; DCD6   0100 0100 0300 0300
        DECLE   $0200,  $0330,  $0130,  $0330   ; DCDA   0200 0330 0130 0330
        DECLE   $0118,  $021C,  $033C,  $033C   ; DCDE   0118 021C 033C 033C
        DECLE   $023C                           ; DCE2   023C

        CMPR    R7,     R4                      ; DCE3   017C
        SUBR    R0,     R0                      ; DCE4   0100
        B       L_DFE7                          ; DCE5   0200 0300

        DECLE   $0300,  $0000,  $0000,  $0130   ; DCE7   0300 0000 0000 0130
        DECLE   $0130,  $0330,  $0018,  $013C   ; DCEB   0130 0330 0018 013C
        DECLE   $033C,  $02FC,  $017C,  $0338   ; DCEF   033C 02FC 017C 0338
        DECLE   $0338,  $0000,  $0000,  $0100   ; DCF3   0338 0000 0000 0100
        DECLE   $0000                           ; DCF7   0000

        B       L_DCFA                          ; DCF8   0200 0000

L_DCFA:
        SUB     .BTAB.0C,R0                     ; DCFA   0300 020C
        SLL     R0,     2                       ; DCFC   004C
        CMPR    R5,     R4                      ; DCFD   016C
        SUB@    R6,     R6                      ; DCFE   0336
        SUBR    R7,     R6                      ; DCFF   013E
        SUBR    R3,     R7                      ; DD00   011F
        INCR    R7                              ; DD01   000F

        INCR    R5                              ; DD02   000D
L_DD03:
        INCR    R5                              ; DD03   000D
        B       L_DD06                          ; DD04   0200 0000

L_DD06:
        SUB     .ISRVEC.0,R0                    ; DD06   0300 0100
L_DD08:
        B       L_DD0A                          ; DD08   0200 0000

L_DD0A:
        SUB     G_0306, R0                      ; DD0A   0300 0306
        DECLE   $021C,  $001E,  $021E,  $03BE   ; DD0C   021C 001E 021E 03BE
        DECLE   $02FC,  $00FC,  $02F8,  $0270   ; DD10   02FC 00FC 02F8 0270
        DECLE   $0200                           ; DD14   0200

        SUBR    R0,     R0                      ; DD15   0100
        B       L_DE18                          ; DD16   0200 0100

        DECLE   $00C0,  $00F0,  $02F8,  $03F8   ; DD18   00C0 00F0 02F8 03F8
        DECLE   $027C,  $003E,  $021E,  $001E   ; DD1C   027C 003E 021E 001E
        DECLE   $021C                           ; DD20   021C

        SUBR    R1,     R4                      ; DD21   010C
        DECR    R6                              ; DD22   0016
        SUBR    R1,     R2                      ; DD23   010A
        SUBR    R0,     R0                      ; DD24   0100
        B       L_DE27                          ; DD25   0200 0100
        B       L_DF29                          ; DD27   0200 0200

        AND     G_03E0, R0                      ; DD29   0380 03E0
        XORR    R6,     R0                      ; DD2B   01F0
L_DD2C:
        ADD@    R6,     R0                      ; DD2C   02F0
        DECLE   $03E0,  $0078,  $033C,  $0244   ; DD2D   03E0 0078 033C 0244
        DECLE   $0060,  $0130,  $0210,  $0000   ; DD31   0060 0130 0210 0000

        B       L_DD37                          ; DD35   0200 0000

L_DD37:
        SUB     .ISRVEC.0,R0                    ; DD37   0300 0100
        DECLE   $0200,  $0300,  $0340,  $0246   ; DD39   0200 0300 0340 0246
        DECLE   $01E4,  $01E4,  $02EC,  $03FC   ; DD3D   01E4 01E4 02EC 03FC
        DECLE   $01F8,  $00F8,  $0370,  $0100   ; DD41   01F8 00F8 0370 0100
        DECLE   $0300,  $0000,  $0100,  $0100   ; DD45   0300 0000 0100 0100
        DECLE   $0340,  $0040,  $0280,  $0080   ; DD49   0340 0040 0280 0080
        DECLE   $01C0,  $02E0,  $00E0,  $03F3   ; DD4D   01C0 02E0 00E0 03F3
        DECLE   $01FE,  $007C,  $0070,  $0046   ; DD51   01FE 007C 0070 0046
        DECLE   $01E6,  $03FC,  $01FC,  $0278   ; DD55   01E6 03FC 01FC 0278
        DECLE   $027D,  $037F,  $003F,  $022F   ; DD59   027D 037F 003F 022F
        DECLE   $0137,  $0010,  $001C,  $020C   ; DD5D   0137 0010 001C 020C

        SUBR    R0,     R0                      ; DD61   0100
        B       L_DD64                          ; DD62   0200 0000
L_DD64:
        B       L_DD66                          ; DD64   0200 0000

L_DD66:
        SUBR    R0,     R0                      ; DD66   0100
        DECLE   $0000,  $0000,  $0000,  $02E0   ; DD67   0000 0000 0000 02E0
        DECLE   $01F8,  $01FE,  $033F,  $023F   ; DD6B   01F8 01FE 033F 023F

        GSWD    R3                              ; DD6F   0033
        COMR    R1                              ; DD70   0019
        SUB@    R3,     R6                      ; DD71   031E
        CLRC                                    ; DD72   0006
L_DD73:
        SUB     G_034D, R0                      ; DD73   0300 034D
        DECLE   $004D,  $021C,  $003C,  $017C   ; DD75   004D 021C 003C 017C
        DECLE   $024C,  $016C,  $012C,  $0036   ; DD79   024C 016C 012C 0036

        SUBR    R2,     R6                      ; DD7D   0116
        DECR    R2                              ; DD7E   0012
        EIS                                     ; DD7F   0002
        EIS                                     ; DD80   0002
        BLE     L_DD83                          ; DD81   0206 0000

L_DD83:
        SUBR    R0,     R0                      ; DD83   0100
        MVO@    R5,     R1                      ; DD84   024D
L_DD85:
        SLL     R1,     2                       ; DD85   004D
        DECLE   $033E,  $007E,  $0276,  $0246   ; DD86   033E 007E 0276 0246
        DECLE   $0346,  $0166,  $0322,  $0323   ; DD8A   0346 0166 0322 0323
        DECLE   $0203,  $0301,  $0001,  $0303   ; DD8E   0203 0301 0001 0303
        DECLE   $0300,  $0100,  $0299,  $03F9   ; DD92   0300 0100 0299 03F9
        DECLE   $02FC,  $018C,  $028C,  $024C   ; DD96   02FC 018C 028C 024C
        DECLE   $024C,  $0006,  $0106,  $0206   ; DD9A   024C 0006 0106 0206
        DECLE   $0003,  $0201,  $0201,  $0101   ; DD9E   0003 0201 0201 0101
        DECLE   $0300,  $0200,  $0399,  $017D   ; DDA2   0300 0200 0399 017D
        DECLE   $00FC,  $02CC,  $008C,  $008C   ; DDA6   00FC 02CC 008C 008C
        DECLE   $0186,  $0206,  $0106,  $0103   ; DDAA   0186 0206 0106 0103
        DECLE   $0201,  $0201,  $0300,  $0100   ; DDAE   0201 0201 0300 0100
        DECLE   $0200,  $0200                   ; DDB2   0200 0200
L_DDB4:
        AND@    R3,     R1                      ; DDB4   0399
        DECLE   $00BD,  $013C,  $036C,  $016C   ; DDB5   00BD 013C 036C 016C
        DECLE   $004C,  $014F,  $0247,  $0241   ; DDB9   004C 014F 0247 0241
        DECLE   $0101,  $0300,  $0000,  $0200   ; DDBD   0101 0300 0000 0200

        SUB     .STIC.X.0,R0                    ; DDC1   0300 0000
        SUB     G_035A, R0                      ; DDC3   0300 035A
        ANDR    R3,     R1                      ; DDC5   0199
        ANDI    #$033C, R1                      ; DDC6   03B9 033C
        CMP@    R5,     R7                      ; DDC8   036F
        MVO@    R7,     R5                      ; DDC9   026F
        SWAP    R1,     1                       ; DDCA   0041
        MVO     R1,     G_0040                  ; DDCB   0241 0040
        SUBR    R4,     R0                      ; DDCD   0120
        NEGR    R0                              ; DDCE   0020
        SUBR    R0,     R0                      ; DDCF   0100
        B       L_DFD2                          ; DDD0   0200 0200

        DECLE   $0000                           ; DDD2   0000

        SUBR    R0,     R0                      ; DDD3   0100
        CMPR    R7,     R6                      ; DDD4   017E
        AND@    R3,     R5                      ; DDD5   039D
L_DDD6:
        MVI@    R3,     R5                      ; DDD6   029D
        DECLE   $0018,  $0138,  $0038,  $013C   ; DDD7   0018 0138 0038 013C
        DECLE   $033E,  $0026,  $0032,  $0232   ; DDDB   033E 0026 0032 0232
        DECLE   $0010,  $0210                   ; DDDF   0010 0210

        B       L_DEE3                          ; DDE1   0200 0100

        SUBR    R0,     R0                      ; DDE3   0100
        CMPR    R3,     R4                      ; DDE4   015C
        SLLC    R1,     2                       ; DDE5   005D
        SUBR    R3,     R5                      ; DDE6   011D
        RSWD    R0                              ; DDE7   0038
        RSWD    R0                              ; DDE8   0038
L_DDE9:
        SUBI    #$0238, R0                      ; DDE9   0338 0238
        DECLE   $0218,  $031C,  $011C,  $020C   ; DDEB   0218 031C 011C 020C
        DECLE   $020C,  $031C,  $0000,  $0200   ; DDEF   020C 031C 0000 0200
        DECLE   $0300,  $014C,  $024C,  $001E   ; DDF3   0300 014C 024C 001E
        DECLE   $023E,  $0236,  $0066,  $0346   ; DDF7   023E 0236 0066 0346
        DECLE   $0246,  $0342,  $0123,  $0023   ; DDFB   0246 0342 0123 0023
        DECLE   $0301,  $0101,  $0203,  $0300   ; DDFF   0301 0101 0203 0300
        DECLE   $0300,  $0218,  $0378,  $03FC   ; DE03   0300 0218 0378 03FC
        DECLE   $01CC,  $01CC,  $006C,  $012C   ; DE07   01CC 01CC 006C 012C
        DECLE   $0228,  $0028,  $020C,  $0004   ; DE0B   0228 0028 020C 0004
        DECLE   $0104,  $0104,  $0204,  $0200   ; DE0F   0104 0104 0204 0200
        DECLE   $0200,  $0138,  $0138,  $0278   ; DE13   0200 0138 0138 0278

        ADDR    R3,     R0                      ; DE17   00D8
L_DE18:
        ADD@    R3,     R0                      ; DE18   02D8
L_DE19:
        PULR    R0                              ; DE19   02B0
        DECLE   $01B0,  $00B0,  $00F0,  $0150   ; DE1A   01B0 00B0 00F0 0150
        DECLE   $0058,  $0108,  $0308,  $0200   ; DE1E   0058 0108 0308 0200
        DECLE   $0200,  $0000,  $027C           ; DE22   0200 0000 027C

        ADDR    R7,     R4                      ; DE25   00FC
        ADDR    R7,     R0                      ; DE26   00F8
L_DE27:
        ADD     G_0180, R0                      ; DE27   02C0 0180
        MVI@    R4,     R0                      ; DE29   02A0
        AND@    R4,     R0                      ; DE2A   03A0
        ANDR    R4,     R0                      ; DE2B   01A0
L_DE2C:
        ADDR    R0,     R0                      ; DE2C   00C0
        DECLE   $01C0,  $0280,  $0000,  $0300   ; DE2D   01C0 0280 0000 0300
        DECLE   $0300,  $0000,  $0200,  $0000   ; DE31   0300 0000 0200 0000
        DECLE   $0000,  $0000,  $0200,  $0100   ; DE35   0000 0000 0200 0100
        DECLE   $0202                           ; DE39   0202

        SETC                                    ; DE3A   0007
        SUBR    R1,     R7                      ; DE3B   010F

        DECLE   $027D,  $0139,  $0014,  $030C   ; DE3C   027D 0139 0014 030C
        DECLE   $0238,  $0000,  $0000           ; DE40   0238 0000 0000

        SUB     .BTAB.61,R0                     ; DE43   0300 0261
        ADD@    R6,     R1                      ; DE45   02F1
        ANDI    #$0213, R3                      ; DE46   03BB 0213
        SETC                                    ; DE48   0007
        MVO@    R7,     R4                      ; DE49   0267
        CMPI    #$027E, R6                      ; DE4A   037E 027E
        ADDR    R0,     R0                      ; DE4C   00C0
        MVI     .STIC.X.0,R0                    ; DE4D   0280 0000
        SUB     .ISRVEC.0,R0                    ; DE4F   0300 0100
        B       L_DF53                          ; DE51   0200 0100

        DECLE   $0200,  $0300,  $0200,  $0090   ; DE53   0200 0300 0200 0090
        DECLE   $02D8,  $006C,  $015C,  $0058   ; DE57   02D8 006C 015C 0058
        DECLE   $0138,  $0330,  $0370,  $0360   ; DE5B   0138 0330 0370 0360
        DECLE   $0070,  $0378,  $013E,  $021F   ; DE5F   0070 0378 013E 021F
        DECLE   $010F,  $0100,  $0203,  $0007   ; DE63   010F 0100 0203 0007
        DECLE   $0107,  $000F,  $030E,  $020C   ; DE67   0107 000F 030E 020C
        DECLE   $030C,  $011C,  $037C,  $037A   ; DE6B   030C 011C 037C 037A
        DECLE   $02C6,  $0384,  $008C,  $0308   ; DE6F   02C6 0384 008C 0308
        DECLE   $0108,  $000D,  $000D,  $031E   ; DE73   0108 000D 000D 031E
        DECLE   $023E                           ; DE77   023E

        SUBR    R6,     R6                      ; DE78   0136
        MVO@    R6,     R4                      ; DE79   0266
        MVO     R6,     .BTAB.46                ; DE7A   0246 0246
        SWAP    R2,     1                       ; DE7C   0042
        SUBR    R4,     R3                      ; DE7D   0123
L_DE7E:
        BPL     L_DE7E                          ; DE7E   0223 0001

        DECLE   $0201                           ; DE80   0201

        BPL     L_DF83                          ; DE81   0203 0100

        SUB     .BTAB.18,R0                     ; DE83   0300 0218
        CMPI    #$01FC, R0                      ; DE85   0378 01FC
        ADDR    R1,     R4                      ; DE87   00CC
L_DE88:
        ADD@    R1,     R4                      ; DE88   02CC
        DECLE   $006C,  $000C,  $0128,  $0228   ; DE89   006C 000C 0128 0228
        DECLE   $010C,  $0104,  $0204,  $0204   ; DE8D   010C 0104 0204 0204
        DECLE   $0304,  $0100,  $0200,  $0238   ; DE91   0304 0100 0200 0238

        SUBI    #$0078, R0                      ; DE95   0338 0078
        XORR    R3,     R0                      ; DE97   01D8
        XOR@    R3,     R0                      ; DE98   03D8
        ANDR    R6,     R0                      ; DE99   01B0
        MOVR    R6,     R0                      ; DE9A   00B0
        ANDR    R6,     R0                      ; DE9B   01B0
        ADD@    R6,     R0                      ; DE9C   02F0
L_DE9D:
        MVO@    R0,     R2                      ; DE9D   0250
L_DE9E:
        CMPR    R3,     R0                      ; DE9E   0158
        DECLE   $0308,  $0008,  $0200           ; DE9F   0308 0008 0200
L_DEA2:
        SUB     .STIC.X.0,R0                    ; DEA2   0300 0000
        DECLE   $037C,  $03FC,  $01F8,  $03C0   ; DEA4   037C 03FC 01F8 03C0
        DECLE   $0180,  $02A0,  $00A0,  $02A0   ; DEA8   0180 02A0 00A0 02A0
        DECLE   $02C0,  $00C0,  $0380,  $0200   ; DEAC   02C0 00C0 0380 0200
        DECLE   $0300,  $0100,  $0200,  $0200   ; DEB0   0300 0100 0200 0200
        DECLE   $0100,  $0000,  $0000           ; DEB4   0100 0000 0000

        B       L_DEB9                          ; DEB7   0200 0000

L_DEB9:
        SUBR    R0,     R2                      ; DEB9   0102
        SUBR    R0,     R7                      ; DEBA   0107
        SUB@    R1,     R7                      ; DEBB   030F

        DECLE   $007D,  $0239,  $0214,  $020C   ; DEBC   007D 0239 0214 020C
        DECLE   $0138,  $0200,  $0200           ; DEC0   0138 0200 0200

        SUB     G_0061, R0                      ; DEC3   0300 0061
        ADDR    R6,     R1                      ; DEC5   00F1
        ANDR    R7,     R3                      ; DEC6   01BB
        DECR    R3                              ; DEC7   0013
        SUBR    R0,     R7                      ; DEC8   0107

L_DEC9:
        CMP@    R4,     R7                      ; DEC9   0367
L_DECA:
        CMPR    R7,     R6                      ; DECA   017E
        DECLE   $007E,  $00C0,  $0280,  $0100   ; DECB   007E 00C0 0280 0100
        DECLE   $0000,  $0000,  $0300,  $0300   ; DECF   0000 0000 0300 0300
        DECLE   $0000                           ; DED3   0000

        SUBR    R0,     R0                      ; DED4   0100
        DIS                                     ; DED5   0003
        SUBR    R0,     R7                      ; DED6   0107
        SUBR    R0,     R7                      ; DED7   0107

        DECLE   $020F,  $010E,  $030C,  $030C   ; DED8   020F 010E 030C 030C
        DECLE   $001C,  $027C                   ; DEDC   001C 027C

        CMPI    #$00C6, R2                      ; DEDE   037A 00C6
        AND     G_038C, R4                      ; DEE0   0384 038C
        SUBR    R1,     R0                      ; DEE2   0108
L_DEE3:
        SUB@    R1,     R0                      ; DEE3   0308
        CMP@    R6,     R0                      ; DEE4   0370
        SUBI    #$0238, R0                      ; DEE5   0338 0238
        COMR    R4                              ; DEE7   001C
        BNEQ    L_DEF8                          ; DEE8   020C 000E

        SUBR    R0,     R6                      ; DEEA   0106
        DECR    R6                              ; DEEB   0016
        SUBR    R6,     R4                      ; DEEC   0134
        PSHR    R4                              ; DEED   0274
        MVO@    R4,     R1                      ; DEEE   024C
        SLL     R0,     1                       ; DEEF   0048
        CMPR    R1,     R0                      ; DEF0   0148
        SUBR    R1,     R0                      ; DEF1   0108
        SUB     .BTAB.00,R0                     ; DEF2   0300 0200
        SLR     R0,     1                       ; DEF4   0060
        CMPR    R6,     R0                      ; DEF5   0170
        RRC     R0,     1                       ; DEF6   0070
        SUBR    R7,     R0                      ; DEF7   0138
L_DEF8:
        SUBI    #$0018, R0                      ; DEF8   0338 0018
        DECLE   $0008,  $0218,  $0018,  $0210   ; DEFA   0008 0218 0018 0210
        DECLE   $0234,  $0134,  $0122,  $0120   ; DEFE   0234 0134 0122 0120
        DECLE   $0000,  $0100,  $0000,  $0000   ; DF02   0000 0100 0000 0000
        DECLE   $0304,  $0004,  $030C,  $037C   ; DF06   0304 0004 030C 037C
        DECLE   $00F0,  $00C0,  $0080,  $01B0   ; DF0A   00F0 00C0 0080 01B0
        DECLE   $0230,  $0218,  $001C,  $0200   ; DF0E   0230 0218 001C 0200
        DECLE   $0300,  $0200,  $0000           ; DF12   0300 0200 0000

        B       L_DF17                          ; DF15   0200 0000

L_DF17:
        SUBR    R0,     R0                      ; DF17   0100
        DECLE   $0000,  $0100,  $0300,  $030C   ; DF18   0000 0100 0300 030C
        DECLE   $0106,  $003B,  $0078,  $01EC   ; DF1C   0106 003B 0078 01EC
        DECLE   $03EC,  $00C6,  $03C7,  $0100   ; DF20   03EC 00C6 03C7 0100
        DECLE   $0270,  $0038,  $0238,  $021C   ; DF24   0270 0038 0238 021C
        DECLE   $020C                           ; DF28   020C
L_DF29:
        SUBR    R1,     R6                      ; DF29   010E
        DECLE   $0206,  $0116,  $0034,  $0274   ; DF2A   0206 0116 0034 0274
        DECLE   $034C,  $0248,  $0148,  $0208   ; DF2E   034C 0248 0148 0208
        DECLE   $0000,  $0200,  $0260,  $0370   ; DF32   0000 0200 0260 0370
        DECLE   $0070,  $0238,  $0238,  $0118   ; DF36   0070 0238 0238 0118
        DECLE   $0308,  $0218,  $0118,  $0010   ; DF3A   0308 0218 0118 0010
        DECLE   $0234,  $0234                   ; DF3E   0234 0234

        SUBR    R4,     R2                      ; DF40   0122
        SUB@    R4,     R0                      ; DF41   0320
        SUBR    R0,     R0                      ; DF42   0100
        SUBR    R0,     R0                      ; DF43   0100
        SUB     .STIC.X.0,R0                    ; DF44   0300 0000
        SUBR    R0,     R4                      ; DF46   0104
        SUB     .BTAB.0C,R4                     ; DF47   0304 020C
        SARC    R0,     2                       ; DF49   007C
        XORR    R6,     R0                      ; DF4A   01F0
        ADD     .IV.ALD,R0                      ; DF4B   02C0 0080
        PULR    R0                              ; DF4D   02B0
        GSWD    R0                              ; DF4E   0030
        COMR    R0                              ; DF4F   0018
        SUB@    R3,     R4                      ; DF50   031C
        SUBR    R0,     R0                      ; DF51   0100
        SUBR    R0,     R0                      ; DF52   0100
L_DF53:
        SUB     .BTAB.00,R0                     ; DF53   0300 0200
        DECLE   $0100,  $0000,  $0000,  $0300   ; DF55   0100 0000 0000 0300
        DECLE   $0100,  $0000,  $000C,  $0106   ; DF59   0100 0000 000C 0106
        DECLE   $033B,  $0278,  $01EC,  $00EC   ; DF5D   033B 0278 01EC 00EC
        DECLE   $02C6,  $02C7,  $0300,  $0100   ; DF61   02C6 02C7 0300 0100
        DECLE   $0200,  $0300,  $0102,  $0006   ; DF65   0200 0300 0102 0006
        DECLE   $001C,  $017C,  $016C,  $00D8   ; DF69   001C 017C 016C 00D8
        DECLE   $03D8,  $01F8,  $00F8,  $02F8   ; DF6D   03D8 01F8 00F8 02F8
        DECLE   $0270,  $0370,  $0070,  $0100   ; DF71   0270 0370 0070 0100
        DECLE   $0000,  $0100,  $0100,  $0200   ; DF75   0000 0100 0100 0200

        CMPR    R0,     R0                      ; DF79   0140
        CMP     G_0380, R0                      ; DF7A   0340 0380
        TSTR    R0                              ; DF7C   0080
        CLRR    R0                              ; DF7D   01C0
        ADD@    R4,     R0                      ; DF7E   02E0
        XORR    R4,     R0                      ; DF7F   01E0
        XOR@    R6,     R3                      ; DF80   03F3
        XORI    #$027C, R6                      ; DF81   03FE 027C
L_DF83:
        CMP@    R6,     R0                      ; DF83   0370
        DECLE   $0146,  $03E6,  $01FC,  $02FC   ; DF84   0146 03E6 01FC 02FC
        DECLE   $0378,  $037D,  $027F,  $013F   ; DF88   0378 037D 027F 013F
        DECLE   $022F,  $0237,  $0210,  $001C   ; DF8C   022F 0237 0210 001C
        DECLE   $010C,  $0200,  $0000,  $0200   ; DF90   010C 0200 0000 0200
        DECLE   $0200                           ; DF94   0200

        SUBR    R0,     R0                      ; DF95   0100
L_DF96:
        SUB     .BTAB.00,R0                     ; DF96   0300 0200
        DECLE   $0300,  $0100,  $00E0,  $02F8   ; DF98   0300 0100 00E0 02F8
        DECLE   $00FE,  $003F,  $013F,  $0233   ; DF9C   00FE 003F 013F 0233
        DECLE   $0119,  $011E,  $0206,  $0200   ; DFA0   0119 011E 0206 0200
        DECLE   $0310,  $0100,  $0200,  $0200   ; DFA4   0310 0100 0200 0200
        DECLE   $0300,  $0000,  $0100,  $0300   ; DFA8   0300 0000 0100 0300
        DECLE   $0100,  $0000,  $0100,  $0200   ; DFAC   0100 0000 0100 0200
        DECLE   $0200,  $0100,  $0300,  $0000   ; DFB0   0200 0100 0300 0000
        DECLE   $027F,  $0300,  $0000,  $0300   ; DFB4   027F 0300 0000 0300
        DECLE   $0300,  $0100,  $0300,  $0300   ; DFB8   0300 0100 0300 0300
        DECLE   $0300,  $0200,  $0000           ; DFBC   0300 0200 0000

        B       L_DFC1                          ; DFBF   0200 0000

L_DFC1:
        SUBR    R0,     R0                      ; DFC1   0100
        DECLE   $0000,  $0100,  $027F           ; DFC2   0000 0100 027F

        B       L_DFC7                          ; DFC5   0200 0000

L_DFC7:
        SUBR    R0,     R0                      ; DFC7   0100
        DECLE   $0100,  $0300,  $0200,  $0000   ; DFC8   0100 0300 0200 0000
        DECLE   $0100,  $0000,  $0100,  $0300   ; DFCC   0100 0000 0100 0300
        DECLE   $0000,  $0000                   ; DFD0   0000 0000
L_DFD2:
        B       L_DFD4                          ; DFD2   0200 0000

L_DFD4:
        ADDI    #$0200, R6                      ; DFD4   02FE 0200
L_DFD6:
        SUBR    R0,     R0                      ; DFD6   0100
        DECLE   $0100,  $0100,  $0000,  $0100   ; DFD7   0100 0100 0000 0100
        DECLE   $0000,  $0000,  $0300,  $0200   ; DFDB   0000 0000 0300 0200
        DECLE   $0200,  $0300,  $0100,  $0200   ; DFDF   0200 0300 0100 0200
        DECLE   $0200,  $03FE,  $0000,  $0200   ; DFE3   0200 03FE 0000 0200
L_DFE7:
        SUB     .ISRVEC.0,R0                    ; DFE7   0300 0100
        DECLE   $0200,  $0000,  $0200           ; DFE9   0200 0000 0200

        B       L_DFEE                          ; DFEC   0200 0000

L_DFEE:
        SUB     .BTAB.00,R0                     ; DFEE   0300 0200
        DECLE   $0300,  $0100,  $0100,  $0300   ; DFF0   0300 0100 0100 0300
        DECLE   $03FE,  $0200,  $0300,  $0100   ; DFF4   03FE 0200 0300 0100
        DECLE   $0300,  $0100,  $0200,  $0300   ; DFF8   0300 0100 0200 0300
        DECLE   $0300,  $0200                   ; DFFC   0300 0200

        SUBR    R0,     R0                      ; DFFE   0100
        SUBR    R0,     R0                      ; DFFF   0100

        ORG     $F000
        DECLE   $0200,  $0300,  $0300,  $0000   ; F000   0200 0300 0300 0000
        DECLE   $0000                           ; F004   0000

        XORR    R7,     R6                      ; F005   01FE
        SUBR    R0,     R0                      ; F006   0100
        SUB     .STIC.X.0,R0                    ; F007   0300 0000
L_F009:
        SUBR    R0,     R0                      ; F009   0100
        DECLE   $0300,  $0200,  $0100,  $0300   ; F00A   0300 0200 0100 0300
        DECLE   $0300,  $0000,  $0000,  $0100   ; F00E   0300 0000 0000 0100
        DECLE   $0000                           ; F012   0000

        B       L_F015                          ; F013   0200 0000

L_F015:
        SUB     G_02FE, R0                      ; F015   0300 02FE
        DECLE   $0000,  $0100,  $0300,  $0100   ; F017   0000 0100 0300 0100
        DECLE   $0100,  $0000,  $0000,  $0000   ; F01B   0100 0000 0000 0000

        B       L_F021                          ; F01F   0200 0000

L_F021:
        SUB     .ISRVEC.0,R0                    ; F021   0300 0100
        B       L_F025                          ; F023   0200 0000

L_F025:
        CMPI    #$0300, R7                      ; F025   037F 0300
        DECLE   $0200,  $0000,  $0200,  $0300   ; F027   0200 0000 0200 0300
        DECLE   $0200,  $0000,  $0200,  $02C0   ; F02B   0200 0000 0200 02C0
        DECLE   $0238,  $0106,  $0200,  $0100   ; F02F   0238 0106 0200 0100
        DECLE   $0000,  $0000                   ; F033   0000 0000

        B       L_F337                          ; F035   0200 0300
        B       L_F039                          ; F037   0200 0000
L_F039:
        B       L_F03B                          ; F039   0200 0000
L_F03B:
        B       L_F13D                          ; F03B   0200 0100

        DECLE   $0000                           ; F03D   0000

        SUBR    R0,     R0                      ; F03E   0100
L_F03F:
        CMPR    R4,     R0                      ; F03F   0160
        DECLE   $0218,  $0106,  $0201           ; F040   0218 0106 0201

        B       L_F345                          ; F043   0200 0300

        SUB     .ISRVEC.0,R0                    ; F045   0300 0100
        B       L_F349                          ; F047   0200 0300

        DECLE   $0000,  $0300,  $0200,  $0000   ; F049   0000 0300 0200 0000

        CMPR    R0,     R0                      ; F04D   0140
        B       L_F03F                          ; F04E   0220 0010

        DECLE   $0208,  $0004,  $0302,  $0101   ; F050   0208 0004 0302 0101
        DECLE   $0200,  $0300,  $0300,  $0200   ; F054   0200 0300 0300 0200
        DECLE   $0300,  $0300,  $0100,  $0100   ; F058   0300 0300 0100 0100
        DECLE   $0000,  $0100,  $0220,  $0000   ; F05C   0000 0100 0220 0000
        DECLE   $0210,  $0000                   ; F060   0210 0000

        SUBR    R1,     R0                      ; F062   0108
        SUBR    R0,     R0                      ; F063   0100
        BEQ     L_F266                          ; F064   0204 0200
        BOV     L_F168                          ; F066   0202 0100

        SUBR    R0,     R1                      ; F068   0101
        B       L_F06B                          ; F069   0200 0000
L_F06B:
        B       L_F26D                          ; F06B   0200 0200

        DECLE   $0140,  $0020,  $0010,  $0108   ; F06D   0140 0020 0010 0108
        DECLE   $0004,  $0102,  $0301,  $0100   ; F071   0004 0102 0301 0100
        DECLE   $0000,  $0000,  $0200,  $0200   ; F075   0000 0000 0200 0200

        SUB     .STIC.X.0,R0                    ; F079   0300 0000
        SUB     .ISRVEC.0,R0                    ; F07B   0300 0100
        B       L_F27F                          ; F07D   0200 0200

        DECLE   $0300,  $0200,  $0200,  $0100   ; F07F   0300 0200 0200 0100
        DECLE   $0000,  $0380,  $0340,  $0120   ; F083   0000 0380 0340 0120
        DECLE   $0210,  $0208,  $0304,  $0002   ; F087   0210 0208 0304 0002
        DECLE   $0101,  $0300,  $0300,  $0000   ; F08B   0101 0300 0300 0000
        DECLE   $0300,  $0300,  $0000,  $01C0   ; F08F   0300 0300 0000 01C0
        DECLE   $0030,  $0108,  $0306,  $0100   ; F093   0030 0108 0306 0100
        DECLE   $0200,  $0100,  $0100,  $0100   ; F097   0200 0100 0100 0100
        DECLE   $0300,  $0100,  $0000,  $00C0   ; F09B   0300 0100 0000 00C0
        DECLE   $0230,  $000C,  $0102,  $0100   ; F09F   0230 000C 0102 0100
        DECLE   $0000,  $0300,  $0100,  $0100   ; F0A3   0000 0300 0100 0100
        DECLE   $0000,  $0100,  $0200,  $0000   ; F0A7   0000 0100 0200 0000
        DECLE   $0000,  $0380,  $0340,  $0238   ; F0AB   0000 0380 0340 0238
        DECLE   $0006,  $0200                   ; F0AF   0006 0200

        SUB     .STIC.X.0,R0                    ; F0B1   0300 0000
        B       L_F2B5                          ; F0B3   0200 0200

        DECLE   $0300,  $0200,  $0000           ; F0B5   0300 0200 0000

        SUBR    R0,     R0                      ; F0B8   0100
        SUB     G_0300, R0                      ; F0B9   0300 0300
        B       L_F0BD                          ; F0BB   0200 0000

L_F0BD:
        ADDR    R0,     R0                      ; F0BD   00C0
        SUBR    R6,     R0                      ; F0BE   0130
        SUBR    R1,     R4                      ; F0BF   010C
        SUB     .STIC.X.0,R2                    ; F0C0   0302 0000
        B       L_F0C4                          ; F0C2   0200 0000

L_F0C4:
        SUBR    R0,     R0                      ; F0C4   0100
        DECLE   $0300,  $0300,  $0200,  $0300   ; F0C5   0300 0300 0200 0300

        SUBR    R0,     R0                      ; F0C9   0100
        SUB     .ISRVEC.0,R0                    ; F0CA   0300 0100
        B       L_F3FE                          ; F0CC   0200 0330

        DECLE   $03C8,  $0204                   ; F0CE   03C8 0204

        SUBR    R0,     R2                      ; F0D0   0102
        B       L_F2D3                          ; F0D1   0200 0200
        B       L_F0D5                          ; F0D3   0200 0000

L_F0D5:
        SUBR    R0,     R0                      ; F0D5   0100
        B       L_F0D8                          ; F0D6   0200 0000
L_F0D8:
        B       L_F2DA                          ; F0D8   0200 0200

        DECLE   $0100,  $0300,  $0200,  $03C0   ; F0DA   0100 0300 0200 03C0
        DECLE   $0130,  $000C,  $0202,  $0000   ; F0DE   0130 000C 0202 0000
        DECLE   $0000                           ; F0E2   0000

        SUBR    R0,     R0                      ; F0E3   0100
        B       L_F1E6                          ; F0E4   0200 0100

        SUBR    R0,     R0                      ; F0E6   0100
        B       L_F2E9                          ; F0E7   0200 0200

        DECLE   $0300,  $0100,  $0200,  $0200   ; F0E9   0300 0100 0200 0200
        DECLE   $03FE,  $0000,  $0100,  $0300   ; F0ED   03FE 0000 0100 0300
        DECLE   $0100,  $0000                   ; F0F1   0100 0000

        SUBR    R0,     R0                      ; F0F3   0100
        B       L_F2F6                          ; F0F4   0200 0200

        SUBR    R0,     R0                      ; F0F6   0100
        SUB     .STIC.X.0,R0                    ; F0F7   0300 0000
        B       L_F3FB                          ; F0F9   0200 0300

        DECLE   $0000,  $0382,  $036C,  $0110   ; F0FB   0000 0382 036C 0110
        DECLE   $0300,  $0300,  $0300,  $0200   ; F0FF   0300 0300 0300 0200
        DECLE   $0000                           ; F103   0000

        B       L_F106                          ; F104   0200 0000

L_F106:
        SUBR    R0,     R0                      ; F106   0100
        DECLE   $0000,  $0100,  $0200           ; F107   0000 0100 0200

        B       L_F10C                          ; F10A   0200 0000

L_F10C:
        SUBR    R0,     R0                      ; F10C   0100
        DECLE   $01FE,  $0300,  $0200,  $0000   ; F10D   01FE 0300 0200 0000
        DECLE   $0100,  $0000,  $0100,  $0300   ; F111   0100 0000 0100 0300
        DECLE   $0000,  $0000,  $0200,  $0000   ; F115   0000 0000 0200 0000
        DECLE   $0200,  $0200,  $0100,  $0110   ; F119   0200 0200 0100 0110
        DECLE   $016C,  $0082,  $0100,  $0000   ; F11D   016C 0082 0100 0000
        DECLE   $0000                           ; F121   0000

        SUB     .BTAB.00,R0                     ; F122   0300 0200
        B       L_F426                          ; F124   0200 0300

        DECLE   $0100,  $0200,  $0200,  $0300   ; F126   0100 0200 0200 0300
        DECLE   $0000,  $0200,  $0300,  $0306   ; F12A   0000 0200 0300 0306
        DECLE   $0338,  $0240,  $0180,  $0100   ; F12E   0338 0240 0180 0100
        DECLE   $0000,  $0000                   ; F132   0000 0000

        B       L_F336                          ; F134   0200 0200

        SUBR    R0,     R0                      ; F136   0100
        SUB     .STIC.X.0,R0                    ; F137   0300 0000
        SUBR    R0,     R0                      ; F139   0100
        SUBR    R0,     R0                      ; F13A   0100
        SUB     G_0300, R0                      ; F13B   0300 0300
L_F13D:
        SUB     .STIC.C.0,R6                    ; F13D   0306 0018
        DECLE   $0360,  $0180,  $0300,  $0200   ; F13F   0360 0180 0300 0200
        DECLE   $0000,  $0200,  $0000,  $0000   ; F143   0000 0200 0000 0000

        SUB     .ISRVEC.0,R0                    ; F147   0300 0100
        B       L_F44B                          ; F149   0200 0300

        DECLE   $0300,  $0200,  $0318,  $0326   ; F14B   0300 0200 0318 0326
        DECLE   $0140,  $0180,  $0000           ; F14F   0140 0180 0000

        SUBR    R0,     R0                      ; F152   0100
        B       L_F155                          ; F153   0200 0000
L_F155:
        B       L_F157                          ; F155   0200 0000

L_F157:
        SUBR    R0,     R0                      ; F157   0100
        DECLE   $0100,  $0200,  $0200,  $0200   ; F158   0100 0200 0200 0200
        DECLE   $0100,  $0106,  $0218,  $0060   ; F15C   0100 0106 0218 0060
        DECLE   $0280,  $0200,  $0100,  $0000   ; F160   0280 0200 0100 0000
        DECLE   $0000,  $0100,  $0000           ; F164   0000 0100 0000

        SUBR    R0,     R0                      ; F167   0100
L_F168:
        SUB     .BTAB.00,R0                     ; F168   0300 0200
        DECLE   $0200,  $0000,  $0200,  $0000   ; F16A   0200 0000 0200 0000
        DECLE   $0000,  $0200                   ; F16E   0000 0200

        SUBR    R0,     R0                      ; F170   0100
        B       L_F473                          ; F171   0200 0300

        DECLE   $01FF,  $0000                   ; F173   01FF 0000

        SUBR    R0,     R0                      ; F175   0100
        B       L_F178                          ; F176   0200 0000

L_F178:
        SUB     G_0300, R0                      ; F178   0300 0300
        DECLE   $0000,  $0200,  $0000,  $0000   ; F17A   0000 0200 0000 0000
        DECLE   $0000,  $0200,  $0100,  $0200   ; F17E   0000 0200 0100 0200
        DECLE   $0000,  $01FF,  $0200,  $0100   ; F182   0000 01FF 0200 0100
        DECLE   $0000,  $0300,  $0200,  $0000   ; F186   0000 0300 0200 0000
        DECLE   $0000                           ; F18A   0000

        SUB     .BTAB.00,R0                     ; F18B   0300 0200
        B       L_F48F                          ; F18D   0200 0300

        DECLE   $0100,  $0000,  $0000           ; F18F   0100 0000 0000

        SUBR    R0,     R0                      ; F192   0100
        XORI    #$0000, R6                      ; F193   03FE 0000
        B       L_F197                          ; F195   0200 0000
L_F197:
        B       L_F399                          ; F197   0200 0200

        DECLE   $0200                           ; F199   0200

        SUBR    R0,     R0                      ; F19A   0100
        B       L_F29D                          ; F19B   0200 0100

        DECLE   $0000,  $0200,  $0300,  $0000   ; F19D   0000 0200 0300 0000
        DECLE   $0000,  $0000,  $01FE,  $0200   ; F1A1   0000 0000 01FE 0200
        DECLE   $0200,  $0000,  $0000           ; F1A5   0200 0000 0000

        B       L_F1AA                          ; F1A8   0200 0000

L_F1AA:
        SUBR    R0,     R0                      ; F1AA   0100
        SUB     .BTAB.00,R0                     ; F1AB   0300 0200
        SUBR    R0,     R0                      ; F1AD   0100
        B       L_F3B0                          ; F1AE   0200 0200
        B       L_F4B2                          ; F1B0   0200 0300
        B       L_F2B2                          ; F1B2   0200 00FE
        B       L_F4B6                          ; F1B4   0200 0300
        B       L_F1B8                          ; F1B6   0200 0000
L_F1B8:
        B       L_F3BA                          ; F1B8   0200 0200

        DECLE   $0200,  $0100                   ; F1BA   0200 0100

        B       L_F2BE                          ; F1BC   0200 0100
        B       L_F4C0                          ; F1BE   0200 0300
        B       L_F1C2                          ; F1C0   0200 0000
L_F1C2:
        B       L_F1C4                          ; F1C2   0200 0000

L_F1C4:
        XORR    R7,     R6                      ; F1C4   01FE
        DECLE   $0000                           ; F1C5   0000

        B       L_F4C8                          ; F1C6   0200 0300

L_F1C8:
        SUB     G_0300, R0                      ; F1C8   0300 0300
        DECLE   $0000                           ; F1CA   0000

        SUB     .ISRVEC.0,R0                    ; F1CB   0300 0100
        B       L_F2CF                          ; F1CD   0200 0100

        SUBR    R0,     R0                      ; F1CF   0100
        B       L_F1D2                          ; F1D0   0200 0000

L_F1D2:
        SUBR    R0,     R0                      ; F1D2   0100
        DECLE   $0000                           ; F1D3   0000

        XORI    #$0200, R6                      ; F1D4   03FE 0200
        SUB     .ISRVEC.0,R0                    ; F1D6   0300 0100
        SUB     G_0300, R0                      ; F1D8   0300 0300
        B       L_F4DC                          ; F1DA   0200 0300

        DECLE   $0000,  $0300,  $0100,  $0200   ; F1DC   0000 0300 0100 0200
        DECLE   $0300,  $0300,  $0200,  $01FF   ; F1E0   0300 0300 0200 01FF

        B       L_F3E6                          ; F1E4   0200 0200
L_F1E6:
        B       L_F1E8                          ; F1E6   0200 0000

L_F1E8:
        SUBR    R0,     R0                      ; F1E8   0100
        B       L_F1EB                          ; F1E9   0200 0000
L_F1EB:
        B       L_F3ED                          ; F1EB   0200 0200

        DECLE   $0100,  $0300,  $0200,  $0300   ; F1ED   0100 0300 0200 0300
        DECLE   $0100,  $0000,  $0200,  $0000   ; F1F1   0100 0000 0200 0000
        DECLE   $0000,  $0100,  $0200,  $0103   ; F1F5   0000 0100 0200 0103
        DECLE   $010C,  $0230,  $02C0,  $0310   ; F1F9   010C 0230 02C0 0310
        DECLE   $0110,  $0220,  $0220,  $0340   ; F1FD   0110 0220 0220 0340
        DECLE   $0040,  $0180,  $0380,  $0100   ; F201   0040 0180 0380 0100
        DECLE   $0000                           ; F205   0000

        SUBR    R0,     R0                      ; F206   0100
        B       L_F409                          ; F207   0200 0200

        SUBR    R0,     R0                      ; F209   0100
        SUB     .STIC.X.0,R0                    ; F20A   0300 0000
        B       L_F50E                          ; F20C   0200 0300

        DECLE   $0000,  $0300,  $0300,  $0100   ; F20E   0000 0300 0300 0100
        DECLE   $0300,  $037F,  $0300,  $0200   ; F212   0300 037F 0300 0200
        DECLE   $0000                           ; F216   0000

        B       L_F219                          ; F217   0200 0000

L_F219:
        SUBR    R0,     R0                      ; F219   0100
        DECLE   $0000,  $0100,  $0200,  $0200   ; F21A   0000 0100 0200 0200
        DECLE   $0000,  $0100,  $0100,  $0300   ; F21E   0000 0100 0100 0300
        DECLE   $0200,  $007F,  $0100,  $0000   ; F222   0200 007F 0100 0000
        DECLE   $0100,  $0300,  $0000,  $0000   ; F226   0100 0300 0000 0000
        DECLE   $0200,  $0000,  $0200,  $0200   ; F22A   0200 0000 0200 0200
        DECLE   $0100,  $0100,  $0100,  $0000   ; F22E   0100 0100 0100 0000
        DECLE   $0100,  $00FF,  $0000           ; F232   0100 00FF 0000

        SUB     .BTAB.00,R0                     ; F235   0300 0200
        B       L_F539                          ; F237   0200 0300

        DECLE   $0100,  $0200,  $0200,  $0300   ; F239   0100 0200 0200 0300
        DECLE   $0000,  $0200,  $0300           ; F23D   0000 0200 0300
L_F240:
        SUB     .STIC.X.0,R0                    ; F240   0300 0000
        DECLE   $0300,  $03FF,  $0000,  $0100   ; F242   0300 03FF 0000 0100
        DECLE   $0000                           ; F246   0000

        SUBR    R0,     R0                      ; F247   0100
        SUB     .ISRVEC.0,R0                    ; F248   0300 0100
        B       L_F34C                          ; F24A   0200 0100

        DECLE   $0100,  $0100,  $0300,  $0100   ; F24C   0100 0100 0300 0100
        DECLE   $0200,  $0000,  $0000,  $00FF   ; F250   0200 0000 0000 00FF

        SUBR    R0,     R0                      ; F254   0100
        SUBR    R0,     R0                      ; F255   0100
        SUBR    R0,     R0                      ; F256   0100
        B       L_F259                          ; F257   0200 0000

L_F259:
        SUB     .BTAB.00,R0                     ; F259   0300 0200
        DECLE   $0000,  $0000,  $0100,  $0100   ; F25B   0000 0000 0100 0100
        DECLE   $0300,  $0000,  $0200,  $0300   ; F25F   0300 0000 0200 0300
        DECLE   $0100,  $00FF,  $0000           ; F263   0100 00FF 0000
L_F266:
        B       L_F268                          ; F266   0200 0000

L_F268:
        SUBR    R0,     R0                      ; F268   0100
        DECLE   $0100,  $0000                   ; F269   0100 0000

        SUB     .ISRVEC.0,R0                    ; F26B   0300 0100
L_F26D:
        SUBR    R0,     R0                      ; F26D   0100
        DECLE   $0000                           ; F26E   0000

        SUBR    R0,     R0                      ; F26F   0100
        B       L_F272                          ; F270   0200 0000
L_F272:
        B       L_F474                          ; F272   0200 0200

        DECLE   $03FF                           ; F274   03FF

        B       L_F277                          ; F275   0200 0000
L_F277:
        B       L_F579                          ; F277   0200 0300

        DECLE   $0000,  $0200,  $0200,  $0300   ; F279   0000 0200 0200 0300
        DECLE   $0200,  $0000                   ; F27D   0200 0000
L_F27F:
        SUBR    R0,     R0                      ; F27F   0100
        DECLE   $0300,  $0300,  $0200,  $007F   ; F280   0300 0300 0200 007F
        DECLE   $0000                           ; F284   0000

        SUBR    R0,     R0                      ; F285   0100
        SUBR    R0,     R0                      ; F286   0100
        SUB     .STIC.X.0,R0                    ; F287   0300 0000
        B       L_F28B                          ; F289   0200 0000

L_F28B:
        SUBR    R0,     R0                      ; F28B   0100
        SUB     G_0300, R0                      ; F28C   0300 0300
        B       L_F590                          ; F28E   0200 0300

        SUBR    R0,     R0                      ; F290   0100
        SUB     .ISRVEC.0,R0                    ; F291   0300 0100
        B       L_F598                          ; F293   0200 0303

        DECLE   $030C,  $0230                   ; F295   030C 0230

        CLRR    R0                              ; F297   01C0
        B       L_F49A                          ; F298   0200 0200
        B       L_F29C                          ; F29A   0200 0000

L_F29C:
        SUBR    R0,     R1                      ; F29C   0101
L_F29D:
        BC      L_F2A1                          ; F29D   0201 0002
        BOV     L_F4A5                          ; F29F   0202 0204

L_F2A1:
        SUBR    R0,     R4                      ; F2A1   0104
        SUB@    R1,     R0                      ; F2A2   0308
        SKIP                                    ; F2A3   0208
        SUB@    R2,     R0                      ; F2A4   0310
        SUBR    R2,     R0                      ; F2A5   0110
        NEGR    R0                              ; F2A6   0020
        B       L_F268                          ; F2A7   0220 0040

        SWAP    R0,     1                       ; F2A9   0040
        ANDR    R0,     R0                      ; F2AA   0180
        MVI     .ISRVEC.0,R0                    ; F2AB   0280 0100
        SUBR    R0,     R1                      ; F2AD   0101
        BC      L_F4B2                          ; F2AE   0201 0202

        SUB     G_0104, R4                      ; F2B0   0304 0104
L_F2B2:
        SKIP                                    ; F2B2   0208
        DECLE   $0210                           ; F2B3   0210

        SUB@    R2,     R0                      ; F2B4   0310
L_F2B5:
        NEGR    R0                              ; F2B5   0020
        SUBR    R4,     R0                      ; F2B6   0120
        CMP     G_0140, R0                      ; F2B7   0340 0140
        TSTR    R0                              ; F2B9   0080
        ANDR    R0,     R0                      ; F2BA   0180
        B       L_F4C5                          ; F2BB   0200 0208

        SUBR    R1,     R0                      ; F2BD   0108
L_F2BE:
        SUB@    R1,     R0                      ; F2BE   0308
        DECLE   $0210,  $0210                   ; F2BF   0210 0210

        SUB@    R2,     R0                      ; F2C1   0310
        SUBR    R4,     R0                      ; F2C2   0120
        SUB@    R4,     R0                      ; F2C3   0320
        SUB@    R4,     R0                      ; F2C4   0320
        MVO     R0,     G_0340                  ; F2C5   0240 0340
        SWAP    R0,     1                       ; F2C7   0040
        AND     G_0380, R0                      ; F2C8   0380 0380
        TSTR    R0                              ; F2CA   0080
        B       L_F4D5                          ; F2CB   0200 0208

        SKIP                                    ; F2CD   0208
        SUBR    R1,     R0                      ; F2CE   0108
L_F2CF:
        DECR    R0                              ; F2CF   0010
        DECLE   $0210                           ; F2D0   0210

        SUB@    R2,     R0                      ; F2D1   0310
        DECR    R0                              ; F2D2   0010
L_F2D3:
        NEGR    R0                              ; F2D3   0020
        NEGR    R0                              ; F2D4   0020
        NEGR    R0                              ; F2D5   0020
        SUB@    R4,     R0                      ; F2D6   0320
        SWAP    R0,     1                       ; F2D7   0040
        CMPR    R0,     R0                      ; F2D8   0140
        CMPR    R0,     R0                      ; F2D9   0140
L_F2DA:
        SWAP    R0,     1                       ; F2DA   0040
        DECLE   $0100,  $0100,  $0210,  $0110   ; F2DB   0100 0100 0210 0110
        DECLE   $0010,  $0010,  $0310,  $0210   ; F2DF   0010 0010 0310 0210

        SUBR    R2,     R0                      ; F2E3   0110
        NEGR    R0                              ; F2E4   0020
        SUBR    R4,     R0                      ; F2E5   0120
        SUBR    R4,     R0                      ; F2E6   0120
        B       L_F1C8                          ; F2E7   0220 0120

L_F2E9:
        NEGR    R0                              ; F2E9   0020
        DECLE   $0320,  $0000                   ; F2EA   0320 0000

        B       L_F3FE                          ; F2EC   0200 0110

        DECR    R0                              ; F2EE   0010
        DECR    R0                              ; F2EF   0010
        SUBR    R2,     R0                      ; F2F0   0110
        SUB@    R2,     R0                      ; F2F1   0310
        SUBR    R2,     R0                      ; F2F2   0110
L_F2F3:
        DECR    R0                              ; F2F3   0010
        DECLE   $0210,  $0210                   ; F2F4   0210 0210
L_F2F6:
        SUB@    R2,     R0                      ; F2F6   0310
        DECLE   $0010,  $0010,  $0010,  $0010   ; F2F7   0010 0010 0010 0010
        DECLE   $0000,  $0000,  $0001,  $0001   ; F2FB   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0101,  $0201   ; F2FF   0001 0001 0101 0201
        DECLE   $0101,  $0101,  $0001,  $0001   ; F303   0101 0101 0001 0001
        DECLE   $0001,  $0101,  $0001,  $0301   ; F307   0001 0101 0001 0301
        DECLE   $0000,  $0060,  $02F0,  $0260   ; F30B   0000 0060 02F0 0260
        DECLE   $0300,  $0000,  $0000,  $0000   ; F30F   0300 0000 0000 0000
        DECLE   $0000,  $02E0,  $00F0,  $0070   ; F313   0000 02E0 00F0 0070
        DECLE   $0300,  $0100,  $0000,  $0100   ; F317   0300 0100 0000 0100
        DECLE   $0000,  $0160,  $00F0,  $0260   ; F31B   0000 0160 00F0 0260
        DECLE   $0100,  $0000                   ; F31F   0100 0000

        SUBR    R0,     R0                      ; F321   0100
        SUB     .BTAB.00,R0                     ; F322   0300 0200
        CMPR    R6,     R0                      ; F324   0170
        ADDR    R6,     R0                      ; F325   00F0
        XORR    R6,     R0                      ; F326   01F0
        XORR    R4,     R0                      ; F327   01E0
        B       L_F42A                          ; F328   0200 0100

        DECLE   $0000,  $0000,  $0000,  $0000   ; F32A   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00E0,  $0140   ; F32E   0000 0040 00E0 0140
        DECLE   $0100,  $0100,  $0220,  $0150   ; F332   0100 0100 0220 0150
L_F336:
        SUBR    R4,     R0                      ; F336   0120
L_F337:
        RLC     R0,     1                       ; F337   0050
        ADDR    R4,     R0                      ; F338   00E0
        SWAP    R0,     1                       ; F339   0040
        B       L_F33C                          ; F33A   0200 0000

L_F33C:
        SUB@    R1,     R0                      ; F33C   0308
        DECLE   $0014,  $0028,  $0240,  $02E0   ; F33D   0014 0028 0240 02E0
        DECLE   $0340,  $0000,  $0000,  $0000   ; F341   0340 0000 0000 0000
L_F345:
        DECR    R4                              ; F345   0014
        BNOV    L_F2F3                          ; F346   022A 0054

        ADDR    R4,     R0                      ; F348   00E0
L_F349:
        SWAP    R0,     1                       ; F349   0040
        DECLE   $0000                           ; F34A   0000

        SUBR    R0,     R0                      ; F34B   0100
L_F34C:
        SUBR    R0,     R0                      ; F34C   0100

        JSR     R6,     .EXEC.06A               ; F34D   0004 0210 006A
        DECLE   $03F5,  $0150,  $000A,  $0100   ; F350   03F5 0150 000A 0100
        DECLE   $0000                           ; F354   0000

        B       L_F457                          ; F355   0200 0100

        DECLE   $0000                           ; F357   0000

        SUB     .STIC.X.0,R0                    ; F358   0300 0000
        B       L_F474                          ; F35A   0200 0118

        DECLE   $0010,  $0040,  $0100,  $03A0   ; F35C   0010 0040 0100 03A0
        DECLE   $0100,  $0000                   ; F360   0100 0000

        SUBR    R0,     R0                      ; F362   0100
        B       L_F565                          ; F363   0200 0200

        DECLE   $0100,  $0000,  $0310,  $0006   ; F365   0100 0000 0310 0006
        DECLE   $0204,  $0110,  $0010,  $0140   ; F369   0204 0110 0010 0140
        DECLE   $0108,  $026C,  $0100,  $0080   ; F36D   0108 026C 0100 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F371   0000 0000 0000 0000
        DECLE   $0006,  $0211,  $0219,  $0026   ; F375   0006 0211 0219 0026
        DECLE   $0312,  $0238                   ; F379   0312 0238

        SUB@    R4,     R5                      ; F37B   0325
        RLC     R3,     1                       ; F37C   0053
        INCR    R0                              ; F37D   0008
        SLLC    R2,     1                       ; F37E   005A
        TSTR    R0                              ; F37F   0080
        ADCR    R0                              ; F380   0028
        SUBR    R6,     R0                      ; F381   0130
        SUBR    R0,     R0                      ; F382   0100
        SUBR    R0,     R0                      ; F383   0100
        CLRC                                    ; F384   0006
L_F385:
        DECR    R7                              ; F385   0017

        DECLE   $0239,  $022E,  $0123,  $00D9   ; F386   0239 022E 0123 00D9
        DECLE   $01BC,  $01A5,  $0221,  $015A   ; F38A   01BC 01A5 0221 015A
        DECLE   $004E,  $0220,  $0398,  $0210   ; F38E   004E 0220 0398 0210
        DECLE   $0100,  $0000,  $0000,  $0000   ; F392   0100 0000 0000 0000
        DECLE   $0200,  $001A,  $0037           ; F396   0200 001A 0037
L_F399:
        RSWD    R0                              ; F399   0038
        DECLE   $004E,  $03BB,  $01AD,  $0005   ; F39A   004E 03BB 01AD 0005
        DECLE   $025E,  $0028,  $0302,  $018C   ; F39E   025E 0028 0302 018C
        DECLE   $0000                           ; F3A2   0000

        SUBR    R0,     R0                      ; F3A3   0100
L_F3A4:
        SUBR    R0,     R0                      ; F3A4   0100
        B       L_F4A7                          ; F3A5   0200 0100

        DECLE   $0000                           ; F3A7   0000

        SUB     .STIC.X.0,R0                    ; F3A8   0300 0000
        SUB     G_010F, R6                      ; F3AA   0306 010F
        INCR    R2                              ; F3AC   000A
        SUB@    R6,     R5                      ; F3AD   0335
        SARC    R2,     2                       ; F3AE   007E
        CMP@    R2,     R7                      ; F3AF   0357
L_F3B0:
        SUBR    R3,     R2                      ; F3B0   011A
        DECLE   $00A5,  $0000,  $0000,  $0200   ; F3B1   00A5 0000 0000 0200
        DECLE   $0000,  $0000,  $0100,  $0100   ; F3B5   0000 0000 0100 0100
        DECLE   $0200                           ; F3B9   0200
L_F3BA:
        SUBR    R0,     R0                      ; F3BA   0100
        DECLE   $0000,  $0200,  $0300,  $020E   ; F3BB   0000 0200 0300 020E
        DECLE   $0117,  $003D,  $004B,  $0100   ; F3BF   0117 003D 004B 0100
        DECLE   $0300,  $0100,  $0000           ; F3C3   0300 0100 0000

        SUBR    R0,     R0                      ; F3C6   0100
        SUBR    R0,     R0                      ; F3C7   0100
        B       L_F4CA                          ; F3C8   0200 0100

        DECLE   $0000                           ; F3CA   0000

        B       L_F3CD                          ; F3CB   0200 0000

L_F3CD:
        SUB     .ISRVEC.0,R0                    ; F3CD   0300 0100
        DECLE   $0000,  $0200,  $0000,  $0000   ; F3CF   0000 0200 0000 0000
        DECLE   $0000,  $00FC,  $01FC,  $01FC   ; F3D3   0000 00FC 01FC 01FC
        DECLE   $01FC,  $00FC,  $02FE,  $03FE   ; F3D7   01FC 00FC 02FE 03FE
        DECLE   $007E,  $007F,  $007F,  $007F   ; F3DB   007E 007F 007F 007F
        DECLE   $023F                           ; F3DF   023F

        SUBI    #$003E, R7                      ; F3E0   033F 003E

        SUBR    R3,     R6                      ; F3E2   011E
        COMR    R4                              ; F3E3   001C
        SUBR    R0,     R0                      ; F3E4   0100
        SUBR    R0,     R0                      ; F3E5   0100
L_F3E6:
        SUB     G_0106, R0                      ; F3E6   0300 0106
        DECR    R3                              ; F3E8   0013
        SUBR    R5,     R4                      ; F3E9   012C
        CMP@    R2,     R5                      ; F3EA   0355
        MVO@    R2,     R3                      ; F3EB   025A
        CMPR    R4,     R5                      ; F3EC   0165
L_F3ED:
        SLLC    R2,     1                       ; F3ED   005A
        DECLE   $0235                           ; F3EE   0235

        INCR    R2                              ; F3EF   000A
        B       L_F4F2                          ; F3F0   0200 0100

        DECLE   $0000,  $0100,  $0100,  $0200   ; F3F2   0000 0100 0100 0200

        SUBR    R0,     R0                      ; F3F6   0100
        TSTR    R6                              ; F3F7   00B6
        MVO@    R5,     R2                      ; F3F8   0255
        MOVR    R5,     R3                      ; F3F9   00AB
        CMP@    R2,     R5                      ; F3FA   0355
L_F3FB:
        XORR    R3,     R2                      ; F3FB   01DA
        SLR     R2,     2                       ; F3FC   0066
        MOVR    R2,     R5                      ; F3FD   0095
L_F3FE:
        SAR     R2,     1                       ; F3FE   006A
        DECLE   $02AD,  $0000,  $0000           ; F3FF   02AD 0000 0000

        SUB     G_0300, R0                      ; F402   0300 0300
        B       L_F506                          ; F404   0200 0100

        DECLE   $0000                           ; F406   0000

        MVO@    R0,     R3                      ; F407   0258
        ANDR    R5,     R6                      ; F408   01AE
L_F409:
        MVO@    R5,     R2                      ; F409   0255
        DECLE   $01AA,  $006D,  $006D,  $00AA   ; F40A   01AA 006D 006D 00AA
        DECLE   $0254,  $00B0,  $0000,  $0000   ; F40E   0254 00B0 0000 0000
        DECLE   $0000                           ; F412   0000

        SUB     G_01B6, R0                      ; F413   0300 01B6
        ADCR    R2                              ; F415   002A
        MOVR    R7,     R6                      ; F416   00BE
        SUB@    R5,     R2                      ; F417   032A
        ADD     G_012A, R6                      ; F418   02C6 012A
        ADDR    R1,     R6                      ; F41A   00CE
        SUBR    R5,     R2                      ; F41B   012A
        ADDR    R2,     R6                      ; F41C   00D6
        BNOV    L_F240                          ; F41D   022A 01DE

        ADCR    R2                              ; F41F   002A
        SUBR    R0,     R1                      ; F420   0101
        B       L_F723                          ; F421   0200 0300

        DECLE   $0100,  $0000                   ; F423   0100 0000

        SUBR    R0,     R0                      ; F425   0100
L_F426:
        SUBR    R0,     R0                      ; F426   0100
        DECLE   $0200,  $01FF,  $003F           ; F427   0200 01FF 003F
L_F42A:
        BESC    L_F42F                          ; F42A   020F 0003

        DECLE   $0301,  $0100,  $0000           ; F42C   0301 0100 0000
L_F42F:
        SUB     .PSG1.lft_hand,R0               ; F42F   0300 00FF
        DECLE   $03FF,  $01FE,  $00FE,  $02FC   ; F431   03FF 01FE 00FE 02FC
        DECLE   $02FC,  $0378,  $0078,  $0000   ; F435   02FC 0378 0078 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F439   0000 0000 0000 0000
        DECLE   $0000,  $0303,  $00FF,  $0000   ; F43D   0000 0303 00FF 0000

        SUBR    R0,     R0                      ; F441   0100
        BC      L_F547                          ; F442   0201 0103
        SUBR    R1,     R7                      ; F444   010F

        DECLE   $007F,  $00FF,  $00FF           ; F445   007F 00FF 00FF

        RRC     R0,     1                       ; F448   0070
        ADD@    R6,     R0                      ; F449   02F0
        ADD@    R4,     R0                      ; F44A   02E0
L_F44B:
        ADDR    R4,     R0                      ; F44B   00E0
        ADDR    R0,     R0                      ; F44C   00C0
        CLRR    R0                              ; F44D   01C0
        TSTR    R0                              ; F44E   0080
        AND     G_00B5, R0                      ; F44F   0380 00B5
        ADCR    R4                              ; F451   002C
        ANDR    R7,     R5                      ; F452   01BD
        SUB@    R5,     R4                      ; F453   032C
        ADD     .STIC.BORD,R5                   ; F454   02C5 002C
        ADDR    R1,     R5                      ; F456   00CD
L_F457:
        ADCR    R4                              ; F457   002C
        DECLE   $01D5,  $032C,  $00DD,  $002C   ; F458   01D5 032C 00DD 002C
        DECLE   $012B,  $0203,  $02EF,  $0002   ; F45C   012B 0203 02EF 0002
        DECLE   $00B3,  $0202,  $0060,  $0001   ; F460   00B3 0202 0060 0001
        DECLE   $00A0,  $0001,  $00E0,  $0201   ; F464   00A0 0001 00E0 0201
        DECLE   $0160,  $0003,  $02A0,  $0303   ; F468   0160 0003 02A0 0303
        DECLE   $00E0,  $0003,  $0068,  $0000   ; F46C   00E0 0003 0068 0000

        TSTR    R0                              ; F470   0080
        SUBR    R0,     R0                      ; F471   0100
        MOVR    R3,     R0                      ; F472   0098
L_F473:
        SUBR    R0,     R0                      ; F473   0100
L_F474:
        NEGR    R0                              ; F474   0020
        DECLE   $0102,  $02A0,  $0202           ; F475   0102 02A0 0202

        SUBR    R4,     R0                      ; F478   0120
        DIS                                     ; F479   0003
        MVI@    R4,     R3                      ; F47A   02A3
        SUBR    R0,     R3                      ; F47B   0103
        MVO@    R7,     R4                      ; F47C   0267
        SUBR    R0,     R3                      ; F47D   0103
        ADCR    R3                              ; F47E   002B
        BPL     L_F581                          ; F47F   0203 0100
        BNOV    L_F5C3                          ; F481   020A 0140

        INCR    R3                              ; F483   000B
        ANDR    R0,     R0                      ; F484   0180
        BNEQ    L_F777                          ; F485   020C 02F0

        SUBR    R0,     R0                      ; F487   0100
        DECR    R0                              ; F488   0010
        SUB     .STIC.HDLY,R1                   ; F489   0301 0030
        BC      L_F58D                          ; F48B   0201 0100
        INCR    R7                              ; F48D   000F

        CMPR    R0,     R0                      ; F48E   0140
L_F48F:
        SUBR    R2,     R0                      ; F48F   0110
        AND     G_0111, R0                      ; F490   0380 0111
        ADDR    R6,     R4                      ; F492   00F4
        INCR    R3                              ; F493   000B
        CMPI    #$020B, R4                      ; F494   037C 020B
        SUBR    R0,     R4                      ; F496   0104
        INCR    R3                              ; F497   000B
        ADDR    R2,     R4                      ; F498   00D4
        ANDR    R4,     R3                      ; F499   01A3
L_F49A:
        SUB     G_011C, R1                      ; F49A   0301 011C
        DECLE   $00F0,  $0139,  $02D4,  $0396   ; F49C   00F0 0139 02D4 0396
        DECLE   $0101,  $001C,  $02F0,  $0239   ; F4A0   0101 001C 02F0 0239

        XOR@    R4,     R4                      ; F4A4   03E4
L_F4A5:
        MOVR    R2,     R5                      ; F4A5   0095
        DECLE   $0001                           ; F4A6   0001
L_F4A7:
        COMR    R5                              ; F4A7   001D
        DECLE   $00E0,  $0039,  $007C,  $0095   ; F4A8   00E0 0039 007C 0095
        DECLE   $0000                           ; F4AC   0000

        COMR    R6                              ; F4AD   001E
        ADDR    R2,     R0                      ; F4AE   00D0
        SUBR    R7,     R1                      ; F4AF   0139
        MVO     R4,     G_0198                  ; F4B0   0244 0198
L_F4B2:
        SUBR    R0,     R1                      ; F4B2   0101
        COMR    R4                              ; F4B3   001C
        ADDR    R6,     R0                      ; F4B4   00F0
        RSWD    R1                              ; F4B5   0039
L_F4B6:
        XORR    R0,     R4                      ; F4B6   01C4
        MOVR    R2,     R7                      ; F4B7   0097

        DECLE   $0301,  $001D,  $00E0,  $0239   ; F4B8   0301 001D 00E0 0239
        DECLE   $02A4,  $039F,  $0000,  $001F   ; F4BC   02A4 039F 0000 001F
L_F4C0:
        ADDR    R0,     R0                      ; F4C0   00C0
        DECLE   $0039,  $02C4,  $009A,  $0001   ; F4C1   0039 02C4 009A 0001
L_F4C5:
        SUBR    R3,     R4                      ; F4C5   011C
        ADDR    R6,     R0                      ; F4C6   00F0
        RSWD    R1                              ; F4C7   0039
L_F4C8:
        XORR    R0,     R4                      ; F4C8   01C4
        MOVR    R3,     R1                      ; F4C9   0099
L_F4CA:
        SUBR    R0,     R1                      ; F4CA   0101
        DECLE   $031D,  $02E0,  $0139,  $00AC   ; F4CB   031D 02E0 0139 00AC
        DECLE   $019F,  $0001,  $021F           ; F4CF   019F 0001 021F

        CLRR    R0                              ; F4D2   01C0
        RSWD    R1                              ; F4D3   0039
        MOVR    R5,     R4                      ; F4D4   00AC
L_F4D5:
        ANDR    R4,     R0                      ; F4D5   01A0
        SUB     G_011F, R1                      ; F4D6   0301 011F
        ADDR    R0,     R0                      ; F4D8   00C0
        SUBR    R7,     R1                      ; F4D9   0139
        CMPR    R0,     R4                      ; F4DA   0144
        MVI@    R3,     R1                      ; F4DB   0299
L_F4DC:
        SUBR    R0,     R1                      ; F4DC   0101
        DECLE   $001C,  $01F0,  $0139,  $03C4   ; F4DD   001C 01F0 0139 03C4
        DECLE   $0198,  $0001,  $021D,  $00E0   ; F4E1   0198 0001 021D 00E0
        DECLE   $0339,  $010C,  $00A3,  $0000   ; F4E5   0339 010C 00A3 0000
        DECLE   $001F                           ; F4E9   001F

        ADDR    R0,     R0                      ; F4EA   00C0
        RSWD    R1                              ; F4EB   0039
        SLR     R0,     2                       ; F4EC   0064
        MOVR    R2,     R5                      ; F4ED   0095
        SUBR    R0,     R0                      ; F4EE   0100
        SUBR    R3,     R7                      ; F4EF   011F

        DECLE   $01C8,  $0239                   ; F4F0   01C8 0239
L_F4F2:
        CMPR    R4,     R4                      ; F4F2   0164
        DECLE   $0195,  $0000,  $0021,  $0080   ; F4F3   0195 0000 0021 0080
        DECLE   $0239,  $0074,  $0395,  $0000   ; F4F7   0239 0074 0395 0000
        DECLE   $0022,  $0290,  $0239,  $036C   ; F4FB   0022 0290 0239 036C
        DECLE   $0095,  $0001,  $0022,  $0090   ; F4FF   0095 0001 0022 0090
        DECLE   $0239                           ; F503   0239

        ADCR    R4                              ; F504   002C
        MOVR    R4,     R3                      ; F505   00A3
L_F506:
        SUB     G_0324, R0                      ; F506   0300 0324
        TSTR    R0                              ; F508   0080
        SUBR    R7,     R1                      ; F509   0139
        RLC     R0,     2                       ; F50A   0054
        MOVR    R4,     R3                      ; F50B   00A3
        SUB     .BTAB.24,R1                     ; F50C   0301 0224
L_F50E:
        ANDR    R0,     R0                      ; F50E   0180
        DECLE   $0039,  $01C4,  $029B,  $0301   ; F50F   0039 01C4 029B 0301
        DECLE   $011D,  $00E0,  $0139,  $0374   ; F513   011D 00E0 0139 0374
        DECLE   $029D,  $0101,  $001C,  $00F0   ; F517   029D 0101 001C 00F0
        DECLE   $0039,  $03C4,  $019C,  $0001   ; F51B   0039 03C4 019C 0001
        DECLE   $011D,  $02E0,  $0239,  $0174   ; F51F   011D 02E0 0239 0174
        DECLE   $009E,  $0301,  $001C,  $02F0   ; F523   009E 0301 001C 02F0
        DECLE   $0139,  $006C,  $00A1,  $0001   ; F527   0139 006C 00A1 0001
        DECLE   $001F                           ; F52B   001F

        ADDR    R0,     R0                      ; F52C   00C0
        RSWD    R1                              ; F52D   0039
        INCR    R4                              ; F52E   000C
        MVI@    R4,     R2                      ; F52F   02A2
        BC      L_F652                          ; F530   0201 0120

        PULR    R0                              ; F532   02B0
        SUBR    R7,     R1                      ; F533   0139
        SUBR    R4,     R4                      ; F534   0124
        MOVR    R3,     R7                      ; F535   009F

        DECLE   $0001                           ; F536   0001

        COMR    R4                              ; F537   001C
        XOR@    R6,     R0                      ; F538   03F0
L_F539:
        RSWD    R1                              ; F539   0039
        CMP@    R4,     R4                      ; F53A   0364
        MOVR    R3,     R7                      ; F53B   009F

        DECLE   $0001,  $021D                   ; F53C   0001 021D

        ADD@    R4,     R0                      ; F53E   02E0
        SUBI    #$00DD, R1                      ; F53F   0339 00DD
        TSTR    R3                              ; F541   009B
        DECR    R4                              ; F542   0014
        MOVR    R3,     R4                      ; F543   009C
        ADD@    R4,     R1                      ; F544   02E1
        MOVR    R3,     R4                      ; F545   009C
        MOVR    R2,     R5                      ; F546   0095
L_F547:
        AND@    R3,     R5                      ; F547   039D
        RRC     R2,     2                       ; F548   0076
        ANDR    R3,     R6                      ; F549   019E
        ANDR    R1,     R1                      ; F54A   0189
        MOVR    R3,     R7                      ; F54B   009F

        DECLE   $01FC,  $019F,  $03CE,  $01A0   ; F54C   01FC 019F 03CE 01A0
        DECLE   $00E1,  $00A1,  $0095,  $03A2   ; F550   00E1 00A1 0095 03A2
        DECLE   $0184,  $0000                   ; F554   0184 0000

        ANDR    R0,     R4                      ; F556   0184
        SUBR    R0,     R0                      ; F557   0100
        MVI     .ISRVEC.0,R4                    ; F558   0284 0100
        MOVR    R0,     R4                      ; F55A   0084
        B       L_F5E1                          ; F55B   0200 0084

        DECLE   $0300,  $0184,  $0000,  $0084   ; F55D   0300 0184 0000 0084
        DECLE   $0000                           ; F561   0000

        MVI     .STIC.X.0,R4                    ; F562   0284 0000
        MOVR    R0,     R4                      ; F564   0084
L_F565:
        CLRC                                    ; F565   0006
        MOVR    R0,     R4                      ; F566   0084
        SUBR    R0,     R6                      ; F567   0106
        ANDR    R0,     R4                      ; F568   0184
        CLRC                                    ; F569   0006
        MVI     .STIC.X.6,R4                    ; F56A   0284 0006
        AND     G_0106, R4                      ; F56C   0384 0106
        MOVR    R0,     R1                      ; F56E   0081
        AND     G_0381, R2                      ; F56F   0382 0381
        MVI     G_0106, R2                      ; F571   0282 0106
        MOVR    R0,     R2                      ; F573   0082
        MVI     G_0083, R4                      ; F574   0284 0083
        MOVR    R0,     R4                      ; F576   0084
        MOVR    R0,     R3                      ; F577   0083
        MOVR    R0,     R4                      ; F578   0084
L_F579:
        MOVR    R0,     R3                      ; F579   0083
        MOVR    R0,     R4                      ; F57A   0084
        MOVR    R0,     R3                      ; F57B   0083
        MOVR    R0,     R4                      ; F57C   0084
        MOVR    R0,     R3                      ; F57D   0083
        MOVR    R0,     R4                      ; F57E   0084
        MOVR    R0,     R3                      ; F57F   0083
        MOVR    R0,     R4                      ; F580   0084
L_F581:
        MOVR    R0,     R3                      ; F581   0083
        MOVR    R0,     R4                      ; F582   0084
        MOVR    R0,     R3                      ; F583   0083
        MOVR    R0,     R4                      ; F584   0084
        MOVR    R0,     R6                      ; F585   0086
        MOVR    R0,     R4                      ; F586   0084
        MOVR    R0,     R6                      ; F587   0086
        MOVR    R0,     R4                      ; F588   0084
        MOVR    R1,     R0                      ; F589   0088
        MOVR    R0,     R4                      ; F58A   0084
        MOVR    R1,     R0                      ; F58B   0088
        MOVR    R0,     R4                      ; F58C   0084
L_F58D:
        MOVR    R1,     R0                      ; F58D   0088
        MOVR    R0,     R4                      ; F58E   0084
        MOVR    R1,     R0                      ; F58F   0088
L_F590:
        MOVR    R0,     R4                      ; F590   0084
        DECLE   $0088,  $0084,  $0088,  $0010   ; F591   0088 0084 0088 0010
        DECLE   $0000,  $0010,  $0000           ; F595   0000 0010 0000
L_F598:
        DECR    R0                              ; F598   0010
        DECLE   $0000,  $0010,  $0000,  $0010   ; F599   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $0000,  $0010   ; F59D   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $0000           ; F5A1   0000 0010 0000

        DECR    R0                              ; F5A4   0010

        JSR     R4,     X_ISR                   ; F5A5   0004 0010 0004

L_F5A8:
        DECR    R7                              ; F5A8   0017

        MOVR    R2,     R0                      ; F5A9   0090
L_F5AA:
        DECR    R7                              ; F5AA   0017

        MOVR    R2,     R0                      ; F5AB   0090
        COMR    R0                              ; F5AC   0018
        MOVR    R2,     R0                      ; F5AD   0090
        COMR    R1                              ; F5AE   0019
        MOVR    R2,     R0                      ; F5AF   0090
        COMR    R2                              ; F5B0   001A
        MOVR    R2,     R0                      ; F5B1   0090
        COMR    R6                              ; F5B2   001E
        MOVR    R2,     R0                      ; F5B3   0090
        DECR    R0                              ; F5B4   0010

        JSR     R4,     X_ISR                   ; F5B5   0004 0010 0004

L_F5B8:
        DECR    R7                              ; F5B8   0017

        MOVR    R2,     R0                      ; F5B9   0090
L_F5BA:
        DECR    R7                              ; F5BA   0017

        MOVR    R2,     R0                      ; F5BB   0090
        COMR    R0                              ; F5BC   0018
        MOVR    R2,     R0                      ; F5BD   0090
        COMR    R1                              ; F5BE   0019
        MOVR    R2,     R0                      ; F5BF   0090
        COMR    R2                              ; F5C0   001A
        MOVR    R2,     R0                      ; F5C1   0090
        COMR    R6                              ; F5C2   001E
L_F5C3:
        MOVR    R2,     R0                      ; F5C3   0090
        DECLE   $0000,  $0088,  $0000,  $0088   ; F5C4   0000 0088 0000 0088
        DECLE   $0000,  $0088,  $0000,  $0088   ; F5C8   0000 0088 0000 0088
        DECLE   $0000,  $0088,  $0000,  $0088   ; F5CC   0000 0088 0000 0088
        DECLE   $0000,  $0088,  $0000,  $0088   ; F5D0   0000 0088 0000 0088
        DECLE   $0000                           ; F5D4   0000

        MOVR    R1,     R0                      ; F5D5   0088
        EIS                                     ; F5D6   0002
        MOVR    R1,     R2                      ; F5D7   008A
        DECR    R1                              ; F5D8   0011
        TSTR    R2                              ; F5D9   0092
        DECR    R5                              ; F5DA   0015
        MOVR    R2,     R3                      ; F5DB   0093
L_F5DC:
        DECR    R7                              ; F5DC   0017

        MOVR    R2,     R4                      ; F5DD   0094
        COMR    R0                              ; F5DE   0018
        MOVR    R2,     R7                      ; F5DF   0097

        COMR    R3                              ; F5E0   001B
L_F5E1:
        MOVR    R3,     R2                      ; F5E1   009A
        NEGR    R0                              ; F5E2   0020
        MOVR    R3,     R7                      ; F5E3   009F

        DECLE   $0000,  $0000,  $0000,  $0000   ; F5E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0082   ; F5F4   0000 0000 0002 0082
        DECLE   $0011,  $008A,  $0015,  $008B   ; F5F8   0011 008A 0015 008B
        DECLE   $001F,  $0092,  $0020,  $0095   ; F5FC   001F 0092 0020 0095
        DECLE   $0020,  $00A2,  $0028,  $009D   ; F600   0020 00A2 0028 009D
        DECLE   $0000,  $0000,  $0000,  $0000   ; F604   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F608   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F60C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F610   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0082   ; F614   0000 0000 0003 0082
        DECLE   $0011,  $008B,  $0015,  $008B   ; F618   0011 008B 0015 008B
        DECLE   $001B,  $008E,  $001E,  $0095   ; F61C   001B 008E 001E 0095
        DECLE   $001F,  $009C,  $0027,  $009C   ; F620   001F 009C 0027 009C
        DECLE   $0000,  $0088,  $0000,  $0088   ; F624   0000 0088 0000 0088
        DECLE   $0000,  $0088,  $0000           ; F628   0000 0088 0000

        MOVR    R1,     R0                      ; F62B   0088
        MOVR    R0,     R3                      ; F62C   0083
        MOVR    R0,     R7                      ; F62D   0087

        MOVR    R0,     R5                      ; F62E   0085
        MOVR    R0,     R2                      ; F62F   0082
        MOVR    R0,     R7                      ; F630   0087

        DECLE   $0084,  $0000,  $0088,  $0082   ; F631   0084 0000 0088 0082
        DECLE   $0088,  $0001,  $0083,  $0003   ; F635   0088 0001 0083 0003
        DECLE   $0085,  $0000,  $0000,  $0000   ; F639   0085 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F63D   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0086,  $0002   ; F641   0000 0004 0086 0002
        DECLE   $0000,  $0001,  $0081,  $0000   ; F645   0000 0001 0081 0000
        DECLE   $0000,  $0082,  $0000           ; F649   0000 0082 0000

        MOVR    R0,     R7                      ; F64C   0087

        MOVR    R0,     R3                      ; F64D   0083
        MOVR    R0,     R5                      ; F64E   0085
        MOVR    R0,     R5                      ; F64F   0085
        MOVR    R0,     R4                      ; F650   0084
        EIS                                     ; F651   0002
L_F652:
        MOVR    R1,     R0                      ; F652   0088
        MOVR    R0,     R3                      ; F653   0083
        MOVR    R0,     R2                      ; F654   0082
        MOVR    R0,     R7                      ; F655   0087

        DECLE   $0083,  $0088,  $0002,  $0083   ; F656   0083 0088 0002 0083
        DECLE   $0003,  $0086,  $0001,  $0086   ; F65A   0003 0086 0001 0086
        DECLE   $0000,  $0081,  $0082,  $0001   ; F65E   0000 0081 0082 0001
        DECLE   $0083,  $0000,  $0086,  $0083   ; F662   0083 0000 0086 0083
        DECLE   $0085,  $0086,  $0052,  $00FD   ; F666   0085 0086 0052 00FD
        DECLE   $00A8,  $000E,  $0005           ; F66A   00A8 000E 0005

        EIS                                     ; F66D   0002
        MOVR    R4,     R7                      ; F66E   00A7

        DECLE   $00FD,  $0099,  $0000,  $0091   ; F66F   00FD 0099 0000 0091
        DECLE   $00FF,  $00AB,  $0008,  $008D   ; F673   00FF 00AB 0008 008D
        DECLE   $00FC,  $0061,  $0000,  $00A6   ; F677   00FC 0061 0000 00A6
        DECLE   $0001                           ; F67B   0001

        ADDR    R4,     R7                      ; F67C   00E7

        ADDR    R7,     R6                      ; F67D   00FE
        ADDR    R0,     R7                      ; F67E   00C7

        DECLE   $0009,  $002E,  $0000,  $00D3   ; F67F   0009 002E 0000 00D3
        DECLE   $00FF,  $0075,  $0002,  $004D   ; F683   00FF 0075 0002 004D
        DECLE   $00FF,  $001E,  $0000,  $003F   ; F687   00FF 001E 0000 003F
        DECLE   $0000,  $008B,  $00FF,  $0025   ; F68B   0000 008B 00FF 0025
        DECLE   $000C,  $0217,  $0006,  $0049   ; F68F   000C 0217 0006 0049
        DECLE   $004E,  $0054,  $0056,  $0000   ; F693   004E 0054 0056 0000
        DECLE   $0229,  $0006,  $0050,  $0052   ; F697   0229 0006 0050 0052
        DECLE   $0045,  $0053,  $0045,  $004E   ; F69B   0045 0053 0045 004E
        DECLE   $0054,  $0053,  $0000,  $0265   ; F69F   0054 0053 0000 0265
        DECLE   $0007,  $0053,  $0055,  $0050   ; F6A3   0007 0053 0055 0050
        DECLE   $0045,  $0052,  $0020,  $0050   ; F6A7   0045 0052 0020 0050
        DECLE   $0052,  $004F,  $0000,  $0279   ; F6AB   0052 004F 0000 0279
        DECLE   $0007,  $0044,  $0045,  $0043   ; F6AF   0007 0044 0045 0043
        DECLE   $0041,  $0054,  $0048,  $004C   ; F6B3   0041 0054 0048 004C
        DECLE   $004F,  $004E,  $0000,  $02B8   ; F6B7   004F 004E 0000 02B8
        DECLE   $0003,  $0031,  $0039,  $0038   ; F6BB   0003 0031 0039 0038
        DECLE   $0038,  $0000,  $02CB,  $0003   ; F6BF   0038 0000 02CB 0003
        DECLE   $0049,  $004E,  $0054,  $0056   ; F6C3   0049 004E 0054 0056
        DECLE   $0002,  $02E3,  $0005,  $0049   ; F6C7   0002 02E3 0005 0049
        DECLE   $004E,  $0054,  $0056,  $0001   ; F6CB   004E 0054 0056 0001
        DECLE   $02E1,  $0007,  $0053,  $0055   ; F6CF   02E1 0007 0053 0055
        DECLE   $0050,  $0045,  $0052,  $0020   ; F6D3   0050 0045 0052 0020
        DECLE   $0050,  $0052,  $004F,  $0001   ; F6D7   0050 0052 004F 0001
        DECLE   $02E1,  $0007,  $0044,  $0045   ; F6DB   02E1 0007 0044 0045
        DECLE   $0043,  $0041,  $0054,  $0048   ; F6DF   0043 0041 0054 0048
        DECLE   $004C,  $004F,  $004E,  $0001   ; F6E3   004C 004F 004E 0001
        DECLE   $0001,  $0001,  $02DD,  $0003   ; F6E7   0001 0001 02DD 0003
        DECLE   $0044,  $0065,  $0073,  $0069   ; F6EB   0044 0065 0073 0069
        DECLE   $0067,  $006E,  $0065,  $0064   ; F6EF   0067 006E 0065 0064
        DECLE   $0020,  $0061,  $006E,  $0064   ; F6F3   0020 0061 006E 0064
        DECLE   $0001,  $02DD,  $0003,  $0050   ; F6F7   0001 02DD 0003 0050
        DECLE   $0072,  $006F,  $0067,  $0072   ; F6FB   0072 006F 0067 0072
        DECLE   $0061,  $006D,  $006D,  $0065   ; F6FF   0061 006D 006D 0065
        DECLE   $0064,  $0020,  $0062,  $0079   ; F703   0064 0020 0062 0079
        DECLE   $003A,  $0001,  $0001,  $02E0   ; F707   003A 0001 0001 02E0
        DECLE   $0006,  $0053,  $0063,  $006F   ; F70B   0006 0053 0063 006F
        DECLE   $0074,  $0074,  $0020,  $0052   ; F70F   0074 0074 0020 0052
        DECLE   $006F,  $0062,  $0069,  $0074   ; F713   006F 0062 0069 0074
        DECLE   $0069,  $006C,  $006C,  $0065   ; F717   0069 006C 006C 0065
        DECLE   $0001,  $0001                   ; F71B   0001 0001

        SDBD                                    ; F71D   0001
        ADD@    R3,     R5                      ; F71E   02DD
        DIS                                     ; F71F   0003
        SWAP    R1,     1                       ; F720   0041
        SAR     R2,     2                       ; F721   006E
        SAR     R1,     1                       ; F722   0069
L_F723:
        SAR     R1,     2                       ; F723   006D
        DECLE   $0061,  $0074,  $0069,  $006F   ; F724   0061 0074 0069 006F
        DECLE   $006E,  $003A,  $0001,  $0001   ; F728   006E 003A 0001 0001
        DECLE   $02E0,  $0006,  $0043,  $006F   ; F72C   02E0 0006 0043 006F
        DECLE   $006E,  $006E,  $0069,  $0065   ; F730   006E 006E 0069 0065
        DECLE   $0020,  $0047,  $006F,  $006C   ; F734   0020 0047 006F 006C
        DECLE   $0064,  $006D,  $0061,  $006E   ; F738   0064 006D 0061 006E
        DECLE   $0001,  $0001,  $0001,  $02DD   ; F73C   0001 0001 0001 02DD
        DECLE   $0003,  $0042,  $0061,  $0063   ; F740   0003 0042 0061 0063
        DECLE   $006B,  $0067,  $0072,  $006F   ; F744   006B 0067 0072 006F
        DECLE   $0075,  $006E,  $0064,  $0073   ; F748   0075 006E 0064 0073
        DECLE   $003A,  $0001,  $0001,  $02E0   ; F74C   003A 0001 0001 02E0
        DECLE   $0006,  $0053,  $0063,  $006F   ; F750   0006 0053 0063 006F
        DECLE   $0074,  $0074,  $0020,  $0052   ; F754   0074 0074 0020 0052
        DECLE   $006F,  $0062,  $0069,  $0074   ; F758   006F 0062 0069 0074
        DECLE   $0069,  $006C,  $006C,  $0065   ; F75C   0069 006C 006C 0065
        DECLE   $0001,  $0001,  $0001,  $02DD   ; F760   0001 0001 0001 02DD
        DECLE   $0003,  $0053,  $006F,  $0075   ; F764   0003 0053 006F 0075
        DECLE   $006E,  $0064,  $0073,  $003A   ; F768   006E 0064 0073 003A
        DECLE   $0001                           ; F76C   0001

        SDBD                                    ; F76D   0001
        ADD@    R4,     R0                      ; F76E   02E0
        CLRC                                    ; F76F   0006
        SWAP    R0,     2                       ; F770   0044
        SLR     R1,     1                       ; F771   0061
        RRC     R2,     2                       ; F772   0076
        SLR     R1,     2                       ; F773   0065
        NEGR    R0                              ; F774   0020
        RLC     R3,     2                       ; F775   0057
        SLR     R1,     1                       ; F776   0061
L_F777:
        RRC     R2,     1                       ; F777   0072
        DECLE   $0068,  $006F,  $006C,  $0001   ; F778   0068 006F 006C 0001
        DECLE   $0001,  $0001,  $02DD,  $0003   ; F77C   0001 0001 02DD 0003
        DECLE   $0050,  $0072,  $006F,  $0064   ; F780   0050 0072 006F 0064
        DECLE   $0075,  $0063,  $0065,  $0064   ; F784   0075 0063 0065 0064
        DECLE   $0020,  $0062,  $0079,  $003A   ; F788   0020 0062 0079 003A
        DECLE   $0001,  $0001,  $02E0,  $0006   ; F78C   0001 0001 02E0 0006
        DECLE   $0044,  $0061,  $0076,  $0065   ; F790   0044 0061 0076 0065
        DECLE   $0020,  $0057,  $0061,  $0072   ; F794   0020 0057 0061 0072
        DECLE   $0068,  $006F,  $006C,  $0001   ; F798   0068 006F 006C 0001
        DECLE   $0001,  $02DD,  $0003,  $0066   ; F79C   0001 02DD 0003 0066
        DECLE   $006F,  $0072,  $0001,  $0001   ; F7A0   006F 0072 0001 0001
        DECLE   $02E0,  $0006,  $0049,  $004E   ; F7A4   02E0 0006 0049 004E
        DECLE   $0054,  $0056,  $0020,  $0043   ; F7A8   0054 0056 0020 0043
        DECLE   $006F,  $0072,  $0070,  $006F   ; F7AC   006F 0072 0070 006F
        DECLE   $0072,  $0061,  $0074,  $0069   ; F7B0   0072 0061 0074 0069
        DECLE   $006F,  $006E,  $0001,  $0001   ; F7B4   006F 006E 0001 0001
        DECLE   $0001,  $0001,  $02E3,  $0005   ; F7B8   0001 0001 02E3 0005
        DECLE   $0049,  $004E,  $0054,  $0056   ; F7BC   0049 004E 0054 0056
        DECLE   $0001,  $02E1,  $0007,  $0053   ; F7C0   0001 02E1 0007 0053
        DECLE   $0055,  $0050,  $0045,  $0052   ; F7C4   0055 0050 0045 0052
        DECLE   $0020,  $0050,  $0052,  $004F   ; F7C8   0020 0050 0052 004F
        DECLE   $0001,  $02E1,  $0007,  $0044   ; F7CC   0001 02E1 0007 0044
        DECLE   $0045,  $0043,  $0041,  $0054   ; F7D0   0045 0043 0041 0054
        DECLE   $0048,  $004C,  $004F,  $004E   ; F7D4   0048 004C 004F 004E
        DECLE   $0001,  $02DD,  $0006,  $0043   ; F7D8   0001 02DD 0006 0043
        DECLE   $006F,  $0070,  $0079,  $0072   ; F7DC   006F 0070 0079 0072
        DECLE   $0069,  $0067,  $0068,  $0074   ; F7E0   0069 0067 0068 0074
        DECLE   $0020,  $0028,  $0063,  $0029   ; F7E4   0020 0028 0063 0029
        DECLE   $0020,  $0031,  $0039,  $0038   ; F7E8   0020 0031 0039 0038
        DECLE   $0038,  $0001,  $02E1,  $0006   ; F7EC   0038 0001 02E1 0006
        DECLE   $0049,  $004E,  $0054,  $0056   ; F7F0   0049 004E 0054 0056
        DECLE   $0020,  $0043,  $006F,  $0072   ; F7F4   0020 0043 006F 0072
        DECLE   $0070,  $002E,  $0001,  $0001   ; F7F8   0070 002E 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F7FC   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F800   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $0293   ; F804   0001 0001 0003 0293
        DECLE   $0000,  $0052,  $0045,  $004C   ; F808   0000 0052 0045 004C
        DECLE   $0049,  $0056,  $0045,  $0000   ; F80C   0049 0056 0045 0000
        DECLE   $02A5,  $0000,  $0054,  $0048   ; F810   02A5 0000 0054 0048
        DECLE   $0045,  $0020,  $0020,  $0046   ; F814   0045 0020 0020 0046
        DECLE   $0049,  $0052,  $0053,  $0054   ; F818   0049 0052 0053 0054
        DECLE   $0000,  $02BA,  $0000,  $004F   ; F81C   0000 02BA 0000 004F
        DECLE   $004C,  $0059,  $004D,  $0050   ; F820   004C 0059 004D 0050
        DECLE   $0049,  $0041,  $0044,  $0001   ; F824   0049 0041 0044 0001
        DECLE   $0293,  $0000,  $0047,  $004F   ; F828   0293 0000 0047 004F
        DECLE   $0020,  $0046,  $004F,  $0052   ; F82C   0020 0046 004F 0052
        DECLE   $0000,  $02A6,  $0000,  $0054   ; F830   0000 02A6 0000 0054
        DECLE   $0048,  $0045,  $0020,  $0047   ; F834   0048 0045 0020 0047
        DECLE   $004F,  $004C,  $0044,  $0001   ; F838   004F 004C 0044 0001
        DECLE   $02A6,  $0000,  $0043,  $0048   ; F83C   02A6 0000 0043 0048
        DECLE   $0041,  $004C,  $004C,  $0045   ; F840   0041 004C 004C 0045
        DECLE   $004E,  $0047,  $0045,  $0000   ; F844   004E 0047 0045 0000

        MVII    #$0000, R1                      ; F848   02B9 0000
        SLLC    R1,     1                       ; F84A   0059
        SLL     R3,     2                       ; F84B   004F
        RLC     R1,     2                       ; F84C   0055
        RLC     R2,     1                       ; F84D   0052
        NEGR    R0                              ; F84E   0020
        SLL     R0,     2                       ; F84F   004C
        SLL     R1,     1                       ; F850   0049
        SLL     R1,     2                       ; F851   004D
        SLL     R1,     1                       ; F852   0049
        RLC     R0,     2                       ; F853   0054
        RLC     R3,     1                       ; F854   0053
        SDBD                                    ; F855   0001
        MVI@    R4,     R7                      ; F856   02A7

        DECLE   $0000,  $0041,  $0043,  $0048   ; F857   0000 0041 0043 0048
        DECLE   $0049,  $0045,  $0056,  $0045   ; F85B   0049 0045 0056 0045
        DECLE   $0000,  $02B9,  $0000,  $0054   ; F85F   0000 02B9 0000 0054
        DECLE   $0048,  $0045,  $0020,  $0055   ; F863   0048 0045 0020 0055
        DECLE   $004C,  $0054,  $0049,  $004D   ; F867   004C 0054 0049 004D
        DECLE   $0041,  $0054,  $0045,  $0000   ; F86B   0041 0054 0045 0000
        DECLE   $02D0,  $0000                   ; F86F   02D0 0000

        RLC     R3,     1                       ; F871   0053
        SWAP    R3,     1                       ; F872   0043
        SLL     R3,     2                       ; F873   004F
        RLC     R2,     1                       ; F874   0052
        SWAP    R1,     2                       ; F875   0045
        SDBD                                    ; F876   0001
        MVI@    R4,     R7                      ; F877   02A7

        DECLE   $0000,  $0054,  $0048,  $0049   ; F878   0000 0054 0048 0049
        DECLE   $0053,  $0020,  $0020,  $0049   ; F87C   0053 0020 0020 0049
        DECLE   $0053,  $0000,  $02BA,  $0000   ; F880   0053 0000 02BA 0000
        DECLE   $0059,  $004F,  $0055,  $0052   ; F884   0059 004F 0055 0052
        DECLE   $0020,  $0020,  $0044,  $0041   ; F888   0020 0020 0044 0041
        DECLE   $0054,  $0045,  $0000,  $02CD   ; F88C   0054 0045 0000 02CD
        DECLE   $0000,  $0057,  $0049,  $0054   ; F890   0000 0057 0049 0054
        DECLE   $0048,  $0020,  $0044,  $0045   ; F894   0048 0020 0044 0045
        DECLE   $0053,  $0054,  $0049,  $004E   ; F898   0053 0054 0049 004E
        DECLE   $0059,  $0002,  $0216,  $0003   ; F89C   0059 0002 0216 0003
        DECLE   $0031,  $0030,  $0030,  $0020   ; F8A0   0031 0030 0030 0020
        DECLE   $004D,  $0065,  $0074,  $0065   ; F8A4   004D 0065 0074 0065
        DECLE   $0072,  $0020,  $0044,  $0061   ; F8A8   0072 0020 0044 0061
        DECLE   $0073,  $0068,  $0000,  $022A   ; F8AC   0073 0068 0000 022A
        DECLE   $0003,  $0042,  $0072,  $006F   ; F8B0   0003 0042 0072 006F
        DECLE   $0061,  $0064,  $0020,  $004A   ; F8B4   0061 0064 0020 004A
        DECLE   $0075,  $006D,  $0070,  $0000   ; F8B8   0075 006D 0070 0000
        DECLE   $023E,  $0003,  $0053,  $0068   ; F8BC   023E 0003 0053 0068
        DECLE   $006F,  $0074,  $002D,  $0050   ; F8C0   006F 0074 002D 0050
        DECLE   $0075,  $0074,  $0000,  $0252   ; F8C4   0075 0074 0000 0252
        DECLE   $0003,  $0048,  $0069,  $0067   ; F8C8   0003 0048 0069 0067
        DECLE   $0068,  $0020,  $004A,  $0075   ; F8CC   0068 0020 004A 0075
        DECLE   $006D,  $0070,  $0000,  $0266   ; F8D0   006D 0070 0000 0266
        DECLE   $0003,  $0054,  $0072,  $0069   ; F8D4   0003 0054 0072 0069
        DECLE   $0070,  $006C,  $0065,  $0020   ; F8D8   0070 006C 0065 0020
        DECLE   $004A,  $0075,  $006D,  $0070   ; F8DC   004A 0075 006D 0070
        DECLE   $0000,  $027A,  $0003,  $0031   ; F8E0   0000 027A 0003 0031
        DECLE   $0031,  $0030,  $0020,  $004D   ; F8E4   0031 0030 0020 004D
        DECLE   $0065,  $0074,  $0065,  $0072   ; F8E8   0065 0074 0065 0072
        DECLE   $0020,  $0048,  $0075,  $0072   ; F8EC   0020 0048 0075 0072
        DECLE   $0064,  $006C,  $0065,  $0000   ; F8F0   0064 006C 0065 0000
        DECLE   $028E,  $0003,  $0044,  $0069   ; F8F4   028E 0003 0044 0069
        DECLE   $0073,  $0063,  $0075,  $0073   ; F8F8   0073 0063 0075 0073
        DECLE   $0020,  $0054,  $0068,  $0072   ; F8FC   0020 0054 0068 0072
        DECLE   $006F,  $0077,  $0000,  $02A2   ; F900   006F 0077 0000 02A2
        DECLE   $0003,  $0050,  $006F,  $006C   ; F904   0003 0050 006F 006C
        DECLE   $0065,  $0020,  $0056,  $0061   ; F908   0065 0020 0056 0061
        DECLE   $0075,  $006C,  $0074,  $0000   ; F90C   0075 006C 0074 0000
        DECLE   $02B6,  $0003,  $004A,  $0061   ; F910   02B6 0003 004A 0061
        DECLE   $0076,  $0065,  $006C,  $0069   ; F914   0076 0065 006C 0069
        DECLE   $006E,  $0020,  $0054,  $0068   ; F918   006E 0020 0054 0068
        DECLE   $0072,  $006F,  $0077,  $0000   ; F91C   0072 006F 0077 0000
        DECLE   $02CA,  $0003,  $0034,  $0030   ; F920   02CA 0003 0034 0030
        DECLE   $0030,  $0020,  $004D,  $0065   ; F924   0030 0020 004D 0065
        DECLE   $0074,  $0065,  $0072,  $0020   ; F928   0074 0065 0072 0020
        DECLE   $0044,  $0061,  $0073,  $0068   ; F92C   0044 0061 0073 0068
        DECLE   $0000                           ; F930   0000

        B       L_F933                          ; F931   0200 0000

L_F933:
        NEGR    R0                              ; F933   0020
        DECLE   $0002,  $0002,  $0013,  $0020   ; F934   0002 0002 0013 0020
        DECLE   $002B,  $0037,  $0045,  $0058   ; F938   002B 0037 0045 0058
        DECLE   $0067,  $0074,  $0084,  $0279   ; F93C   0067 0074 0084 0279
        DECLE   $0000,  $0050,  $004C,  $0052   ; F940   0000 0050 004C 0052
        DECLE   $0023,  $0020,  $0020,  $0020   ; F944   0023 0020 0020 0020
        DECLE   $0020,  $0042,  $0045,  $0041   ; F948   0020 0042 0045 0041
        DECLE   $0054,  $0000,  $028D,  $0000   ; F94C   0054 0000 028D 0000
        DECLE   $0054,  $0052,  $0059,  $0023   ; F950   0054 0052 0059 0023
        DECLE   $0002,  $0279,  $0000,  $0050   ; F954   0002 0279 0000 0050
        DECLE   $004C,  $0052,  $0023,  $0020   ; F958   004C 0052 0023 0020
        DECLE   $0020,  $0020,  $0020,  $0042   ; F95C   0020 0020 0020 0042
        DECLE   $0045,  $0041,  $0054,  $0000   ; F960   0045 0041 0054 0000
        DECLE   $028D,  $0000,  $0054,  $0052   ; F964   028D 0000 0054 0052
        DECLE   $0059,  $0023,  $0020,  $0020   ; F968   0059 0023 0020 0020
        DECLE   $0020,  $0020,  $0042,  $0045   ; F96C   0020 0020 0042 0045
        DECLE   $0053,  $0054,  $0002,  $0054   ; F970   0053 0054 0002 0054
        DECLE   $0049,  $004D,  $0045,  $0000   ; F974   0049 004D 0045 0000
        DECLE   $0044,  $0049,  $0053,  $0054   ; F978   0044 0049 0053 0054
        DECLE   $0000                           ; F97C   0000

        SLL     R0,     1                       ; F97D   0048
        SWAP    R3,     2                       ; F97E   0047
        SLL     R0,     1                       ; F97F   0048
L_F980:
        RLC     R0,     2                       ; F980   0054
        DECLE   $0000,  $0054,  $0069,  $006D   ; F981   0000 0054 0069 006D
        DECLE   $0065,  $0000,  $0044,  $0069   ; F985   0065 0000 0044 0069
        DECLE   $0073,  $0074,  $0000,  $0048   ; F989   0073 0074 0000 0048
        DECLE   $0067,  $0068,  $0074,  $0000   ; F98D   0067 0068 0074 0000
        DECLE   $0291,  $0002,  $0046,  $0041   ; F991   0291 0002 0046 0041
        DECLE   $004C,  $0053,  $0045,  $0020   ; F995   004C 0053 0045 0020
        DECLE   $0053,  $0054,  $0041,  $0052   ; F999   0053 0054 0041 0052
        DECLE   $0054,  $0002,  $0292,  $0002   ; F99D   0054 0002 0292 0002
        DECLE   $004C,  $0049,  $004E,  $0045   ; F9A1   004C 0049 004E 0045
        DECLE   $0020,  $0046,  $004F,  $0055   ; F9A5   0020 0046 004F 0055
        DECLE   $004C,  $0002,  $0292,  $0002   ; F9A9   004C 0002 0292 0002
        DECLE   $0054,  $0049,  $004D,  $0045   ; F9AD   0054 0049 004D 0045
        DECLE   $0020,  $0046,  $004F,  $0055   ; F9B1   0020 0046 004F 0055
        DECLE   $004C,  $0002,  $02A1,  $0007   ; F9B5   004C 0002 02A1 0007
        DECLE   $0050,  $0041,  $0053,  $0053   ; F9B9   0050 0041 0053 0053
        DECLE   $0045,  $0044,  $0021,  $0020   ; F9BD   0045 0044 0021 0020
        DECLE   $0042,  $0045,  $0053,  $0054   ; F9C1   0042 0045 0053 0054
        DECLE   $0020,  $0020,  $0020,  $002E   ; F9C5   0020 0020 0020 002E
        DECLE   $0002,  $02A1,  $0001,  $0053   ; F9C9   0002 02A1 0001 0053
        DECLE   $004F,  $0052,  $0052,  $0059   ; F9CD   004F 0052 0052 0059
        DECLE   $0021,  $0020,  $0020,  $0042   ; F9D1   0021 0020 0020 0042
        DECLE   $0045,  $0053,  $0054,  $0020   ; F9D5   0045 0053 0054 0020
        DECLE   $0020,  $0020,  $002E,  $0002   ; F9D9   0020 0020 002E 0002
        DECLE   $013F,  $0000,  $0051,  $0061   ; F9DD   013F 0000 0051 0061
        DECLE   $0051,  $0061,  $0051,  $0061   ; F9E1   0051 0061 0051 0061
        DECLE   $0051,  $0061,  $0051,  $0061   ; F9E5   0051 0061 0051 0061
        DECLE   $0051,  $0061,  $0051,  $0061   ; F9E9   0051 0061 0051 0061
        DECLE   $0051,  $0061,  $0051,  $0061   ; F9ED   0051 0061 0051 0061
        DECLE   $0051,  $0061,  $0071,  $0081   ; F9F1   0051 0061 0071 0081
        DECLE   $0071,  $0081,  $0071,  $0081   ; F9F5   0071 0081 0071 0081
        DECLE   $0071,  $0081,  $0071,  $0081   ; F9F9   0071 0081 0071 0081
        DECLE   $0071,  $0081,  $0071,  $0081   ; F9FD   0071 0081 0071 0081
        DECLE   $0071,  $0081,  $0071,  $0081   ; FA01   0071 0081 0071 0081
        DECLE   $0071,  $0081,  $003F,  $0002   ; FA05   0071 0081 003F 0002
        DECLE   $0031,  $001F,  $0041,  $0021   ; FA09   0031 001F 0041 0021
        DECLE   $003F,  $0002,  $0031,  $001F   ; FA0D   003F 0002 0031 001F
        DECLE   $0041,  $0021,  $003F,  $0002   ; FA11   0041 0021 003F 0002
        DECLE   $004F,  $0000,  $0001,  $0011   ; FA15   004F 0000 0001 0011
        DECLE   $005F,  $0000,  $0001,  $0011   ; FA19   005F 0000 0001 0011
        DECLE   $004F,  $0000,  $004F,  $0093   ; FA1D   004F 0000 004F 0093
        DECLE   $0001,  $0011,  $005F,  $0093   ; FA21   0001 0011 005F 0093
        DECLE   $0001,  $0011,  $004F,  $0093   ; FA25   0001 0011 004F 0093
        DECLE   $00B4,  $00A4,  $00B4,  $001F   ; FA29   00B4 00A4 00B4 001F
        DECLE   $00A4,  $0001,  $0011,  $00B4   ; FA2D   00A4 0001 0011 00B4
        DECLE   $001F,  $00A4,  $00B4,  $00A4   ; FA31   001F 00A4 00B4 00A4
        DECLE   $00B4,  $0001,  $0011,  $00B4   ; FA35   00B4 0001 0011 00B4
        DECLE   $00A4,  $001F,  $00B4,  $00A4   ; FA39   00A4 001F 00B4 00A4
        DECLE   $00C5,  $00D5,  $001F,  $00C5   ; FA3D   00C5 00D5 001F 00C5
        DECLE   $00D5,  $0001,  $0011,  $00D5   ; FA41   00D5 0001 0011 00D5
        DECLE   $00C5,  $00D5,  $001F,  $00C5   ; FA45   00C5 00D5 001F 00C5
        DECLE   $00D5,  $0001,  $0011,  $002F   ; FA49   00D5 0001 0011 002F
        DECLE   $00D5,  $001F,  $00C5,  $004F   ; FA4D   00D5 001F 00C5 004F
        DECLE   $0006,  $0001,  $0011,  $005F   ; FA51   0006 0001 0011 005F
        DECLE   $0006,  $0001                   ; FA55   0006 0001

        DECR    R1                              ; FA57   0011
        MOVR    R3,     R7                      ; FA58   009F

        DECLE   $0006,  $0001,  $0011,  $005F   ; FA59   0006 0001 0011 005F
        DECLE   $0006,  $0001                   ; FA5D   0006 0001

        DECR    R1                              ; FA5F   0011
        SLL     R3,     2                       ; FA60   004F
        CLRC                                    ; FA61   0006
        ADDR    R4,     R7                      ; FA62   00E7

        DECLE   $00F7,  $001F,  $00E7,  $00F7   ; FA63   00F7 001F 00E7 00F7
        DECLE   $0001,  $0011,  $00F7,  $00E7   ; FA67   0001 0011 00F7 00E7
        DECLE   $00F7,  $001F,  $00E7,  $00F7   ; FA6B   00F7 001F 00E7 00F7
        DECLE   $0001,  $0011,  $001F,  $00E7   ; FA6F   0001 0011 001F 00E7
        DECLE   $001F,  $00F7,  $00E7,  $004F   ; FA73   001F 00F7 00E7 004F
        DECLE   $0008,  $0001,  $0011,  $005F   ; FA77   0008 0001 0011 005F
        DECLE   $0008,  $0001,  $0011,  $004F   ; FA7B   0008 0001 0011 004F
        DECLE   $0008,  $01CF,  $0000,  $0071   ; FA7F   0008 01CF 0000 0071
        DECLE   $0061,  $00FF,  $0000,  $0001   ; FA83   0061 00FF 0000 0001
        DECLE   $0031,  $0041,  $0051,  $0021   ; FA87   0031 0041 0051 0021
        DECLE   $0011,  $006F,  $0000           ; FA8B   0011 006F 0000

        ADCR    R7                              ; FA8E   002F

        MOVR    R4,     R2                      ; FA8F   00A2
L_FA90:
        TSTR    R2                              ; FA90   0092
        DECLE   $005F,  $0003,  $00D4,  $003F   ; FA91   005F 0003 00D4 003F
        DECLE   $0003,  $0082,  $001F,  $00A2   ; FA95   0003 0082 001F 00A2
        DECLE   $0092,  $0003,  $001F           ; FA99   0092 0003 001F

        ADDR    R0,     R5                      ; FA9C   00C5
        MOVR    R6,     R5                      ; FA9D   00B5
        ADCR    R7                              ; FA9E   002F

        ADDR    R0,     R5                      ; FA9F   00C5
L_FAA0:
        MOVR    R6,     R5                      ; FAA0   00B5
        DECLE   $00C5,  $00B5,  $00F4,  $00E4   ; FAA1   00C5 00B5 00F4 00E4
        DECLE   $00B5,  $00C5,  $00B5,  $002F   ; FAA5   00B5 00C5 00B5 002F
        DECLE   $00C5,  $001F                   ; FAA9   00C5 001F

        MOVR    R6,     R5                      ; FAAB   00B5
        ADCR    R7                              ; FAAC   002F

        ADDR    R0,     R5                      ; FAAD   00C5
L_FAAE:
        MOVR    R6,     R5                      ; FAAE   00B5
        DECLE   $001F,  $00C5,  $00B5,  $01A6   ; FAAF   001F 00C5 00B5 01A6
        DECLE   $001F,  $0186,  $001F,  $0007   ; FAB3   001F 0186 001F 0007
        DECLE   $001F                           ; FAB7   001F

        ANDR    R0,     R6                      ; FAB8   0186
        ANDR    R2,     R6                      ; FAB9   0196
        ADDR    R0,     R5                      ; FABA   00C5
        MOVR    R6,     R5                      ; FABB   00B5
        ADDR    R0,     R5                      ; FABC   00C5
        MOVR    R6,     R5                      ; FABD   00B5
        ADDR    R0,     R5                      ; FABE   00C5
        MOVR    R6,     R5                      ; FABF   00B5
        SLL     R3,     2                       ; FAC0   004F
        DIS                                     ; FAC1   0003
        SUBR    R2,     R6                      ; FAC2   0116
        SARC    R3,     2                       ; FAC3   007F
        SETC                                    ; FAC4   0007
        CMPR    R2,     R6                      ; FAC5   0156
        MOVR    R3,     R7                      ; FAC6   009F

        DIS                                     ; FAC7   0003
        SUBR    R0,     R6                      ; FAC8   0106
        SARC    R3,     2                       ; FAC9   007F
        SETC                                    ; FACA   0007
        CMPR    R0,     R6                      ; FACB   0146
        MOVR    R1,     R7                      ; FACC   008F

        DIS                                     ; FACD   0003
        SUBR    R2,     R6                      ; FACE   0116
        MOVR    R3,     R7                      ; FACF   009F

        DECLE   $0007,  $0176,  $0166,  $006F   ; FAD0   0007 0176 0166 006F
        DECLE   $0003,  $0106,  $00BF,  $0007   ; FAD4   0003 0106 00BF 0007
        DECLE   $0156,  $003F                   ; FAD8   0156 003F

        DIS                                     ; FADA   0003
        SUBR    R4,     R6                      ; FADB   0126
        SUBR    R6,     R6                      ; FADC   0136
        ADDR    R1,     R7                      ; FADD   00CF

        DECLE   $0007,  $0146,  $001F,  $0003   ; FADE   0007 0146 001F 0003
        DECLE   $0126,  $0136,  $00FF,  $0007   ; FAE2   0126 0136 00FF 0007
        DECLE   $0176,  $0166,  $01EF,  $0000   ; FAE6   0176 0166 01EF 0000
        DECLE   $0211,  $012F,  $0000,  $0201   ; FAEA   0211 012F 0000 0201
        DECLE   $001F,  $0000,  $0172,  $0000   ; FAEE   001F 0000 0172 0000

        XORR    R0,     R1                      ; FAF2   01C1
        ANDR    R6,     R1                      ; FAF3   01B1
        ADDR    R1,     R7                      ; FAF4   00CF

        DECLE   $0000,  $01D1,  $01F1,  $0000   ; FAF5   0000 01D1 01F1 0000

        CMPR    R2,     R3                      ; FAF9   0153
        CMPR    R4,     R2                      ; FAFA   0162
        ANDR    R0,     R1                      ; FAFB   0181
        ANDR    R4,     R1                      ; FAFC   01A1
        ADDR    R1,     R7                      ; FAFD   00CF

        DECLE   $0000                           ; FAFE   0000

        XORR    R4,     R1                      ; FAFF   01E1
        CMPR    R0,     R1                      ; FB00   0141
        SUBR    R4,     R1                      ; FB01   0121
        SUBR    R2,     R1                      ; FB02   0111
        SUBR    R0,     R1                      ; FB03   0101
        SUBR    R6,     R1                      ; FB04   0131
        ANDR    R2,     R1                      ; FB05   0191
        ADDR    R5,     R7                      ; FB06   00EF

        DECLE   $0000,  $0001                   ; FB07   0000 0001

        MOVR    R6,     R1                      ; FB09   00B1
        ADDR    R0,     R1                      ; FB0A   00C1
        SUBR    R1,     R7                      ; FB0B   010F

        DECLE   $0000                           ; FB0C   0000

        DECR    R1                              ; FB0D   0011
        MOVR    R4,     R1                      ; FB0E   00A1
        SUBR    R1,     R7                      ; FB0F   010F

        DECLE   $0000                           ; FB10   0000

        MOVR    R0,     R1                      ; FB11   0081
        NEGR    R4                              ; FB12   0024
        NOP                                     ; FB13   0034
        SWAP    R1,     1                       ; FB14   0041
        ADDR    R5,     R7                      ; FB15   00EF

        DECLE   $0000,  $00D1,  $0091,  $0071   ; FB16   0000 00D1 0091 0071
        DECLE   $0061,  $0051,  $0251,  $0291   ; FB1A   0061 0051 0251 0291
        DECLE   $02B1,  $002F,  $0000,  $02C5   ; FB1E   02B1 002F 0000 02C5
        DECLE   $007F,  $0000,  $00F1,  $00E1   ; FB22   007F 0000 00F1 00E1
        DECLE   $001F,  $0000,  $0261,  $0271   ; FB26   001F 0000 0261 0271
        DECLE   $0281,  $02A1,  $00BF,  $0000   ; FB2A   0281 02A1 00BF 0000
        DECLE   $0221,  $011F,  $0000,  $0241   ; FB2E   0221 011F 0000 0241
        DECLE   $0231,  $007F,  $0000,  $015F   ; FB32   0231 007F 0000 015F
        DECLE   $0000,  $0071,  $001F,  $0000   ; FB36   0000 0071 001F 0000
        DECLE   $00E2,  $001F,  $0000,  $00F3   ; FB3A   00E2 001F 0000 00F3
        DECLE   $001F,  $0000,  $0101,  $001F   ; FB3E   001F 0000 0101 001F
        DECLE   $0000,  $0112,  $001F,  $0000   ; FB42   0000 0112 001F 0000
        DECLE   $0123,  $001F,  $0000,  $013F   ; FB46   0123 001F 0000 013F
        DECLE   $0064,  $013F,  $0055,  $0046   ; FB4A   0064 013F 0055 0046
        DECLE   $0036,  $0026,  $0046,  $0016   ; FB4E   0036 0026 0046 0016
        DECLE   $0036,  $0026,  $0016,  $0046   ; FB52   0036 0026 0016 0046
        DECLE   $0036,  $0026,  $0016,  $0046   ; FB56   0036 0026 0016 0046
        DECLE   $0036,  $0026,  $0016,  $0046   ; FB5A   0036 0026 0016 0046
        DECLE   $0036,  $0026,  $0046,  $0026   ; FB5E   0036 0026 0046 0026
        DECLE   $0006,  $0016,  $0006,  $001F   ; FB62   0006 0016 0006 001F
        DECLE   $0016,  $001F,  $0026,  $0016   ; FB66   0016 001F 0026 0016
        DECLE   $0006,  $0016,  $0026,  $001F   ; FB6A   0006 0016 0026 001F
        DECLE   $0016,  $0026,  $001F,  $0006   ; FB6E   0016 0026 001F 0006
        DECLE   $0016,  $0026,  $0016,  $013F   ; FB72   0016 0026 0016 013F
        DECLE   $0007,  $001F,  $0134,  $0144   ; FB76   0007 001F 0134 0144
        DECLE   $024F,  $0007,  $001F,  $0088   ; FB7A   024F 0007 001F 0088
        DECLE   $0098,  $0088,  $0098,  $001F   ; FB7E   0098 0088 0098 001F
        DECLE   $0088,  $001F,  $0098,  $001F   ; FB82   0088 001F 0098 001F
        DECLE   $0088,  $0098,  $001F,  $0088   ; FB86   0088 0098 001F 0088
        DECLE   $0098,  $001F                   ; FB8A   0098 001F

        MOVR    R1,     R0                      ; FB8C   0088
        ADCR    R7                              ; FB8D   002F

        MOVR    R3,     R0                      ; FB8E   0098
L_FB8F:
        MOVR    R7,     R1                      ; FB8F   00B9
        DECLE   $00C9,  $00B9,  $001F,  $00C9   ; FB90   00C9 00B9 001F 00C9
        DECLE   $00DA,  $00C9,  $00B9,  $001F   ; FB94   00DA 00C9 00B9 001F
        DECLE   $00C9,  $00B9,  $00C9,  $00B9   ; FB98   00C9 00B9 00C9 00B9
        DECLE   $00C9,  $00DA,  $00B9,  $00C9   ; FB9C   00C9 00DA 00B9 00C9
        DECLE   $00B9,  $001F,  $00C9,  $001F   ; FBA0   00B9 001F 00C9 001F

        MOVR    R5,     R3                      ; FBA4   00AB
        ADCR    R7                              ; FBA5   002F

        MOVR    R5,     R1                      ; FBA6   00A9
L_FBA7:
        CMPR    R3,     R2                      ; FBA7   015A
        SARC    R3,     2                       ; FBA8   007F
        MOVR    R5,     R1                      ; FBA9   00A9
        CMPR    R3,     R2                      ; FBAA   015A
        SLL     R3,     2                       ; FBAB   004F
        MOVR    R5,     R1                      ; FBAC   00A9
        B       L_FDBF                          ; FBAD   0200 0210
        B       L_F980                          ; FBAF   0220 0230

        MVO     R0,     .BTAB.50                ; FBB1   0240 0250
        B       L_FDC5                          ; FBB3   0200 0210

        DECLE   $0220,  $0230,  $0240,  $0250   ; FBB5   0220 0230 0240 0250
        DECLE   $0260,  $0270,  $0280,  $0290   ; FBB9   0260 0270 0280 0290
        DECLE   $02A0,  $02B0,  $0001           ; FBBD   02A0 02B0 0001

        EIS                                     ; FBC0   0002
        ADD     .BTAB.C3,R0                     ; FBC1   02C0 02C3
        ADD@    R2,     R4                      ; FBC3   02D4
        ADD@    R4,     R4                      ; FBC4   02E4
        ADD@    R2,     R5                      ; FBC5   02D5
        ADD@    R4,     R5                      ; FBC6   02E5
        CMPR    R4,     R0                      ; FBC7   0160
        CMPR    R6,     R0                      ; FBC8   0170
        ANDR    R0,     R0                      ; FBC9   0180
        ANDR    R2,     R0                      ; FBCA   0190
        ANDR    R4,     R0                      ; FBCB   01A0
        ANDR    R6,     R0                      ; FBCC   01B0
        CLRR    R0                              ; FBCD   01C0
        XORR    R2,     R0                      ; FBCE   01D0
        XORR    R4,     R0                      ; FBCF   01E0
        XORR    R6,     R0                      ; FBD0   01F0
        ADDR    R2,     R4                      ; FBD1   00D4
        CMPR    R2,     R4                      ; FBD2   0154
        ADDR    R2,     R3                      ; FBD3   00D3
        CMPR    R2,     R3                      ; FBD4   0153
        PSHR    R5                              ; FBD5   0275

        JSR     R5,     L_68EC                  ; FBD6   0004 0168 00EC

        PULR    R5                              ; FBD9   02B5
        MVI@    R5,     R1                      ; FBDA   02A9
        SDBD                                    ; FBDB   0001
        MVI@    R5,     R4                      ; FBDC   02AC
        PSHR    R5                              ; FBDD   0275
        SDBD                                    ; FBDE   0001
        MVII    #$3800, R5                      ; FBDF   02BD 0000 0038
L_FBE2:
        MVI@    R4,     R0                      ; FBE2   02A0
        MVO@    R0,     R5                      ; FBE3   0268
        MVI@    R4,     R0                      ; FBE4   02A0
        MVO@    R0,     R5                      ; FBE5   0268
        MVI@    R4,     R0                      ; FBE6   02A0
        MVO@    R0,     R5                      ; FBE7   0268
        MVI@    R4,     R0                      ; FBE8   02A0
        MVO@    R0,     R5                      ; FBE9   0268
        MVI@    R4,     R0                      ; FBEA   02A0
        MVO@    R0,     R5                      ; FBEB   0268
        MVI@    R4,     R0                      ; FBEC   02A0
        MVO@    R0,     R5                      ; FBED   0268
        MVI@    R4,     R0                      ; FBEE   02A0
        MVO@    R0,     R5                      ; FBEF   0268
        MVI@    R4,     R0                      ; FBF0   02A0
        MVO@    R0,     R5                      ; FBF1   0268
        DECR    R1                              ; FBF2   0011
        BNEQ    L_FBE2                          ; FBF3   022C 0012
        PULR    R7                              ; FBF5   02B7

        PSHR    R5                              ; FBF6   0275

        JSR     R5,     L_68EC                  ; FBF7   0004 0168 00EC

        PULR    R5                              ; FBFA   02B5
        MVI@    R5,     R1                      ; FBFB   02A9
        MVI@    R5,     R2                      ; FBFC   02AA
        SDBD                                    ; FBFD   0001
        MVI@    R5,     R4                      ; FBFE   02AC
        PSHR    R5                              ; FBFF   0275
        SDBD                                    ; FC00   0001
        MVII    #$3800, R5                      ; FC01   02BD 0000 0038
        SLL     R2,     2                       ; FC04   004E
        SLL     R2,     1                       ; FC05   004A
        ADDR    R2,     R5                      ; FC06   00D5
        B       L_FBE2                          ; FC07   0220 0026

        PSHR    R5                              ; FC09   0275

        JSR     R5,     L_68EC                  ; FC0A   0004 0168 00EC

        PULR    R5                              ; FC0D   02B5
        MVI@    R5,     R1                      ; FC0E   02A9
        PSHR    R5                              ; FC0F   0275
        MVI     G_0149, R0                      ; FC10   0280 0149
        SDBD                                    ; FC12   0001
        MVII    #$93B6, R4                      ; FC13   02BC 00B6 0093
        SLL     R0,     2                       ; FC16   004C
        ADDR    R0,     R4                      ; FC17   00C4
        SLL     R0,     2                       ; FC18   004C
        ADDR    R0,     R4                      ; FC19   00C4
        SDBD                                    ; FC1A   0001
        MVII    #$3900, R5                      ; FC1B   02BD 0000 0039
        CLRR    R2                              ; FC1E   01D2
L_FC1F:
        MVO@    R2,     R5                      ; FC1F   026A
        MVI@    R4,     R0                      ; FC20   02A0
        MVO@    R0,     R5                      ; FC21   0268
        MVI@    R4,     R0                      ; FC22   02A0
        MVO@    R0,     R5                      ; FC23   0268
        MVI@    R4,     R0                      ; FC24   02A0
        MVO@    R0,     R5                      ; FC25   0268
        MVI@    R4,     R0                      ; FC26   02A0
        MVO@    R0,     R5                      ; FC27   0268
        MVI@    R4,     R0                      ; FC28   02A0
        MVO@    R0,     R5                      ; FC29   0268
        MVO@    R2,     R5                      ; FC2A   026A
        MVO@    R2,     R5                      ; FC2B   026A
        DECR    R1                              ; FC2C   0011
        BNEQ    L_FC1F                          ; FC2D   022C 000F
        PULR    R7                              ; FC2F   02B7

        MVI@    R5,     R0                      ; FC30   02A8
        MVI@    R5,     R2                      ; FC31   02AA
        SDBD                                    ; FC32   0001
        MVI@    R5,     R3                      ; FC33   02AB
        SDBD                                    ; FC34   0001
        MVI@    R5,     R4                      ; FC35   02AC
        PSHR    R5                              ; FC36   0275
        MOVR    R0,     R5                      ; FC37   0085
L_FC38:
        CLRR    R1                              ; FC38   01C9
L_FC39:
        MVI@    R4,     R0                      ; FC39   02A0
        PSHR    R4                              ; FC3A   0274
        MOVR    R0,     R4                      ; FC3B   0084
        ANDI    #$000F, R4                      ; FC3C   03BC 000F
        CMPI    #$000F, R4                      ; FC3E   037C 000F
        BEQ     L_FC52                          ; FC40   0204 0010

        SAR     R0,     1                       ; FC42   0068
        ANDI    #$01F8, R0                      ; FC43   03B8 01F8
        ADDR    R4,     R4                      ; FC45   00E4
        ADDR    R3,     R4                      ; FC46   00DC
        SDBD                                    ; FC47   0001
        XOR@    R4,     R0                      ; FC48   03E0
L_FC49:
        MVO@    R0,     R5                      ; FC49   0268
        DECR    R1                              ; FC4A   0011
        BPL     L_FC49                          ; FC4B   0223 0003

        PULR    R4                              ; FC4D   02B4
        CMPR    R2,     R5                      ; FC4E   0155
        BNEQ    L_FC38                          ; FC4F   022C 0018
        PULR    R7                              ; FC51   02B7

L_FC52:
        SLR     R0,     2                       ; FC52   0064
        SLR     R0,     2                       ; FC53   0064
        MOVR    R0,     R1                      ; FC54   0081
        PULR    R4                              ; FC55   02B4
        B       L_FC39                          ; FC56   0220 001E

        PSHR    R5                              ; FC58   0275
L_FC59:
        MVI     G_0339, R4                      ; FC59   0284 0339
        MVI     G_034A, R1                      ; FC5B   0281 034A
        MVI@    R4,     R0                      ; FC5D   02A0
        MVI     G_0149, R2                      ; FC5E   0282 0149
        CMPI    #$0009, R2                      ; FC60   037A 0009
        BNEQ    L_FC67                          ; FC62   020C 0003

        SLL     R0,     2                       ; FC64   004C
        SLL     R0,     1                       ; FC65   0048
        INCR    R0                              ; FC66   0008
L_FC67:
        CMPR    R0,     R1                      ; FC67   0141
        BLT     L_FC8D                          ; FC68   0205 0023

        SDBD                                    ; FC6A   0001
        MVII    #$ABB3, R5                      ; FC6B   02BD 00B3 00AB
        MVI@    R4,     R0                      ; FC6E   02A0
        CMPI    #$0040, R0                      ; FC6F   0378 0040
        BGE     L_FC9C                          ; FC71   020D 0029

        ADDR    R0,     R5                      ; FC73   00C5
        MVI@    R5,     R0                      ; FC74   02A8
        MOVR    R0,     R3                      ; FC75   0083
        ANDI    #$03F0, R0                      ; FC76   03B8 03F0
        SLR     R0,     1                       ; FC78   0060
        ANDI    #$000F, R3                      ; FC79   03BB 000F
        ADDR    R3,     R3                      ; FC7B   00DB
        SDBD                                    ; FC7C   0001
        MVII    #$9558, R5                      ; FC7D   02BD 0058 0095
        ADDR    R3,     R5                      ; FC80   00DD
        SDBD                                    ; FC81   0001
        MVI@    R5,     R1                      ; FC82   02A9
        ADDR    R1,     R0                      ; FC83   00C8
        MVII    #$0200, R5                      ; FC84   02BD 0200
        MVI@    R4,     R3                      ; FC86   02A3
        ADDR    R3,     R5                      ; FC87   00DD
        MVO@    R0,     R5                      ; FC88   0268
L_FC89:
        MVO     R4,     G_0339                  ; FC89   0244 0339
        B       L_FC59                          ; FC8B   0220 0033

L_FC8D:
        MVI     G_034A, R0                      ; FC8D   0280 034A
        ANDI    #$0007, R0                      ; FC8F   03B8 0007
        CMPI    #$0002, R0                      ; FC91   0378 0002
        BNEQ    L_FC9B                          ; FC93   020C 0006

        MVII    #$0215, R1                      ; FC95   02B9 0215
        MVI@    R1,     R0                      ; FC97   0288
        ADDI    #$0012, R1                      ; FC98   02F9 0012
        MVO@    R0,     R1                      ; FC9A   0248
L_FC9B:
        PULR    R7                              ; FC9B   02B7

L_FC9C:
        MVII    #$0200, R5                      ; FC9C   02BD 0200
        ADDR    R0,     R5                      ; FC9E   00C5
        MVI@    R5,     R1                      ; FC9F   02A9
        SUBR    R0,     R5                      ; FCA0   0105
        DECR    R5                              ; FCA1   0015
        MVI@    R4,     R0                      ; FCA2   02A0
        ADDR    R0,     R5                      ; FCA3   00C5
        MVO@    R1,     R5                      ; FCA4   0269
        B       L_FC89                          ; FCA5   0220 001D

        PSHR    R5                              ; FCA7   0275
L_FCA8:
        MVI     G_0339, R4                      ; FCA8   0284 0339
        MVI@    R4,     R0                      ; FCAA   02A0
        CMPI    #$00FF, R0                      ; FCAB   0378 00FF
        BEQ     L_FCD1                          ; FCAD   0204 0022

        CMPI    #$0020, R0                      ; FCAF   0378 0020
        BGE     L_FCD2                          ; FCB1   020D 001F

        SDBD                                    ; FCB3   0001
        MVII    #$ABB3, R5                      ; FCB4   02BD 00B3 00AB
        ADDR    R0,     R5                      ; FCB7   00C5
        MVI@    R5,     R0                      ; FCB8   02A8
        MOVR    R0,     R3                      ; FCB9   0083
        ANDI    #$03F0, R0                      ; FCBA   03B8 03F0
        SLR     R0,     1                       ; FCBC   0060
        ANDI    #$000F, R3                      ; FCBD   03BB 000F
        ADDR    R3,     R3                      ; FCBF   00DB
        SDBD                                    ; FCC0   0001
        MVII    #$9558, R5                      ; FCC1   02BD 0058 0095
        ADDR    R3,     R5                      ; FCC4   00DD
        SDBD                                    ; FCC5   0001
        MVI@    R5,     R1                      ; FCC6   02A9
        ADDR    R1,     R0                      ; FCC7   00C8
        MVII    #$0200, R5                      ; FCC8   02BD 0200
        MVI@    R4,     R3                      ; FCCA   02A3
        ADDR    R3,     R5                      ; FCCB   00DD
        MVO@    R0,     R5                      ; FCCC   0268
        MVO     R4,     G_0339                  ; FCCD   0244 0339
        B       L_FCA8                          ; FCCF   0220 0028
L_FCD1:
        PULR    R7                              ; FCD1   02B7

L_FCD2:
        MVII    #$0200, R5                      ; FCD2   02BD 0200
        ADDR    R0,     R5                      ; FCD4   00C5
        MVI@    R5,     R1                      ; FCD5   02A9
        SUBR    R0,     R5                      ; FCD6   0105
        DECR    R5                              ; FCD7   0015
        ADD@    R4,     R5                      ; FCD8   02E5
        MVO@    R1,     R5                      ; FCD9   0269
        MVO     R4,     G_0339                  ; FCDA   0244 0339
        B       L_FCA8                          ; FCDC   0220 0035

        DECLE   $0001,  $00BA,  $0001,  $00C3   ; FCDE   0001 00BA 0001 00C3
        DECLE   $0000,  $00C2,  $00FF,  $00FF   ; FCE2   0000 00C2 00FF 00FF

        ADDR    R1,     R5                      ; FCE6   00CD
        ADDR    R1,     R1                      ; FCE7   00C9
        ADDR    R4,     R1                      ; FCE8   00E1
        ADDR    R3,     R5                      ; FCE9   00DD
        ADDR    R2,     R7                      ; FCEA   00D7

        DECLE   $00D6,  $00EB,  $00EA,  $00CD   ; FCEB   00D6 00EB 00EA 00CD
        DECLE   $00CE,  $00E1,  $00E2,  $0001   ; FCEF   00CE 00E1 00E2 0001
        DECLE   $00C0,  $0000,  $00BF           ; FCF3   00C0 0000 00BF

        ADDR    R1,     R5                      ; FCF6   00CD
        ADDR    R2,     R3                      ; FCF7   00D3
        ADDR    R4,     R1                      ; FCF8   00E1
        ADDR    R4,     R7                      ; FCF9   00E7

        DECLE   $00CD,  $00D8,  $00E1,  $00EC   ; FCFA   00CD 00D8 00E1 00EC
        DECLE   $00CC,  $00CD,  $00E0,  $00E1   ; FCFE   00CC 00CD 00E0 00E1
        DECLE   $00FF                           ; FD02   00FF

        ADDR    R1,     R5                      ; FD03   00CD
        ADDR    R2,     R1                      ; FD04   00D1
        ADDR    R2,     R1                      ; FD05   00D1
        ADDR    R2,     R6                      ; FD06   00D6
        ADDR    R2,     R6                      ; FD07   00D6
        ADDR    R3,     R3                      ; FD08   00DB
        ADDR    R1,     R6                      ; FD09   00CE
        ADDR    R1,     R5                      ; FD0A   00CD
        ADDR    R3,     R0                      ; FD0B   00D8
        ADDR    R2,     R7                      ; FD0C   00D7

        ADDR    R4,     R1                      ; FD0D   00E1
        ADDR    R4,     R5                      ; FD0E   00E5
        ADDR    R4,     R5                      ; FD0F   00E5
        ADDR    R5,     R2                      ; FD10   00EA
        ADDR    R5,     R2                      ; FD11   00EA
        ADDR    R5,     R7                      ; FD12   00EF

        DECLE   $00E2,  $00E1,  $00EC,  $00EB   ; FD13   00E2 00E1 00EC 00EB
        DECLE   $0000,  $00C2,  $0001,  $00C3   ; FD17   0000 00C2 0001 00C3
        DECLE   $00FF,  $00FF,  $0001,  $00BA   ; FD1B   00FF 00FF 0001 00BA
        DECLE   $0001,  $00C3,  $0000,  $00C2   ; FD1F   0001 00C3 0000 00C2
        DECLE   $00FF,  $0001,  $00BA,  $0001   ; FD23   00FF 0001 00BA 0001
        DECLE   $00AF,  $0000,  $00AE,  $000E   ; FD27   00AF 0000 00AE 000E
        DECLE   $00C3,  $000F,  $00EA,  $00FF   ; FD2B   00C3 000F 00EA 00FF

        NEGR    R1                              ; FD2F   0021
        EIS                                     ; FD30   0002
        ADDR    R0,     R7                      ; FD31   00C7

        SAR     R1,     1                       ; FD32   0069
        DIS                                     ; FD33   0003
        ADDR    R0,     R7                      ; FD34   00C7

        DECLE   $00B1,  $0004,  $00C7,  $00F9   ; FD35   00B1 0004 00C7 00F9
        DECLE   $0005                           ; FD39   0005

        ADDR    R0,     R7                      ; FD3A   00C7

        CMPR    R0,     R1                      ; FD3B   0141
        CLRC                                    ; FD3C   0006
        ADDR    R0,     R7                      ; FD3D   00C7

        ANDR    R1,     R1                      ; FD3E   0189
        SETC                                    ; FD3F   0007
        ADDR    R0,     R7                      ; FD40   00C7

        XORR    R2,     R1                      ; FD41   01D1
        INCR    R0                              ; FD42   0008
        ADDR    R0,     R7                      ; FD43   00C7

        DECLE   $0219                           ; FD44   0219

        INCR    R1                              ; FD45   0009
        ADDR    R0,     R7                      ; FD46   00C7

        MVO@    R1,     R4                      ; FD47   0261
        INCR    R2                              ; FD48   000A
        ADDR    R0,     R7                      ; FD49   00C7

        MVI@    R5,     R1                      ; FD4A   02A9
        INCR    R4                              ; FD4B   000C
        ADDR    R0,     R7                      ; FD4C   00C7

        MVI@    R5,     R1                      ; FD4D   02A9
        INCR    R5                              ; FD4E   000D
        ADDR    R3,     R3                      ; FD4F   00DB
        MVI@    R5,     R1                      ; FD50   02A9
        INCR    R5                              ; FD51   000D
        ADDR    R5,     R7                      ; FD52   00EF

        PULR    R1                              ; FD53   02B1
        INCR    R4                              ; FD54   000C
        ADDR    R0,     R7                      ; FD55   00C7

        DECLE   $03FF,  $0068,  $001E,  $00DB   ; FD56   03FF 0068 001E 00DB
        DECLE   $0068,  $001F                   ; FD5A   0068 001F

        ADDR    R5,     R7                      ; FD5C   00EF

        MOVR    R6,     R1                      ; FD5D   00B1
        DECR    R0                              ; FD5E   0010
        ADDR    R3,     R3                      ; FD5F   00DB
        MOVR    R6,     R1                      ; FD60   00B1
        DECR    R1                              ; FD61   0011
        ADDR    R5,     R7                      ; FD62   00EF

        DECLE   $00B9,  $0001                   ; FD63   00B9 0001

        ADDR    R0,     R7                      ; FD65   00C7

        MOVR    R7,     R1                      ; FD66   00B9
        INCR    R4                              ; FD67   000C
        ADDR    R3,     R3                      ; FD68   00DB
        MOVR    R7,     R1                      ; FD69   00B9
        INCR    R4                              ; FD6A   000C
        ADDR    R5,     R7                      ; FD6B   00EF

        ADDR    R0,     R1                      ; FD6C   00C1
        INCR    R4                              ; FD6D   000C
        ADDR    R0,     R7                      ; FD6E   00C7

        ADDR    R0,     R1                      ; FD6F   00C1
        DECR    R2                              ; FD70   0012
        ADDR    R3,     R3                      ; FD71   00DB
        ADDR    R0,     R1                      ; FD72   00C1
        DECR    R3                              ; FD73   0013
        ADDR    R5,     R7                      ; FD74   00EF

        ADDR    R7,     R1                      ; FD75   00F9
        NEGR    R0                              ; FD76   0020
        ADDR    R3,     R3                      ; FD77   00DB
        ADDR    R7,     R1                      ; FD78   00F9
        NEGR    R1                              ; FD79   0021
        ADDR    R5,     R7                      ; FD7A   00EF

        DECLE   $0141,  $0000                   ; FD7B   0141 0000

        ADDR    R0,     R7                      ; FD7D   00C7

        CMPR    R0,     R1                      ; FD7E   0141
        ADDR    R2,     R2                      ; FD7F   00D2
        ADDR    R3,     R3                      ; FD80   00DB
        CMPR    R0,     R1                      ; FD81   0141
        ADDR    R4,     R6                      ; FD82   00E6
        ADDR    R5,     R7                      ; FD83   00EF

        DECLE   $0149,  $0001                   ; FD84   0149 0001

        ADDR    R0,     R7                      ; FD86   00C7

        CMPR    R1,     R1                      ; FD87   0149
        INCR    R5                              ; FD88   000D
        ADDR    R3,     R3                      ; FD89   00DB
        CMPR    R1,     R1                      ; FD8A   0149
        INCR    R5                              ; FD8B   000D
        ADDR    R5,     R7                      ; FD8C   00EF

        CMPR    R2,     R1                      ; FD8D   0151
        INCR    R4                              ; FD8E   000C
        ADDR    R0,     R7                      ; FD8F   00C7

        CMPR    R2,     R1                      ; FD90   0151
        INCR    R5                              ; FD91   000D
        ADDR    R3,     R3                      ; FD92   00DB
        CMPR    R2,     R1                      ; FD93   0151
        INCR    R5                              ; FD94   000D
        ADDR    R5,     R7                      ; FD95   00EF

        DECLE   $03FF                           ; FD96   03FF

        MOVR    R6,     R1                      ; FD97   00B1
        DECR    R0                              ; FD98   0010
        ADDR    R3,     R3                      ; FD99   00DB
        MOVR    R6,     R1                      ; FD9A   00B1
        DECR    R1                              ; FD9B   0011
        ADDR    R5,     R7                      ; FD9C   00EF

        MOVR    R7,     R1                      ; FD9D   00B9
        MOVR    R6,     R3                      ; FD9E   00B3
        ADDR    R3,     R3                      ; FD9F   00DB
        MOVR    R7,     R1                      ; FDA0   00B9
        MOVR    R6,     R3                      ; FDA1   00B3
        ADDR    R5,     R7                      ; FDA2   00EF

        MOVR    R7,     R1                      ; FDA3   00B9
        MOVR    R6,     R3                      ; FDA4   00B3
        ADDR    R0,     R7                      ; FDA5   00C7

        ADDR    R0,     R1                      ; FDA6   00C1
        MOVR    R6,     R3                      ; FDA7   00B3
        ADDR    R3,     R3                      ; FDA8   00DB
        ADDR    R0,     R1                      ; FDA9   00C1
        MOVR    R6,     R3                      ; FDAA   00B3
        ADDR    R5,     R7                      ; FDAB   00EF

        ADDR    R0,     R1                      ; FDAC   00C1
        MOVR    R6,     R3                      ; FDAD   00B3
        ADDR    R0,     R7                      ; FDAE   00C7

        DECLE   $03FF,  $0004                   ; FDAF   03FF 0004

        EIS                                     ; FDB1   0002
        ADDR    R0,     R7                      ; FDB2   00C7

        INCR    R5                              ; FDB3   000D
        DIS                                     ; FDB4   0003
        ADDR    R0,     R7                      ; FDB5   00C7

        DECLE   $0016,  $0004,  $00C7,  $001F   ; FDB6   0016 0004 00C7 001F
        DECLE   $0005                           ; FDBA   0005

        ADDR    R0,     R7                      ; FDBB   00C7

        ADCR    R0                              ; FDBC   0028
        CLRC                                    ; FDBD   0006
        ADDR    R0,     R7                      ; FDBE   00C7

L_FDBF:
        GSWD    R1                              ; FDBF   0031
        SETC                                    ; FDC0   0007
        ADDR    R0,     R7                      ; FDC1   00C7

        RSWD    R2                              ; FDC2   003A
        INCR    R0                              ; FDC3   0008
        ADDR    R0,     R7                      ; FDC4   00C7

L_FDC5:
        SWAP    R3,     1                       ; FDC5   0043
        INCR    R1                              ; FDC6   0009
        ADDR    R0,     R7                      ; FDC7   00C7

        DECLE   $004C,  $0000                   ; FDC8   004C 0000

        ADDR    R0,     R7                      ; FDCA   00C7

        SLL     R1,     2                       ; FDCB   004D
        DECR    R4                              ; FDCC   0014
        ADDR    R0,     R7                      ; FDCD   00C7

        DECLE   $0055,  $0000                   ; FDCE   0055 0000

        ADDR    R0,     R7                      ; FDD0   00C7

        RLC     R2,     2                       ; FDD1   0056
        DECR    R5                              ; FDD2   0015
        ADDR    R0,     R7                      ; FDD3   00C7

        SLLC    R3,     2                       ; FDD4   005F
        DECR    R6                              ; FDD5   0016
        ADDR    R0,     R7                      ; FDD6   00C7

        SAR     R0,     1                       ; FDD7   0068
L_FDD8:
        DECR    R7                              ; FDD8   0017
        ADDR    R0,     R7                      ; FDD9   00C7

        RRC     R1,     1                       ; FDDA   0071
        COMR    R0                              ; FDDB   0018
        ADDR    R0,     R7                      ; FDDC   00C7

        SARC    R2,     1                       ; FDDD   007A
        COMR    R1                              ; FDDE   0019
        ADDR    R0,     R7                      ; FDDF   00C7

        MOVR    R0,     R3                      ; FDE0   0083
        COMR    R2                              ; FDE1   001A
        ADDR    R0,     R7                      ; FDE2   00C7

        MOVR    R1,     R4                      ; FDE3   008C
        COMR    R3                              ; FDE4   001B
        ADDR    R0,     R7                      ; FDE5   00C7

        MOVR    R2,     R5                      ; FDE6   0095
        COMR    R4                              ; FDE7   001C
        ADDR    R0,     R7                      ; FDE8   00C7

        MOVR    R3,     R6                      ; FDE9   009E
        COMR    R5                              ; FDEA   001D
        ADDR    R0,     R7                      ; FDEB   00C7

        MOVR    R4,     R6                      ; FDEC   00A6
        EIS                                     ; FDED   0002
        ADDR    R0,     R7                      ; FDEE   00C7
        MOVR    R4,     R7                      ; FDEF   00A7

        DECR    R4                              ; FDF0   0014
        ADDR    R0,     R7                      ; FDF1   00C7
        MOVR    R5,     R7                      ; FDF2   00AF

        EIS                                     ; FDF3   0002
        ADDR    R0,     R7                      ; FDF4   00C7

        MOVR    R6,     R0                      ; FDF5   00B0
        DECR    R5                              ; FDF6   0015
        ADDR    R0,     R7                      ; FDF7   00C7

        MOVR    R7,     R1                      ; FDF8   00B9
        DECR    R6                              ; FDF9   0016
        ADDR    R0,     R7                      ; FDFA   00C7

        ADDR    R0,     R2                      ; FDFB   00C2
L_FDFC:
        DECR    R7                              ; FDFC   0017
        ADDR    R0,     R7                      ; FDFD   00C7

        ADDR    R1,     R3                      ; FDFE   00CB
        COMR    R0                              ; FDFF   0018
        ADDR    R0,     R7                      ; FE00   00C7

        ADDR    R2,     R4                      ; FE01   00D4
        COMR    R1                              ; FE02   0019
        ADDR    R0,     R7                      ; FE03   00C7

        ADDR    R3,     R5                      ; FE04   00DD
        COMR    R2                              ; FE05   001A
        ADDR    R0,     R7                      ; FE06   00C7

        ADDR    R4,     R6                      ; FE07   00E6
        COMR    R3                              ; FE08   001B
        ADDR    R0,     R7                      ; FE09   00C7
        ADDR    R5,     R7                      ; FE0A   00EF

        COMR    R4                              ; FE0B   001C
        ADDR    R0,     R7                      ; FE0C   00C7

        ADDR    R7,     R0                      ; FE0D   00F8
        COMR    R5                              ; FE0E   001D
        ADDR    R0,     R7                      ; FE0F   00C7

        SUBR    R0,     R0                      ; FE10   0100
        DIS                                     ; FE11   0003
        ADDR    R0,     R7                      ; FE12   00C7

        SUBR    R0,     R1                      ; FE13   0101
        DECR    R4                              ; FE14   0014
        ADDR    R0,     R7                      ; FE15   00C7

        SUBR    R1,     R1                      ; FE16   0109
        DIS                                     ; FE17   0003
        ADDR    R0,     R7                      ; FE18   00C7

        SUBR    R1,     R2                      ; FE19   010A
        DECR    R5                              ; FE1A   0015
        ADDR    R0,     R7                      ; FE1B   00C7

        SUBR    R2,     R3                      ; FE1C   0113
        DECR    R6                              ; FE1D   0016
        ADDR    R0,     R7                      ; FE1E   00C7

        SUBR    R3,     R4                      ; FE1F   011C
L_FE20:
        DECR    R7                              ; FE20   0017
        ADDR    R0,     R7                      ; FE21   00C7

        SUBR    R4,     R5                      ; FE22   0125
        COMR    R0                              ; FE23   0018
        ADDR    R0,     R7                      ; FE24   00C7

        SUBR    R5,     R6                      ; FE25   012E
        COMR    R1                              ; FE26   0019
        ADDR    R0,     R7                      ; FE27   00C7

        DECLE   $0137                           ; FE28   0137

        COMR    R2                              ; FE29   001A
        ADDR    R0,     R7                      ; FE2A   00C7

        CMPR    R0,     R0                      ; FE2B   0140
        COMR    R3                              ; FE2C   001B
        ADDR    R0,     R7                      ; FE2D   00C7

        CMPR    R1,     R1                      ; FE2E   0149
        COMR    R4                              ; FE2F   001C
        ADDR    R0,     R7                      ; FE30   00C7

        CMPR    R2,     R2                      ; FE31   0152
        COMR    R5                              ; FE32   001D
        ADDR    R0,     R7                      ; FE33   00C7

        DECLE   $015A,  $0004                   ; FE34   015A 0004

        ADDR    R0,     R7                      ; FE36   00C7

        CMPR    R3,     R3                      ; FE37   015B
        DECR    R4                              ; FE38   0014
        ADDR    R0,     R7                      ; FE39   00C7

        CMPR    R4,     R3                      ; FE3A   0163
        ADDR    R0,     R6                      ; FE3B   00C6
        ADDR    R0,     R7                      ; FE3C   00C7

        CMPR    R4,     R3                      ; FE3D   0163
        ADDR    R3,     R2                      ; FE3E   00DA
        ADDR    R3,     R3                      ; FE3F   00DB
        CMPR    R4,     R3                      ; FE40   0163
        ADDR    R5,     R6                      ; FE41   00EE
        ADDR    R5,     R7                      ; FE42   00EF

        CMPR    R4,     R4                      ; FE43   0164
        ADDR    R0,     R6                      ; FE44   00C6
        ADDR    R0,     R7                      ; FE45   00C7

        DECLE   $03FF                           ; FE46   03FF

        NEGR    R1                              ; FE47   0021
        EIS                                     ; FE48   0002
        MOVR    R6,     R3                      ; FE49   00B3
        NEGR    R1                              ; FE4A   0021
        ADDR    R4,     R6                      ; FE4B   00E6
        ADDR    R5,     R7                      ; FE4C   00EF

        ADCR    R1                              ; FE4D   0029
        MOVR    R7,     R6                      ; FE4E   00BE
        ADDR    R0,     R7                      ; FE4F   00C7

        DECLE   $0029,  $00AA,  $00B3,  $0069   ; FE50   0029 00AA 00B3 0069
        DECLE   $0003,  $00B3,  $00B1,  $0004   ; FE54   0003 00B3 00B1 0004
        DECLE   $00B3,  $00F9,  $0005,  $00B3   ; FE58   00B3 00F9 0005 00B3
        DECLE   $0141,  $0006,  $00B3,  $0189   ; FE5C   0141 0006 00B3 0189
        DECLE   $0007,  $00B3,  $01D1,  $0008   ; FE60   0007 00B3 01D1 0008
        DECLE   $00B3,  $0219                   ; FE64   00B3 0219

        INCR    R1                              ; FE66   0009
        MOVR    R6,     R3                      ; FE67   00B3
        MVO@    R1,     R4                      ; FE68   0261
        INCR    R2                              ; FE69   000A
        MOVR    R6,     R3                      ; FE6A   00B3
        MVI@    R5,     R1                      ; FE6B   02A9
        NEGR    R1                              ; FE6C   0021
        ADDR    R5,     R7                      ; FE6D   00EF

        MVI@    R5,     R1                      ; FE6E   02A9
        INCR    R3                              ; FE6F   000B
        ADDR    R0,     R7                      ; FE70   00C7

        MVI@    R5,     R1                      ; FE71   02A9
        MOVR    R6,     R0                      ; FE72   00B0
        MOVR    R6,     R3                      ; FE73   00B3
        PULR    R1                              ; FE74   02B1
        MOVR    R6,     R3                      ; FE75   00B3
        ADDR    R0,     R7                      ; FE76   00C7

        PULR    R1                              ; FE77   02B1
        MOVR    R6,     R0                      ; FE78   00B0
        MOVR    R6,     R3                      ; FE79   00B3
        ADD@    R6,     R1                      ; FE7A   02F1
        INCR    R4                              ; FE7B   000C
        MOVR    R6,     R3                      ; FE7C   00B3
        ADD@    R6,     R1                      ; FE7D   02F1
        INCR    R4                              ; FE7E   000C
        ADDR    R0,     R7                      ; FE7F   00C7

        ADD@    R6,     R1                      ; FE80   02F1
        INCR    R5                              ; FE81   000D
        ADDR    R3,     R3                      ; FE82   00DB
        ADD@    R6,     R1                      ; FE83   02F1
        INCR    R5                              ; FE84   000D
        ADDR    R5,     R7                      ; FE85   00EF

        ADDI    #$000C, R1                      ; FE86   02F9 000C
        MOVR    R6,     R3                      ; FE88   00B3
        ADDI    #$000C, R1                      ; FE89   02F9 000C
        ADDR    R0,     R7                      ; FE8B   00C7

        DECLE   $03FF                           ; FE8C   03FF

        ADCR    R1                              ; FE8D   0029
        EIS                                     ; FE8E   0002
        ADDR    R0,     R7                      ; FE8F   00C7

        SARC    R1,     1                       ; FE90   0079
        DIS                                     ; FE91   0003
        ADDR    R0,     R7                      ; FE92   00C7

        DECLE   $00C9,  $0004,  $00C7,  $0119   ; FE93   00C9 0004 00C7 0119
        DECLE   $0005                           ; FE97   0005

        ADDR    R0,     R7                      ; FE98   00C7

        CMPR    R5,     R1                      ; FE99   0169
        CLRC                                    ; FE9A   0006
        ADDR    R0,     R7                      ; FE9B   00C7

        ANDR    R7,     R1                      ; FE9C   01B9
        SETC                                    ; FE9D   0007
        ADDR    R0,     R7                      ; FE9E   00C7
        BNC     L_FEA9                          ; FE9F   0209 0008
        ADDR    R0,     R7                      ; FEA1   00C7

        MVO@    R1,     R3                      ; FEA2   0259
        INCR    R1                              ; FEA3   0009
        ADDR    R0,     R7                      ; FEA4   00C7

        DECLE   $03FF                           ; FEA5   03FF

        SAR     R0,     1                       ; FEA6   0068
        COMR    R6                              ; FEA7   001E
        ADDR    R3,     R3                      ; FEA8   00DB
L_FEA9:
        SAR     R0,     1                       ; FEA9   0068
        DECLE   $001F                           ; FEAA   001F

        ADDR    R5,     R7                      ; FEAB   00EF

        MOVR    R6,     R1                      ; FEAC   00B1
        DECR    R0                              ; FEAD   0010
        ADDR    R3,     R3                      ; FEAE   00DB
        MOVR    R6,     R1                      ; FEAF   00B1
        DECR    R1                              ; FEB0   0011
        ADDR    R5,     R7                      ; FEB1   00EF

        DECLE   $00B9,  $0001                   ; FEB2   00B9 0001

        ADDR    R0,     R7                      ; FEB4   00C7

        MOVR    R7,     R1                      ; FEB5   00B9
        INCR    R4                              ; FEB6   000C
        ADDR    R3,     R3                      ; FEB7   00DB
        MOVR    R7,     R1                      ; FEB8   00B9
        INCR    R4                              ; FEB9   000C
        ADDR    R5,     R7                      ; FEBA   00EF

        ADDR    R0,     R1                      ; FEBB   00C1
        INCR    R4                              ; FEBC   000C
        ADDR    R0,     R7                      ; FEBD   00C7

        ADDR    R0,     R1                      ; FEBE   00C1
        DECR    R2                              ; FEBF   0012
        ADDR    R3,     R3                      ; FEC0   00DB
        ADDR    R0,     R1                      ; FEC1   00C1
        DECR    R3                              ; FEC2   0013
        ADDR    R5,     R7                      ; FEC3   00EF

        ADDR    R7,     R1                      ; FEC4   00F9
        NEGR    R0                              ; FEC5   0020
        ADDR    R3,     R3                      ; FEC6   00DB
        ADDR    R7,     R1                      ; FEC7   00F9
        NEGR    R1                              ; FEC8   0021
        ADDR    R5,     R7                      ; FEC9   00EF

        DECLE   $00F9,  $0000,  $00C7,  $0101   ; FECA   00F9 0000 00C7 0101
        DECLE   $0001                           ; FECE   0001

        ADDR    R0,     R7                      ; FECF   00C7

        CMPR    R0,     R1                      ; FED0   0141
        EIS                                     ; FED1   0002
        ADDR    R0,     R7                      ; FED2   00C7

        CMPR    R0,     R1                      ; FED3   0141
        ADDR    R2,     R2                      ; FED4   00D2
        ADDR    R3,     R3                      ; FED5   00DB
        CMPR    R0,     R1                      ; FED6   0141
        ADDR    R4,     R6                      ; FED7   00E6
        ADDR    R5,     R7                      ; FED8   00EF

        DECLE   $0149,  $0001                   ; FED9   0149 0001

        ADDR    R0,     R7                      ; FEDB   00C7

        CMPR    R1,     R1                      ; FEDC   0149
        INCR    R5                              ; FEDD   000D
        ADDR    R3,     R3                      ; FEDE   00DB
        CMPR    R1,     R1                      ; FEDF   0149
        INCR    R5                              ; FEE0   000D
        ADDR    R5,     R7                      ; FEE1   00EF

        CMPR    R2,     R1                      ; FEE2   0151
        INCR    R4                              ; FEE3   000C
        ADDR    R0,     R7                      ; FEE4   00C7

        CMPR    R2,     R1                      ; FEE5   0151
        INCR    R5                              ; FEE6   000D
        ADDR    R3,     R3                      ; FEE7   00DB
        CMPR    R2,     R1                      ; FEE8   0151
        INCR    R5                              ; FEE9   000D
        ADDR    R5,     R7                      ; FEEA   00EF

        ANDR    R1,     R1                      ; FEEB   0189
        DIS                                     ; FEEC   0003
        ADDR    R0,     R7                      ; FEED   00C7

        DECLE   $0191,  $0001,  $00C7,  $01D1   ; FEEE   0191 0001 00C7 01D1
        DECLE   $0004,  $00C7,  $0219,  $0005   ; FEF2   0004 00C7 0219 0005

        ADDR    R0,     R7                      ; FEF6   00C7

        MVO@    R1,     R4                      ; FEF7   0261
        CLRC                                    ; FEF8   0006
        ADDR    R0,     R7                      ; FEF9   00C7

        MVI@    R5,     R1                      ; FEFA   02A9
        SETC                                    ; FEFB   0007
        ADDR    R0,     R7                      ; FEFC   00C7

        ADD@    R6,     R1                      ; FEFD   02F1
        INCR    R0                              ; FEFE   0008
        ADDR    R0,     R7                      ; FEFF   00C7

        SUBI    #$0009, R1                      ; FF00   0339 0009
        ADDR    R0,     R7                      ; FF02   00C7

        DECLE   $03FF,  $0002,  $0051,  $0002   ; FF03   03FF 0002 0051 0002
        DECLE   $0051,  $0002,  $0051,  $00B7   ; FF07   0051 0002 0051 00B7

        SAR     R2,     1                       ; FF0B   006A
        RRC     R0,     1                       ; FF0C   0070
        MOVR    R5,     R7                      ; FF0D   00AF

        RRC     R0,     1                       ; FF0E   0070
        MOVR    R5,     R7                      ; FF0F   00AF

        RLC     R3,     1                       ; FF10   0053
        SAR     R0,     2                       ; FF11   006C
        RRC     R0,     1                       ; FF12   0070
        MOVR    R5,     R7                      ; FF13   00AF

        SLR     R1,     2                       ; FF14   0065
        SAR     R0,     2                       ; FF15   006C
        MOVR    R3,     R5                      ; FF16   009D
        SAR     R0,     2                       ; FF17   006C
        RRC     R0,     1                       ; FF18   0070
        MOVR    R5,     R7                      ; FF19   00AF

        RRC     R0,     1                       ; FF1A   0070
        MOVR    R5,     R7                      ; FF1B   00AF

        RRC     R0,     1                       ; FF1C   0070
        MOVR    R5,     R7                      ; FF1D   00AF

        SLLC    R1,     2                       ; FF1E   005D
        SAR     R3,     1                       ; FF1F   006B
        TSTR    R0                              ; FF20   0080
        MOVR    R5,     R7                      ; FF21   00AF

        RRC     R0,     1                       ; FF22   0070
        MOVR    R5,     R7                      ; FF23   00AF

        ADDR    R7,     R4                      ; FF24   00FC
        SAR     R0,     2                       ; FF25   006C
        TSTR    R0                              ; FF26   0080
        MOVR    R5,     R7                      ; FF27   00AF

        RRC     R0,     1                       ; FF28   0070
        MOVR    R5,     R7                      ; FF29   00AF

        RRC     R0,     1                       ; FF2A   0070
        MOVR    R5,     R7                      ; FF2B   00AF

        TSTR    R0                              ; FF2C   0080
        MOVR    R5,     R7                      ; FF2D   00AF

        RRC     R0,     1                       ; FF2E   0070
        MOVR    R5,     R7                      ; FF2F   00AF

        COMR    R4                              ; FF30   001C
        SAR     R3,     1                       ; FF31   006B
        TSTR    R0                              ; FF32   0080
        MOVR    R5,     R7                      ; FF33   00AF

        RRC     R0,     1                       ; FF34   0070
        MOVR    R5,     R7                      ; FF35   00AF

        ADDR    R1,     R5                      ; FF36   00CD
        SAR     R3,     1                       ; FF37   006B
        TSTR    R0                              ; FF38   0080
        MOVR    R5,     R7                      ; FF39   00AF

        RRC     R0,     1                       ; FF3A   0070
        MOVR    R5,     R7                      ; FF3B   00AF

        RRC     R0,     1                       ; FF3C   0070
        MOVR    R5,     R7                      ; FF3D   00AF

        SLLC    R0,     2                       ; FF3E   005C
        RLC     R1,     1                       ; FF3F   0051
        RRC     R0,     1                       ; FF40   0070
        MOVR    R5,     R7                      ; FF41   00AF

        SARC    R3,     2                       ; FF42   007F
        RLC     R1,     1                       ; FF43   0051
        SLLC    R0,     2                       ; FF44   005C
        RLC     R1,     1                       ; FF45   0051
        RRC     R0,     1                       ; FF46   0070
        MOVR    R5,     R7                      ; FF47   00AF

        DECLE   $0001                           ; FF48   0001

        SAR     R0,     2                       ; FF49   006C
        RRC     R0,     1                       ; FF4A   0070
        MOVR    R5,     R7                      ; FF4B   00AF

        RRC     R0,     1                       ; FF4C   0070
        MOVR    R5,     R7                      ; FF4D   00AF

        RRC     R0,     1                       ; FF4E   0070
        MOVR    R5,     R7                      ; FF4F   00AF

        SARC    R2,     1                       ; FF50   007A
        MOVR    R5,     R7                      ; FF51   00AF

        ADDR    R0,     R6                      ; FF52   00C6
        SAR     R0,     2                       ; FF53   006C
        RRC     R0,     1                       ; FF54   0070
        MOVR    R5,     R7                      ; FF55   00AF

        RRC     R0,     1                       ; FF56   0070
        MOVR    R5,     R7                      ; FF57   00AF

        ADDR    R3,     R4                      ; FF58   00DC
        SAR     R0,     2                       ; FF59   006C
        RRC     R0,     1                       ; FF5A   0070
        MOVR    R5,     R7                      ; FF5B   00AF

        RRC     R0,     1                       ; FF5C   0070
        MOVR    R5,     R7                      ; FF5D   00AF

        RRC     R0,     1                       ; FF5E   0070
        MOVR    R5,     R7                      ; FF5F   00AF

        RRC     R0,     1                       ; FF60   0070
        MOVR    R5,     R7                      ; FF61   00AF

        RRC     R0,     1                       ; FF62   0070
        MOVR    R5,     R7                      ; FF63   00AF

        SLL     R3,     1                       ; FF64   004B
        SLLC    R0,     2                       ; FF65   005C
        RRC     R0,     1                       ; FF66   0070
        MOVR    R5,     R7                      ; FF67   00AF

        RRC     R0,     1                       ; FF68   0070
        MOVR    R5,     R7                      ; FF69   00AF

        GSWD    R3                              ; FF6A   0033
        SAR     R2,     2                       ; FF6B   006E
        ADCR    R3                              ; FF6C   002B
        SAR     R2,     2                       ; FF6D   006E
        RRC     R0,     1                       ; FF6E   0070
        MOVR    R5,     R7                      ; FF6F   00AF
        MOVR    R5,     R7                      ; FF70   00AF

        PSHR    R5                              ; FF71   0275

        JSR     R5,     L_690B                  ; FF72   0004 0168 010B
        DECLE   $0343                           ; FF75   0343

        SLLC    R2,     2                       ; FF76   005E
        MOVR    R5,     R7                      ; FF77   00AF

        DECLE   $0000                           ; FF78   0000

        PULR    R7                              ; FF79   02B7

        PSHR    R5                              ; FF7A   0275
        MVII    #$0001, R0                      ; FF7B   02B8 0001
        MVO     R0,     G_0155                  ; FF7D   0240 0155
        PULR    R7                              ; FF7F   02B7

        PSHR    R5                              ; FF80   0275
        MVI@    R3,     R1                      ; FF81   0299
        CMPR    R0,     R1                      ; FF82   0141
        BEQ     L_FFC2                          ; FF83   0204 003D

        MOVR    R0,     R2                      ; FF85   0082
        SUBR    R1,     R2                      ; FF86   010A
        CMPI    #$0001, R2                      ; FF87   037A 0001
        BEQ     L_FFC2                          ; FF89   0204 0037

        MOVR    R1,     R2                      ; FF8B   008A
        SUBR    R0,     R2                      ; FF8C   0102
        CMPI    #$0001, R2                      ; FF8D   037A 0001
        BEQ     L_FFC2                          ; FF8F   0204 0031

        MVI     G_014C, R3                      ; FF91   0283 014C
        ANDI    #$0008, R3                      ; FF93   03BB 0008
        BNEQ    L_FFC2                          ; FF95   020C 002B

        MVII    #$00F0, R3                      ; FF97   02BB 00F0
        MVII    #$0002, R2                      ; FF99   02BA 0002
        CMPI    #$00FF, R1                      ; FF9B   0379 00FF
        BNEQ    L_FFA1                          ; FF9D   020C 0002

        ADDI    #$0002, R2                      ; FF9F   02FA 0002
L_FFA1:
        ADD     G_034D, R2                      ; FFA1   02C2 034D
        CMPR    R3,     R2                      ; FFA3   015A
        BLE     L_FFA7                          ; FFA4   0206 0001

        MOVR    R3,     R2                      ; FFA6   009A
L_FFA7:
        MVO     R2,     G_034D                  ; FFA7   0242 034D
        MVI     G_0156, R0                      ; FFA9   0280 0156
        TSTR    R0                              ; FFAB   0080
        BNEQ    L_FFC2                          ; FFAC   020C 0014

        INCR    R0                              ; FFAE   0008
        MVO     R0,     G_0156                  ; FFAF   0240 0156
        MVI     G_011C, R0                      ; FFB1   0280 011C
        ADDI    #$0010, R0                      ; FFB3   02F8 0010
        MVI     G_0149, R1                      ; FFB5   0281 0149
        CMPI    #$0008, R1                      ; FFB7   0379 0008
        BEQ     L_FFBF                          ; FFB9   0204 0004

        CMPI    #$0007, R1                      ; FFBB   0379 0007
        BNEQ    L_FFC0                          ; FFBD   020C 0001

L_FFBF:
        CLRR    R0                              ; FFBF   01C0
L_FFC0:
        MVO     R0,     G_011C                  ; FFC0   0240 011C
L_FFC2:
        PULR    R7                              ; FFC2   02B7

        DECLE   $000A,  $003D,  $0096,  $000A   ; FFC3   000A 003D 0096 000A
        DECLE   $0056,  $009B,  $000A,  $00F9   ; FFC7   0056 009B 000A 00F9
        DECLE   $0098,  $000A,  $00F2,  $009A   ; FFCB   0098 000A 00F2 009A
        DECLE   $000A,  $008A,  $0099,  $000A   ; FFCF   000A 008A 0099 000A
        DECLE   $0070,  $009A,  $000A,  $0000   ; FFD3   0070 009A 000A 0000

        MOVR    R2,     R0                      ; FFD7   0090
        INCR    R2                              ; FFD8   000A
        SWAP    R0,     2                       ; FFD9   0044
        MOVR    R2,     R0                      ; FFDA   0090
        INCR    R2                              ; FFDB   000A
        ADDR    R6,     R0                      ; FFDC   00F0
        MOVR    R2,     R3                      ; FFDD   0093
        INCR    R2                              ; FFDE   000A
        MOVR    R1,     R6                      ; FFDF   008E
        MOVR    R2,     R3                      ; FFE0   0093
        INCR    R1                              ; FFE1   0009
        ADDR    R0,     R1                      ; FFE2   00C1
        TSTR    R2                              ; FFE3   0092
        INCR    R2                              ; FFE4   000A
        MOVR    R5,     R3                      ; FFE5   00AB
        MOVR    R2,     R1                      ; FFE6   0091
        INCR    R2                              ; FFE7   000A
        RLC     R0,     1                       ; FFE8   0050
        MOVR    R2,     R1                      ; FFE9   0091
        INCR    R2                              ; FFEA   000A
        MOVR    R4,     R6                      ; FFEB   00A6
        MOVR    R2,     R0                      ; FFEC   0090
        INCR    R2                              ; FFED   000A
        RLC     R1,     2                       ; FFEE   0055
        MOVR    R2,     R4                      ; FFEF   0094
        INCR    R2                              ; FFF0   000A
        ADDR    R4,     R4                      ; FFF1   00E4
        MOVR    R2,     R5                      ; FFF2   0095
        INCR    R2                              ; FFF3   000A
        SWAP    R3,     2                       ; FFF4   0047
        MOVR    R2,     R5                      ; FFF5   0095
        INCR    R2                              ; FFF6   000A
        ADDR    R7,     R0                      ; FFF7   00F8
        MOVR    R2,     R4                      ; FFF8   0094
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5011       <entry> $6E2F  
;;  $5018       $501B  
;;  $506D       $5071   $5083  
;;  $509B       $5079  
;;  $50A6       $507C  
;;  $50B5       $50C3  
;;  $50C5       $50AE  
;;  $50D5       $50D1  
;;  $50D7       $50C9  
;;  $50DA       $5105  
;;  $50DB       $520E  
;;  $5101       $50F4  
;;  $511E       $577B   $5842   $5880   $597A   $5A64  
;;  $5152       $512B   $5139   $513D  
;;  $5153       $513F   $57A9   $5892  
;;  $5172       $516B  
;;  $517C       $5178  
;;  $517E       $5161  
;;  $5195       $58E3  
;;  $51B9       $57D0  
;;  $51D4       $51C8   $51D0  
;;  $51DE       $51D9  
;;  $51E1       $51DC  
;;  $51E3       $5073  
;;  $51FD       $51F8  
;;  $5211       $51FF   $520C   $521A   $533D   $550C  
;;  $5231       $5236  
;;  $5239       $5213   $5792   $5884   $5915   $5918   $5A88   $5A8B   $5B10  
;;  $5239       $5B2B   $6CB0  
;;  $524E       $5244   $524A  
;;  $525A       $5250  
;;  $526B       $5270  
;;  $5272       $525F   $5265  
;;  $5273       $526B  
;;  $529B       $5279   $5285   $528D  
;;  $529D       $58B7  
;;  $52A2       $52A7  
;;  $52AA       $52A2  
;;  $52DC       $561C  
;;  $52DD       $52B3  
;;  $52F8       $52BA   $52BE   $52C6   $52CC   $52E1   $52EC  
;;  $52F9       $5253  
;;  $5302       $52FE   $5308   $530E  
;;  $5303       $5256  
;;  $530A       $5300  
;;  $531F       $5312   $5317   $531B  
;;  $5336       $532E  
;;  $5361       $5364  
;;  $5376       $53A6   $5409   $540B   $5427  
;;  $53C2       $5443  
;;  $5409       $5404  
;;  $549F       $549A  
;;  $54C7       $53C2   $54C0  
;;  $54DC       $5530   $558C   $559F  
;;  $54EC       $54E4  
;;  $5504       $54FA  
;;  $5506       $5502  
;;  $5508       $54F6  
;;  $554A       $55A9  
;;  $5601       $5527   $553A   $5554   $556E   $5583   $5596   $55B1   $55D9  
;;  $5601       $55F4  
;;  $5620       $5607   $5625  
;;  $5627       $5622  
;;  $563A       $5638  
;;  $56B6       $5B54  
;;  $56F3       $56E2   $56E8  
;;  $56F5       $56EC   $56FC   $5705   $570F   $5717  
;;  $56F7       $56BB   $56D1   $5701   $570B  
;;  $56F8       $56C6  
;;  $5707       $56DF  
;;  $5719       $57F3   $5932   $5AAF  
;;  $5729       $597E  
;;  $5734       $572D  
;;  $573E       $5732  
;;  $5754       $5744   $574B  
;;  $577F       $5773  
;;  $578A       $5783  
;;  $578D       $5788  
;;  $57A3       $5790   $5799   $579E  
;;  $57B3       $57A7  
;;  $57D4       $57C0  
;;  $57E0       $57DA  
;;  $57EF       $57C2  
;;  $57F6       $57F1  
;;  $5803       $57FA   $5913   $592C  
;;  $5818       $5814  
;;  $5826       $57BA   $57C6   $5801   $5808  
;;  $5846       $583A  
;;  $5862       $5857   $585F  
;;  $586A       $5865  
;;  $586D       $584F  
;;  $5884       $576D   $5834   $5878  
;;  $58AE       $589A   $589F   $58A3   $58A7  
;;  $58B0       $58AC  
;;  $58B3       $5890  
;;  $58FC       $58CC  
;;  $590F       $58CF   $58D5  
;;  $592E       $58C5   $58D9   $58E9   $58F0  
;;  $592F       $58D3  
;;  $5974       $5966  
;;  $597E       $595A  
;;  $59A3       $5954  
;;  $59DF       $59B0  
;;  $59E3       $59AC   $59C3   $59CF   $59D7   $59DD  
;;  $59F6       $59F0  
;;  $59F9       $59E9  
;;  $5A0C       $5A02  
;;  $5A1C       $5A17  
;;  $5A20       $5950  
;;  $5A34       $5A24  
;;  $5A48       $598E   $5A0A   $5A12   $5A40  
;;  $5A67       $5A86   $5AAA  
;;  $5A68       $5A59  
;;  $5A7F       $5A6D  
;;  $5A92       $5A53  
;;  $5AC5       $5ABE  
;;  $5AC6       $54E9   $5750   $57B0   $5823   $586A   $58B0   $593E   $5A1C  
;;  $5AC6       $5A45   $5AB2   $660A   $665E  
;;  $5AEB       $5ADF  
;;  $5AEC       $5775   $583C   $587A   $595C   $5A5B  
;;  $5B0D       $5B04   $5B09  
;;  $5B13       $5AF1   $5B0E  
;;  $5B1E       $5B1A  
;;  $5B2E       $5B29  
;;  $5B2F       $5778   $583F   $587D   $595F   $5A5E  
;;  $5B4E       $5B44   $5B48  
;;  $5B50       $5B4C  
;;  $5B5A       $5849   $5987   $59F9  
;;  $5B70       $5B6D  
;;  $5B74       $5B8D   $5BB0  
;;  $5B75       $5B72  
;;  $5B98       $5B83  
;;  $5B9D       $5B88   $5B9A  
;;  $5BBB       $5B62  
;;  $5BC5       $5BC2  
;;  $5BE9       $5BD2   $5BD8  
;;  $5BFC       $54EE   $5766   $57B4   $582A   $5871   $58BC   $5945   $5A4C  
;;  $5BFC       $5AB7   $5AD7  
;;  $5C0B       $5C0E  
;;  $5C15       $5C27  
;;  $5C26       $5C17  
;;  $5C29       $5C03  
;;  $5C2A       $5201  
;;  $5C35       $51FA  
;;  $5C4A       $5C4D   $5C51  
;;  $5C68       $5C57  
;;  $5C6C       $6C4F   $6CF1  
;;  $5C8C       $5C70  
;;  $5CB3       $5E00   $5E5F   $5EC8   $5F07  
;;  $5CBD       $6757  
;;  $5D29       $5D10   $62EC  
;;  $5D4F       $5DD0  
;;  $5D81       $5D13   $5DF0  
;;  $5D91       $5D3A   $5D55   $5D6E   $5D9A   $62E4   $62F4  
;;  $5D99       $5CCA   $5CF8   $5D16   $5DDE  
;;  $5DA2       $5AE1  
;;  $5DF3       $5DBB  
;;  $5E0A       $5E03  
;;  $5E0D       $5DFC   $5E08  
;;  $5E2C       $5E06   $5E0B  
;;  $5E40       $5E2A  
;;  $5E59       $5DF6  
;;  $5E5A       $62D8  
;;  $5E5D       $5DCD  
;;  $5E5E       $5E5C  
;;  $5E6B       $574D  
;;  $5E71       $54E6  
;;  $5E77       $58A9   $592F   $5AAC  
;;  $5E7B       $5E6F   $5E75  
;;  $5E93       $5564   $5634  
;;  $5E9A       $5E9D  
;;  $5EA0       $5DF3   $625F  
;;  $5EB7       $5EA4   $5EBC  
;;  $5EB9       $5EB0  
;;  $5EBE       $5EAC   $5EB5  
;;  $5EC0       $5CF3   $5D30   $5D35   $5D67   $5DD7   $5E0F   $5E2E  
;;  $5ECF       $5ECB  
;;  $5ED2       $5ED7  
;;  $5ED9       $5ED3  
;;  $5EE7       $5EEF  
;;  $5EEA       $5EDD  
;;  $5EF1       $5ACF  
;;  $5F0F       $5F0A  
;;  $5F10       $5F0D  
;;  $5F12       $5F05  
;;  $5F18       $5F00   $5F10  
;;  $5F19       $5D2B   $5DF8  
;;  $5F2C       $50D7  
;;  $5F3D       $5F35   $5F39  
;;  $5F65       $5F47  
;;  $5F66       $5F4D   $5F52   $5F5C   $5F61  
;;  $5F6C       $5F68  
;;  $5F71       $5F6D  
;;  $5F72       $58B4  
;;  $5F8A       $5F77   $5F82  
;;  $5F8B       $5846  
;;  $5FA2       $5F8F   $5F96  
;;  $5FA3       $578A  
;;  $5FB5       $5FB0  
;;  $5FB9       $6009  
;;  $5FBE       $600D   $6032  
;;  $5FCE       $5FBC  
;;  $5FD2       $5FC2   $5FCC  
;;  $5FE9       $5FAC   $5FD4   $5FDB   $5FF8  
;;  $5FEA       $5785  
;;  $5FF4       $5FF0  
;;  $6001       $5FFC  
;;  $6028       $601A  
;;  $6034       $5AE8  
;;  $603C       $53D7  
;;  $604C       $6043   $6048  
;;  $6059       $51E9  
;;  $606E       $6064   $6068  
;;  $6073       $57A0   $58EB  
;;  $6079       $579B   $6084  
;;  $607E       $608F  
;;  $608D       $6087  
;;  $6098       $6092  
;;  $6099       $57AD   $665B  
;;  $60C0       $60BD  
;;  $60C2       $60B0  
;;  $60C3       $591B   $5A8E  
;;  $60D0       $60CA  
;;  $60DB       $60D5  
;;  $60E9       $60E3  
;;  $60F6       $60F3  
;;  $6144       $6134   $6138   $613C   $6140  
;;  $614C       $6148  
;;  $6167       $6163   $617E  
;;  $617D       $6169  
;;  $6190       $6198  
;;  $6192       $6195  
;;  $619C       $619E  
;;  $61A3       $6184  
;;  $61B1       $61AA  
;;  $61C6       $61F7  
;;  $6202       $6209  
;;  $620D       $61BC  
;;  $6213       $6224  
;;  $622F       $6236  
;;  $6238       $60E7   $61B3   $620B  
;;  $6248       $6240  
;;  $624A       $6246  
;;  $624D       $60D9  
;;  $6251       $5AC2   $6CD8  
;;  $625F       $6256  
;;  $626D       $6267   $6297   $62A2  
;;  $6279       $625A   $626B   $6295  
;;  $628E       $6292  
;;  $6294       $628F  
;;  $6299       $6287  
;;  $62B2       $62A4   $6E11  
;;  $62DE       $6329  
;;  $6306       $6303  
;;  $6317       $6313  
;;  $6334       $5E23   $62FF  
;;  $633C       $6335  
;;  $6340       $631A  
;;  $6347       $6349  
;;  $635C       $634D  
;;  $6364       $5C99   $62B9  
;;  $637B       $6CEE  
;;  $6384       $6389  
;;  $638C       $5924   $65EA  
;;  $63A1       $6391   $6397  
;;  $63A2       $57FC   $5927   $59EB   $5BD5   $5F79   $5FB2   $5FFE   $65C5  
;;  $63A2       $65ED   $6615  
;;  $63DA       $55EA   $5A61  
;;  $641B       $6410  
;;  $6420       $6428  
;;  $642A       $6421   $6425  
;;  $6433       $63DF   $63F8   $63FE   $6406  
;;  $6438       $5974   $5981   $5A31  
;;  $6457       $6441  
;;  $646F       $6455   $6459   $64D7  
;;  $649F       $6499  
;;  $64A2       $59A3  
;;  $64BF       $64B7  
;;  $64D7       $64C1  
;;  $64D9       $64A7   $64AD  
;;  $64DA       $647B   $648A  
;;  $64DF       $65D6   $65E5  
;;  $64E8       $63F1   $6534   $6543   $6552   $65B3   $65C2  
;;  $64EB       $64DD   $64E6  
;;  $651C       $64EE   $6505  
;;  $6526       $6523  
;;  $6527       $5977   $5984   $5A2E  
;;  $6556       $5F91  
;;  $6564       $655A  
;;  $6593       $6562  
;;  $659B       $656A   $6572   $657A   $657F   $6585   $658B   $6591   $6597  
;;  $65A7       $659E  
;;  $65C9       $59F6  
;;  $660D       $65F2  
;;  $660E       $684B  
;;  $662B       $6613  
;;  $664E       $662F  
;;  $6661       $661A   $6644   $664C  
;;  $6662       $5803   $5FD6  
;;  $6681       $6674   $6678  
;;  $6684       $6668  
;;  $6695       $668C   $6690  
;;  $66AD       $66A6  
;;  $66AE       $5349  
;;  $66F1       $66ED  
;;  $6707       $670A  
;;  $6710       $6713  
;;  $6715       $66F7  
;;  $674C       $6726   $672E   $6736   $673E   $6746  
;;  $675B       $5C76  
;;  $6773       $5C2E  
;;  $6784       $5C36  
;;  $67A4       $582D   $5948  
;;  $67C9       $67D6   $67DA   $67E2  
;;  $67D0       $67C7  
;;  $67E5       $67A9  
;;  $67F8       $67E9  
;;  $6808       $67AF   $67FA   $6816  
;;  $6809       $5577   $55CF  
;;  $682C       $681F   $6827  
;;  $682E       $6833  
;;  $6835       $682F  
;;  $6840       $6823   $6829  
;;  $6849       $6845  
;;  $684A       $5A7F  
;;  $686A       $6860   $6866  
;;  $686C       $6852  
;;  $686D       $6C43   $6C8E   $6C99  
;;  $6874       $687C  
;;  $6880       $5E56   $5E85  
;;  $6882       $5D84   $5D89  
;;  $688D       $6893  
;;  $6897       $6B83  
;;  $689D       $68A3  
;;  $68A1       $689E  
;;  $68AD       $6B67   $6BC7  
;;  $68B7       $50EB   $510D   $5C59   $5C96   $62B3   $675C   $6C25  
;;  $68C3       $68CC  
;;  $68C7       $50DC   $510A   $5C2B   $62B6   $6C18  
;;  $68CE       $5066   $6987  
;;  $68E4       $505B  
;;  $68EB       $6905   $690D  
;;  $68EC       $FBD6   $FBF7   $FC0A  
;;  $68FA       $68FA  
;;  $6903       $6909  
;;  $690B       $5376   $53B2   $53EF   $5417   $5433   $546D   $54AA   $571A  
;;  $690B       $59B5   $6912   $6BBF   $6D0F   $FF72  
;;  $6914       $6179  
;;  $6916       $6927  
;;  $692C       $5357   $539A   $53AF   $53E2   $53EC   $5414   $5430   $544C  
;;  $692C       $5456   $5460   $546A   $54A7   $54CF   $5C41  
;;  $692E       $693E  
;;  $6941       $5C31   $5CC4   $5DC3   $5E18   $5E37   $5E7E   $61A0   $679D  
;;  $6941       $6B17   $6C2E  
;;  $694C       $6949  
;;  $6950       $696F  
;;  $6954       $694E   $695A  
;;  $6957       $6952  
;;  $696A       $6980  
;;  $6982       $6960  
;;  $6984       $695C  
;;  $6987       $6964  
;;  $698B       $6954   $6966   $696A  
;;  $6994       $6990  
;;  $699A       $5076  
;;  $69A2       $699E  
;;  $69AE       $69AA  
;;  $69B1       $69D1  
;;  $69B9       $69B3  
;;  $69CA       $69B7  
;;  $69D3       $66E1  
;;  $69FA       $69F8  
;;  $6A0C       $699B  
;;  $6A19       $6A11  
;;  $6A1A       $6A18  
;;  $6A43       $6A37   $6A3B   $6A3F  
;;  $6A56       $624A  
;;  $6A61       $6A9A  
;;  $6A65       $6A5F  
;;  $6A76       $6A68   $6A6E  
;;  $6A80       $678E  
;;  $6A91       $6A8C  
;;  $6A9C       $6A74  
;;  $6A9D       $6A8E   $6A91   $6AA3  
;;  $6AA5       $6AAB  
;;  $6ADE       $6ABA   $6ABD   $6AC0   $6AD1   $6AE8  
;;  $6ADF       $6AC4   $6B1A  
;;  $6AE5       $6AC8  
;;  $6B04       $511A  
;;  $6B05       $6AFF  
;;  $6B5C       $6B20   $6B26   $6B32   $6B36   $6B3C  
;;  $6B77       $6B74  
;;  $6BC7       $6B61  
;;  $6BCC       $6B65   $6B7A   $6BB6  
;;  $6BE8       $6BEB   $6BF1   $6BF5  
;;  $6C0A       $6C05  
;;  $6C0B       $6B01  
;;  $6C18       $625C  
;;  $6C3C       $6C3F  
;;  $6C41       $6C3A  
;;  $6C49       $6C16   $6C63  
;;  $6C52       $6C55   $6C59   $6C5D   $6C67   $6C73  
;;  $6C80       $6C6F  
;;  $6C8A       $6C78   $6C7E   $6C85  
;;  $6CA7       $6C9F   $6CA3  
;;  $6CB5       $6CAE  
;;  $6CC3       $6CBF  
;;  $6CC5       $6CAA   $6CB3   $6CB7   $6CC9   $6CD1   $6CD6  
;;  $6CD8       $6CCD  
;;  $6CF7       $6CDE   $6CE2  
;;  $6CF8       $6CE8  
;;  $6D37       $6D05  
;;  $6D40       $6D00  
;;  $6D45       $5CA5  
;;  $6D49       $6D57  
;;  $6D5A       $6D4D   $6D54  
;;  $6D64       $6D78  
;;  $6D68       $6D73  
;;  $6D6B       $6D60  
;;  $6D80       $62EF  
;;  $6D8B       $6D86  
;;  $6DAA       $6DA7  
;;  $6DB4       $6D89   $6DAE  
;;  $6DB5       $6D9D  
;;  $6DBC       $6DB8  
;;  $6DC1       $6DBD  
;;  $6DCA       $6DD5  
;;  $6DD1       $6DCB  
;;  $6DDC       $6DC5   $6DC8   $6DD8  
;;  $6DDF       $6DA0  
;;  $6DE7       $5C68   $6CF8  
;;  $6DF9       $6E36  
;;  $6E0E       $6E09  
;;  $6E2A       $6E03  
;;  $6E32       $6E2D  
;;  $6E70       $5069   $52D8   $535A   $54DD   $5711   $57EB   $58F7   $590B  
;;  $6E70       $59F2   $5A7B   $5BA9   $5C87   $5DC6   $5E1B   $5E3A   $5E8E  
;;  $6E70       $5F9E   $602E   $6627   $6B58   $6BAE   $6DF5  
;;  $6E71       $6681  
;;  $6E82       $6E7C  
;;  $6E95       $6E7A   $6E7F   $6E9A  
;;  $6E96       $624D  
;;  $6EA7       $6E9E  
;;  $6EAB       $6EBE  
;;  $6ED3       $6EF5  
;;  $6EDF       $6ED5   $6ED8  
;;  $6EEA       $6EE6  
;;  $6EF0       $6EE2  
;;  $6EF8       $6EA2  
;;  $6EFE       $6F33   $6F41   $6F4F   $6F52  
;;  $6F2C       $6F28  
;;  $6F3D       $6F37   $6F45  
;;  $6F40       $6F3B  
;;  $6F51       $6F4C  
;;  $6F5B       $6F66  
;;  $6F5D       $6F59  
;;  $6F5E       $6F78  
;;  $6F70       $6EFC   $6FC7  
;;  $6F8B       $6F92  
;;  $6F96       $6F8D  
;;  $6F9D       $6F9A  
;;  $6FAD       $6FB0  
;;  $6FBB       $6FBE  
;;  $6FC5       $6F87   $6F94  
;;  $6FCA       $6F2C   $6F47  
;;  $6FCF       $6FD7  
;;  $6FDB       $6994   $6D49   $6EFE   $6F3D   $6F54   $6F70  
;;  $6FE0       $6FE6  
;;  $D0CC       $D0CA  
;;  $D13B       $D139  
;;  $D14C       $D04B  
;;  $D1B0       $D1AE  
;;  $D242       $D240  
;;  $D2B1       $D2AF  
;;  $D2D9       $D010  
;;  $D31A       $D2EA  
;;  $D346       $D23D  
;;  $D380       $D07E  
;;  $D3C9       $D2D7  
;;  $D3D0       $D3AC  
;;  $D3FE       $D1FB  
;;  $D419       $D219  
;;  $D430       $D32E  
;;  $D452       $D38D  
;;  $D48C       $D48C  
;;  $D4BC       $D4BC  
;;  $D516       $D514  
;;  $D5BA       $D398  
;;  $D5DC       $D5DA  
;;  $D5F6       $D5F4  
;;  $D60B       $D609  
;;  $D63A       $D42E  
;;  $D646       $D851  
;;  $D64B       $D649  
;;  $D66B       $D88E  
;;  $D66C       $D667  
;;  $D67F       $D67D  
;;  $D687       $D685  
;;  $D68D       $D68B  
;;  $D697       $D695  
;;  $D6E4       $D3A8  
;;  $D6F2       $D6E4  
;;  $D777       $D772  
;;  $D7C4       $D7C2  
;;  $D7D6       $D7D4  
;;  $D7D8       $D7D6  
;;  $D7E6       $D7E4  
;;  $D7FF       $D4FD  
;;  $D80A       $D808  
;;  $D818       $D516  
;;  $D828       $D826  
;;  $D833       $D731  
;;  $D83A       $D838  
;;  $D841       $D83F  
;;  $D842       $D840  
;;  $D851       $D842  
;;  $D856       $D654  
;;  $D85A       $D658  
;;  $D86E       $D66C  
;;  $D88B       $D689  
;;  $D895       $D693  
;;  $D89B       $D699  
;;  $D89D       $D883  
;;  $D8A0       $D69E  
;;  $D8AA       $D6A8  
;;  $D8AF       $D790  
;;  $D8C8       $D8C6  
;;  $D902       $D6FD  
;;  $D904       $D702  
;;  $D91F       $D71D  
;;  $D921       $D71F  
;;  $D931       $D72F  
;;  $D994       $D792   $D992  
;;  $D9A4       $D9A2  
;;  $D9A6       $D6A4  
;;  $D9B1       $D733  
;;  $D9B3       $D7B1  
;;  $D9C2       $D7C0  
;;  $D9CB       $D7C9   $D9C9  
;;  $D9F9       $D7F7  
;;  $DA02       $D6FF  
;;  $DA06       $D904  
;;  $DA1B       $DA19  
;;  $DA48       $DA46  
;;  $DA8D       $DA8B  
;;  $DA94       $D892  
;;  $DAF6       $D7F4  
;;  $DB23       $DB21  
;;  $DB66       $DA64  
;;  $DB69       $DA5B  
;;  $DB82       $DB80  
;;  $DB84       $DB82  
;;  $DB96       $DA94  
;;  $DBC8       $DBC6  
;;  $DBE7       $DBE5  
;;  $DC06       $DA04  
;;  $DC0B       $DA09  
;;  $DC1B       $DC19  
;;  $DC56       $DA54  
;;  $DC5B       $DA59  
;;  $DC5D       $DA2B  
;;  $DC92       $DC82  
;;  $DC93       $DB73  
;;  $DCA6       $DAA4  
;;  $DCB3       $D9B1  
;;  $DCFA       $DCF8  
;;  $DD03       $DD01  
;;  $DD06       $DC04   $DD04  
;;  $DD08       $DA06  
;;  $DD0A       $DD08  
;;  $DD2C       $DC2A  
;;  $DD37       $DD35  
;;  $DD64       $DD62  
;;  $DD66       $DD64  
;;  $DD73       $DB71  
;;  $DD83       $DD81  
;;  $DD85       $DCA3  
;;  $DDB4       $DBB2  
;;  $DDD6       $DBD4  
;;  $DDE9       $DBE7  
;;  $DE18       $DD16  
;;  $DE19       $DC17  
;;  $DE27       $DD25  
;;  $DE2C       $DBFA  
;;  $DE7E       $DE7E  
;;  $DE88       $DC86  
;;  $DE9D       $DB23  
;;  $DE9E       $DC8D  
;;  $DEA2       $DBA0  
;;  $DEB9       $DEB7  
;;  $DEC9       $DCC7  
;;  $DECA       $DBC8  
;;  $DEE3       $DDE1  
;;  $DEF8       $DEE8  
;;  $DF17       $DF15  
;;  $DF29       $DD27  
;;  $DF53       $DE51  
;;  $DF83       $DE81  
;;  $DF96       $DC94  
;;  $DFC1       $DFBF  
;;  $DFC7       $DFC5  
;;  $DFD2       $DDD0  
;;  $DFD4       $DFD2  
;;  $DFD6       $DCD4  
;;  $DFE7       $DCE5  
;;  $DFEE       $DFEC  
;;  $F009       $5647  
;;  $F015       $F013  
;;  $F021       $F01F  
;;  $F025       $F023  
;;  $F039       $F037  
;;  $F03B       $F039  
;;  $F03F       $F04E  
;;  $F06B       $F069  
;;  $F0BD       $F0BB  
;;  $F0C4       $F0C2  
;;  $F0D5       $F0D3  
;;  $F0D8       $F0D6  
;;  $F106       $F104  
;;  $F10C       $F10A  
;;  $F13D       $F03B  
;;  $F155       $F153  
;;  $F157       $F155  
;;  $F168       $F066  
;;  $F178       $F176  
;;  $F197       $F195  
;;  $F1AA       $F1A8  
;;  $F1B8       $F1B6  
;;  $F1C2       $F1C0  
;;  $F1C4       $F1C2  
;;  $F1C8       $F2E7  
;;  $F1D2       $F1D0  
;;  $F1E6       $F0E4  
;;  $F1E8       $F1E6  
;;  $F1EB       $F1E9  
;;  $F219       $F217  
;;  $F240       $F41D  
;;  $F259       $F257  
;;  $F266       $F064  
;;  $F268       $F266   $F2A7  
;;  $F26D       $F06B  
;;  $F272       $F270  
;;  $F277       $F275  
;;  $F27F       $F07D  
;;  $F28B       $F289  
;;  $F29C       $F29A  
;;  $F29D       $F19B  
;;  $F2A1       $F29D  
;;  $F2B2       $F1B2  
;;  $F2B5       $F0B3  
;;  $F2BE       $F1BC  
;;  $F2CF       $F1CD  
;;  $F2D3       $F0D1  
;;  $F2DA       $F0D8  
;;  $F2E9       $F0E7  
;;  $F2F3       $F346  
;;  $F2F6       $F0F4  
;;  $F336       $F134  
;;  $F337       $F035  
;;  $F33C       $F33A  
;;  $F345       $F043  
;;  $F349       $F047  
;;  $F34C       $F24A  
;;  $F385       $F385  
;;  $F399       $F197  
;;  $F3A4       $F3E0  
;;  $F3B0       $F1AE  
;;  $F3BA       $F1B8  
;;  $F3CD       $F3CB  
;;  $F3E6       $F1E4  
;;  $F3ED       $F1EB  
;;  $F3FB       $F0F9  
;;  $F3FE       $F0CC   $F2EC  
;;  $F409       $F207  
;;  $F426       $F124  
;;  $F42A       $F328  
;;  $F42F       $F42A  
;;  $F44B       $F149  
;;  $F457       $F355  
;;  $F473       $F171  
;;  $F474       $F272   $F35A  
;;  $F48F       $F18D   $F48D  
;;  $F49A       $F298  
;;  $F4A5       $F29F  
;;  $F4A7       $F3A5  
;;  $F4B2       $F1B0   $F2AE  
;;  $F4B6       $F1B4  
;;  $F4C0       $F1BE  
;;  $F4C5       $F2BB  
;;  $F4C8       $F1C6  
;;  $F4CA       $F3C8  
;;  $F4D5       $F2CB  
;;  $F4DC       $F1DA  
;;  $F4F2       $F3F0  
;;  $F506       $F404  
;;  $F50E       $F20C  
;;  $F539       $F237  
;;  $F547       $F442  
;;  $F565       $F363  
;;  $F579       $F277  
;;  $F581       $F47F  
;;  $F58D       $F48B  
;;  $F590       $F28E  
;;  $F598       $F293  
;;  $F5A8       $F5A8  
;;  $F5AA       $F5AA  
;;  $F5B8       $F5B8  
;;  $F5BA       $F5BA  
;;  $F5C3       $F481  
;;  $F5DC       $F5DC  
;;  $F5E1       $F55B  
;;  $F652       $F530  
;;  $F723       $F421  
;;  $F777       $F485  
;;  $F933       $F931  
;;  $F980       $FBAF  
;;  $FA90       $FA8E  
;;  $FAA0       $FA9E  
;;  $FAAE       $FAAC  
;;  $FB8F       $FB8D  
;;  $FBA7       $FBA5  
;;  $FBE2       $FBF3   $FC07  
;;  $FC1F       $FC2D  
;;  $FC38       $FC4F  
;;  $FC39       $FC56  
;;  $FC49       $FC4B  
;;  $FC52       $FC40  
;;  $FC59       $FC8B  
;;  $FC67       $FC62  
;;  $FC89       $FCA5  
;;  $FC8D       $FC68  
;;  $FC9B       $FC93  
;;  $FC9C       $FC71  
;;  $FCA8       $FCCF   $FCDC  
;;  $FCD1       $FCAD  
;;  $FCD2       $FCB1  
;;  $FDBF       $FBAD  
;;  $FDC5       $FBB3  
;;  $FDD8       $FDD8  
;;  $FDFC       $FDFC  
;;  $FE20       $FE20  
;;  $FEA9       $FE9F  
;;  $FFA1       $FF9D  
;;  $FFA7       $FFA4  
;;  $FFBF       $FFB9  
;;  $FFC0       $FFBD  
;;  $FFC2       $FF83   $FF89   $FF8F   $FF95   $FFAC  
;; ======================================================================== ;;
