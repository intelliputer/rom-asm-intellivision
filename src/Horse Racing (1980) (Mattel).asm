
        ORG     $5000
.HEADER:
        BIDECLE $56BE           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5032           ; 5004  Ptr: Start of game
        BIDECLE $577E           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5690           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5F0D           ; 500A  Ptr: Date/Title
        DECLE   $0082           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0008,  $0005   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $000E   ; 5011  Color Stack init (2, 3)
        DECLE   $0008           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $00A0,  $0050,  $0001,  $0080; 5020  Timer dispatch/interval
        DECLE   $0004,  $005E,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $000A,  $0055,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $00FA,  $005C,  $0003,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

.START:
        PSHR    R5                              ; 5032   0275
        MOVR    R7,     R1                      ; 5033   00B9
        SUBI    #$0014, R1                      ; 5034   0339 0014

        JSR     R5,     X_TIMER_START           ; 5036   0004 0118 0044

        ADDI    #$0004, R1                      ; 5039   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 503B   0004 0118 0038

        ADDI    #$0008, R1                      ; 503E   02F9 0008

        JSR     R5,     X_TIMER_STOP            ; 5040   0004 0118 0038

        MVII    #$01E3, R1                      ; 5043   02B9 01E3

        JSR     R5,     L_5FE0                  ; 5045   0004 015C 03E0
        DECLE   $0008,  $000C                   ; 5048   0008 000C

        MVII    #$00EE, R1                      ; 504A   02B9 00EE
        MVII    #$0002, R2                      ; 504C   02BA 0002
        MVII    #$0176, R4                      ; 504E   02BC 0176
L_5050:
        MVO@    R1,     R4                      ; 5050   0261
        MVO@    R2,     R4                      ; 5051   0262
        CMPI    #$0182, R4                      ; 5052   037C 0182
        BNC     L_5050                          ; 5054   0229 0005

        MVII    #$018F, R4                      ; 5056   02BC 018F
        SDBD                                    ; 5058   0001
        MVII    #$0048, R0                      ; 5059   02B8 0048 0000
        MVII    #$00C0, R1                      ; 505C   02B9 00C0

        JSR     R5,     X_FILL_MEM              ; 505E   0004 0114 0341

        PULR    R7                              ; 5061   02B7

        DECLE   $0040,  $0058,  $0080,  $0050   ; 5062   0040 0058 0080 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5066   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 506A   0000 0000 0005 0000
        DECLE   $0001,  $0000,  $00FF,  $00FF   ; 506E   0001 0000 00FF 00FF
        DECLE   $0040,  $0058,  $0099,  $0050   ; 5072   0040 0058 0099 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5076   0000 0000 0000 0000
        DECLE   $0000,  $00F8,  $0005,  $0000   ; 507A   0000 00F8 0005 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 507E   0000 0000 0000 0000
        DECLE   $00E8,  $005D,  $0005,  $0000   ; 5082   00E8 005D 0005 0000

        DECR    R1                              ; 5086   0011
        MOVR    R3,     R7                      ; 5087   009F

        DECLE   $0054,  $00FB,  $005A,  $00FB   ; 5088   0054 00FB 005A 00FB
        DECLE   $015A,  $02FB,  $005A,  $02FB   ; 508C   015A 02FB 005A 02FB
        DECLE   $015A,  $01FB,  $005A,  $01FB   ; 5090   015A 01FB 005A 01FB
        DECLE   $015A,  $03FB,  $005A,  $03FB   ; 5094   015A 03FB 005A 03FB
        DECLE   $015A,  $0078,  $0054,  $004B   ; 5098   015A 0078 0054 004B
        DECLE   $005B,  $0005,  $000C,  $0000   ; 509C   005B 0005 000C 0000
L_50A0:
        PSHR    R5                              ; 50A0   0275
        DECLE   $0284,  $015D,  $00A4,  $020C   ; 50A1   0284 015D 00A4 020C
        DECLE   $0313                           ; 50A5   0313

        MVII    #$000C, R0                      ; 50A6   02B8 000C
        MVII    #$016A, R4                      ; 50A8   02BC 016A

        JSR     R5,     X_FILL_ZERO             ; 50AA   0004 0114 0338

        MVI     G_015F, R0                      ; 50AD   0280 015F
        INCR    R0                              ; 50AF   0008
        MVO     R0,     G_015F                  ; 50B0   0240 015F
        CMPI    #$000B, R0                      ; 50B2   0378 000B
        BNC     L_50C2                          ; 50B4   0209 000C

        CLRR    R0                              ; 50B6   01C0
        MVO     R0,     G_0169                  ; 50B7   0240 0169

        JSR     R5,     L_5888                  ; 50B9   0004 0158 0088

        MVII    #$0020, R0                      ; 50BC   02B8 0020
        SWAP    R0,     1                       ; 50BE   0040
        MVO     R0,     .BTAB.00                ; 50BF   0240 0200
        PULR    R7                              ; 50C1   02B7

L_50C2:
        MVII    #$0187, R1                      ; 50C2   02B9 0187

        JSR     R5,     L_5FE0                  ; 50C4   0004 015C 03E0
        DECLE   $0004,  $0008                   ; 50C7   0004 0008

        MVII    #$0018, R0                      ; 50C9   02B8 0018

        JSR     R5,     X_RAND2                 ; 50CB   0004 0114 029E

        MVO     R0,     G_0182                  ; 50CE   0240 0182
        MVII    #$0183, R4                      ; 50D0   02BC 0183
        MVII    #$031D, R1                      ; 50D2   02B9 031D

L_50D4:
        JSR     R5,     L_5BEE                  ; 50D4   0004 0158 03EE
        DECLE   $0009                           ; 50D7   0009

        MVO@    R0,     R4                      ; 50D8   0260
        ADDI    #$0010, R1                      ; 50D9   02F9 0010
        CMPI    #$0355, R1                      ; 50DB   0379 0355
        BNC     L_50D4                          ; 50DD   0229 000A

L_50DF:
        CLRR    R5                              ; 50DF   01ED
        MVO     R5,     G_0169                  ; 50E0   0245 0169

        JSR     R5,     L_5888                  ; 50E2   0004 0158 0088

        B       L_50EA                          ; 50E5   0200 0003

L_50E7:
        JSR     R5,     L_5F06                  ; 50E7   0004 015C 0306

L_50EA:
        MVII    #$0001, R0                      ; 50EA   02B8 0001
        MVII    #$003E, R1                      ; 50EC   02B9 003E
        CLRR    R2                              ; 50EE   01D2
        MVII    #$0003, R3                      ; 50EF   02BB 0003
        MOVR    R7,     R4                      ; 50F1   00BC
        ADDI    #$013A, R4                      ; 50F2   02FC 013A

        JSR     R5,     .EXEC.910               ; 50F4   0004 0118 0110

        TSTR    R2                              ; 50F7   0092
        BEQ     L_50E7                          ; 50F8   0224 0012

        DECR    R0                              ; 50FA   0010
        BMI     L_5254                          ; 50FB   020B 0157

        CMPI    #$0006, R0                      ; 50FD   0378 0006
        BC      L_50E7                          ; 50FF   0221 0019

        MVO     R0,     G_01EB                  ; 5101   0240 01EB
        MOVR    R0,     R1                      ; 5103   0081
        SLL     R1,     1                       ; 5104   0049
        ADDI    #$016A, R1                      ; 5105   02F9 016A
        MVI@    R1,     R5                      ; 5107   028D
        ANDI    #$0080, R5                      ; 5108   03BD 0080
        BNEQ    L_50E7                          ; 510A   022C 0024
        B       L_5111                          ; 510C   0200 0003

L_510E:
        JSR     R5,     L_5F06                  ; 510E   0004 015C 0306
L_5111:
        JSR     R5,     L_5220                  ; 5111   0004 0150 0220
        DECLE   $025A                           ; 5114   025A

        MVII    #$0023, R5                      ; 5115   02BD 0023
        MVO@    R5,     R1                      ; 5117   024D
        MVII    #$0001, R5                      ; 5118   02BD 0001
        MVO     R5,     G_0169                  ; 511A   0245 0169
        MVII    #$0003, R0                      ; 511C   02B8 0003
        ADDR    R0,     R1                      ; 511E   00C1
        CLRR    R2                              ; 511F   01D2
        MVII    #$0002, R3                      ; 5120   02BB 0002
        MOVR    R7,     R4                      ; 5122   00BC
        ADDI    #$0109, R4                      ; 5123   02FC 0109

        JSR     R5,     .EXEC.910               ; 5125   0004 0118 0110

        TSTR    R0                              ; 5128   0080
        BEQ     L_50DF                          ; 5129   0224 004B

        CMPI    #$00FA, R0                      ; 512B   0378 00FA
        BGT     L_510E                          ; 512D   022E 0020

        MVI     G_01EB, R5                      ; 512F   0285 01EB
        ADDR    R5,     R5                      ; 5131   00ED
        ADDI    #$0176, R5                      ; 5132   02FD 0176
        SDBD                                    ; 5134   0001
        MVI@    R5,     R1                      ; 5135   02A9
        SUBI    #$0002, R5                      ; 5136   033D 0002
        SUBR    R0,     R1                      ; 5138   0101
        BMI     L_510E                          ; 5139   022B 002C

        MVO@    R1,     R5                      ; 513B   0269
        SWAP    R1,     1                       ; 513C   0041
        MVO@    R1,     R5                      ; 513D   0269
        SUBI    #$000D, R5                      ; 513E   033D 000D
        MVO@    R0,     R5                      ; 5140   0268

        JSR     R5,     L_5220                  ; 5141   0004 0150 0220
        DECLE   $025A                           ; 5144   025A

        MVII    #$0020, R0                      ; 5145   02B8 0020
        MVO@    R0,     R1                      ; 5147   0248
        MVII    #$01BB, R0                      ; 5148   02B8 01BB
        ADDI    #$0005, R1                      ; 514A   02F9 0005
        MVO@    R0,     R1                      ; 514C   0248
        MOVR    R7,     R0                      ; 514D   00B8
        ADDI    #$00F2, R0                      ; 514E   02F8 00F2
        MVO     R0,     G_035D                  ; 5150   0240 035D
        MVII    #$0004, R0                      ; 5152   02B8 0004
        MVO     R0,     G_0169                  ; 5154   0240 0169
        PULR    R7                              ; 5156   02B7

        PSHR    R5                              ; 5157   0275

        JSR     R5,     L_5220                  ; 5158   0004 0150 0220
        DECLE   $025F                           ; 515B   025F

        CMPI    #$000B, R0                      ; 515C   0378 000B
        BEQ     L_5165                          ; 515E   0204 0005

        MVI@    R1,     R0                      ; 5160   0288
        XORI    #$0090, R0                      ; 5161   03F8 0090
        MVO@    R0,     R1                      ; 5163   0248
        PULR    R7                              ; 5164   02B7

L_5165:
        MVI@    R1,     R0                      ; 5165   0288
        COMR    R0                              ; 5166   0018
        ANDI    #$0080, R0                      ; 5167   03B8 0080
        SLR     R0,     1                       ; 5169   0060
        MVI     G_01EB, R3                      ; 516A   0283 01EB
        SLL     R3,     1                       ; 516C   004B
        ADDI    #$016A, R3                      ; 516D   02FB 016A
        MVO@    R0,     R3                      ; 516F   0258
        MVII    #$0002, R5                      ; 5170   02BD 0002
L_5172:
        MVO     R5,     G_0169                  ; 5172   0245 0169
        ADDR    R5,     R1                      ; 5174   00E9
        B       L_517A                          ; 5175   0200 0003

L_5177:
        JSR     R5,     L_5F06                  ; 5177   0004 015C 0306
L_517A:
        JSR     R5,     L_51C0                  ; 517A   0004 0150 01C0

        MVII    #$0187, R5                      ; 517D   02BD 0187
L_517F:
        CMP@    R5,     R0                      ; 517F   0368
        BEQ     L_5188                          ; 5180   0204 0006

        CMPI    #$018B, R5                      ; 5182   037D 018B
        BNC     L_517F                          ; 5184   0229 0006
        B       L_5177                          ; 5186   0220 0010

L_5188:
        MVI     G_01EB, R3                      ; 5188   0283 01EB
        SLL     R3,     1                       ; 518A   004B
        ADDI    #$016A, R3                      ; 518B   02FB 016A
        MOVR    R0,     R4                      ; 518D   0084
        SLL     R0,     2                       ; 518E   004C
        SLL     R0,     1                       ; 518F   0048
        MVI@    R3,     R2                      ; 5190   029A
        MVII    #$0080, R5                      ; 5191   02BD 0080
        CMPR    R5,     R2                      ; 5193   016A
        BC      L_51A3                          ; 5194   0201 000D

        ADDR    R0,     R2                      ; 5196   00C2
        XORR    R5,     R2                      ; 5197   01EA
        MVO@    R2,     R3                      ; 5198   025A
        MVII    #$0003, R5                      ; 5199   02BD 0003
        SUBI    #$0002, R1                      ; 519B   0339 0002
        CMPI    #$00C0, R2                      ; 519D   037A 00C0
        BC      L_5172                          ; 519F   0221 002E
        B       L_51AB                          ; 51A1   0200 0008

L_51A3:
        MOVR    R2,     R5                      ; 51A3   0095
        ANDI    #$0038, R5                      ; 51A4   03BD 0038
        CMPR    R0,     R5                      ; 51A6   0145
        BEQ     L_5177                          ; 51A7   0224 0031

        ADDR    R4,     R2                      ; 51A9   00E2
        MVO@    R2,     R3                      ; 51AA   025A
L_51AB:
        MVI@    R3,     R0                      ; 51AB   0298
        SLR     R0,     2                       ; 51AC   0064
        SLR     R0,     1                       ; 51AD   0060
        ANDI    #$0007, R0                      ; 51AE   03B8 0007
        INCR    R3                              ; 51B0   000B
        MVI@    R3,     R2                      ; 51B1   029A
        SLR     R2,     2                       ; 51B2   0066
        SLR     R2,     2                       ; 51B3   0066
        MVII    #$0187, R5                      ; 51B4   02BD 0187
L_51B6:
        CMP@    R5,     R0                      ; 51B6   0368
        BNEQ    L_51B6                          ; 51B7   022C 0002

        SUBI    #$0005, R5                      ; 51B9   033D 0005
        ADD@    R5,     R2                      ; 51BB   02EA
        DECR    R5                              ; 51BC   0015
        MVO@    R2,     R5                      ; 51BD   026A
        B       L_50DF                          ; 51BE   0220 00E0

L_51C0:
        MOVR    R5,     R3                      ; 51C0   00AB
        MVO     R3,     G_0137                  ; 51C1   0243 0137
        SWAP    R3,     1                       ; 51C3   0043
        MVO     R3,     G_0138                  ; 51C4   0243 0138
        MVII    #$0316, R2                      ; 51C6   02BA 0316
        SWAP    R2,     1                       ; 51C8   0042
        MVO@    R2,     R1                      ; 51C9   024A
        MVO     R1,     G_0132                  ; 51CA   0241 0132
        MOVR    R7,     R5                      ; 51CC   00BD
        ADDI    #$0069, R5                      ; 51CD   02FD 0069
        MVO     R5,     G_035D                  ; 51CF   0245 035D
        CLRR    R5                              ; 51D1   01ED
        MVO     R5,     G_0135                  ; 51D2   0245 0135
        PULR    R7                              ; 51D4   02B7

        PSHR    R5                              ; 51D5   0275
        CMPI    #$000B, R0                      ; 51D6   0378 000B
        BEQ     L_51FD                          ; 51D8   0204 0023

        CMPI    #$000A, R0                      ; 51DA   0378 000A
        BEQ     L_520A                          ; 51DC   0204 002C

        TSTR    R0                              ; 51DE   0080
        BEQ     L_51E5                          ; 51DF   0204 0004

        CMPI    #$0009, R0                      ; 51E1   0378 0009
        BNC     L_51E8                          ; 51E3   0209 0003

L_51E5:
        JSR     R5,     L_5F07                  ; 51E5   0004 015C 0307

L_51E8:
        MVO     R0,     G_0135                  ; 51E8   0240 0135
        SLL     R0,     1                       ; 51EA   0048
        MOVR    R0,     R5                      ; 51EB   0085
        SLL     R0,     2                       ; 51EC   004C
        SDBD                                    ; 51ED   0001
        ADDI    #$07F8, R0                      ; 51EE   02F8 00F8 0007
        SDBD                                    ; 51F1   0001
        ADDI    #$5FC4, R5                      ; 51F2   02FD 00C4 005F
        SDBD                                    ; 51F5   0001
        ADD@    R5,     R0                      ; 51F6   02E8
        MVI     G_0132, R1                      ; 51F7   0281 0132
        ADDI    #$0200, R1                      ; 51F9   02F9 0200
        MVO@    R0,     R1                      ; 51FB   0248
        PULR    R7                              ; 51FC   02B7

L_51FD:
        MVI     G_0135, R0                      ; 51FD   0280 0135
        DECR    R0                              ; 51FF   0010
        BMI     L_51E5                          ; 5200   022B 001C

        MVI     G_0132, R1                      ; 5202   0281 0132
        ADDI    #$0200, R1                      ; 5204   02F9 0200
        MVII    #$0137, R5                      ; 5206   02BD 0137
        SDBD                                    ; 5208   0001
        MVI@    R5,     R7                      ; 5209   02AF

L_520A:
        MVI     G_01EB, R5                      ; 520A   0285 01EB
        ADDR    R5,     R5                      ; 520C   00ED
        ADDI    #$0176, R5                      ; 520D   02FD 0176
        SDBD                                    ; 520F   0001
        MVI@    R5,     R0                      ; 5210   02A8
        SUBI    #$000D, R5                      ; 5211   033D 000D
        ADD@    R5,     R0                      ; 5213   02E8
        SUBI    #$0002, R5                      ; 5214   033D 0002
        CLRR    R4                              ; 5216   01E4
        MVO@    R4,     R5                      ; 5217   026C
        MVO@    R4,     R5                      ; 5218   026C
        ADDI    #$000A, R5                      ; 5219   02FD 000A
        MVO@    R0,     R5                      ; 521B   0268
        SWAP    R0,     1                       ; 521C   0040
        MVO@    R0,     R5                      ; 521D   0268
        B       L_50DF                          ; 521E   0220 0140

L_5220:
        MVI     G_01EB, R1                      ; 5220   0281 01EB
        SLL     R1,     2                       ; 5222   004D
        ADD     G_01EB, R1                      ; 5223   02C1 01EB
        SLL     R1,     2                       ; 5225   004D
        ADD@    R5,     R1                      ; 5226   02E9
        MOVR    R5,     R7                      ; 5227   00AF

        CLRR    R1                              ; 5228   01C9
        J       .EXEC.94C                       ; 5229   0004 0318 014C

        DECLE   $0000,  $0000,  $0028,  $0052   ; 522C   0000 0000 0028 0052
        DECLE   $0066,  $0058,  $0066,  $0058   ; 5230   0066 0058 0066 0058
        DECLE   $0066,  $0058,  $0000,  $0000   ; 5234   0066 0058 0000 0000
        DECLE   $00D5,  $0051,  $0066,  $0058   ; 5238   00D5 0051 0066 0058
        DECLE   $0066,  $0058,  $0066,  $0058   ; 523C   0066 0058 0066 0058
        DECLE   $0000,  $0000,  $0057,  $0051   ; 5240   0000 0000 0057 0051
        DECLE   $0066,  $0058,  $0066,  $0058   ; 5244   0066 0058 0066 0058
        DECLE   $0066,  $0058,  $0000,  $0000   ; 5248   0066 0058 0000 0000
        DECLE   $0000,  $0000                   ; 524C   0000 0000

        SLR     R2,     2                       ; 524E   0066
        SLLC    R0,     1                       ; 524F   0058
        SLR     R2,     2                       ; 5250   0066
        SLLC    R0,     1                       ; 5251   0058
        SLR     R2,     2                       ; 5252   0066
        SLLC    R0,     1                       ; 5253   0058
