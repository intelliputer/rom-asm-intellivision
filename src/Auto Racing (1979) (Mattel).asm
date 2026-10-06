
        ORG     $5000
.HEADER:
        BIDECLE $54FD           ; 5000  Ptr: MOB graphic images
        BIDECLE $5029           ; 5002  Ptr: EXEC timer table
        BIDECLE $5037           ; 5004  Ptr: Start of game
        BIDECLE $561D           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5645           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0003           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01C0,  $01D0,  $01C0,  $01D0   ; 5014   01C0 01D0 01C0 01D0
        DECLE   $01E0,  $01F0,  $01E0,  $01F0   ; 5018   01E0 01F0 01E0 01F0
.TITLE:
        DECLE   $004F                           ; 501C  Cartridge year
        STRING  "AUTO RACING"                   ; 501D  Title string
        DECLE   $0000                           ; 5028  

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5029  Timer dispatch/interval
        DECLE   $001E,  $0051,  $0001,  $0000; 502D  Timer dispatch/interval
        DECLE   $00B7,  $0051,  $000F,  $0000; 5031  Timer dispatch/interval
        BIDECLE $0000           ; 5035  End of timer table

.START:
        PSHR    R5                              ; 5037   0275
        MVII    #$0011, R0                      ; 5038   02B8 0011
        MVO     R0,     G_015D                  ; 503A   0240 015D
        MOVR    R7,     R0                      ; 503C   00B8
        ADDI    #$002D, R0                      ; 503D   02F8 002D
        MVO     R0,     G_035D                  ; 503F   0240 035D
        MVII    #$0002, R0                      ; 5041   02B8 0002
        MVO     R0,     G_0115                  ; 5043   0240 0115
        MVII    #$0200, R4                      ; 5045   02BC 0200
        MVII    #$00F0, R0                      ; 5047   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5049   0004 0114 0338

        MVII    #$0215, R4                      ; 504C   02BC 0215
        MVII    #$0007, R3                      ; 504E   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5050   0004 0118 007B
        STRING  "SELECT COURSE:"                ; 5053  
        DECLE   $0000                           ; 5061   0000

        MVII    #$0004, R0                      ; 5062   02B8 0004

        JSR     R5,     X_RAND2                 ; 5064   0004 0114 029E

        MVO     R0,     G_015E                  ; 5067   0240 015E
        PULR    R7                              ; 5069   02B7

        MOVR    R0,     R3                      ; 506A   0083
        RLC     R2,     2                       ; 506B   0056
        RRC     R0,     2                       ; 506C   0074
        RLC     R0,     1                       ; 506D   0050
        DIS                                     ; 506E   0003
        RLC     R1,     1                       ; 506F   0051
        DIS                                     ; 5070   0003
        RLC     R1,     1                       ; 5071   0051
        DIS                                     ; 5072   0003
        RLC     R1,     1                       ; 5073   0051
        PSHR    R5                              ; 5074   0275
        DECR    R0                              ; 5075   0010
        MVI     G_015D, R4                      ; 5076   0284 015D
        MOVR    R4,     R2                      ; 5078   00A2
        SWAP    R2,     2                       ; 5079   0046
        BMI     L_51B6                          ; 507A   020B 013A

        ANDI    #$0010, R2                      ; 507C   03BA 0010
        BEQ     L_50BB                          ; 507E   0204 003B

        MVII    #$0224, R2                      ; 5080   02BA 0224
        CMPI    #$000A, R0                      ; 5082   0378 000A
        BEQ     L_5092                          ; 5084   0204 000C

        CMPI    #$0005, R0                      ; 5086   0378 0005
        BC      L_50FF                          ; 5088   0201 0075

        MVO     R0,     G_015E                  ; 508A   0240 015E
        SLL     R0,     2                       ; 508C   004C
        SLL     R0,     1                       ; 508D   0048
        ADDI    #$008F, R0                      ; 508E   02F8 008F
        MVO@    R0,     R2                      ; 5090   0250
        PULR    R7                              ; 5091   02B7

L_5092:
        XORI    #$001C, R4                      ; 5092   03FC 001C
        MVO     R4,     G_015D                  ; 5094   0244 015D
        MVI     G_015E, R4                      ; 5096   0284 015E
        ADDR    R7,     R4                      ; 5098   00FC
        ADDI    #$02F1, R4                      ; 5099   02FC 02F1
        MVII    #$016C, R5                      ; 509B   02BD 016C
        MVI@    R4,     R3                      ; 509D   02A3
        MVO@    R3,     R5                      ; 509E   026B
        MVI@    R4,     R1                      ; 509F   02A1
        MVO@    R1,     R5                      ; 50A0   0269
        MVO@    R3,     R5                      ; 50A1   026B
        MVI@    R2,     R0                      ; 50A2   0290
        XORI    #$0005, R0                      ; 50A3   03F8 0005
        MVO@    R0,     R2                      ; 50A5   0250
        MVII    #$0265, R4                      ; 50A6   02BC 0265
        MVII    #$0007, R3                      ; 50A8   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 50AA   0004 0118 007B
        STRING  "SELECT CARS:"                  ; 50AD  
        DECLE   $0000                           ; 50B9   0000

        PULR    R7                              ; 50BA   02B7

L_50BB:
        MOVR    R1,     R3                      ; 50BB   008B
        INCR    R3                              ; 50BC   000B
        SLL     R3,     2                       ; 50BD   004F
        MOVR    R3,     R5                      ; 50BE   009D
        ANDR    R4,     R5                      ; 50BF   01A5
        BEQ     L_51B6                          ; 50C0   0204 00F4

        CMPI    #$000A, R0                      ; 50C2   0378 000A
        BEQ     L_50E3                          ; 50C4   0204 001D

        CMPI    #$0005, R0                      ; 50C6   0378 0005
        BC      L_50FF                          ; 50C8   0201 0035

        ADDI    #$015F, R1                      ; 50CA   02F9 015F
        MVII    #$0002, R5                      ; 50CC   02BD 0002
        MVO@    R5,     R1                      ; 50CE   024D
        ADDI    #$0003, R1                      ; 50CF   02F9 0003
        MVO@    R0,     R1                      ; 50D1   0248
        MOVR    R0,     R2                      ; 50D2   0082
        ADDR    R7,     R2                      ; 50D3   00FA
        ADDI    #$0247, R2                      ; 50D4   02FA 0247
        ADDR    R5,     R1                      ; 50D6   00E9
        MVI@    R2,     R5                      ; 50D7   0295
        MVO@    R5,     R1                      ; 50D8   024D
        MVO     R5,     G_0168                  ; 50D9   0245 0168
        ADDI    #$026E, R3                      ; 50DB   02FB 026E
        SDBD                                    ; 50DD   0001
        XORI    #$0830, R5                      ; 50DE   03FD 0030 0008
        MVO@    R5,     R3                      ; 50E1   025D
        PULR    R7                              ; 50E2   02B7

L_50E3:
        MVI     G_0164, R0                      ; 50E3   0280 0164
        CMP     G_0165, R0                      ; 50E5   0340 0165
        BEQ     L_50FF                          ; 50E7   0204 0016

        XORR    R3,     R4                      ; 50E9   01DC
        MVO     R4,     G_015D                  ; 50EA   0244 015D
        ADDI    #$026E, R3                      ; 50EC   02FB 026E
        MVI@    R3,     R5                      ; 50EE   029D
        XORI    #$0138, R5                      ; 50EF   03FD 0138
        MVO@    R5,     R3                      ; 50F1   025D
        ANDI    #$000C, R4                      ; 50F2   03BC 000C
        BNEQ    L_51B6                          ; 50F4   020C 00C0

        MVII    #$015F, R5                      ; 50F6   02BD 015F
        MVI@    R5,     R0                      ; 50F8   02A8
        ADD@    R5,     R0                      ; 50F9   02E8
        SUBI    #$0002, R0                      ; 50FA   0338 0002
        MVO@    R0,     R5                      ; 50FC   0268
        B       L_5118                          ; 50FD   0200 0019

L_50FF:
        JSR     R5,     X_PLAY_RAZZ2            ; 50FF   0004 011C 02BD

        PULR    R7                              ; 5102   02B7

        MVI     G_015D, R2                      ; 5103   0282 015D
        SARC    R2,     2                       ; 5105   007E
        BOV     L_5111                          ; 5106   0202 0009

L_5108:
        SLL     R1,     2                       ; 5108   004D
        SLL     R1,     2                       ; 5109   004D
        ADDI    #$017E, R1                      ; 510A   02F9 017E
        MVI@    R1,     R0                      ; 510C   0288
        SUBI    #$0008, R1                      ; 510D   0339 0008
        MVO@    R0,     R1                      ; 510F   0248
        MOVR    R5,     R7                      ; 5110   00AF

L_5111:
        PSHR    R5                              ; 5111   0275
        DECR    R0                              ; 5112   0010
        BNEQ    L_51B6                          ; 5113   020C 00A1

        INCR    R2                              ; 5115   000A
        MVO     R2,     G_015D                  ; 5116   0242 015D

L_5118:
        JSR     R5,     .EXEC.A61               ; 5118   0004 0118 0261

        INCR    R2                              ; 511B   000A
        ADDI    #$00D4, R7                      ; 511C   02FF 00D4

L_511E:
        PSHR    R5                              ; 511E   0275
        MVI     .PSG0.rgt_hand,R0               ; 511F   0280 01FE
        COMR    R0                              ; 5121   0018
        MVO     R0,     G_0124                  ; 5122   0240 0124
        MVI     .PSG0.lft_hand,R0               ; 5124   0280 01FF
        COMR    R0                              ; 5126   0018
        MVO     R0,     G_0123                  ; 5127   0240 0123
        MVII    #$016C, R5                      ; 5129   02BD 016C
        MVI@    R5,     R4                      ; 512B   02AC
        ADDI    #$0002, R4                      ; 512C   02FC 0002
        CLRR    R2                              ; 512E   01D2
        CMP@    R5,     R4                      ; 512F   036C
        BNEQ    L_5134                          ; 5130   020C 0002

        MVI@    R5,     R4                      ; 5132   02AC
        INCR    R2                              ; 5133   000A
L_5134:
        MOVR    R4,     R3                      ; 5134   00A3
        SDBD                                    ; 5135   0001
        XORI    #$5300, R4                      ; 5136   03FC 0000 0053
        MVI@    R4,     R0                      ; 5139   02A0
        SUB     G_0196, R0                      ; 513A   0300 0196

        JSR     R5,     X_EXT_SIGN_LO           ; 513C   0004 0114 0268

        BPL     L_5142                          ; 513F   0203 0001

        NEGR    R0                              ; 5141   0020
L_5142:
        MOVR    R0,     R1                      ; 5142   0081
        MVI@    R4,     R0                      ; 5143   02A0
        ANDI    #$00FF, R0                      ; 5144   03B8 00FF
        SUB     G_0197, R0                      ; 5146   0300 0197

        JSR     R5,     X_EXT_SIGN_LO           ; 5148   0004 0114 0268

        BPL     L_514E                          ; 514B   0203 0001

        NEGR    R0                              ; 514D   0020
L_514E:
        ADDR    R1,     R0                      ; 514E   00C8
        CMPI    #$0005, R0                      ; 514F   0378 0005
        BPL     L_5167                          ; 5151   0203 0014

        MVO     R3,     G_016C                  ; 5153   0243 016C
        ADD     G_016B, R2                      ; 5155   02C2 016B
        MVO     R2,     G_016B                  ; 5157   0242 016B
        CLRR    R1                              ; 5159   01C9
        CLRR    R0                              ; 515A   01C0
        MVII    #$0004, R3                      ; 515B   02BB 0004
        CMPI    #$0005, R2                      ; 515D   037A 0005
        MVII    #$0051, R2                      ; 515F   02BA 0051
        BMI     L_5167                          ; 5161   020B 0004
        ADD     G_0161, R7                      ; 5163   02C7 0161
        ADDI    #$0063, R7                      ; 5165   02FF 0063

L_5167:
        MVI     G_015D, R0                      ; 5167   0280 015D
        SARC    R0,     1                       ; 5169   0078
        BC      L_51B3                          ; 516A   0201 0047

        MVI     G_0192, R1                      ; 516C   0281 0192
        XORI    #$0001, R1                      ; 516E   03F9 0001
        MVO     R1,     G_0192                  ; 5170   0241 0192

        JSR     R5,     L_56D4                  ; 5172   0004 0154 02D4

        MVI     G_0192, R1                      ; 5175   0281 0192

        JSR     R5,     L_57C8                  ; 5177   0004 0154 03C8

        MVI     G_0192, R1                      ; 517A   0281 0192
        SARC    R1,     1                       ; 517C   0079
        BNC     L_51B3                          ; 517D   0209 0034

        MVII    #$0173, R4                      ; 517F   02BC 0173
        ADD     G_015F, R7                      ; 5181   02C7 015F

        MVII    #$0183, R4                      ; 5183   02BC 0183

        JSR     R5,     L_588A                  ; 5185   0004 0158 008A

        MOVR    R0,     R2                      ; 5188   0082
        MOVR    R1,     R3                      ; 5189   008B
        ADD     G_0161, R7                      ; 518A   02C7 0161
        B       L_5193                          ; 518C   0200 0005

        MVII    #$0183, R4                      ; 518E   02BC 0183

        JSR     R5,     L_588A                  ; 5190   0004 0158 008A

L_5193:
        ADDR    R2,     R0                      ; 5193   00D0
        SAR     R0,     1                       ; 5194   0068
        NEGR    R0                              ; 5195   0020
        MVO     R0,     G_019C                  ; 5196   0240 019C
        ADDR    R3,     R1                      ; 5198   00D9
        SAR     R1,     1                       ; 5199   0069
        NEGR    R1                              ; 519A   0021
        MVO     R1,     G_019F                  ; 519B   0241 019F
        ADDR    R2,     R0                      ; 519D   00D0
        ADDR    R3,     R1                      ; 519E   00D9
        MVII    #$0321, R2                      ; 519F   02BA 0321

        JSR     R5,     L_58C6                  ; 51A1   0004 0158 00C6

        NEGR    R0                              ; 51A4   0020
        NEGR    R1                              ; 51A5   0021

        JSR     R5,     L_58C6                  ; 51A6   0004 0158 00C6

        MVI     G_0194, R0                      ; 51A9   0280 0194
        CMP     G_0195, R0                      ; 51AB   0340 0195
        BPL     L_51B1                          ; 51AD   0203 0002

        MVI     G_0195, R0                      ; 51AF   0280 0195
L_51B1:
        MVO     R0,     G_015C                  ; 51B1   0240 015C

L_51B3:
        JSR     R5,     L_5E83                  ; 51B3   0004 015C 0283

L_51B6:
        PULR    R7                              ; 51B6   02B7

L_51B7:
        MVI     G_015D, R0                      ; 51B7   0280 015D
        SARC    R0,     1                       ; 51B9   0078
        BC      L_51C9                          ; 51BA   0201 000D

        MVII    #$0169, R1                      ; 51BC   02B9 0169
        MVI@    R1,     R0                      ; 51BE   0288
        CMPI    #$003B, R0                      ; 51BF   0378 003B
        BMI     L_51C7                          ; 51C1   020B 0004

        CLRR    R0                              ; 51C3   01C0
        MVO@    R0,     R1                      ; 51C4   0248
        INCR    R1                              ; 51C5   0009
        MVI@    R1,     R0                      ; 51C6   0288
L_51C7:
        INCR    R0                              ; 51C7   0008
        MVO@    R0,     R1                      ; 51C8   0248
L_51C9:
        MOVR    R5,     R7                      ; 51C9   00AF

L_51CA:
        JSR     R5,     L_5239                  ; 51CA   0004 0150 0239

        MVII    #$0078, R0                      ; 51CD   02B8 0078
        MVII    #$031D, R2                      ; 51CF   02BA 031D

        JSR     R5,     L_58B8                  ; 51D1   0004 0158 00B8
        JSR     R5,     L_58B8                  ; 51D4   0004 0158 00B8

        CLRR    R0                              ; 51D7   01C0
        MVO     R0,     G_019C                  ; 51D8   0240 019C
        MVO     R0,     G_019F                  ; 51DA   0240 019F
        MVO     R1,     G_015D                  ; 51DC   0241 015D
        SWAP    R1,     2                       ; 51DE   0045
        BMI     L_51E8                          ; 51DF   020B 0007

        JSR     R5,     .EXEC.A61               ; 51E1   0004 0118 0261

        INCR    R1                              ; 51E4   0009

        JSR     R5,     .EXEC.EB5               ; 51E5   0004 011C 02B5
L_51E8:
        JSR     R5,     X_PLAY_CHEER1           ; 51E8   0004 011C 02D5
        JSR     R5,     .EXEC.A61               ; 51EB   0004 0118 0261

        RSWD    R4                              ; 51EE   003C

        JSR     R5,     .EXEC.EB5               ; 51EF   0004 011C 02B5

L_51F2:
        DIS                                     ; 51F2   0003
        MVII    #$016F, R4                      ; 51F3   02BC 016F
        MVII    #$0080, R0                      ; 51F5   02B8 0080

        JSR     R5,     X_FILL_ZERO             ; 51F7   0004 0114 0338

        MVII    #$031F, R5                      ; 51FA   02BD 031F
L_51FC:
        MOVR    R7,     R4                      ; 51FC   00BC
        ADDI    #$0034, R4                      ; 51FD   02FC 0034
L_51FF:
        SDBD                                    ; 51FF   0001
        MVI@    R4,     R1                      ; 5200   02A1
        MVO@    R1,     R5                      ; 5201   0269
        SWAP    R1,     1                       ; 5202   0041
        MVO@    R1,     R5                      ; 5203   0269
        CLRR    R1                              ; 5204   01C9
        MVO@    R1,     R5                      ; 5205   0269
        INCR    R5                              ; 5206   000D
        MVO@    R1,     R5                      ; 5207   0269
        ADDI    #$0003, R5                      ; 5208   02FD 0003
        CMPI    #$033F, R5                      ; 520A   037D 033F
        BEQ     L_51FC                          ; 520C   0224 0011

        CMPI    #$035F, R5                      ; 520E   037D 035F
        BMI     L_51FF                          ; 5210   022B 0012

        JSR     R5,     L_52BD                  ; 5212   0004 0150 02BD

        MVII    #$0001, R1                      ; 5215   02B9 0001

        JSR     R5,     L_52BD                  ; 5217   0004 0150 02BD
        JSR     R5,     L_52DF                  ; 521A   0004 0150 02DF

        CLRR    R1                              ; 521D   01C9

        JSR     R5,     L_57C8                  ; 521E   0004 0154 03C8

        MVII    #$0001, R1                      ; 5221   02B9 0001

        JSR     R5,     L_57C8                  ; 5223   0004 0154 03C8
        JSR     R5,     L_5841                  ; 5226   0004 0158 0041
        JSR     R5,     .EXEC.A61               ; 5229   0004 0118 0261
        DECLE   $0005                           ; 522C   0005

        CLRR    R0                              ; 522D   01C0
        MVO     R0,     G_015D                  ; 522E   0240 015D
        PULR    R7                              ; 5230   02B7

        NOP                                     ; 5231   0034
        RLC     R0,     2                       ; 5232   0054
        NOP                                     ; 5233   0034
        SLLC    R0,     2                       ; 5234   005C
        GSWD    R3                              ; 5235   0033
        RLC     R1,     2                       ; 5236   0055
        GSWD    R3                              ; 5237   0033
        SLLC    R1,     2                       ; 5238   005D
