
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $9000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $9EA8           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5014           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

.TITLE:
        DECLE   $0057                           ; 5014  Cartridge year
        STRING  "JT"                            ; 5015  Title string
        DECLE   $0000                           ; 5017  

.TITLECODE:
        MVII    #$0335, R6                      ; 5018   02BE 0335
        MVII    #$02F0, R4                      ; 501A   02BC 02F0
        MVII    #$0045, R0                      ; 501C   02B8 0045

        JSR     R5,     X_FILL_ZERO             ; 501E   0004 0114 0338

        SDBD                                    ; 5021   0001
        MVII    #$A840, R5                      ; 5022   02BD 0040 00A8
        MVO     R5,     G_032E                  ; 5025   0245 032E
        MVO     R5,     G_032F                  ; 5027   0245 032F
        MVO     R5,     G_0330                  ; 5029   0245 0330

        JSR     R5,     L_684C                  ; 502B   0004 0168 004C
        DECLE   $0102,  $0004,  $0103,  $0004   ; 502E   0102 0004 0103 0004
        DECLE   $0140,  $0006,  $0141,  $0006   ; 5032   0140 0006 0141 0006
        DECLE   $0144,  $0005,  $0145,  $0005   ; 5036   0144 0005 0145 0005
        DECLE   $014A,  $003F,  $0000           ; 503A   014A 003F 0000

        JSR     R5,     L_6807                  ; 503D   0004 0168 0007

        EIS                                     ; 5040   0002

        JSR     R5,     L_68B2                  ; 5041   0004 0168 00B2
        DECLE   $0240,  $0021,  $01C0,  $0240   ; 5044   0240 0021 01C0 0240
        DECLE   $002C,  $0240,  $0020,  $0001   ; 5048   002C 0240 0020 0001
        DECLE   $02B8,  $0017,  $0051,  $0240   ; 504C   02B8 0017 0051 0240
        DECLE   $0100,  $0040,  $0240,  $0101   ; 5050   0100 0040 0240 0101
        DECLE   $0004                           ; 5054   0004

        ANDR    R5,     R0                      ; 5055   01A8
        MVI@    R5,     R2                      ; 5056   02AA
        MVII    #$0001, R3                      ; 5057   02BB 0001
        MVII    #$023D, R4                      ; 5059   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 505B   0004 0118 007B
        STRING  "PRESENTS"                      ; 505E  
        DECLE   $0000                           ; 5066   0000

        MVII    #$02B8, R4                      ; 5067   02BC 02B8

        JSR     R5,     X_PRINT_R5              ; 5069   0004 0118 007B
        STRING  "1987"                          ; 506C   0031 0039 0038 0037
        DECLE   $0000                           ; 5070   0000

        MVII    #$0007, R3                      ; 5071   02BB 0007
        MVII    #$0279, R4                      ; 5073   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 5075   0004 0118 007B
        STRING  "COMMANDO"                      ; 5078  
        DECLE   $0000                           ; 5080   0000

        JSR     R5,     L_68B2                  ; 5081   0004 0168 00B2
        JSR     R5,     L_6859                  ; 5084   0004 0168 0059
        BIDECLE $91F0,  $39B0                   ; 5087   00F0 0091 00B0 0039
        DECLE   $0004                           ; 508B   0004

        MVO     R0,     .STIC.VIDEN             ; 508C   0240 0020
        SDBD                                    ; 508E   0001
        MVII    #$0959, R0                      ; 508F   02B8 0059 0009
        MVO     R0,     .BTAB.B6                ; 5092   0240 02B6
        SDBD                                    ; 5094   0001
        MVII    #$09B1, R0                      ; 5095   02B8 00B1 0009
        MVII    #$0217, R4                      ; 5098   02BC 0217
        MVII    #$02CB, R5                      ; 509A   02BD 02CB
        MVO@    R0,     R4                      ; 509C   0260
        MVO@    R0,     R5                      ; 509D   0268
        ADDI    #$0008, R0                      ; 509E   02F8 0008
        MVO@    R0,     R4                      ; 50A0   0260
        MVO@    R0,     R5                      ; 50A1   0268
        ADDI    #$0008, R0                      ; 50A2   02F8 0008
        MVO@    R0,     R4                      ; 50A4   0260
        MVO@    R0,     R5                      ; 50A5   0268
        ADDI    #$0008, R0                      ; 50A6   02F8 0008
        MVO@    R0,     R4                      ; 50A8   0260
        MVO@    R0,     R5                      ; 50A9   0268
L_50AA:
        MVI     G_0108, R0                      ; 50AA   0280 0108
        TSTR    R0                              ; 50AC   0080
        BEQ     L_50AA                          ; 50AD   0224 0004

        CMP     G_0109, R0                      ; 50AF   0340 0109
        BNEQ    L_50AA                          ; 50B1   022C 0008

L_50B3:
        MVI     .PSG0.rgt_hand,R5               ; 50B3   0285 01FE
        XOR     .PSG0.lft_hand,R5               ; 50B5   03C5 01FF
        BNEQ    L_50B3                          ; 50B7   022C 0005

        CMPI    #$0041, R0                      ; 50B9   0378 0041
        BNEQ    L_50BF                          ; 50BB   020C 0002

        MVII    #$0001, R5                      ; 50BD   02BD 0001
L_50BF:
        CMPI    #$0021, R0                      ; 50BF   0378 0021
        BNEQ    L_50C5                          ; 50C1   020C 0002

        MVII    #$0020, R5                      ; 50C3   02BD 0020
L_50C5:
        CMPI    #$0082, R0                      ; 50C5   0378 0082
        BNEQ    L_50CB                          ; 50C7   020C 0002

        MVII    #$0021, R5                      ; 50C9   02BD 0021
L_50CB:
        MVO     R5,     G_0146                  ; 50CB   0245 0146
        DECLE   $0004                           ; 50CD   0004

        ANDR    R5,     R4                      ; 50CE   01AC
        SUBR    R3,     R6                      ; 50CF   011E

        JSR     R5,     L_6DBE                  ; 50D0   0004 016C 01BE
        DECLE   $0015                           ; 50D3   0015
L_50D4:
        EIS                                     ; 50D4   0002
        MVI     G_0102, R0                      ; 50D5   0280 0102
        DECR    R0                              ; 50D7   0010
        BPL     L_50D4                          ; 50D8   0223 0005

        MVII    #$0004, R1                      ; 50DA   02B9 0004
        MVO     R1,     G_0102                  ; 50DC   0241 0102
        NEGR    R0                              ; 50DE   0020

        JSR     R5,     X_RAND1                 ; 50DF   0004 0114 027D
        JSR     R5,     L_6CD1                  ; 50E2   0004 016C 00D1

        BC      L_50D4                          ; 50E5   0221 0012

        JSR     R5,     L_5D3E                  ; 50E7   0004 015C 013E
        JSR     R5,     L_5E52                  ; 50EA   0004 015C 0252
        JSR     R5,     L_6A63                  ; 50ED   0004 0168 0263
        JSR     R5,     L_545F                  ; 50F0   0004 0154 005F
        JSR     R5,     L_6377                  ; 50F3   0004 0160 0377
        JSR     R5,     L_607C                  ; 50F6   0004 0160 007C
        JSR     R5,     L_603A                  ; 50F9   0004 0160 003A
        JSR     R5,     L_6061                  ; 50FC   0004 0160 0061
        JSR     R5,     L_5B5D                  ; 50FF   0004 0158 035D
        JSR     R5,     L_5E7A                  ; 5102   0004 015C 027A

        MVI     G_0146, R0                      ; 5105   0280 0146
        ANDI    #$0010, R0                      ; 5107   03B8 0010
        MOVR    R0,     R5                      ; 5109   0085
        XOR     G_0146, R0                      ; 510A   03C0 0146
        MVO     R0,     G_0146                  ; 510C   0240 0146
        TSTR    R5                              ; 510E   00AD
        BEQ     L_50D4                          ; 510F   0224 003C

        JSR     R5,     L_6DBE                  ; 5111   0004 016C 01BE
        DECLE   $000C                           ; 5114   000C

        B       L_50D4                          ; 5115   0220 0042

        MVI     G_035F, R0                      ; 5117   0280 035F
        INCR    R0                              ; 5119   0008
        MVO     R0,     G_035F                  ; 511A   0240 035F
        MVI     G_0108, R0                      ; 511C   0280 0108
        MVO     R0,     G_0109                  ; 511E   0240 0109
        MVI     .PSG0.rgt_hand,R0               ; 5120   0280 01FE
        XOR     .PSG0.lft_hand,R0               ; 5122   03C0 01FF
        MVO     R0,     G_0108                  ; 5124   0240 0108
        MVO     R0,     .STIC.VIDEN             ; 5126   0240 0020
        MOVR    R5,     R7                      ; 5128   00AF

        PSHR    R5                              ; 5129   0275
        MVII    #$02F0, R4                      ; 512A   02BC 02F0
        CLRR    R5                              ; 512C   01ED
        MVI@    R4,     R0                      ; 512D   02A0
        MVO@    R0,     R5                      ; 512E   0268
        MVI@    R4,     R0                      ; 512F   02A0
        MVO@    R0,     R5                      ; 5130   0268
        MVI@    R4,     R0                      ; 5131   02A0
        MVO@    R0,     R5                      ; 5132   0268
        MVI@    R4,     R0                      ; 5133   02A0
        MVO@    R0,     R5                      ; 5134   0268
        MVI@    R4,     R0                      ; 5135   02A0
        MVO@    R0,     R5                      ; 5136   0268
        MVI@    R4,     R0                      ; 5137   02A0
        MVO@    R0,     R5                      ; 5138   0268
        MVI@    R4,     R0                      ; 5139   02A0
        MVO@    R0,     R5                      ; 513A   0268
        MVI@    R4,     R0                      ; 513B   02A0
        MVO@    R0,     R5                      ; 513C   0268
        MVI@    R4,     R0                      ; 513D   02A0
        MVO@    R0,     R5                      ; 513E   0268
        MVI@    R4,     R0                      ; 513F   02A0
        MVO@    R0,     R5                      ; 5140   0268
        MVI@    R4,     R0                      ; 5141   02A0
        MVO@    R0,     R5                      ; 5142   0268
        MVI@    R4,     R0                      ; 5143   02A0
        MVO@    R0,     R5                      ; 5144   0268
        MVI@    R4,     R0                      ; 5145   02A0
        MVO@    R0,     R5                      ; 5146   0268
        MVI@    R4,     R0                      ; 5147   02A0
        MVO@    R0,     R5                      ; 5148   0268
        MVI@    R4,     R0                      ; 5149   02A0
        MVO@    R0,     R5                      ; 514A   0268
        MVI@    R4,     R0                      ; 514B   02A0
        MVO@    R0,     R5                      ; 514C   0268
        MVI@    R4,     R0                      ; 514D   02A0
        MVO@    R0,     R5                      ; 514E   0268
        MVI@    R4,     R0                      ; 514F   02A0
        MVO@    R0,     R5                      ; 5150   0268
        MVI@    R4,     R0                      ; 5151   02A0
        MVO@    R0,     R5                      ; 5152   0268
        MVI@    R4,     R0                      ; 5153   02A0
        MVO@    R0,     R5                      ; 5154   0268
        MVI@    R4,     R0                      ; 5155   02A0
        MVO@    R0,     R5                      ; 5156   0268
        MVI@    R4,     R0                      ; 5157   02A0
        MVO@    R0,     R5                      ; 5158   0268
        MVI@    R4,     R0                      ; 5159   02A0
        MVO@    R0,     R5                      ; 515A   0268
        MVI@    R4,     R0                      ; 515B   02A0
        MVO@    R0,     R5                      ; 515C   0268
        MVI     G_015E, R0                      ; 515D   0280 015E
        ANDI    #$0001, R0                      ; 515F   03B8 0001
        BEQ     L_5175                          ; 5161   0204 0012

        MVO     R0,     .STIC.VIDEN             ; 5163   0240 0020
        MVI     G_035F, R0                      ; 5165   0280 035F
        INCR    R0                              ; 5167   0008
        MVO     R0,     G_035F                  ; 5168   0240 035F

        JSR     R5,     L_6DF1                  ; 516A   0004 016C 01F1

        MVI     G_0102, R0                      ; 516D   0280 0102
        DECR    R0                              ; 516F   0010
        BMI     L_5174                          ; 5170   020B 0002

        MVO     R0,     G_0102                  ; 5172   0240 0102
L_5174:
        PULR    R7                              ; 5174   02B7

L_5175:
        CLRR    R1                              ; 5175   01C9
        MVI     .STIC.C.0,R0                    ; 5176   0280 0018
        MVO     R1,     .STIC.C.0               ; 5178   0241 0018
        MVI     G_0332, R1                      ; 517A   0281 0332
        COMR    R1                              ; 517C   0019
        COMR    R0                              ; 517D   0018
        ANDR    R1,     R0                      ; 517E   0188
        COMR    R0                              ; 517F   0018
        MVO     R0,     G_0332                  ; 5180   0240 0332

        JSR     R5,     L_51B6                  ; 5182   0004 0150 01B6
        JSR     R5,     L_520A                  ; 5185   0004 0150 020A

        MVI     G_0104, R0                      ; 5188   0280 0104
L_518A:
        MVO     R0,     .STIC.VDLY              ; 518A   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 518C   0240 0020

        JSR     R5,     L_530B                  ; 518E   0004 0150 030B

        MVI     G_015E, R0                      ; 5191   0280 015E
        XORI    #$0001, R0                      ; 5193   03F8 0001
        MVO     R0,     G_015E                  ; 5195   0240 015E

        JSR     R5,     L_5320                  ; 5197   0004 0150 0320

        MVI     G_0102, R0                      ; 519A   0280 0102
        DECR    R0                              ; 519C   0010
        BMI     L_51A1                          ; 519D   020B 0002

        MVO     R0,     G_0102                  ; 519F   0240 0102
L_51A1:
        MVI     G_035F, R0                      ; 51A1   0280 035F
        INCR    R0                              ; 51A3   0008
        MVO     R0,     G_035F                  ; 51A4   0240 035F

        JSR     R5,     L_6DF1                  ; 51A6   0004 016C 01F1
        JSR     R5,     L_5716                  ; 51A9   0004 0154 0316
        JSR     R5,     L_6B5C                  ; 51AC   0004 0168 035C

        MVI     G_015E, R0                      ; 51AF   0280 015E
        XORI    #$0001, R0                      ; 51B1   03F8 0001
        MVO     R0,     G_015E                  ; 51B3   0240 015E
        PULR    R7                              ; 51B5   02B7

L_51B6:
        PSHR    R5                              ; 51B6   0275
        MVII    #$0038, R1                      ; 51B7   02B9 0038
        SWAP    R1,     1                       ; 51B9   0041
        MVI     G_011E, R2                      ; 51BA   0282 011E
        TSTR    R2                              ; 51BC   0092
        BEQ     L_51DE                          ; 51BD   0204 001F

        MVII    #$0120, R3                      ; 51BF   02BB 0120
L_51C1:
        MOVR    R1,     R4                      ; 51C1   008C
        ADD@    R3,     R4                      ; 51C2   02DC
        INCR    R3                              ; 51C3   000B
        MOVR    R1,     R5                      ; 51C4   008D
        ADDI    #$0100, R5                      ; 51C5   02FD 0100
        ADD@    R3,     R5                      ; 51C7   02DD
        INCR    R3                              ; 51C8   000B
        MVI@    R4,     R0                      ; 51C9   02A0
        MVO@    R0,     R5                      ; 51CA   0268
        MVI@    R4,     R0                      ; 51CB   02A0
        MVO@    R0,     R5                      ; 51CC   0268
        MVI@    R4,     R0                      ; 51CD   02A0
        MVO@    R0,     R5                      ; 51CE   0268
        MVI@    R4,     R0                      ; 51CF   02A0
        MVO@    R0,     R5                      ; 51D0   0268
        MVI@    R4,     R0                      ; 51D1   02A0
        MVO@    R0,     R5                      ; 51D2   0268
        MVI@    R4,     R0                      ; 51D3   02A0
        MVO@    R0,     R5                      ; 51D4   0268
        MVI@    R4,     R0                      ; 51D5   02A0
        MVO@    R0,     R5                      ; 51D6   0268
        MVI@    R4,     R0                      ; 51D7   02A0
        MVO@    R0,     R5                      ; 51D8   0268
        DECR    R2                              ; 51D9   0012
        BNEQ    L_51C1                          ; 51DA   022C 001A

        MVO     R2,     G_011E                  ; 51DC   0242 011E
L_51DE:
        MVI     G_011F, R2                      ; 51DE   0282 011F
        SARC    R2,     1                       ; 51E0   007A
        BEQ     L_5209                          ; 51E1   0204 0026
        BC      L_5209                          ; 51E3   0201 0024

        MVII    #$0130, R3                      ; 51E5   02BB 0130
L_51E7:
        DECR    R3                              ; 51E7   0013
        MVI@    R3,     R5                      ; 51E8   029D
        DECR    R3                              ; 51E9   0013
        MVI@    R3,     R0                      ; 51EA   0298
        SLL     R0,     2                       ; 51EB   004C
        SLL     R0,     1                       ; 51EC   0048
        SDBD                                    ; 51ED   0001
        ADDI    #$9210, R0                      ; 51EE   02F8 0010 0092
        MOVR    R0,     R4                      ; 51F1   0084
        ADDR    R5,     R5                      ; 51F2   00ED
        ADDR    R1,     R5                      ; 51F3   00CD
        MVI@    R4,     R0                      ; 51F4   02A0
        MVO@    R0,     R5                      ; 51F5   0268
        MVI@    R4,     R0                      ; 51F6   02A0
        MVO@    R0,     R5                      ; 51F7   0268
        MVI@    R4,     R0                      ; 51F8   02A0
        MVO@    R0,     R5                      ; 51F9   0268
        MVI@    R4,     R0                      ; 51FA   02A0
        MVO@    R0,     R5                      ; 51FB   0268
        MVI@    R4,     R0                      ; 51FC   02A0
        MVO@    R0,     R5                      ; 51FD   0268
        MVI@    R4,     R0                      ; 51FE   02A0
        MVO@    R0,     R5                      ; 51FF   0268
        MVI@    R4,     R0                      ; 5200   02A0
        MVO@    R0,     R5                      ; 5201   0268
        MVI@    R4,     R0                      ; 5202   02A0
        MVO@    R0,     R5                      ; 5203   0268
        DECR    R2                              ; 5204   0012
        BNEQ    L_51E7                          ; 5205   022C 001F

        MVO     R2,     G_011F                  ; 5207   0242 011F
L_5209:
        PULR    R7                              ; 5209   02B7

L_520A:
        PSHR    R5                              ; 520A   0275
        MVII    #$0167, R4                      ; 520B   02BC 0167
        MVII    #$0313, R5                      ; 520D   02BD 0313
        MVI@    R4,     R3                      ; 520F   02A3
        NEGR    R3                              ; 5210   0023
        ADDI    #$0018, R3                      ; 5211   02FB 0018
        SLL     R3,     2                       ; 5213   004F
        ADDR    R3,     R7                      ; 5214   00DF

        MVI@    R5,     R1                      ; 5215   02A9
        MVI@    R1,     R0                      ; 5216   0288
        XOR@    R4,     R0                      ; 5217   03E0
        MVO@    R0,     R1                      ; 5218   0248
        MVI@    R5,     R1                      ; 5219   02A9
        MVI@    R1,     R0                      ; 521A   0288
        XOR@    R4,     R0                      ; 521B   03E0
        MVO@    R0,     R1                      ; 521C   0248
        MVI@    R5,     R1                      ; 521D   02A9
        MVI@    R1,     R0                      ; 521E   0288
        XOR@    R4,     R0                      ; 521F   03E0
        MVO@    R0,     R1                      ; 5220   0248
        MVI@    R5,     R1                      ; 5221   02A9
        MVI@    R1,     R0                      ; 5222   0288
        XOR@    R4,     R0                      ; 5223   03E0
        MVO@    R0,     R1                      ; 5224   0248
        MVI@    R5,     R1                      ; 5225   02A9
        MVI@    R1,     R0                      ; 5226   0288
        XOR@    R4,     R0                      ; 5227   03E0
        MVO@    R0,     R1                      ; 5228   0248
        MVI@    R5,     R1                      ; 5229   02A9
        MVI@    R1,     R0                      ; 522A   0288
        XOR@    R4,     R0                      ; 522B   03E0
        MVO@    R0,     R1                      ; 522C   0248
        MVI@    R5,     R1                      ; 522D   02A9
        MVI@    R1,     R0                      ; 522E   0288
        XOR@    R4,     R0                      ; 522F   03E0
        MVO@    R0,     R1                      ; 5230   0248
        MVI@    R5,     R1                      ; 5231   02A9
        MVI@    R1,     R0                      ; 5232   0288
        XOR@    R4,     R0                      ; 5233   03E0
        MVO@    R0,     R1                      ; 5234   0248
        MVI@    R5,     R1                      ; 5235   02A9
        MVI@    R1,     R0                      ; 5236   0288
        XOR@    R4,     R0                      ; 5237   03E0
        MVO@    R0,     R1                      ; 5238   0248
        MVI@    R5,     R1                      ; 5239   02A9
        MVI@    R1,     R0                      ; 523A   0288
        XOR@    R4,     R0                      ; 523B   03E0
        MVO@    R0,     R1                      ; 523C   0248
        MVI@    R5,     R1                      ; 523D   02A9
        MVI@    R1,     R0                      ; 523E   0288
        XOR@    R4,     R0                      ; 523F   03E0
        MVO@    R0,     R1                      ; 5240   0248
        MVI@    R5,     R1                      ; 5241   02A9
        MVI@    R1,     R0                      ; 5242   0288
        XOR@    R4,     R0                      ; 5243   03E0
        MVO@    R0,     R1                      ; 5244   0248
        MVI@    R5,     R1                      ; 5245   02A9
        MVI@    R1,     R0                      ; 5246   0288
        XOR@    R4,     R0                      ; 5247   03E0
        MVO@    R0,     R1                      ; 5248   0248
        MVI@    R5,     R1                      ; 5249   02A9
        MVI@    R1,     R0                      ; 524A   0288
        XOR@    R4,     R0                      ; 524B   03E0
        MVO@    R0,     R1                      ; 524C   0248
        MVI@    R5,     R1                      ; 524D   02A9
        MVI@    R1,     R0                      ; 524E   0288
        XOR@    R4,     R0                      ; 524F   03E0
        MVO@    R0,     R1                      ; 5250   0248
        MVI@    R5,     R1                      ; 5251   02A9
        MVI@    R1,     R0                      ; 5252   0288
        XOR@    R4,     R0                      ; 5253   03E0
        MVO@    R0,     R1                      ; 5254   0248
        MVI@    R5,     R1                      ; 5255   02A9
        MVI@    R1,     R0                      ; 5256   0288
        XOR@    R4,     R0                      ; 5257   03E0
        MVO@    R0,     R1                      ; 5258   0248
        MVI@    R5,     R1                      ; 5259   02A9
        MVI@    R1,     R0                      ; 525A   0288
        XOR@    R4,     R0                      ; 525B   03E0
        MVO@    R0,     R1                      ; 525C   0248
        MVI@    R5,     R1                      ; 525D   02A9
        MVI@    R1,     R0                      ; 525E   0288
        XOR@    R4,     R0                      ; 525F   03E0
        MVO@    R0,     R1                      ; 5260   0248
        MVI@    R5,     R1                      ; 5261   02A9
        MVI@    R1,     R0                      ; 5262   0288
        XOR@    R4,     R0                      ; 5263   03E0
        MVO@    R0,     R1                      ; 5264   0248
        MVI@    R5,     R1                      ; 5265   02A9
        MVI@    R1,     R0                      ; 5266   0288
        XOR@    R4,     R0                      ; 5267   03E0
        MVO@    R0,     R1                      ; 5268   0248
        MVI@    R5,     R1                      ; 5269   02A9
        MVI@    R1,     R0                      ; 526A   0288
        XOR@    R4,     R0                      ; 526B   03E0
        MVO@    R0,     R1                      ; 526C   0248
        MVI@    R5,     R1                      ; 526D   02A9
        MVI@    R1,     R0                      ; 526E   0288
        XOR@    R4,     R0                      ; 526F   03E0
        MVO@    R0,     R1                      ; 5270   0248
        MVI@    R5,     R1                      ; 5271   02A9
        MVI@    R1,     R0                      ; 5272   0288
        XOR@    R4,     R0                      ; 5273   03E0
        MVO@    R0,     R1                      ; 5274   0248
        CLRR    R0                              ; 5275   01C0
        MVO     R0,     G_0167                  ; 5276   0240 0167
        PULR    R7                              ; 5278   02B7

        DECLE   $0100,  $00C0,  $0080,  $0040   ; 5279   0100 00C0 0080 0040
        DECLE   $0000,  $0040,  $0080,  $00C0   ; 527D   0000 0040 0080 00C0
        DECLE   $0100,  $0140,  $0180,  $01C0   ; 5281   0100 0140 0180 01C0
        DECLE   $0200,  $01C0                   ; 5285   0200 01C0

        ANDR    R0,     R0                      ; 5287   0180
        CMPR    R0,     R0                      ; 5288   0140
L_5289:
        PSHR    R5                              ; 5289   0275
        MOVR    R0,     R1                      ; 528A   0081
        SLL     R1,     1                       ; 528B   0049
        ADDI    #$010E, R1                      ; 528C   02F9 010E
        MVI@    R1,     R1                      ; 528E   0289
        MOVR    R1,     R5                      ; 528F   008D
        SLR     R1,     2                       ; 5290   0065
        SLR     R1,     2                       ; 5291   0065
        ANDI    #$000F, R5                      ; 5292   03BD 000F
        MOVR    R0,     R2                      ; 5294   0082
        ADDI    #$02F0, R2                      ; 5295   02FA 02F0
        MVI@    R2,     R2                      ; 5297   0292
        SWAP    R2,     1                       ; 5298   0042
        INCR    R1                              ; 5299   0009
        ADDR    R7,     R1                      ; 529A   00F9
        ADD@    R1,     R7                      ; 529B   02CF

        DECR    R0                              ; 529C   0010
        RSWD    R0                              ; 529D   0038
        RSWD    R0                              ; 529E   0038
        RSWD    R0                              ; 529F   0038
        RSWD    R0                              ; 52A0   0038
        RSWD    R0                              ; 52A1   0038
        COMR    R0                              ; 52A2   0018
        NEGR    R0                              ; 52A3   0020
        ADCR    R0                              ; 52A4   0028
        ADCR    R0                              ; 52A5   0028
        GSWD    R0                              ; 52A6   0030
        RSWD    R0                              ; 52A7   0038
        RSWD    R0                              ; 52A8   0038
        RSWD    R0                              ; 52A9   0038
        RSWD    R0                              ; 52AA   0038
        RSWD    R0                              ; 52AB   0038
        ANDI    #$00F0, R2                      ; 52AC   03BA 00F0
        SDBD                                    ; 52AE   0001
        MVII    #$9D28, R5                      ; 52AF   02BD 0028 009D
        B       L_52E0                          ; 52B2   0200 002C

        ANDI    #$00F0, R2                      ; 52B4   03BA 00F0
        SDBD                                    ; 52B6   0001
        MVII    #$9E48, R5                      ; 52B7   02BD 0048 009E
        B       L_52E0                          ; 52BA   0200 0024

        ANDI    #$00F0, R2                      ; 52BC   03BA 00F0
        SDBD                                    ; 52BE   0001
        MVII    #$9DF8, R5                      ; 52BF   02BD 00F8 009D
        B       L_52E0                          ; 52C2   0200 001C

        ANDI    #$00F0, R2                      ; 52C4   03BA 00F0
        SDBD                                    ; 52C6   0001
        MVII    #$9DC8, R5                      ; 52C7   02BD 00C8 009D
        B       L_52E0                          ; 52CA   0200 0014

        ANDI    #$0030, R2                      ; 52CC   03BA 0030
        SDBD                                    ; 52CE   0001
        MVII    #$9E68, R5                      ; 52CF   02BD 0068 009E
        B       L_52E0                          ; 52D2   0200 000C

        ANDI    #$0070, R2                      ; 52D4   03BA 0070
        SDBD                                    ; 52D6   0001
        ADDI    #$5279, R5                      ; 52D7   02FD 0079 0052
        MVI@    R5,     R5                      ; 52DA   02AD
        ADDR    R5,     R5                      ; 52DB   00ED
        SDBD                                    ; 52DC   0001
        ADDI    #$98A8, R5                      ; 52DD   02FD 00A8 0098
L_52E0:
        ADDR    R2,     R5                      ; 52E0   00D5
        MOVR    R0,     R4                      ; 52E1   0084
        ADDR    R4,     R4                      ; 52E2   00E4
        ADDR    R4,     R4                      ; 52E3   00E4
        ADDR    R4,     R4                      ; 52E4   00E4
        ADDR    R4,     R4                      ; 52E5   00E4
        SDBD                                    ; 52E6   0001
        ADDI    #$3980, R4                      ; 52E7   02FC 0080 0039
        MVI@    R5,     R1                      ; 52EA   02A9
        MVO@    R1,     R4                      ; 52EB   0261
        MVI@    R5,     R1                      ; 52EC   02A9
        MVO@    R1,     R4                      ; 52ED   0261
        MVI@    R5,     R1                      ; 52EE   02A9
        MVO@    R1,     R4                      ; 52EF   0261
        MVI@    R5,     R1                      ; 52F0   02A9
        MVO@    R1,     R4                      ; 52F1   0261
        MVI@    R5,     R1                      ; 52F2   02A9
        MVO@    R1,     R4                      ; 52F3   0261
        MVI@    R5,     R1                      ; 52F4   02A9
        MVO@    R1,     R4                      ; 52F5   0261
        MVI@    R5,     R1                      ; 52F6   02A9
        MVO@    R1,     R4                      ; 52F7   0261
        MVI@    R5,     R1                      ; 52F8   02A9
        MVO@    R1,     R4                      ; 52F9   0261
        MVI@    R5,     R1                      ; 52FA   02A9
        MVO@    R1,     R4                      ; 52FB   0261
        MVI@    R5,     R1                      ; 52FC   02A9
        MVO@    R1,     R4                      ; 52FD   0261
        MVI@    R5,     R1                      ; 52FE   02A9
        MVO@    R1,     R4                      ; 52FF   0261
        MVI@    R5,     R1                      ; 5300   02A9
        MVO@    R1,     R4                      ; 5301   0261
        MVI@    R5,     R1                      ; 5302   02A9
        MVO@    R1,     R4                      ; 5303   0261
        MVI@    R5,     R1                      ; 5304   02A9
        MVO@    R1,     R4                      ; 5305   0261
        MVI@    R5,     R1                      ; 5306   02A9
        MVO@    R1,     R4                      ; 5307   0261
        MVI@    R5,     R1                      ; 5308   02A9
        MVO@    R1,     R4                      ; 5309   0261
        PULR    R7                              ; 530A   02B7

L_530B:
        PSHR    R5                              ; 530B   0275
        MVI     G_0131, R0                      ; 530C   0280 0131
        ANDI    #$0006, R0                      ; 530E   03B8 0006

        JSR     R5,     L_5289                  ; 5310   0004 0150 0289

        INCR    R0                              ; 5313   0008

        JSR     R5,     L_5289                  ; 5314   0004 0150 0289

        MVI     G_0131, R0                      ; 5317   0280 0131
        ADDI    #$0002, R0                      ; 5319   02F8 0002
        ANDI    #$0006, R0                      ; 531B   03B8 0006
        MVO     R0,     G_0131                  ; 531D   0240 0131
L_531F:
        PULR    R7                              ; 531F   02B7

L_5320:
        PSHR    R5                              ; 5320   0275
        MVI     G_0310, R0                      ; 5321   0280 0310
        SLL     R0,     2                       ; 5323   004C
        SLR     R0,     2                       ; 5324   0064
        MVII    #$0179, R1                      ; 5325   02B9 0179
L_5327:
        TSTR    R0                              ; 5327   0080
        BEQ     L_531F                          ; 5328   0224 000A

L_532A:
        ADDI    #$0008, R1                      ; 532A   02F9 0008
        RRC     R0,     1                       ; 532C   0070
        BNC     L_532A                          ; 532D   0229 0004

        MVI@    R1,     R3                      ; 532F   028B
        SARC    R3,     1                       ; 5330   007B
        BNC     L_5327                          ; 5331   0229 000B

        SLL     R3,     1                       ; 5333   004B
        MVO@    R3,     R1                      ; 5334   024B
        MOVR    R1,     R4                      ; 5335   008C
        ADDI    #$0003, R4                      ; 5336   02FC 0003
        MVI@    R4,     R2                      ; 5338   02A2
        ADDI    #$0200, R2                      ; 5339   02FA 0200
        MOVR    R4,     R5                      ; 533B   00A5
        SDBD                                    ; 533C   0001
        MVI@    R4,     R3                      ; 533D   02A3
        MVI@    R2,     R4                      ; 533E   0294
        MVO@    R3,     R2                      ; 533F   0253
        MOVR    R4,     R3                      ; 5340   00A3
        MVO@    R3,     R5                      ; 5341   026B
        SWAP    R3,     1                       ; 5342   0043
        MVO@    R3,     R5                      ; 5343   026B
        B       L_5327                          ; 5344   0220 001E

L_5346:
        PSHR    R5                              ; 5346   0275
        MVII    #$02F0, R4                      ; 5347   02BC 02F0
        CLRR    R5                              ; 5349   01ED
        MVI@    R4,     R0                      ; 534A   02A0
        MVO@    R0,     R5                      ; 534B   0268
        MVI@    R4,     R0                      ; 534C   02A0
        MVO@    R0,     R5                      ; 534D   0268
        MVI@    R4,     R0                      ; 534E   02A0
        MVO@    R0,     R5                      ; 534F   0268
        MVI@    R4,     R0                      ; 5350   02A0
        MVO@    R0,     R5                      ; 5351   0268
        MVI@    R4,     R0                      ; 5352   02A0
        MVO@    R0,     R5                      ; 5353   0268
        MVI@    R4,     R0                      ; 5354   02A0
        MVO@    R0,     R5                      ; 5355   0268
        MVI@    R4,     R0                      ; 5356   02A0
        MVO@    R0,     R5                      ; 5357   0268
        MVI@    R4,     R0                      ; 5358   02A0
        MVO@    R0,     R5                      ; 5359   0268
        MVI@    R4,     R0                      ; 535A   02A0
        MVO@    R0,     R5                      ; 535B   0268
        MVI@    R4,     R0                      ; 535C   02A0
        MVO@    R0,     R5                      ; 535D   0268
        MVI@    R4,     R0                      ; 535E   02A0
        MVO@    R0,     R5                      ; 535F   0268
        MVI@    R4,     R0                      ; 5360   02A0
        MVO@    R0,     R5                      ; 5361   0268
        MVI@    R4,     R0                      ; 5362   02A0
        MVO@    R0,     R5                      ; 5363   0268
        MVI@    R4,     R0                      ; 5364   02A0
        MVO@    R0,     R5                      ; 5365   0268
        MVI@    R4,     R0                      ; 5366   02A0
        MVO@    R0,     R5                      ; 5367   0268
        MVI@    R4,     R0                      ; 5368   02A0
        MVO@    R0,     R5                      ; 5369   0268
        MVI@    R4,     R0                      ; 536A   02A0
        MVO@    R0,     R5                      ; 536B   0268
        MVI@    R4,     R0                      ; 536C   02A0
        MVO@    R0,     R5                      ; 536D   0268
        MVI@    R4,     R0                      ; 536E   02A0
        MVO@    R0,     R5                      ; 536F   0268
        MVI@    R4,     R0                      ; 5370   02A0
        MVO@    R0,     R5                      ; 5371   0268
        MVI@    R4,     R0                      ; 5372   02A0
        MVO@    R0,     R5                      ; 5373   0268
        MVI@    R4,     R0                      ; 5374   02A0
        MVO@    R0,     R5                      ; 5375   0268
        MVI@    R4,     R0                      ; 5376   02A0
        MVO@    R0,     R5                      ; 5377   0268
        MVI@    R4,     R0                      ; 5378   02A0
        MVO@    R0,     R5                      ; 5379   0268
        MVI     G_0104, R0                      ; 537A   0280 0104
        MVO     R0,     .STIC.VDLY              ; 537C   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 537E   0240 0020
        PULR    R7                              ; 5380   02B7

L_5381:
        PSHR    R5                              ; 5381   0275
        MVII    #$0214, R1                      ; 5382   02B9 0214
        MVII    #$02DC, R2                      ; 5384   02BA 02DC
        MVII    #$000B, R3                      ; 5386   02BB 000B
L_5388:
        MOVR    R1,     R0                      ; 5388   0088
        MOVR    R2,     R4                      ; 5389   0094

        JSR     R5,     L_5598                  ; 538A   0004 0154 0198

        XORI    #$00DC, R2                      ; 538D   03FA 00DC
        MOVR    R2,     R0                      ; 538F   0090
        MOVR    R1,     R4                      ; 5390   008C

        JSR     R5,     L_5598                  ; 5391   0004 0154 0198

        MOVR    R4,     R1                      ; 5394   00A1
        DECR    R3                              ; 5395   0013
        BNEQ    L_5388                          ; 5396   022C 000F
        PULR    R7                              ; 5398   02B7

L_5399:
        PSHR    R5                              ; 5399   0275
        MVI     G_0107, R5                      ; 539A   0285 0107
        INCR    R5                              ; 539C   000D
        ANDI    #$0003, R5                      ; 539D   03BD 0003
        MVO     R5,     G_0107                  ; 539F   0245 0107
        BNEQ    L_53B3                          ; 53A1   020C 0010

        MVI     G_0106, R5                      ; 53A3   0285 0106
        INCR    R5                              ; 53A5   000D
        MVO     R5,     G_0106                  ; 53A6   0245 0106
        SUBI    #$0003, R5                      ; 53A8   033D 0003
        BMI     L_53B3                          ; 53AA   020B 0007

        MVO     R5,     G_0106                  ; 53AC   0245 0106
        MVI     G_0105, R5                      ; 53AE   0285 0105
        INCR    R5                              ; 53B0   000D
        MVO     R5,     G_0105                  ; 53B1   0245 0105
L_53B3:
        PULR    R7                              ; 53B3   02B7

L_53B4:
        PSHR    R5                              ; 53B4   0275
        MVII    #$010F, R3                      ; 53B5   02BB 010F
        MVII    #$02F8, R4                      ; 53B7   02BC 02F8
        MOVR    R4,     R5                      ; 53B9   00A5
L_53BA:
        MVI@    R4,     R0                      ; 53BA   02A0
        MOVR    R0,     R1                      ; 53BB   0081
        BEQ     L_53CA                          ; 53BC   0204 000C

        ANDI    #$007F, R1                      ; 53BE   03B9 007F
        CMPI    #$006C, R1                      ; 53C0   0379 006C
        BGE     L_53CA                          ; 53C2   020D 0006

        ADDI    #$0008, R0                      ; 53C4   02F8 0008
        MVI@    R3,     R2                      ; 53C6   029A
        ADDI    #$0014, R2                      ; 53C7   02FA 0014
        MVO@    R2,     R3                      ; 53C9   025A
L_53CA:
        MVO@    R0,     R5                      ; 53CA   0268
        ADDI    #$0002, R3                      ; 53CB   02FB 0002
        CMPI    #$0300, R4                      ; 53CD   037C 0300
        BMI     L_53BA                          ; 53CF   022B 0016

        MVI     G_02F8, R0                      ; 53D1   0280 02F8
        ANDI    #$007F, R0                      ; 53D3   03B8 007F
        MVO     R0,     G_0162                  ; 53D5   0240 0162
        PULR    R7                              ; 53D7   02B7

L_53D8:
        PSHR    R5                              ; 53D8   0275

        JSR     R5,     L_55C3                  ; 53D9   0004 0154 01C3

        MVII    #$0001, R1                      ; 53DC   02B9 0001
        MVI     G_0310, R0                      ; 53DE   0280 0310
        SLL     R0,     2                       ; 53E0   004C
        SLR     R0,     2                       ; 53E1   0064
        MVII    #$0180, R3                      ; 53E2   02BB 0180
L_53E4:
        CLRC                                    ; 53E4   0006
        RRC     R0,     1                       ; 53E5   0070
        BNC     L_5458                          ; 53E6   0209 0070

        MVI@    R3,     R2                      ; 53E8   029A
        SLR     R2,     2                       ; 53E9   0066
        SLR     R2,     2                       ; 53EA   0066
        INCR    R2                              ; 53EB   000A
        ADDR    R7,     R2                      ; 53EC   00FA
        ADD@    R2,     R7                      ; 53ED   02D7

        SAR     R2,     1                       ; 53EE   006A
        DECR    R0                              ; 53EF   0010
        DECR    R0                              ; 53F0   0010
        SWAP    R1,     2                       ; 53F1   0045
        RLC     R1,     2                       ; 53F2   0055
        SAR     R2,     1                       ; 53F3   006A
        GSWD    R3                              ; 53F4   0033
        GSWD    R3                              ; 53F5   0033
        DECR    R0                              ; 53F6   0010
        DECR    R0                              ; 53F7   0010
        DECR    R0                              ; 53F8   0010
        SAR     R2,     1                       ; 53F9   006A
        DECR    R0                              ; 53FA   0010
        SAR     R2,     1                       ; 53FB   006A
        GSWD    R3                              ; 53FC   0033
        GSWD    R3                              ; 53FD   0033
        ADDI    #$0003, R3                      ; 53FE   02FB 0003
        MVI@    R3,     R2                      ; 5400   029A
        ADDI    #$0008, R2                      ; 5401   02FA 0008
        MVO@    R2,     R3                      ; 5403   025A
        INCR    R3                              ; 5404   000B
        MVI@    R3,     R2                      ; 5405   029A
        ADDI    #$0014, R2                      ; 5406   02FA 0014
        MVO@    R2,     R3                      ; 5408   025A
        SUBI    #$0004, R3                      ; 5409   033B 0004
        CMPI    #$00F0, R2                      ; 540B   037A 00F0
        BMI     L_5458                          ; 540D   020B 0049

        PSHR    R0                              ; 540F   0270
        PSHR    R1                              ; 5410   0271
        COMR    R1                              ; 5411   0019
        AND     G_0310, R1                      ; 5412   0381 0310
        MVO     R1,     G_0310                  ; 5414   0241 0310
        MOVR    R3,     R1                      ; 5416   0099
        ADDI    #$0007, R1                      ; 5417   02F9 0007
        MVI@    R1,     R0                      ; 5419   0288

        JSR     R5,     L_691E                  ; 541A   0004 0168 011E

        PULR    R1                              ; 541D   02B1
        PULR    R0                              ; 541E   02B0
        B       L_5458                          ; 541F   0200 0037

        MOVR    R3,     R4                      ; 5421   009C
        ADDI    #$0002, R4                      ; 5422   02FC 0002
        MOVR    R4,     R5                      ; 5424   00A5
        MVI@    R4,     R2                      ; 5425   02A2
        ADDI    #$0014, R2                      ; 5426   02FA 0014
        MVO@    R2,     R5                      ; 5428   026A
        MVI@    R4,     R2                      ; 5429   02A2
        ADDI    #$0014, R2                      ; 542A   02FA 0014
        MVO@    R2,     R5                      ; 542C   026A
        MVI@    R4,     R2                      ; 542D   02A2
        ADDI    #$0014, R2                      ; 542E   02FA 0014
        MVO@    R2,     R5                      ; 5430   026A
        B       L_5458                          ; 5431   0200 0025

        ADDI    #$0003, R3                      ; 5433   02FB 0003
        MVI@    R3,     R2                      ; 5435   029A
        ADDI    #$0008, R2                      ; 5436   02FA 0008
        MVO@    R2,     R3                      ; 5438   025A
        ADDI    #$0003, R3                      ; 5439   02FB 0003
        MVI@    R3,     R2                      ; 543B   029A
        ADDI    #$0014, R2                      ; 543C   02FA 0014
        MVO@    R2,     R3                      ; 543E   025A
        SUBI    #$0006, R3                      ; 543F   033B 0006
        B       L_5458                          ; 5441   0200 0015

        ADDI    #$0002, R3                      ; 5443   02FB 0002
        MVI@    R3,     R2                      ; 5445   029A
        ADDI    #$0014, R2                      ; 5446   02FA 0014
        MVO@    R2,     R3                      ; 5448   025A
        INCR    R3                              ; 5449   000B
        MVI@    R3,     R2                      ; 544A   029A
        ADDI    #$0014, R2                      ; 544B   02FA 0014
        MVO@    R2,     R3                      ; 544D   025A
        ADDI    #$0003, R3                      ; 544E   02FB 0003
        MVI@    R3,     R2                      ; 5450   029A
        ADDI    #$0014, R2                      ; 5451   02FA 0014
        MVO@    R2,     R3                      ; 5453   025A
        SUBI    #$0006, R3                      ; 5454   033B 0006
        B       L_5458                          ; 5456   0200 0000

L_5458:
        ADDI    #$0008, R3                      ; 5458   02FB 0008
        SLL     R1,     1                       ; 545A   0049
        TSTR    R0                              ; 545B   0080
        BNEQ    L_53E4                          ; 545C   022C 0079
        PULR    R7                              ; 545E   02B7

L_545F:
        PSHR    R5                              ; 545F   0275
        MVI     G_015E, R0                      ; 5460   0280 015E
        ANDI    #$0002, R0                      ; 5462   03B8 0002
        BEQ     L_53B3                          ; 5464   0224 00B2

        XOR     G_015E, R0                      ; 5466   03C0 015E
        MVO     R0,     G_015E                  ; 5468   0240 015E
        MVI     G_02F8, R0                      ; 546A   0280 02F8
        DECR    R0                              ; 546C   0010
        MVO     R0,     G_02F8                  ; 546D   0240 02F8
        MVI     G_0162, R0                      ; 546F   0280 0162
        DECR    R0                              ; 5471   0010
        MVO     R0,     G_0162                  ; 5472   0240 0162
        MVI     G_0104, R0                      ; 5474   0280 0104
        INCR    R0                              ; 5476   0008
        ANDI    #$0007, R0                      ; 5477   03B8 0007
        MVO     R0,     G_0104                  ; 5479   0240 0104
        BNEQ    L_53B3                          ; 547B   022C 00C9

        MVI     G_015E, R0                      ; 547D   0280 015E
        XORI    #$0001, R0                      ; 547F   03F8 0001
        MVO     R0,     G_015E                  ; 5481   0240 015E
        DIS                                     ; 5483   0003

        JSR     R5,     L_53B4                  ; 5484   0004 0150 03B4

        EIS                                     ; 5487   0002

        JSR     R5,     L_68B2                  ; 5488   0004 0168 00B2

        CLRR    R0                              ; 548B   01C0
        MVI     G_013F, R1                      ; 548C   0281 013F
        MVO     R0,     G_013F                  ; 548E   0240 013F
        INCR    R1                              ; 5490   0009
        ADDR    R7,     R1                      ; 5491   00F9
        ADD@    R1,     R7                      ; 5492   02CF

        TSTR    R0                              ; 5493   0080
        INCR    R4                              ; 5494   000C
        DECR    R6                              ; 5495   0016
        NEGR    R0                              ; 5496   0020
        ADCR    R2                              ; 5497   002A
        NOP                                     ; 5498   0034
        RSWD    R6                              ; 5499   003E
        SLL     R0,     1                       ; 549A   0048
        SLLC    R2,     1                       ; 549B   005A
        SLR     R0,     2                       ; 549C   0064
        SAR     R2,     2                       ; 549D   006E
        SARC    R0,     1                       ; 549E   0078

        JSR     R5,     L_6859                  ; 549F   0004 0168 0059
        BIDECLE $9338,  $3870                   ; 54A2   0038 0093 0070 0038
        DECLE   $0008                           ; 54A6   0008

        B       L_5513                          ; 54A7   0200 006A

        JSR     R5,     L_6859                  ; 54A9   0004 0168 0059
        BIDECLE $9378,  $38B0                   ; 54AC   0078 0093 00B0 0038
        DECLE   $0007                           ; 54B0   0007

        B       L_5513                          ; 54B1   0200 0060

        JSR     R5,     L_6859                  ; 54B3   0004 0168 0059
        BIDECLE $93B0,  $3838                   ; 54B6   00B0 0093 0038 0038
        DECLE   $0007                           ; 54BA   0007

        B       L_5513                          ; 54BB   0200 0056

        JSR     R5,     L_6859                  ; 54BD   0004 0168 0059
        BIDECLE $93E8,  $3898                   ; 54C0   00E8 0093 0098 0038
        DECLE   $000A                           ; 54C4   000A

        B       L_5513                          ; 54C5   0200 004C

        JSR     R5,     L_6859                  ; 54C7   0004 0168 0059
        BIDECLE $9438,  $3858                   ; 54CA   0038 0094 0058 0038
        DECLE   $0008                           ; 54CE   0008

        B       L_5513                          ; 54CF   0200 0042

        JSR     R5,     L_6859                  ; 54D1   0004 0168 0059
        BIDECLE $9478,  $3838                   ; 54D4   0078 0094 0038 0038
        DECLE   $000C                           ; 54D8   000C

        B       L_5513                          ; 54D9   0200 0038

        JSR     R5,     L_6859                  ; 54DB   0004 0168 0059
        BIDECLE $9590,  $3898                   ; 54DE   0090 0095 0098 0038
        DECLE   $0004                           ; 54E2   0004

        JSR     R5,     L_6859                  ; 54E3   0004 0168 0059
        BIDECLE $9588,  $3810                   ; 54E6   0088 0095 0010 0038
        DECLE   $0005                           ; 54EA   0005

        B       L_5513                          ; 54EB   0200 0026

        JSR     R5,     L_6859                  ; 54ED   0004 0168 0059
        BIDECLE $9310,  $3888                   ; 54F0   0010 0093 0088 0038
        DECLE   $0002                           ; 54F4   0002

        B       L_5513                          ; 54F5   0200 001C

        JSR     R5,     L_6859                  ; 54F7   0004 0168 0059
        BIDECLE $9650,  $3878                   ; 54FA   0050 0096 0078 0038
        DECLE   $0008                           ; 54FE   0008

        B       L_5513                          ; 54FF   0200 0012

        JSR     R5,     L_6859                  ; 5501   0004 0168 0059
        BIDECLE $9690,  $3838                   ; 5504   0090 0096 0038 0038
        DECLE   $0008                           ; 5508   0008

        B       L_5513                          ; 5509   0200 0008

        JSR     R5,     L_6859                  ; 550B   0004 0168 0059
        BIDECLE $9248,  $3838                   ; 550E   0048 0092 0038 0038
        DECLE   $0005                           ; 5512   0005
L_5513:
        JSR     R5,     L_5346                  ; 5513   0004 0150 0346

        MVI     G_035F, R0                      ; 5516   0280 035F
        INCR    R0                              ; 5518   0008
        MVO     R0,     G_035F                  ; 5519   0240 035F

        JSR     R5,     L_6DF1                  ; 551B   0004 016C 01F1
        JSR     R5,     L_5381                  ; 551E   0004 0150 0381
        JSR     R5,     L_53D8                  ; 5521   0004 0150 03D8
        JSR     R5,     L_556B                  ; 5524   0004 0154 016B
        DECLE   $0004                           ; 5527   0004

        ANDR    R4,     R4                      ; 5528   01A4
        SUBR    R1,     R0                      ; 5529   0108
        MVI     G_015E, R0                      ; 552A   0280 015E
        XORI    #$0001, R0                      ; 552C   03F8 0001
        MVO     R0,     G_015E                  ; 552E   0240 015E
        PULR    R7                              ; 5530   02B7

L_5531:
        MVI@    R3,     R0                      ; 5531   0298
        INCR    R3                              ; 5532   000B
        PSHR    R5                              ; 5533   0275
        SLL     R0,     2                       ; 5534   004C
        NOP                                     ; 5535   0034
        SLL     R0,     2                       ; 5536   004C
        MVI     G_032B, R4                      ; 5537   0284 032B
        MVI     G_0107, R1                      ; 5539   0281 0107
        SLL     R1,     2                       ; 553B   004D
        SDBD                                    ; 553C   0001
        ADDI    #$9FBD, R1                      ; 553D   02F9 00BD 009F
        ADDR    R0,     R1                      ; 5540   00C1
        MVI@    R1,     R5                      ; 5541   028D
        INCR    R1                              ; 5542   0009
        ADDR    R5,     R5                      ; 5543   00ED
        SDBD                                    ; 5544   0001
        ADDI    #$9EB9, R5                      ; 5545   02FD 00B9 009E
        SDBD                                    ; 5548   0001
        MVI@    R5,     R0                      ; 5549   02A8
        MVO@    R0,     R4                      ; 554A   0260
        MVI@    R1,     R5                      ; 554B   028D
        INCR    R1                              ; 554C   0009
        ADDR    R5,     R5                      ; 554D   00ED
        SDBD                                    ; 554E   0001
        ADDI    #$9EB9, R5                      ; 554F   02FD 00B9 009E
        SDBD                                    ; 5552   0001
        MVI@    R5,     R0                      ; 5553   02A8
        MVO@    R0,     R4                      ; 5554   0260
        MVI@    R1,     R5                      ; 5555   028D
        INCR    R1                              ; 5556   0009
        ADDR    R5,     R5                      ; 5557   00ED
        SDBD                                    ; 5558   0001
        ADDI    #$9EB9, R5                      ; 5559   02FD 00B9 009E
        SDBD                                    ; 555C   0001
        MVI@    R5,     R0                      ; 555D   02A8
        MVO@    R0,     R4                      ; 555E   0260
        MVI@    R1,     R5                      ; 555F   028D
        ADDR    R5,     R5                      ; 5560   00ED
        SDBD                                    ; 5561   0001
        ADDI    #$9EB9, R5                      ; 5562   02FD 00B9 009E
        SDBD                                    ; 5565   0001
        MVI@    R5,     R0                      ; 5566   02A8
        MVO@    R0,     R4                      ; 5567   0260
        MVO     R4,     G_032B                  ; 5568   0244 032B
        PULR    R7                              ; 556A   02B7

L_556B:
        MVII    #$0200, R3                      ; 556B   02BB 0200
        MVO     R3,     G_032B                  ; 556D   0243 032B
        PSHR    R5                              ; 556F   0275
        MVI     G_0105, R3                      ; 5570   0283 0105
        SDBD                                    ; 5572   0001
        ADDI    #$A4CC, R3                      ; 5573   02FB 00CC 00A4
        MVI@    R3,     R3                      ; 5576   029B
        ANDI    #$003F, R3                      ; 5577   03BB 003F
        PSHR    R3                              ; 5579   0273
        SLL     R3,     2                       ; 557A   004F
        ADD     G_0106, R3                      ; 557B   02C3 0106
        SLL     R3,     2                       ; 557D   004F
        ADD     G_0106, R3                      ; 557E   02C3 0106
        SUB@    R6,     R3                      ; 5580   0333
        SDBD                                    ; 5581   0001
        ADDI    #$A2DD, R3                      ; 5582   02FB 00DD 00A2

        JSR     R5,     L_5531                  ; 5585   0004 0154 0131
        JSR     R5,     L_5531                  ; 5588   0004 0154 0131
        JSR     R5,     L_5531                  ; 558B   0004 0154 0131
        JSR     R5,     L_5531                  ; 558E   0004 0154 0131
        JSR     R5,     L_5531                  ; 5591   0004 0154 0131
        JSR     R5,     L_5399                  ; 5594   0004 0150 0399

        PULR    R7                              ; 5597   02B7

L_5598:
        PSHR    R5                              ; 5598   0275
        MOVR    R0,     R5                      ; 5599   0085
        MVI@    R5,     R0                      ; 559A   02A8
        MVO@    R0,     R4                      ; 559B   0260
        MVI@    R5,     R0                      ; 559C   02A8
        MVO@    R0,     R4                      ; 559D   0260
        MVI@    R5,     R0                      ; 559E   02A8
        MVO@    R0,     R4                      ; 559F   0260
        MVI@    R5,     R0                      ; 55A0   02A8
        MVO@    R0,     R4                      ; 55A1   0260
        MVI@    R5,     R0                      ; 55A2   02A8
        MVO@    R0,     R4                      ; 55A3   0260
        MVI@    R5,     R0                      ; 55A4   02A8
        MVO@    R0,     R4                      ; 55A5   0260
        MVI@    R5,     R0                      ; 55A6   02A8
        MVO@    R0,     R4                      ; 55A7   0260
        MVI@    R5,     R0                      ; 55A8   02A8
        MVO@    R0,     R4                      ; 55A9   0260
        MVI@    R5,     R0                      ; 55AA   02A8
        MVO@    R0,     R4                      ; 55AB   0260
        MVI@    R5,     R0                      ; 55AC   02A8
        MVO@    R0,     R4                      ; 55AD   0260
        MVI@    R5,     R0                      ; 55AE   02A8
        MVO@    R0,     R4                      ; 55AF   0260
        MVI@    R5,     R0                      ; 55B0   02A8
        MVO@    R0,     R4                      ; 55B1   0260
        MVI@    R5,     R0                      ; 55B2   02A8
        MVO@    R0,     R4                      ; 55B3   0260
        MVI@    R5,     R0                      ; 55B4   02A8
        MVO@    R0,     R4                      ; 55B5   0260
        MVI@    R5,     R0                      ; 55B6   02A8
        MVO@    R0,     R4                      ; 55B7   0260
        MVI@    R5,     R0                      ; 55B8   02A8
        MVO@    R0,     R4                      ; 55B9   0260
        MVI@    R5,     R0                      ; 55BA   02A8
        MVO@    R0,     R4                      ; 55BB   0260
        MVI@    R5,     R0                      ; 55BC   02A8
        MVO@    R0,     R4                      ; 55BD   0260
        MVI@    R5,     R0                      ; 55BE   02A8
        MVO@    R0,     R4                      ; 55BF   0260
        MVI@    R5,     R0                      ; 55C0   02A8
        MVO@    R0,     R4                      ; 55C1   0260
        PULR    R7                              ; 55C2   02B7

L_55C3:
        MVII    #$00FF, R1                      ; 55C3   02B9 00FF
        MVII    #$0137, R3                      ; 55C5   02BB 0137
L_55C7:
        MVI@    R3,     R0                      ; 55C7   0298
        ADDI    #$0014, R0                      ; 55C8   02F8 0014
        CMPI    #$00C8, R0                      ; 55CA   0378 00C8
        BMI     L_55CF                          ; 55CC   020B 0001

        MOVR    R1,     R0                      ; 55CE   0088
L_55CF:
        MVO@    R0,     R3                      ; 55CF   0258
        INCR    R3                              ; 55D0   000B
        CMPI    #$013B, R3                      ; 55D1   037B 013B
        BMI     L_55C7                          ; 55D3   022B 000D
        MOVR    R5,     R7                      ; 55D5   00AF

L_55D6:
        PSHR    R5                              ; 55D6   0275
        MVII    #$0180, R5                      ; 55D7   02BD 0180
        PSHR    R0                              ; 55D9   0270
        PSHR    R1                              ; 55DA   0271
        MVI     G_0310, R0                      ; 55DB   0280 0310
        MVII    #$0001, R1                      ; 55DD   02B9 0001
        B       L_55E6                          ; 55DF   0200 0005

L_55E1:
        ADDI    #$0008, R5                      ; 55E1   02FD 0008
        SLLC    R1,     1                       ; 55E3   0059
        BC      L_55EB                          ; 55E4   0201 0005

L_55E6:
        SARC    R0,     1                       ; 55E6   0078
        BC      L_55E1                          ; 55E7   0221 0007

        MVO     R1,     G_0331                  ; 55E9   0241 0331
L_55EB:
        PULR    R1                              ; 55EB   02B1
        PULR    R0                              ; 55EC   02B0
L_55ED:
        PULR    R7                              ; 55ED   02B7

L_55EE:
        PSHR    R5                              ; 55EE   0275

        JSR     R5,     L_5AB1                  ; 55EF   0004 0158 02B1

        BC      L_55ED                          ; 55F2   0221 0006

        JSR     R5,     L_55D6                  ; 55F4   0004 0154 01D6

        BC      L_55ED                          ; 55F7   0221 000B

        PSHR    R0                              ; 55F9   0270
        MVII    #$0030, R0                      ; 55FA   02B8 0030
        MVO@    R0,     R5                      ; 55FC   0268
        PULR    R0                              ; 55FD   02B0
        SLL     R3,     1                       ; 55FE   004B
        MVO@    R3,     R5                      ; 55FF   026B
        NOP                                     ; 5600   0034
        MVO@    R0,     R5                      ; 5601   0268
        MVO@    R1,     R5                      ; 5602   0269
        MVII    #$00FF, R0                      ; 5603   02B8 00FF
        MVO@    R0,     R5                      ; 5605   0268
        MVO@    R4,     R5                      ; 5606   026C
        NOP                                     ; 5607   0034
        MVO@    R2,     R5                      ; 5608   026A
        MVO@    R0,     R5                      ; 5609   0268
        MVI     G_0310, R0                      ; 560A   0280 0310
        XOR     G_0331, R0                      ; 560C   03C0 0331
        MVO     R0,     G_0310                  ; 560E   0240 0310

        JSR     R5,     L_6DBE                  ; 5610   0004 016C 01BE
        DECLE   $0000                           ; 5613   0000

        PULR    R7                              ; 5614   02B7

L_5615:
        PSHR    R5                              ; 5615   0275
        ANDI    #$00FF, R0                      ; 5616   03B8 00FF
        CMPI    #$00F0, R0                      ; 5618   0378 00F0
        BGE     L_55ED                          ; 561A   022D 002E

        JSR     R5,     L_55D6                  ; 561C   0004 0154 01D6

        BC      L_55ED                          ; 561F   0221 0033

        PSHR    R0                              ; 5621   0270
        MVII    #$0040, R0                      ; 5622   02B8 0040
        MVO@    R0,     R5                      ; 5624   0268
        PULR    R0                              ; 5625   02B0
        MVII    #$0040, R3                      ; 5626   02BB 0040
        MVO@    R3,     R5                      ; 5628   026B
        MVO@    R0,     R5                      ; 5629   0268
        MVII    #$00FF, R0                      ; 562A   02B8 00FF
        MVO@    R1,     R5                      ; 562C   0269
        MVO@    R0,     R5                      ; 562D   0268
        MVO@    R4,     R5                      ; 562E   026C
        NOP                                     ; 562F   0034
        MVO@    R1,     R5                      ; 5630   0269
        MVO@    R0,     R5                      ; 5631   0268
        MVI     G_0310, R0                      ; 5632   0280 0310
        XOR     G_0331, R0                      ; 5634   03C0 0331
        MVO     R0,     G_0310                  ; 5636   0240 0310

        JSR     R5,     L_6DBE                  ; 5638   0004 016C 01BE
        DECLE   $0003                           ; 563B   0003

        PULR    R7                              ; 563C   02B7

L_563D:
        PSHR    R5                              ; 563D   0275
        MVI     G_0312, R4                      ; 563E   0284 0312
        ADDI    #$0002, R4                      ; 5640   02FC 0002
        MVI@    R4,     R0                      ; 5642   02A0
        MVI@    R4,     R1                      ; 5643   02A1
        INCR    R4                              ; 5644   000C
        MVI@    R4,     R3                      ; 5645   02A3
        MVI@    R4,     R2                      ; 5646   02A2
        ADDI    #$0200, R2                      ; 5647   02FA 0200
        MVI     G_0312, R4                      ; 5649   0284 0312
        MVO@    R3,     R4                      ; 564B   0263
        ADDI    #$0003, R4                      ; 564C   02FC 0003
        MVO@    R2,     R4                      ; 564E   0262

        JSR     R5,     L_6949                  ; 564F   0004 0168 0149

        BLE     L_5674                          ; 5652   0206 0020

        PSHR    R0                              ; 5654   0270
        INCR    R5                              ; 5655   000D
        MVI@    R2,     R0                      ; 5656   0290
        MVI@    R5,     R3                      ; 5657   02AB
        ADDI    #$0003, R5                      ; 5658   02FD 0003
        SDBD                                    ; 565A   0001
        MVI@    R5,     R2                      ; 565B   02AA
        SARC    R3,     1                       ; 565C   007B
        BNC     L_5662                          ; 565D   0209 0003

        XORR    R0,     R2                      ; 565F   01C2
        XORR    R2,     R0                      ; 5660   01D0
        XORR    R0,     R2                      ; 5661   01C2
L_5662:
        MVO@    R2,     R4                      ; 5662   0262
        SWAP    R2,     1                       ; 5663   0042
        MVO@    R2,     R4                      ; 5664   0262
        ANDI    #$00F8, R0                      ; 5665   03B8 00F8
        ANDI    #$0007, R1                      ; 5667   03B9 0007
        XORR    R0,     R1                      ; 5669   01C1
        MVO@    R1,     R4                      ; 566A   0261
        PULR    R0                              ; 566B   02B0

        JSR     R5,     L_687C                  ; 566C   0004 0168 007C

        MOVR    R5,     R0                      ; 566F   00A8

        JSR     R5,     L_69F8                  ; 5670   0004 0168 01F8

        PULR    R7                              ; 5673   02B7

L_5674:
        PSHR    R4                              ; 5674   0274

        JSR     R5,     L_6903                  ; 5675   0004 0168 0103

        MVI@    R2,     R4                      ; 5678   0294
        SDBD                                    ; 5679   0001
        ANDI    #$0FF8, R4                      ; 567A   03BC 00F8 000F

        JSR     R5,     L_6993                  ; 567D   0004 0168 0193

        PULR    R5                              ; 5680   02B5
        XOR@    R2,     R4                      ; 5681   03D4
        SDBD                                    ; 5682   0001
        ADDI    #$0800, R4                      ; 5683   02FC 0000 0008
        XORR    R3,     R4                      ; 5686   01DC
        MOVR    R4,     R2                      ; 5687   00A2
        MVO@    R2,     R5                      ; 5688   026A
        SWAP    R2,     1                       ; 5689   0042
        MVO@    R2,     R5                      ; 568A   026A
        ANDI    #$00F8, R3                      ; 568B   03BB 00F8
        ANDI    #$0007, R1                      ; 568D   03B9 0007
        XORR    R3,     R1                      ; 568F   01D9
        MVO@    R1,     R5                      ; 5690   0269

        JSR     R5,     L_687C                  ; 5691   0004 0168 007C

        MOVR    R5,     R0                      ; 5694   00A8

        JSR     R5,     L_69F8                  ; 5695   0004 0168 01F8

        MVI     G_0312, R3                      ; 5698   0283 0312
        INCR    R3                              ; 569A   000B
        MVI@    R3,     R0                      ; 569B   0298
        SLR     R0,     1                       ; 569C   0060
        SETC                                    ; 569D   0007
        RLC     R0,     1                       ; 569E   0050
        MVO@    R0,     R3                      ; 569F   0258
        PULR    R7                              ; 56A0   02B7

L_56A1:
        PSHR    R5                              ; 56A1   0275
        MVI     G_0312, R4                      ; 56A2   0284 0312
        MOVR    R4,     R5                      ; 56A4   00A5
        ADDI    #$0005, R5                      ; 56A5   02FD 0005
        MVI@    R5,     R0                      ; 56A7   02A8
        MVI@    R5,     R2                      ; 56A8   02AA
        ADDI    #$0200, R2                      ; 56A9   02FA 0200
        MVO@    R0,     R4                      ; 56AB   0260
        ADDI    #$0003, R4                      ; 56AC   02FC 0003
        MVO@    R2,     R4                      ; 56AE   0262

        JSR     R5,     L_6949                  ; 56AF   0004 0168 0149

        BLE     L_56CD                          ; 56B2   0206 0019

        INCR    R5                              ; 56B4   000D
        MVI@    R2,     R0                      ; 56B5   0290
        MVI@    R5,     R3                      ; 56B6   02AB
        ADDI    #$0003, R5                      ; 56B7   02FD 0003
        SDBD                                    ; 56B9   0001
        MVI@    R5,     R2                      ; 56BA   02AA
        SARC    R3,     1                       ; 56BB   007B
        BNC     L_56C1                          ; 56BC   0209 0003

        XORR    R0,     R2                      ; 56BE   01C2
        XORR    R2,     R0                      ; 56BF   01D0
        XORR    R0,     R2                      ; 56C0   01C2
L_56C1:
        MVO@    R2,     R4                      ; 56C1   0262
        SWAP    R2,     1                       ; 56C2   0042
        MVO@    R2,     R4                      ; 56C3   0262
        ANDI    #$00F8, R0                      ; 56C4   03B8 00F8
        ADDI    #$0003, R0                      ; 56C6   02F8 0003
        MVO@    R0,     R4                      ; 56C8   0260

        JSR     R5,     L_69A2                  ; 56C9   0004 0168 01A2

        PULR    R7                              ; 56CC   02B7

L_56CD:
        PSHR    R4                              ; 56CD   0274

        JSR     R5,     L_6903                  ; 56CE   0004 0168 0103

        MVI@    R2,     R4                      ; 56D1   0294
        SDBD                                    ; 56D2   0001
        ANDI    #$0FF8, R4                      ; 56D3   03BC 00F8 000F

        JSR     R5,     L_6993                  ; 56D6   0004 0168 0193

        PULR    R5                              ; 56D9   02B5
        XOR@    R2,     R4                      ; 56DA   03D4
        SDBD                                    ; 56DB   0001
        ADDI    #$0800, R4                      ; 56DC   02FC 0000 0008
        XORR    R3,     R4                      ; 56DF   01DC
        MOVR    R4,     R2                      ; 56E0   00A2
        MVO@    R2,     R5                      ; 56E1   026A
        SWAP    R2,     1                       ; 56E2   0042
        MVO@    R2,     R5                      ; 56E3   026A
        ANDI    #$00F8, R3                      ; 56E4   03BB 00F8
        ADDI    #$0003, R3                      ; 56E6   02FB 0003
        MVO@    R3,     R5                      ; 56E8   026B

        JSR     R5,     L_69A2                  ; 56E9   0004 0168 01A2

        MVI     G_0312, R3                      ; 56EC   0283 0312
        INCR    R3                              ; 56EE   000B
        MVI@    R3,     R0                      ; 56EF   0298
        SLR     R0,     1                       ; 56F0   0060
        SETC                                    ; 56F1   0007
        RLC     R0,     1                       ; 56F2   0050
        MVO@    R0,     R3                      ; 56F3   0258
        PULR    R7                              ; 56F4   02B7

        DECLE   $0000,  $0004,  $0008,  $000B   ; 56F5   0000 0004 0008 000B
        DECLE   $000E,  $0011,  $0014,  $0016   ; 56F9   000E 0011 0014 0016
        DECLE   $0018,  $001A,  $001C,  $001D   ; 56FD   0018 001A 001C 001D
        DECLE   $001E,  $001F,  $001F,  $0020   ; 5701   001E 001F 001F 0020
        DECLE   $0020,  $001F,  $001F,  $001E   ; 5705   0020 001F 001F 001E
        DECLE   $001D,  $001C,  $001A,  $0018   ; 5709   001D 001C 001A 0018
        DECLE   $0016,  $0014,  $0011,  $000E   ; 570D   0016 0014 0011 000E
        DECLE   $000B,  $0008,  $0004,  $0000   ; 5711   000B 0008 0004 0000
        DECLE   $0000                           ; 5715   0000
L_5716:
        PSHR    R5                              ; 5716   0275
        MVI     G_0310, R0                      ; 5717   0280 0310
        SLL     R0,     2                       ; 5719   004C
        SLR     R0,     2                       ; 571A   0064
        MVII    #$0180, R4                      ; 571B   02BC 0180
L_571D:
        MVO     R4,     G_0312                  ; 571D   0244 0312
        CLRC                                    ; 571F   0006
        NOP                                     ; 5720   0034
        RRC     R0,     1                       ; 5721   0070
        PSHR    R0                              ; 5722   0270
        BNC     L_5AA1                          ; 5723   0209 037C

        MOVR    R4,     R2                      ; 5725   00A2
        SUBI    #$0180, R2                      ; 5726   033A 0180
        SLR     R2,     2                       ; 5728   0066
        SLR     R2,     1                       ; 5729   0062
        MVI     G_0166, R3                      ; 572A   0283 0166
        MVI@    R4,     R1                      ; 572C   02A1
        SLR     R1,     2                       ; 572D   0065
        SLR     R1,     2                       ; 572E   0065
        INCR    R1                              ; 572F   0009
        ADDR    R7,     R1                      ; 5730   00F9
        ADD@    R1,     R7                      ; 5731   02CF

        CMP@    R5,     R7                      ; 5732   036F
        MVO@    R4,     R5                      ; 5733   026C
        MVO@    R4,     R5                      ; 5734   026C
        DECR    R0                              ; 5735   0010
        COMR    R1                              ; 5736   0019
        CMP@    R5,     R7                      ; 5737   036F
        SUBR    R2,     R1                      ; 5738   0111
        MVO     R0,     .BTAB.74                ; 5739   0240 0274
        PSHR    R4                              ; 573B   0274
        PSHR    R4                              ; 573C   0274
        CMP@    R5,     R7                      ; 573D   036F
        NEGR    R2                              ; 573E   0022
        CMP@    R5,     R7                      ; 573F   036F
        SUBR    R2,     R1                      ; 5740   0111
        MVO     R0,     G_00DA                  ; 5741   0240 00DA
        SARC    R2,     1                       ; 5743   007A
        BNC     L_5AA1                          ; 5744   0209 035B

        JSR     R5,     L_563D                  ; 5746   0004 0154 023D

        B       L_5AA1                          ; 5749   0200 0356

        ADDR    R3,     R2                      ; 574B   00DA
        SARC    R2,     1                       ; 574C   007A
        BNC     L_5AA1                          ; 574D   0209 0352

        JSR     R5,     L_56A1                  ; 574F   0004 0154 02A1

        B       L_5AA1                          ; 5752   0200 034D

        ADDR    R3,     R2                      ; 5754   00DA
        SARC    R2,     1                       ; 5755   007A
        BNC     L_5AA1                          ; 5756   0209 0349

        MVI     G_0312, R4                      ; 5758   0284 0312
        INCR    R4                              ; 575A   000C
        MVI@    R4,     R5                      ; 575B   02A5
        DECR    R4                              ; 575C   0014
        SUBI    #$0002, R5                      ; 575D   033D 0002
        BMI     L_5827                          ; 575F   020B 00C6

        MVO@    R5,     R4                      ; 5761   0265
        MVI@    R4,     R0                      ; 5762   02A0

        JSR     R5,     L_687C                  ; 5763   0004 0168 007C

        MVO     R5,     G_010C                  ; 5766   0245 010C
        MVI@    R4,     R1                      ; 5768   02A1
        DECR    R4                              ; 5769   0014
        ADDI    #$0002, R1                      ; 576A   02F9 0002
        MVO@    R1,     R4                      ; 576C   0261
        CMPI    #$0060, R1                      ; 576D   0379 0060
        BGE     L_57FA                          ; 576F   020D 0089

        SUBI    #$0002, R1                      ; 5771   0339 0002
        MVI@    R4,     R2                      ; 5773   02A2
        ADDI    #$0200, R2                      ; 5774   02FA 0200
        ADDI    #$0002, R4                      ; 5776   02FC 0002
        MVI@    R4,     R0                      ; 5778   02A0
        ANDI    #$00F8, R0                      ; 5779   03B8 00F8
        ANDI    #$0007, R1                      ; 577B   03B9 0007
        XORR    R0,     R1                      ; 577D   01C1
        MVO     R1,     G_010D                  ; 577E   0241 010D
        ANDI    #$0007, R1                      ; 5780   03B9 0007
        BEQ     L_5789                          ; 5782   0204 0005

        JSR     R5,     L_6A0D                  ; 5784   0004 0168 020D

        B       L_5AA1                          ; 5787   0200 0318

L_5789:
        MOVR    R2,     R3                      ; 5789   0093
        ADDI    #$0014, R3                      ; 578A   02FB 0014

        JSR     R5,     L_6949                  ; 578C   0004 0168 0149

        BGT     L_57A5                          ; 578F   020E 0014

        MVI     G_0312, R4                      ; 5791   0284 0312
        ADDI    #$0005, R4                      ; 5793   02FC 0005
        SDBD                                    ; 5795   0001
        MVI@    R4,     R5                      ; 5796   02A5
        MVO@    R5,     R2                      ; 5797   0255
        MVI@    R4,     R0                      ; 5798   02A0
        SLR     R0,     2                       ; 5799   0064
        SLR     R0,     1                       ; 579A   0060
        ANDI    #$000F, R0                      ; 579B   03B8 000F

        JSR     R5,     L_68A6                  ; 579D   0004 0168 00A6

        COMR    R0                              ; 57A0   0018
        AND     G_0311, R0                      ; 57A1   0380 0311
        MVO     R0,     G_0311                  ; 57A3   0240 0311
L_57A5:
        MOVR    R3,     R2                      ; 57A5   009A
        MVI@    R2,     R4                      ; 57A6   0294
        SDBD                                    ; 57A7   0001
        ANDI    #$F007, R4                      ; 57A8   03BC 0007 00F0
        SDBD                                    ; 57AB   0001
        ADDI    #$0800, R4                      ; 57AC   02FC 0000 0008

        JSR     R5,     L_6949                  ; 57AF   0004 0168 0149

        BGE     L_57D7                          ; 57B2   020D 0023

        JSR     R5,     L_6903                  ; 57B4   0004 0168 0103

        MVI     G_0312, R5                      ; 57B7   0285 0312
        INCR    R5                              ; 57B9   000D
        MVI@    R5,     R0                      ; 57BA   02A8
        DECR    R5                              ; 57BB   0015
        SLR     R0,     1                       ; 57BC   0060
        SETC                                    ; 57BD   0007
        RLC     R0,     1                       ; 57BE   0050
        MVO@    R0,     R5                      ; 57BF   0268
        INCR    R5                              ; 57C0   000D
        INCR    R5                              ; 57C1   000D
        MVO@    R2,     R5                      ; 57C2   026A
        MOVR    R4,     R0                      ; 57C3   00A0
        XORR    R3,     R0                      ; 57C4   01D8
        MVO@    R0,     R5                      ; 57C5   0268
        SWAP    R0,     1                       ; 57C6   0040
        NOP                                     ; 57C7   0034
        MVO@    R0,     R5                      ; 57C8   0268
        MVO@    R3,     R5                      ; 57C9   026B
        MVI@    R2,     R4                      ; 57CA   0294
        SDBD                                    ; 57CB   0001
        ANDI    #$0FF8, R4                      ; 57CC   03BC 00F8 000F

        JSR     R5,     L_6993                  ; 57CF   0004 0168 0193
        JSR     R5,     L_6A0D                  ; 57D2   0004 0168 020D

        B       L_5AA1                          ; 57D5   0200 02CA

L_57D7:
        INCR    R5                              ; 57D7   000D
        MVI@    R5,     R1                      ; 57D8   02A9
        ADDI    #$0003, R5                      ; 57D9   02FD 0003
        SDBD                                    ; 57DB   0001
        MVI@    R5,     R0                      ; 57DC   02A8
        MVI@    R5,     R3                      ; 57DD   02AB
        ANDI    #$00F8, R3                      ; 57DE   03BB 00F8
        SARC    R1,     1                       ; 57E0   0079
        BNC     L_57E4                          ; 57E1   0209 0001

        MVI@    R2,     R0                      ; 57E3   0290
L_57E4:
        MVI     G_0312, R5                      ; 57E4   0285 0312
        ADDI    #$0004, R5                      ; 57E6   02FD 0004
        MVO@    R2,     R5                      ; 57E8   026A
        MVO@    R0,     R5                      ; 57E9   0268
        SWAP    R0,     1                       ; 57EA   0040
        NOP                                     ; 57EB   0034
        MVO@    R0,     R5                      ; 57EC   0268
        MVO@    R3,     R5                      ; 57ED   026B
        MVI     G_010D, R0                      ; 57EE   0280 010D
        ANDI    #$0007, R0                      ; 57F0   03B8 0007
        XORR    R3,     R0                      ; 57F2   01D8
        MVO     R0,     G_010D                  ; 57F3   0240 010D

        JSR     R5,     L_6A0D                  ; 57F5   0004 0168 020D

        B       L_5AA1                          ; 57F8   0200 02A7

L_57FA:
        MVI     G_0312, R0                      ; 57FA   0280 0312
        SUBI    #$0180, R0                      ; 57FC   0338 0180
        SLR     R0,     2                       ; 57FE   0064
        SLR     R0,     1                       ; 57FF   0060
        MOVR    R0,     R4                      ; 5800   0084

        JSR     R5,     L_68F3                  ; 5801   0004 0168 00F3
        DECLE   $0310                           ; 5804   0310

        CLRR    R0                              ; 5805   01C0
        MVI     G_0312, R4                      ; 5806   0284 0312
        MVO@    R0,     R4                      ; 5808   0260
        ADDI    #$0006, R4                      ; 5809   02FC 0006
        MVI@    R4,     R0                      ; 580B   02A0
        DECR    R4                              ; 580C   0014

        JSR     R5,     L_691E                  ; 580D   0004 0168 011E

        BC      L_581C                          ; 5810   0201 000A

        SUBI    #$0003, R4                      ; 5812   033C 0003
        MVI@    R4,     R2                      ; 5814   02A2
        ADDI    #$0200, R2                      ; 5815   02FA 0200
        SDBD                                    ; 5817   0001
        MVI@    R4,     R0                      ; 5818   02A0
        MVO@    R0,     R2                      ; 5819   0250
        B       L_5AA1                          ; 581A   0200 0285

L_581C:
        MVI     G_010D, R0                      ; 581C   0280 010D
        SUBI    #$0002, R0                      ; 581E   0338 0002
        MVO     R0,     G_010D                  ; 5820   0240 010D

        JSR     R5,     L_6A0D                  ; 5822   0004 0168 020D

        B       L_5AA1                          ; 5825   0200 027A

L_5827:
        MVI     G_0312, R4                      ; 5827   0284 0312
        MVI@    R4,     R0                      ; 5829   02A0
        DECR    R4                              ; 582A   0014
        ADDI    #$0030, R0                      ; 582B   02F8 0030
        MVO@    R0,     R4                      ; 582D   0260
        MVII    #$000A, R0                      ; 582E   02B8 000A
        MVO@    R0,     R4                      ; 5830   0260
        ADDI    #$0005, R4                      ; 5831   02FC 0005
        MVI@    R4,     R1                      ; 5833   02A1
        ANDI    #$00F8, R1                      ; 5834   03B9 00F8
        ADDI    #$0100, R1                      ; 5836   02F9 0100
        MVII    #$006B, R0                      ; 5838   02B8 006B

        JSR     R5,     L_6976                  ; 583A   0004 0168 0176
        JSR     R5,     L_6DBE                  ; 583D   0004 016C 01BE
        DECLE   $0012                           ; 5840   0012

        B       L_5AA1                          ; 5841   0200 025E

        ADDR    R3,     R2                      ; 5843   00DA
        SARC    R2,     1                       ; 5844   007A
        BNC     L_5AA1                          ; 5845   0209 025A

        MVI     G_0312, R4                      ; 5847   0284 0312
        MVI@    R4,     R0                      ; 5849   02A0

        JSR     R5,     L_687C                  ; 584A   0004 0168 007C

        PSHR    R5                              ; 584D   0275
        ADDR    R5,     R5                      ; 584E   00ED
        ADD@    R6,     R5                      ; 584F   02F5
        MVO     R5,     G_010C                  ; 5850   0245 010C
        ADDI    #$0006, R4                      ; 5852   02FC 0006
        MVI@    R4,     R5                      ; 5854   02A5
        MVO     R5,     G_010D                  ; 5855   0245 010D
        SUBI    #$0007, R4                      ; 5857   033C 0007
        MVI@    R4,     R5                      ; 5859   02A5
        DECR    R4                              ; 585A   0014
        SUBI    #$0002, R5                      ; 585B   033D 0002
        BMI     L_593C                          ; 585D   020B 00DD

        MVO@    R5,     R4                      ; 585F   0265
        MVI     G_0312, R4                      ; 5860   0284 0312
        ADDI    #$0002, R4                      ; 5862   02FC 0002
        MVI@    R4,     R2                      ; 5864   02A2
        ADDI    #$0200, R2                      ; 5865   02FA 0200

        JSR     R5,     L_68C7                  ; 5867   0004 0168 00C7

        PSHR    R0                              ; 586A   0270
        PSHR    R1                              ; 586B   0271
        MVI@    R4,     R2                      ; 586C   02A2
        ADDI    #$0200, R2                      ; 586D   02FA 0200

        JSR     R5,     L_68C7                  ; 586F   0004 0168 00C7

        MVI     G_0312, R3                      ; 5872   0283 0312
        INCR    R3                              ; 5874   000B
        MVI@    R3,     R3                      ; 5875   029B
        SLR     R3,     1                       ; 5876   0063
        PULR    R5                              ; 5877   02B5
        PULR    R4                              ; 5878   02B4
        PSHR    R3                              ; 5879   0273
        SUBR    R0,     R4                      ; 587A   0104
        SLL     R0,     2                       ; 587B   004C
        SLL     R0,     1                       ; 587C   0048
        SUBR    R1,     R5                      ; 587D   010D
        SLL     R1,     2                       ; 587E   004D
        SLL     R1,     1                       ; 587F   0049
        PSHR    R1                              ; 5880   0271
        CLRR    R1                              ; 5881   01C9
        CLRR    R2                              ; 5882   01D2
L_5883:
        SARC    R3,     1                       ; 5883   007B
        BNC     L_5888                          ; 5884   0209 0002

        ADDR    R4,     R1                      ; 5886   00E1
        ADDR    R5,     R2                      ; 5887   00EA
L_5888:
        ADDR    R4,     R4                      ; 5888   00E4
        ADDR    R5,     R5                      ; 5889   00ED
        TSTR    R3                              ; 588A   009B
        BNEQ    L_5883                          ; 588B   022C 0009

        SAR     R1,     2                       ; 588D   006D
        ADDR    R1,     R0                      ; 588E   00C8
        ADDI    #$0003, R0                      ; 588F   02F8 0003
        PULR    R1                              ; 5891   02B1
        SAR     R2,     2                       ; 5892   006E
        ADDR    R2,     R1                      ; 5893   00D1
        ADDI    #$0004, R1                      ; 5894   02F9 0004
        PULR    R5                              ; 5896   02B5
        SDBD                                    ; 5897   0001
        ADDI    #$56F5, R5                      ; 5898   02FD 00F5 0056
        SUB@    R5,     R1                      ; 589B   0329
        BGE     L_589F                          ; 589C   020D 0001

        CLRR    R1                              ; 589E   01C9
L_589F:
        MVI     G_0312, R3                      ; 589F   0283 0312
        MOVR    R0,     R2                      ; 58A1   0082
        ANDI    #$0007, R2                      ; 58A2   03BA 0007
        MVI@    R3,     R5                      ; 58A4   029D
        ANDI    #$00F0, R5                      ; 58A5   03BD 00F0
        ADDR    R5,     R2                      ; 58A7   00EA
        MVO@    R2,     R3                      ; 58A8   025A
        ADDI    #$0007, R3                      ; 58A9   02FB 0007
        MOVR    R1,     R2                      ; 58AB   008A
        ANDI    #$0007, R2                      ; 58AC   03BA 0007
        MVI@    R3,     R5                      ; 58AE   029D
        ANDI    #$00F8, R5                      ; 58AF   03BD 00F8
        ADDR    R5,     R2                      ; 58B1   00EA
        MVO@    R2,     R3                      ; 58B2   025A

        JSR     R5,     L_5AB1                  ; 58B3   0004 0158 02B1

        SUBI    #$0003, R3                      ; 58B6   033B 0003
        MVI@    R3,     R5                      ; 58B8   029D
        ADDI    #$0200, R5                      ; 58B9   02FD 0200
        CMPR    R2,     R5                      ; 58BB   0155
        BNEQ    L_58C6                          ; 58BC   020C 0008

        JSR     R5,     L_69BE                  ; 58BE   0004 0168 01BE
        JSR     R5,     L_69A2                  ; 58C1   0004 0168 01A2

        B       L_5AA1                          ; 58C4   0200 01DB

L_58C6:
        MOVR    R2,     R3                      ; 58C6   0093
        MOVR    R5,     R2                      ; 58C7   00AA

        JSR     R5,     L_6949                  ; 58C8   0004 0168 0149

        BGT     L_58E1                          ; 58CB   020E 0014

        MVI     G_0312, R4                      ; 58CD   0284 0312
        ADDI    #$0005, R4                      ; 58CF   02FC 0005
        SDBD                                    ; 58D1   0001
        MVI@    R4,     R5                      ; 58D2   02A5
        MVO@    R5,     R2                      ; 58D3   0255
        MVI@    R4,     R0                      ; 58D4   02A0
        SLR     R0,     2                       ; 58D5   0064
        SLR     R0,     1                       ; 58D6   0060

        JSR     R5,     L_68A6                  ; 58D7   0004 0168 00A6

        COMR    R0                              ; 58DA   0018
        AND     G_0311, R0                      ; 58DB   0380 0311
        MVO     R0,     G_0311                  ; 58DD   0240 0311
        B       L_58E4                          ; 58DF   0200 0003

L_58E1:
        JSR     R5,     L_69BE                  ; 58E1   0004 0168 01BE

L_58E4:
        MOVR    R3,     R2                      ; 58E4   009A
        MVI     G_0312, R5                      ; 58E5   0285 0312
        ADDI    #$0004, R5                      ; 58E7   02FD 0004
        MVO@    R2,     R5                      ; 58E9   026A

        JSR     R5,     L_6949                  ; 58EA   0004 0168 0149

        BGT     L_591D                          ; 58ED   020E 002E

        JSR     R5,     L_6903                  ; 58EF   0004 0168 0103

        MVI     G_0312, R5                      ; 58F2   0285 0312
        INCR    R5                              ; 58F4   000D
        MVI@    R5,     R0                      ; 58F5   02A8
        DECR    R5                              ; 58F6   0015
        SLR     R0,     1                       ; 58F7   0060
        SETC                                    ; 58F8   0007
        RLC     R0,     1                       ; 58F9   0050
        MVO@    R0,     R5                      ; 58FA   0268
        ADDI    #$0003, R5                      ; 58FB   02FD 0003
        MVI@    R2,     R0                      ; 58FD   0290
        SDBD                                    ; 58FE   0001
        ANDI    #$F007, R0                      ; 58FF   03B8 0007 00F0
        SDBD                                    ; 5902   0001
        ADDI    #$0800, R0                      ; 5903   02F8 0000 0008
        XORR    R3,     R0                      ; 5906   01D8
        MVO@    R0,     R5                      ; 5907   0268
        SWAP    R0,     1                       ; 5908   0040
        MVO@    R0,     R5                      ; 5909   0268
        MVI@    R5,     R0                      ; 590A   02A8
        DECR    R5                              ; 590B   0015
        ANDI    #$0007, R0                      ; 590C   03B8 0007
        XORR    R3,     R0                      ; 590E   01D8
        MVO@    R0,     R5                      ; 590F   0268
        MVI@    R2,     R4                      ; 5910   0294
        SDBD                                    ; 5911   0001
        ANDI    #$0FF8, R4                      ; 5912   03BC 00F8 000F

        JSR     R5,     L_6993                  ; 5915   0004 0168 0193
        JSR     R5,     L_69A2                  ; 5918   0004 0168 01A2

        B       L_5AA1                          ; 591B   0200 0184

L_591D:
        INCR    R5                              ; 591D   000D
        MVI@    R5,     R1                      ; 591E   02A9
        ADDI    #$0003, R5                      ; 591F   02FD 0003
        SDBD                                    ; 5921   0001
        MVI@    R5,     R0                      ; 5922   02A8
        MVI@    R5,     R3                      ; 5923   02AB
        ANDI    #$00F8, R3                      ; 5924   03BB 00F8
        SARC    R1,     1                       ; 5926   0079
        BNC     L_592A                          ; 5927   0209 0001

        MVI@    R2,     R0                      ; 5929   0290
L_592A:
        MVI     G_0312, R5                      ; 592A   0285 0312
        ADDI    #$0005, R5                      ; 592C   02FD 0005
        MVO@    R0,     R5                      ; 592E   0268
        SWAP    R0,     1                       ; 592F   0040
        MVO@    R0,     R5                      ; 5930   0268
        MVI@    R5,     R0                      ; 5931   02A8
        DECR    R5                              ; 5932   0015
        ANDI    #$0007, R0                      ; 5933   03B8 0007
        XORR    R3,     R0                      ; 5935   01D8
        MVO@    R0,     R5                      ; 5936   0268

        JSR     R5,     L_69A2                  ; 5937   0004 0168 01A2

        B       L_5AA1                          ; 593A   0200 0165

L_593C:
        MVI     G_0312, R4                      ; 593C   0284 0312
        MVI@    R4,     R0                      ; 593E   02A0
        DECR    R4                              ; 593F   0014
        ADDI    #$0010, R0                      ; 5940   02F8 0010
        MVO@    R0,     R4                      ; 5942   0260
        ANDI    #$00F0, R0                      ; 5943   03B8 00F0
        CMPI    #$0070, R0                      ; 5945   0378 0070
        BNEQ    L_5950                          ; 5947   020C 0007

        MVII    #$0002, R0                      ; 5949   02B8 0002
        COMR    R0                              ; 594B   0018
        AND     G_0146, R0                      ; 594C   0380 0146
        MVO     R0,     G_0146                  ; 594E   0240 0146
L_5950:
        MVII    #$000A, R0                      ; 5950   02B8 000A
        MVO@    R0,     R4                      ; 5952   0260
        ADDI    #$0002, R4                      ; 5953   02FC 0002
        MVI@    R4,     R2                      ; 5955   02A2
        ADDI    #$0200, R2                      ; 5956   02FA 0200
        MVI@    R2,     R0                      ; 5958   0290
        SDBD                                    ; 5959   0001
        ANDI    #$EFF8, R0                      ; 595A   03B8 00F8 00EF
        ADDI    #$0007, R0                      ; 595D   02F8 0007
        MVO@    R0,     R2                      ; 595F   0250
        ADDI    #$0002, R4                      ; 5960   02FC 0002
        MVI@    R4,     R1                      ; 5962   02A1
        ANDI    #$00F8, R1                      ; 5963   03B9 00F8
        ADDI    #$0100, R1                      ; 5965   02F9 0100
        MVII    #$006B, R0                      ; 5967   02B8 006B

        JSR     R5,     L_6976                  ; 5969   0004 0168 0176
        JSR     R5,     L_6DBE                  ; 596C   0004 016C 01BE
        DECLE   $0012                           ; 596F   0012

        B       L_5AA1                          ; 5970   0200 012F

        MVI     G_0312, R4                      ; 5972   0284 0312
        INCR    R4                              ; 5974   000C
        MVI@    R4,     R5                      ; 5975   02A5
        DECR    R4                              ; 5976   0014
        SUBI    #$0002, R5                      ; 5977   033D 0002
        MVO@    R5,     R4                      ; 5979   0265
        BGE     L_5AA1                          ; 597A   020D 0125

        MVI     G_0312, R0                      ; 597C   0280 0312
        SUBI    #$0180, R0                      ; 597E   0338 0180
        SLR     R0,     2                       ; 5980   0064
        SLR     R0,     1                       ; 5981   0060
        MOVR    R0,     R4                      ; 5982   0084

        JSR     R5,     L_68F3                  ; 5983   0004 0168 00F3
        DECLE   $0310                           ; 5986   0310

        CLRR    R0                              ; 5987   01C0
        MVI     G_0312, R4                      ; 5988   0284 0312
        MVO@    R0,     R4                      ; 598A   0260
        ADDI    #$0006, R4                      ; 598B   02FC 0006
        MVI@    R4,     R0                      ; 598D   02A0
        DECR    R4                              ; 598E   0014

        JSR     R5,     L_691E                  ; 598F   0004 0168 011E

        BC      L_5AA1                          ; 5992   0201 010D

        SUBI    #$0003, R4                      ; 5994   033C 0003
        MVI@    R4,     R2                      ; 5996   02A2
        ADDI    #$0200, R2                      ; 5997   02FA 0200
        SDBD                                    ; 5999   0001
        MVI@    R4,     R0                      ; 599A   02A0
        MVO@    R0,     R2                      ; 599B   0250
        B       L_5AA1                          ; 599C   0200 0103

        ADDR    R3,     R2                      ; 599E   00DA
        SARC    R2,     1                       ; 599F   007A
        BNC     L_5AA1                          ; 59A0   0209 00FF

        MVII    #$0003, R3                      ; 59A2   02BB 0003
        B       L_59B3                          ; 59A4   0200 000D

        ADDR    R3,     R2                      ; 59A6   00DA
        SARC    R2,     1                       ; 59A7   007A
        BNC     L_5AA1                          ; 59A8   0209 00F7

        SARC    R3,     2                       ; 59AA   007F
        MVII    #$0002, R3                      ; 59AB   02BB 0002
        BOV     L_59B3                          ; 59AD   0202 0004

        MVII    #$0001, R3                      ; 59AF   02BB 0001
        B       L_59B3                          ; 59B1   0200 0000

L_59B3:
        MVI     G_0312, R4                      ; 59B3   0284 0312
        MVI@    R4,     R2                      ; 59B5   02A2
        ANDI    #$000F, R2                      ; 59B6   03BA 000F
        MVI@    R4,     R5                      ; 59B8   02A5
        DECR    R4                              ; 59B9   0014
        SUBI    #$0002, R5                      ; 59BA   033D 0002
        BMI     L_5A7A                          ; 59BC   020B 00BC

        MVO@    R5,     R4                      ; 59BE   0265
        MVI@    R4,     R0                      ; 59BF   02A0

        JSR     R5,     L_687C                  ; 59C0   0004 0168 007C

        MVO     R5,     G_010C                  ; 59C3   0245 010C
        MVI@    R4,     R1                      ; 59C5   02A1

        JSR     R5,     L_6121                  ; 59C6   0004 0160 0121
        JSR     R5,     L_5AB1                  ; 59C9   0004 0158 02B1

        BC      L_5A7A                          ; 59CC   0201 00AC

        SUBI    #$0002, R4                      ; 59CE   033C 0002
        MVO@    R0,     R4                      ; 59D0   0260
        MVO@    R1,     R4                      ; 59D1   0261
        MVI@    R4,     R5                      ; 59D2   02A5
        ADDI    #$0200, R5                      ; 59D3   02FD 0200
        ADDI    #$0002, R4                      ; 59D5   02FC 0002
        MVI@    R4,     R0                      ; 59D7   02A0
        DECR    R4                              ; 59D8   0014
        MVO     R0,     G_010D                  ; 59D9   0240 010D
        ANDI    #$00F8, R0                      ; 59DB   03B8 00F8
        ANDI    #$0007, R1                      ; 59DD   03B9 0007
        XORR    R0,     R1                      ; 59DF   01C1
        MVO@    R1,     R4                      ; 59E0   0261
        CMPR    R2,     R5                      ; 59E1   0155
        BNEQ    L_59EC                          ; 59E2   020C 0008

        JSR     R5,     L_69F4                  ; 59E4   0004 0168 01F4
        JSR     R5,     L_69E3                  ; 59E7   0004 0168 01E3

        B       L_5AA1                          ; 59EA   0200 00B5

L_59EC:
        MOVR    R2,     R3                      ; 59EC   0093
        MOVR    R5,     R2                      ; 59ED   00AA

        JSR     R5,     L_6949                  ; 59EE   0004 0168 0149

        BGT     L_5A09                          ; 59F1   020E 0016

        MVI     G_0312, R4                      ; 59F3   0284 0312
        ADDI    #$0005, R4                      ; 59F5   02FC 0005
        SDBD                                    ; 59F7   0001
        MVI@    R4,     R5                      ; 59F8   02A5
        MVO@    R5,     R2                      ; 59F9   0255
        MVI@    R4,     R0                      ; 59FA   02A0
        SLR     R0,     2                       ; 59FB   0064
        SLR     R0,     1                       ; 59FC   0060
        ANDI    #$000F, R0                      ; 59FD   03B8 000F

        JSR     R5,     L_68A6                  ; 59FF   0004 0168 00A6

        COMR    R0                              ; 5A02   0018
        AND     G_0311, R0                      ; 5A03   0380 0311
        MVO     R0,     G_0311                  ; 5A05   0240 0311
        B       L_5A0C                          ; 5A07   0200 0003

L_5A09:
        JSR     R5,     L_69F4                  ; 5A09   0004 0168 01F4

L_5A0C:
        MOVR    R3,     R2                      ; 5A0C   009A
        MVI     G_0312, R4                      ; 5A0D   0284 0312
        MVI@    R4,     R4                      ; 5A0F   02A4
        ANDI    #$00F0, R4                      ; 5A10   03BC 00F0
        CMPI    #$00A0, R4                      ; 5A12   037C 00A0
        BEQ     L_5A27                          ; 5A14   0204 0011

        MVI@    R2,     R4                      ; 5A16   0294
        SDBD                                    ; 5A17   0001
        ANDI    #$4000, R4                      ; 5A18   03BC 0000 0040
        BEQ     L_5A27                          ; 5A1B   0204 000A

        MVI     G_0312, R5                      ; 5A1D   0285 0312
        INCR    R5                              ; 5A1F   000D
        MVI@    R5,     R4                      ; 5A20   02AC
        DECR    R5                              ; 5A21   0015
        ANDI    #$0001, R4                      ; 5A22   03BC 0001
        ADDI    #$0002, R4                      ; 5A24   02FC 0002
        MVO@    R4,     R5                      ; 5A26   026C
L_5A27:
        MVI@    R2,     R4                      ; 5A27   0294
        SDBD                                    ; 5A28   0001
        ANDI    #$F007, R4                      ; 5A29   03BC 0007 00F0
        SDBD                                    ; 5A2C   0001
        ADDI    #$0800, R4                      ; 5A2D   02FC 0000 0008

        JSR     R5,     L_6949                  ; 5A30   0004 0168 0149

        BGE     L_5A5A                          ; 5A33   020D 0025

        JSR     R5,     L_6903                  ; 5A35   0004 0168 0103

        MVI     G_0312, R5                      ; 5A38   0285 0312
        INCR    R5                              ; 5A3A   000D
        MVI@    R5,     R0                      ; 5A3B   02A8
        DECR    R5                              ; 5A3C   0015
        SLR     R0,     1                       ; 5A3D   0060
        SETC                                    ; 5A3E   0007
        RLC     R0,     1                       ; 5A3F   0050
        MVO@    R0,     R5                      ; 5A40   0268
        INCR    R5                              ; 5A41   000D
        MVI@    R5,     R1                      ; 5A42   02A9
        MVO@    R2,     R5                      ; 5A43   026A
        MOVR    R4,     R0                      ; 5A44   00A0
        XORR    R3,     R0                      ; 5A45   01D8
        MVO@    R0,     R5                      ; 5A46   0268
        SWAP    R0,     1                       ; 5A47   0040
        MVO@    R0,     R5                      ; 5A48   0268
        ANDI    #$0007, R1                      ; 5A49   03B9 0007
        XORR    R3,     R1                      ; 5A4B   01D9
        MVO@    R1,     R5                      ; 5A4C   0269
        MVI@    R2,     R4                      ; 5A4D   0294
        SDBD                                    ; 5A4E   0001
        ANDI    #$0FF8, R4                      ; 5A4F   03BC 00F8 000F

        JSR     R5,     L_6993                  ; 5A52   0004 0168 0193
        JSR     R5,     L_69E3                  ; 5A55   0004 0168 01E3

        B       L_5AA1                          ; 5A58   0200 0047

L_5A5A:
        INCR    R5                              ; 5A5A   000D
        MVI@    R5,     R1                      ; 5A5B   02A9
        ADDI    #$0003, R5                      ; 5A5C   02FD 0003
        SDBD                                    ; 5A5E   0001
        MVI@    R5,     R0                      ; 5A5F   02A8
        MVI@    R5,     R3                      ; 5A60   02AB
        ANDI    #$00F8, R3                      ; 5A61   03BB 00F8
        SARC    R1,     1                       ; 5A63   0079
        BNC     L_5A67                          ; 5A64   0209 0001

        MVI@    R2,     R0                      ; 5A66   0290
L_5A67:
        MVI     G_0312, R5                      ; 5A67   0285 0312
        ADDI    #$0003, R5                      ; 5A69   02FD 0003
        MVI@    R5,     R1                      ; 5A6B   02A9
        ANDI    #$0007, R1                      ; 5A6C   03B9 0007
        XORR    R1,     R3                      ; 5A6E   01CB
        MVO@    R2,     R5                      ; 5A6F   026A
        MVO@    R0,     R5                      ; 5A70   0268
        SWAP    R0,     1                       ; 5A71   0040
        NOP                                     ; 5A72   0034
        MVO@    R0,     R5                      ; 5A73   0268
        MVO@    R3,     R5                      ; 5A74   026B

        JSR     R5,     L_69E3                  ; 5A75   0004 0168 01E3

        B       L_5AA1                          ; 5A78   0200 0027

L_5A7A:
        MVI     G_0312, R0                      ; 5A7A   0280 0312
        SUBI    #$0180, R0                      ; 5A7C   0338 0180
        SLR     R0,     2                       ; 5A7E   0064
        SLR     R0,     1                       ; 5A7F   0060
        MOVR    R0,     R4                      ; 5A80   0084

        JSR     R5,     L_68F3                  ; 5A81   0004 0168 00F3
        DECLE   $0310                           ; 5A84   0310

        CLRR    R0                              ; 5A85   01C0
        MVI     G_0312, R4                      ; 5A86   0284 0312
        MVO@    R0,     R4                      ; 5A88   0260
        ADDI    #$0006, R4                      ; 5A89   02FC 0006
        MVI@    R4,     R0                      ; 5A8B   02A0
        DECR    R4                              ; 5A8C   0014

        JSR     R5,     L_691E                  ; 5A8D   0004 0168 011E

        BC      L_5A9C                          ; 5A90   0201 000A

        SUBI    #$0003, R4                      ; 5A92   033C 0003
        MVI@    R4,     R2                      ; 5A94   02A2
        ADDI    #$0200, R2                      ; 5A95   02FA 0200
        SDBD                                    ; 5A97   0001
        MVI@    R4,     R0                      ; 5A98   02A0
        MVO@    R0,     R2                      ; 5A99   0250
        B       L_5AA1                          ; 5A9A   0200 0005

L_5A9C:
        JSR     R5,     L_69E3                  ; 5A9C   0004 0168 01E3

        B       L_5AA1                          ; 5A9F   0200 0000

L_5AA1:
        MVI     G_0312, R4                      ; 5AA1   0284 0312
        ADDI    #$0008, R4                      ; 5AA3   02FC 0008
        PULR    R0                              ; 5AA5   02B0
        TSTR    R0                              ; 5AA6   0080
        BNEQ    L_571D                          ; 5AA7   022C 038B

        MVI     G_0166, R0                      ; 5AA9   0280 0166
        INCR    R0                              ; 5AAB   0008
        ANDI    #$0003, R0                      ; 5AAC   03B8 0003
        MVO     R0,     G_0166                  ; 5AAE   0240 0166
        PULR    R7                              ; 5AB0   02B7

L_5AB1:
        PSHR    R5                              ; 5AB1   0275
        MOVR    R0,     R2                      ; 5AB2   0082
        SLR     R2,     2                       ; 5AB3   0066
        SLR     R2,     1                       ; 5AB4   0062
        CMPI    #$0013, R2                      ; 5AB5   037A 0013
        BGT     L_5ACA                          ; 5AB7   020E 0011

        MOVR    R2,     R5                      ; 5AB9   0095
        MOVR    R1,     R2                      ; 5ABA   008A
        SLR     R2,     2                       ; 5ABB   0066
        SLR     R2,     1                       ; 5ABC   0062
        CMPI    #$000B, R2                      ; 5ABD   037A 000B
        BGT     L_5ACA                          ; 5ABF   020E 0009

        SLL     R2,     2                       ; 5AC1   004E
        PSHR    R2                              ; 5AC2   0272
        SLL     R2,     2                       ; 5AC3   004E
        ADD@    R6,     R2                      ; 5AC4   02F2
        ADDR    R5,     R2                      ; 5AC5   00EA
        ADDI    #$0200, R2                      ; 5AC6   02FA 0200
        CLRC                                    ; 5AC8   0006
        PULR    R7                              ; 5AC9   02B7

L_5ACA:
        SETC                                    ; 5ACA   0007
        PULR    R7                              ; 5ACB   02B7

        MVI     G_0312, R2                      ; 5ACC   0282 0312
        ADDI    #$0004, R2                      ; 5ACE   02FA 0004
        MVI@    R2,     R2                      ; 5AD0   0292
        ADDI    #$0200, R2                      ; 5AD1   02FA 0200
        MOVR    R5,     R7                      ; 5AD3   00AF

        PSHR    R5                              ; 5AD4   0275
        MVI     G_0312, R5                      ; 5AD5   0285 0312
        ADDI    #$0002, R5                      ; 5AD7   02FD 0002
        MVI@    R5,     R0                      ; 5AD9   02A8
        MVI@    R5,     R1                      ; 5ADA   02A9
        PULR    R7                              ; 5ADB   02B7

        DECLE   $0000,  $0000,  $0080,  $0009   ; 5ADC   0000 0000 0080 0009
        DECLE   $0081,  $0019,  $0084,  $0009   ; 5AE0   0081 0019 0084 0009
        DECLE   $0080,  $0019,  $0083,  $0019   ; 5AE4   0080 0019 0083 0019
        DECLE   $0083,  $0009,  $0086,  $0009   ; 5AE8   0083 0009 0086 0009
        DECLE   $0080,  $0009,  $0080,  $0019   ; 5AEC   0080 0009 0080 0019
        DECLE   $0080,  $0009,  $0080,  $0009   ; 5AF0   0080 0009 0080 0009
        DECLE   $0080,  $0009,  $0000,  $0000   ; 5AF4   0080 0009 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0009   ; 5AFC   0000 0000 0081 0009
        DECLE   $0081,  $0009,  $0000,  $0000   ; 5B00   0081 0009 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B18   0000 0000 0000 0000
L_5B1C:
        PSHR    R5                              ; 5B1C   0275
        PSHR    R4                              ; 5B1D   0274
        MVII    #$02F0, R4                      ; 5B1E   02BC 02F0
        ADDR    R2,     R4                      ; 5B20   00D4
        PSHR    R0                              ; 5B21   0270
        XORI    #$0300, R0                      ; 5B22   03F8 0300
        PSHR    R1                              ; 5B24   0271
        XORI    #$0080, R1                      ; 5B25   03F9 0080
        MVO@    R0,     R4                      ; 5B27   0260
        ADDI    #$0007, R4                      ; 5B28   02FC 0007
        MVO@    R1,     R4                      ; 5B2A   0261
        PULR    R1                              ; 5B2B   02B1
        PULR    R0                              ; 5B2C   02B0
        CMPI    #$0001, R2                      ; 5B2D   037A 0001
        BGT     L_5B3D                          ; 5B2F   020E 000C
        BMI     L_5B37                          ; 5B31   020B 0004

        ADDI    #$0100, R3                      ; 5B33   02FB 0100
        B       L_5B3D                          ; 5B35   0200 0006

L_5B37:
        MVO     R0,     G_0161                  ; 5B37   0240 0161
        MVO     R1,     G_0162                  ; 5B39   0241 0162
        ADDI    #$0100, R3                      ; 5B3B   02FB 0100
L_5B3D:
        PSHR    R2                              ; 5B3D   0272
        MVII    #$010E, R4                      ; 5B3E   02BC 010E
        ADDR    R2,     R4                      ; 5B40   00D4
        ADDR    R2,     R4                      ; 5B41   00D4
        MVO@    R3,     R4                      ; 5B42   0263
        SLR     R3,     2                       ; 5B43   0067

        JSR     R5,     L_619E                  ; 5B44   0004 0160 019E

        SLR     R3,     2                       ; 5B47   0067
        MVO@    R2,     R4                      ; 5B48   0262
        PULR    R2                              ; 5B49   02B2
        MVII    #$0300, R4                      ; 5B4A   02BC 0300
        ADDR    R2,     R4                      ; 5B4C   00D4
        SDBD                                    ; 5B4D   0001
        MVII    #$5ADC, R5                      ; 5B4E   02BD 00DC 005A
        ADDR    R3,     R5                      ; 5B51   00DD
        ADDR    R3,     R5                      ; 5B52   00DD
        SDBD                                    ; 5B53   0001
        MVI@    R5,     R3                      ; 5B54   02AB
        SLL     R2,     2                       ; 5B55   004E
        SLL     R2,     2                       ; 5B56   004E
        ADDR    R2,     R3                      ; 5B57   00D3
        SLR     R2,     2                       ; 5B58   0066
        SLR     R2,     2                       ; 5B59   0066
        MVO@    R3,     R4                      ; 5B5A   0263
        PULR    R4                              ; 5B5B   02B4
        PULR    R7                              ; 5B5C   02B7

L_5B5D:
        PSHR    R5                              ; 5B5D   0275
        MVI     G_0164, R0                      ; 5B5E   0280 0164
        DECR    R0                              ; 5B60   0010
        MVO     R0,     G_0164                  ; 5B61   0240 0164
        BGT     L_5E79                          ; 5B63   020E 0314

        MVI     G_0163, R2                      ; 5B65   0282 0163
        MOVR    R2,     R1                      ; 5B67   0091
        SUBI    #$0020, R1                      ; 5B68   0339 0020
        BMI     L_5B70                          ; 5B6A   020B 0004

        MVO     R2,     G_0164                  ; 5B6C   0242 0164
        B       L_5E79                          ; 5B6E   0200 0309

L_5B70:
        DECR    R2                              ; 5B70   0012
        BMI     L_5E79                          ; 5B71   020B 0306

        MVI     G_0146, R0                      ; 5B73   0280 0146
        ANDI    #$0040, R0                      ; 5B75   03B8 0040
        BNEQ    L_5E79                          ; 5B77   020C 0300

        MVII    #$0004, R0                      ; 5B79   02B8 0004

        JSR     R5,     X_RAND1                 ; 5B7B   0004 0114 027D

        MVI     G_0165, R1                      ; 5B7E   0281 0165
        SLR     R1,     2                       ; 5B80   0065
        ADDR    R1,     R0                      ; 5B81   00C8
        ADDI    #$0005, R0                      ; 5B82   02F8 0005
        MVO     R0,     G_0164                  ; 5B84   0240 0164

        JSR     R5,     L_68DA                  ; 5B86   0004 0168 00DA
        DECLE   $0165                           ; 5B89   0165

        BC      L_5E79                          ; 5B8A   0201 02ED

        MVO     R2,     G_0163                  ; 5B8C   0242 0163
        MOVR    R4,     R2                      ; 5B8E   00A2
        MVII    #$0018, R0                      ; 5B8F   02B8 0018

        JSR     R5,     X_RAND2                 ; 5B91   0004 0114 029E

        ADDI    #$0048, R0                      ; 5B94   02F8 0048
        MVII    #$0009, R1                      ; 5B96   02B9 0009
        MVII    #$001C, R3                      ; 5B98   02BB 001C

        JSR     R5,     L_5B1C                  ; 5B9A   0004 0158 031C

        ADDI    #$0308, R2                      ; 5B9D   02FA 0308
        MVII    #$0018, R0                      ; 5B9F   02B8 0018
        MVO@    R0,     R2                      ; 5BA1   0250
        PULR    R7                              ; 5BA2   02B7

L_5BA3:
        PSHR    R5                              ; 5BA3   0275

        JSR     R5,     L_68DA                  ; 5BA4   0004 0168 00DA
        DECLE   $0165                           ; 5BA7   0165

        MOVR    R4,     R2                      ; 5BA8   00A2
        MVII    #$0040, R0                      ; 5BA9   02B8 0040
        SDBD                                    ; 5BAB   0001
        MVII    #$8008, R1                      ; 5BAC   02B9 0008 0080
        MVII    #$0027, R3                      ; 5BAF   02BB 0027

        JSR     R5,     L_5B1C                  ; 5BB1   0004 0158 031C

        ADDI    #$0308, R2                      ; 5BB4   02FA 0308
        MVII    #$0007, R0                      ; 5BB6   02B8 0007
        MVO@    R0,     R2                      ; 5BB8   0250
        MVII    #$0048, R0                      ; 5BB9   02B8 0048
        SDBD                                    ; 5BBB   0001
        MVII    #$8008, R1                      ; 5BBC   02B9 0008 0080
        MVII    #$0001, R2                      ; 5BBF   02BA 0001
        MVII    #$0027, R3                      ; 5BC1   02BB 0027

        JSR     R5,     L_5B1C                  ; 5BC3   0004 0158 031C

        MVII    #$0007, R0                      ; 5BC6   02B8 0007
        MVO     R0,     G_0309                  ; 5BC8   0240 0309

        JSR     R5,     L_68DA                  ; 5BCA   0004 0168 00DA
        DECLE   $0165                           ; 5BCD   0165

        MOVR    R4,     R2                      ; 5BCE   00A2
        MVII    #$0050, R0                      ; 5BCF   02B8 0050
        SDBD                                    ; 5BD1   0001
        MVII    #$8008, R1                      ; 5BD2   02B9 0008 0080
        MVII    #$0027, R3                      ; 5BD5   02BB 0027

        JSR     R5,     L_5B1C                  ; 5BD7   0004 0158 031C

        ADDI    #$0308, R2                      ; 5BDA   02FA 0308
        MVII    #$0007, R0                      ; 5BDC   02B8 0007
        MVO@    R0,     R2                      ; 5BDE   0250
        PULR    R7                              ; 5BDF   02B7

L_5BE0:
        PSHR    R5                              ; 5BE0   0275
        MVI     G_0165, R0                      ; 5BE1   0280 0165
        ANDI    #$003F, R0                      ; 5BE3   03B8 003F
        XORI    #$00C0, R0                      ; 5BE5   03F8 00C0
        MVO     R0,     G_0165                  ; 5BE7   0240 0165

        JSR     R5,     L_6854                  ; 5BE9   0004 0168 0054
        DECLE   $02F6                           ; 5BEC   02F6

        NEGR    R0                              ; 5BED   0020
        SETC                                    ; 5BEE   0007
        ADD@    R6,     R7                      ; 5BEF   02F7

        DECLE   $0021,  $0027                   ; 5BF0   0021 0027

        SUB     .UART.0,R6                      ; 5BF2   0306 00E0
        INCR    R1                              ; 5BF4   0009
        SUB     .PSG1.chn_a_lo,R7               ; 5BF5   0307 00F0

        DECLE   $0019,  $0000,  $0004,  $0168   ; 5BF7   0019 0000 0004 0168
        DECLE   $004C,  $02FE,  $01E2,  $02FF   ; 5BFB   004C 02FE 01E2 02FF
        DECLE   $01E0                           ; 5BFF   01E0

        SUB@    R1,     R6                      ; 5C00   030E
        DIS                                     ; 5C01   0003
        SUB@    R1,     R7                      ; 5C02   030F

        DECLE   $0003,  $011A,  $0080,  $011B   ; 5C03   0003 011A 0080 011B
        DECLE   $00FF,  $011C,  $0090,  $011D   ; 5C07   00FF 011C 0090 011D
        DECLE   $00FF,  $0000                   ; 5C0B   00FF 0000

        PULR    R7                              ; 5C0D   02B7

L_5C0E:
        PSHR    R5                              ; 5C0E   0275
        PSHR    R0                              ; 5C0F   0270
        NOP                                     ; 5C10   0034
        PSHR    R1                              ; 5C11   0271

        JSR     R5,     L_68DA                  ; 5C12   0004 0168 00DA
        DECLE   $0165                           ; 5C15   0165

        PULR    R1                              ; 5C16   02B1
        PULR    R0                              ; 5C17   02B0
        BC      L_5E79                          ; 5C18   0201 025F

        PSHR    R2                              ; 5C1A   0272
        MOVR    R4,     R2                      ; 5C1B   00A2

        JSR     R5,     L_5B1C                  ; 5C1C   0004 0158 031C

        PULR    R3                              ; 5C1F   02B3
        ADDI    #$0308, R2                      ; 5C20   02FA 0308
        MVO@    R3,     R2                      ; 5C22   0253
        PULR    R7                              ; 5C23   02B7

L_5C24:
        PSHR    R5                              ; 5C24   0275
        CMPI    #$0001, R4                      ; 5C25   037C 0001
        BMI     L_5CE8                          ; 5C27   020B 00BF
        BEQ     L_5D1B                          ; 5C29   0204 00F0

        MVII    #$010E, R1                      ; 5C2B   02B9 010E
        ADDR    R4,     R1                      ; 5C2D   00E1
        ADDR    R4,     R1                      ; 5C2E   00E1
        MVI@    R1,     R0                      ; 5C2F   0288
        SLR     R0,     2                       ; 5C30   0064
        SLR     R0,     2                       ; 5C31   0064
        PSHR    R0                              ; 5C32   0270

        JSR     R5,     L_6C1B                  ; 5C33   0004 016C 001B

        PULR    R5                              ; 5C36   02B5
        INCR    R5                              ; 5C37   000D
        ADDR    R7,     R5                      ; 5C38   00FD
        ADD@    R5,     R7                      ; 5C39   02EF

        DECLE   $023F,  $0096,  $0010,  $006A   ; 5C3A   023F 0096 0010 006A
        DECLE   $0096,  $0096,  $023F,  $0096   ; 5C3E   0096 0096 023F 0096
        DECLE   $023F,  $023F,  $023F,  $0096   ; 5C42   023F 023F 023F 0096
        DECLE   $0096,  $0096,  $0096,  $0096   ; 5C46   0096 0096 0096 0096
        DECLE   $0288,  $03B8,  $000F,  $0248   ; 5C4A   0288 03B8 000F 0248
        DECLE   $02B9,  $02F0,  $00E1,  $0288   ; 5C4E   02B9 02F0 00E1 0288
        DECLE   $0001,  $03B8,  $00FF,  $000F   ; 5C52   0001 03B8 00FF 000F
        DECLE   $0001                           ; 5C56   0001

        ADDI    #$0000, R0                      ; 5C57   02F8 0000
        TSTR    R0                              ; 5C59   0080
        MVO@    R0,     R1                      ; 5C5A   0248
        MVII    #$02F8, R1                      ; 5C5B   02B9 02F8
        ADDR    R4,     R1                      ; 5C5D   00E1
        MVI@    R1,     R0                      ; 5C5E   0288
        SLL     R0,     1                       ; 5C5F   0048
        SETC                                    ; 5C60   0007
        RRC     R0,     1                       ; 5C61   0070
        MVO@    R0,     R1                      ; 5C62   0248
        ADDI    #$0008, R1                      ; 5C63   02F9 0008
        MVI@    R1,     R0                      ; 5C65   0288
        SDBD                                    ; 5C66   0001
        XORI    #$1006, R0                      ; 5C67   03F8 0006 0010
        MVO@    R0,     R1                      ; 5C6A   0248
        SDBD                                    ; 5C6B   0001
        MVII    #$1000, R0                      ; 5C6C   02B8 0000 0010
        MVII    #$0308, R1                      ; 5C6F   02B9 0308
        ADDR    R4,     R1                      ; 5C71   00E1
        MVO@    R0,     R1                      ; 5C72   0248

        JSR     R5,     L_6DBE                  ; 5C73   0004 016C 01BE
        DECLE   $0006                           ; 5C76   0006

        MVII    #$0080, R0                      ; 5C77   02B8 0080
        AND     G_015E, R0                      ; 5C79   0380 015E
        BNEQ    L_5C84                          ; 5C7B   020C 0007

        MVII    #$0080, R0                      ; 5C7D   02B8 0080
        XOR     G_015E, R0                      ; 5C7F   03C0 015E
        MVO     R0,     G_015E                  ; 5C81   0240 015E
        PULR    R7                              ; 5C83   02B7

L_5C84:
        MVI     G_0110, R0                      ; 5C84   0280 0110
        DECLE   $03B8,  $000F,  $0240,  $0110   ; 5C86   03B8 000F 0240 0110
        DECLE   $02B9,  $02F1,  $0288,  $0001   ; 5C8A   02B9 02F1 0288 0001
        DECLE   $03B8,  $00FF,  $000F,  $0001   ; 5C8E   03B8 00FF 000F 0001

        ADDI    #$0000, R0                      ; 5C92   02F8 0000
        SWAP    R0,     1                       ; 5C94   0040
        MVO@    R0,     R1                      ; 5C95   0248
        MVI     G_02F9, R0                      ; 5C96   0280 02F9
        SLL     R0,     1                       ; 5C98   0048
        SETC                                    ; 5C99   0007
        RRC     R0,     1                       ; 5C9A   0070
        MVO     R0,     G_02F9                  ; 5C9B   0240 02F9
        SDBD                                    ; 5C9D   0001
        MVII    #$3000, R0                      ; 5C9E   02B8 0000 0030
        MVO     R0,     G_0309                  ; 5CA1   0240 0309
        PULR    R7                              ; 5CA3   02B7

        DECLE   $0288,  $03B8,  $000F,  $0248   ; 5CA4   0288 03B8 000F 0248
        DECLE   $02B9,  $02F0,  $00E1,  $0288   ; 5CA8   02B9 02F0 00E1 0288
        DECLE   $0001,  $03B8,  $00FF,  $000F   ; 5CAC   0001 03B8 00FF 000F
        DECLE   $0001                           ; 5CB0   0001

        ADDI    #$0000, R0                      ; 5CB1   02F8 0000
        MOVR    R2,     R0                      ; 5CB3   0090
        MVO@    R0,     R1                      ; 5CB4   0248
        MVII    #$02F8, R1                      ; 5CB5   02B9 02F8
        ADDR    R4,     R1                      ; 5CB7   00E1
        MVI@    R1,     R0                      ; 5CB8   0288
        SLL     R0,     1                       ; 5CB9   0048
        SETC                                    ; 5CBA   0007
        RRC     R0,     1                       ; 5CBB   0070
        MVO@    R0,     R1                      ; 5CBC   0248
        ADDI    #$0008, R1                      ; 5CBD   02F9 0008
        MVI@    R1,     R0                      ; 5CBF   0288
        XORI    #$0003, R0                      ; 5CC0   03F8 0003
        MVO@    R0,     R1                      ; 5CC2   0248
        SDBD                                    ; 5CC3   0001
        MVII    #$2000, R0                      ; 5CC4   02B8 0000 0020
        MVII    #$0308, R1                      ; 5CC7   02B9 0308
        ADDR    R4,     R1                      ; 5CC9   00E1
        MVO@    R0,     R1                      ; 5CCA   0248

        JSR     R5,     L_6DBE                  ; 5CCB   0004 016C 01BE
        DECLE   $0006                           ; 5CCE   0006

        PULR    R7                              ; 5CCF   02B7

        MVI@    R1,     R0                      ; 5CD0   0288
        ANDI    #$000F, R0                      ; 5CD1   03B8 000F
        MVO@    R0,     R1                      ; 5CD3   0248
        MVII    #$02F0, R1                      ; 5CD4   02B9 02F0
        ADDR    R4,     R1                      ; 5CD6   00E1
        MVI@    R1,     R0                      ; 5CD7   0288
        SDBD                                    ; 5CD8   0001
        ANDI    #$0FFF, R0                      ; 5CD9   03B8 00FF 000F
        MVO@    R0,     R1                      ; 5CDC   0248
        MVII    #$0001, R0                      ; 5CDD   02B8 0001
        MVII    #$0308, R1                      ; 5CDF   02B9 0308
        ADDR    R4,     R1                      ; 5CE1   00E1
        MVO@    R0,     R1                      ; 5CE2   0248

        JSR     R5,     L_6DBE                  ; 5CE3   0004 016C 01BE
        DECLE   $0006                           ; 5CE6   0006

        PULR    R7                              ; 5CE7   02B7

L_5CE8:
        MVI     G_010E, R0                      ; 5CE8   0280 010E
        DECLE   $03B8,  $00F0,  $0204,  $018B   ; 5CEA   03B8 00F0 0204 018B
        DECLE   $01C0,  $0240,  $010E,  $0280   ; 5CEE   01C0 0240 010E 0280
        DECLE   $015E,  $03B8,  $0040,  $020C   ; 5CF2   015E 03B8 0040 020C
        DECLE   $0182,  $0280,  $015E,  $03F8   ; 5CF6   0182 0280 015E 03F8
        DECLE   $0040,  $0240,  $015E,  $0280   ; 5CFA   0040 0240 015E 0280
        DECLE   $02F0,  $0001,  $03B8,  $00FF   ; 5CFE   02F0 0001 03B8 00FF
        DECLE   $000F,  $0001                   ; 5D02   000F 0001

        ADDI    #$0000, R0                      ; 5D04   02F8 0000
        SWAP    R0,     1                       ; 5D06   0040
        MVO     R0,     G_02F0                  ; 5D07   0240 02F0
        MVI     G_02F8, R0                      ; 5D09   0280 02F8
        SLL     R0,     1                       ; 5D0B   0048
        SETC                                    ; 5D0C   0007
        RRC     R0,     1                       ; 5D0D   0070
        MVO     R0,     G_02F8                  ; 5D0E   0240 02F8
        SDBD                                    ; 5D10   0001
        MVII    #$4000, R0                      ; 5D11   02B8 0000 0040
        MVO     R0,     G_0308                  ; 5D14   0240 0308

        JSR     R5,     L_6DBE                  ; 5D16   0004 016C 01BE
        DECLE   $001E                           ; 5D19   001E

        PULR    R7                              ; 5D1A   02B7
L_5D1B:
        PULR    R7                              ; 5D1B   02B7

L_5D1C:
        PSHR    R5                              ; 5D1C   0275
        CLRR    R0                              ; 5D1D   01C0
        MOVR    R4,     R3                      ; 5D1E   00A3
        ADDI    #$02F0, R3                      ; 5D1F   02FB 02F0
        MVO@    R0,     R3                      ; 5D21   0258
        ADDI    #$0008, R3                      ; 5D22   02FB 0008
        MVO@    R0,     R3                      ; 5D24   0258
        ADDI    #$0008, R3                      ; 5D25   02FB 0008
        MVO@    R0,     R3                      ; 5D27   0258
        MOVR    R4,     R5                      ; 5D28   00A5
        ADDR    R5,     R5                      ; 5D29   00ED
        ADDI    #$010E, R5                      ; 5D2A   02FD 010E
        MVO@    R0,     R5                      ; 5D2C   0268
        MVO@    R0,     R5                      ; 5D2D   0268
        CMPI    #$0001, R4                      ; 5D2E   037C 0001
        BMI     L_5D3B                          ; 5D30   020B 0009
        BEQ     L_5E79                          ; 5D32   0204 0145

        JSR     R5,     L_68F3                  ; 5D34   0004 0168 00F3
        DECLE   $0165                           ; 5D37   0165

        BC      L_5E79                          ; 5D38   0201 013F
        PULR    R7                              ; 5D3A   02B7
L_5D3B:
        J       X_RESET                         ; 5D3B   0004 0310 0000

L_5D3E:
        PSHR    R5                              ; 5D3E   0275
        MVII    #$0180, R5                      ; 5D3F   02BD 0180
        MVI     G_0310, R0                      ; 5D41   0280 0310
        SLL     R0,     2                       ; 5D43   004C
        SLR     R0,     2                       ; 5D44   0064
L_5D45:
        PSHR    R5                              ; 5D45   0275
        NOP                                     ; 5D46   0034
        CLRC                                    ; 5D47   0006
        RRC     R0,     1                       ; 5D48   0070
        PSHR    R0                              ; 5D49   0270
        BNC     L_5E4A                          ; 5D4A   0209 00FE

        MVI@    R5,     R1                      ; 5D4C   02A9
        SLR     R1,     2                       ; 5D4D   0065
        SLR     R1,     2                       ; 5D4E   0065
        INCR    R1                              ; 5D4F   0009
        ADDR    R7,     R1                      ; 5D50   00F9
        ADD@    R1,     R7                      ; 5D51   02CF

        ADDR    R7,     R0                      ; 5D52   00F8
        RRC     R0,     1                       ; 5D53   0070
        RRC     R0,     1                       ; 5D54   0070
        ADDR    R7,     R0                      ; 5D55   00F8
        ADDR    R7,     R0                      ; 5D56   00F8
        ADDR    R7,     R0                      ; 5D57   00F8
        ADDR    R7,     R0                      ; 5D58   00F8
        MOVR    R6,     R2                      ; 5D59   00B2
        DECR    R0                              ; 5D5A   0010
        ADDR    R7,     R0                      ; 5D5B   00F8
        DECR    R0                              ; 5D5C   0010
        ADDR    R7,     R0                      ; 5D5D   00F8
        DECR    R0                              ; 5D5E   0010
        ADDR    R7,     R0                      ; 5D5F   00F8
        ADDR    R7,     R0                      ; 5D60   00F8
        SWAP    R0,     2                       ; 5D61   0044
        INCR    R5                              ; 5D62   000D
        MVI@    R5,     R0                      ; 5D63   02A8
        ADDI    #$0004, R0                      ; 5D64   02F8 0004
        MVI@    R5,     R1                      ; 5D66   02A9
        ADDI    #$0004, R1                      ; 5D67   02F9 0004
        MVII    #$0002, R4                      ; 5D69   02BC 0002
        MVI     G_0146, R2                      ; 5D6B   0282 0146
        ANDI    #$0020, R2                      ; 5D6D   03BA 0020
        BEQ     L_5D75                          ; 5D6F   0204 0004

        ADDI    #$0002, R4                      ; 5D71   02FC 0002
        DECR    R0                              ; 5D73   0010
        DECR    R1                              ; 5D74   0011
L_5D75:
        MVI     G_02F0, R2                      ; 5D75   0282 02F0
        ANDI    #$00FF, R2                      ; 5D77   03BA 00FF
        MVI     G_02F8, R3                      ; 5D79   0283 02F8
        ANDI    #$007F, R3                      ; 5D7B   03BB 007F
        SUBR    R0,     R2                      ; 5D7D   0102
        BMI     L_5E4A                          ; 5D7E   020B 00CA

        CMPR    R4,     R2                      ; 5D80   0162
        BGT     L_5E4A                          ; 5D81   020E 00C7

        SUBR    R1,     R3                      ; 5D83   010B
        BMI     L_5E4A                          ; 5D84   020B 00C4

        CMPR    R4,     R3                      ; 5D86   0163
        BGT     L_5E4A                          ; 5D87   020E 00C1

        SUBI    #$0003, R5                      ; 5D89   033D 0003
        MVI@    R5,     R4                      ; 5D8B   02AC
        DECR    R5                              ; 5D8C   0015
        ANDI    #$0001, R4                      ; 5D8D   03BC 0001
        MVO@    R4,     R5                      ; 5D8F   026C
        CLRR    R4                              ; 5D90   01E4

        JSR     R5,     L_5C24                  ; 5D91   0004 015C 0024

        B       L_5E4A                          ; 5D94   0200 00B4

        ADDI    #$0003, R5                      ; 5D96   02FD 0003
        MVI@    R5,     R2                      ; 5D98   02AA
        ADDI    #$0200, R2                      ; 5D99   02FA 0200

        JSR     R5,     L_68C7                  ; 5D9B   0004 0168 00C7

        SLL     R0,     2                       ; 5D9E   004C
        SLL     R0,     1                       ; 5D9F   0048
        ADDI    #$0002, R0                      ; 5DA0   02F8 0002
        SLL     R1,     2                       ; 5DA2   004D
        SLL     R1,     1                       ; 5DA3   0049
        ADDI    #$0002, R1                      ; 5DA4   02F9 0002
        MVI     G_02F0, R2                      ; 5DA6   0282 02F0
        ANDI    #$00FF, R2                      ; 5DA8   03BA 00FF
        MVI     G_02F8, R3                      ; 5DAA   0283 02F8
        ANDI    #$007F, R3                      ; 5DAC   03BB 007F
        SUBR    R0,     R2                      ; 5DAE   0102
        BMI     L_5E4A                          ; 5DAF   020B 0099

        CMPI    #$000C, R2                      ; 5DB1   037A 000C
        BGT     L_5E4A                          ; 5DB3   020E 0095

        SUBR    R1,     R3                      ; 5DB5   010B
        BMI     L_5E4A                          ; 5DB6   020B 0092

        CMPI    #$000C, R3                      ; 5DB8   037B 000C
        BGT     L_5E4A                          ; 5DBA   020E 008E

        CLRR    R4                              ; 5DBC   01E4

        JSR     R5,     L_5C24                  ; 5DBD   0004 015C 0024

        B       L_5E4A                          ; 5DC0   0200 0088

        INCR    R5                              ; 5DC2   000D
        MVI@    R5,     R0                      ; 5DC3   02A8
        ADDI    #$0002, R0                      ; 5DC4   02F8 0002
        MVI@    R5,     R1                      ; 5DC6   02A9
        ADDI    #$0002, R1                      ; 5DC7   02F9 0002
        MVII    #$02F2, R4                      ; 5DC9   02BC 02F2
        MVII    #$02FA, R5                      ; 5DCB   02BD 02FA
L_5DCD:
        CMPI    #$02F8, R4                      ; 5DCD   037C 02F8
        BGE     L_5E4A                          ; 5DCF   020D 0079

        MVI@    R4,     R2                      ; 5DD1   02A2
        ANDI    #$00FF, R2                      ; 5DD2   03BA 00FF
        MVI@    R5,     R3                      ; 5DD4   02AB
        ANDI    #$007F, R3                      ; 5DD5   03BB 007F
        SUBR    R0,     R2                      ; 5DD7   0102
        BMI     L_5DCD                          ; 5DD8   022B 000C

        CMPI    #$0006, R2                      ; 5DDA   037A 0006
        BGT     L_5DCD                          ; 5DDC   022E 0010

        SUBR    R1,     R3                      ; 5DDE   010B
        BMI     L_5DCD                          ; 5DDF   022B 0013

        CMPI    #$0006, R3                      ; 5DE1   037B 0006
        BGT     L_5DCD                          ; 5DE3   022E 0017

        MOVR    R4,     R3                      ; 5DE5   00A3
        SUBI    #$02F1, R3                      ; 5DE6   033B 02F1
        ADDR    R3,     R3                      ; 5DE8   00DB
        ADDI    #$010E, R3                      ; 5DE9   02FB 010E
        MVI@    R3,     R3                      ; 5DEB   029B
        ANDI    #$00F0, R3                      ; 5DEC   03BB 00F0
        BEQ     L_5DCD                          ; 5DEE   0224 0022

        CMPI    #$0070, R3                      ; 5DF0   037B 0070
        BEQ     L_5DCD                          ; 5DF2   0224 0026

        PULR    R0                              ; 5DF4   02B0
        PULR    R3                              ; 5DF5   02B3
        PSHR    R3                              ; 5DF6   0273
        PSHR    R0                              ; 5DF7   0270
        INCR    R3                              ; 5DF8   000B
        MVI@    R3,     R2                      ; 5DF9   029A
        ANDI    #$0001, R2                      ; 5DFA   03BA 0001
        MVO@    R2,     R3                      ; 5DFC   025A
        SUBI    #$02F1, R4                      ; 5DFD   033C 02F1

        JSR     R5,     L_5C24                  ; 5DFF   0004 015C 0024

        B       L_5E4A                          ; 5E02   0200 0046

        ADDI    #$0003, R5                      ; 5E04   02FD 0003
        MVI@    R5,     R2                      ; 5E06   02AA
        ADDI    #$0200, R2                      ; 5E07   02FA 0200

        JSR     R5,     L_68C7                  ; 5E09   0004 0168 00C7

        SLL     R0,     2                       ; 5E0C   004C
        SLL     R0,     1                       ; 5E0D   0048
        SUBI    #$0006, R0                      ; 5E0E   0338 0006
        SLL     R1,     2                       ; 5E10   004D
        SLL     R1,     1                       ; 5E11   0049
        SUBI    #$0006, R1                      ; 5E12   0339 0006
        MVII    #$02F2, R4                      ; 5E14   02BC 02F2
        MVII    #$02FA, R5                      ; 5E16   02BD 02FA
L_5E18:
        CMPI    #$02F8, R4                      ; 5E18   037C 02F8
        BGE     L_5E4A                          ; 5E1A   020D 002E

        MVI@    R4,     R2                      ; 5E1C   02A2
        ANDI    #$00FF, R2                      ; 5E1D   03BA 00FF
        MVI@    R5,     R3                      ; 5E1F   02AB
        ANDI    #$007F, R3                      ; 5E20   03BB 007F
        SUBR    R0,     R2                      ; 5E22   0102
        BMI     L_5E18                          ; 5E23   022B 000C

        CMPI    #$001C, R2                      ; 5E25   037A 001C
        BGT     L_5E18                          ; 5E27   022E 0010

        SUBR    R1,     R3                      ; 5E29   010B
        BMI     L_5E18                          ; 5E2A   022B 0013

        CMPI    #$001C, R3                      ; 5E2C   037B 001C
        BGT     L_5E18                          ; 5E2E   022E 0017

        MOVR    R4,     R3                      ; 5E30   00A3
        SUBI    #$02F1, R3                      ; 5E31   033B 02F1
        ADDR    R3,     R3                      ; 5E33   00DB
        ADDI    #$010E, R3                      ; 5E34   02FB 010E
        MVI@    R3,     R3                      ; 5E36   029B
        ANDI    #$00F0, R3                      ; 5E37   03BB 00F0
        BEQ     L_5E18                          ; 5E39   0224 0022

        CMPI    #$0020, R3                      ; 5E3B   037B 0020
        BEQ     L_5E18                          ; 5E3D   0224 0026

        PSHR    R4                              ; 5E3F   0274
        PSHR    R5                              ; 5E40   0275
        SUBI    #$02F1, R4                      ; 5E41   033C 02F1

        JSR     R5,     L_5C24                  ; 5E43   0004 015C 0024

        PULR    R5                              ; 5E46   02B5
        PULR    R4                              ; 5E47   02B4
        B       L_5E18                          ; 5E48   0220 0031

L_5E4A:
        PULR    R0                              ; 5E4A   02B0
        PULR    R5                              ; 5E4B   02B5
        ADDI    #$0008, R5                      ; 5E4C   02FD 0008
        TSTR    R0                              ; 5E4E   0080
        BNEQ    L_5D45                          ; 5E4F   022C 010B
        PULR    R7                              ; 5E51   02B7

L_5E52:
        PSHR    R5                              ; 5E52   0275
        MVI     G_0332, R2                      ; 5E53   0282 0332
        ANDI    #$00FE, R2                      ; 5E55   03BA 00FE
        BEQ     L_5E76                          ; 5E57   0204 001D

        SLR     R2,     2                       ; 5E59   0066
        MVII    #$0002, R4                      ; 5E5A   02BC 0002
L_5E5C:
        SARC    R2,     1                       ; 5E5C   007A
        BC      L_5E64                          ; 5E5D   0201 0005
        BEQ     L_5E76                          ; 5E5F   0204 0015

L_5E61:
        INCR    R4                              ; 5E61   000C
        B       L_5E5C                          ; 5E62   0220 0007

L_5E64:
        MVII    #$010E, R3                      ; 5E64   02BB 010E
        MVI@    R3,     R5                      ; 5E66   029D
        ANDI    #$00F0, R5                      ; 5E67   03BD 00F0
        BEQ     L_5E76                          ; 5E69   0204 000B

        ADDR    R4,     R3                      ; 5E6B   00E3
        ADDR    R4,     R3                      ; 5E6C   00E3
        MVI@    R3,     R3                      ; 5E6D   029B
        ANDI    #$00F0, R3                      ; 5E6E   03BB 00F0
        BEQ     L_5E61                          ; 5E70   0224 0010

        CLRR    R4                              ; 5E72   01E4

        JSR     R5,     L_5C24                  ; 5E73   0004 015C 0024

L_5E76:
        CLRR    R5                              ; 5E76   01ED
        MVO     R5,     G_0332                  ; 5E77   0245 0332
L_5E79:
        PULR    R7                              ; 5E79   02B7

L_5E7A:
        PSHR    R5                              ; 5E7A   0275
        MVII    #$0133, R3                      ; 5E7B   02BB 0133
L_5E7D:
        PSHR    R3                              ; 5E7D   0273
        MVI@    R3,     R1                      ; 5E7E   0299
        DECR    R1                              ; 5E7F   0011
        BMI     L_6025                          ; 5E80   020B 01A3

        MVO@    R1,     R3                      ; 5E82   0259
        BNEQ    L_6025                          ; 5E83   020C 01A0

        MOVR    R3,     R4                      ; 5E85   009C
        ADDI    #$0004, R4                      ; 5E86   02FC 0004
        MVI@    R4,     R2                      ; 5E88   02A2
        CMPI    #$00F0, R2                      ; 5E89   037A 00F0
        BGE     L_6025                          ; 5E8B   020D 0198

        ADDI    #$0200, R2                      ; 5E8D   02FA 0200

        JSR     R5,     L_68C7                  ; 5E8F   0004 0168 00C7

        INCR    R0                              ; 5E92   0008
        SLL     R0,     2                       ; 5E93   004C
        SLL     R0,     1                       ; 5E94   0048
        INCR    R1                              ; 5E95   0009
        SLL     R1,     2                       ; 5E96   004D
        SLL     R1,     1                       ; 5E97   0049
        ADDI    #$0003, R4                      ; 5E98   02FC 0003
        MVI@    R4,     R4                      ; 5E9A   02A4
        INCR    R4                              ; 5E9B   000C
        ADDR    R7,     R4                      ; 5E9C   00FC
        ADD@    R4,     R7                      ; 5E9D   02E7

        DECLE   $0187,  $0015,  $0023,  $0031   ; 5E9E   0187 0015 0023 0031
        DECLE   $003F                           ; 5EA2   003F

        SLLC    R3,     2                       ; 5EA3   005F
        SLR     R1,     1                       ; 5EA4   0061
        SLR     R3,     2                       ; 5EA5   0067
        MOVR    R2,     R6                      ; 5EA6   0096
        MOVR    R3,     R0                      ; 5EA7   0098
        MOVR    R3,     R2                      ; 5EA8   009A
        MOVR    R4,     R3                      ; 5EA9   00A3
        MOVR    R5,     R6                      ; 5EAA   00AE
        MOVR    R7,     R1                      ; 5EAB   00B9
        ADDR    R0,     R4                      ; 5EAC   00C4
        ADDR    R2,     R6                      ; 5EAD   00D6
        ADDR    R5,     R4                      ; 5EAE   00EC
        SUBR    R1,     R4                      ; 5EAF   010C
        SUBR    R5,     R4                      ; 5EB0   012C
        CMPR    R1,     R4                      ; 5EB1   014C
        CMPR    R5,     R4                      ; 5EB2   016C
        MVII    #$0080, R5                      ; 5EB3   02BD 0080
        MVO@    R5,     R3                      ; 5EB5   025D
        SDBD                                    ; 5EB6   0001
        MVII    #$8001, R2                      ; 5EB7   02BA 0001 0080
        MVII    #$0010, R3                      ; 5EBA   02BB 0010

        JSR     R5,     L_602C                  ; 5EBC   0004 0160 002C

        B       L_6022                          ; 5EBF   0200 0161

        MVII    #$0060, R5                      ; 5EC1   02BD 0060
        MVO@    R5,     R3                      ; 5EC3   025D
        SDBD                                    ; 5EC4   0001
        MVII    #$6001, R2                      ; 5EC5   02BA 0001 0060
        MVII    #$0010, R3                      ; 5EC8   02BB 0010

        JSR     R5,     L_602C                  ; 5ECA   0004 0160 002C

        B       L_6022                          ; 5ECD   0200 0153

        MVII    #$0060, R5                      ; 5ECF   02BD 0060
        MVO@    R5,     R3                      ; 5ED1   025D
        SDBD                                    ; 5ED2   0001
        MVII    #$7001, R2                      ; 5ED3   02BA 0001 0070
        MVII    #$00C0, R3                      ; 5ED6   02BB 00C0

        JSR     R5,     L_602C                  ; 5ED8   0004 0160 002C

        B       L_6022                          ; 5EDB   0200 0145

        PSHR    R0                              ; 5EDD   0270
        MVII    #$0005, R0                      ; 5EDE   02B8 0005

        JSR     R5,     X_RAND1                 ; 5EE0   0004 0114 027D

        ADDI    #$001C, R0                      ; 5EE3   02F8 001C
        MVO@    R0,     R3                      ; 5EE5   0258
        MVII    #$0004, R0                      ; 5EE6   02B8 0004

        JSR     R5,     X_RAND1                 ; 5EE8   0004 0114 027D

        TSTR    R0                              ; 5EEB   0080
        PULR    R0                              ; 5EEC   02B0
        BNEQ    L_5EF5                          ; 5EED   020C 0006

        MVII    #$0009, R2                      ; 5EEF   02BA 0009
        MVII    #$003C, R3                      ; 5EF1   02BB 003C
        B       L_6022                          ; 5EF3   0200 012D

L_5EF5:
        SDBD                                    ; 5EF5   0001
        MVII    #$9009, R2                      ; 5EF6   02BA 0009 0090
        MVII    #$00CC, R3                      ; 5EF9   02BB 00CC
        B       L_6022                          ; 5EFB   0200 0125
        B       L_6025                          ; 5EFD   0200 0126

        MVII    #$0001, R2                      ; 5EFF   02BA 0001
        MVII    #$003E, R3                      ; 5F01   02BB 003E
        B       L_6022                          ; 5F03   0200 011D

        MVI     G_0165, R5                      ; 5F05   0285 0165
        CMPI    #$00FF, R5                      ; 5F07   037D 00FF
        BEQ     L_5F12                          ; 5F09   0204 0007

        MVI     G_0163, R5                      ; 5F0B   0285 0163
        DECR    R5                              ; 5F0D   0015
        BMI     L_6025                          ; 5F0E   020B 0115

        MVO     R5,     G_0163                  ; 5F10   0245 0163
L_5F12:
        PSHR    R0                              ; 5F12   0270
        MVII    #$0005, R0                      ; 5F13   02B8 0005

        JSR     R5,     X_RAND1                 ; 5F15   0004 0114 027D

        ADDI    #$001A, R0                      ; 5F18   02F8 001A
        MVO@    R0,     R3                      ; 5F1A   0258
        MVII    #$0004, R0                      ; 5F1B   02B8 0004

        JSR     R5,     X_RAND1                 ; 5F1D   0004 0114 027D

        TSTR    R0                              ; 5F20   0080
        PULR    R0                              ; 5F21   02B0
        BNEQ    L_5F2C                          ; 5F22   020C 0008

        SDBD                                    ; 5F24   0001
        MVII    #$1001, R2                      ; 5F25   02BA 0001 0010
        MVII    #$003C, R3                      ; 5F28   02BB 003C
        B       L_6022                          ; 5F2A   0200 00F6

L_5F2C:
        SDBD                                    ; 5F2C   0001
        MVII    #$A001, R2                      ; 5F2D   02BA 0001 00A0
        MVII    #$001C, R3                      ; 5F30   02BB 001C
        B       L_6022                          ; 5F32   0200 00EE
        B       L_6025                          ; 5F34   0200 00EF
        B       L_6025                          ; 5F36   0200 00ED

        MVII    #$0018, R5                      ; 5F38   02BD 0018
        MVO@    R5,     R3                      ; 5F3A   025D
        MVII    #$0001, R2                      ; 5F3B   02BA 0001
        MVII    #$006E, R3                      ; 5F3D   02BB 006E
        B       L_6022                          ; 5F3F   0200 00E1

        MVII    #$0018, R5                      ; 5F41   02BD 0018
        MVO@    R5,     R3                      ; 5F43   025D
        SDBD                                    ; 5F44   0001
        MVII    #$1001, R2                      ; 5F45   02BA 0001 0010
        MVII    #$006A, R3                      ; 5F48   02BB 006A
        B       L_6022                          ; 5F4A   0200 00D6

        MVII    #$001C, R5                      ; 5F4C   02BD 001C
        MVO@    R5,     R3                      ; 5F4E   025D
        SDBD                                    ; 5F4F   0001
        MVII    #$2009, R2                      ; 5F50   02BA 0009 0020
        MVII    #$00CA, R3                      ; 5F53   02BB 00CA
        B       L_6022                          ; 5F55   0200 00CB

        MVII    #$001C, R5                      ; 5F57   02BD 001C
        MVO@    R5,     R3                      ; 5F59   025D
        SDBD                                    ; 5F5A   0001
        MVII    #$2009, R2                      ; 5F5B   02BA 0009 0020
        MVII    #$00CE, R3                      ; 5F5E   02BB 00CE
        B       L_6022                          ; 5F60   0200 00C0

        PSHR    R0                              ; 5F62   0270
        MVII    #$0004, R0                      ; 5F63   02B8 0004

        JSR     R5,     X_RAND1                 ; 5F65   0004 0114 027D

        ADDI    #$0012, R0                      ; 5F68   02F8 0012
        MVO@    R0,     R3                      ; 5F6A   0258
        PULR    R0                              ; 5F6B   02B0
        SDBD                                    ; 5F6C   0001
        MVII    #$2006, R2                      ; 5F6D   02BA 0006 0020
        MVII    #$001E, R3                      ; 5F70   02BB 001E
        B       L_6022                          ; 5F72   0200 00AE

        MVII    #$0060, R5                      ; 5F74   02BD 0060
        MVO@    R5,     R3                      ; 5F76   025D
        CMPI    #$0030, R1                      ; 5F77   0379 0030
        BMI     L_5F7F                          ; 5F79   020B 0004

        CLRR    R0                              ; 5F7B   01C0
        MVO@    R0,     R3                      ; 5F7C   0258
        B       L_6025                          ; 5F7D   0200 00A6

L_5F7F:
        SDBD                                    ; 5F7F   0001
        MVII    #$3001, R2                      ; 5F80   02BA 0001 0030
        MVII    #$0010, R3                      ; 5F83   02BB 0010

        JSR     R5,     L_602C                  ; 5F85   0004 0160 002C

        B       L_6022                          ; 5F88   0200 0098

        MVII    #$0005, R0                      ; 5F8A   02B8 0005

        JSR     R5,     X_RAND1                 ; 5F8C   0004 0114 027D

        ADDI    #$0014, R0                      ; 5F8F   02F8 0014
        MVO@    R0,     R3                      ; 5F91   0258
        MVII    #$0008, R1                      ; 5F92   02B9 0008
        SDBD                                    ; 5F94   0001
        MVII    #$4004, R2                      ; 5F95   02BA 0004 0040
        MVII    #$001B, R3                      ; 5F98   02BB 001B
        MVII    #$0001, R0                      ; 5F9A   02B8 0001

        JSR     R5,     X_RAND1                 ; 5F9C   0004 0114 027D

        SLL     R0,     1                       ; 5F9F   0048
        ADDR    R0,     R3                      ; 5FA0   00C3
        MVII    #$0058, R0                      ; 5FA1   02B8 0058

        JSR     R5,     X_RAND2                 ; 5FA3   0004 0114 029E

        ADDI    #$0028, R0                      ; 5FA6   02F8 0028
        B       L_6022                          ; 5FA8   0200 0078

        MVII    #$0005, R0                      ; 5FAA   02B8 0005

        JSR     R5,     X_RAND1                 ; 5FAC   0004 0114 027D

        ADDI    #$0014, R0                      ; 5FAF   02F8 0014
        MVO@    R0,     R3                      ; 5FB1   0258
        MVII    #$0008, R1                      ; 5FB2   02B9 0008
        SDBD                                    ; 5FB4   0001
        MVII    #$4004, R2                      ; 5FB5   02BA 0004 0040
        MVII    #$001B, R3                      ; 5FB8   02BB 001B
        MVII    #$0001, R0                      ; 5FBA   02B8 0001

        JSR     R5,     X_RAND1                 ; 5FBC   0004 0114 027D

        SLL     R0,     1                       ; 5FBF   0048
        ADDR    R0,     R3                      ; 5FC0   00C3
        MVII    #$0018, R0                      ; 5FC1   02B8 0018

        JSR     R5,     X_RAND2                 ; 5FC3   0004 0114 029E

        ADDI    #$0028, R0                      ; 5FC6   02F8 0028
        B       L_6022                          ; 5FC8   0200 0058

        MVII    #$0005, R0                      ; 5FCA   02B8 0005

        JSR     R5,     X_RAND1                 ; 5FCC   0004 0114 027D

        ADDI    #$0014, R0                      ; 5FCF   02F8 0014
        MVO@    R0,     R3                      ; 5FD1   0258
        MVII    #$0008, R1                      ; 5FD2   02B9 0008
        SDBD                                    ; 5FD4   0001
        MVII    #$4004, R2                      ; 5FD5   02BA 0004 0040
        MVII    #$001B, R3                      ; 5FD8   02BB 001B
        MVII    #$0001, R0                      ; 5FDA   02B8 0001

        JSR     R5,     X_RAND1                 ; 5FDC   0004 0114 027D

        SLL     R0,     1                       ; 5FDF   0048
        ADDR    R0,     R3                      ; 5FE0   00C3
        MVII    #$0018, R0                      ; 5FE1   02B8 0018

        JSR     R5,     X_RAND2                 ; 5FE3   0004 0114 029E

        ADDI    #$0048, R0                      ; 5FE6   02F8 0048
        B       L_6022                          ; 5FE8   0200 0038

        MVII    #$0005, R0                      ; 5FEA   02B8 0005

        JSR     R5,     X_RAND1                 ; 5FEC   0004 0114 027D

        ADDI    #$0014, R0                      ; 5FEF   02F8 0014
        MVO@    R0,     R3                      ; 5FF1   0258
        MVII    #$0008, R1                      ; 5FF2   02B9 0008
        SDBD                                    ; 5FF4   0001
        MVII    #$4004, R2                      ; 5FF5   02BA 0004 0040
        MVII    #$001B, R3                      ; 5FF8   02BB 001B
        MVII    #$0001, R0                      ; 5FFA   02B8 0001

        JSR     R5,     X_RAND1                 ; 5FFC   0004 0114 027D

        SLL     R0,     1                       ; 5FFF   0048
        ADDR    R0,     R3                      ; 6000   00C3
        MVII    #$0018, R0                      ; 6001   02B8 0018

        JSR     R5,     X_RAND2                 ; 6003   0004 0114 029E

        ADDI    #$0068, R0                      ; 6006   02F8 0068
        B       L_6022                          ; 6008   0200 0018

        MOVR    R0,     R4                      ; 600A   0084
        MVII    #$0005, R0                      ; 600B   02B8 0005

        JSR     R5,     X_RAND1                 ; 600D   0004 0114 027D

        ADDI    #$0014, R0                      ; 6010   02F8 0014
        MVI     G_0165, R2                      ; 6012   0282 0165
        SLR     R2,     2                       ; 6014   0066
        ADDR    R2,     R0                      ; 6015   00D0
        MVO@    R0,     R3                      ; 6016   0258
        MOVR    R4,     R0                      ; 6017   00A0
        ADDI    #$0008, R0                      ; 6018   02F8 0008
        SDBD                                    ; 601A   0001
        MVII    #$5001, R2                      ; 601B   02BA 0001 0050
        MVII    #$0018, R3                      ; 601E   02BB 0018
        B       L_6022                          ; 6020   0200 0000

L_6022:
        JSR     R5,     L_5C0E                  ; 6022   0004 015C 000E

L_6025:
        PULR    R3                              ; 6025   02B3
        INCR    R3                              ; 6026   000B
        CMPI    #$0137, R3                      ; 6027   037B 0137
        BMI     L_5E7D                          ; 6029   022B 01AD
L_602B:
        PULR    R7                              ; 602B   02B7

L_602C:
        PSHR    R5                              ; 602C   0275
        MVII    #$0001, R0                      ; 602D   02B8 0001

        JSR     R5,     X_RAND1                 ; 602F   0004 0114 027D

        TSTR    R0                              ; 6032   0080
        BEQ     L_602B                          ; 6033   0224 0009

        MVII    #$00A6, R0                      ; 6035   02B8 00A6
        ADDI    #$0008, R3                      ; 6037   02FB 0008
        PULR    R7                              ; 6039   02B7

L_603A:
        PSHR    R5                              ; 603A   0275
        MVII    #$02F8, R3                      ; 603B   02BB 02F8
        MVII    #$010E, R5                      ; 603D   02BD 010E
        SDBD                                    ; 603F   0001
        MVII    #$FBFF, R2                      ; 6040   02BA 00FF 00FB
        SDBD                                    ; 6043   0001
        MVII    #$0400, R1                      ; 6044   02B9 0000 0004
L_6047:
        MVI@    R3,     R4                      ; 6047   029C
        ANDR    R2,     R4                      ; 6048   0194
        MVI@    R5,     R0                      ; 6049   02A8
        INCR    R5                              ; 604A   000D
        ANDI    #$00F0, R0                      ; 604B   03B8 00F0
        BEQ     L_605A                          ; 604D   0204 000B

        SUBI    #$0002, R5                      ; 604F   033D 0002
        MVI@    R5,     R0                      ; 6051   02A8
        INCR    R5                              ; 6052   000D
        ADDI    #$0004, R0                      ; 6053   02F8 0004
        ANDI    #$0008, R0                      ; 6055   03B8 0008
        BEQ     L_605A                          ; 6057   0204 0001

        XORR    R1,     R4                      ; 6059   01CC
L_605A:
        MVO@    R4,     R3                      ; 605A   025C
        INCR    R3                              ; 605B   000B
        CMPI    #$0300, R3                      ; 605C   037B 0300
        BLE     L_6047                          ; 605E   0226 0018
        PULR    R7                              ; 6060   02B7

L_6061:
        PSHR    R5                              ; 6061   0275
        MVII    #$0300, R3                      ; 6062   02BB 0300
        MVII    #$010F, R5                      ; 6064   02BD 010F
L_6066:
        MVI@    R5,     R1                      ; 6066   02A9
        INCR    R5                              ; 6067   000D
        ADDI    #$0200, R1                      ; 6068   02F9 0200
        MVI@    R1,     R1                      ; 606A   0289
        CLRR    R0                              ; 606B   01C0
        RLC     R1,     1                       ; 606C   0051
        RRC     R0,     1                       ; 606D   0070
        RRC     R0,     2                       ; 606E   0074
        MVI@    R3,     R1                      ; 606F   0299
        SDBD                                    ; 6070   0001
        ANDI    #$DFFF, R1                      ; 6071   03B9 00FF 00DF
        XORR    R0,     R1                      ; 6074   01C1
        MVO@    R1,     R3                      ; 6075   0259
        INCR    R3                              ; 6076   000B
        CMPI    #$0308, R3                      ; 6077   037B 0308
        BMI     L_6066                          ; 6079   022B 0014
        PULR    R7                              ; 607B   02B7

L_607C:
        PSHR    R5                              ; 607C   0275
        MVI     G_0160, R3                      ; 607D   0283 0160
        INCR    R3                              ; 607F   000B
        MVO     R3,     G_0160                  ; 6080   0243 0160
        MVII    #$0110, R4                      ; 6082   02BC 0110
        MVII    #$02F1, R5                      ; 6084   02BD 02F1
L_6086:
        MVI@    R4,     R2                      ; 6086   02A2
        MOVR    R2,     R3                      ; 6087   0093
        ANDI    #$000F, R2                      ; 6088   03BA 000F
        SLR     R3,     2                       ; 608A   0067
        SLR     R3,     2                       ; 608B   0067
        INCR    R3                              ; 608C   000B
        ADDR    R7,     R3                      ; 608D   00FB
        ADD@    R3,     R7                      ; 608E   02DF

        SARC    R3,     2                       ; 608F   007F
        DECR    R0                              ; 6090   0010
        DECR    R0                              ; 6091   0010
        DECR    R0                              ; 6092   0010
        DECR    R0                              ; 6093   0010
        DECR    R0                              ; 6094   0010
        SLL     R1,     2                       ; 6095   004D
        SARC    R3,     2                       ; 6096   007F
        SAR     R3,     1                       ; 6097   006B
        SAR     R3,     1                       ; 6098   006B
        SLL     R1,     2                       ; 6099   004D
        DECR    R0                              ; 609A   0010
        DECR    R0                              ; 609B   0010
        SARC    R3,     2                       ; 609C   007F
        SARC    R3,     2                       ; 609D   007F
        SARC    R3,     2                       ; 609E   007F
        MOVR    R5,     R3                      ; 609F   00AB
        ADDI    #$0008, R3                      ; 60A0   02FB 0008
        MVI@    R3,     R0                      ; 60A2   0298
        RLC     R0,     1                       ; 60A3   0050
        BC      L_610E                          ; 60A4   0201 0068

        PSHR    R5                              ; 60A6   0275
        MVI     G_0160, R3                      ; 60A7   0283 0160
        ANDI    #$0001, R3                      ; 60A9   03BB 0001
        INCR    R3                              ; 60AB   000B
        MVI@    R5,     R0                      ; 60AC   02A8
        SDBD                                    ; 60AD   0001
        ADDI    #$1000, R0                      ; 60AE   02F8 0000 0010
        ADDI    #$0007, R5                      ; 60B1   02FD 0007
        MVI@    R5,     R1                      ; 60B3   02A9

        JSR     R5,     L_6121                  ; 60B4   0004 0160 0121
        JSR     R5,     L_619E                  ; 60B7   0004 0160 019E

        PULR    R5                              ; 60BA   02B5
        MVI@    R4,     R3                      ; 60BB   02A3
        DECR    R4                              ; 60BC   0014
        ADDI    #$0200, R3                      ; 60BD   02FB 0200
        CMPR    R2,     R3                      ; 60BF   0153
        BEQ     L_60C9                          ; 60C0   0204 0007

        MVI@    R2,     R3                      ; 60C2   0293
        SDBD                                    ; 60C3   0001
        ANDI    #$4000, R3                      ; 60C4   03BB 0000 0040
        BNEQ    L_60D2                          ; 60C7   020C 0009

L_60C9:
        MVO@    R0,     R5                      ; 60C9   0268
        ADDI    #$0007, R5                      ; 60CA   02FD 0007
        MVO@    R1,     R5                      ; 60CC   0269
        SUBI    #$0008, R5                      ; 60CD   033D 0008
        MVO@    R2,     R4                      ; 60CF   0262
        B       L_6110                          ; 60D0   0200 003E

L_60D2:
        MOVR    R5,     R1                      ; 60D2   00A9
        ADDI    #$0010, R1                      ; 60D3   02F9 0010
        MVI@    R1,     R0                      ; 60D5   0288
        SLL     R0,     1                       ; 60D6   0048
        SETC                                    ; 60D7   0007
        RRC     R0,     1                       ; 60D8   0070
        MVO@    R0,     R1                      ; 60D9   0248
        B       L_610E                          ; 60DA   0200 0032

        MOVR    R5,     R3                      ; 60DC   00AB
        ADDI    #$0008, R3                      ; 60DD   02FB 0008
        MVI@    R3,     R0                      ; 60DF   0298
        RLC     R0,     1                       ; 60E0   0050
        BC      L_610E                          ; 60E1   0201 002B

        PSHR    R5                              ; 60E3   0275
        MVI@    R5,     R0                      ; 60E4   02A8
        ADDI    #$0007, R5                      ; 60E5   02FD 0007
        MVI@    R5,     R1                      ; 60E7   02A9
        MVII    #$0003, R3                      ; 60E8   02BB 0003

        JSR     R5,     L_6121                  ; 60EA   0004 0160 0121
        JSR     R5,     L_619E                  ; 60ED   0004 0160 019E

        PULR    R5                              ; 60F0   02B5
        MVO@    R0,     R5                      ; 60F1   0268
        ADDI    #$0007, R5                      ; 60F2   02FD 0007
        MVO@    R1,     R5                      ; 60F4   0269
        SUBI    #$0008, R5                      ; 60F5   033D 0008
        MVO@    R2,     R4                      ; 60F7   0262
        B       L_6110                          ; 60F8   0200 0016

        PSHR    R5                              ; 60FA   0275
        MVI@    R5,     R0                      ; 60FB   02A8
        ADDI    #$0007, R5                      ; 60FC   02FD 0007
        MVI@    R5,     R1                      ; 60FE   02A9
        SUBI    #$0002, R1                      ; 60FF   0339 0002

        JSR     R5,     L_619E                  ; 6101   0004 0160 019E

        PULR    R5                              ; 6104   02B5
        MVO@    R0,     R5                      ; 6105   0268
        ADDI    #$0007, R5                      ; 6106   02FD 0007
        MVO@    R1,     R5                      ; 6108   0269
        SUBI    #$0008, R5                      ; 6109   033D 0008
        MVO@    R2,     R4                      ; 610B   0262
        B       L_6110                          ; 610C   0200 0002

L_610E:
        INCR    R4                              ; 610E   000C
        INCR    R5                              ; 610F   000D
L_6110:
        CMPI    #$02F8, R5                      ; 6110   037D 02F8
        BMI     L_6086                          ; 6112   022B 008D

        MVI     G_015E, R5                      ; 6114   0285 015E
        MOVR    R5,     R4                      ; 6116   00AC
        XORI    #$0008, R5                      ; 6117   03FD 0008
        CMPR    R4,     R5                      ; 6119   0165
        BMI     L_611E                          ; 611A   020B 0002

        MVO     R5,     G_015E                  ; 611C   0245 015E
L_611E:
        PULR    R7                              ; 611E   02B7

L_611F:
        CLRR    R0                              ; 611F   01C0
        CLRR    R1                              ; 6120   01C9
L_6121:
        PSHR    R5                              ; 6121   0275
        ANDI    #$000F, R2                      ; 6122   03BA 000F
        SARC    R3,     1                       ; 6124   007B
        BNC     L_6149                          ; 6125   0209 0022

        MOVR    R2,     R5                      ; 6127   0095
        INCR    R5                              ; 6128   000D
        ADDR    R7,     R5                      ; 6129   00FD
        ADD@    R5,     R7                      ; 612A   02EF

        DECR    R1                              ; 612B   0011
        DECR    R1                              ; 612C   0011
        DECR    R0                              ; 612D   0010
        DECR    R5                              ; 612E   0015
        DECR    R5                              ; 612F   0015
        DECR    R5                              ; 6130   0015
        DECR    R4                              ; 6131   0014
        COMR    R1                              ; 6132   0019
        COMR    R1                              ; 6133   0019
        COMR    R1                              ; 6134   0019
        COMR    R0                              ; 6135   0018
        COMR    R5                              ; 6136   001D
        COMR    R5                              ; 6137   001D
        COMR    R5                              ; 6138   001D
        COMR    R4                              ; 6139   001C
        DECR    R1                              ; 613A   0011
        DECR    R1                              ; 613B   0011
        INCR    R0                              ; 613C   0008
        B       L_6149                          ; 613D   0200 000A

        DECR    R0                              ; 613F   0010
        DECR    R1                              ; 6140   0011
        B       L_6149                          ; 6141   0200 0006

        INCR    R1                              ; 6143   0009
        DECR    R0                              ; 6144   0010
        B       L_6149                          ; 6145   0200 0002

        INCR    R0                              ; 6147   0008
        INCR    R1                              ; 6148   0009
L_6149:
        SARC    R3,     1                       ; 6149   007B
        BNC     L_616B                          ; 614A   0209 001F

        MOVR    R2,     R5                      ; 614C   0095
        INCR    R5                              ; 614D   000D
        ADDR    R7,     R5                      ; 614E   00FD
        ADD@    R5,     R7                      ; 614F   02EF

        DECR    R1                              ; 6150   0011
        DECR    R0                              ; 6151   0010
        DECR    R0                              ; 6152   0010
        DECR    R0                              ; 6153   0010
        DECR    R4                              ; 6154   0014
        DECR    R3                              ; 6155   0013
        DECR    R3                              ; 6156   0013
        DECR    R3                              ; 6157   0013
L_6158:
        DECR    R7                              ; 6158   0017

        DECR    R6                              ; 6159   0016
        DECR    R6                              ; 615A   0016
        DECR    R6                              ; 615B   0016
        COMR    R2                              ; 615C   001A
        COMR    R1                              ; 615D   0019
        COMR    R1                              ; 615E   0019
        COMR    R1                              ; 615F   0019
        DECR    R1                              ; 6160   0011
        INCR    R0                              ; 6161   0008
        PULR    R7                              ; 6162   02B7

        DECR    R0                              ; 6163   0010
        DECR    R1                              ; 6164   0011
        PULR    R7                              ; 6165   02B7

        INCR    R1                              ; 6166   0009
        DECR    R0                              ; 6167   0010
        PULR    R7                              ; 6168   02B7

        INCR    R0                              ; 6169   0008
        INCR    R1                              ; 616A   0009
L_616B:
        PULR    R7                              ; 616B   02B7

L_616C:
        PSHR    R5                              ; 616C   0275
        PSHR    R0                              ; 616D   0270
        NOP                                     ; 616E   0034
        PSHR    R1                              ; 616F   0271
        PSHR    R4                              ; 6170   0274
        CLRR    R4                              ; 6171   01E4
        DECR    R4                              ; 6172   0014
        MVII    #$0008, R5                      ; 6173   02BD 0008
        SUB     G_0161, R0                      ; 6175   0300 0161
        BGE     L_617D                          ; 6177   020D 0004

        NEGR    R0                              ; 6179   0020
        NEGR    R4                              ; 617A   0024
        XORI    #$0008, R5                      ; 617B   03FD 0008
L_617D:
        SUB     G_0162, R1                      ; 617D   0301 0162
        BGE     L_6183                          ; 617F   020D 0002

        NEGR    R1                              ; 6181   0021
        NEGR    R4                              ; 6182   0024
L_6183:
        SLL     R1,     2                       ; 6183   004D
        CMPR    R0,     R1                      ; 6184   0141
        BLE     L_6198                          ; 6185   0206 0011

        ADDR    R4,     R5                      ; 6187   00E5
        SLR     R1,     1                       ; 6188   0061
        CMPR    R0,     R1                      ; 6189   0141
        BLE     L_6198                          ; 618A   0206 000C

        ADDR    R4,     R5                      ; 618C   00E5
        SLR     R1,     1                       ; 618D   0061
        SLL     R0,     1                       ; 618E   0048
        CMPR    R0,     R1                      ; 618F   0141
        BLE     L_6198                          ; 6190   0206 0006

        ADDR    R4,     R5                      ; 6192   00E5
        SLL     R0,     1                       ; 6193   0048
        CMPR    R0,     R1                      ; 6194   0141
        BLE     L_6198                          ; 6195   0206 0001

        ADDR    R4,     R5                      ; 6197   00E5
L_6198:
        ANDI    #$000F, R5                      ; 6198   03BD 000F
        PULR    R4                              ; 619A   02B4
        PULR    R1                              ; 619B   02B1
        PULR    R0                              ; 619C   02B0
        PULR    R7                              ; 619D   02B7

L_619E:
        MOVR    R0,     R2                      ; 619E   0082
        ANDI    #$00FF, R2                      ; 619F   03BA 00FF
        SUBI    #$0004, R2                      ; 61A1   033A 0004
        BGE     L_61A6                          ; 61A3   020D 0001

        CLRR    R2                              ; 61A5   01D2
L_61A6:
        SLR     R2,     2                       ; 61A6   0066
        SLR     R2,     1                       ; 61A7   0062
        CMPI    #$0014, R2                      ; 61A8   037A 0014
        BMI     L_61AE                          ; 61AA   020B 0002

        MVII    #$0013, R2                      ; 61AC   02BA 0013
L_61AE:
        PSHR    R2                              ; 61AE   0272
        MOVR    R1,     R2                      ; 61AF   008A
        ANDI    #$007F, R2                      ; 61B0   03BA 007F
        SUBI    #$0004, R2                      ; 61B2   033A 0004
        BGE     L_61B7                          ; 61B4   020D 0001

        CLRR    R2                              ; 61B6   01D2
L_61B7:
        SLR     R2,     2                       ; 61B7   0066
        SLR     R2,     1                       ; 61B8   0062
        CMPI    #$000C, R2                      ; 61B9   037A 000C
        BMI     L_61BF                          ; 61BB   020B 0002

        MVII    #$000B, R2                      ; 61BD   02BA 000B
L_61BF:
        SLL     R2,     2                       ; 61BF   004E
        PSHR    R2                              ; 61C0   0272
        SLL     R2,     2                       ; 61C1   004E
        ADD@    R6,     R2                      ; 61C2   02F2
        ADD@    R6,     R2                      ; 61C3   02F2
        ADDI    #$0200, R2                      ; 61C4   02FA 0200
        MOVR    R5,     R7                      ; 61C6   00AF

        DECLE   $0000,  $0006,  $0011,  $0012   ; 61C7   0000 0006 0011 0012
        DECLE   $0014,  $0015,  $0019,  $001B   ; 61CB   0014 0015 0019 001B
        DECLE   $001C,  $001D,  $001E,  $0020   ; 61CF   001C 001D 001E 0020
        DECLE   $0022,  $0000,  $0000,  $0000   ; 61D3   0022 0000 0000 0000
        DECLE   $0015,  $0016,  $0015,  $0016   ; 61D7   0015 0016 0015 0016
        DECLE   $0015,  $0016,  $0013,  $0050   ; 61DB   0015 0016 0013 0050
        DECLE   $0050,  $0013,  $0050,  $0050   ; 61DF   0050 0013 0050 0050
        DECLE   $0013,  $005B,  $005B,  $005B   ; 61E3   0013 005B 005B 005B
        DECLE   $005B,  $005B,  $005B,  $0013   ; 61E7   005B 005B 005B 0013
        DECLE   $0065,  $0065,  $00A5,  $0026   ; 61EB   0065 0065 00A5 0026
        DECLE   $0069,  $00AA,  $00AB,  $03EC   ; 61EF   0069 00AA 00AB 03EC
        DECLE   $00AB,  $002C,  $0013,  $003A   ; 61F3   00AB 002C 0013 003A
        DECLE   $003F,  $0035,  $0050,  $0021   ; 61F7   003F 0035 0050 0021
        DECLE   $003F,  $003D,  $003F           ; 61FB   003F 003D 003F

        RRC     R2,     2                       ; 61FE   0076
        NEGR    R1                              ; 61FF   0021
        RSWD    R6                              ; 6200   003E
        DECR    R2                              ; 6201   0012
        SUBR    R0,     R0                      ; 6202   0100
        RSWD    R2                              ; 6203   003A
        RSWD    R2                              ; 6204   003A
        NEGR    R1                              ; 6205   0021
        RSWD    R5                              ; 6206   003D
        ADD     .STIC.C.4,R0                    ; 6207   02C0 001C
        NEGR    R1                              ; 6209   0021
        DECR    R2                              ; 620A   0012
        RLC     R0,     2                       ; 620B   0054
        NEGR    R1                              ; 620C   0021
L_620D:
        DECR    R7                              ; 620D   0017

        DECLE   $0012,  $0076,  $003A,  $0021   ; 620E   0012 0076 003A 0021
        DECLE   $003F                           ; 6212   003F
L_6213:
        DECR    R7                              ; 6213   0017

        DECLE   $0076,  $003A,  $0021,  $003F   ; 6214   0076 003A 0021 003F
L_6218:
        DECR    R7                              ; 6218   0017

        DECLE   $0076,  $003A,  $0021,  $003F   ; 6219   0076 003A 0021 003F
L_621D:
        DECR    R7                              ; 621D   0017

        DECLE   $0075,  $003A,  $0021,  $003A   ; 621E   0075 003A 0021 003A
        DECLE   $0021,  $003F,  $003D,  $0012   ; 6222   0021 003F 003D 0012
        DECLE   $0090,  $0021,  $003A,  $0024   ; 6226   0090 0021 003A 0024
        DECLE   $003A,  $0021,  $0018,  $003A   ; 622A   003A 0021 0018 003A
        DECLE   $003C,  $0021,  $0012,  $003A   ; 622E   003C 0021 0012 003A
        DECLE   $0050,  $0021,  $003F,  $003D   ; 6232   0050 0021 003F 003D
        DECLE   $003F,  $0011,  $003E,  $0012   ; 6236   003F 0011 003E 0012
        DECLE   $0100,  $003A,  $003A,  $0021   ; 623A   0100 003A 003A 0021
        DECLE   $003D,  $02C0,  $001C,  $0021   ; 623E   003D 02C0 001C 0021
        DECLE   $0012,  $0090,  $0021,  $003A   ; 6242   0012 0090 0021 003A
        DECLE   $0024,  $0021,  $003D,  $003A   ; 6246   0024 0021 003D 003A
        DECLE   $003C,  $0021,  $001A,  $0012   ; 624A   003C 0021 001A 0012
        DECLE   $0300,  $003A,  $0050,  $0021   ; 624E   0300 003A 0050 0021
        DECLE   $003F,  $003D,  $003A,  $0302   ; 6252   003F 003D 003A 0302
        DECLE   $00D0,  $0080,  $001C,  $0090   ; 6256   00D0 0080 001C 0090
        DECLE   $0021,  $003F,  $003D,  $003F   ; 625A   0021 003F 003D 003F
        DECLE   $0033,  $0186,  $00D0,  $0080   ; 625E   0033 0186 00D0 0080
        DECLE   $001C,  $00D0,  $0021,  $003F   ; 6262   001C 00D0 0021 003F
        DECLE   $003D,  $003F,  $001D,  $003F   ; 6266   003D 003F 001D 003F
        DECLE   $001E,  $00C2,  $0050,  $0024   ; 626A   001E 00C2 0050 0024
        DECLE   $003D,  $003A,  $0011,  $003C   ; 626E   003D 003A 0011 003C
        DECLE   $0021,  $0046,  $0076,  $0024   ; 6272   0021 0046 0076 0024
        DECLE   $003A,  $0021,  $003D,  $003C   ; 6276   003A 0021 003D 003C
        DECLE   $01C1,  $0000,  $001C,  $007C   ; 627A   01C1 0000 001C 007C
        DECLE   $003A,  $0076,  $003A,  $0021   ; 627E   003A 0076 003A 0021
        DECLE   $003F,  $003D,  $0076,  $003A   ; 6282   003F 003D 0076 003A
        DECLE   $0021,  $003F,  $003D,  $003F   ; 6286   0021 003F 003D 003F
        DECLE   $0186,  $0300,  $0090,  $0021   ; 628A   0186 0300 0090 0021
        DECLE   $0050,  $0021,  $003F,  $003D   ; 628E   0050 0021 003F 003D
        DECLE   $0050,  $0021,  $0086,  $0010   ; 6292   0050 0021 0086 0010
        DECLE   $0019,  $0013,  $0380,  $009C   ; 6296   0019 0013 0380 009C
        DECLE   $0021,  $0090,  $003F,  $0082   ; 629A   0021 0090 003F 0082
        DECLE   $0021,  $0090,  $003F,  $0082   ; 629E   0021 0090 003F 0082
        DECLE   $0011,  $0082,  $0000           ; 62A2   0011 0082 0000

        COMR    R4                              ; 62A5   001C
        SARC    R0,     2                       ; 62A6   007C
        RSWD    R2                              ; 62A7   003A
        MOVR    R2,     R4                      ; 62A8   0094
        NEGR    R1                              ; 62A9   0021
L_62AA:
        DECR    R7                              ; 62AA   0017

        DECLE   $00C6,  $0060,  $001F,  $0021   ; 62AB   00C6 0060 001F 0021
        DECLE   $0012,  $00A2,  $0021,  $0184   ; 62AF   0012 00A2 0021 0184
        DECLE   $0012,  $003C,  $00C1,  $00A3   ; 62B3   0012 003C 00C1 00A3
        DECLE   $0012,  $00A2,  $0012,  $0031   ; 62B7   0012 00A2 0012 0031
        DECLE   $002D,  $0061,  $002D,  $0061   ; 62BB   002D 0061 002D 0061
        DECLE   $0021,  $0021,  $0021,  $0021   ; 62BF   0021 0021 0021 0021
        DECLE   $006F,  $0021,  $0013,  $0032   ; 62C3   006F 0021 0013 0032
        DECLE   $002E,  $0061,  $002E,  $0061   ; 62C7   002E 0061 002E 0061
        DECLE   $0021,  $0021,  $0021,  $0021   ; 62CB   0021 0021 0021 0021
        DECLE   $006F,  $0021,  $0013,  $0027   ; 62CF   006F 0021 0013 0027

        MOVR    R5,     R0                      ; 62D3   00A8
        DECR    R2                              ; 62D4   0012
        GSWD    R0                              ; 62D5   0030
        NEGR    R1                              ; 62D6   0021
        DECR    R2                              ; 62D7   0012
        NEGR    R1                              ; 62D8   0021
        NEGR    R1                              ; 62D9   0021
        NEGR    R1                              ; 62DA   0021
        NEGR    R1                              ; 62DB   0021
        NEGR    R1                              ; 62DC   0021
L_62DD:
        DECR    R7                              ; 62DD   0017

        DECLE   $0021,  $0021,  $0021,  $0021   ; 62DE   0021 0021 0021 0021
        DECLE   $0021,  $0012,  $0030,  $0021   ; 62E2   0021 0012 0030 0021
        DECLE   $0030,  $0012,  $0030,  $0021   ; 62E6   0030 0012 0030 0021
        DECLE   $0030,  $0012,  $0021,  $00BB   ; 62EA   0030 0012 0021 00BB
        DECLE   $003A,  $0184,  $0012,  $003C   ; 62EE   003A 0184 0012 003C
        DECLE   $0080,  $003F,  $0011,  $0050   ; 62F2   0080 003F 0011 0050
        DECLE   $0021,  $00FD,  $0021,  $00FD   ; 62F6   0021 00FD 0021 00FD
        DECLE   $003F                           ; 62FA   003F

        DECR    R1                              ; 62FB   0011
        NEGR    R1                              ; 62FC   0021
        ADDR    R7,     R5                      ; 62FD   00FD
        MVI     .STIC.C.4,R0                    ; 62FE   0280 001C
        MOVR    R2,     R1                      ; 6300   0091
        NEGR    R1                              ; 6301   0021
        ADDR    R7,     R5                      ; 6302   00FD
        B       L_6321                          ; 6303   0200 001C

        DECLE   $00D1,  $0021,  $003F,  $00FD   ; 6305   00D1 0021 003F 00FD
        DECLE   $0021,  $0046,  $0021,  $00BB   ; 6309   0021 0046 0021 00BB
        DECLE   $003A,  $0184,  $0012,  $0100   ; 630D   003A 0184 0012 0100
        DECLE   $00BC,  $003F,  $003D,  $0090   ; 6311   00BC 003F 003D 0090
        DECLE   $003F                           ; 6315   003F

        RSWD    R5                              ; 6316   003D
        B       L_6335                          ; 6317   0200 001C

        DECR    R1                              ; 6319   0011
        ADDR    R2,     R0                      ; 631A   00D0
        NEGR    R1                              ; 631B   0021
        RSWD    R5                              ; 631C   003D
        RSWD    R2                              ; 631D   003A
        XOR     G_00D7, R2                      ; 631E   03C2 00D7
        SLR     R1,     1                       ; 6320   0061
L_6321:
        ADDR    R3,     R6                      ; 6321   00DE
        SLR     R1,     1                       ; 6322   0061
        ADDR    R4,     R1                      ; 6323   00E1
        SLR     R1,     1                       ; 6324   0061
        ADDR    R4,     R4                      ; 6325   00E4
        SLR     R1,     1                       ; 6326   0061
        ADDR    R5,     R3                      ; 6327   00EB
        SLR     R1,     1                       ; 6328   0061
        ADDR    R5,     R7                      ; 6329   00EF

        SLR     R1,     1                       ; 632A   0061
        ADDR    R6,     R6                      ; 632B   00F6
        SLR     R1,     1                       ; 632C   0061
        INCR    R3                              ; 632D   000B
        SLR     R2,     1                       ; 632E   0062
        INCR    R7                              ; 632F   000F

        SLR     R2,     1                       ; 6330   0062
L_6331:
        NEGR    R6                              ; 6331   0026
        SLR     R2,     1                       ; 6332   0062
        GSWD    R1                              ; 6333   0031
        SLR     R2,     1                       ; 6334   0062
L_6335:
        SWAP    R3,     1                       ; 6335   0043
        SLR     R2,     1                       ; 6336   0062
        RLC     R2,     2                       ; 6337   0056
        SLR     R2,     1                       ; 6338   0062
        SLR     R0,     1                       ; 6339   0060
        SLR     R2,     1                       ; 633A   0062
        SAR     R0,     2                       ; 633B   006C
        SLR     R2,     1                       ; 633C   0062
        RRC     R0,     2                       ; 633D   0074
        SLR     R2,     1                       ; 633E   0062
        SARC    R3,     1                       ; 633F   007B
        SLR     R2,     1                       ; 6340   0062
        MOVR    R2,     R5                      ; 6341   0095
        SLR     R2,     1                       ; 6342   0062
        MOVR    R3,     R0                      ; 6343   0098
        SLR     R2,     1                       ; 6344   0062
        TSTR    R4                              ; 6345   00A4
        SLR     R2,     1                       ; 6346   0062
        MOVR    R5,     R4                      ; 6347   00AC
        SLR     R2,     1                       ; 6348   0062
        MOVR    R6,     R0                      ; 6349   00B0
        SLR     R2,     1                       ; 634A   0062
        TSTR    R6                              ; 634B   00B6
        SLR     R2,     1                       ; 634C   0062
        MOVR    R7,     R0                      ; 634D   00B8
        SLR     R2,     1                       ; 634E   0062
        INCR    R7                              ; 634F   000F

        SLR     R2,     1                       ; 6350   0062
L_6351:
        MOVR    R7,     R2                      ; 6351   00BA
        SLR     R2,     1                       ; 6352   0062
        ADDR    R0,     R6                      ; 6353   00C6
        SLR     R2,     1                       ; 6354   0062
        ADDR    R2,     R2                      ; 6355   00D2
        SLR     R2,     1                       ; 6356   0062
        ADDR    R2,     R5                      ; 6357   00D5
        SLR     R2,     1                       ; 6358   0062
        ADDR    R3,     R0                      ; 6359   00D8
        SLR     R2,     1                       ; 635A   0062
        ADDR    R4,     R4                      ; 635B   00E4
        SLR     R2,     1                       ; 635C   0062
        ADDR    R5,     R0                      ; 635D   00E8
        SLR     R2,     1                       ; 635E   0062
        ADDR    R5,     R4                      ; 635F   00EC
        SLR     R2,     1                       ; 6360   0062
        INCR    R3                              ; 6361   000B
        SLR     R3,     1                       ; 6362   0063
        ADDR    R6,     R6                      ; 6363   00F6
        SLR     R1,     1                       ; 6364   0061
        INCR    R3                              ; 6365   000B
        SLR     R2,     1                       ; 6366   0062
        INCR    R7                              ; 6367   000F

        SLR     R2,     1                       ; 6368   0062
L_6369:
        NEGR    R6                              ; 6369   0026
        SLR     R2,     1                       ; 636A   0062
        GSWD    R1                              ; 636B   0031
        SLR     R2,     1                       ; 636C   0062
        SWAP    R3,     1                       ; 636D   0043
        SLR     R2,     1                       ; 636E   0062
        RLC     R2,     2                       ; 636F   0056
        SLR     R2,     1                       ; 6370   0062
        SLR     R0,     1                       ; 6371   0060
        SLR     R2,     1                       ; 6372   0062
        SAR     R0,     2                       ; 6373   006C
        SLR     R2,     1                       ; 6374   0062
        RRC     R0,     2                       ; 6375   0074
        SLR     R2,     1                       ; 6376   0062
L_6377:
        PSHR    R5                              ; 6377   0275
        CLRR    R3                              ; 6378   01DB
L_6379:
        PSHR    R3                              ; 6379   0273
        MOVR    R3,     R5                      ; 637A   009D
        ADDI    #$0308, R5                      ; 637B   02FD 0308
        MVI@    R5,     R1                      ; 637D   02A9
        MOVR    R1,     R2                      ; 637E   008A
        BEQ     L_6741                          ; 637F   0204 03C0

        MOVR    R3,     R5                      ; 6381   009D
        ADDI    #$0300, R5                      ; 6382   02FD 0300
        MVI@    R5,     R0                      ; 6384   02A8
        SLLC    R0,     2                       ; 6385   005C
        BOV     L_6741                          ; 6386   0202 03B9
        BNC     L_6392                          ; 6388   0209 0008

        SLR     R0,     2                       ; 638A   0064
        DECR    R5                              ; 638B   0015
        MVO@    R0,     R5                      ; 638C   0268
        CLRR    R2                              ; 638D   01D2
        SDBD                                    ; 638E   0001
        ANDI    #$FF80, R1                      ; 638F   03B9 0080 00FF
L_6392:
        ANDI    #$007F, R2                      ; 6392   03BA 007F
        DECR    R1                              ; 6394   0011
        DECR    R2                              ; 6395   0012
        BGT     L_673E                          ; 6396   020E 03A6
        BEQ     L_639B                          ; 6398   0204 0001

        INCR    R1                              ; 639A   0009
L_639B:
        MVII    #$010E, R5                      ; 639B   02BD 010E
        ADDR    R3,     R5                      ; 639D   00DD
        ADDR    R3,     R5                      ; 639E   00DD
        MVI@    R5,     R0                      ; 639F   02A8
        SLR     R0,     2                       ; 63A0   0064
        SLR     R0,     2                       ; 63A1   0064
        SDBD                                    ; 63A2   0001
        MVII    #$61C7, R5                      ; 63A3   02BD 00C7 0061
        ADDR    R0,     R5                      ; 63A6   00C5
        MVI@    R5,     R5                      ; 63A7   02AD
        MOVR    R1,     R2                      ; 63A8   008A
        SWAP    R2,     1                       ; 63A9   0042
        SLR     R2,     2                       ; 63AA   0066
        NOP                                     ; 63AB   0034
        SLR     R2,     2                       ; 63AC   0066
        ANDI    #$000F, R2                      ; 63AD   03BA 000F
        ADDR    R2,     R5                      ; 63AF   00D5
        ADDR    R5,     R5                      ; 63B0   00ED
        SDBD                                    ; 63B1   0001
        ADDI    #$631F, R5                      ; 63B2   02FD 001F 0063
        SDBD                                    ; 63B5   0001
        MVI@    R5,     R4                      ; 63B6   02AC
        MOVR    R1,     R0                      ; 63B7   0088
        SLL     R0,     1                       ; 63B8   0048
        SWAP    R0,     1                       ; 63B9   0040
        ANDI    #$001F, R0                      ; 63BA   03B8 001F
        ADDR    R0,     R4                      ; 63BC   00C4
        MVI@    R4,     R2                      ; 63BD   02A2
        MOVR    R2,     R0                      ; 63BE   0090
        SDBD                                    ; 63BF   0001
        ANDI    #$FF80, R1                      ; 63C0   03B9 0080 00FF
        ADDI    #$0080, R1                      ; 63C3   02F9 0080
        MOVR    R1,     R5                      ; 63C5   008D
        MOVR    R0,     R1                      ; 63C6   0081
        ANDI    #$03C0, R1                      ; 63C7   03B9 03C0
        SLR     R1,     2                       ; 63C9   0065
        SLR     R1,     1                       ; 63CA   0061
        ADDR    R5,     R1                      ; 63CB   00E9
        ANDI    #$003F, R2                      ; 63CC   03BA 003F
        INCR    R2                              ; 63CE   000A
        ADDR    R7,     R2                      ; 63CF   00FA
        ADD@    R2,     R7                      ; 63D0   02D7

        SWAP    R0,     1                       ; 63D1   0040
        SLL     R0,     2                       ; 63D2   004C
        RLC     R2,     1                       ; 63D3   0052
        MOVR    R1,     R5                      ; 63D4   008D
        SLLC    R2,     2                       ; 63D5   005E
        MOVR    R1,     R5                      ; 63D6   008D
        SAR     R0,     2                       ; 63D7   006C
        MOVR    R1,     R5                      ; 63D8   008D
        MOVR    R1,     R5                      ; 63D9   008D
        MOVR    R1,     R5                      ; 63DA   008D
        MOVR    R1,     R5                      ; 63DB   008D
        MOVR    R1,     R5                      ; 63DC   008D
        MOVR    R1,     R5                      ; 63DD   008D
        MOVR    R1,     R5                      ; 63DE   008D
        MOVR    R1,     R5                      ; 63DF   008D
        MOVR    R1,     R5                      ; 63E0   008D
        CMP@    R5,     R5                      ; 63E1   036D
        RRC     R3,     2                       ; 63E2   0077
        MOVR    R0,     R6                      ; 63E3   0086
        MOVR    R1,     R5                      ; 63E4   008D
        MOVR    R2,     R6                      ; 63E5   0096
        MOVR    R4,     R3                      ; 63E6   00A3
        MOVR    R5,     R6                      ; 63E7   00AE
        MOVR    R7,     R5                      ; 63E8   00BD
        ADDR    R2,     R3                      ; 63E9   00D3
        ADDR    R4,     R7                      ; 63EA   00E7

        SUBR    R0,     R3                      ; 63EB   0103
        SUBR    R3,     R7                      ; 63EC   011F

        DECLE   $012C,  $0157,  $015C,  $016E   ; 63ED   012C 0157 015C 016E
        DECLE   $019A,  $01B0,  $01C5,  $01C9   ; 63F1   019A 01B0 01C5 01C9
        DECLE   $01E1,  $01EB,  $01F8,  $01FD   ; 63F5   01E1 01EB 01F8 01FD
        DECLE   $0206,  $022B                   ; 63F9   0206 022B

        MVO     R4,     .BTAB.5D                ; 63FB   0244 025D
        PSHR    R6                              ; 63FD   0276
        MVI@    R1,     R7                      ; 63FE   028F

        MVI@    R2,     R4                      ; 63FF   0294
        MVI@    R3,     R1                      ; 6400   0299
        PULR    R1                              ; 6401   02B1
        MVII    #$02CE, R4                      ; 6402   02BC 02CE
        ADD@    R4,     R7                      ; 6404   02E7

        DECLE   $008D,  $02F4,  $02FF,  $008D   ; 6405   008D 02F4 02FF 008D

        MOVR    R1,     R5                      ; 6409   008D
        MOVR    R1,     R5                      ; 640A   008D
        SUB@    R2,     R5                      ; 640B   0315
        SUB@    R4,     R2                      ; 640C   0322
        SUBI    #$0345, R3                      ; 640D   033B 0345
        CMP@    R1,     R6                      ; 640F   034E
        CMP@    R3,     R7                      ; 6410   035F
        MOVR    R1,     R0                      ; 6411   0088
        ANDI    #$0078, R0                      ; 6412   03B8 0078
        XORR    R0,     R1                      ; 6414   01C1
        SLR     R0,     2                       ; 6415   0064
        SLR     R0,     1                       ; 6416   0060
        MOVR    R0,     R5                      ; 6417   0085

        JSR     R4,     L_67E8                  ; 6418   0004 0064 03E8

        B       L_673E                          ; 641B   0200 0321

        ANDI    #$0078, R1                      ; 641D   03B9 0078
        SLL     R1,     1                       ; 641F   0049
        SWAP    R1,     1                       ; 6420   0041
        B       L_673E                          ; 6421   0200 031B

        MOVR    R1,     R0                      ; 6423   0088
        SDBD                                    ; 6424   0001
        ANDI    #$F000, R1                      ; 6425   03B9 0000 00F0
        ANDI    #$0078, R0                      ; 6428   03B8 0078
        SLL     R0,     2                       ; 642A   004C
        SLL     R0,     2                       ; 642B   004C
        XORR    R0,     R1                      ; 642C   01C1
        B       L_673E                          ; 642D   0200 030F

        JSR     R5,     L_67DC                  ; 642F   0004 0164 03DC

        MOVR    R1,     R0                      ; 6432   0088
        ANDI    #$0078, R0                      ; 6433   03B8 0078
        XORR    R0,     R1                      ; 6435   01C1
        CMPR    R0,     R2                      ; 6436   0142
        BMI     L_673E                          ; 6437   020B 0305

        ADDI    #$0080, R1                      ; 6439   02F9 0080
        B       L_673E                          ; 643B   0200 0301

        MOVR    R1,     R0                      ; 643D   0088
        ANDI    #$0078, R0                      ; 643E   03B8 0078
        XORR    R0,     R1                      ; 6440   01C1
        SLL     R0,     2                       ; 6441   004C
        SLL     R0,     2                       ; 6442   004C
        ADDI    #$0080, R0                      ; 6443   02F8 0080
        SUBR    R0,     R1                      ; 6445   0101
        B       L_673E                          ; 6446   0200 02F6

        MVII    #$010E, R2                      ; 6448   02BA 010E
        ADDR    R3,     R2                      ; 644A   00DA
        ADDR    R3,     R2                      ; 644B   00DA
        MVI@    R2,     R5                      ; 644C   0295
        ANDI    #$000F, R5                      ; 644D   03BD 000F
        NEGR    R5                              ; 644F   0025
        ADDI    #$0008, R5                      ; 6450   02FD 0008

        JSR     R4,     L_67E8                  ; 6452   0004 0064 03E8

        B       L_673E                          ; 6455   0200 02E7

        SDBD                                    ; 6457   0001
        ANDI    #$F000, R1                      ; 6458   03B9 0000 00F0
        INCR    R1                              ; 645B   0009
        B       L_673E                          ; 645C   0200 02E0

L_645E:
        PSHR    R3                              ; 645E   0273
        MOVR    R3,     R4                      ; 645F   009C

        JSR     R5,     L_5D1C                  ; 6460   0004 015C 011C

        CLRR    R1                              ; 6463   01C9
        PULR    R3                              ; 6464   02B3
        B       L_673E                          ; 6465   0200 02D7

        PSHR    R1                              ; 6467   0271

        JSR     R5,     L_67D0                  ; 6468   0004 0164 03D0
        JSR     R5,     L_616C                  ; 646B   0004 0160 016C
        JSR     R4,     L_67E8                  ; 646E   0004 0064 03E8

        PULR    R1                              ; 6471   02B1
        B       L_673E                          ; 6472   0200 02CA

        MVII    #$02F0, R2                      ; 6474   02BA 02F0
        ADDR    R3,     R2                      ; 6476   00DA
        MVI@    R2,     R0                      ; 6477   0290
        SDBD                                    ; 6478   0001
        ANDI    #$FDFF, R0                      ; 6479   03B8 00FF 00FD
        MVO@    R0,     R2                      ; 647C   0250
        B       L_673E                          ; 647D   0200 02BF

        MVII    #$02F0, R2                      ; 647F   02BA 02F0
        ADDR    R3,     R2                      ; 6481   00DA
        MVI@    R2,     R0                      ; 6482   0290
        SDBD                                    ; 6483   0001
        ANDI    #$FDFF, R0                      ; 6484   03B8 00FF 00FD
        SDBD                                    ; 6487   0001
        ADDI    #$1200, R0                      ; 6488   02F8 0000 0012
        MVO@    R0,     R2                      ; 648B   0250
        B       L_673E                          ; 648C   0200 02B0

L_648E:
        MVII    #$0080, R4                      ; 648E   02BC 0080
L_6490:
        PSHR    R1                              ; 6490   0271
        PSHR    R3                              ; 6491   0273

        JSR     R5,     L_67D0                  ; 6492   0004 0164 03D0
        JSR     R5,     L_616C                  ; 6495   0004 0160 016C

        SUBI    #$0004, R0                      ; 6498   0338 0004
        SUBI    #$0004, R1                      ; 649A   0339 0004
        MVII    #$0064, R3                      ; 649C   02BB 0064
        ADDR    R5,     R4                      ; 649E   00EC

        JSR     R5,     L_55EE                  ; 649F   0004 0154 01EE

        B       L_673C                          ; 64A2   0200 0298

L_64A4:
        PSHR    R1                              ; 64A4   0271
        PSHR    R3                              ; 64A5   0273
        MVII    #$010F, R5                      ; 64A6   02BD 010F
        ADDR    R3,     R5                      ; 64A8   00DD
        ADDR    R3,     R5                      ; 64A9   00DD
        MVI@    R5,     R0                      ; 64AA   02A8
        ADDI    #$0200, R0                      ; 64AB   02F8 0200
        MVI     G_010F, R1                      ; 64AD   0281 010F
        ADDI    #$0200, R1                      ; 64AF   02F9 0200
        MVII    #$00E4, R4                      ; 64B1   02BC 00E4

        JSR     R5,     L_5615                  ; 64B3   0004 0154 0215

        B       L_673C                          ; 64B6   0200 0284

        MOVR    R3,     R2                      ; 64B8   009A
        ADDI    #$02F8, R2                      ; 64B9   02FA 02F8
        MVI@    R2,     R0                      ; 64BB   0290
        ANDI    #$007F, R0                      ; 64BC   03B8 007F
        CMPI    #$0020, R0                      ; 64BE   0378 0020
        BLE     L_6741                          ; 64C0   0206 027F

        SDBD                                    ; 64C2   0001
        ANDI    #$FF80, R1                      ; 64C3   03B9 0080 00FF
        SUBI    #$0008, R2                      ; 64C6   033A 0008
        MVI@    R2,     R0                      ; 64C8   0290
        ANDI    #$007F, R0                      ; 64C9   03B8 007F
        XORR    R0,     R1                      ; 64CB   01C1
        ADDI    #$0008, R2                      ; 64CC   02FA 0008
        MVI@    R2,     R0                      ; 64CE   0290
        SLL     R0,     1                       ; 64CF   0048
        SLR     R0,     1                       ; 64D0   0060
        MVO@    R0,     R2                      ; 64D1   0250
        B       L_673E                          ; 64D2   0200 026A

        MVII    #$010F, R2                      ; 64D4   02BA 010F
        ADDR    R3,     R2                      ; 64D6   00DA
        ADDR    R3,     R2                      ; 64D7   00DA
        MVI@    R2,     R2                      ; 64D8   0292
        ADDI    #$0214, R2                      ; 64D9   02FA 0214
        MVII    #$0003, R4                      ; 64DB   02BC 0003
L_64DD:
        CMPI    #$02F0, R0                      ; 64DD   0378 02F0
        BGE     L_64EC                          ; 64DF   020D 000B

        MVI@    R2,     R0                      ; 64E1   0290

        JSR     R5,     L_67F4                  ; 64E2   0004 0164 03F4

        BC      L_673E                          ; 64E5   0201 0257

        ADDI    #$0014, R2                      ; 64E7   02FA 0014
        DECR    R4                              ; 64E9   0014
        BNEQ    L_64DD                          ; 64EA   022C 000E

L_64EC:
        ADDI    #$0080, R1                      ; 64EC   02F9 0080
        B       L_673E                          ; 64EE   0200 024E

        MVII    #$02F0, R2                      ; 64F0   02BA 02F0
        ADDR    R3,     R2                      ; 64F2   00DA
        MVI@    R2,     R0                      ; 64F3   0290
        SDBD                                    ; 64F4   0001
        XORI    #$3000, R0                      ; 64F5   03F8 0000 0030
        MVO@    R0,     R2                      ; 64F8   0250
        SUBI    #$0005, R1                      ; 64F9   0339 0005
        B       L_673E                          ; 64FB   0200 0241

        MVII    #$010E, R2                      ; 64FD   02BA 010E
        ADDR    R3,     R2                      ; 64FF   00DA
        ADDR    R3,     R2                      ; 6500   00DA
        MVI@    R2,     R0                      ; 6501   0290
        ANDI    #$000F, R0                      ; 6502   03B8 000F
        MOVR    R0,     R5                      ; 6504   0085
        NEGR    R0                              ; 6505   0020
        ADDI    #$0008, R0                      ; 6506   02F8 0008
        ANDI    #$000F, R0                      ; 6508   03B8 000F
        MVI@    R2,     R4                      ; 650A   0294
        ANDI    #$00F0, R4                      ; 650B   03BC 00F0
        ADDR    R4,     R0                      ; 650D   00E0
        MVII    #$02F0, R4                      ; 650E   02BC 02F0
        ADDR    R3,     R4                      ; 6510   00DC
        MVI@    R4,     R4                      ; 6511   02A4
        ANDI    #$00FF, R4                      ; 6512   03BC 00FF
        ADDI    #$0004, R5                      ; 6514   02FD 0004
        ANDI    #$0008, R5                      ; 6516   03BD 0008
        BEQ     L_6521                          ; 6518   0204 0007

        CMPI    #$0054, R4                      ; 651A   037C 0054
        BGE     L_673E                          ; 651C   020D 0220

        MVO@    R0,     R2                      ; 651E   0250
        B       L_673E                          ; 651F   0200 021D

L_6521:
        CMPI    #$0054, R4                      ; 6521   037C 0054
        BMI     L_673E                          ; 6523   020B 0219

        MVO@    R0,     R2                      ; 6525   0250
        B       L_673E                          ; 6526   0200 0216

        MVII    #$0004, R4                      ; 6528   02BC 0004
        NEGR    R4                              ; 652A   0024
        B       L_652F                          ; 652B   0200 0002

        MVII    #$0004, R4                      ; 652D   02BC 0004
L_652F:
        MOVR    R3,     R2                      ; 652F   009A
        ADDR    R2,     R2                      ; 6530   00D2
        ADDI    #$010E, R2                      ; 6531   02FA 010E
        MVI@    R2,     R0                      ; 6533   0290
        MOVR    R0,     R5                      ; 6534   0085
        ANDI    #$000F, R0                      ; 6535   03B8 000F
        XORR    R0,     R5                      ; 6537   01C5
        ADDR    R4,     R0                      ; 6538   00E0
        ANDI    #$000F, R0                      ; 6539   03B8 000F
        XORR    R5,     R0                      ; 653B   01E8
        MVO@    R0,     R2                      ; 653C   0250
        B       L_673E                          ; 653D   0200 01FF

        JSR     R5,     L_67DC                  ; 653F   0004 0164 03DC

        SUB     G_0161, R0                      ; 6542   0300 0161
        BGE     L_6547                          ; 6544   020D 0001

        NEGR    R0                              ; 6546   0020
L_6547:
        SUB     G_0162, R2                      ; 6547   0302 0162
        BGE     L_673E                          ; 6549   020D 01F3

        NEGR    R2                              ; 654B   0022
        CMPI    #$0008, R0                      ; 654C   0378 0008
        BLE     L_6557                          ; 654E   0206 0007

        PSHR    R0                              ; 6550   0270
        SLL     R0,     1                       ; 6551   0048
        ADD@    R6,     R0                      ; 6552   02F0
        INCR    R2                              ; 6553   000A
        CMPR    R0,     R2                      ; 6554   0142
        BMI     L_673E                          ; 6555   020B 01E7

L_6557:
        PSHR    R1                              ; 6557   0271
        PSHR    R3                              ; 6558   0273

        JSR     R5,     L_67D0                  ; 6559   0004 0164 03D0

        ANDI    #$007E, R1                      ; 655C   03B9 007E
        SUBI    #$0004, R0                      ; 655E   0338 0004
        SUBI    #$0004, R1                      ; 6560   0339 0004
        MVII    #$0028, R3                      ; 6562   02BB 0028
        MVII    #$00C0, R4                      ; 6564   02BC 00C0

        JSR     R5,     L_55EE                  ; 6566   0004 0154 01EE

        B       L_673C                          ; 6569   0200 01D1

        MVII    #$02F0, R4                      ; 656B   02BC 02F0
        ADDR    R3,     R4                      ; 656D   00DC
        MVI@    R4,     R4                      ; 656E   02A4
        ANDI    #$00FF, R4                      ; 656F   03BC 00FF
        MVII    #$010E, R2                      ; 6571   02BA 010E
        ADDR    R3,     R2                      ; 6573   00DA
        ADDR    R3,     R2                      ; 6574   00DA
        MVI@    R2,     R0                      ; 6575   0290
        ANDI    #$00F0, R0                      ; 6576   03B8 00F0
        CMP     G_0161, R4                      ; 6578   0344 0161
        BLE     L_657E                          ; 657A   0206 0002

        ADDI    #$0008, R0                      ; 657C   02F8 0008
L_657E:
        MVO@    R0,     R2                      ; 657E   0250
        B       L_673E                          ; 657F   0200 01BD

        JSR     R5,     L_67DC                  ; 6581   0004 0164 03DC

        CMPI    #$0002, R0                      ; 6584   0378 0002
        BMI     L_645E                          ; 6586   022B 0129

        CMPI    #$00A6, R0                      ; 6588   0378 00A6
        BGT     L_645E                          ; 658A   022E 012D

        CMPI    #$0007, R2                      ; 658C   037A 0007
        BMI     L_645E                          ; 658E   022B 0131

        CMPI    #$0066, R2                      ; 6590   037A 0066
        BGT     L_645E                          ; 6592   022E 0135
        B       L_673E                          ; 6594   0200 01A8

        MVII    #$01FF, R0                      ; 6596   02B8 01FF
        B       L_659C                          ; 6598   0200 0002

        MVII    #$0201, R0                      ; 659A   02B8 0201
L_659C:
        PSHR    R1                              ; 659C   0271
        PSHR    R3                              ; 659D   0273
        MVII    #$010F, R5                      ; 659E   02BD 010F
        ADDR    R3,     R5                      ; 65A0   00DD
        ADDR    R3,     R5                      ; 65A1   00DD
        ADD@    R5,     R0                      ; 65A2   02E8
        MVI     G_010F, R1                      ; 65A3   0281 010F
        ADDI    #$0200, R1                      ; 65A5   02F9 0200
        MVII    #$00E4, R4                      ; 65A7   02BC 00E4

        JSR     R5,     L_5615                  ; 65A9   0004 0154 0215
        JSR     R5,     L_6DBE                  ; 65AC   0004 016C 01BE
        DECLE   $000F                           ; 65AF   000F

        B       L_673C                          ; 65B0   0200 018A

        MVII    #$02F8, R2                      ; 65B2   02BA 02F8
        ADDR    R3,     R2                      ; 65B4   00DA
        MVI@    R2,     R0                      ; 65B5   0290
        SLL     R0,     1                       ; 65B6   0048
        SETC                                    ; 65B7   0007
        RRC     R0,     1                       ; 65B8   0070
        MVO@    R0,     R2                      ; 65B9   0250
        B       L_673E                          ; 65BA   0200 0182

        MVII    #$02F0, R2                      ; 65BC   02BA 02F0
        ADDR    R3,     R2                      ; 65BE   00DA
        MVI@    R2,     R0                      ; 65BF   0290
        SDBD                                    ; 65C0   0001
        ADDI    #$1000, R0                      ; 65C1   02F8 0000 0010
        MVO@    R0,     R2                      ; 65C4   0250
        SUBI    #$0004, R1                      ; 65C5   0339 0004
        B       L_673E                          ; 65C7   0200 0175

        DECLE   $0004                           ; 65C9   0004

        ANDR    R5,     R4                      ; 65CA   01AC
        SUBR    R5,     R2                      ; 65CB   012A
        PULR    R3                              ; 65CC   02B3
        PULR    R7                              ; 65CD   02B7

        JSR     R5,     L_67DC                  ; 65CE   0004 0164 03DC

        CMPI    #$0050, R2                      ; 65D1   037A 0050
        BGT     L_645E                          ; 65D3   022E 0176
        B       L_673E                          ; 65D5   0200 0167

        JSR     R5,     L_67DC                  ; 65D7   0004 0164 03DC

        CMPI    #$0010, R2                      ; 65DA   037A 0010
        BMI     L_673E                          ; 65DC   020B 0160

        PSHR    R1                              ; 65DE   0271
        MOVR    R2,     R1                      ; 65DF   0091

        JSR     R5,     L_616C                  ; 65E0   0004 0160 016C

        PULR    R1                              ; 65E3   02B1
        SUBI    #$000A, R5                      ; 65E4   033D 000A
        BMI     L_673E                          ; 65E6   020B 0156

        CMPI    #$0004, R5                      ; 65E8   037D 0004
        BGT     L_673E                          ; 65EA   020E 0152

        MOVR    R5,     R0                      ; 65EC   00A8
        SLL     R0,     2                       ; 65ED   004C
        SLL     R0,     2                       ; 65EE   004C
        MVII    #$02F0, R2                      ; 65EF   02BA 02F0
        SWAP    R0,     1                       ; 65F1   0040
        ADDR    R3,     R2                      ; 65F2   00DA
        MVI@    R2,     R5                      ; 65F3   0295
        SDBD                                    ; 65F4   0001
        ANDI    #$0FFF, R5                      ; 65F5   03BD 00FF 000F
        ADDR    R0,     R5                      ; 65F8   00C5
        MVO@    R5,     R2                      ; 65F9   0255
        B       L_648E                          ; 65FA   0220 016D

        PSHR    R1                              ; 65FC   0271
        PSHR    R3                              ; 65FD   0273

        JSR     R5,     L_68B2                  ; 65FE   0004 0168 00B2
        JSR     R5,     L_6859                  ; 6601   0004 0168 0059
        BIDECLE $9590,  $3898                   ; 6604   0090 0095 0098 0038
        DECLE   $0004                           ; 6608   0004

        JSR     R5,     L_6859                  ; 6609   0004 0168 0059
        BIDECLE $9590,  $3818                   ; 660C   0090 0095 0018 0038
        DECLE   $0004                           ; 6610   0004

        MVO     R0,     .STIC.VIDEN             ; 6611   0240 0020
        B       L_673C                          ; 6613   0200 0127

        PSHR    R1                              ; 6615   0271
        PSHR    R3                              ; 6616   0273

        JSR     R5,     L_68B2                  ; 6617   0004 0168 00B2
        JSR     R5,     L_6859                  ; 661A   0004 0168 0059
        BIDECLE $95B0,  $3898                   ; 661D   00B0 0095 0098 0038
        DECLE   $0004                           ; 6621   0004

        JSR     R5,     L_6859                  ; 6622   0004 0168 0059
        BIDECLE $95D0,  $3818                   ; 6625   00D0 0095 0018 0038
        DECLE   $0004                           ; 6629   0004

        MVO     R0,     .STIC.VIDEN             ; 662A   0240 0020
        B       L_673C                          ; 662C   0200 010E

        PSHR    R1                              ; 662E   0271
        PSHR    R3                              ; 662F   0273

        JSR     R5,     L_68B2                  ; 6630   0004 0168 00B2
        JSR     R5,     L_6859                  ; 6633   0004 0168 0059
        BIDECLE $95F0,  $3898                   ; 6636   00F0 0095 0098 0038
        DECLE   $0004                           ; 663A   0004

        JSR     R5,     L_6859                  ; 663B   0004 0168 0059
        BIDECLE $9610,  $3818                   ; 663E   0010 0096 0018 0038
        DECLE   $0004                           ; 6642   0004

        MVO     R0,     .STIC.VIDEN             ; 6643   0240 0020
        B       L_673C                          ; 6645   0200 00F5

        PSHR    R1                              ; 6647   0271
        PSHR    R3                              ; 6648   0273

        JSR     R5,     L_68B2                  ; 6649   0004 0168 00B2
        JSR     R5,     L_6859                  ; 664C   0004 0168 0059
        BIDECLE $9630,  $3898                   ; 664F   0030 0096 0098 0038
        DECLE   $0004                           ; 6653   0004

        JSR     R5,     L_6859                  ; 6654   0004 0168 0059
        BIDECLE $9630,  $3818                   ; 6657   0030 0096 0018 0038
        DECLE   $0004                           ; 665B   0004

        MVO     R0,     .STIC.VIDEN             ; 665C   0240 0020
        B       L_673C                          ; 665E   0200 00DC

        JSR     R5,     L_6748                  ; 6660   0004 0164 0348

        B       L_673E                          ; 6663   0200 00D9

        JSR     R5,     L_677D                  ; 6665   0004 0164 037D

        B       L_673E                          ; 6668   0200 00D4

        MVII    #$02F0, R2                      ; 666A   02BA 02F0
        ADDR    R3,     R2                      ; 666C   00DA
        MVI@    R2,     R0                      ; 666D   0290
        SDBD                                    ; 666E   0001
        ADDI    #$13FC, R0                      ; 666F   02F8 00FC 0013
        MVO@    R0,     R2                      ; 6672   0250
        ADDI    #$0008, R2                      ; 6673   02FA 0008
        MVI@    R2,     R0                      ; 6675   0290
        ADDI    #$00FC, R0                      ; 6676   02F8 00FC
        MVO@    R0,     R2                      ; 6678   0250
        ADDI    #$0008, R2                      ; 6679   02FA 0008
        MVI@    R2,     R0                      ; 667B   0290
        DECR    R0                              ; 667C   0010
        MVO@    R0,     R2                      ; 667D   0250
        SUBI    #$0005, R1                      ; 667E   0339 0005
        B       L_673E                          ; 6680   0200 00BC

        MVII    #$02F0, R2                      ; 6682   02BA 02F0
        ADDR    R3,     R2                      ; 6684   00DA
        MVI@    R2,     R0                      ; 6685   0290
        SDBD                                    ; 6686   0001
        XORI    #$1000, R0                      ; 6687   03F8 0000 0010
        MVO@    R0,     R2                      ; 668A   0250
        B       L_673E                          ; 668B   0200 00B1

        PSHR    R1                              ; 668D   0271

        JSR     R5,     L_67D0                  ; 668E   0004 0164 03D0
        JSR     R5,     L_616C                  ; 6691   0004 0160 016C

        CMPI    #$000C, R5                      ; 6694   037D 000C
        BGE     L_6699                          ; 6696   020D 0001

        CLRR    R5                              ; 6698   01ED

L_6699:
        JSR     R4,     L_67E8                  ; 6699   0004 0064 03E8

        PULR    R1                              ; 669C   02B1
        B       L_673E                          ; 669D   0200 009F

        PSHR    R1                              ; 669F   0271

        JSR     R5,     L_67D0                  ; 66A0   0004 0164 03D0
        JSR     R5,     L_616C                  ; 66A3   0004 0160 016C

        CMPI    #$0008, R5                      ; 66A6   037D 0008
        BGE     L_66AC                          ; 66A8   020D 0002

        MVII    #$0008, R5                      ; 66AA   02BD 0008
L_66AC:
        CMPI    #$000C, R5                      ; 66AC   037D 000C
        BLE     L_66B2                          ; 66AE   0206 0002

        MVII    #$000C, R5                      ; 66B0   02BD 000C

L_66B2:
        JSR     R4,     L_67E8                  ; 66B2   0004 0064 03E8

        PULR    R1                              ; 66B5   02B1
        B       L_673E                          ; 66B6   0200 0086

        MVII    #$010E, R2                      ; 66B8   02BA 010E
        ADDR    R3,     R2                      ; 66BA   00DA
        ADDR    R3,     R2                      ; 66BB   00DA
        MVI@    R2,     R5                      ; 66BC   0295
        ANDI    #$000F, R5                      ; 66BD   03BD 000F
        NEGR    R5                              ; 66BF   0025

        JSR     R4,     L_67E8                  ; 66C0   0004 0064 03E8

        B       L_673E                          ; 66C3   0200 0079

        MVII    #$0004, R0                      ; 66C5   02B8 0004

        JSR     R5,     X_RAND1                 ; 66C7   0004 0114 027D

        MOVR    R0,     R5                      ; 66CA   0085

        JSR     R4,     L_67E8                  ; 66CB   0004 0064 03E8

        B       L_673E                          ; 66CE   0200 006E

        PSHR    R1                              ; 66D0   0271

        JSR     R5,     L_67D0                  ; 66D1   0004 0164 03D0
        JSR     R5,     L_616C                  ; 66D4   0004 0160 016C

        PULR    R1                              ; 66D7   02B1
        MOVR    R5,     R4                      ; 66D8   00AC
        MVII    #$0003, R0                      ; 66D9   02B8 0003

        JSR     R5,     X_RAND2                 ; 66DB   0004 0114 029E

        ADDR    R0,     R4                      ; 66DE   00C4
        DECR    R4                              ; 66DF   0014
        MOVR    R4,     R5                      ; 66E0   00A5

        JSR     R4,     L_67E8                  ; 66E1   0004 0064 03E8

        B       L_673E                          ; 66E4   0200 0058

        MVII    #$0008, R0                      ; 66E6   02B8 0008

        JSR     R5,     X_RAND2                 ; 66E8   0004 0114 029E

        INCR    R0                              ; 66EB   0008
        SDBD                                    ; 66EC   0001
        ANDI    #$FF80, R1                      ; 66ED   03B9 0080 00FF
        ADDR    R0,     R1                      ; 66F0   00C1
        B       L_673E                          ; 66F1   0200 004B

        JSR     R5,     L_67DC                  ; 66F3   0004 0164 03DC

        CMPI    #$0010, R2                      ; 66F6   037A 0010
        BMI     L_673E                          ; 66F8   020B 0044

        PSHR    R1                              ; 66FA   0271
        MOVR    R2,     R1                      ; 66FB   0091

        JSR     R5,     L_616C                  ; 66FC   0004 0160 016C

        PULR    R1                              ; 66FF   02B1
        CMPI    #$000A, R5                      ; 6700   037D 000A
        BMI     L_673E                          ; 6702   020B 003A

        CMPI    #$000E, R5                      ; 6704   037D 000E
        BGT     L_673E                          ; 6706   020E 0036

        MVII    #$00A0, R4                      ; 6708   02BC 00A0
        B       L_6490                          ; 670A   0220 027B

        MVII    #$02F8, R2                      ; 670C   02BA 02F8
        ADDR    R3,     R2                      ; 670E   00DA
        MVI@    R2,     R0                      ; 670F   0290
        SLL     R0,     1                       ; 6710   0048
        CLRC                                    ; 6711   0006
        RRC     R0,     1                       ; 6712   0070
        MVO@    R0,     R2                      ; 6713   0250
        B       L_673E                          ; 6714   0200 0028

        JSR     R5,     L_67B2                  ; 6716   0004 0164 03B2

        CMPI    #$0038, R0                      ; 6719   0378 0038
        BMI     L_648E                          ; 671B   022B 028E
        B       L_64A4                          ; 671D   0220 027A

        MVII    #$010F, R2                      ; 671F   02BA 010F
        ADDR    R3,     R2                      ; 6721   00DA
        ADDR    R3,     R2                      ; 6722   00DA
        MVI@    R2,     R2                      ; 6723   0292
        ADDI    #$0214, R2                      ; 6724   02FA 0214
        MVI@    R2,     R0                      ; 6726   0290

        JSR     R5,     L_67F4                  ; 6727   0004 0164 03F4

        BNC     L_673E                          ; 672A   0209 0012

        ADDI    #$0080, R1                      ; 672C   02F9 0080
        B       L_673E                          ; 672E   0200 000E

        MVII    #$0001, R0                      ; 6730   02B8 0001

        JSR     R5,     X_RAND1                 ; 6732   0004 0114 027D

        TSTR    R0                              ; 6735   0080
        BEQ     L_673E                          ; 6736   0204 0006

        ADDI    #$0080, R1                      ; 6738   02F9 0080
        B       L_673E                          ; 673A   0200 0002

L_673C:
        PULR    R3                              ; 673C   02B3
        PULR    R1                              ; 673D   02B1
L_673E:
        ADDI    #$0308, R3                      ; 673E   02FB 0308
        MVO@    R1,     R3                      ; 6740   0259
L_6741:
        PULR    R3                              ; 6741   02B3
        INCR    R3                              ; 6742   000B
        CMPI    #$0008, R3                      ; 6743   037B 0008
        BMI     L_6379                          ; 6745   022B 03CD
L_6747:
        PULR    R7                              ; 6747   02B7

L_6748:
        PSHR    R5                              ; 6748   0275
        MVI     G_0137, R2                      ; 6749   0282 0137
        CMPI    #$00F0, R2                      ; 674B   037A 00F0
        BGE     L_6747                          ; 674D   022D 0007

        PSHR    R1                              ; 674F   0271
        PSHR    R3                              ; 6750   0273
        ADDI    #$0200, R2                      ; 6751   02FA 0200

        JSR     R5,     L_68C7                  ; 6753   0004 0168 00C7

        SLL     R0,     2                       ; 6756   004C
        SLL     R0,     1                       ; 6757   0048
        NOP                                     ; 6758   0034
        SLL     R1,     2                       ; 6759   004D
        SLL     R1,     1                       ; 675A   0049

        JSR     R5,     L_616C                  ; 675B   0004 0160 016C

        MVI     G_0137, R2                      ; 675E   0282 0137
        ADDI    #$0200, R2                      ; 6760   02FA 0200
        MVI@    R2,     R0                      ; 6762   0290
        ANDI    #$01F8, R0                      ; 6763   03B8 01F8
        XOR@    R2,     R0                      ; 6765   03D0
        MVII    #$00E0, R1                      ; 6766   02B9 00E0
        CMPI    #$000C, R5                      ; 6768   037D 000C
        BMI     L_6778                          ; 676A   020B 000C

        CMPI    #$000F, R5                      ; 676C   037D 000F
        BEQ     L_6778                          ; 676E   0204 0008

        MVII    #$00D0, R1                      ; 6770   02B9 00D0
        CMPI    #$000E, R5                      ; 6772   037D 000E
        BEQ     L_6778                          ; 6774   0204 0002

        MVII    #$00D8, R1                      ; 6776   02B9 00D8
L_6778:
        XORR    R1,     R0                      ; 6778   01C8
        MVO@    R0,     R2                      ; 6779   0250
        PULR    R3                              ; 677A   02B3
        PULR    R1                              ; 677B   02B1
        PULR    R7                              ; 677C   02B7

L_677D:
        PSHR    R5                              ; 677D   0275
        MVI     G_0138, R2                      ; 677E   0282 0138
        CMPI    #$00F0, R2                      ; 6780   037A 00F0
        BGE     L_6747                          ; 6782   022D 003C

        PSHR    R1                              ; 6784   0271
        PSHR    R3                              ; 6785   0273
        ADDI    #$0200, R2                      ; 6786   02FA 0200

        JSR     R5,     L_68C7                  ; 6788   0004 0168 00C7

        SLL     R0,     2                       ; 678B   004C
        SLL     R0,     1                       ; 678C   0048
        NOP                                     ; 678D   0034
        SLL     R1,     2                       ; 678E   004D
        SLL     R1,     1                       ; 678F   0049

        JSR     R5,     L_616C                  ; 6790   0004 0160 016C

        MVI     G_0138, R2                      ; 6793   0282 0138
        ADDI    #$0200, R2                      ; 6795   02FA 0200
        MVI@    R2,     R0                      ; 6797   0290
        ANDI    #$01F8, R0                      ; 6798   03B8 01F8
        XOR@    R2,     R0                      ; 679A   03D0
        MVII    #$0088, R1                      ; 679B   02B9 0088
        CMPI    #$0009, R5                      ; 679D   037D 0009
        BLE     L_67AD                          ; 679F   0206 000C

        CMPI    #$000D, R5                      ; 67A1   037D 000D
        BGE     L_67AD                          ; 67A3   020D 0008

        MVII    #$0070, R1                      ; 67A5   02B9 0070
        CMPI    #$000A, R5                      ; 67A7   037D 000A
        BEQ     L_67AD                          ; 67A9   0204 0002

        MVII    #$0090, R1                      ; 67AB   02B9 0090
L_67AD:
        XORR    R1,     R0                      ; 67AD   01C8
        MVO@    R0,     R2                      ; 67AE   0250
        PULR    R3                              ; 67AF   02B3
        PULR    R1                              ; 67B0   02B1
        PULR    R7                              ; 67B1   02B7

L_67B2:
        MVII    #$02F0, R2                      ; 67B2   02BA 02F0
        ADDR    R3,     R2                      ; 67B4   00DA
        MVI@    R2,     R0                      ; 67B5   0290
        ANDI    #$00FF, R0                      ; 67B6   03B8 00FF
        SUB     G_0161, R0                      ; 67B8   0300 0161
        BGE     L_67BD                          ; 67BA   020D 0001

        NEGR    R0                              ; 67BC   0020
L_67BD:
        ADDI    #$0008, R2                      ; 67BD   02FA 0008
        MVI@    R2,     R2                      ; 67BF   0292
        ANDI    #$007F, R2                      ; 67C0   03BA 007F
        SUB     G_0162, R2                      ; 67C2   0302 0162
        BGE     L_67C7                          ; 67C4   020D 0001

        NEGR    R2                              ; 67C6   0022
L_67C7:
        CMPR    R0,     R2                      ; 67C7   0142
        BLE     L_67CD                          ; 67C8   0206 0003

        XORR    R0,     R2                      ; 67CA   01C2
        XORR    R2,     R0                      ; 67CB   01D0
        XORR    R0,     R2                      ; 67CC   01C2
L_67CD:
        SLR     R2,     2                       ; 67CD   0066
        ADDR    R2,     R0                      ; 67CE   00D0
        MOVR    R5,     R7                      ; 67CF   00AF

L_67D0:
        MVII    #$02F0, R2                      ; 67D0   02BA 02F0
        ADDR    R3,     R2                      ; 67D2   00DA
        MVI@    R2,     R0                      ; 67D3   0290
        ANDI    #$00FF, R0                      ; 67D4   03B8 00FF
        ADDI    #$0008, R2                      ; 67D6   02FA 0008
        MVI@    R2,     R1                      ; 67D8   0291
        ANDI    #$007F, R1                      ; 67D9   03B9 007F
        MOVR    R5,     R7                      ; 67DB   00AF

L_67DC:
        MVII    #$02F0, R2                      ; 67DC   02BA 02F0
        ADDR    R3,     R2                      ; 67DE   00DA
        MVI@    R2,     R0                      ; 67DF   0290
        ANDI    #$00FF, R0                      ; 67E0   03B8 00FF
        ADDI    #$0008, R2                      ; 67E2   02FA 0008
        MVI@    R2,     R2                      ; 67E4   0292
        ANDI    #$007F, R2                      ; 67E5   03BA 007F
        MOVR    R5,     R7                      ; 67E7   00AF

L_67E8:
        ANDI    #$000F, R5                      ; 67E8   03BD 000F
        MVII    #$010E, R2                      ; 67EA   02BA 010E
        ADDR    R3,     R2                      ; 67EC   00DA
        ADDR    R3,     R2                      ; 67ED   00DA
        MVI@    R2,     R0                      ; 67EE   0290
        ANDI    #$00F0, R0                      ; 67EF   03B8 00F0
        ADDR    R5,     R0                      ; 67F1   00E8
        MVO@    R0,     R2                      ; 67F2   0250
        MOVR    R4,     R7                      ; 67F3   00A7

L_67F4:
        SLL     R0,     1                       ; 67F4   0048
        RLC     R0,     1                       ; 67F5   0050
        BC      L_6806                          ; 67F6   0201 000E

        SLR     R0,     2                       ; 67F8   0064
        SDBD                                    ; 67F9   0001
        ANDI    #$1007, R0                      ; 67FA   03B8 0007 0010
        BEQ     L_6805                          ; 67FD   0204 0006

        CMPI    #$0001, R0                      ; 67FF   0378 0001
        BEQ     L_6805                          ; 6801   0204 0002

        CLRC                                    ; 6803   0006
        MOVR    R5,     R7                      ; 6804   00AF

L_6805:
        SETC                                    ; 6805   0007
L_6806:
        MOVR    R5,     R7                      ; 6806   00AF

L_6807:
        CLRR    R0                              ; 6807   01C0
        PSHR    R5                              ; 6808   0275
        MVII    #$0200, R5                      ; 6809   02BD 0200
L_680B:
        MVO@    R0,     R5                      ; 680B   0268
        MVO@    R0,     R5                      ; 680C   0268
        CMPI    #$02F0, R5                      ; 680D   037D 02F0
        BMI     L_680B                          ; 680F   022B 0005
        PULR    R7                              ; 6811   02B7

        PSHR    R5                              ; 6812   0275
        MVII    #$000C, R0                      ; 6813   02B8 000C
L_6815:
        PSHR    R0                              ; 6815   0270

        JSR     R5,     L_68B2                  ; 6816   0004 0168 00B2

        MVII    #$0113, R3                      ; 6819   02BB 0113
        MVII    #$02FA, R4                      ; 681B   02BC 02FA
        MOVR    R4,     R5                      ; 681D   00A5
L_681E:
        MVI@    R4,     R0                      ; 681E   02A0
        TSTR    R0                              ; 681F   0080
        BEQ     L_6828                          ; 6820   0204 0006

        ADDI    #$0008, R0                      ; 6822   02F8 0008
        MVI@    R3,     R2                      ; 6824   029A
        ADDI    #$0014, R2                      ; 6825   02FA 0014
        MVO@    R2,     R3                      ; 6827   025A
L_6828:
        MVO@    R0,     R5                      ; 6828   0268
        ADDI    #$0002, R3                      ; 6829   02FB 0002
        CMPI    #$0300, R4                      ; 682B   037C 0300
        BMI     L_681E                          ; 682D   022B 0010

        JSR     R5,     L_55C3                  ; 682F   0004 0154 01C3
        JSR     R5,     L_5381                  ; 6832   0004 0150 0381
        JSR     R5,     L_556B                  ; 6835   0004 0154 016B
        DECLE   $0004                           ; 6838   0004

        ANDR    R4,     R4                      ; 6839   01A4
        SUBR    R1,     R0                      ; 683A   0108
        PULR    R0                              ; 683B   02B0
        DECR    R0                              ; 683C   0010
        BNEQ    L_6815                          ; 683D   022C 0029
        PULR    R7                              ; 683F   02B7

L_6840:
        CLRR    R0                              ; 6840   01C0
L_6841:
        MVO@    R0,     R4                      ; 6841   0260
        MVO@    R0,     R4                      ; 6842   0260
        MVO@    R0,     R4                      ; 6843   0260
        MVO@    R0,     R4                      ; 6844   0260
        MVO@    R0,     R4                      ; 6845   0260
        MVO@    R0,     R4                      ; 6846   0260
        MVO@    R0,     R4                      ; 6847   0260
        MVO@    R0,     R4                      ; 6848   0260
        MOVR    R5,     R7                      ; 6849   00AF

L_684A:
        MVI@    R5,     R0                      ; 684A   02A8
        MVO@    R0,     R1                      ; 684B   0248
L_684C:
        MVI@    R5,     R1                      ; 684C   02A9
        TSTR    R1                              ; 684D   0089
        BNEQ    L_684A                          ; 684E   022C 0005
        MOVR    R5,     R7                      ; 6850   00AF

L_6851:
        SDBD                                    ; 6851   0001
        MVI@    R5,     R0                      ; 6852   02A8
        MVO@    R0,     R1                      ; 6853   0248
L_6854:
        MVI@    R5,     R1                      ; 6854   02A9
        TSTR    R1                              ; 6855   0089
        BNEQ    L_6851                          ; 6856   022C 0006
        MOVR    R5,     R7                      ; 6858   00AF

L_6859:
        SDBD                                    ; 6859   0001
        MVI@    R5,     R4                      ; 685A   02AC
        SDBD                                    ; 685B   0001
        MVI@    R5,     R0                      ; 685C   02A8
        MVI@    R5,     R1                      ; 685D   02A9
        PSHR    R5                              ; 685E   0275
        MOVR    R0,     R5                      ; 685F   0085
L_6860:
        MVI@    R4,     R0                      ; 6860   02A0
        MVO@    R0,     R5                      ; 6861   0268
        MVI@    R4,     R0                      ; 6862   02A0
        MVO@    R0,     R5                      ; 6863   0268
        MVI@    R4,     R0                      ; 6864   02A0
        MVO@    R0,     R5                      ; 6865   0268
        MVI@    R4,     R0                      ; 6866   02A0
        MVO@    R0,     R5                      ; 6867   0268
        MVI@    R4,     R0                      ; 6868   02A0
        MVO@    R0,     R5                      ; 6869   0268
        MVI@    R4,     R0                      ; 686A   02A0
        MVO@    R0,     R5                      ; 686B   0268
        MVI@    R4,     R0                      ; 686C   02A0
        MVO@    R0,     R5                      ; 686D   0268
        MVI@    R4,     R0                      ; 686E   02A0
        MVO@    R0,     R5                      ; 686F   0268
        DECR    R1                              ; 6870   0011
        BGT     L_6860                          ; 6871   022E 0012
        PULR    R7                              ; 6873   02B7

        DECLE   $0080,  $0040,  $0020,  $0010   ; 6874   0080 0040 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0001   ; 6878   0008 0004 0002 0001
L_687C:
        PSHR    R5                              ; 687C   0275
        MOVR    R0,     R5                      ; 687D   0085
        ANDI    #$0007, R5                      ; 687E   03BD 0007
        SDBD                                    ; 6880   0001
        ADDI    #$6874, R5                      ; 6881   02FD 0074 0068
        MVI@    R5,     R5                      ; 6884   02AD
        PULR    R7                              ; 6885   02B7

        DECLE   $0001,  $0000,  $0002,  $0000   ; 6886   0001 0000 0002 0000
        DECLE   $0004,  $0000,  $0008,  $0000   ; 688A   0004 0000 0008 0000
        DECLE   $0010,  $0000,  $0020,  $0000   ; 688E   0010 0000 0020 0000
        DECLE   $0040,  $0000,  $0080,  $0000   ; 6892   0040 0000 0080 0000
        DECLE   $0000,  $0001,  $0000,  $0002   ; 6896   0000 0001 0000 0002
        DECLE   $0000,  $0004,  $0000,  $0008   ; 689A   0000 0004 0000 0008
        DECLE   $0000,  $0010,  $0000,  $0020   ; 689E   0000 0010 0000 0020
        DECLE   $0000,  $0040,  $0000           ; 68A2   0000 0040 0000

        TSTR    R0                              ; 68A5   0080
L_68A6:
        PSHR    R5                              ; 68A6   0275
        MOVR    R0,     R5                      ; 68A7   0085
        ANDI    #$000F, R5                      ; 68A8   03BD 000F
        ADDR    R5,     R5                      ; 68AA   00ED
        SDBD                                    ; 68AB   0001
        ADDI    #$6886, R5                      ; 68AC   02FD 0086 0068
        SDBD                                    ; 68AF   0001
        MVI@    R5,     R0                      ; 68B0   02A8
        PULR    R7                              ; 68B1   02B7

L_68B2:
        PSHR    R5                              ; 68B2   0275
        MVI     .ISRVEC.0,R1                    ; 68B3   0281 0100
        MVI     .ISRVEC.1,R2                    ; 68B5   0282 0101
        MOVR    R7,     R0                      ; 68B7   00B8
        ADDI    #$0008, R0                      ; 68B8   02F8 0008
        MVO     R0,     .ISRVEC.0               ; 68BA   0240 0100
        SWAP    R0,     1                       ; 68BC   0040
        MVO     R0,     .ISRVEC.1               ; 68BD   0240 0101
L_68BF:
        DECR    R7                              ; 68BF   0017

        SUBI    #$0008, R6                      ; 68C0   033E 0008
        MVO     R1,     .ISRVEC.0               ; 68C2   0241 0100
        MVO     R2,     .ISRVEC.1               ; 68C4   0242 0101
        PULR    R7                              ; 68C6   02B7

L_68C7:
        MOVR    R2,     R0                      ; 68C7   0090
        MVII    #$0006, R1                      ; 68C8   02B9 0006
        SUBI    #$0278, R0                      ; 68CA   0338 0278
        BGE     L_68D1                          ; 68CC   020D 0003

        CLRR    R1                              ; 68CE   01C9
        ADDI    #$0078, R0                      ; 68CF   02F8 0078
L_68D1:
        INCR    R1                              ; 68D1   0009
        SUBI    #$0014, R0                      ; 68D2   0338 0014
        BGE     L_68D1                          ; 68D4   022D 0004

        DECR    R1                              ; 68D6   0011
        ADDI    #$0014, R0                      ; 68D7   02F8 0014
        MOVR    R5,     R7                      ; 68D9   00AF

L_68DA:
        MVI@    R5,     R1                      ; 68DA   02A9
        PSHR    R5                              ; 68DB   0275
        MVI@    R1,     R0                      ; 68DC   0288
        CMPI    #$02F0, R1                      ; 68DD   0379 02F0
        BGE     L_68E2                          ; 68DF   020D 0001

        SWAP    R0,     2                       ; 68E1   0044
L_68E2:
        COMR    R0                              ; 68E2   0018
        BEQ     L_6939                          ; 68E3   0204 0054

        CLRR    R4                              ; 68E5   01E4
        DECR    R4                              ; 68E6   0014
        MVII    #$0001, R5                      ; 68E7   02BD 0001
        INCR    R7                              ; 68E9   000F

L_68EA:
        ADDR    R5,     R5                      ; 68EA   00ED
L_68EB:
        INCR    R4                              ; 68EB   000C
        RRC     R0,     1                       ; 68EC   0070
        BNC     L_68EA                          ; 68ED   0229 0004

        XOR@    R1,     R5                      ; 68EF   03CD
        MVO@    R5,     R1                      ; 68F0   024D
        CLRC                                    ; 68F1   0006
        PULR    R7                              ; 68F2   02B7

L_68F3:
        MVI@    R5,     R1                      ; 68F3   02A9
        PSHR    R5                              ; 68F4   0275
        PSHR    R0                              ; 68F5   0270
        MOVR    R4,     R0                      ; 68F6   00A0

        JSR     R5,     L_68A6                  ; 68F7   0004 0168 00A6

        MOVR    R0,     R5                      ; 68FA   0085
        PULR    R0                              ; 68FB   02B0
        AND@    R1,     R5                      ; 68FC   038D
        BEQ     L_6939                          ; 68FD   0204 003A

        XOR@    R1,     R5                      ; 68FF   03CD
        MVO@    R5,     R1                      ; 6900   024D
        CLRC                                    ; 6901   0006
        PULR    R7                              ; 6902   02B7

L_6903:
        PSHR    R5                              ; 6903   0275
        PSHR    R0                              ; 6904   0270
        MVI     G_0311, R0                      ; 6905   0280 0311
        COMR    R0                              ; 6907   0018
        BNEQ    L_690D                          ; 6908   020C 0003

        PULR    R0                              ; 690A   02B0
        SETC                                    ; 690B   0007
        PULR    R7                              ; 690C   02B7

L_690D:
        MVII    #$00F8, R3                      ; 690D   02BB 00F8
        MVII    #$0001, R5                      ; 690F   02BD 0001
        INCR    R7                              ; 6911   000F

L_6912:
        ADDR    R5,     R5                      ; 6912   00ED
L_6913:
        ADDI    #$0008, R3                      ; 6913   02FB 0008
        RRC     R0,     1                       ; 6915   0070
        BNC     L_6912                          ; 6916   0229 0005

        XOR     G_0311, R5                      ; 6918   03C5 0311
        MVO     R5,     G_0311                  ; 691A   0245 0311
        PULR    R0                              ; 691C   02B0
L_691D:
        PULR    R7                              ; 691D   02B7

L_691E:
        PSHR    R5                              ; 691E   0275
        PSHR    R1                              ; 691F   0271
        ANDI    #$00F8, R0                      ; 6920   03B8 00F8
        PSHR    R3                              ; 6922   0273
        MVI     G_0310, R1                      ; 6923   0281 0310
        SLL     R1,     2                       ; 6925   004D
        SLR     R1,     2                       ; 6926   0065
        MVII    #$017F, R3                      ; 6927   02BB 017F
L_6929:
        TSTR    R1                              ; 6929   0089
        BEQ     L_693B                          ; 692A   0204 000F

        ADDI    #$0008, R3                      ; 692C   02FB 0008
        RRC     R1,     1                       ; 692E   0071
        BNC     L_6929                          ; 692F   0229 0007

        MVI@    R3,     R5                      ; 6931   029D
        ANDI    #$00F8, R5                      ; 6932   03BD 00F8
        CMPR    R0,     R5                      ; 6934   0145
        BNEQ    L_6929                          ; 6935   022C 000D

        PULR    R3                              ; 6937   02B3
        PULR    R1                              ; 6938   02B1
L_6939:
        SETC                                    ; 6939   0007
        PULR    R7                              ; 693A   02B7

L_693B:
        SLR     R0,     2                       ; 693B   0064
        SLR     R0,     1                       ; 693C   0060

        JSR     R5,     L_68A6                  ; 693D   0004 0168 00A6

        COMR    R0                              ; 6940   0018
        AND     G_0311, R0                      ; 6941   0380 0311
        MVO     R0,     G_0311                  ; 6943   0240 0311
        PULR    R3                              ; 6945   02B3
        PULR    R1                              ; 6946   02B1
        CLRC                                    ; 6947   0006
        PULR    R7                              ; 6948   02B7

L_6949:
        PSHR    R5                              ; 6949   0275
        PSHR    R0                              ; 694A   0270
        CLRR    R0                              ; 694B   01C0
        PSHR    R1                              ; 694C   0271
        PSHR    R3                              ; 694D   0273
        MVI     G_0310, R1                      ; 694E   0281 0310
        SLL     R1,     2                       ; 6950   004D
        SLR     R1,     2                       ; 6951   0065
        MVII    #$017C, R3                      ; 6952   02BB 017C
        ANDI    #$00FF, R2                      ; 6954   03BA 00FF
L_6956:
        TSTR    R1                              ; 6956   0089
        BEQ     L_696D                          ; 6957   0204 0014

L_6959:
        ADDI    #$0008, R3                      ; 6959   02FB 0008
        RRC     R1,     1                       ; 695B   0071
        BNC     L_6959                          ; 695C   0229 0004

        CMP@    R3,     R2                      ; 695E   035A
        BNEQ    L_6956                          ; 695F   022C 000A

        INCR    R0                              ; 6961   0008
        PSHR    R3                              ; 6962   0273
        SUBI    #$0004, R3                      ; 6963   033B 0004
        CMP     G_0312, R3                      ; 6965   0343 0312
        PULR    R3                              ; 6967   02B3
        BEQ     L_6956                          ; 6968   0224 0013

        MOVR    R3,     R5                      ; 696A   009D
        B       L_6956                          ; 696B   0220 0016

L_696D:
        SUBI    #$0004, R5                      ; 696D   033D 0004
        ADDI    #$0200, R2                      ; 696F   02FA 0200
        PULR    R3                              ; 6971   02B3
        PULR    R1                              ; 6972   02B1
        DECR    R0                              ; 6973   0010
        PULR    R0                              ; 6974   02B0
        PULR    R7                              ; 6975   02B7

L_6976:
        PSHR    R5                              ; 6976   0275
        PSHR    R3                              ; 6977   0273
        MVI     G_011F, R3                      ; 6978   0283 011F
        SLR     R3,     1                       ; 697A   0063
        MOVR    R3,     R5                      ; 697B   009D
        ADD     G_011E, R3                      ; 697C   02C3 011E
        CMPI    #$0008, R3                      ; 697E   037B 0008
        PULR    R3                              ; 6980   02B3
        SETC                                    ; 6981   0007
        BGE     L_691D                          ; 6982   022D 0066

        ADDR    R5,     R5                      ; 6984   00ED
        NEGR    R5                              ; 6985   0025
        ADDI    #$012E, R5                      ; 6986   02FD 012E
        MVO@    R0,     R5                      ; 6988   0268
        SLR     R1,     1                       ; 6989   0061
        MVO@    R1,     R5                      ; 698A   0269
        MVI     G_011F, R5                      ; 698B   0285 011F
        ADDI    #$0002, R5                      ; 698D   02FD 0002
        MVO     R5,     G_011F                  ; 698F   0245 011F
        CLRC                                    ; 6991   0006
        PULR    R7                              ; 6992   02B7

L_6993:
        PSHR    R5                              ; 6993   0275
        MVII    #$0120, R5                      ; 6994   02BD 0120
        ADD     G_011E, R5                      ; 6996   02C5 011E
        ADD     G_011E, R5                      ; 6998   02C5 011E
        MVO@    R4,     R5                      ; 699A   026C
        MVO@    R3,     R5                      ; 699B   026B
        MVI     G_011E, R5                      ; 699C   0285 011E
        INCR    R5                              ; 699E   000D
        MVO     R5,     G_011E                  ; 699F   0245 011E
        PULR    R7                              ; 69A1   02B7

L_69A2:
        PSHR    R5                              ; 69A2   0275
        MVI     G_0312, R5                      ; 69A3   0285 0312
        MVI@    R5,     R0                      ; 69A5   02A8
        ADDI    #$0006, R5                      ; 69A6   02FD 0006
        MVI@    R5,     R1                      ; 69A8   02A9

        JSR     R5,     L_687C                  ; 69A9   0004 0168 007C

        MOVR    R5,     R0                      ; 69AC   00A8
        ADDR    R0,     R0                      ; 69AD   00C0
        ADDR    R5,     R0                      ; 69AE   00E8
        MOVR    R1,     R5                      ; 69AF   008D
        ANDI    #$0007, R5                      ; 69B0   03BD 0007
        CMPI    #$0007, R5                      ; 69B2   037D 0007
        BEQ     L_69BA                          ; 69B4   0204 0004

        JSR     R5,     L_69CA                  ; 69B6   0004 0168 01CA

        PULR    R7                              ; 69B9   02B7

L_69BA:
        JSR     R5,     L_69F8                  ; 69BA   0004 0168 01F8

        PULR    R7                              ; 69BD   02B7

L_69BE:
        MVI     G_010D, R1                      ; 69BE   0281 010D
        ANDI    #$0007, R1                      ; 69C0   03B9 0007
        CMPI    #$0007, R1                      ; 69C2   0379 0007
        BEQ     L_69F4                          ; 69C4   0204 002E

        MVI     G_010C, R0                      ; 69C6   0280 010C
        MVI     G_010D, R1                      ; 69C8   0281 010D
L_69CA:
        SDBD                                    ; 69CA   0001
        ADDI    #$3900, R1                      ; 69CB   02F9 0000 0039
        PSHR    R5                              ; 69CE   0275
        MVII    #$0168, R5                      ; 69CF   02BD 0168
        ADD     G_0167, R5                      ; 69D1   02C5 0167
        MVO@    R0,     R5                      ; 69D3   0268
        MVO@    R0,     R5                      ; 69D4   0268
        MVII    #$0313, R5                      ; 69D5   02BD 0313
        ADD     G_0167, R5                      ; 69D7   02C5 0167
        MVO@    R1,     R5                      ; 69D9   0269
        INCR    R1                              ; 69DA   0009
        MVO@    R1,     R5                      ; 69DB   0269
        MVI     G_0167, R5                      ; 69DC   0285 0167
        ADDI    #$0002, R5                      ; 69DE   02FD 0002
        MVO     R5,     G_0167                  ; 69E0   0245 0167
        PULR    R7                              ; 69E2   02B7

L_69E3:
        PSHR    R5                              ; 69E3   0275
        MVI     G_0312, R5                      ; 69E4   0285 0312
        ADDI    #$0002, R5                      ; 69E6   02FD 0002
        MVI@    R5,     R0                      ; 69E8   02A8
        ADDI    #$0004, R5                      ; 69E9   02FD 0004
        MVI@    R5,     R1                      ; 69EB   02A9

        JSR     R5,     L_687C                  ; 69EC   0004 0168 007C

        MOVR    R5,     R0                      ; 69EF   00A8

        JSR     R5,     L_69F8                  ; 69F0   0004 0168 01F8

        PULR    R7                              ; 69F3   02B7

L_69F4:
        MVI     G_010C, R0                      ; 69F4   0280 010C
        MVI     G_010D, R1                      ; 69F6   0281 010D
L_69F8:
        SDBD                                    ; 69F8   0001
        ADDI    #$3900, R1                      ; 69F9   02F9 0000 0039
        PSHR    R5                              ; 69FC   0275
        MVII    #$0168, R5                      ; 69FD   02BD 0168
        ADD     G_0167, R5                      ; 69FF   02C5 0167
        MVO@    R0,     R5                      ; 6A01   0268
        MVII    #$0313, R5                      ; 6A02   02BD 0313
        ADD     G_0167, R5                      ; 6A04   02C5 0167
        MVO@    R1,     R5                      ; 6A06   0269
        MVI     G_0167, R5                      ; 6A07   0285 0167
        INCR    R5                              ; 6A09   000D
        MVO     R5,     G_0167                  ; 6A0A   0245 0167
        PULR    R7                              ; 6A0C   02B7

L_6A0D:
        MVI     G_010C, R0                      ; 6A0D   0280 010C
        MVI     G_010D, R1                      ; 6A0F   0281 010D
        SDBD                                    ; 6A11   0001
        ADDI    #$3900, R1                      ; 6A12   02F9 0000 0039
        PSHR    R5                              ; 6A15   0275
        MVII    #$0168, R5                      ; 6A16   02BD 0168
        ADD     G_0167, R5                      ; 6A18   02C5 0167
        MVO@    R0,     R5                      ; 6A1A   0268
        MVO@    R0,     R5                      ; 6A1B   0268
        MVII    #$0313, R5                      ; 6A1C   02BD 0313
        ADD     G_0167, R5                      ; 6A1E   02C5 0167
        MVO@    R1,     R5                      ; 6A20   0269
        INCR    R1                              ; 6A21   0009
        MVO@    R1,     R5                      ; 6A22   0269
        MVI     G_0167, R5                      ; 6A23   0285 0167
        ADDI    #$0002, R5                      ; 6A25   02FD 0002
        MVO     R5,     G_0167                  ; 6A27   0245 0167
        PULR    R7                              ; 6A29   02B7

L_6A2A:
        PSHR    R5                              ; 6A2A   0275
        MVI     .PSG0.rgt_hand,R0               ; 6A2B   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6A2D   0380 01FF

        JSR     R5,     L_6A33                  ; 6A2F   0004 0168 0233

        PULR    R7                              ; 6A32   02B7

L_6A33:
        CMPI    #$005A, R0                      ; 6A33   0378 005A
        BEQ     L_6A38                          ; 6A35   0204 0001
        MOVR    R5,     R7                      ; 6A37   00AF

L_6A38:
        MVII    #$0003, R3                      ; 6A38   02BB 0003

L_6A3A:
        JSR     R5,     L_68B2                  ; 6A3A   0004 0168 00B2

        CLRR    R0                              ; 6A3D   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 6A3E   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 6A40   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 6A42   0240 01FD
        MVO     R0,     .STIC.BORD              ; 6A44   0240 002C
        MVI     .PSG0.rgt_hand,R0               ; 6A46   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6A48   0380 01FF
        CMPI    #$00FF, R0                      ; 6A4A   0378 00FF
        BNEQ    L_6A38                          ; 6A4C   022C 0015

        DECR    R3                              ; 6A4E   0013
        BNEQ    L_6A3A                          ; 6A4F   022C 0016

L_6A51:
        JSR     R5,     L_68B2                  ; 6A51   0004 0168 00B2

        MVI     .PSG0.rgt_hand,R0               ; 6A54   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6A56   0380 01FF
        CMPI    #$00FF, R0                      ; 6A58   0378 00FF
        BEQ     L_6A51                          ; 6A5A   0224 000A

        MVI     G_015F, R0                      ; 6A5C   0280 015F
        MVO     R0,     .STIC.BORD              ; 6A5E   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 6A60   0240 0020
        PULR    R7                              ; 6A62   02B7

L_6A63:
        PSHR    R5                              ; 6A63   0275
        MVI     G_015E, R0                      ; 6A64   0280 015E
        ANDI    #$0040, R0                      ; 6A66   03B8 0040
        BNEQ    L_6BFA                          ; 6A68   020C 0190

        MVI     G_010A, R0                      ; 6A6A   0280 010A
        ANDI    #$0004, R0                      ; 6A6C   03B8 0004
        BEQ     L_6BFA                          ; 6A6E   0204 018A

        MVI     G_02F0, R0                      ; 6A70   0280 02F0
        SDBD                                    ; 6A72   0001
        ADDI    #$1000, R0                      ; 6A73   02F8 0000 0010
        MVO     R0,     G_02F0                  ; 6A76   0240 02F0
        MVI     G_010B, R2                      ; 6A78   0282 010B
        ANDI    #$000F, R2                      ; 6A7A   03BA 000F
        MVI     G_010E, R0                      ; 6A7C   0280 010E
        ANDI    #$00F0, R0                      ; 6A7E   03B8 00F0
        ADDR    R2,     R0                      ; 6A80   00D0
        MVO     R0,     G_010E                  ; 6A81   0240 010E
        MVI     G_0160, R3                      ; 6A83   0283 0160
        ANDI    #$0001, R3                      ; 6A85   03BB 0001
        INCR    R3                              ; 6A87   000B

        JSR     R5,     L_611F                  ; 6A88   0004 0160 011F

        PSHR    R0                              ; 6A8B   0270
        PSHR    R1                              ; 6A8C   0271
        MVI     G_02F0, R5                      ; 6A8D   0285 02F0
        ANDI    #$00FF, R5                      ; 6A8F   03BD 00FF
        ADDR    R5,     R0                      ; 6A91   00E8
        MVI     G_02F8, R5                      ; 6A92   0285 02F8
        ANDI    #$007F, R5                      ; 6A94   03BD 007F
        ADDR    R5,     R1                      ; 6A96   00E9

        JSR     R5,     L_619E                  ; 6A97   0004 0160 019E

        PULR    R1                              ; 6A9A   02B1
        PULR    R0                              ; 6A9B   02B0
        MOVR    R2,     R5                      ; 6A9C   0095
        MVI@    R2,     R2                      ; 6A9D   0292
        RLC     R2,     2                       ; 6A9E   0056
        BOV     L_6BFA                          ; 6A9F   0202 0159

        MVO     R5,     G_010F                  ; 6AA1   0245 010F
        MOVR    R5,     R2                      ; 6AA3   00AA
        MVI@    R2,     R5                      ; 6AA4   0295
        SDBD                                    ; 6AA5   0001
        ANDI    #$1007, R5                      ; 6AA6   03BD 0007 0010
        BEQ     L_6AAF                          ; 6AA9   0204 0004

        CMPI    #$0001, R5                      ; 6AAB   037D 0001
        BNEQ    L_6AB9                          ; 6AAD   020C 000A

L_6AAF:
        PSHR    R0                              ; 6AAF   0270
        PSHR    R1                              ; 6AB0   0271
        CLRR    R4                              ; 6AB1   01E4

        JSR     R5,     L_5C24                  ; 6AB2   0004 015C 0024

        PULR    R1                              ; 6AB5   02B1
        PULR    R0                              ; 6AB6   02B0
        B       L_6AEB                          ; 6AB7   0200 0032

L_6AB9:
        SDBD                                    ; 6AB9   0001
        CMPI    #$1005, R5                      ; 6ABA   037D 0005 0010
        BNEQ    L_6AEB                          ; 6ABD   020C 002C

        MVI@    R2,     R5                      ; 6ABF   0295
        ANDI    #$01F8, R5                      ; 6AC0   03BD 01F8
        CMPI    #$0100, R5                      ; 6AC2   037D 0100
        BGE     L_6AEB                          ; 6AC4   020D 0025

        PSHR    R0                              ; 6AC6   0270
        MVII    #$0007, R0                      ; 6AC7   02B8 0007
        MVO@    R0,     R2                      ; 6AC9   0250
        MVII    #$0001, R0                      ; 6ACA   02B8 0001
        CMPI    #$00E8, R5                      ; 6ACC   037D 00E8
        BEQ     L_6AD8                          ; 6ACE   0204 0008

        MVII    #$0003, R0                      ; 6AD0   02B8 0003
        CMPI    #$00F0, R5                      ; 6AD2   037D 00F0
        BEQ     L_6AD8                          ; 6AD4   0204 0002

        MVII    #$0005, R0                      ; 6AD6   02B8 0005
L_6AD8:
        MVII    #$0140, R5                      ; 6AD8   02BD 0140
        ADD     G_015D, R5                      ; 6ADA   02C5 015D
        ADD@    R5,     R0                      ; 6ADC   02E8
        DECR    R5                              ; 6ADD   0015
        MVO@    R0,     R5                      ; 6ADE   0268
        MVII    #$0010, R0                      ; 6ADF   02B8 0010

        JSR     R5,     L_6C1B                  ; 6AE1   0004 016C 001B

        PSHR    R1                              ; 6AE4   0271

        JSR     R5,     L_6DBE                  ; 6AE5   0004 016C 01BE
        DECLE   $0009                           ; 6AE8   0009

        PULR    R1                              ; 6AE9   02B1
        PULR    R0                              ; 6AEA   02B0
L_6AEB:
        MVI     G_02F0, R2                      ; 6AEB   0282 02F0
        ANDI    #$00FF, R2                      ; 6AED   03BA 00FF
        TSTR    R0                              ; 6AEF   0080
        BEQ     L_6B07                          ; 6AF0   0204 0015
        BMI     L_6AFA                          ; 6AF2   020B 0006

        CMPI    #$00A0, R2                      ; 6AF4   037A 00A0
        BMI     L_6AFE                          ; 6AF6   020B 0006
        B       L_6B07                          ; 6AF8   0200 000D

L_6AFA:
        CMPI    #$0008, R2                      ; 6AFA   037A 0008
        BLE     L_6B07                          ; 6AFC   0206 0009

L_6AFE:
        MVI     G_02F0, R5                      ; 6AFE   0285 02F0
        ADDR    R0,     R5                      ; 6B00   00C5
        MVO     R5,     G_02F0                  ; 6B01   0245 02F0
        ADD     G_0161, R0                      ; 6B03   02C0 0161
        MVO     R0,     G_0161                  ; 6B05   0240 0161
L_6B07:
        MVI     G_02F8, R2                      ; 6B07   0282 02F8
        ANDI    #$007F, R2                      ; 6B09   03BA 007F
        TSTR    R1                              ; 6B0B   0089
        BEQ     L_6B33                          ; 6B0C   0204 0025
        BGT     L_6B26                          ; 6B0E   020E 0016

        CMPI    #$0046, R2                      ; 6B10   037A 0046
        BGT     L_6B2A                          ; 6B12   020E 0016

        CMPI    #$001E, R2                      ; 6B14   037A 001E
        BMI     L_6B33                          ; 6B16   020B 001B

        MVI     G_015E, R5                      ; 6B18   0285 015E
        ANDI    #$0010, R5                      ; 6B1A   03BD 0010
        BNEQ    L_6B2A                          ; 6B1C   020C 000C

        MVI     G_015E, R5                      ; 6B1E   0285 015E
        XORI    #$0002, R5                      ; 6B20   03FD 0002
        MVO     R5,     G_015E                  ; 6B22   0245 015E
        B       L_6B33                          ; 6B24   0200 000D

L_6B26:
        CMPI    #$005E, R2                      ; 6B26   037A 005E
        BGT     L_6B33                          ; 6B28   020E 0009

L_6B2A:
        MVI     G_02F8, R5                      ; 6B2A   0285 02F8
        ADDR    R1,     R5                      ; 6B2C   00CD
        MVO     R5,     G_02F8                  ; 6B2D   0245 02F8
        ADD     G_0162, R1                      ; 6B2F   02C1 0162
        MVO     R1,     G_0162                  ; 6B31   0241 0162
L_6B33:
        PULR    R7                              ; 6B33   02B7

        DECLE   $0001,  $0006,  $0002,  $0001   ; 6B34   0001 0006 0002 0001
        DECLE   $0004,  $0001,  $0001,  $0000   ; 6B38   0004 0001 0001 0000
        DECLE   $00FF,  $00FF,  $00FF,  $0006   ; 6B3C   00FF 00FF 00FF 0006
        DECLE   $00FF,  $00FF,  $000A,  $0007   ; 6B40   00FF 00FF 000A 0007
        DECLE   $00FF,  $0002,  $00FF,  $0003   ; 6B44   00FF 0002 00FF 0003
        DECLE   $000E,  $000F,  $000B,  $00FF   ; 6B48   000E 000F 000B 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0005   ; 6B4C   00FF 00FF 00FF 0005
        DECLE   $00FF,  $00FF,  $0009,  $0008   ; 6B50   00FF 00FF 0009 0008
        DECLE   $00FF,  $0001,  $00FF,  $0004   ; 6B54   00FF 0001 00FF 0004
        DECLE   $000D,  $0000,  $000C,  $00FF   ; 6B58   000D 0000 000C 00FF
L_6B5C:
        PSHR    R5                              ; 6B5C   0275
        MVI     G_0130, R2                      ; 6B5D   0282 0130
        MOVR    R2,     R1                      ; 6B5F   0091
        ANDI    #$0080, R1                      ; 6B60   03B9 0080
        ANDI    #$007F, R2                      ; 6B62   03BA 007F
        DECR    R2                              ; 6B64   0012
        BGE     L_6B69                          ; 6B65   020D 0002

        CLRR    R2                              ; 6B67   01D2
        CLRR    R1                              ; 6B68   01C9
L_6B69:
        XORR    R1,     R2                      ; 6B69   01CA
        MVO     R2,     G_0130                  ; 6B6A   0242 0130
        MVII    #$01FF, R5                      ; 6B6C   02BD 01FF
        SUB     G_015D, R5                      ; 6B6E   0305 015D
        MVI@    R5,     R0                      ; 6B70   02A8
        MVI     G_0108, R1                      ; 6B71   0281 0108
        MVO     R0,     G_0108                  ; 6B73   0240 0108
        MVO     R1,     G_0109                  ; 6B75   0241 0109
        MVI     G_010A, R3                      ; 6B77   0283 010A
        ANDI    #$0004, R3                      ; 6B79   03BB 0004
        CMPR    R0,     R1                      ; 6B7B   0141
        BNEQ    L_6B9D                          ; 6B7C   020C 001F

        JSR     R5,     L_6A33                  ; 6B7E   0004 0168 0233

        SLR     R1,     2                       ; 6B81   0065
        SLR     R1,     2                       ; 6B82   0065
        SLR     R1,     1                       ; 6B83   0061
        SDBD                                    ; 6B84   0001
        ADDI    #$6B34, R1                      ; 6B85   02F9 0034 006B
        MVI@    R1,     R3                      ; 6B88   028B
        SARC    R3,     1                       ; 6B89   007B
        BC      L_6B9D                          ; 6B8A   0201 0011

        MVI     G_0108, R1                      ; 6B8C   0281 0108
        ANDI    #$001F, R1                      ; 6B8E   03B9 001F
        SDBD                                    ; 6B90   0001
        ADDI    #$6B3C, R1                      ; 6B91   02F9 003C 006B
        MVI@    R1,     R1                      ; 6B94   0289
        CMPI    #$00FF, R1                      ; 6B95   0379 00FF
        BEQ     L_6B9D                          ; 6B97   0204 0004

        MVO     R1,     G_010B                  ; 6B99   0241 010B
        XORI    #$0004, R3                      ; 6B9B   03FB 0004
L_6B9D:
        MVO     R3,     G_010A                  ; 6B9D   0243 010A
        MVI     G_015E, R0                      ; 6B9F   0280 015E
        ANDI    #$0040, R0                      ; 6BA1   03B8 0040
        BNEQ    L_6BFA                          ; 6BA3   020C 0055

        ANDI    #$0003, R3                      ; 6BA5   03BB 0003
        BEQ     L_6BFA                          ; 6BA7   0204 0051

        MVI     G_0310, R0                      ; 6BA9   0280 0310
        COMR    R0                              ; 6BAB   0018
        BEQ     L_6BFA                          ; 6BAC   0204 004C

        SWAP    R2,     2                       ; 6BAE   0046
        BEQ     L_6BBD                          ; 6BAF   0204 000C
        BMI     L_6BFA                          ; 6BB1   020B 0047

        ANDI    #$007F, R2                      ; 6BB3   03BA 007F
        CMPI    #$0008, R2                      ; 6BB5   037A 0008
        BGT     L_6BFA                          ; 6BB7   020E 0041

        MVII    #$0096, R2                      ; 6BB9   02BA 0096
        B       L_6BBF                          ; 6BBB   0200 0002

L_6BBD:
        MVII    #$0010, R2                      ; 6BBD   02BA 0010
L_6BBF:
        MVO     R2,     G_0130                  ; 6BBF   0242 0130
        CMPI    #$0001, R3                      ; 6BC1   037B 0001
        BEQ     L_6BE9                          ; 6BC3   0204 0024

        MVI     G_0146, R5                      ; 6BC5   0285 0146
        ANDI    #$0002, R5                      ; 6BC7   03BD 0002
        BNEQ    L_6BFA                          ; 6BC9   020C 002F

        MVII    #$0140, R2                      ; 6BCB   02BA 0140
        ADD     G_015D, R2                      ; 6BCD   02C2 015D
        MVI@    R2,     R0                      ; 6BCF   0290
        DECR    R0                              ; 6BD0   0010
        BMI     L_6BFA                          ; 6BD1   020B 0027

        MVO@    R0,     R2                      ; 6BD3   0250
        MVI     G_010F, R0                      ; 6BD4   0280 010F
        MOVR    R0,     R1                      ; 6BD6   0081
        SUBI    #$0078, R1                      ; 6BD7   0339 0078
L_6BD9:
        ADDI    #$0014, R1                      ; 6BD9   02F9 0014
        BMI     L_6BD9                          ; 6BDB   022B 0003

        MVII    #$0060, R4                      ; 6BDD   02BC 0060
        MVI     G_0146, R5                      ; 6BDF   0285 0146
        XORI    #$0002, R5                      ; 6BE1   03FD 0002
        MVO     R5,     G_0146                  ; 6BE3   0245 0146

        JSR     R5,     L_5615                  ; 6BE5   0004 0154 0215

        PULR    R7                              ; 6BE8   02B7

L_6BE9:
        MVI     G_010B, R4                      ; 6BE9   0284 010B
        ADDI    #$0010, R4                      ; 6BEB   02FC 0010
        MVII    #$001E, R3                      ; 6BED   02BB 001E
        MVI     G_0162, R1                      ; 6BEF   0281 0162
        SUBI    #$0004, R1                      ; 6BF1   0339 0004
        MVI     G_0161, R0                      ; 6BF3   0280 0161
        SUBI    #$0004, R0                      ; 6BF5   0338 0004

        JSR     R5,     L_55EE                  ; 6BF7   0004 0154 01EE

L_6BFA:
        PULR    R7                              ; 6BFA   02B7

        DECLE   $0000,  $0003,  $000A,  $0014   ; 6BFB   0000 0003 000A 0014
        DECLE   $0006,  $0007,  $0000,  $0008   ; 6BFF   0006 0007 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0005   ; 6C03   0000 0000 0000 0005
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6C07   0004 0000 0000 0000
        DECLE   $000A,  $0032,  $0000,  $0000   ; 6C0B   000A 0032 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C17   0000 0000 0000 0000
L_6C1B:
        PSHR    R5                              ; 6C1B   0275
        ANDI    #$001F, R0                      ; 6C1C   03B8 001F
        SDBD                                    ; 6C1E   0001
        MVII    #$6BFB, R5                      ; 6C1F   02BD 00FB 006B
        ADDR    R0,     R5                      ; 6C22   00C5
        MVI@    R5,     R0                      ; 6C23   02A8
        PSHR    R1                              ; 6C24   0271
        MVII    #$032C, R1                      ; 6C25   02B9 032C
        ADD     G_015D, R1                      ; 6C27   02C1 015D
        MVI@    R1,     R5                      ; 6C29   028D
        ADD@    R1,     R0                      ; 6C2A   02C8
        MVO@    R0,     R1                      ; 6C2B   0248
        PULR    R1                              ; 6C2C   02B1
        SUBI    #$0064, R0                      ; 6C2D   0338 0064
        BMI     L_6C4B                          ; 6C2F   020B 001A

        SUBI    #$0064, R5                      ; 6C31   033D 0064
        BMI     L_6C3D                          ; 6C33   020B 0008

L_6C35:
        SUBI    #$01F4, R0                      ; 6C35   0338 01F4
        BMI     L_6C4B                          ; 6C37   020B 0012

        SUBI    #$01F4, R5                      ; 6C39   033D 01F4
        BGE     L_6C35                          ; 6C3B   022D 0007

L_6C3D:
        MVII    #$0144, R5                      ; 6C3D   02BD 0144
        ADD     G_015D, R5                      ; 6C3F   02C5 015D
        MVI@    R5,     R0                      ; 6C41   02A8
        DECR    R5                              ; 6C42   0015
        INCR    R0                              ; 6C43   0008
        MVO@    R0,     R5                      ; 6C44   0268
        MVI     G_0146, R0                      ; 6C45   0280 0146
        XORI    #$0010, R0                      ; 6C47   03F8 0010
        MVO     R0,     G_0146                  ; 6C49   0240 0146
L_6C4B:
        PULR    R7                              ; 6C4B   02B7

L_6C4C:
        MVII    #$0001, R3                      ; 6C4C   02BB 0001
L_6C4E:
        PSHR    R5                              ; 6C4E   0275

        JSR     R5,     X_PRINT_R5              ; 6C4F   0004 0118 007B
        STRING  "PLAYER ONE"                    ; 6C52  
        DECLE   $0000                           ; 6C5C   0000

        TSTR    R1                              ; 6C5D   0089
        BEQ     L_6C69                          ; 6C5E   0204 0009

        SUBI    #$0003, R4                      ; 6C60   033C 0003

        JSR     R5,     X_PRINT_R5              ; 6C62   0004 0118 007B
        STRING  "TWO"                           ; 6C65   0054 0057 004F
        DECLE   $0000                           ; 6C68   0000
L_6C69:
        PULR    R7                              ; 6C69   02B7

        PSHR    R5                              ; 6C6A   0275
        MVI     G_015D, R1                      ; 6C6B   0281 015D
        MVII    #$0215, R4                      ; 6C6D   02BC 0215

        JSR     R5,     L_6C4C                  ; 6C6F   0004 016C 004C

        MVII    #$032C, R1                      ; 6C72   02B9 032C
        ADD     G_015D, R1                      ; 6C74   02C1 015D
        MVI@    R1,     R0                      ; 6C76   0288
        TSTR    R0                              ; 6C77   0080
        BEQ     L_6C83                          ; 6C78   0204 0009

        MVII    #$0004, R1                      ; 6C7A   02B9 0004
        MVII    #$0001, R3                      ; 6C7C   02BB 0001
        MVII    #$022A, R4                      ; 6C7E   02BC 022A

        JSR     R5,     X_PRNUM_RGT             ; 6C80   0004 0118 00C5

L_6C83:
        MVII    #$0081, R0                      ; 6C83   02B8 0081
        MVO     R0,     .BTAB.2E                ; 6C85   0240 022E
        MVO     R0,     .BTAB.2F                ; 6C87   0240 022F
        MVII    #$0007, R3                      ; 6C89   02BB 0007
        MVII    #$0251, R4                      ; 6C8B   02BC 0251

        JSR     R5,     X_PRINT_R5              ; 6C8D   0004 0118 007B
        STRING  "MISSION"                       ; 6C90  
        DECLE   $0000                           ; 6C97   0000

        MVII    #$0142, R1                      ; 6C98   02B9 0142
        ADD     G_015D, R1                      ; 6C9A   02C1 015D
        MVI@    R1,     R0                      ; 6C9C   0288
        INCR    R0                              ; 6C9D   0008
        MVII    #$0003, R1                      ; 6C9E   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 6CA0   0004 0118 00C5

        MVII    #$0265, R4                      ; 6CA3   02BC 0265

        JSR     R5,     X_PRINT_R5              ; 6CA5   0004 0118 007B
        STRING  "COMPLETED"                     ; 6CA8  
        DECLE   $0000                           ; 6CB1   0000

        MVII    #$0001, R3                      ; 6CB2   02BB 0001
        MVII    #$02A1, R4                      ; 6CB4   02BC 02A1

        JSR     R5,     X_PRINT_R5              ; 6CB6   0004 0118 007B
        STRING  "GRENADES"                      ; 6CB9  
        DECLE   $0000                           ; 6CC1   0000

        MVII    #$0140, R1                      ; 6CC2   02B9 0140
        ADD     G_015D, R1                      ; 6CC4   02C1 015D
        MVI@    R1,     R0                      ; 6CC6   0288
        MVII    #$0003, R1                      ; 6CC7   02B9 0003
        MVII    #$0001, R3                      ; 6CC9   02BB 0001
        MVII    #$02B7, R4                      ; 6CCB   02BC 02B7

        JSR     R5,     X_PRNUM_RGT             ; 6CCD   0004 0118 00C5

        PULR    R7                              ; 6CD0   02B7

L_6CD1:
        PSHR    R5                              ; 6CD1   0275
        CLRC                                    ; 6CD2   0006
        MVI     G_0146, R0                      ; 6CD3   0280 0146
        ANDI    #$0008, R0                      ; 6CD5   03B8 0008
        BEQ     L_6D7B                          ; 6CD7   0204 00A2

        MVI     G_0163, R0                      ; 6CD9   0280 0163
        TSTR    R0                              ; 6CDB   0080
        BNEQ    L_6D7B                          ; 6CDC   020C 009D

        MVI     G_0165, R0                      ; 6CDE   0280 0165
        ANDI    #$00FC, R0                      ; 6CE0   03B8 00FC
        BNEQ    L_6D7B                          ; 6CE2   020C 0097

        MVI     G_010E, R0                      ; 6CE4   0280 010E
        ANDI    #$00F0, R0                      ; 6CE6   03B8 00F0
        BEQ     L_6CF0                          ; 6CE8   0204 0006

        MVI     G_015E, R0                      ; 6CEA   0280 015E
        ANDI    #$0040, R0                      ; 6CEC   03B8 0040
        BNEQ    L_6CF4                          ; 6CEE   020C 0004

L_6CF0:
        JSR     R5,     L_6DBE                  ; 6CF0   0004 016C 01BE
        DECLE   $001B                           ; 6CF3   001B
L_6CF4:
        MVII    #$0040, R0                      ; 6CF4   02B8 0040
        COMR    R0                              ; 6CF6   0018
        AND     G_015E, R0                      ; 6CF7   0380 015E
        XORI    #$0040, R0                      ; 6CF9   03F8 0040
        MVO     R0,     G_015E                  ; 6CFB   0240 015E
        MVI     G_02F0, R0                      ; 6CFD   0280 02F0
        SDBD                                    ; 6CFF   0001
        ADDI    #$1000, R0                      ; 6D00   02F8 0000 0010
        MVO     R0,     G_02F0                  ; 6D03   0240 02F0
        MOVR    R0,     R1                      ; 6D05   0081
        ANDI    #$00FF, R0                      ; 6D06   03B8 00FF
        CMPI    #$0054, R0                      ; 6D08   0378 0054
        BEQ     L_6D34                          ; 6D0A   0204 0028
        BMI     L_6D23                          ; 6D0C   020B 0015

        DECR    R1                              ; 6D0E   0011
        MVO     R1,     G_02F0                  ; 6D0F   0241 02F0
        MVII    #$0018, R0                      ; 6D11   02B8 0018
        MVO     R0,     G_010E                  ; 6D13   0240 010E
        MVI     G_02F8, R0                      ; 6D15   0280 02F8
        SDBD                                    ; 6D17   0001
        ANDI    #$F3FF, R0                      ; 6D18   03B8 00FF 00F3
        SDBD                                    ; 6D1B   0001
        XORI    #$0400, R0                      ; 6D1C   03F8 0000 0004
        MVO     R0,     G_02F8                  ; 6D1F   0240 02F8
        SETC                                    ; 6D21   0007
        PULR    R7                              ; 6D22   02B7

L_6D23:
        INCR    R1                              ; 6D23   0009
        MVO     R1,     G_02F0                  ; 6D24   0241 02F0
        MVII    #$0010, R0                      ; 6D26   02B8 0010
        MVO     R0,     G_010E                  ; 6D28   0240 010E
        MVI     G_02F8, R0                      ; 6D2A   0280 02F8
        SDBD                                    ; 6D2C   0001
        ANDI    #$F3FF, R0                      ; 6D2D   03B8 00FF 00F3
        MVO     R0,     G_02F8                  ; 6D30   0240 02F8
        SETC                                    ; 6D32   0007
        PULR    R7                              ; 6D33   02B7

L_6D34:
        MVII    #$0014, R0                      ; 6D34   02B8 0014
        MVO     R0,     G_010E                  ; 6D36   0240 010E
        MVI     G_02F8, R0                      ; 6D38   0280 02F8
        SDBD                                    ; 6D3A   0001
        ANDI    #$F3FF, R0                      ; 6D3B   03B8 00FF 00F3
        MVO     R0,     G_02F8                  ; 6D3E   0240 02F8
        MOVR    R0,     R1                      ; 6D40   0081
        DECR    R1                              ; 6D41   0011
        ANDI    #$007F, R0                      ; 6D42   03B8 007F
        CMPI    #$0008, R0                      ; 6D44   0378 0008
        BLE     L_6D4C                          ; 6D46   0206 0004

        MVO     R1,     G_02F8                  ; 6D48   0241 02F8
        SETC                                    ; 6D4A   0007
        PULR    R7                              ; 6D4B   02B7

L_6D4C:
        MVI     G_015E, R0                      ; 6D4C   0280 015E
        XORI    #$0020, R0                      ; 6D4E   03F8 0020
        MVO     R0,     G_015E                  ; 6D50   0240 015E
        MVII    #$01E0, R0                      ; 6D52   02B8 01E0
        MVO     R0,     G_035F                  ; 6D54   0240 035F
        DIS                                     ; 6D56   0003
        SDBD                                    ; 6D57   0001
        MVII    #$00D4, R0                      ; 6D58   02B8 00D4 0000
        MVO     R0,     .ISRVEC.0               ; 6D5B   0240 0100
        SDBD                                    ; 6D5D   0001
        MVII    #$00A9, R0                      ; 6D5E   02B8 00A9 0000
        MVO     R0,     .ISRVEC.1               ; 6D61   0240 0101
        EIS                                     ; 6D63   0002

        JSR     R5,     L_68B2                  ; 6D64   0004 0168 00B2
        DECLE   $0240,  $0021,  $0281,  $0142   ; 6D67   0240 0021 0281 0142
        DECLE   $03B9,  $0001,  $020C,  $0005   ; 6D6B   03B9 0001 020C 0005
        DECLE   $0004,  $01A8,  $02AA,  $0200   ; 6D6F   0004 01A8 02AA 0200
        DECLE   $0003,  $0004                   ; 6D73   0003 0004

        ANDR    R5,     R0                      ; 6D75   01A8
        SUB     .STIC.X.4,R0                    ; 6D76   0300 0004
        CMPR    R5,     R4                      ; 6D78   016C
        SAR     R2,     1                       ; 6D79   006A
        SETC                                    ; 6D7A   0007
L_6D7B:
        PULR    R7                              ; 6D7B   02B7

        DECLE   $01F0,  $01F1,  $01F2,  $0154   ; 6D7C   01F0 01F1 01F2 0154
        DECLE   $0156,  $0158,  $014C,  $014D   ; 6D80   0156 0158 014C 014D
        DECLE   $01F3,  $01FA,  $014E,  $014F   ; 6D84   01F3 01FA 014E 014F
        DECLE   $0150,  $0151,  $0152,  $0153   ; 6D88   0150 0151 0152 0153
        DECLE   $014A,  $0000,  $014B,  $014B   ; 6D8C   014A 0000 014B 014B
        DECLE   $014B,  $014B,  $0000           ; 6D90   014B 014B 0000

        XORR    R6,     R0                      ; 6D93   01F0
        XORR    R6,     R1                      ; 6D94   01F1
        XORR    R6,     R2                      ; 6D95   01F2
        CMPR    R1,     R3                      ; 6D96   014B
        CMPR    R1,     R3                      ; 6D97   014B
        CMPR    R1,     R3                      ; 6D98   014B
        CMPR    R1,     R3                      ; 6D99   014B
        SLLC    R1,     2                       ; 6D9A   005D
        INCR    R5                              ; 6D9B   000D
        MOVR    R3,     R4                      ; 6D9C   009C
        INCR    R4                              ; 6D9D   000C
        ADDR    R4,     R7                      ; 6D9E   00E7

        DECLE   $000B,  $003C,  $000B,  $009B   ; 6D9F   000B 003C 000B 009B
        DECLE   $000A,  $0002,  $000A,  $0073   ; 6DA3   000A 0002 000A 0073
        DECLE   $0009,  $00EB,  $0008,  $006B   ; 6DA7   0009 00EB 0008 006B
        DECLE   $0008,  $00F2,  $0007,  $0080   ; 6DAB   0008 00F2 0007 0080
        DECLE   $0007,  $0014,  $0007,  $0003   ; 6DAF   0007 0014 0007 0003
        DECLE   $0004                           ; 6DB3   0004

        CLRC                                    ; 6DB4   0006
        INCR    R1                              ; 6DB5   0009
        INCR    R4                              ; 6DB6   000C
        DECR    R2                              ; 6DB7   0012
        COMR    R0                              ; 6DB8   0018
        NEGR    R4                              ; 6DB9   0024
        CMPR    R1,     R0                      ; 6DBA   0148
        SUB@    R6,     R3                      ; 6DBB   0333
        CMPR    R1,     R1                      ; 6DBC   0149
        SUB@    R6,     R4                      ; 6DBD   0334
L_6DBE:
        MVI@    R5,     R4                      ; 6DBE   02AC
        PSHR    R5                              ; 6DBF   0275
        SDBD                                    ; 6DC0   0001
        MVII    #$6DBA, R5                      ; 6DC1   02BD 00BA 006D
        SDBD                                    ; 6DC4   0001
        ADDI    #$AF4D, R4                      ; 6DC5   02FC 004D 00AF
        MVI@    R4,     R0                      ; 6DC8   02A0
        SARC    R0,     1                       ; 6DC9   0078
        MVO     R0,     G_0147                  ; 6DCA   0240 0147
        BNC     L_6DD8                          ; 6DCC   0209 000A

        XORI    #$0007, R0                      ; 6DCE   03F8 0007
        ADDI    #$0002, R5                      ; 6DD0   02FD 0002
        MVI     G_0146, R3                      ; 6DD2   0283 0146
        ANDI    #$00FB, R3                      ; 6DD4   03BB 00FB
        MVO     R3,     G_0146                  ; 6DD6   0243 0146
L_6DD8:
        MVI@    R5,     R3                      ; 6DD8   02AB
        MVI@    R5,     R5                      ; 6DD9   02AD
        MVI     G_0147, R1                      ; 6DDA   0281 0147
        XORI    #$0080, R1                      ; 6DDC   03F9 0080
        MVO     R1,     G_0147                  ; 6DDE   0241 0147
        CLRR    R1                              ; 6DE0   01C9
        MVO@    R1,     R3                      ; 6DE1   0259
        SDBD                                    ; 6DE2   0001
        MVI@    R4,     R2                      ; 6DE3   02A2
        MVO@    R2,     R5                      ; 6DE4   026A

        JSR     R5,     L_6F67                  ; 6DE5   0004 016C 0367

        INCR    R0                              ; 6DE8   0008
        MVO@    R0,     R3                      ; 6DE9   0258
        MVI     G_0147, R1                      ; 6DEA   0281 0147
        ANDI    #$007F, R1                      ; 6DEC   03B9 007F
        MVO     R1,     G_0147                  ; 6DEE   0241 0147
        PULR    R7                              ; 6DF0   02B7

L_6DF1:
        PSHR    R5                              ; 6DF1   0275
        DECLE   $0280,  $0147,  $0044,  $020B   ; 6DF2   0280 0147 0044 020B
        DECLE   $016F,  $0001,  $02BD,  $00BA   ; 6DF6   016F 0001 02BD 00BA
        DECLE   $006D,  $0280,  $035F,  $03B8   ; 6DFA   006D 0280 035F 03B8
        DECLE   $0001,  $00C5,  $00C5,  $02AB   ; 6DFE   0001 00C5 00C5 02AB
        DECLE   $0299,  $0011,  $020B,  $010B   ; 6E02   0299 0011 020B 010B
        DECLE   $0259,  $020C,  $0108,  $02AC   ; 6E06   0259 020C 0108 02AC
        DECLE   $02A4,  $0078,  $0201,  $007A   ; 6E0A   02A4 0078 0201 007A
L_6E0E:
        MVI@    R4,     R0                      ; 6E0E   02A0
        MOVR    R0,     R1                      ; 6E0F   0081
        ANDI    #$001F, R1                      ; 6E10   03B9 001F
        MOVR    R1,     R2                      ; 6E12   008A
        SDBD                                    ; 6E13   0001
        ADDI    #$6D7C, R2                      ; 6E14   02FA 007C 006D
        MVI@    R2,     R2                      ; 6E17   0292
        INCR    R1                              ; 6E18   0009
        ADDR    R7,     R1                      ; 6E19   00F9
        ADD@    R1,     R7                      ; 6E1A   02CF

        DECLE   $001E,  $001E,  $001E,  $0027   ; 6E1B   001E 001E 001E 0027
        DECLE   $0027,  $0027                   ; 6E1F   0027 0027

        ADCR    R7                              ; 6E21   002F
        ADCR    R7                              ; 6E22   002F

L_6E23:
        COMR    R6                              ; 6E23   001E
L_6E24:
        ADCR    R7                              ; 6E24   002F
        ADCR    R7                              ; 6E25   002F
L_6E26:
        ADCR    R7                              ; 6E26   002F
L_6E27:
        ADCR    R7                              ; 6E27   002F
L_6E28:
        ADCR    R7                              ; 6E28   002F
L_6E29:
        ADCR    R7                              ; 6E29   002F
L_6E2A:
        ADCR    R7                              ; 6E2A   002F

L_6E2B:
        SWAP    R1,     2                       ; 6E2B   0045
L_6E2C:
        SLL     R2,     1                       ; 6E2C   004A
        DECLE   $002F,  $002F,  $002F,  $002F   ; 6E2D   002F 002F 002F 002F
        DECLE   $003F                           ; 6E31   003F

        ADCR    R7                              ; 6E32   002F
        ADCR    R7                              ; 6E33   002F
L_6E34:
        ADCR    R7                              ; 6E34   002F

L_6E35:
        GSWD    R3                              ; 6E35   0033
L_6E36:
        GSWD    R3                              ; 6E36   0033
        GSWD    R3                              ; 6E37   0033
        GSWD    R3                              ; 6E38   0033
        SDBD                                    ; 6E39   0001
        MVI@    R4,     R0                      ; 6E3A   02A0
        MVO@    R0,     R2                      ; 6E3B   0250
        SWAP    R0,     1                       ; 6E3C   0040
        ADDI    #$0004, R2                      ; 6E3D   02FA 0004
        MVO@    R0,     R2                      ; 6E3F   0250
        B       L_6E0E                          ; 6E40   0220 0033

        SDBD                                    ; 6E42   0001
        MVI@    R4,     R0                      ; 6E43   02A0
        MVO@    R0,     R2                      ; 6E44   0250
        SWAP    R0,     1                       ; 6E45   0040
        INCR    R2                              ; 6E46   000A
        MVO@    R0,     R2                      ; 6E47   0250
        B       L_6E0E                          ; 6E48   0220 003B

        MVI@    R4,     R0                      ; 6E4A   02A0
        MVO@    R0,     R2                      ; 6E4B   0250
        B       L_6E0E                          ; 6E4C   0220 003F

        SDBD                                    ; 6E4E   0001
        MVI@    R4,     R5                      ; 6E4F   02A5
        MVI@    R2,     R0                      ; 6E50   0290
        DECR    R0                              ; 6E51   0010
        BMI     L_6E57                          ; 6E52   020B 0003

        MVO@    R0,     R2                      ; 6E54   0250
        BEQ     L_6E0E                          ; 6E55   0224 0048

L_6E57:
        MOVR    R5,     R4                      ; 6E57   00AC
        B       L_6E0E                          ; 6E58   0220 004B

        MVI@    R4,     R0                      ; 6E5A   02A0
        MVO@    R0,     R3                      ; 6E5B   0258
        MVO     R4,     G_0333                  ; 6E5C   0244 0333
        B       L_6F11                          ; 6E5E   0200 00B1

        MVI@    R4,     R0                      ; 6E60   02A0
        AND@    R2,     R0                      ; 6E61   0390
        MVO@    R0,     R2                      ; 6E62   0250
        B       L_6E0E                          ; 6E63   0220 0056

        SLL     R0,     2                       ; 6E65   004C
        SWAP    R0,     1                       ; 6E66   0040
        ANDI    #$0007, R0                      ; 6E67   03B8 0007

        JSR     R5,     L_6F67                  ; 6E69   0004 016C 0367

        MVO     R0,     G_0147                  ; 6E6C   0240 0147
        B       L_6F11                          ; 6E6E   0200 00A1

L_6E70:
        MVI     G_0146, R0                      ; 6E70   0280 0146
        ANDI    #$00FB, R0                      ; 6E72   03B8 00FB
        SUBI    #$003D, R1                      ; 6E74   0339 003D
        INCR    R1                              ; 6E76   0009
        ADDR    R7,     R1                      ; 6E77   00F9
        ADD@    R1,     R7                      ; 6E78   02CF

        DECLE   $0003,  $0005,  $0009,  $03F8   ; 6E79   0003 0005 0009 03F8
        DECLE   $0004,  $0240,  $0146,  $0200   ; 6E7D   0004 0240 0146 0200
        DECLE   $0006,  $0004,  $01AC,  $0288   ; 6E81   0006 0004 01AC 0288
        DECLE   $0084,  $0204,  $0089,  $0004   ; 6E85   0084 0204 0089 0004

        ANDR    R5,     R4                      ; 6E89   01AC
        MVI@    R3,     R1                      ; 6E8A   0299
        MOVR    R0,     R1                      ; 6E8B   0081
        ANDI    #$003F, R1                      ; 6E8C   03B9 003F
        CMPI    #$003D, R1                      ; 6E8E   0379 003D
        BGE     L_6E70                          ; 6E90   022D 0021

        MOVR    R0,     R2                      ; 6E92   0082
        SLL     R2,     2                       ; 6E93   004E
        SWAP    R2,     1                       ; 6E94   0042
        ANDI    #$0007, R2                      ; 6E95   03BA 0007
        SDBD                                    ; 6E97   0001
        ADDI    #$6DB2, R2                      ; 6E98   02FA 00B2 006D
        MVI@    R2,     R2                      ; 6E9B   0292
        MVO     R2,     G_0149                  ; 6E9C   0242 0149
        TSTR    R1                              ; 6E9E   0089
        BEQ     L_6F0B                          ; 6E9F   0204 006A

        MVII    #$015A, R3                      ; 6EA1   02BB 015A
        MVII    #$0009, R1                      ; 6EA3   02B9 0009
L_6EA5:
        MVI@    R3,     R2                      ; 6EA5   029A
        TSTR    R2                              ; 6EA6   0092
        BNEQ    L_6EAE                          ; 6EA7   020C 0005

        MOVR    R1,     R2                      ; 6EA9   008A
        AND     G_0147, R2                      ; 6EAA   0382 0147
        BEQ     L_6EB6                          ; 6EAC   0204 0008

L_6EAE:
        INCR    R3                              ; 6EAE   000B
        SLL     R1,     1                       ; 6EAF   0049
        CMPI    #$0048, R1                      ; 6EB0   0379 0048
        BNEQ    L_6EA5                          ; 6EB2   022C 000E
        B       L_6F0B                          ; 6EB4   0200 0055

L_6EB6:
        MOVR    R1,     R2                      ; 6EB6   008A
        ANDI    #$0038, R1                      ; 6EB7   03B9 0038
        COMR    R2                              ; 6EB9   001A
        AND     G_014A, R2                      ; 6EBA   0382 014A
        MVI     G_0146, R5                      ; 6EBC   0285 0146
        ANDI    #$0004, R5                      ; 6EBE   03BD 0004
        BEQ     L_6ECF                          ; 6EC0   0204 000D

        MVI     G_0147, R5                      ; 6EC2   0285 0147
        TSTR    R5                              ; 6EC4   00AD
        BNEQ    L_6ED0                          ; 6EC5   020C 0009

        MVII    #$00F0, R5                      ; 6EC7   02BD 00F0
        MVO     R5,     G_014C                  ; 6EC9   0245 014C
        CLRR    R5                              ; 6ECB   01ED
        MVO     R5,     G_014D                  ; 6ECC   0245 014D
        INCR    R7                              ; 6ECE   000F

L_6ECF:
        XORR    R1,     R2                      ; 6ECF   01CA
L_6ED0:
        MVO     R2,     G_014A                  ; 6ED0   0242 014A
        MVI     G_0149, R1                      ; 6ED2   0281 0149
        SLR     R1,     1                       ; 6ED4   0061
        ADD     G_0149, R1                      ; 6ED5   02C1 0149
        MVO@    R1,     R3                      ; 6ED7   0259
        SUBI    #$000C, R3                      ; 6ED8   033B 000C
        MVII    #$002C, R1                      ; 6EDA   02B9 002C
        MVO@    R1,     R3                      ; 6EDC   0259
        MVI     G_0146, R1                      ; 6EDD   0281 0146
        ANDI    #$0004, R1                      ; 6EDF   03B9 0004
        BEQ     L_6EEA                          ; 6EE1   0204 0007

        MVII    #$003C, R1                      ; 6EE3   02B9 003C
        MVO@    R1,     R3                      ; 6EE5   0259
        SDBD                                    ; 6EE6   0001
        MVII    #$FFF8, R1                      ; 6EE7   02B9 00F8 00FF
L_6EEA:
        ADDI    #$0003, R3                      ; 6EEA   02FB 0003
        MVO@    R1,     R3                      ; 6EEC   0259
        ADDI    #$009F, R3                      ; 6EED   02FB 009F
        MOVR    R0,     R5                      ; 6EEF   0085
        ANDI    #$003F, R5                      ; 6EF0   03BD 003F
        CLRR    R1                              ; 6EF2   01C9
L_6EF3:
        INCR    R1                              ; 6EF3   0009
        SUBI    #$000C, R5                      ; 6EF4   033D 000C
        BPL     L_6EF3                          ; 6EF6   0223 0004

        ADDI    #$000C, R5                      ; 6EF8   02FD 000C
        ADDR    R5,     R5                      ; 6EFA   00ED
        SDBD                                    ; 6EFB   0001
        ADDI    #$6D9A, R5                      ; 6EFC   02FD 009A 006D
        SDBD                                    ; 6EFF   0001
        MVI@    R5,     R2                      ; 6F00   02AA
L_6F01:
        SARC    R2,     1                       ; 6F01   007A
        ADCR    R2                              ; 6F02   002A
        DECR    R1                              ; 6F03   0011
        BNEQ    L_6F01                          ; 6F04   022C 0004

        MVO@    R2,     R3                      ; 6F06   025A
        SWAP    R2,     1                       ; 6F07   0042
        ADDI    #$0004, R3                      ; 6F08   02FB 0004
        MVO@    R2,     R3                      ; 6F0A   025A
L_6F0B:
        ANDI    #$0200, R0                      ; 6F0B   03B8 0200
        DECLE   $0224,  $0086                   ; 6F0D   0224 0086

        MVO     R4,     G_0334                  ; 6F0F   0244 0334
L_6F11:
        MVII    #$01F4, R3                      ; 6F11   02BB 01F4
        MVII    #$0154, R5                      ; 6F13   02BD 0154
L_6F15:
        MVI@    R3,     R0                      ; 6F15   0298
        ANDI    #$000F, R0                      ; 6F16   03B8 000F
        SUBI    #$0004, R3                      ; 6F18   033B 0004
        SWAP    R0,     1                       ; 6F1A   0040
        ADD@    R3,     R0                      ; 6F1B   02D8
        SDBD                                    ; 6F1C   0001
        ADD@    R5,     R0                      ; 6F1D   02E8
        MOVR    R3,     R4                      ; 6F1E   009C
        ADDI    #$0004, R3                      ; 6F1F   02FB 0004
        MOVR    R0,     R1                      ; 6F21   0081
        SWAP    R1,     1                       ; 6F22   0041
        MVO@    R0,     R4                      ; 6F23   0260
        MVO@    R1,     R3                      ; 6F24   0259
        INCR    R3                              ; 6F25   000B
        CMPI    #$01F7, R3                      ; 6F26   037B 01F7
        BNEQ    L_6F15                          ; 6F28   022C 0014

        MVI     G_014C, R0                      ; 6F2A   0280 014C
        MOVR    R0,     R1                      ; 6F2C   0081
        SLR     R0,     2                       ; 6F2D   0064
        SLR     R0,     1                       ; 6F2E   0060
        ADD     G_014D, R1                      ; 6F2F   02C1 014D
        MVO     R0,     .PSG0.noise             ; 6F31   0240 01F9
        MVO     R1,     G_014C                  ; 6F33   0241 014C
        MVII    #$015A, R2                      ; 6F35   02BA 015A
        MVII    #$0151, R3                      ; 6F37   02BB 0151
        MVII    #$014E, R4                      ; 6F39   02BC 014E
        MVII    #$01FB, R5                      ; 6F3B   02BD 01FB
L_6F3D:
        MVI@    R2,     R0                      ; 6F3D   0290
        DECR    R0                              ; 6F3E   0010
        BMI     L_6F49                          ; 6F3F   020B 0008

        MVO@    R0,     R2                      ; 6F41   0250
        BNEQ    L_6F49                          ; 6F42   020C 0005

        SDBD                                    ; 6F44   0001
        MVII    #$FFFF, R0                      ; 6F45   02B8 00FF 00FF
        MVO@    R0,     R3                      ; 6F48   0258
L_6F49:
        MVI@    R4,     R0                      ; 6F49   02A0
        CMPI    #$003F, R0                      ; 6F4A   0378 003F
        BEQ     L_6F59                          ; 6F4C   0204 000B

        ADD@    R3,     R0                      ; 6F4E   02D8
        MOVR    R0,     R1                      ; 6F4F   0081
        ANDI    #$00C0, R1                      ; 6F50   03B9 00C0
        BEQ     L_6F56                          ; 6F52   0204 0002

        CLRR    R0                              ; 6F54   01C0
        MVO@    R0,     R3                      ; 6F55   0258
L_6F56:
        DECR    R4                              ; 6F56   0014
        MVO@    R0,     R4                      ; 6F57   0260
        SLR     R0,     2                       ; 6F58   0064
L_6F59:
        MVO@    R0,     R5                      ; 6F59   0268
        INCR    R2                              ; 6F5A   000A
        INCR    R3                              ; 6F5B   000B
        CMPI    #$01FE, R5                      ; 6F5C   037D 01FE
        BNEQ    L_6F3D                          ; 6F5E   022C 0022

        MVI     G_014A, R0                      ; 6F60   0280 014A
        ANDI    #$003F, R0                      ; 6F62   03B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6F64   0240 01F8
        PULR    R7                              ; 6F66   02B7

L_6F67:
        MVII    #$014E, R4                      ; 6F67   02BC 014E
        MVII    #$0009, R2                      ; 6F69   02BA 0009
L_6F6B:
        SARC    R0,     1                       ; 6F6B   0078
        BNC     L_6F86                          ; 6F6C   0209 0018

        MOVR    R2,     R1                      ; 6F6E   0091
        COMR    R1                              ; 6F6F   0019
        AND     G_014A, R1                      ; 6F70   0381 014A
        XORR    R2,     R1                      ; 6F72   01D1
        MVO     R1,     G_014A                  ; 6F73   0241 014A
        CLRR    R1                              ; 6F75   01C9
        MOVR    R4,     R2                      ; 6F76   00A2
        MVO@    R1,     R2                      ; 6F77   0251
        ADDI    #$0003, R2                      ; 6F78   02FA 0003
        MVO@    R1,     R2                      ; 6F7A   0251
        ADDI    #$0009, R2                      ; 6F7B   02FA 0009
        MVO@    R1,     R2                      ; 6F7D   0251
        SUBI    #$015A, R2                      ; 6F7E   033A 015A
        ADDR    R2,     R2                      ; 6F80   00D2
        ADDI    #$0154, R2                      ; 6F81   02FA 0154
        MVO@    R1,     R2                      ; 6F83   0251
        INCR    R2                              ; 6F84   000A
        MVO@    R1,     R2                      ; 6F85   0251
L_6F86:
        INCR    R4                              ; 6F86   000C
        SLL     R2,     1                       ; 6F87   004A
        TSTR    R0                              ; 6F88   0080
        BNEQ    L_6F6B                          ; 6F89   022C 001F
        MOVR    R5,     R7                      ; 6F8B   00AF

        DECLE   $0010,  $002D,  $0001,  $004C   ; 6F8C   0010 002D 0001 004C
        DECLE   $0004,  $0004,  $0032,  $0000   ; 6F90   0004 0004 0032 0000
        DECLE   $0006,  $00A0,  $0007,  $03FD   ; 6F94   0006 00A0 0007 03FD
        DECLE   $0008,  $0040,  $0006,  $000B   ; 6F98   0008 0040 0006 000B
        DECLE   $003F,  $0009,  $0000,  $0016   ; 6F9C   003F 0009 0000 0016
        DECLE   $0004                           ; 6FA0   0004

        MOVR    R2,     R1                      ; 6FA1   0091
        DECR    R0                              ; 6FA2   0010
        ADCR    R7                              ; 6FA3   002F

        CLRC                                    ; 6FA4   0006
L_6FA5:
        DECR    R0                              ; 6FA5   0010
        DECLE   $000B,  $003F,  $0008,  $0088   ; 6FA6   000B 003F 0008 0088
        DECLE   $0013,  $0009,  $0000,  $0016   ; 6FAA   0013 0009 0000 0016
        DECLE   $0001,  $0012,  $0004,  $0006   ; 6FAE   0001 0012 0004 0006
        DECLE   $00F8,  $0016,  $0001,  $0006   ; 6FB2   00F8 0016 0001 0006
        DECLE   $0020,  $0016,  $0001           ; 6FB6   0020 0016 0001

        COMR    R2                              ; 6FB9   001A
        MOVR    R6,     R1                      ; 6FBA   00B1
        SAR     R3,     2                       ; 6FBB   006F
        MOVR    R2,     R1                      ; 6FBC   0091
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
        DECLE   $001F,  $0327,  $010B,  $0005   ; D000   001F 0327 010B 0005
        DECLE   $0101,  $0302,  $0000,  $0100   ; D004   0101 0302 0000 0100
        DECLE   $00F0,  $01C0,  $0080,  $0280   ; D008   00F0 01C0 0080 0280
        DECLE   $0100,  $0000,  $0300,  $0100   ; D00C   0100 0000 0300 0100
        DECLE   $00FF                           ; D010   00FF

        ADDI    #$000F, R7                      ; D011   02FF 000F
        SUBR    R1,     R7                      ; D013   010F

        DECLE   $0007,  $0202,  $0100,  $0001   ; D014   0007 0202 0100 0001
        DECLE   $01FF,  $00FE,  $03F0,  $0100   ; D018   01FF 00FE 03F0 0100
        DECLE   $0000                           ; D01C   0000

        SUB@    R2,     R0                      ; D01D   0310
        B       L_D320                          ; D01E   0200 0300

        DECLE   $01CF                           ; D020   01CF

        RSWD    R1                              ; D021   0039
L_D022:
        SUBR    R7,     R0                      ; D022   0138
        DECLE   $0370,  $0160,  $01E0,  $00C0   ; D023   0370 0160 01E0 00C0
        DECLE   $01C0,  $03FF,  $02FF,  $017F   ; D027   01C0 03FF 02FF 017F
        DECLE   $001F,  $0307,  $0330,  $0083   ; D02B   001F 0307 0330 0083
        DECLE   $0204,  $00FE,  $01FE,  $02FE   ; D02F   0204 00FE 01FE 02FE
        DECLE   $03FC,  $01F0,  $00E0,  $01E0   ; D033   03FC 01F0 00E0 01E0
        DECLE   $03E0,  $02FF,  $01E7,  $0081   ; D037   03E0 02FF 01E7 0081
        DECLE   $0300,  $0000,  $0300,  $0100   ; D03B   0300 0000 0300 0100
        DECLE   $0001,  $01CF                   ; D03F   0001 01CF

        ADDR    R1,     R7                      ; D041   00CF
        ADD@    R1,     R7                      ; D042   02CF

        DECLE   $01CF,  $00CF,  $01C7,  $03C7   ; D043   01CF 00CF 01C7 03C7
        DECLE   $00C7,  $0100,  $0000,  $0300   ; D047   00C7 0100 0000 0300
        DECLE   $0000,  $0181,  $02FF,  $01FF   ; D04B   0000 0181 02FF 01FF
        DECLE   $00FF,  $0103,  $000F,  $023F   ; D04F   00FF 0103 000F 023F
        DECLE   $01FF,  $02FF,  $01FF,  $00FF   ; D053   01FF 02FF 01FF 00FF
        DECLE   $02FF,  $01E0                   ; D057   02FF 01E0

        ADDR    R4,     R0                      ; D059   00E0
        ADD@    R6,     R0                      ; D05A   02F0
        XOR@    R6,     R0                      ; D05B   03F0
        XORR    R6,     R0                      ; D05C   01F0
        XORR    R7,     R0                      ; D05D   01F8
        ADDI    #$00FC, R0                      ; D05E   02F8 00FC
        SUBR    R0,     R7                      ; D060   0107

        DECLE   $0207,  $0103,  $0003,  $0101   ; D061   0207 0103 0003 0101
        DECLE   $0001,  $0201,  $0100           ; D065   0001 0201 0100

        ADD@    R4,     R0                      ; D068   02E0
        ADD     .ISRVEC.0,R0                    ; D069   02C0 0100
        B       L_D270                          ; D06B   0200 0203
        SUBR    R1,     R7                      ; D06D   010F

        DECLE   $020F,  $031F,  $01FF,  $02FF   ; D06E   020F 031F 01FF 02FF
        DECLE   $01FF,  $02FF,  $00FF,  $001F   ; D072   01FF 02FF 00FF 001F
        DECLE   $0107,  $0201,  $01C8           ; D076   0107 0201 01C8

        ADD@    R6,     R0                      ; D079   02F0
        ADCR    R6                              ; D07A   002E
        SUBR    R2,     R5                      ; D07B   0115
        B       L_D27E                          ; D07C   0200 0200

        DECLE   $0300,  $0000,  $0100,  $0200   ; D07E   0300 0000 0100 0200
        DECLE   $0203,  $030F,  $0001           ; D082   0203 030F 0001

        SUBR    R0,     R1                      ; D085   0101
        B       L_D188                          ; D086   0200 0100

        DECLE   $01FF                           ; D088   01FF

        SUBR    R3,     R7                      ; D089   011F
        SUBR    R3,     R7                      ; D08A   011F

        DECLE   $021F,  $021F,  $020F           ; D08B   021F 021F 020F

        SUBR    R1,     R7                      ; D08E   010F
        SUBR    R1,     R7                      ; D08F   010F

        DECLE   $02C1,  $0060,  $0260,  $0230   ; D090   02C1 0060 0260 0230

        SUBR    R6,     R0                      ; D094   0130
        SUBR    R3,     R0                      ; D095   0118
        SUB@    R1,     R4                      ; D096   030C
        EIS                                     ; D097   0002
        B       L_D19A                          ; D098   0200 0100

        DECLE   $0100,  $01C0,  $003C,  $021F   ; D09A   0100 01C0 003C 021F

        SUBR    R3,     R7                      ; D09E   011F
        SUB@    R3,     R7                      ; D09F   031F

        DECLE   $000F,  $020F,  $020F           ; D0A0   000F 020F 020F

        SETC                                    ; D0A3   0007
        SETC                                    ; D0A4   0007
        CMP     G_004F, R7                      ; D0A5   0347 004F
        MVI@    R3,     R7                      ; D0A7   029F

        DECLE   $0000,  $0000,  $0100,  $0000   ; D0A8   0000 0000 0100 0000
        DECLE   $0280,  $0080,  $0280,  $00C9   ; D0AC   0280 0080 0280 00C9
        DECLE   $0200                           ; D0B0   0200

        B       L_D0B3                          ; D0B1   0200 0000

L_D0B3:
        TSTR    R0                              ; D0B3   0080
        DECLE   $0300,  $0040,  $0210           ; D0B4   0300 0040 0210

        MOVR    R2,     R0                      ; D0B7   0090
L_D0B8:
        ADDR    R6,     R4                      ; D0B8   00F4
        DECLE   $01F0,  $00E4,  $0210,  $0000   ; D0B9   01F0 00E4 0210 0000
        DECLE   $0200,  $0000,  $0201,  $02FC   ; D0BD   0200 0000 0201 02FC
        DECLE   $01FE,  $01FF,  $03FF,  $00FF   ; D0C1   01FE 01FF 03FF 00FF
        DECLE   $02FF,  $01FF,  $01FF,  $01FF   ; D0C5   02FF 01FF 01FF 01FF
        DECLE   $00FF,  $02FF,  $01FE,  $03FE   ; D0C9   00FF 02FF 01FE 03FE
        DECLE   $00FE,  $02FE,  $02FE,  $0000   ; D0CD   00FE 02FE 02FE 0000
        DECLE   $0000                           ; D0D1   0000

        SUB     .STIC.X.0,R0                    ; D0D2   0300 0000
        B       L_D156                          ; D0D4   0200 0080

        DECLE   $00C0,  $01E0,  $00E0,  $02E0   ; D0D6   00C0 01E0 00E0 02E0
        DECLE   $00F0,  $02F0,  $00F0,  $02F8   ; D0DA   00F0 02F0 00F0 02F8
        DECLE   $02F8,  $00F8,  $00F8,  $03F8   ; D0DE   02F8 00F8 00F8 03F8
        DECLE   $00F8,  $02F8,  $00F8,  $00F0   ; D0E2   00F8 02F8 00F8 00F0
        DECLE   $01F0,  $00F0,  $020F,  $000F   ; D0E6   01F0 00F0 020F 000F
        DECLE   $020F,  $000F,  $020F           ; D0EA   020F 000F 020F

        BESC    L_D3FE                          ; D0ED   020F 030F
        INCR    R7                              ; D0EF   000F
        SUB@    R1,     R7                      ; D0F0   030F
L_D0F1:
        INCR    R7                              ; D0F1   000F

        DECLE   $0207                           ; D0F2   0207
L_D0F3:
        SUB     .STIC.X.7,R7                    ; D0F3   0307 0007

        DECLE   $0003,  $0003,  $0213,  $03FF   ; D0F5   0003 0003 0213 03FF
        DECLE   $02FF                           ; D0F9   02FF

        ADDI    #$01F8, R7                      ; D0FA   02FF 01F8

        ADD@    R4,     R0                      ; D0FC   02E0
        ADDR    R4,     R0                      ; D0FD   00E0
        ADDR    R2,     R0                      ; D0FE   00D0
        ADD@    R4,     R4                      ; D0FF   02E4
        SUB@    R3,     R7                      ; D100   031F
        SUBR    R3,     R7                      ; D101   011F

        DECLE   $003F,  $003F,  $033F,  $007F   ; D102   003F 003F 033F 007F
        DECLE   $027F,  $007F,  $02C0,  $00C0   ; D106   027F 007F 02C0 00C0
        DECLE   $02C0,  $02C0,  $02C0,  $01C8   ; D10A   02C0 02C0 02C0 01C8
        DECLE   $00E8,  $00E4,  $0220,  $0200   ; D10E   00E8 00E4 0220 0200
        DECLE   $0110                           ; D112   0110

        XOR@    R1,     R5                      ; D113   03CD
        MOVR    R6,     R0                      ; D114   00B0
        B       L_D317                          ; D115   0200 0200

        DECLE   $0300,  $0008,  $0208,  $0213   ; D117   0300 0008 0208 0213

        SUBR    R2,     R3                      ; D11B   0113
        SETC                                    ; D11C   0007
        SUB     G_0083, R7                      ; D11D   0307 0083

        DECLE   $020E,  $0100,  $0000,  $0001   ; D11F   020E 0100 0000 0001
        DECLE   $0001,  $0201,  $0103,  $0203   ; D123   0001 0201 0103 0203
        DECLE   $0057,  $02E0,  $02E0,  $01E0   ; D127   0057 02E0 02E0 01E0
        DECLE   $00E0,  $03E0,  $00E0,  $02E0   ; D12B   00E0 03E0 00E0 02E0
        DECLE   $01E0,  $00F0,  $00F0,  $00F0   ; D12F   01E0 00F0 00F0 00F0
        DECLE   $02E0,  $01E0,  $02E0,  $00E0   ; D133   02E0 01E0 02E0 00E0
        DECLE   $02F0,  $0223,  $0149,  $0000   ; D137   02F0 0223 0149 0000
        DECLE   $0300,  $0000,  $0200,  $0100   ; D13B   0300 0000 0200 0100
        DECLE   $0015,  $00FF,  $00FF,  $027F   ; D13F   0015 00FF 00FF 027F
        DECLE   $010F,  $0203,  $0003,  $02AB   ; D143   010F 0203 0003 02AB
        DECLE   $0207,  $03F0                   ; D147   0207 03F0

        XORR    R0,     R2                      ; D149   01C2
        AND     G_0380, R1                      ; D14A   0381 0380
        ANDR    R0,     R0                      ; D14C   0180
        AND     G_01C2, R1                      ; D14D   0381 01C2
        ADDR    R4,     R0                      ; D14F   00E0
        SUBR    R0,     R7                      ; D150   0107

        DECLE   $0221                           ; D151   0221

        CMP     G_0380, R0                      ; D152   0340 0380
        AND     G_0340, R0                      ; D154   0380 0340
L_D156:
        SUBR    R4,     R1                      ; D156   0121
        DECLE   $0103,  $007E,  $00C3,  $03BD   ; D157   0103 007E 00C3 03BD
        DECLE   $01A1,  $01A1,  $02BD,  $02C3   ; D15B   01A1 01A1 02BD 02C3
        DECLE   $037E,  $01FF,  $016E,  $0024   ; D15F   037E 01FF 016E 0024
        DECLE   $0220,  $0220,  $0120,  $0190   ; D163   0220 0220 0120 0190
        DECLE   $0280,  $02FC,  $0280,  $0190   ; D167   0280 02FC 0280 0190
        DECLE   $0100,  $0000,  $0300,  $0100   ; D16B   0100 0000 0300 0100
        DECLE   $0100,  $0100,  $020E,  $003F   ; D16F   0100 0100 020E 003F
        DECLE   $037C,  $017B,  $03F8,  $01FB   ; D173   037C 017B 03F8 01FB
        DECLE   $00FF,  $02FF,  $01FF,  $03FF   ; D177   00FF 02FF 01FF 03FF
        DECLE   $01FE,  $01FE,  $027E           ; D17B   01FE 01FE 027E

        SARC    R0,     2                       ; D17E   007C
        SARC    R2,     2                       ; D17F   007E
        XOR     G_0340, R0                      ; D180   03C0 0340
        SUBR    R6,     R0                      ; D182   0130
        GSWD    R0                              ; D183   0030
        RRC     R0,     1                       ; D184   0070
        CMP@    R4,     R0                      ; D185   0360
        ANDR    R4,     R0                      ; D186   01A0
        SUBR    R6,     R0                      ; D187   0130
L_D188:
        NEGR    R0                              ; D188   0020
        DECLE   $0020,  $0360,  $0020,  $0120   ; D189   0020 0360 0020 0120
        DECLE   $0040,  $0040,  $0300,  $0100   ; D18D   0040 0040 0300 0100
        DECLE   $0200,  $0000,  $0000,  $0138   ; D191   0200 0000 0000 0138
        DECLE   $007C,  $027E                   ; D195   007C 027E

        CMPR    R7,     R6                      ; D197   017E
        CMPI    #$007E, R6                      ; D198   037E 007E
L_D19A:
        CMPR    R7,     R6                      ; D19A   017E
        DECLE   $007E,  $027C,  $037C,  $027C   ; D19B   007E 027C 037C 027C
        DECLE   $0138,  $0000,  $0200,  $0000   ; D19F   0138 0000 0200 0000
        DECLE   $0000                           ; D1A3   0000

        INCR    R0                              ; D1A4   0008
        B       L_D2B7                          ; D1A5   0200 0110

        DECLE   $0018,  $0208,  $0308,  $0110   ; D1A7   0018 0208 0308 0110
        DECLE   $0030,  $0030,  $0130,  $0010   ; D1AB   0030 0030 0130 0010
        DECLE   $0210,  $0104,  $0200,  $0008   ; D1AF   0210 0104 0200 0008
        DECLE   $0108,  $0000,  $0210,  $0210   ; D1B3   0108 0000 0210 0210
        DECLE   $0208,  $010C,  $000E,  $0206   ; D1B7   0208 010C 000E 0206
        DECLE   $0206,  $0004,  $0000           ; D1BB   0206 0004 0000

        B       L_D2C0                          ; D1BE   0200 0100
        B       L_D3E2                          ; D1C0   0200 0220

        DECLE   $0100,  $0110,  $0000,  $0010   ; D1C2   0100 0110 0000 0010
        DECLE   $0118,  $001C,  $020C,  $010C   ; D1C6   0118 001C 020C 010C
        DECLE   $0308,  $0010,  $0100,  $0000   ; D1CA   0308 0010 0100 0000

        B       L_D4D0                          ; D1CE   0200 0300
        B       L_D2D2                          ; D1D0   0200 0100

        DECLE   $0020,  $0200                   ; D1D2   0020 0200

        NEGR    R0                              ; D1D4   0020
        DECR    R0                              ; D1D5   0010
        DECR    R0                              ; D1D6   0010
        B       L_D0B8                          ; D1D7   0220 0120

        DECLE   $0030,  $0230,  $0030,  $0110   ; D1D9   0030 0230 0030 0110
        DECLE   $0010,  $0000,  $0100,  $0000   ; D1DD   0010 0000 0100 0000
        DECLE   $0200,  $0101,  $0201,  $0003   ; D1E1   0200 0101 0201 0003
        DECLE   $0103,  $0007,  $0207,  $020F   ; D1E5   0103 0007 0207 020F
        DECLE   $020F,  $011F,  $001F,  $023F   ; D1E9   020F 011F 001F 023F
        DECLE   $027F,  $007F,  $007F,  $023C   ; D1ED   027F 007F 007F 023C
        DECLE   $013C,  $023C,  $023C,  $013C   ; D1F1   013C 023C 023C 013C
        DECLE   $023C,  $003C,  $003C,  $0100   ; D1F5   023C 003C 003C 0100
        DECLE   $00C4,  $02E5,  $01F4,  $03FC   ; D1F9   00C4 02E5 01F4 03FC
        DECLE   $00BC,  $019C,  $008C,  $0200   ; D1FD   00BC 019C 008C 0200
        DECLE   $0360                           ; D201   0360

        ADD@    R6,     R7                      ; D202   02F7
        ADDR    R4,     R7                      ; D203   00E7

        DECLE   $02E3,  $02E3,  $00E1,  $0079   ; D204   02E3 02E3 00E1 0079
        DECLE   $0008,  $0108,  $0210,  $0010   ; D208   0008 0108 0210 0010
        DECLE   $02A0,  $03A0,  $01E0,  $00C0   ; D20C   02A0 03A0 01E0 00C0
        DECLE   $0000,  $0100,  $0000           ; D210   0000 0100 0000

        SUBR    R0,     R0                      ; D213   0100
        B       L_D416                          ; D214   0200 0200

        DECLE   $0000,  $0000,  $0200,  $0200   ; D216   0000 0000 0200 0200
        DECLE   $0200,  $0200,  $0000,  $0210   ; D21A   0200 0200 0000 0210
        DECLE   $0244,  $022A,  $0000,  $0000   ; D21E   0244 022A 0000 0000
        DECLE   $0100,  $0220                   ; D222   0100 0220

        MVO     R0,     .BTAB.41                ; D224   0240 0241
        TSTR    R2                              ; D226   0092
        ADD@    R3,     R2                      ; D227   02DA
        B       L_D42A                          ; D228   0200 0200

        DECLE   $0100,  $0040,  $01B4,  $0209   ; D22A   0100 0040 01B4 0209
        DECLE   $0240,  $0100,  $0188,  $0101   ; D22E   0240 0100 0188 0101
        DECLE   $0048,  $0004                   ; D232   0048 0004

        SUB@    R4,     R1                      ; D234   0321
L_D235:
        MOVR    R0,     R4                      ; D235   0084
        SUBR    R4,     R0                      ; D236   0120
        EIS                                     ; D237   0002
        JD      L_518A                          ; D238   0004 0352 018A

        DECLE   $0204,  $0224,  $0041,  $0152   ; D23B   0204 0224 0041 0152
        DECLE   $021A,  $0224,  $008A,  $0020   ; D23F   021A 0224 008A 0020
        DECLE   $0105,  $0200,  $0100           ; D243   0105 0200 0100

        B       L_D248                          ; D246   0200 0000

L_D248:
        SUB     G_0177, R0                      ; D248   0300 0177
        DECLE   $0200,  $00FF,  $00FF,  $01FF   ; D24A   0200 00FF 00FF 01FF
        DECLE   $00FF,  $02FF,  $02FF,  $00FF   ; D24E   00FF 02FF 02FF 00FF
        DECLE   $01FF,  $00FF,  $01FF,  $02FF   ; D252   01FF 00FF 01FF 02FF
        DECLE   $0077                           ; D256   0077

        SUB     G_01DD, R0                      ; D257   0300 01DD
        ADD@    R3,     R5                      ; D259   02DD
        B       L_D317                          ; D25A   0200 00BB

        DECLE   $01BB,  $0200,  $02DD,  $00DD   ; D25C   01BB 0200 02DD 00DD
        DECLE   $00DC,  $01DC,  $0200,  $01C0   ; D260   00DC 01DC 0200 01C0
        DECLE   $02C0,  $0000,  $0380,  $0180   ; D264   02C0 0000 0380 0180
        DECLE   $021D,  $000D,  $0000           ; D268   021D 000D 0000

        SUBR    R0,     R3                      ; D26B   0103
        DIS                                     ; D26C   0003
        B       L_D470                          ; D26D   0200 0201

        DECLE   $0001                           ; D26F   0001
L_D270:
        XORR    R3,     R4                      ; D270   01DC
        DECLE   $00B2,  $016C,  $027F           ; D271   00B2 016C 027F

        ADDR    R7,     R1                      ; D274   00F9
        XOR@    R6,     R4                      ; D275   03F4
        SLR     R2,     2                       ; D276   0066
        SUBR    R4,     R2                      ; D277   0122
        COMR    R6                              ; D278   001E
        RRC     R3,     1                       ; D279   0073
        ANDR    R3,     R6                      ; D27A   019E
        SUBI    #$0077, R1                      ; D27B   0339 0077
        ADD@    R5,     R6                      ; D27D   02EE
L_D27E:
        MVI@    R3,     R0                      ; D27E   0298
        DECLE   $0010,  $0030,  $024E,  $0273   ; D27F   0010 0030 024E 0273
        DECLE   $02FB,  $021D,  $03C6,  $0072   ; D283   02FB 021D 03C6 0072
        DECLE   $0210,  $0038,  $0030,  $0038   ; D287   0210 0038 0030 0038
        DECLE   $0030,  $0238,  $0070,  $0260   ; D28B   0030 0238 0070 0260
        DECLE   $0370,  $00C0,  $02E0,  $00C0   ; D28F   0370 00C0 02E0 00C0
        DECLE   $00E0,  $00C0,  $00E0,  $02C0   ; D293   00E0 00C0 00E0 02C0
        DECLE   $00E0,  $020D,  $031F,  $001D   ; D297   00E0 020D 031F 001D
        DECLE   $023F,  $023F,  $0077,  $007F   ; D29B   023F 023F 0077 007F
        DECLE   $00DD,  $02DE,  $027F           ; D29F   00DD 02DE 027F

        ADDI    #$03BF, R5                      ; D2A2   02FD 03BF
        SARC    R3,     2                       ; D2A4   007F
        ADD@    R3,     R3                      ; D2A5   02DB
        MVI@    R4,     R6                      ; D2A6   02A6
        COMR    R1                              ; D2A7   0019
        TSTR    R0                              ; D2A8   0080
        SLR     R0,     1                       ; D2A9   0060
        MVI@    R2,     R0                      ; D2AA   0290
        MVI@    R5,     R4                      ; D2AB   02AC
        MVO@    R2,     R4                      ; D2AC   0262
        XOR@    R2,     R0                      ; D2AD   03D0
        SAR     R1,     2                       ; D2AE   006D
L_D2AF:
        ADD@    R2,     R4                      ; D2AF   02D4
        DECLE   $0200,  $0100,  $0000,  $0000   ; D2B0   0200 0100 0000 0000

        B       L_D4D0                          ; D2B4   0200 021A

        CMPR    R7,     R5                      ; D2B6   017D
L_D2B7:
        ADDR    R7,     R6                      ; D2B7   00FE
        DECLE   $00FF,  $00FF,  $00FF,  $03FF   ; D2B8   00FF 00FF 00FF 03FF
        DECLE   $00FF,  $01FF,  $00FF,  $00FF   ; D2BC   00FF 01FF 00FF 00FF
L_D2C0:
        SUB     .UART.0,R0                      ; D2C0   0300 00E0
        DECLE   $03F8,  $00FC,  $00FC,  $01F8   ; D2C2   03F8 00FC 00FC 01F8
        DECLE   $00F8,  $0300,  $01BB,  $03DD   ; D2C6   00F8 0300 01BB 03DD
        DECLE   $0000                           ; D2CA   0000

        ADDR    R5,     R6                      ; D2CB   00EE
        SUBR    R0,     R0                      ; D2CC   0100
        MVII    #$0300, R3                      ; D2CD   02BB 0300
        ADD@    R3,     R3                      ; D2CF   02DB
        DIS                                     ; D2D0   0003
        SUBR    R1,     R1                      ; D2D1   0109
L_D2D2:
        BEQ     L_D2F5                          ; D2D2   0204 0021

        DECLE   $0010,  $0047,  $0320,  $010D   ; D2D4   0010 0047 0320 010D
        DECLE   $0000,  $0280,  $0200,  $02C0   ; D2D8   0000 0280 0200 02C0
        DECLE   $0000,  $00B0,  $0100,  $0068   ; D2DC   0000 00B0 0100 0068
        DECLE   $0302,  $0101,  $020F           ; D2E0   0302 0101 020F

        RLC     R2,     2                       ; D2E3   0056
        ADCR    R7                              ; D2E4   002F

        ANDR    R7,     R3                      ; D2E5   01BB
L_D2E6:
        MVO@    R7,     R2                      ; D2E6   0257
        ADDI    #$0240, R6                      ; D2E7   02FE 0240
        TSTR    R0                              ; D2E9   0080
        XORR    R5,     R0                      ; D2EA   01E8
        ADD@    R2,     R2                      ; D2EB   02D2
        ADDI    #$00ED, R4                      ; D2EC   02FC 00ED
        SARC    R2,     2                       ; D2EE   007E
        XOR@    R6,     R2                      ; D2EF   03F2
        ANDR    R5,     R2                      ; D2F0   01AA
        ADD@    R5,     R6                      ; D2F1   02EE
        MVO@    R7,     R2                      ; D2F2   0257
        SLLC    R3,     1                       ; D2F3   005B
L_D2F4:
        MVO@    R2,     R3                      ; D2F4   025A
L_D2F5:
        TSTR    R4                              ; D2F5   00A4
        DECLE   $004A,  $0180,  $0000,  $0300   ; D2F6   004A 0180 0000 0300
        DECLE   $0100,  $0300,  $0000,  $0000   ; D2FA   0100 0300 0000 0000
        DECLE   $011C,  $021C,  $0300,  $0200   ; D2FE   011C 021C 0300 0200
        DECLE   $0000,  $011C,  $021C,  $0000   ; D302   0000 011C 021C 0000
        DECLE   $0077,  $0077,  $0318,  $0118   ; D306   0077 0077 0318 0118
        DECLE   $0000,  $0276,  $0376,  $0100   ; D30A   0000 0276 0376 0100
        DECLE   $00DB,  $00DB,  $0100,  $0020   ; D30E   00DB 00DB 0100 0020
        DECLE   $0370,  $0138,  $021C           ; D312   0370 0138 021C

        COMR    R6                              ; D315   001E
L_D316:
        DECR    R7                              ; D316   0017

L_D317:
        SUBR    R4,     R2                      ; D317   0122
        DECLE   $0200,  $0204,  $020E,  $001C   ; D318   0200 0204 020E 001C
        DECLE   $0138,  $0278                   ; D31C   0138 0278

        ADD@    R5,     R0                      ; D31E   02E8
        SWAP    R0,     2                       ; D31F   0044
L_D320:
        MOVR    R4,     R6                      ; D320   00A6
        DECLE   $035B,  $01FF,  $02FF,  $02FF   ; D321   035B 01FF 02FF 02FF
        DECLE   $00FF,  $03FE,  $0059,  $0006   ; D325   00FF 03FE 0059 0006
        DECLE   $011B,  $007F,  $03FF,  $01FF   ; D329   011B 007F 03FF 01FF
        DECLE   $03FF                           ; D32D   03FF

        SARC    R2,     2                       ; D32E   007E
        COMR    R1                              ; D32F   0019
        ANDR    R0,     R0                      ; D330   0180
        MVO@    R0,     R2                      ; D331   0250
        XORI    #$02FE, R4                      ; D332   03FC 02FE
        XORI    #$02FA, R6                      ; D334   03FE 02FA
        ADDI    #$0050, R4                      ; D336   02FC 0050
        ADDR    R4,     R0                      ; D338   00E0
        XORI    #$01EF, R4                      ; D339   03FC 01EF
        ADDI    #$00BF, R7                      ; D33B   02FF 00BF
        ADDI    #$027F, R7                      ; D33D   02FF 027F

        DECLE   $02FF,  $0000,  $0000           ; D33F   02FF 0000 0000

        ANDR    R0,     R0                      ; D342   0180
        XOR@    R6,     R0                      ; D343   03F0
        XORR    R7,     R6                      ; D344   01FE
        ADD@    R6,     R7                      ; D345   02F7

        DECLE   $02BF,  $00FF,  $0300,  $0200   ; D346   02BF 00FF 0300 0200
        DECLE   $0200,  $0200                   ; D34A   0200 0200

        B       L_D70E                          ; D34C   0200 03C0

        ADDI    #$02FF, R0                      ; D34E   02F8 02FF
        ADDI    #$00FF, R6                      ; D350   02FE 00FF
        XORI    #$01FF, R5                      ; D352   03FD 01FF
        ADDI    #$02FF, R3                      ; D354   02FB 02FF
        ADDI    #$03FF, R3                      ; D356   02FB 03FF
        ADDI    #$02FF, R7                      ; D358   02FF 02FF
        ADDI    #$01FF, R7                      ; D35A   02FF 01FF

        DECLE   $03FF,  $01FF,  $02FF,  $02FF   ; D35C   03FF 01FF 02FF 02FF
        DECLE   $01FD,  $00F7,  $02EF,  $00FF   ; D360   01FD 00F7 02EF 00FF
        DECLE   $00BF,  $03FF,  $037F,  $01FF   ; D364   00BF 03FF 037F 01FF
        DECLE   $00E0,  $00F8,  $03FC,  $00FE   ; D368   00E0 00F8 03FC 00FE
        DECLE   $03FE,  $02FF,  $00FF,  $01FF   ; D36C   03FE 02FF 00FF 01FF
        DECLE   $019B,  $0387,  $0081,  $0081   ; D370   019B 0387 0081 0081
        DECLE   $01E1,  $01F9,  $02FB,  $02FB   ; D374   01E1 01F9 02FB 02FB
        DECLE   $00FE,  $03FF,  $03FE,  $02FE   ; D378   00FE 03FF 03FE 02FE
        DECLE   $02FE,  $00FE,  $01FE,  $00FE   ; D37C   02FE 00FE 01FE 00FE
        DECLE   $03FF,  $00FF,  $00FF,  $01FF   ; D380   03FF 00FF 00FF 01FF
        DECLE   $03FF,  $01FC,  $02F0,  $00F0   ; D384   03FF 01FC 02F0 00F0
        DECLE   $03FF,  $00FF,  $03FF           ; D388   03FF 00FF 03FF

        ADD@    R1,     R7                      ; D38B   02CF
        INCR    R7                              ; D38C   000F
        SUBR    R1,     R7                      ; D38D   010F
L_D38E:
        SUBR    R1,     R7                      ; D38E   010F
        SUB@    R1,     R7                      ; D38F   030F

        DECLE   $00FB,  $00FB,  $01FB,  $011B   ; D390   00FB 00FB 01FB 011B
        DECLE   $0203,  $0200,  $0000,  $0300   ; D394   0203 0200 0000 0300
        DECLE   $03FE,  $02FE,  $02FE,  $00FE   ; D398   03FE 02FE 02FE 00FE
        DECLE   $01FE,  $007E,  $030E,  $0000   ; D39C   01FE 007E 030E 0000
        DECLE   $00F0,  $01F0,  $03F0,  $01F0   ; D3A0   00F0 01F0 03F0 01F0
        DECLE   $02F0,  $00F0,  $03F0,  $03C0   ; D3A4   02F0 00F0 03F0 03C0
        DECLE   $010F,  $000C,  $0000,  $0100   ; D3A8   010F 000C 0000 0100
        DECLE   $0300,  $0000,  $0200,  $0200   ; D3AC   0300 0000 0200 0200
        DECLE   $000F,  $03FF,  $02FF,  $02FF   ; D3B0   000F 03FF 02FF 02FF
        DECLE   $02FF,  $02FF                   ; D3B4   02FF 02FF

        ADDI    #$01FF, R7                      ; D3B6   02FF 01FF
        B       L_D4AB                          ; D3B8   0200 00F1

        DECLE   $00FF,  $03FF,  $03FF,  $01FF   ; D3BA   00FF 03FF 03FF 01FF
        DECLE   $00FF,  $02FF                   ; D3BE   00FF 02FF

        ADDI    #$01FF, R7                      ; D3C0   02FF 01FF
        ADDI    #$00FF, R7                      ; D3C2   02FF 00FF

        DECLE   $00FF,  $03FF,  $03FF,  $010F   ; D3C4   00FF 03FF 03FF 010F
        DECLE   $00FF,  $02FF,  $02FF,  $01FF   ; D3C8   00FF 02FF 02FF 01FF
        DECLE   $02FF,  $02FF                   ; D3CC   02FF 02FF

        ADDR    R0,     R1                      ; D3CE   00C1
        SUB     G_03AA, R0                      ; D3CF   0300 03AA
        ANDR    R4,     R4                      ; D3D1   01A4
        MVI@    R5,     R2                      ; D3D2   02AA
        MVI@    R5,     R2                      ; D3D3   02AA
        MVI@    R5,     R2                      ; D3D4   02AA
        ANDR    R2,     R2                      ; D3D5   0192
        MVI@    R5,     R1                      ; D3D6   02A9
        MVI@    R5,     R2                      ; D3D7   02AA
        MOVR    R5,     R2                      ; D3D8   00AA
        AND@    R4,     R4                      ; D3D9   03A4
        CMP@    R1,     R2                      ; D3DA   034A
        ANDR    R5,     R2                      ; D3DB   01AA
        MVI@    R5,     R2                      ; D3DC   02AA
        MVI@    R2,     R2                      ; D3DD   0292
        BNC     L_D235                          ; D3DE   0229 01AA

        MVI@    R5,     R2                      ; D3E0   02AA
        SLL     R2,     1                       ; D3E1   004A
L_D3E2:
        ANDR    R4,     R4                      ; D3E2   01A4
        DECLE   $03AA,  $0392,  $01AA,  $002A   ; D3E3   03AA 0392 01AA 002A
        DECLE   $03AA,  $0000,  $0200,  $0200   ; D3E7   03AA 0000 0200 0200
        DECLE   $0000,  $0101,  $0007,  $001F   ; D3EB   0000 0101 0007 001F
        DECLE   $027F,  $0000,  $0100,  $0000   ; D3EF   027F 0000 0100 0000
        DECLE   $0100,  $0080,  $00E0,  $02F8   ; D3F3   0100 0080 00E0 02F8
        DECLE   $01FE,  $0101,  $0007,  $001F   ; D3F7   01FE 0101 0007 001F
        DECLE   $027F                           ; D3FB   027F
L_D3FC:
        SUBI    #$014F, R7                      ; D3FC   033F 014F

L_D3FE:
        RRC     R3,     1                       ; D3FE   0073
        SARC    R0,     2                       ; D3FF   007C
        ADDI    #$00FF, R7                      ; D400   02FF 00FF

        DECLE   $02FF,  $00FF,  $00FC,  $02F3   ; D402   02FF 00FF 00FC 02F3
        DECLE   $01CF,  $023E,  $00FD,  $00F3   ; D406   01CF 023E 00FD 00F3
        DECLE   $01CF,  $003F,  $02FF,  $01E7   ; D40A   01CF 003F 02FF 01E7
        DECLE   $0387,  $005F,  $017E,  $007E   ; D40E   0387 005F 017E 007E
        DECLE   $027E                           ; D412   027E

        CMPI    #$023E, R6                      ; D413   037E 023E
        SUBR    R1,     R6                      ; D415   010E
L_D416:
        EIS                                     ; D416   0002
        B       L_D511                          ; D417   0200 00F8

        DECLE   $00F9,  $00FF,  $02FF,  $01FF   ; D419   00F9 00FF 02FF 01FF
        DECLE   $00FC,  $02F0,  $03C0,  $012F   ; D41D   00FC 02F0 03C0 012F
        DECLE   $00D4,  $00E8,  $01C0,  $0000   ; D421   00D4 00E8 01C0 0000

        B       L_D527                          ; D425   0200 0100
        B       L_D488                          ; D427   0200 005F

        ANDR    R5,     R4                      ; D429   01AC
L_D42A:
        MOVR    R5,     R0                      ; D42A   00A8
        DECLE   $02C0,  $0200,  $0200,  $0100   ; D42B   02C0 0200 0200 0100
        DECLE   $0000,  $0213                   ; D42F   0000 0213

        ADD@    R4,     R4                      ; D431   02E4
        ADDR    R6,     R0                      ; D432   00F0
        ADDR    R0,     R0                      ; D433   00C0
        B       L_D536                          ; D434   0200 0100

        DECLE   $0200,  $0200,  $01BF,  $01CF   ; D436   0200 0200 01BF 01CF
        DECLE   $00F3,  $00FC,  $01FF           ; D43A   00F3 00FC 01FF

        ADDR    R4,     R7                      ; D43D   00E7

        ADD@    R4,     R1                      ; D43E   02E1
        XORR    R7,     R2                      ; D43F   01FA
        ADDI    #$00FF, R7                      ; D440   02FF 00FF

        DECLE   $01FF,  $00FF,  $023F,  $02CF   ; D442   01FF 00FF 023F 02CF
        DECLE   $02F3,  $017C,  $0080,  $02E0   ; D446   02F3 017C 0080 02E0
        DECLE   $02F8,  $00FE,  $00FC,  $02F2   ; D44A   02F8 00FE 00FC 02F2
        DECLE   $01CE,  $023E                   ; D44E   01CE 023E

        ADD@    R6,     R4                      ; D450   02F4
        ADCR    R3                              ; D451   002B
        SUBR    R2,     R7                      ; D452   0117

        DECLE   $0003,  $0000,  $0100,  $0200   ; D453   0003 0000 0100 0200

        B       L_D578                          ; D457   0200 011F
        MVI@    R3,     R7                      ; D459   029F

        DECLE   $00FF,  $03FF,  $00FF,  $023F   ; D45A   00FF 03FF 00FF 023F
        DECLE   $020F,  $0203,  $007E,  $017E   ; D45E   020F 0203 007E 017E
        DECLE   $027E,  $027E,  $007C,  $0070   ; D462   027E 027E 007C 0070
        DECLE   $0340,  $0100,  $02C8,  $0227   ; D466   0340 0100 02C8 0227
        DECLE   $020F,  $0303,  $0000,  $0000   ; D46A   020F 0303 0000 0000

        SUBR    R0,     R0                      ; D46E   0100
        SUBR    R0,     R0                      ; D46F   0100
L_D470:
        XORI    #$0135, R2                      ; D470   03FA 0135
        SUB@    R2,     R5                      ; D472   0315
        DIS                                     ; D473   0003
        B       L_D576                          ; D474   0200 0100
        B       L_D778                          ; D476   0200 0300

        MVO@    R5,     R2                      ; D478   0255
        MVI@    R5,     R2                      ; D479   02AA
        CMPR    R2,     R5                      ; D47A   0155
        MVI@    R5,     R2                      ; D47B   02AA
        RLC     R1,     2                       ; D47C   0055
        MOVR    R5,     R2                      ; D47D   00AA
        CMPR    R2,     R5                      ; D47E   0155
        AND@    R5,     R2                      ; D47F   03AA
        CMPR    R3,     R4                      ; D480   015C
        MOVR    R5,     R0                      ; D481   00A8
        MVO@    R0,     R3                      ; D482   0258
        MOVR    R5,     R0                      ; D483   00A8
        CMP@    R2,     R4                      ; D484   0354
        MOVR    R5,     R4                      ; D485   00AC
        RLC     R2,     2                       ; D486   0056
        ANDR    R5,     R2                      ; D487   01AA
L_D488:
        CMPR    R2,     R5                      ; D488   0155
        DECLE   $03AA,  $0157,  $02BF,  $005F   ; D489   03AA 0157 02BF 005F
        DECLE   $02BF,  $017C,  $02B8,  $0255   ; D48D   02BF 017C 02B8 0255
        DECLE   $02A9,  $02D5,  $01FA,  $02FD   ; D491   02A9 02D5 01FA 02FD
        DECLE   $021F,  $0000                   ; D495   021F 0000

        SUBR    R0,     R0                      ; D497   0100
        CMPI    #$01B8, R0                      ; D498   0378 01B8
        PSHR    R0                              ; D49A   0270
        PULR    R0                              ; D49B   02B0
        PSHR    R0                              ; D49C   0270
        ANDR    R6,     R0                      ; D49D   01B0
        MVO@    R0,     R3                      ; D49E   0258
        MOVR    R5,     R4                      ; D49F   00AC
        SUBR    R0,     R0                      ; D4A0   0100
        AND@    R4,     R0                      ; D4A1   03A0
        MVO@    R4,     R2                      ; D4A2   0254
        MOVR    R5,     R2                      ; D4A3   00AA
        RLC     R2,     2                       ; D4A4   0056
        ANDR    R5,     R2                      ; D4A5   01AA
        CMPR    R2,     R6                      ; D4A6   0156
        AND@    R5,     R4                      ; D4A7   03AC
        ANDR    R5,     R2                      ; D4A8   01AA
        RLC     R1,     2                       ; D4A9   0055
        AND@    R5,     R2                      ; D4AA   03AA
L_D4AB:
        CMPR    R2,     R5                      ; D4AB   0155
        DECLE   $02AA,  $0055,  $00AA,  $0155   ; D4AC   02AA 0055 00AA 0155
        DECLE   $013A,  $0315,  $011A,  $0215   ; D4B0   013A 0315 011A 0215
        DECLE   $002A,  $0235,  $016A,  $0255   ; D4B4   002A 0235 016A 0255
        DECLE   $02AA,  $0295,  $00AB,  $025F   ; D4B8   02AA 0295 00AB 025F
        DECLE   $02BF                           ; D4BC   02BF

        ADDI    #$0000, R0                      ; D4BD   02F8 0000
        SUBR    R0,     R0                      ; D4BF   0100
        AND@    R5,     R2                      ; D4C0   03AA
        CMPR    R2,     R5                      ; D4C1   0155
        ADD@    R5,     R2                      ; D4C2   02EA
L_D4C3:
        ADDI    #$01FA, R5                      ; D4C3   02FD 01FA
        DECLE   $01FD,  $003E,  $001D,  $011E   ; D4C5   01FD 003E 001D 011E
        DECLE   $001D,  $000E,  $020D,  $030E   ; D4C9   001D 000E 020D 030E
        DECLE   $000D,  $011A,  $0235           ; D4CD   000D 011A 0235
L_D4D0:
        B       L_D7D7                          ; D4D0   0200 0305

        DECLE   $022A,  $0055,  $026A,  $0255   ; D4D2   022A 0055 026A 0255
        DECLE   $006A,  $0035                   ; D4D6   006A 0035

        SUB     G_0303, R0                      ; D4D8   0300 0303
        SUBR    R3,     R7                      ; D4DA   011F

        DECLE   $007F,  $00BF,  $00CF,  $01F7   ; D4DB   007F 00BF 00CF 01F7
        DECLE   $00FA,  $00E0,  $02FC,  $02FF   ; D4DF   00FA 00E0 02FC 02FF
        DECLE   $01FF                           ; D4E3   01FF

        ADDI    #$02F1, R6                      ; D4E4   02FE 02F1
        MOVR    R1,     R7                      ; D4E6   008F

        DECLE   $017E,  $0300,  $0100,  $0200   ; D4E7   017E 0300 0100 0200
        DECLE   $00A0,  $0250,  $00F0,  $00B0   ; D4EB   00A0 0250 00F0 00B0
        DECLE   $0230                           ; D4EF   0230

        ADDI    #$00FD, R5                      ; D4F0   02FD 00FD
        XORR    R7,     R5                      ; D4F2   01FD
        ADDI    #$02FD, R5                      ; D4F3   02FD 02FD
        ADDR    R7,     R5                      ; D4F5   00FD
        ADDR    R7,     R5                      ; D4F6   00FD
        XORI    #$01F0, R5                      ; D4F7   03FD 01F0
        ADD     .IV.ALD,R0                      ; D4F9   02C0 0080
        TSTR    R0                              ; D4FB   0080
        TSTR    R0                              ; D4FC   0080
        TSTR    R0                              ; D4FD   0080
        MVI     .BTAB.80,R0                     ; D4FE   0280 0280
        SUB@    R6,     R0                      ; D500   0330
L_D501:
        GSWD    R0                              ; D501   0030
        DECLE   $0230,  $0230,  $0030,  $0230   ; D502   0230 0230 0030 0230
        DECLE   $0230,  $0130,  $02FD,  $00FD   ; D506   0230 0130 02FD 00FD
        DECLE   $03FD,  $027D,  $003D,  $021D   ; D50A   03FD 027D 003D 021D

        BGE     L_D615                          ; D50E   020D 0105

        TSTR    R0                              ; D510   0080
L_D511:
        MVI     .BTAB.80,R0                     ; D511   0280 0280
        DECLE   $0083,  $008C,  $02B0,  $01C0   ; D513   0083 008C 02B0 01C0
        DECLE   $0200,  $0030                   ; D517   0200 0030

        SUBR    R6,     R0                      ; D519   0130
        ADD     .STIC.X.0,R0                    ; D51A   02C0 0000
        B       L_D71E                          ; D51C   0200 0200

        DECLE   $0000,  $0000                   ; D51E   0000 0000

        B       L_D522                          ; D520   0200 0000

L_D522:
        SUBR    R0,     R0                      ; D522   0100
        SUB     G_010A, R5                      ; D523   0305 010A
        SUBR    R1,     R7                      ; D525   010F

        INCR    R5                              ; D526   000D
L_D527:
        SUBR    R1,     R4                      ; D527   010C
        DECLE   $0007,  $013F,  $00FF,  $00FF   ; D528   0007 013F 00FF 00FF
        DECLE   $037F,  $038F,  $00F1,  $027E   ; D52C   037F 038F 00F1 027E

        B       L_D6F2                          ; D530   0200 01C0

        ADDR    R7,     R0                      ; D532   00F8
        XORI    #$01FD, R6                      ; D533   03FE 01FD
        ADDR    R6,     R3                      ; D535   00F3
L_D536:
        ADD@    R5,     R7                      ; D536   02EF

        DECLE   $035F,  $020C,  $010C,  $000C   ; D537   035F 020C 010C 000C
        DECLE   $020C,  $000C,  $030C,  $010C   ; D53B   020C 000C 030C 010C
        DECLE   $000C,  $020F                   ; D53F   000C 020F
L_D541:
        BPL     L_D844                          ; D541   0203 0301

        DECLE   $0101,  $0001,  $0201,  $0001   ; D543   0101 0001 0201 0001
        DECLE   $0001,  $02BF,  $02BF,  $00BF   ; D547   0001 02BF 02BF 00BF
        DECLE   $03BF,  $02BF,  $00BF,  $02BF   ; D54B   03BF 02BF 00BF 02BF
        DECLE   $02BF                           ; D54F   02BF

        INCR    R4                              ; D550   000C
        SUB@    R1,     R4                      ; D551   030C
        SUBR    R0,     R3                      ; D552   0103
        B       L_D755                          ; D553   0200 0200

        SUB     .STIC.X.0,R0                    ; D555   0300 0000
        B       L_D75A                          ; D557   0200 0201

        DECLE   $0001,  $0001                   ; D559   0001 0001
L_D55B:
        ADD     .STIC.VDLY,R1                   ; D55B   02C1 0031
        DECLE   $020D,  $0203,  $0000,  $02BF   ; D55D   020D 0203 0000 02BF
        DECLE   $02BF,  $02BF                   ; D561   02BF 02BF

        MOVR    R7,     R6                      ; D563   00BE
        MOVR    R7,     R4                      ; D564   00BC
        ANDR    R7,     R0                      ; D565   01B8
        MOVR    R6,     R0                      ; D566   00B0
        MVI@    R4,     R0                      ; D567   02A0
        RRC     R0,     2                       ; D568   0074
        MVI@    R1,     R7                      ; D569   028F

        DECLE   $01B1,  $024F,  $0292,  $02EB   ; D56A   01B1 024F 0292 02EB
        DECLE   $004D,  $027A,  $020E,  $0271   ; D56E   004D 027A 020E 0271
        DECLE   $004E,  $01B7                   ; D572   004E 01B7

        MVO@    R5,     R5                      ; D574   026D
        ADDR    R3,     R1                      ; D575   00D9
L_D576:
        MVI@    R5,     R2                      ; D576   02AA
        SAR     R0,     2                       ; D577   006C
L_D578:
        GSWD    R0                              ; D578   0030
        DECLE   $018E,  $0281,  $0263,  $02C2   ; D579   018E 0281 0263 02C2
        DECLE   $0088,  $0059,  $002A,  $020E   ; D57D   0088 0059 002A 020E
        DECLE   $023E,  $016D,  $03FF,  $03BB   ; D581   023E 016D 03FF 03BB
        DECLE   $0076,  $002A,  $019C,  $02DD   ; D585   0076 002A 019C 02DD
        DECLE   $00DD,  $0200                   ; D589   00DD 0200

        MVII    #$01BB, R3                      ; D58B   02BB 01BB
        B       L_D66C                          ; D58D   0200 00DD

        DECLE   $00DD,  $025F,  $017F,  $025F   ; D58F   00DD 025F 017F 025F
        DECLE   $007F,  $005F,  $027F,  $015F   ; D593   007F 005F 027F 015F
        DECLE   $027F,  $00FE,  $02FE,  $02FE   ; D597   027F 00FE 02FE 02FE
        DECLE   $01FE,  $02FE,  $00FE,  $00FE   ; D59B   01FE 02FE 00FE 00FE
        DECLE   $02FE,  $017F,  $027F,  $007F   ; D59F   02FE 017F 027F 007F
        DECLE   $007F,  $027F,  $017F,  $027F   ; D5A3   007F 027F 017F 027F
        DECLE   $007F,  $00FA,  $02FE,  $01FA   ; D5A7   007F 00FA 02FE 01FA
        DECLE   $02FE,  $00FA,  $00FE,  $02FA   ; D5AB   02FE 00FA 00FE 02FA
        DECLE   $01FE,  $027F                   ; D5AF   01FE 027F

        SLLC    R3,     2                       ; D5B1   005F
        SARC    R3,     2                       ; D5B2   007F
        MVO@    R7,     R3                      ; D5B3   025F
        CMPR    R7,     R7                      ; D5B4   017F
        MVO@    R7,     R3                      ; D5B5   025F
        SARC    R3,     2                       ; D5B6   007F
L_D5B7:
        SLLC    R3,     2                       ; D5B7   005F
        ADD@    R6,     R0                      ; D5B8   02F0
        XORR    R6,     R0                      ; D5B9   01F0
        ADD@    R6,     R0                      ; D5BA   02F0
        ADDR    R6,     R0                      ; D5BB   00F0
        ADD@    R6,     R0                      ; D5BC   02F0
        ADD@    R6,     R0                      ; D5BD   02F0
L_D5BE:
        XORR    R6,     R0                      ; D5BE   01F0
        DECLE   $02F0,  $000F                   ; D5BF   02F0 000F
L_D5C1:
        BESC    L_D7D2                          ; D5C1   020F 020F
        SUBR    R1,     R7                      ; D5C3   010F

        DECLE   $020F,  $000F,  $020F,  $020F   ; D5C4   020F 000F 020F 020F
        DECLE   $01FE,  $02FA,  $00FE,  $02FA   ; D5C8   01FE 02FA 00FE 02FA
        DECLE   $02FE,  $01FA,  $02FE,  $00FA   ; D5CC   02FE 01FA 02FE 00FA
        DECLE   $027F,  $025F,  $017F,  $025F   ; D5D0   027F 025F 017F 025F
        DECLE   $007F,  $005F,  $027E,  $0150   ; D5D4   007F 005F 027E 0150
        DECLE   $02F0,  $00F0,  $00F0,  $02F0   ; D5D8   02F0 00F0 00F0 02F0
        DECLE   $01F0,  $02C0,  $0000,  $0000   ; D5DC   01F0 02C0 0000 0000
        DECLE   $020F,  $010F,  $020F,  $000F   ; D5E0   020F 010F 020F 000F
        DECLE   $000F                           ; D5E4   000F

        BPL     L_D6E7                          ; D5E5   0203 0100
        B       L_D6E7                          ; D5E7   0200 00FE

        DECLE   $00FA,  $02FE,  $01FA,  $02FE   ; D5E9   00FA 02FE 01FA 02FE
        DECLE   $00FA,  $007E,  $020A,  $013F   ; D5ED   00FA 007E 020A 013F
        DECLE   $027F,  $003F,  $027F,  $023F   ; D5F1   027F 003F 027F 023F
        DECLE   $017F,  $023F,  $007F,  $0000   ; D5F5   017F 023F 007F 0000
        DECLE   $0200,  $0100,  $0200,  $0000   ; D5F9   0200 0100 0200 0000
        DECLE   $0000                           ; D5FD   0000

        B       L_D700                          ; D5FE   0200 0100
        B       L_D602                          ; D600   0200 0000
L_D602:
        B       L_D804                          ; D602   0200 0200

        SUBR    R0,     R0                      ; D604   0100
        B       L_D607                          ; D605   0200 0000
L_D607:
        B       L_D905                          ; D607   0200 02FC

        DECLE   $01FE,  $02FC,  $00FE,  $00FC   ; D609   01FE 02FC 00FE 00FC
        DECLE   $02FE,  $01FC,  $02FE,  $003F   ; D60D   02FE 01FC 02FE 003F
        DECLE   $007F,  $023E,  $017C,  $0238   ; D611   007F 023E 017C 0238
L_D615:
        RRC     R0,     1                       ; D615   0070
        DECLE   $0020,  $0240,  $0100,  $0200   ; D616   0020 0240 0100 0200
        DECLE   $0000,  $0000                   ; D61A   0000 0000

        B       L_D71E                          ; D61C   0200 0100
        B       L_D620                          ; D61E   0200 0000
L_D620:
        B       L_D822                          ; D620   0200 0200

        DECLE   $0100,  $0200,  $0000,  $0000   ; D622   0100 0200 0000 0000
        DECLE   $0200,  $0100,  $02FC,  $00FE   ; D626   0200 0100 02FC 00FE
        DECLE   $007C,  $023E,  $011C,  $020E   ; D62A   007C 023E 011C 020E
        DECLE   $0004                           ; D62E   0004

        EIS                                     ; D62F   0002
        MVO     R0,     G_0140                  ; D630   0240 0140
        ADD     G_0040, R0                      ; D632   02C0 0040
        SWAP    R0,     1                       ; D634   0040
        ADD     G_0140, R0                      ; D635   02C0 0140
        MVO     R0,     .STIC.X.0               ; D637   0240 0000
        B       L_D83B                          ; D639   0200 0200

        SUBR    R0,     R0                      ; D63B   0100
        B       L_D63E                          ; D63C   0200 0000
L_D63E:
        B       L_D840                          ; D63E   0200 0200

        DECLE   $0100,  $0200,  $0000,  $0200   ; D640   0100 0200 0000 0200
        DECLE   $0200                           ; D644   0200

        SUBR    R0,     R0                      ; D645   0100
        B       L_D648                          ; D646   0200 0000

L_D648:
        EIS                                     ; D648   0002
        DECLE   $0202,  $0103,  $0202,  $0002   ; D649   0202 0103 0202 0002
        DECLE   $0003,  $0202,  $0102,  $0200   ; D64D   0003 0202 0102 0200
        DECLE   $0000,  $001F,  $027F,  $013F   ; D651   0000 001F 027F 013F
        DECLE   $025F,  $004F,  $0048,  $023F   ; D655   025F 004F 0048 023F
L_D659:
        CMPR    R7,     R7                      ; D659   017F
        ADD@    R1,     R7                      ; D65A   02CF

        DECLE   $00F3,  $00FF,  $02F9,  $01FF   ; D65B   00F3 00FF 02F9 01FF
        DECLE   $0239                           ; D65F   0239

        SARC    R3,     2                       ; D660   007F
        ADDR    R3,     R7                      ; D661   00DF
        ADD@    R6,     R7                      ; D662   02F7

        DECLE   $01FD,  $02FF,  $00FE,  $00FF   ; D663   01FD 02FF 00FE 00FF

        ADDI    #$0180, R6                      ; D667   02FE 0180
        ADD@    R4,     R0                      ; D669   02E0
        ADDR    R7,     R0                      ; D66A   00F8
        ADDR    R7,     R4                      ; D66B   00FC
L_D66C:
        ADDI    #$01FE, R6                      ; D66C   02FE 01FE
        ADDI    #$00FE, R7                      ; D66E   02FF 00FE

        DECLE   $0068,  $033F,  $017F,  $022F   ; D670   0068 033F 017F 022F
        DECLE   $005F,  $0227,  $0219,  $0106   ; D674   005F 0227 0219 0106
        DECLE   $023F                           ; D678   023F

        ADDR    R7,     R1                      ; D679   00F9
        ADDI    #$02F9, R7                      ; D67A   02FF 02F9
        MOVR    R5,     R7                      ; D67C   00AF

        DECLE   $007A,  $00FD,  $0085,  $03FF   ; D67D   007A 00FD 0085 03FF
        DECLE   $01FE,  $02FF                   ; D681   01FE 02FF

        ADDR    R7,     R6                      ; D683   00FE
        ADDI    #$0200, R7                      ; D684   02FF 0200

        DECLE   $01FF,  $0200,  $00CC,  $02FC   ; D686   01FF 0200 00CC 02FC
        DECLE   $0278,  $0000,  $0000,  $0000   ; D68A   0278 0000 0000 0000
        DECLE   $0000,  $0300,  $0101,  $0207   ; D68E   0000 0300 0101 0207
        DECLE   $001F,  $003F,  $027F,  $017F   ; D692   001F 003F 027F 017F
        DECLE   $02FF,  $007F,  $00FE,  $02FB   ; D696   02FF 007F 00FE 02FB
        DECLE   $01EF,  $02BF,  $00FF           ; D69A   01EF 02BF 00FF

        SARC    R3,     2                       ; D69D   007F
        ADDI    #$017F, R7                      ; D69E   02FF 017F

        ADDI    #$00FE, R4                      ; D6A0   02FC 00FE
        ADDR    R6,     R3                      ; D6A2   00F3
        ADD@    R1,     R7                      ; D6A3   02CF

        DECLE   $01FF,  $029F,  $00FF           ; D6A4   01FF 029F 00FF

        MOVR    R3,     R4                      ; D6A7   009C
        B       L_D7AA                          ; D6A8   0200 0100

        ADDI    #$00FE, R0                      ; D6AA   02F8 00FE
        ADDR    R7,     R4                      ; D6AC   00FC
L_D6AD:
        ADDI    #$01F2, R2                      ; D6AD   02FA 01F2
        DECLE   $0212,  $00FF,  $007F,  $02FF   ; D6AF   0212 00FF 007F 02FF
        DECLE   $017F,  $02FF,  $0000,  $00FF   ; D6B3   017F 02FF 0000 00FF
        DECLE   $0200                           ; D6B7   0200

        XORR    R7,     R4                      ; D6B8   01FC
        MVI@    R3,     R7                      ; D6B9   029F

        DECLE   $00FF,  $029F,  $02F5,  $015E   ; D6BA   00FF 029F 02F5 015E
        DECLE   $02BF,  $00A1,  $0216           ; D6BE   02BF 00A1 0216

        ADDI    #$00FE, R4                      ; D6C1   02FC 00FE
        ADDR    R6,     R4                      ; D6C3   00F4
        ADDR    R7,     R2                      ; D6C4   00FA
        ADDR    R4,     R4                      ; D6C5   00E4
        AND@    R3,     R0                      ; D6C6   0398
        MVO@    R0,     R4                      ; D6C7   0260
        SUB@    R6,     R3                      ; D6C8   0333
        SUBI    #$001E, R7                      ; D6C9   033F 001E

        DECLE   $0000,  $0300,  $0300,  $0300   ; D6CB   0000 0300 0300 0300
        DECLE   $0000,  $001F,  $0007,  $0003   ; D6CF   0000 001F 0007 0003
        DECLE   $0103,  $0201,  $0101,  $0001   ; D6D3   0103 0201 0101 0001
        DECLE   $0101,  $02E0,  $0280,  $0380   ; D6D7   0101 02E0 0280 0380
        DECLE   $0200,  $0000,  $0000,  $0200   ; D6DB   0200 0000 0000 0200
        DECLE   $0080,  $02FF,  $00FF,  $00FF   ; D6DF   0080 02FF 00FF 00FF

        MVO@    R7,     R1                      ; D6E3   024F
        BUSC    L_D6ED                          ; D6E4   0207 0007

        EIS                                     ; D6E6   0002
L_D6E7:
        BOV     L_D8E8                          ; D6E7   0202 01FF

        XORI    #$02F0, R4                      ; D6E9   03FC 02F0
        ADDR    R4,     R1                      ; D6EB   00E1
        ADDR    R0,     R2                      ; D6EC   00C2
L_D6ED:
        SUBR    R4,     R4                      ; D6ED   0124
        DECLE   $0018,  $0210,  $00FF,  $00FF   ; D6EE   0018 0210 00FF 00FF
L_D6F2:
        SUBR    R0,     R0                      ; D6F2   0100
        DECLE   $0200,  $0000,  $0000,  $0200   ; D6F3   0200 0000 0000 0200
        DECLE   $0001,  $00FF,  $00FF,  $007F   ; D6F7   0001 00FF 00FF 007F
        DECLE   $021F                           ; D6FB   021F

        INCR    R7                              ; D6FC   000F
        SUB@    R4,     R7                      ; D6FD   0327

L_D6FE:
        MVI     .STIC.Y.1,R3                    ; D6FE   0283 0009
L_D700:
        SARC    R3,     2                       ; D700   007F
        DECLE   $003F,  $001F,  $021F,  $001F   ; D701   003F 001F 021F 001F
        DECLE   $000F,  $000F,  $020F,  $0000   ; D705   000F 000F 020F 0000
        DECLE   $0000,  $0200,  $0300           ; D709   0000 0200 0300

        BESC    L_D94D                          ; D70C   020F 023F

L_D70E:
        SARC    R3,     2                       ; D70E   007F
        DECLE   $00FF,  $03FF,  $03F7,  $01F7   ; D70F   00FF 03FF 03F7 01F7
        DECLE   $00F7,  $00F6,  $03F7,  $01F7   ; D713   00F7 00F6 03F7 01F7
        DECLE   $00F7,  $0000,  $0200,  $0000   ; D717   00F7 0000 0200 0000
        DECLE   $0000,  $0081,  $00FF           ; D71B   0000 0081 00FF
L_D71E:
        ADDI    #$02FF, R7                      ; D71E   02FF 02FF

        DECLE   $0301,  $0203,  $001F           ; D720   0301 0203 001F

        SARC    R3,     2                       ; D723   007F
        ADDI    #$00FF, R7                      ; D724   02FF 00FF

        DECLE   $02FF,  $00FF,  $00E0,  $02E0   ; D726   02FF 00FF 00E0 02E0
        DECLE   $02F0,  $00F0,  $00F8,  $02F8   ; D72A   02F0 00F0 00F8 02F8
        DECLE   $01F8,  $03FC,  $027C,  $007C   ; D72E   01F8 03FC 027C 007C
        DECLE   $00FC,  $01FC,  $00FC,  $02FE   ; D732   00FC 01FC 00FC 02FE
        DECLE   $00FE,  $00FF,  $01FF           ; D736   00FE 00FF 01FF

        ADDI    #$00C0, R0                      ; D739   02F8 00C0
        TSTR    R0                              ; D73B   0080
        B       L_D73E                          ; D73C   0200 0000

L_D73E:
        TSTR    R0                              ; D73E   0080
        DECLE   $00C1,  $00C0,  $02D9,  $0000   ; D73F   00C1 00C0 02D9 0000
        DECLE   $0300,  $0200,  $0000,  $0000   ; D743   0300 0200 0000 0000
        DECLE   $0000,  $0000,  $0200,  $0000   ; D747   0000 0000 0200 0000
        DECLE   $0000,  $00FC,  $02FE,  $00FF   ; D74B   0000 00FC 02FE 00FF
        DECLE   $00FF                           ; D74F   00FF

        MVI     G_03C0, R0                      ; D750   0280 03C0
        ADD     .BTAB.E0,R0                     ; D752   02C0 02E0
        ADDR    R4,     R0                      ; D754   00E0
L_D755:
        ADDR    R6,     R4                      ; D755   00F4
        XOR@    R6,     R2                      ; D756   03F2
        XORI    #$01F0, R3                      ; D757   03FB 01F0
        ADDR    R7,     R1                      ; D759   00F9
L_D75A:
        ADDR    R4,     R0                      ; D75A   00E0
        DECLE   $03E0,  $01E0,  $00C0,  $00C0   ; D75B   03E0 01E0 00C0 00C0
        DECLE   $0280,  $003F,  $00FF,  $003F   ; D75F   0280 003F 00FF 003F
        DECLE   $001F,  $021F                   ; D763   001F 021F

        SUB@    R3,     R7                      ; D765   031F
        SUBR    R1,     R7                      ; D766   010F
        BESC    L_D76C                          ; D767   020F 0003

        DIS                                     ; D769   0003
        SUB     .BTAB.03,R3                     ; D76A   0303 0203
L_D76C:
        SUBR    R0,     R3                      ; D76C   0103
        DIS                                     ; D76D   0003
L_D76E:
        DIS                                     ; D76E   0003
        SUB     .STIC.Y.0,R3                    ; D76F   0303 0008
        INCR    R0                              ; D771   0008
        INCR    R0                              ; D772   0008
        SKIP                                    ; D773   0208
        INCR    R0                              ; D774   0008
        INCR    R0                              ; D775   0008
        INCR    R0                              ; D776   0008
        INCR    R0                              ; D777   0008
L_D778:
        BUSC    L_DA81                          ; D778   0207 0307
        SUBR    R0,     R7                      ; D77A   0107
        BPL     L_D788                          ; D77B   0203 000B

        ADCR    R3                              ; D77D   002B
        SUB@    R5,     R7                      ; D77E   032F

        DECLE   $025F,  $0100,  $0000,  $0000   ; D77F   025F 0100 0000 0000

        SUB     .STIC.X.0,R0                    ; D783   0300 0000
        DECR    R0                              ; D785   0010
        MOVR    R2,     R0                      ; D786   0090
        ADD@    R1,     R0                      ; D787   02C8
L_D788:
        ADDR    R6,     R4                      ; D788   00F4
        DECLE   $00EA,  $00D0,  $0004,  $0200   ; D789   00EA 00D0 0004 0200
        DECLE   $0200,  $0300,  $0201,  $0004   ; D78D   0200 0300 0201 0004
        DECLE   $0004,  $0204,  $0004,  $0204   ; D791   0004 0204 0004 0204
        DECLE   $0004,  $0004,  $0204,  $02FC   ; D795   0004 0004 0204 02FC
        DECLE   $00FE,  $00FE,  $02FF,  $01FF   ; D799   00FE 00FE 02FF 01FF
        DECLE   $03FF,  $02FF,  $00FF,  $00FF   ; D79D   03FF 02FF 00FF 00FF
        DECLE   $01FF,  $00FF,  $02FF,  $00FF   ; D7A1   01FF 00FF 02FF 00FF
        DECLE   $00FE,  $01FE,  $02FE,  $00FF   ; D7A5   00FE 01FE 02FE 00FF
        DECLE   $00FF                           ; D7A9   00FF
L_D7AA:
        ADDI    #$00FE, R6                      ; D7AA   02FE 00FE
        DECLE   $00FC,  $00FC,  $00F8,  $02F8   ; D7AC   00FC 00FC 00F8 02F8
        DECLE   $0000,  $0300,  $0200,  $0000   ; D7B0   0000 0300 0200 0000
        DECLE   $0010,  $0008,  $0008,  $020C   ; D7B4   0010 0008 0008 020C
        DECLE   $00F0,  $00F0,  $00F0,  $02F0   ; D7B8   00F0 00F0 00F0 02F0
        DECLE   $00F0,  $00E0,  $02E0,  $03E0   ; D7BC   00F0 00E0 02E0 03E0
        DECLE   $020C,  $021C,  $001C,  $001E   ; D7C0   020C 021C 001C 001E
        DECLE   $031E,  $031E,  $01BF,  $00BF   ; D7C4   031E 031E 01BF 00BF

        SETC                                    ; D7C8   0007
        SUB     G_0103, R7                      ; D7C9   0307 0103

        DECLE   $0003,  $0003,  $0201,  $0001   ; D7CB   0003 0003 0201 0001
        DECLE   $0089,  $00FF,  $00FF           ; D7CF   0089 00FF 00FF
L_D7D2:
        ADDI    #$02FC, R7                      ; D7D2   02FF 02FC

        XOR@    R6,     R0                      ; D7D4   03F0
        ADD@    R4,     R0                      ; D7D5   02E0
        ADDR    R2,     R0                      ; D7D6   00D0
L_D7D7:
        ADDR    R4,     R4                      ; D7D7   00E4
        DECLE   $020F,  $000F,  $0207,  $0007   ; D7D8   020F 000F 0207 0007
        DECLE   $0007,  $0207,  $0207,  $0007   ; D7DC   0007 0207 0207 0007
        DECLE   $0000,  $0200,  $0100,  $0380   ; D7E0   0000 0200 0100 0380
        DECLE   $0200,  $0000,  $0080,  $016D   ; D7E4   0200 0000 0080 016D
        DECLE   $0000,  $0200,  $0000,  $0000   ; D7E8   0000 0200 0000 0000
        DECLE   $0101,  $0207,  $000F,  $003F   ; D7EC   0101 0207 000F 003F
        DECLE   $0283,  $0003,  $0003,  $0003   ; D7F0   0283 0003 0003 0003
        DECLE   $0003,  $020B,  $000B           ; D7F4   0003 020B 000B

        CMP@    R2,     R7                      ; D7F7   0357
        MVI     G_0084, R4                      ; D7F8   0284 0084
        MOVR    R0,     R4                      ; D7FA   0084
        ADDR    R0,     R4                      ; D7FB   00C4
        ADDR    R0,     R0                      ; D7FC   00C0
        ADD     G_00C0, R0                      ; D7FD   02C0 00C0
        ADDR    R0,     R0                      ; D7FF   00C0
        ADDR    R7,     R6                      ; D800   00FE
        ADDI    #$00FE, R6                      ; D801   02FE 00FE
        ADDR    R7,     R6                      ; D803   00FE
L_D804:
        MVII    #$03BE, R6                      ; D804   02BE 03BE
        DECLE   $02BE,  $02BE,  $0057,  $002B   ; D806   02BE 02BE 0057 002B
        DECLE   $0315,  $0380,  $0180,  $0080   ; D80A   0315 0380 0180 0080
        DECLE   $0080,  $0395,  $01FF,  $00FF   ; D80E   0080 0395 01FF 00FF

        SARC    R3,     2                       ; D812   007F
        BESC    L_D818                          ; D813   020F 0003

        DIS                                     ; D815   0003
        MOVR    R5,     R3                      ; D816   00AB
        SETC                                    ; D817   0007
L_D818:
        ADDI    #$03FF, R7                      ; D818   02FF 03FF

        DECLE   $01FF,  $02FF,  $00FF,  $00FF   ; D81A   01FF 02FF 00FF 00FF
        DECLE   $03FF                           ; D81E   03FF
L_D81F:
        ADD@    R2,     R6                      ; D81F   02D6
        CMPR    R7,     R0                      ; D820   0178
        SARC    R3,     1                       ; D821   007B
L_D822:
        SARC    R3,     1                       ; D822   007B
        CMPI    #$003D, R3                      ; D823   037B 003D
L_D825:
        RSWD    R5                              ; D825   003D
        DECLE   $001D,  $021D                   ; D826   001D 021D

        XORI    #$01FE, R6                      ; D828   03FE 01FE
        ADDI    #$00FF, R7                      ; D82A   02FF 00FF

        DECLE   $00FF,  $03FF,  $02FF,  $01FF   ; D82C   00FF 03FF 02FF 01FF
        DECLE   $0000,  $0000,  $0300,  $000C   ; D830   0000 0000 0300 000C
        DECLE   $0090,  $004C,  $02EE,  $0364   ; D834   0090 004C 02EE 0364
        DECLE   $0120,  $0220                   ; D838   0120 0220

        NEGR    R0                              ; D83A   0020
L_D83B:
        DECR    R0                              ; D83B   0010
        AND     .BTAB.BC,R0                     ; D83C   0380 02BC
        ANDR    R0,     R0                      ; D83E   0180
        MOVR    R3,     R0                      ; D83F   0098
L_D840:
        NEGR    R0                              ; D840   0020
        SUB@    R4,     R3                      ; D841   0323
        SARC    R3,     2                       ; D842   007F
L_D843:
        SARC    R2,     2                       ; D843   007E
L_D844:
        SARC    R3,     2                       ; D844   007F
        DECLE   $027F,  $00FE,  $00FF,  $00FF   ; D845   027F 00FE 00FF 00FF

        ADDR    R7,     R4                      ; D849   00FC
        ADDI    #$03FE, R6                      ; D84A   02FE 03FE
        ADDR    R7,     R4                      ; D84C   00FC
        XORI    #$00F0, R0                      ; D84D   03F8 00F0
        ADDR    R6,     R0                      ; D84F   00F0
        SUB     .ISRVEC.0,R0                    ; D850   0300 0100
        B       L_D843                          ; D852   0220 0010

        DECLE   $0000,  $0350,  $0390,  $0010   ; D854   0000 0350 0390 0010
        DECLE   $0000,  $0220,  $0240,  $0000   ; D858   0000 0220 0240 0000
        DECLE   $0300,  $0000,  $0000,  $0200   ; D85C   0300 0000 0000 0200
        DECLE   $0130,  $0278,  $0078,  $0078   ; D860   0130 0278 0078 0078
        DECLE   $027C,  $037C,  $007E,  $007E   ; D864   027C 037C 007E 007E
        DECLE   $027E,  $007E,  $007E,  $007E   ; D868   027E 007E 007E 007E
        DECLE   $007C,  $023C,  $013C,  $0038   ; D86C   007C 023C 013C 0038
        DECLE   $0330,  $0030,  $0000,  $0100   ; D870   0330 0030 0000 0100
        DECLE   $0170,  $0270,  $0078,  $00F8   ; D874   0170 0270 0078 00F8
        DECLE   $01F8,  $03F8,  $00F8,  $00FF   ; D878   01F8 03F8 00F8 00FF
        DECLE   $02F8,  $007C,  $007E,  $033F   ; D87C   02F8 007C 007E 033F
        DECLE   $0000,  $0000,  $0000           ; D880   0000 0000 0000

        SUBR    R0,     R0                      ; D883   0100
        B       L_D89E                          ; D884   0200 0018

L_D886:
        RSWD    R6                              ; D886   003E
        DECLE   $007F,  $037F,  $007F,  $007F   ; D887   007F 037F 007F 007F
        DECLE   $027F,  $007F,  $003F,  $000E   ; D88B   027F 007F 003F 000E
        DECLE   $0000,  $020F,  $0313           ; D88F   0000 020F 0313

        SWAP    R1,     1                       ; D892   0041
        AND@    R1,     R5                      ; D893   038D
        DECR    R0                              ; D894   0010
        MOVR    R4,     R0                      ; D895   00A0
        CMP     .ISRVEC.0,R0                    ; D896   0340 0100
        B       L_D89A                          ; D898   0200 0000

L_D89A:
        EIS                                     ; D89A   0002
        SUB@    R1,     R0                      ; D89B   0308
        SUB@    R2,     R0                      ; D89C   0310
        GSWD    R0                              ; D89D   0030
L_D89E:
        GSWD    R0                              ; D89E   0030
        DECLE   $02F0,  $0218                   ; D89F   02F0 0218

        RSWD    R4                              ; D8A1   003C
        SUB@    R4,     R4                      ; D8A2   0324
        COMR    R0                              ; D8A3   0018
        SARC    R2,     2                       ; D8A4   007E
        ADDI    #$01BD, R7                      ; D8A5   02FF 01BD

        DECLE   $023C,  $0030,  $0030,  $0200   ; D8A7   023C 0030 0030 0200
        DECLE   $03FC,  $00BE,  $00BA,  $02FA   ; D8AB   03FC 00BE 00BA 02FA
        DECLE   $003C,  $0078,  $006C,  $006C   ; D8AF   003C 0078 006C 006C
        DECLE   $026C,  $016C,  $0000,  $036C   ; D8B3   026C 016C 0000 036C
        DECLE   $0000,  $0000                   ; D8B7   0000 0000

        SUBR    R3,     R0                      ; D8B9   0118
        SUBR    R3,     R0                      ; D8BA   0118
        B       L_D939                          ; D8BB   0200 007C

        DECLE   $005E,  $015E,  $037E,  $001C   ; D8BD   005E 015E 037E 001C
        DECLE   $003E,  $0236,  $0034,  $0006   ; D8C1   003E 0236 0034 0006
        DECLE   $0336,  $0000,  $0006,  $0000   ; D8C5   0336 0000 0006 0000
        DECLE   $0118,  $0218,  $0000           ; D8C9   0118 0218 0000

        SARC    R0,     2                       ; D8CC   007C
L_D8CD:
        SLLC    R2,     2                       ; D8CD   005E
        DECLE   $035E,  $007E,  $001C,  $023C   ; D8CE   035E 007E 001C 023C
        DECLE   $003E,  $0006,  $0036,  $0006   ; D8D2   003E 0006 0036 0006
        DECLE   $0200,  $0006,  $0218,  $0018   ; D8D6   0200 0006 0218 0018
        DECLE   $0000,  $007C,  $005A,  $035E   ; D8DA   0000 007C 005A 035E
        DECLE   $027E,  $001C,  $003E,  $0036   ; D8DE   027E 001C 003E 0036
        DECLE   $0034,  $0236,  $0006,  $0236   ; D8E2   0034 0236 0006 0236
        DECLE   $0000                           ; D8E6   0000

        CLRC                                    ; D8E7   0006
L_D8E8:
        GSWD    R0                              ; D8E8   0030
        GSWD    R0                              ; D8E9   0030
        B       L_D968                          ; D8EA   0200 007C

        DECLE   $02F4,  $00F4,  $00F8,  $0030   ; D8EC   02F4 00F4 00F8 0030
        DECLE   $007C,  $006C,  $022C,  $006C   ; D8F0   007C 006C 022C 006C
        DECLE   $006C,  $0000,  $036C,  $0200   ; D8F4   006C 0000 036C 0200
        DECLE   $0000,  $0230,  $0030,  $0000   ; D8F8   0000 0230 0030 0000

        SARC    R0,     2                       ; D8FC   007C
        ADDR    R6,     R4                      ; D8FD   00F4
        ADD@    R6,     R4                      ; D8FE   02F4
        XORI    #$0038, R0                      ; D8FF   03F8 0038
        CMPI    #$006C, R4                      ; D901   037C 006C
        ADCR    R4                              ; D903   002C
        CMP@    R4,     R0                      ; D904   0360
L_D905:
        CMPR    R5,     R4                      ; D905   016C
        B       L_D968                          ; D906   0200 0060

        DECLE   $0000,  $0330,  $0330,  $0000   ; D908   0000 0330 0330 0000
        DECLE   $007C,  $02F4,  $02F4,  $00F8   ; D90C   007C 02F4 02F4 00F8
        DECLE   $0338,  $007C,  $006C,  $0220   ; D910   0338 007C 006C 0220
        DECLE   $016C,  $0260,  $0000,  $0060   ; D914   016C 0260 0000 0060
        DECLE   $0230,  $0330,  $0000           ; D918   0230 0330 0000
L_D91B:
        SARC    R0,     2                       ; D91B   007C
        DECLE   $02F4,  $00F4,  $00FC,  $0078   ; D91C   02F4 00F4 00FC 0078
        DECLE   $0038,  $027C,  $016C,  $006C   ; D920   0038 027C 016C 006C
        DECLE   $0360,  $006C,  $0000,  $0160   ; D924   0360 006C 0000 0160
        DECLE   $0130,  $0230,  $0000           ; D928   0130 0230 0000
L_D92B:
        RRC     R0,     1                       ; D92B   0070
        DECLE   $01F8,  $03F8,  $00F8,  $0078   ; D92C   01F8 03F8 00F8 0078
        DECLE   $027C,  $0078,  $0038,  $0338   ; D930   027C 0078 0038 0338
        DECLE   $0038,  $0010,  $0020,  $0138   ; D934   0038 0010 0020 0138
        DECLE   $0230                           ; D938   0230
L_D939:
        GSWD    R0                              ; D939   0030
        DECLE   $0000,  $0070,  $03F8,  $00F8   ; D93A   0000 0070 03F8 00F8
        DECLE   $00F8,  $0278,  $007C,  $007C   ; D93E   00F8 0278 007C 007C
        DECLE   $003C,  $003C,  $0238,  $0338   ; D942   003C 003C 0238 0338
        DECLE   $0000,  $0338,  $0018,  $0018   ; D946   0000 0338 0018 0018
        DECLE   $0300,  $0138,  $027C           ; D94A   0300 0138 027C
L_D94D:
        SARC    R0,     2                       ; D94D   007C
        DECLE   $007C,  $033C,  $033C,  $003E   ; D94E   007C 033C 033C 003E
        DECLE   $003E,  $0236,  $023C,  $0068   ; D952   003E 0236 023C 0068
        DECLE   $0360,  $0070,  $0018,  $0218   ; D956   0360 0070 0018 0218
        DECLE   $0100,  $0238,  $007C,  $007C   ; D95A   0100 0238 007C 007C
        DECLE   $027C,  $033C,  $003E,  $003E   ; D95E   027C 033C 003E 003E
        DECLE   $023E                           ; D962   023E

        RRC     R0,     1                       ; D963   0070
        SAR     R0,     2                       ; D964   006C
        SLR     R0,     1                       ; D965   0060
        SWAP    R0,     1                       ; D966   0040
        MVO@    R0,     R4                      ; D967   0260
L_D968:
        SUBR    R0,     R0                      ; D968   0100
        DECLE   $0018,  $0318,  $0000,  $0038   ; D969   0018 0318 0000 0038
        DECLE   $017C,  $017C,  $027E           ; D96D   017C 017C 027E

        RSWD    R6                              ; D970   003E
        RSWD    R6                              ; D971   003E
        CMPR    R6,     R6                      ; D972   0176
        CMP@    R6,     R0                      ; D973   0370
        SLR     R2,     2                       ; D974   0066
L_D975:
        SWAP    R0,     1                       ; D975   0040
        DECLE   $0240,  $0000,  $0000,  $0300   ; D976   0240 0000 0000 0300
        DECLE   $0018,  $0018,  $0000,  $0138   ; D97A   0018 0018 0000 0138
        DECLE   $027C,  $007C,  $007C,  $003C   ; D97E   027C 007C 007C 003C
        DECLE   $037E,  $0076,  $0046,  $0200   ; D982   037E 0076 0046 0200
        DECLE   $0006,  $0000,  $0000,  $0000   ; D986   0006 0000 0000 0000
        DECLE   $0218,  $0018,  $0300,  $0238   ; D98A   0218 0018 0300 0238
        DECLE   $007C,  $007C,  $007C,  $003C   ; D98E   007C 007C 007C 003C
        DECLE   $023C,  $0036,  $0036           ; D992   023C 0036 0036

        NEGR    R6                              ; D995   0026
        B       L_D99E                          ; D996   0200 0006

        DECLE   $0000,  $0218                   ; D998   0000 0218

        COMR    R0                              ; D99A   0018
        SUB     .BTAB.38,R0                     ; D99B   0300 0238
        SARC    R0,     2                       ; D99D   007C
L_D99E:
        SARC    R0,     2                       ; D99E   007C
        DECLE   $007C,  $003C,  $0238,  $003C   ; D99F   007C 003C 0238 003C
        DECLE   $0034,  $000C,  $0228           ; D9A3   0034 000C 0228

        NEGR    R0                              ; D9A6   0020
L_D9A7:
        INCR    R4                              ; D9A7   000C
        DECLE   $0218,  $0018,  $0300,  $0270   ; D9A8   0218 0018 0300 0270
        DECLE   $00E8,  $00EE,  $00EC,  $0068   ; D9AC   00E8 00EE 00EC 0068
        DECLE   $0270,  $0058,  $0038,  $0038   ; D9B0   0270 0058 0038 0038
        DECLE   $0238,  $0010,  $0020,  $0238   ; D9B4   0238 0010 0020 0238
        DECLE   $0018,  $0018,  $0000,  $0070   ; D9B8   0018 0018 0000 0070
        DECLE   $02E8,  $03EE,  $03EC,  $0368   ; D9BC   02E8 03EE 03EC 0368
        DECLE   $0070,  $007C,  $013C,  $023C   ; D9C0   0070 007C 013C 023C
        DECLE   $0138,  $0338,  $0200,  $0138   ; D9C4   0138 0338 0200 0138
        DECLE   $010C,  $020C,  $0100,  $0038   ; D9C8   010C 020C 0100 0038
        DECLE   $0274,  $0077,  $0176,  $0134   ; D9CC   0274 0077 0176 0134
        DECLE   $0238,  $003E,  $001E,  $0136   ; D9D0   0238 003E 001E 0136
        DECLE   $003C,  $0268,  $0160,  $0070   ; D9D4   003C 0268 0160 0070
        DECLE   $030C,  $010C,  $0000,  $0238   ; D9D8   030C 010C 0000 0238
        DECLE   $0274,  $0077,  $0176,  $0234   ; D9DC   0274 0077 0176 0234
        DECLE   $003A,  $023E,  $003E,  $0070   ; D9E0   003A 023E 003E 0070
        DECLE   $036C,  $0160,  $0240,  $0260   ; D9E4   036C 0160 0240 0260
        DECLE   $0100,  $000C,  $020C,  $0200   ; D9E8   0100 000C 020C 0200
        DECLE   $0038,  $0174,  $0277,  $0076   ; D9EC   0038 0174 0277 0076
        DECLE   $0236,  $003E,  $0076,  $0370   ; D9F0   0236 003E 0076 0370
        DECLE   $0166,  $0240,  $0240,  $0000   ; D9F4   0166 0240 0240 0000
        DECLE   $0100,  $0200,  $010C,  $000C   ; D9F8   0100 0200 010C 000C
        DECLE   $0000,  $0338,  $0074,  $0177   ; D9FC   0000 0338 0074 0177
        DECLE   $0076,  $0036                   ; DA00   0076 0036

        CMPI    #$0176, R2                      ; DA02   037A 0176
        CMPR    R0,     R6                      ; DA04   0146
        B       L_DB0D                          ; DA05   0200 0106

        DECLE   $0000,  $0200,  $0100,  $000C   ; DA07   0000 0200 0100 000C
        DECLE   $010C,  $0200,  $0038,  $0174   ; DA0B   010C 0200 0038 0174
        DECLE   $0077,  $0076,  $0234,  $0138   ; DA0F   0077 0076 0234 0138
        DECLE   $0136,  $0236,  $0024,  $0100   ; DA13   0136 0236 0024 0100
        DECLE   $0206,  $0100                   ; DA17   0206 0100

        INCR    R4                              ; DA19   000C
        INCR    R4                              ; DA1A   000C
        SUB     G_0038, R0                      ; DA1B   0300 0038
        CMPR    R6,     R4                      ; DA1D   0174
        RRC     R3,     2                       ; DA1E   0077
L_DA1F:
        RRC     R2,     2                       ; DA1F   0076
        DECLE   $0334,  $0138,  $013C,  $0234   ; DA20   0334 0138 013C 0234

        BNEQ    L_DB4E                          ; DA24   020C 0128
        B       L_D91B                          ; DA26   0220 010C

        DECLE   $0030,  $0230,  $0300,  $0070   ; DA28   0030 0230 0300 0070
        DECLE   $01F8,  $00F8,  $02F8,  $0378   ; DA2C   01F8 00F8 02F8 0378
        DECLE   $017C,  $0178,  $0238,  $0038   ; DA30   017C 0178 0238 0038
        DECLE   $0138,  $0210,  $0120,  $0038   ; DA34   0138 0210 0120 0038
        DECLE   $0030,  $0330,  $0000,  $0170   ; DA38   0030 0330 0000 0170
        DECLE   $00F8,  $00F8,  $03F8,  $0178   ; DA3C   00F8 00F8 03F8 0178
        DECLE   $017C,  $027C,  $023C,  $013C   ; DA40   017C 027C 023C 013C
        DECLE   $0238,  $0138,  $0000,  $0238   ; DA44   0238 0138 0000 0238
        DECLE   $0318,  $0018,  $0100,  $0038   ; DA48   0318 0018 0100 0038
        DECLE   $027C,  $037C,  $017C,  $013C   ; DA4C   027C 037C 017C 013C
        DECLE   $023C,  $003E,  $023E,  $0236   ; DA50   023C 003E 023E 0236
        DECLE   $033C,  $0068,  $0060,  $0070   ; DA54   033C 0068 0060 0070
        DECLE   $0218,  $0318,  $0000,  $0038   ; DA58   0218 0318 0000 0038
        DECLE   $007C,  $017C,  $037C,  $023C   ; DA5C   007C 017C 037C 023C
        DECLE   $023E,  $013E,  $023E           ; DA60   023E 013E 023E

        GSWD    R0                              ; DA63   0030
L_DA64:
        SAR     R0,     2                       ; DA64   006C
        DECLE   $0260,  $0340,  $0160,  $0000   ; DA65   0260 0340 0160 0000
        DECLE   $0018,  $0218,  $0300,  $0038   ; DA69   0018 0218 0300 0038
        DECLE   $007C,  $027C,  $007E,  $027E   ; DA6D   007C 027C 007E 027E
        DECLE   $027E,  $0276,  $0170,  $0066   ; DA71   027E 0276 0170 0066
        DECLE   $0040,  $0240,  $0200,  $0100   ; DA75   0040 0240 0200 0100
        DECLE   $0000,  $0018,  $0118,  $0200   ; DA79   0000 0018 0118 0200
        DECLE   $0338,  $027C,  $027C,  $027C   ; DA7D   0338 027C 027C 027C
L_DA81:
        SUBR    R7,     R4                      ; DA81   013C
        CMPR    R7,     R4                      ; DA82   017C
        PSHR    R6                              ; DA83   0276
        SWAP    R2,     2                       ; DA84   0046
        B       L_DB8D                          ; DA85   0200 0106

        DECLE   $0100,  $0000,  $0000,  $0018   ; DA87   0100 0000 0000 0018
        DECLE   $0018,  $0300,  $0238,  $017C   ; DA8B   0018 0300 0238 017C
        DECLE   $007C,  $007C,  $013C,  $003C   ; DA8F   007C 007C 013C 003C
        DECLE   $0036,  $0036,  $0226,  $0200   ; DA93   0036 0036 0226 0200
        DECLE   $0206,  $0200,  $0218,  $0218   ; DA97   0206 0200 0218 0218
        DECLE   $0000,  $0238,  $007C,  $027C   ; DA9B   0000 0238 007C 027C
        DECLE   $027C,  $023C,  $0038,  $023C   ; DA9F   027C 023C 0038 023C
        DECLE   $0234                           ; DAA3   0234

        INCR    R4                              ; DAA4   000C
        SUBR    R5,     R0                      ; DAA5   0128
        NEGR    R0                              ; DAA6   0020
        INCR    R4                              ; DAA7   000C
L_DAA8:
        BNEQ    L_DAB6                          ; DAA8   020C 000C

        SUBR    R6,     R0                      ; DAAA   0130
        CMPR    R5,     R0                      ; DAAB   0168
        SLLC    R0,     1                       ; DAAC   0058
        SLLC    R0,     1                       ; DAAD   0058
        SLLC    R2,     2                       ; DAAE   005E
        CMP@    R3,     R4                      ; DAAF   035C
        ADCR    R0                              ; DAB0   0028
        SUBI    #$0138, R0                      ; DAB1   0338 0138
        RSWD    R0                              ; DAB3   0038
        SUBR    R7,     R0                      ; DAB4   0138
        SUBR    R7,     R0                      ; DAB5   0138
L_DAB6:
        SUBR    R3,     R0                      ; DAB6   0118
        DECLE   $021C,  $020C,  $020C,  $033C   ; DAB7   021C 020C 020C 033C
        DECLE   $0068,  $0258,  $025E,  $005C   ; DABB   0068 0258 025E 005C
        DECLE   $0158,  $0028,  $0038,  $023C   ; DABF   0158 0028 0038 023C
        DECLE   $023C,  $023C                   ; DAC3   023C 023C

        SARC    R0,     1                       ; DAC5   0078
        PSHR    R0                              ; DAC6   0270
        CMPR    R7,     R0                      ; DAC7   0178
        SUBR    R0,     R6                      ; DAC8   0106
        BLE     L_DDE3                          ; DAC9   0206 0318

        SUBR    R6,     R4                      ; DACB   0134
        SUBR    R5,     R4                      ; DACC   012C
        SUBR    R5,     R7                      ; DACD   012F
        BNEQ    L_D9A7                          ; DACE   022C 0128

L_DAD0:
        DECR    R0                              ; DAD0   0010
        DECLE   $023C,  $023E,  $027E,  $0166   ; DAD1   023C 023E 027E 0166
        DECLE   $006C,  $0268,  $0270,  $0206   ; DAD5   006C 0268 0270 0206
        DECLE   $0206,  $0018,  $0234,  $022C   ; DAD9   0206 0018 0234 022C
        DECLE   $012F,  $012C,  $0228,  $0234   ; DADD   012F 012C 0228 0234
        DECLE   $003E,  $027E,  $0376,  $0166   ; DAE1   003E 027E 0376 0166
        DECLE   $02E0,  $00C6,  $02E0,  $0100   ; DAE5   02E0 00C6 02E0 0100
        DECLE   $0006,  $0206,  $0218,  $0034   ; DAE9   0006 0206 0218 0034
        DECLE   $022C,  $022F,  $002C,  $012E   ; DAED   022C 022F 002C 012E
        DECLE   $0037,  $007B,  $02F3,  $00F0   ; DAF1   0037 007B 02F3 00F0
        DECLE   $01E3,  $0080,  $0180,  $0000   ; DAF5   01E3 0080 0180 0000
        DECLE   $0000                           ; DAF9   0000

        SUB     .STIC.X.6,R6                    ; DAFA   0306 0006
        SUBR    R3,     R0                      ; DAFC   0118
        NOP                                     ; DAFD   0034
        SUBR    R5,     R4                      ; DAFE   012C
        ADCR    R7                              ; DAFF   002F

        ADCR    R4                              ; DB00   002C
L_DB01:
        XOR@    R5,     R4                      ; DB01   03EC
        ADD@    R6,     R6                      ; DB02   02F6
        CLRR    R6                              ; DB03   01F6
        MOVR    R4,     R6                      ; DB04   00A6
        B       L_DD0A                          ; DB05   0200 0203

        DECLE   $0200,  $0100,  $0200           ; DB07   0200 0100 0200

        CLRC                                    ; DB0A   0006
        SUBR    R0,     R6                      ; DB0B   0106
        COMR    R0                              ; DB0C   0018
L_DB0D:
        SUBR    R6,     R4                      ; DB0D   0134
        DECLE   $002C,  $002F,  $0328,  $0228   ; DB0E   002C 002F 0328 0228

        SUBR    R6,     R4                      ; DB12   0134
        SARC    R2,     2                       ; DB13   007E
        PSHR    R6                              ; DB14   0276
        MVO     R6,     .BTAB.00                ; DB15   0246 0200
        SUBR    R0,     R3                      ; DB17   0103
        B       L_DB20                          ; DB18   0200 0006

        SUBR    R0,     R6                      ; DB1A   0106
        RSWD    R0                              ; DB1B   0038
        CMPR    R5,     R0                      ; DB1C   0168
        SLLC    R0,     2                       ; DB1D   005C
        SLLC    R2,     2                       ; DB1E   005E
        CMP@    R3,     R0                      ; DB1F   0358
L_DB20:
        MVO@    R0,     R3                      ; DB20   0258
        DECLE   $0128,  $0018,  $0218,  $0238   ; DB21   0128 0018 0218 0238
        DECLE   $023C,  $0124,  $0206,  $0218   ; DB25   023C 0124 0206 0218
        DECLE   $0318,  $0230,  $0368,  $0158   ; DB29   0318 0230 0368 0158
        DECLE   $035C,  $0276,  $025C,  $0338   ; DB2D   035C 0276 025C 0338
        DECLE   $0138,  $0338,  $0338,  $0038   ; DB31   0138 0338 0338 0038
        DECLE   $0238,  $0218,  $021C,  $0218   ; DB35   0238 0218 021C 0218
        DECLE   $0018,  $0230,  $0268,  $0358   ; DB39   0018 0230 0268 0358
        DECLE   $035C,  $007E,  $0258,  $0238   ; DB3D   035C 007E 0258 0238
        DECLE   $0238,  $023C                   ; DB41   0238 023C

        NOP                                     ; DB43   0034
        BNEQ    L_D8CD                          ; DB44   022C 0278

        CMP@    R6,     R0                      ; DB46   0370
        CMPI    #$000C, R0                      ; DB47   0378 000C
        INCR    R4                              ; DB49   000C
        SUB@    R3,     R0                      ; DB4A   0318
        SUBI    #$032C, R4                      ; DB4B   033C 032C
        SUB@    R5,     R7                      ; DB4D   032F

L_DB4E:
        RSWD    R6                              ; DB4E   003E
        DECLE   $0038,  $0018,  $0034,  $003E   ; DB4F   0038 0018 0034 003E
        DECLE   $007E,  $0066,  $006C,  $0068   ; DB53   007E 0066 006C 0068
        DECLE   $0070,  $000C,  $030C,  $0318   ; DB57   0070 000C 030C 0318
        DECLE   $0034,  $022C,  $012F,  $023C   ; DB5B   0034 022C 012F 023C
        DECLE   $0338,  $001C,  $003C,  $007E   ; DB5F   0338 001C 003C 007E
        DECLE   $0376,  $0366,  $00E0,  $02C6   ; DB63   0376 0366 00E0 02C6
        DECLE   $00E0,  $0100,  $0306,  $0006   ; DB67   00E0 0100 0306 0006
        DECLE   $0018,  $0124,  $022C,  $033F   ; DB6B   0018 0124 022C 033F
        DECLE   $001C,  $023E,  $003F,  $007B   ; DB6F   001C 023E 003F 007B
        DECLE   $03B3,  $00F0,  $00E3,  $0080   ; DB73   03B3 00F0 00E3 0080
        DECLE   $0180,  $0300,  $0000,  $0206   ; DB77   0180 0300 0000 0206
        DECLE   $0106,  $0318,  $0234,  $003C   ; DB7B   0106 0318 0234 003C
        DECLE   $003F,  $0038,  $00DC,  $03FE   ; DB7F   003F 0038 00DC 03FE
        DECLE   $00F6,  $02A6,  $0000,  $0203   ; DB83   00F6 02A6 0000 0203
        DECLE   $0200,  $0000,  $0006,  $0104   ; DB87   0200 0000 0006 0104
        DECLE   $030E,  $0218                   ; DB8B   030E 0218
L_DB8D:
        NEGR    R4                              ; DB8D   0024
        DECLE   $022C,  $002F,  $0139,  $0238   ; DB8E   022C 002F 0139 0238

        COMR    R4                              ; DB92   001C
        SARC    R2,     2                       ; DB93   007E
        RRC     R2,     2                       ; DB94   0076
        MVO     R6,     .BTAB.00                ; DB95   0246 0200
        DIS                                     ; DB97   0003
        B       L_DCA6                          ; DB98   0200 010C

        DECLE   $000C,  $0238,  $0054,  $007C   ; DB9A   000C 0238 0054 007C
        DECLE   $0076,  $0178,  $0278,  $003C   ; DB9E   0076 0178 0278 003C
        DECLE   $0218,  $0018,  $0338,  $013C   ; DBA2   0218 0018 0338 013C
        DECLE   $0024,  $0006,  $0118,  $0018   ; DBA6   0024 0006 0118 0018
        DECLE   $0238,  $0070,  $02F8,  $00B8   ; DBAA   0238 0070 02F8 00B8
        DECLE   $02F4,  $015A,  $005C,  $0078   ; DBAE   02F4 015A 005C 0078
        DECLE   $0038,  $0338,  $0138,  $0010   ; DBB2   0038 0338 0138 0010
        DECLE   $0220,  $0138,  $0118,  $0118   ; DBB6   0220 0138 0118 0118
        DECLE   $0028,  $0070,  $00F8,  $02B4   ; DBBA   0028 0070 00F8 02B4
        DECLE   $01BA,  $007F,  $0278,  $007C   ; DBBE   01BA 007F 0278 007C
        DECLE   $002C,  $0134,  $0038,  $0028   ; DBC2   002C 0134 0038 0028
        DECLE   $0100,  $012C,  $010C,  $000C   ; DBC6   0100 012C 010C 000C
        DECLE   $0214,  $0038,  $036C,  $005E   ; DBCA   0214 0038 036C 005E
        DECLE   $035B,  $012D,  $003C,  $001E   ; DBCE   035B 012D 003C 001E
        DECLE   $003E,  $0376,  $037C,  $0328   ; DBD2   003E 0376 037C 0328
        DECLE   $0360,  $0330,  $000C,  $000C   ; DBD6   0360 0330 000C 000C
        DECLE   $0014,  $0038,  $006C,  $004E   ; DBDA   0014 0038 006C 004E
        DECLE   $005F,  $002D,  $003E,  $003E   ; DBDE   005F 002D 003E 003E
        DECLE   $003E,  $0274,  $016C,  $0060   ; DBE2   003E 0274 016C 0060
        DECLE   $0140,  $0060,  $0000,  $010C   ; DBE6   0140 0060 0000 010C
        DECLE   $000C,  $0114,  $0138,  $017C   ; DBEA   000C 0114 0138 017C
        DECLE   $015E,  $005B,  $033A,  $003E   ; DBEE   015E 005B 033A 003E
        DECLE   $0376,  $0170,  $0166,  $0044   ; DBF2   0376 0170 0166 0044
        DECLE   $0040,  $0200,  $0100,  $010C   ; DBF6   0040 0200 0100 010C
        DECLE   $000C,  $0114,  $0128,  $017C   ; DBFA   000C 0114 0128 017C
        DECLE   $015A,  $025B,  $003C,  $033C   ; DBFE   015A 025B 003C 033C
        DECLE   $015E,  $0176,  $0046,  $0000   ; DC02   015E 0176 0046 0000
        DECLE   $0206,  $0100,  $0100,  $0000   ; DC06   0206 0100 0100 0000
        DECLE   $010C,  $010C,  $0104,  $0138   ; DC0A   010C 010C 0104 0138
        DECLE   $0274,  $005E,  $035B,  $012C   ; DC0E   0274 005E 035B 012C
        DECLE   $013C,  $0036,  $0036,  $0224   ; DC12   013C 0036 0036 0224
        DECLE   $0100,  $0106,  $0000           ; DC16   0100 0106 0000
L_DC19:
        SUBR    R1,     R4                      ; DC19   010C
        DECLE   $010C,  $0114,  $0138,  $0254   ; DC1A   010C 0114 0138 0254
        DECLE   $035A,  $025B,  $013C,  $003C   ; DC1E   035A 025B 013C 003C
        DECLE   $013C,  $0234,  $000C,  $0128   ; DC22   013C 0234 000C 0128
        DECLE   $0020,  $010C,  $0330,  $0130   ; DC26   0020 010C 0330 0130
        DECLE   $0100,  $0070,  $03F8,  $03B8   ; DC2A   0100 0070 03F8 03B8
        DECLE   $00C0,  $0268,  $017C,  $0078   ; DC2E   00C0 0268 017C 0078
        DECLE   $0238,  $0338,  $0138,  $0110   ; DC32   0238 0338 0138 0110
        DECLE   $0020,  $0338,  $0230,  $0130   ; DC36   0020 0338 0230 0130
        DECLE   $0100,  $0270,  $03F8,  $00B8   ; DC3A   0100 0270 03F8 00B8
        DECLE   $02C0,  $0168,  $007C,  $027C   ; DC3E   02C0 0168 007C 027C

        SUBI    #$013C, R4                      ; DC42   033C 013C
        SUBR    R7,     R0                      ; DC44   0138
        RSWD    R0                              ; DC45   0038
        SUB     .BTAB.38,R0                     ; DC46   0300 0238
        SUBR    R3,     R0                      ; DC48   0118
        SUBR    R3,     R0                      ; DC49   0118
        B       L_DF84                          ; DC4A   0200 0338

        DECLE   $007C,  $025C,  $0160,  $0034   ; DC4C   007C 025C 0160 0034
        DECLE   $023C,  $033E,  $013E,  $0136   ; DC50   023C 033E 013E 0136
        DECLE   $003C,  $0368,  $0260,  $0170   ; DC54   003C 0368 0260 0170
        DECLE   $0118,  $0218,  $0100,  $0038   ; DC58   0118 0218 0100 0038
        DECLE   $027C                           ; DC5C   027C

        CMPR    R3,     R4                      ; DC5D   015C
        SLR     R0,     1                       ; DC5E   0060
        SUB@    R6,     R4                      ; DC5F   0334
        SUBR    R7,     R6                      ; DC60   013E
        SUBR    R7,     R6                      ; DC61   013E
        SUBR    R7,     R6                      ; DC62   013E
        RRC     R0,     1                       ; DC63   0070
        SAR     R0,     2                       ; DC64   006C
        CMP@    R4,     R0                      ; DC65   0360
        CMPR    R0,     R0                      ; DC66   0140
        CMPR    R4,     R0                      ; DC67   0160
        B       L_DC82                          ; DC68   0200 0018

        COMR    R0                              ; DC6A   0018
        B       L_DDA5                          ; DC6B   0200 0138

        SARC    R0,     2                       ; DC6D   007C
        CMP@    R3,     R4                      ; DC6E   035C
        CMPR    R4,     R2                      ; DC6F   0162
        SUBR    R6,     R6                      ; DC70   0136
        SUBR    R7,     R6                      ; DC71   013E
        RRC     R2,     2                       ; DC72   0076
        RRC     R0,     1                       ; DC73   0070
        CMP@    R4,     R6                      ; DC74   0366
        CMPR    R0,     R0                      ; DC75   0140
        CMPR    R0,     R0                      ; DC76   0140
        B       L_DE79                          ; DC77   0200 0200

        DECLE   $0300,  $0118,  $0118,  $0000   ; DC79   0300 0118 0118 0000

        SUBI    #$017C, R0                      ; DC7D   0338 017C
        CMPR    R3,     R4                      ; DC7F   015C
        CMPR    R4,     R0                      ; DC80   0160
        NOP                                     ; DC81   0034
L_DC82:
        SARC    R2,     2                       ; DC82   007E
        DECLE   $0376,  $0146,  $0100,  $0206   ; DC83   0376 0146 0100 0206
        DECLE   $0000,  $0000,  $0200,  $0218   ; DC87   0000 0000 0200 0218
        DECLE   $0118,  $0300,  $0138,  $017C   ; DC8B   0118 0300 0138 017C
        DECLE   $025C,  $0160,  $0034,  $033C   ; DC8F   025C 0160 0034 033C
        DECLE   $0136,  $0236,  $0326,  $0000   ; DC93   0136 0236 0326 0000

        CLRC                                    ; DC97   0006
        B       L_DDB2                          ; DC98   0200 0118

        COMR    R0                              ; DC9A   0018
        B       L_DED5                          ; DC9B   0200 0238

        CMPR    R7,     R4                      ; DC9D   017C
        CMPR    R3,     R4                      ; DC9E   015C
        SLR     R0,     1                       ; DC9F   0060
        NOP                                     ; DCA0   0034
        SUBR    R7,     R0                      ; DCA1   0138
        RSWD    R4                              ; DCA2   003C
        SUBR    R6,     R4                      ; DCA3   0134
        BNEQ    L_DCCE                          ; DCA4   020C 0028

L_DCA6:
        NEGR    R0                              ; DCA6   0020
        BNEQ    L_DDD9                          ; DCA7   020C 0130

        GSWD    R0                              ; DCA9   0030
        B       L_DFA8                          ; DCAA   0200 02FC

        DECLE   $01BE,  $019A,  $00C4,  $0030   ; DCAC   01BE 019A 00C4 0030
        DECLE   $017C,  $006C,  $0168,  $026C   ; DCB0   017C 006C 0168 026C
        DECLE   $006C,  $0000,  $026C,  $0100   ; DCB4   006C 0000 026C 0100
        DECLE   $0000,  $0218,  $0218,  $0100   ; DCB8   0000 0218 0218 0100
        DECLE   $017C,  $005E,  $002A,  $0164   ; DCBC   017C 005E 002A 0164
        DECLE   $0010,  $013E,  $0236,  $0334   ; DCC0   0010 013E 0236 0334
        DECLE   $0306,  $0336,  $0000,  $0006   ; DCC4   0306 0336 0000 0006
        DECLE   $0000,  $0018,  $0118,  $0200   ; DCC8   0000 0018 0118 0200

        CMPR    R7,     R4                      ; DCCC   017C
        SLLC    R2,     2                       ; DCCD   005E
L_DCCE:
        CMPR    R1,     R2                      ; DCCE   014A
        DECLE   $0266,  $0014,  $023E,  $0236   ; DCCF   0266 0014 023E 0236
        DECLE   $0106,  $0136,  $0306,  $0300   ; DCD3   0106 0136 0306 0300
        DECLE   $0106,  $0118,  $0118,  $0000   ; DCD7   0106 0118 0118 0000
        DECLE   $017C,  $005E,  $004A,  $0364   ; DCDB   017C 005E 004A 0364
        DECLE   $0310,  $013E,  $0136,  $0034   ; DCDF   0310 013E 0136 0034
        DECLE   $0136,  $0006,  $0036,  $0000   ; DCE3   0136 0006 0036 0000
        DECLE   $0206,  $0230,  $0330,  $0000   ; DCE7   0206 0230 0330 0000
        DECLE   $02F8,  $02BC,  $0294,  $00C8   ; DCEB   02F8 02BC 0294 00C8
        DECLE   $0330,  $017C,  $006C,  $012C   ; DCEF   0330 017C 006C 012C
        DECLE   $036C,  $036C,  $0100,  $026C   ; DCF3   036C 036C 0100 026C
        DECLE   $0000,  $0000,  $0230,  $0230   ; DCF7   0000 0000 0230 0230
        DECLE   $0200,  $02FC,  $02BE,  $029A   ; DCFB   0200 02FC 02BE 029A
        DECLE   $02C4,  $0230,  $007C,  $016C   ; DCFF   02C4 0230 007C 016C
        DECLE   $002C,  $0260,  $026C,  $0200   ; DD03   002C 0260 026C 0200
        DECLE   $0360,  $0000,  $0230           ; DD07   0360 0000 0230
L_DD0A:
        GSWD    R0                              ; DD0A   0030
        SUBR    R0,     R0                      ; DD0B   0100
        XORI    #$01BE, R4                      ; DD0C   03FC 01BE
        ANDR    R3,     R2                      ; DD0E   019A
        ADDR    R0,     R4                      ; DD0F   00C4
        SUBR    R6,     R0                      ; DD10   0130
        CMPI    #$026C, R4                      ; DD11   037C 026C
        B       L_DAA8                          ; DD13   0220 026C

        DECLE   $0260,  $0300,  $0360,  $0230   ; DD15   0260 0300 0360 0230
        DECLE   $0230,  $0200,  $01FC,  $03BE   ; DD19   0230 0200 01FC 03BE
        DECLE   $029A,  $02C4,  $0130,  $0278   ; DD1D   029A 02C4 0130 0278
        DECLE   $016C,  $022C                   ; DD21   016C 022C

        MVO@    R4,     R5                      ; DD23   026C
        CMPR    R4,     R0                      ; DD24   0160
        MVO@    R4,     R5                      ; DD25   026C
        SUB     G_0160, R0                      ; DD26   0300 0160
        B       L_DF42                          ; DD28   0200 0218

        DECLE   $0318,  $0300,  $013C,  $027E   ; DD2A   0318 0300 013C 027E
        DECLE   $027E,  $0140,  $001C,  $023E   ; DD2E   027E 0140 001C 023E
        DECLE   $0036,  $0314,  $0236,  $0236   ; DD32   0036 0314 0236 0236
        DECLE   $0200,  $0036,  $0100,  $01B1   ; DD36   0200 0036 0100 01B1
        DECLE   $00B3,  $02C6,  $007E,  $017C   ; DD3A   00B3 02C6 007E 017C
        DECLE   $0338,  $0200,  $0038,  $007C   ; DD3E   0338 0200 0038 007C
        DECLE   $036C,  $0228,  $016C,  $026C   ; DD42   036C 0228 016C 026C
        DECLE   $0300,  $006C,  $0202,  $031A   ; DD46   0300 006C 0202 031A
        DECLE   $019A,  $03C6,  $007E,  $013C   ; DD4A   019A 03C6 007E 013C
        DECLE   $011C,  $0100,  $031C,  $023E   ; DD4E   011C 0100 031C 023E
        DECLE   $0236,  $0114,  $0273,  $0363   ; DD52   0236 0114 0273 0363
        DECLE   $0000,  $0263,  $0300,  $0199   ; DD56   0000 0263 0300 0199
        DECLE   $0399,  $0043,  $037E,  $023E   ; DD5A   0399 0043 037E 023E
        DECLE   $001C,  $0300,  $021C,  $003E   ; DD5E   001C 0300 021C 003E
        DECLE   $0236,  $0214,  $0373,  $0163   ; DD62   0236 0214 0373 0163
        DECLE   $0000,  $0063,  $0200,  $0318   ; DD66   0000 0063 0200 0318
        DECLE   $0118,  $0000,  $003C,  $017E   ; DD6A   0118 0000 003C 017E
        DECLE   $007E,  $0240,  $031C,  $023E   ; DD6E   007E 0240 031C 023E
        DECLE   $0036,  $0014,  $0236,  $0036   ; DD72   0036 0014 0236 0036
        DECLE   $0000,  $0136,  $0000,  $0218   ; DD76   0000 0136 0000 0218
        DECLE   $0318,  $0242,  $007E,  $007E   ; DD7A   0318 0242 007E 007E
        DECLE   $021C,  $0000,  $001C,  $013E   ; DD7E   021C 0000 001C 013E
        DECLE   $0036,  $0214,  $0336,  $0236   ; DD82   0036 0214 0336 0236
        DECLE   $0000,  $0036,  $0200,  $0018   ; DD86   0000 0036 0200 0018
        DECLE   $0059,  $0143,  $007E,  $023E   ; DD8A   0059 0143 007E 023E

        SUB@    R3,     R4                      ; DD8E   031C
        B       L_DDAD                          ; DD8F   0200 001C

        DECLE   $003E,  $0236,  $0014,  $0036   ; DD91   003E 0236 0014 0036
        DECLE   $0136,  $0000,  $0336,  $0300   ; DD95   0136 0000 0336 0300
        DECLE   $0399,  $0399,  $0043,  $007E   ; DD99   0399 0399 0043 007E
        DECLE   $003E,  $001C,  $0000,  $001C   ; DD9D   003E 001C 0000 001C
        DECLE   $003E,  $0036                   ; DDA1   003E 0036

        DECR    R4                              ; DDA3   0014
        RRC     R3,     1                       ; DDA4   0073
L_DDA5:
        SLR     R3,     1                       ; DDA5   0063
        DECLE   $0000,  $0063,  $0000,  $0000   ; DDA6   0000 0063 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DDAA   0000 0000 0000
L_DDAD:
        MOVR    R5,     R2                      ; DDAD   00AA
        ADDR    R2,     R5                      ; DDAE   00D5
        ADDR    R2,     R5                      ; DDAF   00D5
        ADDR    R2,     R5                      ; DDB0   00D5
        ADDR    R2,     R5                      ; DDB1   00D5
L_DDB2:
        MOVR    R5,     R2                      ; DDB2   00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00D5,  $006A   ; DDBB   0000 0000 00D5 006A
        DECLE   $006A,  $00AA,  $00AA,  $00D5   ; DDBF   006A 00AA 00AA 00D5
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0020   ; DDC7   0000 0000 0020 0020
        DECLE   $0074,  $0074,  $000E,  $000E   ; DDCB   0074 0074 000E 000E
        DECLE   $0064,  $00F0,  $0090,  $00F0   ; DDCF   0064 00F0 0090 00F0
        DECLE   $0060,  $0000,  $0000,  $0063   ; DDD3   0060 0000 0000 0063
        DECLE   $0063,  $0000                   ; DDD7   0063 0000
L_DDD9:
        NEGR    R0                              ; DDD9   0020
        NEGR    R0                              ; DDDA   0020
        RRC     R0,     2                       ; DDDB   0074
        RRC     R0,     2                       ; DDDC   0074
        INCR    R6                              ; DDDD   000E
        INCR    R6                              ; DDDE   000E
        SLR     R0,     1                       ; DDDF   0060
        ADDR    R6,     R0                      ; DDE0   00F0
        MOVR    R2,     R0                      ; DDE1   0090
        ADDR    R6,     R0                      ; DDE2   00F0
L_DDE3:
        SLR     R0,     1                       ; DDE3   0060
        DECLE   $0000,  $0000,  $0063,  $0000   ; DDE4   0000 0000 0063 0000
        DECLE   $007E,  $00FF,  $00FF,  $00C3   ; DDE8   007E 00FF 00FF 00C3
        DECLE   $00BD,  $00FF,  $00FF,  $007E   ; DDEC   00BD 00FF 00FF 007E
        DECLE   $0081,  $00FF,  $00FF,  $00FD   ; DDF0   0081 00FF 00FF 00FD
        DECLE   $00FD,  $00FF,  $0000,  $00FF   ; DDF4   00FD 00FF 0000 00FF
        DECLE   $0018,  $0018,  $000C,  $000E   ; DDF8   0018 0018 000C 000E
        DECLE   $0016,  $001C,  $0038,  $0040   ; DDFC   0016 001C 0038 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE04   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $000C,  $001E   ; DE08   0018 0018 000C 001E
        DECLE   $001A,  $001C,  $0010,  $0020   ; DE0C   001A 001C 0010 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE14   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $003E   ; DE18   0018 0018 0024 003E
        DECLE   $002A,  $001C,  $0008,  $0008   ; DE1C   002A 001C 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE24   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0030,  $0078   ; DE28   0018 0018 0030 0078
        DECLE   $0058,  $0038,  $0008,  $0004   ; DE2C   0058 0038 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE34   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0030,  $0070   ; DE38   0018 0018 0030 0070
        DECLE   $0068,  $0038,  $001C,  $0002   ; DE3C   0068 0038 001C 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE48   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0034,  $003C   ; DE4C   0000 0018 0034 003C
        DECLE   $003C,  $003C,  $0018,  $0000   ; DE50   003C 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE54   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0034,  $0010   ; DE58   0000 0008 0034 0010
        DECLE   $004A,  $0093,  $0064,  $0094   ; DE5C   004A 0093 0064 0094
        DECLE   $005B,  $00A4,  $00D9,  $0026   ; DE60   005B 00A4 00D9 0026
        DECLE   $005A,  $0034,  $0000,  $0000   ; DE64   005A 0034 0000 0000
        DECLE   $0000,  $0004                   ; DE68   0000 0004

        INCR    R6                              ; DE6A   000E
        INCR    R4                              ; DE6B   000C
        RRC     R2,     2                       ; DE6C   0076
        ADDR    R7,     R0                      ; DE6D   00F8
        RRC     R1,     2                       ; DE6E   0075
        MOVR    R5,     R7                      ; DE6F   00AF

        DECLE   $00CE,  $00F0,  $0078,  $0038   ; DE70   00CE 00F0 0078 0038
        DECLE   $0018,  $0030,  $0070,  $0078   ; DE74   0018 0030 0070 0078
        DECLE   $0004                           ; DE78   0004
L_DE79:
        INCR    R6                              ; DE79   000E
        DECLE   $000C,  $0036                   ; DE7A   000C 0036

        SARC    R0,     1                       ; DE7C   0078
        ADDR    R7,     R4                      ; DE7D   00FC
        RRC     R1,     2                       ; DE7E   0075
        MOVR    R5,     R7                      ; DE7F   00AF

        DECLE   $00CE,  $00F0,  $0078,  $0038   ; DE80   00CE 00F0 0078 0038
        DECLE   $0018,  $0030,  $0070,  $0078   ; DE84   0018 0030 0070 0078
        DECLE   $0000,  $0000,  $0000,  $0004   ; DE88   0000 0000 0000 0004
        DECLE   $001A,  $0076,  $00FF           ; DE8C   001A 0076 00FF

        MOVR    R2,     R5                      ; DE8F   0095
        SLLC    R2,     1                       ; DE90   005A
        ADDR    R0,     R6                      ; DE91   00C6
        ADDR    R4,     R7                      ; DE92   00E7

        MOVR    R4,     R5                      ; DE93   00A5
        MOVR    R4,     R5                      ; DE94   00A5
        ADDR    R4,     R7                      ; DE95   00E7

        DECLE   $0042,  $0000,  $0000,  $0000   ; DE96   0042 0000 0000 0000
        DECLE   $0000,  $0004,  $001A,  $0076   ; DE9A   0000 0004 001A 0076
        DECLE   $00FF                           ; DE9E   00FF

        MOVR    R3,     R5                      ; DE9F   009D
        SLLC    R2,     1                       ; DEA0   005A
        ADDR    R4,     R7                      ; DEA1   00E7

        MOVR    R4,     R5                      ; DEA2   00A5
        MOVR    R4,     R5                      ; DEA3   00A5
        ADDR    R4,     R7                      ; DEA4   00E7

        DECLE   $0042,  $0000,  $0000,  $003D   ; DEA5   0042 0000 0000 003D
        DECLE   $0001,  $0080,  $0011,  $0080   ; DEA9   0001 0080 0011 0080
        DECLE   $0021,  $0080,  $0031,  $0080   ; DEAD   0021 0080 0031 0080
        DECLE   $0041,  $0080,  $0051,  $0080   ; DEB1   0041 0080 0051 0080
        DECLE   $0061,  $0080,  $0071,  $0000   ; DEB5   0061 0080 0071 0000

        SETC                                    ; DEB9   0007
        INCR    R0                              ; DEBA   0008
        MOVR    R5,     R1                      ; DEBB   00A9
        INCR    R0                              ; DEBC   0008
        INCR    R6                              ; DEBD   000E
        COMR    R0                              ; DEBE   0018
        DECR    R4                              ; DEBF   0014
        INCR    R0                              ; DEC0   0008
        SAR     R0,     2                       ; DEC1   006C
        MOVR    R1,     R0                      ; DEC2   0088
        SLR     R0,     2                       ; DEC3   0064
        MOVR    R1,     R0                      ; DEC4   0088
        RRC     R0,     2                       ; DEC5   0074
        MOVR    R1,     R0                      ; DEC6   0088
        SARC    R3,     1                       ; DEC7   007B
        MOVR    R3,     R0                      ; DEC8   0098
        MOVR    R0,     R3                      ; DEC9   0083
        MOVR    R3,     R0                      ; DECA   0098
        MOVR    R6,     R1                      ; DECB   00B1
        INCR    R0                              ; DECC   0008
        MOVR    R7,     R0                      ; DECD   00B8
        SLLC    R0,     1                       ; DECE   0058
        ADDR    R0,     R0                      ; DECF   00C0
        SLLC    R0,     1                       ; DED0   0058
        ADDR    R1,     R0                      ; DED1   00C8
        SLLC    R0,     1                       ; DED2   0058
        RSWD    R1                              ; DED3   0039
        SLLC    R0,     1                       ; DED4   0058
L_DED5:
        SWAP    R1,     1                       ; DED5   0041
        DECLE   $0058,  $0050,  $0098,  $0058   ; DED6   0058 0050 0098 0058
        DECLE   $0098,  $0048,  $0058,  $008B   ; DEDA   0098 0048 0058 008B
        DECLE   $0048,  $0093,  $0048,  $009B   ; DEDE   0048 0093 0048 009B
        DECLE   $0048,  $00A3,  $0088,  $00E3   ; DEE2   0048 00A3 0088 00E3
        DECLE   $0048,  $00D3,  $0088,  $00DB   ; DEE6   0048 00D3 0088 00DB
        DECLE   $0088,  $0016,  $0018,  $001E   ; DEEA   0088 0016 0018 001E
        DECLE   $0018,  $0026,  $0018,  $002E   ; DEEE   0018 0026 0018 002E
        DECLE   $0018,  $0036                   ; DEF2   0018 0036

        COMR    R0                              ; DEF4   0018
        INCR    R4                              ; DEF5   000C
        INCR    R0                              ; DEF6   0008
        COMR    R4                              ; DEF7   001C
        INCR    R0                              ; DEF8   0008
        NEGR    R4                              ; DEF9   0024
        INCR    R0                              ; DEFA   0008
        ADCR    R4                              ; DEFB   002C
        INCR    R0                              ; DEFC   0008
        NOP                                     ; DEFD   0034
        INCR    R0                              ; DEFE   0008
        DECR    R6                              ; DEFF   0016
        SLLC    R0,     1                       ; DF00   0058
        SAR     R2,     2                       ; DF01   006E
        SLLC    R0,     1                       ; DF02   0058
        SLR     R2,     2                       ; DF03   0066
        SLLC    R0,     1                       ; DF04   0058
        RRC     R2,     2                       ; DF05   0076
        SLLC    R0,     1                       ; DF06   0058
        SARC    R3,     1                       ; DF07   007B
        SLLC    R0,     1                       ; DF08   0058
        MOVR    R0,     R3                      ; DF09   0083
        SLLC    R0,     1                       ; DF0A   0058
        RSWD    R1                              ; DF0B   0039
        MOVR    R3,     R0                      ; DF0C   0098
        SWAP    R1,     1                       ; DF0D   0041
        MOVR    R3,     R0                      ; DF0E   0098
        SETC                                    ; DF0F   0007
        MOVR    R1,     R0                      ; DF10   0088
        ADDR    R2,     R0                      ; DF11   00D0
        SLL     R0,     1                       ; DF12   0048
        ADDR    R3,     R0                      ; DF13   00D8
        INCR    R0                              ; DF14   0008
        ADDR    R4,     R0                      ; DF15   00E0
        INCR    R0                              ; DF16   0008
        RRC     R0,     1                       ; DF17   0070
        MOVR    R3,     R0                      ; DF18   0098
        SARC    R0,     1                       ; DF19   0078
        MOVR    R3,     R0                      ; DF1A   0098
        TSTR    R0                              ; DF1B   0080
        MOVR    R3,     R0                      ; DF1C   0098
        MOVR    R1,     R0                      ; DF1D   0088
        SLLC    R0,     1                       ; DF1E   0058
        MOVR    R2,     R0                      ; DF1F   0090
        SLLC    R0,     1                       ; DF20   0058
        MOVR    R2,     R1                      ; DF21   0091
        INCR    R0                              ; DF22   0008
        MOVR    R3,     R0                      ; DF23   0098
        SLLC    R0,     1                       ; DF24   0058
        MOVR    R4,     R0                      ; DF25   00A0
        SLLC    R0,     1                       ; DF26   0058
        MOVR    R5,     R0                      ; DF27   00A8
        SLLC    R0,     1                       ; DF28   0058
        MOVR    R6,     R0                      ; DF29   00B0
        SLLC    R0,     1                       ; DF2A   0058
        MOVR    R7,     R0                      ; DF2B   00B8
        SLLC    R0,     1                       ; DF2C   0058
        ADDR    R0,     R0                      ; DF2D   00C0
        SLLC    R0,     1                       ; DF2E   0058
        ADDR    R1,     R0                      ; DF2F   00C8
        SLLC    R0,     1                       ; DF30   0058
        ADDR    R2,     R0                      ; DF31   00D0
        SLLC    R0,     1                       ; DF32   0058
        ADDR    R3,     R0                      ; DF33   00D8
        SLLC    R0,     1                       ; DF34   0058
        ADDR    R4,     R0                      ; DF35   00E0
        SLLC    R0,     1                       ; DF36   0058
        RSWD    R1                              ; DF37   0039
        INCR    R0                              ; DF38   0008
        SWAP    R1,     1                       ; DF39   0041
        INCR    R0                              ; DF3A   0008
        SLL     R1,     1                       ; DF3B   0049
        INCR    R0                              ; DF3C   0008
        RLC     R1,     1                       ; DF3D   0051
        INCR    R0                              ; DF3E   0008
        SLLC    R3,     1                       ; DF3F   005B
        INCR    R0                              ; DF40   0008
        SLR     R3,     1                       ; DF41   0063
L_DF42:
        INCR    R0                              ; DF42   0008
        SAR     R3,     1                       ; DF43   006B
        INCR    R0                              ; DF44   0008
        MOVR    R3,     R0                      ; DF45   0098
        MOVR    R3,     R0                      ; DF46   0098
        MOVR    R4,     R0                      ; DF47   00A0
        MOVR    R3,     R0                      ; DF48   0098
        MOVR    R5,     R0                      ; DF49   00A8
        SLLC    R0,     1                       ; DF4A   0058
        MOVR    R6,     R0                      ; DF4B   00B0
        SLLC    R0,     1                       ; DF4C   0058
        MOVR    R7,     R0                      ; DF4D   00B8
        SLLC    R0,     1                       ; DF4E   0058
        ADDR    R0,     R0                      ; DF4F   00C0
        SLLC    R0,     1                       ; DF50   0058
        ADDR    R1,     R0                      ; DF51   00C8
        SLLC    R0,     1                       ; DF52   0058
        ADDR    R2,     R0                      ; DF53   00D0
        SLLC    R0,     1                       ; DF54   0058
        SLLC    R0,     1                       ; DF55   0058
        SLLC    R0,     1                       ; DF56   0058
        SLR     R0,     1                       ; DF57   0060
        SLLC    R0,     1                       ; DF58   0058
        SAR     R0,     1                       ; DF59   0068
        SLLC    R0,     1                       ; DF5A   0058
        RRC     R0,     1                       ; DF5B   0070
        SLLC    R0,     1                       ; DF5C   0058
        SARC    R0,     1                       ; DF5D   0078
        SLLC    R0,     1                       ; DF5E   0058
        TSTR    R0                              ; DF5F   0080
        SLLC    R0,     1                       ; DF60   0058
        RSWD    R0                              ; DF61   0038
        SLL     R0,     1                       ; DF62   0048
        SWAP    R0,     1                       ; DF63   0040
        SLL     R0,     1                       ; DF64   0048
        SLL     R0,     1                       ; DF65   0048
        SLL     R0,     1                       ; DF66   0048
        RLC     R0,     1                       ; DF67   0050
        SLL     R0,     1                       ; DF68   0048
        SLLC    R0,     1                       ; DF69   0058
        SLL     R0,     1                       ; DF6A   0048
        SLR     R0,     1                       ; DF6B   0060
        SLL     R0,     1                       ; DF6C   0048
        SAR     R0,     1                       ; DF6D   0068
        SLL     R0,     1                       ; DF6E   0048
        RRC     R0,     1                       ; DF6F   0070
        SLL     R0,     1                       ; DF70   0048
        SARC    R0,     1                       ; DF71   0078
        SLL     R0,     1                       ; DF72   0048
        TSTR    R0                              ; DF73   0080
        SLL     R0,     1                       ; DF74   0048
        MOVR    R1,     R0                      ; DF75   0088
        SLL     R0,     1                       ; DF76   0048
        MOVR    R2,     R0                      ; DF77   0090
        SLL     R0,     1                       ; DF78   0048
        RSWD    R3                              ; DF79   003B
        MOVR    R3,     R0                      ; DF7A   0098
        SWAP    R3,     1                       ; DF7B   0043
        MOVR    R3,     R0                      ; DF7C   0098
        SLL     R3,     1                       ; DF7D   004B
        MOVR    R3,     R0                      ; DF7E   0098
        RLC     R3,     1                       ; DF7F   0053
        SLLC    R0,     1                       ; DF80   0058
        SLLC    R3,     1                       ; DF81   005B
        SLLC    R0,     1                       ; DF82   0058
        SLR     R3,     1                       ; DF83   0063
L_DF84:
        SLLC    R0,     1                       ; DF84   0058
        SAR     R3,     1                       ; DF85   006B
        SLLC    R0,     1                       ; DF86   0058
        RRC     R3,     1                       ; DF87   0073
        SLLC    R0,     1                       ; DF88   0058
        SARC    R3,     1                       ; DF89   007B
        SLLC    R0,     1                       ; DF8A   0058
        MOVR    R0,     R3                      ; DF8B   0083
        MOVR    R3,     R0                      ; DF8C   0098
        MOVR    R1,     R3                      ; DF8D   008B
        MOVR    R3,     R0                      ; DF8E   0098
        MOVR    R2,     R3                      ; DF8F   0093
        MOVR    R3,     R0                      ; DF90   0098
        TSTR    R3                              ; DF91   009B
        SLLC    R0,     1                       ; DF92   0058
        MOVR    R4,     R3                      ; DF93   00A3
        SLLC    R0,     1                       ; DF94   0058
        MOVR    R5,     R3                      ; DF95   00AB
        SLLC    R0,     1                       ; DF96   0058
        MOVR    R6,     R3                      ; DF97   00B3
        SLLC    R0,     1                       ; DF98   0058
        MOVR    R7,     R3                      ; DF99   00BB
        SLLC    R0,     1                       ; DF9A   0058
        ADDR    R0,     R3                      ; DF9B   00C3
        SLLC    R0,     1                       ; DF9C   0058
        SARC    R0,     1                       ; DF9D   0078
        SLLC    R0,     1                       ; DF9E   0058
        TSTR    R0                              ; DF9F   0080
        SLLC    R0,     1                       ; DFA0   0058
        MOVR    R1,     R0                      ; DFA1   0088
        SLLC    R0,     1                       ; DFA2   0058
        MOVR    R2,     R0                      ; DFA3   0090
        ADDR    R3,     R0                      ; DFA4   00D8
        MOVR    R3,     R0                      ; DFA5   0098
        SLLC    R0,     1                       ; DFA6   0058
        MOVR    R4,     R0                      ; DFA7   00A0
L_DFA8:
        SLLC    R0,     1                       ; DFA8   0058
        DECLE   $00A8,  $00D8,  $00B3,  $0018   ; DFA9   00A8 00D8 00B3 0018
        DECLE   $0038,  $00D8,  $0040,  $0058   ; DFAD   0038 00D8 0040 0058
        DECLE   $0048,  $0058,  $0050,  $0058   ; DFB1   0048 0058 0050 0058
        DECLE   $0058,  $00D8,  $0060,  $0058   ; DFB5   0058 00D8 0060 0058
        DECLE   $0068,  $0058,  $0073,  $0018   ; DFB9   0068 0058 0073 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC9   0000 0000 0000 0000
        DECLE   $0003,  $0003,  $0028,  $0003   ; DFCD   0003 0003 0028 0003
        DECLE   $0000,  $0000,  $0008,  $0000   ; DFD1   0000 0000 0008 0000
        DECLE   $0000,  $002B,  $0007,  $002B   ; DFD5   0000 002B 0007 002B
        DECLE   $0000,  $0004,  $0006,  $0006   ; DFD9   0000 0004 0006 0006
        DECLE   $0003,  $0027,  $0028,  $0028   ; DFDD   0003 0027 0028 0028
        DECLE   $002B,  $0007,  $0027,  $0007   ; DFE1   002B 0007 0027 0007
        DECLE   $0004,  $0007,  $0007,  $0005   ; DFE5   0004 0007 0007 0005
        DECLE   $0004,  $0006,  $0005,  $0006   ; DFE9   0004 0006 0005 0006
        DECLE   $0001,  $0001,  $0001,  $0009   ; DFED   0001 0001 0001 0009
        DECLE   $0012,  $0014,  $0026,  $0023   ; DFF1   0012 0014 0026 0023
        DECLE   $0024,  $0026,  $0023,  $0000   ; DFF5   0024 0026 0023 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF9   0000 0000 0000 0000

        DECR    R1                              ; DFFD   0011
        DECR    R1                              ; DFFE   0011
        DECR    R1                              ; DFFF   0011

        ORG     $F000
        DECLE   $0011,  $0011,  $0011,  $0011   ; F000   0011 0011 0011 0011
        DECLE   $0011,  $000E,  $000E,  $000E   ; F004   0011 000E 000E 000E
        DECLE   $000E,  $000D,  $000D,  $000D   ; F008   000E 000D 000D 000D
        DECLE   $000D,  $002B,  $0000,  $0000   ; F00C   000D 002B 0000 0000
        DECLE   $0000                           ; F010   0000

        INCR    R7                              ; F011   000F

        ADCR    R3                              ; F012   002B
L_F013:
        ADCR    R3                              ; F013   002B
        DECLE   $0010,  $002A,  $002A,  $002A   ; F014   0010 002A 002A 002A
        DECLE   $002A,  $0029,  $0029,  $0029   ; F018   002A 0029 0029 0029
        DECLE   $0029,  $0000,  $0000,  $0000   ; F01C   0029 0000 0000 0000
        DECLE   $0000,  $0000,  $0016,  $0016   ; F020   0000 0000 0016 0016
        DECLE   $0000,  $0000                   ; F024   0000 0000
L_F026:
        DECR    R7                              ; F026   0017

        DECLE   $0018,  $0000,  $0000,  $0000   ; F027   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F02B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000B,  $000A   ; F02F   0000 0000 000B 000A
        DECLE   $000A,  $000C,  $002B,  $002B   ; F033   000A 000C 002B 002B
        DECLE   $002B,  $002B,  $0000,  $0000   ; F037   002B 002B 0000 0000
        DECLE   $0000,  $0000,  $0013,  $0013   ; F03B   0000 0000 0013 0013
        DECLE   $0014,  $0000,  $0025,  $0025   ; F03F   0014 0000 0025 0025
        DECLE   $0013,  $0014,  $0025,  $0025   ; F043   0013 0014 0025 0025
        DECLE   $0025,  $0026,  $0026,  $0023   ; F047   0025 0026 0026 0023
        DECLE   $0000,  $0000,  $0013,  $0013   ; F04B   0000 0000 0013 0013
        DECLE   $0014,  $0000,  $0025,  $0026   ; F04F   0014 0000 0025 0026
        DECLE   $0013,  $0014,  $0025,  $0025   ; F053   0013 0014 0025 0025
        DECLE   $0026,  $0013,  $0024,  $0025   ; F057   0026 0013 0024 0025
        DECLE   $0025,  $0026,  $0013,  $0013   ; F05B   0025 0026 0013 0013
        DECLE   $0013,  $0013,  $0012,  $0013   ; F05F   0013 0013 0012 0013
        DECLE   $0013,  $0014,  $002B,  $0012   ; F063   0013 0014 002B 0012
        DECLE   $0014,  $002B,  $0000,  $002B   ; F067   0014 002B 0000 002B
        DECLE   $002B,  $0000,  $0014,  $0000   ; F06B   002B 0000 0014 0000
        DECLE   $0000,  $0000,  $002B,  $0000   ; F06F   0000 0000 002B 0000
        DECLE   $0000,  $0000,  $0000,  $0012   ; F073   0000 0000 0000 0012
        DECLE   $0014,  $0000,  $0000,  $002B   ; F077   0014 0000 0000 002B
        DECLE   $002B,  $0000,  $0000,  $0000   ; F07B   002B 0000 0000 0000
        DECLE   $0000,  $0000,  $0012,  $0013   ; F07F   0000 0000 0012 0013
        DECLE   $0013,  $0014,  $002B,  $0012   ; F083   0013 0014 002B 0012
        DECLE   $0014,  $002B,  $0000,  $002B   ; F087   0014 002B 0000 002B
        DECLE   $002B,  $0000,  $0000,  $0000   ; F08B   002B 0000 0000 0000
        DECLE   $0000,  $0000,  $0012,  $0013   ; F08F   0000 0000 0012 0013
        DECLE   $0013,  $0014,  $002B,  $0015   ; F093   0013 0014 002B 0015
        DECLE   $002B,  $0000,  $0000,  $0000   ; F097   002B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F09B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; F09F   0000 0000 0001 0001
        DECLE   $0001,  $0009,  $0000,  $0000   ; F0A3   0001 0009 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0016   ; F0AB   0000 0000 0000 0016
        DECLE   $0016,  $0000,  $0000           ; F0AF   0016 0000 0000
L_F0B2:
        DECR    R7                              ; F0B2   0017

        DECLE   $0018,  $0000,  $0000,  $0000   ; F0B3   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000B,  $000A   ; F0BB   0000 0000 000B 000A
        DECLE   $000A,  $000A,  $002B,  $002B   ; F0BF   000A 000A 002B 002B
        DECLE   $002B,  $002B,  $0000,  $0000   ; F0C3   002B 002B 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $000A   ; F0CB   0000 0000 000A 000A
        DECLE   $000A,  $000C,  $002B,  $002B   ; F0CF   000A 000C 002B 002B
        DECLE   $002B,  $002B,  $0000,  $0000   ; F0D3   002B 002B 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $000C   ; F0DB   0000 0000 000A 000C
        DECLE   $0000,  $0000,  $002B,  $002B   ; F0DF   0000 0000 002B 002B
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001B,  $001A   ; F0EB   0000 0000 001B 001A
        DECLE   $001A,  $0000,  $0000,  $0019   ; F0EF   001A 0000 0000 0019
        DECLE   $0000,  $001A,  $0000,  $0000   ; F0F3   0000 001A 0000 0000
        DECLE   $001B,  $001B,  $001B,  $001B   ; F0F7   001B 001B 001B 001B
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001B,  $001A   ; F0FF   0000 0000 001B 001A
        DECLE   $0000,  $0000,  $001A,  $0000   ; F103   0000 0000 001A 0000
        DECLE   $001B,  $001A,  $0000,  $001A   ; F107   001B 001A 0000 001A
        DECLE   $0019,  $0000,  $0000,  $0020   ; F10B   0019 0000 0000 0020
        DECLE   $0003,  $0000,  $0021,  $0021   ; F10F   0003 0000 0021 0021
        DECLE   $0022,  $0000,  $0000,  $0021   ; F113   0022 0000 0000 0021
        DECLE   $0021,  $0003,  $0000,  $0003   ; F117   0021 0003 0000 0003
        DECLE   $0000,  $0000,  $0003,  $0021   ; F11B   0000 0000 0003 0021
        DECLE   $0022,  $0000,  $0000,  $0003   ; F11F   0022 0000 0000 0003
        DECLE   $0021,  $0021,  $0000,  $0000   ; F123   0021 0021 0000 0000
        DECLE   $0000,  $0003,  $0000,  $0000   ; F127   0000 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F12B   0000 0000 0000 0000
        DECLE   $0021,  $0020,  $0020,  $0003   ; F12F   0021 0020 0020 0003
        DECLE   $0020,  $0021,  $0003,  $0021   ; F133   0020 0021 0003 0021
        DECLE   $0021,  $001F,  $0000,  $0000   ; F137   0021 001F 0000 0000
        DECLE   $001F,  $0000,  $0000,  $0021   ; F13B   001F 0000 0000 0021
        DECLE   $0021,  $0020,  $0000,  $0000   ; F13F   0021 0020 0000 0000
        DECLE   $0021,  $0021,  $0000,  $0020   ; F143   0021 0021 0000 0020
        DECLE   $001F,  $0021,  $0000,  $0003   ; F147   001F 0021 0000 0003
        DECLE   $0020,  $0003,  $0003,  $0021   ; F14B   0020 0003 0003 0021
        DECLE   $001F,  $0000,  $0020,  $0021   ; F14F   001F 0000 0020 0021
        DECLE   $0021,  $0020,  $0021,  $001F   ; F153   0021 0020 0021 001F
        DECLE   $0020,  $001F,  $0000,  $0000   ; F157   0020 001F 0000 0000
        DECLE   $0000,  $0003,  $0000,  $0000   ; F15B   0000 0003 0000 0000
        DECLE   $0019,  $0003,  $0019,  $0000   ; F15F   0019 0003 0019 0000
        DECLE   $0000,  $0000,  $0000,  $0019   ; F163   0000 0000 0000 0019
        DECLE   $0000,  $0000,  $0000,  $0000   ; F167   0000 0000 0000 0000
        DECLE   $0000,  $0019,  $0000,  $0019   ; F16B   0000 0019 0000 0019
        DECLE   $0000,  $0019,  $0000,  $0000   ; F16F   0000 0019 0000 0000
        DECLE   $001C,  $001C,  $0019,  $0000   ; F173   001C 001C 0019 0000
        DECLE   $0000,  $0019,  $0000,  $0019   ; F177   0000 0019 0000 0019
        DECLE   $0000,  $0000,  $001C,  $001C   ; F17B   0000 0000 001C 001C
        DECLE   $0019,  $0019,  $0019,  $0000   ; F17F   0019 0019 0019 0000
        DECLE   $0000,  $0000,  $0000,  $0019   ; F183   0000 0000 0000 0019
        DECLE   $0000,  $0000,  $0021,  $0003   ; F187   0000 0000 0021 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; F18B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F18F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $002D,  $002C   ; F193   0000 0000 002D 002C
        DECLE   $002C,  $002E,  $0000,  $0000   ; F197   002C 002E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F19B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $002D,  $002C   ; F19F   0000 0000 002D 002C
        DECLE   $002C,  $002C,  $0000,  $0000   ; F1A3   002C 002C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $002C,  $002C   ; F1AF   0000 0000 002C 002C
        DECLE   $002C,  $002E,  $0000,  $0000   ; F1B3   002C 002E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $002C,  $002C   ; F1BF   0000 0000 002C 002C
        DECLE   $002C,  $002C,  $0000,  $0000   ; F1C3   002C 002C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003B,  $003C   ; F1CB   0000 0000 003B 003C
        DECLE   $003D,  $003E,  $0037,  $0038   ; F1CF   003D 003E 0037 0038
        DECLE   $0039,  $003A,  $0032,  $0033   ; F1D3   0039 003A 0032 0033
        DECLE   $0035,  $0036                   ; F1D7   0035 0036

        ADCR    R7                              ; F1D9   002F

        GSWD    R0                              ; F1DA   0030
L_F1DB:
        GSWD    R1                              ; F1DB   0031
        DECLE   $002B,  $0000,  $0000,  $0000   ; F1DC   002B 0000 0000 0000
        DECLE   $0000,  $0000,  $004B,  $004C   ; F1E0   0000 0000 004B 004C
        DECLE   $004D,  $0000,  $0048,  $0049   ; F1E4   004D 0000 0048 0049
        DECLE   $004A,  $0000,  $002B,  $0046   ; F1E8   004A 0000 002B 0046
        DECLE   $0047,  $0000,  $0000,  $0000   ; F1EC   0047 0000 0000 0000
        DECLE   $0000,  $0051,  $0052,  $0053   ; F1F0   0000 0051 0052 0053
        DECLE   $0000,  $004E,  $004F,  $0050   ; F1F4   0000 004E 004F 0050
        DECLE   $0000,  $0046,  $0047,  $002B   ; F1F8   0000 0046 0047 002B
        DECLE   $0000,  $0054,  $0054,  $0059   ; F1FC   0000 0054 0054 0059
        DECLE   $0000,  $0054,  $0058,  $0000   ; F200   0000 0054 0058 0000
        DECLE   $0000,  $0054,  $0056,  $0057   ; F204   0000 0054 0056 0057
        DECLE   $0000,  $0054,  $0054,  $0055   ; F208   0000 0054 0054 0055
        DECLE   $0000,  $0000,  $005F,  $005A   ; F20C   0000 0000 005F 005A
        DECLE   $005A,  $0000,  $0000,  $005E   ; F210   005A 0000 0000 005E
        DECLE   $005A,  $0000,  $005C,  $005D   ; F214   005A 0000 005C 005D
        DECLE   $005A,  $0000,  $005B,  $005A   ; F218   005A 0000 005B 005A
        DECLE   $005A,  $0042,  $0042,  $0041   ; F21C   005A 0042 0042 0041
        DECLE   $0041,  $0034,  $0034,  $0034   ; F220   0041 0034 0034 0034
        DECLE   $0034,  $0034,  $0034,  $0034   ; F224   0034 0034 0034 0034
        DECLE   $0034,  $0040,  $003F,  $0034   ; F228   0034 0040 003F 0034
        DECLE   $003F,  $0041,  $0034,  $0042   ; F22C   003F 0041 0034 0042
        DECLE   $0041,  $0034,  $0034,  $0034   ; F230   0041 0034 0034 0034
        DECLE   $0034,  $0034,  $0034,  $0034   ; F234   0034 0034 0034 0034
        DECLE   $0034,  $003F,  $0034,  $0034   ; F238   0034 003F 0034 0034
        DECLE   $0040,  $0041,  $0034,  $0034   ; F23C   0040 0041 0034 0034
        DECLE   $0042,  $0034,  $0034,  $0034   ; F240   0042 0034 0034 0034
        DECLE   $0034,  $0034,  $0034,  $0034   ; F244   0034 0034 0034 0034
        DECLE   $0034,  $003F,  $0040,  $0040   ; F248   0034 003F 0040 0040
        DECLE   $003F,  $0043,  $0044,  $0044   ; F24C   003F 0043 0044 0044
        DECLE   $0045,  $0043,  $0044,  $0044   ; F250   0045 0043 0044 0044
        DECLE   $0045,  $0043,  $0044,  $0044   ; F254   0045 0043 0044 0044
        DECLE   $0045,  $0043,  $0044,  $0044   ; F258   0045 0043 0044 0044
        DECLE   $0045,  $0000,  $0000,  $0000   ; F25C   0045 0000 0000 0000
        DECLE   $0000,  $0000,  $0066,  $0067   ; F260   0000 0000 0066 0067
        DECLE   $0068,  $0000,  $0063,  $0064   ; F264   0068 0000 0063 0064
        DECLE   $0065,  $0000,  $0060,  $0061   ; F268   0065 0000 0060 0061
        DECLE   $0062,  $0000,  $0079,  $0000   ; F26C   0062 0000 0079 0000
        DECLE   $0079,  $0076,  $0077,  $0078   ; F270   0079 0076 0077 0078
        DECLE   $0078,  $0072,  $0073,  $0074   ; F274   0078 0072 0073 0074
        DECLE   $0074,  $002B,  $002B,  $002B   ; F278   0074 002B 002B 002B
        DECLE   $002B,  $0079,  $0000,  $0000   ; F27C   002B 0079 0000 0000
        DECLE   $0000,  $0078,  $002B,  $0000   ; F280   0000 0078 002B 0000
        DECLE   $0000,  $0075,  $002B,  $0000   ; F284   0000 0075 002B 0000
        DECLE   $0000,  $002B,  $0000,  $0000   ; F288   0000 002B 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F28C   0000 0000 0000 0000
        DECLE   $0081,  $0000,  $0000,  $002B   ; F290   0081 0000 0000 002B
        DECLE   $007E,  $0000,  $0000,  $002B   ; F294   007E 0000 0000 002B
        DECLE   $007A,  $0000,  $0000,  $0000   ; F298   007A 0000 0000 0000
        DECLE   $002B,  $0081,  $0000,  $0081   ; F29C   002B 0081 0000 0081
        DECLE   $0000,  $007E,  $007E,  $007F   ; F2A0   0000 007E 007E 007F
        DECLE   $0080,  $007B,  $007B,  $007C   ; F2A4   0080 007B 007B 007C
        DECLE   $007D,  $002B,  $002B,  $002B   ; F2A8   007D 002B 002B 002B
        DECLE   $002B,  $0000,  $0012,  $0013   ; F2AC   002B 0000 0012 0013
        DECLE   $0013,  $0012,  $0013,  $0025   ; F2B0   0013 0012 0013 0025
        DECLE   $0025,  $0026,  $0025,  $0025   ; F2B4   0025 0026 0025 0025
        DECLE   $0025,  $0000,  $0000,  $0023   ; F2B8   0025 0000 0000 0023
        DECLE   $0026,  $0000,  $0012,  $0013   ; F2BC   0026 0000 0012 0013
        DECLE   $0013,  $0012,  $0013,  $0024   ; F2C0   0013 0012 0013 0024
        DECLE   $0025,  $0012,  $0024,  $0025   ; F2C4   0025 0012 0024 0025
        DECLE   $0025,  $0024,  $0025,  $0025   ; F2C8   0025 0024 0025 0025
        DECLE   $0026,  $0000,  $0000,  $0000   ; F2CC   0026 0000 0000 0000
        DECLE   $0000,  $0000,  $006F,  $0070   ; F2D0   0000 0000 006F 0070
        DECLE   $0071,  $0000,  $006C,  $006D   ; F2D4   0071 0000 006C 006D
        DECLE   $006E,  $0000,  $0069,  $006A   ; F2D8   006E 0000 0069 006A
        DECLE   $006B,  $0003,  $0000,  $001A   ; F2DC   006B 0003 0000 001A
        DECLE   $0002,  $0016,  $001A,  $0001   ; F2E0   0002 0016 001A 0001
        DECLE   $0000,  $0000,  $0000,  $001B   ; F2E4   0000 0000 0000 001B
        DECLE   $0013,  $0013,  $0014,  $002F   ; F2E8   0013 0013 0014 002F
        DECLE   $000C,  $0000,  $0001,  $0000   ; F2EC   000C 0000 0001 0000

        COMR    R2                              ; F2F0   001A
L_F2F1:
        DECR    R7                              ; F2F1   0017

        DECLE   $0019,  $0015,  $0002,  $0000   ; F2F2   0019 0015 0002 0000
        DECLE   $0016,  $0000,  $0001,  $0000   ; F2F6   0016 0000 0001 0000
        DECLE   $0000,  $000E,  $0000,  $001B   ; F2FA   0000 000E 0000 001B
        DECLE   $001A,  $0030,  $0000,  $001A   ; F2FE   001A 0030 0000 001A
        DECLE   $0000,  $0001,  $0000,  $001C   ; F302   0000 0001 0000 001C
        DECLE   $0000,  $0000,  $0007,  $0000   ; F306   0000 0000 0007 0000
        DECLE   $0009,  $0000,  $001A,  $001B   ; F30A   0009 0000 001A 001B
        DECLE   $001C,  $0008,  $0000,  $0000   ; F30E   001C 0008 0000 0000
        DECLE   $001A,  $0000,  $0000           ; F312   001A 0000 0000

        INCR    R2                              ; F315   000A
        INCR    R3                              ; F316   000B
        DECR    R6                              ; F317   0016
        COMR    R4                              ; F318   001C
        COMR    R2                              ; F319   001A
        COMR    R0                              ; F31A   0018
L_F31B:
        DECR    R7                              ; F31B   0017
L_F31C:
        DECR    R7                              ; F31C   0017

        DECLE   $0019,  $0001,  $0016,  $0015   ; F31D   0019 0001 0016 0015
        DECLE   $0001,  $0018,  $0014,  $0001   ; F321   0001 0018 0014 0001
        DECLE   $0000,  $0000,  $0019,  $001A   ; F325   0000 0000 0019 001A
        DECLE   $001B,  $001C,  $0000,  $0007   ; F329   001B 001C 0000 0007
        DECLE   $0004,  $0004,  $0005,  $0004   ; F32D   0004 0004 0005 0004
        DECLE   $0004,  $0019,  $001C,  $0000   ; F331   0004 0019 001C 0000
        DECLE   $0000,  $0000,  $0018,  $000F   ; F335   0000 0000 0018 000F
        DECLE   $001A,  $000F,  $0016,  $000F   ; F339   001A 000F 0016 000F
        DECLE   $0000,  $0000,  $001A,  $0006   ; F33D   0000 0000 001A 0006
        DECLE   $001C,  $0006,  $0000,  $0000   ; F341   001C 0006 0000 0000
        DECLE   $0000,  $001B,  $001C,  $0000   ; F345   0000 001B 001C 0000
        DECLE   $0006,  $0000,  $0014,  $0014   ; F349   0006 0000 0014 0014
        DECLE   $0000,  $0000,  $0018,  $000F   ; F34D   0000 0000 0018 000F
        DECLE   $0013,  $000F,  $0000,  $000F   ; F351   0013 000F 0000 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; F355   0000 0000 0000 0000
L_F359:
        DECR    R7                              ; F359   0017

        DECLE   $0000,  $0007,  $0000,  $001A   ; F35A   0000 0007 0000 001A
        DECLE   $0013,  $0012,  $0000,  $0010   ; F35E   0013 0012 0000 0010
        DECLE   $0011,  $0016,  $001B,  $001A   ; F362   0011 0016 001B 001A
        DECLE   $0013,  $0015,  $0016,  $0007   ; F366   0013 0015 0016 0007
        DECLE   $0010,  $0012,  $0016,  $0000   ; F36A   0010 0012 0016 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F36E   0000 0000 0000 0000
        DECLE   $0007,  $0000,  $0000,  $0000   ; F372   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F376   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F37A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F37E   0000 0000 0000 0000

        COMR    R2                              ; F382   001A
        COMR    R0                              ; F383   0018
L_F384:
        DECR    R7                              ; F384   0017
L_F385:
        DECR    R7                              ; F385   0017

        DECLE   $0019,  $0014,  $001A,  $0000   ; F386   0019 0014 001A 0000
        DECLE   $0000,  $0018,  $0014,  $0014   ; F38A   0000 0018 0014 0014
        DECLE   $001A,  $0000,  $0000,  $0014   ; F38E   001A 0000 0000 0014
        DECLE   $001A,  $0000,  $001C,  $0000   ; F392   001A 0000 001C 0000

        COMR    R5                              ; F396   001D
        DECR    R6                              ; F397   0016
L_F398:
        DECR    R7                              ; F398   0017

        DECLE   $0019,  $001A,  $0000,  $0000   ; F399   0019 001A 0000 0000
        DECLE   $0000,  $001E,  $001F,  $001B   ; F39D   0000 001E 001F 001B
        DECLE   $001A,  $0019,  $0015,  $0016   ; F3A1   001A 0019 0015 0016
        DECLE   $001E,  $001F,  $001A,  $001E   ; F3A5   001E 001F 001A 001E
        DECLE   $001F,  $0013,  $0000,  $001D   ; F3A9   001F 0013 0000 001D
        DECLE   $001A,  $0000,  $001A,  $001C   ; F3AD   001A 0000 001A 001C
        DECLE   $0000,  $001E,  $0020,  $001D   ; F3B1   0000 001E 0020 001D
        DECLE   $0014,  $0014,  $001B,  $001C   ; F3B5   0014 0014 001B 001C
        DECLE   $0000,  $001E,  $0020,  $001F   ; F3B9   0000 001E 0020 001F
        DECLE   $0019,  $001D,  $0015,  $0000   ; F3BD   0019 001D 0015 0000
        DECLE   $0000,  $0018,  $0019,  $0019   ; F3C1   0000 0018 0019 0019
        DECLE   $0000,  $0000,  $0019,  $0004   ; F3C5   0000 0000 0019 0004
        DECLE   $0004,  $0005,  $0004,  $0004   ; F3C9   0004 0005 0004 0004
        DECLE   $0019,  $0000,  $0000,  $0000   ; F3CD   0019 0000 0000 0000
L_F3D1:
        DECR    R7                              ; F3D1   0017

        DECLE   $0000,  $0000,  $0000,  $001A   ; F3D2   0000 0000 0000 001A
        DECLE   $0013,  $0021,  $0000,  $0000   ; F3D6   0013 0021 0000 0000
        DECLE   $0015,  $0016,  $001C,  $0000   ; F3DA   0015 0016 001C 0000
        DECLE   $0014,  $0014,  $0016,  $0026   ; F3DE   0014 0014 0016 0026
        DECLE   $0029,  $0027,  $0028,  $0026   ; F3E2   0029 0027 0028 0026
        DECLE   $0015,  $0000,  $0000,  $0000   ; F3E6   0015 0000 0000 0000
        DECLE   $0000,  $0022,  $001A,  $0000   ; F3EA   0000 0022 001A 0000
        DECLE   $0015,  $0016,  $001A,  $001B   ; F3EE   0015 0016 001A 001B
        DECLE   $0000,  $0014,  $001C,  $0000   ; F3F2   0000 0014 001C 0000
        DECLE   $0016,  $0000,  $001A,  $0023   ; F3F6   0016 0000 001A 0023
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3FA   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0000,  $0000   ; F3FE   0000 0022 0000 0000
        DECLE   $001A,  $0019,  $0019,  $0000   ; F402   001A 0019 0019 0000
        DECLE   $0000,  $001A,  $0014,  $0024   ; F406   0000 001A 0014 0024
        DECLE   $0000,  $0000,  $0000,  $0025   ; F40A   0000 0000 0000 0025
        DECLE   $0024,  $0000,  $0000,  $0000   ; F40E   0024 0000 0000 0000
        DECLE   $0025,  $0024,  $0000,  $0000   ; F412   0025 0024 0000 0000
        DECLE   $0000,  $0025,  $0019,  $001C   ; F416   0000 0025 0019 001C
        DECLE   $0000,  $0000,  $0031,  $0015   ; F41A   0000 0000 0031 0015
        DECLE   $002A,  $0000,  $0000,  $0019   ; F41E   002A 0000 0000 0019
        DECLE   $001A,  $0000,  $0000,  $0031   ; F422   001A 0000 0000 0031
        DECLE   $0018,  $002A,  $0000,  $001A   ; F426   0018 002A 0000 001A
        DECLE   $001B,  $0019,  $0000,  $0000   ; F42A   001B 0019 0000 0000
        DECLE   $0014,  $002A,  $0000,  $0000   ; F42E   0014 002A 0000 0000
        DECLE   $0031,  $0000,  $0000,  $0031   ; F432   0031 0000 0000 0031
        DECLE   $0014,  $0000,  $002A,  $0000   ; F436   0014 0000 002A 0000
        DECLE   $0000,  $0015,  $0031,  $0000   ; F43A   0000 0015 0031 0000
        DECLE   $0000,  $001A,  $002A,  $0000   ; F43E   0000 001A 002A 0000
        DECLE   $001A,  $0000,  $0031,  $001B   ; F442   001A 0000 0031 001B
        DECLE   $001A,  $0019,  $0015,  $0016   ; F446   001A 0019 0015 0016
        DECLE   $0013,  $0000,  $001A,  $001E   ; F44A   0013 0000 001A 001E
        DECLE   $001F,  $001C,  $0000,  $002A   ; F44E   001F 001C 0000 002A
        DECLE   $0000,  $0000,  $0000,  $0000   ; F452   0000 0000 0000 0000
        DECLE   $001A,  $002A,  $0000,  $002A   ; F456   001A 002A 0000 002A
        DECLE   $0000,  $0000,  $0000,  $0031   ; F45A   0000 0000 0000 0031
        DECLE   $0000,  $0000,  $0000,  $0031   ; F45E   0000 0000 0000 0031
        DECLE   $001A,  $001F,  $0000,  $0000   ; F462   001A 001F 0000 0000
        DECLE   $0000,  $001A,  $0000,  $001D   ; F466   0000 001A 0000 001D
        DECLE   $0000,  $0000,  $0000,  $0004   ; F46A   0000 0000 0000 0004
        DECLE   $0004,  $0005,  $0004,  $0004   ; F46E   0004 0005 0004 0004
        DECLE   $0019,  $001C,  $0000,  $0000   ; F472   0019 001C 0000 0000
L_F476:
        DECR    R7                              ; F476   0017

        DECLE   $0018,  $0000,  $001D,  $0000   ; F477   0018 0000 001D 0000
        DECLE   $0016,  $0019,  $0000,  $0000   ; F47B   0016 0019 0000 0000

        ADCR    R3                              ; F47F   002B
        ADCR    R4                              ; F480   002C
L_F481:
        DECR    R7                              ; F481   0017

        DECLE   $0014,  $0000,  $0000,  $0000   ; F482   0014 0000 0000 0000
        DECLE   $0015,  $0013,  $002B,  $002C   ; F486   0015 0013 002B 002C
        DECLE   $0000,  $001A,  $0000,  $0000   ; F48A   0000 001A 0000 0000
        DECLE   $0000,  $0000,  $002B,  $002C   ; F48E   0000 0000 002B 002C
        DECLE   $0000,  $002D,  $002E,  $0019   ; F492   0000 002D 002E 0019
        DECLE   $0000,  $0000,  $001A,  $0019   ; F496   0000 0000 001A 0019
        DECLE   $0000,  $002B,  $002C,  $0000   ; F49A   0000 002B 002C 0000
L_F49E:
        DECR    R7                              ; F49E   0017

        DECLE   $0000,  $0000,  $0000,  $0000   ; F49F   0000 0000 0000 0000
        DECLE   $0000,  $002B,  $002C,  $0000   ; F4A3   0000 002B 002C 0000
        DECLE   $002D,  $002E,  $0013,  $0014   ; F4A7   002D 002E 0013 0014
        DECLE   $0000,  $001B,  $001C,  $0000   ; F4AB   0000 001B 001C 0000
        DECLE   $0000,  $0000,  $001A,  $0019   ; F4AF   0000 0000 001A 0019
        DECLE   $001B,  $001C,  $001A,  $0016   ; F4B3   001B 001C 001A 0016
        DECLE   $0018,  $0014,  $0013,  $0000   ; F4B7   0018 0014 0013 0000
        DECLE   $0000,  $0016,  $0000,  $0000   ; F4BB   0000 0016 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F4C3   0000 0000 0000 0000
        DECLE   $001D,  $0000,  $0000,  $0000   ; F4C7   001D 0000 0000 0000
        DECLE   $001D,  $0000,  $0001,  $0002   ; F4CB   001D 0000 0001 0002
        DECLE   $0003,  $0004,  $0005           ; F4CF   0003 0004 0005

        CLRC                                    ; F4D2   0006
        SETC                                    ; F4D3   0007
        INCR    R0                              ; F4D4   0008
        INCR    R1                              ; F4D5   0009
        INCR    R2                              ; F4D6   000A
        INCR    R3                              ; F4D7   000B
        INCR    R4                              ; F4D8   000C
        INCR    R5                              ; F4D9   000D
        INCR    R6                              ; F4DA   000E
        INCR    R7                              ; F4DB   000F

        DECR    R0                              ; F4DC   0010
L_F4DD:
        DECR    R1                              ; F4DD   0011
        DECR    R2                              ; F4DE   0012
        DECR    R3                              ; F4DF   0013
        DECR    R4                              ; F4E0   0014
        DECR    R5                              ; F4E1   0015
        DECR    R6                              ; F4E2   0016
L_F4E3:
        DECR    R7                              ; F4E3   0017

        DECLE   $0018,  $0019,  $001A,  $001B   ; F4E4   0018 0019 001A 001B
        DECLE   $001C,  $001D,  $001E,  $001F   ; F4E8   001C 001D 001E 001F
        DECLE   $0020,  $0021,  $0022,  $0023   ; F4EC   0020 0021 0022 0023
        DECLE   $0024,  $0025,  $0026,  $0027   ; F4F0   0024 0025 0026 0027

        ADCR    R0                              ; F4F4   0028
        ADCR    R1                              ; F4F5   0029
        ADCR    R2                              ; F4F6   002A
        ADCR    R3                              ; F4F7   002B
        ADCR    R4                              ; F4F8   002C
        ADCR    R5                              ; F4F9   002D
        ADCR    R6                              ; F4FA   002E
        ADCR    R7                              ; F4FB   002F

        GSWD    R0                              ; F4FC   0030
L_F4FD:
        GSWD    R1                              ; F4FD   0031
        DECLE   $0032,  $0033,  $0034,  $0035   ; F4FE   0032 0033 0034 0035
        DECLE   $0036,  $0037                   ; F502   0036 0037

        RSWD    R0                              ; F504   0038
        RSWD    R1                              ; F505   0039
        RSWD    R2                              ; F506   003A
        RSWD    R3                              ; F507   003B
        PSHR    R5                              ; F508   0275
        MVI     G_0132, R0                      ; F509   0280 0132
        INCR    R0                              ; F50B   0008
        MVO     R0,     G_0132                  ; F50C   0240 0132
        MVI     G_0330, R4                      ; F50E   0284 0330
        INCR    R7                              ; F510   000F

L_F511:
        PULR    R4                              ; F511   02B4
L_F512:
        MVI@    R4,     R1                      ; F512   02A1
        MVI@    R4,     R2                      ; F513   02A2
        CMP     G_0132, R1                      ; F514   0341 0132
        BMI     L_F512                          ; F516   022B 0005
        BGT     L_F83D                          ; F518   020E 0323

        PSHR    R4                              ; F51A   0274
        ADDR    R2,     R7                      ; F51B   00D7
        B       L_F511                          ; F51C   0220 000C

        SDBD                                    ; F51E   0001
        MVII    #$18ED, R0                      ; F51F   02B8 00ED 0018
        MVO     R0,     .BTAB.04                ; F522   0240 0204
        B       L_F511                          ; F524   0220 0014

        SDBD                                    ; F526   0001
        MVII    #$18ED, R0                      ; F527   02B8 00ED 0018
        MVO     R0,     .BTAB.0C                ; F52A   0240 020C
        B       L_F511                          ; F52C   0220 001C

        SDBD                                    ; F52E   0001
        MVII    #$18ED, R0                      ; F52F   02B8 00ED 0018
        MVO     R0,     .BTAB.11                ; F532   0240 0211
        B       L_F511                          ; F534   0220 0024

        SDBD                                    ; F536   0001
        MVII    #$18F5, R0                      ; F537   02B8 00F5 0018
        MVO     R0,     .BTAB.02                ; F53A   0240 0202
        B       L_F511                          ; F53C   0220 002C

        SDBD                                    ; F53E   0001
        MVII    #$18F5, R0                      ; F53F   02B8 00F5 0018
        MVO     R0,     .BTAB.07                ; F542   0240 0207
        B       L_F511                          ; F544   0220 0034

        SDBD                                    ; F546   0001
        MVII    #$18F5, R0                      ; F547   02B8 00F5 0018
        MVO     R0,     .BTAB.0C                ; F54A   0240 020C
        B       L_F511                          ; F54C   0220 003C

        SDBD                                    ; F54E   0001
        MVII    #$18F5, R0                      ; F54F   02B8 00F5 0018
        MVO     R0,     .BTAB.0D                ; F552   0240 020D
        B       L_F511                          ; F554   0220 0044

        SDBD                                    ; F556   0001
        MVII    #$18F5, R0                      ; F557   02B8 00F5 0018
        MVO     R0,     .BTAB.11                ; F55A   0240 0211
        B       L_F511                          ; F55C   0220 004C

        SDBD                                    ; F55E   0001
        MVII    #$18FD, R0                      ; F55F   02B8 00FD 0018
        MVO     R0,     .BTAB.02                ; F562   0240 0202
        B       L_F511                          ; F564   0220 0054

        SDBD                                    ; F566   0001
        MVII    #$18FD, R0                      ; F567   02B8 00FD 0018
        MVO     R0,     .BTAB.0E                ; F56A   0240 020E
        B       L_F511                          ; F56C   0220 005C

        MVI     G_015E, R0                      ; F56E   0280 015E
        ANDI    #$0010, R0                      ; F570   03B8 0010
        XOR     G_015E, R0                      ; F572   03C0 015E
        XORI    #$0010, R0                      ; F574   03F8 0010
        MVO     R0,     G_015E                  ; F576   0240 015E
        MVI     G_0146, R0                      ; F578   0280 0146
        XORI    #$0008, R0                      ; F57A   03F8 0008
        MVO     R0,     G_0146                  ; F57C   0240 0146
        MVII    #$0014, R0                      ; F57E   02B8 0014
        MVO     R0,     G_0163                  ; F580   0240 0163

        JSR     R5,     L_6DBE                  ; F582   0004 016C 01BE
        DECLE   $0018                           ; F585   0018

        SDBD                                    ; F586   0001
        MVII    #$9898, R1                      ; F587   02B9 0098 0098
        B       L_F590                          ; F58A   0200 0004

        SDBD                                    ; F58C   0001
        MVII    #$9818, R1                      ; F58D   02B9 0018 0098
L_F590:
        SDBD                                    ; F590   0001
        MVII    #$5810, R0                      ; F591   02B8 0010 0058
        MVII    #$0200, R4                      ; F594   02BC 0200

        JSR     R5,     L_6841                  ; F596   0004 0168 0041

        MVO@    R1,     R4                      ; F599   0261
        ADDI    #$0008, R1                      ; F59A   02F9 0008
        MVO@    R1,     R4                      ; F59C   0261
        ADDI    #$0008, R1                      ; F59D   02F9 0008
        MVO@    R1,     R4                      ; F59F   0261
        ADDI    #$0008, R1                      ; F5A0   02F9 0008
        MVO@    R1,     R4                      ; F5A2   0261

        JSR     R5,     L_6841                  ; F5A3   0004 0168 0041

        B       L_F511                          ; F5A6   0220 0096

        MVII    #$0001, R0                      ; F5A8   02B8 0001
        B       L_F5D2                          ; F5AA   0200 0026

        MVII    #$0002, R0                      ; F5AC   02B8 0002
        B       L_F5D2                          ; F5AE   0200 0022

        MVII    #$0003, R0                      ; F5B0   02B8 0003
        B       L_F5D2                          ; F5B2   0200 001E

        MVII    #$0004, R0                      ; F5B4   02B8 0004
        B       L_F5D2                          ; F5B6   0200 001A

        MVII    #$0005, R0                      ; F5B8   02B8 0005
        B       L_F5D2                          ; F5BA   0200 0016

        MVII    #$0006, R0                      ; F5BC   02B8 0006
        B       L_F5D2                          ; F5BE   0200 0012

        MVII    #$0007, R0                      ; F5C0   02B8 0007
        B       L_F5D2                          ; F5C2   0200 000E

        MVII    #$0008, R0                      ; F5C4   02B8 0008
        B       L_F5D2                          ; F5C6   0200 000A

        MVII    #$0009, R0                      ; F5C8   02B8 0009
        B       L_F5D2                          ; F5CA   0200 0006

        MVII    #$000A, R0                      ; F5CC   02B8 000A
        B       L_F5D2                          ; F5CE   0200 0002

        MVII    #$000B, R0                      ; F5D0   02B8 000B
L_F5D2:
        MVO     R0,     G_013F                  ; F5D2   0240 013F
        B       L_F511                          ; F5D4   0220 00C4

        JSR     R5,     L_5BA3                  ; F5D6   0004 0158 03A3

        B       L_F511                          ; F5D9   0220 00C9

        MVII    #$0040, R0                      ; F5DB   02B8 0040
        MVII    #$0018, R1                      ; F5DD   02B9 0018
        MVII    #$0008, R2                      ; F5DF   02BA 0008
        MVII    #$003E, R3                      ; F5E1   02BB 003E

        JSR     R5,     L_5C0E                  ; F5E3   0004 015C 000E

        B       L_F511                          ; F5E6   0220 00D6

        SDBD                                    ; F5E8   0001
        MVII    #$088B, R0                      ; F5E9   02B8 008B 0008
        MVO     R0,     .BTAB.11                ; F5EC   0240 0211
        MVII    #$0098, R0                      ; F5EE   02B8 0098
        SDBD                                    ; F5F0   0001
        MVII    #$8008, R1                      ; F5F1   02B9 0008 0080
        MVII    #$0001, R2                      ; F5F4   02BA 0001
        MVII    #$0054, R3                      ; F5F6   02BB 0054
        B       L_F721                          ; F5F8   0200 0127

        SDBD                                    ; F5FA   0001
        MVII    #$0893, R0                      ; F5FB   02B8 0093 0008
        MVO     R0,     .BTAB.03                ; F5FE   0240 0203
        MVII    #$0018, R0                      ; F600   02B8 0018
        SDBD                                    ; F602   0001
        MVII    #$8008, R1                      ; F603   02B9 0008 0080
        SDBD                                    ; F606   0001
        MVII    #$1001, R2                      ; F607   02BA 0001 0010
        MVII    #$0054, R3                      ; F60A   02BB 0054
        B       L_F721                          ; F60C   0200 0113

        SDBD                                    ; F60E   0001
        MVII    #$088B, R0                      ; F60F   02B8 008B 0008
        MVO     R0,     .BTAB.11                ; F612   0240 0211
        MVII    #$0098, R0                      ; F614   02B8 0098
        SDBD                                    ; F616   0001
        MVII    #$8008, R1                      ; F617   02B9 0008 0080
        SDBD                                    ; F61A   0001
        MVII    #$2001, R2                      ; F61B   02BA 0001 0020
        MVII    #$0054, R3                      ; F61E   02BB 0054
        B       L_F721                          ; F620   0200 00FF

        MVII    #$0010, R1                      ; F622   02B9 0010
        MVII    #$0008, R2                      ; F624   02BA 0008
        MVII    #$0040, R3                      ; F626   02BB 0040

        JSR     R5,     L_602C                  ; F628   0004 0160 002C

        B       L_F721                          ; F62B   0200 00F4

        JSR     R5,     L_5BE0                  ; F62D   0004 0158 03E0

        B       L_F511                          ; F630   0220 0120

        MVII    #$00A8, R0                      ; F632   02B8 00A8
        MVII    #$0028, R1                      ; F634   02B9 0028
        MVII    #$0010, R2                      ; F636   02BA 0010
        MVII    #$00A8, R3                      ; F638   02BB 00A8

        JSR     R5,     L_5C0E                  ; F63A   0004 015C 000E

        ADDI    #$0300, R4                      ; F63D   02FC 0300
        MVI@    R4,     R0                      ; F63F   02A0
        DECR    R4                              ; F640   0014
        SDBD                                    ; F641   0001
        ADDI    #$1005, R0                      ; F642   02F8 0005 0010
        MVO@    R0,     R4                      ; F645   0260
        SDBD                                    ; F646   0001
        MVII    #$24A4, R0                      ; F647   02B8 00A4 0024
        MVII    #$002A, R1                      ; F64A   02B9 002A
        SDBD                                    ; F64C   0001
        MVII    #$1010, R2                      ; F64D   02BA 0010 0010
        MVII    #$00A8, R3                      ; F650   02BB 00A8
        B       L_F721                          ; F652   0200 00CD

        MVII    #$0004, R0                      ; F654   02B8 0004
        MVII    #$0028, R1                      ; F656   02B9 0028
        MVII    #$0010, R2                      ; F658   02BA 0010
        MVII    #$00A0, R3                      ; F65A   02BB 00A0

        JSR     R5,     L_5C0E                  ; F65C   0004 015C 000E

        ADDI    #$0300, R4                      ; F65F   02FC 0300
        MVI@    R4,     R0                      ; F661   02A0
        DECR    R4                              ; F662   0014
        SDBD                                    ; F663   0001
        ADDI    #$1005, R0                      ; F664   02F8 0005 0010
        MVO@    R0,     R4                      ; F667   0260
        SDBD                                    ; F668   0001
        MVII    #$2400, R0                      ; F669   02B8 0000 0024
        MVII    #$002A, R1                      ; F66C   02B9 002A
        SDBD                                    ; F66E   0001
        MVII    #$1010, R2                      ; F66F   02BA 0010 0010
        MVII    #$00A0, R3                      ; F672   02BB 00A0
        B       L_F721                          ; F674   0200 00AB

        MVII    #$0014, R0                      ; F676   02B8 0014
        B       L_F688                          ; F678   0200 000E

        MVII    #$0034, R0                      ; F67A   02B8 0034
        B       L_F688                          ; F67C   0200 000A

        MVII    #$0054, R0                      ; F67E   02B8 0054
        B       L_F688                          ; F680   0200 0006

        MVII    #$0074, R0                      ; F682   02B8 0074
        B       L_F688                          ; F684   0200 0002

        MVII    #$0094, R0                      ; F686   02B8 0094
L_F688:
        SDBD                                    ; F688   0001
        MVII    #$800B, R1                      ; F689   02B9 000B 0080
        MVII    #$0001, R2                      ; F68C   02BA 0001
        MVII    #$007C, R3                      ; F68E   02BB 007C
        B       L_F721                          ; F690   0200 008F

        MVII    #$0014, R0                      ; F692   02B8 0014
        B       L_F6A4                          ; F694   0200 000E

        MVII    #$0034, R0                      ; F696   02B8 0034
        B       L_F6A4                          ; F698   0200 000A

        MVII    #$0054, R0                      ; F69A   02B8 0054
        B       L_F6A4                          ; F69C   0200 0006

        MVII    #$0074, R0                      ; F69E   02B8 0074
        B       L_F6A4                          ; F6A0   0200 0002

        MVII    #$0094, R0                      ; F6A2   02B8 0094
L_F6A4:
        SDBD                                    ; F6A4   0001
        MVII    #$800D, R1                      ; F6A5   02B9 000D 0080
        MVII    #$0001, R2                      ; F6A8   02BA 0001
        MVII    #$00BC, R3                      ; F6AA   02BB 00BC
        B       L_F721                          ; F6AC   0200 0073

        MVII    #$0014, R0                      ; F6AE   02B8 0014
        B       L_F6C0                          ; F6B0   0200 000E

        MVII    #$0034, R0                      ; F6B2   02B8 0034
        B       L_F6C0                          ; F6B4   0200 000A

        MVII    #$0054, R0                      ; F6B6   02B8 0054
        B       L_F6C0                          ; F6B8   0200 0006

        MVII    #$0074, R0                      ; F6BA   02B8 0074
        B       L_F6C0                          ; F6BC   0200 0002

        MVII    #$0094, R0                      ; F6BE   02B8 0094
L_F6C0:
        SDBD                                    ; F6C0   0001
        MVII    #$800B, R1                      ; F6C1   02B9 000B 0080
        SDBD                                    ; F6C4   0001
        MVII    #$1001, R2                      ; F6C5   02BA 0001 0010
        MVII    #$00BC, R3                      ; F6C8   02BB 00BC
        B       L_F721                          ; F6CA   0200 0055

        MVII    #$0006, R0                      ; F6CC   02B8 0006
        MVO     R0,     G_013B                  ; F6CE   0240 013B

        JSR     R5,     X_RAND1                 ; F6D0   0004 0114 027D

        ADDI    #$0020, R0                      ; F6D3   02F8 0020
        MVO     R0,     G_0133                  ; F6D5   0240 0133
        MVII    #$023F, R0                      ; F6D7   02B8 023F
        MVO     R0,     G_0137                  ; F6D9   0240 0137
        MVII    #$000E, R0                      ; F6DB   02B8 000E
        MVO     R0,     G_013C                  ; F6DD   0240 013C
        MVII    #$0020, R0                      ; F6DF   02B8 0020
        MVO     R0,     G_0134                  ; F6E1   0240 0134
        MVII    #$023F, R0                      ; F6E3   02B8 023F
        MVO     R0,     G_0138                  ; F6E5   0240 0138
        B       L_F511                          ; F6E7   0220 01D7

        MVII    #$0213, R0                      ; F6E9   02B8 0213
        MVO     R0,     G_0138                  ; F6EB   0240 0138
        MVII    #$0014, R0                      ; F6ED   02B8 0014
        MVO     R0,     G_0134                  ; F6EF   0240 0134
        MVO     R0,     G_013C                  ; F6F1   0240 013C
        B       L_F511                          ; F6F3   0220 01E3

        MVII    #$0217, R0                      ; F6F5   02B8 0217
        MVO     R0,     G_0137                  ; F6F7   0240 0137
        MVII    #$0018, R0                      ; F6F9   02B8 0018
        MVO     R0,     G_0133                  ; F6FB   0240 0133
        MVII    #$000A, R0                      ; F6FD   02B8 000A
        MVO     R0,     G_013B                  ; F6FF   0240 013B
        MVII    #$0020, R0                      ; F701   02B8 0020
        MVII    #$0010, R1                      ; F703   02B9 0010
        MVII    #$0001, R2                      ; F705   02BA 0001
        MVII    #$006E, R3                      ; F707   02BB 006E
        B       L_F721                          ; F709   0200 0016

        MVII    #$0224, R0                      ; F70B   02B8 0224
        MVO     R0,     G_0138                  ; F70D   0240 0138
        MVII    #$0018, R0                      ; F70F   02B8 0018
        MVO     R0,     G_0134                  ; F711   0240 0134
        MVII    #$000B, R0                      ; F713   02B8 000B
        MVO     R0,     G_013C                  ; F715   0240 013C
        MVII    #$0088, R0                      ; F717   02B8 0088
        MVII    #$0010, R1                      ; F719   02B9 0010
        SDBD                                    ; F71B   0001
        MVII    #$1001, R2                      ; F71C   02BA 0001 0010
        MVII    #$006A, R3                      ; F71F   02BB 006A

L_F721:
        JSR     R5,     L_5C0E                  ; F721   0004 015C 000E

        B       L_F511                          ; F724   0220 0214

        MVII    #$0200, R0                      ; F726   02B8 0200
        MVO     R0,     G_013A                  ; F728   0240 013A
        MVII    #$0080, R0                      ; F72A   02B8 0080
        MVO     R0,     G_0136                  ; F72C   0240 0136
        MVII    #$000F, R0                      ; F72E   02B8 000F
        MVO     R0,     G_013E                  ; F730   0240 013E
        B       L_F511                          ; F732   0220 0222

        MVII    #$0200, R0                      ; F734   02B8 0200
        MVO     R0,     G_0139                  ; F736   0240 0139
        MVII    #$0020, R0                      ; F738   02B8 0020
        MVO     R0,     G_0135                  ; F73A   0240 0135
        MVII    #$0010, R0                      ; F73C   02B8 0010
        MVO     R0,     G_013D                  ; F73E   0240 013D
        B       L_F511                          ; F740   0220 0230

        MVII    #$0200, R0                      ; F742   02B8 0200
        MVO     R0,     G_0139                  ; F744   0240 0139
        MVII    #$0020, R0                      ; F746   02B8 0020
        MVO     R0,     G_0135                  ; F748   0240 0135
        MVII    #$0011, R0                      ; F74A   02B8 0011
        MVO     R0,     G_013D                  ; F74C   0240 013D
        B       L_F511                          ; F74E   0220 023E

        MVII    #$0200, R0                      ; F750   02B8 0200
        MVO     R0,     G_0139                  ; F752   0240 0139
        MVII    #$0020, R0                      ; F754   02B8 0020
        MVO     R0,     G_0135                  ; F756   0240 0135
        MVII    #$0012, R0                      ; F758   02B8 0012
        MVO     R0,     G_013D                  ; F75A   0240 013D
        B       L_F511                          ; F75C   0220 024C

        MVII    #$0200, R0                      ; F75E   02B8 0200
        MVO     R0,     G_0139                  ; F760   0240 0139
        MVII    #$0020, R0                      ; F762   02B8 0020
        MVO     R0,     G_0135                  ; F764   0240 0135
        MVII    #$0013, R0                      ; F766   02B8 0013
        MVO     R0,     G_013D                  ; F768   0240 013D
        B       L_F511                          ; F76A   0220 025A

        MVII    #$0200, R0                      ; F76C   02B8 0200
        MVO     R0,     G_0137                  ; F76E   0240 0137
        MVII    #$0020, R0                      ; F770   02B8 0020
        MVO     R0,     G_0133                  ; F772   0240 0133
        MVII    #$0002, R0                      ; F774   02B8 0002
        MVO     R0,     G_013B                  ; F776   0240 013B
        B       L_F511                          ; F778   0220 0268

        MVII    #$0200, R0                      ; F77A   02B8 0200
        MVO     R0,     G_0138                  ; F77C   0240 0138
        MVII    #$0020, R0                      ; F77E   02B8 0020
        MVO     R0,     G_0134                  ; F780   0240 0134
        MVII    #$0003, R0                      ; F782   02B8 0003
        MVO     R0,     G_013C                  ; F784   0240 013C
        B       L_F511                          ; F786   0220 0276

        MVII    #$0200, R0                      ; F788   02B8 0200
        MVO     R0,     G_013A                  ; F78A   0240 013A
        MVII    #$00C8, R0                      ; F78C   02B8 00C8
        MVO     R0,     G_0136                  ; F78E   0240 0136
        MVII    #$0001, R0                      ; F790   02B8 0001
        MVO     R0,     G_013E                  ; F792   0240 013E
        B       L_F511                          ; F794   0220 0284

        MVII    #$0210, R0                      ; F796   02B8 0210
        B       L_F7A0                          ; F798   0200 0006

        MVII    #$020C, R0                      ; F79A   02B8 020C
        B       L_F7BC                          ; F79C   0200 001E

        MVII    #$0204, R0                      ; F79E   02B8 0204
L_F7A0:
        MVO     R0,     G_0137                  ; F7A0   0240 0137
        MVII    #$0020, R0                      ; F7A2   02B8 0020
        MVO     R0,     G_0133                  ; F7A4   0240 0133
        MVII    #$000D, R0                      ; F7A6   02B8 000D
        MVO     R0,     G_013B                  ; F7A8   0240 013B
        B       L_F511                          ; F7AA   0220 029A

        MVII    #$020F, R0                      ; F7AC   02B8 020F
        MVO     R0,     G_0138                  ; F7AE   0240 0138
        MVII    #$0020, R0                      ; F7B0   02B8 0020
        MVO     R0,     G_0134                  ; F7B2   0240 0134
        MVII    #$000C, R0                      ; F7B4   02B8 000C
        MVO     R0,     G_013C                  ; F7B6   0240 013C
        B       L_F511                          ; F7B8   0220 02A8

        MVII    #$0208, R0                      ; F7BA   02B8 0208
L_F7BC:
        MVO     R0,     G_0139                  ; F7BC   0240 0139
        MVII    #$0020, R0                      ; F7BE   02B8 0020
        MVO     R0,     G_0135                  ; F7C0   0240 0135
        MVII    #$000D, R0                      ; F7C2   02B8 000D
        MVO     R0,     G_013D                  ; F7C4   0240 013D
        B       L_F511                          ; F7C6   0220 02B6

        MVII    #$0202, R1                      ; F7C8   02B9 0202
        MVII    #$0133, R3                      ; F7CA   02BB 0133
        B       L_F7E4                          ; F7CC   0200 0016

        MVII    #$0206, R1                      ; F7CE   02B9 0206
        MVII    #$0134, R3                      ; F7D0   02BB 0134
        B       L_F7E4                          ; F7D2   0200 0010

        MVII    #$020A, R1                      ; F7D4   02B9 020A
        MVII    #$0133, R3                      ; F7D6   02BB 0133
        B       L_F7E4                          ; F7D8   0200 000A

        MVII    #$020E, R1                      ; F7DA   02B9 020E
        MVII    #$0135, R3                      ; F7DC   02BB 0135
        B       L_F7E4                          ; F7DE   0200 0004

        MVII    #$0212, R1                      ; F7E0   02B9 0212
        MVII    #$0136, R3                      ; F7E2   02BB 0136
L_F7E4:
        MVII    #$0004, R2                      ; F7E4   02BA 0004
        MVII    #$0004, R0                      ; F7E6   02B8 0004

        JSR     R5,     X_RAND1                 ; F7E8   0004 0114 027D

        ADDI    #$0010, R0                      ; F7EB   02F8 0010
        MVO@    R0,     R3                      ; F7ED   0258
        ADDI    #$0004, R3                      ; F7EE   02FB 0004
        MVO@    R1,     R3                      ; F7F0   0259
        ADDI    #$0004, R3                      ; F7F1   02FB 0004
        MVO@    R2,     R3                      ; F7F3   025A
        B       L_F511                          ; F7F4   0220 02E4

        JSR     R5,     L_684C                  ; F7F6   0004 0168 004C
        DECLE   $0133                           ; F7F9   0133
L_F7FA:
        DECR    R7                              ; F7FA   0017

        SUBR    R6,     R4                      ; F7FB   0134
L_F7FC:
        DECR    R7                              ; F7FC   0017

        DECLE   $0135,  $0014,  $0136,  $0014   ; F7FD   0135 0014 0136 0014
        DECLE   $0137                           ; F801   0137

        MVO@    R7,     R4                      ; F802   0267
        SUBR    R7,     R0                      ; F803   0138
        PSHR    R5                              ; F804   0275
        SUBR    R7,     R1                      ; F805   0139
        PULR    R7                              ; F806   02B7

        DECLE   $013A,  $02C5,  $013B,  $0007   ; F807   013A 02C5 013B 0007
        DECLE   $013C,  $0007,  $013D,  $0007   ; F80B   013C 0007 013D 0007
        DECLE   $013E,  $0007,  $0000           ; F80F   013E 0007 0000

        MVI     G_0146, R0                      ; F812   0280 0146
        XORI    #$0040, R0                      ; F814   03F8 0040
        MVO     R0,     G_0146                  ; F816   0240 0146
        B       L_F511                          ; F818   0220 0308

        CLRR    R0                              ; F81A   01C0
        MVO     R0,     G_0110                  ; F81B   0240 0110
        SETC                                    ; F81D   0007
        RRC     R0,     1                       ; F81E   0070
        MVO     R0,     G_02F9                  ; F81F   0240 02F9
        SDBD                                    ; F821   0001
        MVII    #$5000, R0                      ; F822   02B8 0000 0050
        MVO     R0,     G_0309                  ; F825   0240 0309
        B       L_F511                          ; F827   0220 0317

        MVII    #$032E, R5                      ; F829   02BD 032E
        ADD     G_015D, R5                      ; F82B   02C5 015D
        MVI     G_0330, R0                      ; F82D   0280 0330
        MVO@    R0,     R5                      ; F82F   0268
        B       L_F511                          ; F830   0220 0320

        ADDI    #$0002, R4                      ; F832   02FC 0002
        MVO     R4,     G_0330                  ; F834   0244 0330
        CLRR    R0                              ; F836   01C0
        MVO     R0,     G_0132                  ; F837   0240 0132
        PULR    R0                              ; F839   02B0
        PSHR    R4                              ; F83A   0274
        B       L_F511                          ; F83B   0220 032B
L_F83D:
        PULR    R7                              ; F83D   02B7

        DECLE   $0000,  $0001,  $0005,  $026C   ; F83E   0000 0001 0005 026C
        DECLE   $0008,  $025E,  $0009,  $0218   ; F842   0008 025E 0009 0218
        DECLE   $000D,  $0226,  $0012,  $0250   ; F846   000D 0226 0012 0250
        DECLE   $0016,  $0218,  $0018,  $020A   ; F84A   0016 0218 0018 020A
        DECLE   $0018,  $0316,  $0002,  $0001   ; F84E   0018 0316 0002 0001
        DECLE   $0005,  $0234,  $000A,  $0226   ; F852   0005 0234 000A 0226
        DECLE   $000B,  $019E,  $000C,  $0032   ; F856   000B 019E 000C 0032
        DECLE   $000C,  $020A,  $000C,  $030D   ; F85A   000C 020A 000C 030D
        DECLE   $0011,  $0242,  $0018,  $00BA   ; F85E   0011 0242 0018 00BA
        DECLE   $0018,  $0316,  $0004,  $0002   ; F862   0018 0316 0004 0002
        DECLE   $0001,  $0250,  $0002,  $020A   ; F866   0001 0250 0002 020A
        DECLE   $0005,  $0234                   ; F86A   0005 0234

        INCR    R4                              ; F86C   000C
        BNOV    L_F87B                          ; F86D   020A 000C

        SUB@    R1,     R5                      ; F86F   030D
        INCR    R6                              ; F870   000E
        MOVR    R5,     R0                      ; F871   00A8
        INCR    R7                              ; F872   000F

        ADDR    R1,     R4                      ; F873   00CC
L_F874:
        DECR    R0                              ; F874   0010
        DECLE   $003A,  $0010,  $0234           ; F875   003A 0010 0234

        COMR    R0                              ; F878   0018
        BNOV    L_F893                          ; F879   020A 0018

L_F87B:
        SUB@    R2,     R6                      ; F87B   0316
        CLRC                                    ; F87C   0006
        EIS                                     ; F87D   0002
        DIS                                     ; F87E   0003
L_F87F:
        CMPR    R7,     R2                      ; F87F   017A
        DIS                                     ; F880   0003
        ANDR    R0,     R2                      ; F881   0182
        SETC                                    ; F882   0007
        CMPR    R6,     R6                      ; F883   0176
        SETC                                    ; F884   0007
        MVO@    R4,     R5                      ; F885   026C
        INCR    R0                              ; F886   0008
        ANDR    R0,     R6                      ; F887   0186
        INCR    R4                              ; F888   000C
        BNOV    L_F897                          ; F889   020A 000C

        CMPR    R7,     R2                      ; F88B   017A
        INCR    R4                              ; F88C   000C
        SUB@    R1,     R5                      ; F88D   030D
        DECR    R0                              ; F88E   0010
        ANDR    R0,     R2                      ; F88F   0182
        DECR    R0                              ; F890   0010
        BLE     L_F87F                          ; F891   0226 0013
L_F893:
        BNOV    L_F8AC                          ; F893   020A 0017

        CMPR    R6,     R6                      ; F895   0176
L_F896:
        DECR    R7                              ; F896   0017

L_F897:
        CMPR    R7,     R6                      ; F897   017E
L_F898:
        DECR    R7                              ; F898   0017

        ANDR    R0,     R6                      ; F899   0186
        COMR    R0                              ; F89A   0018
        MVO@    R0,     R2                      ; F89B   0250
        COMR    R0                              ; F89C   0018
        BNOV    L_F8B7                          ; F89D   020A 0018

        SUB@    R2,     R6                      ; F89F   0316
        INCR    R0                              ; F8A0   0008
        EIS                                     ; F8A1   0002
        SETC                                    ; F8A2   0007
        ANDR    R2,     R6                      ; F8A3   0196
        INCR    R2                              ; F8A4   000A
        ANDR    R3,     R2                      ; F8A5   019A
        INCR    R2                              ; F8A6   000A
        ANDR    R3,     R6                      ; F8A7   019E
        INCR    R4                              ; F8A8   000C
        BNOV    L_F8B7                          ; F8A9   020A 000C

        SUB@    R1,     R5                      ; F8AB   030D
L_F8AC:
        DECR    R2                              ; F8AC   0012
        ANDR    R2,     R6                      ; F8AD   0196
        DECR    R3                              ; F8AE   0013
        ANDR    R2,     R2                      ; F8AF   0192
        DECR    R4                              ; F8B0   0014
        BNOV    L_F8C7                          ; F8B1   020A 0014

        COMR    R2                              ; F8B3   001A
L_F8B4:
        DECR    R7                              ; F8B4   0017

        ANDR    R4,     R2                      ; F8B5   01A2
        COMR    R0                              ; F8B6   0018
L_F8B7:
        DECR    R2                              ; F8B7   0012
        DECLE   $001C,  $026C,  $001C,  $0106   ; F8B8   001C 026C 001C 0106
        DECLE   $001D,  $0106,  $001E,  $00A4   ; F8BC   001D 0106 001E 00A4
        DECLE   $001F                           ; F8C0   001F

        RRC     R0,     1                       ; F8C1   0070
        NEGR    R0                              ; F8C2   0020
        SAR     R2,     1                       ; F8C3   006A
        NEGR    R1                              ; F8C4   0021
        RLC     R2,     1                       ; F8C5   0052
        NEGR    R1                              ; F8C6   0021
L_F8C7:
        ADDI    #$0021, R6                      ; F8C7   02FE 0021
        DECLE   $0316,  $000B,  $0003,  $0009   ; F8C9   0316 000B 0003 0009
        DECLE   $0116,  $000C,  $0116,  $000C   ; F8CD   0116 000C 0116 000C
        DECLE   $0218,  $000C,  $0111,  $000C   ; F8D1   0218 000C 0111 000C
        DECLE   $0316,  $000C,  $0003,  $0006   ; F8D5   0316 000C 0003 0006
        DECLE   $0002,  $0007,  $015A,  $0008   ; F8D9   0002 0007 015A 0008
        DECLE   $0234,  $000A,  $0166,  $000B   ; F8DD   0234 000A 0166 000B
        DECLE   $0234                           ; F8E1   0234

        INCR    R4                              ; F8E2   000C
        SUB@    R1,     R5                      ; F8E3   030D
        DECR    R2                              ; F8E4   0012
        CMPR    R3,     R6                      ; F8E5   015E
        DECR    R2                              ; F8E6   0012
        CMPR    R4,     R6                      ; F8E7   0166
        DECR    R4                              ; F8E8   0014
        MVO@    R4,     R5                      ; F8E9   026C
L_F8EA:
        DECR    R7                              ; F8EA   0017

        DECLE   $0162,  $0018,  $004A,  $0018   ; F8EB   0162 0018 004A 0018
        DECLE   $0316,  $000E,  $0003,  $0002   ; F8EF   0316 000E 0003 0002
        DECLE   $0166,  $0003,  $025E,  $0005   ; F8F3   0166 0003 025E 0005

        MVO@    R4,     R5                      ; F8F7   026C
        SETC                                    ; F8F8   0007
        CMPR    R3,     R2                      ; F8F9   015A
        INCR    R2                              ; F8FA   000A
        CMPR    R3,     R6                      ; F8FB   015E
        INCR    R2                              ; F8FC   000A
        CMPR    R4,     R2                      ; F8FD   0162
        INCR    R2                              ; F8FE   000A
        CMPR    R4,     R6                      ; F8FF   0166
        INCR    R4                              ; F900   000C
        SUB@    R1,     R5                      ; F901   030D
        INCR    R6                              ; F902   000E
        MVO@    R4,     R5                      ; F903   026C
        INCR    R7                              ; F904   000F

        CMPR    R3,     R2                      ; F905   015A
L_F906:
        DECR    R4                              ; F906   0014
        DECLE   $000A,  $0015,  $0234,  $0018   ; F907   000A 0015 0234 0018
        DECLE   $0316,  $0010,  $0004,  $0001   ; F90B   0316 0010 0004 0001

        BNOV    L_F913                          ; F90F   020A 0002

        MVO@    R0,     R2                      ; F911   0250
        CLRC                                    ; F912   0006
L_F913:
        MVO@    R4,     R5                      ; F913   026C
        SETC                                    ; F914   0007
        MOVR    R1,     R4                      ; F915   008C
        INCR    R0                              ; F916   0008
        MOVR    R2,     R0                      ; F917   0090
        INCR    R4                              ; F918   000C
        SUB@    R1,     R5                      ; F919   030D
        INCR    R4                              ; F91A   000C
        ANDR    R6,     R0                      ; F91B   01B0
        INCR    R5                              ; F91C   000D
        COMR    R2                              ; F91D   001A
        INCR    R6                              ; F91E   000E
        SUBR    R0,     R6                      ; F91F   0106
        INCR    R7                              ; F920   000F

        SUBR    R0,     R6                      ; F921   0106
L_F922:
        DECR    R0                              ; F922   0010
        DECLE   $0106,  $0010,  $0094,  $0011   ; F923   0106 0010 0094 0011
        DECLE   $0106,  $0013,  $0166,  $0016   ; F927   0106 0013 0166 0016
        DECLE   $01CD,  $0018,  $0098,  $0018   ; F92B   01CD 0018 0098 0018
        DECLE   $0316,  $0012,  $0007,  $0003   ; F92F   0316 0012 0007 0003
        DECLE   $01D9,  $0008,  $009C,  $0009   ; F933   01D9 0008 009C 0009
        DECLE   $0218,  $000B,  $01EF,  $000C   ; F937   0218 000B 01EF 000C
        DECLE   $030D,  $0013,  $01D9,  $0014   ; F93B   030D 0013 01D9 0014
        DECLE   $0218                           ; F93F   0218
L_F940:
        DECR    R7                              ; F940   0017

        DECLE   $00A0,  $0018,  $0012,  $0018   ; F941   00A0 0018 0012 0018
        DECLE   $020A,  $0024,  $00A4,  $0025   ; F945   020A 0024 00A4 0025
        DECLE   $0070,  $0026,  $006A,  $0027   ; F949   0070 0026 006A 0027
        DECLE   $0052,  $0027,  $02FE,  $0027   ; F94D   0052 0027 02FE 0027
        DECLE   $02DA,  $0027                   ; F951   02DA 0027

        SUB@    R2,     R6                      ; F953   0316
        DECR    R5                              ; F954   0015
        INCR    R1                              ; F955   0009
        CLRC                                    ; F956   0006
        PULR    R2                              ; F957   02B2
        INCR    R2                              ; F958   000A
        MVII    #$000C, R6                      ; F959   02BE 000C
        SUB@    R2,     R6                      ; F95B   0316
        DECR    R6                              ; F95C   0016
        INCR    R1                              ; F95D   0009
        EIS                                     ; F95E   0002
        MVI@    R5,     R4                      ; F95F   02AC

        JSRD    R4,     .EXEC.006               ; F960   0004 0012 0006
        DECLE   $02BE,  $000A,  $02B2,  $000C   ; F963   02BE 000A 02B2 000C
        DECLE   $030D,  $000E,  $02B8,  $0016   ; F967   030D 000E 02B8 0016
        DECLE   $02AC,  $0016,  $02C4,  $0018   ; F96B   02AC 0016 02C4 0018
        DECLE   $0316,  $0018,  $0009,  $0006   ; F96F   0316 0018 0009 0006
        DECLE   $0166,  $0008,  $0032,  $000A   ; F973   0166 0008 0032 000A
        DECLE   $02B8,  $000C,  $030D,  $0012   ; F977   02B8 000C 030D 0012
        DECLE   $02AC,  $0012,  $02C4,  $0016   ; F97B   02AC 0012 02C4 0016
        DECLE   $02BE,  $001A,  $015A,  $001E   ; F97F   02BE 001A 015A 001E
        DECLE   $0234,  $001F,  $015E,  $0020   ; F983   0234 001F 015E 0020
        DECLE   $00B4,  $0020,  $0042,  $0024   ; F987   00B4 0020 0042 0024
        DECLE   $0316,  $001B,  $000B,  $0001   ; F98B   0316 001B 000B 0001
        DECLE   $00AC,  $0007,  $0162,  $000A   ; F98F   00AC 0007 0162 000A
        DECLE   $027A,  $000C,  $00B0,  $000C   ; F993   027A 000C 00B0 000C
        DECLE   $030D,  $0012,  $027E,  $001A   ; F997   030D 0012 027E 001A
        DECLE   $0282,  $001A,  $0290,  $0022   ; F99B   0282 001A 0290 0022
        DECLE   $029E,  $0024,  $0316,  $001E   ; F99F   029E 0024 0316 001E
        DECLE   $000C,  $0006,  $0282,  $0006   ; F9A3   000C 0006 0282 0006
        DECLE   $0290,  $000B,  $0218,  $000C   ; F9A7   0290 000B 0218 000C
        DECLE   $030D,  $0010,  $0116,  $0013   ; F9AB   030D 0010 0116 0013
        DECLE   $0116,  $0016,  $0218,  $0018   ; F9AF   0116 0016 0218 0018
        DECLE   $0012,  $0018,  $0138,  $001B   ; F9B3   0012 0018 0138 001B
        DECLE   $0138,  $0020,  $026C,  $0022   ; F9B7   0138 0020 026C 0022
        DECLE   $0022,  $0022,  $002A,  $0023   ; F9BB   0022 0022 002A 0023
        DECLE   $00A8,  $0024,  $00A4,  $0024   ; F9BF   00A8 0024 00A4 0024
        DECLE   $00DE,  $0024,  $00F2,  $0025   ; F9C3   00DE 0024 00F2 0025
        DECLE   $0070,  $0026,  $006A,  $0027   ; F9C7   0070 0026 006A 0027
        DECLE   $0052,  $0027,  $02FE,  $0027   ; F9CB   0052 0027 02FE 0027
        DECLE   $0316,  $0021,  $0001           ; F9CF   0316 0021 0001

        MVO@    R3,     R2                      ; F9D2   0253
        SUB@    R4,     R1                      ; F9D3   0321
        PSHR    R5                              ; F9D4   0275
        MVI     G_035F, R0                      ; F9D5   0280 035F
        DECR    R0                              ; F9D7   0010
        MVO     R0,     G_035F                  ; F9D8   0240 035F
        BEQ     L_FA0B                          ; F9DA   0204 002F

        MVI     G_0142, R1                      ; F9DC   0281 0142
        ANDI    #$0001, R1                      ; F9DE   03B9 0001
        BNEQ    L_F9F7                          ; F9E0   020C 0015

        MVI     G_035F, R0                      ; F9E2   0280 035F
        ANDI    #$001F, R0                      ; F9E4   03B8 001F
        BNEQ    L_F9F7                          ; F9E6   020C 000F

        MVI     .STIC.A.6,R0                    ; F9E8   0280 0016
        ADDI    #$0010, R0                      ; F9EA   02F8 0010
        MOVR    R0,     R5                      ; F9EC   0085
        ANDI    #$01F8, R5                      ; F9ED   03BD 01F8
        CMPI    #$01E0, R5                      ; F9EF   037D 01E0
        BMI     L_F9F5                          ; F9F1   020B 0002

        SUBI    #$0040, R0                      ; F9F3   0338 0040
L_F9F5:
        MVO     R0,     .STIC.A.6               ; F9F5   0240 0016
L_F9F7:
        CLRR    R0                              ; F9F7   01C0
        MVO     R0,     .STIC.VDLY              ; F9F8   0240 0031
        MVO     R0,     .STIC.EDGE              ; F9FA   0240 0032
        MVO     R0,     .STIC.BORD              ; F9FC   0240 002C
        MVO     R0,     .STIC.VIDEN             ; F9FE   0240 0020
        MVO     R0,     G_0104                  ; FA00   0240 0104
        MVO     R0,     G_015F                  ; FA02   0240 015F

        JSR     R5,     L_6DF1                  ; FA04   0004 016C 01F1
        JSR     R5,     L_6A2A                  ; FA07   0004 0168 022A

        PULR    R7                              ; FA0A   02B7

L_FA0B:
        CLRR    R4                              ; FA0B   01E4

        JSR     R5,     L_6840                  ; FA0C   0004 0168 0040
        JSR     R5,     L_6841                  ; FA0F   0004 0168 0041
        JSR     R5,     L_6841                  ; FA12   0004 0168 0041
        JSR     R5,     L_6841                  ; FA15   0004 0168 0041

        MVI     .STIC.MODE,R0                   ; FA18   0280 0021
        MVO     R0,     .STIC.VIDEN             ; FA1A   0240 0020

        JSR     R5,     L_6DF1                  ; FA1C   0004 016C 01F1

        MVI     G_0142, R1                      ; FA1F   0281 0142
L_FA21:
        SUBI    #$0003, R1                      ; FA21   0339 0003
        BGE     L_FA21                          ; FA23   022D 0003

        ADDI    #$0002, R1                      ; FA25   02F9 0002
        BLE     L_FA2F                          ; FA27   0206 0006

        SDBD                                    ; FA29   0001
        MVII    #$A840, R0                      ; FA2A   02B8 0040 00A8
        MVO     R0,     G_0330                  ; FA2D   0240 0330
L_FA2F:
        MVI     G_0142, R0                      ; FA2F   0280 0142
        DECLE   $0008,  $0240,  $0142,  $02BD   ; FA31   0008 0240 0142 02BD
        DECLE   $032E,  $02C5,  $015D,  $0280   ; FA35   032E 02C5 015D 0280
        DECLE   $0330,  $0268,  $0004           ; FA39   0330 0268 0004

        ANDR    R5,     R4                      ; FA3C   01AC
        SUBR    R3,     R6                      ; FA3D   011E
        MVII    #$0011, R0                      ; FA3E   02B8 0011

        JSR     R5,     L_6C1B                  ; FA40   0004 016C 001B

        PULR    R7                              ; FA43   02B7

        CLRR    R4                              ; FA44   01E4
        MVII    #$000C, R1                      ; FA45   02B9 000C
L_FA47:
        SDBD                                    ; FA47   0001
        MVI@    R5,     R0                      ; FA48   02A8
        MVO@    R0,     R4                      ; FA49   0260
        SDBD                                    ; FA4A   0001
        MVI@    R5,     R0                      ; FA4B   02A8
        MVO@    R0,     R4                      ; FA4C   0260
        DECR    R1                              ; FA4D   0011
        BNEQ    L_FA47                          ; FA4E   022C 0008
        MOVR    R5,     R7                      ; FA50   00AF

        MVI@    R5,     R0                      ; FA51   02A8
        MVI@    R5,     R2                      ; FA52   02AA
        SDBD                                    ; FA53   0001
        MVI@    R5,     R3                      ; FA54   02AB
        SDBD                                    ; FA55   0001
        MVI@    R5,     R4                      ; FA56   02AC
        PSHR    R5                              ; FA57   0275
        MOVR    R0,     R5                      ; FA58   0085
L_FA59:
        CLRR    R1                              ; FA59   01C9
L_FA5A:
        MVI@    R4,     R0                      ; FA5A   02A0
        PSHR    R4                              ; FA5B   0274
        MOVR    R0,     R4                      ; FA5C   0084
        ANDI    #$000F, R4                      ; FA5D   03BC 000F
        CMPI    #$000F, R4                      ; FA5F   037C 000F
        BEQ     L_FA73                          ; FA61   0204 0010

        SAR     R0,     1                       ; FA63   0068
        ANDI    #$01F8, R0                      ; FA64   03B8 01F8
        ADDR    R4,     R4                      ; FA66   00E4
        ADDR    R3,     R4                      ; FA67   00DC
        SDBD                                    ; FA68   0001
        XOR@    R4,     R0                      ; FA69   03E0
L_FA6A:
        MVO@    R0,     R5                      ; FA6A   0268
        DECR    R1                              ; FA6B   0011
        BPL     L_FA6A                          ; FA6C   0223 0003

        PULR    R4                              ; FA6E   02B4
        CMPR    R2,     R5                      ; FA6F   0155
        BNEQ    L_FA59                          ; FA70   022C 0018
        PULR    R7                              ; FA72   02B7

L_FA73:
        SLR     R0,     2                       ; FA73   0064
        SLR     R0,     2                       ; FA74   0064
        MOVR    R0,     R1                      ; FA75   0081
        PULR    R4                              ; FA76   02B4
        B       L_FA5A                          ; FA77   0220 001E

        PSHR    R5                              ; FA79   0275

        JSR     R5,     L_68B2                  ; FA7A   0004 0168 00B2

        PULR    R5                              ; FA7D   02B5
        MVI@    R5,     R1                      ; FA7E   02A9
        SDBD                                    ; FA7F   0001
        MVI@    R5,     R4                      ; FA80   02AC
        PSHR    R5                              ; FA81   0275
        SDBD                                    ; FA82   0001
        MVII    #$3800, R5                      ; FA83   02BD 0000 0038
L_FA86:
        MVI@    R4,     R0                      ; FA86   02A0
        MVO@    R0,     R5                      ; FA87   0268
        MVI@    R4,     R0                      ; FA88   02A0
        MVO@    R0,     R5                      ; FA89   0268
        MVI@    R4,     R0                      ; FA8A   02A0
        MVO@    R0,     R5                      ; FA8B   0268
        MVI@    R4,     R0                      ; FA8C   02A0
        MVO@    R0,     R5                      ; FA8D   0268
        MVI@    R4,     R0                      ; FA8E   02A0
        MVO@    R0,     R5                      ; FA8F   0268
        MVI@    R4,     R0                      ; FA90   02A0
        MVO@    R0,     R5                      ; FA91   0268
        MVI@    R4,     R0                      ; FA92   02A0
        MVO@    R0,     R5                      ; FA93   0268
        MVI@    R4,     R0                      ; FA94   02A0
        MVO@    R0,     R5                      ; FA95   0268
        DECR    R1                              ; FA96   0011
        BNEQ    L_FA86                          ; FA97   022C 0012
        PULR    R7                              ; FA99   02B7

        DECLE   $0000,  $0000,  $0000,  $0028   ; FA9A   0000 0000 0000 0028
        DECLE   $0000,  $001E,  $0000,  $000E   ; FA9E   0000 001E 0000 000E
        DECLE   $0004,  $000E,  $0000,  $0020   ; FAA2   0004 000E 0000 0020
        DECLE   $0003,  $0028,  $0000,  $0018   ; FAA6   0003 0028 0000 0018
        DECLE   $0275,  $0004,  $01A8,  $0279   ; FAAA   0275 0004 01A8 0279
        DECLE   $003E,  $0000,  $0090,  $0004   ; FAAE   003E 0000 0090 0004
        DECLE   $01A8,  $0244,  $0072,  $0002   ; FAB2   01A8 0244 0072 0002
        DECLE   $0066,  $0002,  $007A,  $0002   ; FAB6   0066 0002 007A 0002
        DECLE   $0070,  $0006,  $0000,  $0000   ; FABA   0070 0006 0000 0000
        DECLE   $0000,  $0000,  $0069,  $0002   ; FABE   0000 0000 0069 0002
        DECLE   $0088,  $0002,  $0096,  $0000   ; FAC2   0088 0002 0096 0000
        DECLE   $0098,  $0000,  $0096,  $0000   ; FAC6   0098 0000 0096 0000
        DECLE   $0094,  $0000,  $0000,  $0000   ; FACA   0094 0000 0000 0000
        DECLE   $0000,  $0000,  $0088,  $0001   ; FACE   0000 0000 0088 0001
        DECLE   $00A3,  $0000,  $0060,  $0009   ; FAD2   00A3 0000 0060 0009
        DECLE   $0073,  $0009,  $0080,  $0009   ; FAD6   0073 0009 0080 0009
        DECLE   $0093,  $0009,  $0000,  $0000   ; FADA   0093 0009 0000 0000
        DECLE   $0000,  $0000,  $00A7,  $0019   ; FADE   0000 0000 00A7 0019
        DECLE   $00E3,  $0009,  $0004           ; FAE2   00E3 0009 0004

        ANDR    R5,     R0                      ; FAE5   01A8
        MVO@    R1,     R2                      ; FAE6   0251
        B       L_FDD9                          ; FAE7   0200 02F0

        MOVR    R3,     R2                      ; FAE9   009A
        MOVR    R5,     R2                      ; FAEA   00AA
        ADDR    R7,     R2                      ; FAEB   00FA
        MOVR    R5,     R6                      ; FAEC   00AE
        PULR    R7                              ; FAED   02B7

        DECLE   $0000,  $0000,  $0000,  $001E   ; FAEE   0000 0000 0000 001E
        DECLE   $0000,  $0028,  $0000,  $000E   ; FAF2   0000 0028 0000 000E
        DECLE   $0003,  $0008,  $0000,  $0020   ; FAF6   0003 0008 0000 0020
        DECLE   $0004,  $0008,  $0003,  $0028   ; FAFA   0004 0008 0003 0028
        DECLE   $0004,  $000E,  $0275,  $0004   ; FAFE   0004 000E 0275 0004
        DECLE   $01A8,  $0279,  $003A,  $00D0   ; FB02   01A8 0279 003A 00D0
        DECLE   $0096,  $0004,  $01A8,  $0244   ; FB06   0096 0004 01A8 0244
        DECLE   $0072,  $0002,  $006A,  $0002   ; FB0A   0072 0002 006A 0002
        DECLE   $007A,  $0002,  $0070,  $0006   ; FB0E   007A 0002 0070 0006
        DECLE   $0080,  $0002,  $0000,  $0000   ; FB12   0080 0002 0000 0000
        DECLE   $006A,  $0002,  $0088,  $0006   ; FB16   006A 0002 0088 0006
        DECLE   $0093,  $0000,  $0099,  $0000   ; FB1A   0093 0000 0099 0000
        DECLE   $0096,  $0000,  $0094,  $0000   ; FB1E   0096 0000 0094 0000
        DECLE   $00A0,  $0003,  $0000,  $0000   ; FB22   00A0 0003 0000 0000
        DECLE   $0093,  $0001,  $00A0,  $0001   ; FB26   0093 0001 00A0 0001
        DECLE   $0060,  $0009,  $0073,  $0009   ; FB2A   0060 0009 0073 0009
        DECLE   $0080,  $0009,  $0093,  $0009   ; FB2E   0080 0009 0093 0009
        DECLE   $00A3,  $0019,  $0000,  $0000   ; FB32   00A3 0019 0000 0000
        DECLE   $00B0,  $0019,  $00C0,  $0009   ; FB36   00B0 0019 00C0 0009
        DECLE   $0004                           ; FB3A   0004

        ANDR    R5,     R0                      ; FB3B   01A8
        MVO@    R1,     R2                      ; FB3C   0251
        B       L_FE2F                          ; FB3D   0200 02F0

        ADDR    R5,     R6                      ; FB3F   00EE
        MOVR    R5,     R2                      ; FB40   00AA
        MOVR    R5,     R0                      ; FB41   00A8
        MOVR    R5,     R6                      ; FB42   00AE
        PULR    R7                              ; FB43   02B7

        PSHR    R5                              ; FB44   0275
        CLRR    R4                              ; FB45   01E4

        JSR     R5,     L_6840                  ; FB46   0004 0168 0040
        JSR     R5,     L_6841                  ; FB49   0004 0168 0041
        JSR     R5,     L_6841                  ; FB4C   0004 0168 0041
        JSR     R5,     L_6841                  ; FB4F   0004 0168 0041

        MVO     R0,     .STIC.CS.0              ; FB52   0240 0028
        MVO     R0,     .STIC.BORD              ; FB54   0240 002C
        MVO     R0,     G_015F                  ; FB56   0240 015F
        MVO     R0,     .STIC.VDLY              ; FB58   0240 0031
        MVO     R0,     .STIC.EDGE              ; FB5A   0240 0032

        JSR     R5,     L_6859                  ; FB5C   0004 0168 0059
        BIDECLE $98A0,  $39F8                   ; FB5F   00A0 0098 00F8 0039
        DECLE   $0001                           ; FB63   0001

        MVO     R0,     .STIC.VIDEN             ; FB64   0240 0020
        MVI     G_035F, R3                      ; FB66   0283 035F
        DECR    R3                              ; FB68   0013
        MVO     R3,     G_035F                  ; FB69   0243 035F

        JSR     R5,     L_6DF1                  ; FB6B   0004 016C 01F1
        JSR     R5,     L_6A2A                  ; FB6E   0004 0168 022A

        PULR    R7                              ; FB71   02B7

        PSHR    R5                              ; FB72   0275
        CLRR    R0                              ; FB73   01C0
        MVII    #$0104, R4                      ; FB74   02BC 0104
L_FB76:
        MVO@    R0,     R4                      ; FB76   0260
        CMPI    #$0140, R4                      ; FB77   037C 0140
        BMI     L_FB76                          ; FB79   022B 0004

        MVII    #$0165, R4                      ; FB7B   02BC 0165
L_FB7D:
        MVO@    R0,     R4                      ; FB7D   0260
        CMPI    #$01F0, R4                      ; FB7E   037C 01F0
        BMI     L_FB7D                          ; FB80   022B 0004

        MVII    #$02F0, R4                      ; FB82   02BC 02F0
L_FB84:
        MVO@    R0,     R4                      ; FB84   0260
        CMPI    #$032B, R4                      ; FB85   037C 032B
        BMI     L_FB84                          ; FB87   022B 0004

        MVO     R0,     G_0332                  ; FB89   0240 0332
        MVO     R0,     G_015E                  ; FB8B   0240 015E
        MVI     G_0146, R0                      ; FB8D   0280 0146
        ANDI    #$0025, R0                      ; FB8F   03B8 0025
        MVO     R0,     G_0146                  ; FB91   0240 0146

        JSR     R5,     L_684C                  ; FB93   0004 0168 004C
        DECLE   $0100                           ; FB96   0100

        ADCR    R1                              ; FB97   0029
        SUBR    R0,     R1                      ; FB98   0101
        RLC     R1,     1                       ; FB99   0051
        CMPR    R4,     R4                      ; FB9A   0164
        SWAP    R0,     1                       ; FB9B   0040
        CMPR    R4,     R3                      ; FB9C   0163
        NEGR    R0                              ; FB9D   0020
        ADD@    R6,     R0                      ; FB9E   02F0
        CMP@    R2,     R4                      ; FB9F   0354
        CMPR    R4,     R1                      ; FBA0   0161
        RLC     R0,     2                       ; FBA1   0054
        ADDI    #$00D0, R0                      ; FBA2   02F8 00D0
        CMPR    R4,     R2                      ; FBA4   0162
        RLC     R0,     1                       ; FBA5   0050
        SUBR    R1,     R6                      ; FBA6   010E
        DECR    R4                              ; FBA7   0014
        SUBR    R1,     R7                      ; FBA8   010F

        DECLE   $00BE,  $0165,  $0003,  $010B   ; FBA9   00BE 0165 0003 010B
        DECLE   $0004,  $0000                   ; FBAD   0004 0000

        SDBD                                    ; FBAF   0001
        MVII    #$0981, R0                      ; FBB0   02B8 0081 0009
        MVO     R0,     G_0300                  ; FBB3   0240 0300
        MVII    #$00C0, R0                      ; FBB5   02B8 00C0
        SWAP    R0,     1                       ; FBB7   0040
        MVO     R0,     G_0310                  ; FBB8   0240 0310
        MVO     R0,     G_0311                  ; FBBA   0240 0311
        MVII    #$00FF, R0                      ; FBBC   02B8 00FF
        MVII    #$0137, R5                      ; FBBE   02BD 0137
        MVO@    R0,     R5                      ; FBC0   0268
        MVO@    R0,     R5                      ; FBC1   0268
        NOP                                     ; FBC2   0034
        MVO@    R0,     R5                      ; FBC3   0268
        MVO@    R0,     R5                      ; FBC4   0268
        PULR    R7                              ; FBC5   02B7

        PSHR    R5                              ; FBC6   0275
        PSHR    R0                              ; FBC7   0270

        JSR     R5,     L_68B2                  ; FBC8   0004 0168 00B2

        CLRR    R4                              ; FBCB   01E4

        JSR     R5,     L_6840                  ; FBCC   0004 0168 0040
        JSR     R5,     L_6841                  ; FBCF   0004 0168 0041
        JSR     R5,     L_6841                  ; FBD2   0004 0168 0041
        JSR     R5,     L_6841                  ; FBD5   0004 0168 0041

        MVI     .STIC.MODE,R0                   ; FBD8   0280 0021
        MVII    #$000B, R2                      ; FBDA   02BA 000B
        PULR    R1                              ; FBDC   02B1
        INCR    R1                              ; FBDD   0009
        ADDR    R7,     R1                      ; FBDE   00F9
        ADD@    R1,     R7                      ; FBDF   02CF

        SUBR    R6,     R0                      ; FBE0   0130
        INCR    R6                              ; FBE1   000E
        COMR    R2                              ; FBE2   001A
        ADCR    R6                              ; FBE3   002E
        SWAP    R0,     1                       ; FBE4   0040
        RLC     R2,     1                       ; FBE5   0052
        SAR     R0,     2                       ; FBE6   006C
        MOVR    R0,     R6                      ; FBE7   0086
        MOVR    R4,     R0                      ; FBE8   00A0
        MOVR    R7,     R2                      ; FBE9   00BA
        ADDR    R2,     R6                      ; FBEA   00D6
        ADDR    R6,     R2                      ; FBEB   00F2
        SUBR    R1,     R6                      ; FBEC   010E
        INCR    R6                              ; FBED   000E

        JSR     R5,     L_6859                  ; FBEE   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FBF1   0010 0092 0000 0038
        DECLE   $0020                           ; FBF5   0020

        MVII    #$0005, R2                      ; FBF6   02BA 0005
        B       L_FD10                          ; FBF8   0200 0116

        JSR     R5,     L_6859                  ; FBFA   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FBFD   0010 0092 0000 0038
        DECLE   $0020                           ; FC01   0020

        JSR     R5,     L_6859                  ; FC02   0004 0168 0059
        BIDECLE $9310,  $3888                   ; FC05   0010 0093 0088 0038
        DECLE   $0002                           ; FC09   0002

        MVII    #$0005, R2                      ; FC0A   02BA 0005
        B       L_FD10                          ; FC0C   0200 0102

        JSR     R5,     L_6859                  ; FC0E   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC11   0010 0092 0000 0038
        DECLE   $000C                           ; FC15   000C

        JSR     R5,     L_6859                  ; FC16   0004 0168 0059
        BIDECLE $9320,  $38D0                   ; FC19   0020 0093 00D0 0038
        DECLE   $0003                           ; FC1D   0003

        B       L_FD08                          ; FC1E   0200 00E8

        JSR     R5,     L_6859                  ; FC20   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC23   0010 0092 0000 0038
        DECLE   $000C                           ; FC27   000C

        JSR     R5,     L_6859                  ; FC28   0004 0168 0059
        BIDECLE $9338,  $3870                   ; FC2B   0038 0093 0070 0038
        DECLE   $000F                           ; FC2F   000F

        B       L_FD08                          ; FC30   0200 00D6

        JSR     R5,     L_6859                  ; FC32   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC35   0010 0092 0000 0038
        DECLE   $0007                           ; FC39   0007

        JSR     R5,     L_6859                  ; FC3A   0004 0168 0059
        BIDECLE $93B0,  $3838                   ; FC3D   00B0 0093 0038 0038
        DECLE   $0007                           ; FC41   0007

        JSR     R5,     L_6859                  ; FC42   0004 0168 0059
        BIDECLE $9338,  $3870                   ; FC45   0038 0093 0070 0038
        DECLE   $000F                           ; FC49   000F

        B       L_FD08                          ; FC4A   0200 00BC

        JSR     R5,     L_6859                  ; FC4C   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC4F   0010 0092 0000 0038
        DECLE   $0007                           ; FC53   0007

        JSR     R5,     L_6859                  ; FC54   0004 0168 0059
        BIDECLE $93B0,  $3838                   ; FC57   00B0 0093 0038 0038
        DECLE   $0007                           ; FC5B   0007

        JSR     R5,     L_6859                  ; FC5C   0004 0168 0059
        BIDECLE $93E8,  $3898                   ; FC5F   00E8 0093 0098 0038
        DECLE   $000A                           ; FC63   000A

        B       L_FD08                          ; FC64   0200 00A2

        JSR     R5,     L_6859                  ; FC66   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC69   0010 0092 0000 0038
        DECLE   $0007                           ; FC6D   0007

        JSR     R5,     L_6859                  ; FC6E   0004 0168 0059
        BIDECLE $9438,  $3858                   ; FC71   0038 0094 0058 0038
        DECLE   $0008                           ; FC75   0008

        JSR     R5,     L_6859                  ; FC76   0004 0168 0059
        BIDECLE $93E8,  $3898                   ; FC79   00E8 0093 0098 0038
        DECLE   $000A                           ; FC7D   000A

        B       L_FD08                          ; FC7E   0200 0088

        JSR     R5,     L_6859                  ; FC80   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC83   0010 0092 0000 0038
        DECLE   $0007                           ; FC87   0007

        JSR     R5,     L_6859                  ; FC88   0004 0168 0059
        BIDECLE $9478,  $3838                   ; FC8B   0078 0094 0038 0038
        DECLE   $000C                           ; FC8F   000C

        JSR     R5,     L_6859                  ; FC90   0004 0168 0059
        BIDECLE $93E8,  $3898                   ; FC93   00E8 0093 0098 0038
        DECLE   $000A                           ; FC97   000A

        B       L_FD08                          ; FC98   0200 006E

        JSR     R5,     L_6859                  ; FC9A   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FC9D   0010 0092 0000 0038
        DECLE   $0007                           ; FCA1   0007

        JSR     R5,     L_6859                  ; FCA2   0004 0168 0059
        BIDECLE $94D8,  $3838                   ; FCA5   00D8 0094 0038 0038
        DECLE   $0012                           ; FCA9   0012

        JSR     R5,     L_6859                  ; FCAA   0004 0168 0059
        BIDECLE $9320,  $38D0                   ; FCAD   0020 0093 00D0 0038
        DECLE   $0003                           ; FCB1   0003

        MVII    #$0005, R2                      ; FCB2   02BA 0005
        B       L_FD08                          ; FCB4   0200 0052

        JSR     R5,     L_6859                  ; FCB6   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FCB9   0010 0092 0000 0038
        DECLE   $000C                           ; FCBD   000C

        JSR     R5,     L_6859                  ; FCBE   0004 0168 0059
        BIDECLE $9520,  $3880                   ; FCC1   0020 0095 0080 0038
        DECLE   $0009                           ; FCC5   0009

        JSR     R5,     L_6859                  ; FCC6   0004 0168 0059
        BIDECLE $9320,  $38D0                   ; FCC9   0020 0093 00D0 0038
        DECLE   $0003                           ; FCCD   0003

        MVII    #$0005, R2                      ; FCCE   02BA 0005
        B       L_FD08                          ; FCD0   0200 0036

        JSR     R5,     L_6859                  ; FCD2   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FCD5   0010 0092 0000 0038
        DECLE   $000C                           ; FCD9   000C

        JSR     R5,     L_6859                  ; FCDA   0004 0168 0059
        BIDECLE $9650,  $3878                   ; FCDD   0050 0096 0078 0038
        DECLE   $0008                           ; FCE1   0008

        JSR     R5,     L_6859                  ; FCE2   0004 0168 0059
        BIDECLE $9320,  $38D0                   ; FCE5   0020 0093 00D0 0038
        DECLE   $0003                           ; FCE9   0003

        MVII    #$0005, R2                      ; FCEA   02BA 0005
        B       L_FD08                          ; FCEC   0200 001A

        JSR     R5,     L_6859                  ; FCEE   0004 0168 0059
        BIDECLE $9210,  $3800                   ; FCF1   0010 0092 0000 0038
        DECLE   $0007                           ; FCF5   0007

        JSR     R5,     L_6859                  ; FCF6   0004 0168 0059
        BIDECLE $9690,  $3838                   ; FCF9   0090 0096 0038 0038
        DECLE   $0008                           ; FCFD   0008

        JSR     R5,     L_6859                  ; FCFE   0004 0168 0059
        BIDECLE $9650,  $3878                   ; FD01   0050 0096 0078 0038
        DECLE   $0008                           ; FD05   0008

        MVII    #$0005, R2                      ; FD06   02BA 0005

L_FD08:
        JSR     R5,     L_6859                  ; FD08   0004 0168 0059
        BIDECLE $92F8,  $38E8                   ; FD0B   00F8 0092 00E8 0038
        DECLE   $0003                           ; FD0F   0003
L_FD10:
        MVII    #$0028, R5                      ; FD10   02BD 0028
        MVO@    R2,     R5                      ; FD12   026A
        MVO@    R2,     R5                      ; FD13   026A
        MVO@    R2,     R5                      ; FD14   026A
        MVO@    R2,     R5                      ; FD15   026A
        MVO@    R2,     R5                      ; FD16   026A
        MVO     R2,     G_015F                  ; FD17   0242 015F
        MVII    #$0002, R0                      ; FD19   02B8 0002
        MVO     R0,     .STIC.EDGE              ; FD1B   0240 0032
        PULR    R7                              ; FD1D   02B7

        PSHR    R5                              ; FD1E   0275

        JSR     R5,     L_6DBE                  ; FD1F   0004 016C 01BE
        DECLE   $0021,  $0004                   ; FD22   0021 0004

        ANDR    R5,     R0                      ; FD24   01A8
        CMP@    R6,     R2                      ; FD25   0372
        MVI     G_015D, R5                      ; FD26   0285 015D
        B       L_FE0B                          ; FD28   0200 00E1

        PSHR    R5                              ; FD2A   0275
        DIS                                     ; FD2B   0003
        SDBD                                    ; FD2C   0001
        MVII    #$AB44, R0                      ; FD2D   02B8 0044 00AB
        MVO     R0,     .ISRVEC.0               ; FD30   0240 0100
        SWAP    R0,     1                       ; FD32   0040
        MVO     R0,     .ISRVEC.1               ; FD33   0240 0101
        EIS                                     ; FD35   0002
        MVII    #$0144, R3                      ; FD36   02BB 0144
        ADD     G_015D, R3                      ; FD38   02C3 015D
        MVI@    R3,     R0                      ; FD3A   0298
        DECR    R0                              ; FD3B   0010
        MVO@    R0,     R3                      ; FD3C   0258

        JSR     R5,     L_6807                  ; FD3D   0004 0168 0007
        DECLE   $01C9,  $02BC,  $023C,  $0280   ; FD40   01C9 02BC 023C 0280
        DECLE   $0146,  $03B8,  $0001,  $0204   ; FD44   0146 03B8 0001 0204
        DECLE   $0007,  $0004,  $01AC,  $021D   ; FD48   0007 0004 01AC 021D
        DECLE   $02B9,  $0001,  $02BC,  $02A0   ; FD4C   02B9 0001 02BC 02A0
        DECLE   $0004,  $01AC,  $021D           ; FD50   0004 01AC 021D

        MVI     G_015D, R1                      ; FD53   0281 015D
        MVII    #$0144, R3                      ; FD55   02BB 0144
        ADD     G_015D, R3                      ; FD57   02C3 015D
        MVI@    R3,     R0                      ; FD59   0298
        TSTR    R0                              ; FD5A   0080
        BNEQ    L_FD89                          ; FD5B   020C 002C

        MVII    #$0007, R3                      ; FD5D   02BB 0007
        MVII    #$0205, R4                      ; FD5F   02BC 0205

        JSR     R5,     L_6C4E                  ; FD61   0004 016C 004E

        MVII    #$0002, R3                      ; FD64   02BB 0002
        MVII    #$0219, R4                      ; FD66   02BC 0219

        JSR     R5,     X_PRINT_R5              ; FD68   0004 0118 007B
        STRING  "Game  Over"                    ; FD6B  
        DECLE   $0000                           ; FD75   0000

        JSR     R5,     L_6DBE                  ; FD76   0004 016C 01BE
        DECLE   $0024                           ; FD79   0024

        MVII    #$012C, R3                      ; FD7A   02BB 012C
        MVO     R3,     G_035F                  ; FD7C   0243 035F
L_FD7E:
        MVI     G_035F, R0                      ; FD7E   0280 035F
        TSTR    R0                              ; FD80   0080
        BNEQ    L_FD7E                          ; FD81   022C 0004

        MVI     G_0146, R0                      ; FD83   0280 0146
        ANDI    #$0001, R0                      ; FD85   03B8 0001
        BEQ     L_FDBB                          ; FD87   0204 0032

L_FD89:
        MVI     G_0146, R0                      ; FD89   0280 0146
        ANDI    #$0001, R0                      ; FD8B   03B8 0001
        BEQ     L_FDCA                          ; FD8D   0204 003B

        MVI     G_015D, R5                      ; FD8F   0285 015D
        XORI    #$0001, R5                      ; FD91   03FD 0001
        MVO     R5,     G_015D                  ; FD93   0245 015D
        ADDI    #$0144, R5                      ; FD95   02FD 0144
        MVI@    R5,     R0                      ; FD97   02A8
        TSTR    R0                              ; FD98   0080
        BNEQ    L_FDCA                          ; FD99   020C 002F

        MVI     G_015D, R5                      ; FD9B   0285 015D
        XORI    #$0001, R5                      ; FD9D   03FD 0001
        MVO     R5,     G_015D                  ; FD9F   0245 015D
        ADDI    #$0144, R5                      ; FDA1   02FD 0144
        MVI@    R5,     R0                      ; FDA3   02A8
        TSTR    R0                              ; FDA4   0080
        BNEQ    L_FDCA                          ; FDA5   020C 0023

        MVII    #$0007, R3                      ; FDA7   02BB 0007
        MVII    #$0204, R4                      ; FDA9   02BC 0204

        JSR     R5,     X_PRINT_R5              ; FDAB   0004 0118 007B
        STRING  "Both Players"                  ; FDAE  
        DECLE   $0000                           ; FDBA   0000
L_FDBB:
        MVI     .PSG0.rgt_hand,R0               ; FDBB   0280 01FE
        XOR     .PSG0.lft_hand,R0               ; FDBD   03C0 01FF
        BEQ     L_FDBB                          ; FDBF   0224 0005

L_FDC1:
        MVI     .PSG0.rgt_hand,R0               ; FDC1   0280 01FE
        XOR     .PSG0.lft_hand,R0               ; FDC3   03C0 01FF
        BNEQ    L_FDC1                          ; FDC5   022C 0005
        J       X_RESET                         ; FDC7   0004 0310 0000

L_FDCA:
        MVII    #$0079, R3                      ; FDCA   02BB 0079
        MVO     R3,     G_035F                  ; FDCC   0243 035F
L_FDCE:
        MVI     G_035F, R0                      ; FDCE   0280 035F
        TSTR    R0                              ; FDD0   0080
        BNEQ    L_FDCE                          ; FDD1   022C 0004

        MVI     G_015D, R1                      ; FDD3   0281 015D
        MVII    #$0007, R3                      ; FDD5   02BB 0007
        MVII    #$0205, R4                      ; FDD7   02BC 0205

L_FDD9:
        JSR     R5,     L_6C4E                  ; FDD9   0004 016C 004E

        MVII    #$0002, R3                      ; FDDC   02BB 0002
        MVII    #$0219, R4                      ; FDDE   02BC 0219

        JSR     R5,     X_PRINT_R5              ; FDE0   0004 0118 007B
        STRING  "Get Ready!"                    ; FDE3  
        DECLE   $0000                           ; FDED   0000

        JSR     R5,     L_6DBE                  ; FDEE   0004 016C 01BE
        DECLE   $0021,  $02BB,  $0096,  $0243   ; FDF1   0021 02BB 0096 0243
        DECLE   $035F,  $0280,  $035F,  $0080   ; FDF5   035F 0280 035F 0080
        DECLE   $022C,  $0004,  $0004           ; FDF9   022C 0004 0004

        ANDR    R5,     R0                      ; FDFC   01A8
        CMP@    R6,     R2                      ; FDFD   0372
        MVII    #$0006, R5                      ; FDFE   02BD 0006
        MVII    #$0140, R1                      ; FE00   02B9 0140
        ADD     G_015D, R1                      ; FE02   02C1 015D
        MVI@    R1,     R0                      ; FE04   0288
        CMPR    R5,     R0                      ; FE05   0168
        BGE     L_FE09                          ; FE06   020D 0001

        MVO@    R5,     R1                      ; FE08   024D
L_FE09:
        MVI     G_015D, R5                      ; FE09   0285 015D
L_FE0B:
        ADDI    #$032E, R5                      ; FE0B   02FD 032E
        MVI@    R5,     R5                      ; FE0D   02AD
        MVO     R5,     G_0330                  ; FE0E   0245 0330
L_FE10:
        SUBI    #$0002, R5                      ; FE10   033D 0002
        DECLE   $02A8,  $0240,  $0105,  $02A8   ; FE12   02A8 0240 0105 02A8
        DECLE   $0004                           ; FE16   0004

        ANDR    R5,     R0                      ; FE17   01A8
        XOR     .STIC.X.4,R6                    ; FE18   03C6 0004
        CMPR    R5,     R0                      ; FE1A   0168
        DECR    R2                              ; FE1B   0012
        PULR    R7                              ; FE1C   02B7

        PSHR    R5                              ; FE1D   0275
        PSHR    R4                              ; FE1E   0274

        JSR     R5,     L_6C4C                  ; FE1F   0004 016C 004C

        INCR    R4                              ; FE22   000C
        SDBD                                    ; FE23   0001
        MVII    #$09F9, R0                      ; FE24   02B8 00F9 0009
        MVII    #$0144, R5                      ; FE27   02BD 0144
        ADDR    R1,     R5                      ; FE29   00CD
        MVI@    R5,     R5                      ; FE2A   02AD
        CMPI    #$0008, R5                      ; FE2B   037D 0008
        BLE     L_FE31                          ; FE2D   0206 0002

L_FE2F:
        MVII    #$0008, R5                      ; FE2F   02BD 0008
L_FE31:
        INCR    R7                              ; FE31   000F

L_FE32:
        MVO@    R0,     R4                      ; FE32   0260
L_FE33:
        DECR    R5                              ; FE33   0015
        BGE     L_FE32                          ; FE34   022D 0003

        PULR    R4                              ; FE36   02B4
        MVII    #$0003, R3                      ; FE37   02BB 0003
        ADDI    #$0015, R4                      ; FE39   02FC 0015

        JSR     R5,     X_PRINT_R5              ; FE3B   0004 0118 007B
        STRING  "Score"                         ; FE3E  
        DECLE   $0000                           ; FE43   0000

        MOVR    R1,     R2                      ; FE44   008A
        ADDI    #$032C, R1                      ; FE45   02F9 032C
        MVI@    R1,     R0                      ; FE47   0288
        MVII    #$0004, R1                      ; FE48   02B9 0004
        ADDI    #$0005, R4                      ; FE4A   02FC 0005

        JSR     R5,     X_PRNUM_RGT             ; FE4C   0004 0118 00C5

        ADDI    #$0004, R4                      ; FE4F   02FC 0004
        MOVR    R3,     R0                      ; FE51   0098
        ADDI    #$0080, R0                      ; FE52   02F8 0080
        MVO@    R0,     R4                      ; FE54   0260
        MVO@    R0,     R4                      ; FE55   0260
        ADDI    #$0004, R4                      ; FE56   02FC 0004

        JSR     R5,     X_PRINT_R5              ; FE58   0004 0118 007B
        STRING  "Grenades"                      ; FE5B  
        DECLE   $0000                           ; FE63   0000

        MVII    #$0140, R1                      ; FE64   02B9 0140
        ADDR    R2,     R1                      ; FE66   00D1
        MVI@    R1,     R0                      ; FE67   0288
        MVII    #$0003, R1                      ; FE68   02B9 0003
        ADDI    #$0005, R4                      ; FE6A   02FC 0005

        JSR     R5,     X_PRNUM_RGT             ; FE6C   0004 0118 00C5

        ADDI    #$0007, R4                      ; FE6F   02FC 0007

        JSR     R5,     X_PRINT_R5              ; FE71   0004 0118 007B
        STRING  "Mission"                       ; FE74  
        DECLE   $0000                           ; FE7B   0000

        ADDI    #$0142, R2                      ; FE7C   02FA 0142
        MVI@    R2,     R0                      ; FE7E   0290
        INCR    R0                              ; FE7F   0008
        MVII    #$0003, R1                      ; FE80   02B9 0003
        ADDI    #$0006, R4                      ; FE82   02FC 0006

        JSR     R5,     X_PRNUM_RGT             ; FE84   0004 0118 00C5

        PULR    R7                              ; FE87   02B7

        PSHR    R5                              ; FE88   0275
        PSHR    R1                              ; FE89   0271
        MVII    #$0008, R5                      ; FE8A   02BD 0008
        CLRR    R0                              ; FE8C   01C0
L_FE8D:
        SLR     R0,     2                       ; FE8D   0064
        MVI@    R4,     R1                      ; FE8E   02A1
        ANDI    #$0300, R1                      ; FE8F   03B9 0300
        SLR     R1,     2                       ; FE91   0065
        SWAP    R1,     1                       ; FE92   0041
        XORR    R1,     R0                      ; FE93   01C8
        DECR    R5                              ; FE94   0015
        BNEQ    L_FE8D                          ; FE95   022C 0009

        PULR    R1                              ; FE97   02B1
        PULR    R7                              ; FE98   02B7

        PSHR    R5                              ; FE99   0275
        PSHR    R1                              ; FE9A   0271
        MVII    #$0005, R5                      ; FE9B   02BD 0005
        CLRR    R0                              ; FE9D   01C0
L_FE9E:
        SLR     R0,     2                       ; FE9E   0064
        MVI@    R4,     R1                      ; FE9F   02A1
        ANDI    #$0300, R1                      ; FEA0   03B9 0300
        XORR    R1,     R0                      ; FEA2   01C8
        DECR    R5                              ; FEA3   0015
        BNEQ    L_FE9E                          ; FEA4   022C 0007

        PULR    R1                              ; FEA6   02B1
        PULR    R7                              ; FEA7   02B7
        BESC    L_FEAA                          ; FEA8   020F 0000

L_FEAA:
        DECR    R1                              ; FEAA   0011
        DECLE   $0001,  $011F,  $0000           ; FEAB   0001 011F 0000

        NEGR    R2                              ; FEAE   0022
        GSWD    R2                              ; FEAF   0032
        SWAP    R2,     1                       ; FEB0   0042
        RLC     R2,     1                       ; FEB1   0052
        ADDR    R3,     R7                      ; FEB2   00DF

        DECLE   $0000,  $01A3,  $00C4,  $0162   ; FEB3   0000 01A3 00C4 0162
        DECLE   $0005,  $0086,  $0237,  $00F7   ; FEB7   0005 0086 0237 00F7
        DECLE   $00CF,  $0000,  $02B3,  $0093   ; FEBB   00CF 0000 02B3 0093
        DECLE   $0102,  $0222,  $00D8           ; FEBF   0102 0222 00D8

        SARC    R0,     1                       ; FEC2   0078
        MOVR    R4,     R3                      ; FEC3   00A3
        ADDR    R5,     R7                      ; FEC4   00EF

        DECLE   $0000                           ; FEC5   0000

        SUBR    R2,     R2                      ; FEC6   0112
        ADDR    R4,     R2                      ; FEC7   00E2
        CMPR    R0,     R2                      ; FEC8   0142
        SUBR    R4,     R2                      ; FEC9   0122
        ADDR    R5,     R7                      ; FECA   00EF

        DECLE   $0000,  $01B2,  $0005,  $01C2   ; FECB   0000 01B2 0005 01C2
        DECLE   $0182,  $0212,  $00EF,  $0000   ; FECF   0182 0212 00EF 0000
        DECLE   $01D2,  $0005                   ; FED3   01D2 0005

        XORR    R4,     R2                      ; FED5   01E2
        ANDR    R0,     R2                      ; FED6   0182
        SUBR    R6,     R2                      ; FED7   0132
        ADDR    R5,     R7                      ; FED8   00EF

        DECLE   $0000,  $00B2,  $0005           ; FED9   0000 00B2 0005

        SLR     R2,     1                       ; FEDC   0062
        MVO@    R2,     R2                      ; FEDD   0252
        MVO@    R6,     R4                      ; FEDE   0266
        ADDR    R5,     R7                      ; FEDF   00EF

        DECLE   $0000,  $0192,  $0162,  $0152   ; FEE0   0000 0192 0162 0152
        DECLE   $02A6,  $0242,  $008F,  $0000   ; FEE4   02A6 0242 008F 0000
        DECLE   $0291,  $0000,  $0291,  $0000   ; FEE8   0291 0000 0291 0000
        DECLE   $001F,  $0291,  $0201,  $0171   ; FEEC   001F 0291 0201 0171
        DECLE   $01F1,  $0000,  $0271,  $0281   ; FEF0   01F1 0000 0271 0281
        DECLE   $001F,  $0291,  $0000,  $0000   ; FEF4   001F 0291 0000 0000
        DECLE   $011F,  $0000                   ; FEF8   011F 0000

        BESC    L_FEFC                          ; FEFA   020F 0000

L_FEFC:
        DECR    R1                              ; FEFC   0011
        DECLE   $0001,  $0082,  $00FF,  $0000   ; FEFD   0001 0082 00FF 0000

        DECR    R1                              ; FF01   0011
        NEGR    R1                              ; FF02   0021
        GSWD    R1                              ; FF03   0031
        SWAP    R1,     1                       ; FF04   0041
        RLC     R1,     1                       ; FF05   0051
        ADDR    R4,     R1                      ; FF06   00E1
        ADDR    R1,     R7                      ; FF07   00CF

        DECLE   $0000,  $0193,  $00C4,  $0161   ; FF08   0000 0193 00C4 0161
        DECLE   $0005,  $0121,  $0231           ; FF0C   0005 0121 0231

        RRC     R3,     1                       ; FF0F   0073
        ADDR    R1,     R7                      ; FF10   00CF

        DECLE   $0000                           ; FF11   0000

        SLR     R1,     1                       ; FF12   0061
        MOVR    R2,     R4                      ; FF13   0094
        ADDR    R6,     R1                      ; FF14   00F1
        BC      L_FE10                          ; FF15   0221 0106

        ADDR    R2,     R3                      ; FF17   00D3
        MOVR    R4,     R3                      ; FF18   00A3
        ADDR    R1,     R7                      ; FF19   00CF

        DECLE   $0000,  $00B1,  $0005,  $0131   ; FF1A   0000 00B1 0005 0131
        DECLE   $01A1,  $0005                   ; FF1E   01A1 0005

        SUBR    R2,     R1                      ; FF20   0111
        ADDR    R3,     R7                      ; FF21   00DF

        DECLE   $0000,  $0181,  $0151,  $0141   ; FF22   0000 0181 0151 0141
        DECLE   $01B1,  $0005                   ; FF26   01B1 0005

        XORR    R2,     R1                      ; FF28   01D1
        ADDR    R3,     R7                      ; FF29   00DF

        DECLE   $0000,  $01F2,  $0172,  $01E2   ; FF2A   0000 01F2 0172 01E2
        DECLE   $01C1,  $0005,  $0201,  $00DF   ; FF2E   01C1 0005 0201 00DF
        DECLE   $0000                           ; FF32   0000

        MVI@    R2,     R7                      ; FF33   0297
        MVI@    R4,     R7                      ; FF34   02A7

        DECLE   $0000,  $0251,  $0005,  $00DF   ; FF35   0000 0251 0005 00DF
        DECLE   $0000                           ; FF39   0000

        MVI@    R2,     R7                      ; FF3A   0297
        MVI@    R4,     R7                      ; FF3B   02A7
        MVI@    R2,     R7                      ; FF3C   0297
        MVI@    R4,     R7                      ; FF3D   02A7

        DECLE   $0211,  $0241,  $00BF,  $0000   ; FF3E   0211 0241 00BF 0000

        MVI@    R2,     R7                      ; FF42   0297
        MVI@    R4,     R7                      ; FF43   02A7
        MVI@    R2,     R7                      ; FF44   0297
        MVI@    R4,     R7                      ; FF45   02A7
        MVI@    R2,     R7                      ; FF46   0297
        MVI@    R4,     R7                      ; FF47   02A7

        DECLE   $0262,  $0272,  $0282,  $016F   ; FF48   0262 0272 0282 016F
        DECLE   $0000,  $0004,  $008C,  $006F   ; FF4C   0000 0004 008C 006F
        DECLE   $0004                           ; FF50   0004

        MOVR    R1,     R3                      ; FF51   008B
        MOVR    R5,     R7                      ; FF52   00AF

        DECLE   $0004                           ; FF53   0004

        RRC     R0,     2                       ; FF54   0074
        MOVR    R5,     R7                      ; FF55   00AF

        DECLE   $0004                           ; FF56   0004

        MOVR    R3,     R2                      ; FF57   009A
        MOVR    R5,     R7                      ; FF58   00AF

        DECLE   $0004                           ; FF59   0004

        MOVR    R6,     R4                      ; FF5A   00B4
        MOVR    R5,     R7                      ; FF5B   00AF

        DECLE   $0004                           ; FF5C   0004

        ADDR    R0,     R7                      ; FF5D   00C7
        MOVR    R5,     R7                      ; FF5E   00AF

        DECLE   $0004,  $00A2,  $006F,  $0001   ; FF5F   0004 00A2 006F 0001
        DECLE   $0000,  $0090,  $0001,  $00D9   ; FF63   0000 0090 0001 00D9
        DECLE   $0096,  $0001,  $00CA,  $0099   ; FF67   0096 0001 00CA 0099
        DECLE   $0001,  $0058,  $009B,  $0001   ; FF6B   0001 0058 009B 0001
        DECLE   $00E2,  $009B,  $0001,  $00D0   ; FF6F   00E2 009B 0001 00D0
        DECLE   $009C,  $0010,  $003D,  $0001   ; FF73   009C 0010 003D 0001
        DECLE   $00DC,  $0000,  $000B,  $0030   ; FF77   00DC 0000 000B 0030
        DECLE   $0012,  $0003,  $0004,  $00E2   ; FF7B   0012 0003 0004 00E2
        DECLE   $00FF,  $0016,  $0001,  $0004   ; FF7F   00FF 0016 0001 0004
        DECLE   $000A,  $0000,  $0016,  $0001   ; FF83   000A 0000 0016 0001

        COMR    R2                              ; FF87   001A
        SARC    R1,     2                       ; FF88   007D
        MOVR    R5,     R7                      ; FF89   00AF

        DECLE   $0091,  $0010,  $003D,  $0001   ; FF8A   0091 0010 003D 0001
        DECLE   $003C,  $0000,  $000B,  $0024   ; FF8E   003C 0000 000B 0024
        DECLE   $000E,  $0002,  $0004,  $0001   ; FF92   000E 0002 0004 0001
        DECLE   $0000,  $0016,  $0008,  $0091   ; FF96   0000 0016 0008 0091
        DECLE   $0010,  $003D,  $0001,  $005A   ; FF9A   0010 003D 0001 005A
        DECLE   $0000,  $0004,  $0019,  $0000   ; FF9E   0000 0004 0019 0000
        DECLE   $000B,  $0034,  $0016,  $0003   ; FFA2   000B 0034 0016 0003
        DECLE   $0001,  $005A,  $0000,  $0016   ; FFA6   0001 005A 0000 0016
        DECLE   $0003,  $0001,  $005A,  $0000   ; FFAA   0003 0001 005A 0000
        DECLE   $0004,  $00F6,  $00FF,  $0016   ; FFAE   0004 00F6 00FF 0016
        DECLE   $0003,  $0091,  $0010,  $003D   ; FFB2   0003 0091 0010 003D
        DECLE   $0001,  $0032,  $0000,  $0012   ; FFB6   0001 0032 0000 0012
        DECLE   $0005,  $000B,  $0034,  $0016   ; FFBA   0005 000B 0034 0016
        DECLE   $0002,  $000B,  $0000,  $0016   ; FFBE   0002 000B 0000 0016
        DECLE   $0001                           ; FFC2   0001

        COMR    R2                              ; FFC3   001A
        MOVR    R7,     R3                      ; FFC4   00BB
        MOVR    R5,     R7                      ; FFC5   00AF

        DECLE   $0091,  $0010,  $002D,  $0001   ; FFC6   0091 0010 002D 0001
        DECLE   $0040,  $0006,  $0004,  $0028   ; FFCA   0040 0006 0004 0028
        DECLE   $0000,  $0006,  $0078,  $0007   ; FFCE   0000 0006 0078 0007
        DECLE   $03FE,  $0008,  $00F0,  $000A   ; FFD2   03FE 0008 00F0 000A
        DECLE   $000B,  $003F,  $0009,  $0000   ; FFD6   000B 003F 0009 0000

        DECR    R6                              ; FFDA   0016
        SETC                                    ; FFDB   0007
        MOVR    R2,     R1                      ; FFDC   0091
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5018       <entry>
;;  $50AA       $50AD   $50B1  
;;  $50B3       $50B7  
;;  $50BF       $50BB  
;;  $50C5       $50C1  
;;  $50CB       $50C7  
;;  $50D4       $50D8   $50E5   $510F   $5115  
;;  $5174       $5170  
;;  $5175       $5161  
;;  $518A       $D238  
;;  $51A1       $519D  
;;  $51B6       $5182  
;;  $51C1       $51DA  
;;  $51DE       $51BD  
;;  $51E7       $5205  
;;  $5209       $51E1   $51E3  
;;  $520A       $5185  
;;  $5289       $5310   $5314  
;;  $52E0       $52B2   $52BA   $52C2   $52CA   $52D2  
;;  $530B       $518E  
;;  $531F       $5328  
;;  $5320       $5197  
;;  $5327       $5331   $5344  
;;  $532A       $532D  
;;  $5346       $5513  
;;  $5381       $551E   $6832  
;;  $5388       $5396  
;;  $5399       $5594  
;;  $53B3       $53A1   $53AA   $5464   $547B  
;;  $53B4       $5484  
;;  $53BA       $53CF  
;;  $53CA       $53BC   $53C2  
;;  $53D8       $5521  
;;  $53E4       $545C  
;;  $5458       $53E6   $540D   $541F   $5431   $5441   $5456  
;;  $545F       $50F0  
;;  $5513       $54A7   $54B1   $54BB   $54C5   $54CF   $54D9   $54EB   $54F5  
;;  $5513       $54FF   $5509  
;;  $5531       $5585   $5588   $558B   $558E   $5591  
;;  $556B       $5524   $6835  
;;  $5598       $538A   $5391  
;;  $55C3       $53D9   $682F  
;;  $55C7       $55D3  
;;  $55CF       $55CC  
;;  $55D6       $55F4   $561C  
;;  $55E1       $55E7  
;;  $55E6       $55DF  
;;  $55EB       $55E4  
;;  $55ED       $55F2   $55F7   $561A   $561F  
;;  $55EE       $649F   $6566   $6BF7  
;;  $5615       $64B3   $65A9   $6BE5  
;;  $563D       $5746  
;;  $5662       $565D  
;;  $5674       $5652  
;;  $56A1       $574F  
;;  $56C1       $56BC  
;;  $56CD       $56B2  
;;  $5716       $51A9  
;;  $571D       $5AA7  
;;  $5789       $5782  
;;  $57A5       $578F  
;;  $57D7       $57B2  
;;  $57E4       $57E1  
;;  $57FA       $576F  
;;  $581C       $5810  
;;  $5827       $575F  
;;  $5883       $588B  
;;  $5888       $5884  
;;  $589F       $589C  
;;  $58C6       $58BC  
;;  $58E1       $58CB  
;;  $58E4       $58DF  
;;  $591D       $58ED  
;;  $592A       $5927  
;;  $593C       $585D  
;;  $5950       $5947  
;;  $59B3       $59A4   $59AD   $59B1  
;;  $59EC       $59E2  
;;  $5A09       $59F1  
;;  $5A0C       $5A07  
;;  $5A27       $5A14   $5A1B  
;;  $5A5A       $5A33  
;;  $5A67       $5A64  
;;  $5A7A       $59BC   $59CC  
;;  $5A9C       $5A90  
;;  $5AA1       $5723   $5744   $5749   $574D   $5752   $5756   $5787   $57D5  
;;  $5AA1       $57F8   $581A   $5825   $5841   $5845   $58C4   $591B   $593A  
;;  $5AA1       $5970   $597A   $5992   $599C   $59A0   $59A8   $59EA   $5A58  
;;  $5AA1       $5A78   $5A9A   $5A9F  
;;  $5AB1       $55EF   $58B3   $59C9  
;;  $5ACA       $5AB7   $5ABF  
;;  $5B1C       $5B9A   $5BB1   $5BC3   $5BD7   $5C1C  
;;  $5B37       $5B31  
;;  $5B3D       $5B2F   $5B35  
;;  $5B5D       $50FF  
;;  $5B70       $5B6A  
;;  $5BA3       $F5D6  
;;  $5BE0       $F62D  
;;  $5C0E       $6022   $F5E3   $F63A   $F65C   $F721  
;;  $5C24       $5D91   $5DBD   $5DFF   $5E43   $5E73   $6AB2  
;;  $5C84       $5C7B  
;;  $5CE8       $5C27  
;;  $5D1B       $5C29  
;;  $5D1C       $6460  
;;  $5D3B       $5D30  
;;  $5D3E       $50E7  
;;  $5D45       $5E4F  
;;  $5D75       $5D6F  
;;  $5DCD       $5DD8   $5DDC   $5DDF   $5DE3   $5DEE   $5DF2  
;;  $5E18       $5E23   $5E27   $5E2A   $5E2E   $5E39   $5E3D   $5E48  
;;  $5E4A       $5D4A   $5D7E   $5D81   $5D84   $5D87   $5D94   $5DAF   $5DB3  
;;  $5E4A       $5DB6   $5DBA   $5DC0   $5DCF   $5E02   $5E1A  
;;  $5E52       $50EA  
;;  $5E5C       $5E62  
;;  $5E61       $5E70  
;;  $5E64       $5E5D  
;;  $5E76       $5E57   $5E5F   $5E69  
;;  $5E79       $5B63   $5B6E   $5B71   $5B77   $5B8A   $5C18   $5D32   $5D38  
;;  $5E7A       $5102  
;;  $5E7D       $6029  
;;  $5EF5       $5EED  
;;  $5F12       $5F09  
;;  $5F2C       $5F22  
;;  $5F7F       $5F79  
;;  $6022       $5EBF   $5ECD   $5EDB   $5EF3   $5EFB   $5F03   $5F2A   $5F32  
;;  $6022       $5F3F   $5F4A   $5F55   $5F60   $5F72   $5F88   $5FA8   $5FC8  
;;  $6022       $5FE8   $6008   $6020  
;;  $6025       $5E80   $5E83   $5E8B   $5EFD   $5F0E   $5F34   $5F36   $5F7D  
;;  $602B       $6033  
;;  $602C       $5EBC   $5ECA   $5ED8   $5F85   $F628  
;;  $603A       $50F9  
;;  $6047       $605E  
;;  $605A       $604D   $6057  
;;  $6061       $50FC  
;;  $6066       $6079  
;;  $607C       $50F6  
;;  $6086       $6112  
;;  $60C9       $60C0  
;;  $60D2       $60C7  
;;  $610E       $60A4   $60DA   $60E1  
;;  $6110       $60D0   $60F8   $610C  
;;  $611E       $611A  
;;  $611F       $6A88  
;;  $6121       $59C6   $60B4   $60EA  
;;  $6149       $6125   $613D   $6141   $6145  
;;  $6158       $6158  
;;  $616B       $614A  
;;  $616C       $646B   $6495   $65E0   $6691   $66A3   $66D4   $66FC   $675B  
;;  $616C       $6790  
;;  $617D       $6177  
;;  $6183       $617F  
;;  $6198       $6185   $618A   $6190   $6195  
;;  $619E       $5B44   $60B7   $60ED   $6101   $6A97  
;;  $61A6       $61A3  
;;  $61AE       $61AA  
;;  $61B7       $61B4  
;;  $61BF       $61BB  
;;  $620D       $620D  
;;  $6213       $6213  
;;  $6218       $6218  
;;  $621D       $621D  
;;  $62AA       $62AA  
;;  $62DD       $62DD  
;;  $6321       $6303  
;;  $6331       $632F  
;;  $6335       $6317  
;;  $6351       $634F  
;;  $6369       $6367  
;;  $6377       $50F3  
;;  $6379       $6745  
;;  $6392       $6388  
;;  $639B       $6398  
;;  $645E       $6586   $658A   $658E   $6592   $65D3  
;;  $648E       $65FA   $671B  
;;  $6490       $670A  
;;  $64A4       $671D  
;;  $64DD       $64EA  
;;  $64EC       $64DF  
;;  $6521       $6518  
;;  $652F       $652B  
;;  $6547       $6544  
;;  $6557       $654E  
;;  $657E       $657A  
;;  $659C       $6598  
;;  $6699       $6696  
;;  $66AC       $66A8  
;;  $66B2       $66AE  
;;  $673C       $64A2   $64B6   $6569   $65B0   $6613   $662C   $6645   $665E  
;;  $673E       $6396   $641B   $6421   $642D   $6437   $643B   $6446   $6455  
;;  $673E       $645C   $6465   $6472   $647D   $648C   $64D2   $64E5   $64EE  
;;  $673E       $64FB   $651C   $651F   $6523   $6526   $653D   $6549   $6555  
;;  $673E       $657F   $6594   $65BA   $65C7   $65D5   $65DC   $65E6   $65EA  
;;  $673E       $6663   $6668   $6680   $668B   $669D   $66B6   $66C3   $66CE  
;;  $673E       $66E4   $66F1   $66F8   $6702   $6706   $6714   $672A   $672E  
;;  $673E       $6736   $673A  
;;  $6741       $637F   $6386   $64C0  
;;  $6747       $674D   $6782  
;;  $6748       $6660  
;;  $6778       $676A   $676E   $6774  
;;  $677D       $6665  
;;  $67AD       $679F   $67A3   $67A9  
;;  $67B2       $6716  
;;  $67BD       $67BA  
;;  $67C7       $67C4  
;;  $67CD       $67C8  
;;  $67D0       $6468   $6492   $6559   $668E   $66A0   $66D1  
;;  $67DC       $642F   $653F   $6581   $65CE   $65D7   $66F3  
;;  $67E8       $6418   $6452   $646E   $6699   $66B2   $66C0   $66CB   $66E1  
;;  $67F4       $64E2   $6727  
;;  $6805       $67FD   $6801  
;;  $6806       $67F6  
;;  $6807       $503D   $FD3D  
;;  $680B       $680F  
;;  $6815       $683D  
;;  $681E       $682D  
;;  $6828       $6820  
;;  $6840       $FA0C   $FB46   $FBCC  
;;  $6841       $F596   $F5A3   $FA0F   $FA12   $FA15   $FB49   $FB4C   $FB4F  
;;  $6841       $FBCF   $FBD2   $FBD5  
;;  $684A       $684E  
;;  $684C       $502B   $F7F6   $FB93  
;;  $6851       $6856  
;;  $6854       $5BE9  
;;  $6859       $5084   $549F   $54A9   $54B3   $54BD   $54C7   $54D1   $54DB  
;;  $6859       $54E3   $54ED   $54F7   $5501   $550B   $6601   $6609   $661A  
;;  $6859       $6622   $6633   $663B   $664C   $6654   $FB5C   $FBEE   $FBFA  
;;  $6859       $FC02   $FC0E   $FC16   $FC20   $FC28   $FC32   $FC3A   $FC42  
;;  $6859       $FC4C   $FC54   $FC5C   $FC66   $FC6E   $FC76   $FC80   $FC88  
;;  $6859       $FC90   $FC9A   $FCA2   $FCAA   $FCB6   $FCBE   $FCC6   $FCD2  
;;  $6859       $FCDA   $FCE2   $FCEE   $FCF6   $FCFE   $FD08  
;;  $6860       $6871  
;;  $687C       $566C   $5691   $5763   $584A   $59C0   $69A9   $69EC  
;;  $68A6       $579D   $58D7   $59FF   $68F7   $693D  
;;  $68B2       $5041   $5081   $5488   $65FE   $6617   $6630   $6649   $6816  
;;  $68B2       $6A3A   $6A51   $6D64   $FA7A   $FBC8  
;;  $68BF       $68BF  
;;  $68C7       $5867   $586F   $5D9B   $5E09   $5E8F   $6753   $6788  
;;  $68D1       $68CC   $68D4  
;;  $68DA       $5B86   $5BA4   $5BCA   $5C12  
;;  $68E2       $68DF  
;;  $68EA       $68ED  
;;  $68EB       $68E9  
;;  $68F3       $5801   $5983   $5A81   $5D34  
;;  $6903       $5675   $56CE   $57B4   $58EF   $5A35  
;;  $690D       $6908  
;;  $6912       $6916  
;;  $6913       $6911  
;;  $691D       $6982  
;;  $691E       $541A   $580D   $598F   $5A8D  
;;  $6929       $692F   $6935  
;;  $6939       $68E3   $68FD  
;;  $693B       $692A  
;;  $6949       $564F   $56AF   $578C   $57AF   $58C8   $58EA   $59EE   $5A30  
;;  $6956       $695F   $6968   $696B  
;;  $6959       $695C  
;;  $696D       $6957  
;;  $6976       $583A   $5969  
;;  $6993       $567D   $56D6   $57CF   $5915   $5A52  
;;  $69A2       $56C9   $56E9   $58C1   $5918   $5937  
;;  $69BA       $69B4  
;;  $69BE       $58BE   $58E1  
;;  $69CA       $69B6  
;;  $69E3       $59E7   $5A55   $5A75   $5A9C  
;;  $69F4       $59E4   $5A09   $69C4  
;;  $69F8       $5670   $5695   $69BA   $69F0  
;;  $6A0D       $5784   $57D2   $57F5   $5822  
;;  $6A2A       $FA07   $FB6E  
;;  $6A33       $6A2F   $6B7E  
;;  $6A38       $6A35   $6A4C  
;;  $6A3A       $6A4F  
;;  $6A51       $6A5A  
;;  $6A63       $50ED  
;;  $6AAF       $6AA9  
;;  $6AB9       $6AAD  
;;  $6AD8       $6ACE   $6AD4  
;;  $6AEB       $6AB7   $6ABD   $6AC4  
;;  $6AFA       $6AF2  
;;  $6AFE       $6AF6  
;;  $6B07       $6AF0   $6AF8   $6AFC  
;;  $6B26       $6B0E  
;;  $6B2A       $6B12   $6B1C  
;;  $6B33       $6B0C   $6B16   $6B24   $6B28  
;;  $6B5C       $51AC  
;;  $6B69       $6B65  
;;  $6B9D       $6B7C   $6B8A   $6B97  
;;  $6BBD       $6BAF  
;;  $6BBF       $6BBB  
;;  $6BD9       $6BDB  
;;  $6BE9       $6BC3  
;;  $6BFA       $6A68   $6A6E   $6A9F   $6BA3   $6BA7   $6BAC   $6BB1   $6BB7  
;;  $6BFA       $6BC9   $6BD1  
;;  $6C1B       $5C33   $6AE1   $FA40  
;;  $6C35       $6C3B  
;;  $6C3D       $6C33  
;;  $6C4B       $6C2F   $6C37  
;;  $6C4C       $6C6F   $FE1F  
;;  $6C4E       $FD61   $FDD9  
;;  $6C69       $6C5E  
;;  $6C83       $6C78  
;;  $6CD1       $50E2  
;;  $6CF0       $6CE8  
;;  $6CF4       $6CEE  
;;  $6D23       $6D0C  
;;  $6D34       $6D0A  
;;  $6D4C       $6D46  
;;  $6D7B       $6CD7   $6CDC   $6CE2  
;;  $6DBE       $50D0   $5111   $5610   $5638   $583D   $596C   $5C73   $5CCB  
;;  $6DBE       $5CE3   $5D16   $65AC   $6AE5   $6CF0   $F582   $FD1F   $FD76  
;;  $6DBE       $FDEE  
;;  $6DD8       $6DCC  
;;  $6DF1       $516A   $51A6   $551B   $FA04   $FA1C   $FB6B  
;;  $6E0E       $6E40   $6E48   $6E4C   $6E55   $6E58   $6E63  
;;  $6E23       $6E21  
;;  $6E24       $6E22  
;;  $6E26       $6E24  
;;  $6E27       $6E25  
;;  $6E28       $6E26  
;;  $6E29       $6E27  
;;  $6E2A       $6E28  
;;  $6E2B       $6E29  
;;  $6E2C       $6E2A  
;;  $6E34       $6E32  
;;  $6E35       $6E33  
;;  $6E36       $6E34  
;;  $6E57       $6E52  
;;  $6E70       $6E90  
;;  $6EA5       $6EB2  
;;  $6EAE       $6EA7  
;;  $6EB6       $6EAC  
;;  $6ECF       $6EC0  
;;  $6ED0       $6EC5   $6ECE  
;;  $6EEA       $6EE1  
;;  $6EF3       $6EF6  
;;  $6F01       $6F04  
;;  $6F0B       $6E9F   $6EB4  
;;  $6F11       $6E5E   $6E6E  
;;  $6F15       $6F28  
;;  $6F3D       $6F5E  
;;  $6F49       $6F3F   $6F42  
;;  $6F56       $6F52  
;;  $6F59       $6F4C  
;;  $6F67       $6DE5   $6E69  
;;  $6F6B       $6F89  
;;  $6F86       $6F6C  
;;  $6FA5       $6FA3  
;;  $D022       $D011  
;;  $D0B3       $D0B1  
;;  $D0B8       $D1D7  
;;  $D0F1       $D0EF  
;;  $D0F3       $D0F1  
;;  $D156       $D0D4  
;;  $D188       $D086  
;;  $D19A       $D098  
;;  $D235       $D3DE  
;;  $D248       $D246  
;;  $D270       $D06B  
;;  $D27E       $D07C  
;;  $D2AF       $D3FC  
;;  $D2B7       $D1A5  
;;  $D2C0       $D1BE  
;;  $D2D2       $D1D0  
;;  $D2E6       $D2E4  
;;  $D2F4       $D0FA  
;;  $D2F5       $D2D2  
;;  $D316       $D316  
;;  $D317       $D115   $D25A  
;;  $D320       $D01E  
;;  $D38E       $D38C  
;;  $D3E2       $D1C0  
;;  $D3FC       $D33B  
;;  $D3FE       $D0ED  
;;  $D416       $D214  
;;  $D42A       $D228  
;;  $D470       $D26D  
;;  $D488       $D427  
;;  $D4AB       $D3B8  
;;  $D4C3       $D3C2  
;;  $D4D0       $D1CE   $D2B4  
;;  $D501       $D400  
;;  $D511       $D417  
;;  $D522       $D520  
;;  $D527       $D425  
;;  $D536       $D434  
;;  $D541       $D440  
;;  $D55B       $D35A  
;;  $D576       $D474  
;;  $D578       $D457  
;;  $D5B7       $D3B6  
;;  $D5BE       $D33D  
;;  $D5C1       $D3C0  
;;  $D602       $D600  
;;  $D607       $D605  
;;  $D615       $D50E  
;;  $D620       $D61E  
;;  $D63E       $D63C  
;;  $D648       $D646  
;;  $D659       $D358  
;;  $D66C       $D58D  
;;  $D6AD       $D6C9  
;;  $D6E7       $D5E5   $D5E7  
;;  $D6ED       $D6E4  
;;  $D6F2       $D530  
;;  $D6FE       $D6FC  
;;  $D700       $D5FE  
;;  $D70E       $D34C  
;;  $D71E       $D51C   $D61C  
;;  $D73E       $D73C  
;;  $D755       $D553  
;;  $D75A       $D557  
;;  $D76C       $D767  
;;  $D76E       $D66E  
;;  $D778       $D476  
;;  $D788       $D77B  
;;  $D7AA       $D6A8  
;;  $D7D2       $D5C1  
;;  $D7D7       $D4D0  
;;  $D804       $D602  
;;  $D818       $D813  
;;  $D81F       $D69E  
;;  $D822       $D620  
;;  $D825       $D724  
;;  $D83B       $D639  
;;  $D840       $D63E  
;;  $D843       $D852  
;;  $D844       $D541  
;;  $D886       $D684  
;;  $D89A       $D898  
;;  $D89E       $D884  
;;  $D8CD       $DB44  
;;  $D8E8       $D6E7  
;;  $D905       $D607  
;;  $D91B       $DA26  
;;  $D92B       $D82A  
;;  $D939       $D8BB  
;;  $D94D       $D70C  
;;  $D968       $D8EA   $D906  
;;  $D975       $D67A  
;;  $D99E       $D996  
;;  $D9A7       $DACE  
;;  $DA1F       $D71E  
;;  $DA64       $D8A5  
;;  $DA81       $D778  
;;  $DAA8       $DD13  
;;  $DAB6       $DAA8  
;;  $DAD0       $D7D2  
;;  $DB01       $DAFF  
;;  $DB0D       $DA05  
;;  $DB20       $DB18  
;;  $DB4E       $DA24  
;;  $DB8D       $DA85  
;;  $DC19       $D818  
;;  $DC82       $DC68  
;;  $DCA6       $DB98  
;;  $DCCE       $DCA4  
;;  $DD0A       $DB05  
;;  $DDA5       $DC6B  
;;  $DDAD       $DD8F  
;;  $DDB2       $DC98  
;;  $DDD9       $DCA7  
;;  $DDE3       $DAC9  
;;  $DE79       $DC77  
;;  $DED5       $DC9B  
;;  $DF42       $DD28  
;;  $DF84       $DC4A  
;;  $DFA8       $DCAA  
;;  $F013       $F011  
;;  $F026       $F026  
;;  $F0B2       $F0B2  
;;  $F1DB       $F1D9  
;;  $F2F1       $F2F1  
;;  $F31B       $F31B  
;;  $F31C       $F31C  
;;  $F359       $F359  
;;  $F384       $F384  
;;  $F385       $F385  
;;  $F398       $F398  
;;  $F3D1       $F3D1  
;;  $F476       $F476  
;;  $F481       $F481  
;;  $F49E       $F49E  
;;  $F4DD       $F4DB  
;;  $F4E3       $F4E3  
;;  $F4FD       $F4FB  
;;  $F511       $F51C   $F524   $F52C   $F534   $F53C   $F544   $F54C   $F554  
;;  $F511       $F55C   $F564   $F56C   $F5A6   $F5D4   $F5D9   $F5E6   $F630  
;;  $F511       $F6E7   $F6F3   $F724   $F732   $F740   $F74E   $F75C   $F76A  
;;  $F511       $F778   $F786   $F794   $F7AA   $F7B8   $F7C6   $F7F4   $F818  
;;  $F511       $F827   $F830   $F83B  
;;  $F512       $F510   $F516  
;;  $F590       $F58A  
;;  $F5D2       $F5AA   $F5AE   $F5B2   $F5B6   $F5BA   $F5BE   $F5C2   $F5C6  
;;  $F5D2       $F5CA   $F5CE  
;;  $F688       $F678   $F67C   $F680   $F684  
;;  $F6A4       $F694   $F698   $F69C   $F6A0  
;;  $F6C0       $F6B0   $F6B4   $F6B8   $F6BC  
;;  $F721       $F5F8   $F60C   $F620   $F62B   $F652   $F674   $F690   $F6AC  
;;  $F721       $F6CA   $F709  
;;  $F7A0       $F798  
;;  $F7BC       $F79C  
;;  $F7E4       $F7CC   $F7D2   $F7D8   $F7DE  
;;  $F7FA       $F7FA  
;;  $F7FC       $F7FC  
;;  $F83D       $F518  
;;  $F874       $F872  
;;  $F87B       $F86D  
;;  $F87F       $F891  
;;  $F893       $F879  
;;  $F896       $F896  
;;  $F897       $F889  
;;  $F898       $F898  
;;  $F8AC       $F893  
;;  $F8B4       $F8B4  
;;  $F8B7       $F89D   $F8A9  
;;  $F8C7       $F8B1  
;;  $F8EA       $F8EA  
;;  $F906       $F904  
;;  $F913       $F90F  
;;  $F922       $F920  
;;  $F940       $F940  
;;  $F9F5       $F9F1  
;;  $F9F7       $F9E0   $F9E6  
;;  $FA0B       $F9DA  
;;  $FA21       $FA23  
;;  $FA2F       $FA27  
;;  $FA47       $FA4E  
;;  $FA59       $FA70  
;;  $FA5A       $FA77  
;;  $FA6A       $FA6C  
;;  $FA73       $FA61  
;;  $FA86       $FA97  
;;  $FB76       $FB79  
;;  $FB7D       $FB80  
;;  $FB84       $FB87  
;;  $FD08       $FC1E   $FC30   $FC4A   $FC64   $FC7E   $FC98   $FCB4   $FCD0  
;;  $FD08       $FCEC  
;;  $FD10       $FBF8   $FC0C  
;;  $FD7E       $FD81  
;;  $FD89       $FD5B  
;;  $FDBB       $FD87   $FDBF  
;;  $FDC1       $FDC5  
;;  $FDCA       $FD8D   $FD99   $FDA5  
;;  $FDCE       $FDD1  
;;  $FDD9       $FAE7  
;;  $FE09       $FE06  
;;  $FE0B       $FD28  
;;  $FE10       $FF15  
;;  $FE2F       $FB3D  
;;  $FE31       $FE2D  
;;  $FE32       $FE34  
;;  $FE33       $FE31  
;;  $FE8D       $FE95  
;;  $FE9E       $FEA4  
;;  $FEAA       $FEA8  
;;  $FEFC       $FEFA  
;; ======================================================================== ;;