L_5254:
        MVII    #$00F0, R0                      ; 5254   02B8 00F0
        MVII    #$0200, R4                      ; 5256   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5258   0004 0114 0338

        MVI     G_0182, R2                      ; 525B   0282 0182
        SLR     R2,     2                       ; 525D   0066
        ANDI    #$0006, R2                      ; 525E   03BA 0006
        SDBD                                    ; 5260   0001
        ADDI    #$5FB8, R2                      ; 5261   02FA 00B8 005F
        MOVR    R2,     R5                      ; 5264   0095
        SDBD                                    ; 5265   0001
        MVI@    R5,     R1                      ; 5266   02A9
        SDBD                                    ; 5267   0001
        ADDI    #$0958, R1                      ; 5268   02F9 0058 0009
        MVII    #$0014, R0                      ; 526B   02B8 0014
        MVII    #$0200, R4                      ; 526D   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 526F   0004 0114 0341

        SDBD                                    ; 5272   0001
        MVII    #$08BF, R1                      ; 5273   02B9 00BF 0008

        JSR     R5,     X_FILL_MEM              ; 5276   0004 0114 0341

        ADDI    #$0064, R4                      ; 5279   02FC 0064
        SDBD                                    ; 527B   0001
        MVII    #$08E7, R1                      ; 527C   02B9 00E7 0008

        JSR     R5,     X_FILL_MEM              ; 527F   0004 0114 0341

        MVI     .BTAB.00,R1                     ; 5282   0281 0200
        SUBI    #$0118, R1                      ; 5284   0339 0118
        MVII    #$0050, R0                      ; 5286   02B8 0050

        JSR     R5,     X_FILL_MEM              ; 5288   0004 0114 0341

        SUBI    #$00A0, R4                      ; 528B   033C 00A0
        MVII    #$0014, R1                      ; 528D   02B9 0014
L_528F:
        MVII    #$0002, R0                      ; 528F   02B8 0002

        JSR     R5,     X_RAND1                 ; 5291   0004 0114 027D

        SLL     R0,     2                       ; 5294   004C
        SLL     R0,     1                       ; 5295   0048
        SDBD                                    ; 5296   0001
        ADDI    #$08C4, R0                      ; 5297   02F8 00C4 0008
        MVO@    R0,     R4                      ; 529A   0260
        DECR    R1                              ; 529B   0011
        BNEQ    L_528F                          ; 529C   022C 000E

        ADDI    #$0014, R4                      ; 529E   02FC 0014
        MVII    #$0014, R1                      ; 52A0   02B9 0014
L_52A2:
        MVII    #$0002, R0                      ; 52A2   02B8 0002

        JSR     R5,     X_RAND1                 ; 52A4   0004 0114 027D

        SLL     R0,     2                       ; 52A7   004C
        SLL     R0,     1                       ; 52A8   0048
        SDBD                                    ; 52A9   0001
        ADDI    #$08EC, R0                      ; 52AA   02F8 00EC 0008
        MVO@    R0,     R4                      ; 52AD   0260
        DECR    R1                              ; 52AE   0011
        BNEQ    L_52A2                          ; 52AF   022C 000E

        MVII    #$0020, R0                      ; 52B1   02B8 0020
        SWAP    R0,     1                       ; 52B3   0040
        MVO     R0,     .BTAB.00                ; 52B4   0240 0200
        MVO     R0,     .BTAB.64                ; 52B6   0240 0264
        MVO     R0,     .BTAB.78                ; 52B8   0240 0278
        MVO     R0,     .BTAB.A0                ; 52BA   0240 02A0
        MVII    #$02A5, R4                      ; 52BC   02BC 02A5
L_52BE:
        MVII    #$00F0, R0                      ; 52BE   02B8 00F0
        MVI@    R4,     R5                      ; 52C0   02A5
        ADDR    R0,     R5                      ; 52C1   00C5
        DECR    R4                              ; 52C2   0014
        MVO@    R5,     R4                      ; 52C3   0265
        ADDI    #$0008, R5                      ; 52C4   02FD 0008
        MVO@    R5,     R4                      ; 52C6   0265
        ADDI    #$0008, R5                      ; 52C7   02FD 0008
        MVO@    R5,     R4                      ; 52C9   0265
        ADDI    #$0010, R4                      ; 52CA   02FC 0010
        CMPI    #$02E0, R4                      ; 52CC   037C 02E0
        BLE     L_52BE                          ; 52CE   0226 0011

        SUBI    #$0010, R4                      ; 52D0   033C 0010
        MVI@    R4,     R0                      ; 52D2   02A0
        MVO     R0,     .BTAB.A7                ; 52D3   0240 02A7
        MVII    #$0187, R4                      ; 52D5   02BC 0187
L_52D7:
        MVI@    R4,     R3                      ; 52D7   02A3
        DECR    R4                              ; 52D8   0014
        ADDR    R3,     R3                      ; 52D9   00DB
        ADD@    R4,     R3                      ; 52DA   02E3
        ADDI    #$01A7, R3                      ; 52DB   02FB 01A7
        MOVR    R3,     R5                      ; 52DD   009D
        ADDI    #$0018, R5                      ; 52DE   02FD 0018
        MVII    #$0003, R0                      ; 52E0   02B8 0003
L_52E2:
        MVI@    R3,     R1                      ; 52E2   0299
        MVO@    R1,     R5                      ; 52E3   0269
        INCR    R3                              ; 52E4   000B
        DECR    R0                              ; 52E5   0010
        BNEQ    L_52E2                          ; 52E6   022C 0005

        SUBI    #$001B, R3                      ; 52E8   033B 001B
        SUBI    #$001B, R5                      ; 52EA   033D 001B
        MVII    #$0003, R0                      ; 52EC   02B8 0003
L_52EE:
        MVI@    R3,     R1                      ; 52EE   0299
        MVO@    R1,     R5                      ; 52EF   0269
        INCR    R3                              ; 52F0   000B
        DECR    R0                              ; 52F1   0010
        BNEQ    L_52EE                          ; 52F2   022C 0005

        CMPI    #$018B, R4                      ; 52F4   037C 018B
        BLT     L_52D7                          ; 52F6   0225 0020

        MVI     G_0182, R1                      ; 52F8   0281 0182
        SLL     R1,     2                       ; 52FA   004D
        ANDI    #$0078, R1                      ; 52FB   03B9 0078
        CLRR    R0                              ; 52FD   01C0
        MVII    #$0187, R4                      ; 52FE   02BC 0187
L_5300:
        MVI@    R4,     R5                      ; 5300   02A5
        ADDR    R5,     R5                      ; 5301   00ED
        DECR    R4                              ; 5302   0014
        ADD@    R4,     R5                      ; 5303   02E5
        ADDI    #$018F, R5                      ; 5304   02FD 018F
        MVO@    R0,     R5                      ; 5306   0268
        MVO@    R0,     R5                      ; 5307   0268
        MVO@    R1,     R5                      ; 5308   0269
        CMPI    #$018B, R4                      ; 5309   037C 018B
        BLT     L_5300                          ; 530B   0225 000C

        MOVR    R7,     R4                      ; 530D   00BC
        ADDI    #$00A2, R4                      ; 530E   02FC 00A2
        MVII    #$0187, R3                      ; 5310   02BB 0187
        MVII    #$031D, R2                      ; 5312   02BA 031D
        MOVR    R7,     R1                      ; 5314   00B9
        SUBI    #$02B3, R1                      ; 5315   0339 02B3
L_5317:
        MVII    #$0002, R0                      ; 5317   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5319   0004 0114 02B4

        MVI@    R3,     R5                      ; 531C   029D
        SDBD                                    ; 531D   0001
        ADDI    #$5FBE, R5                      ; 531E   02FD 00BE 005F
        MVI@    R5,     R0                      ; 5321   02A8
        MOVR    R0,     R5                      ; 5322   0085
        XOR@    R2,     R0                      ; 5323   03D0
        MVO@    R0,     R2                      ; 5324   0250
        ADDI    #$0002, R2                      ; 5325   02FA 0002
        MVI@    R4,     R0                      ; 5327   02A0
        SWAP    R0,     1                       ; 5328   0040
        MVO@    R0,     R2                      ; 5329   0250
        INCR    R2                              ; 532A   000A
        MVI@    R4,     R0                      ; 532B   02A0
        SWAP    R0,     1                       ; 532C   0040
        MVO@    R0,     R2                      ; 532D   0250
        ADDI    #$0005, R2                      ; 532E   02FA 0005
        XOR@    R2,     R5                      ; 5330   03D5
        MVO@    R5,     R2                      ; 5331   0255
        ADDI    #$0008, R2                      ; 5332   02FA 0008
        INCR    R3                              ; 5334   000B
        CMPI    #$018B, R3                      ; 5335   037B 018B
        BNC     L_5317                          ; 5337   0229 0021

        MVII    #$00AA, R0                      ; 5339   02B8 00AA
        MVO     R0,     G_011A                  ; 533B   0240 011A

        JSR     R5,     L_5F73                  ; 533D   0004 015C 0373
        JSR     R5,     .EXEC.A61               ; 5340   0004 0118 0261

        SLR     R0,     2                       ; 5343   0064
        MVII    #$02A5, R4                      ; 5344   02BC 02A5
        MVI@    R4,     R0                      ; 5346   02A0
        MVI@    R4,     R1                      ; 5347   02A1
        SDBD                                    ; 5348   0001
        ANDI    #$1007, R1                      ; 5349   03B9 0007 0010
        SDBD                                    ; 534C   0001
        XORI    #$0948, R1                      ; 534D   03F9 0048 0009
        DECR    R4                              ; 5350   0014
L_5351:
        MVO@    R0,     R4                      ; 5351   0260
        MVO@    R1,     R4                      ; 5352   0261
        ADDI    #$0011, R4                      ; 5353   02FC 0011
        CMPI    #$02E0, R4                      ; 5355   037C 02E0
        BLE     L_5351                          ; 5357   0226 0007

        MVII    #$0322, R4                      ; 5359   02BC 0322
        MVII    #$000B, R2                      ; 535B   02BA 000B
        MVII    #$03F0, R0                      ; 535D   02B8 03F0
L_535F:
        MVO@    R0,     R4                      ; 535F   0260
        ADDI    #$0007, R4                      ; 5360   02FC 0007
        MVO@    R0,     R4                      ; 5362   0260
        MVO@    R2,     R4                      ; 5363   0262
        ADDI    #$0006, R4                      ; 5364   02FC 0006
        SUBI    #$0020, R0                      ; 5366   0338 0020
        SUBI    #$0003, R2                      ; 5368   033A 0003
        BPL     L_535F                          ; 536A   0223 000C

        MVI     G_0182, R0                      ; 536C   0280 0182
        ANDI    #$0007, R0                      ; 536E   03B8 0007
        ADDI    #$0002, R0                      ; 5370   02F8 0002
        MVO     R0,     G_0182                  ; 5372   0240 0182
        SDBD                                    ; 5374   0001
        MVII    #$5FD6, R2                      ; 5375   02BA 00D6 005F
        MVO     R2,     G_035D                  ; 5378   0242 035D
        MVII    #$0004, R0                      ; 537A   02B8 0004
        MVII    #$0133, R4                      ; 537C   02BC 0133

        JSR     R5,     X_FILL_ZERO             ; 537E   0004 0114 0338

        MVII    #$000A, R0                      ; 5381   02B8 000A
        MVII    #$01D7, R4                      ; 5383   02BC 01D7

        JSR     R5,     X_FILL_ZERO             ; 5385   0004 0114 0338

        MVII    #$001F, R5                      ; 5388   02BD 001F
        MVO     R5,     G_0169                  ; 538A   0245 0169
        CLRR    R0                              ; 538C   01C0
        MVO     R0,     G_0160                  ; 538D   0240 0160
        MVO     R0,     G_01EB                  ; 538F   0240 01EB
        MVO     R0,     G_01EC                  ; 5391   0240 01EC
        INCR    R0                              ; 5393   0008
        MVO     R0,     G_015D                  ; 5394   0240 015D
        MVO     R0,     G_015E                  ; 5396   0240 015E
        MVII    #$00F0, R0                      ; 5398   02B8 00F0
        MVO     R0,     G_01EE                  ; 539A   0240 01EE
        MOVR    R7,     R1                      ; 539C   00B9
        SUBI    #$0379, R1                      ; 539D   0339 0379

        JSR     R5,     X_TIMER_START           ; 539F   0004 0118 0044

        ADDI    #$0004, R1                      ; 53A2   02F9 0004

        JSR     R5,     X_TIMER_START           ; 53A4   0004 0118 0044

        ADDI    #$0004, R1                      ; 53A7   02F9 0004

        JSR     R5,     X_TIMER_START           ; 53A9   0004 0118 0044
        JSR     R5,     L_5EDE                  ; 53AC   0004 015C 02DE

        PULR    R7                              ; 53AF   02B7

        NOP                                     ; 53B0   0034
        SLL     R0,     1                       ; 53B1   0048
        ADCR    R4                              ; 53B2   002C
        RLC     R0,     1                       ; 53B3   0050
        NEGR    R4                              ; 53B4   0024
        SLLC    R0,     1                       ; 53B5   0058
        COMR    R4                              ; 53B6   001C
        SLR     R0,     1                       ; 53B7   0060

L_53B8:
        JSR     R5,     .EXEC.A61               ; 53B8   0004 0118 0261

        INCR    R2                              ; 53BB   000A

        JSR     R5,     L_5EBC                  ; 53BC   0004 015C 02BC

        MVI     G_0160, R0                      ; 53BF   0280 0160
        CMPI    #$00FF, R0                      ; 53C1   0378 00FF
        BNEQ    L_53B8                          ; 53C3   022C 000C

        JSR     R5,     X_STOP_SFX              ; 53C5   0004 011C 02B4

        MVII    #$0280, R2                      ; 53C8   02BA 0280
        MVI     G_035C, R3                      ; 53CA   0283 035C
L_53CC:
        SWAP    R3,     1                       ; 53CC   0043
        MOVR    R3,     R5                      ; 53CD   009D
        SWAP    R3,     1                       ; 53CE   0043
        SLL     R3,     2                       ; 53CF   004F
        SLL     R3,     1                       ; 53D0   004B
        ANDI    #$000E, R5                      ; 53D1   03BD 000E
        SDBD                                    ; 53D3   0001
        ADDI    #$5FC6, R5                      ; 53D4   02FD 00C6 005F
        SDBD                                    ; 53D7   0001
        MVI@    R5,     R0                      ; 53D8   02A8
        SDBD                                    ; 53D9   0001
        ADDI    #$0950, R0                      ; 53DA   02F8 0050 0009
        MVO@    R0,     R2                      ; 53DD   0250
        DECR    R2                              ; 53DE   0012
        MVII    #$0020, R0                      ; 53DF   02B8 0020
        SWAP    R0,     1                       ; 53E1   0040
        MOVR    R0,     R4                      ; 53E2   0084
        AND@    R2,     R0                      ; 53E3   0390
        MVO@    R0,     R2                      ; 53E4   0250
        DECR    R2                              ; 53E5   0012
        ADDR    R4,     R4                      ; 53E6   00E4
L_53E7:
        DECR    R4                              ; 53E7   0014
        BNEQ    L_53E7                          ; 53E8   022C 0002

        CMPI    #$027A, R2                      ; 53EA   037A 027A
        BC      L_53CC                          ; 53EC   0221 0021

        MVO     R4,     G_015D                  ; 53EE   0244 015D

        JSR     R5,     .EXEC.A61               ; 53F0   0004 0118 0261

        SARC    R0,     1                       ; 53F3   0078
        MOVR    R7,     R1                      ; 53F4   00B9
        SUBI    #$03D5, R1                      ; 53F5   0339 03D5

        JSR     R5,     X_TIMER_START           ; 53F7   0004 0118 0044

        ADDI    #$0004, R1                      ; 53FA   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 53FC   0004 0118 0038

        ADDI    #$0008, R1                      ; 53FF   02F9 0008

        JSR     R5,     X_TIMER_STOP            ; 5401   0004 0118 0038

        MVI     G_035C, R3                      ; 5404   0283 035C
        SLR     R3,     2                       ; 5406   0067
        SLR     R3,     2                       ; 5407   0067
        MVII    #$016A, R4                      ; 5408   02BC 016A
        SLR     R3,     2                       ; 540A   0067
        ANDI    #$003F, R3                      ; 540B   03BB 003F
        MVO     R3,     G_034C                  ; 540D   0243 034C
L_540F:
        MVI     G_034C, R3                      ; 540F   0283 034C
        MVI@    R4,     R2                      ; 5411   02A2
        MVI@    R4,     R1                      ; 5412   02A1
        MOVR    R2,     R0                      ; 5413   0090
        ANDI    #$0040, R0                      ; 5414   03B8 0040
        BNEQ    L_541A                          ; 5416   020C 0002

        ANDI    #$0038, R3                      ; 5418   03BB 0038
L_541A:
        ANDI    #$003F, R2                      ; 541A   03BA 003F
        CMPR    R2,     R3                      ; 541C   0153
        BNEQ    L_5435                          ; 541D   020C 0016

        MOVR    R0,     R3                      ; 541F   0083
        SLR     R3,     1                       ; 5420   0063
        BNEQ    L_5436                          ; 5421   020C 0013

        SLR     R2,     2                       ; 5423   0066
        SLR     R2,     1                       ; 5424   0062
        MVII    #$0187, R5                      ; 5425   02BD 0187
L_5427:
        CMP@    R5,     R2                      ; 5427   036A
        BNEQ    L_5427                          ; 5428   022C 0002

        ADDI    #$0003, R5                      ; 542A   02FD 0003
        MVI@    R5,     R3                      ; 542C   02AB
        MOVR    R3,     R0                      ; 542D   0098
        SARC    R0,     1                       ; 542E   0078
        BNC     L_5432                          ; 542F   0209 0001

        SLR     R3,     1                       ; 5431   0063
L_5432:
        ADDI    #$0002, R3                      ; 5432   02FB 0002
        INCR    R7                              ; 5434   000F

L_5435:
        CLRR    R3                              ; 5435   01DB
L_5436:
        MOVR    R3,     R0                      ; 5436   0098

        JSR     R5,     X_MPY                   ; 5437   0004 011C 01DC

        SARC    R2,     1                       ; 543A   007A
        MOVR    R4,     R5                      ; 543B   00A5
        ADDI    #$000A, R5                      ; 543C   02FD 000A
        SDBD                                    ; 543E   0001
        ADD@    R5,     R2                      ; 543F   02EA
        SDBD                                    ; 5440   0001
        MVII    #$270F, R1                      ; 5441   02B9 000F 0027
        CMPR    R1,     R2                      ; 5444   014A
        BNC     L_5448                          ; 5445   0209 0001

        MOVR    R1,     R2                      ; 5447   008A
L_5448:
        SUBI    #$0002, R5                      ; 5448   033D 0002
        MVO@    R2,     R5                      ; 544A   026A
        SWAP    R2,     1                       ; 544B   0042
        MVO@    R2,     R5                      ; 544C   026A
        CMPI    #$0176, R4                      ; 544D   037C 0176
        BNEQ    L_540F                          ; 544F   022C 0041

        CLRR    R0                              ; 5451   01C0
        MVO     R0,     G_0163                  ; 5452   0240 0163
        MVII    #$0187, R3                      ; 5454   02BB 0187