L_5239:
        PSHR    R5                              ; 5239   0275
        MOVR    R1,     R5                      ; 523A   008D
        ADDI    #$0166, R1                      ; 523B   02F9 0166
        ADD@    R1,     R0                      ; 523D   02C8
        MVO@    R0,     R1                      ; 523E   0248
        ADD     G_0161, R7                      ; 523F   02C7 0161
        B       L_524E                          ; 5241   0200 000B

        CMPI    #$0032, R0                      ; 5243   0378 0032
        BMI     L_524E                          ; 5245   020B 0007

        MVII    #$0058, R2                      ; 5247   02BA 0058
        MOVR    R5,     R3                      ; 5249   00AB
        MOVR    R7,     R5                      ; 524A   00BD
        ADDI    #$0055, R5                      ; 524B   02FD 0055
        PSHR    R5                              ; 524D   0275
L_524E:
        MVII    #$003C, R0                      ; 524E   02B8 003C
        MVII    #$02B4, R4                      ; 5250   02BC 02B4

        JSR     R5,     X_PRPAD_R5              ; 5252   0004 0118 0071
        STRING  "       "                       ; 5255  
        DECLE   $0000                           ; 525C   0000

        ADDR    R7,     R2                      ; 525D   00FA
        MOVR    R2,     R1                      ; 525E   0091
        ADDI    #$0164, R3                      ; 525F   02FB 0164
        MVI@    R3,     R3                      ; 5261   029B

        JSR     R5,     X_PRINT_R1              ; 5262   0004 0118 0067

        ADD     G_0161, R7                      ; 5265   02C7 0161
        B       L_527F                          ; 5267   0200 0016

        MVII    #$02CB, R4                      ; 5269   02BC 02CB
        MVI     G_0166, R0                      ; 526B   0280 0166
        MVI     G_0164, R3                      ; 526D   0283 0164
        MVII    #$0002, R1                      ; 526F   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5271   0004 0118 00C5

        MVII    #$02D7, R4                      ; 5274   02BC 02D7
        MVI     G_0167, R0                      ; 5276   0280 0167
        MVI     G_0165, R3                      ; 5278   0283 0165

        JSR     R5,     X_PRNUM_LFT             ; 527A   0004 0118 009E

L_527D:
        INCR    R1                              ; 527D   0009
        PULR    R7                              ; 527E   02B7

L_527F:
        MVII    #$02CA, R4                      ; 527F   02BC 02CA
        MVII    #$0007, R3                      ; 5281   02BB 0007
        MVII    #$0002, R1                      ; 5283   02B9 0002
        MVI     G_016B, R0                      ; 5285   0280 016B
        MOVR    R0,     R2                      ; 5287   0082

        JSR     R5,     X_PRNUM_RGT             ; 5288   0004 0118 00C5

        MVII    #$02D5, R4                      ; 528B   02BC 02D5
        MVI     G_016A, R0                      ; 528D   0280 016A

        JSR     R5,     X_PRNUM_RGT             ; 528F   0004 0118 00C5

        MVII    #$00D7, R0                      ; 5292   02B8 00D7
        ADDI    #$0002, R4                      ; 5294   02FC 0002
        MVO@    R0,     R4                      ; 5296   0260
        MVI     G_0169, R0                      ; 5297   0280 0169

        JSR     R5,     X_PRNUM_ZRO             ; 5299   0004 0118 00AD

        CMPI    #$0005, R2                      ; 529C   037A 0005
        BMI     L_527D                          ; 529E   022B 0022

        MVII    #$0081, R1                      ; 52A0   02B9 0081
        PULR    R7                              ; 52A2   02B7

        DECLE   $0041,  $0048,  $0045,  $0041   ; 52A3   0041 0048 0045 0041
        DECLE   $0044,  $0000,  $0043,  $0052   ; 52A7   0044 0000 0043 0052
        DECLE   $0041,  $0053,  $0048,  $0000   ; 52AB   0041 0053 0048 0000
        DECLE   $0046,  $0049,  $004E,  $0049   ; 52AF   0046 0049 004E 0049
        DECLE   $0053,  $0048,  $0000,  $0057   ; 52B3   0053 0048 0000 0057
        DECLE   $0049,  $004E,  $004E,  $0045   ; 52B7   0049 004E 004E 0045
        DECLE   $0052,  $0000                   ; 52BB   0052 0000
L_52BD:
        PSHR    R5                              ; 52BD   0275
        MVO     R1,     G_0192                  ; 52BE   0241 0192
        MVII    #$0164, R2                      ; 52C0   02BA 0164
        ADDR    R1,     R2                      ; 52C2   00CA

        JSR     R5,     L_58AB                  ; 52C3   0004 0158 00AB

        ADDI    #$0008, R4                      ; 52C6   02FC 0008
        MVII    #$0040, R0                      ; 52C8   02B8 0040
        XOR@    R2,     R0                      ; 52CA   03D0
        MVO@    R0,     R4                      ; 52CB   0260
        MVII    #$0018, R0                      ; 52CC   02B8 0018
        MVO@    R0,     R4                      ; 52CE   0260
        SUBI    #$0002, R2                      ; 52CF   033A 0002
        MVI@    R2,     R3                      ; 52D1   0293
        SLL     R3,     2                       ; 52D2   004F
        MOVR    R7,     R5                      ; 52D3   00BD
        ADDI    #$004C, R5                      ; 52D4   02FD 004C
        ADDR    R3,     R5                      ; 52D6   00DD
        MVII    #$0004, R3                      ; 52D7   02BB 0004
L_52D9:
        MVI@    R5,     R0                      ; 52D9   02A8
        MVO@    R0,     R4                      ; 52DA   0260
        DECR    R3                              ; 52DB   0013
        BNEQ    L_52D9                          ; 52DC   022C 0004
        PULR    R7                              ; 52DE   02B7

L_52DF:
        PSHR    R5                              ; 52DF   0275
        MVII    #$016C, R5                      ; 52E0   02BD 016C
        MVI@    R5,     R4                      ; 52E2   02AC
        SDBD                                    ; 52E3   0001
        XORI    #$5300, R4                      ; 52E4   03FC 0000 0053
        MVI@    R4,     R3                      ; 52E7   02A3
        MVI@    R4,     R1                      ; 52E8   02A1
        MOVR    R1,     R2                      ; 52E9   008A
        ANDI    #$00FF, R1                      ; 52EA   03B9 00FF
        XORR    R1,     R2                      ; 52EC   01CA
        SLR     R2,     2                       ; 52ED   0066
        MVO     R2,     G_0172                  ; 52EE   0242 0172
        MVO     R2,     G_0182                  ; 52F0   0242 0182
        SLL     R2,     2                       ; 52F2   004E
        SWAP    R2,     1                       ; 52F3   0042
        MVII    #$0001, R0                      ; 52F4   02B8 0001
        ANDR    R0,     R2                      ; 52F6   0182
        XORR    R0,     R2                      ; 52F7   01C2

        JSR     R5,     X_RAND1                 ; 52F8   0004 0114 027D

        SLL     R0,     2                       ; 52FB   004C
        SLL     R0,     2                       ; 52FC   004C
        SLL     R0,     1                       ; 52FD   0048
        ADDR    R0,     R2                      ; 52FE   00C2
        ADDI    #$031F, R2                      ; 52FF   02FA 031F
        MVII    #$000A, R0                      ; 5301   02B8 000A

        JSR     R5,     L_58B8                  ; 5303   0004 0158 00B8

        MOVR    R3,     R0                      ; 5306   0098
        MVO     R0,     G_0196                  ; 5307   0240 0196
        MVO     R1,     G_0197                  ; 5309   0241 0197
        MVII    #$000C, R2                      ; 530B   02BA 000C
        MVII    #$0200, R4                      ; 530D   02BC 0200
L_530F:
        PSHR    R2                              ; 530F   0272

        JSR     R5,     L_595D                  ; 5310   0004 0158 015D

        PULR    R2                              ; 5313   02B2
        SUBI    #$0014, R0                      ; 5314   0338 0014
        INCR    R1                              ; 5316   0009
        DECR    R2                              ; 5317   0012
        BNEQ    L_530F                          ; 5318   022C 000A
        PULR    R7                              ; 531A   02B7

        DECLE   $0007,  $0004,  $0002,  $0003   ; 531B   0007 0004 0002 0003
        DECLE   $0001,  $0019,  $0032,  $0006   ; 531F   0001 0019 0032 0006
        DECLE   $0037,  $0028,  $003C,  $0005   ; 5323   0037 0028 003C 0005
        DECLE   $0041,  $001E,  $0032,  $0005   ; 5327   0041 001E 0032 0005
        DECLE   $004B,  $0019,  $0032,  $0004   ; 532B   004B 0019 0032 0004
        DECLE   $005A,  $0019,  $0032,  $0004   ; 532F   005A 0019 0032 0004
        DECLE   $005A,  $0069,  $00D8,  $00BE   ; 5333   005A 0069 00D8 00BE
        DECLE   $00B8,  $00EB,  $03C2,  $00CE   ; 5337   00B8 00EB 03C2 00CE
        DECLE   $02D8,  $0093,  $02F8,  $004F   ; 533B   02D8 0093 02F8 004F
        DECLE   $01F2,  $0032,  $0208,  $00FF   ; 533F   01F2 0032 0208 00FF
        DECLE   $0332,  $0003,  $035C,  $0003   ; 5343   0332 0003 035C 0003
        DECLE   $03A6,  $00FF,  $03D2,  $0028   ; 5347   03A6 00FF 03D2 0028
        DECLE   $00F8,  $0043,  $01E2,  $0013   ; 534B   00F8 0043 01E2 0013
        DECLE   $01A8,  $0013,  $017A,  $0043   ; 534F   01A8 0013 017A 0043
        DECLE   $011D,  $00C0,  $00A8,  $00EB   ; 5353   011D 00C0 00A8 00EB
        DECLE   $0192,  $00CB,  $0278           ; 5357   0192 00CB 0278

        MOVR    R7,     R6                      ; 535A   00BE
        MVI@    R3,     R0                      ; 535B   0298
        ADDR    R0,     R7                      ; 535C   00C7

        DECLE   $0068,  $00D5,  $0238,  $00C3   ; 535D   0068 00D5 0238 00C3
        DECLE   $0258,  $00EB,  $0112,  $00D0   ; 5361   0258 00EB 0112 00D0
        DECLE   $0208,  $00A3,  $032D,  $00A3   ; 5365   0208 00A3 032D 00A3
        DECLE   $037D,  $0039,  $0058,  $003F   ; 5369   037D 0039 0058 003F
        DECLE   $0372,  $003F                   ; 536D   0372 003F

        AND@    R2,     R2                      ; 536F   0392
        SAR     R2,     1                       ; 5370   006A
        MOVR    R7,     R0                      ; 5371   00B8
        SLLC    R3,     2                       ; 5372   005F
        ANDR    R4,     R2                      ; 5373   01A2
        SARC    R3,     1                       ; 5374   007B
        CMPR    R4,     R2                      ; 5375   0162
        SLR     R3,     2                       ; 5376   0067
        RSWD    R0                              ; 5377   0038
        MOVR    R2,     R3                      ; 5378   0093
        CMP@    R4,     R2                      ; 5379   0362
        MOVR    R1,     R3                      ; 537A   008B
        AND@    R2,     R2                      ; 537B   0392
        MOVR    R1,     R7                      ; 537C   008F

        DECLE   $00A8,  $0060,  $02C8,  $003B   ; 537D   00A8 0060 02C8 003B
        DECLE   $01A2,  $001F                   ; 5381   01A2 001F

        ANDR    R2,     R2                      ; 5383   0192
        RLC     R3,     1                       ; 5384   0053
        SUBR    R6,     R2                      ; 5385   0132
        SARC    R1,     1                       ; 5386   0079
        INCR    R0                              ; 5387   0008
        MOVR    R2,     R3                      ; 5388   0093
        SUB@    R4,     R2                      ; 5389   0322
        NOP                                     ; 538A   0034
        SWAP    R0,     1                       ; 538B   0040
        RLC     R0,     2                       ; 538C   0054
        SAR     R2,     1                       ; 538D   006A
        MOVR    R0,     R4                      ; 538E   0084
        MOVR    R1,     R2                      ; 538F   008A
        PSHR    R5                              ; 5390   0275
        MVI     G_015D, R2                      ; 5391   0282 015D
        SARC    R2,     1                       ; 5393   007A
        BC      L_546E                          ; 5394   0201 00D8

        SLR     R0,     2                       ; 5396   0064
        PSHR    R0                              ; 5397   0270
        MOVR    R1,     R2                      ; 5398   008A
        ADDI    #$0004, R2                      ; 5399   02FA 0004
        MVI@    R2,     R0                      ; 539B   0290

        JSR     R5,     X_UNPK_BYTES            ; 539C   0004 0114 0357

        MVII    #$019C, R4                      ; 539F   02BC 019C
        SUBI    #$0002, R2                      ; 53A1   033A 0002

        JSR     R5,     L_53BB                  ; 53A3   0004 0150 03BB

        INCR    R2                              ; 53A6   000A
        MOVR    R1,     R0                      ; 53A7   0088

        JSR     R5,     L_53BB                  ; 53A8   0004 0150 03BB

        PULR    R5                              ; 53AB   02B5
        PULR    R7                              ; 53AC   02B7

L_53AD:
        MOVR    R5,     R3                      ; 53AD   00AB
        SWAP    R3,     1                       ; 53AE   0043
        XORR    R0,     R3                      ; 53AF   01C3
        PULR    R1                              ; 53B0   02B1
        MVII    #$0001, R0                      ; 53B1   02B8 0001
        BMI     L_53B6                          ; 53B3   020B 0001

        XORR    R0,     R1                      ; 53B5   01C1
L_53B6:
        MVII    #$0045, R2                      ; 53B6   02BA 0045
        MOVR    R1,     R3                      ; 53B8   008B
        SUBI    #$01F1, R7                      ; 53B9   033F 01F1

L_53BB:
        PSHR    R5                              ; 53BB   0275
        MVI@    R4,     R5                      ; 53BC   02A5
        MVI@    R2,     R3                      ; 53BD   0293
        SWAP    R3,     1                       ; 53BE   0043
        ANDI    #$00FF, R3                      ; 53BF   03BB 00FF
        INCR    R4                              ; 53C1   000C
        ADD@    R4,     R3                      ; 53C2   02E3
        CMPI    #$0010, R3                      ; 53C3   037B 0010
        PULR    R3                              ; 53C5   02B3
        BMI     L_53AD                          ; 53C6   022B 001A
        MOVR    R3,     R7                      ; 53C8   009F

        PSHR    R5                              ; 53C9   0275
        MOVR    R0,     R5                      ; 53CA   0085
        MVI     G_015D, R2                      ; 53CB   0282 015D
        SARC    R2,     1                       ; 53CD   007A
        BC      L_546E                          ; 53CE   0201 009E

        SARC    R0,     2                       ; 53D0   007C
        BOV     L_546E                          ; 53D1   0202 009B

        ANDI    #$0001, R5                      ; 53D3   03BD 0001
        MVO     R0,     G_016F                  ; 53D5   0240 016F
        SLL     R0,     2                       ; 53D7   004C
        SLL     R0,     2                       ; 53D8   004C
        SLL     R0,     1                       ; 53D9   0048
        MOVR    R0,     R4                      ; 53DA   0084
        ADDI    #$031F, R4                      ; 53DB   02FC 031F
        MVI@    R4,     R0                      ; 53DD   02A0
        SWAP    R0,     1                       ; 53DE   0040
        ANDI    #$00FF, R0                      ; 53DF   03B8 00FF
        MVI@    R4,     R1                      ; 53E1   02A1
        SWAP    R1,     1                       ; 53E2   0041
        ANDI    #$00FF, R1                      ; 53E3   03B9 00FF
        PSHR    R1                              ; 53E5   0271
        PSHR    R0                              ; 53E6   0270
        SUBI    #$0009, R1                      ; 53E7   0339 0009
        SAR     R1,     2                       ; 53E9   006D
        SAR     R1,     1                       ; 53EA   0069
        PSHR    R1                              ; 53EB   0271
        SUBI    #$0009, R0                      ; 53EC   0338 0009
        SAR     R0,     2                       ; 53EE   006C
        SAR     R0,     1                       ; 53EF   0068
        SLL     R1,     2                       ; 53F0   004D
        ADD@    R6,     R1                      ; 53F1   02F1
        SLL     R1,     2                       ; 53F2   004D
        MOVR    R1,     R4                      ; 53F3   008C
        ADDR    R0,     R4                      ; 53F4   00C4
        ADDR    R5,     R4                      ; 53F5   00EC
        ADDI    #$0200, R4                      ; 53F6   02FC 0200
        MVI@    R4,     R0                      ; 53F8   02A0
        MVI@    R4,     R2                      ; 53F9   02A2
        ADDI    #$0012, R4                      ; 53FA   02FC 0012
        MVI@    R4,     R1                      ; 53FC   02A1
        MVI@    R4,     R3                      ; 53FD   02A3
        PULR    R4                              ; 53FE   02B4
        DECR    R4                              ; 53FF   0014
        TSTR    R5                              ; 5400   00AD
        BEQ     L_540C                          ; 5401   0204 0009

        XORR    R0,     R2                      ; 5403   01C2
        XORR    R2,     R0                      ; 5404   01D0
        XORR    R0,     R2                      ; 5405   01C2
        XORR    R1,     R3                      ; 5406   01CB
        XORR    R3,     R1                      ; 5407   01D9
        XORR    R1,     R3                      ; 5408   01CB
        ADDI    #$0002, R4                      ; 5409   02FC 0002
        NEGR    R4                              ; 540B   0024
L_540C:
        ANDI    #$0007, R4                      ; 540C   03BC 0007
        CMPI    #$0004, R4                      ; 540E   037C 0004
        BMI     L_5415                          ; 5410   020B 0003

        CLRR    R0                              ; 5412   01C0
        RRC     R0,     1                       ; 5413   0070
        MOVR    R0,     R1                      ; 5414   0081
L_5415:
        PULR    R5                              ; 5415   02B5
        DECR    R5                              ; 5416   0015
        ANDI    #$0007, R5                      ; 5417   03BD 0007
        CMPI    #$0007, R5                      ; 5419   037D 0007
        BNEQ    L_5420                          ; 541B   020C 0003

        CLRR    R0                              ; 541D   01C0
        RRC     R0,     1                       ; 541E   0070
        MOVR    R0,     R2                      ; 541F   0082
L_5420:
        CMPI    #$0002, R5                      ; 5420   037D 0002
        BPL     L_5428                          ; 5422   0203 0004

        MVII    #$0080, R1                      ; 5424   02B9 0080
        SWAP    R1,     1                       ; 5426   0041
        MOVR    R1,     R3                      ; 5427   008B
