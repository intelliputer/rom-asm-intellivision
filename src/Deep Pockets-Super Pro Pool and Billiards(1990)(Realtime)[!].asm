
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
        DECLE   $005A           ; 500E  Cartridge year
        DECLE   $0000           ; 500F  

.TITLECODE:
        MVII    #$02F0, R6                      ; 5010   02BE 02F0
        DECLE   $01C0                           ; 5012   01C0
        DECLE   $01ED           ; 5013  Border color init

L_5014:
        MVO@    R0,     R5                      ; 5014   0268
        CMPI    #$035D, R5                      ; 5015   037D 035D
        BNEQ    L_5014                          ; 5017   022C 0004

        MVII    #$00FF, R0                      ; 5019   02B8 00FF
        MVII    #$0103, R5                      ; 501B   02BD 0103
L_501D:
        MVO@    R0,     R5                      ; 501D   0268
        CMPI    #$0112, R5                      ; 501E   037D 0112
        BLE     L_501D                          ; 5020   0226 0004

        MVII    #$0318, R2                      ; 5022   02BA 0318
        MVO     R2,     G_035B                  ; 5024   0242 035B
        MOVR    R7,     R0                      ; 5026   00B8
        ADDI    #$0130, R0                      ; 5027   02F8 0130
        NOP                                     ; 5029   0034
        MVO     R0,     .ISRVEC.0               ; 502A   0240 0100
        SWAP    R0,     1                       ; 502C   0040
        MVO     R0,     .ISRVEC.1               ; 502D   0240 0101
        NOP                                     ; 502F   0034
        SWAP    R0,     1                       ; 5030   0040
        EIS                                     ; 5031   0002
        MVII    #$0000, R0                      ; 5032   02B8 0000
        MVO     R0,     .STIC.BORD              ; 5034   0240 002C
        MVII    #$0008, R0                      ; 5036   02B8 0008
        MVO     R0,     .STIC.CS.1              ; 5038   0240 0029

        JSR     R5,     L_61A8                  ; 503A   0004 0160 01A8
        DECLE   $0004                           ; 503D   0004

        ANDR    R4,     R0                      ; 503E   01A0
        SUB@    R6,     R3                      ; 503F   0333
L_5040:
        MVII    #$0001, R0                      ; 5040   02B8 0001
        MVO     R0,     G_0102                  ; 5042   0240 0102
        MVI     G_0130, R0                      ; 5044   0280 0130
        TSTR    R0                              ; 5046   0080
        BNEQ    L_50D3                          ; 5047   020C 008A

        JSR     R5,     L_520A                  ; 5049   0004 0150 020A
        JSR     R5,     L_538B                  ; 504C   0004 0150 038B
        JSR     R5,     L_53CC                  ; 504F   0004 0150 03CC
        JSR     R5,     L_544E                  ; 5052   0004 0154 004E
        JSR     R5,     L_54CA                  ; 5055   0004 0154 00CA
        JSR     R5,     L_5F4A                  ; 5058   0004 015C 034A
        JSR     R5,     L_5FE2                  ; 505B   0004 015C 03E2

        MVI     G_0116, R0                      ; 505E   0280 0116
        TSTR    R0                              ; 5060   0080
        BEQ     L_5086                          ; 5061   0204 0023

        MVII    #$0001, R2                      ; 5063   02BA 0001
        MVI     G_0115, R0                      ; 5065   0280 0115
        MOVR    R0,     R1                      ; 5067   0081
        ANDI    #$007F, R0                      ; 5068   03B8 007F
        XORR    R0,     R1                      ; 506A   01C1
        BEQ     L_506E                          ; 506B   0204 0001

        NEGR    R2                              ; 506D   0022
L_506E:
        ADDR    R2,     R0                      ; 506E   00D0
        BPL     L_5073                          ; 506F   0203 0002

        CLRR    R1                              ; 5071   01C9
        CLRR    R0                              ; 5072   01C0
L_5073:
        CMPI    #$001B, R0                      ; 5073   0378 001B
        BLE     L_507B                          ; 5075   0206 0004

        MVII    #$001B, R0                      ; 5077   02B8 001B
        MVII    #$0080, R1                      ; 5079   02B9 0080
L_507B:
        XORR    R1,     R0                      ; 507B   01C8
        MVO     R0,     G_0115                  ; 507C   0240 0115
        ANDI    #$007F, R0                      ; 507E   03B8 007F
        ADDI    #$004B, R0                      ; 5080   02F8 004B
        SWAP    R0,     1                       ; 5082   0040
        SLR     R0,     2                       ; 5083   0064
        MVO     R0,     G_0328                  ; 5084   0240 0328

L_5086:
        JSR     R5,     L_5A00                  ; 5086   0004 0158 0200

        MVI     G_0119, R0                      ; 5089   0280 0119
        ANDI    #$0080, R0                      ; 508B   03B8 0080
        BEQ     L_50A3                          ; 508D   0204 0014

        MVI     G_015D, R0                      ; 508F   0280 015D
        ANDI    #$000F, R0                      ; 5091   03B8 000F
        CMPI    #$0003, R0                      ; 5093   0378 0003
        BGT     L_509F                          ; 5095   020E 0008

        MVII    #$021D, R4                      ; 5097   02BC 021D
        CLRR    R0                              ; 5099   01C0
        MVO@    R0,     R4                      ; 509A   0260
        MVO@    R0,     R4                      ; 509B   0260
        MVO@    R0,     R4                      ; 509C   0260
        B       L_50A3                          ; 509D   0200 0004

L_509F:
        JSR     R5,     L_5AED                  ; 509F   0004 0158 02ED
        DECLE   $021D                           ; 50A2   021D
L_50A3:
        MVI     G_011D, R0                      ; 50A3   0280 011D
        TSTR    R0                              ; 50A5   0080
        BNEQ    L_50D3                          ; 50A6   020C 002B

        MVI     G_035C, R0                      ; 50A8   0280 035C
        TSTR    R0                              ; 50AA   0080
        BNEQ    L_50D3                          ; 50AB   020C 0026

        MVII    #$015E, R4                      ; 50AD   02BC 015E
        MVII    #$016F, R5                      ; 50AF   02BD 016F
L_50B1:
        MVI@    R4,     R0                      ; 50B1   02A0
        MVI@    R5,     R1                      ; 50B2   02A9
        TSTR    R0                              ; 50B3   0080
        BEQ     L_50BA                          ; 50B4   0204 0004

        CMPI    #$00FF, R0                      ; 50B6   0378 00FF
        BNEQ    L_50D3                          ; 50B8   020C 0019

L_50BA:
        TSTR    R1                              ; 50BA   0089
        BEQ     L_50C1                          ; 50BB   0204 0004

        CMPI    #$00FF, R1                      ; 50BD   0379 00FF
        BNEQ    L_50D3                          ; 50BF   020C 0012

L_50C1:
        CMPI    #$016E, R4                      ; 50C1   037C 016E
        BLT     L_50B1                          ; 50C3   0225 0013

        MVII    #$033A, R4                      ; 50C5   02BC 033A
L_50C7:
        MVI@    R4,     R0                      ; 50C7   02A0
        ANDI    #$0008, R0                      ; 50C8   03B8 0008
        BNEQ    L_50D3                          ; 50CA   020C 0007

        CMPI    #$034A, R4                      ; 50CC   037C 034A
        BLT     L_50C7                          ; 50CE   0225 0008

        JSR     R5,     L_67C3                  ; 50D0   0004 0164 03C3

L_50D3:
        MVI     G_0130, R0                      ; 50D3   0280 0130
        CMPI    #$0003, R0                      ; 50D5   0378 0003
        BLE     L_50FB                          ; 50D7   0206 0022

        MVI     G_015D, R0                      ; 50D9   0280 015D
        ANDI    #$0007, R0                      ; 50DB   03B8 0007
        BNEQ    L_50FB                          ; 50DD   020C 001C

        MVII    #$018B, R2                      ; 50DF   02BA 018B
        MVII    #$000A, R3                      ; 50E1   02BB 000A
L_50E3:
        MVI@    R2,     R0                      ; 50E3   0290
        DECR    R0                              ; 50E4   0010
        BPL     L_50F3                          ; 50E5   0203 000C

        INCR    R2                              ; 50E7   000A
        MVI@    R2,     R0                      ; 50E8   0290
        XORI    #$0010, R0                      ; 50E9   03F8 0010
        MVO@    R0,     R2                      ; 50EB   0250
        DECR    R2                              ; 50EC   0012
        MVII    #$0005, R0                      ; 50ED   02B8 0005

        JSR     R5,     X_RAND2                 ; 50EF   0004 0114 029E

        ADDR    R3,     R0                      ; 50F2   00D8
L_50F3:
        SLR     R3,     1                       ; 50F3   0063
        MVO@    R0,     R2                      ; 50F4   0250
        ADDI    #$0002, R2                      ; 50F5   02FA 0002
        CMPI    #$018D, R2                      ; 50F7   037A 018D
        BLE     L_50E3                          ; 50F9   0226 0017

L_50FB:
        MVI     G_011D, R0                      ; 50FB   0280 011D
        TSTR    R0                              ; 50FD   0080
        BEQ     L_5119                          ; 50FE   0204 0019

        MVI     G_01AE, R1                      ; 5100   0281 01AE
        MOVR    R1,     R2                      ; 5102   008A
        ADDI    #$0183, R1                      ; 5103   02F9 0183
        MVI@    R1,     R0                      ; 5105   0288
        CMPI    #$0002, R0                      ; 5106   0378 0002
        BLT     L_5119                          ; 5108   0205 000F

        MVI     G_015D, R0                      ; 510A   0280 015D
        ANDI    #$000F, R0                      ; 510C   03B8 000F
        BNEQ    L_5119                          ; 510E   020C 0009

        SDBD                                    ; 5110   0001
        ADDI    #$5D14, R2                      ; 5111   02FA 0014 005D
        MVI     .BTAB.DC,R0                     ; 5114   0280 02DC
        XOR@    R2,     R0                      ; 5116   03D0
        MVO     R0,     .BTAB.DC                ; 5117   0240 02DC
L_5119:
        MVI     G_015D, R0                      ; 5119   0280 015D
        DECLE   $03B8,  $0001,  $020C,  $0015   ; 511B   03B8 0001 020C 0015

        MVI     G_01B5, R4                      ; 511F   0284 01B5
        ANDI    #$0018, R4                      ; 5121   03BC 0018
        SUBI    #$0008, R4                      ; 5123   033C 0008
        BPL     L_5129                          ; 5125   0203 0002

        MVII    #$0010, R4                      ; 5127   02BC 0010
L_5129:
        MVI     G_0339, R0                      ; 5129   0280 0339
        ANDI    #$003F, R0                      ; 512B   03B8 003F
        CMPI    #$001F, R0                      ; 512D   0378 001F
        BGT     L_5132                          ; 512F   020E 0001

        INCR    R4                              ; 5131   000C
L_5132:
        MVO     R4,     G_01B5                  ; 5132   0244 01B5
        DECLE   $0004                           ; 5134   0004

        ANDR    R3,     R0                      ; 5135   0198
        ADDR    R0,     R2                      ; 5136   00C2

        JSR     R5,     L_609D                  ; 5137   0004 0160 009D

        MVII    #$0001, R0                      ; 513A   02B8 0001

        JSR     R5,     X_RAND1                 ; 513C   0004 0114 027D

        MVI     G_015D, R0                      ; 513F   0280 015D
        INCR    R0                              ; 5141   0008
        MVO     R0,     G_015D                  ; 5142   0240 015D

        JSR     R5,     .EXEC.AAD               ; 5144   0004 0118 02AD

        CLRR    R0                              ; 5147   01C0
        MVO     R0,     G_0134                  ; 5148   0240 0134
L_514A:
        MVI     G_0102, R0                      ; 514A   0280 0102
        TSTR    R0                              ; 514C   0080
        BNEQ    L_514A                          ; 514D   022C 0004
        B       L_5040                          ; 514F   0220 0110

        DECLE   $0098,  $0066,  $0000           ; 5151   0098 0066 0000

        SLR     R2,     2                       ; 5154   0066
        MOVR    R6,     R1                      ; 5155   00B1
        SLR     R1,     1                       ; 5156   0061
        PSHR    R5                              ; 5157   0275
        MVI     G_0102, R3                      ; 5158   0283 0102
        DECR    R3                              ; 515A   0013
        BMI     L_51D2                          ; 515B   020B 0075

        MVO     R3,     G_0102                  ; 515D   0243 0102
        MVI     G_0130, R0                      ; 515F   0280 0130
        TSTR    R0                              ; 5161   0080
        BEQ     L_5168                          ; 5162   0204 0004

        CMPI    #$0003, R0                      ; 5164   0378 0003
        BNEQ    L_51D2                          ; 5166   020C 006A

L_5168:
        MVI     G_0328, R0                      ; 5168   0280 0328
        SLL     R0,     2                       ; 516A   004C
        SWAP    R0,     1                       ; 516B   0040
        SUBI    #$0002, R0                      ; 516C   0338 0002
        ANDI    #$00FF, R0                      ; 516E   03B8 00FF
        XORI    #$0200, R0                      ; 5170   03F8 0200
        MVO     R0,     .STIC.X.0               ; 5172   0240 0000
        MVI     G_0339, R0                      ; 5174   0280 0339
        SLL     R0,     2                       ; 5176   004C
        SWAP    R0,     1                       ; 5177   0040
        DECR    R0                              ; 5178   0010
        ANDI    #$007F, R0                      ; 5179   03B8 007F
        MVO     R0,     .STIC.Y.0               ; 517B   0240 0008
        MVI     G_034A, R0                      ; 517D   0280 034A
        SDBD                                    ; 517F   0001
        ANDI    #$1077, R0                      ; 5180   03B8 0077 0010
        SDBD                                    ; 5183   0001
        XORI    #$0800, R0                      ; 5184   03F8 0000 0008
        MVO     R0,     .STIC.A.0               ; 5187   0240 0010
        MVII    #$0001, R3                      ; 5189   02BB 0001
        MVII    #$0010, R5                      ; 518B   02BD 0010
        MVI     G_035B, R2                      ; 518D   0282 035B
L_518F:
        MVI@    R2,     R0                      ; 518F   0290
        TSTR    R0                              ; 5190   0080
        BEQ     L_51BD                          ; 5191   0204 002A

        SLL     R0,     2                       ; 5193   004C
        SWAP    R0,     1                       ; 5194   0040
        SUBI    #$0002, R0                      ; 5195   0338 0002
        ANDI    #$00FF, R0                      ; 5197   03B8 00FF
        XORI    #$0200, R0                      ; 5199   03F8 0200
        MVO@    R0,     R3                      ; 519B   0258
        ADDI    #$0008, R3                      ; 519C   02FB 0008
        ADDI    #$0011, R2                      ; 519E   02FA 0011
        MVI@    R2,     R0                      ; 51A0   0290
        SLL     R0,     2                       ; 51A1   004C
        SWAP    R0,     1                       ; 51A2   0040
        DECR    R0                              ; 51A3   0010
        ANDI    #$007F, R0                      ; 51A4   03B8 007F
        MVO@    R0,     R3                      ; 51A6   0258
        ADDI    #$0008, R3                      ; 51A7   02FB 0008
        ADDI    #$0011, R2                      ; 51A9   02FA 0011
        MVI@    R2,     R0                      ; 51AB   0290
        SDBD                                    ; 51AC   0001
        ANDI    #$1077, R0                      ; 51AD   03B8 0077 0010
        SDBD                                    ; 51B0   0001
        XORI    #$0800, R0                      ; 51B1   03F8 0000 0008
        MVO@    R0,     R3                      ; 51B4   0258
        SUBI    #$0022, R2                      ; 51B5   033A 0022
        SUBI    #$000F, R3                      ; 51B7   033B 000F
        CMPI    #$0008, R3                      ; 51B9   037B 0008
        BGE     L_51C7                          ; 51BB   020D 000A

L_51BD:
        INCR    R2                              ; 51BD   000A
        CMPI    #$0327, R2                      ; 51BE   037A 0327
        BLE     L_51C4                          ; 51C0   0206 0002

        MVII    #$0318, R2                      ; 51C2   02BA 0318
L_51C4:
        DECR    R5                              ; 51C4   0015
        BNEQ    L_518F                          ; 51C5   022C 0037

L_51C7:
        MVO     R2,     G_035B                  ; 51C7   0242 035B
        CLRR    R0                              ; 51C9   01C0
L_51CA:
        CMPI    #$0008, R3                      ; 51CA   037B 0008
        BGE     L_51D2                          ; 51CC   020D 0004

        MVO@    R0,     R3                      ; 51CE   0258
        INCR    R3                              ; 51CF   000B
        B       L_51CA                          ; 51D0   0220 0007

L_51D2:
        MVI     .STIC.MODE,R0                   ; 51D2   0280 0021
        DECLE   $0240,  $0020,  $0280,  $0130   ; 51D4   0240 0020 0280 0130
        DECLE   $0080,  $0204,  $0028,  $0378   ; 51D8   0080 0204 0028 0378
        DECLE   $0001,  $0204,  $0027,  $0378   ; 51DC   0001 0204 0027 0378
        DECLE   $0007,  $0204,  $000F,  $0001   ; 51E0   0007 0204 000F 0001

        MVII    #$00E0, R1                      ; 51E4   02B9 00E0
        RSWD    R1                              ; 51E6   0039
        MVII    #$0010, R0                      ; 51E7   02B8 0010
        MVI     G_018C, R4                      ; 51E9   0284 018C
        SDBD                                    ; 51EB   0001
        ADDI    #$9601, R4                      ; 51EC   02FC 0001 0096

        JSR     R5,     .EXEC.730               ; 51EF   0004 0114 0330

        SDBD                                    ; 51F2   0001
        MVII    #$9621, R4                      ; 51F3   02BC 0021 0096
        ADD     G_018E, R4                      ; 51F6   02C4 018E
        SDBD                                    ; 51F8   0001
        MVII    #$39F0, R1                      ; 51F9   02B9 00F0 0039
        MVII    #$0010, R0                      ; 51FC   02B8 0010

        JSR     R5,     .EXEC.730               ; 51FE   0004 0114 0330

        B       L_5206                          ; 5201   0200 0003

        JSR     R5,     L_6E42                  ; 5203   0004 016C 0242
L_5206:
        JSR     R5,     L_6EFB                  ; 5206   0004 016C 02FB

L_5209:
        PULR    R7                              ; 5209   02B7

L_520A:
        PSHR    R5                              ; 520A   0275
        MVI     G_011E, R0                      ; 520B   0280 011E
        CMPI    #$0005, R0                      ; 520D   0378 0005
        BLT     L_5214                          ; 520F   0205 0003
        J       L_5579                          ; 5211   0004 0354 0179

L_5214:
        MVII    #$033A, R2                      ; 5214   02BA 033A
        MVII    #$0318, R3                      ; 5216   02BB 0318
        MVII    #$015E, R4                      ; 5218   02BC 015E
L_521A:
        MVI@    R4,     R1                      ; 521A   02A1
        XORI    #$0080, R1                      ; 521B   03F9 0080
        SUBI    #$0080, R1                      ; 521D   0339 0080
        BEQ     L_528C                          ; 521F   0204 006B

        MVI@    R3,     R0                      ; 5221   0298
        ADDR    R1,     R0                      ; 5222   00C8
        MVO@    R0,     R3                      ; 5223   0258
        SDBD                                    ; 5224   0001
        CMPI    #$0680, R0                      ; 5225   0378 0080 0006
        BC      L_5262                          ; 5228   0201 0038

        MVI     G_011D, R5                      ; 522A   0285 011D
        DECR    R5                              ; 522C   0015
        BPL     L_5251                          ; 522D   0203 0022

        MOVR    R3,     R5                      ; 522F   009D
        ADDI    #$0011, R5                      ; 5230   02FD 0011
        MVI@    R5,     R5                      ; 5232   02AD
        SDBD                                    ; 5233   0001
        CMPI    #$0940, R5                      ; 5234   037D 0040 0009
        BLE     L_523F                          ; 5237   0206 0006

        SDBD                                    ; 5239   0001
        CMPI    #$1680, R5                      ; 523A   037D 0080 0016
        BLT     L_5251                          ; 523D   0205 0012

L_523F:
        MVI@    R2,     R5                      ; 523F   0295
        SDBD                                    ; 5240   0001
        ANDI    #$FFF7, R5                      ; 5241   03BD 00F7 00FF
        XORI    #$0008, R5                      ; 5244   03FD 0008
        MVO@    R5,     R2                      ; 5246   0255
        PSHR    R4                              ; 5247   0274
        DECR    R4                              ; 5248   0014
        CLRR    R5                              ; 5249   01ED
        MVO@    R5,     R4                      ; 524A   0265
        ADDI    #$0010, R4                      ; 524B   02FC 0010
        MVO@    R5,     R4                      ; 524D   0265
        PULR    R4                              ; 524E   02B4
        B       L_528C                          ; 524F   0200 003B

L_5251:
        DECR    R4                              ; 5251   0014
        NEGR    R1                              ; 5252   0021
        MVO@    R1,     R4                      ; 5253   0261
        NEGR    R0                              ; 5254   0020
        SDBD                                    ; 5255   0001
        ADDI    #$0D00, R0                      ; 5256   02F8 0000 000D
        MVO@    R0,     R3                      ; 5259   0258

        JSR     R5,     L_5345                  ; 525A   0004 0150 0345
        JSR     R5,     L_5606                  ; 525D   0004 0154 0206

        B       L_528C                          ; 5260   0200 002A

L_5262:
        SDBD                                    ; 5262   0001
        CMPI    #$2780, R0                      ; 5263   0378 0080 0027
        BNC     L_528C                          ; 5266   0209 0024

        MVI     G_011D, R5                      ; 5268   0285 011D
        DECR    R5                              ; 526A   0015
        BPL     L_527D                          ; 526B   0203 0010

        MOVR    R3,     R5                      ; 526D   009D
        ADDI    #$0011, R5                      ; 526E   02FD 0011
        MVI@    R5,     R5                      ; 5270   02AD
        SDBD                                    ; 5271   0001
        CMPI    #$0940, R5                      ; 5272   037D 0040 0009
        BLE     L_523F                          ; 5275   0226 0037

        SDBD                                    ; 5277   0001
        CMPI    #$1680, R5                      ; 5278   037D 0080 0016
        BGE     L_523F                          ; 527B   022D 003D

L_527D:
        DECR    R4                              ; 527D   0014
        NEGR    R1                              ; 527E   0021
        MVO@    R1,     R4                      ; 527F   0261
        NEGR    R0                              ; 5280   0020
        SDBD                                    ; 5281   0001
        ADDI    #$4F00, R0                      ; 5282   02F8 0000 004F
        MVO@    R0,     R3                      ; 5285   0258

        JSR     R5,     L_5345                  ; 5286   0004 0150 0345
        JSR     R5,     L_5606                  ; 5289   0004 0154 0206

L_528C:
        INCR    R2                              ; 528C   000A
        INCR    R3                              ; 528D   000B
        CMPI    #$0329, R3                      ; 528E   037B 0329
        BNEQ    L_521A                          ; 5290   022C 0077

        MVII    #$033A, R2                      ; 5292   02BA 033A
        MVII    #$0329, R3                      ; 5294   02BB 0329
        MVII    #$016F, R4                      ; 5296   02BC 016F
        MVI@    R4,     R1                      ; 5298   02A1
        XORI    #$0080, R1                      ; 5299   03F9 0080
        SUBI    #$0080, R1                      ; 529B   0339 0080
        BEQ     L_5328                          ; 529D   0204 0089

        MVI@    R3,     R0                      ; 529F   0298
        ADDR    R1,     R0                      ; 52A0   00C8
        MVO@    R0,     R3                      ; 52A1   0258
        SDBD                                    ; 52A2   0001
        CMPI    #$0840, R0                      ; 52A3   0378 0040 0008
        BC      L_52EF                          ; 52A6   0201 0047

        MVI     G_011D, R5                      ; 52A8   0285 011D
        DECR    R5                              ; 52AA   0015
        BPL     L_52DB                          ; 52AB   0203 002E

        MOVR    R3,     R5                      ; 52AD   009D
        SUBI    #$0011, R5                      ; 52AE   033D 0011
        MVI@    R5,     R5                      ; 52B0   02AD
        SDBD                                    ; 52B1   0001
        CMPI    #$0740, R5                      ; 52B2   037D 0040 0007
        BNC     L_52C9                          ; 52B5   0209 0012

        SDBD                                    ; 52B7   0001
        CMPI    #$26C0, R5                      ; 52B8   037D 00C0 0026
        BC      L_52C9                          ; 52BB   0201 000C

        SDBD                                    ; 52BD   0001
        CMPI    #$15C0, R5                      ; 52BE   037D 00C0 0015
        BNC     L_52DB                          ; 52C1   0209 0018

        SDBD                                    ; 52C3   0001
        CMPI    #$1800, R5                      ; 52C4   037D 0000 0018
        BC      L_52DB                          ; 52C7   0201 0012

L_52C9:
        MVI@    R2,     R5                      ; 52C9   0295
        SDBD                                    ; 52CA   0001
        ANDI    #$FFF7, R5                      ; 52CB   03BD 00F7 00FF
        XORI    #$0008, R5                      ; 52CE   03FD 0008
        MVO@    R5,     R2                      ; 52D0   0255
        PSHR    R4                              ; 52D1   0274
        DECR    R4                              ; 52D2   0014
        CLRR    R5                              ; 52D3   01ED
        MVO@    R5,     R4                      ; 52D4   0265
        SUBI    #$0012, R4                      ; 52D5   033C 0012
        MVO@    R5,     R4                      ; 52D7   0265
        PULR    R4                              ; 52D8   02B4
        B       L_5328                          ; 52D9   0200 004D

L_52DB:
        DECR    R4                              ; 52DB   0014
        NEGR    R1                              ; 52DC   0021
        MVO@    R1,     R4                      ; 52DD   0261
        NEGR    R0                              ; 52DE   0020
        SDBD                                    ; 52DF   0001
        ADDI    #$1080, R0                      ; 52E0   02F8 0080 0010
        MVO@    R0,     R3                      ; 52E3   0258

        JSR     R5,     L_535B                  ; 52E4   0004 0150 035B
        JSR     R5,     L_5345                  ; 52E7   0004 0150 0345
        JSR     R5,     L_5606                  ; 52EA   0004 0154 0206

        B       L_5328                          ; 52ED   0200 0039

L_52EF:
        SDBD                                    ; 52EF   0001
        CMPI    #$17C0, R0                      ; 52F0   0378 00C0 0017
        BNC     L_5328                          ; 52F3   0209 0033

        MVI     G_011D, R5                      ; 52F5   0285 011D
        DECR    R5                              ; 52F7   0015
        BPL     L_5316                          ; 52F8   0203 001C

        MOVR    R3,     R5                      ; 52FA   009D
        SUBI    #$0011, R5                      ; 52FB   033D 0011
        MVI@    R5,     R5                      ; 52FD   02AD
        SDBD                                    ; 52FE   0001
        CMPI    #$0740, R5                      ; 52FF   037D 0040 0007
        BNC     L_52C9                          ; 5302   0229 003A

        SDBD                                    ; 5304   0001
        CMPI    #$26C0, R5                      ; 5305   037D 00C0 0026
        BC      L_52C9                          ; 5308   0221 0040

        SDBD                                    ; 530A   0001
        CMPI    #$15C0, R5                      ; 530B   037D 00C0 0015
        BNC     L_5316                          ; 530E   0209 0006

        SDBD                                    ; 5310   0001
        CMPI    #$1800, R5                      ; 5311   037D 0000 0018
        BNC     L_52C9                          ; 5314   0229 004C

L_5316:
        DECR    R4                              ; 5316   0014
        NEGR    R1                              ; 5317   0021
        MVO@    R1,     R4                      ; 5318   0261
        NEGR    R0                              ; 5319   0020
        SDBD                                    ; 531A   0001
        ADDI    #$2F80, R0                      ; 531B   02F8 0080 002F
        MVO@    R0,     R3                      ; 531E   0258

        JSR     R5,     L_535B                  ; 531F   0004 0150 035B
        JSR     R5,     L_5345                  ; 5322   0004 0150 0345
        JSR     R5,     L_5606                  ; 5325   0004 0154 0206

L_5328:
        INCR    R2                              ; 5328   000A
        DECLE   $000B,  $037B,  $033A,  $022C   ; 5329   000B 037B 033A 022C
        DECLE   $0095,  $0280,  $018A,  $0080   ; 532D   0095 0280 018A 0080
        DECLE   $020C,  $0011,  $0004,  $0198   ; 5331   020C 0011 0004 0198
        DECLE   $00D1,  $0000                   ; 5335   00D1 0000

        ADDI    #$0318, R5                      ; 5337   02FD 0318
        MVI@    R5,     R0                      ; 5339   02A8
        SDBD                                    ; 533A   0001
        CMPI    #$0F00, R0                      ; 533B   0378 0000 000F
        BLE     L_5344                          ; 533E   0206 0004

        MVII    #$0001, R0                      ; 5340   02B8 0001
        MVO     R0,     G_018A                  ; 5342   0240 018A
L_5344:
        PULR    R7                              ; 5344   02B7

L_5345:
        PSHR    R5                              ; 5345   0275
        MVI@    R2,     R1                      ; 5346   0291
        SLL     R1,     1                       ; 5347   0049
        SWAP    R1,     1                       ; 5348   0041
        ANDI    #$001F, R1                      ; 5349   03B9 001F
        BNEQ    L_5355                          ; 534B   020C 0008

        MVI     G_011B, R0                      ; 534D   0280 011B
        TSTR    R0                              ; 534F   0080
        BNEQ    L_5355                          ; 5350   020C 0003

        JSR     R5,     L_5F20                  ; 5352   0004 015C 0320

L_5355:
        ADDI    #$018B, R1                      ; 5355   02F9 018B
        MVI@    R1,     R0                      ; 5357   0288
        INCR    R0                              ; 5358   0008
        MVO@    R0,     R1                      ; 5359   0248
        PULR    R7                              ; 535A   02B7

L_535B:
        PSHR    R5                              ; 535B   0275
        MVI     G_011C, R0                      ; 535C   0280 011C
        ANDI    #$0040, R0                      ; 535E   03B8 0040
        BEQ     L_538A                          ; 5360   0204 0028

        MVI@    R2,     R0                      ; 5362   0290
        SDBD                                    ; 5363   0001
        ANDI    #$0F80, R0                      ; 5364   03B8 0080 000F
        BNEQ    L_538A                          ; 5367   020C 0021

        MVI     G_018B, R0                      ; 5369   0280 018B
        TSTR    R0                              ; 536B   0080
        BNEQ    L_538A                          ; 536C   020C 001C

        MOVR    R3,     R1                      ; 536E   0099
        SUBI    #$0011, R1                      ; 536F   0339 0011
        MVI@    R1,     R0                      ; 5371   0288
        SDBD                                    ; 5372   0001
        CMPI    #$0F00, R0                      ; 5373   0378 0000 000F
        BC      L_538A                          ; 5376   0201 0012

        MVI     G_018A, R0                      ; 5378   0280 018A
        TSTR    R0                              ; 537A   0080
        BNEQ    L_538A                          ; 537B   020C 000D

        PSHR    R4                              ; 537D   0274
        MVII    #$015E, R4                      ; 537E   02BC 015E
        MVII    #$0022, R0                      ; 5380   02B8 0022

        JSR     R5,     X_FILL_ZERO             ; 5382   0004 0114 0338

        MVII    #$0001, R0                      ; 5385   02B8 0001
        MVO     R0,     G_0182                  ; 5387   0240 0182
        PULR    R4                              ; 5389   02B4
L_538A:
        PULR    R7                              ; 538A   02B7

L_538B:
        PSHR    R5                              ; 538B   0275
        MVII    #$0318, R3                      ; 538C   02BB 0318
L_538E:
        CMPI    #$0327, R3                      ; 538E   037B 0327
        BEQ     L_53CB                          ; 5390   0204 0039

        MOVR    R3,     R2                      ; 5392   009A
L_5393:
        CMPI    #$0317, R2                      ; 5393   037A 0317
        BEQ     L_53C8                          ; 5395   0204 0031

        INCR    R2                              ; 5397   000A
        MVI@    R2,     R0                      ; 5398   0290
        DECR    R2                              ; 5399   0012
        CMP@    R2,     R0                      ; 539A   0350
        BC      L_53C8                          ; 539B   0201 002B

        PSHR    R2                              ; 539D   0272
        MOVR    R2,     R1                      ; 539E   0091
        INCR    R1                              ; 539F   0009
        MVI@    R1,     R4                      ; 53A0   028C
        MVI@    R2,     R5                      ; 53A1   0295
        MVO@    R5,     R1                      ; 53A2   024D
        MVO@    R4,     R2                      ; 53A3   0254
        ADDI    #$0011, R1                      ; 53A4   02F9 0011
        ADDI    #$0011, R2                      ; 53A6   02FA 0011
        MVI@    R1,     R4                      ; 53A8   028C
        MVI@    R2,     R5                      ; 53A9   0295
        MVO@    R5,     R1                      ; 53AA   024D
        MVO@    R4,     R2                      ; 53AB   0254
        SUBI    #$01CB, R1                      ; 53AC   0339 01CB
        SUBI    #$01CB, R2                      ; 53AE   033A 01CB
        MVI@    R1,     R4                      ; 53B0   028C
        MVI@    R2,     R5                      ; 53B1   0295
        MVO@    R5,     R1                      ; 53B2   024D
        MVO@    R4,     R2                      ; 53B3   0254
        ADDI    #$0011, R1                      ; 53B4   02F9 0011
        ADDI    #$0011, R2                      ; 53B6   02FA 0011
        MVI@    R1,     R4                      ; 53B8   028C
        MVI@    R2,     R5                      ; 53B9   0295
        MVO@    R5,     R1                      ; 53BA   024D
        MVO@    R4,     R2                      ; 53BB   0254
        ADDI    #$01CB, R1                      ; 53BC   02F9 01CB
        ADDI    #$01CB, R2                      ; 53BE   02FA 01CB
        MVI@    R1,     R4                      ; 53C0   028C
        MVI@    R2,     R5                      ; 53C1   0295
        MVO@    R5,     R1                      ; 53C2   024D
        MVO@    R4,     R2                      ; 53C3   0254
        PULR    R2                              ; 53C4   02B2
        DECR    R2                              ; 53C5   0012
        B       L_5393                          ; 53C6   0220 0034

L_53C8:
        INCR    R3                              ; 53C8   000B
        B       L_538E                          ; 53C9   0220 003C
L_53CB:
        PULR    R7                              ; 53CB   02B7

L_53CC:
        PSHR    R5                              ; 53CC   0275
        MVI     G_011E, R0                      ; 53CD   0280 011E
        CMPI    #$0005, R0                      ; 53CF   0378 0005
        BLT     L_53D6                          ; 53D1   0205 0003
        J       L_5642                          ; 53D3   0004 0354 0242

L_53D6:
        MVI     G_011D, R0                      ; 53D6   0280 011D
        DECR    R0                              ; 53D8   0010
        BPL     L_5209                          ; 53D9   0223 01D1

        MVII    #$0318, R2                      ; 53DB   02BA 0318
L_53DD:
        CMPI    #$0327, R2                      ; 53DD   037A 0327
        BEQ     L_5209                          ; 53DF   0224 01D7

        MOVR    R2,     R3                      ; 53E1   0093
        INCR    R3                              ; 53E2   000B
L_53E3:
        CMPI    #$0328, R3                      ; 53E3   037B 0328
        BEQ     L_544B                          ; 53E5   0204 0064

        MVI@    R3,     R1                      ; 53E7   0299
        TSTR    R1                              ; 53E8   0089
        BEQ     L_544B                          ; 53E9   0204 0060

        SUB@    R2,     R1                      ; 53EB   0311
        CMPI    #$0100, R1                      ; 53EC   0379 0100
        BC      L_544B                          ; 53EE   0201 005B

        PSHR    R3                              ; 53F0   0273
        PSHR    R2                              ; 53F1   0272
        ADDI    #$0011, R2                      ; 53F2   02FA 0011
        ADDI    #$0011, R3                      ; 53F4   02FB 0011
        MVI@    R3,     R0                      ; 53F6   0298
        SUB@    R2,     R0                      ; 53F7   0310
        ADDI    #$0100, R0                      ; 53F8   02F8 0100
        PULR    R2                              ; 53FA   02B2
        PULR    R3                              ; 53FB   02B3
        CMPI    #$0200, R0                      ; 53FC   0378 0200
        BC      L_5448                          ; 53FE   0201 0048

        SUBI    #$0100, R0                      ; 5400   0338 0100

        JSR     R5,     L_56B1                  ; 5402   0004 0154 02B1

        MVI     G_0359, R5                      ; 5405   0285 0359
        TSTR    R5                              ; 5407   00AD
        BEQ     L_5448                          ; 5408   0204 003E

        MVI     G_0189, R5                      ; 540A   0285 0189
        TSTR    R5                              ; 540C   00AD
        BNEQ    L_5448                          ; 540D   020C 0039

        SDBD                                    ; 540F   0001
        MVII    #$0780, R4                      ; 5410   02BC 0080 0007
        MOVR    R2,     R5                      ; 5413   0095
        ADDI    #$0022, R5                      ; 5414   02FD 0022
        MVI@    R5,     R0                      ; 5416   02A8
        MOVR    R3,     R5                      ; 5417   009D
        ADDI    #$0022, R5                      ; 5418   02FD 0022
        MVI@    R5,     R1                      ; 541A   02A9
        ANDR    R4,     R0                      ; 541B   01A0
        ANDR    R4,     R1                      ; 541C   01A1
        BEQ     L_5423                          ; 541D   0204 0004

        TSTR    R0                              ; 541F   0080
        BNEQ    L_5448                          ; 5420   020C 0026

        MOVR    R1,     R0                      ; 5422   0088
L_5423:
        SLL     R0,     1                       ; 5423   0048
        SWAP    R0,     1                       ; 5424   0040
        MVO     R0,     G_0189                  ; 5425   0240 0189
        CLRR    R5                              ; 5427   01ED
        MVO     R5,     G_018B                  ; 5428   0245 018B

        JSR     R5,     L_5F44                  ; 542A   0004 015C 0344
        DECLE   $0004                           ; 542D   0004

        ANDR    R3,     R0                      ; 542E   0198
        ADDR    R2,     R2                      ; 542F   00D2
        ADDI    #$0318, R5                      ; 5430   02FD 0318
        MVI@    R5,     R0                      ; 5432   02A8
        SDBD                                    ; 5433   0001
        CMPI    #$0F00, R0                      ; 5434   0378 0000 000F
        BGT     L_5448                          ; 5437   020E 000F

        MVI     G_018A, R0                      ; 5439   0280 018A
        TSTR    R0                              ; 543B   0080
        BNEQ    L_5448                          ; 543C   020C 000A

        MVI     G_011C, R5                      ; 543E   0285 011C
        ANDI    #$0040, R5                      ; 5440   03BD 0040
        BEQ     L_5448                          ; 5442   0204 0004

        MVII    #$0001, R0                      ; 5444   02B8 0001
        MVO     R0,     G_0182                  ; 5446   0240 0182
L_5448:
        INCR    R3                              ; 5448   000B
        B       L_53E3                          ; 5449   0220 0067

L_544B:
        INCR    R2                              ; 544B   000A
        B       L_53DD                          ; 544C   0220 0070

L_544E:
        PSHR    R5                              ; 544E   0275
        DECLE   $0280,  $015D,  $03B8,  $0010   ; 544F   0280 015D 03B8 0010
        DECLE   $0224,  $024B,  $0280,  $015D   ; 5453   0224 024B 0280 015D
        DECLE   $03B8,  $000F,  $0004           ; 5457   03B8 000F 0004

        ANDR    R3,     R0                      ; 545A   0198
        ADDR    R2,     R2                      ; 545B   00D2
        MOVR    R5,     R3                      ; 545C   00AB
        ADDI    #$015E, R3                      ; 545D   02FB 015E
        MVI@    R3,     R0                      ; 545F   0298
        XORI    #$0080, R0                      ; 5460   03F8 0080
        SUBI    #$0080, R0                      ; 5462   0338 0080
        ADDI    #$0011, R3                      ; 5464   02FB 0011
        MVI@    R3,     R4                      ; 5466   029C
        SUBI    #$0011, R3                      ; 5467   033B 0011
        XORI    #$0080, R4                      ; 5469   03FC 0080
        SUBI    #$0080, R4                      ; 546B   033C 0080

        JSR     R5,     X_SQUARE                ; 546D   0004 011C 01DB

        PSHR    R2                              ; 5470   0272
        MOVR    R4,     R0                      ; 5471   00A0

        JSR     R5,     X_SQUARE                ; 5472   0004 011C 01DB

        ADD@    R6,     R2                      ; 5475   02F2
        CMPI    #$000A, R2                      ; 5476   037A 000A
        BGT     L_5480                          ; 5478   020E 0006

        CLRR    R0                              ; 547A   01C0
        MVO@    R0,     R3                      ; 547B   0258
        ADDI    #$0011, R3                      ; 547C   02FB 0011
        MVO@    R0,     R3                      ; 547E   0258
        PULR    R7                              ; 547F   02B7

L_5480:
        MOVR    R2,     R1                      ; 5480   0091

        JSR     R5,     X_SQRT                  ; 5481   0004 011C 0223

        MOVR    R2,     R4                      ; 5484   0094
        MVI@    R3,     R0                      ; 5485   0298
        XORI    #$0080, R0                      ; 5486   03F8 0080
        SUBI    #$0080, R0                      ; 5488   0338 0080
        MVII    #$0008, R1                      ; 548A   02B9 0008

        JSR     R5,     X_MPY                   ; 548C   0004 011C 01DC

        MOVR    R2,     R1                      ; 548F   0091
        MOVR    R4,     R2                      ; 5490   00A2

        JSR     R5,     X_DIVR                  ; 5491   0004 011C 01F8

        MVI@    R3,     R1                      ; 5494   0299
        XORI    #$0080, R1                      ; 5495   03F9 0080
        SUBI    #$0080, R1                      ; 5497   0339 0080
        GSWD    R2                              ; 5499   0032
        ANDI    #$0080, R2                      ; 549A   03BA 0080
        PSHR    R2                              ; 549C   0272
        SUBR    R0,     R1                      ; 549D   0101
        GSWD    R2                              ; 549E   0032
        ANDI    #$0080, R2                      ; 549F   03BA 0080
        CMP@    R6,     R2                      ; 54A1   0372
        BEQ     L_54A5                          ; 54A2   0204 0001

        CLRR    R1                              ; 54A4   01C9
L_54A5:
        MVO@    R1,     R3                      ; 54A5   0259
        ADDI    #$0011, R3                      ; 54A6   02FB 0011
        MVI@    R3,     R0                      ; 54A8   0298
        XORI    #$0080, R0                      ; 54A9   03F8 0080
        SUBI    #$0080, R0                      ; 54AB   0338 0080
        MVII    #$0008, R1                      ; 54AD   02B9 0008

        JSR     R5,     X_MPY                   ; 54AF   0004 011C 01DC

        MOVR    R2,     R1                      ; 54B2   0091
        MOVR    R4,     R2                      ; 54B3   00A2

        JSR     R5,     X_DIVR                  ; 54B4   0004 011C 01F8

        MVI@    R3,     R1                      ; 54B7   0299
        XORI    #$0080, R1                      ; 54B8   03F9 0080
        SUBI    #$0080, R1                      ; 54BA   0339 0080
        GSWD    R2                              ; 54BC   0032
        ANDI    #$0080, R2                      ; 54BD   03BA 0080
        PSHR    R2                              ; 54BF   0272
        SUBR    R0,     R1                      ; 54C0   0101
        GSWD    R2                              ; 54C1   0032
        ANDI    #$0080, R2                      ; 54C2   03BA 0080
        CMP@    R6,     R2                      ; 54C4   0372
        BEQ     L_54C8                          ; 54C5   0204 0001

        CLRR    R1                              ; 54C7   01C9
L_54C8:
        MVO@    R1,     R3                      ; 54C8   0259
        PULR    R7                              ; 54C9   02B7

L_54CA:
        PSHR    R5                              ; 54CA   0275
        MVI     G_015D, R0                      ; 54CB   0280 015D
        ANDI    #$0003, R0                      ; 54CD   03B8 0003
        BNEQ    L_5209                          ; 54CF   022C 02C7

        MVI     G_011D, R0                      ; 54D1   0280 011D
        DECR    R0                              ; 54D3   0010
        BPL     L_5209                          ; 54D4   0223 02CC

        CLRR    R0                              ; 54D6   01C0
L_54D7:
        MOVR    R0,     R2                      ; 54D7   0082
        ADDI    #$033A, R2                      ; 54D8   02FA 033A
        MVI@    R2,     R1                      ; 54DA   0291
        ANDI    #$0008, R1                      ; 54DB   03B9 0008
        BEQ     L_5567                          ; 54DD   0204 0088

        MVI@    R2,     R1                      ; 54DF   0291
        SDBD                                    ; 54E0   0001
        ADDI    #$2000, R1                      ; 54E1   02F9 0000 0020
        MVO@    R1,     R2                      ; 54E4   0251
        SWAP    R1,     1                       ; 54E5   0041
        SLL     R1,     2                       ; 54E6   004D
        SLL     R1,     1                       ; 54E7   0049
        SWAP    R1,     1                       ; 54E8   0041
        ANDI    #$0007, R1                      ; 54E9   03B9 0007
        DECR    R1                              ; 54EB   0011
        INCR    R1                              ; 54EC   0009
        ADDR    R7,     R1                      ; 54ED   00F9
        ADD@    R1,     R7                      ; 54EE   02CF

        DECLE   $0004                           ; 54EF   0004

        SWAP    R0,     2                       ; 54F0   0044
        SLLC    R2,     1                       ; 54F1   005A
        SLR     R0,     2                       ; 54F2   0064
        CLRR    R4                              ; 54F3   01E4
        MVII    #$0329, R3                      ; 54F4   02BB 0329
        ADDR    R0,     R3                      ; 54F6   00C3
        MVI@    R3,     R1                      ; 54F7   0299
        SDBD                                    ; 54F8   0001
        CMPI    #$0C80, R1                      ; 54F9   0379 0080 000C
        BNC     L_5500                          ; 54FC   0209 0002

        ADDI    #$0003, R4                      ; 54FE   02FC 0003
L_5500:
        MVII    #$0318, R2                      ; 5500   02BA 0318
        ADDR    R0,     R2                      ; 5502   00C2
        MVI@    R2,     R1                      ; 5503   0291
        SDBD                                    ; 5504   0001
        CMPI    #$1380, R1                      ; 5505   0379 0080 0013
        BNC     L_5512                          ; 5508   0209 0008

        INCR    R4                              ; 550A   000C
        SDBD                                    ; 550B   0001
        CMPI    #$1880, R1                      ; 550C   0379 0080 0018
        BNC     L_5512                          ; 550F   0209 0001

        INCR    R4                              ; 5511   000C
L_5512:
        PSHR    R4                              ; 5512   0274
        ADDR    R4,     R4                      ; 5513   00E4
        ADDR    R7,     R4                      ; 5514   00FC
        ADDI    #$0058, R4                      ; 5515   02FC 0058
        MVI@    R4,     R1                      ; 5517   02A1
        SWAP    R1,     1                       ; 5518   0041
        SLR     R1,     2                       ; 5519   0065
        MVO@    R1,     R2                      ; 551A   0251
        MVI@    R4,     R1                      ; 551B   02A1
        SWAP    R1,     1                       ; 551C   0041
        SLR     R1,     2                       ; 551D   0065
        MVO@    R1,     R3                      ; 551E   0259
        PULR    R4                              ; 551F   02B4
        ADDI    #$0022, R2                      ; 5520   02FA 0022
        MVI@    R2,     R2                      ; 5522   0292
        SLL     R2,     1                       ; 5523   004A
        SWAP    R2,     1                       ; 5524   0042
        ANDI    #$001F, R2                      ; 5525   03BA 001F
        ADDI    #$0120, R2                      ; 5527   02FA 0120
        MVO@    R4,     R2                      ; 5529   0254
        PSHR    R0                              ; 552A   0270

        JSR     R5,     L_6FA0                  ; 552B   0004 016C 03A0
        BIDECLE $A2CE                           ; 552E   00CE 00A2

        PULR    R0                              ; 5530   02B0
        B       L_5567                          ; 5531   0200 0034

        MVII    #$0030, R5                      ; 5533   02BD 0030
        MVI@    R2,     R1                      ; 5535   0291
        MOVR    R1,     R3                      ; 5536   008B
        SDBD                                    ; 5537   0001
        ANDI    #$FF8F, R3                      ; 5538   03BB 008F 00FF
        SLL     R1,     1                       ; 553B   0049
        SWAP    R1,     1                       ; 553C   0041
        ANDI    #$001F, R1                      ; 553D   03B9 001F
        CMPI    #$0008, R1                      ; 553F   0379 0008
        BLE     L_5545                          ; 5541   0206 0002

        MVII    #$0050, R5                      ; 5543   02BD 0050
L_5545:
        XORR    R5,     R3                      ; 5545   01EB
        MVO@    R3,     R2                      ; 5546   0253
        B       L_5567                          ; 5547   0200 001E

        MVI@    R2,     R1                      ; 5549   0291
        SDBD                                    ; 554A   0001
        ANDI    #$FF8F, R1                      ; 554B   03B9 008F 00FF
L_554E:
        XORI    #$0040, R1                      ; 554E   03F9 0040
        MVO@    R1,     R2                      ; 5550   0251
        B       L_5567                          ; 5551   0200 0014

        DECLE   $0004                           ; 5553   0004

        ANDR    R3,     R0                      ; 5554   0198
        ADDR    R5,     R6                      ; 5555   00EE
        MVI@    R2,     R5                      ; 5556   0295
        SDBD                                    ; 5557   0001
        ANDI    #$FFF7, R5                      ; 5558   03BD 00F7 00FF
        MVO@    R5,     R2                      ; 555B   0255
        PSHR    R0                              ; 555C   0270
        MOVR    R5,     R0                      ; 555D   00A8
        SLL     R0,     1                       ; 555E   0048
        SWAP    R0,     1                       ; 555F   0040
L_5560:
        ANDI    #$001F, R0                      ; 5560   03B8 001F
        DECLE   $0004                           ; 5562   0004

        ANDR    R4,     R4                      ; 5563   01A4
        PULR    R4                              ; 5564   02B4
        ANDR    R3,     R4                      ; 5565   019C
        PULR    R0                              ; 5566   02B0
L_5567:
        INCR    R0                              ; 5567   0008
        CMPI    #$0010, R0                      ; 5568   0378 0010
        BLT     L_54D7                          ; 556A   0225 0094
        PULR    R7                              ; 556C   02B7

        DECLE   $0018,  $001F,  $005C,  $001E   ; 556D   0018 001F 005C 001E
        DECLE   $00A0,  $001F                   ; 5571   00A0 001F

        COMR    R0                              ; 5573   0018
        SLR     R0,     1                       ; 5574   0060
        SLLC    R0,     2                       ; 5575   005C
        SLR     R1,     1                       ; 5576   0061
        MOVR    R4,     R0                      ; 5577   00A0
        SLR     R0,     1                       ; 5578   0060
L_5579:
        MVII    #$033A, R2                      ; 5579   02BA 033A
        MVII    #$0318, R3                      ; 557B   02BB 0318
        MVII    #$015E, R4                      ; 557D   02BC 015E
L_557F:
        MVI@    R4,     R1                      ; 557F   02A1
        XORI    #$0080, R1                      ; 5580   03F9 0080
        SUBI    #$0080, R1                      ; 5582   0339 0080
        BEQ     L_55B9                          ; 5584   0204 0033

        MVI@    R3,     R0                      ; 5586   0298
        ADDR    R1,     R0                      ; 5587   00C8
        MVO@    R0,     R3                      ; 5588   0258
        SDBD                                    ; 5589   0001
        CMPI    #$0680, R0                      ; 558A   0378 0080 0006
        BC      L_55A2                          ; 558D   0201 0013

        DECR    R4                              ; 558F   0014
        NEGR    R1                              ; 5590   0021
        MVO@    R1,     R4                      ; 5591   0261
        NEGR    R0                              ; 5592   0020
        SDBD                                    ; 5593   0001
        ADDI    #$0D00, R0                      ; 5594   02F8 0000 000D
        MVO@    R0,     R3                      ; 5597   0258
        MVII    #$0006, R0                      ; 5598   02B8 0006

        JSR     R5,     L_5619                  ; 559A   0004 0154 0219
        JSR     R5,     L_5606                  ; 559D   0004 0154 0206

        B       L_55B9                          ; 55A0   0200 0017

L_55A2:
        SDBD                                    ; 55A2   0001
        CMPI    #$2780, R0                      ; 55A3   0378 0080 0027
        BNC     L_55B9                          ; 55A6   0209 0011

        DECR    R4                              ; 55A8   0014
        NEGR    R1                              ; 55A9   0021
        MVO@    R1,     R4                      ; 55AA   0261
        NEGR    R0                              ; 55AB   0020
        SDBD                                    ; 55AC   0001
        ADDI    #$4F00, R0                      ; 55AD   02F8 0000 004F
        MVO@    R0,     R3                      ; 55B0   0258
        MVII    #$0007, R0                      ; 55B1   02B8 0007

        JSR     R5,     L_5619                  ; 55B3   0004 0154 0219
        JSR     R5,     L_5606                  ; 55B6   0004 0154 0206

L_55B9:
        INCR    R2                              ; 55B9   000A
        INCR    R3                              ; 55BA   000B
        CMPI    #$0329, R3                      ; 55BB   037B 0329
        BNEQ    L_557F                          ; 55BD   022C 003F

        MVII    #$033A, R2                      ; 55BF   02BA 033A
        MVII    #$0329, R3                      ; 55C1   02BB 0329
        MVII    #$016F, R4                      ; 55C3   02BC 016F
L_55C5:
        MVI@    R4,     R1                      ; 55C5   02A1
        XORI    #$0080, R1                      ; 55C6   03F9 0080
        SUBI    #$0080, R1                      ; 55C8   0339 0080
        BEQ     L_55FF                          ; 55CA   0204 0033

        MVI@    R3,     R0                      ; 55CC   0298
        ADDR    R1,     R0                      ; 55CD   00C8
        MVO@    R0,     R3                      ; 55CE   0258
        SDBD                                    ; 55CF   0001
        CMPI    #$0840, R0                      ; 55D0   0378 0040 0008
        BC      L_55E8                          ; 55D3   0201 0013

        DECR    R4                              ; 55D5   0014
        NEGR    R1                              ; 55D6   0021
        MVO@    R1,     R4                      ; 55D7   0261
        NEGR    R0                              ; 55D8   0020
        SDBD                                    ; 55D9   0001
        ADDI    #$1080, R0                      ; 55DA   02F8 0080 0010
        MVO@    R0,     R3                      ; 55DD   0258
        MVII    #$0004, R0                      ; 55DE   02B8 0004

        JSR     R5,     L_5619                  ; 55E0   0004 0154 0219
        JSR     R5,     L_5606                  ; 55E3   0004 0154 0206

        B       L_55FF                          ; 55E6   0200 0017

L_55E8:
        SDBD                                    ; 55E8   0001
        CMPI    #$17C0, R0                      ; 55E9   0378 00C0 0017
        BNC     L_55FF                          ; 55EC   0209 0011

        DECR    R4                              ; 55EE   0014
        NEGR    R1                              ; 55EF   0021
        MVO@    R1,     R4                      ; 55F0   0261
        NEGR    R0                              ; 55F1   0020
        SDBD                                    ; 55F2   0001
        ADDI    #$2F80, R0                      ; 55F3   02F8 0080 002F
        MVO@    R0,     R3                      ; 55F6   0258
        MVII    #$0005, R0                      ; 55F7   02B8 0005

        JSR     R5,     L_5619                  ; 55F9   0004 0154 0219
        JSR     R5,     L_5606                  ; 55FC   0004 0154 0206

L_55FF:
        INCR    R2                              ; 55FF   000A
        INCR    R3                              ; 5600   000B
        CMPI    #$033A, R3                      ; 5601   037B 033A
        BNEQ    L_55C5                          ; 5603   022C 003F
        PULR    R7                              ; 5605   02B7

L_5606:
        PSHR    R5                              ; 5606   0275
        PSHR    R2                              ; 5607   0272
        NOP                                     ; 5608   0034
        PSHR    R3                              ; 5609   0273
        PSHR    R4                              ; 560A   0274
        MVI     G_011B, R2                      ; 560B   0282 011B
        TSTR    R2                              ; 560D   0092
        BNEQ    L_5615                          ; 560E   020C 0005

        JSR     R5,     L_6FA0                  ; 5610   0004 016C 03A0
        BIDECLE $A2DC                           ; 5613   00DC 00A2
L_5615:
        PULR    R4                              ; 5615   02B4
        PULR    R3                              ; 5616   02B3
        PULR    R2                              ; 5617   02B2
        PULR    R7                              ; 5618   02B7

L_5619:
        PSHR    R5                              ; 5619   0275
        DECLE   $0271,  $0004                   ; 561A   0271 0004

        ANDR    R3,     R0                      ; 561C   0198
        XORR    R1,     R2                      ; 561D   01CA
        ADDI    #$033A, R5                      ; 561E   02FD 033A
        CMPR    R2,     R5                      ; 5620   0155
        BNEQ    L_5629                          ; 5621   020C 0006

        JSR     R5,     L_562B                  ; 5623   0004 0154 022B
        JSR     R5,     L_5F20                  ; 5626   0004 015C 0320

L_5629:
        PULR    R1                              ; 5629   02B1
        PULR    R7                              ; 562A   02B7

L_562B:
        PSHR    R5                              ; 562B   0275
L_562C:
        MVII    #$019C, R5                      ; 562C   02BD 019C
L_562E:
        MVI@    R5,     R1                      ; 562E   02A9
        CMPI    #$00FF, R1                      ; 562F   0379 00FF
        BNEQ    L_562E                          ; 5631   022C 0004

L_5633:
        DECR    R5                              ; 5633   0015
        CMPI    #$019C, R5                      ; 5634   037D 019C
        BEQ     L_5640                          ; 5636   0204 0008

        CMPI    #$0003, R0                      ; 5638   0378 0003
        BGT     L_5640                          ; 563A   020E 0004

        DECR    R5                              ; 563C   0015
        CMP@    R5,     R0                      ; 563D   0368
        BEQ     L_5641                          ; 563E   0204 0001

L_5640:
        MVO@    R0,     R5                      ; 5640   0268
L_5641:
        PULR    R7                              ; 5641   02B7

L_5642:
        MVI     G_011D, R0                      ; 5642   0280 011D
        DECR    R0                              ; 5644   0010
        BPL     L_5697                          ; 5645   0203 0050

        MVII    #$0318, R2                      ; 5647   02BA 0318
L_5649:
        CMPI    #$0327, R2                      ; 5649   037A 0327
        BEQ     L_5696                          ; 564B   0204 0049

        MOVR    R2,     R3                      ; 564D   0093
        INCR    R3                              ; 564E   000B
L_564F:
        CMPI    #$0328, R3                      ; 564F   037B 0328
        BEQ     L_5693                          ; 5651   0204 0040

        MVI@    R3,     R1                      ; 5653   0299
        TSTR    R1                              ; 5654   0089
        BEQ     L_5693                          ; 5655   0204 003C

L_5657:
        SUB@    R2,     R1                      ; 5657   0311
        CMPI    #$0100, R1                      ; 5658   0379 0100
        BC      L_5693                          ; 565A   0201 0037

        PSHR    R3                              ; 565C   0273
        PSHR    R2                              ; 565D   0272
        ADDI    #$0011, R2                      ; 565E   02FA 0011
        ADDI    #$0011, R3                      ; 5660   02FB 0011
        MVI@    R3,     R0                      ; 5662   0298
L_5663:
        SUB@    R2,     R0                      ; 5663   0310
        ADDI    #$0100, R0                      ; 5664   02F8 0100
        PULR    R2                              ; 5666   02B2
        PULR    R3                              ; 5667   02B3
        CMPI    #$0200, R0                      ; 5668   0378 0200
        BC      L_5690                          ; 566A   0201 0024

        SUBI    #$0100, R0                      ; 566C   0338 0100

        JSR     R5,     L_56B1                  ; 566E   0004 0154 02B1
        DECLE   $0280,  $0359,  $0080,  $0204   ; 5671   0280 0359 0080 0204
        DECLE   $001A,  $0004                   ; 5675   001A 0004

        ANDR    R3,     R0                      ; 5677   0198
        XORR    R1,     R2                      ; 5678   01CA
        ADDI    #$0318, R5                      ; 5679   02FD 0318
        MOVR    R3,     R4                      ; 567B   009C
        CMPR    R2,     R5                      ; 567C   0155
        BEQ     L_5683                          ; 567D   0204 0004

        MOVR    R2,     R4                      ; 567F   0094
        CMPR    R3,     R5                      ; 5680   015D
        BNEQ    L_5690                          ; 5681   020C 000D

L_5683:
        ADDI    #$0022, R4                      ; 5683   02FC 0022
        MVI@    R4,     R0                      ; 5685   02A0
        SLL     R0,     1                       ; 5686   0048
        SWAP    R0,     1                       ; 5687   0040
        ANDI    #$001F, R0                      ; 5688   03B8 001F

        JSR     R5,     L_562B                  ; 568A   0004 0154 022B
        JSR     R5,     L_5F44                  ; 568D   0004 015C 0344

L_5690:
        INCR    R3                              ; 5690   000B
        B       L_564F                          ; 5691   0220 0043

L_5693:
        INCR    R2                              ; 5693   000A
        B       L_5649                          ; 5694   0220 004C
L_5696:
        PULR    R7                              ; 5696   02B7

L_5697:
        MVI     G_015D, R0                      ; 5697   0280 015D
        DECLE   $03B8,  $000F,  $022C,  $0097   ; 5699   03B8 000F 022C 0097
        DECLE   $0004,  $0198,  $00D1,  $000E   ; 569D   0004 0198 00D1 000E
        DECLE   $00A9,  $02F9,  $0318,  $0288   ; 56A1   00A9 02F9 0318 0288
        DECLE   $0080,  $0204,  $0005,  $00A8   ; 56A5   0080 0204 0005 00A8
        DECLE   $0004                           ; 56A9   0004

        ANDR    R3,     R0                      ; 56AA   0198
        ADDR    R5,     R6                      ; 56AB   00EE
        PULR    R7                              ; 56AC   02B7

        DECLE   $0004                           ; 56AD   0004

        ANDR    R3,     R0                      ; 56AE   0198
        XORR    R3,     R2                      ; 56AF   01DA
        PULR    R7                              ; 56B0   02B7

L_56B1:
        PSHR    R5                              ; 56B1   0275
        CLRR    R5                              ; 56B2   01ED
        MVO     R5,     G_0359                  ; 56B3   0245 0359
        MOVR    R2,     R5                      ; 56B5   0095
        SUBI    #$01BA, R5                      ; 56B6   033D 01BA
        MVI@    R5,     R4                      ; 56B8   02AC
        TSTR    R4                              ; 56B9   00A4
        BNEQ    L_56CF                          ; 56BA   020C 0013

        ADDI    #$0010, R5                      ; 56BC   02FD 0010
        MVI@    R5,     R4                      ; 56BE   02AC
        TSTR    R4                              ; 56BF   00A4
        BNEQ    L_56CF                          ; 56C0   020C 000D

        MOVR    R3,     R5                      ; 56C2   009D
        SUBI    #$01BA, R5                      ; 56C3   033D 01BA
        MVI@    R5,     R4                      ; 56C5   02AC
        TSTR    R4                              ; 56C6   00A4
        BNEQ    L_56CF                          ; 56C7   020C 0006

        ADDI    #$0010, R5                      ; 56C9   02FD 0010
        MVI@    R5,     R4                      ; 56CB   02AC
        TSTR    R4                              ; 56CC   00A4
        BEQ     L_579A                          ; 56CD   0204 00CB

L_56CF:
        SAR     R0,     2                       ; 56CF   006C
        SAR     R1,     2                       ; 56D0   006D
        NOP                                     ; 56D1   0034
        MVO     R1,     G_034D                  ; 56D2   0241 034D
        MVO     R0,     G_034E                  ; 56D4   0240 034E

        JSR     R5,     L_57B0                  ; 56D6   0004 0154 03B0

        XORR    R0,     R1                      ; 56D9   01C1
        XORR    R1,     R0                      ; 56DA   01C8
        XORR    R0,     R1                      ; 56DB   01C1

        JSR     R5,     L_57B0                  ; 56DC   0004 0154 03B0

        ADDR    R1,     R0                      ; 56DF   00C8
        SDBD                                    ; 56E0   0001
        CMPI    #$1000, R0                      ; 56E1   0378 0000 0010
        BC      L_579A                          ; 56E4   0201 00B4

        MVO     R0,     G_0359                  ; 56E6   0240 0359
        MVI     G_0134, R5                      ; 56E8   0285 0134
        TSTR    R5                              ; 56EA   00AD
        BNEQ    L_56FF                          ; 56EB   020C 0012

        MVII    #$0001, R5                      ; 56ED   02BD 0001
        MVO     R5,     G_0134                  ; 56EF   0245 0134
        PSHR    R0                              ; 56F1   0270
        PSHR    R1                              ; 56F2   0271
        NOP                                     ; 56F3   0034
        PSHR    R2                              ; 56F4   0272
        PSHR    R3                              ; 56F5   0273

        JSR     R5,     L_6FA0                  ; 56F6   0004 016C 03A0
        BIDECLE $A2B9                           ; 56F9   00B9 00A2

        PULR    R3                              ; 56FB   02B3
        PULR    R2                              ; 56FC   02B2
        PULR    R1                              ; 56FD   02B1
        PULR    R0                              ; 56FE   02B0
L_56FF:
        PSHR    R2                              ; 56FF   0272
        PSHR    R3                              ; 5700   0273
        SUBI    #$01BA, R2                      ; 5701   033A 01BA
        SUBI    #$01BA, R3                      ; 5703   033B 01BA
        MVI@    R2,     R0                      ; 5705   0290
        XORI    #$0080, R0                      ; 5706   03F8 0080
        SUBI    #$0080, R0                      ; 5708   0338 0080
        MVO     R0,     G_034F                  ; 570A   0240 034F
        MVI@    R3,     R0                      ; 570C   0298
        XORI    #$0080, R0                      ; 570D   03F8 0080
        SUBI    #$0080, R0                      ; 570F   0338 0080
        MVO     R0,     G_0351                  ; 5711   0240 0351
        ADDI    #$0011, R2                      ; 5713   02FA 0011
        ADDI    #$0011, R3                      ; 5715   02FB 0011
        MVI@    R2,     R0                      ; 5717   0290
        XORI    #$0080, R0                      ; 5718   03F8 0080
        SUBI    #$0080, R0                      ; 571A   0338 0080
        MVO     R0,     G_0350                  ; 571C   0240 0350
        MVI@    R3,     R0                      ; 571E   0298
        XORI    #$0080, R0                      ; 571F   03F8 0080
        SUBI    #$0080, R0                      ; 5721   0338 0080
        MVO     R0,     G_0352                  ; 5723   0240 0352
        MVI     G_0350, R0                      ; 5725   0280 0350
        ADD     G_0352, R0                      ; 5727   02C0 0352
        SAR     R0,     1                       ; 5729   0068
        MVO     R0,     G_0358                  ; 572A   0240 0358
        MVI     G_034F, R0                      ; 572C   0280 034F
        ADD     G_0351, R0                      ; 572E   02C0 0351
        SAR     R0,     1                       ; 5730   0068
        MVO     R0,     G_0357                  ; 5731   0240 0357
        MVI     G_034F, R0                      ; 5733   0280 034F
        SUB     G_0357, R0                      ; 5735   0300 0357
        MVO     R0,     G_034F                  ; 5737   0240 034F
        MVI     G_0350, R0                      ; 5739   0280 0350
        SUB     G_0358, R0                      ; 573B   0300 0358
        MVO     R0,     G_0350                  ; 573D   0240 0350
        MVI     G_0350, R0                      ; 573F   0280 0350
        MVI     G_034E, R1                      ; 5741   0281 034E

        JSR     R5,     L_579B                  ; 5743   0004 0154 039B

        MOVR    R0,     R2                      ; 5746   0082
        MVI     G_034F, R0                      ; 5747   0280 034F
        MVI     G_034D, R1                      ; 5749   0281 034D

        JSR     R5,     L_579B                  ; 574B   0004 0154 039B

        ADDR    R0,     R2                      ; 574E   00C2
        BMI     L_5798                          ; 574F   020B 0047

        SLL     R2,     1                       ; 5751   004A
        MVO     R2,     G_035A                  ; 5752   0242 035A
        MVI     G_0359, R0                      ; 5754   0280 0359
        MVI     G_034D, R1                      ; 5756   0281 034D

        JSR     R5,     L_57A5                  ; 5758   0004 0154 03A5

        MOVR    R0,     R1                      ; 575B   0081
        MVI     G_035A, R0                      ; 575C   0280 035A

        JSR     R5,     L_57A5                  ; 575E   0004 0154 03A5

        SUB     G_034F, R0                      ; 5761   0300 034F
        MVO     R0,     G_034F                  ; 5763   0240 034F
        MVI     G_0359, R0                      ; 5765   0280 0359
        MVI     G_034E, R1                      ; 5767   0281 034E

        JSR     R5,     L_57A5                  ; 5769   0004 0154 03A5

        MOVR    R0,     R1                      ; 576C   0081
        MVI     G_035A, R0                      ; 576D   0280 035A

        JSR     R5,     L_57A5                  ; 576F   0004 0154 03A5

        SUB     G_0350, R0                      ; 5772   0300 0350
        MVO     R0,     G_0350                  ; 5774   0240 0350
        PULR    R3                              ; 5776   02B3
        PULR    R2                              ; 5777   02B2
        PSHR    R2                              ; 5778   0272
        PSHR    R3                              ; 5779   0273
        SUBI    #$01BA, R2                      ; 577A   033A 01BA
        SUBI    #$01BA, R3                      ; 577C   033B 01BA
        MVI     G_034F, R0                      ; 577E   0280 034F
        NEGR    R0                              ; 5780   0020
        ADD     G_0357, R0                      ; 5781   02C0 0357
        MVO@    R0,     R2                      ; 5783   0250
        MVI     G_034F, R0                      ; 5784   0280 034F
        ADD     G_0357, R0                      ; 5786   02C0 0357
L_5788:
        MVO@    R0,     R3                      ; 5788   0258
        ADDI    #$0011, R2                      ; 5789   02FA 0011
        ADDI    #$0011, R3                      ; 578B   02FB 0011
        MVI     G_0350, R0                      ; 578D   0280 0350
        NEGR    R0                              ; 578F   0020
        ADD     G_0358, R0                      ; 5790   02C0 0358
        MVO@    R0,     R2                      ; 5792   0250
        MVI     G_0350, R0                      ; 5793   0280 0350
        ADD     G_0358, R0                      ; 5795   02C0 0358
        MVO@    R0,     R3                      ; 5797   0258
L_5798:
        PULR    R3                              ; 5798   02B3
        PULR    R2                              ; 5799   02B2
L_579A:
        PULR    R7                              ; 579A   02B7

L_579B:
        PSHR    R5                              ; 579B   0275
        PSHR    R2                              ; 579C   0272
        PSHR    R1                              ; 579D   0271

        JSR     R5,     X_MPY                   ; 579E   0004 011C 01DC

        MOVR    R2,     R0                      ; 57A1   0090
        PULR    R1                              ; 57A2   02B1
        PULR    R2                              ; 57A3   02B2
        PULR    R7                              ; 57A4   02B7

L_57A5:
        PSHR    R5                              ; 57A5   0275
L_57A6:
        PSHR    R2                              ; 57A6   0272
        PSHR    R1                              ; 57A7   0271
        MOVR    R1,     R2                      ; 57A8   008A
        MOVR    R0,     R1                      ; 57A9   0081

        JSR     R5,     X_DIVR                  ; 57AA   0004 011C 01F8

        PULR    R1                              ; 57AD   02B1
        PULR    R2                              ; 57AE   02B2
        PULR    R7                              ; 57AF   02B7

L_57B0:
        PSHR    R5                              ; 57B0   0275
        PSHR    R2                              ; 57B1   0272
        PSHR    R1                              ; 57B2   0271

        JSR     R5,     X_SQUARE                ; 57B3   0004 011C 01DB

        MOVR    R2,     R0                      ; 57B6   0090
        PULR    R1                              ; 57B7   02B1
        PULR    R2                              ; 57B8   02B2
        PULR    R7                              ; 57B9   02B7

        PSHR    R5                              ; 57BA   0275
        PSHR    R2                              ; 57BB   0272
        PSHR    R1                              ; 57BC   0271
        MOVR    R0,     R1                      ; 57BD   0081

        JSR     R5,     X_SQRT                  ; 57BE   0004 011C 0223

        MOVR    R2,     R0                      ; 57C1   0090
        PULR    R1                              ; 57C2   02B1
        PULR    R2                              ; 57C3   02B2
        PULR    R7                              ; 57C4   02B7

        DECLE   $0099,  $0000,  $0000,  $0000   ; 57C5   0099 0000 0000 0000
        DECLE   $0000,  $00FF,  $00C3,  $0081   ; 57C9   0000 00FF 00C3 0081
        DECLE   $0000,  $0000,  $0081,  $00C3   ; 57CD   0000 0000 0081 00C3
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 57D1   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D5   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $003F,  $001F   ; 57D9   0000 00FF 003F 001F
        DECLE   $000F,  $0000,  $0000,  $0000   ; 57DD   000F 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FC,  $00F8   ; 57E1   0000 00FF 00FC 00F8
        DECLE   $00F0,  $00F0,  $00F8,  $00FC   ; 57E5   00F0 00F0 00F8 00FC
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 57E9   00FF 0000 0000 0000
        DECLE   $0000,  $000F,  $001F,  $003F   ; 57ED   0000 000F 001F 003F
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 57F1   00FF 0000 0000 0000
        DECLE   $0000                           ; 57F5   0000

        INCR    R0                              ; 57F6   0008
        INCR    R0                              ; 57F7   0008
        INCR    R4                              ; 57F8   000C
        INCR    R6                              ; 57F9   000E
        INCR    R7                              ; 57FA   000F
        INCR    R7                              ; 57FB   000F
L_57FC:
        INCR    R7                              ; 57FC   000F
L_57FD:
        INCR    R7                              ; 57FD   000F

L_57FE:
        DECR    R0                              ; 57FE   0010
L_57FF:
        DECR    R0                              ; 57FF   0010
        GSWD    R0                              ; 5800   0030
        RRC     R0,     1                       ; 5801   0070
        ADDR    R6,     R0                      ; 5802   00F0
        ADDR    R6,     R0                      ; 5803   00F0
        ADDR    R6,     R0                      ; 5804   00F0
        ADDR    R6,     R0                      ; 5805   00F0
        INCR    R7                              ; 5806   000F
        INCR    R7                              ; 5807   000F
L_5808:
        INCR    R7                              ; 5808   000F
L_5809:
        INCR    R7                              ; 5809   000F

L_580A:
        INCR    R6                              ; 580A   000E
L_580B:
        INCR    R4                              ; 580B   000C
L_580C:
        INCR    R0                              ; 580C   0008
        DECLE   $0008,  $00F0,  $00F0,  $00F0   ; 580D   0008 00F0 00F0 00F0
        DECLE   $00F0,  $0070,  $0030,  $0010   ; 5811   00F0 0070 0030 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5815   0010 0000 0000 0000
        DECLE   $0000,  $0003,  $0004,  $0008   ; 5819   0000 0003 0004 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 581D   0008 0000 0000 0000
        DECLE   $0000,  $00C0,  $0020,  $0010   ; 5821   0000 00C0 0020 0010
        DECLE   $0010,  $0008,  $0008,  $0004   ; 5825   0010 0008 0008 0004
        DECLE   $0003,  $0000,  $0000,  $0000   ; 5829   0003 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0020   ; 582D   0000 0010 0010 0020
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5831   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5835   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00F7,  $00FF   ; 5839   0000 00FF 00F7 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00F7   ; 583D   00FF 00FF 00FF 00F7
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5841   00FF 0000 0000 0000
        DECLE   $0000,  $00D0,  $00F0,  $00F0   ; 5845   0000 00D0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 5849   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $000B,  $000F,  $000F   ; 584D   00F0 000B 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 5851   000F 000F 000F 000F
        DECLE   $000F,  $0008,  $0000,  $0000   ; 5855   000F 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5859   0000 0000 0000 0000
        DECLE   $0000,  $0370,  $0229,  $00A4   ; 585D   0000 0370 0229 00A4
        DECLE   $0024,  $0344,  $00D1,  $00E4   ; 5861   0024 0344 00D1 00E4
        DECLE   $0344,  $00D1,  $00E4,  $0344   ; 5865   0344 00D1 00E4 0344
        DECLE   $00D1,  $00E4,  $0344,  $00D1   ; 5869   00D1 00E4 0344 00D1
        DECLE   $0004                           ; 586D   0004

        CMP     G_00D1, R4                      ; 586E   0344 00D1
        ADDR    R4,     R4                      ; 5870   00E4
        CMP     G_00D1, R4                      ; 5871   0344 00D1
        ADDR    R4,     R4                      ; 5873   00E4
        CMP     G_00D1, R4                      ; 5874   0344 00D1
        ADDR    R4,     R4                      ; 5876   00E4
        CMP     G_00D1, R4                      ; 5877   0344 00D1
        NOP                                     ; 5879   0034
        MOVR    R6,     R4                      ; 587A   00B4
        CMP@    R4,     R1                      ; 587B   0361
        SLR     R0,     2                       ; 587C   0064
        SUB@    R2,     R0                      ; 587D   0310
        SUBI    #$0074, R7                      ; 587E   033F 0074

        DECLE   $0361,  $0344,  $00A4,  $0310   ; 5880   0361 0344 00A4 0310
        DECLE   $033F,  $0344                   ; 5884   033F 0344

        MOVR    R4,     R5                      ; 5886   00A5
        CMP@    R4,     R1                      ; 5887   0361
        SUBR    R2,     R4                      ; 5888   0114
        SUB@    R2,     R0                      ; 5889   0310
        SUBI    #$0104, R7                      ; 588A   033F 0104

        CMP@    R4,     R1                      ; 588C   0361
        CMP     G_00A4, R4                      ; 588D   0344 00A4
        SUB@    R2,     R0                      ; 588F   0310
        SUBI    #$0344, R7                      ; 5890   033F 0344

        MOVR    R4,     R5                      ; 5892   00A5
        CMP@    R4,     R1                      ; 5893   0361
        SUBR    R2,     R4                      ; 5894   0114
        SUB@    R2,     R0                      ; 5895   0310
        SUB@    R6,     R2                      ; 5896   0332
        SUBR    R4,     R4                      ; 5897   0124
        SUB@    R2,     R0                      ; 5898   0310
L_5899:
        SUB@    R6,     R5                      ; 5899   0335
        SUBR    R4,     R4                      ; 589A   0124
        SUB@    R2,     R0                      ; 589B   0310
        SUB@    R6,     R2                      ; 589C   0332
        SUBR    R0,     R4                      ; 589D   0104
        CMP@    R4,     R1                      ; 589E   0361
        CMP     G_00A4, R4                      ; 589F   0344 00A4
        SUB@    R2,     R0                      ; 58A1   0310
        SUBI    #$0344, R7                      ; 58A2   033F 0344

        MOVR    R4,     R5                      ; 58A4   00A5
        CMP@    R4,     R1                      ; 58A5   0361
        SUBR    R2,     R4                      ; 58A6   0114
        SUB@    R2,     R0                      ; 58A7   0310
        SUBI    #$0104, R7                      ; 58A8   033F 0104

        DECLE   $0361,  $0084,  $0310,  $033F   ; 58AA   0361 0084 0310 033F
        DECLE   $0094                           ; 58AE   0094

        CMP@    R4,     R1                      ; 58AF   0361
        ADDR    R0,     R4                      ; 58B0   00C4
        RLC     R0,     2                       ; 58B1   0054
        CMP     G_00D0, R4                      ; 58B2   0344 00D0
        ADDR    R6,     R4                      ; 58B4   00F4
        CMP     G_00D0, R4                      ; 58B5   0344 00D0
        ADDR    R6,     R4                      ; 58B7   00F4
        CMP     G_00D0, R4                      ; 58B8   0344 00D0
        ADDR    R6,     R4                      ; 58BA   00F4
        CMP     G_00D0, R4                      ; 58BB   0344 00D0
L_58BD:
        DECR    R4                              ; 58BD   0014
        DECLE   $0344,  $00D0,  $00F4,  $0344   ; 58BE   0344 00D0 00F4 0344
        DECLE   $00D0,  $00F4,  $0344,  $00D0   ; 58C2   00D0 00F4 0344 00D0
        DECLE   $00F4,  $0344,  $00D0,  $0044   ; 58C6   00F4 0344 00D0 0044
        DECLE   $00D4,  $0300,  $0081,  $0000   ; 58CA   00D4 0300 0081 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58CE   0000 0000 0000 0000
        DECLE   $0003,  $0007,  $0007,  $0000   ; 58D2   0003 0007 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D6   0000 0000 0000 0000
        DECLE   $00C0,  $00E0,  $00E0,  $0007   ; 58DA   00C0 00E0 00E0 0007
        DECLE   $0007,  $0003,  $0000,  $0000   ; 58DE   0007 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 58E2   0000 0000 0000 00E0
        DECLE   $00E0,  $00C0,  $0000,  $0000   ; 58E6   00E0 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 58EE   0000 0000 0000 00FF
        DECLE   $00F7,  $00FF,  $00FF,  $00FF   ; 58F2   00F7 00FF 00FF 00FF
        DECLE   $00FF,  $00F7,  $00FF,  $0000   ; 58F6   00FF 00F7 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 58FA   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5902   0000 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5906   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 590A   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; 5912   0000 0000 0040 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5916   0000 0000 0000 00FF
        DECLE   $00BF,  $00FF,  $00FF,  $0000   ; 591A   00BF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 591E   0000 0000 0000 00FF
        DECLE   $00FD,  $00FF,  $00FF,  $00FF   ; 5922   00FD 00FF 00FF 00FF
        DECLE   $00FF,  $00BF,  $00FF,  $0000   ; 5926   00FF 00BF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 592A   0000 0000 0000 00FF
        DECLE   $00FF,  $00FD,  $00FF,  $0000   ; 592E   00FF 00FD 00FF 0000
        DECLE   $0000,  $0000,  $0000           ; 5932   0000 0000 0000

        INCR    R5                              ; 5935   000D
        INCR    R7                              ; 5936   000F
        INCR    R7                              ; 5937   000F
L_5938:
        INCR    R7                              ; 5938   000F
L_5939:
        INCR    R7                              ; 5939   000F
L_593A:
        INCR    R7                              ; 593A   000F
L_593B:
        INCR    R7                              ; 593B   000F
L_593C:
        INCR    R7                              ; 593C   000F

L_593D:
        MOVR    R6,     R0                      ; 593D   00B0
L_593E:
        ADDR    R6,     R0                      ; 593E   00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 593F   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $0008,  $0000   ; 5943   00F0 00F0 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5947   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0370,  $0229   ; 594B   0000 0000 0370 0229
        DECLE   $0004                           ; 594F   0004

        CMP     G_00D1, R4                      ; 5950   0344 00D1
        SUB@    R6,     R0                      ; 5952   0330
        MOVR    R2,     R4                      ; 5953   0094
        CMP     G_00D1, R4                      ; 5954   0344 00D1
        MOVR    R2,     R4                      ; 5956   0094
        CMP     G_00D1, R4                      ; 5957   0344 00D1
        MOVR    R2,     R4                      ; 5959   0094
        CMP     G_00D1, R4                      ; 595A   0344 00D1
        SWAP    R0,     2                       ; 595C   0044
        CMP     G_00D1, R4                      ; 595D   0344 00D1
        TSTR    R4                              ; 595F   00A4
        CMP     G_00D1, R4                      ; 5960   0344 00D1
        TSTR    R4                              ; 5962   00A4
        CMP     G_00D1, R4                      ; 5963   0344 00D1
        TSTR    R4                              ; 5965   00A4
        CMP     G_00D1, R4                      ; 5966   0344 00D1
        SUB@    R6,     R0                      ; 5968   0330
        DECR    R4                              ; 5969   0014
        SUB@    R2,     R0                      ; 596A   0310
        CMP     G_00A4, R4                      ; 596B   0344 00A4
        SUB@    R2,     R0                      ; 596D   0310
        SUBI    #$0344, R7                      ; 596E   033F 0344

        MOVR    R4,     R5                      ; 5970   00A5
        SUB@    R2,     R0                      ; 5971   0310
        CMP     G_00A4, R4                      ; 5972   0344 00A4
        SUB@    R2,     R0                      ; 5974   0310
        SUBI    #$0344, R7                      ; 5975   033F 0344

        MOVR    R4,     R5                      ; 5977   00A5
        SUB@    R2,     R0                      ; 5978   0310
        ADDR    R2,     R4                      ; 5979   00D4
        SUB@    R2,     R0                      ; 597A   0310
        SUBI    #$00E4, R7                      ; 597B   033F 00E4

        SUB@    R2,     R0                      ; 597D   0310
        CMP     G_00A4, R4                      ; 597E   0344 00A4
        SUB@    R2,     R0                      ; 5980   0310
        SUB@    R6,     R2                      ; 5981   0332
        SLR     R0,     2                       ; 5982   0064
        SUB@    R2,     R0                      ; 5983   0310
        SUBI    #$0344, R2                      ; 5984   033A 0344
        MOVR    R4,     R5                      ; 5986   00A5
        SUB@    R2,     R0                      ; 5987   0310
        ADDR    R2,     R4                      ; 5988   00D4
        SUB@    R2,     R0                      ; 5989   0310
        SUB@    R6,     R2                      ; 598A   0332
        MOVR    R0,     R4                      ; 598B   0084
        SUB@    R2,     R0                      ; 598C   0310
        SUB@    R6,     R1                      ; 598D   0331
        ADDR    R6,     R4                      ; 598E   00F4
        SUB@    R2,     R0                      ; 598F   0310
        SUB@    R6,     R1                      ; 5990   0331
        RRC     R0,     2                       ; 5991   0074
        SUB@    R2,     R0                      ; 5992   0310
        SUB@    R6,     R2                      ; 5993   0332
        ADDR    R4,     R4                      ; 5994   00E4
        SUB@    R2,     R0                      ; 5995   0310
        CMP     G_00A4, R4                      ; 5996   0344 00A4
        SUB@    R2,     R0                      ; 5998   0310
        SUBI    #$0344, R7                      ; 5999   033F 0344

        MOVR    R4,     R5                      ; 599B   00A5
        SUB@    R2,     R0                      ; 599C   0310
        ADDR    R2,     R4                      ; 599D   00D4
        SUB@    R2,     R0                      ; 599E   0310
        SUBI    #$00E4, R7                      ; 599F   033F 00E4

        SUB@    R2,     R0                      ; 59A1   0310
        CMP     G_00A4, R4                      ; 59A2   0344 00A4
        SUB@    R2,     R0                      ; 59A4   0310
        SUBI    #$0344, R7                      ; 59A5   033F 0344

        MOVR    R4,     R5                      ; 59A7   00A5
        SUB@    R2,     R0                      ; 59A8   0310
        NEGR    R4                              ; 59A9   0024
        CMP     G_00D0, R4                      ; 59AA   0344 00D0
        SUB@    R6,     R0                      ; 59AC   0330
        MOVR    R6,     R4                      ; 59AD   00B4
        CMP     G_00D0, R4                      ; 59AE   0344 00D0
        MOVR    R6,     R4                      ; 59B0   00B4
        CMP     G_00D0, R4                      ; 59B1   0344 00D0
        MOVR    R6,     R4                      ; 59B3   00B4
        CMP     G_00D0, R4                      ; 59B4   0344 00D0
        RLC     R0,     2                       ; 59B6   0054
        CMP     G_00D0, R4                      ; 59B7   0344 00D0
        ADDR    R0,     R4                      ; 59B9   00C4
        CMP     G_00D0, R4                      ; 59BA   0344 00D0
        ADDR    R0,     R4                      ; 59BC   00C4
        CMP     G_00D0, R4                      ; 59BD   0344 00D0
        ADDR    R0,     R4                      ; 59BF   00C4
        CMP     G_00D0, R4                      ; 59C0   0344 00D0
        SUB@    R6,     R0                      ; 59C2   0330
        NOP                                     ; 59C3   0034
        SUB     .BTAB.BC,R0                     ; 59C4   0300 02BC
        B       L_5C80                          ; 59C6   0200 02B8

        ADDR    R6,     R0                      ; 59C8   00F0
        J       X_FILL_ZERO                     ; 59C9   0004 0314 0338

L_59CC:
        PSHR    R5                              ; 59CC   0275
        MVII    #$0202, R4                      ; 59CD   02BC 0202
        MVII    #$0010, R0                      ; 59CF   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 59D1   0004 0114 0338

        MVI     G_034A, R4                      ; 59D4   0284 034A
        SDBD                                    ; 59D6   0001
        ANDI    #$1000, R4                      ; 59D7   03BC 0000 0010
        BEQ     L_59DE                          ; 59DA   0204 0002

        MVO     R5,     G_0328                  ; 59DC   0245 0328
L_59DE:
        MVII    #$0214, R4                      ; 59DE   02BC 0214
        MVII    #$0014, R0                      ; 59E0   02B8 0014
        J       .EXEC.739                       ; 59E2   0004 0314 0339

L_59E5:
        PSHR    R5                              ; 59E5   0275

        JSR     R5,     L_59CC                  ; 59E6   0004 0158 01CC

        J       .EXEC.739                       ; 59E9   0004 0314 0339

L_59EC:
        PSHR    R5                              ; 59EC   0275
        DECLE   $0001,  $02BC,  $005E,  $0058   ; 59ED   0001 02BC 005E 0058
        DECLE   $0280,  $011E,  $0378,  $0005   ; 59F1   0280 011E 0378 0005
        DECLE   $0205,  $0004,  $0001,  $02BC   ; 59F5   0205 0004 0001 02BC
        DECLE   $004D,  $0059,  $0004           ; 59F9   004D 0059 0004

        ANDR    R4,     R4                      ; 59FC   01A4
        SUBR    R0,     R0                      ; 59FD   0100
        TSTR    R0                              ; 59FE   0080
        PULR    R7                              ; 59FF   02B7

L_5A00:
        MVI     G_015D, R0                      ; 5A00   0280 015D
        ANDI    #$0007, R0                      ; 5A02   03B8 0007
        BNEQ    L_5BBE                          ; 5A04   020C 01B8

L_5A06:
        PSHR    R5                              ; 5A06   0275
        MVI     G_011F, R0                      ; 5A07   0280 011F
        MOVR    R0,     R1                      ; 5A09   0081
        ANDI    #$0080, R0                      ; 5A0A   03B8 0080
        ANDI    #$0040, R1                      ; 5A0C   03B9 0040
        BEQ     L_5A18                          ; 5A0E   0204 0008

        XORI    #$0080, R0                      ; 5A10   03F8 0080
        MVI     G_011F, R5                      ; 5A12   0285 011F
        XORI    #$0080, R5                      ; 5A14   03FD 0080
        MVO     R5,     G_011F                  ; 5A16   0245 011F
L_5A18:
        MVII    #$0004, R3                      ; 5A18   02BB 0004
        TSTR    R0                              ; 5A1A   0080
        BEQ     L_5A1F                          ; 5A1B   0204 0002

        MVII    #$0007, R3                      ; 5A1D   02BB 0007
L_5A1F:
        MVI     G_011F, R4                      ; 5A1F   0284 011F
        ANDI    #$0007, R4                      ; 5A21   03BC 0007
        PSHR    R4                              ; 5A23   0274
        ADDR    R4,     R4                      ; 5A24   00E4
        ADD@    R6,     R4                      ; 5A25   02F4
        ADDR    R7,     R4                      ; 5A26   00FC
        ADDI    #$0010, R4                      ; 5A27   02FC 0010
        MVII    #$0003, R5                      ; 5A29   02BD 0003
L_5A2B:
        MVI@    R4,     R1                      ; 5A2B   02A1
        MVI@    R1,     R0                      ; 5A2C   0288
        SDBD                                    ; 5A2D   0001
        ANDI    #$DFF8, R0                      ; 5A2E   03B8 00F8 00DF
        XORR    R3,     R0                      ; 5A31   01D8
        MVO@    R0,     R1                      ; 5A32   0248
        DECR    R5                              ; 5A33   0015
        BNEQ    L_5A2B                          ; 5A34   022C 000A
L_5A36:
        PULR    R7                              ; 5A36   02B7

        DECLE   $0229,  $022A,  $023D,  $0231   ; 5A37   0229 022A 023D 0231
        DECLE   $0232,  $0233,  $023A,  $023B   ; 5A3B   0232 0233 023A 023B

        MVO@    R7,     R1                      ; 5A3F   024F
        ADD@    R1,     R1                      ; 5A40   02C9
        ADD@    R3,     R5                      ; 5A41   02DD
        ADD@    R3,     R6                      ; 5A42   02DE
        ADD@    R4,     R5                      ; 5A43   02E5
        ADD@    R4,     R6                      ; 5A44   02E6
        ADD@    R4,     R7                      ; 5A45   02E7

        ADD@    R3,     R3                      ; 5A46   02DB
        ADD@    R5,     R6                      ; 5A47   02EE
        ADD@    R5,     R7                      ; 5A48   02EF

L_5A49:
        PSHR    R5                              ; 5A49   0275
        ADDI    #$0004, R0                      ; 5A4A   02F8 0004
        ANDI    #$000F, R0                      ; 5A4C   03B8 000F
        MVII    #$0001, R1                      ; 5A4E   02B9 0001
        CMPI    #$0008, R0                      ; 5A50   0378 0008
        BLT     L_5A55                          ; 5A52   0205 0001

        NEGR    R1                              ; 5A54   0021
L_5A55:
        MVI     G_0119, R0                      ; 5A55   0280 0119
        ANDI    #$000F, R0                      ; 5A57   03B8 000F
        MVII    #$0001, R2                      ; 5A59   02BA 0001
        MVII    #$000F, R3                      ; 5A5B   02BB 000F
        MVI     G_011E, R5                      ; 5A5D   0285 011E
        CMPI    #$0001, R5                      ; 5A5F   037D 0001
        BNEQ    L_5A67                          ; 5A61   020C 0004

        MVII    #$0009, R3                      ; 5A63   02BB 0009
        B       L_5A7A                          ; 5A65   0200 0013

L_5A67:
        CMPI    #$0000, R5                      ; 5A67   037D 0000
        BNEQ    L_5A7A                          ; 5A69   020C 000F

        MVII    #$0008, R4                      ; 5A6B   02BC 0008
        MVI     G_01AE, R5                      ; 5A6D   0285 01AE
        ADDI    #$01AF, R5                      ; 5A6F   02FD 01AF
        MVI@    R5,     R5                      ; 5A71   02AD
        DECR    R5                              ; 5A72   0015
        BMI     L_5A7A                          ; 5A73   020B 0005
        BEQ     L_5A79                          ; 5A75   0204 0002

        MOVR    R4,     R2                      ; 5A77   00A2
        INCR    R7                              ; 5A78   000F

L_5A79:
        MOVR    R4,     R3                      ; 5A79   00A3
L_5A7A:
        ADDR    R1,     R0                      ; 5A7A   00C8
        BMI     L_5A88                          ; 5A7B   020B 000B

        CMPR    R2,     R0                      ; 5A7D   0150
        BC      L_5A89                          ; 5A7E   0201 0009

        TSTR    R1                              ; 5A80   0089
        BMI     L_5A86                          ; 5A81   020B 0003

        MOVR    R2,     R0                      ; 5A83   0090
        B       L_5A89                          ; 5A84   0200 0003

L_5A86:
        CLRR    R0                              ; 5A86   01C0
        INCR    R7                              ; 5A87   000F

L_5A88:
        MOVR    R3,     R0                      ; 5A88   0098
L_5A89:
        CMPR    R3,     R0                      ; 5A89   0158
        DECLE   $0206,  $0001,  $01C0,  $0004   ; 5A8A   0206 0001 01C0 0004

        ANDR    R3,     R0                      ; 5A8E   0198
        ADDR    R2,     R2                      ; 5A8F   00D2
        ADDI    #$0318, R5                      ; 5A90   02FD 0318
        MVI@    R5,     R4                      ; 5A92   02AC
        TSTR    R4                              ; 5A93   00A4
        BNEQ    L_5A9C                          ; 5A94   020C 0006

        ADDI    #$0010, R5                      ; 5A96   02FD 0010
        MVI@    R5,     R4                      ; 5A98   02AC
        TSTR    R4                              ; 5A99   00A4
        BEQ     L_5A7A                          ; 5A9A   0224 0021

L_5A9C:
        XORI    #$0080, R0                      ; 5A9C   03F8 0080
        MVO     R0,     G_0119                  ; 5A9E   0240 0119
        INCR    R7                              ; 5AA0   000F

L_5AA1:
        PSHR    R5                              ; 5AA1   0275
L_5AA2:
        MVII    #$0001, R3                      ; 5AA2   02BB 0001
        DECLE   $009C,  $0280,  $0119,  $03B8   ; 5AA4   009C 0280 0119 03B8
        DECLE   $000F,  $0204,  $0009,  $0004   ; 5AA8   000F 0204 0009 0004
        DECLE   $0198,  $00D2,  $02FD,  $0318   ; 5AAC   0198 00D2 02FD 0318
        DECLE   $02AB,  $02FD,  $0010,  $02AC   ; 5AB0   02AB 02FD 0010 02AC
        DECLE   $033B,  $0040,  $0243,  $0328   ; 5AB4   033B 0040 0243 0328
        DECLE   $0244,  $0339,  $0001,  $02B8   ; 5AB8   0244 0339 0001 02B8
        DECLE   $0077,  $0008,  $0240,  $034A   ; 5ABC   0077 0008 0240 034A
        DECLE   $0001,  $02B9,  $00E8,  $0039   ; 5AC0   0001 02B9 00E8 0039
        DECLE   $0004                           ; 5AC4   0004

        ANDR    R3,     R0                      ; 5AC5   0198
        MOVR    R3,     R0                      ; 5AC6   0098
        MVII    #$0018, R0                      ; 5AC7   02B8 0018
        SDBD                                    ; 5AC9   0001
        MVII    #$91C0, R4                      ; 5ACA   02BC 00C0 0091
        MVI     G_0119, R2                      ; 5ACD   0282 0119
        ANDI    #$000F, R2                      ; 5ACF   03BA 000F
        BEQ     L_5AE7                          ; 5AD1   0204 0014

        DECR    R2                              ; 5AD3   0012
        SLL     R2,     2                       ; 5AD4   004E
        SLL     R2,     1                       ; 5AD5   004A
        MOVR    R2,     R4                      ; 5AD6   0094
        SDBD                                    ; 5AD7   0001
        ADDI    #$91D8, R4                      ; 5AD8   02FC 00D8 0091
        MVII    #$0008, R0                      ; 5ADB   02B8 0008

        JSR     R5,     .EXEC.730               ; 5ADD   0004 0114 0330

        MOVR    R5,     R1                      ; 5AE0   00A9
        MVII    #$0010, R0                      ; 5AE1   02B8 0010
        SDBD                                    ; 5AE3   0001
        MVII    #$9110, R4                      ; 5AE4   02BC 0010 0091

L_5AE7:
        JSR     R5,     .EXEC.730               ; 5AE7   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 5AEA   0240 0020
        PULR    R7                              ; 5AEC   02B7

L_5AED:
        MVI@    R5,     R4                      ; 5AED   02AC
        PSHR    R5                              ; 5AEE   0275
        MVI     G_0119, R5                      ; 5AEF   0285 0119
        ANDI    #$000F, R5                      ; 5AF1   03BD 000F
        ADDR    R5,     R5                      ; 5AF3   00ED
        SDBD                                    ; 5AF4   0001
        ADDI    #$9822, R5                      ; 5AF5   02FD 0022 0098
        SDBD                                    ; 5AF8   0001
        MVI@    R5,     R3                      ; 5AF9   02AB
        SDBD                                    ; 5AFA   0001
        MVII    #$09E8, R0                      ; 5AFB   02B8 00E8 0009
        XORR    R3,     R0                      ; 5AFE   01D8
        MVO@    R0,     R4                      ; 5AFF   0260
        ADDI    #$0008, R0                      ; 5B00   02F8 0008
        MVO@    R0,     R4                      ; 5B02   0260
        ADDI    #$0008, R0                      ; 5B03   02F8 0008
        MVO@    R0,     R4                      ; 5B05   0260
        PULR    R7                              ; 5B06   02B7

L_5B07:
        PSHR    R5                              ; 5B07   0275
        DECLE   $0004,  $0158,  $03A1,  $0280   ; 5B08   0004 0158 03A1 0280
        DECLE   $011E,  $0378,  $0000,  $020C   ; 5B0C   011E 0378 0000 020C
        DECLE   $002A,  $0281,  $01AE,  $02F9   ; 5B10   002A 0281 01AE 02F9
        DECLE   $01AF,  $0288,  $004C,  $004C   ; 5B14   01AF 0288 004C 004C
        DECLE   $0001,  $02F8,  $0050,  $0092   ; 5B18   0001 02F8 0050 0092
        DECLE   $0001,  $02B9,  $00D8,  $0039   ; 5B1C   0001 02B9 00D8 0039
        DECLE   $0004                           ; 5B20   0004

        ANDR    R3,     R0                      ; 5B21   0198
        MOVR    R3,     R0                      ; 5B22   0098
        MOVR    R0,     R4                      ; 5B23   0084
        MVII    #$0010, R0                      ; 5B24   02B8 0010

        JSR     R5,     .EXEC.730               ; 5B26   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 5B29   0240 0020
        MVI     G_01AE, R1                      ; 5B2B   0281 01AE
        ADDR    R7,     R1                      ; 5B2D   00F9
        ADDI    #$01E6, R1                      ; 5B2E   02F9 01E6
        MVI@    R1,     R0                      ; 5B30   0288
        SDBD                                    ; 5B31   0001
        XORI    #$09D8, R0                      ; 5B32   03F8 00D8 0009
        MVO     R0,     .BTAB.0F                ; 5B35   0240 020F
        ADDI    #$0008, R0                      ; 5B37   02F8 0008
        MVO     R0,     .BTAB.10                ; 5B39   0240 0210

        JSR     R5,     L_5B6E                  ; 5B3B   0004 0158 036E

        MVI     G_011E, R0                      ; 5B3E   0280 011E
        CMPI    #$0000, R0                      ; 5B40   0378 0000
        BEQ     L_5B5C                          ; 5B42   0204 0018

        CMPI    #$0005, R0                      ; 5B44   0378 0005
        BGE     L_5B5C                          ; 5B46   020D 0014

        MVI     G_01AE, R1                      ; 5B48   0281 01AE
        MOVR    R1,     R2                      ; 5B4A   008A
        ADDR    R7,     R1                      ; 5B4B   00F9
        ADDI    #$01C8, R1                      ; 5B4C   02F9 01C8
        ADDI    #$0183, R2                      ; 5B4E   02FA 0183
        MVI@    R2,     R2                      ; 5B50   0292
        ADDR    R7,     R2                      ; 5B51   00FA
        ADDI    #$0018, R2                      ; 5B52   02FA 0018
        MVI@    R2,     R0                      ; 5B54   0290
        SDBD                                    ; 5B55   0001
        XORI    #$0800, R0                      ; 5B56   03F8 0000 0008
        XOR@    R1,     R0                      ; 5B59   03C8
        MVO     R0,     .BTAB.DC                ; 5B5A   0240 02DC
L_5B5C:
        MVI     G_011E, R0                      ; 5B5C   0280 011E
        CMPI    #$0004, R0                      ; 5B5E   0378 0004
        BNEQ    L_5B69                          ; 5B60   020C 0007

        JSR     R5,     L_6C25                  ; 5B62   0004 016C 0025

        XORI    #$0080, R5                      ; 5B65   03FD 0080
        MVO     R5,     G_011F                  ; 5B67   0245 011F
L_5B69:
        PULR    R7                              ; 5B69   02B7

        NEGR    R0                              ; 5B6A   0020
        ANDR    R5,     R0                      ; 5B6B   01A8
        ANDR    R6,     R0                      ; 5B6C   01B0
        NEGR    R0                              ; 5B6D   0020
L_5B6E:
        PSHR    R5                              ; 5B6E   0275
        MVI     G_011E, R0                      ; 5B6F   0280 011E
        CMPI    #$0000, R0                      ; 5B71   0378 0000
        BEQ     L_5B9B                          ; 5B73   0204 0026

        CMPI    #$0001, R0                      ; 5B75   0378 0001
        BEQ     L_5B9B                          ; 5B77   0204 0022

        JSR     R5,     L_5E1E                  ; 5B79   0004 015C 021E

        MOVR    R7,     R5                      ; 5B7C   00BD
        ADDI    #$001F, R5                      ; 5B7D   02FD 001F
        MVI     G_0130, R0                      ; 5B7F   0280 0130
        TSTR    R0                              ; 5B81   0080
        BEQ     L_5B89                          ; 5B82   0204 0005

        MOVR    R7,     R5                      ; 5B84   00BD
        ADDI    #$0019, R5                      ; 5B85   02FD 0019
        ADD     G_01AE, R5                      ; 5B87   02C5 01AE
L_5B89:
        MVI@    R5,     R4                      ; 5B89   02AC
        SDBD                                    ; 5B8A   0001
        MVII    #$0962, R0                      ; 5B8B   02B8 0062 0009
        MVO@    R0,     R4                      ; 5B8E   0260
        ADDI    #$0008, R0                      ; 5B8F   02F8 0008
        MVO@    R0,     R4                      ; 5B91   0260
        MVI@    R5,     R4                      ; 5B92   02AC
        SDBD                                    ; 5B93   0001
        MVII    #$0971, R0                      ; 5B94   02B8 0071 0009
        MVO@    R0,     R4                      ; 5B97   0260
        ADDI    #$0008, R0                      ; 5B98   02F8 0008
        MVO@    R0,     R4                      ; 5B9A   0260
L_5B9B:
        PULR    R7                              ; 5B9B   02B7

        DECLE   $0200,  $0212,  $0205,  $020F   ; 5B9C   0200 0212 0205 020F
        DECLE   $0205,  $0283                   ; 5BA0   0205 0283

        ANDR    R5,     R6                      ; 5BA2   01AE
        ADDR    R7,     R3                      ; 5BA3   00FB
        ADDI    #$0170, R3                      ; 5BA4   02FB 0170
        MVI@    R3,     R3                      ; 5BA6   029B
        SDBD                                    ; 5BA7   0001
        XORI    #$0980, R3                      ; 5BA8   03FB 0080 0009
        MVII    #$023C, R1                      ; 5BAB   02B9 023C
L_5BAD:
        MVO@    R3,     R1                      ; 5BAD   024B
        ADDI    #$0008, R3                      ; 5BAE   02FB 0008
        ADDI    #$0014, R1                      ; 5BB0   02F9 0014
        CMPI    #$02A0, R1                      ; 5BB2   0379 02A0
        BLT     L_5BAD                          ; 5BB4   0225 0008

        ADDI    #$0014, R1                      ; 5BB6   02F9 0014
        MVI     G_01AE, R0                      ; 5BB8   0280 01AE
        SLL     R0,     2                       ; 5BBA   004C
        SLL     R0,     1                       ; 5BBB   0048
        ADDR    R0,     R3                      ; 5BBC   00C3
        MVO@    R3,     R1                      ; 5BBD   024B
L_5BBE:
        MOVR    R5,     R7                      ; 5BBE   00AF

L_5BBF:
        PSHR    R5                              ; 5BBF   0275

        JSR     R5,     L_5B6E                  ; 5BC0   0004 0158 036E

        MVI     G_01AE, R1                      ; 5BC3   0281 01AE
        ADDI    #$0136, R1                      ; 5BC5   02F9 0136
        MVI@    R1,     R0                      ; 5BC7   0288
        INCR    R0                              ; 5BC8   0008
        MVO@    R0,     R1                      ; 5BC9   0248
        MVI     G_01AD, R1                      ; 5BCA   0281 01AD
        TSTR    R1                              ; 5BCC   0089
        BEQ     L_5C26                          ; 5BCD   0204 0057

        CMP     G_0133, R0                      ; 5BCF   0340 0133
        BGT     L_5C5B                          ; 5BD1   020E 0088

        MVI     G_01AE, R3                      ; 5BD3   0283 01AE
        ADDR    R7,     R3                      ; 5BD5   00FB
        ADDI    #$013E, R3                      ; 5BD6   02FB 013E
        MVI@    R3,     R3                      ; 5BD8   029B
        MVII    #$02CC, R4                      ; 5BD9   02BC 02CC

        JSR     R5,     X_PRINT_R5              ; 5BDB   0004 0118 007B
        STRING  "Player"                        ; 5BDE  
        DECLE   $0000                           ; 5BE4   0000

        XORI    #$0088, R3                      ; 5BE5   03FB 0088
        MVI     G_01AE, R0                      ; 5BE7   0280 01AE
        SLL     R0,     2                       ; 5BE9   004C
        SLL     R0,     1                       ; 5BEA   0048
        ADDR    R0,     R3                      ; 5BEB   00C3
        MVO     R3,     .BTAB.D3                ; 5BEC   0243 02D3
        SDBD                                    ; 5BEE   0001
        MVII    #$959C, R4                      ; 5BEF   02BC 009C 0095

        JSR     R5,     L_5D70                  ; 5BF2   0004 015C 0170

        MVI     G_0136, R1                      ; 5BF5   0281 0136
        ADD     G_0137, R1                      ; 5BF7   02C1 0137
        ADDR    R7,     R1                      ; 5BF9   00F9
        ADDI    #$0009, R1                      ; 5BFA   02F9 0009
        ADD@    R1,     R1                      ; 5BFC   02C9
        MVII    #$02E8, R4                      ; 5BFD   02BC 02E8

        JSR     R5,     X_PRINT_R1              ; 5BFF   0004 0118 0067

        PULR    R7                              ; 5C02   02B7

        DECLE   $0000,  $0006,  $0009,  $000C   ; 5C03   0000 0006 0009 000C
        DECLE   $0011,  $0015,  $0019,  $006F   ; 5C07   0011 0015 0019 006F
        DECLE   $006E,  $0065,  $0000,  $0074   ; 5C0B   006E 0065 0000 0074
        DECLE   $0077,  $006F,  $0000,  $0074   ; 5C0F   0077 006F 0000 0074
        DECLE   $0068,  $0072,  $0065,  $0065   ; 5C13   0068 0072 0065 0065
        DECLE   $0000,  $0066,  $006F,  $0075   ; 5C17   0000 0066 006F 0075
        DECLE   $0072,  $0000,  $0066,  $0069   ; 5C1B   0072 0000 0066 0069
        DECLE   $0076,  $0065,  $0000,  $0073   ; 5C1F   0076 0065 0000 0073
        DECLE   $0069,  $0078,  $0000           ; 5C23   0069 0078 0000
L_5C26:
        MVII    #$02CD, R4                      ; 5C26   02BC 02CD
        MVII    #$0007, R3                      ; 5C28   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5C2A   0004 0118 007B
        STRING  "Game Over"                     ; 5C2D  
        DECLE   $0000                           ; 5C36   0000

        MVI     G_01AE, R3                      ; 5C37   0283 01AE
        ADDR    R7,     R3                      ; 5C39   00FB
        ADDI    #$00DA, R3                      ; 5C3A   02FB 00DA
        MVI@    R3,     R3                      ; 5C3C   029B
        MVII    #$02DF, R4                      ; 5C3D   02BC 02DF

        JSR     R5,     X_PRINT_R5              ; 5C3F   0004 0118 007B
        STRING  "Player   Wins!"                ; 5C42  
        DECLE   $0000                           ; 5C50   0000

        XORI    #$0088, R3                      ; 5C51   03FB 0088
        MVI     G_01AE, R0                      ; 5C53   0280 01AE
        SLL     R0,     2                       ; 5C55   004C
        SLL     R0,     1                       ; 5C56   0048
        ADDR    R0,     R3                      ; 5C57   00C3
        MVO     R3,     .BTAB.E6                ; 5C58   0243 02E6
        PULR    R7                              ; 5C5A   02B7

L_5C5B:
        MOVR    R7,     R4                      ; 5C5B   00BC
        ADDI    #$0051, R4                      ; 5C5C   02FC 0051

        JSR     R5,     L_5D5A                  ; 5C5E   0004 015C 015A

        MOVR    R4,     R1                      ; 5C61   00A1
        MOVR    R5,     R4                      ; 5C62   00AC
        MVI     G_0133, R0                      ; 5C63   0280 0133
        TSTR    R0                              ; 5C65   0080
        BNEQ    L_5C69                          ; 5C66   020C 0001

        INCR    R1                              ; 5C68   0009

L_5C69:
        JSR     R5,     X_PRINT_R1              ; 5C69   0004 0118 0067

        MVI     G_01AE, R3                      ; 5C6C   0283 01AE
        ADDR    R7,     R3                      ; 5C6E   00FB
        ADDI    #$00A5, R3                      ; 5C6F   02FB 00A5
        MVI@    R3,     R3                      ; 5C71   029B
        MVII    #$02C9, R4                      ; 5C72   02BC 02C9

        JSR     R5,     X_PRINT_R5              ; 5C74   0004 0118 007B
        STRING  "Player"                        ; 5C77  
        DECLE   $0000                           ; 5C7D   0000

        MVI     G_01AE, R0                      ; 5C7E   0280 01AE
L_5C80:
        SLL     R0,     2                       ; 5C80   004C
        SLL     R0,     1                       ; 5C81   0048
        ADDI    #$0088, R0                      ; 5C82   02F8 0088
        XORR    R3,     R0                      ; 5C84   01D8
        MVO     R0,     .BTAB.D0                ; 5C85   0240 02D0
        MVI     G_01AE, R1                      ; 5C87   0281 01AE
        ADDI    #$0136, R1                      ; 5C89   02F9 0136
        MVI@    R1,     R0                      ; 5C8B   0288
        SLL     R0,     2                       ; 5C8C   004C
        SLL     R0,     1                       ; 5C8D   0048
        ADDI    #$0080, R0                      ; 5C8E   02F8 0080
        XORR    R3,     R0                      ; 5C90   01D8
        MVO     R0,     .BTAB.E1                ; 5C91   0240 02E1
        MVII    #$02EB, R4                      ; 5C93   02BC 02EB
        MVI     G_0133, R0                      ; 5C95   0280 0133
        TSTR    R0                              ; 5C97   0080
        BEQ     L_5C9B                          ; 5C98   0204 0001

        INCR    R4                              ; 5C9A   000C
L_5C9B:
        MVI     G_01AE, R1                      ; 5C9B   0281 01AE
        XORI    #$0001, R1                      ; 5C9D   03F9 0001
        MOVR    R1,     R3                      ; 5C9F   008B
        ADDI    #$0136, R1                      ; 5CA0   02F9 0136
        MVI@    R1,     R0                      ; 5CA2   0288
        SLL     R0,     2                       ; 5CA3   004C
        SLL     R0,     1                       ; 5CA4   0048
        ADDI    #$0080, R0                      ; 5CA5   02F8 0080
        ADDR    R7,     R3                      ; 5CA7   00FB
        ADDI    #$006C, R3                      ; 5CA8   02FB 006C
        XOR@    R3,     R0                      ; 5CAA   03D8
        MVO@    R0,     R4                      ; 5CAB   0260
        PULR    R7                              ; 5CAC   02B7

        DECLE   $0007,  $02D2,  $0077,  $0069   ; 5CAD   0007 02D2 0077 0069
        DECLE   $006E,  $0073,  $0020,  $006D   ; 5CB1   006E 0073 0020 006D
        DECLE   $0061,  $0074,  $0063,  $0068   ; 5CB5   0061 0074 0063 0068
        DECLE   $0000,  $02E3,  $0067,  $0061   ; 5CB9   0000 02E3 0067 0061
        DECLE   $006D,  $0065,  $0002,  $0073   ; 5CBD   006D 0065 0002 0073
        DECLE   $0020,  $0074,  $006F,  $0000   ; 5CC1   0020 0074 006F 0000
L_5CC5:
        CLRR    R0                              ; 5CC5   01C0
L_5CC6:
        MVO     R0,     G_0131                  ; 5CC6   0240 0131
        PSHR    R5                              ; 5CC8   0275

        JSR     R5,     L_59E5                  ; 5CC9   0004 0158 01E5

        MVI     G_01AE, R3                      ; 5CCC   0283 01AE
        ADDR    R7,     R3                      ; 5CCE   00FB
        ADDI    #$0045, R3                      ; 5CCF   02FB 0045
        MVI@    R3,     R3                      ; 5CD1   029B
        MVII    #$0205, R4                      ; 5CD2   02BC 0205

        JSR     R5,     X_PRINT_R5              ; 5CD4   0004 0118 007B
        STRING  "Player  :"                     ; 5CD7  
        DECLE   $0000                           ; 5CE0   0000

        MVI     G_01AE, R0                      ; 5CE1   0280 01AE
        SLL     R0,     2                       ; 5CE3   004C
        SLL     R0,     1                       ; 5CE4   0048
        XORR    R3,     R0                      ; 5CE5   01D8
        ADDI    #$0088, R0                      ; 5CE6   02F8 0088
        MVO     R0,     .BTAB.0C                ; 5CE8   0240 020C
        PULR    R4                              ; 5CEA   02B4
        MVO     R4,     G_034B                  ; 5CEB   0244 034B

        JSR     R5,     L_5D5A                  ; 5CED   0004 015C 015A

        MVO     R4,     G_035C                  ; 5CF0   0244 035C
        MVII    #$0003, R0                      ; 5CF2   02B8 0003
        MVO     R0,     G_0130                  ; 5CF4   0240 0130

L_5CF6:
        JSR     R5,     L_5E04                  ; 5CF6   0004 015C 0204

        MVI     G_034B, R4                      ; 5CF9   0284 034B

        JSR     R5,     L_5D5A                  ; 5CFB   0004 015C 015A

        MVI     G_0131, R1                      ; 5CFE   0281 0131
        SLL     R1,     2                       ; 5D00   004D
        PSHR    R1                              ; 5D01   0271
        SLL     R1,     2                       ; 5D02   004D
        ADD@    R6,     R1                      ; 5D03   02F1
        ADDI    #$0214, R1                      ; 5D04   02F9 0214
        SDBD                                    ; 5D06   0001
        MVII    #$2000, R3                      ; 5D07   02BB 0000 0020
        MVI@    R1,     R0                      ; 5D0A   0288
        XORR    R3,     R0                      ; 5D0B   01D8
        MVO@    R0,     R1                      ; 5D0C   0248
        ADDI    #$0014, R1                      ; 5D0D   02F9 0014
        MVI@    R1,     R0                      ; 5D0F   0288
        XORR    R3,     R0                      ; 5D10   01D8
        MVO@    R0,     R1                      ; 5D11   0248
        B       L_5D42                          ; 5D12   0200 002E

        DECLE   $0002,  $0001                   ; 5D14   0002 0001
L_5D16:
        PSHR    R5                              ; 5D16   0275

        JSR     R5,     L_5D9F                  ; 5D17   0004 015C 019F
        DECLE   $0004                           ; 5D1A   0004

        ANDR    R3,     R0                      ; 5D1B   0198
        MOVR    R6,     R3                      ; 5D1C   00B3
        CLRR    R0                              ; 5D1D   01C0
        MVII    #$0200, R1                      ; 5D1E   02B9 0200
L_5D20:
        MVO@    R0,     R1                      ; 5D20   0248
        ADDI    #$0013, R1                      ; 5D21   02F9 0013
        MVO@    R0,     R1                      ; 5D23   0248
        INCR    R1                              ; 5D24   0009
        CMPI    #$02F0, R1                      ; 5D25   0379 02F0
        BLT     L_5D20                          ; 5D27   0225 0008

        SDBD                                    ; 5D29   0001
        MVII    #$95D0, R4                      ; 5D2A   02BC 00D0 0095

        JSR     R5,     L_5D70                  ; 5D2D   0004 015C 0170

        MVI     G_011E, R1                      ; 5D30   0281 011E
        ADDR    R7,     R1                      ; 5D32   00F9
        ADDI    #$001E, R1                      ; 5D33   02F9 001E
        MVI@    R1,     R1                      ; 5D35   0289
        SDBD                                    ; 5D36   0001
        MVII    #$2000, R0                      ; 5D37   02B8 0000 0020
        MVO@    R0,     R1                      ; 5D3A   0248
        ADDI    #$0014, R1                      ; 5D3B   02F9 0014
        CMPI    #$02F0, R1                      ; 5D3D   0379 02F0
        BGE     L_5D42                          ; 5D3F   020D 0001

        MVO@    R0,     R1                      ; 5D41   0248
L_5D42:
        SUBI    #$0014, R1                      ; 5D42   0339 0014
        MVII    #$0014, R0                      ; 5D44   02B8 0014
        MVII    #$0007, R3                      ; 5D46   02BB 0007

        JSR     R5,     L_5D93                  ; 5D48   0004 015C 0193

        MVII    #$0005, R2                      ; 5D4B   02BA 0005

        JSR     R5,     L_5DA0                  ; 5D4D   0004 015C 01A0

        PULR    R7                              ; 5D50   02B7

        DECLE   $0214,  $0228,  $023C           ; 5D51   0214 0228 023C

        MVO@    R0,     R2                      ; 5D54   0250
        MVO@    R4,     R4                      ; 5D55   0264
        MVI@    R4,     R0                      ; 5D56   02A0
        PULR    R4                              ; 5D57   02B4
        ADD@    R1,     R0                      ; 5D58   02C8
        ADD@    R3,     R4                      ; 5D59   02DC
L_5D5A:
        PSHR    R5                              ; 5D5A   0275
L_5D5B:
        MVI@    R4,     R3                      ; 5D5B   02A3
L_5D5C:
        MVI@    R4,     R5                      ; 5D5C   02A5
L_5D5D:
        MVI@    R4,     R0                      ; 5D5D   02A0
        SUBI    #$0020, R0                      ; 5D5E   0338 0020
        BMI     L_5D68                          ; 5D60   020B 0006

        SLL     R0,     2                       ; 5D62   004C
        SLL     R0,     1                       ; 5D63   0048
        XORR    R3,     R0                      ; 5D64   01D8
        MVO@    R0,     R5                      ; 5D65   0268
        B       L_5D5D                          ; 5D66   0220 000A

L_5D68:
        ADDI    #$0020, R0                      ; 5D68   02F8 0020
        BEQ     L_5D5C                          ; 5D6A   0224 000F

        DECR    R0                              ; 5D6C   0010
        BEQ     L_5D5B                          ; 5D6D   0224 0013
        PULR    R7                              ; 5D6F   02B7

L_5D70:
        PSHR    R5                              ; 5D70   0275

L_5D71:
        JSR     R5,     L_5EA0                  ; 5D71   0004 015C 02A0

        MOVR    R0,     R3                      ; 5D74   0083

L_5D75:
        JSR     R5,     L_5EA0                  ; 5D75   0004 015C 02A0

        MOVR    R0,     R1                      ; 5D78   0081
        ADDI    #$0200, R1                      ; 5D79   02F9 0200

L_5D7B:
        JSR     R5,     L_5EA0                  ; 5D7B   0004 015C 02A0

        CMPI    #$00FF, R0                      ; 5D7E   0378 00FF
        BEQ     L_5A36                          ; 5D80   0224 034B

        CMPI    #$00FE, R0                      ; 5D82   0378 00FE
        BEQ     L_5D71                          ; 5D84   0224 0014

        CMPI    #$00FD, R0                      ; 5D86   0378 00FD
        BEQ     L_5D75                          ; 5D88   0224 0014

        SUBI    #$0020, R0                      ; 5D8A   0338 0020
        SLL     R0,     2                       ; 5D8C   004C
        SLL     R0,     1                       ; 5D8D   0048
        XORR    R3,     R0                      ; 5D8E   01D8
        MVO@    R0,     R1                      ; 5D8F   0248
        INCR    R1                              ; 5D90   0009
        B       L_5D7B                          ; 5D91   0220 0017

L_5D93:
        MVI@    R1,     R2                      ; 5D93   028A
        SDBD                                    ; 5D94   0001
        ANDI    #$2BF8, R2                      ; 5D95   03BA 00F8 002B
        XORR    R3,     R2                      ; 5D98   01DA
        MVO@    R2,     R1                      ; 5D99   024A
        INCR    R1                              ; 5D9A   0009
        DECR    R0                              ; 5D9B   0010
        BNEQ    L_5D93                          ; 5D9C   022C 000A
        MOVR    R5,     R7                      ; 5D9E   00AF

L_5D9F:
        CLRR    R2                              ; 5D9F   01D2
L_5DA0:
        PSHR    R5                              ; 5DA0   0275
        DECLE   $0004                           ; 5DA1   0004

        ANDR    R3,     R0                      ; 5DA2   0198
        MOVR    R3,     R0                      ; 5DA3   0098
        MVO     R2,     .STIC.CS.1              ; 5DA4   0242 0029
        MVO     R2,     .STIC.CS.3              ; 5DA6   0242 002B
        CLRR    R2                              ; 5DA8   01D2
        MVO     R2,     .STIC.CS.0              ; 5DA9   0242 0028
        MVO     R2,     .STIC.CS.2              ; 5DAB   0242 002A
        MVO     R2,     .STIC.VIDEN             ; 5DAD   0242 0020

        JSR     R5,     L_6EFB                  ; 5DAF   0004 016C 02FB

        PULR    R7                              ; 5DB2   02B7

L_5DB3:
        MVII    #$02DC, R2                      ; 5DB3   02BA 02DC
L_5DB5:
        MVI@    R2,     R0                      ; 5DB5   0290
        SDBD                                    ; 5DB6   0001
        ANDI    #$DFFF, R0                      ; 5DB7   03B8 00FF 00DF
        MVO@    R0,     R2                      ; 5DBA   0250
        INCR    R2                              ; 5DBB   000A
        CMPI    #$02EF, R2                      ; 5DBC   037A 02EF
        BLE     L_5DB5                          ; 5DBE   0226 000A

        MVI     G_034B, R2                      ; 5DC0   0282 034B
        MVII    #$0003, R3                      ; 5DC2   02BB 0003
        MVI@    R2,     R0                      ; 5DC4   0290
        MVO     R0,     G_0185                  ; 5DC5   0240 0185
L_5DC7:
        PSHR    R0                              ; 5DC7   0270
        MVI     G_034B, R2                      ; 5DC8   0282 034B
        ADDR    R0,     R2                      ; 5DCA   00C2
        MVI@    R2,     R4                      ; 5DCB   0294
        ADD     G_0185, R2                      ; 5DCC   02C2 0185
        MVI@    R2,     R0                      ; 5DCE   0290
        MVII    #$0002, R1                      ; 5DCF   02B9 0002
        CMPI    #$0064, R0                      ; 5DD1   0378 0064
        BLT     L_5DD6                          ; 5DD3   0205 0001

        INCR    R1                              ; 5DD5   0009

L_5DD6:
        JSR     R5,     X_PRNUM_LFT             ; 5DD6   0004 0118 009E

        PULR    R0                              ; 5DD9   02B0
        DECR    R0                              ; 5DDA   0010
        BNEQ    L_5DC7                          ; 5DDB   022C 0015

        MVI     G_034B, R2                      ; 5DDD   0282 034B
        MVI@    R2,     R0                      ; 5DDF   0290
        INCR    R2                              ; 5DE0   000A
        ADD     G_0131, R2                      ; 5DE1   02C2 0131
        MVI@    R2,     R1                      ; 5DE3   0291
        PSHR    R1                              ; 5DE4   0271
        ADDR    R0,     R2                      ; 5DE5   00C2
        MVI@    R2,     R4                      ; 5DE6   0294
        MVII    #$0001, R0                      ; 5DE7   02B8 0001
        CMPI    #$000A, R4                      ; 5DE9   037C 000A
        BLT     L_5DF3                          ; 5DEB   0205 0006

        INCR    R0                              ; 5DED   0008
        CMPI    #$0064, R4                      ; 5DEE   037C 0064
        BLT     L_5DF3                          ; 5DF0   0205 0001

        INCR    R0                              ; 5DF2   0008
L_5DF3:
        MVII    #$0007, R3                      ; 5DF3   02BB 0007

        JSR     R5,     L_5D93                  ; 5DF5   0004 015C 0193

        PULR    R2                              ; 5DF8   02B2
        SDBD                                    ; 5DF9   0001
        MVII    #$2000, R5                      ; 5DFA   02BD 0000 0020
        MVI@    R2,     R0                      ; 5DFD   0290
        XORR    R5,     R0                      ; 5DFE   01E8
        MVO@    R0,     R2                      ; 5DFF   0250
        MVI@    R1,     R0                      ; 5E00   0288
        XORR    R5,     R0                      ; 5E01   01E8
        MVO@    R0,     R1                      ; 5E02   0248
        PULR    R7                              ; 5E03   02B7

L_5E04:
        PSHR    R5                              ; 5E04   0275

        JSR     R5,     L_5D9F                  ; 5E05   0004 015C 019F

        MOVR    R7,     R4                      ; 5E08   00BC
        ADDI    #$000F, R4                      ; 5E09   02FC 000F
L_5E0B:
        MVI@    R4,     R1                      ; 5E0B   02A1
        TSTR    R1                              ; 5E0C   0089
        BEQ     L_5E17                          ; 5E0D   0204 0008

        MVI@    R1,     R0                      ; 5E0F   0288
        SDBD                                    ; 5E10   0001
        ANDI    #$DFFF, R0                      ; 5E11   03B8 00FF 00DF
        MVO@    R0,     R1                      ; 5E14   0248
        B       L_5E0B                          ; 5E15   0220 000B
L_5E17:
        PULR    R7                              ; 5E17   02B7

        DECLE   $0214,  $0228,  $023C,  $0250   ; 5E18   0214 0228 023C 0250
        DECLE   $0264,  $0000                   ; 5E1C   0264 0000
L_5E1E:
        PSHR    R5                              ; 5E1E   0275
        MVII    #$0185, R5                      ; 5E1F   02BD 0185
        SDBD                                    ; 5E21   0001
        MVI@    R5,     R1                      ; 5E22   02A9
        SDBD                                    ; 5E23   0001
        MVII    #$3960, R4                      ; 5E24   02BC 0060 0039

        JSR     R5,     L_5E2F                  ; 5E27   0004 015C 022F

        MVII    #$0187, R5                      ; 5E2A   02BD 0187
        SDBD                                    ; 5E2C   0001
        MVI@    R5,     R1                      ; 5E2D   02A9
        INCR    R7                              ; 5E2E   000F

L_5E2F:
        PSHR    R5                              ; 5E2F   0275
L_5E30:
        SDBD                                    ; 5E30   0001
        MVII    #$9280, R5                      ; 5E31   02BD 0080 0092
        CLRR    R2                              ; 5E34   01D2
        CLRR    R3                              ; 5E35   01DB
        MVO     R2,     .BTAB.11                ; 5E36   0242 0211
        MVO     R2,     .BTAB.12                ; 5E38   0242 0212
        TSTR    R1                              ; 5E3A   0089
        BPL     L_5E42                          ; 5E3B   0203 0005

        NEGR    R1                              ; 5E3D   0021
        MVII    #$000A, R3                      ; 5E3E   02BB 000A
        B       L_5E4B                          ; 5E40   0200 0009

L_5E42:
        SUBI    #$0064, R1                      ; 5E42   0339 0064
        BMI     L_5E49                          ; 5E44   020B 0003

        INCR    R3                              ; 5E46   000B
        B       L_5E42                          ; 5E47   0220 0006

L_5E49:
        ADDI    #$0064, R1                      ; 5E49   02F9 0064
L_5E4B:
        SUBI    #$000A, R1                      ; 5E4B   0339 000A
        BMI     L_5E52                          ; 5E4D   020B 0003

        INCR    R2                              ; 5E4F   000A
        B       L_5E4B                          ; 5E50   0220 0006

L_5E52:
        ADDI    #$000A, R1                      ; 5E52   02F9 000A
        PSHR    R3                              ; 5E54   0273
        SLL     R3,     2                       ; 5E55   004F
        ADD@    R6,     R3                      ; 5E56   02F3
        NOP                                     ; 5E57   0034
        PSHR    R2                              ; 5E58   0272
        SLL     R2,     2                       ; 5E59   004E
        ADD@    R6,     R2                      ; 5E5A   02F2
        PSHR    R1                              ; 5E5B   0271
        NOP                                     ; 5E5C   0034
        SLL     R1,     2                       ; 5E5D   004D
        ADD@    R6,     R1                      ; 5E5E   02F1
        ADDR    R5,     R1                      ; 5E5F   00E9
        ADDR    R5,     R2                      ; 5E60   00EA
        ADDR    R5,     R3                      ; 5E61   00EB
        SDBD                                    ; 5E62   0001
        CMPI    #$92B2, R3                      ; 5E63   037B 00B2 0092
        BEQ     L_5E6F                          ; 5E66   0204 0007

        CMPR    R5,     R3                      ; 5E68   016B
        BNEQ    L_5E76                          ; 5E69   020C 000B

        SDBD                                    ; 5E6B   0001
        MVII    #$9080, R3                      ; 5E6C   02BB 0080 0090
L_5E6F:
        CMPR    R5,     R2                      ; 5E6F   016A
        BNEQ    L_5E76                          ; 5E70   020C 0004

        SDBD                                    ; 5E72   0001
        MVII    #$9080, R2                      ; 5E73   02BA 0080 0090
L_5E76:
        PSHR    R2                              ; 5E76   0272
        DECLE   $0273,  $0274,  $0004           ; 5E77   0273 0274 0004

        ANDR    R3,     R0                      ; 5E7A   0198
        MOVR    R3,     R0                      ; 5E7B   0098
        PULR    R4                              ; 5E7C   02B4
        PULR    R3                              ; 5E7D   02B3
        PULR    R2                              ; 5E7E   02B2
        CLRR    R0                              ; 5E7F   01C0
        MVO@    R0,     R4                      ; 5E80   0260
        MOVR    R3,     R5                      ; 5E81   009D
        MVI@    R5,     R3                      ; 5E82   02AB
        MVO@    R3,     R4                      ; 5E83   0263
        MVI@    R5,     R3                      ; 5E84   02AB
        MVO@    R3,     R4                      ; 5E85   0263
        MVI@    R5,     R3                      ; 5E86   02AB
        MVO@    R3,     R4                      ; 5E87   0263
        MVI@    R5,     R3                      ; 5E88   02AB
        MVO@    R3,     R4                      ; 5E89   0263
        MVI@    R5,     R3                      ; 5E8A   02AB
        MVO@    R3,     R4                      ; 5E8B   0263
        MVO@    R0,     R4                      ; 5E8C   0260
        MVO@    R0,     R4                      ; 5E8D   0260
        MVO@    R0,     R4                      ; 5E8E   0260
        MVII    #$0005, R5                      ; 5E8F   02BD 0005
L_5E91:
        MVI@    R2,     R0                      ; 5E91   0290
        SLL     R0,     2                       ; 5E92   004C
        SLL     R0,     2                       ; 5E93   004C
        XOR@    R1,     R0                      ; 5E94   03C8
        MVO@    R0,     R4                      ; 5E95   0260
        INCR    R2                              ; 5E96   000A
        INCR    R1                              ; 5E97   0009
        DECR    R5                              ; 5E98   0015
        BNEQ    L_5E91                          ; 5E99   022C 0009

        MVO@    R5,     R4                      ; 5E9B   0265
        MVO@    R5,     R4                      ; 5E9C   0265
        MVO     R0,     .STIC.VIDEN             ; 5E9D   0240 0020
        PULR    R7                              ; 5E9F   02B7

L_5EA0:
        PSHR    R5                              ; 5EA0   0275
        MVII    #$0004, R5                      ; 5EA1   02BD 0004
        CLRR    R0                              ; 5EA3   01C0
L_5EA4:
        SLL     R0,     2                       ; 5EA4   004C
        PSHR    R0                              ; 5EA5   0270
        MVI@    R4,     R0                      ; 5EA6   02A0
        SWAP    R0,     1                       ; 5EA7   0040
        ANDI    #$0003, R0                      ; 5EA8   03B8 0003
        XOR@    R6,     R0                      ; 5EAA   03F0
        DECR    R5                              ; 5EAB   0015
        BNEQ    L_5EA4                          ; 5EAC   022C 0009
        PULR    R7                              ; 5EAE   02B7

L_5EAF:
        PSHR    R5                              ; 5EAF   0275
        INCR    R0                              ; 5EB0   0008
        SLR     R0,     2                       ; 5EB1   0064
        ANDI    #$0003, R0                      ; 5EB2   03B8 0003
        MOVR    R0,     R2                      ; 5EB4   0082
        MVII    #$0001, R4                      ; 5EB5   02BC 0001
        MVI     G_0180, R0                      ; 5EB7   0280 0180
        MVI     G_0181, R1                      ; 5EB9   0281 0181
        INCR    R2                              ; 5EBB   000A
        ADDR    R7,     R2                      ; 5EBC   00FA
        ADD@    R2,     R7                      ; 5EBD   02D7

        DECLE   $0005,  $000A,  $0004           ; 5EBE   0005 000A 0004

        INCR    R3                              ; 5EC1   000B
        NEGR    R4                              ; 5EC2   0024
        ADDR    R4,     R0                      ; 5EC3   00E0
        BMI     L_5EE2                          ; 5EC4   020B 001C
        B       L_5ECC                          ; 5EC6   0200 0004

        NEGR    R4                              ; 5EC8   0024
        ADDR    R4,     R1                      ; 5EC9   00E1
        BMI     L_5EE2                          ; 5ECA   020B 0016

L_5ECC:
        MOVR    R1,     R5                      ; 5ECC   008D
        ADDR    R5,     R5                      ; 5ECD   00ED
        ADDR    R7,     R5                      ; 5ECE   00FD
        ADDI    #$0039, R5                      ; 5ECF   02FD 0039
        SDBD                                    ; 5ED1   0001
        MVI@    R5,     R3                      ; 5ED2   02AB
        PSHR    R0                              ; 5ED3   0270
        NEGR    R0                              ; 5ED4   0020
        ADDI    #$000F, R0                      ; 5ED5   02F8 000F

        JSR     R5,     X_POW2                  ; 5ED7   0004 0114 0345

        ANDR    R0,     R3                      ; 5EDA   0183
        PULR    R0                              ; 5EDB   02B0
        BEQ     L_5EE2                          ; 5EDC   0204 0004

        MVO     R0,     G_0180                  ; 5EDE   0240 0180
        MVO     R1,     G_0181                  ; 5EE0   0241 0181
L_5EE2:
        INCR    R7                              ; 5EE2   000F

L_5EE3:
        PSHR    R5                              ; 5EE3   0275
L_5EE4:
        MVI     G_0180, R0                      ; 5EE4   0280 0180
        MVI     G_0181, R1                      ; 5EE6   0281 0181
        ADDI    #$0053, R0                      ; 5EE8   02F8 0053
        ADDI    #$000A, R1                      ; 5EEA   02F9 000A
        NOP                                     ; 5EEC   0034
        SWAP    R0,     1                       ; 5EED   0040
        SLR     R0,     2                       ; 5EEE   0064
        SWAP    R1,     1                       ; 5EEF   0041
        SLR     R1,     2                       ; 5EF0   0065
        NOP                                     ; 5EF1   0034
        MVO     R0,     G_0328                  ; 5EF2   0240 0328
        MVO     R1,     G_0339                  ; 5EF4   0241 0339
        MVII    #$0010, R1                      ; 5EF6   02B9 0010
        SDBD                                    ; 5EF8   0001
        MVII    #$080F, R0                      ; 5EF9   02B8 000F 0008
        MVO     R0,     .BTAB.09                ; 5EFC   0240 0209
        ADDR    R1,     R0                      ; 5EFE   00C8
        MVO     R0,     .BTAB.0A                ; 5EFF   0240 020A
        ADDR    R1,     R0                      ; 5F01   00C8
        MVO     R0,     .BTAB.1D                ; 5F02   0240 021D
        ADDR    R1,     R0                      ; 5F04   00C8
        MVO     R0,     .BTAB.1E                ; 5F05   0240 021E
        PULR    R7                              ; 5F07   02B7

        DECLE   $0000,  $0004,  $0000,  $001F   ; 5F08   0000 0004 0000 001F
        DECLE   $0080,  $003F,  $00C0,  $007F   ; 5F0C   0080 003F 00C0 007F
        DECLE   $00C0,  $007F,  $00E0,  $00FF   ; 5F10   00C0 007F 00E0 00FF
        DECLE   $00C0,  $007F,  $00C0,  $007F   ; 5F14   00C0 007F 00C0 007F
        DECLE   $0080,  $003F,  $0000,  $001F   ; 5F18   0080 003F 0000 001F
        DECLE   $0000,  $0004,  $0000,  $0000   ; 5F1C   0000 0004 0000 0000
L_5F20:
        PSHR    R5                              ; 5F20   0275
        PSHR    R3                              ; 5F21   0273
        MVII    #$01B3, R3                      ; 5F22   02BB 01B3
L_5F24:
        PSHR    R0                              ; 5F24   0270
        DECLE   $029D,  $00AD,  $020C,  $0018   ; 5F25   029D 00AD 020C 0018
        DECLE   $0004                           ; 5F29   0004

        ANDR    R3,     R0                      ; 5F2A   0198
        XORR    R1,     R2                      ; 5F2B   01CA
        ADDI    #$015E, R5                      ; 5F2C   02FD 015E
        MVI@    R5,     R0                      ; 5F2E   02A8
        XORI    #$0080, R0                      ; 5F2F   03F8 0080
        SUBI    #$0080, R0                      ; 5F31   0338 0080
        BNEQ    L_5F3E                          ; 5F33   020C 0009

        ADDI    #$0010, R5                      ; 5F35   02FD 0010
        MVI@    R5,     R0                      ; 5F37   02A8
        XORI    #$0080, R0                      ; 5F38   03F8 0080
        SUBI    #$0080, R0                      ; 5F3A   0338 0080
        BEQ     L_5F41                          ; 5F3C   0204 0003

L_5F3E:
        MVII    #$0001, R5                      ; 5F3E   02BD 0001
        MVO@    R5,     R3                      ; 5F40   025D
L_5F41:
        PULR    R0                              ; 5F41   02B0
        PULR    R3                              ; 5F42   02B3
        PULR    R7                              ; 5F43   02B7

L_5F44:
        PSHR    R5                              ; 5F44   0275
        PSHR    R3                              ; 5F45   0273
        MVII    #$01B4, R3                      ; 5F46   02BB 01B4
        B       L_5F24                          ; 5F48   0220 0025

L_5F4A:
        PSHR    R5                              ; 5F4A   0275
        DECLE   $0280,  $01B3,  $03B8,  $0001   ; 5F4B   0280 01B3 03B8 0001
        DECLE   $0204,  $0085,  $0004           ; 5F4F   0204 0085 0004

        ANDR    R3,     R0                      ; 5F52   0198
        XORR    R1,     R2                      ; 5F53   01CA
        CLRR    R2                              ; 5F54   01D2
        ADDI    #$015E, R5                      ; 5F55   02FD 015E
        MVI@    R5,     R0                      ; 5F57   02A8
        XORI    #$0080, R0                      ; 5F58   03F8 0080
        SUBI    #$0080, R0                      ; 5F5A   0338 0080
        BPL     L_5F60                          ; 5F5C   0203 0002

        MVII    #$0003, R2                      ; 5F5E   02BA 0003
L_5F60:
        ADDI    #$0010, R5                      ; 5F60   02FD 0010
        MVI@    R5,     R1                      ; 5F62   02A9
        XORI    #$0080, R1                      ; 5F63   03F9 0080
        SUBI    #$0080, R1                      ; 5F65   0339 0080
        BPL     L_5F6B                          ; 5F67   0203 0002

        XORI    #$0001, R2                      ; 5F69   03FA 0001
L_5F6B:
        MVO     R2,     G_01B3                  ; 5F6B   0242 01B3
        MVO     R0,     G_034D                  ; 5F6D   0240 034D
        MVO     R1,     G_034E                  ; 5F6F   0241 034E
        CLRR    R2                              ; 5F71   01D2
        MVI     G_0180, R5                      ; 5F72   0285 0180
        CMPI    #$0005, R5                      ; 5F74   037D 0005
        BLE     L_5F7A                          ; 5F76   0206 0002

        MVII    #$0001, R2                      ; 5F78   02BA 0001
L_5F7A:
        CLRR    R5                              ; 5F7A   01ED
        TSTR    R0                              ; 5F7B   0080
        BPL     L_5F7F                          ; 5F7C   0203 0001

        INCR    R5                              ; 5F7E   000D
L_5F7F:
        TSTR    R1                              ; 5F7F   0089
        BPL     L_5F83                          ; 5F80   0203 0001

        INCR    R5                              ; 5F82   000D
L_5F83:
        ANDI    #$0001, R5                      ; 5F83   03BD 0001
        BNEQ    L_5F89                          ; 5F85   020C 0002

        XORI    #$0001, R2                      ; 5F87   03FA 0001
L_5F89:
        MVO     R2,     G_035A                  ; 5F89   0242 035A
        MVI     G_0180, R4                      ; 5F8B   0284 0180
        ADDR    R7,     R4                      ; 5F8D   00FC
        ADDI    #$0049, R4                      ; 5F8E   02FC 0049
        MVI@    R4,     R0                      ; 5F90   02A0

        JSR     R5,     X_MPY                   ; 5F91   0004 011C 01DC

        SWAP    R2,     1                       ; 5F94   0042
        ANDI    #$00FF, R2                      ; 5F95   03BA 00FF
        XORI    #$0080, R2                      ; 5F97   03FA 0080
        SUBI    #$0080, R2                      ; 5F99   033A 0080
        MVI     G_01B3, R0                      ; 5F9B   0280 01B3
        ANDI    #$0001, R0                      ; 5F9D   03B8 0001
        XOR     G_035A, R0                      ; 5F9F   03C0 035A
        BEQ     L_5FA4                          ; 5FA1   0204 0001

        NEGR    R2                              ; 5FA3   0022
L_5FA4:
        ADD     G_034D, R2                      ; 5FA4   02C2 034D

        JSR     R5,     L_6048                  ; 5FA6   0004 0160 0048

        MVO     R2,     G_0357                  ; 5FA9   0242 0357
        DECR    R4                              ; 5FAB   0014
        MVI@    R4,     R0                      ; 5FAC   02A0
        MVI     G_034D, R1                      ; 5FAD   0281 034D

        JSR     R5,     X_MPY                   ; 5FAF   0004 011C 01DC

        SWAP    R2,     1                       ; 5FB2   0042
        ANDI    #$00FF, R2                      ; 5FB3   03BA 00FF
        XORI    #$0080, R2                      ; 5FB5   03FA 0080
        SUBI    #$0080, R2                      ; 5FB7   033A 0080
        MVI     G_01B3, R0                      ; 5FB9   0280 01B3
        ANDI    #$0001, R0                      ; 5FBB   03B8 0001
        XOR     G_035A, R0                      ; 5FBD   03C0 035A
        BNEQ    L_5FC2                          ; 5FBF   020C 0001

        NEGR    R2                              ; 5FC1   0022
L_5FC2:
        ADD     G_034E, R2                      ; 5FC2   02C2 034E

        JSR     R5,     L_6048                  ; 5FC4   0004 0160 0048
        DECLE   $0004                           ; 5FC7   0004

        ANDR    R3,     R0                      ; 5FC8   0198
        XORR    R1,     R2                      ; 5FC9   01CA
        ADDI    #$015E, R5                      ; 5FCA   02FD 015E
        MVI     G_0357, R0                      ; 5FCC   0280 0357
        MVO@    R0,     R5                      ; 5FCE   0268
        ADDI    #$0010, R5                      ; 5FCF   02FD 0010
        MVO@    R2,     R5                      ; 5FD1   026A
        MVII    #$0002, R0                      ; 5FD2   02B8 0002
        MVO     R0,     G_01B3                  ; 5FD4   0240 01B3
        PULR    R7                              ; 5FD6   02B7

        DECLE   $0089,  $006D,  $0052,  $0036   ; 5FD7   0089 006D 0052 0036
        DECLE   $001B,  $0000,  $001B,  $0036   ; 5FDB   001B 0000 001B 0036

        RLC     R2,     1                       ; 5FDF   0052
        SAR     R1,     2                       ; 5FE0   006D
        TSTR    R1                              ; 5FE1   0089
L_5FE2:
        PSHR    R5                              ; 5FE2   0275
        MVI     G_015D, R0                      ; 5FE3   0280 015D
        ANDI    #$0007, R0                      ; 5FE5   03B8 0007
        BNEQ    L_6047                          ; 5FE7   020C 005E

        MVI     G_01B4, R0                      ; 5FE9   0280 01B4
        ANDI    #$0001, R0                      ; 5FEB   03B8 0001
        BEQ     L_6047                          ; 5FED   0204 0058

        MVI     G_01B1, R0                      ; 5FEF   0280 01B1
        MVI     G_01B2, R1                      ; 5FF1   0281 01B2
        XORI    #$0080, R0                      ; 5FF3   03F8 0080
        SUBI    #$0080, R0                      ; 5FF5   0338 0080
        XORI    #$0080, R1                      ; 5FF7   03F9 0080
        SUBI    #$0080, R1                      ; 5FF9   0339 0080
        MVI     G_0181, R4                      ; 5FFB   0284 0181
        CMPI    #$0005, R4                      ; 5FFD   037C 0005
        BLE     L_6003                          ; 5FFF   0206 0002

        NEGR    R0                              ; 6001   0020
        NEGR    R1                              ; 6002   0021
L_6003:
        MVO     R0,     G_034D                  ; 6003   0240 034D
        DECLE   $0241,  $034E,  $0004           ; 6005   0241 034E 0004

        ANDR    R3,     R0                      ; 6008   0198
        XORR    R1,     R2                      ; 6009   01CA
        MOVR    R5,     R3                      ; 600A   00AB
        ADDI    #$015E, R3                      ; 600B   02FB 015E
        MVI     G_0181, R4                      ; 600D   0284 0181
        ADDR    R7,     R4                      ; 600F   00FC
        ADDI    #$004A, R4                      ; 6010   02FC 004A
        MVI@    R4,     R0                      ; 6012   02A0
        MVI     G_034D, R1                      ; 6013   0281 034D

        JSR     R5,     X_MPY                   ; 6015   0004 011C 01DC

        SWAP    R2,     1                       ; 6018   0042
        ANDI    #$00FF, R2                      ; 6019   03BA 00FF
        XORI    #$0080, R2                      ; 601B   03FA 0080
        SUBI    #$0080, R2                      ; 601D   033A 0080
        MVI@    R3,     R5                      ; 601F   029D
        XORI    #$0080, R5                      ; 6020   03FD 0080
        SUBI    #$0080, R5                      ; 6022   033D 0080
        ADDR    R5,     R2                      ; 6024   00EA

        JSR     R5,     L_6048                  ; 6025   0004 0160 0048

        MVO@    R2,     R3                      ; 6028   025A
        ADDI    #$0011, R3                      ; 6029   02FB 0011
        DECR    R4                              ; 602B   0014
        MVI@    R4,     R0                      ; 602C   02A0
        MVI     G_034E, R1                      ; 602D   0281 034E

        JSR     R5,     X_MPY                   ; 602F   0004 011C 01DC

        SWAP    R2,     1                       ; 6032   0042
        ANDI    #$00FF, R2                      ; 6033   03BA 00FF
        XORI    #$0080, R2                      ; 6035   03FA 0080
        SUBI    #$0080, R2                      ; 6037   033A 0080
        MVI@    R3,     R5                      ; 6039   029D
        XORI    #$0080, R5                      ; 603A   03FD 0080
        SUBI    #$0080, R5                      ; 603C   033D 0080
        ADDR    R5,     R2                      ; 603E   00EA

        JSR     R5,     L_6048                  ; 603F   0004 0160 0048

        MVO@    R2,     R3                      ; 6042   025A
        MVII    #$0002, R0                      ; 6043   02B8 0002
        MVO     R0,     G_01B4                  ; 6045   0240 01B4
L_6047:
        PULR    R7                              ; 6047   02B7

L_6048:
        PSHR    R5                              ; 6048   0275
        CLRR    R1                              ; 6049   01C9
        MOVR    R2,     R5                      ; 604A   0095
        BPL     L_604F                          ; 604B   0203 0002

        NEGR    R5                              ; 604D   0025
        INCR    R1                              ; 604E   0009
L_604F:
        CMPI    #$007F, R5                      ; 604F   037D 007F
        BLT     L_6059                          ; 6051   0205 0006

        MVII    #$0064, R2                      ; 6053   02BA 0064
        TSTR    R1                              ; 6055   0089
        BEQ     L_6059                          ; 6056   0204 0001

        NEGR    R2                              ; 6058   0022
L_6059:
        PULR    R7                              ; 6059   02B7

        DECLE   $006F,  $0058,  $0042,  $002C   ; 605A   006F 0058 0042 002C
        DECLE   $0016,  $0000,  $0016,  $002C   ; 605E   0016 0000 0016 002C
        DECLE   $0042,  $0058,  $006F,  $0001   ; 6062   0042 0058 006F 0001
        DECLE   $0012,  $0006,  $0000,  $000A   ; 6066   0012 0006 0000 000A
        DECLE   $0004,  $0008,  $0002,  $0000   ; 606A   0004 0008 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 606E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0000   ; 6072   0000 0000 000A 0000
        DECLE   $0000,  $0000,  $0007,  $0000   ; 6076   0000 0000 0007 0000
        DECLE   $0004,  $0001,  $0000,  $0000   ; 607A   0004 0001 0000 0000
        DECLE   $0000,  $0000,  $0007,  $0000   ; 607E   0000 0000 0007 0000
        DECLE   $0000,  $000B,  $0008,  $0000   ; 6082   0000 000B 0008 0000
        DECLE   $0003,  $0000,  $0004           ; 6086   0003 0000 0004

        INCR    R7                              ; 6089   000F

        DECR    R0                              ; 608A   0010
L_608B:
        INCR    R4                              ; 608B   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 608C   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 6090   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 6094   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 6098   0005 000E 0001 000D
        DECLE   $0000                           ; 609C   0000
L_609D:
        PSHR    R5                              ; 609D   0275
        MVI     .PSG0.lft_hand,R0               ; 609E   0280 01FF
        CMP     G_0111, R0                      ; 60A0   0340 0111
        MVO     R0,     G_0111                  ; 60A2   0240 0111
        BNEQ    L_60A8                          ; 60A4   020C 0002

        MVO     R0,     G_0106                  ; 60A6   0240 0106
L_60A8:
        MVI     .PSG0.rgt_hand,R0               ; 60A8   0280 01FE
        CMP     G_0112, R0                      ; 60AA   0340 0112
        MVO     R0,     G_0112                  ; 60AC   0240 0112
        BNEQ    L_60B2                          ; 60AE   020C 0002

        MVO     R0,     G_010A                  ; 60B0   0240 010A
L_60B2:
        MVII    #$0138, R4                      ; 60B2   02BC 0138
        MOVR    R4,     R5                      ; 60B4   00A5
        SDBD                                    ; 60B5   0001
        MVI@    R4,     R0                      ; 60B6   02A0
        DECR    R0                              ; 60B7   0010
        BMI     L_60C9                          ; 60B8   020B 000F

        MVO@    R0,     R5                      ; 60BA   0268
        SWAP    R0,     1                       ; 60BB   0040
        MVO@    R0,     R5                      ; 60BC   0268
        MVI     G_0106, R5                      ; 60BD   0285 0106
        CMPI    #$005A, R5                      ; 60BF   037D 005A
        BEQ     L_60C9                          ; 60C1   0204 0006

        MVI     G_010A, R5                      ; 60C3   0285 010A
        CMPI    #$005A, R5                      ; 60C5   037D 005A
        BNEQ    L_60F7                          ; 60C7   020C 002E

L_60C9:
        MVI     .ISRVEC.0,R2                    ; 60C9   0282 0100
        MVI     .ISRVEC.1,R3                    ; 60CB   0283 0101
        MOVR    R7,     R1                      ; 60CD   00B9
        ADDI    #$00D6, R1                      ; 60CE   02F9 00D6
        MVO     R1,     .ISRVEC.0               ; 60D0   0241 0100
        SWAP    R1,     1                       ; 60D2   0041
        MVO     R1,     .ISRVEC.1               ; 60D3   0241 0101
        MVI     .PSG0.chan_enable,R1            ; 60D5   0281 01F8
        MVII    #$003F, R5                      ; 60D7   02BD 003F
        MVO     R5,     .PSG0.chan_enable       ; 60D9   0245 01F8
        MVII    #$0138, R4                      ; 60DB   02BC 0138
        SDBD                                    ; 60DD   0001
        MVI@    R4,     R0                      ; 60DE   02A0
        TSTR    R0                              ; 60DF   0080
        BEQ     L_60E5                          ; 60E0   0204 0003

        JSR     R5,     L_618A                  ; 60E2   0004 0160 018A
L_60E5:
        JSR     R5,     L_618A                  ; 60E5   0004 0160 018A

        MVO     R1,     .PSG0.chan_enable       ; 60E8   0241 01F8
        MVO     R2,     .ISRVEC.0               ; 60EA   0242 0100
        MVO     R3,     .ISRVEC.1               ; 60EC   0243 0101
        MVII    #$00FF, R0                      ; 60EE   02B8 00FF
        MVO     R0,     G_0106                  ; 60F0   0240 0106
        MVO     R0,     G_010A                  ; 60F2   0240 010A

        JSR     R5,     L_61A8                  ; 60F4   0004 0160 01A8
L_60F7:
        JSR     R5,     L_60FE                  ; 60F7   0004 0160 00FE
        JSR     R5,     L_614C                  ; 60FA   0004 0160 014C

        PULR    R7                              ; 60FD   02B7

L_60FE:
        PSHR    R5                              ; 60FE   0275
        MVI     G_0106, R0                      ; 60FF   0280 0106
        MVII    #$0103, R4                      ; 6101   02BC 0103

        JSR     R5,     L_610B                  ; 6103   0004 0160 010B

        MVI     G_010A, R0                      ; 6106   0280 010A
        MVII    #$0107, R4                      ; 6108   02BC 0107
        INCR    R7                              ; 610A   000F

L_610B:
        PSHR    R5                              ; 610B   0275
L_610C:
        MOVR    R0,     R1                      ; 610C   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; 610D   0065 0065 0061 0001
        DECLE   $02F9,  $0065,  $0060,  $0289   ; 6111   02F9 0065 0060 0289
        DECLE   $0079,  $0201,  $001F,  $0079   ; 6115   0079 0201 001F 0079
        DECLE   $0201,  $0020,  $02BD,  $00FF   ; 6119   0201 0020 02BD 00FF
        DECLE   $0265,  $0265,  $0082,  $03B8   ; 611D   0265 0265 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; 6121   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; 6125   000F 0001

        ADDI    #$006D, R2                      ; 6127   02FA 006D
        SLR     R0,     1                       ; 6129   0060
        ADD@    R2,     R1                      ; 612A   02D1
        CMPI    #$000A, R1                      ; 612B   0379 000A
        BLE     L_6139                          ; 612D   0206 000A

        SUBI    #$000B, R1                      ; 612F   0339 000B
        BEQ     L_6139                          ; 6131   0204 0006

        ADDI    #$000A, R1                      ; 6133   02F9 000A
        B       L_6139                          ; 6135   0200 0002

        MVII    #$00FF, R1                      ; 6137   02B9 00FF
L_6139:
        MVO@    R1,     R4                      ; 6139   0261
        PULR    R7                              ; 613A   02B7

        MOVR    R0,     R2                      ; 613B   0082
        ANDI    #$001F, R2                      ; 613C   03BA 001F
        SDBD                                    ; 613E   0001
        ADDI    #$607D, R2                      ; 613F   02FA 007D 0060
        MVI@    R2,     R2                      ; 6142   0292
        DECR    R2                              ; 6143   0012
        MVO@    R2,     R4                      ; 6144   0262
        XORI    #$00FF, R1                      ; 6145   03F9 00FF
        MVO@    R1,     R4                      ; 6147   0261
        MVII    #$00FF, R2                      ; 6148   02BA 00FF
        MVO@    R2,     R4                      ; 614A   0262
        PULR    R7                              ; 614B   02B7

L_614C:
        PSHR    R5                              ; 614C   0275
        CLRR    R1                              ; 614D   01C9
        MVII    #$0103, R2                      ; 614E   02BA 0103
        MVII    #$010B, R3                      ; 6150   02BB 010B
        SDBD                                    ; 6152   0001
        MVII    #$5151, R4                      ; 6153   02BC 0051 0051
        PSHR    R4                              ; 6156   0274

        JSR     R5,     L_6162                  ; 6157   0004 0160 0162

        MVII    #$0001, R1                      ; 615A   02B9 0001
        MVII    #$0107, R2                      ; 615C   02BA 0107
        MVII    #$010E, R3                      ; 615E   02BB 010E
        PULR    R4                              ; 6160   02B4
        INCR    R7                              ; 6161   000F

L_6162:
        PSHR    R5                              ; 6162   0275
L_6163:
        MVII    #$0002, R5                      ; 6163   02BD 0002
L_6165:
        PSHR    R5                              ; 6165   0275
        MVI@    R2,     R0                      ; 6166   0290
        CMP@    R3,     R0                      ; 6167   0358
        BNEQ    L_616E                          ; 6168   020C 0004

        CMPI    #$00FF, R0                      ; 616A   0378 00FF
        BEQ     L_617F                          ; 616C   0204 0011

L_616E:
        PSHR    R4                              ; 616E   0274
        PSHR    R3                              ; 616F   0273
        PSHR    R2                              ; 6170   0272
        NOP                                     ; 6171   0034
        PSHR    R1                              ; 6172   0271
        MOVR    R7,     R5                      ; 6173   00BD
        ADDI    #$0004, R5                      ; 6174   02FD 0004
        SDBD                                    ; 6176   0001
        MVI@    R4,     R7                      ; 6177   02A7

        JSR     R5,     L_61A8                  ; 6178   0004 0160 01A8

        PULR    R1                              ; 617B   02B1
        PULR    R2                              ; 617C   02B2
        PULR    R3                              ; 617D   02B3
        PULR    R4                              ; 617E   02B4
L_617F:
        MVI@    R2,     R0                      ; 617F   0290
        MVO@    R0,     R3                      ; 6180   0258
        INCR    R2                              ; 6181   000A
        INCR    R3                              ; 6182   000B
        ADDI    #$0002, R4                      ; 6183   02FC 0002
        PULR    R5                              ; 6185   02B5
        DECR    R5                              ; 6186   0015
        BPL     L_6165                          ; 6187   0223 0023
        PULR    R7                              ; 6189   02B7

L_618A:
        MVII    #$03FF, R4                      ; 618A   02BC 03FF
L_618C:
        MVI     .PSG0.rgt_hand,R0               ; 618C   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 618E   0380 01FF
        CMPI    #$00FF, R0                      ; 6190   0378 00FF
        BEQ     L_618A                          ; 6192   0224 0009

        DECR    R4                              ; 6194   0014
        BNEQ    L_618C                          ; 6195   022C 000A

L_6197:
        MVII    #$03FF, R4                      ; 6197   02BC 03FF
L_6199:
        MVI     .PSG0.rgt_hand,R0               ; 6199   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 619B   0380 01FF
        CMPI    #$00FF, R0                      ; 619D   0378 00FF
        BNEQ    L_6197                          ; 619F   022C 0009

        DECR    R4                              ; 61A1   0014
        BNEQ    L_6199                          ; 61A2   022C 000A

        CLRR    R0                              ; 61A4   01C0
        MVO     R0,     .STIC.BORD              ; 61A5   0240 002C
        MOVR    R5,     R7                      ; 61A7   00AF

L_61A8:
        MVII    #$0030, R0                      ; 61A8   02B8 0030
        MVO     R0,     G_0138                  ; 61AA   0240 0138
        MVII    #$002A, R0                      ; 61AC   02B8 002A
        MVO     R0,     G_0139                  ; 61AE   0240 0139
        MOVR    R5,     R7                      ; 61B0   00AF

        DECLE   $0275,  $0004,  $0198,  $0100   ; 61B1   0275 0004 0198 0100
        DECLE   $0282,  $0130,  $0012,  $020B   ; 61B5   0282 0130 0012 020B
        DECLE   $01CA                           ; 61B9   01CA

        INCR    R2                              ; 61BA   000A
        ADDR    R7,     R2                      ; 61BB   00FA
        ADD@    R2,     R7                      ; 61BC   02D7

        DECLE   $0007,  $002D,  $00F4,  $0095   ; 61BD   0007 002D 00F4 0095
        DECLE   $0112,  $014B,  $015C,  $0378   ; 61C1   0112 014B 015C 0378
        DECLE   $00FF,  $0204,  $0009,  $0080   ; 61C5   00FF 0204 0009 0080
        DECLE   $020C,  $0009,  $0358,  $0204   ; 61C9   020C 0009 0358 0204
        DECLE   $03BF,  $0004,  $03A4,  $00E2   ; 61CD   03BF 0004 03A4 00E2
        DECLE   $0004                           ; 61D1   0004

        AND@    R4,     R0                      ; 61D2   03A0
        CMP@    R2,     R3                      ; 61D3   0353
L_61D4:
        CLRR    R0                              ; 61D4   01C0
        MVO     R0,     G_035C                  ; 61D5   0240 035C
        MVO     R0,     G_0118                  ; 61D7   0240 0118

L_61D9:
        JSR     R5,     L_5D9F                  ; 61D9   0004 015C 019F
        DECLE   $0004,  $0158,  $01C5,  $0004   ; 61DC   0004 0158 01C5 0004

        ANDR    R3,     R0                      ; 61E0   0198
        ADDR    R4,     R2                      ; 61E1   00E2
        MVII    #$0002, R0                      ; 61E2   02B8 0002
        MVO     R0,     G_0130                  ; 61E4   0240 0130

        JSR     R5,     L_5D16                  ; 61E6   0004 015C 0116

        PULR    R7                              ; 61E9   02B7

        DECLE   $0004,  $0198,  $0115,  $0378   ; 61EA   0004 0198 0115 0378
        DECLE   $000B,  $020C,  $039C,  $02B8   ; 61EE   000B 020C 039C 02B8
        DECLE   $0004,  $0240,  $0130,  $0004   ; 61F2   0004 0240 0130 0004

        ANDR    R3,     R0                      ; 61F6   0198
        MOVR    R3,     R0                      ; 61F7   0098
        SDBD                                    ; 61F8   0001
        MVII    #$95A1, R4                      ; 61F9   02BC 00A1 0095
        SDBD                                    ; 61FC   0001
        MVII    #$3980, R1                      ; 61FD   02B9 0080 0039
        MVII    #$0060, R0                      ; 6200   02B8 0060

        JSR     R5,     .EXEC.730               ; 6202   0004 0114 0330
        DECLE   $0240,  $0020,  $0004           ; 6205   0240 0020 0004

        ANDR    R4,     R4                      ; 6208   01A4
        MOVR    R6,     R5                      ; 6209   00B5
        RLC     R3,     1                       ; 620A   0053
        MOVR    R4,     R5                      ; 620B   00A5
        MVII    #$0001, R0                      ; 620C   02B8 0001

        JSR     R5,     X_RAND1                 ; 620E   0004 0114 027D

        TSTR    R0                              ; 6211   0080
        BEQ     L_6217                          ; 6212   0204 0003

        JSR     R5,     L_6239                  ; 6214   0004 0160 0239

L_6217:
        MOVR    R7,     R1                      ; 6217   00B9
        ADDI    #$0076, R1                      ; 6218   02F9 0076
        MVO     R1,     G_034B                  ; 621A   0241 034B
        CLRR    R0                              ; 621C   01C0
        MVO     R0,     G_01AE                  ; 621D   0240 01AE
        MVO     R0,     G_01AD                  ; 621F   0240 01AD
        MVO     R0,     G_0131                  ; 6221   0240 0131
        MVII    #$0001, R0                      ; 6223   02B8 0001
        MVO     R0,     G_018B                  ; 6225   0240 018B
        MVO     R0,     G_018D                  ; 6227   0240 018D
        MVII    #$0010, R0                      ; 6229   02B8 0010
        MVO     R0,     G_018C                  ; 622B   0240 018C
        MVO     R0,     G_018E                  ; 622D   0240 018E
        SDBD                                    ; 622F   0001
        MVII    #$94B8, R4                      ; 6230   02BC 00B8 0094

        JSR     R5,     L_5D70                  ; 6233   0004 015C 0170

        J       L_5DB3                          ; 6236   0004 035C 01B3

L_6239:
        MVII    #$0236, R1                      ; 6239   02B9 0236
L_623B:
        MVI@    R1,     R0                      ; 623B   0288
        MOVR    R0,     R2                      ; 623C   0082
        SDBD                                    ; 623D   0001
        ANDI    #$1007, R2                      ; 623E   03BA 0007 0010
        CMPI    #$0002, R2                      ; 6241   037A 0002
        BEQ     L_6249                          ; 6243   0204 0004

        CMPI    #$0001, R2                      ; 6245   037A 0001
        BNEQ    L_624C                          ; 6247   020C 0003

L_6249:
        XORI    #$0003, R0                      ; 6249   03F8 0003
        MVO@    R0,     R1                      ; 624B   0248
L_624C:
        INCR    R1                              ; 624C   0009
        CMPI    #$029B, R1                      ; 624D   0379 029B
        BLE     L_623B                          ; 624F   0226 0015
        MOVR    R5,     R7                      ; 6251   00AF

        DECLE   $0004,  $0198,  $0115,  $0338   ; 6252   0004 0198 0115 0338
        DECLE   $000B,  $020C,  $0334,  $0280   ; 6256   000B 020C 0334 0280
        DECLE   $0131,  $0240,  $01AD,  $0280   ; 625A   0131 0240 01AD 0280
        DECLE   $011E,  $00BC,  $02FC,  $0033   ; 625E   011E 00BC 02FC 0033
        DECLE   $0004                           ; 6262   0004

        ANDR    R4,     R4                      ; 6263   01A4
        ADD@    R3,     R4                      ; 6264   02DC
        BNEQ    L_62E1                          ; 6265   020C 007A

        MOVR    R7,     R1                      ; 6267   00B9
        ADDI    #$0031, R1                      ; 6268   02F9 0031
        CMPI    #$0003, R0                      ; 626A   0378 0003
        BEQ     L_6271                          ; 626C   0204 0003

        MOVR    R7,     R1                      ; 626E   00B9
        ADDI    #$0035, R1                      ; 626F   02F9 0035
L_6271:
        MVO     R1,     G_034B                  ; 6271   0241 034B

        JSR     R5,     L_6287                  ; 6273   0004 0160 0287

        CLRR    R0                              ; 6276   01C0
        MVO     R0,     G_0131                  ; 6277   0240 0131
        MVII    #$0005, R0                      ; 6279   02B8 0005
        MVO     R0,     G_0130                  ; 627B   0240 0130
        SDBD                                    ; 627D   0001
        MVII    #$9508, R4                      ; 627E   02BC 0008 0095

        JSR     R5,     L_5D70                  ; 6281   0004 015C 0170

        J       L_5DB3                          ; 6284   0004 035C 01B3

L_6287:
        MVII    #$02CA, R4                      ; 6287   02BC 02CA
        MVII    #$0026, R0                      ; 6289   02B8 0026
        J       X_FILL_ZERO                     ; 628B   0004 0314 0338

        DECLE   $0002,  $02E4,  $02E8,  $0001   ; 628E   0002 02E4 02E8 0001
        DECLE   $0002,  $0005,  $0003,  $0005   ; 6292   0002 0005 0003 0005
        DECLE   $0006,  $0007,  $0008,  $0005   ; 6296   0006 0007 0008 0005

        ADD@    R3,     R7                      ; 629A   02DF

        ADD@    R4,     R2                      ; 629B   02E2
        ADD@    R4,     R5                      ; 629C   02E5
        ADD@    R5,     R0                      ; 629D   02E8
        ADD@    R5,     R3                      ; 629E   02EB
        COMR    R1                              ; 629F   0019
        NEGR    R3                              ; 62A0   0023
        GSWD    R2                              ; 62A1   0032
        SLL     R3,     1                       ; 62A2   004B
        MOVR    R2,     R6                      ; 62A3   0096
        CLRC                                    ; 62A4   0006
        ADD@    R3,     R6                      ; 62A5   02DE
        ADD@    R4,     R1                      ; 62A6   02E1
        ADD@    R4,     R4                      ; 62A7   02E4
        ADD@    R4,     R7                      ; 62A8   02E7

        DECLE   $02EA,  $02ED,  $000A,  $0019   ; 62A9   02EA 02ED 000A 0019
        DECLE   $0023,  $0028,  $0032,  $003C   ; 62AD   0023 0028 0032 003C
        DECLE   $0004                           ; 62B1   0004

        ANDR    R3,     R0                      ; 62B2   0198
        SUBR    R2,     R5                      ; 62B3   0115
        SUBI    #$000B, R0                      ; 62B4   0338 000B
        BNEQ    L_658D                          ; 62B6   020C 02D5

        MVO     R0,     G_0130                  ; 62B8   0240 0130
        MVI     G_0131, R0                      ; 62BA   0280 0131
        CMPI    #$0001, R0                      ; 62BC   0378 0001
        BGT     L_62CC                          ; 62BE   020E 000C

        JSR     R5,     L_5E04                  ; 62C0   0004 015C 0204
        JSR     R5,     L_59E5                  ; 62C3   0004 0158 01E5
        JSR     R5,     L_5B07                  ; 62C6   0004 0158 0307
        JSR     R5,     L_59EC                  ; 62C9   0004 0158 01EC

L_62CC:
        CLRR    R0                              ; 62CC   01C0
        B       L_6395                          ; 62CD   0200 00C6

        DECLE   $0004                           ; 62CF   0004

        ANDR    R3,     R0                      ; 62D0   0198
        SUBR    R2,     R5                      ; 62D1   0115
        SUBI    #$000B, R0                      ; 62D2   0338 000B
        BNEQ    L_658D                          ; 62D4   020C 02B7

        MVO     R0,     G_0130                  ; 62D6   0240 0130
        MVI     G_034B, R1                      ; 62D8   0281 034B
        ADD@    R1,     R1                      ; 62DA   02C9
        INCR    R1                              ; 62DB   0009
        ADD     G_0131, R1                      ; 62DC   02C1 0131
        MVI@    R1,     R0                      ; 62DE   0288
        MVO     R0,     G_0132                  ; 62DF   0240 0132
L_62E1:
        MVI     G_01AD, R0                      ; 62E1   0280 01AD
        TSTR    R0                              ; 62E3   0080
        BEQ     L_6313                          ; 62E4   0204 002D

        MVII    #$0006, R0                      ; 62E6   02B8 0006
        MVO     R0,     G_0130                  ; 62E8   0240 0130
        CLRR    R0                              ; 62EA   01C0
        MVO     R0,     G_0131                  ; 62EB   0240 0131

        JSR     R5,     L_6287                  ; 62ED   0004 0160 0287

        SDBD                                    ; 62F0   0001
        MVII    #$9554, R4                      ; 62F1   02BC 0054 0095

        JSR     R5,     L_5D70                  ; 62F4   0004 015C 0170

        MOVR    R7,     R1                      ; 62F7   00B9
        ADDI    #$0007, R1                      ; 62F8   02F9 0007
        MVO     R1,     G_034B                  ; 62FA   0241 034B
        J       L_5DB3                          ; 62FC   0004 035C 01B3

        DECLE   $0004,  $02E2,  $02E5,  $02E8   ; 62FF   0004 02E2 02E5 02E8
        DECLE   $02EB,  $0001,  $0003,  $0005   ; 6303   02EB 0001 0003 0005
        DECLE   $0007,  $0004                   ; 6307   0007 0004

        ANDR    R3,     R0                      ; 6309   0198
        SUBR    R2,     R5                      ; 630A   0115
        SUBI    #$000B, R0                      ; 630B   0338 000B
        BNEQ    L_658D                          ; 630D   020C 027E

        MVI     G_0131, R0                      ; 630F   0280 0131
        MVO     R0,     G_0133                  ; 6311   0240 0133
L_6313:
        CLRR    R0                              ; 6313   01C0
        MVO     R0,     G_0130                  ; 6314   0240 0130
        J       L_6C41                          ; 6316   0004 036C 0041

        DECLE   $0004,  $0198,  $0115,  $0338   ; 6319   0004 0198 0115 0338
        DECLE   $000B,  $020C,  $026D,  $0240   ; 631D   000B 020C 026D 0240
        DECLE   $0130,  $0004,  $0198,  $00E2   ; 6321   0130 0004 0198 00E2
        DECLE   $0004,  $0158,  $01C5           ; 6325   0004 0158 01C5

        MVI     G_01AE, R1                      ; 6328   0281 01AE
        ADDI    #$0136, R1                      ; 632A   02F9 0136
        MVI@    R1,     R0                      ; 632C   0288
        CMP     G_0133, R0                      ; 632D   0340 0133
        BLE     L_6371                          ; 632F   0206 0040

        MVII    #$0002, R0                      ; 6331   02B8 0002

        JSR     R5,     L_5CC6                  ; 6333   0004 015C 00C6
        DECLE   $0007,  $022D,  $0057,  $0068   ; 6336   0007 022D 0057 0068
        DECLE   $0061,  $0074,  $0020,  $006E   ; 633A   0061 0074 0020 006E
        DECLE   $0065,  $0078,  $0074,  $003F   ; 633E   0065 0078 0074 003F
        DECLE   $0001,  $0003,  $023F,  $0050   ; 6342   0001 0003 023F 0050
        DECLE   $006C,  $0061,  $0079,  $0020   ; 6346   006C 0061 0079 0020
        DECLE   $0073,  $0061,  $006D,  $0065   ; 634A   0073 0061 006D 0065
        DECLE   $0020,  $0067,  $0061,  $006D   ; 634E   0020 0067 0061 006D
        DECLE   $0065,  $0000                   ; 6352   0065 0000

        MVO@    R0,     R2                      ; 6354   0250
        RLC     R0,     1                       ; 6355   0050
        SAR     R0,     2                       ; 6356   006C
        SLR     R1,     1                       ; 6357   0061
        SARC    R1,     1                       ; 6358   0079
        NEGR    R0                              ; 6359   0020
        SLR     R0,     2                       ; 635A   0064
        SAR     R1,     1                       ; 635B   0069
        SLR     R2,     2                       ; 635C   0066
        SLR     R2,     2                       ; 635D   0066
        SLR     R1,     2                       ; 635E   0065
        RRC     R2,     1                       ; 635F   0072
        SLR     R1,     2                       ; 6360   0065
        SAR     R2,     2                       ; 6361   006E
        RRC     R0,     2                       ; 6362   0074
        NEGR    R0                              ; 6363   0020
        SLR     R3,     2                       ; 6364   0067
        SLR     R1,     1                       ; 6365   0061
        SAR     R1,     2                       ; 6366   006D
        SLR     R1,     2                       ; 6367   0065
        EIS                                     ; 6368   0002
        MVI     G_0131, R0                      ; 6369   0280 0131
        ANDI    #$0001, R0                      ; 636B   03B8 0001
        BNEQ    L_61D9                          ; 636D   022C 0195
        B       L_6313                          ; 636F   0220 005D

L_6371:
        MVI     G_011E, R1                      ; 6371   0281 011E
        CMPI    #$0000, R1                      ; 6373   0379 0000
        BEQ     L_637B                          ; 6375   0204 0004

        CMPI    #$0004, R1                      ; 6377   0379 0004
        BNEQ    L_6381                          ; 6379   020C 0006

L_637B:
        MVI     G_01AE, R0                      ; 637B   0280 01AE
        XORI    #$0001, R0                      ; 637D   03F8 0001
        MVO     R0,     G_01AE                  ; 637F   0240 01AE
L_6381:
        J       L_6C48                          ; 6381   0004 036C 0048

        DECLE   $0004                           ; 6384   0004

        ANDR    R3,     R0                      ; 6385   0198
        SUBR    R2,     R5                      ; 6386   0115
        MVI     G_035C, R5                      ; 6387   0285 035C
        TSTR    R5                              ; 6389   00AD
        BEQ     L_639C                          ; 638A   0204 0010

        MVI     G_0118, R4                      ; 638C   0284 0118
        TSTR    R4                              ; 638E   00A4
        BNEQ    L_639C                          ; 638F   020C 000B

        SUBI    #$000B, R0                      ; 6391   0338 000B
        BNEQ    L_658D                          ; 6393   020C 01F8

L_6395:
        MVI     G_035C, R5                      ; 6395   0285 035C
        MVO     R0,     G_035C                  ; 6397   0240 035C
        MVO     R0,     G_0118                  ; 6399   0240 0118
        MOVR    R5,     R7                      ; 639B   00AF

L_639C:
        CMPI    #$000A, R0                      ; 639C   0378 000A
        BLT     L_658D                          ; 639E   0205 01ED

        MVI     G_011D, R5                      ; 63A0   0285 011D
        TSTR    R5                              ; 63A2   00AD
        BEQ     L_658D                          ; 63A3   0204 01E8

        MVO     R0,     G_0131                  ; 63A5   0240 0131
        MVI     G_011D, R5                      ; 63A7   0285 011D
        CMPI    #$0006, R5                      ; 63A9   037D 0006
        BNEQ    L_63B1                          ; 63AB   020C 0004

        SUBI    #$000B, R0                      ; 63AD   0338 000B
        BPL     L_658D                          ; 63AF   0203 01DC

L_63B1:
        MOVR    R7,     R0                      ; 63B1   00B8
        ADDI    #$01F4, R0                      ; 63B2   02F8 01F4

        JSR     R5,     L_65DE                  ; 63B4   0004 0164 01DE

        MVI     G_011D, R1                      ; 63B7   0281 011D
        INCR    R1                              ; 63B9   0009
        ADDR    R7,     R1                      ; 63BA   00F9
        ADD@    R1,     R7                      ; 63BB   02CF

        DECLE   $00C4,  $0007,  $008B,  $005D   ; 63BC   00C4 0007 008B 005D
        DECLE   $0067,  $00B9,  $00C1,  $0280   ; 63C0   0067 00B9 00C1 0280
        DECLE   $011E,  $0378,  $0005,  $020D   ; 63C4   011E 0378 0005 020D
        DECLE   $00B7,  $0004,  $0198,  $00D1   ; 63C8   00B7 0004 0198 00D1
        DECLE   $0000,  $02FD,  $0318,  $00AA   ; 63CC   0000 02FD 0318 00AA
        DECLE   $0290,  $02BB,  $0001,  $0253   ; 63D0   0290 02BB 0001 0253
        DECLE   $02FA,  $0011,  $0291,  $0283   ; 63D4   02FA 0011 0291 0283
        DECLE   $011B,  $03BB,  $0040,  $0204   ; 63D8   011B 03BB 0040 0204
        DECLE   $000D,  $0001,  $0378,  $003F   ; 63DC   000D 0001 0378 003F
        DECLE   $000F,  $0206,  $0007           ; 63E0   000F 0206 0007

        SDBD                                    ; 63E3   0001
        MVII    #$0F00, R0                      ; 63E4   02B8 0000 000F
        MVO@    R0,     R5                      ; 63E7   0268
        B       L_6443                          ; 63E8   0200 0059

        DECLE   $0004,  $0198,  $014E,  $0204   ; 63EA   0004 0198 014E 0204
        DECLE   $001C,  $0338,  $0040,  $0001   ; 63EE   001C 0338 0040 0001
        DECLE   $0378,  $0080,  $0006,  $022D   ; 63F2   0378 0080 0006 022D
        DECLE   $000C,  $02F8,  $0040,  $0339   ; 63F6   000C 02F8 0040 0339
        DECLE   $0040,  $0001,  $0379,  $0040   ; 63FA   0040 0001 0379 0040
        DECLE   $0008,  $022D,  $0016,  $0001   ; 63FE   0008 022D 0016 0001
        DECLE   $02B8,  $0080,  $0025,  $0001   ; 6402   02B8 0080 0025 0001
        DECLE   $02B9,  $0080,  $0016,  $0220   ; 6406   02B9 0080 0016 0220
        DECLE   $0020,  $0270,  $0004,  $0198   ; 640A   0020 0270 0004 0198
        DECLE   $00D1,  $0000                   ; 640E   00D1 0000

        PULR    R0                              ; 6410   02B0
        ADDI    #$0318, R5                      ; 6411   02FD 0318
        MVO@    R0,     R5                      ; 6413   0268
        ADDI    #$0010, R5                      ; 6414   02FD 0010
        MVO@    R1,     R5                      ; 6416   0269
        B       L_6480                          ; 6417   0200 0067

        MVI     G_011F, R0                      ; 6419   0280 011F
        ANDI    #$0007, R0                      ; 641B   03B8 0007
        XORI    #$0080, R0                      ; 641D   03F8 0080
        MVO     R0,     G_011F                  ; 641F   0240 011F
        B       L_6480                          ; 6421   0200 005D

        DECLE   $0283,  $0328,  $0243,  $034B   ; 6423   0283 0328 0243 034B
        DECLE   $0281,  $0339,  $0241,  $034C   ; 6427   0281 0339 0241 034C
        DECLE   $01ED,  $0245,  $0135,  $0285   ; 642B   01ED 0245 0135 0285
        DECLE   $011B,  $03BD,  $0040,  $0204   ; 642F   011B 03BD 0040 0204
        DECLE   $0041,  $0004,  $0198,  $00D1   ; 6433   0041 0004 0198 00D1
        DECLE   $0000                           ; 6437   0000

        ADDI    #$0318, R5                      ; 6438   02FD 0318
        SUB@    R5,     R3                      ; 643A   032B
        BPL     L_6475                          ; 643B   0203 0038

        DECR    R5                              ; 643D   0015
        MVI@    R5,     R0                      ; 643E   02A8
        ADDI    #$0100, R0                      ; 643F   02F8 0100
        MVO     R0,     G_034B                  ; 6441   0240 034B
L_6443:
        MVI     G_011D, R1                      ; 6443   0281 011D
        B       L_649C                          ; 6445   0200 0055

        MVI     G_0119, R0                      ; 6447   0280 0119
        ANDI    #$000F, R0                      ; 6449   03B8 000F
        MVO     R0,     G_0119                  ; 644B   0240 0119
        MVI     G_0131, R5                      ; 644D   0285 0131
        CMPI    #$000A, R5                      ; 644F   037D 000A
        BEQ     L_6457                          ; 6451   0204 0004

        JSR     R5,     L_5AED                  ; 6453   0004 0158 02ED
        DECLE   $0222                           ; 6456   0222
L_6457:
        MVI     G_011E, R1                      ; 6457   0281 011E
        CMPI    #$0002, R1                      ; 6459   0379 0002
        BEQ     L_6475                          ; 645B   0204 0018

        MVI     G_011F, R5                      ; 645D   0285 011F
        ANDI    #$000F, R5                      ; 645F   03BD 000F
        MVO     R5,     G_011F                  ; 6461   0245 011F
        MVI     G_0119, R0                      ; 6463   0280 0119
        MVI     G_011B, R1                      ; 6465   0281 011B
        SDBD                                    ; 6467   0001
        ANDI    #$FFFB, R1                      ; 6468   03B9 00FB 00FF
        TSTR    R0                              ; 646B   0080
        BEQ     L_6470                          ; 646C   0204 0002

        XORI    #$0004, R1                      ; 646E   03F9 0004
L_6470:
        MVO     R1,     G_011B                  ; 6470   0241 011B

        JSR     R5,     L_59EC                  ; 6472   0004 0158 01EC

L_6475:
        MVII    #$0001, R0                      ; 6475   02B8 0001
        MVO     R0,     G_0328                  ; 6477   0240 0328
        MVO     R0,     G_0339                  ; 6479   0240 0339
        B       L_6480                          ; 647B   0200 0003

        CLRR    R0                              ; 647D   01C0
        MVO     R0,     G_0116                  ; 647E   0240 0116
L_6480:
        MVI     G_0131, R0                      ; 6480   0280 0131
L_6482:
        MVII    #$0001, R3                      ; 6482   02BB 0001
        CMPI    #$000B, R0                      ; 6484   0378 000B
        BEQ     L_6489                          ; 6486   0204 0001

        NEGR    R3                              ; 6488   0023
L_6489:
        MVI     G_011B, R1                      ; 6489   0281 011B
        TSTR    R1                              ; 648B   0089
        BEQ     L_658D                          ; 648C   0204 00FF

        MVI     G_011D, R1                      ; 648E   0281 011D
L_6490:
        ADDR    R3,     R1                      ; 6490   00D9
        BNEQ    L_6496                          ; 6491   020C 0003

        NEGR    R3                              ; 6493   0023
        B       L_6490                          ; 6494   0220 0005

L_6496:
        CMPI    #$0006, R1                      ; 6496   0379 0006
        BLE     L_649C                          ; 6498   0206 0002

        MVII    #$0006, R1                      ; 649A   02B9 0006
L_649C:
        MOVR    R1,     R2                      ; 649C   008A
        DECLE   $0012,  $00FA,  $02FA,  $00EF   ; 649D   0012 00FA 02FA 00EF
        DECLE   $0290,  $0380,  $011B,  $0224   ; 64A1   0290 0380 011B 0224
        DECLE   $0015,  $0241,  $011D,  $0011   ; 64A5   0015 0241 011D 0011
        DECLE   $0271,  $00C9,  $02F1,  $00F9   ; 64A9   0271 00C9 02F1 00F9
        DECLE   $02F9,  $00E7,  $0004           ; 64AD   02F9 00E7 0004

        ANDR    R3,     R0                      ; 64B0   0198
        MOVR    R3,     R0                      ; 64B1   0098
        MOVR    R1,     R5                      ; 64B2   008D
        MVI@    R5,     R0                      ; 64B3   02A8
        SDBD                                    ; 64B4   0001
        MVI@    R5,     R4                      ; 64B5   02AC
        SDBD                                    ; 64B6   0001
        MVII    #$3920, R1                      ; 64B7   02B9 0020 0039

        JSR     R5,     .EXEC.730               ; 64BA   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 64BD   0240 0020
        MVI     G_011D, R0                      ; 64BF   0280 011D
        SLL     R0,     2                       ; 64C1   004C
        SLL     R0,     1                       ; 64C2   0048
        ADDR    R7,     R0                      ; 64C3   00F8
        ADDI    #$00E2, R0                      ; 64C4   02F8 00E2

        JSR     R5,     L_65DE                  ; 64C6   0004 0164 01DE

        MVI     G_011D, R1                      ; 64C9   0281 011D
        INCR    R1                              ; 64CB   0009
        ADDR    R7,     R1                      ; 64CC   00F9
        ADD@    R1,     R7                      ; 64CD   02CF

        DECLE   $00BF                           ; 64CE   00BF
L_64CF:
        DECR    R7                              ; 64CF   0017
        INCR    R7                              ; 64D0   000F

        ADCR    R1                              ; 64D1   0029
L_64D2:
        GSWD    R3                              ; 64D2   0033
        SLR     R0,     2                       ; 64D3   0064
        SAR     R3,     2                       ; 64D4   006F
L_64D5:
        CLRR    R0                              ; 64D5   01C0
        MVO     R0,     .BTAB.22                ; 64D6   0240 0222
        MVO     R0,     .BTAB.23                ; 64D8   0240 0223
        MVO     R0,     .BTAB.24                ; 64DA   0240 0224
        MOVR    R5,     R7                      ; 64DC   00AF

        MVI     G_0119, R0                      ; 64DD   0280 0119
        ANDI    #$000F, R0                      ; 64DF   03B8 000F
        XORI    #$0080, R0                      ; 64E1   03F8 0080
        MVO     R0,     G_0119                  ; 64E3   0240 0119

        JSR     R5,     L_64D5                  ; 64E5   0004 0164 00D5

        MVI     G_011B, R0                      ; 64E8   0280 011B
        ANDI    #$0002, R0                      ; 64EA   03B8 0002
        BEQ     L_6588                          ; 64EC   0204 009A

        JSR     R5,     L_5AA1                  ; 64EE   0004 0158 02A1
        JSR     R5,     L_5AED                  ; 64F1   0004 0158 02ED
        DECLE   $021D                           ; 64F4   021D

        B       L_6588                          ; 64F5   0200 0091

        MVI     G_011F, R0                      ; 64F7   0280 011F
        ANDI    #$0007, R0                      ; 64F9   03B8 0007
        XORI    #$0040, R0                      ; 64FB   03F8 0040
        MVO     R0,     G_011F                  ; 64FD   0240 011F
        B       L_6588                          ; 64FF   0200 0087

        DECLE   $0280,  $034B,  $0281,  $034C   ; 6501   0280 034B 0281 034C
        DECLE   $0080,  $020C,  $001E,  $0280   ; 6505   0080 020C 001E 0280
        DECLE   $0119,  $0080,  $020C,  $000A   ; 6509   0119 0080 020C 000A

        SDBD                                    ; 650D   0001
        MVII    #$1700, R0                      ; 650E   02B8 0000 0017
        SDBD                                    ; 6511   0001
        MVII    #$1000, R1                      ; 6512   02B9 0000 0010
        B       L_6526                          ; 6515   0200 000F

        DECLE   $0004                           ; 6517   0004

        ANDR    R3,     R0                      ; 6518   0198
        ADDR    R2,     R2                      ; 6519   00D2
        ADDI    #$0318, R5                      ; 651A   02FD 0318
        MVI@    R5,     R0                      ; 651C   02A8
        ADDI    #$0010, R5                      ; 651D   02FD 0010
        MVI@    R5,     R1                      ; 651F   02A9
        MVII    #$00FF, R2                      ; 6520   02BA 00FF
        SWAP    R2,     1                       ; 6522   0042
        SLR     R2,     2                       ; 6523   0066
        ANDR    R2,     R0                      ; 6524   0190
        ANDR    R2,     R1                      ; 6525   0191
L_6526:
        MVO     R0,     G_0328                  ; 6526   0240 0328
        MVO     R1,     G_0339                  ; 6528   0241 0339
        SDBD                                    ; 652A   0001
        MVII    #$0867, R0                      ; 652B   02B8 0067 0008
        MVO     R0,     G_034A                  ; 652E   0240 034A
        B       L_6588                          ; 6530   0200 0056

        SDBD                                    ; 6532   0001
        MVII    #$1805, R0                      ; 6533   02B8 0005 0018
        MVO     R0,     G_034A                  ; 6536   0240 034A

        JSR     R5,     L_5EE3                  ; 6538   0004 015C 02E3

        B       L_6588                          ; 653B   0200 004B

        DECLE   $0004                           ; 653D   0004

        ANDR    R3,     R0                      ; 653E   0198
        MOVR    R3,     R0                      ; 653F   0098
        SDBD                                    ; 6540   0001
        MVII    #$3860, R1                      ; 6541   02B9 0060 0038
        SDBD                                    ; 6544   0001
        MVII    #$9060, R4                      ; 6545   02BC 0060 0090
        MVII    #$0008, R0                      ; 6548   02B8 0008

        JSR     R5,     .EXEC.730               ; 654A   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 654D   0240 0020
        CLRR    R0                              ; 654F   01C0
        MVO     R0,     G_0115                  ; 6550   0240 0115
        INCR    R0                              ; 6552   0008
        MVO     R0,     G_0116                  ; 6553   0240 0116
        MVII    #$0010, R1                      ; 6555   02B9 0010
        SDBD                                    ; 6557   0001
        MVII    #$184F, R0                      ; 6558   02B8 004F 0018
        MVO     R0,     .BTAB.07                ; 655B   0240 0207
        ADDR    R1,     R0                      ; 655D   00C8
        MVO     R0,     .BTAB.08                ; 655E   0240 0208
        ADDR    R1,     R0                      ; 6560   00C8
        MVO     R0,     .BTAB.0B                ; 6561   0240 020B
        ADDR    R1,     R0                      ; 6563   00C8
        MVO     R0,     .BTAB.0C                ; 6564   0240 020C
        SDBD                                    ; 6566   0001
        MVII    #$19B8, R0                      ; 6567   02B8 00B8 0019
        MVO     R0,     .BTAB.1C                ; 656A   0240 021C
        ADDI    #$0008, R0                      ; 656C   02F8 0008
        MVO     R0,     .BTAB.1D                ; 656E   0240 021D
        ADDI    #$0008, R0                      ; 6570   02F8 0008
        MVO     R0,     .BTAB.1E                ; 6572   0240 021E
        ADDI    #$0008, R0                      ; 6574   02F8 0008
        MVO     R0,     .BTAB.1F                ; 6576   0240 021F
        MVII    #$004B, R0                      ; 6578   02B8 004B
        MVO     R0,     G_0328                  ; 657A   0240 0328
        SDBD                                    ; 657C   0001
        MVII    #$0600, R0                      ; 657D   02B8 0000 0006
        MVO     R0,     G_0339                  ; 6580   0240 0339
        SDBD                                    ; 6582   0001
        MVII    #$1865, R0                      ; 6583   02B8 0065 0018
        MVO     R0,     G_034A                  ; 6586   0240 034A

L_6588:
        JSR     R5,     L_6FA0                  ; 6588   0004 016C 03A0
        BIDECLE $A2C4                           ; 658B   00C4 00A2
L_658D:
        PULR    R7                              ; 658D   02B7

        DECLE   $0001,  $0002,  $0004,  $0008   ; 658E   0001 0002 0004 0008
        DECLE   $0010,  $0020,  $0038,  $00D8   ; 6592   0010 0020 0038 00D8
        DECLE   $0090,  $0030,  $0010,  $0091   ; 6596   0090 0030 0010 0091
        DECLE   $0040,  $0020,  $0091,  $0010   ; 659A   0040 0020 0091 0010
        DECLE   $0090,  $0091,  $0030,  $0060   ; 659E   0090 0091 0030 0060
        DECLE   $0091,  $0020,  $00A0,  $0091   ; 65A2   0091 0020 00A0 0091
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AA   0000 0000 0000 0000
        DECLE   $0124,  $0125,  $0126,  $0000   ; 65AE   0124 0125 0126 0000

        SUBR    R4,     R7                      ; 65B2   0127

        SUBR    R5,     R0                      ; 65B3   0128
        SUBR    R5,     R1                      ; 65B4   0129
        SUBR    R5,     R2                      ; 65B5   012A
        SUBR    R4,     R6                      ; 65B6   0126
        SUBR    R4,     R7                      ; 65B7   0127

        DECLE   $0128,  $0129,  $0000,  $0124   ; 65B8   0128 0129 0000 0124
        DECLE   $0125,  $0000                   ; 65BC   0125 0000

        SUBR    R4,     R4                      ; 65BE   0124
        SUBR    R4,     R5                      ; 65BF   0125
        SUBR    R4,     R6                      ; 65C0   0126
        SUBR    R4,     R7                      ; 65C1   0127

        DECLE   $0128,  $0129,  $012A,  $012B   ; 65C2   0128 0129 012A 012B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C6   0000 0000 0000 0000
        DECLE   $0000,  $0124,  $0125,  $0000   ; 65CA   0000 0124 0125 0000

        SUBR    R4,     R4                      ; 65CE   0124
        SUBR    R4,     R5                      ; 65CF   0125
        SUBR    R4,     R6                      ; 65D0   0126
        SUBR    R4,     R7                      ; 65D1   0127

        DECLE   $0000,  $0128,  $0129,  $0000   ; 65D2   0000 0128 0129 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D6   0000 0000 0000 0000

        SUBR    R4,     R4                      ; 65DA   0124
        SUBR    R4,     R5                      ; 65DB   0125
        SUBR    R4,     R6                      ; 65DC   0126
        SUBR    R4,     R7                      ; 65DD   0127

L_65DE:
        PSHR    R5                              ; 65DE   0275
        MOVR    R0,     R4                      ; 65DF   0084
        MVII    #$0203, R5                      ; 65E0   02BD 0203
L_65E2:
        MVII    #$0004, R3                      ; 65E2   02BB 0004
L_65E4:
        MVI@    R4,     R0                      ; 65E4   02A0
        SLL     R0,     2                       ; 65E5   004C
        SLL     R0,     1                       ; 65E6   0048
        XORI    #$0007, R0                      ; 65E7   03F8 0007
        MVO@    R0,     R5                      ; 65E9   0268
        DECR    R3                              ; 65EA   0013
        BNEQ    L_65E4                          ; 65EB   022C 0008

        ADDI    #$0010, R5                      ; 65ED   02FD 0010
        CMPI    #$0228, R5                      ; 65EF   037D 0228
        BLT     L_65E2                          ; 65F1   0225 0010

        MVII    #$0207, R4                      ; 65F3   02BC 0207
        MVII    #$0006, R0                      ; 65F5   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 65F7   0004 0114 0338

        MVII    #$021B, R4                      ; 65FA   02BC 021B

        JSR     R5,     X_FILL_ZERO             ; 65FC   0004 0114 0338

        PULR    R7                              ; 65FF   02B7

        DECLE   $0275,  $0004,  $0198,  $0100   ; 6600   0275 0004 0198 0100
        DECLE   $0004                           ; 6604   0004

        ANDR    R3,     R0                      ; 6605   0198
        SUBR    R2,     R5                      ; 6606   0115
        MVI     G_011D, R0                      ; 6607   0280 011D
        CMPI    #$0006, R0                      ; 6609   0378 0006
        BNEQ    L_6697                          ; 660B   020C 008A

        MVI     G_011B, R5                      ; 660D   0285 011B
        MVO     R5,     G_011C                  ; 660F   0245 011C
        CLRR    R5                              ; 6611   01ED
        MVO     R5,     G_0116                  ; 6612   0245 0116
        MVO     R5,     G_011D                  ; 6614   0245 011D
        MVO     R5,     G_011B                  ; 6616   0245 011B
        MVO     R5,     G_018A                  ; 6618   0245 018A
        MVII    #$018B, R4                      ; 661A   02BC 018B
        MVII    #$0011, R0                      ; 661C   02B8 0011

        JSR     R5,     X_FILL_ZERO             ; 661E   0004 0114 0338
        DECLE   $0280,  $011E,  $0378,  $0005   ; 6621   0280 011E 0378 0005
        DECLE   $0205,  $0008,  $0004,  $0198   ; 6625   0205 0008 0004 0198
        DECLE   $00D1,  $000E,  $00A8,  $0004   ; 6629   00D1 000E 00A8 0004

        ANDR    R3,     R0                      ; 662D   0198
        ADDR    R5,     R6                      ; 662E   00EE

        JSR     R5,     L_5B07                  ; 662F   0004 0158 0307
        DECLE   $0004,  $0198,  $00BC,  $001E   ; 6632   0004 0198 00BC 001E
        DECLE   $0280,  $0115,  $03B8,  $007F   ; 6636   0280 0115 03B8 007F
        DECLE   $004C,  $02F8,  $0013,  $0240   ; 663A   004C 02F8 0013 0240
        DECLE   $0117,  $01ED,  $0245,  $0115   ; 663E   0117 01ED 0245 0115
        DECLE   $0001,  $02B8,  $00C0,  $0012   ; 6642   0001 02B8 00C0 0012
        DECLE   $0240,  $0328,  $0004,  $0198   ; 6646   0240 0328 0004 0198
        DECLE   $00BC,  $0006,  $0284,  $0117   ; 664A   00BC 0006 0284 0117
        DECLE   $0280,  $034B,  $0281,  $034C   ; 664E   0280 034B 0281 034C
        DECLE   $0004,  $0198,  $01CA,  $02FD   ; 6652   0004 0198 01CA 02FD
        DECLE   $0318,  $02AA,  $02FD,  $0010   ; 6656   0318 02AA 02FD 0010
        DECLE   $02AB,  $0274,  $004C,  $0040   ; 665A   02AB 0274 004C 0040
        DECLE   $03B8,  $00FF,  $004D,  $0041   ; 665E   03B8 00FF 004D 0041
        DECLE   $03B9,  $00FF,  $004E,  $0042   ; 6662   03B9 00FF 004E 0042
        DECLE   $03BA,  $00FF,  $004F,  $0043   ; 6666   03BA 00FF 004F 0043
        DECLE   $03BB,  $00FF,  $0004           ; 666A   03BB 00FF 0004

        ANDR    R3,     R0                      ; 666D   0198
        SUBR    R3,     R4                      ; 666E   011C
        MOVR    R0,     R4                      ; 666F   0084
        MOVR    R2,     R0                      ; 6670   0090
        PULR    R1                              ; 6671   02B1
        PSHR    R1                              ; 6672   0271

        JSR     R5,     X_MPY                   ; 6673   0004 011C 01DC

        MOVR    R2,     R1                      ; 6676   0091
        MOVR    R4,     R2                      ; 6677   00A2

        JSR     R5,     X_DIVR                  ; 6678   0004 011C 01F8

        MVO     R0,     G_01B1                  ; 667B   0240 01B1
        MOVR    R3,     R0                      ; 667D   0098
        PULR    R1                              ; 667E   02B1

        JSR     R5,     X_MPY                   ; 667F   0004 011C 01DC

        MOVR    R2,     R1                      ; 6682   0091
        MOVR    R4,     R2                      ; 6683   00A2

        JSR     R5,     X_DIVR                  ; 6684   0004 011C 01F8
        DECLE   $0240,  $01B2,  $0004           ; 6687   0240 01B2 0004

        ANDR    R3,     R0                      ; 668A   0198
        XORR    R1,     R2                      ; 668B   01CA
        ADDI    #$015E, R5                      ; 668C   02FD 015E
        MVI     G_01B1, R1                      ; 668E   0281 01B1
        MVO@    R1,     R5                      ; 6690   0269
        ADDI    #$0010, R5                      ; 6691   02FD 0010
        MVO@    R0,     R5                      ; 6693   0268

        JSR     R5,     L_5606                  ; 6694   0004 0154 0206

L_6697:
        PULR    R7                              ; 6697   02B7

        DECLE   $0275,  $0004                   ; 6698   0275 0004

        ANDR    R3,     R0                      ; 669A   0198
        SUBR    R0,     R0                      ; 669B   0100
        MVI     G_0130, R2                      ; 669C   0282 0130
        DECR    R2                              ; 669E   0012
        BMI     L_66FF                          ; 669F   020B 005E

        INCR    R2                              ; 66A1   000A
        ADDR    R7,     R2                      ; 66A2   00FA
        ADD@    R2,     R7                      ; 66A3   02D7

        SETC                                    ; 66A4   0007
        INCR    R2                              ; 66A5   000A
        SLL     R2,     1                       ; 66A6   004A
        ADCR    R2                              ; 66A7   002A
        ADCR    R2                              ; 66A8   002A
        ADCR    R2                              ; 66A9   002A
        SUBR    R2,     R6                      ; 66AA   0116
        J       L_61D4                          ; 66AB   0004 0360 01D4

        DECLE   $0004                           ; 66AE   0004

        ANDR    R3,     R0                      ; 66AF   0198
        SUBR    R2,     R5                      ; 66B0   0115
        MVII    #$0001, R1                      ; 66B1   02B9 0001
        CMPI    #$0008, R0                      ; 66B3   0378 0008
        BGT     L_66B8                          ; 66B5   020E 0001

        NEGR    R1                              ; 66B7   0021
L_66B8:
        ADD     G_011E, R1                      ; 66B8   02C1 011E
        BPL     L_66BE                          ; 66BA   0203 0002

        MVII    #$0008, R1                      ; 66BC   02B9 0008
L_66BE:
        CMPI    #$0008, R1                      ; 66BE   0379 0008
        BLE     L_66C3                          ; 66C0   0206 0001

        CLRR    R1                              ; 66C2   01C9
L_66C3:
        MVO     R1,     G_011E                  ; 66C3   0241 011E

        JSR     R5,     L_5D16                  ; 66C5   0004 015C 0116
L_66C8:
        JSR     R5,     L_6FA0                  ; 66C8   0004 016C 03A0
        BIDECLE $A2C9                           ; 66CB   00C9 00A2

        PULR    R7                              ; 66CD   02B7

        DECLE   $0004                           ; 66CE   0004

        ANDR    R3,     R0                      ; 66CF   0198
        SUBR    R2,     R5                      ; 66D0   0115
        SUBI    #$0004, R0                      ; 66D1   0338 0004
        ANDI    #$000F, R0                      ; 66D3   03B8 000F
        MVII    #$0001, R1                      ; 66D5   02B9 0001
        CMPI    #$0008, R0                      ; 66D7   0378 0008
        BGT     L_66DC                          ; 66D9   020E 0001

        NEGR    R1                              ; 66DB   0021
L_66DC:
        MVI     G_034B, R5                      ; 66DC   0285 034B
        MVI@    R5,     R5                      ; 66DE   02AD
        DECR    R5                              ; 66DF   0015
        ADD     G_0131, R1                      ; 66E0   02C1 0131
        BPL     L_66E5                          ; 66E2   0203 0001

        MOVR    R5,     R1                      ; 66E4   00A9
L_66E5:
        CMPR    R5,     R1                      ; 66E5   0169
        BLE     L_66E9                          ; 66E6   0206 0001

        CLRR    R1                              ; 66E8   01C9
L_66E9:
        MVO     R1,     G_0131                  ; 66E9   0241 0131
        J       L_5DB3                          ; 66EB   0004 035C 01B3

        DECLE   $0004                           ; 66EE   0004

        ANDR    R3,     R0                      ; 66EF   0198
        SUBR    R2,     R5                      ; 66F0   0115
        MVI     G_0131, R0                      ; 66F1   0280 0131
        XORI    #$0001, R0                      ; 66F3   03F8 0001
        MVO     R0,     G_0131                  ; 66F5   0240 0131

        JSR     R5,     L_6FA0                  ; 66F7   0004 016C 03A0
        BIDECLE $A2C9                           ; 66FA   00C9 00A2

        J       L_5CF6                          ; 66FC   0004 035C 00F6

L_66FF:
        MVI     G_011D, R1                      ; 66FF   0281 011D
        INCR    R1                              ; 6701   0009
        ADDR    R7,     R1                      ; 6702   00F9
        ADD@    R1,     R7                      ; 6703   02CF

        DECLE   $00B6,  $0007,  $0042,  $004E   ; 6704   00B6 0007 0042 004E
        DECLE   $007F,  $00B7,  $00B6,  $0285   ; 6708   007F 00B7 00B6 0285
        DECLE   $011E,  $037D,  $0005,  $0205   ; 670C   011E 037D 0005 0205
        DECLE   $0072,  $0004,  $0198,  $0115   ; 6710   0072 0004 0198 0115
        DECLE   $0004                           ; 6714   0004

        ANDR    R3,     R0                      ; 6715   0198
        XORR    R1,     R2                      ; 6716   01CA
        MVII    #$03C0, R1                      ; 6717   02B9 03C0
        ADDI    #$0329, R5                      ; 6719   02FD 0329
        MVI@    R5,     R0                      ; 671B   02A8
        SDBD                                    ; 671C   0001
        CMPI    #$1000, R0                      ; 671D   0378 0000 0010
        BLT     L_6723                          ; 6720   0205 0001

        NEGR    R1                              ; 6722   0021
L_6723:
        ADDR    R1,     R0                      ; 6723   00C8
        DECLE   $0015,  $0268,  $0004,  $0198   ; 6724   0015 0268 0004 0198
        DECLE   $01DA,  $0285,  $011E,  $037D   ; 6728   01DA 0285 011E 037D
        DECLE   $0007,  $020C,  $008B,  $0280   ; 672C   0007 020C 008B 0280
        DECLE   $01AE,  $03F8,  $0001,  $0004   ; 6730   01AE 03F8 0001 0004

        ANDR    R3,     R0                      ; 6734   0198
        ADDR    R2,     R2                      ; 6735   00D2
        MVII    #$03C0, R1                      ; 6736   02B9 03C0
        ADDI    #$0329, R5                      ; 6738   02FD 0329
        MVI@    R5,     R0                      ; 673A   02A8
        SDBD                                    ; 673B   0001
        CMPI    #$1000, R0                      ; 673C   0378 0000 0010
        BLT     L_6742                          ; 673F   0205 0001

        NEGR    R1                              ; 6741   0021
L_6742:
        ADDR    R1,     R0                      ; 6742   00C8
        DECR    R5                              ; 6743   0015
        MVO@    R0,     R5                      ; 6744   0268
        PULR    R7                              ; 6745   02B7

        DECLE   $0004                           ; 6746   0004

        ANDR    R3,     R0                      ; 6747   0198
        SUBR    R2,     R5                      ; 6748   0115

        JSR     R5,     L_5A49                  ; 6749   0004 0158 0249
        JSR     R5,     L_5AED                  ; 674C   0004 0158 02ED
        DECLE   $021D                           ; 674F   021D

        B       L_66C8                          ; 6750   0220 0089

        DECLE   $0004                           ; 6752   0004

        ANDR    R3,     R0                      ; 6753   0198
        SUBR    R2,     R5                      ; 6754   0115
        INCR    R0                              ; 6755   0008
        SLR     R0,     2                       ; 6756   0064
        ANDI    #$0003, R0                      ; 6757   03B8 0003
        MOVR    R0,     R2                      ; 6759   0082
        MVII    #$0001, R4                      ; 675A   02BC 0001
        MVI     G_011F, R3                      ; 675C   0283 011F
        ANDI    #$000F, R3                      ; 675E   03BB 000F
        INCR    R2                              ; 6760   000A
        ADDR    R7,     R2                      ; 6761   00FA
        ADD@    R2,     R7                      ; 6762   02D7

        DECLE   $0005,  $000C,  $0004           ; 6763   0005 000C 0004

        INCR    R4                              ; 6766   000C
        NEGR    R4                              ; 6767   0024
        ADDR    R4,     R3                      ; 6768   00E3
        BPL     L_6771                          ; 6769   0203 0006

        MVII    #$0005, R3                      ; 676B   02BB 0005
        B       L_6771                          ; 676D   0200 0002

        ADDI    #$0003, R3                      ; 676F   02FB 0003
L_6771:
        CMPI    #$0006, R3                      ; 6771   037B 0006
        BLT     L_6777                          ; 6773   0205 0002

        SUBI    #$0006, R3                      ; 6775   033B 0006
L_6777:
        XORI    #$0040, R3                      ; 6777   03FB 0040
        MVO     R3,     G_011F                  ; 6779   0243 011F

        JSR     R5,     L_59EC                  ; 677B   0004 0158 01EC
        JSR     R5,     L_5A00                  ; 677E   0004 0158 0200

        B       L_66C8                          ; 6781   0220 00BA

        MOVR    R0,     R1                      ; 6783   0081
        MVII    #$0004, R0                      ; 6784   02B8 0004
        MVI     G_0135, R5                      ; 6786   0285 0135
        INCR    R5                              ; 6788   000D
        CMPI    #$0019, R5                      ; 6789   037D 0019
        MVO     R5,     G_0135                  ; 678B   0245 0135
        BLE     L_6795                          ; 678D   0206 0006

        MVII    #$0019, R5                      ; 678F   02BD 0019
        MVO     R5,     G_0135                  ; 6791   0245 0135
        MVII    #$0019, R0                      ; 6793   02B8 0019
L_6795:
        CMPI    #$00FF, R1                      ; 6795   0379 00FF
        BNEQ    L_679D                          ; 6797   020C 0004

        CLRR    R0                              ; 6799   01C0
        CLRR    R1                              ; 679A   01C9
        MVO     R1,     G_0135                  ; 679B   0241 0135

L_679D:
        JSR     R5,     .EXEC.629               ; 679D   0004 0114 0229
        DECLE   $0270,  $02B8,  $0000,  $0285   ; 67A0   0270 02B8 0000 0285
        DECLE   $011D,  $037D,  $0001,  $0204   ; 67A4   011D 037D 0001 0204
        DECLE   $0002,  $02B8,  $0010,  $0004   ; 67A8   0002 02B8 0010 0004

        ANDR    R3,     R0                      ; 67AC   0198
        ADDR    R2,     R2                      ; 67AD   00D2
        PULR    R0                              ; 67AE   02B0
        PSHR    R5                              ; 67AF   0275

        JSR     R5,     X_UNPK_BYTES            ; 67B0   0004 0114 0357

        PULR    R5                              ; 67B3   02B5
        ADDI    #$015E, R5                      ; 67B4   02FD 015E
        MVO@    R0,     R5                      ; 67B6   0268
        ADDI    #$0010, R5                      ; 67B7   02FD 0010
        MVO@    R1,     R5                      ; 67B9   0269
        PULR    R7                              ; 67BA   02B7

        DECLE   $0004                           ; 67BB   0004

        ANDR    R3,     R0                      ; 67BC   0198
        SUBR    R2,     R5                      ; 67BD   0115

        JSR     R5,     L_5EAF                  ; 67BE   0004 015C 02AF

        B       L_66C8                          ; 67C1   0220 00FA

L_67C3:
        PSHR    R5                              ; 67C3   0275
        MVI     G_011E, R4                      ; 67C4   0284 011E
        ADDR    R4,     R4                      ; 67C6   00E4
        SDBD                                    ; 67C7   0001
        ADDI    #$9842, R4                      ; 67C8   02FC 0042 0098
        SDBD                                    ; 67CB   0001
        MVI@    R4,     R7                      ; 67CC   02A7

L_67CD:
        MVI     G_01AE, R0                      ; 67CD   0280 01AE
        XORI    #$0001, R0                      ; 67CF   03F8 0001
        MVO     R0,     G_01AE                  ; 67D1   0240 01AE
L_67D3:
        MVII    #$0007, R0                      ; 67D3   02B8 0007
        DECLE   $0240,  $0130,  $01C0,  $0240   ; 67D5   0240 0130 01C0 0240
        DECLE   $018B,  $0240,  $018C,  $02B8   ; 67D9   018B 0240 018C 02B8
        DECLE   $0001,  $0240,  $018D,  $02B8   ; 67DD   0001 0240 018D 02B8
        DECLE   $0030,  $0240,  $018E,  $0004   ; 67E1   0030 0240 018E 0004

        ANDR    R3,     R0                      ; 67E5   0198
        MOVR    R3,     R0                      ; 67E6   0098
        SDBD                                    ; 67E7   0001
        MVII    #$97B2, R4                      ; 67E8   02BC 00B2 0097
        SDBD                                    ; 67EB   0001
        MVII    #$3980, R1                      ; 67EC   02B9 0080 0039
        MVII    #$0070, R0                      ; 67EF   02B8 0070

        JSR     R5,     .EXEC.730               ; 67F1   0004 0114 0330
        DECLE   $0240,  $0020,  $0004           ; 67F4   0240 0020 0004

        ANDR    R4,     R4                      ; 67F7   01A4
        MOVR    R6,     R5                      ; 67F8   00B5
        INCR    R2                              ; 67F9   000A
        MOVR    R4,     R6                      ; 67FA   00A6
        MVI     G_01AE, R0                      ; 67FB   0280 01AE
        TSTR    R0                              ; 67FD   0080
        BEQ     L_6803                          ; 67FE   0204 0003

        JSR     R5,     L_6239                  ; 6800   0004 0160 0239
L_6803:
        JSR     R5,     L_5BBF                  ; 6803   0004 0158 03BF
        DECLE   $0004                           ; 6806   0004

        ANDR    R3,     R0                      ; 6807   0198
        MOVR    R7,     R4                      ; 6808   00BC
        DECR    R4                              ; 6809   0014

        JSR     R5,     L_6FB1                  ; 680A   0004 016C 03B1
        BIDECLE $A6E5                           ; 680D   00E5 00A6

        PULR    R7                              ; 680F   02B7

L_6810:
        PSHR    R5                              ; 6810   0275
L_6811:
        MVII    #$0038, R0                      ; 6811   02B8 0038
        XOR     G_011B, R0                      ; 6813   03C0 011B
        MVO     R0,     G_011B                  ; 6815   0240 011B
        MVI     G_011F, R1                      ; 6817   0281 011F
        ANDI    #$0007, R1                      ; 6819   03B9 0007
        MVO     R1,     G_011F                  ; 681B   0241 011F

        JSR     R5,     L_69F4                  ; 681D   0004 0168 01F4

        MVII    #$0005, R1                      ; 6820   02B9 0005
        MVO     R1,     G_0180                  ; 6822   0241 0180
        MVI     G_011B, R0                      ; 6824   0280 011B
        ANDI    #$0080, R0                      ; 6826   03B8 0080
        BEQ     L_6833                          ; 6828   0204 0009

        MVI     G_011E, R0                      ; 682A   0280 011E
        CMPI    #$0005, R0                      ; 682C   0378 0005
        BGE     L_6833                          ; 682E   020D 0003

        CLRR    R1                              ; 6830   01C9
        MVO     R1,     G_0119                  ; 6831   0241 0119
L_6833:
        MVO     R1,     G_0181                  ; 6833   0241 0181
        CLRR    R0                              ; 6835   01C0
        MVO     R0,     G_0189                  ; 6836   0240 0189
        MVO     R0,     G_01B3                  ; 6838   0240 01B3
        MVO     R0,     G_01B4                  ; 683A   0240 01B4
        NOP                                     ; 683C   0034
        MVO     R0,     G_018B                  ; 683D   0240 018B
        MVO     R0,     G_0182                  ; 683F   0240 0182
        MVI     G_034A, R4                      ; 6841   0284 034A
        MVO     R0,     G_034B                  ; 6843   0240 034B
        MVO     R0,     G_034C                  ; 6845   0240 034C
        SDBD                                    ; 6847   0001
        ANDI    #$1000, R4                      ; 6848   03BC 0000 0010
        BEQ     L_684F                          ; 684B   0204 0002

        MVO     R0,     G_0328                  ; 684D   0240 0328
L_684F:
        MVII    #$019C, R4                      ; 684F   02BC 019C
        MVII    #$0011, R0                      ; 6851   02B8 0011
        CLRR    R1                              ; 6853   01C9
        MVI     G_011E, R5                      ; 6854   0285 011E
        CMPI    #$0005, R5                      ; 6856   037D 0005
        BLT     L_685C                          ; 6858   0205 0002

        MVII    #$00FF, R1                      ; 685A   02B9 00FF

L_685C:
        JSR     R5,     X_FILL_MEM              ; 685C   0004 0114 0341
        JSR     R5,     L_5B07                  ; 685F   0004 0158 0307
        DECLE   $0280,  $011E,  $0378,  $0005   ; 6862   0280 011E 0378 0005
        DECLE   $0205,  $0018,  $0004,  $0198   ; 6866   0205 0018 0004 0198
        DECLE   $00D1,  $000E,  $02FD,  $033A   ; 686A   00D1 000E 02FD 033A
        DECLE   $02A8,  $0001,  $03B8,  $00F8   ; 686E   02A8 0001 03B8 00F8
        DECLE   $000F,  $0284,  $01AE,  $00E4   ; 6872   000F 0284 01AE 00E4
        DECLE   $00FC,  $02FC,  $000F,  $0001   ; 6876   00FC 02FC 000F 0001
        DECLE   $03E0,  $0015,  $0268,  $0004   ; 687A   03E0 0015 0268 0004

        ANDR    R3,     R0                      ; 687E   0198
        XORR    R3,     R2                      ; 687F   01DA
        MVII    #$000B, R0                      ; 6880   02B8 000B
        J       L_6482                          ; 6882   0004 0364 0082
        PULR    R7                              ; 6885   02B7

        DECLE   $0002,  $0000,  $0005,  $0010   ; 6886   0002 0000 0005 0010
        DECLE   $0007,  $0000                   ; 688A   0007 0000
L_688C:
        PSHR    R5                              ; 688C   0275
        DECLE   $02B8,  $0000,  $0004           ; 688D   02B8 0000 0004

        ANDR    R4,     R4                      ; 6890   01A4
        ADD@    R3,     R3                      ; 6891   02DB
        ANDR    R3,     R4                      ; 6892   019C
        BEQ     L_68C3                          ; 6893   0204 002E
        B       L_68C5                          ; 6895   0200 002E

L_6897:
        PSHR    R5                              ; 6897   0275
        MVII    #$019C, R4                      ; 6898   02BC 019C
        MVI@    R4,     R0                      ; 689A   02A0
L_689B:
        DECR    R0                              ; 689B   0010
        BMI     L_68C5                          ; 689C   020B 0027

        MVI@    R4,     R5                      ; 689E   02A5
        TSTR    R5                              ; 689F   00AD
        BEQ     L_689B                          ; 68A0   0224 0006
        B       L_68C3                          ; 68A2   0200 001F

L_68A4:
        PSHR    R5                              ; 68A4   0275
        MVI     G_0119, R1                      ; 68A5   0281 0119
        CMP     G_019D, R1                      ; 68A7   0341 019D
        BNEQ    L_68C5                          ; 68A9   020C 001A

        ADDI    #$0120, R1                      ; 68AB   02F9 0120
        MVI     G_011F, R0                      ; 68AD   0280 011F
        ANDI    #$0007, R0                      ; 68AF   03B8 0007
        CMP@    R1,     R0                      ; 68B1   0348
        BNEQ    L_68C5                          ; 68B2   020C 0011
        B       L_68C3                          ; 68B4   0200 000D

L_68B6:
        PSHR    R5                              ; 68B6   0275

        JSR     R5,     L_6897                  ; 68B7   0004 0168 0097
        DECLE   $0204,  $0007,  $0004           ; 68BA   0204 0007 0004

        ANDR    R3,     R0                      ; 68BD   0198
        SUBR    R7,     R3                      ; 68BE   013B
        CMPI    #$0004, R0                      ; 68BF   0378 0004
        BLT     L_68C5                          ; 68C1   0205 0002

L_68C3:
        CMPR    R6,     R6                      ; 68C3   0176
        PULR    R7                              ; 68C4   02B7

L_68C5:
        CMPR    R6,     R7                      ; 68C5   0177
        PULR    R7                              ; 68C6   02B7

L_68C7:
        PSHR    R5                              ; 68C7   0275
        MVI     G_01AE, R1                      ; 68C8   0281 01AE
        ADDI    #$01AF, R1                      ; 68CA   02F9 01AF
        MVI@    R1,     R3                      ; 68CC   028B
        DECR    R3                              ; 68CD   0013
        BMI     L_68E0                          ; 68CE   020B 0010

        MVI     G_0189, R0                      ; 68D0   0280 0189

        JSR     R5,     L_694B                  ; 68D2   0004 0168 014B

        BEQ     L_68E0                          ; 68D5   0204 0009

        CMPI    #$0008, R0                      ; 68D7   0378 0008
        BNEQ    L_68C5                          ; 68D9   022C 0015

        JSR     R5,     L_695E                  ; 68DB   0004 0168 015E

        BEQ     L_68C5                          ; 68DE   0224 001A

L_68E0:
        JSR     R5,     L_6897                  ; 68E0   0004 0168 0097
        DECLE   $0224,  $0021,  $0280,  $0189   ; 68E3   0224 0021 0280 0189
        DECLE   $0080,  $0224,  $0024,  $0004   ; 68E7   0080 0224 0024 0004

        ANDR    R3,     R0                      ; 68EB   0198
        SUBR    R7,     R6                      ; 68EC   013E
        TSTR    R0                              ; 68ED   0080
        BEQ     L_68C5                          ; 68EE   0224 002A
        B       L_68C3                          ; 68F0   0220 002E

L_68F2:
        PSHR    R5                              ; 68F2   0275
        DECLE   $02B8,  $0000,  $0004,  $01A4   ; 68F3   02B8 0000 0004 01A4
        DECLE   $02BF,  $019C,  $0004,  $0198   ; 68F7   02BF 019C 0004 0198
        DECLE   $00D1,  $0000                   ; 68FB   00D1 0000

        MOVR    R5,     R1                      ; 68FD   00A9
        MVII    #$00FF, R5                      ; 68FE   02BD 00FF
        MVO     R5,     G_0120                  ; 6900   0245 0120
        ADDI    #$033A, R1                      ; 6902   02F9 033A
        SDBD                                    ; 6904   0001
        MVII    #$9854, R5                      ; 6905   02BD 0054 0098
        SDBD                                    ; 6908   0001
        MVI@    R5,     R0                      ; 6909   02A8
        MVO@    R0,     R1                      ; 690A   0248
        SUBI    #$0022, R1                      ; 690B   0339 0022
        SDBD                                    ; 690D   0001
        MVII    #$0F00, R0                      ; 690E   02B8 0000 000F
        MVO@    R0,     R1                      ; 6911   0248
        ADDI    #$0011, R1                      ; 6912   02F9 0011
        SDBD                                    ; 6914   0001
        MVII    #$1000, R0                      ; 6915   02B8 0000 0010
        MVO@    R0,     R1                      ; 6918   0248
        PULR    R7                              ; 6919   02B7

L_691A:
        MVII    #$0008, R3                      ; 691A   02BB 0008
        B       L_6920                          ; 691C   0200 0002

L_691E:
        MVII    #$0009, R3                      ; 691E   02BB 0009
L_6920:
        PSHR    R5                              ; 6920   0275
        DECLE   $0098,  $0004,  $01A4,  $02BF   ; 6921   0098 0004 01A4 02BF

        ANDR    R3,     R4                      ; 6925   019C
        INCR    R7                              ; 6926   000F

L_6927:
        PSHR    R5                              ; 6927   0275
L_6928:
        PSHR    R3                              ; 6928   0273
        DECLE   $0004,  $0198,  $016C,  $02B3   ; 6929   0004 0198 016C 02B3
        DECLE   $0270,  $0098,  $0004           ; 692D   0270 0098 0004

        ANDR    R3,     R0                      ; 6930   0198
        ADDR    R2,     R2                      ; 6931   00D2
        ADDI    #$0318, R5                      ; 6932   02FD 0318
        PULR    R0                              ; 6934   02B0
        MVO@    R0,     R5                      ; 6935   0268
        ADDI    #$0010, R5                      ; 6936   02FD 0010
        MVO@    R1,     R5                      ; 6938   0269
        ADDI    #$0010, R5                      ; 6939   02FD 0010
        MOVR    R5,     R1                      ; 693B   00A9
        MOVR    R3,     R5                      ; 693C   009D
        ADDR    R5,     R5                      ; 693D   00ED
        SDBD                                    ; 693E   0001
        ADDI    #$9854, R5                      ; 693F   02FD 0054 0098
        SDBD                                    ; 6942   0001
        MVI@    R5,     R0                      ; 6943   02A8
        MVO@    R0,     R1                      ; 6944   0248
        ADDI    #$0120, R3                      ; 6945   02FB 0120
        MVII    #$00FF, R5                      ; 6947   02BD 00FF
        MVO@    R5,     R3                      ; 6949   025D
        PULR    R7                              ; 694A   02B7

L_694B:
        PSHR    R5                              ; 694B   0275
        DECLE   $0283,  $01AE,  $02FB,  $01AF   ; 694C   0283 01AE 02FB 01AF
        DECLE   $029B,  $0013,  $022B,  $008E   ; 6950   029B 0013 022B 008E
        DECLE   $004F,  $004B,  $00BC,  $02FC   ; 6954   004F 004B 00BC 02FC
        DECLE   $012E,  $00DC,  $0004           ; 6958   012E 00DC 0004

        ANDR    R4,     R4                      ; 695B   01A4
        ADD@    R3,     R4                      ; 695C   02DC
        PULR    R7                              ; 695D   02B7

L_695E:
        PSHR    R5                              ; 695E   0275
        DECLE   $0281,  $01AE,  $02F9,  $01AF   ; 695F   0281 01AE 02F9 01AF
        DECLE   $0288,  $0010,  $022B,  $00A3   ; 6963   0288 0010 022B 00A3
        DECLE   $004C,  $0048,  $0008,  $02B9   ; 6967   004C 0048 0008 02B9
        DECLE   $0007,  $0004,  $0198,  $00D2   ; 696B   0007 0004 0198 00D2
        DECLE   $02FD,  $0318,  $02AD,  $00AD   ; 696F   02FD 0318 02AD 00AD
        DECLE   $022C,  $00B1,  $0008,  $0011   ; 6973   022C 00B1 0008 0011
        DECLE   $022C,  $000C                   ; 6977   022C 000C

        B       L_68C5                          ; 6979   0220 00B5

L_697B:
        PSHR    R5                              ; 697B   0275
        MVI     G_01AE, R1                      ; 697C   0281 01AE
        ADDI    #$01AF, R1                      ; 697E   02F9 01AF
        MVI@    R1,     R3                      ; 6980   028B
        DECR    R3                              ; 6981   0013
        BMI     L_69C1                          ; 6982   020B 003D

        SLL     R3,     2                       ; 6984   004F
        SLL     R3,     1                       ; 6985   004B
        ADDR    R7,     R3                      ; 6986   00FB
        ADDI    #$00FE, R3                      ; 6987   02FB 00FE
        MVI     G_019C, R1                      ; 6989   0281 019C
L_698B:
        DECR    R1                              ; 698B   0011
        DECLE   $020B,  $0033,  $008A,  $02FA   ; 698C   020B 0033 008A 02FA
        DECLE   $019D,  $0290,  $009C,  $0004   ; 6990   019D 0290 009C 0004
        DECLE   $01A4,  $02DC,  $022C,  $000C   ; 6994   01A4 02DC 022C 000C
        DECLE   $0004,  $01A4,  $02BF,  $019C   ; 6998   0004 01A4 02BF 019C
        DECLE   $02BD,  $0120,  $00C5,  $02BC   ; 699C   02BD 0120 00C5 02BC
        DECLE   $00FF,  $026C,  $0004,  $0198   ; 69A0   00FF 026C 0004 0198
        DECLE   $00D2,  $02FD,  $033A,  $0048   ; 69A4   00D2 02FD 033A 0048
        DECLE   $0001,  $02F8,  $0054,  $0098   ; 69A8   0001 02F8 0054 0098
        DECLE   $0084,  $0001,  $02A0,  $0268   ; 69AC   0084 0001 02A0 0268
        DECLE   $033D,  $0023,  $0271,  $0273   ; 69B0   033D 0023 0271 0273
        DECLE   $0275,  $0004                   ; 69B4   0275 0004

        ANDR    R3,     R0                      ; 69B6   0198
        CMPR    R5,     R4                      ; 69B7   016C
        PULR    R5                              ; 69B8   02B5
        MVO@    R0,     R5                      ; 69B9   0268
        ADDI    #$0010, R5                      ; 69BA   02FD 0010
        MVO@    R1,     R5                      ; 69BC   0269
        PULR    R3                              ; 69BD   02B3
        PULR    R1                              ; 69BE   02B1
        B       L_698B                          ; 69BF   0220 0035
L_69C1:
        PULR    R7                              ; 69C1   02B7

L_69C2:
        PSHR    R5                              ; 69C2   0275
        MVI     G_019C, R1                      ; 69C3   0281 019C
L_69C5:
        DECR    R1                              ; 69C5   0011
        DECLE   $020B,  $002B,  $008A,  $02FA   ; 69C6   020B 002B 008A 02FA
        DECLE   $019D,  $0290,  $0004,  $01A4   ; 69CA   019D 0290 0004 01A4
        DECLE   $02BF,  $019C,  $02BD,  $0120   ; 69CE   02BF 019C 02BD 0120
        DECLE   $00C5,  $02BC,  $00FF,  $026C   ; 69D2   00C5 02BC 00FF 026C
        DECLE   $0004,  $0198,  $00D2,  $02FD   ; 69D6   0004 0198 00D2 02FD
        DECLE   $033A,  $0048,  $0001,  $02F8   ; 69DA   033A 0048 0001 02F8
        DECLE   $0054,  $0098,  $0084,  $0001   ; 69DE   0054 0098 0084 0001
        DECLE   $02A0,  $0268,  $033D,  $0023   ; 69E2   02A0 0268 033D 0023
        DECLE   $0271,  $0275,  $0004           ; 69E6   0271 0275 0004

        ANDR    R3,     R0                      ; 69E9   0198
        CMPR    R5,     R4                      ; 69EA   016C
        PULR    R5                              ; 69EB   02B5
        MVO@    R0,     R5                      ; 69EC   0268
        ADDI    #$0010, R5                      ; 69ED   02FD 0010
        MVO@    R1,     R5                      ; 69EF   0269
        PULR    R1                              ; 69F0   02B1
        B       L_69C5                          ; 69F1   0220 002D
        PULR    R7                              ; 69F3   02B7

L_69F4:
        PSHR    R5                              ; 69F4   0275
        DECLE   $0281,  $011E,  $0089,  $0204   ; 69F5   0281 011E 0089 0204
        DECLE   $0007,  $0379,  $0002,  $0206   ; 69F9   0007 0379 0002 0206
        DECLE   $0024                           ; 69FD   0024

        CLRR    R0                              ; 69FE   01C0
        B       L_6A1F                          ; 69FF   0200 001E

        DECLE   $0281,  $01AE,  $02F9,  $01AF   ; 6A01   0281 01AE 02F9 01AF
        DECLE   $0289,  $0011,  $020B,  $0019   ; 6A05   0289 0011 020B 0019

        SLL     R1,     2                       ; 6A09   004D
        SLL     R1,     1                       ; 6A0A   0049
        ADDR    R7,     R1                      ; 6A0B   00F9
        ADDI    #$0079, R1                      ; 6A0C   02F9 0079
        MOVR    R1,     R4                      ; 6A0E   008C
        MVI@    R4,     R2                      ; 6A0F   02A2
L_6A10:
        MVI@    R4,     R0                      ; 6A10   02A0
        DECLE   $0004                           ; 6A11   0004

        ANDR    R3,     R0                      ; 6A12   0198
        ADDR    R2,     R2                      ; 6A13   00D2
        ADDI    #$0318, R5                      ; 6A14   02FD 0318
        MVI@    R5,     R5                      ; 6A16   02AD
        TSTR    R5                              ; 6A17   00AD
        BNEQ    L_6A1F                          ; 6A18   020C 0005

        DECR    R2                              ; 6A1A   0012
        BNEQ    L_6A10                          ; 6A1B   022C 000C

        MVII    #$0008, R0                      ; 6A1D   02B8 0008
L_6A1F:
        MVO     R0,     G_0119                  ; 6A1F   0240 0119
        PULR    R7                              ; 6A21   02B7

        DECLE   $0004                           ; 6A22   0004

        ANDR    R3,     R0                      ; 6A23   0198
        SUBR    R5,     R6                      ; 6A24   012E
        MVO     R0,     G_011A                  ; 6A25   0240 011A
        B       L_6A1F                          ; 6A27   0220 0009

L_6A29:
        PSHR    R5                              ; 6A29   0275

        JSR     R5,     L_69F4                  ; 6A2A   0004 0168 01F4

        J       L_5AA2                          ; 6A2D   0004 0358 02A2

L_6A30:
        PSHR    R5                              ; 6A30   0275
        MVI     G_0189, R0                      ; 6A31   0280 0189
        CMPI    #$0001, R0                      ; 6A33   0378 0001
        BNEQ    L_68C5                          ; 6A35   022C 0171

        JSR     R5,     L_6897                  ; 6A37   0004 0168 0097
        DECLE   $0224,  $0178,  $0004           ; 6A3A   0224 0178 0004

        ANDR    R3,     R0                      ; 6A3D   0198
        SUBR    R7,     R3                      ; 6A3E   013B
        CMPI    #$0004, R0                      ; 6A3F   0378 0004
        BLT     L_68C5                          ; 6A41   0225 017D
        B       L_68C3                          ; 6A43   0220 0181

L_6A45:
        PSHR    R5                              ; 6A45   0275
        MVI     G_011A, R0                      ; 6A46   0280 011A
        CMP     G_0189, R0                      ; 6A48   0340 0189
        BNEQ    L_68C5                          ; 6A4A   022C 0186

        JSR     R5,     L_68A4                  ; 6A4C   0004 0168 00A4
        DECLE   $0224,  $018D,  $0004           ; 6A4F   0224 018D 0004

        ANDR    R3,     R0                      ; 6A52   0198
        SUBR    R7,     R6                      ; 6A53   013E
        TSTR    R0                              ; 6A54   0080
        BEQ     L_68C5                          ; 6A55   0224 0191
        B       L_68C3                          ; 6A57   0220 0195

L_6A59:
        PSHR    R5                              ; 6A59   0275
        MVI     G_011A, R0                      ; 6A5A   0280 011A
        CMP     G_0189, R0                      ; 6A5C   0340 0189
        BNEQ    L_68C5                          ; 6A5E   022C 019A

        JSR     R5,     L_6897                  ; 6A60   0004 0168 0097
        DECLE   $020C,  $0005                   ; 6A63   020C 0005

        JSR     R5,     L_688C                  ; 6A65   0004 0168 008C
        DECLE   $022C,  $01A6,  $0004           ; 6A68   022C 01A6 0004

        ANDR    R3,     R0                      ; 6A6B   0198
        SUBR    R7,     R6                      ; 6A6C   013E
        TSTR    R0                              ; 6A6D   0080
        BEQ     L_68C5                          ; 6A6E   0224 01AA
        B       L_68C3                          ; 6A70   0220 01AE

L_6A72:
        PSHR    R5                              ; 6A72   0275

        JSR     R5,     L_68A4                  ; 6A73   0004 0168 00A4
        DECLE   $0224,  $01B4,  $0280,  $0189   ; 6A76   0224 01B4 0280 0189
        DECLE   $0080,  $0224,  $01B7,  $0004   ; 6A7A   0080 0224 01B7 0004

        ANDR    R3,     R0                      ; 6A7E   0198
        SUBR    R7,     R6                      ; 6A7F   013E
        TSTR    R0                              ; 6A80   0080
        BEQ     L_68C5                          ; 6A81   0224 01BD
        B       L_68C3                          ; 6A83   0220 01C1

        DECLE   $0007,  $0001,  $0002,  $0003   ; 6A85   0007 0001 0002 0003
        DECLE   $0004,  $0005,  $0006,  $0007   ; 6A89   0004 0005 0006 0007
        DECLE   $0007,  $0009,  $000A,  $000B   ; 6A8D   0007 0009 000A 000B
        DECLE   $000C,  $000D,  $000E,  $000F   ; 6A91   000C 000D 000E 000F
L_6A95:
        MVI     G_01AE, R1                      ; 6A95   0281 01AE
        ADDI    #$0183, R1                      ; 6A97   02F9 0183
        MVI@    R1,     R0                      ; 6A99   0288
        INCR    R0                              ; 6A9A   0008
L_6A9B:
        MVO@    R0,     R1                      ; 6A9B   0248
        MOVR    R5,     R7                      ; 6A9C   00AF

L_6A9D:
        MVI     G_01AE, R1                      ; 6A9D   0281 01AE
        ADDI    #$0183, R1                      ; 6A9F   02F9 0183
        CLRR    R0                              ; 6AA1   01C0
        B       L_6A9B                          ; 6AA2   0220 0008

L_6AA4:
        PSHR    R5                              ; 6AA4   0275
        DECLE   $0004,  $0198,  $00D1,  $0000   ; 6AA5   0004 0198 00D1 0000

        ADDI    #$0318, R5                      ; 6AA9   02FD 0318
        MVI@    R5,     R0                      ; 6AAB   02A8
        MVO     R0,     G_034D                  ; 6AAC   0240 034D
        ADDI    #$0010, R5                      ; 6AAE   02FD 0010
        MVI@    R5,     R0                      ; 6AB0   02A8
        MVO     R0,     G_034E                  ; 6AB1   0240 034E
        MVII    #$0121, R4                      ; 6AB3   02BC 0121
L_6AB5:
        MVI@    R4,     R0                      ; 6AB5   02A0
        CMPI    #$00FF, R0                      ; 6AB6   0378 00FF
        BEQ     L_6ABE                          ; 6AB8   0204 0004

        CMPI    #$0131, R4                      ; 6ABA   037C 0131
        BLT     L_6AB5                          ; 6ABC   0225 0008

L_6ABE:
        SUBI    #$0121, R4                      ; 6ABE   033C 0121
        CMPI    #$0010, R4                      ; 6AC0   037C 0010
        BNEQ    L_6AC8                          ; 6AC2   020C 0004

        MVII    #$019C, R1                      ; 6AC4   02B9 019C
        ADD@    R1,     R1                      ; 6AC6   02C9
        MVI@    R1,     R4                      ; 6AC7   028C
L_6AC8:
        MVO     R4,     G_011A                  ; 6AC8   0244 011A
        DECLE   $00A0,  $0004,  $0198,  $00D2   ; 6ACA   00A0 0004 0198 00D2
        DECLE   $02FD,  $0318,  $02A8,  $0240   ; 6ACE   02FD 0318 02A8 0240
        DECLE   $034B,  $02FD,  $0010,  $02A8   ; 6AD2   034B 02FD 0010 02A8
        DECLE   $0240,  $034C,  $0004           ; 6AD6   0240 034C 0004

        ANDR    R3,     R0                      ; 6AD9   0198
        ADDR    R4,     R2                      ; 6ADA   00E2
        MVI     G_034D, R0                      ; 6ADB   0280 034D
        MVO     R0,     G_0318                  ; 6ADD   0240 0318
        MVI     G_034E, R0                      ; 6ADF   0280 034E
        MVO     R0,     G_0329                  ; 6AE1   0240 0329
        MVI     G_034B, R0                      ; 6AE3   0280 034B
        MVO     R0,     G_0319                  ; 6AE5   0240 0319
        MVI     G_034C, R0                      ; 6AE7   0280 034C
        MVO     R0,     G_032A                  ; 6AE9   0240 032A

        JSR     R5,     L_6BAC                  ; 6AEB   0004 0168 03AC

        BEQ     L_6B3B                          ; 6AEE   0204 004B

        MVI     G_034D, R0                      ; 6AF0   0280 034D
        MVI     G_034E, R1                      ; 6AF2   0281 034E

        JSR     R5,     L_6BD8                  ; 6AF4   0004 0168 03D8

        BEQ     L_6B20                          ; 6AF7   0204 0027

        JSR     R5,     L_6BA5                  ; 6AF9   0004 0168 03A5
        DECLE   $0204,  $0014,  $0004           ; 6AFC   0204 0014 0004

        ANDR    R3,     R0                      ; 6AFF   0198
        ANDR    R4,     R0                      ; 6B00   01A0
        TSTR    R0                              ; 6B01   0080
        BNEQ    L_6B82                          ; 6B02   020C 007E

L_6B04:
        SDBD                                    ; 6B04   0001
        MVII    #$1F00, R0                      ; 6B05   02B8 0000 001F
        MVO     R0,     G_0319                  ; 6B08   0240 0319
        SDBD                                    ; 6B0A   0001
        MVII    #$1000, R0                      ; 6B0B   02B8 0000 0010
        MVO     R0,     G_032A                  ; 6B0E   0240 032A
        B       L_6B82                          ; 6B10   0200 0070

        SDBD                                    ; 6B12   0001
        MVII    #$0F00, R0                      ; 6B13   02B8 0000 000F
        MVO     R0,     G_0319                  ; 6B16   0240 0319
        SDBD                                    ; 6B18   0001
        MVII    #$1000, R0                      ; 6B19   02B8 0000 0010
        MVO     R0,     G_032A                  ; 6B1C   0240 032A
        B       L_6B82                          ; 6B1E   0200 0062

L_6B20:
        JSR     R5,     L_6BA5                  ; 6B20   0004 0168 03A5
        DECLE   $020C,  $000E                   ; 6B23   020C 000E

        SDBD                                    ; 6B25   0001
        MVII    #$1700, R0                      ; 6B26   02B8 0000 0017
        MVO     R0,     G_0319                  ; 6B29   0240 0319
        SDBD                                    ; 6B2B   0001
        MVII    #$1000, R0                      ; 6B2C   02B8 0000 0010
        MVO     R0,     G_032A                  ; 6B2F   0240 032A
        B       L_6B82                          ; 6B31   0200 004F

        DECLE   $0004                           ; 6B33   0004

        ANDR    R3,     R0                      ; 6B34   0198
        ANDR    R4,     R0                      ; 6B35   01A0
        TSTR    R0                              ; 6B36   0080
        BEQ     L_6B04                          ; 6B37   0224 0034
        B       L_6B82                          ; 6B39   0200 0047

L_6B3B:
        JSR     R5,     L_6BA5                  ; 6B3B   0004 0168 03A5
        DECLE   $0204,  $0028,  $0004           ; 6B3E   0204 0028 0004

        ANDR    R3,     R0                      ; 6B41   0198
        ANDR    R4,     R0                      ; 6B42   01A0
        TSTR    R0                              ; 6B43   0080
        BEQ     L_6B68                          ; 6B44   0204 0022

        MVI     G_034B, R0                      ; 6B46   0280 034B
        MVI     G_034C, R1                      ; 6B48   0281 034C

        JSR     R5,     L_6BD8                  ; 6B4A   0004 0168 03D8

        BEQ     L_6B76                          ; 6B4D   0204 0027

        MVI     G_034B, R0                      ; 6B4F   0280 034B

        JSR     R5,     L_6BE1                  ; 6B51   0004 0168 03E1

        BEQ     L_6B5A                          ; 6B54   0204 0004

L_6B56:
        MVII    #$0001, R0                      ; 6B56   02B8 0001
        MVO     R0,     G_011B                  ; 6B58   0240 011B
L_6B5A:
        SDBD                                    ; 6B5A   0001
        MVII    #$0F00, R0                      ; 6B5B   02B8 0000 000F
        MVO     R0,     G_0318                  ; 6B5E   0240 0318
        SDBD                                    ; 6B60   0001
        MVII    #$1000, R0                      ; 6B61   02B8 0000 0010
        MVO     R0,     G_0329                  ; 6B64   0240 0329
        B       L_6B82                          ; 6B66   0200 001A

L_6B68:
        SDBD                                    ; 6B68   0001
        MVII    #$1F00, R0                      ; 6B69   02B8 0000 001F
        MVO     R0,     G_0319                  ; 6B6C   0240 0319
        SDBD                                    ; 6B6E   0001
        MVII    #$1000, R0                      ; 6B6F   02B8 0000 0010
        MVO     R0,     G_032A                  ; 6B72   0240 032A
        B       L_6B56                          ; 6B74   0220 001F

L_6B76:
        SDBD                                    ; 6B76   0001
        MVII    #$1700, R0                      ; 6B77   02B8 0000 0017
        MVO     R0,     G_0318                  ; 6B7A   0240 0318
        SDBD                                    ; 6B7C   0001
        MVII    #$1000, R0                      ; 6B7D   02B8 0000 0010
        MVO     R0,     G_0329                  ; 6B80   0240 0329
L_6B82:
        MOVR    R7,     R4                      ; 6B82   00BC
        ADDI    #$0011, R4                      ; 6B83   02FC 0011
        MVII    #$018B, R1                      ; 6B85   02B9 018B
        MVII    #$0011, R0                      ; 6B87   02B8 0011

        JSR     R5,     .EXEC.730               ; 6B89   0004 0114 0330

        MVI     G_011A, R0                      ; 6B8C   0280 011A
        MVO     R0,     G_018C                  ; 6B8E   0240 018C

        JSR     R5,     L_6CDD                  ; 6B90   0004 016C 00DD

        PULR    R7                              ; 6B93   02B7

        DECLE   $000E,  $0000,  $0000,  $0000   ; 6B94   000E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA0   0000 0000 0000 0000

        DECR    R0                              ; 6BA4   0010
L_6BA5:
        PSHR    R5                              ; 6BA5   0275
        MVI     G_034B, R0                      ; 6BA6   0280 034B
        MVI     G_034C, R1                      ; 6BA8   0281 034C
        B       L_6BB3                          ; 6BAA   0200 0007

L_6BAC:
        PSHR    R5                              ; 6BAC   0275
        MVI     G_034D, R0                      ; 6BAD   0280 034D
        MVI     G_034E, R1                      ; 6BAF   0281 034E
        INCR    R7                              ; 6BB1   000F

        PSHR    R5                              ; 6BB2   0275
L_6BB3:
        MVII    #$000F, R5                      ; 6BB3   02BD 000F
        DECLE   $0001                           ; 6BB5   0001

        MVII    #$00AC, R4                      ; 6BB6   02BC 00AC
        SAR     R1,     2                       ; 6BB8   006D
L_6BB9:
        SLL     R0,     2                       ; 6BB9   004C
        SWAP    R0,     1                       ; 6BBA   0040
        ANDI    #$00FF, R0                      ; 6BBB   03B8 00FF
        SLL     R1,     2                       ; 6BBD   004D
        SWAP    R1,     1                       ; 6BBE   0041
        ANDI    #$00FF, R1                      ; 6BBF   03B9 00FF
L_6BC1:
        MVI@    R4,     R2                      ; 6BC1   02A2
        MVI@    R4,     R3                      ; 6BC2   02A3
        SUBR    R0,     R2                      ; 6BC3   0102
        BPL     L_6BC7                          ; 6BC4   0203 0001

        NEGR    R2                              ; 6BC6   0022
L_6BC7:
        CMPI    #$0004, R2                      ; 6BC7   037A 0004
        BGE     L_6BD3                          ; 6BC9   020D 0008

        SUBR    R1,     R3                      ; 6BCB   010B
        BPL     L_6BCF                          ; 6BCC   0203 0001

        NEGR    R3                              ; 6BCE   0023
L_6BCF:
        CMPI    #$0004, R3                      ; 6BCF   037B 0004
        BLT     L_68C3                          ; 6BD1   0225 030F

L_6BD3:
        DECR    R5                              ; 6BD3   0015
        BNEQ    L_6BC1                          ; 6BD4   022C 0014
        B       L_68C5                          ; 6BD6   0220 0312

L_6BD8:
        PSHR    R5                              ; 6BD8   0275
        SDBD                                    ; 6BD9   0001
        MVII    #$6DAA, R4                      ; 6BDA   02BC 00AA 006D
        MVII    #$0001, R5                      ; 6BDD   02BD 0001
        B       L_6BB9                          ; 6BDF   0220 0027

L_6BE1:
        PSHR    R5                              ; 6BE1   0275
        SDBD                                    ; 6BE2   0001
        CMPI    #$0F00, R0                      ; 6BE3   0378 0000 000F
        BLE     L_68C3                          ; 6BE6   0226 0324
        B       L_68C5                          ; 6BE8   0220 0324

L_6BEA:
        PSHR    R5                              ; 6BEA   0275

        JSR     R5,     L_68A4                  ; 6BEB   0004 0168 00A4
        DECLE   $0224,  $032C,  $0004           ; 6BEE   0224 032C 0004

        ANDR    R3,     R0                      ; 6BF1   0198
        SUBR    R7,     R3                      ; 6BF2   013B
        CMPI    #$0002, R0                      ; 6BF3   0378 0002
        BLT     L_68C5                          ; 6BF5   0225 0331

        MVI     G_018B, R0                      ; 6BF7   0280 018B
        TSTR    R0                              ; 6BF9   0080
        BEQ     L_68C5                          ; 6BFA   0224 0336
        B       L_68C3                          ; 6BFC   0220 033A

L_6BFE:
        PSHR    R5                              ; 6BFE   0275

        JSR     R5,     L_6C2F                  ; 6BFF   0004 016C 002F
        DECLE   $0224,  $0340,  $0280,  $011C   ; 6C02   0224 0340 0280 011C
        DECLE   $03B8,  $0080,  $020C,  $000D   ; 6C06   03B8 0080 020C 000D
        DECLE   $0280,  $0189,  $0080,  $0224   ; 6C0A   0280 0189 0080 0224
        DECLE   $0349,  $0004                   ; 6C0E   0349 0004

        ANDR    R3,     R0                      ; 6C10   0198
        SUBR    R7,     R6                      ; 6C11   013E
        TSTR    R0                              ; 6C12   0080
        BEQ     L_68C5                          ; 6C13   0224 034F
        B       L_68C3                          ; 6C15   0220 0353

        DECLE   $0004                           ; 6C17   0004

        ANDR    R3,     R0                      ; 6C18   0198
        SUBR    R7,     R3                      ; 6C19   013B
        CMPI    #$0001, R0                      ; 6C1A   0378 0001
        BLT     L_68C5                          ; 6C1C   0225 0358

        MVI     G_018B, R0                      ; 6C1E   0280 018B
        TSTR    R0                              ; 6C20   0080
        BEQ     L_68C5                          ; 6C21   0224 035D
        B       L_68C3                          ; 6C23   0220 0361

L_6C25:
        PSHR    R5                              ; 6C25   0275
        MVI     G_01AE, R5                      ; 6C26   0285 01AE
        ADDR    R7,     R5                      ; 6C28   00FD
        ADDI    #$0004, R5                      ; 6C29   02FD 0004
        MVI@    R5,     R5                      ; 6C2B   02AD
        PULR    R7                              ; 6C2C   02B7

        DECLE   $0002,  $0005                   ; 6C2D   0002 0005
L_6C2F:
        PSHR    R5                              ; 6C2F   0275

        JSR     R5,     L_6C25                  ; 6C30   0004 016C 0025

        MVI     G_019C, R1                      ; 6C33   0281 019C
        TSTR    R1                              ; 6C35   0089
        BEQ     L_68C5                          ; 6C36   0224 0372

        MVI     G_019D, R1                      ; 6C38   0281 019D
        ADDI    #$0120, R1                      ; 6C3A   02F9 0120
        CMP@    R1,     R5                      ; 6C3C   034D
        BEQ     L_68C3                          ; 6C3D   0224 037B
        B       L_68C5                          ; 6C3F   0220 037B

L_6C41:
        CLRR    R0                              ; 6C41   01C0
        MVO     R0,     G_01AE                  ; 6C42   0240 01AE
        MVO     R0,     G_0136                  ; 6C44   0240 0136
        MVO     R0,     G_0137                  ; 6C46   0240 0137
L_6C48:
        CLRR    R0                              ; 6C48   01C0
        MVO     R0,     G_0185                  ; 6C49   0240 0185
        MVO     R0,     G_0186                  ; 6C4B   0240 0186
        MVO     R0,     G_0187                  ; 6C4D   0240 0187
        NOP                                     ; 6C4F   0034
        MVO     R0,     G_0188                  ; 6C50   0240 0188
L_6C52:
        MVII    #$0318, R2                      ; 6C52   02BA 0318
        MVO     R2,     G_035B                  ; 6C54   0242 035B

        JSR     R5,     L_6FB1                  ; 6C56   0004 016C 03B1
        BIDECLE $AFF4                           ; 6C59   00F4 00AF
        DECLE   $0004                           ; 6C5B   0004

        ANDR    R3,     R0                      ; 6C5C   0198
        MOVR    R3,     R0                      ; 6C5D   0098
        SDBD                                    ; 6C5E   0001
        MVII    #$9000, R4                      ; 6C5F   02BC 0000 0090
        SDBD                                    ; 6C62   0001
        MVII    #$3800, R1                      ; 6C63   02B9 0000 0038
        MVII    #$0080, R0                      ; 6C66   02B8 0080

        JSR     R5,     .EXEC.730               ; 6C68   0004 0114 0330

        SDBD                                    ; 6C6B   0001
        MVII    #$3980, R1                      ; 6C6C   02B9 0080 0039
        MVII    #$0058, R0                      ; 6C6F   02B8 0058

        JSR     R5,     .EXEC.730               ; 6C71   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 6C74   0240 0020
        MVII    #$019C, R4                      ; 6C76   02BC 019C
        MVII    #$0011, R0                      ; 6C78   02B8 0011

        JSR     R5,     X_FILL_ZERO             ; 6C7A   0004 0114 0338
        JSR     R5,     L_6CA3                  ; 6C7D   0004 016C 00A3
        JSR     R5,     L_5B07                  ; 6C80   0004 0158 0307
        JSR     R5,     L_6CC6                  ; 6C83   0004 016C 00C6

        CLRR    R0                              ; 6C86   01C0
        MVO     R0,     G_011D                  ; 6C87   0240 011D
        MVO     R0,     G_0119                  ; 6C89   0240 0119
        MVO     R0,     G_01AF                  ; 6C8B   0240 01AF
        MVO     R0,     G_01B0                  ; 6C8D   0240 01B0
        MVO     R0,     G_0183                  ; 6C8F   0240 0183
        MVO     R0,     G_0184                  ; 6C91   0240 0184
        MVII    #$00C1, R0                      ; 6C93   02B8 00C1
        MVI     G_011E, R5                      ; 6C95   0285 011E
        CMPI    #$0003, R5                      ; 6C97   037D 0003
        BNEQ    L_6C9D                          ; 6C99   020C 0002

        XORI    #$0006, R0                      ; 6C9B   03F8 0006
L_6C9D:
        MVO     R0,     G_011B                  ; 6C9D   0240 011B

        JSR     R5,     L_6810                  ; 6C9F   0004 0168 0010

        PULR    R7                              ; 6CA2   02B7

L_6CA3:
        PSHR    R5                              ; 6CA3   0275
        DECLE   $0004                           ; 6CA4   0004

        ANDR    R3,     R0                      ; 6CA5   0198
        MOVR    R3,     R0                      ; 6CA6   0098
        SDBD                                    ; 6CA7   0001
        MVII    #$3880, R1                      ; 6CA8   02B9 0080 0038
        SDBD                                    ; 6CAB   0001
        MVII    #$57C5, R4                      ; 6CAC   02BC 00C5 0057
        MVI     G_011E, R0                      ; 6CAF   0280 011E
        CMPI    #$0005, R0                      ; 6CB1   0378 0005
        BLT     L_6CB9                          ; 6CB3   0205 0004

        SDBD                                    ; 6CB5   0001
        MVII    #$58CC, R4                      ; 6CB6   02BC 00CC 0058
L_6CB9:
        MVI@    R4,     R0                      ; 6CB9   02A0

        JSR     R5,     .EXEC.730               ; 6CBA   0004 0114 0330
        DECLE   $0240,  $0020,  $0004,  $0158   ; 6CBD   0240 0020 0004 0158
        DECLE   $01C5                           ; 6CC1   01C5

        JSR     R5,     L_59EC                  ; 6CC2   0004 0158 01EC

        PULR    R7                              ; 6CC5   02B7

L_6CC6:
        PSHR    R5                              ; 6CC6   0275
        MVI     G_011E, R0                      ; 6CC7   0280 011E
        CMPI    #$0005, R0                      ; 6CC9   0378 0005
        BGE     L_6DCC                          ; 6CCB   020D 00FF

        PSHR    R0                              ; 6CCD   0270
        SLL     R0,     2                       ; 6CCE   004C
        SLL     R0,     2                       ; 6CCF   004C
        ADD@    R6,     R0                      ; 6CD0   02F0
        ADDR    R7,     R0                      ; 6CD1   00F8
        ADDI    #$0083, R0                      ; 6CD2   02F8 0083
        MOVR    R0,     R4                      ; 6CD4   0084
        MVII    #$0011, R0                      ; 6CD5   02B8 0011
        MVII    #$018B, R1                      ; 6CD7   02B9 018B

        JSR     R5,     .EXEC.730               ; 6CD9   0004 0114 0330

        INCR    R7                              ; 6CDC   000F

L_6CDD:
        PSHR    R5                              ; 6CDD   0275
L_6CDE:
        MVI     G_011E, R3                      ; 6CDE   0283 011E
        ADDR    R7,     R3                      ; 6CE0   00FB
        ADDI    #$006F, R3                      ; 6CE1   02FB 006F
        MVI@    R3,     R3                      ; 6CE3   029B
        MVI     G_018B, R1                      ; 6CE4   0281 018B
        MVII    #$018B, R2                      ; 6CE6   02BA 018B
L_6CE8:
        INCR    R2                              ; 6CE8   000A
        MVI@    R2,     R0                      ; 6CE9   0290
        TSTR    R0                              ; 6CEA   0080
        BNEQ    L_6CE8                          ; 6CEB   022C 0004

L_6CED:
        MOVR    R3,     R0                      ; 6CED   0098

        JSR     R5,     X_RAND2                 ; 6CEE   0004 0114 029E

        INCR    R0                              ; 6CF1   0008
        MVII    #$018C, R4                      ; 6CF2   02BC 018C
L_6CF4:
        CMP@    R4,     R0                      ; 6CF4   0360
        BEQ     L_6CED                          ; 6CF5   0224 0009

        CMPI    #$019B, R4                      ; 6CF7   037C 019B
        BLT     L_6CF4                          ; 6CF9   0225 0006

        MVO@    R0,     R2                      ; 6CFB   0250
        DECR    R1                              ; 6CFC   0011
        BNEQ    L_6CE8                          ; 6CFD   022C 0016

        MVO     R1,     G_018B                  ; 6CFF   0241 018B
L_6D01:
        MOVR    R1,     R2                      ; 6D01   008A
        ADDI    #$018B, R2                      ; 6D02   02FA 018B
        MOVR    R1,     R3                      ; 6D04   008B
        ADDI    #$033A, R3                      ; 6D05   02FB 033A
        MVI@    R2,     R5                      ; 6D07   0295
        CMPI    #$0010, R5                      ; 6D08   037D 0010
        BLE     L_6D0E                          ; 6D0A   0206 0002

        SUBI    #$0010, R5                      ; 6D0C   033D 0010
L_6D0E:
        ADDR    R5,     R5                      ; 6D0E   00ED
        SDBD                                    ; 6D0F   0001
        ADDI    #$9854, R5                      ; 6D10   02FD 0054 0098
        SDBD                                    ; 6D13   0001
        MVI@    R5,     R0                      ; 6D14   02A8
        MVO@    R0,     R3                      ; 6D15   0258
        SUBI    #$0022, R3                      ; 6D16   033B 0022
        MOVR    R1,     R4                      ; 6D18   008C
        MVI@    R2,     R2                      ; 6D19   0292
        CMPI    #$0010, R2                      ; 6D1A   037A 0010
        BLE     L_6D20                          ; 6D1C   0206 0002

        MVII    #$0010, R4                      ; 6D1E   02BC 0010
L_6D20:
        ADDR    R4,     R4                      ; 6D20   00E4
        ADDR    R7,     R4                      ; 6D21   00FC
        ADDI    #$0088, R4                      ; 6D22   02FC 0088
        MVI@    R3,     R0                      ; 6D24   0298
        TSTR    R0                              ; 6D25   0080
        BNEQ    L_6D3A                          ; 6D26   020C 0012

        MVI@    R4,     R2                      ; 6D28   02A2
        SWAP    R2,     1                       ; 6D29   0042
        BEQ     L_6D30                          ; 6D2A   0204 0004

        SLR     R2,     2                       ; 6D2C   0066

        JSR     R5,     L_6E2B                  ; 6D2D   0004 016C 022B

L_6D30:
        ADDI    #$0011, R3                      ; 6D30   02FB 0011
        MVI@    R4,     R2                      ; 6D32   02A2
        SWAP    R2,     1                       ; 6D33   0042
        BEQ     L_6D3A                          ; 6D34   0204 0004

        SLR     R2,     2                       ; 6D36   0066

        JSR     R5,     L_6E2B                  ; 6D37   0004 016C 022B

L_6D3A:
        INCR    R1                              ; 6D3A   0009
        CMPI    #$0010, R1                      ; 6D3B   0379 0010
        BLE     L_6D01                          ; 6D3D   0226 003D

        MVII    #$0120, R4                      ; 6D3F   02BC 0120
        MVII    #$00FF, R1                      ; 6D41   02B9 00FF
        MVII    #$0010, R0                      ; 6D43   02B8 0010

        JSR     R5,     X_FILL_MEM              ; 6D45   0004 0114 0341

L_6D48:
        MVII    #$015E, R4                      ; 6D48   02BC 015E
        MVII    #$0022, R0                      ; 6D4A   02B8 0022

        JSR     R5,     X_FILL_ZERO             ; 6D4C   0004 0114 0338

        PULR    R7                              ; 6D4F   02B7

        DECLE   $000F,  $0008,  $000F,  $000F   ; 6D50   000F 0008 000F 000F
        DECLE   $000F,  $000C,  $0000,  $0000   ; 6D54   000F 000C 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 6D58   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5C   0000 0000 0000 0000
        DECLE   $000E,  $0000,  $0000,  $0000   ; 6D60   000E 0000 0000 0000
        DECLE   $0004,  $0010,  $0007,  $0001   ; 6D64   0004 0010 0007 0001
        DECLE   $0000,  $0000,  $0000,  $0009   ; 6D68   0000 0000 0000 0009
        DECLE   $0000,  $001A,  $0000,  $0000   ; 6D6C   0000 001A 0000 0000
        DECLE   $001B,  $001C,  $001D,  $0000   ; 6D70   001B 001C 001D 0000
        DECLE   $001E,  $001F,  $0010,  $000B   ; 6D74   001E 001F 0010 000B
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6D78   0001 0000 0000 0000
        DECLE   $000F,  $0000,  $0000,  $0000   ; 6D7C   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; 6D80   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0003,  $0010   ; 6D84   0000 0000 0003 0010
        DECLE   $000D,  $0000,  $0000,  $0000   ; 6D88   000D 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6D90   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0005   ; 6D94   0000 0000 0000 0005
        DECLE   $0010,  $000F,  $0000,  $0000   ; 6D98   0010 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA4   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $003C,  $0040   ; 6DA8   0000 0010 003C 0040
        DECLE   $007C,  $0040,  $0080,  $003E   ; 6DAC   007C 0040 0080 003E
        DECLE   $0080,  $0042,  $0084,  $003C   ; 6DB0   0080 0042 0084 003C
        DECLE   $0084,  $0040,  $0084,  $0044   ; 6DB4   0084 0040 0084 0044
        DECLE   $0088,  $003A,  $0088,  $003E   ; 6DB8   0088 003A 0088 003E
        DECLE   $0088,  $0042,  $0088,  $0046   ; 6DBC   0088 0042 0088 0046
        DECLE   $008C,  $0038,  $008C,  $003C   ; 6DC0   008C 0038 008C 003C
        DECLE   $008C,  $0040,  $008C,  $0044   ; 6DC4   008C 0040 008C 0044
        DECLE   $008C,  $0048,  $0000,  $0000   ; 6DC8   008C 0048 0000 0000
L_6DCC:
        MVII    #$0318, R4                      ; 6DCC   02BC 0318
        MVII    #$0022, R0                      ; 6DCE   02B8 0022

        JSR     R5,     X_FILL_ZERO             ; 6DD0   0004 0114 0338

        SDBD                                    ; 6DD3   0001
        MVII    #$9876, R4                      ; 6DD4   02BC 0076 0098
        MVII    #$033A, R5                      ; 6DD7   02BD 033A
L_6DD9:
        SDBD                                    ; 6DD9   0001
        MVI@    R4,     R0                      ; 6DDA   02A0
        MVO@    R0,     R5                      ; 6DDB   0268
        CMPI    #$034B, R5                      ; 6DDC   037D 034B
        BLT     L_6DD9                          ; 6DDE   0225 0006

        MVII    #$0003, R1                      ; 6DE0   02B9 0003
        MVII    #$0318, R3                      ; 6DE2   02BB 0318
        SDBD                                    ; 6DE4   0001
        MVII    #$9876, R5                      ; 6DE5   02BD 0076 0098
        MOVR    R7,     R4                      ; 6DE8   00BC
        ADDI    #$004B, R4                      ; 6DE9   02FC 004B
        MVI     G_011E, R0                      ; 6DEB   0280 011E
        CMPI    #$0007, R0                      ; 6DED   0378 0007
        BNEQ    L_6DF5                          ; 6DEF   020C 0004

        INCR    R1                              ; 6DF1   0009
        MOVR    R7,     R4                      ; 6DF2   00BC
        ADDI    #$0047, R4                      ; 6DF3   02FC 0047
L_6DF5:
        MVI@    R4,     R2                      ; 6DF5   02A2
        SWAP    R2,     1                       ; 6DF6   0042
        SLR     R2,     2                       ; 6DF7   0066
        PSHR    R5                              ; 6DF8   0275

        JSR     R5,     L_6E2B                  ; 6DF9   0004 016C 022B

        ADDI    #$0011, R3                      ; 6DFC   02FB 0011
        MVI@    R4,     R2                      ; 6DFE   02A2
        SWAP    R2,     1                       ; 6DFF   0042
        SLR     R2,     2                       ; 6E00   0066

        JSR     R5,     L_6E2B                  ; 6E01   0004 016C 022B
        DECLE   $02B5,  $02FB,  $0011,  $0001   ; 6E04   02B5 02FB 0011 0001
        DECLE   $02A8,  $0258,  $033B,  $0021   ; 6E08   02A8 0258 033B 0021
        DECLE   $0011,  $022C,  $0019,  $0280   ; 6E0C   0011 022C 0019 0280
        DECLE   $01AE,  $0080,  $0204,  $0015   ; 6E10   01AE 0080 0204 0015
        DECLE   $0004,  $0198,  $01CA,  $02FD   ; 6E14   0004 0198 01CA 02FD
        DECLE   $033A,  $0275,  $0280,  $01AE   ; 6E18   033A 0275 0280 01AE
        DECLE   $03F8,  $0001,  $0004           ; 6E1C   03F8 0001 0004

        ANDR    R3,     R0                      ; 6E1F   0198
        ADDR    R2,     R2                      ; 6E20   00D2
        ADDI    #$033A, R5                      ; 6E21   02FD 033A
        MVI@    R5,     R0                      ; 6E23   02A8
        DECR    R5                              ; 6E24   0015
        PULR    R2                              ; 6E25   02B2
        MVI@    R2,     R1                      ; 6E26   0291
        MVO@    R1,     R5                      ; 6E27   0269
        MVO@    R0,     R2                      ; 6E28   0250
        B       L_6D48                          ; 6E29   0220 00E2

L_6E2B:
        PSHR    R5                              ; 6E2B   0275
        MVII    #$0006, R0                      ; 6E2C   02B8 0006

        JSR     R5,     X_RAND1                 ; 6E2E   0004 0114 027D

        XORR    R0,     R2                      ; 6E31   01C2
        MVO@    R2,     R3                      ; 6E32   025A
        PULR    R7                              ; 6E33   02B7

        RSWD    R1                              ; 6E34   0039
        RSWD    R0                              ; 6E35   0038
        RSWD    R1                              ; 6E36   0039
        SWAP    R0,     1                       ; 6E37   0040
        SARC    R2,     2                       ; 6E38   007E
        SWAP    R0,     1                       ; 6E39   0040
        RSWD    R1                              ; 6E3A   0039
        RSWD    R0                              ; 6E3B   0038
        RSWD    R1                              ; 6E3C   0039
        SWAP    R3,     2                       ; 6E3D   0047
        RSWD    R1                              ; 6E3E   0039
        SWAP    R0,     1                       ; 6E3F   0040
        SARC    R2,     2                       ; 6E40   007E
        SWAP    R0,     1                       ; 6E41   0040
L_6E42:
        MVI     G_011D, R0                      ; 6E42   0280 011D
        CMPI    #$0004, R0                      ; 6E44   0378 0004
        BNEQ    L_6E56                          ; 6E46   020C 000E

        MVI     G_01B5, R4                      ; 6E48   0284 01B5
        ADDR    R7,     R4                      ; 6E4A   00FC
        ADDI    #$0097, R4                      ; 6E4B   02FC 0097
        SDBD                                    ; 6E4D   0001
        MVII    #$3860, R1                      ; 6E4E   02B9 0060 0038
        MVII    #$0007, R0                      ; 6E51   02B8 0007
        J       .EXEC.730                       ; 6E53   0004 0314 0330

L_6E56:
        MVI     G_0115, R4                      ; 6E56   0284 0115
        ANDI    #$007F, R4                      ; 6E58   03BC 007F
        ADDR    R4,     R4                      ; 6E5A   00E4
        ADDR    R4,     R4                      ; 6E5B   00E4
        ADDR    R7,     R4                      ; 6E5C   00FC
        ADDI    #$0015, R4                      ; 6E5D   02FC 0015
        SDBD                                    ; 6E5F   0001
        MVII    #$39BF, R3                      ; 6E60   02BB 00BF 0039
        MVII    #$0008, R2                      ; 6E63   02BA 0008
        MVI@    R4,     R0                      ; 6E65   02A0
        MVO@    R0,     R3                      ; 6E66   0258
        ADDR    R2,     R3                      ; 6E67   00D3
        MVI@    R4,     R0                      ; 6E68   02A0
        MVO@    R0,     R3                      ; 6E69   0258
        ADDR    R2,     R3                      ; 6E6A   00D3
        MVI@    R4,     R0                      ; 6E6B   02A0
        MVO@    R0,     R3                      ; 6E6C   0258
        ADDR    R2,     R3                      ; 6E6D   00D3
        MVI@    R4,     R0                      ; 6E6E   02A0
        MVO@    R0,     R3                      ; 6E6F   0258
        ADDR    R2,     R3                      ; 6E70   00D3
        MOVR    R5,     R7                      ; 6E71   00AF

        DECLE   $005F,  $00FF,  $00FF,  $00FF   ; 6E72   005F 00FF 00FF 00FF
        DECLE   $002F,  $00FF,  $00FF,  $00FF   ; 6E76   002F 00FF 00FF 00FF
L_6E7A:
        DECR    R7                              ; 6E7A   0017

        DECLE   $00FF,  $00FF,  $00FF,  $000B   ; 6E7B   00FF 00FF 00FF 000B
        DECLE   $00FF,  $00FF,  $00FF,  $0005   ; 6E7F   00FF 00FF 00FF 0005
        DECLE   $00FF,  $00FF,  $00FF,  $0002   ; 6E83   00FF 00FF 00FF 0002
        DECLE   $00FF,  $00FF,  $00FF,  $0001   ; 6E87   00FF 00FF 00FF 0001
        DECLE   $007F,  $00FF,  $00FF,  $0000   ; 6E8B   007F 00FF 00FF 0000
        DECLE   $00BF,  $00FF,  $00FF,  $0000   ; 6E8F   00BF 00FF 00FF 0000
        DECLE   $005F,  $00FF,  $00FF,  $0000   ; 6E93   005F 00FF 00FF 0000
        DECLE   $002F,  $00FF,  $00FF,  $0000   ; 6E97   002F 00FF 00FF 0000
L_6E9B:
        DECR    R7                              ; 6E9B   0017

        DECLE   $00FF,  $00FF,  $0000,  $000B   ; 6E9C   00FF 00FF 0000 000B
        DECLE   $00FF,  $00FF,  $0000,  $0005   ; 6EA0   00FF 00FF 0000 0005
        DECLE   $00FF,  $00FF,  $0000,  $0002   ; 6EA4   00FF 00FF 0000 0002
        DECLE   $00FF,  $00FF,  $0000,  $0001   ; 6EA8   00FF 00FF 0000 0001
        DECLE   $007F,  $00FF,  $0000,  $0000   ; 6EAC   007F 00FF 0000 0000
        DECLE   $00BF,  $00FF,  $0000,  $0000   ; 6EB0   00BF 00FF 0000 0000
        DECLE   $005F,  $00FF,  $0000,  $0000   ; 6EB4   005F 00FF 0000 0000
        DECLE   $002F,  $00FF,  $0000,  $0000   ; 6EB8   002F 00FF 0000 0000
L_6EBC:
        DECR    R7                              ; 6EBC   0017

        DECLE   $00FF,  $0000,  $0000,  $000B   ; 6EBD   00FF 0000 0000 000B
        DECLE   $00FF,  $0000,  $0000,  $0005   ; 6EC1   00FF 0000 0000 0005
        DECLE   $00FF,  $0000,  $0000,  $0002   ; 6EC5   00FF 0000 0000 0002
        DECLE   $00FF,  $0000,  $0000,  $0001   ; 6EC9   00FF 0000 0000 0001
        DECLE   $007F,  $0000,  $0000,  $0000   ; 6ECD   007F 0000 0000 0000
        DECLE   $00BF,  $0000,  $0000,  $0000   ; 6ED1   00BF 0000 0000 0000
        DECLE   $005F,  $0000,  $0000,  $0000   ; 6ED5   005F 0000 0000 0000
        DECLE   $002F,  $0000,  $0000,  $0000   ; 6ED9   002F 0000 0000 0000
L_6EDD:
        DECR    R7                              ; 6EDD   0017

        DECLE   $0000,  $0000,  $0000,  $000B   ; 6EDE   0000 0000 0000 000B
        DECLE   $0000,  $0020,  $0020,  $00E0   ; 6EE2   0000 0020 0020 00E0
        DECLE   $0070,  $0040,  $0040,  $0000   ; 6EE6   0070 0040 0040 0000
        DECLE   $0000,  $0040,  $0040,  $0070   ; 6EEA   0000 0040 0040 0070
        DECLE   $00E0,  $0020,  $0020,  $0000   ; 6EEE   00E0 0020 0020 0000
        DECLE   $0000,  $0000,  $0090,  $0060   ; 6EF2   0000 0000 0090 0060
        DECLE   $0060,  $0090,  $0000,  $0000   ; 6EF6   0060 0090 0000 0000
        DECLE   $0000                           ; 6EFA   0000
L_6EFB:
        PSHR    R5                              ; 6EFB   0275
        MVI     G_01B8, R0                      ; 6EFC   0280 01B8
        DECR    R0                              ; 6EFE   0010
        BMI     L_6F96                          ; 6EFF   020B 0095

        CMPI    #$00FE, R0                      ; 6F01   0378 00FE
        BEQ     L_6F95                          ; 6F03   0204 0090

        MVO     R0,     G_01B8                  ; 6F05   0240 01B8
        TSTR    R0                              ; 6F07   0080
        BNEQ    L_6F70                          ; 6F08   020C 0066

L_6F0A:
        MVI     G_035F, R4                      ; 6F0A   0284 035F
L_6F0C:
        MVI@    R4,     R0                      ; 6F0C   02A0
        MVO     R4,     G_035F                  ; 6F0D   0244 035F
        SARC    R0,     1                       ; 6F0F   0078
        BC      L_6F58                          ; 6F10   0201 0046

        CLRR    R1                              ; 6F12   01C9
        MVII    #$00B4, R2                      ; 6F13   02BA 00B4
        SARC    R0,     1                       ; 6F15   0078
        BC      L_6F2B                          ; 6F16   0201 0013

        MOVR    R0,     R1                      ; 6F18   0081
        CLRR    R0                              ; 6F19   01C0
        MVII    #$00FF, R2                      ; 6F1A   02BA 00FF
        MVII    #$01BC, R4                      ; 6F1C   02BC 01BC
L_6F1E:
        CMP@    R4,     R0                      ; 6F1E   0360
        BEQ     L_6F27                          ; 6F1F   0204 0006

        CMPI    #$01BF, R4                      ; 6F21   037C 01BF
        BNEQ    L_6F1E                          ; 6F23   022C 0006
        B       L_6F2B                          ; 6F25   0200 0004

L_6F27:
        SUBI    #$0003, R4                      ; 6F27   033C 0003
        B       L_6F35                          ; 6F29   0200 000A

L_6F2B:
        MVII    #$01B9, R4                      ; 6F2B   02BC 01B9
L_6F2D:
        CMP@    R4,     R0                      ; 6F2D   0360
        BEQ     L_6F35                          ; 6F2E   0204 0005

        CMPI    #$01BC, R4                      ; 6F30   037C 01BC
        BNEQ    L_6F2D                          ; 6F32   022C 0006

        DECR    R4                              ; 6F34   0014
L_6F35:
        DECR    R4                              ; 6F35   0014
        MVO@    R1,     R4                      ; 6F36   0261
        ADDI    #$0002, R4                      ; 6F37   02FC 0002
        MVO@    R2,     R4                      ; 6F39   0262
        TSTR    R1                              ; 6F3A   0089
        BEQ     L_6F0A                          ; 6F3B   0224 0032

        MOVR    R1,     R5                      ; 6F3D   008D
        ANDI    #$000F, R5                      ; 6F3E   03BD 000F
        ADDR    R5,     R5                      ; 6F40   00ED
        SDBD                                    ; 6F41   0001
        ADDI    #$1ADC, R5                      ; 6F42   02FD 00DC 001A
        SDBD                                    ; 6F45   0001
        MVI@    R5,     R0                      ; 6F46   02A8
        SUBI    #$0020, R1                      ; 6F47   0339 0020
L_6F49:
        SARC    R0,     1                       ; 6F49   0078
        SUBI    #$0010, R1                      ; 6F4A   0339 0010
        BPL     L_6F49                          ; 6F4C   0223 0004

        SLLC    R0,     1                       ; 6F4E   0058
        ADDI    #$0033, R4                      ; 6F4F   02FC 0033
        MVO@    R0,     R4                      ; 6F51   0260
        SWAP    R0,     1                       ; 6F52   0040
        ADDI    #$0003, R4                      ; 6F53   02FC 0003
        MVO@    R0,     R4                      ; 6F55   0260
        B       L_6F0A                          ; 6F56   0220 004D

L_6F58:
        CMPI    #$01FF, R0                      ; 6F58   0378 01FF
        BNEQ    L_6F6E                          ; 6F5A   020C 0012

        MVI     G_01B7, R5                      ; 6F5C   0285 01B7
        XORI    #$0001, R5                      ; 6F5E   03FD 0001
        MVO     R5,     G_01B7                  ; 6F60   0245 01B7
        ADDR    R5,     R5                      ; 6F62   00ED
        ADDR    R7,     R5                      ; 6F63   00FD
        ADDI    #$0006, R5                      ; 6F64   02FD 0006
        SDBD                                    ; 6F66   0001
        MVI@    R5,     R4                      ; 6F67   02AC
        B       L_6F0C                          ; 6F68   0220 005D

        DECLE   $00F8,  $00A6,  $001F           ; 6F6A   00F8 00A6 001F

        MOVR    R5,     R3                      ; 6F6D   00AB
L_6F6E:
        MVO     R0,     G_01B8                  ; 6F6E   0240 01B8
L_6F70:
        MVII    #$01B9, R4                      ; 6F70   02BC 01B9
        MVII    #$01BC, R3                      ; 6F72   02BB 01BC
L_6F74:
        MVI@    R4,     R0                      ; 6F74   02A0
        MVI@    R3,     R1                      ; 6F75   0299
        TSTR    R0                              ; 6F76   0080
        BEQ     L_6F81                          ; 6F77   0204 0008

        CMPI    #$00B4, R1                      ; 6F79   0379 00B4
        BLE     L_6F90                          ; 6F7B   0206 0013

        SUBI    #$001E, R1                      ; 6F7D   0339 001E
        B       L_6F89                          ; 6F7F   0200 0008

L_6F81:
        TSTR    R1                              ; 6F81   0089
        BEQ     L_6F90                          ; 6F82   0204 000C

        SUBI    #$0014, R1                      ; 6F84   0339 0014
        BPL     L_6F89                          ; 6F86   0203 0001

        CLRR    R1                              ; 6F88   01C9
L_6F89:
        MVO@    R1,     R3                      ; 6F89   0259
        MOVR    R3,     R5                      ; 6F8A   009D
        ADDI    #$003F, R5                      ; 6F8B   02FD 003F
        SLR     R1,     2                       ; 6F8D   0065
        SLR     R1,     2                       ; 6F8E   0065
        MVO@    R1,     R5                      ; 6F8F   0269
L_6F90:
        INCR    R3                              ; 6F90   000B
        CMPI    #$01BC, R4                      ; 6F91   037C 01BC
        BNEQ    L_6F74                          ; 6F93   022C 0020
L_6F95:
        PULR    R7                              ; 6F95   02B7
L_6F96:
        J       X_PLAY_NOTE                     ; 6F96   0004 0318 02BD

        SDBD                                    ; 6F99   0001
        MVI@    R5,     R4                      ; 6F9A   02AC
        CLRR    R1                              ; 6F9B   01C9
        MVO     R1,     G_01B8                  ; 6F9C   0241 01B8
        B       L_6FA7                          ; 6F9E   0200 0007

L_6FA0:
        SDBD                                    ; 6FA0   0001
        MVI@    R5,     R4                      ; 6FA1   02AC
        MVI     G_01B8, R3                      ; 6FA2   0283 01B8
        TSTR    R3                              ; 6FA4   009B
        BNEQ    L_6FD2                          ; 6FA5   020C 002B

L_6FA7:
        PSHR    R5                              ; 6FA7   0275
        MVII    #$0001, R5                      ; 6FA8   02BD 0001
        MVO     R5,     G_0147                  ; 6FAA   0245 0147
        MVI@    R4,     R3                      ; 6FAC   02A3
        MOVR    R4,     R5                      ; 6FAD   00A5
        J       .EXEC.BBF                       ; 6FAE   0004 0318 03BF

L_6FB1:
        SDBD                                    ; 6FB1   0001
        MVI@    R5,     R1                      ; 6FB2   02A9
        MVII    #$00FF, R0                      ; 6FB3   02B8 00FF
        MVO     R0,     G_01B8                  ; 6FB5   0240 01B8
        MVO     R1,     G_035F                  ; 6FB7   0241 035F
        CLRR    R0                              ; 6FB9   01C0
        MVO     R0,     G_01B7                  ; 6FBA   0240 01B7
        MVII    #$0002, R1                      ; 6FBC   02B9 0002
L_6FBE:
        MVII    #$01B9, R2                      ; 6FBE   02BA 01B9
        ADDR    R1,     R2                      ; 6FC0   00CA
        MVO@    R0,     R2                      ; 6FC1   0250
        ADDI    #$0003, R2                      ; 6FC2   02FA 0003
        MVO@    R0,     R2                      ; 6FC4   0250
        ADDI    #$003F, R2                      ; 6FC5   02FA 003F
        MVO@    R0,     R2                      ; 6FC7   0250
        DECR    R1                              ; 6FC8   0011
        BPL     L_6FBE                          ; 6FC9   0223 000C

        MVII    #$0038, R1                      ; 6FCB   02B9 0038
        MVO     R1,     .PSG0.chan_enable       ; 6FCD   0241 01F8
        INCR    R0                              ; 6FCF   0008
        MVO     R0,     G_01B8                  ; 6FD0   0240 01B8
L_6FD2:
        MOVR    R5,     R7                      ; 6FD2   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFF   0000

        ORG     $D000
        DECLE   $0060,  $00F0,  $00F0,  $00F0   ; D000   0060 00F0 00F0 00F0
        DECLE   $00F0,  $0060,  $0000           ; D004   00F0 0060 0000

        SUBR    R0,     R0                      ; D007   0100
        SUBR    R0,     R0                      ; D008   0100
        DIS                                     ; D009   0003
        SUBR    R1,     R7                      ; D00A   010F

        DECLE   $001F,  $013F,  $023F           ; D00B   001F 013F 023F

        CMPR    R7,     R7                      ; D00E   017F
        CMPR    R7,     R7                      ; D00F   017F
        CMPR    R4,     R0                      ; D010   0160
        XOR@    R6,     R0                      ; D011   03F0
        MOVR    R2,     R0                      ; D012   0090
        AND@    R2,     R0                      ; D013   0390
        XORR    R6,     R0                      ; D014   01F0
        MVO@    R0,     R4                      ; D015   0260
        B       L_D118                          ; D016   0200 0100

        SUBR    R0,     R0                      ; D018   0100
        ADD     .PSG0.chn_a_lo,R0               ; D019   02C0 01F0
        XORI    #$01FC, R0                      ; D01B   03F8 01FC
        ADDI    #$03FE, R4                      ; D01D   02FC 03FE
        ADDI    #$010E, R6                      ; D01F   02FE 010E
        BNOV    L_D12D                          ; D021   020A 010A

        SUBR    R1,     R2                      ; D023   010A
        SUBR    R1,     R6                      ; D024   010E
        B       L_D127                          ; D025   0200 0100

        DECLE   $0000,  $007F,  $023F,  $003F   ; D027   0000 007F 023F 003F
        DECLE   $001F                           ; D02B   001F

        SUBR    R1,     R7                      ; D02C   010F
        BPL     L_D02F                          ; D02D   0203 0000
L_D02F:
        B       L_D131                          ; D02F   0200 0100

        DECLE   $0360,  $02F0,  $01F0,  $0060   ; D031   0360 02F0 01F0 0060
        DECLE   $0300,  $0200,  $0200           ; D035   0300 0200 0200

        XORI    #$03FC, R6                      ; D038   03FE 03FC
        XORI    #$01F8, R4                      ; D03A   03FC 01F8
        ADDR    R6,     R0                      ; D03C   00F0
        ADD     .BTAB.00,R0                     ; D03D   02C0 0200
        SUBR    R0,     R0                      ; D03F   0100
        SUBR    R0,     R0                      ; D040   0100
        SUBR    R0,     R0                      ; D041   0100
        SLR     R0,     1                       ; D042   0060
        SLR     R0,     1                       ; D043   0060
        SUBR    R0,     R0                      ; D044   0100
        SUB     .STIC.X.0,R0                    ; D045   0300 0000
        B       L_D149                          ; D047   0200 0100
        B       L_D3C2                          ; D049   0200 0377

        DECLE   $0345,  $0175,  $0215           ; D04B   0345 0175 0215

        CMPR    R6,     R7                      ; D04E   0177
        SUB     .ISRVEC.0,R0                    ; D04F   0300 0100
        CMP@    R4,     R0                      ; D051   0360
        MOVR    R2,     R0                      ; D052   0090
        MVI@    R2,     R0                      ; D053   0290
        CMPR    R4,     R0                      ; D054   0160
        B       L_D057                          ; D055   0200 0000

L_D057:
        SUBR    R0,     R0                      ; D057   0100
L_D058:
        SUBR    R0,     R0                      ; D058   0100
        B       L_D3D2                          ; D059   0200 0377

        CMPR    R0,     R2                      ; D05B   0142
        CMPR    R4,     R2                      ; D05C   0162
        MVO     R2,     G_0342                  ; D05D   0242 0342
        SUBR    R0,     R0                      ; D05F   0100
        CLRR    R0                              ; D060   01C0
        ADD     .ISRVEC.0,R0                    ; D061   02C0 0100
        SUBR    R0,     R0                      ; D063   0100
        SUBR    R0,     R0                      ; D064   0100
        B       L_D167                          ; D065   0200 0100

        DECLE   $0000,  $0000,  $0200           ; D067   0000 0000 0200

        MOVR    R5,     R6                      ; D06A   00AE
        MOVR    R5,     R2                      ; D06B   00AA
        XORR    R5,     R6                      ; D06C   01EE
        MVI@    R5,     R2                      ; D06D   02AA
        MOVR    R5,     R2                      ; D06E   00AA
        B       L_D23D                          ; D06F   0200 01CC

        AND     .BTAB.00,R4                     ; D071   0384 0200
        SUBR    R0,     R0                      ; D073   0100
        MOVR    R0,     R4                      ; D074   0084
        XOR@    R1,     R4                      ; D075   03CC
        B       L_D278                          ; D076   0200 0200

        SUB     G_0300, R0                      ; D078   0300 0300
        XOR@    R5,     R4                      ; D07A   03EC
        ANDR    R5,     R2                      ; D07B   01AA
        XORR    R1,     R2                      ; D07C   01CA
        ANDR    R5,     R2                      ; D07D   01AA
        MOVR    R5,     R4                      ; D07E   00AC
        B       L_D181                          ; D07F   0200 0100

        DECLE   $0300,  $0100,  $0300,  $0100   ; D081   0300 0100 0300 0100
        DECLE   $020E,  $020A                   ; D085   020E 020A

        SUBR    R1,     R6                      ; D087   010E
        SUBR    R1,     R0                      ; D088   0108
        SUB@    R1,     R0                      ; D089   0308
        SUBR    R0,     R0                      ; D08A   0100
        INCR    R0                              ; D08B   0008
        SUBR    R1,     R0                      ; D08C   0108
        SKIP                                    ; D08D   0208
        SKIP                                    ; D08E   0208
        INCR    R6                              ; D08F   000E
        SUB     G_030E, R0                      ; D090   0300 030E
        SUB@    R1,     R2                      ; D092   030A
        SUBR    R1,     R6                      ; D093   010E
        SUBR    R1,     R2                      ; D094   010A
        SUB@    R1,     R2                      ; D095   030A
        B       L_D1A2                          ; D096   0200 010A

        SUBR    R1,     R2                      ; D098   010A
        INCR    R6                              ; D099   000E
        SUBR    R0,     R4                      ; D09A   0104
        SUB     .ISRVEC.0,R4                    ; D09B   0304 0100
        SUB@    R1,     R6                      ; D09D   030E
        INCR    R0                              ; D09E   0008
        BNEQ    L_D1A9                          ; D09F   020C 0108
        BGT     L_D0A3                          ; D0A1   020E 0000

L_D0A3:
        SUBR    R1,     R6                      ; D0A3   010E
        DECLE   $010A,  $030C,  $000A,  $000A   ; D0A4   010A 030C 000A 000A
        DECLE   $0104,  $020C,  $0204,  $0004   ; D0A8   0104 020C 0204 0004

        SUBR    R1,     R6                      ; D0AC   010E
        B       L_D2AF                          ; D0AD   0200 0200

        DECLE   $0100,  $010E,  $0202,  $000E   ; D0AF   0100 010E 0202 000E
        DECLE   $0308,  $010E,  $0300,  $0000   ; D0B3   0308 010E 0300 0000
        DECLE   $0300,  $0080,  $0280,  $00D5   ; D0B7   0300 0080 0280 00D5
        DECLE   $00FF,  $01AA,  $0280,  $0000   ; D0BB   00FF 01AA 0280 0000
        DECLE   $025F,  $0100,  $0300,  $0255   ; D0BF   025F 0100 0300 0255
        DECLE   $01FF                           ; D0C3   01FF

        MOVR    R5,     R2                      ; D0C4   00AA
        SUB     .BTAB.00,R0                     ; D0C5   0300 0200
        ADDI    #$0300, R7                      ; D0C7   02FF 0300

        DECLE   $0300,  $0355,  $01FF,  $02AA   ; D0C9   0300 0355 01FF 02AA
        DECLE   $0300,  $0100,  $01FF,  $0101   ; D0CD   0300 0100 01FF 0101
        DECLE   $0101,  $0055,  $00FF           ; D0D1   0101 0055 00FF

        ANDR    R5,     R3                      ; D0D4   01AB
        SUB     .STIC.X.0,R1                    ; D0D5   0301 0000
        ADDI    #$0100, R7                      ; D0D7   02FF 0100

        DECLE   $0200,  $0300,  $0301,  $0101   ; D0D9   0200 0300 0301 0101
        DECLE   $0201,  $0101,  $0001           ; D0DD   0201 0101 0001

        SUBR    R0,     R0                      ; D0E0   0100
        SUB     .ISRVEC.0,R0                    ; D0E1   0300 0100
        SUBR    R2,     R7                      ; D0E3   0117

        ANDR    R6,     R5                      ; D0E4   01B5
        ADD@    R6,     R5                      ; D0E5   02F5
        RLC     R1,     2                       ; D0E6   0055
        SUB@    R2,     R7                      ; D0E7   0317

        SUBR    R0,     R0                      ; D0E8   0100
        B       L_D1EB                          ; D0E9   0200 0100

        CMPR    R2,     R7                      ; D0EB   0157
        CMPR    R2,     R4                      ; D0EC   0154
        MVO@    R6,     R2                      ; D0ED   0256
L_D0EE:
        CMPR    R2,     R4                      ; D0EE   0154
        DECLE   $0027,  $0000                   ; D0EF   0027 0000

        B       L_D0F3                          ; D0F1   0200 0000

L_D0F3:
        RSWD    R2                              ; D0F3   003A
        DECLE   $0122,  $0222,  $0022,  $023B   ; D0F4   0122 0222 0022 023B

        SUBR    R0,     R0                      ; D0F8   0100
        SUB     .BTAB.00,R0                     ; D0F9   0300 0200
        ANDR    R7,     R3                      ; D0FB   01BB
        MOVR    R4,     R2                      ; D0FC   00A2
        AND@    R6,     R3                      ; D0FD   03B3
        MVI@    R4,     R2                      ; D0FE   02A2
        MVII    #$0300, R3                      ; D0FF   02BB 0300
        SUB     G_0300, R0                      ; D101   0300 0300
        SUBR    R7,     R2                      ; D103   013A
        AND@    R5,     R2                      ; D104   03AA
        SUBR    R7,     R2                      ; D105   013A
        AND@    R5,     R2                      ; D106   03AA
        ADCR    R3                              ; D107   002B
        SUBR    R0,     R0                      ; D108   0100
        B       L_D20B                          ; D109   0200 0100

        DECLE   $0220,  $0120,  $0220           ; D10B   0220 0120 0220

        SUB@    R4,     R0                      ; D10E   0320
        ANDI    #$0100, R0                      ; D10F   03B8 0100
        SUB     .STIC.X.0,R0                    ; D111   0300 0000
        ADD@    R1,     R6                      ; D113   02CE
        MOVR    R5,     R2                      ; D114   00AA
        ADD@    R1,     R6                      ; D115   02CE
        MOVR    R5,     R2                      ; D116   00AA
        ADDR    R1,     R2                      ; D117   00CA
L_D118:
        SUBR    R0,     R0                      ; D118   0100
        DECLE   $0000,  $0200,  $0188           ; D119   0000 0200 0188

        ANDR    R1,     R0                      ; D11C   0188
        MOVR    R1,     R0                      ; D11D   0088
        AND@    R1,     R0                      ; D11E   0388
        ADD@    R5,     R6                      ; D11F   02EE
        SUBR    R0,     R0                      ; D120   0100
        SUBR    R0,     R0                      ; D121   0100
        SUBR    R0,     R0                      ; D122   0100
        INCR    R6                              ; D123   000E
        SUBR    R1,     R0                      ; D124   0108
        SUBR    R1,     R6                      ; D125   010E
        SUBR    R0,     R2                      ; D126   0102
L_D127:
        BGT     L_D129                          ; D127   020E 0000
L_D129:
        B       L_D12B                          ; D129   0200 0000

L_D12B:
        ADDR    R5,     R0                      ; D12B   00E8
        ANDR    R1,     R0                      ; D12C   0188
L_D12D:
        ADDR    R1,     R0                      ; D12D   00C8
        MOVR    R1,     R0                      ; D12E   0088
        XOR@    R5,     R6                      ; D12F   03EE
        SUBR    R0,     R0                      ; D130   0100
L_D131:
        B       L_D433                          ; D131   0200 0300

        XOR@    R5,     R6                      ; D133   03EE
        ANDR    R1,     R0                      ; D134   0188
        XOR@    R1,     R0                      ; D135   03C8
        MOVR    R1,     R0                      ; D136   0088
        ADD@    R5,     R6                      ; D137   02EE
        SUBR    R0,     R0                      ; D138   0100
        SUB     .STIC.X.0,R0                    ; D139   0300 0000
        ADDR    R4,     R0                      ; D13B   00E0
        CMPR    R0,     R0                      ; D13C   0140
        MVO     R0,     G_0340                  ; D13D   0240 0340
        CMP     .ISRVEC.0,R0                    ; D13F   0340 0100
        SUB     .STIC.X.0,R0                    ; D141   0300 0000
        BGT     L_D24F                          ; D143   020E 010A
        BGT     L_D14F                          ; D145   020E 0008

        SUBR    R1,     R0                      ; D147   0108
        SUBR    R0,     R0                      ; D148   0100
L_D149:
        SUB     .ISRVEC.0,R0                    ; D149   0300 0100
        ADDR    R5,     R6                      ; D14B   00EE
        ANDR    R5,     R0                      ; D14C   01A8
        MVI@    R5,     R0                      ; D14D   02A8
        MVI@    R5,     R0                      ; D14E   02A8
L_D14F:
        XORR    R5,     R6                      ; D14F   01EE
        SUBR    R0,     R0                      ; D150   0100
        B       L_D453                          ; D151   0200 0300

        AND@    R5,     R6                      ; D153   03AE
        ANDR    R5,     R0                      ; D154   01A8
        ADD@    R1,     R4                      ; D155   02CC
        AND@    R5,     R0                      ; D156   03A8
        MVI@    R5,     R6                      ; D157   02AE
        SUB     G_0300, R0                      ; D158   0300 0300
        SUB     .BTAB.E0,R0                     ; D15A   0300 02E0
        SWAP    R0,     1                       ; D15C   0040
        SWAP    R0,     1                       ; D15D   0040
        CMPR    R0,     R0                      ; D15E   0140
        CMP     .STIC.X.0,R0                    ; D15F   0340 0000
        SUBR    R0,     R0                      ; D161   0100
        B       L_D267                          ; D162   0200 0103

        SUBR    R0,     R2                      ; D164   0102
        SUBR    R0,     R3                      ; D165   0103
        EIS                                     ; D166   0002
L_D167:
        SUB     .ISRVEC.0,R2                    ; D167   0302 0100
        DECLE   $0300,  $0100,  $00BB,  $01AA   ; D169   0300 0100 00BB 01AA
        DECLE   $02BB,  $01A2,  $01A2,  $0100   ; D16D   02BB 01A2 01A2 0100
        DECLE   $0300,  $0100,  $02A2,  $01A2   ; D171   0300 0100 02A2 01A2
        DECLE   $02A3,  $0121,  $0139,  $0000   ; D175   02A3 0121 0139 0000

        B       L_D17B                          ; D179   0200 0000

L_D17B:
        TSTR    R0                              ; D17B   0080
        ANDR    R0,     R0                      ; D17C   0180
        TSTR    R0                              ; D17D   0080
        SUBR    R0,     R0                      ; D17E   0100
        SUBR    R0,     R0                      ; D17F   0100
        SUBR    R0,     R0                      ; D180   0100
L_D181:
        SUB     .ISRVEC.0,R0                    ; D181   0300 0100
        ADDR    R5,     R6                      ; D183   00EE
        ANDR    R1,     R2                      ; D184   018A
        XOR@    R5,     R6                      ; D185   03EE
        SUBR    R5,     R0                      ; D186   0128
        ADDR    R5,     R0                      ; D187   00E8
        SUBR    R0,     R0                      ; D188   0100
        B       L_D38B                          ; D189   0200 0200

        ANDR    R4,     R4                      ; D18B   01A4
        ANDR    R6,     R4                      ; D18C   01B4
        MVII    #$03AC, R4                      ; D18D   02BC 03AC
        MVI@    R4,     R4                      ; D18F   02A4
        SUBR    R7,     R2                      ; D190   013A
        BNOV    L_D058                          ; D191   022A 013A

        SUB@    R5,     R2                      ; D193   032A
        SUBR    R5,     R2                      ; D194   012A
        B       L_D297                          ; D195   0200 0100

        SUBR    R0,     R0                      ; D197   0100
        ANDR    R1,     R0                      ; D198   0188
        XOR@    R3,     R0                      ; D199   03D8
        ADDR    R7,     R0                      ; D19A   00F8
        MVI@    R5,     R0                      ; D19B   02A8
        AND@    R1,     R0                      ; D19C   0388
        SUB     G_0300, R0                      ; D19D   0300 0300
        SUBR    R0,     R0                      ; D19F   0100
        SUBR    R0,     R3                      ; D1A0   0103
        EIS                                     ; D1A1   0002
L_D1A2:
        DIS                                     ; D1A2   0003
        DECLE   $0100,  $0103,  $0100,  $0000   ; D1A3   0100 0103 0100 0000

        SUB     G_01AB, R0                      ; D1A7   0300 01AB
L_D1A9:
        SUB@    R5,     R2                      ; D1A9   032A
        ANDR    R7,     R2                      ; D1AA   01BA
        MOVR    R5,     R2                      ; D1AB   00AA
        ANDR    R5,     R3                      ; D1AC   01AB
        B       L_D2AF                          ; D1AD   0200 0100

        SUBR    R0,     R0                      ; D1AF   0100
        ANDR    R7,     R3                      ; D1B0   01BB
        AND@    R5,     R1                      ; D1B1   03A9
        ANDR    R5,     R1                      ; D1B2   01A9
        MVI@    R5,     R1                      ; D1B3   02A9
        ANDR    R7,     R1                      ; D1B4   01B9
        B       L_D2B7                          ; D1B5   0200 0100

        DECLE   $0100,  $0080,  $0200,  $0000   ; D1B7   0100 0080 0200 0000
        DECLE   $0000,  $0100,  $0000,  $0100   ; D1BB   0000 0100 0000 0100
        DECLE   $0100,  $0100,  $0300,  $0100   ; D1BF   0100 0100 0300 0100
        DECLE   $00EE,  $018A,  $03EE,  $012A   ; D1C3   00EE 018A 03EE 012A
        DECLE   $00EA,  $0100,  $0200,  $0200   ; D1C7   00EA 0100 0200 0200
        DECLE   $01EE,  $0188,  $02CC,  $0388   ; D1CB   01EE 0188 02CC 0388
        DECLE   $028E,  $0100,  $0200,  $0100   ; D1CF   028E 0100 0200 0100

        XOR@    R5,     R2                      ; D1D3   03EA
        CMPR    R1,     R2                      ; D1D4   014A
        MVO@    R6,     R1                      ; D1D5   024E
        CMPR    R0,     R4                      ; D1D6   0144
        CMPR    R0,     R4                      ; D1D7   0144
        SUBR    R0,     R0                      ; D1D8   0100
L_D1D9:
        SUB     .STIC.X.0,R0                    ; D1D9   0300 0000
        DECLE   $0210                           ; D1DB   0210

        SUB@    R6,     R0                      ; D1DC   0330
        SUB@    R2,     R0                      ; D1DD   0310
        SUB@    R2,     R0                      ; D1DE   0310
        SUBR    R7,     R0                      ; D1DF   0138
        SUBR    R0,     R0                      ; D1E0   0100
        B       L_D3E3                          ; D1E1   0200 0200

        CMPR    R6,     R0                      ; D1E3   0170
        SUBR    R2,     R0                      ; D1E4   0110
        CMPR    R6,     R0                      ; D1E5   0170
        SWAP    R0,     1                       ; D1E6   0040
        PSHR    R0                              ; D1E7   0270
        SUBR    R0,     R0                      ; D1E8   0100
        B       L_D3EB                          ; D1E9   0200 0200

L_D1EB:
        CMPR    R6,     R0                      ; D1EB   0170
        DECLE   $0110,  $0230                   ; D1EC   0110 0230

        DECR    R0                              ; D1EE   0010
        CMP@    R6,     R0                      ; D1EF   0370
        SUBR    R0,     R0                      ; D1F0   0100
        B       L_D3F3                          ; D1F1   0200 0200

        DECLE   $0350,  $0050,  $0270,  $0010   ; D1F3   0350 0050 0270 0010
        DECLE   $0010,  $0100,  $0000,  $0200   ; D1F7   0010 0100 0000 0200

        CMP@    R6,     R0                      ; D1FB   0370
        CMPR    R0,     R0                      ; D1FC   0140
        PSHR    R0                              ; D1FD   0270
        SUB@    R2,     R0                      ; D1FE   0310
        CMP@    R6,     R0                      ; D1FF   0370
        SUBR    R0,     R0                      ; D200   0100
        B       L_D303                          ; D201   0200 0100

        DECLE   $0170,  $0140,  $0270,  $0350   ; D203   0170 0140 0270 0350
        DECLE   $0270,  $0100,  $0200,  $0200   ; D207   0270 0100 0200 0200
L_D20B:
        CMPR    R6,     R0                      ; D20B   0170
        SUBR    R2,     R0                      ; D20C   0110
        B       L_D0EE                          ; D20D   0220 0120

        DECLE   $0320,  $0300,  $0300,  $0300   ; D20F   0320 0300 0300 0300
        DECLE   $0170,  $0250,  $0170,  $0050   ; D213   0170 0250 0170 0050
        DECLE   $0170,  $0100,  $0000,  $0000   ; D217   0170 0100 0000 0000
        DECLE   $0370,  $0150,  $0270,  $0310   ; D21B   0370 0150 0270 0310
        DECLE   $0310,  $0100,  $0200           ; D21F   0310 0100 0200

        SUB     .BTAB.B8,R0                     ; D222   0300 02B8
        ANDR    R5,     R0                      ; D224   01A8
        MVI@    R5,     R0                      ; D225   02A8
        AND@    R5,     R0                      ; D226   03A8
        MVII    #$0100, R0                      ; D227   02B8 0100
        B       L_D42B                          ; D229   0200 0200

        DECLE   $0150,  $0150,  $0250,  $0150   ; D22B   0150 0150 0250 0150
        DECLE   $0150,  $0000                   ; D22F   0150 0000

        B       L_D233                          ; D231   0200 0000

L_D233:
        MOVR    R7,     R0                      ; D233   00B8
        ANDR    R1,     R0                      ; D234   0188
        MOVR    R7,     R0                      ; D235   00B8
        ANDR    R4,     R0                      ; D236   01A0
        ANDI    #$0100, R0                      ; D237   03B8 0100
        B       L_D53B                          ; D239   0200 0300

        ANDI    #$0188, R0                      ; D23B   03B8 0188
L_D23D:
        MVI@    R3,     R0                      ; D23D   0298
        AND@    R1,     R0                      ; D23E   0388
        MOVR    R7,     R0                      ; D23F   00B8
        SUBR    R0,     R0                      ; D240   0100
        B       L_D343                          ; D241   0200 0100

        MOVR    R5,     R0                      ; D243   00A8
        ANDR    R5,     R0                      ; D244   01A8
        MVII    #$0388, R0                      ; D245   02B8 0388
        ANDR    R1,     R0                      ; D247   0188
        SUBR    R0,     R0                      ; D248   0100
        B       L_D24B                          ; D249   0200 0000

L_D24B:
        ANDR    R7,     R0                      ; D24B   01B8
        ANDR    R4,     R0                      ; D24C   01A0
        MVII    #$0388, R0                      ; D24D   02B8 0388
L_D24F:
        MVII    #$03EE, R0                      ; D24F   02B8 03EE
        DECLE   $03AA,  $03AE,  $01A8,  $02E8   ; D251   03AA 03AE 01A8 02E8
        DECLE   $0200                           ; D255   0200

        SUBR    R0,     R0                      ; D256   0100
        SUBR    R0,     R0                      ; D257   0100
        XORR    R5,     R1                      ; D258   01E9
        ANDR    R1,     R5                      ; D259   018D
        ADDR    R1,     R7                      ; D25A   00CF

        DECLE   $038B,  $01E9,  $0300,  $0100   ; D25B   038B 01E9 0300 0100
        DECLE   $0000                           ; D25F   0000

        SUBR    R4,     R0                      ; D260   0120
        MVO@    R0,     R4                      ; D261   0260
        SUBR    R4,     R3                      ; D262   0123
        SUBR    R4,     R0                      ; D263   0120
        CMPR    R6,     R0                      ; D264   0170
        SUB     .ISRVEC.0,R0                    ; D265   0300 0100
L_D267:
        B       L_D3A1                          ; D267   0200 0138

        DECLE   $0208,  $0110,  $0110,  $0010   ; D269   0208 0110 0110 0010
        DECLE   $0200,  $0000,  $0000,  $0170   ; D26D   0200 0000 0000 0170
        DECLE   $0050,  $0173,  $0110,  $0110   ; D271   0050 0173 0110 0110
        DECLE   $0300,  $0100,  $0000           ; D275   0300 0100 0000
L_D278:
        SUBR    R2,     R7                      ; D278   0117

        SUB@    R6,     R4                      ; D279   0334
        SUBR    R2,     R7                      ; D27A   0117

        DECR    R1                              ; D27B   0011
        SUBR    R2,     R7                      ; D27C   0117
        B       L_D47F                          ; D27D   0200 0200

        DECLE   $0100,  $010E,  $020A,  $030A   ; D27F   0100 010E 020A 030A
        DECLE   $020A,  $010E,  $0202,  $0106   ; D283   020A 010E 0202 0106
        DECLE   $0302,  $0102,  $0202,  $010E   ; D287   0302 0102 0202 010E
        DECLE   $0102,  $010E,  $0308,  $000E   ; D28B   0102 010E 0308 000E
        DECLE   $020E                           ; D28F   020E

        SUB     G_0306, R2                      ; D290   0302 0306
        SUB     G_010E, R2                      ; D292   0302 010E
        SUB@    R1,     R2                      ; D294   030A
        INCR    R2                              ; D295   000A
        SUB@    R1,     R6                      ; D296   030E
L_D297:
        SUBR    R0,     R2                      ; D297   0102
        SUBR    R0,     R2                      ; D298   0102
        INCR    R6                              ; D299   000E
        SUBR    R1,     R0                      ; D29A   0108
        INCR    R6                              ; D29B   000E
        SUBR    R0,     R2                      ; D29C   0102
        BGT     L_D2A7                          ; D29D   020E 0008

        SUBR    R1,     R0                      ; D29F   0108
        SUBR    R1,     R6                      ; D2A0   010E
        SUB@    R1,     R2                      ; D2A1   030A
        SUBR    R1,     R6                      ; D2A2   010E
        BGT     L_D3A7                          ; D2A3   020E 0102
        BEQ     L_D3AB                          ; D2A5   0204 0104

L_D2A7:
        SUBR    R0,     R4                      ; D2A7   0104
        INCR    R6                              ; D2A8   000E
        BNOV    L_D2B9                          ; D2A9   020A 000E

        INCR    R2                              ; D2AB   000A
        SUBR    R1,     R6                      ; D2AC   010E
        SUBR    R1,     R6                      ; D2AD   010E
        SUBR    R1,     R2                      ; D2AE   010A
L_D2AF:
        SUB@    R1,     R6                      ; D2AF   030E
        SUBR    R0,     R2                      ; D2B0   0102
        BOV     L_D2B3                          ; D2B1   0202 0000

L_D2B3:
        SUBR    R0,     R0                      ; D2B3   0100
        SUBR    R1,     R6                      ; D2B4   010E
        SUB     .STIC.X.0,R0                    ; D2B5   0300 0000
L_D2B7:
        MVI@    R2,     R4                      ; D2B7   0294
        XORR    R7,     R6                      ; D2B8   01FE
L_D2B9:
        ADDI    #$02F9, R4                      ; D2B9   02FC 02F9
        ADDR    R6,     R2                      ; D2BB   00F2
        CLRR    R4                              ; D2BC   01E4
        ADD@    R1,     R0                      ; D2BD   02C8
        AND@    R2,     R0                      ; D2BE   0390
        SUB@    R4,     R0                      ; D2BF   0320
        SUBR    R0,     R0                      ; D2C0   0100
        B       L_D5C3                          ; D2C1   0200 0300

        DECLE   $0000,  $0300,  $0300,  $0300   ; D2C3   0000 0300 0300 0300
        DECLE   $0300,  $007F,  $003F,  $009F   ; D2C7   0300 007F 003F 009F
        DECLE   $034F,  $0027,  $0013,  $0009   ; D2CB   034F 0027 0013 0009
        DECLE   $0304,  $0102,  $0004,  $020A   ; D2CF   0304 0102 0004 020A
        DECLE   $0116,  $012E,  $0300,  $01BE   ; D2D3   0116 012E 0300 01BE
        DECLE   $0000,  $0000,  $0200,  $0000   ; D2D7   0000 0000 0200 0000
        DECLE   $0000                           ; D2DB   0000

        SUBR    R0,     R0                      ; D2DC   0100
        B       L_D3DE                          ; D2DD   0200 00FF

        DECLE   $01FF,  $01FF,  $0200,  $03FF   ; D2DF   01FF 01FF 0200 03FF
        DECLE   $0000,  $010F,  $0203,  $0300   ; D2E3   0000 010F 0203 0300
        DECLE   $0000,  $0010,  $0208,  $0010   ; D2E7   0000 0010 0208 0010
        DECLE   $0008,  $0110,  $0300,  $00EE   ; D2EB   0008 0110 0300 00EE
        DECLE   $0377,  $0101,  $0303,  $0107   ; D2EF   0377 0101 0303 0107
        DECLE   $000F,  $011F,  $023F,  $007F   ; D2F3   000F 011F 023F 007F
        DECLE   $01FF                           ; D2F7   01FF

        XORR    R7,     R5                      ; D2F8   01FD
        SUB     .STIC.X.0,R0                    ; D2F9   0300 0000
        B       L_D3FD                          ; D2FB   0200 0100

        DECLE   $0300,  $0100,  $0000,  $01FF   ; D2FD   0300 0100 0000 01FF
        DECLE   $0200,  $01FF                   ; D301   0200 01FF
L_D303:
        SUBR    R0,     R0                      ; D303   0100
        DECLE   $01FF,  $02FF,  $01FF,  $0000   ; D304   01FF 02FF 01FF 0000
        DECLE   $03FF,  $03FF,  $03FF,  $01FF   ; D308   03FF 03FF 03FF 01FF
        DECLE   $0000,  $01FF                   ; D30C   0000 01FF

        B       L_D410                          ; D30E   0200 0100

        SUBR    R0,     R1                      ; D310   0101
        SUB     G_0107, R3                      ; D311   0303 0107
        SUB@    R1,     R7                      ; D313   030F
        SUBR    R3,     R7                      ; D314   011F

        DECLE   $023F,  $027F,  $01C1,  $0180   ; D315   023F 027F 01C1 0180
        DECLE   $03C1,  $01FF,  $003F,  $01C0   ; D319   03C1 01FF 003F 01C0
        DECLE   $023F,  $0280,  $0055,  $00AA   ; D31D   023F 0280 0055 00AA
        DECLE   $0255,  $002A,  $0015,  $010A   ; D321   0255 002A 0015 010A
        DECLE   $0301,  $0007,  $0000,  $01FF   ; D325   0301 0007 0000 01FF
        DECLE   $02F0,  $03FF                   ; D329   02F0 03FF

        SUB     .ISRVEC.0,R0                    ; D32B   0300 0100
        B       L_D62F                          ; D32D   0200 0300

        SUB     G_0180, R0                      ; D32F   0300 0180
        ADD     G_03E0, R0                      ; D331   02C0 03E0
        ADDR    R6,     R0                      ; D333   00F0
        ADDR    R7,     R0                      ; D334   00F8
        ADDI    #$03FE, R4                      ; D335   02FC 03FE
        MVI     G_0301, R3                      ; D337   0283 0301
        AND     G_03FE, R3                      ; D339   0383 03FE
        XORR    R7,     R1                      ; D33B   01F9
        CLRC                                    ; D33C   0006
        ADDI    #$0202, R0                      ; D33D   02F8 0202
        CMPR    R2,     R5                      ; D33F   0155
        ANDR    R5,     R2                      ; D340   01AA
        CMPR    R2,     R4                      ; D341   0154
        ANDR    R5,     R0                      ; D342   01A8
L_D343:
        RLC     R0,     1                       ; D343   0050
        ANDR    R4,     R0                      ; D344   01A0
        B       L_D707                          ; D345   0200 03C0

        DECLE   $0300,  $0080,  $02C0,  $00E0   ; D347   0300 0080 02C0 00E0
        DECLE   $00F0,  $01F8,  $02FC,  $03FE   ; D34B   00F0 01F8 02FC 03FE
        DECLE   $01FF,  $01FF,  $030F,  $02FF   ; D34F   01FF 01FF 030F 02FF
        DECLE   $0100,  $0000,  $0200,  $0000   ; D353   0100 0000 0200 0000
        DECLE   $0000,  $0103,  $0207,  $011F   ; D357   0000 0103 0207 011F
        DECLE   $03FF,  $0100,  $03FF,  $0000   ; D35B   03FF 0100 03FF 0000
        DECLE   $0255,  $01C0,  $02E0,  $01F8   ; D35F   0255 01C0 02E0 01F8
        DECLE   $01FF                           ; D363   01FF

        SUBR    R0,     R0                      ; D364   0100
        ADDI    #$0000, R7                      ; D365   02FF 0000

L_D367:
        CMPR    R2,     R5                      ; D367   0155
        DECLE   $0102,  $0301,  $0100,  $0000   ; D368   0102 0301 0100 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; D36C   0000 0200 0000 0000
        DECLE   $0100,  $0200,  $0100,  $0200   ; D370   0100 0200 0100 0200
        DECLE   $0100,  $0200,  $00EE,  $0177   ; D374   0100 0200 00EE 0177
        DECLE   $01FF,  $02FF,  $03FF,  $01FF   ; D378   01FF 02FF 03FF 01FF

        SUBR    R0,     R0                      ; D37C   0100
        ADDI    #$0200, R7                      ; D37D   02FF 0200

        SUBR    R0,     R1                      ; D37F   0101
        ANDR    R5,     R2                      ; D380   01AA
        MVO@    R5,     R2                      ; D381   0255
        AND@    R5,     R2                      ; D382   03AA
        RLC     R0,     2                       ; D383   0054
        ANDR    R5,     R0                      ; D384   01A8
        SUB     .BTAB.00,R0                     ; D385   0300 0200
        SUBR    R0,     R0                      ; D387   0100
        TSTR    R0                              ; D388   0080
        CMP     .BTAB.A0,R0                     ; D389   0340 02A0
L_D38B:
        ADD@    R2,     R0                      ; D38B   02D0
        DECLE   $03E8,  $0300,  $03FA,  $0200   ; D38C   03E8 0300 03FA 0200
        DECLE   $00FE,  $0001,  $00FE,  $0201   ; D390   00FE 0001 00FE 0201
        DECLE   $01FE,  $01FF,  $00FF,  $0300   ; D394   01FE 01FF 00FF 0300
        DECLE   $01FF,  $0100,  $00FF,  $0200   ; D398   01FF 0100 00FF 0200
        DECLE   $0100                           ; D39C   0100

        SUB     .ISRVEC.0,R0                    ; D39D   0300 0100
        SUBR    R0,     R0                      ; D39F   0100
        SUBR    R0,     R0                      ; D3A0   0100
L_D3A1:
        SUB     .STIC.C.4,R0                    ; D3A1   0300 001C
        SUBI    #$013E, R6                      ; D3A3   033E 013E
        SUBI    #$001C, R6                      ; D3A5   033E 001C
L_D3A7:
        SUB     .PSG0.lft_hand,R0               ; D3A7   0300 01FF
        DECLE   $0200,  $01FF                   ; D3A9   0200 01FF
L_D3AB:
        SUBR    R1,     R6                      ; D3AB   010E
        SUBR    R3,     R7                      ; D3AC   011F

        DECLE   $021F,  $031F,  $000E,  $011C   ; D3AD   021F 031F 000E 011C
        DECLE   $023E,  $033E,  $003E,  $001C   ; D3B1   023E 033E 003E 001C
        DECLE   $0200,  $0000,  $0000,  $01FE   ; D3B5   0200 0000 0000 01FE
        DECLE   $00FE,  $017C,  $0100,  $0100   ; D3B9   00FE 017C 0100 0100
        DECLE   $0200,  $0100,  $0000           ; D3BD   0200 0100 0000

        XORR    R5,     R6                      ; D3C0   01EE
        XOR@    R5,     R6                      ; D3C1   03EE
L_D3C2:
        XORR    R5,     R6                      ; D3C2   01EE
        DECLE   $03EE,  $01EE,  $0200,  $00EE   ; D3C3   03EE 01EE 0200 00EE
        DECLE   $0100,  $01FF                   ; D3C7   0100 01FF
L_D3C9:
        SUB     .PSG1.lft_hand,R0               ; D3C9   0300 00FF
        DECLE   $0200,  $01F0,  $02C0,  $0100   ; D3CB   0200 01F0 02C0 0100
        DECLE   $0000                           ; D3CF   0000

        AND@    R5,     R2                      ; D3D0   03AA
        CMP@    R2,     R5                      ; D3D1   0355
L_D3D2:
        AND@    R5,     R2                      ; D3D2   03AA
        DECLE   $0215,  $000A,  $0000,  $0000   ; D3D3   0215 000A 0000 0000
        DECLE   $0100,  $01FF,  $03FF,  $03FF   ; D3D7   0100 01FF 03FF 03FF
        DECLE   $01FF,  $01FF,  $00FF           ; D3DB   01FF 01FF 00FF
L_D3DE:
        ADDI    #$03FF, R7                      ; D3DE   02FF 03FF

        SUBR    R1,     R0                      ; D3E0   0108
        SUB@    R4,     R0                      ; D3E1   0320
        PSHR    R4                              ; D3E2   0274
L_D3E3:
        CMPR    R6,     R0                      ; D3E3   0170
        DECLE   $0138,  $0238                   ; D3E4   0138 0238

        SUB@    R3,     R4                      ; D3E6   031C
        COMR    R4                              ; D3E7   001C
        SUBR    R1,     R4                      ; D3E8   010C
        SKIP                                    ; D3E9   0208
        SUBR    R0,     R0                      ; D3EA   0100
L_D3EB:
        SUBR    R0,     R0                      ; D3EB   0100
        DECLE   $0000,  $0200,  $0000,  $0000   ; D3EC   0000 0200 0000 0000
        DECLE   $01FF,  $01FF,  $00FF           ; D3F0   01FF 01FF 00FF
L_D3F3:
        XORI    #$01FC, R6                      ; D3F3   03FE 01FC
        DECLE   $03F8,  $01F0,  $00E0,  $01C0   ; D3F5   03F8 01F0 00E0 01C0
        DECLE   $021E,  $013F                   ; D3F9   021E 013F

        SUBR    R3,     R7                      ; D3FB   011F
        SUBR    R0,     R7                      ; D3FC   0107

L_D3FD:
        SUB     .ISRVEC.0,R0                    ; D3FD   0300 0100
        B       L_D501                          ; D3FF   0200 0100
        B       L_D503                          ; D401   0200 0100

        DECLE   $0100,  $0100,  $0210,  $0328   ; D403   0100 0100 0210 0328
        DECLE   $0238,  $0310,  $0300,  $0300   ; D407   0238 0310 0300 0300
        DECLE   $0200,  $0000,  $0000,  $0100   ; D40B   0200 0000 0000 0100
        DECLE   $0200                           ; D40F   0200
L_D410:
        B       L_D612                          ; D410   0200 0200

        DECLE   $0000,  $0300,  $0100,  $003C   ; D412   0000 0300 0100 003C
        DECLE   $027E                           ; D416   027E

        ADDI    #$0100, R7                      ; D417   02FF 0100
        B       L_D51B                          ; D419   0200 0100

        SUBR    R0,     R0                      ; D41B   0100
        SUBR    R0,     R0                      ; D41C   0100
        SUB     .STIC.X.0,R0                    ; D41D   0300 0000
        SUB     .ISRVEC.0,R0                    ; D41F   0300 0100
        SUB     .STIC.X.0,R0                    ; D421   0300 0000
        SUB     .ISRVEC.0,R0                    ; D423   0300 0100
        ADDI    #$02FF, R7                      ; D425   02FF 02FF

        DECLE   $01FF                           ; D427   01FF

        SUBR    R0,     R0                      ; D428   0100
        B       L_D42B                          ; D429   0200 0000

L_D42B:
        SUB     .ISRVEC.0,R0                    ; D42B   0300 0100
        B       L_D42F                          ; D42D   0200 0000

L_D42F:
        SUBR    R0,     R0                      ; D42F   0100
        MOVR    R7,     R0                      ; D430   00B8
        B       L_D434                          ; D431   0200 0001

L_D433:
        DIS                                     ; D433   0003
L_D434:
        SUBR    R0,     R6                      ; D434   0106
        DECLE   $000D,  $031B,  $0037           ; D435   000D 031B 0037

        CMPR    R5,     R7                      ; D438   016F
        B       L_D73B                          ; D439   0200 0300

        DECLE   $0300,  $01C0,  $03F0,  $01FC   ; D43B   0300 01C0 03F0 01FC
        DECLE   $01FE,  $01FF,  $0298,  $020C   ; D43F   01FE 01FF 0298 020C
        DECLE   $0102,  $0101,  $0303,  $0014   ; D443   0102 0101 0303 0014
        DECLE   $0301,  $010B,  $0201,  $0100   ; D447   0301 010B 0201 0100
        DECLE   $0100,  $0300,  $0300,  $0300   ; D44B   0100 0300 0300 0300
        DECLE   $0200,  $0000,  $0000           ; D44F   0200 0000 0000

        SUBR    R0,     R0                      ; D452   0100
L_D453:
        SUBR    R0,     R0                      ; D453   0100
        DECLE   $03FF,  $0000,  $02FF,  $02FF   ; D454   03FF 0000 02FF 02FF
        DECLE   $01FF,  $020D,  $0003,  $0107   ; D458   01FF 020D 0003 0107
        DECLE   $0106,  $0206,  $0303           ; D45C   0106 0206 0303

        BNC     L_D568                          ; D45F   0209 0107
        B       L_D563                          ; D461   0200 0100

        DECLE   $0000                           ; D463   0000

        ADDR    R7,     R6                      ; D464   00FE
L_D465:
        BUSC    L_D528                          ; D465   0207 00C1

        DECLE   $0000                           ; D467   0000

        SUBR    R0,     R0                      ; D468   0100
        B       L_D76B                          ; D469   0200 0300

        DECLE   $01F0,  $0180,  $03F0,  $02E0   ; D46B   01F0 0180 03F0 02E0
        DECLE   $01F0,  $0078,  $0200,  $0000   ; D46F   01F0 0078 0200 0000
        DECLE   $0000,  $0100,  $0200,  $0000   ; D473   0000 0100 0200 0000
        DECLE   $027E,  $01FF,  $021D           ; D477   027E 01FF 021D

        SUBR    R7,     R3                      ; D47A   013B
        CMPR    R6,     R6                      ; D47B   0176
        XORR    R5,     R4                      ; D47C   01EC
        ADD@    R3,     R0                      ; D47D   02D8
        MOVR    R6,     R0                      ; D47E   00B0
L_D47F:
        CMPR    R4,     R0                      ; D47F   0160
        DECLE   $01C0,  $0300,  $0100,  $0100   ; D480   01C0 0300 0100 0100
        DECLE   $017F,  $03E0,  $0183,  $0000   ; D484   017F 03E0 0183 0000

        SUBR    R0,     R0                      ; D488   0100
        B       L_D6C9                          ; D489   0200 023E

        DECLE   $013D,  $0103,  $023B,  $013F   ; D48B   013D 0103 023B 013F
        DECLE   $0237,  $0177,  $037E,  $01FF   ; D48F   0237 0177 037E 01FF
        DECLE   $01F9,  $01D8,  $0266,  $0300   ; D493   01F9 01D8 0266 0300
        DECLE   $0000,  $0300,  $0300,  $0300   ; D497   0000 0300 0300 0300
        DECLE   $0100,  $0303,  $020F,  $013F   ; D49B   0100 0303 020F 013F
        DECLE   $007F,  $01FF                   ; D49F   007F 01FF

        MOVR    R0,     R1                      ; D4A1   0081
        SUB     .STIC.X.7,R3                    ; D4A2   0303 0007
        SUBR    R1,     R7                      ; D4A4   010F

        DECLE   $021F,  $023F,  $017F,  $01FF   ; D4A5   021F 023F 017F 01FF
        DECLE   $0208,  $0310,  $0208,  $0110   ; D4A9   0208 0310 0208 0110
        DECLE   $0208,  $0110,  $00FF           ; D4AD   0208 0110 00FF

        SUBR    R0,     R0                      ; D4B0   0100
        B       L_D4B3                          ; D4B1   0200 0000

L_D4B3:
        SUBR    R0,     R0                      ; D4B3   0100
        SUB     G_0301, R0                      ; D4B4   0300 0301
        SUB     G_0307, R3                      ; D4B6   0303 0307
        INCR    R6                              ; D4B8   000E
        SWAP    R2,     1                       ; D4B9   0042
        SWAP    R2,     1                       ; D4BA   0042
        CMP     G_0342, R2                      ; D4BB   0342 0342
        SWAP    R2,     1                       ; D4BD   0042
        MVO     R2,     .BTAB.42                ; D4BE   0242 0242
        CMPR    R0,     R2                      ; D4C0   0142
        SETC                                    ; D4C1   0007
        BESC    L_D4DB                          ; D4C2   020F 0017
        SUBR    R2,     R7                      ; D4C4   0117

        DECLE   $021F,  $031B,  $030C,  $0103   ; D4C5   021F 031B 030C 0103
        DECLE   $0318,  $0118,  $0318,  $0018   ; D4C9   0318 0118 0318 0018
        DECLE   $0218                           ; D4CD   0218

        COMR    R0                              ; D4CE   0018
        COMR    R0                              ; D4CF   0018
        SUBR    R3,     R0                      ; D4D0   0118
        B       L_D853                          ; D4D1   0200 0380

        DECLE   $01C0,  $01E0,  $02F0,  $00F8   ; D4D3   01C0 01E0 02F0 00F8
        DECLE   $01FC,  $01FE,  $0200,  $03FF   ; D4D7   01FC 01FE 0200 03FF
L_D4DB:
        B       L_D6DC                          ; D4DB   0200 01FF

        DECLE   $0300,  $0200,  $0100,  $0000   ; D4DD   0300 0200 0100 0000

        ADD     G_0070, R0                      ; D4E1   02C0 0070
        COMR    R4                              ; D4E3   001C
        SUBR    R0,     R7                      ; D4E4   0107

        DECLE   $0301,  $0000,  $0000,  $0100   ; D4E5   0301 0000 0000 0100
        DECLE   $0203,  $0305,  $0001           ; D4E9   0203 0305 0001

        SUBR    R0,     R2                      ; D4EC   0102
        BLE     L_D4EF                          ; D4ED   0206 0000
L_D4EF:
        SUBR    R0,     R7                      ; D4EF   0107

        DECLE   $0100,  $03FF,  $0266,  $01B0   ; D4F0   0100 03FF 0266 01B0
        DECLE   $01C0,  $02F0,  $0198,  $01C8   ; D4F4   01C0 02F0 0198 01C8
        DECLE   $0100,  $037B,  $00D2,  $0232   ; D4F8   0100 037B 00D2 0232

        ANDR    R4,     R4                      ; D4FC   01A4
        CMP     .STIC.X.2,R0                    ; D4FD   0340 0002
        SUB     .STIC.X.0,R0                    ; D4FF   0300 0000
L_D501:
        CMP@    R3,     R2                      ; D501   035A
        DECLE   $03C7                           ; D502   03C7
L_D503:
        XORI    #$03FD, R6                      ; D503   03FE 03FD
        XORI    #$03FD, R6                      ; D505   03FE 03FD
        CMPI    #$0000, R6                      ; D507   037E 0000
        ADDR    R0,     R0                      ; D509   00C0
        ADDR    R7,     R0                      ; D50A   00F8
        XORI    #$03FC, R6                      ; D50B   03FE 03FC
        ADDR    R6,     R3                      ; D50D   00F3
        ADD@    R4,     R7                      ; D50E   02E7

        DECLE   $03EF,  $01FF                   ; D50F   03EF 01FF

        ADDR    R7,     R2                      ; D511   00FA
        ADDI    #$00F0, R3                      ; D512   02FB 00F0
        XORR    R4,     R0                      ; D514   01E0
        ADD     G_0330, R0                      ; D515   02C0 0330
        XOR@    R6,     R0                      ; D517   03F0
        XORR    R4,     R0                      ; D518   01E0
L_D519:
        SUBI    #$0107, R3                      ; D519   033B 0107
L_D51B:
        SUB     .STIC.X.0,R2                    ; D51B   0302 0000
        DECLE   $0200,  $0000,  $0000,  $0100   ; D51D   0200 0000 0000 0100
        DECLE   $02F9,  $03F7,  $01FF,  $01CC   ; D521   02F9 03F7 01FF 01CC
        DECLE   $0203,  $0007                   ; D525   0203 0007

        SUBR    R3,     R0                      ; D527   0118
L_D528:
        SUBR    R0,     R1                      ; D528   0101
        B       L_D82B                          ; D529   0200 0300
        B       L_D62D                          ; D52B   0200 0100

        DECLE   $0300,  $02E0,  $01FE,  $00FF   ; D52D   0300 02E0 01FE 00FF
        DECLE   $0200,  $0000,  $0000           ; D531   0200 0000 0000

        SUBR    R0,     R0                      ; D534   0100
        AND     G_00C0, R0                      ; D535   0380 00C0
        ADDR    R4,     R0                      ; D537   00E0
        CMPR    R6,     R0                      ; D538   0170
        B       L_D83B                          ; D539   0200 0300

L_D53B:
        SUB     .ISRVEC.0,R0                    ; D53B   0300 0100
        B       L_D73F                          ; D53D   0200 0200

        SUBR    R0,     R3                      ; D53F   0103
        SUBR    R0,     R7                      ; D540   0107

        DECLE   $02B8,  $03DC,  $026E,  $0137   ; D541   02B8 03DC 026E 0137
        DECLE   $031B,  $010D,  $0006,  $0103   ; D545   031B 010D 0006 0103
        DECLE   $0300,  $0000,  $0300,  $00FF   ; D549   0300 0000 0300 00FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; D54D   03FF 03FF 03FF 03FF

        SUB     G_0300, R0                      ; D551   0300 0300
        CMPI    #$00FE, R4                      ; D553   037C 00FE
        ADDR    R7,     R6                      ; D555   00FE
        ADDR    R7,     R6                      ; D556   00FE
L_D557:
        XORI    #$037C, R6                      ; D557   03FE 037C
        DECLE   $0000                           ; D559   0000

        B       L_D85C                          ; D55A   0200 0300

        SUBR    R0,     R0                      ; D55C   0100
        ADDR    R0,     R0                      ; D55D   00C0
        CMPR    R6,     R0                      ; D55E   0170
        SUB@    R3,     R4                      ; D55F   031C
        SUBR    R0,     R7                      ; D560   0107

        DECLE   $023E                           ; D561   023E

        SARC    R3,     2                       ; D562   007F
L_D563:
        CMPR    R7,     R7                      ; D563   017F
        DECLE   $017F,  $027F                   ; D564   017F 027F

        SUBI    #$0100, R6                      ; D566   033E 0100
L_D568:
        SUBR    R0,     R0                      ; D568   0100
        DECLE   $02FF,  $01FF,  $01FF,  $01FF   ; D569   02FF 01FF 01FF 01FF

        XORI    #$00E1, R3                      ; D56D   03FB 00E1
        SUB     .STIC.X.0,R0                    ; D56F   0300 0000
        B       L_D573                          ; D571   0200 0000

L_D573:
        RSWD    R3                              ; D573   003B
        DECLE   $010E,  $0218,  $0218,  $013C   ; D574   010E 0218 0218 013C
        DECLE   $0120,  $0200                   ; D578   0120 0200

        SUB     .BTAB.C0,R0                     ; D57A   0300 02C0
        ADDR    R6,     R0                      ; D57C   00F0
        ADD@    R6,     R0                      ; D57D   02F0
        ADDR    R4,     R4                      ; D57E   00E4
L_D57F:
        ADDR    R1,     R7                      ; D57F   00CF

        DECLE   $01FE,  $027E                   ; D580   01FE 027E

        SUBI    #$011F, R7                      ; D582   033F 011F
        SUBR    R1,     R7                      ; D584   010F

        DECLE   $0207,  $0003,  $0101,  $0100   ; D585   0207 0003 0101 0100
        DECLE   $0342,  $0140,  $0042,  $0142   ; D589   0342 0140 0042 0142
        DECLE   $0202,  $0042,  $0342,  $0142   ; D58D   0202 0042 0342 0142
        DECLE   $0200                           ; D591   0200

        B       L_D595                          ; D592   0200 0001

        SETC                                    ; D594   0007
L_D595:
        SUB@    R3,     R3                      ; D595   031B
        SUB@    R1,     R7                      ; D596   030F

        DECLE   $0367,  $03F9,  $0300,  $0300   ; D597   0367 03F9 0300 0300
        DECLE   $0301,  $0000,  $0081,  $01C1   ; D59B   0301 0000 0081 01C1
        DECLE   $03D3,  $03B1,  $0100,  $0100   ; D59F   03D3 03B1 0100 0100
        DECLE   $0118,  $0120,  $034E,  $0159   ; D5A3   0118 0120 034E 0159
        DECLE   $03B6,  $01AD,  $0252,  $0226   ; D5A7   03B6 01AD 0252 0226
        DECLE   $0108,  $0152,  $0254,  $0324   ; D5AB   0108 0152 0254 0324
        DECLE   $02A0,  $0180,  $0380,  $00C0   ; D5AF   02A0 0180 0380 00C0
        DECLE   $0300,  $0300,  $03FF,  $03FF   ; D5B3   0300 0300 03FF 03FF
        DECLE   $01FF,  $03FF,  $02FF,  $00FF   ; D5B7   01FF 03FF 02FF 00FF
        DECLE   $0300,  $0100,  $0200           ; D5BB   0300 0100 0200

        SUBR    R0,     R0                      ; D5BE   0100
        SUB     .ISRVEC.0,R0                    ; D5BF   0300 0100
        B       L_D5C3                          ; D5C1   0200 0000

L_D5C3:
        SUBR    R0,     R0                      ; D5C3   0100
        SUBR    R0,     R0                      ; D5C4   0100
        B       L_D8D7                          ; D5C5   0200 0310

        DECLE   $0190,  $01F0,  $02F4,  $01F4   ; D5C7   0190 01F0 02F4 01F4
        DECLE   $0166,  $037E,  $0340,  $033C   ; D5CB   0166 037E 0340 033C
        DECLE   $0324,  $003C,  $0000,  $0000   ; D5CF   0324 003C 0000 0000
        DECLE   $027C                           ; D5D3   027C

        SARC    R0,     2                       ; D5D4   007C
        ADDR    R7,     R6                      ; D5D5   00FE
        ADDR    R5,     R6                      ; D5D6   00EE
        ADD@    R2,     R6                      ; D5D7   02D6
        XORR    R0,     R6                      ; D5D8   01C6
        XORR    R5,     R6                      ; D5D9   01EE
        ADDR    R7,     R6                      ; D5DA   00FE
        ADDR    R7,     R6                      ; D5DB   00FE
        XORR    R7,     R6                      ; D5DC   01FE
        SARC    R0,     2                       ; D5DD   007C
        CMPI    #$0300, R4                      ; D5DE   037C 0300
        SUBR    R0,     R0                      ; D5E0   0100
        TSTR    R0                              ; D5E1   0080
        TSTR    R0                              ; D5E2   0080
        XOR     G_0140, R0                      ; D5E3   03C0 0140
        SLR     R0,     1                       ; D5E5   0060
        B       L_D2B7                          ; D5E6   0220 0330

        DECLE   $0110,  $0018,  $0108,  $010C   ; D5E8   0110 0018 0108 010C
        DECLE   $0104,  $0106,  $0102,  $0003   ; D5EC   0104 0106 0102 0003
        DECLE   $0001,  $027F,  $00E6,  $00D9   ; D5F0   0001 027F 00E6 00D9
        DECLE   $01A5,  $00C0,  $009B,  $02BC   ; D5F4   01A5 00C0 009B 02BC
        DECLE   $0162,  $00CD,  $02D2,  $01A5   ; D5F8   0162 00CD 02D2 01A5
        DECLE   $0149,  $00D0,  $03A5,  $0060   ; D5FC   0149 00D0 03A5 0060
        DECLE   $01C1,  $0001                   ; D600   01C1 0001

        SUB     .STIC.X.3,R3                    ; D602   0303 0003
        SUBR    R0,     R7                      ; D604   0107

        DECLE   $0000                           ; D605   0000

        MVO@    R1,     R1                      ; D606   0249
        CMPR    R5,     R3                      ; D607   016B
        SUBR    R1,     R7                      ; D608   010F
        INCR    R7                              ; D609   000F

        DECLE   $0004                           ; D60A   0004
L_D60B:
        SUBR    R1,     R6                      ; D60B   010E
        DECLE   $0122,  $010E,  $0004,  $020C   ; D60C   0122 010E 0004 020C
        DECLE   $0100,  $0001                   ; D610   0100 0001
L_D612:
        SUBR    R0,     R3                      ; D612   0103
        DIS                                     ; D613   0003
        SUBR    R0,     R7                      ; D614   0107

        SUBR    R0,     R0                      ; D615   0100
        SWAP    R1,     1                       ; D616   0041
        CMP@    R5,     R3                      ; D617   036B
        SUB@    R1,     R7                      ; D618   030F
        SUB@    R1,     R7                      ; D619   030F

        DECLE   $0304,  $020E,  $0006,  $000C   ; D61A   0304 020E 0006 000C
        DECLE   $0004,  $010C,  $0208,  $0000   ; D61E   0004 010C 0208 0000
        DECLE   $0380,  $02C0,  $01E0,  $00F0   ; D622   0380 02C0 01E0 00F0
        DECLE   $00F8,  $03CC,  $01E4,  $0060   ; D626   00F8 03CC 01E4 0060
        DECLE   $0000                           ; D62A   0000

        SUBR    R0,     R0                      ; D62B   0100
        SUBR    R0,     R0                      ; D62C   0100
L_D62D:
        SUBR    R0,     R0                      ; D62D   0100
        DECLE   $0000                           ; D62E   0000
L_D62F:
        B       L_D731                          ; D62F   0200 0100

        DECLE   $0000,  $0380,  $03C0,  $01E0   ; D631   0000 0380 03C0 01E0
        DECLE   $00F8,  $03FC,  $01CC,  $00E0   ; D635   00F8 03FC 01CC 00E0
        DECLE   $0260,  $0000,  $0000,  $0100   ; D639   0260 0000 0000 0100
        DECLE   $0000,  $0000,  $0200,  $0100   ; D63D   0000 0000 0200 0100
        DECLE   $0018,  $0218,  $011C,  $010C   ; D641   0018 0218 011C 010C
        DECLE   $000E,  $037E,  $009E,  $018E   ; D645   000E 037E 009E 018E
        DECLE   $007E,  $039E,  $008E,  $017E   ; D649   007E 039E 008E 017E
        DECLE   $009E,  $028E,  $017E,  $018C   ; D64D   009E 028E 017E 018C
        DECLE   $0000,  $0018,  $0118,  $011C   ; D651   0000 0018 0118 011C
        DECLE   $010C,  $000C,  $027E,  $019E   ; D655   010C 000C 027E 019E
        DECLE   $008E,  $017E,  $009E,  $018E   ; D659   008E 017E 009E 018E
        DECLE   $017E,  $009E,  $038E,  $037E   ; D65D   017E 009E 038E 037E
        DECLE   $03A8,  $0300,  $0201,  $0003   ; D661   03A8 0300 0201 0003
        DECLE   $0006,  $000D,  $031B,  $0037   ; D665   0006 000D 031B 0037
        DECLE   $016F,  $01FA,  $03F3,  $01F8   ; D669   016F 01FA 03F3 01F8
        DECLE   $00BC,  $01D8,  $01CD,  $01E6   ; D66D   00BC 01D8 01CD 01E6
        DECLE   $02F8,  $029B,  $010D,  $0102   ; D671   02F8 029B 010D 0102
        DECLE   $0205,  $0101,  $0300,  $0101   ; D675   0205 0101 0300 0101
        DECLE   $0203                           ; D679   0203

        B       L_D67C                          ; D67A   0200 0000

L_D67C:
        XORR    R6,     R0                      ; D67C   01F0
        DECLE   $0380,  $01F0,  $00E0,  $0030   ; D67D   0380 01F0 00E0 0030
        DECLE   $0278,  $0000,  $00FF,  $01FF   ; D681   0278 0000 00FF 01FF
        DECLE   $00FF,  $0000,  $02FF,  $0100   ; D685   00FF 0000 02FF 0100

        B       L_D68B                          ; D689   0200 0000

L_D68B:
        XORR    R7,     R4                      ; D68B   01FC
        DECLE   $01FF,  $0207,  $0301,  $0001   ; D68C   01FF 0207 0301 0001
        DECLE   $0100,  $0200,  $0301,  $0001   ; D690   0100 0200 0301 0001
        DECLE   $0303,  $0303,  $0303,  $0103   ; D694   0303 0303 0303 0103
        DECLE   $0001                           ; D698   0001
L_D699:
        BC      L_D89B                          ; D699   0201 0200

        SUB@    R1,     R5                      ; D69B   030D
        ANDR    R7,     R2                      ; D69C   01BA
        RRC     R0,     2                       ; D69D   0074
        XOR@    R1,     R6                      ; D69E   03CE
        ADD@    R4,     R6                      ; D69F   02E6
        XORR    R6,     R3                      ; D6A0   01F3
        MVO@    R7,     R4                      ; D6A1   0267
        B       L_D7A4                          ; D6A2   0200 0100

        SUBR    R0,     R0                      ; D6A4   0100
        B       L_D9B7                          ; D6A5   0200 0310

        DECLE   $027C,  $01FE,  $02FF,  $013E   ; D6A7   027C 01FE 02FF 013E
        DECLE   $017D,  $00FA,  $02F4,  $00E8   ; D6AB   017D 00FA 02F4 00E8
        DECLE   $00D0,  $01A0,  $0041,  $0000   ; D6AF   00D0 01A0 0041 0000
        DECLE   $023F,  $01FF                   ; D6B3   023F 01FF

        ADD@    R4,     R0                      ; D6B5   02E0
        TSTR    R0                              ; D6B6   0080
        ANDR    R0,     R0                      ; D6B7   0180
        SUBR    R0,     R0                      ; D6B8   0100
        B       L_D9BB                          ; D6B9   0200 0300

        DECLE   $00C0,  $0130,  $026E,  $03DF   ; D6BB   00C0 0130 026E 03DF
        DECLE   $00B7                           ; D6BF   00B7

        AND     G_0300, R3                      ; D6C0   0383 0300
        AND     G_0140, R0                      ; D6C2   0380 0140
        SWAP    R0,     1                       ; D6C4   0040
        CMP     G_03C0, R0                      ; D6C5   0340 03C0
        XOR     G_0140, R0                      ; D6C7   03C0 0140
L_D6C9:
        ANDR    R0,     R0                      ; D6C9   0180
        DECLE   $0080,  $0203,  $010F,  $021F   ; D6CA   0080 0203 010F 021F
        DECLE   $033F,  $037F,  $01FF,  $03FF   ; D6CE   033F 037F 01FF 03FF
        DECLE   $0100,  $0000,  $0100,  $0280   ; D6D2   0100 0000 0100 0280
        DECLE   $00C0,  $01E0,  $01F0,  $03F8   ; D6D6   00C0 01E0 01F0 03F8
        DECLE   $0100,  $0000                   ; D6DA   0100 0000
L_D6DC:
        SUBR    R0,     R0                      ; D6DC   0100
        BC      L_D8E2                          ; D6DD   0201 0203
        SUBR    R0,     R7                      ; D6DF   0107
        SUBR    R1,     R7                      ; D6E0   010F

        DECLE   $021F                           ; D6E1   021F

        CMP     G_0342, R2                      ; D6E2   0342 0342
        CMPR    R0,     R2                      ; D6E4   0142
        MVO     R2,     G_0342                  ; D6E5   0242 0342
        MVO     R2,     G_0342                  ; D6E7   0242 0342
        CMP     G_0303, R2                      ; D6E9   0342 0303
        SUBR    R0,     R7                      ; D6EB   0107

        DECLE   $010E,  $010D,  $000D,  $030D   ; D6EC   010E 010D 000D 030D
        DECLE   $0105,  $0103,  $0000,  $0380   ; D6F0   0105 0103 0000 0380
        DECLE   $01C0,  $03E0,  $01F0,  $00F8   ; D6F4   01C0 03E0 01F0 00F8
        DECLE   $01FC,  $03FE,  $00FF,  $0200   ; D6F8   01FC 03FE 00FF 0200
        DECLE   $01FF,  $0200,  $00FF,  $01FF   ; D6FC   01FF 0200 00FF 01FF
        DECLE   $01FF,  $02FF,  $020C,  $010C   ; D700   01FF 02FF 020C 010C
        DECLE   $010C,  $020C,  $010C           ; D704   010C 020C 010C
L_D707:
        SUB@    R1,     R4                      ; D707   030C
        DECLE   $010C,  $020C,  $0200,  $0000   ; D708   010C 020C 0200 0000
        DECLE   $013B,  $031E,  $0118,  $0018   ; D70C   013B 031E 0118 0018
        DECLE   $003C,  $0220,  $00F7,  $00C2   ; D710   003C 0220 00F7 00C2
        DECLE   $01F0,  $0178,  $005C,  $009E   ; D714   01F0 0178 005C 009E
        DECLE   $01AF,  $022F,  $0363,  $03A2   ; D718   01AF 022F 0363 03A2
        DECLE   $0126,  $0200                   ; D71C   0126 0200

        CMP@    R4,     R7                      ; D71E   0367
        SUB@    R4,     R0                      ; D71F   0320
        SUBR    R0,     R1                      ; D720   0101
        B       L_DA83                          ; D721   0200 0360

        SLR     R0,     1                       ; D723   0060
        XOR     G_0300, R0                      ; D724   03C0 0300
L_D726:
        XOR     G_01C0, R0                      ; D726   03C0 01C0
        CLRR    R0                              ; D728   01C0
        B       L_D867                          ; D729   0200 013C

        DECLE   $037E,  $01FF,  $00FF,  $03FF   ; D72B   037E 01FF 00FF 03FF

        CMPI    #$013C, R6                      ; D72F   037E 013C
L_D731:
        B       L_DA70                          ; D731   0200 033D

        DECLE   $021E,  $010B,  $021C           ; D733   021E 010B 021C

        SUBR    R3,     R6                      ; D736   011E
        SUBR    R3,     R7                      ; D737   011F

        DECLE   $0018,  $021E                   ; D738   0018 021E

        TSTR    R0                              ; D73A   0080
L_D73B:
        TSTR    R0                              ; D73B   0080
        CLRR    R0                              ; D73C   01C0
        CLRR    R0                              ; D73D   01C0
        SWAP    R0,     1                       ; D73E   0040
L_D73F:
        SWAP    R0,     1                       ; D73F   0040
        CLRR    R0                              ; D740   01C0
        MVO     R0,     G_0301                  ; D741   0240 0301
        XOR     .PSG0.chn_a_lo,R0               ; D743   03C0 01F0
        ADDI    #$00FC, R0                      ; D745   02F8 00FC
        XORI    #$01FF, R6                      ; D747   03FE 01FF
        ADDI    #$0200, R7                      ; D749   02FF 0200

        DECLE   $0300,  $0100,  $0200,  $0180   ; D74B   0300 0100 0200 0180
        DECLE   $0180,  $0140,  $0340,  $0100   ; D74F   0180 0140 0340 0100
        DECLE   $0000,  $0300,  $0342,  $032C   ; D753   0000 0300 0342 032C
        DECLE   $0100,  $0201,  $0201,  $00FE   ; D757   0100 0201 0201 00FE
        DECLE   $036C,  $0133,  $0138,  $001E   ; D75B   036C 0133 0138 001E
        DECLE   $0302,  $0100,  $0300,  $0115   ; D75F   0302 0100 0300 0115
        DECLE   $0005,  $0109,  $0302,  $0007   ; D763   0005 0109 0302 0007
        DECLE   $0200                           ; D767   0200

        SUBR    R1,     R6                      ; D768   010E
        B       L_D7E7                          ; D769   0200 007C

L_D76B:
        ANDR    R7,     R6                      ; D76B   01BE
        CMPR    R3,     R7                      ; D76C   015F
        BESC    L_D557                          ; D76D   022F 0217

        SUBR    R1,     R3                      ; D76F   010B
        SUBR    R0,     R5                      ; D770   0105
        MVI     .ISRVEC.1,R2                    ; D771   0282 0101
        SUB     .ISRVEC.0,R1                    ; D773   0301 0100
        B       L_D978                          ; D775   0200 0201

        DECLE   $0042,  $0140,  $0301,  $0100   ; D777   0042 0140 0301 0100
        DECLE   $00FF,  $00FF                   ; D77B   00FF 00FF

        ADDI    #$0000, R7                      ; D77D   02FF 0000

L_D77F:
        ADDR    R7,     R4                      ; D77F   00FC
        DECLE   $0100,  $0100,  $00FF,  $02FF   ; D780   0100 0100 00FF 02FF
        DECLE   $01FB,  $02E1,  $0000,  $0100   ; D784   01FB 02E1 0000 0100
        DECLE   $0100,  $0200,  $0298,  $016C   ; D788   0100 0200 0298 016C
        DECLE   $0172,  $0239,  $031D,  $0015   ; D78C   0172 0239 031D 0015
        DECLE   $030D,  $0319,  $0300,  $01FF   ; D790   030D 0319 0300 01FF
        DECLE   $02FF,  $03FF                   ; D794   02FF 03FF

        SUBR    R0,     R0                      ; D796   0100
        SUBI    #$0100, R7                      ; D797   033F 0100

        DECLE   $0100,  $0042,  $0240,  $0142   ; D799   0100 0042 0240 0142
        DECLE   $0242,  $0102,  $0142,  $0142   ; D79D   0242 0102 0142 0142
        DECLE   $0242,  $0100,  $0000           ; D7A1   0242 0100 0000
L_D7A4:
        DIS                                     ; D7A4   0003
        DECLE   $0207,  $001F,  $003F,  $01FF   ; D7A5   0207 001F 003F 01FF
        DECLE   $00EF,  $0088,  $02D0,  $01C1   ; D7A9   00EF 0088 02D0 01C1
        DECLE   $0260,  $00A1,  $01B1,  $01B3   ; D7AD   0260 00A1 01B1 01B3
        DECLE   $0221                           ; D7B1   0221

        SUB     .STIC.X.0,R0                    ; D7B2   0300 0000
        SUBR    R0,     R0                      ; D7B4   0100
        B       L_DAC7                          ; D7B5   0200 0310

        DECLE   $0090,  $03F0,  $03F0,  $03E4   ; D7B7   0090 03F0 03F0 03E4
        DECLE   $017E,  $0346,  $003A,  $026E   ; D7BB   017E 0346 003A 026E
        DECLE   $033C,  $0138,  $0000           ; D7BF   033C 0138 0000

        SUBR    R0,     R0                      ; D7C2   0100
        B       L_D8C5                          ; D7C3   0200 0100
        B       L_DACD                          ; D7C5   0200 0306

        DECLE   $0319,  $0136,  $032D,  $0152   ; D7C7   0319 0136 032D 0152
        DECLE   $0126,  $0108,  $0352,  $0054   ; D7CB   0126 0108 0352 0054
        DECLE   $0224,  $00A0,  $0280,  $00D3   ; D7CF   0224 00A0 0280 00D3
        DECLE   $0093,  $0192,  $0092,  $001E   ; D7D3   0093 0192 0092 001E
        DECLE   $020D                           ; D7D7   020D

        SUBR    R0,     R1                      ; D7D8   0101
        MVO     R1,     G_0023                  ; D7D9   0241 0023
        SUBR    R3,     R5                      ; D7DB   011D
        ANDR    R0,     R1                      ; D7DC   0181
        ADD     G_03FD, R3                      ; D7DD   02C3 03FD
L_D7DF:
        ADDR    R4,     R3                      ; D7DF   00E3
        DECLE   $01FF,  $02FF,  $0300,  $0000   ; D7E0   01FF 02FF 0300 0000

        SUB@    R1,     R6                      ; D7E4   030E
        SUB@    R3,     R6                      ; D7E5   031E
        SUB@    R3,     R7                      ; D7E6   031F
L_D7E7:
        SUBR    R3,     R7                      ; D7E7   011F

        DECLE   $033D,  $013D,  $0338,  $0338   ; D7E8   033D 013D 0338 0338
        DECLE   $0138,  $013C,  $012C,  $0014   ; D7EC   0138 013C 012C 0014
        DECLE   $0116,  $020A,  $0218,  $0018   ; D7F0   0116 020A 0218 0018
        DECLE   $0118,  $0318,  $0018,  $0218   ; D7F4   0118 0318 0018 0218
        DECLE   $0118,  $0218                   ; D7F8   0118 0218

        SUBR    R3,     R0                      ; D7FA   0118
        SUBR    R0,     R0                      ; D7FB   0100
        SUBR    R0,     R0                      ; D7FC   0100
        B       L_D8FF                          ; D7FD   0200 0100

        DECLE   $0100,  $0000                   ; D7FF   0100 0000

        B       L_DB82                          ; D801   0200 037F

        CMPR    R7,     R7                      ; D803   017F
        XORR    R4,     R6                      ; D804   01E6
        ADDR    R3,     R1                      ; D805   00D9
        MOVR    R4,     R5                      ; D806   00A5
        XOR     G_019B, R0                      ; D807   03C0 019B
        ANDI    #$0162, R4                      ; D809   03BC 0162
        XORR    R1,     R5                      ; D80B   01CD
        CLRR    R2                              ; D80C   01D2
        AND@    R4,     R5                      ; D80D   03A5
        SLL     R1,     1                       ; D80E   0049
        XOR@    R3,     R0                      ; D80F   03D8
        ANDR    R4,     R5                      ; D810   01A5
        MVO@    R0,     R4                      ; D811   0260
        BLE     L_D81A                          ; D812   0206 0006

        SUBR    R1,     R6                      ; D814   010E
        BGT     L_DA17                          ; D815   020E 0200

        SUBR    R2,     R2                      ; D817   0112
        ANDR    R2,     R6                      ; D818   0196
        ADD@    R3,     R6                      ; D819   02DE
L_D81A:
        SUB@    R3,     R6                      ; D81A   031E
        DECLE   $030C,  $011C,  $0204,  $030C   ; D81B   030C 011C 0204 030C
        DECLE   $021C,  $0308,  $0318,  $0303   ; D81F   021C 0308 0318 0303
        DECLE   $0300,  $0006,  $0000,  $0001   ; D823   0300 0006 0000 0001
        DECLE   $0000,  $0002,  $0000           ; D827   0000 0002 0000

        SETC                                    ; D82A   0007
L_D82B:
        DECR    R0                              ; D82B   0010
        DECLE   $0002,  $0010,  $0005,  $0000   ; D82C   0002 0010 0005 0000
        DECLE   $0003,  $0010,  $0000,  $0010   ; D830   0003 0010 0000 0010
        DECLE   $0006,  $0000,  $0001,  $0000   ; D834   0006 0000 0001 0000
        DECLE   $0002,  $0000                   ; D838   0002 0000

        SETC                                    ; D83A   0007
L_D83B:
        DECR    R0                              ; D83B   0010
        DECLE   $0002,  $0010,  $0005,  $0000   ; D83C   0002 0010 0005 0000

        DIS                                     ; D840   0003
        DECR    R0                              ; D841   0010
        CLRC                                    ; D842   0006
        MOVR    R3,     R2                      ; D843   009A
        TSTR    R0                              ; D844   0080
        TSTR    R3                              ; D845   009B
        MOVR    R3,     R0                      ; D846   0098
        MOVR    R3,     R4                      ; D847   009C
        ADDR    R7,     R0                      ; D848   00F8
        MOVR    R3,     R5                      ; D849   009D
        MOVR    R0,     R6                      ; D84A   0086
        MOVR    R3,     R7                      ; D84B   009F

        SETC                                    ; D84C   0007
        MOVR    R4,     R1                      ; D84D   00A1
        RLC     R3,     1                       ; D84E   0053
        MOVR    R4,     R1                      ; D84F   00A1
        MOVR    R3,     R0                      ; D850   0098
        MOVR    R4,     R1                      ; D851   00A1
        ADDR    R5,     R1                      ; D852   00E9
L_D853:
        MOVR    R4,     R1                      ; D853   00A1
        DECLE   $0007,  $0000,  $0086,  $0000   ; D854   0007 0000 0086 0000
        DECLE   $0001,  $0001,  $0082,  $0001   ; D858   0001 0001 0082 0001
L_D85C:
        SETC                                    ; D85C   0007
        DECLE   $0012,  $0082,  $0012,  $0005   ; D85D   0012 0082 0012 0005
        DECLE   $0003,  $0083,  $0013,  $0000   ; D861   0003 0083 0013 0000

        DECR    R4                              ; D865   0014
        MOVR    R2,     R6                      ; D866   0096

L_D867:
        JSRE    R4,     .EXEC.005               ; D867   0004 0011 0005
        DECLE   $0092,  $0005                   ; D86A   0092 0005
L_D86C:
        DECR    R7                              ; D86C   0017

        DECR    R6                              ; D86D   0016
        TSTR    R2                              ; D86E   0092
        DECR    R6                              ; D86F   0016
        DECR    R5                              ; D870   0015
        SETC                                    ; D871   0007
        MOVR    R2,     R3                      ; D872   0093
L_D873:
        DECR    R7                              ; D873   0017

        DECLE   $0070,  $0008,  $0007,  $0000   ; D874   0070 0008 0007 0000
        DECLE   $0097,  $0000,  $0002,  $0001   ; D878   0097 0000 0002 0001
        DECLE   $0084,  $0011,  $0007,  $0012   ; D87C   0084 0011 0007 0012
        DECLE   $0082,  $0012,  $0005,  $0003   ; D880   0082 0012 0005 0003
        DECLE   $0083,  $0013,  $0000           ; D884   0083 0013 0000

        DECR    R4                              ; D887   0014
        MOVR    R2,     R6                      ; D888   0096

        JSRE    R4,     .EXEC.005               ; D889   0004 0011 0005
        DECLE   $0092,  $0005                   ; D88C   0092 0005
L_D88E:
        DECR    R7                              ; D88E   0017

        DECR    R6                              ; D88F   0016
        TSTR    R2                              ; D890   0092
        DECR    R6                              ; D891   0016
        RRC     R2,     1                       ; D892   0072
        SETC                                    ; D893   0007
        MOVR    R2,     R3                      ; D894   0093
L_D895:
        DECR    R7                              ; D895   0017

        RRC     R0,     1                       ; D896   0070
        INCR    R0                              ; D897   0008
        PSHR    R5                              ; D898   0275
        PSHR    R0                              ; D899   0270
        PSHR    R1                              ; D89A   0271
L_D89B:
        MVI     .ISRVEC.0,R1                    ; D89B   0281 0100
        SWAP    R1,     1                       ; D89D   0041
        XOR     .ISRVEC.1,R1                    ; D89E   03C1 0101
        MOVR    R7,     R0                      ; D8A0   00B8
        ADDI    #$0008, R0                      ; D8A1   02F8 0008
        MVO     R0,     .ISRVEC.0               ; D8A3   0240 0100
        SWAP    R0,     1                       ; D8A5   0040
        MVO     R0,     .ISRVEC.1               ; D8A6   0240 0101
L_D8A8:
        DECR    R7                              ; D8A8   0017

        SUBI    #$0008, R6                      ; D8A9   033E 0008
        MVO     R1,     .ISRVEC.1               ; D8AB   0241 0101
        SWAP    R1,     1                       ; D8AD   0041
        MVO     R1,     .ISRVEC.0               ; D8AE   0241 0100
        PULR    R1                              ; D8B0   02B1
        PULR    R0                              ; D8B1   02B0
L_D8B2:
        PULR    R7                              ; D8B2   02B7

        PSHR    R5                              ; D8B3   0275
        CLRR    R5                              ; D8B4   01ED
        MOVR    R5,     R0                      ; D8B5   00A8
L_D8B6:
        MVO@    R0,     R5                      ; D8B6   0268
        CMPI    #$0018, R5                      ; D8B7   037D 0018
        BLE     L_D8B6                          ; D8B9   0226 0004
        PULR    R7                              ; D8BB   02B7

        MVI@    R5,     R0                      ; D8BC   02A8
        MVO     R0,     G_0118                  ; D8BD   0240 0118
        MVO     R5,     G_035C                  ; D8BF   0245 035C
        PULR    R7                              ; D8C1   02B7

        PSHR    R5                              ; D8C2   0275
        MVI     G_0118, R0                      ; D8C3   0280 0118
L_D8C5:
        DECR    R0                              ; D8C5   0010
        BMI     L_D8B2                          ; D8C6   022B 0015

        MVO     R0,     G_0118                  ; D8C8   0240 0118
        BNEQ    L_D8B2                          ; D8CA   022C 0019

        MVI     G_035C, R5                      ; D8CC   0285 035C
        MVO     R0,     G_035C                  ; D8CE   0240 035C
        MOVR    R5,     R7                      ; D8D0   00AF

        MVI@    R5,     R0                      ; D8D1   02A8
        PSHR    R5                              ; D8D2   0275
        PSHR    R2                              ; D8D3   0272
        MVII    #$033A, R5                      ; D8D4   02BD 033A
L_D8D6:
        MVI@    R5,     R2                      ; D8D6   02AA
L_D8D7:
        SLL     R2,     1                       ; D8D7   004A
        SWAP    R2,     1                       ; D8D8   0042
        ANDI    #$001F, R2                      ; D8D9   03BA 001F
        CMPR    R0,     R2                      ; D8DB   0142
        BNEQ    L_D8D6                          ; D8DC   022C 0007

        SUBI    #$033B, R5                      ; D8DE   033D 033B
        PULR    R2                              ; D8E0   02B2
        PULR    R7                              ; D8E1   02B7

L_D8E2:
        PSHR    R5                              ; D8E2   0275
        DECLE   $01C0,  $0004,  $0198,  $00EE   ; D8E3   01C0 0004 0198 00EE
        DECLE   $0008,  $0378,  $0011,  $0225   ; D8E7   0008 0378 0011 0225
        DECLE   $0007                           ; D8EB   0007

        PULR    R7                              ; D8EC   02B7

        MVI@    R5,     R0                      ; D8ED   02A8
        PSHR    R5                              ; D8EE   0275
        PSHR    R1                              ; D8EF   0271
        MVII    #$015E, R1                      ; D8F0   02B9 015E
        ADDR    R0,     R1                      ; D8F2   00C1
        CLRR    R5                              ; D8F3   01ED
        MVO@    R5,     R1                      ; D8F4   024D
        ADDI    #$0011, R1                      ; D8F5   02F9 0011
        MVO@    R5,     R1                      ; D8F7   024D
        ADDI    #$01A9, R1                      ; D8F8   02F9 01A9
        MVO@    R5,     R1                      ; D8FA   024D
        ADDI    #$0011, R1                      ; D8FB   02F9 0011
        MVO@    R5,     R1                      ; D8FD   024D
        PULR    R1                              ; D8FE   02B1
L_D8FF:
        PULR    R7                              ; D8FF   02B7

        PSHR    R5                              ; D900   0275
        MVI     G_0130, R5                      ; D901   0285 0130
        TSTR    R5                              ; D903   00AD
        BEQ     L_D90A                          ; D904   0204 0004

        CMPI    #$0003, R5                      ; D906   037D 0003
        BNEQ    L_D914                          ; D908   020C 000A

L_D90A:
        MVI     G_01AD, R5                      ; D90A   0285 01AD
        TSTR    R5                              ; D90C   00AD
        BEQ     L_D914                          ; D90D   0204 0005

        CMP     G_01AE, R1                      ; D90F   0341 01AE
        BEQ     L_D914                          ; D911   0204 0001

        PULR    R5                              ; D913   02B5
L_D914:
        PULR    R7                              ; D914   02B7

        MVI@    R3,     R4                      ; D915   029C
        CMPI    #$00FF, R4                      ; D916   037C 00FF
        BEQ     L_D91B                          ; D918   0204 0001
        PULR    R7                              ; D91A   02B7
L_D91B:
        MOVR    R5,     R7                      ; D91B   00AF

        SUBR    R2,     R0                      ; D91C   0110
        MOVR    R0,     R2                      ; D91D   0082
        BPL     L_D921                          ; D91E   0203 0001

        NEGR    R0                              ; D920   0020
L_D921:
        SUBR    R3,     R1                      ; D921   0119
        MOVR    R1,     R3                      ; D922   008B
        BPL     L_D926                          ; D923   0203 0001

        NEGR    R1                              ; D925   0021
L_D926:
        CMPR    R0,     R1                      ; D926   0141
        BMI     L_D92B                          ; D927   020B 0002

        SLR     R0,     2                       ; D929   0064
        INCR    R7                              ; D92A   000F

L_D92B:
        SLR     R1,     2                       ; D92B   0065
L_D92C:
        ADDR    R1,     R0                      ; D92C   00C8
        MOVR    R5,     R7                      ; D92D   00AF

        PSHR    R5                              ; D92E   0275
        CLRR    R0                              ; D92F   01C0
L_D930:
        INCR    R0                              ; D930   0008
        DECLE   $0004                           ; D931   0004

        ANDR    R3,     R0                      ; D932   0198
        ADDR    R2,     R2                      ; D933   00D2
        ADDI    #$0318, R5                      ; D934   02FD 0318
        MVI@    R5,     R5                      ; D936   02AD
        TSTR    R5                              ; D937   00AD
        BEQ     L_D930                          ; D938   0224 0009
        PULR    R7                              ; D93A   02B7

        MVII    #$0001, R0                      ; D93B   02B8 0001
        INCR    R7                              ; D93D   000F

        CLRR    R0                              ; D93E   01C0
L_D93F:
        PSHR    R5                              ; D93F   0275
        MVII    #$018B, R5                      ; D940   02BD 018B
        ADDR    R0,     R5                      ; D942   00C5
        CLRR    R0                              ; D943   01C0
L_D944:
        MVI@    R5,     R1                      ; D944   02A9
        TSTR    R1                              ; D945   0089
        BEQ     L_D949                          ; D946   0204 0001

        INCR    R0                              ; D948   0008
L_D949:
        CMPI    #$019B, R5                      ; D949   037D 019B
L_D94B:
        BLT     L_D944                          ; D94B   0225 0008
        PULR    R7                              ; D94D   02B7

        PSHR    R5                              ; D94E   0275
        MVII    #$0318, R4                      ; D94F   02BC 0318
        MVII    #$0329, R5                      ; D951   02BD 0329
L_D953:
        MVI@    R4,     R2                      ; D953   02A2
        MVI@    R5,     R3                      ; D954   02AB
        SUBR    R0,     R2                      ; D955   0102
        BPL     L_D959                          ; D956   0203 0001

        NEGR    R2                              ; D958   0022
L_D959:
        CMPI    #$0100, R2                      ; D959   037A 0100
        BGE     L_D967                          ; D95B   020D 000A

        SUBR    R1,     R3                      ; D95D   010B
        BPL     L_D961                          ; D95E   0203 0001

        NEGR    R3                              ; D960   0023
L_D961:
        CMPI    #$0100, R3                      ; D961   037B 0100
        BGE     L_D967                          ; D963   020D 0002

        CMPR    R6,     R7                      ; D965   0177
        PULR    R7                              ; D966   02B7

L_D967:
        CMPI    #$0328, R4                      ; D967   037C 0328
        BLT     L_D953                          ; D969   0225 0017
        PULR    R7                              ; D96B   02B7

        DECLE   $0275,  $0001,  $02B8,  $0000   ; D96C   0275 0001 02B8 0000
        DECLE   $001F,  $0001,  $02B9,  $0000   ; D970   001F 0001 02B9 0000
        DECLE   $0010,  $0004                   ; D974   0010 0004

        ANDR    R3,     R0                      ; D976   0198
        CMPR    R1,     R6                      ; D977   014E
L_D978:
        BEQ     L_D992                          ; D978   0204 0018

        DECLE   $0001,  $0378,  $0000,  $001F   ; D97A   0001 0378 0000 001F
        DECLE   $0205,  $000E,  $02F8,  $0040   ; D97E   0205 000E 02F8 0040
        DECLE   $0001,  $0378,  $0080,  $0027   ; D982   0001 0378 0080 0027
        DECLE   $0225,  $0012,  $0001,  $02B8   ; D986   0225 0012 0001 02B8
        DECLE   $00C0,  $001E,  $0220,  $0018   ; D98A   00C0 001E 0220 0018
        DECLE   $0338,  $0040,  $0220,  $001C   ; D98E   0338 0040 0220 001C
L_D992:
        PSHR    R0                              ; D992   0270
        MVII    #$0006, R0                      ; D993   02B8 0006

        JSR     R5,     X_RAND1                 ; D995   0004 0114 027D

        ADDR    R0,     R1                      ; D998   00C1
        MVII    #$0006, R0                      ; D999   02B8 0006

        JSR     R5,     X_RAND1                 ; D99B   0004 0114 027D

        ADD@    R6,     R0                      ; D99E   02F0
        PULR    R7                              ; D99F   02B7

        MVII    #$0121, R4                      ; D9A0   02BC 0121
        CLRR    R0                              ; D9A2   01C0
L_D9A3:
        CMPI    #$0131, R4                      ; D9A3   037C 0131
        BGE     L_D9AF                          ; D9A5   020D 0008

        MVI@    R4,     R1                      ; D9A7   02A1
        CMPI    #$00FF, R1                      ; D9A8   0379 00FF
        BNEQ    L_D9A3                          ; D9AA   022C 0008

        INCR    R0                              ; D9AC   0008
        B       L_D9A3                          ; D9AD   0220 000B
L_D9AF:
        MOVR    R5,     R7                      ; D9AF   00AF

        PSHR    R5                              ; D9B0   0275
        MVI     G_01AE, R5                      ; D9B1   0285 01AE
        ADDR    R5,     R5                      ; D9B3   00ED
        ADDI    #$0185, R5                      ; D9B4   02FD 0185
        PSHR    R5                              ; D9B6   0275
L_D9B7:
        SDBD                                    ; D9B7   0001
        ADD@    R5,     R0                      ; D9B8   02E8
        PULR    R5                              ; D9B9   02B5
        MVO@    R0,     R5                      ; D9BA   0268
L_D9BB:
        SWAP    R0,     1                       ; D9BB   0040
        NOP                                     ; D9BC   0034
        MVO@    R0,     R5                      ; D9BD   0268
        SWAP    R0,     1                       ; D9BE   0040
        PULR    R7                              ; D9BF   02B7

        DECLE   $0275,  $0004                   ; D9C0   0275 0004

        ANDR    R3,     R0                      ; D9C2   0198
        ANDR    R6,     R0                      ; D9C3   01B0
        PSHR    R0                              ; D9C4   0270

        JSR     R5,     L_5E1E                  ; D9C5   0004 015C 021E

        PULR    R0                              ; D9C8   02B0
        PULR    R7                              ; D9C9   02B7

        DECLE   $0275,  $0270,  $01C0,  $0285   ; D9CA   0275 0270 01C0 0285
        DECLE   $011E,  $037D,  $0005,  $0205   ; D9CE   011E 037D 0005 0205
        DECLE   $0002,  $02C0,  $01AE,  $0004   ; D9D2   0002 02C0 01AE 0004

        ANDR    R3,     R0                      ; D9D6   0198
        ADDR    R2,     R2                      ; D9D7   00D2
        PULR    R0                              ; D9D8   02B0
        PULR    R7                              ; D9D9   02B7

        DECLE   $0275,  $0004,  $0198,  $01CA   ; D9DA   0275 0004 0198 01CA
        DECLE   $02FD,  $0318,  $02AB,  $02FD   ; D9DE   02FD 0318 02AB 02FD
        DECLE   $0010,  $02AC,  $0004           ; D9E2   0010 02AC 0004

        ANDR    R3,     R0                      ; D9E5   0198
        ADDR    R2,     R1                      ; D9E6   00D1
        INCR    R6                              ; D9E7   000E
        ADDI    #$0318, R5                      ; D9E8   02FD 0318
        SUBI    #$0040, R3                      ; D9EA   033B 0040
        MVO@    R3,     R5                      ; D9EC   026B
        ADDI    #$0010, R5                      ; D9ED   02FD 0010
        MVO@    R4,     R5                      ; D9EF   026C
        PULR    R7                              ; D9F0   02B7

        CLRR    R3                              ; D9F1   01DB
L_D9F2:
        SDBD                                    ; D9F2   0001
        MVI@    R4,     R1                      ; D9F3   02A1
        MVO@    R1,     R3                      ; D9F4   0259
        ADDI    #$0008, R3                      ; D9F5   02FB 0008
        SDBD                                    ; D9F7   0001
        MVI@    R4,     R1                      ; D9F8   02A1
        MVO@    R1,     R3                      ; D9F9   0259
        ADDI    #$0008, R3                      ; D9FA   02FB 0008
        SDBD                                    ; D9FC   0001
        MVI@    R4,     R1                      ; D9FD   02A1
        MVO@    R1,     R3                      ; D9FE   0259
        SUBI    #$000F, R3                      ; D9FF   033B 000F
        CMPI    #$0007, R3                      ; DA01   037B 0007
        BLE     L_D9F2                          ; DA03   0226 0012
        MOVR    R5,     R7                      ; DA05   00AF

        DECLE   $0280,  $011C,  $03B8,  $0080   ; DA06   0280 011C 03B8 0080
        DECLE   $020C,  $00C6,  $02B8,  $0008   ; DA0A   020C 00C6 02B8 0008
        DECLE   $0004                           ; DA0E   0004

        ANDR    R4,     R4                      ; DA0F   01A4
        ADD@    R3,     R3                      ; DA10   02DB
        ANDR    R3,     R4                      ; DA11   019C
        BNEQ    L_DA3A                          ; DA12   020C 0026

        JSR     R5,     L_68C7                  ; DA14   0004 0168 00C7

L_DA17:
        BNEQ    L_DA37                          ; DA17   020C 001E

        MVI     G_0182, R0                      ; DA19   0280 0182
        TSTR    R0                              ; DA1B   0080
        BNEQ    L_DA37                          ; DA1C   020C 0019

        MVI     G_0119, R0                      ; DA1E   0280 0119
        CMPI    #$0008, R0                      ; DA20   0378 0008
        BNEQ    L_DA37                          ; DA22   020C 0013

        MVII    #$0120, R1                      ; DA24   02B9 0120
        ADDI    #$0008, R1                      ; DA26   02F9 0008
        MVI     G_011F, R0                      ; DA28   0280 011F
        ANDI    #$0007, R0                      ; DA2A   03B8 0007
        CMP@    R1,     R0                      ; DA2C   0348
        BNEQ    L_DA37                          ; DA2D   020C 0008

        JSR     R5,     L_688C                  ; DA2F   0004 0168 008C

        BEQ     L_DA37                          ; DA32   0204 0003
        J       L_67D3                          ; DA34   0004 0364 03D3
L_DA37:
        J       L_67CD                          ; DA37   0004 0364 03CD

L_DA3A:
        MVI     G_0182, R0                      ; DA3A   0280 0182
        TSTR    R0                              ; DA3C   0080
        BNEQ    L_DAB7                          ; DA3D   020C 0078

        JSR     R5,     L_688C                  ; DA3F   0004 0168 008C

        BEQ     L_DAB4                          ; DA42   0204 0070

        JSR     R5,     L_68C7                  ; DA44   0004 0168 00C7

        BNEQ    L_DAB7                          ; DA47   020C 006E

        JSR     R5,     L_6897                  ; DA49   0004 0168 0097

        BNEQ    L_DABE                          ; DA4C   020C 0070

        JSR     R5,     L_68A4                  ; DA4E   0004 0168 00A4

        BNEQ    L_DABB                          ; DA51   020C 0068

        MVI     G_019D, R0                      ; DA53   0280 019D

        JSR     R5,     L_694B                  ; DA55   0004 0168 014B
        DECLE   $0204,  $006C                   ; DA58   0204 006C

        MVI     G_01AF, R0                      ; DA5A   0280 01AF
        TSTR    R0                              ; DA5C   0080
        BNEQ    L_DABB                          ; DA5D   020C 005C

        CLRR    R3                              ; DA5F   01DB
        CLRR    R4                              ; DA60   01E4
        MVII    #$019C, R5                      ; DA61   02BD 019C
        MVI@    R5,     R0                      ; DA63   02A8
L_DA64:
        MVI@    R5,     R1                      ; DA64   02A9
        CMPI    #$0008, R1                      ; DA65   0379 0008
        BLT     L_DA6B                          ; DA67   0205 0002

        INCR    R4                              ; DA69   000C
        INCR    R7                              ; DA6A   000F

L_DA6B:
        INCR    R3                              ; DA6B   000B
L_DA6C:
        DECR    R0                              ; DA6C   0010
        BNEQ    L_DA64                          ; DA6D   022C 000A

        TSTR    R3                              ; DA6F   009B
L_DA70:
        BEQ     L_DA9F                          ; DA70   0204 002D

        TSTR    R4                              ; DA72   00A4
        BEQ     L_DAA1                          ; DA73   0204 002C

        JSR     R5,     L_5CC5                  ; DA75   0004 015C 00C5
        DECLE   $0003,  $0216                   ; DA78   0003 0216

        RLC     R3,     1                       ; DA7A   0053
        SAR     R3,     2                       ; DA7B   006F
        SAR     R0,     2                       ; DA7C   006C
        SAR     R1,     1                       ; DA7D   0069
        SLR     R0,     2                       ; DA7E   0064
        RRC     R3,     1                       ; DA7F   0073
        NEGR    R0                              ; DA80   0020
        ADCR    R0                              ; DA81   0028
        GSWD    R1                              ; DA82   0031
L_DA83:
        NEGR    R0                              ; DA83   0020
        DECLE   $002D,  $0020,  $0037,  $0029   ; DA84   002D 0020 0037 0029
        DECLE   $0000,  $0229,  $0053,  $0074   ; DA88   0000 0229 0053 0074
        DECLE   $0072,  $0069,  $0070,  $0065   ; DA8C   0072 0069 0070 0065
        DECLE   $0073,  $0020,  $0028,  $0039   ; DA90   0073 0020 0028 0039
        DECLE   $0020,  $002D,  $0020,  $0031   ; DA94   0020 002D 0020 0031
        DECLE   $0035                           ; DA98   0035

        ADCR    R1                              ; DA99   0029
        EIS                                     ; DA9A   0002
        MVI     G_0131, R0                      ; DA9B   0280 0131
        B       L_DAA1                          ; DA9D   0200 0002

L_DA9F:
        MVII    #$0001, R0                      ; DA9F   02B8 0001
L_DAA1:
        INCR    R0                              ; DAA1   0008
        DECLE   $0281,  $01AE,  $02F9,  $01AF   ; DAA2   0281 01AE 02F9 01AF
        DECLE   $0248,  $0281,  $01AE,  $03F9   ; DAA6   0248 0281 01AE 03F9
        DECLE   $0001,  $02F9,  $01AF,  $0010   ; DAAA   0001 02F9 01AF 0010
        DECLE   $03F8,  $0001,  $0008,  $0248   ; DAAE   03F8 0001 0008 0248
        DECLE   $0200,  $0012                   ; DAB2   0200 0012
L_DAB4:
        JSR     R5,     L_68F2                  ; DAB4   0004 0168 00F2

L_DAB7:
        MVII    #$0001, R0                      ; DAB7   02B8 0001
        MVO     R0,     G_011B                  ; DAB9   0240 011B

L_DABB:
        JSR     R5,     L_697B                  ; DABB   0004 0168 017B

L_DABE:
        MVI     G_01AE, R0                      ; DABE   0280 01AE
        XORI    #$0001, R0                      ; DAC0   03F8 0001
        MVO     R0,     G_01AE                  ; DAC2   0240 01AE
        B       L_DAC9                          ; DAC4   0200 0003

        DECLE   $0004                           ; DAC6   0004
L_DAC7:
        ANDR    R4,     R0                      ; DAC7   01A0
        ADD@    R4,     R7                      ; DAC8   02E7

L_DAC9:
        MVII    #$0006, R0                      ; DAC9   02B8 0006
        XOR     G_011B, R0                      ; DACB   03C0 011B
L_DACD:
        MVO     R0,     G_011B                  ; DACD   0240 011B
        J       L_6811                          ; DACF   0004 0368 0011

        MVI     G_0182, R0                      ; DAD2   0280 0182
        TSTR    R0                              ; DAD4   0080
        BNEQ    L_DAB7                          ; DAD5   022C 001F

        JSR     R5,     L_68B6                  ; DAD7   0004 0168 00B6

        BEQ     L_DB24                          ; DADA   0204 0048

        JSR     R5,     L_688C                  ; DADC   0004 0168 008C

        BNEQ    L_DAE8                          ; DADF   020C 0007

        JSR     R5,     L_68F2                  ; DAE1   0004 0168 00F2

        MVII    #$0001, R0                      ; DAE4   02B8 0001
        MVO     R0,     G_011B                  ; DAE6   0240 011B
L_DAE8:
        MVI     G_01AE, R0                      ; DAE8   0280 01AE
        XORI    #$0001, R0                      ; DAEA   03F8 0001
        MVO     R0,     G_01AE                  ; DAEC   0240 01AE

        JSR     R5,     L_5CC5                  ; DAEE   0004 015C 00C5
        DECLE   $0003,  $0215,  $0041,  $0063   ; DAF1   0003 0215 0041 0063
        DECLE   $0063,  $0065,  $0070,  $0074   ; DAF5   0063 0065 0070 0074
        DECLE   $0020,  $0074,  $0061,  $0062   ; DAF9   0020 0074 0061 0062
        DECLE   $006C,  $0065,  $0020,  $0061   ; DAFD   006C 0065 0020 0061
        DECLE   $0073,  $002D,  $0069,  $0073   ; DB01   0073 002D 0069 0073
        DECLE   $0000,  $0229,  $0052,  $0065   ; DB05   0000 0229 0052 0065
        DECLE   $002D,  $0072,  $0061,  $0063   ; DB09   002D 0072 0061 0063
        DECLE   $006B,  $0020,  $0061,  $006E   ; DB0D   006B 0020 0061 006E
        DECLE   $0064,  $0020,  $0073,  $0068   ; DB11   0064 0020 0073 0068
        DECLE   $006F,  $006F,  $0074,  $0002   ; DB15   006F 006F 0074 0002
        DECLE   $0280,  $0131,  $0080,  $0224   ; DB19   0280 0131 0080 0224
        DECLE   $0054,  $0004                   ; DB1D   0054 0004

        ANDR    R3,     R0                      ; DB1F   0198
        ADDR    R4,     R2                      ; DB20   00E2
        J       L_6C52                          ; DB21   0004 036C 0052

L_DB24:
        JSR     R5,     L_688C                  ; DB24   0004 0168 008C

        BEQ     L_DB6C                          ; DB27   0204 0043

        JSR     R5,     L_6897                  ; DB29   0004 0168 0097
        DECLE   $022C,  $006F,  $02B8,  $0008   ; DB2C   022C 006F 02B8 0008
        DECLE   $0004,  $01A4,  $02DB,  $019C   ; DB30   0004 01A4 02DB 019C
        DECLE   $022C,  $006F                   ; DB34   022C 006F

        JSR     R5,     L_5CC5                  ; DB36   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0070   ; DB39   0003 0215 0053 0070
        DECLE   $006F,  $0074,  $0020,  $0038   ; DB3D   006F 0074 0020 0038
        DECLE   $0020,  $0042,  $0061,  $006C   ; DB41   0020 0042 0061 006C
        DECLE   $006C,  $0020,  $0026,  $0020   ; DB45   006C 0020 0026 0020
        DECLE   $0073,  $0068,  $006F,  $006F   ; DB49   0073 0068 006F 006F
        DECLE   $0074,  $0000,  $0229,  $0052   ; DB4D   0074 0000 0229 0052
        DECLE   $0065,  $002D,  $0072,  $0061   ; DB51   0065 002D 0072 0061
        DECLE   $0063,  $006B,  $0020,  $0061   ; DB55   0063 006B 0020 0061
        DECLE   $006E,  $0064,  $0020,  $0073   ; DB59   006E 0064 0020 0073
        DECLE   $0068,  $006F,  $006F,  $0074   ; DB5D   0068 006F 006F 0074
        DECLE   $0002,  $0280,  $0131,  $0080   ; DB61   0002 0280 0131 0080
        DECLE   $022C,  $0048                   ; DB65   022C 0048

        JSR     R5,     L_691A                  ; DB67   0004 0168 011A

        B       L_DAC9                          ; DB6A   0220 00A2

L_DB6C:
        JSR     R5,     L_68F2                  ; DB6C   0004 0168 00F2
        DECLE   $02B8,  $0008,  $0004           ; DB6F   02B8 0008 0004

        ANDR    R4,     R4                      ; DB72   01A4
        ADD@    R3,     R3                      ; DB73   02DB
        ANDR    R3,     R4                      ; DB74   019C
        BNEQ    L_DB7A                          ; DB75   020C 0003

        JSR     R5,     L_691A                  ; DB77   0004 0168 011A

L_DB7A:
        MVII    #$0041, R0                      ; DB7A   02B8 0041
        MVO     R0,     G_011B                  ; DB7C   0240 011B
        B       L_DABE                          ; DB7E   0220 00C1

        MVI     G_011C, R0                      ; DB80   0280 011C
L_DB82:
        ANDI    #$0080, R0                      ; DB82   03B8 0080
        BNEQ    L_DBFA                          ; DB84   020C 0074

        MVI     G_0182, R0                      ; DB86   0280 0182
        TSTR    R0                              ; DB88   0080
        BNEQ    L_DC63                          ; DB89   020C 00D8

        JSR     R5,     L_6A45                  ; DB8B   0004 0168 0245

        BNEQ    L_DC63                          ; DB8E   020C 00D3

        JSR     R5,     L_6A9D                  ; DB90   0004 0168 029D
        JSR     R5,     L_688C                  ; DB93   0004 0168 008C

        BEQ     L_DC6A                          ; DB96   0204 00D2

        JSR     R5,     L_68A4                  ; DB98   0004 0168 00A4

        BEQ     L_DBE7                          ; DB9B   0204 004A

        JSR     R5,     L_6897                  ; DB9D   0004 0168 0097

        BNEQ    L_DC73                          ; DBA0   020C 00D1

        MVI     G_0119, R1                      ; DBA2   0281 0119
        TSTR    R1                              ; DBA4   0089
        BEQ     L_DBAE                          ; DBA5   0204 0007

        ADDI    #$0120, R1                      ; DBA7   02F9 0120
        MVI@    R1,     R0                      ; DBA9   0288
        CMPI    #$00FF, R0                      ; DBAA   0378 00FF
        BEQ     L_DC73                          ; DBAC   0204 00C5

L_DBAE:
        MVI     G_01AE, R0                      ; DBAE   0280 01AE
        XORI    #$0001, R0                      ; DBB0   03F8 0001
        MVO     R0,     G_01AE                  ; DBB2   0240 01AE

        JSR     R5,     L_6A29                  ; DBB4   0004 0168 0229
        JSR     R5,     L_5CC5                  ; DBB7   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0068   ; DBBA   0003 0215 0053 0068
        DECLE   $006F,  $006F,  $0074,  $0020   ; DBBE   006F 006F 0074 0020
        DECLE   $006E,  $0065,  $0078,  $0074   ; DBC2   006E 0065 0078 0074
        DECLE   $0020,  $0073,  $0068,  $006F   ; DBC6   0020 0073 0068 006F
        DECLE   $0074,  $0000,  $0229,  $004C   ; DBCA   0074 0000 0229 004C

        SLR     R1,     2                       ; DBCE   0065
        RRC     R0,     2                       ; DBCF   0074
        NEGR    R0                              ; DBD0   0020
        SAR     R3,     2                       ; DBD1   006F
        RRC     R0,     1                       ; DBD2   0070
        RRC     R0,     1                       ; DBD3   0070
        SAR     R3,     2                       ; DBD4   006F
        SAR     R2,     2                       ; DBD5   006E
        SLR     R1,     2                       ; DBD6   0065
        SAR     R2,     2                       ; DBD7   006E
        RRC     R0,     2                       ; DBD8   0074
        NEGR    R0                              ; DBD9   0020
        RRC     R3,     1                       ; DBDA   0073
        SAR     R0,     1                       ; DBDB   0068
        SAR     R3,     2                       ; DBDC   006F
        SAR     R3,     2                       ; DBDD   006F
        RRC     R0,     2                       ; DBDE   0074
        EIS                                     ; DBDF   0002
        MVI     G_0131, R0                      ; DBE0   0280 0131
        TSTR    R0                              ; DBE2   0080
        BEQ     L_DC7E                          ; DBE3   0204 0099
        B       L_DC73                          ; DBE5   0200 008C

L_DBE7:
        MVII    #$0009, R0                      ; DBE7   02B8 0009
        DECLE   $0004,  $01A4,  $02DB,  $019C   ; DBE9   0004 01A4 02DB 019C
        DECLE   $020C,  $008C                   ; DBED   020C 008C
L_DBEF:
        J       L_67D3                          ; DBEF   0004 0364 03D3

L_DBF2:
        MVI     G_01AE, R0                      ; DBF2   0280 01AE
        XORI    #$0001, R0                      ; DBF4   03F8 0001
        MVO     R0,     G_01AE                  ; DBF6   0240 01AE
        B       L_DBEF                          ; DBF8   0220 000A

L_DBFA:
        MVI     G_0182, R0                      ; DBFA   0280 0182
        TSTR    R0                              ; DBFC   0080
        BNEQ    L_DC63                          ; DBFD   020C 0064

        JSR     R5,     L_6A30                  ; DBFF   0004 0168 0230

        BEQ     L_DC4F                          ; DC02   0204 004B

        MVI     G_0189, R0                      ; DC04   0280 0189
        TSTR    R0                              ; DC06   0080
        BNEQ    L_DC6A                          ; DC07   020C 0061

        JSR     R5,     L_6A95                  ; DC09   0004 0168 0295

        CMPI    #$0003, R0                      ; DC0C   0378 0003
        BGE     L_DBF2                          ; DC0E   022D 001D

        MVII    #$00C0, R0                      ; DC10   02B8 00C0
        MVO     R0,     G_011B                  ; DC12   0240 011B
        MVI     G_01AE, R0                      ; DC14   0280 01AE
        XORI    #$0001, R0                      ; DC16   03F8 0001
        MVO     R0,     G_01AE                  ; DC18   0240 01AE

        JSR     R5,     L_5CC5                  ; DC1A   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0061   ; DC1D   0003 0215 0053 0061
        DECLE   $006D,  $0065,  $0020,  $0073   ; DC21   006D 0065 0020 0073
        DECLE   $0068,  $006F,  $006F,  $0074   ; DC25   0068 006F 006F 0074
        DECLE   $0065,  $0072,  $0020,  $0062   ; DC29   0065 0072 0020 0062
        DECLE   $0072,  $0065,  $0061,  $006B   ; DC2D   0072 0065 0061 006B
        DECLE   $0073,  $0000,  $0229,  $004E   ; DC31   0073 0000 0229 004E

        SLR     R1,     2                       ; DC35   0065
        RRC     R3,     2                       ; DC36   0077
        NEGR    R0                              ; DC37   0020
        RRC     R3,     1                       ; DC38   0073
        SAR     R0,     1                       ; DC39   0068
        SAR     R3,     2                       ; DC3A   006F
        SAR     R3,     2                       ; DC3B   006F
        RRC     R0,     2                       ; DC3C   0074
        SLR     R1,     2                       ; DC3D   0065
        RRC     R2,     1                       ; DC3E   0072
        NEGR    R0                              ; DC3F   0020
        SLR     R2,     1                       ; DC40   0062
        RRC     R2,     1                       ; DC41   0072
        SLR     R1,     2                       ; DC42   0065
        SLR     R1,     1                       ; DC43   0061
        SAR     R3,     1                       ; DC44   006B
        RRC     R3,     1                       ; DC45   0073
        EIS                                     ; DC46   0002
        MVI     G_01AE, R0                      ; DC47   0280 01AE
        XOR     G_0131, R0                      ; DC49   03C0 0131
        MVO     R0,     G_01AE                  ; DC4B   0240 01AE
        B       L_DC6A                          ; DC4D   0200 001B

L_DC4F:
        JSR     R5,     L_688C                  ; DC4F   0004 0168 008C

        BEQ     L_DC6A                          ; DC52   0204 0016

        JSR     R5,     L_6897                  ; DC54   0004 0168 0097
        DECLE   $020C,  $001A,  $02B8,  $0009   ; DC57   020C 001A 02B8 0009
        DECLE   $0004,  $01A4,  $02DB,  $019C   ; DC5B   0004 01A4 02DB 019C
        DECLE   $0224,  $0071,  $0200,  $0018   ; DC5F   0224 0071 0200 0018
L_DC63:
        JSR     R5,     L_6A95                  ; DC63   0004 0168 0295

        CMPI    #$0003, R0                      ; DC66   0378 0003
        BGE     L_DBF2                          ; DC68   022D 0077

L_DC6A:
        JSR     R5,     L_68F2                  ; DC6A   0004 0168 00F2

        MVII    #$0001, R0                      ; DC6D   02B8 0001
        XOR     G_011B, R0                      ; DC6F   03C0 011B
        MVO     R0,     G_011B                  ; DC71   0240 011B
L_DC73:
        MVI     G_01AE, R0                      ; DC73   0280 01AE
        XORI    #$0001, R0                      ; DC75   03F8 0001
        MVO     R0,     G_01AE                  ; DC77   0240 01AE
        B       L_DC7E                          ; DC79   0200 0003

        DECLE   $0004                           ; DC7B   0004

        ANDR    R4,     R0                      ; DC7C   01A0
        ADD@    R4,     R7                      ; DC7D   02E7

L_DC7E:
        MVII    #$0009, R0                      ; DC7E   02B8 0009
        DECLE   $0004                           ; DC80   0004

        ANDR    R4,     R4                      ; DC81   01A4
        ADD@    R3,     R3                      ; DC82   02DB
        ANDR    R3,     R4                      ; DC83   019C
        BNEQ    L_DC89                          ; DC84   020C 0003

        JSR     R5,     L_691E                  ; DC86   0004 0168 011E

L_DC89:
        MVI     G_011B, R0                      ; DC89   0280 011B
        ANDI    #$0080, R0                      ; DC8B   03B8 0080
        BNEQ    L_DC95                          ; DC8D   020C 0006

        MVII    #$0006, R0                      ; DC8F   02B8 0006
        XOR     G_011B, R0                      ; DC91   03C0 011B
        MVO     R0,     G_011B                  ; DC93   0240 011B
L_DC95:
        J       L_6811                          ; DC95   0004 0368 0011

        MVI     G_011C, R0                      ; DC98   0280 011C
        ANDI    #$0080, R0                      ; DC9A   03B8 0080
        BNEQ    L_DCDC                          ; DC9C   020C 003E

        MVI     G_0182, R0                      ; DC9E   0280 0182
        TSTR    R0                              ; DCA0   0080
        BNEQ    L_DD38                          ; DCA1   020C 0095

        JSR     R5,     L_6A59                  ; DCA3   0004 0168 0259

        BNEQ    L_DD38                          ; DCA6   020C 0090

        JSR     R5,     L_6A9D                  ; DCA8   0004 0168 029D
        JSR     R5,     L_688C                  ; DCAB   0004 0168 008C

        BEQ     L_DDEC                          ; DCAE   0204 013C

        JSR     R5,     L_6897                  ; DCB0   0004 0168 0097

        BNEQ    L_DD88                          ; DCB3   020C 00D3

L_DCB5:
        CLRR    R0                              ; DCB5   01C0
        MVII    #$019C, R4                      ; DCB6   02BC 019C
        MVI@    R4,     R1                      ; DCB8   02A1
L_DCB9:
        DECR    R1                              ; DCB9   0011
        DECLE   $020B,  $0003                   ; DCBA   020B 0003

        ADD@    R4,     R0                      ; DCBC   02E0
        B       L_DCB9                          ; DCBD   0220 0005

        DECLE   $0004,  $0198,  $01C0,  $0378   ; DCBF   0004 0198 01C0 0378
        DECLE   $003D,  $020D,  $000B,  $0004   ; DCC3   003D 020D 000B 0004
        DECLE   $0198,  $01A0,  $0080,  $020C   ; DCC7   0198 01A0 0080 020C
        DECLE   $00C4,  $02B8,  $0001,  $0004   ; DCCB   00C4 02B8 0001 0004

        ANDR    R3,     R0                      ; DCCF   0198
        CLRR    R0                              ; DCD0   01C0
L_DCD1:
        J       L_67D3                          ; DCD1   0004 0364 03D3

L_DCD4:
        MVI     G_01AE, R0                      ; DCD4   0280 01AE
        XORI    #$0001, R0                      ; DCD6   03F8 0001
        MVO     R0,     G_01AE                  ; DCD8   0240 01AE
        B       L_DCD1                          ; DCDA   0220 000A

L_DCDC:
        MVI     G_0182, R0                      ; DCDC   0280 0182
        TSTR    R0                              ; DCDE   0080
        BNEQ    L_DCE6                          ; DCDF   020C 0005

        JSR     R5,     L_6A30                  ; DCE1   0004 0168 0230

        BEQ     L_DD2C                          ; DCE4   0204 0046

L_DCE6:
        MVI     G_01AE, R0                      ; DCE6   0280 01AE
        XORI    #$0001, R0                      ; DCE8   03F8 0001
        MVO     R0,     G_01AE                  ; DCEA   0240 01AE

        JSR     R5,     L_6A29                  ; DCEC   0004 0168 0229
        JSR     R5,     L_5CC5                  ; DCEF   0004 015C 00C5
        DECLE   $0003,  $0215,  $0043,  $0075   ; DCF2   0003 0215 0043 0075
        DECLE   $0065,  $0020,  $0062,  $0061   ; DCF6   0065 0020 0062 0061
        DECLE   $006C,  $006C,  $0020,  $0069   ; DCFA   006C 006C 0020 0069
        DECLE   $006E,  $0020,  $0068,  $0061   ; DCFE   006E 0020 0068 0061
        DECLE   $006E,  $0064,  $0000,  $0229   ; DD02   006E 0064 0000 0229
        DECLE   $0052,  $0065,  $002D,  $0072   ; DD06   0052 0065 002D 0072
        DECLE   $0061,  $0063,  $006B,  $0020   ; DD0A   0061 0063 006B 0020
        DECLE   $0061,  $006E,  $0064,  $0020   ; DD0E   0061 006E 0064 0020
        DECLE   $0073,  $0068,  $006F,  $006F   ; DD12   0073 0068 006F 006F
        DECLE   $0074,  $0002,  $0280,  $0131   ; DD16   0074 0002 0280 0131
        DECLE   $0080,  $0204,  $0006,  $0004   ; DD1A   0080 0204 0006 0004

        ANDR    R3,     R0                      ; DD1E   0198
        ADDR    R4,     R2                      ; DD1F   00E2
        J       L_6C52                          ; DD20   0004 036C 0052

        JSR     R5,     L_68F2                  ; DD23   0004 0168 00F2

        MVII    #$0041, R0                      ; DD26   02B8 0041
        MVO     R0,     G_011B                  ; DD28   0240 011B
        B       L_DD93                          ; DD2A   0200 0067

L_DD2C:
        JSR     R5,     L_688C                  ; DD2C   0004 0168 008C

        BEQ     L_DCE6                          ; DD2F   0224 004A

        JSR     R5,     L_6897                  ; DD31   0004 0168 0097

        BNEQ    L_DD88                          ; DD34   020C 0052
        B       L_DCB5                          ; DD36   0220 0082

L_DD38:
        JSR     R5,     L_6A95                  ; DD38   0004 0168 0295

        CMPI    #$0003, R0                      ; DD3B   0378 0003
        BGE     L_DCD4                          ; DD3D   022D 006A

        JSR     R5,     L_688C                  ; DD3F   0004 0168 008C

        BNEQ    L_DD4B                          ; DD42   020C 0007

        JSR     R5,     L_68F2                  ; DD44   0004 0168 00F2

        MVII    #$0041, R0                      ; DD47   02B8 0041
        MVO     R0,     G_011B                  ; DD49   0240 011B

L_DD4B:
        JSR     R5,     L_69C2                  ; DD4B   0004 0168 01C2

        MVI     G_01AE, R0                      ; DD4E   0280 01AE
        XORI    #$0001, R0                      ; DD50   03F8 0001
        MVO     R0,     G_01AE                  ; DD52   0240 01AE

        JSR     R5,     L_6A29                  ; DD54   0004 0168 0229
        JSR     R5,     L_5CC5                  ; DD57   0004 015C 00C5
        DECLE   $0003,  $0215,  $0041,  $0063   ; DD5A   0003 0215 0041 0063
        DECLE   $0063,  $0065,  $0070,  $0074   ; DD5E   0063 0065 0070 0074
        DECLE   $0020,  $0074,  $0061,  $0062   ; DD62   0020 0074 0061 0062
        DECLE   $006C,  $0065,  $0020,  $0061   ; DD66   006C 0065 0020 0061
        DECLE   $0073,  $002D,  $0069,  $0073   ; DD6A   0073 002D 0069 0073
        DECLE   $0000,  $0229,  $0053           ; DD6E   0000 0229 0053

        SLR     R1,     1                       ; DD71   0061
        SAR     R1,     2                       ; DD72   006D
        SLR     R1,     2                       ; DD73   0065
        NEGR    R0                              ; DD74   0020
        RRC     R3,     1                       ; DD75   0073
        SAR     R0,     1                       ; DD76   0068
        SAR     R3,     2                       ; DD77   006F
        SAR     R3,     2                       ; DD78   006F
        RRC     R0,     2                       ; DD79   0074
        SLR     R1,     2                       ; DD7A   0065
        RRC     R2,     1                       ; DD7B   0072
        NEGR    R0                              ; DD7C   0020
        SLR     R1,     1                       ; DD7D   0061
        RRC     R3,     1                       ; DD7E   0073
        ADCR    R5                              ; DD7F   002D
        SAR     R1,     1                       ; DD80   0069
        RRC     R3,     1                       ; DD81   0073
        EIS                                     ; DD82   0002
        MVI     G_0131, R0                      ; DD83   0280 0131
        TSTR    R0                              ; DD85   0080
        BEQ     L_DD93                          ; DD86   0204 000B

L_DD88:
        MVI     G_01AE, R0                      ; DD88   0280 01AE
        XORI    #$0001, R0                      ; DD8A   03F8 0001
        MVO     R0,     G_01AE                  ; DD8C   0240 01AE
        B       L_DD93                          ; DD8E   0200 0003

        DECLE   $0004                           ; DD90   0004

        ANDR    R4,     R0                      ; DD91   01A0
        ADD@    R4,     R7                      ; DD92   02E7

L_DD93:
        MVII    #$0002, R0                      ; DD93   02B8 0002
        DECLE   $03C0,  $011B,  $0240,  $011B   ; DD95   03C0 011B 0240 011B
        DECLE   $03B8,  $0040,  $0204,  $004C   ; DD99   03B8 0040 0204 004C
        DECLE   $0004,  $0198,  $012E,  $0240   ; DD9D   0004 0198 012E 0240
        DECLE   $0119,  $0004                   ; DDA1   0119 0004

        ANDR    R3,     R0                      ; DDA3   0198
        ADDR    R2,     R2                      ; DDA4   00D2
        ADDI    #$0318, R5                      ; DDA5   02FD 0318
        MVI@    R5,     R1                      ; DDA7   02A9
        SDBD                                    ; DDA8   0001
        CMPI    #$0F00, R1                      ; DDA9   0379 0000 000F
        BGT     L_DDE9                          ; DDAC   020E 003B

        JSR     R5,     L_6A29                  ; DDAE   0004 0168 0229
        JSR     R5,     L_5CC5                  ; DDB1   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0070   ; DDB4   0003 0215 0053 0070
        DECLE   $006F,  $0074,  $0020,  $006F   ; DDB8   006F 0074 0020 006F
        DECLE   $0062,  $006A,  $0065,  $0063   ; DDBC   0062 006A 0065 0063
        DECLE   $0074,  $0020,  $0062,  $0061   ; DDC0   0074 0020 0062 0061
        DECLE   $006C,  $006C,  $0000,  $0229   ; DDC4   006C 006C 0000 0229
        DECLE   $0053,  $0068,  $006F,  $006F   ; DDC8   0053 0068 006F 006F
        DECLE   $0074,  $0020,  $0061,  $0073   ; DDCC   0074 0020 0061 0073
        DECLE   $002D,  $0069,  $0073,  $0002   ; DDD0   002D 0069 0073 0002
        DECLE   $0280,  $0131,  $0080,  $020C   ; DDD4   0280 0131 0080 020C
        DECLE   $0010,  $0280,  $0119,  $0004   ; DDD8   0010 0280 0119 0004
        DECLE   $0198,  $00D2,  $02FD,  $0318   ; DDDC   0198 00D2 02FD 0318
        DECLE   $0275,  $0004                   ; DDE0   0275 0004

        ANDR    R3,     R0                      ; DDE2   0198
        CMPR    R5,     R4                      ; DDE3   016C
        PULR    R5                              ; DDE4   02B5
        MVO@    R0,     R5                      ; DDE5   0268
        ADDI    #$0010, R5                      ; DDE6   02FD 0010
        MVO@    R1,     R5                      ; DDE8   0269
L_DDE9:
        J       L_6811                          ; DDE9   0004 0368 0011

L_DDEC:
        JSR     R5,     L_68F2                  ; DDEC   0004 0168 00F2

        MVII    #$0041, R0                      ; DDEF   02B8 0041
        MVO     R0,     G_011B                  ; DDF1   0240 011B

        JSR     R5,     L_69C2                  ; DDF3   0004 0168 01C2

        B       L_DD88                          ; DDF6   0220 006F

        MVI     G_011C, R0                      ; DDF8   0280 011C
        ANDI    #$0080, R0                      ; DDFA   03B8 0080
        BNEQ    L_DE2D                          ; DDFC   020C 002F

        MVI     G_0182, R0                      ; DDFE   0280 0182
        TSTR    R0                              ; DE00   0080
        BNEQ    L_DE8C                          ; DE01   020C 0089

        JSR     R5,     L_6A72                  ; DE03   0004 0168 0272

        BNEQ    L_DE8C                          ; DE06   020C 0084

        JSR     R5,     L_6A9D                  ; DE08   0004 0168 029D
        JSR     R5,     L_688C                  ; DE0B   0004 0168 008C

        BEQ     L_DE8C                          ; DE0E   0204 007C

        JSR     R5,     L_68A4                  ; DE10   0004 0168 00A4

        BNEQ    L_DF02                          ; DE13   020C 00ED

L_DE15:
        MVI     G_019C, R0                      ; DE15   0280 019C
        DECLE   $0004,  $0198,  $01C0,  $0340   ; DE17   0004 0198 01C0 0340
        DECLE   $0132,  $020D,  $000C,  $0004   ; DE1B   0132 020D 000C 0004
        DECLE   $0198,  $01A0,  $0378,  $0001   ; DE1F   0198 01A0 0378 0001
        DECLE   $020E,  $00E8                   ; DE23   020E 00E8

        JSR     R5,     L_6AA4                  ; DE25   0004 0168 02A4
        DECLE   $0200,  $00E3                   ; DE28   0200 00E3

        J       L_67D3                          ; DE2A   0004 0364 03D3

L_DE2D:
        MVI     G_0182, R0                      ; DE2D   0280 0182
        TSTR    R0                              ; DE2F   0080
        BNEQ    L_DE37                          ; DE30   020C 0005

        JSR     R5,     L_6BEA                  ; DE32   0004 0168 03EA

        BEQ     L_DE80                          ; DE35   0204 0049

L_DE37:
        MVII    #$0002, R0                      ; DE37   02B8 0002
        DECLE   $0020,  $0004                   ; DE39   0020 0004

        ANDR    R3,     R0                      ; DE3B   0198
        CLRR    R0                              ; DE3C   01C0
        MVI     G_01AE, R0                      ; DE3D   0280 01AE
        XORI    #$0001, R0                      ; DE3F   03F8 0001
        MVO     R0,     G_01AE                  ; DE41   0240 01AE

        JSR     R5,     L_5CC5                  ; DE43   0004 015C 00C5
        DECLE   $0003,  $0215,  $0041,  $0063   ; DE46   0003 0215 0041 0063
        DECLE   $0063,  $0065,  $0070,  $0074   ; DE4A   0063 0065 0070 0074
        DECLE   $0020,  $0074,  $0061,  $0062   ; DE4E   0020 0074 0061 0062
        DECLE   $006C,  $0065,  $0020,  $0061   ; DE52   006C 0065 0020 0061
        DECLE   $0073,  $002D,  $0069,  $0073   ; DE56   0073 002D 0069 0073
        DECLE   $0000,  $0229,  $0053           ; DE5A   0000 0229 0053

        SLR     R1,     1                       ; DE5D   0061
        SAR     R1,     2                       ; DE5E   006D
        SLR     R1,     2                       ; DE5F   0065
        NEGR    R0                              ; DE60   0020
        RRC     R0,     1                       ; DE61   0070
        SAR     R0,     2                       ; DE62   006C
        SLR     R1,     1                       ; DE63   0061
        SARC    R1,     1                       ; DE64   0079
        SLR     R1,     2                       ; DE65   0065
        RRC     R2,     1                       ; DE66   0072
        NEGR    R0                              ; DE67   0020
        SLR     R2,     1                       ; DE68   0062
        RRC     R2,     1                       ; DE69   0072
        SLR     R1,     2                       ; DE6A   0065
        SLR     R1,     1                       ; DE6B   0061
        SAR     R3,     1                       ; DE6C   006B
        RRC     R3,     1                       ; DE6D   0073
        EIS                                     ; DE6E   0002
        MVI     G_01AE, R0                      ; DE6F   0280 01AE
        XORI    #$0001, R0                      ; DE71   03F8 0001
        MVO     R0,     G_01AE                  ; DE73   0240 01AE
        MVI     G_0131, R0                      ; DE75   0280 0131
L_DE77:
        TSTR    R0                              ; DE77   0080
        DECLE   $0204,  $007C,  $0004           ; DE78   0204 007C 0004

        ANDR    R3,     R0                      ; DE7B   0198
        ADDR    R4,     R2                      ; DE7C   00E2
        J       L_6C52                          ; DE7D   0004 036C 0052

L_DE80:
        JSR     R5,     L_688C                  ; DE80   0004 0168 008C

        BEQ     L_DE8C                          ; DE83   0204 0007

        JSR     R5,     L_68A4                  ; DE85   0004 0168 00A4

        BEQ     L_DE15                          ; DE88   0224 0074
        B       L_DF05                          ; DE8A   0200 0079

L_DE8C:
        MVII    #$0001, R0                      ; DE8C   02B8 0001
        DECLE   $0020,  $0004                   ; DE8E   0020 0004

        ANDR    R3,     R0                      ; DE90   0198
        ANDR    R6,     R0                      ; DE91   01B0

        JSR     R5,     L_6A95                  ; DE92   0004 0168 0295

        CMPI    #$0003, R0                      ; DE95   0378 0003
        BLT     L_DEF6                          ; DE97   0205 005D

        MVI     G_01AE, R0                      ; DE99   0280 01AE
        XORI    #$0001, R0                      ; DE9B   03F8 0001
        MVO     R0,     G_01AE                  ; DE9D   0240 01AE

        JSR     R5,     L_5CC5                  ; DE9F   0004 015C 00C5
        DECLE   $0003,  $0215,  $0032,  $0030   ; DEA2   0003 0215 0032 0030
        DECLE   $0025,  $0020,  $0072,  $0075   ; DEA6   0025 0020 0072 0075
        DECLE   $006C,  $0065,  $003B,  $0020   ; DEAA   006C 0065 003B 0020
        DECLE   $006E,  $0065,  $0077,  $0020   ; DEAE   006E 0065 0077 0020
        DECLE   $0062,  $0072,  $0065,  $0061   ; DEB2   0062 0072 0065 0061
        DECLE   $006B,  $0000                   ; DEB6   006B 0000

        BNC     L_DE77                          ; DEB8   0229 0042

        SLR     R1,     1                       ; DEBA   0061
        SAR     R0,     2                       ; DEBB   006C
        SAR     R0,     2                       ; DEBC   006C
        ADCR    R5                              ; DEBD   002D
        SAR     R1,     1                       ; DEBE   0069
        SAR     R2,     2                       ; DEBF   006E
        ADCR    R5                              ; DEC0   002D
        SAR     R0,     1                       ; DEC1   0068
        SLR     R1,     1                       ; DEC2   0061
        SAR     R2,     2                       ; DEC3   006E
        SLR     R0,     2                       ; DEC4   0064
        NEGR    R0                              ; DEC5   0020
        RRC     R2,     1                       ; DEC6   0072
        RRC     R1,     2                       ; DEC7   0075
        SAR     R0,     2                       ; DEC8   006C
        SLR     R1,     2                       ; DEC9   0065
        EIS                                     ; DECA   0002
        MVI     G_01AE, R0                      ; DECB   0280 01AE
        XORI    #$0001, R0                      ; DECD   03F8 0001
        MVO     R0,     G_01AE                  ; DECF   0240 01AE
        MVI     G_0131, R0                      ; DED1   0280 0131
        TSTR    R0                              ; DED3   0080
        BEQ     L_DEE2                          ; DED4   0204 000C

        JSR     R5,     L_6A9D                  ; DED6   0004 0168 029D
        JSR     R5,     L_68F2                  ; DED9   0004 0168 00F2

        MVII    #$0001, R0                      ; DEDC   02B8 0001
        MVO     R0,     G_011B                  ; DEDE   0240 011B
        B       L_DF05                          ; DEE0   0200 0023

L_DEE2:
        MVI     G_0132, R1                      ; DEE2   0281 0132
        MVII    #$0014, R0                      ; DEE4   02B8 0014

        JSR     R5,     X_MPY                   ; DEE6   0004 011C 01DC

        MOVR    R2,     R1                      ; DEE9   0091
        MVII    #$0064, R2                      ; DEEA   02BA 0064

        JSR     R5,     X_DIVR                  ; DEEC   0004 011C 01F8
        DECLE   $0010,  $0020,  $0004,  $0198   ; DEEF   0010 0020 0004 0198
        DECLE   $01C0,  $0220,  $007B           ; DEF3   01C0 0220 007B
L_DEF6:
        JSR     R5,     L_688C                  ; DEF6   0004 0168 008C

        BNEQ    L_DF02                          ; DEF9   020C 0007

        JSR     R5,     L_68F2                  ; DEFB   0004 0168 00F2

        MVII    #$0041, R0                      ; DEFE   02B8 0041
        MVO     R0,     G_011B                  ; DF00   0240 011B

L_DF02:
        JSR     R5,     L_69C2                  ; DF02   0004 0168 01C2

L_DF05:
        MVI     G_01AE, R0                      ; DF05   0280 01AE
        XORI    #$0001, R0                      ; DF07   03F8 0001
        MVO     R0,     G_01AE                  ; DF09   0240 01AE
        B       L_DF10                          ; DF0B   0200 0003

        DECLE   $0004                           ; DF0D   0004

        ANDR    R4,     R0                      ; DF0E   01A0
        ADD@    R4,     R7                      ; DF0F   02E7

L_DF10:
        MVII    #$019C, R4                      ; DF10   02BC 019C
        MVII    #$0011, R0                      ; DF12   02B8 0011

        JSR     R5,     X_FILL_ZERO             ; DF14   0004 0114 0338

        MVII    #$0006, R0                      ; DF17   02B8 0006
        XOR     G_011B, R0                      ; DF19   03C0 011B
        MVO     R0,     G_011B                  ; DF1B   0240 011B
        ANDI    #$0040, R0                      ; DF1D   03B8 0040
        BEQ     L_DF83                          ; DF1F   0204 0062

        MVII    #$0318, R4                      ; DF21   02BC 0318
L_DF23:
        MVI@    R4,     R0                      ; DF23   02A0
        SDBD                                    ; DF24   0001
        CMPI    #$0F00, R0                      ; DF25   0378 0000 000F
        BGT     L_DF83                          ; DF28   020E 0059

        CMPI    #$0328, R4                      ; DF2A   037C 0328
        BLT     L_DF23                          ; DF2C   0225 000A

        JSR     R5,     L_5CC5                  ; DF2E   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0070   ; DF31   0003 0215 0053 0070
        DECLE   $006F,  $0074,  $0020,  $0061   ; DF35   006F 0074 0020 0061
        DECLE   $0020,  $0062,  $0061,  $006C   ; DF39   0020 0062 0061 006C
        DECLE   $006C,  $0000,  $0229,  $0041   ; DF3D   006C 0000 0229 0041
        DECLE   $0063,  $0063,  $0065,  $0070   ; DF41   0063 0063 0065 0070
        DECLE   $0074,  $0020,  $0074,  $0061   ; DF45   0074 0020 0074 0061
        DECLE   $0062,  $006C,  $0065,  $0020   ; DF49   0062 006C 0065 0020
        DECLE   $0061,  $0073,  $002D,  $0069   ; DF4D   0061 0073 002D 0069
        DECLE   $0073,  $0002,  $0280,  $0131   ; DF51   0073 0002 0280 0131
        DECLE   $0080,  $020C,  $002B,  $02B8   ; DF55   0080 020C 002B 02B8
        DECLE   $0001,  $01C9,  $01D2,  $0012   ; DF59   0001 01C9 01D2 0012
        DECLE   $0004                           ; DF5D   0004

        ANDR    R3,     R0                      ; DF5E   0198
        ADDR    R2,     R2                      ; DF5F   00D2
        ADDI    #$0318, R5                      ; DF60   02FD 0318
        SDBD                                    ; DF62   0001
        MVII    #$0F00, R4                      ; DF63   02BC 0000 000F
        SUB@    R5,     R4                      ; DF66   032C
        CMPR    R2,     R4                      ; DF67   0154
        BC      L_DF6C                          ; DF68   0201 0002

        MOVR    R4,     R2                      ; DF6A   00A2
        MOVR    R0,     R1                      ; DF6B   0081
L_DF6C:
        INCR    R0                              ; DF6C   0008
        DECLE   $0378,  $000F,  $0226,  $0013   ; DF6D   0378 000F 0226 0013
        DECLE   $0088,  $0004                   ; DF71   0088 0004

        ANDR    R3,     R0                      ; DF73   0198
        ADDR    R2,     R2                      ; DF74   00D2
        SDBD                                    ; DF75   0001
        MVII    #$1F00, R0                      ; DF76   02B8 0000 001F
        ADDI    #$0318, R5                      ; DF79   02FD 0318
        MVO@    R0,     R5                      ; DF7B   0268
        ADDI    #$0010, R5                      ; DF7C   02FD 0010
        SDBD                                    ; DF7E   0001
        MVII    #$1000, R0                      ; DF7F   02B8 0000 0010
        MVO@    R0,     R5                      ; DF82   0268
L_DF83:
        J       L_6811                          ; DF83   0004 0368 0011

        JSR     R5,     L_688C                  ; DF86   0004 0168 008C

        BEQ     L_DFE0                          ; DF89   0204 0055

        MVI     G_0182, R0                      ; DF8B   0280 0182
        TSTR    R0                              ; DF8D   0080
        BNEQ    L_DFFA                          ; DF8E   020C 006A

        JSR     R5,     L_6BFE                  ; DF90   0004 0168 03FE

        BNEQ    L_DFFA                          ; DF93   020C 0065

        JSR     R5,     L_6A9D                  ; DF95   0004 0168 029D

        MVO     R0,     G_0119                  ; DF98   0240 0119
        CLRR    R3                              ; DF9A   01DB

        JSR     R5,     L_6C2F                  ; DF9B   0004 016C 002F

        BEQ     L_DFA1                          ; DF9E   0204 0001

        INCR    R3                              ; DFA0   000B
L_DFA1:
        MVO     R3,     G_011A                  ; DFA1   0243 011A
L_DFA3:
        MVI     G_019C, R3                      ; DFA3   0283 019C
        DECLE   $0013,  $020B                   ; DFA5   0013 020B

        SAR     R0,     2                       ; DFA7   006C
        CLRR    R2                              ; DFA8   01D2
        MVII    #$0185, R5                      ; DFA9   02BD 0185
        MVI     G_019D, R3                      ; DFAB   0283 019D
        ADDI    #$0120, R3                      ; DFAD   02FB 0120
        MVI@    R3,     R0                      ; DFAF   0298
        CMPI    #$0002, R0                      ; DFB0   0378 0002
        BEQ     L_DFBB                          ; DFB2   0204 0007

        INCR    R2                              ; DFB4   000A
        ADDI    #$0002, R5                      ; DFB5   02FD 0002
        CMPI    #$0005, R0                      ; DFB7   0378 0005
        BNEQ    L_DFC8                          ; DFB9   020C 000D

L_DFBB:
        SDBD                                    ; DFBB   0001
        MVI@    R5,     R0                      ; DFBC   02A8
        INCR    R0                              ; DFBD   0008
        SUBI    #$0002, R5                      ; DFBE   033D 0002
        MVO@    R0,     R5                      ; DFC0   0268
        SWAP    R0,     1                       ; DFC1   0040
        MVO@    R0,     R5                      ; DFC2   0268
        SWAP    R0,     1                       ; DFC3   0040
        CMPI    #$0008, R0                      ; DFC4   0378 0008
        BGE     L_DFD0                          ; DFC6   020D 0008

L_DFC8:
        MVI     G_019D, R0                      ; DFC8   0280 019D
        DECLE   $0004,  $01A4,  $02BF           ; DFCA   0004 01A4 02BF

        ANDR    R3,     R4                      ; DFCD   019C
        B       L_DFA3                          ; DFCE   0220 002C

L_DFD0:
        MVO     R2,     G_01AE                  ; DFD0   0242 01AE

        JSR     R5,     L_5E1E                  ; DFD2   0004 015C 021E

L_DFD5:
        J       L_67D3                          ; DFD5   0004 0364 03D3

L_DFD8:
        MVI     G_01AE, R0                      ; DFD8   0280 01AE
        XORI    #$0001, R0                      ; DFDA   03F8 0001
        MVO     R0,     G_01AE                  ; DFDC   0240 01AE
        B       L_DFD5                          ; DFDE   0220 000A

L_DFE0:
        MOVR    R0,     R1                      ; DFE0   0081

        JSR     R5,     L_68F2                  ; DFE1   0004 0168 00F2

        MVII    #$0041, R0                      ; DFE4   02B8 0041
        MVO     R0,     G_011B                  ; DFE6   0240 011B

        JSR     R5,     L_69C2                  ; DFE8   0004 0168 01C2

L_DFEB:
        MVII    #$0001, R0                      ; DFEB   02B8 0001
        MVO     R0,     G_0119                  ; DFED   0240 0119

        JSR     R5,     L_6A95                  ; DFEF   0004 0168 0295

        CMPI    #$0003, R0                      ; DFF2   0378 0003
        BGE     L_DFD8                          ; DFF4   022D 001D

        MVII    #$0001, R3                      ; DFF6   02BB 0001
        B       L_DFA1                          ; DFF8   0220 0058

L_DFFA:
        MVI     G_019C, R1                      ; DFFA   0281 019C
        DECR    R1                              ; DFFC   0011
        BMI     L_DFEB                          ; DFFD   022B 0013

        MOVR    R1,     R2                      ; DFFF   008A

        ORG     $F000
        ADDI    #$019D, R2                      ; F000   02FA 019D
        MVI@    R2,     R0                      ; F002   0290
        MOVR    R0,     R3                      ; F003   0083
        ADDI    #$0120, R3                      ; F004   02FB 0120

        JSR     R5,     L_6C25                  ; F006   0004 016C 0025
        DECLE   $035D,  $022C                   ; F009   035D 022C

        INCR    R7                              ; F00B   000F

        MOVR    R0,     R3                      ; F00C   0083
L_F00D:
        PSHR    R1                              ; F00D   0271

        JSR     R5,     L_6920                  ; F00E   0004 0168 0120
        DECLE   $02B1,  $0220                   ; F011   02B1 0220
L_F013:
        DECR    R7                              ; F013   0017

        DECLE   $0280,  $0119,  $0080,  $0204   ; F014   0280 0119 0080 0204
        DECLE   $0006,  $02B8,  $0001,  $0020   ; F018   0006 02B8 0001 0020
        DECLE   $0004,  $0198,  $01B0,  $02BC   ; F01C   0004 0198 01B0 02BC
        DECLE   $0185,  $0001,  $02A2,  $0001   ; F020   0185 0001 02A2 0001
        DECLE   $02A0,  $0270,  $02B8,  $0002   ; F024   02A0 0270 02B8 0002
        DECLE   $0004,  $01A0,  $00E3,  $02B2   ; F028   0004 01A0 00E3 02B2
        DECLE   $02B8,  $0005,  $0004           ; F02C   02B8 0005 0004

        ANDR    R4,     R0                      ; F02F   01A0
        ADDR    R4,     R3                      ; F030   00E3

        JSR     R5,     L_5E1E                  ; F031   0004 015C 021E
        DECLE   $0004                           ; F034   0004

        ANDR    R3,     R0                      ; F035   0198
        ANDR    R4,     R0                      ; F036   01A0
        TSTR    R0                              ; F037   0080
        BEQ     L_F03F                          ; F038   0204 0005

        MVI     G_011A, R0                      ; F03A   0280 011A
        TSTR    R0                              ; F03C   0080
        BEQ     L_F05C                          ; F03D   0204 001D

L_F03F:
        CLRR    R3                              ; F03F   01DB
L_F040:
        INCR    R3                              ; F040   000B
        CMPI    #$0010, R3                      ; F041   037B 0010
        BGE     L_F05C                          ; F043   020D 0017

        MOVR    R3,     R4                      ; F045   009C
        ADDI    #$0120, R4                      ; F046   02FC 0120
        MVI@    R4,     R0                      ; F048   02A0
        CMPI    #$00FF, R0                      ; F049   0378 00FF
        BEQ     L_F040                          ; F04B   0224 000C

        CMPI    #$0002, R0                      ; F04D   0378 0002
        BEQ     L_F040                          ; F04F   0224 0010

        CMPI    #$0005, R0                      ; F051   0378 0005
        BEQ     L_F040                          ; F053   0224 0014

        PSHR    R3                              ; F055   0273

        JSR     R5,     L_6927                  ; F056   0004 0168 0127

        PULR    R3                              ; F059   02B3
        B       L_F040                          ; F05A   0220 001B

L_F05C:
        MVI     G_011A, R0                      ; F05C   0280 011A
        DECLE   $0080,  $020C,  $0003,  $0004   ; F05E   0080 020C 0003 0004

        ANDR    R4,     R0                      ; F062   01A0
        ADD@    R4,     R7                      ; F063   02E7

        MVI     G_01AE, R0                      ; F064   0280 01AE
        XOR     G_011A, R0                      ; F066   03C0 011A
        MVO     R0,     G_01AE                  ; F068   0240 01AE
        MVI     G_011B, R0                      ; F06A   0280 011B
        ANDI    #$0040, R0                      ; F06C   03B8 0040
        BEQ     L_F0D2                          ; F06E   0204 0062

        MVII    #$0318, R4                      ; F070   02BC 0318
L_F072:
        MVI@    R4,     R0                      ; F072   02A0
        SDBD                                    ; F073   0001
        CMPI    #$0F00, R0                      ; F074   0378 0000 000F
        BGT     L_F0D2                          ; F077   020E 0059

        CMPI    #$0328, R4                      ; F079   037C 0328
        BLT     L_F072                          ; F07B   0225 000A

        JSR     R5,     L_5CC5                  ; F07D   0004 015C 00C5
        DECLE   $0003,  $0215,  $0053,  $0070   ; F080   0003 0215 0053 0070
        DECLE   $006F,  $0074,  $0020,  $0061   ; F084   006F 0074 0020 0061
        DECLE   $0020,  $0062,  $0061,  $006C   ; F088   0020 0062 0061 006C
        DECLE   $006C,  $0000,  $0229,  $0041   ; F08C   006C 0000 0229 0041
        DECLE   $0063,  $0063,  $0065,  $0070   ; F090   0063 0063 0065 0070
        DECLE   $0074,  $0020,  $0074,  $0061   ; F094   0074 0020 0074 0061
        DECLE   $0062,  $006C,  $0065,  $0020   ; F098   0062 006C 0065 0020
        DECLE   $0061,  $0073,  $002D,  $0069   ; F09C   0061 0073 002D 0069
        DECLE   $0073,  $0002,  $0280,  $0131   ; F0A0   0073 0002 0280 0131
        DECLE   $0080,  $020C,  $002B,  $02B8   ; F0A4   0080 020C 002B 02B8
        DECLE   $0001,  $01C9,  $01D2,  $0012   ; F0A8   0001 01C9 01D2 0012
        DECLE   $0004                           ; F0AC   0004

        ANDR    R3,     R0                      ; F0AD   0198
        ADDR    R2,     R2                      ; F0AE   00D2
        ADDI    #$0318, R5                      ; F0AF   02FD 0318
        SDBD                                    ; F0B1   0001
        MVII    #$0F00, R4                      ; F0B2   02BC 0000 000F
        SUB@    R5,     R4                      ; F0B5   032C
        CMPR    R2,     R4                      ; F0B6   0154
        BC      L_F0BB                          ; F0B7   0201 0002

        MOVR    R4,     R2                      ; F0B9   00A2
        MOVR    R0,     R1                      ; F0BA   0081
L_F0BB:
        INCR    R0                              ; F0BB   0008
        DECLE   $0378,  $000F,  $0226,  $0013   ; F0BC   0378 000F 0226 0013
        DECLE   $0088,  $0004                   ; F0C0   0088 0004

        ANDR    R3,     R0                      ; F0C2   0198
        ADDR    R2,     R2                      ; F0C3   00D2
        SDBD                                    ; F0C4   0001
        MVII    #$1F00, R0                      ; F0C5   02B8 0000 001F
        ADDI    #$0318, R5                      ; F0C8   02FD 0318
        MVO@    R0,     R5                      ; F0CA   0268
        ADDI    #$0010, R5                      ; F0CB   02FD 0010
        SDBD                                    ; F0CD   0001
        MVII    #$1000, R0                      ; F0CE   02B8 0000 0010
        MVO@    R0,     R5                      ; F0D1   0268
L_F0D2:
        MVI     G_011F, R0                      ; F0D2   0280 011F
        SDBD                                    ; F0D4   0001
        ANDI    #$FF7F, R0                      ; F0D5   03B8 007F 00FF
        MVO     R0,     G_011F                  ; F0D8   0240 011F

        JSR     R5,     L_5A06                  ; F0DA   0004 0158 0206
        JSR     R5,     L_59EC                  ; F0DD   0004 0158 01EC

        J       L_6811                          ; F0E0   0004 0368 0011

        PSHR    R5                              ; F0E3   0275
L_F0E4:
        CLRR    R1                              ; F0E4   01C9
        MVII    #$0121, R5                      ; F0E5   02BD 0121
L_F0E7:
        CMP@    R5,     R0                      ; F0E7   0368
        BNEQ    L_F0EB                          ; F0E8   020C 0001

        INCR    R1                              ; F0EA   0009
L_F0EB:
        CMPI    #$0130, R5                      ; F0EB   037D 0130
        BLT     L_F0E7                          ; F0ED   0225 0007

        TSTR    R1                              ; F0EF   0089
        BEQ     L_F106                          ; F0F0   0204 0014

        CMPR    R2,     R1                      ; F0F2   0151
        BEQ     L_F106                          ; F0F3   0204 0011

        MVII    #$0121, R5                      ; F0F5   02BD 0121
L_F0F7:
        CMP@    R5,     R0                      ; F0F7   0368
        BNEQ    L_F0F7                          ; F0F8   022C 0002

        SUBI    #$0121, R5                      ; F0FA   033D 0121
        MOVR    R5,     R3                      ; F0FC   00AB
        PSHR    R0                              ; F0FD   0270
        PSHR    R2                              ; F0FE   0272

        JSR     R5,     L_6927                  ; F0FF   0004 0168 0127

        PULR    R2                              ; F102   02B2
        PULR    R0                              ; F103   02B0
        B       L_F0E4                          ; F104   0220 0021
L_F106:
        PULR    R7                              ; F106   02B7

        MVI     G_011C, R0                      ; F107   0280 011C
        ANDI    #$0080, R0                      ; F109   03B8 0080
        BEQ     L_F11C                          ; F10B   0204 000F

        MVII    #$019C, R5                      ; F10D   02BD 019C
L_F10F:
        MVI@    R5,     R0                      ; F10F   02A8
        CMPI    #$00FF, R0                      ; F110   0378 00FF
        BEQ     L_F144                          ; F112   0204 0030

        CMPI    #$0003, R0                      ; F114   0378 0003
        BGT     L_F10F                          ; F116   022E 0008

        CMPI    #$0002, R0                      ; F118   0378 0002
        BNEQ    L_F144                          ; F11A   020C 0028

L_F11C:
        MVII    #$019C, R5                      ; F11C   02BD 019C
L_F11E:
        MVI@    R5,     R1                      ; F11E   02A9
        CMPI    #$00FF, R1                      ; F11F   0379 00FF
        BEQ     L_F12E                          ; F121   0204 000B

        CMPI    #$0003, R1                      ; F123   0379 0003
        BGT     L_F11E                          ; F125   022E 0008

        ADDI    #$018B, R1                      ; F127   02F9 018B
        MVII    #$0001, R0                      ; F129   02B8 0001
        MVO@    R0,     R1                      ; F12B   0248
        B       L_F11E                          ; F12C   0220 000F

L_F12E:
        MVI     G_018B, R0                      ; F12E   0280 018B
        DECLE   $02C0,  $018C,  $02C0,  $018D   ; F130   02C0 018C 02C0 018D
        DECLE   $0378,  $0002,  $0205,  $000C   ; F134   0378 0002 0205 000C
        DECLE   $02B8,  $0001,  $0004,  $0198   ; F138   02B8 0001 0004 0198
        DECLE   $01C0,  $0340,  $0132,  $0205   ; F13C   01C0 0340 0132 0205
        DECLE   $000B                           ; F140   000B

        J       L_67D3                          ; F141   0004 0364 03D3

L_F144:
        MVI     G_01AE, R0                      ; F144   0280 01AE
        XORI    #$0001, R0                      ; F146   03F8 0001
        MVO     R0,     G_01AE                  ; F148   0240 01AE
        B       L_F14F                          ; F14A   0200 0003

        DECLE   $0004                           ; F14C   0004

        ANDR    R4,     R0                      ; F14D   01A0
        ADD@    R4,     R7                      ; F14E   02E7

L_F14F:
        JSR     R5,     L_6810                  ; F14F   0004 0168 0010

        PULR    R7                              ; F152   02B7

        DECLE   $02BD,  $019C,  $02A8,  $0378   ; F153   02BD 019C 02A8 0378
        DECLE   $00FF,  $0204,  $002F,  $0378   ; F157   00FF 0204 002F 0378
        DECLE   $0003,  $022E,  $0008,  $0378   ; F15B   0003 022E 0008 0378
        DECLE   $0002,  $0204,  $000E,  $0285   ; F15F   0002 0204 000E 0285
        DECLE   $011C,  $03BD,  $0080,  $020C   ; F163   011C 03BD 0080 020C
        DECLE   $0021,  $02B8,  $0001,  $0020   ; F167   0021 02B8 0001 0020
        DECLE   $0004                           ; F16B   0004

        ANDR    R3,     R0                      ; F16C   0198
        CLRR    R0                              ; F16D   01C0
        B       L_F189                          ; F16E   0200 0019

        DECLE   $02A8,  $0378,  $00FF,  $0204   ; F170   02A8 0378 00FF 0204
        DECLE   $0014,  $0378,  $0003,  $022E   ; F174   0014 0378 0003 022E
        DECLE   $0008,  $0378,  $0002,  $0224   ; F178   0008 0378 0002 0224
        DECLE   $000C,  $02B8,  $0001,  $0004   ; F17C   000C 02B8 0001 0004
        DECLE   $0198,  $01C0,  $0340,  $0132   ; F180   0198 01C0 0340 0132
        DECLE   $0205,  $000B                   ; F184   0205 000B

        J       L_67D3                          ; F186   0004 0364 03D3

L_F189:
        MVI     G_01AE, R0                      ; F189   0280 01AE
        XORI    #$0001, R0                      ; F18B   03F8 0001
        MVO     R0,     G_01AE                  ; F18D   0240 01AE
        B       L_F194                          ; F18F   0200 0003

        DECLE   $0004                           ; F191   0004

        ANDR    R4,     R0                      ; F192   01A0
        ADD@    R4,     R7                      ; F193   02E7

L_F194:
        JSR     R5,     L_6810                  ; F194   0004 0168 0010

        PULR    R7                              ; F197   02B7

        MVI     G_011C, R0                      ; F198   0280 011C
        ANDI    #$0080, R0                      ; F19A   03B8 0080
        BEQ     L_F1AD                          ; F19C   0204 000F

        MVII    #$019C, R5                      ; F19E   02BD 019C
L_F1A0:
        MVI@    R5,     R0                      ; F1A0   02A8
        CMPI    #$00FF, R0                      ; F1A1   0378 00FF
        BEQ     L_F1DA                          ; F1A3   0204 0035

        CMPI    #$0003, R0                      ; F1A5   0378 0003
        BGT     L_F1A0                          ; F1A7   022E 0008

        CMPI    #$0003, R0                      ; F1A9   0378 0003
        BNEQ    L_F1DA                          ; F1AB   020C 002D

L_F1AD:
        MVII    #$019C, R5                      ; F1AD   02BD 019C
L_F1AF:
        MVI@    R5,     R1                      ; F1AF   02A9
        CMPI    #$00FF, R1                      ; F1B0   0379 00FF
        BEQ     L_F1BF                          ; F1B2   0204 000B

        CMPI    #$0003, R1                      ; F1B4   0379 0003
        BGT     L_F1AF                          ; F1B6   022E 0008

        ADDI    #$018B, R1                      ; F1B8   02F9 018B
        MVII    #$0001, R0                      ; F1BA   02B8 0001
        MVO@    R0,     R1                      ; F1BC   0248
        B       L_F1AF                          ; F1BD   0220 000F

L_F1BF:
        MVI     G_018B, R1                      ; F1BF   0281 018B
        DECLE   $02C1,  $018C,  $02C1,  $018D   ; F1C1   02C1 018C 02C1 018D
        DECLE   $02C1,  $018E,  $02B8,  $0001   ; F1C5   02C1 018E 02B8 0001
        DECLE   $0379,  $0002,  $0205,  $000D   ; F1C9   0379 0002 0205 000D
        DECLE   $0204,  $0001,  $0008,  $0004   ; F1CD   0204 0001 0008 0004
        DECLE   $0198,  $01C0,  $0340,  $0132   ; F1D1   0198 01C0 0340 0132
        DECLE   $0205,  $000B                   ; F1D5   0205 000B

        J       L_67D3                          ; F1D7   0004 0364 03D3

L_F1DA:
        MVI     G_01AE, R0                      ; F1DA   0280 01AE
        XORI    #$0001, R0                      ; F1DC   03F8 0001
        MVO     R0,     G_01AE                  ; F1DE   0240 01AE
        B       L_F1E5                          ; F1E0   0200 0003

        DECLE   $0004                           ; F1E2   0004

        ANDR    R4,     R0                      ; F1E3   01A0
        ADD@    R4,     R7                      ; F1E4   02E7

L_F1E5:
        JSR     R5,     L_6810                  ; F1E5   0004 0168 0010

        PULR    R7                              ; F1E8   02B7

        DECLE   $0280,  $011C,  $03B8,  $0080   ; F1E9   0280 011C 03B8 0080
        DECLE   $0204,  $000F,  $02BD,  $019C   ; F1ED   0204 000F 02BD 019C
        DECLE   $02A8,  $0378,  $00FF,  $0204   ; F1F1   02A8 0378 00FF 0204
        DECLE   $0028,  $0378,  $0003,  $022E   ; F1F5   0028 0378 0003 022E
        DECLE   $0008,  $0378,  $0002,  $020C   ; F1F9   0008 0378 0002 020C
        DECLE   $0020,  $0004,  $01A0,  $022D   ; F1FD   0020 0004 01A0 022D
        DECLE   $0204,  $000F,  $0004,  $01A0   ; F201   0204 000F 0004 01A0
        DECLE   $024D,  $0204,  $000A,  $0004   ; F205   024D 0204 000A 0004
        DECLE   $01A0,  $0268,  $0204,  $0005   ; F209   01A0 0268 0204 0005
        DECLE   $0004                           ; F20D   0004

        ANDR    R4,     R0                      ; F20E   01A0
        MVI@    R1,     R7                      ; F20F   028F

        DECLE   $020C,  $000C,  $02B8,  $0001   ; F210   020C 000C 02B8 0001
        DECLE   $0004,  $0198,  $01C0,  $0340   ; F214   0004 0198 01C0 0340
        DECLE   $0132,  $0205,  $000B           ; F218   0132 0205 000B

        J       L_67D3                          ; F21B   0004 0364 03D3

        MVI     G_01AE, R0                      ; F21E   0280 01AE
        XORI    #$0001, R0                      ; F220   03F8 0001
        MVO     R0,     G_01AE                  ; F222   0240 01AE
        B       L_F229                          ; F224   0200 0003

        DECLE   $0004                           ; F226   0004

        ANDR    R4,     R0                      ; F227   01A0
        ADD@    R4,     R7                      ; F228   02E7

L_F229:
        JSR     R5,     L_6810                  ; F229   0004 0168 0010

        PULR    R7                              ; F22C   02B7

        PSHR    R5                              ; F22D   0275
        MVII    #$019C, R5                      ; F22E   02BD 019C
        MVI@    R5,     R2                      ; F230   02AA
        CMPI    #$0003, R2                      ; F231   037A 0003
        BGT     L_F24B                          ; F233   020E 0016

        CLRR    R1                              ; F235   01C9
L_F236:
        MVI@    R5,     R0                      ; F236   02A8
        CMPI    #$00FF, R0                      ; F237   0378 00FF
        BEQ     L_F24B                          ; F239   0204 0010

        CMPI    #$0003, R0                      ; F23B   0378 0003
        BLE     L_F242                          ; F23D   0206 0003

        INCR    R1                              ; F23F   0009
        B       L_F236                          ; F240   0220 000B

L_F242:
        CMPR    R2,     R0                      ; F242   0150
        BEQ     L_F236                          ; F243   0224 000E

        CMPI    #$0003, R1                      ; F245   0379 0003
        BLT     L_F24B                          ; F247   0205 0002

L_F249:
        CMPR    R6,     R6                      ; F249   0176
        PULR    R7                              ; F24A   02B7

L_F24B:
        CMPR    R6,     R7                      ; F24B   0177
        PULR    R7                              ; F24C   02B7

        PSHR    R5                              ; F24D   0275
        MVII    #$019C, R5                      ; F24E   02BD 019C
        CLRR    R1                              ; F250   01C9
L_F251:
        MVI@    R5,     R2                      ; F251   02AA
        CMPI    #$00FF, R2                      ; F252   037A 00FF
        BEQ     L_F24B                          ; F254   0224 000A

        CMPI    #$0003, R2                      ; F256   037A 0003
        BLE     L_F25D                          ; F258   0206 0003

        INCR    R1                              ; F25A   0009
        B       L_F251                          ; F25B   0220 000B

L_F25D:
        CMPI    #$0003, R1                      ; F25D   0379 0003
        BLT     L_F24B                          ; F25F   0225 0015

        MVI@    R5,     R0                      ; F261   02A8
        CMPI    #$0003, R0                      ; F262   0378 0003
        BGT     L_F24B                          ; F264   022E 001A
        B       L_F249                          ; F266   0220 001E

        PSHR    R5                              ; F268   0275
        MVII    #$019C, R5                      ; F269   02BD 019C
        MVI@    R5,     R0                      ; F26B   02A8
        CMPI    #$0003, R0                      ; F26C   0378 0003
        BLE     L_F24B                          ; F26E   0226 0024

        CMPI    #$00FF, R0                      ; F270   0378 00FF
        BEQ     L_F24B                          ; F272   0224 0028

        MVI@    R5,     R2                      ; F274   02AA
        CMPI    #$0003, R2                      ; F275   037A 0003
        BGT     L_F24B                          ; F277   022E 002D

        CLRR    R1                              ; F279   01C9
L_F27A:
        MVI@    R5,     R0                      ; F27A   02A8
        CMPI    #$00FF, R0                      ; F27B   0378 00FF
        BEQ     L_F24B                          ; F27D   0224 0033

        CMPI    #$0003, R0                      ; F27F   0378 0003
        BLE     L_F286                          ; F281   0206 0003

        INCR    R1                              ; F283   0009
        B       L_F27A                          ; F284   0220 000B

L_F286:
        CMPR    R2,     R0                      ; F286   0150
        BEQ     L_F27A                          ; F287   0224 000E

        CMPI    #$0002, R1                      ; F289   0379 0002
        BLT     L_F24B                          ; F28B   0225 0041
        B       L_F249                          ; F28D   0220 0045

        PSHR    R5                              ; F28F   0275
        MVII    #$019C, R5                      ; F290   02BD 019C
        CLRR    R1                              ; F292   01C9
L_F293:
        MVI@    R5,     R2                      ; F293   02AA
        CMPI    #$00FF, R2                      ; F294   037A 00FF
        BEQ     L_F24B                          ; F296   0224 004C

        CMPI    #$0003, R2                      ; F298   037A 0003
        BLE     L_F29F                          ; F29A   0206 0003

        INCR    R1                              ; F29C   0009
        B       L_F293                          ; F29D   0220 000B

L_F29F:
        CMPI    #$0002, R1                      ; F29F   0379 0002
        BLT     L_F24B                          ; F2A1   0225 0057

        CLRR    R1                              ; F2A3   01C9
L_F2A4:
        MVI@    R5,     R0                      ; F2A4   02A8
        CMPI    #$00FF, R0                      ; F2A5   0378 00FF
        BEQ     L_F24B                          ; F2A7   0224 005D

        CMPI    #$0003, R0                      ; F2A9   0378 0003
        BLE     L_F2B0                          ; F2AB   0206 0003

        INCR    R1                              ; F2AD   0009
        B       L_F2A4                          ; F2AE   0220 000B

L_F2B0:
        CMPR    R2,     R0                      ; F2B0   0150
        BEQ     L_F2A4                          ; F2B1   0224 000E

        CMPI    #$0001, R1                      ; F2B3   0379 0001
        BLT     L_F24B                          ; F2B5   0225 006B
        B       L_F249                          ; F2B7   0220 006F

        DECLE   $00C8,  $03E9,  $0005,  $000C   ; F2B9   00C8 03E9 0005 000C
        DECLE   $0080,  $002B,  $0040,  $0028   ; F2BD   0080 002B 0040 0028
        DECLE   $000B,  $012B,  $03CF           ; F2C1   000B 012B 03CF

        ADDR    R1,     R0                      ; F2C4   00C8
        SUB     G_00BE, R0                      ; F2C5   0300 00BE
        SAR     R3,     1                       ; F2C7   006B
        ADD@    R1,     R7                      ; F2C8   02CF

        ADDR    R1,     R0                      ; F2C9   00C8
        SUB     G_007F, R0                      ; F2CA   0300 007F
        SAR     R3,     1                       ; F2CC   006B
        ADD@    R1,     R7                      ; F2CD   02CF

        DECLE   $00CA,  $0389,  $03C0,  $01C0   ; F2CE   00CA 0389 03C0 01C0
        DECLE   $03D8,  $0000                   ; F2D2   03D8 0000

        XOR@    R2,     R4                      ; F2D4   03D4
        B       L_F432                          ; F2D5   0200 015B

        DECLE   $03CE,  $0001                   ; F2D7   03CE 0001

        XORR    R4,     R3                      ; F2D9   01E3
        AND@    R5,     R3                      ; F2DA   03AB
        ADD@    R1,     R7                      ; F2DB   02CF
        ADDR    R0,     R7                      ; F2DC   00C7

        DECLE   $0048,  $0328,  $001B,  $0040   ; F2DD   0048 0328 001B 0040
        DECLE   $0340,  $03C9,  $000C,  $0108   ; F2E1   0340 03C9 000C 0108
        DECLE   $000B,  $03CF                   ; F2E5   000B 03CF

        PSHR    R5                              ; F2E7   0275
        MVII    #$0003, R0                      ; F2E8   02B8 0003

        JSR     R5,     L_6FA0                  ; F2EA   0004 016C 03A0
        BIDECLE $A2F0                           ; F2ED   00F0 00A2

        PULR    R7                              ; F2EF   02B7

        DECLE   $00CC,  $0279                   ; F2F0   00CC 0279

        XOR@    R5,     R5                      ; F2F2   03ED
        SUBR    R0,     R5                      ; F2F3   0105
        ANDR    R4,     R5                      ; F2F4   01A5
        SLR     R2,     1                       ; F2F5   0062
        SAR     R2,     1                       ; F2F6   006A
        XORR    R5,     R3                      ; F2F7   01EB
        EIS                                     ; F2F8   0002
        INCR    R2                              ; F2F9   000A
        INCR    R7                              ; F2FA   000F

        DECLE   $03FF                           ; F2FB   03FF
L_F2FC:
        MOVR    R1,     R7                      ; F2FC   008F

        DECR    R3                              ; F2FD   0013
        INCR    R7                              ; F2FE   000F

        DECLE   $0000                           ; F2FF   0000
L_F300:
        DECR    R3                              ; F300   0013
        DECLE   $0019,  $0003,  $0061,  $02E9   ; F301   0019 0003 0061 02E9
        DECLE   $0280,  $0050,  $015B,  $0001   ; F305   0280 0050 015B 0001
        DECLE   $03F8,  $03EB,  $0013,  $002E   ; F309   03F8 03EB 0013 002E
        DECLE   $0023,  $0016,  $0001,  $000C   ; F30D   0023 0016 0001 000C
        DECLE   $016B,  $0001,  $03F4,  $00C3   ; F311   016B 0001 03F4 00C3
        DECLE   $03E6,  $0001                   ; F315   03E6 0001

        INCR    R0                              ; F317   0008
        XOR@    R5,     R3                      ; F318   03EB
        ADDI    #$0157, R1                      ; F319   02F9 0157
        ADCR    R6                              ; F31B   002E
        DECR    R3                              ; F31C   0013
        COMR    R1                              ; F31D   0019
        DIS                                     ; F31E   0003
        NEGR    R5                              ; F31F   0025
        ADD@    R1,     R1                      ; F320   02C9
        MVI     .BTAB.00,R0                     ; F321   0280 0200
        SUB@    R1,     R0                      ; F323   0308
        MVO     R0,     G_03EB                  ; F324   0240 03EB
        ADDI    #$0097, R1                      ; F326   02F9 0097
        SWAP    R0,     1                       ; F328   0040
        DIS                                     ; F329   0003
        CMP@    R2,     R4                      ; F32A   0354
        XOR@    R6,     R2                      ; F32B   03F2
        XORI    #$000F, R2                      ; F32C   03FA 000F
        EIS                                     ; F32E   0002
        MOVR    R1,     R7                      ; F32F   008F

        DECLE   $0027,  $03F9,  $03CF,  $0275   ; F330   0027 03F9 03CF 0275
        DECLE   $0280,  $01FE,  $0378,  $007E   ; F334   0280 01FE 0378 007E
        DECLE   $020C,  $0014,  $0280,  $01FF   ; F338   020C 0014 0280 01FF
        DECLE   $0378,  $00BE,  $020C,  $000E   ; F33C   0378 00BE 020C 000E
        DECLE   $0004,  $0158,  $01C5           ; F340   0004 0158 01C5

        SDBD                                    ; F343   0001
        MVII    #$92C8, R4                      ; F344   02BC 00C8 0092

        JSR     R5,     L_5D70                  ; F347   0004 015C 0170

        MVO     R6,     G_0102                  ; F34A   0246 0102
        EIS                                     ; F34C   0002
L_F34D:
        DECR    R7                              ; F34D   0017

        JSR     R5,     L_6FB1                  ; F34E   0004 016C 03B1
        BIDECLE $A6E5                           ; F351   00E5 00A6
        DECLE   $02B8,  $0001,  $0240,  $0130   ; F353   02B8 0001 0240 0130
        DECLE   $0004                           ; F357   0004

        ANDR    R3,     R0                      ; F358   0198
        MOVR    R3,     R0                      ; F359   0098
        SDBD                                    ; F35A   0001
        MVII    #$3980, R1                      ; F35B   02B9 0080 0039
        SDBD                                    ; F35E   0001
        MVII    #$93E0, R4                      ; F35F   02BC 00E0 0093
        MVII    #$0050, R0                      ; F362   02B8 0050

        JSR     R5,     .EXEC.730               ; F364   0004 0114 0330
        DECLE   $0240,  $0020,  $0004,  $01A4   ; F367   0240 0020 0004 01A4
        DECLE   $00B5,  $00FF                   ; F36B   00B5 00FF

        MOVR    R4,     R3                      ; F36D   00A3
        CLRR    R0                              ; F36E   01C0
        MVO     R0,     G_0119                  ; F36F   0240 0119
L_F371:
        MVII    #$0255, R4                      ; F371   02BC 0255
        MVII    #$000A, R0                      ; F373   02B8 000A

        JSR     R5,     X_FILL_ZERO             ; F375   0004 0114 0338

        MVII    #$0268, R4                      ; F378   02BC 0268
        MVII    #$000C, R0                      ; F37A   02B8 000C

        JSR     R5,     X_FILL_ZERO             ; F37C   0004 0114 0338

        MVI     G_0119, R1                      ; F37F   0281 0119
        ADDR    R7,     R1                      ; F381   00F9
        ADDI    #$0017, R1                      ; F382   02F9 0017
        ADD@    R1,     R1                      ; F384   02C9
        MOVR    R1,     R4                      ; F385   008C

        JSR     R5,     L_5D5A                  ; F386   0004 015C 015A
        DECLE   $02A0,  $0004                   ; F389   02A0 0004

        ANDR    R3,     R0                      ; F38B   0198
        MOVR    R7,     R5                      ; F38C   00BD
        MVI     G_0119, R0                      ; F38D   0280 0119
        INCR    R0                              ; F38F   0008
        CMPI    #$0009, R0                      ; F390   0378 0009
        BLE     L_F395                          ; F392   0206 0001

        CLRR    R0                              ; F394   01C0
L_F395:
        MVO     R0,     G_0119                  ; F395   0240 0119
        B       L_F371                          ; F397   0220 0027

        DECLE   $000E,  $0009,  $001E,  $0007   ; F399   000E 0009 001E 0007
        DECLE   $002C,  $0005,  $0038,  $0003   ; F39D   002C 0005 0038 0003
        DECLE   $004B,  $0001,  $0000,  $0000   ; F3A1   004B 0001 0000 0000
        DECLE   $0002,  $001E,  $0007,  $0258   ; F3A5   0002 001E 0007 0258
        DECLE   $0049,  $004E,  $0054,  $0056   ; F3A9   0049 004E 0054 0056
        DECLE   $0000,  $026A,  $0050,  $0072   ; F3AD   0000 026A 0050 0072
        DECLE   $0065,  $0073,  $0065,  $006E   ; F3B1   0065 0073 0065 006E
        DECLE   $0074,  $0073,  $0002,  $0082   ; F3B5   0074 0073 0002 0082
        DECLE   $0007,  $0268,  $0044,  $0045   ; F3B9   0007 0268 0044 0045
        DECLE   $0045,  $0050,  $0020,  $0050   ; F3BD   0045 0050 0020 0050
        DECLE   $004F,  $0043,  $004B,  $0045   ; F3C1   004F 0043 004B 0045
        DECLE   $0054,  $0053,  $0002,  $0096   ; F3C5   0054 0053 0002 0096
        DECLE   $0007,  $0269,  $0053,  $0075   ; F3C9   0007 0269 0053 0075
        DECLE   $0070,  $0065,  $0072,  $0020   ; F3CD   0070 0065 0072 0020
        DECLE   $0020,  $0050,  $0072,  $006F   ; F3D1   0020 0050 0072 006F
        DECLE   $0002,  $0064,  $0007,  $0257   ; F3D5   0002 0064 0007 0257
        DECLE   $0050,  $006F,  $006F,  $006C   ; F3D9   0050 006F 006F 006C
        DECLE   $0020,  $0026,  $0000,  $026A   ; F3DD   0020 0026 0000 026A
        DECLE   $0042,  $0069,  $006C,  $006C   ; F3E1   0042 0069 006C 006C
        DECLE   $0069,  $0061,  $0072,  $0064   ; F3E5   0069 0061 0072 0064
        DECLE   $0073,  $0002,  $00AA,  $0007   ; F3E9   0073 0002 00AA 0007
        DECLE   $0255,  $0043,  $006F,  $0070   ; F3ED   0255 0043 006F 0070
        DECLE   $0079,  $0072,  $0069,  $0067   ; F3F1   0079 0072 0069 0067
        DECLE   $0068,  $0074,  $0000,  $026C   ; F3F5   0068 0074 0000 026C
        DECLE   $0031,  $0039,  $0039,  $0030   ; F3F9   0031 0039 0039 0030
        DECLE   $0002,  $008C,  $0000,  $0003   ; F3FD   0002 008C 0000 0003
        DECLE   $0000,  $0005,  $0000,  $0039   ; F401   0000 0005 0000 0039
        DECLE   $0002,  $00CA,  $0000           ; F405   0002 00CA 0000

        MOVR    R0,     R2                      ; F408   0082
        INCR    R1                              ; F409   0009
        RRC     R1,     1                       ; F40A   0071
        EIS                                     ; F40B   0002
        ADDR    R0,     R7                      ; F40C   00C7

        DECLE   $0008,  $0081,  $0009,  $0018   ; F40D   0008 0081 0009 0018
        DECLE   $0002,  $00B6,  $0001,  $0090   ; F411   0002 00B6 0001 0090
        DECLE   $0009,  $0090,  $0002,  $00B6   ; F415   0009 0090 0002 00B6
        DECLE   $0005,  $0090,  $0009,  $0062   ; F419   0005 0090 0009 0062
        DECLE   $0002,  $00C1,  $0000           ; F41D   0002 00C1 0000

        MOVR    R4,     R7                      ; F420   00A7

        INCR    R1                              ; F421   0009
        SARC    R2,     1                       ; F422   007A
        EIS                                     ; F423   0002
        ADDR    R0,     R7                      ; F424   00C7

        DECLE   $0000,  $00A7,  $0009,  $0054   ; F425   0000 00A7 0009 0054
        DECLE   $0002,  $00BC,  $0000,  $00B0   ; F429   0002 00BC 0000 00B0
        DECLE   $0009,  $0007,  $0006,  $00C5   ; F42D   0009 0007 0006 00C5
        DECLE   $0000                           ; F431   0000
L_F432:
        ADDR    R0,     R3                      ; F432   00C3
        DECLE   $0009,  $00B7,  $0092,  $0320   ; F433   0009 00B7 0092 0320
        DECLE   $0336,  $0065,  $0175,  $0330   ; F437   0336 0065 0175 0330
        DECLE   $0065,  $0320,  $033D,  $0032   ; F43B   0065 0320 033D 0032
        DECLE   $021D,  $021B,  $021A,  $021F   ; F43F   021D 021B 021A 021F
        DECLE   $01A6,  $0320,  $033B,  $0035   ; F443   01A6 0320 033B 0035
        DECLE   $021C,  $0214,  $0212,  $0213   ; F447   021C 0214 0212 0213
        DECLE   $021D,  $021A                   ; F44B   021D 021A

        ANDR    R5,     R6                      ; F44D   01AE
        SUB@    R4,     R0                      ; F44E   0320
        SUBI    #$0350, R1                      ; F44F   0339 0350
        CMP     G_0077, R0                      ; F451   0340 0077
        BEQ     L_F78B                          ; F453   0204 0336

        CMP     G_0076, R0                      ; F455   0340 0076
        SUB@    R4,     R0                      ; F457   0320
        SUB@    R6,     R7                      ; F458   0337

        CMP     G_0077, R0                      ; F459   0340 0077
        SUB@    R2,     R0                      ; F45B   0310
        SUBI    #$0340, R0                      ; F45C   0338 0340
        RRC     R2,     2                       ; F45E   0076
        SUB@    R4,     R0                      ; F45F   0320
        SUB@    R6,     R5                      ; F460   0335
        CMP     G_0077, R0                      ; F461   0340 0077
        SUB@    R2,     R0                      ; F463   0310
        SUBI    #$0340, R2                      ; F464   033A 0340
        RRC     R2,     2                       ; F466   0076
        SUB@    R4,     R0                      ; F467   0320
        SUB@    R6,     R3                      ; F468   0333
        SLL     R3,     1                       ; F469   004B
        SUBI    #$0320, R6                      ; F46A   033E 0320
        SUB@    R6,     R1                      ; F46C   0331
        CMP@    R2,     R0                      ; F46D   0350
        SARC    R3,     1                       ; F46E   007B
        CMP@    R2,     R0                      ; F46F   0350
        INCR    R3                              ; F470   000B
        CLRR    R0                              ; F471   01C0
        SUB@    R6,     R4                      ; F472   0334
        SUBR    R6,     R0                      ; F473   0130
        ADDR    R4,     R0                      ; F474   00E0
        XORR    R4,     R0                      ; F475   01E0
        CLRR    R0                              ; F476   01C0
        SUB@    R6,     R3                      ; F477   0333
        ADCR    R3                              ; F478   002B
        CMP@    R2,     R0                      ; F479   0350
        SUBR    R5,     R3                      ; F47A   012B
        CMP@    R2,     R0                      ; F47B   0350
        SUB@    R4,     R0                      ; F47C   0320
        CMP@    R2,     R0                      ; F47D   0350
        MOVR    R7,     R3                      ; F47E   00BB
        CMP@    R2,     R0                      ; F47F   0350
        INCR    R3                              ; F480   000B
        CMP     G_00CC, R7                      ; F481   0347 00CC
        SUB@    R6,     R0                      ; F483   0330
        MOVR    R0,     R7                      ; F484   0087

        DECLE   $0310,  $01D7,  $0310,  $01FF   ; F485   0310 01D7 0310 01FF
        DECLE   $001F,  $01D2,  $0310,  $0330   ; F489   001F 01D2 0310 0330
        DECLE   $01D1,  $01F6,  $0310,  $01D7   ; F48D   01D1 01F6 0310 01D7
        DECLE   $016B,  $002B,  $0350,  $00FB   ; F491   016B 002B 0350 00FB
        DECLE   $00CB,  $00AB,  $0336,  $015B   ; F495   00CB 00AB 0336 015B
        DECLE   $014B,  $00AB,  $0335,  $018B   ; F499   014B 00AB 0335 018B
        DECLE   $010B,  $00DB,  $009B,  $0330   ; F49D   010B 00DB 009B 0330
        DECLE   $022B,  $01CB,  $0333,  $023B   ; F4A1   022B 01CB 0333 023B
        DECLE   $019B,  $01CB,  $0333,  $005B   ; F4A5   019B 01CB 0333 005B
        DECLE   $009B,  $01BB,  $011B,  $0310   ; F4A9   009B 01BB 011B 0310
        DECLE   $024B,  $0330,  $0310,  $033C   ; F4AD   024B 0330 0310 033C
        DECLE   $024B,  $0330,  $0310,  $0300   ; F4B1   024B 0330 0310 0300
        DECLE   $0001,  $02AC,  $0275,  $0274   ; F4B5   0001 02AC 0275 0274
        DECLE   $0004,  $0158,  $01C5,  $0004   ; F4B9   0004 0158 01C5 0004
        DECLE   $0198,  $0098,  $02B4,  $02BD   ; F4BD   0198 0098 02B4 02BD
        DECLE   $0028,  $02A1,  $0269,  $037D   ; F4C1   0028 02A1 0269 037D
        DECLE   $002C,  $0226,  $0005,  $0004   ; F4C5   002C 0226 0005 0004

        ANDR    R3,     R0                      ; F4C9   0198
        XORR    R6,     R1                      ; F4CA   01F1
        SDBD                                    ; F4CB   0001
        MVII    #$3800, R1                      ; F4CC   02B9 0000 0038
        SDBD                                    ; F4CF   0001
        MVI@    R4,     R5                      ; F4D0   02A5
        PSHR    R4                              ; F4D1   0274
        MVI@    R5,     R0                      ; F4D2   02A8
        ANDI    #$00FF, R0                      ; F4D3   03B8 00FF
        SLL     R0,     1                       ; F4D5   0048
        MOVR    R5,     R4                      ; F4D6   00AC

        JSR     R5,     .EXEC.730               ; F4D7   0004 0114 0330
        DECLE   $02B4,  $0240,  $0020,  $0004   ; F4DA   02B4 0240 0020 0004
        DECLE   $01A4,  $0100,  $0000           ; F4DE   01A4 0100 0000

        PULR    R7                              ; F4E1   02B7

        DECLE   $01C0,  $0240,  $0118,  $0004   ; F4E2   01C0 0240 0118 0004
        DECLE   $0158,  $01C5,  $0004,  $0198   ; F4E6   0158 01C5 0004 0198
        DECLE   $0098,  $0004                   ; F4EA   0098 0004

        ANDR    R3,     R0                      ; F4EC   0198
        MOVR    R6,     R3                      ; F4ED   00B3
        MVII    #$000E, R0                      ; F4EE   02B8 000E
        MVO     R0,     .STIC.CS.0              ; F4F0   0240 0028
        MVO     R0,     .STIC.BORD              ; F4F2   0240 002C
        MVO     R0,     .STIC.VIDEN             ; F4F4   0240 0020
        SDBD                                    ; F4F6   0001
        MVII    #$9000, R4                      ; F4F7   02BC 0000 0090

        JSR     R5,     L_5D70                  ; F4FA   0004 015C 0170

        PULR    R7                              ; F4FD   02B7

        SDBD                                    ; F4FE   0001
        MVI@    R5,     R4                      ; F4FF   02AC
        MVI@    R5,     R0                      ; F500   02A8
        MVO     R0,     G_01BF                  ; F501   0240 01BF
        PSHR    R5                              ; F503   0275
        MVII    #$0200, R5                      ; F504   02BD 0200
        CLRR    R2                              ; F506   01D2
        CLRR    R3                              ; F507   01DB
L_F508:
        MVI@    R4,     R0                      ; F508   02A0
        MOVR    R0,     R1                      ; F509   0081
        SLR     R1,     2                       ; F50A   0065
        SLR     R1,     2                       ; F50B   0065
        ANDI    #$000F, R0                      ; F50C   03B8 000F
        CMPI    #$0030, R1                      ; F50E   0379 0030
        BGE     L_F529                          ; F510   020D 0017

        CMPI    #$0007, R0                      ; F512   0378 0007
        BLE     L_F51A                          ; F514   0206 0004

        SDBD                                    ; F516   0001
        XORI    #$1008, R0                      ; F517   03F8 0008 0010
L_F51A:
        SDBD                                    ; F51A   0001
        MVII    #$0800, R3                      ; F51B   02BB 0000 0008
        ADD     G_01BF, R3                      ; F51E   02C3 01BF
L_F520:
        SLL     R1,     2                       ; F520   004D
        SLL     R1,     1                       ; F521   0049
        ADDR    R1,     R3                      ; F522   00CB
        XORR    R0,     R3                      ; F523   01C3
        XORR    R2,     R3                      ; F524   01D3
        MVO@    R3,     R5                      ; F525   026B
        CLRR    R2                              ; F526   01D2
        B       L_F508                          ; F527   0220 0020

L_F529:
        SUBI    #$0030, R1                      ; F529   0339 0030
        INCR    R1                              ; F52B   0009
        ADDR    R7,     R1                      ; F52C   00F9
        ADD@    R1,     R7                      ; F52D   02CF

        DECLE   $0008,  $000C,  $0009,  $0010   ; F52E   0008 000C 0009 0010
        DECLE   $0016,  $0019,  $001F           ; F532   0016 0019 001F

        NEGR    R2                              ; F535   0022
        PULR    R7                              ; F536   02B7

        MVII    #$005F, R1                      ; F537   02B9 005F
        INCR    R7                              ; F539   000F

        CLRR    R1                              ; F53A   01C9
L_F53B:
        CLRR    R3                              ; F53B   01DB
        B       L_F520                          ; F53C   0220 001D

L_F53E:
        MVO@    R3,     R5                      ; F53E   026B
        DECR    R0                              ; F53F   0010
        BPL     L_F53E                          ; F540   0223 0003
        B       L_F508                          ; F542   0220 003B

        MVI@    R4,     R1                      ; F544   02A1
        B       L_F53B                          ; F545   0220 000B

        SDBD                                    ; F547   0001
        MVII    #$2000, R2                      ; F548   02BA 0000 0020
        B       L_F508                          ; F54B   0220 0044

        ADDR    R0,     R5                      ; F54D   00C5
        B       L_F508                          ; F54E   0220 0047

        MVI@    R4,     R5                      ; F550   02A5
        B       L_F508                          ; F551   0220 004A

        DECLE   $0000,  $000B,  $0000,  $0005   ; F553   0000 000B 0000 0005
        DECLE   $0000,  $0089,  $0002,  $008C   ; F557   0000 0089 0002 008C
        DECLE   $0000,  $0083,  $0019,  $0070   ; F55B   0000 0083 0019 0070
        DECLE   $0006,  $00BB,  $0000,  $0093   ; F55F   0006 00BB 0000 0093
        DECLE   $0019,  $008A,  $0002,  $0092   ; F563   0019 008A 0002 0092
        DECLE   $0000,  $00A3,  $0009,  $0070   ; F567   0000 00A3 0009 0070
        DECLE   $0002,  $00C9,  $0000,  $00B0   ; F56B   0002 00C9 0000 00B0
        DECLE   $0009,  $004E,  $0006,  $00BB   ; F56F   0009 004E 0006 00BB
        DECLE   $0000,  $00C0,  $0019,  $0058   ; F573   0000 00C0 0019 0058
        DECLE   $0002,  $00A6,  $0000,  $00D0   ; F577   0002 00A6 0000 00D0
        DECLE   $0009,  $0057,  $0002,  $00AC   ; F57B   0009 0057 0002 00AC
        DECLE   $0000,  $00E3,  $0009,  $0080   ; F57F   0000 00E3 0009 0080
        DECLE   $0006,  $00B7,  $0000,  $00F3   ; F583   0006 00B7 0000 00F3
        DECLE   $0009,  $0030,  $0094,  $0310   ; F587   0009 0030 0094 0310
        DECLE   $0118,  $0332,  $0310,  $0333   ; F58B   0118 0332 0310 0333
        DECLE   $00F8,  $0310,  $0338,  $02B8   ; F58F   00F8 0310 0338 02B8
        DECLE   $0332,  $0310,  $0332,  $0003   ; F593   0332 0310 0332 0003
        DECLE   $0323,  $0143,  $0310,  $0331   ; F597   0323 0143 0310 0331
        DECLE   $0138,  $0310,  $0333,  $011B   ; F59B   0138 0310 0333 011B
        DECLE   $0332,  $0310,  $0331,  $0003   ; F59F   0332 0310 0331 0003
        DECLE   $0323,  $0331,  $0143,  $0310   ; F5A3   0323 0331 0143 0310
        DECLE   $0211,  $0138,  $0071,  $0281   ; F5A7   0211 0138 0071 0281
        DECLE   $0310,  $0331,  $011B,  $0332   ; F5AB   0310 0331 011B 0332
        DECLE   $0310,  $0333,  $008B,  $0310   ; F5AF   0310 0333 008B 0310
        DECLE   $0331,  $0121,  $01A3,  $0021   ; F5B3   0331 0121 01A3 0021
        DECLE   $01C1,  $0310,  $0331,  $011B   ; F5B7   01C1 0310 0331 011B
        DECLE   $0332,  $025B,  $0310,  $0212   ; F5BB   0332 025B 0310 0212
        DECLE   $02C2,  $0072,  $027B,  $00B2   ; F5BF   02C2 0072 027B 00B2
        DECLE   $0292,  $0310,  $0330,  $0138   ; F5C3   0292 0310 0330 0138
        DECLE   $0171,  $0310,  $0332,  $015B   ; F5C7   0171 0310 0332 015B
        DECLE   $0332,  $003B,  $0168,  $0122   ; F5CB   0332 003B 0168 0122
        DECLE   $0182,  $0022,  $02D2,  $01C2   ; F5CF   0182 0022 02D2 01C2
        DECLE   $01E2,  $01B2,  $01F2,  $013B   ; F5D3   01E2 01B2 01F2 013B
        DECLE   $0051,  $0310,  $0333,  $010B   ; F5D7   0051 0310 0333 010B
        DECLE   $00AB,  $004B,  $0332,  $0350   ; F5DB   00AB 004B 0332 0350
        DECLE   $00C3,  $0350,  $004B,  $004B   ; F5DF   00C3 0350 004B 004B
        DECLE   $0331,  $01D2,  $0192,  $004B   ; F5E3   0331 01D2 0192 004B
        DECLE   $006B,  $020B,  $0310,  $0331   ; F5E7   006B 020B 0310 0331
        DECLE   $010B,  $009B,  $00D5,  $0235   ; F5EB   010B 009B 00D5 0235
        DECLE   $033A,  $0015,  $022B,  $020B   ; F5EF   033A 0015 022B 020B
        DECLE   $0310,  $010B,  $009B,  $00E5   ; F5F3   0310 010B 009B 00E5
        DECLE   $0350,  $0310,  $0262,  $0310   ; F5F7   0350 0310 0262 0310
        DECLE   $0334,  $0267,  $0310,  $0247   ; F5FB   0334 0267 0310 0247
        DECLE   $0310,  $0330,  $0266,  $02A0   ; F5FF   0310 0330 0266 02A0
        DECLE   $0350,  $022B,  $020B,  $0350   ; F603   0350 022B 020B 0350
        DECLE   $0320,  $0330,  $0300,  $0000   ; F607   0320 0330 0300 0000
        DECLE   $0005,  $0000,  $0005,  $0000   ; F60B   0005 0000 0005 0000
        DECLE   $0083,  $0002,  $00A2,  $0000   ; F60F   0083 0002 00A2 0000
        DECLE   $0083,  $0009,  $0081,  $0002   ; F613   0083 0009 0081 0002
        DECLE   $009B,  $0000,  $0093,  $0019   ; F617   009B 0000 0093 0019
        DECLE   $0030,  $0002,  $00B8,  $0000   ; F61B   0030 0002 00B8 0000
        DECLE   $00A0,  $0009,  $007C,  $0002   ; F61F   00A0 0009 007C 0002
        DECLE   $00BA,  $0000                   ; F623   00BA 0000

        MOVR    R6,     R3                      ; F625   00B3
        INCR    R1                              ; F626   0009
        GSWD    R1                              ; F627   0031
        EIS                                     ; F628   0002
        MOVR    R2,     R7                      ; F629   0097

        DECLE   $0003,  $00C0,  $0019,  $0040   ; F62A   0003 00C0 0019 0040
        DECLE   $0002,  $009C,  $0000,  $00D0   ; F62E   0002 009C 0000 00D0
        DECLE   $0009,  $0040,  $0002,  $00A2   ; F632   0009 0040 0002 00A2
        DECLE   $0000,  $00E3,  $0009,  $0048   ; F636   0000 00E3 0009 0048
        DECLE   $0002,  $00AE,  $0000,  $00F3   ; F63A   0002 00AE 0000 00F3
        DECLE   $0009,  $0061,  $0096,  $0108   ; F63E   0009 0061 0096 0108
        DECLE   $0331,  $0310,  $0334,  $0003   ; F642   0331 0310 0334 0003
        DECLE   $0323,  $0123,  $0310,  $0336   ; F646   0323 0123 0310 0336
        DECLE   $0278,  $0108,  $0278           ; F64A   0278 0108 0278

        SUB@    R2,     R0                      ; F64D   0310
        SUB@    R6,     R3                      ; F64E   0333
        DIS                                     ; F64F   0003
        SUB@    R4,     R3                      ; F650   0323
        SUB@    R6,     R1                      ; F651   0331
        SUBR    R4,     R3                      ; F652   0123
        SUB@    R2,     R0                      ; F653   0310
        SUB@    R6,     R5                      ; F654   0335
        SUBR    R1,     R3                      ; F655   010B
        SUB@    R6,     R1                      ; F656   0331
        SUB@    R2,     R0                      ; F657   0310
        SUB@    R6,     R0                      ; F658   0330
        NEGR    R0                              ; F659   0020
        SUB@    R6,     R0                      ; F65A   0330
        MOVR    R1,     R3                      ; F65B   008B
        SUB@    R2,     R0                      ; F65C   0310
        SUBI    #$010B, R2                      ; F65D   033A 010B
        SUB@    R6,     R1                      ; F65F   0331
        SUB@    R2,     R0                      ; F660   0310
        SUB@    R6,     R2                      ; F661   0332
        MVO@    R3,     R1                      ; F662   024B
        SUB@    R2,     R0                      ; F663   0310
        SUB@    R6,     R1                      ; F664   0331
        SLR     R0,     1                       ; F665   0060
        SUB@    R2,     R0                      ; F666   0310
        SUB@    R6,     R6                      ; F667   0336
        SUBR    R1,     R3                      ; F668   010B
        SUB@    R6,     R1                      ; F669   0331
        SUB@    R2,     R0                      ; F66A   0310
        SUB@    R6,     R0                      ; F66B   0330
        MVI     G_0072, R2                      ; F66C   0282 0072
        XORR    R4,     R2                      ; F66E   01E2
        MOVR    R6,     R2                      ; F66F   00B2
        CLRR    R2                              ; F670   01D2
        SUB@    R2,     R0                      ; F671   0310
        SUB@    R6,     R2                      ; F672   0332
        MVI     .STIC.VDLY,R1                   ; F673   0281 0031
        CMPR    R2,     R1                      ; F675   0151
        SUB@    R2,     R0                      ; F676   0310
        SUB@    R6,     R1                      ; F677   0331
        SUBR    R7,     R3                      ; F678   013B
        SUB@    R6,     R1                      ; F679   0331
        SUB@    R2,     R0                      ; F67A   0310
        SUBR    R2,     R2                      ; F67B   0112
        CMPR    R4,     R2                      ; F67C   0162
        NEGR    R2                              ; F67D   0022
        MVI@    R2,     R2                      ; F67E   0292
        ADDR    R0,     R2                      ; F67F   00C2
        SUB@    R6,     R0                      ; F680   0330
        SUB@    R2,     R0                      ; F681   0310
        SUB@    R6,     R1                      ; F682   0331
        SLR     R1,     1                       ; F683   0061
        DECR    R1                              ; F684   0011
        MVO@    R1,     R2                      ; F685   0251
        ANDR    R0,     R1                      ; F686   0181
        SUB@    R2,     R0                      ; F687   0310
        SUB@    R6,     R6                      ; F688   0336
        SUB@    R4,     R3                      ; F689   0323
        SUB@    R2,     R0                      ; F68A   0310
        CMPR    R6,     R2                      ; F68B   0172
        ANDR    R0,     R2                      ; F68C   0182
        SUB@    R2,     R0                      ; F68D   0310
        SUB@    R6,     R3                      ; F68E   0333
        XORR    R6,     R1                      ; F68F   01F1
        BC      L_F9A2                          ; F690   0201 0310
        SUB@    R6,     R7                      ; F692   0337

        DECLE   $014B,  $0310,  $0222,  $01B2   ; F693   014B 0310 0222 01B2
        DECLE   $0310,  $0334,  $01A1,  $0310   ; F697   0310 0334 01A1 0310
        DECLE   $0333,  $00FB,  $00AB,  $026B   ; F69B   0333 00FB 00AB 026B
        DECLE   $004B,  $033A,  $023B,  $005B   ; F69F   004B 033A 023B 005B
        DECLE   $00EB,  $0310,  $00FB,  $009B   ; F6A3   00EB 0310 00FB 009B
        DECLE   $00D5,  $0325,  $0333,  $0350   ; F6A7   00D5 0325 0333 0350
        DECLE   $0197,  $0350,  $0325,  $0325   ; F6AB   0197 0350 0325 0325
        DECLE   $0335,  $01C5,  $021B           ; F6AF   0335 01C5 021B

        ADDR    R5,     R3                      ; F6B2   00EB
        SUB     .BTAB.AC,R0                     ; F6B3   0300 02AC
        PSHR    R5                              ; F6B5   0275
        PSHR    R3                              ; F6B6   0273
        MOVR    R4,     R3                      ; F6B7   00A3
        MVI@    R3,     R5                      ; F6B8   029D
        INCR    R5                              ; F6B9   000D
        MVO@    R5,     R3                      ; F6BA   025D
        ADDR    R5,     R3                      ; F6BB   00EB
        MVO@    R0,     R3                      ; F6BC   0258
        PULR    R3                              ; F6BD   02B3
        PULR    R7                              ; F6BE   02B7

        MVI@    R5,     R4                      ; F6BF   02AC
        PSHR    R5                              ; F6C0   0275
        PSHR    R3                              ; F6C1   0273
        MOVR    R4,     R3                      ; F6C2   00A3
        MVI@    R4,     R5                      ; F6C3   02A5
L_F6C4:
        DECR    R5                              ; F6C4   0015
        BMI     L_F6D9                          ; F6C5   020B 0012

        CMP@    R4,     R0                      ; F6C7   0360
        BNEQ    L_F6C4                          ; F6C8   022C 0005

        PSHR    R0                              ; F6CA   0270
        MVI@    R3,     R0                      ; F6CB   0298
        DECR    R0                              ; F6CC   0010
        MVO@    R0,     R3                      ; F6CD   0258
        MOVR    R5,     R3                      ; F6CE   00AB
        MOVR    R4,     R5                      ; F6CF   00A5
        DECR    R5                              ; F6D0   0015
L_F6D1:
        DECR    R3                              ; F6D1   0013
        BMI     L_F6D8                          ; F6D2   020B 0004

        MVI@    R4,     R0                      ; F6D4   02A0
        MVO@    R0,     R5                      ; F6D5   0268
        B       L_F6D1                          ; F6D6   0220 0006

L_F6D8:
        PULR    R0                              ; F6D8   02B0
L_F6D9:
        PULR    R3                              ; F6D9   02B3
        PULR    R7                              ; F6DA   02B7

        MVI@    R5,     R4                      ; F6DB   02AC
        PSHR    R5                              ; F6DC   0275
        MVI@    R4,     R5                      ; F6DD   02A5
L_F6DE:
        DECR    R5                              ; F6DE   0015
        BMI     L_F6E4                          ; F6DF   020B 0003

        CMP@    R4,     R0                      ; F6E1   0360
        BNEQ    L_F6DE                          ; F6E2   022C 0005
L_F6E4:
        PULR    R7                              ; F6E4   02B7

        DECLE   $0003,  $0154,  $0007,  $0156   ; F6E5   0003 0154 0007 0156
        DECLE   $0003,  $0158,  $0005,  $015A   ; F6E9   0003 0158 0005 015A
        DECLE   $0003,  $015C,  $0005,  $015E   ; F6ED   0003 015C 0005 015E
        DECLE   $0003,  $0168,  $000F,  $016A   ; F6F1   0003 0168 000F 016A
        DECLE   $0005,  $0180,  $0015,  $0182   ; F6F5   0005 0180 0015 0182
        DECLE   $0005,  $0184,  $011C,  $00CC   ; F6F9   0005 0184 011C 00CC
        DECLE   $0007,  $0186,  $0168,  $0009   ; F6FD   0007 0186 0168 0009
        DECLE   $016A,  $0003,  $0184,  $0009   ; F701   016A 0003 0184 0009
        DECLE   $0186,  $0168,  $0009,  $016A   ; F705   0186 0168 0009 016A
        DECLE   $0003,  $0184,  $0005,  $0186   ; F709   0003 0184 0005 0186
        DECLE   $0168,  $0009,  $016A,  $0003   ; F70D   0168 0009 016A 0003
        DECLE   $0184,  $0005,  $0186,  $0003   ; F711   0184 0005 0186 0003
        DECLE   $0168,  $0007,  $016A,  $0003   ; F715   0168 0007 016A 0003
        DECLE   $0184,  $0007,  $0186,  $0168   ; F719   0184 0007 0186 0168
        DECLE   $0007,  $016A,  $0003,  $0184   ; F71D   0007 016A 0003 0184
        DECLE   $0007,  $0186,  $0168,  $0005   ; F721   0007 0186 0168 0005
        DECLE   $016A,  $0003,  $0184,  $0007   ; F725   016A 0003 0184 0007
        DECLE   $0186,  $0003,  $0168,  $011E   ; F729   0186 0003 0168 011E
        DECLE   $0005,  $016A,  $0184,  $0005   ; F72D   0005 016A 0184 0005
        DECLE   $00CE,  $0003,  $0186,  $0003   ; F731   00CE 0003 0186 0003
        DECLE   $0168,  $0003,  $016A,  $0184   ; F735   0168 0003 016A 0184
        DECLE   $0009,  $0186,  $0003,  $0168   ; F739   0009 0186 0003 0168
        DECLE   $0005,  $016A,  $0184,  $0007   ; F73D   0005 016A 0184 0007
        DECLE   $0186,  $0168,  $0120,  $00D4   ; F741   0186 0168 0120 00D4
        DECLE   $0005,  $016A,  $0003,  $0184   ; F745   0005 016A 0003 0184
        DECLE   $0007,  $0186,  $0003,  $0168   ; F749   0007 0186 0003 0168
        DECLE   $0003,  $0184,  $016A,  $000B   ; F74D   0003 0184 016A 000B
        DECLE   $0186,  $0003,  $0168,  $0122   ; F751   0186 0003 0168 0122
        DECLE   $0005,  $016A,  $0184,  $000B   ; F755   0005 016A 0184 000B
        DECLE   $0186,  $0003,  $0168,  $0009   ; F759   0186 0003 0168 0009
        DECLE   $00D6,  $000B,  $016A,  $0005   ; F75D   00D6 000B 016A 0005
        DECLE   $0184,  $0144,  $00DC,  $0011   ; F761   0184 0144 00DC 0011
        DECLE   $0186,  $0005,  $0146,  $0003   ; F765   0186 0005 0146 0003
        DECLE   $0168,  $0011,  $016A,  $0005   ; F769   0168 0011 016A 0005
        DECLE   $016C,  $012C,  $000B,  $00DE   ; F76D   016C 012C 000B 00DE
        DECLE   $0005,  $016E,  $0005,  $018C   ; F771   0005 016E 0005 018C
        DECLE   $012E,  $0005,  $018E,  $0180   ; F775   012E 0005 018E 0180
        DECLE   $0140,  $00E0,  $000D,  $0182   ; F779   0140 00E0 000D 0182
        DECLE   $0005                           ; F77D   0005

        ANDR    R0,     R0                      ; F77E   0180
        SETC                                    ; F77F   0007
        ANDR    R0,     R2                      ; F780   0182
        DIS                                     ; F781   0003
        ANDR    R1,     R4                      ; F782   018C
        SETC                                    ; F783   0007
        ANDR    R1,     R6                      ; F784   018E
        DIS                                     ; F785   0003
        ANDR    R0,     R0                      ; F786   0180
        INCR    R1                              ; F787   0009
        ANDR    R0,     R2                      ; F788   0182
        ANDR    R1,     R4                      ; F789   018C
        INCR    R1                              ; F78A   0009
L_F78B:
        ANDR    R1,     R6                      ; F78B   018E
        DECLE   $0003,  $0180,  $0005,  $0182   ; F78C   0003 0180 0005 0182
        DECLE   $0003,  $018C,  $0005,  $018E   ; F790   0003 018C 0005 018E
        DECLE   $0180,  $0009,  $0182,  $0003   ; F794   0180 0009 0182 0003
        DECLE   $018C,  $0007,  $018E,  $0003   ; F798   018C 0007 018E 0003
        DECLE   $0180,  $0005,  $0182,  $0003   ; F79C   0180 0005 0182 0003
        DECLE   $018C,  $0005,  $018E,  $0003   ; F7A0   018C 0005 018E 0003
        DECLE   $0180,  $0005,  $0182,  $0003   ; F7A4   0180 0005 0182 0003
        DECLE   $018C,  $0009,  $018E,  $0003   ; F7A8   018C 0009 018E 0003
        DECLE   $0180,  $0003,  $0182,  $018C   ; F7AC   0180 0003 0182 018C
        DECLE   $0009,  $018E,  $0180,  $0003   ; F7B0   0009 018E 0180 0003
        DECLE   $018C,  $0003,  $0182,  $0007   ; F7B4   018C 0003 0182 0007
        DECLE   $018E,  $0003,  $0180,  $0005   ; F7B8   018E 0003 0180 0005
        DECLE   $0182,  $018C,  $000B,  $018E   ; F7BC   0182 018C 000B 018E
        DECLE   $0003,  $0180,  $0007,  $0182   ; F7C0   0003 0180 0007 0182
        DECLE   $0003,  $018C,  $000D,  $018E   ; F7C4   0003 018C 000D 018E
        DECLE   $0005,  $0180,  $000B,  $0142   ; F7C8   0005 0180 000B 0142
        DECLE   $0009,  $0182,  $0005,  $01C0   ; F7CC   0009 0182 0005 01C0
        DECLE   $0003,  $00E2,  $0011,  $01C2   ; F7D0   0003 00E2 0011 01C2
        DECLE   $0005,  $0180,  $0011,  $0182   ; F7D4   0005 0180 0011 0182
        DECLE   $0003,  $0198,  $000B,  $0118   ; F7D8   0003 0198 000B 0118
        DECLE   $00C8,  $000D,  $019A,  $0005   ; F7DC   00C8 000D 019A 0005
        DECLE   $019C,  $011A,  $00CA,  $0005   ; F7E0   019C 011A 00CA 0005
        DECLE   $011C,  $00CC,  $0005,  $019E   ; F7E4   011C 00CC 0005 019E
        DECLE   $0003,  $01A8,  $0005,  $019C   ; F7E8   0003 01A8 0005 019C
        DECLE   $01AA,  $0007,  $019E,  $01A8   ; F7EC   01AA 0007 019E 01A8
        DECLE   $0007,  $01AA,  $019C,  $0009   ; F7F0   0007 01AA 019C 0009
        DECLE   $011E,  $0003,  $019E,  $0005   ; F7F4   011E 0003 019E 0005
        DECLE   $018C,  $0009,  $010C,  $0009   ; F7F8   018C 0009 010C 0009
        DECLE   $00CE,  $0007,  $010E,  $0003   ; F7FC   00CE 0007 010E 0003
        DECLE   $018E,  $0007,  $01C0,  $0120   ; F800   018E 0007 01C0 0120
        DECLE   $00E8,  $000F,  $0122,  $0005   ; F804   00E8 000F 0122 0005
        DECLE   $01C2,  $0005,  $0198,  $000D   ; F808   01C2 0005 0198 000D
        DECLE   $00EA,  $0005,  $019A,  $0007   ; F80C   00EA 0005 019A 0007
        DECLE   $019C,  $0118,  $0011,  $019E   ; F810   019C 0118 0011 019E
        DECLE   $011A,  $0005,  $01A8,  $011C   ; F814   011A 0005 01A8 011C
        DECLE   $00CC,  $0013,  $01AA,  $011E   ; F818   00CC 0013 01AA 011E
        DECLE   $0005,  $019C,  $000D,  $019E   ; F81C   0005 019C 000D 019E
        DECLE   $0003,  $018C,  $0009,  $010C   ; F820   0003 018C 0009 010C
        DECLE   $0009,  $00CE,  $0007,  $010E   ; F824   0009 00CE 0007 010E
        DECLE   $0003,  $018E,  $0005,  $018C   ; F828   0003 018E 0005 018C
        DECLE   $0003,  $0120,  $00E8,  $0007   ; F82C   0003 0120 00E8 0007
        DECLE   $018E,  $0003,  $0184,  $0009   ; F830   018E 0003 0184 0009
        DECLE   $0122,  $0186,  $0003,  $0180   ; F834   0122 0186 0003 0180
        DECLE   $0009,  $0182,  $0003,  $0168   ; F838   0009 0182 0003 0168
        DECLE   $0007,  $00EA,  $0003,  $016A   ; F83C   0007 00EA 0003 016A
        DECLE   $0003,  $0160,  $0007,  $0118   ; F840   0003 0160 0007 0118
        DECLE   $0003,  $0162,  $0158,  $000D   ; F844   0003 0162 0158 000D
        DECLE   $015A,  $0003,  $015C,  $011A   ; F848   015A 0003 015C 011A
        DECLE   $0005,  $011C,  $00CC,  $001B   ; F84C   0005 011C 00CC 001B
        DECLE   $015E,  $0009,  $011E,  $0168   ; F850   015E 0009 011E 0168
        DECLE   $000B,  $010C,  $000B,  $00CE   ; F854   000B 010C 000B 00CE
        DECLE   $0003,  $016A,  $0003,  $010E   ; F858   0003 016A 0003 010E
        DECLE   $0005,  $0180,  $0005,  $0120   ; F85C   0005 0180 0005 0120
        DECLE   $00E8,  $000D,  $0182,  $0005   ; F860   00E8 000D 0182 0005
        DECLE   $0168,  $0005,  $0122,  $000D   ; F864   0168 0005 0122 000D
        DECLE   $016A,  $0003,  $00EA,  $0003   ; F868   016A 0003 00EA 0003
        DECLE   $0180,  $0009,  $0118,  $000D   ; F86C   0180 0009 0118 000D
        DECLE   $0182,  $0005,  $0184,  $011A   ; F870   0182 0005 0184 011A
        DECLE   $0007,  $011C,  $00CC,  $001B   ; F874   0007 011C 00CC 001B
        DECLE   $011E,  $0011,  $010C,  $0007   ; F878   011E 0011 010C 0007
        DECLE   $0186,  $0005,  $00CE,  $0005   ; F87C   0186 0005 00CE 0005
        DECLE   $010E,  $0007,  $0184,  $0003   ; F880   010E 0007 0184 0003
        DECLE   $0120,  $00E8,  $0007,  $0186   ; F884   0120 00E8 0007 0186
        DECLE   $0003,  $0168,  $0009,  $016A   ; F888   0003 0168 0009 016A
        DECLE   $0003,  $0122,  $015C,  $0009   ; F88C   0003 0122 015C 0009
        DECLE   $015E,  $0005,  $0150,  $0009   ; F890   015E 0005 0150 0009
        DECLE   $0152,  $0144,  $0009,  $0146   ; F894   0152 0144 0009 0146
        DECLE   $0003,  $0128,  $0005,  $00EA   ; F898   0003 0128 0005 00EA
        DECLE   $0005,  $012A,  $0005,  $012C   ; F89C   0005 012A 0005 012C
        DECLE   $0007,  $0140,  $00E0,  $012E   ; F8A0   0007 0140 00E0 012E
        DECLE   $0003,  $0140,  $001D,  $0142   ; F8A4   0003 0140 001D 0142
        DECLE   $0142,  $0007,  $014C,  $0007   ; F8A8   0142 0007 014C 0007
        DECLE   $0120,  $000B,  $00E2,  $0005   ; F8AC   0120 000B 00E2 0005
        DECLE   $0122,  $014E,  $0005,  $0154   ; F8B0   0122 014E 0005 0154
        DECLE   $0005,  $0144,  $0114,  $0013   ; F8B4   0005 0144 0114 0013
        DECLE   $0146,  $000B,  $0156,  $0007   ; F8B8   0146 000B 0156 0007
        DECLE   $0116,  $0003,  $014C,  $0009   ; F8BC   0116 0003 014C 0009
        DECLE   $012C,  $010C,  $000D,  $014E   ; F8C0   012C 010C 000D 014E
        DECLE   $012E,  $0005,  $0158,  $010E   ; F8C4   012E 0005 0158 010E
        DECLE   $0007,  $0140,  $00E0,  $000B   ; F8C8   0007 0140 00E0 000B
        DECLE   $015A,  $0005,  $014C,  $0013   ; F8CC   015A 0005 014C 0013
        DECLE   $0142,  $014E,  $0005,  $0154   ; F8D0   0142 014E 0005 0154
        DECLE   $0007,  $0120,  $000B,  $00E2   ; F8D4   0007 0120 000B 00E2
        DECLE   $0005,  $0122,  $0009,  $0144   ; F8D8   0005 0122 0009 0144
        DECLE   $0114,  $0009,  $0156,  $000B   ; F8DC   0114 0009 0156 000B
        DECLE   $014C,  $0146,  $000F,  $014E   ; F8E0   014C 0146 000F 014E
        DECLE   $0005,  $0116,  $0140,  $0009   ; F8E4   0005 0116 0140 0009
        DECLE   $012C,  $010C,  $000B,  $0142   ; F8E8   012C 010C 000B 0142
        DECLE   $0003,  $012E,  $0003,  $014C   ; F8EC   0003 012E 0003 014C
        DECLE   $0005,  $010E,  $0005,  $0140   ; F8F0   0005 010E 0005 0140
        DECLE   $00E0,  $0005,  $014E,  $0005   ; F8F4   00E0 0005 014E 0005
        DECLE   $0154,  $0007,  $0156,  $0003   ; F8F8   0154 0007 0156 0003
        DECLE   $014C,  $0009,  $014E,  $0003   ; F8FC   014C 0009 014E 0003
        DECLE   $0154,  $0003,  $0156,  $0003   ; F900   0154 0003 0156 0003
        DECLE   $014C,  $0003,  $0142,  $0005   ; F904   014C 0003 0142 0005
        DECLE   $014E,  $0003,  $0154,  $0005   ; F908   014E 0003 0154 0005
        DECLE   $0156,  $0120,  $0003,  $014C   ; F90C   0156 0120 0003 014C
        DECLE   $0009,  $00E2,  $0003,  $014E   ; F910   0009 00E2 0003 014E
        DECLE   $0003,  $0140,  $0122,  $0009   ; F914   0003 0140 0122 0009
        DECLE   $0144,  $0114,  $0013,  $0146   ; F918   0144 0114 0013 0146
        DECLE   $0007,  $0142,  $0009,  $014C   ; F91C   0007 0142 0009 014C
        DECLE   $0005,  $0116,  $0009,  $012C   ; F920   0005 0116 0009 012C
        DECLE   $010C,  $000D,  $012E,  $0007   ; F924   010C 000D 012E 0007
        DECLE   $010E,  $0005                   ; F928   010E 0005

        CMPR    R0,     R0                      ; F92A   0140
        ADDR    R4,     R0                      ; F92B   00E0
        COMR    R3                              ; F92C   001B
        CMPR    R0,     R2                      ; F92D   0142
        DIS                                     ; F92E   0003
        CMPR    R1,     R6                      ; F92F   014E
        INCR    R7                              ; F930   000F

        CMPR    R3,     R0                      ; F931   0158
L_F932:
        SUBR    R4,     R0                      ; F932   0120
        DECLE   $000B,  $015A,  $00E2,  $0003   ; F933   000B 015A 00E2 0003
        DECLE   $015C,  $0003,  $0122,  $0007   ; F937   015C 0003 0122 0007
        DECLE   $015E,  $0003,  $0160,  $0144   ; F93B   015E 0003 0160 0144
        DECLE   $0114,  $0013,  $0162,  $0005   ; F93F   0114 0013 0162 0005
        DECLE   $0158,  $0003,  $0146,  $000D   ; F943   0158 0003 0146 000D
        DECLE   $0116,  $0003,  $015A,  $0005   ; F947   0116 0003 015A 0005
        DECLE   $014C,  $0003,  $012C,  $010C   ; F94B   014C 0003 012C 010C
        DECLE   $0009,  $012E,  $000B,  $010E   ; F94F   0009 012E 000B 010E
        DECLE   $014E,  $0005,  $011C,  $00CC   ; F953   014E 0005 011C 00CC
        DECLE   $0003,  $0158,  $0007,  $015A   ; F957   0003 0158 0007 015A
        DECLE   $0003,  $015C,  $0015,  $011E   ; F95B   0003 015C 0015 011E
        DECLE   $0009,  $015E,  $0007,  $010C   ; F95F   0009 015E 0007 010C
        DECLE   $0168,  $0009,  $00CE,  $0009   ; F963   0168 0009 00CE 0009
        DECLE   $010E,  $0005,  $016A,  $0120   ; F967   010E 0005 016A 0120
        DECLE   $00E8,  $0007,  $0180,  $000D   ; F96B   00E8 0007 0180 000D
        DECLE   $0122,  $0013,  $0182,  $00EA   ; F96F   0122 0013 0182 00EA
        DECLE   $0007,  $0168,  $0003,  $0118   ; F973   0007 0168 0003 0118
        DECLE   $0013,  $016A,  $011A,  $0005   ; F977   0013 016A 011A 0005
        DECLE   $0184,  $011C,  $00CC,  $001B   ; F97B   0184 011C 00CC 001B
        DECLE   $011E,  $0009,  $0186,  $000B   ; F97F   011E 0009 0186 000B
        DECLE   $0180,  $010C,  $0009,  $00CE   ; F983   0180 010C 0009 00CE
        DECLE   $0005,  $010E,  $0005,  $0182   ; F987   0005 010E 0005 0182
        DECLE   $0005,  $0168,  $0120,  $00E8   ; F98B   0005 0168 0120 00E8
        DECLE   $000F,  $0122,  $0005,  $016A   ; F98F   000F 0122 0005 016A
        DECLE   $0005                           ; F993   0005

        ANDR    R0,     R0                      ; F994   0180
        INCR    R3                              ; F995   000B
        ANDR    R0,     R2                      ; F996   0182
        DIS                                     ; F997   0003
        CMPR    R5,     R0                      ; F998   0168
        DIS                                     ; F999   0003
        ADDR    R5,     R2                      ; F99A   00EA
        SETC                                    ; F99B   0007
        CMPR    R5,     R2                      ; F99C   016A
        DIS                                     ; F99D   0003
        CMPR    R3,     R4                      ; F99E   015C
        SUBR    R3,     R0                      ; F99F   0118
        DECR    R1                              ; F9A0   0011
        CMPR    R3,     R6                      ; F9A1   015E
L_F9A2:
        DIS                                     ; F9A2   0003
        DECLE   $011A,  $0003,  $014C,  $0003   ; F9A3   011A 0003 014C 0003
        DECLE   $011C,  $00CC,  $001B,  $011E   ; F9A7   011C 00CC 001B 011E
        DECLE   $0013,  $010C,  $0009,  $014E   ; F9AB   0013 010C 0009 014E
        DECLE   $00CE,  $0005,  $010E,  $0009   ; F9AF   00CE 0005 010E 0009
        DECLE   $0128,  $0120,  $00E8,  $000B   ; F9B3   0128 0120 00E8 000B
        DECLE   $012A,  $0003,  $012C,  $0005   ; F9B7   012A 0003 012C 0005
        DECLE   $012E,  $0003,  $0140,  $0003   ; F9BB   012E 0003 0140 0003
        DECLE   $0122,  $0003,  $0142,  $0003   ; F9BF   0122 0003 0142 0003
        DECLE   $014C,  $000D,  $00EA,  $0003   ; F9C3   014C 000D 00EA 0003
        DECLE   $014E,  $0005,  $011C,  $0003   ; F9C7   014E 0005 011C 0003
        DECLE   $0118,  $0013,  $011A,  $0005   ; F9CB   0118 0013 011A 0005
        DECLE   $011C,  $00CC,  $001F           ; F9CF   011C 00CC 001F

        SUBR    R3,     R6                      ; F9D2   011E
        INCR    R7                              ; F9D3   000F

        SUBR    R1,     R4                      ; F9D4   010C
L_F9D5:
        INCR    R1                              ; F9D5   0009
        DECLE   $00CE,  $0005,  $010E,  $0009   ; F9D6   00CE 0005 010E 0009
        DECLE   $011E,  $0003,  $0120,  $00E8   ; F9DA   011E 0003 0120 00E8
        DECLE   $000D,  $0122,  $0009,  $0140   ; F9DE   000D 0122 0009 0140
        DECLE   $0011,  $0142,  $0005,  $0144   ; F9E2   0011 0142 0005 0144
        DECLE   $000D,  $00EA,  $0009,  $0146   ; F9E6   000D 00EA 0009 0146
        DECLE   $0005,  $0148,  $0148,  $00E8   ; F9EA   0005 0148 0148 00E8
        DECLE   $000F,  $014A,  $0005,  $0168   ; F9EE   000F 014A 0005 0168
        DECLE   $014A,  $0011,  $016A,  $00EA   ; F9F2   014A 0011 016A 00EA
        DECLE   $0005,  $0148,  $0007,  $0148   ; F9F6   0005 0148 0007 0148
        DECLE   $00E8,  $000B,  $014A,  $0005   ; F9FA   00E8 000B 014A 0005
        DECLE   $014A,  $0164,  $0003,  $00EA   ; F9FE   014A 0164 0003 00EA
        DECLE   $0007,  $014C,  $0100,  $000B   ; FA02   0007 014C 0100 000B
        DECLE   $0166,  $0005,  $0148,  $0007   ; FA06   0166 0005 0148 0007
        DECLE   $014E,  $000D,  $014A,  $0003   ; FA0A   014E 000D 014A 0003
        DECLE   $0102,  $0005,  $0160,  $0005   ; FA0E   0102 0005 0160 0005
        DECLE   $0150,  $0104,  $0013,  $0152   ; FA12   0150 0104 0013 0152
        DECLE   $0106,  $0005                   ; FA16   0106 0005

        CMPR    R2,     R4                      ; FA18   0154
        SUBR    R1,     R0                      ; FA19   0108
        DECR    R5                              ; FA1A   0015
        CMPR    R2,     R6                      ; FA1B   0156
        INCR    R7                              ; FA1C   000F

        SUBR    R1,     R2                      ; FA1D   010A
L_FA1E:
        INCR    R3                              ; FA1E   000B
        DECLE   $0154,  $0108,  $0009,  $0156   ; FA1F   0154 0108 0009 0156
        DECLE   $000B,  $010A,  $0005,  $0148   ; FA23   000B 010A 0005 0148
        DECLE   $0100,  $0162,  $0011,  $014A   ; FA27   0100 0162 0011 014A
        DECLE   $0007,  $0128,  $000D,  $0102   ; FA2B   0007 0128 000D 0102
        DECLE   $0005,  $012A,  $0005,  $0128   ; FA2F   0005 012A 0005 0128
        DECLE   $0144,  $00EC,  $0005,  $012A   ; FA33   0144 00EC 0005 012A
        DECLE   $0003,  $012C,  $0005,  $0146   ; FA37   0003 012C 0005 0146
        DECLE   $0009,  $00EE,  $012E,  $0005   ; FA3B   0009 00EE 012E 0005
        DECLE   $0140,  $0140,  $00E0,  $0013   ; FA3F   0140 0140 00E0 0013
        DECLE   $0142,  $0142,  $0005           ; FA43   0142 0142 0005

        CMPR    R4,     R0                      ; FA46   0160
        INCR    R7                              ; FA47   000F

        ADDR    R4,     R2                      ; FA48   00E2
L_FA49:
        DIS                                     ; FA49   0003
        DECLE   $0162,  $0005                   ; FA4A   0162 0005

        CMPR    R0,     R0                      ; FA4C   0140
        DIS                                     ; FA4D   0003
        CMPR    R0,     R0                      ; FA4E   0140
        ADDR    R4,     R0                      ; FA4F   00E0
        DECR    R1                              ; FA50   0011
        CMPR    R0,     R2                      ; FA51   0142
        CMPR    R0,     R2                      ; FA52   0142
        DIS                                     ; FA53   0003
        ADDR    R4,     R2                      ; FA54   00E2
        DIS                                     ; FA55   0003
        CMPR    R3,     R4                      ; FA56   015C
        DIS                                     ; FA57   0003
        CMPR    R0,     R4                      ; FA58   0144
        ADDR    R5,     R0                      ; FA59   00E8
        DECR    R1                              ; FA5A   0011
        CMPR    R3,     R6                      ; FA5B   015E
        DIS                                     ; FA5C   0003
        CMPR    R0,     R6                      ; FA5D   0146
        DIS                                     ; FA5E   0003
        CMPR    R0,     R0                      ; FA5F   0140
        INCR    R7                              ; FA60   000F

        ADDR    R5,     R2                      ; FA61   00EA
L_FA62:
        DIS                                     ; FA62   0003
        DECLE   $0142,  $0005                   ; FA63   0142 0005

        CMPR    R3,     R0                      ; FA65   0158
        DIS                                     ; FA66   0003
        CMPR    R1,     R0                      ; FA67   0148
        ADDR    R5,     R4                      ; FA68   00EC
        INCR    R7                              ; FA69   000F

        CMPR    R1,     R2                      ; FA6A   014A
L_FA6B:
        DIS                                     ; FA6B   0003
        DECLE   $015A,  $0003,  $00EE,  $0005   ; FA6C   015A 0003 00EE 0005
        DECLE   $0158,  $014C,  $0100,  $0015   ; FA70   0158 014C 0100 0015
        DECLE   $015A,  $0007,  $0154,  $0003   ; FA74   015A 0007 0154 0003
        DECLE   $014E,  $0003,  $0156,  $0003   ; FA78   014E 0003 0156 0003
        DECLE   $014C,  $0005,  $0102,  $0003   ; FA7C   014C 0005 0102 0003
        DECLE   $014E,  $0003,  $0140,  $0005   ; FA80   014E 0003 0140 0005

        CMPR    R0,     R0                      ; FA84   0140
        ADDR    R4,     R0                      ; FA85   00E0
        INCR    R7                              ; FA86   000F

        CMPR    R0,     R2                      ; FA87   0142
L_FA88:
        SETC                                    ; FA88   0007
        SUBR    R5,     R4                      ; FA89   012C
        INCR    R7                              ; FA8A   000F

        SUBR    R5,     R6                      ; FA8B   012E
L_FA8C:
        DIS                                     ; FA8C   0003
        DECLE   $0142,  $0003,  $0128,  $0013   ; FA8D   0142 0003 0128 0013
        DECLE   $012A,  $0005,  $0120,  $000B   ; FA91   012A 0005 0120 000B
        DECLE   $00E2,  $0009,  $0122,  $0005   ; FA95   00E2 0009 0122 0005
        DECLE   $011C,  $014C,  $0005,  $011E   ; FA99   011C 014C 0005 011E
        DECLE   $00CC,  $0021,  $014E,  $0005   ; FA9D   00CC 0021 014E 0005
        DECLE   $00CE,  $0007,  $011C,  $014C   ; FAA1   00CE 0007 011C 014C
        DECLE   $0003,  $00CC,  $0013,  $014E   ; FAA5   0003 00CC 0013 014E
        DECLE   $011E,  $0005,  $00DC,  $0144   ; FAA9   011E 0005 00DC 0144
        DECLE   $014C,  $0019,  $00DE,  $0007   ; FAAD   014C 0019 00DE 0007
        DECLE   $00CE,  $0003,  $014E,  $0146   ; FAB1   00CE 0003 014E 0146
        DECLE   $0009,  $014C,  $0005,  $0144   ; FAB5   0009 014C 0005 0144
        DECLE   $014E,  $00DC,  $0011,  $0146   ; FAB9   014E 00DC 0011 0146
        DECLE   $00DE,  $0005,  $014C,  $0140   ; FABD   00DE 0005 014C 0140
        DECLE   $00E0,  $0023,  $0142,  $014E   ; FAC1   00E0 0023 0142 014E
        DECLE   $0003,  $00E2,  $0007,  $0140   ; FAC5   0003 00E2 0007 0140
        DECLE   $0003,  $014C,  $00E0,  $0142   ; FAC9   0003 014C 00E0 0142
        DECLE   $0013,  $014E,  $00E2,  $0005   ; FACD   0013 014E 00E2 0005
        DECLE   $012C,  $014C,  $00E4,  $0023   ; FAD1   012C 014C 00E4 0023
        DECLE   $014E,  $012E,  $00E6,  $000B   ; FAD5   014E 012E 00E6 000B
        DECLE   $012C,  $014C,  $00E4,  $0011   ; FAD9   012C 014C 00E4 0011
        DECLE   $014E,  $012E,  $00E6,  $0005   ; FADD   014E 012E 00E6 0005
        DECLE   $014C,  $0128,  $00E8,  $0013   ; FAE1   014C 0128 00E8 0013
        DECLE   $012A,  $014E,  $00EA,  $0005   ; FAE5   012A 014E 00EA 0005
        DECLE   $0114,  $00E0,  $000B,  $0116   ; FAE9   0114 00E0 000B 0116
        DECLE   $0003,  $0118,  $0007,  $011A   ; FAED   0003 0118 0007 011A
        DECLE   $00E2,  $0003,  $011C,  $0003   ; FAF1   00E2 0003 011C 0003
        DECLE   $00E4,  $000D,  $011E,  $0005   ; FAF5   00E4 000D 011E 0005
        DECLE   $0128,  $0003,  $00E6,  $0005   ; FAF9   0128 0003 00E6 0005
        DECLE   $00E8,  $0023,  $012A,  $00EA   ; FAFD   00E8 0023 012A 00EA
        DECLE   $000B,  $00E8,  $00A8,  $0011   ; FB01   000B 00E8 00A8 0011
        DECLE   $00EA,  $0007,  $00E8,  $0011   ; FB05   00EA 0007 00E8 0011
        DECLE   $00EA,  $0005,  $00E8,  $0013   ; FB09   00EA 0005 00E8 0013
        DECLE   $00EA,  $0005,  $00E8,  $0013   ; FB0D   00EA 0005 00E8 0013
        DECLE   $00EA,  $0005,  $00E8,  $0013   ; FB11   00EA 0005 00E8 0013
        DECLE   $00EA,  $0005,  $00E8,  $000D   ; FB15   00EA 0005 00E8 000D
        DECLE   $00AA,  $0003,  $00EA,  $0005   ; FB19   00AA 0003 00EA 0005
        DECLE   $00E8,  $001B,  $011C,  $00CC   ; FB1D   00E8 001B 011C 00CC
        DECLE   $0003,  $00EA,  $0007,  $014C   ; FB21   0003 00EA 0007 014C
        DECLE   $0009,  $014E,  $0005,  $015C   ; FB25   0009 014E 0005 015C
        DECLE   $0005,  $015E,  $0003,  $014C   ; FB29   0005 015E 0003 014C
        DECLE   $0007,  $014E,  $0003,  $015C   ; FB2D   0007 014E 0003 015C
        DECLE   $0007,  $015E,  $014C,  $0007   ; FB31   0007 015E 014C 0007
        DECLE   $014E,  $015C,  $0007,  $015E   ; FB35   014E 015C 0007 015E
        DECLE   $014C,  $0005,  $014E,  $0003   ; FB39   014C 0005 014E 0003
        DECLE   $015C,  $0005,  $015E,  $0003   ; FB3D   015C 0005 015E 0003
        DECLE   $014C,  $0005,  $014E,  $0003   ; FB41   014C 0005 014E 0003
        DECLE   $015C,  $0007,  $015E,  $0003   ; FB45   015C 0007 015E 0003
        DECLE   $014C,  $0003,  $014E,  $0003   ; FB49   014C 0003 014E 0003
        DECLE   $015C,  $0007,  $015E,  $0003   ; FB4D   015C 0007 015E 0003
        DECLE   $014C,  $0005,  $014E,  $015C   ; FB51   014C 0005 014E 015C
        DECLE   $011E,  $0009,  $015E,  $0003   ; FB55   011E 0009 015E 0003
        DECLE   $014C,  $00CE,  $0003,  $015C   ; FB59   014C 00CE 0003 015C
        DECLE   $014E,  $0005,  $015E,  $0003   ; FB5D   014E 0005 015E 0003
        DECLE   $014C,  $0005,  $014E,  $0003   ; FB61   014C 0005 014E 0003
        DECLE   $015C,  $0005,  $015E,  $0003   ; FB65   015C 0005 015E 0003
        DECLE   $014C,  $0005,  $014E,  $0003   ; FB69   014C 0005 014E 0003
        DECLE   $015C,  $0120,  $00D4,  $0007   ; FB6D   015C 0120 00D4 0007
        DECLE   $015E,  $014C,  $0005,  $014E   ; FB71   015E 014C 0005 014E
        DECLE   $015C,  $0007,  $015E,  $0003   ; FB75   015C 0007 015E 0003
        DECLE   $014C,  $0003,  $015C,  $0003   ; FB79   014C 0003 015C 0003
        DECLE   $014E,  $0007,  $015E,  $0122   ; FB7D   014E 0007 015E 0122
        DECLE   $0003,  $014C,  $0003,  $014E   ; FB81   0003 014C 0003 014E
        DECLE   $0003,  $015C,  $0005,  $015E   ; FB85   0003 015C 0005 015E
        DECLE   $0003,  $014C,  $0003,  $015C   ; FB89   0003 014C 0003 015C
        DECLE   $014E,  $0009,  $015E,  $0003   ; FB8D   014E 0009 015E 0003
        DECLE   $00D6,  $014C,  $0003,  $015C   ; FB91   00D6 014C 0003 015C
        DECLE   $014E,  $0009,  $015E,  $014C   ; FB95   014E 0009 015E 014C
        DECLE   $0003,  $0144,  $00DC,  $0003   ; FB99   0003 0144 00DC 0003
        DECLE   $015C,  $014E,  $0009,  $015E   ; FB9D   015C 014E 0009 015E
        DECLE   $0003,  $014C,  $0003,  $015C   ; FBA1   0003 014C 0003 015C
        DECLE   $014E,  $0007,  $0146,  $015E   ; FBA5   014E 0007 0146 015E
        DECLE   $0003,  $015C,  $0003,  $014C   ; FBA9   0003 015C 0003 014C
        DECLE   $0003,  $015E,  $0007,  $014E   ; FBAD   0003 015E 0007 014E
        DECLE   $0003,  $014C,  $000B,  $012C   ; FBB1   0003 014C 000B 012C
        DECLE   $0003,  $014E,  $0005,  $015C   ; FBB5   0003 014E 0005 015C
        DECLE   $0003,  $00DE,  $0005,  $012E   ; FBB9   0003 00DE 0005 012E
        DECLE   $0007,  $015E,  $0005,  $0140   ; FBBD   0007 015E 0005 0140
        DECLE   $00E0,  $0158,  $0009,  $015A   ; FBC1   00E0 0158 0009 015A
        DECLE   $0003,  $014C,  $0009,  $014E   ; FBC5   0003 014C 0009 014E
        DECLE   $0003,  $0158,  $0007,  $015A   ; FBC9   0003 0158 0007 015A
        DECLE   $0003,  $014C,  $0007,  $014E   ; FBCD   0003 014C 0007 014E
        DECLE   $0158,  $0007,  $015A,  $0003   ; FBD1   0158 0007 015A 0003
        DECLE   $014C,  $0005,  $014E,  $0003   ; FBD5   014C 0005 014E 0003
        DECLE   $0158,  $0005,  $0142,  $00E2   ; FBD9   0158 0005 0142 00E2
        DECLE   $0003,  $015A,  $0003,  $014C   ; FBDD   0003 015A 0003 014C
        DECLE   $0005,  $014E,  $0158,  $0005   ; FBE1   0005 014E 0158 0005
        DECLE   $014C,  $0118,  $0005,  $015A   ; FBE5   014C 0118 0005 015A
        DECLE   $0003,  $014C,  $0005,  $014E   ; FBE9   0003 014C 0005 014E
        DECLE   $0003,  $0158,  $0007,  $015A   ; FBED   0003 0158 0007 015A
        DECLE   $0003,  $014C,  $0005,  $014E   ; FBF1   0003 014C 0005 014E
        DECLE   $0003,  $0158,  $0007,  $015A   ; FBF5   0003 0158 0007 015A
        DECLE   $014C,  $0007,  $014E,  $0003   ; FBF9   014C 0007 014E 0003
        DECLE   $0158,  $0007,  $015A,  $014C   ; FBFD   0158 0007 015A 014C
        DECLE   $0007,  $014E,  $0158,  $014E   ; FC01   0007 014E 0158 014E
        DECLE   $011A,  $0007,  $015A,  $014C   ; FC05   011A 0007 015A 014C
        DECLE   $0009,  $0148,  $0114,  $0003   ; FC09   0009 0148 0114 0003
        DECLE   $014E,  $0003,  $014C,  $0003   ; FC0D   014E 0003 014C 0003
        DECLE   $0158,  $0003,  $014E,  $0007   ; FC11   0158 0003 014E 0007
        DECLE   $015A,  $0003,  $014C,  $0009   ; FC15   015A 0003 014C 0009
        DECLE   $014E,  $0003,  $0158,  $000B   ; FC19   014E 0003 0158 000B
        DECLE   $015A,  $0005,  $014C,  $0158   ; FC1D   015A 0005 014C 0158
        DECLE   $000B,  $015A,  $014E,  $0003   ; FC21   000B 015A 014E 0003
        DECLE   $014C,  $014A,  $0116,  $0007   ; FC25   014C 014A 0116 0007
        DECLE   $014E,  $0003,  $0158,  $0005   ; FC29   014E 0003 0158 0005
        DECLE   $0144,  $0110,  $000B,  $015A   ; FC2D   0144 0110 000B 015A
        DECLE   $0005,  $014C,  $0007,  $014E   ; FC31   0005 014C 0007 014E
        DECLE   $0003,  $0158,  $0009,  $015A   ; FC35   0003 0158 0009 015A
        DECLE   $0146,  $0005,  $014C,  $0003   ; FC39   0146 0005 014C 0003
        DECLE   $0112,  $0007,  $014E,  $0003   ; FC3D   0112 0007 014E 0003
        DECLE   $0158,  $00C8,  $0009,  $015A   ; FC41   0158 00C8 0009 015A
        DECLE   $0003,  $014C,  $0009,  $00CA   ; FC45   0003 014C 0009 00CA
        DECLE   $0003,  $014E,  $0003,  $015C   ; FC49   0003 014E 0003 015C
        DECLE   $011C,  $00CC,  $001F,  $011E   ; FC4D   011C 00CC 001F 011E
        DECLE   $0005,  $015E,  $0009,  $014C   ; FC51   0005 015E 0009 014C
        DECLE   $010C,  $000B,  $00CE,  $0009   ; FC55   010C 000B 00CE 0009
        DECLE   $010E,  $0003,  $014E,  $0003   ; FC59   010E 0003 014E 0003
        DECLE   $0120,  $00E8,  $0005,  $0168   ; FC5D   0120 00E8 0005 0168
        DECLE   $000D,  $0122,  $0005,  $016A   ; FC61   000D 0122 0005 016A
        DECLE   $0005,  $0180,  $000D,  $00EA   ; FC65   0005 0180 000D 00EA
        DECLE   $0007,  $0182,  $0003,  $0118   ; FC69   0007 0182 0003 0118
        DECLE   $0003,  $0184,  $0011,  $011A   ; FC6D   0003 0184 0011 011A
        DECLE   $0003,  $0186,  $0003,  $011C   ; FC71   0003 0186 0003 011C
        DECLE   $00CC,  $0005                   ; FC75   00CC 0005

        ANDR    R1,     R4                      ; FC77   018C
        INCR    R7                              ; FC78   000F

        SUBR    R3,     R6                      ; FC79   011E
L_FC7A:
        ANDR    R1,     R6                      ; FC7A   018E
        DECLE   $0005,  $0180,  $0015,  $0182   ; FC7B   0005 0180 0015 0182
        DECLE   $0003,  $010C,  $0003,  $0184   ; FC7F   0003 010C 0003 0184
        DECLE   $0007,  $00CE,  $0009,  $010E   ; FC83   0007 00CE 0009 010E
        DECLE   $0003,  $0186,  $0003,  $0120   ; FC87   0003 0186 0003 0120
        DECLE   $00E8,  $0003,  $0180,  $0007   ; FC8B   00E8 0003 0180 0007
        DECLE   $0182,  $0003,  $0184,  $0007   ; FC8F   0182 0003 0184 0007
        DECLE   $0186,  $0003,  $0180,  $0122   ; FC93   0186 0003 0180 0122
        DECLE   $0009,  $0182,  $0168,  $000B   ; FC97   0009 0182 0168 000B
        DECLE   $00EA,  $0009,  $016A,  $0118   ; FC9B   00EA 0009 016A 0118
        DECLE   $0005                           ; FC9F   0005

        CMPR    R3,     R4                      ; FCA0   015C
        INCR    R7                              ; FCA1   000F

        SUBR    R3,     R2                      ; FCA2   011A
L_FCA3:
        DIS                                     ; FCA3   0003
        DECLE   $015E,  $0003,  $011C,  $00CC   ; FCA4   015E 0003 011C 00CC
        DECLE   $0003,  $0168,  $0011,  $016A   ; FCA8   0003 0168 0011 016A
        DECLE   $0005,  $015C,  $0009,  $015E   ; FCAC   0005 015C 0009 015E
        DECLE   $0003,  $0168,  $011E,  $000B   ; FCB0   0003 0168 011E 000B
        DECLE   $016A,  $0003,  $010C,  $0003   ; FCB4   016A 0003 010C 0003
        DECLE   $014C,  $0007,  $00CE,  $0009   ; FCB8   014C 0007 00CE 0009
        DECLE   $010E,  $0005,  $014E,  $0120   ; FCBC   010E 0005 014E 0120
        DECLE   $00E8,  $0005,  $0144,  $0013   ; FCC0   00E8 0005 0144 0013
        DECLE   $0122,  $0146,  $0005,  $014C   ; FCC4   0122 0146 0005 014C
        DECLE   $000B,  $00EA,  $0009,  $014E   ; FCC8   000B 00EA 0009 014E
        DECLE   $0118,  $0005,  $0144,  $000F   ; FCCC   0118 0005 0144 000F
        DECLE   $011A,  $0005,  $011C,  $00CC   ; FCD0   011A 0005 011C 00CC
        DECLE   $001B,  $011E,  $0013,  $010C   ; FCD4   001B 011E 0013 010C
        DECLE   $0009,  $00CE,  $0146,  $0009   ; FCD8   0009 00CE 0146 0009
        DECLE   $010E,  $0007,  $0120,  $00E8   ; FCDC   010E 0007 0120 00E8
        DECLE   $0005,  $0144,  $000D,  $0122   ; FCE0   0005 0144 000D 0122
        DECLE   $0003,  $0146,  $0003,  $0128   ; FCE4   0003 0146 0003 0128
        DECLE   $0015,  $012A,  $0005,  $012C   ; FCE8   0015 012A 0005 012C
        DECLE   $0009,  $00EA,  $000B,  $012E   ; FCEC   0009 00EA 000B 012E
        DECLE   $0003,  $0140,  $00E0,  $0003   ; FCF0   0003 0140 00E0 0003
        DECLE   $0140,  $000F,  $0142,  $0005   ; FCF4   0140 000F 0142 0005
        DECLE   $014C,  $000B,  $014E,  $0142   ; FCF8   014C 000B 014E 0142
        DECLE   $0003,  $0158,  $000D,  $015A   ; FCFC   0003 0158 000D 015A
        DECLE   $0120,  $0003,  $0168,  $0007   ; FD00   0120 0003 0168 0007
        DECLE   $00E2,  $0003,  $016A,  $0003   ; FD04   00E2 0003 016A 0003
        DECLE   $0180,  $0122,  $0009,  $0182   ; FD08   0180 0122 0009 0182
        DECLE   $0003,  $0144,  $0114,  $018C   ; FD0C   0003 0144 0114 018C
        DECLE   $0009,  $018E,  $0003,  $0198   ; FD10   0009 018E 0003 0198
        DECLE   $0007,  $0146,  $0009,  $019A   ; FD14   0007 0146 0009 019A
        DECLE   $0003,  $01A0,  $0009,  $0116   ; FD18   0003 01A0 0009 0116
        DECLE   $0005,  $01A2,  $0003,  $01A4   ; FD1C   0005 01A2 0003 01A4
        DECLE   $0003,  $012C,  $010C,  $000B   ; FD20   0003 012C 010C 000B
        DECLE   $01A6,  $0005,  $01A0,  $012E   ; FD24   01A6 0005 01A0 012E
        DECLE   $0005,  $010E,  $0005,  $0140   ; FD28   0005 010E 0005 0140
        DECLE   $00E0,  $0003,  $01A2,  $0003   ; FD2C   00E0 0003 01A2 0003
        DECLE   $0198,  $000D,  $019A,  $0003   ; FD30   0198 000D 019A 0003
        DECLE   $018C,  $0009,  $018E,  $0003   ; FD34   018C 0009 018E 0003
        DECLE   $01A0,  $0005,  $0142,  $0007   ; FD38   01A0 0005 0142 0007
        DECLE   $01A2,  $0003,  $01A4,  $0005   ; FD3C   01A2 0003 01A4 0005
        DECLE   $0120,  $0005,  $01A6,  $0003   ; FD40   0120 0005 01A6 0003
        DECLE   $01A0,  $0003,  $00E2,  $0005   ; FD44   01A0 0003 00E2 0005
        DECLE   $01A2,  $0003,  $0198,  $0003   ; FD48   01A2 0003 0198 0003
        DECLE   $0122,  $0007,  $0144,  $0114   ; FD4C   0122 0007 0144 0114
        DECLE   $019A,  $0003,  $018C,  $0007   ; FD50   019A 0003 018C 0007
        DECLE   $018E,  $0003,  $01A4,  $0007   ; FD54   018E 0003 01A4 0007
        DECLE   $01A6,  $0146,  $0003,  $01A0   ; FD58   01A6 0146 0003 01A0
        DECLE   $0007,  $01A2,  $0003,  $0198   ; FD5C   0007 01A2 0003 0198
        DECLE   $0007,  $019A,  $018C,  $0003   ; FD60   0007 019A 018C 0003
        DECLE   $0116,  $0007,  $018E,  $0003   ; FD64   0116 0007 018E 0003
        DECLE   $012C,  $010C,  $0003,  $01A4   ; FD68   012C 010C 0003 01A4
        DECLE   $0003,  $01A6,  $0003,  $01A0   ; FD6C   0003 01A6 0003 01A0
        DECLE   $0009,  $012E,  $01A2,  $0003   ; FD70   0009 012E 01A2 0003
        DECLE   $0198,  $0003,  $010E,  $0005   ; FD74   0198 0003 010E 0005
        DECLE   $0140,  $00E0,  $0003,  $019A   ; FD78   0140 00E0 0003 019A
        DECLE   $0003,  $018C,  $0007,  $018E   ; FD7C   0003 018C 0007 018E
        DECLE   $0003,  $01A4,  $0005,  $01A6   ; FD80   0003 01A4 0005 01A6
        DECLE   $01A0,  $0009,  $01A2,  $0198   ; FD84   01A0 0009 01A2 0198
        DECLE   $0007,  $019A,  $018C,  $0003   ; FD88   0007 019A 018C 0003
        DECLE   $0142,  $0007,  $018E,  $0003   ; FD8C   0142 0007 018E 0003
        DECLE   $01A4,  $0005,  $0120,  $0003   ; FD90   01A4 0005 0120 0003
        DECLE   $01A6,  $0003,  $01A0,  $0005   ; FD94   01A6 0003 01A0 0005
        DECLE   $01A2,  $0198,  $00E2,  $0007   ; FD98   01A2 0198 00E2 0007
        DECLE   $019A,  $0003,  $018C,  $0003   ; FD9C   019A 0003 018C 0003
        DECLE   $0122,  $0005,  $0144,  $0114   ; FDA0   0122 0005 0144 0114
        DECLE   $0003,  $018E,  $0003,  $01A4   ; FDA4   0003 018E 0003 01A4
        DECLE   $0007,  $01A6,  $0003,  $01A0   ; FDA8   0007 01A6 0003 01A0
        DECLE   $0005,  $0146,  $0003,  $01A2   ; FDAC   0005 0146 0003 01A2
        DECLE   $0003,  $0198,  $0007,  $019A   ; FDB0   0003 0198 0007 019A
        DECLE   $018C,  $0009,  $0116,  $0003   ; FDB4   018C 0009 0116 0003
        DECLE   $018E,  $0003,  $01A4,  $0005   ; FDB8   018E 0003 01A4 0005
        DECLE   $012C,  $010C,  $0003,  $01A6   ; FDBC   012C 010C 0003 01A6
        DECLE   $0003,  $01A0,  $0005,  $01A2   ; FDC0   0003 01A0 0005 01A2
        DECLE   $0003,  $0198,  $0005,  $012E   ; FDC4   0003 0198 0005 012E
        DECLE   $0003,  $019A,  $0003,  $018C   ; FDC8   0003 019A 0003 018C
        DECLE   $010E,  $0005,  $0140,  $00E0   ; FDCC   010E 0005 0140 00E0
        DECLE   $0003,  $018E,  $0003,  $01A4   ; FDD0   0003 018E 0003 01A4
        DECLE   $0007,  $01A6,  $0003,  $01A0   ; FDD4   0007 01A6 0003 01A0
        DECLE   $0007,  $01A2,  $0003,  $0198   ; FDD8   0007 01A2 0003 0198
        DECLE   $0007,  $019A,  $018C,  $0009   ; FDDC   0007 019A 018C 0009
        DECLE   $018E,  $0142,  $01A4,  $0007   ; FDE0   018E 0142 01A4 0007
        DECLE   $01A6,  $0003,  $01A0,  $0003   ; FDE4   01A6 0003 01A0 0003
        DECLE   $0120,  $0005,  $01A2,  $0003   ; FDE8   0120 0005 01A2 0003
        DECLE   $0198,  $0003,  $00E2,  $0005   ; FDEC   0198 0003 00E2 0005
        DECLE   $0122,  $019A,  $0003,  $018C   ; FDF0   0122 019A 0003 018C
        DECLE   $0007,  $018E,  $0003,  $0144   ; FDF4   0007 018E 0003 0144
        DECLE   $0114,  $01A4,  $0007,  $01A6   ; FDF8   0114 01A4 0007 01A6
        DECLE   $0003,  $01A0,  $0007,  $01A2   ; FDFC   0003 01A0 0007 01A2
        DECLE   $0003,  $0198,  $0009,  $0146   ; FE00   0003 0198 0009 0146
        DECLE   $0003,  $019A,  $0003,  $018C   ; FE04   0003 019A 0003 018C
        DECLE   $0007,  $0116,  $0009,  $012C   ; FE08   0007 0116 0009 012C
        DECLE   $010C,  $0005,  $018E,  $0005   ; FE0C   010C 0005 018E 0005
        DECLE   $0198,  $0003,  $012E,  $0009   ; FE10   0198 0003 012E 0009
        DECLE   $019A,  $010E,  $0003,  $019C   ; FE14   019A 010E 0003 019C
        DECLE   $0003,  $011C,  $00CC,  $0019   ; FE18   0003 011C 00CC 0019
        DECLE   $019E,  $0007,  $01A8,  $011E   ; FE1C   019E 0007 01A8 011E
        DECLE   $000D,  $01AA,  $0003,  $010C   ; FE20   000D 01AA 0003 010C
        DECLE   $0003,  $019C,  $0007,  $00CE   ; FE24   0003 019C 0007 00CE
        DECLE   $0009,  $010E,  $0003,  $019E   ; FE28   0009 010E 0003 019E
        DECLE   $0005,  $01A8,  $0120,  $00E8   ; FE2C   0005 01A8 0120 00E8
        DECLE   $0011,  $0122,  $0011,  $01AA   ; FE30   0011 0122 0011 01AA
        DECLE   $0003,  $00EA,  $0007,  $01A8   ; FE34   0003 00EA 0007 01A8
        DECLE   $0005                           ; FE38   0005

        SUBR    R3,     R0                      ; FE39   0118
        INCR    R7                              ; FE3A   000F

        ANDR    R5,     R2                      ; FE3B   01AA
L_FE3C:
        DIS                                     ; FE3C   0003
        DECLE   $011A,  $0003,  $019C,  $0003   ; FE3D   011A 0003 019C 0003
        DECLE   $011C,  $00CC,  $001F,  $019E   ; FE41   011C 00CC 001F 019E
        DECLE   $0007,  $00CE,  $011E,  $0003   ; FE45   0007 00CE 011E 0003
        DECLE   $018C,  $0007,  $010C,  $0013   ; FE49   018C 0007 010C 0013
        DECLE   $010E,  $018E,  $0005,  $0120   ; FE4D   010E 018E 0005 0120
        DECLE   $00E8,  $0003,  $0184,  $000D   ; FE51   00E8 0003 0184 000D
        DECLE   $0122,  $0015,  $0186,  $00EA   ; FE55   0122 0015 0186 00EA
        DECLE   $0009,  $018C,  $0003,  $0118   ; FE59   0009 018C 0003 0118
        DECLE   $0011,  $018E,  $011A,  $0005   ; FE5D   0011 018E 011A 0005
        DECLE   $0154,  $011C,  $00CC,  $0009   ; FE61   0154 011C 00CC 0009
        DECLE   $0156,  $0003,  $0158,  $0007   ; FE65   0156 0003 0158 0007
        DECLE   $015A,  $0003,  $015C,  $0011   ; FE69   015A 0003 015C 0011
        DECLE   $011E,  $0005,  $015E,  $0007   ; FE6D   011E 0005 015E 0007
        DECLE   $018C,  $010C,  $000F,  $010E   ; FE71   018C 010C 000F 010E
        DECLE   $0005,  $018E,  $0005,  $0188   ; FE75   0005 018E 0005 0188
        DECLE   $0158,  $0120,  $0013,  $0122   ; FE79   0158 0120 0013 0122
        DECLE   $0005,  $00CE,  $000D,  $015A   ; FE7D   0005 00CE 000D 015A
        DECLE   $018A,  $000B,  $0154,  $0184   ; FE81   018A 000B 0154 0184
        DECLE   $0118,  $0011,  $011A,  $0005   ; FE85   0118 0011 011A 0005
        DECLE   $011C,  $0025,  $011E,  $0003   ; FE89   011C 0025 011E 0003
        DECLE   $0186,  $0005,  $0156,  $0003   ; FE8D   0186 0005 0156 0003
        DECLE   $010C,  $0013,  $010E,  $0005   ; FE91   010C 0013 010E 0005

        SUBR    R4,     R0                      ; FE95   0120
        ADDR    R5,     R0                      ; FE96   00E8
        INCR    R7                              ; FE97   000F

        SUBR    R4,     R2                      ; FE98   0122
L_FE99:
        DECR    R5                              ; FE99   0015
        DECLE   $00EA,  $000B,  $0118,  $0011   ; FE9A   00EA 000B 0118 0011
        DECLE   $011A,  $0007,  $0148,  $00E8   ; FE9E   011A 0007 0148 00E8
        DECLE   $0005,  $0188,  $000D,  $014A   ; FEA2   0005 0188 000D 014A
        DECLE   $0007,  $018A,  $0005,  $0194   ; FEA6   0007 018A 0005 0194
        DECLE   $0009,  $00EA,  $0009,  $0196   ; FEAA   0009 00EA 0009 0196
        DECLE   $0148,  $00E8,  $0005,  $019C   ; FEAE   0148 00E8 0005 019C
        DECLE   $000B,  $014A,  $0005,  $00EA   ; FEB2   000B 014A 0005 00EA
        DECLE   $0003,  $019E,  $0003,  $014C   ; FEB6   0003 019E 0003 014C
        DECLE   $0100,  $0005                   ; FEBA   0100 0005

        ANDR    R4,     R0                      ; FEBC   01A0
        INCR    R7                              ; FEBD   000F

        ANDR    R4,     R2                      ; FEBE   01A2
L_FEBF:
        DIS                                     ; FEBF   0003
        DECLE   $014E,  $0003,  $019C,  $000D   ; FEC0   014E 0003 019C 000D
        DECLE   $0102,  $0005,  $019E,  $0005   ; FEC4   0102 0005 019E 0005
        DECLE   $0194,  $0003,  $0150,  $0104   ; FEC8   0194 0003 0150 0104
        DECLE   $0011,  $0152,  $0106,  $0003   ; FECC   0011 0152 0106 0003
        DECLE   $0196,  $0005,  $0154,  $0108   ; FED0   0196 0005 0154 0108
        DECLE   $01AC,  $0013,  $01AE,  $0003   ; FED4   01AC 0013 01AE 0003
        DECLE   $0156,  $0003,  $01A8,  $000D   ; FED8   0156 0003 01A8 000D
        DECLE   $010A,  $0005,  $01AA,  $0005   ; FEDC   010A 0005 01AA 0005
        DECLE   $01A0,  $0148,  $00E8,  $0013   ; FEE0   01A0 0148 00E8 0013
        DECLE   $01A2,  $0007,  $01A0,  $0007   ; FEE4   01A2 0007 01A0 0007
        DECLE   $01A2,  $0003,  $01A8,  $000B   ; FEE8   01A2 0003 01A8 000B
        DECLE   $01AA,  $014A,  $0003,  $01A0   ; FEEC   01AA 014A 0003 01A0
        DECLE   $0009,  $01A2,  $0003,  $0194   ; FEF0   0009 01A2 0003 0194
        DECLE   $000B,  $0196,  $0003,  $018C   ; FEF4   000B 0196 0003 018C
        DECLE   $0005                           ; FEF8   0005

        ADDR    R5,     R2                      ; FEF9   00EA
        INCR    R5                              ; FEFA   000D
        ANDR    R1,     R6                      ; FEFB   018E
        SETC                                    ; FEFC   0007
        ANDR    R0,     R0                      ; FEFD   0180
        CMPR    R0,     R0                      ; FEFE   0140
        ADDR    R4,     R0                      ; FEFF   00E0
        DECR    R1                              ; FF00   0011
        ANDR    R0,     R2                      ; FF01   0182
        DIS                                     ; FF02   0003
        CMPR    R0,     R2                      ; FF03   0142
        DIS                                     ; FF04   0003
        ANDR    R1,     R4                      ; FF05   018C
        INCR    R7                              ; FF06   000F

        ADDR    R4,     R2                      ; FF07   00E2
L_FF08:
        DIS                                     ; FF08   0003
        DECLE   $018E,  $0005,  $0198,  $0003   ; FF09   018E 0005 0198 0003
        DECLE   $0140,  $00E0,  $0011,  $0142   ; FF0D   0140 00E0 0011 0142
        DECLE   $0003,  $019A,  $00E2,  $0005   ; FF11   0003 019A 00E2 0005
        DECLE   $01A8,  $0144,  $00E8,  $0011   ; FF15   01A8 0144 00E8 0011
        DECLE   $01AA,  $0005                   ; FF19   01AA 0005

        ANDR    R3,     R0                      ; FF1B   0198
        CMPR    R0,     R6                      ; FF1C   0146
        INCR    R7                              ; FF1D   000F

        ANDR    R3,     R2                      ; FF1E   019A
L_FF1F:
        DIS                                     ; FF1F   0003
        DECLE   $00EA,  $0003,  $018C,  $0007   ; FF20   00EA 0003 018C 0007
        DECLE   $0148,  $00EC,  $000D,  $018E   ; FF24   0148 00EC 000D 018E
        DECLE   $0003,  $014A,  $0003,  $0180   ; FF28   0003 014A 0003 0180
        DECLE   $0003,  $00EE,  $0005,  $014C   ; FF2C   0003 00EE 0005 014C
        DECLE   $0100,  $000D,  $0182,  $0005   ; FF30   0100 000D 0182 0005
        DECLE   $016C,  $000D,  $014E,  $0007   ; FF34   016C 000D 014E 0007
        DECLE   $016E,  $0102,  $0005,  $0168   ; FF38   016E 0102 0005 0168
        DECLE   $0005,  $0140,  $00E0,  $000F   ; FF3C   0005 0140 00E0 000F
        DECLE   $016A,  $0005,  $0160,  $0015   ; FF40   016A 0005 0160 0015
        DECLE   $0142,  $000D,  $0162,  $0009   ; FF44   0142 000D 0162 0009
        DECLE   $0158,  $000D,  $00E2,  $0005   ; FF48   0158 000D 00E2 0005
        DECLE   $015A,  $0005,  $015C,  $000B   ; FF4C   015A 0005 015C 000B
        DECLE   $00CC,  $001F,  $015E,  $0005   ; FF50   00CC 001F 015E 0005
        DECLE   $00CE,  $0007,  $014C,  $0003   ; FF54   00CE 0007 014C 0003
        DECLE   $00CC,  $0011,  $014E,  $0005   ; FF58   00CC 0011 014E 0005

        CMPR    R3,     R0                      ; FF5C   0158
        DIS                                     ; FF5D   0003
        ADDR    R3,     R4                      ; FF5E   00DC
        DIS                                     ; FF5F   0003
        CMPR    R3,     R2                      ; FF60   015A
        DIS                                     ; FF61   0003
        CMPR    R3,     R4                      ; FF62   015C
L_FF63:
        DECR    R7                              ; FF63   0017

        DECLE   $00DE,  $0005,  $00CE,  $0005   ; FF64   00DE 0005 00CE 0005
        DECLE   $015E,  $0007,  $0168,  $0005   ; FF68   015E 0007 0168 0005
        DECLE   $00DC,  $0013,  $00DE,  $016A   ; FF6C   00DC 0013 00DE 016A
        DECLE   $0005,  $00E0,  $0003,  $0160   ; FF70   0005 00E0 0003 0160
        DECLE   $001F,  $0162,  $0003,  $00E2   ; FF74   001F 0162 0003 00E2
        DECLE   $0007,  $0160,  $0005,  $00E0   ; FF78   0007 0160 0005 00E0
        DECLE   $0011,  $0162,  $00E2,  $0005   ; FF7C   0011 0162 00E2 0005
        DECLE   $016C,  $00E4,  $0007,  $016E   ; FF80   016C 00E4 0007 016E
        DECLE   $0003,  $0180,  $001D,  $00E6   ; FF84   0003 0180 001D 00E6
        DECLE   $0182,  $0009,  $018C,  $00E4   ; FF88   0182 0009 018C 00E4
        DECLE   $0013,  $00E6,  $0003,  $018E   ; FF8C   0013 00E6 0003 018E
        DECLE   $0003,  $00E8,  $0005,  $014C   ; FF90   0003 00E8 0005 014C
        DECLE   $000F,  $00EA,  $0005,  $00E0   ; FF94   000F 00EA 0005 00E0
        DECLE   $000D,  $014E,  $0005,  $00E2   ; FF98   000D 014E 0005 00E2
        DECLE   $0005,  $014C,  $0003,  $00E4   ; FF9C   0005 014C 0003 00E4
        DECLE   $0011,  $014E,  $00E6,  $0005   ; FFA0   0011 014E 00E6 0005
        DECLE   $0158,  $00E8,  $000B,  $015A   ; FFA4   0158 00E8 000B 015A
        DECLE   $0003,  $015C,  $0019,  $00EA   ; FFA8   0003 015C 0019 00EA
        DECLE   $015E,  $0007,  $0128,  $0003   ; FFAC   015E 0007 0128 0003
        DECLE   $0168,  $00A8,  $012A,  $0005   ; FFB0   0168 00A8 012A 0005
        DECLE   $00AA,  $0005,  $016A,  $0005   ; FFB4   00AA 0005 016A 0005
        DECLE   $0128,  $000B,  $012A,  $0003   ; FFB8   0128 000B 012A 0003
        DECLE   $0168,  $0007,  $016A,  $0128   ; FFBC   0168 0007 016A 0128
        DECLE   $0007,  $012A,  $0003,  $0168   ; FFC0   0007 012A 0003 0168
        DECLE   $0009,  $016A,  $0003,  $0128   ; FFC4   0009 016A 0003 0128
        DECLE   $0007,  $012A,  $0168,  $0007   ; FFC8   0007 012A 0168 0007
        DECLE   $016A,  $0128,  $0009,  $012A   ; FFCC   016A 0128 0009 012A
        DECLE   $0003,  $0168,  $0005,  $016A   ; FFD0   0003 0168 0005 016A
        DECLE   $0003,  $0128,  $0005,  $012A   ; FFD4   0003 0128 0005 012A
        DECLE   $0003,  $0168,  $0005,  $016A   ; FFD8   0003 0168 0005 016A
        DECLE   $0128,  $000B,  $012A,  $0003   ; FFDC   0128 000B 012A 0003
        DECLE   $0168,  $0005,  $016A,  $0003   ; FFE0   0168 0005 016A 0003
        DECLE   $0128,  $0009,  $012A,  $0003   ; FFE4   0128 0009 012A 0003
        DECLE   $0128,  $0005                   ; FFE8   0128 0005

        SUBR    R5,     R2                      ; FFEA   012A
        CMPR    R5,     R0                      ; FFEB   0168
        INCR    R3                              ; FFEC   000B
        CMPR    R5,     R2                      ; FFED   016A
        DIS                                     ; FFEE   0003
        SUBR    R5,     R0                      ; FFEF   0128
        DIS                                     ; FFF0   0003
        SUBR    R5,     R2                      ; FFF1   012A
        DECR    R1                              ; FFF2   0011
        DECLE   $03FF,  $0001,  $0000,  $0000   ; FFF3   03FF 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFB   0000 0000 0000 0000
        DECLE   $0000                           ; FFFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5010       <entry>
;;  $5014       $5017  
;;  $501D       $5020  
;;  $5040       $514F  
;;  $506E       $506B  
;;  $5073       $506F  
;;  $507B       $5075  
;;  $5086       $5061  
;;  $509F       $5095  
;;  $50A3       $508D   $509D  
;;  $50B1       $50C3  
;;  $50BA       $50B4  
;;  $50C1       $50BB  
;;  $50C7       $50CE  
;;  $50D3       $5047   $50A6   $50AB   $50B8   $50BF   $50CA  
;;  $50E3       $50F9  
;;  $50F3       $50E5  
;;  $50FB       $50D7   $50DD  
;;  $5119       $50FE   $5108   $510E  
;;  $5129       $5125  
;;  $5132       $512F  
;;  $514A       $514D  
;;  $5168       $5162  
;;  $518F       $51C5  
;;  $51BD       $5191  
;;  $51C4       $51C0  
;;  $51C7       $51BB  
;;  $51CA       $51D0  
;;  $51D2       $515B   $5166   $51CC  
;;  $5206       $5201  
;;  $5209       $53D9   $53DF   $54CF   $54D4  
;;  $520A       $5049  
;;  $5214       $520F  
;;  $521A       $5290  
;;  $523F       $5237   $5275   $527B  
;;  $5251       $522D   $523D  
;;  $5262       $5228  
;;  $527D       $526B  
;;  $528C       $521F   $524F   $5260   $5266  
;;  $52C9       $52B5   $52BB   $5302   $5308   $5314  
;;  $52DB       $52AB   $52C1   $52C7  
;;  $52EF       $52A6  
;;  $5316       $52F8   $530E  
;;  $5328       $529D   $52D9   $52ED   $52F3  
;;  $5344       $533E  
;;  $5345       $525A   $5286   $52E7   $5322  
;;  $5355       $534B   $5350  
;;  $535B       $52E4   $531F  
;;  $538A       $5360   $5367   $536C   $5376   $537B  
;;  $538B       $504C  
;;  $538E       $53C9  
;;  $5393       $53C6  
;;  $53C8       $5395   $539B  
;;  $53CB       $5390  
;;  $53CC       $504F  
;;  $53D6       $53D1  
;;  $53DD       $544C  
;;  $53E3       $5449  
;;  $5423       $541D  
;;  $5448       $53FE   $5408   $540D   $5420   $5437   $543C   $5442  
;;  $544B       $53E5   $53E9   $53EE  
;;  $544E       $5052  
;;  $5480       $5478  
;;  $54A5       $54A2  
;;  $54C8       $54C5  
;;  $54CA       $5055  
;;  $54D7       $556A  
;;  $5500       $54FC  
;;  $5512       $5508   $550F  
;;  $5545       $5541  
;;  $554E       $5890  
;;  $5560       $58A2  
;;  $5567       $54DD   $5531   $5547   $5551  
;;  $5579       $5211  
;;  $557F       $55BD  
;;  $55A2       $558D  
;;  $55B9       $5584   $55A0   $55A6  
;;  $55C5       $5603  
;;  $55E8       $55D3  
;;  $55FF       $55CA   $55E6   $55EC  
;;  $5606       $525D   $5289   $52EA   $5325   $559D   $55B6   $55E3   $55FC  
;;  $5606       $6694  
;;  $5615       $560E  
;;  $5619       $559A   $55B3   $55E0   $55F9  
;;  $5629       $5621  
;;  $562B       $5623   $568A  
;;  $562C       $596E  
;;  $562E       $5631  
;;  $5633       $5975  
;;  $5640       $5636   $563A  
;;  $5641       $563E  
;;  $5642       $53D3  
;;  $5649       $5694  
;;  $564F       $5691  
;;  $5657       $5999  
;;  $5663       $59A5  
;;  $5683       $567D  
;;  $5690       $566A   $5681  
;;  $5693       $5651   $5655   $565A  
;;  $5696       $564B  
;;  $5697       $5645  
;;  $56B1       $5402   $566E  
;;  $56CF       $56BA   $56C0   $56C7  
;;  $56FF       $56EB  
;;  $5788       $588A  
;;  $5798       $574F  
;;  $579A       $56CD   $56E4  
;;  $579B       $5743   $574B  
;;  $57A5       $5758   $575E   $5769   $576F  
;;  $57A6       $58A8  
;;  $57B0       $56D6   $56DC  
;;  $57FC       $57FA  
;;  $57FD       $57FB  
;;  $57FE       $57FC  
;;  $57FF       $57FD  
;;  $5808       $5806  
;;  $5809       $5807  
;;  $580A       $5808  
;;  $580B       $5809  
;;  $580C       $587E  
;;  $5899       $597B  
;;  $58BD       $599F  
;;  $5938       $5936  
;;  $5939       $5937  
;;  $593A       $5938  
;;  $593B       $5939  
;;  $593C       $593A  
;;  $593D       $593B  
;;  $593E       $593C  
;;  $59CC       $59E6  
;;  $59DE       $59DA  
;;  $59E5       $5CC9   $62C3  
;;  $59EC       $62C9   $6472   $677B   $6CC2   $F0DD  
;;  $5A00       $5086   $677E  
;;  $5A06       $F0DA  
;;  $5A18       $5A0E  
;;  $5A1F       $5A1B  
;;  $5A2B       $5A34  
;;  $5A36       $5D80  
;;  $5A49       $6749  
;;  $5A55       $5A52  
;;  $5A67       $5A61  
;;  $5A79       $5A75  
;;  $5A7A       $5A65   $5A69   $5A73   $5A78   $5A9A  
;;  $5A86       $5A81  
;;  $5A88       $5A7B  
;;  $5A89       $5A7E   $5A84   $5A87  
;;  $5A9C       $5A94  
;;  $5AA1       $64EE  
;;  $5AA2       $5AA0   $6A2D  
;;  $5AE7       $5AD1  
;;  $5AED       $509F   $6453   $64F1   $674C  
;;  $5B07       $62C6   $662F   $685F   $6C80  
;;  $5B5C       $5B42   $5B46  
;;  $5B69       $5B60  
;;  $5B6E       $5B3B   $5BC0  
;;  $5B89       $5B82  
;;  $5B9B       $5B73   $5B77  
;;  $5BAD       $5BB4  
;;  $5BBE       $5A04  
;;  $5BBF       $6803  
;;  $5C26       $5BCD  
;;  $5C5B       $5BD1  
;;  $5C69       $5C66  
;;  $5C80       $59C6  
;;  $5C9B       $5C98  
;;  $5CC5       $DA75   $DAEE   $DB36   $DBB7   $DC1A   $DCEF   $DD57   $DDB1  
;;  $5CC5       $DE43   $DE9F   $DF2E   $F07D  
;;  $5CC6       $6333  
;;  $5CF6       $66FC  
;;  $5D16       $61E6   $66C5  
;;  $5D20       $5D27  
;;  $5D42       $5D12   $5D3F  
;;  $5D5A       $5C5E   $5CED   $5CFB   $F386  
;;  $5D5B       $5D6D  
;;  $5D5C       $5D6A  
;;  $5D5D       $5D66  
;;  $5D68       $5D60  
;;  $5D70       $5BF2   $5D2D   $6233   $6281   $62F4   $F347   $F4FA  
;;  $5D71       $5D84  
;;  $5D75       $5D88  
;;  $5D7B       $5D91  
;;  $5D93       $5D48   $5D9C   $5DF5  
;;  $5D9F       $5D17   $5E05   $61D9  
;;  $5DA0       $5D4D  
;;  $5DB3       $6236   $6284   $62FC   $66EB  
;;  $5DB5       $5DBE  
;;  $5DC7       $5DDB  
;;  $5DD6       $5DD3  
;;  $5DF3       $5DEB   $5DF0  
;;  $5E04       $5CF6   $62C0  
;;  $5E0B       $5E15  
;;  $5E17       $5E0D  
;;  $5E1E       $5B79   $D9C5   $DFD2   $F031  
;;  $5E2F       $5E27  
;;  $5E30       $5E2E  
;;  $5E42       $5E3B   $5E47  
;;  $5E49       $5E44  
;;  $5E4B       $5E40   $5E50  
;;  $5E52       $5E4D  
;;  $5E6F       $5E66  
;;  $5E76       $5E69   $5E70  
;;  $5E91       $5E99  
;;  $5EA0       $5D71   $5D75   $5D7B  
;;  $5EA4       $5EAC  
;;  $5EAF       $67BE  
;;  $5ECC       $5EC6  
;;  $5EE2       $5EC4   $5ECA   $5EDC  
;;  $5EE3       $6538  
;;  $5EE4       $5EE2  
;;  $5F20       $5352   $5626  
;;  $5F24       $5F48  
;;  $5F3E       $5F33  
;;  $5F41       $5F3C  
;;  $5F44       $542A   $568D  
;;  $5F4A       $5058  
;;  $5F60       $5F5C  
;;  $5F6B       $5F67  
;;  $5F7A       $5F76  
;;  $5F7F       $5F7C  
;;  $5F83       $5F80  
;;  $5F89       $5F85  
;;  $5FA4       $5FA1  
;;  $5FC2       $5FBF  
;;  $5FE2       $505B  
;;  $6003       $5FFF  
;;  $6047       $5FE7   $5FED  
;;  $6048       $5FA6   $5FC4   $6025   $603F  
;;  $604F       $604B  
;;  $6059       $6051   $6056  
;;  $608B       $6089  
;;  $609D       $5137  
;;  $60A8       $60A4  
;;  $60B2       $60AE  
;;  $60C9       $60B8   $60C1  
;;  $60E5       $60E0  
;;  $60F7       $60C7  
;;  $60FE       $60F7  
;;  $610B       $6103  
;;  $610C       $610A  
;;  $6139       $612D   $6131   $6135  
;;  $614C       $60FA  
;;  $6162       $6157  
;;  $6163       $6161  
;;  $6165       $6187  
;;  $616E       $6168  
;;  $617F       $616C  
;;  $618A       $60E2   $60E5   $6192  
;;  $618C       $6195  
;;  $6197       $619F  
;;  $6199       $61A2  
;;  $61A8       $503A   $60F4   $6178  
;;  $61D4       $66AB  
;;  $61D9       $636D  
;;  $6217       $6212  
;;  $6239       $6214   $6800  
;;  $623B       $624F  
;;  $6249       $6243  
;;  $624C       $6247  
;;  $6271       $626C  
;;  $6287       $6273   $62ED  
;;  $62CC       $62BE  
;;  $62E1       $6265  
;;  $6313       $62E4   $636F  
;;  $6371       $632F  
;;  $637B       $6375  
;;  $6381       $6379  
;;  $6395       $62CD  
;;  $639C       $638A   $638F  
;;  $63B1       $63AB  
;;  $6443       $63E8  
;;  $6457       $6451  
;;  $6470       $646C  
;;  $6475       $643B   $645B  
;;  $6480       $6417   $6421   $647B  
;;  $6482       $6882  
;;  $6489       $6486  
;;  $6490       $6494  
;;  $6496       $6491  
;;  $649C       $6445   $6498  
;;  $64CF       $64CF  
;;  $64D2       $64D0  
;;  $64D5       $64E5  
;;  $6526       $6515  
;;  $6588       $64EC   $64F5   $64FF   $6530   $653B  
;;  $658D       $62B6   $62D4   $630D   $6393   $639E   $63A3   $63AF   $648C  
;;  $65DE       $63B4   $64C6  
;;  $65E2       $65F1  
;;  $65E4       $65EB  
;;  $6697       $660B  
;;  $66B8       $66B5  
;;  $66BE       $66BA  
;;  $66C3       $66C0  
;;  $66C8       $6750   $6781   $67C1  
;;  $66DC       $66D9  
;;  $66E5       $66E2  
;;  $66E9       $66E6  
;;  $66FF       $669F  
;;  $6723       $6720  
;;  $6742       $673F  
;;  $6771       $6769   $676D  
;;  $6777       $6773  
;;  $6795       $678D  
;;  $679D       $6797  
;;  $67C3       $50D0  
;;  $67CD       $DA37  
;;  $67D3       $DA34   $DBEF   $DCD1   $DE2A   $DFD5   $F141   $F186   $F1D7  
;;  $67D3       $F21B  
;;  $6803       $67FE  
;;  $6810       $6C9F   $F14F   $F194   $F1E5   $F229  
;;  $6811       $DACF   $DC95   $DDE9   $DF83   $F0E0  
;;  $6833       $6828   $682E  
;;  $684F       $684B  
;;  $685C       $6858  
;;  $688C       $6A65   $DA2F   $DA3F   $DADC   $DB24   $DB93   $DC4F   $DCAB  
;;  $688C       $DD2C   $DD3F   $DE0B   $DE80   $DEF6   $DF86  
;;  $6897       $68B7   $68E0   $6A37   $6A60   $DA49   $DB29   $DB9D   $DC54  
;;  $6897       $DCB0   $DD31  
;;  $689B       $68A0  
;;  $68A4       $6A4C   $6A73   $6BEB   $DA4E   $DB98   $DE10   $DE85  
;;  $68B6       $DAD7  
;;  $68C3       $6893   $68A2   $68B4   $68F0   $6A43   $6A57   $6A70   $6A83  
;;  $68C3       $6BD1   $6BE6   $6BFC   $6C15   $6C23   $6C3D  
;;  $68C5       $6895   $689C   $68A9   $68B2   $68C1   $68D9   $68DE   $68EE  
;;  $68C5       $6979   $6A35   $6A41   $6A4A   $6A55   $6A5E   $6A6E   $6A81  
;;  $68C5       $6BD6   $6BE8   $6BF5   $6BFA   $6C13   $6C1C   $6C21   $6C36  
;;  $68C5       $6C3F  
;;  $68C7       $DA14   $DA44  
;;  $68E0       $68CE   $68D5  
;;  $68F2       $DAB4   $DAE1   $DB6C   $DC6A   $DD23   $DD44   $DDEC   $DED9  
;;  $68F2       $DEFB   $DFE1  
;;  $691A       $DB67   $DB77  
;;  $691E       $DC86  
;;  $6920       $691C   $F00E  
;;  $6927       $F056   $F0FF  
;;  $6928       $6926  
;;  $694B       $68D2   $DA55  
;;  $695E       $68DB  
;;  $697B       $DABB  
;;  $698B       $69BF  
;;  $69C1       $6982  
;;  $69C2       $DD4B   $DDF3   $DF02   $DFE8  
;;  $69C5       $69F1  
;;  $69F4       $681D   $6A2A  
;;  $6A10       $6A1B  
;;  $6A1F       $69FF   $6A18   $6A27  
;;  $6A29       $DBB4   $DCEC   $DD54   $DDAE  
;;  $6A30       $DBFF   $DCE1  
;;  $6A45       $DB8B  
;;  $6A59       $DCA3  
;;  $6A72       $DE03  
;;  $6A95       $DC09   $DC63   $DD38   $DE92   $DFEF  
;;  $6A9B       $6AA2  
;;  $6A9D       $DB90   $DCA8   $DE08   $DED6   $DF95  
;;  $6AA4       $DE25  
;;  $6AB5       $6ABC  
;;  $6ABE       $6AB8  
;;  $6AC8       $6AC2  
;;  $6B04       $6B37  
;;  $6B20       $6AF7  
;;  $6B3B       $6AEE  
;;  $6B56       $6B74  
;;  $6B5A       $6B54  
;;  $6B68       $6B44  
;;  $6B76       $6B4D  
;;  $6B82       $6B02   $6B10   $6B1E   $6B31   $6B39   $6B66  
;;  $6BA5       $6AF9   $6B20   $6B3B  
;;  $6BAC       $6AEB  
;;  $6BB3       $6BAA   $6BB1  
;;  $6BB9       $6BDF  
;;  $6BC1       $6BD4  
;;  $6BC7       $6BC4  
;;  $6BCF       $6BCC  
;;  $6BD3       $6BC9  
;;  $6BD8       $6AF4   $6B4A  
;;  $6BE1       $6B51  
;;  $6BEA       $DE32  
;;  $6BFE       $DF90  
;;  $6C25       $5B62   $6C30   $F006  
;;  $6C2F       $6BFF   $DF9B  
;;  $6C41       $6316  
;;  $6C48       $6381  
;;  $6C52       $DB21   $DD20   $DE7D  
;;  $6C9D       $6C99  
;;  $6CA3       $6C7D  
;;  $6CB9       $6CB3  
;;  $6CC6       $6C83  
;;  $6CDD       $6B90  
;;  $6CDE       $6CDC  
;;  $6CE8       $6CEB   $6CFD  
;;  $6CED       $6CF5  
;;  $6CF4       $6CF9  
;;  $6D01       $6D3D  
;;  $6D0E       $6D0A  
;;  $6D20       $6D1C  
;;  $6D30       $6D2A  
;;  $6D3A       $6D26   $6D34  
;;  $6D48       $6E29  
;;  $6DCC       $6CCB  
;;  $6DD9       $6DDE  
;;  $6DF5       $6DEF  
;;  $6E2B       $6D2D   $6D37   $6DF9   $6E01  
;;  $6E42       $5203  
;;  $6E56       $6E46  
;;  $6E7A       $6E7A  
;;  $6E9B       $6E9B  
;;  $6EBC       $6EBC  
;;  $6EDD       $6EDD  
;;  $6EFB       $5206   $5DAF  
;;  $6F0A       $6F3B   $6F56  
;;  $6F0C       $6F68  
;;  $6F1E       $6F23  
;;  $6F27       $6F1F  
;;  $6F2B       $6F16   $6F25  
;;  $6F2D       $6F32  
;;  $6F35       $6F29   $6F2E  
;;  $6F49       $6F4C  
;;  $6F58       $6F10  
;;  $6F6E       $6F5A  
;;  $6F70       $6F08  
;;  $6F74       $6F93  
;;  $6F81       $6F77  
;;  $6F89       $6F7F   $6F86  
;;  $6F90       $6F7B   $6F82  
;;  $6F95       $6F03  
;;  $6F96       $6EFF  
;;  $6FA0       $552B   $5610   $56F6   $6588   $66C8   $66F7   $F2EA  
;;  $6FA7       $6F9E  
;;  $6FB1       $680A   $6C56   $F34E  
;;  $6FBE       $6FC9  
;;  $6FD2       $6FA5  
;;  $D02F       $D02D  
;;  $D057       $D055  
;;  $D058       $D191  
;;  $D0A3       $D0A1  
;;  $D0EE       $D20D  
;;  $D0F3       $D0F1  
;;  $D118       $D016  
;;  $D127       $D025  
;;  $D129       $D127  
;;  $D12B       $D129  
;;  $D12D       $D021  
;;  $D131       $D02F  
;;  $D149       $D047  
;;  $D14F       $D145  
;;  $D167       $D065  
;;  $D17B       $D179  
;;  $D181       $D07F  
;;  $D1A2       $D096  
;;  $D1A9       $D09F  
;;  $D1D9       $D0D7  
;;  $D1EB       $D0E9  
;;  $D20B       $D109  
;;  $D233       $D231  
;;  $D23D       $D06F  
;;  $D24B       $D249  
;;  $D24F       $D143  
;;  $D267       $D162  
;;  $D278       $D076  
;;  $D297       $D195  
;;  $D2A7       $D29D  
;;  $D2AF       $D0AD   $D1AD  
;;  $D2B3       $D2B1  
;;  $D2B7       $D1B5   $D5E6  
;;  $D2B9       $D2A9  
;;  $D303       $D201  
;;  $D343       $D241  
;;  $D367       $D365  
;;  $D38B       $D189  
;;  $D3A1       $D267  
;;  $D3A7       $D2A3  
;;  $D3AB       $D2A5  
;;  $D3C2       $D049  
;;  $D3C9       $D0C7  
;;  $D3D2       $D059  
;;  $D3DE       $D2DD  
;;  $D3E3       $D1E1  
;;  $D3EB       $D1E9  
;;  $D3F3       $D1F1  
;;  $D3FD       $D2FB  
;;  $D410       $D30E  
;;  $D42B       $D229   $D429  
;;  $D42F       $D42D  
;;  $D433       $D131  
;;  $D434       $D431  
;;  $D453       $D151  
;;  $D465       $D582  
;;  $D47F       $D27D  
;;  $D4B3       $D4B1  
;;  $D4DB       $D4C2  
;;  $D4EF       $D4ED  
;;  $D501       $D3FF  
;;  $D503       $D401  
;;  $D519       $D417  
;;  $D51B       $D419  
;;  $D528       $D465  
;;  $D53B       $D239  
;;  $D557       $D76D  
;;  $D563       $D461  
;;  $D568       $D45F  
;;  $D573       $D571  
;;  $D57F       $D37D  
;;  $D595       $D592  
;;  $D5C3       $D2C1   $D5C1  
;;  $D60B       $D609  
;;  $D612       $D410  
;;  $D62D       $D52B  
;;  $D62F       $D32D  
;;  $D67C       $D67A  
;;  $D68B       $D689  
;;  $D699       $D797  
;;  $D6C9       $D489  
;;  $D6DC       $D4DB  
;;  $D707       $D345  
;;  $D726       $D425  
;;  $D731       $D62F  
;;  $D73B       $D439  
;;  $D73F       $D53D  
;;  $D76B       $D469  
;;  $D77F       $D77D  
;;  $D7A4       $D6A2  
;;  $D7DF       $D3DE  
;;  $D7E7       $D769  
;;  $D81A       $D812  
;;  $D82B       $D529  
;;  $D83B       $D539  
;;  $D853       $D4D1  
;;  $D85C       $D55A  
;;  $D867       $D729  
;;  $D86C       $D86C  
;;  $D873       $D873  
;;  $D88E       $D88E  
;;  $D895       $D895  
;;  $D89B       $D699  
;;  $D8A8       $D8A8  
;;  $D8B2       $D8C6   $D8CA  
;;  $D8B6       $D8B9  
;;  $D8C5       $D7C3  
;;  $D8D6       $D8DC  
;;  $D8D7       $D5C5  
;;  $D8E2       $D6DD  
;;  $D8FF       $D7FD  
;;  $D90A       $D904  
;;  $D914       $D908   $D90D   $D911  
;;  $D91B       $D918  
;;  $D921       $D91E  
;;  $D926       $D923  
;;  $D92B       $D927  
;;  $D92C       $D92A  
;;  $D930       $D938  
;;  $D93F       $D93D  
;;  $D944       $D94B  
;;  $D949       $D946  
;;  $D94B       $D749  
;;  $D953       $D969  
;;  $D959       $D956  
;;  $D961       $D95E  
;;  $D967       $D95B   $D963  
;;  $D978       $D775  
;;  $D992       $D978  
;;  $D9A3       $D9AA   $D9AD  
;;  $D9AF       $D9A5  
;;  $D9B7       $D6A5  
;;  $D9BB       $D6B9  
;;  $D9F2       $DA03  
;;  $DA17       $D815  
;;  $DA37       $DA17   $DA1C   $DA22   $DA2D   $DA32  
;;  $DA3A       $DA12  
;;  $DA64       $DA6D  
;;  $DA6B       $DA67  
;;  $DA6C       $DA6A  
;;  $DA70       $D731  
;;  $DA83       $D721  
;;  $DA9F       $DA70  
;;  $DAA1       $DA73   $DA9D  
;;  $DAB4       $DA42  
;;  $DAB7       $DA3D   $DA47   $DAD5  
;;  $DABB       $DA51   $DA5D  
;;  $DABE       $DA4C   $DB7E  
;;  $DAC7       $D7B5  
;;  $DAC9       $DAC4   $DB6A  
;;  $DACD       $D7C5  
;;  $DAE8       $DADF  
;;  $DB24       $DADA  
;;  $DB6C       $DB27  
;;  $DB7A       $DB75  
;;  $DB82       $D801  
;;  $DBAE       $DBA5  
;;  $DBE7       $DB9B  
;;  $DBEF       $DBF8  
;;  $DBF2       $DC0E   $DC68  
;;  $DBFA       $DB84  
;;  $DC4F       $DC02  
;;  $DC63       $DB89   $DB8E   $DBFD  
;;  $DC6A       $DB96   $DC07   $DC4D   $DC52  
;;  $DC73       $DBA0   $DBAC   $DBE5  
;;  $DC7E       $DBE3   $DC79  
;;  $DC89       $DC84  
;;  $DC95       $DC8D  
;;  $DCB5       $DD36  
;;  $DCB9       $DCBD  
;;  $DCD1       $DCDA  
;;  $DCD4       $DD3D  
;;  $DCDC       $DC9C  
;;  $DCE6       $DCDF   $DD2F  
;;  $DD2C       $DCE4  
;;  $DD38       $DCA1   $DCA6  
;;  $DD4B       $DD42  
;;  $DD88       $DCB3   $DD34   $DDF6  
;;  $DD93       $DD2A   $DD86   $DD8E  
;;  $DDE9       $DDAC  
;;  $DDEC       $DCAE  
;;  $DE15       $DE88  
;;  $DE2D       $DDFC  
;;  $DE37       $DE30  
;;  $DE77       $DEB8  
;;  $DE80       $DE35  
;;  $DE8C       $DE01   $DE06   $DE0E   $DE83  
;;  $DEE2       $DED4  
;;  $DEF6       $DE97  
;;  $DF02       $DE13   $DEF9  
;;  $DF05       $DE8A   $DEE0  
;;  $DF10       $DF0B  
;;  $DF23       $DF2C  
;;  $DF6C       $DF68  
;;  $DF83       $DF1F   $DF28  
;;  $DFA1       $DF9E   $DFF8  
;;  $DFA3       $DFCE  
;;  $DFBB       $DFB2  
;;  $DFC8       $DFB9  
;;  $DFD0       $DFC6  
;;  $DFD5       $DFDE  
;;  $DFD8       $DFF4  
;;  $DFE0       $DF89  
;;  $DFEB       $DFFD  
;;  $DFFA       $DF8E   $DF93  
;;  $F00D       $F00B  
;;  $F013       $F013  
;;  $F03F       $F038  
;;  $F040       $F04B   $F04F   $F053   $F05A  
;;  $F05C       $F03D   $F043  
;;  $F072       $F07B  
;;  $F0BB       $F0B7  
;;  $F0D2       $F06E   $F077  
;;  $F0E4       $F104  
;;  $F0E7       $F0ED  
;;  $F0EB       $F0E8  
;;  $F0F7       $F0F8  
;;  $F106       $F0F0   $F0F3  
;;  $F10F       $F116  
;;  $F11C       $F10B  
;;  $F11E       $F125   $F12C  
;;  $F12E       $F121  
;;  $F144       $F112   $F11A  
;;  $F14F       $F14A  
;;  $F189       $F16E  
;;  $F194       $F18F  
;;  $F1A0       $F1A7  
;;  $F1AD       $F19C  
;;  $F1AF       $F1B6   $F1BD  
;;  $F1BF       $F1B2  
;;  $F1DA       $F1A3   $F1AB  
;;  $F1E5       $F1E0  
;;  $F229       $F224  
;;  $F236       $F240   $F243  
;;  $F242       $F23D  
;;  $F249       $F266   $F28D   $F2B7  
;;  $F24B       $F233   $F239   $F247   $F254   $F25F   $F264   $F26E   $F272  
;;  $F24B       $F277   $F27D   $F28B   $F296   $F2A1   $F2A7   $F2B5  
;;  $F251       $F25B  
;;  $F25D       $F258  
;;  $F27A       $F284   $F287  
;;  $F286       $F281  
;;  $F293       $F29D  
;;  $F29F       $F29A  
;;  $F2A4       $F2AE   $F2B1  
;;  $F2B0       $F2AB  
;;  $F2FC       $F2FA  
;;  $F300       $F2FE  
;;  $F34D       $F34D  
;;  $F371       $F397  
;;  $F395       $F392  
;;  $F432       $F2D5  
;;  $F508       $F527   $F542   $F54B   $F54E   $F551  
;;  $F51A       $F514  
;;  $F520       $F53C  
;;  $F529       $F510  
;;  $F53B       $F539   $F545  
;;  $F53E       $F540  
;;  $F6C4       $F6C8  
;;  $F6D1       $F6D6  
;;  $F6D8       $F6D2  
;;  $F6D9       $F6C5  
;;  $F6DE       $F6E2  
;;  $F6E4       $F6DF  
;;  $F78B       $F453  
;;  $F932       $F930  
;;  $F9A2       $F690  
;;  $F9D5       $F9D3  
;;  $FA1E       $FA1C  
;;  $FA49       $FA47  
;;  $FA62       $FA60  
;;  $FA6B       $FA69  
;;  $FA88       $FA86  
;;  $FA8C       $FA8A  
;;  $FC7A       $FC78  
;;  $FCA3       $FCA1  
;;  $FE3C       $FE3A  
;;  $FE99       $FE97  
;;  $FEBF       $FEBD  
;;  $FF08       $FF06  
;;  $FF1F       $FF1D  
;;  $FF63       $FF63  
;; ======================================================================== ;;