L_5456:
        MVI     G_035C, R0                      ; 5456   0280 035C
        SLR     R0,     2                       ; 5458   0064
        SLR     R0,     1                       ; 5459   0060
        MVII    #$0007, R5                      ; 545A   02BD 0007
        MOVR    R0,     R4                      ; 545C   0084
        ANDR    R5,     R4                      ; 545D   01AC
        SLR     R0,     2                       ; 545E   0064
        SLR     R0,     1                       ; 545F   0060
        MOVR    R0,     R2                      ; 5460   0082
        ANDR    R5,     R2                      ; 5461   01AA
        SLR     R0,     2                       ; 5462   0064
        SLR     R0,     1                       ; 5463   0060
        ANDR    R5,     R0                      ; 5464   01A8
        MVI@    R3,     R1                      ; 5465   0299
        ADDR    R1,     R1                      ; 5466   00C9
        ADD@    R3,     R1                      ; 5467   02D9
        ADDI    #$018F, R1                      ; 5468   02F9 018F
        ADD@    R1,     R0                      ; 546A   02C8
        MVO@    R0,     R1                      ; 546B   0248
        INCR    R1                              ; 546C   0009
        ADD@    R1,     R2                      ; 546D   02CA
        MVO@    R2,     R1                      ; 546E   024A
        INCR    R1                              ; 546F   0009
        ADD@    R1,     R4                      ; 5470   02CC
        MVO@    R4,     R1                      ; 5471   024C
        INCR    R3                              ; 5472   000B
        CMPI    #$018B, R3                      ; 5473   037B 018B
        BNC     L_5456                          ; 5475   0229 0020
        PULR    R7                              ; 5477   02B7

        PSHR    R5                              ; 5478   0275
        DECR    R0                              ; 5479   0010
        SUBI    #$0008, R1                      ; 547A   0339 0008

        JSR     R5,     L_54F3                  ; 547C   0004 0154 00F3

        ADDI    #$0002, R1                      ; 547F   02F9 0002
        MVI@    R1,     R3                      ; 5481   028B
        SWAP    R3,     1                       ; 5482   0043
        ANDI    #$00FF, R3                      ; 5483   03BB 00FF
        CMPI    #$00A6, R3                      ; 5485   037B 00A6
        BNC     L_5509                          ; 5487   0209 0080

        SUBI    #$0002, R1                      ; 5489   0339 0002

        JSR     R5,     .EXEC.7AE               ; 548B   0004 0114 03AE

        ADDI    #$0008, R1                      ; 548E   02F9 0008

        JSR     R5,     .EXEC.7AE               ; 5490   0004 0114 03AE
        JSR     R5,     .EXEC.766               ; 5493   0004 0114 0366

        SLR     R0,     1                       ; 5496   0060

        JSR     R5,     X_POW2                  ; 5497   0004 0114 0345

        XOR     G_0160, R0                      ; 549A   03C0 0160
        MVO     R0,     G_0160                  ; 549C   0240 0160
        PULR    R7                              ; 549E   02B7

        PSHR    R5                              ; 549F   0275

        JSR     R5,     L_54F3                  ; 54A0   0004 0154 00F3

        MVII    #$0162, R5                      ; 54A3   02BD 0162
        SDBD                                    ; 54A5   0001
        MVI@    R5,     R2                      ; 54A6   02AA
        ADDI    #$0002, R1                      ; 54A7   02F9 0002
        ADD@    R1,     R2                      ; 54A9   02CA
        SDBD                                    ; 54AA   0001
        CMPI    #$8500, R2                      ; 54AB   037A 0000 0085
        BNC     L_5509                          ; 54AE   0209 0059

        SLR     R0,     1                       ; 54B0   0060
        MOVR    R0,     R3                      ; 54B1   0083
        ADDI    #$0004, R0                      ; 54B2   02F8 0004

        JSR     R5,     X_POW2                  ; 54B4   0004 0114 0345

        MOVR    R0,     R2                      ; 54B7   0082
        MVI     G_0160, R4                      ; 54B8   0284 0160
        ANDR    R4,     R0                      ; 54BA   01A0
        BNEQ    L_5509                          ; 54BB   020C 004C

        XORR    R4,     R2                      ; 54BD   01E2
        MVO     R2,     G_0160                  ; 54BE   0242 0160
        ADDI    #$0187, R3                      ; 54C0   02FB 0187
        MVI@    R3,     R0                      ; 54C2   0298
        MVI     G_035C, R2                      ; 54C3   0282 035C
        SLL     R2,     2                       ; 54C5   004E
        SLL     R2,     1                       ; 54C6   004A
        ADDR    R0,     R2                      ; 54C7   00C2
        MVO     R2,     G_035C                  ; 54C8   0242 035C
        MVII    #$01EB, R5                      ; 54CA   02BD 01EB
        SDBD                                    ; 54CC   0001
        MVI@    R5,     R1                      ; 54CD   02A9
        MOVR    R1,     R2                      ; 54CE   008A
        MOVR    R0,     R5                      ; 54CF   0085
        ADDR    R0,     R0                      ; 54D0   00C0
        ADDR    R0,     R5                      ; 54D1   00C5
        ADDI    #$018F, R5                      ; 54D2   02FD 018F
        SLL     R1,     2                       ; 54D4   004D
        SLL     R1,     1                       ; 54D5   0049
        MVO@    R1,     R5                      ; 54D6   0269
        SLR     R2,     2                       ; 54D7   0066
        ANDI    #$00F8, R2                      ; 54D8   03BA 00F8
        MVO@    R2,     R5                      ; 54DA   026A
        TSTR    R4                              ; 54DB   00A4
        BNEQ    L_5509                          ; 54DC   020C 002B

        MVO     R4,     G_015E                  ; 54DE   0244 015E
        MVII    #$0002, R2                      ; 54E0   02BA 0002
        MVII    #$0133, R3                      ; 54E2   02BB 0133
L_54E4:
        CMP@    R3,     R2                      ; 54E4   035A
        BGT     L_54E8                          ; 54E5   020E 0001

        MVO@    R2,     R3                      ; 54E7   025A
L_54E8:
        INCR    R3                              ; 54E8   000B
        CMPI    #$0137, R3                      ; 54E9   037B 0137
        BNC     L_54E4                          ; 54EB   0229 0008

        MVII    #$0008, R0                      ; 54ED   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; 54EF   0004 011C 02D5

        PULR    R7                              ; 54F2   02B7

L_54F3:
        PSHR    R5                              ; 54F3   0275
        DECLE   $0282,  $02D7,  $0001           ; 54F4   0282 02D7 0001

        ANDI    #$00F8, R2                      ; 54F7   03BA 00F8
        INCR    R7                              ; 54F9   000F

        DECLE   $0001                           ; 54FA   0001
L_54FB:
        CMPI    #$0060, R2                      ; 54FB   037A 0060
        INCR    R1                              ; 54FD   0009
        BNEQ    L_5508                          ; 54FE   020C 0008

        MOVR    R0,     R2                      ; 5500   0082
        SLR     R2,     1                       ; 5501   0062
        ADDI    #$0133, R2                      ; 5502   02FA 0133
        MVI@    R2,     R2                      ; 5504   0292
        TSTR    R2                              ; 5505   0092
        BEQ     L_5509                          ; 5506   0204 0001

L_5508:
        PULR    R5                              ; 5508   02B5
L_5509:
        PULR    R7                              ; 5509   02B7

L_550A:
        PSHR    R5                              ; 550A   0275
        MVII    #$0161, R4                      ; 550B   02BC 0161
        MVI@    R4,     R0                      ; 550D   02A0
        SWAP    R0,     1                       ; 550E   0040
        SAR     R0,     2                       ; 550F   006C
        SAR     R0,     2                       ; 5510   006C
        SAR     R0,     1                       ; 5511   0068
        MOVR    R4,     R3                      ; 5512   00A3
        SDBD                                    ; 5513   0001
        ADD@    R4,     R0                      ; 5514   02E0
        MVO@    R0,     R3                      ; 5515   0258
        SWAP    R0,     1                       ; 5516   0040
        MOVR    R0,     R2                      ; 5517   0082
        INCR    R3                              ; 5518   000B
        SUB@    R3,     R0                      ; 5519   0318
        MOVR    R2,     R1                      ; 551A   0091
        ANDI    #$0007, R1                      ; 551B   03B9 0007
        MVO@    R1,     R3                      ; 551D   0259
        XORR    R1,     R2                      ; 551E   01CA
        MVII    #$0167, R5                      ; 551F   02BD 0167
        MVO@    R2,     R5                      ; 5521   026A
        MVII    #$0003, R3                      ; 5522   02BB 0003
        MVO@    R3,     R5                      ; 5524   026B
        MVII    #$0100, R5                      ; 5525   02BD 0100
        SDBD                                    ; 5527   0001
        MVI@    R5,     R0                      ; 5528   02A8
        MVO@    R0,     R4                      ; 5529   0260
        SWAP    R0,     1                       ; 552A   0040
        MVO@    R0,     R4                      ; 552B   0260
        MOVR    R7,     R0                      ; 552C   00B8
        ADDI    #$001A, R0                      ; 552D   02F8 001A
        MVO     R0,     .ISRVEC.0               ; 552F   0240 0100
        SWAP    R0,     1                       ; 5531   0040
        MVO     R0,     .ISRVEC.1               ; 5532   0240 0101
L_5534:
        EIS                                     ; 5534   0002
        MVI     G_0168, R2                      ; 5535   0282 0168
        SARC    R2,     2                       ; 5537   007E
        BC      L_5534                          ; 5538   0221 0005
        BOV     L_5540                          ; 553A   0202 0004

        JSR     R5,     X_PLAY_NOTE             ; 553C   0004 0118 02BD

        PULR    R7                              ; 553F   02B7

L_5540:
        JSR     R5,     X_PLAY_NOTE             ; 5540   0004 0118 02BD
        JSR     R5,     L_5597                  ; 5543   0004 0154 0197

        PULR    R7                              ; 5546   02B7

        PSHR    R5                              ; 5547   0275
        MVII    #$031D, R2                      ; 5548   02BA 031D
        CLRR    R3                              ; 554A   01DB
L_554B:
        MVII    #$0166, R5                      ; 554B   02BD 0166
        ADDI    #$0002, R2                      ; 554D   02FA 0002
        MVI@    R2,     R0                      ; 554F   0290
        SDBD                                    ; 5550   0001
        ADD@    R5,     R0                      ; 5551   02E8
        MVO@    R0,     R2                      ; 5552   0250
        MVI@    R3,     R0                      ; 5553   0298
        MOVR    R0,     R1                      ; 5554   0081
        ANDI    #$00FF, R1                      ; 5555   03B9 00FF
        XORR    R1,     R0                      ; 5557   01C8
        DECR    R5                              ; 5558   0015
        ADD@    R5,     R1                      ; 5559   02E9
        ANDI    #$00FF, R1                      ; 555A   03B9 00FF
        XORR    R1,     R0                      ; 555C   01C8
        MVO@    R0,     R3                      ; 555D   0258
        ADDI    #$0006, R2                      ; 555E   02FA 0006
        INCR    R3                              ; 5560   000B
        CMPI    #$0008, R3                      ; 5561   037B 0008
        BNEQ    L_554B                          ; 5563   022C 0019

        MVI     G_0163, R0                      ; 5565   0280 0163
        MVO     R0,     .STIC.HDLY              ; 5567   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 5569   0240 0020
        MVII    #$0164, R4                      ; 556B   02BC 0164
        SDBD                                    ; 556D   0001
        MVI@    R4,     R0                      ; 556E   02A0
        MVO     R0,     .ISRVEC.0               ; 556F   0240 0100
        SWAP    R0,     1                       ; 5571   0040
        MVO     R0,     .ISRVEC.1               ; 5572   0240 0101
        CLRR    R2                              ; 5574   01D2
        MVI     G_0167, R0                      ; 5575   0280 0167
        SWAP    R0,     2                       ; 5577   0044
        BEQ     L_5592                          ; 5578   0204 0018

        MVII    #$0200, R4                      ; 557A   02BC 0200
        MOVR    R4,     R5                      ; 557C   00A5
L_557D:
        MVI@    R4,     R0                      ; 557D   02A0
        SDBD                                    ; 557E   0001
        ANDI    #$2000, R0                      ; 557F   03B8 0000 0020
        XOR@    R4,     R0                      ; 5582   03E0
        MVO@    R0,     R5                      ; 5583   0268
        MVII    #$0012, R3                      ; 5584   02BB 0012
L_5586:
        MVI@    R4,     R0                      ; 5586   02A0
        MVO@    R0,     R5                      ; 5587   0268
        DECR    R3                              ; 5588   0013
        BNEQ    L_5586                          ; 5589   022C 0004

        INCR    R5                              ; 558B   000D
        CMPI    #$02E6, R4                      ; 558C   037C 02E6
        BLT     L_557D                          ; 558E   0225 0012

        MVII    #$0002, R0                      ; 5590   02B8 0002
L_5592:
        SLL     R2,     2                       ; 5592   004E
        XORR    R0,     R2                      ; 5593   01C2
        MVO     R2,     G_0168                  ; 5594   0242 0168
        PULR    R7                              ; 5596   02B7

L_5597:
        PSHR    R5                              ; 5597   0275
        MVII    #$0212, R5                      ; 5598   02BD 0212
L_559A:
        MVI@    R5,     R0                      ; 559A   02A8
        MVO@    R0,     R5                      ; 559B   0268
        ADDI    #$0012, R5                      ; 559C   02FD 0012
        CMPI    #$02D8, R5                      ; 559E   037D 02D8
        BNC     L_559A                          ; 55A0   0229 0007

        MVI     G_0169, R2                      ; 55A2   0282 0169
        MOVR    R2,     R1                      ; 55A4   0091
        DECR    R2                              ; 55A5   0012
        MVO     R2,     G_0169                  ; 55A6   0242 0169
        ANDI    #$001F, R1                      ; 55A8   03B9 001F
        DECR    R1                              ; 55AA   0011
        BMI     L_55F4                          ; 55AB   020B 0047

L_55AD:
        INCR    R2                              ; 55AD   000A
        MOVR    R2,     R1                      ; 55AE   0091
        SLR     R1,     1                       ; 55AF   0061
        ADDR    R7,     R1                      ; 55B0   00F9
        ADDI    #$00BF, R1                      ; 55B1   02F9 00BF
        MVI@    R1,     R0                      ; 55B3   0288
        SARC    R2,     1                       ; 55B4   007A
        BC      L_55BA                          ; 55B5   0201 0003

        SLR     R0,     2                       ; 55B7   0064
        SLR     R0,     2                       ; 55B8   0064
        SLR     R0,     1                       ; 55B9   0060
L_55BA:
        ANDI    #$001F, R0                      ; 55BA   03B8 001F
        SLL     R0,     1                       ; 55BC   0048
        MOVR    R0,     R5                      ; 55BD   0085
        ADDR    R0,     R5                      ; 55BE   00C5
        ADDR    R0,     R5                      ; 55BF   00C5
        ADDR    R7,     R5                      ; 55C0   00FD
        ADDI    #$005B, R5                      ; 55C1   02FD 005B
        MVII    #$023B, R4                      ; 55C3   02BC 023B
L_55C5:
        MVI@    R5,     R0                      ; 55C5   02A8
        CMPI    #$0200, R0                      ; 55C6   0378 0200
        BNC     L_55CE                          ; 55C8   0209 0004

        SDBD                                    ; 55CA   0001
        ADDI    #$0E00, R0                      ; 55CB   02F8 0000 000E
L_55CE:
        SDBD                                    ; 55CE   0001
        ADDI    #$0800, R0                      ; 55CF   02F8 0000 0008
        MVO@    R0,     R4                      ; 55D2   0260
        ADDI    #$0013, R4                      ; 55D3   02FC 0013
        CMPI    #$02B3, R4                      ; 55D5   037C 02B3
        BNC     L_55C5                          ; 55D7   0229 0013

        MVI     G_0169, R0                      ; 55D9   0280 0169
        CMPI    #$0022, R0                      ; 55DB   0378 0022
        BNEQ    L_55F3                          ; 55DD   020C 0014

        MVI     .BTAB.EF,R0                     ; 55DF   0280 02EF
        ADDI    #$0120, R0                      ; 55E1   02F8 0120
        MVO     R0,     .BTAB.B2                ; 55E3   0240 02B2
        MVO     R0,     .BTAB.C6                ; 55E5   0240 02C6
        MVO     R0,     .BTAB.DA                ; 55E7   0240 02DA
        MVO     R0,     .BTAB.EE                ; 55E9   0240 02EE
        SDBD                                    ; 55EB   0001
        ADDI    #$1EE0, R0                      ; 55EC   02F8 00E0 001E
        MVO     R0,     .BTAB.AA                ; 55EF   0240 02AA
        MVO     R0,     .BTAB.AB                ; 55F1   0240 02AB
L_55F3:
        PULR    R7                              ; 55F3   02B7