L_5428:
        CMPI    #$0002, R4                      ; 5428   037C 0002
        BMI     L_5432                          ; 542A   020B 0006

        XORR    R0,     R2                      ; 542C   01C2
        XORR    R2,     R0                      ; 542D   01D0
        XORR    R0,     R2                      ; 542E   01C2
        XORR    R1,     R3                      ; 542F   01CB
        XORR    R3,     R1                      ; 5430   01D9
        XORR    R1,     R3                      ; 5431   01CB
L_5432:
        CMPI    #$0004, R5                      ; 5432   037D 0004
        BMI     L_543C                          ; 5434   020B 0006

        XORR    R0,     R1                      ; 5436   01C1
        XORR    R1,     R0                      ; 5437   01C8
        XORR    R0,     R1                      ; 5438   01C1
        XORR    R2,     R3                      ; 5439   01D3
        XORR    R3,     R2                      ; 543A   01DA
        XORR    R2,     R3                      ; 543B   01D3
L_543C:
        MOVR    R0,     R5                      ; 543C   0085
        ANDR    R1,     R5                      ; 543D   018D
        ANDR    R2,     R5                      ; 543E   0195
        ANDR    R3,     R5                      ; 543F   019D
        BPL     L_544E                          ; 5440   0203 000C

L_5442:
        MOVR    R0,     R4                      ; 5442   0084
        ANDI    #$01FF, R4                      ; 5443   03BC 01FF
        BNEQ    L_5450                          ; 5445   020C 0009

        MOVR    R1,     R0                      ; 5447   0088
        MOVR    R2,     R1                      ; 5448   0091
        MOVR    R3,     R2                      ; 5449   009A
        CLRR    R3                              ; 544A   01DB
        TSTR    R0                              ; 544B   0080
        BMI     L_5442                          ; 544C   022B 000B

L_544E:
        MOVR    R6,     R4                      ; 544E   00B4
        MOVR    R4,     R0                      ; 544F   00A0
L_5450:
        MVII    #$00F0, R5                      ; 5450   02BD 00F0
        MVI     G_016F, R3                      ; 5452   0283 016F
        SLL     R3,     2                       ; 5454   004F
        SLL     R3,     2                       ; 5455   004F
        BEQ     L_545A                          ; 5456   0204 0002

        MVII    #$000F, R5                      ; 5458   02BD 000F
L_545A:
        ADDI    #$0174, R3                      ; 545A   02FB 0174
        MVI@    R3,     R1                      ; 545C   0299
        MVI     G_010F, R2                      ; 545D   0282 010F
        ANDR    R2,     R5                      ; 545F   0195
        SLL     R0,     1                       ; 5460   0048
        BMI     L_546F                          ; 5461   020B 000C

        CMPI    #$0018, R4                      ; 5463   037C 0018
        BMI     L_547F                          ; 5465   020B 0018

        SUBI    #$0002, R1                      ; 5467   0339 0002
        CMPI    #$0014, R1                      ; 5469   0379 0014
        BMI     L_546E                          ; 546B   020B 0001

        MVO@    R1,     R3                      ; 546D   0259
L_546E:
        PULR    R7                              ; 546E   02B7

L_546F:
        MVO     R5,     G_010F                  ; 546F   0245 010F

        JSR     R5,     L_5873                  ; 5471   0004 0158 0073

        MVI     G_016F, R1                      ; 5474   0281 016F
        MOVR    R1,     R3                      ; 5476   008B
        XORI    #$0001, R1                      ; 5477   03F9 0001
        MVII    #$004B, R2                      ; 5479   02BA 004B
        MVII    #$0002, R0                      ; 547B   02B8 0002
        SUBI    #$02B5, R7                      ; 547D   033F 02B5

L_547F:
        SLR     R1,     1                       ; 547F   0061
        INCR    R1                              ; 5480   0009
        MVO@    R1,     R3                      ; 5481   0259
        ADDI    #$000C, R3                      ; 5482   02FB 000C
        MVI@    R3,     R1                      ; 5484   0299
        MVII    #$000F, R0                      ; 5485   02B8 000F
        MVO@    R0,     R3                      ; 5487   0258
        SARC    R1,     1                       ; 5488   0079
        BC      L_546E                          ; 5489   0221 001C
        ADDI    #$03A9, R7                      ; 548B   02FF 03A9

        PSHR    R5                              ; 548D   0275
        MVI     G_015D, R2                      ; 548E   0282 015D
        SARC    R2,     1                       ; 5490   007A
        BC      L_54F2                          ; 5491   0201 005F

        SLR     R0,     1                       ; 5493   0060
        BNEQ    L_54F2                          ; 5494   020C 005C

        SLR     R3,     1                       ; 5496   0063
        CMPI    #$0002, R3                      ; 5497   037B 0002
        BNEQ    L_54F2                          ; 5499   020C 0057

        MVII    #$031D, R1                      ; 549B   02B9 031D

        JSR     R5,     .EXEC.777               ; 549D   0004 0114 0377

        MVII    #$033F, R4                      ; 54A0   02BC 033F

        JSR     R5,     .EXEC.784               ; 54A2   0004 0114 0384

        MVII    #$031F, R2                      ; 54A5   02BA 031F
        MOVR    R0,     R4                      ; 54A7   0084
        BPL     L_54AB                          ; 54A8   0203 0001

        NEGR    R0                              ; 54AA   0020
L_54AB:
        MOVR    R1,     R5                      ; 54AB   008D
        BPL     L_54AF                          ; 54AC   0203 0001

        NEGR    R1                              ; 54AE   0021
L_54AF:
        CMPR    R1,     R0                      ; 54AF   0148
        BPL     L_54B5                          ; 54B0   0203 0003

        INCR    R2                              ; 54B2   000A
        MOVR    R5,     R4                      ; 54B3   00AC
        MOVR    R1,     R0                      ; 54B4   0088
L_54B5:
        MVI     G_0174, R1                      ; 54B5   0281 0174
        SUB     G_0184, R1                      ; 54B7   0301 0184
        BPL     L_54BC                          ; 54B9   0203 0001

        NEGR    R1                              ; 54BB   0021
L_54BC:
        SLR     R1,     2                       ; 54BC   0065
        SLR     R1,     2                       ; 54BD   0065
        NEGR    R0                              ; 54BE   0020
        ADDI    #$0009, R0                      ; 54BF   02F8 0009
        SAR     R0,     1                       ; 54C1   0068
        ADDR    R1,     R0                      ; 54C2   00C8
        ADDI    #$0002, R0                      ; 54C3   02F8 0002
        TSTR    R4                              ; 54C5   00A4
        BPL     L_54C9                          ; 54C6   0203 0001

        NEGR    R0                              ; 54C8   0020

L_54C9:
        JSR     R5,     L_58B8                  ; 54C9   0004 0158 00B8

        NEGR    R0                              ; 54CC   0020

        JSR     R5,     L_58B8                  ; 54CD   0004 0158 00B8

        MVII    #$0173, R2                      ; 54D0   02BA 0173

        JSR     R5,     L_54F3                  ; 54D2   0004 0154 00F3

        MOVR    R0,     R3                      ; 54D5   0083
        MVII    #$0183, R2                      ; 54D6   02BA 0183

        JSR     R5,     L_54F3                  ; 54D8   0004 0154 00F3

        MVO@    R3,     R2                      ; 54DB   0253
        MVO     R0,     G_0173                  ; 54DC   0240 0173
        MVI     G_0174, R2                      ; 54DE   0282 0174
        MVI     G_0184, R3                      ; 54E0   0283 0184
        MVO     R3,     G_0174                  ; 54E2   0243 0174
        MVO     R2,     G_0184                  ; 54E4   0242 0184
        CLRR    R1                              ; 54E6   01C9

        JSR     R5,     L_5108                  ; 54E7   0004 0150 0108

        MVII    #$0001, R1                      ; 54EA   02B9 0001

        JSR     R5,     L_5108                  ; 54EC   0004 0150 0108
        JSR     R5,     L_5873                  ; 54EF   0004 0158 0073

L_54F2:
        PULR    R7                              ; 54F2   02B7

L_54F3:
        PSHR    R5                              ; 54F3   0275
        MVII    #$001E, R0                      ; 54F4   02B8 001E

        JSR     R5,     X_RAND2                 ; 54F6   0004 0114 029E

        SUBI    #$000F, R0                      ; 54F9   0338 000F
        ADD@    R2,     R0                      ; 54FB   02D0
        PULR    R7                              ; 54FC   02B7

        DECLE   $0000,  $0000,  $000C,  $000C   ; 54FD   0000 0000 000C 000C
        DECLE   $000C,  $0003,  $000E,  $000E   ; 5501   000C 0003 000E 000E
        DECLE   $000E,  $000E,  $0003,  $000C   ; 5505   000E 000E 0003 000C
        DECLE   $000C,  $000C,  $0000,  $0000   ; 5509   000C 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 550D   0000 0000 0000 0000
        DECLE   $0018,  $00C0,  $0070,  $0070   ; 5511   0018 00C0 0070 0070
        DECLE   $0070,  $0070,  $00C0,  $0018   ; 5515   0070 0070 00C0 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5519   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 551D   0000 0000 0000 0018
        DECLE   $0019,  $001F                   ; 5521   0019 001F

        CLRC                                    ; 5523   0006
        COMR    R4                              ; 5524   001C
        COMR    R4                              ; 5525   001C
        INCR    R5                              ; 5526   000D
        INCR    R7                              ; 5527   000F

        EIS                                     ; 5528   0002
L_5529:
        INCR    R4                              ; 5529   000C
        DECLE   $000C,  $000C,  $0000,  $0000   ; 552A   000C 000C 0000 0000
        DECLE   $0000,  $0008,  $0010,  $0080   ; 552E   0000 0008 0010 0080
        DECLE   $00F0,  $00F8,  $00F8,  $00E0   ; 5532   00F0 00F8 00F8 00E0
        DECLE   $00C4,  $0088,  $0000,  $0000   ; 5536   00C4 0088 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 553A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 553E   0000 0000

        DECR    R1                              ; 5540   0011
        RSWD    R3                              ; 5541   003B
        COMR    R6                              ; 5542   001E
        DECR    R4                              ; 5543   0014

        JSRE    R4,     .EXEC.C1F               ; 5544   0004 001D 001F
        DECLE   $000B,  $0002,  $0004,  $000E   ; 5547   000B 0002 0004 000E
        DECLE   $0006,  $0004,  $0020,  $0060   ; 554B   0006 0004 0020 0060
        DECLE   $0000,  $0020,  $00F0,  $00F0   ; 554F   0000 0020 00F0 00F0
        DECLE   $00E0,  $00C8,  $00D8,  $0080   ; 5553   00E0 00C8 00D8 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5557   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 555B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 555F   0000 0000 0000 0001
        DECLE   $000B,  $001A,  $0012,  $0004   ; 5563   000B 001A 0012 0004
        DECLE   $000E,  $0007,  $0004,  $0001   ; 5567   000E 0007 0004 0001
        DECLE   $0003,  $0002,  $0020,  $0040   ; 556B   0003 0002 0020 0040
        DECLE   $0040,  $0020,  $00E0,  $00F0   ; 556F   0040 0020 00E0 00F0
        DECLE   $00F0,  $00E4,  $0048,  $0048   ; 5573   00F0 00E4 0048 0048
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5577   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 557B   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0003   ; 557F   0001 0000 0001 0003
        DECLE   $0016,  $003C,  $0014,  $0006   ; 5583   0016 003C 0014 0006
        DECLE   $000F,  $000F,  $0004,  $0001   ; 5587   000F 000F 0004 0001
        DECLE   $0003,  $0001,  $0080,  $0080   ; 558B   0003 0001 0080 0080
        DECLE   $0020,  $0070,  $00E0,  $00E8   ; 558F   0020 0070 00E0 00E8
        DECLE   $00C8,  $00D0,  $0040,  $00C0   ; 5593   00C8 00D0 0040 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5597   0080 0000 0000 0000
        DECLE   $0080,  $0000,  $0001,  $0001   ; 559B   0080 0000 0001 0001
        DECLE   $0002,  $0000,  $0001,  $0001   ; 559F   0002 0000 0001 0001
        DECLE   $0003,  $0002,  $0014,  $003A   ; 55A3   0003 0002 0014 003A
        DECLE   $0012,  $0007,  $0006,  $0002   ; 55A7   0012 0007 0006 0002
        DECLE   $0001,  $0000,  $0000,  $0000   ; 55AB   0001 0000 0000 0000
        DECLE   $0040,  $00E8,  $00E8,  $00D0   ; 55AF   0040 00E8 00E8 00D0
        DECLE   $00C0,  $00E0,  $0060,  $00C0   ; 55B3   00C0 00E0 0060 00C0
        DECLE   $00C0,  $0080,  $0000,  $0080   ; 55B7   00C0 0080 0000 0080
        DECLE   $00C0,  $0080,  $0002,  $0002   ; 55BB   00C0 0080 0002 0002
        DECLE   $0004,  $0001,  $0001           ; 55BF   0004 0001 0001

        DIS                                     ; 55C2   0003
        DIS                                     ; 55C3   0003
        EIS                                     ; 55C4   0002

        JSR     R4,     .EXEC.43A               ; 55C5   0004 0014 003A

        RSWD    R3                              ; 55C8   003B
L_55C9:
        DECR    R7                              ; 55C9   0017

        DECLE   $0006,  $0002,  $0000,  $0000   ; 55CA   0006 0002 0000 0000
        DECLE   $0080,  $00D0,  $00D0,  $00A0   ; 55CE   0080 00D0 00D0 00A0
        DECLE   $0080,  $00C0,  $00C0,  $0040   ; 55D2   0080 00C0 00C0 0040
        DECLE   $0040,  $0080,  $0080,  $0040   ; 55D6   0040 0080 0080 0040
        DECLE   $00E0,  $00E0,  $0040,  $0004   ; 55DA   00E0 00E0 0040 0004
        DECLE   $0004,  $0005,  $0001,  $0001   ; 55DE   0004 0005 0001 0001
        DECLE   $0003,  $0007,  $0007,  $0004   ; 55E2   0003 0007 0007 0004
        DECLE   $0004,  $0004,  $001B,  $001B   ; 55E6   0004 0004 001B 001B
        DECLE   $001B,  $0003,  $0000,  $0000   ; 55EA   001B 0003 0000 0000
        DECLE   $0000,  $00A0,  $00A0,  $00A0   ; 55EE   0000 00A0 00A0 00A0
        DECLE   $0080,  $00C0,  $00C0,  $00C0   ; 55F2   0080 00C0 00C0 00C0
        DECLE   $0080,  $0080,  $0080,  $0080   ; 55F6   0080 0080 0080 0080
        DECLE   $0060,  $0060,  $0060,  $0000   ; 55FA   0060 0060 0060 0000
        DECLE   $0004,  $0005,  $0005,  $0001   ; 55FE   0004 0005 0005 0001
        DECLE   $0001,  $0003,  $0003,  $0002   ; 5602   0001 0003 0003 0002
        DECLE   $0002,  $0002,  $0003,  $000D   ; 5606   0002 0002 0003 000D
        DECLE   $000D,  $000D,  $0000,  $0000   ; 560A   000D 000D 0000 0000
        DECLE   $0020,  $00A0,  $00A0,  $0080   ; 560E   0020 00A0 00A0 0080
        DECLE   $0080,  $00C0,  $00C0,  $0040   ; 5612   0080 00C0 00C0 0040
        DECLE   $0040,  $0040,  $00C0,  $00B0   ; 5616   0040 0040 00C0 00B0
        DECLE   $00B0,  $00B0,  $0000           ; 561A   00B0 00B0 0000
.GFX_LIST_561D:
        DECLE   $00A5,  $0008,  $00A1,  $0042   ; 561D  CART PIC #00
        DECLE   $0023,  $0088,  $0025,  $0092   ; 5621  
        DECLE   $005F,  $008B,  $0033,  $0004   ; 5625  CART PIC #01
        DECLE   $0093,  $0041,  $000B,  $0097   ; 5629  
        DECLE   $00E4,  $00D1,  $0002,  $0054   ; 562D  CART PIC #02
        DECLE   $00E0,  $00D1,  $0082,  $00A9   ; 5631  
        DECLE   $0000,  $0010,  $005A,  $00FC   ; 5635  CART PIC #03
        DECLE   $007F,  $00BA,  $0014,  $0020   ; 5639  
        DECLE   $001A,  $00BC,  $00FE,  $007F   ; 563D  CART PIC #04
        DECLE   $00B9,  $0014,  $0020,  $0000   ; 5641  
.GRAM_INIT_5645:
        DECLE   $0028           ; 5645  # of GRAM cards to init
        DECLE   $0001,  $0200   ; 5646  #00-04:  CART #00-04 ----
        DECLE   $0088           ; 5648  #05   :  CART #04    --I-
        DECLE   $0021,  $0070   ; 5649  #06-06:  GROM #10-10 ----
        DECLE   $0059,  $01B0   ; 564B  #07-0A:  GROM #6C-6F ----
        DECLE   $0069,  $03B0   ; 564D  #0B-12:  GROM #74-7B ----
        DECLE   $0079,  $03B0   ; 564F  #13-1A:  GROM #7C-83 ----
        DECLE   $0009,  $01D0   ; 5651  #1B-1E:  GROM #04-07 ----
        DECLE   $0049,  $00D0   ; 5653  #1F-20:  GROM #24-25 ----
        DECLE   $003F,  $0030   ; 5655  #21-21:  GROM #5F-5F ----
        DECLE   $009F,  $0010   ; 5657  #22-22:  GROM #0F-0F --I-
        DECLE   $0261,  $006A   ; 5659  #23   :  Algo #1
        DECLE   $0147,  $0040   ; 565B  #24-24:  GRAM #23-23 -Y--
        DECLE   $0247,  $00C0   ; 565D  #25-26:  GRAM #23-24 X---
        DECLE   $0001,  $0010   ; 565F  #27-27:  GROM #00-00 ----

        DECLE   $0090,  $0053,  $0000,  $0000   ; 5661   0090 0053 0000 0000
        DECLE   $0010,  $0000,  $0009,  $00C9   ; 5665   0010 0000 0009 00C9
        DECLE   $0053,  $008D,  $0054,  $008D   ; 5669   0053 008D 0054 008D
        DECLE   $0154,  $018D,  $0054,  $018D   ; 566D   0154 018D 0054 018D
        DECLE   $0154,  $0090,  $0053,  $0000   ; 5671   0154 0090 0053 0000
        DECLE   $0000                           ; 5675   0000

        EIS                                     ; 5676   0002
        NEGR    R0                              ; 5677   0020
        INCR    R1                              ; 5678   0009
        ADDR    R1,     R1                      ; 5679   00C9
        RLC     R3,     1                       ; 567A   0053
        MOVR    R1,     R5                      ; 567B   008D
        RLC     R0,     2                       ; 567C   0054
        MOVR    R1,     R5                      ; 567D   008D
        CMPR    R2,     R4                      ; 567E   0154
        ANDR    R1,     R5                      ; 567F   018D
        RLC     R0,     2                       ; 5680   0054
        ANDR    R1,     R5                      ; 5681   018D
        CMPR    R2,     R4                      ; 5682   0154
        SLL     R1,     2                       ; 5683   004D
        SLL     R1,     2                       ; 5684   004D
        ADDI    #$0177, R1                      ; 5685   02F9 0177
        TSTR    R0                              ; 5687   0080
        BPL     L_568E                          ; 5688   0203 0004

        MVII    #$0002, R0                      ; 568A   02B8 0002
        MVO@    R0,     R1                      ; 568C   0248
        MOVR    R5,     R7                      ; 568D   00AF

L_568E:
        CLRR    R3                              ; 568E   01DB
        MVO@    R3,     R1                      ; 568F   024B
        SUBI    #$0004, R0                      ; 5690   0338 0004
        ANDI    #$000F, R0                      ; 5692   03B8 000F
        MVII    #$0010, R3                      ; 5694   02BB 0010
        CMPI    #$0008, R0                      ; 5696   0378 0008
        BMI     L_569C                          ; 5698   020B 0002

        NEGR    R3                              ; 569A   0023
        ADDR    R3,     R0                      ; 569B   00D8
L_569C:
        INCR    R1                              ; 569C   0009
        MVII    #$0002, R4                      ; 569D   02BC 0002
L_569F:
        MOVR    R0,     R2                      ; 569F   0082
        SUB@    R1,     R2                      ; 56A0   030A
        SWAP    R2,     2                       ; 56A1   0046
        BPL     L_56A5                          ; 56A2   0203 0001

        NEGR    R2                              ; 56A4   0022
L_56A5:
        ANDI    #$00FF, R2                      ; 56A5   03BA 00FF
        CMPI    #$0009, R2                      ; 56A7   037A 0009
        BMI     L_56B0                          ; 56A9   020B 0005

        NEGR    R3                              ; 56AB   0023
        ADDR    R3,     R0                      ; 56AC   00D8
        DECR    R4                              ; 56AD   0014
        BNEQ    L_569F                          ; 56AE   022C 0010

L_56B0:
        MVO@    R0,     R1                      ; 56B0   0248
        TSTR    R0                              ; 56B1   0080
        BPL     L_56B5                          ; 56B2   0203 0001

        NEGR    R0                              ; 56B4   0020
L_56B5:
        CMPI    #$000D, R0                      ; 56B5   0378 000D
        BMI     L_56BB                          ; 56B7   020B 0002

        MVII    #$000C, R0                      ; 56B9   02B8 000C
L_56BB:
        ADDR    R7,     R0                      ; 56BB   00F8
        ADDI    #$000B, R0                      ; 56BC   02F8 000B
        MOVR    R0,     R2                      ; 56BE   0082
        MVI@    R2,     R0                      ; 56BF   0290
        TSTR    R3                              ; 56C0   009B
        BPL     L_56C4                          ; 56C1   0203 0001

        NEGR    R0                              ; 56C3   0020
L_56C4:
        INCR    R1                              ; 56C4   0009
        MVO@    R0,     R1                      ; 56C5   0248
        MOVR    R5,     R7                      ; 56C6   00AF

        DECLE   $0000,  $0001,  $0002,  $0004   ; 56C7   0000 0001 0002 0004

        INCR    R0                              ; 56CB   0008
        INCR    R5                              ; 56CC   000D
        DECR    R3                              ; 56CD   0013
        COMR    R1                              ; 56CE   0019
        NEGR    R0                              ; 56CF   0020
        ADCR    R0                              ; 56D0   0028
        GSWD    R0                              ; 56D1   0030
        RSWD    R0                              ; 56D2   0038
        SWAP    R0,     1                       ; 56D3   0040
L_56D4:
        PSHR    R5                              ; 56D4   0275
        MOVR    R1,     R2                      ; 56D5   008A
        ADDI    #$015F, R2                      ; 56D6   02FA 015F
        ADD@    R2,     R7                      ; 56D8   02D7
        B       L_5787                          ; 56D9   0200 00AC

        JSR     R5,     L_58AB                  ; 56DB   0004 0158 00AB

        ADDI    #$0005, R4                      ; 56DE   02FC 0005
        MOVR    R4,     R5                      ; 56E0   00A5
        MVI@    R4,     R0                      ; 56E1   02A0
        DECR    R4                              ; 56E2   0014
        DECR    R0                              ; 56E3   0010
        BMI     L_56EB                          ; 56E4   020B 0005
        BNEQ    L_56EA                          ; 56E6   020C 0002

        MVO@    R0,     R4                      ; 56E8   0260
        MVO@    R0,     R4                      ; 56E9   0260
L_56EA:
        MVO@    R0,     R4                      ; 56EA   0260
L_56EB:
        MOVR    R1,     R4                      ; 56EB   008C
        MVII    #$0003, R0                      ; 56EC   02B8 0003
        DECR    R5                              ; 56EE   0015
        MVI@    R5,     R2                      ; 56EF   02AA
        TSTR    R2                              ; 56F0   0092
        BNEQ    L_5707                          ; 56F1   020C 0014

        ADDI    #$0002, R4                      ; 56F3   02FC 0002
        MVI@    R4,     R2                      ; 56F5   02A2
        ADDI    #$0005, R5                      ; 56F6   02FD 0005
        CMP@    R5,     R2                      ; 56F8   036A
        BMI     L_56FC                          ; 56F9   020B 0001

        DECR    R0                              ; 56FB   0010
L_56FC:
        CMP@    R5,     R2                      ; 56FC   036A
        BMI     L_5700                          ; 56FD   020B 0001

        DECR    R0                              ; 56FF   0010
L_5700:
        MVO@    R0,     R4                      ; 5700   0260
        MOVR    R1,     R4                      ; 5701   008C
        ADDI    #$000E, R1                      ; 5702   02F9 000E
        MVI@    R1,     R0                      ; 5704   0288
        SLR     R0,     1                       ; 5705   0060
        MVO@    R0,     R1                      ; 5706   0248
L_5707:
        MVI@    R4,     R0                      ; 5707   02A0
        SUB@    R4,     R0                      ; 5708   0320

        JSR     R5,     X_EXT_SIGN_LO           ; 5709   0004 0114 0268

        SDBD                                    ; 570C   0001
        CMPI    #$FF80, R0                      ; 570D   0378 0080 00FF
        BPL     L_5714                          ; 5710   0203 0002

        ADDI    #$0100, R0                      ; 5712   02F8 0100
L_5714:
        MOVR    R0,     R3                      ; 5714   0083
        BPL     L_5718                          ; 5715   0203 0001

        NEGR    R0                              ; 5717   0020
L_5718:
        PSHR    R0                              ; 5718   0270
        MVI@    R4,     R1                      ; 5719   02A1
        MOVR    R4,     R5                      ; 571A   00A5
        INCR    R5                              ; 571B   000D
        MVI@    R5,     R5                      ; 571C   02AD
        TSTR    R5                              ; 571D   00AD
        BEQ     L_5725                          ; 571E   0204 0005

        TSTR    R1                              ; 5720   0089
        BEQ     L_5725                          ; 5721   0204 0002

        MVII    #$0018, R0                      ; 5723   02B8 0018
L_5725:
        TSTR    R0                              ; 5725   0080
        BEQ     L_5731                          ; 5726   0204 0009

        SLR     R0,     2                       ; 5728   0064
        ADDI    #$0007, R0                      ; 5729   02F8 0007
        CMPI    #$000F, R0                      ; 572B   0378 000F
        BMI     L_5731                          ; 572D   020B 0002

        MVII    #$000F, R0                      ; 572F   02B8 000F
L_5731:
        MVII    #$0194, R5                      ; 5731   02BD 0194
        ADD     G_0192, R5                      ; 5733   02C5 0192
        MVO@    R0,     R5                      ; 5735   0268
        SLR     R1,     1                       ; 5736   0061
        MVO     R1,     G_015B                  ; 5737   0241 015B
        PULR    R0                              ; 5739   02B0

        JSR     R5,     L_5788                  ; 573A   0004 0154 0388

        ADDI    #$0002, R4                      ; 573D   02FC 0002
        MVI@    R4,     R0                      ; 573F   02A0

        JSR     R5,     L_5912                  ; 5740   0004 0158 0112

        BEQ     L_5753                          ; 5743   0204 000E

        MOVR    R0,     R2                      ; 5745   0082
        ADDI    #$0040, R0                      ; 5746   02F8 0040
        SAR     R0,     2                       ; 5748   006C
        SAR     R0,     2                       ; 5749   006C
        SAR     R0,     2                       ; 574A   006C
        SAR     R0,     1                       ; 574B   0068
        BNEQ    L_5753                          ; 574C   020C 0005

        INCR    R0                              ; 574E   0008
        TSTR    R2                              ; 574F   0092
        BPL     L_5753                          ; 5750   0203 0001

        NEGR    R0                              ; 5752   0020
L_5753:
        MOVR    R0,     R2                      ; 5753   0082
        MOVR    R3,     R0                      ; 5754   0098

        JSR     R5,     L_5912                  ; 5755   0004 0158 0112

        BEQ     L_5767                          ; 5758   0204 000D

        MOVR    R0,     R3                      ; 575A   0083
        ADDI    #$0010, R0                      ; 575B   02F8 0010
        SAR     R0,     2                       ; 575D   006C
        SAR     R0,     2                       ; 575E   006C
        SAR     R0,     1                       ; 575F   0068
        BNEQ    L_5767                          ; 5760   020C 0005

        INCR    R0                              ; 5762   0008
        TSTR    R3                              ; 5763   009B
        BPL     L_5767                          ; 5764   0203 0001

        NEGR    R0                              ; 5766   0020
L_5767:
        MOVR    R0,     R3                      ; 5767   0083
        SUBI    #$0008, R4                      ; 5768   033C 0008
        MOVR    R4,     R5                      ; 576A   00A5
        MVI@    R4,     R0                      ; 576B   02A0
        ADDR    R2,     R0                      ; 576C   00D0
        MVO@    R0,     R5                      ; 576D   0268
        ADDI    #$0002, R5                      ; 576E   02FD 0002
        MVI@    R5,     R0                      ; 5770   02A8
        TSTR    R0                              ; 5771   0080
        BNEQ    L_5778                          ; 5772   020C 0004

        DECR    R4                              ; 5774   0014
        MVI@    R4,     R0                      ; 5775   02A0
        B       L_5782                          ; 5776   0200 000A

L_5778:
        MOVR    R3,     R0                      ; 5778   0098
        ADDR    R2,     R0                      ; 5779   00D0
        ADDI    #$0008, R5                      ; 577A   02FD 0008
        MVI@    R5,     R1                      ; 577C   02A9

        JSR     R5,     L_57B9                  ; 577D   0004 0154 03B9

        ADD@    R4,     R0                      ; 5780   02E0
        DECR    R4                              ; 5781   0014
L_5782:
        MVO@    R0,     R4                      ; 5782   0260
        CLRR    R0                              ; 5783   01C0
        INCR    R4                              ; 5784   000C
        MVO@    R0,     R4                      ; 5785   0260
        MVO@    R0,     R4                      ; 5786   0260
L_5787:
        PULR    R7                              ; 5787   02B7

L_5788:
        PSHR    R5                              ; 5788   0275
        MOVR    R0,     R2                      ; 5789   0082
        MVI@    R4,     R1                      ; 578A   02A1

        JSR     R5,     L_591E                  ; 578B   0004 0158 011E

        PSHR    R0                              ; 578E   0270
        MOVR    R2,     R0                      ; 578F   0090
        MVII    #$0040, R1                      ; 5790   02B9 0040

        JSR     R5,     L_57B9                  ; 5792   0004 0154 03B9

        MVI@    R4,     R1                      ; 5795   02A1
        ADDI    #$0007, R4                      ; 5796   02FC 0007
        SUB@    R4,     R1                      ; 5798   0321

        JSR     R5,     L_591E                  ; 5799   0004 0158 011E

        SUB@    R6,     R0                      ; 579C   0330
        ADDI    #$0020, R0                      ; 579D   02F8 0020
        SAR     R0,     2                       ; 579F   006C
        SAR     R0,     2                       ; 57A0   006C
        SAR     R0,     2                       ; 57A1   006C
        MOVR    R4,     R5                      ; 57A2   00A5
        SUBI    #$000A, R4                      ; 57A3   033C 000A
        ADD@    R4,     R0                      ; 57A5   02E0
        SUB@    R4,     R0                      ; 57A6   0320
        SUBI    #$0003, R4                      ; 57A7   033C 0003
        MVI@    R4,     R1                      ; 57A9   02A1
        ADDR    R1,     R0                      ; 57AA   00C8
        CMP@    R5,     R0                      ; 57AB   0368
        BMI     L_57B0                          ; 57AC   020B 0002

        SUBI    #$0002, R0                      ; 57AE   0338 0002
L_57B0:
        TSTR    R0                              ; 57B0   0080
        BPL     L_57B4                          ; 57B1   0203 0001

        CLRR    R0                              ; 57B3   01C0
L_57B4:
        DECR    R4                              ; 57B4   0014
        MVO@    R0,     R4                      ; 57B5   0260
        MVO@    R1,     R4                      ; 57B6   0261
        MVO@    R2,     R4                      ; 57B7   0262
        PULR    R7                              ; 57B8   02B7

L_57B9:
        TSTR    R0                              ; 57B9   0080
        BMI     L_57C1                          ; 57BA   020B 0005

        CMPR    R1,     R0                      ; 57BC   0148
        BMI     L_57C0                          ; 57BD   020B 0001

        MOVR    R1,     R0                      ; 57BF   0088
L_57C0:
        MOVR    R5,     R7                      ; 57C0   00AF

L_57C1:
        NEGR    R0                              ; 57C1   0020
        CMPR    R1,     R0                      ; 57C2   0148
        BMI     L_57C6                          ; 57C3   020B 0001

        MOVR    R1,     R0                      ; 57C5   0088
L_57C6:
        NEGR    R0                              ; 57C6   0020
        MOVR    R5,     R7                      ; 57C7   00AF

L_57C8:
        PSHR    R5                              ; 57C8   0275
        MOVR    R1,     R2                      ; 57C9   008A

        JSR     R5,     L_58AB                  ; 57CA   0004 0158 00AB

        CLRR    R5                              ; 57CD   01ED
        CLRR    R3                              ; 57CE   01DB
        ADDI    #$015F, R2                      ; 57CF   02FA 015F
        ADD@    R2,     R7                      ; 57D1   02D7
        B       L_5806                          ; 57D2   0200 0032

        MVI@    R4,     R2                      ; 57D4   02A2
        ADDI    #$0007, R4                      ; 57D5   02FC 0007
        SDBD                                    ; 57D7   0001
        MVI@    R4,     R3                      ; 57D8   02A3
        CMPI    #$0040, R2                      ; 57D9   037A 0040
        BMI     L_57F5                          ; 57DB   020B 0018

        NEGR    R2                              ; 57DD   0022
        ADDI    #$0080, R2                      ; 57DE   02FA 0080
        XORI    #$0200, R3                      ; 57E0   03FB 0200
        INCR    R5                              ; 57E2   000D
        TSTR    R2                              ; 57E3   0092
        BPL     L_57F5                          ; 57E4   0203 000F

        NEGR    R2                              ; 57E6   0022
        SDBD                                    ; 57E7   0001
        XORI    #$0400, R3                      ; 57E8   03FB 0000 0004
        CMPI    #$0040, R2                      ; 57EB   037A 0040
        BMI     L_57F5                          ; 57ED   020B 0006

        NEGR    R2                              ; 57EF   0022
        ADDI    #$0080, R2                      ; 57F0   02FA 0080
        XORI    #$0200, R3                      ; 57F2   03FB 0200
        CLRR    R5                              ; 57F4   01ED
L_57F5:
        ADDI    #$0004, R2                      ; 57F5   02FA 0004
        SAR     R2,     2                       ; 57F7   006E
        SAR     R2,     1                       ; 57F8   006A
        SLL     R2,     1                       ; 57F9   004A
        XORR    R5,     R2                      ; 57FA   01EA
        MOVR    R7,     R5                      ; 57FB   00BD
        SUBI    #$019B, R5                      ; 57FC   033D 019B
        CMPI    #$0010, R2                      ; 57FE   037A 0010
        BMI     L_5806                          ; 5800   020B 0004

        SUBI    #$0010, R2                      ; 5802   033A 0010
        ADDI    #$0011, R5                      ; 5804   02FD 0011
L_5806:
        SLL     R1,     1                       ; 5806   0049
        SDBD                                    ; 5807   0001
        ADDI    #$0039, R1                      ; 5808   02F9 0039 0000
        MOVR    R1,     R4                      ; 580B   008C
        MVI@    R1,     R0                      ; 580C   0288
        SWAP    R0,     1                       ; 580D   0040
        MVO     R0,     G_0193                  ; 580E   0240 0193
        NOP                                     ; 5810   0034
L_5811:
        MVO@    R3,     R4                      ; 5811   0263
        MVO@    R5,     R4                      ; 5812   0265
        ADDI    #$0003, R4                      ; 5813   02FC 0003
        MVO@    R2,     R4                      ; 5815   0262
        ADDI    #$0002, R4                      ; 5816   02FC 0002
        XORI    #$0001, R2                      ; 5818   03FA 0001
        MOVR    R4,     R0                      ; 581A   00A0
        SUBR    R1,     R0                      ; 581B   0108
        CMPI    #$0010, R0                      ; 581C   0378 0010
        BNEQ    L_5824                          ; 581E   020C 0004

        SDBD                                    ; 5820   0001
        ANDI    #$FFE8, R3                      ; 5821   03BB 00E8 00FF
L_5824:
        CMPI    #$0020, R0                      ; 5824   0378 0020
        BNEQ    L_5811                          ; 5826   022C 0016

        MVI     G_0192, R0                      ; 5828   0280 0192
        SLL     R0,     2                       ; 582A   004C
        SWAP    R3,     1                       ; 582B   0043
        XOR     G_0193, R3                      ; 582C   03C3 0193
        ANDI    #$0006, R3                      ; 582E   03BB 0006
        BEQ     L_5835                          ; 5830   0204 0003

        JSR     R5,     .EXEC.41C               ; 5832   0004 0114 001C

L_5835:
        PULR    R7                              ; 5835   02B7

L_5836:
        JSR     R5,     X_PLAY_SFX1             ; 5836   0004 0118 03BB
        DECLE   $0079                           ; 5839  SFX data
        DECLE   $01CD                           ; 583A  SFX data
        DECLE   $03F5                           ; 583B  SFX data
        DECLE   $03FE                           ; 583C  SFX data
        DECLE   $008F,  $002C                   ; 583D  SFX data
        DECLE   $00CF                           ; 583F  SFX end


        INCR    R7                              ; 5840   000F

L_5841:
        PSHR    R5                              ; 5841   0275