L_55F4:
        MVI     G_0169, R2                      ; 55F4   0282 0169
        DECLE   $0042,  $0092,  $0203,  $0014   ; 55F6   0042 0092 0203 0014
        DECLE   $0004,  $015C,  $02CD           ; 55FA   0004 015C 02CD

        MVII    #$001E, R2                      ; 55FD   02BA 001E
        MVO     R2,     G_0169                  ; 55FF   0242 0169
        MVI     G_0182, R0                      ; 5601   0280 0182
        DECR    R0                              ; 5603   0010
        MVO     R0,     G_0182                  ; 5604   0240 0182
        BNEQ    L_55AD                          ; 5606   022C 005A

        ADDI    #$0020, R2                      ; 5608   02FA 0020
        MVO     R2,     G_0169                  ; 560A   0242 0169
        B       L_55AD                          ; 560C   0220 0060

        CLRR    R2                              ; 560E   01D2
        MVO     R2,     G_0161                  ; 560F   0242 0161
        MVII    #$0002, R2                      ; 5611   02BA 0002
        MVO     R2,     G_015E                  ; 5613   0242 015E
        SDBD                                    ; 5615   0001
        MVII    #$5020, R1                      ; 5616   02B9 0020 0050

        JSR     R5,     .EXEC.845               ; 5619   0004 0118 0045

        SUBR    R1,     R4                      ; 561C   010C
        SUBR    R4,     R4                      ; 561D   0124
        ADDR    R2,     R4                      ; 561E   00D4
        CMPR    R7,     R0                      ; 561F   0178
        ADDR    R5,     R4                      ; 5620   00EC
        ADDR    R4,     R7                      ; 5621   00E7

        SUBR    R2,     R3                      ; 5622   0113
        SUBR    R3,     R3                      ; 5623   011B
        ADDR    R0,     R4                      ; 5624   00C4
        CMPR    R7,     R0                      ; 5625   0178
        ADDR    R7,     R4                      ; 5626   00FC
        ADDR    R4,     R7                      ; 5627   00E7

        SUBR    R2,     R4                      ; 5628   0114
        SUBR    R4,     R4                      ; 5629   0124
        ADDR    R1,     R4                      ; 562A   00CC
        CMPR    R7,     R0                      ; 562B   0178
        SUBR    R0,     R4                      ; 562C   0104
        ADDR    R4,     R7                      ; 562D   00E7

        SUBR    R1,     R4                      ; 562E   010C
        SUB@    R3,     R3                      ; 562F   031B
        ADDR    R3,     R4                      ; 5630   00DC
        CMPR    R7,     R0                      ; 5631   0178
        ADDR    R7,     R4                      ; 5632   00FC
        ADDR    R4,     R7                      ; 5633   00E7

        SUBR    R2,     R4                      ; 5634   0114
        SUBR    R4,     R4                      ; 5635   0124
        ADDR    R0,     R4                      ; 5636   00C4
        CMPR    R7,     R0                      ; 5637   0178
        ADDR    R6,     R4                      ; 5638   00F4
        ADDR    R4,     R7                      ; 5639   00E7

        SUBR    R2,     R4                      ; 563A   0114
        SUBR    R4,     R4                      ; 563B   0124
        ADDR    R2,     R4                      ; 563C   00D4
        CMPR    R7,     R0                      ; 563D   0178
        ADDR    R6,     R4                      ; 563E   00F4
        ADDR    R4,     R7                      ; 563F   00E7

        CMPR    R7,     R0                      ; 5640   0178
        CMPR    R7,     R0                      ; 5641   0178
        ADDR    R3,     R4                      ; 5642   00DC
        CMPR    R7,     R0                      ; 5643   0178
        SUBR    R0,     R4                      ; 5644   0104
        ADDR    R4,     R7                      ; 5645   00E7

        CMPR    R7,     R0                      ; 5646   0178
        CMPR    R7,     R0                      ; 5647   0178
        ADDR    R1,     R4                      ; 5648   00CC
        CMPR    R7,     R0                      ; 5649   0178
        ADDR    R5,     R4                      ; 564A   00EC
        ADDR    R4,     R7                      ; 564B   00E7

        CMPR    R7,     R0                      ; 564C   0178
        CMPR    R7,     R0                      ; 564D   0178
        ADDR    R0,     R4                      ; 564E   00C4
        CMPR    R7,     R0                      ; 564F   0178
        ADDR    R6,     R4                      ; 5650   00F4
        ADDR    R4,     R7                      ; 5651   00E7

        DECLE   $010C,  $0124,  $00DC,  $036A   ; 5652   010C 0124 00DC 036A
        DECLE   $0040,  $00E1,  $0178,  $0178   ; 5656   0040 00E1 0178 0178
        DECLE   $00C4,  $0372,  $0040,  $00E1   ; 565A   00C4 0372 0040 00E1
        DECLE   $0178,  $0178,  $00CC,  $0372   ; 565E   0178 0178 00CC 0372
        DECLE   $0040,  $00E1,  $0178,  $0178   ; 5662   0040 00E1 0178 0178
        DECLE   $00D4,  $036A,  $0040,  $00E1   ; 5666   00D4 036A 0040 00E1
        DECLE   $0178,  $0178,  $00C4,  $0178   ; 566A   0178 0178 00C4 0178
        DECLE   $00EC,  $0128,  $0028,  $01A2   ; 566E   00EC 0128 0028 01A2
        DECLE   $0065,  $00C8,  $0023,  $0004   ; 5672   0065 00C8 0023 0004

        SUBR    R0,     R7                      ; 5676   0107

        ADDR    R0,     R5                      ; 5677   00C5
        SWAP    R3,     2                       ; 5678   0047
        NEGR    R0                              ; 5679   0020
        SLR     R0,     1                       ; 567A   0060
        ADDR    R4,     R7                      ; 567B   00E7

        DECLE   $0025,  $0106,  $0062,  $0020   ; 567C   0025 0106 0062 0020
        DECLE   $0003,  $004D,  $0083,  $018A   ; 5680   0003 004D 0083 018A
        DECLE   $016A,  $016B,  $014B,  $014B   ; 5684   016A 016B 014B 014B
        DECLE   $014A,  $0128,  $00C5,  $0004   ; 5688   014A 0128 00C5 0004

        SWAP    R1,     1                       ; 568C   0041
        ADDR    R0,     R7                      ; 568D   00C7
        SUBR    R0,     R7                      ; 568E   0107

        DECLE   $00C6                           ; 568F   00C6
.GRAM_INIT_5690:
        DECLE   $0030           ; 5690  # of GRAM cards to init
        DECLE   $0061,  $0010   ; 5691  #00-00:  GROM #30-30 ----
        DECLE   $0065,  $0010   ; 5693  #01-01:  GROM #32-32 ----
        DECLE   $005F,  $0010   ; 5695  #02-02:  GROM #2F-2F ----
        DECLE   $0073,  $0010   ; 5697  #03-03:  GROM #39-39 ----
        DECLE   $004F,  $0010   ; 5699  #04-04:  GROM #27-27 ----
        DECLE   $0045,  $0010   ; 569B  #05-05:  GROM #22-22 ----
        DECLE   $006D,  $0090   ; 569D  #06-07:  GROM #36-37 ----
        DECLE   $003F,  $0030   ; 569F  #08-08:  GROM #5F-5F ----
        DECLE   $0001,  $0380   ; 56A1  #09-10:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 56A3  #11-18:  CART #08-0F ----
        DECLE   $0020           ; 56A5  #19   :  CART #10    ----
        DECLE   $02B9,  $0036   ; 56A6  #1A   :  Algo #1
        DECLE   $02A1,  $009E   ; 56A8  #1B   :  Algo #1
        DECLE   $0301,  $02F9   ; 56AA  #1C   :  Algo #2
        DECLE   $023D,  $004E   ; 56AC  #1D   :  Algo #1
        DECLE   $033D,  $02AE   ; 56AE  #1E   :  Algo #1
        DECLE   $0023,  $0380   ; 56B0  #1F-26:  CART #11-18 ----
        DECLE   $0033,  $0180   ; 56B2  #27-2A:  CART #19-1C ----
        DECLE   $0023,  $0070   ; 56B4  #2B-2B:  GROM #11-11 ----
        DECLE   $0147,  $0050   ; 56B6  #2C-2C:  GROM #23-23 -Y--
        DECLE   $001F,  $0070   ; 56B8  #2D-2D:  GROM #0F-0F ----
        DECLE   $0017,  $0070   ; 56BA  #2E-2E:  GROM #0B-0B ----
        DECLE   $0001,  $0010   ; 56BC  #2F-2F:  GROM #00-00 ----

        DECLE   $0000,  $0000,  $0020,  $0068   ; 56BE   0000 0000 0020 0068
        DECLE   $00DC,  $00FE,  $00F0,  $00E0   ; 56C2   00DC 00FE 00F0 00E0
        DECLE   $00E0,  $0060,  $0010,  $0018   ; 56C6   00E0 0060 0010 0018
        DECLE   $0014,  $0024,  $0000,  $0000   ; 56CA   0014 0024 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0068   ; 56CE   0000 0000 0020 0068
        DECLE   $00DC,  $00FE,  $00F0,  $00E0   ; 56D2   00DC 00FE 00F0 00E0
        DECLE   $00E0,  $0060,  $0020,  $0030   ; 56D6   00E0 0060 0020 0030
        DECLE   $0050,  $0088,  $0000,  $0000   ; 56DA   0050 0088 0000 0000
        DECLE   $0000,  $0020,  $0068,  $00DC   ; 56DE   0000 0020 0068 00DC
        DECLE   $00FE,  $00F0,  $00E0,  $00E0   ; 56E2   00FE 00F0 00E0 00E0
        DECLE   $0060,  $0020,  $0020,  $0030   ; 56E6   0060 0020 0020 0030
        DECLE   $0090,  $0000,  $0000,  $0000   ; 56EA   0090 0000 0000 0000
        DECLE   $0020,  $0068,  $00DC,  $00FE   ; 56EE   0020 0068 00DC 00FE
        DECLE   $00F0,  $00E0,  $00E0,  $0070   ; 56F2   00F0 00E0 00E0 0070
        DECLE   $0010,  $0030,  $0050,  $0010   ; 56F6   0010 0030 0050 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56FA   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0068,  $00DC   ; 56FE   0000 0020 0068 00DC
        DECLE   $00FE,  $00F0,  $00E0,  $00E0   ; 5702   00FE 00F0 00E0 00E0
        DECLE   $0070,  $001C,  $0012,  $0009   ; 5706   0070 001C 0012 0009
        DECLE   $0004,  $0000,  $0000,  $0000   ; 570A   0004 0000 0000 0000
        DECLE   $0040,  $0040,  $00D0,  $00B8   ; 570E   0040 0040 00D0 00B8
        DECLE   $00F8,  $00FC,  $00F4,  $00E0   ; 5712   00F8 00FC 00F4 00E0
        DECLE   $00E0,  $0060,  $0020,  $0020   ; 5716   00E0 0060 0020 0020
        DECLE   $0020,  $0020,  $0010,  $0000   ; 571A   0020 0020 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 571E   0000 0000 0000 0000
        DECLE   $0000                           ; 5722   0000

        RRC     R3,     2                       ; 5723   0077
        INCR    R7                              ; 5724   000F
        INCR    R7                              ; 5725   000F
L_5726:
        INCR    R7                              ; 5726   000F

L_5727:
        INCR    R4                              ; 5727   000C
L_5728:
        INCR    R0                              ; 5728   0008
        DECLE   $0018,  $0014,  $0024,  $0000   ; 5729   0018 0014 0024 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 572D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0037           ; 5731   0000 0000 0037

        SLL     R3,     2                       ; 5734   004F
        INCR    R7                              ; 5735   000F
        INCR    R7                              ; 5736   000F

L_5737:
        INCR    R4                              ; 5737   000C
L_5738:
        INCR    R4                              ; 5738   000C
        DECLE   $000A,  $0005,  $0004,  $0000   ; 5739   000A 0005 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573D   0000 0000 0000 0000
        DECLE   $0000                           ; 5741   0000
L_5742:
        DECR    R7                              ; 5742   0017
        ADCR    R7                              ; 5743   002F

        SLL     R3,     2                       ; 5744   004F
L_5745:
        INCR    R7                              ; 5745   000F

        INCR    R4                              ; 5746   000C
L_5747:
        INCR    R4                              ; 5747   000C
        DECLE   $0006,  $0005,  $0002,  $0000   ; 5748   0006 0005 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 574C   0000 0000 0000 0000
        DECLE   $0000,  $0037                   ; 5750   0000 0037

        SAR     R3,     2                       ; 5752   006F
        SLL     R3,     2                       ; 5753   004F
        INCR    R7                              ; 5754   000F

        INCR    R4                              ; 5755   000C
L_5756:
        INCR    R0                              ; 5756   0008
        DECLE   $0014,  $0014,  $0014,  $0000   ; 5757   0014 0014 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0037   ; 575F   0000 0000 0060 0037

        INCR    R7                              ; 5763   000F
        INCR    R7                              ; 5764   000F
L_5765:
        INCR    R7                              ; 5765   000F

L_5766:
        INCR    R4                              ; 5766   000C
L_5767:
        COMR    R0                              ; 5767   0018
        DECLE   $0030,  $0050,  $0010,  $0000   ; 5768   0030 0050 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 576C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $001F   ; 5770   0000 0000 0007 001F

        ADCR    R7                              ; 5774   002F
        ADCR    R7                              ; 5775   002F
L_5776:
        ADCR    R7                              ; 5776   002F

L_5777:
        INCR    R4                              ; 5777   000C
L_5778:
        INCR    R0                              ; 5778   0008
        DECLE   $0008,  $000C,  $0004,  $0004   ; 5779   0008 000C 0004 0004
        DECLE   $0000                           ; 577D   0000
.GFX_LIST_577E:
        DECLE   $0006,  $0009,  $0009,  $0009   ; 577E  CART PIC #00
        DECLE   $0006,  $0000,  $0040,  $0000   ; 5782  
        DECLE   $000C,  $0004,  $0004,  $0004   ; 5786  CART PIC #01
        DECLE   $000F,  $0000,  $0040,  $0000   ; 578A  
        DECLE   $000E,  $0001,  $0006,  $0008   ; 578E  CART PIC #02
        DECLE   $000F,  $0000,  $0040,  $0000   ; 5792  
        DECLE   $000E,  $0001,  $0006,  $0001   ; 5796  CART PIC #03
        DECLE   $000E,  $0000,  $0040,  $0000   ; 579A  
        DECLE   $0009,  $0009,  $000F,  $0001   ; 579E  CART PIC #04
        DECLE   $0001,  $0000,  $0040,  $0000   ; 57A2  
        DECLE   $000F,  $0008,  $0006,  $0001   ; 57A6  CART PIC #05
        DECLE   $000E,  $0000,  $0040,  $0000   ; 57AA  
        DECLE   $0006,  $0008,  $000E,  $0009   ; 57AE  CART PIC #06
        DECLE   $0006,  $0000,  $0040,  $0000   ; 57B2  
        DECLE   $000F,  $0001,  $0002,  $0004   ; 57B6  CART PIC #07
        DECLE   $0004,  $0000,  $0040,  $0000   ; 57BA  
        DECLE   $0006,  $0009,  $0006,  $0009   ; 57BE  CART PIC #08
        DECLE   $0006,  $0000,  $0040,  $0000   ; 57C2  
        DECLE   $0006,  $0009,  $0007,  $0001   ; 57C6  CART PIC #09
        DECLE   $0006,  $0000,  $0040,  $0000   ; 57CA  
        DECLE   $0000,  $0000,  $0038,  $0040   ; 57CE  CART PIC #0A
        DECLE   $0040,  $003F,  $0000,  $0000   ; 57D2  
        DECLE   $0000,  $0000,  $003F,  $0040   ; 57D6  CART PIC #0B
        DECLE   $0040,  $003F,  $0000,  $0000   ; 57DA  
        DECLE   $0000,  $0000,  $003E,  $0041   ; 57DE  CART PIC #0C
        DECLE   $0041,  $003E,  $0000,  $0000   ; 57E2  
        DECLE   $0000,  $0000,  $007F,  $0084   ; 57E6  CART PIC #0D
        DECLE   $0082,  $007C,  $0000,  $0000   ; 57EA  
        DECLE   $00FF,  $0022,  $0000,  $0000   ; 57EE  CART PIC #0E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F2  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F6  CART PIC #0F
        DECLE   $0000,  $0081,  $00BB,  $00FF   ; 57FA  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57FE  CART PIC #10
        DECLE   $0000,  $00EF,  $00FF,  $00FF   ; 5802  
        DECLE   $00FF,  $00FF,  $00FF,  $00BE   ; 5806  CART PIC #11
        DECLE   $001C,  $0000,  $0000,  $0000   ; 580A  
        DECLE   $00FF,  $00FF,  $00F9,  $005C   ; 580E  CART PIC #12
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5812  
        DECLE   $003E,  $006F,  $0053,  $007D   ; 5816  CART PIC #13
        DECLE   $00EE,  $00FE,  $00DA,  $007C   ; 581A  
        DECLE   $0000,  $0000,  $007C,  $00DE   ; 581E  CART PIC #14
        DECLE   $007E,  $00EE,  $00FA,  $007C   ; 5822  
        DECLE   $0038,  $0010,  $0010,  $0010   ; 5826  CART PIC #15
        DECLE   $0010,  $0000,  $0000,  $0000   ; 582A  
        DECLE   $00FE,  $00FA,  $007C,  $0038   ; 582E  CART PIC #16
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5832  
        DECLE   $0000,  $0060,  $0060,  $0060   ; 5836  CART PIC #17
        DECLE   $0060,  $0061,  $0061,  $0061   ; 583A  
        DECLE   $0000,  $0055,  $00AA,  $0055   ; 583E  CART PIC #18
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5842  
        DECLE   $0000,  $0054,  $00A9,  $0052   ; 5846  CART PIC #19
        DECLE   $00E5,  $00CB,  $0097,  $00AF   ; 584A  
        DECLE   $009F,  $00BF,  $00FF,  $00FF   ; 584E  CART PIC #1A
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5852  
        DECLE   $0007,  $0057,  $00A7,  $0057   ; 5856  CART PIC #1B
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 585A  
        DECLE   $0010,  $0030,  $0078,  $00FC   ; 585E  CART PIC #1C
        DECLE   $00FE,  $00FF,  $00E3,  $00C0   ; 5862  

        SDBD                                    ; 5866   0001
        MVII    #$524A, R4                      ; 5867   02BC 004A 0052
        MVO     R4,     G_035D                  ; 586A   0244 035D
        MOVR    R0,     R2                      ; 586C   0082
        ADDI    #$0002, R2                      ; 586D   02FA 0002
        ADDR    R7,     R2                      ; 586F   00FA
        ADD@    R2,     R7                      ; 5870   02D7

        DECLE   $0004                           ; 5871   0004

        DIS                                     ; 5872   0003
        SUBR    R5,     R6                      ; 5873   012E
L_5874:
        MOVR    R5,     R7                      ; 5874   00AF

        MVI     G_0121, R0                      ; 5875   0280 0121
        ADD     G_0122, R0                      ; 5877   02C0 0122
        BNEQ    L_5874                          ; 5879   022C 0006

        MVI     G_0169, R0                      ; 587B   0280 0169
        ANDI    #$0006, R0                      ; 587D   03B8 0006
        MOVR    R0,     R2                      ; 587F   0082
        SLL     R0,     2                       ; 5880   004C
        ADDR    R2,     R0                      ; 5881   00D0
        SDBD                                    ; 5882   0001
        ADDI    #$522C, R0                      ; 5883   02F8 002C 0052
        MVO     R0,     G_035D                  ; 5886   0240 035D
L_5888:
        PSHR    R5                              ; 5888   0275
        MVII    #$00F0, R0                      ; 5889   02B8 00F0
        MVII    #$0200, R4                      ; 588B   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 588D   0004 0114 0338

        MVII    #$02E2, R4                      ; 5890   02BC 02E2
        MVII    #$0005, R3                      ; 5892   02BB 0005

        JSR     R5,     X_PRINT_R5              ; 5894   0004 0118 007B
        STRING  "Race "                         ; 5897  
        DECLE   $0000                           ; 589C   0000

        MVI     G_015F, R0                      ; 589D   0280 015F
        MVII    #$0002, R1                      ; 589F   02B9 0002

        JSR     R5,     X_PRNUM_LFT             ; 58A1   0004 0118 009E

        MVII    #$0215, R4                      ; 58A4   02BC 0215
        CLRR    R3                              ; 58A6   01DB

        JSR     R5,     X_PRINT_R5              ; 58A7   0004 0118 007B
        STRING  "PL Stake  Bet *"               ; 58AA  
        DECLE   $0000                           ; 58B9   0000

        SDBD                                    ; 58BA   0001
        MVII    #$0950, R4                      ; 58BB   02BC 0050 0009
        MVO     R4,     .BTAB.25                ; 58BE   0244 0225
        MVII    #$02B6, R4                      ; 58C0   02BC 02B6
        MVII    #$0006, R2                      ; 58C2   02BA 0006
        MVII    #$0001, R1                      ; 58C4   02B9 0001
L_58C6:
        MOVR    R2,     R0                      ; 58C6   0090
        CLRR    R3                              ; 58C7   01DB

        JSR     R5,     X_PRNUM_LFT             ; 58C8   0004 0118 009E

        ADDI    #$0002, R4                      ; 58CB   02FC 0002

        JSR     R5,     X_PRINT_R5              ; 58CD   0004 0118 007B
        STRING  "$     $"                       ; 58D0  
        DECLE   $0000                           ; 58D7   0000

        SUBI    #$001D, R4                      ; 58D8   033C 001D
        DECR    R2                              ; 58DA   0012
        BNEQ    L_58C6                          ; 58DB   022C 0016

        MVII    #$02B9, R4                      ; 58DD   02BC 02B9
        MVII    #$0002, R3                      ; 58DF   02BB 0002
        MVII    #$0005, R2                      ; 58E1   02BA 0005
        MVII    #$0004, R1                      ; 58E3   02B9 0004
L_58E5:
        MOVR    R2,     R5                      ; 58E5   0095
        ADDR    R5,     R5                      ; 58E6   00ED
        ADDI    #$0176, R5                      ; 58E7   02FD 0176
        SDBD                                    ; 58E9   0001
        MVI@    R5,     R0                      ; 58EA   02A8

        JSR     R5,     X_PRNUM_RGT             ; 58EB   0004 0118 00C5

        SUBI    #$0014, R4                      ; 58EE   033C 0014
        DECR    R2                              ; 58F0   0012
        BGE     L_58E5                          ; 58F1   022D 000D

        MVII    #$016A, R2                      ; 58F3   02BA 016A
        MVII    #$0261, R4                      ; 58F5   02BC 0261
L_58F7:
        MVI@    R2,     R0                      ; 58F7   0290
        TSTR    R0                              ; 58F8   0080
        BEQ     L_5930                          ; 58F9   0204 0035

        MOVR    R0,     R3                      ; 58FB   0083
L_58FC:
        ANDI    #$0038, R3                      ; 58FC   03BB 0038
        PSHR    R3                              ; 58FE   0273
        SLR     R3,     2                       ; 58FF   0067
        MOVR    R3,     R5                      ; 5900   009D
        PULR    R3                              ; 5901   02B3
        SDBD                                    ; 5902   0001
        ADDI    #$5FC6, R5                      ; 5903   02FD 00C6 005F
        SDBD                                    ; 5906   0001
        ADD@    R5,     R3                      ; 5907   02EB
        SDBD                                    ; 5908   0001
        ADDI    #$0800, R3                      ; 5909   02FB 0000 0008
        MVO@    R3,     R4                      ; 590C   0263
        MOVR    R0,     R3                      ; 590D   0083
        SLL     R3,     2                       ; 590E   004F
        SLL     R3,     1                       ; 590F   004B
        SUBI    #$00C0, R0                      ; 5910   0338 00C0
        BPL     L_58FC                          ; 5912   0223 0017

        ANDI    #$03FE, R4                      ; 5914   03BC 03FE
        SUBI    #$0003, R4                      ; 5916   033C 0003
        MVI@    R2,     R0                      ; 5918   0290
        MVII    #$01BB, R3                      ; 5919   02BB 01BB
        ANDI    #$0040, R0                      ; 591B   03B8 0040
        BEQ     L_5921                          ; 591D   0204 0002

        MVII    #$012B, R3                      ; 591F   02BB 012B
L_5921:
        MVO@    R3,     R4                      ; 5921   0263
        SUBI    #$0005, R4                      ; 5922   033C 0005
        INCR    R2                              ; 5924   000A
        MVI@    R2,     R0                      ; 5925   0290
        MVII    #$0003, R1                      ; 5926   02B9 0003
        MVII    #$0002, R3                      ; 5928   02BB 0002

        JSR     R5,     X_PRNUM_RGT             ; 592A   0004 0118 00C5

        ADDI    #$0006, R4                      ; 592D   02FC 0006
        DECR    R2                              ; 592F   0012
L_5930:
        ADDI    #$0014, R4                      ; 5930   02FC 0014
        ADDI    #$0002, R2                      ; 5932   02FA 0002
        CMPI    #$0176, R2                      ; 5934   037A 0176
        BNC     L_58F7                          ; 5936   0229 0040

        JSR     R5,     L_5220                  ; 5938   0004 0150 0220
        DECLE   $0200                           ; 593B   0200

        MOVR    R1,     R4                      ; 593C   008C
        MVI     G_01EB, R2                      ; 593D   0282 01EB
        SLL     R2,     1                       ; 593F   004A
        ADDI    #$016A, R2                      ; 5940   02FA 016A
        MVI     G_0169, R5                      ; 5942   0285 0169
        INCR    R5                              ; 5944   000D
        ADDR    R7,     R5                      ; 5945   00FD
        ADD@    R5,     R7                      ; 5946   02EF

        DECLE   $0046,  $0039,  $001A,  $0005   ; 5947   0046 0039 001A 0005
        DECLE   $0027                           ; 594B   0027

        ADDI    #$0061, R4                      ; 594C   02FC 0061
        MVI@    R2,     R0                      ; 594E   0290
        ANDI    #$0038, R0                      ; 594F   03B8 0038
        MOVR    R0,     R3                      ; 5951   0083
        SLR     R3,     2                       ; 5952   0067
        SDBD                                    ; 5953   0001
        ADDI    #$5FC6, R3                      ; 5954   02FB 00C6 005F
        MOVR    R3,     R5                      ; 5957   009D
        SDBD                                    ; 5958   0001
        ADD@    R5,     R0                      ; 5959   02E8
        SDBD                                    ; 595A   0001
        ADDI    #$0800, R0                      ; 595B   02F8 0000 0008
        MVO@    R0,     R4                      ; 595E   0260
        B       L_5963                          ; 595F   0200 0002

        ADDI    #$0061, R4                      ; 5961   02FC 0061
L_5963:
        SDBD                                    ; 5963   0001
        MVII    #$1603, R0                      ; 5964   02B8 0003 0016
        MVO@    R0,     R4                      ; 5967   0260
        ANDI    #$03FE, R4                      ; 5968   03BC 03FE
        SUBI    #$0003, R4                      ; 596A   033C 0003
        B       L_5970                          ; 596C   0200 0002

        ADDI    #$005F, R4                      ; 596E   02FC 005F
L_5970:
        MVII    #$01BB, R0                      ; 5970   02B8 01BB
        MVI@    R2,     R3                      ; 5972   0293
        ANDI    #$0040, R3                      ; 5973   03BB 0040
        BEQ     L_5979                          ; 5975   0204 0002

        MVII    #$012B, R0                      ; 5977   02B8 012B
L_5979:
        MVO@    R0,     R4                      ; 5979   0260
        SUBI    #$0005, R4                      ; 597A   033C 0005
        INCR    R2                              ; 597C   000A
        MVI@    R2,     R0                      ; 597D   0290
        B       L_5987                          ; 597E   0200 0007

        ADDI    #$005A, R4                      ; 5980   02FC 005A
        MVII    #$0023, R0                      ; 5982   02B8 0023
        MVO@    R0,     R4                      ; 5984   0260
        MVI     G_0135, R0                      ; 5985   0280 0135
L_5987:
        MVII    #$0003, R1                      ; 5987   02B9 0003
        MVII    #$0002, R3                      ; 5989   02BB 0002
        B       L_599B                          ; 598B   0200 000E

        MVII    #$023D, R4                      ; 598D   02BC 023D
        MVII    #$0053, R0                      ; 598F   02B8 0053
        MVO@    R0,     R4                      ; 5991   0260
        MVII    #$0001, R1                      ; 5992   02B9 0001
        MVII    #$0003, R3                      ; 5994   02BB 0003
        MVI     G_0135, R0                      ; 5996   0280 0135
        TSTR    R0                              ; 5998   0080
        BEQ     L_599E                          ; 5999   0204 0003

L_599B:
        JSR     R5,     X_PRNUM_RGT             ; 599B   0004 0118 00C5

L_599E:
        PULR    R7                              ; 599E   02B7

        PSHR    R5                              ; 599F   0275
        MVII    #$0183, R4                      ; 59A0   02BC 0183
        MVI@    R4,     R3                      ; 59A2   02A3
        ADD@    R4,     R3                      ; 59A3   02E3
        ADD@    R4,     R3                      ; 59A4   02E3
        ADD@    R4,     R3                      ; 59A5   02E3
        SLL     R3,     2                       ; 59A6   004F
        MVII    #$0183, R4                      ; 59A7   02BC 0183
L_59A9:
        MOVR    R3,     R1                      ; 59A9   0099
        MVI@    R4,     R2                      ; 59AA   02A2

        JSR     R5,     X_DIVR                  ; 59AB   0004 011C 01F8

        SUBI    #$0004, R0                      ; 59AE   0338 0004
        MOVR    R0,     R1                      ; 59B0   0081
        ANDI    #$0003, R0                      ; 59B1   03B8 0003
        CMPI    #$0002, R0                      ; 59B3   0378 0002
        BNEQ    L_59B8                          ; 59B5   020C 0001

        INCR    R1                              ; 59B7   0009
L_59B8:
        BC      L_59BB                          ; 59B8   0201 0001

        SLR     R1,     1                       ; 59BA   0061
L_59BB:
        ADDI    #$0007, R4                      ; 59BB   02FC 0007
        MVO@    R1,     R4                      ; 59BD   0261
        SUBI    #$0008, R4                      ; 59BE   033C 0008
        CMPI    #$0187, R4                      ; 59C0   037C 0187
        BNC     L_59A9                          ; 59C2   0229 001A

        MVII    #$00F0, R0                      ; 59C4   02B8 00F0
        MVII    #$0200, R4                      ; 59C6   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 59C8   0004 0114 0338

        CLRR    R3                              ; 59CB   01DB
        MVII    #$0201, R4                      ; 59CC   02BC 0201

        JSR     R5,     X_PRINT_R5              ; 59CE   0004 0118 007B
        STRING  "Race length:   frlg "          ; 59D1  
        STRING  "Conditions: "                  ; 59E5  
        DECLE   $0000                           ; 59F1   0000

        MVII    #$020D, R4                      ; 59F2   02BC 020D
        MVII    #$0007, R3                      ; 59F4   02BB 0007
        MVII    #$0002, R1                      ; 59F6   02B9 0002
        MVI     G_0182, R0                      ; 59F8   0280 0182
        ANDI    #$0007, R0                      ; 59FA   03B8 0007
        ADDI    #$0003, R0                      ; 59FC   02F8 0003

        JSR     R5,     X_PRNUM_RGT             ; 59FE   0004 0118 00C5

        MVI     G_0182, R3                      ; 5A01   0283 0182
        ANDI    #$0018, R3                      ; 5A03   03BB 0018
        MOVR    R3,     R1                      ; 5A05   0099
        SLR     R3,     2                       ; 5A06   0067
        ADDR    R3,     R1                      ; 5A07   00D9
        SLR     R1,     1                       ; 5A08   0061
        ADDR    R7,     R1                      ; 5A09   00F9
        ADDI    #$00B0, R1                      ; 5A0A   02F9 00B0
        MVII    #$0007, R3                      ; 5A0C   02BB 0007
        MVII    #$0221, R4                      ; 5A0E   02BC 0221

        JSR     R5,     X_PRINT_R1              ; 5A10   0004 0118 0067

        MVII    #$0003, R1                      ; 5A13   02B9 0003
L_5A15:
        MOVR    R1,     R3                      ; 5A15   008B
        ADDI    #$0187, R3                      ; 5A16   02FB 0187
        MVI@    R3,     R2                      ; 5A18   029A
        PSHR    R1                              ; 5A19   0271
        PSHR    R1                              ; 5A1A   0271
        MVII    #$023D, R4                      ; 5A1B   02BC 023D
        RRC     R1,     1                       ; 5A1D   0071
        BNC     L_5A22                          ; 5A1E   0209 0002

        ADDI    #$000A, R4                      ; 5A20   02FC 000A
L_5A22:
        RRC     R1,     1                       ; 5A22   0071
        BNC     L_5A27                          ; 5A23   0209 0002

        ADDI    #$0064, R4                      ; 5A25   02FC 0064
L_5A27:
        MOVR    R2,     R1                      ; 5A27   0091
        SLL     R1,     2                       ; 5A28   004D
        SDBD                                    ; 5A29   0001
        ADDI    #$5F98, R1                      ; 5A2A   02F9 0098 005F
        CLRR    R3                              ; 5A2D   01DB

        JSR     R5,     X_PRINT_R1              ; 5A2E   0004 0118 0067

        PULR    R1                              ; 5A31   02B1
        ADDI    #$018B, R1                      ; 5A32   02F9 018B
        PSHR    R2                              ; 5A34   0272
        MVI@    R1,     R0                      ; 5A35   0288
        RRC     R0,     1                       ; 5A36   0070
        MVII    #$0001, R2                      ; 5A37   02BA 0001
        ADCR    R2                              ; 5A39   002A
        MVII    #$0002, R1                      ; 5A3A   02B9 0002
        MVII    #$0007, R3                      ; 5A3C   02BB 0007
        ADDI    #$0002, R4                      ; 5A3E   02FC 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A40   0004 0118 00C5

        ADDI    #$0002, R4                      ; 5A43   02FC 0002
        DECR    R1                              ; 5A45   0011
        MOVR    R2,     R0                      ; 5A46   0090
        NEGR    R0                              ; 5A47   0020

        JSR     R5,     X_PRNUM_LFT             ; 5A48   0004 0118 009E

        ADDI    #$0002, R4                      ; 5A4B   02FC 0002
        PULR    R2                              ; 5A4D   02B2
        CLRR    R0                              ; 5A4E   01C0
L_5A4F:
        PSHR    R0                              ; 5A4F   0270
        ADDI    #$000B, R4                      ; 5A50   02FC 000B
        MOVR    R0,     R1                      ; 5A52   0081
        ADDR    R1,     R1                      ; 5A53   00C9
        ADDR    R0,     R1                      ; 5A54   00C1
        SLL     R1,     2                       ; 5A55   004D
        SLL     R1,     1                       ; 5A56   0049
        ADDR    R2,     R1                      ; 5A57   00D1
        ADDR    R2,     R1                      ; 5A58   00D1
        ADDR    R2,     R1                      ; 5A59   00D1
        ADDI    #$0191, R1                      ; 5A5A   02F9 0191
        MVI@    R1,     R3                      ; 5A5C   028B
        MOVR    R3,     R0                      ; 5A5D   0098
        ANDI    #$0018, R3                      ; 5A5E   03BB 0018
        CMPI    #$0080, R0                      ; 5A60   0378 0080
        BC      L_5AAF                          ; 5A62   0201 004B

        ANDI    #$0060, R0                      ; 5A64   03B8 0060
        SLR     R0,     2                       ; 5A66   0064
        SLR     R0,     2                       ; 5A67   0064
        MOVR    R0,     R5                      ; 5A68   0085
        SDBD                                    ; 5A69   0001
        ADDI    #$5FB8, R5                      ; 5A6A   02FD 00B8 005F
        SDBD                                    ; 5A6D   0001
        MVI@    R5,     R0                      ; 5A6E   02A8
        SDBD                                    ; 5A6F   0001
        ADDI    #$0898, R0                      ; 5A70   02F8 0098 0008
        ADDR    R3,     R0                      ; 5A73   00D8
        MVO@    R0,     R4                      ; 5A74   0260
        INCR    R4                              ; 5A75   000C
        DECR    R1                              ; 5A76   0011
        MVI@    R1,     R0                      ; 5A77   0288
        ANDI    #$00F8, R0                      ; 5A78   03B8 00F8
        SLL     R0,     2                       ; 5A7A   004C
        DECR    R1                              ; 5A7B   0011
        MVI@    R1,     R3                      ; 5A7C   028B
        ANDI    #$00F8, R3                      ; 5A7D   03BB 00F8
        SLR     R3,     2                       ; 5A7F   0067
        SLR     R3,     1                       ; 5A80   0063
        ADDR    R3,     R0                      ; 5A81   00D8
        PSHR    R1                              ; 5A82   0271
        MVII    #$0003, R1                      ; 5A83   02B9 0003
        CLRR    R3                              ; 5A85   01DB

        JSR     R5,     X_PRNUM_ZRO             ; 5A86   0004 0118 00AD

        ADDI    #$0002, R4                      ; 5A89   02FC 0002
        MVI@    R4,     R0                      ; 5A8B   02A0
        DECR    R4                              ; 5A8C   0014
        SDBD                                    ; 5A8D   0001
        ADDI    #$07C8, R0                      ; 5A8E   02F8 00C8 0007
        MVO@    R0,     R4                      ; 5A91   0260
        MVII    #$0003, R5                      ; 5A92   02BD 0003
        PULR    R1                              ; 5A94   02B1
        INCR    R4                              ; 5A95   000C
L_5A96:
        MVI@    R1,     R3                      ; 5A96   028B
        ANDI    #$0007, R3                      ; 5A97   03BB 0007
        MOVR    R3,     R0                      ; 5A99   0098
        SLL     R0,     2                       ; 5A9A   004C
        SLL     R0,     1                       ; 5A9B   0048
        SDBD                                    ; 5A9C   0001
        ADDI    #$0800, R0                      ; 5A9D   02F8 0000 0008
        SLL     R3,     1                       ; 5AA0   004B
        SDBD                                    ; 5AA1   0001
        ADDI    #$5FC6, R3                      ; 5AA2   02FB 00C6 005F
        ADD@    R3,     R0                      ; 5AA5   02D8
        INCR    R3                              ; 5AA6   000B
        MVI@    R3,     R3                      ; 5AA7   029B
        SWAP    R3,     1                       ; 5AA8   0043
        ADDR    R3,     R0                      ; 5AA9   00D8
        MVO@    R0,     R4                      ; 5AAA   0260
        INCR    R1                              ; 5AAB   0009
        DECR    R5                              ; 5AAC   0015
        BNEQ    L_5A96                          ; 5AAD   022C 0018

L_5AAF:
        PULR    R0                              ; 5AAF   02B0
        INCR    R0                              ; 5AB0   0008
        CMPI    #$0003, R0                      ; 5AB1   0378 0003
        BNEQ    L_5A4F                          ; 5AB3   022C 0065

        PULR    R1                              ; 5AB5   02B1
        DECR    R1                              ; 5AB6   0011
        BPL     L_5A15                          ; 5AB7   0223 00A3
        PULR    R7                              ; 5AB9   02B7

        DECLE   $0044,  $0052,  $0059,  $0020   ; 5ABA   0044 0052 0059 0020
        DECLE   $0000,  $0054,  $0055,  $0052   ; 5ABE   0000 0054 0055 0052
        DECLE   $0046,  $0000,  $004D,  $0055   ; 5AC2   0046 0000 004D 0055
        DECLE   $0044,  $0044,  $0059,  $0000   ; 5AC6   0044 0044 0059 0000

        PSHR    R5                              ; 5ACA   0275
        MOVR    R0,     R4                      ; 5ACB   0084

        JSR     R5,     L_5AEE                  ; 5ACC   0004 0158 02EE

        MOVR    R1,     R0                      ; 5ACF   0088
        ADDI    #$0002, R0                      ; 5AD0   02F8 0002
        SLL     R0,     1                       ; 5AD2   0048

        JSR     R5,     .EXEC.76C               ; 5AD3   0004 0114 036C

        ADDI    #$0004, R1                      ; 5AD6   02F9 0004
        MVI@    R1,     R0                      ; 5AD8   0288
        SWAP    R0,     1                       ; 5AD9   0040
        SLR     R0,     2                       ; 5ADA   0064
        ANDI    #$007F, R0                      ; 5ADB   03B8 007F
        TSTR    R4                              ; 5ADD   00A4
        BPL     L_5AE1                          ; 5ADE   0203 0001

        CLRR    R0                              ; 5AE0   01C0
L_5AE1:
        CMPI    #$0008, R4                      ; 5AE1   037C 0008
        BGE     L_5AE6                          ; 5AE3   020D 0001

        NEGR    R0                              ; 5AE5   0020
L_5AE6:
        MVII    #$00FF, R3                      ; 5AE6   02BB 00FF
        ANDR    R3,     R0                      ; 5AE8   0198
        SWAP    R3,     1                       ; 5AE9   0043
        AND@    R1,     R3                      ; 5AEA   038B
        ADDR    R0,     R3                      ; 5AEB   00C3
        MVO@    R3,     R1                      ; 5AEC   024B
        PULR    R7                              ; 5AED   02B7