L_5842:
        JSR     R5,     X_PLAY_SFX1             ; 5842   0004 0118 03BB
        DECLE   $0309                           ; 5845  SFX data
        DECLE   $000C,  $0040                   ; 5846  SFX data
        DECLE   $020D                           ; 5848  SFX data
        DECLE   $001D                           ; 5849  SFX data
        DECLE   $0080,  $0058                   ; 584A  SFX data
        DECLE   $0088,  $0078                   ; 584C  SFX data
        DECLE   $0044,  $0180                   ; 584E  SFX data
        DECLE   $0061,  $0018                   ; 5850  SFX data
        DECLE   $0081,  $0022                   ; 5852  SFX data
        DECLE   $0001,  $0181                   ; 5854  SFX data
        DECLE   $0077,  $0063,  $0058           ; 5856  SFX data
        DECLE   $020B                           ; 5859  SFX data
        DECLE   $00EB                           ; 585A  SFX data
        DECLE   $03A1,  $03E8                   ; 585B  SFX data
        DECLE   $0381,  $03E2                   ; 585D  SFX data
        DECLE   $0001,  $0281                   ; 585F  SFX data
        DECLE   $0083,  $039C                   ; 5861  SFX data
UC_5863:
        MVI     G_015B, R0                      ; 5863  SLIB UCALL target
        NEGR    R0                              ; 5865   0020
        ADDI    #$0060, R0                      ; 5866   02F8 0060
        ADDI    #$0003, R3                      ; 5868   02FB 0003
        MVO@    R0,     R3                      ; 586A   0258
        MVI     G_015C, R0                      ; 586B   0280 015C
        ADDI    #$0008, R3                      ; 586D   02FB 0008
        MVO@    R0,     R3                      ; 586F   0258
        INCR    R3                              ; 5870   000B
        MVO@    R0,     R3                      ; 5871   0258
        PULR    R7                              ; 5872   02B7

L_5873:
        PSHR    R5                              ; 5873   0275

        JSR     R5,     X_PLAY_SFX1             ; 5874   0004 0118 03BB
        DECLE   $0079                           ; 5877  SFX data
        DECLE   $03B7                           ; 5878  SFX data
        DECLE   $004C,  $0000                   ; 5879  SFX data
        DECLE   $03ED                           ; 587B  SFX data
        DECLE   $000B                           ; 587C  SFX data
        DECLE   $012B                           ; 587D  SFX data
        DECLE   $008C,  $0000                   ; 587E  SFX data
        DECLE   $008F,  $0017                   ; 5880  SFX data
        DECLE   $00CF                           ; 5882  SFX end


        CLRR    R0                              ; 5883   01C0
        MVO     R0,     G_015B                  ; 5884   0240 015B
        MVO     R0,     G_015C                  ; 5886   0240 015C
        B       L_5842                          ; 5888   0220 0047

L_588A:
        PSHR    R5                              ; 588A   0275
        PSHR    R2                              ; 588B   0272
        MVI@    R4,     R2                      ; 588C   02A2
        MVI@    R4,     R1                      ; 588D   02A1
        MOVR    R2,     R0                      ; 588E   0090

        JSR     R5,     L_58E5                  ; 588F   0004 0158 00E5
        JSR     R5,     L_591E                  ; 5892   0004 0158 011E
        JSR     R5,     X_EXT_SIGN_HI           ; 5895   0004 0114 0269

        NEGR    R0                              ; 5898   0020
        PSHR    R0                              ; 5899   0270
        MOVR    R2,     R0                      ; 589A   0090

        JSR     R5,     L_58D7                  ; 589B   0004 0158 00D7
        JSR     R5,     L_591E                  ; 589E   0004 0158 011E
        JSR     R5,     X_EXT_SIGN_HI           ; 58A1   0004 0114 0269

        PSHR    R0                              ; 58A4   0270
        SLL     R0,     2                       ; 58A5   004C
        ADD@    R6,     R0                      ; 58A6   02F0
        SAR     R0,     2                       ; 58A7   006C
        PULR    R1                              ; 58A8   02B1
        PULR    R2                              ; 58A9   02B2
        PULR    R7                              ; 58AA   02B7

L_58AB:
        SLL     R1,     2                       ; 58AB   004D
        SLL     R1,     2                       ; 58AC   004D
        ADDI    #$0172, R1                      ; 58AD   02F9 0172
        MOVR    R1,     R4                      ; 58AF   008C
        MOVR    R5,     R7                      ; 58B0   00AF

        SLL     R1,     2                       ; 58B1   004D
        SLL     R1,     2                       ; 58B2   004D
        SLL     R1,     1                       ; 58B3   0049
        ADDI    #$031D, R1                      ; 58B4   02F9 031D
        MOVR    R1,     R4                      ; 58B6   008C
        MOVR    R5,     R7                      ; 58B7   00AF

L_58B8:
        MVII    #$0004, R4                      ; 58B8   02BC 0004
        PSHR    R1                              ; 58BA   0271
L_58BB:
        MOVR    R0,     R1                      ; 58BB   0081
        SWAP    R1,     1                       ; 58BC   0041
        ADD@    R2,     R1                      ; 58BD   02D1
        MVO@    R1,     R2                      ; 58BE   0251
        ADDI    #$0008, R2                      ; 58BF   02FA 0008
        DECR    R4                              ; 58C1   0014
        BNEQ    L_58BB                          ; 58C2   022C 0008

        PULR    R1                              ; 58C4   02B1
        MOVR    R5,     R7                      ; 58C5   00AF

L_58C6:
        PSHR    R5                              ; 58C6   0275
        PSHR    R0                              ; 58C7   0270
        PSHR    R1                              ; 58C8   0271

        JSR     R5,     X_PACK_BYTES            ; 58C9   0004 0114 034F

        MVII    #$0004, R5                      ; 58CC   02BD 0004
L_58CE:
        MVO@    R0,     R2                      ; 58CE   0250
        ADDI    #$0008, R2                      ; 58CF   02FA 0008
        DECR    R5                              ; 58D1   0015
        BNEQ    L_58CE                          ; 58D2   022C 0005

        PULR    R1                              ; 58D4   02B1
        PULR    R0                              ; 58D5   02B0
        PULR    R7                              ; 58D6   02B7

L_58D7:
        SUBI    #$0040, R0                      ; 58D7   0338 0040
        BMI     L_58E2                          ; 58D9   020B 0007

        CMPI    #$0080, R0                      ; 58DB   0378 0080
        BMI     L_58EB                          ; 58DD   020B 000C

        SUBI    #$0080, R0                      ; 58DF   0338 0080
        INCR    R7                              ; 58E1   000F

L_58E2:
        NEGR    R0                              ; 58E2   0020
L_58E3:
        B       L_58F1                          ; 58E3   0200 000C

L_58E5:
        CMPI    #$0080, R0                      ; 58E5   0378 0080
        BMI     L_58F1                          ; 58E7   020B 0008

        SUBI    #$0080, R0                      ; 58E9   0338 0080
L_58EB:
        PSHR    R5                              ; 58EB   0275

        JSR     R5,     L_58F1                  ; 58EC   0004 0158 00F1

        NEGR    R0                              ; 58EF   0020
        PULR    R7                              ; 58F0   02B7

L_58F1:
        PSHR    R1                              ; 58F1   0271
        MOVR    R0,     R1                      ; 58F2   0081
        CMPI    #$0040, R1                      ; 58F3   0379 0040
        BMI     L_58FA                          ; 58F5   020B 0003

        SUBI    #$0080, R1                      ; 58F7   0339 0080
        NEGR    R1                              ; 58F9   0021
L_58FA:
        SAR     R1,     2                       ; 58FA   006D
        ADDR    R7,     R1                      ; 58FB   00F9
        ADDI    #$0005, R1                      ; 58FC   02F9 0005
        MVI@    R1,     R0                      ; 58FE   0288
        PULR    R1                              ; 58FF   02B1
        MOVR    R5,     R7                      ; 5900   00AF

        DECLE   $0000,  $0019,  $0032,  $004A   ; 5901   0000 0019 0032 004A
        DECLE   $0062,  $0079,  $008E,  $00A2   ; 5905   0062 0079 008E 00A2
        DECLE   $00B5,  $00C6,  $00D5,  $00E2   ; 5909   00B5 00C6 00D5 00E2
        DECLE   $00ED,  $00F5,  $00FB,  $00FF   ; 590D   00ED 00F5 00FB 00FF

        SUBR    R0,     R0                      ; 5911   0100
L_5912:
        CMPI    #$0080, R0                      ; 5912   0378 0080
        BMI     L_5918                          ; 5914   020B 0002

        SUBI    #$0100, R0                      ; 5916   0338 0100
L_5918:
        CMPI    #$0080, R1                      ; 5918   0379 0080
        BMI     L_591E                          ; 591A   020B 0002

        SUBI    #$0100, R1                      ; 591C   0339 0100
L_591E:
        PSHR    R5                              ; 591E   0275
        PSHR    R1                              ; 591F   0271
        PSHR    R3                              ; 5920   0273
        MOVR    R0,     R3                      ; 5921   0083
        CLRR    R0                              ; 5922   01C0
        TSTR    R1                              ; 5923   0089
        BPL     L_592C                          ; 5924   0203 0006

        NEGR    R1                              ; 5926   0021
        NEGR    R3                              ; 5927   0023
        B       L_592C                          ; 5928   0200 0002

L_592A:
        ADDR    R3,     R0                      ; 592A   00D8
L_592B:
        SLL     R3,     1                       ; 592B   004B
L_592C:
        SARC    R1,     1                       ; 592C   0079
        BC      L_592A                          ; 592D   0221 0004
        BNEQ    L_592B                          ; 592F   022C 0005

        PULR    R3                              ; 5931   02B3
        PULR    R1                              ; 5932   02B1
        TSTR    R0                              ; 5933   0080
        PULR    R7                              ; 5934   02B7

L_5935:
        PSHR    R5                              ; 5935   0275
        MVII    #$0200, R4                      ; 5936   02BC 0200
        MVI     G_0196, R0                      ; 5938   0280 0196
        MVI     G_0197, R1                      ; 593A   0281 0197
        CLRR    R3                              ; 593C   01DB
        INCR    R2                              ; 593D   000A
        ADDR    R7,     R2                      ; 593E   00FA
        ADD@    R2,     R7                      ; 593F   02D7

        DECLE   $0004                           ; 5940   0004

        INCR    R1                              ; 5941   0009
        DECR    R2                              ; 5942   0012
        COMR    R0                              ; 5943   0018
        ADDI    #$0002, R0                      ; 5944   02F8 0002
        MVII    #$0013, R3                      ; 5946   02BB 0013
        ADDR    R3,     R4                      ; 5948   00DC
        DECR    R0                              ; 5949   0010
        MVO     R0,     G_0196                  ; 594A   0240 0196
        ADDR    R3,     R0                      ; 594C   00D8
        MVII    #$000D, R3                      ; 594D   02BB 000D
        CLRR    R5                              ; 594F   01ED
        B       L_5962                          ; 5950   0200 0010

        ADDI    #$0002, R1                      ; 5952   02F9 0002
        ADDI    #$00DC, R4                      ; 5954   02FC 00DC
        MVII    #$000B, R3                      ; 5956   02BB 000B
        DECR    R1                              ; 5958   0011
        MVO     R1,     G_0197                  ; 5959   0241 0197
        ADDR    R3,     R1                      ; 595B   00D9
        INCR    R7                              ; 595C   000F

L_595D:
        PSHR    R5                              ; 595D   0275
L_595E:
        MVII    #$0015, R3                      ; 595E   02BB 0015
        MVII    #$0008, R5                      ; 5960   02BD 0008
L_5962:
        MVO     R5,     G_0198                  ; 5962   0245 0198
        B       L_5A16                          ; 5964   0200 00B0

L_5966:
        PSHR    R0                              ; 5966   0270
        PSHR    R1                              ; 5967   0271
        ANDI    #$000F, R0                      ; 5968   03B8 000F
        ANDI    #$000F, R1                      ; 596A   03B9 000F
        PSHR    R3                              ; 596C   0273
        PSHR    R4                              ; 596D   0274
        MOVR    R1,     R4                      ; 596E   008C
        SUBR    R0,     R4                      ; 596F   0104
        ADDI    #$000F, R4                      ; 5970   02FC 000F
        ADDR    R0,     R1                      ; 5972   00C1
        MVI     G_0199, R3                      ; 5973   0283 0199
        SARC    R3,     1                       ; 5975   007B
        BNC     L_597E                          ; 5976   0209 0006

        MVII    #$0018, R5                      ; 5978   02BD 0018
        CMPI    #$001A, R1                      ; 597A   0379 001A
        BGT     L_59D7                          ; 597C   020E 0059

L_597E:
        SARC    R3,     1                       ; 597E   007B
        BNC     L_5987                          ; 597F   0209 0006

        MVII    #$0010, R5                      ; 5981   02BD 0010
        CMPI    #$001A, R4                      ; 5983   037C 001A
        BPL     L_59D4                          ; 5985   0203 004D

L_5987:
        SARC    R3,     1                       ; 5987   007B
        BNC     L_5990                          ; 5988   0209 0006

        MVII    #$0008, R5                      ; 598A   02BD 0008
        CMPI    #$0005, R4                      ; 598C   037C 0005
        BMI     L_59DE                          ; 598E   020B 004E

L_5990:
        SARC    R3,     1                       ; 5990   007B
        BNC     L_5998                          ; 5991   0209 0005

        CLRR    R5                              ; 5993   01ED
        CMPI    #$0005, R1                      ; 5994   0379 0005
        BMI     L_59E1                          ; 5996   020B 0049

L_5998:
        CMPI    #$00C8, R2                      ; 5998   037A 00C8
        BMI     L_59B4                          ; 599A   020B 0018

        MVI@    R2,     R3                      ; 599C   0293
        SARC    R0,     1                       ; 599D   0078
        BC      L_59A3                          ; 599E   0201 0003

        SLR     R3,     2                       ; 59A0   0067
        SLR     R3,     2                       ; 59A1   0067
        SLR     R3,     1                       ; 59A2   0063
L_59A3:
        ANDI    #$001F, R3                      ; 59A3   03BB 001F
        CMPI    #$0008, R3                      ; 59A5   037B 0008
        BMI     L_59AB                          ; 59A7   020B 0002

        ADD     G_019A, R3                      ; 59A9   02C3 019A
L_59AB:
        SLL     R3,     1                       ; 59AB   004B
        MOVR    R3,     R4                      ; 59AC   009C
        ADDR    R7,     R4                      ; 59AD   00FC
        ADDI    #$00F8, R4                      ; 59AE   02FC 00F8
        SDBD                                    ; 59B0   0001
        MVI@    R4,     R5                      ; 59B1   02A5
        ADDI    #$0049, R7                      ; 59B2   02FF 0049

L_59B4:
        MVII    #$00A2, R3                      ; 59B4   02BB 00A2
        SWAP    R3,     1                       ; 59B6   0043
        SUBR    R0,     R1                      ; 59B7   0101
        BEQ     L_59D1                          ; 59B8   0204 0017

        TSTR    R0                              ; 59BA   0080
        BEQ     L_59D1                          ; 59BB   0204 0014

        MVI     G_019B, R0                      ; 59BD   0280 019B
        DECR    R0                              ; 59BF   0010
        BPL     L_59CF                          ; 59C0   0203 000D

        SDBD                                    ; 59C2   0001
        MVII    #$EA1C, R3                      ; 59C3   02BB 001C 00EA
        MVII    #$0003, R0                      ; 59C6   02B8 0003

        JSR     R5,     X_RAND1                 ; 59C8   0004 0114 027D
        DECLE   $0078,  $002F                   ; 59CB   0078 002F

        ADDI    #$0008, R3                      ; 59CD   02FB 0008
L_59CF:
        MVO     R0,     G_019B                  ; 59CF   0240 019B
L_59D1:
        MOVR    R3,     R5                      ; 59D1   009D
        ADDI    #$0029, R7                      ; 59D2   02FF 0029

L_59D4:
        XORR    R1,     R4                      ; 59D4   01CC
        XORR    R4,     R1                      ; 59D5   01E1
        XORR    R1,     R4                      ; 59D6   01CC
L_59D7:
        NEGR    R1                              ; 59D7   0021
        ADDI    #$001E, R1                      ; 59D8   02F9 001E
        SUBI    #$000D, R4                      ; 59DA   033C 000D
        B       L_59E4                          ; 59DC   0200 0006

L_59DE:
        XORR    R1,     R4                      ; 59DE   01CC
        XORR    R4,     R1                      ; 59DF   01E1
        XORR    R1,     R4                      ; 59E0   01CC
L_59E1:
        NEGR    R4                              ; 59E1   0024
        ADDI    #$0011, R4                      ; 59E2   02FC 0011
L_59E4:
        MVII    #$0010, R3                      ; 59E4   02BB 0010
        SWAP    R3,     1                       ; 59E6   0043
        CMPI    #$0001, R1                      ; 59E7   0379 0001
        BLE     L_59D1                          ; 59E9   0226 0019

        MVII    #$00A2, R3                      ; 59EB   02BB 00A2
        SWAP    R3,     1                       ; 59ED   0043
        CMPI    #$0004, R1                      ; 59EE   0379 0004
        BPL     L_59D1                          ; 59F0   0223 0020

        TSTR    R4                              ; 59F2   00A4
        BMI     L_59D1                          ; 59F3   022B 0023

        ADDR    R7,     R4                      ; 59F5   00FC
        ADDI    #$00AA, R4                      ; 59F6   02FC 00AA
        ADD@    R4,     R5                      ; 59F8   02E5
        SDBD                                    ; 59F9   0001
        XORI    #$1805, R5                      ; 59FA   03FD 0005 0018
L_59FD:
        PULR    R4                              ; 59FD   02B4
        PULR    R3                              ; 59FE   02B3
        PULR    R1                              ; 59FF   02B1
        PULR    R0                              ; 5A00   02B0
        MVO@    R5,     R4                      ; 5A01   0265
        ADD     G_0198, R7                      ; 5A02   02C7 0198

        ADDI    #$0008, R2                      ; 5A04   02FA 0008
        ADDI    #$0013, R4                      ; 5A06   02FC 0013
        INCR    R1                              ; 5A08   0009
        MOVR    R1,     R5                      ; 5A09   008D
        ADDI    #$0006, R7                      ; 5A0A   02FF 0006

        MOVR    R0,     R5                      ; 5A0C   0085
        ANDI    #$0001, R5                      ; 5A0D   03BD 0001
        ADDR    R5,     R2                      ; 5A0F   00EA
        INCR    R0                              ; 5A10   0008
        MOVR    R0,     R5                      ; 5A11   0085
L_5A12:
        ANDI    #$000F, R5                      ; 5A12   03BD 000F
        BNEQ    L_5A19                          ; 5A14   020C 0003

L_5A16:
        JSR     R5,     L_5A1D                  ; 5A16   0004 0158 021D

L_5A19:
        DECR    R3                              ; 5A19   0013
        BNEQ    L_5966                          ; 5A1A   022C 00B5
        PULR    R7                              ; 5A1C   02B7