L_5AEE:
        PSHR    R5                              ; 5AEE   0275
        MOVR    R1,     R0                      ; 5AEF   0088
        ADDI    #$0006, R0                      ; 5AF0   02F8 0006

        JSR     R5,     X_POW2                  ; 5AF2   0004 0114 0345

        COMR    R0                              ; 5AF5   0018
        AND     G_01EE, R0                      ; 5AF6   0380 01EE
        MVO     R0,     G_01EE                  ; 5AF8   0240 01EE
        PULR    R7                              ; 5AFA   02B7

        PSHR    R5                              ; 5AFB   0275
        ANDI    #$00FE, R0                      ; 5AFC   03B8 00FE
        ANDI    #$00FE, R3                      ; 5AFE   03BB 00FE
        CMPR    R0,     R3                      ; 5B00   0143
        BEQ     L_5B4A                          ; 5B01   0204 0047

        JSR     R5,     .EXEC.76C               ; 5B03   0004 0114 036C

        SDBD                                    ; 5B06   0001
        MVII    #$1008, R4                      ; 5B07   02BC 0008 0010

        JSR     R5,     .EXEC.70F               ; 5B0A   0004 0114 030F

        ADDI    #$0004, R1                      ; 5B0D   02F9 0004
        SLL     R3,     2                       ; 5B0F   004F
        SLL     R3,     1                       ; 5B10   004B
        ADDI    #$0321, R3                      ; 5B11   02FB 0321
        CMPR    R4,     R5                      ; 5B13   0165
        BLT     L_5B2B                          ; 5B14   0205 0015

        MVII    #$00FF, R4                      ; 5B16   02BC 00FF
        COMR    R4                              ; 5B18   001C
        MVI@    R1,     R0                      ; 5B19   0288
        ANDR    R4,     R0                      ; 5B1A   01A0
        MVO@    R0,     R1                      ; 5B1B   0248
        AND@    R3,     R4                      ; 5B1C   039C
        MVO@    R4,     R3                      ; 5B1D   025C
        DECR    R1                              ; 5B1E   0011
        MOVR    R5,     R0                      ; 5B1F   00A8
        SLL     R0,     2                       ; 5B20   004C
        DECR    R3                              ; 5B21   0013
        MVI@    R1,     R5                      ; 5B22   028D
        CMP@    R3,     R5                      ; 5B23   035D
        BGE     L_5B27                          ; 5B24   020D 0001

        NEGR    R0                              ; 5B26   0020
L_5B27:
        ADDR    R0,     R5                      ; 5B27   00C5
        MVO@    R5,     R1                      ; 5B28   024D
        INCR    R1                              ; 5B29   0009
        INCR    R3                              ; 5B2A   000B
L_5B2B:
        MVII    #$0002, R4                      ; 5B2B   02BC 0002
        SUBR    R4,     R1                      ; 5B2D   0121
        SUBR    R4,     R3                      ; 5B2E   0123
        MVI@    R1,     R5                      ; 5B2F   028D
        CMP@    R3,     R5                      ; 5B30   035D
        BGT     L_5B36                          ; 5B31   020E 0003

        MOVR    R1,     R5                      ; 5B33   008D
        MOVR    R3,     R1                      ; 5B34   0099
        MOVR    R5,     R3                      ; 5B35   00AB
L_5B36:
        ADDR    R4,     R1                      ; 5B36   00E1
        ADDR    R4,     R3                      ; 5B37   00E3
        MVII    #$00FF, R2                      ; 5B38   02BA 00FF
        MVI@    R3,     R0                      ; 5B3A   0298
        ANDR    R2,     R0                      ; 5B3B   0190
        MVI@    R1,     R5                      ; 5B3C   028D
        SWAP    R2,     1                       ; 5B3D   0042
        ANDR    R2,     R5                      ; 5B3E   0195
        MVI@    R3,     R4                      ; 5B3F   029C
        ANDR    R2,     R4                      ; 5B40   0194
        CMPR    R4,     R5                      ; 5B41   0165
        BGT     L_5B4A                          ; 5B42   020E 0006

        MOVR    R5,     R1                      ; 5B44   00A9
        SAR     R1,     2                       ; 5B45   006D
        SUBR    R1,     R5                      ; 5B46   010D
        ANDR    R2,     R5                      ; 5B47   0195
        ADDR    R5,     R0                      ; 5B48   00E8
        MVO@    R0,     R3                      ; 5B49   0258
L_5B4A:
        PULR    R7                              ; 5B4A   02B7

        PSHR    R5                              ; 5B4B   0275
        DECR    R0                              ; 5B4C   0010
        DECR    R1                              ; 5B4D   0011
        MOVR    R0,     R3                      ; 5B4E   0083
        SLR     R3,     1                       ; 5B4F   0063
        ADDI    #$01DB, R3                      ; 5B50   02FB 01DB
        MVI@    R3,     R4                      ; 5B52   029C
        NEGR    R4                              ; 5B53   0024
        ADD@    R1,     R4                      ; 5B54   02CC
        MVO@    R4,     R1                      ; 5B55   024C
        SUBI    #$0004, R3                      ; 5B56   033B 0004
        MVI@    R3,     R2                      ; 5B58   029A
        TSTR    R4                              ; 5B59   00A4
        BPL     L_5B66                          ; 5B5A   0203 000A

        CMPI    #$0003, R2                      ; 5B5C   037A 0003
        BEQ     L_5B66                          ; 5B5E   0204 0006

        CMPI    #$0005, R2                      ; 5B60   037A 0005
        BEQ     L_5B66                          ; 5B62   0204 0002

        INCR    R2                              ; 5B64   000A
        MVO@    R2,     R3                      ; 5B65   025A
L_5B66:
        DECR    R2                              ; 5B66   0012
        SLL     R2,     1                       ; 5B67   004A

        JSR     R5,     L_5BF7                  ; 5B68   0004 0158 03F7

        SLR     R2,     1                       ; 5B6B   0062
        PSHR    R0                              ; 5B6C   0270
        TSTR    R4                              ; 5B6D   00A4
        BPL     L_5B74                          ; 5B6E   0203 0004

        MVI@    R5,     R0                      ; 5B70   02A8
        SWAP    R0,     1                       ; 5B71   0040
        MVO@    R0,     R1                      ; 5B72   0248
        MOVR    R0,     R4                      ; 5B73   0084
L_5B74:
        ADDI    #$0004, R3                      ; 5B74   02FB 0004
        MVI@    R3,     R4                      ; 5B76   029C
        SUB@    R6,     R4                      ; 5B77   0334
        BEQ     L_5B9C                          ; 5B78   0204 0022

        JSR     R5,     L_5BEE                  ; 5B7A   0004 0158 03EE
        DECLE   $000A                           ; 5B7D   000A

        CMPI    #$0002, R2                      ; 5B7E   037A 0002
        BLE     L_5B83                          ; 5B80   0206 0001

        MVI@    R5,     R0                      ; 5B82   02A8
L_5B83:
        TSTR    R4                              ; 5B83   00A4
        BMI     L_5B87                          ; 5B84   020B 0001

        NEGR    R0                              ; 5B86   0020
L_5B87:
        ADD@    R3,     R0                      ; 5B87   02D8
        MVO@    R0,     R3                      ; 5B88   0258
        SLL     R2,     1                       ; 5B89   004A

        JSR     R5,     L_5BF7                  ; 5B8A   0004 0158 03F7

        SLR     R2,     1                       ; 5B8D   0062
        CLRR    R5                              ; 5B8E   01ED
        TSTR    R4                              ; 5B8F   00A4
        BPL     L_5B93                          ; 5B90   0203 0001

        COMR    R5                              ; 5B92   001D
L_5B93:
        MOVR    R0,     R4                      ; 5B93   0084
        SUB@    R3,     R4                      ; 5B94   031C
        BPL     L_5B98                          ; 5B95   0203 0001

        COMR    R5                              ; 5B97   001D
L_5B98:
        TSTR    R5                              ; 5B98   00AD
        BNEQ    L_5B9C                          ; 5B99   020C 0001

        MVO@    R0,     R3                      ; 5B9B   0258
L_5B9C:
        CMPI    #$0002, R2                      ; 5B9C   037A 0002
        BC      L_5BB2                          ; 5B9E   0201 0012

        ADDI    #$0004, R3                      ; 5BA0   02FB 0004
        MVI@    R3,     R0                      ; 5BA2   0298
        SUBI    #$0004, R3                      ; 5BA3   033B 0004
        DECR    R0                              ; 5BA5   0010
        BNEQ    L_5BB2                          ; 5BA6   020C 000A

        JSR     R5,     L_5BEE                  ; 5BA8   0004 0158 03EE
        DECLE   $000C                           ; 5BAB   000C

        PSHR    R0                              ; 5BAC   0270
        ADD@    R3,     R0                      ; 5BAD   02D8
        MVO@    R0,     R3                      ; 5BAE   0258
        MVI@    R1,     R0                      ; 5BAF   0288
        SUB@    R6,     R0                      ; 5BB0   0330
        MVO@    R0,     R1                      ; 5BB1   0248

L_5BB2:
        JSR     R5,     L_5BEE                  ; 5BB2   0004 0158 03EE
        DECLE   $000D                           ; 5BB5   000D

        MVI     .BTAB.05,R5                     ; 5BB6   0285 0205
        SDBD                                    ; 5BB8   0001
        SUBI    #$095B, R5                      ; 5BB9   033D 005B 0009
        BNEQ    L_5BBF                          ; 5BBC   020C 0001

        CLRR    R0                              ; 5BBE   01C0
L_5BBF:
        DECR    R5                              ; 5BBF   0015
        BNEQ    L_5BC3                          ; 5BC0   020C 0001

        SAR     R0,     1                       ; 5BC2   0068
L_5BC3:
        NEGR    R0                              ; 5BC3   0020
        ADD@    R3,     R0                      ; 5BC4   02D8

        JSR     R5,     X_CLAMP                 ; 5BC5   0004 0114 0270

        COMR    R0                              ; 5BC8   0018
        SARC    R3,     2                       ; 5BC9   007F
        MVO@    R0,     R3                      ; 5BCA   0258
        SUBI    #$0004, R1                      ; 5BCB   0339 0004
        MVI@    R1,     R0                      ; 5BCD   0288
        SWAP    R0,     1                       ; 5BCE   0040
        ANDI    #$00FF, R0                      ; 5BCF   03B8 00FF
        NEGR    R0                              ; 5BD1   0020
        SAR     R0,     2                       ; 5BD2   006C
        ADDI    #$0111, R0                      ; 5BD3   02F8 0111
        PSHR    R1                              ; 5BD5   0271
        MVI@    R3,     R1                      ; 5BD6   0299

        JSR     R5,     X_MPY                   ; 5BD7   0004 011C 01DC

        ADDI    #$0080, R2                      ; 5BDA   02FA 0080
        SDBD                                    ; 5BDC   0001
        ANDI    #$FF00, R2                      ; 5BDD   03BA 0000 00FF
        PULR    R1                              ; 5BE0   02B1
        ADDI    #$0001, R1                      ; 5BE1   02F9 0001
        MVI@    R1,     R4                      ; 5BE3   028C
        ANDI    #$00FF, R4                      ; 5BE4   03BC 00FF
        ADDR    R4,     R2                      ; 5BE6   00E2
        MVO@    R2,     R1                      ; 5BE7   024A
        ADDI    #$000A, R1                      ; 5BE8   02F9 000A
        MVII    #$0004, R0                      ; 5BEA   02B8 0004
        MVO@    R0,     R1                      ; 5BEC   0248
        PULR    R7                              ; 5BED   02B7

L_5BEE:
        MVI@    R5,     R0                      ; 5BEE   02A8
        PSHR    R5                              ; 5BEF   0275
        PSHR    R2                              ; 5BF0   0272
        MOVR    R0,     R2                      ; 5BF1   0082

        JSR     R5,     L_5BF7                  ; 5BF2   0004 0158 03F7

        PULR    R2                              ; 5BF5   02B2
        PULR    R7                              ; 5BF6   02B7

L_5BF7:
        PSHR    R5                              ; 5BF7   0275

        JSR     R5,     .EXEC.766               ; 5BF8   0004 0114 0366

        SLR     R0,     1                       ; 5BFB   0060
        MOVR    R0,     R5                      ; 5BFC   0085
        ADDI    #$0187, R5                      ; 5BFD   02FD 0187
        MVI@    R5,     R5                      ; 5BFF   02AD
        ADDI    #$01E3, R5                      ; 5C00   02FD 01E3
        MVI@    R5,     R0                      ; 5C02   02A8
        SLL     R0,     2                       ; 5C03   004C
        SLL     R0,     2                       ; 5C04   004C
        MOVR    R0,     R5                      ; 5C05   0085
        ADDR    R7,     R5                      ; 5C06   00FD
        ADDI    #$0005, R5                      ; 5C07   02FD 0005
        ADDR    R2,     R5                      ; 5C09   00D5
        MVI@    R5,     R0                      ; 5C0A   02A8
        PULR    R7                              ; 5C0B   02B7

        DECLE   $0050,  $0009,  $0048,  $0012   ; 5C0C   0050 0009 0048 0012
        DECLE   $003C,  $007F,  $0050,  $000C   ; 5C10   003C 007F 0050 000C
        DECLE   $0023,  $0010,  $0005,  $000A   ; 5C14   0023 0010 0005 000A
        DECLE   $0006,  $0004,  $0000,  $0003   ; 5C18   0006 0004 0000 0003
        DECLE   $004A,  $0009,  $0046,  $0012   ; 5C1C   004A 0009 0046 0012
        DECLE   $0042,  $007F,  $004C,  $000C   ; 5C20   0042 007F 004C 000C
        DECLE   $0025,  $0011,  $0004,  $0006   ; 5C24   0025 0011 0004 0006
        DECLE   $0006,  $0001,  $0000,  $0003   ; 5C28   0006 0001 0000 0003
        DECLE   $0055,  $0005                   ; 5C2C   0055 0005

        SLL     R1,     1                       ; 5C2E   0049
        INCR    R6                              ; 5C2F   000E
        RSWD    R1                              ; 5C30   0039
        SARC    R3,     2                       ; 5C31   007F
        RLC     R1,     2                       ; 5C32   0055
        SETC                                    ; 5C33   0007
        COMR    R1                              ; 5C34   0019
        INCR    R7                              ; 5C35   000F

        INCR    R0                              ; 5C36   0008
L_5C37:
        INCR    R4                              ; 5C37   000C
        DECLE   $000E,  $0006,  $0000           ; 5C38   000E 0006 0000

        DIS                                     ; 5C3B   0003
        SLL     R1,     2                       ; 5C3C   004D
        INCR    R4                              ; 5C3D   000C
        SWAP    R0,     1                       ; 5C3E   0040
        DECR    R6                              ; 5C3F   0016
        RSWD    R6                              ; 5C40   003E
        SARC    R3,     2                       ; 5C41   007F
        SLL     R0,     1                       ; 5C42   0048
L_5C43:
        DECR    R7                              ; 5C43   0017

        DECLE   $0020,  $0018,  $0006,  $0003   ; 5C44   0020 0018 0006 0003
        DECLE   $0008,  $0004,  $0000,  $0003   ; 5C48   0008 0004 0000 0003
        DECLE   $004E,  $000A,  $0048,  $0010   ; 5C4C   004E 000A 0048 0010
        DECLE   $003F,  $007F,  $0051,  $000B   ; 5C50   003F 007F 0051 000B
        DECLE   $001E,  $000D,  $0006,  $0005   ; 5C54   001E 000D 0006 0005
        DECLE   $0009,  $0005,  $0000           ; 5C58   0009 0005 0000

        DIS                                     ; 5C5B   0003
        RLC     R0,     2                       ; 5C5C   0054
        INCR    R0                              ; 5C5D   0008
        SLL     R3,     1                       ; 5C5E   004B
        INCR    R7                              ; 5C5F   000F

        RSWD    R5                              ; 5C60   003D
L_5C61:
        SARC    R3,     2                       ; 5C61   007F
        DECLE   $004F,  $000E,  $001F,  $0012   ; 5C62   004F 000E 001F 0012
        DECLE   $0003,  $0007,  $0007,  $0000   ; 5C66   0003 0007 0007 0000
        DECLE   $0000,  $0003,  $0054,  $000B   ; 5C6A   0000 0003 0054 000B
        DECLE   $004D,  $0015,  $003B,  $007F   ; 5C6E   004D 0015 003B 007F
        DECLE   $004B,  $0008,  $0023,  $000C   ; 5C72   004B 0008 0023 000C
        DECLE   $0008,  $000F,  $000C,  $0005   ; 5C76   0008 000F 000C 0005
        DECLE   $0000,  $0003,  $0050,  $0007   ; 5C7A   0000 0003 0050 0007
        DECLE   $0047,  $0014,  $0041,  $007F   ; 5C7E   0047 0014 0041 007F
        DECLE   $0051,  $0011,  $001C,  $000B   ; 5C82   0051 0011 001C 000B
        DECLE   $0002,  $0005,  $000D,  $0004   ; 5C86   0002 0005 000D 0004
        DECLE   $0000                           ; 5C8A   0000

        DIS                                     ; 5C8B   0003
        RLC     R3,     2                       ; 5C8C   0057
        INCR    R0                              ; 5C8D   0008
        SWAP    R0,     2                       ; 5C8E   0044
        DECR    R1                              ; 5C8F   0011
        RSWD    R2                              ; 5C90   003A
        SARC    R3,     2                       ; 5C91   007F
        RLC     R3,     1                       ; 5C92   0053
        INCR    R5                              ; 5C93   000D
L_5C94:
        DECR    R7                              ; 5C94   0017

        DECLE   $0015,  $0007,  $0009,  $0007   ; 5C95   0015 0007 0009 0007
        DECLE   $0005,  $0000,  $0003,  $004A   ; 5C99   0005 0000 0003 004A
        DECLE   $000E,  $0041,  $0012,  $003E   ; 5C9D   000E 0041 0012 003E
        DECLE   $007F,  $004A,  $0005,  $002D   ; 5CA1   007F 004A 0005 002D
        DECLE   $000E,  $0004,  $0004,  $0008   ; 5CA5   000E 0004 0004 0008
        DECLE   $0001,  $0000                   ; 5CA9   0001 0000

        DIS                                     ; 5CAB   0003
        SLL     R0,     2                       ; 5CAC   004C
        INCR    R4                              ; 5CAD   000C
        SLL     R2,     2                       ; 5CAE   004E
        COMR    R0                              ; 5CAF   0018
        SWAP    R0,     1                       ; 5CB0   0040
        SARC    R3,     2                       ; 5CB1   007F
        SLL     R2,     2                       ; 5CB2   004E
        INCR    R7                              ; 5CB3   000F

        NEGR    R3                              ; 5CB4   0023
L_5CB5:
        INCR    R4                              ; 5CB5   000C
        DECLE   $0007,  $0008,  $0005,  $0007   ; 5CB6   0007 0008 0005 0007
        DECLE   $0000,  $0003,  $0050,  $0009   ; 5CBA   0000 0003 0050 0009
        DECLE   $0048,  $0013,  $003C,  $007F   ; 5CBE   0048 0013 003C 007F
        DECLE   $0050,  $000C,  $0026,  $0014   ; 5CC2   0050 000C 0026 0014
        DECLE   $0008,  $000C,  $000A,  $0004   ; 5CC6   0008 000C 000A 0004

        PSHR    R5                              ; 5CCA   0275

        JSR     R5,     L_5AEE                  ; 5CCB   0004 0158 02EE

        ADDI    #$01D9, R1                      ; 5CCE   02F9 01D9
        MVI@    R1,     R2                      ; 5CD0   028A
        CMPI    #$0003, R2                      ; 5CD1   037A 0003
        BGT     L_5CEA                          ; 5CD3   020E 0015

        MVII    #$0004, R0                      ; 5CD5   02B8 0004
        MVO@    R0,     R1                      ; 5CD7   0248
        MOVR    R1,     R0                      ; 5CD8   0088
        SUBI    #$01D7, R0                      ; 5CD9   0338 01D7
        SLL     R0,     1                       ; 5CDB   0048

        JSR     R5,     .EXEC.76C               ; 5CDC   0004 0114 036C

        ADDI    #$0007, R1                      ; 5CDF   02F9 0007

        JSR     R5,     L_5BEE                  ; 5CE1   0004 0158 03EE
        DECLE   $0007,  $0040,  $0248,  $0004   ; 5CE4   0007 0040 0248 0004
        DECLE   $015C,  $02F1                   ; 5CE8   015C 02F1
L_5CEA:
        PULR    R7                              ; 5CEA   02B7

        PSHR    R5                              ; 5CEB   0275
        MOVR    R0,     R4                      ; 5CEC   0084

        JSR     R5,     L_5AEE                  ; 5CED   0004 0158 02EE

        ADDI    #$01E1, R1                      ; 5CF0   02F9 01E1
        MVII    #$0001, R0                      ; 5CF2   02B8 0001
        TSTR    R4                              ; 5CF4   00A4
        BPL     L_5CF8                          ; 5CF5   0203 0001

        CLRR    R0                              ; 5CF7   01C0
L_5CF8:
        MVO@    R0,     R1                      ; 5CF8   0248
        PULR    R7                              ; 5CF9   02B7

L_5CFA:
        PSHR    R5                              ; 5CFA   0275
        MVII    #$01EB, R5                      ; 5CFB   02BD 01EB
        SDBD                                    ; 5CFD   0001
        MVI@    R5,     R0                      ; 5CFE   02A8
        INCR    R0                              ; 5CFF   0008
        CMPI    #$03E8, R0                      ; 5D00   0378 03E8
        BC      L_5D09                          ; 5D02   0201 0005

        SUBI    #$0002, R5                      ; 5D04   033D 0002
        MVO@    R0,     R5                      ; 5D06   0268
        SWAP    R0,     1                       ; 5D07   0040
        MVO@    R0,     R5                      ; 5D08   0268
L_5D09:
        CLRR    R3                              ; 5D09   01DB
        CLRR    R4                              ; 5D0A   01E4
        MVII    #$031F, R1                      ; 5D0B   02B9 031F
L_5D0D:
        MVII    #$0162, R5                      ; 5D0D   02BD 0162
        DECLE   $0001                           ; 5D0F   0001

        MVI@    R5,     R0                      ; 5D10   02A8
        ADD@    R1,     R0                      ; 5D11   02C8
        SUBI    #$0002, R1                      ; 5D12   0339 0002
        CMPI    #$0200, R0                      ; 5D14   0378 0200
        BNC     L_5D1E                          ; 5D16   0209 0006

        SDBD                                    ; 5D18   0001
        CMPI    #$B800, R0                      ; 5D19   0378 0000 00B8
        BNC     L_5D32                          ; 5D1C   0209 0014

L_5D1E:
        MVI@    R1,     R2                      ; 5D1E   028A
        SDBD                                    ; 5D1F   0001
        MVII    #$E7FF, R0                      ; 5D20   02B8 00FF 00E7
        ANDR    R0,     R2                      ; 5D23   0182
        MVO@    R2,     R1                      ; 5D24   024A
        ADDI    #$0008, R1                      ; 5D25   02F9 0008
        AND@    R1,     R0                      ; 5D27   0388
        MVO@    R0,     R1                      ; 5D28   0248
        SUBI    #$0008, R1                      ; 5D29   0339 0008

        JSR     R5,     L_5DB3                  ; 5D2B   0004 015C 01B3
        BIDECLE $DD5A                           ; 5D2E   005A 00DD

        B       L_5D5A                          ; 5D30   0200 0028

L_5D32:
        JSR     R5,     L_5DB3                  ; 5D32   0004 015C 01B3
        BIDECLE $5D37                           ; 5D35   0037 005D

        MVI@    R2,     R0                      ; 5D37   0290
        TSTR    R0                              ; 5D38   0080
        BNEQ    L_5D5A                          ; 5D39   020C 001F

        MVI@    R1,     R0                      ; 5D3B   0288
        SDBD                                    ; 5D3C   0001
        MVII    #$E7FF, R5                      ; 5D3D   02BD 00FF 00E7
        ANDR    R5,     R0                      ; 5D40   01A8
        COMR    R5                              ; 5D41   001D
        XORR    R5,     R0                      ; 5D42   01E8
        MVO@    R0,     R1                      ; 5D43   0248
        ADDI    #$0008, R1                      ; 5D44   02F9 0008
        MVI@    R1,     R0                      ; 5D46   0288
        COMR    R5                              ; 5D47   001D
        ANDR    R5,     R0                      ; 5D48   01A8
        COMR    R5                              ; 5D49   001D
        XORR    R5,     R0                      ; 5D4A   01E8
        MVO@    R0,     R1                      ; 5D4B   0248
        SUBI    #$0006, R1                      ; 5D4C   0339 0006
        MVII    #$0162, R5                      ; 5D4E   02BD 0162
        SDBD                                    ; 5D50   0001
        MVI@    R5,     R0                      ; 5D51   02A8
        ADD@    R1,     R0                      ; 5D52   02C8
        CMPR    R0,     R3                      ; 5D53   0143
        BC      L_5D58                          ; 5D54   0201 0002

        MOVR    R0,     R3                      ; 5D56   0083
        MOVR    R1,     R4                      ; 5D57   008C
L_5D58:
        SUBI    #$0002, R1                      ; 5D58   0339 0002
L_5D5A:
        ADDI    #$0012, R1                      ; 5D5A   02F9 0012
        CMPI    #$034F, R1                      ; 5D5C   0379 034F
        BLE     L_5D0D                          ; 5D5E   0226 0052

        CLRR    R0                              ; 5D60   01C0
        MVI     G_015E, R5                      ; 5D61   0285 015E
        ANDI    #$0001, R5                      ; 5D63   03BD 0001
        BEQ     L_5D89                          ; 5D65   0204 0022

        TSTR    R4                              ; 5D67   00A4
        BEQ     L_5D89                          ; 5D68   0204 001F

        MVII    #$0010, R5                      ; 5D6A   02BD 0010
        MVII    #$0078, R0                      ; 5D6C   02B8 0078
        SWAP    R0,     1                       ; 5D6E   0040
        CMPR    R0,     R3                      ; 5D6F   0143
        BC      L_5D73                          ; 5D70   0201 0001

        NEGR    R5                              ; 5D72   0025
L_5D73:
        SUBR    R3,     R0                      ; 5D73   0118
        BPL     L_5D77                          ; 5D74   0203 0001

        NEGR    R0                              ; 5D76   0020
L_5D77:
        CMPI    #$0100, R0                      ; 5D77   0378 0100
        BGE     L_5D7C                          ; 5D79   020D 0001

        CLRR    R5                              ; 5D7B   01ED
L_5D7C:
        ADDI    #$0002, R4                      ; 5D7C   02FC 0002
        MVI@    R4,     R0                      ; 5D7E   02A0
        SWAP    R0,     1                       ; 5D7F   0040
        ANDI    #$00FF, R0                      ; 5D80   03B8 00FF
        ADDR    R5,     R0                      ; 5D82   00E8

        JSR     R5,     X_CLAMP                 ; 5D83   0004 0114 0270
        DECLE   $0000                           ; 5D86   0000

        SARC    R3,     2                       ; 5D87   007F
        NEGR    R0                              ; 5D88   0020
L_5D89:
        MVO     R0,     G_0161                  ; 5D89   0240 0161
        MVI     G_015E, R5                      ; 5D8B   0285 015E
        ANDI    #$0002, R5                      ; 5D8D   03BD 0002
        BEQ     L_5DB2                          ; 5D8F   0204 0021

        MVII    #$01EB, R5                      ; 5D91   02BD 01EB
        SDBD                                    ; 5D93   0001
        MVI@    R5,     R0                      ; 5D94   02A8
        MVII    #$0004, R1                      ; 5D95   02B9 0004
        MVII    #$0002, R3                      ; 5D97   02BB 0002
        MVII    #$0281, R4                      ; 5D99   02BC 0281

        JSR     R5,     X_PRNUM_RGT             ; 5D9B   0004 0118 00C5

        ADDI    #$0003, R4                      ; 5D9E   02FC 0003
        MVI@    R4,     R0                      ; 5DA0   02A0
        DECR    R4                              ; 5DA1   0014
        SDBD                                    ; 5DA2   0001
        ADDI    #$07C8, R0                      ; 5DA3   02F8 00C8 0007
        MVO@    R0,     R4                      ; 5DA6   0260
        SDBD                                    ; 5DA7   0001
        MVII    #$3840, R0                      ; 5DA8   02B8 0040 0038
        MVO@    R0,     R4                      ; 5DAB   0260
        SDBD                                    ; 5DAC   0001
        MVII    #$2840, R0                      ; 5DAD   02B8 0040 0028
        MVO     R0,     .BTAB.79                ; 5DB0   0240 0279
L_5DB2:
        PULR    R7                              ; 5DB2   02B7

L_5DB3:
        SDBD                                    ; 5DB3   0001
        MVI@    R5,     R2                      ; 5DB4   02AA
        PSHR    R5                              ; 5DB5   0275

        JSR     R5,     .EXEC.766               ; 5DB6   0004 0114 0366

        MOVR    R2,     R5                      ; 5DB9   0095
        MOVR    R0,     R2                      ; 5DBA   0082
        SLR     R2,     1                       ; 5DBB   0062
        ADDI    #$0133, R2                      ; 5DBC   02FA 0133
        MVI@    R2,     R0                      ; 5DBE   0290
        RRC     R0,     1                       ; 5DBF   0070
        TSTR    R5                              ; 5DC0   00AD
        BESC    L_5DE2                          ; 5DC1   020F 001F

        ADDI    #$0004, R1                      ; 5DC3   02F9 0004
        MVI@    R1,     R0                      ; 5DC5   0288
        SUBI    #$0004, R1                      ; 5DC6   0339 0004
        SWAP    R0,     1                       ; 5DC8   0040
        NEGR    R0                              ; 5DC9   0020
        PSHR    R5                              ; 5DCA   0275

        JSR     R5,     X_EXT_SIGN_LO           ; 5DCB   0004 0114 0268

        SUB     G_0161, R0                      ; 5DCE   0300 0161

        JSR     R5,     X_EXT_SIGN_LO           ; 5DD0   0004 0114 0268

        PULR    R5                              ; 5DD3   02B5
        BEQ     L_5DE2                          ; 5DD4   0204 000C

        MVII    #$0001, R5                      ; 5DD6   02BD 0001
        BGT     L_5DDB                          ; 5DD8   020E 0001

        NEGR    R5                              ; 5DDA   0025
L_5DDB:
        MVI@    R2,     R0                      ; 5DDB   0290
        ADDR    R5,     R0                      ; 5DDC   00E8
        BGE     L_5DE0                          ; 5DDD   020D 0001

        CLRR    R0                              ; 5DDF   01C0
L_5DE0:
        MVO@    R0,     R2                      ; 5DE0   0250
        PULR    R7                              ; 5DE1   02B7

L_5DE2:
        SDBD                                    ; 5DE2   0001
        ANDI    #$7FFF, R5                      ; 5DE3   03BD 00FF 007F
        DECR    R6                              ; 5DE6   0016
        MOVR    R5,     R7                      ; 5DE7   00AF

        MVII    #$0008, R3                      ; 5DE8   02BB 0008
        ADDI    #$0003, R1                      ; 5DEA   02F9 0003
        ADDR    R1,     R3                      ; 5DEC   00CB
        MVI@    R1,     R0                      ; 5DED   0288
        MVII    #$0044, R2                      ; 5DEE   02BA 0044
        SWAP    R2,     1                       ; 5DF0   0042
        CMPR    R2,     R0                      ; 5DF1   0150
        BC      L_5DF6                          ; 5DF2   0201 0002

        MVO@    R2,     R1                      ; 5DF4   024A
        MVO@    R2,     R3                      ; 5DF5   025A
L_5DF6:
        MVII    #$0060, R2                      ; 5DF6   02BA 0060
        SWAP    R2,     1                       ; 5DF8   0042
        CMPR    R2,     R0                      ; 5DF9   0150
        BNC     L_5DFE                          ; 5DFA   0209 0002

        MVO@    R2,     R1                      ; 5DFC   024A
        MVO@    R2,     R3                      ; 5DFD   025A
L_5DFE:
        ADDI    #$0003, R1                      ; 5DFE   02F9 0003
        MVII    #$0001, R2                      ; 5E00   02BA 0001
        MVO@    R2,     R1                      ; 5E02   024A
        MOVR    R5,     R7                      ; 5E03   00AF

L_5E04:
        PSHR    R5                              ; 5E04   0275
        MVI     G_01EE, R1                      ; 5E05   0281 01EE
L_5E07:
        MOVR    R1,     R0                      ; 5E07   0088
        ANDI    #$0003, R0                      ; 5E08   03B8 0003
        MOVR    R0,     R2                      ; 5E0A   0082
        ADDI    #$0004, R0                      ; 5E0B   02F8 0004

        JSR     R5,     X_POW2                  ; 5E0D   0004 0114 0345

        INCR    R1                              ; 5E10   0009
        ANDI    #$00F3, R1                      ; 5E11   03B9 00F3
        MVO     R1,     G_01EE                  ; 5E13   0241 01EE
        ANDR    R1,     R0                      ; 5E15   0188
        BEQ     L_5E07                          ; 5E16   0224 0010

        SLL     R2,     1                       ; 5E18   004A
        MOVR    R2,     R0                      ; 5E19   0090

        JSR     R5,     .EXEC.772               ; 5E1A   0004 0114 0372

        PSHR    R0                              ; 5E1D   0270
        MVII    #$031F, R5                      ; 5E1E   02BD 031F
L_5E20:
        MOVR    R7,     R4                      ; 5E20   00BC
        ADDI    #$008F, R4                      ; 5E21   02FC 008F
L_5E23:
        MVI@    R5,     R0                      ; 5E23   02A8
        SWAP    R0,     1                       ; 5E24   0040
        ANDI    #$00FF, R0                      ; 5E25   03B8 00FF
        SUB@    R4,     R0                      ; 5E27   0320
        ADDI    #$0040, R0                      ; 5E28   02F8 0040
        SUBR    R2,     R0                      ; 5E2A   0110
        MVI@    R4,     R1                      ; 5E2B   02A1
        BMI     L_5EAB                          ; 5E2C   020B 007D

        CMPR    R1,     R0                      ; 5E2E   0148
        BGT     L_5EAB                          ; 5E2F   020E 007A

        MVI@    R5,     R0                      ; 5E31   02A8
        SWAP    R0,     1                       ; 5E32   0040
        ANDI    #$00FF, R0                      ; 5E33   03B8 00FF
        SUB@    R4,     R0                      ; 5E35   0320
        ADDI    #$0040, R0                      ; 5E36   02F8 0040
        SUBR    R3,     R0                      ; 5E38   0118
        MVI@    R4,     R1                      ; 5E39   02A1
        BMI     L_5E51                          ; 5E3A   020B 0015

        CMPR    R1,     R0                      ; 5E3C   0148
        BGT     L_5E51                          ; 5E3D   020E 0012

        MOVR    R4,     R0                      ; 5E3F   00A0
        SUBR    R7,     R0                      ; 5E40   0138
        SUBI    #$006F, R0                      ; 5E41   0338 006F
        SLR     R0,     2                       ; 5E43   0064
        DECR    R0                              ; 5E44   0010
        PSHR    R5                              ; 5E45   0275

        JSR     R5,     X_POW2                  ; 5E46   0004 0114 0345

        MOVR    R0,     R1                      ; 5E49   0081
        COMR    R1                              ; 5E4A   0019
        AND     G_01ED, R1                      ; 5E4B   0381 01ED
        XORR    R0,     R1                      ; 5E4D   01C1
        MVO     R1,     G_01ED                  ; 5E4E   0241 01ED
        PULR    R5                              ; 5E50   02B5
L_5E51:
        SUBI    #$0002, R5                      ; 5E51   033D 0002
        SDBD                                    ; 5E53   0001
        CMPI    #$5EBC, R4                      ; 5E54   037C 00BC 005E
        BNC     L_5E23                          ; 5E57   0229 0035

        ADDI    #$0010, R5                      ; 5E59   02FD 0010
        CMPI    #$0355, R5                      ; 5E5B   037D 0355
        BNC     L_5E20                          ; 5E5D   0229 003E

        PULR    R0                              ; 5E5F   02B0

        JSR     R5,     .EXEC.76C               ; 5E60   0004 0114 036C

        ADDI    #$0004, R1                      ; 5E63   02F9 0004
        MVI@    R1,     R0                      ; 5E65   0288
        SAR     R0,     2                       ; 5E66   006C
        SWAP    R0,     1                       ; 5E67   0040
        MVII    #$00FF, R2                      ; 5E68   02BA 00FF
        ANDR    R2,     R0                      ; 5E6A   0190
        SWAP    R2,     1                       ; 5E6B   0042
        MOVR    R7,     R5                      ; 5E6C   00BD
        ADD     G_01ED, R5                      ; 5E6D   02C5 01ED
        CLRR    R4                              ; 5E6F   01E4
        MVO     R4,     G_01ED                  ; 5E70   0244 01ED
        ADDI    #$0008, R5                      ; 5E72   02FD 0008
        ADD@    R5,     R7                      ; 5E74   02EF

        INCR    R2                              ; 5E75   000A
        INCR    R5                              ; 5E76   000D
        INCR    R0                              ; 5E77   0008
        INCR    R5                              ; 5E78   000D
        INCR    R2                              ; 5E79   000A
        INCR    R2                              ; 5E7A   000A
        INCR    R0                              ; 5E7B   0008
        INCR    R1                              ; 5E7C   0009
        INCR    R4                              ; 5E7D   000C
        CLRR    R0                              ; 5E7E   01C0
        NEGR    R0                              ; 5E7F   0020
        ANDI    #$00FF, R0                      ; 5E80   03B8 00FF
        AND@    R1,     R2                      ; 5E82   038A
        ADDR    R0,     R2                      ; 5E83   00C2
        MVO@    R2,     R1                      ; 5E84   024A
        MVII    #$01DF, R3                      ; 5E85   02BB 01DF

        JSR     R5,     .EXEC.766               ; 5E87   0004 0114 0366

        SLR     R0,     1                       ; 5E8A   0060
        ADDR    R0,     R3                      ; 5E8B   00C3
        MVO@    R4,     R3                      ; 5E8C   025C
        SUBI    #$0008, R3                      ; 5E8D   033B 0008

        JSR     R5,     L_5BEE                  ; 5E8F   0004 0158 03EE
        DECLE   $0007,  $004C,  $0282,  $0182   ; 5E92   0007 004C 0282 0182
        DECLE   $004E,  $004E,  $004A,  $0284   ; 5E96   004E 004E 004A 0284
        DECLE   $0169,  $03BC,  $001F,  $00D4   ; 5E9A   0169 03BC 001F 00D4
        DECLE   $0104,  $0203,  $0009,  $02BD   ; 5E9E   0104 0203 0009 02BD
        DECLE   $0004,  $035D,  $025D,  $0206   ; 5EA2   0004 035D 025D 0206
        DECLE   $0003,  $0004,  $015C,  $02F1   ; 5EA6   0003 0004 015C 02F1

        PULR    R7                              ; 5EAA   02B7

L_5EAB:
        INCR    R5                              ; 5EAB   000D
        ADDI    #$0002, R4                      ; 5EAC   02FC 0002
        B       L_5E51                          ; 5EAE   0220 005E

        DECLE   $004D,  $0005,  $003A,  $000A   ; 5EB0   004D 0005 003A 000A
        DECLE   $0036,  $0016,  $0037           ; 5EB4   0036 0016 0037

        DIS                                     ; 5EB7   0003
        RSWD    R3                              ; 5EB8   003B
        DECR    R1                              ; 5EB9   0011
        SWAP    R2,     2                       ; 5EBA   0046
        EIS                                     ; 5EBB   0002
L_5EBC:
        PSHR    R5                              ; 5EBC   0275