L_5A1D:
        PSHR    R5                              ; 5A1D   0275
        ANDI    #$00FF, R0                      ; 5A1E   03B8 00FF
        PSHR    R0                              ; 5A20   0270
        PSHR    R3                              ; 5A21   0273
        ANDI    #$00FF, R1                      ; 5A22   03B9 00FF
        PSHR    R1                              ; 5A24   0271
        PSHR    R4                              ; 5A25   0274
        MOVR    R0,     R2                      ; 5A26   0082
        SLR     R2,     2                       ; 5A27   0066
        SLR     R2,     2                       ; 5A28   0066
        MOVR    R1,     R3                      ; 5A29   008B
        SLR     R3,     1                       ; 5A2A   0063
        ANDI    #$00F8, R3                      ; 5A2B   03BB 00F8
        MOVR    R2,     R4                      ; 5A2D   0094
        ANDI    #$0001, R4                      ; 5A2E   03BC 0001
        SLR     R2,     1                       ; 5A30   0062
        ADDR    R3,     R2                      ; 5A31   00DA
        ANDI    #$000F, R0                      ; 5A32   03B8 000F
        ANDI    #$000F, R1                      ; 5A34   03B9 000F
        SLL     R1,     2                       ; 5A36   004D
        SLL     R1,     1                       ; 5A37   0049
        SLR     R0,     1                       ; 5A38   0060
        ADDR    R0,     R1                      ; 5A39   00C1
        PSHR    R1                              ; 5A3A   0271

        JSR     R5,     L_5A4F                  ; 5A3B   0004 0158 024F
        JSR     R5,     L_5A7F                  ; 5A3E   0004 0158 027F

        ANDR    R0,     R1                      ; 5A41   0181
        MVO     R1,     G_0199                  ; 5A42   0241 0199
        SLR     R0,     2                       ; 5A44   0064
        MOVR    R5,     R2                      ; 5A45   00AA
        SLR     R0,     2                       ; 5A46   0064
        MVO     R0,     G_019A                  ; 5A47   0240 019A
        ADD@    R6,     R2                      ; 5A49   02F2
        PULR    R4                              ; 5A4A   02B4
        PULR    R1                              ; 5A4B   02B1
        PULR    R3                              ; 5A4C   02B3
        PULR    R0                              ; 5A4D   02B0
        PULR    R7                              ; 5A4E   02B7

L_5A4F:
        PSHR    R5                              ; 5A4F   0275
        DECR    R2                              ; 5A50   0012
        ADDR    R4,     R2                      ; 5A51   00E2
        XORI    #$0001, R4                      ; 5A52   03FC 0001

        JSR     R5,     L_5A7F                  ; 5A54   0004 0158 027F

        SLL     R0,     1                       ; 5A57   0048
        ANDI    #$000A, R0                      ; 5A58   03B8 000A
        COMR    R0                              ; 5A5A   0018
        MOVR    R0,     R1                      ; 5A5B   0081
        INCR    R2                              ; 5A5C   000A

        JSR     R5,     L_5A7F                  ; 5A5D   0004 0158 027F

        SLR     R0,     1                       ; 5A60   0060
        ANDI    #$0005, R0                      ; 5A61   03B8 0005
        COMR    R0                              ; 5A63   0018
        ANDR    R0,     R1                      ; 5A64   0181
        XORI    #$0001, R4                      ; 5A65   03FC 0001
        SUBR    R4,     R2                      ; 5A67   0122
        SUBI    #$0008, R2                      ; 5A68   033A 0008

        JSR     R5,     L_5A7F                  ; 5A6A   0004 0158 027F

        SLL     R0,     2                       ; 5A6D   004C
        ANDI    #$000C, R0                      ; 5A6E   03B8 000C
        COMR    R0                              ; 5A70   0018
        ANDR    R0,     R1                      ; 5A71   0181
        ADDI    #$0010, R2                      ; 5A72   02FA 0010

        JSR     R5,     L_5A7F                  ; 5A74   0004 0158 027F

        SLR     R0,     2                       ; 5A77   0064
        ANDI    #$0003, R0                      ; 5A78   03B8 0003
        COMR    R0                              ; 5A7A   0018
        ANDR    R0,     R1                      ; 5A7B   0181
        SUBI    #$0008, R2                      ; 5A7C   033A 0008
        PULR    R7                              ; 5A7E   02B7

L_5A7F:
        PSHR    R5                              ; 5A7F   0275
        MOVR    R2,     R5                      ; 5A80   0095
        ANDI    #$007F, R5                      ; 5A81   03BD 007F
        ADDR    R7,     R5                      ; 5A83   00FD
        ADDI    #$007F, R5                      ; 5A84   02FD 007F
        MVI@    R5,     R0                      ; 5A86   02A8
        TSTR    R4                              ; 5A87   00A4
        BNEQ    L_5A8C                          ; 5A88   020C 0002

        SLR     R0,     2                       ; 5A8A   0064
        SLR     R0,     2                       ; 5A8B   0064
L_5A8C:
        ANDI    #$000F, R0                      ; 5A8C   03B8 000F
        MOVR    R0,     R5                      ; 5A8E   0085
        ADDR    R7,     R5                      ; 5A8F   00FD
        ADDI    #$006C, R5                      ; 5A90   02FD 006C
        MVI@    R5,     R5                      ; 5A92   02AD
        SLL     R0,     2                       ; 5A93   004C
        SLL     R0,     2                       ; 5A94   004C
        SLL     R0,     2                       ; 5A95   004C
        SLL     R0,     1                       ; 5A96   0048
        BEQ     L_5A9C                          ; 5A97   0204 0003

        ADDR    R7,     R0                      ; 5A99   00F8
        ADDI    #$0069, R0                      ; 5A9A   02F8 0069
L_5A9C:
        XORR    R0,     R5                      ; 5A9C   01C5
        XORR    R5,     R0                      ; 5A9D   01E8
        XORR    R0,     R5                      ; 5A9E   01C5
        PULR    R7                              ; 5A9F   02B7

        DECLE   $0038,  $0098,  $0078,  $0098   ; 5AA0   0038 0098 0078 0098
        DECLE   $0078,  $0098,  $0000,  $0090   ; 5AA4   0078 0098 0000 0090
        DECLE   $0038,  $00AB,  $001C,  $00EA   ; 5AA8   0038 00AB 001C 00EA
        DECLE   $0024,  $00EA,  $002C,  $00C8   ; 5AAC   0024 00EA 002C 00C8
        DECLE   $0038,  $00A9,  $005C,  $00AA   ; 5AB0   0038 00A9 005C 00AA
        DECLE   $0074,  $00AA,  $000D,  $00BA   ; 5AB4   0074 00AA 000D 00BA
        DECLE   $0015,  $00BA,  $00C5,  $0018   ; 5AB8   0015 00BA 00C5 0018
        DECLE   $00D5,  $0018,  $0005,  $0019   ; 5ABC   00D5 0018 0005 0019
        DECLE   $002D,  $0019,  $0035,  $0019   ; 5AC0   002D 0019 0035 0019
        DECLE   $0085,  $0018,  $0095,  $0018   ; 5AC4   0085 0018 0095 0018
        DECLE   $00A5,  $0018,  $00B5,  $0018   ; 5AC8   00A5 0018 00B5 0018
        DECLE   $0005                           ; 5ACC   0005

        MOVR    R7,     R2                      ; 5ACD   00BA
        DECR    R3                              ; 5ACE   0013
        ADDR    R5,     R5                      ; 5ACF   00ED
        SLLC    R1,     2                       ; 5AD0   005D
        COMR    R0                              ; 5AD1   0018
        SAR     R1,     2                       ; 5AD2   006D
        COMR    R0                              ; 5AD3   0018
        SLR     R3,     1                       ; 5AD4   0063
        ADDR    R3,     R6                      ; 5AD5   00DE
        SARC    R0,     1                       ; 5AD6   0078
        ADDR    R2,     R6                      ; 5AD7   00D6
        SAR     R3,     1                       ; 5AD8   006B
        ADDR    R3,     R6                      ; 5AD9   00DE
        RSWD    R0                              ; 5ADA   0038
        ADDR    R3,     R7                      ; 5ADB   00DF

        INCR    R3                              ; 5ADC   000B
        ADDR    R1,     R1                      ; 5ADD   00C9
        ADDR    R3,     R5                      ; 5ADE   00DD
        COMR    R0                              ; 5ADF   0018
        ADDR    R4,     R5                      ; 5AE0   00E5
        COMR    R0                              ; 5AE1   0018
        ADDR    R5,     R5                      ; 5AE2   00ED
        COMR    R0                              ; 5AE3   0018
        ADDR    R6,     R5                      ; 5AE4   00F5
        COMR    R0                              ; 5AE5   0018
        SLR     R1,     2                       ; 5AE6   0065
        COMR    R0                              ; 5AE7   0018
        RRC     R1,     2                       ; 5AE8   0075
        COMR    R0                              ; 5AE9   0018
        SARC    R1,     2                       ; 5AEA   007D
        COMR    R0                              ; 5AEB   0018
        MOVR    R1,     R5                      ; 5AEC   008D
        COMR    R0                              ; 5AED   0018
        MOVR    R3,     R5                      ; 5AEE   009D
        COMR    R0                              ; 5AEF   0018
        TSTR    R5                              ; 5AF0   00AD
        COMR    R0                              ; 5AF1   0018
        MOVR    R7,     R5                      ; 5AF2   00BD
        COMR    R0                              ; 5AF3   0018
        ADDR    R1,     R5                      ; 5AF4   00CD
        COMR    R0                              ; 5AF5   0018
        ADDR    R7,     R5                      ; 5AF6   00FD
        COMR    R0                              ; 5AF7   0018
        COMR    R5                              ; 5AF8   001D
        COMR    R1                              ; 5AF9   0019
        NEGR    R5                              ; 5AFA   0025
        COMR    R1                              ; 5AFB   0019
        INCR    R7                              ; 5AFC   000F

        INCR    R4                              ; 5AFD   000C
L_5AFE:
        INCR    R2                              ; 5AFE   000A
        DECLE   $0079,  $0076,  $00F5,  $000A   ; 5AFF   0079 0076 00F5 000A
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5B03   0000 0001 0000 0000
        DECLE   $0010,  $0000,  $0031,  $0010   ; 5B07   0010 0000 0031 0010
        DECLE   $0000,  $0030,  $0042,  $0043   ; 5B0B   0000 0030 0042 0043
        DECLE   $0063,  $0050,  $0030,  $0015   ; 5B0F   0063 0050 0030 0015
        DECLE   $0003,  $0020,  $0026,  $0003   ; 5B13   0003 0020 0026 0003
        DECLE   $0042,  $0003,  $0003,  $0000   ; 5B17   0042 0003 0003 0000
        DECLE   $0060,  $0000,  $0032,  $0031   ; 5B1B   0060 0000 0032 0031
        DECLE   $0023,  $0020,  $0031,  $0000   ; 5B1F   0023 0020 0031 0000
        DECLE   $0005,  $0003,  $0000,  $0030   ; 5B23   0005 0003 0000 0030
        DECLE   $0040,  $0022,  $0060,  $0040   ; 5B27   0040 0022 0060 0040
        DECLE   $0060,  $0030,  $0016,  $0011   ; 5B2B   0060 0030 0016 0011
        DECLE   $0004,  $0026,  $0015,  $0005   ; 5B2F   0004 0026 0015 0005
        DECLE   $0022,  $0003,  $0005,  $0000   ; 5B33   0022 0003 0005 0000
        DECLE   $0052,  $0020,  $0001,  $0030   ; 5B37   0052 0020 0001 0030
        DECLE   $0022,  $0060,  $0066,  $0003   ; 5B3B   0022 0060 0066 0003
        DECLE   $0003,  $0020,  $0031,  $0000   ; 5B3F   0003 0020 0031 0000
        DECLE   $0022,  $0005,  $0005,  $0060   ; 5B43   0022 0005 0005 0060
        DECLE   $0066,  $0022,  $0060,  $0040   ; 5B47   0066 0022 0060 0040
        DECLE   $0022,  $0061,  $0062,  $0005   ; 5B4B   0022 0061 0062 0005
        DECLE   $0005,  $0026,  $0015,  $0005   ; 5B4F   0005 0026 0015 0005
        DECLE   $0022,  $0000                   ; 5B53   0022 0000

        RLC     R0,     2                       ; 5B55   0054
        SLR     R1,     1                       ; 5B56   0061
        SLR     R1,     1                       ; 5B57   0061

        JSRE    R4,     .EXEC.030               ; 5B58   0004 0011 0030
        DECLE   $0060,  $0046,  $0010,  $0041   ; 5B5B   0060 0046 0010 0041
        DECLE   $0050,  $0050,  $0011,  $0010   ; 5B5F   0050 0050 0011 0010
        DECLE   $0005,  $0004                   ; 5B63   0005 0004

        JSRE    R4,     .EXEC.013               ; 5B65   0004 0011 0013
        DECLE   $0003,  $0011,  $0005,  $0062   ; 5B68   0003 0011 0005 0062
        DECLE   $0000,  $0040,  $0001,  $0011   ; 5B6C   0000 0040 0001 0011
        DECLE   $0030,  $0011,  $0030,  $0004   ; 5B70   0030 0011 0030 0004
        DECLE   $0001,  $0020,  $0031,  $0011   ; 5B74   0001 0020 0031 0011
        DECLE   $0003,  $0001,  $0010,  $0005   ; 5B78   0003 0001 0010 0005
        DECLE   $0041,  $0036,  $0011,  $0011   ; 5B7C   0041 0036 0011 0011
        DECLE   $0036,  $0040,  $0000,  $0021   ; 5B80   0036 0040 0000 0021
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5B84   0021 0021 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0029   ; 5B88   0021 0021 0021 0029
        DECLE   $0101,  $0021,  $0021,  $0021   ; 5B8C   0101 0021 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0273   ; 5B90   0021 0021 0021 0273
        DECLE   $0268,  $0021,  $0022,  $0066   ; 5B94   0268 0021 0022 0066
        DECLE   $00A5,  $0083,  $0029,  $0021   ; 5B98   00A5 0083 0029 0021
        DECLE   $0129,  $0021,  $0066,  $00B7   ; 5B9C   0129 0021 0066 00B7
        DECLE   $0358,  $00A2,  $0128,  $0023   ; 5BA0   0358 00A2 0128 0023
        DECLE   $0049,  $0023,  $0057,  $0359   ; 5BA4   0049 0023 0057 0359
        DECLE   $001A,  $00A1,  $0261,  $0023   ; 5BA8   001A 00A1 0261 0023
        DECLE   $0021,  $0021,  $0034,  $037B   ; 5BAC   0021 0021 0034 037B
        DECLE   $0377,  $00E9,  $0101,  $0021   ; 5BB0   0377 00E9 0101 0021
        DECLE   $00C4,  $00A5,  $0061,  $0061   ; 5BB4   00C4 00A5 0061 0061
        DECLE   $0021,  $0048,  $0041,  $0021   ; 5BB8   0021 0048 0041 0021
        DECLE   $02FA,  $0305,  $00A5,  $00A1   ; 5BBC   02FA 0305 00A5 00A1
        DECLE   $0021,  $0022,  $0022,  $0021   ; 5BC0   0021 0022 0022 0021
        DECLE   $0360,  $031A,  $0358,  $00A6   ; 5BC4   0360 031A 0358 00A6
        DECLE   $0084,  $0062,  $0021,  $0021   ; 5BC8   0084 0062 0021 0021
        DECLE   $0360,  $0000,  $001A,  $00B7   ; 5BCC   0360 0000 001A 00B7

        SUB     G_0061, R4                      ; 5BD0   0304 0061
        NEGR    R1                              ; 5BD2   0021
        NEGR    R1                              ; 5BD3   0021
        MVI@    R3,     R3                      ; 5BD4   029B
        CMPI    #$0377, R3                      ; 5BD5   037B 0377
        ADDR    R6,     R4                      ; 5BD7   00F4
        ADD@    R4,     R7                      ; 5BD8   02E7

        DECLE   $0021,  $0041,  $0022,  $0021   ; 5BD9   0021 0041 0022 0021
        DECLE   $0023,  $0041,  $0021,  $0021   ; 5BDD   0023 0041 0021 0021
        DECLE   $0022,  $0041,  $0021,  $0021   ; 5BE1   0022 0041 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5BE5   0021 0021 0021 0021
        DECLE   $0021,  $0021,  $0000,  $0000   ; 5BE9   0021 0021 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0021,  $0021   ; 5C01   0000 0000 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5C05   0021 0021 0021 0021
        DECLE   $0180,  $0000,  $0021,  $0046   ; 5C09   0180 0000 0021 0046
        DECLE   $00A5,  $00A2,  $0022,  $0061   ; 5C0D   00A5 00A2 0022 0061
        DECLE   $0180,  $0000,  $0021,  $0077   ; 5C11   0180 0000 0021 0077
        DECLE   $0358,  $00A1,  $0021,  $0041   ; 5C15   0358 00A1 0021 0041
        DECLE   $0180,  $0000,  $0021,  $003B   ; 5C19   0180 0000 0021 003B
        DECLE   $001A,  $00A4,  $00A1,  $0041   ; 5C1D   001A 00A4 00A1 0041
        DECLE   $0180,  $0000,  $0021,  $003B   ; 5C21   0180 0000 0021 003B
        DECLE   $0018,  $0358,  $0081,  $0021   ; 5C25   0018 0358 0081 0021
        DECLE   $0180,  $0000,  $0021,  $0034   ; 5C29   0180 0000 0021 0034
        DECLE   $037B,  $029A,  $00A3,  $0021   ; 5C2D   037B 029A 00A3 0021
        DECLE   $0180,  $0000                   ; 5C31   0180 0000

        NEGR    R1                              ; 5C33   0021
        SWAP    R1,     1                       ; 5C34   0041
        NEGR    R1                              ; 5C35   0021
        MVI@    R2,     R7                      ; 5C36   0297

        DECLE   $00E1,  $0041,  $0180,  $0000   ; 5C37   00E1 0041 0180 0000
        DECLE   $0021,  $0021,  $0022,  $0022   ; 5C3B   0021 0021 0022 0022
        DECLE   $0041,  $0021,  $0180,  $0000   ; 5C3F   0041 0021 0180 0000
        DECLE   $0022,  $0021,  $0063,  $0043   ; 5C43   0022 0021 0063 0043
        DECLE   $0022,  $0021,  $0180,  $0000   ; 5C47   0022 0021 0180 0000
        DECLE   $0021,  $0062,  $0061,  $0061   ; 5C4B   0021 0062 0061 0061
        DECLE   $0041,  $0021,  $0180,  $0000   ; 5C4F   0041 0021 0180 0000
        DECLE   $0021,  $0043,  $0026,  $00A5   ; 5C53   0021 0043 0026 00A5
        DECLE   $00A4,  $0041,  $0180,  $0000   ; 5C57   00A4 0041 0180 0000
        DECLE   $0021,  $0021,  $0037,  $035A   ; 5C5B   0021 0021 0037 035A
        DECLE   $0345,  $0021,  $0180,  $0000   ; 5C5F   0345 0021 0180 0000
        DECLE   $0021,  $0022,  $003B,  $033B   ; 5C63   0021 0022 003B 033B
        DECLE   $0367,  $0021,  $0180,  $0000   ; 5C67   0367 0021 0180 0000
        DECLE   $0021,  $0023,  $003B,  $0345   ; 5C6B   0021 0023 003B 0345
        DECLE   $00C4,  $00A1,  $0180,  $0000   ; 5C6F   00C4 00A1 0180 0000

        NEGR    R1                              ; 5C73   0021
        SLR     R1,     1                       ; 5C74   0061
        NOP                                     ; 5C75   0034
        ADD@    R4,     R7                      ; 5C76   02E7

        DECLE   $037A,  $00A1,  $0180,  $0000   ; 5C77   037A 00A1 0180 0000
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5C7B   0021 0021 0021 0021
        DECLE   $037A,  $00E1,  $0180,  $0000   ; 5C7F   037A 00E1 0180 0000
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5C83   0021 0021 0021 0021
        DECLE   $0021,  $002B,  $0120,  $0000   ; 5C87   0021 002B 0120 0000
        DECLE   $0066,  $0084,  $00A5,  $00A2   ; 5C8B   0066 0084 00A5 00A2
        DECLE   $0041,  $0169,  $0000,  $0000   ; 5C8F   0041 0169 0000 0000
        DECLE   $0030,  $0273,  $0271,  $0083   ; 5C93   0030 0273 0271 0083
        DECLE   $002B,  $0120,  $0000,  $0000   ; 5C97   002B 0120 0000 0000
        DECLE   $0074,  $0012,  $0290,  $00E1   ; 5C9B   0074 0012 0290 00E1
        DECLE   $0169,  $0000,  $0000,  $000E   ; 5C9F   0169 0000 0000 000E
        DECLE   $0034,  $0013,  $0083,  $002B   ; 5CA3   0034 0013 0083 002B
        DECLE   $0120,  $0000,  $0000,  $01C1   ; 5CA7   0120 0000 0000 01C1
        DECLE   $002D,  $0290,  $00E1,  $0169   ; 5CAB   002D 0290 00E1 0169
        DECLE   $0000,  $0000,  $000E,  $0021   ; 5CAF   0000 0000 000E 0021
        DECLE   $0021,  $0021,  $002B,  $0120   ; 5CB3   0021 0021 002B 0120
        DECLE   $0000,  $0000,  $01C1,  $0021   ; 5CB7   0000 0000 01C1 0021
        DECLE   $002C,  $0061,  $0038,  $0000   ; 5CBB   002C 0061 0038 0000
        DECLE   $0000,  $000E,  $0021,  $0041   ; 5CBF   0000 000E 0021 0041
        DECLE   $0062,  $0061,  $0340,  $0000   ; 5CC3   0062 0061 0340 0000
        DECLE   $0000,  $02A1,  $0023,  $0021   ; 5CC7   0000 02A1 0023 0021
        DECLE   $0043,  $003A,  $0000,  $0000   ; 5CCB   0043 003A 0000 0000
        DECLE   $001B,  $03A1,  $0021,  $0021   ; 5CCF   001B 03A1 0021 0021
        DECLE   $0021,  $0340,  $0000,  $0000   ; 5CD3   0021 0340 0000 0000
        DECLE   $037D,  $0021,  $0022,  $0041   ; 5CD7   037D 0021 0022 0041
        DECLE   $003A,  $0000,  $0000,  $001B   ; 5CDB   003A 0000 0000 001B
        DECLE   $03A1,  $00C5,  $00A4,  $00A1   ; 5CDF   03A1 00C5 00A4 00A1
        DECLE   $0340,  $0000,  $0000,  $037D   ; 5CE3   0340 0000 0000 037D
        DECLE   $0021,  $0273,  $0273,  $0081   ; 5CE7   0021 0273 0273 0081
        DECLE   $0000,  $0000,  $001B,  $03A1   ; 5CEB   0000 0000 001B 03A1
        DECLE   $0041,  $0294,  $0294,  $00E1   ; 5CEF   0041 0294 0294 00E1
        DECLE   $0000,  $0000,  $037D,  $0022   ; 5CF3   0000 0000 037D 0022
        DECLE   $0062,  $0041,  $0021,  $0021   ; 5CF7   0062 0041 0021 0021
        DECLE   $0000,  $001B,  $03A1,  $0023   ; 5CFB   0000 001B 03A1 0023
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5CFF   0021 0021 0021 0021
        DECLE   $0000,  $001C,  $03C1,  $0021   ; 5D03   0000 001C 03C1 0021
        DECLE   $0026,  $00A5,  $00A5,  $00A5   ; 5D07   0026 00A5 00A5 00A5
        DECLE   $0000,  $0000,  $039E,  $0023   ; 5D0B   0000 0000 039E 0023
        DECLE   $0050,  $0273,  $0273,  $0225   ; 5D0F   0050 0273 0273 0225
        DECLE   $0000,  $0000,  $001C,  $03C1   ; 5D13   0000 0000 001C 03C1
        DECLE   $004D,  $0294,  $028D,  $0264   ; 5D17   004D 0294 028D 0264
        DECLE   $0320,  $0000,  $0000,  $039E   ; 5D1B   0320 0000 0000 039E
        DECLE   $0022,  $0021,  $002D,  $0204   ; 5D1F   0022 0021 002D 0204
        DECLE   $0039,  $0000,  $0000,  $001C   ; 5D23   0039 0000 0000 001C
        DECLE   $03C1,  $0062,  $0021,  $0021   ; 5D27   03C1 0062 0021 0021
        DECLE   $0021,  $0320,  $0000,  $0000   ; 5D2B   0021 0320 0000 0000
        DECLE   $039E,  $0023,  $0021,  $0043   ; 5D2F   039E 0023 0021 0043
        DECLE   $0023,  $0039,  $0000,  $0000   ; 5D33   0023 0039 0000 0000
        DECLE   $001C,  $03C1,  $0021,  $0062   ; 5D37   001C 03C1 0021 0062
        DECLE   $0021,  $0041,  $0320,  $0000   ; 5D3B   0021 0041 0320 0000
        DECLE   $0000,  $02E1,  $0021,  $0023   ; 5D3F   0000 02E1 0021 0023
        DECLE   $0021,  $0062,  $0036,  $0000   ; 5D43   0021 0062 0036 0000
        DECLE   $0000                           ; 5D47   0000

        INCR    R7                              ; 5D48   000F

        NEGR    R1                              ; 5D49   0021