L_5EBD:
        CLRR    R0                              ; 5EBD   01C0

        JSR     R5,     X_PLAY_SFX2             ; 5EBE   0004 0118 03BE
        DECLE   $0017                           ; 5EC1  SFX prio
        DECLE   $0369                           ; 5EC2  SFX data
        DECLE   $000C,  $00E0                   ; 5EC3  SFX data
        DECLE   $020D                           ; 5EC5  SFX data
        DECLE   $038B                           ; 5EC6  SFX data
        DECLE   $0050,  $0000                   ; 5EC7  SFX data
        DECLE   $03EB                           ; 5EC9  SFX data
        DECLE   $0035                           ; 5ECA  SFX data
        DECLE   $0103,  $03D4                   ; 5ECB  SFX data
        DECLE   $0275                           ; 5ECD  SFX data
        DECLE   $01C0,  $0004                   ; 5ECE  SFX data
        DECLE   $0118,  $03BB                   ; 5ED0  SFX data
        DECLE   $03C9                           ; 5ED2  SFX data
        DECLE   $0300,  $0180                   ; 5ED3  SFX data
        DECLE   $0308,  $0182                   ; 5ED5  SFX data
        DECLE   $03E2                           ; 5ED7  SFX data
        DECLE   $03EA                           ; 5ED8  SFX data
        DECLE   $008F,  $0017                   ; 5ED9  SFX data
        DECLE   $00CF                           ; 5EDB  SFX end


        B       L_5EBD                          ; 5EDC   0220 0020

L_5EDE:
        PSHR    R5                              ; 5EDE   0275
        CLRR    R0                              ; 5EDF   01C0

        JSR     R5,     X_PLAY_SFX2             ; 5EE0   0004 0118 03BE
        DECLE   $0017                           ; 5EE3  SFX prio
        DECLE   $0309                           ; 5EE4  SFX data
        DECLE   $03ED                           ; 5EE5  SFX data
        DECLE   $002C,  $0000                   ; 5EE6  SFX data
        DECLE   $0040,  $00C3                   ; 5EE8  SFX data
        DECLE   $0048,  $01AF                   ; 5EEA  SFX data
        DECLE   $0044,  $0018                   ; 5EEC  SFX data
        DECLE   $000B                           ; 5EEE  SFX data
        DECLE   $0203,  $0344                   ; 5EEF  SFX data
        DECLE   $0275                           ; 5EF1  SFX data
        DECLE   $0004,  $0118                   ; 5EF2  SFX data
        DECLE   $03BE                           ; 5EF4  SFX data
        DECLE   $0027                           ; 5EF5  SFX data
        DECLE   $0279                           ; 5EF6  SFX data
        DECLE   $018D                           ; 5EF7  SFX data
        DECLE   $000F,  $03FE                   ; 5EF8  SFX data
        DECLE   $0135                           ; 5EFA  SFX data
        DECLE   $006E                           ; 5EFB  SFX data
        DECLE   $01EB                           ; 5EFC  SFX data
        DECLE   $01B7                           ; 5EFD  SFX data
        DECLE   $001C,  $0000                   ; 5EFE  SFX data
        DECLE   $00CD                           ; 5F00  SFX data
        DECLE   $000B                           ; 5F01  SFX data
        DECLE   $01EB                           ; 5F02  SFX data
        DECLE   $01CF                           ; 5F03  SFX end


        B       L_5EBD                          ; 5F04   0220 0048

L_5F06:
        PSHR    R5                              ; 5F06   0275
L_5F07:
        MVII    #$0002, R0                      ; 5F07   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 5F09   0004 011C 02C4

        PULR    R7                              ; 5F0C   02B7

.TITLE:
        DECLE   $0050                           ; 5F0D  Cartridge year
        STRING  "HORSE RACING"                  ; 5F0E  Title string
        DECLE   $0000                           ; 5F1A  

.TITLECODE:
        PSHR    R5                              ; 5F1B   0275
        MVII    #$00D9, R0                      ; 5F1C   02B8 00D9
        CMP     .PSG0.rgt_hand,R0               ; 5F1E   0340 01FE
        BNEQ    L_5F44                          ; 5F20   020C 0022

        CMP     .PSG0.lft_hand,R0               ; 5F22   0340 01FF
        BNEQ    L_5F44                          ; 5F24   020C 001E

        SDBD                                    ; 5F26   0001
        MVII    #$0957, R0                      ; 5F27   02B8 0057 0009

        JSR     R5,     L_5F36                  ; 5F2A   0004 015C 0336
        DECLE   $0216,  $0218,  $021A,  $021C   ; 5F2D   0216 0218 021A 021C
        DECLE   $021F,  $0221,  $0223,  $0225   ; 5F31   021F 0221 0223 0225
        DECLE   $0000                           ; 5F35   0000
L_5F36:
        MVI@    R5,     R1                      ; 5F36   02A9
        MVO@    R0,     R1                      ; 5F37   0248
        DECR    R0                              ; 5F38   0010
        TSTR    R1                              ; 5F39   0089
        BNEQ    L_5F36                          ; 5F3A   022C 0005

        MVII    #$011F, R0                      ; 5F3C   02B8 011F
        MVO     R0,     .BTAB.09                ; 5F3E   0240 0209
        MVII    #$0147, R0                      ; 5F40   02B8 0147
        MVO     R0,     .BTAB.0A                ; 5F42   0240 020A

L_5F44:
        JSR     R5,     X_PLAY_MUS1             ; 5F44   0004 0118 0327
        DECLE   $007C                           ; 5F47  Note (short)
        DECLE   $007C                           ; 5F48  Note (short)
        DECLE   $007E                           ; 5F49  Note (short)
        DECLE   $007C                           ; 5F4A  Note (short)
        DECLE   $007C                           ; 5F4B  Note (short)
        DECLE   $007E                           ; 5F4C  Note (short)
        DECLE   $007C                           ; 5F4D  Note (short)
        DECLE   $007C                           ; 5F4E  Note (short)
        DECLE   $00C6                           ; 5F4F  Note (short)
        DECLE   $00E6                           ; 5F50  Note (short)
        DECLE   $0106                           ; 5F51  Note (short)
        DECLE   $007C                           ; 5F52  Note (short)
        DECLE   $007C                           ; 5F53  Note (short)
        DECLE   $007E                           ; 5F54  Note (short)
        DECLE   $007C                           ; 5F55  Note (short)
        DECLE   $007C                           ; 5F56  Note (short)
        DECLE   $00C6                           ; 5F57  Note (short)
        DECLE   $0106                           ; 5F58  Note (short)
        DECLE   $00E6                           ; 5F59  Note (short)
        DECLE   $00B6                           ; 5F5A  Note (short)
        DECLE   $007E                           ; 5F5B  Note (short)
        DECLE   $007C                           ; 5F5C  Note (short)
        DECLE   $007C                           ; 5F5D  Note (short)
        DECLE   $007E                           ; 5F5E  Note (short)
        DECLE   $007C                           ; 5F5F  Note (short)
        DECLE   $007C                           ; 5F60  Note (short)
        DECLE   $007E                           ; 5F61  Note (short)
        DECLE   $007C                           ; 5F62  Note (short)
        DECLE   $007C                           ; 5F63  Note (short)
        DECLE   $00C6                           ; 5F64  Note (short)
        DECLE   $00E6                           ; 5F65  Note (short)
        DECLE   $010E                           ; 5F66  Note (short)
        DECLE   $00C4                           ; 5F67  Note (short)
        DECLE   $0104                           ; 5F68  Note (short)
        DECLE   $03F4,  $0136                   ; 5F69  Note (long)
        DECLE   $011C                           ; 5F6B  Note (short)
        DECLE   $010C                           ; 5F6C  Note (short)
        DECLE   $00EC                           ; 5F6D  Note (short)
        DECLE   $00CE                           ; 5F6E  Note (short)
        DECLE   $010E                           ; 5F6F  Note (short)
        DECLE   $00CE                           ; 5F70  Note (short)
        DECLE   $0000                           ; 5F71  End of music

        PULR    R7                              ; 5F72   02B7

L_5F73:
        PSHR    R5                              ; 5F73   0275

        JSR     R5,     X_PLAY_MUS2             ; 5F74   0004 0118 035D
        DECLE   $018C                           ; 5F77  Note (short)
        DECLE   $01DC                           ; 5F78  Note (short)
        DECLE   $021C                           ; 5F79  Note (short)
        DECLE   $024C                           ; 5F7A  Note (short)
        DECLE   $0248                           ; 5F7B  Note (short)
        DECLE   $0248                           ; 5F7C  Note (short)
        DECLE   $024C                           ; 5F7D  Note (short)
        DECLE   $021C                           ; 5F7E  Note (short)
        DECLE   $0218                           ; 5F7F  Note (short)
        DECLE   $0218                           ; 5F80  Note (short)
        DECLE   $021C                           ; 5F81  Note (short)
        DECLE   $01DC                           ; 5F82  Note (short)
        DECLE   $021C                           ; 5F83  Note (short)
        DECLE   $01DC                           ; 5F84  Note (short)
        DECLE   $0186                           ; 5F85  Note (short)
        DECLE   $000E                           ; 5F86  Note (short)
        DECLE   $018C                           ; 5F87  Note (short)
        DECLE   $01DC                           ; 5F88  Note (short)
        DECLE   $021C                           ; 5F89  Note (short)
        DECLE   $024C                           ; 5F8A  Note (short)
        DECLE   $0248                           ; 5F8B  Note (short)
        DECLE   $0248                           ; 5F8C  Note (short)
        DECLE   $0248                           ; 5F8D  Note (short)
        DECLE   $024C                           ; 5F8E  Note (short)
        DECLE   $021C                           ; 5F8F  Note (short)
        DECLE   $01DC                           ; 5F90  Note (short)
        DECLE   $018C                           ; 5F91  Note (short)
        DECLE   $0188                           ; 5F92  Note (short)
        DECLE   $0188                           ; 5F93  Note (short)
        DECLE   $018C                           ; 5F94  Note (short)
        DECLE   $01DE                           ; 5F95  Note (short)
        DECLE   $0000                           ; 5F96  End of music

        PULR    R7                              ; 5F97   02B7

        DECLE   $0050,  $004E,  $004B,  $0000   ; 5F98   0050 004E 004B 0000
        DECLE   $0052,  $0045,  $0044,  $0000   ; 5F9C   0052 0045 0044 0000
        DECLE   $004F,  $0052,  $0047,  $0000   ; 5FA0   004F 0052 0047 0000
        DECLE   $0059,  $004C,  $0057,  $0000   ; 5FA4   0059 004C 0057 0000
        DECLE   $0047,  $0052,  $004E,  $0000   ; 5FA8   0047 0052 004E 0000
        DECLE   $0042,  $004C,  $0055,  $0000   ; 5FAC   0042 004C 0055 0000
        DECLE   $0056,  $004C,  $0054,  $0000   ; 5FB0   0056 004C 0054 0000
        DECLE   $0057,  $0048,  $0054,  $0000   ; 5FB4   0057 0048 0054 0000
        DECLE   $0003,  $0000,  $0004,  $0000   ; 5FB8   0003 0000 0004 0000
        DECLE   $0003,  $0010,  $0014,  $0002   ; 5FBC   0003 0010 0014 0002
        DECLE   $0012,  $0006,  $0005           ; 5FC0   0012 0006 0005

        DECR    R5                              ; 5FC3   0015
L_5FC4:
        DECR    R7                              ; 5FC4   0017

        SETC                                    ; 5FC5   0007

        JSR     R4,     .EXEC.002               ; 5FC6   0004 0010 0002
        DECLE   $0000,  $0002,  $0010,  $0006   ; 5FC9   0000 0002 0010 0006
        DECLE   $0000,  $0004,  $0000,  $0005   ; 5FCD   0000 0004 0000 0005
        DECLE   $0010,  $0007,  $0010,  $0007   ; 5FD1   0010 0007 0010 0007
        DECLE   $0000,  $00CA,  $005A,  $0000   ; 5FD5   0000 00CA 005A 0000
        DECLE   $0000                           ; 5FD9   0000

        ADDR    R5,     R3                      ; 5FDA   00EB
        SLLC    R0,     2                       ; 5FDB   005C
        ADDR    R1,     R2                      ; 5FDC   00CA
        SLLC    R0,     2                       ; 5FDD   005C
        ADDR    R1,     R2                      ; 5FDE   00CA
        SLLC    R0,     2                       ; 5FDF   005C
L_5FE0:
        MVI@    R5,     R2                      ; 5FE0   02AA
        MVI@    R5,     R4                      ; 5FE1   02AC
        PSHR    R5                              ; 5FE2   0275
        MOVR    R1,     R5                      ; 5FE3   008D
        MOVR    R2,     R0                      ; 5FE4   0090
        MVII    #$00FF, R3                      ; 5FE5   02BB 00FF
L_5FE7:
        MVO@    R3,     R5                      ; 5FE7   026B
        DECR    R0                              ; 5FE8   0010
        BNEQ    L_5FE7                          ; 5FE9   022C 0003

L_5FEB:
        MOVR    R4,     R0                      ; 5FEB   00A0

        JSR     R5,     X_RAND2                 ; 5FEC   0004 0114 029E

        MOVR    R1,     R5                      ; 5FEF   008D
L_5FF0:
        MVI@    R5,     R3                      ; 5FF0   02AB
        CMPI    #$00FF, R3                      ; 5FF1   037B 00FF
        BEQ     L_5FFA                          ; 5FF3   0204 0005

        CMPR    R0,     R3                      ; 5FF5   0143
        BEQ     L_5FEB                          ; 5FF6   0224 000C
        B       L_5FF0                          ; 5FF8   0220 0009

L_5FFA:
        DECR    R5                              ; 5FFA   0015
        MVO@    R0,     R5                      ; 5FFB   0268
        DECR    R2                              ; 5FFC   0012
        BNEQ    L_5FEB                          ; 5FFD   022C 0013
        PULR    R7                              ; 5FFF   02B7

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5032       <entry>
;;  $5050       $5054  
;;  $50A0       <entry>
;;  $50C2       $50B4  
;;  $50D4       $50DD  
;;  $50DF       $5129   $51BE   $521E  
;;  $50E7       $50F8   $50FF   $510A  
;;  $50EA       $50E5  
;;  $510E       $512D   $5139  
;;  $5111       $510C  
;;  $5165       $515E  
;;  $5172       $519F  
;;  $5177       $5186   $51A7  
;;  $517A       $5175  
;;  $517F       $5184  
;;  $5188       $5180  
;;  $51A3       $5194  
;;  $51AB       $51A1  
;;  $51B6       $51B7  
;;  $51C0       $517A  
;;  $51E5       $51DF   $5200  
;;  $51E8       $51E3  
;;  $51FD       $51D8  
;;  $520A       $51DC  
;;  $5220       $5111   $5141   $5158   $5938  
;;  $5254       $50FB  
;;  $528F       $529C  
;;  $52A2       $52AF  
;;  $52BE       $52CE  
;;  $52D7       $52F6  
;;  $52E2       $52E6  
;;  $52EE       $52F2  
;;  $5300       $530B  
;;  $5317       $5337  
;;  $5351       $5357  
;;  $535F       $536A  
;;  $53B8       $53C3  
;;  $53CC       $53EC  
;;  $53E7       $53E8  
;;  $540F       $544F  
;;  $541A       $5416  
;;  $5427       $5428  
;;  $5432       $542F  
;;  $5435       $541D  
;;  $5436       $5421   $5434  
;;  $5448       $5445  
;;  $5456       $5475  
;;  $54E4       $54EB  
;;  $54E8       $54E5  
;;  $54F3       $547C   $54A0  
;;  $54FB       $54F9  
;;  $5508       $54FE  
;;  $5509       $5487   $54AE   $54BB   $54DC   $5506  
;;  $550A       <entry>
;;  $5534       $5538  
;;  $5540       $553A  
;;  $554B       $5563  
;;  $557D       $558E  
;;  $5586       $5589  
;;  $5592       $5578  
;;  $5597       $5543  
;;  $559A       $55A0  
;;  $55AD       $5606   $560C  
;;  $55BA       $55B5  
;;  $55C5       $55D7  
;;  $55CE       $55C8  
;;  $55F3       $55DD  
;;  $55F4       $55AB  
;;  $5726       $5724  
;;  $5727       $5725  
;;  $5728       $5726  
;;  $5737       $5735  
;;  $5738       $5736  
;;  $5742       $5742  
;;  $5745       $5743  
;;  $5747       $5745  
;;  $5756       $5754  
;;  $5765       $5763  
;;  $5766       $5764  
;;  $5767       $5765  
;;  $5776       $5774  
;;  $5777       $5775  
;;  $5778       $5776  
;;  $5874       $5879  
;;  $5888       $50B9   $50E2  
;;  $58C6       $58DB  
;;  $58E5       $58F1  
;;  $58F7       $5936  
;;  $58FC       $5912  
;;  $5921       $591D  
;;  $5930       $58F9  
;;  $5963       $595F  
;;  $5970       $596C  
;;  $5979       $5975  
;;  $5987       $597E  
;;  $599B       $598B  
;;  $599E       $5999  
;;  $59A9       $59C2  
;;  $59B8       $59B5  
;;  $59BB       $59B8  
;;  $5A15       $5AB7  
;;  $5A22       $5A1E  
;;  $5A27       $5A23  
;;  $5A4F       $5AB3  
;;  $5A96       $5AAD  
;;  $5AAF       $5A62  
;;  $5AE1       $5ADE  
;;  $5AE6       $5AE3  
;;  $5AEE       $5ACC   $5CCB   $5CED  
;;  $5B27       $5B24  
;;  $5B2B       $5B14  
;;  $5B36       $5B31  
;;  $5B4A       $5B01   $5B42  
;;  $5B66       $5B5A   $5B5E   $5B62  
;;  $5B74       $5B6E  
;;  $5B83       $5B80  
;;  $5B87       $5B84  
;;  $5B93       $5B90  
;;  $5B98       $5B95  
;;  $5B9C       $5B78   $5B99  
;;  $5BB2       $5B9E   $5BA6  
;;  $5BBF       $5BBC  
;;  $5BC3       $5BC0  
;;  $5BEE       $50D4   $5B7A   $5BA8   $5BB2   $5CE1   $5E8F  
;;  $5BF7       $5B68   $5B8A   $5BF2  
;;  $5C37       $5C35  
;;  $5C43       $5C43  
;;  $5C61       $5C5F  
;;  $5C94       $5C94  
;;  $5CB5       $5CB3  
;;  $5CEA       $5CD3  
;;  $5CF8       $5CF5  
;;  $5CFA       <entry>
;;  $5D09       $5D02  
;;  $5D0D       $5D5E  
;;  $5D1E       $5D16  
;;  $5D32       $5D1C  
;;  $5D58       $5D54  
;;  $5D5A       $5D30   $5D39  
;;  $5D73       $5D70  
;;  $5D77       $5D74  
;;  $5D7C       $5D79  
;;  $5D89       $5D65   $5D68  
;;  $5DB2       $5D8F  
;;  $5DB3       $5D2B   $5D32  
;;  $5DDB       $5DD8  
;;  $5DE0       $5DDD  
;;  $5DE2       $5DC1   $5DD4  
;;  $5DF6       $5DF2  
;;  $5DFE       $5DFA  
;;  $5E04       <entry>
;;  $5E07       $5E16  
;;  $5E20       $5E5D  
;;  $5E23       $5E57  
;;  $5E51       $5E3A   $5E3D   $5EAE  
;;  $5EAB       $5E2C   $5E2F  
;;  $5EBC       $53BC  
;;  $5EBD       $5EDC   $5F04  
;;  $5EDE       $53AC  
;;  $5F06       $50E7   $510E   $5177  
;;  $5F07       $51E5  
;;  $5F1B       <entry>
;;  $5F36       $5F2A   $5F3A  
;;  $5F44       $5F20   $5F24  
;;  $5F73       $533D  
;;  $5FC4       $5FC4  
;;  $5FE0       $5045   $50C4  
;;  $5FE7       $5FE9  
;;  $5FEB       $5FF6   $5FFD  
;;  $5FF0       $5FF8  
;;  $5FFA       $5FF3  
;; ======================================================================== ;;