L_5D4A:
        SLR     R1,     1                       ; 5D4A   0061
        DECLE   $0022,  $00C5,  $00AA,  $0100   ; 5D4B   0022 00C5 00AA 0100
        DECLE   $0000,  $0000,  $01E1,  $0021   ; 5D4F   0000 0000 01E1 0021
        DECLE   $0062,  $0211,  $00A1,  $0148   ; 5D53   0062 0211 00A1 0148
        DECLE   $0000,  $0000                   ; 5D57   0000 0000

        INCR    R7                              ; 5D59   000F

        NEGR    R1                              ; 5D5A   0021
L_5D5B:
        NEGR    R1                              ; 5D5B   0021
        DECLE   $01B0,  $00E1,  $002A,  $0100   ; 5D5C   01B0 00E1 002A 0100
        DECLE   $0000,  $0000,  $01E1,  $0022   ; 5D60   0000 0000 01E1 0022
        DECLE   $00C5,  $00A4,  $00A5,  $0148   ; 5D64   00C5 00A4 00A5 0148
        DECLE   $0000,  $0000,  $000F,  $0023   ; 5D68   0000 0000 000F 0023
        DECLE   $0213,  $0273,  $0225,  $002A   ; 5D6C   0213 0273 0225 002A
        DECLE   $0100,  $0000,  $0000,  $0023   ; 5D70   0100 0000 0000 0023
        DECLE   $01B4,  $0294,  $0207,  $0061   ; 5D74   01B4 0294 0207 0061
        DECLE   $0148,  $0000,  $0000,  $0021   ; 5D78   0148 0000 0000 0021
        DECLE   $0062,  $0021,  $0021,  $0062   ; 5D7C   0062 0021 0021 0062
        DECLE   $002A,  $0100,  $0000,  $0000   ; 5D80   002A 0100 0000 0000
        DECLE   $0014,  $02C1,  $0021,  $0021   ; 5D84   0014 02C1 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0000   ; 5D88   0021 0021 0021 0000
        DECLE   $0000,  $0296,  $0021,  $0022   ; 5D8C   0000 0296 0021 0022
        DECLE   $0023,  $0043,  $0021,  $0000   ; 5D90   0023 0043 0021 0000
        DECLE   $0000,  $0014,  $02C1,  $0022   ; 5D94   0000 0014 02C1 0022
        DECLE   $0062,  $0061,  $0061,  $0220   ; 5D98   0062 0061 0061 0220
        DECLE   $0000,  $0000,  $0296,  $0021   ; 5D9C   0000 0000 0296 0021
        DECLE   $0061,  $0023,  $0021,  $0031   ; 5DA0   0061 0023 0021 0031
        DECLE   $0000,  $0000,  $0014,  $02C1   ; 5DA4   0000 0000 0014 02C1
        DECLE   $0021,  $0021,  $0041,  $0021   ; 5DA8   0021 0021 0041 0021
        DECLE   $0220,  $0000,  $0000,  $01E1   ; 5DAC   0220 0000 0000 01E1
        DECLE   $0021,  $0022,  $0061,  $0062   ; 5DB0   0021 0022 0061 0062
        DECLE   $002E,  $0000,  $0000,  $0018   ; 5DB4   002E 0000 0000 0018
        DECLE   $0021,  $0023,  $0043,  $0061   ; 5DB8   0021 0023 0043 0061
        DECLE   $003A,  $0000,  $0000,  $0019   ; 5DBC   003A 0000 0000 0019
        DECLE   $0021,  $0021,  $0061,  $0021   ; 5DC0   0021 0021 0061 0021
        DECLE   $003B,  $0000,  $0000,  $0019   ; 5DC4   003B 0000 0000 0019
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5DC8   0021 0021 0021 0021
        DECLE   $0030,  $0000,  $0000           ; 5DCC   0030 0000 0000
L_5DCF:
        DECR    R7                              ; 5DCF   0017

        DECLE   $0021,  $0021,  $0021,  $0041   ; 5DD0   0021 0021 0021 0041
        DECLE   $0240,  $0000,  $0000,  $01A1   ; 5DD4   0240 0000 0000 01A1
        DECLE   $0021,  $0023,  $0041,  $0032   ; 5DD8   0021 0023 0041 0032
        DECLE   $0000,  $0000,  $0013,  $02A1   ; 5DDC   0000 0000 0013 02A1
        DECLE   $0021,  $00C5,  $00A3,  $0240   ; 5DE0   0021 00C5 00A3 0240
        DECLE   $0000,  $0000,  $0275,  $0021   ; 5DE4   0000 0000 0275 0021
        DECLE   $00C5,  $0109,  $00A1,  $0000   ; 5DE8   00C5 0109 00A1 0000
        DECLE   $0000,  $0013,  $02A1,  $0021   ; 5DEC   0000 0013 02A1 0021
        DECLE   $016B,  $014B,  $00A3,  $0000   ; 5DF0   016B 014B 00A3 0000
        DECLE   $0000,  $0275,  $0021,  $0023   ; 5DF4   0000 0275 0021 0023
        DECLE   $018C,  $0188,  $00E1,  $0000   ; 5DF8   018C 0188 00E1 0000

        DECR    R3                              ; 5DFC   0013
        MVI@    R4,     R1                      ; 5DFD   02A1
        NEGR    R1                              ; 5DFE   0021
        SLR     R2,     1                       ; 5DFF   0062
        NEGR    R1                              ; 5E00   0021
        SLR     R1,     1                       ; 5E01   0061
        SLR     R1,     1                       ; 5E02   0061
        NEGR    R1                              ; 5E03   0021
        NEGR    R1                              ; 5E04   0021
        NEGR    R1                              ; 5E05   0021
        NEGR    R1                              ; 5E06   0021
        SWAP    R1,     1                       ; 5E07   0041
        GSWD    R2                              ; 5E08   0032
        B       L_5E0B                          ; 5E09   0200 0000

L_5E0B:
        NEGR    R1                              ; 5E0B   0021
        DECLE   $0029,  $0021,  $0043,  $0021   ; 5E0C   0029 0021 0043 0021
        DECLE   $0250,  $0000,  $0000,  $0029   ; 5E10   0250 0000 0000 0029
        DECLE   $0273,  $0103,  $0023,  $0032   ; 5E14   0273 0103 0023 0032
        DECLE   $0200,  $0000,  $0000,  $0029   ; 5E18   0200 0000 0000 0029
        DECLE   $0029,  $0268,  $0021,  $0250   ; 5E1C   0029 0268 0021 0250
        DECLE   $0000,  $0000,  $0015,  $0021   ; 5E20   0000 0000 0015 0021
        DECLE   $0033,  $0261,  $0032,  $0200   ; 5E24   0033 0261 0032 0200
        DECLE   $0000,  $0000,  $02A1,  $0021   ; 5E28   0000 0000 02A1 0021
        DECLE   $0133,  $0101,  $003F,  $0000   ; 5E2C   0133 0101 003F 0000
        DECLE   $0000,  $0015,  $0021,  $0029   ; 5E30   0000 0015 0021 0029
        DECLE   $0103,  $0021,  $0160,  $0000   ; 5E34   0103 0021 0160 0000
        DECLE   $0000,  $0381,  $0022,  $0033   ; 5E38   0000 0381 0022 0033
        DECLE   $0021,  $0021,  $0180,  $0000   ; 5E3C   0021 0021 0180 0000
        DECLE   $0000,  $01A1,  $0062,  $0021   ; 5E40   0000 01A1 0062 0021
        DECLE   $0041,  $0021,  $0180,  $0000   ; 5E44   0041 0021 0180 0000
        DECLE   $0000,  $01C1,  $0043,  $0022   ; 5E48   0000 01C1 0043 0022
        DECLE   $0062,  $0021,  $0140,  $0000   ; 5E4C   0062 0021 0140 0000
        DECLE   $0000,  $03C1,  $0041,  $0021   ; 5E50   0000 03C1 0041 0021
        DECLE   $0061,  $0021,  $003D,  $0000   ; 5E54   0061 0021 003D 0000
        DECLE   $0000,  $0016,  $0023,  $0022   ; 5E58   0000 0016 0023 0022
        DECLE   $0062,  $0021,  $0031,  $01E0   ; 5E5C   0062 0021 0031 01E0
        DECLE   $0000,  $0000,  $02C1,  $0021   ; 5E60   0000 0000 02C1 0021
        DECLE   $0061,  $0061,  $0021,  $022F   ; 5E64   0061 0061 0021 022F
        DECLE   $0000,  $0000,  $0016,  $0061   ; 5E68   0000 0000 0016 0061
        DECLE   $0022,  $0061,  $0021,  $0031   ; 5E6C   0022 0061 0021 0031
        DECLE   $01E0,  $0000,  $0000,  $0061   ; 5E70   01E0 0000 0000 0061
        DECLE   $0043,  $0023,  $0021,  $0021   ; 5E74   0043 0023 0021 0021
        DECLE   $022F,  $0000,  $0000,  $0021   ; 5E78   022F 0000 0000 0021
        DECLE   $0021,  $0061,  $0021,  $0021   ; 5E7C   0021 0061 0021 0021
        DECLE   $0031,  $01E0,  $0000           ; 5E80   0031 01E0 0000
L_5E83:
        PSHR    R5                              ; 5E83   0275
        MVII    #$019C, R4                      ; 5E84   02BC 019C
        MVII    #$01A4, R5                      ; 5E86   02BD 01A4
L_5E88:
        MVI@    R4,     R0                      ; 5E88   02A0
        SWAP    R0,     1                       ; 5E89   0040
        SAR     R0,     2                       ; 5E8A   006C
        SAR     R0,     2                       ; 5E8B   006C
        MOVR    R4,     R3                      ; 5E8C   00A3
        SDBD                                    ; 5E8D   0001
        ADD@    R4,     R0                      ; 5E8E   02E0
        MVO@    R0,     R3                      ; 5E8F   0258
        SWAP    R0,     1                       ; 5E90   0040
        MOVR    R0,     R2                      ; 5E91   0082
        INCR    R3                              ; 5E92   000B
        SUB@    R3,     R0                      ; 5E93   0318
        MOVR    R2,     R1                      ; 5E94   0091
        ANDI    #$0007, R1                      ; 5E95   03B9 0007
        MVO@    R1,     R3                      ; 5E97   0259
        XORR    R1,     R2                      ; 5E98   01CA
        MVO@    R2,     R5                      ; 5E99   026A
        SUBR    R0,     R2                      ; 5E9A   0102
        MVO@    R2,     R5                      ; 5E9B   026A
        INCR    R5                              ; 5E9C   000D
        MVO@    R2,     R5                      ; 5E9D   026A
        CMPI    #$01AC, R5                      ; 5E9E   037D 01AC
        BNEQ    L_5E88                          ; 5EA0   022C 0019

        MVII    #$0003, R0                      ; 5EA2   02B8 0003
        MVO@    R0,     R5                      ; 5EA4   0268
        MVII    #$0100, R5                      ; 5EA5   02BD 0100
        MVI@    R5,     R0                      ; 5EA7   02A8
        MVO@    R0,     R4                      ; 5EA8   0260
        MVI@    R5,     R0                      ; 5EA9   02A8
        MVO@    R0,     R4                      ; 5EAA   0260
        MVII    #$00D2, R0                      ; 5EAB   02B8 00D2
        MVII    #$005E, R1                      ; 5EAD   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5EAF   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5EB1   0241 0101
L_5EB3:
        EIS                                     ; 5EB3   0002
        MVI     G_01AC, R2                      ; 5EB4   0282 01AC
        SARC    R2,     2                       ; 5EB6   007E
        BNC     L_5ECC                          ; 5EB7   0209 0013
        BOV     L_5EB3                          ; 5EB9   0222 0007

        JSR     R5,     L_5935                  ; 5EBB   0004 0158 0135

        MVII    #$0003, R2                      ; 5EBE   02BA 0003
        MVO     R2,     G_01AC                  ; 5EC0   0242 01AC
        MVII    #$0006, R0                      ; 5EC2   02B8 0006
        MVII    #$005F, R1                      ; 5EC4   02B9 005F
        MVO     R0,     .ISRVEC.0               ; 5EC6   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5EC8   0241 0101
        B       L_5EB3                          ; 5ECA   0220 0018
L_5ECC:
        BNOV    L_5ED1                          ; 5ECC   020A 0003

        JSR     R5,     L_5935                  ; 5ECE   0004 0158 0135

L_5ED1:
        PULR    R7                              ; 5ED1   02B7

        PSHR    R5                              ; 5ED2   0275
        MVI     G_01A4, R4                      ; 5ED3   0284 01A4
        TSTR    R4                              ; 5ED5   00A4
        BEQ     L_5EDD                          ; 5ED6   0204 0005

        MVI     G_01A8, R4                      ; 5ED8   0284 01A8
        TSTR    R4                              ; 5EDA   00A4
        BNEQ    L_5EFB                          ; 5EDB   020C 001E

L_5EDD:
        JSR     R5,     L_5FC6                  ; 5EDD   0004 015C 03C6

        MVI     G_019E, R0                      ; 5EE0   0280 019E
        MVO     R0,     .STIC.HDLY              ; 5EE2   0240 0030
        MVI     G_01A1, R0                      ; 5EE4   0280 01A1
        MVO     R0,     .STIC.VDLY              ; 5EE6   0240 0031

        JSR     R5,     L_5F28                  ; 5EE8   0004 015C 0328

        CLRR    R2                              ; 5EEB   01D2
        SUBI    #$0008, R2                      ; 5EEC   033A 0008

        JSR     R5,     L_5F34                  ; 5EEE   0004 015C 0334
        JSR     R5,     L_5F68                  ; 5EF1   0004 015C 0368

        TSTR    R2                              ; 5EF4   0092
        BMI     L_5F10                          ; 5EF5   020B 0019

        ADDI    #$0002, R2                      ; 5EF7   02FA 0002
        B       L_5F10                          ; 5EF9   0200 0015

L_5EFB:
        NEGR    R4                              ; 5EFB   0024

        JSR     R5,     L_5F16                  ; 5EFC   0004 015C 0316
        JSR     R5,     L_5F34                  ; 5EFF   0004 015C 0334

        ADDI    #$0001, R2                      ; 5F02   02FA 0001
        B       L_5F10                          ; 5F04   0200 000A

        PSHR    R5                              ; 5F06   0275
        MOVR    R6,     R4                      ; 5F07   00B4

        JSR     R5,     L_5F16                  ; 5F08   0004 015C 0316
        JSR     R5,     L_5F68                  ; 5F0B   0004 015C 0368

        ADDI    #$0002, R2                      ; 5F0E   02FA 0002
L_5F10:
        MVO     R2,     G_01AC                  ; 5F10   0242 01AC

        JSR     R5,     X_PLAY_NOTE             ; 5F12   0004 0118 02BD

        PULR    R7                              ; 5F15   02B7

L_5F16:
        PSHR    R5                              ; 5F16   0275

        JSR     R5,     L_5FC6                  ; 5F17   0004 015C 03C6

        TSTR    R4                              ; 5F1A   00A4
        BGT     L_5F23                          ; 5F1B   020E 0006

        MVI     G_019E, R0                      ; 5F1D   0280 019E
        MVO     R0,     .STIC.HDLY              ; 5F1F   0240 0030
        B       L_5F29                          ; 5F21   0200 0006

L_5F23:
        MVI     G_01A1, R0                      ; 5F23   0280 01A1
        MVO     R0,     .STIC.VDLY              ; 5F25   0240 0031
        INCR    R7                              ; 5F27   000F

L_5F28:
        PSHR    R5                              ; 5F28   0275
L_5F29:
        MVO     R0,     .STIC.VIDEN             ; 5F29   0240 0020
        MVII    #$01A2, R4                      ; 5F2B   02BC 01A2
        MVI@    R4,     R0                      ; 5F2D   02A0
        MVI@    R4,     R1                      ; 5F2E   02A1
        MVO     R0,     .ISRVEC.0               ; 5F2F   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F31   0241 0101
        PULR    R7                              ; 5F33   02B7

L_5F34:
        PSHR    R5                              ; 5F34   0275
        MVI     G_01A4, R0                      ; 5F35   0280 01A4
        SWAP    R0,     2                       ; 5F37   0044
        BEQ     L_5F67                          ; 5F38   0204 002D
        BPL     L_5F50                          ; 5F3A   0203 0014

        MVII    #$0200, R5                      ; 5F3C   02BD 0200
        MVII    #$0201, R4                      ; 5F3E   02BC 0201
        CLRR    R2                              ; 5F40   01D2
L_5F41:
        MVII    #$0013, R3                      ; 5F41   02BB 0013
L_5F43:
        MVI@    R4,     R0                      ; 5F43   02A0
        MVO@    R0,     R5                      ; 5F44   0268
        DECR    R3                              ; 5F45   0013
        BNEQ    L_5F43                          ; 5F46   022C 0004

        MVO@    R2,     R5                      ; 5F48   026A
        INCR    R4                              ; 5F49   000C
        CMPI    #$02E6, R4                      ; 5F4A   037C 02E6
        BLT     L_5F41                          ; 5F4C   0225 000C
        B       L_5F67                          ; 5F4E   0200 0017

L_5F50:
        MVII    #$0212, R5                      ; 5F50   02BD 0212
        MVII    #$0003, R1                      ; 5F52   02B9 0003
        CLRR    R2                              ; 5F54   01D2
L_5F55:
        MVII    #$0013, R3                      ; 5F55   02BB 0013
L_5F57:
        MVI@    R5,     R0                      ; 5F57   02A8
        MVO@    R0,     R5                      ; 5F58   0268
        SUBR    R1,     R5                      ; 5F59   010D
        DECR    R3                              ; 5F5A   0013
        BNEQ    L_5F57                          ; 5F5B   022C 0005

        INCR    R5                              ; 5F5D   000D
        MVO@    R2,     R5                      ; 5F5E   026A
        ADDI    #$0025, R5                      ; 5F5F   02FD 0025
        CMPI    #$02F0, R5                      ; 5F61   037D 02F0
        BLT     L_5F55                          ; 5F63   0225 000F

        MVII    #$0004, R2                      ; 5F65   02BA 0004
L_5F67:
        PULR    R7                              ; 5F67   02B7

L_5F68:
        PSHR    R5                              ; 5F68   0275
        MVI     G_01A8, R0                      ; 5F69   0280 01A8
        SWAP    R0,     2                       ; 5F6B   0044
        BEQ     L_5FC5                          ; 5F6C   0204 0057
        BMI     L_5FB9                          ; 5F6E   020B 0049

        MVII    #$02DC, R5                      ; 5F70   02BD 02DC
        MVII    #$0214, R4                      ; 5F72   02BC 0214
        MVII    #$0200, R2                      ; 5F74   02BA 0200
        MVII    #$0014, R1                      ; 5F76   02B9 0014
        MVII    #$000A, R0                      ; 5F78   02B8 000A
L_5F7A:
        PSHR    R0                              ; 5F7A   0270
        MVII    #$0004, R3                      ; 5F7B   02BB 0004
L_5F7D:
        MVI@    R4,     R0                      ; 5F7D   02A0
        MVO@    R0,     R5                      ; 5F7E   0268
        MVI@    R4,     R0                      ; 5F7F   02A0
        MVO@    R0,     R5                      ; 5F80   0268
        MVI@    R4,     R0                      ; 5F81   02A0
        MVO@    R0,     R5                      ; 5F82   0268
        MVI@    R4,     R0                      ; 5F83   02A0
        MVO@    R0,     R5                      ; 5F84   0268
        MVI@    R4,     R0                      ; 5F85   02A0
        MVO@    R0,     R5                      ; 5F86   0268
        DECR    R3                              ; 5F87   0013
        BNEQ    L_5F7D                          ; 5F88   022C 000C

        SUBR    R1,     R4                      ; 5F8A   010C
        SUBR    R1,     R5                      ; 5F8B   010D
        XORR    R2,     R5                      ; 5F8C   01D5
        XORR    R5,     R2                      ; 5F8D   01EA
        XORR    R2,     R5                      ; 5F8E   01D5
        MVII    #$0004, R3                      ; 5F8F   02BB 0004
L_5F91:
        MVI@    R5,     R0                      ; 5F91   02A8
        MVO@    R0,     R4                      ; 5F92   0260
        MVI@    R5,     R0                      ; 5F93   02A8
        MVO@    R0,     R4                      ; 5F94   0260
        MVI@    R5,     R0                      ; 5F95   02A8
        MVO@    R0,     R4                      ; 5F96   0260
        MVI@    R5,     R0                      ; 5F97   02A8
        MVO@    R0,     R4                      ; 5F98   0260
        MVI@    R5,     R0                      ; 5F99   02A8
        MVO@    R0,     R4                      ; 5F9A   0260
        DECR    R3                              ; 5F9B   0013
        BNEQ    L_5F91                          ; 5F9C   022C 000C

        SUBR    R1,     R5                      ; 5F9E   010D
        PULR    R0                              ; 5F9F   02B0
        DECR    R0                              ; 5FA0   0010
        BNEQ    L_5F7A                          ; 5FA1   022C 0028

        XORR    R2,     R5                      ; 5FA3   01D5
        XORR    R5,     R2                      ; 5FA4   01EA
        XORR    R2,     R5                      ; 5FA5   01D5
        MVII    #$0004, R3                      ; 5FA6   02BB 0004
L_5FA8:
        MVI@    R5,     R0                      ; 5FA8   02A8
        MVO@    R0,     R4                      ; 5FA9   0260
        MVI@    R5,     R0                      ; 5FAA   02A8
        MVO@    R0,     R4                      ; 5FAB   0260
        MVI@    R5,     R0                      ; 5FAC   02A8
        MVO@    R0,     R4                      ; 5FAD   0260
        MVI@    R5,     R0                      ; 5FAE   02A8
        MVO@    R0,     R4                      ; 5FAF   0260
        MVI@    R5,     R0                      ; 5FB0   02A8
        MVO@    R0,     R4                      ; 5FB1   0260
        DECR    R3                              ; 5FB2   0013
        BNEQ    L_5FA8                          ; 5FB3   022C 000C

        MVII    #$000C, R2                      ; 5FB5   02BA 000C
        B       L_5FC5                          ; 5FB7   0200 000C

L_5FB9:
        MVII    #$0200, R5                      ; 5FB9   02BD 0200
        MVII    #$0214, R4                      ; 5FBB   02BC 0214
L_5FBD:
        MVI@    R4,     R0                      ; 5FBD   02A0
        MVO@    R0,     R5                      ; 5FBE   0268
        CMPI    #$02DC, R5                      ; 5FBF   037D 02DC
        BNEQ    L_5FBD                          ; 5FC1   022C 0005

        MVII    #$0008, R2                      ; 5FC3   02BA 0008
L_5FC5:
        PULR    R7                              ; 5FC5   02B7

L_5FC6:
        PSHR    R5                              ; 5FC6   0275
        MVII    #$031F, R2                      ; 5FC7   02BA 031F
        CLRR    R3                              ; 5FC9   01DB
L_5FCA:
        MVII    #$01A5, R5                      ; 5FCA   02BD 01A5
        TSTR    R4                              ; 5FCC   00A4
        BLE     L_5FD3                          ; 5FCD   0206 0004

        ADDI    #$0003, R5                      ; 5FCF   02FD 0003
        B       L_5FE1                          ; 5FD1   0200 000E

L_5FD3:
        MVI@    R3,     R0                      ; 5FD3   0298
        MOVR    R0,     R1                      ; 5FD4   0081
        ANDI    #$00FF, R1                      ; 5FD5   03B9 00FF
        XORR    R1,     R0                      ; 5FD7   01C8
        ADD@    R5,     R1                      ; 5FD8   02E9
        ANDI    #$00FF, R1                      ; 5FD9   03B9 00FF
        XORR    R1,     R0                      ; 5FDB   01C8
        MVO@    R0,     R3                      ; 5FDC   0258
        MVI@    R2,     R0                      ; 5FDD   0290
        SDBD                                    ; 5FDE   0001
        ADD@    R5,     R0                      ; 5FDF   02E8
        MVO@    R0,     R2                      ; 5FE0   0250
L_5FE1:
        INCR    R2                              ; 5FE1   000A
        INCR    R5                              ; 5FE2   000D
        TSTR    R4                              ; 5FE3   00A4
        BMI     L_5FF8                          ; 5FE4   020B 0012

        XORI    #$0008, R3                      ; 5FE6   03FB 0008
        MVI@    R3,     R0                      ; 5FE8   0298
        MOVR    R0,     R1                      ; 5FE9   0081
        ANDI    #$007F, R1                      ; 5FEA   03B9 007F
        XORR    R1,     R0                      ; 5FEC   01C8
        ADD@    R5,     R1                      ; 5FED   02E9
        ANDI    #$007F, R1                      ; 5FEE   03B9 007F
        XORR    R1,     R0                      ; 5FF0   01C8
        MVO@    R0,     R3                      ; 5FF1   0258
        XORI    #$0008, R3                      ; 5FF2   03FB 0008
        MVI@    R2,     R0                      ; 5FF4   0290
        SDBD                                    ; 5FF5   0001
        ADD@    R5,     R0                      ; 5FF6   02E8
        MVO@    R0,     R2                      ; 5FF7   0250
L_5FF8:
        ADDI    #$0007, R2                      ; 5FF8   02FA 0007
        INCR    R3                              ; 5FFA   000B
        CMPI    #$0008, R3                      ; 5FFB   037B 0008
        BNEQ    L_5FCA                          ; 5FFD   022C 0034
        PULR    R7                              ; 5FFF   02B7

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5037       <entry>
;;  $5092       $5084  
;;  $50BB       $507E  
;;  $50E3       $50C4  
;;  $50FF       $5088   $50C8   $50E7  
;;  $5108       $54E7   $54EC  
;;  $5111       $5106  
;;  $5118       $50FD  
;;  $511E       <entry>
;;  $5134       $5130  
;;  $5142       $513F  
;;  $514E       $514B  
;;  $5167       $5151   $5161  
;;  $5193       $518C  
;;  $51B1       $51AD  
;;  $51B3       $516A   $517D  
;;  $51B6       $507A   $50C0   $50F4   $5113  
;;  $51B7       <entry>
;;  $51C7       $51C1  
;;  $51C9       $51BA  
;;  $51CA       $5165   $53B9   $547D  
;;  $51E8       $51DF  
;;  $51F2       $511C  
;;  $51FC       $520C  
;;  $51FF       $5210  
;;  $5239       $51CA  
;;  $524E       $5241   $5245  
;;  $527D       $529E  
;;  $527F       $5267  
;;  $52BD       $5212   $5217  
;;  $52D9       $52DC  
;;  $52DF       $521A  
;;  $530F       $5318  
;;  $53AD       $53C6  
;;  $53B6       $53B3  
;;  $53BB       $53A3   $53A8  
;;  $540C       $5401  
;;  $5415       $5410  
;;  $5420       $541B  
;;  $5428       $5422  
;;  $5432       $542A  
;;  $543C       $5434  
;;  $5442       $544C  
;;  $544E       $5440  
;;  $5450       $5445  
;;  $545A       $5456  
;;  $546E       $5394   $53CE   $53D1   $546B   $5489  
;;  $546F       $5461  
;;  $547F       $5465  
;;  $54AB       $54A8  
;;  $54AF       $54AC  
;;  $54B5       $54B0  
;;  $54BC       $54B9  
;;  $54C9       $54C6  
;;  $54F2       $5491   $5494   $5499  
;;  $54F3       $54D2   $54D8  
;;  $5529       $5527  
;;  $55C9       $55C9  
;;  $568E       $5688  
;;  $569C       $5698  
;;  $569F       $56AE  
;;  $56A5       $56A2  
;;  $56B0       $56A9  
;;  $56B5       $56B2  
;;  $56BB       $56B7  
;;  $56C4       $56C1  
;;  $56D4       $5172  
;;  $56EA       $56E6  
;;  $56EB       $56E4  
;;  $56FC       $56F9  
;;  $5700       $56FD  
;;  $5707       $56F1  
;;  $5714       $5710  
;;  $5718       $5715  
;;  $5725       $571E   $5721  
;;  $5731       $5726   $572D  
;;  $5753       $5743   $574C   $5750  
;;  $5767       $5758   $5760   $5764  
;;  $5778       $5772  
;;  $5782       $5776  
;;  $5787       $56D9  
;;  $5788       $573A  
;;  $57B0       $57AC  
;;  $57B4       $57B1  
;;  $57B9       $577D   $5792  
;;  $57C0       $57BD  
;;  $57C1       $57BA  
;;  $57C6       $57C3  
;;  $57C8       $5177   $521E   $5223  
;;  $57F5       $57DB   $57E4   $57ED  
;;  $5806       $57D2   $5800  
;;  $5811       $5826  
;;  $5824       $581E  
;;  $5835       $5830  
;;  $5836       $548B  
;;  $5841       $5226  
;;  $5842       $5840   $5888  
;;  $5863       <entry>
;;  $5873       $5471   $54EF  
;;  $588A       $5185   $5190  
;;  $58AB       $52C3   $56DB   $57CA  
;;  $58B8       $51D1   $51D4   $5303   $54C9   $54CD  
;;  $58BB       $58C2  
;;  $58C6       $51A1   $51A6  
;;  $58CE       $58D2  
;;  $58D7       $589B  
;;  $58E2       $58D9  
;;  $58E3       $58E1  
;;  $58E5       $588F  
;;  $58EB       $58DD  
;;  $58F1       $58E3   $58E7   $58EC  
;;  $58FA       $58F5  
;;  $5912       $5740   $5755  
;;  $5918       $5914  
;;  $591E       $578B   $5799   $5892   $589E   $591A  
;;  $592A       $592D  
;;  $592B       $592F  
;;  $592C       $5924   $5928  
;;  $5935       $5EBB   $5ECE  
;;  $595D       $5310  
;;  $595E       $595C  
;;  $5962       $5950  
;;  $5966       $5A1A  
;;  $597E       $5976  
;;  $5987       $597F  
;;  $5990       $5988  
;;  $5998       $5991  
;;  $59A3       $599E  
;;  $59AB       $59A7  
;;  $59B4       $599A  
;;  $59CF       $59C0  
;;  $59D1       $59B8   $59BB   $59E9   $59F0   $59F3  
;;  $59D4       $5985  
;;  $59D7       $597C  
;;  $59DE       $598E  
;;  $59E1       $5996  
;;  $59E4       $59DC  
;;  $59FD       $59B2   $59D2  
;;  $5A12       $5A0A  
;;  $5A16       $5964  
;;  $5A19       $5A14  
;;  $5A1D       $5A16  
;;  $5A4F       $5A3B  
;;  $5A7F       $5A3E   $5A54   $5A5D   $5A6A   $5A74  
;;  $5A8C       $5A88  
;;  $5A9C       $5A97  
;;  $5AFE       $5AFC  
;;  $5D4A       $5D48  
;;  $5D5B       $5D59  
;;  $5DCF       $5DCF  
;;  $5E0B       $5E09  
;;  $5E83       $51B3  
;;  $5E88       $5EA0  
;;  $5EB3       $5EB9   $5ECA  
;;  $5ECC       $5EB7  
;;  $5ED1       $5ECC  
;;  $5EDD       $5ED6  
;;  $5EFB       $5EDB  
;;  $5F10       $5EF5   $5EF9   $5F04  
;;  $5F16       $5EFC   $5F08  
;;  $5F23       $5F1B  
;;  $5F28       $5EE8  
;;  $5F29       $5F21   $5F27  
;;  $5F34       $5EEE   $5EFF  
;;  $5F41       $5F4C  
;;  $5F43       $5F46  
;;  $5F50       $5F3A  
;;  $5F55       $5F63  
;;  $5F57       $5F5B  
;;  $5F67       $5F38   $5F4E  
;;  $5F68       $5EF1   $5F0B  
;;  $5F7A       $5FA1  
;;  $5F7D       $5F88  
;;  $5F91       $5F9C  
;;  $5FA8       $5FB3  
;;  $5FB9       $5F6E  
;;  $5FBD       $5FC1  
;;  $5FC5       $5F6C   $5FB7  
;;  $5FC6       $5EDD   $5F17  
;;  $5FCA       $5FFD  
;;  $5FD3       $5FCD  
;;  $5FE1       $5FD1  
;;  $5FF8       $5FE4  
;; ======================================================================== ;;
